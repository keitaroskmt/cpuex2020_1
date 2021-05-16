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
print_int_sub1.2629:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	blti	%a0, 10, bgti_else.31512
	blti	%a0, 20, bgti_else.31513
	blti	%a0, 30, bgti_else.31514
	blti	%a0, 40, bgti_else.31515
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.31516
	blti	%a0, 20, bgti_else.31517
	blti	%a0, 30, bgti_else.31518
	blti	%a0, 40, bgti_else.31519
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.31520
	blti	%a0, 20, bgti_else.31521
	blti	%a0, 30, bgti_else.31522
	blti	%a0, 40, bgti_else.31523
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.31524
	blti	%a0, 20, bgti_else.31525
	blti	%a0, 30, bgti_else.31526
	blti	%a0, 40, bgti_else.31527
	addi	%a0, %a0, -40
	addi	%v1, %v0, 4
	addi	%v0, %a0, 0
	j	print_int_sub1.2629
bgti_else.31527:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.31526:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.31525:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.31524:
	jr	%ra
bgti_else.31523:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.31522:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.31521:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.31520:
	jr	%ra
bgti_else.31519:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.31518:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.31517:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.31516:
	jr	%ra
bgti_else.31515:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.31514:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.31513:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.31512:
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.31637
	blti	%v0, 20, bgti_else.31638
	blti	%v0, 30, bgti_else.31639
	blti	%v0, 40, bgti_else.31640
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31641
	blti	%v0, 20, bgti_else.31642
	blti	%v0, 30, bgti_else.31643
	blti	%v0, 40, bgti_else.31644
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31645
	blti	%v0, 20, bgti_else.31646
	blti	%v0, 30, bgti_else.31647
	blti	%v0, 40, bgti_else.31648
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31649
	blti	%v0, 20, bgti_else.31650
	blti	%v0, 30, bgti_else.31651
	blti	%v0, 40, bgti_else.31652
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31653
	blti	%v0, 20, bgti_else.31654
	blti	%v0, 30, bgti_else.31655
	blti	%v0, 40, bgti_else.31656
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31657
	blti	%v0, 20, bgti_else.31658
	blti	%v0, 30, bgti_else.31659
	blti	%v0, 40, bgti_else.31660
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31661
	blti	%v0, 20, bgti_else.31662
	blti	%v0, 30, bgti_else.31663
	blti	%v0, 40, bgti_else.31664
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31665
	blti	%v0, 20, bgti_else.31666
	blti	%v0, 30, bgti_else.31667
	blti	%v0, 40, bgti_else.31668
	addi	%v0, %v0, -40
	j	print_int_sub2.2632
bgti_else.31668:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31667:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31666:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31665:
	jr	%ra
bgti_else.31664:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31663:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31662:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31661:
	jr	%ra
bgti_else.31660:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31659:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31658:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31657:
	jr	%ra
bgti_else.31656:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31655:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31654:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31653:
	jr	%ra
bgti_else.31652:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31651:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31650:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31649:
	jr	%ra
bgti_else.31648:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31647:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31646:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31645:
	jr	%ra
bgti_else.31644:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31643:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31642:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31641:
	jr	%ra
bgti_else.31640:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31639:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31638:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31637:
	jr	%ra
rotate_quadratic_matrix.2767:
	flw	%f12, 0(%v1)
	flw	%f14, 482(%zero)
	fabs	%f1, %f12
	flw	%f15, 481(%zero)
	fdiv	%f0, %f1, %f15
	floor	%f0, %f0
	fmul	%f0, %f0, %f15
	fsub	%f0, %f1, %f0
	fblt	%f0, %f14, fbgt_else.31809
	add	%a0, %zero, %zero
	j	fbgt_cont.31810
fbgt_else.31809:
	add	%a0, %zero, %k1
fbgt_cont.31810:
	fblt	%f0, %f14, fbgt_else.31811
	fsub	%f0, %f0, %f14
	j	fbgt_cont.31812
fbgt_else.31811:
fbgt_cont.31812:
	flw	%f16, 480(%zero)
	fblt	%f0, %f16, fbgt_else.31813
	beqi	%a0, 0, bnei_else.31815
	add	%a0, %zero, %zero
	j	fbgt_cont.31814
bnei_else.31815:
	add	%a0, %zero, %k1
bnei_cont.31816:
	j	fbgt_cont.31814
fbgt_else.31813:
fbgt_cont.31814:
	fblt	%f0, %f16, fbgt_else.31817
	fsub	%f0, %f14, %f0
	j	fbgt_cont.31818
fbgt_else.31817:
fbgt_cont.31818:
	flw	%f13, 479(%zero)
	fblt	%f13, %f0, fbgt_else.31819
	fmul	%f17, %f0, %f0
	fmul	%f11, %f17, %f17
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
	j	fbgt_cont.31820
fbgt_else.31819:
	fsub	%f18, %f16, %f0
	fmul	%f17, %f18, %f18
	fmul	%f11, %f17, %f17
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
fbgt_cont.31820:
	beqi	%a0, 0, bnei_else.31821
	j	bnei_cont.31822
bnei_else.31821:
	fneg	%f0, %f0
bnei_cont.31822:
	fblt	%f12, %fzero, fbgt_else.31823
	add	%a0, %zero, %k1
	j	fbgt_cont.31824
fbgt_else.31823:
	add	%a0, %zero, %zero
fbgt_cont.31824:
	fabs	%f11, %f12
	fdiv	%f1, %f11, %f15
	floor	%f1, %f1
	fmul	%f1, %f1, %f15
	fsub	%f1, %f11, %f1
	fblt	%f1, %f14, fbgt_else.31825
	beqi	%a0, 0, bnei_else.31827
	add	%a0, %zero, %zero
	j	fbgt_cont.31826
bnei_else.31827:
	add	%a0, %zero, %k1
bnei_cont.31828:
	j	fbgt_cont.31826
fbgt_else.31825:
fbgt_cont.31826:
	fblt	%f1, %f14, fbgt_else.31829
	fsub	%f1, %f1, %f14
	j	fbgt_cont.31830
fbgt_else.31829:
fbgt_cont.31830:
	fblt	%f1, %f16, fbgt_else.31831
	fsub	%f1, %f14, %f1
	j	fbgt_cont.31832
fbgt_else.31831:
fbgt_cont.31832:
	fblt	%f13, %f1, fbgt_else.31833
	fmul	%f18, %f1, %f1
	fmul	%f17, %f18, %f18
	flw	%f11, 478(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f18
	fsub	%f12, %f1, %f11
	flw	%f11, 477(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f17
	fadd	%f12, %f12, %f11
	flw	%f11, 476(%zero)
	fmul	%f1, %f11, %f1
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fsub	%f1, %f12, %f1
	j	fbgt_cont.31834
fbgt_else.31833:
	fsub	%f1, %f16, %f1
	fmul	%f17, %f1, %f1
	fmul	%f12, %f17, %f17
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f17
	fsub	%f11, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f17
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
fbgt_cont.31834:
	beqi	%a0, 0, bnei_else.31835
	j	bnei_cont.31836
bnei_else.31835:
	fneg	%f1, %f1
bnei_cont.31836:
	flw	%f17, 1(%v1)
	fabs	%f12, %f17
	fdiv	%f11, %f12, %f15
	floor	%f11, %f11
	fmul	%f11, %f11, %f15
	fsub	%f11, %f12, %f11
	fblt	%f11, %f14, fbgt_else.31837
	add	%a0, %zero, %zero
	j	fbgt_cont.31838
fbgt_else.31837:
	add	%a0, %zero, %k1
fbgt_cont.31838:
	fblt	%f11, %f14, fbgt_else.31839
	fsub	%f11, %f11, %f14
	j	fbgt_cont.31840
fbgt_else.31839:
fbgt_cont.31840:
	fblt	%f11, %f16, fbgt_else.31841
	beqi	%a0, 0, bnei_else.31843
	add	%a0, %zero, %zero
	j	fbgt_cont.31842
bnei_else.31843:
	add	%a0, %zero, %k1
bnei_cont.31844:
	j	fbgt_cont.31842
fbgt_else.31841:
fbgt_cont.31842:
	fblt	%f11, %f16, fbgt_else.31845
	fsub	%f11, %f14, %f11
	j	fbgt_cont.31846
fbgt_else.31845:
fbgt_cont.31846:
	fblt	%f13, %f11, fbgt_else.31847
	fmul	%f19, %f11, %f11
	fmul	%f18, %f19, %f19
	flw	%f11, 474(%zero)
	fmul	%f11, %f11, %f19
	fsub	%f12, %f30, %f11
	flw	%f11, 473(%zero)
	fmul	%f11, %f11, %f18
	fadd	%f12, %f12, %f11
	flw	%f11, 472(%zero)
	fmul	%f11, %f11, %f19
	fmul	%f11, %f11, %f18
	fsub	%f11, %f12, %f11
	j	fbgt_cont.31848
fbgt_else.31847:
	fsub	%f2, %f16, %f11
	fmul	%f19, %f2, %f2
	fmul	%f18, %f19, %f19
	flw	%f11, 478(%zero)
	fmul	%f11, %f11, %f2
	fmul	%f11, %f11, %f19
	fsub	%f12, %f2, %f11
	flw	%f11, 477(%zero)
	fmul	%f11, %f11, %f2
	fmul	%f11, %f11, %f18
	fadd	%f12, %f12, %f11
	flw	%f11, 476(%zero)
	fmul	%f11, %f11, %f2
	fmul	%f11, %f11, %f19
	fmul	%f11, %f11, %f18
	fsub	%f11, %f12, %f11
fbgt_cont.31848:
	beqi	%a0, 0, bnei_else.31849
	j	bnei_cont.31850
bnei_else.31849:
	fneg	%f11, %f11
bnei_cont.31850:
	fblt	%f17, %fzero, fbgt_else.31851
	add	%a0, %zero, %k1
	j	fbgt_cont.31852
fbgt_else.31851:
	add	%a0, %zero, %zero
fbgt_cont.31852:
	fabs	%f17, %f17
	fdiv	%f12, %f17, %f15
	floor	%f12, %f12
	fmul	%f12, %f12, %f15
	fsub	%f12, %f17, %f12
	fblt	%f12, %f14, fbgt_else.31853
	beqi	%a0, 0, bnei_else.31855
	add	%a0, %zero, %zero
	j	fbgt_cont.31854
bnei_else.31855:
	add	%a0, %zero, %k1
bnei_cont.31856:
	j	fbgt_cont.31854
fbgt_else.31853:
fbgt_cont.31854:
	fblt	%f12, %f14, fbgt_else.31857
	fsub	%f12, %f12, %f14
	j	fbgt_cont.31858
fbgt_else.31857:
fbgt_cont.31858:
	fblt	%f12, %f16, fbgt_else.31859
	fsub	%f12, %f14, %f12
	j	fbgt_cont.31860
fbgt_else.31859:
fbgt_cont.31860:
	fblt	%f13, %f12, fbgt_else.31861
	fmul	%f2, %f12, %f12
	fmul	%f19, %f2, %f2
	flw	%f17, 478(%zero)
	fmul	%f17, %f17, %f12
	fmul	%f17, %f17, %f2
	fsub	%f18, %f12, %f17
	flw	%f17, 477(%zero)
	fmul	%f17, %f17, %f12
	fmul	%f17, %f17, %f19
	fadd	%f18, %f18, %f17
	flw	%f17, 476(%zero)
	fmul	%f12, %f17, %f12
	fmul	%f12, %f12, %f2
	fmul	%f12, %f12, %f19
	fsub	%f12, %f18, %f12
	j	fbgt_cont.31862
fbgt_else.31861:
	fsub	%f12, %f16, %f12
	fmul	%f19, %f12, %f12
	fmul	%f18, %f19, %f19
	flw	%f12, 474(%zero)
	fmul	%f12, %f12, %f19
	fsub	%f17, %f30, %f12
	flw	%f12, 473(%zero)
	fmul	%f12, %f12, %f18
	fadd	%f17, %f17, %f12
	flw	%f12, 472(%zero)
	fmul	%f12, %f12, %f19
	fmul	%f12, %f12, %f18
	fsub	%f12, %f17, %f12
fbgt_cont.31862:
	beqi	%a0, 0, bnei_else.31863
	j	bnei_cont.31864
bnei_else.31863:
	fneg	%f12, %f12
bnei_cont.31864:
	flw	%f19, 2(%v1)
	fabs	%f18, %f19
	fdiv	%f17, %f18, %f15
	floor	%f17, %f17
	fmul	%f17, %f17, %f15
	fsub	%f17, %f18, %f17
	fblt	%f17, %f14, fbgt_else.31865
	add	%a0, %zero, %zero
	j	fbgt_cont.31866
fbgt_else.31865:
	add	%a0, %zero, %k1
fbgt_cont.31866:
	fblt	%f17, %f14, fbgt_else.31867
	fsub	%f17, %f17, %f14
	j	fbgt_cont.31868
fbgt_else.31867:
fbgt_cont.31868:
	fblt	%f17, %f16, fbgt_else.31869
	beqi	%a0, 0, bnei_else.31871
	add	%a0, %zero, %zero
	j	fbgt_cont.31870
bnei_else.31871:
	add	%a0, %zero, %k1
bnei_cont.31872:
	j	fbgt_cont.31870
fbgt_else.31869:
fbgt_cont.31870:
	fblt	%f17, %f16, fbgt_else.31873
	fsub	%f17, %f14, %f17
	j	fbgt_cont.31874
fbgt_else.31873:
fbgt_cont.31874:
	fblt	%f13, %f17, fbgt_else.31875
	fmul	%f20, %f17, %f17
	fmul	%f2, %f20, %f20
	flw	%f17, 474(%zero)
	fmul	%f17, %f17, %f20
	fsub	%f18, %f30, %f17
	flw	%f17, 473(%zero)
	fmul	%f17, %f17, %f2
	fadd	%f18, %f18, %f17
	flw	%f17, 472(%zero)
	fmul	%f17, %f17, %f20
	fmul	%f17, %f17, %f2
	fsub	%f17, %f18, %f17
	j	fbgt_cont.31876
fbgt_else.31875:
	fsub	%f21, %f16, %f17
	fmul	%f20, %f21, %f21
	fmul	%f2, %f20, %f20
	flw	%f17, 478(%zero)
	fmul	%f17, %f17, %f21
	fmul	%f17, %f17, %f20
	fsub	%f18, %f21, %f17
	flw	%f17, 477(%zero)
	fmul	%f17, %f17, %f21
	fmul	%f17, %f17, %f2
	fadd	%f18, %f18, %f17
	flw	%f17, 476(%zero)
	fmul	%f17, %f17, %f21
	fmul	%f17, %f17, %f20
	fmul	%f17, %f17, %f2
	fsub	%f17, %f18, %f17
fbgt_cont.31876:
	beqi	%a0, 0, bnei_else.31877
	j	bnei_cont.31878
bnei_else.31877:
	fneg	%f17, %f17
bnei_cont.31878:
	fblt	%f19, %fzero, fbgt_else.31879
	add	%a0, %zero, %k1
	j	fbgt_cont.31880
fbgt_else.31879:
	add	%a0, %zero, %zero
fbgt_cont.31880:
	fabs	%f19, %f19
	fdiv	%f18, %f19, %f15
	floor	%f18, %f18
	fmul	%f15, %f18, %f15
	fsub	%f15, %f19, %f15
	fblt	%f15, %f14, fbgt_else.31881
	beqi	%a0, 0, bnei_else.31883
	add	%a0, %zero, %zero
	j	fbgt_cont.31882
bnei_else.31883:
	add	%a0, %zero, %k1
bnei_cont.31884:
	j	fbgt_cont.31882
fbgt_else.31881:
fbgt_cont.31882:
	fblt	%f15, %f14, fbgt_else.31885
	fsub	%f15, %f15, %f14
	j	fbgt_cont.31886
fbgt_else.31885:
fbgt_cont.31886:
	fblt	%f15, %f16, fbgt_else.31887
	fsub	%f15, %f14, %f15
	j	fbgt_cont.31888
fbgt_else.31887:
fbgt_cont.31888:
	fblt	%f13, %f15, fbgt_else.31889
	fmul	%f18, %f15, %f15
	fmul	%f16, %f18, %f18
	flw	%f13, 478(%zero)
	fmul	%f13, %f13, %f15
	fmul	%f13, %f13, %f18
	fsub	%f14, %f15, %f13
	flw	%f13, 477(%zero)
	fmul	%f13, %f13, %f15
	fmul	%f13, %f13, %f16
	fadd	%f14, %f14, %f13
	flw	%f13, 476(%zero)
	fmul	%f13, %f13, %f15
	fmul	%f13, %f13, %f18
	fmul	%f13, %f13, %f16
	fsub	%f13, %f14, %f13
	j	fbgt_cont.31890
fbgt_else.31889:
	fsub	%f13, %f16, %f15
	fmul	%f16, %f13, %f13
	fmul	%f15, %f16, %f16
	flw	%f13, 474(%zero)
	fmul	%f13, %f13, %f16
	fsub	%f14, %f30, %f13
	flw	%f13, 473(%zero)
	fmul	%f13, %f13, %f15
	fadd	%f14, %f14, %f13
	flw	%f13, 472(%zero)
	fmul	%f13, %f13, %f16
	fmul	%f13, %f13, %f15
	fsub	%f13, %f14, %f13
fbgt_cont.31890:
	beqi	%a0, 0, bnei_else.31891
	j	bnei_cont.31892
bnei_else.31891:
	fneg	%f13, %f13
bnei_cont.31892:
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
	flw	%f17, 470(%zero)
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
	beqi	%a2, -1, bnei_else.32120
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
	fblt	%f0, %fzero, fbgt_else.32121
	add	%s3, %zero, %zero
	j	fbgt_cont.32122
fbgt_else.32121:
	add	%s3, %zero, %k1
fbgt_cont.32122:
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
	beqi	%k0, 0, bnei_else.32123
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
	j	bnei_cont.32124
bnei_else.32123:
bnei_cont.32124:
	beqi	%a3, 2, bnei_else.32125
	add	%s6, %zero, %s3
	j	bnei_cont.32126
bnei_else.32125:
	add	%s6, %zero, %k1
bnei_cont.32126:
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
	beqi	%a3, 3, bnei_else.32127
	beqi	%a3, 2, bnei_else.32129
	j	bnei_cont.32128
bnei_else.32129:
	beqi	%s3, 0, bnei_else.32131
	add	%a0, %zero, %zero
	j	bnei_cont.32132
bnei_else.32131:
	add	%a0, %zero, %k1
bnei_cont.32132:
	flw	%f13, 0(%s1)
	fmul	%f1, %f13, %f13
	flw	%f12, 1(%s1)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 2(%s1)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.32133
	add	%a2, %zero, %k1
	j	fbeq_cont.32134
fbeq_else.32133:
	add	%a2, %zero, %zero
fbeq_cont.32134:
	beqi	%a2, 0, bnei_else.32135
	fmov	%f0, %f30
	j	bnei_cont.32136
bnei_else.32135:
	beqi	%a0, 0, bnei_else.32137
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.32138
bnei_else.32137:
	fdiv	%f0, %f30, %f1
bnei_cont.32138:
bnei_cont.32136:
	fmul	%f1, %f13, %f0
	fsw	%f1, 0(%s1)
	fmul	%f1, %f12, %f0
	fsw	%f1, 1(%s1)
	fmul	%f0, %f11, %f0
	fsw	%f0, 2(%s1)
bnei_cont.32130:
	j	bnei_cont.32128
bnei_else.32127:
	flw	%f1, 0(%s1)
	fbne	%f1, %fzero, fbeq_else.32139
	add	%a0, %zero, %k1
	j	fbeq_cont.32140
fbeq_else.32139:
	add	%a0, %zero, %zero
fbeq_cont.32140:
	beqi	%a0, 0, bnei_else.32141
	fmov	%f0, %fzero
	j	bnei_cont.32142
bnei_else.32141:
	fbne	%f1, %fzero, fbeq_else.32143
	add	%a0, %zero, %k1
	j	fbeq_cont.32144
fbeq_else.32143:
	add	%a0, %zero, %zero
fbeq_cont.32144:
	beqi	%a0, 0, bnei_else.32145
	fmov	%f0, %fzero
	j	bnei_cont.32146
bnei_else.32145:
	fblt	%fzero, %f1, fbgt_else.32147
	add	%a0, %zero, %zero
	j	fbgt_cont.32148
fbgt_else.32147:
	add	%a0, %zero, %k1
fbgt_cont.32148:
	beqi	%a0, 0, bnei_else.32149
	fmov	%f0, %f30
	j	bnei_cont.32150
bnei_else.32149:
	flw	%f0, 468(%zero)
bnei_cont.32150:
bnei_cont.32146:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32142:
	fsw	%f0, 0(%s1)
	flw	%f1, 1(%s1)
	fbne	%f1, %fzero, fbeq_else.32151
	add	%a0, %zero, %k1
	j	fbeq_cont.32152
fbeq_else.32151:
	add	%a0, %zero, %zero
fbeq_cont.32152:
	beqi	%a0, 0, bnei_else.32153
	fmov	%f0, %fzero
	j	bnei_cont.32154
bnei_else.32153:
	fbne	%f1, %fzero, fbeq_else.32155
	add	%a0, %zero, %k1
	j	fbeq_cont.32156
fbeq_else.32155:
	add	%a0, %zero, %zero
fbeq_cont.32156:
	beqi	%a0, 0, bnei_else.32157
	fmov	%f0, %fzero
	j	bnei_cont.32158
bnei_else.32157:
	fblt	%fzero, %f1, fbgt_else.32159
	add	%a0, %zero, %zero
	j	fbgt_cont.32160
fbgt_else.32159:
	add	%a0, %zero, %k1
fbgt_cont.32160:
	beqi	%a0, 0, bnei_else.32161
	fmov	%f0, %f30
	j	bnei_cont.32162
bnei_else.32161:
	flw	%f0, 468(%zero)
bnei_cont.32162:
bnei_cont.32158:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32154:
	fsw	%f0, 1(%s1)
	flw	%f1, 2(%s1)
	fbne	%f1, %fzero, fbeq_else.32163
	add	%a0, %zero, %k1
	j	fbeq_cont.32164
fbeq_else.32163:
	add	%a0, %zero, %zero
fbeq_cont.32164:
	beqi	%a0, 0, bnei_else.32165
	fmov	%f0, %fzero
	j	bnei_cont.32166
bnei_else.32165:
	fbne	%f1, %fzero, fbeq_else.32167
	add	%a0, %zero, %k1
	j	fbeq_cont.32168
fbeq_else.32167:
	add	%a0, %zero, %zero
fbeq_cont.32168:
	beqi	%a0, 0, bnei_else.32169
	fmov	%f0, %fzero
	j	bnei_cont.32170
bnei_else.32169:
	fblt	%fzero, %f1, fbgt_else.32171
	add	%a0, %zero, %zero
	j	fbgt_cont.32172
fbgt_else.32171:
	add	%a0, %zero, %k1
fbgt_cont.32172:
	beqi	%a0, 0, bnei_else.32173
	fmov	%f0, %f30
	j	bnei_cont.32174
bnei_else.32173:
	flw	%f0, 468(%zero)
bnei_cont.32174:
bnei_cont.32170:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32166:
	fsw	%f0, 2(%s1)
bnei_cont.32128:
	beqi	%k0, 0, bnei_else.32175
	flw	%f12, 0(%s0)
	flw	%f14, 482(%zero)
	fabs	%f1, %f12
	flw	%f15, 481(%zero)
	fdiv	%f0, %f1, %f15
	floor	%f0, %f0
	fmul	%f0, %f0, %f15
	fsub	%f0, %f1, %f0
	fblt	%f0, %f14, fbgt_else.32177
	add	%a0, %zero, %zero
	j	fbgt_cont.32178
fbgt_else.32177:
	add	%a0, %zero, %k1
fbgt_cont.32178:
	fblt	%f0, %f14, fbgt_else.32179
	fsub	%f0, %f0, %f14
	j	fbgt_cont.32180
fbgt_else.32179:
fbgt_cont.32180:
	flw	%f16, 480(%zero)
	fblt	%f0, %f16, fbgt_else.32181
	beqi	%a0, 0, bnei_else.32183
	add	%a0, %zero, %zero
	j	fbgt_cont.32182
bnei_else.32183:
	add	%a0, %zero, %k1
bnei_cont.32184:
	j	fbgt_cont.32182
fbgt_else.32181:
fbgt_cont.32182:
	fblt	%f0, %f16, fbgt_else.32185
	fsub	%f0, %f14, %f0
	j	fbgt_cont.32186
fbgt_else.32185:
fbgt_cont.32186:
	flw	%f13, 479(%zero)
	fblt	%f13, %f0, fbgt_else.32187
	fmul	%f17, %f0, %f0
	fmul	%f11, %f17, %f17
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32188
fbgt_else.32187:
	fsub	%f18, %f16, %f0
	fmul	%f17, %f18, %f18
	fmul	%f11, %f17, %f17
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
fbgt_cont.32188:
	beqi	%a0, 0, bnei_else.32189
	j	bnei_cont.32190
bnei_else.32189:
	fneg	%f0, %f0
bnei_cont.32190:
	fblt	%f12, %fzero, fbgt_else.32191
	add	%a0, %zero, %k1
	j	fbgt_cont.32192
fbgt_else.32191:
	add	%a0, %zero, %zero
fbgt_cont.32192:
	fabs	%f11, %f12
	fdiv	%f1, %f11, %f15
	floor	%f1, %f1
	fmul	%f1, %f1, %f15
	fsub	%f1, %f11, %f1
	fblt	%f1, %f14, fbgt_else.32193
	beqi	%a0, 0, bnei_else.32195
	add	%a0, %zero, %zero
	j	fbgt_cont.32194
bnei_else.32195:
	add	%a0, %zero, %k1
bnei_cont.32196:
	j	fbgt_cont.32194
fbgt_else.32193:
fbgt_cont.32194:
	fblt	%f1, %f14, fbgt_else.32197
	fsub	%f1, %f1, %f14
	j	fbgt_cont.32198
fbgt_else.32197:
fbgt_cont.32198:
	fblt	%f1, %f16, fbgt_else.32199
	fsub	%f1, %f14, %f1
	j	fbgt_cont.32200
fbgt_else.32199:
fbgt_cont.32200:
	fblt	%f13, %f1, fbgt_else.32201
	fmul	%f18, %f1, %f1
	fmul	%f17, %f18, %f18
	flw	%f11, 478(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f18
	fsub	%f12, %f1, %f11
	flw	%f11, 477(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f17
	fadd	%f12, %f12, %f11
	flw	%f11, 476(%zero)
	fmul	%f1, %f11, %f1
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fsub	%f1, %f12, %f1
	j	fbgt_cont.32202
fbgt_else.32201:
	fsub	%f1, %f16, %f1
	fmul	%f17, %f1, %f1
	fmul	%f12, %f17, %f17
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f17
	fsub	%f11, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f17
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
fbgt_cont.32202:
	beqi	%a0, 0, bnei_else.32203
	j	bnei_cont.32204
bnei_else.32203:
	fneg	%f1, %f1
bnei_cont.32204:
	flw	%f17, 1(%s0)
	fabs	%f12, %f17
	fdiv	%f11, %f12, %f15
	floor	%f11, %f11
	fmul	%f11, %f11, %f15
	fsub	%f11, %f12, %f11
	fblt	%f11, %f14, fbgt_else.32205
	add	%a0, %zero, %zero
	j	fbgt_cont.32206
fbgt_else.32205:
	add	%a0, %zero, %k1
fbgt_cont.32206:
	fblt	%f11, %f14, fbgt_else.32207
	fsub	%f11, %f11, %f14
	j	fbgt_cont.32208
fbgt_else.32207:
fbgt_cont.32208:
	fblt	%f11, %f16, fbgt_else.32209
	beqi	%a0, 0, bnei_else.32211
	add	%a0, %zero, %zero
	j	fbgt_cont.32210
bnei_else.32211:
	add	%a0, %zero, %k1
bnei_cont.32212:
	j	fbgt_cont.32210
fbgt_else.32209:
fbgt_cont.32210:
	fblt	%f11, %f16, fbgt_else.32213
	fsub	%f11, %f14, %f11
	j	fbgt_cont.32214
fbgt_else.32213:
fbgt_cont.32214:
	fblt	%f13, %f11, fbgt_else.32215
	fmul	%f19, %f11, %f11
	fmul	%f18, %f19, %f19
	flw	%f11, 474(%zero)
	fmul	%f11, %f11, %f19
	fsub	%f12, %f30, %f11
	flw	%f11, 473(%zero)
	fmul	%f11, %f11, %f18
	fadd	%f12, %f12, %f11
	flw	%f11, 472(%zero)
	fmul	%f11, %f11, %f19
	fmul	%f11, %f11, %f18
	fsub	%f11, %f12, %f11
	j	fbgt_cont.32216
fbgt_else.32215:
	fsub	%f2, %f16, %f11
	fmul	%f19, %f2, %f2
	fmul	%f18, %f19, %f19
	flw	%f11, 478(%zero)
	fmul	%f11, %f11, %f2
	fmul	%f11, %f11, %f19
	fsub	%f12, %f2, %f11
	flw	%f11, 477(%zero)
	fmul	%f11, %f11, %f2
	fmul	%f11, %f11, %f18
	fadd	%f12, %f12, %f11
	flw	%f11, 476(%zero)
	fmul	%f11, %f11, %f2
	fmul	%f11, %f11, %f19
	fmul	%f11, %f11, %f18
	fsub	%f11, %f12, %f11
fbgt_cont.32216:
	beqi	%a0, 0, bnei_else.32217
	j	bnei_cont.32218
bnei_else.32217:
	fneg	%f11, %f11
bnei_cont.32218:
	fblt	%f17, %fzero, fbgt_else.32219
	add	%a0, %zero, %k1
	j	fbgt_cont.32220
fbgt_else.32219:
	add	%a0, %zero, %zero
fbgt_cont.32220:
	fabs	%f17, %f17
	fdiv	%f12, %f17, %f15
	floor	%f12, %f12
	fmul	%f12, %f12, %f15
	fsub	%f12, %f17, %f12
	fblt	%f12, %f14, fbgt_else.32221
	beqi	%a0, 0, bnei_else.32223
	add	%a0, %zero, %zero
	j	fbgt_cont.32222
bnei_else.32223:
	add	%a0, %zero, %k1
bnei_cont.32224:
	j	fbgt_cont.32222
fbgt_else.32221:
fbgt_cont.32222:
	fblt	%f12, %f14, fbgt_else.32225
	fsub	%f12, %f12, %f14
	j	fbgt_cont.32226
fbgt_else.32225:
fbgt_cont.32226:
	fblt	%f12, %f16, fbgt_else.32227
	fsub	%f12, %f14, %f12
	j	fbgt_cont.32228
fbgt_else.32227:
fbgt_cont.32228:
	fblt	%f13, %f12, fbgt_else.32229
	fmul	%f2, %f12, %f12
	fmul	%f19, %f2, %f2
	flw	%f17, 478(%zero)
	fmul	%f17, %f17, %f12
	fmul	%f17, %f17, %f2
	fsub	%f18, %f12, %f17
	flw	%f17, 477(%zero)
	fmul	%f17, %f17, %f12
	fmul	%f17, %f17, %f19
	fadd	%f18, %f18, %f17
	flw	%f17, 476(%zero)
	fmul	%f12, %f17, %f12
	fmul	%f12, %f12, %f2
	fmul	%f12, %f12, %f19
	fsub	%f12, %f18, %f12
	j	fbgt_cont.32230
fbgt_else.32229:
	fsub	%f12, %f16, %f12
	fmul	%f19, %f12, %f12
	fmul	%f18, %f19, %f19
	flw	%f12, 474(%zero)
	fmul	%f12, %f12, %f19
	fsub	%f17, %f30, %f12
	flw	%f12, 473(%zero)
	fmul	%f12, %f12, %f18
	fadd	%f17, %f17, %f12
	flw	%f12, 472(%zero)
	fmul	%f12, %f12, %f19
	fmul	%f12, %f12, %f18
	fsub	%f12, %f17, %f12
fbgt_cont.32230:
	beqi	%a0, 0, bnei_else.32231
	j	bnei_cont.32232
bnei_else.32231:
	fneg	%f12, %f12
bnei_cont.32232:
	flw	%f19, 2(%s0)
	fabs	%f18, %f19
	fdiv	%f17, %f18, %f15
	floor	%f17, %f17
	fmul	%f17, %f17, %f15
	fsub	%f17, %f18, %f17
	fblt	%f17, %f14, fbgt_else.32233
	add	%a0, %zero, %zero
	j	fbgt_cont.32234
fbgt_else.32233:
	add	%a0, %zero, %k1
fbgt_cont.32234:
	fblt	%f17, %f14, fbgt_else.32235
	fsub	%f17, %f17, %f14
	j	fbgt_cont.32236
fbgt_else.32235:
fbgt_cont.32236:
	fblt	%f17, %f16, fbgt_else.32237
	beqi	%a0, 0, bnei_else.32239
	add	%a0, %zero, %zero
	j	fbgt_cont.32238
bnei_else.32239:
	add	%a0, %zero, %k1
bnei_cont.32240:
	j	fbgt_cont.32238
fbgt_else.32237:
fbgt_cont.32238:
	fblt	%f17, %f16, fbgt_else.32241
	fsub	%f17, %f14, %f17
	j	fbgt_cont.32242
fbgt_else.32241:
fbgt_cont.32242:
	fblt	%f13, %f17, fbgt_else.32243
	fmul	%f20, %f17, %f17
	fmul	%f2, %f20, %f20
	flw	%f17, 474(%zero)
	fmul	%f17, %f17, %f20
	fsub	%f18, %f30, %f17
	flw	%f17, 473(%zero)
	fmul	%f17, %f17, %f2
	fadd	%f18, %f18, %f17
	flw	%f17, 472(%zero)
	fmul	%f17, %f17, %f20
	fmul	%f17, %f17, %f2
	fsub	%f17, %f18, %f17
	j	fbgt_cont.32244
fbgt_else.32243:
	fsub	%f21, %f16, %f17
	fmul	%f20, %f21, %f21
	fmul	%f2, %f20, %f20
	flw	%f17, 478(%zero)
	fmul	%f17, %f17, %f21
	fmul	%f17, %f17, %f20
	fsub	%f18, %f21, %f17
	flw	%f17, 477(%zero)
	fmul	%f17, %f17, %f21
	fmul	%f17, %f17, %f2
	fadd	%f18, %f18, %f17
	flw	%f17, 476(%zero)
	fmul	%f17, %f17, %f21
	fmul	%f17, %f17, %f20
	fmul	%f17, %f17, %f2
	fsub	%f17, %f18, %f17
fbgt_cont.32244:
	beqi	%a0, 0, bnei_else.32245
	j	bnei_cont.32246
bnei_else.32245:
	fneg	%f17, %f17
bnei_cont.32246:
	fblt	%f19, %fzero, fbgt_else.32247
	add	%a0, %zero, %k1
	j	fbgt_cont.32248
fbgt_else.32247:
	add	%a0, %zero, %zero
fbgt_cont.32248:
	fabs	%f19, %f19
	fdiv	%f18, %f19, %f15
	floor	%f18, %f18
	fmul	%f15, %f18, %f15
	fsub	%f15, %f19, %f15
	fblt	%f15, %f14, fbgt_else.32249
	beqi	%a0, 0, bnei_else.32251
	add	%a0, %zero, %zero
	j	fbgt_cont.32250
bnei_else.32251:
	add	%a0, %zero, %k1
bnei_cont.32252:
	j	fbgt_cont.32250
fbgt_else.32249:
fbgt_cont.32250:
	fblt	%f15, %f14, fbgt_else.32253
	fsub	%f15, %f15, %f14
	j	fbgt_cont.32254
fbgt_else.32253:
fbgt_cont.32254:
	fblt	%f15, %f16, fbgt_else.32255
	fsub	%f15, %f14, %f15
	j	fbgt_cont.32256
fbgt_else.32255:
fbgt_cont.32256:
	fblt	%f13, %f15, fbgt_else.32257
	fmul	%f18, %f15, %f15
	fmul	%f16, %f18, %f18
	flw	%f13, 478(%zero)
	fmul	%f13, %f13, %f15
	fmul	%f13, %f13, %f18
	fsub	%f14, %f15, %f13
	flw	%f13, 477(%zero)
	fmul	%f13, %f13, %f15
	fmul	%f13, %f13, %f16
	fadd	%f14, %f14, %f13
	flw	%f13, 476(%zero)
	fmul	%f13, %f13, %f15
	fmul	%f13, %f13, %f18
	fmul	%f13, %f13, %f16
	fsub	%f13, %f14, %f13
	j	fbgt_cont.32258
fbgt_else.32257:
	fsub	%f13, %f16, %f15
	fmul	%f16, %f13, %f13
	fmul	%f15, %f16, %f16
	flw	%f13, 474(%zero)
	fmul	%f13, %f13, %f16
	fsub	%f14, %f30, %f13
	flw	%f13, 473(%zero)
	fmul	%f13, %f13, %f15
	fadd	%f14, %f14, %f13
	flw	%f13, 472(%zero)
	fmul	%f13, %f13, %f16
	fmul	%f13, %f13, %f15
	fsub	%f13, %f14, %f13
fbgt_cont.32258:
	beqi	%a0, 0, bnei_else.32259
	j	bnei_cont.32260
bnei_else.32259:
	fneg	%f13, %f13
bnei_cont.32260:
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
	flw	%f13, 0(%s1)
	flw	%f12, 1(%s1)
	flw	%f11, 2(%s1)
	fmul	%f0, %f18, %f18
	fmul	%f1, %f13, %f0
	fmul	%f0, %f2, %f2
	fmul	%f0, %f12, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f20, %f20
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 0(%s1)
	fmul	%f0, %f16, %f16
	fmul	%f1, %f13, %f0
	fmul	%f0, %f15, %f15
	fmul	%f0, %f12, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f14, %f14
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 1(%s1)
	fmul	%f0, %f19, %f19
	fmul	%f1, %f13, %f0
	fmul	%f0, %f21, %f21
	fmul	%f0, %f12, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f22, %f22
	fmul	%f0, %f11, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%s1)
	flw	%f17, 470(%zero)
	fmul	%f0, %f13, %f16
	fmul	%f1, %f0, %f19
	fmul	%f0, %f12, %f15
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14
	fmul	%f0, %f0, %f22
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	fsw	%f0, 0(%s0)
	fmul	%f13, %f13, %f18
	fmul	%f1, %f13, %f19
	fmul	%f12, %f12, %f2
	fmul	%f0, %f12, %f21
	fadd	%f1, %f1, %f0
	fmul	%f11, %f11, %f20
	fmul	%f0, %f11, %f22
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	fsw	%f0, 1(%s0)
	fmul	%f1, %f13, %f16
	fmul	%f0, %f12, %f15
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	fsw	%f0, 2(%s0)
	j	bnei_cont.32176
bnei_else.32175:
bnei_cont.32176:
	add	%ra, %zero, %a1
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.32120:
	add	%ra, %zero, %a1
	add	%v0, %zero, %zero
	jr	%ra
read_object.2772:
	add	%a1, %zero, %v0
	add	%s7, %zero, %ra
	blti	%a1, 60, bgti_else.32377
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.32377:
	jal	min_caml_read_int
	addi	%a0, %v0, 0
	beqi	%a0, -1, bnei_else.32379
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	jal	min_caml_read_int
	addi	%a3, %v0, 0
	jal	min_caml_read_int
	addi	%fp, %v0, 0
	addi	%k0, %zero, 3
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s0, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s0)
	jal	min_caml_read_float
	fsw	%f0, 1(%s0)
	addi	%s3, %zero, 2
	jal	min_caml_read_float
	fsw	%f0, 2(%s0)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s1, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s1)
	jal	min_caml_read_float
	fsw	%f0, 1(%s1)
	jal	min_caml_read_float
	fsw	%f0, 2(%s1)
	jal	min_caml_read_float
	fblt	%f0, %fzero, fbgt_else.32381
	add	%s2, %zero, %zero
	j	fbgt_cont.32382
fbgt_else.32381:
	add	%s2, %zero, %k1
fbgt_cont.32382:
	addi	%v0, %s3, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s3, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s3)
	jal	min_caml_read_float
	fsw	%f0, 1(%s3)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s4, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s4)
	jal	min_caml_read_float
	fsw	%f0, 1(%s4)
	jal	min_caml_read_float
	fsw	%f0, 2(%s4)
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%k0, %v0, 0
	beqi	%fp, 0, bnei_else.32383
	jal	min_caml_read_float
	flw	%f1, 469(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%k0)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 1(%k0)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%k0)
	j	bnei_cont.32384
bnei_else.32383:
bnei_cont.32384:
	beqi	%a2, 2, bnei_else.32385
	add	%s5, %zero, %s2
	j	bnei_cont.32386
bnei_else.32385:
	add	%s5, %zero, %k1
bnei_cont.32386:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%ra)
	sw	%k0, 9(%ra)
	sw	%s4, 8(%ra)
	sw	%s3, 7(%ra)
	sw	%s5, 6(%ra)
	sw	%s1, 5(%ra)
	sw	%s0, 4(%ra)
	sw	%fp, 3(%ra)
	sw	%a3, 2(%ra)
	sw	%a2, 1(%ra)
	sw	%a0, 0(%ra)
	sw	%ra, 12(%a1)
	beqi	%a2, 3, bnei_else.32387
	beqi	%a2, 2, bnei_else.32389
	j	bnei_cont.32388
bnei_else.32389:
	beqi	%s2, 0, bnei_else.32391
	add	%a0, %zero, %zero
	j	bnei_cont.32392
bnei_else.32391:
	add	%a0, %zero, %k1
bnei_cont.32392:
	flw	%f13, 0(%s0)
	fmul	%f1, %f13, %f13
	flw	%f12, 1(%s0)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 2(%s0)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.32393
	add	%a2, %zero, %k1
	j	fbeq_cont.32394
fbeq_else.32393:
	add	%a2, %zero, %zero
fbeq_cont.32394:
	beqi	%a2, 0, bnei_else.32395
	fmov	%f0, %f30
	j	bnei_cont.32396
bnei_else.32395:
	beqi	%a0, 0, bnei_else.32397
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.32398
bnei_else.32397:
	fdiv	%f0, %f30, %f1
bnei_cont.32398:
bnei_cont.32396:
	fmul	%f1, %f13, %f0
	fsw	%f1, 0(%s0)
	fmul	%f1, %f12, %f0
	fsw	%f1, 1(%s0)
	fmul	%f0, %f11, %f0
	fsw	%f0, 2(%s0)
bnei_cont.32390:
	j	bnei_cont.32388
bnei_else.32387:
	flw	%f1, 0(%s0)
	fbne	%f1, %fzero, fbeq_else.32399
	add	%a0, %zero, %k1
	j	fbeq_cont.32400
fbeq_else.32399:
	add	%a0, %zero, %zero
fbeq_cont.32400:
	beqi	%a0, 0, bnei_else.32401
	fmov	%f0, %fzero
	j	bnei_cont.32402
bnei_else.32401:
	fbne	%f1, %fzero, fbeq_else.32403
	add	%a0, %zero, %k1
	j	fbeq_cont.32404
fbeq_else.32403:
	add	%a0, %zero, %zero
fbeq_cont.32404:
	beqi	%a0, 0, bnei_else.32405
	fmov	%f0, %fzero
	j	bnei_cont.32406
bnei_else.32405:
	fblt	%fzero, %f1, fbgt_else.32407
	add	%a0, %zero, %zero
	j	fbgt_cont.32408
fbgt_else.32407:
	add	%a0, %zero, %k1
fbgt_cont.32408:
	beqi	%a0, 0, bnei_else.32409
	fmov	%f0, %f30
	j	bnei_cont.32410
bnei_else.32409:
	flw	%f0, 468(%zero)
bnei_cont.32410:
bnei_cont.32406:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32402:
	fsw	%f0, 0(%s0)
	flw	%f1, 1(%s0)
	fbne	%f1, %fzero, fbeq_else.32411
	add	%a0, %zero, %k1
	j	fbeq_cont.32412
fbeq_else.32411:
	add	%a0, %zero, %zero
fbeq_cont.32412:
	beqi	%a0, 0, bnei_else.32413
	fmov	%f0, %fzero
	j	bnei_cont.32414
bnei_else.32413:
	fbne	%f1, %fzero, fbeq_else.32415
	add	%a0, %zero, %k1
	j	fbeq_cont.32416
fbeq_else.32415:
	add	%a0, %zero, %zero
fbeq_cont.32416:
	beqi	%a0, 0, bnei_else.32417
	fmov	%f0, %fzero
	j	bnei_cont.32418
bnei_else.32417:
	fblt	%fzero, %f1, fbgt_else.32419
	add	%a0, %zero, %zero
	j	fbgt_cont.32420
fbgt_else.32419:
	add	%a0, %zero, %k1
fbgt_cont.32420:
	beqi	%a0, 0, bnei_else.32421
	fmov	%f0, %f30
	j	bnei_cont.32422
bnei_else.32421:
	flw	%f0, 468(%zero)
bnei_cont.32422:
bnei_cont.32418:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32414:
	fsw	%f0, 1(%s0)
	flw	%f1, 2(%s0)
	fbne	%f1, %fzero, fbeq_else.32423
	add	%a0, %zero, %k1
	j	fbeq_cont.32424
fbeq_else.32423:
	add	%a0, %zero, %zero
fbeq_cont.32424:
	beqi	%a0, 0, bnei_else.32425
	fmov	%f0, %fzero
	j	bnei_cont.32426
bnei_else.32425:
	fbne	%f1, %fzero, fbeq_else.32427
	add	%a0, %zero, %k1
	j	fbeq_cont.32428
fbeq_else.32427:
	add	%a0, %zero, %zero
fbeq_cont.32428:
	beqi	%a0, 0, bnei_else.32429
	fmov	%f0, %fzero
	j	bnei_cont.32430
bnei_else.32429:
	fblt	%fzero, %f1, fbgt_else.32431
	add	%a0, %zero, %zero
	j	fbgt_cont.32432
fbgt_else.32431:
	add	%a0, %zero, %k1
fbgt_cont.32432:
	beqi	%a0, 0, bnei_else.32433
	fmov	%f0, %f30
	j	bnei_cont.32434
bnei_else.32433:
	flw	%f0, 468(%zero)
bnei_cont.32434:
bnei_cont.32430:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32426:
	fsw	%f0, 2(%s0)
bnei_cont.32388:
	beqi	%fp, 0, bnei_else.32435
	addi	%v1, %k0, 0
	addi	%v0, %s0, 0
	jal	rotate_quadratic_matrix.2767
	j	bnei_cont.32436
bnei_else.32435:
bnei_cont.32436:
	add	%a0, %zero, %k1
	j	bnei_cont.32380
bnei_else.32379:
	add	%a0, %zero, %zero
bnei_cont.32380:
	beqi	%a0, 0, bnei_else.32437
	addi	%t7, %a1, 1
	blti	%t7, 60, bgti_else.32438
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.32438:
	addi	%v0, %t7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.32440
	addi	%v0, %t7, 1
	add	%ra, %zero, %s7
	j	read_object.2772
bnei_else.32440:
	add	%ra, %zero, %s7
	sw	%t7, 0(%zero)
	jr	%ra
bnei_else.32437:
	add	%ra, %zero, %s7
	sw	%a1, 0(%zero)
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
	beqi	%t0, -1, bnei_else.32508
	lw	%a1, 0(%sp)
	addi	%t1, %a1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t2, %v0, 0
	beqi	%t2, -1, bnei_else.32509
	addi	%t3, %t1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t4, %v0, 0
	beqi	%t4, -1, bnei_else.32511
	addi	%t5, %t3, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t6, %v0, 0
	beqi	%t6, -1, bnei_else.32513
	addi	%v0, %t5, 1
	addi	%sp, %sp, 9
	jal	read_net_item.2776
	addi	%sp, %sp, -9
	add	%at, %v0, %t5
	sw	%t6, 0(%at)
	j	bnei_cont.32514
bnei_else.32513:
	addi	%v0, %t5, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.32514:
	add	%at, %v0, %t3
	sw	%t4, 0(%at)
	j	bnei_cont.32512
bnei_else.32511:
	addi	%v0, %t3, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.32512:
	add	%at, %v0, %t1
	sw	%t2, 0(%at)
	j	bnei_cont.32510
bnei_else.32509:
	addi	%v0, %t1, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.32510:
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
bnei_else.32508:
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
	beqi	%a2, -1, bnei_else.32585
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0
	beqi	%fp, -1, bnei_else.32587
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.32589
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	read_net_item.2776
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	sw	%k0, 2(%v1)
	j	bnei_cont.32590
bnei_else.32589:
	addi	%v0, %zero, 3
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.32590:
	sw	%fp, 1(%v1)
	j	bnei_cont.32588
bnei_else.32587:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.32588:
	sw	%a2, 0(%v1)
	j	bnei_cont.32586
bnei_else.32585:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.32586:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.32591
	lw	%a0, 0(%sp)
	addi	%t0, %a0, 1
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.32592
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%fp, %v0, 0
	beqi	%fp, -1, bnei_else.32594
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5
	jal	read_net_item.2776
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	sw	%fp, 1(%t1)
	j	bnei_cont.32595
bnei_else.32594:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.32595:
	sw	%a2, 0(%t1)
	j	bnei_cont.32593
bnei_else.32592:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.32593:
	lw	%a0, 0(%t1)
	beqi	%a0, -1, bnei_else.32596
	addi	%v0, %t0, 1
	addi	%sp, %sp, 5
	jal	read_or_network.2778
	addi	%sp, %sp, -5
	add	%at, %v0, %t0
	sw	%t1, 0(%at)
	j	bnei_cont.32597
bnei_else.32596:
	addi	%v0, %t0, 1
	addi	%v1, %t1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
bnei_cont.32597:
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%a1, 0(%at)
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.32591:
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
	beqi	%fp, -1, bnei_else.32645
	jal	min_caml_read_int
	addi	%s0, %v0, 0
	beqi	%s0, -1, bnei_else.32647
	jal	min_caml_read_int
	addi	%s1, %v0, 0
	beqi	%s1, -1, bnei_else.32649
	addi	%v0, %zero, 3
	jal	read_net_item.2776
	sw	%s1, 2(%v0)
	j	bnei_cont.32650
bnei_else.32649:
	addi	%v0, %zero, 3
	addi	%v1, %k0, 0
	jal	min_caml_create_array
bnei_cont.32650:
	sw	%s0, 1(%v0)
	j	bnei_cont.32648
bnei_else.32647:
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0
	jal	min_caml_create_array
bnei_cont.32648:
	sw	%fp, 0(%v0)
	j	bnei_cont.32646
bnei_else.32645:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.32646:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.32651
	sw	%v0, 83(%a2)
	addi	%s0, %a2, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.32652
	jal	min_caml_read_int
	addi	%fp, %v0, 0
	beqi	%fp, -1, bnei_else.32654
	addi	%v0, %zero, 2
	jal	read_net_item.2776
	sw	%fp, 1(%v0)
	j	bnei_cont.32655
bnei_else.32654:
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0
	jal	min_caml_create_array
bnei_cont.32655:
	sw	%a2, 0(%v0)
	j	bnei_cont.32653
bnei_else.32652:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.32653:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.32656
	sw	%v0, 83(%s0)
	addi	%fp, %s0, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.32657
	addi	%v0, %k1, 0
	jal	read_net_item.2776
	sw	%a2, 0(%v0)
	j	bnei_cont.32658
bnei_else.32657:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.32658:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.32659
	sw	%v0, 83(%fp)
	addi	%a2, %fp, 1
	addi	%v0, %zero, 0
	jal	read_net_item.2776
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.32660
	sw	%v0, 83(%a2)
	addi	%v0, %a2, 1
	add	%ra, %zero, %a3
	j	read_and_network.2780
bnei_else.32660:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.32659:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.32656:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.32651:
	add	%ra, %zero, %a3
	jr	%ra
iter_setup_dirvec_constants.2877:
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1
	add	%a2, %zero, %ra
	blti	%a1, 0, bgti_else.32842
	lw	%a3, 12(%a1)
	lw	%k0, 1(%a0)
	lw	%fp, 0(%a0)
	lw	%s2, 9(%a3)
	lw	%s1, 6(%a3)
	lw	%s0, 4(%a3)
	lw	%s3, 3(%a3)
	lw	%a3, 1(%a3)
	beqi	%a3, 1, bnei_else.32843
	beqi	%a3, 2, bnei_else.32845
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
	beqi	%s3, 0, bnei_else.32847
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
	j	bnei_cont.32848
bnei_else.32847:
bnei_cont.32848:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s3, 0, bnei_else.32849
	flw	%f15, 1(%s2)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s2)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 474(%zero)
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
	j	bnei_cont.32850
bnei_else.32849:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.32850:
	fbne	%f0, %fzero, fbeq_else.32851
	add	%a3, %zero, %k1
	j	fbeq_cont.32852
fbeq_else.32851:
	add	%a3, %zero, %zero
fbeq_cont.32852:
	beqi	%a3, 0, bnei_else.32853
	j	bnei_cont.32854
bnei_else.32853:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.32854:
	add	%at, %k0, %a1
	sw	%v0, 0(%at)
	j	bnei_cont.32844
bnei_else.32845:
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
	fblt	%fzero, %f1, fbgt_else.32855
	add	%a3, %zero, %zero
	j	fbgt_cont.32856
fbgt_else.32855:
	add	%a3, %zero, %k1
fbgt_cont.32856:
	beqi	%a3, 0, bnei_else.32857
	flw	%f0, 468(%zero)
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
	j	bnei_cont.32858
bnei_else.32857:
	fsw	%fzero, 0(%v0)
bnei_cont.32858:
	add	%at, %k0, %a1
	sw	%v0, 0(%at)
bnei_cont.32846:
	j	bnei_cont.32844
bnei_else.32843:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%fp)
	fbne	%f1, %fzero, fbeq_else.32859
	add	%a3, %zero, %k1
	j	fbeq_cont.32860
fbeq_else.32859:
	add	%a3, %zero, %zero
fbeq_cont.32860:
	beqi	%a3, 0, bnei_else.32861
	fsw	%fzero, 1(%v0)
	j	bnei_cont.32862
bnei_else.32861:
	fblt	%f1, %fzero, fbgt_else.32863
	add	%a3, %zero, %zero
	j	fbgt_cont.32864
fbgt_else.32863:
	add	%a3, %zero, %k1
fbgt_cont.32864:
	beqi	%s1, 0, bnei_else.32865
	beqi	%a3, 0, bnei_else.32867
	add	%a3, %zero, %zero
	j	bnei_cont.32866
bnei_else.32867:
	add	%a3, %zero, %k1
bnei_cont.32868:
	j	bnei_cont.32866
bnei_else.32865:
bnei_cont.32866:
	flw	%f0, 0(%s0)
	beqi	%a3, 0, bnei_else.32869
	j	bnei_cont.32870
bnei_else.32869:
	fneg	%f0, %f0
bnei_cont.32870:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.32862:
	flw	%f1, 1(%fp)
	fbne	%f1, %fzero, fbeq_else.32871
	add	%a3, %zero, %k1
	j	fbeq_cont.32872
fbeq_else.32871:
	add	%a3, %zero, %zero
fbeq_cont.32872:
	beqi	%a3, 0, bnei_else.32873
	fsw	%fzero, 3(%v0)
	j	bnei_cont.32874
bnei_else.32873:
	fblt	%f1, %fzero, fbgt_else.32875
	add	%a3, %zero, %zero
	j	fbgt_cont.32876
fbgt_else.32875:
	add	%a3, %zero, %k1
fbgt_cont.32876:
	beqi	%s1, 0, bnei_else.32877
	beqi	%a3, 0, bnei_else.32879
	add	%a3, %zero, %zero
	j	bnei_cont.32878
bnei_else.32879:
	add	%a3, %zero, %k1
bnei_cont.32880:
	j	bnei_cont.32878
bnei_else.32877:
bnei_cont.32878:
	flw	%f0, 1(%s0)
	beqi	%a3, 0, bnei_else.32881
	j	bnei_cont.32882
bnei_else.32881:
	fneg	%f0, %f0
bnei_cont.32882:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.32874:
	flw	%f1, 2(%fp)
	fbne	%f1, %fzero, fbeq_else.32883
	add	%a3, %zero, %k1
	j	fbeq_cont.32884
fbeq_else.32883:
	add	%a3, %zero, %zero
fbeq_cont.32884:
	beqi	%a3, 0, bnei_else.32885
	fsw	%fzero, 5(%v0)
	j	bnei_cont.32886
bnei_else.32885:
	fblt	%f1, %fzero, fbgt_else.32887
	add	%a3, %zero, %zero
	j	fbgt_cont.32888
fbgt_else.32887:
	add	%a3, %zero, %k1
fbgt_cont.32888:
	beqi	%s1, 0, bnei_else.32889
	beqi	%a3, 0, bnei_else.32891
	add	%a3, %zero, %zero
	j	bnei_cont.32890
bnei_else.32891:
	add	%a3, %zero, %k1
bnei_cont.32892:
	j	bnei_cont.32890
bnei_else.32889:
bnei_cont.32890:
	flw	%f0, 2(%s0)
	beqi	%a3, 0, bnei_else.32893
	j	bnei_cont.32894
bnei_else.32893:
	fneg	%f0, %f0
bnei_cont.32894:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.32886:
	add	%at, %k0, %a1
	sw	%v0, 0(%at)
bnei_cont.32844:
	addi	%a3, %a1, -1
	blti	%a3, 0, bgti_else.32895
	lw	%a1, 12(%a3)
	lw	%s2, 9(%a1)
	lw	%s1, 6(%a1)
	lw	%s0, 4(%a1)
	lw	%s3, 3(%a1)
	lw	%a1, 1(%a1)
	beqi	%a1, 1, bnei_else.32896
	beqi	%a1, 2, bnei_else.32898
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
	beqi	%s3, 0, bnei_else.32900
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
	j	bnei_cont.32901
bnei_else.32900:
bnei_cont.32901:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s3, 0, bnei_else.32902
	flw	%f15, 1(%s2)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s2)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 474(%zero)
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
	j	bnei_cont.32903
bnei_else.32902:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.32903:
	fbne	%f0, %fzero, fbeq_else.32904
	add	%a1, %zero, %k1
	j	fbeq_cont.32905
fbeq_else.32904:
	add	%a1, %zero, %zero
fbeq_cont.32905:
	beqi	%a1, 0, bnei_else.32906
	j	bnei_cont.32907
bnei_else.32906:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.32907:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.32897
bnei_else.32898:
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
	fblt	%fzero, %f1, fbgt_else.32908
	add	%a1, %zero, %zero
	j	fbgt_cont.32909
fbgt_else.32908:
	add	%a1, %zero, %k1
fbgt_cont.32909:
	beqi	%a1, 0, bnei_else.32910
	flw	%f0, 468(%zero)
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
	j	bnei_cont.32911
bnei_else.32910:
	fsw	%fzero, 0(%v0)
bnei_cont.32911:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
bnei_cont.32899:
	j	bnei_cont.32897
bnei_else.32896:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%fp)
	fbne	%f1, %fzero, fbeq_else.32912
	add	%a1, %zero, %k1
	j	fbeq_cont.32913
fbeq_else.32912:
	add	%a1, %zero, %zero
fbeq_cont.32913:
	beqi	%a1, 0, bnei_else.32914
	fsw	%fzero, 1(%v0)
	j	bnei_cont.32915
bnei_else.32914:
	fblt	%f1, %fzero, fbgt_else.32916
	add	%a1, %zero, %zero
	j	fbgt_cont.32917
fbgt_else.32916:
	add	%a1, %zero, %k1
fbgt_cont.32917:
	beqi	%s1, 0, bnei_else.32918
	beqi	%a1, 0, bnei_else.32920
	add	%a1, %zero, %zero
	j	bnei_cont.32919
bnei_else.32920:
	add	%a1, %zero, %k1
bnei_cont.32921:
	j	bnei_cont.32919
bnei_else.32918:
bnei_cont.32919:
	flw	%f0, 0(%s0)
	beqi	%a1, 0, bnei_else.32922
	j	bnei_cont.32923
bnei_else.32922:
	fneg	%f0, %f0
bnei_cont.32923:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.32915:
	flw	%f1, 1(%fp)
	fbne	%f1, %fzero, fbeq_else.32924
	add	%a1, %zero, %k1
	j	fbeq_cont.32925
fbeq_else.32924:
	add	%a1, %zero, %zero
fbeq_cont.32925:
	beqi	%a1, 0, bnei_else.32926
	fsw	%fzero, 3(%v0)
	j	bnei_cont.32927
bnei_else.32926:
	fblt	%f1, %fzero, fbgt_else.32928
	add	%a1, %zero, %zero
	j	fbgt_cont.32929
fbgt_else.32928:
	add	%a1, %zero, %k1
fbgt_cont.32929:
	beqi	%s1, 0, bnei_else.32930
	beqi	%a1, 0, bnei_else.32932
	add	%a1, %zero, %zero
	j	bnei_cont.32931
bnei_else.32932:
	add	%a1, %zero, %k1
bnei_cont.32933:
	j	bnei_cont.32931
bnei_else.32930:
bnei_cont.32931:
	flw	%f0, 1(%s0)
	beqi	%a1, 0, bnei_else.32934
	j	bnei_cont.32935
bnei_else.32934:
	fneg	%f0, %f0
bnei_cont.32935:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.32927:
	flw	%f1, 2(%fp)
	fbne	%f1, %fzero, fbeq_else.32936
	add	%a1, %zero, %k1
	j	fbeq_cont.32937
fbeq_else.32936:
	add	%a1, %zero, %zero
fbeq_cont.32937:
	beqi	%a1, 0, bnei_else.32938
	fsw	%fzero, 5(%v0)
	j	bnei_cont.32939
bnei_else.32938:
	fblt	%f1, %fzero, fbgt_else.32940
	add	%a1, %zero, %zero
	j	fbgt_cont.32941
fbgt_else.32940:
	add	%a1, %zero, %k1
fbgt_cont.32941:
	beqi	%s1, 0, bnei_else.32942
	beqi	%a1, 0, bnei_else.32944
	add	%a1, %zero, %zero
	j	bnei_cont.32943
bnei_else.32944:
	add	%a1, %zero, %k1
bnei_cont.32945:
	j	bnei_cont.32943
bnei_else.32942:
bnei_cont.32943:
	flw	%f0, 2(%s0)
	beqi	%a1, 0, bnei_else.32946
	j	bnei_cont.32947
bnei_else.32946:
	fneg	%f0, %f0
bnei_cont.32947:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.32939:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
bnei_cont.32897:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a2
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877
bgti_else.32895:
	add	%ra, %zero, %a2
	jr	%ra
bgti_else.32842:
	add	%ra, %zero, %a2
	jr	%ra
setup_dirvec_constants.2880:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	lw	%a2, 0(%zero)
	addi	%a3, %a2, -1
	blti	%a3, 0, bgti_else.33045
	lw	%a2, 12(%a3)
	lw	%fp, 1(%a0)
	lw	%s0, 0(%a0)
	lw	%s2, 9(%a2)
	lw	%s1, 6(%a2)
	lw	%k0, 4(%a2)
	lw	%s3, 3(%a2)
	lw	%a2, 1(%a2)
	beqi	%a2, 1, bnei_else.33046
	beqi	%a2, 2, bnei_else.33048
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
	beqi	%s3, 0, bnei_else.33050
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
	j	bnei_cont.33051
bnei_else.33050:
bnei_cont.33051:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s3, 0, bnei_else.33052
	flw	%f15, 1(%s2)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s2)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 474(%zero)
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
	j	bnei_cont.33053
bnei_else.33052:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.33053:
	fbne	%f0, %fzero, fbeq_else.33054
	add	%a2, %zero, %k1
	j	fbeq_cont.33055
fbeq_else.33054:
	add	%a2, %zero, %zero
fbeq_cont.33055:
	beqi	%a2, 0, bnei_else.33056
	j	bnei_cont.33057
bnei_else.33056:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.33057:
	add	%at, %fp, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.33047
bnei_else.33048:
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
	fblt	%fzero, %f1, fbgt_else.33058
	add	%a2, %zero, %zero
	j	fbgt_cont.33059
fbgt_else.33058:
	add	%a2, %zero, %k1
fbgt_cont.33059:
	beqi	%a2, 0, bnei_else.33060
	flw	%f0, 468(%zero)
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
	j	bnei_cont.33061
bnei_else.33060:
	fsw	%fzero, 0(%v0)
bnei_cont.33061:
	add	%at, %fp, %a3
	sw	%v0, 0(%at)
bnei_cont.33049:
	j	bnei_cont.33047
bnei_else.33046:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%s0)
	fbne	%f1, %fzero, fbeq_else.33062
	add	%a2, %zero, %k1
	j	fbeq_cont.33063
fbeq_else.33062:
	add	%a2, %zero, %zero
fbeq_cont.33063:
	beqi	%a2, 0, bnei_else.33064
	fsw	%fzero, 1(%v0)
	j	bnei_cont.33065
bnei_else.33064:
	fblt	%f1, %fzero, fbgt_else.33066
	add	%a2, %zero, %zero
	j	fbgt_cont.33067
fbgt_else.33066:
	add	%a2, %zero, %k1
fbgt_cont.33067:
	beqi	%s1, 0, bnei_else.33068
	beqi	%a2, 0, bnei_else.33070
	add	%a2, %zero, %zero
	j	bnei_cont.33069
bnei_else.33070:
	add	%a2, %zero, %k1
bnei_cont.33071:
	j	bnei_cont.33069
bnei_else.33068:
bnei_cont.33069:
	flw	%f0, 0(%k0)
	beqi	%a2, 0, bnei_else.33072
	j	bnei_cont.33073
bnei_else.33072:
	fneg	%f0, %f0
bnei_cont.33073:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.33065:
	flw	%f1, 1(%s0)
	fbne	%f1, %fzero, fbeq_else.33074
	add	%a2, %zero, %k1
	j	fbeq_cont.33075
fbeq_else.33074:
	add	%a2, %zero, %zero
fbeq_cont.33075:
	beqi	%a2, 0, bnei_else.33076
	fsw	%fzero, 3(%v0)
	j	bnei_cont.33077
bnei_else.33076:
	fblt	%f1, %fzero, fbgt_else.33078
	add	%a2, %zero, %zero
	j	fbgt_cont.33079
fbgt_else.33078:
	add	%a2, %zero, %k1
fbgt_cont.33079:
	beqi	%s1, 0, bnei_else.33080
	beqi	%a2, 0, bnei_else.33082
	add	%a2, %zero, %zero
	j	bnei_cont.33081
bnei_else.33082:
	add	%a2, %zero, %k1
bnei_cont.33083:
	j	bnei_cont.33081
bnei_else.33080:
bnei_cont.33081:
	flw	%f0, 1(%k0)
	beqi	%a2, 0, bnei_else.33084
	j	bnei_cont.33085
bnei_else.33084:
	fneg	%f0, %f0
bnei_cont.33085:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.33077:
	flw	%f1, 2(%s0)
	fbne	%f1, %fzero, fbeq_else.33086
	add	%a2, %zero, %k1
	j	fbeq_cont.33087
fbeq_else.33086:
	add	%a2, %zero, %zero
fbeq_cont.33087:
	beqi	%a2, 0, bnei_else.33088
	fsw	%fzero, 5(%v0)
	j	bnei_cont.33089
bnei_else.33088:
	fblt	%f1, %fzero, fbgt_else.33090
	add	%a2, %zero, %zero
	j	fbgt_cont.33091
fbgt_else.33090:
	add	%a2, %zero, %k1
fbgt_cont.33091:
	beqi	%s1, 0, bnei_else.33092
	beqi	%a2, 0, bnei_else.33094
	add	%a2, %zero, %zero
	j	bnei_cont.33093
bnei_else.33094:
	add	%a2, %zero, %k1
bnei_cont.33095:
	j	bnei_cont.33093
bnei_else.33092:
bnei_cont.33093:
	flw	%f0, 2(%k0)
	beqi	%a2, 0, bnei_else.33096
	j	bnei_cont.33097
bnei_else.33096:
	fneg	%f0, %f0
bnei_cont.33097:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.33089:
	add	%at, %fp, %a3
	sw	%v0, 0(%at)
bnei_cont.33047:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a1
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877
bgti_else.33045:
	add	%ra, %zero, %a1
	jr	%ra
setup_startp_constants.2882:
	blti	%v1, 0, bgti_else.33128
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
	beqi	%a1, 2, bnei_else.33129
	addi	%at, %zero, 2
	blt	%at, %a1, bgt_else.33131
	j	bnei_cont.33130
bgt_else.33131:
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
	beqi	%a3, 0, bnei_else.33133
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
	j	bnei_cont.33134
bnei_else.33133:
bnei_cont.33134:
	beqi	%a1, 3, bnei_else.33135
	j	bnei_cont.33136
bnei_else.33135:
	fsub	%f0, %f0, %f30
bnei_cont.33136:
	fsw	%f0, 3(%k0)
bgt_cont.33132:
	j	bnei_cont.33130
bnei_else.33129:
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
bnei_cont.33130:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2882
bgti_else.33128:
	jr	%ra
check_all_inside.2907:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33277
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
	beqi	%a2, 1, bnei_else.33278
	beqi	%a2, 2, bnei_else.33280
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
	beqi	%fp, 0, bnei_else.33282
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
	j	bnei_cont.33283
bnei_else.33282:
bnei_cont.33283:
	beqi	%a2, 3, bnei_else.33284
	j	bnei_cont.33285
bnei_else.33284:
	fsub	%f11, %f11, %f30
bnei_cont.33285:
	fblt	%f11, %fzero, fbgt_else.33286
	add	%a0, %zero, %zero
	j	fbgt_cont.33287
fbgt_else.33286:
	add	%a0, %zero, %k1
fbgt_cont.33287:
	beqi	%a1, 0, bnei_else.33288
	beqi	%a0, 0, bnei_else.33290
	add	%a0, %zero, %zero
	j	bnei_cont.33289
bnei_else.33290:
	add	%a0, %zero, %k1
bnei_cont.33291:
	j	bnei_cont.33289
bnei_else.33288:
bnei_cont.33289:
	beqi	%a0, 0, bnei_else.33292
	add	%a1, %zero, %zero
	j	bnei_cont.33279
bnei_else.33292:
	add	%a1, %zero, %k1
bnei_cont.33293:
	j	bnei_cont.33279
bnei_else.33280:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.33294
	add	%a0, %zero, %zero
	j	fbgt_cont.33295
fbgt_else.33294:
	add	%a0, %zero, %k1
fbgt_cont.33295:
	beqi	%a1, 0, bnei_else.33296
	beqi	%a0, 0, bnei_else.33298
	add	%a0, %zero, %zero
	j	bnei_cont.33297
bnei_else.33298:
	add	%a0, %zero, %k1
bnei_cont.33299:
	j	bnei_cont.33297
bnei_else.33296:
bnei_cont.33297:
	beqi	%a0, 0, bnei_else.33300
	add	%a1, %zero, %zero
	j	bnei_cont.33279
bnei_else.33300:
	add	%a1, %zero, %k1
bnei_cont.33301:
bnei_cont.33281:
	j	bnei_cont.33279
bnei_else.33278:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.33302
	add	%a0, %zero, %zero
	j	fbgt_cont.33303
fbgt_else.33302:
	add	%a0, %zero, %k1
fbgt_cont.33303:
	beqi	%a0, 0, bnei_else.33304
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.33306
	add	%a0, %zero, %zero
	j	fbgt_cont.33307
fbgt_else.33306:
	add	%a0, %zero, %k1
fbgt_cont.33307:
	beqi	%a0, 0, bnei_else.33308
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.33310
	add	%a0, %zero, %zero
	j	bnei_cont.33305
fbgt_else.33310:
	add	%a0, %zero, %k1
fbgt_cont.33311:
	j	bnei_cont.33305
bnei_else.33308:
	add	%a0, %zero, %zero
bnei_cont.33309:
	j	bnei_cont.33305
bnei_else.33304:
	add	%a0, %zero, %zero
bnei_cont.33305:
	beqi	%a0, 0, bnei_else.33312
	j	bnei_cont.33313
bnei_else.33312:
	beqi	%a1, 0, bnei_else.33314
	add	%a1, %zero, %zero
	j	bnei_cont.33315
bnei_else.33314:
	add	%a1, %zero, %k1
bnei_cont.33315:
bnei_cont.33313:
bnei_cont.33279:
	beqi	%a1, 0, bnei_else.33316
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33316:
	addi	%s0, %v0, 1
	add	%at, %v1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33317
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
	beqi	%a2, 1, bnei_else.33318
	beqi	%a2, 2, bnei_else.33320
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
	beqi	%fp, 0, bnei_else.33322
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
	j	bnei_cont.33323
bnei_else.33322:
bnei_cont.33323:
	beqi	%a2, 3, bnei_else.33324
	j	bnei_cont.33325
bnei_else.33324:
	fsub	%f11, %f11, %f30
bnei_cont.33325:
	fblt	%f11, %fzero, fbgt_else.33326
	add	%a0, %zero, %zero
	j	fbgt_cont.33327
fbgt_else.33326:
	add	%a0, %zero, %k1
fbgt_cont.33327:
	beqi	%a1, 0, bnei_else.33328
	beqi	%a0, 0, bnei_else.33330
	add	%a0, %zero, %zero
	j	bnei_cont.33329
bnei_else.33330:
	add	%a0, %zero, %k1
bnei_cont.33331:
	j	bnei_cont.33329
bnei_else.33328:
bnei_cont.33329:
	beqi	%a0, 0, bnei_else.33332
	add	%a1, %zero, %zero
	j	bnei_cont.33319
bnei_else.33332:
	add	%a1, %zero, %k1
bnei_cont.33333:
	j	bnei_cont.33319
bnei_else.33320:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.33334
	add	%a0, %zero, %zero
	j	fbgt_cont.33335
fbgt_else.33334:
	add	%a0, %zero, %k1
fbgt_cont.33335:
	beqi	%a1, 0, bnei_else.33336
	beqi	%a0, 0, bnei_else.33338
	add	%a0, %zero, %zero
	j	bnei_cont.33337
bnei_else.33338:
	add	%a0, %zero, %k1
bnei_cont.33339:
	j	bnei_cont.33337
bnei_else.33336:
bnei_cont.33337:
	beqi	%a0, 0, bnei_else.33340
	add	%a1, %zero, %zero
	j	bnei_cont.33319
bnei_else.33340:
	add	%a1, %zero, %k1
bnei_cont.33341:
bnei_cont.33321:
	j	bnei_cont.33319
bnei_else.33318:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.33342
	add	%a0, %zero, %zero
	j	fbgt_cont.33343
fbgt_else.33342:
	add	%a0, %zero, %k1
fbgt_cont.33343:
	beqi	%a0, 0, bnei_else.33344
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.33346
	add	%a0, %zero, %zero
	j	fbgt_cont.33347
fbgt_else.33346:
	add	%a0, %zero, %k1
fbgt_cont.33347:
	beqi	%a0, 0, bnei_else.33348
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.33350
	add	%a0, %zero, %zero
	j	bnei_cont.33345
fbgt_else.33350:
	add	%a0, %zero, %k1
fbgt_cont.33351:
	j	bnei_cont.33345
bnei_else.33348:
	add	%a0, %zero, %zero
bnei_cont.33349:
	j	bnei_cont.33345
bnei_else.33344:
	add	%a0, %zero, %zero
bnei_cont.33345:
	beqi	%a0, 0, bnei_else.33352
	j	bnei_cont.33353
bnei_else.33352:
	beqi	%a1, 0, bnei_else.33354
	add	%a1, %zero, %zero
	j	bnei_cont.33355
bnei_else.33354:
	add	%a1, %zero, %k1
bnei_cont.33355:
bnei_cont.33353:
bnei_cont.33319:
	beqi	%a1, 0, bnei_else.33356
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33356:
	addi	%a0, %s0, 1
	addi	%v0, %a0, 0
	j	check_all_inside.2907
bnei_else.33317:
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33277:
	add	%v0, %zero, %k1
	jr	%ra
shadow_check_and_group.2913:
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra
	add	%at, %v1, %s1
	lw	%ra, 0(%at)
	beqi	%ra, -1, bnei_else.33547
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
	beqi	%a2, 1, bnei_else.33548
	beqi	%a2, 2, bnei_else.33550
	flw	%f16, 0(%ra)
	fbne	%f16, %fzero, fbeq_else.33552
	add	%a0, %zero, %k1
	j	fbeq_cont.33553
fbeq_else.33552:
	add	%a0, %zero, %zero
fbeq_cont.33553:
	beqi	%a0, 0, bnei_else.33554
	add	%a0, %zero, %zero
	j	bnei_cont.33549
bnei_else.33554:
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
	beqi	%fp, 0, bnei_else.33556
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
	j	bnei_cont.33557
bnei_else.33556:
bnei_cont.33557:
	beqi	%a2, 3, bnei_else.33558
	j	bnei_cont.33559
bnei_else.33558:
	fsub	%f0, %f0, %f30
bnei_cont.33559:
	fmul	%f1, %f15, %f15
	fmul	%f0, %f16, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.33560
	add	%a0, %zero, %zero
	j	fbgt_cont.33561
fbgt_else.33560:
	add	%a0, %zero, %k1
fbgt_cont.33561:
	beqi	%a0, 0, bnei_else.33562
	beqi	%a1, 0, bnei_else.33564
	fsqrt	%f0, %f0
	fadd	%f1, %f15, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.33565
bnei_else.33564:
	fsqrt	%f0, %f0
	fsub	%f1, %f15, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.33565:
	add	%a0, %zero, %k1
	j	bnei_cont.33549
bnei_else.33562:
	add	%a0, %zero, %zero
bnei_cont.33563:
bnei_cont.33555:
	j	bnei_cont.33549
bnei_else.33550:
	flw	%f0, 0(%ra)
	fblt	%f0, %fzero, fbgt_else.33566
	add	%a0, %zero, %zero
	j	fbgt_cont.33567
fbgt_else.33566:
	add	%a0, %zero, %k1
fbgt_cont.33567:
	beqi	%a0, 0, bnei_else.33568
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
	j	bnei_cont.33549
bnei_else.33568:
	add	%a0, %zero, %zero
bnei_cont.33569:
bnei_cont.33551:
	j	bnei_cont.33549
bnei_else.33548:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f17
	flw	%f2, 1(%ra)
	fmul	%f16, %f0, %f2
	flw	%f15, 185(%zero)
	fmul	%f0, %f16, %f15
	fadd	%f0, %f0, %f18
	fabs	%f0, %f0
	flw	%f12, 1(%k0)
	fblt	%f0, %f12, fbgt_else.33570
	add	%a0, %zero, %zero
	j	fbgt_cont.33571
fbgt_else.33570:
	add	%a0, %zero, %k1
fbgt_cont.33571:
	beqi	%a0, 0, bnei_else.33572
	flw	%f0, 186(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.33574
	add	%a0, %zero, %zero
	j	fbgt_cont.33575
fbgt_else.33574:
	add	%a0, %zero, %k1
fbgt_cont.33575:
	beqi	%a0, 0, bnei_else.33576
	fbne	%f2, %fzero, fbeq_else.33578
	add	%a0, %zero, %k1
	j	fbeq_cont.33579
fbeq_else.33578:
	add	%a0, %zero, %zero
fbeq_cont.33579:
	beqi	%a0, 0, bnei_else.33580
	add	%a0, %zero, %zero
	j	bnei_cont.33573
bnei_else.33580:
	add	%a0, %zero, %k1
bnei_cont.33581:
	j	bnei_cont.33573
bnei_else.33576:
	add	%a0, %zero, %zero
bnei_cont.33577:
	j	bnei_cont.33573
bnei_else.33572:
	add	%a0, %zero, %zero
bnei_cont.33573:
	beqi	%a0, 0, bnei_else.33582
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.33583
bnei_else.33582:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f18
	flw	%f21, 3(%ra)
	fmul	%f16, %f0, %f21
	flw	%f20, 184(%zero)
	fmul	%f0, %f16, %f20
	fadd	%f0, %f0, %f17
	fabs	%f0, %f0
	flw	%f2, 0(%k0)
	fblt	%f0, %f2, fbgt_else.33584
	add	%a0, %zero, %zero
	j	fbgt_cont.33585
fbgt_else.33584:
	add	%a0, %zero, %k1
fbgt_cont.33585:
	beqi	%a0, 0, bnei_else.33586
	flw	%f0, 186(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.33588
	add	%a0, %zero, %zero
	j	fbgt_cont.33589
fbgt_else.33588:
	add	%a0, %zero, %k1
fbgt_cont.33589:
	beqi	%a0, 0, bnei_else.33590
	fbne	%f21, %fzero, fbeq_else.33592
	add	%a0, %zero, %k1
	j	fbeq_cont.33593
fbeq_else.33592:
	add	%a0, %zero, %zero
fbeq_cont.33593:
	beqi	%a0, 0, bnei_else.33594
	add	%a0, %zero, %zero
	j	bnei_cont.33587
bnei_else.33594:
	add	%a0, %zero, %k1
bnei_cont.33595:
	j	bnei_cont.33587
bnei_else.33590:
	add	%a0, %zero, %zero
bnei_cont.33591:
	j	bnei_cont.33587
bnei_else.33586:
	add	%a0, %zero, %zero
bnei_cont.33587:
	beqi	%a0, 0, bnei_else.33596
	fsw	%f16, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.33597
bnei_else.33596:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f19
	flw	%f16, 5(%ra)
	fmul	%f1, %f0, %f16
	fmul	%f0, %f1, %f20
	fadd	%f0, %f0, %f17
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.33598
	add	%a0, %zero, %zero
	j	fbgt_cont.33599
fbgt_else.33598:
	add	%a0, %zero, %k1
fbgt_cont.33599:
	beqi	%a0, 0, bnei_else.33600
	fmul	%f0, %f1, %f15
	fadd	%f0, %f0, %f18
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.33602
	add	%a0, %zero, %zero
	j	fbgt_cont.33603
fbgt_else.33602:
	add	%a0, %zero, %k1
fbgt_cont.33603:
	beqi	%a0, 0, bnei_else.33604
	fbne	%f16, %fzero, fbeq_else.33606
	add	%a0, %zero, %k1
	j	fbeq_cont.33607
fbeq_else.33606:
	add	%a0, %zero, %zero
fbeq_cont.33607:
	beqi	%a0, 0, bnei_else.33608
	add	%a0, %zero, %zero
	j	bnei_cont.33601
bnei_else.33608:
	add	%a0, %zero, %k1
bnei_cont.33609:
	j	bnei_cont.33601
bnei_else.33604:
	add	%a0, %zero, %zero
bnei_cont.33605:
	j	bnei_cont.33601
bnei_else.33600:
	add	%a0, %zero, %zero
bnei_cont.33601:
	beqi	%a0, 0, bnei_else.33610
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.33611
bnei_else.33610:
	add	%a0, %zero, %zero
bnei_cont.33611:
bnei_cont.33597:
bnei_cont.33583:
bnei_cont.33549:
	flw	%f0, 135(%zero)
	beqi	%a0, 0, bnei_else.33612
	fblt	%f0, %f10, fbgt_else.33614
	add	%a0, %zero, %zero
	j	bnei_cont.33613
fbgt_else.33614:
	add	%a0, %zero, %k1
fbgt_cont.33615:
	j	bnei_cont.33613
bnei_else.33612:
	add	%a0, %zero, %zero
bnei_cont.33613:
	beqi	%a0, 0, bnei_else.33616
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
	beqi	%a0, -1, bnei_else.33617
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
	beqi	%a2, 1, bnei_else.33619
	beqi	%a2, 2, bnei_else.33621
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
	beqi	%fp, 0, bnei_else.33623
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
	j	bnei_cont.33624
bnei_else.33623:
bnei_cont.33624:
	beqi	%a2, 3, bnei_else.33625
	j	bnei_cont.33626
bnei_else.33625:
	fsub	%f11, %f11, %f30
bnei_cont.33626:
	fblt	%f11, %fzero, fbgt_else.33627
	add	%a0, %zero, %zero
	j	fbgt_cont.33628
fbgt_else.33627:
	add	%a0, %zero, %k1
fbgt_cont.33628:
	beqi	%a1, 0, bnei_else.33629
	beqi	%a0, 0, bnei_else.33631
	add	%a0, %zero, %zero
	j	bnei_cont.33630
bnei_else.33631:
	add	%a0, %zero, %k1
bnei_cont.33632:
	j	bnei_cont.33630
bnei_else.33629:
bnei_cont.33630:
	beqi	%a0, 0, bnei_else.33633
	add	%a1, %zero, %zero
	j	bnei_cont.33620
bnei_else.33633:
	add	%a1, %zero, %k1
bnei_cont.33634:
	j	bnei_cont.33620
bnei_else.33621:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.33635
	add	%a0, %zero, %zero
	j	fbgt_cont.33636
fbgt_else.33635:
	add	%a0, %zero, %k1
fbgt_cont.33636:
	beqi	%a1, 0, bnei_else.33637
	beqi	%a0, 0, bnei_else.33639
	add	%a0, %zero, %zero
	j	bnei_cont.33638
bnei_else.33639:
	add	%a0, %zero, %k1
bnei_cont.33640:
	j	bnei_cont.33638
bnei_else.33637:
bnei_cont.33638:
	beqi	%a0, 0, bnei_else.33641
	add	%a1, %zero, %zero
	j	bnei_cont.33620
bnei_else.33641:
	add	%a1, %zero, %k1
bnei_cont.33642:
bnei_cont.33622:
	j	bnei_cont.33620
bnei_else.33619:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.33643
	add	%a0, %zero, %zero
	j	fbgt_cont.33644
fbgt_else.33643:
	add	%a0, %zero, %k1
fbgt_cont.33644:
	beqi	%a0, 0, bnei_else.33645
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.33647
	add	%a0, %zero, %zero
	j	fbgt_cont.33648
fbgt_else.33647:
	add	%a0, %zero, %k1
fbgt_cont.33648:
	beqi	%a0, 0, bnei_else.33649
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.33651
	add	%a0, %zero, %zero
	j	bnei_cont.33646
fbgt_else.33651:
	add	%a0, %zero, %k1
fbgt_cont.33652:
	j	bnei_cont.33646
bnei_else.33649:
	add	%a0, %zero, %zero
bnei_cont.33650:
	j	bnei_cont.33646
bnei_else.33645:
	add	%a0, %zero, %zero
bnei_cont.33646:
	beqi	%a0, 0, bnei_else.33653
	j	bnei_cont.33654
bnei_else.33653:
	beqi	%a1, 0, bnei_else.33655
	add	%a1, %zero, %zero
	j	bnei_cont.33656
bnei_else.33655:
	add	%a1, %zero, %k1
bnei_cont.33656:
bnei_cont.33654:
bnei_cont.33620:
	beqi	%a1, 0, bnei_else.33657
	add	%v0, %zero, %zero
	j	bnei_cont.33618
bnei_else.33657:
	addi	%v0, %k1, 0
	jal	check_all_inside.2907
bnei_cont.33658:
	j	bnei_cont.33618
bnei_else.33617:
	add	%v0, %zero, %k1
bnei_cont.33618:
	beqi	%v0, 0, bnei_else.33659
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33659:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2
	j	shadow_check_and_group.2913
bnei_else.33616:
	beqi	%a1, 0, bnei_else.33660
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2
	j	shadow_check_and_group.2913
bnei_else.33660:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33547:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_group.2916:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %ra
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33698
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33699
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33699:
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33700
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33701
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33701:
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33702
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33703
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33703:
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33704
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33705
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33705:
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5
	addi	%v1, %s4, 0
	j	shadow_check_one_or_group.2916
bnei_else.33704:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33702:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33700:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33698:
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
	beqi	%k0, -1, bnei_else.33875
	beqi	%k0, 99, bnei_else.33876
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
	beqi	%a1, 1, bnei_else.33878
	beqi	%a1, 2, bnei_else.33880
	flw	%f13, 0(%k0)
	fbne	%f13, %fzero, fbeq_else.33882
	add	%a0, %zero, %k1
	j	fbeq_cont.33883
fbeq_else.33882:
	add	%a0, %zero, %zero
fbeq_cont.33883:
	beqi	%a0, 0, bnei_else.33884
	add	%a0, %zero, %zero
	j	bnei_cont.33879
bnei_else.33884:
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
	beqi	%a3, 0, bnei_else.33886
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
	j	bnei_cont.33887
bnei_else.33886:
bnei_cont.33887:
	beqi	%a1, 3, bnei_else.33888
	j	bnei_cont.33889
bnei_else.33888:
	fsub	%f0, %f0, %f30
bnei_cont.33889:
	fmul	%f1, %f12, %f12
	fmul	%f0, %f13, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.33890
	add	%a0, %zero, %zero
	j	fbgt_cont.33891
fbgt_else.33890:
	add	%a0, %zero, %k1
fbgt_cont.33891:
	beqi	%a0, 0, bnei_else.33892
	beqi	%fp, 0, bnei_else.33894
	fsqrt	%f0, %f0
	fadd	%f1, %f12, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.33895
bnei_else.33894:
	fsqrt	%f0, %f0
	fsub	%f1, %f12, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.33895:
	add	%a0, %zero, %k1
	j	bnei_cont.33879
bnei_else.33892:
	add	%a0, %zero, %zero
bnei_cont.33893:
bnei_cont.33885:
	j	bnei_cont.33879
bnei_else.33880:
	flw	%f0, 0(%k0)
	fblt	%f0, %fzero, fbgt_else.33896
	add	%a0, %zero, %zero
	j	fbgt_cont.33897
fbgt_else.33896:
	add	%a0, %zero, %k1
fbgt_cont.33897:
	beqi	%a0, 0, bnei_else.33898
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
	j	bnei_cont.33879
bnei_else.33898:
	add	%a0, %zero, %zero
bnei_cont.33899:
bnei_cont.33881:
	j	bnei_cont.33879
bnei_else.33878:
	flw	%f0, 0(%k0)
	fsub	%f0, %f0, %f14
	flw	%f17, 1(%k0)
	fmul	%f13, %f0, %f17
	flw	%f12, 185(%zero)
	fmul	%f0, %f13, %f12
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f11, 1(%ra)
	fblt	%f0, %f11, fbgt_else.33900
	add	%a0, %zero, %zero
	j	fbgt_cont.33901
fbgt_else.33900:
	add	%a0, %zero, %k1
fbgt_cont.33901:
	beqi	%a0, 0, bnei_else.33902
	flw	%f0, 186(%zero)
	fmul	%f0, %f13, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.33904
	add	%a0, %zero, %zero
	j	fbgt_cont.33905
fbgt_else.33904:
	add	%a0, %zero, %k1
fbgt_cont.33905:
	beqi	%a0, 0, bnei_else.33906
	fbne	%f17, %fzero, fbeq_else.33908
	add	%a0, %zero, %k1
	j	fbeq_cont.33909
fbeq_else.33908:
	add	%a0, %zero, %zero
fbeq_cont.33909:
	beqi	%a0, 0, bnei_else.33910
	add	%a0, %zero, %zero
	j	bnei_cont.33903
bnei_else.33910:
	add	%a0, %zero, %k1
bnei_cont.33911:
	j	bnei_cont.33903
bnei_else.33906:
	add	%a0, %zero, %zero
bnei_cont.33907:
	j	bnei_cont.33903
bnei_else.33902:
	add	%a0, %zero, %zero
bnei_cont.33903:
	beqi	%a0, 0, bnei_else.33912
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.33913
bnei_else.33912:
	flw	%f0, 2(%k0)
	fsub	%f0, %f0, %f15
	flw	%f19, 3(%k0)
	fmul	%f13, %f0, %f19
	flw	%f18, 184(%zero)
	fmul	%f0, %f13, %f18
	fadd	%f0, %f0, %f14
	fabs	%f0, %f0
	flw	%f17, 0(%ra)
	fblt	%f0, %f17, fbgt_else.33914
	add	%a0, %zero, %zero
	j	fbgt_cont.33915
fbgt_else.33914:
	add	%a0, %zero, %k1
fbgt_cont.33915:
	beqi	%a0, 0, bnei_else.33916
	flw	%f0, 186(%zero)
	fmul	%f0, %f13, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.33918
	add	%a0, %zero, %zero
	j	fbgt_cont.33919
fbgt_else.33918:
	add	%a0, %zero, %k1
fbgt_cont.33919:
	beqi	%a0, 0, bnei_else.33920
	fbne	%f19, %fzero, fbeq_else.33922
	add	%a0, %zero, %k1
	j	fbeq_cont.33923
fbeq_else.33922:
	add	%a0, %zero, %zero
fbeq_cont.33923:
	beqi	%a0, 0, bnei_else.33924
	add	%a0, %zero, %zero
	j	bnei_cont.33917
bnei_else.33924:
	add	%a0, %zero, %k1
bnei_cont.33925:
	j	bnei_cont.33917
bnei_else.33920:
	add	%a0, %zero, %zero
bnei_cont.33921:
	j	bnei_cont.33917
bnei_else.33916:
	add	%a0, %zero, %zero
bnei_cont.33917:
	beqi	%a0, 0, bnei_else.33926
	fsw	%f13, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.33927
bnei_else.33926:
	flw	%f0, 4(%k0)
	fsub	%f0, %f0, %f16
	flw	%f13, 5(%k0)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f18
	fadd	%f0, %f0, %f14
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.33928
	add	%a0, %zero, %zero
	j	fbgt_cont.33929
fbgt_else.33928:
	add	%a0, %zero, %k1
fbgt_cont.33929:
	beqi	%a0, 0, bnei_else.33930
	fmul	%f0, %f1, %f12
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f11, fbgt_else.33932
	add	%a0, %zero, %zero
	j	fbgt_cont.33933
fbgt_else.33932:
	add	%a0, %zero, %k1
fbgt_cont.33933:
	beqi	%a0, 0, bnei_else.33934
	fbne	%f13, %fzero, fbeq_else.33936
	add	%a0, %zero, %k1
	j	fbeq_cont.33937
fbeq_else.33936:
	add	%a0, %zero, %zero
fbeq_cont.33937:
	beqi	%a0, 0, bnei_else.33938
	add	%a0, %zero, %zero
	j	bnei_cont.33931
bnei_else.33938:
	add	%a0, %zero, %k1
bnei_cont.33939:
	j	bnei_cont.33931
bnei_else.33934:
	add	%a0, %zero, %zero
bnei_cont.33935:
	j	bnei_cont.33931
bnei_else.33930:
	add	%a0, %zero, %zero
bnei_cont.33931:
	beqi	%a0, 0, bnei_else.33940
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.33941
bnei_else.33940:
	add	%a0, %zero, %zero
bnei_cont.33941:
bnei_cont.33927:
bnei_cont.33913:
bnei_cont.33879:
	beqi	%a0, 0, bnei_else.33942
	flw	%f1, 135(%zero)
	flw	%f0, 465(%zero)
	fblt	%f1, %f0, fbgt_else.33944
	add	%a0, %zero, %zero
	j	fbgt_cont.33945
fbgt_else.33944:
	add	%a0, %zero, %k1
fbgt_cont.33945:
	beqi	%a0, 0, bnei_else.33946
	lw	%a0, 1(%t8)
	beqi	%a0, -1, bnei_else.33948
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33950
	add	%v0, %zero, %k1
	j	bnei_cont.33949
bnei_else.33950:
	lw	%a0, 2(%t8)
	beqi	%a0, -1, bnei_else.33952
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33954
	add	%v0, %zero, %k1
	j	bnei_cont.33949
bnei_else.33954:
	lw	%a0, 3(%t8)
	beqi	%a0, -1, bnei_else.33956
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33958
	add	%v0, %zero, %k1
	j	bnei_cont.33949
bnei_else.33958:
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0
	jal	shadow_check_one_or_group.2916
bnei_cont.33959:
	j	bnei_cont.33949
bnei_else.33956:
	add	%v0, %zero, %zero
bnei_cont.33957:
bnei_cont.33955:
	j	bnei_cont.33949
bnei_else.33952:
	add	%v0, %zero, %zero
bnei_cont.33953:
bnei_cont.33951:
	j	bnei_cont.33949
bnei_else.33948:
	add	%v0, %zero, %zero
bnei_cont.33949:
	beqi	%v0, 0, bnei_else.33960
	add	%a0, %zero, %k1
	j	bnei_cont.33877
bnei_else.33960:
	add	%a0, %zero, %zero
bnei_cont.33961:
	j	bnei_cont.33877
bnei_else.33946:
	add	%a0, %zero, %zero
bnei_cont.33947:
	j	bnei_cont.33877
bnei_else.33942:
	add	%a0, %zero, %zero
bnei_cont.33943:
	j	bnei_cont.33877
bnei_else.33876:
	add	%a0, %zero, %k1
bnei_cont.33877:
	beqi	%a0, 0, bnei_else.33962
	lw	%a0, 1(%t8)
	beqi	%a0, -1, bnei_else.33963
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33965
	add	%v0, %zero, %k1
	j	bnei_cont.33964
bnei_else.33965:
	lw	%a0, 2(%t8)
	beqi	%a0, -1, bnei_else.33967
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33969
	add	%v0, %zero, %k1
	j	bnei_cont.33964
bnei_else.33969:
	lw	%a0, 3(%t8)
	beqi	%a0, -1, bnei_else.33971
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33973
	add	%v0, %zero, %k1
	j	bnei_cont.33964
bnei_else.33973:
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0
	jal	shadow_check_one_or_group.2916
bnei_cont.33974:
	j	bnei_cont.33964
bnei_else.33971:
	add	%v0, %zero, %zero
bnei_cont.33972:
bnei_cont.33970:
	j	bnei_cont.33964
bnei_else.33967:
	add	%v0, %zero, %zero
bnei_cont.33968:
bnei_cont.33966:
	j	bnei_cont.33964
bnei_else.33963:
	add	%v0, %zero, %zero
bnei_cont.33964:
	beqi	%v0, 0, bnei_else.33975
	add	%ra, %zero, %t7
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33975:
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919
bnei_else.33962:
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919
bnei_else.33875:
	add	%ra, %zero, %t7
	add	%v0, %zero, %zero
	jr	%ra
solve_each_element.2922:
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0
	add	%s3, %zero, %ra
	add	%at, %v1, %s1
	lw	%s4, 0(%at)
	beqi	%s4, -1, bnei_else.34216
	lw	%a3, 12(%s4)
	flw	%f14, 159(%zero)
	lw	%fp, 9(%a3)
	lw	%a2, 6(%a3)
	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	lw	%k0, 3(%a3)
	lw	%a3, 1(%a3)
	flw	%f0, 0(%a0)
	fsub	%f17, %f14, %f0
	flw	%f13, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f13, %f0
	flw	%f12, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f19, %f12, %f0
	beqi	%a3, 1, bnei_else.34217
	beqi	%a3, 2, bnei_else.34219
	flw	%f23, 0(%s2)
	flw	%f22, 1(%s2)
	flw	%f24, 2(%s2)
	fmul	%f0, %f23, %f23
	flw	%f21, 0(%a1)
	fmul	%f1, %f0, %f21
	fmul	%f0, %f22, %f22
	flw	%f2, 1(%a1)
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f24
	flw	%f16, 2(%a1)
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	beqi	%k0, 0, bnei_else.34221
	fmul	%f11, %f22, %f24
	flw	%f1, 0(%fp)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f0, %f1
	fmul	%f1, %f24, %f23
	flw	%f0, 1(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	fmul	%f1, %f23, %f22
	flw	%f0, 2(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
	j	bnei_cont.34222
bnei_else.34221:
bnei_cont.34222:
	fbne	%f0, %fzero, fbeq_else.34223
	add	%a0, %zero, %k1
	j	fbeq_cont.34224
fbeq_else.34223:
	add	%a0, %zero, %zero
fbeq_cont.34224:
	beqi	%a0, 0, bnei_else.34225
	add	%s5, %zero, %zero
	j	bnei_cont.34218
bnei_else.34225:
	fmul	%f1, %f23, %f17
	fmul	%f11, %f1, %f21
	fmul	%f1, %f22, %f18
	fmul	%f1, %f1, %f2
	fadd	%f11, %f11, %f1
	fmul	%f1, %f24, %f19
	fmul	%f1, %f1, %f16
	fadd	%f1, %f11, %f1
	beqi	%k0, 0, bnei_else.34227
	fmul	%f15, %f24, %f18
	fmul	%f11, %f22, %f19
	fadd	%f15, %f15, %f11
	flw	%f11, 0(%fp)
	fmul	%f20, %f15, %f11
	fmul	%f15, %f23, %f19
	fmul	%f11, %f24, %f17
	fadd	%f15, %f15, %f11
	flw	%f11, 1(%fp)
	fmul	%f11, %f15, %f11
	fadd	%f20, %f20, %f11
	fmul	%f15, %f23, %f18
	fmul	%f11, %f22, %f17
	fadd	%f15, %f15, %f11
	flw	%f11, 2(%fp)
	fmul	%f11, %f15, %f11
	fadd	%f15, %f20, %f11
	flw	%f11, 474(%zero)
	fmul	%f11, %f15, %f11
	fadd	%f1, %f1, %f11
	j	bnei_cont.34228
bnei_else.34227:
bnei_cont.34228:
	fmul	%f11, %f17, %f17
	fmul	%f15, %f11, %f21
	fmul	%f11, %f18, %f18
	fmul	%f11, %f11, %f2
	fadd	%f15, %f15, %f11
	fmul	%f11, %f19, %f19
	fmul	%f11, %f11, %f16
	fadd	%f11, %f15, %f11
	beqi	%k0, 0, bnei_else.34229
	fmul	%f16, %f18, %f19
	flw	%f15, 0(%fp)
	fmul	%f15, %f16, %f15
	fadd	%f16, %f11, %f15
	fmul	%f15, %f19, %f17
	flw	%f11, 1(%fp)
	fmul	%f11, %f15, %f11
	fadd	%f16, %f16, %f11
	fmul	%f15, %f17, %f18
	flw	%f11, 2(%fp)
	fmul	%f11, %f15, %f11
	fadd	%f11, %f16, %f11
	j	bnei_cont.34230
bnei_else.34229:
bnei_cont.34230:
	beqi	%a3, 3, bnei_else.34231
	j	bnei_cont.34232
bnei_else.34231:
	fsub	%f11, %f11, %f30
bnei_cont.34232:
	fmul	%f15, %f1, %f1
	fmul	%f11, %f0, %f11
	fsub	%f11, %f15, %f11
	fblt	%fzero, %f11, fbgt_else.34233
	add	%a0, %zero, %zero
	j	fbgt_cont.34234
fbgt_else.34233:
	add	%a0, %zero, %k1
fbgt_cont.34234:
	beqi	%a0, 0, bnei_else.34235
	fsqrt	%f11, %f11
	beqi	%a2, 0, bnei_else.34237
	j	bnei_cont.34238
bnei_else.34237:
	fneg	%f11, %f11
bnei_cont.34238:
	fsub	%f1, %f11, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.34218
bnei_else.34235:
	add	%s5, %zero, %zero
bnei_cont.34236:
bnei_cont.34226:
	j	bnei_cont.34218
bnei_else.34219:
	flw	%f0, 0(%s2)
	flw	%f2, 0(%a1)
	fmul	%f1, %f0, %f2
	flw	%f0, 1(%s2)
	flw	%f16, 1(%a1)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%s2)
	flw	%f15, 2(%a1)
	fmul	%f0, %f0, %f15
	fadd	%f11, %f1, %f0
	fblt	%fzero, %f11, fbgt_else.34239
	add	%a0, %zero, %zero
	j	fbgt_cont.34240
fbgt_else.34239:
	add	%a0, %zero, %k1
fbgt_cont.34240:
	beqi	%a0, 0, bnei_else.34241
	fmul	%f1, %f2, %f17
	fmul	%f0, %f16, %f18
	fadd	%f1, %f1, %f0
	fmul	%f0, %f15, %f19
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f11
	fsw	%f0, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.34218
bnei_else.34241:
	add	%s5, %zero, %zero
bnei_cont.34242:
bnei_cont.34220:
	j	bnei_cont.34218
bnei_else.34217:
	flw	%f15, 0(%s2)
	fbne	%f15, %fzero, fbeq_else.34243
	add	%a0, %zero, %k1
	j	fbeq_cont.34244
fbeq_else.34243:
	add	%a0, %zero, %zero
fbeq_cont.34244:
	beqi	%a0, 0, bnei_else.34245
	add	%a0, %zero, %zero
	j	bnei_cont.34246
bnei_else.34245:
	fblt	%f15, %fzero, fbgt_else.34247
	add	%a0, %zero, %zero
	j	fbgt_cont.34248
fbgt_else.34247:
	add	%a0, %zero, %k1
fbgt_cont.34248:
	beqi	%a2, 0, bnei_else.34249
	beqi	%a0, 0, bnei_else.34251
	add	%a0, %zero, %zero
	j	bnei_cont.34250
bnei_else.34251:
	add	%a0, %zero, %k1
bnei_cont.34252:
	j	bnei_cont.34250
bnei_else.34249:
bnei_cont.34250:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.34253
	j	bnei_cont.34254
bnei_else.34253:
	fneg	%f0, %f0
bnei_cont.34254:
	fsub	%f0, %f0, %f17
	fdiv	%f11, %f0, %f15
	flw	%f0, 1(%s2)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.34255
	add	%a0, %zero, %zero
	j	fbgt_cont.34256
fbgt_else.34255:
	add	%a0, %zero, %k1
fbgt_cont.34256:
	beqi	%a0, 0, bnei_else.34257
	flw	%f0, 2(%s2)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.34259
	add	%a0, %zero, %zero
	j	fbgt_cont.34260
fbgt_else.34259:
	add	%a0, %zero, %k1
fbgt_cont.34260:
	beqi	%a0, 0, bnei_else.34261
	fsw	%f11, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.34258
bnei_else.34261:
	add	%a0, %zero, %zero
bnei_cont.34262:
	j	bnei_cont.34258
bnei_else.34257:
	add	%a0, %zero, %zero
bnei_cont.34258:
bnei_cont.34246:
	beqi	%a0, 0, bnei_else.34263
	add	%s5, %zero, %k1
	j	bnei_cont.34264
bnei_else.34263:
	flw	%f11, 1(%s2)
	fbne	%f11, %fzero, fbeq_else.34265
	add	%a0, %zero, %k1
	j	fbeq_cont.34266
fbeq_else.34265:
	add	%a0, %zero, %zero
fbeq_cont.34266:
	beqi	%a0, 0, bnei_else.34267
	add	%a0, %zero, %zero
	j	bnei_cont.34268
bnei_else.34267:
	fblt	%f11, %fzero, fbgt_else.34269
	add	%a0, %zero, %zero
	j	fbgt_cont.34270
fbgt_else.34269:
	add	%a0, %zero, %k1
fbgt_cont.34270:
	beqi	%a2, 0, bnei_else.34271
	beqi	%a0, 0, bnei_else.34273
	add	%a0, %zero, %zero
	j	bnei_cont.34272
bnei_else.34273:
	add	%a0, %zero, %k1
bnei_cont.34274:
	j	bnei_cont.34272
bnei_else.34271:
bnei_cont.34272:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.34275
	j	bnei_cont.34276
bnei_else.34275:
	fneg	%f0, %f0
bnei_cont.34276:
	fsub	%f0, %f0, %f18
	fdiv	%f16, %f0, %f11
	flw	%f0, 2(%s2)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.34277
	add	%a0, %zero, %zero
	j	fbgt_cont.34278
fbgt_else.34277:
	add	%a0, %zero, %k1
fbgt_cont.34278:
	beqi	%a0, 0, bnei_else.34279
	fmul	%f0, %f16, %f15
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.34281
	add	%a0, %zero, %zero
	j	fbgt_cont.34282
fbgt_else.34281:
	add	%a0, %zero, %k1
fbgt_cont.34282:
	beqi	%a0, 0, bnei_else.34283
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.34280
bnei_else.34283:
	add	%a0, %zero, %zero
bnei_cont.34284:
	j	bnei_cont.34280
bnei_else.34279:
	add	%a0, %zero, %zero
bnei_cont.34280:
bnei_cont.34268:
	beqi	%a0, 0, bnei_else.34285
	addi	%s5, %zero, 2
	j	bnei_cont.34286
bnei_else.34285:
	flw	%f1, 2(%s2)
	fbne	%f1, %fzero, fbeq_else.34287
	add	%a0, %zero, %k1
	j	fbeq_cont.34288
fbeq_else.34287:
	add	%a0, %zero, %zero
fbeq_cont.34288:
	beqi	%a0, 0, bnei_else.34289
	add	%a0, %zero, %zero
	j	bnei_cont.34290
bnei_else.34289:
	fblt	%f1, %fzero, fbgt_else.34291
	add	%a0, %zero, %zero
	j	fbgt_cont.34292
fbgt_else.34291:
	add	%a0, %zero, %k1
fbgt_cont.34292:
	beqi	%a2, 0, bnei_else.34293
	beqi	%a0, 0, bnei_else.34295
	add	%a0, %zero, %zero
	j	bnei_cont.34294
bnei_else.34295:
	add	%a0, %zero, %k1
bnei_cont.34296:
	j	bnei_cont.34294
bnei_else.34293:
bnei_cont.34294:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.34297
	j	bnei_cont.34298
bnei_else.34297:
	fneg	%f0, %f0
bnei_cont.34298:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f1
	fmul	%f0, %f16, %f15
	fadd	%f0, %f0, %f17
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.34299
	add	%a0, %zero, %zero
	j	fbgt_cont.34300
fbgt_else.34299:
	add	%a0, %zero, %k1
fbgt_cont.34300:
	beqi	%a0, 0, bnei_else.34301
	fmul	%f0, %f16, %f11
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.34303
	add	%a0, %zero, %zero
	j	fbgt_cont.34304
fbgt_else.34303:
	add	%a0, %zero, %k1
fbgt_cont.34304:
	beqi	%a0, 0, bnei_else.34305
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.34302
bnei_else.34305:
	add	%a0, %zero, %zero
bnei_cont.34306:
	j	bnei_cont.34302
bnei_else.34301:
	add	%a0, %zero, %zero
bnei_cont.34302:
bnei_cont.34290:
	beqi	%a0, 0, bnei_else.34307
	addi	%s5, %zero, 3
	j	bnei_cont.34308
bnei_else.34307:
	add	%s5, %zero, %zero
bnei_cont.34308:
bnei_cont.34286:
bnei_cont.34264:
bnei_cont.34218:
	beqi	%s5, 0, bnei_else.34309
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.34310
	add	%a0, %zero, %zero
	j	fbgt_cont.34311
fbgt_else.34310:
	add	%a0, %zero, %k1
fbgt_cont.34311:
	beqi	%a0, 0, bnei_else.34312
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.34314
	add	%a0, %zero, %zero
	j	fbgt_cont.34315
fbgt_else.34314:
	add	%a0, %zero, %k1
fbgt_cont.34315:
	beqi	%a0, 0, bnei_cont.34313
	fadd	%f17, %f1, %f9
	flw	%f0, 0(%s2)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f0, %f14
	flw	%f1, 1(%s2)
	fmul	%f1, %f1, %f17
	fadd	%f1, %f1, %f13
	flw	%f11, 2(%s2)
	fmul	%f11, %f11, %f17
	fadd	%f2, %f11, %f12
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.34318
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
	beqi	%a2, 1, bnei_else.34320
	beqi	%a2, 2, bnei_else.34322
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
	beqi	%fp, 0, bnei_else.34324
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
	j	bnei_cont.34325
bnei_else.34324:
bnei_cont.34325:
	beqi	%a2, 3, bnei_else.34326
	j	bnei_cont.34327
bnei_else.34326:
	fsub	%f11, %f11, %f30
bnei_cont.34327:
	fblt	%f11, %fzero, fbgt_else.34328
	add	%a0, %zero, %zero
	j	fbgt_cont.34329
fbgt_else.34328:
	add	%a0, %zero, %k1
fbgt_cont.34329:
	beqi	%a1, 0, bnei_else.34330
	beqi	%a0, 0, bnei_else.34332
	add	%a0, %zero, %zero
	j	bnei_cont.34331
bnei_else.34332:
	add	%a0, %zero, %k1
bnei_cont.34333:
	j	bnei_cont.34331
bnei_else.34330:
bnei_cont.34331:
	beqi	%a0, 0, bnei_else.34334
	add	%a1, %zero, %zero
	j	bnei_cont.34321
bnei_else.34334:
	add	%a1, %zero, %k1
bnei_cont.34335:
	j	bnei_cont.34321
bnei_else.34322:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.34336
	add	%a0, %zero, %zero
	j	fbgt_cont.34337
fbgt_else.34336:
	add	%a0, %zero, %k1
fbgt_cont.34337:
	beqi	%a1, 0, bnei_else.34338
	beqi	%a0, 0, bnei_else.34340
	add	%a0, %zero, %zero
	j	bnei_cont.34339
bnei_else.34340:
	add	%a0, %zero, %k1
bnei_cont.34341:
	j	bnei_cont.34339
bnei_else.34338:
bnei_cont.34339:
	beqi	%a0, 0, bnei_else.34342
	add	%a1, %zero, %zero
	j	bnei_cont.34321
bnei_else.34342:
	add	%a1, %zero, %k1
bnei_cont.34343:
bnei_cont.34323:
	j	bnei_cont.34321
bnei_else.34320:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.34344
	add	%a0, %zero, %zero
	j	fbgt_cont.34345
fbgt_else.34344:
	add	%a0, %zero, %k1
fbgt_cont.34345:
	beqi	%a0, 0, bnei_else.34346
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.34348
	add	%a0, %zero, %zero
	j	fbgt_cont.34349
fbgt_else.34348:
	add	%a0, %zero, %k1
fbgt_cont.34349:
	beqi	%a0, 0, bnei_else.34350
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.34352
	add	%a0, %zero, %zero
	j	bnei_cont.34347
fbgt_else.34352:
	add	%a0, %zero, %k1
fbgt_cont.34353:
	j	bnei_cont.34347
bnei_else.34350:
	add	%a0, %zero, %zero
bnei_cont.34351:
	j	bnei_cont.34347
bnei_else.34346:
	add	%a0, %zero, %zero
bnei_cont.34347:
	beqi	%a0, 0, bnei_else.34354
	j	bnei_cont.34355
bnei_else.34354:
	beqi	%a1, 0, bnei_else.34356
	add	%a1, %zero, %zero
	j	bnei_cont.34357
bnei_else.34356:
	add	%a1, %zero, %k1
bnei_cont.34357:
bnei_cont.34355:
bnei_cont.34321:
	beqi	%a1, 0, bnei_else.34358
	add	%v0, %zero, %zero
	j	bnei_cont.34319
bnei_else.34358:
	addi	%v0, %k1, 0
	jal	check_all_inside.2907
bnei_cont.34359:
	j	bnei_cont.34319
bnei_else.34318:
	add	%v0, %zero, %k1
bnei_cont.34319:
	beqi	%v0, 0, bnei_cont.34313
	fsw	%f17, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s4, 141(%zero)
	sw	%s5, 136(%zero)
	j	bnei_cont.34313
bnei_else.34360:
bnei_cont.34361:
	j	bnei_cont.34313
bnei_else.34316:
bnei_cont.34317:
	j	bnei_cont.34313
bnei_else.34312:
bnei_cont.34313:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element.2922
bnei_else.34309:
	beqi	%a2, 0, bnei_else.34362
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element.2922
bnei_else.34362:
	add	%ra, %zero, %s3
	jr	%ra
bnei_else.34216:
	add	%ra, %zero, %s3
	jr	%ra
solve_one_or_network.2926:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34410
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34411
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34412
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34413
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34414
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34415
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34416
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34417
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%v0, %s6, 1
	add	%ra, %zero, %t8
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0
	j	solve_one_or_network.2926
bnei_else.34417:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34416:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34415:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34414:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34413:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34412:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34411:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34410:
	add	%ra, %zero, %t8
	jr	%ra
trace_or_matrix.2930:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	add	%t9, %zero, %a0
	sw	%ra, 2(%sp)
	add	%at, %v1, %v0
	lw	%s6, 0(%at)
	lw	%a0, 0(%s6)
	beqi	%a0, -1, bnei_else.35221
	beqi	%a0, 99, bnei_else.35222
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
	beqi	%a3, 1, bnei_else.35224
	beqi	%a3, 2, bnei_else.35226
	flw	%f20, 0(%t9)
	flw	%f2, 1(%t9)
	flw	%f21, 2(%t9)
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
	beqi	%k0, 0, bnei_else.35228
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
	j	bnei_cont.35229
bnei_else.35228:
bnei_cont.35229:
	fbne	%f0, %fzero, fbeq_else.35230
	add	%a0, %zero, %k1
	j	fbeq_cont.35231
fbeq_else.35230:
	add	%a0, %zero, %zero
fbeq_cont.35231:
	beqi	%a0, 0, bnei_else.35232
	add	%a0, %zero, %zero
	j	bnei_cont.35225
bnei_else.35232:
	fmul	%f1, %f20, %f14
	fmul	%f11, %f1, %f19
	fmul	%f1, %f2, %f15
	fmul	%f1, %f1, %f18
	fadd	%f11, %f11, %f1
	fmul	%f1, %f21, %f16
	fmul	%f1, %f1, %f17
	fadd	%f1, %f11, %f1
	beqi	%k0, 0, bnei_else.35234
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
	flw	%f11, 474(%zero)
	fmul	%f11, %f12, %f11
	fadd	%f1, %f1, %f11
	j	bnei_cont.35235
bnei_else.35234:
bnei_cont.35235:
	fmul	%f11, %f14, %f14
	fmul	%f12, %f11, %f19
	fmul	%f11, %f15, %f15
	fmul	%f11, %f11, %f18
	fadd	%f12, %f12, %f11
	fmul	%f11, %f16, %f16
	fmul	%f11, %f11, %f17
	fadd	%f11, %f12, %f11
	beqi	%k0, 0, bnei_else.35236
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
	j	bnei_cont.35237
bnei_else.35236:
bnei_cont.35237:
	beqi	%a3, 3, bnei_else.35238
	j	bnei_cont.35239
bnei_else.35238:
	fsub	%f11, %f11, %f30
bnei_cont.35239:
	fmul	%f12, %f1, %f1
	fmul	%f11, %f0, %f11
	fsub	%f11, %f12, %f11
	fblt	%fzero, %f11, fbgt_else.35240
	add	%a0, %zero, %zero
	j	fbgt_cont.35241
fbgt_else.35240:
	add	%a0, %zero, %k1
fbgt_cont.35241:
	beqi	%a0, 0, bnei_else.35242
	fsqrt	%f11, %f11
	beqi	%a2, 0, bnei_else.35244
	j	bnei_cont.35245
bnei_else.35244:
	fneg	%f11, %f11
bnei_cont.35245:
	fsub	%f1, %f11, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35225
bnei_else.35242:
	add	%a0, %zero, %zero
bnei_cont.35243:
bnei_cont.35233:
	j	bnei_cont.35225
bnei_else.35226:
	flw	%f0, 0(%t9)
	flw	%f17, 0(%a1)
	fmul	%f1, %f0, %f17
	flw	%f0, 1(%t9)
	flw	%f13, 1(%a1)
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t9)
	flw	%f12, 2(%a1)
	fmul	%f0, %f0, %f12
	fadd	%f11, %f1, %f0
	fblt	%fzero, %f11, fbgt_else.35246
	add	%a0, %zero, %zero
	j	fbgt_cont.35247
fbgt_else.35246:
	add	%a0, %zero, %k1
fbgt_cont.35247:
	beqi	%a0, 0, bnei_else.35248
	fmul	%f1, %f17, %f14
	fmul	%f0, %f13, %f15
	fadd	%f1, %f1, %f0
	fmul	%f0, %f12, %f16
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f11
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35225
bnei_else.35248:
	add	%a0, %zero, %zero
bnei_cont.35249:
bnei_cont.35227:
	j	bnei_cont.35225
bnei_else.35224:
	flw	%f12, 0(%t9)
	fbne	%f12, %fzero, fbeq_else.35250
	add	%a0, %zero, %k1
	j	fbeq_cont.35251
fbeq_else.35250:
	add	%a0, %zero, %zero
fbeq_cont.35251:
	beqi	%a0, 0, bnei_else.35252
	add	%a0, %zero, %zero
	j	bnei_cont.35253
bnei_else.35252:
	fblt	%f12, %fzero, fbgt_else.35254
	add	%a0, %zero, %zero
	j	fbgt_cont.35255
fbgt_else.35254:
	add	%a0, %zero, %k1
fbgt_cont.35255:
	beqi	%a2, 0, bnei_else.35256
	beqi	%a0, 0, bnei_else.35258
	add	%a0, %zero, %zero
	j	bnei_cont.35257
bnei_else.35258:
	add	%a0, %zero, %k1
bnei_cont.35259:
	j	bnei_cont.35257
bnei_else.35256:
bnei_cont.35257:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.35260
	j	bnei_cont.35261
bnei_else.35260:
	fneg	%f0, %f0
bnei_cont.35261:
	fsub	%f0, %f0, %f14
	fdiv	%f11, %f0, %f12
	flw	%f0, 1(%t9)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f0, %f15
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.35262
	add	%a0, %zero, %zero
	j	fbgt_cont.35263
fbgt_else.35262:
	add	%a0, %zero, %k1
fbgt_cont.35263:
	beqi	%a0, 0, bnei_else.35264
	flw	%f0, 2(%t9)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.35266
	add	%a0, %zero, %zero
	j	fbgt_cont.35267
fbgt_else.35266:
	add	%a0, %zero, %k1
fbgt_cont.35267:
	beqi	%a0, 0, bnei_else.35268
	fsw	%f11, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35265
bnei_else.35268:
	add	%a0, %zero, %zero
bnei_cont.35269:
	j	bnei_cont.35265
bnei_else.35264:
	add	%a0, %zero, %zero
bnei_cont.35265:
bnei_cont.35253:
	beqi	%a0, 0, bnei_else.35270
	add	%a0, %zero, %k1
	j	bnei_cont.35271
bnei_else.35270:
	flw	%f11, 1(%t9)
	fbne	%f11, %fzero, fbeq_else.35272
	add	%a0, %zero, %k1
	j	fbeq_cont.35273
fbeq_else.35272:
	add	%a0, %zero, %zero
fbeq_cont.35273:
	beqi	%a0, 0, bnei_else.35274
	add	%a0, %zero, %zero
	j	bnei_cont.35275
bnei_else.35274:
	fblt	%f11, %fzero, fbgt_else.35276
	add	%a0, %zero, %zero
	j	fbgt_cont.35277
fbgt_else.35276:
	add	%a0, %zero, %k1
fbgt_cont.35277:
	beqi	%a2, 0, bnei_else.35278
	beqi	%a0, 0, bnei_else.35280
	add	%a0, %zero, %zero
	j	bnei_cont.35279
bnei_else.35280:
	add	%a0, %zero, %k1
bnei_cont.35281:
	j	bnei_cont.35279
bnei_else.35278:
bnei_cont.35279:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.35282
	j	bnei_cont.35283
bnei_else.35282:
	fneg	%f0, %f0
bnei_cont.35283:
	fsub	%f0, %f0, %f15
	fdiv	%f13, %f0, %f11
	flw	%f0, 2(%t9)
	fmul	%f0, %f13, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.35284
	add	%a0, %zero, %zero
	j	fbgt_cont.35285
fbgt_else.35284:
	add	%a0, %zero, %k1
fbgt_cont.35285:
	beqi	%a0, 0, bnei_else.35286
	fmul	%f0, %f13, %f12
	fadd	%f0, %f0, %f14
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.35288
	add	%a0, %zero, %zero
	j	fbgt_cont.35289
fbgt_else.35288:
	add	%a0, %zero, %k1
fbgt_cont.35289:
	beqi	%a0, 0, bnei_else.35290
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35287
bnei_else.35290:
	add	%a0, %zero, %zero
bnei_cont.35291:
	j	bnei_cont.35287
bnei_else.35286:
	add	%a0, %zero, %zero
bnei_cont.35287:
bnei_cont.35275:
	beqi	%a0, 0, bnei_else.35292
	addi	%a0, %zero, 2
	j	bnei_cont.35293
bnei_else.35292:
	flw	%f1, 2(%t9)
	fbne	%f1, %fzero, fbeq_else.35294
	add	%a0, %zero, %k1
	j	fbeq_cont.35295
fbeq_else.35294:
	add	%a0, %zero, %zero
fbeq_cont.35295:
	beqi	%a0, 0, bnei_else.35296
	add	%a0, %zero, %zero
	j	bnei_cont.35297
bnei_else.35296:
	fblt	%f1, %fzero, fbgt_else.35298
	add	%a0, %zero, %zero
	j	fbgt_cont.35299
fbgt_else.35298:
	add	%a0, %zero, %k1
fbgt_cont.35299:
	beqi	%a2, 0, bnei_else.35300
	beqi	%a0, 0, bnei_else.35302
	add	%a0, %zero, %zero
	j	bnei_cont.35301
bnei_else.35302:
	add	%a0, %zero, %k1
bnei_cont.35303:
	j	bnei_cont.35301
bnei_else.35300:
bnei_cont.35301:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.35304
	j	bnei_cont.35305
bnei_else.35304:
	fneg	%f0, %f0
bnei_cont.35305:
	fsub	%f0, %f0, %f16
	fdiv	%f13, %f0, %f1
	fmul	%f0, %f13, %f12
	fadd	%f0, %f0, %f14
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.35306
	add	%a0, %zero, %zero
	j	fbgt_cont.35307
fbgt_else.35306:
	add	%a0, %zero, %k1
fbgt_cont.35307:
	beqi	%a0, 0, bnei_else.35308
	fmul	%f0, %f13, %f11
	fadd	%f0, %f0, %f15
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.35310
	add	%a0, %zero, %zero
	j	fbgt_cont.35311
fbgt_else.35310:
	add	%a0, %zero, %k1
fbgt_cont.35311:
	beqi	%a0, 0, bnei_else.35312
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35309
bnei_else.35312:
	add	%a0, %zero, %zero
bnei_cont.35313:
	j	bnei_cont.35309
bnei_else.35308:
	add	%a0, %zero, %zero
bnei_cont.35309:
bnei_cont.35297:
	beqi	%a0, 0, bnei_else.35314
	addi	%a0, %zero, 3
	j	bnei_cont.35315
bnei_else.35314:
	add	%a0, %zero, %zero
bnei_cont.35315:
bnei_cont.35293:
bnei_cont.35271:
bnei_cont.35225:
	beqi	%a0, 0, bnei_cont.35223
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.35318
	add	%a0, %zero, %zero
	j	fbgt_cont.35319
fbgt_else.35318:
	add	%a0, %zero, %k1
fbgt_cont.35319:
	beqi	%a0, 0, bnei_cont.35223
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.35223
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35223
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35223
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35223
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.35223
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.35223
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.35223
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -3
	j	bnei_cont.35223
bnei_else.35334:
bnei_cont.35335:
	j	bnei_cont.35223
bnei_else.35332:
bnei_cont.35333:
	j	bnei_cont.35223
bnei_else.35330:
bnei_cont.35331:
	j	bnei_cont.35223
bnei_else.35328:
bnei_cont.35329:
	j	bnei_cont.35223
bnei_else.35326:
bnei_cont.35327:
	j	bnei_cont.35223
bnei_else.35324:
bnei_cont.35325:
	j	bnei_cont.35223
bnei_else.35322:
bnei_cont.35323:
	j	bnei_cont.35223
bnei_else.35320:
bnei_cont.35321:
	j	bnei_cont.35223
bnei_else.35316:
bnei_cont.35317:
	j	bnei_cont.35223
bnei_else.35222:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.35336
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35337
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35337
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35337
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.35337
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.35337
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.35337
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -3
	j	bnei_cont.35337
bnei_else.35348:
bnei_cont.35349:
	j	bnei_cont.35337
bnei_else.35346:
bnei_cont.35347:
	j	bnei_cont.35337
bnei_else.35344:
bnei_cont.35345:
	j	bnei_cont.35337
bnei_else.35342:
bnei_cont.35343:
	j	bnei_cont.35337
bnei_else.35340:
bnei_cont.35341:
	j	bnei_cont.35337
bnei_else.35338:
bnei_cont.35339:
	j	bnei_cont.35337
bnei_else.35336:
bnei_cont.35337:
bnei_cont.35223:
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%a1, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%s6, 0(%at)
	lw	%a0, 0(%s6)
	beqi	%a0, -1, bnei_else.35350
	beqi	%a0, 99, bnei_else.35351
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
	beqi	%a3, 1, bnei_else.35353
	beqi	%a3, 2, bnei_else.35355
	flw	%f20, 0(%t9)
	flw	%f2, 1(%t9)
	flw	%f21, 2(%t9)
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
	beqi	%k0, 0, bnei_else.35357
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
	j	bnei_cont.35358
bnei_else.35357:
bnei_cont.35358:
	fbne	%f0, %fzero, fbeq_else.35359
	add	%a0, %zero, %k1
	j	fbeq_cont.35360
fbeq_else.35359:
	add	%a0, %zero, %zero
fbeq_cont.35360:
	beqi	%a0, 0, bnei_else.35361
	add	%a0, %zero, %zero
	j	bnei_cont.35354
bnei_else.35361:
	fmul	%f1, %f20, %f14
	fmul	%f11, %f1, %f19
	fmul	%f1, %f2, %f15
	fmul	%f1, %f1, %f18
	fadd	%f11, %f11, %f1
	fmul	%f1, %f21, %f16
	fmul	%f1, %f1, %f17
	fadd	%f1, %f11, %f1
	beqi	%k0, 0, bnei_else.35363
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
	flw	%f11, 474(%zero)
	fmul	%f11, %f12, %f11
	fadd	%f1, %f1, %f11
	j	bnei_cont.35364
bnei_else.35363:
bnei_cont.35364:
	fmul	%f11, %f14, %f14
	fmul	%f12, %f11, %f19
	fmul	%f11, %f15, %f15
	fmul	%f11, %f11, %f18
	fadd	%f12, %f12, %f11
	fmul	%f11, %f16, %f16
	fmul	%f11, %f11, %f17
	fadd	%f11, %f12, %f11
	beqi	%k0, 0, bnei_else.35365
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
	j	bnei_cont.35366
bnei_else.35365:
bnei_cont.35366:
	beqi	%a3, 3, bnei_else.35367
	j	bnei_cont.35368
bnei_else.35367:
	fsub	%f11, %f11, %f30
bnei_cont.35368:
	fmul	%f12, %f1, %f1
	fmul	%f11, %f0, %f11
	fsub	%f11, %f12, %f11
	fblt	%fzero, %f11, fbgt_else.35369
	add	%a0, %zero, %zero
	j	fbgt_cont.35370
fbgt_else.35369:
	add	%a0, %zero, %k1
fbgt_cont.35370:
	beqi	%a0, 0, bnei_else.35371
	fsqrt	%f11, %f11
	beqi	%a2, 0, bnei_else.35373
	j	bnei_cont.35374
bnei_else.35373:
	fneg	%f11, %f11
bnei_cont.35374:
	fsub	%f1, %f11, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35354
bnei_else.35371:
	add	%a0, %zero, %zero
bnei_cont.35372:
bnei_cont.35362:
	j	bnei_cont.35354
bnei_else.35355:
	flw	%f0, 0(%t9)
	flw	%f17, 0(%a1)
	fmul	%f1, %f0, %f17
	flw	%f0, 1(%t9)
	flw	%f13, 1(%a1)
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t9)
	flw	%f12, 2(%a1)
	fmul	%f0, %f0, %f12
	fadd	%f11, %f1, %f0
	fblt	%fzero, %f11, fbgt_else.35375
	add	%a0, %zero, %zero
	j	fbgt_cont.35376
fbgt_else.35375:
	add	%a0, %zero, %k1
fbgt_cont.35376:
	beqi	%a0, 0, bnei_else.35377
	fmul	%f1, %f17, %f14
	fmul	%f0, %f13, %f15
	fadd	%f1, %f1, %f0
	fmul	%f0, %f12, %f16
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f11
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35354
bnei_else.35377:
	add	%a0, %zero, %zero
bnei_cont.35378:
bnei_cont.35356:
	j	bnei_cont.35354
bnei_else.35353:
	flw	%f12, 0(%t9)
	fbne	%f12, %fzero, fbeq_else.35379
	add	%a0, %zero, %k1
	j	fbeq_cont.35380
fbeq_else.35379:
	add	%a0, %zero, %zero
fbeq_cont.35380:
	beqi	%a0, 0, bnei_else.35381
	add	%a0, %zero, %zero
	j	bnei_cont.35382
bnei_else.35381:
	fblt	%f12, %fzero, fbgt_else.35383
	add	%a0, %zero, %zero
	j	fbgt_cont.35384
fbgt_else.35383:
	add	%a0, %zero, %k1
fbgt_cont.35384:
	beqi	%a2, 0, bnei_else.35385
	beqi	%a0, 0, bnei_else.35387
	add	%a0, %zero, %zero
	j	bnei_cont.35386
bnei_else.35387:
	add	%a0, %zero, %k1
bnei_cont.35388:
	j	bnei_cont.35386
bnei_else.35385:
bnei_cont.35386:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.35389
	j	bnei_cont.35390
bnei_else.35389:
	fneg	%f0, %f0
bnei_cont.35390:
	fsub	%f0, %f0, %f14
	fdiv	%f11, %f0, %f12
	flw	%f0, 1(%t9)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f0, %f15
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.35391
	add	%a0, %zero, %zero
	j	fbgt_cont.35392
fbgt_else.35391:
	add	%a0, %zero, %k1
fbgt_cont.35392:
	beqi	%a0, 0, bnei_else.35393
	flw	%f0, 2(%t9)
	fmul	%f0, %f11, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.35395
	add	%a0, %zero, %zero
	j	fbgt_cont.35396
fbgt_else.35395:
	add	%a0, %zero, %k1
fbgt_cont.35396:
	beqi	%a0, 0, bnei_else.35397
	fsw	%f11, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35394
bnei_else.35397:
	add	%a0, %zero, %zero
bnei_cont.35398:
	j	bnei_cont.35394
bnei_else.35393:
	add	%a0, %zero, %zero
bnei_cont.35394:
bnei_cont.35382:
	beqi	%a0, 0, bnei_else.35399
	add	%a0, %zero, %k1
	j	bnei_cont.35400
bnei_else.35399:
	flw	%f11, 1(%t9)
	fbne	%f11, %fzero, fbeq_else.35401
	add	%a0, %zero, %k1
	j	fbeq_cont.35402
fbeq_else.35401:
	add	%a0, %zero, %zero
fbeq_cont.35402:
	beqi	%a0, 0, bnei_else.35403
	add	%a0, %zero, %zero
	j	bnei_cont.35404
bnei_else.35403:
	fblt	%f11, %fzero, fbgt_else.35405
	add	%a0, %zero, %zero
	j	fbgt_cont.35406
fbgt_else.35405:
	add	%a0, %zero, %k1
fbgt_cont.35406:
	beqi	%a2, 0, bnei_else.35407
	beqi	%a0, 0, bnei_else.35409
	add	%a0, %zero, %zero
	j	bnei_cont.35408
bnei_else.35409:
	add	%a0, %zero, %k1
bnei_cont.35410:
	j	bnei_cont.35408
bnei_else.35407:
bnei_cont.35408:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.35411
	j	bnei_cont.35412
bnei_else.35411:
	fneg	%f0, %f0
bnei_cont.35412:
	fsub	%f0, %f0, %f15
	fdiv	%f13, %f0, %f11
	flw	%f0, 2(%t9)
	fmul	%f0, %f13, %f0
	fadd	%f0, %f0, %f16
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.35413
	add	%a0, %zero, %zero
	j	fbgt_cont.35414
fbgt_else.35413:
	add	%a0, %zero, %k1
fbgt_cont.35414:
	beqi	%a0, 0, bnei_else.35415
	fmul	%f0, %f13, %f12
	fadd	%f0, %f0, %f14
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.35417
	add	%a0, %zero, %zero
	j	fbgt_cont.35418
fbgt_else.35417:
	add	%a0, %zero, %k1
fbgt_cont.35418:
	beqi	%a0, 0, bnei_else.35419
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35416
bnei_else.35419:
	add	%a0, %zero, %zero
bnei_cont.35420:
	j	bnei_cont.35416
bnei_else.35415:
	add	%a0, %zero, %zero
bnei_cont.35416:
bnei_cont.35404:
	beqi	%a0, 0, bnei_else.35421
	addi	%a0, %zero, 2
	j	bnei_cont.35422
bnei_else.35421:
	flw	%f1, 2(%t9)
	fbne	%f1, %fzero, fbeq_else.35423
	add	%a0, %zero, %k1
	j	fbeq_cont.35424
fbeq_else.35423:
	add	%a0, %zero, %zero
fbeq_cont.35424:
	beqi	%a0, 0, bnei_else.35425
	add	%a0, %zero, %zero
	j	bnei_cont.35426
bnei_else.35425:
	fblt	%f1, %fzero, fbgt_else.35427
	add	%a0, %zero, %zero
	j	fbgt_cont.35428
fbgt_else.35427:
	add	%a0, %zero, %k1
fbgt_cont.35428:
	beqi	%a2, 0, bnei_else.35429
	beqi	%a0, 0, bnei_else.35431
	add	%a0, %zero, %zero
	j	bnei_cont.35430
bnei_else.35431:
	add	%a0, %zero, %k1
bnei_cont.35432:
	j	bnei_cont.35430
bnei_else.35429:
bnei_cont.35430:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.35433
	j	bnei_cont.35434
bnei_else.35433:
	fneg	%f0, %f0
bnei_cont.35434:
	fsub	%f0, %f0, %f16
	fdiv	%f13, %f0, %f1
	fmul	%f0, %f13, %f12
	fadd	%f0, %f0, %f14
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.35435
	add	%a0, %zero, %zero
	j	fbgt_cont.35436
fbgt_else.35435:
	add	%a0, %zero, %k1
fbgt_cont.35436:
	beqi	%a0, 0, bnei_else.35437
	fmul	%f0, %f13, %f11
	fadd	%f0, %f0, %f15
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.35439
	add	%a0, %zero, %zero
	j	fbgt_cont.35440
fbgt_else.35439:
	add	%a0, %zero, %k1
fbgt_cont.35440:
	beqi	%a0, 0, bnei_else.35441
	fsw	%f13, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35438
bnei_else.35441:
	add	%a0, %zero, %zero
bnei_cont.35442:
	j	bnei_cont.35438
bnei_else.35437:
	add	%a0, %zero, %zero
bnei_cont.35438:
bnei_cont.35426:
	beqi	%a0, 0, bnei_else.35443
	addi	%a0, %zero, 3
	j	bnei_cont.35444
bnei_else.35443:
	add	%a0, %zero, %zero
bnei_cont.35444:
bnei_cont.35422:
bnei_cont.35400:
bnei_cont.35354:
	beqi	%a0, 0, bnei_cont.35352
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.35447
	add	%a0, %zero, %zero
	j	fbgt_cont.35448
fbgt_else.35447:
	add	%a0, %zero, %k1
fbgt_cont.35448:
	beqi	%a0, 0, bnei_cont.35352
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.35352
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35352
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35352
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35352
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.35352
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.35352
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -4
	j	bnei_cont.35352
bnei_else.35461:
bnei_cont.35462:
	j	bnei_cont.35352
bnei_else.35459:
bnei_cont.35460:
	j	bnei_cont.35352
bnei_else.35457:
bnei_cont.35458:
	j	bnei_cont.35352
bnei_else.35455:
bnei_cont.35456:
	j	bnei_cont.35352
bnei_else.35453:
bnei_cont.35454:
	j	bnei_cont.35352
bnei_else.35451:
bnei_cont.35452:
	j	bnei_cont.35352
bnei_else.35449:
bnei_cont.35450:
	j	bnei_cont.35352
bnei_else.35445:
bnei_cont.35446:
	j	bnei_cont.35352
bnei_else.35351:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.35463
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35464
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35464
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35464
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.35464
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.35464
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0
	addi	%v1, %s6, 0
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -4
	j	bnei_cont.35464
bnei_else.35473:
bnei_cont.35474:
	j	bnei_cont.35464
bnei_else.35471:
bnei_cont.35472:
	j	bnei_cont.35464
bnei_else.35469:
bnei_cont.35470:
	j	bnei_cont.35464
bnei_else.35467:
bnei_cont.35468:
	j	bnei_cont.35464
bnei_else.35465:
bnei_cont.35466:
	j	bnei_cont.35464
bnei_else.35463:
bnei_cont.35464:
bnei_cont.35352:
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %t9, 0
	j	trace_or_matrix.2930
bnei_else.35350:
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.35221:
	jr	%ra
solve_each_element_fast.2936:
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0
	add	%s3, %zero, %ra
	lw	%fp, 1(%s2)
	lw	%a1, 0(%s2)
	add	%at, %v1, %s1
	lw	%s4, 0(%at)
	beqi	%s4, -1, bnei_else.35669
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
	beqi	%a0, 1, bnei_else.35670
	beqi	%a0, 2, bnei_else.35672
	flw	%f12, 0(%fp)
	fbne	%f12, %fzero, fbeq_else.35674
	add	%a0, %zero, %k1
	j	fbeq_cont.35675
fbeq_else.35674:
	add	%a0, %zero, %zero
fbeq_cont.35675:
	beqi	%a0, 0, bnei_else.35676
	add	%s5, %zero, %zero
	j	bnei_cont.35671
bnei_else.35676:
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
	fblt	%fzero, %f0, fbgt_else.35678
	add	%a0, %zero, %zero
	j	fbgt_cont.35679
fbgt_else.35678:
	add	%a0, %zero, %k1
fbgt_cont.35679:
	beqi	%a0, 0, bnei_else.35680
	beqi	%a2, 0, bnei_else.35682
	fsqrt	%f0, %f0
	fadd	%f1, %f11, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.35683
bnei_else.35682:
	fsqrt	%f0, %f0
	fsub	%f1, %f11, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.35683:
	add	%s5, %zero, %k1
	j	bnei_cont.35671
bnei_else.35680:
	add	%s5, %zero, %zero
bnei_cont.35681:
bnei_cont.35677:
	j	bnei_cont.35671
bnei_else.35672:
	flw	%f1, 0(%fp)
	fblt	%f1, %fzero, fbgt_else.35684
	add	%a0, %zero, %zero
	j	fbgt_cont.35685
fbgt_else.35684:
	add	%a0, %zero, %k1
fbgt_cont.35685:
	beqi	%a0, 0, bnei_else.35686
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.35671
bnei_else.35686:
	add	%s5, %zero, %zero
bnei_cont.35687:
bnei_cont.35673:
	j	bnei_cont.35671
bnei_else.35670:
	flw	%f0, 0(%fp)
	fsub	%f0, %f0, %f15
	flw	%f17, 1(%fp)
	fmul	%f16, %f0, %f17
	flw	%f14, 1(%a1)
	fmul	%f0, %f16, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	flw	%f12, 1(%k0)
	fblt	%f0, %f12, fbgt_else.35688
	add	%a0, %zero, %zero
	j	fbgt_cont.35689
fbgt_else.35688:
	add	%a0, %zero, %k1
fbgt_cont.35689:
	beqi	%a0, 0, bnei_else.35690
	flw	%f0, 2(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.35692
	add	%a0, %zero, %zero
	j	fbgt_cont.35693
fbgt_else.35692:
	add	%a0, %zero, %k1
fbgt_cont.35693:
	beqi	%a0, 0, bnei_else.35694
	fbne	%f17, %fzero, fbeq_else.35696
	add	%a0, %zero, %k1
	j	fbeq_cont.35697
fbeq_else.35696:
	add	%a0, %zero, %zero
fbeq_cont.35697:
	beqi	%a0, 0, bnei_else.35698
	add	%a0, %zero, %zero
	j	bnei_cont.35691
bnei_else.35698:
	add	%a0, %zero, %k1
bnei_cont.35699:
	j	bnei_cont.35691
bnei_else.35694:
	add	%a0, %zero, %zero
bnei_cont.35695:
	j	bnei_cont.35691
bnei_else.35690:
	add	%a0, %zero, %zero
bnei_cont.35691:
	beqi	%a0, 0, bnei_else.35700
	fsw	%f16, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.35701
bnei_else.35700:
	flw	%f0, 2(%fp)
	fsub	%f0, %f0, %f11
	flw	%f19, 3(%fp)
	fmul	%f16, %f0, %f19
	flw	%f18, 0(%a1)
	fmul	%f0, %f16, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f17, 0(%k0)
	fblt	%f0, %f17, fbgt_else.35702
	add	%a0, %zero, %zero
	j	fbgt_cont.35703
fbgt_else.35702:
	add	%a0, %zero, %k1
fbgt_cont.35703:
	beqi	%a0, 0, bnei_else.35704
	flw	%f0, 2(%a1)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.35706
	add	%a0, %zero, %zero
	j	fbgt_cont.35707
fbgt_else.35706:
	add	%a0, %zero, %k1
fbgt_cont.35707:
	beqi	%a0, 0, bnei_else.35708
	fbne	%f19, %fzero, fbeq_else.35710
	add	%a0, %zero, %k1
	j	fbeq_cont.35711
fbeq_else.35710:
	add	%a0, %zero, %zero
fbeq_cont.35711:
	beqi	%a0, 0, bnei_else.35712
	add	%a0, %zero, %zero
	j	bnei_cont.35705
bnei_else.35712:
	add	%a0, %zero, %k1
bnei_cont.35713:
	j	bnei_cont.35705
bnei_else.35708:
	add	%a0, %zero, %zero
bnei_cont.35709:
	j	bnei_cont.35705
bnei_else.35704:
	add	%a0, %zero, %zero
bnei_cont.35705:
	beqi	%a0, 0, bnei_else.35714
	fsw	%f16, 135(%zero)
	addi	%s5, %zero, 2
	j	bnei_cont.35715
bnei_else.35714:
	flw	%f0, 4(%fp)
	fsub	%f0, %f0, %f13
	flw	%f13, 5(%fp)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.35716
	add	%a0, %zero, %zero
	j	fbgt_cont.35717
fbgt_else.35716:
	add	%a0, %zero, %k1
fbgt_cont.35717:
	beqi	%a0, 0, bnei_else.35718
	fmul	%f0, %f1, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.35720
	add	%a0, %zero, %zero
	j	fbgt_cont.35721
fbgt_else.35720:
	add	%a0, %zero, %k1
fbgt_cont.35721:
	beqi	%a0, 0, bnei_else.35722
	fbne	%f13, %fzero, fbeq_else.35724
	add	%a0, %zero, %k1
	j	fbeq_cont.35725
fbeq_else.35724:
	add	%a0, %zero, %zero
fbeq_cont.35725:
	beqi	%a0, 0, bnei_else.35726
	add	%a0, %zero, %zero
	j	bnei_cont.35719
bnei_else.35726:
	add	%a0, %zero, %k1
bnei_cont.35727:
	j	bnei_cont.35719
bnei_else.35722:
	add	%a0, %zero, %zero
bnei_cont.35723:
	j	bnei_cont.35719
bnei_else.35718:
	add	%a0, %zero, %zero
bnei_cont.35719:
	beqi	%a0, 0, bnei_else.35728
	fsw	%f1, 135(%zero)
	addi	%s5, %zero, 3
	j	bnei_cont.35729
bnei_else.35728:
	add	%s5, %zero, %zero
bnei_cont.35729:
bnei_cont.35715:
bnei_cont.35701:
bnei_cont.35671:
	beqi	%s5, 0, bnei_else.35730
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.35731
	add	%a0, %zero, %zero
	j	fbgt_cont.35732
fbgt_else.35731:
	add	%a0, %zero, %k1
fbgt_cont.35732:
	beqi	%a0, 0, bnei_else.35733
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.35735
	add	%a0, %zero, %zero
	j	fbgt_cont.35736
fbgt_else.35735:
	add	%a0, %zero, %k1
fbgt_cont.35736:
	beqi	%a0, 0, bnei_cont.35734
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
	beqi	%a0, -1, bnei_else.35739
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
	beqi	%a2, 1, bnei_else.35741
	beqi	%a2, 2, bnei_else.35743
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
	beqi	%fp, 0, bnei_else.35745
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
	j	bnei_cont.35746
bnei_else.35745:
bnei_cont.35746:
	beqi	%a2, 3, bnei_else.35747
	j	bnei_cont.35748
bnei_else.35747:
	fsub	%f11, %f11, %f30
bnei_cont.35748:
	fblt	%f11, %fzero, fbgt_else.35749
	add	%a0, %zero, %zero
	j	fbgt_cont.35750
fbgt_else.35749:
	add	%a0, %zero, %k1
fbgt_cont.35750:
	beqi	%a1, 0, bnei_else.35751
	beqi	%a0, 0, bnei_else.35753
	add	%a0, %zero, %zero
	j	bnei_cont.35752
bnei_else.35753:
	add	%a0, %zero, %k1
bnei_cont.35754:
	j	bnei_cont.35752
bnei_else.35751:
bnei_cont.35752:
	beqi	%a0, 0, bnei_else.35755
	add	%a1, %zero, %zero
	j	bnei_cont.35742
bnei_else.35755:
	add	%a1, %zero, %k1
bnei_cont.35756:
	j	bnei_cont.35742
bnei_else.35743:
	flw	%f11, 0(%k0)
	fmul	%f12, %f11, %f14
	flw	%f11, 1(%k0)
	fmul	%f11, %f11, %f15
	fadd	%f12, %f12, %f11
	flw	%f11, 2(%k0)
	fmul	%f11, %f11, %f16
	fadd	%f11, %f12, %f11
	fblt	%f11, %fzero, fbgt_else.35757
	add	%a0, %zero, %zero
	j	fbgt_cont.35758
fbgt_else.35757:
	add	%a0, %zero, %k1
fbgt_cont.35758:
	beqi	%a1, 0, bnei_else.35759
	beqi	%a0, 0, bnei_else.35761
	add	%a0, %zero, %zero
	j	bnei_cont.35760
bnei_else.35761:
	add	%a0, %zero, %k1
bnei_cont.35762:
	j	bnei_cont.35760
bnei_else.35759:
bnei_cont.35760:
	beqi	%a0, 0, bnei_else.35763
	add	%a1, %zero, %zero
	j	bnei_cont.35742
bnei_else.35763:
	add	%a1, %zero, %k1
bnei_cont.35764:
bnei_cont.35744:
	j	bnei_cont.35742
bnei_else.35741:
	fabs	%f12, %f14
	flw	%f11, 0(%k0)
	fblt	%f12, %f11, fbgt_else.35765
	add	%a0, %zero, %zero
	j	fbgt_cont.35766
fbgt_else.35765:
	add	%a0, %zero, %k1
fbgt_cont.35766:
	beqi	%a0, 0, bnei_else.35767
	fabs	%f12, %f15
	flw	%f11, 1(%k0)
	fblt	%f12, %f11, fbgt_else.35769
	add	%a0, %zero, %zero
	j	fbgt_cont.35770
fbgt_else.35769:
	add	%a0, %zero, %k1
fbgt_cont.35770:
	beqi	%a0, 0, bnei_else.35771
	fabs	%f12, %f16
	flw	%f11, 2(%k0)
	fblt	%f12, %f11, fbgt_else.35773
	add	%a0, %zero, %zero
	j	bnei_cont.35768
fbgt_else.35773:
	add	%a0, %zero, %k1
fbgt_cont.35774:
	j	bnei_cont.35768
bnei_else.35771:
	add	%a0, %zero, %zero
bnei_cont.35772:
	j	bnei_cont.35768
bnei_else.35767:
	add	%a0, %zero, %zero
bnei_cont.35768:
	beqi	%a0, 0, bnei_else.35775
	j	bnei_cont.35776
bnei_else.35775:
	beqi	%a1, 0, bnei_else.35777
	add	%a1, %zero, %zero
	j	bnei_cont.35778
bnei_else.35777:
	add	%a1, %zero, %k1
bnei_cont.35778:
bnei_cont.35776:
bnei_cont.35742:
	beqi	%a1, 0, bnei_else.35779
	add	%v0, %zero, %zero
	j	bnei_cont.35740
bnei_else.35779:
	addi	%v0, %k1, 0
	jal	check_all_inside.2907
bnei_cont.35780:
	j	bnei_cont.35740
bnei_else.35739:
	add	%v0, %zero, %k1
bnei_cont.35740:
	beqi	%v0, 0, bnei_cont.35734
	fsw	%f17, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s4, 141(%zero)
	sw	%s5, 136(%zero)
	j	bnei_cont.35734
bnei_else.35781:
bnei_cont.35782:
	j	bnei_cont.35734
bnei_else.35737:
bnei_cont.35738:
	j	bnei_cont.35734
bnei_else.35733:
bnei_cont.35734:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936
bnei_else.35730:
	beqi	%a2, 0, bnei_else.35783
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936
bnei_else.35783:
	add	%ra, %zero, %s3
	jr	%ra
bnei_else.35669:
	add	%ra, %zero, %s3
	jr	%ra
solve_one_or_network_fast.2940:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35831
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35832
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35833
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35834
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35835
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35836
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35837
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35838
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%v0, %s6, 1
	add	%ra, %zero, %t8
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0
	j	solve_one_or_network_fast.2940
bnei_else.35838:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35837:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35836:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35835:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35834:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35833:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35832:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35831:
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
	beqi	%s0, -1, bnei_else.36450
	beqi	%s0, 99, bnei_else.36451
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
	beqi	%a1, 1, bnei_else.36453
	beqi	%a1, 2, bnei_else.36455
	flw	%f12, 0(%ra)
	fbne	%f12, %fzero, fbeq_else.36457
	add	%a0, %zero, %k1
	j	fbeq_cont.36458
fbeq_else.36457:
	add	%a0, %zero, %zero
fbeq_cont.36458:
	beqi	%a0, 0, bnei_else.36459
	add	%a0, %zero, %zero
	j	bnei_cont.36454
bnei_else.36459:
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
	fblt	%fzero, %f0, fbgt_else.36461
	add	%a0, %zero, %zero
	j	fbgt_cont.36462
fbgt_else.36461:
	add	%a0, %zero, %k1
fbgt_cont.36462:
	beqi	%a0, 0, bnei_else.36463
	beqi	%a2, 0, bnei_else.36465
	fsqrt	%f0, %f0
	fadd	%f1, %f11, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.36466
bnei_else.36465:
	fsqrt	%f0, %f0
	fsub	%f1, %f11, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.36466:
	add	%a0, %zero, %k1
	j	bnei_cont.36454
bnei_else.36463:
	add	%a0, %zero, %zero
bnei_cont.36464:
bnei_cont.36460:
	j	bnei_cont.36454
bnei_else.36455:
	flw	%f1, 0(%ra)
	fblt	%f1, %fzero, fbgt_else.36467
	add	%a0, %zero, %zero
	j	fbgt_cont.36468
fbgt_else.36467:
	add	%a0, %zero, %k1
fbgt_cont.36468:
	beqi	%a0, 0, bnei_else.36469
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36454
bnei_else.36469:
	add	%a0, %zero, %zero
bnei_cont.36470:
bnei_cont.36456:
	j	bnei_cont.36454
bnei_else.36453:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f15
	flw	%f17, 1(%ra)
	fmul	%f16, %f0, %f17
	flw	%f14, 1(%k0)
	fmul	%f0, %f16, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	flw	%f12, 1(%fp)
	fblt	%f0, %f12, fbgt_else.36471
	add	%a0, %zero, %zero
	j	fbgt_cont.36472
fbgt_else.36471:
	add	%a0, %zero, %k1
fbgt_cont.36472:
	beqi	%a0, 0, bnei_else.36473
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.36475
	add	%a0, %zero, %zero
	j	fbgt_cont.36476
fbgt_else.36475:
	add	%a0, %zero, %k1
fbgt_cont.36476:
	beqi	%a0, 0, bnei_else.36477
	fbne	%f17, %fzero, fbeq_else.36479
	add	%a0, %zero, %k1
	j	fbeq_cont.36480
fbeq_else.36479:
	add	%a0, %zero, %zero
fbeq_cont.36480:
	beqi	%a0, 0, bnei_else.36481
	add	%a0, %zero, %zero
	j	bnei_cont.36474
bnei_else.36481:
	add	%a0, %zero, %k1
bnei_cont.36482:
	j	bnei_cont.36474
bnei_else.36477:
	add	%a0, %zero, %zero
bnei_cont.36478:
	j	bnei_cont.36474
bnei_else.36473:
	add	%a0, %zero, %zero
bnei_cont.36474:
	beqi	%a0, 0, bnei_else.36483
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36484
bnei_else.36483:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f11
	flw	%f19, 3(%ra)
	fmul	%f16, %f0, %f19
	flw	%f18, 0(%k0)
	fmul	%f0, %f16, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f17, 0(%fp)
	fblt	%f0, %f17, fbgt_else.36485
	add	%a0, %zero, %zero
	j	fbgt_cont.36486
fbgt_else.36485:
	add	%a0, %zero, %k1
fbgt_cont.36486:
	beqi	%a0, 0, bnei_else.36487
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.36489
	add	%a0, %zero, %zero
	j	fbgt_cont.36490
fbgt_else.36489:
	add	%a0, %zero, %k1
fbgt_cont.36490:
	beqi	%a0, 0, bnei_else.36491
	fbne	%f19, %fzero, fbeq_else.36493
	add	%a0, %zero, %k1
	j	fbeq_cont.36494
fbeq_else.36493:
	add	%a0, %zero, %zero
fbeq_cont.36494:
	beqi	%a0, 0, bnei_else.36495
	add	%a0, %zero, %zero
	j	bnei_cont.36488
bnei_else.36495:
	add	%a0, %zero, %k1
bnei_cont.36496:
	j	bnei_cont.36488
bnei_else.36491:
	add	%a0, %zero, %zero
bnei_cont.36492:
	j	bnei_cont.36488
bnei_else.36487:
	add	%a0, %zero, %zero
bnei_cont.36488:
	beqi	%a0, 0, bnei_else.36497
	fsw	%f16, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36498
bnei_else.36497:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f13
	flw	%f13, 5(%ra)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.36499
	add	%a0, %zero, %zero
	j	fbgt_cont.36500
fbgt_else.36499:
	add	%a0, %zero, %k1
fbgt_cont.36500:
	beqi	%a0, 0, bnei_else.36501
	fmul	%f0, %f1, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.36503
	add	%a0, %zero, %zero
	j	fbgt_cont.36504
fbgt_else.36503:
	add	%a0, %zero, %k1
fbgt_cont.36504:
	beqi	%a0, 0, bnei_else.36505
	fbne	%f13, %fzero, fbeq_else.36507
	add	%a0, %zero, %k1
	j	fbeq_cont.36508
fbeq_else.36507:
	add	%a0, %zero, %zero
fbeq_cont.36508:
	beqi	%a0, 0, bnei_else.36509
	add	%a0, %zero, %zero
	j	bnei_cont.36502
bnei_else.36509:
	add	%a0, %zero, %k1
bnei_cont.36510:
	j	bnei_cont.36502
bnei_else.36505:
	add	%a0, %zero, %zero
bnei_cont.36506:
	j	bnei_cont.36502
bnei_else.36501:
	add	%a0, %zero, %zero
bnei_cont.36502:
	beqi	%a0, 0, bnei_else.36511
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36512
bnei_else.36511:
	add	%a0, %zero, %zero
bnei_cont.36512:
bnei_cont.36498:
bnei_cont.36484:
bnei_cont.36454:
	beqi	%a0, 0, bnei_cont.36452
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.36515
	add	%a0, %zero, %zero
	j	fbgt_cont.36516
fbgt_else.36515:
	add	%a0, %zero, %k1
fbgt_cont.36516:
	beqi	%a0, 0, bnei_cont.36452
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.36452
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.36452
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.36452
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.36452
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.36452
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.36452
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.36452
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
	j	bnei_cont.36452
bnei_else.36531:
bnei_cont.36532:
	j	bnei_cont.36452
bnei_else.36529:
bnei_cont.36530:
	j	bnei_cont.36452
bnei_else.36527:
bnei_cont.36528:
	j	bnei_cont.36452
bnei_else.36525:
bnei_cont.36526:
	j	bnei_cont.36452
bnei_else.36523:
bnei_cont.36524:
	j	bnei_cont.36452
bnei_else.36521:
bnei_cont.36522:
	j	bnei_cont.36452
bnei_else.36519:
bnei_cont.36520:
	j	bnei_cont.36452
bnei_else.36517:
bnei_cont.36518:
	j	bnei_cont.36452
bnei_else.36513:
bnei_cont.36514:
	j	bnei_cont.36452
bnei_else.36451:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.36533
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.36534
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.36534
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.36534
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.36534
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.36534
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.36534
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
	j	bnei_cont.36534
bnei_else.36545:
bnei_cont.36546:
	j	bnei_cont.36534
bnei_else.36543:
bnei_cont.36544:
	j	bnei_cont.36534
bnei_else.36541:
bnei_cont.36542:
	j	bnei_cont.36534
bnei_else.36539:
bnei_cont.36540:
	j	bnei_cont.36534
bnei_else.36537:
bnei_cont.36538:
	j	bnei_cont.36534
bnei_else.36535:
bnei_cont.36536:
	j	bnei_cont.36534
bnei_else.36533:
bnei_cont.36534:
bnei_cont.36452:
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%a1, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%s6, 0(%at)
	lw	%ra, 0(%s6)
	beqi	%ra, -1, bnei_else.36547
	beqi	%ra, 99, bnei_else.36548
	lw	%a0, 12(%ra)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	flw	%f13, 2(%a3)
	lw	%a0, 1(%t9)
	lw	%k0, 0(%t9)
	add	%at, %a0, %ra
	lw	%ra, 0(%at)
	beqi	%a1, 1, bnei_else.36550
	beqi	%a1, 2, bnei_else.36552
	flw	%f12, 0(%ra)
	fbne	%f12, %fzero, fbeq_else.36554
	add	%a0, %zero, %k1
	j	fbeq_cont.36555
fbeq_else.36554:
	add	%a0, %zero, %zero
fbeq_cont.36555:
	beqi	%a0, 0, bnei_else.36556
	add	%a0, %zero, %zero
	j	bnei_cont.36551
bnei_else.36556:
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
	fblt	%fzero, %f0, fbgt_else.36558
	add	%a0, %zero, %zero
	j	fbgt_cont.36559
fbgt_else.36558:
	add	%a0, %zero, %k1
fbgt_cont.36559:
	beqi	%a0, 0, bnei_else.36560
	beqi	%a2, 0, bnei_else.36562
	fsqrt	%f0, %f0
	fadd	%f1, %f11, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.36563
bnei_else.36562:
	fsqrt	%f0, %f0
	fsub	%f1, %f11, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.36563:
	add	%a0, %zero, %k1
	j	bnei_cont.36551
bnei_else.36560:
	add	%a0, %zero, %zero
bnei_cont.36561:
bnei_cont.36557:
	j	bnei_cont.36551
bnei_else.36552:
	flw	%f1, 0(%ra)
	fblt	%f1, %fzero, fbgt_else.36564
	add	%a0, %zero, %zero
	j	fbgt_cont.36565
fbgt_else.36564:
	add	%a0, %zero, %k1
fbgt_cont.36565:
	beqi	%a0, 0, bnei_else.36566
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36551
bnei_else.36566:
	add	%a0, %zero, %zero
bnei_cont.36567:
bnei_cont.36553:
	j	bnei_cont.36551
bnei_else.36550:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f15
	flw	%f17, 1(%ra)
	fmul	%f16, %f0, %f17
	flw	%f14, 1(%k0)
	fmul	%f0, %f16, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	flw	%f12, 1(%fp)
	fblt	%f0, %f12, fbgt_else.36568
	add	%a0, %zero, %zero
	j	fbgt_cont.36569
fbgt_else.36568:
	add	%a0, %zero, %k1
fbgt_cont.36569:
	beqi	%a0, 0, bnei_else.36570
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.36572
	add	%a0, %zero, %zero
	j	fbgt_cont.36573
fbgt_else.36572:
	add	%a0, %zero, %k1
fbgt_cont.36573:
	beqi	%a0, 0, bnei_else.36574
	fbne	%f17, %fzero, fbeq_else.36576
	add	%a0, %zero, %k1
	j	fbeq_cont.36577
fbeq_else.36576:
	add	%a0, %zero, %zero
fbeq_cont.36577:
	beqi	%a0, 0, bnei_else.36578
	add	%a0, %zero, %zero
	j	bnei_cont.36571
bnei_else.36578:
	add	%a0, %zero, %k1
bnei_cont.36579:
	j	bnei_cont.36571
bnei_else.36574:
	add	%a0, %zero, %zero
bnei_cont.36575:
	j	bnei_cont.36571
bnei_else.36570:
	add	%a0, %zero, %zero
bnei_cont.36571:
	beqi	%a0, 0, bnei_else.36580
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36581
bnei_else.36580:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f11
	flw	%f19, 3(%ra)
	fmul	%f16, %f0, %f19
	flw	%f18, 0(%k0)
	fmul	%f0, %f16, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f17, 0(%fp)
	fblt	%f0, %f17, fbgt_else.36582
	add	%a0, %zero, %zero
	j	fbgt_cont.36583
fbgt_else.36582:
	add	%a0, %zero, %k1
fbgt_cont.36583:
	beqi	%a0, 0, bnei_else.36584
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.36586
	add	%a0, %zero, %zero
	j	fbgt_cont.36587
fbgt_else.36586:
	add	%a0, %zero, %k1
fbgt_cont.36587:
	beqi	%a0, 0, bnei_else.36588
	fbne	%f19, %fzero, fbeq_else.36590
	add	%a0, %zero, %k1
	j	fbeq_cont.36591
fbeq_else.36590:
	add	%a0, %zero, %zero
fbeq_cont.36591:
	beqi	%a0, 0, bnei_else.36592
	add	%a0, %zero, %zero
	j	bnei_cont.36585
bnei_else.36592:
	add	%a0, %zero, %k1
bnei_cont.36593:
	j	bnei_cont.36585
bnei_else.36588:
	add	%a0, %zero, %zero
bnei_cont.36589:
	j	bnei_cont.36585
bnei_else.36584:
	add	%a0, %zero, %zero
bnei_cont.36585:
	beqi	%a0, 0, bnei_else.36594
	fsw	%f16, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36595
bnei_else.36594:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f13
	flw	%f13, 5(%ra)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f18
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.36596
	add	%a0, %zero, %zero
	j	fbgt_cont.36597
fbgt_else.36596:
	add	%a0, %zero, %k1
fbgt_cont.36597:
	beqi	%a0, 0, bnei_else.36598
	fmul	%f0, %f1, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.36600
	add	%a0, %zero, %zero
	j	fbgt_cont.36601
fbgt_else.36600:
	add	%a0, %zero, %k1
fbgt_cont.36601:
	beqi	%a0, 0, bnei_else.36602
	fbne	%f13, %fzero, fbeq_else.36604
	add	%a0, %zero, %k1
	j	fbeq_cont.36605
fbeq_else.36604:
	add	%a0, %zero, %zero
fbeq_cont.36605:
	beqi	%a0, 0, bnei_else.36606
	add	%a0, %zero, %zero
	j	bnei_cont.36599
bnei_else.36606:
	add	%a0, %zero, %k1
bnei_cont.36607:
	j	bnei_cont.36599
bnei_else.36602:
	add	%a0, %zero, %zero
bnei_cont.36603:
	j	bnei_cont.36599
bnei_else.36598:
	add	%a0, %zero, %zero
bnei_cont.36599:
	beqi	%a0, 0, bnei_else.36608
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36609
bnei_else.36608:
	add	%a0, %zero, %zero
bnei_cont.36609:
bnei_cont.36595:
bnei_cont.36581:
bnei_cont.36551:
	beqi	%a0, 0, bnei_cont.36549
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.36612
	add	%a0, %zero, %zero
	j	fbgt_cont.36613
fbgt_else.36612:
	add	%a0, %zero, %k1
fbgt_cont.36613:
	beqi	%a0, 0, bnei_cont.36549
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.36549
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.36549
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.36549
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.36549
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.36549
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.36549
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
	j	bnei_cont.36549
bnei_else.36626:
bnei_cont.36627:
	j	bnei_cont.36549
bnei_else.36624:
bnei_cont.36625:
	j	bnei_cont.36549
bnei_else.36622:
bnei_cont.36623:
	j	bnei_cont.36549
bnei_else.36620:
bnei_cont.36621:
	j	bnei_cont.36549
bnei_else.36618:
bnei_cont.36619:
	j	bnei_cont.36549
bnei_else.36616:
bnei_cont.36617:
	j	bnei_cont.36549
bnei_else.36614:
bnei_cont.36615:
	j	bnei_cont.36549
bnei_else.36610:
bnei_cont.36611:
	j	bnei_cont.36549
bnei_else.36548:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.36628
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.36629
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.36629
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.36629
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.36629
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.36629
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
	j	bnei_cont.36629
bnei_else.36638:
bnei_cont.36639:
	j	bnei_cont.36629
bnei_else.36636:
bnei_cont.36637:
	j	bnei_cont.36629
bnei_else.36634:
bnei_cont.36635:
	j	bnei_cont.36629
bnei_else.36632:
bnei_cont.36633:
	j	bnei_cont.36629
bnei_else.36630:
bnei_cont.36631:
	j	bnei_cont.36629
bnei_else.36628:
bnei_cont.36629:
bnei_cont.36549:
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %t9, 0
	j	trace_or_matrix_fast.2944
bnei_else.36547:
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.36450:
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
	beqi	%a2, 1, bnei_else.36771
	beqi	%a2, 2, bnei_else.36772
	beqi	%a2, 3, bnei_else.36773
	beqi	%a2, 4, bnei_else.36774
	jr	%ra
bnei_else.36774:
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
	flw	%f11, 464(%zero)
	fblt	%f0, %f11, fbgt_else.36776
	add	%a0, %zero, %zero
	j	fbgt_cont.36777
fbgt_else.36776:
	add	%a0, %zero, %k1
fbgt_cont.36777:
	beqi	%a0, 0, bnei_else.36778
	flw	%f1, 463(%zero)
	j	bnei_cont.36779
bnei_else.36778:
	fdiv	%f0, %f13, %f14
	fabs	%f15, %f0
	fblt	%f15, %fzero, fbgt_else.36780
	add	%a0, %zero, %k1
	j	fbgt_cont.36781
fbgt_else.36780:
	add	%a0, %zero, %zero
fbgt_cont.36781:
	fabs	%f14, %f15
	flw	%f0, 462(%zero)
	fblt	%f14, %f0, fbgt_else.36782
	flw	%f0, 455(%zero)
	fblt	%f14, %f0, fbgt_else.36784
	flw	%f13, 480(%zero)
	fdiv	%f16, %f30, %f14
	fmul	%f17, %f16, %f16
	fmul	%f15, %f17, %f17
	fmul	%f14, %f15, %f15
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fsub	%f1, %f16, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f15
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f15
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f0, %f1, %f0
	fsub	%f0, %f13, %f0
	j	fbgt_cont.36785
fbgt_else.36784:
	flw	%f13, 479(%zero)
	fsub	%f1, %f14, %f30
	fadd	%f0, %f14, %f30
	fdiv	%f16, %f1, %f0
	fmul	%f17, %f16, %f16
	fmul	%f15, %f17, %f17
	fmul	%f14, %f15, %f15
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fsub	%f1, %f16, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f15
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f15
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f0, %f1, %f0
	fadd	%f0, %f13, %f0
fbgt_cont.36785:
	beqi	%a0, 0, bnei_else.36786
	j	fbgt_cont.36783
bnei_else.36786:
	fneg	%f0, %f0
bnei_cont.36787:
	j	fbgt_cont.36783
fbgt_else.36782:
	fmul	%f16, %f15, %f15
	fmul	%f14, %f16, %f16
	fmul	%f13, %f14, %f14
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fsub	%f1, %f15, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f13
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fadd	%f0, %f1, %f0
fbgt_cont.36783:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.36779:
	floor	%f0, %f1
	fsub	%f13, %f1, %f0
	flw	%f1, 1(%v1)
	flw	%f0, 1(%a3)
	fsub	%f1, %f1, %f0
	flw	%f0, 1(%a1)
	fsqrt	%f0, %f0
	fmul	%f1, %f1, %f0
	fabs	%f0, %f12
	fblt	%f0, %f11, fbgt_else.36788
	add	%a0, %zero, %zero
	j	fbgt_cont.36789
fbgt_else.36788:
	add	%a0, %zero, %k1
fbgt_cont.36789:
	beqi	%a0, 0, bnei_else.36790
	flw	%f1, 463(%zero)
	j	bnei_cont.36791
bnei_else.36790:
	fdiv	%f0, %f1, %f12
	fabs	%f14, %f0
	fblt	%f14, %fzero, fbgt_else.36792
	add	%a0, %zero, %k1
	j	fbgt_cont.36793
fbgt_else.36792:
	add	%a0, %zero, %zero
fbgt_cont.36793:
	fabs	%f12, %f14
	flw	%f0, 462(%zero)
	fblt	%f12, %f0, fbgt_else.36794
	flw	%f0, 455(%zero)
	fblt	%f12, %f0, fbgt_else.36796
	flw	%f11, 480(%zero)
	fdiv	%f15, %f30, %f12
	fmul	%f16, %f15, %f15
	fmul	%f14, %f16, %f16
	fmul	%f12, %f14, %f14
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fsub	%f1, %f15, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	fsub	%f0, %f11, %f0
	j	fbgt_cont.36797
fbgt_else.36796:
	flw	%f11, 479(%zero)
	fsub	%f1, %f12, %f30
	fadd	%f0, %f12, %f30
	fdiv	%f15, %f1, %f0
	fmul	%f16, %f15, %f15
	fmul	%f14, %f16, %f16
	fmul	%f12, %f14, %f14
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fsub	%f1, %f15, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f14
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
fbgt_cont.36797:
	beqi	%a0, 0, bnei_else.36798
	j	fbgt_cont.36795
bnei_else.36798:
	fneg	%f0, %f0
bnei_cont.36799:
	j	fbgt_cont.36795
fbgt_else.36794:
	fmul	%f15, %f14, %f14
	fmul	%f12, %f15, %f15
	fmul	%f11, %f12, %f12
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fsub	%f1, %f14, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f15
	fmul	%f0, %f0, %f11
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fmul	%f0, %f0, %f11
	fadd	%f0, %f1, %f0
fbgt_cont.36795:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.36791:
	floor	%f0, %f1
	fsub	%f12, %f1, %f0
	flw	%f1, 452(%zero)
	flw	%f11, 474(%zero)
	fsub	%f0, %f11, %f13
	fmul	%f0, %f0, %f0
	fsub	%f1, %f1, %f0
	fsub	%f0, %f11, %f12
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	fblt	%f0, %fzero, fbgt_else.36800
	add	%a0, %zero, %zero
	j	fbgt_cont.36801
fbgt_else.36800:
	add	%a0, %zero, %k1
fbgt_cont.36801:
	beqi	%a0, 0, bnei_else.36802
	fmov	%f0, %fzero
	j	bnei_cont.36803
bnei_else.36802:
bnei_cont.36803:
	flw	%f1, 451(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 450(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.36773:
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
	flw	%f12, 482(%zero)
	fabs	%f11, %f0
	flw	%f1, 481(%zero)
	fdiv	%f0, %f11, %f1
	floor	%f0, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f11, %f0
	fblt	%f0, %f12, fbgt_else.36805
	add	%a0, %zero, %zero
	j	fbgt_cont.36806
fbgt_else.36805:
	add	%a0, %zero, %k1
fbgt_cont.36806:
	fblt	%f0, %f12, fbgt_else.36807
	fsub	%f0, %f0, %f12
	j	fbgt_cont.36808
fbgt_else.36807:
fbgt_cont.36808:
	flw	%f11, 480(%zero)
	fblt	%f0, %f11, fbgt_else.36809
	beqi	%a0, 0, bnei_else.36811
	add	%a0, %zero, %zero
	j	fbgt_cont.36810
bnei_else.36811:
	add	%a0, %zero, %k1
bnei_cont.36812:
	j	fbgt_cont.36810
fbgt_else.36809:
fbgt_cont.36810:
	fblt	%f0, %f11, fbgt_else.36813
	fsub	%f0, %f12, %f0
	j	fbgt_cont.36814
fbgt_else.36813:
fbgt_cont.36814:
	flw	%f1, 479(%zero)
	fblt	%f1, %f0, fbgt_else.36815
	fmul	%f12, %f0, %f0
	fmul	%f11, %f12, %f12
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f12
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f12
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
	j	fbgt_cont.36816
fbgt_else.36815:
	fsub	%f13, %f11, %f0
	fmul	%f12, %f13, %f13
	fmul	%f11, %f12, %f12
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fsub	%f1, %f13, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
fbgt_cont.36816:
	beqi	%a0, 0, bnei_else.36817
	j	bnei_cont.36818
bnei_else.36817:
	fneg	%f0, %f0
bnei_cont.36818:
	fmul	%f11, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f11, %f1
	fsw	%f0, 146(%zero)
	fsub	%f0, %f30, %f11
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.36772:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	fmul	%f0, %f1, %f0
	flw	%f12, 482(%zero)
	fblt	%f0, %fzero, fbgt_else.36820
	add	%a0, %zero, %k1
	j	fbgt_cont.36821
fbgt_else.36820:
	add	%a0, %zero, %zero
fbgt_cont.36821:
	fabs	%f11, %f0
	flw	%f1, 481(%zero)
	fdiv	%f0, %f11, %f1
	floor	%f0, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f11, %f0
	fblt	%f0, %f12, fbgt_else.36822
	beqi	%a0, 0, bnei_else.36824
	add	%a0, %zero, %zero
	j	fbgt_cont.36823
bnei_else.36824:
	add	%a0, %zero, %k1
bnei_cont.36825:
	j	fbgt_cont.36823
fbgt_else.36822:
fbgt_cont.36823:
	fblt	%f0, %f12, fbgt_else.36826
	fsub	%f0, %f0, %f12
	j	fbgt_cont.36827
fbgt_else.36826:
fbgt_cont.36827:
	flw	%f11, 480(%zero)
	fblt	%f0, %f11, fbgt_else.36828
	fsub	%f0, %f12, %f0
	j	fbgt_cont.36829
fbgt_else.36828:
fbgt_cont.36829:
	flw	%f1, 479(%zero)
	fblt	%f1, %f0, fbgt_else.36830
	fmul	%f13, %f0, %f0
	fmul	%f12, %f13, %f13
	flw	%f1, 478(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f13
	fsub	%f11, %f0, %f1
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 476(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fsub	%f0, %f11, %f0
	j	fbgt_cont.36831
fbgt_else.36830:
	fsub	%f0, %f11, %f0
	fmul	%f12, %f0, %f0
	fmul	%f11, %f12, %f12
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f12
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f12
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
fbgt_cont.36831:
	beqi	%a0, 0, bnei_else.36832
	j	bnei_cont.36833
bnei_else.36832:
	fneg	%f0, %f0
bnei_cont.36833:
	fmul	%f11, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f1, %f11
	fsw	%f0, 145(%zero)
	fsub	%f0, %f30, %f11
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.36771:
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
	fblt	%f0, %f11, fbgt_else.36835
	add	%a0, %zero, %zero
	j	fbgt_cont.36836
fbgt_else.36835:
	add	%a0, %zero, %k1
fbgt_cont.36836:
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fsub	%f1, %f1, %f0
	fmul	%f0, %f1, %f13
	floor	%f0, %f0
	fmul	%f0, %f0, %f12
	fsub	%f0, %f1, %f0
	fblt	%f0, %f11, fbgt_else.36837
	add	%a1, %zero, %zero
	j	fbgt_cont.36838
fbgt_else.36837:
	add	%a1, %zero, %k1
fbgt_cont.36838:
	beqi	%a0, 0, bnei_else.36839
	beqi	%a1, 0, bnei_else.36841
	flw	%f0, 451(%zero)
	j	bnei_cont.36840
bnei_else.36841:
	fmov	%f0, %fzero
bnei_cont.36842:
	j	bnei_cont.36840
bnei_else.36839:
	beqi	%a1, 0, bnei_else.36843
	fmov	%f0, %fzero
	j	bnei_cont.36844
bnei_else.36843:
	flw	%f0, 451(%zero)
bnei_cont.36844:
bnei_cont.36840:
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
	blti	%v0, 0, bgti_else.36940
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
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.36941
	add	%a0, %zero, %zero
	j	fbgt_cont.36942
fbgt_else.36941:
	add	%a0, %zero, %k1
fbgt_cont.36942:
	beqi	%a0, 0, bnei_else.36943
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.36945
	add	%a0, %zero, %zero
	j	bnei_cont.36944
fbgt_else.36945:
	add	%a0, %zero, %k1
fbgt_cont.36946:
	j	bnei_cont.36944
bnei_else.36943:
	add	%a0, %zero, %zero
bnei_cont.36944:
	beqi	%a0, 0, bnei_else.36947
	lw	%a0, 141(%zero)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a1, %a1, %a0
	lw	%a0, 5(%sp)
	bne	%a1, %a0, bnei_cont.36948
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.36951
	j	bnei_cont.36948
bnei_else.36951:
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
	fblt	%fzero, %f12, fbgt_else.36953
	add	%a0, %zero, %zero
	j	fbgt_cont.36954
fbgt_else.36953:
	add	%a0, %zero, %k1
fbgt_cont.36954:
	beqi	%a0, 0, bnei_else.36955
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
	j	bnei_cont.36956
bnei_else.36955:
bnei_cont.36956:
	fblt	%fzero, %f11, fbgt_else.36957
	add	%a0, %zero, %zero
	j	fbgt_cont.36958
fbgt_else.36957:
	add	%a0, %zero, %k1
fbgt_cont.36958:
	beqi	%a0, 0, bnei_cont.36948
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
	j	bnei_cont.36948
bnei_else.36959:
bnei_cont.36960:
bnei_cont.36952:
	j	bnei_cont.36948
beq_else.36949:
beq_cont.36950:
	j	bnei_cont.36948
bnei_else.36947:
bnei_cont.36948:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	fmov	%f1, %f23
	fmov	%f0, %f22
	j	trace_reflections.2966
bgti_else.36940:
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
	blt	%at, %v0, bgt_else.37209
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
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.37210
	add	%a0, %zero, %zero
	j	fbgt_cont.37211
fbgt_else.37210:
	add	%a0, %zero, %k1
fbgt_cont.37211:
	beqi	%a0, 0, bnei_else.37212
	flw	%f1, 444(%zero)
	flw	%f0, 11(%sp)
	fblt	%f0, %f1, fbgt_else.37214
	add	%a0, %zero, %zero
	j	bnei_cont.37213
fbgt_else.37214:
	add	%a0, %zero, %k1
fbgt_cont.37215:
	j	bnei_cont.37213
bnei_else.37212:
	add	%a0, %zero, %zero
bnei_cont.37213:
	beqi	%a0, 0, bnei_else.37216
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
	beqi	%a0, 1, bnei_else.37217
	beqi	%a0, 2, bnei_else.37219
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
	beqi	%a3, 0, bnei_else.37221
	flw	%f11, 2(%a2)
	fmul	%f1, %f13, %f11
	flw	%f12, 1(%a2)
	fmul	%f0, %f16, %f12
	fadd	%f0, %f1, %f0
	flw	%f18, 474(%zero)
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
	j	bnei_cont.37222
bnei_else.37221:
	fsw	%f19, 142(%zero)
	fsw	%f17, 143(%zero)
	fsw	%f15, 144(%zero)
bnei_cont.37222:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.37223
	add	%a0, %zero, %k1
	j	fbeq_cont.37224
fbeq_else.37223:
	add	%a0, %zero, %zero
fbeq_cont.37224:
	beqi	%a0, 0, bnei_else.37225
	fmov	%f0, %f30
	j	bnei_cont.37226
bnei_else.37225:
	beqi	%ra, 0, bnei_else.37227
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.37228
bnei_else.37227:
	fdiv	%f0, %f30, %f1
bnei_cont.37228:
bnei_cont.37226:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.37218
bnei_else.37219:
	flw	%f0, 0(%s0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%s0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%s0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.37220:
	j	bnei_cont.37218
bnei_else.37217:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.37229
	add	%a0, %zero, %k1
	j	fbeq_cont.37230
fbeq_else.37229:
	add	%a0, %zero, %zero
fbeq_cont.37230:
	beqi	%a0, 0, bnei_else.37231
	fmov	%f0, %fzero
	j	bnei_cont.37232
bnei_else.37231:
	fblt	%fzero, %f0, fbgt_else.37233
	add	%a0, %zero, %zero
	j	fbgt_cont.37234
fbgt_else.37233:
	add	%a0, %zero, %k1
fbgt_cont.37234:
	beqi	%a0, 0, bnei_else.37235
	fmov	%f0, %f30
	j	bnei_cont.37236
bnei_else.37235:
	flw	%f0, 468(%zero)
bnei_cont.37236:
bnei_cont.37232:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.37218:
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
	flw	%f0, 474(%zero)
	fblt	%f26, %f0, fbgt_else.37237
	add	%a0, %zero, %zero
	j	fbgt_cont.37238
fbgt_else.37237:
	add	%a0, %zero, %k1
fbgt_cont.37238:
	beqi	%a0, 0, bnei_else.37239
	lw	%a1, 7(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%zero, 0(%at)
	j	bnei_cont.37240
bnei_else.37239:
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
bnei_cont.37240:
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
	beqi	%v0, 0, bnei_else.37241
	j	bnei_cont.37242
bnei_else.37241:
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
	fblt	%fzero, %f11, fbgt_else.37243
	add	%a0, %zero, %zero
	j	fbgt_cont.37244
fbgt_else.37243:
	add	%a0, %zero, %k1
fbgt_cont.37244:
	beqi	%a0, 0, bnei_else.37245
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
	j	bnei_cont.37246
bnei_else.37245:
bnei_cont.37246:
	fblt	%fzero, %f12, fbgt_else.37247
	add	%a0, %zero, %zero
	j	fbgt_cont.37248
fbgt_else.37247:
	add	%a0, %zero, %k1
fbgt_cont.37248:
	beqi	%a0, 0, bnei_else.37249
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
	j	bnei_cont.37250
bnei_else.37249:
bnei_cont.37250:
bnei_cont.37242:
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
	fblt	%f0, %f25, fbgt_else.37251
	add	%a0, %zero, %zero
	j	fbgt_cont.37252
fbgt_else.37251:
	add	%a0, %zero, %k1
fbgt_cont.37252:
	beqi	%a0, 0, bnei_else.37253
	lw	%a0, 1(%sp)
	blti	%a0, 4, bgti_else.37254
	j	bgti_cont.37255
bgti_else.37254:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 8(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.37255:
	lw	%a0, 12(%sp)
	beqi	%a0, 2, bnei_else.37256
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.37256:
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
bnei_else.37253:
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.37216:
	addi	%a2, %zero, -1
	lw	%a1, 8(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.37259
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
	fblt	%fzero, %f1, fbgt_else.37260
	add	%a0, %zero, %zero
	j	fbgt_cont.37261
fbgt_else.37260:
	add	%a0, %zero, %k1
fbgt_cont.37261:
	beqi	%a0, 0, bnei_else.37262
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
bnei_else.37262:
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.37259:
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.37209:
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
	blti	%a1, 0, bgti_else.38268
	add	%at, %v0, %a1
	lw	%t1, 0(%at)
	lw	%k0, 1(%t1)
	lw	%t0, 0(%t1)
	flw	%f16, 0(%t0)
	flw	%f22, 0(%v1)
	fmul	%f1, %f16, %f22
	flw	%f14, 1(%t0)
	flw	%f23, 1(%v1)
	fmul	%f0, %f14, %f23
	fadd	%f1, %f1, %f0
	flw	%f17, 2(%t0)
	flw	%f24, 2(%v1)
	fmul	%f0, %f17, %f24
	fadd	%f1, %f1, %f0
	fblt	%f1, %fzero, fbgt_else.38269
	add	%a0, %zero, %zero
	j	fbgt_cont.38270
fbgt_else.38269:
	add	%a0, %zero, %k1
fbgt_cont.38270:
	beqi	%a0, 0, bnei_else.38271
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
	lw	%ra, 0(%s6)
	beqi	%ra, -1, bnei_else.38273
	beqi	%ra, 99, bnei_else.38275
	lw	%a0, 12(%ra)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	flw	%f13, 2(%a3)
	lw	%a0, 1(%t0)
	lw	%k0, 0(%t0)
	add	%at, %a0, %ra
	lw	%ra, 0(%at)
	beqi	%a1, 1, bnei_else.38277
	beqi	%a1, 2, bnei_else.38279
	flw	%f12, 0(%ra)
	fbne	%f12, %fzero, fbeq_else.38281
	add	%a0, %zero, %k1
	j	fbeq_cont.38282
fbeq_else.38281:
	add	%a0, %zero, %zero
fbeq_cont.38282:
	beqi	%a0, 0, bnei_else.38283
	add	%a0, %zero, %zero
	j	bnei_cont.38278
bnei_else.38283:
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
	fblt	%fzero, %f0, fbgt_else.38285
	add	%a0, %zero, %zero
	j	fbgt_cont.38286
fbgt_else.38285:
	add	%a0, %zero, %k1
fbgt_cont.38286:
	beqi	%a0, 0, bnei_else.38287
	beqi	%a2, 0, bnei_else.38289
	fsqrt	%f0, %f0
	fadd	%f1, %f11, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38290
bnei_else.38289:
	fsqrt	%f0, %f0
	fsub	%f1, %f11, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38290:
	add	%a0, %zero, %k1
	j	bnei_cont.38278
bnei_else.38287:
	add	%a0, %zero, %zero
bnei_cont.38288:
bnei_cont.38284:
	j	bnei_cont.38278
bnei_else.38279:
	flw	%f1, 0(%ra)
	fblt	%f1, %fzero, fbgt_else.38291
	add	%a0, %zero, %zero
	j	fbgt_cont.38292
fbgt_else.38291:
	add	%a0, %zero, %k1
fbgt_cont.38292:
	beqi	%a0, 0, bnei_else.38293
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38278
bnei_else.38293:
	add	%a0, %zero, %zero
bnei_cont.38294:
bnei_cont.38280:
	j	bnei_cont.38278
bnei_else.38277:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f15
	flw	%f17, 1(%ra)
	fmul	%f16, %f0, %f17
	flw	%f14, 1(%k0)
	fmul	%f0, %f16, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	flw	%f12, 1(%fp)
	fblt	%f0, %f12, fbgt_else.38295
	add	%a0, %zero, %zero
	j	fbgt_cont.38296
fbgt_else.38295:
	add	%a0, %zero, %k1
fbgt_cont.38296:
	beqi	%a0, 0, bnei_else.38297
	flw	%f0, 2(%k0)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.38299
	add	%a0, %zero, %zero
	j	fbgt_cont.38300
fbgt_else.38299:
	add	%a0, %zero, %k1
fbgt_cont.38300:
	beqi	%a0, 0, bnei_else.38301
	fbne	%f17, %fzero, fbeq_else.38303
	add	%a0, %zero, %k1
	j	fbeq_cont.38304
fbeq_else.38303:
	add	%a0, %zero, %zero
fbeq_cont.38304:
	beqi	%a0, 0, bnei_else.38305
	add	%a0, %zero, %zero
	j	bnei_cont.38298
bnei_else.38305:
	add	%a0, %zero, %k1
bnei_cont.38306:
	j	bnei_cont.38298
bnei_else.38301:
	add	%a0, %zero, %zero
bnei_cont.38302:
	j	bnei_cont.38298
bnei_else.38297:
	add	%a0, %zero, %zero
bnei_cont.38298:
	beqi	%a0, 0, bnei_else.38307
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38308
bnei_else.38307:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f11
	flw	%f19, 3(%ra)
	fmul	%f18, %f0, %f19
	flw	%f17, 0(%k0)
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f16, 0(%fp)
	fblt	%f0, %f16, fbgt_else.38309
	add	%a0, %zero, %zero
	j	fbgt_cont.38310
fbgt_else.38309:
	add	%a0, %zero, %k1
fbgt_cont.38310:
	beqi	%a0, 0, bnei_else.38311
	flw	%f0, 2(%k0)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.38313
	add	%a0, %zero, %zero
	j	fbgt_cont.38314
fbgt_else.38313:
	add	%a0, %zero, %k1
fbgt_cont.38314:
	beqi	%a0, 0, bnei_else.38315
	fbne	%f19, %fzero, fbeq_else.38317
	add	%a0, %zero, %k1
	j	fbeq_cont.38318
fbeq_else.38317:
	add	%a0, %zero, %zero
fbeq_cont.38318:
	beqi	%a0, 0, bnei_else.38319
	add	%a0, %zero, %zero
	j	bnei_cont.38312
bnei_else.38319:
	add	%a0, %zero, %k1
bnei_cont.38320:
	j	bnei_cont.38312
bnei_else.38315:
	add	%a0, %zero, %zero
bnei_cont.38316:
	j	bnei_cont.38312
bnei_else.38311:
	add	%a0, %zero, %zero
bnei_cont.38312:
	beqi	%a0, 0, bnei_else.38321
	fsw	%f18, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.38322
bnei_else.38321:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f13
	flw	%f13, 5(%ra)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f17
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f16, fbgt_else.38323
	add	%a0, %zero, %zero
	j	fbgt_cont.38324
fbgt_else.38323:
	add	%a0, %zero, %k1
fbgt_cont.38324:
	beqi	%a0, 0, bnei_else.38325
	fmul	%f0, %f1, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.38327
	add	%a0, %zero, %zero
	j	fbgt_cont.38328
fbgt_else.38327:
	add	%a0, %zero, %k1
fbgt_cont.38328:
	beqi	%a0, 0, bnei_else.38329
	fbne	%f13, %fzero, fbeq_else.38331
	add	%a0, %zero, %k1
	j	fbeq_cont.38332
fbeq_else.38331:
	add	%a0, %zero, %zero
fbeq_cont.38332:
	beqi	%a0, 0, bnei_else.38333
	add	%a0, %zero, %zero
	j	bnei_cont.38326
bnei_else.38333:
	add	%a0, %zero, %k1
bnei_cont.38334:
	j	bnei_cont.38326
bnei_else.38329:
	add	%a0, %zero, %zero
bnei_cont.38330:
	j	bnei_cont.38326
bnei_else.38325:
	add	%a0, %zero, %zero
bnei_cont.38326:
	beqi	%a0, 0, bnei_else.38335
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.38336
bnei_else.38335:
	add	%a0, %zero, %zero
bnei_cont.38336:
bnei_cont.38322:
bnei_cont.38308:
bnei_cont.38278:
	beqi	%a0, 0, bnei_cont.38276
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38339
	add	%a0, %zero, %zero
	j	fbgt_cont.38340
fbgt_else.38339:
	add	%a0, %zero, %k1
fbgt_cont.38340:
	beqi	%a0, 0, bnei_cont.38276
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.38276
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.38276
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.38276
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.38276
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
	j	bnei_cont.38276
bnei_else.38349:
bnei_cont.38350:
	j	bnei_cont.38276
bnei_else.38347:
bnei_cont.38348:
	j	bnei_cont.38276
bnei_else.38345:
bnei_cont.38346:
	j	bnei_cont.38276
bnei_else.38343:
bnei_cont.38344:
	j	bnei_cont.38276
bnei_else.38341:
bnei_cont.38342:
	j	bnei_cont.38276
bnei_else.38337:
bnei_cont.38338:
	j	bnei_cont.38276
bnei_else.38275:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.38351
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.38352
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.38352
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.38352
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
	j	bnei_cont.38352
bnei_else.38357:
bnei_cont.38358:
	j	bnei_cont.38352
bnei_else.38355:
bnei_cont.38356:
	j	bnei_cont.38352
bnei_else.38353:
bnei_cont.38354:
	j	bnei_cont.38352
bnei_else.38351:
bnei_cont.38352:
bnei_cont.38276:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -8
	j	bnei_cont.38274
bnei_else.38273:
bnei_cont.38274:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.38359
	add	%a0, %zero, %zero
	j	fbgt_cont.38360
fbgt_else.38359:
	add	%a0, %zero, %k1
fbgt_cont.38360:
	beqi	%a0, 0, bnei_else.38361
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38363
	add	%a0, %zero, %zero
	j	bnei_cont.38362
fbgt_else.38363:
	add	%a0, %zero, %k1
fbgt_cont.38364:
	j	bnei_cont.38362
bnei_else.38361:
	add	%a0, %zero, %zero
bnei_cont.38362:
	beqi	%a0, 0, bnei_cont.38272
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
	beqi	%k0, 1, bnei_else.38367
	beqi	%k0, 2, bnei_else.38369
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
	beqi	%a2, 0, bnei_else.38371
	flw	%f11, 2(%a1)
	fmul	%f1, %f12, %f11
	flw	%f18, 1(%a1)
	fmul	%f0, %f15, %f18
	fadd	%f0, %f1, %f0
	flw	%f17, 474(%zero)
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
	j	bnei_cont.38372
bnei_else.38371:
	fsw	%f19, 142(%zero)
	fsw	%f16, 143(%zero)
	fsw	%f14, 144(%zero)
bnei_cont.38372:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38373
	add	%a0, %zero, %k1
	j	fbeq_cont.38374
fbeq_else.38373:
	add	%a0, %zero, %zero
fbeq_cont.38374:
	beqi	%a0, 0, bnei_else.38375
	fmov	%f0, %f30
	j	bnei_cont.38376
bnei_else.38375:
	beqi	%a3, 0, bnei_else.38377
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38378
bnei_else.38377:
	fdiv	%f0, %f30, %f1
bnei_cont.38378:
bnei_cont.38376:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38368
bnei_else.38369:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38370:
	j	bnei_cont.38368
bnei_else.38367:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38379
	add	%a0, %zero, %k1
	j	fbeq_cont.38380
fbeq_else.38379:
	add	%a0, %zero, %zero
fbeq_cont.38380:
	beqi	%a0, 0, bnei_else.38381
	fmov	%f0, %fzero
	j	bnei_cont.38382
bnei_else.38381:
	fblt	%fzero, %f0, fbgt_else.38383
	add	%a0, %zero, %zero
	j	fbgt_cont.38384
fbgt_else.38383:
	add	%a0, %zero, %k1
fbgt_cont.38384:
	beqi	%a0, 0, bnei_else.38385
	fmov	%f0, %f30
	j	bnei_cont.38386
bnei_else.38385:
	flw	%f0, 468(%zero)
bnei_cont.38386:
bnei_cont.38382:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38368:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.38387
	j	bnei_cont.38272
bnei_else.38387:
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
	fblt	%fzero, %f0, fbgt_else.38389
	add	%a0, %zero, %zero
	j	fbgt_cont.38390
fbgt_else.38389:
	add	%a0, %zero, %k1
fbgt_cont.38390:
	beqi	%a0, 0, bnei_else.38391
	j	bnei_cont.38392
bnei_else.38391:
	fmov	%f0, %fzero
bnei_cont.38392:
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
bnei_cont.38388:
	j	bnei_cont.38272
bnei_else.38365:
bnei_cont.38366:
	j	bnei_cont.38272
bnei_else.38271:
	flw	%f0, 439(%zero)
	fdiv	%f25, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	lw	%s6, 0(%t2)
	lw	%fp, 0(%s6)
	beqi	%fp, -1, bnei_else.38393
	beqi	%fp, 99, bnei_else.38395
	lw	%a0, 12(%fp)
	lw	%a2, 10(%a0)
	lw	%a1, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%a0, 1(%a0)
	flw	%f15, 0(%a2)
	flw	%f11, 1(%a2)
	flw	%f13, 2(%a2)
	add	%at, %k0, %fp
	lw	%fp, 0(%at)
	beqi	%a0, 1, bnei_else.38397
	beqi	%a0, 2, bnei_else.38399
	flw	%f12, 0(%fp)
	fbne	%f12, %fzero, fbeq_else.38401
	add	%a0, %zero, %k1
	j	fbeq_cont.38402
fbeq_else.38401:
	add	%a0, %zero, %zero
fbeq_cont.38402:
	beqi	%a0, 0, bnei_else.38403
	add	%a0, %zero, %zero
	j	bnei_cont.38398
bnei_else.38403:
	flw	%f0, 1(%fp)
	fmul	%f1, %f0, %f15
	flw	%f0, 2(%fp)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%fp)
	fmul	%f0, %f0, %f13
	fadd	%f11, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.38405
	add	%a0, %zero, %zero
	j	fbgt_cont.38406
fbgt_else.38405:
	add	%a0, %zero, %k1
fbgt_cont.38406:
	beqi	%a0, 0, bnei_else.38407
	beqi	%a1, 0, bnei_else.38409
	fsqrt	%f0, %f0
	fadd	%f1, %f11, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38410
bnei_else.38409:
	fsqrt	%f0, %f0
	fsub	%f1, %f11, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38410:
	add	%a0, %zero, %k1
	j	bnei_cont.38398
bnei_else.38407:
	add	%a0, %zero, %zero
bnei_cont.38408:
bnei_cont.38404:
	j	bnei_cont.38398
bnei_else.38399:
	flw	%f1, 0(%fp)
	fblt	%f1, %fzero, fbgt_else.38411
	add	%a0, %zero, %zero
	j	fbgt_cont.38412
fbgt_else.38411:
	add	%a0, %zero, %k1
fbgt_cont.38412:
	beqi	%a0, 0, bnei_else.38413
	flw	%f0, 3(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38398
bnei_else.38413:
	add	%a0, %zero, %zero
bnei_cont.38414:
bnei_cont.38400:
	j	bnei_cont.38398
bnei_else.38397:
	flw	%f0, 0(%fp)
	fsub	%f0, %f0, %f15
	flw	%f19, 1(%fp)
	fmul	%f18, %f0, %f19
	fmul	%f0, %f18, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	flw	%f12, 1(%a3)
	fblt	%f0, %f12, fbgt_else.38415
	add	%a0, %zero, %zero
	j	fbgt_cont.38416
fbgt_else.38415:
	add	%a0, %zero, %k1
fbgt_cont.38416:
	beqi	%a0, 0, bnei_else.38417
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.38419
	add	%a0, %zero, %zero
	j	fbgt_cont.38420
fbgt_else.38419:
	add	%a0, %zero, %k1
fbgt_cont.38420:
	beqi	%a0, 0, bnei_else.38421
	fbne	%f19, %fzero, fbeq_else.38423
	add	%a0, %zero, %k1
	j	fbeq_cont.38424
fbeq_else.38423:
	add	%a0, %zero, %zero
fbeq_cont.38424:
	beqi	%a0, 0, bnei_else.38425
	add	%a0, %zero, %zero
	j	bnei_cont.38418
bnei_else.38425:
	add	%a0, %zero, %k1
bnei_cont.38426:
	j	bnei_cont.38418
bnei_else.38421:
	add	%a0, %zero, %zero
bnei_cont.38422:
	j	bnei_cont.38418
bnei_else.38417:
	add	%a0, %zero, %zero
bnei_cont.38418:
	beqi	%a0, 0, bnei_else.38427
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38428
bnei_else.38427:
	flw	%f0, 2(%fp)
	fsub	%f0, %f0, %f11
	flw	%f2, 3(%fp)
	fmul	%f19, %f0, %f2
	fmul	%f0, %f19, %f16
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	flw	%f18, 0(%a3)
	fblt	%f0, %f18, fbgt_else.38429
	add	%a0, %zero, %zero
	j	fbgt_cont.38430
fbgt_else.38429:
	add	%a0, %zero, %k1
fbgt_cont.38430:
	beqi	%a0, 0, bnei_else.38431
	fmul	%f0, %f19, %f17
	fadd	%f0, %f0, %f13
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.38433
	add	%a0, %zero, %zero
	j	fbgt_cont.38434
fbgt_else.38433:
	add	%a0, %zero, %k1
fbgt_cont.38434:
	beqi	%a0, 0, bnei_else.38435
	fbne	%f2, %fzero, fbeq_else.38437
	add	%a0, %zero, %k1
	j	fbeq_cont.38438
fbeq_else.38437:
	add	%a0, %zero, %zero
fbeq_cont.38438:
	beqi	%a0, 0, bnei_else.38439
	add	%a0, %zero, %zero
	j	bnei_cont.38432
bnei_else.38439:
	add	%a0, %zero, %k1
bnei_cont.38440:
	j	bnei_cont.38432
bnei_else.38435:
	add	%a0, %zero, %zero
bnei_cont.38436:
	j	bnei_cont.38432
bnei_else.38431:
	add	%a0, %zero, %zero
bnei_cont.38432:
	beqi	%a0, 0, bnei_else.38441
	fsw	%f19, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.38442
bnei_else.38441:
	flw	%f0, 4(%fp)
	fsub	%f0, %f0, %f13
	flw	%f13, 5(%fp)
	fmul	%f1, %f0, %f13
	fmul	%f0, %f1, %f16
	fadd	%f0, %f0, %f15
	fabs	%f0, %f0
	fblt	%f0, %f18, fbgt_else.38443
	add	%a0, %zero, %zero
	j	fbgt_cont.38444
fbgt_else.38443:
	add	%a0, %zero, %k1
fbgt_cont.38444:
	beqi	%a0, 0, bnei_else.38445
	fmul	%f0, %f1, %f14
	fadd	%f0, %f0, %f11
	fabs	%f0, %f0
	fblt	%f0, %f12, fbgt_else.38447
	add	%a0, %zero, %zero
	j	fbgt_cont.38448
fbgt_else.38447:
	add	%a0, %zero, %k1
fbgt_cont.38448:
	beqi	%a0, 0, bnei_else.38449
	fbne	%f13, %fzero, fbeq_else.38451
	add	%a0, %zero, %k1
	j	fbeq_cont.38452
fbeq_else.38451:
	add	%a0, %zero, %zero
fbeq_cont.38452:
	beqi	%a0, 0, bnei_else.38453
	add	%a0, %zero, %zero
	j	bnei_cont.38446
bnei_else.38453:
	add	%a0, %zero, %k1
bnei_cont.38454:
	j	bnei_cont.38446
bnei_else.38449:
	add	%a0, %zero, %zero
bnei_cont.38450:
	j	bnei_cont.38446
bnei_else.38445:
	add	%a0, %zero, %zero
bnei_cont.38446:
	beqi	%a0, 0, bnei_else.38455
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.38456
bnei_else.38455:
	add	%a0, %zero, %zero
bnei_cont.38456:
bnei_cont.38442:
bnei_cont.38428:
bnei_cont.38398:
	beqi	%a0, 0, bnei_cont.38396
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38459
	add	%a0, %zero, %zero
	j	fbgt_cont.38460
fbgt_else.38459:
	add	%a0, %zero, %k1
fbgt_cont.38460:
	beqi	%a0, 0, bnei_cont.38396
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.38396
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.38396
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.38396
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.38396
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
	j	bnei_cont.38396
bnei_else.38469:
bnei_cont.38470:
	j	bnei_cont.38396
bnei_else.38467:
bnei_cont.38468:
	j	bnei_cont.38396
bnei_else.38465:
bnei_cont.38466:
	j	bnei_cont.38396
bnei_else.38463:
bnei_cont.38464:
	j	bnei_cont.38396
bnei_else.38461:
bnei_cont.38462:
	j	bnei_cont.38396
bnei_else.38457:
bnei_cont.38458:
	j	bnei_cont.38396
bnei_else.38395:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.38471
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.38472
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.38472
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.38472
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
	j	bnei_cont.38472
bnei_else.38477:
bnei_cont.38478:
	j	bnei_cont.38472
bnei_else.38475:
bnei_cont.38476:
	j	bnei_cont.38472
bnei_else.38473:
bnei_cont.38474:
	j	bnei_cont.38472
bnei_else.38471:
bnei_cont.38472:
bnei_cont.38396:
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -8
	j	bnei_cont.38394
bnei_else.38393:
bnei_cont.38394:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.38479
	add	%a0, %zero, %zero
	j	fbgt_cont.38480
fbgt_else.38479:
	add	%a0, %zero, %k1
fbgt_cont.38480:
	beqi	%a0, 0, bnei_else.38481
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38483
	add	%a0, %zero, %zero
	j	bnei_cont.38482
fbgt_else.38483:
	add	%a0, %zero, %k1
fbgt_cont.38484:
	j	bnei_cont.38482
bnei_else.38481:
	add	%a0, %zero, %zero
bnei_cont.38482:
	beqi	%a0, 0, bnei_else.38485
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t1, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.38487
	beqi	%k0, 2, bnei_else.38489
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
	beqi	%a2, 0, bnei_else.38491
	flw	%f11, 2(%a1)
	fmul	%f1, %f12, %f11
	flw	%f18, 1(%a1)
	fmul	%f0, %f15, %f18
	fadd	%f0, %f1, %f0
	flw	%f17, 474(%zero)
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
	j	bnei_cont.38492
bnei_else.38491:
	fsw	%f19, 142(%zero)
	fsw	%f16, 143(%zero)
	fsw	%f14, 144(%zero)
bnei_cont.38492:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38493
	add	%a0, %zero, %k1
	j	fbeq_cont.38494
fbeq_else.38493:
	add	%a0, %zero, %zero
fbeq_cont.38494:
	beqi	%a0, 0, bnei_else.38495
	fmov	%f0, %f30
	j	bnei_cont.38496
bnei_else.38495:
	beqi	%a3, 0, bnei_else.38497
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38498
bnei_else.38497:
	fdiv	%f0, %f30, %f1
bnei_cont.38498:
bnei_cont.38496:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38488
bnei_else.38489:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38490:
	j	bnei_cont.38488
bnei_else.38487:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38499
	add	%a0, %zero, %k1
	j	fbeq_cont.38500
fbeq_else.38499:
	add	%a0, %zero, %zero
fbeq_cont.38500:
	beqi	%a0, 0, bnei_else.38501
	fmov	%f0, %fzero
	j	bnei_cont.38502
bnei_else.38501:
	fblt	%fzero, %f0, fbgt_else.38503
	add	%a0, %zero, %zero
	j	fbgt_cont.38504
fbgt_else.38503:
	add	%a0, %zero, %k1
fbgt_cont.38504:
	beqi	%a0, 0, bnei_else.38505
	fmov	%f0, %f30
	j	bnei_cont.38506
bnei_else.38505:
	flw	%f0, 468(%zero)
bnei_cont.38506:
bnei_cont.38502:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38488:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.38507
	j	bnei_cont.38486
bnei_else.38507:
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
	fblt	%fzero, %f0, fbgt_else.38509
	add	%a0, %zero, %zero
	j	fbgt_cont.38510
fbgt_else.38509:
	add	%a0, %zero, %k1
fbgt_cont.38510:
	beqi	%a0, 0, bnei_else.38511
	j	bnei_cont.38512
bnei_else.38511:
	fmov	%f0, %fzero
bnei_cont.38512:
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
bnei_cont.38508:
	j	bnei_cont.38486
bnei_else.38485:
bnei_cont.38486:
bnei_cont.38272:
	lw	%a0, 3(%sp)
	addi	%t0, %a0, -2
	blti	%t0, 0, bgti_else.38513
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
	fblt	%f1, %fzero, fbgt_else.38514
	add	%a1, %zero, %zero
	j	fbgt_cont.38515
fbgt_else.38514:
	add	%a1, %zero, %k1
fbgt_cont.38515:
	beqi	%a1, 0, bnei_else.38516
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
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.38518
	add	%a0, %zero, %zero
	j	fbgt_cont.38519
fbgt_else.38518:
	add	%a0, %zero, %k1
fbgt_cont.38519:
	beqi	%a0, 0, bnei_else.38520
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38522
	add	%a0, %zero, %zero
	j	bnei_cont.38521
fbgt_else.38522:
	add	%a0, %zero, %k1
fbgt_cont.38523:
	j	bnei_cont.38521
bnei_else.38520:
	add	%a0, %zero, %zero
bnei_cont.38521:
	beqi	%a0, 0, bnei_cont.38517
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
	beqi	%k0, 1, bnei_else.38526
	beqi	%k0, 2, bnei_else.38528
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
	beqi	%a2, 0, bnei_else.38530
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 474(%zero)
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
	j	bnei_cont.38531
bnei_else.38530:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.38531:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38532
	add	%a0, %zero, %k1
	j	fbeq_cont.38533
fbeq_else.38532:
	add	%a0, %zero, %zero
fbeq_cont.38533:
	beqi	%a0, 0, bnei_else.38534
	fmov	%f0, %f30
	j	bnei_cont.38535
bnei_else.38534:
	beqi	%a3, 0, bnei_else.38536
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38537
bnei_else.38536:
	fdiv	%f0, %f30, %f1
bnei_cont.38537:
bnei_cont.38535:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38527
bnei_else.38528:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38529:
	j	bnei_cont.38527
bnei_else.38526:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38538
	add	%a0, %zero, %k1
	j	fbeq_cont.38539
fbeq_else.38538:
	add	%a0, %zero, %zero
fbeq_cont.38539:
	beqi	%a0, 0, bnei_else.38540
	fmov	%f0, %fzero
	j	bnei_cont.38541
bnei_else.38540:
	fblt	%fzero, %f0, fbgt_else.38542
	add	%a0, %zero, %zero
	j	fbgt_cont.38543
fbgt_else.38542:
	add	%a0, %zero, %k1
fbgt_cont.38543:
	beqi	%a0, 0, bnei_else.38544
	fmov	%f0, %f30
	j	bnei_cont.38545
bnei_else.38544:
	flw	%f0, 468(%zero)
bnei_cont.38545:
bnei_cont.38541:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38527:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.38546
	j	bnei_cont.38517
bnei_else.38546:
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
	fblt	%fzero, %f0, fbgt_else.38548
	add	%a0, %zero, %zero
	j	fbgt_cont.38549
fbgt_else.38548:
	add	%a0, %zero, %k1
fbgt_cont.38549:
	beqi	%a0, 0, bnei_else.38550
	j	bnei_cont.38551
bnei_else.38550:
	fmov	%f0, %fzero
bnei_cont.38551:
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
bnei_cont.38547:
	j	bnei_cont.38517
bnei_else.38524:
bnei_cont.38525:
	j	bnei_cont.38517
bnei_else.38516:
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
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.38552
	add	%a0, %zero, %zero
	j	fbgt_cont.38553
fbgt_else.38552:
	add	%a0, %zero, %k1
fbgt_cont.38553:
	beqi	%a0, 0, bnei_else.38554
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38556
	add	%a0, %zero, %zero
	j	bnei_cont.38555
fbgt_else.38556:
	add	%a0, %zero, %k1
fbgt_cont.38557:
	j	bnei_cont.38555
bnei_else.38554:
	add	%a0, %zero, %zero
bnei_cont.38555:
	beqi	%a0, 0, bnei_else.38558
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.38560
	beqi	%k0, 2, bnei_else.38562
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
	beqi	%a2, 0, bnei_else.38564
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 474(%zero)
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
	j	bnei_cont.38565
bnei_else.38564:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.38565:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38566
	add	%a0, %zero, %k1
	j	fbeq_cont.38567
fbeq_else.38566:
	add	%a0, %zero, %zero
fbeq_cont.38567:
	beqi	%a0, 0, bnei_else.38568
	fmov	%f0, %f30
	j	bnei_cont.38569
bnei_else.38568:
	beqi	%a3, 0, bnei_else.38570
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38571
bnei_else.38570:
	fdiv	%f0, %f30, %f1
bnei_cont.38571:
bnei_cont.38569:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38561
bnei_else.38562:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38563:
	j	bnei_cont.38561
bnei_else.38560:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t1, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38572
	add	%a0, %zero, %k1
	j	fbeq_cont.38573
fbeq_else.38572:
	add	%a0, %zero, %zero
fbeq_cont.38573:
	beqi	%a0, 0, bnei_else.38574
	fmov	%f0, %fzero
	j	bnei_cont.38575
bnei_else.38574:
	fblt	%fzero, %f0, fbgt_else.38576
	add	%a0, %zero, %zero
	j	fbgt_cont.38577
fbgt_else.38576:
	add	%a0, %zero, %k1
fbgt_cont.38577:
	beqi	%a0, 0, bnei_else.38578
	fmov	%f0, %f30
	j	bnei_cont.38579
bnei_else.38578:
	flw	%f0, 468(%zero)
bnei_cont.38579:
bnei_cont.38575:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38561:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.38580
	j	bnei_cont.38559
bnei_else.38580:
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
	fblt	%fzero, %f0, fbgt_else.38582
	add	%a0, %zero, %zero
	j	fbgt_cont.38583
fbgt_else.38582:
	add	%a0, %zero, %k1
fbgt_cont.38583:
	beqi	%a0, 0, bnei_else.38584
	j	bnei_cont.38585
bnei_else.38584:
	fmov	%f0, %fzero
bnei_cont.38585:
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
bnei_cont.38581:
	j	bnei_cont.38559
bnei_else.38558:
bnei_cont.38559:
bnei_cont.38517:
	addi	%a1, %t0, -2
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.38513:
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bgti_else.38268:
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
	fblt	%f1, %fzero, fbgt_else.38834
	add	%a1, %zero, %zero
	j	fbgt_cont.38835
fbgt_else.38834:
	add	%a1, %zero, %k1
fbgt_cont.38835:
	beqi	%a1, 0, bnei_else.38836
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
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.38838
	add	%a0, %zero, %zero
	j	fbgt_cont.38839
fbgt_else.38838:
	add	%a0, %zero, %k1
fbgt_cont.38839:
	beqi	%a0, 0, bnei_else.38840
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38842
	add	%a0, %zero, %zero
	j	bnei_cont.38841
fbgt_else.38842:
	add	%a0, %zero, %k1
fbgt_cont.38843:
	j	bnei_cont.38841
bnei_else.38840:
	add	%a0, %zero, %zero
bnei_cont.38841:
	beqi	%a0, 0, bnei_cont.38837
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
	beqi	%k0, 1, bnei_else.38846
	beqi	%k0, 2, bnei_else.38848
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
	beqi	%a2, 0, bnei_else.38850
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 474(%zero)
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
	j	bnei_cont.38851
bnei_else.38850:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.38851:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38852
	add	%a0, %zero, %k1
	j	fbeq_cont.38853
fbeq_else.38852:
	add	%a0, %zero, %zero
fbeq_cont.38853:
	beqi	%a0, 0, bnei_else.38854
	fmov	%f0, %f30
	j	bnei_cont.38855
bnei_else.38854:
	beqi	%a3, 0, bnei_else.38856
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38857
bnei_else.38856:
	fdiv	%f0, %f30, %f1
bnei_cont.38857:
bnei_cont.38855:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38847
bnei_else.38848:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38849:
	j	bnei_cont.38847
bnei_else.38846:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38858
	add	%a0, %zero, %k1
	j	fbeq_cont.38859
fbeq_else.38858:
	add	%a0, %zero, %zero
fbeq_cont.38859:
	beqi	%a0, 0, bnei_else.38860
	fmov	%f0, %fzero
	j	bnei_cont.38861
bnei_else.38860:
	fblt	%fzero, %f0, fbgt_else.38862
	add	%a0, %zero, %zero
	j	fbgt_cont.38863
fbgt_else.38862:
	add	%a0, %zero, %k1
fbgt_cont.38863:
	beqi	%a0, 0, bnei_else.38864
	fmov	%f0, %f30
	j	bnei_cont.38865
bnei_else.38864:
	flw	%f0, 468(%zero)
bnei_cont.38865:
bnei_cont.38861:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38847:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	jal	utexture.2959
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.38866
	j	bnei_cont.38837
bnei_else.38866:
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
	fblt	%fzero, %f0, fbgt_else.38868
	add	%a0, %zero, %zero
	j	fbgt_cont.38869
fbgt_else.38868:
	add	%a0, %zero, %k1
fbgt_cont.38869:
	beqi	%a0, 0, bnei_else.38870
	j	bnei_cont.38871
bnei_else.38870:
	fmov	%f0, %fzero
bnei_cont.38871:
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
bnei_cont.38867:
	j	bnei_cont.38837
bnei_else.38844:
bnei_cont.38845:
	j	bnei_cont.38837
bnei_else.38836:
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
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.38872
	add	%a0, %zero, %zero
	j	fbgt_cont.38873
fbgt_else.38872:
	add	%a0, %zero, %k1
fbgt_cont.38873:
	beqi	%a0, 0, bnei_else.38874
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38876
	add	%a0, %zero, %zero
	j	bnei_cont.38875
fbgt_else.38876:
	add	%a0, %zero, %k1
fbgt_cont.38877:
	j	bnei_cont.38875
bnei_else.38874:
	add	%a0, %zero, %zero
bnei_cont.38875:
	beqi	%a0, 0, bnei_else.38878
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t2, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.38880
	beqi	%k0, 2, bnei_else.38882
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
	beqi	%a2, 0, bnei_else.38884
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 474(%zero)
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
	j	bnei_cont.38885
bnei_else.38884:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.38885:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38886
	add	%a0, %zero, %k1
	j	fbeq_cont.38887
fbeq_else.38886:
	add	%a0, %zero, %zero
fbeq_cont.38887:
	beqi	%a0, 0, bnei_else.38888
	fmov	%f0, %f30
	j	bnei_cont.38889
bnei_else.38888:
	beqi	%a3, 0, bnei_else.38890
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38891
bnei_else.38890:
	fdiv	%f0, %f30, %f1
bnei_cont.38891:
bnei_cont.38889:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38881
bnei_else.38882:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38883:
	j	bnei_cont.38881
bnei_else.38880:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38892
	add	%a0, %zero, %k1
	j	fbeq_cont.38893
fbeq_else.38892:
	add	%a0, %zero, %zero
fbeq_cont.38893:
	beqi	%a0, 0, bnei_else.38894
	fmov	%f0, %fzero
	j	bnei_cont.38895
bnei_else.38894:
	fblt	%fzero, %f0, fbgt_else.38896
	add	%a0, %zero, %zero
	j	fbgt_cont.38897
fbgt_else.38896:
	add	%a0, %zero, %k1
fbgt_cont.38897:
	beqi	%a0, 0, bnei_else.38898
	fmov	%f0, %f30
	j	bnei_cont.38899
bnei_else.38898:
	flw	%f0, 468(%zero)
bnei_cont.38899:
bnei_cont.38895:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38881:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	jal	utexture.2959
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.38900
	j	bnei_cont.38879
bnei_else.38900:
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
	fblt	%fzero, %f0, fbgt_else.38902
	add	%a0, %zero, %zero
	j	fbgt_cont.38903
fbgt_else.38902:
	add	%a0, %zero, %k1
fbgt_cont.38903:
	beqi	%a0, 0, bnei_else.38904
	j	bnei_cont.38905
bnei_else.38904:
	fmov	%f0, %fzero
bnei_cont.38905:
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
bnei_cont.38901:
	j	bnei_cont.38879
bnei_else.38878:
bnei_cont.38879:
bnei_cont.38837:
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
	blt	%at, %v1, bgt_else.39061
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
	blti	%a1, 0, bgti_else.39062
	add	%at, %k0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39063
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
	beqi	%t2, 0, bnei_else.39065
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
	j	bnei_cont.39066
bnei_else.39065:
bnei_cont.39066:
	beqi	%t2, 1, bnei_else.39067
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
	j	bnei_cont.39068
bnei_else.39067:
bnei_cont.39068:
	beqi	%t2, 2, bnei_else.39069
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
	j	bnei_cont.39070
bnei_else.39069:
bnei_cont.39070:
	beqi	%t2, 3, bnei_else.39071
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
	j	bnei_cont.39072
bnei_else.39071:
bnei_cont.39072:
	beqi	%t2, 4, bnei_else.39073
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
	j	bnei_cont.39074
bnei_else.39073:
bnei_cont.39074:
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
	j	bnei_cont.39064
bnei_else.39063:
bnei_cont.39064:
	lw	%a0, 1(%sp)
	addi	%t2, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t2, bgt_else.39075
	lw	%a0, 11(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39076
	lw	%a0, 10(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39077
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
	beqi	%t3, 0, bnei_else.39079
	lw	%v0, 179(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39080
bnei_else.39079:
bnei_cont.39080:
	beqi	%t3, 1, bnei_else.39081
	lw	%v0, 180(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39082
bnei_else.39081:
bnei_cont.39082:
	beqi	%t3, 2, bnei_else.39083
	lw	%v0, 181(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39084
bnei_else.39083:
bnei_cont.39084:
	beqi	%t3, 3, bnei_else.39085
	lw	%v0, 182(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39086
bnei_else.39085:
bnei_cont.39086:
	beqi	%t3, 4, bnei_else.39087
	lw	%v0, 183(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39088
bnei_else.39087:
bnei_cont.39088:
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
	j	bnei_cont.39078
bnei_else.39077:
bnei_cont.39078:
	addi	%v1, %t2, 1
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.39076:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgt_else.39075:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgti_else.39062:
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.39061:
	add	%t0, %zero, %a0
	jr	%ra
try_exploit_neighbors.3018:
	sw	%a3, 0(%sp)
	sw	%ra, 1(%sp)
	add	%at, %a1, %v0
	lw	%s2, 0(%at)
	sw	%s2, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.39298
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
	blti	%s7, 0, bgti_else.39299
	add	%at, %a0, %v0
	lw	%fp, 0(%at)
	lw	%s2, 5(%fp)
	lw	%s3, 2(%fp)
	add	%at, %s3, %a3
	lw	%fp, 0(%at)
	bne	%fp, %s7, beq_else.39300
	add	%at, %a2, %v0
	lw	%fp, 0(%at)
	lw	%fp, 2(%fp)
	add	%at, %fp, %a3
	lw	%fp, 0(%at)
	bne	%fp, %s7, beq_else.39302
	addi	%fp, %v0, -1
	add	%at, %a1, %fp
	lw	%fp, 0(%at)
	lw	%fp, 2(%fp)
	add	%at, %fp, %a3
	lw	%fp, 0(%at)
	bne	%fp, %s7, beq_else.39304
	addi	%fp, %v0, 1
	add	%at, %a1, %fp
	lw	%fp, 0(%at)
	lw	%fp, 2(%fp)
	add	%at, %fp, %a3
	lw	%a3, 0(%at)
	bne	%a3, %s7, beq_else.39306
	add	%a3, %zero, %k1
	j	beq_cont.39301
beq_else.39306:
	add	%a3, %zero, %zero
beq_cont.39307:
	j	beq_cont.39301
beq_else.39304:
	add	%a3, %zero, %zero
beq_cont.39305:
	j	beq_cont.39301
beq_else.39302:
	add	%a3, %zero, %zero
beq_cont.39303:
	j	beq_cont.39301
beq_else.39300:
	add	%a3, %zero, %zero
beq_cont.39301:
	beqi	%a3, 0, bnei_else.39308
	lw	%s4, 0(%sp)
	add	%at, %k0, %s4
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.39309
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
	j	bnei_cont.39310
bnei_else.39309:
bnei_cont.39310:
	lw	%a3, 0(%sp)
	addi	%fp, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %fp, bgt_else.39311
	add	%at, %s0, %fp
	lw	%ra, 0(%at)
	blti	%ra, 0, bgti_else.39312
	add	%at, %s3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.39313
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.39315
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.39317
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.39319
	add	%a3, %zero, %k1
	j	beq_cont.39314
beq_else.39319:
	add	%a3, %zero, %zero
beq_cont.39320:
	j	beq_cont.39314
beq_else.39317:
	add	%a3, %zero, %zero
beq_cont.39318:
	j	beq_cont.39314
beq_else.39315:
	add	%a3, %zero, %zero
beq_cont.39316:
	j	beq_cont.39314
beq_else.39313:
	add	%a3, %zero, %zero
beq_cont.39314:
	beqi	%a3, 0, bnei_else.39321
	add	%at, %k0, %fp
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.39322
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
	j	bnei_cont.39323
bnei_else.39322:
bnei_cont.39323:
	addi	%a3, %fp, 1
	lw	%ra, 1(%sp)
	j	try_exploit_neighbors.3018
bnei_else.39321:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %fp, 0
	j	do_without_neighbors.3002
bgti_else.39312:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.39311:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.39308:
	lw	%a2, 0(%sp)
	addi	%at, %zero, 4
	blt	%at, %a2, bgt_else.39326
	blti	%s7, 0, bgti_else.39327
	add	%at, %k0, %a2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39328
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
	beqi	%a1, 0, bnei_else.39330
	lw	%v0, 179(%zero)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39331
bnei_else.39330:
bnei_cont.39331:
	lw	%a0, 4(%sp)
	beqi	%a0, 1, bnei_else.39332
	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39333
bnei_else.39332:
bnei_cont.39333:
	lw	%a0, 4(%sp)
	beqi	%a0, 2, bnei_else.39334
	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39335
bnei_else.39334:
bnei_cont.39335:
	lw	%a0, 4(%sp)
	beqi	%a0, 3, bnei_else.39336
	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39337
bnei_else.39336:
bnei_cont.39337:
	lw	%a0, 4(%sp)
	beqi	%a0, 4, bnei_else.39338
	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39339
bnei_else.39338:
bnei_cont.39339:
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
	j	bnei_cont.39329
bnei_else.39328:
bnei_cont.39329:
	lw	%a0, 0(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	j	do_without_neighbors.3002
bgti_else.39327:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.39326:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.39299:
	jr	%ra
bgt_else.39298:
	jr	%ra
pretrace_diffuse_rays.3031:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.39660
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
	blti	%a1, 0, bgti_else.39661
	add	%at, %fp, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39662
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
	j	bnei_cont.39663
bnei_else.39662:
bnei_cont.39663:
	lw	%a0, 1(%sp)
	addi	%t1, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t1, bgt_else.39664
	lw	%a0, 8(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39665
	lw	%a0, 7(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39666
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
	lw	%a0, 118(%a0)
	lw	%a2, 0(%a0)
	sw	%a2, 12(%sp)
	flw	%f1, 0(%a2)
	lw	%a1, 11(%sp)
	flw	%f0, 0(%a1)
	fmul	%f11, %f1, %f0
	flw	%f1, 1(%a2)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 2(%a2)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f11, %f0
	fblt	%f1, %fzero, fbgt_else.39668
	add	%a1, %zero, %zero
	j	fbgt_cont.39669
fbgt_else.39668:
	add	%a1, %zero, %k1
fbgt_cont.39669:
	beqi	%a1, 0, bnei_else.39670
	lw	%a0, 10(%sp)
	lw	%a0, 119(%a0)
	sw	%a0, 13(%sp)
	flw	%f0, 440(%zero)
	fdiv	%f22, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 14(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -15
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.39672
	add	%a0, %zero, %zero
	j	fbgt_cont.39673
fbgt_else.39672:
	add	%a0, %zero, %k1
fbgt_cont.39673:
	beqi	%a0, 0, bnei_else.39674
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.39676
	add	%a0, %zero, %zero
	j	bnei_cont.39675
fbgt_else.39676:
	add	%a0, %zero, %k1
fbgt_cont.39677:
	j	bnei_cont.39675
bnei_else.39674:
	add	%a0, %zero, %zero
bnei_cont.39675:
	beqi	%a0, 0, bnei_cont.39671
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a0, 13(%sp)
	lw	%ra, 0(%a0)
	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.39680
	beqi	%k0, 2, bnei_else.39682
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
	beqi	%a2, 0, bnei_else.39684
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 474(%zero)
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
	j	bnei_cont.39685
bnei_else.39684:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.39685:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.39686
	add	%a0, %zero, %k1
	j	fbeq_cont.39687
fbeq_else.39686:
	add	%a0, %zero, %zero
fbeq_cont.39687:
	beqi	%a0, 0, bnei_else.39688
	fmov	%f0, %f30
	j	bnei_cont.39689
bnei_else.39688:
	beqi	%a3, 0, bnei_else.39690
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39691
bnei_else.39690:
	fdiv	%f0, %f30, %f1
bnei_cont.39691:
bnei_cont.39689:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39681
bnei_else.39682:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.39683:
	j	bnei_cont.39681
bnei_else.39680:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.39692
	add	%a0, %zero, %k1
	j	fbeq_cont.39693
fbeq_else.39692:
	add	%a0, %zero, %zero
fbeq_cont.39693:
	beqi	%a0, 0, bnei_else.39694
	fmov	%f0, %fzero
	j	bnei_cont.39695
bnei_else.39694:
	fblt	%fzero, %f0, fbgt_else.39696
	add	%a0, %zero, %zero
	j	fbgt_cont.39697
fbgt_else.39696:
	add	%a0, %zero, %k1
fbgt_cont.39697:
	beqi	%a0, 0, bnei_else.39698
	fmov	%f0, %f30
	j	bnei_cont.39699
bnei_else.39698:
	flw	%f0, 468(%zero)
bnei_cont.39699:
bnei_cont.39695:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.39681:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 15
	jal	utexture.2959
	addi	%sp, %sp, -15
	lw	%v1, 14(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 15
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.39700
	j	bnei_cont.39671
bnei_else.39700:
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
	fblt	%fzero, %f0, fbgt_else.39702
	add	%a0, %zero, %zero
	j	fbgt_cont.39703
fbgt_else.39702:
	add	%a0, %zero, %k1
fbgt_cont.39703:
	beqi	%a0, 0, bnei_else.39704
	j	bnei_cont.39705
bnei_else.39704:
	fmov	%f0, %fzero
bnei_cont.39705:
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
bnei_cont.39701:
	j	bnei_cont.39671
bnei_else.39678:
bnei_cont.39679:
	j	bnei_cont.39671
bnei_else.39670:
	flw	%f0, 439(%zero)
	fdiv	%f22, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 15(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 16
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -16
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.39706
	add	%a0, %zero, %zero
	j	fbgt_cont.39707
fbgt_else.39706:
	add	%a0, %zero, %k1
fbgt_cont.39707:
	beqi	%a0, 0, bnei_else.39708
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.39710
	add	%a0, %zero, %zero
	j	bnei_cont.39709
fbgt_else.39710:
	add	%a0, %zero, %k1
fbgt_cont.39711:
	j	bnei_cont.39709
bnei_else.39708:
	add	%a0, %zero, %zero
bnei_cont.39709:
	beqi	%a0, 0, bnei_else.39712
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.39714
	beqi	%k0, 2, bnei_else.39716
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
	beqi	%a2, 0, bnei_else.39718
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 474(%zero)
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
	j	bnei_cont.39719
bnei_else.39718:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.39719:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.39720
	add	%a0, %zero, %k1
	j	fbeq_cont.39721
fbeq_else.39720:
	add	%a0, %zero, %zero
fbeq_cont.39721:
	beqi	%a0, 0, bnei_else.39722
	fmov	%f0, %f30
	j	bnei_cont.39723
bnei_else.39722:
	beqi	%a3, 0, bnei_else.39724
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39725
bnei_else.39724:
	fdiv	%f0, %f30, %f1
bnei_cont.39725:
bnei_cont.39723:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39715
bnei_else.39716:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.39717:
	j	bnei_cont.39715
bnei_else.39714:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 12(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.39726
	add	%a0, %zero, %k1
	j	fbeq_cont.39727
fbeq_else.39726:
	add	%a0, %zero, %zero
fbeq_cont.39727:
	beqi	%a0, 0, bnei_else.39728
	fmov	%f0, %fzero
	j	bnei_cont.39729
bnei_else.39728:
	fblt	%fzero, %f0, fbgt_else.39730
	add	%a0, %zero, %zero
	j	fbgt_cont.39731
fbgt_else.39730:
	add	%a0, %zero, %k1
fbgt_cont.39731:
	beqi	%a0, 0, bnei_else.39732
	fmov	%f0, %f30
	j	bnei_cont.39733
bnei_else.39732:
	flw	%f0, 468(%zero)
bnei_cont.39733:
bnei_cont.39729:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.39715:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 16
	jal	utexture.2959
	addi	%sp, %sp, -16
	lw	%v1, 15(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -16
	beqi	%v0, 0, bnei_else.39734
	j	bnei_cont.39713
bnei_else.39734:
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
	fblt	%fzero, %f0, fbgt_else.39736
	add	%a0, %zero, %zero
	j	fbgt_cont.39737
fbgt_else.39736:
	add	%a0, %zero, %k1
fbgt_cont.39737:
	beqi	%a0, 0, bnei_else.39738
	j	bnei_cont.39739
bnei_else.39738:
	fmov	%f0, %fzero
bnei_cont.39739:
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
bnei_cont.39735:
	j	bnei_cont.39713
bnei_else.39712:
bnei_cont.39713:
bnei_cont.39671:
	addi	%a1, %zero, 116
	lw	%v1, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%a0, %t0, 0
	addi	%sp, %sp, 16
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -16
	lw	%a0, 6(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.39667
bnei_else.39666:
bnei_cont.39667:
	addi	%v1, %t1, 1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3031
bgti_else.39665:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.39664:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgti_else.39661:
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.39660:
	add	%t0, %zero, %a0
	jr	%ra
pretrace_pixels.3034:
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
	blti	%v1, 0, bgti_else.40042
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
	fbne	%f0, %fzero, fbeq_else.40043
	add	%a0, %zero, %k1
	j	fbeq_cont.40044
fbeq_else.40043:
	add	%a0, %zero, %zero
fbeq_cont.40044:
	beqi	%a0, 0, bnei_else.40045
	fmov	%f0, %f30
	j	bnei_cont.40046
bnei_else.40045:
	fdiv	%f0, %f30, %f0
bnei_cont.40046:
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
	addi	%sp, %sp, 13
	jal	trace_ray.2971
	addi	%sp, %sp, -13
	lw	%a2, 7(%t0)
	lw	%fp, 6(%t0)
	lw	%a0, 5(%t0)
	sw	%a0, 13(%sp)
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
	blti	%a0, 0, bgti_else.40047
	lw	%a0, 0(%k0)
	beqi	%a0, 0, bnei_else.40049
	lw	%a0, 0(%fp)
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
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -14
	lw	%a0, 118(%t2)
	lw	%t4, 0(%a0)
	flw	%f1, 0(%t4)
	flw	%f0, 0(%t3)
	fmul	%f11, %f1, %f0
	flw	%f1, 1(%t4)
	flw	%f0, 1(%t3)
	fmul	%f0, %f1, %f0
	fadd	%f11, %f11, %f0
	flw	%f1, 2(%t4)
	flw	%f0, 2(%t3)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f11, %f0
	fblt	%f1, %fzero, fbgt_else.40051
	add	%a1, %zero, %zero
	j	fbgt_cont.40052
fbgt_else.40051:
	add	%a1, %zero, %k1
fbgt_cont.40052:
	beqi	%a1, 0, bnei_else.40053
	lw	%t4, 119(%t2)
	flw	%f0, 440(%zero)
	fdiv	%f22, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t5, 134(%zero)
	addi	%a0, %t4, 0
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 14
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -14
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40055
	add	%a0, %zero, %zero
	j	fbgt_cont.40056
fbgt_else.40055:
	add	%a0, %zero, %k1
fbgt_cont.40056:
	beqi	%a0, 0, bnei_else.40057
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40059
	add	%a0, %zero, %zero
	j	bnei_cont.40058
fbgt_else.40059:
	add	%a0, %zero, %k1
fbgt_cont.40060:
	j	bnei_cont.40058
bnei_else.40057:
	add	%a0, %zero, %zero
bnei_cont.40058:
	beqi	%a0, 0, bnei_cont.40054
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%ra, 0(%t4)
	lw	%a1, 9(%v0)
	lw	%t4, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.40063
	beqi	%k0, 2, bnei_else.40065
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
	beqi	%a2, 0, bnei_else.40067
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 474(%zero)
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
	j	bnei_cont.40068
bnei_else.40067:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40068:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40069
	add	%a0, %zero, %k1
	j	fbeq_cont.40070
fbeq_else.40069:
	add	%a0, %zero, %zero
fbeq_cont.40070:
	beqi	%a0, 0, bnei_else.40071
	fmov	%f0, %f30
	j	bnei_cont.40072
bnei_else.40071:
	beqi	%a3, 0, bnei_else.40073
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40074
bnei_else.40073:
	fdiv	%f0, %f30, %f1
bnei_cont.40074:
bnei_cont.40072:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40064
bnei_else.40065:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40066:
	j	bnei_cont.40064
bnei_else.40063:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40075
	add	%a0, %zero, %k1
	j	fbeq_cont.40076
fbeq_else.40075:
	add	%a0, %zero, %zero
fbeq_cont.40076:
	beqi	%a0, 0, bnei_else.40077
	fmov	%f0, %fzero
	j	bnei_cont.40078
bnei_else.40077:
	fblt	%fzero, %f0, fbgt_else.40079
	add	%a0, %zero, %zero
	j	fbgt_cont.40080
fbgt_else.40079:
	add	%a0, %zero, %k1
fbgt_cont.40080:
	beqi	%a0, 0, bnei_else.40081
	fmov	%f0, %f30
	j	bnei_cont.40082
bnei_else.40081:
	flw	%f0, 468(%zero)
bnei_cont.40082:
bnei_cont.40078:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40064:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 14
	jal	utexture.2959
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.40083
	j	bnei_cont.40054
bnei_else.40083:
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
	fblt	%fzero, %f0, fbgt_else.40085
	add	%a0, %zero, %zero
	j	fbgt_cont.40086
fbgt_else.40085:
	add	%a0, %zero, %k1
fbgt_cont.40086:
	beqi	%a0, 0, bnei_else.40087
	j	bnei_cont.40088
bnei_else.40087:
	fmov	%f0, %fzero
bnei_cont.40088:
	fmul	%f1, %f22, %f0
	flw	%f0, 0(%t4)
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
bnei_cont.40084:
	j	bnei_cont.40054
bnei_else.40061:
bnei_cont.40062:
	j	bnei_cont.40054
bnei_else.40053:
	flw	%f0, 439(%zero)
	fdiv	%f22, %f1, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t5, 134(%zero)
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 14
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -14
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40089
	add	%a0, %zero, %zero
	j	fbgt_cont.40090
fbgt_else.40089:
	add	%a0, %zero, %k1
fbgt_cont.40090:
	beqi	%a0, 0, bnei_else.40091
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40093
	add	%a0, %zero, %zero
	j	bnei_cont.40092
fbgt_else.40093:
	add	%a0, %zero, %k1
fbgt_cont.40094:
	j	bnei_cont.40092
bnei_else.40091:
	add	%a0, %zero, %zero
bnei_cont.40092:
	beqi	%a0, 0, bnei_else.40095
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.40097
	beqi	%k0, 2, bnei_else.40099
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
	beqi	%a2, 0, bnei_else.40101
	flw	%f11, 2(%a1)
	fmul	%f1, %f15, %f11
	flw	%f13, 1(%a1)
	fmul	%f0, %f16, %f13
	fadd	%f0, %f1, %f0
	flw	%f12, 474(%zero)
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
	j	bnei_cont.40102
bnei_else.40101:
	fsw	%f19, 142(%zero)
	fsw	%f18, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40102:
	flw	%f13, 142(%zero)
	fmul	%f1, %f13, %f13
	flw	%f12, 143(%zero)
	fmul	%f0, %f12, %f12
	fadd	%f1, %f1, %f0
	flw	%f11, 144(%zero)
	fmul	%f0, %f11, %f11
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40103
	add	%a0, %zero, %k1
	j	fbeq_cont.40104
fbeq_else.40103:
	add	%a0, %zero, %zero
fbeq_cont.40104:
	beqi	%a0, 0, bnei_else.40105
	fmov	%f0, %f30
	j	bnei_cont.40106
bnei_else.40105:
	beqi	%a3, 0, bnei_else.40107
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40108
bnei_else.40107:
	fdiv	%f0, %f30, %f1
bnei_cont.40108:
bnei_cont.40106:
	fmul	%f1, %f13, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f12, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f11, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40098
bnei_else.40099:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40100:
	j	bnei_cont.40098
bnei_else.40097:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t4, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40109
	add	%a0, %zero, %k1
	j	fbeq_cont.40110
fbeq_else.40109:
	add	%a0, %zero, %zero
fbeq_cont.40110:
	beqi	%a0, 0, bnei_else.40111
	fmov	%f0, %fzero
	j	bnei_cont.40112
bnei_else.40111:
	fblt	%fzero, %f0, fbgt_else.40113
	add	%a0, %zero, %zero
	j	fbgt_cont.40114
fbgt_else.40113:
	add	%a0, %zero, %k1
fbgt_cont.40114:
	beqi	%a0, 0, bnei_else.40115
	fmov	%f0, %f30
	j	bnei_cont.40116
bnei_else.40115:
	flw	%f0, 468(%zero)
bnei_cont.40116:
bnei_cont.40112:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40098:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 14
	jal	utexture.2959
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.40117
	j	bnei_cont.40096
bnei_else.40117:
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
	fblt	%fzero, %f0, fbgt_else.40119
	add	%a0, %zero, %zero
	j	fbgt_cont.40120
fbgt_else.40119:
	add	%a0, %zero, %k1
fbgt_cont.40120:
	beqi	%a0, 0, bnei_else.40121
	j	bnei_cont.40122
bnei_else.40121:
	fmov	%f0, %fzero
bnei_cont.40122:
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
bnei_cont.40118:
	j	bnei_cont.40096
bnei_else.40095:
bnei_cont.40096:
bnei_cont.40054:
	addi	%a1, %zero, 116
	addi	%a0, %t1, 0
	addi	%v1, %t3, 0
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -14
	lw	%a0, 13(%sp)
	lw	%a0, 0(%a0)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.40050
bnei_else.40049:
bnei_cont.40050:
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 14
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -14
	j	bgti_cont.40048
bgti_else.40047:
bgti_cont.40048:
	lw	%a0, 4(%sp)
	addi	%v1, %a0, -1
	lw	%a0, 5(%sp)
	addi	%a0, %a0, 1
	blti	%a0, 5, bgti_else.40123
	addi	%a0, %a0, -5
	j	bgti_cont.40124
bgti_else.40123:
bgti_cont.40124:
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
	j	pretrace_pixels.3034
bgti_else.40042:
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
	blt	%v0, %t0, bgt_else.42440
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.42440:
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
	blt	%a0, %a2, bgt_else.42442
	add	%a0, %zero, %zero
	j	bgt_cont.42443
bgt_else.42442:
	blt	%zero, %v1, bgt_else.42444
	add	%a0, %zero, %zero
	j	bgt_cont.42445
bgt_else.42444:
	addi	%a0, %v0, 1
	blt	%a0, %t0, bgt_else.42446
	add	%a0, %zero, %zero
	j	bgt_cont.42447
bgt_else.42446:
	blt	%zero, %v0, bgt_else.42448
	add	%a0, %zero, %zero
	j	bgt_cont.42449
bgt_else.42448:
	add	%a0, %zero, %k1
bgt_cont.42449:
bgt_cont.42447:
bgt_cont.42445:
bgt_cont.42443:
	beqi	%a0, 0, bnei_else.42450
	lw	%fp, 0(%a3)
	blti	%fp, 0, bnei_cont.42451
	lw	%a0, 2(%sp)
	lw	%a3, 0(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%ra, 5(%a0)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.42454
	lw	%a0, 4(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.42456
	addi	%a0, %a3, -1
	lw	%a2, 3(%sp)
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.42458
	addi	%a0, %a3, 1
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.42460
	add	%a0, %zero, %k1
	j	beq_cont.42455
beq_else.42460:
	add	%a0, %zero, %zero
beq_cont.42461:
	j	beq_cont.42455
beq_else.42458:
	add	%a0, %zero, %zero
beq_cont.42459:
	j	beq_cont.42455
beq_else.42456:
	add	%a0, %zero, %zero
beq_cont.42457:
	j	beq_cont.42455
beq_else.42454:
	add	%a0, %zero, %zero
beq_cont.42455:
	beqi	%a0, 0, bnei_else.42462
	lw	%a0, 0(%a1)
	beqi	%a0, 0, bnei_else.42464
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
	j	bnei_cont.42465
bnei_else.42464:
bnei_cont.42465:
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a3, %k1, 0
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -14
	j	bnei_cont.42451
bnei_else.42462:
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
bnei_cont.42463:
	j	bnei_cont.42451
bgti_else.42452:
bgti_cont.42453:
	j	bnei_cont.42451
bnei_else.42450:
	lw	%a0, 0(%a3)
	blti	%a0, 0, bgti_else.42466
	lw	%a0, 0(%a1)
	beqi	%a0, 0, bnei_else.42468
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
	beqi	%t4, 0, bnei_else.42470
	lw	%v0, 179(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42471
bnei_else.42470:
bnei_cont.42471:
	beqi	%t4, 1, bnei_else.42472
	lw	%v0, 180(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42473
bnei_else.42472:
bnei_cont.42473:
	beqi	%t4, 2, bnei_else.42474
	lw	%v0, 181(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42475
bnei_else.42474:
bnei_cont.42475:
	beqi	%t4, 3, bnei_else.42476
	lw	%v0, 182(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42477
bnei_else.42476:
bnei_cont.42477:
	beqi	%t4, 4, bnei_else.42478
	lw	%v0, 183(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42479
bnei_else.42478:
bnei_cont.42479:
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
	j	bnei_cont.42469
bnei_else.42468:
bnei_cont.42469:
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
	j	bgti_cont.42467
bgti_else.42466:
bgti_cont.42467:
bnei_cont.42451:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.42480
	blti	%a1, 0, bgti_else.42482
	j	bgt_cont.42481
bgti_else.42482:
	add	%a1, %zero, %zero
bgti_cont.42483:
	j	bgt_cont.42481
bgt_else.42480:
	addi	%a1, %zero, 255
bgt_cont.42481:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	addi	%t1, %zero, 10
	blti	%a1, 10, bgti_else.42484
	blti	%a1, 20, bgti_else.42486
	blti	%a1, 30, bgti_else.42488
	blti	%a1, 40, bgti_else.42490
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42485
	blti	%a1, 20, bgti_else.42494
	blti	%a1, 30, bgti_else.42496
	blti	%a1, 40, bgti_else.42498
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42485
	blti	%a1, 20, bgti_else.42502
	blti	%a1, 30, bgti_else.42504
	blti	%a1, 40, bgti_else.42506
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42485
	blti	%a1, 20, bgti_else.42510
	blti	%a1, 30, bgti_else.42512
	blti	%a1, 40, bgti_else.42514
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.42485
bgti_else.42514:
	addi	%a1, %a1, -30
bgti_cont.42515:
	j	bgti_cont.42485
bgti_else.42512:
	addi	%a1, %a1, -20
bgti_cont.42513:
	j	bgti_cont.42485
bgti_else.42510:
	addi	%a1, %a1, -10
bgti_cont.42511:
	j	bgti_cont.42485
bgti_else.42508:
bgti_cont.42509:
	j	bgti_cont.42485
bgti_else.42506:
	addi	%a1, %a1, -30
bgti_cont.42507:
	j	bgti_cont.42485
bgti_else.42504:
	addi	%a1, %a1, -20
bgti_cont.42505:
	j	bgti_cont.42485
bgti_else.42502:
	addi	%a1, %a1, -10
bgti_cont.42503:
	j	bgti_cont.42485
bgti_else.42500:
bgti_cont.42501:
	j	bgti_cont.42485
bgti_else.42498:
	addi	%a1, %a1, -30
bgti_cont.42499:
	j	bgti_cont.42485
bgti_else.42496:
	addi	%a1, %a1, -20
bgti_cont.42497:
	j	bgti_cont.42485
bgti_else.42494:
	addi	%a1, %a1, -10
bgti_cont.42495:
	j	bgti_cont.42485
bgti_else.42492:
bgti_cont.42493:
	j	bgti_cont.42485
bgti_else.42490:
	addi	%a1, %a1, -30
bgti_cont.42491:
	j	bgti_cont.42485
bgti_else.42488:
	addi	%a1, %a1, -20
bgti_cont.42489:
	j	bgti_cont.42485
bgti_else.42486:
	addi	%a1, %a1, -10
bgti_cont.42487:
	j	bgti_cont.42485
bgti_else.42484:
bgti_cont.42485:
	blt	%zero, %a2, bgt_else.42516
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42517
bgt_else.42516:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.42518
	blti	%a2, 20, bgti_else.42520
	blti	%a2, 30, bgti_else.42522
	blti	%a2, 40, bgti_else.42524
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42519
	blti	%a2, 20, bgti_else.42528
	blti	%a2, 30, bgti_else.42530
	blti	%a2, 40, bgti_else.42532
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42519
	blti	%a2, 20, bgti_else.42536
	blti	%a2, 30, bgti_else.42538
	blti	%a2, 40, bgti_else.42540
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42519
	blti	%a2, 20, bgti_else.42544
	blti	%a2, 30, bgti_else.42546
	blti	%a2, 40, bgti_else.42548
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.42519
bgti_else.42548:
	addi	%a2, %a2, -30
bgti_cont.42549:
	j	bgti_cont.42519
bgti_else.42546:
	addi	%a2, %a2, -20
bgti_cont.42547:
	j	bgti_cont.42519
bgti_else.42544:
	addi	%a2, %a2, -10
bgti_cont.42545:
	j	bgti_cont.42519
bgti_else.42542:
bgti_cont.42543:
	j	bgti_cont.42519
bgti_else.42540:
	addi	%a2, %a2, -30
bgti_cont.42541:
	j	bgti_cont.42519
bgti_else.42538:
	addi	%a2, %a2, -20
bgti_cont.42539:
	j	bgti_cont.42519
bgti_else.42536:
	addi	%a2, %a2, -10
bgti_cont.42537:
	j	bgti_cont.42519
bgti_else.42534:
bgti_cont.42535:
	j	bgti_cont.42519
bgti_else.42532:
	addi	%a2, %a2, -30
bgti_cont.42533:
	j	bgti_cont.42519
bgti_else.42530:
	addi	%a2, %a2, -20
bgti_cont.42531:
	j	bgti_cont.42519
bgti_else.42528:
	addi	%a2, %a2, -10
bgti_cont.42529:
	j	bgti_cont.42519
bgti_else.42526:
bgti_cont.42527:
	j	bgti_cont.42519
bgti_else.42524:
	addi	%a2, %a2, -30
bgti_cont.42525:
	j	bgti_cont.42519
bgti_else.42522:
	addi	%a2, %a2, -20
bgti_cont.42523:
	j	bgti_cont.42519
bgti_else.42520:
	addi	%a2, %a2, -10
bgti_cont.42521:
	j	bgti_cont.42519
bgti_else.42518:
bgti_cont.42519:
	blt	%zero, %a0, bgt_else.42550
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42551
bgt_else.42550:
	blti	%a0, 10, bgti_else.42552
	blti	%a0, 20, bgti_else.42554
	blti	%a0, 30, bgti_else.42556
	blti	%a0, 40, bgti_else.42558
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42553
	blti	%a0, 20, bgti_else.42562
	blti	%a0, 30, bgti_else.42564
	blti	%a0, 40, bgti_else.42566
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42553
	blti	%a0, 20, bgti_else.42570
	blti	%a0, 30, bgti_else.42572
	blti	%a0, 40, bgti_else.42574
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42553
	blti	%a0, 20, bgti_else.42578
	blti	%a0, 30, bgti_else.42580
	blti	%a0, 40, bgti_else.42582
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.42553
bgti_else.42582:
	addi	%a0, %a0, -30
bgti_cont.42583:
	j	bgti_cont.42553
bgti_else.42580:
	addi	%a0, %a0, -20
bgti_cont.42581:
	j	bgti_cont.42553
bgti_else.42578:
	addi	%a0, %a0, -10
bgti_cont.42579:
	j	bgti_cont.42553
bgti_else.42576:
bgti_cont.42577:
	j	bgti_cont.42553
bgti_else.42574:
	addi	%a0, %a0, -30
bgti_cont.42575:
	j	bgti_cont.42553
bgti_else.42572:
	addi	%a0, %a0, -20
bgti_cont.42573:
	j	bgti_cont.42553
bgti_else.42570:
	addi	%a0, %a0, -10
bgti_cont.42571:
	j	bgti_cont.42553
bgti_else.42568:
bgti_cont.42569:
	j	bgti_cont.42553
bgti_else.42566:
	addi	%a0, %a0, -30
bgti_cont.42567:
	j	bgti_cont.42553
bgti_else.42564:
	addi	%a0, %a0, -20
bgti_cont.42565:
	j	bgti_cont.42553
bgti_else.42562:
	addi	%a0, %a0, -10
bgti_cont.42563:
	j	bgti_cont.42553
bgti_else.42560:
bgti_cont.42561:
	j	bgti_cont.42553
bgti_else.42558:
	addi	%a0, %a0, -30
bgti_cont.42559:
	j	bgti_cont.42553
bgti_else.42556:
	addi	%a0, %a0, -20
bgti_cont.42557:
	j	bgti_cont.42553
bgti_else.42554:
	addi	%a0, %a0, -10
bgti_cont.42555:
	j	bgti_cont.42553
bgti_else.42552:
bgti_cont.42553:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.42551:
bgt_cont.42517:
	addi	%t2, %zero, 32
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.42584
	blti	%a1, 0, bgti_else.42586
	j	bgt_cont.42585
bgti_else.42586:
	add	%a1, %zero, %zero
bgti_cont.42587:
	j	bgt_cont.42585
bgt_else.42584:
	addi	%a1, %zero, 255
bgt_cont.42585:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.42588
	blti	%a1, 20, bgti_else.42590
	blti	%a1, 30, bgti_else.42592
	blti	%a1, 40, bgti_else.42594
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42589
	blti	%a1, 20, bgti_else.42598
	blti	%a1, 30, bgti_else.42600
	blti	%a1, 40, bgti_else.42602
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42589
	blti	%a1, 20, bgti_else.42606
	blti	%a1, 30, bgti_else.42608
	blti	%a1, 40, bgti_else.42610
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42589
	blti	%a1, 20, bgti_else.42614
	blti	%a1, 30, bgti_else.42616
	blti	%a1, 40, bgti_else.42618
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.42589
bgti_else.42618:
	addi	%a1, %a1, -30
bgti_cont.42619:
	j	bgti_cont.42589
bgti_else.42616:
	addi	%a1, %a1, -20
bgti_cont.42617:
	j	bgti_cont.42589
bgti_else.42614:
	addi	%a1, %a1, -10
bgti_cont.42615:
	j	bgti_cont.42589
bgti_else.42612:
bgti_cont.42613:
	j	bgti_cont.42589
bgti_else.42610:
	addi	%a1, %a1, -30
bgti_cont.42611:
	j	bgti_cont.42589
bgti_else.42608:
	addi	%a1, %a1, -20
bgti_cont.42609:
	j	bgti_cont.42589
bgti_else.42606:
	addi	%a1, %a1, -10
bgti_cont.42607:
	j	bgti_cont.42589
bgti_else.42604:
bgti_cont.42605:
	j	bgti_cont.42589
bgti_else.42602:
	addi	%a1, %a1, -30
bgti_cont.42603:
	j	bgti_cont.42589
bgti_else.42600:
	addi	%a1, %a1, -20
bgti_cont.42601:
	j	bgti_cont.42589
bgti_else.42598:
	addi	%a1, %a1, -10
bgti_cont.42599:
	j	bgti_cont.42589
bgti_else.42596:
bgti_cont.42597:
	j	bgti_cont.42589
bgti_else.42594:
	addi	%a1, %a1, -30
bgti_cont.42595:
	j	bgti_cont.42589
bgti_else.42592:
	addi	%a1, %a1, -20
bgti_cont.42593:
	j	bgti_cont.42589
bgti_else.42590:
	addi	%a1, %a1, -10
bgti_cont.42591:
	j	bgti_cont.42589
bgti_else.42588:
bgti_cont.42589:
	blt	%zero, %a2, bgt_else.42620
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42621
bgt_else.42620:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.42622
	blti	%a2, 20, bgti_else.42624
	blti	%a2, 30, bgti_else.42626
	blti	%a2, 40, bgti_else.42628
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42623
	blti	%a2, 20, bgti_else.42632
	blti	%a2, 30, bgti_else.42634
	blti	%a2, 40, bgti_else.42636
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42623
	blti	%a2, 20, bgti_else.42640
	blti	%a2, 30, bgti_else.42642
	blti	%a2, 40, bgti_else.42644
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42623
	blti	%a2, 20, bgti_else.42648
	blti	%a2, 30, bgti_else.42650
	blti	%a2, 40, bgti_else.42652
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.42623
bgti_else.42652:
	addi	%a2, %a2, -30
bgti_cont.42653:
	j	bgti_cont.42623
bgti_else.42650:
	addi	%a2, %a2, -20
bgti_cont.42651:
	j	bgti_cont.42623
bgti_else.42648:
	addi	%a2, %a2, -10
bgti_cont.42649:
	j	bgti_cont.42623
bgti_else.42646:
bgti_cont.42647:
	j	bgti_cont.42623
bgti_else.42644:
	addi	%a2, %a2, -30
bgti_cont.42645:
	j	bgti_cont.42623
bgti_else.42642:
	addi	%a2, %a2, -20
bgti_cont.42643:
	j	bgti_cont.42623
bgti_else.42640:
	addi	%a2, %a2, -10
bgti_cont.42641:
	j	bgti_cont.42623
bgti_else.42638:
bgti_cont.42639:
	j	bgti_cont.42623
bgti_else.42636:
	addi	%a2, %a2, -30
bgti_cont.42637:
	j	bgti_cont.42623
bgti_else.42634:
	addi	%a2, %a2, -20
bgti_cont.42635:
	j	bgti_cont.42623
bgti_else.42632:
	addi	%a2, %a2, -10
bgti_cont.42633:
	j	bgti_cont.42623
bgti_else.42630:
bgti_cont.42631:
	j	bgti_cont.42623
bgti_else.42628:
	addi	%a2, %a2, -30
bgti_cont.42629:
	j	bgti_cont.42623
bgti_else.42626:
	addi	%a2, %a2, -20
bgti_cont.42627:
	j	bgti_cont.42623
bgti_else.42624:
	addi	%a2, %a2, -10
bgti_cont.42625:
	j	bgti_cont.42623
bgti_else.42622:
bgti_cont.42623:
	blt	%zero, %a0, bgt_else.42654
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42655
bgt_else.42654:
	blti	%a0, 10, bgti_else.42656
	blti	%a0, 20, bgti_else.42658
	blti	%a0, 30, bgti_else.42660
	blti	%a0, 40, bgti_else.42662
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42657
	blti	%a0, 20, bgti_else.42666
	blti	%a0, 30, bgti_else.42668
	blti	%a0, 40, bgti_else.42670
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42657
	blti	%a0, 20, bgti_else.42674
	blti	%a0, 30, bgti_else.42676
	blti	%a0, 40, bgti_else.42678
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42657
	blti	%a0, 20, bgti_else.42682
	blti	%a0, 30, bgti_else.42684
	blti	%a0, 40, bgti_else.42686
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.42657
bgti_else.42686:
	addi	%a0, %a0, -30
bgti_cont.42687:
	j	bgti_cont.42657
bgti_else.42684:
	addi	%a0, %a0, -20
bgti_cont.42685:
	j	bgti_cont.42657
bgti_else.42682:
	addi	%a0, %a0, -10
bgti_cont.42683:
	j	bgti_cont.42657
bgti_else.42680:
bgti_cont.42681:
	j	bgti_cont.42657
bgti_else.42678:
	addi	%a0, %a0, -30
bgti_cont.42679:
	j	bgti_cont.42657
bgti_else.42676:
	addi	%a0, %a0, -20
bgti_cont.42677:
	j	bgti_cont.42657
bgti_else.42674:
	addi	%a0, %a0, -10
bgti_cont.42675:
	j	bgti_cont.42657
bgti_else.42672:
bgti_cont.42673:
	j	bgti_cont.42657
bgti_else.42670:
	addi	%a0, %a0, -30
bgti_cont.42671:
	j	bgti_cont.42657
bgti_else.42668:
	addi	%a0, %a0, -20
bgti_cont.42669:
	j	bgti_cont.42657
bgti_else.42666:
	addi	%a0, %a0, -10
bgti_cont.42667:
	j	bgti_cont.42657
bgti_else.42664:
bgti_cont.42665:
	j	bgti_cont.42657
bgti_else.42662:
	addi	%a0, %a0, -30
bgti_cont.42663:
	j	bgti_cont.42657
bgti_else.42660:
	addi	%a0, %a0, -20
bgti_cont.42661:
	j	bgti_cont.42657
bgti_else.42658:
	addi	%a0, %a0, -10
bgti_cont.42659:
	j	bgti_cont.42657
bgti_else.42656:
bgti_cont.42657:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.42655:
bgt_cont.42621:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.42688
	blti	%a1, 0, bgti_else.42690
	j	bgt_cont.42689
bgti_else.42690:
	add	%a1, %zero, %zero
bgti_cont.42691:
	j	bgt_cont.42689
bgt_else.42688:
	addi	%a1, %zero, 255
bgt_cont.42689:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.42692
	blti	%a1, 20, bgti_else.42694
	blti	%a1, 30, bgti_else.42696
	blti	%a1, 40, bgti_else.42698
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42693
	blti	%a1, 20, bgti_else.42702
	blti	%a1, 30, bgti_else.42704
	blti	%a1, 40, bgti_else.42706
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42693
	blti	%a1, 20, bgti_else.42710
	blti	%a1, 30, bgti_else.42712
	blti	%a1, 40, bgti_else.42714
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42693
	blti	%a1, 20, bgti_else.42718
	blti	%a1, 30, bgti_else.42720
	blti	%a1, 40, bgti_else.42722
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.42693
bgti_else.42722:
	addi	%a1, %a1, -30
bgti_cont.42723:
	j	bgti_cont.42693
bgti_else.42720:
	addi	%a1, %a1, -20
bgti_cont.42721:
	j	bgti_cont.42693
bgti_else.42718:
	addi	%a1, %a1, -10
bgti_cont.42719:
	j	bgti_cont.42693
bgti_else.42716:
bgti_cont.42717:
	j	bgti_cont.42693
bgti_else.42714:
	addi	%a1, %a1, -30
bgti_cont.42715:
	j	bgti_cont.42693
bgti_else.42712:
	addi	%a1, %a1, -20
bgti_cont.42713:
	j	bgti_cont.42693
bgti_else.42710:
	addi	%a1, %a1, -10
bgti_cont.42711:
	j	bgti_cont.42693
bgti_else.42708:
bgti_cont.42709:
	j	bgti_cont.42693
bgti_else.42706:
	addi	%a1, %a1, -30
bgti_cont.42707:
	j	bgti_cont.42693
bgti_else.42704:
	addi	%a1, %a1, -20
bgti_cont.42705:
	j	bgti_cont.42693
bgti_else.42702:
	addi	%a1, %a1, -10
bgti_cont.42703:
	j	bgti_cont.42693
bgti_else.42700:
bgti_cont.42701:
	j	bgti_cont.42693
bgti_else.42698:
	addi	%a1, %a1, -30
bgti_cont.42699:
	j	bgti_cont.42693
bgti_else.42696:
	addi	%a1, %a1, -20
bgti_cont.42697:
	j	bgti_cont.42693
bgti_else.42694:
	addi	%a1, %a1, -10
bgti_cont.42695:
	j	bgti_cont.42693
bgti_else.42692:
bgti_cont.42693:
	blt	%zero, %a2, bgt_else.42724
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42725
bgt_else.42724:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.42726
	blti	%a2, 20, bgti_else.42728
	blti	%a2, 30, bgti_else.42730
	blti	%a2, 40, bgti_else.42732
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42727
	blti	%a2, 20, bgti_else.42736
	blti	%a2, 30, bgti_else.42738
	blti	%a2, 40, bgti_else.42740
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42727
	blti	%a2, 20, bgti_else.42744
	blti	%a2, 30, bgti_else.42746
	blti	%a2, 40, bgti_else.42748
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42727
	blti	%a2, 20, bgti_else.42752
	blti	%a2, 30, bgti_else.42754
	blti	%a2, 40, bgti_else.42756
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.42727
bgti_else.42756:
	addi	%a2, %a2, -30
bgti_cont.42757:
	j	bgti_cont.42727
bgti_else.42754:
	addi	%a2, %a2, -20
bgti_cont.42755:
	j	bgti_cont.42727
bgti_else.42752:
	addi	%a2, %a2, -10
bgti_cont.42753:
	j	bgti_cont.42727
bgti_else.42750:
bgti_cont.42751:
	j	bgti_cont.42727
bgti_else.42748:
	addi	%a2, %a2, -30
bgti_cont.42749:
	j	bgti_cont.42727
bgti_else.42746:
	addi	%a2, %a2, -20
bgti_cont.42747:
	j	bgti_cont.42727
bgti_else.42744:
	addi	%a2, %a2, -10
bgti_cont.42745:
	j	bgti_cont.42727
bgti_else.42742:
bgti_cont.42743:
	j	bgti_cont.42727
bgti_else.42740:
	addi	%a2, %a2, -30
bgti_cont.42741:
	j	bgti_cont.42727
bgti_else.42738:
	addi	%a2, %a2, -20
bgti_cont.42739:
	j	bgti_cont.42727
bgti_else.42736:
	addi	%a2, %a2, -10
bgti_cont.42737:
	j	bgti_cont.42727
bgti_else.42734:
bgti_cont.42735:
	j	bgti_cont.42727
bgti_else.42732:
	addi	%a2, %a2, -30
bgti_cont.42733:
	j	bgti_cont.42727
bgti_else.42730:
	addi	%a2, %a2, -20
bgti_cont.42731:
	j	bgti_cont.42727
bgti_else.42728:
	addi	%a2, %a2, -10
bgti_cont.42729:
	j	bgti_cont.42727
bgti_else.42726:
bgti_cont.42727:
	blt	%zero, %a0, bgt_else.42758
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42759
bgt_else.42758:
	blti	%a0, 10, bgti_else.42760
	blti	%a0, 20, bgti_else.42762
	blti	%a0, 30, bgti_else.42764
	blti	%a0, 40, bgti_else.42766
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42761
	blti	%a0, 20, bgti_else.42770
	blti	%a0, 30, bgti_else.42772
	blti	%a0, 40, bgti_else.42774
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42761
	blti	%a0, 20, bgti_else.42778
	blti	%a0, 30, bgti_else.42780
	blti	%a0, 40, bgti_else.42782
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42761
	blti	%a0, 20, bgti_else.42786
	blti	%a0, 30, bgti_else.42788
	blti	%a0, 40, bgti_else.42790
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.42761
bgti_else.42790:
	addi	%a0, %a0, -30
bgti_cont.42791:
	j	bgti_cont.42761
bgti_else.42788:
	addi	%a0, %a0, -20
bgti_cont.42789:
	j	bgti_cont.42761
bgti_else.42786:
	addi	%a0, %a0, -10
bgti_cont.42787:
	j	bgti_cont.42761
bgti_else.42784:
bgti_cont.42785:
	j	bgti_cont.42761
bgti_else.42782:
	addi	%a0, %a0, -30
bgti_cont.42783:
	j	bgti_cont.42761
bgti_else.42780:
	addi	%a0, %a0, -20
bgti_cont.42781:
	j	bgti_cont.42761
bgti_else.42778:
	addi	%a0, %a0, -10
bgti_cont.42779:
	j	bgti_cont.42761
bgti_else.42776:
bgti_cont.42777:
	j	bgti_cont.42761
bgti_else.42774:
	addi	%a0, %a0, -30
bgti_cont.42775:
	j	bgti_cont.42761
bgti_else.42772:
	addi	%a0, %a0, -20
bgti_cont.42773:
	j	bgti_cont.42761
bgti_else.42770:
	addi	%a0, %a0, -10
bgti_cont.42771:
	j	bgti_cont.42761
bgti_else.42768:
bgti_cont.42769:
	j	bgti_cont.42761
bgti_else.42766:
	addi	%a0, %a0, -30
bgti_cont.42767:
	j	bgti_cont.42761
bgti_else.42764:
	addi	%a0, %a0, -20
bgti_cont.42765:
	j	bgti_cont.42761
bgti_else.42762:
	addi	%a0, %a0, -10
bgti_cont.42763:
	j	bgti_cont.42761
bgti_else.42760:
bgti_cont.42761:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.42759:
bgt_cont.42725:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	lw	%a0, 0(%sp)
	addi	%t3, %a0, 1
	blt	%t3, %t0, bgt_else.42792
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	jr	%ra
bgt_else.42792:
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
	blt	%a0, %a1, bgt_else.42794
	add	%a0, %zero, %zero
	j	bgt_cont.42795
bgt_else.42794:
	lw	%a0, 1(%sp)
	blt	%zero, %a0, bgt_else.42796
	add	%a0, %zero, %zero
	j	bgt_cont.42797
bgt_else.42796:
	addi	%a0, %t3, 1
	blt	%a0, %t0, bgt_else.42798
	add	%a0, %zero, %zero
	j	bgt_cont.42799
bgt_else.42798:
	blt	%zero, %t3, bgt_else.42800
	add	%a0, %zero, %zero
	j	bgt_cont.42801
bgt_else.42800:
	add	%a0, %zero, %k1
bgt_cont.42801:
bgt_cont.42799:
bgt_cont.42797:
bgt_cont.42795:
	beqi	%a0, 0, bnei_else.42802
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -14
	j	bnei_cont.42803
bnei_else.42802:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
bnei_cont.42803:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.42804
	blti	%a1, 0, bgti_else.42806
	j	bgt_cont.42805
bgti_else.42806:
	add	%a1, %zero, %zero
bgti_cont.42807:
	j	bgt_cont.42805
bgt_else.42804:
	addi	%a1, %zero, 255
bgt_cont.42805:
	blti	%a1, 10, bgti_else.42808
	blti	%a1, 20, bgti_else.42810
	blti	%a1, 30, bgti_else.42812
	blti	%a1, 40, bgti_else.42814
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.42816
	blti	%a0, 20, bgti_else.42818
	blti	%a0, 30, bgti_else.42820
	blti	%a0, 40, bgti_else.42822
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.42824
	blti	%a0, 20, bgti_else.42826
	blti	%a0, 30, bgti_else.42828
	blti	%a0, 40, bgti_else.42830
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.42809
bgti_else.42830:
	addi	%a2, %zero, 11
bgti_cont.42831:
	j	bgti_cont.42809
bgti_else.42828:
	addi	%a2, %zero, 10
bgti_cont.42829:
	j	bgti_cont.42809
bgti_else.42826:
	addi	%a2, %zero, 9
bgti_cont.42827:
	j	bgti_cont.42809
bgti_else.42824:
	addi	%a2, %zero, 8
bgti_cont.42825:
	j	bgti_cont.42809
bgti_else.42822:
	addi	%a2, %zero, 7
bgti_cont.42823:
	j	bgti_cont.42809
bgti_else.42820:
	addi	%a2, %zero, 6
bgti_cont.42821:
	j	bgti_cont.42809
bgti_else.42818:
	addi	%a2, %zero, 5
bgti_cont.42819:
	j	bgti_cont.42809
bgti_else.42816:
	addi	%a2, %zero, 4
bgti_cont.42817:
	j	bgti_cont.42809
bgti_else.42814:
	addi	%a2, %zero, 3
bgti_cont.42815:
	j	bgti_cont.42809
bgti_else.42812:
	addi	%a2, %zero, 2
bgti_cont.42813:
	j	bgti_cont.42809
bgti_else.42810:
	add	%a2, %zero, %k1
bgti_cont.42811:
	j	bgti_cont.42809
bgti_else.42808:
	add	%a2, %zero, %zero
bgti_cont.42809:
	blti	%a1, 10, bgti_else.42832
	blti	%a1, 20, bgti_else.42834
	blti	%a1, 30, bgti_else.42836
	blti	%a1, 40, bgti_else.42838
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42833
	blti	%a1, 20, bgti_else.42842
	blti	%a1, 30, bgti_else.42844
	blti	%a1, 40, bgti_else.42846
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42833
	blti	%a1, 20, bgti_else.42850
	blti	%a1, 30, bgti_else.42852
	blti	%a1, 40, bgti_else.42854
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.42833
bgti_else.42854:
	addi	%a1, %a1, -30
bgti_cont.42855:
	j	bgti_cont.42833
bgti_else.42852:
	addi	%a1, %a1, -20
bgti_cont.42853:
	j	bgti_cont.42833
bgti_else.42850:
	addi	%a1, %a1, -10
bgti_cont.42851:
	j	bgti_cont.42833
bgti_else.42848:
bgti_cont.42849:
	j	bgti_cont.42833
bgti_else.42846:
	addi	%a1, %a1, -30
bgti_cont.42847:
	j	bgti_cont.42833
bgti_else.42844:
	addi	%a1, %a1, -20
bgti_cont.42845:
	j	bgti_cont.42833
bgti_else.42842:
	addi	%a1, %a1, -10
bgti_cont.42843:
	j	bgti_cont.42833
bgti_else.42840:
bgti_cont.42841:
	j	bgti_cont.42833
bgti_else.42838:
	addi	%a1, %a1, -30
bgti_cont.42839:
	j	bgti_cont.42833
bgti_else.42836:
	addi	%a1, %a1, -20
bgti_cont.42837:
	j	bgti_cont.42833
bgti_else.42834:
	addi	%a1, %a1, -10
bgti_cont.42835:
	j	bgti_cont.42833
bgti_else.42832:
bgti_cont.42833:
	blt	%zero, %a2, bgt_else.42856
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42857
bgt_else.42856:
	blti	%a2, 10, bgti_else.42858
	blti	%a2, 20, bgti_else.42860
	blti	%a2, 30, bgti_else.42862
	blti	%a2, 40, bgti_else.42864
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.42866
	blti	%a0, 20, bgti_else.42868
	blti	%a0, 30, bgti_else.42870
	blti	%a0, 40, bgti_else.42872
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.42874
	blti	%a0, 20, bgti_else.42876
	blti	%a0, 30, bgti_else.42878
	blti	%a0, 40, bgti_else.42880
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.42859
bgti_else.42880:
	addi	%a0, %zero, 11
bgti_cont.42881:
	j	bgti_cont.42859
bgti_else.42878:
	addi	%a0, %zero, 10
bgti_cont.42879:
	j	bgti_cont.42859
bgti_else.42876:
	addi	%a0, %zero, 9
bgti_cont.42877:
	j	bgti_cont.42859
bgti_else.42874:
	addi	%a0, %zero, 8
bgti_cont.42875:
	j	bgti_cont.42859
bgti_else.42872:
	addi	%a0, %zero, 7
bgti_cont.42873:
	j	bgti_cont.42859
bgti_else.42870:
	addi	%a0, %zero, 6
bgti_cont.42871:
	j	bgti_cont.42859
bgti_else.42868:
	addi	%a0, %zero, 5
bgti_cont.42869:
	j	bgti_cont.42859
bgti_else.42866:
	addi	%a0, %zero, 4
bgti_cont.42867:
	j	bgti_cont.42859
bgti_else.42864:
	addi	%a0, %zero, 3
bgti_cont.42865:
	j	bgti_cont.42859
bgti_else.42862:
	addi	%a0, %zero, 2
bgti_cont.42863:
	j	bgti_cont.42859
bgti_else.42860:
	add	%a0, %zero, %k1
bgti_cont.42861:
	j	bgti_cont.42859
bgti_else.42858:
	add	%a0, %zero, %zero
bgti_cont.42859:
	blti	%a2, 10, bgti_else.42882
	blti	%a2, 20, bgti_else.42884
	blti	%a2, 30, bgti_else.42886
	blti	%a2, 40, bgti_else.42888
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42883
	blti	%a2, 20, bgti_else.42892
	blti	%a2, 30, bgti_else.42894
	blti	%a2, 40, bgti_else.42896
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42883
	blti	%a2, 20, bgti_else.42900
	blti	%a2, 30, bgti_else.42902
	blti	%a2, 40, bgti_else.42904
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.42883
bgti_else.42904:
	addi	%a2, %a2, -30
bgti_cont.42905:
	j	bgti_cont.42883
bgti_else.42902:
	addi	%a2, %a2, -20
bgti_cont.42903:
	j	bgti_cont.42883
bgti_else.42900:
	addi	%a2, %a2, -10
bgti_cont.42901:
	j	bgti_cont.42883
bgti_else.42898:
bgti_cont.42899:
	j	bgti_cont.42883
bgti_else.42896:
	addi	%a2, %a2, -30
bgti_cont.42897:
	j	bgti_cont.42883
bgti_else.42894:
	addi	%a2, %a2, -20
bgti_cont.42895:
	j	bgti_cont.42883
bgti_else.42892:
	addi	%a2, %a2, -10
bgti_cont.42893:
	j	bgti_cont.42883
bgti_else.42890:
bgti_cont.42891:
	j	bgti_cont.42883
bgti_else.42888:
	addi	%a2, %a2, -30
bgti_cont.42889:
	j	bgti_cont.42883
bgti_else.42886:
	addi	%a2, %a2, -20
bgti_cont.42887:
	j	bgti_cont.42883
bgti_else.42884:
	addi	%a2, %a2, -10
bgti_cont.42885:
	j	bgti_cont.42883
bgti_else.42882:
bgti_cont.42883:
	blt	%zero, %a0, bgt_else.42906
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42907
bgt_else.42906:
	blti	%a0, 10, bgti_else.42908
	blti	%a0, 20, bgti_else.42910
	blti	%a0, 30, bgti_else.42912
	blti	%a0, 40, bgti_else.42914
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42909
	blti	%a0, 20, bgti_else.42918
	blti	%a0, 30, bgti_else.42920
	blti	%a0, 40, bgti_else.42922
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42909
	blti	%a0, 20, bgti_else.42926
	blti	%a0, 30, bgti_else.42928
	blti	%a0, 40, bgti_else.42930
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.42909
bgti_else.42930:
	addi	%a0, %a0, -30
bgti_cont.42931:
	j	bgti_cont.42909
bgti_else.42928:
	addi	%a0, %a0, -20
bgti_cont.42929:
	j	bgti_cont.42909
bgti_else.42926:
	addi	%a0, %a0, -10
bgti_cont.42927:
	j	bgti_cont.42909
bgti_else.42924:
bgti_cont.42925:
	j	bgti_cont.42909
bgti_else.42922:
	addi	%a0, %a0, -30
bgti_cont.42923:
	j	bgti_cont.42909
bgti_else.42920:
	addi	%a0, %a0, -20
bgti_cont.42921:
	j	bgti_cont.42909
bgti_else.42918:
	addi	%a0, %a0, -10
bgti_cont.42919:
	j	bgti_cont.42909
bgti_else.42916:
bgti_cont.42917:
	j	bgti_cont.42909
bgti_else.42914:
	addi	%a0, %a0, -30
bgti_cont.42915:
	j	bgti_cont.42909
bgti_else.42912:
	addi	%a0, %a0, -20
bgti_cont.42913:
	j	bgti_cont.42909
bgti_else.42910:
	addi	%a0, %a0, -10
bgti_cont.42911:
	j	bgti_cont.42909
bgti_else.42908:
bgti_cont.42909:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.42907:
bgt_cont.42857:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.42932
	blti	%a1, 0, bgti_else.42934
	j	bgt_cont.42933
bgti_else.42934:
	add	%a1, %zero, %zero
bgti_cont.42935:
	j	bgt_cont.42933
bgt_else.42932:
	addi	%a1, %zero, 255
bgt_cont.42933:
	blti	%a1, 10, bgti_else.42936
	blti	%a1, 20, bgti_else.42938
	blti	%a1, 30, bgti_else.42940
	blti	%a1, 40, bgti_else.42942
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.42944
	blti	%a0, 20, bgti_else.42946
	blti	%a0, 30, bgti_else.42948
	blti	%a0, 40, bgti_else.42950
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.42952
	blti	%a0, 20, bgti_else.42954
	blti	%a0, 30, bgti_else.42956
	blti	%a0, 40, bgti_else.42958
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.42937
bgti_else.42958:
	addi	%a2, %zero, 11
bgti_cont.42959:
	j	bgti_cont.42937
bgti_else.42956:
	addi	%a2, %zero, 10
bgti_cont.42957:
	j	bgti_cont.42937
bgti_else.42954:
	addi	%a2, %zero, 9
bgti_cont.42955:
	j	bgti_cont.42937
bgti_else.42952:
	addi	%a2, %zero, 8
bgti_cont.42953:
	j	bgti_cont.42937
bgti_else.42950:
	addi	%a2, %zero, 7
bgti_cont.42951:
	j	bgti_cont.42937
bgti_else.42948:
	addi	%a2, %zero, 6
bgti_cont.42949:
	j	bgti_cont.42937
bgti_else.42946:
	addi	%a2, %zero, 5
bgti_cont.42947:
	j	bgti_cont.42937
bgti_else.42944:
	addi	%a2, %zero, 4
bgti_cont.42945:
	j	bgti_cont.42937
bgti_else.42942:
	addi	%a2, %zero, 3
bgti_cont.42943:
	j	bgti_cont.42937
bgti_else.42940:
	addi	%a2, %zero, 2
bgti_cont.42941:
	j	bgti_cont.42937
bgti_else.42938:
	add	%a2, %zero, %k1
bgti_cont.42939:
	j	bgti_cont.42937
bgti_else.42936:
	add	%a2, %zero, %zero
bgti_cont.42937:
	blti	%a1, 10, bgti_else.42960
	blti	%a1, 20, bgti_else.42962
	blti	%a1, 30, bgti_else.42964
	blti	%a1, 40, bgti_else.42966
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42961
	blti	%a1, 20, bgti_else.42970
	blti	%a1, 30, bgti_else.42972
	blti	%a1, 40, bgti_else.42974
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42961
	blti	%a1, 20, bgti_else.42978
	blti	%a1, 30, bgti_else.42980
	blti	%a1, 40, bgti_else.42982
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.42961
bgti_else.42982:
	addi	%a1, %a1, -30
bgti_cont.42983:
	j	bgti_cont.42961
bgti_else.42980:
	addi	%a1, %a1, -20
bgti_cont.42981:
	j	bgti_cont.42961
bgti_else.42978:
	addi	%a1, %a1, -10
bgti_cont.42979:
	j	bgti_cont.42961
bgti_else.42976:
bgti_cont.42977:
	j	bgti_cont.42961
bgti_else.42974:
	addi	%a1, %a1, -30
bgti_cont.42975:
	j	bgti_cont.42961
bgti_else.42972:
	addi	%a1, %a1, -20
bgti_cont.42973:
	j	bgti_cont.42961
bgti_else.42970:
	addi	%a1, %a1, -10
bgti_cont.42971:
	j	bgti_cont.42961
bgti_else.42968:
bgti_cont.42969:
	j	bgti_cont.42961
bgti_else.42966:
	addi	%a1, %a1, -30
bgti_cont.42967:
	j	bgti_cont.42961
bgti_else.42964:
	addi	%a1, %a1, -20
bgti_cont.42965:
	j	bgti_cont.42961
bgti_else.42962:
	addi	%a1, %a1, -10
bgti_cont.42963:
	j	bgti_cont.42961
bgti_else.42960:
bgti_cont.42961:
	blt	%zero, %a2, bgt_else.42984
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42985
bgt_else.42984:
	blti	%a2, 10, bgti_else.42986
	blti	%a2, 20, bgti_else.42988
	blti	%a2, 30, bgti_else.42990
	blti	%a2, 40, bgti_else.42992
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.42994
	blti	%a0, 20, bgti_else.42996
	blti	%a0, 30, bgti_else.42998
	blti	%a0, 40, bgti_else.43000
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43002
	blti	%a0, 20, bgti_else.43004
	blti	%a0, 30, bgti_else.43006
	blti	%a0, 40, bgti_else.43008
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.42987
bgti_else.43008:
	addi	%a0, %zero, 11
bgti_cont.43009:
	j	bgti_cont.42987
bgti_else.43006:
	addi	%a0, %zero, 10
bgti_cont.43007:
	j	bgti_cont.42987
bgti_else.43004:
	addi	%a0, %zero, 9
bgti_cont.43005:
	j	bgti_cont.42987
bgti_else.43002:
	addi	%a0, %zero, 8
bgti_cont.43003:
	j	bgti_cont.42987
bgti_else.43000:
	addi	%a0, %zero, 7
bgti_cont.43001:
	j	bgti_cont.42987
bgti_else.42998:
	addi	%a0, %zero, 6
bgti_cont.42999:
	j	bgti_cont.42987
bgti_else.42996:
	addi	%a0, %zero, 5
bgti_cont.42997:
	j	bgti_cont.42987
bgti_else.42994:
	addi	%a0, %zero, 4
bgti_cont.42995:
	j	bgti_cont.42987
bgti_else.42992:
	addi	%a0, %zero, 3
bgti_cont.42993:
	j	bgti_cont.42987
bgti_else.42990:
	addi	%a0, %zero, 2
bgti_cont.42991:
	j	bgti_cont.42987
bgti_else.42988:
	add	%a0, %zero, %k1
bgti_cont.42989:
	j	bgti_cont.42987
bgti_else.42986:
	add	%a0, %zero, %zero
bgti_cont.42987:
	blti	%a2, 10, bgti_else.43010
	blti	%a2, 20, bgti_else.43012
	blti	%a2, 30, bgti_else.43014
	blti	%a2, 40, bgti_else.43016
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43011
	blti	%a2, 20, bgti_else.43020
	blti	%a2, 30, bgti_else.43022
	blti	%a2, 40, bgti_else.43024
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43011
	blti	%a2, 20, bgti_else.43028
	blti	%a2, 30, bgti_else.43030
	blti	%a2, 40, bgti_else.43032
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.43011
bgti_else.43032:
	addi	%a2, %a2, -30
bgti_cont.43033:
	j	bgti_cont.43011
bgti_else.43030:
	addi	%a2, %a2, -20
bgti_cont.43031:
	j	bgti_cont.43011
bgti_else.43028:
	addi	%a2, %a2, -10
bgti_cont.43029:
	j	bgti_cont.43011
bgti_else.43026:
bgti_cont.43027:
	j	bgti_cont.43011
bgti_else.43024:
	addi	%a2, %a2, -30
bgti_cont.43025:
	j	bgti_cont.43011
bgti_else.43022:
	addi	%a2, %a2, -20
bgti_cont.43023:
	j	bgti_cont.43011
bgti_else.43020:
	addi	%a2, %a2, -10
bgti_cont.43021:
	j	bgti_cont.43011
bgti_else.43018:
bgti_cont.43019:
	j	bgti_cont.43011
bgti_else.43016:
	addi	%a2, %a2, -30
bgti_cont.43017:
	j	bgti_cont.43011
bgti_else.43014:
	addi	%a2, %a2, -20
bgti_cont.43015:
	j	bgti_cont.43011
bgti_else.43012:
	addi	%a2, %a2, -10
bgti_cont.43013:
	j	bgti_cont.43011
bgti_else.43010:
bgti_cont.43011:
	blt	%zero, %a0, bgt_else.43034
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.43035
bgt_else.43034:
	blti	%a0, 10, bgti_else.43036
	blti	%a0, 20, bgti_else.43038
	blti	%a0, 30, bgti_else.43040
	blti	%a0, 40, bgti_else.43042
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43037
	blti	%a0, 20, bgti_else.43046
	blti	%a0, 30, bgti_else.43048
	blti	%a0, 40, bgti_else.43050
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43037
	blti	%a0, 20, bgti_else.43054
	blti	%a0, 30, bgti_else.43056
	blti	%a0, 40, bgti_else.43058
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.43037
bgti_else.43058:
	addi	%a0, %a0, -30
bgti_cont.43059:
	j	bgti_cont.43037
bgti_else.43056:
	addi	%a0, %a0, -20
bgti_cont.43057:
	j	bgti_cont.43037
bgti_else.43054:
	addi	%a0, %a0, -10
bgti_cont.43055:
	j	bgti_cont.43037
bgti_else.43052:
bgti_cont.43053:
	j	bgti_cont.43037
bgti_else.43050:
	addi	%a0, %a0, -30
bgti_cont.43051:
	j	bgti_cont.43037
bgti_else.43048:
	addi	%a0, %a0, -20
bgti_cont.43049:
	j	bgti_cont.43037
bgti_else.43046:
	addi	%a0, %a0, -10
bgti_cont.43047:
	j	bgti_cont.43037
bgti_else.43044:
bgti_cont.43045:
	j	bgti_cont.43037
bgti_else.43042:
	addi	%a0, %a0, -30
bgti_cont.43043:
	j	bgti_cont.43037
bgti_else.43040:
	addi	%a0, %a0, -20
bgti_cont.43041:
	j	bgti_cont.43037
bgti_else.43038:
	addi	%a0, %a0, -10
bgti_cont.43039:
	j	bgti_cont.43037
bgti_else.43036:
bgti_cont.43037:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.43035:
bgt_cont.42985:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.43060
	blti	%a1, 0, bgti_else.43062
	j	bgt_cont.43061
bgti_else.43062:
	add	%a1, %zero, %zero
bgti_cont.43063:
	j	bgt_cont.43061
bgt_else.43060:
	addi	%a1, %zero, 255
bgt_cont.43061:
	blti	%a1, 10, bgti_else.43064
	blti	%a1, 20, bgti_else.43066
	blti	%a1, 30, bgti_else.43068
	blti	%a1, 40, bgti_else.43070
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.43072
	blti	%a0, 20, bgti_else.43074
	blti	%a0, 30, bgti_else.43076
	blti	%a0, 40, bgti_else.43078
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43080
	blti	%a0, 20, bgti_else.43082
	blti	%a0, 30, bgti_else.43084
	blti	%a0, 40, bgti_else.43086
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.43065
bgti_else.43086:
	addi	%a2, %zero, 11
bgti_cont.43087:
	j	bgti_cont.43065
bgti_else.43084:
	addi	%a2, %zero, 10
bgti_cont.43085:
	j	bgti_cont.43065
bgti_else.43082:
	addi	%a2, %zero, 9
bgti_cont.43083:
	j	bgti_cont.43065
bgti_else.43080:
	addi	%a2, %zero, 8
bgti_cont.43081:
	j	bgti_cont.43065
bgti_else.43078:
	addi	%a2, %zero, 7
bgti_cont.43079:
	j	bgti_cont.43065
bgti_else.43076:
	addi	%a2, %zero, 6
bgti_cont.43077:
	j	bgti_cont.43065
bgti_else.43074:
	addi	%a2, %zero, 5
bgti_cont.43075:
	j	bgti_cont.43065
bgti_else.43072:
	addi	%a2, %zero, 4
bgti_cont.43073:
	j	bgti_cont.43065
bgti_else.43070:
	addi	%a2, %zero, 3
bgti_cont.43071:
	j	bgti_cont.43065
bgti_else.43068:
	addi	%a2, %zero, 2
bgti_cont.43069:
	j	bgti_cont.43065
bgti_else.43066:
	add	%a2, %zero, %k1
bgti_cont.43067:
	j	bgti_cont.43065
bgti_else.43064:
	add	%a2, %zero, %zero
bgti_cont.43065:
	blti	%a1, 10, bgti_else.43088
	blti	%a1, 20, bgti_else.43090
	blti	%a1, 30, bgti_else.43092
	blti	%a1, 40, bgti_else.43094
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.43089
	blti	%a1, 20, bgti_else.43098
	blti	%a1, 30, bgti_else.43100
	blti	%a1, 40, bgti_else.43102
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.43089
	blti	%a1, 20, bgti_else.43106
	blti	%a1, 30, bgti_else.43108
	blti	%a1, 40, bgti_else.43110
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.43089
bgti_else.43110:
	addi	%a1, %a1, -30
bgti_cont.43111:
	j	bgti_cont.43089
bgti_else.43108:
	addi	%a1, %a1, -20
bgti_cont.43109:
	j	bgti_cont.43089
bgti_else.43106:
	addi	%a1, %a1, -10
bgti_cont.43107:
	j	bgti_cont.43089
bgti_else.43104:
bgti_cont.43105:
	j	bgti_cont.43089
bgti_else.43102:
	addi	%a1, %a1, -30
bgti_cont.43103:
	j	bgti_cont.43089
bgti_else.43100:
	addi	%a1, %a1, -20
bgti_cont.43101:
	j	bgti_cont.43089
bgti_else.43098:
	addi	%a1, %a1, -10
bgti_cont.43099:
	j	bgti_cont.43089
bgti_else.43096:
bgti_cont.43097:
	j	bgti_cont.43089
bgti_else.43094:
	addi	%a1, %a1, -30
bgti_cont.43095:
	j	bgti_cont.43089
bgti_else.43092:
	addi	%a1, %a1, -20
bgti_cont.43093:
	j	bgti_cont.43089
bgti_else.43090:
	addi	%a1, %a1, -10
bgti_cont.43091:
	j	bgti_cont.43089
bgti_else.43088:
bgti_cont.43089:
	blt	%zero, %a2, bgt_else.43112
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.43113
bgt_else.43112:
	blti	%a2, 10, bgti_else.43114
	blti	%a2, 20, bgti_else.43116
	blti	%a2, 30, bgti_else.43118
	blti	%a2, 40, bgti_else.43120
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.43122
	blti	%a0, 20, bgti_else.43124
	blti	%a0, 30, bgti_else.43126
	blti	%a0, 40, bgti_else.43128
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43130
	blti	%a0, 20, bgti_else.43132
	blti	%a0, 30, bgti_else.43134
	blti	%a0, 40, bgti_else.43136
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.43115
bgti_else.43136:
	addi	%a0, %zero, 11
bgti_cont.43137:
	j	bgti_cont.43115
bgti_else.43134:
	addi	%a0, %zero, 10
bgti_cont.43135:
	j	bgti_cont.43115
bgti_else.43132:
	addi	%a0, %zero, 9
bgti_cont.43133:
	j	bgti_cont.43115
bgti_else.43130:
	addi	%a0, %zero, 8
bgti_cont.43131:
	j	bgti_cont.43115
bgti_else.43128:
	addi	%a0, %zero, 7
bgti_cont.43129:
	j	bgti_cont.43115
bgti_else.43126:
	addi	%a0, %zero, 6
bgti_cont.43127:
	j	bgti_cont.43115
bgti_else.43124:
	addi	%a0, %zero, 5
bgti_cont.43125:
	j	bgti_cont.43115
bgti_else.43122:
	addi	%a0, %zero, 4
bgti_cont.43123:
	j	bgti_cont.43115
bgti_else.43120:
	addi	%a0, %zero, 3
bgti_cont.43121:
	j	bgti_cont.43115
bgti_else.43118:
	addi	%a0, %zero, 2
bgti_cont.43119:
	j	bgti_cont.43115
bgti_else.43116:
	add	%a0, %zero, %k1
bgti_cont.43117:
	j	bgti_cont.43115
bgti_else.43114:
	add	%a0, %zero, %zero
bgti_cont.43115:
	blti	%a2, 10, bgti_else.43138
	blti	%a2, 20, bgti_else.43140
	blti	%a2, 30, bgti_else.43142
	blti	%a2, 40, bgti_else.43144
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43139
	blti	%a2, 20, bgti_else.43148
	blti	%a2, 30, bgti_else.43150
	blti	%a2, 40, bgti_else.43152
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43139
	blti	%a2, 20, bgti_else.43156
	blti	%a2, 30, bgti_else.43158
	blti	%a2, 40, bgti_else.43160
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.43139
bgti_else.43160:
	addi	%a2, %a2, -30
bgti_cont.43161:
	j	bgti_cont.43139
bgti_else.43158:
	addi	%a2, %a2, -20
bgti_cont.43159:
	j	bgti_cont.43139
bgti_else.43156:
	addi	%a2, %a2, -10
bgti_cont.43157:
	j	bgti_cont.43139
bgti_else.43154:
bgti_cont.43155:
	j	bgti_cont.43139
bgti_else.43152:
	addi	%a2, %a2, -30
bgti_cont.43153:
	j	bgti_cont.43139
bgti_else.43150:
	addi	%a2, %a2, -20
bgti_cont.43151:
	j	bgti_cont.43139
bgti_else.43148:
	addi	%a2, %a2, -10
bgti_cont.43149:
	j	bgti_cont.43139
bgti_else.43146:
bgti_cont.43147:
	j	bgti_cont.43139
bgti_else.43144:
	addi	%a2, %a2, -30
bgti_cont.43145:
	j	bgti_cont.43139
bgti_else.43142:
	addi	%a2, %a2, -20
bgti_cont.43143:
	j	bgti_cont.43139
bgti_else.43140:
	addi	%a2, %a2, -10
bgti_cont.43141:
	j	bgti_cont.43139
bgti_else.43138:
bgti_cont.43139:
	blt	%zero, %a0, bgt_else.43162
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.43163
bgt_else.43162:
	blti	%a0, 10, bgti_else.43164
	blti	%a0, 20, bgti_else.43166
	blti	%a0, 30, bgti_else.43168
	blti	%a0, 40, bgti_else.43170
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43165
	blti	%a0, 20, bgti_else.43174
	blti	%a0, 30, bgti_else.43176
	blti	%a0, 40, bgti_else.43178
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43165
	blti	%a0, 20, bgti_else.43182
	blti	%a0, 30, bgti_else.43184
	blti	%a0, 40, bgti_else.43186
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.43165
bgti_else.43186:
	addi	%a0, %a0, -30
bgti_cont.43187:
	j	bgti_cont.43165
bgti_else.43184:
	addi	%a0, %a0, -20
bgti_cont.43185:
	j	bgti_cont.43165
bgti_else.43182:
	addi	%a0, %a0, -10
bgti_cont.43183:
	j	bgti_cont.43165
bgti_else.43180:
bgti_cont.43181:
	j	bgti_cont.43165
bgti_else.43178:
	addi	%a0, %a0, -30
bgti_cont.43179:
	j	bgti_cont.43165
bgti_else.43176:
	addi	%a0, %a0, -20
bgti_cont.43177:
	j	bgti_cont.43165
bgti_else.43174:
	addi	%a0, %a0, -10
bgti_cont.43175:
	j	bgti_cont.43165
bgti_else.43172:
bgti_cont.43173:
	j	bgti_cont.43165
bgti_else.43170:
	addi	%a0, %a0, -30
bgti_cont.43171:
	j	bgti_cont.43165
bgti_else.43168:
	addi	%a0, %a0, -20
bgti_cont.43169:
	j	bgti_cont.43165
bgti_else.43166:
	addi	%a0, %a0, -10
bgti_cont.43167:
	j	bgti_cont.43165
bgti_else.43164:
bgti_cont.43165:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.43163:
bgt_cont.43113:
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
	blt	%a3, %t0, bgt_else.44464
	add	%t0, %zero, %a1
	jr	%ra
bgt_else.44464:
	addi	%a1, %t0, -1
	sw	%a1, 10(%sp)
	blt	%a3, %a1, bgt_else.44466
	j	bgt_cont.44467
bgt_else.44466:
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
bgt_cont.44467:
	lw	%t1, 154(%zero)
	blt	%zero, %t1, bgt_else.44468
	j	bgt_cont.44469
bgt_else.44468:
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
	blt	%a0, %t0, bgt_else.44470
	j	bgt_cont.44471
bgt_else.44470:
	blt	%zero, %a1, bgt_else.44472
	j	bgt_cont.44473
bgt_else.44472:
	blt	%k1, %t1, bgt_else.44474
	j	bgt_cont.44475
bgt_else.44474:
bgt_cont.44475:
bgt_cont.44473:
bgt_cont.44471:
	beqi	%zero, 0, bnei_else.44476
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -11
	j	bnei_cont.44477
bnei_else.44476:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -11
bnei_cont.44477:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44478
	blti	%a1, 0, bgti_else.44480
	j	bgt_cont.44479
bgti_else.44480:
	add	%a1, %zero, %zero
bgti_cont.44481:
	j	bgt_cont.44479
bgt_else.44478:
	addi	%a1, %zero, 255
bgt_cont.44479:
	addi	%a3, %zero, 10
	blti	%a1, 10, bgti_else.44482
	blti	%a1, 20, bgti_else.44484
	blti	%a1, 30, bgti_else.44486
	blti	%a1, 40, bgti_else.44488
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.44490
	blti	%a0, 20, bgti_else.44492
	blti	%a0, 30, bgti_else.44494
	blti	%a0, 40, bgti_else.44496
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44498
	blti	%a0, 20, bgti_else.44500
	blti	%a0, 30, bgti_else.44502
	blti	%a0, 40, bgti_else.44504
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.44483
bgti_else.44504:
	addi	%a2, %zero, 11
bgti_cont.44505:
	j	bgti_cont.44483
bgti_else.44502:
	addi	%a2, %zero, 10
bgti_cont.44503:
	j	bgti_cont.44483
bgti_else.44500:
	addi	%a2, %zero, 9
bgti_cont.44501:
	j	bgti_cont.44483
bgti_else.44498:
	addi	%a2, %zero, 8
bgti_cont.44499:
	j	bgti_cont.44483
bgti_else.44496:
	addi	%a2, %zero, 7
bgti_cont.44497:
	j	bgti_cont.44483
bgti_else.44494:
	addi	%a2, %zero, 6
bgti_cont.44495:
	j	bgti_cont.44483
bgti_else.44492:
	addi	%a2, %zero, 5
bgti_cont.44493:
	j	bgti_cont.44483
bgti_else.44490:
	addi	%a2, %zero, 4
bgti_cont.44491:
	j	bgti_cont.44483
bgti_else.44488:
	addi	%a2, %zero, 3
bgti_cont.44489:
	j	bgti_cont.44483
bgti_else.44486:
	addi	%a2, %zero, 2
bgti_cont.44487:
	j	bgti_cont.44483
bgti_else.44484:
	add	%a2, %zero, %k1
bgti_cont.44485:
	j	bgti_cont.44483
bgti_else.44482:
	add	%a2, %zero, %zero
bgti_cont.44483:
	blti	%a1, 10, bgti_else.44506
	blti	%a1, 20, bgti_else.44508
	blti	%a1, 30, bgti_else.44510
	blti	%a1, 40, bgti_else.44512
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44507
	blti	%a1, 20, bgti_else.44516
	blti	%a1, 30, bgti_else.44518
	blti	%a1, 40, bgti_else.44520
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44507
	blti	%a1, 20, bgti_else.44524
	blti	%a1, 30, bgti_else.44526
	blti	%a1, 40, bgti_else.44528
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.44507
bgti_else.44528:
	addi	%a1, %a1, -30
bgti_cont.44529:
	j	bgti_cont.44507
bgti_else.44526:
	addi	%a1, %a1, -20
bgti_cont.44527:
	j	bgti_cont.44507
bgti_else.44524:
	addi	%a1, %a1, -10
bgti_cont.44525:
	j	bgti_cont.44507
bgti_else.44522:
bgti_cont.44523:
	j	bgti_cont.44507
bgti_else.44520:
	addi	%a1, %a1, -30
bgti_cont.44521:
	j	bgti_cont.44507
bgti_else.44518:
	addi	%a1, %a1, -20
bgti_cont.44519:
	j	bgti_cont.44507
bgti_else.44516:
	addi	%a1, %a1, -10
bgti_cont.44517:
	j	bgti_cont.44507
bgti_else.44514:
bgti_cont.44515:
	j	bgti_cont.44507
bgti_else.44512:
	addi	%a1, %a1, -30
bgti_cont.44513:
	j	bgti_cont.44507
bgti_else.44510:
	addi	%a1, %a1, -20
bgti_cont.44511:
	j	bgti_cont.44507
bgti_else.44508:
	addi	%a1, %a1, -10
bgti_cont.44509:
	j	bgti_cont.44507
bgti_else.44506:
bgti_cont.44507:
	blt	%zero, %a2, bgt_else.44530
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44531
bgt_else.44530:
	blti	%a2, 10, bgti_else.44532
	blti	%a2, 20, bgti_else.44534
	blti	%a2, 30, bgti_else.44536
	blti	%a2, 40, bgti_else.44538
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.44540
	blti	%a0, 20, bgti_else.44542
	blti	%a0, 30, bgti_else.44544
	blti	%a0, 40, bgti_else.44546
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44548
	blti	%a0, 20, bgti_else.44550
	blti	%a0, 30, bgti_else.44552
	blti	%a0, 40, bgti_else.44554
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44533
bgti_else.44554:
	addi	%a0, %zero, 11
bgti_cont.44555:
	j	bgti_cont.44533
bgti_else.44552:
	addi	%a0, %zero, 10
bgti_cont.44553:
	j	bgti_cont.44533
bgti_else.44550:
	addi	%a0, %zero, 9
bgti_cont.44551:
	j	bgti_cont.44533
bgti_else.44548:
	addi	%a0, %zero, 8
bgti_cont.44549:
	j	bgti_cont.44533
bgti_else.44546:
	addi	%a0, %zero, 7
bgti_cont.44547:
	j	bgti_cont.44533
bgti_else.44544:
	addi	%a0, %zero, 6
bgti_cont.44545:
	j	bgti_cont.44533
bgti_else.44542:
	addi	%a0, %zero, 5
bgti_cont.44543:
	j	bgti_cont.44533
bgti_else.44540:
	addi	%a0, %zero, 4
bgti_cont.44541:
	j	bgti_cont.44533
bgti_else.44538:
	addi	%a0, %zero, 3
bgti_cont.44539:
	j	bgti_cont.44533
bgti_else.44536:
	addi	%a0, %zero, 2
bgti_cont.44537:
	j	bgti_cont.44533
bgti_else.44534:
	add	%a0, %zero, %k1
bgti_cont.44535:
	j	bgti_cont.44533
bgti_else.44532:
	add	%a0, %zero, %zero
bgti_cont.44533:
	blti	%a2, 10, bgti_else.44556
	blti	%a2, 20, bgti_else.44558
	blti	%a2, 30, bgti_else.44560
	blti	%a2, 40, bgti_else.44562
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44557
	blti	%a2, 20, bgti_else.44566
	blti	%a2, 30, bgti_else.44568
	blti	%a2, 40, bgti_else.44570
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44557
	blti	%a2, 20, bgti_else.44574
	blti	%a2, 30, bgti_else.44576
	blti	%a2, 40, bgti_else.44578
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.44557
bgti_else.44578:
	addi	%a2, %a2, -30
bgti_cont.44579:
	j	bgti_cont.44557
bgti_else.44576:
	addi	%a2, %a2, -20
bgti_cont.44577:
	j	bgti_cont.44557
bgti_else.44574:
	addi	%a2, %a2, -10
bgti_cont.44575:
	j	bgti_cont.44557
bgti_else.44572:
bgti_cont.44573:
	j	bgti_cont.44557
bgti_else.44570:
	addi	%a2, %a2, -30
bgti_cont.44571:
	j	bgti_cont.44557
bgti_else.44568:
	addi	%a2, %a2, -20
bgti_cont.44569:
	j	bgti_cont.44557
bgti_else.44566:
	addi	%a2, %a2, -10
bgti_cont.44567:
	j	bgti_cont.44557
bgti_else.44564:
bgti_cont.44565:
	j	bgti_cont.44557
bgti_else.44562:
	addi	%a2, %a2, -30
bgti_cont.44563:
	j	bgti_cont.44557
bgti_else.44560:
	addi	%a2, %a2, -20
bgti_cont.44561:
	j	bgti_cont.44557
bgti_else.44558:
	addi	%a2, %a2, -10
bgti_cont.44559:
	j	bgti_cont.44557
bgti_else.44556:
bgti_cont.44557:
	blt	%zero, %a0, bgt_else.44580
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44581
bgt_else.44580:
	blti	%a0, 10, bgti_else.44582
	blti	%a0, 20, bgti_else.44584
	blti	%a0, 30, bgti_else.44586
	blti	%a0, 40, bgti_else.44588
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44583
	blti	%a0, 20, bgti_else.44592
	blti	%a0, 30, bgti_else.44594
	blti	%a0, 40, bgti_else.44596
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44583
	blti	%a0, 20, bgti_else.44600
	blti	%a0, 30, bgti_else.44602
	blti	%a0, 40, bgti_else.44604
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44583
bgti_else.44604:
	addi	%a0, %a0, -30
bgti_cont.44605:
	j	bgti_cont.44583
bgti_else.44602:
	addi	%a0, %a0, -20
bgti_cont.44603:
	j	bgti_cont.44583
bgti_else.44600:
	addi	%a0, %a0, -10
bgti_cont.44601:
	j	bgti_cont.44583
bgti_else.44598:
bgti_cont.44599:
	j	bgti_cont.44583
bgti_else.44596:
	addi	%a0, %a0, -30
bgti_cont.44597:
	j	bgti_cont.44583
bgti_else.44594:
	addi	%a0, %a0, -20
bgti_cont.44595:
	j	bgti_cont.44583
bgti_else.44592:
	addi	%a0, %a0, -10
bgti_cont.44593:
	j	bgti_cont.44583
bgti_else.44590:
bgti_cont.44591:
	j	bgti_cont.44583
bgti_else.44588:
	addi	%a0, %a0, -30
bgti_cont.44589:
	j	bgti_cont.44583
bgti_else.44586:
	addi	%a0, %a0, -20
bgti_cont.44587:
	j	bgti_cont.44583
bgti_else.44584:
	addi	%a0, %a0, -10
bgti_cont.44585:
	j	bgti_cont.44583
bgti_else.44582:
bgti_cont.44583:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.44581:
bgt_cont.44531:
	addi	%a1, %zero, 32
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 152(%zero)
	ftoi	%a2, %f0
	addi	%at, %zero, 255
	blt	%at, %a2, bgt_else.44606
	blti	%a2, 0, bgti_else.44608
	j	bgt_cont.44607
bgti_else.44608:
	add	%a2, %zero, %zero
bgti_cont.44609:
	j	bgt_cont.44607
bgt_else.44606:
	addi	%a2, %zero, 255
bgt_cont.44607:
	blti	%a2, 10, bgti_else.44610
	blti	%a2, 20, bgti_else.44612
	blti	%a2, 30, bgti_else.44614
	blti	%a2, 40, bgti_else.44616
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.44618
	blti	%a0, 20, bgti_else.44620
	blti	%a0, 30, bgti_else.44622
	blti	%a0, 40, bgti_else.44624
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44626
	blti	%a0, 20, bgti_else.44628
	blti	%a0, 30, bgti_else.44630
	blti	%a0, 40, bgti_else.44632
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%fp, %v0, 0
	j	bgti_cont.44611
bgti_else.44632:
	addi	%fp, %zero, 11
bgti_cont.44633:
	j	bgti_cont.44611
bgti_else.44630:
	addi	%fp, %zero, 10
bgti_cont.44631:
	j	bgti_cont.44611
bgti_else.44628:
	addi	%fp, %zero, 9
bgti_cont.44629:
	j	bgti_cont.44611
bgti_else.44626:
	addi	%fp, %zero, 8
bgti_cont.44627:
	j	bgti_cont.44611
bgti_else.44624:
	addi	%fp, %zero, 7
bgti_cont.44625:
	j	bgti_cont.44611
bgti_else.44622:
	addi	%fp, %zero, 6
bgti_cont.44623:
	j	bgti_cont.44611
bgti_else.44620:
	addi	%fp, %zero, 5
bgti_cont.44621:
	j	bgti_cont.44611
bgti_else.44618:
	addi	%fp, %zero, 4
bgti_cont.44619:
	j	bgti_cont.44611
bgti_else.44616:
	addi	%fp, %zero, 3
bgti_cont.44617:
	j	bgti_cont.44611
bgti_else.44614:
	addi	%fp, %zero, 2
bgti_cont.44615:
	j	bgti_cont.44611
bgti_else.44612:
	add	%fp, %zero, %k1
bgti_cont.44613:
	j	bgti_cont.44611
bgti_else.44610:
	add	%fp, %zero, %zero
bgti_cont.44611:
	blti	%a2, 10, bgti_else.44634
	blti	%a2, 20, bgti_else.44636
	blti	%a2, 30, bgti_else.44638
	blti	%a2, 40, bgti_else.44640
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44635
	blti	%a2, 20, bgti_else.44644
	blti	%a2, 30, bgti_else.44646
	blti	%a2, 40, bgti_else.44648
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44635
	blti	%a2, 20, bgti_else.44652
	blti	%a2, 30, bgti_else.44654
	blti	%a2, 40, bgti_else.44656
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.44635
bgti_else.44656:
	addi	%a2, %a2, -30
bgti_cont.44657:
	j	bgti_cont.44635
bgti_else.44654:
	addi	%a2, %a2, -20
bgti_cont.44655:
	j	bgti_cont.44635
bgti_else.44652:
	addi	%a2, %a2, -10
bgti_cont.44653:
	j	bgti_cont.44635
bgti_else.44650:
bgti_cont.44651:
	j	bgti_cont.44635
bgti_else.44648:
	addi	%a2, %a2, -30
bgti_cont.44649:
	j	bgti_cont.44635
bgti_else.44646:
	addi	%a2, %a2, -20
bgti_cont.44647:
	j	bgti_cont.44635
bgti_else.44644:
	addi	%a2, %a2, -10
bgti_cont.44645:
	j	bgti_cont.44635
bgti_else.44642:
bgti_cont.44643:
	j	bgti_cont.44635
bgti_else.44640:
	addi	%a2, %a2, -30
bgti_cont.44641:
	j	bgti_cont.44635
bgti_else.44638:
	addi	%a2, %a2, -20
bgti_cont.44639:
	j	bgti_cont.44635
bgti_else.44636:
	addi	%a2, %a2, -10
bgti_cont.44637:
	j	bgti_cont.44635
bgti_else.44634:
bgti_cont.44635:
	blt	%zero, %fp, bgt_else.44658
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44659
bgt_else.44658:
	blti	%fp, 10, bgti_else.44660
	blti	%fp, 20, bgti_else.44662
	blti	%fp, 30, bgti_else.44664
	blti	%fp, 40, bgti_else.44666
	addi	%a0, %fp, -40
	blti	%a0, 10, bgti_else.44668
	blti	%a0, 20, bgti_else.44670
	blti	%a0, 30, bgti_else.44672
	blti	%a0, 40, bgti_else.44674
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44676
	blti	%a0, 20, bgti_else.44678
	blti	%a0, 30, bgti_else.44680
	blti	%a0, 40, bgti_else.44682
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44661
bgti_else.44682:
	addi	%a0, %zero, 11
bgti_cont.44683:
	j	bgti_cont.44661
bgti_else.44680:
	addi	%a0, %zero, 10
bgti_cont.44681:
	j	bgti_cont.44661
bgti_else.44678:
	addi	%a0, %zero, 9
bgti_cont.44679:
	j	bgti_cont.44661
bgti_else.44676:
	addi	%a0, %zero, 8
bgti_cont.44677:
	j	bgti_cont.44661
bgti_else.44674:
	addi	%a0, %zero, 7
bgti_cont.44675:
	j	bgti_cont.44661
bgti_else.44672:
	addi	%a0, %zero, 6
bgti_cont.44673:
	j	bgti_cont.44661
bgti_else.44670:
	addi	%a0, %zero, 5
bgti_cont.44671:
	j	bgti_cont.44661
bgti_else.44668:
	addi	%a0, %zero, 4
bgti_cont.44669:
	j	bgti_cont.44661
bgti_else.44666:
	addi	%a0, %zero, 3
bgti_cont.44667:
	j	bgti_cont.44661
bgti_else.44664:
	addi	%a0, %zero, 2
bgti_cont.44665:
	j	bgti_cont.44661
bgti_else.44662:
	add	%a0, %zero, %k1
bgti_cont.44663:
	j	bgti_cont.44661
bgti_else.44660:
	add	%a0, %zero, %zero
bgti_cont.44661:
	blti	%fp, 10, bgti_else.44684
	blti	%fp, 20, bgti_else.44686
	blti	%fp, 30, bgti_else.44688
	blti	%fp, 40, bgti_else.44690
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.44685
	blti	%fp, 20, bgti_else.44694
	blti	%fp, 30, bgti_else.44696
	blti	%fp, 40, bgti_else.44698
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.44685
	blti	%fp, 20, bgti_else.44702
	blti	%fp, 30, bgti_else.44704
	blti	%fp, 40, bgti_else.44706
	addi	%v0, %fp, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%fp, %v0, 0
	j	bgti_cont.44685
bgti_else.44706:
	addi	%fp, %fp, -30
bgti_cont.44707:
	j	bgti_cont.44685
bgti_else.44704:
	addi	%fp, %fp, -20
bgti_cont.44705:
	j	bgti_cont.44685
bgti_else.44702:
	addi	%fp, %fp, -10
bgti_cont.44703:
	j	bgti_cont.44685
bgti_else.44700:
bgti_cont.44701:
	j	bgti_cont.44685
bgti_else.44698:
	addi	%fp, %fp, -30
bgti_cont.44699:
	j	bgti_cont.44685
bgti_else.44696:
	addi	%fp, %fp, -20
bgti_cont.44697:
	j	bgti_cont.44685
bgti_else.44694:
	addi	%fp, %fp, -10
bgti_cont.44695:
	j	bgti_cont.44685
bgti_else.44692:
bgti_cont.44693:
	j	bgti_cont.44685
bgti_else.44690:
	addi	%fp, %fp, -30
bgti_cont.44691:
	j	bgti_cont.44685
bgti_else.44688:
	addi	%fp, %fp, -20
bgti_cont.44689:
	j	bgti_cont.44685
bgti_else.44686:
	addi	%fp, %fp, -10
bgti_cont.44687:
	j	bgti_cont.44685
bgti_else.44684:
bgti_cont.44685:
	blt	%zero, %a0, bgt_else.44708
	addi	%v0, %fp, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44709
bgt_else.44708:
	blti	%a0, 10, bgti_else.44710
	blti	%a0, 20, bgti_else.44712
	blti	%a0, 30, bgti_else.44714
	blti	%a0, 40, bgti_else.44716
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44711
	blti	%a0, 20, bgti_else.44720
	blti	%a0, 30, bgti_else.44722
	blti	%a0, 40, bgti_else.44724
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44711
	blti	%a0, 20, bgti_else.44728
	blti	%a0, 30, bgti_else.44730
	blti	%a0, 40, bgti_else.44732
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44711
bgti_else.44732:
	addi	%a0, %a0, -30
bgti_cont.44733:
	j	bgti_cont.44711
bgti_else.44730:
	addi	%a0, %a0, -20
bgti_cont.44731:
	j	bgti_cont.44711
bgti_else.44728:
	addi	%a0, %a0, -10
bgti_cont.44729:
	j	bgti_cont.44711
bgti_else.44726:
bgti_cont.44727:
	j	bgti_cont.44711
bgti_else.44724:
	addi	%a0, %a0, -30
bgti_cont.44725:
	j	bgti_cont.44711
bgti_else.44722:
	addi	%a0, %a0, -20
bgti_cont.44723:
	j	bgti_cont.44711
bgti_else.44720:
	addi	%a0, %a0, -10
bgti_cont.44721:
	j	bgti_cont.44711
bgti_else.44718:
bgti_cont.44719:
	j	bgti_cont.44711
bgti_else.44716:
	addi	%a0, %a0, -30
bgti_cont.44717:
	j	bgti_cont.44711
bgti_else.44714:
	addi	%a0, %a0, -20
bgti_cont.44715:
	j	bgti_cont.44711
bgti_else.44712:
	addi	%a0, %a0, -10
bgti_cont.44713:
	j	bgti_cont.44711
bgti_else.44710:
bgti_cont.44711:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %fp, 48
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.44709:
bgt_cont.44659:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44734
	blti	%a1, 0, bgti_else.44736
	j	bgt_cont.44735
bgti_else.44736:
	add	%a1, %zero, %zero
bgti_cont.44737:
	j	bgt_cont.44735
bgt_else.44734:
	addi	%a1, %zero, 255
bgt_cont.44735:
	blti	%a1, 10, bgti_else.44738
	blti	%a1, 20, bgti_else.44740
	blti	%a1, 30, bgti_else.44742
	blti	%a1, 40, bgti_else.44744
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.44746
	blti	%a0, 20, bgti_else.44748
	blti	%a0, 30, bgti_else.44750
	blti	%a0, 40, bgti_else.44752
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44754
	blti	%a0, 20, bgti_else.44756
	blti	%a0, 30, bgti_else.44758
	blti	%a0, 40, bgti_else.44760
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.44739
bgti_else.44760:
	addi	%a2, %zero, 11
bgti_cont.44761:
	j	bgti_cont.44739
bgti_else.44758:
	addi	%a2, %zero, 10
bgti_cont.44759:
	j	bgti_cont.44739
bgti_else.44756:
	addi	%a2, %zero, 9
bgti_cont.44757:
	j	bgti_cont.44739
bgti_else.44754:
	addi	%a2, %zero, 8
bgti_cont.44755:
	j	bgti_cont.44739
bgti_else.44752:
	addi	%a2, %zero, 7
bgti_cont.44753:
	j	bgti_cont.44739
bgti_else.44750:
	addi	%a2, %zero, 6
bgti_cont.44751:
	j	bgti_cont.44739
bgti_else.44748:
	addi	%a2, %zero, 5
bgti_cont.44749:
	j	bgti_cont.44739
bgti_else.44746:
	addi	%a2, %zero, 4
bgti_cont.44747:
	j	bgti_cont.44739
bgti_else.44744:
	addi	%a2, %zero, 3
bgti_cont.44745:
	j	bgti_cont.44739
bgti_else.44742:
	addi	%a2, %zero, 2
bgti_cont.44743:
	j	bgti_cont.44739
bgti_else.44740:
	add	%a2, %zero, %k1
bgti_cont.44741:
	j	bgti_cont.44739
bgti_else.44738:
	add	%a2, %zero, %zero
bgti_cont.44739:
	blti	%a1, 10, bgti_else.44762
	blti	%a1, 20, bgti_else.44764
	blti	%a1, 30, bgti_else.44766
	blti	%a1, 40, bgti_else.44768
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44763
	blti	%a1, 20, bgti_else.44772
	blti	%a1, 30, bgti_else.44774
	blti	%a1, 40, bgti_else.44776
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44763
	blti	%a1, 20, bgti_else.44780
	blti	%a1, 30, bgti_else.44782
	blti	%a1, 40, bgti_else.44784
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.44763
bgti_else.44784:
	addi	%a1, %a1, -30
bgti_cont.44785:
	j	bgti_cont.44763
bgti_else.44782:
	addi	%a1, %a1, -20
bgti_cont.44783:
	j	bgti_cont.44763
bgti_else.44780:
	addi	%a1, %a1, -10
bgti_cont.44781:
	j	bgti_cont.44763
bgti_else.44778:
bgti_cont.44779:
	j	bgti_cont.44763
bgti_else.44776:
	addi	%a1, %a1, -30
bgti_cont.44777:
	j	bgti_cont.44763
bgti_else.44774:
	addi	%a1, %a1, -20
bgti_cont.44775:
	j	bgti_cont.44763
bgti_else.44772:
	addi	%a1, %a1, -10
bgti_cont.44773:
	j	bgti_cont.44763
bgti_else.44770:
bgti_cont.44771:
	j	bgti_cont.44763
bgti_else.44768:
	addi	%a1, %a1, -30
bgti_cont.44769:
	j	bgti_cont.44763
bgti_else.44766:
	addi	%a1, %a1, -20
bgti_cont.44767:
	j	bgti_cont.44763
bgti_else.44764:
	addi	%a1, %a1, -10
bgti_cont.44765:
	j	bgti_cont.44763
bgti_else.44762:
bgti_cont.44763:
	blt	%zero, %a2, bgt_else.44786
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44787
bgt_else.44786:
	blti	%a2, 10, bgti_else.44788
	blti	%a2, 20, bgti_else.44790
	blti	%a2, 30, bgti_else.44792
	blti	%a2, 40, bgti_else.44794
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.44796
	blti	%a0, 20, bgti_else.44798
	blti	%a0, 30, bgti_else.44800
	blti	%a0, 40, bgti_else.44802
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44804
	blti	%a0, 20, bgti_else.44806
	blti	%a0, 30, bgti_else.44808
	blti	%a0, 40, bgti_else.44810
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44789
bgti_else.44810:
	addi	%a0, %zero, 11
bgti_cont.44811:
	j	bgti_cont.44789
bgti_else.44808:
	addi	%a0, %zero, 10
bgti_cont.44809:
	j	bgti_cont.44789
bgti_else.44806:
	addi	%a0, %zero, 9
bgti_cont.44807:
	j	bgti_cont.44789
bgti_else.44804:
	addi	%a0, %zero, 8
bgti_cont.44805:
	j	bgti_cont.44789
bgti_else.44802:
	addi	%a0, %zero, 7
bgti_cont.44803:
	j	bgti_cont.44789
bgti_else.44800:
	addi	%a0, %zero, 6
bgti_cont.44801:
	j	bgti_cont.44789
bgti_else.44798:
	addi	%a0, %zero, 5
bgti_cont.44799:
	j	bgti_cont.44789
bgti_else.44796:
	addi	%a0, %zero, 4
bgti_cont.44797:
	j	bgti_cont.44789
bgti_else.44794:
	addi	%a0, %zero, 3
bgti_cont.44795:
	j	bgti_cont.44789
bgti_else.44792:
	addi	%a0, %zero, 2
bgti_cont.44793:
	j	bgti_cont.44789
bgti_else.44790:
	add	%a0, %zero, %k1
bgti_cont.44791:
	j	bgti_cont.44789
bgti_else.44788:
	add	%a0, %zero, %zero
bgti_cont.44789:
	blti	%a2, 10, bgti_else.44812
	blti	%a2, 20, bgti_else.44814
	blti	%a2, 30, bgti_else.44816
	blti	%a2, 40, bgti_else.44818
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44813
	blti	%a2, 20, bgti_else.44822
	blti	%a2, 30, bgti_else.44824
	blti	%a2, 40, bgti_else.44826
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44813
	blti	%a2, 20, bgti_else.44830
	blti	%a2, 30, bgti_else.44832
	blti	%a2, 40, bgti_else.44834
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.44813
bgti_else.44834:
	addi	%a2, %a2, -30
bgti_cont.44835:
	j	bgti_cont.44813
bgti_else.44832:
	addi	%a2, %a2, -20
bgti_cont.44833:
	j	bgti_cont.44813
bgti_else.44830:
	addi	%a2, %a2, -10
bgti_cont.44831:
	j	bgti_cont.44813
bgti_else.44828:
bgti_cont.44829:
	j	bgti_cont.44813
bgti_else.44826:
	addi	%a2, %a2, -30
bgti_cont.44827:
	j	bgti_cont.44813
bgti_else.44824:
	addi	%a2, %a2, -20
bgti_cont.44825:
	j	bgti_cont.44813
bgti_else.44822:
	addi	%a2, %a2, -10
bgti_cont.44823:
	j	bgti_cont.44813
bgti_else.44820:
bgti_cont.44821:
	j	bgti_cont.44813
bgti_else.44818:
	addi	%a2, %a2, -30
bgti_cont.44819:
	j	bgti_cont.44813
bgti_else.44816:
	addi	%a2, %a2, -20
bgti_cont.44817:
	j	bgti_cont.44813
bgti_else.44814:
	addi	%a2, %a2, -10
bgti_cont.44815:
	j	bgti_cont.44813
bgti_else.44812:
bgti_cont.44813:
	blt	%zero, %a0, bgt_else.44836
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44837
bgt_else.44836:
	blti	%a0, 10, bgti_else.44838
	blti	%a0, 20, bgti_else.44840
	blti	%a0, 30, bgti_else.44842
	blti	%a0, 40, bgti_else.44844
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44839
	blti	%a0, 20, bgti_else.44848
	blti	%a0, 30, bgti_else.44850
	blti	%a0, 40, bgti_else.44852
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44839
	blti	%a0, 20, bgti_else.44856
	blti	%a0, 30, bgti_else.44858
	blti	%a0, 40, bgti_else.44860
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44839
bgti_else.44860:
	addi	%a0, %a0, -30
bgti_cont.44861:
	j	bgti_cont.44839
bgti_else.44858:
	addi	%a0, %a0, -20
bgti_cont.44859:
	j	bgti_cont.44839
bgti_else.44856:
	addi	%a0, %a0, -10
bgti_cont.44857:
	j	bgti_cont.44839
bgti_else.44854:
bgti_cont.44855:
	j	bgti_cont.44839
bgti_else.44852:
	addi	%a0, %a0, -30
bgti_cont.44853:
	j	bgti_cont.44839
bgti_else.44850:
	addi	%a0, %a0, -20
bgti_cont.44851:
	j	bgti_cont.44839
bgti_else.44848:
	addi	%a0, %a0, -10
bgti_cont.44849:
	j	bgti_cont.44839
bgti_else.44846:
bgti_cont.44847:
	j	bgti_cont.44839
bgti_else.44844:
	addi	%a0, %a0, -30
bgti_cont.44845:
	j	bgti_cont.44839
bgti_else.44842:
	addi	%a0, %a0, -20
bgti_cont.44843:
	j	bgti_cont.44839
bgti_else.44840:
	addi	%a0, %a0, -10
bgti_cont.44841:
	j	bgti_cont.44839
bgti_else.44838:
bgti_cont.44839:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.44837:
bgt_cont.44787:
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
	jal	scan_pixel.3045
	addi	%sp, %sp, -11
bgt_cont.44469:
	lw	%a0, 0(%sp)
	addi	%t2, %a0, 1
	lw	%a0, 4(%sp)
	addi	%t3, %a0, 2
	blti	%t3, 5, bgti_else.44862
	addi	%t3, %t3, -5
	j	bgti_cont.44863
bgti_else.44862:
bgti_cont.44863:
	blt	%t2, %t0, bgt_else.44864
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	jr	%ra
bgt_else.44864:
	lw	%a0, 10(%sp)
	blt	%t2, %a0, bgt_else.44866
	j	bgt_cont.44867
bgt_else.44866:
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
bgt_cont.44867:
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
	blti	%a2, 5, bgti_else.44868
	addi	%a2, %a2, -5
	j	bgti_cont.44869
bgti_else.44868:
bgti_cont.44869:
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
	blti	%a2, 0, bgti_else.44895
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
	blti	%s4, 0, bgti_else.44896
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
	blti	%s4, 0, bgti_else.44897
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
	blti	%s4, 0, bgti_else.44898
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
bgti_else.44898:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.44897:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.44896:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.44895:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
calc_dirvec.3071:
	blti	%v0, 5, bgti_else.45024
	fmul	%f12, %f0, %f0
	fmul	%f11, %f1, %f1
	fadd	%f11, %f12, %f11
	fadd	%f11, %f11, %f30
	fsqrt	%f11, %f11
	fdiv	%f14, %f0, %f11
	fdiv	%f13, %f1, %f11
	fdiv	%f12, %f30, %f11
	lw	%a2, 179(%v1)
	add	%at, %a2, %a0
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fsw	%f14, 0(%a1)
	fsw	%f13, 1(%a1)
	fsw	%f12, 2(%a1)
	addi	%a1, %a0, 40
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fneg	%f0, %f13
	fsw	%f14, 0(%a1)
	fsw	%f12, 1(%a1)
	fsw	%f0, 2(%a1)
	addi	%a1, %a0, 80
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fneg	%f1, %f14
	fneg	%f0, %f13
	fsw	%f12, 0(%a1)
	fsw	%f1, 1(%a1)
	fsw	%f0, 2(%a1)
	addi	%a1, %a0, 1
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fneg	%f11, %f14
	fneg	%f1, %f13
	fneg	%f0, %f12
	fsw	%f11, 0(%a1)
	fsw	%f1, 1(%a1)
	fsw	%f0, 2(%a1)
	addi	%a1, %a0, 41
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fneg	%f1, %f14
	fneg	%f0, %f12
	fsw	%f1, 0(%a1)
	fsw	%f0, 1(%a1)
	fsw	%f13, 2(%a1)
	addi	%a0, %a0, 81
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f0, %f12
	fsw	%f0, 0(%a0)
	fsw	%f14, 1(%a0)
	fsw	%f13, 2(%a0)
	jr	%ra
bgti_else.45024:
	fmul	%f0, %f1, %f1
	flw	%f15, 441(%zero)
	fadd	%f0, %f0, %f15
	fsqrt	%f17, %f0
	fdiv	%f13, %f30, %f17
	fblt	%f13, %fzero, fbgt_else.45026
	add	%a1, %zero, %k1
	j	fbgt_cont.45027
fbgt_else.45026:
	add	%a1, %zero, %zero
fbgt_cont.45027:
	fabs	%f12, %f13
	flw	%f16, 462(%zero)
	fblt	%f12, %f16, fbgt_else.45028
	flw	%f0, 455(%zero)
	fblt	%f12, %f0, fbgt_else.45030
	flw	%f11, 480(%zero)
	fdiv	%f14, %f30, %f12
	fmul	%f18, %f14, %f14
	fmul	%f13, %f18, %f18
	fmul	%f12, %f13, %f13
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f18
	fsub	%f1, %f14, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f13
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	fsub	%f0, %f11, %f0
	j	fbgt_cont.45031
fbgt_else.45030:
	flw	%f11, 479(%zero)
	fsub	%f1, %f12, %f30
	fadd	%f0, %f12, %f30
	fdiv	%f14, %f1, %f0
	fmul	%f18, %f14, %f14
	fmul	%f13, %f18, %f18
	fmul	%f12, %f13, %f13
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f18
	fsub	%f1, %f14, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f13
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fadd	%f0, %f1, %f0
	fadd	%f0, %f11, %f0
fbgt_cont.45031:
	beqi	%a1, 0, bnei_else.45032
	j	fbgt_cont.45029
bnei_else.45032:
	fneg	%f0, %f0
bnei_cont.45033:
	j	fbgt_cont.45029
fbgt_else.45028:
	fmul	%f14, %f13, %f13
	fmul	%f12, %f14, %f14
	fmul	%f11, %f12, %f12
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f14
	fsub	%f1, %f13, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f12
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f14
	fmul	%f0, %f0, %f11
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f13
	fmul	%f0, %f0, %f12
	fmul	%f0, %f0, %f11
	fadd	%f0, %f1, %f0
fbgt_cont.45029:
	fmul	%f18, %f0, %f2
	flw	%f12, 482(%zero)
	fblt	%f18, %fzero, fbgt_else.45034
	add	%a1, %zero, %k1
	j	fbgt_cont.45035
fbgt_else.45034:
	add	%a1, %zero, %zero
fbgt_cont.45035:
	fabs	%f1, %f18
	flw	%f13, 481(%zero)
	fdiv	%f0, %f1, %f13
	floor	%f0, %f0
	fmul	%f0, %f0, %f13
	fsub	%f0, %f1, %f0
	fblt	%f0, %f12, fbgt_else.45036
	beqi	%a1, 0, bnei_else.45038
	add	%a1, %zero, %zero
	j	fbgt_cont.45037
bnei_else.45038:
	add	%a1, %zero, %k1
bnei_cont.45039:
	j	fbgt_cont.45037
fbgt_else.45036:
fbgt_cont.45037:
	fblt	%f0, %f12, fbgt_else.45040
	fsub	%f0, %f0, %f12
	j	fbgt_cont.45041
fbgt_else.45040:
fbgt_cont.45041:
	flw	%f14, 480(%zero)
	fblt	%f0, %f14, fbgt_else.45042
	fsub	%f0, %f12, %f0
	j	fbgt_cont.45043
fbgt_else.45042:
fbgt_cont.45043:
	flw	%f11, 479(%zero)
	fblt	%f11, %f0, fbgt_else.45044
	fmul	%f21, %f0, %f0
	fmul	%f20, %f21, %f21
	flw	%f1, 478(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f21
	fsub	%f19, %f0, %f1
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f20
	fadd	%f19, %f19, %f1
	flw	%f1, 476(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f20
	fsub	%f0, %f19, %f0
	j	fbgt_cont.45045
fbgt_else.45044:
	fsub	%f0, %f14, %f0
	fmul	%f20, %f0, %f0
	fmul	%f19, %f20, %f20
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f20
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fsub	%f0, %f1, %f0
fbgt_cont.45045:
	beqi	%a1, 0, bnei_else.45046
	j	bnei_cont.45047
bnei_else.45046:
	fneg	%f0, %f0
bnei_cont.45047:
	fabs	%f18, %f18
	fdiv	%f1, %f18, %f13
	floor	%f1, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f18, %f1
	fblt	%f1, %f12, fbgt_else.45048
	add	%a1, %zero, %zero
	j	fbgt_cont.45049
fbgt_else.45048:
	add	%a1, %zero, %k1
fbgt_cont.45049:
	fblt	%f1, %f12, fbgt_else.45050
	fsub	%f1, %f1, %f12
	j	fbgt_cont.45051
fbgt_else.45050:
fbgt_cont.45051:
	fblt	%f1, %f14, fbgt_else.45052
	beqi	%a1, 0, bnei_else.45054
	add	%a1, %zero, %zero
	j	fbgt_cont.45053
bnei_else.45054:
	add	%a1, %zero, %k1
bnei_cont.45055:
	j	fbgt_cont.45053
fbgt_else.45052:
fbgt_cont.45053:
	fblt	%f1, %f14, fbgt_else.45056
	fsub	%f1, %f12, %f1
	j	fbgt_cont.45057
fbgt_else.45056:
fbgt_cont.45057:
	fblt	%f11, %f1, fbgt_else.45058
	fmul	%f20, %f1, %f1
	fmul	%f19, %f20, %f20
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f20
	fsub	%f18, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f19
	fadd	%f18, %f18, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f20
	fmul	%f1, %f1, %f19
	fsub	%f1, %f18, %f1
	j	fbgt_cont.45059
fbgt_else.45058:
	fsub	%f21, %f14, %f1
	fmul	%f19, %f21, %f21
	fmul	%f20, %f19, %f19
	flw	%f1, 478(%zero)
	fmul	%f1, %f1, %f21
	fmul	%f1, %f1, %f19
	fsub	%f18, %f21, %f1
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f21
	fmul	%f1, %f1, %f20
	fadd	%f18, %f18, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f21
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fsub	%f1, %f18, %f1
fbgt_cont.45059:
	beqi	%a1, 0, bnei_else.45060
	j	bnei_cont.45061
bnei_else.45060:
	fneg	%f1, %f1
bnei_cont.45061:
	fdiv	%f0, %f0, %f1
	fmul	%f0, %f0, %f17
	addi	%v0, %v0, 1
	fmul	%f1, %f0, %f0
	fadd	%f1, %f1, %f15
	fsqrt	%f15, %f1
	fdiv	%f19, %f30, %f15
	fblt	%f19, %fzero, fbgt_else.45062
	add	%a1, %zero, %k1
	j	fbgt_cont.45063
fbgt_else.45062:
	add	%a1, %zero, %zero
fbgt_cont.45063:
	fabs	%f17, %f19
	fblt	%f17, %f16, fbgt_else.45064
	flw	%f1, 455(%zero)
	fblt	%f17, %f1, fbgt_else.45066
	fdiv	%f19, %f30, %f17
	fmul	%f20, %f19, %f19
	fmul	%f18, %f20, %f20
	fmul	%f17, %f18, %f18
	flw	%f1, 461(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fsub	%f16, %f19, %f1
	flw	%f1, 460(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fadd	%f16, %f16, %f1
	flw	%f1, 459(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fmul	%f1, %f1, %f18
	fsub	%f16, %f16, %f1
	flw	%f1, 458(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 457(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fmul	%f1, %f1, %f17
	fsub	%f16, %f16, %f1
	flw	%f1, 456(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fadd	%f1, %f16, %f1
	fsub	%f1, %f14, %f1
	j	fbgt_cont.45067
fbgt_else.45066:
	fsub	%f16, %f17, %f30
	fadd	%f1, %f17, %f30
	fdiv	%f19, %f16, %f1
	fmul	%f20, %f19, %f19
	fmul	%f18, %f20, %f20
	fmul	%f17, %f18, %f18
	flw	%f1, 461(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fsub	%f16, %f19, %f1
	flw	%f1, 460(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fadd	%f16, %f16, %f1
	flw	%f1, 459(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fmul	%f1, %f1, %f18
	fsub	%f16, %f16, %f1
	flw	%f1, 458(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 457(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fmul	%f1, %f1, %f17
	fsub	%f16, %f16, %f1
	flw	%f1, 456(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fadd	%f1, %f16, %f1
	fadd	%f1, %f11, %f1
fbgt_cont.45067:
	beqi	%a1, 0, bnei_else.45068
	j	fbgt_cont.45065
bnei_else.45068:
	fneg	%f1, %f1
bnei_cont.45069:
	j	fbgt_cont.45065
fbgt_else.45064:
	fmul	%f20, %f19, %f19
	fmul	%f18, %f20, %f20
	fmul	%f17, %f18, %f18
	flw	%f1, 461(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fsub	%f16, %f19, %f1
	flw	%f1, 460(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fadd	%f16, %f16, %f1
	flw	%f1, 459(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fmul	%f1, %f1, %f18
	fsub	%f16, %f16, %f1
	flw	%f1, 458(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 457(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f20
	fmul	%f1, %f1, %f17
	fsub	%f16, %f16, %f1
	flw	%f1, 456(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fadd	%f1, %f16, %f1
fbgt_cont.45065:
	fmul	%f17, %f1, %f3
	fblt	%f17, %fzero, fbgt_else.45070
	add	%a1, %zero, %k1
	j	fbgt_cont.45071
fbgt_else.45070:
	add	%a1, %zero, %zero
fbgt_cont.45071:
	fabs	%f16, %f17
	fdiv	%f1, %f16, %f13
	floor	%f1, %f1
	fmul	%f1, %f1, %f13
	fsub	%f1, %f16, %f1
	fblt	%f1, %f12, fbgt_else.45072
	beqi	%a1, 0, bnei_else.45074
	add	%a1, %zero, %zero
	j	fbgt_cont.45073
bnei_else.45074:
	add	%a1, %zero, %k1
bnei_cont.45075:
	j	fbgt_cont.45073
fbgt_else.45072:
fbgt_cont.45073:
	fblt	%f1, %f12, fbgt_else.45076
	fsub	%f1, %f1, %f12
	j	fbgt_cont.45077
fbgt_else.45076:
fbgt_cont.45077:
	fblt	%f1, %f14, fbgt_else.45078
	fsub	%f1, %f12, %f1
	j	fbgt_cont.45079
fbgt_else.45078:
fbgt_cont.45079:
	fblt	%f11, %f1, fbgt_else.45080
	fmul	%f20, %f1, %f1
	fmul	%f19, %f20, %f20
	flw	%f16, 478(%zero)
	fmul	%f16, %f16, %f1
	fmul	%f16, %f16, %f20
	fsub	%f18, %f1, %f16
	flw	%f16, 477(%zero)
	fmul	%f16, %f16, %f1
	fmul	%f16, %f16, %f19
	fadd	%f18, %f18, %f16
	flw	%f16, 476(%zero)
	fmul	%f1, %f16, %f1
	fmul	%f1, %f1, %f20
	fmul	%f1, %f1, %f19
	fsub	%f1, %f18, %f1
	j	fbgt_cont.45081
fbgt_else.45080:
	fsub	%f1, %f14, %f1
	fmul	%f19, %f1, %f1
	fmul	%f18, %f19, %f19
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f19
	fsub	%f16, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f18
	fadd	%f16, %f16, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fsub	%f1, %f16, %f1
fbgt_cont.45081:
	beqi	%a1, 0, bnei_else.45082
	j	bnei_cont.45083
bnei_else.45082:
	fneg	%f1, %f1
bnei_cont.45083:
	fabs	%f17, %f17
	fdiv	%f16, %f17, %f13
	floor	%f16, %f16
	fmul	%f13, %f16, %f13
	fsub	%f13, %f17, %f13
	fblt	%f13, %f12, fbgt_else.45084
	add	%a1, %zero, %zero
	j	fbgt_cont.45085
fbgt_else.45084:
	add	%a1, %zero, %k1
fbgt_cont.45085:
	fblt	%f13, %f12, fbgt_else.45086
	fsub	%f13, %f13, %f12
	j	fbgt_cont.45087
fbgt_else.45086:
fbgt_cont.45087:
	fblt	%f13, %f14, fbgt_else.45088
	beqi	%a1, 0, bnei_else.45090
	add	%a1, %zero, %zero
	j	fbgt_cont.45089
bnei_else.45090:
	add	%a1, %zero, %k1
bnei_cont.45091:
	j	fbgt_cont.45089
fbgt_else.45088:
fbgt_cont.45089:
	fblt	%f13, %f14, fbgt_else.45092
	fsub	%f13, %f12, %f13
	j	fbgt_cont.45093
fbgt_else.45092:
fbgt_cont.45093:
	fblt	%f11, %f13, fbgt_else.45094
	fmul	%f14, %f13, %f13
	fmul	%f13, %f14, %f14
	flw	%f11, 474(%zero)
	fmul	%f11, %f11, %f14
	fsub	%f12, %f30, %f11
	flw	%f11, 473(%zero)
	fmul	%f11, %f11, %f13
	fadd	%f12, %f12, %f11
	flw	%f11, 472(%zero)
	fmul	%f11, %f11, %f14
	fmul	%f11, %f11, %f13
	fsub	%f11, %f12, %f11
	j	fbgt_cont.45095
fbgt_else.45094:
	fsub	%f16, %f14, %f13
	fmul	%f14, %f16, %f16
	fmul	%f13, %f14, %f14
	flw	%f11, 478(%zero)
	fmul	%f11, %f11, %f16
	fmul	%f11, %f11, %f14
	fsub	%f12, %f16, %f11
	flw	%f11, 477(%zero)
	fmul	%f11, %f11, %f16
	fmul	%f11, %f11, %f13
	fadd	%f12, %f12, %f11
	flw	%f11, 476(%zero)
	fmul	%f11, %f11, %f16
	fmul	%f11, %f11, %f14
	fmul	%f11, %f11, %f13
	fsub	%f11, %f12, %f11
fbgt_cont.45095:
	beqi	%a1, 0, bnei_else.45096
	j	bnei_cont.45097
bnei_else.45096:
	fneg	%f11, %f11
bnei_cont.45097:
	fdiv	%f1, %f1, %f11
	fmul	%f1, %f1, %f15
	j	calc_dirvec.3071
calc_dirvecs.3079:
	fmov	%f3, %f0
	add	%a3, %zero, %v0
	add	%fp, %zero, %a0
	add	%k0, %zero, %ra
	blti	%a3, 0, bgti_else.45125
	itof	%f0, %a3
	flw	%f22, 460(%zero)
	fmul	%f0, %f0, %f22
	flw	%f24, 438(%zero)
	fsub	%f2, %f0, %f24
	addi	%a0, %fp, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	itof	%f0, %a3
	fmul	%f0, %f0, %f22
	flw	%f23, 441(%zero)
	fadd	%f2, %f0, %f23
	addi	%s0, %fp, 2
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	addi	%a3, %a3, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.45126
	addi	%v1, %v1, -5
	j	bgti_cont.45127
bgti_else.45126:
bgti_cont.45127:
	blti	%a3, 0, bgti_else.45128
	itof	%f0, %a3
	fmul	%f0, %f0, %f22
	fsub	%f2, %f0, %f24
	addi	%a0, %fp, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	itof	%f0, %a3
	fmul	%f0, %f0, %f22
	fadd	%f2, %f0, %f23
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	addi	%v0, %a3, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.45129
	addi	%v1, %v1, -5
	j	bgti_cont.45130
bgti_else.45129:
bgti_cont.45130:
	add	%ra, %zero, %k0
	addi	%a0, %fp, 0
	fmov	%f0, %f3
	j	calc_dirvecs.3079
bgti_else.45128:
	add	%ra, %zero, %k0
	jr	%ra
bgti_else.45125:
	add	%ra, %zero, %k0
	jr	%ra
calc_dirvec_rows.3084:
	add	%s1, %zero, %v0
	add	%s2, %zero, %v1
	add	%s3, %zero, %a0
	add	%s4, %zero, %ra
	blti	%s1, 0, bgti_else.45163
	itof	%f0, %s1
	flw	%f26, 460(%zero)
	fmul	%f0, %f0, %f26
	flw	%f25, 438(%zero)
	fsub	%f3, %f0, %f25
	addi	%s5, %zero, 4
	itof	%f0, %s5
	fmul	%f0, %f0, %f26
	fsub	%f2, %f0, %f25
	addi	%a0, %s3, 0
	addi	%v1, %s2, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	itof	%f0, %s5
	fmul	%f1, %f0, %f26
	flw	%f0, 441(%zero)
	fadd	%f2, %f1, %f0
	addi	%a0, %s3, 2
	addi	%v1, %s2, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	addi	%v0, %zero, 3
	addi	%v1, %s2, 1
	blti	%v1, 5, bgti_else.45164
	addi	%v1, %v1, -5
	j	bgti_cont.45165
bgti_else.45164:
bgti_cont.45165:
	addi	%a0, %s3, 0
	fmov	%f0, %f3
	jal	calc_dirvecs.3079
	addi	%s6, %s1, -1
	addi	%s1, %s2, 2
	blti	%s1, 5, bgti_else.45166
	addi	%s1, %s1, -5
	j	bgti_cont.45167
bgti_else.45166:
bgti_cont.45167:
	addi	%s2, %s3, 4
	blti	%s6, 0, bgti_else.45168
	itof	%f0, %s6
	fmul	%f0, %f0, %f26
	fsub	%f0, %f0, %f25
	addi	%a0, %s2, 0
	addi	%v1, %s1, 0
	addi	%v0, %s5, 0
	jal	calc_dirvecs.3079
	addi	%v0, %s6, -1
	addi	%v1, %s1, 2
	blti	%v1, 5, bgti_else.45169
	addi	%v1, %v1, -5
	j	bgti_cont.45170
bgti_else.45169:
bgti_cont.45170:
	addi	%a0, %s2, 4
	add	%ra, %zero, %s4
	j	calc_dirvec_rows.3084
bgti_else.45168:
	add	%ra, %zero, %s4
	jr	%ra
bgti_else.45163:
	add	%ra, %zero, %s4
	jr	%ra
create_dirvec_elements.3090:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	blti	%a2, 0, bgti_else.45202
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
	blti	%k0, 0, bgti_else.45203
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
	blti	%k0, 0, bgti_else.45204
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
	blti	%k0, 0, bgti_else.45205
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
bgti_else.45205:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.45204:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.45203:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.45202:
	add	%ra, %zero, %a3
	jr	%ra
create_dirvecs.3093:
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra
	blti	%s1, 0, bgti_else.45231
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
	blti	%s1, 0, bgti_else.45232
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
bgti_else.45232:
	add	%ra, %zero, %s2
	jr	%ra
bgti_else.45231:
	add	%ra, %zero, %s2
	jr	%ra
init_dirvec_constants.3095:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %ra
	blti	%s5, 0, bgti_else.45345
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	lw	%a0, 0(%zero)
	addi	%s7, %a0, -1
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.45346
	add	%at, %s4, %s5
	lw	%a1, 0(%at)
	blti	%s7, 0, bgti_else.45347
	lw	%a0, 12(%s7)
	lw	%a2, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.45349
	beqi	%a0, 2, bnei_else.45351
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
	beqi	%s1, 0, bnei_else.45353
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
	j	bnei_cont.45354
bnei_else.45353:
bnei_cont.45354:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s1, 0, bnei_else.45355
	flw	%f15, 1(%s0)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s0)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 474(%zero)
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
	j	bnei_cont.45356
bnei_else.45355:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.45356:
	fbne	%f0, %fzero, fbeq_else.45357
	add	%a0, %zero, %k1
	j	fbeq_cont.45358
fbeq_else.45357:
	add	%a0, %zero, %zero
fbeq_cont.45358:
	beqi	%a0, 0, bnei_else.45359
	j	bnei_cont.45360
bnei_else.45359:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.45360:
	add	%at, %a2, %s7
	sw	%v0, 0(%at)
	j	bnei_cont.45350
bnei_else.45351:
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
	fblt	%fzero, %f1, fbgt_else.45361
	add	%a0, %zero, %zero
	j	fbgt_cont.45362
fbgt_else.45361:
	add	%a0, %zero, %k1
fbgt_cont.45362:
	beqi	%a0, 0, bnei_else.45363
	flw	%f0, 468(%zero)
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
	j	bnei_cont.45364
bnei_else.45363:
	fsw	%fzero, 0(%v0)
bnei_cont.45364:
	add	%at, %a2, %s7
	sw	%v0, 0(%at)
bnei_cont.45352:
	j	bnei_cont.45350
bnei_else.45349:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.45365
	add	%a0, %zero, %k1
	j	fbeq_cont.45366
fbeq_else.45365:
	add	%a0, %zero, %zero
fbeq_cont.45366:
	beqi	%a0, 0, bnei_else.45367
	fsw	%fzero, 1(%v0)
	j	bnei_cont.45368
bnei_else.45367:
	fblt	%f1, %fzero, fbgt_else.45369
	add	%a0, %zero, %zero
	j	fbgt_cont.45370
fbgt_else.45369:
	add	%a0, %zero, %k1
fbgt_cont.45370:
	beqi	%fp, 0, bnei_else.45371
	beqi	%a0, 0, bnei_else.45373
	add	%a0, %zero, %zero
	j	bnei_cont.45372
bnei_else.45373:
	add	%a0, %zero, %k1
bnei_cont.45374:
	j	bnei_cont.45372
bnei_else.45371:
bnei_cont.45372:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.45375
	j	bnei_cont.45376
bnei_else.45375:
	fneg	%f0, %f0
bnei_cont.45376:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.45368:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.45377
	add	%a0, %zero, %k1
	j	fbeq_cont.45378
fbeq_else.45377:
	add	%a0, %zero, %zero
fbeq_cont.45378:
	beqi	%a0, 0, bnei_else.45379
	fsw	%fzero, 3(%v0)
	j	bnei_cont.45380
bnei_else.45379:
	fblt	%f1, %fzero, fbgt_else.45381
	add	%a0, %zero, %zero
	j	fbgt_cont.45382
fbgt_else.45381:
	add	%a0, %zero, %k1
fbgt_cont.45382:
	beqi	%fp, 0, bnei_else.45383
	beqi	%a0, 0, bnei_else.45385
	add	%a0, %zero, %zero
	j	bnei_cont.45384
bnei_else.45385:
	add	%a0, %zero, %k1
bnei_cont.45386:
	j	bnei_cont.45384
bnei_else.45383:
bnei_cont.45384:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.45387
	j	bnei_cont.45388
bnei_else.45387:
	fneg	%f0, %f0
bnei_cont.45388:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.45380:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.45389
	add	%a0, %zero, %k1
	j	fbeq_cont.45390
fbeq_else.45389:
	add	%a0, %zero, %zero
fbeq_cont.45390:
	beqi	%a0, 0, bnei_else.45391
	fsw	%fzero, 5(%v0)
	j	bnei_cont.45392
bnei_else.45391:
	fblt	%f1, %fzero, fbgt_else.45393
	add	%a0, %zero, %zero
	j	fbgt_cont.45394
fbgt_else.45393:
	add	%a0, %zero, %k1
fbgt_cont.45394:
	beqi	%fp, 0, bnei_else.45395
	beqi	%a0, 0, bnei_else.45397
	add	%a0, %zero, %zero
	j	bnei_cont.45396
bnei_else.45397:
	add	%a0, %zero, %k1
bnei_cont.45398:
	j	bnei_cont.45396
bnei_else.45395:
bnei_cont.45396:
	flw	%f0, 2(%a3)
	beqi	%a0, 0, bnei_else.45399
	j	bnei_cont.45400
bnei_else.45399:
	fneg	%f0, %f0
bnei_cont.45400:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.45392:
	add	%at, %a2, %s7
	sw	%v0, 0(%at)
bnei_cont.45350:
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2877
	j	bgti_cont.45348
bgti_else.45347:
bgti_cont.45348:
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.45401
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.45402
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	jal	setup_dirvec_constants.2880
	addi	%v1, %s5, -1
	add	%ra, %zero, %s6
	addi	%v0, %s4, 0
	j	init_dirvec_constants.3095
bgti_else.45402:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.45401:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.45346:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.45345:
	add	%ra, %zero, %s6
	jr	%ra
init_vecset_constants.3098:
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra
	blti	%t7, 0, bgti_else.45617
	lw	%s4, 179(%t7)
	addi	%a0, %zero, 119
	lw	%a1, 119(%s4)
	lw	%a0, 0(%zero)
	addi	%t9, %a0, -1
	blti	%t9, 0, bgti_else.45618
	lw	%a0, 12(%t9)
	lw	%a2, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.45620
	beqi	%a0, 2, bnei_else.45622
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
	beqi	%s1, 0, bnei_else.45624
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
	j	bnei_cont.45625
bnei_else.45624:
bnei_cont.45625:
	fmul	%f1, %f16, %f14
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%s1, 0, bnei_else.45626
	flw	%f15, 1(%s0)
	fmul	%f11, %f18, %f15
	flw	%f14, 2(%s0)
	fmul	%f1, %f17, %f14
	fadd	%f1, %f11, %f1
	flw	%f13, 474(%zero)
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
	j	bnei_cont.45627
bnei_else.45626:
	fsw	%f20, 1(%v0)
	fsw	%f2, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.45627:
	fbne	%f0, %fzero, fbeq_else.45628
	add	%a0, %zero, %k1
	j	fbeq_cont.45629
fbeq_else.45628:
	add	%a0, %zero, %zero
fbeq_cont.45629:
	beqi	%a0, 0, bnei_else.45630
	j	bnei_cont.45631
bnei_else.45630:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.45631:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
	j	bnei_cont.45621
bnei_else.45622:
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
	fblt	%fzero, %f1, fbgt_else.45632
	add	%a0, %zero, %zero
	j	fbgt_cont.45633
fbgt_else.45632:
	add	%a0, %zero, %k1
fbgt_cont.45633:
	beqi	%a0, 0, bnei_else.45634
	flw	%f0, 468(%zero)
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
	j	bnei_cont.45635
bnei_else.45634:
	fsw	%fzero, 0(%v0)
bnei_cont.45635:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
bnei_cont.45623:
	j	bnei_cont.45621
bnei_else.45620:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.45636
	add	%a0, %zero, %k1
	j	fbeq_cont.45637
fbeq_else.45636:
	add	%a0, %zero, %zero
fbeq_cont.45637:
	beqi	%a0, 0, bnei_else.45638
	fsw	%fzero, 1(%v0)
	j	bnei_cont.45639
bnei_else.45638:
	fblt	%f1, %fzero, fbgt_else.45640
	add	%a0, %zero, %zero
	j	fbgt_cont.45641
fbgt_else.45640:
	add	%a0, %zero, %k1
fbgt_cont.45641:
	beqi	%fp, 0, bnei_else.45642
	beqi	%a0, 0, bnei_else.45644
	add	%a0, %zero, %zero
	j	bnei_cont.45643
bnei_else.45644:
	add	%a0, %zero, %k1
bnei_cont.45645:
	j	bnei_cont.45643
bnei_else.45642:
bnei_cont.45643:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.45646
	j	bnei_cont.45647
bnei_else.45646:
	fneg	%f0, %f0
bnei_cont.45647:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.45639:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.45648
	add	%a0, %zero, %k1
	j	fbeq_cont.45649
fbeq_else.45648:
	add	%a0, %zero, %zero
fbeq_cont.45649:
	beqi	%a0, 0, bnei_else.45650
	fsw	%fzero, 3(%v0)
	j	bnei_cont.45651
bnei_else.45650:
	fblt	%f1, %fzero, fbgt_else.45652
	add	%a0, %zero, %zero
	j	fbgt_cont.45653
fbgt_else.45652:
	add	%a0, %zero, %k1
fbgt_cont.45653:
	beqi	%fp, 0, bnei_else.45654
	beqi	%a0, 0, bnei_else.45656
	add	%a0, %zero, %zero
	j	bnei_cont.45655
bnei_else.45656:
	add	%a0, %zero, %k1
bnei_cont.45657:
	j	bnei_cont.45655
bnei_else.45654:
bnei_cont.45655:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.45658
	j	bnei_cont.45659
bnei_else.45658:
	fneg	%f0, %f0
bnei_cont.45659:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.45651:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.45660
	add	%a0, %zero, %k1
	j	fbeq_cont.45661
fbeq_else.45660:
	add	%a0, %zero, %zero
fbeq_cont.45661:
	beqi	%a0, 0, bnei_else.45662
	fsw	%fzero, 5(%v0)
	j	bnei_cont.45663
bnei_else.45662:
	fblt	%f1, %fzero, fbgt_else.45664
	add	%a0, %zero, %zero
	j	fbgt_cont.45665
fbgt_else.45664:
	add	%a0, %zero, %k1
fbgt_cont.45665:
	beqi	%fp, 0, bnei_else.45666
	beqi	%a0, 0, bnei_else.45668
	add	%a0, %zero, %zero
	j	bnei_cont.45667
bnei_else.45668:
	add	%a0, %zero, %k1
bnei_cont.45669:
	j	bnei_cont.45667
bnei_else.45666:
bnei_cont.45667:
	flw	%f0, 2(%a3)
	beqi	%a0, 0, bnei_else.45670
	j	bnei_cont.45671
bnei_else.45670:
	fneg	%f0, %f0
bnei_cont.45671:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.45663:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
bnei_cont.45621:
	addi	%v1, %t9, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2877
	j	bgti_cont.45619
bgti_else.45618:
bgti_cont.45619:
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
	blti	%t7, 0, bgti_else.45672
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
	blti	%t7, 0, bgti_else.45673
	lw	%s4, 179(%t7)
	lw	%v0, 119(%s4)
	jal	setup_dirvec_constants.2880
	addi	%v1, %zero, 118
	addi	%v0, %s4, 0
	jal	init_dirvec_constants.3095
	addi	%t7, %t7, -1
	blti	%t7, 0, bgti_else.45674
	lw	%v0, 179(%t7)
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3095
	addi	%v0, %t7, -1
	add	%ra, %zero, %t8
	j	init_vecset_constants.3098
bgti_else.45674:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.45673:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.45672:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.45617:
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
	blti	%s7, 0, bgti_else.47258
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
	j	bgti_cont.47259
bgti_else.47258:
bgti_cont.47259:
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
	blti	%s7, 0, bgti_else.47260
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
	j	bgti_cont.47261
bgti_else.47260:
bgti_cont.47261:
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
	blti	%s7, 0, bgti_else.47262
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
	j	bgti_cont.47263
bgti_else.47262:
bgti_cont.47263:
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
	flw	%f13, 469(%zero)
	fmul	%f11, %f0, %f13
	flw	%f12, 482(%zero)
	fabs	%f1, %f11
	flw	%f14, 481(%zero)
	fdiv	%f0, %f1, %f14
	floor	%f0, %f0
	fmul	%f0, %f0, %f14
	fsub	%f0, %f1, %f0
	fblt	%f0, %f12, fbgt_else.47264
	add	%a0, %zero, %zero
	j	fbgt_cont.47265
fbgt_else.47264:
	add	%a0, %zero, %k1
fbgt_cont.47265:
	fblt	%f0, %f12, fbgt_else.47266
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47267
fbgt_else.47266:
fbgt_cont.47267:
	flw	%f15, 480(%zero)
	fblt	%f0, %f15, fbgt_else.47268
	beqi	%a0, 0, bnei_else.47270
	add	%a0, %zero, %zero
	j	fbgt_cont.47269
bnei_else.47270:
	add	%a0, %zero, %k1
bnei_cont.47271:
	j	fbgt_cont.47269
fbgt_else.47268:
fbgt_cont.47269:
	fblt	%f0, %f15, fbgt_else.47272
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47273
fbgt_else.47272:
fbgt_cont.47273:
	flw	%f16, 479(%zero)
	fblt	%f16, %f0, fbgt_else.47274
	fmul	%f18, %f0, %f0
	fmul	%f17, %f18, %f18
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	j	fbgt_cont.47275
fbgt_else.47274:
	fsub	%f19, %f15, %f0
	fmul	%f18, %f19, %f19
	fmul	%f17, %f18, %f18
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fsub	%f1, %f19, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
fbgt_cont.47275:
	beqi	%a0, 0, bnei_else.47276
	j	bnei_cont.47277
bnei_else.47276:
	fneg	%f1, %f1
bnei_cont.47277:
	fblt	%f11, %fzero, fbgt_else.47278
	add	%a0, %zero, %k1
	j	fbgt_cont.47279
fbgt_else.47278:
	add	%a0, %zero, %zero
fbgt_cont.47279:
	fabs	%f11, %f11
	fdiv	%f0, %f11, %f14
	floor	%f0, %f0
	fmul	%f0, %f0, %f14
	fsub	%f0, %f11, %f0
	fblt	%f0, %f12, fbgt_else.47280
	beqi	%a0, 0, bnei_else.47282
	add	%a0, %zero, %zero
	j	fbgt_cont.47281
bnei_else.47282:
	add	%a0, %zero, %k1
bnei_cont.47283:
	j	fbgt_cont.47281
fbgt_else.47280:
fbgt_cont.47281:
	fblt	%f0, %f12, fbgt_else.47284
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47285
fbgt_else.47284:
fbgt_cont.47285:
	fblt	%f0, %f15, fbgt_else.47286
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47287
fbgt_else.47286:
fbgt_cont.47287:
	fblt	%f16, %f0, fbgt_else.47288
	fmul	%f19, %f0, %f0
	fmul	%f18, %f19, %f19
	flw	%f11, 478(%zero)
	fmul	%f11, %f11, %f0
	fmul	%f11, %f11, %f19
	fsub	%f17, %f0, %f11
	flw	%f11, 477(%zero)
	fmul	%f11, %f11, %f0
	fmul	%f11, %f11, %f18
	fadd	%f17, %f17, %f11
	flw	%f11, 476(%zero)
	fmul	%f0, %f11, %f0
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fsub	%f11, %f17, %f0
	j	fbgt_cont.47289
fbgt_else.47288:
	fsub	%f0, %f15, %f0
	fmul	%f18, %f0, %f0
	fmul	%f17, %f18, %f18
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f11, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f11, %f11, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f11, %f11, %f0
fbgt_cont.47289:
	beqi	%a0, 0, bnei_else.47290
	j	bnei_cont.47291
bnei_else.47290:
	fneg	%f11, %f11
bnei_cont.47291:
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fmul	%f18, %f0, %f13
	fabs	%f17, %f18
	fdiv	%f0, %f17, %f14
	floor	%f0, %f0
	fmul	%f0, %f0, %f14
	fsub	%f0, %f17, %f0
	fblt	%f0, %f12, fbgt_else.47292
	add	%a0, %zero, %zero
	j	fbgt_cont.47293
fbgt_else.47292:
	add	%a0, %zero, %k1
fbgt_cont.47293:
	fblt	%f0, %f12, fbgt_else.47294
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47295
fbgt_else.47294:
fbgt_cont.47295:
	fblt	%f0, %f15, fbgt_else.47296
	beqi	%a0, 0, bnei_else.47298
	add	%a0, %zero, %zero
	j	fbgt_cont.47297
bnei_else.47298:
	add	%a0, %zero, %k1
bnei_cont.47299:
	j	fbgt_cont.47297
fbgt_else.47296:
fbgt_cont.47297:
	fblt	%f0, %f15, fbgt_else.47300
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47301
fbgt_else.47300:
fbgt_cont.47301:
	fblt	%f16, %f0, fbgt_else.47302
	fmul	%f2, %f0, %f0
	fmul	%f19, %f2, %f2
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f2
	fsub	%f17, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fadd	%f17, %f17, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47303
fbgt_else.47302:
	fsub	%f20, %f15, %f0
	fmul	%f2, %f20, %f20
	fmul	%f19, %f2, %f2
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fsub	%f17, %f20, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fadd	%f17, %f17, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fsub	%f0, %f17, %f0
fbgt_cont.47303:
	beqi	%a0, 0, bnei_else.47304
	j	bnei_cont.47305
bnei_else.47304:
	fneg	%f0, %f0
bnei_cont.47305:
	fblt	%f18, %fzero, fbgt_else.47306
	add	%a0, %zero, %k1
	j	fbgt_cont.47307
fbgt_else.47306:
	add	%a0, %zero, %zero
fbgt_cont.47307:
	fabs	%f18, %f18
	fdiv	%f17, %f18, %f14
	floor	%f17, %f17
	fmul	%f17, %f17, %f14
	fsub	%f17, %f18, %f17
	fblt	%f17, %f12, fbgt_else.47308
	beqi	%a0, 0, bnei_else.47310
	add	%a0, %zero, %zero
	j	fbgt_cont.47309
bnei_else.47310:
	add	%a0, %zero, %k1
bnei_cont.47311:
	j	fbgt_cont.47309
fbgt_else.47308:
fbgt_cont.47309:
	fblt	%f17, %f12, fbgt_else.47312
	fsub	%f17, %f17, %f12
	j	fbgt_cont.47313
fbgt_else.47312:
fbgt_cont.47313:
	fblt	%f17, %f15, fbgt_else.47314
	fsub	%f17, %f12, %f17
	j	fbgt_cont.47315
fbgt_else.47314:
fbgt_cont.47315:
	fblt	%f16, %f17, fbgt_else.47316
	fmul	%f20, %f17, %f17
	fmul	%f2, %f20, %f20
	flw	%f18, 478(%zero)
	fmul	%f18, %f18, %f17
	fmul	%f18, %f18, %f20
	fsub	%f19, %f17, %f18
	flw	%f18, 477(%zero)
	fmul	%f18, %f18, %f17
	fmul	%f18, %f18, %f2
	fadd	%f19, %f19, %f18
	flw	%f18, 476(%zero)
	fmul	%f17, %f18, %f17
	fmul	%f17, %f17, %f20
	fmul	%f17, %f17, %f2
	fsub	%f17, %f19, %f17
	j	fbgt_cont.47317
fbgt_else.47316:
	fsub	%f17, %f15, %f17
	fmul	%f2, %f17, %f17
	fmul	%f19, %f2, %f2
	flw	%f17, 474(%zero)
	fmul	%f17, %f17, %f2
	fsub	%f18, %f30, %f17
	flw	%f17, 473(%zero)
	fmul	%f17, %f17, %f19
	fadd	%f18, %f18, %f17
	flw	%f17, 472(%zero)
	fmul	%f17, %f17, %f2
	fmul	%f17, %f17, %f19
	fsub	%f17, %f18, %f17
fbgt_cont.47317:
	beqi	%a0, 0, bnei_else.47318
	j	bnei_cont.47319
bnei_else.47318:
	fneg	%f17, %f17
bnei_cont.47319:
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
	fblt	%f11, %fzero, fbgt_else.47320
	add	%a0, %zero, %k1
	j	fbgt_cont.47321
fbgt_else.47320:
	add	%a0, %zero, %zero
fbgt_cont.47321:
	fabs	%f1, %f11
	fdiv	%f0, %f1, %f14
	floor	%f0, %f0
	fmul	%f0, %f0, %f14
	fsub	%f0, %f1, %f0
	fblt	%f0, %f12, fbgt_else.47322
	beqi	%a0, 0, bnei_else.47324
	add	%a0, %zero, %zero
	j	fbgt_cont.47323
bnei_else.47324:
	add	%a0, %zero, %k1
bnei_cont.47325:
	j	fbgt_cont.47323
fbgt_else.47322:
fbgt_cont.47323:
	fblt	%f0, %f12, fbgt_else.47326
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47327
fbgt_else.47326:
fbgt_cont.47327:
	fblt	%f0, %f15, fbgt_else.47328
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47329
fbgt_else.47328:
fbgt_cont.47329:
	fblt	%f16, %f0, fbgt_else.47330
	fmul	%f19, %f0, %f0
	fmul	%f18, %f19, %f19
	flw	%f1, 478(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fsub	%f17, %f0, %f1
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f18
	fadd	%f17, %f17, %f1
	flw	%f1, 476(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47331
fbgt_else.47330:
	fsub	%f0, %f15, %f0
	fmul	%f18, %f0, %f0
	fmul	%f17, %f18, %f18
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
fbgt_cont.47331:
	beqi	%a0, 0, bnei_else.47332
	j	bnei_cont.47333
bnei_else.47332:
	fneg	%f0, %f0
bnei_cont.47333:
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
	fblt	%f0, %f12, fbgt_else.47334
	add	%a0, %zero, %zero
	j	fbgt_cont.47335
fbgt_else.47334:
	add	%a0, %zero, %k1
fbgt_cont.47335:
	fblt	%f0, %f12, fbgt_else.47336
	fsub	%f0, %f0, %f12
	j	fbgt_cont.47337
fbgt_else.47336:
fbgt_cont.47337:
	fblt	%f0, %f15, fbgt_else.47338
	beqi	%a0, 0, bnei_else.47340
	add	%a0, %zero, %zero
	j	fbgt_cont.47339
bnei_else.47340:
	add	%a0, %zero, %k1
bnei_cont.47341:
	j	fbgt_cont.47339
fbgt_else.47338:
fbgt_cont.47339:
	fblt	%f0, %f15, fbgt_else.47342
	fsub	%f0, %f12, %f0
	j	fbgt_cont.47343
fbgt_else.47342:
fbgt_cont.47343:
	fblt	%f16, %f0, fbgt_else.47344
	fmul	%f17, %f0, %f0
	fmul	%f11, %f17, %f17
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47345
fbgt_else.47344:
	fsub	%f18, %f15, %f0
	fmul	%f17, %f18, %f18
	fmul	%f11, %f17, %f17
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f11
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f11
	fsub	%f0, %f1, %f0
fbgt_cont.47345:
	beqi	%a0, 0, bnei_else.47346
	j	bnei_cont.47347
bnei_else.47346:
	fneg	%f0, %f0
bnei_cont.47347:
	fblt	%f13, %fzero, fbgt_else.47348
	add	%a0, %zero, %k1
	j	fbgt_cont.47349
fbgt_else.47348:
	add	%a0, %zero, %zero
fbgt_cont.47349:
	fabs	%f11, %f13
	fdiv	%f1, %f11, %f14
	floor	%f1, %f1
	fmul	%f1, %f1, %f14
	fsub	%f1, %f11, %f1
	fblt	%f1, %f12, fbgt_else.47350
	beqi	%a0, 0, bnei_else.47352
	add	%a0, %zero, %zero
	j	fbgt_cont.47351
bnei_else.47352:
	add	%a0, %zero, %k1
bnei_cont.47353:
	j	fbgt_cont.47351
fbgt_else.47350:
fbgt_cont.47351:
	fblt	%f1, %f12, fbgt_else.47354
	fsub	%f1, %f1, %f12
	j	fbgt_cont.47355
fbgt_else.47354:
fbgt_cont.47355:
	fblt	%f1, %f15, fbgt_else.47356
	fsub	%f1, %f12, %f1
	j	fbgt_cont.47357
fbgt_else.47356:
fbgt_cont.47357:
	fblt	%f16, %f1, fbgt_else.47358
	fmul	%f19, %f1, %f1
	fmul	%f18, %f19, %f19
	flw	%f11, 478(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f19
	fsub	%f17, %f1, %f11
	flw	%f11, 477(%zero)
	fmul	%f11, %f11, %f1
	fmul	%f11, %f11, %f18
	fadd	%f17, %f17, %f11
	flw	%f11, 476(%zero)
	fmul	%f1, %f11, %f1
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fsub	%f1, %f17, %f1
	j	fbgt_cont.47359
fbgt_else.47358:
	fsub	%f1, %f15, %f1
	fmul	%f18, %f1, %f1
	fmul	%f17, %f18, %f18
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f18
	fsub	%f11, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f17
	fadd	%f11, %f11, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fsub	%f1, %f11, %f1
fbgt_cont.47359:
	beqi	%a0, 0, bnei_else.47360
	j	bnei_cont.47361
bnei_else.47360:
	fneg	%f1, %f1
bnei_cont.47361:
	fmul	%f1, %f0, %f1
	fsw	%f1, 78(%zero)
	fabs	%f11, %f13
	fdiv	%f1, %f11, %f14
	floor	%f1, %f1
	fmul	%f1, %f1, %f14
	fsub	%f1, %f11, %f1
	fblt	%f1, %f12, fbgt_else.47362
	add	%a0, %zero, %zero
	j	fbgt_cont.47363
fbgt_else.47362:
	add	%a0, %zero, %k1
fbgt_cont.47363:
	fblt	%f1, %f12, fbgt_else.47364
	fsub	%f1, %f1, %f12
	j	fbgt_cont.47365
fbgt_else.47364:
fbgt_cont.47365:
	fblt	%f1, %f15, fbgt_else.47366
	beqi	%a0, 0, bnei_else.47368
	add	%a0, %zero, %zero
	j	fbgt_cont.47367
bnei_else.47368:
	add	%a0, %zero, %k1
bnei_cont.47369:
	j	fbgt_cont.47367
fbgt_else.47366:
fbgt_cont.47367:
	fblt	%f1, %f15, fbgt_else.47370
	fsub	%f1, %f12, %f1
	j	fbgt_cont.47371
fbgt_else.47370:
fbgt_cont.47371:
	fblt	%f16, %f1, fbgt_else.47372
	fmul	%f13, %f1, %f1
	fmul	%f12, %f13, %f13
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f13
	fsub	%f11, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f13
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
	j	fbgt_cont.47373
fbgt_else.47372:
	fsub	%f14, %f15, %f1
	fmul	%f13, %f14, %f14
	fmul	%f12, %f13, %f13
	flw	%f1, 478(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f13
	fsub	%f11, %f14, %f1
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f12
	fadd	%f11, %f11, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f14
	fmul	%f1, %f1, %f13
	fmul	%f1, %f1, %f12
	fsub	%f1, %f11, %f1
fbgt_cont.47373:
	beqi	%a0, 0, bnei_else.47374
	j	bnei_cont.47375
bnei_else.47374:
	fneg	%f1, %f1
bnei_cont.47375:
	fmul	%f0, %f0, %f1
	fsw	%f0, 80(%zero)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	fsw	%f0, 81(%zero)
	addi	%v0, %zero, 0
	jal	read_object.2772
	addi	%v0, %zero, 0
	jal	read_net_item.2776
	addi	%sp, %sp, -4
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.47376
	sw	%v0, 83(%zero)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	read_and_network.2780
	addi	%sp, %sp, -4
	j	bnei_cont.47377
bnei_else.47376:
bnei_cont.47377:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	read_net_item.2776
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0
	lw	%a0, 0(%s0)
	beqi	%a0, -1, bnei_else.47378
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	read_or_network.2778
	addi	%sp, %sp, -4
	sw	%s0, 0(%v0)
	j	bnei_cont.47379
bnei_else.47378:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
bnei_cont.47379:
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
	blti	%a3, 10, bgti_else.47380
	blti	%a3, 20, bgti_else.47382
	blti	%a3, 30, bgti_else.47384
	blti	%a3, 40, bgti_else.47386
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47381
	blti	%a3, 20, bgti_else.47390
	blti	%a3, 30, bgti_else.47392
	blti	%a3, 40, bgti_else.47394
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47381
	blti	%a3, 20, bgti_else.47398
	blti	%a3, 30, bgti_else.47400
	blti	%a3, 40, bgti_else.47402
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47381
	blti	%a3, 20, bgti_else.47406
	blti	%a3, 30, bgti_else.47408
	blti	%a3, 40, bgti_else.47410
	addi	%v0, %a3, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0
	j	bgti_cont.47381
bgti_else.47410:
	addi	%a3, %a3, -30
bgti_cont.47411:
	j	bgti_cont.47381
bgti_else.47408:
	addi	%a3, %a3, -20
bgti_cont.47409:
	j	bgti_cont.47381
bgti_else.47406:
	addi	%a3, %a3, -10
bgti_cont.47407:
	j	bgti_cont.47381
bgti_else.47404:
bgti_cont.47405:
	j	bgti_cont.47381
bgti_else.47402:
	addi	%a3, %a3, -30
bgti_cont.47403:
	j	bgti_cont.47381
bgti_else.47400:
	addi	%a3, %a3, -20
bgti_cont.47401:
	j	bgti_cont.47381
bgti_else.47398:
	addi	%a3, %a3, -10
bgti_cont.47399:
	j	bgti_cont.47381
bgti_else.47396:
bgti_cont.47397:
	j	bgti_cont.47381
bgti_else.47394:
	addi	%a3, %a3, -30
bgti_cont.47395:
	j	bgti_cont.47381
bgti_else.47392:
	addi	%a3, %a3, -20
bgti_cont.47393:
	j	bgti_cont.47381
bgti_else.47390:
	addi	%a3, %a3, -10
bgti_cont.47391:
	j	bgti_cont.47381
bgti_else.47388:
bgti_cont.47389:
	j	bgti_cont.47381
bgti_else.47386:
	addi	%a3, %a3, -30
bgti_cont.47387:
	j	bgti_cont.47381
bgti_else.47384:
	addi	%a3, %a3, -20
bgti_cont.47385:
	j	bgti_cont.47381
bgti_else.47382:
	addi	%a3, %a3, -10
bgti_cont.47383:
	j	bgti_cont.47381
bgti_else.47380:
bgti_cont.47381:
	blt	%zero, %a2, bgt_else.47412
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.47413
bgt_else.47412:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.47414
	blti	%a2, 20, bgti_else.47416
	blti	%a2, 30, bgti_else.47418
	blti	%a2, 40, bgti_else.47420
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47415
	blti	%a2, 20, bgti_else.47424
	blti	%a2, 30, bgti_else.47426
	blti	%a2, 40, bgti_else.47428
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47415
	blti	%a2, 20, bgti_else.47432
	blti	%a2, 30, bgti_else.47434
	blti	%a2, 40, bgti_else.47436
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47415
	blti	%a2, 20, bgti_else.47440
	blti	%a2, 30, bgti_else.47442
	blti	%a2, 40, bgti_else.47444
	addi	%v0, %a2, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	j	bgti_cont.47415
bgti_else.47444:
	addi	%a2, %a2, -30
bgti_cont.47445:
	j	bgti_cont.47415
bgti_else.47442:
	addi	%a2, %a2, -20
bgti_cont.47443:
	j	bgti_cont.47415
bgti_else.47440:
	addi	%a2, %a2, -10
bgti_cont.47441:
	j	bgti_cont.47415
bgti_else.47438:
bgti_cont.47439:
	j	bgti_cont.47415
bgti_else.47436:
	addi	%a2, %a2, -30
bgti_cont.47437:
	j	bgti_cont.47415
bgti_else.47434:
	addi	%a2, %a2, -20
bgti_cont.47435:
	j	bgti_cont.47415
bgti_else.47432:
	addi	%a2, %a2, -10
bgti_cont.47433:
	j	bgti_cont.47415
bgti_else.47430:
bgti_cont.47431:
	j	bgti_cont.47415
bgti_else.47428:
	addi	%a2, %a2, -30
bgti_cont.47429:
	j	bgti_cont.47415
bgti_else.47426:
	addi	%a2, %a2, -20
bgti_cont.47427:
	j	bgti_cont.47415
bgti_else.47424:
	addi	%a2, %a2, -10
bgti_cont.47425:
	j	bgti_cont.47415
bgti_else.47422:
bgti_cont.47423:
	j	bgti_cont.47415
bgti_else.47420:
	addi	%a2, %a2, -30
bgti_cont.47421:
	j	bgti_cont.47415
bgti_else.47418:
	addi	%a2, %a2, -20
bgti_cont.47419:
	j	bgti_cont.47415
bgti_else.47416:
	addi	%a2, %a2, -10
bgti_cont.47417:
	j	bgti_cont.47415
bgti_else.47414:
bgti_cont.47415:
	blt	%zero, %a0, bgt_else.47446
	addi	%v0, %a2, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.47447
bgt_else.47446:
	blti	%a0, 10, bgti_else.47448
	blti	%a0, 20, bgti_else.47450
	blti	%a0, 30, bgti_else.47452
	blti	%a0, 40, bgti_else.47454
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47449
	blti	%a0, 20, bgti_else.47458
	blti	%a0, 30, bgti_else.47460
	blti	%a0, 40, bgti_else.47462
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47449
	blti	%a0, 20, bgti_else.47466
	blti	%a0, 30, bgti_else.47468
	blti	%a0, 40, bgti_else.47470
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47449
	blti	%a0, 20, bgti_else.47474
	blti	%a0, 30, bgti_else.47476
	blti	%a0, 40, bgti_else.47478
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	j	bgti_cont.47449
bgti_else.47478:
	addi	%a0, %a0, -30
bgti_cont.47479:
	j	bgti_cont.47449
bgti_else.47476:
	addi	%a0, %a0, -20
bgti_cont.47477:
	j	bgti_cont.47449
bgti_else.47474:
	addi	%a0, %a0, -10
bgti_cont.47475:
	j	bgti_cont.47449
bgti_else.47472:
bgti_cont.47473:
	j	bgti_cont.47449
bgti_else.47470:
	addi	%a0, %a0, -30
bgti_cont.47471:
	j	bgti_cont.47449
bgti_else.47468:
	addi	%a0, %a0, -20
bgti_cont.47469:
	j	bgti_cont.47449
bgti_else.47466:
	addi	%a0, %a0, -10
bgti_cont.47467:
	j	bgti_cont.47449
bgti_else.47464:
bgti_cont.47465:
	j	bgti_cont.47449
bgti_else.47462:
	addi	%a0, %a0, -30
bgti_cont.47463:
	j	bgti_cont.47449
bgti_else.47460:
	addi	%a0, %a0, -20
bgti_cont.47461:
	j	bgti_cont.47449
bgti_else.47458:
	addi	%a0, %a0, -10
bgti_cont.47459:
	j	bgti_cont.47449
bgti_else.47456:
bgti_cont.47457:
	j	bgti_cont.47449
bgti_else.47454:
	addi	%a0, %a0, -30
bgti_cont.47455:
	j	bgti_cont.47449
bgti_else.47452:
	addi	%a0, %a0, -20
bgti_cont.47453:
	j	bgti_cont.47449
bgti_else.47450:
	addi	%a0, %a0, -10
bgti_cont.47451:
	j	bgti_cont.47449
bgti_else.47448:
bgti_cont.47449:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
bgt_cont.47447:
bgt_cont.47413:
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
	blti	%a3, 10, bgti_else.47480
	blti	%a3, 20, bgti_else.47482
	blti	%a3, 30, bgti_else.47484
	blti	%a3, 40, bgti_else.47486
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47481
	blti	%a3, 20, bgti_else.47490
	blti	%a3, 30, bgti_else.47492
	blti	%a3, 40, bgti_else.47494
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47481
	blti	%a3, 20, bgti_else.47498
	blti	%a3, 30, bgti_else.47500
	blti	%a3, 40, bgti_else.47502
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47481
	blti	%a3, 20, bgti_else.47506
	blti	%a3, 30, bgti_else.47508
	blti	%a3, 40, bgti_else.47510
	addi	%v0, %a3, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0
	j	bgti_cont.47481
bgti_else.47510:
	addi	%a3, %a3, -30
bgti_cont.47511:
	j	bgti_cont.47481
bgti_else.47508:
	addi	%a3, %a3, -20
bgti_cont.47509:
	j	bgti_cont.47481
bgti_else.47506:
	addi	%a3, %a3, -10
bgti_cont.47507:
	j	bgti_cont.47481
bgti_else.47504:
bgti_cont.47505:
	j	bgti_cont.47481
bgti_else.47502:
	addi	%a3, %a3, -30
bgti_cont.47503:
	j	bgti_cont.47481
bgti_else.47500:
	addi	%a3, %a3, -20
bgti_cont.47501:
	j	bgti_cont.47481
bgti_else.47498:
	addi	%a3, %a3, -10
bgti_cont.47499:
	j	bgti_cont.47481
bgti_else.47496:
bgti_cont.47497:
	j	bgti_cont.47481
bgti_else.47494:
	addi	%a3, %a3, -30
bgti_cont.47495:
	j	bgti_cont.47481
bgti_else.47492:
	addi	%a3, %a3, -20
bgti_cont.47493:
	j	bgti_cont.47481
bgti_else.47490:
	addi	%a3, %a3, -10
bgti_cont.47491:
	j	bgti_cont.47481
bgti_else.47488:
bgti_cont.47489:
	j	bgti_cont.47481
bgti_else.47486:
	addi	%a3, %a3, -30
bgti_cont.47487:
	j	bgti_cont.47481
bgti_else.47484:
	addi	%a3, %a3, -20
bgti_cont.47485:
	j	bgti_cont.47481
bgti_else.47482:
	addi	%a3, %a3, -10
bgti_cont.47483:
	j	bgti_cont.47481
bgti_else.47480:
bgti_cont.47481:
	blt	%zero, %fp, bgt_else.47512
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.47513
bgt_else.47512:
	addi	%v1, %zero, 0
	addi	%v0, %fp, 0
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	blti	%fp, 10, bgti_else.47514
	blti	%fp, 20, bgti_else.47516
	blti	%fp, 30, bgti_else.47518
	blti	%fp, 40, bgti_else.47520
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.47515
	blti	%fp, 20, bgti_else.47524
	blti	%fp, 30, bgti_else.47526
	blti	%fp, 40, bgti_else.47528
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.47515
	blti	%fp, 20, bgti_else.47532
	blti	%fp, 30, bgti_else.47534
	blti	%fp, 40, bgti_else.47536
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.47515
	blti	%fp, 20, bgti_else.47540
	blti	%fp, 30, bgti_else.47542
	blti	%fp, 40, bgti_else.47544
	addi	%v0, %fp, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0
	j	bgti_cont.47515
bgti_else.47544:
	addi	%fp, %fp, -30
bgti_cont.47545:
	j	bgti_cont.47515
bgti_else.47542:
	addi	%fp, %fp, -20
bgti_cont.47543:
	j	bgti_cont.47515
bgti_else.47540:
	addi	%fp, %fp, -10
bgti_cont.47541:
	j	bgti_cont.47515
bgti_else.47538:
bgti_cont.47539:
	j	bgti_cont.47515
bgti_else.47536:
	addi	%fp, %fp, -30
bgti_cont.47537:
	j	bgti_cont.47515
bgti_else.47534:
	addi	%fp, %fp, -20
bgti_cont.47535:
	j	bgti_cont.47515
bgti_else.47532:
	addi	%fp, %fp, -10
bgti_cont.47533:
	j	bgti_cont.47515
bgti_else.47530:
bgti_cont.47531:
	j	bgti_cont.47515
bgti_else.47528:
	addi	%fp, %fp, -30
bgti_cont.47529:
	j	bgti_cont.47515
bgti_else.47526:
	addi	%fp, %fp, -20
bgti_cont.47527:
	j	bgti_cont.47515
bgti_else.47524:
	addi	%fp, %fp, -10
bgti_cont.47525:
	j	bgti_cont.47515
bgti_else.47522:
bgti_cont.47523:
	j	bgti_cont.47515
bgti_else.47520:
	addi	%fp, %fp, -30
bgti_cont.47521:
	j	bgti_cont.47515
bgti_else.47518:
	addi	%fp, %fp, -20
bgti_cont.47519:
	j	bgti_cont.47515
bgti_else.47516:
	addi	%fp, %fp, -10
bgti_cont.47517:
	j	bgti_cont.47515
bgti_else.47514:
bgti_cont.47515:
	blt	%zero, %a0, bgt_else.47546
	addi	%v0, %fp, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.47547
bgt_else.47546:
	blti	%a0, 10, bgti_else.47548
	blti	%a0, 20, bgti_else.47550
	blti	%a0, 30, bgti_else.47552
	blti	%a0, 40, bgti_else.47554
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47549
	blti	%a0, 20, bgti_else.47558
	blti	%a0, 30, bgti_else.47560
	blti	%a0, 40, bgti_else.47562
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47549
	blti	%a0, 20, bgti_else.47566
	blti	%a0, 30, bgti_else.47568
	blti	%a0, 40, bgti_else.47570
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47549
	blti	%a0, 20, bgti_else.47574
	blti	%a0, 30, bgti_else.47576
	blti	%a0, 40, bgti_else.47578
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	j	bgti_cont.47549
bgti_else.47578:
	addi	%a0, %a0, -30
bgti_cont.47579:
	j	bgti_cont.47549
bgti_else.47576:
	addi	%a0, %a0, -20
bgti_cont.47577:
	j	bgti_cont.47549
bgti_else.47574:
	addi	%a0, %a0, -10
bgti_cont.47575:
	j	bgti_cont.47549
bgti_else.47572:
bgti_cont.47573:
	j	bgti_cont.47549
bgti_else.47570:
	addi	%a0, %a0, -30
bgti_cont.47571:
	j	bgti_cont.47549
bgti_else.47568:
	addi	%a0, %a0, -20
bgti_cont.47569:
	j	bgti_cont.47549
bgti_else.47566:
	addi	%a0, %a0, -10
bgti_cont.47567:
	j	bgti_cont.47549
bgti_else.47564:
bgti_cont.47565:
	j	bgti_cont.47549
bgti_else.47562:
	addi	%a0, %a0, -30
bgti_cont.47563:
	j	bgti_cont.47549
bgti_else.47560:
	addi	%a0, %a0, -20
bgti_cont.47561:
	j	bgti_cont.47549
bgti_else.47558:
	addi	%a0, %a0, -10
bgti_cont.47559:
	j	bgti_cont.47549
bgti_else.47556:
bgti_cont.47557:
	j	bgti_cont.47549
bgti_else.47554:
	addi	%a0, %a0, -30
bgti_cont.47555:
	j	bgti_cont.47549
bgti_else.47552:
	addi	%a0, %a0, -20
bgti_cont.47553:
	j	bgti_cont.47549
bgti_else.47550:
	addi	%a0, %a0, -10
bgti_cont.47551:
	j	bgti_cont.47549
bgti_else.47548:
bgti_cont.47549:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %fp, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
bgt_cont.47547:
bgt_cont.47513:
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
	blt	%zero, %a2, bgt_else.47580
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.47581
bgt_else.47580:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.47582
	blti	%a2, 20, bgti_else.47584
	blti	%a2, 30, bgti_else.47586
	blti	%a2, 40, bgti_else.47588
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47583
	blti	%a2, 20, bgti_else.47592
	blti	%a2, 30, bgti_else.47594
	blti	%a2, 40, bgti_else.47596
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47583
	blti	%a2, 20, bgti_else.47600
	blti	%a2, 30, bgti_else.47602
	blti	%a2, 40, bgti_else.47604
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47583
	blti	%a2, 20, bgti_else.47608
	blti	%a2, 30, bgti_else.47610
	blti	%a2, 40, bgti_else.47612
	addi	%v0, %a2, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	j	bgti_cont.47583
bgti_else.47612:
	addi	%a2, %a2, -30
bgti_cont.47613:
	j	bgti_cont.47583
bgti_else.47610:
	addi	%a2, %a2, -20
bgti_cont.47611:
	j	bgti_cont.47583
bgti_else.47608:
	addi	%a2, %a2, -10
bgti_cont.47609:
	j	bgti_cont.47583
bgti_else.47606:
bgti_cont.47607:
	j	bgti_cont.47583
bgti_else.47604:
	addi	%a2, %a2, -30
bgti_cont.47605:
	j	bgti_cont.47583
bgti_else.47602:
	addi	%a2, %a2, -20
bgti_cont.47603:
	j	bgti_cont.47583
bgti_else.47600:
	addi	%a2, %a2, -10
bgti_cont.47601:
	j	bgti_cont.47583
bgti_else.47598:
bgti_cont.47599:
	j	bgti_cont.47583
bgti_else.47596:
	addi	%a2, %a2, -30
bgti_cont.47597:
	j	bgti_cont.47583
bgti_else.47594:
	addi	%a2, %a2, -20
bgti_cont.47595:
	j	bgti_cont.47583
bgti_else.47592:
	addi	%a2, %a2, -10
bgti_cont.47593:
	j	bgti_cont.47583
bgti_else.47590:
bgti_cont.47591:
	j	bgti_cont.47583
bgti_else.47588:
	addi	%a2, %a2, -30
bgti_cont.47589:
	j	bgti_cont.47583
bgti_else.47586:
	addi	%a2, %a2, -20
bgti_cont.47587:
	j	bgti_cont.47583
bgti_else.47584:
	addi	%a2, %a2, -10
bgti_cont.47585:
	j	bgti_cont.47583
bgti_else.47582:
bgti_cont.47583:
	blt	%zero, %a0, bgt_else.47614
	addi	%v0, %a2, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	j	bgt_cont.47615
bgt_else.47614:
	blti	%a0, 10, bgti_else.47616
	blti	%a0, 20, bgti_else.47618
	blti	%a0, 30, bgti_else.47620
	blti	%a0, 40, bgti_else.47622
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47617
	blti	%a0, 20, bgti_else.47626
	blti	%a0, 30, bgti_else.47628
	blti	%a0, 40, bgti_else.47630
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47617
	blti	%a0, 20, bgti_else.47634
	blti	%a0, 30, bgti_else.47636
	blti	%a0, 40, bgti_else.47638
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47617
	blti	%a0, 20, bgti_else.47642
	blti	%a0, 30, bgti_else.47644
	blti	%a0, 40, bgti_else.47646
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4
	jal	print_int_sub2.2632
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	j	bgti_cont.47617
bgti_else.47646:
	addi	%a0, %a0, -30
bgti_cont.47647:
	j	bgti_cont.47617
bgti_else.47644:
	addi	%a0, %a0, -20
bgti_cont.47645:
	j	bgti_cont.47617
bgti_else.47642:
	addi	%a0, %a0, -10
bgti_cont.47643:
	j	bgti_cont.47617
bgti_else.47640:
bgti_cont.47641:
	j	bgti_cont.47617
bgti_else.47638:
	addi	%a0, %a0, -30
bgti_cont.47639:
	j	bgti_cont.47617
bgti_else.47636:
	addi	%a0, %a0, -20
bgti_cont.47637:
	j	bgti_cont.47617
bgti_else.47634:
	addi	%a0, %a0, -10
bgti_cont.47635:
	j	bgti_cont.47617
bgti_else.47632:
bgti_cont.47633:
	j	bgti_cont.47617
bgti_else.47630:
	addi	%a0, %a0, -30
bgti_cont.47631:
	j	bgti_cont.47617
bgti_else.47628:
	addi	%a0, %a0, -20
bgti_cont.47629:
	j	bgti_cont.47617
bgti_else.47626:
	addi	%a0, %a0, -10
bgti_cont.47627:
	j	bgti_cont.47617
bgti_else.47624:
bgti_cont.47625:
	j	bgti_cont.47617
bgti_else.47622:
	addi	%a0, %a0, -30
bgti_cont.47623:
	j	bgti_cont.47617
bgti_else.47620:
	addi	%a0, %a0, -20
bgti_cont.47621:
	j	bgti_cont.47617
bgti_else.47618:
	addi	%a0, %a0, -10
bgti_cont.47619:
	j	bgti_cont.47617
bgti_else.47616:
bgti_cont.47617:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -4
bgt_cont.47615:
bgt_cont.47581:
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
	lw	%s7, 183(%zero)
	addi	%v1, %zero, 118
	addi	%v0, %s7, 0
	jal	create_dirvec_elements.3090
	addi	%v0, %zero, 3
	jal	create_dirvecs.3093
	addi	%a0, %zero, 9
	itof	%f1, %a0
	flw	%f0, 460(%zero)
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
	addi	%v0, %s7, 0
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
	blti	%s4, 0, bgti_else.47648
	lw	%a0, 12(%s4)
	lw	%a2, 9(%a0)
	lw	%fp, 6(%a0)
	lw	%a1, 4(%a0)
	lw	%a3, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.47650
	beqi	%a0, 2, bnei_else.47652
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
	beqi	%a3, 0, bnei_else.47654
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
	j	bnei_cont.47655
bnei_else.47654:
bnei_cont.47655:
	fmul	%f1, %f15, %f16
	fneg	%f20, %f1
	fmul	%f1, %f13, %f14
	fneg	%f19, %f1
	fmul	%f1, %f2, %f12
	fneg	%f14, %f1
	fsw	%f0, 0(%v0)
	beqi	%a3, 0, bnei_else.47656
	flw	%f17, 1(%a2)
	fmul	%f11, %f2, %f17
	flw	%f18, 2(%a2)
	fmul	%f1, %f13, %f18
	fadd	%f1, %f11, %f1
	flw	%f16, 474(%zero)
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
	j	bnei_cont.47657
bnei_else.47656:
	fsw	%f20, 1(%v0)
	fsw	%f19, 2(%v0)
	fsw	%f14, 3(%v0)
bnei_cont.47657:
	fbne	%f0, %fzero, fbeq_else.47658
	add	%a0, %zero, %k1
	j	fbeq_cont.47659
fbeq_else.47658:
	add	%a0, %zero, %zero
fbeq_cont.47659:
	beqi	%a0, 0, bnei_else.47660
	j	bnei_cont.47661
bnei_else.47660:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.47661:
	sw	%v0, 187(%s4)
	j	bnei_cont.47651
bnei_else.47652:
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
	fblt	%fzero, %f1, fbgt_else.47662
	add	%a0, %zero, %zero
	j	fbgt_cont.47663
fbgt_else.47662:
	add	%a0, %zero, %k1
fbgt_cont.47663:
	beqi	%a0, 0, bnei_else.47664
	flw	%f0, 468(%zero)
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
	j	bnei_cont.47665
bnei_else.47664:
	fsw	%fzero, 0(%v0)
bnei_cont.47665:
	sw	%v0, 187(%s4)
bnei_cont.47653:
	j	bnei_cont.47651
bnei_else.47650:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	flw	%f1, 184(%zero)
	fbne	%f1, %fzero, fbeq_else.47666
	add	%a0, %zero, %k1
	j	fbeq_cont.47667
fbeq_else.47666:
	add	%a0, %zero, %zero
fbeq_cont.47667:
	beqi	%a0, 0, bnei_else.47668
	fsw	%fzero, 1(%v0)
	j	bnei_cont.47669
bnei_else.47668:
	fblt	%f1, %fzero, fbgt_else.47670
	add	%a0, %zero, %zero
	j	fbgt_cont.47671
fbgt_else.47670:
	add	%a0, %zero, %k1
fbgt_cont.47671:
	beqi	%fp, 0, bnei_else.47672
	beqi	%a0, 0, bnei_else.47674
	add	%a0, %zero, %zero
	j	bnei_cont.47673
bnei_else.47674:
	add	%a0, %zero, %k1
bnei_cont.47675:
	j	bnei_cont.47673
bnei_else.47672:
bnei_cont.47673:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.47676
	j	bnei_cont.47677
bnei_else.47676:
	fneg	%f0, %f0
bnei_cont.47677:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.47669:
	flw	%f1, 185(%zero)
	fbne	%f1, %fzero, fbeq_else.47678
	add	%a0, %zero, %k1
	j	fbeq_cont.47679
fbeq_else.47678:
	add	%a0, %zero, %zero
fbeq_cont.47679:
	beqi	%a0, 0, bnei_else.47680
	fsw	%fzero, 3(%v0)
	j	bnei_cont.47681
bnei_else.47680:
	fblt	%f1, %fzero, fbgt_else.47682
	add	%a0, %zero, %zero
	j	fbgt_cont.47683
fbgt_else.47682:
	add	%a0, %zero, %k1
fbgt_cont.47683:
	beqi	%fp, 0, bnei_else.47684
	beqi	%a0, 0, bnei_else.47686
	add	%a0, %zero, %zero
	j	bnei_cont.47685
bnei_else.47686:
	add	%a0, %zero, %k1
bnei_cont.47687:
	j	bnei_cont.47685
bnei_else.47684:
bnei_cont.47685:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.47688
	j	bnei_cont.47689
bnei_else.47688:
	fneg	%f0, %f0
bnei_cont.47689:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.47681:
	flw	%f1, 186(%zero)
	fbne	%f1, %fzero, fbeq_else.47690
	add	%a0, %zero, %k1
	j	fbeq_cont.47691
fbeq_else.47690:
	add	%a0, %zero, %zero
fbeq_cont.47691:
	beqi	%a0, 0, bnei_else.47692
	fsw	%fzero, 5(%v0)
	j	bnei_cont.47693
bnei_else.47692:
	fblt	%f1, %fzero, fbgt_else.47694
	add	%a0, %zero, %zero
	j	fbgt_cont.47695
fbgt_else.47694:
	add	%a0, %zero, %k1
fbgt_cont.47695:
	beqi	%fp, 0, bnei_else.47696
	beqi	%a0, 0, bnei_else.47698
	add	%a0, %zero, %zero
	j	bnei_cont.47697
bnei_else.47698:
	add	%a0, %zero, %k1
bnei_cont.47699:
	j	bnei_cont.47697
bnei_else.47696:
bnei_cont.47697:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.47700
	j	bnei_cont.47701
bnei_else.47700:
	fneg	%f0, %f0
bnei_cont.47701:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.47693:
	sw	%v0, 187(%s4)
bnei_cont.47651:
	addi	%v1, %s4, -1
	addi	%v0, %zero, 247
	addi	%sp, %sp, 5
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -5
	j	bgti_cont.47649
bgti_else.47648:
bgti_cont.47649:
	blti	%s4, 0, bgti_else.47702
	lw	%a1, 12(%s4)
	lw	%a2, 7(%a1)
	lw	%a3, 4(%a1)
	lw	%a0, 2(%a1)
	lw	%a1, 1(%a1)
	beqi	%a0, 2, bnei_else.47704
	j	bgti_cont.47703
bnei_else.47704:
	flw	%f0, 0(%a2)
	fblt	%f0, %f30, fbgt_else.47706
	add	%a0, %zero, %zero
	j	fbgt_cont.47707
fbgt_else.47706:
	add	%a0, %zero, %k1
fbgt_cont.47707:
	beqi	%a0, 0, bgti_cont.47703
	beqi	%a1, 1, bnei_else.47710
	beqi	%a1, 2, bnei_else.47712
	j	bgti_cont.47703
bnei_else.47712:
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
	flw	%f1, 470(%zero)
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
bnei_cont.47713:
	j	bgti_cont.47703
bnei_else.47710:
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
bnei_cont.47711:
	j	bgti_cont.47703
bnei_else.47708:
bnei_cont.47709:
bnei_cont.47705:
	j	bgti_cont.47703
bgti_else.47702:
bgti_cont.47703:
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
