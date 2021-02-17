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
	nop
	nop

	flw	%f30, 0(%hp)
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
	addi	%v0, %zero, 0
	addi	%v1, %zero, 0
	nop
	nop

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

	addi	%v1, %zero, 0
	nop
	or	%v0, %v0, %v1
	nop

	nop
	nop
	nop
	in	%v1

	nop
	nop
	sll	%v1, %v1, 16
	nop

	addi	%v1, %zero, 0
	nop
	or	%v0, %v0, %v1
	nop

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
	addi	%v0, %zero, 0
	addi	%v1, %zero, 0
	nop
	nop

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

	addi	%v1, %zero, 0
	nop
	or	%v0, %v0, %v1
	nop

	nop
	nop
	nop
	in	%v1

	nop
	nop
	sll	%v1, %v1, 16
	nop

	addi	%v1, %zero, 0
	nop
	or	%v0, %v0, %v1
	nop

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
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0
	nop
	nop

create_array_loop:
	nop
	nop
	nop
	beqi	%a0, 0, create_array_exit

	sw	%v1, 0(%hp)
	nop
	nop
	nop

	addi	%hp, %hp, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, create_array_exit

	sw	%v1, 0(%hp)
	nop
	nop
	nop

	addi	%hp, %hp, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, create_array_exit

	sw	%v1, 0(%hp)
	nop
	nop
	nop

	addi	%hp, %hp, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, create_array_exit

	sw	%v1, 0(%hp)
	addi	%a0, %a0, -4
	nop
	nop

	addi	%hp, %hp, 1
	nop
	nop
	j	create_array_loop

create_array_exit:
	nop
	nop
	nop
	jr	%ra

min_caml_create_float_array:
	addi	%v1, %v0, 0
	addi	%v0, %hp, 0
	nop
	nop

create_float_array_loop:
	nop
	nop
	nop
	beqi	%v1, 0, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	nop
	nop

	addi	%hp, %hp, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	nop
	nop

	addi	%hp, %hp, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	nop
	nop

	addi	%hp, %hp, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 3, create_float_array_exit

	fsw	%f0, 0(%hp)
	addi	%v1, %v1, -4
	nop
	nop

	addi	%hp, %hp, 1
	nop
	nop
	j	create_float_array_loop

create_float_array_exit:
	nop
	nop
	nop
	jr	%ra

min_caml_create_extarray:
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0
	nop
	nop

create_extarray_loop:
	nop
	nop
	nop
	beqi	%a1, 0, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	nop
	nop

	addi	%a0, %a0, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	nop
	nop

	addi	%a0, %a0, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 2, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	nop
	nop

	addi	%a0, %a0, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, create_extarray_exit

	sw	%v1, 0(%a0)
	addi	%a1, %a1, -4
	nop
	nop

	addi	%a0, %a0, 1
	nop
	nop
	j	create_extarray_loop

create_extarray_exit:
	nop
	nop
	nop
	jr	%ra

min_caml_create_float_extarray:
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	nop
	nop

create_float_extarray_loop:
	nop
	nop
	nop
	beqi	%a0, 0, create_float_extarray_exit

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	addi	%v1, %v1, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, create_float_extarray_exit

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	addi	%v1, %v1, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, create_float_extarray_exit

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	addi	%v1, %v1, 1
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, create_float_extarray_exit

	fsw	%f0, 0(%v1)
	addi	%a0, %a0, -4
	nop
	nop

	addi	%v1, %v1, 1
	nop
	nop
	j	create_float_extarray_loop

create_float_extarray_exit:
	nop
	nop
	nop
	jr	%ra

print_int_sub1.2629:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.31519

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.31520

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.31521

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.31522

	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.31523

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.31524

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.31525

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.31526

	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.31527

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.31528

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.31529

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.31530

	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.31531

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.31532

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.31533

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.31534

	addi	%a0, %a0, -40
	addi	%v1, %v0, 4
	nop
	nop

	addi	%v0, %a0, 0
	nop
	nop
	j	print_int_sub1.2629

bgti_else.31534:
	addi	%v0, %v0, 3
	nop
	nop
	jr	%ra

bgti_else.31533:
	addi	%v0, %v0, 2
	nop
	nop
	jr	%ra

bgti_else.31532:
	addi	%v0, %v0, 1
	nop
	nop
	jr	%ra

bgti_else.31531:
	nop
	nop
	nop
	jr	%ra

bgti_else.31530:
	addi	%v0, %v0, 3
	nop
	nop
	jr	%ra

bgti_else.31529:
	addi	%v0, %v0, 2
	nop
	nop
	jr	%ra

bgti_else.31528:
	addi	%v0, %v0, 1
	nop
	nop
	jr	%ra

bgti_else.31527:
	nop
	nop
	nop
	jr	%ra

bgti_else.31526:
	addi	%v0, %v0, 3
	nop
	nop
	jr	%ra

bgti_else.31525:
	addi	%v0, %v0, 2
	nop
	nop
	jr	%ra

bgti_else.31524:
	addi	%v0, %v0, 1
	nop
	nop
	jr	%ra

bgti_else.31523:
	nop
	nop
	nop
	jr	%ra

bgti_else.31522:
	addi	%v0, %v0, 3
	nop
	nop
	jr	%ra

bgti_else.31521:
	addi	%v0, %v0, 2
	nop
	nop
	jr	%ra

bgti_else.31520:
	addi	%v0, %v0, 1
	nop
	nop
	jr	%ra

bgti_else.31519:
	nop
	nop
	nop
	jr	%ra

print_int_sub2.2632:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31651

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31652

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31653

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31654

	addi	%v0, %v0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31655

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31656

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31657

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31658

	addi	%v0, %v0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31659

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31660

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31661

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31662

	addi	%v0, %v0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31663

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31664

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31665

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31666

	addi	%v0, %v0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31667

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31668

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31669

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31670

	addi	%v0, %v0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31671

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31672

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31673

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31674

	addi	%v0, %v0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31675

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31676

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31677

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31678

	addi	%v0, %v0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31679

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.31680

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.31681

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.31682

	addi	%v0, %v0, -40
	nop
	nop
	j	print_int_sub2.2632

bgti_else.31682:
	addi	%v0, %v0, -30
	nop
	nop
	jr	%ra

bgti_else.31681:
	addi	%v0, %v0, -20
	nop
	nop
	jr	%ra

bgti_else.31680:
	addi	%v0, %v0, -10
	nop
	nop
	jr	%ra

bgti_else.31679:
	nop
	nop
	nop
	jr	%ra

bgti_else.31678:
	addi	%v0, %v0, -30
	nop
	nop
	jr	%ra

bgti_else.31677:
	addi	%v0, %v0, -20
	nop
	nop
	jr	%ra

bgti_else.31676:
	addi	%v0, %v0, -10
	nop
	nop
	jr	%ra

bgti_else.31675:
	nop
	nop
	nop
	jr	%ra

bgti_else.31674:
	addi	%v0, %v0, -30
	nop
	nop
	jr	%ra

bgti_else.31673:
	addi	%v0, %v0, -20
	nop
	nop
	jr	%ra

bgti_else.31672:
	addi	%v0, %v0, -10
	nop
	nop
	jr	%ra

bgti_else.31671:
	nop
	nop
	nop
	jr	%ra

bgti_else.31670:
	addi	%v0, %v0, -30
	nop
	nop
	jr	%ra

bgti_else.31669:
	addi	%v0, %v0, -20
	nop
	nop
	jr	%ra

bgti_else.31668:
	addi	%v0, %v0, -10
	nop
	nop
	jr	%ra

bgti_else.31667:
	nop
	nop
	nop
	jr	%ra

bgti_else.31666:
	addi	%v0, %v0, -30
	nop
	nop
	jr	%ra

bgti_else.31665:
	addi	%v0, %v0, -20
	nop
	nop
	jr	%ra

bgti_else.31664:
	addi	%v0, %v0, -10
	nop
	nop
	jr	%ra

bgti_else.31663:
	nop
	nop
	nop
	jr	%ra

bgti_else.31662:
	addi	%v0, %v0, -30
	nop
	nop
	jr	%ra

bgti_else.31661:
	addi	%v0, %v0, -20
	nop
	nop
	jr	%ra

bgti_else.31660:
	addi	%v0, %v0, -10
	nop
	nop
	jr	%ra

bgti_else.31659:
	nop
	nop
	nop
	jr	%ra

bgti_else.31658:
	addi	%v0, %v0, -30
	nop
	nop
	jr	%ra

bgti_else.31657:
	addi	%v0, %v0, -20
	nop
	nop
	jr	%ra

bgti_else.31656:
	addi	%v0, %v0, -10
	nop
	nop
	jr	%ra

bgti_else.31655:
	nop
	nop
	nop
	jr	%ra

bgti_else.31654:
	addi	%v0, %v0, -30
	nop
	nop
	jr	%ra

bgti_else.31653:
	addi	%v0, %v0, -20
	nop
	nop
	jr	%ra

bgti_else.31652:
	addi	%v0, %v0, -10
	nop
	nop
	jr	%ra

bgti_else.31651:
	nop
	nop
	nop
	jr	%ra

rotate_quadratic_matrix.2767:
	flw	%f16, 0(%v1)
	flw	%f18, 482(%zero)
	nop
	nop

	flw	%f19, 481(%zero)
	nop
	fabs	%f1, %f16
	nop

	nop
	nop
	fdiv	%f0, %f1, %f19
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.31830

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.31831

fbgt_else.31830:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.31831:
	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.31832

	nop
	nop
	fsub	%f0, %f0, %f18
	j	fbgt_cont.31833

fbgt_else.31832:
fbgt_cont.31833:
	flw	%f2, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31834

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31836

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.31835

bnei_else.31836:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.31837:
	nop
	nop
	nop
	j	fbgt_cont.31835

fbgt_else.31834:
fbgt_cont.31835:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31838

	nop
	nop
	fsub	%f0, %f18, %f0
	j	fbgt_cont.31839

fbgt_else.31838:
fbgt_cont.31839:
	flw	%f17, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_else.31840

	flw	%f0, 474(%zero)
	nop
	fmul	%f21, %f0, %f0
	nop

	nop
	nop
	fmul	%f20, %f21, %f21
	fmul	%f0, %f0, %f21

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
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
	fsub	%f0, %f1, %f0
	j	fbgt_cont.31841

fbgt_else.31840:
	flw	%f0, 478(%zero)
	nop
	fsub	%f22, %f2, %f0
	nop

	nop
	nop
	fmul	%f20, %f22, %f22
	fmul	%f0, %f0, %f22

	nop
	nop
	fmul	%f21, %f20, %f20
	fmul	%f0, %f0, %f20

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f22, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.31841:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31842

	nop
	nop
	nop
	j	bnei_cont.31843

bnei_else.31842:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.31843:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.31844

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.31845

fbgt_else.31844:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.31845:
	nop
	nop
	fabs	%f16, %f16
	nop

	nop
	nop
	fdiv	%f1, %f16, %f19
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f18, fbgt_else.31846

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31848

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.31847

bnei_else.31848:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.31849:
	nop
	nop
	nop
	j	fbgt_cont.31847

fbgt_else.31846:
fbgt_cont.31847:
	nop
	nop
	nop
	fblt	%f1, %f18, fbgt_else.31850

	nop
	nop
	fsub	%f1, %f1, %f18
	j	fbgt_cont.31851

fbgt_else.31850:
fbgt_cont.31851:
	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.31852

	nop
	nop
	fsub	%f1, %f18, %f1
	j	fbgt_cont.31853

fbgt_else.31852:
fbgt_cont.31853:
	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.31854

	flw	%f16, 478(%zero)
	nop
	fmul	%f22, %f1, %f1
	nop

	nop
	nop
	fmul	%f21, %f22, %f22
	fmul	%f16, %f16, %f1

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	flw	%f16, 477(%zero)
	nop
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	flw	%f16, 476(%zero)
	nop
	fadd	%f20, %f20, %f16
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f22
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	j	fbgt_cont.31855

fbgt_else.31854:
	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f1, 474(%zero)
	nop
	fmul	%f21, %f1, %f1
	nop

	nop
	nop
	fmul	%f20, %f21, %f21
	fmul	%f1, %f1, %f21

	flw	%f1, 473(%zero)
	nop
	fsub	%f16, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fsub	%f1, %f16, %f1
	nop

fbgt_cont.31855:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31856

	nop
	nop
	nop
	j	bnei_cont.31857

bnei_else.31856:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.31857:
	flw	%f21, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fabs	%f20, %f21
	nop

	nop
	nop
	fdiv	%f16, %f20, %f19
	nop

	nop
	nop
	floor	%f16, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f19
	nop

	nop
	nop
	fsub	%f16, %f20, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %f18, fbgt_else.31858

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.31859

fbgt_else.31858:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.31859:
	nop
	nop
	nop
	fblt	%f16, %f18, fbgt_else.31860

	nop
	nop
	fsub	%f16, %f16, %f18
	j	fbgt_cont.31861

fbgt_else.31860:
fbgt_cont.31861:
	nop
	nop
	nop
	fblt	%f16, %f2, fbgt_else.31862

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31864

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.31863

bnei_else.31864:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.31865:
	nop
	nop
	nop
	j	fbgt_cont.31863

fbgt_else.31862:
fbgt_cont.31863:
	nop
	nop
	nop
	fblt	%f16, %f2, fbgt_else.31866

	nop
	nop
	fsub	%f16, %f18, %f16
	j	fbgt_cont.31867

fbgt_else.31866:
fbgt_cont.31867:
	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.31868

	flw	%f16, 474(%zero)
	nop
	fmul	%f23, %f16, %f16
	nop

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f16, %f16, %f23

	flw	%f16, 473(%zero)
	nop
	fsub	%f20, %f30, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	flw	%f16, 472(%zero)
	nop
	fadd	%f20, %f20, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f23
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	nop
	nop
	fsub	%f16, %f20, %f16
	j	fbgt_cont.31869

fbgt_else.31868:
	flw	%f16, 478(%zero)
	nop
	fsub	%f24, %f2, %f16
	nop

	nop
	nop
	fmul	%f23, %f24, %f24
	fmul	%f16, %f16, %f24

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f16, %f16, %f23

	flw	%f16, 477(%zero)
	nop
	fsub	%f20, %f24, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f24
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	flw	%f16, 476(%zero)
	nop
	fadd	%f20, %f20, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f24
	nop

	nop
	nop
	fmul	%f16, %f16, %f23
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	nop
	nop
	fsub	%f16, %f20, %f16
	nop

fbgt_cont.31869:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31870

	nop
	nop
	nop
	j	bnei_cont.31871

bnei_else.31870:
	nop
	nop
	fneg	%f16, %f16
	nop

bnei_cont.31871:
	nop
	nop
	nop
	fblt	%f21, %fzero, fbgt_else.31872

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.31873

fbgt_else.31872:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.31873:
	nop
	nop
	fabs	%f21, %f21
	nop

	nop
	nop
	fdiv	%f20, %f21, %f19
	nop

	nop
	nop
	floor	%f20, %f20
	nop

	nop
	nop
	fmul	%f20, %f20, %f19
	nop

	nop
	nop
	fsub	%f20, %f21, %f20
	nop

	nop
	nop
	nop
	fblt	%f20, %f18, fbgt_else.31874

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31876

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.31875

bnei_else.31876:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.31877:
	nop
	nop
	nop
	j	fbgt_cont.31875

fbgt_else.31874:
fbgt_cont.31875:
	nop
	nop
	nop
	fblt	%f20, %f18, fbgt_else.31878

	nop
	nop
	fsub	%f20, %f20, %f18
	j	fbgt_cont.31879

fbgt_else.31878:
fbgt_cont.31879:
	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_else.31880

	nop
	nop
	fsub	%f20, %f18, %f20
	j	fbgt_cont.31881

fbgt_else.31880:
fbgt_cont.31881:
	nop
	nop
	nop
	fblt	%f17, %f20, fbgt_else.31882

	flw	%f21, 478(%zero)
	nop
	fmul	%f24, %f20, %f20
	nop

	nop
	nop
	fmul	%f23, %f24, %f24
	fmul	%f21, %f21, %f20

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	flw	%f21, 477(%zero)
	nop
	fsub	%f22, %f20, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f20
	nop

	nop
	nop
	fmul	%f21, %f21, %f23
	nop

	flw	%f21, 476(%zero)
	nop
	fadd	%f22, %f22, %f21
	nop

	nop
	nop
	fmul	%f20, %f21, %f20
	nop

	nop
	nop
	fmul	%f20, %f20, %f24
	nop

	nop
	nop
	fmul	%f20, %f20, %f23
	nop

	nop
	nop
	fsub	%f20, %f22, %f20
	j	fbgt_cont.31883

fbgt_else.31882:
	nop
	nop
	fsub	%f20, %f2, %f20
	nop

	flw	%f20, 474(%zero)
	nop
	fmul	%f23, %f20, %f20
	nop

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f20, %f20, %f23

	flw	%f20, 473(%zero)
	nop
	fsub	%f21, %f30, %f20
	nop

	nop
	nop
	fmul	%f20, %f20, %f22
	nop

	flw	%f20, 472(%zero)
	nop
	fadd	%f21, %f21, %f20
	nop

	nop
	nop
	fmul	%f20, %f20, %f23
	nop

	nop
	nop
	fmul	%f20, %f20, %f22
	nop

	nop
	nop
	fsub	%f20, %f21, %f20
	nop

fbgt_cont.31883:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31884

	nop
	nop
	nop
	j	bnei_cont.31885

bnei_else.31884:
	nop
	nop
	fneg	%f20, %f20
	nop

bnei_cont.31885:
	flw	%f22, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fabs	%f23, %f22
	nop

	nop
	nop
	fdiv	%f21, %f23, %f19
	nop

	nop
	nop
	floor	%f21, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f19
	nop

	nop
	nop
	fsub	%f21, %f23, %f21
	nop

	nop
	nop
	nop
	fblt	%f21, %f18, fbgt_else.31886

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.31887

fbgt_else.31886:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.31887:
	nop
	nop
	nop
	fblt	%f21, %f18, fbgt_else.31888

	nop
	nop
	fsub	%f21, %f21, %f18
	j	fbgt_cont.31889

fbgt_else.31888:
fbgt_cont.31889:
	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_else.31890

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31892

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.31891

bnei_else.31892:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.31893:
	nop
	nop
	nop
	j	fbgt_cont.31891

fbgt_else.31890:
fbgt_cont.31891:
	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_else.31894

	nop
	nop
	fsub	%f21, %f18, %f21
	j	fbgt_cont.31895

fbgt_else.31894:
fbgt_cont.31895:
	nop
	nop
	nop
	fblt	%f17, %f21, fbgt_else.31896

	flw	%f21, 474(%zero)
	nop
	fmul	%f25, %f21, %f21
	nop

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f21, %f21, %f25

	flw	%f21, 473(%zero)
	nop
	fsub	%f23, %f30, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	flw	%f21, 472(%zero)
	nop
	fadd	%f23, %f23, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f25
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	nop
	nop
	fsub	%f21, %f23, %f21
	j	fbgt_cont.31897

fbgt_else.31896:
	flw	%f21, 478(%zero)
	nop
	fsub	%f26, %f2, %f21
	nop

	nop
	nop
	fmul	%f25, %f26, %f26
	fmul	%f21, %f21, %f26

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f21, %f21, %f25

	flw	%f21, 477(%zero)
	nop
	fsub	%f23, %f26, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f26
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	flw	%f21, 476(%zero)
	nop
	fadd	%f23, %f23, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f26
	nop

	nop
	nop
	fmul	%f21, %f21, %f25
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	nop
	nop
	fsub	%f21, %f23, %f21
	nop

fbgt_cont.31897:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31898

	nop
	nop
	nop
	j	bnei_cont.31899

bnei_else.31898:
	nop
	nop
	fneg	%f21, %f21
	nop

bnei_cont.31899:
	nop
	nop
	nop
	fblt	%f22, %fzero, fbgt_else.31900

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.31901

fbgt_else.31900:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.31901:
	nop
	nop
	fabs	%f23, %f22
	nop

	nop
	nop
	fdiv	%f22, %f23, %f19
	nop

	nop
	nop
	floor	%f22, %f22
	nop

	nop
	nop
	fmul	%f19, %f22, %f19
	nop

	nop
	nop
	fsub	%f19, %f23, %f19
	nop

	nop
	nop
	nop
	fblt	%f19, %f18, fbgt_else.31902

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31904

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.31903

bnei_else.31904:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.31905:
	nop
	nop
	nop
	j	fbgt_cont.31903

fbgt_else.31902:
fbgt_cont.31903:
	nop
	nop
	nop
	fblt	%f19, %f18, fbgt_else.31906

	nop
	nop
	fsub	%f19, %f19, %f18
	j	fbgt_cont.31907

fbgt_else.31906:
fbgt_cont.31907:
	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_else.31908

	nop
	nop
	fsub	%f19, %f18, %f19
	j	fbgt_cont.31909

fbgt_else.31908:
fbgt_cont.31909:
	nop
	nop
	nop
	fblt	%f17, %f19, fbgt_else.31910

	flw	%f17, 478(%zero)
	nop
	fmul	%f22, %f19, %f19
	nop

	nop
	nop
	fmul	%f2, %f22, %f22
	fmul	%f17, %f17, %f19

	nop
	nop
	fmul	%f17, %f17, %f22
	nop

	flw	%f17, 477(%zero)
	nop
	fsub	%f18, %f19, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f19
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
	fmul	%f17, %f17, %f19
	nop

	nop
	nop
	fmul	%f17, %f17, %f22
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.31911

fbgt_else.31910:
	nop
	nop
	fsub	%f17, %f2, %f19
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

fbgt_cont.31911:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31912

	nop
	nop
	nop
	j	bnei_cont.31913

bnei_else.31912:
	nop
	nop
	fneg	%f17, %f17
	nop

bnei_cont.31913:
	flw	%f27, 0(%v0)
	nop
	fmul	%f22, %f16, %f21
	fmul	%f26, %f1, %f20

	nop
	nop
	fmul	%f19, %f26, %f21
	fmul	%f18, %f0, %f17

	nop
	nop
	fsub	%f2, %f19, %f18
	fmul	%f25, %f0, %f20

	nop
	nop
	fmul	%f19, %f25, %f21
	fmul	%f18, %f1, %f17

	nop
	nop
	fadd	%f23, %f19, %f18
	fmul	%f24, %f16, %f17

	nop
	nop
	fmul	%f19, %f26, %f17
	fmul	%f18, %f0, %f21

	nop
	nop
	fadd	%f19, %f19, %f18
	fmul	%f18, %f25, %f17

	flw	%f20, 470(%zero)
	nop
	fmul	%f17, %f1, %f21
	fneg	%f25, %f20

	flw	%f17, 1(%v0)
	nop
	fsub	%f26, %f18, %f17
	fmul	%f18, %f1, %f16

	flw	%f16, 2(%v0)
	nop
	fmul	%f21, %f0, %f16
	fmul	%f0, %f22, %f22

	nop
	nop
	fmul	%f1, %f27, %f0
	fmul	%f0, %f24, %f24

	nop
	nop
	fmul	%f0, %f17, %f0
	fmul	%f22, %f27, %f22

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f25, %f25

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 0(%v0)
	nop
	fmul	%f0, %f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f27, %f0
	fmul	%f0, %f19, %f19

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fmul	%f0, %f23, %f23
	nop

	nop
	nop
	fmul	%f1, %f27, %f0
	fmul	%f0, %f26, %f26

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f21, %f21

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fmul	%f0, %f27, %f2
	nop

	nop
	nop
	fmul	%f1, %f0, %f23
	fmul	%f0, %f17, %f19

	nop
	nop
	fmul	%f0, %f0, %f26
	fmul	%f17, %f17, %f24

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18

	nop
	nop
	fmul	%f0, %f0, %f21
	fmul	%f16, %f16, %f25

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f22, %f23

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	fsw	%f0, 0(%v1)
	nop
	fmul	%f0, %f17, %f26
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f21

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f22, %f2

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	fsw	%f0, 1(%v1)
	nop
	fmul	%f0, %f17, %f19
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	jr	%ra

read_nth_object.2770:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	nop
	jal	min_caml_read_int

	addi	%a2, %v0, 0
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32148

	nop
	nop
	nop
	jal	min_caml_read_int

	addi	%a3, %v0, 0
	nop
	nop
	jal	min_caml_read_int

	addi	%fp, %v0, 0
	nop
	nop
	jal	min_caml_read_int

	addi	%k0, %v0, 0
	addi	%s0, %zero, 3
	fmov	%f0, %fzero
	nop

	addi	%v0, %s0, 0
	nop
	nop
	jal	min_caml_create_float_array

	addi	%s1, %v0, 0
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 0(%s1)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s1)
	addi	%s4, %zero, 2
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s1)
	addi	%v0, %s0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%s2, %v0, 0
	nop
	nop
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
	fblt	%f0, %fzero, fbgt_else.32149

	add	%s3, %zero, %zero
	nop
	nop
	j	fbgt_cont.32150

fbgt_else.32149:
	add	%s3, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32150:
	addi	%v0, %s4, 0
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%s4, %v0, 0
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 0(%s4)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s4)
	addi	%v0, %s0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%s5, %v0, 0
	nop
	nop
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
	addi	%v0, %s0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%s0, %v0, 0
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.32151

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
	j	bnei_cont.32152

bnei_else.32151:
bnei_cont.32152:
	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32153

	add	%s6, %zero, %s3
	nop
	nop
	j	bnei_cont.32154

bnei_else.32153:
	add	%s6, %zero, %k1
	nop
	nop
	nop

bnei_cont.32154:
	addi	%v0, %zero, 4
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	add	%ra, %zero, %hp
	addi	%hp, %hp, 11
	nop
	nop

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
	beqi	%a3, 3, bnei_else.32155

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32157

	nop
	nop
	nop
	j	bnei_cont.32156

bnei_else.32157:
	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.32159

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.32160

bnei_else.32159:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.32160:
	flw	%f18, 0(%s1)
	flw	%f17, 1(%s1)
	nop
	nop

	flw	%f16, 2(%s1)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.32161

	add	%a2, %zero, %k1
	nop
	nop
	j	fbeq_cont.32162

fbeq_else.32161:
	add	%a2, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32162:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32163

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32164

bnei_else.32163:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32165

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.32166

bnei_else.32165:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.32166:
bnei_cont.32164:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 0(%s1)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 1(%s1)
	nop
	nop
	nop

	fsw	%f0, 2(%s1)
	nop
	nop
	nop

bnei_cont.32158:
	nop
	nop
	nop
	j	bnei_cont.32156

bnei_else.32155:
	flw	%f1, 0(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32167

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32168

fbeq_else.32167:
	add	%a0, %zero, %zero
	nop
	nop
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
	fbne	%f1, %fzero, fbeq_else.32171

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32172

fbeq_else.32171:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32172:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32173

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32174

bnei_else.32173:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32175

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32176

fbgt_else.32175:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32176:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32177

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32178

bnei_else.32177:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32178:
bnei_cont.32174:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32170:
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
	fbne	%f1, %fzero, fbeq_else.32179

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32180

fbeq_else.32179:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32180:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32181

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32182

bnei_else.32181:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32183

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32184

fbeq_else.32183:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32184:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32185

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32186

bnei_else.32185:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32187

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32188

fbgt_else.32187:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32188:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32189

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32190

bnei_else.32189:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32190:
bnei_cont.32186:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32182:
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
	fbne	%f1, %fzero, fbeq_else.32191

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32192

fbeq_else.32191:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32192:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32193

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32194

bnei_else.32193:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32195

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32196

fbeq_else.32195:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32196:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32197

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32198

bnei_else.32197:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32199

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32200

fbgt_else.32199:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32200:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32201

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32202

bnei_else.32201:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32202:
bnei_cont.32198:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32194:
	fsw	%f0, 2(%s1)
	nop
	nop
	nop

bnei_cont.32156:
	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.32203

	flw	%f16, 0(%s0)
	flw	%f18, 482(%zero)
	nop
	nop

	flw	%f19, 481(%zero)
	nop
	fabs	%f1, %f16
	nop

	nop
	nop
	fdiv	%f0, %f1, %f19
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.32205

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32206

fbgt_else.32205:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32206:
	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.32207

	nop
	nop
	fsub	%f0, %f0, %f18
	j	fbgt_cont.32208

fbgt_else.32207:
fbgt_cont.32208:
	flw	%f2, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32209

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32211

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32210

bnei_else.32211:
	add	%a0, %zero, %k1
	nop
	nop
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
	fblt	%f0, %f2, fbgt_else.32213

	nop
	nop
	fsub	%f0, %f18, %f0
	j	fbgt_cont.32214

fbgt_else.32213:
fbgt_cont.32214:
	flw	%f17, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_else.32215

	flw	%f0, 474(%zero)
	nop
	fmul	%f21, %f0, %f0
	nop

	nop
	nop
	fmul	%f20, %f21, %f21
	fmul	%f0, %f0, %f21

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
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
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32216

fbgt_else.32215:
	flw	%f0, 478(%zero)
	nop
	fsub	%f22, %f2, %f0
	nop

	nop
	nop
	fmul	%f20, %f22, %f22
	fmul	%f0, %f0, %f22

	nop
	nop
	fmul	%f21, %f20, %f20
	fmul	%f0, %f0, %f20

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f22, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
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
	fneg	%f0, %f0
	nop

bnei_cont.32218:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.32219

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.32220

fbgt_else.32219:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.32220:
	nop
	nop
	fabs	%f16, %f16
	nop

	nop
	nop
	fdiv	%f1, %f16, %f19
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f18, fbgt_else.32221

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32223

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32222

bnei_else.32223:
	add	%a0, %zero, %k1
	nop
	nop
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
	fblt	%f1, %f18, fbgt_else.32225

	nop
	nop
	fsub	%f1, %f1, %f18
	j	fbgt_cont.32226

fbgt_else.32225:
fbgt_cont.32226:
	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.32227

	nop
	nop
	fsub	%f1, %f18, %f1
	j	fbgt_cont.32228

fbgt_else.32227:
fbgt_cont.32228:
	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.32229

	flw	%f16, 478(%zero)
	nop
	fmul	%f22, %f1, %f1
	nop

	nop
	nop
	fmul	%f21, %f22, %f22
	fmul	%f16, %f16, %f1

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	flw	%f16, 477(%zero)
	nop
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	flw	%f16, 476(%zero)
	nop
	fadd	%f20, %f20, %f16
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f22
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	j	fbgt_cont.32230

fbgt_else.32229:
	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f1, 474(%zero)
	nop
	fmul	%f21, %f1, %f1
	nop

	nop
	nop
	fmul	%f20, %f21, %f21
	fmul	%f1, %f1, %f21

	flw	%f1, 473(%zero)
	nop
	fsub	%f16, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fsub	%f1, %f16, %f1
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
	fneg	%f1, %f1
	nop

bnei_cont.32232:
	flw	%f21, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	fabs	%f20, %f21
	nop

	nop
	nop
	fdiv	%f16, %f20, %f19
	nop

	nop
	nop
	floor	%f16, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f19
	nop

	nop
	nop
	fsub	%f16, %f20, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %f18, fbgt_else.32233

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32234

fbgt_else.32233:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32234:
	nop
	nop
	nop
	fblt	%f16, %f18, fbgt_else.32235

	nop
	nop
	fsub	%f16, %f16, %f18
	j	fbgt_cont.32236

fbgt_else.32235:
fbgt_cont.32236:
	nop
	nop
	nop
	fblt	%f16, %f2, fbgt_else.32237

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32239

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32238

bnei_else.32239:
	add	%a0, %zero, %k1
	nop
	nop
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
	fblt	%f16, %f2, fbgt_else.32241

	nop
	nop
	fsub	%f16, %f18, %f16
	j	fbgt_cont.32242

fbgt_else.32241:
fbgt_cont.32242:
	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.32243

	flw	%f16, 474(%zero)
	nop
	fmul	%f23, %f16, %f16
	nop

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f16, %f16, %f23

	flw	%f16, 473(%zero)
	nop
	fsub	%f20, %f30, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	flw	%f16, 472(%zero)
	nop
	fadd	%f20, %f20, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f23
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	nop
	nop
	fsub	%f16, %f20, %f16
	j	fbgt_cont.32244

fbgt_else.32243:
	flw	%f16, 478(%zero)
	nop
	fsub	%f24, %f2, %f16
	nop

	nop
	nop
	fmul	%f23, %f24, %f24
	fmul	%f16, %f16, %f24

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f16, %f16, %f23

	flw	%f16, 477(%zero)
	nop
	fsub	%f20, %f24, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f24
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	flw	%f16, 476(%zero)
	nop
	fadd	%f20, %f20, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f24
	nop

	nop
	nop
	fmul	%f16, %f16, %f23
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	nop
	nop
	fsub	%f16, %f20, %f16
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
	fneg	%f16, %f16
	nop

bnei_cont.32246:
	nop
	nop
	nop
	fblt	%f21, %fzero, fbgt_else.32247

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.32248

fbgt_else.32247:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.32248:
	nop
	nop
	fabs	%f21, %f21
	nop

	nop
	nop
	fdiv	%f20, %f21, %f19
	nop

	nop
	nop
	floor	%f20, %f20
	nop

	nop
	nop
	fmul	%f20, %f20, %f19
	nop

	nop
	nop
	fsub	%f20, %f21, %f20
	nop

	nop
	nop
	nop
	fblt	%f20, %f18, fbgt_else.32249

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32251

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32250

bnei_else.32251:
	add	%a0, %zero, %k1
	nop
	nop
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
	fblt	%f20, %f18, fbgt_else.32253

	nop
	nop
	fsub	%f20, %f20, %f18
	j	fbgt_cont.32254

fbgt_else.32253:
fbgt_cont.32254:
	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_else.32255

	nop
	nop
	fsub	%f20, %f18, %f20
	j	fbgt_cont.32256

fbgt_else.32255:
fbgt_cont.32256:
	nop
	nop
	nop
	fblt	%f17, %f20, fbgt_else.32257

	flw	%f21, 478(%zero)
	nop
	fmul	%f24, %f20, %f20
	nop

	nop
	nop
	fmul	%f23, %f24, %f24
	fmul	%f21, %f21, %f20

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	flw	%f21, 477(%zero)
	nop
	fsub	%f22, %f20, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f20
	nop

	nop
	nop
	fmul	%f21, %f21, %f23
	nop

	flw	%f21, 476(%zero)
	nop
	fadd	%f22, %f22, %f21
	nop

	nop
	nop
	fmul	%f20, %f21, %f20
	nop

	nop
	nop
	fmul	%f20, %f20, %f24
	nop

	nop
	nop
	fmul	%f20, %f20, %f23
	nop

	nop
	nop
	fsub	%f20, %f22, %f20
	j	fbgt_cont.32258

fbgt_else.32257:
	nop
	nop
	fsub	%f20, %f2, %f20
	nop

	flw	%f20, 474(%zero)
	nop
	fmul	%f23, %f20, %f20
	nop

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f20, %f20, %f23

	flw	%f20, 473(%zero)
	nop
	fsub	%f21, %f30, %f20
	nop

	nop
	nop
	fmul	%f20, %f20, %f22
	nop

	flw	%f20, 472(%zero)
	nop
	fadd	%f21, %f21, %f20
	nop

	nop
	nop
	fmul	%f20, %f20, %f23
	nop

	nop
	nop
	fmul	%f20, %f20, %f22
	nop

	nop
	nop
	fsub	%f20, %f21, %f20
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
	fneg	%f20, %f20
	nop

bnei_cont.32260:
	flw	%f22, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	fabs	%f23, %f22
	nop

	nop
	nop
	fdiv	%f21, %f23, %f19
	nop

	nop
	nop
	floor	%f21, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f19
	nop

	nop
	nop
	fsub	%f21, %f23, %f21
	nop

	nop
	nop
	nop
	fblt	%f21, %f18, fbgt_else.32261

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32262

fbgt_else.32261:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32262:
	nop
	nop
	nop
	fblt	%f21, %f18, fbgt_else.32263

	nop
	nop
	fsub	%f21, %f21, %f18
	j	fbgt_cont.32264

fbgt_else.32263:
fbgt_cont.32264:
	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_else.32265

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32267

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32266

bnei_else.32267:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.32268:
	nop
	nop
	nop
	j	fbgt_cont.32266

fbgt_else.32265:
fbgt_cont.32266:
	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_else.32269

	nop
	nop
	fsub	%f21, %f18, %f21
	j	fbgt_cont.32270

fbgt_else.32269:
fbgt_cont.32270:
	nop
	nop
	nop
	fblt	%f17, %f21, fbgt_else.32271

	flw	%f21, 474(%zero)
	nop
	fmul	%f25, %f21, %f21
	nop

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f21, %f21, %f25

	flw	%f21, 473(%zero)
	nop
	fsub	%f23, %f30, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	flw	%f21, 472(%zero)
	nop
	fadd	%f23, %f23, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f25
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	nop
	nop
	fsub	%f21, %f23, %f21
	j	fbgt_cont.32272

fbgt_else.32271:
	flw	%f21, 478(%zero)
	nop
	fsub	%f26, %f2, %f21
	nop

	nop
	nop
	fmul	%f25, %f26, %f26
	fmul	%f21, %f21, %f26

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f21, %f21, %f25

	flw	%f21, 477(%zero)
	nop
	fsub	%f23, %f26, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f26
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	flw	%f21, 476(%zero)
	nop
	fadd	%f23, %f23, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f26
	nop

	nop
	nop
	fmul	%f21, %f21, %f25
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	nop
	nop
	fsub	%f21, %f23, %f21
	nop

fbgt_cont.32272:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32273

	nop
	nop
	nop
	j	bnei_cont.32274

bnei_else.32273:
	nop
	nop
	fneg	%f21, %f21
	nop

bnei_cont.32274:
	nop
	nop
	nop
	fblt	%f22, %fzero, fbgt_else.32275

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.32276

fbgt_else.32275:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.32276:
	nop
	nop
	fabs	%f23, %f22
	nop

	nop
	nop
	fdiv	%f22, %f23, %f19
	nop

	nop
	nop
	floor	%f22, %f22
	nop

	nop
	nop
	fmul	%f19, %f22, %f19
	nop

	nop
	nop
	fsub	%f19, %f23, %f19
	nop

	nop
	nop
	nop
	fblt	%f19, %f18, fbgt_else.32277

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32279

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32278

bnei_else.32279:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.32280:
	nop
	nop
	nop
	j	fbgt_cont.32278

fbgt_else.32277:
fbgt_cont.32278:
	nop
	nop
	nop
	fblt	%f19, %f18, fbgt_else.32281

	nop
	nop
	fsub	%f19, %f19, %f18
	j	fbgt_cont.32282

fbgt_else.32281:
fbgt_cont.32282:
	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_else.32283

	nop
	nop
	fsub	%f19, %f18, %f19
	j	fbgt_cont.32284

fbgt_else.32283:
fbgt_cont.32284:
	nop
	nop
	nop
	fblt	%f17, %f19, fbgt_else.32285

	flw	%f17, 478(%zero)
	nop
	fmul	%f22, %f19, %f19
	nop

	nop
	nop
	fmul	%f2, %f22, %f22
	fmul	%f17, %f17, %f19

	nop
	nop
	fmul	%f17, %f17, %f22
	nop

	flw	%f17, 477(%zero)
	nop
	fsub	%f18, %f19, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f19
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
	fmul	%f17, %f17, %f19
	nop

	nop
	nop
	fmul	%f17, %f17, %f22
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.32286

fbgt_else.32285:
	nop
	nop
	fsub	%f17, %f2, %f19
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

fbgt_cont.32286:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32287

	nop
	nop
	nop
	j	bnei_cont.32288

bnei_else.32287:
	nop
	nop
	fneg	%f17, %f17
	nop

bnei_cont.32288:
	flw	%f27, 0(%s1)
	nop
	fmul	%f22, %f16, %f21
	fmul	%f26, %f1, %f20

	nop
	nop
	fmul	%f19, %f26, %f21
	fmul	%f18, %f0, %f17

	nop
	nop
	fsub	%f2, %f19, %f18
	fmul	%f25, %f0, %f20

	nop
	nop
	fmul	%f19, %f25, %f21
	fmul	%f18, %f1, %f17

	nop
	nop
	fadd	%f23, %f19, %f18
	fmul	%f24, %f16, %f17

	nop
	nop
	fmul	%f19, %f26, %f17
	fmul	%f18, %f0, %f21

	nop
	nop
	fadd	%f19, %f19, %f18
	fmul	%f18, %f25, %f17

	flw	%f20, 470(%zero)
	nop
	fmul	%f17, %f1, %f21
	fneg	%f25, %f20

	flw	%f17, 1(%s1)
	nop
	fsub	%f26, %f18, %f17
	fmul	%f18, %f1, %f16

	flw	%f16, 2(%s1)
	nop
	fmul	%f21, %f0, %f16
	fmul	%f0, %f22, %f22

	nop
	nop
	fmul	%f1, %f27, %f0
	fmul	%f0, %f24, %f24

	nop
	nop
	fmul	%f0, %f17, %f0
	fmul	%f22, %f27, %f22

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f25, %f25

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 0(%s1)
	nop
	fmul	%f0, %f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f27, %f0
	fmul	%f0, %f19, %f19

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 1(%s1)
	nop
	fmul	%f0, %f23, %f23
	nop

	nop
	nop
	fmul	%f1, %f27, %f0
	fmul	%f0, %f26, %f26

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f21, %f21

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%s1)
	nop
	fmul	%f0, %f27, %f2
	nop

	nop
	nop
	fmul	%f1, %f0, %f23
	fmul	%f0, %f17, %f19

	nop
	nop
	fmul	%f0, %f0, %f26
	fmul	%f17, %f17, %f24

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18

	nop
	nop
	fmul	%f0, %f0, %f21
	fmul	%f16, %f16, %f25

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f22, %f23

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	fsw	%f0, 0(%s0)
	nop
	fmul	%f0, %f17, %f26
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f21

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f22, %f2

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	fsw	%f0, 1(%s0)
	nop
	fmul	%f0, %f17, %f19
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	fsw	%f0, 2(%s0)
	nop
	nop
	j	bnei_cont.32204

bnei_else.32203:
bnei_cont.32204:
	add	%ra, %zero, %a1
	add	%v0, %zero, %k1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32148:
	add	%ra, %zero, %a1
	add	%v0, %zero, %zero
	nop
	nop

	nop
	nop
	nop
	jr	%ra

read_object.2772:
	add	%a1, %zero, %v0
	add	%s7, %zero, %ra
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 60, bgti_else.32412

	add	%ra, %zero, %s7
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.32412:
	nop
	nop
	nop
	jal	min_caml_read_int

	addi	%a0, %v0, 0
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32414

	nop
	nop
	nop
	jal	min_caml_read_int

	addi	%a2, %v0, 0
	nop
	nop
	jal	min_caml_read_int

	addi	%a3, %v0, 0
	nop
	nop
	jal	min_caml_read_int

	addi	%fp, %v0, 0
	addi	%k0, %zero, 3
	fmov	%f0, %fzero
	nop

	addi	%v0, %k0, 0
	nop
	nop
	jal	min_caml_create_float_array

	addi	%s0, %v0, 0
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 0(%s0)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s0)
	addi	%s3, %zero, 2
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%s1, %v0, 0
	nop
	nop
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
	fblt	%f0, %fzero, fbgt_else.32416

	add	%s2, %zero, %zero
	nop
	nop
	j	fbgt_cont.32417

fbgt_else.32416:
	add	%s2, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32417:
	addi	%v0, %s3, 0
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%s3, %v0, 0
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 0(%s3)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s3)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%s4, %v0, 0
	nop
	nop
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
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%k0, %v0, 0
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.32418

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
	j	bnei_cont.32419

bnei_else.32418:
bnei_cont.32419:
	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.32420

	add	%s5, %zero, %s2
	nop
	nop
	j	bnei_cont.32421

bnei_else.32420:
	add	%s5, %zero, %k1
	nop
	nop
	nop

bnei_cont.32421:
	addi	%v0, %zero, 4
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	add	%ra, %zero, %hp
	addi	%hp, %hp, 11
	nop
	nop

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
	beqi	%a2, 3, bnei_else.32422

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.32424

	nop
	nop
	nop
	j	bnei_cont.32423

bnei_else.32424:
	nop
	nop
	nop
	beqi	%s2, 0, bnei_else.32426

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.32427

bnei_else.32426:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.32427:
	flw	%f18, 0(%s0)
	flw	%f17, 1(%s0)
	nop
	nop

	flw	%f16, 2(%s0)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.32428

	add	%a2, %zero, %k1
	nop
	nop
	j	fbeq_cont.32429

fbeq_else.32428:
	add	%a2, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32429:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32430

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32431

bnei_else.32430:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32432

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.32433

bnei_else.32432:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.32433:
bnei_cont.32431:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 0(%s0)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 1(%s0)
	nop
	nop
	nop

	fsw	%f0, 2(%s0)
	nop
	nop
	nop

bnei_cont.32425:
	nop
	nop
	nop
	j	bnei_cont.32423

bnei_else.32422:
	flw	%f1, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32434

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32435

fbeq_else.32434:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32435:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32436

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32437

bnei_else.32436:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32438

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32439

fbeq_else.32438:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32439:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32440

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32441

bnei_else.32440:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32442

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32443

fbgt_else.32442:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32443:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32444

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32445

bnei_else.32444:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32445:
bnei_cont.32441:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32437:
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
	fbne	%f1, %fzero, fbeq_else.32446

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32447

fbeq_else.32446:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32447:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32448

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32449

bnei_else.32448:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32450

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32451

fbeq_else.32450:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32451:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32452

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32453

bnei_else.32452:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32454

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32455

fbgt_else.32454:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32455:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32456

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32457

bnei_else.32456:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32457:
bnei_cont.32453:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32449:
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
	fbne	%f1, %fzero, fbeq_else.32458

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32459

fbeq_else.32458:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32459:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32460

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32461

bnei_else.32460:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32462

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.32463

fbeq_else.32462:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32463:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32464

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.32465

bnei_else.32464:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32466

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32466:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32467:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32468

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.32469

bnei_else.32468:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.32469:
bnei_cont.32465:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.32461:
	fsw	%f0, 2(%s0)
	nop
	nop
	nop

bnei_cont.32423:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.32470

	addi	%v1, %k0, 0
	addi	%v0, %s0, 0
	nop
	jal	rotate_quadratic_matrix.2767

	nop
	nop
	nop
	j	bnei_cont.32471

bnei_else.32470:
bnei_cont.32471:
	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.32415

bnei_else.32414:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.32415:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32472

	addi	%t7, %a1, 1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t7, 60, bgti_else.32473

	add	%ra, %zero, %s7
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.32473:
	addi	%v0, %t7, 0
	nop
	nop
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32475

	addi	%v0, %t7, 1
	add	%ra, %zero, %s7
	nop
	j	read_object.2772

bnei_else.32475:
	add	%ra, %zero, %s7
	sw	%t7, 0(%zero)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32472:
	add	%ra, %zero, %s7
	sw	%a1, 0(%zero)
	nop
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

	addi	%sp, %sp, 9
	nop
	nop
	jal	min_caml_read_int

	addi	%sp, %sp, -9
	addi	%t0, %v0, 0
	addi	%a0, %zero, -1
	nop

	nop
	nop
	nop
	beqi	%t0, -1, bnei_else.32550

	lw	%a1, 0(%sp)
	addi	%sp, %sp, 9
	nop
	nop

	addi	%t1, %a1, 1
	nop
	nop
	jal	min_caml_read_int

	addi	%sp, %sp, -9
	addi	%t2, %v0, 0
	nop
	nop

	nop
	nop
	nop
	beqi	%t2, -1, bnei_else.32551

	addi	%t3, %t1, 1
	addi	%sp, %sp, 9
	nop
	jal	min_caml_read_int

	addi	%sp, %sp, -9
	addi	%t4, %v0, 0
	nop
	nop

	nop
	nop
	nop
	beqi	%t4, -1, bnei_else.32553

	addi	%t5, %t3, 1
	addi	%sp, %sp, 9
	nop
	jal	min_caml_read_int

	addi	%sp, %sp, -9
	addi	%t6, %v0, 0
	nop
	nop

	nop
	nop
	nop
	beqi	%t6, -1, bnei_else.32555

	addi	%v0, %t5, 1
	addi	%sp, %sp, 9
	nop
	jal	read_net_item.2776

	addi	%sp, %sp, -9
	add	%at, %v0, %t5
	nop
	nop

	sw	%t6, 0(%at)
	nop
	nop
	j	bnei_cont.32556

bnei_else.32555:
	addi	%v0, %t5, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array

	addi	%sp, %sp, -9
	nop
	nop
	nop

bnei_cont.32556:
	add	%at, %v0, %t3
	nop
	nop
	nop

	sw	%t4, 0(%at)
	nop
	nop
	j	bnei_cont.32554

bnei_else.32553:
	addi	%v0, %t3, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array

	addi	%sp, %sp, -9
	nop
	nop
	nop

bnei_cont.32554:
	add	%at, %v0, %t1
	nop
	nop
	nop

	sw	%t2, 0(%at)
	nop
	nop
	j	bnei_cont.32552

bnei_else.32551:
	addi	%v0, %t1, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array

	addi	%sp, %sp, -9
	nop
	nop
	nop

bnei_cont.32552:
	lw	%a0, 0(%sp)
	lw	%t6, 1(%sp)
	nop
	nop

	add	%at, %v0, %a0
	lw	%t5, 2(%sp)
	nop
	nop

	sw	%t0, 0(%at)
	lw	%t4, 3(%sp)
	nop
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
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32550:
	lw	%a1, 0(%sp)
	lw	%t6, 1(%sp)
	addi	%v1, %a0, 0
	nop

	addi	%v0, %a1, 1
	lw	%t5, 2(%sp)
	nop
	nop

	lw	%t4, 3(%sp)
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

	addi	%sp, %sp, 4
	nop
	nop
	jal	min_caml_read_int

	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	addi	%a3, %zero, -1
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32634

	addi	%sp, %sp, 4
	nop
	nop
	jal	min_caml_read_int

	addi	%sp, %sp, -4
	addi	%fp, %v0, 0
	nop
	nop

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.32636

	addi	%sp, %sp, 4
	nop
	nop
	jal	min_caml_read_int

	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, -1, bnei_else.32638

	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	nop
	jal	read_net_item.2776

	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	nop
	nop

	sw	%k0, 2(%v1)
	nop
	nop
	j	bnei_cont.32639

bnei_else.32638:
	addi	%v0, %zero, 3
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	nop
	nop

bnei_cont.32639:
	sw	%fp, 1(%v1)
	nop
	nop
	j	bnei_cont.32637

bnei_else.32636:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	nop
	nop

bnei_cont.32637:
	sw	%a2, 0(%v1)
	nop
	nop
	j	bnei_cont.32635

bnei_else.32634:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	nop
	nop

bnei_cont.32635:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32640

	lw	%a0, 0(%sp)
	addi	%sp, %sp, 5
	nop
	nop

	addi	%t0, %a0, 1
	nop
	nop
	jal	min_caml_read_int

	addi	%sp, %sp, -5
	addi	%a2, %v0, 0
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32641

	addi	%sp, %sp, 5
	nop
	nop
	jal	min_caml_read_int

	addi	%sp, %sp, -5
	addi	%fp, %v0, 0
	nop
	nop

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.32643

	addi	%v0, %zero, 2
	addi	%sp, %sp, 5
	nop
	jal	read_net_item.2776

	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	nop
	nop

	sw	%fp, 1(%t1)
	nop
	nop
	j	bnei_cont.32644

bnei_else.32643:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	nop
	nop

bnei_cont.32644:
	sw	%a2, 0(%t1)
	nop
	nop
	j	bnei_cont.32642

bnei_else.32641:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	nop
	nop

bnei_cont.32642:
	lw	%a0, 0(%t1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32645

	addi	%v0, %t0, 1
	addi	%sp, %sp, 5
	nop
	jal	read_or_network.2778

	addi	%sp, %sp, -5
	add	%at, %v0, %t0
	nop
	nop

	sw	%t1, 0(%at)
	nop
	nop
	j	bnei_cont.32646

bnei_else.32645:
	addi	%v0, %t0, 1
	addi	%v1, %t1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	addi	%sp, %sp, -5
	nop
	nop
	nop

bnei_cont.32646:
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	nop
	nop

	add	%at, %v0, %a0
	lw	%t1, 1(%sp)
	nop
	nop

	sw	%a1, 0(%at)
	lw	%t0, 2(%sp)
	nop
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32640:
	lw	%a0, 0(%sp)
	lw	%t1, 1(%sp)
	nop
	nop

	addi	%v0, %a0, 1
	lw	%t0, 2(%sp)
	nop
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	j	min_caml_create_array

read_and_network.2780:
	add	%a2, %zero, %v0
	add	%a3, %zero, %ra
	nop
	jal	min_caml_read_int

	addi	%fp, %v0, 0
	addi	%k0, %zero, -1
	nop
	nop

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.32701

	nop
	nop
	nop
	jal	min_caml_read_int

	addi	%s0, %v0, 0
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s0, -1, bnei_else.32703

	nop
	nop
	nop
	jal	min_caml_read_int

	addi	%s1, %v0, 0
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s1, -1, bnei_else.32705

	addi	%v0, %zero, 3
	nop
	nop
	jal	read_net_item.2776

	sw	%s1, 2(%v0)
	nop
	nop
	j	bnei_cont.32706

bnei_else.32705:
	addi	%v0, %zero, 3
	addi	%v1, %k0, 0
	nop
	jal	min_caml_create_array

bnei_cont.32706:
	sw	%s0, 1(%v0)
	nop
	nop
	j	bnei_cont.32704

bnei_else.32703:
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0
	nop
	jal	min_caml_create_array

bnei_cont.32704:
	sw	%fp, 0(%v0)
	nop
	nop
	j	bnei_cont.32702

bnei_else.32701:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	nop
	jal	min_caml_create_array

bnei_cont.32702:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32707

	sw	%v0, 83(%a2)
	nop
	nop
	nop

	addi	%s0, %a2, 1
	nop
	nop
	jal	min_caml_read_int

	addi	%a2, %v0, 0
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32708

	nop
	nop
	nop
	jal	min_caml_read_int

	addi	%fp, %v0, 0
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.32710

	addi	%v0, %zero, 2
	nop
	nop
	jal	read_net_item.2776

	sw	%fp, 1(%v0)
	nop
	nop
	j	bnei_cont.32711

bnei_else.32710:
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0
	nop
	jal	min_caml_create_array

bnei_cont.32711:
	sw	%a2, 0(%v0)
	nop
	nop
	j	bnei_cont.32709

bnei_else.32708:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	nop
	jal	min_caml_create_array

bnei_cont.32709:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32712

	sw	%v0, 83(%s0)
	nop
	nop
	nop

	addi	%fp, %s0, 1
	nop
	nop
	jal	min_caml_read_int

	addi	%a2, %v0, 0
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.32713

	addi	%v0, %k1, 0
	nop
	nop
	jal	read_net_item.2776

	sw	%a2, 0(%v0)
	nop
	nop
	j	bnei_cont.32714

bnei_else.32713:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	nop
	jal	min_caml_create_array

bnei_cont.32714:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32715

	sw	%v0, 83(%fp)
	addi	%v0, %zero, 0
	nop
	nop

	addi	%a2, %fp, 1
	nop
	nop
	jal	read_net_item.2776

	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32716

	sw	%v0, 83(%a2)
	add	%ra, %zero, %a3
	nop
	nop

	addi	%v0, %a2, 1
	nop
	nop
	j	read_and_network.2780

bnei_else.32716:
	add	%ra, %zero, %a3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32715:
	add	%ra, %zero, %a3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32712:
	add	%ra, %zero, %a3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32707:
	add	%ra, %zero, %a3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

iter_setup_dirvec_constants.2877:
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1
	add	%a2, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.32905

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
	beqi	%a3, 1, bnei_else.32906

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32908

	addi	%v0, %zero, 5
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f20, 0(%fp)
	flw	%f19, 1(%fp)
	nop
	nop

	flw	%f24, 2(%fp)
	flw	%f2, 0(%s0)
	fmul	%f0, %f20, %f20
	nop

	flw	%f18, 1(%s0)
	flw	%f17, 2(%s0)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24

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
	beqi	%s3, 0, bnei_else.32910

	flw	%f1, 0(%s2)
	nop
	fmul	%f16, %f19, %f24
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%s2)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f19

	flw	%f0, 2(%s2)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.32911

bnei_else.32910:
bnei_cont.32911:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f20, %f2
	nop

	nop
	nop
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18

	nop
	nop
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17

	nop
	nop
	fneg	%f2, %f1
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.32912

	flw	%f22, 1(%s2)
	flw	%f18, 2(%s2)
	nop
	nop

	flw	%f21, 474(%zero)
	flw	%f17, 0(%s2)
	fmul	%f16, %f24, %f22
	fmul	%f1, %f19, %f18

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f24, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f25, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f20, %f18
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f19, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f23, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f20, %f22
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.32913

bnei_else.32912:
	fsw	%f25, 1(%v0)
	nop
	nop
	nop

	fsw	%f23, 2(%v0)
	nop
	nop
	nop

	fsw	%f2, 3(%v0)
	nop
	nop
	nop

bnei_cont.32913:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.32914

	add	%a3, %zero, %k1
	nop
	nop
	j	fbeq_cont.32915

fbeq_else.32914:
	add	%a3, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32915:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32916

	nop
	nop
	nop
	j	bnei_cont.32917

bnei_else.32916:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.32917:
	add	%at, %k0, %a1
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.32907

bnei_else.32908:
	addi	%v0, %zero, 4
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f0, 0(%fp)
	flw	%f18, 0(%s0)
	nop
	nop

	flw	%f0, 1(%fp)
	flw	%f17, 1(%s0)
	fmul	%f1, %f0, %f18
	nop

	flw	%f16, 2(%s0)
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 2(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32918

	add	%a3, %zero, %zero
	nop
	nop
	j	fbgt_cont.32919

fbgt_else.32918:
	add	%a3, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32919:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32920

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
	fdiv	%f0, %f18, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f17, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f16, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.32921

bnei_else.32920:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.32921:
	add	%at, %k0, %a1
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.32909:
	nop
	nop
	nop
	j	bnei_cont.32907

bnei_else.32906:
	addi	%v0, %zero, 6
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32922

	add	%a3, %zero, %k1
	nop
	nop
	j	fbeq_cont.32923

fbeq_else.32922:
	add	%a3, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32923:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32924

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.32925

bnei_else.32924:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32926

	add	%a3, %zero, %zero
	nop
	nop
	j	fbgt_cont.32927

fbgt_else.32926:
	add	%a3, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32927:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32928

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32930

	add	%a3, %zero, %zero
	nop
	nop
	j	bnei_cont.32929

bnei_else.32930:
	add	%a3, %zero, %k1
	nop
	nop
	nop

bnei_cont.32931:
	nop
	nop
	nop
	j	bnei_cont.32929

bnei_else.32928:
bnei_cont.32929:
	flw	%f0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32932

	nop
	nop
	nop
	j	bnei_cont.32933

bnei_else.32932:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32933:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.32925:
	flw	%f1, 1(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32934

	add	%a3, %zero, %k1
	nop
	nop
	j	fbeq_cont.32935

fbeq_else.32934:
	add	%a3, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32935:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32936

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.32937

bnei_else.32936:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32938

	add	%a3, %zero, %zero
	nop
	nop
	j	fbgt_cont.32939

fbgt_else.32938:
	add	%a3, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32939:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32940

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32942

	add	%a3, %zero, %zero
	nop
	nop
	j	bnei_cont.32941

bnei_else.32942:
	add	%a3, %zero, %k1
	nop
	nop
	nop

bnei_cont.32943:
	nop
	nop
	nop
	j	bnei_cont.32941

bnei_else.32940:
bnei_cont.32941:
	flw	%f0, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32944

	nop
	nop
	nop
	j	bnei_cont.32945

bnei_else.32944:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32945:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.32937:
	flw	%f1, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32946

	add	%a3, %zero, %k1
	nop
	nop
	j	fbeq_cont.32947

fbeq_else.32946:
	add	%a3, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32947:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32948

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.32949

bnei_else.32948:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32950

	add	%a3, %zero, %zero
	nop
	nop
	j	fbgt_cont.32951

fbgt_else.32950:
	add	%a3, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32951:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32952

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32954

	add	%a3, %zero, %zero
	nop
	nop
	j	bnei_cont.32953

bnei_else.32954:
	add	%a3, %zero, %k1
	nop
	nop
	nop

bnei_cont.32955:
	nop
	nop
	nop
	j	bnei_cont.32953

bnei_else.32952:
bnei_cont.32953:
	flw	%f0, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32956

	nop
	nop
	nop
	j	bnei_cont.32957

bnei_else.32956:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32957:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.32949:
	add	%at, %k0, %a1
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.32907:
	addi	%a3, %a1, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.32958

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
	beqi	%a1, 1, bnei_else.32959

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.32961

	addi	%v0, %zero, 5
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f20, 0(%fp)
	flw	%f19, 1(%fp)
	nop
	nop

	flw	%f24, 2(%fp)
	flw	%f2, 0(%s0)
	fmul	%f0, %f20, %f20
	nop

	flw	%f18, 1(%s0)
	flw	%f17, 2(%s0)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24

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
	beqi	%s3, 0, bnei_else.32963

	flw	%f1, 0(%s2)
	nop
	fmul	%f16, %f19, %f24
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%s2)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f19

	flw	%f0, 2(%s2)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.32964

bnei_else.32963:
bnei_cont.32964:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f20, %f2
	nop

	nop
	nop
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18

	nop
	nop
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17

	nop
	nop
	fneg	%f2, %f1
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.32965

	flw	%f22, 1(%s2)
	flw	%f18, 2(%s2)
	nop
	nop

	flw	%f21, 474(%zero)
	flw	%f17, 0(%s2)
	fmul	%f16, %f24, %f22
	fmul	%f1, %f19, %f18

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f24, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f25, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f20, %f18
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f19, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f23, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f20, %f22
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.32966

bnei_else.32965:
	fsw	%f25, 1(%v0)
	nop
	nop
	nop

	fsw	%f23, 2(%v0)
	nop
	nop
	nop

	fsw	%f2, 3(%v0)
	nop
	nop
	nop

bnei_cont.32966:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.32967

	add	%a1, %zero, %k1
	nop
	nop
	j	fbeq_cont.32968

fbeq_else.32967:
	add	%a1, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32968:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32969

	nop
	nop
	nop
	j	bnei_cont.32970

bnei_else.32969:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.32970:
	add	%at, %k0, %a3
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.32960

bnei_else.32961:
	addi	%v0, %zero, 4
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f0, 0(%fp)
	flw	%f18, 0(%s0)
	nop
	nop

	flw	%f0, 1(%fp)
	flw	%f17, 1(%s0)
	fmul	%f1, %f0, %f18
	nop

	flw	%f16, 2(%s0)
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 2(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.32971

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.32972

fbgt_else.32971:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32972:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32973

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
	fdiv	%f0, %f18, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f17, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f16, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.32974

bnei_else.32973:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.32974:
	add	%at, %k0, %a3
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.32962:
	nop
	nop
	nop
	j	bnei_cont.32960

bnei_else.32959:
	addi	%v0, %zero, 6
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32975

	add	%a1, %zero, %k1
	nop
	nop
	j	fbeq_cont.32976

fbeq_else.32975:
	add	%a1, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32976:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32977

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.32978

bnei_else.32977:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32979

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.32980

fbgt_else.32979:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32980:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32981

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32983

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.32982

bnei_else.32983:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.32984:
	nop
	nop
	nop
	j	bnei_cont.32982

bnei_else.32981:
bnei_cont.32982:
	flw	%f0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32985

	nop
	nop
	nop
	j	bnei_cont.32986

bnei_else.32985:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32986:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.32978:
	flw	%f1, 1(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32987

	add	%a1, %zero, %k1
	nop
	nop
	j	fbeq_cont.32988

fbeq_else.32987:
	add	%a1, %zero, %zero
	nop
	nop
	nop

fbeq_cont.32988:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32989

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.32990

bnei_else.32989:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32991

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.32992

fbgt_else.32991:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.32992:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.32993

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32995

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.32994

bnei_else.32995:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.32996:
	nop
	nop
	nop
	j	bnei_cont.32994

bnei_else.32993:
bnei_cont.32994:
	flw	%f0, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32997

	nop
	nop
	nop
	j	bnei_cont.32998

bnei_else.32997:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32998:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.32990:
	flw	%f1, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32999

	add	%a1, %zero, %k1
	nop
	nop
	j	fbeq_cont.33000

fbeq_else.32999:
	add	%a1, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33000:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33001

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.33002

bnei_else.33001:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.33003

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.33004

fbgt_else.33003:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33004:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.33005

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33007

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33006

bnei_else.33007:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33008:
	nop
	nop
	nop
	j	bnei_cont.33006

bnei_else.33005:
bnei_cont.33006:
	flw	%f0, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33009

	nop
	nop
	nop
	j	bnei_cont.33010

bnei_else.33009:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33010:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.33002:
	add	%at, %k0, %a3
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.32960:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a2
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877

bgti_else.32958:
	add	%ra, %zero, %a2
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.32905:
	add	%ra, %zero, %a2
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

setup_dirvec_constants.2880:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	nop
	nop

	lw	%a2, 0(%zero)
	nop
	nop
	nop

	addi	%a3, %a2, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.33115

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
	beqi	%a2, 1, bnei_else.33116

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33118

	addi	%v0, %zero, 5
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f20, 0(%s0)
	flw	%f19, 1(%s0)
	nop
	nop

	flw	%f24, 2(%s0)
	flw	%f2, 0(%k0)
	fmul	%f0, %f20, %f20
	nop

	flw	%f18, 1(%k0)
	flw	%f17, 2(%k0)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24

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
	beqi	%s3, 0, bnei_else.33120

	flw	%f1, 0(%s2)
	nop
	fmul	%f16, %f19, %f24
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%s2)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f19

	flw	%f0, 2(%s2)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.33121

bnei_else.33120:
bnei_cont.33121:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f20, %f2
	nop

	nop
	nop
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18

	nop
	nop
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17

	nop
	nop
	fneg	%f2, %f1
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.33122

	flw	%f22, 1(%s2)
	flw	%f18, 2(%s2)
	nop
	nop

	flw	%f21, 474(%zero)
	flw	%f17, 0(%s2)
	fmul	%f16, %f24, %f22
	fmul	%f1, %f19, %f18

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f24, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f25, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f20, %f18
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f19, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f23, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f20, %f22
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.33123

bnei_else.33122:
	fsw	%f25, 1(%v0)
	nop
	nop
	nop

	fsw	%f23, 2(%v0)
	nop
	nop
	nop

	fsw	%f2, 3(%v0)
	nop
	nop
	nop

bnei_cont.33123:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.33124

	add	%a2, %zero, %k1
	nop
	nop
	j	fbeq_cont.33125

fbeq_else.33124:
	add	%a2, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33125:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33126

	nop
	nop
	nop
	j	bnei_cont.33127

bnei_else.33126:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.33127:
	add	%at, %fp, %a3
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.33117

bnei_else.33118:
	addi	%v0, %zero, 4
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f0, 0(%s0)
	flw	%f18, 0(%k0)
	nop
	nop

	flw	%f0, 1(%s0)
	flw	%f17, 1(%k0)
	fmul	%f1, %f0, %f18
	nop

	flw	%f16, 2(%k0)
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 2(%s0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.33128

	add	%a2, %zero, %zero
	nop
	nop
	j	fbgt_cont.33129

fbgt_else.33128:
	add	%a2, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33129:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33130

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
	fdiv	%f0, %f18, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f17, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f16, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.33131

bnei_else.33130:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.33131:
	add	%at, %fp, %a3
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.33119:
	nop
	nop
	nop
	j	bnei_cont.33117

bnei_else.33116:
	addi	%v0, %zero, 6
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f1, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.33132

	add	%a2, %zero, %k1
	nop
	nop
	j	fbeq_cont.33133

fbeq_else.33132:
	add	%a2, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33133:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33134

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.33135

bnei_else.33134:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.33136

	add	%a2, %zero, %zero
	nop
	nop
	j	fbgt_cont.33137

fbgt_else.33136:
	add	%a2, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33137:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.33138

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33140

	add	%a2, %zero, %zero
	nop
	nop
	j	bnei_cont.33139

bnei_else.33140:
	add	%a2, %zero, %k1
	nop
	nop
	nop

bnei_cont.33141:
	nop
	nop
	nop
	j	bnei_cont.33139

bnei_else.33138:
bnei_cont.33139:
	flw	%f0, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33142

	nop
	nop
	nop
	j	bnei_cont.33143

bnei_else.33142:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33143:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.33135:
	flw	%f1, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.33144

	add	%a2, %zero, %k1
	nop
	nop
	j	fbeq_cont.33145

fbeq_else.33144:
	add	%a2, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33145:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33146

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.33147

bnei_else.33146:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.33148

	add	%a2, %zero, %zero
	nop
	nop
	j	fbgt_cont.33149

fbgt_else.33148:
	add	%a2, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33149:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.33150

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33152

	add	%a2, %zero, %zero
	nop
	nop
	j	bnei_cont.33151

bnei_else.33152:
	add	%a2, %zero, %k1
	nop
	nop
	nop

bnei_cont.33153:
	nop
	nop
	nop
	j	bnei_cont.33151

bnei_else.33150:
bnei_cont.33151:
	flw	%f0, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33154

	nop
	nop
	nop
	j	bnei_cont.33155

bnei_else.33154:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33155:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.33147:
	flw	%f1, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.33156

	add	%a2, %zero, %k1
	nop
	nop
	j	fbeq_cont.33157

fbeq_else.33156:
	add	%a2, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33157:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33158

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.33159

bnei_else.33158:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.33160

	add	%a2, %zero, %zero
	nop
	nop
	j	fbgt_cont.33161

fbgt_else.33160:
	add	%a2, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33161:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.33162

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33164

	add	%a2, %zero, %zero
	nop
	nop
	j	bnei_cont.33163

bnei_else.33164:
	add	%a2, %zero, %k1
	nop
	nop
	nop

bnei_cont.33165:
	nop
	nop
	nop
	j	bnei_cont.33163

bnei_else.33162:
bnei_cont.33163:
	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33166

	nop
	nop
	nop
	j	bnei_cont.33167

bnei_else.33166:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33167:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.33159:
	add	%at, %fp, %a3
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.33117:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a1
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877

bgti_else.33115:
	add	%ra, %zero, %a1
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2882:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.33205

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
	beqi	%a1, 2, bnei_else.33206

	addi	%at, %zero, 2
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.33208

	nop
	nop
	nop
	j	bnei_cont.33207

bgt_else.33208:
	flw	%f17, 0(%k0)
	flw	%f18, 1(%k0)
	nop
	nop

	flw	%f19, 2(%k0)
	flw	%f0, 0(%fp)
	fmul	%f1, %f17, %f17
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f16, %f1, %f0
	fmul	%f1, %f18, %f18

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f19, %f19

	flw	%f0, 2(%fp)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33210

	flw	%f1, 0(%a2)
	nop
	fmul	%f16, %f18, %f19
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a2)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f19, %f17

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f17, %f18

	flw	%f0, 2(%a2)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.33211

bnei_else.33210:
bnei_cont.33211:
	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.33212

	nop
	nop
	nop
	j	bnei_cont.33213

bnei_else.33212:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.33213:
	fsw	%f0, 3(%k0)
	nop
	nop
	nop

bgt_cont.33209:
	nop
	nop
	nop
	j	bnei_cont.33207

bnei_else.33206:
	flw	%f1, 0(%k0)
	flw	%f17, 1(%k0)
	nop
	nop

	flw	%f16, 2(%k0)
	flw	%f0, 0(%fp)
	nop
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 2(%fp)
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

	fsw	%f0, 3(%k0)
	nop
	nop
	nop

bnei_cont.33207:
	addi	%v1, %v1, -1
	nop
	nop
	j	setup_startp_constants.2882

bgti_else.33205:
	nop
	nop
	nop
	jr	%ra

check_all_inside.2907:
	add	%at, %v1, %v0
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33361

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

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	nop
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33362

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33364

	flw	%f16, 0(%k0)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%k0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33366

	flw	%f17, 0(%a3)
	nop
	fmul	%f18, %f20, %f21
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a3)
	nop
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a3)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.33367

bnei_else.33366:
bnei_cont.33367:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33368

	nop
	nop
	nop
	j	bnei_cont.33369

bnei_else.33368:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.33369:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.33370

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33371

fbgt_else.33370:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33371:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33372

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33374

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33373

bnei_else.33374:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33375:
	nop
	nop
	nop
	j	bnei_cont.33373

bnei_else.33372:
bnei_cont.33373:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33376

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33363

bnei_else.33376:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33377:
	nop
	nop
	nop
	j	bnei_cont.33363

bnei_else.33364:
	flw	%f16, 0(%k0)
	nop
	nop
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%k0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.33378

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33379

fbgt_else.33378:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33379:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33380

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33382

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33381

bnei_else.33382:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33383:
	nop
	nop
	nop
	j	bnei_cont.33381

bnei_else.33380:
bnei_cont.33381:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33384

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33363

bnei_else.33384:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33385:
bnei_cont.33365:
	nop
	nop
	nop
	j	bnei_cont.33363

bnei_else.33362:
	flw	%f16, 0(%k0)
	nop
	fabs	%f17, %f19
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.33386

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33387

fbgt_else.33386:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33387:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33388

	flw	%f16, 1(%k0)
	nop
	fabs	%f17, %f20
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.33390

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33391

fbgt_else.33390:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33391:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33392

	flw	%f16, 2(%k0)
	nop
	fabs	%f17, %f21
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.33394

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33389

fbgt_else.33394:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33395:
	nop
	nop
	nop
	j	bnei_cont.33389

bnei_else.33392:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33393:
	nop
	nop
	nop
	j	bnei_cont.33389

bnei_else.33388:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33389:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33396

	nop
	nop
	nop
	j	bnei_cont.33397

bnei_else.33396:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33398

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33399

bnei_else.33398:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33399:
bnei_cont.33397:
bnei_cont.33363:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33400

	add	%v0, %zero, %zero
	nop
	nop
	jr	%ra

bnei_else.33400:
	addi	%s0, %v0, 1
	nop
	nop
	nop

	add	%at, %v1, %s0
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33401

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

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	nop
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33402

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33404

	flw	%f16, 0(%k0)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%k0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33406

	flw	%f17, 0(%a3)
	nop
	fmul	%f18, %f20, %f21
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a3)
	nop
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a3)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.33407

bnei_else.33406:
bnei_cont.33407:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33408

	nop
	nop
	nop
	j	bnei_cont.33409

bnei_else.33408:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.33409:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.33410

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33411

fbgt_else.33410:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33411:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33412

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33414

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33413

bnei_else.33414:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33415:
	nop
	nop
	nop
	j	bnei_cont.33413

bnei_else.33412:
bnei_cont.33413:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33416

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33403

bnei_else.33416:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33417:
	nop
	nop
	nop
	j	bnei_cont.33403

bnei_else.33404:
	flw	%f16, 0(%k0)
	nop
	nop
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%k0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.33418

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33419

fbgt_else.33418:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33419:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33420

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33422

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33421

bnei_else.33422:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33423:
	nop
	nop
	nop
	j	bnei_cont.33421

bnei_else.33420:
bnei_cont.33421:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33424

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33403

bnei_else.33424:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33425:
bnei_cont.33405:
	nop
	nop
	nop
	j	bnei_cont.33403

bnei_else.33402:
	flw	%f16, 0(%k0)
	nop
	fabs	%f17, %f19
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.33426

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33427

fbgt_else.33426:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33427:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33428

	flw	%f16, 1(%k0)
	nop
	fabs	%f17, %f20
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.33430

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33431

fbgt_else.33430:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33431:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33432

	flw	%f16, 2(%k0)
	nop
	fabs	%f17, %f21
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.33434

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33429

fbgt_else.33434:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33435:
	nop
	nop
	nop
	j	bnei_cont.33429

bnei_else.33432:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33433:
	nop
	nop
	nop
	j	bnei_cont.33429

bnei_else.33428:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33429:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33436

	nop
	nop
	nop
	j	bnei_cont.33437

bnei_else.33436:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33438

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33439

bnei_else.33438:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33439:
bnei_cont.33437:
bnei_cont.33403:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33440

	add	%v0, %zero, %zero
	nop
	nop
	jr	%ra

bnei_else.33440:
	addi	%a0, %s0, 1
	nop
	nop
	nop

	addi	%v0, %a0, 0
	nop
	nop
	j	check_all_inside.2907

bnei_else.33401:
	add	%v0, %zero, %k1
	nop
	nop
	jr	%ra

bnei_else.33361:
	add	%v0, %zero, %k1
	nop
	nop
	jr	%ra

shadow_check_and_group.2913:
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra
	nop
	nop

	add	%at, %v1, %s1
	nop
	nop
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%ra, -1, bnei_else.33638

	lw	%a2, 12(%ra)
	flw	%f19, 138(%zero)
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
	flw	%f16, 139(%zero)
	nop
	nop

	flw	%f0, 1(%a0)
	flw	%f18, 140(%zero)
	fsub	%f21, %f19, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%ra, 187(%ra)
	fsub	%f22, %f16, %f0
	nop

	nop
	nop
	fsub	%f23, %f18, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33639

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33641

	flw	%f20, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f20, %fzero, fbeq_else.33643

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.33644

fbeq_else.33643:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33644:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33645

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33640

bnei_else.33645:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 0(%k0)
	nop
	fadd	%f2, %f1, %f0
	fmul	%f1, %f21, %f21

	flw	%f0, 1(%k0)
	nop
	fmul	%f17, %f1, %f0
	fmul	%f1, %f22, %f22

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f23, %f23

	flw	%f0, 2(%k0)
	nop
	fadd	%f17, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33647

	flw	%f1, 0(%a3)
	nop
	fmul	%f17, %f22, %f23
	nop

	nop
	nop
	fmul	%f1, %f17, %f1
	nop

	flw	%f0, 1(%a3)
	nop
	fadd	%f17, %f0, %f1
	fmul	%f1, %f23, %f21

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f21, %f22

	flw	%f0, 2(%a3)
	nop
	fadd	%f17, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	j	bnei_cont.33648

bnei_else.33647:
bnei_cont.33648:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33649

	nop
	nop
	nop
	j	bnei_cont.33650

bnei_else.33649:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.33650:
	nop
	nop
	fmul	%f1, %f2, %f2
	fmul	%f0, %f20, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.33651

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33652

fbgt_else.33651:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33652:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33653

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33655

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.33656

bnei_else.33655:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.33656:
	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.33640

bnei_else.33653:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33654:
bnei_cont.33646:
	nop
	nop
	nop
	j	bnei_cont.33640

bnei_else.33641:
	flw	%f0, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.33657

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33658

fbgt_else.33657:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33658:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33659

	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.33640

bnei_else.33659:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33660:
bnei_cont.33642:
	nop
	nop
	nop
	j	bnei_cont.33640

bnei_else.33639:
	flw	%f0, 0(%ra)
	flw	%f20, 1(%ra)
	nop
	nop

	flw	%f2, 185(%zero)
	flw	%f17, 1(%k0)
	fsub	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f24, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f24, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f22
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.33661

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33662

fbgt_else.33661:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33662:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33663

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f24, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f23
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33665

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33666

fbgt_else.33665:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33666:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33667

	nop
	nop
	nop
	fbne	%f20, %fzero, fbeq_else.33669

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.33670

fbeq_else.33669:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33670:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33671

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33664

bnei_else.33671:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33672:
	nop
	nop
	nop
	j	bnei_cont.33664

bnei_else.33667:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33668:
	nop
	nop
	nop
	j	bnei_cont.33664

bnei_else.33663:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33664:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33673

	fsw	%f24, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.33674

bnei_else.33673:
	flw	%f0, 2(%ra)
	flw	%f25, 3(%ra)
	nop
	nop

	flw	%f24, 184(%zero)
	flw	%f20, 0(%k0)
	fsub	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f26, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f26, %f24
	nop

	nop
	nop
	fadd	%f0, %f0, %f21
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.33675

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33676

fbgt_else.33675:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33676:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33677

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f26, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f23
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33679

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33680

fbgt_else.33679:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33680:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33681

	nop
	nop
	nop
	fbne	%f25, %fzero, fbeq_else.33683

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.33684

fbeq_else.33683:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33684:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33685

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33678

bnei_else.33685:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33686:
	nop
	nop
	nop
	j	bnei_cont.33678

bnei_else.33681:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33682:
	nop
	nop
	nop
	j	bnei_cont.33678

bnei_else.33677:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33678:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33687

	fsw	%f26, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 2
	nop
	nop
	j	bnei_cont.33688

bnei_else.33687:
	flw	%f0, 4(%ra)
	nop
	nop
	nop

	flw	%f23, 5(%ra)
	nop
	fsub	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f1, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f1, %f24
	nop

	nop
	nop
	fadd	%f0, %f0, %f21
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.33689

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33690

fbgt_else.33689:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33690:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33691

	nop
	nop
	fmul	%f0, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f22
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.33693

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33694

fbgt_else.33693:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33694:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33695

	nop
	nop
	nop
	fbne	%f23, %fzero, fbeq_else.33697

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.33698

fbeq_else.33697:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33698:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33699

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33692

bnei_else.33699:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33700:
	nop
	nop
	nop
	j	bnei_cont.33692

bnei_else.33695:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33696:
	nop
	nop
	nop
	j	bnei_cont.33692

bnei_else.33691:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33692:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33701

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 3
	nop
	nop
	j	bnei_cont.33702

bnei_else.33701:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33702:
bnei_cont.33688:
bnei_cont.33674:
bnei_cont.33640:
	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33703

	flw	%f0, 467(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33705

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33704

fbgt_else.33705:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33706:
	nop
	nop
	nop
	j	bnei_cont.33704

bnei_else.33703:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33704:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33707

	flw	%f0, 466(%zero)
	lw	%a0, 0(%v1)
	nop
	nop

	flw	%f0, 78(%zero)
	flw	%f1, 79(%zero)
	fadd	%f17, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	fmul	%f1, %f1, %f17

	flw	%f16, 80(%zero)
	nop
	fadd	%f0, %f0, %f19
	fadd	%f1, %f1, %f16

	nop
	nop
	fmul	%f16, %f16, %f17
	nop

	nop
	nop
	fadd	%f2, %f16, %f18
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33708

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

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	nop
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33710

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33712

	flw	%f16, 0(%k0)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%k0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33714

	flw	%f17, 0(%a3)
	nop
	fmul	%f18, %f20, %f21
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a3)
	nop
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a3)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.33715

bnei_else.33714:
bnei_cont.33715:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33716

	nop
	nop
	nop
	j	bnei_cont.33717

bnei_else.33716:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.33717:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.33718

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33719

fbgt_else.33718:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33719:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33720

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33722

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33721

bnei_else.33722:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33723:
	nop
	nop
	nop
	j	bnei_cont.33721

bnei_else.33720:
bnei_cont.33721:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33724

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33711

bnei_else.33724:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33725:
	nop
	nop
	nop
	j	bnei_cont.33711

bnei_else.33712:
	flw	%f16, 0(%k0)
	nop
	nop
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%k0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.33726

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33727

fbgt_else.33726:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33727:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33728

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33730

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33729

bnei_else.33730:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33731:
	nop
	nop
	nop
	j	bnei_cont.33729

bnei_else.33728:
bnei_cont.33729:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33732

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33711

bnei_else.33732:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33733:
bnei_cont.33713:
	nop
	nop
	nop
	j	bnei_cont.33711

bnei_else.33710:
	flw	%f16, 0(%k0)
	nop
	fabs	%f17, %f19
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.33734

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33735

fbgt_else.33734:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33735:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33736

	flw	%f16, 1(%k0)
	nop
	fabs	%f17, %f20
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.33738

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33739

fbgt_else.33738:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33739:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33740

	flw	%f16, 2(%k0)
	nop
	fabs	%f17, %f21
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.33742

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33737

fbgt_else.33742:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33743:
	nop
	nop
	nop
	j	bnei_cont.33737

bnei_else.33740:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33741:
	nop
	nop
	nop
	j	bnei_cont.33737

bnei_else.33736:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33737:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33744

	nop
	nop
	nop
	j	bnei_cont.33745

bnei_else.33744:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33746

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.33747

bnei_else.33746:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.33747:
bnei_cont.33745:
bnei_cont.33711:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33748

	add	%v0, %zero, %zero
	nop
	nop
	j	bnei_cont.33709

bnei_else.33748:
	addi	%v0, %k1, 0
	nop
	nop
	jal	check_all_inside.2907

bnei_cont.33749:
	nop
	nop
	nop
	j	bnei_cont.33709

bnei_else.33708:
	add	%v0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33709:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33750

	add	%ra, %zero, %s2
	add	%v0, %zero, %k1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33750:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2
	nop
	j	shadow_check_and_group.2913

bnei_else.33707:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33751

	addi	%v0, %s1, 1
	add	%ra, %zero, %s2
	nop
	j	shadow_check_and_group.2913

bnei_else.33751:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33638:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	nop
	nop

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_group.2916:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %ra
	nop

	add	%at, %s4, %s3
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33796

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33797

	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33797:
	addi	%s3, %s3, 1
	nop
	nop
	nop

	add	%at, %s4, %s3
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33798

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33799

	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33799:
	addi	%s3, %s3, 1
	nop
	nop
	nop

	add	%at, %s4, %s3
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33800

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33801

	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33801:
	addi	%s3, %s3, 1
	nop
	nop
	nop

	add	%at, %s4, %s3
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33802

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33803

	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33803:
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5
	addi	%v1, %s4, 0
	j	shadow_check_one_or_group.2916

bnei_else.33802:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33800:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33798:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33796:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	nop
	nop

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_matrix.2919:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %ra
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

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
	beqi	%k0, -1, bnei_else.33980

	nop
	nop
	nop
	beqi	%k0, 99, bnei_else.33981

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
	fsub	%f19, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f2, %f1, %f0
	nop

	nop
	nop
	fsub	%f20, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.33983

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.33985

	flw	%f18, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.33987

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.33988

fbeq_else.33987:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.33988:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33989

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.33984

bnei_else.33989:
	flw	%f0, 1(%k0)
	nop
	nop
	nop

	flw	%f0, 2(%k0)
	nop
	fmul	%f1, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 3(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 0(%ra)
	nop
	fadd	%f17, %f1, %f0
	fmul	%f1, %f19, %f19

	flw	%f0, 1(%ra)
	nop
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f20

	flw	%f0, 2(%ra)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33991

	flw	%f1, 0(%a2)
	nop
	fmul	%f16, %f2, %f20
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a2)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f20, %f19

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f19, %f2

	flw	%f0, 2(%a2)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.33992

bnei_else.33991:
bnei_cont.33992:
	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.33993

	nop
	nop
	nop
	j	bnei_cont.33994

bnei_else.33993:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.33994:
	nop
	nop
	fmul	%f1, %f17, %f17
	fmul	%f0, %f18, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.33995

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.33996

fbgt_else.33995:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.33996:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33997

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33999

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%k0)
	nop
	fadd	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.34000

bnei_else.33999:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%k0)
	nop
	fsub	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.34000:
	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.33984

bnei_else.33997:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.33998:
bnei_cont.33990:
	nop
	nop
	nop
	j	bnei_cont.33984

bnei_else.33985:
	flw	%f0, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.34001

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34002

fbgt_else.34001:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34002:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34003

	flw	%f0, 1(%k0)
	nop
	nop
	nop

	flw	%f0, 2(%k0)
	nop
	fmul	%f1, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 3(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.33984

bnei_else.34003:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34004:
bnei_cont.33986:
	nop
	nop
	nop
	j	bnei_cont.33984

bnei_else.33983:
	flw	%f0, 0(%k0)
	flw	%f21, 1(%k0)
	nop
	nop

	flw	%f17, 185(%zero)
	flw	%f16, 1(%ra)
	fsub	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f18, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.34005

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34006

fbgt_else.34005:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34006:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34007

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f18, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34009

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34010

fbgt_else.34009:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34010:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34011

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.34013

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.34014

fbeq_else.34013:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.34014:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34015

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34008

bnei_else.34015:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.34016:
	nop
	nop
	nop
	j	bnei_cont.34008

bnei_else.34011:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34012:
	nop
	nop
	nop
	j	bnei_cont.34008

bnei_else.34007:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34008:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34017

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.34018

bnei_else.34017:
	flw	%f0, 2(%k0)
	flw	%f23, 3(%k0)
	nop
	nop

	flw	%f21, 184(%zero)
	flw	%f18, 0(%ra)
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f22, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f22, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.34019

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34020

fbgt_else.34019:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34020:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34021

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f22, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34023

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34024

fbgt_else.34023:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34024:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34025

	nop
	nop
	nop
	fbne	%f23, %fzero, fbeq_else.34027

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.34028

fbeq_else.34027:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.34028:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34029

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34022

bnei_else.34029:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.34030:
	nop
	nop
	nop
	j	bnei_cont.34022

bnei_else.34025:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34026:
	nop
	nop
	nop
	j	bnei_cont.34022

bnei_else.34021:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34022:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34031

	fsw	%f22, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 2
	nop
	nop
	j	bnei_cont.34032

bnei_else.34031:
	flw	%f0, 4(%k0)
	nop
	nop
	nop

	flw	%f20, 5(%k0)
	nop
	fsub	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f1, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f1, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.34033

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34034

fbgt_else.34033:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34034:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34035

	nop
	nop
	fmul	%f0, %f1, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.34037

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34038

fbgt_else.34037:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34038:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34039

	nop
	nop
	nop
	fbne	%f20, %fzero, fbeq_else.34041

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.34042

fbeq_else.34041:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.34042:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34043

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34036

bnei_else.34043:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.34044:
	nop
	nop
	nop
	j	bnei_cont.34036

bnei_else.34039:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34040:
	nop
	nop
	nop
	j	bnei_cont.34036

bnei_else.34035:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34036:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34045

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 3
	nop
	nop
	j	bnei_cont.34046

bnei_else.34045:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34046:
bnei_cont.34032:
bnei_cont.34018:
bnei_cont.33984:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34047

	flw	%f1, 135(%zero)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34049

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34050

fbgt_else.34049:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34050:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34051

	lw	%a0, 1(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34053

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34055

	add	%v0, %zero, %k1
	nop
	nop
	j	bnei_cont.34054

bnei_else.34055:
	lw	%a0, 2(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34057

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34059

	add	%v0, %zero, %k1
	nop
	nop
	j	bnei_cont.34054

bnei_else.34059:
	lw	%a0, 3(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34061

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34063

	add	%v0, %zero, %k1
	nop
	nop
	j	bnei_cont.34054

bnei_else.34063:
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0
	nop
	jal	shadow_check_one_or_group.2916

bnei_cont.34064:
	nop
	nop
	nop
	j	bnei_cont.34054

bnei_else.34061:
	add	%v0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34062:
bnei_cont.34060:
	nop
	nop
	nop
	j	bnei_cont.34054

bnei_else.34057:
	add	%v0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34058:
bnei_cont.34056:
	nop
	nop
	nop
	j	bnei_cont.34054

bnei_else.34053:
	add	%v0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34054:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34065

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.33982

bnei_else.34065:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34066:
	nop
	nop
	nop
	j	bnei_cont.33982

bnei_else.34051:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34052:
	nop
	nop
	nop
	j	bnei_cont.33982

bnei_else.34047:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34048:
	nop
	nop
	nop
	j	bnei_cont.33982

bnei_else.33981:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.33982:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34067

	lw	%a0, 1(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34068

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34070

	add	%v0, %zero, %k1
	nop
	nop
	j	bnei_cont.34069

bnei_else.34070:
	lw	%a0, 2(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34072

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34074

	add	%v0, %zero, %k1
	nop
	nop
	j	bnei_cont.34069

bnei_else.34074:
	lw	%a0, 3(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34076

	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34078

	add	%v0, %zero, %k1
	nop
	nop
	j	bnei_cont.34069

bnei_else.34078:
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0
	nop
	jal	shadow_check_one_or_group.2916

bnei_cont.34079:
	nop
	nop
	nop
	j	bnei_cont.34069

bnei_else.34076:
	add	%v0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34077:
bnei_cont.34075:
	nop
	nop
	nop
	j	bnei_cont.34069

bnei_else.34072:
	add	%v0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34073:
bnei_cont.34071:
	nop
	nop
	nop
	j	bnei_cont.34069

bnei_else.34068:
	add	%v0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34069:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34080

	add	%ra, %zero, %t7
	add	%v0, %zero, %k1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34080:
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919

bnei_else.34067:
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919

bnei_else.33980:
	add	%ra, %zero, %t7
	add	%v0, %zero, %zero
	nop
	nop

	nop
	nop
	nop
	jr	%ra

solve_each_element.2922:
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0
	add	%s3, %zero, %ra
	nop

	add	%at, %v1, %s1
	nop
	nop
	nop

	lw	%s4, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s4, -1, bnei_else.34328

	lw	%a3, 12(%s4)
	flw	%f19, 159(%zero)
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
	flw	%f18, 160(%zero)
	nop
	nop

	flw	%f0, 1(%a0)
	flw	%f17, 161(%zero)
	fsub	%f2, %f19, %f0
	nop

	flw	%f0, 2(%a0)
	nop
	fsub	%f21, %f18, %f0
	nop

	nop
	nop
	fsub	%f20, %f17, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.34329

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.34331

	flw	%f28, 0(%s2)
	flw	%f26, 1(%s2)
	nop
	nop

	flw	%f29, 2(%s2)
	flw	%f25, 0(%a1)
	fmul	%f0, %f28, %f28
	nop

	flw	%f24, 1(%a1)
	flw	%f23, 2(%a1)
	fmul	%f1, %f0, %f25
	fmul	%f0, %f26, %f26

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f29, %f29

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.34333

	flw	%f1, 0(%fp)
	nop
	fmul	%f16, %f26, %f29
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%fp)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f29, %f28

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f28, %f26

	flw	%f0, 2(%fp)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.34334

bnei_else.34333:
bnei_cont.34334:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.34335

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.34336

fbeq_else.34335:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.34336:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34337

	add	%s5, %zero, %zero
	nop
	nop
	j	bnei_cont.34330

bnei_else.34337:
	nop
	nop
	fmul	%f1, %f28, %f2
	nop

	nop
	nop
	fmul	%f16, %f1, %f25
	fmul	%f1, %f26, %f21

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fadd	%f16, %f16, %f1
	fmul	%f1, %f29, %f20

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.34339

	nop
	nop
	fmul	%f22, %f29, %f21
	fmul	%f16, %f26, %f20

	flw	%f16, 0(%fp)
	nop
	fadd	%f22, %f22, %f16
	nop

	nop
	nop
	fmul	%f27, %f22, %f16
	fmul	%f22, %f28, %f20

	nop
	nop
	fmul	%f16, %f29, %f2
	nop

	flw	%f16, 1(%fp)
	nop
	fadd	%f22, %f22, %f16
	nop

	nop
	nop
	fmul	%f16, %f22, %f16
	fmul	%f22, %f28, %f21

	nop
	nop
	fadd	%f27, %f27, %f16
	fmul	%f16, %f26, %f2

	flw	%f16, 2(%fp)
	nop
	fadd	%f22, %f22, %f16
	nop

	nop
	nop
	fmul	%f16, %f22, %f16
	nop

	flw	%f16, 474(%zero)
	nop
	fadd	%f22, %f27, %f16
	nop

	nop
	nop
	fmul	%f16, %f22, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f16
	j	bnei_cont.34340

bnei_else.34339:
bnei_cont.34340:
	nop
	nop
	fmul	%f16, %f2, %f2
	nop

	nop
	nop
	fmul	%f22, %f16, %f25
	fmul	%f16, %f21, %f21

	nop
	nop
	fmul	%f16, %f16, %f24
	nop

	nop
	nop
	fadd	%f22, %f22, %f16
	fmul	%f16, %f20, %f20

	nop
	nop
	fmul	%f16, %f16, %f23
	nop

	nop
	nop
	fadd	%f16, %f22, %f16
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.34341

	flw	%f22, 0(%fp)
	nop
	fmul	%f23, %f21, %f20
	fmul	%f20, %f20, %f2

	nop
	nop
	fmul	%f22, %f23, %f22
	fmul	%f2, %f2, %f21

	flw	%f16, 1(%fp)
	nop
	fadd	%f22, %f16, %f22
	nop

	nop
	nop
	fmul	%f16, %f20, %f16
	nop

	flw	%f16, 2(%fp)
	nop
	fadd	%f20, %f22, %f16
	nop

	nop
	nop
	fmul	%f16, %f2, %f16
	nop

	nop
	nop
	fadd	%f16, %f20, %f16
	j	bnei_cont.34342

bnei_else.34341:
bnei_cont.34342:
	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.34343

	nop
	nop
	nop
	j	bnei_cont.34344

bnei_else.34343:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.34344:
	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f16, %f0, %f16

	nop
	nop
	fsub	%f16, %f2, %f16
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.34345

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34346

fbgt_else.34345:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34346:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34347

	nop
	nop
	fsqrt	%f16, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34349

	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34349:
	nop
	nop
	fneg	%f16, %f16
	nop

bnei_cont.34350:
	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	add	%s5, %zero, %k1
	nop
	nop
	j	bnei_cont.34330

bnei_else.34347:
	add	%s5, %zero, %zero
	nop
	nop
	nop

bnei_cont.34348:
bnei_cont.34338:
	nop
	nop
	nop
	j	bnei_cont.34330

bnei_else.34331:
	flw	%f0, 0(%s2)
	flw	%f24, 0(%a1)
	nop
	nop

	flw	%f0, 1(%s2)
	flw	%f23, 1(%a1)
	fmul	%f1, %f0, %f24
	nop

	flw	%f22, 2(%a1)
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 2(%s2)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.34351

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34352

fbgt_else.34351:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34352:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34353

	nop
	nop
	fmul	%f1, %f24, %f2
	fmul	%f0, %f23, %f21

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f22, %f20

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
	fdiv	%f0, %f0, %f16
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	add	%s5, %zero, %k1
	nop
	nop
	j	bnei_cont.34330

bnei_else.34353:
	add	%s5, %zero, %zero
	nop
	nop
	nop

bnei_cont.34354:
bnei_cont.34332:
	nop
	nop
	nop
	j	bnei_cont.34330

bnei_else.34329:
	flw	%f22, 0(%s2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f22, %fzero, fbeq_else.34355

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.34356

fbeq_else.34355:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.34356:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34357

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34358

bnei_else.34357:
	nop
	nop
	nop
	fblt	%f22, %fzero, fbgt_else.34359

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34360

fbgt_else.34359:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34360:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34361

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34363

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34362

bnei_else.34363:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.34364:
	nop
	nop
	nop
	j	bnei_cont.34362

bnei_else.34361:
bnei_cont.34362:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34365

	nop
	nop
	nop
	j	bnei_cont.34366

bnei_else.34365:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34366:
	nop
	nop
	fsub	%f0, %f0, %f2
	nop

	flw	%f0, 1(%s2)
	nop
	fdiv	%f16, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f21
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34367

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34368

fbgt_else.34367:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34368:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34369

	flw	%f0, 2(%s2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34371

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34372

fbgt_else.34371:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34372:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34373

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.34370

bnei_else.34373:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34374:
	nop
	nop
	nop
	j	bnei_cont.34370

bnei_else.34369:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34370:
bnei_cont.34358:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34375

	add	%s5, %zero, %k1
	nop
	nop
	j	bnei_cont.34376

bnei_else.34375:
	flw	%f16, 1(%s2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.34377

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.34378

fbeq_else.34377:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.34378:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34379

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34380

bnei_else.34379:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.34381

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34382

fbgt_else.34381:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34382:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34383

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34385

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34384

bnei_else.34385:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.34386:
	nop
	nop
	nop
	j	bnei_cont.34384

bnei_else.34383:
bnei_cont.34384:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34387

	nop
	nop
	nop
	j	bnei_cont.34388

bnei_else.34387:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34388:
	nop
	nop
	fsub	%f0, %f0, %f21
	nop

	flw	%f0, 2(%s2)
	nop
	fdiv	%f23, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f23, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34389

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34389:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34390:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34391

	nop
	nop
	fmul	%f0, %f23, %f22
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34393

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34394

fbgt_else.34393:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34394:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34395

	fsw	%f23, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.34392

bnei_else.34395:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34396:
	nop
	nop
	nop
	j	bnei_cont.34392

bnei_else.34391:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34392:
bnei_cont.34380:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34397

	addi	%s5, %zero, 2
	nop
	nop
	j	bnei_cont.34398

bnei_else.34397:
	flw	%f1, 2(%s2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.34399

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.34400

fbeq_else.34399:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.34400:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34401

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34402

bnei_else.34401:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.34403

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34404

fbgt_else.34403:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34404:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34405

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34407

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34406

bnei_else.34407:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.34408:
	nop
	nop
	nop
	j	bnei_cont.34406

bnei_else.34405:
bnei_cont.34406:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34409

	nop
	nop
	nop
	j	bnei_cont.34410

bnei_else.34409:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34410:
	nop
	nop
	fsub	%f0, %f0, %f20
	nop

	nop
	nop
	fdiv	%f20, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f20, %f22
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34411

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34412

fbgt_else.34411:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34412:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34413

	nop
	nop
	fmul	%f0, %f20, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f21
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34415

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34416

fbgt_else.34415:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34416:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34417

	fsw	%f20, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.34414

bnei_else.34417:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34418:
	nop
	nop
	nop
	j	bnei_cont.34414

bnei_else.34413:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34414:
bnei_cont.34402:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34419

	addi	%s5, %zero, 3
	nop
	nop
	j	bnei_cont.34420

bnei_else.34419:
	add	%s5, %zero, %zero
	nop
	nop
	nop

bnei_cont.34420:
bnei_cont.34398:
bnei_cont.34376:
bnei_cont.34330:
	nop
	nop
	nop
	beqi	%s5, 0, bnei_else.34421

	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.34422

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34423

fbgt_else.34422:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34423:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34424

	flw	%f0, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34426

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34427

fbgt_else.34426:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34427:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.34425

	flw	%f0, 466(%zero)
	flw	%f16, 2(%s2)
	nop
	nop

	flw	%f0, 0(%s2)
	flw	%f1, 1(%s2)
	fadd	%f22, %f1, %f0
	nop

	lw	%a0, 0(%v1)
	nop
	fmul	%f0, %f0, %f22
	fmul	%f1, %f1, %f22

	nop
	nop
	fadd	%f0, %f0, %f19
	fadd	%f1, %f1, %f18

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	nop
	nop
	fadd	%f2, %f16, %f17
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34430

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

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	nop
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.34432

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.34434

	flw	%f16, 0(%k0)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%k0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.34436

	flw	%f17, 0(%a3)
	nop
	fmul	%f18, %f20, %f21
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a3)
	nop
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a3)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.34437

bnei_else.34436:
bnei_cont.34437:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.34438

	nop
	nop
	nop
	j	bnei_cont.34439

bnei_else.34438:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.34439:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.34440

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34441

fbgt_else.34440:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34441:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34442

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34444

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34443

bnei_else.34444:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.34445:
	nop
	nop
	nop
	j	bnei_cont.34443

bnei_else.34442:
bnei_cont.34443:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34446

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.34433

bnei_else.34446:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.34447:
	nop
	nop
	nop
	j	bnei_cont.34433

bnei_else.34434:
	flw	%f16, 0(%k0)
	nop
	nop
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%k0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.34448

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34449

fbgt_else.34448:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34449:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34450

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34452

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34451

bnei_else.34452:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.34453:
	nop
	nop
	nop
	j	bnei_cont.34451

bnei_else.34450:
bnei_cont.34451:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34454

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.34433

bnei_else.34454:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.34455:
bnei_cont.34435:
	nop
	nop
	nop
	j	bnei_cont.34433

bnei_else.34432:
	flw	%f16, 0(%k0)
	nop
	fabs	%f17, %f19
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.34456

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34457

fbgt_else.34456:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34457:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34458

	flw	%f16, 1(%k0)
	nop
	fabs	%f17, %f20
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.34460

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.34461

fbgt_else.34460:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34461:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34462

	flw	%f16, 2(%k0)
	nop
	fabs	%f17, %f21
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.34464

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.34459

fbgt_else.34464:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.34465:
	nop
	nop
	nop
	j	bnei_cont.34459

bnei_else.34462:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34463:
	nop
	nop
	nop
	j	bnei_cont.34459

bnei_else.34458:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.34459:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34466

	nop
	nop
	nop
	j	bnei_cont.34467

bnei_else.34466:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34468

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.34469

bnei_else.34468:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.34469:
bnei_cont.34467:
bnei_cont.34433:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34470

	add	%v0, %zero, %zero
	nop
	nop
	j	bnei_cont.34431

bnei_else.34470:
	addi	%v0, %k1, 0
	nop
	nop
	jal	check_all_inside.2907

bnei_cont.34471:
	nop
	nop
	nop
	j	bnei_cont.34431

bnei_else.34430:
	add	%v0, %zero, %k1
	nop
	nop
	nop

bnei_cont.34431:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.34425

	fsw	%f22, 137(%zero)
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
	j	bnei_cont.34425

bnei_else.34472:
bnei_cont.34473:
	nop
	nop
	nop
	j	bnei_cont.34425

bnei_else.34428:
bnei_cont.34429:
	nop
	nop
	nop
	j	bnei_cont.34425

bnei_else.34424:
bnei_cont.34425:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element.2922

bnei_else.34421:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34474

	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element.2922

bnei_else.34474:
	add	%ra, %zero, %s3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34328:
	add	%ra, %zero, %s3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

solve_one_or_network.2926:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34529

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34530

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34531

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34532

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34533

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34534

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34535

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.34536

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922

	addi	%v0, %s6, 1
	add	%ra, %zero, %t8
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0

	nop
	nop
	nop
	j	solve_one_or_network.2926

bnei_else.34536:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34535:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34534:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34533:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34532:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34531:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34530:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34529:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

trace_or_matrix.2930:
	sw	%v0, 0(%sp)
	add	%t9, %zero, %a0
	add	%at, %v1, %v0
	nop

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
	beqi	%a0, -1, bnei_else.35347

	nop
	nop
	nop
	beqi	%a0, 99, bnei_else.35348

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
	fsub	%f19, %f1, %f0
	nop

	flw	%f1, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f2, %f1, %f0
	nop

	nop
	nop
	fsub	%f20, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.35350

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.35352

	flw	%f25, 0(%t9)
	flw	%f24, 1(%t9)
	nop
	nop

	flw	%f26, 2(%t9)
	flw	%f22, 0(%a1)
	fmul	%f0, %f25, %f25
	nop

	flw	%f21, 1(%a1)
	flw	%f18, 2(%a1)
	fmul	%f1, %f0, %f22
	fmul	%f0, %f24, %f24

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f26, %f26

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35354

	flw	%f1, 0(%fp)
	nop
	fmul	%f16, %f24, %f26
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%fp)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f26, %f25

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f25, %f24

	flw	%f0, 2(%fp)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.35355

bnei_else.35354:
bnei_cont.35355:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35356

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35357

fbeq_else.35356:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35357:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35358

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35351

bnei_else.35358:
	nop
	nop
	fmul	%f1, %f25, %f19
	nop

	nop
	nop
	fmul	%f16, %f1, %f22
	fmul	%f1, %f24, %f2

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fadd	%f16, %f16, %f1
	fmul	%f1, %f26, %f20

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35360

	nop
	nop
	fmul	%f17, %f26, %f2
	fmul	%f16, %f24, %f20

	flw	%f16, 0(%fp)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f23, %f17, %f16
	fmul	%f17, %f25, %f20

	nop
	nop
	fmul	%f16, %f26, %f19
	nop

	flw	%f16, 1(%fp)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f25, %f2

	nop
	nop
	fadd	%f23, %f23, %f16
	fmul	%f16, %f24, %f19

	flw	%f16, 2(%fp)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	flw	%f16, 474(%zero)
	nop
	fadd	%f17, %f23, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f16
	j	bnei_cont.35361

bnei_else.35360:
bnei_cont.35361:
	nop
	nop
	fmul	%f16, %f19, %f19
	nop

	nop
	nop
	fmul	%f17, %f16, %f22
	fmul	%f16, %f2, %f2

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f17, %f17, %f16
	fmul	%f16, %f20, %f20

	nop
	nop
	fmul	%f16, %f16, %f18
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35362

	flw	%f17, 0(%fp)
	nop
	fmul	%f18, %f2, %f20
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%fp)
	nop
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f2

	flw	%f16, 2(%fp)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.35363

bnei_else.35362:
bnei_cont.35363:
	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.35364

	nop
	nop
	nop
	j	bnei_cont.35365

bnei_else.35364:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.35365:
	nop
	nop
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16

	nop
	nop
	fsub	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.35366

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35367

fbgt_else.35366:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35367:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35368

	nop
	nop
	fsqrt	%f16, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35370

	nop
	nop
	nop
	j	bnei_cont.35371

bnei_else.35370:
	nop
	nop
	fneg	%f16, %f16
	nop

bnei_cont.35371:
	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35351

bnei_else.35368:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35369:
bnei_cont.35359:
	nop
	nop
	nop
	j	bnei_cont.35351

bnei_else.35352:
	flw	%f0, 0(%t9)
	flw	%f21, 0(%a1)
	nop
	nop

	flw	%f0, 1(%t9)
	flw	%f18, 1(%a1)
	fmul	%f1, %f0, %f21
	nop

	flw	%f17, 2(%a1)
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 2(%t9)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.35372

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35373

fbgt_else.35372:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35373:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35374

	nop
	nop
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20

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
	fdiv	%f0, %f0, %f16
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35351

bnei_else.35374:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35375:
bnei_cont.35353:
	nop
	nop
	nop
	j	bnei_cont.35351

bnei_else.35350:
	flw	%f17, 0(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.35376

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35377

fbeq_else.35376:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35377:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35378

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35379

bnei_else.35378:
	nop
	nop
	nop
	fblt	%f17, %fzero, fbgt_else.35380

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35381

fbgt_else.35380:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35381:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35382

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35384

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35383

bnei_else.35384:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35385:
	nop
	nop
	nop
	j	bnei_cont.35383

bnei_else.35382:
bnei_cont.35383:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35386

	nop
	nop
	nop
	j	bnei_cont.35387

bnei_else.35386:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35387:
	nop
	nop
	fsub	%f0, %f0, %f19
	nop

	flw	%f0, 1(%t9)
	nop
	fdiv	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35388

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35389

fbgt_else.35388:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35389:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35390

	flw	%f0, 2(%t9)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35392

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35393

fbgt_else.35392:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35393:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35394

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35391

bnei_else.35394:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35395:
	nop
	nop
	nop
	j	bnei_cont.35391

bnei_else.35390:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35391:
bnei_cont.35379:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35396

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35397

bnei_else.35396:
	flw	%f16, 1(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.35398

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35399

fbeq_else.35398:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35399:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35400

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35401

bnei_else.35400:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.35402

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35403

fbgt_else.35402:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35403:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35404

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35406

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35405

bnei_else.35406:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35407:
	nop
	nop
	nop
	j	bnei_cont.35405

bnei_else.35404:
bnei_cont.35405:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35408

	nop
	nop
	nop
	j	bnei_cont.35409

bnei_else.35408:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35409:
	nop
	nop
	fsub	%f0, %f0, %f2
	nop

	flw	%f0, 2(%t9)
	nop
	fdiv	%f18, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f18, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35410

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35411

fbgt_else.35410:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35411:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35412

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35414

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35415

fbgt_else.35414:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35415:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35416

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35413

bnei_else.35416:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35417:
	nop
	nop
	nop
	j	bnei_cont.35413

bnei_else.35412:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35413:
bnei_cont.35401:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35418

	addi	%a0, %zero, 2
	nop
	nop
	j	bnei_cont.35419

bnei_else.35418:
	flw	%f1, 2(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35420

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35421

fbeq_else.35420:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35421:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35422

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35423

bnei_else.35422:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35424

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35425

fbgt_else.35424:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35425:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35426

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35428

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35427

bnei_else.35428:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35429:
	nop
	nop
	nop
	j	bnei_cont.35427

bnei_else.35426:
bnei_cont.35427:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35430

	nop
	nop
	nop
	j	bnei_cont.35431

bnei_else.35430:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35431:
	nop
	nop
	fsub	%f0, %f0, %f20
	nop

	nop
	nop
	fdiv	%f18, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35432

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35433

fbgt_else.35432:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35433:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35434

	nop
	nop
	fmul	%f0, %f18, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35436

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35437

fbgt_else.35436:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35437:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35438

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35435

bnei_else.35438:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35439:
	nop
	nop
	nop
	j	bnei_cont.35435

bnei_else.35434:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35435:
bnei_cont.35423:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35440

	addi	%a0, %zero, 3
	nop
	nop
	j	bnei_cont.35441

bnei_else.35440:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35441:
bnei_cont.35419:
bnei_cont.35397:
bnei_cont.35351:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35349

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35444

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35445

fbgt_else.35444:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35445:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35349

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35349

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35349

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35349

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35349

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35349

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35349

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35349

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%v0, %zero, 8
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926

	addi	%sp, %sp, -3
	nop
	nop
	j	bnei_cont.35349

bnei_else.35460:
bnei_cont.35461:
	nop
	nop
	nop
	j	bnei_cont.35349

bnei_else.35458:
bnei_cont.35459:
	nop
	nop
	nop
	j	bnei_cont.35349

bnei_else.35456:
bnei_cont.35457:
	nop
	nop
	nop
	j	bnei_cont.35349

bnei_else.35454:
bnei_cont.35455:
	nop
	nop
	nop
	j	bnei_cont.35349

bnei_else.35452:
bnei_cont.35453:
	nop
	nop
	nop
	j	bnei_cont.35349

bnei_else.35450:
bnei_cont.35451:
	nop
	nop
	nop
	j	bnei_cont.35349

bnei_else.35448:
bnei_cont.35449:
	nop
	nop
	nop
	j	bnei_cont.35349

bnei_else.35446:
bnei_cont.35447:
	nop
	nop
	nop
	j	bnei_cont.35349

bnei_else.35442:
bnei_cont.35443:
	nop
	nop
	nop
	j	bnei_cont.35349

bnei_else.35348:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35462

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35463

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35463

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35463

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35463

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35463

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35463

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%v0, %zero, 8
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926

	addi	%sp, %sp, -3
	nop
	nop
	j	bnei_cont.35463

bnei_else.35474:
bnei_cont.35475:
	nop
	nop
	nop
	j	bnei_cont.35463

bnei_else.35472:
bnei_cont.35473:
	nop
	nop
	nop
	j	bnei_cont.35463

bnei_else.35470:
bnei_cont.35471:
	nop
	nop
	nop
	j	bnei_cont.35463

bnei_else.35468:
bnei_cont.35469:
	nop
	nop
	nop
	j	bnei_cont.35463

bnei_else.35466:
bnei_cont.35467:
	nop
	nop
	nop
	j	bnei_cont.35463

bnei_else.35464:
bnei_cont.35465:
	nop
	nop
	nop
	j	bnei_cont.35463

bnei_else.35462:
bnei_cont.35463:
bnei_cont.35349:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	addi	%a1, %a0, 1
	nop
	nop
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	add	%at, %a0, %a1
	nop
	nop
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
	beqi	%a0, -1, bnei_else.35476

	nop
	nop
	nop
	beqi	%a0, 99, bnei_else.35477

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
	fsub	%f19, %f1, %f0
	nop

	flw	%f1, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f2, %f1, %f0
	nop

	nop
	nop
	fsub	%f20, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.35479

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.35481

	flw	%f25, 0(%t9)
	flw	%f24, 1(%t9)
	nop
	nop

	flw	%f26, 2(%t9)
	flw	%f22, 0(%a1)
	fmul	%f0, %f25, %f25
	nop

	flw	%f21, 1(%a1)
	flw	%f18, 2(%a1)
	fmul	%f1, %f0, %f22
	fmul	%f0, %f24, %f24

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f26, %f26

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35483

	flw	%f1, 0(%fp)
	nop
	fmul	%f16, %f24, %f26
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%fp)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f26, %f25

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f25, %f24

	flw	%f0, 2(%fp)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.35484

bnei_else.35483:
bnei_cont.35484:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35485

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35486

fbeq_else.35485:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35486:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35487

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35480

bnei_else.35487:
	nop
	nop
	fmul	%f1, %f25, %f19
	nop

	nop
	nop
	fmul	%f16, %f1, %f22
	fmul	%f1, %f24, %f2

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fadd	%f16, %f16, %f1
	fmul	%f1, %f26, %f20

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35489

	nop
	nop
	fmul	%f17, %f26, %f2
	fmul	%f16, %f24, %f20

	flw	%f16, 0(%fp)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f23, %f17, %f16
	fmul	%f17, %f25, %f20

	nop
	nop
	fmul	%f16, %f26, %f19
	nop

	flw	%f16, 1(%fp)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f25, %f2

	nop
	nop
	fadd	%f23, %f23, %f16
	fmul	%f16, %f24, %f19

	flw	%f16, 2(%fp)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	flw	%f16, 474(%zero)
	nop
	fadd	%f17, %f23, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f16
	j	bnei_cont.35490

bnei_else.35489:
bnei_cont.35490:
	nop
	nop
	fmul	%f16, %f19, %f19
	nop

	nop
	nop
	fmul	%f17, %f16, %f22
	fmul	%f16, %f2, %f2

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f17, %f17, %f16
	fmul	%f16, %f20, %f20

	nop
	nop
	fmul	%f16, %f16, %f18
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35491

	flw	%f17, 0(%fp)
	nop
	fmul	%f18, %f2, %f20
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%fp)
	nop
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f2

	flw	%f16, 2(%fp)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.35492

bnei_else.35491:
bnei_cont.35492:
	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.35493

	nop
	nop
	nop
	j	bnei_cont.35494

bnei_else.35493:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.35494:
	nop
	nop
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16

	nop
	nop
	fsub	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.35495

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35496

fbgt_else.35495:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35496:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35497

	nop
	nop
	fsqrt	%f16, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35499

	nop
	nop
	nop
	j	bnei_cont.35500

bnei_else.35499:
	nop
	nop
	fneg	%f16, %f16
	nop

bnei_cont.35500:
	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35480

bnei_else.35497:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35498:
bnei_cont.35488:
	nop
	nop
	nop
	j	bnei_cont.35480

bnei_else.35481:
	flw	%f0, 0(%t9)
	flw	%f21, 0(%a1)
	nop
	nop

	flw	%f0, 1(%t9)
	flw	%f18, 1(%a1)
	fmul	%f1, %f0, %f21
	nop

	flw	%f17, 2(%a1)
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 2(%t9)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.35501

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35502

fbgt_else.35501:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35502:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35503

	nop
	nop
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20

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
	fdiv	%f0, %f0, %f16
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35480

bnei_else.35503:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35504:
bnei_cont.35482:
	nop
	nop
	nop
	j	bnei_cont.35480

bnei_else.35479:
	flw	%f17, 0(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.35505

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35506

fbeq_else.35505:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35506:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35507

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35508

bnei_else.35507:
	nop
	nop
	nop
	fblt	%f17, %fzero, fbgt_else.35509

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35510

fbgt_else.35509:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35510:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35511

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35513

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35512

bnei_else.35513:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35514:
	nop
	nop
	nop
	j	bnei_cont.35512

bnei_else.35511:
bnei_cont.35512:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35515

	nop
	nop
	nop
	j	bnei_cont.35516

bnei_else.35515:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35516:
	nop
	nop
	fsub	%f0, %f0, %f19
	nop

	flw	%f0, 1(%t9)
	nop
	fdiv	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35517

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35518

fbgt_else.35517:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35518:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35519

	flw	%f0, 2(%t9)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35521

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35522

fbgt_else.35521:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35522:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35523

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35520

bnei_else.35523:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35524:
	nop
	nop
	nop
	j	bnei_cont.35520

bnei_else.35519:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35520:
bnei_cont.35508:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35525

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35526

bnei_else.35525:
	flw	%f16, 1(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.35527

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35528

fbeq_else.35527:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35528:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35529

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35530

bnei_else.35529:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.35531

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35532

fbgt_else.35531:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35532:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35533

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35535

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35534

bnei_else.35535:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35536:
	nop
	nop
	nop
	j	bnei_cont.35534

bnei_else.35533:
bnei_cont.35534:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35537

	nop
	nop
	nop
	j	bnei_cont.35538

bnei_else.35537:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35538:
	nop
	nop
	fsub	%f0, %f0, %f2
	nop

	flw	%f0, 2(%t9)
	nop
	fdiv	%f18, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f18, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35539

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35540

fbgt_else.35539:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35540:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35541

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35543

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35544

fbgt_else.35543:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35544:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35545

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35542

bnei_else.35545:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35546:
	nop
	nop
	nop
	j	bnei_cont.35542

bnei_else.35541:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35542:
bnei_cont.35530:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35547

	addi	%a0, %zero, 2
	nop
	nop
	j	bnei_cont.35548

bnei_else.35547:
	flw	%f1, 2(%t9)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35549

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35550

fbeq_else.35549:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35550:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35551

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35552

bnei_else.35551:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35553

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35554

fbgt_else.35553:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35554:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35555

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35557

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35556

bnei_else.35557:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35558:
	nop
	nop
	nop
	j	bnei_cont.35556

bnei_else.35555:
bnei_cont.35556:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35559

	nop
	nop
	nop
	j	bnei_cont.35560

bnei_else.35559:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35560:
	nop
	nop
	fsub	%f0, %f0, %f20
	nop

	nop
	nop
	fdiv	%f18, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35561

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35562

fbgt_else.35561:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35562:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35563

	nop
	nop
	fmul	%f0, %f18, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35565

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35566

fbgt_else.35565:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35566:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35567

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.35564

bnei_else.35567:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35568:
	nop
	nop
	nop
	j	bnei_cont.35564

bnei_else.35563:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35564:
bnei_cont.35552:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35569

	addi	%a0, %zero, 3
	nop
	nop
	j	bnei_cont.35570

bnei_else.35569:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35570:
bnei_cont.35548:
bnei_cont.35526:
bnei_cont.35480:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35478

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35573

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35574

fbgt_else.35573:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35574:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35478

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35478

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35478

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35478

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35478

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35478

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35478

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%v0, %zero, 7
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926

	addi	%sp, %sp, -4
	nop
	nop
	j	bnei_cont.35478

bnei_else.35587:
bnei_cont.35588:
	nop
	nop
	nop
	j	bnei_cont.35478

bnei_else.35585:
bnei_cont.35586:
	nop
	nop
	nop
	j	bnei_cont.35478

bnei_else.35583:
bnei_cont.35584:
	nop
	nop
	nop
	j	bnei_cont.35478

bnei_else.35581:
bnei_cont.35582:
	nop
	nop
	nop
	j	bnei_cont.35478

bnei_else.35579:
bnei_cont.35580:
	nop
	nop
	nop
	j	bnei_cont.35478

bnei_else.35577:
bnei_cont.35578:
	nop
	nop
	nop
	j	bnei_cont.35478

bnei_else.35575:
bnei_cont.35576:
	nop
	nop
	nop
	j	bnei_cont.35478

bnei_else.35571:
bnei_cont.35572:
	nop
	nop
	nop
	j	bnei_cont.35478

bnei_else.35477:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35589

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35590

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35590

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35590

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35590

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35590

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	addi	%v0, %zero, 7
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926

	addi	%sp, %sp, -4
	nop
	nop
	j	bnei_cont.35590

bnei_else.35599:
bnei_cont.35600:
	nop
	nop
	nop
	j	bnei_cont.35590

bnei_else.35597:
bnei_cont.35598:
	nop
	nop
	nop
	j	bnei_cont.35590

bnei_else.35595:
bnei_cont.35596:
	nop
	nop
	nop
	j	bnei_cont.35590

bnei_else.35593:
bnei_cont.35594:
	nop
	nop
	nop
	j	bnei_cont.35590

bnei_else.35591:
bnei_cont.35592:
	nop
	nop
	nop
	j	bnei_cont.35590

bnei_else.35589:
bnei_cont.35590:
bnei_cont.35478:
	lw	%a0, 3(%sp)
	lw	%ra, 2(%sp)
	nop
	nop

	addi	%v0, %a0, 1
	lw	%v1, 1(%sp)
	addi	%a0, %t9, 0
	j	trace_or_matrix.2930

bnei_else.35476:
	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35347:
	nop
	nop
	nop
	jr	%ra

solve_each_element_fast.2936:
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0
	add	%s3, %zero, %ra
	nop

	lw	%fp, 1(%s2)
	lw	%a1, 0(%s2)
	add	%at, %v1, %s1
	nop

	lw	%s4, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s4, -1, bnei_else.35802

	lw	%a0, 12(%s4)
	add	%at, %fp, %s4
	nop
	nop

	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	nop
	nop

	lw	%k0, 4(%a0)
	lw	%a0, 1(%a0)
	nop
	nop

	flw	%f2, 0(%a3)
	flw	%f16, 1(%a3)
	nop
	nop

	flw	%f18, 2(%a3)
	lw	%fp, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.35803

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.35805

	flw	%f17, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.35807

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35808

fbeq_else.35807:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35808:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35809

	add	%s5, %zero, %zero
	nop
	nop
	j	bnei_cont.35804

bnei_else.35809:
	flw	%f0, 1(%fp)
	nop
	nop
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f1, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35811

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35812

fbgt_else.35811:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35812:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35813

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35815

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.35816

bnei_else.35815:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.35816:
	add	%s5, %zero, %k1
	nop
	nop
	j	bnei_cont.35804

bnei_else.35813:
	add	%s5, %zero, %zero
	nop
	nop
	nop

bnei_cont.35814:
bnei_cont.35810:
	nop
	nop
	nop
	j	bnei_cont.35804

bnei_else.35805:
	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35817

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35818

fbgt_else.35817:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35818:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35819

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

	add	%s5, %zero, %k1
	nop
	nop
	j	bnei_cont.35804

bnei_else.35819:
	add	%s5, %zero, %zero
	nop
	nop
	nop

bnei_cont.35820:
bnei_cont.35806:
	nop
	nop
	nop
	j	bnei_cont.35804

bnei_else.35803:
	flw	%f0, 0(%fp)
	flw	%f21, 1(%fp)
	nop
	nop

	flw	%f19, 1(%a1)
	flw	%f17, 1(%k0)
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f20, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f20, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.35821

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35822

fbgt_else.35821:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35822:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35823

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35825

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35826

fbgt_else.35825:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35826:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35827

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.35829

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35830

fbeq_else.35829:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35830:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35831

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35824

bnei_else.35831:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35832:
	nop
	nop
	nop
	j	bnei_cont.35824

bnei_else.35827:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35828:
	nop
	nop
	nop
	j	bnei_cont.35824

bnei_else.35823:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35824:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35833

	fsw	%f20, 135(%zero)
	nop
	nop
	nop

	add	%s5, %zero, %k1
	nop
	nop
	j	bnei_cont.35834

bnei_else.35833:
	flw	%f0, 2(%fp)
	flw	%f23, 3(%fp)
	nop
	nop

	flw	%f21, 0(%a1)
	flw	%f20, 0(%k0)
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f22, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f22, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.35835

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35836

fbgt_else.35835:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35836:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35837

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f22, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35839

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35840

fbgt_else.35839:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35840:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35841

	nop
	nop
	nop
	fbne	%f23, %fzero, fbeq_else.35843

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35844

fbeq_else.35843:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35844:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35845

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35838

bnei_else.35845:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35846:
	nop
	nop
	nop
	j	bnei_cont.35838

bnei_else.35841:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35842:
	nop
	nop
	nop
	j	bnei_cont.35838

bnei_else.35837:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35838:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35847

	fsw	%f22, 135(%zero)
	nop
	nop
	nop

	addi	%s5, %zero, 2
	nop
	nop
	j	bnei_cont.35848

bnei_else.35847:
	flw	%f0, 4(%fp)
	nop
	nop
	nop

	flw	%f18, 5(%fp)
	nop
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f1, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f1, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.35849

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35850

fbgt_else.35849:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35850:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35851

	nop
	nop
	fmul	%f0, %f1, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.35853

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35854

fbgt_else.35853:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35854:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35855

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.35857

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.35858

fbeq_else.35857:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.35858:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35859

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35852

bnei_else.35859:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35860:
	nop
	nop
	nop
	j	bnei_cont.35852

bnei_else.35855:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35856:
	nop
	nop
	nop
	j	bnei_cont.35852

bnei_else.35851:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35852:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35861

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	addi	%s5, %zero, 3
	nop
	nop
	j	bnei_cont.35862

bnei_else.35861:
	add	%s5, %zero, %zero
	nop
	nop
	nop

bnei_cont.35862:
bnei_cont.35848:
bnei_cont.35834:
bnei_cont.35804:
	nop
	nop
	nop
	beqi	%s5, 0, bnei_else.35863

	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.35864

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35865

fbgt_else.35864:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35865:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35866

	flw	%f0, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35868

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35869

fbgt_else.35868:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35869:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35867

	flw	%f0, 466(%zero)
	lw	%a0, 0(%v1)
	nop
	nop

	flw	%f0, 0(%a1)
	nop
	fadd	%f22, %f1, %f0
	nop

	flw	%f0, 162(%zero)
	nop
	fmul	%f1, %f0, %f22
	nop

	flw	%f1, 1(%a1)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 163(%zero)
	nop
	fmul	%f16, %f1, %f22
	nop

	flw	%f16, 2(%a1)
	nop
	fadd	%f1, %f16, %f1
	nop

	flw	%f16, 164(%zero)
	nop
	fmul	%f17, %f16, %f22
	nop

	nop
	nop
	fadd	%f2, %f17, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35872

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

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	nop
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.35874

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.35876

	flw	%f16, 0(%k0)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%k0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.35878

	flw	%f17, 0(%a3)
	nop
	fmul	%f18, %f20, %f21
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a3)
	nop
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a3)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.35879

bnei_else.35878:
bnei_cont.35879:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.35880

	nop
	nop
	nop
	j	bnei_cont.35881

bnei_else.35880:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.35881:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.35882

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35883

fbgt_else.35882:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35883:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35884

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35886

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35885

bnei_else.35886:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35887:
	nop
	nop
	nop
	j	bnei_cont.35885

bnei_else.35884:
bnei_cont.35885:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35888

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.35875

bnei_else.35888:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.35889:
	nop
	nop
	nop
	j	bnei_cont.35875

bnei_else.35876:
	flw	%f16, 0(%k0)
	nop
	nop
	nop

	flw	%f16, 1(%k0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%k0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.35890

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35891

fbgt_else.35890:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35891:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35892

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35894

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35893

bnei_else.35894:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35895:
	nop
	nop
	nop
	j	bnei_cont.35893

bnei_else.35892:
bnei_cont.35893:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35896

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.35875

bnei_else.35896:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.35897:
bnei_cont.35877:
	nop
	nop
	nop
	j	bnei_cont.35875

bnei_else.35874:
	flw	%f16, 0(%k0)
	nop
	fabs	%f17, %f19
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.35898

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35899

fbgt_else.35898:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35899:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35900

	flw	%f16, 1(%k0)
	nop
	fabs	%f17, %f20
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.35902

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.35903

fbgt_else.35902:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35903:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35904

	flw	%f16, 2(%k0)
	nop
	fabs	%f17, %f21
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.35906

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.35901

fbgt_else.35906:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.35907:
	nop
	nop
	nop
	j	bnei_cont.35901

bnei_else.35904:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35905:
	nop
	nop
	nop
	j	bnei_cont.35901

bnei_else.35900:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.35901:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35908

	nop
	nop
	nop
	j	bnei_cont.35909

bnei_else.35908:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35910

	add	%a1, %zero, %zero
	nop
	nop
	j	bnei_cont.35911

bnei_else.35910:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.35911:
bnei_cont.35909:
bnei_cont.35875:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35912

	add	%v0, %zero, %zero
	nop
	nop
	j	bnei_cont.35873

bnei_else.35912:
	addi	%v0, %k1, 0
	nop
	nop
	jal	check_all_inside.2907

bnei_cont.35913:
	nop
	nop
	nop
	j	bnei_cont.35873

bnei_else.35872:
	add	%v0, %zero, %k1
	nop
	nop
	nop

bnei_cont.35873:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.35867

	fsw	%f22, 137(%zero)
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
	j	bnei_cont.35867

bnei_else.35914:
bnei_cont.35915:
	nop
	nop
	nop
	j	bnei_cont.35867

bnei_else.35870:
bnei_cont.35871:
	nop
	nop
	nop
	j	bnei_cont.35867

bnei_else.35866:
bnei_cont.35867:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936

bnei_else.35863:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35916

	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936

bnei_else.35916:
	add	%ra, %zero, %s3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35802:
	add	%ra, %zero, %s3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

solve_one_or_network_fast.2940:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35971

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35972

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35973

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35974

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35975

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35976

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35977

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936

	addi	%s6, %s6, 1
	nop
	nop
	nop

	add	%at, %s7, %s6
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35978

	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936

	addi	%v0, %s6, 1
	add	%ra, %zero, %t8
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0

	nop
	nop
	nop
	j	solve_one_or_network_fast.2940

bnei_else.35978:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35977:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35976:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35975:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35974:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35973:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35972:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35971:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

trace_or_matrix_fast.2944:
	sw	%v0, 0(%sp)
	add	%t9, %zero, %a0
	add	%at, %v1, %v0
	nop

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
	beqi	%s0, -1, bnei_else.36597

	nop
	nop
	nop
	beqi	%s0, 99, bnei_else.36598

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

	flw	%f2, 0(%a3)
	flw	%f16, 1(%a3)
	nop
	nop

	flw	%f18, 2(%a3)
	lw	%a0, 1(%t9)
	nop
	nop

	add	%at, %a0, %s0
	nop
	nop
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.36600

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.36602

	flw	%f17, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.36604

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.36605

fbeq_else.36604:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.36605:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36606

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.36601

bnei_else.36606:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.36608

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36609

fbgt_else.36608:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36609:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36610

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36612

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.36613

bnei_else.36612:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.36613:
	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.36601

bnei_else.36610:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36611:
bnei_cont.36607:
	nop
	nop
	nop
	j	bnei_cont.36601

bnei_else.36602:
	flw	%f1, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.36614

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36615

fbgt_else.36614:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36615:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36616

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

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.36601

bnei_else.36616:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36617:
bnei_cont.36603:
	nop
	nop
	nop
	j	bnei_cont.36601

bnei_else.36600:
	flw	%f0, 0(%ra)
	flw	%f21, 1(%ra)
	nop
	nop

	flw	%f19, 1(%k0)
	flw	%f17, 1(%fp)
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f20, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f20, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36618

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36619

fbgt_else.36618:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36619:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36620

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36622

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36623

fbgt_else.36622:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36623:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36624

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.36626

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.36627

fbeq_else.36626:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.36627:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36628

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.36621

bnei_else.36628:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.36629:
	nop
	nop
	nop
	j	bnei_cont.36621

bnei_else.36624:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36625:
	nop
	nop
	nop
	j	bnei_cont.36621

bnei_else.36620:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36621:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36630

	fsw	%f20, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.36631

bnei_else.36630:
	flw	%f0, 2(%ra)
	flw	%f23, 3(%ra)
	nop
	nop

	flw	%f21, 0(%k0)
	flw	%f20, 0(%fp)
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f22, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f22, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.36632

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36633

fbgt_else.36632:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36633:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36634

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f22, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36636

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36637

fbgt_else.36636:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36637:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36638

	nop
	nop
	nop
	fbne	%f23, %fzero, fbeq_else.36640

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.36641

fbeq_else.36640:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.36641:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36642

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.36635

bnei_else.36642:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.36643:
	nop
	nop
	nop
	j	bnei_cont.36635

bnei_else.36638:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36639:
	nop
	nop
	nop
	j	bnei_cont.36635

bnei_else.36634:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36635:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36644

	fsw	%f22, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 2
	nop
	nop
	j	bnei_cont.36645

bnei_else.36644:
	flw	%f0, 4(%ra)
	nop
	nop
	nop

	flw	%f18, 5(%ra)
	nop
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f1, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f1, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.36646

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36647

fbgt_else.36646:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36647:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36648

	nop
	nop
	fmul	%f0, %f1, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36650

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36651

fbgt_else.36650:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36651:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36652

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.36654

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.36655

fbeq_else.36654:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.36655:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36656

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.36649

bnei_else.36656:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.36657:
	nop
	nop
	nop
	j	bnei_cont.36649

bnei_else.36652:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36653:
	nop
	nop
	nop
	j	bnei_cont.36649

bnei_else.36648:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36649:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36658

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 3
	nop
	nop
	j	bnei_cont.36659

bnei_else.36658:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36659:
bnei_cont.36645:
bnei_cont.36631:
bnei_cont.36601:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.36599

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36662

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36663

fbgt_else.36662:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36663:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.36599

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36599

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36599

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36599

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36599

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36599

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36599

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36599

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%v0, %zero, 8
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	addi	%sp, %sp, -3
	nop
	nop
	j	bnei_cont.36599

bnei_else.36678:
bnei_cont.36679:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36676:
bnei_cont.36677:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36674:
bnei_cont.36675:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36672:
bnei_cont.36673:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36670:
bnei_cont.36671:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36668:
bnei_cont.36669:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36666:
bnei_cont.36667:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36664:
bnei_cont.36665:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36660:
bnei_cont.36661:
	nop
	nop
	nop
	j	bnei_cont.36599

bnei_else.36598:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36680

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36681

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36681

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36681

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36681

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36681

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36681

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%v0, %zero, 8
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	addi	%sp, %sp, -3
	nop
	nop
	j	bnei_cont.36681

bnei_else.36692:
bnei_cont.36693:
	nop
	nop
	nop
	j	bnei_cont.36681

bnei_else.36690:
bnei_cont.36691:
	nop
	nop
	nop
	j	bnei_cont.36681

bnei_else.36688:
bnei_cont.36689:
	nop
	nop
	nop
	j	bnei_cont.36681

bnei_else.36686:
bnei_cont.36687:
	nop
	nop
	nop
	j	bnei_cont.36681

bnei_else.36684:
bnei_cont.36685:
	nop
	nop
	nop
	j	bnei_cont.36681

bnei_else.36682:
bnei_cont.36683:
	nop
	nop
	nop
	j	bnei_cont.36681

bnei_else.36680:
bnei_cont.36681:
bnei_cont.36599:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	addi	%a1, %a0, 1
	nop
	nop
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	add	%at, %a0, %a1
	nop
	nop
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
	beqi	%ra, -1, bnei_else.36694

	nop
	nop
	nop
	beqi	%ra, 99, bnei_else.36695

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

	flw	%f2, 0(%a3)
	flw	%f16, 1(%a3)
	nop
	nop

	flw	%f18, 2(%a3)
	lw	%a0, 1(%t9)
	nop
	nop

	add	%at, %a0, %ra
	nop
	nop
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.36697

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.36699

	flw	%f17, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.36701

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.36702

fbeq_else.36701:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.36702:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36703

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.36698

bnei_else.36703:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.36705

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36706

fbgt_else.36705:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36706:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36707

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36709

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.36710

bnei_else.36709:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.36710:
	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.36698

bnei_else.36707:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36708:
bnei_cont.36704:
	nop
	nop
	nop
	j	bnei_cont.36698

bnei_else.36699:
	flw	%f1, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.36711

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36712

fbgt_else.36711:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36712:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36713

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

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.36698

bnei_else.36713:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36714:
bnei_cont.36700:
	nop
	nop
	nop
	j	bnei_cont.36698

bnei_else.36697:
	flw	%f0, 0(%ra)
	flw	%f21, 1(%ra)
	nop
	nop

	flw	%f19, 1(%k0)
	flw	%f17, 1(%fp)
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f20, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f20, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36715

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36716

fbgt_else.36715:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36716:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36717

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36719

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36720

fbgt_else.36719:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36720:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36721

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.36723

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.36724

fbeq_else.36723:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.36724:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36725

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.36718

bnei_else.36725:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.36726:
	nop
	nop
	nop
	j	bnei_cont.36718

bnei_else.36721:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36722:
	nop
	nop
	nop
	j	bnei_cont.36718

bnei_else.36717:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36718:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36727

	fsw	%f20, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.36728

bnei_else.36727:
	flw	%f0, 2(%ra)
	flw	%f23, 3(%ra)
	nop
	nop

	flw	%f21, 0(%k0)
	flw	%f20, 0(%fp)
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f22, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f22, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.36729

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36730

fbgt_else.36729:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36730:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36731

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f22, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36733

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36734

fbgt_else.36733:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36734:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36735

	nop
	nop
	nop
	fbne	%f23, %fzero, fbeq_else.36737

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.36738

fbeq_else.36737:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.36738:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36739

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.36732

bnei_else.36739:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.36740:
	nop
	nop
	nop
	j	bnei_cont.36732

bnei_else.36735:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36736:
	nop
	nop
	nop
	j	bnei_cont.36732

bnei_else.36731:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36732:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36741

	fsw	%f22, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 2
	nop
	nop
	j	bnei_cont.36742

bnei_else.36741:
	flw	%f0, 4(%ra)
	nop
	nop
	nop

	flw	%f18, 5(%ra)
	nop
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f1, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f1, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.36743

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36744

fbgt_else.36743:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36744:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36745

	nop
	nop
	fmul	%f0, %f1, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36747

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36748

fbgt_else.36747:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36748:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36749

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.36751

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.36752

fbeq_else.36751:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.36752:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36753

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.36746

bnei_else.36753:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.36754:
	nop
	nop
	nop
	j	bnei_cont.36746

bnei_else.36749:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36750:
	nop
	nop
	nop
	j	bnei_cont.36746

bnei_else.36745:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36746:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36755

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 3
	nop
	nop
	j	bnei_cont.36756

bnei_else.36755:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.36756:
bnei_cont.36742:
bnei_cont.36728:
bnei_cont.36698:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.36696

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36759

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36760

fbgt_else.36759:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36760:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.36696

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36696

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36696

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36696

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36696

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36696

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36696

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%v0, %zero, 7
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	addi	%sp, %sp, -4
	nop
	nop
	j	bnei_cont.36696

bnei_else.36773:
bnei_cont.36774:
	nop
	nop
	nop
	j	bnei_cont.36696

bnei_else.36771:
bnei_cont.36772:
	nop
	nop
	nop
	j	bnei_cont.36696

bnei_else.36769:
bnei_cont.36770:
	nop
	nop
	nop
	j	bnei_cont.36696

bnei_else.36767:
bnei_cont.36768:
	nop
	nop
	nop
	j	bnei_cont.36696

bnei_else.36765:
bnei_cont.36766:
	nop
	nop
	nop
	j	bnei_cont.36696

bnei_else.36763:
bnei_cont.36764:
	nop
	nop
	nop
	j	bnei_cont.36696

bnei_else.36761:
bnei_cont.36762:
	nop
	nop
	nop
	j	bnei_cont.36696

bnei_else.36757:
bnei_cont.36758:
	nop
	nop
	nop
	j	bnei_cont.36696

bnei_else.36695:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36775

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36776

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36776

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36776

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36776

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.36776

	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%v0, %zero, 7
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	addi	%sp, %sp, -4
	nop
	nop
	j	bnei_cont.36776

bnei_else.36785:
bnei_cont.36786:
	nop
	nop
	nop
	j	bnei_cont.36776

bnei_else.36783:
bnei_cont.36784:
	nop
	nop
	nop
	j	bnei_cont.36776

bnei_else.36781:
bnei_cont.36782:
	nop
	nop
	nop
	j	bnei_cont.36776

bnei_else.36779:
bnei_cont.36780:
	nop
	nop
	nop
	j	bnei_cont.36776

bnei_else.36777:
bnei_cont.36778:
	nop
	nop
	nop
	j	bnei_cont.36776

bnei_else.36775:
bnei_cont.36776:
bnei_cont.36696:
	lw	%a0, 3(%sp)
	lw	%ra, 2(%sp)
	nop
	nop

	addi	%v0, %a0, 1
	lw	%v1, 1(%sp)
	addi	%a0, %t9, 0
	j	trace_or_matrix_fast.2944

bnei_else.36694:
	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36597:
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
	beqi	%a2, 1, bnei_else.36925

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.36926

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.36927

	nop
	nop
	nop
	beqi	%a2, 4, bnei_else.36928

	nop
	nop
	nop
	jr	%ra

bnei_else.36928:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f0, 0(%a1)
	flw	%f16, 464(%zero)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fmul	%f19, %f1, %f0
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
	fmul	%f18, %f1, %f0
	fmul	%f1, %f19, %f19

	nop
	nop
	fmul	%f0, %f18, %f18
	nop

	nop
	nop
	fadd	%f17, %f1, %f0
	fabs	%f0, %f19

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.36930

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36931

fbgt_else.36930:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36931:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36932

	flw	%f1, 463(%zero)
	nop
	nop
	j	bnei_cont.36933

bnei_else.36932:
	nop
	nop
	fdiv	%f0, %f18, %f19
	nop

	nop
	nop
	fabs	%f2, %f0
	nop

	nop
	nop
	nop
	fblt	%f2, %fzero, fbgt_else.36934

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.36935

fbgt_else.36934:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.36935:
	flw	%f0, 462(%zero)
	nop
	fabs	%f19, %f2
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_else.36936

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_else.36938

	flw	%f18, 480(%zero)
	flw	%f0, 461(%zero)
	fdiv	%f20, %f30, %f19
	nop

	nop
	nop
	fmul	%f21, %f20, %f20
	fmul	%f0, %f0, %f20

	nop
	nop
	fmul	%f2, %f21, %f21
	fmul	%f0, %f0, %f21

	flw	%f0, 460(%zero)
	nop
	fmul	%f19, %f2, %f2
	fsub	%f1, %f20, %f0

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
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
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f18, %f0
	j	fbgt_cont.36939

fbgt_else.36938:
	flw	%f18, 479(%zero)
	nop
	fsub	%f1, %f19, %f30
	fadd	%f0, %f19, %f30

	flw	%f0, 461(%zero)
	nop
	fdiv	%f20, %f1, %f0
	nop

	nop
	nop
	fmul	%f21, %f20, %f20
	fmul	%f0, %f0, %f20

	nop
	nop
	fmul	%f2, %f21, %f21
	fmul	%f0, %f0, %f21

	flw	%f0, 460(%zero)
	nop
	fmul	%f19, %f2, %f2
	fsub	%f1, %f20, %f0

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
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
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

fbgt_cont.36939:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36940

	nop
	nop
	nop
	j	fbgt_cont.36937

bnei_else.36940:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.36941:
	nop
	nop
	nop
	j	fbgt_cont.36937

fbgt_else.36936:
	flw	%f0, 461(%zero)
	nop
	fmul	%f20, %f2, %f2
	nop

	nop
	nop
	fmul	%f19, %f20, %f20
	fmul	%f0, %f0, %f2

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f0, %f0, %f20

	flw	%f0, 460(%zero)
	nop
	fsub	%f1, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
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
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.36937:
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

bnei_cont.36933:
	nop
	nop
	floor	%f0, %f1
	nop

	flw	%f1, 1(%v1)
	flw	%f0, 1(%a3)
	fsub	%f18, %f1, %f0
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
	fabs	%f0, %f17

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.36942

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36943

fbgt_else.36942:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36943:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36944

	flw	%f1, 463(%zero)
	nop
	nop
	j	bnei_cont.36945

bnei_else.36944:
	nop
	nop
	fdiv	%f0, %f1, %f17
	nop

	nop
	nop
	fabs	%f19, %f0
	nop

	nop
	nop
	nop
	fblt	%f19, %fzero, fbgt_else.36946

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.36947

fbgt_else.36946:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.36947:
	flw	%f0, 462(%zero)
	nop
	fabs	%f17, %f19
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_else.36948

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_else.36950

	flw	%f16, 480(%zero)
	flw	%f0, 461(%zero)
	fdiv	%f2, %f30, %f17
	nop

	nop
	nop
	fmul	%f20, %f2, %f2
	fmul	%f0, %f0, %f2

	nop
	nop
	fmul	%f19, %f20, %f20
	fmul	%f0, %f0, %f20

	flw	%f0, 460(%zero)
	nop
	fmul	%f17, %f19, %f19
	fsub	%f1, %f2, %f0

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
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
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f16, %f0
	j	fbgt_cont.36951

fbgt_else.36950:
	flw	%f16, 479(%zero)
	nop
	fsub	%f1, %f17, %f30
	fadd	%f0, %f17, %f30

	flw	%f0, 461(%zero)
	nop
	fdiv	%f2, %f1, %f0
	nop

	nop
	nop
	fmul	%f20, %f2, %f2
	fmul	%f0, %f0, %f2

	nop
	nop
	fmul	%f19, %f20, %f20
	fmul	%f0, %f0, %f20

	flw	%f0, 460(%zero)
	nop
	fmul	%f17, %f19, %f19
	fsub	%f1, %f2, %f0

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
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
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

fbgt_cont.36951:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36952

	nop
	nop
	nop
	j	fbgt_cont.36949

bnei_else.36952:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.36953:
	nop
	nop
	nop
	j	fbgt_cont.36949

fbgt_else.36948:
	flw	%f0, 461(%zero)
	nop
	fmul	%f2, %f19, %f19
	nop

	nop
	nop
	fmul	%f17, %f2, %f2
	fmul	%f0, %f0, %f19

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f2

	flw	%f0, 460(%zero)
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

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.36949:
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

bnei_cont.36945:
	flw	%f16, 474(%zero)
	nop
	floor	%f0, %f1
	nop

	flw	%f1, 452(%zero)
	nop
	fsub	%f17, %f1, %f0
	fsub	%f0, %f16, %f18

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	fsub	%f0, %f16, %f17

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
	fblt	%f0, %fzero, fbgt_else.36954

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36955

fbgt_else.36954:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36955:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36956

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.36957

bnei_else.36956:
bnei_cont.36957:
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

bnei_else.36927:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fsub	%f16, %f1, %f0
	nop

	flw	%f17, 482(%zero)
	nop
	fsub	%f0, %f1, %f0
	fmul	%f1, %f16, %f16

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
	fabs	%f16, %f0
	nop

	nop
	nop
	fdiv	%f0, %f16, %f1
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
	fsub	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36959

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36960

fbgt_else.36959:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36960:
	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36961

	nop
	nop
	fsub	%f0, %f0, %f17
	j	fbgt_cont.36962

fbgt_else.36961:
fbgt_cont.36962:
	flw	%f16, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.36963

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36965

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36964

bnei_else.36965:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.36966:
	nop
	nop
	nop
	j	fbgt_cont.36964

fbgt_else.36963:
fbgt_cont.36964:
	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.36967

	nop
	nop
	fsub	%f0, %f17, %f0
	j	fbgt_cont.36968

fbgt_else.36967:
fbgt_cont.36968:
	flw	%f1, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36969

	flw	%f0, 474(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
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
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.36970

fbgt_else.36969:
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
	fmul	%f16, %f17, %f17
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
	fmul	%f0, %f0, %f16
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
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.36970:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36971

	nop
	nop
	nop
	j	bnei_cont.36972

bnei_else.36971:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.36972:
	flw	%f1, 451(%zero)
	nop
	fmul	%f16, %f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f1
	nop

	fsw	%f0, 146(%zero)
	nop
	fsub	%f0, %f30, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	jr	%ra

bnei_else.36926:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	nop
	nop

	flw	%f17, 482(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.36974

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.36975

fbgt_else.36974:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.36975:
	flw	%f1, 481(%zero)
	nop
	fabs	%f16, %f0
	nop

	nop
	nop
	fdiv	%f0, %f16, %f1
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
	fsub	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36976

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36978

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36977

bnei_else.36978:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.36979:
	nop
	nop
	nop
	j	fbgt_cont.36977

fbgt_else.36976:
fbgt_cont.36977:
	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.36980

	nop
	nop
	fsub	%f0, %f0, %f17
	j	fbgt_cont.36981

fbgt_else.36980:
fbgt_cont.36981:
	flw	%f16, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.36982

	nop
	nop
	fsub	%f0, %f17, %f0
	j	fbgt_cont.36983

fbgt_else.36982:
fbgt_cont.36983:
	flw	%f1, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36984

	flw	%f1, 478(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 477(%zero)
	nop
	fsub	%f16, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 476(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
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
	fsub	%f0, %f16, %f0
	j	fbgt_cont.36985

fbgt_else.36984:
	nop
	nop
	fsub	%f0, %f16, %f0
	nop

	flw	%f0, 474(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
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
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.36985:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36986

	nop
	nop
	nop
	j	bnei_cont.36987

bnei_else.36986:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.36987:
	flw	%f1, 451(%zero)
	nop
	fmul	%f16, %f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f16
	nop

	fsw	%f0, 145(%zero)
	nop
	fsub	%f0, %f30, %f16
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	jr	%ra

bnei_else.36925:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f18, 447(%zero)
	flw	%f17, 446(%zero)
	fsub	%f1, %f1, %f0
	nop

	flw	%f16, 449(%zero)
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.36989

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.36990

fbgt_else.36989:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36990:
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
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.36991

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.36992

fbgt_else.36991:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.36992:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36993

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36995

	flw	%f0, 451(%zero)
	nop
	nop
	j	bnei_cont.36994

bnei_else.36995:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.36996:
	nop
	nop
	nop
	j	bnei_cont.36994

bnei_else.36993:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36997

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.36998

bnei_else.36997:
	flw	%f0, 451(%zero)
	nop
	nop
	nop

bnei_cont.36998:
bnei_cont.36994:
	fsw	%f0, 146(%zero)
	nop
	nop
	jr	%ra

trace_reflections.2966:
	sw	%v0, 0(%sp)
	nop
	fmov	%f27, %f0
	fmov	%f28, %f1

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
	blti	%v0, 0, bgti_else.37101

	lw	%a0, 254(%v0)
	flw	%f0, 445(%zero)
	nop
	nop

	flw	%f29, 2(%a0)
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

	addi	%v1, %t1, 0
	addi	%sp, %sp, 6
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -6
	flw	%f1, 137(%zero)
	nop
	nop

	flw	%f0, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37102

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37103

fbgt_else.37102:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37103:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37104

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37106

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.37105

fbgt_else.37106:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37107:
	nop
	nop
	nop
	j	bnei_cont.37105

bnei_else.37104:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.37105:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37108

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%a0, 136(%zero)
	nop
	sll	%a1, %a0, 2
	nop

	add	%a1, %a1, %a0
	lw	%a0, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	bne	%a1, %a0, bnei_cont.37109

	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -6
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.37112

	nop
	nop
	nop
	j	bnei_cont.37109

bnei_else.37112:
	lw	%a0, 0(%t0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f19, 0(%a0)
	flw	%f18, 1(%a0)
	nop
	nop

	flw	%f0, 143(%zero)
	flw	%f17, 2(%a0)
	fmul	%f1, %f0, %f19
	nop

	lw	%a0, 1(%sp)
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 144(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f29, %f27

	flw	%f0, 0(%a0)
	nop
	fmul	%f16, %f0, %f1
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

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
	fmul	%f17, %f29, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.37114

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37115

fbgt_else.37114:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37115:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37116

	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.37117

bnei_else.37116:
bnei_cont.37117:
	nop
	nop
	nop
	fblt	%fzero, %f17, fbgt_else.37118

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37119

fbgt_else.37118:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37119:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.37109

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	flw	%f0, 151(%zero)
	nop
	fmul	%f1, %f0, %f28
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
	j	bnei_cont.37109

bnei_else.37120:
bnei_cont.37121:
bnei_cont.37113:
	nop
	nop
	nop
	j	bnei_cont.37109

beq_else.37110:
beq_cont.37111:
	nop
	nop
	nop
	j	bnei_cont.37109

bnei_else.37108:
bnei_cont.37109:
	lw	%a0, 0(%sp)
	lw	%t1, 2(%sp)
	fmov	%f1, %f28
	fmov	%f0, %f27

	addi	%v0, %a0, -1
	lw	%t0, 3(%sp)
	nop
	nop

	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	nop
	j	trace_reflections.2966

bgti_else.37101:
	nop
	nop
	nop
	jr	%ra

trace_ray.2971:
	fsw	%f1, 0(%sp)
	add	%a1, %zero, %v1
	fmov	%f3, %f0
	addi	%at, %zero, 4

	sw	%v0, 1(%sp)
	nop
	nop
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
	blt	%at, %v0, bgt_else.37393

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
	addi	%v0, %zero, 0
	nop
	nop

	sw	%v1, 10(%sp)
	nop
	nop
	nop

	addi	%sp, %sp, 11
	nop
	nop
	jal	trace_or_matrix.2930

	addi	%sp, %sp, -11
	flw	%f1, 137(%zero)
	nop
	nop

	fsw	%f1, 11(%sp)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37394

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37395

fbgt_else.37394:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37395:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37396

	flw	%f1, 444(%zero)
	flw	%f0, 11(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37398

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.37397

fbgt_else.37398:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37399:
	nop
	nop
	nop
	j	bnei_cont.37397

bnei_else.37396:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.37397:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37400

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
	flw	%f0, 0(%fp)
	nop
	nop

	sw	%a0, 12(%sp)
	lw	%a0, 1(%v0)
	nop
	nop

	fsw	%f0, 13(%sp)
	nop
	fmul	%f0, %f0, %f3
	nop

	fsw	%f0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.37401

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.37403

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a1)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a1)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a1)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 0(%s0)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%s0)
	nop
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%s0)
	nop
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37405

	flw	%f16, 2(%a2)
	flw	%f20, 1(%a2)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f1, %f19, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a2)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.37406

bnei_else.37405:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.37406:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.37407

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.37408

fbeq_else.37407:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.37408:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37409

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.37410

bnei_else.37409:
	nop
	nop
	nop
	beqi	%ra, 0, bnei_else.37411

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.37412

bnei_else.37411:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.37412:
bnei_cont.37410:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.37402

bnei_else.37403:
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

bnei_cont.37404:
	nop
	nop
	nop
	j	bnei_cont.37402

bnei_else.37401:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	lw	%a0, 2(%sp)
	nop
	nop

	add	%at, %a0, %a1
	nop
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.37413

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.37414

fbeq_else.37413:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.37414:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37415

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.37416

bnei_else.37415:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.37417

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37418

fbgt_else.37417:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37418:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37419

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.37420

bnei_else.37419:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.37420:
bnei_cont.37416:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.37402:
	flw	%f0, 138(%zero)
	nop
	nop
	nop

	fsw	%f0, 15(%sp)
	fsw	%f0, 159(%zero)
	nop
	nop

	flw	%f0, 139(%zero)
	nop
	nop
	nop

	fsw	%f0, 16(%sp)
	fsw	%f0, 160(%zero)
	nop
	nop

	flw	%f0, 140(%zero)
	nop
	nop
	nop

	fsw	%f0, 17(%sp)
	fsw	%f0, 161(%zero)
	nop
	nop

	addi	%v1, %zero, 138
	addi	%sp, %sp, 18
	nop
	jal	utexture.2959

	addi	%sp, %sp, -18
	lw	%a0, 136(%zero)
	sll	%a1, %k0, 2
	nop

	add	%a2, %a1, %a0
	lw	%a0, 8(%sp)
	nop
	nop

	lw	%a1, 1(%sp)
	flw	%f0, 15(%sp)
	nop
	nop

	add	%at, %a0, %a1
	lw	%a0, 9(%sp)
	nop
	nop

	sw	%a2, 0(%at)
	flw	%f1, 474(%zero)
	nop
	nop

	add	%at, %a0, %a1
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 16(%sp)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 17(%sp)
	nop
	nop

	fsw	%f0, 2(%a0)
	flw	%f0, 13(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37421

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37422

fbgt_else.37421:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37422:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37423

	lw	%a1, 7(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	add	%at, %a1, %a0
	nop
	nop
	nop

	sw	%zero, 0(%at)
	nop
	nop
	j	bnei_cont.37424

bnei_else.37423:
	lw	%a0, 7(%sp)
	lw	%a1, 1(%sp)
	nop
	nop

	add	%at, %a0, %a1
	lw	%a0, 6(%sp)
	nop
	nop

	sw	%k1, 0(%at)
	flw	%f0, 145(%zero)
	nop
	nop

	add	%at, %a0, %a1
	flw	%f1, 443(%zero)
	nop
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
	flw	%f0, 14(%sp)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	fmul	%f1, %f1, %f0
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

	add	%at, %a0, %a1
	nop
	nop
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

bnei_cont.37424:
	flw	%f19, 442(%zero)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	nop

	flw	%f18, 0(%a0)
	flw	%f29, 142(%zero)
	nop
	nop

	flw	%f17, 1(%a0)
	flw	%f28, 143(%zero)
	fmul	%f1, %f18, %f29
	nop

	flw	%f16, 2(%a0)
	flw	%f27, 144(%zero)
	fmul	%f0, %f17, %f28
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f27

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f19, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f29
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 0(%a0)
	nop
	fmul	%f0, %f1, %f28
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 1(%a0)
	nop
	fmul	%f0, %f1, %f27
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 2(%a0)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fmul	%f0, %f3, %f0
	nop

	fsw	%f0, 18(%sp)
	nop
	nop
	nop

	lw	%v1, 10(%sp)
	addi	%sp, %sp, 19
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -19
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.37425

	nop
	nop
	nop
	j	bnei_cont.37426

bnei_else.37425:
	flw	%f19, 78(%zero)
	flw	%f18, 79(%zero)
	nop
	nop

	flw	%f17, 80(%zero)
	lw	%a0, 2(%sp)
	fmul	%f1, %f29, %f19
	fmul	%f0, %f28, %f18

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f27, %f17

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f0, 14(%sp)
	nop
	fneg	%f1, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	fmul	%f16, %f1, %f0
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

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
	fneg	%f17, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.37427

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37428

fbgt_else.37427:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37428:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37429

	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.37430

bnei_else.37429:
bnei_cont.37430:
	nop
	nop
	nop
	fblt	%fzero, %f17, fbgt_else.37431

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37432

fbgt_else.37431:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37432:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37433

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	flw	%f0, 18(%sp)
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
	j	bnei_cont.37434

bnei_else.37433:
bnei_cont.37434:
bnei_cont.37426:
	flw	%f0, 15(%sp)
	nop
	nop
	nop

	fsw	%f0, 162(%zero)
	flw	%f0, 16(%sp)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 17(%sp)
	addi	%sp, %sp, 19
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	addi	%v0, %zero, 138
	nop
	nop

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%sp, %sp, -19
	lw	%a0, 434(%zero)
	nop
	nop

	addi	%v0, %a0, -1
	flw	%f1, 18(%sp)
	nop
	nop

	flw	%f0, 14(%sp)
	lw	%v1, 2(%sp)
	addi	%sp, %sp, 19
	jal	trace_reflections.2966

	addi	%sp, %sp, -19
	flw	%f0, 441(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.37435

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37436

fbgt_else.37435:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37436:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37437

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 4, bgti_else.37438

	nop
	nop
	nop
	j	bgti_cont.37439

bgti_else.37438:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	nop
	nop

	lw	%a0, 8(%sp)
	nop
	nop
	nop

	add	%at, %a0, %a2
	nop
	nop
	nop

	sw	%a1, 0(%at)
	nop
	nop
	nop

bgti_cont.37439:
	lw	%a0, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.37440

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.37440:
	flw	%f0, 13(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	addi	%v0, %a0, 1
	flw	%f16, 0(%sp)
	fsub	%f0, %f30, %f0
	nop

	flw	%f1, 11(%sp)
	lw	%ra, 4(%sp)
	fmul	%f0, %f3, %f0
	nop

	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	fadd	%f1, %f16, %f1
	j	trace_ray.2971

bnei_else.37437:
	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.37400:
	addi	%a2, %zero, -1
	lw	%a1, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	add	%at, %a1, %a0
	nop
	nop
	nop

	sw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37443

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
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.37444

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.37445

fbgt_else.37444:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.37445:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37446

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
	fmul	%f1, %f0, %f3
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

bnei_else.37446:
	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.37443:
	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.37393:
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
	blti	%a1, 0, bgti_else.38459

	add	%at, %v0, %a1
	flw	%f27, 0(%v1)
	nop
	nop

	lw	%t1, 0(%at)
	flw	%f28, 1(%v1)
	nop
	nop

	lw	%k0, 1(%t1)
	lw	%t0, 0(%t1)
	nop
	nop

	flw	%f21, 0(%t0)
	flw	%f19, 1(%t0)
	nop
	nop

	flw	%f29, 2(%v1)
	nop
	fmul	%f1, %f21, %f27
	fmul	%f0, %f19, %f28

	flw	%f1, 2(%t0)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f29
	nop

	nop
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.38460

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38461

fbgt_else.38460:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38461:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38462

	lw	%a0, 3(%sp)
	flw	%f0, 440(%zero)
	nop
	nop

	addi	%a1, %a0, 1
	lw	%a0, 0(%sp)
	fdiv	%f3, %f16, %f0
	nop

	add	%at, %a0, %a1
	flw	%f0, 445(%zero)
	nop
	nop

	lw	%t0, 0(%at)
	fsw	%f0, 137(%zero)
	nop
	nop

	lw	%t1, 134(%zero)
	nop
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
	beqi	%ra, -1, bnei_else.38464

	nop
	nop
	nop
	beqi	%ra, 99, bnei_else.38466

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

	flw	%f20, 0(%a3)
	flw	%f16, 1(%a3)
	nop
	nop

	flw	%f18, 2(%a3)
	lw	%a0, 1(%t0)
	nop
	nop

	add	%at, %a0, %ra
	nop
	nop
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.38468

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.38470

	flw	%f17, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.38472

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38473

fbeq_else.38472:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38473:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38474

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38469

bnei_else.38474:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38476

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38477

fbgt_else.38476:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38477:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38478

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38480

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.38481

bnei_else.38480:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.38481:
	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.38469

bnei_else.38478:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38479:
bnei_cont.38475:
	nop
	nop
	nop
	j	bnei_cont.38469

bnei_else.38470:
	flw	%f1, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38482

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38483

fbgt_else.38482:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38483:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38484

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

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.38469

bnei_else.38484:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38485:
bnei_cont.38471:
	nop
	nop
	nop
	j	bnei_cont.38469

bnei_else.38468:
	flw	%f0, 0(%ra)
	flw	%f2, 1(%ra)
	nop
	nop

	flw	%f19, 1(%k0)
	flw	%f17, 1(%fp)
	fsub	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f21, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f21, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.38486

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38487

fbgt_else.38486:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38487:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38488

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f21, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38490

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38491

fbgt_else.38490:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38491:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38492

	nop
	nop
	nop
	fbne	%f2, %fzero, fbeq_else.38494

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38495

fbeq_else.38494:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38495:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38496

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38489

bnei_else.38496:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.38497:
	nop
	nop
	nop
	j	bnei_cont.38489

bnei_else.38492:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38493:
	nop
	nop
	nop
	j	bnei_cont.38489

bnei_else.38488:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38489:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38498

	fsw	%f21, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.38499

bnei_else.38498:
	flw	%f0, 2(%ra)
	flw	%f22, 3(%ra)
	nop
	nop

	flw	%f21, 0(%k0)
	flw	%f2, 0(%fp)
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f23, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f23, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.38500

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38501

fbgt_else.38500:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38501:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38502

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f23, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38504

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38505

fbgt_else.38504:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38505:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38506

	nop
	nop
	nop
	fbne	%f22, %fzero, fbeq_else.38508

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38509

fbeq_else.38508:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38509:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38510

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38503

bnei_else.38510:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.38511:
	nop
	nop
	nop
	j	bnei_cont.38503

bnei_else.38506:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38507:
	nop
	nop
	nop
	j	bnei_cont.38503

bnei_else.38502:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38503:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38512

	fsw	%f23, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 2
	nop
	nop
	j	bnei_cont.38513

bnei_else.38512:
	flw	%f0, 4(%ra)
	flw	%f1, 5(%ra)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f18, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f18, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.38514

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38515

fbgt_else.38514:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38515:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38516

	nop
	nop
	fmul	%f0, %f18, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.38518

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38519

fbgt_else.38518:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38519:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38520

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38522

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38523

fbeq_else.38522:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38523:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38524

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38517

bnei_else.38524:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.38525:
	nop
	nop
	nop
	j	bnei_cont.38517

bnei_else.38520:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38521:
	nop
	nop
	nop
	j	bnei_cont.38517

bnei_else.38516:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38517:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38526

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 3
	nop
	nop
	j	bnei_cont.38527

bnei_else.38526:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38527:
bnei_cont.38513:
bnei_cont.38499:
bnei_cont.38469:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38467

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38530

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38531

fbgt_else.38530:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38531:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38467

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38467

	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38467

	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38467

	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38467

	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	addi	%sp, %sp, -8
	nop
	nop
	j	bnei_cont.38467

bnei_else.38540:
bnei_cont.38541:
	nop
	nop
	nop
	j	bnei_cont.38467

bnei_else.38538:
bnei_cont.38539:
	nop
	nop
	nop
	j	bnei_cont.38467

bnei_else.38536:
bnei_cont.38537:
	nop
	nop
	nop
	j	bnei_cont.38467

bnei_else.38534:
bnei_cont.38535:
	nop
	nop
	nop
	j	bnei_cont.38467

bnei_else.38532:
bnei_cont.38533:
	nop
	nop
	nop
	j	bnei_cont.38467

bnei_else.38528:
bnei_cont.38529:
	nop
	nop
	nop
	j	bnei_cont.38467

bnei_else.38466:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38542

	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38543

	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38543

	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38543

	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	addi	%sp, %sp, -8
	nop
	nop
	j	bnei_cont.38543

bnei_else.38548:
bnei_cont.38549:
	nop
	nop
	nop
	j	bnei_cont.38543

bnei_else.38546:
bnei_cont.38547:
	nop
	nop
	nop
	j	bnei_cont.38543

bnei_else.38544:
bnei_cont.38545:
	nop
	nop
	nop
	j	bnei_cont.38543

bnei_else.38542:
bnei_cont.38543:
bnei_cont.38467:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -8
	nop
	nop
	j	bnei_cont.38465

bnei_else.38464:
bnei_cont.38465:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38550

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38551

fbgt_else.38550:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38551:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38552

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38554

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38553

fbgt_else.38554:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38555:
	nop
	nop
	nop
	j	bnei_cont.38553

bnei_else.38552:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38553:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38463

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
	beqi	%k0, 1, bnei_else.38558

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38560

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f2, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f19, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f2, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38562

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f18, 474(%zero)
	nop
	fmul	%f1, %f2, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f19, %f16

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f19, %f20

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f2, %f16
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
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38563

bnei_else.38562:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.38563:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.38564

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38565

fbeq_else.38564:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38565:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38566

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38567

bnei_else.38566:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38568

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38569

bnei_else.38568:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38569:
bnei_cont.38567:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38559

bnei_else.38560:
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

bnei_cont.38561:
	nop
	nop
	nop
	j	bnei_cont.38559

bnei_else.38558:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	add	%at, %ra, %a1
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38570

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38571

fbeq_else.38570:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38571:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38572

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38573

bnei_else.38572:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38574

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38575

fbgt_else.38574:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38575:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38576

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38577

bnei_else.38576:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38577:
bnei_cont.38573:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38559:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	nop
	jal	utexture.2959

	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -8
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38578

	nop
	nop
	nop
	j	bnei_cont.38463

bnei_else.38578:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38580

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38581

fbgt_else.38580:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38581:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38582

	nop
	nop
	nop
	j	bnei_cont.38583

bnei_else.38582:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38583:
	flw	%f0, 0(%t0)
	nop
	fmul	%f1, %f3, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38579:
	nop
	nop
	nop
	j	bnei_cont.38463

bnei_else.38556:
bnei_cont.38557:
	nop
	nop
	nop
	j	bnei_cont.38463

bnei_else.38462:
	flw	%f0, 439(%zero)
	nop
	nop
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f3, %f16, %f0
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
	beqi	%fp, -1, bnei_else.38584

	nop
	nop
	nop
	beqi	%fp, 99, bnei_else.38586

	lw	%a0, 12(%fp)
	add	%at, %k0, %fp
	nop
	nop

	lw	%a2, 10(%a0)
	lw	%a1, 6(%a0)
	nop
	nop

	lw	%a3, 4(%a0)
	lw	%a0, 1(%a0)
	nop
	nop

	flw	%f20, 0(%a2)
	flw	%f16, 1(%a2)
	nop
	nop

	flw	%f18, 2(%a2)
	lw	%fp, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.38588

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38590

	flw	%f17, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.38592

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38593

fbeq_else.38592:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38593:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38594

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38589

bnei_else.38594:
	flw	%f0, 1(%fp)
	nop
	nop
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f1, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%a2)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38596

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38597

fbgt_else.38596:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38597:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38598

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.38600

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.38601

bnei_else.38600:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.38601:
	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.38589

bnei_else.38598:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38599:
bnei_cont.38595:
	nop
	nop
	nop
	j	bnei_cont.38589

bnei_else.38590:
	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38602

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38603

fbgt_else.38602:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38603:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38604

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

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.38589

bnei_else.38604:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38605:
bnei_cont.38591:
	nop
	nop
	nop
	j	bnei_cont.38589

bnei_else.38588:
	flw	%f0, 0(%fp)
	flw	%f22, 1(%fp)
	nop
	nop

	flw	%f17, 1(%a3)
	nop
	fsub	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f23, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f23, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.38606

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38607

fbgt_else.38606:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38607:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38608

	nop
	nop
	fmul	%f0, %f23, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a3)
	nop
	fabs	%f2, %f0
	nop

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.38610

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38611

fbgt_else.38610:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38611:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38612

	nop
	nop
	nop
	fbne	%f22, %fzero, fbeq_else.38614

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38615

fbeq_else.38614:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38615:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38616

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38609

bnei_else.38616:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.38617:
	nop
	nop
	nop
	j	bnei_cont.38609

bnei_else.38612:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38613:
	nop
	nop
	nop
	j	bnei_cont.38609

bnei_else.38608:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38609:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38618

	fsw	%f23, 135(%zero)
	nop
	nop
	nop

	add	%a0, %zero, %k1
	nop
	nop
	j	bnei_cont.38619

bnei_else.38618:
	flw	%f0, 2(%fp)
	flw	%f22, 3(%fp)
	nop
	nop

	flw	%f2, 0(%a3)
	nop
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f23, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f23, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.38620

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38621

fbgt_else.38620:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38621:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38622

	nop
	nop
	fmul	%f0, %f23, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38624

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38625

fbgt_else.38624:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38625:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38626

	nop
	nop
	nop
	fbne	%f22, %fzero, fbeq_else.38628

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38629

fbeq_else.38628:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38629:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38630

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38623

bnei_else.38630:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.38631:
	nop
	nop
	nop
	j	bnei_cont.38623

bnei_else.38626:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38627:
	nop
	nop
	nop
	j	bnei_cont.38623

bnei_else.38622:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38623:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38632

	fsw	%f23, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 2
	nop
	nop
	j	bnei_cont.38633

bnei_else.38632:
	flw	%f0, 4(%fp)
	flw	%f1, 5(%fp)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f18, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f18, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.38634

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38635

fbgt_else.38634:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38635:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38636

	nop
	nop
	fmul	%f0, %f18, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.38638

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38639

fbgt_else.38638:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38639:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38640

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38642

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38643

fbeq_else.38642:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38643:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38644

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38637

bnei_else.38644:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.38645:
	nop
	nop
	nop
	j	bnei_cont.38637

bnei_else.38640:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38641:
	nop
	nop
	nop
	j	bnei_cont.38637

bnei_else.38636:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38637:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38646

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 3
	nop
	nop
	j	bnei_cont.38647

bnei_else.38646:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38647:
bnei_cont.38633:
bnei_cont.38619:
bnei_cont.38589:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38587

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38650

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38651

fbgt_else.38650:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38651:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38587

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38587

	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38587

	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38587

	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38587

	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%v0, %zero, 5
	addi	%a0, %t1, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	addi	%sp, %sp, -8
	nop
	nop
	j	bnei_cont.38587

bnei_else.38660:
bnei_cont.38661:
	nop
	nop
	nop
	j	bnei_cont.38587

bnei_else.38658:
bnei_cont.38659:
	nop
	nop
	nop
	j	bnei_cont.38587

bnei_else.38656:
bnei_cont.38657:
	nop
	nop
	nop
	j	bnei_cont.38587

bnei_else.38654:
bnei_cont.38655:
	nop
	nop
	nop
	j	bnei_cont.38587

bnei_else.38652:
bnei_cont.38653:
	nop
	nop
	nop
	j	bnei_cont.38587

bnei_else.38648:
bnei_cont.38649:
	nop
	nop
	nop
	j	bnei_cont.38587

bnei_else.38586:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38662

	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38663

	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38663

	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38663

	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	addi	%v0, %zero, 5
	addi	%a0, %t1, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	addi	%sp, %sp, -8
	nop
	nop
	j	bnei_cont.38663

bnei_else.38668:
bnei_cont.38669:
	nop
	nop
	nop
	j	bnei_cont.38663

bnei_else.38666:
bnei_cont.38667:
	nop
	nop
	nop
	j	bnei_cont.38663

bnei_else.38664:
bnei_cont.38665:
	nop
	nop
	nop
	j	bnei_cont.38663

bnei_else.38662:
bnei_cont.38663:
bnei_cont.38587:
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -8
	nop
	nop
	j	bnei_cont.38585

bnei_else.38584:
bnei_cont.38585:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38670

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38671

fbgt_else.38670:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38671:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38672

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38674

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38673

fbgt_else.38674:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38675:
	nop
	nop
	nop
	j	bnei_cont.38673

bnei_else.38672:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38673:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38676

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
	beqi	%k0, 1, bnei_else.38678

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38680

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f2, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f19, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f2, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38682

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f18, 474(%zero)
	nop
	fmul	%f1, %f2, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f19, %f16

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f19, %f20

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f2, %f16
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
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38683

bnei_else.38682:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.38683:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.38684

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38685

fbeq_else.38684:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38685:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38686

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38687

bnei_else.38686:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38688

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38689

bnei_else.38688:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38689:
bnei_cont.38687:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38679

bnei_else.38680:
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

bnei_cont.38681:
	nop
	nop
	nop
	j	bnei_cont.38679

bnei_else.38678:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	add	%at, %t0, %a1
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38690

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38691

fbeq_else.38690:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38691:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38692

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38693

bnei_else.38692:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38694

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38695

fbgt_else.38694:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38695:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38696

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38697

bnei_else.38696:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38697:
bnei_cont.38693:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38679:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	nop
	jal	utexture.2959

	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -8
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38698

	nop
	nop
	nop
	j	bnei_cont.38677

bnei_else.38698:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38700

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38701

fbgt_else.38700:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38701:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38702

	nop
	nop
	nop
	j	bnei_cont.38703

bnei_else.38702:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38703:
	flw	%f0, 0(%t1)
	nop
	fmul	%f1, %f3, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38699:
	nop
	nop
	nop
	j	bnei_cont.38677

bnei_else.38676:
bnei_cont.38677:
bnei_cont.38463:
	lw	%a0, 3(%sp)
	nop
	nop
	nop

	addi	%t0, %a0, -2
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t0, 0, bgti_else.38704

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	add	%at, %a0, %t0
	nop
	nop
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
	fmul	%f1, %f0, %f27
	nop

	nop
	nop
	fmul	%f0, %f0, %f28
	nop

	flw	%f0, 2(%t1)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f29
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38705

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.38706

fbgt_else.38705:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38706:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.38707

	addi	%a1, %t0, 1
	lw	%a0, 0(%sp)
	addi	%sp, %sp, 8
	nop

	add	%at, %a0, %a1
	flw	%f0, 440(%zero)
	nop
	nop

	lw	%t1, 0(%at)
	flw	%f0, 445(%zero)
	fdiv	%f27, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	addi	%a0, %t1, 0
	nop
	nop

	lw	%t2, 134(%zero)
	addi	%v0, %zero, 0
	nop
	nop

	addi	%v1, %t2, 0
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	nop
	nop

	flw	%f0, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38709

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38710

fbgt_else.38709:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38710:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38711

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38713

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38712

fbgt_else.38713:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38714:
	nop
	nop
	nop
	j	bnei_cont.38712

bnei_else.38711:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38712:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38708

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
	beqi	%k0, 1, bnei_else.38717

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38719

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38721

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f1, %f19, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38722

bnei_else.38721:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.38722:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.38723

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38724

fbeq_else.38723:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38724:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38725

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38726

bnei_else.38725:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38727

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38728

bnei_else.38727:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38728:
bnei_cont.38726:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38718

bnei_else.38719:
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

bnei_cont.38720:
	nop
	nop
	nop
	j	bnei_cont.38718

bnei_else.38717:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	add	%at, %ra, %a1
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38729

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38730

fbeq_else.38729:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38730:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38731

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38732

bnei_else.38731:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38733

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38734

fbgt_else.38733:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38734:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38735

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38736

bnei_else.38735:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38736:
bnei_cont.38732:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38718:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	nop
	jal	utexture.2959

	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -8
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38737

	nop
	nop
	nop
	j	bnei_cont.38708

bnei_else.38737:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38739

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38740

fbgt_else.38739:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38740:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38741

	nop
	nop
	nop
	j	bnei_cont.38742

bnei_else.38741:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38742:
	flw	%f0, 0(%t1)
	nop
	fmul	%f1, %f27, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38738:
	nop
	nop
	nop
	j	bnei_cont.38708

bnei_else.38715:
bnei_cont.38716:
	nop
	nop
	nop
	j	bnei_cont.38708

bnei_else.38707:
	flw	%f0, 439(%zero)
	addi	%sp, %sp, 8
	nop
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f27, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t2, 134(%zero)
	addi	%v0, %zero, 0
	nop
	nop

	addi	%v1, %t2, 0
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	nop
	nop

	flw	%f0, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38743

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38744

fbgt_else.38743:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38744:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38745

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38747

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.38746

fbgt_else.38747:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38748:
	nop
	nop
	nop
	j	bnei_cont.38746

bnei_else.38745:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.38746:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38749

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
	beqi	%k0, 1, bnei_else.38751

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.38753

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.38755

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f1, %f19, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38756

bnei_else.38755:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.38756:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.38757

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38758

fbeq_else.38757:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38758:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38759

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38760

bnei_else.38759:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38761

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38762

bnei_else.38761:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.38762:
bnei_cont.38760:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.38752

bnei_else.38753:
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

bnei_cont.38754:
	nop
	nop
	nop
	j	bnei_cont.38752

bnei_else.38751:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	add	%at, %t1, %a1
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38763

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.38764

fbeq_else.38763:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.38764:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38765

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.38766

bnei_else.38765:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38767

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38768

fbgt_else.38767:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38768:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38769

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.38770

bnei_else.38769:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38770:
bnei_cont.38766:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.38752:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	nop
	jal	utexture.2959

	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -8
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38771

	nop
	nop
	nop
	j	bnei_cont.38750

bnei_else.38771:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38773

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.38774

fbgt_else.38773:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.38774:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38775

	nop
	nop
	nop
	j	bnei_cont.38776

bnei_else.38775:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.38776:
	flw	%f0, 0(%t9)
	nop
	fmul	%f1, %f27, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.38772:
	nop
	nop
	nop
	j	bnei_cont.38750

bnei_else.38749:
bnei_cont.38750:
bnei_cont.38708:
	addi	%a1, %t0, -2
	lw	%t2, 4(%sp)
	nop
	nop

	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	nop
	nop

	lw	%ra, 7(%sp)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	nop
	j	iter_trace_diffuse_rays.2980

bgti_else.38704:
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

bgti_else.38459:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_rays.2985:
	sw	%v0, 0(%sp)
	add	%v0, %zero, %a0
	nop
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
	addi	%sp, %sp, 7
	nop
	nop

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%sp, %sp, -7
	nop
	nop
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
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%t0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.39032

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.39033

fbgt_else.39032:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39033:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39034

	lw	%a0, 0(%sp)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 7
	nop

	lw	%t0, 119(%a0)
	flw	%f0, 445(%zero)
	fdiv	%f27, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	addi	%a0, %t0, 0
	nop
	nop

	lw	%t1, 134(%zero)
	addi	%v0, %zero, 0
	nop
	nop

	addi	%v1, %t1, 0
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -7
	flw	%f1, 137(%zero)
	nop
	nop

	flw	%f0, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39036

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39037

fbgt_else.39036:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39037:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39038

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.39040

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.39039

fbgt_else.39040:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39041:
	nop
	nop
	nop
	j	bnei_cont.39039

bnei_else.39038:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.39039:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.39035

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
	beqi	%k0, 1, bnei_else.39044

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.39046

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.39048

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f1, %f19, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39049

bnei_else.39048:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.39049:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.39050

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.39051

fbeq_else.39050:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.39051:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39052

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39053

bnei_else.39052:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39054

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39055

bnei_else.39054:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.39055:
bnei_cont.39053:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39045

bnei_else.39046:
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

bnei_cont.39047:
	nop
	nop
	nop
	j	bnei_cont.39045

bnei_else.39044:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	add	%at, %ra, %a1
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.39056

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.39057

fbeq_else.39056:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.39057:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39058

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39059

bnei_else.39058:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39060

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39061

fbgt_else.39060:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39061:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39062

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39063

bnei_else.39062:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.39063:
bnei_cont.39059:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.39045:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	nop
	jal	utexture.2959

	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -7
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.39064

	nop
	nop
	nop
	j	bnei_cont.39035

bnei_else.39064:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39066

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39067

fbgt_else.39066:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39067:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39068

	nop
	nop
	nop
	j	bnei_cont.39069

bnei_else.39068:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.39069:
	flw	%f0, 0(%t0)
	nop
	fmul	%f1, %f27, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.39065:
	nop
	nop
	nop
	j	bnei_cont.39035

bnei_else.39042:
bnei_cont.39043:
	nop
	nop
	nop
	j	bnei_cont.39035

bnei_else.39034:
	flw	%f0, 439(%zero)
	addi	%sp, %sp, 7
	nop
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f27, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t1, 134(%zero)
	addi	%v0, %zero, 0
	nop
	nop

	addi	%v1, %t1, 0
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -7
	flw	%f1, 137(%zero)
	nop
	nop

	flw	%f0, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39070

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39071

fbgt_else.39070:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39071:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39072

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.39074

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.39073

fbgt_else.39074:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39075:
	nop
	nop
	nop
	j	bnei_cont.39073

bnei_else.39072:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.39073:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39076

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
	beqi	%k0, 1, bnei_else.39078

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.39080

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.39082

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f1, %f19, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39083

bnei_else.39082:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.39083:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.39084

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.39085

fbeq_else.39084:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.39085:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39086

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39087

bnei_else.39086:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39088

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39089

bnei_else.39088:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.39089:
bnei_cont.39087:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39079

bnei_else.39080:
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

bnei_cont.39081:
	nop
	nop
	nop
	j	bnei_cont.39079

bnei_else.39078:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	add	%at, %t0, %a1
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.39090

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.39091

fbeq_else.39090:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.39091:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39092

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39093

bnei_else.39092:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39094

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39095

fbgt_else.39094:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39095:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39096

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39097

bnei_else.39096:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.39097:
bnei_cont.39093:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.39079:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	nop
	jal	utexture.2959

	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -7
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.39098

	nop
	nop
	nop
	j	bnei_cont.39077

bnei_else.39098:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39100

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39101

fbgt_else.39100:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39101:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39102

	nop
	nop
	nop
	j	bnei_cont.39103

bnei_else.39102:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.39103:
	flw	%f0, 0(%t2)
	nop
	fmul	%f1, %f27, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.39099:
	nop
	nop
	nop
	j	bnei_cont.39077

bnei_else.39076:
bnei_cont.39077:
bnei_cont.39035:
	addi	%a1, %zero, 116
	lw	%t2, 3(%sp)
	nop
	nop

	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	nop
	nop

	lw	%ra, 6(%sp)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	nop
	j	iter_trace_diffuse_rays.2980

do_without_neighbors.3002:
	sw	%v0, 0(%sp)
	add	%a0, %zero, %t0
	addi	%at, %zero, 4
	nop

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
	blt	%at, %v1, bgt_else.39266

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
	blti	%a1, 0, bgti_else.39267

	add	%at, %k0, %v1
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39268

	add	%at, %t0, %v1
	lw	%t2, 0(%fp)
	nop
	nop

	lw	%a0, 0(%at)
	add	%at, %a2, %v1
	nop
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
	beqi	%t2, 0, bnei_else.39270

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

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39271

bnei_else.39270:
bnei_cont.39271:
	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.39272

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

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39273

bnei_else.39272:
bnei_cont.39273:
	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.39274

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

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39275

bnei_else.39274:
bnei_cont.39275:
	nop
	nop
	nop
	beqi	%t2, 3, bnei_else.39276

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

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39277

bnei_else.39276:
bnei_cont.39277:
	nop
	nop
	nop
	beqi	%t2, 4, bnei_else.39278

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

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%a1, %zero, 118
	addi	%a0, %t3, 0
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39279

bnei_else.39278:
bnei_cont.39279:
	lw	%a1, 9(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	add	%at, %a1, %a0
	flw	%f16, 151(%zero)
	nop
	nop

	lw	%a0, 0(%at)
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
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39269

bnei_else.39268:
bnei_cont.39269:
	lw	%a0, 1(%sp)
	addi	%at, %zero, 4
	nop
	nop

	addi	%t2, %a0, 1
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %t2, bgt_else.39280

	lw	%a0, 11(%sp)
	nop
	nop
	nop

	add	%at, %a0, %t2
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.39281

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	add	%at, %a0, %t2
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39282

	add	%at, %t0, %t2
	nop
	nop
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

	add	%at, %a0, %t2
	lw	%a0, 12(%sp)
	nop
	nop

	lw	%t1, 0(%at)
	add	%at, %a0, %t2
	nop
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.39284

	lw	%v0, 179(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39285

bnei_else.39284:
bnei_cont.39285:
	nop
	nop
	nop
	beqi	%t3, 1, bnei_else.39286

	lw	%v0, 180(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39287

bnei_else.39286:
bnei_cont.39287:
	nop
	nop
	nop
	beqi	%t3, 2, bnei_else.39288

	lw	%v0, 181(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39289

bnei_else.39288:
bnei_cont.39289:
	nop
	nop
	nop
	beqi	%t3, 3, bnei_else.39290

	lw	%v0, 182(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39291

bnei_else.39290:
bnei_cont.39291:
	nop
	nop
	nop
	beqi	%t3, 4, bnei_else.39292

	lw	%v0, 183(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -13
	nop
	nop
	j	bnei_cont.39293

bnei_else.39292:
bnei_cont.39293:
	lw	%a0, 9(%sp)
	flw	%f16, 151(%zero)
	nop
	nop

	add	%at, %a0, %t2
	flw	%f0, 148(%zero)
	nop
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
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39283

bnei_else.39282:
bnei_cont.39283:
	addi	%v1, %t2, 1
	lw	%t3, 2(%sp)
	nop
	nop

	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	nop
	nop

	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.39281:
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

bgt_else.39280:
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

bgti_else.39267:
	add	%t0, %zero, %a0
	nop
	nop
	jr	%ra

bgt_else.39266:
	add	%t0, %zero, %a0
	nop
	nop
	jr	%ra

try_exploit_neighbors.3018:
	sw	%a3, 0(%sp)
	add	%at, %a1, %v0
	nop
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
	blt	%at, %a3, bgt_else.39510

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

	add	%at, %s0, %a3
	nop
	nop
	nop

	lw	%s7, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.39511

	add	%at, %a0, %v0
	nop
	nop
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%s2, 5(%fp)
	lw	%s3, 2(%fp)
	nop
	nop

	add	%at, %s3, %a3
	nop
	nop
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%fp, %s7, beq_else.39512

	add	%at, %a2, %v0
	nop
	nop
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%fp, 2(%fp)
	nop
	nop
	nop

	add	%at, %fp, %a3
	nop
	nop
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%fp, %s7, beq_else.39514

	addi	%fp, %v0, -1
	nop
	nop
	nop

	add	%at, %a1, %fp
	nop
	nop
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%fp, 2(%fp)
	nop
	nop
	nop

	add	%at, %fp, %a3
	nop
	nop
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%fp, %s7, beq_else.39516

	addi	%fp, %v0, 1
	nop
	nop
	nop

	add	%at, %a1, %fp
	nop
	nop
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%fp, 2(%fp)
	nop
	nop
	nop

	add	%at, %fp, %a3
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %s7, beq_else.39518

	add	%a3, %zero, %k1
	nop
	nop
	j	beq_cont.39513

beq_else.39518:
	add	%a3, %zero, %zero
	nop
	nop
	nop

beq_cont.39519:
	nop
	nop
	nop
	j	beq_cont.39513

beq_else.39516:
	add	%a3, %zero, %zero
	nop
	nop
	nop

beq_cont.39517:
	nop
	nop
	nop
	j	beq_cont.39513

beq_else.39514:
	add	%a3, %zero, %zero
	nop
	nop
	nop

beq_cont.39515:
	nop
	nop
	nop
	j	beq_cont.39513

beq_else.39512:
	add	%a3, %zero, %zero
	nop
	nop
	nop

beq_cont.39513:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39520

	lw	%s4, 0(%sp)
	nop
	nop
	nop

	add	%at, %k0, %s4
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39521

	addi	%a3, %v0, -1
	nop
	nop
	nop

	add	%at, %a1, %a3
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%s5, 5(%a3)
	addi	%a3, %v0, 1
	nop
	nop

	add	%at, %a1, %a3
	nop
	nop
	nop

	lw	%a3, 0(%at)
	add	%at, %a2, %v0
	nop
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

	add	%at, %a3, %s4
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	flw	%f16, 151(%zero)
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
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39522

bnei_else.39521:
bnei_cont.39522:
	lw	%a3, 0(%sp)
	addi	%at, %zero, 4
	nop
	nop

	addi	%fp, %a3, 1
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %fp, bgt_else.39523

	add	%at, %s0, %fp
	nop
	nop
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%ra, 0, bgti_else.39524

	add	%at, %s3, %fp
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.39525

	add	%at, %a2, %v0
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 2(%a3)
	nop
	nop
	nop

	add	%at, %a3, %fp
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.39527

	addi	%a3, %v0, -1
	nop
	nop
	nop

	add	%at, %a1, %a3
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 2(%a3)
	nop
	nop
	nop

	add	%at, %a3, %fp
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.39529

	addi	%a3, %v0, 1
	nop
	nop
	nop

	add	%at, %a1, %a3
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 2(%a3)
	nop
	nop
	nop

	add	%at, %a3, %fp
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.39531

	add	%a3, %zero, %k1
	nop
	nop
	j	beq_cont.39526

beq_else.39531:
	add	%a3, %zero, %zero
	nop
	nop
	nop

beq_cont.39532:
	nop
	nop
	nop
	j	beq_cont.39526

beq_else.39529:
	add	%a3, %zero, %zero
	nop
	nop
	nop

beq_cont.39530:
	nop
	nop
	nop
	j	beq_cont.39526

beq_else.39527:
	add	%a3, %zero, %zero
	nop
	nop
	nop

beq_cont.39528:
	nop
	nop
	nop
	j	beq_cont.39526

beq_else.39525:
	add	%a3, %zero, %zero
	nop
	nop
	nop

beq_cont.39526:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39533

	add	%at, %k0, %fp
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39534

	addi	%a3, %v0, -1
	nop
	nop
	nop

	add	%at, %a1, %a3
	nop
	nop
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%s0, 5(%a3)
	addi	%a3, %v0, 1
	nop
	nop

	add	%at, %a1, %a3
	nop
	nop
	nop

	lw	%a3, 0(%at)
	add	%at, %a2, %v0
	nop
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

	add	%at, %a3, %fp
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	flw	%f16, 151(%zero)
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
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39535

bnei_else.39534:
bnei_cont.39535:
	addi	%a3, %fp, 1
	lw	%ra, 1(%sp)
	nop
	j	try_exploit_neighbors.3018

bnei_else.39533:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %fp, 0
	j	do_without_neighbors.3002

bgti_else.39524:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.39523:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.39520:
	lw	%a2, 0(%sp)
	addi	%at, %zero, 4
	nop
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.39538

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.39539

	add	%at, %k0, %a2
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39540

	add	%at, %s1, %a2
	lw	%a1, 0(%s6)
	nop
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
	beqi	%a1, 0, bnei_else.39542

	lw	%v0, 179(%zero)
	addi	%sp, %sp, 7
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -7
	nop
	nop
	j	bnei_cont.39543

bnei_else.39542:
bnei_cont.39543:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.39544

	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -7
	nop
	nop
	j	bnei_cont.39545

bnei_else.39544:
bnei_cont.39545:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.39546

	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -7
	nop
	nop
	j	bnei_cont.39547

bnei_else.39546:
bnei_cont.39547:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.39548

	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -7
	nop
	nop
	j	bnei_cont.39549

bnei_else.39548:
bnei_cont.39549:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 4, bnei_else.39550

	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -7
	nop
	nop
	j	bnei_cont.39551

bnei_else.39550:
bnei_cont.39551:
	lw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	nop
	nop

	add	%at, %a1, %a0
	flw	%f16, 151(%zero)
	nop
	nop

	lw	%a0, 0(%at)
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
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39541

bnei_else.39540:
bnei_cont.39541:
	lw	%a0, 0(%sp)
	lw	%ra, 1(%sp)
	nop
	nop

	addi	%v1, %a0, 1
	lw	%v0, 2(%sp)
	nop
	j	do_without_neighbors.3002

bgti_else.39539:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.39538:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.39511:
	nop
	nop
	nop
	jr	%ra

bgt_else.39510:
	nop
	nop
	nop
	jr	%ra

pretrace_diffuse_rays.3031:
	sw	%v0, 0(%sp)
	add	%a0, %zero, %t0
	addi	%at, %zero, 4
	nop

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
	blt	%at, %v1, bgt_else.39879

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
	blti	%a1, 0, bgti_else.39880

	add	%at, %fp, %v1
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39881

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

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%a1, %zero, 118
	addi	%a0, %v0, 0
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	addi	%sp, %sp, -10
	flw	%f0, 148(%zero)
	nop
	nop

	lw	%a1, 6(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	add	%at, %a1, %a0
	nop
	nop
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
	j	bnei_cont.39882

bnei_else.39881:
bnei_cont.39882:
	lw	%a0, 1(%sp)
	addi	%at, %zero, 4
	nop
	nop

	addi	%t1, %a0, 1
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %t1, bgt_else.39883

	lw	%a0, 8(%sp)
	nop
	nop
	nop

	add	%at, %a0, %t1
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.39884

	lw	%a0, 7(%sp)
	nop
	nop
	nop

	add	%at, %a0, %t1
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39885

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
	addi	%sp, %sp, 12
	nop
	nop

	add	%at, %a0, %t1
	nop
	nop
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	flw	%f0, 0(%t0)
	addi	%v0, %t0, 0
	nop
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

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%sp, %sp, -12
	nop
	nop
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
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%a2)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.39887

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.39888

fbgt_else.39887:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39888:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39889

	lw	%a0, 10(%sp)
	flw	%f0, 440(%zero)
	nop
	nop

	lw	%a0, 119(%a0)
	flw	%f0, 445(%zero)
	fdiv	%f27, %f1, %f0
	nop

	sw	%a0, 13(%sp)
	fsw	%f0, 137(%zero)
	nop
	nop

	lw	%v1, 134(%zero)
	addi	%v0, %zero, 0
	nop
	nop

	sw	%v1, 14(%sp)
	nop
	nop
	nop

	addi	%sp, %sp, 15
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -15
	flw	%f1, 137(%zero)
	nop
	nop

	flw	%f0, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39891

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39892

fbgt_else.39891:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39892:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39893

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.39895

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.39894

fbgt_else.39895:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39896:
	nop
	nop
	nop
	j	bnei_cont.39894

bnei_else.39893:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.39894:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.39890

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
	beqi	%k0, 1, bnei_else.39899

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.39901

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.39903

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f1, %f19, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39904

bnei_else.39903:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.39904:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.39905

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.39906

fbeq_else.39905:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.39906:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39907

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39908

bnei_else.39907:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39909

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39910

bnei_else.39909:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.39910:
bnei_cont.39908:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39900

bnei_else.39901:
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

bnei_cont.39902:
	nop
	nop
	nop
	j	bnei_cont.39900

bnei_else.39899:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	add	%at, %ra, %a1
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.39911

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.39912

fbeq_else.39911:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.39912:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39913

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39914

bnei_else.39913:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39915

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39916

fbgt_else.39915:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39916:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39917

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39918

bnei_else.39917:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.39918:
bnei_cont.39914:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.39900:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 15
	nop
	jal	utexture.2959

	addi	%sp, %sp, -15
	addi	%v0, %zero, 0
	nop
	nop

	lw	%v1, 14(%sp)
	addi	%sp, %sp, 15
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -15
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.39919

	nop
	nop
	nop
	j	bnei_cont.39890

bnei_else.39919:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39921

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39922

fbgt_else.39921:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39922:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39923

	nop
	nop
	nop
	j	bnei_cont.39924

bnei_else.39923:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.39924:
	flw	%f0, 0(%t9)
	nop
	fmul	%f1, %f27, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.39920:
	nop
	nop
	nop
	j	bnei_cont.39890

bnei_else.39897:
bnei_cont.39898:
	nop
	nop
	nop
	j	bnei_cont.39890

bnei_else.39889:
	flw	%f0, 439(%zero)
	nop
	nop
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f27, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%v1, 134(%zero)
	addi	%v0, %zero, 0
	nop
	nop

	sw	%v1, 15(%sp)
	nop
	nop
	nop

	addi	%sp, %sp, 16
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -16
	flw	%f1, 137(%zero)
	nop
	nop

	flw	%f0, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39925

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39926

fbgt_else.39925:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39926:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39927

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.39929

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.39928

fbgt_else.39929:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39930:
	nop
	nop
	nop
	j	bnei_cont.39928

bnei_else.39927:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.39928:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39931

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
	beqi	%k0, 1, bnei_else.39933

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.39935

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.39937

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f1, %f19, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39938

bnei_else.39937:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.39938:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.39939

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.39940

fbeq_else.39939:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.39940:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39941

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39942

bnei_else.39941:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39943

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39944

bnei_else.39943:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.39944:
bnei_cont.39942:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39934

bnei_else.39935:
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

bnei_cont.39936:
	nop
	nop
	nop
	j	bnei_cont.39934

bnei_else.39933:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	lw	%a0, 12(%sp)
	nop
	nop

	add	%at, %a0, %a1
	nop
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.39945

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.39946

fbeq_else.39945:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.39946:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39947

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39948

bnei_else.39947:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39949

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39950

fbgt_else.39949:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39950:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39951

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39952

bnei_else.39951:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.39952:
bnei_cont.39948:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.39934:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 16
	nop
	jal	utexture.2959

	addi	%sp, %sp, -16
	addi	%v0, %zero, 0
	nop
	nop

	lw	%v1, 15(%sp)
	addi	%sp, %sp, 16
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -16
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.39953

	nop
	nop
	nop
	j	bnei_cont.39932

bnei_else.39953:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39955

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.39956

fbgt_else.39955:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.39956:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39957

	nop
	nop
	nop
	j	bnei_cont.39958

bnei_else.39957:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.39958:
	flw	%f0, 0(%t9)
	nop
	fmul	%f1, %f27, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.39954:
	nop
	nop
	nop
	j	bnei_cont.39932

bnei_else.39931:
bnei_cont.39932:
bnei_cont.39890:
	addi	%a1, %zero, 116
	lw	%v1, 11(%sp)
	addi	%a0, %t0, 0
	nop

	lw	%v0, 10(%sp)
	addi	%sp, %sp, 16
	nop
	jal	iter_trace_diffuse_rays.2980

	addi	%sp, %sp, -16
	flw	%f0, 148(%zero)
	nop
	nop

	lw	%a0, 6(%sp)
	nop
	nop
	nop

	add	%at, %a0, %t1
	nop
	nop
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
	j	bnei_cont.39886

bnei_else.39885:
bnei_cont.39886:
	addi	%v1, %t1, 1
	lw	%t1, 2(%sp)
	nop
	nop

	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	j	pretrace_diffuse_rays.3031

bgti_else.39884:
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

bgt_else.39883:
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

bgti_else.39880:
	add	%t0, %zero, %a0
	nop
	nop
	jr	%ra

bgt_else.39879:
	add	%t0, %zero, %a0
	nop
	nop
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
	blti	%v1, 0, bgti_else.40268

	flw	%f17, 158(%zero)
	lw	%a0, 156(%zero)
	nop
	nop

	nop
	nop
	sub	%a0, %v1, %a0
	nop

	nop
	nop
	itof	%f16, %a0
	nop

	flw	%f16, 165(%zero)
	nop
	fmul	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
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
	fmul	%f0, %f17, %f0
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
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	fsw	%f0, 176(%zero)
	nop
	nop
	nop

	flw	%f18, 174(%zero)
	flw	%f17, 175(%zero)
	nop
	nop

	flw	%f16, 176(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f0, %fzero, fbeq_else.40269

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.40270

fbeq_else.40269:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.40270:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40271

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40272

bnei_else.40271:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

bnei_cont.40272:
	lw	%a1, 3(%sp)
	lw	%a0, 4(%sp)
	fmul	%f1, %f18, %f0
	addi	%sp, %sp, 13

	fsw	%f1, 174(%zero)
	add	%at, %a1, %a0
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 175(%zero)
	lw	%t0, 0(%at)
	fmov	%f1, %fzero
	nop

	fsw	%f0, 176(%zero)
	addi	%a0, %t0, 0
	nop
	nop

	fsw	%fzero, 151(%zero)
	nop
	nop
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

	addi	%v1, %zero, 174
	addi	%v0, %zero, 0
	nop
	jal	trace_ray.2971

	addi	%sp, %sp, -13
	lw	%a2, 7(%t0)
	nop
	nop

	lw	%fp, 6(%t0)
	lw	%a0, 5(%t0)
	nop
	nop

	sw	%a0, 13(%sp)
	lw	%k0, 3(%t0)
	nop
	nop

	lw	%a1, 2(%t0)
	lw	%a3, 1(%t0)
	nop
	nop

	lw	%a0, 0(%t0)
	flw	%f0, 151(%zero)
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
	blti	%a0, 0, bgti_else.40273

	lw	%a0, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40275

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
	addi	%v0, %t1, 0
	nop
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

	addi	%v1, %a0, -1
	nop
	nop
	jal	setup_startp_constants.2882

	addi	%sp, %sp, -14
	lw	%a0, 118(%t2)
	nop
	nop

	lw	%t4, 0(%a0)
	flw	%f0, 0(%t3)
	nop
	nop

	flw	%f1, 0(%t4)
	nop
	nop
	nop

	flw	%f1, 1(%t4)
	flw	%f0, 1(%t3)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%t4)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%t3)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.40277

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.40278

fbgt_else.40277:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.40278:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40279

	lw	%t4, 119(%t2)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 14
	nop

	flw	%f0, 445(%zero)
	addi	%a0, %t4, 0
	fdiv	%f27, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t5, 134(%zero)
	addi	%v0, %zero, 0
	nop
	nop

	addi	%v1, %t5, 0
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -14
	flw	%f1, 137(%zero)
	nop
	nop

	flw	%f0, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40281

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.40282

fbgt_else.40281:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.40282:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40283

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40285

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.40284

fbgt_else.40285:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.40286:
	nop
	nop
	nop
	j	bnei_cont.40284

bnei_else.40283:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.40284:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.40280

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
	beqi	%k0, 1, bnei_else.40289

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.40291

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.40293

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f1, %f19, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40294

bnei_else.40293:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.40294:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.40295

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.40296

fbeq_else.40295:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.40296:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40297

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40298

bnei_else.40297:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.40299

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40300

bnei_else.40299:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.40300:
bnei_cont.40298:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40290

bnei_else.40291:
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

bnei_cont.40292:
	nop
	nop
	nop
	j	bnei_cont.40290

bnei_else.40289:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	add	%at, %ra, %a1
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.40301

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.40302

fbeq_else.40301:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.40302:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40303

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.40304

bnei_else.40303:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40305

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.40306

fbgt_else.40305:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.40306:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40307

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40308

bnei_else.40307:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.40308:
bnei_cont.40304:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.40290:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 14
	nop
	jal	utexture.2959

	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -14
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40309

	nop
	nop
	nop
	j	bnei_cont.40280

bnei_else.40309:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40311

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.40312

fbgt_else.40311:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.40312:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40313

	nop
	nop
	nop
	j	bnei_cont.40314

bnei_else.40313:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.40314:
	flw	%f0, 0(%t4)
	nop
	fmul	%f1, %f27, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.40310:
	nop
	nop
	nop
	j	bnei_cont.40280

bnei_else.40287:
bnei_cont.40288:
	nop
	nop
	nop
	j	bnei_cont.40280

bnei_else.40279:
	flw	%f0, 439(%zero)
	addi	%sp, %sp, 14
	nop
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f27, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t5, 134(%zero)
	addi	%v0, %zero, 0
	nop
	nop

	addi	%v1, %t5, 0
	nop
	nop
	jal	trace_or_matrix_fast.2944

	addi	%sp, %sp, -14
	flw	%f1, 137(%zero)
	nop
	nop

	flw	%f0, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40315

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.40316

fbgt_else.40315:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.40316:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40317

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40319

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.40318

fbgt_else.40319:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.40320:
	nop
	nop
	nop
	j	bnei_cont.40318

bnei_else.40317:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bnei_cont.40318:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40321

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
	beqi	%k0, 1, bnei_else.40323

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.40325

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.40327

	flw	%f16, 2(%a1)
	flw	%f20, 1(%a1)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f1, %f19, %f16
	fmul	%f0, %f22, %f20

	flw	%f16, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40328

bnei_else.40327:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.40328:
	flw	%f18, 142(%zero)
	flw	%f17, 143(%zero)
	nop
	nop

	flw	%f16, 144(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

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
	fbne	%f1, %fzero, fbeq_else.40329

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.40330

fbeq_else.40329:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.40330:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40331

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40332

bnei_else.40331:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.40333

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40334

bnei_else.40333:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.40334:
bnei_cont.40332:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40324

bnei_else.40325:
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

bnei_cont.40326:
	nop
	nop
	nop
	j	bnei_cont.40324

bnei_else.40323:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	addi	%a1, %a0, -1
	nop
	nop

	fsw	%fzero, 144(%zero)
	add	%at, %t4, %a1
	nop
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.40335

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.40336

fbeq_else.40335:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.40336:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40337

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.40338

bnei_else.40337:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40339

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.40340

fbgt_else.40339:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.40340:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40341

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40342

bnei_else.40341:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.40342:
bnei_cont.40338:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.40324:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 14
	nop
	jal	utexture.2959

	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	nop
	jal	shadow_check_one_or_matrix.2919

	addi	%sp, %sp, -14
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40343

	nop
	nop
	nop
	j	bnei_cont.40322

bnei_else.40343:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40345

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.40346

fbgt_else.40345:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.40346:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40347

	nop
	nop
	nop
	j	bnei_cont.40348

bnei_else.40347:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.40348:
	flw	%f0, 0(%t9)
	nop
	fmul	%f1, %f27, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
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
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.40344:
	nop
	nop
	nop
	j	bnei_cont.40322

bnei_else.40321:
bnei_cont.40322:
bnei_cont.40280:
	addi	%a1, %zero, 116
	addi	%a0, %t1, 0
	addi	%v1, %t3, 0
	addi	%v0, %t2, 0

	addi	%sp, %sp, 14
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	addi	%sp, %sp, -14
	flw	%f0, 148(%zero)
	nop
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
	j	bnei_cont.40276

bnei_else.40275:
bnei_cont.40276:
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 14
	jal	pretrace_diffuse_rays.3031

	addi	%sp, %sp, -14
	nop
	nop
	j	bgti_cont.40274

bgti_else.40273:
bgti_cont.40274:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	addi	%v1, %a0, -1
	lw	%a0, 5(%sp)
	nop
	nop

	addi	%a0, %a0, 1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 5, bgti_else.40349

	addi	%a0, %a0, -5
	nop
	nop
	j	bgti_cont.40350

bgti_else.40349:
bgti_cont.40350:
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

bgti_else.40268:
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
	add	%a0, %zero, %t0
	nop
	nop

	sw	%a1, 3(%sp)
	lw	%t0, 154(%zero)
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
	blt	%v0, %t0, bgt_else.42673

	add	%t0, %zero, %a0
	nop
	nop
	jr	%ra

bgt_else.42673:
	add	%at, %a1, %v0
	nop
	nop
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
	blt	%a0, %a2, bgt_else.42675

	add	%a0, %zero, %zero
	nop
	nop
	j	bgt_cont.42676

bgt_else.42675:
	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.42677

	add	%a0, %zero, %zero
	nop
	nop
	j	bgt_cont.42678

bgt_else.42677:
	addi	%a0, %v0, 1
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.42679

	add	%a0, %zero, %zero
	nop
	nop
	j	bgt_cont.42680

bgt_else.42679:
	nop
	nop
	nop
	blt	%zero, %v0, bgt_else.42681

	add	%a0, %zero, %zero
	nop
	nop
	j	bgt_cont.42682

bgt_else.42681:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bgt_cont.42682:
bgt_cont.42680:
bgt_cont.42678:
bgt_cont.42676:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42683

	lw	%fp, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%fp, 0, bnei_cont.42684

	lw	%a0, 2(%sp)
	lw	%a3, 0(%sp)
	nop
	nop

	add	%at, %a0, %a3
	nop
	nop
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
	bne	%a0, %fp, beq_else.42687

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	add	%at, %a0, %a3
	nop
	nop
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
	bne	%a0, %fp, beq_else.42689

	addi	%a0, %a3, -1
	lw	%a2, 3(%sp)
	nop
	nop

	add	%at, %a2, %a0
	nop
	nop
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
	bne	%a0, %fp, beq_else.42691

	addi	%a0, %a3, 1
	nop
	nop
	nop

	add	%at, %a2, %a0
	nop
	nop
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
	bne	%a0, %fp, beq_else.42693

	add	%a0, %zero, %k1
	nop
	nop
	j	beq_cont.42688

beq_else.42693:
	add	%a0, %zero, %zero
	nop
	nop
	nop

beq_cont.42694:
	nop
	nop
	nop
	j	beq_cont.42688

beq_else.42691:
	add	%a0, %zero, %zero
	nop
	nop
	nop

beq_cont.42692:
	nop
	nop
	nop
	j	beq_cont.42688

beq_else.42689:
	add	%a0, %zero, %zero
	nop
	nop
	nop

beq_cont.42690:
	nop
	nop
	nop
	j	beq_cont.42688

beq_else.42687:
	add	%a0, %zero, %zero
	nop
	nop
	nop

beq_cont.42688:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42695

	lw	%a0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42697

	lw	%fp, 0(%sp)
	lw	%a1, 3(%sp)
	nop
	nop

	addi	%a0, %fp, -1
	nop
	nop
	nop

	add	%at, %a1, %a0
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a3, 5(%a0)
	addi	%a0, %fp, 1
	nop
	nop

	add	%at, %a1, %a0
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a2, 5(%a0)
	lw	%a0, 4(%sp)
	nop
	nop

	add	%at, %a0, %fp
	nop
	nop
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

	flw	%f16, 151(%zero)
	flw	%f0, 148(%zero)
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.42698

bnei_else.42697:
bnei_cont.42698:
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%a3, %k1, 0
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
	addi	%sp, %sp, 14
	nop
	jal	try_exploit_neighbors.3018

	addi	%sp, %sp, -14
	nop
	nop
	j	bnei_cont.42684

bnei_else.42695:
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002

	addi	%sp, %sp, -14
	nop
	nop
	nop

bnei_cont.42696:
	nop
	nop
	nop
	j	bnei_cont.42684

bgti_else.42685:
bgti_cont.42686:
	nop
	nop
	nop
	j	bnei_cont.42684

bnei_else.42683:
	lw	%a0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.42699

	lw	%a0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42701

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
	beqi	%t4, 0, bnei_else.42703

	lw	%v0, 179(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -14
	nop
	nop
	j	bnei_cont.42704

bnei_else.42703:
bnei_cont.42704:
	nop
	nop
	nop
	beqi	%t4, 1, bnei_else.42705

	lw	%v0, 180(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -14
	nop
	nop
	j	bnei_cont.42706

bnei_else.42705:
bnei_cont.42706:
	nop
	nop
	nop
	beqi	%t4, 2, bnei_else.42707

	lw	%v0, 181(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -14
	nop
	nop
	j	bnei_cont.42708

bnei_else.42707:
bnei_cont.42708:
	nop
	nop
	nop
	beqi	%t4, 3, bnei_else.42709

	lw	%v0, 182(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -14
	nop
	nop
	j	bnei_cont.42710

bnei_else.42709:
bnei_cont.42710:
	nop
	nop
	nop
	beqi	%t4, 4, bnei_else.42711

	lw	%v0, 183(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	addi	%sp, %sp, -14
	nop
	nop
	j	bnei_cont.42712

bnei_else.42711:
bnei_cont.42712:
	lw	%a0, 11(%sp)
	flw	%f16, 151(%zero)
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
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.42702

bnei_else.42701:
bnei_cont.42702:
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002

	addi	%sp, %sp, -14
	nop
	nop
	j	bgti_cont.42700

bgti_else.42699:
bgti_cont.42700:
bnei_cont.42684:
	flw	%f0, 151(%zero)
	addi	%at, %zero, 255
	nop
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.42713

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.42715

	nop
	nop
	nop
	j	bgt_cont.42714

bgti_else.42715:
	add	%a1, %zero, %zero
	nop
	nop
	nop

bgti_cont.42716:
	nop
	nop
	nop
	j	bgt_cont.42714

bgt_else.42713:
	addi	%a1, %zero, 255
	nop
	nop
	nop

bgt_cont.42714:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	addi	%t1, %zero, 10
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42717

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42719

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42721

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42723

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42718

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42727

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42729

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42731

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42718

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42735

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42737

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42739

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42718

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42743

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42745

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42747

	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.42718

bgti_else.42747:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42748:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42745:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42746:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42743:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42744:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42741:
bgti_cont.42742:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42739:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42740:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42737:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42738:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42735:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42736:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42733:
bgti_cont.42734:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42731:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42732:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42729:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42730:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42727:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42728:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42725:
bgti_cont.42726:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42723:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42724:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42721:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42722:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42719:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42720:
	nop
	nop
	nop
	j	bgti_cont.42718

bgti_else.42717:
bgti_cont.42718:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.42749

	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.42750

bgt_else.42749:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.42751

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42753

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42755

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42757

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42752

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42761

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42763

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42765

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42752

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42769

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42771

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42773

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42752

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42777

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42779

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42781

	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.42752

bgti_else.42781:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42782:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42779:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42780:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42777:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42778:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42775:
bgti_cont.42776:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42773:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42774:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42771:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42772:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42769:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42770:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42767:
bgti_cont.42768:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42765:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42766:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42763:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42764:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42761:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42762:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42759:
bgti_cont.42760:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42757:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42758:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42755:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42756:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42753:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42754:
	nop
	nop
	nop
	j	bgti_cont.42752

bgti_else.42751:
bgti_cont.42752:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.42783

	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.42784

bgt_else.42783:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42785

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42787

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42789

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42791

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42786

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42795

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42797

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42799

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42786

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42803

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42805

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42807

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42786

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42811

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42813

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42815

	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.42786

bgti_else.42815:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.42816:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42813:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.42814:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42811:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.42812:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42809:
bgti_cont.42810:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42807:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.42808:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42805:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.42806:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42803:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.42804:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42801:
bgti_cont.42802:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42799:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.42800:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42797:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.42798:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42795:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.42796:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42793:
bgti_cont.42794:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42791:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.42792:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42789:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.42790:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42787:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.42788:
	nop
	nop
	nop
	j	bgti_cont.42786

bgti_else.42785:
bgti_cont.42786:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	nop

bgt_cont.42784:
bgt_cont.42750:
	addi	%t2, %zero, 32
	addi	%sp, %sp, 14
	nop
	nop

	addi	%v0, %t2, 0
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.42817

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.42819

	nop
	nop
	nop
	j	bgt_cont.42818

bgti_else.42819:
	add	%a1, %zero, %zero
	nop
	nop
	nop

bgti_cont.42820:
	nop
	nop
	nop
	j	bgt_cont.42818

bgt_else.42817:
	addi	%a1, %zero, 255
	nop
	nop
	nop

bgt_cont.42818:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42821

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42823

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42825

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42827

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42822

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42831

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42833

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42835

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42822

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42839

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42841

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42843

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42822

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42847

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42849

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42851

	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.42822

bgti_else.42851:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42852:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42849:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42850:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42847:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42848:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42845:
bgti_cont.42846:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42843:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42844:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42841:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42842:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42839:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42840:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42837:
bgti_cont.42838:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42835:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42836:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42833:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42834:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42831:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42832:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42829:
bgti_cont.42830:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42827:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42828:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42825:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42826:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42823:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42824:
	nop
	nop
	nop
	j	bgti_cont.42822

bgti_else.42821:
bgti_cont.42822:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.42853

	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.42854

bgt_else.42853:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.42855

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42857

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42859

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42861

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42856

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42865

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42867

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42869

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42856

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42873

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42875

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42877

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42856

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42881

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42883

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42885

	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.42856

bgti_else.42885:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42886:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42883:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42884:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42881:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42882:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42879:
bgti_cont.42880:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42877:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42878:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42875:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42876:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42873:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42874:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42871:
bgti_cont.42872:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42869:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42870:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42867:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42868:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42865:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42866:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42863:
bgti_cont.42864:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42861:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42862:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42859:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42860:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42857:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42858:
	nop
	nop
	nop
	j	bgti_cont.42856

bgti_else.42855:
bgti_cont.42856:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.42887

	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.42888

bgt_else.42887:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42889

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42891

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42893

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42895

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42890

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42899

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42901

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42903

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42890

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42907

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42909

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42911

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42890

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42915

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42917

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42919

	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.42890

bgti_else.42919:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.42920:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42917:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.42918:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42915:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.42916:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42913:
bgti_cont.42914:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42911:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.42912:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42909:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.42910:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42907:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.42908:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42905:
bgti_cont.42906:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42903:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.42904:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42901:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.42902:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42899:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.42900:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42897:
bgti_cont.42898:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42895:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.42896:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42893:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.42894:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42891:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.42892:
	nop
	nop
	nop
	j	bgti_cont.42890

bgti_else.42889:
bgti_cont.42890:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	nop

bgt_cont.42888:
bgt_cont.42854:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.42921

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.42923

	nop
	nop
	nop
	j	bgt_cont.42922

bgti_else.42923:
	add	%a1, %zero, %zero
	nop
	nop
	nop

bgti_cont.42924:
	nop
	nop
	nop
	j	bgt_cont.42922

bgt_else.42921:
	addi	%a1, %zero, 255
	nop
	nop
	nop

bgt_cont.42922:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.42925

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42927

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42929

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42931

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42926

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42935

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42937

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42939

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42926

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42943

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42945

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42947

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.42926

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.42951

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.42953

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.42955

	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.42926

bgti_else.42955:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42956:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42953:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42954:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42951:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42952:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42949:
bgti_cont.42950:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42947:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42948:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42945:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42946:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42943:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42944:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42941:
bgti_cont.42942:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42939:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42940:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42937:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42938:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42935:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42936:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42933:
bgti_cont.42934:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42931:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.42932:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42929:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.42930:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42927:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.42928:
	nop
	nop
	nop
	j	bgti_cont.42926

bgti_else.42925:
bgti_cont.42926:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.42957

	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.42958

bgt_else.42957:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.42959

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42961

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42963

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42965

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42960

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42969

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42971

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42973

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42960

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42977

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42979

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42981

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.42960

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.42985

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.42987

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.42989

	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.42960

bgti_else.42989:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42990:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42987:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42988:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42985:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42986:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42983:
bgti_cont.42984:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42981:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42982:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42979:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42980:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42977:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42978:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42975:
bgti_cont.42976:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42973:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42974:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42971:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42972:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42969:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42970:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42967:
bgti_cont.42968:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42965:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.42966:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42963:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.42964:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42961:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.42962:
	nop
	nop
	nop
	j	bgti_cont.42960

bgti_else.42959:
bgti_cont.42960:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.42991

	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.42992

bgt_else.42991:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42993

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.42995

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.42997

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.42999

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42994

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43003

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43005

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43007

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42994

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43011

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43013

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43015

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.42994

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43019

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43021

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43023

	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.42994

bgti_else.43023:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43024:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43021:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43022:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43019:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43020:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43017:
bgti_cont.43018:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43015:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43016:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43013:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43014:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43011:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43012:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43009:
bgti_cont.43010:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43007:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43008:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43005:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43006:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43003:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43004:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.43001:
bgti_cont.43002:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.42999:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43000:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.42997:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.42998:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.42995:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.42996:
	nop
	nop
	nop
	j	bgti_cont.42994

bgti_else.42993:
bgti_cont.42994:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	nop

bgt_cont.42992:
bgt_cont.42958:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	addi	%t3, %a0, 1
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%t3, %t0, bgt_else.43025

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

bgt_else.43025:
	lw	%a0, 3(%sp)
	lw	%a1, 12(%sp)
	nop
	nop

	add	%at, %a0, %t3
	nop
	nop
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
	blt	%a0, %a1, bgt_else.43027

	add	%a0, %zero, %zero
	nop
	nop
	j	bgt_cont.43028

bgt_else.43027:
	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.43029

	add	%a0, %zero, %zero
	nop
	nop
	j	bgt_cont.43030

bgt_else.43029:
	addi	%a0, %t3, 1
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.43031

	add	%a0, %zero, %zero
	nop
	nop
	j	bgt_cont.43032

bgt_else.43031:
	nop
	nop
	nop
	blt	%zero, %t3, bgt_else.43033

	add	%a0, %zero, %zero
	nop
	nop
	j	bgt_cont.43034

bgt_else.43033:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bgt_cont.43034:
bgt_cont.43032:
bgt_cont.43030:
bgt_cont.43028:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.43035

	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t3, 0

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018

	addi	%sp, %sp, -14
	nop
	nop
	j	bnei_cont.43036

bnei_else.43035:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 14
	nop
	jal	do_without_neighbors.3002

	addi	%sp, %sp, -14
	nop
	nop
	nop

bnei_cont.43036:
	flw	%f0, 151(%zero)
	addi	%at, %zero, 255
	nop
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.43037

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.43039

	nop
	nop
	nop
	j	bgt_cont.43038

bgti_else.43039:
	add	%a1, %zero, %zero
	nop
	nop
	nop

bgti_cont.43040:
	nop
	nop
	nop
	j	bgt_cont.43038

bgt_else.43037:
	addi	%a1, %zero, 255
	nop
	nop
	nop

bgt_cont.43038:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.43041

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43043

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43045

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43047

	addi	%a0, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43049

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43051

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43053

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43055

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43057

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43059

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43061

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43063

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.43042

bgti_else.43063:
	addi	%a2, %zero, 11
	nop
	nop
	nop

bgti_cont.43064:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43061:
	addi	%a2, %zero, 10
	nop
	nop
	nop

bgti_cont.43062:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43059:
	addi	%a2, %zero, 9
	nop
	nop
	nop

bgti_cont.43060:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43057:
	addi	%a2, %zero, 8
	nop
	nop
	nop

bgti_cont.43058:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43055:
	addi	%a2, %zero, 7
	nop
	nop
	nop

bgti_cont.43056:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43053:
	addi	%a2, %zero, 6
	nop
	nop
	nop

bgti_cont.43054:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43051:
	addi	%a2, %zero, 5
	nop
	nop
	nop

bgti_cont.43052:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43049:
	addi	%a2, %zero, 4
	nop
	nop
	nop

bgti_cont.43050:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43047:
	addi	%a2, %zero, 3
	nop
	nop
	nop

bgti_cont.43048:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43045:
	addi	%a2, %zero, 2
	nop
	nop
	nop

bgti_cont.43046:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43043:
	add	%a2, %zero, %k1
	nop
	nop
	nop

bgti_cont.43044:
	nop
	nop
	nop
	j	bgti_cont.43042

bgti_else.43041:
	add	%a2, %zero, %zero
	nop
	nop
	nop

bgti_cont.43042:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.43065

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43067

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43069

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43071

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.43066

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43075

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43077

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43079

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.43066

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43083

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43085

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43087

	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.43066

bgti_else.43087:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.43088:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43085:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.43086:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43083:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.43084:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43081:
bgti_cont.43082:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43079:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.43080:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43077:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.43078:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43075:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.43076:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43073:
bgti_cont.43074:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43071:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.43072:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43069:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.43070:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43067:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.43068:
	nop
	nop
	nop
	j	bgti_cont.43066

bgti_else.43065:
bgti_cont.43066:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.43089

	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.43090

bgt_else.43089:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.43091

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43093

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43095

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43097

	addi	%a0, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43099

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43101

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43103

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43105

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43107

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43109

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43111

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43113

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.43092

bgti_else.43113:
	addi	%a0, %zero, 11
	nop
	nop
	nop

bgti_cont.43114:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43111:
	addi	%a0, %zero, 10
	nop
	nop
	nop

bgti_cont.43112:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43109:
	addi	%a0, %zero, 9
	nop
	nop
	nop

bgti_cont.43110:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43107:
	addi	%a0, %zero, 8
	nop
	nop
	nop

bgti_cont.43108:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43105:
	addi	%a0, %zero, 7
	nop
	nop
	nop

bgti_cont.43106:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43103:
	addi	%a0, %zero, 6
	nop
	nop
	nop

bgti_cont.43104:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43101:
	addi	%a0, %zero, 5
	nop
	nop
	nop

bgti_cont.43102:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43099:
	addi	%a0, %zero, 4
	nop
	nop
	nop

bgti_cont.43100:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43097:
	addi	%a0, %zero, 3
	nop
	nop
	nop

bgti_cont.43098:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43095:
	addi	%a0, %zero, 2
	nop
	nop
	nop

bgti_cont.43096:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43093:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bgti_cont.43094:
	nop
	nop
	nop
	j	bgti_cont.43092

bgti_else.43091:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bgti_cont.43092:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.43115

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43117

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43119

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43121

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43116

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43125

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43127

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43129

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43116

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43133

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43135

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43137

	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.43116

bgti_else.43137:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.43138:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43135:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.43136:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43133:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.43134:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43131:
bgti_cont.43132:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43129:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.43130:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43127:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.43128:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43125:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.43126:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43123:
bgti_cont.43124:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43121:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.43122:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43119:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.43120:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43117:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.43118:
	nop
	nop
	nop
	j	bgti_cont.43116

bgti_else.43115:
bgti_cont.43116:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.43139

	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.43140

bgt_else.43139:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43141

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43143

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43145

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43147

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43142

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43151

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43153

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43155

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43142

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43159

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43161

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43163

	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.43142

bgti_else.43163:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43164:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43161:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43162:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43159:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43160:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43157:
bgti_cont.43158:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43155:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43156:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43153:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43154:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43151:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43152:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43149:
bgti_cont.43150:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43147:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43148:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43145:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43146:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43143:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43144:
	nop
	nop
	nop
	j	bgti_cont.43142

bgti_else.43141:
bgti_cont.43142:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	nop

bgt_cont.43140:
bgt_cont.43090:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.43165

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.43167

	nop
	nop
	nop
	j	bgt_cont.43166

bgti_else.43167:
	add	%a1, %zero, %zero
	nop
	nop
	nop

bgti_cont.43168:
	nop
	nop
	nop
	j	bgt_cont.43166

bgt_else.43165:
	addi	%a1, %zero, 255
	nop
	nop
	nop

bgt_cont.43166:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.43169

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43171

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43173

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43175

	addi	%a0, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43177

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43179

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43181

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43183

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43185

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43187

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43189

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43191

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.43170

bgti_else.43191:
	addi	%a2, %zero, 11
	nop
	nop
	nop

bgti_cont.43192:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43189:
	addi	%a2, %zero, 10
	nop
	nop
	nop

bgti_cont.43190:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43187:
	addi	%a2, %zero, 9
	nop
	nop
	nop

bgti_cont.43188:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43185:
	addi	%a2, %zero, 8
	nop
	nop
	nop

bgti_cont.43186:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43183:
	addi	%a2, %zero, 7
	nop
	nop
	nop

bgti_cont.43184:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43181:
	addi	%a2, %zero, 6
	nop
	nop
	nop

bgti_cont.43182:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43179:
	addi	%a2, %zero, 5
	nop
	nop
	nop

bgti_cont.43180:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43177:
	addi	%a2, %zero, 4
	nop
	nop
	nop

bgti_cont.43178:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43175:
	addi	%a2, %zero, 3
	nop
	nop
	nop

bgti_cont.43176:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43173:
	addi	%a2, %zero, 2
	nop
	nop
	nop

bgti_cont.43174:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43171:
	add	%a2, %zero, %k1
	nop
	nop
	nop

bgti_cont.43172:
	nop
	nop
	nop
	j	bgti_cont.43170

bgti_else.43169:
	add	%a2, %zero, %zero
	nop
	nop
	nop

bgti_cont.43170:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.43193

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43195

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43197

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43199

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.43194

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43203

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43205

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43207

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.43194

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43211

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43213

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43215

	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.43194

bgti_else.43215:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.43216:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43213:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.43214:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43211:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.43212:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43209:
bgti_cont.43210:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43207:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.43208:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43205:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.43206:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43203:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.43204:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43201:
bgti_cont.43202:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43199:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.43200:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43197:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.43198:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43195:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.43196:
	nop
	nop
	nop
	j	bgti_cont.43194

bgti_else.43193:
bgti_cont.43194:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.43217

	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.43218

bgt_else.43217:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.43219

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43221

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43223

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43225

	addi	%a0, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43227

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43229

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43231

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43233

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43235

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43237

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43239

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43241

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.43220

bgti_else.43241:
	addi	%a0, %zero, 11
	nop
	nop
	nop

bgti_cont.43242:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43239:
	addi	%a0, %zero, 10
	nop
	nop
	nop

bgti_cont.43240:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43237:
	addi	%a0, %zero, 9
	nop
	nop
	nop

bgti_cont.43238:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43235:
	addi	%a0, %zero, 8
	nop
	nop
	nop

bgti_cont.43236:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43233:
	addi	%a0, %zero, 7
	nop
	nop
	nop

bgti_cont.43234:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43231:
	addi	%a0, %zero, 6
	nop
	nop
	nop

bgti_cont.43232:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43229:
	addi	%a0, %zero, 5
	nop
	nop
	nop

bgti_cont.43230:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43227:
	addi	%a0, %zero, 4
	nop
	nop
	nop

bgti_cont.43228:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43225:
	addi	%a0, %zero, 3
	nop
	nop
	nop

bgti_cont.43226:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43223:
	addi	%a0, %zero, 2
	nop
	nop
	nop

bgti_cont.43224:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43221:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bgti_cont.43222:
	nop
	nop
	nop
	j	bgti_cont.43220

bgti_else.43219:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bgti_cont.43220:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.43243

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43245

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43247

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43249

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43244

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43253

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43255

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43257

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43244

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43261

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43263

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43265

	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.43244

bgti_else.43265:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.43266:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43263:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.43264:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43261:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.43262:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43259:
bgti_cont.43260:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43257:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.43258:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43255:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.43256:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43253:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.43254:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43251:
bgti_cont.43252:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43249:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.43250:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43247:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.43248:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43245:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.43246:
	nop
	nop
	nop
	j	bgti_cont.43244

bgti_else.43243:
bgti_cont.43244:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.43267

	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.43268

bgt_else.43267:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43269

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43271

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43273

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43275

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43270

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43279

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43281

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43283

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43270

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43287

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43289

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43291

	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.43270

bgti_else.43291:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43292:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43289:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43290:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43287:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43288:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43285:
bgti_cont.43286:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43283:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43284:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43281:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43282:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43279:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43280:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43277:
bgti_cont.43278:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43275:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43276:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43273:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43274:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43271:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43272:
	nop
	nop
	nop
	j	bgti_cont.43270

bgti_else.43269:
bgti_cont.43270:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	nop

bgt_cont.43268:
bgt_cont.43218:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.43293

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.43295

	nop
	nop
	nop
	j	bgt_cont.43294

bgti_else.43295:
	add	%a1, %zero, %zero
	nop
	nop
	nop

bgti_cont.43296:
	nop
	nop
	nop
	j	bgt_cont.43294

bgt_else.43293:
	addi	%a1, %zero, 255
	nop
	nop
	nop

bgt_cont.43294:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.43297

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43299

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43301

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43303

	addi	%a0, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43305

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43307

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43309

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43311

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43313

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43315

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43317

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43319

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.43298

bgti_else.43319:
	addi	%a2, %zero, 11
	nop
	nop
	nop

bgti_cont.43320:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43317:
	addi	%a2, %zero, 10
	nop
	nop
	nop

bgti_cont.43318:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43315:
	addi	%a2, %zero, 9
	nop
	nop
	nop

bgti_cont.43316:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43313:
	addi	%a2, %zero, 8
	nop
	nop
	nop

bgti_cont.43314:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43311:
	addi	%a2, %zero, 7
	nop
	nop
	nop

bgti_cont.43312:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43309:
	addi	%a2, %zero, 6
	nop
	nop
	nop

bgti_cont.43310:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43307:
	addi	%a2, %zero, 5
	nop
	nop
	nop

bgti_cont.43308:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43305:
	addi	%a2, %zero, 4
	nop
	nop
	nop

bgti_cont.43306:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43303:
	addi	%a2, %zero, 3
	nop
	nop
	nop

bgti_cont.43304:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43301:
	addi	%a2, %zero, 2
	nop
	nop
	nop

bgti_cont.43302:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43299:
	add	%a2, %zero, %k1
	nop
	nop
	nop

bgti_cont.43300:
	nop
	nop
	nop
	j	bgti_cont.43298

bgti_else.43297:
	add	%a2, %zero, %zero
	nop
	nop
	nop

bgti_cont.43298:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.43321

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43323

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43325

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43327

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.43322

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43331

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43333

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43335

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.43322

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.43339

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.43341

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.43343

	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.43322

bgti_else.43343:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.43344:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43341:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.43342:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43339:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.43340:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43337:
bgti_cont.43338:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43335:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.43336:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43333:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.43334:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43331:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.43332:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43329:
bgti_cont.43330:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43327:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.43328:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43325:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.43326:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43323:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.43324:
	nop
	nop
	nop
	j	bgti_cont.43322

bgti_else.43321:
bgti_cont.43322:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.43345

	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.43346

bgt_else.43345:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.43347

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43349

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43351

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43353

	addi	%a0, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43355

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43357

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43359

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43361

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43363

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43365

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43367

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43369

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.43348

bgti_else.43369:
	addi	%a0, %zero, 11
	nop
	nop
	nop

bgti_cont.43370:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43367:
	addi	%a0, %zero, 10
	nop
	nop
	nop

bgti_cont.43368:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43365:
	addi	%a0, %zero, 9
	nop
	nop
	nop

bgti_cont.43366:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43363:
	addi	%a0, %zero, 8
	nop
	nop
	nop

bgti_cont.43364:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43361:
	addi	%a0, %zero, 7
	nop
	nop
	nop

bgti_cont.43362:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43359:
	addi	%a0, %zero, 6
	nop
	nop
	nop

bgti_cont.43360:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43357:
	addi	%a0, %zero, 5
	nop
	nop
	nop

bgti_cont.43358:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43355:
	addi	%a0, %zero, 4
	nop
	nop
	nop

bgti_cont.43356:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43353:
	addi	%a0, %zero, 3
	nop
	nop
	nop

bgti_cont.43354:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43351:
	addi	%a0, %zero, 2
	nop
	nop
	nop

bgti_cont.43352:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43349:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bgti_cont.43350:
	nop
	nop
	nop
	j	bgti_cont.43348

bgti_else.43347:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bgti_cont.43348:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.43371

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43373

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43375

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43377

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43372

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43381

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43383

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43385

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.43372

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.43389

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.43391

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.43393

	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.43372

bgti_else.43393:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.43394:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43391:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.43392:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43389:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.43390:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43387:
bgti_cont.43388:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43385:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.43386:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43383:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.43384:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43381:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.43382:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43379:
bgti_cont.43380:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43377:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.43378:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43375:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.43376:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43373:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.43374:
	nop
	nop
	nop
	j	bgti_cont.43372

bgti_else.43371:
bgti_cont.43372:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.43395

	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	j	bgt_cont.43396

bgt_else.43395:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43397

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43399

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43401

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43403

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43398

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43407

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43409

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43411

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.43398

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.43415

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.43417

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.43419

	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.43398

bgti_else.43419:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43420:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43417:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43418:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43415:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43416:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43413:
bgti_cont.43414:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43411:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43412:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43409:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43410:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43407:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43408:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43405:
bgti_cont.43406:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43403:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.43404:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43401:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.43402:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43399:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.43400:
	nop
	nop
	nop
	j	bgti_cont.43398

bgti_else.43397:
bgti_cont.43398:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	nop
	nop
	nop

bgt_cont.43396:
bgt_cont.43346:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -14
	addi	%v0, %t3, 1
	nop
	nop

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
	add	%a3, %zero, %v0
	add	%v0, %zero, %a1
	add	%a1, %zero, %t0
	nop

	sw	%a3, 0(%sp)
	lw	%t0, 155(%zero)
	nop
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%a0, 2(%sp)
	add	%a0, %zero, %a2
	nop
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
	blt	%a3, %t0, bgt_else.44704

	add	%t0, %zero, %a1
	nop
	nop
	jr	%ra

bgt_else.44704:
	addi	%a1, %t0, -1
	nop
	nop
	nop

	sw	%a1, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a3, %a1, bgt_else.44706

	nop
	nop
	nop
	j	bgt_cont.44707

bgt_else.44706:
	addi	%a2, %a3, 1
	flw	%f1, 158(%zero)
	addi	%sp, %sp, 11
	nop

	lw	%a1, 157(%zero)
	nop
	nop
	nop

	nop
	nop
	sub	%a1, %a2, %a1
	nop

	lw	%a1, 154(%zero)
	nop
	itof	%f0, %a1
	nop

	flw	%f0, 168(%zero)
	addi	%v1, %a1, -1
	fmul	%f17, %f1, %f0
	nop

	flw	%f0, 171(%zero)
	nop
	fmul	%f1, %f17, %f0
	nop

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 172(%zero)
	nop
	fmul	%f16, %f17, %f1
	nop

	flw	%f16, 170(%zero)
	nop
	fadd	%f1, %f16, %f1
	nop

	flw	%f16, 173(%zero)
	nop
	fmul	%f17, %f17, %f16
	nop

	nop
	nop
	fadd	%f2, %f17, %f16
	jal	pretrace_pixels.3034

	addi	%sp, %sp, -11
	nop
	nop
	nop

bgt_cont.44707:
	lw	%t1, 154(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %t1, bgt_else.44708

	nop
	nop
	nop
	j	bgt_cont.44709

bgt_else.44708:
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
	blt	%a0, %t0, bgt_else.44710

	nop
	nop
	nop
	j	bgt_cont.44711

bgt_else.44710:
	nop
	nop
	nop
	blt	%zero, %a1, bgt_else.44712

	nop
	nop
	nop
	j	bgt_cont.44713

bgt_else.44712:
	nop
	nop
	nop
	blt	%k1, %t1, bgt_else.44714

	nop
	nop
	nop
	j	bgt_cont.44715

bgt_else.44714:
bgt_cont.44715:
bgt_cont.44713:
bgt_cont.44711:
	nop
	nop
	nop
	beqi	%zero, 0, bnei_else.44716

	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0

	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3018

	addi	%sp, %sp, -11
	nop
	nop
	j	bnei_cont.44717

bnei_else.44716:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11
	nop
	jal	do_without_neighbors.3002

	addi	%sp, %sp, -11
	nop
	nop
	nop

bnei_cont.44717:
	flw	%f0, 151(%zero)
	addi	%at, %zero, 255
	nop
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44718

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44720

	nop
	nop
	nop
	j	bgt_cont.44719

bgti_else.44720:
	add	%a1, %zero, %zero
	nop
	nop
	nop

bgti_cont.44721:
	nop
	nop
	nop
	j	bgt_cont.44719

bgt_else.44718:
	addi	%a1, %zero, 255
	nop
	nop
	nop

bgt_cont.44719:
	addi	%a3, %zero, 10
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44722

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44724

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44726

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44728

	addi	%a0, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44730

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44732

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44734

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44736

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44738

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44740

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44742

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44744

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.44723

bgti_else.44744:
	addi	%a2, %zero, 11
	nop
	nop
	nop

bgti_cont.44745:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44742:
	addi	%a2, %zero, 10
	nop
	nop
	nop

bgti_cont.44743:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44740:
	addi	%a2, %zero, 9
	nop
	nop
	nop

bgti_cont.44741:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44738:
	addi	%a2, %zero, 8
	nop
	nop
	nop

bgti_cont.44739:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44736:
	addi	%a2, %zero, 7
	nop
	nop
	nop

bgti_cont.44737:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44734:
	addi	%a2, %zero, 6
	nop
	nop
	nop

bgti_cont.44735:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44732:
	addi	%a2, %zero, 5
	nop
	nop
	nop

bgti_cont.44733:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44730:
	addi	%a2, %zero, 4
	nop
	nop
	nop

bgti_cont.44731:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44728:
	addi	%a2, %zero, 3
	nop
	nop
	nop

bgti_cont.44729:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44726:
	addi	%a2, %zero, 2
	nop
	nop
	nop

bgti_cont.44727:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44724:
	add	%a2, %zero, %k1
	nop
	nop
	nop

bgti_cont.44725:
	nop
	nop
	nop
	j	bgti_cont.44723

bgti_else.44722:
	add	%a2, %zero, %zero
	nop
	nop
	nop

bgti_cont.44723:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44746

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44748

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44750

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44752

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44747

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44756

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44758

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44760

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44747

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

	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.44747

bgti_else.44768:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.44769:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44766:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.44767:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44764:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.44765:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44762:
bgti_cont.44763:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44760:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.44761:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44758:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.44759:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44756:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.44757:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44754:
bgti_cont.44755:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44752:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.44753:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44750:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.44751:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44748:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.44749:
	nop
	nop
	nop
	j	bgti_cont.44747

bgti_else.44746:
bgti_cont.44747:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.44770

	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	nop
	nop
	j	bgt_cont.44771

bgt_else.44770:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44772

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44774

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44776

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44778

	addi	%a0, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44780

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44782

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44784

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44786

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44788

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44790

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44792

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44794

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.44773

bgti_else.44794:
	addi	%a0, %zero, 11
	nop
	nop
	nop

bgti_cont.44795:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44792:
	addi	%a0, %zero, 10
	nop
	nop
	nop

bgti_cont.44793:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44790:
	addi	%a0, %zero, 9
	nop
	nop
	nop

bgti_cont.44791:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44788:
	addi	%a0, %zero, 8
	nop
	nop
	nop

bgti_cont.44789:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44786:
	addi	%a0, %zero, 7
	nop
	nop
	nop

bgti_cont.44787:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44784:
	addi	%a0, %zero, 6
	nop
	nop
	nop

bgti_cont.44785:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44782:
	addi	%a0, %zero, 5
	nop
	nop
	nop

bgti_cont.44783:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44780:
	addi	%a0, %zero, 4
	nop
	nop
	nop

bgti_cont.44781:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44778:
	addi	%a0, %zero, 3
	nop
	nop
	nop

bgti_cont.44779:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44776:
	addi	%a0, %zero, 2
	nop
	nop
	nop

bgti_cont.44777:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44774:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bgti_cont.44775:
	nop
	nop
	nop
	j	bgti_cont.44773

bgti_else.44772:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bgti_cont.44773:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44796

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44798

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44800

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44802

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44797

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44806

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44808

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44810

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44797

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

	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.44797

bgti_else.44818:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.44819:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44816:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.44817:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44814:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.44815:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44812:
bgti_cont.44813:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44810:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.44811:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44808:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.44809:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44806:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.44807:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44804:
bgti_cont.44805:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44802:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.44803:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44800:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.44801:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44798:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.44799:
	nop
	nop
	nop
	j	bgti_cont.44797

bgti_else.44796:
bgti_cont.44797:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44820

	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	nop
	nop
	j	bgt_cont.44821

bgt_else.44820:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44822

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44824

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44826

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44828

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44823

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44832

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44834

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44836

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44823

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

	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.44823

bgti_else.44844:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.44845:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44842:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.44843:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44840:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.44841:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44838:
bgti_cont.44839:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44836:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.44837:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44834:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.44835:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44832:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.44833:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44830:
bgti_cont.44831:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44828:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.44829:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44826:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.44827:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44824:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.44825:
	nop
	nop
	nop
	j	bgti_cont.44823

bgti_else.44822:
bgti_cont.44823:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	nop
	nop
	nop

bgt_cont.44821:
bgt_cont.44771:
	addi	%a1, %zero, 32
	addi	%sp, %sp, 11
	nop
	nop

	addi	%v0, %a1, 0
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	flw	%f0, 152(%zero)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a2, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.44846

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.44848

	nop
	nop
	nop
	j	bgt_cont.44847

bgti_else.44848:
	add	%a2, %zero, %zero
	nop
	nop
	nop

bgti_cont.44849:
	nop
	nop
	nop
	j	bgt_cont.44847

bgt_else.44846:
	addi	%a2, %zero, 255
	nop
	nop
	nop

bgt_cont.44847:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44850

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44852

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44854

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44856

	addi	%a0, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44858

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44860

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44862

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44864

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44866

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44868

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44870

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44872

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	addi	%sp, %sp, -11
	addi	%fp, %v0, 0
	nop
	j	bgti_cont.44851

bgti_else.44872:
	addi	%fp, %zero, 11
	nop
	nop
	nop

bgti_cont.44873:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44870:
	addi	%fp, %zero, 10
	nop
	nop
	nop

bgti_cont.44871:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44868:
	addi	%fp, %zero, 9
	nop
	nop
	nop

bgti_cont.44869:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44866:
	addi	%fp, %zero, 8
	nop
	nop
	nop

bgti_cont.44867:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44864:
	addi	%fp, %zero, 7
	nop
	nop
	nop

bgti_cont.44865:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44862:
	addi	%fp, %zero, 6
	nop
	nop
	nop

bgti_cont.44863:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44860:
	addi	%fp, %zero, 5
	nop
	nop
	nop

bgti_cont.44861:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44858:
	addi	%fp, %zero, 4
	nop
	nop
	nop

bgti_cont.44859:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44856:
	addi	%fp, %zero, 3
	nop
	nop
	nop

bgti_cont.44857:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44854:
	addi	%fp, %zero, 2
	nop
	nop
	nop

bgti_cont.44855:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44852:
	add	%fp, %zero, %k1
	nop
	nop
	nop

bgti_cont.44853:
	nop
	nop
	nop
	j	bgti_cont.44851

bgti_else.44850:
	add	%fp, %zero, %zero
	nop
	nop
	nop

bgti_cont.44851:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44874

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44876

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44878

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44880

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44875

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44884

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44886

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44888

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44875

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44892

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44894

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44896

	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.44875

bgti_else.44896:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.44897:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44894:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.44895:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44892:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.44893:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44890:
bgti_cont.44891:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44888:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.44889:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44886:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.44887:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44884:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.44885:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44882:
bgti_cont.44883:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44880:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.44881:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44878:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.44879:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44876:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.44877:
	nop
	nop
	nop
	j	bgti_cont.44875

bgti_else.44874:
bgti_cont.44875:
	nop
	nop
	nop
	blt	%zero, %fp, bgt_else.44898

	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	nop
	nop
	j	bgt_cont.44899

bgt_else.44898:
	nop
	nop
	nop
	blti	%fp, 10, bgti_else.44900

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.44902

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.44904

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.44906

	addi	%a0, %fp, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44908

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44910

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44912

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44914

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44916

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44918

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44920

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44922

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.44901

bgti_else.44922:
	addi	%a0, %zero, 11
	nop
	nop
	nop

bgti_cont.44923:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44920:
	addi	%a0, %zero, 10
	nop
	nop
	nop

bgti_cont.44921:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44918:
	addi	%a0, %zero, 9
	nop
	nop
	nop

bgti_cont.44919:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44916:
	addi	%a0, %zero, 8
	nop
	nop
	nop

bgti_cont.44917:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44914:
	addi	%a0, %zero, 7
	nop
	nop
	nop

bgti_cont.44915:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44912:
	addi	%a0, %zero, 6
	nop
	nop
	nop

bgti_cont.44913:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44910:
	addi	%a0, %zero, 5
	nop
	nop
	nop

bgti_cont.44911:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44908:
	addi	%a0, %zero, 4
	nop
	nop
	nop

bgti_cont.44909:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44906:
	addi	%a0, %zero, 3
	nop
	nop
	nop

bgti_cont.44907:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44904:
	addi	%a0, %zero, 2
	nop
	nop
	nop

bgti_cont.44905:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44902:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bgti_cont.44903:
	nop
	nop
	nop
	j	bgti_cont.44901

bgti_else.44900:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bgti_cont.44901:
	nop
	nop
	nop
	blti	%fp, 10, bgti_else.44924

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.44926

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.44928

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.44930

	addi	%fp, %fp, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.44925

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.44934

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.44936

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.44938

	addi	%fp, %fp, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.44925

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.44942

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.44944

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.44946

	addi	%v0, %fp, -40
	addi	%sp, %sp, 11
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -11
	addi	%fp, %v0, 0
	nop
	j	bgti_cont.44925

bgti_else.44946:
	addi	%fp, %fp, -30
	nop
	nop
	nop

bgti_cont.44947:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44944:
	addi	%fp, %fp, -20
	nop
	nop
	nop

bgti_cont.44945:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44942:
	addi	%fp, %fp, -10
	nop
	nop
	nop

bgti_cont.44943:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44940:
bgti_cont.44941:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44938:
	addi	%fp, %fp, -30
	nop
	nop
	nop

bgti_cont.44939:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44936:
	addi	%fp, %fp, -20
	nop
	nop
	nop

bgti_cont.44937:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44934:
	addi	%fp, %fp, -10
	nop
	nop
	nop

bgti_cont.44935:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44932:
bgti_cont.44933:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44930:
	addi	%fp, %fp, -30
	nop
	nop
	nop

bgti_cont.44931:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44928:
	addi	%fp, %fp, -20
	nop
	nop
	nop

bgti_cont.44929:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44926:
	addi	%fp, %fp, -10
	nop
	nop
	nop

bgti_cont.44927:
	nop
	nop
	nop
	j	bgti_cont.44925

bgti_else.44924:
bgti_cont.44925:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44948

	addi	%v0, %fp, 48
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	nop
	nop
	j	bgt_cont.44949

bgt_else.44948:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44950

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44952

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44954

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44956

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44951

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44960

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44962

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44964

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44951

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44968

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44970

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44972

	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.44951

bgti_else.44972:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.44973:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44970:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.44971:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44968:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.44969:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44966:
bgti_cont.44967:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44964:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.44965:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44962:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.44963:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44960:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.44961:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44958:
bgti_cont.44959:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44956:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.44957:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44954:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.44955:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44952:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.44953:
	nop
	nop
	nop
	j	bgti_cont.44951

bgti_else.44950:
bgti_cont.44951:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%v0, %fp, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	nop
	nop
	nop

bgt_cont.44949:
bgt_cont.44899:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	flw	%f0, 153(%zero)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44974

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44976

	nop
	nop
	nop
	j	bgt_cont.44975

bgti_else.44976:
	add	%a1, %zero, %zero
	nop
	nop
	nop

bgti_cont.44977:
	nop
	nop
	nop
	j	bgt_cont.44975

bgt_else.44974:
	addi	%a1, %zero, 255
	nop
	nop
	nop

bgt_cont.44975:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44978

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44980

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44982

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44984

	addi	%a0, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44986

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44988

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44990

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44992

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44994

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44996

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44998

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45000

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.44979

bgti_else.45000:
	addi	%a2, %zero, 11
	nop
	nop
	nop

bgti_cont.45001:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44998:
	addi	%a2, %zero, 10
	nop
	nop
	nop

bgti_cont.44999:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44996:
	addi	%a2, %zero, 9
	nop
	nop
	nop

bgti_cont.44997:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44994:
	addi	%a2, %zero, 8
	nop
	nop
	nop

bgti_cont.44995:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44992:
	addi	%a2, %zero, 7
	nop
	nop
	nop

bgti_cont.44993:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44990:
	addi	%a2, %zero, 6
	nop
	nop
	nop

bgti_cont.44991:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44988:
	addi	%a2, %zero, 5
	nop
	nop
	nop

bgti_cont.44989:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44986:
	addi	%a2, %zero, 4
	nop
	nop
	nop

bgti_cont.44987:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44984:
	addi	%a2, %zero, 3
	nop
	nop
	nop

bgti_cont.44985:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44982:
	addi	%a2, %zero, 2
	nop
	nop
	nop

bgti_cont.44983:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44980:
	add	%a2, %zero, %k1
	nop
	nop
	nop

bgti_cont.44981:
	nop
	nop
	nop
	j	bgti_cont.44979

bgti_else.44978:
	add	%a2, %zero, %zero
	nop
	nop
	nop

bgti_cont.44979:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.45002

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.45004

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.45006

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.45008

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.45003

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.45012

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.45014

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.45016

	addi	%a1, %a1, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.45003

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.45020

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.45022

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.45024

	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.45003

bgti_else.45024:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.45025:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45022:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.45023:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45020:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.45021:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45018:
bgti_cont.45019:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45016:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.45017:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45014:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.45015:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45012:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.45013:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45010:
bgti_cont.45011:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45008:
	addi	%a1, %a1, -30
	nop
	nop
	nop

bgti_cont.45009:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45006:
	addi	%a1, %a1, -20
	nop
	nop
	nop

bgti_cont.45007:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45004:
	addi	%a1, %a1, -10
	nop
	nop
	nop

bgti_cont.45005:
	nop
	nop
	nop
	j	bgti_cont.45003

bgti_else.45002:
bgti_cont.45003:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.45026

	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	nop
	nop
	j	bgt_cont.45027

bgt_else.45026:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.45028

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.45030

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.45032

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.45034

	addi	%a0, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.45036

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45038

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45040

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45042

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.45044

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45046

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45048

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45050

	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629

	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.45029

bgti_else.45050:
	addi	%a0, %zero, 11
	nop
	nop
	nop

bgti_cont.45051:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45048:
	addi	%a0, %zero, 10
	nop
	nop
	nop

bgti_cont.45049:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45046:
	addi	%a0, %zero, 9
	nop
	nop
	nop

bgti_cont.45047:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45044:
	addi	%a0, %zero, 8
	nop
	nop
	nop

bgti_cont.45045:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45042:
	addi	%a0, %zero, 7
	nop
	nop
	nop

bgti_cont.45043:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45040:
	addi	%a0, %zero, 6
	nop
	nop
	nop

bgti_cont.45041:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45038:
	addi	%a0, %zero, 5
	nop
	nop
	nop

bgti_cont.45039:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45036:
	addi	%a0, %zero, 4
	nop
	nop
	nop

bgti_cont.45037:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45034:
	addi	%a0, %zero, 3
	nop
	nop
	nop

bgti_cont.45035:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45032:
	addi	%a0, %zero, 2
	nop
	nop
	nop

bgti_cont.45033:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45030:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bgti_cont.45031:
	nop
	nop
	nop
	j	bgti_cont.45029

bgti_else.45028:
	add	%a0, %zero, %zero
	nop
	nop
	nop

bgti_cont.45029:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.45052

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.45054

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.45056

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.45058

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.45053

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.45062

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.45064

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.45066

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.45053

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.45070

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.45072

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.45074

	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.45053

bgti_else.45074:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.45075:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45072:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.45073:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45070:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.45071:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45068:
bgti_cont.45069:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45066:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.45067:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45064:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.45065:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45062:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.45063:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45060:
bgti_cont.45061:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45058:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.45059:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45056:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.45057:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45054:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.45055:
	nop
	nop
	nop
	j	bgti_cont.45053

bgti_else.45052:
bgti_cont.45053:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.45076

	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	nop
	nop
	j	bgt_cont.45077

bgt_else.45076:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.45078

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45080

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45082

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45084

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.45079

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45088

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45090

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45092

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.45079

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45096

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45098

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45100

	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.45079

bgti_else.45100:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.45101:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45098:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.45099:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45096:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.45097:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45094:
bgti_cont.45095:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45092:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.45093:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45090:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.45091:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45088:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.45089:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45086:
bgti_cont.45087:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45084:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.45085:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45082:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.45083:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45080:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.45081:
	nop
	nop
	nop
	j	bgti_cont.45079

bgti_else.45078:
bgti_cont.45079:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a1, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	nop
	nop
	nop

bgt_cont.45077:
bgt_cont.45027:
	addi	%v0, %a3, 0
	addi	%sp, %sp, 11
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -11
	addi	%v0, %k1, 0
	nop
	nop

	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 11
	jal	scan_pixel.3045

	addi	%sp, %sp, -11
	nop
	nop
	nop

bgt_cont.44709:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	addi	%t2, %a0, 1
	lw	%a0, 4(%sp)
	nop
	nop

	addi	%t3, %a0, 2
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t3, 5, bgti_else.45102

	addi	%t3, %t3, -5
	nop
	nop
	j	bgti_cont.45103

bgti_else.45102:
bgti_cont.45103:
	nop
	nop
	nop
	blt	%t2, %t0, bgt_else.45104

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

bgt_else.45104:
	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%t2, %a0, bgt_else.45106

	nop
	nop
	nop
	j	bgt_cont.45107

bgt_else.45106:
	addi	%a1, %t2, 1
	flw	%f1, 158(%zero)
	addi	%v1, %t1, -1
	nop

	lw	%a0, 157(%zero)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 11
	nop

	nop
	nop
	sub	%a0, %a1, %a0
	nop

	addi	%a0, %t3, 0
	nop
	itof	%f0, %a0
	nop

	flw	%f0, 168(%zero)
	nop
	fmul	%f17, %f1, %f0
	nop

	flw	%f0, 171(%zero)
	nop
	fmul	%f1, %f17, %f0
	nop

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 172(%zero)
	nop
	fmul	%f16, %f17, %f1
	nop

	flw	%f16, 170(%zero)
	nop
	fadd	%f1, %f16, %f1
	nop

	flw	%f16, 173(%zero)
	nop
	fmul	%f17, %f17, %f16
	nop

	nop
	nop
	fadd	%f2, %f17, %f16
	jal	pretrace_pixels.3034

	addi	%sp, %sp, -11
	nop
	nop
	nop

bgt_cont.45107:
	lw	%a2, 1(%sp)
	lw	%a1, 3(%sp)
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	lw	%a0, 2(%sp)
	addi	%sp, %sp, 11
	nop
	jal	scan_pixel.3045

	addi	%sp, %sp, -11
	addi	%v0, %t2, 1
	addi	%a2, %t3, 2
	nop

	nop
	nop
	nop
	blti	%a2, 5, bgti_else.45108

	addi	%a2, %a2, -5
	nop
	nop
	j	bgti_cont.45109

bgti_else.45108:
bgti_cont.45109:
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
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.45142

	addi	%fp, %zero, 3
	nop
	fmov	%f0, %fzero
	nop

	addi	%v0, %fp, 0
	nop
	nop
	jal	min_caml_create_float_array

	addi	%k0, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%s0, %zero, 5
	nop
	nop

	addi	%v0, %s0, 0
	nop
	nop
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
	nop
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
	nop
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
	nop
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
	add	%at, %a1, %a2

	sw	%a0, 7(%ra)
	nop
	nop
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
	addi	%s4, %a2, -1
	nop
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
	blti	%s4, 0, bgti_else.45143

	addi	%v0, %fp, 0
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a2, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	nop
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
	nop
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
	nop
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
	nop
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
	add	%at, %a1, %s4

	sw	%a0, 7(%ra)
	addi	%s4, %s4, -1
	nop
	nop

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
	blti	%s4, 0, bgti_else.45144

	addi	%v0, %fp, 0
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a2, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	nop
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
	nop
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
	nop
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
	nop
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
	add	%at, %a1, %s4

	sw	%a0, 7(%ra)
	addi	%s4, %s4, -1
	nop
	nop

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
	blti	%s4, 0, bgti_else.45145

	addi	%v0, %fp, 0
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a2, %v0, 0
	addi	%v0, %fp, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	nop
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
	nop
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
	nop
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
	nop
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
	add	%at, %a1, %s4

	sw	%a0, 7(%fp)
	addi	%v1, %s4, -1
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0

	sw	%s6, 6(%fp)
	nop
	nop
	nop

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

bgti_else.45145:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45144:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45143:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45142:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	nop
	nop

	nop
	nop
	nop
	jr	%ra

calc_dirvec.3071:
	nop
	nop
	nop
	blti	%v0, 5, bgti_else.45278

	lw	%a2, 179(%v1)
	nop
	fmul	%f17, %f0, %f0
	fmul	%f16, %f1, %f1

	add	%at, %a2, %a0
	nop
	fadd	%f16, %f17, %f16
	nop

	lw	%a1, 0(%at)
	nop
	fadd	%f16, %f16, %f30
	nop

	lw	%a1, 0(%a1)
	nop
	fsqrt	%f17, %f16
	nop

	nop
	nop
	fdiv	%f19, %f0, %f17
	fdiv	%f16, %f1, %f17

	fsw	%f19, 0(%a1)
	nop
	fdiv	%f18, %f30, %f17
	fneg	%f0, %f16

	fsw	%f16, 1(%a1)
	nop
	fneg	%f1, %f19
	fneg	%f17, %f19

	fsw	%f18, 2(%a1)
	nop
	nop
	nop

	addi	%a1, %a0, 40
	nop
	nop
	nop

	add	%at, %a2, %a1
	nop
	nop
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%a1)
	nop
	nop
	nop

	fsw	%f19, 0(%a1)
	nop
	nop
	nop

	fsw	%f18, 1(%a1)
	nop
	nop
	nop

	fsw	%f0, 2(%a1)
	nop
	fneg	%f0, %f16
	nop

	addi	%a1, %a0, 80
	nop
	nop
	nop

	add	%at, %a2, %a1
	nop
	nop
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%a1)
	nop
	nop
	nop

	fsw	%f18, 0(%a1)
	nop
	nop
	nop

	fsw	%f1, 1(%a1)
	nop
	fneg	%f1, %f16
	nop

	fsw	%f0, 2(%a1)
	nop
	fneg	%f0, %f18
	nop

	addi	%a1, %a0, 1
	nop
	nop
	nop

	add	%at, %a2, %a1
	nop
	nop
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%a1)
	nop
	nop
	nop

	fsw	%f17, 0(%a1)
	nop
	nop
	nop

	fsw	%f1, 1(%a1)
	nop
	fneg	%f1, %f19
	nop

	fsw	%f0, 2(%a1)
	nop
	fneg	%f0, %f18
	nop

	addi	%a1, %a0, 41
	addi	%a0, %a0, 81
	nop
	nop

	add	%at, %a2, %a1
	nop
	nop
	nop

	lw	%a1, 0(%at)
	add	%at, %a2, %a0
	nop
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
	fneg	%f0, %f18
	nop

	fsw	%f16, 2(%a1)
	fsw	%f0, 0(%a0)
	nop
	nop

	fsw	%f19, 1(%a0)
	nop
	nop
	nop

	fsw	%f16, 2(%a0)
	nop
	nop
	jr	%ra

bgti_else.45278:
	flw	%f17, 441(%zero)
	nop
	fmul	%f0, %f1, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	nop
	nop
	fsqrt	%f19, %f0
	nop

	nop
	nop
	fdiv	%f21, %f30, %f19
	nop

	nop
	nop
	nop
	fblt	%f21, %fzero, fbgt_else.45280

	add	%a1, %zero, %k1
	nop
	nop
	j	fbgt_cont.45281

fbgt_else.45280:
	add	%a1, %zero, %zero
	nop
	nop
	nop

fbgt_cont.45281:
	flw	%f18, 462(%zero)
	nop
	fabs	%f20, %f21
	nop

	nop
	nop
	nop
	fblt	%f20, %f18, fbgt_else.45282

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_else.45284

	flw	%f16, 480(%zero)
	flw	%f0, 461(%zero)
	fdiv	%f22, %f30, %f20
	nop

	nop
	nop
	fmul	%f23, %f22, %f22
	fmul	%f0, %f0, %f22

	nop
	nop
	fmul	%f21, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 460(%zero)
	nop
	fmul	%f20, %f21, %f21
	fsub	%f1, %f22, %f0

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
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
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f16, %f0
	j	fbgt_cont.45285

fbgt_else.45284:
	flw	%f16, 479(%zero)
	nop
	fsub	%f1, %f20, %f30
	fadd	%f0, %f20, %f30

	flw	%f0, 461(%zero)
	nop
	fdiv	%f22, %f1, %f0
	nop

	nop
	nop
	fmul	%f23, %f22, %f22
	fmul	%f0, %f0, %f22

	nop
	nop
	fmul	%f21, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 460(%zero)
	nop
	fmul	%f20, %f21, %f21
	fsub	%f1, %f22, %f0

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
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
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

fbgt_cont.45285:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45286

	nop
	nop
	nop
	j	fbgt_cont.45283

bnei_else.45286:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45287:
	nop
	nop
	nop
	j	fbgt_cont.45283

fbgt_else.45282:
	flw	%f0, 461(%zero)
	nop
	fmul	%f22, %f21, %f21
	nop

	nop
	nop
	fmul	%f20, %f22, %f22
	fmul	%f0, %f0, %f21

	nop
	nop
	fmul	%f16, %f20, %f20
	fmul	%f0, %f0, %f22

	flw	%f0, 460(%zero)
	nop
	fsub	%f1, %f21, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
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
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.45283:
	flw	%f16, 482(%zero)
	nop
	fmul	%f1, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45288

	add	%a1, %zero, %k1
	nop
	nop
	j	fbgt_cont.45289

fbgt_else.45288:
	add	%a1, %zero, %zero
	nop
	nop
	nop

fbgt_cont.45289:
	flw	%f20, 481(%zero)
	nop
	fabs	%f21, %f1
	nop

	nop
	nop
	fdiv	%f0, %f21, %f20
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fsub	%f0, %f21, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.45290

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45292

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.45291

bnei_else.45292:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.45293:
	nop
	nop
	nop
	j	fbgt_cont.45291

fbgt_else.45290:
fbgt_cont.45291:
	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.45294

	nop
	nop
	fsub	%f0, %f0, %f16
	j	fbgt_cont.45295

fbgt_else.45294:
fbgt_cont.45295:
	flw	%f21, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f21, fbgt_else.45296

	nop
	nop
	fsub	%f0, %f16, %f0
	j	fbgt_cont.45297

fbgt_else.45296:
fbgt_cont.45297:
	flw	%f22, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f0, fbgt_else.45298

	flw	%f23, 478(%zero)
	nop
	fmul	%f26, %f0, %f0
	nop

	nop
	nop
	fmul	%f25, %f26, %f26
	fmul	%f23, %f23, %f0

	nop
	nop
	fmul	%f23, %f23, %f26
	nop

	flw	%f23, 477(%zero)
	nop
	fsub	%f24, %f0, %f23
	nop

	nop
	nop
	fmul	%f23, %f23, %f0
	nop

	nop
	nop
	fmul	%f23, %f23, %f25
	nop

	flw	%f23, 476(%zero)
	nop
	fadd	%f24, %f24, %f23
	nop

	nop
	nop
	fmul	%f0, %f23, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	nop
	nop
	fsub	%f0, %f24, %f0
	j	fbgt_cont.45299

fbgt_else.45298:
	nop
	nop
	fsub	%f0, %f21, %f0
	nop

	flw	%f0, 474(%zero)
	nop
	fmul	%f25, %f0, %f0
	nop

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f0, %f0, %f25

	flw	%f0, 473(%zero)
	nop
	fsub	%f23, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f23, %f23, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fsub	%f0, %f23, %f0
	nop

fbgt_cont.45299:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45300

	nop
	nop
	nop
	j	bnei_cont.45301

bnei_else.45300:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45301:
	nop
	nop
	fabs	%f23, %f1
	nop

	nop
	nop
	fdiv	%f1, %f23, %f20
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fsub	%f1, %f23, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f16, fbgt_else.45302

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.45303

fbgt_else.45302:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45303:
	nop
	nop
	nop
	fblt	%f1, %f16, fbgt_else.45304

	nop
	nop
	fsub	%f1, %f1, %f16
	j	fbgt_cont.45305

fbgt_else.45304:
fbgt_cont.45305:
	nop
	nop
	nop
	fblt	%f1, %f21, fbgt_else.45306

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45308

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.45307

bnei_else.45308:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.45309:
	nop
	nop
	nop
	j	fbgt_cont.45307

fbgt_else.45306:
fbgt_cont.45307:
	nop
	nop
	nop
	fblt	%f1, %f21, fbgt_else.45310

	nop
	nop
	fsub	%f1, %f16, %f1
	j	fbgt_cont.45311

fbgt_else.45310:
fbgt_cont.45311:
	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_else.45312

	flw	%f1, 474(%zero)
	nop
	fmul	%f25, %f1, %f1
	nop

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f1, %f1, %f25

	flw	%f1, 473(%zero)
	nop
	fsub	%f23, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f23, %f23, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f25
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fsub	%f1, %f23, %f1
	j	fbgt_cont.45313

fbgt_else.45312:
	flw	%f1, 478(%zero)
	nop
	fsub	%f26, %f21, %f1
	nop

	nop
	nop
	fmul	%f25, %f26, %f26
	fmul	%f1, %f1, %f26

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f1, %f1, %f25

	flw	%f1, 477(%zero)
	nop
	fsub	%f23, %f26, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f26
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	flw	%f1, 476(%zero)
	nop
	fadd	%f23, %f23, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f26
	nop

	nop
	nop
	fmul	%f1, %f1, %f25
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fsub	%f1, %f23, %f1
	nop

fbgt_cont.45313:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45314

	nop
	nop
	nop
	j	bnei_cont.45315

bnei_else.45314:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.45315:
	addi	%v0, %v0, 1
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f17
	nop

	nop
	nop
	fsqrt	%f19, %f1
	nop

	nop
	nop
	fdiv	%f23, %f30, %f19
	nop

	nop
	nop
	nop
	fblt	%f23, %fzero, fbgt_else.45316

	add	%a1, %zero, %k1
	nop
	nop
	j	fbgt_cont.45317

fbgt_else.45316:
	add	%a1, %zero, %zero
	nop
	nop
	nop

fbgt_cont.45317:
	nop
	nop
	fabs	%f24, %f23
	nop

	nop
	nop
	nop
	fblt	%f24, %f18, fbgt_else.45318

	flw	%f1, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_else.45320

	flw	%f1, 461(%zero)
	nop
	fdiv	%f24, %f30, %f24
	nop

	nop
	nop
	fmul	%f25, %f24, %f24
	fmul	%f1, %f1, %f24

	nop
	nop
	fmul	%f23, %f25, %f25
	fmul	%f1, %f1, %f25

	flw	%f1, 460(%zero)
	nop
	fmul	%f18, %f23, %f23
	fsub	%f17, %f24, %f1

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	flw	%f1, 459(%zero)
	nop
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f25
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	flw	%f1, 458(%zero)
	nop
	fsub	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 457(%zero)
	nop
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f25
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 456(%zero)
	nop
	fsub	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fadd	%f1, %f17, %f1
	nop

	nop
	nop
	fsub	%f1, %f21, %f1
	j	fbgt_cont.45321

fbgt_else.45320:
	nop
	nop
	fsub	%f17, %f24, %f30
	fadd	%f1, %f24, %f30

	flw	%f1, 461(%zero)
	nop
	fdiv	%f24, %f17, %f1
	nop

	nop
	nop
	fmul	%f25, %f24, %f24
	fmul	%f1, %f1, %f24

	nop
	nop
	fmul	%f23, %f25, %f25
	fmul	%f1, %f1, %f25

	flw	%f1, 460(%zero)
	nop
	fmul	%f18, %f23, %f23
	fsub	%f17, %f24, %f1

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	flw	%f1, 459(%zero)
	nop
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f25
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	flw	%f1, 458(%zero)
	nop
	fsub	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 457(%zero)
	nop
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f25
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 456(%zero)
	nop
	fsub	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fadd	%f1, %f17, %f1
	nop

	nop
	nop
	fadd	%f1, %f22, %f1
	nop

fbgt_cont.45321:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45322

	nop
	nop
	nop
	j	fbgt_cont.45319

bnei_else.45322:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.45323:
	nop
	nop
	nop
	j	fbgt_cont.45319

fbgt_else.45318:
	flw	%f1, 461(%zero)
	nop
	fmul	%f25, %f23, %f23
	nop

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f1, %f1, %f23

	nop
	nop
	fmul	%f18, %f24, %f24
	fmul	%f1, %f1, %f25

	flw	%f1, 460(%zero)
	nop
	fsub	%f17, %f23, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	flw	%f1, 459(%zero)
	nop
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fmul	%f1, %f1, %f25
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	flw	%f1, 458(%zero)
	nop
	fsub	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 457(%zero)
	nop
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fmul	%f1, %f1, %f25
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 456(%zero)
	nop
	fsub	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fadd	%f1, %f17, %f1
	nop

fbgt_cont.45319:
	nop
	nop
	fmul	%f18, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f18, %fzero, fbgt_else.45324

	add	%a1, %zero, %k1
	nop
	nop
	j	fbgt_cont.45325

fbgt_else.45324:
	add	%a1, %zero, %zero
	nop
	nop
	nop

fbgt_cont.45325:
	nop
	nop
	fabs	%f17, %f18
	nop

	nop
	nop
	fdiv	%f1, %f17, %f20
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fsub	%f1, %f17, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f16, fbgt_else.45326

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45328

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.45327

bnei_else.45328:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.45329:
	nop
	nop
	nop
	j	fbgt_cont.45327

fbgt_else.45326:
fbgt_cont.45327:
	nop
	nop
	nop
	fblt	%f1, %f16, fbgt_else.45330

	nop
	nop
	fsub	%f1, %f1, %f16
	j	fbgt_cont.45331

fbgt_else.45330:
fbgt_cont.45331:
	nop
	nop
	nop
	fblt	%f1, %f21, fbgt_else.45332

	nop
	nop
	fsub	%f1, %f16, %f1
	j	fbgt_cont.45333

fbgt_else.45332:
fbgt_cont.45333:
	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_else.45334

	flw	%f17, 478(%zero)
	nop
	fmul	%f25, %f1, %f1
	nop

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f17, %f17, %f1

	nop
	nop
	fmul	%f17, %f17, %f25
	nop

	flw	%f17, 477(%zero)
	nop
	fsub	%f23, %f1, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f17, %f17, %f24
	nop

	flw	%f17, 476(%zero)
	nop
	fadd	%f23, %f23, %f17
	nop

	nop
	nop
	fmul	%f1, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f25
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fsub	%f1, %f23, %f1
	j	fbgt_cont.45335

fbgt_else.45334:
	nop
	nop
	fsub	%f1, %f21, %f1
	nop

	flw	%f1, 474(%zero)
	nop
	fmul	%f24, %f1, %f1
	nop

	nop
	nop
	fmul	%f23, %f24, %f24
	fmul	%f1, %f1, %f24

	flw	%f1, 473(%zero)
	nop
	fsub	%f17, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fsub	%f1, %f17, %f1
	nop

fbgt_cont.45335:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45336

	nop
	nop
	nop
	j	bnei_cont.45337

bnei_else.45336:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.45337:
	nop
	nop
	fabs	%f18, %f18
	nop

	nop
	nop
	fdiv	%f17, %f18, %f20
	nop

	nop
	nop
	floor	%f17, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f20
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.45338

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.45339

fbgt_else.45338:
	add	%a1, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45339:
	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.45340

	nop
	nop
	fsub	%f17, %f17, %f16
	j	fbgt_cont.45341

fbgt_else.45340:
fbgt_cont.45341:
	nop
	nop
	nop
	fblt	%f17, %f21, fbgt_else.45342

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45344

	add	%a1, %zero, %zero
	nop
	nop
	j	fbgt_cont.45343

bnei_else.45344:
	add	%a1, %zero, %k1
	nop
	nop
	nop

bnei_cont.45345:
	nop
	nop
	nop
	j	fbgt_cont.45343

fbgt_else.45342:
fbgt_cont.45343:
	nop
	nop
	nop
	fblt	%f17, %f21, fbgt_else.45346

	nop
	nop
	fsub	%f17, %f16, %f17
	j	fbgt_cont.45347

fbgt_else.45346:
fbgt_cont.45347:
	nop
	nop
	nop
	fblt	%f22, %f17, fbgt_else.45348

	flw	%f16, 474(%zero)
	nop
	fmul	%f20, %f17, %f17
	nop

	nop
	nop
	fmul	%f18, %f20, %f20
	fmul	%f16, %f16, %f20

	flw	%f16, 473(%zero)
	nop
	fsub	%f17, %f30, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f18
	nop

	flw	%f16, 472(%zero)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	nop
	nop
	fmul	%f16, %f16, %f18
	nop

	nop
	nop
	fsub	%f16, %f17, %f16
	j	fbgt_cont.45349

fbgt_else.45348:
	flw	%f16, 478(%zero)
	nop
	fsub	%f21, %f21, %f17
	nop

	nop
	nop
	fmul	%f18, %f21, %f21
	fmul	%f16, %f16, %f21

	nop
	nop
	fmul	%f20, %f18, %f18
	fmul	%f16, %f16, %f18

	flw	%f16, 477(%zero)
	nop
	fsub	%f17, %f21, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 476(%zero)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fmul	%f16, %f16, %f18
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	nop
	nop
	fsub	%f16, %f17, %f16
	nop

fbgt_cont.45349:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45350

	nop
	nop
	nop
	j	bnei_cont.45351

bnei_else.45350:
	nop
	nop
	fneg	%f16, %f16
	nop

bnei_cont.45351:
	nop
	nop
	fdiv	%f1, %f1, %f16
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	j	calc_dirvec.3071

calc_dirvecs.3079:
	add	%a3, %zero, %v0
	add	%fp, %zero, %a0
	fmov	%f3, %f0
	add	%k0, %zero, %ra

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.45386

	flw	%f27, 460(%zero)
	flw	%f28, 438(%zero)
	itof	%f0, %a3
	addi	%a0, %fp, 0

	addi	%v0, %zero, 0
	nop
	fmul	%f0, %f0, %f27
	fmov	%f1, %fzero

	nop
	nop
	fsub	%f2, %f0, %f28
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	flw	%f29, 441(%zero)
	addi	%s0, %fp, 2
	itof	%f0, %a3
	addi	%v0, %zero, 0

	addi	%a0, %s0, 0
	nop
	fmul	%f0, %f0, %f27
	fmov	%f1, %fzero

	nop
	nop
	fadd	%f2, %f0, %f29
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	addi	%a3, %a3, -1
	addi	%v1, %v1, 1
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.45387

	addi	%v1, %v1, -5
	nop
	nop
	j	bgti_cont.45388

bgti_else.45387:
bgti_cont.45388:
	nop
	nop
	nop
	blti	%a3, 0, bgti_else.45389

	addi	%a0, %fp, 0
	addi	%v0, %zero, 0
	itof	%f0, %a3
	fmov	%f1, %fzero

	nop
	nop
	fmul	%f0, %f0, %f27
	nop

	nop
	nop
	fsub	%f2, %f0, %f28
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	itof	%f0, %a3
	fmov	%f1, %fzero

	nop
	nop
	fmul	%f0, %f0, %f27
	nop

	nop
	nop
	fadd	%f2, %f0, %f29
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	addi	%v0, %a3, -1
	addi	%v1, %v1, 1
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.45390

	addi	%v1, %v1, -5
	nop
	nop
	j	bgti_cont.45391

bgti_else.45390:
bgti_cont.45391:
	add	%ra, %zero, %k0
	addi	%a0, %fp, 0
	fmov	%f0, %f3
	j	calc_dirvecs.3079

bgti_else.45389:
	add	%ra, %zero, %k0
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45386:
	add	%ra, %zero, %k0
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

calc_dirvec_rows.3084:
	add	%s1, %zero, %v0
	add	%s2, %zero, %v1
	add	%s3, %zero, %a0
	add	%s4, %zero, %ra

	fsw	%f5, 0(%sp)
	nop
	nop
	nop

	fsw	%f4, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s1, 0, bgti_else.45454

	flw	%f4, 460(%zero)
	flw	%f5, 438(%zero)
	itof	%f0, %s1
	addi	%s5, %zero, 4

	addi	%a0, %s3, 0
	addi	%v1, %s2, 0
	fmul	%f0, %f0, %f4
	addi	%v0, %zero, 0

	addi	%sp, %sp, 2
	nop
	fsub	%f3, %f0, %f5
	itof	%f0, %s5

	nop
	nop
	fmul	%f0, %f0, %f4
	fmov	%f1, %fzero

	nop
	nop
	fsub	%f2, %f0, %f5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	addi	%a0, %s3, 2
	addi	%v1, %s2, 0
	itof	%f0, %s5
	addi	%v0, %zero, 0

	flw	%f0, 441(%zero)
	nop
	fmul	%f1, %f0, %f4
	nop

	nop
	nop
	fadd	%f2, %f1, %f0
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3071

	addi	%sp, %sp, -2
	addi	%v0, %zero, 3
	addi	%v1, %s2, 1
	nop

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.45455

	addi	%v1, %v1, -5
	nop
	nop
	j	bgti_cont.45456

bgti_else.45455:
bgti_cont.45456:
	addi	%a0, %s3, 0
	addi	%sp, %sp, 2
	fmov	%f0, %f3
	jal	calc_dirvecs.3079

	addi	%sp, %sp, -2
	addi	%s6, %s1, -1
	addi	%s1, %s2, 2
	nop

	nop
	nop
	nop
	blti	%s1, 5, bgti_else.45457

	addi	%s1, %s1, -5
	nop
	nop
	j	bgti_cont.45458

bgti_else.45457:
bgti_cont.45458:
	addi	%s2, %s3, 4
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s6, 0, bgti_else.45459

	addi	%a0, %s2, 0
	addi	%v1, %s1, 0
	itof	%f0, %s6
	addi	%v0, %s5, 0

	addi	%sp, %sp, 2
	nop
	fmul	%f0, %f0, %f4
	nop

	nop
	nop
	fsub	%f0, %f0, %f5
	jal	calc_dirvecs.3079

	addi	%sp, %sp, -2
	addi	%v0, %s6, -1
	addi	%v1, %s1, 2
	nop

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.45460

	addi	%v1, %v1, -5
	nop
	nop
	j	bgti_cont.45461

bgti_else.45460:
bgti_cont.45461:
	addi	%a0, %s2, 4
	flw	%f5, 0(%sp)
	add	%ra, %zero, %s4
	nop

	flw	%f4, 1(%sp)
	nop
	nop
	j	calc_dirvec_rows.3084

bgti_else.45459:
	flw	%f5, 0(%sp)
	flw	%f4, 1(%sp)
	add	%ra, %zero, %s4
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45454:
	add	%ra, %zero, %s4
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

create_dirvec_elements.3090:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.45500

	addi	%fp, %zero, 3
	nop
	fmov	%f0, %fzero
	nop

	addi	%v0, %fp, 0
	nop
	nop
	jal	min_caml_create_float_array

	addi	%k0, %v0, 0
	lw	%s0, 0(%zero)
	nop
	nop

	addi	%v1, %k0, 0
	addi	%v0, %s0, 0
	nop
	jal	min_caml_create_array

	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	add	%at, %a1, %a2
	nop

	sw	%v0, 1(%a0)
	nop
	nop
	nop

	sw	%k0, 0(%a0)
	addi	%k0, %a2, -1
	nop
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%k0, 0, bgti_else.45501

	addi	%v0, %fp, 0
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a2, %v0, 0
	addi	%v0, %s0, 0
	nop
	nop

	addi	%v1, %a2, 0
	nop
	nop
	jal	min_caml_create_array

	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	add	%at, %a1, %k0
	addi	%k0, %k0, -1

	sw	%v0, 1(%a0)
	nop
	nop
	nop

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
	blti	%k0, 0, bgti_else.45502

	addi	%v0, %fp, 0
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a2, %v0, 0
	addi	%v0, %s0, 0
	nop
	nop

	addi	%v1, %a2, 0
	nop
	nop
	jal	min_caml_create_array

	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	add	%at, %a1, %k0
	addi	%k0, %k0, -1

	sw	%v0, 1(%a0)
	nop
	nop
	nop

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
	blti	%k0, 0, bgti_else.45503

	addi	%v0, %fp, 0
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a2, %v0, 0
	addi	%v0, %s0, 0
	nop
	nop

	addi	%v1, %a2, 0
	nop
	nop
	jal	min_caml_create_array

	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	add	%at, %a1, %k0
	addi	%v1, %k0, -1

	sw	%v0, 1(%a0)
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0
	nop

	sw	%a2, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 0(%at)
	nop
	nop
	j	create_dirvec_elements.3090

bgti_else.45503:
	add	%ra, %zero, %a3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45502:
	add	%ra, %zero, %a3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45501:
	add	%ra, %zero, %a3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45500:
	add	%ra, %zero, %a3
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

create_dirvecs.3093:
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra
	nop
	nop

	nop
	nop
	nop
	blti	%s1, 0, bgti_else.45536

	addi	%s5, %zero, 120
	addi	%s3, %zero, 3
	fmov	%f0, %fzero
	nop

	addi	%v0, %s3, 0
	nop
	nop
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	lw	%s4, 0(%zero)
	nop
	nop

	addi	%v1, %a1, 0
	addi	%v0, %s4, 0
	nop
	jal	min_caml_create_array

	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	nop
	nop

	sw	%v0, 1(%v1)
	addi	%v0, %s5, 0
	nop
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 179(%s1)
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	nop

	lw	%a2, 179(%s1)
	nop
	nop
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	addi	%v0, %s4, 0
	nop
	nop

	addi	%v1, %a1, 0
	nop
	nop
	jal	min_caml_create_array

	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	fmov	%f0, %fzero
	nop

	sw	%v0, 1(%a0)
	addi	%v0, %s3, 0
	nop
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 118(%a2)
	nop
	nop
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	addi	%v0, %s4, 0
	nop
	nop

	addi	%v1, %a1, 0
	nop
	nop
	jal	min_caml_create_array

	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%s6, %zero, 116
	fmov	%f0, %fzero

	sw	%v0, 1(%a0)
	addi	%v0, %s3, 0
	nop
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 117(%a2)
	nop
	nop
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	addi	%v0, %s4, 0
	nop
	nop

	addi	%v1, %a1, 0
	nop
	nop
	jal	min_caml_create_array

	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v1, %zero, 115
	nop

	sw	%v0, 1(%a0)
	nop
	nop
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 116(%a2)
	nop
	nop
	nop

	addi	%v0, %a2, 0
	nop
	nop
	jal	create_dirvec_elements.3090

	addi	%s1, %s1, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s1, 0, bgti_else.45537

	addi	%v0, %s3, 0
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	addi	%v0, %s4, 0
	nop
	nop

	addi	%v1, %a1, 0
	nop
	nop
	jal	min_caml_create_array

	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	nop
	nop

	sw	%v0, 1(%v1)
	addi	%v0, %s5, 0
	nop
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 179(%s1)
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	nop

	lw	%a2, 179(%s1)
	nop
	nop
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	addi	%v0, %s4, 0
	nop
	nop

	addi	%v1, %a1, 0
	nop
	nop
	jal	min_caml_create_array

	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	fmov	%f0, %fzero
	nop

	sw	%v0, 1(%a0)
	addi	%v0, %s3, 0
	nop
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 118(%a2)
	nop
	nop
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	addi	%v0, %s4, 0
	nop
	nop

	addi	%v1, %a1, 0
	nop
	nop
	jal	min_caml_create_array

	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v1, %s6, 0
	nop

	sw	%v0, 1(%a0)
	nop
	nop
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 117(%a2)
	nop
	nop
	nop

	addi	%v0, %a2, 0
	nop
	nop
	jal	create_dirvec_elements.3090

	addi	%v0, %s1, -1
	add	%ra, %zero, %s2
	nop
	j	create_dirvecs.3093

bgti_else.45537:
	add	%ra, %zero, %s2
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45536:
	add	%ra, %zero, %s2
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

init_dirvec_constants.3095:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.45657

	add	%at, %s4, %s5
	lw	%a0, 0(%zero)
	nop
	nop

	lw	%v0, 0(%at)
	addi	%s7, %a0, -1
	nop
	nop

	addi	%v1, %s7, 0
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	addi	%s5, %s5, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.45658

	add	%at, %s4, %s5
	nop
	nop
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.45659

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
	beqi	%a0, 1, bnei_else.45661

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.45663

	addi	%v0, %zero, 5
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f20, 0(%k0)
	flw	%f19, 1(%k0)
	nop
	nop

	flw	%f24, 2(%k0)
	flw	%f2, 0(%a3)
	fmul	%f0, %f20, %f20
	nop

	flw	%f18, 1(%a3)
	flw	%f17, 2(%a3)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24

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
	beqi	%s1, 0, bnei_else.45665

	flw	%f1, 0(%s0)
	nop
	fmul	%f16, %f19, %f24
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%s0)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f19

	flw	%f0, 2(%s0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.45666

bnei_else.45665:
bnei_cont.45666:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f20, %f2
	nop

	nop
	nop
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18

	nop
	nop
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17

	nop
	nop
	fneg	%f2, %f1
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.45667

	flw	%f22, 1(%s0)
	flw	%f18, 2(%s0)
	nop
	nop

	flw	%f21, 474(%zero)
	flw	%f17, 0(%s0)
	fmul	%f16, %f24, %f22
	fmul	%f1, %f19, %f18

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f24, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f25, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f20, %f18
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f19, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f23, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f20, %f22
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.45668

bnei_else.45667:
	fsw	%f25, 1(%v0)
	nop
	nop
	nop

	fsw	%f23, 2(%v0)
	nop
	nop
	nop

	fsw	%f2, 3(%v0)
	nop
	nop
	nop

bnei_cont.45668:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.45669

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.45670

fbeq_else.45669:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.45670:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45671

	nop
	nop
	nop
	j	bnei_cont.45672

bnei_else.45671:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.45672:
	add	%at, %a2, %s7
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.45662

bnei_else.45663:
	addi	%v0, %zero, 4
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f0, 0(%k0)
	flw	%f18, 0(%a3)
	nop
	nop

	flw	%f0, 1(%k0)
	flw	%f17, 1(%a3)
	fmul	%f1, %f0, %f18
	nop

	flw	%f16, 2(%a3)
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 2(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.45673

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.45674

fbgt_else.45673:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45674:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45675

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
	fdiv	%f0, %f18, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f17, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f16, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.45676

bnei_else.45675:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.45676:
	add	%at, %a2, %s7
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.45664:
	nop
	nop
	nop
	j	bnei_cont.45662

bnei_else.45661:
	addi	%v0, %zero, 6
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f1, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45677

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.45678

fbeq_else.45677:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.45678:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45679

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.45680

bnei_else.45679:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45681

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.45682

fbgt_else.45681:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45682:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45683

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45685

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.45684

bnei_else.45685:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.45686:
	nop
	nop
	nop
	j	bnei_cont.45684

bnei_else.45683:
bnei_cont.45684:
	flw	%f0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45687

	nop
	nop
	nop
	j	bnei_cont.45688

bnei_else.45687:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45688:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.45680:
	flw	%f1, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45689

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.45690

fbeq_else.45689:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.45690:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45691

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.45692

bnei_else.45691:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45693

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.45694

fbgt_else.45693:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45694:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45695

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45697

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.45696

bnei_else.45697:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.45698:
	nop
	nop
	nop
	j	bnei_cont.45696

bnei_else.45695:
bnei_cont.45696:
	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45699

	nop
	nop
	nop
	j	bnei_cont.45700

bnei_else.45699:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45700:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.45692:
	flw	%f1, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45701

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.45702

fbeq_else.45701:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.45702:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45703

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.45704

bnei_else.45703:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45705

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.45706

fbgt_else.45705:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45706:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45707

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45709

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.45708

bnei_else.45709:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.45710:
	nop
	nop
	nop
	j	bnei_cont.45708

bnei_else.45707:
bnei_cont.45708:
	flw	%f0, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45711

	nop
	nop
	nop
	j	bnei_cont.45712

bnei_else.45711:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45712:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.45704:
	add	%at, %a2, %s7
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.45662:
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	j	bgti_cont.45660

bgti_else.45659:
bgti_cont.45660:
	addi	%s5, %s5, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.45713

	add	%at, %s4, %s5
	addi	%v1, %s7, 0
	nop
	nop

	lw	%v0, 0(%at)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	addi	%s5, %s5, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.45714

	add	%at, %s4, %s5
	nop
	nop
	nop

	lw	%v0, 0(%at)
	nop
	nop
	jal	setup_dirvec_constants.2880

	addi	%v1, %s5, -1
	add	%ra, %zero, %s6
	addi	%v0, %s4, 0
	j	init_dirvec_constants.3095

bgti_else.45714:
	add	%ra, %zero, %s6
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45713:
	add	%ra, %zero, %s6
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45658:
	add	%ra, %zero, %s6
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45657:
	add	%ra, %zero, %s6
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

init_vecset_constants.3098:
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra
	nop
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.45936

	lw	%s4, 179(%t7)
	addi	%a0, %zero, 119
	nop
	nop

	lw	%a1, 119(%s4)
	lw	%a0, 0(%zero)
	nop
	nop

	addi	%t9, %a0, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t9, 0, bgti_else.45937

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
	beqi	%a0, 1, bnei_else.45939

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.45941

	addi	%v0, %zero, 5
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f20, 0(%k0)
	flw	%f19, 1(%k0)
	nop
	nop

	flw	%f24, 2(%k0)
	flw	%f2, 0(%a3)
	fmul	%f0, %f20, %f20
	nop

	flw	%f18, 1(%a3)
	flw	%f17, 2(%a3)
	fmul	%f1, %f0, %f2
	fmul	%f0, %f19, %f19

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24

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
	beqi	%s1, 0, bnei_else.45943

	flw	%f1, 0(%s0)
	nop
	fmul	%f16, %f19, %f24
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%s0)
	nop
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f19

	flw	%f0, 2(%s0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.45944

bnei_else.45943:
bnei_cont.45944:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f20, %f2
	nop

	nop
	nop
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18

	nop
	nop
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17

	nop
	nop
	fneg	%f2, %f1
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.45945

	flw	%f22, 1(%s0)
	flw	%f18, 2(%s0)
	nop
	nop

	flw	%f21, 474(%zero)
	flw	%f17, 0(%s0)
	fmul	%f16, %f24, %f22
	fmul	%f1, %f19, %f18

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f24, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f25, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f20, %f18
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f19, %f17

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f23, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f20, %f22
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.45946

bnei_else.45945:
	fsw	%f25, 1(%v0)
	nop
	nop
	nop

	fsw	%f23, 2(%v0)
	nop
	nop
	nop

	fsw	%f2, 3(%v0)
	nop
	nop
	nop

bnei_cont.45946:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.45947

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.45948

fbeq_else.45947:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.45948:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45949

	nop
	nop
	nop
	j	bnei_cont.45950

bnei_else.45949:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.45950:
	add	%at, %a2, %t9
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.45940

bnei_else.45941:
	addi	%v0, %zero, 4
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f0, 0(%k0)
	flw	%f18, 0(%a3)
	nop
	nop

	flw	%f0, 1(%k0)
	flw	%f17, 1(%a3)
	fmul	%f1, %f0, %f18
	nop

	flw	%f16, 2(%a3)
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 2(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.45951

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.45952

fbgt_else.45951:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45952:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45953

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
	fdiv	%f0, %f18, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f17, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f16, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.45954

bnei_else.45953:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.45954:
	add	%at, %a2, %t9
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.45942:
	nop
	nop
	nop
	j	bnei_cont.45940

bnei_else.45939:
	addi	%v0, %zero, 6
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	flw	%f1, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45955

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.45956

fbeq_else.45955:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.45956:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45957

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.45958

bnei_else.45957:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45959

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.45960

fbgt_else.45959:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45960:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45961

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45963

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.45962

bnei_else.45963:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.45964:
	nop
	nop
	nop
	j	bnei_cont.45962

bnei_else.45961:
bnei_cont.45962:
	flw	%f0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45965

	nop
	nop
	nop
	j	bnei_cont.45966

bnei_else.45965:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45966:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.45958:
	flw	%f1, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45967

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.45968

fbeq_else.45967:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.45968:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45969

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.45970

bnei_else.45969:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45971

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.45972

fbgt_else.45971:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45972:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45973

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45975

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.45974

bnei_else.45975:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.45976:
	nop
	nop
	nop
	j	bnei_cont.45974

bnei_else.45973:
bnei_cont.45974:
	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45977

	nop
	nop
	nop
	j	bnei_cont.45978

bnei_else.45977:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45978:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.45970:
	flw	%f1, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.45979

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.45980

fbeq_else.45979:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.45980:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45981

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.45982

bnei_else.45981:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.45983

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.45984

fbgt_else.45983:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.45984:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.45985

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45987

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.45986

bnei_else.45987:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.45988:
	nop
	nop
	nop
	j	bnei_cont.45986

bnei_else.45985:
bnei_cont.45986:
	flw	%f0, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45989

	nop
	nop
	nop
	j	bnei_cont.45990

bnei_else.45989:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.45990:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.45982:
	add	%at, %a2, %t9
	nop
	nop
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.45940:
	addi	%v1, %t9, -1
	addi	%v0, %a1, 0
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	j	bgti_cont.45938

bgti_else.45937:
bgti_cont.45938:
	addi	%a0, %zero, 118
	lw	%v0, 118(%s4)
	addi	%v1, %t9, 0
	jal	iter_setup_dirvec_constants.2877

	addi	%a0, %zero, 117
	lw	%v0, 117(%s4)
	nop
	jal	setup_dirvec_constants.2880

	addi	%v1, %zero, 116
	addi	%v0, %s4, 0
	nop
	jal	init_dirvec_constants.3095

	addi	%t7, %t7, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.45991

	lw	%s4, 179(%t7)
	addi	%v1, %t9, 0
	nop
	nop

	lw	%v0, 119(%s4)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	lw	%v0, 118(%s4)
	nop
	nop
	jal	setup_dirvec_constants.2880

	addi	%v1, %zero, 117
	addi	%v0, %s4, 0
	nop
	jal	init_dirvec_constants.3095

	addi	%t7, %t7, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.45992

	lw	%s4, 179(%t7)
	nop
	nop
	nop

	lw	%v0, 119(%s4)
	nop
	nop
	jal	setup_dirvec_constants.2880

	addi	%v1, %zero, 118
	addi	%v0, %s4, 0
	nop
	jal	init_dirvec_constants.3095

	addi	%t7, %t7, -1
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.45993

	lw	%v0, 179(%t7)
	addi	%v1, %zero, 119
	nop
	jal	init_dirvec_constants.3095

	addi	%v0, %t7, -1
	add	%ra, %zero, %t8
	nop
	j	init_vecset_constants.3098

bgti_else.45993:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45992:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45991:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.45936:
	add	%ra, %zero, %t8
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

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
	addi	%v1, %k1, 0
	nop

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
	addi	%v0, %a2, 0
	nop
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

	addi	%a0, %zero, 12
	nop
	nop
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

	nop
	nop
	nop
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

	addi	%v1, %zero, 249
	addi	%v0, %zero, 0
	nop
	jal	min_caml_create_float_extarray

	addi	%a2, %v0, 0
	addi	%a0, %zero, 249
	addi	%v1, %zero, 249
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	addi	%a0, %zero, 249
	sw	%v0, 250(%zero)
	nop
	nop

	sw	%a2, 249(%zero)
	nop
	nop
	nop

	addi	%v0, %zero, 180
	fsw	%fzero, 253(%zero)
	nop
	nop

	sw	%a0, 252(%zero)
	nop
	nop
	nop

	sw	%zero, 251(%zero)
	nop
	nop
	nop

	addi	%a0, %zero, 254
	addi	%v1, %zero, 251
	nop
	jal	min_caml_create_extarray

	addi	%a0, %zero, 434
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	addi	%a0, %zero, 2
	nop
	nop
	nop

	sw	%a0, 154(%zero)
	nop
	itof	%f0, %a0
	nop

	sw	%a0, 155(%zero)
	nop
	nop
	nop

	sw	%k1, 156(%zero)
	nop
	nop
	nop

	sw	%k1, 157(%zero)
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
	addi	%v0, %zero, 3
	nop
	nop

	sw	%a0, 0(%sp)
	nop
	nop
	nop

	addi	%sp, %sp, 1
	nop
	nop
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	nop
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

	nop
	nop
	nop
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
	nop
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
	nop
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
	nop
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
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 1
	nop

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

	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	addi	%s7, %a0, -2
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.47590

	addi	%v0, %zero, 3
	addi	%sp, %sp, 1
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	nop
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
	nop
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
	nop
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
	nop
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
	add	%at, %a1, %s7

	sw	%a0, 7(%ra)
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	nop

	sw	%s2, 6(%ra)
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

	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.47591

bgti_else.47590:
bgti_cont.47591:
	sw	%a1, 1(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	nop

	addi	%sp, %sp, 2
	nop
	nop
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	nop
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
	nop
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
	nop
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
	nop
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
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 2
	nop

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

	addi	%sp, %sp, -2
	addi	%a1, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.47592

	addi	%v0, %zero, 3
	addi	%sp, %sp, 2
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	nop
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
	nop
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
	nop
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
	nop
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
	add	%at, %a1, %s7

	sw	%a0, 7(%ra)
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	nop

	sw	%s2, 6(%ra)
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

	addi	%sp, %sp, -2
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.47593

bgti_else.47592:
bgti_cont.47593:
	sw	%a1, 2(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	nop

	addi	%sp, %sp, 3
	nop
	nop
	jal	min_caml_create_float_array

	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	nop
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
	nop
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
	nop
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
	nop
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
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	nop

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

	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.47594

	addi	%v0, %zero, 3
	addi	%sp, %sp, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	nop
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
	nop
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
	nop
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
	nop
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
	add	%at, %a1, %s7

	sw	%a0, 7(%ra)
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	nop

	sw	%s2, 6(%ra)
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

	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	nop
	j	bgti_cont.47595

bgti_else.47594:
bgti_cont.47595:
	sw	%a1, 3(%sp)
	nop
	nop
	nop

	addi	%sp, %sp, 4
	nop
	nop
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

	addi	%sp, %sp, -4
	flw	%f18, 469(%zero)
	nop
	nop

	flw	%f17, 482(%zero)
	flw	%f19, 481(%zero)
	fmul	%f16, %f0, %f18
	nop

	nop
	nop
	fabs	%f1, %f16
	nop

	nop
	nop
	fdiv	%f0, %f1, %f19
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47596

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47597

fbgt_else.47596:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.47597:
	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47598

	nop
	nop
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47599

fbgt_else.47598:
fbgt_cont.47599:
	flw	%f2, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47600

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47602

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47601

bnei_else.47602:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.47603:
	nop
	nop
	nop
	j	fbgt_cont.47601

fbgt_else.47600:
fbgt_cont.47601:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47604

	nop
	nop
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47605

fbgt_else.47604:
fbgt_cont.47605:
	flw	%f20, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_else.47606

	flw	%f0, 474(%zero)
	nop
	fmul	%f22, %f0, %f0
	nop

	nop
	nop
	fmul	%f21, %f22, %f22
	fmul	%f0, %f0, %f22

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	j	fbgt_cont.47607

fbgt_else.47606:
	flw	%f0, 478(%zero)
	nop
	fsub	%f23, %f2, %f0
	nop

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f0, %f0, %f23

	nop
	nop
	fmul	%f21, %f22, %f22
	fmul	%f0, %f0, %f22

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f23, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	nop

fbgt_cont.47607:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47608

	nop
	nop
	nop
	j	bnei_cont.47609

bnei_else.47608:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.47609:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.47610

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.47611

fbgt_else.47610:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.47611:
	nop
	nop
	fabs	%f16, %f16
	nop

	nop
	nop
	fdiv	%f0, %f16, %f19
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47612

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47614

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47613

bnei_else.47614:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.47615:
	nop
	nop
	nop
	j	fbgt_cont.47613

fbgt_else.47612:
fbgt_cont.47613:
	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47616

	nop
	nop
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47617

fbgt_else.47616:
fbgt_cont.47617:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47618

	nop
	nop
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47619

fbgt_else.47618:
fbgt_cont.47619:
	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_else.47620

	flw	%f16, 478(%zero)
	nop
	fmul	%f23, %f0, %f0
	nop

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f16, %f16, %f0

	nop
	nop
	fmul	%f16, %f16, %f23
	nop

	flw	%f16, 477(%zero)
	nop
	fsub	%f21, %f0, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	flw	%f16, 476(%zero)
	nop
	fadd	%f21, %f21, %f16
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fsub	%f16, %f21, %f0
	j	fbgt_cont.47621

fbgt_else.47620:
	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	flw	%f0, 474(%zero)
	nop
	fmul	%f22, %f0, %f0
	nop

	nop
	nop
	fmul	%f21, %f22, %f22
	fmul	%f0, %f0, %f22

	flw	%f0, 473(%zero)
	nop
	fsub	%f16, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fsub	%f16, %f16, %f0
	nop

fbgt_cont.47621:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47622

	nop
	nop
	nop
	j	bnei_cont.47623

bnei_else.47622:
	nop
	nop
	fneg	%f16, %f16
	nop

bnei_cont.47623:
	addi	%sp, %sp, 4
	nop
	nop
	jal	min_caml_read_float

	addi	%sp, %sp, -4
	nop
	fmul	%f22, %f0, %f18
	nop

	nop
	nop
	fabs	%f21, %f22
	nop

	nop
	nop
	fdiv	%f0, %f21, %f19
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f21, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47624

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47625

fbgt_else.47624:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.47625:
	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47626

	nop
	nop
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47627

fbgt_else.47626:
fbgt_cont.47627:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47628

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47630

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47629

bnei_else.47630:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.47631:
	nop
	nop
	nop
	j	fbgt_cont.47629

fbgt_else.47628:
fbgt_cont.47629:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47632

	nop
	nop
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47633

fbgt_else.47632:
fbgt_cont.47633:
	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_else.47634

	flw	%f0, 474(%zero)
	nop
	fmul	%f24, %f0, %f0
	nop

	nop
	nop
	fmul	%f23, %f24, %f24
	fmul	%f0, %f0, %f24

	flw	%f0, 473(%zero)
	nop
	fsub	%f21, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f21, %f21, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fsub	%f0, %f21, %f0
	j	fbgt_cont.47635

fbgt_else.47634:
	flw	%f0, 478(%zero)
	nop
	fsub	%f25, %f2, %f0
	nop

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f0, %f0, %f25

	nop
	nop
	fmul	%f23, %f24, %f24
	fmul	%f0, %f0, %f24

	flw	%f0, 477(%zero)
	nop
	fsub	%f21, %f25, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f21, %f21, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fsub	%f0, %f21, %f0
	nop

fbgt_cont.47635:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47636

	nop
	nop
	nop
	j	bnei_cont.47637

bnei_else.47636:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47637:
	nop
	nop
	nop
	fblt	%f22, %fzero, fbgt_else.47638

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.47639

fbgt_else.47638:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.47639:
	nop
	nop
	fabs	%f22, %f22
	nop

	nop
	nop
	fdiv	%f21, %f22, %f19
	nop

	nop
	nop
	floor	%f21, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f19
	nop

	nop
	nop
	fsub	%f21, %f22, %f21
	nop

	nop
	nop
	nop
	fblt	%f21, %f17, fbgt_else.47640

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47642

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47641

bnei_else.47642:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.47643:
	nop
	nop
	nop
	j	fbgt_cont.47641

fbgt_else.47640:
fbgt_cont.47641:
	nop
	nop
	nop
	fblt	%f21, %f17, fbgt_else.47644

	nop
	nop
	fsub	%f21, %f21, %f17
	j	fbgt_cont.47645

fbgt_else.47644:
fbgt_cont.47645:
	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_else.47646

	nop
	nop
	fsub	%f21, %f17, %f21
	j	fbgt_cont.47647

fbgt_else.47646:
fbgt_cont.47647:
	nop
	nop
	nop
	fblt	%f20, %f21, fbgt_else.47648

	flw	%f22, 478(%zero)
	nop
	fmul	%f25, %f21, %f21
	nop

	nop
	nop
	fmul	%f24, %f25, %f25
	fmul	%f22, %f22, %f21

	nop
	nop
	fmul	%f22, %f22, %f25
	nop

	flw	%f22, 477(%zero)
	nop
	fsub	%f23, %f21, %f22
	nop

	nop
	nop
	fmul	%f22, %f22, %f21
	nop

	nop
	nop
	fmul	%f22, %f22, %f24
	nop

	flw	%f22, 476(%zero)
	nop
	fadd	%f23, %f23, %f22
	nop

	nop
	nop
	fmul	%f21, %f22, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f25
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	nop
	nop
	fsub	%f21, %f23, %f21
	j	fbgt_cont.47649

fbgt_else.47648:
	nop
	nop
	fsub	%f21, %f2, %f21
	nop

	flw	%f21, 474(%zero)
	nop
	fmul	%f24, %f21, %f21
	nop

	nop
	nop
	fmul	%f23, %f24, %f24
	fmul	%f21, %f21, %f24

	flw	%f21, 473(%zero)
	nop
	fsub	%f22, %f30, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f23
	nop

	flw	%f21, 472(%zero)
	nop
	fadd	%f22, %f22, %f21
	nop

	nop
	nop
	fmul	%f21, %f21, %f24
	nop

	nop
	nop
	fmul	%f21, %f21, %f23
	nop

	nop
	nop
	fsub	%f21, %f22, %f21
	nop

fbgt_cont.47649:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47650

	nop
	nop
	nop
	j	bnei_cont.47651

bnei_else.47650:
	nop
	nop
	fneg	%f21, %f21
	nop

bnei_cont.47651:
	flw	%f23, 436(%zero)
	nop
	fmul	%f22, %f1, %f21
	nop

	nop
	nop
	fmul	%f22, %f22, %f23
	nop

	fsw	%f22, 171(%zero)
	nop
	nop
	nop

	flw	%f22, 435(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f22, %f16, %f22
	nop

	fsw	%f22, 172(%zero)
	nop
	fmul	%f22, %f1, %f0
	fneg	%f1, %f1

	nop
	nop
	fmul	%f22, %f22, %f23
	nop

	fsw	%f22, 173(%zero)
	nop
	fneg	%f22, %f21
	nop

	fsw	%f0, 165(%zero)
	nop
	nop
	nop

	fsw	%fzero, 166(%zero)
	nop
	nop
	nop

	fsw	%f22, 167(%zero)
	nop
	fneg	%f22, %f16
	nop

	nop
	nop
	fmul	%f21, %f22, %f21
	nop

	fsw	%f21, 168(%zero)
	nop
	nop
	nop

	fsw	%f1, 169(%zero)
	nop
	fneg	%f1, %f16
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 170(%zero)
	nop
	nop
	nop

	flw	%f1, 72(%zero)
	flw	%f0, 171(%zero)
	nop
	nop

	fsw	%f0, 4(%sp)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 75(%zero)
	nop
	nop
	nop

	flw	%f1, 73(%zero)
	flw	%f0, 172(%zero)
	nop
	nop

	fsw	%f0, 5(%sp)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 76(%zero)
	nop
	nop
	nop

	flw	%f1, 74(%zero)
	flw	%f0, 173(%zero)
	nop
	nop

	fsw	%f0, 6(%sp)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 77(%zero)
	addi	%sp, %sp, 7
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	jal	min_caml_read_float

	addi	%sp, %sp, -7
	nop
	fmul	%f1, %f0, %f18
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.47652

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.47653

fbgt_else.47652:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.47653:
	nop
	nop
	fabs	%f16, %f1
	nop

	nop
	nop
	fdiv	%f0, %f16, %f19
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47654

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47656

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47655

bnei_else.47656:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.47657:
	nop
	nop
	nop
	j	fbgt_cont.47655

fbgt_else.47654:
fbgt_cont.47655:
	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47658

	nop
	nop
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47659

fbgt_else.47658:
fbgt_cont.47659:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47660

	nop
	nop
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47661

fbgt_else.47660:
fbgt_cont.47661:
	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_else.47662

	flw	%f16, 478(%zero)
	nop
	fmul	%f23, %f0, %f0
	nop

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f16, %f16, %f0

	nop
	nop
	fmul	%f16, %f16, %f23
	nop

	flw	%f16, 477(%zero)
	nop
	fsub	%f21, %f0, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	flw	%f16, 476(%zero)
	nop
	fadd	%f21, %f21, %f16
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fsub	%f0, %f21, %f0
	j	fbgt_cont.47663

fbgt_else.47662:
	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	flw	%f0, 474(%zero)
	nop
	fmul	%f22, %f0, %f0
	nop

	nop
	nop
	fmul	%f21, %f22, %f22
	fmul	%f0, %f0, %f22

	flw	%f0, 473(%zero)
	nop
	fsub	%f16, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fsub	%f0, %f16, %f0
	nop

fbgt_cont.47663:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47664

	nop
	nop
	nop
	j	bnei_cont.47665

bnei_else.47664:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47665:
	addi	%sp, %sp, 7
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 79(%zero)
	nop
	nop
	jal	min_caml_read_float

	addi	%sp, %sp, -7
	nop
	fmul	%f16, %f0, %f18
	fabs	%f1, %f1

	nop
	nop
	fdiv	%f0, %f1, %f19
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47666

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47667

fbgt_else.47666:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.47667:
	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.47668

	nop
	nop
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47669

fbgt_else.47668:
fbgt_cont.47669:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47670

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47672

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47671

bnei_else.47672:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.47673:
	nop
	nop
	nop
	j	fbgt_cont.47671

fbgt_else.47670:
fbgt_cont.47671:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47674

	nop
	nop
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47675

fbgt_else.47674:
fbgt_cont.47675:
	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_else.47676

	flw	%f0, 474(%zero)
	nop
	fmul	%f21, %f0, %f0
	nop

	nop
	nop
	fmul	%f18, %f21, %f21
	fmul	%f0, %f0, %f21

	flw	%f0, 473(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 472(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47677

fbgt_else.47676:
	flw	%f0, 478(%zero)
	nop
	fsub	%f22, %f2, %f0
	nop

	nop
	nop
	fmul	%f18, %f22, %f22
	fmul	%f0, %f0, %f22

	nop
	nop
	fmul	%f21, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f22, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.47677:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47678

	nop
	nop
	nop
	j	bnei_cont.47679

bnei_else.47678:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47679:
	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.47680

	add	%a0, %zero, %k1
	nop
	nop
	j	fbgt_cont.47681

fbgt_else.47680:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbgt_cont.47681:
	nop
	nop
	fabs	%f18, %f16
	nop

	nop
	nop
	fdiv	%f1, %f18, %f19
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fsub	%f1, %f18, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f17, fbgt_else.47682

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47684

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47683

bnei_else.47684:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.47685:
	nop
	nop
	nop
	j	fbgt_cont.47683

fbgt_else.47682:
fbgt_cont.47683:
	nop
	nop
	nop
	fblt	%f1, %f17, fbgt_else.47686

	nop
	nop
	fsub	%f1, %f1, %f17
	j	fbgt_cont.47687

fbgt_else.47686:
fbgt_cont.47687:
	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47688

	nop
	nop
	fsub	%f1, %f17, %f1
	j	fbgt_cont.47689

fbgt_else.47688:
fbgt_cont.47689:
	nop
	nop
	nop
	fblt	%f20, %f1, fbgt_else.47690

	flw	%f18, 478(%zero)
	nop
	fmul	%f23, %f1, %f1
	nop

	nop
	nop
	fmul	%f22, %f23, %f23
	fmul	%f18, %f18, %f1

	nop
	nop
	fmul	%f18, %f18, %f23
	nop

	flw	%f18, 477(%zero)
	nop
	fsub	%f21, %f1, %f18
	nop

	nop
	nop
	fmul	%f18, %f18, %f1
	nop

	nop
	nop
	fmul	%f18, %f18, %f22
	nop

	flw	%f18, 476(%zero)
	nop
	fadd	%f21, %f21, %f18
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fmul	%f1, %f1, %f22
	nop

	nop
	nop
	fsub	%f1, %f21, %f1
	j	fbgt_cont.47691

fbgt_else.47690:
	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f1, 474(%zero)
	nop
	fmul	%f22, %f1, %f1
	nop

	nop
	nop
	fmul	%f21, %f22, %f22
	fmul	%f1, %f1, %f22

	flw	%f1, 473(%zero)
	nop
	fsub	%f18, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f18, %f18, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f22
	nop

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fsub	%f1, %f18, %f1
	nop

fbgt_cont.47691:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47692

	nop
	nop
	nop
	j	bnei_cont.47693

bnei_else.47692:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.47693:
	nop
	nop
	fmul	%f1, %f0, %f1
	fabs	%f16, %f16

	fsw	%f1, 78(%zero)
	nop
	fdiv	%f1, %f16, %f19
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f17, fbgt_else.47694

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47695

fbgt_else.47694:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.47695:
	nop
	nop
	nop
	fblt	%f1, %f17, fbgt_else.47696

	nop
	nop
	fsub	%f1, %f1, %f17
	j	fbgt_cont.47697

fbgt_else.47696:
fbgt_cont.47697:
	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47698

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47700

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47699

bnei_else.47700:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.47701:
	nop
	nop
	nop
	j	fbgt_cont.47699

fbgt_else.47698:
fbgt_cont.47699:
	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47702

	nop
	nop
	fsub	%f1, %f17, %f1
	j	fbgt_cont.47703

fbgt_else.47702:
fbgt_cont.47703:
	nop
	nop
	nop
	fblt	%f20, %f1, fbgt_else.47704

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
	fsub	%f16, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 472(%zero)
	nop
	fadd	%f16, %f16, %f1
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
	fsub	%f1, %f16, %f1
	j	fbgt_cont.47705

fbgt_else.47704:
	flw	%f1, 478(%zero)
	nop
	fsub	%f19, %f2, %f1
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f1, %f1, %f19

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f1, %f1, %f18

	flw	%f1, 477(%zero)
	nop
	fsub	%f16, %f19, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 476(%zero)
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
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fsub	%f1, %f16, %f1
	nop

fbgt_cont.47705:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47706

	nop
	nop
	nop
	j	bnei_cont.47707

bnei_else.47706:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.47707:
	addi	%sp, %sp, 7
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 80(%zero)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 81(%zero)
	nop
	nop
	nop

	addi	%v0, %zero, 0
	nop
	nop
	jal	read_object.2772

	addi	%v0, %zero, 0
	nop
	nop
	jal	read_net_item.2776

	addi	%sp, %sp, -7
	lw	%a0, 0(%v0)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.47708

	sw	%v0, 83(%zero)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	read_and_network.2780

	addi	%sp, %sp, -7
	nop
	nop
	j	bnei_cont.47709

bnei_else.47708:
bnei_cont.47709:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	nop
	jal	read_net_item.2776

	addi	%sp, %sp, -7
	addi	%s0, %v0, 0
	nop
	nop

	lw	%a0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.47710

	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	nop
	jal	read_or_network.2778

	addi	%sp, %sp, -7
	sw	%s0, 0(%v0)
	nop
	j	bnei_cont.47711

bnei_else.47710:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_array

	addi	%sp, %sp, -7
	nop
	nop
	nop

bnei_cont.47711:
	sw	%v0, 134(%zero)
	addi	%sp, %sp, 7
	nop
	nop

	addi	%v0, %zero, 80
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %zero, 51
	nop
	nop
	jal	min_caml_print_char

	addi	%a1, %zero, 10
	nop
	nop
	nop

	addi	%v0, %a1, 0
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	addi	%v1, %zero, 0
	nop
	nop

	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	nop
	jal	print_int_sub1.2629

	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	nop
	nop

	lw	%a3, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_else.47712

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47714

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47716

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47718

	addi	%a3, %a3, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47713

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47722

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47724

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47726

	addi	%a3, %a3, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47713

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47730

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47732

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47734

	addi	%a3, %a3, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47713

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47738

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47740

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47742

	addi	%v0, %a3, -40
	addi	%sp, %sp, 7
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	nop
	j	bgti_cont.47713

bgti_else.47742:
	addi	%a3, %a3, -30
	nop
	nop
	nop

bgti_cont.47743:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47740:
	addi	%a3, %a3, -20
	nop
	nop
	nop

bgti_cont.47741:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47738:
	addi	%a3, %a3, -10
	nop
	nop
	nop

bgti_cont.47739:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47736:
bgti_cont.47737:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47734:
	addi	%a3, %a3, -30
	nop
	nop
	nop

bgti_cont.47735:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47732:
	addi	%a3, %a3, -20
	nop
	nop
	nop

bgti_cont.47733:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47730:
	addi	%a3, %a3, -10
	nop
	nop
	nop

bgti_cont.47731:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47728:
bgti_cont.47729:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47726:
	addi	%a3, %a3, -30
	nop
	nop
	nop

bgti_cont.47727:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47724:
	addi	%a3, %a3, -20
	nop
	nop
	nop

bgti_cont.47725:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47722:
	addi	%a3, %a3, -10
	nop
	nop
	nop

bgti_cont.47723:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47720:
bgti_cont.47721:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47718:
	addi	%a3, %a3, -30
	nop
	nop
	nop

bgti_cont.47719:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47716:
	addi	%a3, %a3, -20
	nop
	nop
	nop

bgti_cont.47717:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47714:
	addi	%a3, %a3, -10
	nop
	nop
	nop

bgti_cont.47715:
	nop
	nop
	nop
	j	bgti_cont.47713

bgti_else.47712:
bgti_cont.47713:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.47744

	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	nop
	nop
	j	bgt_cont.47745

bgt_else.47744:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2629

	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.47746

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47748

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47750

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47752

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47747

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47756

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47758

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47760

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47747

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47764

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47766

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47768

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47747

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47772

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47774

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47776

	addi	%v0, %a2, -40
	addi	%sp, %sp, 7
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.47747

bgti_else.47776:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.47777:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47774:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.47775:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47772:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.47773:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47770:
bgti_cont.47771:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47768:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.47769:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47766:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.47767:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47764:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.47765:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47762:
bgti_cont.47763:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47760:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.47761:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47758:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.47759:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47756:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.47757:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47754:
bgti_cont.47755:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47752:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.47753:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47750:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.47751:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47748:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.47749:
	nop
	nop
	nop
	j	bgti_cont.47747

bgti_else.47746:
bgti_cont.47747:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.47778

	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%v0, %a3, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	nop
	nop
	j	bgt_cont.47779

bgt_else.47778:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47780

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47782

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47784

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47786

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47781

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47790

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47792

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47794

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47781

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47798

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47800

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47802

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47781

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47806

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47808

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47810

	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.47781

bgti_else.47810:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47811:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47808:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47809:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47806:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47807:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47804:
bgti_cont.47805:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47802:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47803:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47800:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47801:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47798:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47799:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47796:
bgti_cont.47797:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47794:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47795:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47792:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47793:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47790:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47791:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47788:
bgti_cont.47789:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47786:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47787:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47784:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47785:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47782:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47783:
	nop
	nop
	nop
	j	bgti_cont.47781

bgti_else.47780:
bgti_cont.47781:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a3, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	nop
	nop
	nop

bgt_cont.47779:
bgt_cont.47745:
	addi	%a2, %zero, 32
	addi	%sp, %sp, 7
	nop
	nop

	addi	%v0, %a2, 0
	nop
	nop
	jal	min_caml_print_char

	lw	%a3, 155(%zero)
	addi	%v1, %zero, 0
	nop
	nop

	addi	%v0, %a3, 0
	nop
	nop
	jal	print_int_sub1.2629

	addi	%sp, %sp, -7
	addi	%fp, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_else.47812

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47814

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47816

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47818

	addi	%a3, %a3, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47813

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47822

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47824

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47826

	addi	%a3, %a3, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47813

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47830

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47832

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47834

	addi	%a3, %a3, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.47813

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.47838

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.47840

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.47842

	addi	%v0, %a3, -40
	addi	%sp, %sp, 7
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	nop
	j	bgti_cont.47813

bgti_else.47842:
	addi	%a3, %a3, -30
	nop
	nop
	nop

bgti_cont.47843:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47840:
	addi	%a3, %a3, -20
	nop
	nop
	nop

bgti_cont.47841:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47838:
	addi	%a3, %a3, -10
	nop
	nop
	nop

bgti_cont.47839:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47836:
bgti_cont.47837:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47834:
	addi	%a3, %a3, -30
	nop
	nop
	nop

bgti_cont.47835:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47832:
	addi	%a3, %a3, -20
	nop
	nop
	nop

bgti_cont.47833:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47830:
	addi	%a3, %a3, -10
	nop
	nop
	nop

bgti_cont.47831:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47828:
bgti_cont.47829:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47826:
	addi	%a3, %a3, -30
	nop
	nop
	nop

bgti_cont.47827:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47824:
	addi	%a3, %a3, -20
	nop
	nop
	nop

bgti_cont.47825:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47822:
	addi	%a3, %a3, -10
	nop
	nop
	nop

bgti_cont.47823:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47820:
bgti_cont.47821:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47818:
	addi	%a3, %a3, -30
	nop
	nop
	nop

bgti_cont.47819:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47816:
	addi	%a3, %a3, -20
	nop
	nop
	nop

bgti_cont.47817:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47814:
	addi	%a3, %a3, -10
	nop
	nop
	nop

bgti_cont.47815:
	nop
	nop
	nop
	j	bgti_cont.47813

bgti_else.47812:
bgti_cont.47813:
	nop
	nop
	nop
	blt	%zero, %fp, bgt_else.47844

	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	nop
	nop
	j	bgt_cont.47845

bgt_else.47844:
	addi	%v1, %zero, 0
	addi	%v0, %fp, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2629

	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_else.47846

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.47848

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.47850

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.47852

	addi	%fp, %fp, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.47847

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.47856

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.47858

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.47860

	addi	%fp, %fp, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.47847

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.47864

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.47866

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.47868

	addi	%fp, %fp, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.47847

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.47872

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.47874

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.47876

	addi	%v0, %fp, -40
	addi	%sp, %sp, 7
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -7
	addi	%fp, %v0, 0
	nop
	j	bgti_cont.47847

bgti_else.47876:
	addi	%fp, %fp, -30
	nop
	nop
	nop

bgti_cont.47877:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47874:
	addi	%fp, %fp, -20
	nop
	nop
	nop

bgti_cont.47875:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47872:
	addi	%fp, %fp, -10
	nop
	nop
	nop

bgti_cont.47873:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47870:
bgti_cont.47871:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47868:
	addi	%fp, %fp, -30
	nop
	nop
	nop

bgti_cont.47869:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47866:
	addi	%fp, %fp, -20
	nop
	nop
	nop

bgti_cont.47867:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47864:
	addi	%fp, %fp, -10
	nop
	nop
	nop

bgti_cont.47865:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47862:
bgti_cont.47863:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47860:
	addi	%fp, %fp, -30
	nop
	nop
	nop

bgti_cont.47861:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47858:
	addi	%fp, %fp, -20
	nop
	nop
	nop

bgti_cont.47859:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47856:
	addi	%fp, %fp, -10
	nop
	nop
	nop

bgti_cont.47857:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47854:
bgti_cont.47855:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47852:
	addi	%fp, %fp, -30
	nop
	nop
	nop

bgti_cont.47853:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47850:
	addi	%fp, %fp, -20
	nop
	nop
	nop

bgti_cont.47851:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47848:
	addi	%fp, %fp, -10
	nop
	nop
	nop

bgti_cont.47849:
	nop
	nop
	nop
	j	bgti_cont.47847

bgti_else.47846:
bgti_cont.47847:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.47878

	addi	%v0, %fp, 48
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%v0, %a3, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	nop
	nop
	j	bgt_cont.47879

bgt_else.47878:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47880

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47882

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47884

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47886

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47881

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47890

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47892

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47894

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47881

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47898

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47900

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47902

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47881

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47906

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47908

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47910

	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.47881

bgti_else.47910:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47911:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47908:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47909:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47906:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47907:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47904:
bgti_cont.47905:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47902:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47903:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47900:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47901:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47898:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47899:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47896:
bgti_cont.47897:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47894:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47895:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47892:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47893:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47890:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47891:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47888:
bgti_cont.47889:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47886:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47887:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47884:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47885:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47882:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47883:
	nop
	nop
	nop
	j	bgti_cont.47881

bgti_else.47880:
bgti_cont.47881:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%v0, %fp, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a3, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	nop
	nop
	nop

bgt_cont.47879:
bgt_cont.47845:
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%v0, %zero, 255
	addi	%v1, %zero, 0
	nop
	jal	print_int_sub1.2629

	addi	%a2, %v0, 0
	addi	%v0, %zero, 95
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.47912

	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	nop
	nop
	j	bgt_cont.47913

bgt_else.47912:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2629

	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.47914

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47916

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47918

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47920

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47915

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47924

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47926

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47928

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47915

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47932

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47934

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47936

	addi	%a2, %a2, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.47915

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.47940

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.47942

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.47944

	addi	%v0, %a2, -40
	addi	%sp, %sp, 7
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	nop
	j	bgti_cont.47915

bgti_else.47944:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.47945:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47942:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.47943:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47940:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.47941:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47938:
bgti_cont.47939:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47936:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.47937:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47934:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.47935:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47932:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.47933:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47930:
bgti_cont.47931:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47928:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.47929:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47926:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.47927:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47924:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.47925:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47922:
bgti_cont.47923:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47920:
	addi	%a2, %a2, -30
	nop
	nop
	nop

bgti_cont.47921:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47918:
	addi	%a2, %a2, -20
	nop
	nop
	nop

bgti_cont.47919:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47916:
	addi	%a2, %a2, -10
	nop
	nop
	nop

bgti_cont.47917:
	nop
	nop
	nop
	j	bgti_cont.47915

bgti_else.47914:
bgti_cont.47915:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.47946

	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%v0, %a3, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	nop
	nop
	j	bgt_cont.47947

bgt_else.47946:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47948

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47950

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47952

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47954

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47949

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47958

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47960

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47962

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47949

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47966

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47968

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47970

	addi	%a0, %a0, -40
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.47949

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.47974

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.47976

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.47978

	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	nop
	jal	print_int_sub2.2632

	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	nop
	j	bgti_cont.47949

bgti_else.47978:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47979:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47976:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47977:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47974:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47975:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47972:
bgti_cont.47973:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47970:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47971:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47968:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47969:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47966:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47967:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47964:
bgti_cont.47965:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47962:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47963:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47960:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47961:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47958:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47959:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47956:
bgti_cont.47957:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47954:
	addi	%a0, %a0, -30
	nop
	nop
	nop

bgti_cont.47955:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47952:
	addi	%a0, %a0, -20
	nop
	nop
	nop

bgti_cont.47953:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47950:
	addi	%a0, %a0, -10
	nop
	nop
	nop

bgti_cont.47951:
	nop
	nop
	nop
	j	bgti_cont.47949

bgti_else.47948:
bgti_cont.47949:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%v0, %a2, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%v0, %a3, 48
	nop
	nop
	jal	min_caml_print_char

	addi	%sp, %sp, -7
	nop
	nop
	nop

bgt_cont.47947:
bgt_cont.47913:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	nop
	jal	min_caml_print_char

	addi	%a2, %zero, 120
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%sp, %sp, -7
	addi	%a1, %v0, 0
	nop
	nop

	lw	%v0, 0(%zero)
	addi	%v1, %a1, 0
	nop
	nop

	sw	%v0, 7(%sp)
	nop
	nop
	nop

	addi	%sp, %sp, 8
	nop
	nop
	jal	min_caml_create_array

	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	nop
	nop

	sw	%v0, 1(%v1)
	addi	%v0, %a2, 0
	nop
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
	addi	%v1, %zero, 118
	nop
	nop

	addi	%v0, %s7, 0
	nop
	nop
	jal	create_dirvec_elements.3090

	addi	%v0, %zero, 3
	nop
	nop
	jal	create_dirvecs.3093

	addi	%a0, %zero, 9
	flw	%f0, 460(%zero)
	addi	%v0, %zero, 4
	addi	%v1, %zero, 0

	addi	%a0, %zero, 0
	nop
	itof	%f1, %a0
	nop

	flw	%f0, 438(%zero)
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	jal	calc_dirvecs.3079

	addi	%v0, %zero, 8
	addi	%a0, %zero, 4
	addi	%v1, %zero, 2
	jal	calc_dirvec_rows.3084

	addi	%v1, %zero, 119
	addi	%v0, %s7, 0
	nop
	jal	init_dirvec_constants.3095

	addi	%v0, %zero, 3
	nop
	nop
	jal	init_vecset_constants.3098

	addi	%sp, %sp, -8
	flw	%f26, 78(%zero)
	nop
	nop

	fsw	%f26, 184(%zero)
	lw	%a0, 7(%sp)
	nop
	nop

	flw	%f27, 79(%zero)
	addi	%s4, %a0, -1
	nop
	nop

	fsw	%f27, 185(%zero)
	nop
	nop
	nop

	flw	%f28, 80(%zero)
	nop
	nop
	nop

	fsw	%f28, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s4, 0, bgti_else.47980

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
	beqi	%a0, 1, bnei_else.47982

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.47984

	addi	%v0, %zero, 5
	addi	%sp, %sp, 8
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%sp, %sp, -8
	flw	%f20, 184(%zero)
	nop
	nop

	flw	%f18, 185(%zero)
	flw	%f16, 186(%zero)
	fmul	%f0, %f20, %f20
	nop

	flw	%f21, 0(%a1)
	flw	%f2, 1(%a1)
	nop
	nop

	flw	%f19, 2(%a1)
	nop
	fmul	%f1, %f0, %f21
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.47986

	flw	%f1, 0(%a2)
	nop
	fmul	%f17, %f18, %f16
	nop

	nop
	nop
	fmul	%f1, %f17, %f1
	nop

	flw	%f0, 1(%a2)
	nop
	fadd	%f17, %f0, %f1
	fmul	%f1, %f16, %f20

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f18

	flw	%f0, 2(%a2)
	nop
	fadd	%f17, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	j	bnei_cont.47987

bnei_else.47986:
bnei_cont.47987:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f20, %f21
	nop

	nop
	nop
	fneg	%f24, %f1
	fmul	%f1, %f18, %f2

	nop
	nop
	fneg	%f22, %f1
	fmul	%f1, %f16, %f19

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.47988

	flw	%f21, 1(%a2)
	flw	%f23, 2(%a2)
	nop
	nop

	flw	%f2, 474(%zero)
	nop
	fmul	%f17, %f16, %f21
	fmul	%f1, %f18, %f23

	flw	%f17, 0(%a2)
	nop
	fadd	%f1, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f16, %f16, %f17

	nop
	nop
	fsub	%f1, %f24, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f20, %f23
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f18, %f17

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f22, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f20, %f21
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.47989

bnei_else.47988:
	fsw	%f24, 1(%v0)
	nop
	nop
	nop

	fsw	%f22, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.47989:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.47990

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.47991

fbeq_else.47990:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.47991:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47992

	nop
	nop
	nop
	j	bnei_cont.47993

bnei_else.47992:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.47993:
	sw	%v0, 187(%s4)
	nop
	nop
	j	bnei_cont.47983

bnei_else.47984:
	addi	%v0, %zero, 4
	addi	%sp, %sp, 8
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%sp, %sp, -8
	flw	%f0, 184(%zero)
	nop
	nop

	flw	%f18, 0(%a1)
	flw	%f17, 1(%a1)
	nop
	nop

	flw	%f0, 185(%zero)
	flw	%f16, 2(%a1)
	fmul	%f1, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 186(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.47994

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.47995

fbgt_else.47994:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.47995:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47996

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
	fdiv	%f0, %f18, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f17, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f16, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.47997

bnei_else.47996:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.47997:
	sw	%v0, 187(%s4)
	nop
	nop
	nop

bnei_cont.47985:
	nop
	nop
	nop
	j	bnei_cont.47983

bnei_else.47982:
	addi	%v0, %zero, 6
	addi	%sp, %sp, 8
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	addi	%sp, %sp, -8
	flw	%f1, 184(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.47998

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.47999

fbeq_else.47998:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.47999:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48000

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.48001

bnei_else.48000:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.48002

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.48003

fbgt_else.48002:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.48003:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.48004

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48006

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.48005

bnei_else.48006:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.48007:
	nop
	nop
	nop
	j	bnei_cont.48005

bnei_else.48004:
bnei_cont.48005:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48008

	nop
	nop
	nop
	j	bnei_cont.48009

bnei_else.48008:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.48009:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.48001:
	flw	%f1, 185(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.48010

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.48011

fbeq_else.48010:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.48011:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48012

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.48013

bnei_else.48012:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.48014

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.48015

fbgt_else.48014:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.48015:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.48016

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48018

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.48017

bnei_else.48018:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.48019:
	nop
	nop
	nop
	j	bnei_cont.48017

bnei_else.48016:
bnei_cont.48017:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48020

	nop
	nop
	nop
	j	bnei_cont.48021

bnei_else.48020:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.48021:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.48013:
	flw	%f1, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.48022

	add	%a0, %zero, %k1
	nop
	nop
	j	fbeq_cont.48023

fbeq_else.48022:
	add	%a0, %zero, %zero
	nop
	nop
	nop

fbeq_cont.48023:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48024

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.48025

bnei_else.48024:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.48026

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.48027

fbgt_else.48026:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.48027:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.48028

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48030

	add	%a0, %zero, %zero
	nop
	nop
	j	bnei_cont.48029

bnei_else.48030:
	add	%a0, %zero, %k1
	nop
	nop
	nop

bnei_cont.48031:
	nop
	nop
	nop
	j	bnei_cont.48029

bnei_else.48028:
bnei_cont.48029:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48032

	nop
	nop
	nop
	j	bnei_cont.48033

bnei_else.48032:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.48033:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.48025:
	sw	%v0, 187(%s4)
	nop
	nop
	nop

bnei_cont.47983:
	addi	%v1, %s4, -1
	addi	%v0, %zero, 247
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2877

	addi	%sp, %sp, -8
	nop
	nop
	j	bgti_cont.47981

bgti_else.47980:
bgti_cont.47981:
	nop
	nop
	nop
	blti	%s4, 0, bgti_else.48034

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
	beqi	%a0, 2, bnei_else.48036

	nop
	nop
	nop
	j	bgti_cont.48035

bnei_else.48036:
	flw	%f0, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f30, fbgt_else.48038

	add	%a0, %zero, %zero
	nop
	nop
	j	fbgt_cont.48039

fbgt_else.48038:
	add	%a0, %zero, %k1
	nop
	nop
	nop

fbgt_cont.48039:
	nop
	nop
	nop
	beqi	%a0, 0, bgti_cont.48035

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.48042

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.48044

	nop
	nop
	nop
	j	bgti_cont.48035

bnei_else.48044:
	lw	%s6, 434(%zero)
	flw	%f17, 0(%a3)
	sll	%a0, %s4, 2
	fsub	%f29, %f30, %f0

	addi	%s5, %a0, 1
	flw	%f16, 1(%a3)
	fmul	%f1, %f26, %f17
	addi	%v0, %zero, 3

	flw	%f19, 2(%a3)
	addi	%sp, %sp, 8
	fmul	%f0, %f27, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f28, %f19

	flw	%f1, 470(%zero)
	nop
	fadd	%f18, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fsub	%f17, %f0, %f26
	fmul	%f0, %f1, %f16

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fsub	%f16, %f0, %f27
	fmul	%f0, %f1, %f19

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fsub	%f1, %f0, %f28
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	addi	%sp, %sp, -8
	addi	%a1, %v0, 0
	nop
	nop

	lw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array

	add	%s7, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v1, %s4, 0
	nop

	sw	%v0, 1(%s7)
	nop
	nop
	nop

	sw	%a1, 0(%s7)
	fsw	%f17, 0(%a1)
	nop
	nop

	fsw	%f16, 1(%a1)
	addi	%v0, %s7, 0
	nop
	nop

	fsw	%f1, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	addi	%sp, %sp, -8
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	nop

	fsw	%f29, 2(%a0)
	nop
	nop
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

	addi	%a0, %s6, 1
	nop
	nop
	nop

	sw	%a0, 434(%zero)
	nop
	nop
	nop

bnei_cont.48045:
	nop
	nop
	nop
	j	bgti_cont.48035

bnei_else.48042:
	lw	%s6, 434(%zero)
	addi	%v0, %zero, 3
	sll	%s5, %s4, 2
	fsub	%f29, %f30, %f0

	addi	%s7, %s5, 1
	nop
	fneg	%f0, %f26
	fneg	%f3, %f28

	fsw	%f0, 8(%sp)
	nop
	fneg	%f0, %f27
	nop

	fsw	%f0, 9(%sp)
	nop
	fmov	%f0, %fzero
	nop

	addi	%sp, %sp, 10
	nop
	nop
	jal	min_caml_create_float_array

	addi	%sp, %sp, -10
	addi	%a1, %v0, 0
	nop
	nop

	lw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_array

	addi	%sp, %sp, -10
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v1, %s4, 0

	sw	%v0, 1(%t7)
	flw	%f0, 9(%sp)
	addi	%sp, %sp, 10
	nop

	sw	%a1, 0(%t7)
	fsw	%f26, 0(%a1)
	nop
	nop

	fsw	%f0, 1(%a1)
	addi	%v0, %t7, 0
	nop
	nop

	fsw	%f3, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	fsw	%f29, 2(%a0)
	nop
	nop
	nop

	sw	%t7, 1(%a0)
	addi	%t7, %s5, 2
	nop
	nop

	sw	%s7, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s6)
	nop
	nop
	nop

	addi	%s7, %s6, 1
	nop
	nop
	jal	min_caml_create_float_array

	addi	%sp, %sp, -10
	addi	%a1, %v0, 0
	nop
	nop

	lw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_array

	addi	%sp, %sp, -10
	add	%t8, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v1, %s4, 0

	sw	%v0, 1(%t8)
	flw	%f0, 8(%sp)
	addi	%sp, %sp, 10
	nop

	sw	%a1, 0(%t8)
	fsw	%f0, 0(%a1)
	nop
	nop

	fsw	%f27, 1(%a1)
	addi	%v0, %t8, 0
	nop
	nop

	fsw	%f3, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%s5, %s5, 3
	addi	%v0, %zero, 3

	fsw	%f29, 2(%a0)
	nop
	fmov	%f0, %fzero
	nop

	sw	%t8, 1(%a0)
	nop
	nop
	nop

	sw	%t7, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s7)
	nop
	nop
	nop

	addi	%s7, %s6, 2
	nop
	nop
	jal	min_caml_create_float_array

	addi	%sp, %sp, -10
	addi	%a1, %v0, 0
	nop
	nop

	lw	%v0, 7(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_array

	addi	%sp, %sp, -10
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v1, %s4, 0

	sw	%v0, 1(%t7)
	flw	%f0, 8(%sp)
	nop
	nop

	sw	%a1, 0(%t7)
	fsw	%f0, 0(%a1)
	nop
	nop

	flw	%f0, 9(%sp)
	addi	%v0, %t7, 0
	addi	%sp, %sp, 10
	nop

	fsw	%f0, 1(%a1)
	nop
	nop
	nop

	fsw	%f28, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	addi	%sp, %sp, -10
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	nop

	fsw	%f29, 2(%a0)
	nop
	nop
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
	addi	%a0, %s6, 3
	nop
	nop

	sw	%a0, 434(%zero)
	nop
	nop
	nop

bnei_cont.48043:
	nop
	nop
	nop
	j	bgti_cont.48035

bnei_else.48040:
bnei_cont.48041:
bnei_cont.48037:
	nop
	nop
	nop
	j	bgti_cont.48035

bgti_else.48034:
bgti_cont.48035:
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	sub	%a0, %zero, %a0
	nop

	lw	%a0, 0(%sp)
	nop
	itof	%f0, %a0
	nop

	flw	%f0, 168(%zero)
	addi	%v1, %a0, -1
	fmul	%f17, %f1, %f0
	addi	%a0, %zero, 0

	flw	%f0, 4(%sp)
	nop
	fmul	%f1, %f17, %f0
	nop

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 5(%sp)
	nop
	fmul	%f16, %f17, %f1
	nop

	flw	%f16, 170(%zero)
	nop
	fadd	%f1, %f16, %f1
	nop

	flw	%f16, 6(%sp)
	addi	%sp, %sp, 10
	fmul	%f17, %f17, %f16
	nop

	nop
	nop
	fadd	%f2, %f17, %f16
	jal	pretrace_pixels.3034

	addi	%sp, %sp, -10
	addi	%a2, %zero, 2
	addi	%v0, %zero, 0
	nop

	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
	addi	%sp, %sp, 10
	nop
	jal	scan_line.3051

	addi	%sp, %sp, -10
	nop
	nop
	ret

