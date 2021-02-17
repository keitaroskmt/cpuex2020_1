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
	blti	%a0, 10, bgti_else.31519
	blti	%a0, 20, bgti_else.31520
	blti	%a0, 30, bgti_else.31521
	blti	%a0, 40, bgti_else.31522
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.31523
	blti	%a0, 20, bgti_else.31524
	blti	%a0, 30, bgti_else.31525
	blti	%a0, 40, bgti_else.31526
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.31527
	blti	%a0, 20, bgti_else.31528
	blti	%a0, 30, bgti_else.31529
	blti	%a0, 40, bgti_else.31530
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.31531
	blti	%a0, 20, bgti_else.31532
	blti	%a0, 30, bgti_else.31533
	blti	%a0, 40, bgti_else.31534
	addi	%a0, %a0, -40
	addi	%v1, %v0, 4
	addi	%v0, %a0, 0
	j	print_int_sub1.2629
bgti_else.31534:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.31533:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.31532:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.31531:
	jr	%ra
bgti_else.31530:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.31529:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.31528:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.31527:
	jr	%ra
bgti_else.31526:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.31525:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.31524:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.31523:
	jr	%ra
bgti_else.31522:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.31521:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.31520:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.31519:
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.31651
	blti	%v0, 20, bgti_else.31652
	blti	%v0, 30, bgti_else.31653
	blti	%v0, 40, bgti_else.31654
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31655
	blti	%v0, 20, bgti_else.31656
	blti	%v0, 30, bgti_else.31657
	blti	%v0, 40, bgti_else.31658
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31659
	blti	%v0, 20, bgti_else.31660
	blti	%v0, 30, bgti_else.31661
	blti	%v0, 40, bgti_else.31662
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31663
	blti	%v0, 20, bgti_else.31664
	blti	%v0, 30, bgti_else.31665
	blti	%v0, 40, bgti_else.31666
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31667
	blti	%v0, 20, bgti_else.31668
	blti	%v0, 30, bgti_else.31669
	blti	%v0, 40, bgti_else.31670
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31671
	blti	%v0, 20, bgti_else.31672
	blti	%v0, 30, bgti_else.31673
	blti	%v0, 40, bgti_else.31674
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31675
	blti	%v0, 20, bgti_else.31676
	blti	%v0, 30, bgti_else.31677
	blti	%v0, 40, bgti_else.31678
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.31679
	blti	%v0, 20, bgti_else.31680
	blti	%v0, 30, bgti_else.31681
	blti	%v0, 40, bgti_else.31682
	addi	%v0, %v0, -40
	j	print_int_sub2.2632
bgti_else.31682:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31681:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31680:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31679:
	jr	%ra
bgti_else.31678:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31677:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31676:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31675:
	jr	%ra
bgti_else.31674:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31673:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31672:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31671:
	jr	%ra
bgti_else.31670:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31669:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31668:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31667:
	jr	%ra
bgti_else.31666:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31665:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31664:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31663:
	jr	%ra
bgti_else.31662:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31661:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31660:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31659:
	jr	%ra
bgti_else.31658:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31657:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31656:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31655:
	jr	%ra
bgti_else.31654:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.31653:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.31652:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.31651:
	jr	%ra
rotate_quadratic_matrix.2767:
	flw	%f16, 0(%v1)
	flw	%f18, 482(%zero)
	fabs	%f1, %f16
	flw	%f19, 481(%zero)
	fdiv	%f0, %f1, %f19
	floor	%f0, %f0
	fmul	%f0, %f0, %f19
	fsub	%f0, %f1, %f0
	fblt	%f0, %f18, fbgt_else.31830
	add	%a0, %zero, %zero
	j	fbgt_cont.31831
fbgt_else.31830:
	add	%a0, %zero, %k1
fbgt_cont.31831:
	fblt	%f0, %f18, fbgt_else.31832
	fsub	%f0, %f0, %f18
	j	fbgt_cont.31833
fbgt_else.31832:
fbgt_cont.31833:
	flw	%f2, 480(%zero)
	fblt	%f0, %f2, fbgt_else.31834
	beqi	%a0, 0, bnei_else.31836
	add	%a0, %zero, %zero
	j	fbgt_cont.31835
bnei_else.31836:
	add	%a0, %zero, %k1
bnei_cont.31837:
	j	fbgt_cont.31835
fbgt_else.31834:
fbgt_cont.31835:
	fblt	%f0, %f2, fbgt_else.31838
	fsub	%f0, %f18, %f0
	j	fbgt_cont.31839
fbgt_else.31838:
fbgt_cont.31839:
	flw	%f17, 479(%zero)
	fblt	%f17, %f0, fbgt_else.31840
	fmul	%f21, %f0, %f0
	fmul	%f20, %f21, %f21
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f21
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f20
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f20
	fsub	%f0, %f1, %f0
	j	fbgt_cont.31841
fbgt_else.31840:
	fsub	%f22, %f2, %f0
	fmul	%f20, %f22, %f22
	fmul	%f21, %f20, %f20
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f20
	fsub	%f1, %f22, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fsub	%f0, %f1, %f0
fbgt_cont.31841:
	beqi	%a0, 0, bnei_else.31842
	j	bnei_cont.31843
bnei_else.31842:
	fneg	%f0, %f0
bnei_cont.31843:
	fblt	%f16, %fzero, fbgt_else.31844
	add	%a0, %zero, %k1
	j	fbgt_cont.31845
fbgt_else.31844:
	add	%a0, %zero, %zero
fbgt_cont.31845:
	fabs	%f16, %f16
	fdiv	%f1, %f16, %f19
	floor	%f1, %f1
	fmul	%f1, %f1, %f19
	fsub	%f1, %f16, %f1
	fblt	%f1, %f18, fbgt_else.31846
	beqi	%a0, 0, bnei_else.31848
	add	%a0, %zero, %zero
	j	fbgt_cont.31847
bnei_else.31848:
	add	%a0, %zero, %k1
bnei_cont.31849:
	j	fbgt_cont.31847
fbgt_else.31846:
fbgt_cont.31847:
	fblt	%f1, %f18, fbgt_else.31850
	fsub	%f1, %f1, %f18
	j	fbgt_cont.31851
fbgt_else.31850:
fbgt_cont.31851:
	fblt	%f1, %f2, fbgt_else.31852
	fsub	%f1, %f18, %f1
	j	fbgt_cont.31853
fbgt_else.31852:
fbgt_cont.31853:
	fblt	%f17, %f1, fbgt_else.31854
	fmul	%f22, %f1, %f1
	fmul	%f21, %f22, %f22
	flw	%f16, 478(%zero)
	fmul	%f16, %f16, %f1
	fmul	%f16, %f16, %f22
	fsub	%f20, %f1, %f16
	flw	%f16, 477(%zero)
	fmul	%f16, %f16, %f1
	fmul	%f16, %f16, %f21
	fadd	%f20, %f20, %f16
	flw	%f16, 476(%zero)
	fmul	%f1, %f16, %f1
	fmul	%f1, %f1, %f22
	fmul	%f1, %f1, %f21
	fsub	%f1, %f20, %f1
	j	fbgt_cont.31855
fbgt_else.31854:
	fsub	%f1, %f2, %f1
	fmul	%f21, %f1, %f1
	fmul	%f20, %f21, %f21
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f16, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f20
	fadd	%f16, %f16, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f21
	fmul	%f1, %f1, %f20
	fsub	%f1, %f16, %f1
fbgt_cont.31855:
	beqi	%a0, 0, bnei_else.31856
	j	bnei_cont.31857
bnei_else.31856:
	fneg	%f1, %f1
bnei_cont.31857:
	flw	%f21, 1(%v1)
	fabs	%f20, %f21
	fdiv	%f16, %f20, %f19
	floor	%f16, %f16
	fmul	%f16, %f16, %f19
	fsub	%f16, %f20, %f16
	fblt	%f16, %f18, fbgt_else.31858
	add	%a0, %zero, %zero
	j	fbgt_cont.31859
fbgt_else.31858:
	add	%a0, %zero, %k1
fbgt_cont.31859:
	fblt	%f16, %f18, fbgt_else.31860
	fsub	%f16, %f16, %f18
	j	fbgt_cont.31861
fbgt_else.31860:
fbgt_cont.31861:
	fblt	%f16, %f2, fbgt_else.31862
	beqi	%a0, 0, bnei_else.31864
	add	%a0, %zero, %zero
	j	fbgt_cont.31863
bnei_else.31864:
	add	%a0, %zero, %k1
bnei_cont.31865:
	j	fbgt_cont.31863
fbgt_else.31862:
fbgt_cont.31863:
	fblt	%f16, %f2, fbgt_else.31866
	fsub	%f16, %f18, %f16
	j	fbgt_cont.31867
fbgt_else.31866:
fbgt_cont.31867:
	fblt	%f17, %f16, fbgt_else.31868
	fmul	%f23, %f16, %f16
	fmul	%f22, %f23, %f23
	flw	%f16, 474(%zero)
	fmul	%f16, %f16, %f23
	fsub	%f20, %f30, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f16, %f22
	fadd	%f20, %f20, %f16
	flw	%f16, 472(%zero)
	fmul	%f16, %f16, %f23
	fmul	%f16, %f16, %f22
	fsub	%f16, %f20, %f16
	j	fbgt_cont.31869
fbgt_else.31868:
	fsub	%f24, %f2, %f16
	fmul	%f23, %f24, %f24
	fmul	%f22, %f23, %f23
	flw	%f16, 478(%zero)
	fmul	%f16, %f16, %f24
	fmul	%f16, %f16, %f23
	fsub	%f20, %f24, %f16
	flw	%f16, 477(%zero)
	fmul	%f16, %f16, %f24
	fmul	%f16, %f16, %f22
	fadd	%f20, %f20, %f16
	flw	%f16, 476(%zero)
	fmul	%f16, %f16, %f24
	fmul	%f16, %f16, %f23
	fmul	%f16, %f16, %f22
	fsub	%f16, %f20, %f16
fbgt_cont.31869:
	beqi	%a0, 0, bnei_else.31870
	j	bnei_cont.31871
bnei_else.31870:
	fneg	%f16, %f16
bnei_cont.31871:
	fblt	%f21, %fzero, fbgt_else.31872
	add	%a0, %zero, %k1
	j	fbgt_cont.31873
fbgt_else.31872:
	add	%a0, %zero, %zero
fbgt_cont.31873:
	fabs	%f21, %f21
	fdiv	%f20, %f21, %f19
	floor	%f20, %f20
	fmul	%f20, %f20, %f19
	fsub	%f20, %f21, %f20
	fblt	%f20, %f18, fbgt_else.31874
	beqi	%a0, 0, bnei_else.31876
	add	%a0, %zero, %zero
	j	fbgt_cont.31875
bnei_else.31876:
	add	%a0, %zero, %k1
bnei_cont.31877:
	j	fbgt_cont.31875
fbgt_else.31874:
fbgt_cont.31875:
	fblt	%f20, %f18, fbgt_else.31878
	fsub	%f20, %f20, %f18
	j	fbgt_cont.31879
fbgt_else.31878:
fbgt_cont.31879:
	fblt	%f20, %f2, fbgt_else.31880
	fsub	%f20, %f18, %f20
	j	fbgt_cont.31881
fbgt_else.31880:
fbgt_cont.31881:
	fblt	%f17, %f20, fbgt_else.31882
	fmul	%f24, %f20, %f20
	fmul	%f23, %f24, %f24
	flw	%f21, 478(%zero)
	fmul	%f21, %f21, %f20
	fmul	%f21, %f21, %f24
	fsub	%f22, %f20, %f21
	flw	%f21, 477(%zero)
	fmul	%f21, %f21, %f20
	fmul	%f21, %f21, %f23
	fadd	%f22, %f22, %f21
	flw	%f21, 476(%zero)
	fmul	%f20, %f21, %f20
	fmul	%f20, %f20, %f24
	fmul	%f20, %f20, %f23
	fsub	%f20, %f22, %f20
	j	fbgt_cont.31883
fbgt_else.31882:
	fsub	%f20, %f2, %f20
	fmul	%f23, %f20, %f20
	fmul	%f22, %f23, %f23
	flw	%f20, 474(%zero)
	fmul	%f20, %f20, %f23
	fsub	%f21, %f30, %f20
	flw	%f20, 473(%zero)
	fmul	%f20, %f20, %f22
	fadd	%f21, %f21, %f20
	flw	%f20, 472(%zero)
	fmul	%f20, %f20, %f23
	fmul	%f20, %f20, %f22
	fsub	%f20, %f21, %f20
fbgt_cont.31883:
	beqi	%a0, 0, bnei_else.31884
	j	bnei_cont.31885
bnei_else.31884:
	fneg	%f20, %f20
bnei_cont.31885:
	flw	%f22, 2(%v1)
	fabs	%f23, %f22
	fdiv	%f21, %f23, %f19
	floor	%f21, %f21
	fmul	%f21, %f21, %f19
	fsub	%f21, %f23, %f21
	fblt	%f21, %f18, fbgt_else.31886
	add	%a0, %zero, %zero
	j	fbgt_cont.31887
fbgt_else.31886:
	add	%a0, %zero, %k1
fbgt_cont.31887:
	fblt	%f21, %f18, fbgt_else.31888
	fsub	%f21, %f21, %f18
	j	fbgt_cont.31889
fbgt_else.31888:
fbgt_cont.31889:
	fblt	%f21, %f2, fbgt_else.31890
	beqi	%a0, 0, bnei_else.31892
	add	%a0, %zero, %zero
	j	fbgt_cont.31891
bnei_else.31892:
	add	%a0, %zero, %k1
bnei_cont.31893:
	j	fbgt_cont.31891
fbgt_else.31890:
fbgt_cont.31891:
	fblt	%f21, %f2, fbgt_else.31894
	fsub	%f21, %f18, %f21
	j	fbgt_cont.31895
fbgt_else.31894:
fbgt_cont.31895:
	fblt	%f17, %f21, fbgt_else.31896
	fmul	%f25, %f21, %f21
	fmul	%f24, %f25, %f25
	flw	%f21, 474(%zero)
	fmul	%f21, %f21, %f25
	fsub	%f23, %f30, %f21
	flw	%f21, 473(%zero)
	fmul	%f21, %f21, %f24
	fadd	%f23, %f23, %f21
	flw	%f21, 472(%zero)
	fmul	%f21, %f21, %f25
	fmul	%f21, %f21, %f24
	fsub	%f21, %f23, %f21
	j	fbgt_cont.31897
fbgt_else.31896:
	fsub	%f26, %f2, %f21
	fmul	%f25, %f26, %f26
	fmul	%f24, %f25, %f25
	flw	%f21, 478(%zero)
	fmul	%f21, %f21, %f26
	fmul	%f21, %f21, %f25
	fsub	%f23, %f26, %f21
	flw	%f21, 477(%zero)
	fmul	%f21, %f21, %f26
	fmul	%f21, %f21, %f24
	fadd	%f23, %f23, %f21
	flw	%f21, 476(%zero)
	fmul	%f21, %f21, %f26
	fmul	%f21, %f21, %f25
	fmul	%f21, %f21, %f24
	fsub	%f21, %f23, %f21
fbgt_cont.31897:
	beqi	%a0, 0, bnei_else.31898
	j	bnei_cont.31899
bnei_else.31898:
	fneg	%f21, %f21
bnei_cont.31899:
	fblt	%f22, %fzero, fbgt_else.31900
	add	%a0, %zero, %k1
	j	fbgt_cont.31901
fbgt_else.31900:
	add	%a0, %zero, %zero
fbgt_cont.31901:
	fabs	%f23, %f22
	fdiv	%f22, %f23, %f19
	floor	%f22, %f22
	fmul	%f19, %f22, %f19
	fsub	%f19, %f23, %f19
	fblt	%f19, %f18, fbgt_else.31902
	beqi	%a0, 0, bnei_else.31904
	add	%a0, %zero, %zero
	j	fbgt_cont.31903
bnei_else.31904:
	add	%a0, %zero, %k1
bnei_cont.31905:
	j	fbgt_cont.31903
fbgt_else.31902:
fbgt_cont.31903:
	fblt	%f19, %f18, fbgt_else.31906
	fsub	%f19, %f19, %f18
	j	fbgt_cont.31907
fbgt_else.31906:
fbgt_cont.31907:
	fblt	%f19, %f2, fbgt_else.31908
	fsub	%f19, %f18, %f19
	j	fbgt_cont.31909
fbgt_else.31908:
fbgt_cont.31909:
	fblt	%f17, %f19, fbgt_else.31910
	fmul	%f22, %f19, %f19
	fmul	%f2, %f22, %f22
	flw	%f17, 478(%zero)
	fmul	%f17, %f17, %f19
	fmul	%f17, %f17, %f22
	fsub	%f18, %f19, %f17
	flw	%f17, 477(%zero)
	fmul	%f17, %f17, %f19
	fmul	%f17, %f17, %f2
	fadd	%f18, %f18, %f17
	flw	%f17, 476(%zero)
	fmul	%f17, %f17, %f19
	fmul	%f17, %f17, %f22
	fmul	%f17, %f17, %f2
	fsub	%f17, %f18, %f17
	j	fbgt_cont.31911
fbgt_else.31910:
	fsub	%f17, %f2, %f19
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
fbgt_cont.31911:
	beqi	%a0, 0, bnei_else.31912
	j	bnei_cont.31913
bnei_else.31912:
	fneg	%f17, %f17
bnei_cont.31913:
	fmul	%f22, %f16, %f21
	fmul	%f26, %f1, %f20
	fmul	%f19, %f26, %f21
	fmul	%f18, %f0, %f17
	fsub	%f2, %f19, %f18
	fmul	%f25, %f0, %f20
	fmul	%f19, %f25, %f21
	fmul	%f18, %f1, %f17
	fadd	%f23, %f19, %f18
	fmul	%f24, %f16, %f17
	fmul	%f19, %f26, %f17
	fmul	%f18, %f0, %f21
	fadd	%f19, %f19, %f18
	fmul	%f18, %f25, %f17
	fmul	%f17, %f1, %f21
	fsub	%f26, %f18, %f17
	fneg	%f25, %f20
	fmul	%f18, %f1, %f16
	fmul	%f21, %f0, %f16
	flw	%f27, 0(%v0)
	flw	%f17, 1(%v0)
	flw	%f16, 2(%v0)
	fmul	%f0, %f22, %f22
	fmul	%f1, %f27, %f0
	fmul	%f0, %f24, %f24
	fmul	%f0, %f17, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f25, %f25
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 0(%v0)
	fmul	%f0, %f2, %f2
	fmul	%f1, %f27, %f0
	fmul	%f0, %f19, %f19
	fmul	%f0, %f17, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 1(%v0)
	fmul	%f0, %f23, %f23
	fmul	%f1, %f27, %f0
	fmul	%f0, %f26, %f26
	fmul	%f0, %f17, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f21, %f21
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%v0)
	flw	%f20, 470(%zero)
	fmul	%f0, %f27, %f2
	fmul	%f1, %f0, %f23
	fmul	%f0, %f17, %f19
	fmul	%f0, %f0, %f26
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18
	fmul	%f0, %f0, %f21
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 0(%v1)
	fmul	%f22, %f27, %f22
	fmul	%f1, %f22, %f23
	fmul	%f17, %f17, %f24
	fmul	%f0, %f17, %f26
	fadd	%f1, %f1, %f0
	fmul	%f16, %f16, %f25
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
	fsw	%f0, 2(%v1)
	jr	%ra
read_nth_object.2770:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.32148
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
	fblt	%f0, %fzero, fbgt_else.32149
	add	%s3, %zero, %zero
	j	fbgt_cont.32150
fbgt_else.32149:
	add	%s3, %zero, %k1
fbgt_cont.32150:
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
	beqi	%k0, 0, bnei_else.32151
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
	j	bnei_cont.32152
bnei_else.32151:
bnei_cont.32152:
	beqi	%a3, 2, bnei_else.32153
	add	%s6, %zero, %s3
	j	bnei_cont.32154
bnei_else.32153:
	add	%s6, %zero, %k1
bnei_cont.32154:
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
	beqi	%a3, 3, bnei_else.32155
	beqi	%a3, 2, bnei_else.32157
	j	bnei_cont.32156
bnei_else.32157:
	beqi	%s3, 0, bnei_else.32159
	add	%a0, %zero, %zero
	j	bnei_cont.32160
bnei_else.32159:
	add	%a0, %zero, %k1
bnei_cont.32160:
	flw	%f18, 0(%s1)
	fmul	%f1, %f18, %f18
	flw	%f17, 1(%s1)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 2(%s1)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.32161
	add	%a2, %zero, %k1
	j	fbeq_cont.32162
fbeq_else.32161:
	add	%a2, %zero, %zero
fbeq_cont.32162:
	beqi	%a2, 0, bnei_else.32163
	fmov	%f0, %f30
	j	bnei_cont.32164
bnei_else.32163:
	beqi	%a0, 0, bnei_else.32165
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.32166
bnei_else.32165:
	fdiv	%f0, %f30, %f1
bnei_cont.32166:
bnei_cont.32164:
	fmul	%f1, %f18, %f0
	fsw	%f1, 0(%s1)
	fmul	%f1, %f17, %f0
	fsw	%f1, 1(%s1)
	fmul	%f0, %f16, %f0
	fsw	%f0, 2(%s1)
bnei_cont.32158:
	j	bnei_cont.32156
bnei_else.32155:
	flw	%f1, 0(%s1)
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
	fbne	%f1, %fzero, fbeq_else.32171
	add	%a0, %zero, %k1
	j	fbeq_cont.32172
fbeq_else.32171:
	add	%a0, %zero, %zero
fbeq_cont.32172:
	beqi	%a0, 0, bnei_else.32173
	fmov	%f0, %fzero
	j	bnei_cont.32174
bnei_else.32173:
	fblt	%fzero, %f1, fbgt_else.32175
	add	%a0, %zero, %zero
	j	fbgt_cont.32176
fbgt_else.32175:
	add	%a0, %zero, %k1
fbgt_cont.32176:
	beqi	%a0, 0, bnei_else.32177
	fmov	%f0, %f30
	j	bnei_cont.32178
bnei_else.32177:
	flw	%f0, 468(%zero)
bnei_cont.32178:
bnei_cont.32174:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32170:
	fsw	%f0, 0(%s1)
	flw	%f1, 1(%s1)
	fbne	%f1, %fzero, fbeq_else.32179
	add	%a0, %zero, %k1
	j	fbeq_cont.32180
fbeq_else.32179:
	add	%a0, %zero, %zero
fbeq_cont.32180:
	beqi	%a0, 0, bnei_else.32181
	fmov	%f0, %fzero
	j	bnei_cont.32182
bnei_else.32181:
	fbne	%f1, %fzero, fbeq_else.32183
	add	%a0, %zero, %k1
	j	fbeq_cont.32184
fbeq_else.32183:
	add	%a0, %zero, %zero
fbeq_cont.32184:
	beqi	%a0, 0, bnei_else.32185
	fmov	%f0, %fzero
	j	bnei_cont.32186
bnei_else.32185:
	fblt	%fzero, %f1, fbgt_else.32187
	add	%a0, %zero, %zero
	j	fbgt_cont.32188
fbgt_else.32187:
	add	%a0, %zero, %k1
fbgt_cont.32188:
	beqi	%a0, 0, bnei_else.32189
	fmov	%f0, %f30
	j	bnei_cont.32190
bnei_else.32189:
	flw	%f0, 468(%zero)
bnei_cont.32190:
bnei_cont.32186:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32182:
	fsw	%f0, 1(%s1)
	flw	%f1, 2(%s1)
	fbne	%f1, %fzero, fbeq_else.32191
	add	%a0, %zero, %k1
	j	fbeq_cont.32192
fbeq_else.32191:
	add	%a0, %zero, %zero
fbeq_cont.32192:
	beqi	%a0, 0, bnei_else.32193
	fmov	%f0, %fzero
	j	bnei_cont.32194
bnei_else.32193:
	fbne	%f1, %fzero, fbeq_else.32195
	add	%a0, %zero, %k1
	j	fbeq_cont.32196
fbeq_else.32195:
	add	%a0, %zero, %zero
fbeq_cont.32196:
	beqi	%a0, 0, bnei_else.32197
	fmov	%f0, %fzero
	j	bnei_cont.32198
bnei_else.32197:
	fblt	%fzero, %f1, fbgt_else.32199
	add	%a0, %zero, %zero
	j	fbgt_cont.32200
fbgt_else.32199:
	add	%a0, %zero, %k1
fbgt_cont.32200:
	beqi	%a0, 0, bnei_else.32201
	fmov	%f0, %f30
	j	bnei_cont.32202
bnei_else.32201:
	flw	%f0, 468(%zero)
bnei_cont.32202:
bnei_cont.32198:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32194:
	fsw	%f0, 2(%s1)
bnei_cont.32156:
	beqi	%k0, 0, bnei_else.32203
	flw	%f16, 0(%s0)
	flw	%f18, 482(%zero)
	fabs	%f1, %f16
	flw	%f19, 481(%zero)
	fdiv	%f0, %f1, %f19
	floor	%f0, %f0
	fmul	%f0, %f0, %f19
	fsub	%f0, %f1, %f0
	fblt	%f0, %f18, fbgt_else.32205
	add	%a0, %zero, %zero
	j	fbgt_cont.32206
fbgt_else.32205:
	add	%a0, %zero, %k1
fbgt_cont.32206:
	fblt	%f0, %f18, fbgt_else.32207
	fsub	%f0, %f0, %f18
	j	fbgt_cont.32208
fbgt_else.32207:
fbgt_cont.32208:
	flw	%f2, 480(%zero)
	fblt	%f0, %f2, fbgt_else.32209
	beqi	%a0, 0, bnei_else.32211
	add	%a0, %zero, %zero
	j	fbgt_cont.32210
bnei_else.32211:
	add	%a0, %zero, %k1
bnei_cont.32212:
	j	fbgt_cont.32210
fbgt_else.32209:
fbgt_cont.32210:
	fblt	%f0, %f2, fbgt_else.32213
	fsub	%f0, %f18, %f0
	j	fbgt_cont.32214
fbgt_else.32213:
fbgt_cont.32214:
	flw	%f17, 479(%zero)
	fblt	%f17, %f0, fbgt_else.32215
	fmul	%f21, %f0, %f0
	fmul	%f20, %f21, %f21
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f21
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f20
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f20
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32216
fbgt_else.32215:
	fsub	%f22, %f2, %f0
	fmul	%f20, %f22, %f22
	fmul	%f21, %f20, %f20
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f20
	fsub	%f1, %f22, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fsub	%f0, %f1, %f0
fbgt_cont.32216:
	beqi	%a0, 0, bnei_else.32217
	j	bnei_cont.32218
bnei_else.32217:
	fneg	%f0, %f0
bnei_cont.32218:
	fblt	%f16, %fzero, fbgt_else.32219
	add	%a0, %zero, %k1
	j	fbgt_cont.32220
fbgt_else.32219:
	add	%a0, %zero, %zero
fbgt_cont.32220:
	fabs	%f16, %f16
	fdiv	%f1, %f16, %f19
	floor	%f1, %f1
	fmul	%f1, %f1, %f19
	fsub	%f1, %f16, %f1
	fblt	%f1, %f18, fbgt_else.32221
	beqi	%a0, 0, bnei_else.32223
	add	%a0, %zero, %zero
	j	fbgt_cont.32222
bnei_else.32223:
	add	%a0, %zero, %k1
bnei_cont.32224:
	j	fbgt_cont.32222
fbgt_else.32221:
fbgt_cont.32222:
	fblt	%f1, %f18, fbgt_else.32225
	fsub	%f1, %f1, %f18
	j	fbgt_cont.32226
fbgt_else.32225:
fbgt_cont.32226:
	fblt	%f1, %f2, fbgt_else.32227
	fsub	%f1, %f18, %f1
	j	fbgt_cont.32228
fbgt_else.32227:
fbgt_cont.32228:
	fblt	%f17, %f1, fbgt_else.32229
	fmul	%f22, %f1, %f1
	fmul	%f21, %f22, %f22
	flw	%f16, 478(%zero)
	fmul	%f16, %f16, %f1
	fmul	%f16, %f16, %f22
	fsub	%f20, %f1, %f16
	flw	%f16, 477(%zero)
	fmul	%f16, %f16, %f1
	fmul	%f16, %f16, %f21
	fadd	%f20, %f20, %f16
	flw	%f16, 476(%zero)
	fmul	%f1, %f16, %f1
	fmul	%f1, %f1, %f22
	fmul	%f1, %f1, %f21
	fsub	%f1, %f20, %f1
	j	fbgt_cont.32230
fbgt_else.32229:
	fsub	%f1, %f2, %f1
	fmul	%f21, %f1, %f1
	fmul	%f20, %f21, %f21
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f16, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f20
	fadd	%f16, %f16, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f21
	fmul	%f1, %f1, %f20
	fsub	%f1, %f16, %f1
fbgt_cont.32230:
	beqi	%a0, 0, bnei_else.32231
	j	bnei_cont.32232
bnei_else.32231:
	fneg	%f1, %f1
bnei_cont.32232:
	flw	%f21, 1(%s0)
	fabs	%f20, %f21
	fdiv	%f16, %f20, %f19
	floor	%f16, %f16
	fmul	%f16, %f16, %f19
	fsub	%f16, %f20, %f16
	fblt	%f16, %f18, fbgt_else.32233
	add	%a0, %zero, %zero
	j	fbgt_cont.32234
fbgt_else.32233:
	add	%a0, %zero, %k1
fbgt_cont.32234:
	fblt	%f16, %f18, fbgt_else.32235
	fsub	%f16, %f16, %f18
	j	fbgt_cont.32236
fbgt_else.32235:
fbgt_cont.32236:
	fblt	%f16, %f2, fbgt_else.32237
	beqi	%a0, 0, bnei_else.32239
	add	%a0, %zero, %zero
	j	fbgt_cont.32238
bnei_else.32239:
	add	%a0, %zero, %k1
bnei_cont.32240:
	j	fbgt_cont.32238
fbgt_else.32237:
fbgt_cont.32238:
	fblt	%f16, %f2, fbgt_else.32241
	fsub	%f16, %f18, %f16
	j	fbgt_cont.32242
fbgt_else.32241:
fbgt_cont.32242:
	fblt	%f17, %f16, fbgt_else.32243
	fmul	%f23, %f16, %f16
	fmul	%f22, %f23, %f23
	flw	%f16, 474(%zero)
	fmul	%f16, %f16, %f23
	fsub	%f20, %f30, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f16, %f22
	fadd	%f20, %f20, %f16
	flw	%f16, 472(%zero)
	fmul	%f16, %f16, %f23
	fmul	%f16, %f16, %f22
	fsub	%f16, %f20, %f16
	j	fbgt_cont.32244
fbgt_else.32243:
	fsub	%f24, %f2, %f16
	fmul	%f23, %f24, %f24
	fmul	%f22, %f23, %f23
	flw	%f16, 478(%zero)
	fmul	%f16, %f16, %f24
	fmul	%f16, %f16, %f23
	fsub	%f20, %f24, %f16
	flw	%f16, 477(%zero)
	fmul	%f16, %f16, %f24
	fmul	%f16, %f16, %f22
	fadd	%f20, %f20, %f16
	flw	%f16, 476(%zero)
	fmul	%f16, %f16, %f24
	fmul	%f16, %f16, %f23
	fmul	%f16, %f16, %f22
	fsub	%f16, %f20, %f16
fbgt_cont.32244:
	beqi	%a0, 0, bnei_else.32245
	j	bnei_cont.32246
bnei_else.32245:
	fneg	%f16, %f16
bnei_cont.32246:
	fblt	%f21, %fzero, fbgt_else.32247
	add	%a0, %zero, %k1
	j	fbgt_cont.32248
fbgt_else.32247:
	add	%a0, %zero, %zero
fbgt_cont.32248:
	fabs	%f21, %f21
	fdiv	%f20, %f21, %f19
	floor	%f20, %f20
	fmul	%f20, %f20, %f19
	fsub	%f20, %f21, %f20
	fblt	%f20, %f18, fbgt_else.32249
	beqi	%a0, 0, bnei_else.32251
	add	%a0, %zero, %zero
	j	fbgt_cont.32250
bnei_else.32251:
	add	%a0, %zero, %k1
bnei_cont.32252:
	j	fbgt_cont.32250
fbgt_else.32249:
fbgt_cont.32250:
	fblt	%f20, %f18, fbgt_else.32253
	fsub	%f20, %f20, %f18
	j	fbgt_cont.32254
fbgt_else.32253:
fbgt_cont.32254:
	fblt	%f20, %f2, fbgt_else.32255
	fsub	%f20, %f18, %f20
	j	fbgt_cont.32256
fbgt_else.32255:
fbgt_cont.32256:
	fblt	%f17, %f20, fbgt_else.32257
	fmul	%f24, %f20, %f20
	fmul	%f23, %f24, %f24
	flw	%f21, 478(%zero)
	fmul	%f21, %f21, %f20
	fmul	%f21, %f21, %f24
	fsub	%f22, %f20, %f21
	flw	%f21, 477(%zero)
	fmul	%f21, %f21, %f20
	fmul	%f21, %f21, %f23
	fadd	%f22, %f22, %f21
	flw	%f21, 476(%zero)
	fmul	%f20, %f21, %f20
	fmul	%f20, %f20, %f24
	fmul	%f20, %f20, %f23
	fsub	%f20, %f22, %f20
	j	fbgt_cont.32258
fbgt_else.32257:
	fsub	%f20, %f2, %f20
	fmul	%f23, %f20, %f20
	fmul	%f22, %f23, %f23
	flw	%f20, 474(%zero)
	fmul	%f20, %f20, %f23
	fsub	%f21, %f30, %f20
	flw	%f20, 473(%zero)
	fmul	%f20, %f20, %f22
	fadd	%f21, %f21, %f20
	flw	%f20, 472(%zero)
	fmul	%f20, %f20, %f23
	fmul	%f20, %f20, %f22
	fsub	%f20, %f21, %f20
fbgt_cont.32258:
	beqi	%a0, 0, bnei_else.32259
	j	bnei_cont.32260
bnei_else.32259:
	fneg	%f20, %f20
bnei_cont.32260:
	flw	%f22, 2(%s0)
	fabs	%f23, %f22
	fdiv	%f21, %f23, %f19
	floor	%f21, %f21
	fmul	%f21, %f21, %f19
	fsub	%f21, %f23, %f21
	fblt	%f21, %f18, fbgt_else.32261
	add	%a0, %zero, %zero
	j	fbgt_cont.32262
fbgt_else.32261:
	add	%a0, %zero, %k1
fbgt_cont.32262:
	fblt	%f21, %f18, fbgt_else.32263
	fsub	%f21, %f21, %f18
	j	fbgt_cont.32264
fbgt_else.32263:
fbgt_cont.32264:
	fblt	%f21, %f2, fbgt_else.32265
	beqi	%a0, 0, bnei_else.32267
	add	%a0, %zero, %zero
	j	fbgt_cont.32266
bnei_else.32267:
	add	%a0, %zero, %k1
bnei_cont.32268:
	j	fbgt_cont.32266
fbgt_else.32265:
fbgt_cont.32266:
	fblt	%f21, %f2, fbgt_else.32269
	fsub	%f21, %f18, %f21
	j	fbgt_cont.32270
fbgt_else.32269:
fbgt_cont.32270:
	fblt	%f17, %f21, fbgt_else.32271
	fmul	%f25, %f21, %f21
	fmul	%f24, %f25, %f25
	flw	%f21, 474(%zero)
	fmul	%f21, %f21, %f25
	fsub	%f23, %f30, %f21
	flw	%f21, 473(%zero)
	fmul	%f21, %f21, %f24
	fadd	%f23, %f23, %f21
	flw	%f21, 472(%zero)
	fmul	%f21, %f21, %f25
	fmul	%f21, %f21, %f24
	fsub	%f21, %f23, %f21
	j	fbgt_cont.32272
fbgt_else.32271:
	fsub	%f26, %f2, %f21
	fmul	%f25, %f26, %f26
	fmul	%f24, %f25, %f25
	flw	%f21, 478(%zero)
	fmul	%f21, %f21, %f26
	fmul	%f21, %f21, %f25
	fsub	%f23, %f26, %f21
	flw	%f21, 477(%zero)
	fmul	%f21, %f21, %f26
	fmul	%f21, %f21, %f24
	fadd	%f23, %f23, %f21
	flw	%f21, 476(%zero)
	fmul	%f21, %f21, %f26
	fmul	%f21, %f21, %f25
	fmul	%f21, %f21, %f24
	fsub	%f21, %f23, %f21
fbgt_cont.32272:
	beqi	%a0, 0, bnei_else.32273
	j	bnei_cont.32274
bnei_else.32273:
	fneg	%f21, %f21
bnei_cont.32274:
	fblt	%f22, %fzero, fbgt_else.32275
	add	%a0, %zero, %k1
	j	fbgt_cont.32276
fbgt_else.32275:
	add	%a0, %zero, %zero
fbgt_cont.32276:
	fabs	%f23, %f22
	fdiv	%f22, %f23, %f19
	floor	%f22, %f22
	fmul	%f19, %f22, %f19
	fsub	%f19, %f23, %f19
	fblt	%f19, %f18, fbgt_else.32277
	beqi	%a0, 0, bnei_else.32279
	add	%a0, %zero, %zero
	j	fbgt_cont.32278
bnei_else.32279:
	add	%a0, %zero, %k1
bnei_cont.32280:
	j	fbgt_cont.32278
fbgt_else.32277:
fbgt_cont.32278:
	fblt	%f19, %f18, fbgt_else.32281
	fsub	%f19, %f19, %f18
	j	fbgt_cont.32282
fbgt_else.32281:
fbgt_cont.32282:
	fblt	%f19, %f2, fbgt_else.32283
	fsub	%f19, %f18, %f19
	j	fbgt_cont.32284
fbgt_else.32283:
fbgt_cont.32284:
	fblt	%f17, %f19, fbgt_else.32285
	fmul	%f22, %f19, %f19
	fmul	%f2, %f22, %f22
	flw	%f17, 478(%zero)
	fmul	%f17, %f17, %f19
	fmul	%f17, %f17, %f22
	fsub	%f18, %f19, %f17
	flw	%f17, 477(%zero)
	fmul	%f17, %f17, %f19
	fmul	%f17, %f17, %f2
	fadd	%f18, %f18, %f17
	flw	%f17, 476(%zero)
	fmul	%f17, %f17, %f19
	fmul	%f17, %f17, %f22
	fmul	%f17, %f17, %f2
	fsub	%f17, %f18, %f17
	j	fbgt_cont.32286
fbgt_else.32285:
	fsub	%f17, %f2, %f19
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
fbgt_cont.32286:
	beqi	%a0, 0, bnei_else.32287
	j	bnei_cont.32288
bnei_else.32287:
	fneg	%f17, %f17
bnei_cont.32288:
	fmul	%f22, %f16, %f21
	fmul	%f26, %f1, %f20
	fmul	%f19, %f26, %f21
	fmul	%f18, %f0, %f17
	fsub	%f2, %f19, %f18
	fmul	%f25, %f0, %f20
	fmul	%f19, %f25, %f21
	fmul	%f18, %f1, %f17
	fadd	%f23, %f19, %f18
	fmul	%f24, %f16, %f17
	fmul	%f19, %f26, %f17
	fmul	%f18, %f0, %f21
	fadd	%f19, %f19, %f18
	fmul	%f18, %f25, %f17
	fmul	%f17, %f1, %f21
	fsub	%f26, %f18, %f17
	fneg	%f25, %f20
	fmul	%f18, %f1, %f16
	fmul	%f21, %f0, %f16
	flw	%f27, 0(%s1)
	flw	%f17, 1(%s1)
	flw	%f16, 2(%s1)
	fmul	%f0, %f22, %f22
	fmul	%f1, %f27, %f0
	fmul	%f0, %f24, %f24
	fmul	%f0, %f17, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f25, %f25
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 0(%s1)
	fmul	%f0, %f2, %f2
	fmul	%f1, %f27, %f0
	fmul	%f0, %f19, %f19
	fmul	%f0, %f17, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 1(%s1)
	fmul	%f0, %f23, %f23
	fmul	%f1, %f27, %f0
	fmul	%f0, %f26, %f26
	fmul	%f0, %f17, %f0
	fadd	%f1, %f1, %f0
	fmul	%f0, %f21, %f21
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%s1)
	flw	%f20, 470(%zero)
	fmul	%f0, %f27, %f2
	fmul	%f1, %f0, %f23
	fmul	%f0, %f17, %f19
	fmul	%f0, %f0, %f26
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18
	fmul	%f0, %f0, %f21
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 0(%s0)
	fmul	%f22, %f27, %f22
	fmul	%f1, %f22, %f23
	fmul	%f17, %f17, %f24
	fmul	%f0, %f17, %f26
	fadd	%f1, %f1, %f0
	fmul	%f16, %f16, %f25
	fmul	%f0, %f16, %f21
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 1(%s0)
	fmul	%f1, %f22, %f2
	fmul	%f0, %f17, %f19
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 2(%s0)
	j	bnei_cont.32204
bnei_else.32203:
bnei_cont.32204:
	add	%ra, %zero, %a1
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.32148:
	add	%ra, %zero, %a1
	add	%v0, %zero, %zero
	jr	%ra
read_object.2772:
	add	%a1, %zero, %v0
	add	%s7, %zero, %ra
	blti	%a1, 60, bgti_else.32412
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.32412:
	jal	min_caml_read_int
	addi	%a0, %v0, 0
	beqi	%a0, -1, bnei_else.32414
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
	fblt	%f0, %fzero, fbgt_else.32416
	add	%s2, %zero, %zero
	j	fbgt_cont.32417
fbgt_else.32416:
	add	%s2, %zero, %k1
fbgt_cont.32417:
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
	beqi	%fp, 0, bnei_else.32418
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
	j	bnei_cont.32419
bnei_else.32418:
bnei_cont.32419:
	beqi	%a2, 2, bnei_else.32420
	add	%s5, %zero, %s2
	j	bnei_cont.32421
bnei_else.32420:
	add	%s5, %zero, %k1
bnei_cont.32421:
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
	beqi	%a2, 3, bnei_else.32422
	beqi	%a2, 2, bnei_else.32424
	j	bnei_cont.32423
bnei_else.32424:
	beqi	%s2, 0, bnei_else.32426
	add	%a0, %zero, %zero
	j	bnei_cont.32427
bnei_else.32426:
	add	%a0, %zero, %k1
bnei_cont.32427:
	flw	%f18, 0(%s0)
	fmul	%f1, %f18, %f18
	flw	%f17, 1(%s0)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 2(%s0)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.32428
	add	%a2, %zero, %k1
	j	fbeq_cont.32429
fbeq_else.32428:
	add	%a2, %zero, %zero
fbeq_cont.32429:
	beqi	%a2, 0, bnei_else.32430
	fmov	%f0, %f30
	j	bnei_cont.32431
bnei_else.32430:
	beqi	%a0, 0, bnei_else.32432
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.32433
bnei_else.32432:
	fdiv	%f0, %f30, %f1
bnei_cont.32433:
bnei_cont.32431:
	fmul	%f1, %f18, %f0
	fsw	%f1, 0(%s0)
	fmul	%f1, %f17, %f0
	fsw	%f1, 1(%s0)
	fmul	%f0, %f16, %f0
	fsw	%f0, 2(%s0)
bnei_cont.32425:
	j	bnei_cont.32423
bnei_else.32422:
	flw	%f1, 0(%s0)
	fbne	%f1, %fzero, fbeq_else.32434
	add	%a0, %zero, %k1
	j	fbeq_cont.32435
fbeq_else.32434:
	add	%a0, %zero, %zero
fbeq_cont.32435:
	beqi	%a0, 0, bnei_else.32436
	fmov	%f0, %fzero
	j	bnei_cont.32437
bnei_else.32436:
	fbne	%f1, %fzero, fbeq_else.32438
	add	%a0, %zero, %k1
	j	fbeq_cont.32439
fbeq_else.32438:
	add	%a0, %zero, %zero
fbeq_cont.32439:
	beqi	%a0, 0, bnei_else.32440
	fmov	%f0, %fzero
	j	bnei_cont.32441
bnei_else.32440:
	fblt	%fzero, %f1, fbgt_else.32442
	add	%a0, %zero, %zero
	j	fbgt_cont.32443
fbgt_else.32442:
	add	%a0, %zero, %k1
fbgt_cont.32443:
	beqi	%a0, 0, bnei_else.32444
	fmov	%f0, %f30
	j	bnei_cont.32445
bnei_else.32444:
	flw	%f0, 468(%zero)
bnei_cont.32445:
bnei_cont.32441:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32437:
	fsw	%f0, 0(%s0)
	flw	%f1, 1(%s0)
	fbne	%f1, %fzero, fbeq_else.32446
	add	%a0, %zero, %k1
	j	fbeq_cont.32447
fbeq_else.32446:
	add	%a0, %zero, %zero
fbeq_cont.32447:
	beqi	%a0, 0, bnei_else.32448
	fmov	%f0, %fzero
	j	bnei_cont.32449
bnei_else.32448:
	fbne	%f1, %fzero, fbeq_else.32450
	add	%a0, %zero, %k1
	j	fbeq_cont.32451
fbeq_else.32450:
	add	%a0, %zero, %zero
fbeq_cont.32451:
	beqi	%a0, 0, bnei_else.32452
	fmov	%f0, %fzero
	j	bnei_cont.32453
bnei_else.32452:
	fblt	%fzero, %f1, fbgt_else.32454
	add	%a0, %zero, %zero
	j	fbgt_cont.32455
fbgt_else.32454:
	add	%a0, %zero, %k1
fbgt_cont.32455:
	beqi	%a0, 0, bnei_else.32456
	fmov	%f0, %f30
	j	bnei_cont.32457
bnei_else.32456:
	flw	%f0, 468(%zero)
bnei_cont.32457:
bnei_cont.32453:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32449:
	fsw	%f0, 1(%s0)
	flw	%f1, 2(%s0)
	fbne	%f1, %fzero, fbeq_else.32458
	add	%a0, %zero, %k1
	j	fbeq_cont.32459
fbeq_else.32458:
	add	%a0, %zero, %zero
fbeq_cont.32459:
	beqi	%a0, 0, bnei_else.32460
	fmov	%f0, %fzero
	j	bnei_cont.32461
bnei_else.32460:
	fbne	%f1, %fzero, fbeq_else.32462
	add	%a0, %zero, %k1
	j	fbeq_cont.32463
fbeq_else.32462:
	add	%a0, %zero, %zero
fbeq_cont.32463:
	beqi	%a0, 0, bnei_else.32464
	fmov	%f0, %fzero
	j	bnei_cont.32465
bnei_else.32464:
	fblt	%fzero, %f1, fbgt_else.32466
	add	%a0, %zero, %zero
	j	fbgt_cont.32467
fbgt_else.32466:
	add	%a0, %zero, %k1
fbgt_cont.32467:
	beqi	%a0, 0, bnei_else.32468
	fmov	%f0, %f30
	j	bnei_cont.32469
bnei_else.32468:
	flw	%f0, 468(%zero)
bnei_cont.32469:
bnei_cont.32465:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.32461:
	fsw	%f0, 2(%s0)
bnei_cont.32423:
	beqi	%fp, 0, bnei_else.32470
	addi	%v1, %k0, 0
	addi	%v0, %s0, 0
	jal	rotate_quadratic_matrix.2767
	j	bnei_cont.32471
bnei_else.32470:
bnei_cont.32471:
	add	%a0, %zero, %k1
	j	bnei_cont.32415
bnei_else.32414:
	add	%a0, %zero, %zero
bnei_cont.32415:
	beqi	%a0, 0, bnei_else.32472
	addi	%t7, %a1, 1
	blti	%t7, 60, bgti_else.32473
	add	%ra, %zero, %s7
	jr	%ra
bgti_else.32473:
	addi	%v0, %t7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.32475
	addi	%v0, %t7, 1
	add	%ra, %zero, %s7
	j	read_object.2772
bnei_else.32475:
	add	%ra, %zero, %s7
	sw	%t7, 0(%zero)
	jr	%ra
bnei_else.32472:
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
	beqi	%t0, -1, bnei_else.32550
	lw	%a1, 0(%sp)
	addi	%t1, %a1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t2, %v0, 0
	beqi	%t2, -1, bnei_else.32551
	addi	%t3, %t1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t4, %v0, 0
	beqi	%t4, -1, bnei_else.32553
	addi	%t5, %t3, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t6, %v0, 0
	beqi	%t6, -1, bnei_else.32555
	addi	%v0, %t5, 1
	addi	%sp, %sp, 9
	jal	read_net_item.2776
	addi	%sp, %sp, -9
	add	%at, %v0, %t5
	sw	%t6, 0(%at)
	j	bnei_cont.32556
bnei_else.32555:
	addi	%v0, %t5, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.32556:
	add	%at, %v0, %t3
	sw	%t4, 0(%at)
	j	bnei_cont.32554
bnei_else.32553:
	addi	%v0, %t3, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.32554:
	add	%at, %v0, %t1
	sw	%t2, 0(%at)
	j	bnei_cont.32552
bnei_else.32551:
	addi	%v0, %t1, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.32552:
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
bnei_else.32550:
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
	beqi	%a2, -1, bnei_else.32634
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0
	beqi	%fp, -1, bnei_else.32636
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.32638
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	read_net_item.2776
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	sw	%k0, 2(%v1)
	j	bnei_cont.32639
bnei_else.32638:
	addi	%v0, %zero, 3
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.32639:
	sw	%fp, 1(%v1)
	j	bnei_cont.32637
bnei_else.32636:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.32637:
	sw	%a2, 0(%v1)
	j	bnei_cont.32635
bnei_else.32634:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.32635:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.32640
	lw	%a0, 0(%sp)
	addi	%t0, %a0, 1
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.32641
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%fp, %v0, 0
	beqi	%fp, -1, bnei_else.32643
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5
	jal	read_net_item.2776
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	sw	%fp, 1(%t1)
	j	bnei_cont.32644
bnei_else.32643:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.32644:
	sw	%a2, 0(%t1)
	j	bnei_cont.32642
bnei_else.32641:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.32642:
	lw	%a0, 0(%t1)
	beqi	%a0, -1, bnei_else.32645
	addi	%v0, %t0, 1
	addi	%sp, %sp, 5
	jal	read_or_network.2778
	addi	%sp, %sp, -5
	add	%at, %v0, %t0
	sw	%t1, 0(%at)
	j	bnei_cont.32646
bnei_else.32645:
	addi	%v0, %t0, 1
	addi	%v1, %t1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
bnei_cont.32646:
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%a1, 0(%at)
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.32640:
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
	beqi	%fp, -1, bnei_else.32701
	jal	min_caml_read_int
	addi	%s0, %v0, 0
	beqi	%s0, -1, bnei_else.32703
	jal	min_caml_read_int
	addi	%s1, %v0, 0
	beqi	%s1, -1, bnei_else.32705
	addi	%v0, %zero, 3
	jal	read_net_item.2776
	sw	%s1, 2(%v0)
	j	bnei_cont.32706
bnei_else.32705:
	addi	%v0, %zero, 3
	addi	%v1, %k0, 0
	jal	min_caml_create_array
bnei_cont.32706:
	sw	%s0, 1(%v0)
	j	bnei_cont.32704
bnei_else.32703:
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0
	jal	min_caml_create_array
bnei_cont.32704:
	sw	%fp, 0(%v0)
	j	bnei_cont.32702
bnei_else.32701:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.32702:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.32707
	sw	%v0, 83(%a2)
	addi	%s0, %a2, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.32708
	jal	min_caml_read_int
	addi	%fp, %v0, 0
	beqi	%fp, -1, bnei_else.32710
	addi	%v0, %zero, 2
	jal	read_net_item.2776
	sw	%fp, 1(%v0)
	j	bnei_cont.32711
bnei_else.32710:
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0
	jal	min_caml_create_array
bnei_cont.32711:
	sw	%a2, 0(%v0)
	j	bnei_cont.32709
bnei_else.32708:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.32709:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.32712
	sw	%v0, 83(%s0)
	addi	%fp, %s0, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.32713
	addi	%v0, %k1, 0
	jal	read_net_item.2776
	sw	%a2, 0(%v0)
	j	bnei_cont.32714
bnei_else.32713:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.32714:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.32715
	sw	%v0, 83(%fp)
	addi	%a2, %fp, 1
	addi	%v0, %zero, 0
	jal	read_net_item.2776
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.32716
	sw	%v0, 83(%a2)
	addi	%v0, %a2, 1
	add	%ra, %zero, %a3
	j	read_and_network.2780
bnei_else.32716:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.32715:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.32712:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.32707:
	add	%ra, %zero, %a3
	jr	%ra
iter_setup_dirvec_constants.2877:
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1
	add	%a2, %zero, %ra
	blti	%a1, 0, bgti_else.32905
	lw	%a3, 12(%a1)
	lw	%k0, 1(%a0)
	lw	%fp, 0(%a0)
	lw	%s2, 9(%a3)
	lw	%s1, 6(%a3)
	lw	%s0, 4(%a3)
	lw	%s3, 3(%a3)
	lw	%a3, 1(%a3)
	beqi	%a3, 1, bnei_else.32906
	beqi	%a3, 2, bnei_else.32908
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f20, 0(%fp)
	flw	%f19, 1(%fp)
	flw	%f24, 2(%fp)
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
	beqi	%s3, 0, bnei_else.32910
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s2)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.32911
bnei_else.32910:
bnei_cont.32911:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s3, 0, bnei_else.32912
	flw	%f22, 1(%s2)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s2)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 474(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s2)
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
	j	bnei_cont.32913
bnei_else.32912:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.32913:
	fbne	%f0, %fzero, fbeq_else.32914
	add	%a3, %zero, %k1
	j	fbeq_cont.32915
fbeq_else.32914:
	add	%a3, %zero, %zero
fbeq_cont.32915:
	beqi	%a3, 0, bnei_else.32916
	j	bnei_cont.32917
bnei_else.32916:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.32917:
	add	%at, %k0, %a1
	sw	%v0, 0(%at)
	j	bnei_cont.32907
bnei_else.32908:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%fp)
	flw	%f18, 0(%s0)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%fp)
	flw	%f17, 1(%s0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%fp)
	flw	%f16, 2(%s0)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.32918
	add	%a3, %zero, %zero
	j	fbgt_cont.32919
fbgt_else.32918:
	add	%a3, %zero, %k1
fbgt_cont.32919:
	beqi	%a3, 0, bnei_else.32920
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
	j	bnei_cont.32921
bnei_else.32920:
	fsw	%fzero, 0(%v0)
bnei_cont.32921:
	add	%at, %k0, %a1
	sw	%v0, 0(%at)
bnei_cont.32909:
	j	bnei_cont.32907
bnei_else.32906:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%fp)
	fbne	%f1, %fzero, fbeq_else.32922
	add	%a3, %zero, %k1
	j	fbeq_cont.32923
fbeq_else.32922:
	add	%a3, %zero, %zero
fbeq_cont.32923:
	beqi	%a3, 0, bnei_else.32924
	fsw	%fzero, 1(%v0)
	j	bnei_cont.32925
bnei_else.32924:
	fblt	%f1, %fzero, fbgt_else.32926
	add	%a3, %zero, %zero
	j	fbgt_cont.32927
fbgt_else.32926:
	add	%a3, %zero, %k1
fbgt_cont.32927:
	beqi	%s1, 0, bnei_else.32928
	beqi	%a3, 0, bnei_else.32930
	add	%a3, %zero, %zero
	j	bnei_cont.32929
bnei_else.32930:
	add	%a3, %zero, %k1
bnei_cont.32931:
	j	bnei_cont.32929
bnei_else.32928:
bnei_cont.32929:
	flw	%f0, 0(%s0)
	beqi	%a3, 0, bnei_else.32932
	j	bnei_cont.32933
bnei_else.32932:
	fneg	%f0, %f0
bnei_cont.32933:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.32925:
	flw	%f1, 1(%fp)
	fbne	%f1, %fzero, fbeq_else.32934
	add	%a3, %zero, %k1
	j	fbeq_cont.32935
fbeq_else.32934:
	add	%a3, %zero, %zero
fbeq_cont.32935:
	beqi	%a3, 0, bnei_else.32936
	fsw	%fzero, 3(%v0)
	j	bnei_cont.32937
bnei_else.32936:
	fblt	%f1, %fzero, fbgt_else.32938
	add	%a3, %zero, %zero
	j	fbgt_cont.32939
fbgt_else.32938:
	add	%a3, %zero, %k1
fbgt_cont.32939:
	beqi	%s1, 0, bnei_else.32940
	beqi	%a3, 0, bnei_else.32942
	add	%a3, %zero, %zero
	j	bnei_cont.32941
bnei_else.32942:
	add	%a3, %zero, %k1
bnei_cont.32943:
	j	bnei_cont.32941
bnei_else.32940:
bnei_cont.32941:
	flw	%f0, 1(%s0)
	beqi	%a3, 0, bnei_else.32944
	j	bnei_cont.32945
bnei_else.32944:
	fneg	%f0, %f0
bnei_cont.32945:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.32937:
	flw	%f1, 2(%fp)
	fbne	%f1, %fzero, fbeq_else.32946
	add	%a3, %zero, %k1
	j	fbeq_cont.32947
fbeq_else.32946:
	add	%a3, %zero, %zero
fbeq_cont.32947:
	beqi	%a3, 0, bnei_else.32948
	fsw	%fzero, 5(%v0)
	j	bnei_cont.32949
bnei_else.32948:
	fblt	%f1, %fzero, fbgt_else.32950
	add	%a3, %zero, %zero
	j	fbgt_cont.32951
fbgt_else.32950:
	add	%a3, %zero, %k1
fbgt_cont.32951:
	beqi	%s1, 0, bnei_else.32952
	beqi	%a3, 0, bnei_else.32954
	add	%a3, %zero, %zero
	j	bnei_cont.32953
bnei_else.32954:
	add	%a3, %zero, %k1
bnei_cont.32955:
	j	bnei_cont.32953
bnei_else.32952:
bnei_cont.32953:
	flw	%f0, 2(%s0)
	beqi	%a3, 0, bnei_else.32956
	j	bnei_cont.32957
bnei_else.32956:
	fneg	%f0, %f0
bnei_cont.32957:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.32949:
	add	%at, %k0, %a1
	sw	%v0, 0(%at)
bnei_cont.32907:
	addi	%a3, %a1, -1
	blti	%a3, 0, bgti_else.32958
	lw	%a1, 12(%a3)
	lw	%s2, 9(%a1)
	lw	%s1, 6(%a1)
	lw	%s0, 4(%a1)
	lw	%s3, 3(%a1)
	lw	%a1, 1(%a1)
	beqi	%a1, 1, bnei_else.32959
	beqi	%a1, 2, bnei_else.32961
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f20, 0(%fp)
	flw	%f19, 1(%fp)
	flw	%f24, 2(%fp)
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
	beqi	%s3, 0, bnei_else.32963
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s2)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.32964
bnei_else.32963:
bnei_cont.32964:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s3, 0, bnei_else.32965
	flw	%f22, 1(%s2)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s2)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 474(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s2)
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
	j	bnei_cont.32966
bnei_else.32965:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.32966:
	fbne	%f0, %fzero, fbeq_else.32967
	add	%a1, %zero, %k1
	j	fbeq_cont.32968
fbeq_else.32967:
	add	%a1, %zero, %zero
fbeq_cont.32968:
	beqi	%a1, 0, bnei_else.32969
	j	bnei_cont.32970
bnei_else.32969:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.32970:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.32960
bnei_else.32961:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%fp)
	flw	%f18, 0(%s0)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%fp)
	flw	%f17, 1(%s0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%fp)
	flw	%f16, 2(%s0)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.32971
	add	%a1, %zero, %zero
	j	fbgt_cont.32972
fbgt_else.32971:
	add	%a1, %zero, %k1
fbgt_cont.32972:
	beqi	%a1, 0, bnei_else.32973
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
	j	bnei_cont.32974
bnei_else.32973:
	fsw	%fzero, 0(%v0)
bnei_cont.32974:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
bnei_cont.32962:
	j	bnei_cont.32960
bnei_else.32959:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%fp)
	fbne	%f1, %fzero, fbeq_else.32975
	add	%a1, %zero, %k1
	j	fbeq_cont.32976
fbeq_else.32975:
	add	%a1, %zero, %zero
fbeq_cont.32976:
	beqi	%a1, 0, bnei_else.32977
	fsw	%fzero, 1(%v0)
	j	bnei_cont.32978
bnei_else.32977:
	fblt	%f1, %fzero, fbgt_else.32979
	add	%a1, %zero, %zero
	j	fbgt_cont.32980
fbgt_else.32979:
	add	%a1, %zero, %k1
fbgt_cont.32980:
	beqi	%s1, 0, bnei_else.32981
	beqi	%a1, 0, bnei_else.32983
	add	%a1, %zero, %zero
	j	bnei_cont.32982
bnei_else.32983:
	add	%a1, %zero, %k1
bnei_cont.32984:
	j	bnei_cont.32982
bnei_else.32981:
bnei_cont.32982:
	flw	%f0, 0(%s0)
	beqi	%a1, 0, bnei_else.32985
	j	bnei_cont.32986
bnei_else.32985:
	fneg	%f0, %f0
bnei_cont.32986:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.32978:
	flw	%f1, 1(%fp)
	fbne	%f1, %fzero, fbeq_else.32987
	add	%a1, %zero, %k1
	j	fbeq_cont.32988
fbeq_else.32987:
	add	%a1, %zero, %zero
fbeq_cont.32988:
	beqi	%a1, 0, bnei_else.32989
	fsw	%fzero, 3(%v0)
	j	bnei_cont.32990
bnei_else.32989:
	fblt	%f1, %fzero, fbgt_else.32991
	add	%a1, %zero, %zero
	j	fbgt_cont.32992
fbgt_else.32991:
	add	%a1, %zero, %k1
fbgt_cont.32992:
	beqi	%s1, 0, bnei_else.32993
	beqi	%a1, 0, bnei_else.32995
	add	%a1, %zero, %zero
	j	bnei_cont.32994
bnei_else.32995:
	add	%a1, %zero, %k1
bnei_cont.32996:
	j	bnei_cont.32994
bnei_else.32993:
bnei_cont.32994:
	flw	%f0, 1(%s0)
	beqi	%a1, 0, bnei_else.32997
	j	bnei_cont.32998
bnei_else.32997:
	fneg	%f0, %f0
bnei_cont.32998:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.32990:
	flw	%f1, 2(%fp)
	fbne	%f1, %fzero, fbeq_else.32999
	add	%a1, %zero, %k1
	j	fbeq_cont.33000
fbeq_else.32999:
	add	%a1, %zero, %zero
fbeq_cont.33000:
	beqi	%a1, 0, bnei_else.33001
	fsw	%fzero, 5(%v0)
	j	bnei_cont.33002
bnei_else.33001:
	fblt	%f1, %fzero, fbgt_else.33003
	add	%a1, %zero, %zero
	j	fbgt_cont.33004
fbgt_else.33003:
	add	%a1, %zero, %k1
fbgt_cont.33004:
	beqi	%s1, 0, bnei_else.33005
	beqi	%a1, 0, bnei_else.33007
	add	%a1, %zero, %zero
	j	bnei_cont.33006
bnei_else.33007:
	add	%a1, %zero, %k1
bnei_cont.33008:
	j	bnei_cont.33006
bnei_else.33005:
bnei_cont.33006:
	flw	%f0, 2(%s0)
	beqi	%a1, 0, bnei_else.33009
	j	bnei_cont.33010
bnei_else.33009:
	fneg	%f0, %f0
bnei_cont.33010:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.33002:
	add	%at, %k0, %a3
	sw	%v0, 0(%at)
bnei_cont.32960:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a2
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877
bgti_else.32958:
	add	%ra, %zero, %a2
	jr	%ra
bgti_else.32905:
	add	%ra, %zero, %a2
	jr	%ra
setup_dirvec_constants.2880:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	lw	%a2, 0(%zero)
	addi	%a3, %a2, -1
	blti	%a3, 0, bgti_else.33115
	lw	%a2, 12(%a3)
	lw	%fp, 1(%a0)
	lw	%s0, 0(%a0)
	lw	%s2, 9(%a2)
	lw	%s1, 6(%a2)
	lw	%k0, 4(%a2)
	lw	%s3, 3(%a2)
	lw	%a2, 1(%a2)
	beqi	%a2, 1, bnei_else.33116
	beqi	%a2, 2, bnei_else.33118
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f20, 0(%s0)
	flw	%f19, 1(%s0)
	flw	%f24, 2(%s0)
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
	beqi	%s3, 0, bnei_else.33120
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s2)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s2)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.33121
bnei_else.33120:
bnei_cont.33121:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s3, 0, bnei_else.33122
	flw	%f22, 1(%s2)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s2)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 474(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s2)
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
	j	bnei_cont.33123
bnei_else.33122:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.33123:
	fbne	%f0, %fzero, fbeq_else.33124
	add	%a2, %zero, %k1
	j	fbeq_cont.33125
fbeq_else.33124:
	add	%a2, %zero, %zero
fbeq_cont.33125:
	beqi	%a2, 0, bnei_else.33126
	j	bnei_cont.33127
bnei_else.33126:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.33127:
	add	%at, %fp, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.33117
bnei_else.33118:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%s0)
	flw	%f18, 0(%k0)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%s0)
	flw	%f17, 1(%k0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%s0)
	flw	%f16, 2(%k0)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.33128
	add	%a2, %zero, %zero
	j	fbgt_cont.33129
fbgt_else.33128:
	add	%a2, %zero, %k1
fbgt_cont.33129:
	beqi	%a2, 0, bnei_else.33130
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
	j	bnei_cont.33131
bnei_else.33130:
	fsw	%fzero, 0(%v0)
bnei_cont.33131:
	add	%at, %fp, %a3
	sw	%v0, 0(%at)
bnei_cont.33119:
	j	bnei_cont.33117
bnei_else.33116:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%s0)
	fbne	%f1, %fzero, fbeq_else.33132
	add	%a2, %zero, %k1
	j	fbeq_cont.33133
fbeq_else.33132:
	add	%a2, %zero, %zero
fbeq_cont.33133:
	beqi	%a2, 0, bnei_else.33134
	fsw	%fzero, 1(%v0)
	j	bnei_cont.33135
bnei_else.33134:
	fblt	%f1, %fzero, fbgt_else.33136
	add	%a2, %zero, %zero
	j	fbgt_cont.33137
fbgt_else.33136:
	add	%a2, %zero, %k1
fbgt_cont.33137:
	beqi	%s1, 0, bnei_else.33138
	beqi	%a2, 0, bnei_else.33140
	add	%a2, %zero, %zero
	j	bnei_cont.33139
bnei_else.33140:
	add	%a2, %zero, %k1
bnei_cont.33141:
	j	bnei_cont.33139
bnei_else.33138:
bnei_cont.33139:
	flw	%f0, 0(%k0)
	beqi	%a2, 0, bnei_else.33142
	j	bnei_cont.33143
bnei_else.33142:
	fneg	%f0, %f0
bnei_cont.33143:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.33135:
	flw	%f1, 1(%s0)
	fbne	%f1, %fzero, fbeq_else.33144
	add	%a2, %zero, %k1
	j	fbeq_cont.33145
fbeq_else.33144:
	add	%a2, %zero, %zero
fbeq_cont.33145:
	beqi	%a2, 0, bnei_else.33146
	fsw	%fzero, 3(%v0)
	j	bnei_cont.33147
bnei_else.33146:
	fblt	%f1, %fzero, fbgt_else.33148
	add	%a2, %zero, %zero
	j	fbgt_cont.33149
fbgt_else.33148:
	add	%a2, %zero, %k1
fbgt_cont.33149:
	beqi	%s1, 0, bnei_else.33150
	beqi	%a2, 0, bnei_else.33152
	add	%a2, %zero, %zero
	j	bnei_cont.33151
bnei_else.33152:
	add	%a2, %zero, %k1
bnei_cont.33153:
	j	bnei_cont.33151
bnei_else.33150:
bnei_cont.33151:
	flw	%f0, 1(%k0)
	beqi	%a2, 0, bnei_else.33154
	j	bnei_cont.33155
bnei_else.33154:
	fneg	%f0, %f0
bnei_cont.33155:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.33147:
	flw	%f1, 2(%s0)
	fbne	%f1, %fzero, fbeq_else.33156
	add	%a2, %zero, %k1
	j	fbeq_cont.33157
fbeq_else.33156:
	add	%a2, %zero, %zero
fbeq_cont.33157:
	beqi	%a2, 0, bnei_else.33158
	fsw	%fzero, 5(%v0)
	j	bnei_cont.33159
bnei_else.33158:
	fblt	%f1, %fzero, fbgt_else.33160
	add	%a2, %zero, %zero
	j	fbgt_cont.33161
fbgt_else.33160:
	add	%a2, %zero, %k1
fbgt_cont.33161:
	beqi	%s1, 0, bnei_else.33162
	beqi	%a2, 0, bnei_else.33164
	add	%a2, %zero, %zero
	j	bnei_cont.33163
bnei_else.33164:
	add	%a2, %zero, %k1
bnei_cont.33165:
	j	bnei_cont.33163
bnei_else.33162:
bnei_cont.33163:
	flw	%f0, 2(%k0)
	beqi	%a2, 0, bnei_else.33166
	j	bnei_cont.33167
bnei_else.33166:
	fneg	%f0, %f0
bnei_cont.33167:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.33159:
	add	%at, %fp, %a3
	sw	%v0, 0(%at)
bnei_cont.33117:
	addi	%v1, %a3, -1
	add	%ra, %zero, %a1
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877
bgti_else.33115:
	add	%ra, %zero, %a1
	jr	%ra
setup_startp_constants.2882:
	blti	%v1, 0, bgti_else.33205
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
	beqi	%a1, 2, bnei_else.33206
	addi	%at, %zero, 2
	blt	%at, %a1, bgt_else.33208
	j	bnei_cont.33207
bgt_else.33208:
	flw	%f17, 0(%k0)
	flw	%f18, 1(%k0)
	flw	%f19, 2(%k0)
	fmul	%f1, %f17, %f17
	flw	%f0, 0(%fp)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f18, %f18
	flw	%f0, 1(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f19, %f19
	flw	%f0, 2(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	beqi	%a3, 0, bnei_else.33210
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
	j	bnei_cont.33211
bnei_else.33210:
bnei_cont.33211:
	beqi	%a1, 3, bnei_else.33212
	j	bnei_cont.33213
bnei_else.33212:
	fsub	%f0, %f0, %f30
bnei_cont.33213:
	fsw	%f0, 3(%k0)
bgt_cont.33209:
	j	bnei_cont.33207
bnei_else.33206:
	flw	%f1, 0(%k0)
	flw	%f17, 1(%k0)
	flw	%f16, 2(%k0)
	flw	%f0, 0(%fp)
	fmul	%f1, %f0, %f1
	flw	%f0, 1(%fp)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%fp)
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fsw	%f0, 3(%k0)
bnei_cont.33207:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2882
bgti_else.33205:
	jr	%ra
check_all_inside.2907:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33361
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.33362
	beqi	%a2, 2, bnei_else.33364
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%k0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%fp, 0, bnei_else.33366
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
	j	bnei_cont.33367
bnei_else.33366:
bnei_cont.33367:
	beqi	%a2, 3, bnei_else.33368
	j	bnei_cont.33369
bnei_else.33368:
	fsub	%f16, %f16, %f30
bnei_cont.33369:
	fblt	%f16, %fzero, fbgt_else.33370
	add	%a0, %zero, %zero
	j	fbgt_cont.33371
fbgt_else.33370:
	add	%a0, %zero, %k1
fbgt_cont.33371:
	beqi	%a1, 0, bnei_else.33372
	beqi	%a0, 0, bnei_else.33374
	add	%a0, %zero, %zero
	j	bnei_cont.33373
bnei_else.33374:
	add	%a0, %zero, %k1
bnei_cont.33375:
	j	bnei_cont.33373
bnei_else.33372:
bnei_cont.33373:
	beqi	%a0, 0, bnei_else.33376
	add	%a1, %zero, %zero
	j	bnei_cont.33363
bnei_else.33376:
	add	%a1, %zero, %k1
bnei_cont.33377:
	j	bnei_cont.33363
bnei_else.33364:
	flw	%f16, 0(%k0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%k0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%k0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.33378
	add	%a0, %zero, %zero
	j	fbgt_cont.33379
fbgt_else.33378:
	add	%a0, %zero, %k1
fbgt_cont.33379:
	beqi	%a1, 0, bnei_else.33380
	beqi	%a0, 0, bnei_else.33382
	add	%a0, %zero, %zero
	j	bnei_cont.33381
bnei_else.33382:
	add	%a0, %zero, %k1
bnei_cont.33383:
	j	bnei_cont.33381
bnei_else.33380:
bnei_cont.33381:
	beqi	%a0, 0, bnei_else.33384
	add	%a1, %zero, %zero
	j	bnei_cont.33363
bnei_else.33384:
	add	%a1, %zero, %k1
bnei_cont.33385:
bnei_cont.33365:
	j	bnei_cont.33363
bnei_else.33362:
	fabs	%f17, %f19
	flw	%f16, 0(%k0)
	fblt	%f17, %f16, fbgt_else.33386
	add	%a0, %zero, %zero
	j	fbgt_cont.33387
fbgt_else.33386:
	add	%a0, %zero, %k1
fbgt_cont.33387:
	beqi	%a0, 0, bnei_else.33388
	fabs	%f17, %f20
	flw	%f16, 1(%k0)
	fblt	%f17, %f16, fbgt_else.33390
	add	%a0, %zero, %zero
	j	fbgt_cont.33391
fbgt_else.33390:
	add	%a0, %zero, %k1
fbgt_cont.33391:
	beqi	%a0, 0, bnei_else.33392
	fabs	%f17, %f21
	flw	%f16, 2(%k0)
	fblt	%f17, %f16, fbgt_else.33394
	add	%a0, %zero, %zero
	j	bnei_cont.33389
fbgt_else.33394:
	add	%a0, %zero, %k1
fbgt_cont.33395:
	j	bnei_cont.33389
bnei_else.33392:
	add	%a0, %zero, %zero
bnei_cont.33393:
	j	bnei_cont.33389
bnei_else.33388:
	add	%a0, %zero, %zero
bnei_cont.33389:
	beqi	%a0, 0, bnei_else.33396
	j	bnei_cont.33397
bnei_else.33396:
	beqi	%a1, 0, bnei_else.33398
	add	%a1, %zero, %zero
	j	bnei_cont.33399
bnei_else.33398:
	add	%a1, %zero, %k1
bnei_cont.33399:
bnei_cont.33397:
bnei_cont.33363:
	beqi	%a1, 0, bnei_else.33400
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33400:
	addi	%s0, %v0, 1
	add	%at, %v1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33401
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.33402
	beqi	%a2, 2, bnei_else.33404
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%k0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%fp, 0, bnei_else.33406
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
	j	bnei_cont.33407
bnei_else.33406:
bnei_cont.33407:
	beqi	%a2, 3, bnei_else.33408
	j	bnei_cont.33409
bnei_else.33408:
	fsub	%f16, %f16, %f30
bnei_cont.33409:
	fblt	%f16, %fzero, fbgt_else.33410
	add	%a0, %zero, %zero
	j	fbgt_cont.33411
fbgt_else.33410:
	add	%a0, %zero, %k1
fbgt_cont.33411:
	beqi	%a1, 0, bnei_else.33412
	beqi	%a0, 0, bnei_else.33414
	add	%a0, %zero, %zero
	j	bnei_cont.33413
bnei_else.33414:
	add	%a0, %zero, %k1
bnei_cont.33415:
	j	bnei_cont.33413
bnei_else.33412:
bnei_cont.33413:
	beqi	%a0, 0, bnei_else.33416
	add	%a1, %zero, %zero
	j	bnei_cont.33403
bnei_else.33416:
	add	%a1, %zero, %k1
bnei_cont.33417:
	j	bnei_cont.33403
bnei_else.33404:
	flw	%f16, 0(%k0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%k0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%k0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.33418
	add	%a0, %zero, %zero
	j	fbgt_cont.33419
fbgt_else.33418:
	add	%a0, %zero, %k1
fbgt_cont.33419:
	beqi	%a1, 0, bnei_else.33420
	beqi	%a0, 0, bnei_else.33422
	add	%a0, %zero, %zero
	j	bnei_cont.33421
bnei_else.33422:
	add	%a0, %zero, %k1
bnei_cont.33423:
	j	bnei_cont.33421
bnei_else.33420:
bnei_cont.33421:
	beqi	%a0, 0, bnei_else.33424
	add	%a1, %zero, %zero
	j	bnei_cont.33403
bnei_else.33424:
	add	%a1, %zero, %k1
bnei_cont.33425:
bnei_cont.33405:
	j	bnei_cont.33403
bnei_else.33402:
	fabs	%f17, %f19
	flw	%f16, 0(%k0)
	fblt	%f17, %f16, fbgt_else.33426
	add	%a0, %zero, %zero
	j	fbgt_cont.33427
fbgt_else.33426:
	add	%a0, %zero, %k1
fbgt_cont.33427:
	beqi	%a0, 0, bnei_else.33428
	fabs	%f17, %f20
	flw	%f16, 1(%k0)
	fblt	%f17, %f16, fbgt_else.33430
	add	%a0, %zero, %zero
	j	fbgt_cont.33431
fbgt_else.33430:
	add	%a0, %zero, %k1
fbgt_cont.33431:
	beqi	%a0, 0, bnei_else.33432
	fabs	%f17, %f21
	flw	%f16, 2(%k0)
	fblt	%f17, %f16, fbgt_else.33434
	add	%a0, %zero, %zero
	j	bnei_cont.33429
fbgt_else.33434:
	add	%a0, %zero, %k1
fbgt_cont.33435:
	j	bnei_cont.33429
bnei_else.33432:
	add	%a0, %zero, %zero
bnei_cont.33433:
	j	bnei_cont.33429
bnei_else.33428:
	add	%a0, %zero, %zero
bnei_cont.33429:
	beqi	%a0, 0, bnei_else.33436
	j	bnei_cont.33437
bnei_else.33436:
	beqi	%a1, 0, bnei_else.33438
	add	%a1, %zero, %zero
	j	bnei_cont.33439
bnei_else.33438:
	add	%a1, %zero, %k1
bnei_cont.33439:
bnei_cont.33437:
bnei_cont.33403:
	beqi	%a1, 0, bnei_else.33440
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33440:
	addi	%a0, %s0, 1
	addi	%v0, %a0, 0
	j	check_all_inside.2907
bnei_else.33401:
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33361:
	add	%v0, %zero, %k1
	jr	%ra
shadow_check_and_group.2913:
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra
	add	%at, %v1, %s1
	lw	%ra, 0(%at)
	beqi	%ra, -1, bnei_else.33638
	lw	%a2, 12(%ra)
	flw	%f19, 138(%zero)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
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
	beqi	%a2, 1, bnei_else.33639
	beqi	%a2, 2, bnei_else.33641
	flw	%f20, 0(%ra)
	fbne	%f20, %fzero, fbeq_else.33643
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
	fmul	%f1, %f0, %f21
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f22
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f23
	fadd	%f2, %f1, %f0
	fmul	%f1, %f21, %f21
	flw	%f0, 0(%k0)
	fmul	%f17, %f1, %f0
	fmul	%f1, %f22, %f22
	flw	%f0, 1(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f17, %f17, %f0
	fmul	%f1, %f23, %f23
	flw	%f0, 2(%k0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f17, %f0
	beqi	%fp, 0, bnei_else.33647
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
	j	bnei_cont.33648
bnei_else.33647:
bnei_cont.33648:
	beqi	%a2, 3, bnei_else.33649
	j	bnei_cont.33650
bnei_else.33649:
	fsub	%f0, %f0, %f30
bnei_cont.33650:
	fmul	%f1, %f2, %f2
	fmul	%f0, %f20, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.33651
	add	%a0, %zero, %zero
	j	fbgt_cont.33652
fbgt_else.33651:
	add	%a0, %zero, %k1
fbgt_cont.33652:
	beqi	%a0, 0, bnei_else.33653
	beqi	%a1, 0, bnei_else.33655
	fsqrt	%f0, %f0
	fadd	%f1, %f2, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.33656
bnei_else.33655:
	fsqrt	%f0, %f0
	fsub	%f1, %f2, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.33656:
	add	%a0, %zero, %k1
	j	bnei_cont.33640
bnei_else.33653:
	add	%a0, %zero, %zero
bnei_cont.33654:
bnei_cont.33646:
	j	bnei_cont.33640
bnei_else.33641:
	flw	%f0, 0(%ra)
	fblt	%f0, %fzero, fbgt_else.33657
	add	%a0, %zero, %zero
	j	fbgt_cont.33658
fbgt_else.33657:
	add	%a0, %zero, %k1
fbgt_cont.33658:
	beqi	%a0, 0, bnei_else.33659
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
	j	bnei_cont.33640
bnei_else.33659:
	add	%a0, %zero, %zero
bnei_cont.33660:
bnei_cont.33642:
	j	bnei_cont.33640
bnei_else.33639:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f21
	flw	%f20, 1(%ra)
	fmul	%f24, %f0, %f20
	flw	%f2, 185(%zero)
	fmul	%f0, %f24, %f2
	fadd	%f0, %f0, %f22
	fabs	%f0, %f0
	flw	%f17, 1(%k0)
	fblt	%f0, %f17, fbgt_else.33661
	add	%a0, %zero, %zero
	j	fbgt_cont.33662
fbgt_else.33661:
	add	%a0, %zero, %k1
fbgt_cont.33662:
	beqi	%a0, 0, bnei_else.33663
	flw	%f0, 186(%zero)
	fmul	%f0, %f24, %f0
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.33665
	add	%a0, %zero, %zero
	j	fbgt_cont.33666
fbgt_else.33665:
	add	%a0, %zero, %k1
fbgt_cont.33666:
	beqi	%a0, 0, bnei_else.33667
	fbne	%f20, %fzero, fbeq_else.33669
	add	%a0, %zero, %k1
	j	fbeq_cont.33670
fbeq_else.33669:
	add	%a0, %zero, %zero
fbeq_cont.33670:
	beqi	%a0, 0, bnei_else.33671
	add	%a0, %zero, %zero
	j	bnei_cont.33664
bnei_else.33671:
	add	%a0, %zero, %k1
bnei_cont.33672:
	j	bnei_cont.33664
bnei_else.33667:
	add	%a0, %zero, %zero
bnei_cont.33668:
	j	bnei_cont.33664
bnei_else.33663:
	add	%a0, %zero, %zero
bnei_cont.33664:
	beqi	%a0, 0, bnei_else.33673
	fsw	%f24, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.33674
bnei_else.33673:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f22
	flw	%f25, 3(%ra)
	fmul	%f26, %f0, %f25
	flw	%f24, 184(%zero)
	fmul	%f0, %f26, %f24
	fadd	%f0, %f0, %f21
	fabs	%f0, %f0
	flw	%f20, 0(%k0)
	fblt	%f0, %f20, fbgt_else.33675
	add	%a0, %zero, %zero
	j	fbgt_cont.33676
fbgt_else.33675:
	add	%a0, %zero, %k1
fbgt_cont.33676:
	beqi	%a0, 0, bnei_else.33677
	flw	%f0, 186(%zero)
	fmul	%f0, %f26, %f0
	fadd	%f0, %f0, %f23
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.33679
	add	%a0, %zero, %zero
	j	fbgt_cont.33680
fbgt_else.33679:
	add	%a0, %zero, %k1
fbgt_cont.33680:
	beqi	%a0, 0, bnei_else.33681
	fbne	%f25, %fzero, fbeq_else.33683
	add	%a0, %zero, %k1
	j	fbeq_cont.33684
fbeq_else.33683:
	add	%a0, %zero, %zero
fbeq_cont.33684:
	beqi	%a0, 0, bnei_else.33685
	add	%a0, %zero, %zero
	j	bnei_cont.33678
bnei_else.33685:
	add	%a0, %zero, %k1
bnei_cont.33686:
	j	bnei_cont.33678
bnei_else.33681:
	add	%a0, %zero, %zero
bnei_cont.33682:
	j	bnei_cont.33678
bnei_else.33677:
	add	%a0, %zero, %zero
bnei_cont.33678:
	beqi	%a0, 0, bnei_else.33687
	fsw	%f26, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.33688
bnei_else.33687:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f23
	flw	%f23, 5(%ra)
	fmul	%f1, %f0, %f23
	fmul	%f0, %f1, %f24
	fadd	%f0, %f0, %f21
	fabs	%f0, %f0
	fblt	%f0, %f20, fbgt_else.33689
	add	%a0, %zero, %zero
	j	fbgt_cont.33690
fbgt_else.33689:
	add	%a0, %zero, %k1
fbgt_cont.33690:
	beqi	%a0, 0, bnei_else.33691
	fmul	%f0, %f1, %f2
	fadd	%f0, %f0, %f22
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.33693
	add	%a0, %zero, %zero
	j	fbgt_cont.33694
fbgt_else.33693:
	add	%a0, %zero, %k1
fbgt_cont.33694:
	beqi	%a0, 0, bnei_else.33695
	fbne	%f23, %fzero, fbeq_else.33697
	add	%a0, %zero, %k1
	j	fbeq_cont.33698
fbeq_else.33697:
	add	%a0, %zero, %zero
fbeq_cont.33698:
	beqi	%a0, 0, bnei_else.33699
	add	%a0, %zero, %zero
	j	bnei_cont.33692
bnei_else.33699:
	add	%a0, %zero, %k1
bnei_cont.33700:
	j	bnei_cont.33692
bnei_else.33695:
	add	%a0, %zero, %zero
bnei_cont.33696:
	j	bnei_cont.33692
bnei_else.33691:
	add	%a0, %zero, %zero
bnei_cont.33692:
	beqi	%a0, 0, bnei_else.33701
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.33702
bnei_else.33701:
	add	%a0, %zero, %zero
bnei_cont.33702:
bnei_cont.33688:
bnei_cont.33674:
bnei_cont.33640:
	flw	%f1, 135(%zero)
	beqi	%a0, 0, bnei_else.33703
	flw	%f0, 467(%zero)
	fblt	%f1, %f0, fbgt_else.33705
	add	%a0, %zero, %zero
	j	bnei_cont.33704
fbgt_else.33705:
	add	%a0, %zero, %k1
fbgt_cont.33706:
	j	bnei_cont.33704
bnei_else.33703:
	add	%a0, %zero, %zero
bnei_cont.33704:
	beqi	%a0, 0, bnei_else.33707
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
	beqi	%a0, -1, bnei_else.33708
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.33710
	beqi	%a2, 2, bnei_else.33712
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%k0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%fp, 0, bnei_else.33714
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
	j	bnei_cont.33715
bnei_else.33714:
bnei_cont.33715:
	beqi	%a2, 3, bnei_else.33716
	j	bnei_cont.33717
bnei_else.33716:
	fsub	%f16, %f16, %f30
bnei_cont.33717:
	fblt	%f16, %fzero, fbgt_else.33718
	add	%a0, %zero, %zero
	j	fbgt_cont.33719
fbgt_else.33718:
	add	%a0, %zero, %k1
fbgt_cont.33719:
	beqi	%a1, 0, bnei_else.33720
	beqi	%a0, 0, bnei_else.33722
	add	%a0, %zero, %zero
	j	bnei_cont.33721
bnei_else.33722:
	add	%a0, %zero, %k1
bnei_cont.33723:
	j	bnei_cont.33721
bnei_else.33720:
bnei_cont.33721:
	beqi	%a0, 0, bnei_else.33724
	add	%a1, %zero, %zero
	j	bnei_cont.33711
bnei_else.33724:
	add	%a1, %zero, %k1
bnei_cont.33725:
	j	bnei_cont.33711
bnei_else.33712:
	flw	%f16, 0(%k0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%k0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%k0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.33726
	add	%a0, %zero, %zero
	j	fbgt_cont.33727
fbgt_else.33726:
	add	%a0, %zero, %k1
fbgt_cont.33727:
	beqi	%a1, 0, bnei_else.33728
	beqi	%a0, 0, bnei_else.33730
	add	%a0, %zero, %zero
	j	bnei_cont.33729
bnei_else.33730:
	add	%a0, %zero, %k1
bnei_cont.33731:
	j	bnei_cont.33729
bnei_else.33728:
bnei_cont.33729:
	beqi	%a0, 0, bnei_else.33732
	add	%a1, %zero, %zero
	j	bnei_cont.33711
bnei_else.33732:
	add	%a1, %zero, %k1
bnei_cont.33733:
bnei_cont.33713:
	j	bnei_cont.33711
bnei_else.33710:
	fabs	%f17, %f19
	flw	%f16, 0(%k0)
	fblt	%f17, %f16, fbgt_else.33734
	add	%a0, %zero, %zero
	j	fbgt_cont.33735
fbgt_else.33734:
	add	%a0, %zero, %k1
fbgt_cont.33735:
	beqi	%a0, 0, bnei_else.33736
	fabs	%f17, %f20
	flw	%f16, 1(%k0)
	fblt	%f17, %f16, fbgt_else.33738
	add	%a0, %zero, %zero
	j	fbgt_cont.33739
fbgt_else.33738:
	add	%a0, %zero, %k1
fbgt_cont.33739:
	beqi	%a0, 0, bnei_else.33740
	fabs	%f17, %f21
	flw	%f16, 2(%k0)
	fblt	%f17, %f16, fbgt_else.33742
	add	%a0, %zero, %zero
	j	bnei_cont.33737
fbgt_else.33742:
	add	%a0, %zero, %k1
fbgt_cont.33743:
	j	bnei_cont.33737
bnei_else.33740:
	add	%a0, %zero, %zero
bnei_cont.33741:
	j	bnei_cont.33737
bnei_else.33736:
	add	%a0, %zero, %zero
bnei_cont.33737:
	beqi	%a0, 0, bnei_else.33744
	j	bnei_cont.33745
bnei_else.33744:
	beqi	%a1, 0, bnei_else.33746
	add	%a1, %zero, %zero
	j	bnei_cont.33747
bnei_else.33746:
	add	%a1, %zero, %k1
bnei_cont.33747:
bnei_cont.33745:
bnei_cont.33711:
	beqi	%a1, 0, bnei_else.33748
	add	%v0, %zero, %zero
	j	bnei_cont.33709
bnei_else.33748:
	addi	%v0, %k1, 0
	jal	check_all_inside.2907
bnei_cont.33749:
	j	bnei_cont.33709
bnei_else.33708:
	add	%v0, %zero, %k1
bnei_cont.33709:
	beqi	%v0, 0, bnei_else.33750
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33750:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2
	j	shadow_check_and_group.2913
bnei_else.33707:
	beqi	%a1, 0, bnei_else.33751
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2
	j	shadow_check_and_group.2913
bnei_else.33751:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33638:
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_group.2916:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %ra
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33796
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33797
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33797:
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33798
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33799
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33799:
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33800
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33801
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33801:
	addi	%s3, %s3, 1
	add	%at, %s4, %s3
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33802
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.33803
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.33803:
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5
	addi	%v1, %s4, 0
	j	shadow_check_one_or_group.2916
bnei_else.33802:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33800:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33798:
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.33796:
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
	beqi	%k0, -1, bnei_else.33980
	beqi	%k0, 99, bnei_else.33981
	lw	%a1, 12(%k0)
	flw	%f1, 138(%zero)
	lw	%a2, 9(%a1)
	lw	%fp, 6(%a1)
	lw	%a0, 5(%a1)
	lw	%ra, 4(%a1)
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
	beqi	%a1, 1, bnei_else.33983
	beqi	%a1, 2, bnei_else.33985
	flw	%f18, 0(%k0)
	fbne	%f18, %fzero, fbeq_else.33987
	add	%a0, %zero, %k1
	j	fbeq_cont.33988
fbeq_else.33987:
	add	%a0, %zero, %zero
fbeq_cont.33988:
	beqi	%a0, 0, bnei_else.33989
	add	%a0, %zero, %zero
	j	bnei_cont.33984
bnei_else.33989:
	flw	%f0, 1(%k0)
	fmul	%f1, %f0, %f19
	flw	%f0, 2(%k0)
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%k0)
	fmul	%f0, %f0, %f20
	fadd	%f17, %f1, %f0
	fmul	%f1, %f19, %f19
	flw	%f0, 0(%ra)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2
	flw	%f0, 1(%ra)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f20
	flw	%f0, 2(%ra)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	beqi	%a3, 0, bnei_else.33991
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
	j	bnei_cont.33992
bnei_else.33991:
bnei_cont.33992:
	beqi	%a1, 3, bnei_else.33993
	j	bnei_cont.33994
bnei_else.33993:
	fsub	%f0, %f0, %f30
bnei_cont.33994:
	fmul	%f1, %f17, %f17
	fmul	%f0, %f18, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.33995
	add	%a0, %zero, %zero
	j	fbgt_cont.33996
fbgt_else.33995:
	add	%a0, %zero, %k1
fbgt_cont.33996:
	beqi	%a0, 0, bnei_else.33997
	beqi	%fp, 0, bnei_else.33999
	fsqrt	%f0, %f0
	fadd	%f1, %f17, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.34000
bnei_else.33999:
	fsqrt	%f0, %f0
	fsub	%f1, %f17, %f0
	flw	%f0, 4(%k0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.34000:
	add	%a0, %zero, %k1
	j	bnei_cont.33984
bnei_else.33997:
	add	%a0, %zero, %zero
bnei_cont.33998:
bnei_cont.33990:
	j	bnei_cont.33984
bnei_else.33985:
	flw	%f0, 0(%k0)
	fblt	%f0, %fzero, fbgt_else.34001
	add	%a0, %zero, %zero
	j	fbgt_cont.34002
fbgt_else.34001:
	add	%a0, %zero, %k1
fbgt_cont.34002:
	beqi	%a0, 0, bnei_else.34003
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
	j	bnei_cont.33984
bnei_else.34003:
	add	%a0, %zero, %zero
bnei_cont.34004:
bnei_cont.33986:
	j	bnei_cont.33984
bnei_else.33983:
	flw	%f0, 0(%k0)
	fsub	%f0, %f0, %f19
	flw	%f21, 1(%k0)
	fmul	%f18, %f0, %f21
	flw	%f17, 185(%zero)
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	flw	%f16, 1(%ra)
	fblt	%f0, %f16, fbgt_else.34005
	add	%a0, %zero, %zero
	j	fbgt_cont.34006
fbgt_else.34005:
	add	%a0, %zero, %k1
fbgt_cont.34006:
	beqi	%a0, 0, bnei_else.34007
	flw	%f0, 186(%zero)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.34009
	add	%a0, %zero, %zero
	j	fbgt_cont.34010
fbgt_else.34009:
	add	%a0, %zero, %k1
fbgt_cont.34010:
	beqi	%a0, 0, bnei_else.34011
	fbne	%f21, %fzero, fbeq_else.34013
	add	%a0, %zero, %k1
	j	fbeq_cont.34014
fbeq_else.34013:
	add	%a0, %zero, %zero
fbeq_cont.34014:
	beqi	%a0, 0, bnei_else.34015
	add	%a0, %zero, %zero
	j	bnei_cont.34008
bnei_else.34015:
	add	%a0, %zero, %k1
bnei_cont.34016:
	j	bnei_cont.34008
bnei_else.34011:
	add	%a0, %zero, %zero
bnei_cont.34012:
	j	bnei_cont.34008
bnei_else.34007:
	add	%a0, %zero, %zero
bnei_cont.34008:
	beqi	%a0, 0, bnei_else.34017
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.34018
bnei_else.34017:
	flw	%f0, 2(%k0)
	fsub	%f0, %f0, %f2
	flw	%f23, 3(%k0)
	fmul	%f22, %f0, %f23
	flw	%f21, 184(%zero)
	fmul	%f0, %f22, %f21
	fadd	%f0, %f0, %f19
	fabs	%f0, %f0
	flw	%f18, 0(%ra)
	fblt	%f0, %f18, fbgt_else.34019
	add	%a0, %zero, %zero
	j	fbgt_cont.34020
fbgt_else.34019:
	add	%a0, %zero, %k1
fbgt_cont.34020:
	beqi	%a0, 0, bnei_else.34021
	flw	%f0, 186(%zero)
	fmul	%f0, %f22, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%ra)
	fblt	%f1, %f0, fbgt_else.34023
	add	%a0, %zero, %zero
	j	fbgt_cont.34024
fbgt_else.34023:
	add	%a0, %zero, %k1
fbgt_cont.34024:
	beqi	%a0, 0, bnei_else.34025
	fbne	%f23, %fzero, fbeq_else.34027
	add	%a0, %zero, %k1
	j	fbeq_cont.34028
fbeq_else.34027:
	add	%a0, %zero, %zero
fbeq_cont.34028:
	beqi	%a0, 0, bnei_else.34029
	add	%a0, %zero, %zero
	j	bnei_cont.34022
bnei_else.34029:
	add	%a0, %zero, %k1
bnei_cont.34030:
	j	bnei_cont.34022
bnei_else.34025:
	add	%a0, %zero, %zero
bnei_cont.34026:
	j	bnei_cont.34022
bnei_else.34021:
	add	%a0, %zero, %zero
bnei_cont.34022:
	beqi	%a0, 0, bnei_else.34031
	fsw	%f22, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.34032
bnei_else.34031:
	flw	%f0, 4(%k0)
	fsub	%f0, %f0, %f20
	flw	%f20, 5(%k0)
	fmul	%f1, %f0, %f20
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f19
	fabs	%f0, %f0
	fblt	%f0, %f18, fbgt_else.34033
	add	%a0, %zero, %zero
	j	fbgt_cont.34034
fbgt_else.34033:
	add	%a0, %zero, %k1
fbgt_cont.34034:
	beqi	%a0, 0, bnei_else.34035
	fmul	%f0, %f1, %f17
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f16, fbgt_else.34037
	add	%a0, %zero, %zero
	j	fbgt_cont.34038
fbgt_else.34037:
	add	%a0, %zero, %k1
fbgt_cont.34038:
	beqi	%a0, 0, bnei_else.34039
	fbne	%f20, %fzero, fbeq_else.34041
	add	%a0, %zero, %k1
	j	fbeq_cont.34042
fbeq_else.34041:
	add	%a0, %zero, %zero
fbeq_cont.34042:
	beqi	%a0, 0, bnei_else.34043
	add	%a0, %zero, %zero
	j	bnei_cont.34036
bnei_else.34043:
	add	%a0, %zero, %k1
bnei_cont.34044:
	j	bnei_cont.34036
bnei_else.34039:
	add	%a0, %zero, %zero
bnei_cont.34040:
	j	bnei_cont.34036
bnei_else.34035:
	add	%a0, %zero, %zero
bnei_cont.34036:
	beqi	%a0, 0, bnei_else.34045
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.34046
bnei_else.34045:
	add	%a0, %zero, %zero
bnei_cont.34046:
bnei_cont.34032:
bnei_cont.34018:
bnei_cont.33984:
	beqi	%a0, 0, bnei_else.34047
	flw	%f1, 135(%zero)
	flw	%f0, 465(%zero)
	fblt	%f1, %f0, fbgt_else.34049
	add	%a0, %zero, %zero
	j	fbgt_cont.34050
fbgt_else.34049:
	add	%a0, %zero, %k1
fbgt_cont.34050:
	beqi	%a0, 0, bnei_else.34051
	lw	%a0, 1(%t8)
	beqi	%a0, -1, bnei_else.34053
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.34055
	add	%v0, %zero, %k1
	j	bnei_cont.34054
bnei_else.34055:
	lw	%a0, 2(%t8)
	beqi	%a0, -1, bnei_else.34057
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.34059
	add	%v0, %zero, %k1
	j	bnei_cont.34054
bnei_else.34059:
	lw	%a0, 3(%t8)
	beqi	%a0, -1, bnei_else.34061
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.34063
	add	%v0, %zero, %k1
	j	bnei_cont.34054
bnei_else.34063:
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0
	jal	shadow_check_one_or_group.2916
bnei_cont.34064:
	j	bnei_cont.34054
bnei_else.34061:
	add	%v0, %zero, %zero
bnei_cont.34062:
bnei_cont.34060:
	j	bnei_cont.34054
bnei_else.34057:
	add	%v0, %zero, %zero
bnei_cont.34058:
bnei_cont.34056:
	j	bnei_cont.34054
bnei_else.34053:
	add	%v0, %zero, %zero
bnei_cont.34054:
	beqi	%v0, 0, bnei_else.34065
	add	%a0, %zero, %k1
	j	bnei_cont.33982
bnei_else.34065:
	add	%a0, %zero, %zero
bnei_cont.34066:
	j	bnei_cont.33982
bnei_else.34051:
	add	%a0, %zero, %zero
bnei_cont.34052:
	j	bnei_cont.33982
bnei_else.34047:
	add	%a0, %zero, %zero
bnei_cont.34048:
	j	bnei_cont.33982
bnei_else.33981:
	add	%a0, %zero, %k1
bnei_cont.33982:
	beqi	%a0, 0, bnei_else.34067
	lw	%a0, 1(%t8)
	beqi	%a0, -1, bnei_else.34068
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.34070
	add	%v0, %zero, %k1
	j	bnei_cont.34069
bnei_else.34070:
	lw	%a0, 2(%t8)
	beqi	%a0, -1, bnei_else.34072
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.34074
	add	%v0, %zero, %k1
	j	bnei_cont.34069
bnei_else.34074:
	lw	%a0, 3(%t8)
	beqi	%a0, -1, bnei_else.34076
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.34078
	add	%v0, %zero, %k1
	j	bnei_cont.34069
bnei_else.34078:
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0
	jal	shadow_check_one_or_group.2916
bnei_cont.34079:
	j	bnei_cont.34069
bnei_else.34076:
	add	%v0, %zero, %zero
bnei_cont.34077:
bnei_cont.34075:
	j	bnei_cont.34069
bnei_else.34072:
	add	%v0, %zero, %zero
bnei_cont.34073:
bnei_cont.34071:
	j	bnei_cont.34069
bnei_else.34068:
	add	%v0, %zero, %zero
bnei_cont.34069:
	beqi	%v0, 0, bnei_else.34080
	add	%ra, %zero, %t7
	add	%v0, %zero, %k1
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
	jr	%ra
solve_each_element.2922:
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0
	add	%s3, %zero, %ra
	add	%at, %v1, %s1
	lw	%s4, 0(%at)
	beqi	%s4, -1, bnei_else.34328
	lw	%a3, 12(%s4)
	flw	%f19, 159(%zero)
	lw	%fp, 9(%a3)
	lw	%a2, 6(%a3)
	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	lw	%k0, 3(%a3)
	lw	%a3, 1(%a3)
	flw	%f0, 0(%a0)
	fsub	%f2, %f19, %f0
	flw	%f18, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f21, %f18, %f0
	flw	%f17, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f20, %f17, %f0
	beqi	%a3, 1, bnei_else.34329
	beqi	%a3, 2, bnei_else.34331
	flw	%f28, 0(%s2)
	flw	%f26, 1(%s2)
	flw	%f29, 2(%s2)
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
	beqi	%k0, 0, bnei_else.34333
	fmul	%f16, %f26, %f29
	flw	%f1, 0(%fp)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f29, %f28
	flw	%f0, 1(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f28, %f26
	flw	%f0, 2(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.34334
bnei_else.34333:
bnei_cont.34334:
	fbne	%f0, %fzero, fbeq_else.34335
	add	%a0, %zero, %k1
	j	fbeq_cont.34336
fbeq_else.34335:
	add	%a0, %zero, %zero
fbeq_cont.34336:
	beqi	%a0, 0, bnei_else.34337
	add	%s5, %zero, %zero
	j	bnei_cont.34330
bnei_else.34337:
	fmul	%f1, %f28, %f2
	fmul	%f16, %f1, %f25
	fmul	%f1, %f26, %f21
	fmul	%f1, %f1, %f24
	fadd	%f16, %f16, %f1
	fmul	%f1, %f29, %f20
	fmul	%f1, %f1, %f23
	fadd	%f1, %f16, %f1
	beqi	%k0, 0, bnei_else.34339
	fmul	%f22, %f29, %f21
	fmul	%f16, %f26, %f20
	fadd	%f22, %f22, %f16
	flw	%f16, 0(%fp)
	fmul	%f27, %f22, %f16
	fmul	%f22, %f28, %f20
	fmul	%f16, %f29, %f2
	fadd	%f22, %f22, %f16
	flw	%f16, 1(%fp)
	fmul	%f16, %f22, %f16
	fadd	%f27, %f27, %f16
	fmul	%f22, %f28, %f21
	fmul	%f16, %f26, %f2
	fadd	%f22, %f22, %f16
	flw	%f16, 2(%fp)
	fmul	%f16, %f22, %f16
	fadd	%f22, %f27, %f16
	flw	%f16, 474(%zero)
	fmul	%f16, %f22, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.34340
bnei_else.34339:
bnei_cont.34340:
	fmul	%f16, %f2, %f2
	fmul	%f22, %f16, %f25
	fmul	%f16, %f21, %f21
	fmul	%f16, %f16, %f24
	fadd	%f22, %f22, %f16
	fmul	%f16, %f20, %f20
	fmul	%f16, %f16, %f23
	fadd	%f16, %f22, %f16
	beqi	%k0, 0, bnei_else.34341
	fmul	%f23, %f21, %f20
	flw	%f22, 0(%fp)
	fmul	%f22, %f23, %f22
	fadd	%f22, %f16, %f22
	fmul	%f20, %f20, %f2
	flw	%f16, 1(%fp)
	fmul	%f16, %f20, %f16
	fadd	%f20, %f22, %f16
	fmul	%f2, %f2, %f21
	flw	%f16, 2(%fp)
	fmul	%f16, %f2, %f16
	fadd	%f16, %f20, %f16
	j	bnei_cont.34342
bnei_else.34341:
bnei_cont.34342:
	beqi	%a3, 3, bnei_else.34343
	j	bnei_cont.34344
bnei_else.34343:
	fsub	%f16, %f16, %f30
bnei_cont.34344:
	fmul	%f2, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f2, %f16
	fblt	%fzero, %f16, fbgt_else.34345
	add	%a0, %zero, %zero
	j	fbgt_cont.34346
fbgt_else.34345:
	add	%a0, %zero, %k1
fbgt_cont.34346:
	beqi	%a0, 0, bnei_else.34347
	fsqrt	%f16, %f16
	beqi	%a2, 0, bnei_else.34349
	j	bnei_cont.34350
bnei_else.34349:
	fneg	%f16, %f16
bnei_cont.34350:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.34330
bnei_else.34347:
	add	%s5, %zero, %zero
bnei_cont.34348:
bnei_cont.34338:
	j	bnei_cont.34330
bnei_else.34331:
	flw	%f0, 0(%s2)
	flw	%f24, 0(%a1)
	fmul	%f1, %f0, %f24
	flw	%f0, 1(%s2)
	flw	%f23, 1(%a1)
	fmul	%f0, %f0, %f23
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%s2)
	flw	%f22, 2(%a1)
	fmul	%f0, %f0, %f22
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.34351
	add	%a0, %zero, %zero
	j	fbgt_cont.34352
fbgt_else.34351:
	add	%a0, %zero, %k1
fbgt_cont.34352:
	beqi	%a0, 0, bnei_else.34353
	fmul	%f1, %f24, %f2
	fmul	%f0, %f23, %f21
	fadd	%f1, %f1, %f0
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.34330
bnei_else.34353:
	add	%s5, %zero, %zero
bnei_cont.34354:
bnei_cont.34332:
	j	bnei_cont.34330
bnei_else.34329:
	flw	%f22, 0(%s2)
	fbne	%f22, %fzero, fbeq_else.34355
	add	%a0, %zero, %k1
	j	fbeq_cont.34356
fbeq_else.34355:
	add	%a0, %zero, %zero
fbeq_cont.34356:
	beqi	%a0, 0, bnei_else.34357
	add	%a0, %zero, %zero
	j	bnei_cont.34358
bnei_else.34357:
	fblt	%f22, %fzero, fbgt_else.34359
	add	%a0, %zero, %zero
	j	fbgt_cont.34360
fbgt_else.34359:
	add	%a0, %zero, %k1
fbgt_cont.34360:
	beqi	%a2, 0, bnei_else.34361
	beqi	%a0, 0, bnei_else.34363
	add	%a0, %zero, %zero
	j	bnei_cont.34362
bnei_else.34363:
	add	%a0, %zero, %k1
bnei_cont.34364:
	j	bnei_cont.34362
bnei_else.34361:
bnei_cont.34362:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.34365
	j	bnei_cont.34366
bnei_else.34365:
	fneg	%f0, %f0
bnei_cont.34366:
	fsub	%f0, %f0, %f2
	fdiv	%f16, %f0, %f22
	flw	%f0, 1(%s2)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.34367
	add	%a0, %zero, %zero
	j	fbgt_cont.34368
fbgt_else.34367:
	add	%a0, %zero, %k1
fbgt_cont.34368:
	beqi	%a0, 0, bnei_else.34369
	flw	%f0, 2(%s2)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.34371
	add	%a0, %zero, %zero
	j	fbgt_cont.34372
fbgt_else.34371:
	add	%a0, %zero, %k1
fbgt_cont.34372:
	beqi	%a0, 0, bnei_else.34373
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.34370
bnei_else.34373:
	add	%a0, %zero, %zero
bnei_cont.34374:
	j	bnei_cont.34370
bnei_else.34369:
	add	%a0, %zero, %zero
bnei_cont.34370:
bnei_cont.34358:
	beqi	%a0, 0, bnei_else.34375
	add	%s5, %zero, %k1
	j	bnei_cont.34376
bnei_else.34375:
	flw	%f16, 1(%s2)
	fbne	%f16, %fzero, fbeq_else.34377
	add	%a0, %zero, %k1
	j	fbeq_cont.34378
fbeq_else.34377:
	add	%a0, %zero, %zero
fbeq_cont.34378:
	beqi	%a0, 0, bnei_else.34379
	add	%a0, %zero, %zero
	j	bnei_cont.34380
bnei_else.34379:
	fblt	%f16, %fzero, fbgt_else.34381
	add	%a0, %zero, %zero
	j	fbgt_cont.34382
fbgt_else.34381:
	add	%a0, %zero, %k1
fbgt_cont.34382:
	beqi	%a2, 0, bnei_else.34383
	beqi	%a0, 0, bnei_else.34385
	add	%a0, %zero, %zero
	j	bnei_cont.34384
bnei_else.34385:
	add	%a0, %zero, %k1
bnei_cont.34386:
	j	bnei_cont.34384
bnei_else.34383:
bnei_cont.34384:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.34387
	j	bnei_cont.34388
bnei_else.34387:
	fneg	%f0, %f0
bnei_cont.34388:
	fsub	%f0, %f0, %f21
	fdiv	%f23, %f0, %f16
	flw	%f0, 2(%s2)
	fmul	%f0, %f23, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.34389
	add	%a0, %zero, %zero
	j	fbgt_cont.34390
fbgt_else.34389:
	add	%a0, %zero, %k1
fbgt_cont.34390:
	beqi	%a0, 0, bnei_else.34391
	fmul	%f0, %f23, %f22
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.34393
	add	%a0, %zero, %zero
	j	fbgt_cont.34394
fbgt_else.34393:
	add	%a0, %zero, %k1
fbgt_cont.34394:
	beqi	%a0, 0, bnei_else.34395
	fsw	%f23, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.34392
bnei_else.34395:
	add	%a0, %zero, %zero
bnei_cont.34396:
	j	bnei_cont.34392
bnei_else.34391:
	add	%a0, %zero, %zero
bnei_cont.34392:
bnei_cont.34380:
	beqi	%a0, 0, bnei_else.34397
	addi	%s5, %zero, 2
	j	bnei_cont.34398
bnei_else.34397:
	flw	%f1, 2(%s2)
	fbne	%f1, %fzero, fbeq_else.34399
	add	%a0, %zero, %k1
	j	fbeq_cont.34400
fbeq_else.34399:
	add	%a0, %zero, %zero
fbeq_cont.34400:
	beqi	%a0, 0, bnei_else.34401
	add	%a0, %zero, %zero
	j	bnei_cont.34402
bnei_else.34401:
	fblt	%f1, %fzero, fbgt_else.34403
	add	%a0, %zero, %zero
	j	fbgt_cont.34404
fbgt_else.34403:
	add	%a0, %zero, %k1
fbgt_cont.34404:
	beqi	%a2, 0, bnei_else.34405
	beqi	%a0, 0, bnei_else.34407
	add	%a0, %zero, %zero
	j	bnei_cont.34406
bnei_else.34407:
	add	%a0, %zero, %k1
bnei_cont.34408:
	j	bnei_cont.34406
bnei_else.34405:
bnei_cont.34406:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.34409
	j	bnei_cont.34410
bnei_else.34409:
	fneg	%f0, %f0
bnei_cont.34410:
	fsub	%f0, %f0, %f20
	fdiv	%f20, %f0, %f1
	fmul	%f0, %f20, %f22
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.34411
	add	%a0, %zero, %zero
	j	fbgt_cont.34412
fbgt_else.34411:
	add	%a0, %zero, %k1
fbgt_cont.34412:
	beqi	%a0, 0, bnei_else.34413
	fmul	%f0, %f20, %f16
	fadd	%f0, %f0, %f21
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.34415
	add	%a0, %zero, %zero
	j	fbgt_cont.34416
fbgt_else.34415:
	add	%a0, %zero, %k1
fbgt_cont.34416:
	beqi	%a0, 0, bnei_else.34417
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.34414
bnei_else.34417:
	add	%a0, %zero, %zero
bnei_cont.34418:
	j	bnei_cont.34414
bnei_else.34413:
	add	%a0, %zero, %zero
bnei_cont.34414:
bnei_cont.34402:
	beqi	%a0, 0, bnei_else.34419
	addi	%s5, %zero, 3
	j	bnei_cont.34420
bnei_else.34419:
	add	%s5, %zero, %zero
bnei_cont.34420:
bnei_cont.34398:
bnei_cont.34376:
bnei_cont.34330:
	beqi	%s5, 0, bnei_else.34421
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.34422
	add	%a0, %zero, %zero
	j	fbgt_cont.34423
fbgt_else.34422:
	add	%a0, %zero, %k1
fbgt_cont.34423:
	beqi	%a0, 0, bnei_else.34424
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.34426
	add	%a0, %zero, %zero
	j	fbgt_cont.34427
fbgt_else.34426:
	add	%a0, %zero, %k1
fbgt_cont.34427:
	beqi	%a0, 0, bnei_cont.34425
	flw	%f0, 466(%zero)
	fadd	%f22, %f1, %f0
	flw	%f0, 0(%s2)
	fmul	%f0, %f0, %f22
	fadd	%f0, %f0, %f19
	flw	%f1, 1(%s2)
	fmul	%f1, %f1, %f22
	fadd	%f1, %f1, %f18
	flw	%f16, 2(%s2)
	fmul	%f16, %f16, %f22
	fadd	%f2, %f16, %f17
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.34430
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.34432
	beqi	%a2, 2, bnei_else.34434
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%k0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%fp, 0, bnei_else.34436
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
	j	bnei_cont.34437
bnei_else.34436:
bnei_cont.34437:
	beqi	%a2, 3, bnei_else.34438
	j	bnei_cont.34439
bnei_else.34438:
	fsub	%f16, %f16, %f30
bnei_cont.34439:
	fblt	%f16, %fzero, fbgt_else.34440
	add	%a0, %zero, %zero
	j	fbgt_cont.34441
fbgt_else.34440:
	add	%a0, %zero, %k1
fbgt_cont.34441:
	beqi	%a1, 0, bnei_else.34442
	beqi	%a0, 0, bnei_else.34444
	add	%a0, %zero, %zero
	j	bnei_cont.34443
bnei_else.34444:
	add	%a0, %zero, %k1
bnei_cont.34445:
	j	bnei_cont.34443
bnei_else.34442:
bnei_cont.34443:
	beqi	%a0, 0, bnei_else.34446
	add	%a1, %zero, %zero
	j	bnei_cont.34433
bnei_else.34446:
	add	%a1, %zero, %k1
bnei_cont.34447:
	j	bnei_cont.34433
bnei_else.34434:
	flw	%f16, 0(%k0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%k0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%k0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.34448
	add	%a0, %zero, %zero
	j	fbgt_cont.34449
fbgt_else.34448:
	add	%a0, %zero, %k1
fbgt_cont.34449:
	beqi	%a1, 0, bnei_else.34450
	beqi	%a0, 0, bnei_else.34452
	add	%a0, %zero, %zero
	j	bnei_cont.34451
bnei_else.34452:
	add	%a0, %zero, %k1
bnei_cont.34453:
	j	bnei_cont.34451
bnei_else.34450:
bnei_cont.34451:
	beqi	%a0, 0, bnei_else.34454
	add	%a1, %zero, %zero
	j	bnei_cont.34433
bnei_else.34454:
	add	%a1, %zero, %k1
bnei_cont.34455:
bnei_cont.34435:
	j	bnei_cont.34433
bnei_else.34432:
	fabs	%f17, %f19
	flw	%f16, 0(%k0)
	fblt	%f17, %f16, fbgt_else.34456
	add	%a0, %zero, %zero
	j	fbgt_cont.34457
fbgt_else.34456:
	add	%a0, %zero, %k1
fbgt_cont.34457:
	beqi	%a0, 0, bnei_else.34458
	fabs	%f17, %f20
	flw	%f16, 1(%k0)
	fblt	%f17, %f16, fbgt_else.34460
	add	%a0, %zero, %zero
	j	fbgt_cont.34461
fbgt_else.34460:
	add	%a0, %zero, %k1
fbgt_cont.34461:
	beqi	%a0, 0, bnei_else.34462
	fabs	%f17, %f21
	flw	%f16, 2(%k0)
	fblt	%f17, %f16, fbgt_else.34464
	add	%a0, %zero, %zero
	j	bnei_cont.34459
fbgt_else.34464:
	add	%a0, %zero, %k1
fbgt_cont.34465:
	j	bnei_cont.34459
bnei_else.34462:
	add	%a0, %zero, %zero
bnei_cont.34463:
	j	bnei_cont.34459
bnei_else.34458:
	add	%a0, %zero, %zero
bnei_cont.34459:
	beqi	%a0, 0, bnei_else.34466
	j	bnei_cont.34467
bnei_else.34466:
	beqi	%a1, 0, bnei_else.34468
	add	%a1, %zero, %zero
	j	bnei_cont.34469
bnei_else.34468:
	add	%a1, %zero, %k1
bnei_cont.34469:
bnei_cont.34467:
bnei_cont.34433:
	beqi	%a1, 0, bnei_else.34470
	add	%v0, %zero, %zero
	j	bnei_cont.34431
bnei_else.34470:
	addi	%v0, %k1, 0
	jal	check_all_inside.2907
bnei_cont.34471:
	j	bnei_cont.34431
bnei_else.34430:
	add	%v0, %zero, %k1
bnei_cont.34431:
	beqi	%v0, 0, bnei_cont.34425
	fsw	%f22, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s4, 141(%zero)
	sw	%s5, 136(%zero)
	j	bnei_cont.34425
bnei_else.34472:
bnei_cont.34473:
	j	bnei_cont.34425
bnei_else.34428:
bnei_cont.34429:
	j	bnei_cont.34425
bnei_else.34424:
bnei_cont.34425:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element.2922
bnei_else.34421:
	beqi	%a2, 0, bnei_else.34474
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element.2922
bnei_else.34474:
	add	%ra, %zero, %s3
	jr	%ra
bnei_else.34328:
	add	%ra, %zero, %s3
	jr	%ra
solve_one_or_network.2926:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34529
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34530
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34531
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34532
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34533
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34534
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34535
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34536
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2922
	addi	%v0, %s6, 1
	add	%ra, %zero, %t8
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0
	j	solve_one_or_network.2926
bnei_else.34536:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34535:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34534:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34533:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34532:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34531:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34530:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.34529:
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
	beqi	%a0, -1, bnei_else.35347
	beqi	%a0, 99, bnei_else.35348
	lw	%a3, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%fp, 9(%a3)
	lw	%a2, 6(%a3)
	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	lw	%k0, 3(%a3)
	lw	%a3, 1(%a3)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	beqi	%a3, 1, bnei_else.35350
	beqi	%a3, 2, bnei_else.35352
	flw	%f25, 0(%t9)
	flw	%f24, 1(%t9)
	flw	%f26, 2(%t9)
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
	beqi	%k0, 0, bnei_else.35354
	fmul	%f16, %f24, %f26
	flw	%f1, 0(%fp)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f26, %f25
	flw	%f0, 1(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f25, %f24
	flw	%f0, 2(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.35355
bnei_else.35354:
bnei_cont.35355:
	fbne	%f0, %fzero, fbeq_else.35356
	add	%a0, %zero, %k1
	j	fbeq_cont.35357
fbeq_else.35356:
	add	%a0, %zero, %zero
fbeq_cont.35357:
	beqi	%a0, 0, bnei_else.35358
	add	%a0, %zero, %zero
	j	bnei_cont.35351
bnei_else.35358:
	fmul	%f1, %f25, %f19
	fmul	%f16, %f1, %f22
	fmul	%f1, %f24, %f2
	fmul	%f1, %f1, %f21
	fadd	%f16, %f16, %f1
	fmul	%f1, %f26, %f20
	fmul	%f1, %f1, %f18
	fadd	%f1, %f16, %f1
	beqi	%k0, 0, bnei_else.35360
	fmul	%f17, %f26, %f2
	fmul	%f16, %f24, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 0(%fp)
	fmul	%f23, %f17, %f16
	fmul	%f17, %f25, %f20
	fmul	%f16, %f26, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 1(%fp)
	fmul	%f16, %f17, %f16
	fadd	%f23, %f23, %f16
	fmul	%f17, %f25, %f2
	fmul	%f16, %f24, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%fp)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f23, %f16
	flw	%f16, 474(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.35361
bnei_else.35360:
bnei_cont.35361:
	fmul	%f16, %f19, %f19
	fmul	%f17, %f16, %f22
	fmul	%f16, %f2, %f2
	fmul	%f16, %f16, %f21
	fadd	%f17, %f17, %f16
	fmul	%f16, %f20, %f20
	fmul	%f16, %f16, %f18
	fadd	%f16, %f17, %f16
	beqi	%k0, 0, bnei_else.35362
	fmul	%f18, %f2, %f20
	flw	%f17, 0(%fp)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19
	flw	%f16, 1(%fp)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f2
	flw	%f16, 2(%fp)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.35363
bnei_else.35362:
bnei_cont.35363:
	beqi	%a3, 3, bnei_else.35364
	j	bnei_cont.35365
bnei_else.35364:
	fsub	%f16, %f16, %f30
bnei_cont.35365:
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f17, %f16
	fblt	%fzero, %f16, fbgt_else.35366
	add	%a0, %zero, %zero
	j	fbgt_cont.35367
fbgt_else.35366:
	add	%a0, %zero, %k1
fbgt_cont.35367:
	beqi	%a0, 0, bnei_else.35368
	fsqrt	%f16, %f16
	beqi	%a2, 0, bnei_else.35370
	j	bnei_cont.35371
bnei_else.35370:
	fneg	%f16, %f16
bnei_cont.35371:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35351
bnei_else.35368:
	add	%a0, %zero, %zero
bnei_cont.35369:
bnei_cont.35359:
	j	bnei_cont.35351
bnei_else.35352:
	flw	%f0, 0(%t9)
	flw	%f21, 0(%a1)
	fmul	%f1, %f0, %f21
	flw	%f0, 1(%t9)
	flw	%f18, 1(%a1)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t9)
	flw	%f17, 2(%a1)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.35372
	add	%a0, %zero, %zero
	j	fbgt_cont.35373
fbgt_else.35372:
	add	%a0, %zero, %k1
fbgt_cont.35373:
	beqi	%a0, 0, bnei_else.35374
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35351
bnei_else.35374:
	add	%a0, %zero, %zero
bnei_cont.35375:
bnei_cont.35353:
	j	bnei_cont.35351
bnei_else.35350:
	flw	%f17, 0(%t9)
	fbne	%f17, %fzero, fbeq_else.35376
	add	%a0, %zero, %k1
	j	fbeq_cont.35377
fbeq_else.35376:
	add	%a0, %zero, %zero
fbeq_cont.35377:
	beqi	%a0, 0, bnei_else.35378
	add	%a0, %zero, %zero
	j	bnei_cont.35379
bnei_else.35378:
	fblt	%f17, %fzero, fbgt_else.35380
	add	%a0, %zero, %zero
	j	fbgt_cont.35381
fbgt_else.35380:
	add	%a0, %zero, %k1
fbgt_cont.35381:
	beqi	%a2, 0, bnei_else.35382
	beqi	%a0, 0, bnei_else.35384
	add	%a0, %zero, %zero
	j	bnei_cont.35383
bnei_else.35384:
	add	%a0, %zero, %k1
bnei_cont.35385:
	j	bnei_cont.35383
bnei_else.35382:
bnei_cont.35383:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.35386
	j	bnei_cont.35387
bnei_else.35386:
	fneg	%f0, %f0
bnei_cont.35387:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f17
	flw	%f0, 1(%t9)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.35388
	add	%a0, %zero, %zero
	j	fbgt_cont.35389
fbgt_else.35388:
	add	%a0, %zero, %k1
fbgt_cont.35389:
	beqi	%a0, 0, bnei_else.35390
	flw	%f0, 2(%t9)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.35392
	add	%a0, %zero, %zero
	j	fbgt_cont.35393
fbgt_else.35392:
	add	%a0, %zero, %k1
fbgt_cont.35393:
	beqi	%a0, 0, bnei_else.35394
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35391
bnei_else.35394:
	add	%a0, %zero, %zero
bnei_cont.35395:
	j	bnei_cont.35391
bnei_else.35390:
	add	%a0, %zero, %zero
bnei_cont.35391:
bnei_cont.35379:
	beqi	%a0, 0, bnei_else.35396
	add	%a0, %zero, %k1
	j	bnei_cont.35397
bnei_else.35396:
	flw	%f16, 1(%t9)
	fbne	%f16, %fzero, fbeq_else.35398
	add	%a0, %zero, %k1
	j	fbeq_cont.35399
fbeq_else.35398:
	add	%a0, %zero, %zero
fbeq_cont.35399:
	beqi	%a0, 0, bnei_else.35400
	add	%a0, %zero, %zero
	j	bnei_cont.35401
bnei_else.35400:
	fblt	%f16, %fzero, fbgt_else.35402
	add	%a0, %zero, %zero
	j	fbgt_cont.35403
fbgt_else.35402:
	add	%a0, %zero, %k1
fbgt_cont.35403:
	beqi	%a2, 0, bnei_else.35404
	beqi	%a0, 0, bnei_else.35406
	add	%a0, %zero, %zero
	j	bnei_cont.35405
bnei_else.35406:
	add	%a0, %zero, %k1
bnei_cont.35407:
	j	bnei_cont.35405
bnei_else.35404:
bnei_cont.35405:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.35408
	j	bnei_cont.35409
bnei_else.35408:
	fneg	%f0, %f0
bnei_cont.35409:
	fsub	%f0, %f0, %f2
	fdiv	%f18, %f0, %f16
	flw	%f0, 2(%t9)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.35410
	add	%a0, %zero, %zero
	j	fbgt_cont.35411
fbgt_else.35410:
	add	%a0, %zero, %k1
fbgt_cont.35411:
	beqi	%a0, 0, bnei_else.35412
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.35414
	add	%a0, %zero, %zero
	j	fbgt_cont.35415
fbgt_else.35414:
	add	%a0, %zero, %k1
fbgt_cont.35415:
	beqi	%a0, 0, bnei_else.35416
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35413
bnei_else.35416:
	add	%a0, %zero, %zero
bnei_cont.35417:
	j	bnei_cont.35413
bnei_else.35412:
	add	%a0, %zero, %zero
bnei_cont.35413:
bnei_cont.35401:
	beqi	%a0, 0, bnei_else.35418
	addi	%a0, %zero, 2
	j	bnei_cont.35419
bnei_else.35418:
	flw	%f1, 2(%t9)
	fbne	%f1, %fzero, fbeq_else.35420
	add	%a0, %zero, %k1
	j	fbeq_cont.35421
fbeq_else.35420:
	add	%a0, %zero, %zero
fbeq_cont.35421:
	beqi	%a0, 0, bnei_else.35422
	add	%a0, %zero, %zero
	j	bnei_cont.35423
bnei_else.35422:
	fblt	%f1, %fzero, fbgt_else.35424
	add	%a0, %zero, %zero
	j	fbgt_cont.35425
fbgt_else.35424:
	add	%a0, %zero, %k1
fbgt_cont.35425:
	beqi	%a2, 0, bnei_else.35426
	beqi	%a0, 0, bnei_else.35428
	add	%a0, %zero, %zero
	j	bnei_cont.35427
bnei_else.35428:
	add	%a0, %zero, %k1
bnei_cont.35429:
	j	bnei_cont.35427
bnei_else.35426:
bnei_cont.35427:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.35430
	j	bnei_cont.35431
bnei_else.35430:
	fneg	%f0, %f0
bnei_cont.35431:
	fsub	%f0, %f0, %f20
	fdiv	%f18, %f0, %f1
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.35432
	add	%a0, %zero, %zero
	j	fbgt_cont.35433
fbgt_else.35432:
	add	%a0, %zero, %k1
fbgt_cont.35433:
	beqi	%a0, 0, bnei_else.35434
	fmul	%f0, %f18, %f16
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.35436
	add	%a0, %zero, %zero
	j	fbgt_cont.35437
fbgt_else.35436:
	add	%a0, %zero, %k1
fbgt_cont.35437:
	beqi	%a0, 0, bnei_else.35438
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35435
bnei_else.35438:
	add	%a0, %zero, %zero
bnei_cont.35439:
	j	bnei_cont.35435
bnei_else.35434:
	add	%a0, %zero, %zero
bnei_cont.35435:
bnei_cont.35423:
	beqi	%a0, 0, bnei_else.35440
	addi	%a0, %zero, 3
	j	bnei_cont.35441
bnei_else.35440:
	add	%a0, %zero, %zero
bnei_cont.35441:
bnei_cont.35419:
bnei_cont.35397:
bnei_cont.35351:
	beqi	%a0, 0, bnei_cont.35349
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.35444
	add	%a0, %zero, %zero
	j	fbgt_cont.35445
fbgt_else.35444:
	add	%a0, %zero, %k1
fbgt_cont.35445:
	beqi	%a0, 0, bnei_cont.35349
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.35349
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35349
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35349
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35349
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.35349
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.35349
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.35349
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
	j	bnei_cont.35349
bnei_else.35460:
bnei_cont.35461:
	j	bnei_cont.35349
bnei_else.35458:
bnei_cont.35459:
	j	bnei_cont.35349
bnei_else.35456:
bnei_cont.35457:
	j	bnei_cont.35349
bnei_else.35454:
bnei_cont.35455:
	j	bnei_cont.35349
bnei_else.35452:
bnei_cont.35453:
	j	bnei_cont.35349
bnei_else.35450:
bnei_cont.35451:
	j	bnei_cont.35349
bnei_else.35448:
bnei_cont.35449:
	j	bnei_cont.35349
bnei_else.35446:
bnei_cont.35447:
	j	bnei_cont.35349
bnei_else.35442:
bnei_cont.35443:
	j	bnei_cont.35349
bnei_else.35348:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.35462
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35463
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35463
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35463
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.35463
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.35463
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2922
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.35463
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
	j	bnei_cont.35463
bnei_else.35474:
bnei_cont.35475:
	j	bnei_cont.35463
bnei_else.35472:
bnei_cont.35473:
	j	bnei_cont.35463
bnei_else.35470:
bnei_cont.35471:
	j	bnei_cont.35463
bnei_else.35468:
bnei_cont.35469:
	j	bnei_cont.35463
bnei_else.35466:
bnei_cont.35467:
	j	bnei_cont.35463
bnei_else.35464:
bnei_cont.35465:
	j	bnei_cont.35463
bnei_else.35462:
bnei_cont.35463:
bnei_cont.35349:
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%a1, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%s6, 0(%at)
	lw	%a0, 0(%s6)
	beqi	%a0, -1, bnei_else.35476
	beqi	%a0, 99, bnei_else.35477
	lw	%a3, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%fp, 9(%a3)
	lw	%a2, 6(%a3)
	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	lw	%k0, 3(%a3)
	lw	%a3, 1(%a3)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	beqi	%a3, 1, bnei_else.35479
	beqi	%a3, 2, bnei_else.35481
	flw	%f25, 0(%t9)
	flw	%f24, 1(%t9)
	flw	%f26, 2(%t9)
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
	beqi	%k0, 0, bnei_else.35483
	fmul	%f16, %f24, %f26
	flw	%f1, 0(%fp)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f26, %f25
	flw	%f0, 1(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f25, %f24
	flw	%f0, 2(%fp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.35484
bnei_else.35483:
bnei_cont.35484:
	fbne	%f0, %fzero, fbeq_else.35485
	add	%a0, %zero, %k1
	j	fbeq_cont.35486
fbeq_else.35485:
	add	%a0, %zero, %zero
fbeq_cont.35486:
	beqi	%a0, 0, bnei_else.35487
	add	%a0, %zero, %zero
	j	bnei_cont.35480
bnei_else.35487:
	fmul	%f1, %f25, %f19
	fmul	%f16, %f1, %f22
	fmul	%f1, %f24, %f2
	fmul	%f1, %f1, %f21
	fadd	%f16, %f16, %f1
	fmul	%f1, %f26, %f20
	fmul	%f1, %f1, %f18
	fadd	%f1, %f16, %f1
	beqi	%k0, 0, bnei_else.35489
	fmul	%f17, %f26, %f2
	fmul	%f16, %f24, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 0(%fp)
	fmul	%f23, %f17, %f16
	fmul	%f17, %f25, %f20
	fmul	%f16, %f26, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 1(%fp)
	fmul	%f16, %f17, %f16
	fadd	%f23, %f23, %f16
	fmul	%f17, %f25, %f2
	fmul	%f16, %f24, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%fp)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f23, %f16
	flw	%f16, 474(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.35490
bnei_else.35489:
bnei_cont.35490:
	fmul	%f16, %f19, %f19
	fmul	%f17, %f16, %f22
	fmul	%f16, %f2, %f2
	fmul	%f16, %f16, %f21
	fadd	%f17, %f17, %f16
	fmul	%f16, %f20, %f20
	fmul	%f16, %f16, %f18
	fadd	%f16, %f17, %f16
	beqi	%k0, 0, bnei_else.35491
	fmul	%f18, %f2, %f20
	flw	%f17, 0(%fp)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19
	flw	%f16, 1(%fp)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f2
	flw	%f16, 2(%fp)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.35492
bnei_else.35491:
bnei_cont.35492:
	beqi	%a3, 3, bnei_else.35493
	j	bnei_cont.35494
bnei_else.35493:
	fsub	%f16, %f16, %f30
bnei_cont.35494:
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f17, %f16
	fblt	%fzero, %f16, fbgt_else.35495
	add	%a0, %zero, %zero
	j	fbgt_cont.35496
fbgt_else.35495:
	add	%a0, %zero, %k1
fbgt_cont.35496:
	beqi	%a0, 0, bnei_else.35497
	fsqrt	%f16, %f16
	beqi	%a2, 0, bnei_else.35499
	j	bnei_cont.35500
bnei_else.35499:
	fneg	%f16, %f16
bnei_cont.35500:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35480
bnei_else.35497:
	add	%a0, %zero, %zero
bnei_cont.35498:
bnei_cont.35488:
	j	bnei_cont.35480
bnei_else.35481:
	flw	%f0, 0(%t9)
	flw	%f21, 0(%a1)
	fmul	%f1, %f0, %f21
	flw	%f0, 1(%t9)
	flw	%f18, 1(%a1)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%t9)
	flw	%f17, 2(%a1)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.35501
	add	%a0, %zero, %zero
	j	fbgt_cont.35502
fbgt_else.35501:
	add	%a0, %zero, %k1
fbgt_cont.35502:
	beqi	%a0, 0, bnei_else.35503
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35480
bnei_else.35503:
	add	%a0, %zero, %zero
bnei_cont.35504:
bnei_cont.35482:
	j	bnei_cont.35480
bnei_else.35479:
	flw	%f17, 0(%t9)
	fbne	%f17, %fzero, fbeq_else.35505
	add	%a0, %zero, %k1
	j	fbeq_cont.35506
fbeq_else.35505:
	add	%a0, %zero, %zero
fbeq_cont.35506:
	beqi	%a0, 0, bnei_else.35507
	add	%a0, %zero, %zero
	j	bnei_cont.35508
bnei_else.35507:
	fblt	%f17, %fzero, fbgt_else.35509
	add	%a0, %zero, %zero
	j	fbgt_cont.35510
fbgt_else.35509:
	add	%a0, %zero, %k1
fbgt_cont.35510:
	beqi	%a2, 0, bnei_else.35511
	beqi	%a0, 0, bnei_else.35513
	add	%a0, %zero, %zero
	j	bnei_cont.35512
bnei_else.35513:
	add	%a0, %zero, %k1
bnei_cont.35514:
	j	bnei_cont.35512
bnei_else.35511:
bnei_cont.35512:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.35515
	j	bnei_cont.35516
bnei_else.35515:
	fneg	%f0, %f0
bnei_cont.35516:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f17
	flw	%f0, 1(%t9)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.35517
	add	%a0, %zero, %zero
	j	fbgt_cont.35518
fbgt_else.35517:
	add	%a0, %zero, %k1
fbgt_cont.35518:
	beqi	%a0, 0, bnei_else.35519
	flw	%f0, 2(%t9)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.35521
	add	%a0, %zero, %zero
	j	fbgt_cont.35522
fbgt_else.35521:
	add	%a0, %zero, %k1
fbgt_cont.35522:
	beqi	%a0, 0, bnei_else.35523
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35520
bnei_else.35523:
	add	%a0, %zero, %zero
bnei_cont.35524:
	j	bnei_cont.35520
bnei_else.35519:
	add	%a0, %zero, %zero
bnei_cont.35520:
bnei_cont.35508:
	beqi	%a0, 0, bnei_else.35525
	add	%a0, %zero, %k1
	j	bnei_cont.35526
bnei_else.35525:
	flw	%f16, 1(%t9)
	fbne	%f16, %fzero, fbeq_else.35527
	add	%a0, %zero, %k1
	j	fbeq_cont.35528
fbeq_else.35527:
	add	%a0, %zero, %zero
fbeq_cont.35528:
	beqi	%a0, 0, bnei_else.35529
	add	%a0, %zero, %zero
	j	bnei_cont.35530
bnei_else.35529:
	fblt	%f16, %fzero, fbgt_else.35531
	add	%a0, %zero, %zero
	j	fbgt_cont.35532
fbgt_else.35531:
	add	%a0, %zero, %k1
fbgt_cont.35532:
	beqi	%a2, 0, bnei_else.35533
	beqi	%a0, 0, bnei_else.35535
	add	%a0, %zero, %zero
	j	bnei_cont.35534
bnei_else.35535:
	add	%a0, %zero, %k1
bnei_cont.35536:
	j	bnei_cont.35534
bnei_else.35533:
bnei_cont.35534:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.35537
	j	bnei_cont.35538
bnei_else.35537:
	fneg	%f0, %f0
bnei_cont.35538:
	fsub	%f0, %f0, %f2
	fdiv	%f18, %f0, %f16
	flw	%f0, 2(%t9)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a1)
	fblt	%f1, %f0, fbgt_else.35539
	add	%a0, %zero, %zero
	j	fbgt_cont.35540
fbgt_else.35539:
	add	%a0, %zero, %k1
fbgt_cont.35540:
	beqi	%a0, 0, bnei_else.35541
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.35543
	add	%a0, %zero, %zero
	j	fbgt_cont.35544
fbgt_else.35543:
	add	%a0, %zero, %k1
fbgt_cont.35544:
	beqi	%a0, 0, bnei_else.35545
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35542
bnei_else.35545:
	add	%a0, %zero, %zero
bnei_cont.35546:
	j	bnei_cont.35542
bnei_else.35541:
	add	%a0, %zero, %zero
bnei_cont.35542:
bnei_cont.35530:
	beqi	%a0, 0, bnei_else.35547
	addi	%a0, %zero, 2
	j	bnei_cont.35548
bnei_else.35547:
	flw	%f1, 2(%t9)
	fbne	%f1, %fzero, fbeq_else.35549
	add	%a0, %zero, %k1
	j	fbeq_cont.35550
fbeq_else.35549:
	add	%a0, %zero, %zero
fbeq_cont.35550:
	beqi	%a0, 0, bnei_else.35551
	add	%a0, %zero, %zero
	j	bnei_cont.35552
bnei_else.35551:
	fblt	%f1, %fzero, fbgt_else.35553
	add	%a0, %zero, %zero
	j	fbgt_cont.35554
fbgt_else.35553:
	add	%a0, %zero, %k1
fbgt_cont.35554:
	beqi	%a2, 0, bnei_else.35555
	beqi	%a0, 0, bnei_else.35557
	add	%a0, %zero, %zero
	j	bnei_cont.35556
bnei_else.35557:
	add	%a0, %zero, %k1
bnei_cont.35558:
	j	bnei_cont.35556
bnei_else.35555:
bnei_cont.35556:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.35559
	j	bnei_cont.35560
bnei_else.35559:
	fneg	%f0, %f0
bnei_cont.35560:
	fsub	%f0, %f0, %f20
	fdiv	%f18, %f0, %f1
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a1)
	fblt	%f1, %f0, fbgt_else.35561
	add	%a0, %zero, %zero
	j	fbgt_cont.35562
fbgt_else.35561:
	add	%a0, %zero, %k1
fbgt_cont.35562:
	beqi	%a0, 0, bnei_else.35563
	fmul	%f0, %f18, %f16
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a1)
	fblt	%f1, %f0, fbgt_else.35565
	add	%a0, %zero, %zero
	j	fbgt_cont.35566
fbgt_else.35565:
	add	%a0, %zero, %k1
fbgt_cont.35566:
	beqi	%a0, 0, bnei_else.35567
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.35564
bnei_else.35567:
	add	%a0, %zero, %zero
bnei_cont.35568:
	j	bnei_cont.35564
bnei_else.35563:
	add	%a0, %zero, %zero
bnei_cont.35564:
bnei_cont.35552:
	beqi	%a0, 0, bnei_else.35569
	addi	%a0, %zero, 3
	j	bnei_cont.35570
bnei_else.35569:
	add	%a0, %zero, %zero
bnei_cont.35570:
bnei_cont.35548:
bnei_cont.35526:
bnei_cont.35480:
	beqi	%a0, 0, bnei_cont.35478
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.35573
	add	%a0, %zero, %zero
	j	fbgt_cont.35574
fbgt_else.35573:
	add	%a0, %zero, %k1
fbgt_cont.35574:
	beqi	%a0, 0, bnei_cont.35478
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.35478
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35478
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35478
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35478
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.35478
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.35478
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
	j	bnei_cont.35478
bnei_else.35587:
bnei_cont.35588:
	j	bnei_cont.35478
bnei_else.35585:
bnei_cont.35586:
	j	bnei_cont.35478
bnei_else.35583:
bnei_cont.35584:
	j	bnei_cont.35478
bnei_else.35581:
bnei_cont.35582:
	j	bnei_cont.35478
bnei_else.35579:
bnei_cont.35580:
	j	bnei_cont.35478
bnei_else.35577:
bnei_cont.35578:
	j	bnei_cont.35478
bnei_else.35575:
bnei_cont.35576:
	j	bnei_cont.35478
bnei_else.35571:
bnei_cont.35572:
	j	bnei_cont.35478
bnei_else.35477:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.35589
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.35590
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.35590
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.35590
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.35590
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.35590
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
	j	bnei_cont.35590
bnei_else.35599:
bnei_cont.35600:
	j	bnei_cont.35590
bnei_else.35597:
bnei_cont.35598:
	j	bnei_cont.35590
bnei_else.35595:
bnei_cont.35596:
	j	bnei_cont.35590
bnei_else.35593:
bnei_cont.35594:
	j	bnei_cont.35590
bnei_else.35591:
bnei_cont.35592:
	j	bnei_cont.35590
bnei_else.35589:
bnei_cont.35590:
bnei_cont.35478:
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %t9, 0
	j	trace_or_matrix.2930
bnei_else.35476:
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.35347:
	jr	%ra
solve_each_element_fast.2936:
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0
	add	%s3, %zero, %ra
	lw	%fp, 1(%s2)
	lw	%a1, 0(%s2)
	add	%at, %v1, %s1
	lw	%s4, 0(%at)
	beqi	%s4, -1, bnei_else.35802
	lw	%a0, 12(%s4)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%k0, 4(%a0)
	lw	%a0, 1(%a0)
	flw	%f2, 0(%a3)
	flw	%f16, 1(%a3)
	flw	%f18, 2(%a3)
	add	%at, %fp, %s4
	lw	%fp, 0(%at)
	beqi	%a0, 1, bnei_else.35803
	beqi	%a0, 2, bnei_else.35805
	flw	%f17, 0(%fp)
	fbne	%f17, %fzero, fbeq_else.35807
	add	%a0, %zero, %k1
	j	fbeq_cont.35808
fbeq_else.35807:
	add	%a0, %zero, %zero
fbeq_cont.35808:
	beqi	%a0, 0, bnei_else.35809
	add	%s5, %zero, %zero
	j	bnei_cont.35804
bnei_else.35809:
	flw	%f0, 1(%fp)
	fmul	%f1, %f0, %f2
	flw	%f0, 2(%fp)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%fp)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.35811
	add	%a0, %zero, %zero
	j	fbgt_cont.35812
fbgt_else.35811:
	add	%a0, %zero, %k1
fbgt_cont.35812:
	beqi	%a0, 0, bnei_else.35813
	beqi	%a2, 0, bnei_else.35815
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.35816
bnei_else.35815:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.35816:
	add	%s5, %zero, %k1
	j	bnei_cont.35804
bnei_else.35813:
	add	%s5, %zero, %zero
bnei_cont.35814:
bnei_cont.35810:
	j	bnei_cont.35804
bnei_else.35805:
	flw	%f1, 0(%fp)
	fblt	%f1, %fzero, fbgt_else.35817
	add	%a0, %zero, %zero
	j	fbgt_cont.35818
fbgt_else.35817:
	add	%a0, %zero, %k1
fbgt_cont.35818:
	beqi	%a0, 0, bnei_else.35819
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.35804
bnei_else.35819:
	add	%s5, %zero, %zero
bnei_cont.35820:
bnei_cont.35806:
	j	bnei_cont.35804
bnei_else.35803:
	flw	%f0, 0(%fp)
	fsub	%f0, %f0, %f2
	flw	%f21, 1(%fp)
	fmul	%f20, %f0, %f21
	flw	%f19, 1(%a1)
	fmul	%f0, %f20, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%k0)
	fblt	%f0, %f17, fbgt_else.35821
	add	%a0, %zero, %zero
	j	fbgt_cont.35822
fbgt_else.35821:
	add	%a0, %zero, %k1
fbgt_cont.35822:
	beqi	%a0, 0, bnei_else.35823
	flw	%f0, 2(%a1)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.35825
	add	%a0, %zero, %zero
	j	fbgt_cont.35826
fbgt_else.35825:
	add	%a0, %zero, %k1
fbgt_cont.35826:
	beqi	%a0, 0, bnei_else.35827
	fbne	%f21, %fzero, fbeq_else.35829
	add	%a0, %zero, %k1
	j	fbeq_cont.35830
fbeq_else.35829:
	add	%a0, %zero, %zero
fbeq_cont.35830:
	beqi	%a0, 0, bnei_else.35831
	add	%a0, %zero, %zero
	j	bnei_cont.35824
bnei_else.35831:
	add	%a0, %zero, %k1
bnei_cont.35832:
	j	bnei_cont.35824
bnei_else.35827:
	add	%a0, %zero, %zero
bnei_cont.35828:
	j	bnei_cont.35824
bnei_else.35823:
	add	%a0, %zero, %zero
bnei_cont.35824:
	beqi	%a0, 0, bnei_else.35833
	fsw	%f20, 135(%zero)
	add	%s5, %zero, %k1
	j	bnei_cont.35834
bnei_else.35833:
	flw	%f0, 2(%fp)
	fsub	%f0, %f0, %f16
	flw	%f23, 3(%fp)
	fmul	%f22, %f0, %f23
	flw	%f21, 0(%a1)
	fmul	%f0, %f22, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	flw	%f20, 0(%k0)
	fblt	%f0, %f20, fbgt_else.35835
	add	%a0, %zero, %zero
	j	fbgt_cont.35836
fbgt_else.35835:
	add	%a0, %zero, %k1
fbgt_cont.35836:
	beqi	%a0, 0, bnei_else.35837
	flw	%f0, 2(%a1)
	fmul	%f0, %f22, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%k0)
	fblt	%f1, %f0, fbgt_else.35839
	add	%a0, %zero, %zero
	j	fbgt_cont.35840
fbgt_else.35839:
	add	%a0, %zero, %k1
fbgt_cont.35840:
	beqi	%a0, 0, bnei_else.35841
	fbne	%f23, %fzero, fbeq_else.35843
	add	%a0, %zero, %k1
	j	fbeq_cont.35844
fbeq_else.35843:
	add	%a0, %zero, %zero
fbeq_cont.35844:
	beqi	%a0, 0, bnei_else.35845
	add	%a0, %zero, %zero
	j	bnei_cont.35838
bnei_else.35845:
	add	%a0, %zero, %k1
bnei_cont.35846:
	j	bnei_cont.35838
bnei_else.35841:
	add	%a0, %zero, %zero
bnei_cont.35842:
	j	bnei_cont.35838
bnei_else.35837:
	add	%a0, %zero, %zero
bnei_cont.35838:
	beqi	%a0, 0, bnei_else.35847
	fsw	%f22, 135(%zero)
	addi	%s5, %zero, 2
	j	bnei_cont.35848
bnei_else.35847:
	flw	%f0, 4(%fp)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%fp)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f20, fbgt_else.35849
	add	%a0, %zero, %zero
	j	fbgt_cont.35850
fbgt_else.35849:
	add	%a0, %zero, %k1
fbgt_cont.35850:
	beqi	%a0, 0, bnei_else.35851
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.35853
	add	%a0, %zero, %zero
	j	fbgt_cont.35854
fbgt_else.35853:
	add	%a0, %zero, %k1
fbgt_cont.35854:
	beqi	%a0, 0, bnei_else.35855
	fbne	%f18, %fzero, fbeq_else.35857
	add	%a0, %zero, %k1
	j	fbeq_cont.35858
fbeq_else.35857:
	add	%a0, %zero, %zero
fbeq_cont.35858:
	beqi	%a0, 0, bnei_else.35859
	add	%a0, %zero, %zero
	j	bnei_cont.35852
bnei_else.35859:
	add	%a0, %zero, %k1
bnei_cont.35860:
	j	bnei_cont.35852
bnei_else.35855:
	add	%a0, %zero, %zero
bnei_cont.35856:
	j	bnei_cont.35852
bnei_else.35851:
	add	%a0, %zero, %zero
bnei_cont.35852:
	beqi	%a0, 0, bnei_else.35861
	fsw	%f1, 135(%zero)
	addi	%s5, %zero, 3
	j	bnei_cont.35862
bnei_else.35861:
	add	%s5, %zero, %zero
bnei_cont.35862:
bnei_cont.35848:
bnei_cont.35834:
bnei_cont.35804:
	beqi	%s5, 0, bnei_else.35863
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.35864
	add	%a0, %zero, %zero
	j	fbgt_cont.35865
fbgt_else.35864:
	add	%a0, %zero, %k1
fbgt_cont.35865:
	beqi	%a0, 0, bnei_else.35866
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.35868
	add	%a0, %zero, %zero
	j	fbgt_cont.35869
fbgt_else.35868:
	add	%a0, %zero, %k1
fbgt_cont.35869:
	beqi	%a0, 0, bnei_cont.35867
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
	beqi	%a0, -1, bnei_else.35872
	lw	%a2, 12(%a0)
	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	beqi	%a2, 1, bnei_else.35874
	beqi	%a2, 2, bnei_else.35876
	fmul	%f17, %f19, %f19
	flw	%f16, 0(%k0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	flw	%f16, 1(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	flw	%f16, 2(%k0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	beqi	%fp, 0, bnei_else.35878
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
	j	bnei_cont.35879
bnei_else.35878:
bnei_cont.35879:
	beqi	%a2, 3, bnei_else.35880
	j	bnei_cont.35881
bnei_else.35880:
	fsub	%f16, %f16, %f30
bnei_cont.35881:
	fblt	%f16, %fzero, fbgt_else.35882
	add	%a0, %zero, %zero
	j	fbgt_cont.35883
fbgt_else.35882:
	add	%a0, %zero, %k1
fbgt_cont.35883:
	beqi	%a1, 0, bnei_else.35884
	beqi	%a0, 0, bnei_else.35886
	add	%a0, %zero, %zero
	j	bnei_cont.35885
bnei_else.35886:
	add	%a0, %zero, %k1
bnei_cont.35887:
	j	bnei_cont.35885
bnei_else.35884:
bnei_cont.35885:
	beqi	%a0, 0, bnei_else.35888
	add	%a1, %zero, %zero
	j	bnei_cont.35875
bnei_else.35888:
	add	%a1, %zero, %k1
bnei_cont.35889:
	j	bnei_cont.35875
bnei_else.35876:
	flw	%f16, 0(%k0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%k0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%k0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	fblt	%f16, %fzero, fbgt_else.35890
	add	%a0, %zero, %zero
	j	fbgt_cont.35891
fbgt_else.35890:
	add	%a0, %zero, %k1
fbgt_cont.35891:
	beqi	%a1, 0, bnei_else.35892
	beqi	%a0, 0, bnei_else.35894
	add	%a0, %zero, %zero
	j	bnei_cont.35893
bnei_else.35894:
	add	%a0, %zero, %k1
bnei_cont.35895:
	j	bnei_cont.35893
bnei_else.35892:
bnei_cont.35893:
	beqi	%a0, 0, bnei_else.35896
	add	%a1, %zero, %zero
	j	bnei_cont.35875
bnei_else.35896:
	add	%a1, %zero, %k1
bnei_cont.35897:
bnei_cont.35877:
	j	bnei_cont.35875
bnei_else.35874:
	fabs	%f17, %f19
	flw	%f16, 0(%k0)
	fblt	%f17, %f16, fbgt_else.35898
	add	%a0, %zero, %zero
	j	fbgt_cont.35899
fbgt_else.35898:
	add	%a0, %zero, %k1
fbgt_cont.35899:
	beqi	%a0, 0, bnei_else.35900
	fabs	%f17, %f20
	flw	%f16, 1(%k0)
	fblt	%f17, %f16, fbgt_else.35902
	add	%a0, %zero, %zero
	j	fbgt_cont.35903
fbgt_else.35902:
	add	%a0, %zero, %k1
fbgt_cont.35903:
	beqi	%a0, 0, bnei_else.35904
	fabs	%f17, %f21
	flw	%f16, 2(%k0)
	fblt	%f17, %f16, fbgt_else.35906
	add	%a0, %zero, %zero
	j	bnei_cont.35901
fbgt_else.35906:
	add	%a0, %zero, %k1
fbgt_cont.35907:
	j	bnei_cont.35901
bnei_else.35904:
	add	%a0, %zero, %zero
bnei_cont.35905:
	j	bnei_cont.35901
bnei_else.35900:
	add	%a0, %zero, %zero
bnei_cont.35901:
	beqi	%a0, 0, bnei_else.35908
	j	bnei_cont.35909
bnei_else.35908:
	beqi	%a1, 0, bnei_else.35910
	add	%a1, %zero, %zero
	j	bnei_cont.35911
bnei_else.35910:
	add	%a1, %zero, %k1
bnei_cont.35911:
bnei_cont.35909:
bnei_cont.35875:
	beqi	%a1, 0, bnei_else.35912
	add	%v0, %zero, %zero
	j	bnei_cont.35873
bnei_else.35912:
	addi	%v0, %k1, 0
	jal	check_all_inside.2907
bnei_cont.35913:
	j	bnei_cont.35873
bnei_else.35872:
	add	%v0, %zero, %k1
bnei_cont.35873:
	beqi	%v0, 0, bnei_cont.35867
	fsw	%f22, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s4, 141(%zero)
	sw	%s5, 136(%zero)
	j	bnei_cont.35867
bnei_else.35914:
bnei_cont.35915:
	j	bnei_cont.35867
bnei_else.35870:
bnei_cont.35871:
	j	bnei_cont.35867
bnei_else.35866:
bnei_cont.35867:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936
bnei_else.35863:
	beqi	%a2, 0, bnei_else.35916
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936
bnei_else.35916:
	add	%ra, %zero, %s3
	jr	%ra
bnei_else.35802:
	add	%ra, %zero, %s3
	jr	%ra
solve_one_or_network_fast.2940:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35971
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35972
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35973
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35974
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35975
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35976
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35977
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%s6, %s6, 1
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.35978
	lw	%v1, 83(%a0)
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2936
	addi	%v0, %s6, 1
	add	%ra, %zero, %t8
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0
	j	solve_one_or_network_fast.2940
bnei_else.35978:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35977:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35976:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35975:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35974:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35973:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35972:
	add	%ra, %zero, %t8
	jr	%ra
bnei_else.35971:
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
	beqi	%s0, -1, bnei_else.36597
	beqi	%s0, 99, bnei_else.36598
	lw	%a0, 12(%s0)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	flw	%f2, 0(%a3)
	flw	%f16, 1(%a3)
	flw	%f18, 2(%a3)
	lw	%a0, 1(%t9)
	lw	%k0, 0(%t9)
	add	%at, %a0, %s0
	lw	%ra, 0(%at)
	beqi	%a1, 1, bnei_else.36600
	beqi	%a1, 2, bnei_else.36602
	flw	%f17, 0(%ra)
	fbne	%f17, %fzero, fbeq_else.36604
	add	%a0, %zero, %k1
	j	fbeq_cont.36605
fbeq_else.36604:
	add	%a0, %zero, %zero
fbeq_cont.36605:
	beqi	%a0, 0, bnei_else.36606
	add	%a0, %zero, %zero
	j	bnei_cont.36601
bnei_else.36606:
	flw	%f0, 1(%ra)
	fmul	%f1, %f0, %f2
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.36608
	add	%a0, %zero, %zero
	j	fbgt_cont.36609
fbgt_else.36608:
	add	%a0, %zero, %k1
fbgt_cont.36609:
	beqi	%a0, 0, bnei_else.36610
	beqi	%a2, 0, bnei_else.36612
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.36613
bnei_else.36612:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.36613:
	add	%a0, %zero, %k1
	j	bnei_cont.36601
bnei_else.36610:
	add	%a0, %zero, %zero
bnei_cont.36611:
bnei_cont.36607:
	j	bnei_cont.36601
bnei_else.36602:
	flw	%f1, 0(%ra)
	fblt	%f1, %fzero, fbgt_else.36614
	add	%a0, %zero, %zero
	j	fbgt_cont.36615
fbgt_else.36614:
	add	%a0, %zero, %k1
fbgt_cont.36615:
	beqi	%a0, 0, bnei_else.36616
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36601
bnei_else.36616:
	add	%a0, %zero, %zero
bnei_cont.36617:
bnei_cont.36603:
	j	bnei_cont.36601
bnei_else.36600:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f2
	flw	%f21, 1(%ra)
	fmul	%f20, %f0, %f21
	flw	%f19, 1(%k0)
	fmul	%f0, %f20, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%fp)
	fblt	%f0, %f17, fbgt_else.36618
	add	%a0, %zero, %zero
	j	fbgt_cont.36619
fbgt_else.36618:
	add	%a0, %zero, %k1
fbgt_cont.36619:
	beqi	%a0, 0, bnei_else.36620
	flw	%f0, 2(%k0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.36622
	add	%a0, %zero, %zero
	j	fbgt_cont.36623
fbgt_else.36622:
	add	%a0, %zero, %k1
fbgt_cont.36623:
	beqi	%a0, 0, bnei_else.36624
	fbne	%f21, %fzero, fbeq_else.36626
	add	%a0, %zero, %k1
	j	fbeq_cont.36627
fbeq_else.36626:
	add	%a0, %zero, %zero
fbeq_cont.36627:
	beqi	%a0, 0, bnei_else.36628
	add	%a0, %zero, %zero
	j	bnei_cont.36621
bnei_else.36628:
	add	%a0, %zero, %k1
bnei_cont.36629:
	j	bnei_cont.36621
bnei_else.36624:
	add	%a0, %zero, %zero
bnei_cont.36625:
	j	bnei_cont.36621
bnei_else.36620:
	add	%a0, %zero, %zero
bnei_cont.36621:
	beqi	%a0, 0, bnei_else.36630
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36631
bnei_else.36630:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f16
	flw	%f23, 3(%ra)
	fmul	%f22, %f0, %f23
	flw	%f21, 0(%k0)
	fmul	%f0, %f22, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	flw	%f20, 0(%fp)
	fblt	%f0, %f20, fbgt_else.36632
	add	%a0, %zero, %zero
	j	fbgt_cont.36633
fbgt_else.36632:
	add	%a0, %zero, %k1
fbgt_cont.36633:
	beqi	%a0, 0, bnei_else.36634
	flw	%f0, 2(%k0)
	fmul	%f0, %f22, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.36636
	add	%a0, %zero, %zero
	j	fbgt_cont.36637
fbgt_else.36636:
	add	%a0, %zero, %k1
fbgt_cont.36637:
	beqi	%a0, 0, bnei_else.36638
	fbne	%f23, %fzero, fbeq_else.36640
	add	%a0, %zero, %k1
	j	fbeq_cont.36641
fbeq_else.36640:
	add	%a0, %zero, %zero
fbeq_cont.36641:
	beqi	%a0, 0, bnei_else.36642
	add	%a0, %zero, %zero
	j	bnei_cont.36635
bnei_else.36642:
	add	%a0, %zero, %k1
bnei_cont.36643:
	j	bnei_cont.36635
bnei_else.36638:
	add	%a0, %zero, %zero
bnei_cont.36639:
	j	bnei_cont.36635
bnei_else.36634:
	add	%a0, %zero, %zero
bnei_cont.36635:
	beqi	%a0, 0, bnei_else.36644
	fsw	%f22, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36645
bnei_else.36644:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%ra)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f20, fbgt_else.36646
	add	%a0, %zero, %zero
	j	fbgt_cont.36647
fbgt_else.36646:
	add	%a0, %zero, %k1
fbgt_cont.36647:
	beqi	%a0, 0, bnei_else.36648
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.36650
	add	%a0, %zero, %zero
	j	fbgt_cont.36651
fbgt_else.36650:
	add	%a0, %zero, %k1
fbgt_cont.36651:
	beqi	%a0, 0, bnei_else.36652
	fbne	%f18, %fzero, fbeq_else.36654
	add	%a0, %zero, %k1
	j	fbeq_cont.36655
fbeq_else.36654:
	add	%a0, %zero, %zero
fbeq_cont.36655:
	beqi	%a0, 0, bnei_else.36656
	add	%a0, %zero, %zero
	j	bnei_cont.36649
bnei_else.36656:
	add	%a0, %zero, %k1
bnei_cont.36657:
	j	bnei_cont.36649
bnei_else.36652:
	add	%a0, %zero, %zero
bnei_cont.36653:
	j	bnei_cont.36649
bnei_else.36648:
	add	%a0, %zero, %zero
bnei_cont.36649:
	beqi	%a0, 0, bnei_else.36658
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36659
bnei_else.36658:
	add	%a0, %zero, %zero
bnei_cont.36659:
bnei_cont.36645:
bnei_cont.36631:
bnei_cont.36601:
	beqi	%a0, 0, bnei_cont.36599
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.36662
	add	%a0, %zero, %zero
	j	fbgt_cont.36663
fbgt_else.36662:
	add	%a0, %zero, %k1
fbgt_cont.36663:
	beqi	%a0, 0, bnei_cont.36599
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.36599
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.36599
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.36599
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.36599
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.36599
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.36599
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.36599
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
	j	bnei_cont.36599
bnei_else.36678:
bnei_cont.36679:
	j	bnei_cont.36599
bnei_else.36676:
bnei_cont.36677:
	j	bnei_cont.36599
bnei_else.36674:
bnei_cont.36675:
	j	bnei_cont.36599
bnei_else.36672:
bnei_cont.36673:
	j	bnei_cont.36599
bnei_else.36670:
bnei_cont.36671:
	j	bnei_cont.36599
bnei_else.36668:
bnei_cont.36669:
	j	bnei_cont.36599
bnei_else.36666:
bnei_cont.36667:
	j	bnei_cont.36599
bnei_else.36664:
bnei_cont.36665:
	j	bnei_cont.36599
bnei_else.36660:
bnei_cont.36661:
	j	bnei_cont.36599
bnei_else.36598:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.36680
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.36681
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.36681
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.36681
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.36681
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.36681
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -3
	lw	%a0, 7(%s6)
	beqi	%a0, -1, bnei_cont.36681
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
	j	bnei_cont.36681
bnei_else.36692:
bnei_cont.36693:
	j	bnei_cont.36681
bnei_else.36690:
bnei_cont.36691:
	j	bnei_cont.36681
bnei_else.36688:
bnei_cont.36689:
	j	bnei_cont.36681
bnei_else.36686:
bnei_cont.36687:
	j	bnei_cont.36681
bnei_else.36684:
bnei_cont.36685:
	j	bnei_cont.36681
bnei_else.36682:
bnei_cont.36683:
	j	bnei_cont.36681
bnei_else.36680:
bnei_cont.36681:
bnei_cont.36599:
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	sw	%a1, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%s6, 0(%at)
	lw	%ra, 0(%s6)
	beqi	%ra, -1, bnei_else.36694
	beqi	%ra, 99, bnei_else.36695
	lw	%a0, 12(%ra)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	flw	%f2, 0(%a3)
	flw	%f16, 1(%a3)
	flw	%f18, 2(%a3)
	lw	%a0, 1(%t9)
	lw	%k0, 0(%t9)
	add	%at, %a0, %ra
	lw	%ra, 0(%at)
	beqi	%a1, 1, bnei_else.36697
	beqi	%a1, 2, bnei_else.36699
	flw	%f17, 0(%ra)
	fbne	%f17, %fzero, fbeq_else.36701
	add	%a0, %zero, %k1
	j	fbeq_cont.36702
fbeq_else.36701:
	add	%a0, %zero, %zero
fbeq_cont.36702:
	beqi	%a0, 0, bnei_else.36703
	add	%a0, %zero, %zero
	j	bnei_cont.36698
bnei_else.36703:
	flw	%f0, 1(%ra)
	fmul	%f1, %f0, %f2
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.36705
	add	%a0, %zero, %zero
	j	fbgt_cont.36706
fbgt_else.36705:
	add	%a0, %zero, %k1
fbgt_cont.36706:
	beqi	%a0, 0, bnei_else.36707
	beqi	%a2, 0, bnei_else.36709
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.36710
bnei_else.36709:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.36710:
	add	%a0, %zero, %k1
	j	bnei_cont.36698
bnei_else.36707:
	add	%a0, %zero, %zero
bnei_cont.36708:
bnei_cont.36704:
	j	bnei_cont.36698
bnei_else.36699:
	flw	%f1, 0(%ra)
	fblt	%f1, %fzero, fbgt_else.36711
	add	%a0, %zero, %zero
	j	fbgt_cont.36712
fbgt_else.36711:
	add	%a0, %zero, %k1
fbgt_cont.36712:
	beqi	%a0, 0, bnei_else.36713
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36698
bnei_else.36713:
	add	%a0, %zero, %zero
bnei_cont.36714:
bnei_cont.36700:
	j	bnei_cont.36698
bnei_else.36697:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f2
	flw	%f21, 1(%ra)
	fmul	%f20, %f0, %f21
	flw	%f19, 1(%k0)
	fmul	%f0, %f20, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%fp)
	fblt	%f0, %f17, fbgt_else.36715
	add	%a0, %zero, %zero
	j	fbgt_cont.36716
fbgt_else.36715:
	add	%a0, %zero, %k1
fbgt_cont.36716:
	beqi	%a0, 0, bnei_else.36717
	flw	%f0, 2(%k0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.36719
	add	%a0, %zero, %zero
	j	fbgt_cont.36720
fbgt_else.36719:
	add	%a0, %zero, %k1
fbgt_cont.36720:
	beqi	%a0, 0, bnei_else.36721
	fbne	%f21, %fzero, fbeq_else.36723
	add	%a0, %zero, %k1
	j	fbeq_cont.36724
fbeq_else.36723:
	add	%a0, %zero, %zero
fbeq_cont.36724:
	beqi	%a0, 0, bnei_else.36725
	add	%a0, %zero, %zero
	j	bnei_cont.36718
bnei_else.36725:
	add	%a0, %zero, %k1
bnei_cont.36726:
	j	bnei_cont.36718
bnei_else.36721:
	add	%a0, %zero, %zero
bnei_cont.36722:
	j	bnei_cont.36718
bnei_else.36717:
	add	%a0, %zero, %zero
bnei_cont.36718:
	beqi	%a0, 0, bnei_else.36727
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.36728
bnei_else.36727:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f16
	flw	%f23, 3(%ra)
	fmul	%f22, %f0, %f23
	flw	%f21, 0(%k0)
	fmul	%f0, %f22, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	flw	%f20, 0(%fp)
	fblt	%f0, %f20, fbgt_else.36729
	add	%a0, %zero, %zero
	j	fbgt_cont.36730
fbgt_else.36729:
	add	%a0, %zero, %k1
fbgt_cont.36730:
	beqi	%a0, 0, bnei_else.36731
	flw	%f0, 2(%k0)
	fmul	%f0, %f22, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.36733
	add	%a0, %zero, %zero
	j	fbgt_cont.36734
fbgt_else.36733:
	add	%a0, %zero, %k1
fbgt_cont.36734:
	beqi	%a0, 0, bnei_else.36735
	fbne	%f23, %fzero, fbeq_else.36737
	add	%a0, %zero, %k1
	j	fbeq_cont.36738
fbeq_else.36737:
	add	%a0, %zero, %zero
fbeq_cont.36738:
	beqi	%a0, 0, bnei_else.36739
	add	%a0, %zero, %zero
	j	bnei_cont.36732
bnei_else.36739:
	add	%a0, %zero, %k1
bnei_cont.36740:
	j	bnei_cont.36732
bnei_else.36735:
	add	%a0, %zero, %zero
bnei_cont.36736:
	j	bnei_cont.36732
bnei_else.36731:
	add	%a0, %zero, %zero
bnei_cont.36732:
	beqi	%a0, 0, bnei_else.36741
	fsw	%f22, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36742
bnei_else.36741:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f18
	flw	%f18, 5(%ra)
	fmul	%f1, %f0, %f18
	fmul	%f0, %f1, %f21
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	fblt	%f0, %f20, fbgt_else.36743
	add	%a0, %zero, %zero
	j	fbgt_cont.36744
fbgt_else.36743:
	add	%a0, %zero, %k1
fbgt_cont.36744:
	beqi	%a0, 0, bnei_else.36745
	fmul	%f0, %f1, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.36747
	add	%a0, %zero, %zero
	j	fbgt_cont.36748
fbgt_else.36747:
	add	%a0, %zero, %k1
fbgt_cont.36748:
	beqi	%a0, 0, bnei_else.36749
	fbne	%f18, %fzero, fbeq_else.36751
	add	%a0, %zero, %k1
	j	fbeq_cont.36752
fbeq_else.36751:
	add	%a0, %zero, %zero
fbeq_cont.36752:
	beqi	%a0, 0, bnei_else.36753
	add	%a0, %zero, %zero
	j	bnei_cont.36746
bnei_else.36753:
	add	%a0, %zero, %k1
bnei_cont.36754:
	j	bnei_cont.36746
bnei_else.36749:
	add	%a0, %zero, %zero
bnei_cont.36750:
	j	bnei_cont.36746
bnei_else.36745:
	add	%a0, %zero, %zero
bnei_cont.36746:
	beqi	%a0, 0, bnei_else.36755
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36756
bnei_else.36755:
	add	%a0, %zero, %zero
bnei_cont.36756:
bnei_cont.36742:
bnei_cont.36728:
bnei_cont.36698:
	beqi	%a0, 0, bnei_cont.36696
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.36759
	add	%a0, %zero, %zero
	j	fbgt_cont.36760
fbgt_else.36759:
	add	%a0, %zero, %k1
fbgt_cont.36760:
	beqi	%a0, 0, bnei_cont.36696
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.36696
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.36696
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.36696
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.36696
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.36696
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.36696
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
	j	bnei_cont.36696
bnei_else.36773:
bnei_cont.36774:
	j	bnei_cont.36696
bnei_else.36771:
bnei_cont.36772:
	j	bnei_cont.36696
bnei_else.36769:
bnei_cont.36770:
	j	bnei_cont.36696
bnei_else.36767:
bnei_cont.36768:
	j	bnei_cont.36696
bnei_else.36765:
bnei_cont.36766:
	j	bnei_cont.36696
bnei_else.36763:
bnei_cont.36764:
	j	bnei_cont.36696
bnei_else.36761:
bnei_cont.36762:
	j	bnei_cont.36696
bnei_else.36757:
bnei_cont.36758:
	j	bnei_cont.36696
bnei_else.36695:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.36775
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.36776
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.36776
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.36776
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 5(%s6)
	beqi	%a0, -1, bnei_cont.36776
	lw	%v1, 83(%a0)
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 6(%s6)
	beqi	%a0, -1, bnei_cont.36776
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
	j	bnei_cont.36776
bnei_else.36785:
bnei_cont.36786:
	j	bnei_cont.36776
bnei_else.36783:
bnei_cont.36784:
	j	bnei_cont.36776
bnei_else.36781:
bnei_cont.36782:
	j	bnei_cont.36776
bnei_else.36779:
bnei_cont.36780:
	j	bnei_cont.36776
bnei_else.36777:
bnei_cont.36778:
	j	bnei_cont.36776
bnei_else.36775:
bnei_cont.36776:
bnei_cont.36696:
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %t9, 0
	j	trace_or_matrix_fast.2944
bnei_else.36694:
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.36597:
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
	beqi	%a2, 1, bnei_else.36925
	beqi	%a2, 2, bnei_else.36926
	beqi	%a2, 3, bnei_else.36927
	beqi	%a2, 4, bnei_else.36928
	jr	%ra
bnei_else.36928:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	fsub	%f1, %f1, %f0
	flw	%f0, 0(%a1)
	fsqrt	%f0, %f0
	fmul	%f19, %f1, %f0
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fsub	%f1, %f1, %f0
	flw	%f0, 2(%a1)
	fsqrt	%f0, %f0
	fmul	%f18, %f1, %f0
	fmul	%f1, %f19, %f19
	fmul	%f0, %f18, %f18
	fadd	%f17, %f1, %f0
	fabs	%f0, %f19
	flw	%f16, 464(%zero)
	fblt	%f0, %f16, fbgt_else.36930
	add	%a0, %zero, %zero
	j	fbgt_cont.36931
fbgt_else.36930:
	add	%a0, %zero, %k1
fbgt_cont.36931:
	beqi	%a0, 0, bnei_else.36932
	flw	%f1, 463(%zero)
	j	bnei_cont.36933
bnei_else.36932:
	fdiv	%f0, %f18, %f19
	fabs	%f2, %f0
	fblt	%f2, %fzero, fbgt_else.36934
	add	%a0, %zero, %k1
	j	fbgt_cont.36935
fbgt_else.36934:
	add	%a0, %zero, %zero
fbgt_cont.36935:
	fabs	%f19, %f2
	flw	%f0, 462(%zero)
	fblt	%f19, %f0, fbgt_else.36936
	flw	%f0, 455(%zero)
	fblt	%f19, %f0, fbgt_else.36938
	flw	%f18, 480(%zero)
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
	j	fbgt_cont.36939
fbgt_else.36938:
	flw	%f18, 479(%zero)
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
fbgt_cont.36939:
	beqi	%a0, 0, bnei_else.36940
	j	fbgt_cont.36937
bnei_else.36940:
	fneg	%f0, %f0
bnei_cont.36941:
	j	fbgt_cont.36937
fbgt_else.36936:
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
fbgt_cont.36937:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.36933:
	floor	%f0, %f1
	fsub	%f18, %f1, %f0
	flw	%f1, 1(%v1)
	flw	%f0, 1(%a3)
	fsub	%f1, %f1, %f0
	flw	%f0, 1(%a1)
	fsqrt	%f0, %f0
	fmul	%f1, %f1, %f0
	fabs	%f0, %f17
	fblt	%f0, %f16, fbgt_else.36942
	add	%a0, %zero, %zero
	j	fbgt_cont.36943
fbgt_else.36942:
	add	%a0, %zero, %k1
fbgt_cont.36943:
	beqi	%a0, 0, bnei_else.36944
	flw	%f1, 463(%zero)
	j	bnei_cont.36945
bnei_else.36944:
	fdiv	%f0, %f1, %f17
	fabs	%f19, %f0
	fblt	%f19, %fzero, fbgt_else.36946
	add	%a0, %zero, %k1
	j	fbgt_cont.36947
fbgt_else.36946:
	add	%a0, %zero, %zero
fbgt_cont.36947:
	fabs	%f17, %f19
	flw	%f0, 462(%zero)
	fblt	%f17, %f0, fbgt_else.36948
	flw	%f0, 455(%zero)
	fblt	%f17, %f0, fbgt_else.36950
	flw	%f16, 480(%zero)
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
	j	fbgt_cont.36951
fbgt_else.36950:
	flw	%f16, 479(%zero)
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
fbgt_cont.36951:
	beqi	%a0, 0, bnei_else.36952
	j	fbgt_cont.36949
bnei_else.36952:
	fneg	%f0, %f0
bnei_cont.36953:
	j	fbgt_cont.36949
fbgt_else.36948:
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
fbgt_cont.36949:
	flw	%f1, 454(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 453(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.36945:
	floor	%f0, %f1
	fsub	%f17, %f1, %f0
	flw	%f1, 452(%zero)
	flw	%f16, 474(%zero)
	fsub	%f0, %f16, %f18
	fmul	%f0, %f0, %f0
	fsub	%f1, %f1, %f0
	fsub	%f0, %f16, %f17
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	fblt	%f0, %fzero, fbgt_else.36954
	add	%a0, %zero, %zero
	j	fbgt_cont.36955
fbgt_else.36954:
	add	%a0, %zero, %k1
fbgt_cont.36955:
	beqi	%a0, 0, bnei_else.36956
	fmov	%f0, %fzero
	j	bnei_cont.36957
bnei_else.36956:
bnei_cont.36957:
	flw	%f1, 451(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 450(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.36927:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	fsub	%f16, %f1, %f0
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
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
	flw	%f17, 482(%zero)
	fabs	%f16, %f0
	flw	%f1, 481(%zero)
	fdiv	%f0, %f16, %f1
	floor	%f0, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f16, %f0
	fblt	%f0, %f17, fbgt_else.36959
	add	%a0, %zero, %zero
	j	fbgt_cont.36960
fbgt_else.36959:
	add	%a0, %zero, %k1
fbgt_cont.36960:
	fblt	%f0, %f17, fbgt_else.36961
	fsub	%f0, %f0, %f17
	j	fbgt_cont.36962
fbgt_else.36961:
fbgt_cont.36962:
	flw	%f16, 480(%zero)
	fblt	%f0, %f16, fbgt_else.36963
	beqi	%a0, 0, bnei_else.36965
	add	%a0, %zero, %zero
	j	fbgt_cont.36964
bnei_else.36965:
	add	%a0, %zero, %k1
bnei_cont.36966:
	j	fbgt_cont.36964
fbgt_else.36963:
fbgt_cont.36964:
	fblt	%f0, %f16, fbgt_else.36967
	fsub	%f0, %f17, %f0
	j	fbgt_cont.36968
fbgt_else.36967:
fbgt_cont.36968:
	flw	%f1, 479(%zero)
	fblt	%f1, %f0, fbgt_else.36969
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.36970
fbgt_else.36969:
	fsub	%f18, %f16, %f0
	fmul	%f17, %f18, %f18
	fmul	%f16, %f17, %f17
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.36970:
	beqi	%a0, 0, bnei_else.36971
	j	bnei_cont.36972
bnei_else.36971:
	fneg	%f0, %f0
bnei_cont.36972:
	fmul	%f16, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 146(%zero)
	fsub	%f0, %f30, %f16
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.36926:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	fmul	%f0, %f1, %f0
	flw	%f17, 482(%zero)
	fblt	%f0, %fzero, fbgt_else.36974
	add	%a0, %zero, %k1
	j	fbgt_cont.36975
fbgt_else.36974:
	add	%a0, %zero, %zero
fbgt_cont.36975:
	fabs	%f16, %f0
	flw	%f1, 481(%zero)
	fdiv	%f0, %f16, %f1
	floor	%f0, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f16, %f0
	fblt	%f0, %f17, fbgt_else.36976
	beqi	%a0, 0, bnei_else.36978
	add	%a0, %zero, %zero
	j	fbgt_cont.36977
bnei_else.36978:
	add	%a0, %zero, %k1
bnei_cont.36979:
	j	fbgt_cont.36977
fbgt_else.36976:
fbgt_cont.36977:
	fblt	%f0, %f17, fbgt_else.36980
	fsub	%f0, %f0, %f17
	j	fbgt_cont.36981
fbgt_else.36980:
fbgt_cont.36981:
	flw	%f16, 480(%zero)
	fblt	%f0, %f16, fbgt_else.36982
	fsub	%f0, %f17, %f0
	j	fbgt_cont.36983
fbgt_else.36982:
fbgt_cont.36983:
	flw	%f1, 479(%zero)
	fblt	%f1, %f0, fbgt_else.36984
	fmul	%f18, %f0, %f0
	fmul	%f17, %f18, %f18
	flw	%f1, 478(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f18
	fsub	%f16, %f0, %f1
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 476(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f0, %f16, %f0
	j	fbgt_cont.36985
fbgt_else.36984:
	fsub	%f0, %f16, %f0
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.36985:
	beqi	%a0, 0, bnei_else.36986
	j	bnei_cont.36987
bnei_else.36986:
	fneg	%f0, %f0
bnei_cont.36987:
	fmul	%f16, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f0, %f1, %f16
	fsw	%f0, 145(%zero)
	fsub	%f0, %f30, %f16
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.36925:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	fsub	%f1, %f1, %f0
	flw	%f18, 447(%zero)
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	flw	%f17, 446(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	flw	%f16, 449(%zero)
	fblt	%f0, %f16, fbgt_else.36989
	add	%a0, %zero, %zero
	j	fbgt_cont.36990
fbgt_else.36989:
	add	%a0, %zero, %k1
fbgt_cont.36990:
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fsub	%f1, %f1, %f0
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	fblt	%f0, %f16, fbgt_else.36991
	add	%a1, %zero, %zero
	j	fbgt_cont.36992
fbgt_else.36991:
	add	%a1, %zero, %k1
fbgt_cont.36992:
	beqi	%a0, 0, bnei_else.36993
	beqi	%a1, 0, bnei_else.36995
	flw	%f0, 451(%zero)
	j	bnei_cont.36994
bnei_else.36995:
	fmov	%f0, %fzero
bnei_cont.36996:
	j	bnei_cont.36994
bnei_else.36993:
	beqi	%a1, 0, bnei_else.36997
	fmov	%f0, %fzero
	j	bnei_cont.36998
bnei_else.36997:
	flw	%f0, 451(%zero)
bnei_cont.36998:
bnei_cont.36994:
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2966:
	fmov	%f27, %f0
	fmov	%f28, %f1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	blti	%v0, 0, bgti_else.37101
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -6
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.37102
	add	%a0, %zero, %zero
	j	fbgt_cont.37103
fbgt_else.37102:
	add	%a0, %zero, %k1
fbgt_cont.37103:
	beqi	%a0, 0, bnei_else.37104
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.37106
	add	%a0, %zero, %zero
	j	bnei_cont.37105
fbgt_else.37106:
	add	%a0, %zero, %k1
fbgt_cont.37107:
	j	bnei_cont.37105
bnei_else.37104:
	add	%a0, %zero, %zero
bnei_cont.37105:
	beqi	%a0, 0, bnei_else.37108
	lw	%a0, 141(%zero)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a1, %a1, %a0
	lw	%a0, 5(%sp)
	bne	%a1, %a0, bnei_cont.37109
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.37112
	j	bnei_cont.37109
bnei_else.37112:
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
	fblt	%fzero, %f16, fbgt_else.37114
	add	%a0, %zero, %zero
	j	fbgt_cont.37115
fbgt_else.37114:
	add	%a0, %zero, %k1
fbgt_cont.37115:
	beqi	%a0, 0, bnei_else.37116
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
	j	bnei_cont.37117
bnei_else.37116:
bnei_cont.37117:
	fblt	%fzero, %f17, fbgt_else.37118
	add	%a0, %zero, %zero
	j	fbgt_cont.37119
fbgt_else.37118:
	add	%a0, %zero, %k1
fbgt_cont.37119:
	beqi	%a0, 0, bnei_cont.37109
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
	j	bnei_cont.37109
bnei_else.37120:
bnei_cont.37121:
bnei_cont.37113:
	j	bnei_cont.37109
beq_else.37110:
beq_cont.37111:
	j	bnei_cont.37109
bnei_else.37108:
bnei_cont.37109:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	fmov	%f1, %f28
	fmov	%f0, %f27
	j	trace_reflections.2966
bgti_else.37101:
	jr	%ra
trace_ray.2971:
	fmov	%f3, %f0
	fsw	%f1, 0(%sp)
	sw	%v0, 1(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.37393
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
	fblt	%f0, %f1, fbgt_else.37394
	add	%a0, %zero, %zero
	j	fbgt_cont.37395
fbgt_else.37394:
	add	%a0, %zero, %k1
fbgt_cont.37395:
	beqi	%a0, 0, bnei_else.37396
	flw	%f1, 444(%zero)
	flw	%f0, 11(%sp)
	fblt	%f0, %f1, fbgt_else.37398
	add	%a0, %zero, %zero
	j	bnei_cont.37397
fbgt_else.37398:
	add	%a0, %zero, %k1
fbgt_cont.37399:
	j	bnei_cont.37397
bnei_else.37396:
	add	%a0, %zero, %zero
bnei_cont.37397:
	beqi	%a0, 0, bnei_else.37400
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
	flw	%f0, 0(%fp)
	fsw	%f0, 13(%sp)
	fmul	%f0, %f0, %f3
	fsw	%f0, 14(%sp)
	beqi	%a0, 1, bnei_else.37401
	beqi	%a0, 2, bnei_else.37403
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a1)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a1)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a1)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%s0)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%s0)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%s0)
	fmul	%f17, %f22, %f0
	beqi	%a3, 0, bnei_else.37405
	flw	%f16, 2(%a2)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a2)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 474(%zero)
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
	j	bnei_cont.37406
bnei_else.37405:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.37406:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.37407
	add	%a0, %zero, %k1
	j	fbeq_cont.37408
fbeq_else.37407:
	add	%a0, %zero, %zero
fbeq_cont.37408:
	beqi	%a0, 0, bnei_else.37409
	fmov	%f0, %f30
	j	bnei_cont.37410
bnei_else.37409:
	beqi	%ra, 0, bnei_else.37411
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.37412
bnei_else.37411:
	fdiv	%f0, %f30, %f1
bnei_cont.37412:
bnei_cont.37410:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.37402
bnei_else.37403:
	flw	%f0, 0(%s0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%s0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%s0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.37404:
	j	bnei_cont.37402
bnei_else.37401:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.37413
	add	%a0, %zero, %k1
	j	fbeq_cont.37414
fbeq_else.37413:
	add	%a0, %zero, %zero
fbeq_cont.37414:
	beqi	%a0, 0, bnei_else.37415
	fmov	%f0, %fzero
	j	bnei_cont.37416
bnei_else.37415:
	fblt	%fzero, %f0, fbgt_else.37417
	add	%a0, %zero, %zero
	j	fbgt_cont.37418
fbgt_else.37417:
	add	%a0, %zero, %k1
fbgt_cont.37418:
	beqi	%a0, 0, bnei_else.37419
	fmov	%f0, %f30
	j	bnei_cont.37420
bnei_else.37419:
	flw	%f0, 468(%zero)
bnei_cont.37420:
bnei_cont.37416:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.37402:
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
	jal	utexture.2959
	addi	%sp, %sp, -18
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
	flw	%f0, 15(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 16(%sp)
	fsw	%f0, 1(%a0)
	flw	%f0, 17(%sp)
	fsw	%f0, 2(%a0)
	flw	%f1, 474(%zero)
	flw	%f0, 13(%sp)
	fblt	%f0, %f1, fbgt_else.37421
	add	%a0, %zero, %zero
	j	fbgt_cont.37422
fbgt_else.37421:
	add	%a0, %zero, %k1
fbgt_cont.37422:
	beqi	%a0, 0, bnei_else.37423
	lw	%a1, 7(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%zero, 0(%at)
	j	bnei_cont.37424
bnei_else.37423:
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
bnei_cont.37424:
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
	flw	%f0, 1(%fp)
	fmul	%f0, %f3, %f0
	fsw	%f0, 18(%sp)
	lw	%v1, 10(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 19
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -19
	beqi	%v0, 0, bnei_else.37425
	j	bnei_cont.37426
bnei_else.37425:
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
	fblt	%fzero, %f16, fbgt_else.37427
	add	%a0, %zero, %zero
	j	fbgt_cont.37428
fbgt_else.37427:
	add	%a0, %zero, %k1
fbgt_cont.37428:
	beqi	%a0, 0, bnei_else.37429
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
	j	bnei_cont.37430
bnei_else.37429:
bnei_cont.37430:
	fblt	%fzero, %f17, fbgt_else.37431
	add	%a0, %zero, %zero
	j	fbgt_cont.37432
fbgt_else.37431:
	add	%a0, %zero, %k1
fbgt_cont.37432:
	beqi	%a0, 0, bnei_else.37433
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
	j	bnei_cont.37434
bnei_else.37433:
bnei_cont.37434:
bnei_cont.37426:
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
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -19
	lw	%a0, 434(%zero)
	addi	%v0, %a0, -1
	flw	%f1, 18(%sp)
	flw	%f0, 14(%sp)
	lw	%v1, 2(%sp)
	addi	%sp, %sp, 19
	jal	trace_reflections.2966
	addi	%sp, %sp, -19
	flw	%f0, 441(%zero)
	fblt	%f0, %f3, fbgt_else.37435
	add	%a0, %zero, %zero
	j	fbgt_cont.37436
fbgt_else.37435:
	add	%a0, %zero, %k1
fbgt_cont.37436:
	beqi	%a0, 0, bnei_else.37437
	lw	%a0, 1(%sp)
	blti	%a0, 4, bgti_else.37438
	j	bgti_cont.37439
bgti_else.37438:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 8(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.37439:
	lw	%a0, 12(%sp)
	beqi	%a0, 2, bnei_else.37440
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.37440:
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
	j	trace_ray.2971
bnei_else.37437:
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.37400:
	addi	%a2, %zero, -1
	lw	%a1, 8(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.37443
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
	fblt	%fzero, %f1, fbgt_else.37444
	add	%a0, %zero, %zero
	j	fbgt_cont.37445
fbgt_else.37444:
	add	%a0, %zero, %k1
fbgt_cont.37445:
	beqi	%a0, 0, bnei_else.37446
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
bnei_else.37446:
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.37443:
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.37393:
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
	blti	%a1, 0, bgti_else.38459
	add	%at, %v0, %a1
	lw	%t1, 0(%at)
	lw	%k0, 1(%t1)
	lw	%t0, 0(%t1)
	flw	%f21, 0(%t0)
	flw	%f27, 0(%v1)
	fmul	%f1, %f21, %f27
	flw	%f19, 1(%t0)
	flw	%f28, 1(%v1)
	fmul	%f0, %f19, %f28
	fadd	%f16, %f1, %f0
	flw	%f1, 2(%t0)
	flw	%f29, 2(%v1)
	fmul	%f0, %f1, %f29
	fadd	%f16, %f16, %f0
	fblt	%f16, %fzero, fbgt_else.38460
	add	%a0, %zero, %zero
	j	fbgt_cont.38461
fbgt_else.38460:
	add	%a0, %zero, %k1
fbgt_cont.38461:
	beqi	%a0, 0, bnei_else.38462
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
	lw	%s6, 0(%t1)
	lw	%ra, 0(%s6)
	beqi	%ra, -1, bnei_else.38464
	beqi	%ra, 99, bnei_else.38466
	lw	%a0, 12(%ra)
	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	flw	%f20, 0(%a3)
	flw	%f16, 1(%a3)
	flw	%f18, 2(%a3)
	lw	%a0, 1(%t0)
	lw	%k0, 0(%t0)
	add	%at, %a0, %ra
	lw	%ra, 0(%at)
	beqi	%a1, 1, bnei_else.38468
	beqi	%a1, 2, bnei_else.38470
	flw	%f17, 0(%ra)
	fbne	%f17, %fzero, fbeq_else.38472
	add	%a0, %zero, %k1
	j	fbeq_cont.38473
fbeq_else.38472:
	add	%a0, %zero, %zero
fbeq_cont.38473:
	beqi	%a0, 0, bnei_else.38474
	add	%a0, %zero, %zero
	j	bnei_cont.38469
bnei_else.38474:
	flw	%f0, 1(%ra)
	fmul	%f1, %f0, %f20
	flw	%f0, 2(%ra)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a3)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.38476
	add	%a0, %zero, %zero
	j	fbgt_cont.38477
fbgt_else.38476:
	add	%a0, %zero, %k1
fbgt_cont.38477:
	beqi	%a0, 0, bnei_else.38478
	beqi	%a2, 0, bnei_else.38480
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38481
bnei_else.38480:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38481:
	add	%a0, %zero, %k1
	j	bnei_cont.38469
bnei_else.38478:
	add	%a0, %zero, %zero
bnei_cont.38479:
bnei_cont.38475:
	j	bnei_cont.38469
bnei_else.38470:
	flw	%f1, 0(%ra)
	fblt	%f1, %fzero, fbgt_else.38482
	add	%a0, %zero, %zero
	j	fbgt_cont.38483
fbgt_else.38482:
	add	%a0, %zero, %k1
fbgt_cont.38483:
	beqi	%a0, 0, bnei_else.38484
	flw	%f0, 3(%a3)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38469
bnei_else.38484:
	add	%a0, %zero, %zero
bnei_cont.38485:
bnei_cont.38471:
	j	bnei_cont.38469
bnei_else.38468:
	flw	%f0, 0(%ra)
	fsub	%f0, %f0, %f20
	flw	%f2, 1(%ra)
	fmul	%f21, %f0, %f2
	flw	%f19, 1(%k0)
	fmul	%f0, %f21, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%fp)
	fblt	%f0, %f17, fbgt_else.38486
	add	%a0, %zero, %zero
	j	fbgt_cont.38487
fbgt_else.38486:
	add	%a0, %zero, %k1
fbgt_cont.38487:
	beqi	%a0, 0, bnei_else.38488
	flw	%f0, 2(%k0)
	fmul	%f0, %f21, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.38490
	add	%a0, %zero, %zero
	j	fbgt_cont.38491
fbgt_else.38490:
	add	%a0, %zero, %k1
fbgt_cont.38491:
	beqi	%a0, 0, bnei_else.38492
	fbne	%f2, %fzero, fbeq_else.38494
	add	%a0, %zero, %k1
	j	fbeq_cont.38495
fbeq_else.38494:
	add	%a0, %zero, %zero
fbeq_cont.38495:
	beqi	%a0, 0, bnei_else.38496
	add	%a0, %zero, %zero
	j	bnei_cont.38489
bnei_else.38496:
	add	%a0, %zero, %k1
bnei_cont.38497:
	j	bnei_cont.38489
bnei_else.38492:
	add	%a0, %zero, %zero
bnei_cont.38493:
	j	bnei_cont.38489
bnei_else.38488:
	add	%a0, %zero, %zero
bnei_cont.38489:
	beqi	%a0, 0, bnei_else.38498
	fsw	%f21, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38499
bnei_else.38498:
	flw	%f0, 2(%ra)
	fsub	%f0, %f0, %f16
	flw	%f22, 3(%ra)
	fmul	%f23, %f0, %f22
	flw	%f21, 0(%k0)
	fmul	%f0, %f23, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	flw	%f2, 0(%fp)
	fblt	%f0, %f2, fbgt_else.38500
	add	%a0, %zero, %zero
	j	fbgt_cont.38501
fbgt_else.38500:
	add	%a0, %zero, %k1
fbgt_cont.38501:
	beqi	%a0, 0, bnei_else.38502
	flw	%f0, 2(%k0)
	fmul	%f0, %f23, %f0
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%fp)
	fblt	%f1, %f0, fbgt_else.38504
	add	%a0, %zero, %zero
	j	fbgt_cont.38505
fbgt_else.38504:
	add	%a0, %zero, %k1
fbgt_cont.38505:
	beqi	%a0, 0, bnei_else.38506
	fbne	%f22, %fzero, fbeq_else.38508
	add	%a0, %zero, %k1
	j	fbeq_cont.38509
fbeq_else.38508:
	add	%a0, %zero, %zero
fbeq_cont.38509:
	beqi	%a0, 0, bnei_else.38510
	add	%a0, %zero, %zero
	j	bnei_cont.38503
bnei_else.38510:
	add	%a0, %zero, %k1
bnei_cont.38511:
	j	bnei_cont.38503
bnei_else.38506:
	add	%a0, %zero, %zero
bnei_cont.38507:
	j	bnei_cont.38503
bnei_else.38502:
	add	%a0, %zero, %zero
bnei_cont.38503:
	beqi	%a0, 0, bnei_else.38512
	fsw	%f23, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.38513
bnei_else.38512:
	flw	%f0, 4(%ra)
	fsub	%f0, %f0, %f18
	flw	%f1, 5(%ra)
	fmul	%f18, %f0, %f1
	fmul	%f0, %f18, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.38514
	add	%a0, %zero, %zero
	j	fbgt_cont.38515
fbgt_else.38514:
	add	%a0, %zero, %k1
fbgt_cont.38515:
	beqi	%a0, 0, bnei_else.38516
	fmul	%f0, %f18, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.38518
	add	%a0, %zero, %zero
	j	fbgt_cont.38519
fbgt_else.38518:
	add	%a0, %zero, %k1
fbgt_cont.38519:
	beqi	%a0, 0, bnei_else.38520
	fbne	%f1, %fzero, fbeq_else.38522
	add	%a0, %zero, %k1
	j	fbeq_cont.38523
fbeq_else.38522:
	add	%a0, %zero, %zero
fbeq_cont.38523:
	beqi	%a0, 0, bnei_else.38524
	add	%a0, %zero, %zero
	j	bnei_cont.38517
bnei_else.38524:
	add	%a0, %zero, %k1
bnei_cont.38525:
	j	bnei_cont.38517
bnei_else.38520:
	add	%a0, %zero, %zero
bnei_cont.38521:
	j	bnei_cont.38517
bnei_else.38516:
	add	%a0, %zero, %zero
bnei_cont.38517:
	beqi	%a0, 0, bnei_else.38526
	fsw	%f18, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.38527
bnei_else.38526:
	add	%a0, %zero, %zero
bnei_cont.38527:
bnei_cont.38513:
bnei_cont.38499:
bnei_cont.38469:
	beqi	%a0, 0, bnei_cont.38467
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38530
	add	%a0, %zero, %zero
	j	fbgt_cont.38531
fbgt_else.38530:
	add	%a0, %zero, %k1
fbgt_cont.38531:
	beqi	%a0, 0, bnei_cont.38467
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.38467
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.38467
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.38467
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.38467
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
	j	bnei_cont.38467
bnei_else.38540:
bnei_cont.38541:
	j	bnei_cont.38467
bnei_else.38538:
bnei_cont.38539:
	j	bnei_cont.38467
bnei_else.38536:
bnei_cont.38537:
	j	bnei_cont.38467
bnei_else.38534:
bnei_cont.38535:
	j	bnei_cont.38467
bnei_else.38532:
bnei_cont.38533:
	j	bnei_cont.38467
bnei_else.38528:
bnei_cont.38529:
	j	bnei_cont.38467
bnei_else.38466:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.38542
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.38543
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.38543
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.38543
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
	j	bnei_cont.38543
bnei_else.38548:
bnei_cont.38549:
	j	bnei_cont.38543
bnei_else.38546:
bnei_cont.38547:
	j	bnei_cont.38543
bnei_else.38544:
bnei_cont.38545:
	j	bnei_cont.38543
bnei_else.38542:
bnei_cont.38543:
bnei_cont.38467:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -8
	j	bnei_cont.38465
bnei_else.38464:
bnei_cont.38465:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.38550
	add	%a0, %zero, %zero
	j	fbgt_cont.38551
fbgt_else.38550:
	add	%a0, %zero, %k1
fbgt_cont.38551:
	beqi	%a0, 0, bnei_else.38552
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38554
	add	%a0, %zero, %zero
	j	bnei_cont.38553
fbgt_else.38554:
	add	%a0, %zero, %k1
fbgt_cont.38555:
	j	bnei_cont.38553
bnei_else.38552:
	add	%a0, %zero, %zero
bnei_cont.38553:
	beqi	%a0, 0, bnei_cont.38463
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
	beqi	%k0, 1, bnei_else.38558
	beqi	%k0, 2, bnei_else.38560
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f19, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f2, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.38562
	flw	%f16, 2(%a1)
	fmul	%f1, %f2, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f18, 474(%zero)
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
	j	bnei_cont.38563
bnei_else.38562:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.38563:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38564
	add	%a0, %zero, %k1
	j	fbeq_cont.38565
fbeq_else.38564:
	add	%a0, %zero, %zero
fbeq_cont.38565:
	beqi	%a0, 0, bnei_else.38566
	fmov	%f0, %f30
	j	bnei_cont.38567
bnei_else.38566:
	beqi	%a3, 0, bnei_else.38568
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38569
bnei_else.38568:
	fdiv	%f0, %f30, %f1
bnei_cont.38569:
bnei_cont.38567:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38559
bnei_else.38560:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38561:
	j	bnei_cont.38559
bnei_else.38558:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38570
	add	%a0, %zero, %k1
	j	fbeq_cont.38571
fbeq_else.38570:
	add	%a0, %zero, %zero
fbeq_cont.38571:
	beqi	%a0, 0, bnei_else.38572
	fmov	%f0, %fzero
	j	bnei_cont.38573
bnei_else.38572:
	fblt	%fzero, %f0, fbgt_else.38574
	add	%a0, %zero, %zero
	j	fbgt_cont.38575
fbgt_else.38574:
	add	%a0, %zero, %k1
fbgt_cont.38575:
	beqi	%a0, 0, bnei_else.38576
	fmov	%f0, %f30
	j	bnei_cont.38577
bnei_else.38576:
	flw	%f0, 468(%zero)
bnei_cont.38577:
bnei_cont.38573:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38559:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.38578
	j	bnei_cont.38463
bnei_else.38578:
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
	fblt	%fzero, %f0, fbgt_else.38580
	add	%a0, %zero, %zero
	j	fbgt_cont.38581
fbgt_else.38580:
	add	%a0, %zero, %k1
fbgt_cont.38581:
	beqi	%a0, 0, bnei_else.38582
	j	bnei_cont.38583
bnei_else.38582:
	fmov	%f0, %fzero
bnei_cont.38583:
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
bnei_cont.38579:
	j	bnei_cont.38463
bnei_else.38556:
bnei_cont.38557:
	j	bnei_cont.38463
bnei_else.38462:
	flw	%f0, 439(%zero)
	fdiv	%f3, %f16, %f0
	flw	%f0, 445(%zero)
	fsw	%f0, 137(%zero)
	lw	%t2, 134(%zero)
	lw	%s6, 0(%t2)
	lw	%fp, 0(%s6)
	beqi	%fp, -1, bnei_else.38584
	beqi	%fp, 99, bnei_else.38586
	lw	%a0, 12(%fp)
	lw	%a2, 10(%a0)
	lw	%a1, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%a0, 1(%a0)
	flw	%f20, 0(%a2)
	flw	%f16, 1(%a2)
	flw	%f18, 2(%a2)
	add	%at, %k0, %fp
	lw	%fp, 0(%at)
	beqi	%a0, 1, bnei_else.38588
	beqi	%a0, 2, bnei_else.38590
	flw	%f17, 0(%fp)
	fbne	%f17, %fzero, fbeq_else.38592
	add	%a0, %zero, %k1
	j	fbeq_cont.38593
fbeq_else.38592:
	add	%a0, %zero, %zero
fbeq_cont.38593:
	beqi	%a0, 0, bnei_else.38594
	add	%a0, %zero, %zero
	j	bnei_cont.38589
bnei_else.38594:
	flw	%f0, 1(%fp)
	fmul	%f1, %f0, %f20
	flw	%f0, 2(%fp)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%fp)
	fmul	%f0, %f0, %f18
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.38596
	add	%a0, %zero, %zero
	j	fbgt_cont.38597
fbgt_else.38596:
	add	%a0, %zero, %k1
fbgt_cont.38597:
	beqi	%a0, 0, bnei_else.38598
	beqi	%a1, 0, bnei_else.38600
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.38601
bnei_else.38600:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%fp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.38601:
	add	%a0, %zero, %k1
	j	bnei_cont.38589
bnei_else.38598:
	add	%a0, %zero, %zero
bnei_cont.38599:
bnei_cont.38595:
	j	bnei_cont.38589
bnei_else.38590:
	flw	%f1, 0(%fp)
	fblt	%f1, %fzero, fbgt_else.38602
	add	%a0, %zero, %zero
	j	fbgt_cont.38603
fbgt_else.38602:
	add	%a0, %zero, %k1
fbgt_cont.38603:
	beqi	%a0, 0, bnei_else.38604
	flw	%f0, 3(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38589
bnei_else.38604:
	add	%a0, %zero, %zero
bnei_cont.38605:
bnei_cont.38591:
	j	bnei_cont.38589
bnei_else.38588:
	flw	%f0, 0(%fp)
	fsub	%f0, %f0, %f20
	flw	%f22, 1(%fp)
	fmul	%f23, %f0, %f22
	fmul	%f0, %f23, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	flw	%f17, 1(%a3)
	fblt	%f0, %f17, fbgt_else.38606
	add	%a0, %zero, %zero
	j	fbgt_cont.38607
fbgt_else.38606:
	add	%a0, %zero, %k1
fbgt_cont.38607:
	beqi	%a0, 0, bnei_else.38608
	fmul	%f0, %f23, %f1
	fadd	%f0, %f0, %f18
	fabs	%f2, %f0
	flw	%f0, 2(%a3)
	fblt	%f2, %f0, fbgt_else.38610
	add	%a0, %zero, %zero
	j	fbgt_cont.38611
fbgt_else.38610:
	add	%a0, %zero, %k1
fbgt_cont.38611:
	beqi	%a0, 0, bnei_else.38612
	fbne	%f22, %fzero, fbeq_else.38614
	add	%a0, %zero, %k1
	j	fbeq_cont.38615
fbeq_else.38614:
	add	%a0, %zero, %zero
fbeq_cont.38615:
	beqi	%a0, 0, bnei_else.38616
	add	%a0, %zero, %zero
	j	bnei_cont.38609
bnei_else.38616:
	add	%a0, %zero, %k1
bnei_cont.38617:
	j	bnei_cont.38609
bnei_else.38612:
	add	%a0, %zero, %zero
bnei_cont.38613:
	j	bnei_cont.38609
bnei_else.38608:
	add	%a0, %zero, %zero
bnei_cont.38609:
	beqi	%a0, 0, bnei_else.38618
	fsw	%f23, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.38619
bnei_else.38618:
	flw	%f0, 2(%fp)
	fsub	%f0, %f0, %f16
	flw	%f22, 3(%fp)
	fmul	%f23, %f0, %f22
	fmul	%f0, %f23, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	flw	%f2, 0(%a3)
	fblt	%f0, %f2, fbgt_else.38620
	add	%a0, %zero, %zero
	j	fbgt_cont.38621
fbgt_else.38620:
	add	%a0, %zero, %k1
fbgt_cont.38621:
	beqi	%a0, 0, bnei_else.38622
	fmul	%f0, %f23, %f1
	fadd	%f0, %f0, %f18
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.38624
	add	%a0, %zero, %zero
	j	fbgt_cont.38625
fbgt_else.38624:
	add	%a0, %zero, %k1
fbgt_cont.38625:
	beqi	%a0, 0, bnei_else.38626
	fbne	%f22, %fzero, fbeq_else.38628
	add	%a0, %zero, %k1
	j	fbeq_cont.38629
fbeq_else.38628:
	add	%a0, %zero, %zero
fbeq_cont.38629:
	beqi	%a0, 0, bnei_else.38630
	add	%a0, %zero, %zero
	j	bnei_cont.38623
bnei_else.38630:
	add	%a0, %zero, %k1
bnei_cont.38631:
	j	bnei_cont.38623
bnei_else.38626:
	add	%a0, %zero, %zero
bnei_cont.38627:
	j	bnei_cont.38623
bnei_else.38622:
	add	%a0, %zero, %zero
bnei_cont.38623:
	beqi	%a0, 0, bnei_else.38632
	fsw	%f23, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.38633
bnei_else.38632:
	flw	%f0, 4(%fp)
	fsub	%f0, %f0, %f18
	flw	%f1, 5(%fp)
	fmul	%f18, %f0, %f1
	fmul	%f0, %f18, %f21
	fadd	%f0, %f0, %f20
	fabs	%f0, %f0
	fblt	%f0, %f2, fbgt_else.38634
	add	%a0, %zero, %zero
	j	fbgt_cont.38635
fbgt_else.38634:
	add	%a0, %zero, %k1
fbgt_cont.38635:
	beqi	%a0, 0, bnei_else.38636
	fmul	%f0, %f18, %f19
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fblt	%f0, %f17, fbgt_else.38638
	add	%a0, %zero, %zero
	j	fbgt_cont.38639
fbgt_else.38638:
	add	%a0, %zero, %k1
fbgt_cont.38639:
	beqi	%a0, 0, bnei_else.38640
	fbne	%f1, %fzero, fbeq_else.38642
	add	%a0, %zero, %k1
	j	fbeq_cont.38643
fbeq_else.38642:
	add	%a0, %zero, %zero
fbeq_cont.38643:
	beqi	%a0, 0, bnei_else.38644
	add	%a0, %zero, %zero
	j	bnei_cont.38637
bnei_else.38644:
	add	%a0, %zero, %k1
bnei_cont.38645:
	j	bnei_cont.38637
bnei_else.38640:
	add	%a0, %zero, %zero
bnei_cont.38641:
	j	bnei_cont.38637
bnei_else.38636:
	add	%a0, %zero, %zero
bnei_cont.38637:
	beqi	%a0, 0, bnei_else.38646
	fsw	%f18, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.38647
bnei_else.38646:
	add	%a0, %zero, %zero
bnei_cont.38647:
bnei_cont.38633:
bnei_cont.38619:
bnei_cont.38589:
	beqi	%a0, 0, bnei_cont.38587
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.38650
	add	%a0, %zero, %zero
	j	fbgt_cont.38651
fbgt_else.38650:
	add	%a0, %zero, %k1
fbgt_cont.38651:
	beqi	%a0, 0, bnei_cont.38587
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_cont.38587
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.38587
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.38587
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.38587
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
	j	bnei_cont.38587
bnei_else.38660:
bnei_cont.38661:
	j	bnei_cont.38587
bnei_else.38658:
bnei_cont.38659:
	j	bnei_cont.38587
bnei_else.38656:
bnei_cont.38657:
	j	bnei_cont.38587
bnei_else.38654:
bnei_cont.38655:
	j	bnei_cont.38587
bnei_else.38652:
bnei_cont.38653:
	j	bnei_cont.38587
bnei_else.38648:
bnei_cont.38649:
	j	bnei_cont.38587
bnei_else.38586:
	lw	%a0, 1(%s6)
	beqi	%a0, -1, bnei_else.38662
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 2(%s6)
	beqi	%a0, -1, bnei_cont.38663
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 3(%s6)
	beqi	%a0, -1, bnei_cont.38663
	lw	%v1, 83(%a0)
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%a0, 4(%s6)
	beqi	%a0, -1, bnei_cont.38663
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
	j	bnei_cont.38663
bnei_else.38668:
bnei_cont.38669:
	j	bnei_cont.38663
bnei_else.38666:
bnei_cont.38667:
	j	bnei_cont.38663
bnei_else.38664:
bnei_cont.38665:
	j	bnei_cont.38663
bnei_else.38662:
bnei_cont.38663:
bnei_cont.38587:
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -8
	j	bnei_cont.38585
bnei_else.38584:
bnei_cont.38585:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.38670
	add	%a0, %zero, %zero
	j	fbgt_cont.38671
fbgt_else.38670:
	add	%a0, %zero, %k1
fbgt_cont.38671:
	beqi	%a0, 0, bnei_else.38672
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38674
	add	%a0, %zero, %zero
	j	bnei_cont.38673
fbgt_else.38674:
	add	%a0, %zero, %k1
fbgt_cont.38675:
	j	bnei_cont.38673
bnei_else.38672:
	add	%a0, %zero, %zero
bnei_cont.38673:
	beqi	%a0, 0, bnei_else.38676
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t1, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.38678
	beqi	%k0, 2, bnei_else.38680
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f2, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f19, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f2, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.38682
	flw	%f16, 2(%a1)
	fmul	%f1, %f2, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f18, 474(%zero)
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
	j	bnei_cont.38683
bnei_else.38682:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.38683:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38684
	add	%a0, %zero, %k1
	j	fbeq_cont.38685
fbeq_else.38684:
	add	%a0, %zero, %zero
fbeq_cont.38685:
	beqi	%a0, 0, bnei_else.38686
	fmov	%f0, %f30
	j	bnei_cont.38687
bnei_else.38686:
	beqi	%a3, 0, bnei_else.38688
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38689
bnei_else.38688:
	fdiv	%f0, %f30, %f1
bnei_cont.38689:
bnei_cont.38687:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38679
bnei_else.38680:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38681:
	j	bnei_cont.38679
bnei_else.38678:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38690
	add	%a0, %zero, %k1
	j	fbeq_cont.38691
fbeq_else.38690:
	add	%a0, %zero, %zero
fbeq_cont.38691:
	beqi	%a0, 0, bnei_else.38692
	fmov	%f0, %fzero
	j	bnei_cont.38693
bnei_else.38692:
	fblt	%fzero, %f0, fbgt_else.38694
	add	%a0, %zero, %zero
	j	fbgt_cont.38695
fbgt_else.38694:
	add	%a0, %zero, %k1
fbgt_cont.38695:
	beqi	%a0, 0, bnei_else.38696
	fmov	%f0, %f30
	j	bnei_cont.38697
bnei_else.38696:
	flw	%f0, 468(%zero)
bnei_cont.38697:
bnei_cont.38693:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38679:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.38698
	j	bnei_cont.38677
bnei_else.38698:
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
	fblt	%fzero, %f0, fbgt_else.38700
	add	%a0, %zero, %zero
	j	fbgt_cont.38701
fbgt_else.38700:
	add	%a0, %zero, %k1
fbgt_cont.38701:
	beqi	%a0, 0, bnei_else.38702
	j	bnei_cont.38703
bnei_else.38702:
	fmov	%f0, %fzero
bnei_cont.38703:
	fmul	%f1, %f3, %f0
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
bnei_cont.38699:
	j	bnei_cont.38677
bnei_else.38676:
bnei_cont.38677:
bnei_cont.38463:
	lw	%a0, 3(%sp)
	addi	%t0, %a0, -2
	blti	%t0, 0, bgti_else.38704
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
	fblt	%f1, %fzero, fbgt_else.38705
	add	%a1, %zero, %zero
	j	fbgt_cont.38706
fbgt_else.38705:
	add	%a1, %zero, %k1
fbgt_cont.38706:
	beqi	%a1, 0, bnei_else.38707
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.38709
	add	%a0, %zero, %zero
	j	fbgt_cont.38710
fbgt_else.38709:
	add	%a0, %zero, %k1
fbgt_cont.38710:
	beqi	%a0, 0, bnei_else.38711
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38713
	add	%a0, %zero, %zero
	j	bnei_cont.38712
fbgt_else.38713:
	add	%a0, %zero, %k1
fbgt_cont.38714:
	j	bnei_cont.38712
bnei_else.38711:
	add	%a0, %zero, %zero
bnei_cont.38712:
	beqi	%a0, 0, bnei_cont.38708
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
	beqi	%k0, 1, bnei_else.38717
	beqi	%k0, 2, bnei_else.38719
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.38721
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 474(%zero)
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
	j	bnei_cont.38722
bnei_else.38721:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.38722:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38723
	add	%a0, %zero, %k1
	j	fbeq_cont.38724
fbeq_else.38723:
	add	%a0, %zero, %zero
fbeq_cont.38724:
	beqi	%a0, 0, bnei_else.38725
	fmov	%f0, %f30
	j	bnei_cont.38726
bnei_else.38725:
	beqi	%a3, 0, bnei_else.38727
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38728
bnei_else.38727:
	fdiv	%f0, %f30, %f1
bnei_cont.38728:
bnei_cont.38726:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38718
bnei_else.38719:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38720:
	j	bnei_cont.38718
bnei_else.38717:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38729
	add	%a0, %zero, %k1
	j	fbeq_cont.38730
fbeq_else.38729:
	add	%a0, %zero, %zero
fbeq_cont.38730:
	beqi	%a0, 0, bnei_else.38731
	fmov	%f0, %fzero
	j	bnei_cont.38732
bnei_else.38731:
	fblt	%fzero, %f0, fbgt_else.38733
	add	%a0, %zero, %zero
	j	fbgt_cont.38734
fbgt_else.38733:
	add	%a0, %zero, %k1
fbgt_cont.38734:
	beqi	%a0, 0, bnei_else.38735
	fmov	%f0, %f30
	j	bnei_cont.38736
bnei_else.38735:
	flw	%f0, 468(%zero)
bnei_cont.38736:
bnei_cont.38732:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38718:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.38737
	j	bnei_cont.38708
bnei_else.38737:
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
	fblt	%fzero, %f0, fbgt_else.38739
	add	%a0, %zero, %zero
	j	fbgt_cont.38740
fbgt_else.38739:
	add	%a0, %zero, %k1
fbgt_cont.38740:
	beqi	%a0, 0, bnei_else.38741
	j	bnei_cont.38742
bnei_else.38741:
	fmov	%f0, %fzero
bnei_cont.38742:
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
bnei_cont.38738:
	j	bnei_cont.38708
bnei_else.38715:
bnei_cont.38716:
	j	bnei_cont.38708
bnei_else.38707:
	flw	%f0, 439(%zero)
	fdiv	%f27, %f1, %f0
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
	fblt	%f0, %f1, fbgt_else.38743
	add	%a0, %zero, %zero
	j	fbgt_cont.38744
fbgt_else.38743:
	add	%a0, %zero, %k1
fbgt_cont.38744:
	beqi	%a0, 0, bnei_else.38745
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.38747
	add	%a0, %zero, %zero
	j	bnei_cont.38746
fbgt_else.38747:
	add	%a0, %zero, %k1
fbgt_cont.38748:
	j	bnei_cont.38746
bnei_else.38745:
	add	%a0, %zero, %zero
bnei_cont.38746:
	beqi	%a0, 0, bnei_else.38749
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.38751
	beqi	%k0, 2, bnei_else.38753
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.38755
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 474(%zero)
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
	j	bnei_cont.38756
bnei_else.38755:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.38756:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.38757
	add	%a0, %zero, %k1
	j	fbeq_cont.38758
fbeq_else.38757:
	add	%a0, %zero, %zero
fbeq_cont.38758:
	beqi	%a0, 0, bnei_else.38759
	fmov	%f0, %f30
	j	bnei_cont.38760
bnei_else.38759:
	beqi	%a3, 0, bnei_else.38761
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.38762
bnei_else.38761:
	fdiv	%f0, %f30, %f1
bnei_cont.38762:
bnei_cont.38760:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.38752
bnei_else.38753:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.38754:
	j	bnei_cont.38752
bnei_else.38751:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t1, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.38763
	add	%a0, %zero, %k1
	j	fbeq_cont.38764
fbeq_else.38763:
	add	%a0, %zero, %zero
fbeq_cont.38764:
	beqi	%a0, 0, bnei_else.38765
	fmov	%f0, %fzero
	j	bnei_cont.38766
bnei_else.38765:
	fblt	%fzero, %f0, fbgt_else.38767
	add	%a0, %zero, %zero
	j	fbgt_cont.38768
fbgt_else.38767:
	add	%a0, %zero, %k1
fbgt_cont.38768:
	beqi	%a0, 0, bnei_else.38769
	fmov	%f0, %f30
	j	bnei_cont.38770
bnei_else.38769:
	flw	%f0, 468(%zero)
bnei_cont.38770:
bnei_cont.38766:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.38752:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8
	jal	utexture.2959
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.38771
	j	bnei_cont.38750
bnei_else.38771:
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
	fblt	%fzero, %f0, fbgt_else.38773
	add	%a0, %zero, %zero
	j	fbgt_cont.38774
fbgt_else.38773:
	add	%a0, %zero, %k1
fbgt_cont.38774:
	beqi	%a0, 0, bnei_else.38775
	j	bnei_cont.38776
bnei_else.38775:
	fmov	%f0, %fzero
bnei_cont.38776:
	fmul	%f1, %f27, %f0
	flw	%f0, 0(%t9)
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
bnei_cont.38772:
	j	bnei_cont.38750
bnei_else.38749:
bnei_cont.38750:
bnei_cont.38708:
	addi	%a1, %t0, -2
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.38704:
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bgti_else.38459:
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
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%t0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%t0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.39032
	add	%a1, %zero, %zero
	j	fbgt_cont.39033
fbgt_else.39032:
	add	%a1, %zero, %k1
fbgt_cont.39033:
	beqi	%a1, 0, bnei_else.39034
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -7
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
	beqi	%a0, 0, bnei_cont.39035
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
	beqi	%k0, 1, bnei_else.39044
	beqi	%k0, 2, bnei_else.39046
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.39048
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 474(%zero)
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
	j	bnei_cont.39049
bnei_else.39048:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.39049:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.39050
	add	%a0, %zero, %k1
	j	fbeq_cont.39051
fbeq_else.39050:
	add	%a0, %zero, %zero
fbeq_cont.39051:
	beqi	%a0, 0, bnei_else.39052
	fmov	%f0, %f30
	j	bnei_cont.39053
bnei_else.39052:
	beqi	%a3, 0, bnei_else.39054
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39055
bnei_else.39054:
	fdiv	%f0, %f30, %f1
bnei_cont.39055:
bnei_cont.39053:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39045
bnei_else.39046:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.39047:
	j	bnei_cont.39045
bnei_else.39044:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.39056
	add	%a0, %zero, %k1
	j	fbeq_cont.39057
fbeq_else.39056:
	add	%a0, %zero, %zero
fbeq_cont.39057:
	beqi	%a0, 0, bnei_else.39058
	fmov	%f0, %fzero
	j	bnei_cont.39059
bnei_else.39058:
	fblt	%fzero, %f0, fbgt_else.39060
	add	%a0, %zero, %zero
	j	fbgt_cont.39061
fbgt_else.39060:
	add	%a0, %zero, %k1
fbgt_cont.39061:
	beqi	%a0, 0, bnei_else.39062
	fmov	%f0, %f30
	j	bnei_cont.39063
bnei_else.39062:
	flw	%f0, 468(%zero)
bnei_cont.39063:
bnei_cont.39059:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.39045:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	jal	utexture.2959
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.39064
	j	bnei_cont.39035
bnei_else.39064:
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
	fblt	%fzero, %f0, fbgt_else.39066
	add	%a0, %zero, %zero
	j	fbgt_cont.39067
fbgt_else.39066:
	add	%a0, %zero, %k1
fbgt_cont.39067:
	beqi	%a0, 0, bnei_else.39068
	j	bnei_cont.39069
bnei_else.39068:
	fmov	%f0, %fzero
bnei_cont.39069:
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
bnei_cont.39065:
	j	bnei_cont.39035
bnei_else.39042:
bnei_cont.39043:
	j	bnei_cont.39035
bnei_else.39034:
	flw	%f0, 439(%zero)
	fdiv	%f27, %f1, %f0
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
	fblt	%f0, %f1, fbgt_else.39070
	add	%a0, %zero, %zero
	j	fbgt_cont.39071
fbgt_else.39070:
	add	%a0, %zero, %k1
fbgt_cont.39071:
	beqi	%a0, 0, bnei_else.39072
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.39074
	add	%a0, %zero, %zero
	j	bnei_cont.39073
fbgt_else.39074:
	add	%a0, %zero, %k1
fbgt_cont.39075:
	j	bnei_cont.39073
bnei_else.39072:
	add	%a0, %zero, %zero
bnei_cont.39073:
	beqi	%a0, 0, bnei_else.39076
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t2, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.39078
	beqi	%k0, 2, bnei_else.39080
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.39082
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 474(%zero)
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
	j	bnei_cont.39083
bnei_else.39082:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.39083:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.39084
	add	%a0, %zero, %k1
	j	fbeq_cont.39085
fbeq_else.39084:
	add	%a0, %zero, %zero
fbeq_cont.39085:
	beqi	%a0, 0, bnei_else.39086
	fmov	%f0, %f30
	j	bnei_cont.39087
bnei_else.39086:
	beqi	%a3, 0, bnei_else.39088
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39089
bnei_else.39088:
	fdiv	%f0, %f30, %f1
bnei_cont.39089:
bnei_cont.39087:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39079
bnei_else.39080:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.39081:
	j	bnei_cont.39079
bnei_else.39078:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.39090
	add	%a0, %zero, %k1
	j	fbeq_cont.39091
fbeq_else.39090:
	add	%a0, %zero, %zero
fbeq_cont.39091:
	beqi	%a0, 0, bnei_else.39092
	fmov	%f0, %fzero
	j	bnei_cont.39093
bnei_else.39092:
	fblt	%fzero, %f0, fbgt_else.39094
	add	%a0, %zero, %zero
	j	fbgt_cont.39095
fbgt_else.39094:
	add	%a0, %zero, %k1
fbgt_cont.39095:
	beqi	%a0, 0, bnei_else.39096
	fmov	%f0, %f30
	j	bnei_cont.39097
bnei_else.39096:
	flw	%f0, 468(%zero)
bnei_cont.39097:
bnei_cont.39093:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.39079:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7
	jal	utexture.2959
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.39098
	j	bnei_cont.39077
bnei_else.39098:
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
	fblt	%fzero, %f0, fbgt_else.39100
	add	%a0, %zero, %zero
	j	fbgt_cont.39101
fbgt_else.39100:
	add	%a0, %zero, %k1
fbgt_cont.39101:
	beqi	%a0, 0, bnei_else.39102
	j	bnei_cont.39103
bnei_else.39102:
	fmov	%f0, %fzero
bnei_cont.39103:
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
bnei_cont.39099:
	j	bnei_cont.39077
bnei_else.39076:
bnei_cont.39077:
bnei_cont.39035:
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
	blt	%at, %v1, bgt_else.39266
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
	blti	%a1, 0, bgti_else.39267
	add	%at, %k0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39268
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
	beqi	%t2, 0, bnei_else.39270
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
	j	bnei_cont.39271
bnei_else.39270:
bnei_cont.39271:
	beqi	%t2, 1, bnei_else.39272
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
	j	bnei_cont.39273
bnei_else.39272:
bnei_cont.39273:
	beqi	%t2, 2, bnei_else.39274
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
	j	bnei_cont.39275
bnei_else.39274:
bnei_cont.39275:
	beqi	%t2, 3, bnei_else.39276
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
	j	bnei_cont.39277
bnei_else.39276:
bnei_cont.39277:
	beqi	%t2, 4, bnei_else.39278
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
	j	bnei_cont.39279
bnei_else.39278:
bnei_cont.39279:
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
	j	bnei_cont.39269
bnei_else.39268:
bnei_cont.39269:
	lw	%a0, 1(%sp)
	addi	%t2, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t2, bgt_else.39280
	lw	%a0, 11(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39281
	lw	%a0, 10(%sp)
	add	%at, %a0, %t2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39282
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
	beqi	%t3, 0, bnei_else.39284
	lw	%v0, 179(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39285
bnei_else.39284:
bnei_cont.39285:
	beqi	%t3, 1, bnei_else.39286
	lw	%v0, 180(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39287
bnei_else.39286:
bnei_cont.39287:
	beqi	%t3, 2, bnei_else.39288
	lw	%v0, 181(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39289
bnei_else.39288:
bnei_cont.39289:
	beqi	%t3, 3, bnei_else.39290
	lw	%v0, 182(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39291
bnei_else.39290:
bnei_cont.39291:
	beqi	%t3, 4, bnei_else.39292
	lw	%v0, 183(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -13
	j	bnei_cont.39293
bnei_else.39292:
bnei_cont.39293:
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
	j	bnei_cont.39283
bnei_else.39282:
bnei_cont.39283:
	addi	%v1, %t2, 1
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.39281:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgt_else.39280:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
bgti_else.39267:
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.39266:
	add	%t0, %zero, %a0
	jr	%ra
try_exploit_neighbors.3018:
	sw	%a3, 0(%sp)
	sw	%ra, 1(%sp)
	add	%at, %a1, %v0
	lw	%s2, 0(%at)
	sw	%s2, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.39510
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
	blti	%s7, 0, bgti_else.39511
	add	%at, %a0, %v0
	lw	%fp, 0(%at)
	lw	%s2, 5(%fp)
	lw	%s3, 2(%fp)
	add	%at, %s3, %a3
	lw	%fp, 0(%at)
	bne	%fp, %s7, beq_else.39512
	add	%at, %a2, %v0
	lw	%fp, 0(%at)
	lw	%fp, 2(%fp)
	add	%at, %fp, %a3
	lw	%fp, 0(%at)
	bne	%fp, %s7, beq_else.39514
	addi	%fp, %v0, -1
	add	%at, %a1, %fp
	lw	%fp, 0(%at)
	lw	%fp, 2(%fp)
	add	%at, %fp, %a3
	lw	%fp, 0(%at)
	bne	%fp, %s7, beq_else.39516
	addi	%fp, %v0, 1
	add	%at, %a1, %fp
	lw	%fp, 0(%at)
	lw	%fp, 2(%fp)
	add	%at, %fp, %a3
	lw	%a3, 0(%at)
	bne	%a3, %s7, beq_else.39518
	add	%a3, %zero, %k1
	j	beq_cont.39513
beq_else.39518:
	add	%a3, %zero, %zero
beq_cont.39519:
	j	beq_cont.39513
beq_else.39516:
	add	%a3, %zero, %zero
beq_cont.39517:
	j	beq_cont.39513
beq_else.39514:
	add	%a3, %zero, %zero
beq_cont.39515:
	j	beq_cont.39513
beq_else.39512:
	add	%a3, %zero, %zero
beq_cont.39513:
	beqi	%a3, 0, bnei_else.39520
	lw	%s4, 0(%sp)
	add	%at, %k0, %s4
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.39521
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
	j	bnei_cont.39522
bnei_else.39521:
bnei_cont.39522:
	lw	%a3, 0(%sp)
	addi	%fp, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %fp, bgt_else.39523
	add	%at, %s0, %fp
	lw	%ra, 0(%at)
	blti	%ra, 0, bgti_else.39524
	add	%at, %s3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.39525
	add	%at, %a2, %v0
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.39527
	addi	%a3, %v0, -1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.39529
	addi	%a3, %v0, 1
	add	%at, %a1, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %fp
	lw	%a3, 0(%at)
	bne	%a3, %ra, beq_else.39531
	add	%a3, %zero, %k1
	j	beq_cont.39526
beq_else.39531:
	add	%a3, %zero, %zero
beq_cont.39532:
	j	beq_cont.39526
beq_else.39529:
	add	%a3, %zero, %zero
beq_cont.39530:
	j	beq_cont.39526
beq_else.39527:
	add	%a3, %zero, %zero
beq_cont.39528:
	j	beq_cont.39526
beq_else.39525:
	add	%a3, %zero, %zero
beq_cont.39526:
	beqi	%a3, 0, bnei_else.39533
	add	%at, %k0, %fp
	lw	%a3, 0(%at)
	beqi	%a3, 0, bnei_else.39534
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
	j	bnei_cont.39535
bnei_else.39534:
bnei_cont.39535:
	addi	%a3, %fp, 1
	lw	%ra, 1(%sp)
	j	try_exploit_neighbors.3018
bnei_else.39533:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %fp, 0
	j	do_without_neighbors.3002
bgti_else.39524:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.39523:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.39520:
	lw	%a2, 0(%sp)
	addi	%at, %zero, 4
	blt	%at, %a2, bgt_else.39538
	blti	%s7, 0, bgti_else.39539
	add	%at, %k0, %a2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39540
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
	beqi	%a1, 0, bnei_else.39542
	lw	%v0, 179(%zero)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39543
bnei_else.39542:
bnei_cont.39543:
	lw	%a0, 4(%sp)
	beqi	%a0, 1, bnei_else.39544
	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39545
bnei_else.39544:
bnei_cont.39545:
	lw	%a0, 4(%sp)
	beqi	%a0, 2, bnei_else.39546
	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39547
bnei_else.39546:
bnei_cont.39547:
	lw	%a0, 4(%sp)
	beqi	%a0, 3, bnei_else.39548
	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39549
bnei_else.39548:
bnei_cont.39549:
	lw	%a0, 4(%sp)
	beqi	%a0, 4, bnei_else.39550
	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	j	bnei_cont.39551
bnei_else.39550:
bnei_cont.39551:
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
	j	bnei_cont.39541
bnei_else.39540:
bnei_cont.39541:
	lw	%a0, 0(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	j	do_without_neighbors.3002
bgti_else.39539:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.39538:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.39511:
	jr	%ra
bgt_else.39510:
	jr	%ra
pretrace_diffuse_rays.3031:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.39879
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
	blti	%a1, 0, bgti_else.39880
	add	%at, %fp, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39881
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
	j	bnei_cont.39882
bnei_else.39881:
bnei_cont.39882:
	lw	%a0, 1(%sp)
	addi	%t1, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t1, bgt_else.39883
	lw	%a0, 8(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39884
	lw	%a0, 7(%sp)
	add	%at, %a0, %t1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39885
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
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a2)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a2)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.39887
	add	%a1, %zero, %zero
	j	fbgt_cont.39888
fbgt_else.39887:
	add	%a1, %zero, %k1
fbgt_cont.39888:
	beqi	%a1, 0, bnei_else.39889
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -15
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.39891
	add	%a0, %zero, %zero
	j	fbgt_cont.39892
fbgt_else.39891:
	add	%a0, %zero, %k1
fbgt_cont.39892:
	beqi	%a0, 0, bnei_else.39893
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.39895
	add	%a0, %zero, %zero
	j	bnei_cont.39894
fbgt_else.39895:
	add	%a0, %zero, %k1
fbgt_cont.39896:
	j	bnei_cont.39894
bnei_else.39893:
	add	%a0, %zero, %zero
bnei_cont.39894:
	beqi	%a0, 0, bnei_cont.39890
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
	beqi	%k0, 1, bnei_else.39899
	beqi	%k0, 2, bnei_else.39901
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.39903
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 474(%zero)
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
	j	bnei_cont.39904
bnei_else.39903:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.39904:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.39905
	add	%a0, %zero, %k1
	j	fbeq_cont.39906
fbeq_else.39905:
	add	%a0, %zero, %zero
fbeq_cont.39906:
	beqi	%a0, 0, bnei_else.39907
	fmov	%f0, %f30
	j	bnei_cont.39908
bnei_else.39907:
	beqi	%a3, 0, bnei_else.39909
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39910
bnei_else.39909:
	fdiv	%f0, %f30, %f1
bnei_cont.39910:
bnei_cont.39908:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39900
bnei_else.39901:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.39902:
	j	bnei_cont.39900
bnei_else.39899:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.39911
	add	%a0, %zero, %k1
	j	fbeq_cont.39912
fbeq_else.39911:
	add	%a0, %zero, %zero
fbeq_cont.39912:
	beqi	%a0, 0, bnei_else.39913
	fmov	%f0, %fzero
	j	bnei_cont.39914
bnei_else.39913:
	fblt	%fzero, %f0, fbgt_else.39915
	add	%a0, %zero, %zero
	j	fbgt_cont.39916
fbgt_else.39915:
	add	%a0, %zero, %k1
fbgt_cont.39916:
	beqi	%a0, 0, bnei_else.39917
	fmov	%f0, %f30
	j	bnei_cont.39918
bnei_else.39917:
	flw	%f0, 468(%zero)
bnei_cont.39918:
bnei_cont.39914:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.39900:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 15
	jal	utexture.2959
	addi	%sp, %sp, -15
	lw	%v1, 14(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 15
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.39919
	j	bnei_cont.39890
bnei_else.39919:
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
	fblt	%fzero, %f0, fbgt_else.39921
	add	%a0, %zero, %zero
	j	fbgt_cont.39922
fbgt_else.39921:
	add	%a0, %zero, %k1
fbgt_cont.39922:
	beqi	%a0, 0, bnei_else.39923
	j	bnei_cont.39924
bnei_else.39923:
	fmov	%f0, %fzero
bnei_cont.39924:
	fmul	%f1, %f27, %f0
	flw	%f0, 0(%t9)
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
bnei_cont.39920:
	j	bnei_cont.39890
bnei_else.39897:
bnei_cont.39898:
	j	bnei_cont.39890
bnei_else.39889:
	flw	%f0, 439(%zero)
	fdiv	%f27, %f1, %f0
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
	fblt	%f0, %f1, fbgt_else.39925
	add	%a0, %zero, %zero
	j	fbgt_cont.39926
fbgt_else.39925:
	add	%a0, %zero, %k1
fbgt_cont.39926:
	beqi	%a0, 0, bnei_else.39927
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.39929
	add	%a0, %zero, %zero
	j	bnei_cont.39928
fbgt_else.39929:
	add	%a0, %zero, %k1
fbgt_cont.39930:
	j	bnei_cont.39928
bnei_else.39927:
	add	%a0, %zero, %zero
bnei_cont.39928:
	beqi	%a0, 0, bnei_else.39931
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.39933
	beqi	%k0, 2, bnei_else.39935
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.39937
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 474(%zero)
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
	j	bnei_cont.39938
bnei_else.39937:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.39938:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.39939
	add	%a0, %zero, %k1
	j	fbeq_cont.39940
fbeq_else.39939:
	add	%a0, %zero, %zero
fbeq_cont.39940:
	beqi	%a0, 0, bnei_else.39941
	fmov	%f0, %f30
	j	bnei_cont.39942
bnei_else.39941:
	beqi	%a3, 0, bnei_else.39943
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39944
bnei_else.39943:
	fdiv	%f0, %f30, %f1
bnei_cont.39944:
bnei_cont.39942:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.39934
bnei_else.39935:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.39936:
	j	bnei_cont.39934
bnei_else.39933:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 12(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.39945
	add	%a0, %zero, %k1
	j	fbeq_cont.39946
fbeq_else.39945:
	add	%a0, %zero, %zero
fbeq_cont.39946:
	beqi	%a0, 0, bnei_else.39947
	fmov	%f0, %fzero
	j	bnei_cont.39948
bnei_else.39947:
	fblt	%fzero, %f0, fbgt_else.39949
	add	%a0, %zero, %zero
	j	fbgt_cont.39950
fbgt_else.39949:
	add	%a0, %zero, %k1
fbgt_cont.39950:
	beqi	%a0, 0, bnei_else.39951
	fmov	%f0, %f30
	j	bnei_cont.39952
bnei_else.39951:
	flw	%f0, 468(%zero)
bnei_cont.39952:
bnei_cont.39948:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.39934:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 16
	jal	utexture.2959
	addi	%sp, %sp, -16
	lw	%v1, 15(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -16
	beqi	%v0, 0, bnei_else.39953
	j	bnei_cont.39932
bnei_else.39953:
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
	fblt	%fzero, %f0, fbgt_else.39955
	add	%a0, %zero, %zero
	j	fbgt_cont.39956
fbgt_else.39955:
	add	%a0, %zero, %k1
fbgt_cont.39956:
	beqi	%a0, 0, bnei_else.39957
	j	bnei_cont.39958
bnei_else.39957:
	fmov	%f0, %fzero
bnei_cont.39958:
	fmul	%f1, %f27, %f0
	flw	%f0, 0(%t9)
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
bnei_cont.39954:
	j	bnei_cont.39932
bnei_else.39931:
bnei_cont.39932:
bnei_cont.39890:
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
	j	bnei_cont.39886
bnei_else.39885:
bnei_cont.39886:
	addi	%v1, %t1, 1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3031
bgti_else.39884:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.39883:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgti_else.39880:
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.39879:
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
	blti	%v1, 0, bgti_else.40268
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
	fbne	%f0, %fzero, fbeq_else.40269
	add	%a0, %zero, %k1
	j	fbeq_cont.40270
fbeq_else.40269:
	add	%a0, %zero, %zero
fbeq_cont.40270:
	beqi	%a0, 0, bnei_else.40271
	fmov	%f0, %f30
	j	bnei_cont.40272
bnei_else.40271:
	fdiv	%f0, %f30, %f0
bnei_cont.40272:
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
	blti	%a0, 0, bgti_else.40273
	lw	%a0, 0(%k0)
	beqi	%a0, 0, bnei_else.40275
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
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%t4)
	flw	%f0, 1(%t3)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%t4)
	flw	%f0, 2(%t3)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.40277
	add	%a1, %zero, %zero
	j	fbgt_cont.40278
fbgt_else.40277:
	add	%a1, %zero, %k1
fbgt_cont.40278:
	beqi	%a1, 0, bnei_else.40279
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -14
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	fblt	%f0, %f1, fbgt_else.40281
	add	%a0, %zero, %zero
	j	fbgt_cont.40282
fbgt_else.40281:
	add	%a0, %zero, %k1
fbgt_cont.40282:
	beqi	%a0, 0, bnei_else.40283
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40285
	add	%a0, %zero, %zero
	j	bnei_cont.40284
fbgt_else.40285:
	add	%a0, %zero, %k1
fbgt_cont.40286:
	j	bnei_cont.40284
bnei_else.40283:
	add	%a0, %zero, %zero
bnei_cont.40284:
	beqi	%a0, 0, bnei_cont.40280
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
	beqi	%k0, 1, bnei_else.40289
	beqi	%k0, 2, bnei_else.40291
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.40293
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 474(%zero)
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
	j	bnei_cont.40294
bnei_else.40293:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40294:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40295
	add	%a0, %zero, %k1
	j	fbeq_cont.40296
fbeq_else.40295:
	add	%a0, %zero, %zero
fbeq_cont.40296:
	beqi	%a0, 0, bnei_else.40297
	fmov	%f0, %f30
	j	bnei_cont.40298
bnei_else.40297:
	beqi	%a3, 0, bnei_else.40299
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40300
bnei_else.40299:
	fdiv	%f0, %f30, %f1
bnei_cont.40300:
bnei_cont.40298:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40290
bnei_else.40291:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40292:
	j	bnei_cont.40290
bnei_else.40289:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %ra, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40301
	add	%a0, %zero, %k1
	j	fbeq_cont.40302
fbeq_else.40301:
	add	%a0, %zero, %zero
fbeq_cont.40302:
	beqi	%a0, 0, bnei_else.40303
	fmov	%f0, %fzero
	j	bnei_cont.40304
bnei_else.40303:
	fblt	%fzero, %f0, fbgt_else.40305
	add	%a0, %zero, %zero
	j	fbgt_cont.40306
fbgt_else.40305:
	add	%a0, %zero, %k1
fbgt_cont.40306:
	beqi	%a0, 0, bnei_else.40307
	fmov	%f0, %f30
	j	bnei_cont.40308
bnei_else.40307:
	flw	%f0, 468(%zero)
bnei_cont.40308:
bnei_cont.40304:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40290:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 14
	jal	utexture.2959
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.40309
	j	bnei_cont.40280
bnei_else.40309:
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
	fblt	%fzero, %f0, fbgt_else.40311
	add	%a0, %zero, %zero
	j	fbgt_cont.40312
fbgt_else.40311:
	add	%a0, %zero, %k1
fbgt_cont.40312:
	beqi	%a0, 0, bnei_else.40313
	j	bnei_cont.40314
bnei_else.40313:
	fmov	%f0, %fzero
bnei_cont.40314:
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
bnei_cont.40310:
	j	bnei_cont.40280
bnei_else.40287:
bnei_cont.40288:
	j	bnei_cont.40280
bnei_else.40279:
	flw	%f0, 439(%zero)
	fdiv	%f27, %f1, %f0
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
	fblt	%f0, %f1, fbgt_else.40315
	add	%a0, %zero, %zero
	j	fbgt_cont.40316
fbgt_else.40315:
	add	%a0, %zero, %k1
fbgt_cont.40316:
	beqi	%a0, 0, bnei_else.40317
	flw	%f0, 444(%zero)
	fblt	%f1, %f0, fbgt_else.40319
	add	%a0, %zero, %zero
	j	bnei_cont.40318
fbgt_else.40319:
	add	%a0, %zero, %k1
fbgt_cont.40320:
	j	bnei_cont.40318
bnei_else.40317:
	add	%a0, %zero, %zero
bnei_cont.40318:
	beqi	%a0, 0, bnei_else.40321
	lw	%a0, 141(%zero)
	lw	%v0, 12(%a0)
	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	beqi	%k0, 1, bnei_else.40323
	beqi	%k0, 2, bnei_else.40325
	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f22, %f1, %f0
	flw	%f0, 0(%fp)
	fmul	%f23, %f18, %f0
	flw	%f0, 1(%fp)
	fmul	%f21, %f19, %f0
	flw	%f0, 2(%fp)
	fmul	%f17, %f22, %f0
	beqi	%a2, 0, bnei_else.40327
	flw	%f16, 2(%a1)
	fmul	%f1, %f19, %f16
	flw	%f20, 1(%a1)
	fmul	%f0, %f22, %f20
	fadd	%f0, %f1, %f0
	flw	%f2, 474(%zero)
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
	j	bnei_cont.40328
bnei_else.40327:
	fsw	%f23, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f17, 144(%zero)
bnei_cont.40328:
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.40329
	add	%a0, %zero, %k1
	j	fbeq_cont.40330
fbeq_else.40329:
	add	%a0, %zero, %zero
fbeq_cont.40330:
	beqi	%a0, 0, bnei_else.40331
	fmov	%f0, %f30
	j	bnei_cont.40332
bnei_else.40331:
	beqi	%a3, 0, bnei_else.40333
	flw	%f0, 468(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40334
bnei_else.40333:
	fdiv	%f0, %f30, %f1
bnei_cont.40334:
bnei_cont.40332:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.40324
bnei_else.40325:
	flw	%f0, 0(%fp)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.40326:
	j	bnei_cont.40324
bnei_else.40323:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %t4, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.40335
	add	%a0, %zero, %k1
	j	fbeq_cont.40336
fbeq_else.40335:
	add	%a0, %zero, %zero
fbeq_cont.40336:
	beqi	%a0, 0, bnei_else.40337
	fmov	%f0, %fzero
	j	bnei_cont.40338
bnei_else.40337:
	fblt	%fzero, %f0, fbgt_else.40339
	add	%a0, %zero, %zero
	j	fbgt_cont.40340
fbgt_else.40339:
	add	%a0, %zero, %k1
fbgt_cont.40340:
	beqi	%a0, 0, bnei_else.40341
	fmov	%f0, %f30
	j	bnei_cont.40342
bnei_else.40341:
	flw	%f0, 468(%zero)
bnei_cont.40342:
bnei_cont.40338:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.40324:
	addi	%v1, %zero, 138
	addi	%sp, %sp, 14
	jal	utexture.2959
	addi	%v1, %t5, 0
	addi	%v0, %zero, 0
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.40343
	j	bnei_cont.40322
bnei_else.40343:
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
	fblt	%fzero, %f0, fbgt_else.40345
	add	%a0, %zero, %zero
	j	fbgt_cont.40346
fbgt_else.40345:
	add	%a0, %zero, %k1
fbgt_cont.40346:
	beqi	%a0, 0, bnei_else.40347
	j	bnei_cont.40348
bnei_else.40347:
	fmov	%f0, %fzero
bnei_cont.40348:
	fmul	%f1, %f27, %f0
	flw	%f0, 0(%t9)
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
bnei_cont.40344:
	j	bnei_cont.40322
bnei_else.40321:
bnei_cont.40322:
bnei_cont.40280:
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
	j	bnei_cont.40276
bnei_else.40275:
bnei_cont.40276:
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 14
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -14
	j	bgti_cont.40274
bgti_else.40273:
bgti_cont.40274:
	lw	%a0, 4(%sp)
	addi	%v1, %a0, -1
	lw	%a0, 5(%sp)
	addi	%a0, %a0, 1
	blti	%a0, 5, bgti_else.40349
	addi	%a0, %a0, -5
	j	bgti_cont.40350
bgti_else.40349:
bgti_cont.40350:
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
bgti_else.40268:
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
	blt	%v0, %t0, bgt_else.42673
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.42673:
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
	blt	%a0, %a2, bgt_else.42675
	add	%a0, %zero, %zero
	j	bgt_cont.42676
bgt_else.42675:
	blt	%zero, %v1, bgt_else.42677
	add	%a0, %zero, %zero
	j	bgt_cont.42678
bgt_else.42677:
	addi	%a0, %v0, 1
	blt	%a0, %t0, bgt_else.42679
	add	%a0, %zero, %zero
	j	bgt_cont.42680
bgt_else.42679:
	blt	%zero, %v0, bgt_else.42681
	add	%a0, %zero, %zero
	j	bgt_cont.42682
bgt_else.42681:
	add	%a0, %zero, %k1
bgt_cont.42682:
bgt_cont.42680:
bgt_cont.42678:
bgt_cont.42676:
	beqi	%a0, 0, bnei_else.42683
	lw	%fp, 0(%a3)
	blti	%fp, 0, bnei_cont.42684
	lw	%a0, 2(%sp)
	lw	%a3, 0(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%ra, 5(%a0)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.42687
	lw	%a0, 4(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.42689
	addi	%a0, %a3, -1
	lw	%a2, 3(%sp)
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.42691
	addi	%a0, %a3, 1
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %fp, beq_else.42693
	add	%a0, %zero, %k1
	j	beq_cont.42688
beq_else.42693:
	add	%a0, %zero, %zero
beq_cont.42694:
	j	beq_cont.42688
beq_else.42691:
	add	%a0, %zero, %zero
beq_cont.42692:
	j	beq_cont.42688
beq_else.42689:
	add	%a0, %zero, %zero
beq_cont.42690:
	j	beq_cont.42688
beq_else.42687:
	add	%a0, %zero, %zero
beq_cont.42688:
	beqi	%a0, 0, bnei_else.42695
	lw	%a0, 0(%a1)
	beqi	%a0, 0, bnei_else.42697
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
	j	bnei_cont.42698
bnei_else.42697:
bnei_cont.42698:
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a3, %k1, 0
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -14
	j	bnei_cont.42684
bnei_else.42695:
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
bnei_cont.42696:
	j	bnei_cont.42684
bgti_else.42685:
bgti_cont.42686:
	j	bnei_cont.42684
bnei_else.42683:
	lw	%a0, 0(%a3)
	blti	%a0, 0, bgti_else.42699
	lw	%a0, 0(%a1)
	beqi	%a0, 0, bnei_else.42701
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
	beqi	%t4, 0, bnei_else.42703
	lw	%v0, 179(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42704
bnei_else.42703:
bnei_cont.42704:
	beqi	%t4, 1, bnei_else.42705
	lw	%v0, 180(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42706
bnei_else.42705:
bnei_cont.42706:
	beqi	%t4, 2, bnei_else.42707
	lw	%v0, 181(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42708
bnei_else.42707:
bnei_cont.42708:
	beqi	%t4, 3, bnei_else.42709
	lw	%v0, 182(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42710
bnei_else.42709:
bnei_cont.42710:
	beqi	%t4, 4, bnei_else.42711
	lw	%v0, 183(%zero)
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -14
	j	bnei_cont.42712
bnei_else.42711:
bnei_cont.42712:
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
	j	bnei_cont.42702
bnei_else.42701:
bnei_cont.42702:
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
	j	bgti_cont.42700
bgti_else.42699:
bgti_cont.42700:
bnei_cont.42684:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.42713
	blti	%a1, 0, bgti_else.42715
	j	bgt_cont.42714
bgti_else.42715:
	add	%a1, %zero, %zero
bgti_cont.42716:
	j	bgt_cont.42714
bgt_else.42713:
	addi	%a1, %zero, 255
bgt_cont.42714:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	addi	%t1, %zero, 10
	blti	%a1, 10, bgti_else.42717
	blti	%a1, 20, bgti_else.42719
	blti	%a1, 30, bgti_else.42721
	blti	%a1, 40, bgti_else.42723
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42718
	blti	%a1, 20, bgti_else.42727
	blti	%a1, 30, bgti_else.42729
	blti	%a1, 40, bgti_else.42731
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42718
	blti	%a1, 20, bgti_else.42735
	blti	%a1, 30, bgti_else.42737
	blti	%a1, 40, bgti_else.42739
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42718
	blti	%a1, 20, bgti_else.42743
	blti	%a1, 30, bgti_else.42745
	blti	%a1, 40, bgti_else.42747
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.42718
bgti_else.42747:
	addi	%a1, %a1, -30
bgti_cont.42748:
	j	bgti_cont.42718
bgti_else.42745:
	addi	%a1, %a1, -20
bgti_cont.42746:
	j	bgti_cont.42718
bgti_else.42743:
	addi	%a1, %a1, -10
bgti_cont.42744:
	j	bgti_cont.42718
bgti_else.42741:
bgti_cont.42742:
	j	bgti_cont.42718
bgti_else.42739:
	addi	%a1, %a1, -30
bgti_cont.42740:
	j	bgti_cont.42718
bgti_else.42737:
	addi	%a1, %a1, -20
bgti_cont.42738:
	j	bgti_cont.42718
bgti_else.42735:
	addi	%a1, %a1, -10
bgti_cont.42736:
	j	bgti_cont.42718
bgti_else.42733:
bgti_cont.42734:
	j	bgti_cont.42718
bgti_else.42731:
	addi	%a1, %a1, -30
bgti_cont.42732:
	j	bgti_cont.42718
bgti_else.42729:
	addi	%a1, %a1, -20
bgti_cont.42730:
	j	bgti_cont.42718
bgti_else.42727:
	addi	%a1, %a1, -10
bgti_cont.42728:
	j	bgti_cont.42718
bgti_else.42725:
bgti_cont.42726:
	j	bgti_cont.42718
bgti_else.42723:
	addi	%a1, %a1, -30
bgti_cont.42724:
	j	bgti_cont.42718
bgti_else.42721:
	addi	%a1, %a1, -20
bgti_cont.42722:
	j	bgti_cont.42718
bgti_else.42719:
	addi	%a1, %a1, -10
bgti_cont.42720:
	j	bgti_cont.42718
bgti_else.42717:
bgti_cont.42718:
	blt	%zero, %a2, bgt_else.42749
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42750
bgt_else.42749:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.42751
	blti	%a2, 20, bgti_else.42753
	blti	%a2, 30, bgti_else.42755
	blti	%a2, 40, bgti_else.42757
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42752
	blti	%a2, 20, bgti_else.42761
	blti	%a2, 30, bgti_else.42763
	blti	%a2, 40, bgti_else.42765
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42752
	blti	%a2, 20, bgti_else.42769
	blti	%a2, 30, bgti_else.42771
	blti	%a2, 40, bgti_else.42773
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42752
	blti	%a2, 20, bgti_else.42777
	blti	%a2, 30, bgti_else.42779
	blti	%a2, 40, bgti_else.42781
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.42752
bgti_else.42781:
	addi	%a2, %a2, -30
bgti_cont.42782:
	j	bgti_cont.42752
bgti_else.42779:
	addi	%a2, %a2, -20
bgti_cont.42780:
	j	bgti_cont.42752
bgti_else.42777:
	addi	%a2, %a2, -10
bgti_cont.42778:
	j	bgti_cont.42752
bgti_else.42775:
bgti_cont.42776:
	j	bgti_cont.42752
bgti_else.42773:
	addi	%a2, %a2, -30
bgti_cont.42774:
	j	bgti_cont.42752
bgti_else.42771:
	addi	%a2, %a2, -20
bgti_cont.42772:
	j	bgti_cont.42752
bgti_else.42769:
	addi	%a2, %a2, -10
bgti_cont.42770:
	j	bgti_cont.42752
bgti_else.42767:
bgti_cont.42768:
	j	bgti_cont.42752
bgti_else.42765:
	addi	%a2, %a2, -30
bgti_cont.42766:
	j	bgti_cont.42752
bgti_else.42763:
	addi	%a2, %a2, -20
bgti_cont.42764:
	j	bgti_cont.42752
bgti_else.42761:
	addi	%a2, %a2, -10
bgti_cont.42762:
	j	bgti_cont.42752
bgti_else.42759:
bgti_cont.42760:
	j	bgti_cont.42752
bgti_else.42757:
	addi	%a2, %a2, -30
bgti_cont.42758:
	j	bgti_cont.42752
bgti_else.42755:
	addi	%a2, %a2, -20
bgti_cont.42756:
	j	bgti_cont.42752
bgti_else.42753:
	addi	%a2, %a2, -10
bgti_cont.42754:
	j	bgti_cont.42752
bgti_else.42751:
bgti_cont.42752:
	blt	%zero, %a0, bgt_else.42783
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42784
bgt_else.42783:
	blti	%a0, 10, bgti_else.42785
	blti	%a0, 20, bgti_else.42787
	blti	%a0, 30, bgti_else.42789
	blti	%a0, 40, bgti_else.42791
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42786
	blti	%a0, 20, bgti_else.42795
	blti	%a0, 30, bgti_else.42797
	blti	%a0, 40, bgti_else.42799
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42786
	blti	%a0, 20, bgti_else.42803
	blti	%a0, 30, bgti_else.42805
	blti	%a0, 40, bgti_else.42807
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42786
	blti	%a0, 20, bgti_else.42811
	blti	%a0, 30, bgti_else.42813
	blti	%a0, 40, bgti_else.42815
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.42786
bgti_else.42815:
	addi	%a0, %a0, -30
bgti_cont.42816:
	j	bgti_cont.42786
bgti_else.42813:
	addi	%a0, %a0, -20
bgti_cont.42814:
	j	bgti_cont.42786
bgti_else.42811:
	addi	%a0, %a0, -10
bgti_cont.42812:
	j	bgti_cont.42786
bgti_else.42809:
bgti_cont.42810:
	j	bgti_cont.42786
bgti_else.42807:
	addi	%a0, %a0, -30
bgti_cont.42808:
	j	bgti_cont.42786
bgti_else.42805:
	addi	%a0, %a0, -20
bgti_cont.42806:
	j	bgti_cont.42786
bgti_else.42803:
	addi	%a0, %a0, -10
bgti_cont.42804:
	j	bgti_cont.42786
bgti_else.42801:
bgti_cont.42802:
	j	bgti_cont.42786
bgti_else.42799:
	addi	%a0, %a0, -30
bgti_cont.42800:
	j	bgti_cont.42786
bgti_else.42797:
	addi	%a0, %a0, -20
bgti_cont.42798:
	j	bgti_cont.42786
bgti_else.42795:
	addi	%a0, %a0, -10
bgti_cont.42796:
	j	bgti_cont.42786
bgti_else.42793:
bgti_cont.42794:
	j	bgti_cont.42786
bgti_else.42791:
	addi	%a0, %a0, -30
bgti_cont.42792:
	j	bgti_cont.42786
bgti_else.42789:
	addi	%a0, %a0, -20
bgti_cont.42790:
	j	bgti_cont.42786
bgti_else.42787:
	addi	%a0, %a0, -10
bgti_cont.42788:
	j	bgti_cont.42786
bgti_else.42785:
bgti_cont.42786:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.42784:
bgt_cont.42750:
	addi	%t2, %zero, 32
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.42817
	blti	%a1, 0, bgti_else.42819
	j	bgt_cont.42818
bgti_else.42819:
	add	%a1, %zero, %zero
bgti_cont.42820:
	j	bgt_cont.42818
bgt_else.42817:
	addi	%a1, %zero, 255
bgt_cont.42818:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.42821
	blti	%a1, 20, bgti_else.42823
	blti	%a1, 30, bgti_else.42825
	blti	%a1, 40, bgti_else.42827
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42822
	blti	%a1, 20, bgti_else.42831
	blti	%a1, 30, bgti_else.42833
	blti	%a1, 40, bgti_else.42835
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42822
	blti	%a1, 20, bgti_else.42839
	blti	%a1, 30, bgti_else.42841
	blti	%a1, 40, bgti_else.42843
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42822
	blti	%a1, 20, bgti_else.42847
	blti	%a1, 30, bgti_else.42849
	blti	%a1, 40, bgti_else.42851
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.42822
bgti_else.42851:
	addi	%a1, %a1, -30
bgti_cont.42852:
	j	bgti_cont.42822
bgti_else.42849:
	addi	%a1, %a1, -20
bgti_cont.42850:
	j	bgti_cont.42822
bgti_else.42847:
	addi	%a1, %a1, -10
bgti_cont.42848:
	j	bgti_cont.42822
bgti_else.42845:
bgti_cont.42846:
	j	bgti_cont.42822
bgti_else.42843:
	addi	%a1, %a1, -30
bgti_cont.42844:
	j	bgti_cont.42822
bgti_else.42841:
	addi	%a1, %a1, -20
bgti_cont.42842:
	j	bgti_cont.42822
bgti_else.42839:
	addi	%a1, %a1, -10
bgti_cont.42840:
	j	bgti_cont.42822
bgti_else.42837:
bgti_cont.42838:
	j	bgti_cont.42822
bgti_else.42835:
	addi	%a1, %a1, -30
bgti_cont.42836:
	j	bgti_cont.42822
bgti_else.42833:
	addi	%a1, %a1, -20
bgti_cont.42834:
	j	bgti_cont.42822
bgti_else.42831:
	addi	%a1, %a1, -10
bgti_cont.42832:
	j	bgti_cont.42822
bgti_else.42829:
bgti_cont.42830:
	j	bgti_cont.42822
bgti_else.42827:
	addi	%a1, %a1, -30
bgti_cont.42828:
	j	bgti_cont.42822
bgti_else.42825:
	addi	%a1, %a1, -20
bgti_cont.42826:
	j	bgti_cont.42822
bgti_else.42823:
	addi	%a1, %a1, -10
bgti_cont.42824:
	j	bgti_cont.42822
bgti_else.42821:
bgti_cont.42822:
	blt	%zero, %a2, bgt_else.42853
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42854
bgt_else.42853:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.42855
	blti	%a2, 20, bgti_else.42857
	blti	%a2, 30, bgti_else.42859
	blti	%a2, 40, bgti_else.42861
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42856
	blti	%a2, 20, bgti_else.42865
	blti	%a2, 30, bgti_else.42867
	blti	%a2, 40, bgti_else.42869
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42856
	blti	%a2, 20, bgti_else.42873
	blti	%a2, 30, bgti_else.42875
	blti	%a2, 40, bgti_else.42877
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42856
	blti	%a2, 20, bgti_else.42881
	blti	%a2, 30, bgti_else.42883
	blti	%a2, 40, bgti_else.42885
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.42856
bgti_else.42885:
	addi	%a2, %a2, -30
bgti_cont.42886:
	j	bgti_cont.42856
bgti_else.42883:
	addi	%a2, %a2, -20
bgti_cont.42884:
	j	bgti_cont.42856
bgti_else.42881:
	addi	%a2, %a2, -10
bgti_cont.42882:
	j	bgti_cont.42856
bgti_else.42879:
bgti_cont.42880:
	j	bgti_cont.42856
bgti_else.42877:
	addi	%a2, %a2, -30
bgti_cont.42878:
	j	bgti_cont.42856
bgti_else.42875:
	addi	%a2, %a2, -20
bgti_cont.42876:
	j	bgti_cont.42856
bgti_else.42873:
	addi	%a2, %a2, -10
bgti_cont.42874:
	j	bgti_cont.42856
bgti_else.42871:
bgti_cont.42872:
	j	bgti_cont.42856
bgti_else.42869:
	addi	%a2, %a2, -30
bgti_cont.42870:
	j	bgti_cont.42856
bgti_else.42867:
	addi	%a2, %a2, -20
bgti_cont.42868:
	j	bgti_cont.42856
bgti_else.42865:
	addi	%a2, %a2, -10
bgti_cont.42866:
	j	bgti_cont.42856
bgti_else.42863:
bgti_cont.42864:
	j	bgti_cont.42856
bgti_else.42861:
	addi	%a2, %a2, -30
bgti_cont.42862:
	j	bgti_cont.42856
bgti_else.42859:
	addi	%a2, %a2, -20
bgti_cont.42860:
	j	bgti_cont.42856
bgti_else.42857:
	addi	%a2, %a2, -10
bgti_cont.42858:
	j	bgti_cont.42856
bgti_else.42855:
bgti_cont.42856:
	blt	%zero, %a0, bgt_else.42887
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42888
bgt_else.42887:
	blti	%a0, 10, bgti_else.42889
	blti	%a0, 20, bgti_else.42891
	blti	%a0, 30, bgti_else.42893
	blti	%a0, 40, bgti_else.42895
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42890
	blti	%a0, 20, bgti_else.42899
	blti	%a0, 30, bgti_else.42901
	blti	%a0, 40, bgti_else.42903
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42890
	blti	%a0, 20, bgti_else.42907
	blti	%a0, 30, bgti_else.42909
	blti	%a0, 40, bgti_else.42911
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42890
	blti	%a0, 20, bgti_else.42915
	blti	%a0, 30, bgti_else.42917
	blti	%a0, 40, bgti_else.42919
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.42890
bgti_else.42919:
	addi	%a0, %a0, -30
bgti_cont.42920:
	j	bgti_cont.42890
bgti_else.42917:
	addi	%a0, %a0, -20
bgti_cont.42918:
	j	bgti_cont.42890
bgti_else.42915:
	addi	%a0, %a0, -10
bgti_cont.42916:
	j	bgti_cont.42890
bgti_else.42913:
bgti_cont.42914:
	j	bgti_cont.42890
bgti_else.42911:
	addi	%a0, %a0, -30
bgti_cont.42912:
	j	bgti_cont.42890
bgti_else.42909:
	addi	%a0, %a0, -20
bgti_cont.42910:
	j	bgti_cont.42890
bgti_else.42907:
	addi	%a0, %a0, -10
bgti_cont.42908:
	j	bgti_cont.42890
bgti_else.42905:
bgti_cont.42906:
	j	bgti_cont.42890
bgti_else.42903:
	addi	%a0, %a0, -30
bgti_cont.42904:
	j	bgti_cont.42890
bgti_else.42901:
	addi	%a0, %a0, -20
bgti_cont.42902:
	j	bgti_cont.42890
bgti_else.42899:
	addi	%a0, %a0, -10
bgti_cont.42900:
	j	bgti_cont.42890
bgti_else.42897:
bgti_cont.42898:
	j	bgti_cont.42890
bgti_else.42895:
	addi	%a0, %a0, -30
bgti_cont.42896:
	j	bgti_cont.42890
bgti_else.42893:
	addi	%a0, %a0, -20
bgti_cont.42894:
	j	bgti_cont.42890
bgti_else.42891:
	addi	%a0, %a0, -10
bgti_cont.42892:
	j	bgti_cont.42890
bgti_else.42889:
bgti_cont.42890:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.42888:
bgt_cont.42854:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.42921
	blti	%a1, 0, bgti_else.42923
	j	bgt_cont.42922
bgti_else.42923:
	add	%a1, %zero, %zero
bgti_cont.42924:
	j	bgt_cont.42922
bgt_else.42921:
	addi	%a1, %zero, 255
bgt_cont.42922:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.42925
	blti	%a1, 20, bgti_else.42927
	blti	%a1, 30, bgti_else.42929
	blti	%a1, 40, bgti_else.42931
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42926
	blti	%a1, 20, bgti_else.42935
	blti	%a1, 30, bgti_else.42937
	blti	%a1, 40, bgti_else.42939
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42926
	blti	%a1, 20, bgti_else.42943
	blti	%a1, 30, bgti_else.42945
	blti	%a1, 40, bgti_else.42947
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.42926
	blti	%a1, 20, bgti_else.42951
	blti	%a1, 30, bgti_else.42953
	blti	%a1, 40, bgti_else.42955
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.42926
bgti_else.42955:
	addi	%a1, %a1, -30
bgti_cont.42956:
	j	bgti_cont.42926
bgti_else.42953:
	addi	%a1, %a1, -20
bgti_cont.42954:
	j	bgti_cont.42926
bgti_else.42951:
	addi	%a1, %a1, -10
bgti_cont.42952:
	j	bgti_cont.42926
bgti_else.42949:
bgti_cont.42950:
	j	bgti_cont.42926
bgti_else.42947:
	addi	%a1, %a1, -30
bgti_cont.42948:
	j	bgti_cont.42926
bgti_else.42945:
	addi	%a1, %a1, -20
bgti_cont.42946:
	j	bgti_cont.42926
bgti_else.42943:
	addi	%a1, %a1, -10
bgti_cont.42944:
	j	bgti_cont.42926
bgti_else.42941:
bgti_cont.42942:
	j	bgti_cont.42926
bgti_else.42939:
	addi	%a1, %a1, -30
bgti_cont.42940:
	j	bgti_cont.42926
bgti_else.42937:
	addi	%a1, %a1, -20
bgti_cont.42938:
	j	bgti_cont.42926
bgti_else.42935:
	addi	%a1, %a1, -10
bgti_cont.42936:
	j	bgti_cont.42926
bgti_else.42933:
bgti_cont.42934:
	j	bgti_cont.42926
bgti_else.42931:
	addi	%a1, %a1, -30
bgti_cont.42932:
	j	bgti_cont.42926
bgti_else.42929:
	addi	%a1, %a1, -20
bgti_cont.42930:
	j	bgti_cont.42926
bgti_else.42927:
	addi	%a1, %a1, -10
bgti_cont.42928:
	j	bgti_cont.42926
bgti_else.42925:
bgti_cont.42926:
	blt	%zero, %a2, bgt_else.42957
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42958
bgt_else.42957:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.42959
	blti	%a2, 20, bgti_else.42961
	blti	%a2, 30, bgti_else.42963
	blti	%a2, 40, bgti_else.42965
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42960
	blti	%a2, 20, bgti_else.42969
	blti	%a2, 30, bgti_else.42971
	blti	%a2, 40, bgti_else.42973
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42960
	blti	%a2, 20, bgti_else.42977
	blti	%a2, 30, bgti_else.42979
	blti	%a2, 40, bgti_else.42981
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.42960
	blti	%a2, 20, bgti_else.42985
	blti	%a2, 30, bgti_else.42987
	blti	%a2, 40, bgti_else.42989
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.42960
bgti_else.42989:
	addi	%a2, %a2, -30
bgti_cont.42990:
	j	bgti_cont.42960
bgti_else.42987:
	addi	%a2, %a2, -20
bgti_cont.42988:
	j	bgti_cont.42960
bgti_else.42985:
	addi	%a2, %a2, -10
bgti_cont.42986:
	j	bgti_cont.42960
bgti_else.42983:
bgti_cont.42984:
	j	bgti_cont.42960
bgti_else.42981:
	addi	%a2, %a2, -30
bgti_cont.42982:
	j	bgti_cont.42960
bgti_else.42979:
	addi	%a2, %a2, -20
bgti_cont.42980:
	j	bgti_cont.42960
bgti_else.42977:
	addi	%a2, %a2, -10
bgti_cont.42978:
	j	bgti_cont.42960
bgti_else.42975:
bgti_cont.42976:
	j	bgti_cont.42960
bgti_else.42973:
	addi	%a2, %a2, -30
bgti_cont.42974:
	j	bgti_cont.42960
bgti_else.42971:
	addi	%a2, %a2, -20
bgti_cont.42972:
	j	bgti_cont.42960
bgti_else.42969:
	addi	%a2, %a2, -10
bgti_cont.42970:
	j	bgti_cont.42960
bgti_else.42967:
bgti_cont.42968:
	j	bgti_cont.42960
bgti_else.42965:
	addi	%a2, %a2, -30
bgti_cont.42966:
	j	bgti_cont.42960
bgti_else.42963:
	addi	%a2, %a2, -20
bgti_cont.42964:
	j	bgti_cont.42960
bgti_else.42961:
	addi	%a2, %a2, -10
bgti_cont.42962:
	j	bgti_cont.42960
bgti_else.42959:
bgti_cont.42960:
	blt	%zero, %a0, bgt_else.42991
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.42992
bgt_else.42991:
	blti	%a0, 10, bgti_else.42993
	blti	%a0, 20, bgti_else.42995
	blti	%a0, 30, bgti_else.42997
	blti	%a0, 40, bgti_else.42999
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42994
	blti	%a0, 20, bgti_else.43003
	blti	%a0, 30, bgti_else.43005
	blti	%a0, 40, bgti_else.43007
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42994
	blti	%a0, 20, bgti_else.43011
	blti	%a0, 30, bgti_else.43013
	blti	%a0, 40, bgti_else.43015
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.42994
	blti	%a0, 20, bgti_else.43019
	blti	%a0, 30, bgti_else.43021
	blti	%a0, 40, bgti_else.43023
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.42994
bgti_else.43023:
	addi	%a0, %a0, -30
bgti_cont.43024:
	j	bgti_cont.42994
bgti_else.43021:
	addi	%a0, %a0, -20
bgti_cont.43022:
	j	bgti_cont.42994
bgti_else.43019:
	addi	%a0, %a0, -10
bgti_cont.43020:
	j	bgti_cont.42994
bgti_else.43017:
bgti_cont.43018:
	j	bgti_cont.42994
bgti_else.43015:
	addi	%a0, %a0, -30
bgti_cont.43016:
	j	bgti_cont.42994
bgti_else.43013:
	addi	%a0, %a0, -20
bgti_cont.43014:
	j	bgti_cont.42994
bgti_else.43011:
	addi	%a0, %a0, -10
bgti_cont.43012:
	j	bgti_cont.42994
bgti_else.43009:
bgti_cont.43010:
	j	bgti_cont.42994
bgti_else.43007:
	addi	%a0, %a0, -30
bgti_cont.43008:
	j	bgti_cont.42994
bgti_else.43005:
	addi	%a0, %a0, -20
bgti_cont.43006:
	j	bgti_cont.42994
bgti_else.43003:
	addi	%a0, %a0, -10
bgti_cont.43004:
	j	bgti_cont.42994
bgti_else.43001:
bgti_cont.43002:
	j	bgti_cont.42994
bgti_else.42999:
	addi	%a0, %a0, -30
bgti_cont.43000:
	j	bgti_cont.42994
bgti_else.42997:
	addi	%a0, %a0, -20
bgti_cont.42998:
	j	bgti_cont.42994
bgti_else.42995:
	addi	%a0, %a0, -10
bgti_cont.42996:
	j	bgti_cont.42994
bgti_else.42993:
bgti_cont.42994:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.42992:
bgt_cont.42958:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	lw	%a0, 0(%sp)
	addi	%t3, %a0, 1
	blt	%t3, %t0, bgt_else.43025
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	jr	%ra
bgt_else.43025:
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
	blt	%a0, %a1, bgt_else.43027
	add	%a0, %zero, %zero
	j	bgt_cont.43028
bgt_else.43027:
	lw	%a0, 1(%sp)
	blt	%zero, %a0, bgt_else.43029
	add	%a0, %zero, %zero
	j	bgt_cont.43030
bgt_else.43029:
	addi	%a0, %t3, 1
	blt	%a0, %t0, bgt_else.43031
	add	%a0, %zero, %zero
	j	bgt_cont.43032
bgt_else.43031:
	blt	%zero, %t3, bgt_else.43033
	add	%a0, %zero, %zero
	j	bgt_cont.43034
bgt_else.43033:
	add	%a0, %zero, %k1
bgt_cont.43034:
bgt_cont.43032:
bgt_cont.43030:
bgt_cont.43028:
	beqi	%a0, 0, bnei_else.43035
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -14
	j	bnei_cont.43036
bnei_else.43035:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
bnei_cont.43036:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.43037
	blti	%a1, 0, bgti_else.43039
	j	bgt_cont.43038
bgti_else.43039:
	add	%a1, %zero, %zero
bgti_cont.43040:
	j	bgt_cont.43038
bgt_else.43037:
	addi	%a1, %zero, 255
bgt_cont.43038:
	blti	%a1, 10, bgti_else.43041
	blti	%a1, 20, bgti_else.43043
	blti	%a1, 30, bgti_else.43045
	blti	%a1, 40, bgti_else.43047
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.43049
	blti	%a0, 20, bgti_else.43051
	blti	%a0, 30, bgti_else.43053
	blti	%a0, 40, bgti_else.43055
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43057
	blti	%a0, 20, bgti_else.43059
	blti	%a0, 30, bgti_else.43061
	blti	%a0, 40, bgti_else.43063
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.43042
bgti_else.43063:
	addi	%a2, %zero, 11
bgti_cont.43064:
	j	bgti_cont.43042
bgti_else.43061:
	addi	%a2, %zero, 10
bgti_cont.43062:
	j	bgti_cont.43042
bgti_else.43059:
	addi	%a2, %zero, 9
bgti_cont.43060:
	j	bgti_cont.43042
bgti_else.43057:
	addi	%a2, %zero, 8
bgti_cont.43058:
	j	bgti_cont.43042
bgti_else.43055:
	addi	%a2, %zero, 7
bgti_cont.43056:
	j	bgti_cont.43042
bgti_else.43053:
	addi	%a2, %zero, 6
bgti_cont.43054:
	j	bgti_cont.43042
bgti_else.43051:
	addi	%a2, %zero, 5
bgti_cont.43052:
	j	bgti_cont.43042
bgti_else.43049:
	addi	%a2, %zero, 4
bgti_cont.43050:
	j	bgti_cont.43042
bgti_else.43047:
	addi	%a2, %zero, 3
bgti_cont.43048:
	j	bgti_cont.43042
bgti_else.43045:
	addi	%a2, %zero, 2
bgti_cont.43046:
	j	bgti_cont.43042
bgti_else.43043:
	add	%a2, %zero, %k1
bgti_cont.43044:
	j	bgti_cont.43042
bgti_else.43041:
	add	%a2, %zero, %zero
bgti_cont.43042:
	blti	%a1, 10, bgti_else.43065
	blti	%a1, 20, bgti_else.43067
	blti	%a1, 30, bgti_else.43069
	blti	%a1, 40, bgti_else.43071
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.43066
	blti	%a1, 20, bgti_else.43075
	blti	%a1, 30, bgti_else.43077
	blti	%a1, 40, bgti_else.43079
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.43066
	blti	%a1, 20, bgti_else.43083
	blti	%a1, 30, bgti_else.43085
	blti	%a1, 40, bgti_else.43087
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.43066
bgti_else.43087:
	addi	%a1, %a1, -30
bgti_cont.43088:
	j	bgti_cont.43066
bgti_else.43085:
	addi	%a1, %a1, -20
bgti_cont.43086:
	j	bgti_cont.43066
bgti_else.43083:
	addi	%a1, %a1, -10
bgti_cont.43084:
	j	bgti_cont.43066
bgti_else.43081:
bgti_cont.43082:
	j	bgti_cont.43066
bgti_else.43079:
	addi	%a1, %a1, -30
bgti_cont.43080:
	j	bgti_cont.43066
bgti_else.43077:
	addi	%a1, %a1, -20
bgti_cont.43078:
	j	bgti_cont.43066
bgti_else.43075:
	addi	%a1, %a1, -10
bgti_cont.43076:
	j	bgti_cont.43066
bgti_else.43073:
bgti_cont.43074:
	j	bgti_cont.43066
bgti_else.43071:
	addi	%a1, %a1, -30
bgti_cont.43072:
	j	bgti_cont.43066
bgti_else.43069:
	addi	%a1, %a1, -20
bgti_cont.43070:
	j	bgti_cont.43066
bgti_else.43067:
	addi	%a1, %a1, -10
bgti_cont.43068:
	j	bgti_cont.43066
bgti_else.43065:
bgti_cont.43066:
	blt	%zero, %a2, bgt_else.43089
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.43090
bgt_else.43089:
	blti	%a2, 10, bgti_else.43091
	blti	%a2, 20, bgti_else.43093
	blti	%a2, 30, bgti_else.43095
	blti	%a2, 40, bgti_else.43097
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.43099
	blti	%a0, 20, bgti_else.43101
	blti	%a0, 30, bgti_else.43103
	blti	%a0, 40, bgti_else.43105
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43107
	blti	%a0, 20, bgti_else.43109
	blti	%a0, 30, bgti_else.43111
	blti	%a0, 40, bgti_else.43113
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.43092
bgti_else.43113:
	addi	%a0, %zero, 11
bgti_cont.43114:
	j	bgti_cont.43092
bgti_else.43111:
	addi	%a0, %zero, 10
bgti_cont.43112:
	j	bgti_cont.43092
bgti_else.43109:
	addi	%a0, %zero, 9
bgti_cont.43110:
	j	bgti_cont.43092
bgti_else.43107:
	addi	%a0, %zero, 8
bgti_cont.43108:
	j	bgti_cont.43092
bgti_else.43105:
	addi	%a0, %zero, 7
bgti_cont.43106:
	j	bgti_cont.43092
bgti_else.43103:
	addi	%a0, %zero, 6
bgti_cont.43104:
	j	bgti_cont.43092
bgti_else.43101:
	addi	%a0, %zero, 5
bgti_cont.43102:
	j	bgti_cont.43092
bgti_else.43099:
	addi	%a0, %zero, 4
bgti_cont.43100:
	j	bgti_cont.43092
bgti_else.43097:
	addi	%a0, %zero, 3
bgti_cont.43098:
	j	bgti_cont.43092
bgti_else.43095:
	addi	%a0, %zero, 2
bgti_cont.43096:
	j	bgti_cont.43092
bgti_else.43093:
	add	%a0, %zero, %k1
bgti_cont.43094:
	j	bgti_cont.43092
bgti_else.43091:
	add	%a0, %zero, %zero
bgti_cont.43092:
	blti	%a2, 10, bgti_else.43115
	blti	%a2, 20, bgti_else.43117
	blti	%a2, 30, bgti_else.43119
	blti	%a2, 40, bgti_else.43121
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43116
	blti	%a2, 20, bgti_else.43125
	blti	%a2, 30, bgti_else.43127
	blti	%a2, 40, bgti_else.43129
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43116
	blti	%a2, 20, bgti_else.43133
	blti	%a2, 30, bgti_else.43135
	blti	%a2, 40, bgti_else.43137
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.43116
bgti_else.43137:
	addi	%a2, %a2, -30
bgti_cont.43138:
	j	bgti_cont.43116
bgti_else.43135:
	addi	%a2, %a2, -20
bgti_cont.43136:
	j	bgti_cont.43116
bgti_else.43133:
	addi	%a2, %a2, -10
bgti_cont.43134:
	j	bgti_cont.43116
bgti_else.43131:
bgti_cont.43132:
	j	bgti_cont.43116
bgti_else.43129:
	addi	%a2, %a2, -30
bgti_cont.43130:
	j	bgti_cont.43116
bgti_else.43127:
	addi	%a2, %a2, -20
bgti_cont.43128:
	j	bgti_cont.43116
bgti_else.43125:
	addi	%a2, %a2, -10
bgti_cont.43126:
	j	bgti_cont.43116
bgti_else.43123:
bgti_cont.43124:
	j	bgti_cont.43116
bgti_else.43121:
	addi	%a2, %a2, -30
bgti_cont.43122:
	j	bgti_cont.43116
bgti_else.43119:
	addi	%a2, %a2, -20
bgti_cont.43120:
	j	bgti_cont.43116
bgti_else.43117:
	addi	%a2, %a2, -10
bgti_cont.43118:
	j	bgti_cont.43116
bgti_else.43115:
bgti_cont.43116:
	blt	%zero, %a0, bgt_else.43139
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.43140
bgt_else.43139:
	blti	%a0, 10, bgti_else.43141
	blti	%a0, 20, bgti_else.43143
	blti	%a0, 30, bgti_else.43145
	blti	%a0, 40, bgti_else.43147
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43142
	blti	%a0, 20, bgti_else.43151
	blti	%a0, 30, bgti_else.43153
	blti	%a0, 40, bgti_else.43155
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43142
	blti	%a0, 20, bgti_else.43159
	blti	%a0, 30, bgti_else.43161
	blti	%a0, 40, bgti_else.43163
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.43142
bgti_else.43163:
	addi	%a0, %a0, -30
bgti_cont.43164:
	j	bgti_cont.43142
bgti_else.43161:
	addi	%a0, %a0, -20
bgti_cont.43162:
	j	bgti_cont.43142
bgti_else.43159:
	addi	%a0, %a0, -10
bgti_cont.43160:
	j	bgti_cont.43142
bgti_else.43157:
bgti_cont.43158:
	j	bgti_cont.43142
bgti_else.43155:
	addi	%a0, %a0, -30
bgti_cont.43156:
	j	bgti_cont.43142
bgti_else.43153:
	addi	%a0, %a0, -20
bgti_cont.43154:
	j	bgti_cont.43142
bgti_else.43151:
	addi	%a0, %a0, -10
bgti_cont.43152:
	j	bgti_cont.43142
bgti_else.43149:
bgti_cont.43150:
	j	bgti_cont.43142
bgti_else.43147:
	addi	%a0, %a0, -30
bgti_cont.43148:
	j	bgti_cont.43142
bgti_else.43145:
	addi	%a0, %a0, -20
bgti_cont.43146:
	j	bgti_cont.43142
bgti_else.43143:
	addi	%a0, %a0, -10
bgti_cont.43144:
	j	bgti_cont.43142
bgti_else.43141:
bgti_cont.43142:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.43140:
bgt_cont.43090:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.43165
	blti	%a1, 0, bgti_else.43167
	j	bgt_cont.43166
bgti_else.43167:
	add	%a1, %zero, %zero
bgti_cont.43168:
	j	bgt_cont.43166
bgt_else.43165:
	addi	%a1, %zero, 255
bgt_cont.43166:
	blti	%a1, 10, bgti_else.43169
	blti	%a1, 20, bgti_else.43171
	blti	%a1, 30, bgti_else.43173
	blti	%a1, 40, bgti_else.43175
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.43177
	blti	%a0, 20, bgti_else.43179
	blti	%a0, 30, bgti_else.43181
	blti	%a0, 40, bgti_else.43183
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43185
	blti	%a0, 20, bgti_else.43187
	blti	%a0, 30, bgti_else.43189
	blti	%a0, 40, bgti_else.43191
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.43170
bgti_else.43191:
	addi	%a2, %zero, 11
bgti_cont.43192:
	j	bgti_cont.43170
bgti_else.43189:
	addi	%a2, %zero, 10
bgti_cont.43190:
	j	bgti_cont.43170
bgti_else.43187:
	addi	%a2, %zero, 9
bgti_cont.43188:
	j	bgti_cont.43170
bgti_else.43185:
	addi	%a2, %zero, 8
bgti_cont.43186:
	j	bgti_cont.43170
bgti_else.43183:
	addi	%a2, %zero, 7
bgti_cont.43184:
	j	bgti_cont.43170
bgti_else.43181:
	addi	%a2, %zero, 6
bgti_cont.43182:
	j	bgti_cont.43170
bgti_else.43179:
	addi	%a2, %zero, 5
bgti_cont.43180:
	j	bgti_cont.43170
bgti_else.43177:
	addi	%a2, %zero, 4
bgti_cont.43178:
	j	bgti_cont.43170
bgti_else.43175:
	addi	%a2, %zero, 3
bgti_cont.43176:
	j	bgti_cont.43170
bgti_else.43173:
	addi	%a2, %zero, 2
bgti_cont.43174:
	j	bgti_cont.43170
bgti_else.43171:
	add	%a2, %zero, %k1
bgti_cont.43172:
	j	bgti_cont.43170
bgti_else.43169:
	add	%a2, %zero, %zero
bgti_cont.43170:
	blti	%a1, 10, bgti_else.43193
	blti	%a1, 20, bgti_else.43195
	blti	%a1, 30, bgti_else.43197
	blti	%a1, 40, bgti_else.43199
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.43194
	blti	%a1, 20, bgti_else.43203
	blti	%a1, 30, bgti_else.43205
	blti	%a1, 40, bgti_else.43207
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.43194
	blti	%a1, 20, bgti_else.43211
	blti	%a1, 30, bgti_else.43213
	blti	%a1, 40, bgti_else.43215
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.43194
bgti_else.43215:
	addi	%a1, %a1, -30
bgti_cont.43216:
	j	bgti_cont.43194
bgti_else.43213:
	addi	%a1, %a1, -20
bgti_cont.43214:
	j	bgti_cont.43194
bgti_else.43211:
	addi	%a1, %a1, -10
bgti_cont.43212:
	j	bgti_cont.43194
bgti_else.43209:
bgti_cont.43210:
	j	bgti_cont.43194
bgti_else.43207:
	addi	%a1, %a1, -30
bgti_cont.43208:
	j	bgti_cont.43194
bgti_else.43205:
	addi	%a1, %a1, -20
bgti_cont.43206:
	j	bgti_cont.43194
bgti_else.43203:
	addi	%a1, %a1, -10
bgti_cont.43204:
	j	bgti_cont.43194
bgti_else.43201:
bgti_cont.43202:
	j	bgti_cont.43194
bgti_else.43199:
	addi	%a1, %a1, -30
bgti_cont.43200:
	j	bgti_cont.43194
bgti_else.43197:
	addi	%a1, %a1, -20
bgti_cont.43198:
	j	bgti_cont.43194
bgti_else.43195:
	addi	%a1, %a1, -10
bgti_cont.43196:
	j	bgti_cont.43194
bgti_else.43193:
bgti_cont.43194:
	blt	%zero, %a2, bgt_else.43217
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.43218
bgt_else.43217:
	blti	%a2, 10, bgti_else.43219
	blti	%a2, 20, bgti_else.43221
	blti	%a2, 30, bgti_else.43223
	blti	%a2, 40, bgti_else.43225
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.43227
	blti	%a0, 20, bgti_else.43229
	blti	%a0, 30, bgti_else.43231
	blti	%a0, 40, bgti_else.43233
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43235
	blti	%a0, 20, bgti_else.43237
	blti	%a0, 30, bgti_else.43239
	blti	%a0, 40, bgti_else.43241
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.43220
bgti_else.43241:
	addi	%a0, %zero, 11
bgti_cont.43242:
	j	bgti_cont.43220
bgti_else.43239:
	addi	%a0, %zero, 10
bgti_cont.43240:
	j	bgti_cont.43220
bgti_else.43237:
	addi	%a0, %zero, 9
bgti_cont.43238:
	j	bgti_cont.43220
bgti_else.43235:
	addi	%a0, %zero, 8
bgti_cont.43236:
	j	bgti_cont.43220
bgti_else.43233:
	addi	%a0, %zero, 7
bgti_cont.43234:
	j	bgti_cont.43220
bgti_else.43231:
	addi	%a0, %zero, 6
bgti_cont.43232:
	j	bgti_cont.43220
bgti_else.43229:
	addi	%a0, %zero, 5
bgti_cont.43230:
	j	bgti_cont.43220
bgti_else.43227:
	addi	%a0, %zero, 4
bgti_cont.43228:
	j	bgti_cont.43220
bgti_else.43225:
	addi	%a0, %zero, 3
bgti_cont.43226:
	j	bgti_cont.43220
bgti_else.43223:
	addi	%a0, %zero, 2
bgti_cont.43224:
	j	bgti_cont.43220
bgti_else.43221:
	add	%a0, %zero, %k1
bgti_cont.43222:
	j	bgti_cont.43220
bgti_else.43219:
	add	%a0, %zero, %zero
bgti_cont.43220:
	blti	%a2, 10, bgti_else.43243
	blti	%a2, 20, bgti_else.43245
	blti	%a2, 30, bgti_else.43247
	blti	%a2, 40, bgti_else.43249
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43244
	blti	%a2, 20, bgti_else.43253
	blti	%a2, 30, bgti_else.43255
	blti	%a2, 40, bgti_else.43257
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43244
	blti	%a2, 20, bgti_else.43261
	blti	%a2, 30, bgti_else.43263
	blti	%a2, 40, bgti_else.43265
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.43244
bgti_else.43265:
	addi	%a2, %a2, -30
bgti_cont.43266:
	j	bgti_cont.43244
bgti_else.43263:
	addi	%a2, %a2, -20
bgti_cont.43264:
	j	bgti_cont.43244
bgti_else.43261:
	addi	%a2, %a2, -10
bgti_cont.43262:
	j	bgti_cont.43244
bgti_else.43259:
bgti_cont.43260:
	j	bgti_cont.43244
bgti_else.43257:
	addi	%a2, %a2, -30
bgti_cont.43258:
	j	bgti_cont.43244
bgti_else.43255:
	addi	%a2, %a2, -20
bgti_cont.43256:
	j	bgti_cont.43244
bgti_else.43253:
	addi	%a2, %a2, -10
bgti_cont.43254:
	j	bgti_cont.43244
bgti_else.43251:
bgti_cont.43252:
	j	bgti_cont.43244
bgti_else.43249:
	addi	%a2, %a2, -30
bgti_cont.43250:
	j	bgti_cont.43244
bgti_else.43247:
	addi	%a2, %a2, -20
bgti_cont.43248:
	j	bgti_cont.43244
bgti_else.43245:
	addi	%a2, %a2, -10
bgti_cont.43246:
	j	bgti_cont.43244
bgti_else.43243:
bgti_cont.43244:
	blt	%zero, %a0, bgt_else.43267
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.43268
bgt_else.43267:
	blti	%a0, 10, bgti_else.43269
	blti	%a0, 20, bgti_else.43271
	blti	%a0, 30, bgti_else.43273
	blti	%a0, 40, bgti_else.43275
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43270
	blti	%a0, 20, bgti_else.43279
	blti	%a0, 30, bgti_else.43281
	blti	%a0, 40, bgti_else.43283
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43270
	blti	%a0, 20, bgti_else.43287
	blti	%a0, 30, bgti_else.43289
	blti	%a0, 40, bgti_else.43291
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.43270
bgti_else.43291:
	addi	%a0, %a0, -30
bgti_cont.43292:
	j	bgti_cont.43270
bgti_else.43289:
	addi	%a0, %a0, -20
bgti_cont.43290:
	j	bgti_cont.43270
bgti_else.43287:
	addi	%a0, %a0, -10
bgti_cont.43288:
	j	bgti_cont.43270
bgti_else.43285:
bgti_cont.43286:
	j	bgti_cont.43270
bgti_else.43283:
	addi	%a0, %a0, -30
bgti_cont.43284:
	j	bgti_cont.43270
bgti_else.43281:
	addi	%a0, %a0, -20
bgti_cont.43282:
	j	bgti_cont.43270
bgti_else.43279:
	addi	%a0, %a0, -10
bgti_cont.43280:
	j	bgti_cont.43270
bgti_else.43277:
bgti_cont.43278:
	j	bgti_cont.43270
bgti_else.43275:
	addi	%a0, %a0, -30
bgti_cont.43276:
	j	bgti_cont.43270
bgti_else.43273:
	addi	%a0, %a0, -20
bgti_cont.43274:
	j	bgti_cont.43270
bgti_else.43271:
	addi	%a0, %a0, -10
bgti_cont.43272:
	j	bgti_cont.43270
bgti_else.43269:
bgti_cont.43270:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.43268:
bgt_cont.43218:
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.43293
	blti	%a1, 0, bgti_else.43295
	j	bgt_cont.43294
bgti_else.43295:
	add	%a1, %zero, %zero
bgti_cont.43296:
	j	bgt_cont.43294
bgt_else.43293:
	addi	%a1, %zero, 255
bgt_cont.43294:
	blti	%a1, 10, bgti_else.43297
	blti	%a1, 20, bgti_else.43299
	blti	%a1, 30, bgti_else.43301
	blti	%a1, 40, bgti_else.43303
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.43305
	blti	%a0, 20, bgti_else.43307
	blti	%a0, 30, bgti_else.43309
	blti	%a0, 40, bgti_else.43311
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43313
	blti	%a0, 20, bgti_else.43315
	blti	%a0, 30, bgti_else.43317
	blti	%a0, 40, bgti_else.43319
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.43298
bgti_else.43319:
	addi	%a2, %zero, 11
bgti_cont.43320:
	j	bgti_cont.43298
bgti_else.43317:
	addi	%a2, %zero, 10
bgti_cont.43318:
	j	bgti_cont.43298
bgti_else.43315:
	addi	%a2, %zero, 9
bgti_cont.43316:
	j	bgti_cont.43298
bgti_else.43313:
	addi	%a2, %zero, 8
bgti_cont.43314:
	j	bgti_cont.43298
bgti_else.43311:
	addi	%a2, %zero, 7
bgti_cont.43312:
	j	bgti_cont.43298
bgti_else.43309:
	addi	%a2, %zero, 6
bgti_cont.43310:
	j	bgti_cont.43298
bgti_else.43307:
	addi	%a2, %zero, 5
bgti_cont.43308:
	j	bgti_cont.43298
bgti_else.43305:
	addi	%a2, %zero, 4
bgti_cont.43306:
	j	bgti_cont.43298
bgti_else.43303:
	addi	%a2, %zero, 3
bgti_cont.43304:
	j	bgti_cont.43298
bgti_else.43301:
	addi	%a2, %zero, 2
bgti_cont.43302:
	j	bgti_cont.43298
bgti_else.43299:
	add	%a2, %zero, %k1
bgti_cont.43300:
	j	bgti_cont.43298
bgti_else.43297:
	add	%a2, %zero, %zero
bgti_cont.43298:
	blti	%a1, 10, bgti_else.43321
	blti	%a1, 20, bgti_else.43323
	blti	%a1, 30, bgti_else.43325
	blti	%a1, 40, bgti_else.43327
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.43322
	blti	%a1, 20, bgti_else.43331
	blti	%a1, 30, bgti_else.43333
	blti	%a1, 40, bgti_else.43335
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.43322
	blti	%a1, 20, bgti_else.43339
	blti	%a1, 30, bgti_else.43341
	blti	%a1, 40, bgti_else.43343
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0
	j	bgti_cont.43322
bgti_else.43343:
	addi	%a1, %a1, -30
bgti_cont.43344:
	j	bgti_cont.43322
bgti_else.43341:
	addi	%a1, %a1, -20
bgti_cont.43342:
	j	bgti_cont.43322
bgti_else.43339:
	addi	%a1, %a1, -10
bgti_cont.43340:
	j	bgti_cont.43322
bgti_else.43337:
bgti_cont.43338:
	j	bgti_cont.43322
bgti_else.43335:
	addi	%a1, %a1, -30
bgti_cont.43336:
	j	bgti_cont.43322
bgti_else.43333:
	addi	%a1, %a1, -20
bgti_cont.43334:
	j	bgti_cont.43322
bgti_else.43331:
	addi	%a1, %a1, -10
bgti_cont.43332:
	j	bgti_cont.43322
bgti_else.43329:
bgti_cont.43330:
	j	bgti_cont.43322
bgti_else.43327:
	addi	%a1, %a1, -30
bgti_cont.43328:
	j	bgti_cont.43322
bgti_else.43325:
	addi	%a1, %a1, -20
bgti_cont.43326:
	j	bgti_cont.43322
bgti_else.43323:
	addi	%a1, %a1, -10
bgti_cont.43324:
	j	bgti_cont.43322
bgti_else.43321:
bgti_cont.43322:
	blt	%zero, %a2, bgt_else.43345
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.43346
bgt_else.43345:
	blti	%a2, 10, bgti_else.43347
	blti	%a2, 20, bgti_else.43349
	blti	%a2, 30, bgti_else.43351
	blti	%a2, 40, bgti_else.43353
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.43355
	blti	%a0, 20, bgti_else.43357
	blti	%a0, 30, bgti_else.43359
	blti	%a0, 40, bgti_else.43361
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43363
	blti	%a0, 20, bgti_else.43365
	blti	%a0, 30, bgti_else.43367
	blti	%a0, 40, bgti_else.43369
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.43348
bgti_else.43369:
	addi	%a0, %zero, 11
bgti_cont.43370:
	j	bgti_cont.43348
bgti_else.43367:
	addi	%a0, %zero, 10
bgti_cont.43368:
	j	bgti_cont.43348
bgti_else.43365:
	addi	%a0, %zero, 9
bgti_cont.43366:
	j	bgti_cont.43348
bgti_else.43363:
	addi	%a0, %zero, 8
bgti_cont.43364:
	j	bgti_cont.43348
bgti_else.43361:
	addi	%a0, %zero, 7
bgti_cont.43362:
	j	bgti_cont.43348
bgti_else.43359:
	addi	%a0, %zero, 6
bgti_cont.43360:
	j	bgti_cont.43348
bgti_else.43357:
	addi	%a0, %zero, 5
bgti_cont.43358:
	j	bgti_cont.43348
bgti_else.43355:
	addi	%a0, %zero, 4
bgti_cont.43356:
	j	bgti_cont.43348
bgti_else.43353:
	addi	%a0, %zero, 3
bgti_cont.43354:
	j	bgti_cont.43348
bgti_else.43351:
	addi	%a0, %zero, 2
bgti_cont.43352:
	j	bgti_cont.43348
bgti_else.43349:
	add	%a0, %zero, %k1
bgti_cont.43350:
	j	bgti_cont.43348
bgti_else.43347:
	add	%a0, %zero, %zero
bgti_cont.43348:
	blti	%a2, 10, bgti_else.43371
	blti	%a2, 20, bgti_else.43373
	blti	%a2, 30, bgti_else.43375
	blti	%a2, 40, bgti_else.43377
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43372
	blti	%a2, 20, bgti_else.43381
	blti	%a2, 30, bgti_else.43383
	blti	%a2, 40, bgti_else.43385
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.43372
	blti	%a2, 20, bgti_else.43389
	blti	%a2, 30, bgti_else.43391
	blti	%a2, 40, bgti_else.43393
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0
	j	bgti_cont.43372
bgti_else.43393:
	addi	%a2, %a2, -30
bgti_cont.43394:
	j	bgti_cont.43372
bgti_else.43391:
	addi	%a2, %a2, -20
bgti_cont.43392:
	j	bgti_cont.43372
bgti_else.43389:
	addi	%a2, %a2, -10
bgti_cont.43390:
	j	bgti_cont.43372
bgti_else.43387:
bgti_cont.43388:
	j	bgti_cont.43372
bgti_else.43385:
	addi	%a2, %a2, -30
bgti_cont.43386:
	j	bgti_cont.43372
bgti_else.43383:
	addi	%a2, %a2, -20
bgti_cont.43384:
	j	bgti_cont.43372
bgti_else.43381:
	addi	%a2, %a2, -10
bgti_cont.43382:
	j	bgti_cont.43372
bgti_else.43379:
bgti_cont.43380:
	j	bgti_cont.43372
bgti_else.43377:
	addi	%a2, %a2, -30
bgti_cont.43378:
	j	bgti_cont.43372
bgti_else.43375:
	addi	%a2, %a2, -20
bgti_cont.43376:
	j	bgti_cont.43372
bgti_else.43373:
	addi	%a2, %a2, -10
bgti_cont.43374:
	j	bgti_cont.43372
bgti_else.43371:
bgti_cont.43372:
	blt	%zero, %a0, bgt_else.43395
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	j	bgt_cont.43396
bgt_else.43395:
	blti	%a0, 10, bgti_else.43397
	blti	%a0, 20, bgti_else.43399
	blti	%a0, 30, bgti_else.43401
	blti	%a0, 40, bgti_else.43403
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43398
	blti	%a0, 20, bgti_else.43407
	blti	%a0, 30, bgti_else.43409
	blti	%a0, 40, bgti_else.43411
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.43398
	blti	%a0, 20, bgti_else.43415
	blti	%a0, 30, bgti_else.43417
	blti	%a0, 40, bgti_else.43419
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0
	j	bgti_cont.43398
bgti_else.43419:
	addi	%a0, %a0, -30
bgti_cont.43420:
	j	bgti_cont.43398
bgti_else.43417:
	addi	%a0, %a0, -20
bgti_cont.43418:
	j	bgti_cont.43398
bgti_else.43415:
	addi	%a0, %a0, -10
bgti_cont.43416:
	j	bgti_cont.43398
bgti_else.43413:
bgti_cont.43414:
	j	bgti_cont.43398
bgti_else.43411:
	addi	%a0, %a0, -30
bgti_cont.43412:
	j	bgti_cont.43398
bgti_else.43409:
	addi	%a0, %a0, -20
bgti_cont.43410:
	j	bgti_cont.43398
bgti_else.43407:
	addi	%a0, %a0, -10
bgti_cont.43408:
	j	bgti_cont.43398
bgti_else.43405:
bgti_cont.43406:
	j	bgti_cont.43398
bgti_else.43403:
	addi	%a0, %a0, -30
bgti_cont.43404:
	j	bgti_cont.43398
bgti_else.43401:
	addi	%a0, %a0, -20
bgti_cont.43402:
	j	bgti_cont.43398
bgti_else.43399:
	addi	%a0, %a0, -10
bgti_cont.43400:
	j	bgti_cont.43398
bgti_else.43397:
bgti_cont.43398:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -14
bgt_cont.43396:
bgt_cont.43346:
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
	blt	%a3, %t0, bgt_else.44704
	add	%t0, %zero, %a1
	jr	%ra
bgt_else.44704:
	addi	%a1, %t0, -1
	sw	%a1, 10(%sp)
	blt	%a3, %a1, bgt_else.44706
	j	bgt_cont.44707
bgt_else.44706:
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
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -11
bgt_cont.44707:
	lw	%t1, 154(%zero)
	blt	%zero, %t1, bgt_else.44708
	j	bgt_cont.44709
bgt_else.44708:
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
	blt	%a0, %t0, bgt_else.44710
	j	bgt_cont.44711
bgt_else.44710:
	blt	%zero, %a1, bgt_else.44712
	j	bgt_cont.44713
bgt_else.44712:
	blt	%k1, %t1, bgt_else.44714
	j	bgt_cont.44715
bgt_else.44714:
bgt_cont.44715:
bgt_cont.44713:
bgt_cont.44711:
	beqi	%zero, 0, bnei_else.44716
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -11
	j	bnei_cont.44717
bnei_else.44716:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -11
bnei_cont.44717:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44718
	blti	%a1, 0, bgti_else.44720
	j	bgt_cont.44719
bgti_else.44720:
	add	%a1, %zero, %zero
bgti_cont.44721:
	j	bgt_cont.44719
bgt_else.44718:
	addi	%a1, %zero, 255
bgt_cont.44719:
	addi	%a3, %zero, 10
	blti	%a1, 10, bgti_else.44722
	blti	%a1, 20, bgti_else.44724
	blti	%a1, 30, bgti_else.44726
	blti	%a1, 40, bgti_else.44728
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.44730
	blti	%a0, 20, bgti_else.44732
	blti	%a0, 30, bgti_else.44734
	blti	%a0, 40, bgti_else.44736
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44738
	blti	%a0, 20, bgti_else.44740
	blti	%a0, 30, bgti_else.44742
	blti	%a0, 40, bgti_else.44744
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.44723
bgti_else.44744:
	addi	%a2, %zero, 11
bgti_cont.44745:
	j	bgti_cont.44723
bgti_else.44742:
	addi	%a2, %zero, 10
bgti_cont.44743:
	j	bgti_cont.44723
bgti_else.44740:
	addi	%a2, %zero, 9
bgti_cont.44741:
	j	bgti_cont.44723
bgti_else.44738:
	addi	%a2, %zero, 8
bgti_cont.44739:
	j	bgti_cont.44723
bgti_else.44736:
	addi	%a2, %zero, 7
bgti_cont.44737:
	j	bgti_cont.44723
bgti_else.44734:
	addi	%a2, %zero, 6
bgti_cont.44735:
	j	bgti_cont.44723
bgti_else.44732:
	addi	%a2, %zero, 5
bgti_cont.44733:
	j	bgti_cont.44723
bgti_else.44730:
	addi	%a2, %zero, 4
bgti_cont.44731:
	j	bgti_cont.44723
bgti_else.44728:
	addi	%a2, %zero, 3
bgti_cont.44729:
	j	bgti_cont.44723
bgti_else.44726:
	addi	%a2, %zero, 2
bgti_cont.44727:
	j	bgti_cont.44723
bgti_else.44724:
	add	%a2, %zero, %k1
bgti_cont.44725:
	j	bgti_cont.44723
bgti_else.44722:
	add	%a2, %zero, %zero
bgti_cont.44723:
	blti	%a1, 10, bgti_else.44746
	blti	%a1, 20, bgti_else.44748
	blti	%a1, 30, bgti_else.44750
	blti	%a1, 40, bgti_else.44752
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44747
	blti	%a1, 20, bgti_else.44756
	blti	%a1, 30, bgti_else.44758
	blti	%a1, 40, bgti_else.44760
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.44747
	blti	%a1, 20, bgti_else.44764
	blti	%a1, 30, bgti_else.44766
	blti	%a1, 40, bgti_else.44768
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.44747
bgti_else.44768:
	addi	%a1, %a1, -30
bgti_cont.44769:
	j	bgti_cont.44747
bgti_else.44766:
	addi	%a1, %a1, -20
bgti_cont.44767:
	j	bgti_cont.44747
bgti_else.44764:
	addi	%a1, %a1, -10
bgti_cont.44765:
	j	bgti_cont.44747
bgti_else.44762:
bgti_cont.44763:
	j	bgti_cont.44747
bgti_else.44760:
	addi	%a1, %a1, -30
bgti_cont.44761:
	j	bgti_cont.44747
bgti_else.44758:
	addi	%a1, %a1, -20
bgti_cont.44759:
	j	bgti_cont.44747
bgti_else.44756:
	addi	%a1, %a1, -10
bgti_cont.44757:
	j	bgti_cont.44747
bgti_else.44754:
bgti_cont.44755:
	j	bgti_cont.44747
bgti_else.44752:
	addi	%a1, %a1, -30
bgti_cont.44753:
	j	bgti_cont.44747
bgti_else.44750:
	addi	%a1, %a1, -20
bgti_cont.44751:
	j	bgti_cont.44747
bgti_else.44748:
	addi	%a1, %a1, -10
bgti_cont.44749:
	j	bgti_cont.44747
bgti_else.44746:
bgti_cont.44747:
	blt	%zero, %a2, bgt_else.44770
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44771
bgt_else.44770:
	blti	%a2, 10, bgti_else.44772
	blti	%a2, 20, bgti_else.44774
	blti	%a2, 30, bgti_else.44776
	blti	%a2, 40, bgti_else.44778
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.44780
	blti	%a0, 20, bgti_else.44782
	blti	%a0, 30, bgti_else.44784
	blti	%a0, 40, bgti_else.44786
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44788
	blti	%a0, 20, bgti_else.44790
	blti	%a0, 30, bgti_else.44792
	blti	%a0, 40, bgti_else.44794
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44773
bgti_else.44794:
	addi	%a0, %zero, 11
bgti_cont.44795:
	j	bgti_cont.44773
bgti_else.44792:
	addi	%a0, %zero, 10
bgti_cont.44793:
	j	bgti_cont.44773
bgti_else.44790:
	addi	%a0, %zero, 9
bgti_cont.44791:
	j	bgti_cont.44773
bgti_else.44788:
	addi	%a0, %zero, 8
bgti_cont.44789:
	j	bgti_cont.44773
bgti_else.44786:
	addi	%a0, %zero, 7
bgti_cont.44787:
	j	bgti_cont.44773
bgti_else.44784:
	addi	%a0, %zero, 6
bgti_cont.44785:
	j	bgti_cont.44773
bgti_else.44782:
	addi	%a0, %zero, 5
bgti_cont.44783:
	j	bgti_cont.44773
bgti_else.44780:
	addi	%a0, %zero, 4
bgti_cont.44781:
	j	bgti_cont.44773
bgti_else.44778:
	addi	%a0, %zero, 3
bgti_cont.44779:
	j	bgti_cont.44773
bgti_else.44776:
	addi	%a0, %zero, 2
bgti_cont.44777:
	j	bgti_cont.44773
bgti_else.44774:
	add	%a0, %zero, %k1
bgti_cont.44775:
	j	bgti_cont.44773
bgti_else.44772:
	add	%a0, %zero, %zero
bgti_cont.44773:
	blti	%a2, 10, bgti_else.44796
	blti	%a2, 20, bgti_else.44798
	blti	%a2, 30, bgti_else.44800
	blti	%a2, 40, bgti_else.44802
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44797
	blti	%a2, 20, bgti_else.44806
	blti	%a2, 30, bgti_else.44808
	blti	%a2, 40, bgti_else.44810
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44797
	blti	%a2, 20, bgti_else.44814
	blti	%a2, 30, bgti_else.44816
	blti	%a2, 40, bgti_else.44818
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.44797
bgti_else.44818:
	addi	%a2, %a2, -30
bgti_cont.44819:
	j	bgti_cont.44797
bgti_else.44816:
	addi	%a2, %a2, -20
bgti_cont.44817:
	j	bgti_cont.44797
bgti_else.44814:
	addi	%a2, %a2, -10
bgti_cont.44815:
	j	bgti_cont.44797
bgti_else.44812:
bgti_cont.44813:
	j	bgti_cont.44797
bgti_else.44810:
	addi	%a2, %a2, -30
bgti_cont.44811:
	j	bgti_cont.44797
bgti_else.44808:
	addi	%a2, %a2, -20
bgti_cont.44809:
	j	bgti_cont.44797
bgti_else.44806:
	addi	%a2, %a2, -10
bgti_cont.44807:
	j	bgti_cont.44797
bgti_else.44804:
bgti_cont.44805:
	j	bgti_cont.44797
bgti_else.44802:
	addi	%a2, %a2, -30
bgti_cont.44803:
	j	bgti_cont.44797
bgti_else.44800:
	addi	%a2, %a2, -20
bgti_cont.44801:
	j	bgti_cont.44797
bgti_else.44798:
	addi	%a2, %a2, -10
bgti_cont.44799:
	j	bgti_cont.44797
bgti_else.44796:
bgti_cont.44797:
	blt	%zero, %a0, bgt_else.44820
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44821
bgt_else.44820:
	blti	%a0, 10, bgti_else.44822
	blti	%a0, 20, bgti_else.44824
	blti	%a0, 30, bgti_else.44826
	blti	%a0, 40, bgti_else.44828
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44823
	blti	%a0, 20, bgti_else.44832
	blti	%a0, 30, bgti_else.44834
	blti	%a0, 40, bgti_else.44836
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44823
	blti	%a0, 20, bgti_else.44840
	blti	%a0, 30, bgti_else.44842
	blti	%a0, 40, bgti_else.44844
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44823
bgti_else.44844:
	addi	%a0, %a0, -30
bgti_cont.44845:
	j	bgti_cont.44823
bgti_else.44842:
	addi	%a0, %a0, -20
bgti_cont.44843:
	j	bgti_cont.44823
bgti_else.44840:
	addi	%a0, %a0, -10
bgti_cont.44841:
	j	bgti_cont.44823
bgti_else.44838:
bgti_cont.44839:
	j	bgti_cont.44823
bgti_else.44836:
	addi	%a0, %a0, -30
bgti_cont.44837:
	j	bgti_cont.44823
bgti_else.44834:
	addi	%a0, %a0, -20
bgti_cont.44835:
	j	bgti_cont.44823
bgti_else.44832:
	addi	%a0, %a0, -10
bgti_cont.44833:
	j	bgti_cont.44823
bgti_else.44830:
bgti_cont.44831:
	j	bgti_cont.44823
bgti_else.44828:
	addi	%a0, %a0, -30
bgti_cont.44829:
	j	bgti_cont.44823
bgti_else.44826:
	addi	%a0, %a0, -20
bgti_cont.44827:
	j	bgti_cont.44823
bgti_else.44824:
	addi	%a0, %a0, -10
bgti_cont.44825:
	j	bgti_cont.44823
bgti_else.44822:
bgti_cont.44823:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.44821:
bgt_cont.44771:
	addi	%a1, %zero, 32
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 152(%zero)
	ftoi	%a2, %f0
	addi	%at, %zero, 255
	blt	%at, %a2, bgt_else.44846
	blti	%a2, 0, bgti_else.44848
	j	bgt_cont.44847
bgti_else.44848:
	add	%a2, %zero, %zero
bgti_cont.44849:
	j	bgt_cont.44847
bgt_else.44846:
	addi	%a2, %zero, 255
bgt_cont.44847:
	blti	%a2, 10, bgti_else.44850
	blti	%a2, 20, bgti_else.44852
	blti	%a2, 30, bgti_else.44854
	blti	%a2, 40, bgti_else.44856
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.44858
	blti	%a0, 20, bgti_else.44860
	blti	%a0, 30, bgti_else.44862
	blti	%a0, 40, bgti_else.44864
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44866
	blti	%a0, 20, bgti_else.44868
	blti	%a0, 30, bgti_else.44870
	blti	%a0, 40, bgti_else.44872
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%fp, %v0, 0
	j	bgti_cont.44851
bgti_else.44872:
	addi	%fp, %zero, 11
bgti_cont.44873:
	j	bgti_cont.44851
bgti_else.44870:
	addi	%fp, %zero, 10
bgti_cont.44871:
	j	bgti_cont.44851
bgti_else.44868:
	addi	%fp, %zero, 9
bgti_cont.44869:
	j	bgti_cont.44851
bgti_else.44866:
	addi	%fp, %zero, 8
bgti_cont.44867:
	j	bgti_cont.44851
bgti_else.44864:
	addi	%fp, %zero, 7
bgti_cont.44865:
	j	bgti_cont.44851
bgti_else.44862:
	addi	%fp, %zero, 6
bgti_cont.44863:
	j	bgti_cont.44851
bgti_else.44860:
	addi	%fp, %zero, 5
bgti_cont.44861:
	j	bgti_cont.44851
bgti_else.44858:
	addi	%fp, %zero, 4
bgti_cont.44859:
	j	bgti_cont.44851
bgti_else.44856:
	addi	%fp, %zero, 3
bgti_cont.44857:
	j	bgti_cont.44851
bgti_else.44854:
	addi	%fp, %zero, 2
bgti_cont.44855:
	j	bgti_cont.44851
bgti_else.44852:
	add	%fp, %zero, %k1
bgti_cont.44853:
	j	bgti_cont.44851
bgti_else.44850:
	add	%fp, %zero, %zero
bgti_cont.44851:
	blti	%a2, 10, bgti_else.44874
	blti	%a2, 20, bgti_else.44876
	blti	%a2, 30, bgti_else.44878
	blti	%a2, 40, bgti_else.44880
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44875
	blti	%a2, 20, bgti_else.44884
	blti	%a2, 30, bgti_else.44886
	blti	%a2, 40, bgti_else.44888
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.44875
	blti	%a2, 20, bgti_else.44892
	blti	%a2, 30, bgti_else.44894
	blti	%a2, 40, bgti_else.44896
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.44875
bgti_else.44896:
	addi	%a2, %a2, -30
bgti_cont.44897:
	j	bgti_cont.44875
bgti_else.44894:
	addi	%a2, %a2, -20
bgti_cont.44895:
	j	bgti_cont.44875
bgti_else.44892:
	addi	%a2, %a2, -10
bgti_cont.44893:
	j	bgti_cont.44875
bgti_else.44890:
bgti_cont.44891:
	j	bgti_cont.44875
bgti_else.44888:
	addi	%a2, %a2, -30
bgti_cont.44889:
	j	bgti_cont.44875
bgti_else.44886:
	addi	%a2, %a2, -20
bgti_cont.44887:
	j	bgti_cont.44875
bgti_else.44884:
	addi	%a2, %a2, -10
bgti_cont.44885:
	j	bgti_cont.44875
bgti_else.44882:
bgti_cont.44883:
	j	bgti_cont.44875
bgti_else.44880:
	addi	%a2, %a2, -30
bgti_cont.44881:
	j	bgti_cont.44875
bgti_else.44878:
	addi	%a2, %a2, -20
bgti_cont.44879:
	j	bgti_cont.44875
bgti_else.44876:
	addi	%a2, %a2, -10
bgti_cont.44877:
	j	bgti_cont.44875
bgti_else.44874:
bgti_cont.44875:
	blt	%zero, %fp, bgt_else.44898
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44899
bgt_else.44898:
	blti	%fp, 10, bgti_else.44900
	blti	%fp, 20, bgti_else.44902
	blti	%fp, 30, bgti_else.44904
	blti	%fp, 40, bgti_else.44906
	addi	%a0, %fp, -40
	blti	%a0, 10, bgti_else.44908
	blti	%a0, 20, bgti_else.44910
	blti	%a0, 30, bgti_else.44912
	blti	%a0, 40, bgti_else.44914
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44916
	blti	%a0, 20, bgti_else.44918
	blti	%a0, 30, bgti_else.44920
	blti	%a0, 40, bgti_else.44922
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44901
bgti_else.44922:
	addi	%a0, %zero, 11
bgti_cont.44923:
	j	bgti_cont.44901
bgti_else.44920:
	addi	%a0, %zero, 10
bgti_cont.44921:
	j	bgti_cont.44901
bgti_else.44918:
	addi	%a0, %zero, 9
bgti_cont.44919:
	j	bgti_cont.44901
bgti_else.44916:
	addi	%a0, %zero, 8
bgti_cont.44917:
	j	bgti_cont.44901
bgti_else.44914:
	addi	%a0, %zero, 7
bgti_cont.44915:
	j	bgti_cont.44901
bgti_else.44912:
	addi	%a0, %zero, 6
bgti_cont.44913:
	j	bgti_cont.44901
bgti_else.44910:
	addi	%a0, %zero, 5
bgti_cont.44911:
	j	bgti_cont.44901
bgti_else.44908:
	addi	%a0, %zero, 4
bgti_cont.44909:
	j	bgti_cont.44901
bgti_else.44906:
	addi	%a0, %zero, 3
bgti_cont.44907:
	j	bgti_cont.44901
bgti_else.44904:
	addi	%a0, %zero, 2
bgti_cont.44905:
	j	bgti_cont.44901
bgti_else.44902:
	add	%a0, %zero, %k1
bgti_cont.44903:
	j	bgti_cont.44901
bgti_else.44900:
	add	%a0, %zero, %zero
bgti_cont.44901:
	blti	%fp, 10, bgti_else.44924
	blti	%fp, 20, bgti_else.44926
	blti	%fp, 30, bgti_else.44928
	blti	%fp, 40, bgti_else.44930
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.44925
	blti	%fp, 20, bgti_else.44934
	blti	%fp, 30, bgti_else.44936
	blti	%fp, 40, bgti_else.44938
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.44925
	blti	%fp, 20, bgti_else.44942
	blti	%fp, 30, bgti_else.44944
	blti	%fp, 40, bgti_else.44946
	addi	%v0, %fp, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%fp, %v0, 0
	j	bgti_cont.44925
bgti_else.44946:
	addi	%fp, %fp, -30
bgti_cont.44947:
	j	bgti_cont.44925
bgti_else.44944:
	addi	%fp, %fp, -20
bgti_cont.44945:
	j	bgti_cont.44925
bgti_else.44942:
	addi	%fp, %fp, -10
bgti_cont.44943:
	j	bgti_cont.44925
bgti_else.44940:
bgti_cont.44941:
	j	bgti_cont.44925
bgti_else.44938:
	addi	%fp, %fp, -30
bgti_cont.44939:
	j	bgti_cont.44925
bgti_else.44936:
	addi	%fp, %fp, -20
bgti_cont.44937:
	j	bgti_cont.44925
bgti_else.44934:
	addi	%fp, %fp, -10
bgti_cont.44935:
	j	bgti_cont.44925
bgti_else.44932:
bgti_cont.44933:
	j	bgti_cont.44925
bgti_else.44930:
	addi	%fp, %fp, -30
bgti_cont.44931:
	j	bgti_cont.44925
bgti_else.44928:
	addi	%fp, %fp, -20
bgti_cont.44929:
	j	bgti_cont.44925
bgti_else.44926:
	addi	%fp, %fp, -10
bgti_cont.44927:
	j	bgti_cont.44925
bgti_else.44924:
bgti_cont.44925:
	blt	%zero, %a0, bgt_else.44948
	addi	%v0, %fp, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.44949
bgt_else.44948:
	blti	%a0, 10, bgti_else.44950
	blti	%a0, 20, bgti_else.44952
	blti	%a0, 30, bgti_else.44954
	blti	%a0, 40, bgti_else.44956
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44951
	blti	%a0, 20, bgti_else.44960
	blti	%a0, 30, bgti_else.44962
	blti	%a0, 40, bgti_else.44964
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.44951
	blti	%a0, 20, bgti_else.44968
	blti	%a0, 30, bgti_else.44970
	blti	%a0, 40, bgti_else.44972
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.44951
bgti_else.44972:
	addi	%a0, %a0, -30
bgti_cont.44973:
	j	bgti_cont.44951
bgti_else.44970:
	addi	%a0, %a0, -20
bgti_cont.44971:
	j	bgti_cont.44951
bgti_else.44968:
	addi	%a0, %a0, -10
bgti_cont.44969:
	j	bgti_cont.44951
bgti_else.44966:
bgti_cont.44967:
	j	bgti_cont.44951
bgti_else.44964:
	addi	%a0, %a0, -30
bgti_cont.44965:
	j	bgti_cont.44951
bgti_else.44962:
	addi	%a0, %a0, -20
bgti_cont.44963:
	j	bgti_cont.44951
bgti_else.44960:
	addi	%a0, %a0, -10
bgti_cont.44961:
	j	bgti_cont.44951
bgti_else.44958:
bgti_cont.44959:
	j	bgti_cont.44951
bgti_else.44956:
	addi	%a0, %a0, -30
bgti_cont.44957:
	j	bgti_cont.44951
bgti_else.44954:
	addi	%a0, %a0, -20
bgti_cont.44955:
	j	bgti_cont.44951
bgti_else.44952:
	addi	%a0, %a0, -10
bgti_cont.44953:
	j	bgti_cont.44951
bgti_else.44950:
bgti_cont.44951:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %fp, 48
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.44949:
bgt_cont.44899:
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.44974
	blti	%a1, 0, bgti_else.44976
	j	bgt_cont.44975
bgti_else.44976:
	add	%a1, %zero, %zero
bgti_cont.44977:
	j	bgt_cont.44975
bgt_else.44974:
	addi	%a1, %zero, 255
bgt_cont.44975:
	blti	%a1, 10, bgti_else.44978
	blti	%a1, 20, bgti_else.44980
	blti	%a1, 30, bgti_else.44982
	blti	%a1, 40, bgti_else.44984
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.44986
	blti	%a0, 20, bgti_else.44988
	blti	%a0, 30, bgti_else.44990
	blti	%a0, 40, bgti_else.44992
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44994
	blti	%a0, 20, bgti_else.44996
	blti	%a0, 30, bgti_else.44998
	blti	%a0, 40, bgti_else.45000
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.44979
bgti_else.45000:
	addi	%a2, %zero, 11
bgti_cont.45001:
	j	bgti_cont.44979
bgti_else.44998:
	addi	%a2, %zero, 10
bgti_cont.44999:
	j	bgti_cont.44979
bgti_else.44996:
	addi	%a2, %zero, 9
bgti_cont.44997:
	j	bgti_cont.44979
bgti_else.44994:
	addi	%a2, %zero, 8
bgti_cont.44995:
	j	bgti_cont.44979
bgti_else.44992:
	addi	%a2, %zero, 7
bgti_cont.44993:
	j	bgti_cont.44979
bgti_else.44990:
	addi	%a2, %zero, 6
bgti_cont.44991:
	j	bgti_cont.44979
bgti_else.44988:
	addi	%a2, %zero, 5
bgti_cont.44989:
	j	bgti_cont.44979
bgti_else.44986:
	addi	%a2, %zero, 4
bgti_cont.44987:
	j	bgti_cont.44979
bgti_else.44984:
	addi	%a2, %zero, 3
bgti_cont.44985:
	j	bgti_cont.44979
bgti_else.44982:
	addi	%a2, %zero, 2
bgti_cont.44983:
	j	bgti_cont.44979
bgti_else.44980:
	add	%a2, %zero, %k1
bgti_cont.44981:
	j	bgti_cont.44979
bgti_else.44978:
	add	%a2, %zero, %zero
bgti_cont.44979:
	blti	%a1, 10, bgti_else.45002
	blti	%a1, 20, bgti_else.45004
	blti	%a1, 30, bgti_else.45006
	blti	%a1, 40, bgti_else.45008
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45003
	blti	%a1, 20, bgti_else.45012
	blti	%a1, 30, bgti_else.45014
	blti	%a1, 40, bgti_else.45016
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.45003
	blti	%a1, 20, bgti_else.45020
	blti	%a1, 30, bgti_else.45022
	blti	%a1, 40, bgti_else.45024
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.45003
bgti_else.45024:
	addi	%a1, %a1, -30
bgti_cont.45025:
	j	bgti_cont.45003
bgti_else.45022:
	addi	%a1, %a1, -20
bgti_cont.45023:
	j	bgti_cont.45003
bgti_else.45020:
	addi	%a1, %a1, -10
bgti_cont.45021:
	j	bgti_cont.45003
bgti_else.45018:
bgti_cont.45019:
	j	bgti_cont.45003
bgti_else.45016:
	addi	%a1, %a1, -30
bgti_cont.45017:
	j	bgti_cont.45003
bgti_else.45014:
	addi	%a1, %a1, -20
bgti_cont.45015:
	j	bgti_cont.45003
bgti_else.45012:
	addi	%a1, %a1, -10
bgti_cont.45013:
	j	bgti_cont.45003
bgti_else.45010:
bgti_cont.45011:
	j	bgti_cont.45003
bgti_else.45008:
	addi	%a1, %a1, -30
bgti_cont.45009:
	j	bgti_cont.45003
bgti_else.45006:
	addi	%a1, %a1, -20
bgti_cont.45007:
	j	bgti_cont.45003
bgti_else.45004:
	addi	%a1, %a1, -10
bgti_cont.45005:
	j	bgti_cont.45003
bgti_else.45002:
bgti_cont.45003:
	blt	%zero, %a2, bgt_else.45026
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.45027
bgt_else.45026:
	blti	%a2, 10, bgti_else.45028
	blti	%a2, 20, bgti_else.45030
	blti	%a2, 30, bgti_else.45032
	blti	%a2, 40, bgti_else.45034
	addi	%a0, %a2, -40
	blti	%a0, 10, bgti_else.45036
	blti	%a0, 20, bgti_else.45038
	blti	%a0, 30, bgti_else.45040
	blti	%a0, 40, bgti_else.45042
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45044
	blti	%a0, 20, bgti_else.45046
	blti	%a0, 30, bgti_else.45048
	blti	%a0, 40, bgti_else.45050
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	addi	%sp, %sp, 11
	jal	print_int_sub1.2629
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.45029
bgti_else.45050:
	addi	%a0, %zero, 11
bgti_cont.45051:
	j	bgti_cont.45029
bgti_else.45048:
	addi	%a0, %zero, 10
bgti_cont.45049:
	j	bgti_cont.45029
bgti_else.45046:
	addi	%a0, %zero, 9
bgti_cont.45047:
	j	bgti_cont.45029
bgti_else.45044:
	addi	%a0, %zero, 8
bgti_cont.45045:
	j	bgti_cont.45029
bgti_else.45042:
	addi	%a0, %zero, 7
bgti_cont.45043:
	j	bgti_cont.45029
bgti_else.45040:
	addi	%a0, %zero, 6
bgti_cont.45041:
	j	bgti_cont.45029
bgti_else.45038:
	addi	%a0, %zero, 5
bgti_cont.45039:
	j	bgti_cont.45029
bgti_else.45036:
	addi	%a0, %zero, 4
bgti_cont.45037:
	j	bgti_cont.45029
bgti_else.45034:
	addi	%a0, %zero, 3
bgti_cont.45035:
	j	bgti_cont.45029
bgti_else.45032:
	addi	%a0, %zero, 2
bgti_cont.45033:
	j	bgti_cont.45029
bgti_else.45030:
	add	%a0, %zero, %k1
bgti_cont.45031:
	j	bgti_cont.45029
bgti_else.45028:
	add	%a0, %zero, %zero
bgti_cont.45029:
	blti	%a2, 10, bgti_else.45052
	blti	%a2, 20, bgti_else.45054
	blti	%a2, 30, bgti_else.45056
	blti	%a2, 40, bgti_else.45058
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45053
	blti	%a2, 20, bgti_else.45062
	blti	%a2, 30, bgti_else.45064
	blti	%a2, 40, bgti_else.45066
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.45053
	blti	%a2, 20, bgti_else.45070
	blti	%a2, 30, bgti_else.45072
	blti	%a2, 40, bgti_else.45074
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.45053
bgti_else.45074:
	addi	%a2, %a2, -30
bgti_cont.45075:
	j	bgti_cont.45053
bgti_else.45072:
	addi	%a2, %a2, -20
bgti_cont.45073:
	j	bgti_cont.45053
bgti_else.45070:
	addi	%a2, %a2, -10
bgti_cont.45071:
	j	bgti_cont.45053
bgti_else.45068:
bgti_cont.45069:
	j	bgti_cont.45053
bgti_else.45066:
	addi	%a2, %a2, -30
bgti_cont.45067:
	j	bgti_cont.45053
bgti_else.45064:
	addi	%a2, %a2, -20
bgti_cont.45065:
	j	bgti_cont.45053
bgti_else.45062:
	addi	%a2, %a2, -10
bgti_cont.45063:
	j	bgti_cont.45053
bgti_else.45060:
bgti_cont.45061:
	j	bgti_cont.45053
bgti_else.45058:
	addi	%a2, %a2, -30
bgti_cont.45059:
	j	bgti_cont.45053
bgti_else.45056:
	addi	%a2, %a2, -20
bgti_cont.45057:
	j	bgti_cont.45053
bgti_else.45054:
	addi	%a2, %a2, -10
bgti_cont.45055:
	j	bgti_cont.45053
bgti_else.45052:
bgti_cont.45053:
	blt	%zero, %a0, bgt_else.45076
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.45077
bgt_else.45076:
	blti	%a0, 10, bgti_else.45078
	blti	%a0, 20, bgti_else.45080
	blti	%a0, 30, bgti_else.45082
	blti	%a0, 40, bgti_else.45084
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45079
	blti	%a0, 20, bgti_else.45088
	blti	%a0, 30, bgti_else.45090
	blti	%a0, 40, bgti_else.45092
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.45079
	blti	%a0, 20, bgti_else.45096
	blti	%a0, 30, bgti_else.45098
	blti	%a0, 40, bgti_else.45100
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2632
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.45079
bgti_else.45100:
	addi	%a0, %a0, -30
bgti_cont.45101:
	j	bgti_cont.45079
bgti_else.45098:
	addi	%a0, %a0, -20
bgti_cont.45099:
	j	bgti_cont.45079
bgti_else.45096:
	addi	%a0, %a0, -10
bgti_cont.45097:
	j	bgti_cont.45079
bgti_else.45094:
bgti_cont.45095:
	j	bgti_cont.45079
bgti_else.45092:
	addi	%a0, %a0, -30
bgti_cont.45093:
	j	bgti_cont.45079
bgti_else.45090:
	addi	%a0, %a0, -20
bgti_cont.45091:
	j	bgti_cont.45079
bgti_else.45088:
	addi	%a0, %a0, -10
bgti_cont.45089:
	j	bgti_cont.45079
bgti_else.45086:
bgti_cont.45087:
	j	bgti_cont.45079
bgti_else.45084:
	addi	%a0, %a0, -30
bgti_cont.45085:
	j	bgti_cont.45079
bgti_else.45082:
	addi	%a0, %a0, -20
bgti_cont.45083:
	j	bgti_cont.45079
bgti_else.45080:
	addi	%a0, %a0, -10
bgti_cont.45081:
	j	bgti_cont.45079
bgti_else.45078:
bgti_cont.45079:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.45077:
bgt_cont.45027:
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
bgt_cont.44709:
	lw	%a0, 0(%sp)
	addi	%t2, %a0, 1
	lw	%a0, 4(%sp)
	addi	%t3, %a0, 2
	blti	%t3, 5, bgti_else.45102
	addi	%t3, %t3, -5
	j	bgti_cont.45103
bgti_else.45102:
bgti_cont.45103:
	blt	%t2, %t0, bgt_else.45104
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	jr	%ra
bgt_else.45104:
	lw	%a0, 10(%sp)
	blt	%t2, %a0, bgt_else.45106
	j	bgt_cont.45107
bgt_else.45106:
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
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -11
bgt_cont.45107:
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
	blti	%a2, 5, bgti_else.45108
	addi	%a2, %a2, -5
	j	bgti_cont.45109
bgti_else.45108:
bgti_cont.45109:
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
	blti	%a2, 0, bgti_else.45142
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
	blti	%s4, 0, bgti_else.45143
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
	blti	%s4, 0, bgti_else.45144
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
	blti	%s4, 0, bgti_else.45145
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
bgti_else.45145:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.45144:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.45143:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
bgti_else.45142:
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1
	jr	%ra
calc_dirvec.3071:
	blti	%v0, 5, bgti_else.45278
	fmul	%f17, %f0, %f0
	fmul	%f16, %f1, %f1
	fadd	%f16, %f17, %f16
	fadd	%f16, %f16, %f30
	fsqrt	%f17, %f16
	fdiv	%f19, %f0, %f17
	fdiv	%f16, %f1, %f17
	fdiv	%f18, %f30, %f17
	lw	%a2, 179(%v1)
	add	%at, %a2, %a0
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fsw	%f19, 0(%a1)
	fsw	%f16, 1(%a1)
	fsw	%f18, 2(%a1)
	addi	%a1, %a0, 40
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fneg	%f0, %f16
	fsw	%f19, 0(%a1)
	fsw	%f18, 1(%a1)
	fsw	%f0, 2(%a1)
	addi	%a1, %a0, 80
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fneg	%f1, %f19
	fneg	%f0, %f16
	fsw	%f18, 0(%a1)
	fsw	%f1, 1(%a1)
	fsw	%f0, 2(%a1)
	addi	%a1, %a0, 1
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fneg	%f17, %f19
	fneg	%f1, %f16
	fneg	%f0, %f18
	fsw	%f17, 0(%a1)
	fsw	%f1, 1(%a1)
	fsw	%f0, 2(%a1)
	addi	%a1, %a0, 41
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	lw	%a1, 0(%a1)
	fneg	%f1, %f19
	fneg	%f0, %f18
	fsw	%f1, 0(%a1)
	fsw	%f0, 1(%a1)
	fsw	%f16, 2(%a1)
	addi	%a0, %a0, 81
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f0, %f18
	fsw	%f0, 0(%a0)
	fsw	%f19, 1(%a0)
	fsw	%f16, 2(%a0)
	jr	%ra
bgti_else.45278:
	fmul	%f0, %f1, %f1
	flw	%f17, 441(%zero)
	fadd	%f0, %f0, %f17
	fsqrt	%f19, %f0
	fdiv	%f21, %f30, %f19
	fblt	%f21, %fzero, fbgt_else.45280
	add	%a1, %zero, %k1
	j	fbgt_cont.45281
fbgt_else.45280:
	add	%a1, %zero, %zero
fbgt_cont.45281:
	fabs	%f20, %f21
	flw	%f18, 462(%zero)
	fblt	%f20, %f18, fbgt_else.45282
	flw	%f0, 455(%zero)
	fblt	%f20, %f0, fbgt_else.45284
	flw	%f16, 480(%zero)
	fdiv	%f22, %f30, %f20
	fmul	%f23, %f22, %f22
	fmul	%f21, %f23, %f23
	fmul	%f20, %f21, %f21
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fsub	%f1, %f22, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f21
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f20
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f20
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f20
	fadd	%f0, %f1, %f0
	fsub	%f0, %f16, %f0
	j	fbgt_cont.45285
fbgt_else.45284:
	flw	%f16, 479(%zero)
	fsub	%f1, %f20, %f30
	fadd	%f0, %f20, %f30
	fdiv	%f22, %f1, %f0
	fmul	%f23, %f22, %f22
	fmul	%f21, %f23, %f23
	fmul	%f20, %f21, %f21
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fsub	%f1, %f22, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f21
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f20
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f20
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f20
	fadd	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
fbgt_cont.45285:
	beqi	%a1, 0, bnei_else.45286
	j	fbgt_cont.45283
bnei_else.45286:
	fneg	%f0, %f0
bnei_cont.45287:
	j	fbgt_cont.45283
fbgt_else.45282:
	fmul	%f22, %f21, %f21
	fmul	%f20, %f22, %f22
	fmul	%f16, %f20, %f20
	flw	%f0, 461(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f22
	fsub	%f1, %f21, %f0
	flw	%f0, 460(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f20
	fadd	%f1, %f1, %f0
	flw	%f0, 459(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f20
	fsub	%f1, %f1, %f0
	flw	%f0, 458(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 457(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 456(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
fbgt_cont.45283:
	fmul	%f1, %f0, %f2
	flw	%f16, 482(%zero)
	fblt	%f1, %fzero, fbgt_else.45288
	add	%a1, %zero, %k1
	j	fbgt_cont.45289
fbgt_else.45288:
	add	%a1, %zero, %zero
fbgt_cont.45289:
	fabs	%f21, %f1
	flw	%f20, 481(%zero)
	fdiv	%f0, %f21, %f20
	floor	%f0, %f0
	fmul	%f0, %f0, %f20
	fsub	%f0, %f21, %f0
	fblt	%f0, %f16, fbgt_else.45290
	beqi	%a1, 0, bnei_else.45292
	add	%a1, %zero, %zero
	j	fbgt_cont.45291
bnei_else.45292:
	add	%a1, %zero, %k1
bnei_cont.45293:
	j	fbgt_cont.45291
fbgt_else.45290:
fbgt_cont.45291:
	fblt	%f0, %f16, fbgt_else.45294
	fsub	%f0, %f0, %f16
	j	fbgt_cont.45295
fbgt_else.45294:
fbgt_cont.45295:
	flw	%f21, 480(%zero)
	fblt	%f0, %f21, fbgt_else.45296
	fsub	%f0, %f16, %f0
	j	fbgt_cont.45297
fbgt_else.45296:
fbgt_cont.45297:
	flw	%f22, 479(%zero)
	fblt	%f22, %f0, fbgt_else.45298
	fmul	%f26, %f0, %f0
	fmul	%f25, %f26, %f26
	flw	%f23, 478(%zero)
	fmul	%f23, %f23, %f0
	fmul	%f23, %f23, %f26
	fsub	%f24, %f0, %f23
	flw	%f23, 477(%zero)
	fmul	%f23, %f23, %f0
	fmul	%f23, %f23, %f25
	fadd	%f24, %f24, %f23
	flw	%f23, 476(%zero)
	fmul	%f0, %f23, %f0
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f25
	fsub	%f0, %f24, %f0
	j	fbgt_cont.45299
fbgt_else.45298:
	fsub	%f0, %f21, %f0
	fmul	%f25, %f0, %f0
	fmul	%f24, %f25, %f25
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f25
	fsub	%f23, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f24
	fadd	%f23, %f23, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f24
	fsub	%f0, %f23, %f0
fbgt_cont.45299:
	beqi	%a1, 0, bnei_else.45300
	j	bnei_cont.45301
bnei_else.45300:
	fneg	%f0, %f0
bnei_cont.45301:
	fabs	%f23, %f1
	fdiv	%f1, %f23, %f20
	floor	%f1, %f1
	fmul	%f1, %f1, %f20
	fsub	%f1, %f23, %f1
	fblt	%f1, %f16, fbgt_else.45302
	add	%a1, %zero, %zero
	j	fbgt_cont.45303
fbgt_else.45302:
	add	%a1, %zero, %k1
fbgt_cont.45303:
	fblt	%f1, %f16, fbgt_else.45304
	fsub	%f1, %f1, %f16
	j	fbgt_cont.45305
fbgt_else.45304:
fbgt_cont.45305:
	fblt	%f1, %f21, fbgt_else.45306
	beqi	%a1, 0, bnei_else.45308
	add	%a1, %zero, %zero
	j	fbgt_cont.45307
bnei_else.45308:
	add	%a1, %zero, %k1
bnei_cont.45309:
	j	fbgt_cont.45307
fbgt_else.45306:
fbgt_cont.45307:
	fblt	%f1, %f21, fbgt_else.45310
	fsub	%f1, %f16, %f1
	j	fbgt_cont.45311
fbgt_else.45310:
fbgt_cont.45311:
	fblt	%f22, %f1, fbgt_else.45312
	fmul	%f25, %f1, %f1
	fmul	%f24, %f25, %f25
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f25
	fsub	%f23, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f24
	fadd	%f23, %f23, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f25
	fmul	%f1, %f1, %f24
	fsub	%f1, %f23, %f1
	j	fbgt_cont.45313
fbgt_else.45312:
	fsub	%f26, %f21, %f1
	fmul	%f25, %f26, %f26
	fmul	%f24, %f25, %f25
	flw	%f1, 478(%zero)
	fmul	%f1, %f1, %f26
	fmul	%f1, %f1, %f25
	fsub	%f23, %f26, %f1
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f26
	fmul	%f1, %f1, %f24
	fadd	%f23, %f23, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f26
	fmul	%f1, %f1, %f25
	fmul	%f1, %f1, %f24
	fsub	%f1, %f23, %f1
fbgt_cont.45313:
	beqi	%a1, 0, bnei_else.45314
	j	bnei_cont.45315
bnei_else.45314:
	fneg	%f1, %f1
bnei_cont.45315:
	fdiv	%f0, %f0, %f1
	fmul	%f0, %f0, %f19
	addi	%v0, %v0, 1
	fmul	%f1, %f0, %f0
	fadd	%f1, %f1, %f17
	fsqrt	%f19, %f1
	fdiv	%f23, %f30, %f19
	fblt	%f23, %fzero, fbgt_else.45316
	add	%a1, %zero, %k1
	j	fbgt_cont.45317
fbgt_else.45316:
	add	%a1, %zero, %zero
fbgt_cont.45317:
	fabs	%f24, %f23
	fblt	%f24, %f18, fbgt_else.45318
	flw	%f1, 455(%zero)
	fblt	%f24, %f1, fbgt_else.45320
	fdiv	%f24, %f30, %f24
	fmul	%f25, %f24, %f24
	fmul	%f23, %f25, %f25
	fmul	%f18, %f23, %f23
	flw	%f1, 461(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f25
	fsub	%f17, %f24, %f1
	flw	%f1, 460(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f23
	fadd	%f17, %f17, %f1
	flw	%f1, 459(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f25
	fmul	%f1, %f1, %f23
	fsub	%f17, %f17, %f1
	flw	%f1, 458(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f18
	fadd	%f17, %f17, %f1
	flw	%f1, 457(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f25
	fmul	%f1, %f1, %f18
	fsub	%f17, %f17, %f1
	flw	%f1, 456(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f23
	fmul	%f1, %f1, %f18
	fadd	%f1, %f17, %f1
	fsub	%f1, %f21, %f1
	j	fbgt_cont.45321
fbgt_else.45320:
	fsub	%f17, %f24, %f30
	fadd	%f1, %f24, %f30
	fdiv	%f24, %f17, %f1
	fmul	%f25, %f24, %f24
	fmul	%f23, %f25, %f25
	fmul	%f18, %f23, %f23
	flw	%f1, 461(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f25
	fsub	%f17, %f24, %f1
	flw	%f1, 460(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f23
	fadd	%f17, %f17, %f1
	flw	%f1, 459(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f25
	fmul	%f1, %f1, %f23
	fsub	%f17, %f17, %f1
	flw	%f1, 458(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f18
	fadd	%f17, %f17, %f1
	flw	%f1, 457(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f25
	fmul	%f1, %f1, %f18
	fsub	%f17, %f17, %f1
	flw	%f1, 456(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f23
	fmul	%f1, %f1, %f18
	fadd	%f1, %f17, %f1
	fadd	%f1, %f22, %f1
fbgt_cont.45321:
	beqi	%a1, 0, bnei_else.45322
	j	fbgt_cont.45319
bnei_else.45322:
	fneg	%f1, %f1
bnei_cont.45323:
	j	fbgt_cont.45319
fbgt_else.45318:
	fmul	%f25, %f23, %f23
	fmul	%f24, %f25, %f25
	fmul	%f18, %f24, %f24
	flw	%f1, 461(%zero)
	fmul	%f1, %f1, %f23
	fmul	%f1, %f1, %f25
	fsub	%f17, %f23, %f1
	flw	%f1, 460(%zero)
	fmul	%f1, %f1, %f23
	fmul	%f1, %f1, %f24
	fadd	%f17, %f17, %f1
	flw	%f1, 459(%zero)
	fmul	%f1, %f1, %f23
	fmul	%f1, %f1, %f25
	fmul	%f1, %f1, %f24
	fsub	%f17, %f17, %f1
	flw	%f1, 458(%zero)
	fmul	%f1, %f1, %f23
	fmul	%f1, %f1, %f18
	fadd	%f17, %f17, %f1
	flw	%f1, 457(%zero)
	fmul	%f1, %f1, %f23
	fmul	%f1, %f1, %f25
	fmul	%f1, %f1, %f18
	fsub	%f17, %f17, %f1
	flw	%f1, 456(%zero)
	fmul	%f1, %f1, %f23
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f18
	fadd	%f1, %f17, %f1
fbgt_cont.45319:
	fmul	%f18, %f1, %f3
	fblt	%f18, %fzero, fbgt_else.45324
	add	%a1, %zero, %k1
	j	fbgt_cont.45325
fbgt_else.45324:
	add	%a1, %zero, %zero
fbgt_cont.45325:
	fabs	%f17, %f18
	fdiv	%f1, %f17, %f20
	floor	%f1, %f1
	fmul	%f1, %f1, %f20
	fsub	%f1, %f17, %f1
	fblt	%f1, %f16, fbgt_else.45326
	beqi	%a1, 0, bnei_else.45328
	add	%a1, %zero, %zero
	j	fbgt_cont.45327
bnei_else.45328:
	add	%a1, %zero, %k1
bnei_cont.45329:
	j	fbgt_cont.45327
fbgt_else.45326:
fbgt_cont.45327:
	fblt	%f1, %f16, fbgt_else.45330
	fsub	%f1, %f1, %f16
	j	fbgt_cont.45331
fbgt_else.45330:
fbgt_cont.45331:
	fblt	%f1, %f21, fbgt_else.45332
	fsub	%f1, %f16, %f1
	j	fbgt_cont.45333
fbgt_else.45332:
fbgt_cont.45333:
	fblt	%f22, %f1, fbgt_else.45334
	fmul	%f25, %f1, %f1
	fmul	%f24, %f25, %f25
	flw	%f17, 478(%zero)
	fmul	%f17, %f17, %f1
	fmul	%f17, %f17, %f25
	fsub	%f23, %f1, %f17
	flw	%f17, 477(%zero)
	fmul	%f17, %f17, %f1
	fmul	%f17, %f17, %f24
	fadd	%f23, %f23, %f17
	flw	%f17, 476(%zero)
	fmul	%f1, %f17, %f1
	fmul	%f1, %f1, %f25
	fmul	%f1, %f1, %f24
	fsub	%f1, %f23, %f1
	j	fbgt_cont.45335
fbgt_else.45334:
	fsub	%f1, %f21, %f1
	fmul	%f24, %f1, %f1
	fmul	%f23, %f24, %f24
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f24
	fsub	%f17, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f23
	fadd	%f17, %f17, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f24
	fmul	%f1, %f1, %f23
	fsub	%f1, %f17, %f1
fbgt_cont.45335:
	beqi	%a1, 0, bnei_else.45336
	j	bnei_cont.45337
bnei_else.45336:
	fneg	%f1, %f1
bnei_cont.45337:
	fabs	%f18, %f18
	fdiv	%f17, %f18, %f20
	floor	%f17, %f17
	fmul	%f17, %f17, %f20
	fsub	%f17, %f18, %f17
	fblt	%f17, %f16, fbgt_else.45338
	add	%a1, %zero, %zero
	j	fbgt_cont.45339
fbgt_else.45338:
	add	%a1, %zero, %k1
fbgt_cont.45339:
	fblt	%f17, %f16, fbgt_else.45340
	fsub	%f17, %f17, %f16
	j	fbgt_cont.45341
fbgt_else.45340:
fbgt_cont.45341:
	fblt	%f17, %f21, fbgt_else.45342
	beqi	%a1, 0, bnei_else.45344
	add	%a1, %zero, %zero
	j	fbgt_cont.45343
bnei_else.45344:
	add	%a1, %zero, %k1
bnei_cont.45345:
	j	fbgt_cont.45343
fbgt_else.45342:
fbgt_cont.45343:
	fblt	%f17, %f21, fbgt_else.45346
	fsub	%f17, %f16, %f17
	j	fbgt_cont.45347
fbgt_else.45346:
fbgt_cont.45347:
	fblt	%f22, %f17, fbgt_else.45348
	fmul	%f20, %f17, %f17
	fmul	%f18, %f20, %f20
	flw	%f16, 474(%zero)
	fmul	%f16, %f16, %f20
	fsub	%f17, %f30, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f16, %f18
	fadd	%f17, %f17, %f16
	flw	%f16, 472(%zero)
	fmul	%f16, %f16, %f20
	fmul	%f16, %f16, %f18
	fsub	%f16, %f17, %f16
	j	fbgt_cont.45349
fbgt_else.45348:
	fsub	%f21, %f21, %f17
	fmul	%f18, %f21, %f21
	fmul	%f20, %f18, %f18
	flw	%f16, 478(%zero)
	fmul	%f16, %f16, %f21
	fmul	%f16, %f16, %f18
	fsub	%f17, %f21, %f16
	flw	%f16, 477(%zero)
	fmul	%f16, %f16, %f21
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 476(%zero)
	fmul	%f16, %f16, %f21
	fmul	%f16, %f16, %f18
	fmul	%f16, %f16, %f20
	fsub	%f16, %f17, %f16
fbgt_cont.45349:
	beqi	%a1, 0, bnei_else.45350
	j	bnei_cont.45351
bnei_else.45350:
	fneg	%f16, %f16
bnei_cont.45351:
	fdiv	%f1, %f1, %f16
	fmul	%f1, %f1, %f19
	j	calc_dirvec.3071
calc_dirvecs.3079:
	fmov	%f3, %f0
	add	%a3, %zero, %v0
	add	%fp, %zero, %a0
	add	%k0, %zero, %ra
	blti	%a3, 0, bgti_else.45386
	itof	%f0, %a3
	flw	%f27, 460(%zero)
	fmul	%f0, %f0, %f27
	flw	%f28, 438(%zero)
	fsub	%f2, %f0, %f28
	addi	%a0, %fp, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	itof	%f0, %a3
	fmul	%f0, %f0, %f27
	flw	%f29, 441(%zero)
	fadd	%f2, %f0, %f29
	addi	%s0, %fp, 2
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	addi	%a3, %a3, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.45387
	addi	%v1, %v1, -5
	j	bgti_cont.45388
bgti_else.45387:
bgti_cont.45388:
	blti	%a3, 0, bgti_else.45389
	itof	%f0, %a3
	fmul	%f0, %f0, %f27
	fsub	%f2, %f0, %f28
	addi	%a0, %fp, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	itof	%f0, %a3
	fmul	%f0, %f0, %f27
	fadd	%f2, %f0, %f29
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	addi	%v0, %a3, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.45390
	addi	%v1, %v1, -5
	j	bgti_cont.45391
bgti_else.45390:
bgti_cont.45391:
	add	%ra, %zero, %k0
	addi	%a0, %fp, 0
	fmov	%f0, %f3
	j	calc_dirvecs.3079
bgti_else.45389:
	add	%ra, %zero, %k0
	jr	%ra
bgti_else.45386:
	add	%ra, %zero, %k0
	jr	%ra
calc_dirvec_rows.3084:
	add	%s1, %zero, %v0
	add	%s2, %zero, %v1
	add	%s3, %zero, %a0
	fsw	%f5, 0(%sp)
	fsw	%f4, 1(%sp)
	add	%s4, %zero, %ra
	blti	%s1, 0, bgti_else.45454
	itof	%f0, %s1
	flw	%f4, 460(%zero)
	fmul	%f0, %f0, %f4
	flw	%f5, 438(%zero)
	fsub	%f3, %f0, %f5
	addi	%s5, %zero, 4
	itof	%f0, %s5
	fmul	%f0, %f0, %f4
	fsub	%f2, %f0, %f5
	addi	%a0, %s3, 0
	addi	%v1, %s2, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	calc_dirvec.3071
	itof	%f0, %s5
	fmul	%f1, %f0, %f4
	flw	%f0, 441(%zero)
	fadd	%f2, %f1, %f0
	addi	%a0, %s3, 2
	addi	%v1, %s2, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3071
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3
	addi	%v1, %s2, 1
	blti	%v1, 5, bgti_else.45455
	addi	%v1, %v1, -5
	j	bgti_cont.45456
bgti_else.45455:
bgti_cont.45456:
	addi	%a0, %s3, 0
	fmov	%f0, %f3
	addi	%sp, %sp, 2
	jal	calc_dirvecs.3079
	addi	%sp, %sp, -2
	addi	%s6, %s1, -1
	addi	%s1, %s2, 2
	blti	%s1, 5, bgti_else.45457
	addi	%s1, %s1, -5
	j	bgti_cont.45458
bgti_else.45457:
bgti_cont.45458:
	addi	%s2, %s3, 4
	blti	%s6, 0, bgti_else.45459
	itof	%f0, %s6
	fmul	%f0, %f0, %f4
	fsub	%f0, %f0, %f5
	addi	%a0, %s2, 0
	addi	%v1, %s1, 0
	addi	%v0, %s5, 0
	addi	%sp, %sp, 2
	jal	calc_dirvecs.3079
	addi	%sp, %sp, -2
	addi	%v0, %s6, -1
	addi	%v1, %s1, 2
	blti	%v1, 5, bgti_else.45460
	addi	%v1, %v1, -5
	j	bgti_cont.45461
bgti_else.45460:
bgti_cont.45461:
	addi	%a0, %s2, 4
	flw	%f5, 0(%sp)
	flw	%f4, 1(%sp)
	add	%ra, %zero, %s4
	j	calc_dirvec_rows.3084
bgti_else.45459:
	flw	%f5, 0(%sp)
	flw	%f4, 1(%sp)
	add	%ra, %zero, %s4
	jr	%ra
bgti_else.45454:
	add	%ra, %zero, %s4
	jr	%ra
create_dirvec_elements.3090:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	blti	%a2, 0, bgti_else.45500
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
	blti	%k0, 0, bgti_else.45501
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
	blti	%k0, 0, bgti_else.45502
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
	blti	%k0, 0, bgti_else.45503
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
bgti_else.45503:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.45502:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.45501:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.45500:
	add	%ra, %zero, %a3
	jr	%ra
create_dirvecs.3093:
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra
	blti	%s1, 0, bgti_else.45536
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
	blti	%s1, 0, bgti_else.45537
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
bgti_else.45537:
	add	%ra, %zero, %s2
	jr	%ra
bgti_else.45536:
	add	%ra, %zero, %s2
	jr	%ra
init_dirvec_constants.3095:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %ra
	blti	%s5, 0, bgti_else.45657
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	lw	%a0, 0(%zero)
	addi	%s7, %a0, -1
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.45658
	add	%at, %s4, %s5
	lw	%a1, 0(%at)
	blti	%s7, 0, bgti_else.45659
	lw	%a0, 12(%s7)
	lw	%a2, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.45661
	beqi	%a0, 2, bnei_else.45663
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f20, 0(%k0)
	flw	%f19, 1(%k0)
	flw	%f24, 2(%k0)
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
	beqi	%s1, 0, bnei_else.45665
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.45666
bnei_else.45665:
bnei_cont.45666:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s1, 0, bnei_else.45667
	flw	%f22, 1(%s0)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s0)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 474(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s0)
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
	j	bnei_cont.45668
bnei_else.45667:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.45668:
	fbne	%f0, %fzero, fbeq_else.45669
	add	%a0, %zero, %k1
	j	fbeq_cont.45670
fbeq_else.45669:
	add	%a0, %zero, %zero
fbeq_cont.45670:
	beqi	%a0, 0, bnei_else.45671
	j	bnei_cont.45672
bnei_else.45671:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.45672:
	add	%at, %a2, %s7
	sw	%v0, 0(%at)
	j	bnei_cont.45662
bnei_else.45663:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%k0)
	flw	%f18, 0(%a3)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%k0)
	flw	%f17, 1(%a3)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%k0)
	flw	%f16, 2(%a3)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.45673
	add	%a0, %zero, %zero
	j	fbgt_cont.45674
fbgt_else.45673:
	add	%a0, %zero, %k1
fbgt_cont.45674:
	beqi	%a0, 0, bnei_else.45675
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
	j	bnei_cont.45676
bnei_else.45675:
	fsw	%fzero, 0(%v0)
bnei_cont.45676:
	add	%at, %a2, %s7
	sw	%v0, 0(%at)
bnei_cont.45664:
	j	bnei_cont.45662
bnei_else.45661:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.45677
	add	%a0, %zero, %k1
	j	fbeq_cont.45678
fbeq_else.45677:
	add	%a0, %zero, %zero
fbeq_cont.45678:
	beqi	%a0, 0, bnei_else.45679
	fsw	%fzero, 1(%v0)
	j	bnei_cont.45680
bnei_else.45679:
	fblt	%f1, %fzero, fbgt_else.45681
	add	%a0, %zero, %zero
	j	fbgt_cont.45682
fbgt_else.45681:
	add	%a0, %zero, %k1
fbgt_cont.45682:
	beqi	%fp, 0, bnei_else.45683
	beqi	%a0, 0, bnei_else.45685
	add	%a0, %zero, %zero
	j	bnei_cont.45684
bnei_else.45685:
	add	%a0, %zero, %k1
bnei_cont.45686:
	j	bnei_cont.45684
bnei_else.45683:
bnei_cont.45684:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.45687
	j	bnei_cont.45688
bnei_else.45687:
	fneg	%f0, %f0
bnei_cont.45688:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.45680:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.45689
	add	%a0, %zero, %k1
	j	fbeq_cont.45690
fbeq_else.45689:
	add	%a0, %zero, %zero
fbeq_cont.45690:
	beqi	%a0, 0, bnei_else.45691
	fsw	%fzero, 3(%v0)
	j	bnei_cont.45692
bnei_else.45691:
	fblt	%f1, %fzero, fbgt_else.45693
	add	%a0, %zero, %zero
	j	fbgt_cont.45694
fbgt_else.45693:
	add	%a0, %zero, %k1
fbgt_cont.45694:
	beqi	%fp, 0, bnei_else.45695
	beqi	%a0, 0, bnei_else.45697
	add	%a0, %zero, %zero
	j	bnei_cont.45696
bnei_else.45697:
	add	%a0, %zero, %k1
bnei_cont.45698:
	j	bnei_cont.45696
bnei_else.45695:
bnei_cont.45696:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.45699
	j	bnei_cont.45700
bnei_else.45699:
	fneg	%f0, %f0
bnei_cont.45700:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.45692:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.45701
	add	%a0, %zero, %k1
	j	fbeq_cont.45702
fbeq_else.45701:
	add	%a0, %zero, %zero
fbeq_cont.45702:
	beqi	%a0, 0, bnei_else.45703
	fsw	%fzero, 5(%v0)
	j	bnei_cont.45704
bnei_else.45703:
	fblt	%f1, %fzero, fbgt_else.45705
	add	%a0, %zero, %zero
	j	fbgt_cont.45706
fbgt_else.45705:
	add	%a0, %zero, %k1
fbgt_cont.45706:
	beqi	%fp, 0, bnei_else.45707
	beqi	%a0, 0, bnei_else.45709
	add	%a0, %zero, %zero
	j	bnei_cont.45708
bnei_else.45709:
	add	%a0, %zero, %k1
bnei_cont.45710:
	j	bnei_cont.45708
bnei_else.45707:
bnei_cont.45708:
	flw	%f0, 2(%a3)
	beqi	%a0, 0, bnei_else.45711
	j	bnei_cont.45712
bnei_else.45711:
	fneg	%f0, %f0
bnei_cont.45712:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.45704:
	add	%at, %a2, %s7
	sw	%v0, 0(%at)
bnei_cont.45662:
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2877
	j	bgti_cont.45660
bgti_else.45659:
bgti_cont.45660:
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.45713
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.45714
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	jal	setup_dirvec_constants.2880
	addi	%v1, %s5, -1
	add	%ra, %zero, %s6
	addi	%v0, %s4, 0
	j	init_dirvec_constants.3095
bgti_else.45714:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.45713:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.45658:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.45657:
	add	%ra, %zero, %s6
	jr	%ra
init_vecset_constants.3098:
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra
	blti	%t7, 0, bgti_else.45936
	lw	%s4, 179(%t7)
	addi	%a0, %zero, 119
	lw	%a1, 119(%s4)
	lw	%a0, 0(%zero)
	addi	%t9, %a0, -1
	blti	%t9, 0, bgti_else.45937
	lw	%a0, 12(%t9)
	lw	%a2, 1(%a1)
	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.45939
	beqi	%a0, 2, bnei_else.45941
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f20, 0(%k0)
	flw	%f19, 1(%k0)
	flw	%f24, 2(%k0)
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
	beqi	%s1, 0, bnei_else.45943
	fmul	%f16, %f19, %f24
	flw	%f1, 0(%s0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f20
	flw	%f0, 1(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f20, %f19
	flw	%f0, 2(%s0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.45944
bnei_else.45943:
bnei_cont.45944:
	fmul	%f1, %f20, %f2
	fneg	%f25, %f1
	fmul	%f1, %f19, %f18
	fneg	%f23, %f1
	fmul	%f1, %f24, %f17
	fneg	%f2, %f1
	fsw	%f0, 0(%v0)
	beqi	%s1, 0, bnei_else.45945
	flw	%f22, 1(%s0)
	fmul	%f16, %f24, %f22
	flw	%f18, 2(%s0)
	fmul	%f1, %f19, %f18
	fadd	%f1, %f16, %f1
	flw	%f21, 474(%zero)
	fmul	%f1, %f1, %f21
	fsub	%f1, %f25, %f1
	fsw	%f1, 1(%v0)
	flw	%f17, 0(%s0)
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
	j	bnei_cont.45946
bnei_else.45945:
	fsw	%f25, 1(%v0)
	fsw	%f23, 2(%v0)
	fsw	%f2, 3(%v0)
bnei_cont.45946:
	fbne	%f0, %fzero, fbeq_else.45947
	add	%a0, %zero, %k1
	j	fbeq_cont.45948
fbeq_else.45947:
	add	%a0, %zero, %zero
fbeq_cont.45948:
	beqi	%a0, 0, bnei_else.45949
	j	bnei_cont.45950
bnei_else.45949:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.45950:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
	j	bnei_cont.45940
bnei_else.45941:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%k0)
	flw	%f18, 0(%a3)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%k0)
	flw	%f17, 1(%a3)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%k0)
	flw	%f16, 2(%a3)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.45951
	add	%a0, %zero, %zero
	j	fbgt_cont.45952
fbgt_else.45951:
	add	%a0, %zero, %k1
fbgt_cont.45952:
	beqi	%a0, 0, bnei_else.45953
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
	j	bnei_cont.45954
bnei_else.45953:
	fsw	%fzero, 0(%v0)
bnei_cont.45954:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
bnei_cont.45942:
	j	bnei_cont.45940
bnei_else.45939:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%k0)
	fbne	%f1, %fzero, fbeq_else.45955
	add	%a0, %zero, %k1
	j	fbeq_cont.45956
fbeq_else.45955:
	add	%a0, %zero, %zero
fbeq_cont.45956:
	beqi	%a0, 0, bnei_else.45957
	fsw	%fzero, 1(%v0)
	j	bnei_cont.45958
bnei_else.45957:
	fblt	%f1, %fzero, fbgt_else.45959
	add	%a0, %zero, %zero
	j	fbgt_cont.45960
fbgt_else.45959:
	add	%a0, %zero, %k1
fbgt_cont.45960:
	beqi	%fp, 0, bnei_else.45961
	beqi	%a0, 0, bnei_else.45963
	add	%a0, %zero, %zero
	j	bnei_cont.45962
bnei_else.45963:
	add	%a0, %zero, %k1
bnei_cont.45964:
	j	bnei_cont.45962
bnei_else.45961:
bnei_cont.45962:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.45965
	j	bnei_cont.45966
bnei_else.45965:
	fneg	%f0, %f0
bnei_cont.45966:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.45958:
	flw	%f1, 1(%k0)
	fbne	%f1, %fzero, fbeq_else.45967
	add	%a0, %zero, %k1
	j	fbeq_cont.45968
fbeq_else.45967:
	add	%a0, %zero, %zero
fbeq_cont.45968:
	beqi	%a0, 0, bnei_else.45969
	fsw	%fzero, 3(%v0)
	j	bnei_cont.45970
bnei_else.45969:
	fblt	%f1, %fzero, fbgt_else.45971
	add	%a0, %zero, %zero
	j	fbgt_cont.45972
fbgt_else.45971:
	add	%a0, %zero, %k1
fbgt_cont.45972:
	beqi	%fp, 0, bnei_else.45973
	beqi	%a0, 0, bnei_else.45975
	add	%a0, %zero, %zero
	j	bnei_cont.45974
bnei_else.45975:
	add	%a0, %zero, %k1
bnei_cont.45976:
	j	bnei_cont.45974
bnei_else.45973:
bnei_cont.45974:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.45977
	j	bnei_cont.45978
bnei_else.45977:
	fneg	%f0, %f0
bnei_cont.45978:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.45970:
	flw	%f1, 2(%k0)
	fbne	%f1, %fzero, fbeq_else.45979
	add	%a0, %zero, %k1
	j	fbeq_cont.45980
fbeq_else.45979:
	add	%a0, %zero, %zero
fbeq_cont.45980:
	beqi	%a0, 0, bnei_else.45981
	fsw	%fzero, 5(%v0)
	j	bnei_cont.45982
bnei_else.45981:
	fblt	%f1, %fzero, fbgt_else.45983
	add	%a0, %zero, %zero
	j	fbgt_cont.45984
fbgt_else.45983:
	add	%a0, %zero, %k1
fbgt_cont.45984:
	beqi	%fp, 0, bnei_else.45985
	beqi	%a0, 0, bnei_else.45987
	add	%a0, %zero, %zero
	j	bnei_cont.45986
bnei_else.45987:
	add	%a0, %zero, %k1
bnei_cont.45988:
	j	bnei_cont.45986
bnei_else.45985:
bnei_cont.45986:
	flw	%f0, 2(%a3)
	beqi	%a0, 0, bnei_else.45989
	j	bnei_cont.45990
bnei_else.45989:
	fneg	%f0, %f0
bnei_cont.45990:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.45982:
	add	%at, %a2, %t9
	sw	%v0, 0(%at)
bnei_cont.45940:
	addi	%v1, %t9, -1
	addi	%v0, %a1, 0
	jal	iter_setup_dirvec_constants.2877
	j	bgti_cont.45938
bgti_else.45937:
bgti_cont.45938:
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
	blti	%t7, 0, bgti_else.45991
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
	blti	%t7, 0, bgti_else.45992
	lw	%s4, 179(%t7)
	lw	%v0, 119(%s4)
	jal	setup_dirvec_constants.2880
	addi	%v1, %zero, 118
	addi	%v0, %s4, 0
	jal	init_dirvec_constants.3095
	addi	%t7, %t7, -1
	blti	%t7, 0, bgti_else.45993
	lw	%v0, 179(%t7)
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3095
	addi	%v0, %t7, -1
	add	%ra, %zero, %t8
	j	init_vecset_constants.3098
bgti_else.45993:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.45992:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.45991:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.45936:
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
	addi	%a0, %zero, 2
	sw	%a0, 154(%zero)
	sw	%a0, 155(%zero)
	sw	%k1, 156(%zero)
	sw	%k1, 157(%zero)
	flw	%f1, 437(%zero)
	itof	%f0, %a0
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
	blti	%s7, 0, bgti_else.47590
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
	j	bgti_cont.47591
bgti_else.47590:
bgti_cont.47591:
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
	blti	%s7, 0, bgti_else.47592
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
	j	bgti_cont.47593
bgti_else.47592:
bgti_cont.47593:
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
	blti	%s7, 0, bgti_else.47594
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
	j	bgti_cont.47595
bgti_else.47594:
bgti_cont.47595:
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
	flw	%f18, 469(%zero)
	fmul	%f16, %f0, %f18
	flw	%f17, 482(%zero)
	fabs	%f1, %f16
	flw	%f19, 481(%zero)
	fdiv	%f0, %f1, %f19
	floor	%f0, %f0
	fmul	%f0, %f0, %f19
	fsub	%f0, %f1, %f0
	fblt	%f0, %f17, fbgt_else.47596
	add	%a0, %zero, %zero
	j	fbgt_cont.47597
fbgt_else.47596:
	add	%a0, %zero, %k1
fbgt_cont.47597:
	fblt	%f0, %f17, fbgt_else.47598
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47599
fbgt_else.47598:
fbgt_cont.47599:
	flw	%f2, 480(%zero)
	fblt	%f0, %f2, fbgt_else.47600
	beqi	%a0, 0, bnei_else.47602
	add	%a0, %zero, %zero
	j	fbgt_cont.47601
bnei_else.47602:
	add	%a0, %zero, %k1
bnei_cont.47603:
	j	fbgt_cont.47601
fbgt_else.47600:
fbgt_cont.47601:
	fblt	%f0, %f2, fbgt_else.47604
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47605
fbgt_else.47604:
fbgt_cont.47605:
	flw	%f20, 479(%zero)
	fblt	%f20, %f0, fbgt_else.47606
	fmul	%f22, %f0, %f0
	fmul	%f21, %f22, %f22
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f22
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fsub	%f1, %f1, %f0
	j	fbgt_cont.47607
fbgt_else.47606:
	fsub	%f23, %f2, %f0
	fmul	%f22, %f23, %f23
	fmul	%f21, %f22, %f22
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f22
	fsub	%f1, %f23, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fsub	%f1, %f1, %f0
fbgt_cont.47607:
	beqi	%a0, 0, bnei_else.47608
	j	bnei_cont.47609
bnei_else.47608:
	fneg	%f1, %f1
bnei_cont.47609:
	fblt	%f16, %fzero, fbgt_else.47610
	add	%a0, %zero, %k1
	j	fbgt_cont.47611
fbgt_else.47610:
	add	%a0, %zero, %zero
fbgt_cont.47611:
	fabs	%f16, %f16
	fdiv	%f0, %f16, %f19
	floor	%f0, %f0
	fmul	%f0, %f0, %f19
	fsub	%f0, %f16, %f0
	fblt	%f0, %f17, fbgt_else.47612
	beqi	%a0, 0, bnei_else.47614
	add	%a0, %zero, %zero
	j	fbgt_cont.47613
bnei_else.47614:
	add	%a0, %zero, %k1
bnei_cont.47615:
	j	fbgt_cont.47613
fbgt_else.47612:
fbgt_cont.47613:
	fblt	%f0, %f17, fbgt_else.47616
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47617
fbgt_else.47616:
fbgt_cont.47617:
	fblt	%f0, %f2, fbgt_else.47618
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47619
fbgt_else.47618:
fbgt_cont.47619:
	fblt	%f20, %f0, fbgt_else.47620
	fmul	%f23, %f0, %f0
	fmul	%f22, %f23, %f23
	flw	%f16, 478(%zero)
	fmul	%f16, %f16, %f0
	fmul	%f16, %f16, %f23
	fsub	%f21, %f0, %f16
	flw	%f16, 477(%zero)
	fmul	%f16, %f16, %f0
	fmul	%f16, %f16, %f22
	fadd	%f21, %f21, %f16
	flw	%f16, 476(%zero)
	fmul	%f0, %f16, %f0
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f22
	fsub	%f16, %f21, %f0
	j	fbgt_cont.47621
fbgt_else.47620:
	fsub	%f0, %f2, %f0
	fmul	%f22, %f0, %f0
	fmul	%f21, %f22, %f22
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f22
	fsub	%f16, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f21
	fadd	%f16, %f16, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fsub	%f16, %f16, %f0
fbgt_cont.47621:
	beqi	%a0, 0, bnei_else.47622
	j	bnei_cont.47623
bnei_else.47622:
	fneg	%f16, %f16
bnei_cont.47623:
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	fmul	%f22, %f0, %f18
	fabs	%f21, %f22
	fdiv	%f0, %f21, %f19
	floor	%f0, %f0
	fmul	%f0, %f0, %f19
	fsub	%f0, %f21, %f0
	fblt	%f0, %f17, fbgt_else.47624
	add	%a0, %zero, %zero
	j	fbgt_cont.47625
fbgt_else.47624:
	add	%a0, %zero, %k1
fbgt_cont.47625:
	fblt	%f0, %f17, fbgt_else.47626
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47627
fbgt_else.47626:
fbgt_cont.47627:
	fblt	%f0, %f2, fbgt_else.47628
	beqi	%a0, 0, bnei_else.47630
	add	%a0, %zero, %zero
	j	fbgt_cont.47629
bnei_else.47630:
	add	%a0, %zero, %k1
bnei_cont.47631:
	j	fbgt_cont.47629
fbgt_else.47628:
fbgt_cont.47629:
	fblt	%f0, %f2, fbgt_else.47632
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47633
fbgt_else.47632:
fbgt_cont.47633:
	fblt	%f20, %f0, fbgt_else.47634
	fmul	%f24, %f0, %f0
	fmul	%f23, %f24, %f24
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f24
	fsub	%f21, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f23
	fadd	%f21, %f21, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f23
	fsub	%f0, %f21, %f0
	j	fbgt_cont.47635
fbgt_else.47634:
	fsub	%f25, %f2, %f0
	fmul	%f24, %f25, %f25
	fmul	%f23, %f24, %f24
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f24
	fsub	%f21, %f25, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f23
	fadd	%f21, %f21, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f23
	fsub	%f0, %f21, %f0
fbgt_cont.47635:
	beqi	%a0, 0, bnei_else.47636
	j	bnei_cont.47637
bnei_else.47636:
	fneg	%f0, %f0
bnei_cont.47637:
	fblt	%f22, %fzero, fbgt_else.47638
	add	%a0, %zero, %k1
	j	fbgt_cont.47639
fbgt_else.47638:
	add	%a0, %zero, %zero
fbgt_cont.47639:
	fabs	%f22, %f22
	fdiv	%f21, %f22, %f19
	floor	%f21, %f21
	fmul	%f21, %f21, %f19
	fsub	%f21, %f22, %f21
	fblt	%f21, %f17, fbgt_else.47640
	beqi	%a0, 0, bnei_else.47642
	add	%a0, %zero, %zero
	j	fbgt_cont.47641
bnei_else.47642:
	add	%a0, %zero, %k1
bnei_cont.47643:
	j	fbgt_cont.47641
fbgt_else.47640:
fbgt_cont.47641:
	fblt	%f21, %f17, fbgt_else.47644
	fsub	%f21, %f21, %f17
	j	fbgt_cont.47645
fbgt_else.47644:
fbgt_cont.47645:
	fblt	%f21, %f2, fbgt_else.47646
	fsub	%f21, %f17, %f21
	j	fbgt_cont.47647
fbgt_else.47646:
fbgt_cont.47647:
	fblt	%f20, %f21, fbgt_else.47648
	fmul	%f25, %f21, %f21
	fmul	%f24, %f25, %f25
	flw	%f22, 478(%zero)
	fmul	%f22, %f22, %f21
	fmul	%f22, %f22, %f25
	fsub	%f23, %f21, %f22
	flw	%f22, 477(%zero)
	fmul	%f22, %f22, %f21
	fmul	%f22, %f22, %f24
	fadd	%f23, %f23, %f22
	flw	%f22, 476(%zero)
	fmul	%f21, %f22, %f21
	fmul	%f21, %f21, %f25
	fmul	%f21, %f21, %f24
	fsub	%f21, %f23, %f21
	j	fbgt_cont.47649
fbgt_else.47648:
	fsub	%f21, %f2, %f21
	fmul	%f24, %f21, %f21
	fmul	%f23, %f24, %f24
	flw	%f21, 474(%zero)
	fmul	%f21, %f21, %f24
	fsub	%f22, %f30, %f21
	flw	%f21, 473(%zero)
	fmul	%f21, %f21, %f23
	fadd	%f22, %f22, %f21
	flw	%f21, 472(%zero)
	fmul	%f21, %f21, %f24
	fmul	%f21, %f21, %f23
	fsub	%f21, %f22, %f21
fbgt_cont.47649:
	beqi	%a0, 0, bnei_else.47650
	j	bnei_cont.47651
bnei_else.47650:
	fneg	%f21, %f21
bnei_cont.47651:
	fmul	%f22, %f1, %f21
	flw	%f23, 436(%zero)
	fmul	%f22, %f22, %f23
	fsw	%f22, 171(%zero)
	flw	%f22, 435(%zero)
	fmul	%f22, %f16, %f22
	fsw	%f22, 172(%zero)
	fmul	%f22, %f1, %f0
	fmul	%f22, %f22, %f23
	fsw	%f22, 173(%zero)
	fsw	%f0, 165(%zero)
	fsw	%fzero, 166(%zero)
	fneg	%f22, %f21
	fsw	%f22, 167(%zero)
	fneg	%f22, %f16
	fmul	%f21, %f22, %f21
	fsw	%f21, 168(%zero)
	fneg	%f1, %f1
	fsw	%f1, 169(%zero)
	fneg	%f1, %f16
	fmul	%f0, %f1, %f0
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
	fmul	%f1, %f0, %f18
	fblt	%f1, %fzero, fbgt_else.47652
	add	%a0, %zero, %k1
	j	fbgt_cont.47653
fbgt_else.47652:
	add	%a0, %zero, %zero
fbgt_cont.47653:
	fabs	%f16, %f1
	fdiv	%f0, %f16, %f19
	floor	%f0, %f0
	fmul	%f0, %f0, %f19
	fsub	%f0, %f16, %f0
	fblt	%f0, %f17, fbgt_else.47654
	beqi	%a0, 0, bnei_else.47656
	add	%a0, %zero, %zero
	j	fbgt_cont.47655
bnei_else.47656:
	add	%a0, %zero, %k1
bnei_cont.47657:
	j	fbgt_cont.47655
fbgt_else.47654:
fbgt_cont.47655:
	fblt	%f0, %f17, fbgt_else.47658
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47659
fbgt_else.47658:
fbgt_cont.47659:
	fblt	%f0, %f2, fbgt_else.47660
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47661
fbgt_else.47660:
fbgt_cont.47661:
	fblt	%f20, %f0, fbgt_else.47662
	fmul	%f23, %f0, %f0
	fmul	%f22, %f23, %f23
	flw	%f16, 478(%zero)
	fmul	%f16, %f16, %f0
	fmul	%f16, %f16, %f23
	fsub	%f21, %f0, %f16
	flw	%f16, 477(%zero)
	fmul	%f16, %f16, %f0
	fmul	%f16, %f16, %f22
	fadd	%f21, %f21, %f16
	flw	%f16, 476(%zero)
	fmul	%f0, %f16, %f0
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f22
	fsub	%f0, %f21, %f0
	j	fbgt_cont.47663
fbgt_else.47662:
	fsub	%f0, %f2, %f0
	fmul	%f22, %f0, %f0
	fmul	%f21, %f22, %f22
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f22
	fsub	%f16, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f21
	fadd	%f16, %f16, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fsub	%f0, %f16, %f0
fbgt_cont.47663:
	beqi	%a0, 0, bnei_else.47664
	j	bnei_cont.47665
bnei_else.47664:
	fneg	%f0, %f0
bnei_cont.47665:
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	fmul	%f16, %f0, %f18
	fabs	%f1, %f1
	fdiv	%f0, %f1, %f19
	floor	%f0, %f0
	fmul	%f0, %f0, %f19
	fsub	%f0, %f1, %f0
	fblt	%f0, %f17, fbgt_else.47666
	add	%a0, %zero, %zero
	j	fbgt_cont.47667
fbgt_else.47666:
	add	%a0, %zero, %k1
fbgt_cont.47667:
	fblt	%f0, %f17, fbgt_else.47668
	fsub	%f0, %f0, %f17
	j	fbgt_cont.47669
fbgt_else.47668:
fbgt_cont.47669:
	fblt	%f0, %f2, fbgt_else.47670
	beqi	%a0, 0, bnei_else.47672
	add	%a0, %zero, %zero
	j	fbgt_cont.47671
bnei_else.47672:
	add	%a0, %zero, %k1
bnei_cont.47673:
	j	fbgt_cont.47671
fbgt_else.47670:
fbgt_cont.47671:
	fblt	%f0, %f2, fbgt_else.47674
	fsub	%f0, %f17, %f0
	j	fbgt_cont.47675
fbgt_else.47674:
fbgt_cont.47675:
	fblt	%f20, %f0, fbgt_else.47676
	fmul	%f21, %f0, %f0
	fmul	%f18, %f21, %f21
	flw	%f0, 474(%zero)
	fmul	%f0, %f0, %f21
	fsub	%f1, %f30, %f0
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f18
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47677
fbgt_else.47676:
	fsub	%f22, %f2, %f0
	fmul	%f18, %f22, %f22
	fmul	%f21, %f18, %f18
	flw	%f0, 478(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f18
	fsub	%f1, %f22, %f0
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f21
	fadd	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f21
	fsub	%f0, %f1, %f0
fbgt_cont.47677:
	beqi	%a0, 0, bnei_else.47678
	j	bnei_cont.47679
bnei_else.47678:
	fneg	%f0, %f0
bnei_cont.47679:
	fblt	%f16, %fzero, fbgt_else.47680
	add	%a0, %zero, %k1
	j	fbgt_cont.47681
fbgt_else.47680:
	add	%a0, %zero, %zero
fbgt_cont.47681:
	fabs	%f18, %f16
	fdiv	%f1, %f18, %f19
	floor	%f1, %f1
	fmul	%f1, %f1, %f19
	fsub	%f1, %f18, %f1
	fblt	%f1, %f17, fbgt_else.47682
	beqi	%a0, 0, bnei_else.47684
	add	%a0, %zero, %zero
	j	fbgt_cont.47683
bnei_else.47684:
	add	%a0, %zero, %k1
bnei_cont.47685:
	j	fbgt_cont.47683
fbgt_else.47682:
fbgt_cont.47683:
	fblt	%f1, %f17, fbgt_else.47686
	fsub	%f1, %f1, %f17
	j	fbgt_cont.47687
fbgt_else.47686:
fbgt_cont.47687:
	fblt	%f1, %f2, fbgt_else.47688
	fsub	%f1, %f17, %f1
	j	fbgt_cont.47689
fbgt_else.47688:
fbgt_cont.47689:
	fblt	%f20, %f1, fbgt_else.47690
	fmul	%f23, %f1, %f1
	fmul	%f22, %f23, %f23
	flw	%f18, 478(%zero)
	fmul	%f18, %f18, %f1
	fmul	%f18, %f18, %f23
	fsub	%f21, %f1, %f18
	flw	%f18, 477(%zero)
	fmul	%f18, %f18, %f1
	fmul	%f18, %f18, %f22
	fadd	%f21, %f21, %f18
	flw	%f18, 476(%zero)
	fmul	%f1, %f18, %f1
	fmul	%f1, %f1, %f23
	fmul	%f1, %f1, %f22
	fsub	%f1, %f21, %f1
	j	fbgt_cont.47691
fbgt_else.47690:
	fsub	%f1, %f2, %f1
	fmul	%f22, %f1, %f1
	fmul	%f21, %f22, %f22
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f22
	fsub	%f18, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f21
	fadd	%f18, %f18, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f22
	fmul	%f1, %f1, %f21
	fsub	%f1, %f18, %f1
fbgt_cont.47691:
	beqi	%a0, 0, bnei_else.47692
	j	bnei_cont.47693
bnei_else.47692:
	fneg	%f1, %f1
bnei_cont.47693:
	fmul	%f1, %f0, %f1
	fsw	%f1, 78(%zero)
	fabs	%f16, %f16
	fdiv	%f1, %f16, %f19
	floor	%f1, %f1
	fmul	%f1, %f1, %f19
	fsub	%f1, %f16, %f1
	fblt	%f1, %f17, fbgt_else.47694
	add	%a0, %zero, %zero
	j	fbgt_cont.47695
fbgt_else.47694:
	add	%a0, %zero, %k1
fbgt_cont.47695:
	fblt	%f1, %f17, fbgt_else.47696
	fsub	%f1, %f1, %f17
	j	fbgt_cont.47697
fbgt_else.47696:
fbgt_cont.47697:
	fblt	%f1, %f2, fbgt_else.47698
	beqi	%a0, 0, bnei_else.47700
	add	%a0, %zero, %zero
	j	fbgt_cont.47699
bnei_else.47700:
	add	%a0, %zero, %k1
bnei_cont.47701:
	j	fbgt_cont.47699
fbgt_else.47698:
fbgt_cont.47699:
	fblt	%f1, %f2, fbgt_else.47702
	fsub	%f1, %f17, %f1
	j	fbgt_cont.47703
fbgt_else.47702:
fbgt_cont.47703:
	fblt	%f20, %f1, fbgt_else.47704
	fmul	%f18, %f1, %f1
	fmul	%f17, %f18, %f18
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f18
	fsub	%f16, %f30, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fsub	%f1, %f16, %f1
	j	fbgt_cont.47705
fbgt_else.47704:
	fsub	%f19, %f2, %f1
	fmul	%f18, %f19, %f19
	fmul	%f17, %f18, %f18
	flw	%f1, 478(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fsub	%f16, %f19, %f1
	flw	%f1, 477(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 476(%zero)
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fmul	%f1, %f1, %f17
	fsub	%f1, %f16, %f1
fbgt_cont.47705:
	beqi	%a0, 0, bnei_else.47706
	j	bnei_cont.47707
bnei_else.47706:
	fneg	%f1, %f1
bnei_cont.47707:
	fmul	%f0, %f0, %f1
	fsw	%f0, 80(%zero)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	fsw	%f0, 81(%zero)
	addi	%v0, %zero, 0
	jal	read_object.2772
	addi	%v0, %zero, 0
	jal	read_net_item.2776
	addi	%sp, %sp, -7
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.47708
	sw	%v0, 83(%zero)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	read_and_network.2780
	addi	%sp, %sp, -7
	j	bnei_cont.47709
bnei_else.47708:
bnei_cont.47709:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7
	jal	read_net_item.2776
	addi	%sp, %sp, -7
	addi	%s0, %v0, 0
	lw	%a0, 0(%s0)
	beqi	%a0, -1, bnei_else.47710
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	read_or_network.2778
	addi	%sp, %sp, -7
	sw	%s0, 0(%v0)
	j	bnei_cont.47711
bnei_else.47710:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
bnei_cont.47711:
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
	jal	print_int_sub1.2629
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	lw	%a3, 0(%sp)
	blti	%a3, 10, bgti_else.47712
	blti	%a3, 20, bgti_else.47714
	blti	%a3, 30, bgti_else.47716
	blti	%a3, 40, bgti_else.47718
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47713
	blti	%a3, 20, bgti_else.47722
	blti	%a3, 30, bgti_else.47724
	blti	%a3, 40, bgti_else.47726
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47713
	blti	%a3, 20, bgti_else.47730
	blti	%a3, 30, bgti_else.47732
	blti	%a3, 40, bgti_else.47734
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47713
	blti	%a3, 20, bgti_else.47738
	blti	%a3, 30, bgti_else.47740
	blti	%a3, 40, bgti_else.47742
	addi	%v0, %a3, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2632
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	j	bgti_cont.47713
bgti_else.47742:
	addi	%a3, %a3, -30
bgti_cont.47743:
	j	bgti_cont.47713
bgti_else.47740:
	addi	%a3, %a3, -20
bgti_cont.47741:
	j	bgti_cont.47713
bgti_else.47738:
	addi	%a3, %a3, -10
bgti_cont.47739:
	j	bgti_cont.47713
bgti_else.47736:
bgti_cont.47737:
	j	bgti_cont.47713
bgti_else.47734:
	addi	%a3, %a3, -30
bgti_cont.47735:
	j	bgti_cont.47713
bgti_else.47732:
	addi	%a3, %a3, -20
bgti_cont.47733:
	j	bgti_cont.47713
bgti_else.47730:
	addi	%a3, %a3, -10
bgti_cont.47731:
	j	bgti_cont.47713
bgti_else.47728:
bgti_cont.47729:
	j	bgti_cont.47713
bgti_else.47726:
	addi	%a3, %a3, -30
bgti_cont.47727:
	j	bgti_cont.47713
bgti_else.47724:
	addi	%a3, %a3, -20
bgti_cont.47725:
	j	bgti_cont.47713
bgti_else.47722:
	addi	%a3, %a3, -10
bgti_cont.47723:
	j	bgti_cont.47713
bgti_else.47720:
bgti_cont.47721:
	j	bgti_cont.47713
bgti_else.47718:
	addi	%a3, %a3, -30
bgti_cont.47719:
	j	bgti_cont.47713
bgti_else.47716:
	addi	%a3, %a3, -20
bgti_cont.47717:
	j	bgti_cont.47713
bgti_else.47714:
	addi	%a3, %a3, -10
bgti_cont.47715:
	j	bgti_cont.47713
bgti_else.47712:
bgti_cont.47713:
	blt	%zero, %a2, bgt_else.47744
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.47745
bgt_else.47744:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2629
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.47746
	blti	%a2, 20, bgti_else.47748
	blti	%a2, 30, bgti_else.47750
	blti	%a2, 40, bgti_else.47752
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47747
	blti	%a2, 20, bgti_else.47756
	blti	%a2, 30, bgti_else.47758
	blti	%a2, 40, bgti_else.47760
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47747
	blti	%a2, 20, bgti_else.47764
	blti	%a2, 30, bgti_else.47766
	blti	%a2, 40, bgti_else.47768
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47747
	blti	%a2, 20, bgti_else.47772
	blti	%a2, 30, bgti_else.47774
	blti	%a2, 40, bgti_else.47776
	addi	%v0, %a2, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2632
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	j	bgti_cont.47747
bgti_else.47776:
	addi	%a2, %a2, -30
bgti_cont.47777:
	j	bgti_cont.47747
bgti_else.47774:
	addi	%a2, %a2, -20
bgti_cont.47775:
	j	bgti_cont.47747
bgti_else.47772:
	addi	%a2, %a2, -10
bgti_cont.47773:
	j	bgti_cont.47747
bgti_else.47770:
bgti_cont.47771:
	j	bgti_cont.47747
bgti_else.47768:
	addi	%a2, %a2, -30
bgti_cont.47769:
	j	bgti_cont.47747
bgti_else.47766:
	addi	%a2, %a2, -20
bgti_cont.47767:
	j	bgti_cont.47747
bgti_else.47764:
	addi	%a2, %a2, -10
bgti_cont.47765:
	j	bgti_cont.47747
bgti_else.47762:
bgti_cont.47763:
	j	bgti_cont.47747
bgti_else.47760:
	addi	%a2, %a2, -30
bgti_cont.47761:
	j	bgti_cont.47747
bgti_else.47758:
	addi	%a2, %a2, -20
bgti_cont.47759:
	j	bgti_cont.47747
bgti_else.47756:
	addi	%a2, %a2, -10
bgti_cont.47757:
	j	bgti_cont.47747
bgti_else.47754:
bgti_cont.47755:
	j	bgti_cont.47747
bgti_else.47752:
	addi	%a2, %a2, -30
bgti_cont.47753:
	j	bgti_cont.47747
bgti_else.47750:
	addi	%a2, %a2, -20
bgti_cont.47751:
	j	bgti_cont.47747
bgti_else.47748:
	addi	%a2, %a2, -10
bgti_cont.47749:
	j	bgti_cont.47747
bgti_else.47746:
bgti_cont.47747:
	blt	%zero, %a0, bgt_else.47778
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.47779
bgt_else.47778:
	blti	%a0, 10, bgti_else.47780
	blti	%a0, 20, bgti_else.47782
	blti	%a0, 30, bgti_else.47784
	blti	%a0, 40, bgti_else.47786
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47781
	blti	%a0, 20, bgti_else.47790
	blti	%a0, 30, bgti_else.47792
	blti	%a0, 40, bgti_else.47794
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47781
	blti	%a0, 20, bgti_else.47798
	blti	%a0, 30, bgti_else.47800
	blti	%a0, 40, bgti_else.47802
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47781
	blti	%a0, 20, bgti_else.47806
	blti	%a0, 30, bgti_else.47808
	blti	%a0, 40, bgti_else.47810
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2632
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	j	bgti_cont.47781
bgti_else.47810:
	addi	%a0, %a0, -30
bgti_cont.47811:
	j	bgti_cont.47781
bgti_else.47808:
	addi	%a0, %a0, -20
bgti_cont.47809:
	j	bgti_cont.47781
bgti_else.47806:
	addi	%a0, %a0, -10
bgti_cont.47807:
	j	bgti_cont.47781
bgti_else.47804:
bgti_cont.47805:
	j	bgti_cont.47781
bgti_else.47802:
	addi	%a0, %a0, -30
bgti_cont.47803:
	j	bgti_cont.47781
bgti_else.47800:
	addi	%a0, %a0, -20
bgti_cont.47801:
	j	bgti_cont.47781
bgti_else.47798:
	addi	%a0, %a0, -10
bgti_cont.47799:
	j	bgti_cont.47781
bgti_else.47796:
bgti_cont.47797:
	j	bgti_cont.47781
bgti_else.47794:
	addi	%a0, %a0, -30
bgti_cont.47795:
	j	bgti_cont.47781
bgti_else.47792:
	addi	%a0, %a0, -20
bgti_cont.47793:
	j	bgti_cont.47781
bgti_else.47790:
	addi	%a0, %a0, -10
bgti_cont.47791:
	j	bgti_cont.47781
bgti_else.47788:
bgti_cont.47789:
	j	bgti_cont.47781
bgti_else.47786:
	addi	%a0, %a0, -30
bgti_cont.47787:
	j	bgti_cont.47781
bgti_else.47784:
	addi	%a0, %a0, -20
bgti_cont.47785:
	j	bgti_cont.47781
bgti_else.47782:
	addi	%a0, %a0, -10
bgti_cont.47783:
	j	bgti_cont.47781
bgti_else.47780:
bgti_cont.47781:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
bgt_cont.47779:
bgt_cont.47745:
	addi	%a2, %zero, 32
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	lw	%a3, 155(%zero)
	addi	%v1, %zero, 0
	addi	%v0, %a3, 0
	jal	print_int_sub1.2629
	addi	%sp, %sp, -7
	addi	%fp, %v0, 0
	blti	%a3, 10, bgti_else.47812
	blti	%a3, 20, bgti_else.47814
	blti	%a3, 30, bgti_else.47816
	blti	%a3, 40, bgti_else.47818
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47813
	blti	%a3, 20, bgti_else.47822
	blti	%a3, 30, bgti_else.47824
	blti	%a3, 40, bgti_else.47826
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47813
	blti	%a3, 20, bgti_else.47830
	blti	%a3, 30, bgti_else.47832
	blti	%a3, 40, bgti_else.47834
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.47813
	blti	%a3, 20, bgti_else.47838
	blti	%a3, 30, bgti_else.47840
	blti	%a3, 40, bgti_else.47842
	addi	%v0, %a3, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2632
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	j	bgti_cont.47813
bgti_else.47842:
	addi	%a3, %a3, -30
bgti_cont.47843:
	j	bgti_cont.47813
bgti_else.47840:
	addi	%a3, %a3, -20
bgti_cont.47841:
	j	bgti_cont.47813
bgti_else.47838:
	addi	%a3, %a3, -10
bgti_cont.47839:
	j	bgti_cont.47813
bgti_else.47836:
bgti_cont.47837:
	j	bgti_cont.47813
bgti_else.47834:
	addi	%a3, %a3, -30
bgti_cont.47835:
	j	bgti_cont.47813
bgti_else.47832:
	addi	%a3, %a3, -20
bgti_cont.47833:
	j	bgti_cont.47813
bgti_else.47830:
	addi	%a3, %a3, -10
bgti_cont.47831:
	j	bgti_cont.47813
bgti_else.47828:
bgti_cont.47829:
	j	bgti_cont.47813
bgti_else.47826:
	addi	%a3, %a3, -30
bgti_cont.47827:
	j	bgti_cont.47813
bgti_else.47824:
	addi	%a3, %a3, -20
bgti_cont.47825:
	j	bgti_cont.47813
bgti_else.47822:
	addi	%a3, %a3, -10
bgti_cont.47823:
	j	bgti_cont.47813
bgti_else.47820:
bgti_cont.47821:
	j	bgti_cont.47813
bgti_else.47818:
	addi	%a3, %a3, -30
bgti_cont.47819:
	j	bgti_cont.47813
bgti_else.47816:
	addi	%a3, %a3, -20
bgti_cont.47817:
	j	bgti_cont.47813
bgti_else.47814:
	addi	%a3, %a3, -10
bgti_cont.47815:
	j	bgti_cont.47813
bgti_else.47812:
bgti_cont.47813:
	blt	%zero, %fp, bgt_else.47844
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.47845
bgt_else.47844:
	addi	%v1, %zero, 0
	addi	%v0, %fp, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2629
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	blti	%fp, 10, bgti_else.47846
	blti	%fp, 20, bgti_else.47848
	blti	%fp, 30, bgti_else.47850
	blti	%fp, 40, bgti_else.47852
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.47847
	blti	%fp, 20, bgti_else.47856
	blti	%fp, 30, bgti_else.47858
	blti	%fp, 40, bgti_else.47860
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.47847
	blti	%fp, 20, bgti_else.47864
	blti	%fp, 30, bgti_else.47866
	blti	%fp, 40, bgti_else.47868
	addi	%fp, %fp, -40
	blti	%fp, 10, bgti_cont.47847
	blti	%fp, 20, bgti_else.47872
	blti	%fp, 30, bgti_else.47874
	blti	%fp, 40, bgti_else.47876
	addi	%v0, %fp, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2632
	addi	%sp, %sp, -7
	addi	%fp, %v0, 0
	j	bgti_cont.47847
bgti_else.47876:
	addi	%fp, %fp, -30
bgti_cont.47877:
	j	bgti_cont.47847
bgti_else.47874:
	addi	%fp, %fp, -20
bgti_cont.47875:
	j	bgti_cont.47847
bgti_else.47872:
	addi	%fp, %fp, -10
bgti_cont.47873:
	j	bgti_cont.47847
bgti_else.47870:
bgti_cont.47871:
	j	bgti_cont.47847
bgti_else.47868:
	addi	%fp, %fp, -30
bgti_cont.47869:
	j	bgti_cont.47847
bgti_else.47866:
	addi	%fp, %fp, -20
bgti_cont.47867:
	j	bgti_cont.47847
bgti_else.47864:
	addi	%fp, %fp, -10
bgti_cont.47865:
	j	bgti_cont.47847
bgti_else.47862:
bgti_cont.47863:
	j	bgti_cont.47847
bgti_else.47860:
	addi	%fp, %fp, -30
bgti_cont.47861:
	j	bgti_cont.47847
bgti_else.47858:
	addi	%fp, %fp, -20
bgti_cont.47859:
	j	bgti_cont.47847
bgti_else.47856:
	addi	%fp, %fp, -10
bgti_cont.47857:
	j	bgti_cont.47847
bgti_else.47854:
bgti_cont.47855:
	j	bgti_cont.47847
bgti_else.47852:
	addi	%fp, %fp, -30
bgti_cont.47853:
	j	bgti_cont.47847
bgti_else.47850:
	addi	%fp, %fp, -20
bgti_cont.47851:
	j	bgti_cont.47847
bgti_else.47848:
	addi	%fp, %fp, -10
bgti_cont.47849:
	j	bgti_cont.47847
bgti_else.47846:
bgti_cont.47847:
	blt	%zero, %a0, bgt_else.47878
	addi	%v0, %fp, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.47879
bgt_else.47878:
	blti	%a0, 10, bgti_else.47880
	blti	%a0, 20, bgti_else.47882
	blti	%a0, 30, bgti_else.47884
	blti	%a0, 40, bgti_else.47886
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47881
	blti	%a0, 20, bgti_else.47890
	blti	%a0, 30, bgti_else.47892
	blti	%a0, 40, bgti_else.47894
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47881
	blti	%a0, 20, bgti_else.47898
	blti	%a0, 30, bgti_else.47900
	blti	%a0, 40, bgti_else.47902
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47881
	blti	%a0, 20, bgti_else.47906
	blti	%a0, 30, bgti_else.47908
	blti	%a0, 40, bgti_else.47910
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2632
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	j	bgti_cont.47881
bgti_else.47910:
	addi	%a0, %a0, -30
bgti_cont.47911:
	j	bgti_cont.47881
bgti_else.47908:
	addi	%a0, %a0, -20
bgti_cont.47909:
	j	bgti_cont.47881
bgti_else.47906:
	addi	%a0, %a0, -10
bgti_cont.47907:
	j	bgti_cont.47881
bgti_else.47904:
bgti_cont.47905:
	j	bgti_cont.47881
bgti_else.47902:
	addi	%a0, %a0, -30
bgti_cont.47903:
	j	bgti_cont.47881
bgti_else.47900:
	addi	%a0, %a0, -20
bgti_cont.47901:
	j	bgti_cont.47881
bgti_else.47898:
	addi	%a0, %a0, -10
bgti_cont.47899:
	j	bgti_cont.47881
bgti_else.47896:
bgti_cont.47897:
	j	bgti_cont.47881
bgti_else.47894:
	addi	%a0, %a0, -30
bgti_cont.47895:
	j	bgti_cont.47881
bgti_else.47892:
	addi	%a0, %a0, -20
bgti_cont.47893:
	j	bgti_cont.47881
bgti_else.47890:
	addi	%a0, %a0, -10
bgti_cont.47891:
	j	bgti_cont.47881
bgti_else.47888:
bgti_cont.47889:
	j	bgti_cont.47881
bgti_else.47886:
	addi	%a0, %a0, -30
bgti_cont.47887:
	j	bgti_cont.47881
bgti_else.47884:
	addi	%a0, %a0, -20
bgti_cont.47885:
	j	bgti_cont.47881
bgti_else.47882:
	addi	%a0, %a0, -10
bgti_cont.47883:
	j	bgti_cont.47881
bgti_else.47880:
bgti_cont.47881:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %fp, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
bgt_cont.47879:
bgt_cont.47845:
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %zero, 255
	addi	%v1, %zero, 0
	jal	print_int_sub1.2629
	addi	%a2, %v0, 0
	addi	%v0, %zero, 95
	jal	print_int_sub2.2632
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0
	blt	%zero, %a2, bgt_else.47912
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.47913
bgt_else.47912:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7
	jal	print_int_sub1.2629
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.47914
	blti	%a2, 20, bgti_else.47916
	blti	%a2, 30, bgti_else.47918
	blti	%a2, 40, bgti_else.47920
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47915
	blti	%a2, 20, bgti_else.47924
	blti	%a2, 30, bgti_else.47926
	blti	%a2, 40, bgti_else.47928
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47915
	blti	%a2, 20, bgti_else.47932
	blti	%a2, 30, bgti_else.47934
	blti	%a2, 40, bgti_else.47936
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.47915
	blti	%a2, 20, bgti_else.47940
	blti	%a2, 30, bgti_else.47942
	blti	%a2, 40, bgti_else.47944
	addi	%v0, %a2, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2632
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	j	bgti_cont.47915
bgti_else.47944:
	addi	%a2, %a2, -30
bgti_cont.47945:
	j	bgti_cont.47915
bgti_else.47942:
	addi	%a2, %a2, -20
bgti_cont.47943:
	j	bgti_cont.47915
bgti_else.47940:
	addi	%a2, %a2, -10
bgti_cont.47941:
	j	bgti_cont.47915
bgti_else.47938:
bgti_cont.47939:
	j	bgti_cont.47915
bgti_else.47936:
	addi	%a2, %a2, -30
bgti_cont.47937:
	j	bgti_cont.47915
bgti_else.47934:
	addi	%a2, %a2, -20
bgti_cont.47935:
	j	bgti_cont.47915
bgti_else.47932:
	addi	%a2, %a2, -10
bgti_cont.47933:
	j	bgti_cont.47915
bgti_else.47930:
bgti_cont.47931:
	j	bgti_cont.47915
bgti_else.47928:
	addi	%a2, %a2, -30
bgti_cont.47929:
	j	bgti_cont.47915
bgti_else.47926:
	addi	%a2, %a2, -20
bgti_cont.47927:
	j	bgti_cont.47915
bgti_else.47924:
	addi	%a2, %a2, -10
bgti_cont.47925:
	j	bgti_cont.47915
bgti_else.47922:
bgti_cont.47923:
	j	bgti_cont.47915
bgti_else.47920:
	addi	%a2, %a2, -30
bgti_cont.47921:
	j	bgti_cont.47915
bgti_else.47918:
	addi	%a2, %a2, -20
bgti_cont.47919:
	j	bgti_cont.47915
bgti_else.47916:
	addi	%a2, %a2, -10
bgti_cont.47917:
	j	bgti_cont.47915
bgti_else.47914:
bgti_cont.47915:
	blt	%zero, %a0, bgt_else.47946
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	j	bgt_cont.47947
bgt_else.47946:
	blti	%a0, 10, bgti_else.47948
	blti	%a0, 20, bgti_else.47950
	blti	%a0, 30, bgti_else.47952
	blti	%a0, 40, bgti_else.47954
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47949
	blti	%a0, 20, bgti_else.47958
	blti	%a0, 30, bgti_else.47960
	blti	%a0, 40, bgti_else.47962
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47949
	blti	%a0, 20, bgti_else.47966
	blti	%a0, 30, bgti_else.47968
	blti	%a0, 40, bgti_else.47970
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.47949
	blti	%a0, 20, bgti_else.47974
	blti	%a0, 30, bgti_else.47976
	blti	%a0, 40, bgti_else.47978
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7
	jal	print_int_sub2.2632
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	j	bgti_cont.47949
bgti_else.47978:
	addi	%a0, %a0, -30
bgti_cont.47979:
	j	bgti_cont.47949
bgti_else.47976:
	addi	%a0, %a0, -20
bgti_cont.47977:
	j	bgti_cont.47949
bgti_else.47974:
	addi	%a0, %a0, -10
bgti_cont.47975:
	j	bgti_cont.47949
bgti_else.47972:
bgti_cont.47973:
	j	bgti_cont.47949
bgti_else.47970:
	addi	%a0, %a0, -30
bgti_cont.47971:
	j	bgti_cont.47949
bgti_else.47968:
	addi	%a0, %a0, -20
bgti_cont.47969:
	j	bgti_cont.47949
bgti_else.47966:
	addi	%a0, %a0, -10
bgti_cont.47967:
	j	bgti_cont.47949
bgti_else.47964:
bgti_cont.47965:
	j	bgti_cont.47949
bgti_else.47962:
	addi	%a0, %a0, -30
bgti_cont.47963:
	j	bgti_cont.47949
bgti_else.47960:
	addi	%a0, %a0, -20
bgti_cont.47961:
	j	bgti_cont.47949
bgti_else.47958:
	addi	%a0, %a0, -10
bgti_cont.47959:
	j	bgti_cont.47949
bgti_else.47956:
bgti_cont.47957:
	j	bgti_cont.47949
bgti_else.47954:
	addi	%a0, %a0, -30
bgti_cont.47955:
	j	bgti_cont.47949
bgti_else.47952:
	addi	%a0, %a0, -20
bgti_cont.47953:
	j	bgti_cont.47949
bgti_else.47950:
	addi	%a0, %a0, -10
bgti_cont.47951:
	j	bgti_cont.47949
bgti_else.47948:
bgti_cont.47949:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%v0, %a2, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -7
bgt_cont.47947:
bgt_cont.47913:
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
	addi	%sp, %sp, -8
	flw	%f26, 78(%zero)
	fsw	%f26, 184(%zero)
	flw	%f27, 79(%zero)
	fsw	%f27, 185(%zero)
	flw	%f28, 80(%zero)
	fsw	%f28, 186(%zero)
	lw	%a0, 7(%sp)
	addi	%s4, %a0, -1
	blti	%s4, 0, bgti_else.47980
	lw	%a0, 12(%s4)
	lw	%a2, 9(%a0)
	lw	%fp, 6(%a0)
	lw	%a1, 4(%a0)
	lw	%a3, 3(%a0)
	lw	%a0, 1(%a0)
	beqi	%a0, 1, bnei_else.47982
	beqi	%a0, 2, bnei_else.47984
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
	beqi	%a3, 0, bnei_else.47986
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
	j	bnei_cont.47987
bnei_else.47986:
bnei_cont.47987:
	fmul	%f1, %f20, %f21
	fneg	%f24, %f1
	fmul	%f1, %f18, %f2
	fneg	%f22, %f1
	fmul	%f1, %f16, %f19
	fneg	%f19, %f1
	fsw	%f0, 0(%v0)
	beqi	%a3, 0, bnei_else.47988
	flw	%f21, 1(%a2)
	fmul	%f17, %f16, %f21
	flw	%f23, 2(%a2)
	fmul	%f1, %f18, %f23
	fadd	%f1, %f17, %f1
	flw	%f2, 474(%zero)
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
	j	bnei_cont.47989
bnei_else.47988:
	fsw	%f24, 1(%v0)
	fsw	%f22, 2(%v0)
	fsw	%f19, 3(%v0)
bnei_cont.47989:
	fbne	%f0, %fzero, fbeq_else.47990
	add	%a0, %zero, %k1
	j	fbeq_cont.47991
fbeq_else.47990:
	add	%a0, %zero, %zero
fbeq_cont.47991:
	beqi	%a0, 0, bnei_else.47992
	j	bnei_cont.47993
bnei_else.47992:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.47993:
	sw	%v0, 187(%s4)
	j	bnei_cont.47983
bnei_else.47984:
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
	fblt	%fzero, %f1, fbgt_else.47994
	add	%a0, %zero, %zero
	j	fbgt_cont.47995
fbgt_else.47994:
	add	%a0, %zero, %k1
fbgt_cont.47995:
	beqi	%a0, 0, bnei_else.47996
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
	j	bnei_cont.47997
bnei_else.47996:
	fsw	%fzero, 0(%v0)
bnei_cont.47997:
	sw	%v0, 187(%s4)
bnei_cont.47985:
	j	bnei_cont.47983
bnei_else.47982:
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	flw	%f1, 184(%zero)
	fbne	%f1, %fzero, fbeq_else.47998
	add	%a0, %zero, %k1
	j	fbeq_cont.47999
fbeq_else.47998:
	add	%a0, %zero, %zero
fbeq_cont.47999:
	beqi	%a0, 0, bnei_else.48000
	fsw	%fzero, 1(%v0)
	j	bnei_cont.48001
bnei_else.48000:
	fblt	%f1, %fzero, fbgt_else.48002
	add	%a0, %zero, %zero
	j	fbgt_cont.48003
fbgt_else.48002:
	add	%a0, %zero, %k1
fbgt_cont.48003:
	beqi	%fp, 0, bnei_else.48004
	beqi	%a0, 0, bnei_else.48006
	add	%a0, %zero, %zero
	j	bnei_cont.48005
bnei_else.48006:
	add	%a0, %zero, %k1
bnei_cont.48007:
	j	bnei_cont.48005
bnei_else.48004:
bnei_cont.48005:
	flw	%f0, 0(%a1)
	beqi	%a0, 0, bnei_else.48008
	j	bnei_cont.48009
bnei_else.48008:
	fneg	%f0, %f0
bnei_cont.48009:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.48001:
	flw	%f1, 185(%zero)
	fbne	%f1, %fzero, fbeq_else.48010
	add	%a0, %zero, %k1
	j	fbeq_cont.48011
fbeq_else.48010:
	add	%a0, %zero, %zero
fbeq_cont.48011:
	beqi	%a0, 0, bnei_else.48012
	fsw	%fzero, 3(%v0)
	j	bnei_cont.48013
bnei_else.48012:
	fblt	%f1, %fzero, fbgt_else.48014
	add	%a0, %zero, %zero
	j	fbgt_cont.48015
fbgt_else.48014:
	add	%a0, %zero, %k1
fbgt_cont.48015:
	beqi	%fp, 0, bnei_else.48016
	beqi	%a0, 0, bnei_else.48018
	add	%a0, %zero, %zero
	j	bnei_cont.48017
bnei_else.48018:
	add	%a0, %zero, %k1
bnei_cont.48019:
	j	bnei_cont.48017
bnei_else.48016:
bnei_cont.48017:
	flw	%f0, 1(%a1)
	beqi	%a0, 0, bnei_else.48020
	j	bnei_cont.48021
bnei_else.48020:
	fneg	%f0, %f0
bnei_cont.48021:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.48013:
	flw	%f1, 186(%zero)
	fbne	%f1, %fzero, fbeq_else.48022
	add	%a0, %zero, %k1
	j	fbeq_cont.48023
fbeq_else.48022:
	add	%a0, %zero, %zero
fbeq_cont.48023:
	beqi	%a0, 0, bnei_else.48024
	fsw	%fzero, 5(%v0)
	j	bnei_cont.48025
bnei_else.48024:
	fblt	%f1, %fzero, fbgt_else.48026
	add	%a0, %zero, %zero
	j	fbgt_cont.48027
fbgt_else.48026:
	add	%a0, %zero, %k1
fbgt_cont.48027:
	beqi	%fp, 0, bnei_else.48028
	beqi	%a0, 0, bnei_else.48030
	add	%a0, %zero, %zero
	j	bnei_cont.48029
bnei_else.48030:
	add	%a0, %zero, %k1
bnei_cont.48031:
	j	bnei_cont.48029
bnei_else.48028:
bnei_cont.48029:
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.48032
	j	bnei_cont.48033
bnei_else.48032:
	fneg	%f0, %f0
bnei_cont.48033:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.48025:
	sw	%v0, 187(%s4)
bnei_cont.47983:
	addi	%v1, %s4, -1
	addi	%v0, %zero, 247
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -8
	j	bgti_cont.47981
bgti_else.47980:
bgti_cont.47981:
	blti	%s4, 0, bgti_else.48034
	lw	%a1, 12(%s4)
	lw	%a2, 7(%a1)
	lw	%a3, 4(%a1)
	lw	%a0, 2(%a1)
	lw	%a1, 1(%a1)
	beqi	%a0, 2, bnei_else.48036
	j	bgti_cont.48035
bnei_else.48036:
	flw	%f0, 0(%a2)
	fblt	%f0, %f30, fbgt_else.48038
	add	%a0, %zero, %zero
	j	fbgt_cont.48039
fbgt_else.48038:
	add	%a0, %zero, %k1
fbgt_cont.48039:
	beqi	%a0, 0, bgti_cont.48035
	beqi	%a1, 1, bnei_else.48042
	beqi	%a1, 2, bnei_else.48044
	j	bgti_cont.48035
bnei_else.48044:
	sll	%a0, %s4, 2
	addi	%s5, %a0, 1
	lw	%s6, 434(%zero)
	fsub	%f29, %f30, %f0
	flw	%f17, 0(%a3)
	fmul	%f1, %f26, %f17
	flw	%f16, 1(%a3)
	fmul	%f0, %f27, %f16
	fadd	%f1, %f1, %f0
	flw	%f19, 2(%a3)
	fmul	%f0, %f28, %f19
	fadd	%f18, %f1, %f0
	flw	%f1, 470(%zero)
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
	add	%s7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s7)
	sw	%a1, 0(%s7)
	fsw	%f17, 0(%a1)
	fsw	%f16, 1(%a1)
	fsw	%f1, 2(%a1)
	addi	%v1, %s4, 0
	addi	%v0, %s7, 0
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%s7, 1(%a0)
	sw	%s5, 0(%a0)
	sw	%a0, 254(%s6)
	addi	%a0, %s6, 1
	sw	%a0, 434(%zero)
bnei_cont.48045:
	j	bgti_cont.48035
bnei_else.48042:
	sll	%s5, %s4, 2
	lw	%s6, 434(%zero)
	fsub	%f29, %f30, %f0
	fneg	%f0, %f26
	fsw	%f0, 8(%sp)
	fneg	%f0, %f27
	fsw	%f0, 9(%sp)
	fneg	%f3, %f28
	addi	%s7, %s5, 1
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
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t7)
	sw	%a1, 0(%t7)
	fsw	%f26, 0(%a1)
	flw	%f0, 9(%sp)
	fsw	%f0, 1(%a1)
	fsw	%f3, 2(%a1)
	addi	%v1, %s4, 0
	addi	%v0, %t7, 0
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2877
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%t7, 1(%a0)
	sw	%s7, 0(%a0)
	sw	%a0, 254(%s6)
	addi	%s7, %s6, 1
	addi	%t7, %s5, 2
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
	fsw	%f27, 1(%a1)
	fsw	%f3, 2(%a1)
	addi	%v1, %s4, 0
	addi	%v0, %t8, 0
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2877
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%t8, 1(%a0)
	sw	%t7, 0(%a0)
	sw	%a0, 254(%s7)
	addi	%s7, %s6, 2
	addi	%s5, %s5, 3
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
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t7)
	sw	%a1, 0(%t7)
	flw	%f0, 8(%sp)
	fsw	%f0, 0(%a1)
	flw	%f0, 9(%sp)
	fsw	%f0, 1(%a1)
	fsw	%f28, 2(%a1)
	addi	%v1, %s4, 0
	addi	%v0, %t7, 0
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -10
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f29, 2(%a0)
	sw	%t7, 1(%a0)
	sw	%s5, 0(%a0)
	sw	%a0, 254(%s7)
	addi	%a0, %s6, 3
	sw	%a0, 434(%zero)
bnei_cont.48043:
	j	bgti_cont.48035
bnei_else.48040:
bnei_cont.48041:
bnei_cont.48037:
	j	bgti_cont.48035
bgti_else.48034:
bgti_cont.48035:
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
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -10
	addi	%a2, %zero, 2
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 10
	jal	scan_line.3051
	addi	%sp, %sp, -10
	add	%g0, %zero, %zero
	ret
