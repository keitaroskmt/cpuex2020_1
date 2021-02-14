	nop
	nop
	lui	%sp, 1
	lui	%hp, 0

	nop
	nop
	ori	%sp, %sp, 44464
	ori	%hp, %hp, 497

	nop
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
	nop
	sll	%v1, %v1, 8

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
	nop
	sll	%v1, %v1, 16

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
	nop
	sll	%v1, %v1, 24

	nop
	nop
	nop
	or	%v0, %v0, %v1

	nop
	nop
	nop
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
	nop
	sll	%v1, %v1, 8

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
	nop
	sll	%v1, %v1, 16

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
	nop
	sll	%v1, %v1, 24

	nop
	nop
	nop
	or	%v0, %v0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%hp)

	nop
	nop
	nop
	flw	%f0, 0(%hp)

	nop
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
	bne	%a0, %zero, create_array_cont

	nop
	nop
	nop
	jr	%ra

create_array_cont:
	nop
	nop
	sw	%v1, 0(%hp)
	addi	%a0, %a0, -1

	nop
	nop
	nop
	addi	%hp, %hp, 1

	nop
	nop
	nop
	j	create_array_loop

min_caml_create_float_array:
	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %hp, 0

create_float_array_loop:
	nop
	nop
	nop
	bne	%v1, %zero, create_float_array_cont

	nop
	nop
	nop
	jr	%ra

create_float_array_cont:
	nop
	nop
	fsw	%f0, 0(%hp)
	addi	%v1, %v1, -1

	nop
	nop
	nop
	addi	%hp, %hp, 1

	nop
	nop
	nop
	j	create_float_array_loop

min_caml_create_extarray:
	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0

create_extarray_loop:
	nop
	nop
	nop
	bne	%a1, %zero, create_extarray_cont

	nop
	nop
	nop
	jr	%ra

create_extarray_cont:
	nop
	nop
	sw	%v1, 0(%a0)
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%a0, %a0, 1

	nop
	nop
	nop
	j	create_extarray_loop

min_caml_create_float_extarray:
	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0

create_float_extarray_loop:
	nop
	nop
	nop
	bne	%a0, %zero, create_float_extarray_cont

	nop
	nop
	nop
	jr	%ra

create_float_extarray_cont:
	nop
	nop
	fsw	%f0, 0(%v1)
	addi	%a0, %a0, -1

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	j	create_float_extarray_loop

reduction_2pi_sub1.2626:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21789

	nop
	nop
	nop
	flw	%f2, 496(%zero)

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21790

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21791

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21792

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21793

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21794

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21795

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21796

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21797

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21798

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21799

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21800

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21801

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21802

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21803

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21804

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	j	reduction_2pi_sub1.2626

fbgt_else.21804:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21803:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21802:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21801:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21800:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21799:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21798:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21797:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21796:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21795:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21794:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21793:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21792:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21791:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21790:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.21789:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

reduction_2pi_sub2.2629:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21805

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21806

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21807

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21808

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21809

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21810

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21811

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21812

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21812:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21811:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21810:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21813

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21814

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21814:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21813:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21809:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21808:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21815

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21816

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21817

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21818

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21818:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21817:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21816:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21819

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21820

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21820:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21819:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21815:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21807:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21806:
	nop
	nop
	nop
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21821

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21822

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21823

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21824

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21825

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21826

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21826:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21825:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21824:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21827

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21828

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21828:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21827:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21823:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21822:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21829

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21830

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21831

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21832

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21832:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21831:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21830:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21833

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21834

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21834:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.21833:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21829:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21821:
	nop
	nop
	nop
	jr	%ra

fbgt_else.21805:
	nop
	nop
	nop
	jr	%ra

cos.2635:
	nop
	flw	%f1, 495(%zero)
	fabs	%f0, %f0
	flw	%f2, 494(%zero)

	nop
	nop
	nop
	fsw	%f1, 0(%sp)

	nop
	nop
	nop
	fsw	%f0, 1(%sp)

	nop
	nop
	nop
	fsw	%f2, 2(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21880

	nop
	nop
	nop
	flw	%f3, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21882

	nop
	nop
	nop
	flw	%f3, 492(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21884

	nop
	nop
	nop
	flw	%f3, 491(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21886

	nop
	nop
	nop
	flw	%f3, 490(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21888

	nop
	nop
	nop
	flw	%f3, 489(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21890

	nop
	nop
	nop
	flw	%f3, 488(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21892

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21894

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21896

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21898

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21900

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21902

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21904

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21906

	nop
	nop
	flw	%f3, 480(%zero)
	sw	%ra, 3(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21906:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21907:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21904:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21905:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21902:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21903:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21900:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21901:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21898:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21899:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21896:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21897:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21894:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21895:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21892:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21893:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21890:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21891:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21888:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21889:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21886:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21887:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21884:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21885:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21882:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21883:
	nop
	nop
	nop
	j	fbgt_cont.21881

fbgt_else.21880:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.21881:
	nop
	nop
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.21908

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.21910

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.21912

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.21914

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 3(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	j	fbgt_cont.21909

fbgt_else.21914:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 3(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

fbgt_cont.21915:
	nop
	nop
	nop
	j	fbgt_cont.21909

fbgt_else.21912:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.21913:
	nop
	nop
	nop
	j	fbgt_cont.21909

fbgt_else.21910:
	nop
	nop
	nop
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.21916

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.21918

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 3(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	j	fbgt_cont.21909

fbgt_else.21918:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 3(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

fbgt_cont.21919:
	nop
	nop
	nop
	j	fbgt_cont.21909

fbgt_else.21916:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.21917:
fbgt_cont.21911:
	nop
	nop
	nop
	j	fbgt_cont.21909

fbgt_else.21908:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.21909:
	nop
	nop
	nop
	flw	%f1, 0(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21920

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.21921

fbgt_else.21920:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.21921:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.21922

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.21923

fbgt_else.21922:
fbgt_cont.21923:
	nop
	nop
	nop
	flw	%f2, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21924

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.21926

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.21925

bnei_else.21926:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.21927:
	nop
	nop
	nop
	j	fbgt_cont.21925

fbgt_else.21924:
fbgt_cont.21925:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21928

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.21929

fbgt_else.21928:
fbgt_cont.21929:
	nop
	nop
	nop
	flw	%f1, 478(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.21930

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.21931

fbgt_else.21930:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.21931:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.21932

	nop
	nop
	nop
	jr	%ra

bnei_else.21932:
	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	jr	%ra

sin.2637:
	nop
	nop
	flw	%f1, 495(%zero)
	flw	%f2, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21993

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.21994

fbgt_else.21993:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.21994:
	nop
	fabs	%f0, %f0
	flw	%f2, 494(%zero)
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	fsw	%f1, 1(%sp)

	nop
	nop
	nop
	fsw	%f0, 2(%sp)

	nop
	nop
	nop
	fsw	%f2, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.21995

	nop
	nop
	nop
	flw	%f3, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21997

	nop
	nop
	nop
	flw	%f3, 492(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.21999

	nop
	nop
	nop
	flw	%f3, 491(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22001

	nop
	nop
	nop
	flw	%f3, 490(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22003

	nop
	nop
	nop
	flw	%f3, 489(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22005

	nop
	nop
	nop
	flw	%f3, 488(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22007

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22009

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22011

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22013

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22015

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22017

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22019

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.22021

	nop
	nop
	flw	%f3, 480(%zero)
	sw	%ra, 4(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22021:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22022:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22019:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22020:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22017:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22018:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22015:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22016:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22013:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22014:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22011:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22012:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22009:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22010:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22007:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22008:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22005:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22006:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22003:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22004:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.22001:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22002:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.21999:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.22000:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.21997:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.21998:
	nop
	nop
	nop
	j	fbgt_cont.21996

fbgt_else.21995:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.21996:
	nop
	nop
	flw	%f1, 2(%sp)
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.22023

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.22025

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.22027

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.22029

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 4(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	j	fbgt_cont.22024

fbgt_else.22029:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 4(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

fbgt_cont.22030:
	nop
	nop
	nop
	j	fbgt_cont.22024

fbgt_else.22027:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.22028:
	nop
	nop
	nop
	j	fbgt_cont.22024

fbgt_else.22025:
	nop
	nop
	nop
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.22031

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.22033

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 4(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	j	fbgt_cont.22024

fbgt_else.22033:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 4(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

fbgt_cont.22034:
	nop
	nop
	nop
	j	fbgt_cont.22024

fbgt_else.22031:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.22032:
fbgt_cont.22026:
	nop
	nop
	nop
	j	fbgt_cont.22024

fbgt_else.22023:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.22024:
	nop
	nop
	nop
	flw	%f1, 1(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.22035

	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.22037

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.22036

bnei_else.22037:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.22038:
	nop
	nop
	nop
	j	fbgt_cont.22036

fbgt_else.22035:
	nop
	nop
	nop
	lw	%v0, 0(%sp)

fbgt_cont.22036:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.22039

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.22040

fbgt_else.22039:
fbgt_cont.22040:
	nop
	nop
	nop
	flw	%f2, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.22041

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.22042

fbgt_else.22041:
fbgt_cont.22042:
	nop
	nop
	nop
	flw	%f1, 478(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.22043

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.22044

fbgt_else.22043:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.22044:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.22045

	nop
	nop
	nop
	jr	%ra

bnei_else.22045:
	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	jr	%ra

atan.2639:
	nop
	nop
	nop
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.22046

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.22047

fbgt_else.22046:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.22047:
	nop
	nop
	fabs	%f1, %f0
	flw	%f2, 469(%zero)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.22048

	nop
	nop
	nop
	flw	%f0, 462(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.22049

	nop
	nop
	flw	%f0, 479(%zero)
	flw	%f2, 474(%zero)

	nop
	fdiv	%f1, %f2, %f1
	flw	%f5, 468(%zero)
	flw	%f6, 467(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f5, %f5, %f1

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f5, %f5, %f2

	nop
	nop
	fmul	%f4, %f3, %f3
	fsub	%f5, %f1, %f5

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f3

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 466(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f2

	nop
	nop
	nop
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 465(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 464(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f2, %f6, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	fsub	%f2, %f5, %f2
	flw	%f5, 463(%zero)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fadd	%f1, %f2, %f1

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.22050

fbgt_else.22049:
	nop
	nop
	flw	%f0, 478(%zero)
	flw	%f2, 474(%zero)

	fsub	%f3, %f1, %f2
	fadd	%f1, %f1, %f2
	flw	%f5, 468(%zero)
	flw	%f6, 467(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f3, %f1

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f5, %f5, %f1

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f5, %f5, %f2

	nop
	nop
	fmul	%f4, %f3, %f3
	fsub	%f5, %f1, %f5

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f3

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 466(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f2

	nop
	nop
	nop
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 465(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 464(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f2, %f6, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	fsub	%f2, %f5, %f2
	flw	%f5, 463(%zero)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fadd	%f1, %f2, %f1

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

fbgt_cont.22050:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.22051

	nop
	nop
	nop
	jr	%ra

bnei_else.22051:
	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	jr	%ra

fbgt_else.22048:
	nop
	fmul	%f1, %f0, %f0
	flw	%f4, 468(%zero)
	flw	%f5, 467(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f4, %f4, %f1

	nop
	nop
	fsub	%f4, %f0, %f4
	fmul	%f5, %f5, %f0

	nop
	nop
	nop
	fmul	%f5, %f5, %f2

	nop
	nop
	fadd	%f4, %f4, %f5
	flw	%f5, 466(%zero)

	nop
	nop
	nop
	fmul	%f5, %f5, %f0

	nop
	nop
	nop
	fmul	%f5, %f5, %f1

	nop
	nop
	nop
	fmul	%f5, %f5, %f2

	nop
	nop
	fsub	%f4, %f4, %f5
	flw	%f5, 465(%zero)

	nop
	nop
	nop
	fmul	%f5, %f5, %f0

	nop
	nop
	nop
	fmul	%f5, %f5, %f3

	nop
	nop
	fadd	%f4, %f4, %f5
	flw	%f5, 464(%zero)

	nop
	nop
	nop
	fmul	%f5, %f5, %f0

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	fsub	%f1, %f4, %f1
	flw	%f4, 463(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fmul	%f0, %f0, %f3

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	jr	%ra

print_int_sub1.2641:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22052

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22053

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22054

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22055

	nop
	nop
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22056

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22057

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22058

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22059

	nop
	nop
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22060

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22061

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22062

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22063

	nop
	nop
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22064

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22065

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22066

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22067

	nop
	nop
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4

	nop
	nop
	nop
	j	print_int_sub1.2641

bgti_else.22067:
	nop
	nop
	nop
	addi	%v0, %v1, 3

	nop
	nop
	nop
	jr	%ra

bgti_else.22066:
	nop
	nop
	nop
	addi	%v0, %v1, 2

	nop
	nop
	nop
	jr	%ra

bgti_else.22065:
	nop
	nop
	nop
	addi	%v0, %v1, 1

	nop
	nop
	nop
	jr	%ra

bgti_else.22064:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.22063:
	nop
	nop
	nop
	addi	%v0, %v1, 3

	nop
	nop
	nop
	jr	%ra

bgti_else.22062:
	nop
	nop
	nop
	addi	%v0, %v1, 2

	nop
	nop
	nop
	jr	%ra

bgti_else.22061:
	nop
	nop
	nop
	addi	%v0, %v1, 1

	nop
	nop
	nop
	jr	%ra

bgti_else.22060:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.22059:
	nop
	nop
	nop
	addi	%v0, %v1, 3

	nop
	nop
	nop
	jr	%ra

bgti_else.22058:
	nop
	nop
	nop
	addi	%v0, %v1, 2

	nop
	nop
	nop
	jr	%ra

bgti_else.22057:
	nop
	nop
	nop
	addi	%v0, %v1, 1

	nop
	nop
	nop
	jr	%ra

bgti_else.22056:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.22055:
	nop
	nop
	nop
	addi	%v0, %v1, 3

	nop
	nop
	nop
	jr	%ra

bgti_else.22054:
	nop
	nop
	nop
	addi	%v0, %v1, 2

	nop
	nop
	nop
	jr	%ra

bgti_else.22053:
	nop
	nop
	nop
	addi	%v0, %v1, 1

	nop
	nop
	nop
	jr	%ra

bgti_else.22052:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

print_int_sub2.2644:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22068

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22069

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22070

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22071

	nop
	nop
	nop
	addi	%v0, %v0, -40

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22072

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22073

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22074

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22075

	nop
	nop
	nop
	addi	%v0, %v0, -40

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22076

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22077

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22078

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22079

	nop
	nop
	nop
	addi	%v0, %v0, -40

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22080

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22081

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22082

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22083

	nop
	nop
	nop
	addi	%v0, %v0, -40

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22084

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22085

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22086

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22087

	nop
	nop
	nop
	addi	%v0, %v0, -40

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22088

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22089

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22090

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22091

	nop
	nop
	nop
	addi	%v0, %v0, -40

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22092

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22093

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22094

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22095

	nop
	nop
	nop
	addi	%v0, %v0, -40

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22096

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22097

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22098

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22099

	nop
	nop
	nop
	addi	%v0, %v0, -40

	nop
	nop
	nop
	j	print_int_sub2.2644

bgti_else.22099:
	nop
	nop
	nop
	addi	%v0, %v0, -30

	nop
	nop
	nop
	jr	%ra

bgti_else.22098:
	nop
	nop
	nop
	addi	%v0, %v0, -20

	nop
	nop
	nop
	jr	%ra

bgti_else.22097:
	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	jr	%ra

bgti_else.22096:
	nop
	nop
	nop
	jr	%ra

bgti_else.22095:
	nop
	nop
	nop
	addi	%v0, %v0, -30

	nop
	nop
	nop
	jr	%ra

bgti_else.22094:
	nop
	nop
	nop
	addi	%v0, %v0, -20

	nop
	nop
	nop
	jr	%ra

bgti_else.22093:
	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	jr	%ra

bgti_else.22092:
	nop
	nop
	nop
	jr	%ra

bgti_else.22091:
	nop
	nop
	nop
	addi	%v0, %v0, -30

	nop
	nop
	nop
	jr	%ra

bgti_else.22090:
	nop
	nop
	nop
	addi	%v0, %v0, -20

	nop
	nop
	nop
	jr	%ra

bgti_else.22089:
	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	jr	%ra

bgti_else.22088:
	nop
	nop
	nop
	jr	%ra

bgti_else.22087:
	nop
	nop
	nop
	addi	%v0, %v0, -30

	nop
	nop
	nop
	jr	%ra

bgti_else.22086:
	nop
	nop
	nop
	addi	%v0, %v0, -20

	nop
	nop
	nop
	jr	%ra

bgti_else.22085:
	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	jr	%ra

bgti_else.22084:
	nop
	nop
	nop
	jr	%ra

bgti_else.22083:
	nop
	nop
	nop
	addi	%v0, %v0, -30

	nop
	nop
	nop
	jr	%ra

bgti_else.22082:
	nop
	nop
	nop
	addi	%v0, %v0, -20

	nop
	nop
	nop
	jr	%ra

bgti_else.22081:
	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	jr	%ra

bgti_else.22080:
	nop
	nop
	nop
	jr	%ra

bgti_else.22079:
	nop
	nop
	nop
	addi	%v0, %v0, -30

	nop
	nop
	nop
	jr	%ra

bgti_else.22078:
	nop
	nop
	nop
	addi	%v0, %v0, -20

	nop
	nop
	nop
	jr	%ra

bgti_else.22077:
	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	jr	%ra

bgti_else.22076:
	nop
	nop
	nop
	jr	%ra

bgti_else.22075:
	nop
	nop
	nop
	addi	%v0, %v0, -30

	nop
	nop
	nop
	jr	%ra

bgti_else.22074:
	nop
	nop
	nop
	addi	%v0, %v0, -20

	nop
	nop
	nop
	jr	%ra

bgti_else.22073:
	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	jr	%ra

bgti_else.22072:
	nop
	nop
	nop
	jr	%ra

bgti_else.22071:
	nop
	nop
	nop
	addi	%v0, %v0, -30

	nop
	nop
	nop
	jr	%ra

bgti_else.22070:
	nop
	nop
	nop
	addi	%v0, %v0, -20

	nop
	nop
	nop
	jr	%ra

bgti_else.22069:
	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	jr	%ra

bgti_else.22068:
	nop
	nop
	nop
	jr	%ra

print_int.2646:
	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.22983

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.22985

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.22987

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.22989

	nop
	nop
	nop
	addi	%v1, %v0, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.22991

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.22993

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.22995

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.22997

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.22999

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23001

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23003

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23005

	nop
	addi	%v1, %v1, -40
	addi	%a0, %zero, 12
	sw	%ra, 1(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -2

	nop
	nop
	nop
	lw	%ra, 1(%sp)

	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.23005:
	nop
	nop
	nop
	addi	%v0, %zero, 11

bgti_cont.23006:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.23003:
	nop
	nop
	nop
	addi	%v0, %zero, 10

bgti_cont.23004:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.23001:
	nop
	nop
	nop
	addi	%v0, %zero, 9

bgti_cont.23002:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.22999:
	nop
	nop
	nop
	addi	%v0, %zero, 8

bgti_cont.23000:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.22997:
	nop
	nop
	nop
	addi	%v0, %zero, 7

bgti_cont.22998:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.22995:
	nop
	nop
	nop
	addi	%v0, %zero, 6

bgti_cont.22996:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.22993:
	nop
	nop
	nop
	addi	%v0, %zero, 5

bgti_cont.22994:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.22991:
	nop
	nop
	nop
	addi	%v0, %zero, 4

bgti_cont.22992:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.22989:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.22990:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.22987:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.22988:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.22985:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.22986:
	nop
	nop
	nop
	j	bgti_cont.22984

bgti_else.22983:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.22984:
	nop
	nop
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23007

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23009

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23011

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23013

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23015

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23017

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23019

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23021

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23023

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23025

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23027

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23029

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23031

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23033

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23035

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23037

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23039

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23041

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23043

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23045

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23047

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23049

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23051

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23053

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23055

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23057

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23059

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23061

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 2(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -3

	nop
	nop
	nop
	lw	%ra, 2(%sp)

	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23061:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23062:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23059:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23060:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23057:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23058:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23055:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23056:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23053:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23054:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23051:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23052:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23049:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23050:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23047:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23048:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23045:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23046:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23043:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23044:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23041:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23042:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23039:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23040:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23037:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23038:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23035:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23036:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23033:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23034:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23031:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23032:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23029:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23030:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23027:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23028:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23025:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23026:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23023:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23024:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23021:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23022:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23019:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23020:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23017:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23018:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23015:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23016:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23013:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23014:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23011:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23012:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23009:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23010:
	nop
	nop
	nop
	j	bgti_cont.23008

bgti_else.23007:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23008:
	nop
	nop
	nop
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.23063

	nop
	nop
	nop
	addi	%v0, %v0, 48

	nop
	nop
	nop
	j	min_caml_print_char

bgt_else.23063:
	nop
	nop
	nop
	sw	%v0, 2(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23064

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23066

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23068

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23070

	nop
	nop
	nop
	addi	%a0, %v1, -40

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.23072

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.23074

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.23076

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.23078

	nop
	nop
	nop
	addi	%a0, %a0, -40

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.23080

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.23082

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.23084

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.23086

	nop
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	sw	%ra, 3(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23086:
	nop
	nop
	nop
	addi	%v0, %zero, 11

bgti_cont.23087:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23084:
	nop
	nop
	nop
	addi	%v0, %zero, 10

bgti_cont.23085:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23082:
	nop
	nop
	nop
	addi	%v0, %zero, 9

bgti_cont.23083:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23080:
	nop
	nop
	nop
	addi	%v0, %zero, 8

bgti_cont.23081:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23078:
	nop
	nop
	nop
	addi	%v0, %zero, 7

bgti_cont.23079:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23076:
	nop
	nop
	nop
	addi	%v0, %zero, 6

bgti_cont.23077:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23074:
	nop
	nop
	nop
	addi	%v0, %zero, 5

bgti_cont.23075:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23072:
	nop
	nop
	nop
	addi	%v0, %zero, 4

bgti_cont.23073:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23070:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.23071:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23068:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.23069:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23066:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.23067:
	nop
	nop
	nop
	j	bgti_cont.23065

bgti_else.23064:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.23065:
	nop
	nop
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23088

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23090

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23092

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23094

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23096

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23098

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23100

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23102

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23104

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23106

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23108

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23110

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23112

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23114

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23116

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23118

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23120

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23122

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23124

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23126

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23128

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23130

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23132

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23134

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23136

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23138

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23140

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23142

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 4(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23142:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23143:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23140:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23141:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23138:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23139:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23136:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23137:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23134:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23135:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23132:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23133:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23130:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23131:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23128:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23129:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23126:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23127:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23124:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23125:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23122:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23123:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23120:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23121:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23118:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23119:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23116:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23117:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23114:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23115:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23112:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23113:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23110:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23111:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23108:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23109:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23106:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23107:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23104:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23105:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23102:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23103:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23100:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23101:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23098:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23099:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23096:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23097:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23094:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23095:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23092:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23093:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23090:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23091:
	nop
	nop
	nop
	j	bgti_cont.23089

bgti_else.23088:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23089:
	nop
	nop
	nop
	lw	%v1, 3(%sp)

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.23144

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 48

	nop
	nop
	nop
	j	min_caml_print_char

bgt_else.23144:
	nop
	nop
	nop
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23145

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23147

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23149

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23151

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23153

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23155

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23157

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23159

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23161

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23163

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23165

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23167

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23169

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23171

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23173

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23175

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23177

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23179

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23181

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23183

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23185

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23187

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23189

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23191

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.23193

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.23195

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.23197

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.23199

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23199:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23200:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23197:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23198:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23195:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23196:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23193:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23194:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23191:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23192:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23189:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23190:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23187:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23188:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23185:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23186:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23183:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23184:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23181:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23182:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23179:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23180:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23177:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23178:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23175:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23176:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23173:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23174:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23171:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23172:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23169:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23170:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23167:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23168:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23165:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23166:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23163:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23164:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23161:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23162:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23159:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23160:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23157:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23158:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23155:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23156:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23153:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23154:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23151:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.23152:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23149:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.23150:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23147:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.23148:
	nop
	nop
	nop
	j	bgti_cont.23146

bgti_else.23145:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.23146:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 48

	nop
	nop
	nop
	j	min_caml_print_char

read_screen_settings.2775:
	nop
	nop
	nop
	sw	%ra, 0(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -1
	fsw	%f0, 72(%zero)

	nop
	nop
	nop
	lw	%ra, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 0(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -1
	fsw	%f0, 73(%zero)

	nop
	nop
	nop
	lw	%ra, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 0(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -1
	fsw	%f0, 74(%zero)

	nop
	nop
	nop
	lw	%ra, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 0(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	addi	%sp, %sp, -1
	flw	%f1, 461(%zero)
	flw	%f2, 495(%zero)

	nop
	lw	%ra, 0(%sp)
	fmul	%f0, %f0, %f1
	flw	%f4, 494(%zero)

	nop
	nop
	fabs	%f3, %f0
	fsw	%f1, 0(%sp)

	nop
	nop
	nop
	fsw	%f0, 1(%sp)

	nop
	nop
	nop
	fsw	%f2, 2(%sp)

	nop
	nop
	nop
	fsw	%f3, 3(%sp)

	nop
	nop
	nop
	fsw	%f4, 4(%sp)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.23780

	nop
	nop
	nop
	flw	%f5, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23782

	nop
	nop
	nop
	flw	%f5, 492(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23784

	nop
	nop
	nop
	flw	%f5, 491(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23786

	nop
	nop
	nop
	flw	%f5, 490(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23788

	nop
	nop
	nop
	flw	%f5, 489(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23790

	nop
	nop
	nop
	flw	%f5, 488(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23792

	nop
	nop
	nop
	flw	%f5, 487(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23794

	nop
	nop
	nop
	flw	%f5, 486(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23796

	nop
	nop
	nop
	flw	%f5, 485(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23798

	nop
	nop
	nop
	flw	%f5, 484(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23800

	nop
	nop
	nop
	flw	%f5, 483(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23802

	nop
	nop
	nop
	flw	%f5, 482(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.23804

	nop
	flw	%f5, 481(%zero)
	fmov	%f0, %f3
	sw	%ra, 5(%sp)

	nop
	nop
	fmov	%f1, %f5
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23804:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23805:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23802:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23803:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23800:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23801:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23798:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23799:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23796:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23797:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23794:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23795:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23792:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23793:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23790:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23791:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23788:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23789:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23786:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23787:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23784:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23785:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23782:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.23783:
	nop
	nop
	nop
	j	fbgt_cont.23781

fbgt_else.23780:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.23781:
	nop
	nop
	flw	%f1, 3(%sp)
	flw	%f2, 4(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.23806

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.23808

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 5(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	fbgt_cont.23807

fbgt_else.23808:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 5(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 6

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

fbgt_cont.23809:
	nop
	nop
	nop
	j	fbgt_cont.23807

fbgt_else.23806:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.23807:
	nop
	nop
	nop
	flw	%f1, 2(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.23810

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.23811

fbgt_else.23810:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.23811:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.23812

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.23813

fbgt_else.23812:
fbgt_cont.23813:
	nop
	nop
	nop
	flw	%f2, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.23814

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.23816

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.23815

bnei_else.23816:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.23817:
	nop
	nop
	nop
	j	fbgt_cont.23815

fbgt_else.23814:
fbgt_cont.23815:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.23818

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.23819

fbgt_else.23818:
fbgt_cont.23819:
	nop
	nop
	nop
	flw	%f3, 478(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.23820

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.23821

fbgt_else.23820:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.23821:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.23822

	nop
	nop
	nop
	j	bnei_cont.23823

bnei_else.23822:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.23823:
	nop
	nop
	flw	%f4, 470(%zero)
	flw	%f5, 1(%sp)

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.23824

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.23825

fbgt_else.23824:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.23825:
	nop
	fabs	%f5, %f5
	flw	%f6, 4(%sp)
	fsw	%f0, 5(%sp)

	nop
	nop
	nop
	fsw	%f4, 6(%sp)

	nop
	nop
	nop
	fsw	%f3, 7(%sp)

	nop
	nop
	nop
	fsw	%f2, 8(%sp)

	nop
	nop
	nop
	sw	%v0, 9(%sp)

	nop
	nop
	nop
	fsw	%f5, 10(%sp)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.23826

	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23828

	nop
	nop
	nop
	flw	%f7, 492(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23830

	nop
	nop
	nop
	flw	%f7, 491(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23832

	nop
	nop
	nop
	flw	%f7, 490(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23834

	nop
	nop
	nop
	flw	%f7, 489(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23836

	nop
	nop
	nop
	flw	%f7, 488(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23838

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23840

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23842

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23844

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23846

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23848

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.23850

	nop
	flw	%f7, 481(%zero)
	fmov	%f0, %f5
	sw	%ra, 11(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23850:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23851:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23848:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23849:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23846:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23847:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23844:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23845:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23842:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23843:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23840:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23841:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23838:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23839:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23836:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23837:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23834:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23835:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23832:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23833:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23830:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23831:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23828:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23829:
	nop
	nop
	nop
	j	fbgt_cont.23827

fbgt_else.23826:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.23827:
	nop
	nop
	flw	%f1, 10(%sp)
	flw	%f2, 4(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.23852

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.23854

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 11(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	fbgt_cont.23853

fbgt_else.23854:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 11(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 12

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

fbgt_cont.23855:
	nop
	nop
	nop
	j	fbgt_cont.23853

fbgt_else.23852:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.23853:
	nop
	nop
	nop
	flw	%f1, 2(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.23856

	nop
	nop
	nop
	lw	%v0, 9(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.23858

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.23857

bnei_else.23858:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.23859:
	nop
	nop
	nop
	j	fbgt_cont.23857

fbgt_else.23856:
	nop
	nop
	nop
	lw	%v0, 9(%sp)

fbgt_cont.23857:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.23860

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.23861

fbgt_else.23860:
fbgt_cont.23861:
	nop
	nop
	nop
	flw	%f2, 8(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.23862

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.23863

fbgt_else.23862:
fbgt_cont.23863:
	nop
	nop
	nop
	flw	%f3, 7(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.23864

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.23865

fbgt_else.23864:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.23865:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.23866

	nop
	nop
	nop
	j	bnei_cont.23867

bnei_else.23866:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.23867:
	nop
	nop
	nop
	fsw	%f0, 11(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	flw	%f1, 0(%sp)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f2, 4(%sp)

	nop
	nop
	fabs	%f1, %f0
	fsw	%f0, 12(%sp)

	nop
	nop
	nop
	fsw	%f1, 13(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.23868

	nop
	nop
	nop
	flw	%f3, 493(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23870

	nop
	nop
	nop
	flw	%f3, 492(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23872

	nop
	nop
	nop
	flw	%f3, 491(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23874

	nop
	nop
	nop
	flw	%f3, 490(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23876

	nop
	nop
	nop
	flw	%f3, 489(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23878

	nop
	nop
	nop
	flw	%f3, 488(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23880

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23882

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23884

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23886

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23888

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23890

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.23892

	nop
	flw	%f3, 481(%zero)
	fmov	%f0, %f1
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23892:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23893:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23890:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23891:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23888:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23889:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23886:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23887:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23884:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23885:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23882:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23883:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23880:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23881:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23878:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23879:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23876:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23877:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23874:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23875:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23872:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23873:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23870:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.23871:
	nop
	nop
	nop
	j	fbgt_cont.23869

fbgt_else.23868:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.23869:
	nop
	nop
	flw	%f1, 13(%sp)
	flw	%f2, 4(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.23894

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.23896

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 14(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	fbgt_cont.23895

fbgt_else.23896:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 14(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 15

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

fbgt_cont.23897:
	nop
	nop
	nop
	j	fbgt_cont.23895

fbgt_else.23894:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.23895:
	nop
	nop
	nop
	flw	%f1, 2(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.23898

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.23899

fbgt_else.23898:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.23899:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.23900

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.23901

fbgt_else.23900:
fbgt_cont.23901:
	nop
	nop
	nop
	flw	%f2, 8(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.23902

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.23904

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.23903

bnei_else.23904:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.23905:
	nop
	nop
	nop
	j	fbgt_cont.23903

fbgt_else.23902:
fbgt_cont.23903:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.23906

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.23907

fbgt_else.23906:
fbgt_cont.23907:
	nop
	nop
	nop
	flw	%f3, 7(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.23908

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.23909

fbgt_else.23908:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.23909:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.23910

	nop
	nop
	nop
	j	bnei_cont.23911

bnei_else.23910:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.23911:
	nop
	nop
	flw	%f4, 12(%sp)
	flw	%f5, 6(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.23912

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.23913

fbgt_else.23912:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.23913:
	nop
	fabs	%f4, %f4
	flw	%f6, 4(%sp)
	fsw	%f0, 14(%sp)

	nop
	nop
	nop
	sw	%v0, 15(%sp)

	nop
	nop
	nop
	fsw	%f4, 16(%sp)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.23914

	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23916

	nop
	nop
	nop
	flw	%f7, 492(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23918

	nop
	nop
	nop
	flw	%f7, 491(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23920

	nop
	nop
	nop
	flw	%f7, 490(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23922

	nop
	nop
	nop
	flw	%f7, 489(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23924

	nop
	nop
	nop
	flw	%f7, 488(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23926

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23928

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23930

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23932

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23934

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23936

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.23938

	nop
	flw	%f7, 481(%zero)
	fmov	%f0, %f4
	sw	%ra, 17(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	nop
	lw	%ra, 17(%sp)

	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23938:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23939:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23936:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23937:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23934:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23935:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23932:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23933:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23930:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23931:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23928:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23929:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23926:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23927:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23924:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23925:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23922:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23923:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23920:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23921:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23918:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23919:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23916:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.23917:
	nop
	nop
	nop
	j	fbgt_cont.23915

fbgt_else.23914:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.23915:
	nop
	nop
	flw	%f1, 16(%sp)
	flw	%f2, 4(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.23940

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.23942

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 17(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	nop
	lw	%ra, 17(%sp)

	nop
	nop
	nop
	j	fbgt_cont.23941

fbgt_else.23942:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 17(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 18

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	nop
	lw	%ra, 17(%sp)

fbgt_cont.23943:
	nop
	nop
	nop
	j	fbgt_cont.23941

fbgt_else.23940:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.23941:
	nop
	nop
	nop
	flw	%f1, 2(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.23944

	nop
	nop
	nop
	lw	%v0, 15(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.23946

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.23945

bnei_else.23946:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.23947:
	nop
	nop
	nop
	j	fbgt_cont.23945

fbgt_else.23944:
	nop
	nop
	nop
	lw	%v0, 15(%sp)

fbgt_cont.23945:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.23948

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.23949

fbgt_else.23948:
fbgt_cont.23949:
	nop
	nop
	nop
	flw	%f2, 8(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.23950

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.23951

fbgt_else.23950:
fbgt_cont.23951:
	nop
	nop
	nop
	flw	%f1, 7(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.23952

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.23953

fbgt_else.23952:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.23953:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.23954

	nop
	nop
	nop
	j	bnei_cont.23955

bnei_else.23954:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.23955:
	nop
	nop
	flw	%f1, 5(%sp)
	flw	%f3, 460(%zero)

	nop
	nop
	fmul	%f2, %f1, %f0
	flw	%f4, 11(%sp)

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	nop
	fsw	%f2, 171(%zero)

	nop
	nop
	nop
	flw	%f2, 459(%zero)

	nop
	nop
	nop
	fmul	%f2, %f4, %f2

	nop
	nop
	fsw	%f2, 172(%zero)
	flw	%f2, 14(%sp)

	nop
	nop
	nop
	fmul	%f5, %f1, %f2

	nop
	nop
	nop
	fmul	%f3, %f5, %f3

	nop
	nop
	fsw	%f3, 173(%zero)
	flw	%f3, 6(%sp)

	nop
	nop
	nop
	fsw	%f2, 165(%zero)

	nop
	nop
	fsw	%f3, 166(%zero)
	fneg	%f3, %f0

	nop
	nop
	fsw	%f3, 167(%zero)
	fneg	%f3, %f4

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	fsw	%f0, 168(%zero)
	fneg	%f0, %f1

	nop
	nop
	fsw	%f0, 169(%zero)
	fneg	%f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsw	%f0, 170(%zero)

	nop
	nop
	flw	%f0, 72(%zero)
	flw	%f1, 171(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 75(%zero)

	nop
	nop
	flw	%f0, 73(%zero)
	flw	%f1, 172(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 76(%zero)

	nop
	nop
	flw	%f0, 74(%zero)
	flw	%f1, 173(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 77(%zero)

	nop
	nop
	nop
	jr	%ra

rotate_quadratic_matrix.2779:
	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 495(%zero)

	nop
	fabs	%f2, %f0
	flw	%f3, 494(%zero)
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	fsw	%f0, 2(%sp)

	nop
	nop
	nop
	fsw	%f1, 3(%sp)

	nop
	nop
	nop
	fsw	%f2, 4(%sp)

	nop
	nop
	nop
	fsw	%f3, 5(%sp)

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.25080

	nop
	nop
	nop
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25082

	nop
	nop
	nop
	flw	%f4, 492(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25084

	nop
	nop
	nop
	flw	%f4, 491(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25086

	nop
	nop
	nop
	flw	%f4, 490(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25088

	nop
	nop
	nop
	flw	%f4, 489(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25090

	nop
	nop
	nop
	flw	%f4, 488(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25092

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25094

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25096

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25098

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25100

	nop
	nop
	nop
	flw	%f4, 483(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25102

	nop
	nop
	nop
	flw	%f4, 482(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.25104

	nop
	flw	%f4, 481(%zero)
	fmov	%f0, %f2
	sw	%ra, 6(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25104:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25105:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25102:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25103:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25100:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25101:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25098:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25099:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25096:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25097:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25094:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25095:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25092:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25093:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25090:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25091:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25088:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25089:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25086:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25087:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25084:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25085:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25082:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.25083:
	nop
	nop
	nop
	j	fbgt_cont.25081

fbgt_else.25080:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.25081:
	nop
	nop
	flw	%f1, 4(%sp)
	flw	%f2, 5(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.25106

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25108

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 6(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25107

fbgt_else.25108:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 6(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 7

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

fbgt_cont.25109:
	nop
	nop
	nop
	j	fbgt_cont.25107

fbgt_else.25106:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.25107:
	nop
	nop
	nop
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25110

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25111

fbgt_else.25110:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25111:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25112

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.25113

fbgt_else.25112:
fbgt_cont.25113:
	nop
	nop
	nop
	flw	%f2, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.25114

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25116

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25115

bnei_else.25116:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.25117:
	nop
	nop
	nop
	j	fbgt_cont.25115

fbgt_else.25114:
fbgt_cont.25115:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.25118

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.25119

fbgt_else.25118:
fbgt_cont.25119:
	nop
	nop
	nop
	flw	%f3, 478(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.25120

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.25121

fbgt_else.25120:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.25121:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25122

	nop
	nop
	nop
	j	bnei_cont.25123

bnei_else.25122:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.25123:
	nop
	nop
	flw	%f4, 470(%zero)
	flw	%f5, 2(%sp)

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.25124

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.25125

fbgt_else.25124:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.25125:
	nop
	fabs	%f5, %f5
	flw	%f6, 5(%sp)
	fsw	%f0, 6(%sp)

	nop
	nop
	nop
	fsw	%f4, 7(%sp)

	nop
	nop
	nop
	fsw	%f3, 8(%sp)

	nop
	nop
	nop
	fsw	%f2, 9(%sp)

	nop
	nop
	nop
	sw	%v0, 10(%sp)

	nop
	nop
	nop
	fsw	%f5, 11(%sp)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.25126

	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25128

	nop
	nop
	nop
	flw	%f7, 492(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25130

	nop
	nop
	nop
	flw	%f7, 491(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25132

	nop
	nop
	nop
	flw	%f7, 490(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25134

	nop
	nop
	nop
	flw	%f7, 489(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25136

	nop
	nop
	nop
	flw	%f7, 488(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25138

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25140

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25142

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25144

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25146

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25148

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25150

	nop
	flw	%f7, 481(%zero)
	fmov	%f0, %f5
	sw	%ra, 12(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25150:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25151:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25148:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25149:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25146:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25147:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25144:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25145:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25142:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25143:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25140:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25141:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25138:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25139:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25136:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25137:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25134:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25135:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25132:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25133:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25130:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25131:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25128:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25129:
	nop
	nop
	nop
	j	fbgt_cont.25127

fbgt_else.25126:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25127:
	nop
	nop
	flw	%f1, 11(%sp)
	flw	%f2, 5(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.25152

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25154

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 12(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25153

fbgt_else.25154:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 12(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 13

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

fbgt_cont.25155:
	nop
	nop
	nop
	j	fbgt_cont.25153

fbgt_else.25152:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.25153:
	nop
	nop
	nop
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25156

	nop
	nop
	nop
	lw	%v0, 10(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25158

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25157

bnei_else.25158:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.25159:
	nop
	nop
	nop
	j	fbgt_cont.25157

fbgt_else.25156:
	nop
	nop
	nop
	lw	%v0, 10(%sp)

fbgt_cont.25157:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25160

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.25161

fbgt_else.25160:
fbgt_cont.25161:
	nop
	nop
	nop
	flw	%f2, 9(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.25162

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.25163

fbgt_else.25162:
fbgt_cont.25163:
	nop
	nop
	nop
	flw	%f3, 8(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.25164

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.25165

fbgt_else.25164:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.25165:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25166

	nop
	nop
	nop
	j	bnei_cont.25167

bnei_else.25166:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.25167:
	nop
	nop
	lw	%v0, 1(%sp)
	flw	%f6, 5(%sp)

	nop
	nop
	flw	%f4, 1(%v0)
	fsw	%f0, 12(%sp)

	nop
	nop
	fabs	%f5, %f4
	fsw	%f4, 13(%sp)

	nop
	nop
	nop
	fsw	%f5, 14(%sp)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.25168

	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25170

	nop
	nop
	nop
	flw	%f7, 492(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25172

	nop
	nop
	nop
	flw	%f7, 491(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25174

	nop
	nop
	nop
	flw	%f7, 490(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25176

	nop
	nop
	nop
	flw	%f7, 489(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25178

	nop
	nop
	nop
	flw	%f7, 488(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25180

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25182

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25184

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25186

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25188

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25190

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25192

	nop
	flw	%f7, 481(%zero)
	fmov	%f0, %f5
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25192:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25193:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25190:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25191:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25188:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25189:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25186:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25187:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25184:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25185:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25182:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25183:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25180:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25181:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25178:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25179:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25176:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25177:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25174:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25175:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25172:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25173:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25170:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25171:
	nop
	nop
	nop
	j	fbgt_cont.25169

fbgt_else.25168:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25169:
	nop
	nop
	flw	%f1, 14(%sp)
	flw	%f2, 5(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.25194

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25196

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 15(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25195

fbgt_else.25196:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 15(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 16

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

fbgt_cont.25197:
	nop
	nop
	nop
	j	fbgt_cont.25195

fbgt_else.25194:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.25195:
	nop
	nop
	nop
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25198

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25199

fbgt_else.25198:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25199:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25200

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.25201

fbgt_else.25200:
fbgt_cont.25201:
	nop
	nop
	nop
	flw	%f2, 9(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.25202

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25204

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25203

bnei_else.25204:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.25205:
	nop
	nop
	nop
	j	fbgt_cont.25203

fbgt_else.25202:
fbgt_cont.25203:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.25206

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.25207

fbgt_else.25206:
fbgt_cont.25207:
	nop
	nop
	nop
	flw	%f3, 8(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.25208

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.25209

fbgt_else.25208:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.25209:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25210

	nop
	nop
	nop
	j	bnei_cont.25211

bnei_else.25210:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.25211:
	nop
	nop
	flw	%f4, 13(%sp)
	flw	%f5, 7(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.25212

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.25213

fbgt_else.25212:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.25213:
	nop
	fabs	%f4, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 15(%sp)

	nop
	nop
	nop
	sw	%v0, 16(%sp)

	nop
	nop
	nop
	fsw	%f4, 17(%sp)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25214

	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25216

	nop
	nop
	nop
	flw	%f7, 492(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25218

	nop
	nop
	nop
	flw	%f7, 491(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25220

	nop
	nop
	nop
	flw	%f7, 490(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25222

	nop
	nop
	nop
	flw	%f7, 489(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25224

	nop
	nop
	nop
	flw	%f7, 488(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25226

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25228

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25230

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25232

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25234

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25236

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.25238

	nop
	flw	%f7, 481(%zero)
	fmov	%f0, %f4
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25238:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25239:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25236:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25237:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25234:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25235:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25232:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25233:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25230:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25231:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25228:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25229:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25226:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25227:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25224:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25225:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25222:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25223:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25220:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25221:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25218:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25219:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25216:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25217:
	nop
	nop
	nop
	j	fbgt_cont.25215

fbgt_else.25214:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25215:
	nop
	nop
	flw	%f1, 17(%sp)
	flw	%f2, 5(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.25240

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25242

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 18(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25241

fbgt_else.25242:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 18(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 19

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

fbgt_cont.25243:
	nop
	nop
	nop
	j	fbgt_cont.25241

fbgt_else.25240:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.25241:
	nop
	nop
	nop
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25244

	nop
	nop
	nop
	lw	%v0, 16(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25246

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25245

bnei_else.25246:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.25247:
	nop
	nop
	nop
	j	fbgt_cont.25245

fbgt_else.25244:
	nop
	nop
	nop
	lw	%v0, 16(%sp)

fbgt_cont.25245:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25248

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.25249

fbgt_else.25248:
fbgt_cont.25249:
	nop
	nop
	nop
	flw	%f2, 9(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.25250

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.25251

fbgt_else.25250:
fbgt_cont.25251:
	nop
	nop
	nop
	flw	%f3, 8(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.25252

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.25253

fbgt_else.25252:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.25253:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25254

	nop
	nop
	nop
	j	bnei_cont.25255

bnei_else.25254:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.25255:
	nop
	nop
	lw	%v0, 1(%sp)
	flw	%f6, 5(%sp)

	nop
	nop
	flw	%f4, 2(%v0)
	fsw	%f0, 18(%sp)

	nop
	nop
	fabs	%f5, %f4
	fsw	%f4, 19(%sp)

	nop
	nop
	nop
	fsw	%f5, 20(%sp)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.25256

	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25258

	nop
	nop
	nop
	flw	%f7, 492(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25260

	nop
	nop
	nop
	flw	%f7, 491(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25262

	nop
	nop
	nop
	flw	%f7, 490(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25264

	nop
	nop
	nop
	flw	%f7, 489(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25266

	nop
	nop
	nop
	flw	%f7, 488(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25268

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25270

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25272

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25274

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25276

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25278

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.25280

	nop
	flw	%f7, 481(%zero)
	fmov	%f0, %f5
	sw	%ra, 21(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25280:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25281:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25278:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25279:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25276:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25277:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25274:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25275:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25272:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25273:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25270:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25271:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25268:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25269:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25266:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25267:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25264:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25265:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25262:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25263:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25260:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25261:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25258:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.25259:
	nop
	nop
	nop
	j	fbgt_cont.25257

fbgt_else.25256:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25257:
	nop
	nop
	flw	%f1, 20(%sp)
	flw	%f2, 5(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.25282

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25284

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 21(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25283

fbgt_else.25284:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 21(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 22

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

fbgt_cont.25285:
	nop
	nop
	nop
	j	fbgt_cont.25283

fbgt_else.25282:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.25283:
	nop
	nop
	nop
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25286

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25287

fbgt_else.25286:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25287:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25288

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.25289

fbgt_else.25288:
fbgt_cont.25289:
	nop
	nop
	nop
	flw	%f2, 9(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.25290

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25292

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25291

bnei_else.25292:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.25293:
	nop
	nop
	nop
	j	fbgt_cont.25291

fbgt_else.25290:
fbgt_cont.25291:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.25294

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.25295

fbgt_else.25294:
fbgt_cont.25295:
	nop
	nop
	nop
	flw	%f3, 8(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.25296

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.25297

fbgt_else.25296:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.25297:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25298

	nop
	nop
	nop
	j	bnei_cont.25299

bnei_else.25298:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.25299:
	nop
	nop
	flw	%f4, 19(%sp)
	flw	%f5, 7(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.25300

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.25301

fbgt_else.25300:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.25301:
	nop
	fabs	%f4, %f4
	flw	%f5, 5(%sp)
	fsw	%f0, 21(%sp)

	nop
	nop
	nop
	sw	%v0, 22(%sp)

	nop
	nop
	nop
	fsw	%f4, 23(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.25302

	nop
	nop
	nop
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25304

	nop
	nop
	nop
	flw	%f6, 492(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25306

	nop
	nop
	nop
	flw	%f6, 491(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25308

	nop
	nop
	nop
	flw	%f6, 490(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25310

	nop
	nop
	nop
	flw	%f6, 489(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25312

	nop
	nop
	nop
	flw	%f6, 488(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25314

	nop
	nop
	nop
	flw	%f6, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25316

	nop
	nop
	nop
	flw	%f6, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25318

	nop
	nop
	nop
	flw	%f6, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25320

	nop
	nop
	nop
	flw	%f6, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25322

	nop
	nop
	nop
	flw	%f6, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25324

	nop
	nop
	nop
	flw	%f6, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.25326

	nop
	flw	%f6, 481(%zero)
	fmov	%f0, %f4
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25326:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25327:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25324:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25325:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25322:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25323:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25320:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25321:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25318:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25319:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25316:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25317:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25314:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25315:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25312:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25313:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25310:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25311:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25308:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25309:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25306:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25307:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25304:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.25305:
	nop
	nop
	nop
	j	fbgt_cont.25303

fbgt_else.25302:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.25303:
	nop
	nop
	flw	%f1, 23(%sp)
	flw	%f2, 5(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.25328

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25330

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 24(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	fbgt_cont.25329

fbgt_else.25330:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 24(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 25

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

fbgt_cont.25331:
	nop
	nop
	nop
	j	fbgt_cont.25329

fbgt_else.25328:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.25329:
	nop
	nop
	nop
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25332

	nop
	nop
	nop
	lw	%v0, 22(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25334

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25333

bnei_else.25334:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.25335:
	nop
	nop
	nop
	j	fbgt_cont.25333

fbgt_else.25332:
	nop
	nop
	nop
	lw	%v0, 22(%sp)

fbgt_cont.25333:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25336

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.25337

fbgt_else.25336:
fbgt_cont.25337:
	nop
	nop
	nop
	flw	%f2, 9(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.25338

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.25339

fbgt_else.25338:
fbgt_cont.25339:
	nop
	nop
	nop
	flw	%f1, 8(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25340

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.25341

fbgt_else.25340:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.25341:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25342

	nop
	nop
	nop
	j	bnei_cont.25343

bnei_else.25342:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.25343:
	nop
	nop
	flw	%f1, 21(%sp)
	flw	%f2, 15(%sp)

	nop
	fmul	%f3, %f2, %f1
	flw	%f4, 18(%sp)
	flw	%f5, 12(%sp)

	fmul	%f6, %f5, %f4
	flw	%f8, 6(%sp)
	fmul	%f11, %f5, %f0
	lw	%v0, 0(%sp)

	nop
	nop
	fmul	%f7, %f6, %f1
	fmul	%f9, %f8, %f0

	nop
	nop
	fsub	%f7, %f7, %f9
	fmul	%f9, %f8, %f4

	nop
	nop
	fmul	%f10, %f9, %f1
	fmul	%f6, %f6, %f0

	nop
	nop
	fadd	%f10, %f10, %f11
	fmul	%f11, %f2, %f0

	nop
	fmul	%f12, %f8, %f1
	fmul	%f0, %f9, %f0
	flw	%f9, 2(%v0)

	nop
	nop
	fadd	%f6, %f6, %f12
	fmul	%f1, %f5, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4

	fmul	%f4, %f5, %f2
	fmul	%f2, %f8, %f2
	flw	%f5, 0(%v0)
	flw	%f8, 1(%v0)

	nop
	nop
	fmul	%f12, %f3, %f3
	fmul	%f13, %f11, %f11

	nop
	nop
	fmul	%f12, %f5, %f12
	fmul	%f13, %f8, %f13

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f1, %f1

	nop
	nop
	fmul	%f13, %f9, %f13
	fmul	%f14, %f8, %f6

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f6, %f6

	nop
	fsw	%f12, 0(%v0)
	fmul	%f12, %f7, %f7
	fmul	%f13, %f8, %f13

	nop
	nop
	fmul	%f12, %f5, %f12
	fmul	%f14, %f14, %f0

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f4, %f4

	nop
	nop
	fmul	%f13, %f9, %f13
	fmul	%f3, %f5, %f3

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f0, %f0

	nop
	fsw	%f12, 1(%v0)
	fmul	%f12, %f10, %f10
	fmul	%f13, %f8, %f13

	nop
	nop
	fmul	%f12, %f5, %f12
	fmul	%f8, %f8, %f11

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f2, %f2

	nop
	nop
	fmul	%f13, %f9, %f13
	fmul	%f0, %f8, %f0

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f5, %f7

	fsw	%f12, 2(%v0)
	flw	%f12, 496(%zero)
	fmul	%f13, %f13, %f10
	fmul	%f5, %f3, %f10

	nop
	fadd	%f13, %f13, %f14
	fmul	%f14, %f9, %f4
	lw	%v0, 1(%sp)

	nop
	nop
	fmul	%f14, %f14, %f2
	fadd	%f0, %f5, %f0

	nop
	nop
	fadd	%f13, %f13, %f14
	fmul	%f1, %f9, %f1

	nop
	nop
	fmul	%f13, %f12, %f13
	fmul	%f2, %f1, %f2

	nop
	fsw	%f13, 0(%v0)
	fadd	%f0, %f0, %f2
	fmul	%f2, %f8, %f6

	nop
	nop
	fmul	%f0, %f12, %f0
	fmul	%f1, %f1, %f4

	nop
	nop
	fsw	%f0, 1(%v0)
	fmul	%f0, %f3, %f7

	nop
	nop
	nop
	fadd	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f12, %f0

	nop
	nop
	nop
	fsw	%f0, 2(%v0)

	nop
	nop
	nop
	jr	%ra

read_nth_object.2782:
	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 1(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -2

	nop
	nop
	nop
	lw	%ra, 1(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25391

	nop
	nop
	nop
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 2(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -3

	nop
	nop
	lw	%ra, 2(%sp)
	sw	%v0, 2(%sp)

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
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	lw	%ra, 3(%sp)
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	addi	%sp, %sp, -5
	addi	%v1, %zero, 3
	flw	%f0, 470(%zero)

	nop
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	fsw	%f0, 5(%sp)

	nop
	nop
	nop
	sw	%v1, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	sw	%v0, 7(%sp)

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
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v1, %zero, 2

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	sw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	flw	%f0, 5(%sp)

	nop
	nop
	lw	%v1, 6(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	sw	%v0, 9(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	flw	%f1, 5(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25392

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25393

fbgt_else.25392:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25393:
	nop
	lw	%v1, 8(%sp)
	sw	%v0, 10(%sp)
	fmov	%f0, %f1

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	sw	%v0, 11(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	flw	%f0, 5(%sp)

	nop
	nop
	lw	%v1, 6(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	sw	%v0, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	flw	%f0, 5(%sp)

	nop
	nop
	lw	%v1, 6(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25394

	nop
	nop
	nop
	sw	%v0, 13(%sp)

	nop
	nop
	nop
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -15
	flw	%f1, 461(%zero)

	nop
	lw	%ra, 14(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	fsw	%f1, 14(%sp)

	nop
	nop
	nop
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)

	nop
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)

	nop
	nop
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	fsw	%f0, 2(%v0)

	nop
	nop
	nop
	j	bnei_cont.25395

bnei_else.25394:
bnei_cont.25395:
	nop
	nop
	nop
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.25396

	nop
	nop
	nop
	lw	%a0, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.25397

bnei_else.25396:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.25397:
	nop
	addi	%a1, %zero, 4
	flw	%f0, 5(%sp)
	sw	%a0, 15(%sp)

	nop
	nop
	sw	%v0, 13(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -17
	add	%v1, %zero, %hp

	nop
	lw	%ra, 16(%sp)
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)

	nop
	nop
	lw	%v0, 13(%sp)
	lw	%a0, 12(%sp)

	nop
	nop
	sw	%v0, 9(%v1)
	lw	%a1, 4(%sp)

	nop
	nop
	sw	%a0, 8(%v1)
	lw	%a0, 11(%sp)

	nop
	nop
	sw	%a0, 7(%v1)
	lw	%a0, 15(%sp)

	nop
	nop
	sw	%a0, 6(%v1)
	lw	%a0, 9(%sp)

	nop
	nop
	sw	%a0, 5(%v1)
	lw	%a0, 7(%sp)

	nop
	nop
	sw	%a0, 4(%v1)
	lw	%a2, 3(%sp)

	nop
	nop
	sw	%a1, 3(%v1)
	lw	%a3, 1(%sp)

	nop
	nop
	sw	%a2, 2(%v1)
	lw	%a2, 2(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%v1)

	nop
	nop
	sw	%a3, 0(%v1)
	lw	%a3, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 12(%a3)

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.25398

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.25400

	nop
	nop
	nop
	j	bnei_cont.25399

bnei_else.25400:
	nop
	nop
	nop
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25402

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25403

bnei_else.25402:
	nop
	nop
	nop
	addi	%v1, %zero, 1

bnei_cont.25403:
	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a0)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%a0)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 5(%sp)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.25404

	nop
	nop
	nop
	addi	%a2, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25405

fbeq_else.25404:
	nop
	nop
	nop
	addi	%a2, %zero, 0

fbeq_cont.25405:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.25406

	nop
	nop
	nop
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.25407

bnei_else.25406:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25408

	nop
	nop
	nop
	flw	%f4, 458(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f4, %f1

	nop
	nop
	nop
	j	bnei_cont.25409

bnei_else.25408:
	nop
	nop
	nop
	flw	%f4, 474(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f4, %f1

bnei_cont.25409:
bnei_cont.25407:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 2(%a0)

bnei_cont.25401:
	nop
	nop
	nop
	j	bnei_cont.25399

bnei_else.25398:
	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.25410

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25411

fbeq_else.25410:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25411:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25412

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.25413

bnei_else.25412:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.25414

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25415

fbeq_else.25414:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25415:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25416

	nop
	nop
	nop
	fmov	%f2, %f1

	nop
	nop
	nop
	j	bnei_cont.25417

bnei_else.25416:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25418

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25419

fbgt_else.25418:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25419:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25420

	nop
	nop
	nop
	flw	%f2, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.25421

bnei_else.25420:
	nop
	nop
	nop
	flw	%f2, 458(%zero)

bnei_cont.25421:
bnei_cont.25417:
	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

bnei_cont.25413:
	nop
	nop
	nop
	fsw	%f0, 0(%a0)

	nop
	nop
	nop
	flw	%f0, 1(%a0)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.25422

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25423

fbeq_else.25422:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25423:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25424

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.25425

bnei_else.25424:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.25426

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25427

fbeq_else.25426:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25427:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25428

	nop
	nop
	nop
	fmov	%f2, %f1

	nop
	nop
	nop
	j	bnei_cont.25429

bnei_else.25428:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25430

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25431

fbgt_else.25430:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25431:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25432

	nop
	nop
	nop
	flw	%f2, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.25433

bnei_else.25432:
	nop
	nop
	nop
	flw	%f2, 458(%zero)

bnei_cont.25433:
bnei_cont.25429:
	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

bnei_cont.25425:
	nop
	nop
	nop
	fsw	%f0, 1(%a0)

	nop
	nop
	nop
	flw	%f0, 2(%a0)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.25434

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25435

fbeq_else.25434:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25435:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25436

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.25437

bnei_else.25436:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.25438

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25439

fbeq_else.25438:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25439:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25440

	nop
	nop
	nop
	j	bnei_cont.25441

bnei_else.25440:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25442

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25443

fbgt_else.25442:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25443:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25444

	nop
	nop
	nop
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.25445

bnei_else.25444:
	nop
	nop
	nop
	flw	%f1, 458(%zero)

bnei_cont.25445:
bnei_cont.25441:
	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

bnei_cont.25437:
	nop
	nop
	nop
	fsw	%f0, 2(%a0)

bnei_cont.25399:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25446

	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	rotate_quadratic_matrix.2779

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bnei_cont.25447

bnei_else.25446:
bnei_cont.25447:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25391:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

read_object.2784:
	nop
	nop
	nop
	blti	%v0, 60, bgti_else.25457

	nop
	nop
	nop
	jr	%ra

bgti_else.25457:
	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 1(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -2

	nop
	nop
	nop
	lw	%ra, 1(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25459

	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.25460

	nop
	nop
	nop
	jr	%ra

bgti_else.25460:
	nop
	nop
	nop
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 2(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -3

	nop
	nop
	nop
	lw	%ra, 2(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25462

	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.25463

	nop
	nop
	nop
	jr	%ra

bgti_else.25463:
	nop
	nop
	nop
	sw	%v0, 2(%sp)

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
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25465

	nop
	nop
	nop
	lw	%v0, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.25466

	nop
	nop
	nop
	jr	%ra

bgti_else.25466:
	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25468

	nop
	nop
	nop
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.25469

	nop
	nop
	nop
	jr	%ra

bgti_else.25469:
	nop
	nop
	nop
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25471

	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.25472

	nop
	nop
	nop
	jr	%ra

bgti_else.25472:
	nop
	nop
	nop
	sw	%v0, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25474

	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.25475

	nop
	nop
	nop
	jr	%ra

bgti_else.25475:
	nop
	nop
	nop
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25477

	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.25478

	nop
	nop
	nop
	jr	%ra

bgti_else.25478:
	nop
	nop
	nop
	sw	%v0, 7(%sp)

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
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25480

	nop
	nop
	nop
	lw	%v0, 7(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	read_object.2784

bnei_else.25480:
	nop
	nop
	nop
	lw	%v0, 7(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.25477:
	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.25474:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.25471:
	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.25468:
	nop
	nop
	nop
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.25465:
	nop
	nop
	nop
	lw	%v0, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.25462:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.25459:
	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

read_net_item.2788:
	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 1(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %zero, -1

	nop
	nop
	nop
	lw	%ra, 1(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25502

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%v0, 1(%sp)

	nop
	nop
	addi	%a1, %a0, 1
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%a1, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25503

	nop
	nop
	lw	%v1, 3(%sp)
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	addi	%a0, %v1, 1

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
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25505

	nop
	nop
	lw	%v1, 5(%sp)
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	addi	%a0, %v1, 1

	nop
	nop
	nop
	sw	%a0, 7(%sp)

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
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25507

	nop
	nop
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)

	nop
	nop
	addi	%a0, %v1, 1
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)

	nop
	nop
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.25508

bnei_else.25507:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.25508:
	nop
	nop
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.25506

bnei_else.25505:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.25506:
	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.25504

bnei_else.25503:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.25504:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	jr	%ra

bnei_else.25502:
	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	min_caml_create_array

read_or_network.2790:
	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 1(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %zero, -1

	nop
	nop
	lw	%ra, 1(%sp)
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25526

	nop
	nop
	nop
	sw	%v0, 2(%sp)

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
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25528

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25530

	nop
	nop
	addi	%v1, %zero, 3
	sw	%v0, 4(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%v0)

	nop
	nop
	nop
	j	bnei_cont.25531

bnei_else.25530:
	nop
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

bnei_cont.25531:
	nop
	nop
	nop
	lw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.25529

bnei_else.25528:
	nop
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

bnei_cont.25529:
	nop
	nop
	nop
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	add	%v1, %zero, %v0

	nop
	nop
	nop
	j	bnei_cont.25527

bnei_else.25526:
	nop
	nop
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %v0, 0

	nop
	nop
	nop
	lw	%ra, 5(%sp)

bnei_cont.25527:
	nop
	nop
	nop
	lw	%v0, 0(%v1)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25532

	nop
	addi	%v0, %zero, 1
	lw	%a0, 0(%sp)
	sw	%v1, 5(%sp)

	nop
	nop
	nop
	addi	%a1, %a0, 1

	nop
	nop
	nop
	sw	%a1, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 7(%sp)

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
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25533

	nop
	nop
	nop
	sw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25535

	nop
	nop
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.25536

bnei_else.25535:
	nop
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.25536:
	nop
	nop
	nop
	lw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	add	%v1, %zero, %v0

	nop
	nop
	nop
	j	bnei_cont.25534

bnei_else.25533:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.25534:
	nop
	nop
	nop
	lw	%v0, 0(%v1)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25537

	nop
	nop
	lw	%v0, 6(%sp)
	sw	%v1, 10(%sp)

	nop
	nop
	addi	%a0, %v0, 1
	sw	%ra, 11(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	read_or_network.2790

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 10(%sp)
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.25538

bnei_else.25537:
	nop
	nop
	lw	%v0, 6(%sp)
	sw	%ra, 11(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

bnei_cont.25538:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	jr	%ra

bnei_else.25532:
	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	min_caml_create_array

read_and_network.2792:
	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	sw	%v1, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 2(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %zero, -1

	nop
	nop
	lw	%ra, 2(%sp)
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25560

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25562

	nop
	nop
	nop
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25564

	nop
	nop
	addi	%v1, %zero, 3
	sw	%v0, 5(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%v0)

	nop
	nop
	nop
	j	bnei_cont.25565

bnei_else.25564:
	nop
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

bnei_cont.25565:
	nop
	nop
	nop
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.25563

bnei_else.25562:
	nop
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

bnei_cont.25563:
	nop
	nop
	nop
	lw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	j	bnei_cont.25561

bnei_else.25560:
	nop
	nop
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

bnei_cont.25561:
	nop
	nop
	nop
	lw	%v1, 0(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.25566

	nop
	nop
	nop
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 83(%v1)
	addi	%v0, %zero, 1

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	sw	%v1, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 7(%sp)

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
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25567

	nop
	nop
	nop
	sw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25569

	nop
	nop
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.25570

bnei_else.25569:
	nop
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.25570:
	nop
	nop
	nop
	lw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	j	bnei_cont.25568

bnei_else.25567:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.25568:
	nop
	nop
	nop
	lw	%v1, 0(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.25571

	nop
	nop
	nop
	lw	%v1, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 83(%v1)

	nop
	nop
	nop
	addi	%v0, %v1, 1

	nop
	nop
	nop
	sw	%v0, 10(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.25572

	nop
	nop
	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	j	bnei_cont.25573

bnei_else.25572:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

bnei_cont.25573:
	nop
	nop
	nop
	lw	%v1, 0(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.25574

	nop
	nop
	nop
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	sw	%v0, 83(%v1)

	nop
	nop
	addi	%v0, %v1, 1
	lw	%v1, 0(%sp)

	nop
	nop
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	addi	%sp, %sp, -14
	lw	%v1, 0(%v0)

	nop
	nop
	nop
	lw	%ra, 13(%sp)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.25575

	nop
	nop
	nop
	lw	%v1, 12(%sp)

	nop
	nop
	nop
	sw	%v0, 83(%v1)

	nop
	nop
	nop
	addi	%v0, %v1, 1

	nop
	nop
	nop
	j	read_and_network.2792

bnei_else.25575:
	nop
	nop
	nop
	jr	%ra

bnei_else.25574:
	nop
	nop
	nop
	jr	%ra

bnei_else.25571:
	nop
	nop
	nop
	jr	%ra

bnei_else.25566:
	nop
	nop
	nop
	jr	%ra

solver_rect.2805:
	nop
	nop
	flw	%f3, 0(%v1)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.25580

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25581

fbeq_else.25580:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.25581:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25582

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25583

bnei_else.25582:
	nop
	nop
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.25584

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25585

fbgt_else.25584:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.25585:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25586

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.25588

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25587

bnei_else.25588:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.25589:
	nop
	nop
	nop
	j	bnei_cont.25587

bnei_else.25586:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.25587:
	nop
	nop
	nop
	flw	%f5, 0(%a0)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25590

	nop
	nop
	nop
	j	bnei_cont.25591

bnei_else.25590:
	nop
	nop
	nop
	fneg	%f5, %f5

bnei_cont.25591:
	nop
	fsub	%f5, %f5, %f0
	flw	%f6, 1(%v1)
	flw	%f7, 1(%a0)

	nop
	nop
	nop
	fdiv	%f5, %f5, %f3

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	nop
	fadd	%f6, %f6, %f1

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.25592

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25593

fbgt_else.25592:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25593:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25594

	nop
	nop
	flw	%f6, 2(%v1)
	flw	%f7, 2(%a0)

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	nop
	fadd	%f6, %f6, %f2

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.25596

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25597

fbgt_else.25596:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.25597:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25598

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.25595

bnei_else.25598:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.25599:
	nop
	nop
	nop
	j	bnei_cont.25595

bnei_else.25594:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.25595:
bnei_cont.25583:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25600

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25600:
	nop
	nop
	nop
	flw	%f5, 1(%v1)

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.25601

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25602

fbeq_else.25601:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.25602:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25603

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25604

bnei_else.25603:
	nop
	nop
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.25605

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25606

fbgt_else.25605:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.25606:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25607

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.25609

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25608

bnei_else.25609:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.25610:
	nop
	nop
	nop
	j	bnei_cont.25608

bnei_else.25607:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.25608:
	nop
	nop
	nop
	flw	%f6, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25611

	nop
	nop
	nop
	j	bnei_cont.25612

bnei_else.25611:
	nop
	nop
	nop
	fneg	%f6, %f6

bnei_cont.25612:
	nop
	fsub	%f6, %f6, %f1
	flw	%f7, 2(%v1)
	flw	%f8, 2(%a0)

	nop
	nop
	nop
	fdiv	%f6, %f6, %f5

	nop
	nop
	nop
	fmul	%f7, %f6, %f7

	nop
	nop
	nop
	fadd	%f7, %f7, %f2

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.25613

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25614

fbgt_else.25613:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25614:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25615

	nop
	nop
	fmul	%f7, %f6, %f3
	flw	%f8, 0(%a0)

	nop
	nop
	nop
	fadd	%f7, %f7, %f0

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.25617

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25618

fbgt_else.25617:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.25618:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25619

	nop
	nop
	nop
	fsw	%f6, 135(%zero)

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.25616

bnei_else.25619:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.25620:
	nop
	nop
	nop
	j	bnei_cont.25616

bnei_else.25615:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.25616:
bnei_cont.25604:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25621

	nop
	nop
	nop
	addi	%v0, %zero, 2

	nop
	nop
	nop
	jr	%ra

bnei_else.25621:
	nop
	nop
	nop
	flw	%f6, 2(%v1)

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.25622

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25623

fbeq_else.25622:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25623:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25624

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25625

bnei_else.25624:
	nop
	nop
	lw	%v1, 4(%v0)
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.25626

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25627

fbgt_else.25626:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.25627:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25628

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25630

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25629

bnei_else.25630:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.25631:
	nop
	nop
	nop
	j	bnei_cont.25629

bnei_else.25628:
	nop
	nop
	nop
	add	%v0, %zero, %a0

bnei_cont.25629:
	nop
	nop
	nop
	flw	%f4, 2(%v1)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25632

	nop
	nop
	nop
	j	bnei_cont.25633

bnei_else.25632:
	nop
	nop
	nop
	fneg	%f4, %f4

bnei_cont.25633:
	nop
	nop
	nop
	fsub	%f2, %f4, %f2

	nop
	nop
	nop
	fdiv	%f2, %f2, %f6

	nop
	nop
	nop
	fmul	%f3, %f2, %f3

	nop
	nop
	fadd	%f0, %f3, %f0
	flw	%f3, 0(%v1)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.25634

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25635

fbgt_else.25634:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25635:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25636

	nop
	nop
	nop
	fmul	%f0, %f2, %f5

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25638

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25639

fbgt_else.25638:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25639:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25640

	nop
	nop
	nop
	fsw	%f2, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.25637

bnei_else.25640:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.25641:
	nop
	nop
	nop
	j	bnei_cont.25637

bnei_else.25636:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.25637:
bnei_cont.25625:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25642

	nop
	nop
	nop
	addi	%v0, %zero, 3

	nop
	nop
	nop
	jr	%ra

bnei_else.25642:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

solver_second.2830:
	nop
	nop
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)

	nop
	flw	%f5, 2(%v1)
	fmul	%f6, %f3, %f3
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f7, 0(%v1)
	lw	%v1, 4(%v0)

	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	flw	%f8, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25643

	nop
	nop
	fmul	%f7, %f4, %f5
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f8, 0(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3

	nop
	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%v1)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f3, %f4

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	j	bnei_cont.25644

bnei_else.25643:
bnei_cont.25644:
	nop
	nop
	nop
	flw	%f7, 470(%zero)

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.25645

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25646

fbeq_else.25645:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25646:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25647

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.25647:
	nop
	nop
	fmul	%f8, %f3, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f9, 0(%v1)
	lw	%v1, 4(%v0)

	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1
	flw	%f10, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f9, %f9, %f10
	flw	%f10, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f5, %f2

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	nop
	nop
	fadd	%f8, %f8, %f9

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25648

	nop
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2
	lw	%v1, 9(%v0)

	fadd	%f9, %f9, %f10
	flw	%f10, 0(%v1)
	fmul	%f5, %f5, %f0
	lw	%v1, 9(%v0)

	nop
	nop
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2

	fadd	%f5, %f10, %f5
	flw	%f10, 1(%v1)
	fmul	%f3, %f3, %f1
	lw	%v1, 9(%v0)

	nop
	nop
	fmul	%f5, %f5, %f10
	fmul	%f4, %f4, %f0

	nop
	fadd	%f5, %f9, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f4, 473(%zero)

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f8, %f3

	nop
	nop
	nop
	j	bnei_cont.25649

bnei_else.25648:
	nop
	nop
	nop
	fmov	%f3, %f8

bnei_cont.25649:
	nop
	nop
	fmul	%f4, %f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f5, 0(%v1)
	lw	%v1, 4(%v0)

	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1
	flw	%f8, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f5, %f5, %f8
	flw	%f8, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2

	nop
	nop
	nop
	fmul	%f5, %f5, %f8

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25650

	nop
	fmul	%f5, %f1, %f2
	lw	%v1, 9(%v0)
	fmul	%f2, %f2, %f0

	nop
	flw	%f8, 0(%v1)
	lw	%v1, 9(%v0)
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f5, %f5, %f8

	nop
	fadd	%f4, %f4, %f5
	flw	%f5, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	fmul	%f2, %f2, %f5
	flw	%f1, 2(%v1)

	nop
	nop
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	j	bnei_cont.25651

bnei_else.25650:
	nop
	nop
	nop
	fmov	%f0, %f4

bnei_cont.25651:
	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.25652

	nop
	nop
	nop
	j	bnei_cont.25653

bnei_else.25652:
	nop
	nop
	nop
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

bnei_cont.25653:
	nop
	nop
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	fblt	%f7, %f0, fbgt_else.25654

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25655

fbgt_else.25654:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25655:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25656

	nop
	nop
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25657

	nop
	nop
	nop
	j	bnei_cont.25658

bnei_else.25657:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.25658:
	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	fdiv	%f0, %f0, %f6

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25656:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

solver.2836:
	nop
	nop
	lw	%v0, 12(%v0)
	flw	%f0, 0(%a0)

	nop
	nop
	nop
	lw	%a1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 1(%a0)
	flw	%f2, 1(%a1)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%a0)
	lw	%a0, 5(%v0)

	nop
	nop
	flw	%f3, 2(%a0)
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	fsub	%f2, %f2, %f3

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.25659

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.25660

	nop
	nop
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)

	nop
	flw	%f5, 2(%v1)
	fmul	%f6, %f3, %f3
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f7, 0(%v1)
	lw	%v1, 4(%v0)

	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	flw	%f8, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25661

	nop
	nop
	fmul	%f7, %f4, %f5
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f8, 0(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3

	nop
	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%v1)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f3, %f4

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	j	bnei_cont.25662

bnei_else.25661:
bnei_cont.25662:
	nop
	nop
	nop
	flw	%f7, 470(%zero)

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.25663

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25664

fbeq_else.25663:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25664:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25665

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.25665:
	nop
	nop
	fmul	%f8, %f3, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f9, 0(%v1)
	lw	%v1, 4(%v0)

	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1
	flw	%f10, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f9, %f9, %f10
	flw	%f10, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f5, %f2

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	nop
	nop
	fadd	%f8, %f8, %f9

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25666

	nop
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2
	lw	%v1, 9(%v0)

	fadd	%f9, %f9, %f10
	flw	%f10, 0(%v1)
	fmul	%f5, %f5, %f0
	lw	%v1, 9(%v0)

	nop
	nop
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2

	fadd	%f5, %f10, %f5
	flw	%f10, 1(%v1)
	fmul	%f3, %f3, %f1
	lw	%v1, 9(%v0)

	nop
	nop
	fmul	%f5, %f5, %f10
	fmul	%f4, %f4, %f0

	nop
	fadd	%f5, %f9, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f4, 473(%zero)

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f8, %f3

	nop
	nop
	nop
	j	bnei_cont.25667

bnei_else.25666:
	nop
	nop
	nop
	fmov	%f3, %f8

bnei_cont.25667:
	nop
	nop
	fmul	%f4, %f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f5, 0(%v1)
	lw	%v1, 4(%v0)

	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1
	flw	%f8, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f5, %f5, %f8
	flw	%f8, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2

	nop
	nop
	nop
	fmul	%f5, %f5, %f8

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25668

	nop
	fmul	%f5, %f1, %f2
	lw	%v1, 9(%v0)
	fmul	%f2, %f2, %f0

	nop
	flw	%f8, 0(%v1)
	lw	%v1, 9(%v0)
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f5, %f5, %f8

	nop
	fadd	%f4, %f4, %f5
	flw	%f5, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	fmul	%f2, %f2, %f5
	flw	%f1, 2(%v1)

	nop
	nop
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	j	bnei_cont.25669

bnei_else.25668:
	nop
	nop
	nop
	fmov	%f0, %f4

bnei_cont.25669:
	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.25670

	nop
	nop
	nop
	j	bnei_cont.25671

bnei_else.25670:
	nop
	nop
	nop
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

bnei_cont.25671:
	nop
	nop
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	fblt	%f7, %f0, fbgt_else.25672

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25673

fbgt_else.25672:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25673:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25674

	nop
	nop
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25675

	nop
	nop
	nop
	j	bnei_cont.25676

bnei_else.25675:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.25676:
	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	fdiv	%f0, %f0, %f6

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25674:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.25660:
	nop
	nop
	lw	%v0, 4(%v0)
	flw	%f3, 0(%v1)

	nop
	nop
	flw	%f4, 0(%v0)
	flw	%f5, 1(%v1)

	nop
	fmul	%f3, %f3, %f4
	flw	%f6, 1(%v0)
	flw	%f7, 2(%v0)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%v1)

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fadd	%f3, %f3, %f5
	flw	%f5, 470(%zero)

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.25677

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25678

fbgt_else.25677:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25678:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25679

	nop
	nop
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25679:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.25659:
	nop
	nop
	flw	%f3, 0(%v1)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.25680

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25681

fbeq_else.25680:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.25681:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25682

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25683

bnei_else.25682:
	nop
	nop
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.25684

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25685

fbgt_else.25684:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.25685:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25686

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.25688

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25687

bnei_else.25688:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.25689:
	nop
	nop
	nop
	j	bnei_cont.25687

bnei_else.25686:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.25687:
	nop
	nop
	nop
	flw	%f5, 0(%a0)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25690

	nop
	nop
	nop
	j	bnei_cont.25691

bnei_else.25690:
	nop
	nop
	nop
	fneg	%f5, %f5

bnei_cont.25691:
	nop
	fsub	%f5, %f5, %f0
	flw	%f6, 1(%v1)
	flw	%f7, 1(%a0)

	nop
	nop
	nop
	fdiv	%f5, %f5, %f3

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	nop
	fadd	%f6, %f6, %f1

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.25692

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25693

fbgt_else.25692:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25693:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25694

	nop
	nop
	flw	%f6, 2(%v1)
	flw	%f7, 2(%a0)

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	nop
	fadd	%f6, %f6, %f2

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.25696

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25697

fbgt_else.25696:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.25697:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25698

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.25695

bnei_else.25698:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.25699:
	nop
	nop
	nop
	j	bnei_cont.25695

bnei_else.25694:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.25695:
bnei_cont.25683:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25700

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25700:
	nop
	nop
	nop
	flw	%f5, 1(%v1)

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.25701

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25702

fbeq_else.25701:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.25702:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25703

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25704

bnei_else.25703:
	nop
	nop
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.25705

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25706

fbgt_else.25705:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.25706:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25707

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.25709

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25708

bnei_else.25709:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.25710:
	nop
	nop
	nop
	j	bnei_cont.25708

bnei_else.25707:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.25708:
	nop
	nop
	nop
	flw	%f6, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25711

	nop
	nop
	nop
	j	bnei_cont.25712

bnei_else.25711:
	nop
	nop
	nop
	fneg	%f6, %f6

bnei_cont.25712:
	nop
	fsub	%f6, %f6, %f1
	flw	%f7, 2(%v1)
	flw	%f8, 2(%a0)

	nop
	nop
	nop
	fdiv	%f6, %f6, %f5

	nop
	nop
	nop
	fmul	%f7, %f6, %f7

	nop
	nop
	nop
	fadd	%f7, %f7, %f2

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.25713

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25714

fbgt_else.25713:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25714:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25715

	nop
	nop
	fmul	%f7, %f6, %f3
	flw	%f8, 0(%a0)

	nop
	nop
	nop
	fadd	%f7, %f7, %f0

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.25717

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25718

fbgt_else.25717:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.25718:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25719

	nop
	nop
	nop
	fsw	%f6, 135(%zero)

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.25716

bnei_else.25719:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.25720:
	nop
	nop
	nop
	j	bnei_cont.25716

bnei_else.25715:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.25716:
bnei_cont.25704:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25721

	nop
	nop
	nop
	addi	%v0, %zero, 2

	nop
	nop
	nop
	jr	%ra

bnei_else.25721:
	nop
	nop
	nop
	flw	%f6, 2(%v1)

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.25722

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25723

fbeq_else.25722:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25723:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25724

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25725

bnei_else.25724:
	nop
	nop
	lw	%v1, 4(%v0)
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.25726

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25727

fbgt_else.25726:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.25727:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25728

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25730

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25729

bnei_else.25730:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.25731:
	nop
	nop
	nop
	j	bnei_cont.25729

bnei_else.25728:
	nop
	nop
	nop
	add	%v0, %zero, %a0

bnei_cont.25729:
	nop
	nop
	nop
	flw	%f4, 2(%v1)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25732

	nop
	nop
	nop
	j	bnei_cont.25733

bnei_else.25732:
	nop
	nop
	nop
	fneg	%f4, %f4

bnei_cont.25733:
	nop
	nop
	nop
	fsub	%f2, %f4, %f2

	nop
	nop
	nop
	fdiv	%f2, %f2, %f6

	nop
	nop
	nop
	fmul	%f3, %f2, %f3

	nop
	nop
	fadd	%f0, %f3, %f0
	flw	%f3, 0(%v1)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.25734

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25735

fbgt_else.25734:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25735:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25736

	nop
	nop
	nop
	fmul	%f0, %f2, %f5

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25738

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25739

fbgt_else.25738:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25739:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25740

	nop
	nop
	nop
	fsw	%f2, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.25737

bnei_else.25740:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.25741:
	nop
	nop
	nop
	j	bnei_cont.25737

bnei_else.25736:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.25737:
bnei_cont.25725:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25742

	nop
	nop
	nop
	addi	%v0, %zero, 3

	nop
	nop
	nop
	jr	%ra

bnei_else.25742:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

solver_rect_fast.2840:
	nop
	nop
	flw	%f3, 0(%a0)
	flw	%f4, 1(%a0)

	nop
	fsub	%f3, %f3, %f0
	flw	%f5, 1(%v1)
	lw	%a1, 4(%v0)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f7, 1(%a1)

	nop
	nop
	nop
	fmul	%f6, %f3, %f5

	nop
	nop
	nop
	fadd	%f6, %f6, %f1

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.25743

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25744

fbgt_else.25743:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25744:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25745

	nop
	nop
	flw	%f6, 2(%v1)
	lw	%a1, 4(%v0)

	nop
	nop
	fmul	%f6, %f3, %f6
	flw	%f7, 2(%a1)

	nop
	nop
	nop
	fadd	%f6, %f6, %f2

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.25747

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25748

fbgt_else.25747:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25748:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25749

	nop
	nop
	nop
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.25751

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25752

fbeq_else.25751:
	nop
	nop
	nop
	addi	%a1, %zero, 0

fbeq_cont.25752:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25753

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25746

bnei_else.25753:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.25754:
	nop
	nop
	nop
	j	bnei_cont.25746

bnei_else.25749:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.25750:
	nop
	nop
	nop
	j	bnei_cont.25746

bnei_else.25745:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.25746:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25755

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25755:
	nop
	nop
	flw	%f3, 2(%a0)
	flw	%f4, 3(%a0)

	nop
	fsub	%f3, %f3, %f1
	flw	%f6, 0(%v1)
	lw	%a1, 4(%v0)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f8, 0(%a1)

	nop
	nop
	nop
	fmul	%f7, %f3, %f6

	nop
	nop
	nop
	fadd	%f7, %f7, %f0

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.25756

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25757

fbgt_else.25756:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25757:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25758

	nop
	nop
	flw	%f7, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	fmul	%f7, %f3, %f7
	flw	%f8, 2(%v1)

	nop
	nop
	nop
	fadd	%f7, %f7, %f2

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.25760

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25761

fbgt_else.25760:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25761:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25762

	nop
	nop
	nop
	flw	%f7, 470(%zero)

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.25764

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25765

fbeq_else.25764:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25765:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25766

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25759

bnei_else.25766:
	nop
	nop
	nop
	addi	%v1, %zero, 1

bnei_cont.25767:
	nop
	nop
	nop
	j	bnei_cont.25759

bnei_else.25762:
	nop
	nop
	nop
	addi	%v1, %zero, 0

bnei_cont.25763:
	nop
	nop
	nop
	j	bnei_cont.25759

bnei_else.25758:
	nop
	nop
	nop
	addi	%v1, %zero, 0

bnei_cont.25759:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25768

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 2

	nop
	nop
	nop
	jr	%ra

bnei_else.25768:
	nop
	nop
	flw	%f3, 4(%a0)
	lw	%v1, 4(%v0)

	nop
	nop
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	nop
	fmul	%f4, %f2, %f6

	nop
	nop
	fadd	%f0, %f4, %f0
	flw	%f4, 0(%v1)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.25769

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25770

fbgt_else.25769:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25770:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25771

	nop
	nop
	fmul	%f0, %f2, %f5
	lw	%v0, 4(%v0)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v0)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25773

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25774

fbgt_else.25773:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25774:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25775

	nop
	nop
	nop
	flw	%f0, 470(%zero)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.25777

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25778

fbeq_else.25777:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbeq_cont.25778:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25779

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25772

bnei_else.25779:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.25780:
	nop
	nop
	nop
	j	bnei_cont.25772

bnei_else.25775:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.25776:
	nop
	nop
	nop
	j	bnei_cont.25772

bnei_else.25771:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.25772:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25781

	nop
	nop
	nop
	fsw	%f2, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 3

	nop
	nop
	nop
	jr	%ra

bnei_else.25781:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

solver_second_fast.2853:
	nop
	nop
	flw	%f3, 0(%v1)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.25782

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25783

fbeq_else.25782:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.25783:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25784

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.25784:
	nop
	nop
	flw	%f5, 1(%v1)
	flw	%f6, 2(%v1)

	nop
	fmul	%f5, %f5, %f0
	fmul	%f6, %f6, %f1
	lw	%a0, 4(%v0)

	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%v1)
	flw	%f7, 0(%a0)

	nop
	nop
	fmul	%f6, %f6, %f2
	lw	%a0, 4(%v0)

	fadd	%f5, %f5, %f6
	fmul	%f6, %f0, %f0
	flw	%f8, 1(%a0)
	lw	%a0, 4(%v0)

	nop
	nop
	fmul	%f6, %f6, %f7
	fmul	%f7, %f1, %f1

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%a0)
	lw	%a0, 3(%v0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f2, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25785

	nop
	fmul	%f7, %f1, %f2
	lw	%a0, 9(%v0)
	fmul	%f2, %f2, %f0

	nop
	flw	%f8, 0(%a0)
	lw	%a0, 9(%v0)
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v0)

	nop
	nop
	fmul	%f2, %f2, %f7
	flw	%f1, 2(%a0)

	nop
	nop
	fadd	%f2, %f6, %f2
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	j	bnei_cont.25786

bnei_else.25785:
	nop
	nop
	nop
	fmov	%f0, %f6

bnei_cont.25786:
	nop
	nop
	nop
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.25787

	nop
	nop
	nop
	j	bnei_cont.25788

bnei_else.25787:
	nop
	nop
	nop
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

bnei_cont.25788:
	nop
	nop
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	fblt	%f4, %f0, fbgt_else.25789

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25790

fbgt_else.25789:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.25790:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25791

	nop
	nop
	nop
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25792

	nop
	nop
	fsqrt	%f0, %f0
	flw	%f1, 4(%v1)

	nop
	nop
	nop
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.25793

bnei_else.25792:
	nop
	nop
	fsqrt	%f0, %f0
	flw	%f1, 4(%v1)

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

bnei_cont.25793:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25791:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

solver_fast2.2877:
	nop
	nop
	lw	%a0, 12(%v0)
	lw	%a2, 1(%v1)

	nop
	lw	%a1, 10(%a0)
	add	%at, %a2, %v0
	lw	%a2, 1(%a0)

	nop
	nop
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)

	nop
	nop
	flw	%f2, 2(%a1)
	lw	%v0, 0(%at)

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.25794

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.25795

	nop
	nop
	flw	%f3, 0(%v0)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.25796

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25797

fbeq_else.25796:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25797:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25798

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.25798:
	nop
	nop
	nop
	flw	%f5, 1(%v0)

	nop
	nop
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%v0)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%v0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a1)

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1

	nop
	nop
	nop
	fsub	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.25799

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25800

fbgt_else.25799:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25800:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25801

	nop
	nop
	nop
	lw	%v1, 6(%a0)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25802

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v0)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.25803

bnei_else.25802:
	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v0)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

bnei_cont.25803:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25801:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.25795:
	nop
	nop
	flw	%f0, 0(%v0)
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25804

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25805

fbgt_else.25804:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.25805:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.25806

	nop
	nop
	nop
	flw	%f1, 3(%a1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25806:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.25794:
	nop
	lw	%v1, 0(%v1)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0

	nop
	nop
	nop
	addi	%v0, %k0, 0

	nop
	nop
	nop
	j	solver_rect_fast.2840

setup_rect_table.2880:
	nop
	addi	%a0, %zero, 6
	flw	%f0, 470(%zero)
	sw	%v1, 0(%sp)

	nop
	nop
	nop
	fsw	%f0, 1(%sp)

	nop
	nop
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0

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
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.25810

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25811

fbeq_else.25810:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.25811:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25812

	nop
	nop
	nop
	fsw	%f1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.25813

bnei_else.25812:
	nop
	nop
	nop
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25814

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25815

fbgt_else.25814:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.25815:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25816

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.25818

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25817

bnei_else.25818:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.25819:
	nop
	nop
	nop
	j	bnei_cont.25817

bnei_else.25816:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.25817:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 0(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25820

	nop
	nop
	nop
	j	bnei_cont.25821

bnei_else.25820:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.25821:
	nop
	nop
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

bnei_cont.25813:
	nop
	nop
	nop
	flw	%f0, 1(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.25822

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25823

fbeq_else.25822:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.25823:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25824

	nop
	nop
	nop
	fsw	%f1, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.25825

bnei_else.25824:
	nop
	nop
	nop
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25826

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25827

fbgt_else.25826:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.25827:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25828

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.25830

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25829

bnei_else.25830:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.25831:
	nop
	nop
	nop
	j	bnei_cont.25829

bnei_else.25828:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.25829:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 1(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25832

	nop
	nop
	nop
	j	bnei_cont.25833

bnei_else.25832:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.25833:
	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

bnei_cont.25825:
	nop
	nop
	nop
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.25834

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25835

fbeq_else.25834:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25835:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25836

	nop
	nop
	nop
	fsw	%f1, 5(%v0)

	nop
	nop
	nop
	j	bnei_cont.25837

bnei_else.25836:
	nop
	nop
	nop
	lw	%v1, 0(%sp)

	nop
	nop
	nop
	lw	%a0, 6(%v1)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.25838

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25839

fbgt_else.25838:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25839:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25840

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25842

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25841

bnei_else.25842:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.25843:
	nop
	nop
	nop
	j	bnei_cont.25841

bnei_else.25840:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.25841:
	nop
	nop
	nop
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25844

	nop
	nop
	nop
	j	bnei_cont.25845

bnei_else.25844:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.25845:
	nop
	nop
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 5(%v0)

bnei_cont.25837:
	nop
	nop
	nop
	jr	%ra

setup_second_table.2886:
	nop
	nop
	addi	%a0, %zero, 5
	flw	%f0, 470(%zero)

	nop
	nop
	nop
	fsw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0

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
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)

	nop
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25849

	nop
	nop
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	j	bnei_cont.25850

bnei_else.25849:
bnei_cont.25850:
	nop
	nop
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f0, %f4
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	fneg	%f4, %f4
	fmul	%f5, %f1, %f5
	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	nop
	fneg	%f6, %f6

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25851

	nop
	nop
	nop
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f7, %f2, %f7
	flw	%f8, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	nop
	fmul	%f8, %f1, %f8

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 473(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fsub	%f4, %f4, %f7

	nop
	nop
	fsw	%f4, 1(%v0)
	flw	%f4, 0(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f4, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fmul	%f4, %f0, %f4
	lw	%v1, 9(%v1)

	nop
	nop
	nop
	fadd	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f8

	nop
	nop
	nop
	fsub	%f2, %f5, %f2

	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 0(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%v1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f8

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.25852

bnei_else.25851:
	nop
	nop
	nop
	fsw	%f4, 1(%v0)

	nop
	nop
	nop
	fsw	%f5, 2(%v0)

	nop
	nop
	nop
	fsw	%f6, 3(%v0)

bnei_cont.25852:
	nop
	nop
	nop
	flw	%f0, 0(%sp)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.25853

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.25854

fbeq_else.25853:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.25854:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25855

	nop
	nop
	nop
	j	bnei_cont.25856

bnei_else.25855:
	nop
	nop
	nop
	flw	%f0, 474(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 4(%v0)

bnei_cont.25856:
	nop
	nop
	nop
	jr	%ra

iter_setup_dirvec_constants.2889:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.25886

	nop
	nop
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)

	nop
	nop
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)

	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.25887

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.25889

	nop
	sw	%v1, 1(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 2(%sp)

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
	nop
	jal	setup_second_table.2886

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.25888

bnei_else.25889:
	nop
	addi	%a3, %zero, 4
	flw	%f0, 470(%zero)
	sw	%v1, 1(%sp)

	nop
	nop
	sw	%a1, 2(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	fsw	%f0, 3(%sp)

	nop
	nop
	nop
	sw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%a2, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 4(%sp)

	nop
	nop
	lw	%a1, 4(%a0)
	flw	%f2, 1(%v1)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f3, 1(%a1)

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 2(%v1)

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.25891

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25892

fbgt_else.25891:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25892:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25893

	nop
	nop
	flw	%f2, 458(%zero)
	fdiv	%f1, %f1, %f0

	nop
	nop
	fdiv	%f2, %f2, %f0
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f2, 0(%v0)

	nop
	fsw	%f1, 1(%v0)
	fdiv	%f1, %f3, %f0
	fdiv	%f0, %f4, %f0

	nop
	nop
	fneg	%f1, %f1
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f1, 2(%v0)

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.25894

bnei_else.25893:
	nop
	nop
	nop
	fsw	%f2, 0(%v0)

bnei_cont.25894:
	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.25890:
	nop
	nop
	nop
	j	bnei_cont.25888

bnei_else.25887:
	nop
	sw	%v1, 1(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	setup_rect_table.2880

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.25888:
	nop
	nop
	nop
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.25895

	nop
	nop
	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)

	nop
	nop
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)

	nop
	nop
	nop
	lw	%a3, 1(%v1)

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.25896

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.25898

	nop
	nop
	sw	%v0, 6(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 7(%sp)

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
	nop
	jal	setup_second_table.2886

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	nop
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.25897

bnei_else.25898:
	nop
	addi	%a3, %zero, 4
	flw	%f0, 470(%zero)
	sw	%v0, 6(%sp)

	nop
	nop
	sw	%a1, 7(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	fsw	%f0, 8(%sp)

	nop
	nop
	nop
	sw	%v1, 9(%sp)

	nop
	nop
	nop
	sw	%a2, 10(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 9(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 8(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25900

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25901

fbgt_else.25900:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25901:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25902

	nop
	nop
	flw	%f1, 458(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.25903

bnei_else.25902:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.25903:
	nop
	nop
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.25899:
	nop
	nop
	nop
	j	bnei_cont.25897

bnei_else.25896:
	nop
	nop
	sw	%v0, 6(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	setup_rect_table.2880

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	nop
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.25897:
	nop
	nop
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	j	iter_setup_dirvec_constants.2889

bgti_else.25895:
	nop
	nop
	nop
	jr	%ra

bgti_else.25886:
	nop
	nop
	nop
	jr	%ra

setup_dirvec_constants.2892:
	nop
	nop
	nop
	lw	%v1, 0(%zero)

	nop
	nop
	nop
	addi	%v1, %v1, -1

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.25921

	nop
	nop
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)

	nop
	nop
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)

	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.25922

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.25924

	nop
	sw	%v1, 1(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 2(%sp)

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
	nop
	jal	setup_second_table.2886

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.25923

bnei_else.25924:
	nop
	addi	%a3, %zero, 4
	flw	%f0, 470(%zero)
	sw	%v1, 1(%sp)

	nop
	nop
	sw	%a1, 2(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	fsw	%f0, 3(%sp)

	nop
	nop
	nop
	sw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%a2, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.25926

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25927

fbgt_else.25926:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.25927:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.25928

	nop
	nop
	flw	%f1, 458(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.25929

bnei_else.25928:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.25929:
	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.25925:
	nop
	nop
	nop
	j	bnei_cont.25923

bnei_else.25922:
	nop
	sw	%v1, 1(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	setup_rect_table.2880

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.25923:
	nop
	nop
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	j	iter_setup_dirvec_constants.2889

bgti_else.25921:
	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2894:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.25932

	nop
	nop
	lw	%a0, 12(%v1)
	flw	%f0, 0(%v0)

	nop
	nop
	lw	%a1, 10(%a0)
	lw	%a2, 1(%a0)

	nop
	nop
	nop
	lw	%a3, 5(%a0)

	nop
	nop
	flw	%f1, 0(%a3)
	lw	%a3, 5(%a0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 1(%a3)
	lw	%a3, 5(%a0)

	nop
	nop
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%v0)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 2(%a3)

	nop
	nop
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%v0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 2(%a1)

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.25933

	nop
	nop
	nop
	addi	%at, %zero, 2

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.25935

	nop
	nop
	nop
	j	bnei_cont.25934

bgt_else.25935:
	nop
	nop
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)

	nop
	flw	%f2, 2(%a1)
	fmul	%f3, %f0, %f0
	lw	%a3, 4(%a0)

	nop
	nop
	flw	%f4, 0(%a3)
	lw	%a3, 4(%a0)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a3)
	lw	%a3, 4(%a0)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a3)
	lw	%a3, 3(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.25937

	nop
	fmul	%f4, %f1, %f2
	lw	%a3, 9(%a0)
	fmul	%f2, %f2, %f0

	nop
	flw	%f5, 0(%a3)
	lw	%a3, 9(%a0)
	fmul	%f0, %f0, %f1

	nop
	nop
	fmul	%f4, %f4, %f5
	lw	%a0, 9(%a0)

	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 1(%a3)
	flw	%f1, 2(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	j	bnei_cont.25938

bnei_else.25937:
	nop
	nop
	nop
	fmov	%f0, %f3

bnei_cont.25938:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.25939

	nop
	nop
	nop
	j	bnei_cont.25940

bnei_else.25939:
	nop
	nop
	nop
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

bnei_cont.25940:
	nop
	nop
	nop
	fsw	%f0, 3(%a1)

bgt_cont.25936:
	nop
	nop
	nop
	j	bnei_cont.25934

bnei_else.25933:
	nop
	nop
	lw	%a0, 4(%a0)
	flw	%f0, 0(%a1)

	nop
	nop
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)

	nop
	nop
	nop
	flw	%f3, 0(%a0)

	nop
	nop
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%a0)

	nop
	nop
	nop
	fmul	%f1, %f3, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 3(%a1)

bnei_cont.25934:
	nop
	nop
	nop
	addi	%v1, %v1, -1

	nop
	nop
	nop
	j	setup_startp_constants.2894

bgti_else.25932:
	nop
	nop
	nop
	jr	%ra

check_all_inside.2919:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.25942

	nop
	nop
	nop
	lw	%a0, 12(%a0)

	nop
	nop
	nop
	lw	%a1, 5(%a0)

	nop
	nop
	flw	%f3, 0(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f3, %f0, %f3
	flw	%f4, 1(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f4, %f1, %f4
	flw	%f5, 2(%a1)
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	fsub	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.25943

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.25945

	nop
	nop
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f7, 0(%a1)
	lw	%a1, 4(%a0)

	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	flw	%f8, 1(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%a1)
	lw	%a1, 3(%a0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25947

	nop
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	fmul	%f5, %f5, %f3

	nop
	flw	%f8, 0(%a1)
	lw	%a1, 9(%a0)
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 1(%a1)
	lw	%a1, 9(%a0)

	nop
	nop
	fmul	%f5, %f5, %f7
	flw	%f4, 2(%a1)

	nop
	nop
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	j	bnei_cont.25948

bnei_else.25947:
	nop
	nop
	nop
	fmov	%f3, %f6

bnei_cont.25948:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.25949

	nop
	nop
	nop
	j	bnei_cont.25950

bnei_else.25949:
	nop
	nop
	nop
	flw	%f4, 474(%zero)

	nop
	nop
	nop
	fsub	%f3, %f3, %f4

bnei_cont.25950:
	nop
	nop
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.25951

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25952

fbgt_else.25951:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25952:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25953

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25955

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25954

bnei_else.25955:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.25956:
	nop
	nop
	nop
	j	bnei_cont.25954

bnei_else.25953:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.25954:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25957

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25944

bnei_else.25957:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.25958:
	nop
	nop
	nop
	j	bnei_cont.25944

bnei_else.25945:
	nop
	nop
	lw	%a1, 4(%a0)
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a1)

	nop
	nop
	nop
	fmul	%f4, %f6, %f4

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.25959

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25960

fbgt_else.25959:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25960:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25961

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25963

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25962

bnei_else.25963:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.25964:
	nop
	nop
	nop
	j	bnei_cont.25962

bnei_else.25961:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.25962:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25965

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25944

bnei_else.25965:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.25966:
bnei_cont.25946:
	nop
	nop
	nop
	j	bnei_cont.25944

bnei_else.25943:
	nop
	nop
	fabs	%f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	nop
	fblt	%f3, %f6, fbgt_else.25967

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25968

fbgt_else.25967:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25968:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25969

	nop
	nop
	fabs	%f3, %f4
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 1(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.25971

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25972

fbgt_else.25971:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25972:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25973

	nop
	nop
	fabs	%f3, %f5
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.25975

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25970

fbgt_else.25975:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25976:
	nop
	nop
	nop
	j	bnei_cont.25970

bnei_else.25973:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.25974:
	nop
	nop
	nop
	j	bnei_cont.25970

bnei_else.25969:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.25970:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25977

	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	j	bnei_cont.25978

bnei_else.25977:
	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25979

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25980

bnei_else.25979:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.25980:
bnei_cont.25978:
bnei_cont.25944:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25981

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.25981:
	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.25982

	nop
	nop
	nop
	lw	%a0, 12(%a0)

	nop
	nop
	nop
	lw	%a1, 5(%a0)

	nop
	nop
	flw	%f3, 0(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f3, %f0, %f3
	flw	%f4, 1(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f4, %f1, %f4
	flw	%f5, 2(%a1)
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	fsub	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.25983

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.25985

	nop
	nop
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f7, 0(%a1)
	lw	%a1, 4(%a0)

	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	flw	%f8, 1(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%a1)
	lw	%a1, 3(%a0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25987

	nop
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	fmul	%f5, %f5, %f3

	nop
	flw	%f8, 0(%a1)
	lw	%a1, 9(%a0)
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 1(%a1)
	lw	%a1, 9(%a0)

	nop
	nop
	fmul	%f5, %f5, %f7
	flw	%f4, 2(%a1)

	nop
	nop
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	j	bnei_cont.25988

bnei_else.25987:
	nop
	nop
	nop
	fmov	%f3, %f6

bnei_cont.25988:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.25989

	nop
	nop
	nop
	j	bnei_cont.25990

bnei_else.25989:
	nop
	nop
	nop
	flw	%f4, 474(%zero)

	nop
	nop
	nop
	fsub	%f3, %f3, %f4

bnei_cont.25990:
	nop
	nop
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.25991

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.25992

fbgt_else.25991:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.25992:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25993

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.25995

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25994

bnei_else.25995:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.25996:
	nop
	nop
	nop
	j	bnei_cont.25994

bnei_else.25993:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.25994:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.25997

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25984

bnei_else.25997:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.25998:
	nop
	nop
	nop
	j	bnei_cont.25984

bnei_else.25985:
	nop
	nop
	lw	%a1, 4(%a0)
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a1)

	nop
	nop
	nop
	fmul	%f4, %f6, %f4

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.25999

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26000

fbgt_else.25999:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.26000:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26001

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26003

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26002

bnei_else.26003:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.26004:
	nop
	nop
	nop
	j	bnei_cont.26002

bnei_else.26001:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.26002:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26005

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.25984

bnei_else.26005:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.26006:
bnei_cont.25986:
	nop
	nop
	nop
	j	bnei_cont.25984

bnei_else.25983:
	nop
	nop
	fabs	%f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	nop
	fblt	%f3, %f6, fbgt_else.26007

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26008

fbgt_else.26007:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.26008:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26009

	nop
	nop
	fabs	%f3, %f4
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 1(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.26011

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26012

fbgt_else.26011:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.26012:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26013

	nop
	nop
	fabs	%f3, %f5
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.26015

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26010

fbgt_else.26015:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.26016:
	nop
	nop
	nop
	j	bnei_cont.26010

bnei_else.26013:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.26014:
	nop
	nop
	nop
	j	bnei_cont.26010

bnei_else.26009:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.26010:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26017

	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	j	bnei_cont.26018

bnei_else.26017:
	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26019

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26020

bnei_else.26019:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.26020:
bnei_cont.26018:
bnei_cont.25984:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26021

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.26021:
	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	check_all_inside.2919

bnei_else.25982:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.25942:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

shadow_check_and_group.2925:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26053

	nop
	nop
	lw	%a1, 12(%a0)
	flw	%f0, 138(%zero)

	nop
	nop
	lw	%a2, 5(%a1)
	flw	%f2, 139(%zero)

	nop
	flw	%f1, 0(%a2)
	addi	%a2, %zero, 1
	lw	%a3, 5(%a1)

	nop
	fsub	%f1, %f0, %f1
	flw	%f3, 1(%a3)
	flw	%f4, 140(%zero)

	nop
	fsub	%f3, %f2, %f3
	lw	%a3, 5(%a1)
	lw	%a0, 187(%a0)

	nop
	nop
	flw	%f5, 2(%a3)
	lw	%a3, 1(%a1)

	nop
	nop
	fsub	%f5, %f4, %f5
	sw	%a2, 0(%sp)

	nop
	nop
	nop
	fsw	%f4, 1(%sp)

	nop
	nop
	nop
	fsw	%f2, 2(%sp)

	nop
	nop
	nop
	fsw	%f0, 3(%sp)

	nop
	nop
	nop
	sw	%v1, 4(%sp)

	nop
	nop
	nop
	sw	%v0, 5(%sp)

	nop
	nop
	nop
	sw	%a1, 6(%sp)

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.26054

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.26056

	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)

	nop
	nop
	fmov	%f2, %f5
	fmov	%f0, %f1

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solver_second_fast.2853

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.26055

bnei_else.26056:
	nop
	nop
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.26058

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26059

fbgt_else.26058:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.26059:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.26060

	nop
	nop
	nop
	flw	%f6, 1(%a0)

	nop
	nop
	fmul	%f1, %f6, %f1
	flw	%f6, 2(%a0)

	nop
	nop
	nop
	fmul	%f3, %f6, %f3

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 3(%a0)

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

	nop
	nop
	nop
	fsw	%f1, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26055

bnei_else.26060:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26061:
bnei_cont.26057:
	nop
	nop
	nop
	j	bnei_cont.26055

bnei_else.26054:
	nop
	addi	%a3, %zero, 184
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%v1, %a3, 0
	fmov	%f2, %f5

	nop
	nop
	fmov	%f0, %f1
	fmov	%f1, %f3

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solver_rect_fast.2840

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

bnei_cont.26055:
	nop
	nop
	nop
	flw	%f0, 135(%zero)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26062

	nop
	nop
	nop
	flw	%f1, 457(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.26064

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26063

fbgt_else.26064:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.26065:
	nop
	nop
	nop
	j	bnei_cont.26063

bnei_else.26062:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26063:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26066

	nop
	nop
	flw	%f1, 456(%zero)
	flw	%f2, 3(%sp)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 78(%zero)
	flw	%f3, 2(%sp)

	nop
	nop
	fmul	%f1, %f1, %f0
	lw	%v1, 4(%sp)

	nop
	fadd	%f1, %f1, %f2
	flw	%f2, 79(%zero)
	lw	%v0, 0(%v1)

	nop
	nop
	nop
	fmul	%f2, %f2, %f0

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 80(%zero)

	nop
	nop
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%sp)

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.26067

	nop
	nop
	nop
	lw	%v0, 12(%v0)

	nop
	nop
	nop
	lw	%a0, 5(%v0)

	nop
	nop
	flw	%f3, 0(%a0)
	lw	%a0, 5(%v0)

	nop
	fsub	%f3, %f1, %f3
	flw	%f4, 1(%a0)
	lw	%a0, 5(%v0)

	nop
	fsub	%f4, %f2, %f4
	flw	%f5, 2(%a0)
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	fsub	%f5, %f0, %f5

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.26069

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.26071

	nop
	nop
	fmul	%f6, %f3, %f3
	lw	%a0, 4(%v0)

	nop
	nop
	flw	%f7, 0(%a0)
	lw	%a0, 4(%v0)

	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	flw	%f8, 1(%a0)
	lw	%a0, 4(%v0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%a0)
	lw	%a0, 3(%v0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26073

	nop
	fmul	%f7, %f4, %f5
	lw	%a0, 9(%v0)
	fmul	%f5, %f5, %f3

	nop
	flw	%f8, 0(%a0)
	lw	%a0, 9(%v0)
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v0)

	nop
	nop
	fmul	%f5, %f5, %f7
	flw	%f4, 2(%a0)

	nop
	nop
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	j	bnei_cont.26074

bnei_else.26073:
	nop
	nop
	nop
	fmov	%f3, %f6

bnei_cont.26074:
	nop
	nop
	nop
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.26075

	nop
	nop
	nop
	j	bnei_cont.26076

bnei_else.26075:
	nop
	nop
	nop
	flw	%f4, 474(%zero)

	nop
	nop
	nop
	fsub	%f3, %f3, %f4

bnei_cont.26076:
	nop
	nop
	lw	%v0, 6(%v0)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.26077

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26078

fbgt_else.26077:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.26078:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26079

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26081

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26080

bnei_else.26081:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.26082:
	nop
	nop
	nop
	j	bnei_cont.26080

bnei_else.26079:
	nop
	nop
	nop
	add	%v0, %zero, %a0

bnei_cont.26080:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26083

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26070

bnei_else.26083:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.26084:
	nop
	nop
	nop
	j	bnei_cont.26070

bnei_else.26071:
	nop
	nop
	lw	%a0, 4(%v0)
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	flw	%f6, 0(%a0)

	nop
	nop
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a0)

	nop
	nop
	nop
	fmul	%f4, %f6, %f4

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.26085

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26086

fbgt_else.26085:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.26086:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26087

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26089

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26088

bnei_else.26089:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.26090:
	nop
	nop
	nop
	j	bnei_cont.26088

bnei_else.26087:
	nop
	nop
	nop
	add	%v0, %zero, %a0

bnei_cont.26088:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26091

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26070

bnei_else.26091:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.26092:
bnei_cont.26072:
	nop
	nop
	nop
	j	bnei_cont.26070

bnei_else.26069:
	nop
	nop
	fabs	%f3, %f3
	lw	%a0, 4(%v0)

	nop
	nop
	nop
	flw	%f6, 0(%a0)

	nop
	nop
	nop
	fblt	%f3, %f6, fbgt_else.26093

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26094

fbgt_else.26093:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.26094:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26095

	nop
	nop
	fabs	%f3, %f4
	lw	%a0, 4(%v0)

	nop
	nop
	nop
	flw	%f4, 1(%a0)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.26097

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26098

fbgt_else.26097:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.26098:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26099

	nop
	nop
	fabs	%f3, %f5
	lw	%a0, 4(%v0)

	nop
	nop
	nop
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.26101

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26096

fbgt_else.26101:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.26102:
	nop
	nop
	nop
	j	bnei_cont.26096

bnei_else.26099:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.26100:
	nop
	nop
	nop
	j	bnei_cont.26096

bnei_else.26095:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.26096:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26103

	nop
	nop
	nop
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	j	bnei_cont.26104

bnei_else.26103:
	nop
	nop
	nop
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26105

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26106

bnei_else.26105:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.26106:
bnei_cont.26104:
bnei_cont.26070:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26107

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26068

bnei_else.26107:
	lw	%v0, 0(%sp)
	fmov	%f29, %f2
	fmov	%f2, %f0
	sw	%ra, 7(%sp)

	nop
	nop
	fmov	%f0, %f1
	fmov	%f1, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	check_all_inside.2919

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

bnei_cont.26108:
	nop
	nop
	nop
	j	bnei_cont.26068

bnei_else.26067:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.26068:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26109

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.26109:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_and_group.2925

bnei_else.26066:
	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26110

	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_and_group.2925

bnei_else.26110:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.26053:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_group.2928:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26122

	nop
	nop
	lw	%a0, 83(%a0)
	addi	%a1, %zero, 0

	nop
	nop
	nop
	sw	%a1, 0(%sp)

	nop
	nop
	sw	%v1, 1(%sp)
	addi	%v1, %a0, 0

	nop
	nop
	sw	%v0, 2(%sp)
	addi	%v0, %a1, 0

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
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26123

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.26123:
	nop
	nop
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26124

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)

	nop
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26125

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.26125:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26126

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)

	nop
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26127

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.26127:
	nop
	nop
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26128

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)

	nop
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26129

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.26129:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_one_or_group.2928

bnei_else.26128:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.26126:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.26124:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.26122:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_matrix.2931:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a1, %zero, 0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a2, 0(%a0)

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.26165

	nop
	nop
	nop
	sw	%a1, 0(%sp)

	nop
	nop
	nop
	sw	%a0, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	beqi	%a2, 99, bnei_else.26166

	nop
	nop
	lw	%a3, 12(%a2)
	flw	%f0, 138(%zero)

	nop
	nop
	lw	%t0, 5(%a3)
	lw	%a2, 187(%a2)

	nop
	nop
	flw	%f1, 0(%t0)
	lw	%t0, 5(%a3)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%t0)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%t0, 5(%a3)

	nop
	nop
	flw	%f3, 2(%t0)
	lw	%t0, 1(%a3)

	nop
	nop
	nop
	fsub	%f2, %f2, %f3

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.26168

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.26170

	nop
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solver_second_fast.2853

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	j	bnei_cont.26169

bnei_else.26170:
	nop
	nop
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.26172

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26173

fbgt_else.26172:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.26173:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.26174

	nop
	nop
	nop
	flw	%f3, 1(%a2)

	nop
	nop
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a2)

	nop
	nop
	nop
	fmul	%f1, %f3, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a2)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26169

bnei_else.26174:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26175:
bnei_cont.26171:
	nop
	nop
	nop
	j	bnei_cont.26169

bnei_else.26168:
	nop
	addi	%t0, %zero, 184
	addi	%a0, %a2, 0
	sw	%ra, 4(%sp)

	nop
	nop
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solver_rect_fast.2840

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

bnei_cont.26169:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26176

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 455(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.26178

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26179

fbgt_else.26178:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.26179:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26180

	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.26182

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26184

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26183

bnei_else.26184:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.26186

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26188

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26183

bnei_else.26188:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.26190

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26192

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26183

bnei_else.26192:
	nop
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2928

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

bnei_cont.26193:
	nop
	nop
	nop
	j	bnei_cont.26183

bnei_else.26190:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26191:
bnei_cont.26189:
	nop
	nop
	nop
	j	bnei_cont.26183

bnei_else.26186:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26187:
bnei_cont.26185:
	nop
	nop
	nop
	j	bnei_cont.26183

bnei_else.26182:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26183:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26194

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26167

bnei_else.26194:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26195:
	nop
	nop
	nop
	j	bnei_cont.26167

bnei_else.26180:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26181:
	nop
	nop
	nop
	j	bnei_cont.26167

bnei_else.26176:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26177:
	nop
	nop
	nop
	j	bnei_cont.26167

bnei_else.26166:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.26167:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26196

	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.26197

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26199

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26198

bnei_else.26199:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.26201

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26203

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26198

bnei_else.26203:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.26205

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26207

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26198

bnei_else.26207:
	nop
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2928

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

bnei_cont.26208:
	nop
	nop
	nop
	j	bnei_cont.26198

bnei_else.26205:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26206:
bnei_cont.26204:
	nop
	nop
	nop
	j	bnei_cont.26198

bnei_else.26201:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26202:
bnei_cont.26200:
	nop
	nop
	nop
	j	bnei_cont.26198

bnei_else.26197:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26198:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26209

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.26209:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_one_or_matrix.2931

bnei_else.26196:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_one_or_matrix.2931

bnei_else.26165:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

solve_each_element.2934:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.26268

	nop
	nop
	lw	%a2, 12(%a1)
	flw	%f0, 159(%zero)

	nop
	nop
	lw	%a3, 5(%a2)
	flw	%f2, 160(%zero)

	nop
	flw	%f1, 0(%a3)
	addi	%a3, %zero, 1
	lw	%t0, 5(%a2)

	nop
	fsub	%f1, %f0, %f1
	flw	%f3, 1(%t0)
	flw	%f4, 161(%zero)

	nop
	fsub	%f3, %f2, %f3
	lw	%t0, 5(%a2)
	sw	%a1, 0(%sp)

	nop
	nop
	flw	%f5, 2(%t0)
	lw	%t0, 1(%a2)

	nop
	nop
	fsub	%f5, %f4, %f5
	sw	%a3, 1(%sp)

	nop
	nop
	nop
	fsw	%f4, 2(%sp)

	nop
	nop
	nop
	fsw	%f2, 3(%sp)

	nop
	nop
	nop
	fsw	%f0, 4(%sp)

	nop
	nop
	nop
	sw	%a0, 5(%sp)

	nop
	nop
	nop
	sw	%v1, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 7(%sp)

	nop
	nop
	nop
	sw	%a2, 8(%sp)

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.26269

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.26271

	nop
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 9(%sp)

	nop
	nop
	fmov	%f2, %f5
	fmov	%f0, %f1

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	solver_second.2830

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bnei_cont.26270

bnei_else.26271:
	nop
	nop
	lw	%t0, 4(%a2)
	flw	%f6, 0(%a0)

	nop
	nop
	flw	%f7, 0(%t0)
	flw	%f8, 1(%a0)

	nop
	fmul	%f6, %f6, %f7
	flw	%f9, 1(%t0)
	flw	%f10, 2(%t0)

	nop
	nop
	nop
	fmul	%f8, %f8, %f9

	nop
	nop
	fadd	%f6, %f6, %f8
	flw	%f8, 2(%a0)

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	fadd	%f6, %f6, %f8
	flw	%f8, 470(%zero)

	nop
	nop
	nop
	fblt	%f8, %f6, fbgt_else.26273

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26274

fbgt_else.26273:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.26274:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.26275

	nop
	nop
	fmul	%f1, %f7, %f1
	fmul	%f3, %f9, %f3

	nop
	nop
	fadd	%f1, %f1, %f3
	fmul	%f3, %f10, %f5

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fdiv	%f1, %f1, %f6

	nop
	nop
	nop
	fsw	%f1, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26270

bnei_else.26275:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26276:
bnei_cont.26272:
	nop
	nop
	nop
	j	bnei_cont.26270

bnei_else.26269:
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 9(%sp)

	nop
	nop
	fmov	%f2, %f5
	fmov	%f0, %f1

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	solver_rect.2805

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.26270:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26277

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.26278

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26279

fbgt_else.26278:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.26279:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.26280

	nop
	nop
	nop
	flw	%f2, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.26282

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26283

fbgt_else.26282:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.26283:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_cont.26281

	nop
	nop
	flw	%f2, 456(%zero)
	lw	%a0, 5(%sp)

	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 0(%a0)
	flw	%f3, 4(%sp)

	nop
	fmul	%f2, %f2, %f0
	flw	%f4, 3(%sp)
	flw	%f5, 2(%sp)

	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 1(%a0)
	lw	%v1, 6(%sp)

	nop
	fmul	%f3, %f3, %f0
	lw	%a1, 0(%v1)
	sw	%v0, 9(%sp)

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	fsw	%f4, 10(%sp)

	nop
	nop
	nop
	fsw	%f3, 11(%sp)

	nop
	nop
	nop
	fsw	%f2, 12(%sp)

	nop
	nop
	nop
	fsw	%f0, 13(%sp)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.26286

	nop
	nop
	nop
	lw	%a1, 12(%a1)

	nop
	nop
	nop
	lw	%a2, 5(%a1)

	nop
	nop
	flw	%f5, 0(%a2)
	lw	%a2, 5(%a1)

	nop
	fsub	%f5, %f2, %f5
	flw	%f6, 1(%a2)
	lw	%a2, 5(%a1)

	nop
	fsub	%f6, %f3, %f6
	flw	%f7, 2(%a2)
	lw	%a2, 1(%a1)

	nop
	nop
	nop
	fsub	%f7, %f4, %f7

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.26288

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.26290

	nop
	nop
	fmul	%f8, %f5, %f5
	lw	%a2, 4(%a1)

	nop
	nop
	flw	%f9, 0(%a2)
	lw	%a2, 4(%a1)

	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	flw	%f10, 1(%a2)
	lw	%a2, 4(%a1)

	nop
	fmul	%f9, %f9, %f10
	flw	%f10, 2(%a2)
	lw	%a2, 3(%a1)

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	nop
	nop
	fadd	%f8, %f8, %f9

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.26292

	nop
	fmul	%f9, %f6, %f7
	lw	%a2, 9(%a1)
	fmul	%f7, %f7, %f5

	nop
	flw	%f10, 0(%a2)
	lw	%a2, 9(%a1)
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 1(%a2)
	lw	%a2, 9(%a1)

	nop
	nop
	fmul	%f7, %f7, %f9
	flw	%f6, 2(%a2)

	nop
	nop
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fadd	%f5, %f7, %f5

	nop
	nop
	nop
	j	bnei_cont.26293

bnei_else.26292:
	nop
	nop
	nop
	fmov	%f5, %f8

bnei_cont.26293:
	nop
	nop
	nop
	lw	%a2, 1(%a1)

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.26294

	nop
	nop
	nop
	j	bnei_cont.26295

bnei_else.26294:
	nop
	nop
	nop
	flw	%f6, 474(%zero)

	nop
	nop
	nop
	fsub	%f5, %f5, %f6

bnei_cont.26295:
	nop
	nop
	nop
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.26296

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26297

fbgt_else.26296:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.26297:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26298

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.26300

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26299

bnei_else.26300:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.26301:
	nop
	nop
	nop
	j	bnei_cont.26299

bnei_else.26298:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.26299:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26302

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26289

bnei_else.26302:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.26303:
	nop
	nop
	nop
	j	bnei_cont.26289

bnei_else.26290:
	nop
	nop
	lw	%a2, 4(%a1)
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	flw	%f8, 0(%a2)

	nop
	nop
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%a2)

	nop
	nop
	nop
	fmul	%f6, %f8, %f6

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%a2)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f5, %f5, %f6

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.26304

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26305

fbgt_else.26304:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.26305:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26306

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.26308

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26307

bnei_else.26308:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.26309:
	nop
	nop
	nop
	j	bnei_cont.26307

bnei_else.26306:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.26307:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26310

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26289

bnei_else.26310:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.26311:
bnei_cont.26291:
	nop
	nop
	nop
	j	bnei_cont.26289

bnei_else.26288:
	nop
	nop
	fabs	%f1, %f5
	lw	%a2, 4(%a1)

	nop
	nop
	nop
	flw	%f5, 0(%a2)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.26312

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26313

fbgt_else.26312:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.26313:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.26314

	nop
	nop
	fabs	%f1, %f6
	lw	%a2, 4(%a1)

	nop
	nop
	nop
	flw	%f5, 1(%a2)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.26316

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26317

fbgt_else.26316:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.26317:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.26318

	nop
	nop
	fabs	%f1, %f7
	lw	%a2, 4(%a1)

	nop
	nop
	nop
	flw	%f5, 2(%a2)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.26320

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26315

fbgt_else.26320:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.26321:
	nop
	nop
	nop
	j	bnei_cont.26315

bnei_else.26318:
	nop
	nop
	nop
	addi	%a2, %zero, 0

bnei_cont.26319:
	nop
	nop
	nop
	j	bnei_cont.26315

bnei_else.26314:
	nop
	nop
	nop
	addi	%a2, %zero, 0

bnei_cont.26315:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.26322

	nop
	nop
	nop
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	j	bnei_cont.26323

bnei_else.26322:
	nop
	nop
	nop
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26324

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26325

bnei_else.26324:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.26325:
bnei_cont.26323:
bnei_cont.26289:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26326

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26287

bnei_else.26326:
	lw	%a1, 1(%sp)
	fmov	%f1, %f3
	fmov	%f0, %f2
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%v0, %a1, 0
	fmov	%f2, %f4

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	check_all_inside.2919

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

bnei_cont.26327:
	nop
	nop
	nop
	j	bnei_cont.26287

bnei_else.26286:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.26287:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26281

	nop
	nop
	flw	%f0, 13(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	fsw	%f0, 137(%zero)
	flw	%f0, 12(%sp)

	nop
	nop
	fsw	%f0, 138(%zero)
	flw	%f0, 11(%sp)

	nop
	nop
	fsw	%f0, 139(%zero)
	flw	%f0, 10(%sp)

	nop
	nop
	nop
	fsw	%f0, 140(%zero)

	nop
	nop
	sw	%v0, 141(%zero)
	lw	%v0, 9(%sp)

	nop
	nop
	nop
	sw	%v0, 136(%zero)

	nop
	nop
	nop
	j	bnei_cont.26281

bnei_else.26328:
bnei_cont.26329:
	nop
	nop
	nop
	j	bnei_cont.26281

bnei_else.26284:
bnei_cont.26285:
	nop
	nop
	nop
	j	bnei_cont.26281

bnei_else.26280:
bnei_cont.26281:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	j	solve_each_element.2934

bnei_else.26277:
	nop
	nop
	nop
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26330

	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	j	solve_each_element.2934

bnei_else.26330:
	nop
	nop
	nop
	jr	%ra

bnei_else.26268:
	nop
	nop
	nop
	jr	%ra

solve_one_or_network.2938:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.26365

	nop
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	sw	%v1, 2(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	sw	%v0, 3(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26366

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26367

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26368

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26369

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26370

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26371

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26372

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)

	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	solve_one_or_network.2938

bnei_else.26372:
	nop
	nop
	nop
	jr	%ra

bnei_else.26371:
	nop
	nop
	nop
	jr	%ra

bnei_else.26370:
	nop
	nop
	nop
	jr	%ra

bnei_else.26369:
	nop
	nop
	nop
	jr	%ra

bnei_else.26368:
	nop
	nop
	nop
	jr	%ra

bnei_else.26367:
	nop
	nop
	nop
	jr	%ra

bnei_else.26366:
	nop
	nop
	nop
	jr	%ra

bnei_else.26365:
	nop
	nop
	nop
	jr	%ra

trace_or_matrix.2942:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a2, %zero, 0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	lw	%a3, 0(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.26502

	nop
	nop
	nop
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	beqi	%a3, 99, bnei_else.26503

	nop
	nop
	lw	%a3, 12(%a3)
	flw	%f0, 159(%zero)

	nop
	nop
	lw	%t0, 5(%a3)
	sw	%a1, 4(%sp)

	nop
	nop
	flw	%f1, 0(%t0)
	lw	%t0, 5(%a3)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 160(%zero)
	flw	%f2, 1(%t0)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 161(%zero)
	lw	%t0, 5(%a3)

	nop
	nop
	flw	%f3, 2(%t0)
	lw	%t0, 1(%a3)

	nop
	nop
	nop
	fsub	%f2, %f2, %f3

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.26505

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.26507

	nop
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solver_second.2830

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.26506

bnei_else.26507:
	nop
	nop
	lw	%a3, 4(%a3)
	flw	%f3, 0(%a0)

	nop
	nop
	flw	%f4, 0(%a3)
	flw	%f5, 1(%a0)

	nop
	fmul	%f3, %f3, %f4
	flw	%f6, 1(%a3)
	flw	%f7, 2(%a3)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fadd	%f3, %f3, %f5
	flw	%f5, 470(%zero)

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.26509

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26510

fbgt_else.26509:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.26510:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.26511

	nop
	nop
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26506

bnei_else.26511:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26512:
bnei_cont.26508:
	nop
	nop
	nop
	j	bnei_cont.26506

bnei_else.26505:
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solver_rect.2805

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

bnei_cont.26506:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26504

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.26515

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26516

fbgt_else.26515:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.26516:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26504

	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26504

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26504

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26504

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26504

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26504

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26504

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 7(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26504

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 8

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_one_or_network.2938

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26531:
bnei_cont.26532:
	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26529:
bnei_cont.26530:
	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26527:
bnei_cont.26528:
	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26525:
bnei_cont.26526:
	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26523:
bnei_cont.26524:
	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26521:
bnei_cont.26522:
	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26519:
bnei_cont.26520:
	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26517:
bnei_cont.26518:
	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26513:
bnei_cont.26514:
	nop
	nop
	nop
	j	bnei_cont.26504

bnei_else.26503:
	nop
	nop
	nop
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.26533

	nop
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %a3, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26534

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26534

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26534

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26534

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26534

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 7(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26534

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 8

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_one_or_network.2938

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.26534

bnei_else.26545:
bnei_cont.26546:
	nop
	nop
	nop
	j	bnei_cont.26534

bnei_else.26543:
bnei_cont.26544:
	nop
	nop
	nop
	j	bnei_cont.26534

bnei_else.26541:
bnei_cont.26542:
	nop
	nop
	nop
	j	bnei_cont.26534

bnei_else.26539:
bnei_cont.26540:
	nop
	nop
	nop
	j	bnei_cont.26534

bnei_else.26537:
bnei_cont.26538:
	nop
	nop
	nop
	j	bnei_cont.26534

bnei_else.26535:
bnei_cont.26536:
	nop
	nop
	nop
	j	bnei_cont.26534

bnei_else.26533:
bnei_cont.26534:
bnei_cont.26504:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a1, 0(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.26547

	nop
	nop
	nop
	sw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.26548

	addi	%a2, %zero, 159
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v0, %a1, 0

	nop
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solver.2836

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26549

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.26552

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26553

fbgt_else.26552:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.26553:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26549

	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26549

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26549

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26549

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26549

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26549

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26549

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 7

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_one_or_network.2938

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.26549

bnei_else.26566:
bnei_cont.26567:
	nop
	nop
	nop
	j	bnei_cont.26549

bnei_else.26564:
bnei_cont.26565:
	nop
	nop
	nop
	j	bnei_cont.26549

bnei_else.26562:
bnei_cont.26563:
	nop
	nop
	nop
	j	bnei_cont.26549

bnei_else.26560:
bnei_cont.26561:
	nop
	nop
	nop
	j	bnei_cont.26549

bnei_else.26558:
bnei_cont.26559:
	nop
	nop
	nop
	j	bnei_cont.26549

bnei_else.26556:
bnei_cont.26557:
	nop
	nop
	nop
	j	bnei_cont.26549

bnei_else.26554:
bnei_cont.26555:
	nop
	nop
	nop
	j	bnei_cont.26549

bnei_else.26550:
bnei_cont.26551:
	nop
	nop
	nop
	j	bnei_cont.26549

bnei_else.26548:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.26568

	nop
	nop
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)

	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%a0, %a3, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26569

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26569

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26569

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26569

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26569

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 7

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_one_or_network.2938

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.26569

bnei_else.26578:
bnei_cont.26579:
	nop
	nop
	nop
	j	bnei_cont.26569

bnei_else.26576:
bnei_cont.26577:
	nop
	nop
	nop
	j	bnei_cont.26569

bnei_else.26574:
bnei_cont.26575:
	nop
	nop
	nop
	j	bnei_cont.26569

bnei_else.26572:
bnei_cont.26573:
	nop
	nop
	nop
	j	bnei_cont.26569

bnei_else.26570:
bnei_cont.26571:
	nop
	nop
	nop
	j	bnei_cont.26569

bnei_else.26568:
bnei_cont.26569:
bnei_cont.26549:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	trace_or_matrix.2942

bnei_else.26547:
	nop
	nop
	nop
	jr	%ra

bnei_else.26502:
	nop
	nop
	nop
	jr	%ra

solve_each_element_fast.2948:
	nop
	nop
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a2, 0(%at)

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.26615

	nop
	lw	%a3, 12(%a2)
	addi	%t1, %zero, 1
	lw	%t2, 1(%a0)

	nop
	lw	%t0, 10(%a3)
	add	%at, %t2, %a2
	lw	%t3, 1(%a3)

	nop
	nop
	flw	%f0, 0(%t0)
	flw	%f1, 1(%t0)

	nop
	nop
	flw	%f2, 2(%t0)
	lw	%t2, 0(%at)

	nop
	nop
	nop
	sw	%a2, 0(%sp)

	nop
	nop
	nop
	sw	%t1, 1(%sp)

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
	sw	%v1, 4(%sp)

	nop
	nop
	nop
	sw	%v0, 5(%sp)

	nop
	nop
	nop
	sw	%a3, 6(%sp)

	nop
	nop
	nop
	beqi	%t3, 1, bnei_else.26616

	nop
	nop
	nop
	beqi	%t3, 2, bnei_else.26618

	nop
	nop
	flw	%f3, 0(%t2)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.26620

	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.26621

fbeq_else.26620:
	nop
	nop
	nop
	addi	%t3, %zero, 0

fbeq_cont.26621:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.26622

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26617

bnei_else.26622:
	nop
	nop
	nop
	flw	%f5, 1(%t2)

	nop
	nop
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%t2)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t2)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t0)

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1

	nop
	nop
	nop
	fsub	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.26624

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26625

fbgt_else.26624:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.26625:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.26626

	nop
	nop
	nop
	lw	%t0, 6(%a3)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.26628

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%t2)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.26629

bnei_else.26628:
	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%t2)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

bnei_cont.26629:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26617

bnei_else.26626:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26627:
bnei_cont.26623:
	nop
	nop
	nop
	j	bnei_cont.26617

bnei_else.26618:
	nop
	nop
	flw	%f0, 0(%t2)
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.26630

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26631

fbgt_else.26630:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.26631:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.26632

	nop
	nop
	nop
	flw	%f1, 3(%t0)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26617

bnei_else.26632:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26633:
bnei_cont.26619:
	nop
	nop
	nop
	j	bnei_cont.26617

bnei_else.26616:
	lw	%t0, 0(%a0)
	addi	%a0, %t2, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%v1, %t0, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solver_rect_fast.2840

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

bnei_cont.26617:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26634

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.26635

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26636

fbgt_else.26635:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.26636:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.26637

	nop
	nop
	nop
	flw	%f2, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.26639

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26640

fbgt_else.26639:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.26640:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_cont.26638

	nop
	nop
	flw	%f2, 456(%zero)
	lw	%v1, 2(%sp)

	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 0(%v1)
	flw	%f3, 162(%zero)

	nop
	fmul	%f2, %f2, %f0
	flw	%f4, 163(%zero)
	flw	%f5, 164(%zero)

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 1(%v1)

	nop
	nop
	nop
	fmul	%f3, %f3, %f0

	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)
	lw	%v1, 4(%sp)

	nop
	fmul	%f4, %f4, %f0
	lw	%a0, 0(%v1)
	sw	%v0, 7(%sp)

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	fsw	%f4, 8(%sp)

	nop
	nop
	nop
	fsw	%f3, 9(%sp)

	nop
	nop
	nop
	fsw	%f2, 10(%sp)

	nop
	nop
	nop
	fsw	%f0, 11(%sp)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26643

	nop
	nop
	nop
	lw	%a0, 12(%a0)

	nop
	nop
	nop
	lw	%a1, 5(%a0)

	nop
	nop
	flw	%f5, 0(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f5, %f2, %f5
	flw	%f6, 1(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f6, %f3, %f6
	flw	%f7, 2(%a1)
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	fsub	%f7, %f4, %f7

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.26645

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.26647

	nop
	nop
	fmul	%f8, %f5, %f5
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f9, 0(%a1)
	lw	%a1, 4(%a0)

	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	flw	%f10, 1(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f9, %f9, %f10
	flw	%f10, 2(%a1)
	lw	%a1, 3(%a0)

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	nop
	nop
	fadd	%f8, %f8, %f9

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26649

	nop
	fmul	%f9, %f6, %f7
	lw	%a1, 9(%a0)
	fmul	%f7, %f7, %f5

	nop
	flw	%f10, 0(%a1)
	lw	%a1, 9(%a0)
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 1(%a1)
	lw	%a1, 9(%a0)

	nop
	nop
	fmul	%f7, %f7, %f9
	flw	%f6, 2(%a1)

	nop
	nop
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fadd	%f5, %f7, %f5

	nop
	nop
	nop
	j	bnei_cont.26650

bnei_else.26649:
	nop
	nop
	nop
	fmov	%f5, %f8

bnei_cont.26650:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.26651

	nop
	nop
	nop
	j	bnei_cont.26652

bnei_else.26651:
	nop
	nop
	nop
	flw	%f6, 474(%zero)

	nop
	nop
	nop
	fsub	%f5, %f5, %f6

bnei_cont.26652:
	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.26653

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26654

fbgt_else.26653:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.26654:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26655

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26657

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26656

bnei_else.26657:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.26658:
	nop
	nop
	nop
	j	bnei_cont.26656

bnei_else.26655:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.26656:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26659

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26646

bnei_else.26659:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.26660:
	nop
	nop
	nop
	j	bnei_cont.26646

bnei_else.26647:
	nop
	nop
	lw	%a1, 4(%a0)
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	flw	%f8, 0(%a1)

	nop
	nop
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%a1)

	nop
	nop
	nop
	fmul	%f6, %f8, %f6

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%a1)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f5, %f5, %f6

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.26661

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26662

fbgt_else.26661:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.26662:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26663

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26665

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26664

bnei_else.26665:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.26666:
	nop
	nop
	nop
	j	bnei_cont.26664

bnei_else.26663:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.26664:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26667

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26646

bnei_else.26667:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.26668:
bnei_cont.26648:
	nop
	nop
	nop
	j	bnei_cont.26646

bnei_else.26645:
	nop
	nop
	fabs	%f1, %f5
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f5, 0(%a1)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.26669

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26670

fbgt_else.26669:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.26670:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26671

	nop
	nop
	fabs	%f1, %f6
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f5, 1(%a1)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.26673

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26674

fbgt_else.26673:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.26674:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26675

	nop
	nop
	fabs	%f1, %f7
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f5, 2(%a1)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.26677

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26672

fbgt_else.26677:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.26678:
	nop
	nop
	nop
	j	bnei_cont.26672

bnei_else.26675:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.26676:
	nop
	nop
	nop
	j	bnei_cont.26672

bnei_else.26671:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.26672:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.26679

	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	j	bnei_cont.26680

bnei_else.26679:
	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26681

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26682

bnei_else.26681:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.26682:
bnei_cont.26680:
bnei_cont.26646:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.26683

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26644

bnei_else.26683:
	lw	%a0, 1(%sp)
	fmov	%f1, %f3
	fmov	%f0, %f2
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	fmov	%f2, %f4

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	check_all_inside.2919

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

bnei_cont.26684:
	nop
	nop
	nop
	j	bnei_cont.26644

bnei_else.26643:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.26644:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26638

	nop
	nop
	flw	%f0, 11(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	fsw	%f0, 137(%zero)
	flw	%f0, 10(%sp)

	nop
	nop
	fsw	%f0, 138(%zero)
	flw	%f0, 9(%sp)

	nop
	nop
	fsw	%f0, 139(%zero)
	flw	%f0, 8(%sp)

	nop
	nop
	nop
	fsw	%f0, 140(%zero)

	nop
	nop
	sw	%v0, 141(%zero)
	lw	%v0, 7(%sp)

	nop
	nop
	nop
	sw	%v0, 136(%zero)

	nop
	nop
	nop
	j	bnei_cont.26638

bnei_else.26685:
bnei_cont.26686:
	nop
	nop
	nop
	j	bnei_cont.26638

bnei_else.26641:
bnei_cont.26642:
	nop
	nop
	nop
	j	bnei_cont.26638

bnei_else.26637:
bnei_cont.26638:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	j	solve_each_element_fast.2948

bnei_else.26634:
	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v0, 6(%v0)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26687

	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	j	solve_each_element_fast.2948

bnei_else.26687:
	nop
	nop
	nop
	jr	%ra

bnei_else.26615:
	nop
	nop
	nop
	jr	%ra

solve_one_or_network_fast.2952:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.26722

	nop
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	sw	%v1, 2(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	sw	%v0, 3(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26723

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26724

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26725

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26726

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26727

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26728

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.26729

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)

	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	solve_one_or_network_fast.2952

bnei_else.26729:
	nop
	nop
	nop
	jr	%ra

bnei_else.26728:
	nop
	nop
	nop
	jr	%ra

bnei_else.26727:
	nop
	nop
	nop
	jr	%ra

bnei_else.26726:
	nop
	nop
	nop
	jr	%ra

bnei_else.26725:
	nop
	nop
	nop
	jr	%ra

bnei_else.26724:
	nop
	nop
	nop
	jr	%ra

bnei_else.26723:
	nop
	nop
	nop
	jr	%ra

bnei_else.26722:
	nop
	nop
	nop
	jr	%ra

trace_or_matrix_fast.2956:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a2, %zero, 0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	lw	%a3, 0(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.26849

	nop
	nop
	nop
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	beqi	%a3, 99, bnei_else.26850

	nop
	nop
	lw	%t0, 12(%a3)
	lw	%t2, 1(%a0)

	nop
	lw	%t1, 10(%t0)
	add	%at, %t2, %a3
	lw	%t2, 1(%t0)

	nop
	nop
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)

	nop
	nop
	flw	%f2, 2(%t1)
	lw	%a3, 0(%at)

	nop
	nop
	nop
	sw	%a1, 4(%sp)

	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.26852

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.26854

	nop
	nop
	flw	%f3, 0(%a3)
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.26856

	nop
	nop
	nop
	addi	%t2, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.26857

fbeq_else.26856:
	nop
	nop
	nop
	addi	%t2, %zero, 0

fbeq_cont.26857:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.26858

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.26853

bnei_else.26858:
	nop
	nop
	nop
	flw	%f5, 1(%a3)

	nop
	nop
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%a3)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a3)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t1)

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1

	nop
	nop
	nop
	fsub	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.26860

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26861

fbgt_else.26860:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.26861:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.26862

	nop
	nop
	nop
	lw	%t0, 6(%t0)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.26864

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a3)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.26865

bnei_else.26864:
	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a3)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

bnei_cont.26865:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26853

bnei_else.26862:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26863:
bnei_cont.26859:
	nop
	nop
	nop
	j	bnei_cont.26853

bnei_else.26854:
	nop
	nop
	flw	%f0, 0(%a3)
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.26866

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26867

fbgt_else.26866:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.26867:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.26868

	nop
	nop
	nop
	flw	%f1, 3(%t1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.26853

bnei_else.26868:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.26869:
bnei_cont.26855:
	nop
	nop
	nop
	j	bnei_cont.26853

bnei_else.26852:
	lw	%t1, 0(%a0)
	addi	%a0, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%v1, %t1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solver_rect_fast.2840

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

bnei_cont.26853:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26851

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.26872

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26873

fbgt_else.26872:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.26873:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26851

	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26851

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26851

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26851

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26851

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26851

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26851

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 7(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26851

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 8

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26888:
bnei_cont.26889:
	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26886:
bnei_cont.26887:
	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26884:
bnei_cont.26885:
	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26882:
bnei_cont.26883:
	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26880:
bnei_cont.26881:
	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26878:
bnei_cont.26879:
	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26876:
bnei_cont.26877:
	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26874:
bnei_cont.26875:
	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26870:
bnei_cont.26871:
	nop
	nop
	nop
	j	bnei_cont.26851

bnei_else.26850:
	nop
	nop
	nop
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.26890

	nop
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %a3, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26891

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26891

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26891

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26891

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26891

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 7(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26891

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 8

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.26891

bnei_else.26902:
bnei_cont.26903:
	nop
	nop
	nop
	j	bnei_cont.26891

bnei_else.26900:
bnei_cont.26901:
	nop
	nop
	nop
	j	bnei_cont.26891

bnei_else.26898:
bnei_cont.26899:
	nop
	nop
	nop
	j	bnei_cont.26891

bnei_else.26896:
bnei_cont.26897:
	nop
	nop
	nop
	j	bnei_cont.26891

bnei_else.26894:
bnei_cont.26895:
	nop
	nop
	nop
	j	bnei_cont.26891

bnei_else.26892:
bnei_cont.26893:
	nop
	nop
	nop
	j	bnei_cont.26891

bnei_else.26890:
bnei_cont.26891:
bnei_cont.26851:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a1, 0(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.26904

	nop
	nop
	nop
	sw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.26905

	nop
	lw	%a2, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	addi	%v1, %a2, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solver_fast2.2877

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26906

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.26909

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.26910

fbgt_else.26909:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.26910:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.26906

	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26906

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26906

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26906

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26906

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26906

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26906

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 7

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.26906

bnei_else.26923:
bnei_cont.26924:
	nop
	nop
	nop
	j	bnei_cont.26906

bnei_else.26921:
bnei_cont.26922:
	nop
	nop
	nop
	j	bnei_cont.26906

bnei_else.26919:
bnei_cont.26920:
	nop
	nop
	nop
	j	bnei_cont.26906

bnei_else.26917:
bnei_cont.26918:
	nop
	nop
	nop
	j	bnei_cont.26906

bnei_else.26915:
bnei_cont.26916:
	nop
	nop
	nop
	j	bnei_cont.26906

bnei_else.26913:
bnei_cont.26914:
	nop
	nop
	nop
	j	bnei_cont.26906

bnei_else.26911:
bnei_cont.26912:
	nop
	nop
	nop
	j	bnei_cont.26906

bnei_else.26907:
bnei_cont.26908:
	nop
	nop
	nop
	j	bnei_cont.26906

bnei_else.26905:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.26925

	nop
	nop
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)

	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%a0, %a3, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26926

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26926

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26926

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26926

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.26926

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 7

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.26926

bnei_else.26935:
bnei_cont.26936:
	nop
	nop
	nop
	j	bnei_cont.26926

bnei_else.26933:
bnei_cont.26934:
	nop
	nop
	nop
	j	bnei_cont.26926

bnei_else.26931:
bnei_cont.26932:
	nop
	nop
	nop
	j	bnei_cont.26926

bnei_else.26929:
bnei_cont.26930:
	nop
	nop
	nop
	j	bnei_cont.26926

bnei_else.26927:
bnei_cont.26928:
	nop
	nop
	nop
	j	bnei_cont.26926

bnei_else.26925:
bnei_cont.26926:
bnei_cont.26906:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	trace_or_matrix_fast.2956

bnei_else.26904:
	nop
	nop
	nop
	jr	%ra

bnei_else.26849:
	nop
	nop
	nop
	jr	%ra

get_nvector_second.2966:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f3, %f0, %f3
	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f4, %f1, %f4
	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	fmul	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.26940

	nop
	nop
	nop
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f6, %f1, %f6
	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f7, %f2, %f7

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 473(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f3, %f3, %f6

	nop
	nop
	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)

	nop
	nop
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f6

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f7

	nop
	nop
	nop
	fadd	%f2, %f4, %f2

	nop
	nop
	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)

	nop
	nop
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	flw	%f2, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f7

	nop
	nop
	nop
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.26941

bnei_else.26940:
	nop
	nop
	nop
	fsw	%f3, 142(%zero)

	nop
	nop
	nop
	fsw	%f4, 143(%zero)

	nop
	nop
	nop
	fsw	%f5, 144(%zero)

bnei_cont.26941:
	nop
	nop
	lw	%v0, 6(%v0)
	flw	%f0, 142(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)

	nop
	nop
	nop
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 470(%zero)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.26942

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.26943

fbeq_else.26942:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.26943:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.26944

	nop
	nop
	nop
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.26945

bnei_else.26944:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.26946

	nop
	nop
	nop
	flw	%f4, 458(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f4, %f1

	nop
	nop
	nop
	j	bnei_cont.26947

bnei_else.26946:
	nop
	nop
	nop
	flw	%f4, 474(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f4, %f1

bnei_cont.26947:
bnei_cont.26945:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	jr	%ra

utexture.2971:
	nop
	nop
	lw	%a0, 0(%v0)
	lw	%a1, 8(%v0)

	nop
	nop
	flw	%f0, 0(%a1)
	lw	%a1, 8(%v0)

	nop
	nop
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a1)

	nop
	nop
	fsw	%f0, 146(%zero)
	lw	%a1, 8(%v0)

	nop
	nop
	nop
	flw	%f0, 2(%a1)

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.27048

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.27049

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.27050

	nop
	nop
	nop
	beqi	%a0, 4, bnei_else.27051

	nop
	nop
	nop
	jr	%ra

bnei_else.27051:
	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)

	nop
	nop
	flw	%f1, 0(%a0)
	lw	%a0, 4(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 0(%a0)
	lw	%a0, 5(%v0)

	nop
	fsqrt	%f1, %f1
	flw	%f2, 2(%a0)
	lw	%a0, 4(%v0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f4, 454(%zero)

	nop
	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%a0)

	nop
	nop
	nop
	fsqrt	%f2, %f2

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	nop
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.27053

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27054

fbgt_else.27053:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.27054:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27055

	nop
	nop
	nop
	flw	%f0, 453(%zero)

	nop
	nop
	nop
	j	bnei_cont.27056

bnei_else.27055:
	nop
	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27057

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.27058

fbgt_else.27057:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbgt_cont.27058:
	nop
	nop
	fabs	%f1, %f0
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.27059

	nop
	nop
	nop
	flw	%f0, 462(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27061

	nop
	nop
	flw	%f0, 479(%zero)
	flw	%f3, 474(%zero)

	nop
	fdiv	%f1, %f3, %f1
	flw	%f7, 468(%zero)
	flw	%f8, 467(%zero)

	nop
	nop
	fmul	%f3, %f1, %f1
	fmul	%f7, %f7, %f1

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f1, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 466(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 465(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 464(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 463(%zero)

	nop
	nop
	nop
	fmul	%f1, %f7, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fmul	%f1, %f1, %f6

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.27062

fbgt_else.27061:
	nop
	nop
	flw	%f0, 478(%zero)
	flw	%f3, 474(%zero)

	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3
	flw	%f7, 468(%zero)
	flw	%f8, 467(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	fmul	%f3, %f1, %f1
	fmul	%f7, %f7, %f1

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f1, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 466(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 465(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 464(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 463(%zero)

	nop
	nop
	nop
	fmul	%f1, %f7, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fmul	%f1, %f1, %f6

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

fbgt_cont.27062:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27063

	nop
	nop
	nop
	j	fbgt_cont.27060

bnei_else.27063:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.27064:
	nop
	nop
	nop
	j	fbgt_cont.27060

fbgt_else.27059:
	nop
	fmul	%f1, %f0, %f0
	flw	%f6, 468(%zero)
	flw	%f7, 467(%zero)

	nop
	nop
	fmul	%f3, %f1, %f1
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f6, %f6, %f1

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 466(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 465(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f1, %f7, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	fsub	%f1, %f6, %f1
	flw	%f6, 463(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f3

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

fbgt_cont.27060:
	nop
	nop
	nop
	flw	%f1, 452(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 451(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

bnei_cont.27056:
	nop
	nop
	nop
	floor	%f1, %f0

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f3, 1(%v1)
	lw	%v0, 4(%v0)

	nop
	nop
	fsub	%f1, %f1, %f3
	flw	%f3, 1(%v0)

	nop
	nop
	nop
	fsqrt	%f3, %f3

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.27065

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27066

fbgt_else.27065:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27066:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27067

	nop
	nop
	nop
	flw	%f1, 453(%zero)

	nop
	nop
	nop
	j	bnei_cont.27068

bnei_else.27067:
	nop
	nop
	fdiv	%f1, %f1, %f2
	flw	%f2, 470(%zero)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.27069

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.27070

fbgt_else.27069:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.27070:
	nop
	nop
	fabs	%f2, %f1
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.27071

	nop
	nop
	nop
	flw	%f1, 462(%zero)

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.27073

	nop
	nop
	flw	%f1, 479(%zero)
	flw	%f3, 474(%zero)

	nop
	fdiv	%f2, %f3, %f2
	flw	%f6, 468(%zero)
	flw	%f7, 467(%zero)

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f6, %f6, %f2

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fsub	%f6, %f2, %f6

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 466(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 465(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 463(%zero)

	nop
	nop
	nop
	fmul	%f2, %f6, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f5

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fsub	%f1, %f1, %f2

	nop
	nop
	nop
	j	fbgt_cont.27074

fbgt_else.27073:
	nop
	nop
	flw	%f1, 478(%zero)
	flw	%f3, 474(%zero)

	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3
	flw	%f6, 468(%zero)
	flw	%f7, 467(%zero)

	nop
	nop
	nop
	fdiv	%f2, %f4, %f2

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f6, %f6, %f2

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fsub	%f6, %f2, %f6

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 466(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 465(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 463(%zero)

	nop
	nop
	nop
	fmul	%f2, %f6, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f5

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

fbgt_cont.27074:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27075

	nop
	nop
	nop
	j	fbgt_cont.27072

bnei_else.27075:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.27076:
	nop
	nop
	nop
	j	fbgt_cont.27072

fbgt_else.27071:
	nop
	fmul	%f2, %f1, %f1
	flw	%f5, 468(%zero)
	flw	%f6, 467(%zero)

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f5, %f5, %f1

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f5, %f5, %f2

	nop
	nop
	fsub	%f5, %f1, %f5
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f3

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 466(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f2

	nop
	nop
	nop
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 465(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 464(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f2, %f6, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	fsub	%f2, %f5, %f2
	flw	%f5, 463(%zero)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fadd	%f1, %f2, %f1

fbgt_cont.27072:
	nop
	nop
	nop
	flw	%f2, 452(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 451(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f2

bnei_cont.27068:
	nop
	nop
	floor	%f2, %f1
	flw	%f3, 473(%zero)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 450(%zero)
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27077

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27078

fbgt_else.27077:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27078:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27079

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.27080

bnei_else.27079:
bnei_cont.27080:
	nop
	nop
	nop
	flw	%f1, 449(%zero)

	nop
	nop
	fmul	%f0, %f1, %f0
	flw	%f1, 448(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.27050:
	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)

	nop
	nop
	flw	%f1, 0(%a0)
	lw	%v0, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%v0)

	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 494(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 447(%zero)

	nop
	nop
	nop
	fsqrt	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f0

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 451(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 495(%zero)

	nop
	nop
	fabs	%f0, %f0
	fsw	%f1, 0(%sp)

	nop
	nop
	nop
	fsw	%f0, 1(%sp)

	nop
	nop
	nop
	fsw	%f2, 2(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.27082

	nop
	nop
	nop
	flw	%f3, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27084

	nop
	nop
	nop
	flw	%f3, 492(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27086

	nop
	nop
	nop
	flw	%f3, 491(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27088

	nop
	nop
	nop
	flw	%f3, 490(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27090

	nop
	nop
	nop
	flw	%f3, 489(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27092

	nop
	nop
	nop
	flw	%f3, 488(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27094

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27096

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27098

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27100

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27102

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27104

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27106

	nop
	nop
	flw	%f3, 481(%zero)
	sw	%ra, 3(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27106:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27107:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27104:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27105:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27102:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27103:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27100:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27101:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27098:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27099:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27096:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27097:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27094:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27095:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27092:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27093:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27090:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27091:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27088:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27089:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27086:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27087:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27084:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27085:
	nop
	nop
	nop
	j	fbgt_cont.27083

fbgt_else.27082:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.27083:
	nop
	nop
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.27108

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27110

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 3(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	j	fbgt_cont.27109

fbgt_else.27110:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 3(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 4

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

fbgt_cont.27111:
	nop
	nop
	nop
	j	fbgt_cont.27109

fbgt_else.27108:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.27109:
	nop
	nop
	nop
	flw	%f1, 0(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27112

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27113

fbgt_else.27112:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27113:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27114

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.27115

fbgt_else.27114:
fbgt_cont.27115:
	nop
	nop
	nop
	flw	%f2, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.27116

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27118

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27117

bnei_else.27118:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.27119:
	nop
	nop
	nop
	j	fbgt_cont.27117

fbgt_else.27116:
fbgt_cont.27117:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.27120

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.27121

fbgt_else.27120:
fbgt_cont.27121:
	nop
	nop
	nop
	flw	%f1, 478(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27122

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.27123

fbgt_else.27122:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.27123:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27124

	nop
	nop
	nop
	j	bnei_cont.27125

bnei_else.27124:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.27125:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 449(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	fsw	%f2, 146(%zero)

	nop
	nop
	nop
	flw	%f2, 474(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.27049:
	nop
	nop
	flw	%f0, 1(%v1)
	flw	%f1, 446(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 495(%zero)
	flw	%f2, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.27127

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.27128

fbgt_else.27127:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.27128:
	nop
	fabs	%f0, %f0
	flw	%f2, 494(%zero)
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	fsw	%f1, 4(%sp)

	nop
	nop
	nop
	fsw	%f0, 5(%sp)

	nop
	nop
	nop
	fsw	%f2, 6(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.27129

	nop
	nop
	nop
	flw	%f3, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27131

	nop
	nop
	nop
	flw	%f3, 492(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27133

	nop
	nop
	nop
	flw	%f3, 491(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27135

	nop
	nop
	nop
	flw	%f3, 490(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27137

	nop
	nop
	nop
	flw	%f3, 489(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27139

	nop
	nop
	nop
	flw	%f3, 488(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27141

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27143

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27145

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27147

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27149

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27151

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.27153

	nop
	nop
	flw	%f3, 481(%zero)
	sw	%ra, 7(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27153:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27154:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27151:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27152:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27149:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27150:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27147:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27148:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27145:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27146:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27143:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27144:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27141:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27142:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27139:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27140:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27137:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27138:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27135:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27136:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27133:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27134:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27131:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.27132:
	nop
	nop
	nop
	j	fbgt_cont.27130

fbgt_else.27129:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.27130:
	nop
	nop
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.27155

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27157

	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	sw	%ra, 7(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	fbgt_cont.27156

fbgt_else.27157:
	nop
	flw	%f3, 496(%zero)
	fmov	%f29, %f1
	sw	%ra, 7(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 8

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

fbgt_cont.27158:
	nop
	nop
	nop
	j	fbgt_cont.27156

fbgt_else.27155:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.27156:
	nop
	nop
	nop
	flw	%f1, 4(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27159

	nop
	nop
	nop
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27161

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27160

bnei_else.27161:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.27162:
	nop
	nop
	nop
	j	fbgt_cont.27160

fbgt_else.27159:
	nop
	nop
	nop
	lw	%v0, 3(%sp)

fbgt_cont.27160:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27163

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.27164

fbgt_else.27163:
fbgt_cont.27164:
	nop
	nop
	nop
	flw	%f2, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.27165

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.27166

fbgt_else.27165:
fbgt_cont.27166:
	nop
	nop
	nop
	flw	%f1, 478(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27167

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.27168

fbgt_else.27167:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.27168:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27169

	nop
	nop
	nop
	j	bnei_cont.27170

bnei_else.27169:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.27170:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 449(%zero)

	nop
	nop
	nop
	fmul	%f2, %f1, %f0

	nop
	nop
	nop
	fsw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 474(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 146(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.27048:
	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)

	nop
	nop
	flw	%f1, 0(%a0)
	flw	%f3, 444(%zero)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	floor	%f2, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 447(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.27172

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27173

fbgt_else.27172:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.27173:
	nop
	nop
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)

	nop
	nop
	nop
	flw	%f4, 2(%v0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f1, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.27174

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27175

fbgt_else.27174:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27175:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27176

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27178

	nop
	nop
	nop
	flw	%f0, 449(%zero)

	nop
	nop
	nop
	j	bnei_cont.27177

bnei_else.27178:
	nop
	nop
	nop
	flw	%f0, 470(%zero)

bnei_cont.27179:
	nop
	nop
	nop
	j	bnei_cont.27177

bnei_else.27176:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27180

	nop
	nop
	nop
	flw	%f0, 470(%zero)

	nop
	nop
	nop
	j	bnei_cont.27181

bnei_else.27180:
	nop
	nop
	nop
	flw	%f0, 449(%zero)

bnei_cont.27181:
bnei_cont.27177:
	nop
	nop
	nop
	fsw	%f0, 146(%zero)

	nop
	nop
	nop
	jr	%ra

trace_reflections.2978:
	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.27193

	nop
	nop
	lw	%a1, 254(%v0)
	flw	%f2, 443(%zero)

	nop
	nop
	lw	%a2, 1(%a1)
	fsw	%f2, 137(%zero)

	nop
	lw	%a3, 134(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	fsw	%f1, 1(%sp)

	nop
	nop
	sw	%v1, 2(%sp)
	addi	%v1, %a3, 0

	nop
	nop
	nop
	fsw	%f0, 3(%sp)

	nop
	nop
	nop
	sw	%a2, 4(%sp)

	nop
	nop
	nop
	sw	%a3, 5(%sp)

	nop
	nop
	sw	%a0, 6(%sp)
	addi	%a0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 7(%sp)

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
	nop
	jal	trace_or_matrix_fast.2956

	nop
	addi	%sp, %sp, -9
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27194

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27195

fbgt_else.27194:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27195:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27196

	nop
	nop
	nop
	flw	%f1, 442(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27198

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.27197

fbgt_else.27198:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27199:
	nop
	nop
	nop
	j	bnei_cont.27197

bnei_else.27196:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.27197:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27200

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 136(%zero)

	nop
	nop
	nop
	sll	%v0, %v0, 2

	nop
	nop
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%v1)

	nop
	nop
	nop
	bne	%v0, %a0, bnei_cont.27201

	nop
	nop
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27204

	nop
	nop
	nop
	j	bnei_cont.27201

bnei_else.27204:
	nop
	nop
	lw	%v0, 4(%sp)
	flw	%f0, 142(%zero)

	nop
	nop
	lw	%v1, 0(%v0)
	lw	%v0, 0(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	flw	%f2, 1(%v1)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f4, 0(%v0)

	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%v1)
	lw	%v1, 7(%sp)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f5, 1(%v0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 3(%sp)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	fmul	%f3, %f1, %f2

	nop
	nop
	fmul	%f0, %f3, %f0
	flw	%f3, 0(%v1)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f4, 1(%v1)

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%v0)

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	fmul	%f1, %f1, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.27206

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27207

fbgt_else.27206:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27207:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27208

	nop
	nop
	flw	%f4, 151(%zero)
	flw	%f5, 145(%zero)

	nop
	nop
	nop
	fmul	%f5, %f0, %f5

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	fsw	%f4, 151(%zero)

	nop
	nop
	flw	%f4, 152(%zero)
	flw	%f5, 146(%zero)

	nop
	nop
	nop
	fmul	%f5, %f0, %f5

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	fsw	%f4, 152(%zero)

	nop
	nop
	flw	%f4, 153(%zero)
	flw	%f5, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fadd	%f0, %f4, %f0

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.27209

bnei_else.27208:
bnei_cont.27209:
	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.27210

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27211

fbgt_else.27210:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27211:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.27201

	nop
	fmul	%f0, %f1, %f1
	flw	%f1, 1(%sp)
	flw	%f3, 151(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f3, %f3, %f0

	nop
	nop
	nop
	fsw	%f3, 151(%zero)

	nop
	nop
	nop
	flw	%f3, 152(%zero)

	nop
	nop
	nop
	fadd	%f3, %f3, %f0

	nop
	nop
	nop
	fsw	%f3, 152(%zero)

	nop
	nop
	nop
	flw	%f3, 153(%zero)

	nop
	nop
	nop
	fadd	%f0, %f3, %f0

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.27201

bnei_else.27212:
bnei_cont.27213:
bnei_cont.27205:
	nop
	nop
	nop
	j	bnei_cont.27201

beq_else.27202:
beq_cont.27203:
	nop
	nop
	nop
	j	bnei_cont.27201

bnei_else.27200:
bnei_cont.27201:
	nop
	nop
	lw	%v0, 0(%sp)
	flw	%f0, 3(%sp)

	nop
	addi	%v0, %v0, -1
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	j	trace_reflections.2978

bgti_else.27193:
	nop
	nop
	nop
	jr	%ra

trace_ray.2983:
	nop
	nop
	nop
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.27263

	nop
	lw	%a1, 2(%a0)
	addi	%a2, %zero, 0
	flw	%f2, 443(%zero)

	nop
	nop
	fsw	%f2, 137(%zero)
	fsw	%f1, 0(%sp)

	nop
	nop
	nop
	lw	%a3, 134(%zero)

	nop
	nop
	nop
	sw	%a3, 1(%sp)

	nop
	nop
	nop
	sw	%a2, 2(%sp)

	nop
	nop
	sw	%a0, 3(%sp)
	addi	%a0, %v1, 0

	nop
	nop
	nop
	fsw	%f0, 4(%sp)

	nop
	nop
	sw	%v1, 5(%sp)
	addi	%v1, %a3, 0

	nop
	nop
	sw	%v0, 6(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 7(%sp)

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
	nop
	jal	trace_or_matrix.2942

	nop
	addi	%sp, %sp, -9
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27264

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27265

fbgt_else.27264:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27265:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27266

	nop
	nop
	nop
	flw	%f1, 442(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27268

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.27267

fbgt_else.27268:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27269:
	nop
	nop
	nop
	j	bnei_cont.27267

bnei_else.27266:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.27267:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27270

	nop
	lw	%v0, 141(%zero)
	flw	%f2, 4(%sp)
	addi	%a2, %zero, 1

	nop
	nop
	lw	%v1, 12(%v0)
	fsw	%f0, 8(%sp)

	nop
	nop
	lw	%a0, 2(%v1)
	lw	%a1, 7(%v1)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 1(%v1)

	nop
	nop
	fmul	%f1, %f1, %f2
	sw	%a0, 9(%sp)

	nop
	nop
	nop
	fsw	%f1, 10(%sp)

	nop
	nop
	nop
	sw	%a2, 11(%sp)

	nop
	nop
	nop
	sw	%v0, 12(%sp)

	nop
	nop
	nop
	sw	%v1, 13(%sp)

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.27271

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.27273

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	get_nvector_second.2966

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bnei_cont.27272

bnei_else.27273:
	nop
	nop
	nop
	lw	%a1, 4(%v1)

	nop
	nop
	flw	%f3, 0(%a1)
	lw	%a1, 4(%v1)

	nop
	nop
	nop
	fneg	%f3, %f3

	nop
	nop
	fsw	%f3, 142(%zero)
	flw	%f3, 1(%a1)

	nop
	nop
	fneg	%f3, %f3
	lw	%a1, 4(%v1)

	nop
	nop
	fsw	%f3, 143(%zero)
	flw	%f3, 2(%a1)

	nop
	nop
	nop
	fneg	%f3, %f3

	nop
	nop
	nop
	fsw	%f3, 144(%zero)

bnei_cont.27274:
	nop
	nop
	nop
	j	bnei_cont.27272

bnei_else.27271:
	nop
	nop
	lw	%a1, 136(%zero)
	flw	%f3, 470(%zero)

	nop
	fsw	%f3, 142(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)

	nop
	nop
	fsw	%f3, 143(%zero)
	add	%at, %a3, %a1

	nop
	nop
	fsw	%f3, 144(%zero)
	flw	%f4, 0(%at)

	nop
	nop
	nop
	fbne	%f4, %f3, fbeq_else.27275

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.27276

fbeq_else.27275:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.27276:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.27277

	nop
	nop
	nop
	j	bnei_cont.27278

bnei_else.27277:
	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.27279

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27280

fbgt_else.27279:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.27280:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.27281

	nop
	nop
	nop
	flw	%f3, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.27282

bnei_else.27281:
	nop
	nop
	nop
	flw	%f3, 458(%zero)

bnei_cont.27282:
bnei_cont.27278:
	nop
	nop
	nop
	fneg	%f3, %f3

	nop
	nop
	nop
	fsw	%f3, 142(%a1)

bnei_cont.27272:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	fsw	%f0, 159(%zero)

	nop
	nop
	nop
	flw	%f1, 139(%zero)

	nop
	nop
	nop
	fsw	%f1, 160(%zero)

	nop
	nop
	nop
	flw	%f2, 140(%zero)

	nop
	nop
	fsw	%f2, 161(%zero)
	fsw	%f2, 14(%sp)

	nop
	nop
	addi	%v1, %zero, 138
	fsw	%f1, 15(%sp)

	nop
	nop
	nop
	fsw	%f0, 16(%sp)

	nop
	nop
	nop
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	utexture.2971

	nop
	addi	%sp, %sp, -18
	lw	%v1, 136(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	lw	%ra, 17(%sp)
	lw	%v0, 12(%sp)

	nop
	sll	%v0, %v0, 2
	lw	%a0, 7(%sp)
	flw	%f0, 16(%sp)

	nop
	add	%v0, %v0, %v1
	lw	%v1, 6(%sp)
	flw	%f1, 15(%sp)

	nop
	add	%at, %a0, %v1
	flw	%f2, 14(%sp)
	lw	%a2, 13(%sp)

	nop
	nop
	sw	%v0, 0(%at)
	lw	%v0, 3(%sp)

	nop
	nop
	lw	%a1, 1(%v0)
	lw	%a3, 7(%a2)

	nop
	nop
	add	%at, %a1, %v1
	flw	%f3, 0(%a3)

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	fsw	%f0, 0(%a1)

	nop
	nop
	nop
	fsw	%f1, 1(%a1)

	nop
	nop
	nop
	fsw	%f2, 2(%a1)

	nop
	nop
	nop
	lw	%a1, 3(%v0)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.27283

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27284

fbgt_else.27283:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.27284:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.27285

	nop
	nop
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1

	nop
	nop
	nop
	sw	%a3, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.27286

bnei_else.27285:
	nop
	lw	%a3, 11(%sp)
	add	%at, %a1, %v1
	lw	%a1, 4(%v0)

	nop
	nop
	sw	%a3, 0(%at)
	flw	%f3, 145(%zero)

	nop
	nop
	add	%at, %a1, %v1
	flw	%f4, 10(%sp)

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	fsw	%f3, 0(%a1)
	flw	%f3, 146(%zero)

	nop
	nop
	fsw	%f3, 1(%a1)
	flw	%f3, 147(%zero)

	nop
	nop
	fsw	%f3, 2(%a1)
	flw	%f3, 441(%zero)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f5, 0(%a1)

	nop
	nop
	nop
	fmul	%f5, %f5, %f3

	nop
	nop
	nop
	fsw	%f5, 0(%a1)

	nop
	nop
	nop
	flw	%f5, 1(%a1)

	nop
	nop
	nop
	fmul	%f5, %f5, %f3

	nop
	nop
	nop
	fsw	%f5, 1(%a1)

	nop
	nop
	nop
	flw	%f5, 2(%a1)

	nop
	nop
	nop
	fmul	%f3, %f5, %f3

	nop
	nop
	fsw	%f3, 2(%a1)
	flw	%f3, 142(%zero)

	nop
	nop
	nop
	lw	%a1, 7(%v0)

	nop
	nop
	nop
	add	%at, %a1, %v1

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	fsw	%f3, 0(%a1)
	flw	%f3, 143(%zero)

	nop
	nop
	fsw	%f3, 1(%a1)
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fsw	%f3, 2(%a1)

bnei_cont.27286:
	nop
	nop
	flw	%f3, 440(%zero)
	lw	%a1, 5(%sp)

	nop
	nop
	flw	%f4, 0(%a1)
	flw	%f5, 142(%zero)

	nop
	fmul	%f6, %f4, %f5
	flw	%f7, 1(%a1)
	flw	%f8, 143(%zero)

	nop
	fmul	%f9, %f7, %f8
	flw	%f10, 144(%zero)
	lw	%a3, 7(%a2)

	nop
	fadd	%f6, %f6, %f9
	flw	%f9, 2(%a1)
	lw	%t0, 1(%sp)

	nop
	nop
	fmul	%f11, %f9, %f10
	addi	%v1, %t0, 0

	nop
	nop
	nop
	fadd	%f6, %f6, %f11

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f6, %f3, %f5

	nop
	nop
	nop
	fadd	%f4, %f4, %f6

	nop
	fsw	%f4, 0(%a1)
	fmul	%f4, %f3, %f8
	fmul	%f3, %f3, %f10

	nop
	nop
	fadd	%f4, %f7, %f4
	fadd	%f3, %f9, %f3

	nop
	nop
	fsw	%f4, 1(%a1)
	flw	%f4, 4(%sp)

	nop
	nop
	fsw	%f3, 2(%a1)
	flw	%f3, 1(%a3)

	nop
	nop
	fmul	%f3, %f4, %f3
	lw	%a3, 2(%sp)

	nop
	nop
	fsw	%f3, 17(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	fsw	%f10, 18(%sp)

	nop
	nop
	nop
	fsw	%f8, 19(%sp)

	nop
	nop
	nop
	fsw	%f5, 20(%sp)

	nop
	nop
	nop
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27287

	nop
	nop
	nop
	j	bnei_cont.27288

bnei_else.27287:
	nop
	nop
	flw	%f0, 78(%zero)
	flw	%f1, 20(%sp)

	nop
	fmul	%f1, %f1, %f0
	flw	%f2, 79(%zero)
	flw	%f3, 19(%sp)

	nop
	fmul	%f3, %f3, %f2
	flw	%f4, 18(%sp)
	lw	%v0, 5(%sp)

	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 80(%zero)
	flw	%f5, 0(%v0)

	nop
	fmul	%f4, %f4, %f3
	fmul	%f0, %f5, %f0
	flw	%f5, 1(%v0)

	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 10(%sp)
	fmul	%f2, %f5, %f2

	nop
	fneg	%f1, %f1
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%v0)

	nop
	nop
	fmul	%f1, %f1, %f4
	fmul	%f2, %f2, %f3

	nop
	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 470(%zero)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.27289

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27290

fbgt_else.27289:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.27290:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.27291

	nop
	nop
	flw	%f3, 151(%zero)
	flw	%f5, 145(%zero)

	nop
	nop
	nop
	fmul	%f5, %f1, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f5

	nop
	nop
	nop
	fsw	%f3, 151(%zero)

	nop
	nop
	flw	%f3, 152(%zero)
	flw	%f5, 146(%zero)

	nop
	nop
	nop
	fmul	%f5, %f1, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f5

	nop
	nop
	nop
	fsw	%f3, 152(%zero)

	nop
	nop
	flw	%f3, 153(%zero)
	flw	%f5, 147(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

	nop
	nop
	nop
	fsw	%f1, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.27292

bnei_else.27291:
bnei_cont.27292:
	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.27293

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27294

fbgt_else.27293:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.27294:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.27295

	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 17(%sp)
	flw	%f2, 151(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f2, %f2, %f0

	nop
	nop
	nop
	fsw	%f2, 151(%zero)

	nop
	nop
	nop
	flw	%f2, 152(%zero)

	nop
	nop
	nop
	fadd	%f2, %f2, %f0

	nop
	nop
	nop
	fsw	%f2, 152(%zero)

	nop
	nop
	nop
	flw	%f2, 153(%zero)

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.27296

bnei_else.27295:
bnei_cont.27296:
bnei_cont.27288:
	nop
	nop
	nop
	flw	%f0, 16(%sp)

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 15(%sp)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 14(%sp)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 21(%sp)

	nop
	nop
	lw	%v0, 0(%zero)
	addi	%sp, %sp, 22

	nop
	nop
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -22
	lw	%v0, 434(%zero)

	nop
	lw	%ra, 21(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)

	nop
	nop
	flw	%f1, 17(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	trace_reflections.2978

	nop
	nop
	addi	%sp, %sp, -22
	flw	%f0, 439(%zero)

	nop
	nop
	lw	%ra, 21(%sp)
	flw	%f1, 4(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27297

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27298

fbgt_else.27297:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27298:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27299

	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	blti	%v0, 4, bgti_else.27300

	nop
	nop
	nop
	j	bgti_cont.27301

bgti_else.27300:
	nop
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)

	nop
	nop
	nop
	add	%at, %a1, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

bgti_cont.27301:
	nop
	nop
	nop
	lw	%v1, 9(%sp)

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.27302

	nop
	nop
	nop
	jr	%ra

bnei_else.27302:
	nop
	flw	%f0, 474(%zero)
	lw	%v1, 13(%sp)
	addi	%v0, %v0, 1

	nop
	nop
	lw	%v1, 7(%v1)
	lw	%a0, 3(%sp)

	nop
	nop
	flw	%f2, 0(%v1)
	lw	%v1, 5(%sp)

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 0(%sp)

	nop
	nop
	fmul	%f0, %f1, %f0
	flw	%f1, 8(%sp)

	nop
	nop
	nop
	fadd	%f1, %f2, %f1

	nop
	nop
	nop
	j	trace_ray.2983

bnei_else.27299:
	nop
	nop
	nop
	jr	%ra

bnei_else.27270:
	nop
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.27305

	nop
	nop
	lw	%v0, 5(%sp)
	flw	%f1, 78(%zero)

	nop
	nop
	flw	%f0, 0(%v0)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27306

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27307

fbgt_else.27306:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27307:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27308

	nop
	nop
	nop
	fmul	%f1, %f0, %f0

	nop
	nop
	fmul	%f0, %f1, %f0
	flw	%f1, 4(%sp)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 81(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 151(%zero)

	nop
	nop
	nop
	fadd	%f1, %f1, %f0

	nop
	nop
	nop
	fsw	%f1, 151(%zero)

	nop
	nop
	nop
	flw	%f1, 152(%zero)

	nop
	nop
	nop
	fadd	%f1, %f1, %f0

	nop
	nop
	nop
	fsw	%f1, 152(%zero)

	nop
	nop
	nop
	flw	%f1, 153(%zero)

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.27308:
	nop
	nop
	nop
	jr	%ra

bnei_else.27305:
	nop
	nop
	nop
	jr	%ra

bgt_else.27263:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_ray.2989:
	nop
	addi	%v1, %zero, 0
	flw	%f1, 443(%zero)
	fsw	%f0, 0(%sp)

	nop
	nop
	nop
	fsw	%f1, 137(%zero)

	nop
	nop
	nop
	lw	%a0, 134(%zero)

	nop
	sw	%a0, 1(%sp)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2956

	nop
	addi	%sp, %sp, -5
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27322

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27323

fbgt_else.27322:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27323:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27324

	nop
	nop
	nop
	flw	%f1, 442(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27326

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.27325

fbgt_else.27326:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27327:
	nop
	nop
	nop
	j	bnei_cont.27325

bnei_else.27324:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.27325:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27328

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 3(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	lw	%a0, 1(%v0)
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.27329

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.27331

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	get_nvector_second.2966

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.27330

bnei_else.27331:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.27332:
	nop
	nop
	nop
	j	bnei_cont.27330

bnei_else.27329:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 470(%zero)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.27333

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.27334

fbeq_else.27333:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.27334:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.27335

	nop
	nop
	nop
	j	bnei_cont.27336

bnei_else.27335:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27337

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27338

fbgt_else.27337:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.27338:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.27339

	nop
	nop
	nop
	flw	%f0, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.27340

bnei_else.27339:
	nop
	nop
	nop
	flw	%f0, 458(%zero)

bnei_cont.27340:
bnei_cont.27336:
	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 142(%a0)

bnei_cont.27330:
	nop
	addi	%v1, %zero, 138
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	utexture.2971

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27341

	nop
	nop
	nop
	jr	%ra

bnei_else.27341:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27343

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27344

fbgt_else.27343:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27344:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27345

	nop
	nop
	nop
	j	bnei_cont.27346

bnei_else.27345:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.27346:
	nop
	nop
	flw	%f1, 0(%sp)
	lw	%v0, 4(%sp)

	nop
	fmul	%f0, %f1, %f0
	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f1, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 148(%zero)

	nop
	nop
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 149(%zero)

	nop
	nop
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.27328:
	nop
	nop
	nop
	jr	%ra

iter_trace_diffuse_rays.2992:
	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.27554

	add	%at, %v0, %a1
	flw	%f1, 0(%v1)
	addi	%t1, %zero, 1
	flw	%f3, 1(%v1)

	nop
	nop
	lw	%a3, 0(%at)
	flw	%f4, 2(%v1)

	nop
	nop
	nop
	lw	%t0, 0(%a3)

	nop
	nop
	flw	%f0, 0(%t0)
	flw	%f2, 1(%t0)

	nop
	nop
	fmul	%f0, %f0, %f1
	fmul	%f2, %f2, %f3

	nop
	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%t0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.27555

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27556

fbgt_else.27555:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.27556:
	nop
	nop
	nop
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	fsw	%f2, 2(%sp)

	nop
	nop
	nop
	fsw	%f4, 3(%sp)

	nop
	nop
	nop
	fsw	%f3, 4(%sp)

	nop
	nop
	nop
	fsw	%f1, 5(%sp)

	nop
	nop
	nop
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%a1, 7(%sp)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.27557

	nop
	nop
	addi	%a3, %a1, 1
	flw	%f5, 438(%zero)

	nop
	add	%at, %v0, %a3
	fdiv	%f0, %f0, %f5
	flw	%f5, 443(%zero)

	nop
	nop
	lw	%a3, 0(%at)
	fsw	%f5, 137(%zero)

	nop
	nop
	lw	%t0, 134(%zero)
	fsw	%f0, 8(%sp)

	nop
	nop
	lw	%t2, 0(%t0)
	sw	%t0, 9(%sp)

	nop
	nop
	lw	%t3, 0(%t2)
	sw	%a2, 10(%sp)

	nop
	nop
	nop
	sw	%a3, 11(%sp)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.27559

	nop
	nop
	nop
	sw	%t1, 12(%sp)

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.27561

	nop
	sw	%t2, 13(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0

	nop
	nop
	nop
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solver_fast2.2877

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.27562

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27565

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27566

fbgt_else.27565:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27566:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.27562

	nop
	nop
	nop
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27562

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27562

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27562

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27562

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -15
	addi	%v0, %zero, 5

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)

	nop
	nop
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bnei_cont.27562

bnei_else.27575:
bnei_cont.27576:
	nop
	nop
	nop
	j	bnei_cont.27562

bnei_else.27573:
bnei_cont.27574:
	nop
	nop
	nop
	j	bnei_cont.27562

bnei_else.27571:
bnei_cont.27572:
	nop
	nop
	nop
	j	bnei_cont.27562

bnei_else.27569:
bnei_cont.27570:
	nop
	nop
	nop
	j	bnei_cont.27562

bnei_else.27567:
bnei_cont.27568:
	nop
	nop
	nop
	j	bnei_cont.27562

bnei_else.27563:
bnei_cont.27564:
	nop
	nop
	nop
	j	bnei_cont.27562

bnei_else.27561:
	nop
	nop
	nop
	lw	%t3, 1(%t2)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.27577

	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %t3, 0
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27578

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27578

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27578

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -15
	addi	%v0, %zero, 5

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)

	nop
	nop
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bnei_cont.27578

bnei_else.27583:
bnei_cont.27584:
	nop
	nop
	nop
	j	bnei_cont.27578

bnei_else.27581:
bnei_cont.27582:
	nop
	nop
	nop
	j	bnei_cont.27578

bnei_else.27579:
bnei_cont.27580:
	nop
	nop
	nop
	j	bnei_cont.27578

bnei_else.27577:
bnei_cont.27578:
bnei_cont.27562:
	nop
	nop
	lw	%v0, 12(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2956

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bnei_cont.27560

bnei_else.27559:
bnei_cont.27560:
	nop
	nop
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27585

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27586

fbgt_else.27585:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27586:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27587

	nop
	nop
	nop
	flw	%f1, 442(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27589

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.27588

fbgt_else.27589:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27590:
	nop
	nop
	nop
	j	bnei_cont.27588

bnei_else.27587:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.27588:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.27558

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 11(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	lw	%a0, 1(%v0)
	sw	%v0, 14(%sp)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.27593

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.27595

	nop
	nop
	nop
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	get_nvector_second.2966

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bnei_cont.27594

bnei_else.27595:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.27596:
	nop
	nop
	nop
	j	bnei_cont.27594

bnei_else.27593:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.27597

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.27598

fbeq_else.27597:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.27598:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.27599

	nop
	nop
	nop
	fmov	%f1, %f0

	nop
	nop
	nop
	j	bnei_cont.27600

bnei_else.27599:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27601

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27602

fbgt_else.27601:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.27602:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.27603

	nop
	nop
	nop
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.27604

bnei_else.27603:
	nop
	nop
	nop
	flw	%f1, 458(%zero)

bnei_cont.27604:
bnei_cont.27600:
	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f1, 142(%a0)

bnei_cont.27594:
	nop
	addi	%v1, %zero, 138
	lw	%v0, 14(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	utexture.2971

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v0, 10(%sp)

	nop
	nop
	lw	%v1, 9(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27605

	nop
	nop
	nop
	j	bnei_cont.27558

bnei_else.27605:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%sp)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27607

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27608

fbgt_else.27607:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27608:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27609

	nop
	nop
	nop
	j	bnei_cont.27610

bnei_else.27609:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.27610:
	nop
	nop
	flw	%f2, 8(%sp)
	lw	%v0, 14(%sp)

	nop
	fmul	%f0, %f2, %f0
	lw	%v0, 7(%v0)
	flw	%f3, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	fmul	%f3, %f0, %f3

	nop
	nop
	nop
	fadd	%f2, %f2, %f3

	nop
	nop
	nop
	fsw	%f2, 148(%zero)

	nop
	nop
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)

	nop
	nop
	nop
	fmul	%f3, %f0, %f3

	nop
	nop
	nop
	fadd	%f2, %f2, %f3

	nop
	nop
	nop
	fsw	%f2, 149(%zero)

	nop
	nop
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f3

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

bnei_cont.27606:
	nop
	nop
	nop
	j	bnei_cont.27558

bnei_else.27591:
bnei_cont.27592:
	nop
	nop
	nop
	j	bnei_cont.27558

bnei_else.27557:
	nop
	nop
	nop
	flw	%f5, 437(%zero)

	nop
	nop
	fdiv	%f0, %f0, %f5
	flw	%f5, 443(%zero)

	nop
	nop
	fsw	%f5, 137(%zero)
	fsw	%f0, 15(%sp)

	nop
	nop
	nop
	lw	%t0, 134(%zero)

	nop
	nop
	lw	%t2, 0(%t0)
	sw	%t0, 16(%sp)

	nop
	nop
	lw	%t3, 0(%t2)
	sw	%a2, 10(%sp)

	nop
	nop
	nop
	sw	%a3, 17(%sp)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.27611

	nop
	nop
	nop
	sw	%t1, 12(%sp)

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.27613

	nop
	sw	%t2, 18(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0

	nop
	nop
	nop
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solver_fast2.2877

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.27614

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27617

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27618

fbgt_else.27617:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27618:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.27614

	nop
	nop
	nop
	lw	%v0, 18(%sp)

	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27614

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27614

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27614

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27614

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -20
	addi	%v0, %zero, 5

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	bnei_cont.27614

bnei_else.27627:
bnei_cont.27628:
	nop
	nop
	nop
	j	bnei_cont.27614

bnei_else.27625:
bnei_cont.27626:
	nop
	nop
	nop
	j	bnei_cont.27614

bnei_else.27623:
bnei_cont.27624:
	nop
	nop
	nop
	j	bnei_cont.27614

bnei_else.27621:
bnei_cont.27622:
	nop
	nop
	nop
	j	bnei_cont.27614

bnei_else.27619:
bnei_cont.27620:
	nop
	nop
	nop
	j	bnei_cont.27614

bnei_else.27615:
bnei_cont.27616:
	nop
	nop
	nop
	j	bnei_cont.27614

bnei_else.27613:
	nop
	nop
	nop
	lw	%t3, 1(%t2)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.27629

	lw	%t3, 83(%t3)
	sw	%t2, 18(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %t3, 0
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27630

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27630

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_cont.27630

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)

	nop
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -20
	addi	%v0, %zero, 5

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	bnei_cont.27630

bnei_else.27635:
bnei_cont.27636:
	nop
	nop
	nop
	j	bnei_cont.27630

bnei_else.27633:
bnei_cont.27634:
	nop
	nop
	nop
	j	bnei_cont.27630

bnei_else.27631:
bnei_cont.27632:
	nop
	nop
	nop
	j	bnei_cont.27630

bnei_else.27629:
bnei_cont.27630:
bnei_cont.27614:
	nop
	nop
	lw	%v0, 12(%sp)
	lw	%v1, 16(%sp)

	nop
	nop
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2956

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	bnei_cont.27612

bnei_else.27611:
bnei_cont.27612:
	nop
	nop
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27637

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27638

fbgt_else.27637:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27638:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27639

	nop
	nop
	nop
	flw	%f1, 442(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27641

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.27640

fbgt_else.27641:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27642:
	nop
	nop
	nop
	j	bnei_cont.27640

bnei_else.27639:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.27640:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27643

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 17(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	lw	%a0, 1(%v0)
	sw	%v0, 19(%sp)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.27645

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.27647

	nop
	nop
	nop
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	get_nvector_second.2966

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	bnei_cont.27646

bnei_else.27647:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.27648:
	nop
	nop
	nop
	j	bnei_cont.27646

bnei_else.27645:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.27649

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.27650

fbeq_else.27649:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.27650:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.27651

	nop
	nop
	nop
	fmov	%f1, %f0

	nop
	nop
	nop
	j	bnei_cont.27652

bnei_else.27651:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27653

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27654

fbgt_else.27653:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.27654:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.27655

	nop
	nop
	nop
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.27656

bnei_else.27655:
	nop
	nop
	nop
	flw	%f1, 458(%zero)

bnei_cont.27656:
bnei_cont.27652:
	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f1, 142(%a0)

bnei_cont.27646:
	nop
	addi	%v1, %zero, 138
	lw	%v0, 19(%sp)
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	utexture.2971

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	lw	%ra, 20(%sp)
	lw	%v0, 10(%sp)

	nop
	nop
	lw	%v1, 16(%sp)
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27657

	nop
	nop
	nop
	j	bnei_cont.27644

bnei_else.27657:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%sp)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.27659

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27660

fbgt_else.27659:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.27660:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27661

	nop
	nop
	nop
	j	bnei_cont.27662

bnei_else.27661:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.27662:
	nop
	nop
	flw	%f2, 15(%sp)
	lw	%v0, 19(%sp)

	nop
	fmul	%f0, %f2, %f0
	lw	%v0, 7(%v0)
	flw	%f3, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	fmul	%f3, %f0, %f3

	nop
	nop
	nop
	fadd	%f2, %f2, %f3

	nop
	nop
	nop
	fsw	%f2, 148(%zero)

	nop
	nop
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)

	nop
	nop
	nop
	fmul	%f3, %f0, %f3

	nop
	nop
	nop
	fadd	%f2, %f2, %f3

	nop
	nop
	nop
	fsw	%f2, 149(%zero)

	nop
	nop
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f3

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

bnei_cont.27658:
	nop
	nop
	nop
	j	bnei_cont.27644

bnei_else.27643:
bnei_cont.27644:
bnei_cont.27558:
	nop
	nop
	nop
	lw	%v0, 7(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -2

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.27663

	nop
	nop
	lw	%v1, 6(%sp)
	flw	%f1, 5(%sp)

	nop
	nop
	add	%at, %v1, %v0
	flw	%f2, 4(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a1, 0(%a0)

	nop
	nop
	nop
	flw	%f0, 0(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a1)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 3(%sp)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27664

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27665

fbgt_else.27664:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.27665:
	nop
	nop
	nop
	sw	%v0, 20(%sp)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.27666

	nop
	addi	%a0, %v0, 1
	flw	%f1, 438(%zero)
	sw	%ra, 21(%sp)

	nop
	nop
	add	%at, %v1, %a0
	fdiv	%f0, %f0, %f1

	nop
	nop
	lw	%a0, 0(%at)
	addi	%sp, %sp, 22

	nop
	nop
	nop
	addi	%v0, %a0, 0

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

	nop
	nop
	nop
	j	bnei_cont.27667

bnei_else.27666:
	nop
	flw	%f1, 437(%zero)
	addi	%v0, %a0, 0
	sw	%ra, 21(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

bnei_cont.27667:
	nop
	nop
	lw	%v0, 20(%sp)
	lw	%v1, 1(%sp)

	nop
	addi	%a1, %v0, -2
	lw	%v0, 6(%sp)
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	iter_trace_diffuse_rays.2992

bgti_else.27663:
	nop
	nop
	nop
	jr	%ra

bgti_else.27554:
	nop
	nop
	nop
	jr	%ra

calc_diffuse_using_1point.3005:
	nop
	nop
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)

	nop
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1

	nop
	lw	%a0, 0(%at)
	lw	%v0, 6(%v0)
	add	%at, %a1, %v1

	nop
	nop
	flw	%f0, 0(%a0)
	lw	%v0, 0(%v0)

	nop
	nop
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)

	nop
	fsw	%f0, 150(%zero)
	lw	%a0, 0(%at)
	add	%at, %a2, %v1

	nop
	nop
	lw	%a1, 0(%at)
	sw	%v1, 0(%sp)

	nop
	nop
	nop
	sw	%a3, 1(%sp)

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
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27772

	nop
	lw	%a2, 179(%zero)
	flw	%f0, 0(%a1)
	addi	%v0, %a1, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a1)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a1)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%a2, 5(%sp)

	nop
	nop
	lw	%t0, 0(%zero)
	sw	%ra, 6(%sp)

	nop
	nop
	addi	%t0, %t0, -1
	addi	%sp, %sp, 7

	nop
	nop
	nop
	addi	%v1, %t0, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a1, 2(%sp)

	nop
	nop
	lw	%a0, 0(%v1)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27774

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27775

fbgt_else.27774:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.27775:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27776

	nop
	nop
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)

	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.27777

bnei_else.27776:
	nop
	flw	%f1, 437(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

bnei_cont.27777:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.27773

bnei_else.27772:
bnei_cont.27773:
	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.27778

	nop
	nop
	lw	%v1, 180(%zero)
	lw	%a0, 3(%sp)

	nop
	flw	%f0, 0(%a0)
	sw	%v1, 6(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 7(%sp)

	nop
	nop
	lw	%a1, 0(%zero)
	addi	%sp, %sp, 8

	nop
	nop
	nop
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a1, 2(%sp)

	nop
	nop
	lw	%a0, 0(%v1)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27780

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27781

fbgt_else.27780:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.27781:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27782

	nop
	nop
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)

	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.27783

bnei_else.27782:
	nop
	flw	%f1, 437(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

bnei_cont.27783:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.27779

bnei_else.27778:
bnei_cont.27779:
	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.27784

	nop
	nop
	lw	%v1, 181(%zero)
	lw	%a0, 3(%sp)

	nop
	flw	%f0, 0(%a0)
	sw	%v1, 7(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 8(%sp)

	nop
	nop
	lw	%a1, 0(%zero)
	addi	%sp, %sp, 9

	nop
	nop
	nop
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a1, 2(%sp)

	nop
	nop
	lw	%a0, 0(%v1)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27786

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27787

fbgt_else.27786:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.27787:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27788

	nop
	nop
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)

	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	j	bnei_cont.27789

bnei_else.27788:
	nop
	flw	%f1, 437(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

bnei_cont.27789:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	j	bnei_cont.27785

bnei_else.27784:
bnei_cont.27785:
	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.27790

	nop
	nop
	lw	%v1, 182(%zero)
	lw	%a0, 3(%sp)

	nop
	flw	%f0, 0(%a0)
	sw	%v1, 8(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 9(%sp)

	nop
	nop
	lw	%a1, 0(%zero)
	addi	%sp, %sp, 10

	nop
	nop
	nop
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a1, 2(%sp)

	nop
	nop
	lw	%a0, 0(%v1)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27792

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27793

fbgt_else.27792:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.27793:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27794

	nop
	nop
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)

	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bnei_cont.27795

bnei_else.27794:
	nop
	flw	%f1, 437(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.27795:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bnei_cont.27791

bnei_else.27790:
bnei_cont.27791:
	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.27796

	nop
	nop
	lw	%v0, 183(%zero)
	lw	%v1, 3(%sp)

	nop
	flw	%f0, 0(%v1)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 10(%sp)

	nop
	nop
	lw	%a0, 0(%zero)
	addi	%sp, %sp, 11

	nop
	nop
	nop
	addi	%a0, %a0, -1

	nop
	nop
	nop
	addi	%v1, %a0, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a1, 2(%sp)

	nop
	nop
	lw	%a0, 0(%v1)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 470(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.27798

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.27799

fbgt_else.27798:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.27799:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27800

	nop
	nop
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)

	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.27801

bnei_else.27800:
	nop
	flw	%f1, 437(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.27801:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.27797

bnei_else.27796:
bnei_cont.27797:
	nop
	nop
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)

	nop
	add	%at, %v1, %v0
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	lw	%v0, 0(%at)

	nop
	nop
	nop
	flw	%f1, 0(%v0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v0)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	jr	%ra

calc_diffuse_using_5points.3008:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a3, %v0, -1

	nop
	lw	%v1, 0(%at)
	add	%at, %a0, %a3
	addi	%t2, %v0, 1

	nop
	lw	%v1, 5(%v1)
	lw	%a3, 0(%at)
	add	%at, %a0, %v0

	nop
	lw	%a3, 5(%a3)
	lw	%t0, 0(%at)
	add	%at, %a0, %t2

	nop
	lw	%t1, 5(%t0)
	lw	%a0, 0(%at)
	add	%at, %a1, %v0

	nop
	lw	%a0, 5(%a0)
	lw	%v0, 0(%at)
	add	%at, %v1, %a2

	nop
	lw	%v0, 5(%v0)
	lw	%v1, 0(%at)
	add	%at, %a3, %a2

	nop
	nop
	nop
	flw	%f0, 0(%v1)

	nop
	nop
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%v1)

	nop
	fsw	%f0, 150(%zero)
	lw	%v1, 0(%at)
	add	%at, %t1, %a2

	nop
	nop
	flw	%f0, 148(%zero)
	flw	%f1, 0(%v1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 0(%at)
	add	%at, %a0, %a2

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%v1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 0(%at)
	add	%at, %v0, %a2

	nop
	nop
	fsw	%f0, 149(%zero)
	lw	%v0, 0(%at)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%v1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%v0)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v0)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	lw	%v0, 4(%t0)

	nop
	nop
	fsw	%f0, 149(%zero)
	add	%at, %v0, %a2

	nop
	nop
	flw	%f0, 150(%zero)
	lw	%v0, 0(%at)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%v0)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v0)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	jr	%ra

do_without_neighbors.3014:
	nop
	nop
	nop
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.27861

	nop
	nop
	nop
	lw	%a0, 2(%v0)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.27862

	nop
	nop
	lw	%a0, 3(%v0)
	sw	%v0, 0(%sp)

	nop
	nop
	add	%at, %a0, %v1
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27863

	nop
	nop
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)

	nop
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1

	nop
	lw	%a0, 0(%at)
	add	%at, %a1, %v1
	sw	%a3, 2(%sp)

	nop
	flw	%f0, 0(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v1

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
	lw	%a0, 6(%v0)

	nop
	nop
	lw	%a0, 0(%a0)
	lw	%a2, 0(%at)

	nop
	nop
	nop
	sw	%a1, 3(%sp)

	nop
	nop
	nop
	sw	%a2, 4(%sp)

	nop
	nop
	nop
	sw	%a0, 5(%sp)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27865

	nop
	lw	%t0, 179(%zero)
	flw	%f0, 0(%a2)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%t0, 6(%sp)

	nop
	nop
	lw	%t1, 0(%zero)
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%t1, %t1, -1
	addi	%sp, %sp, 8

	nop
	nop
	nop
	addi	%v1, %t1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.27866

bnei_else.27865:
bnei_cont.27866:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.27867

	nop
	nop
	lw	%v1, 180(%zero)
	lw	%a0, 4(%sp)

	nop
	flw	%f0, 0(%a0)
	sw	%v1, 7(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 8(%sp)

	nop
	nop
	lw	%a1, 0(%zero)
	addi	%sp, %sp, 9

	nop
	nop
	nop
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -9
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

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
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	j	bnei_cont.27868

bnei_else.27867:
bnei_cont.27868:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.27869

	nop
	nop
	lw	%v1, 181(%zero)
	lw	%a0, 4(%sp)

	nop
	flw	%f0, 0(%a0)
	sw	%v1, 8(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 9(%sp)

	nop
	nop
	lw	%a1, 0(%zero)
	addi	%sp, %sp, 10

	nop
	nop
	nop
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -10
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bnei_cont.27870

bnei_else.27869:
bnei_cont.27870:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.27871

	nop
	nop
	lw	%v1, 182(%zero)
	lw	%a0, 4(%sp)

	nop
	flw	%f0, 0(%a0)
	sw	%v1, 9(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 10(%sp)

	nop
	nop
	lw	%a1, 0(%zero)
	addi	%sp, %sp, 11

	nop
	nop
	nop
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.27872

bnei_else.27871:
bnei_cont.27872:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.27873

	nop
	nop
	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)

	nop
	flw	%f0, 0(%v1)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 11(%sp)

	nop
	nop
	lw	%a0, 0(%zero)
	addi	%sp, %sp, 12

	nop
	nop
	nop
	addi	%a0, %a0, -1

	nop
	nop
	nop
	addi	%v1, %a0, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -12
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	bnei_cont.27874

bnei_else.27873:
bnei_cont.27874:
	nop
	nop
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)

	nop
	add	%at, %v1, %v0
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	flw	%f1, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.27864

bnei_else.27863:
bnei_cont.27864:
	nop
	nop
	lw	%v0, 1(%sp)
	addi	%at, %zero, 4

	nop
	nop
	nop
	addi	%v1, %v0, 1

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.27875

	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	lw	%a0, 2(%v0)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.27876

	nop
	nop
	lw	%a0, 3(%v0)
	sw	%v1, 11(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.27877

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	calc_diffuse_using_1point.3005

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	bnei_cont.27878

bnei_else.27877:
bnei_cont.27878:
	nop
	nop
	nop
	lw	%v0, 11(%sp)

	nop
	nop
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	j	do_without_neighbors.3014

bgti_else.27876:
	nop
	nop
	nop
	jr	%ra

bgt_else.27875:
	nop
	nop
	nop
	jr	%ra

bgti_else.27862:
	nop
	nop
	nop
	jr	%ra

bgt_else.27861:
	nop
	nop
	nop
	jr	%ra

try_exploit_neighbors.3030:
	nop
	nop
	nop
	add	%at, %a1, %v0

	nop
	nop
	lw	%t0, 0(%at)
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.27900

	nop
	nop
	nop
	lw	%t1, 2(%t0)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	nop
	lw	%t1, 0(%at)

	nop
	nop
	nop
	blti	%t1, 0, bgti_else.27901

	nop
	nop
	nop
	lw	%t1, 2(%t0)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	lw	%t1, 0(%at)
	add	%at, %a0, %v0

	nop
	nop
	nop
	lw	%t2, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t2)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.27902

	nop
	nop
	nop
	add	%at, %a2, %v0

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t3)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.27904

	nop
	nop
	nop
	addi	%t3, %v0, -1

	nop
	nop
	nop
	add	%at, %a1, %t3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t3)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.27906

	nop
	nop
	nop
	addi	%t3, %v0, 1

	nop
	nop
	nop
	add	%at, %a1, %t3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t3)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.27908

	nop
	nop
	nop
	addi	%t1, %zero, 1

	nop
	nop
	nop
	j	beq_cont.27903

beq_else.27908:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.27909:
	nop
	nop
	nop
	j	beq_cont.27903

beq_else.27906:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.27907:
	nop
	nop
	nop
	j	beq_cont.27903

beq_else.27904:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.27905:
	nop
	nop
	nop
	j	beq_cont.27903

beq_else.27902:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.27903:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.27910

	nop
	nop
	nop
	lw	%t1, 3(%t0)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	nop
	lw	%t1, 0(%at)

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.27911

	lw	%t1, 5(%t2)
	addi	%t3, %v0, -1
	lw	%t4, 5(%t0)
	addi	%t5, %v0, 1

	nop
	nop
	nop
	add	%at, %a1, %t3

	nop
	nop
	lw	%t3, 0(%at)
	add	%at, %a1, %t5

	nop
	lw	%t3, 5(%t3)
	lw	%t5, 0(%at)
	add	%at, %a2, %v0

	nop
	lw	%t5, 5(%t5)
	lw	%t6, 0(%at)
	add	%at, %t1, %a3

	nop
	lw	%t6, 5(%t6)
	lw	%t1, 0(%at)
	add	%at, %t3, %a3

	nop
	nop
	nop
	flw	%f0, 0(%t1)

	nop
	nop
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)

	nop
	fsw	%f0, 150(%zero)
	lw	%t1, 0(%at)
	add	%at, %t4, %a3

	nop
	nop
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	add	%at, %t5, %a3

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	add	%at, %t6, %a3

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 4(%t0)

	nop
	nop
	fsw	%f0, 149(%zero)
	add	%at, %t1, %a3

	nop
	nop
	flw	%f0, 150(%zero)
	lw	%t1, 0(%at)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.27912

bnei_else.27911:
bnei_cont.27912:
	nop
	nop
	addi	%a3, %a3, 1
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.27913

	nop
	nop
	nop
	lw	%t1, 2(%t0)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	nop
	lw	%t1, 0(%at)

	nop
	nop
	nop
	blti	%t1, 0, bgti_else.27914

	nop
	nop
	lw	%t1, 2(%t0)
	lw	%t2, 2(%t2)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	lw	%t1, 0(%at)
	add	%at, %t2, %a3

	nop
	nop
	nop
	lw	%t2, 0(%at)

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.27915

	nop
	nop
	nop
	add	%at, %a2, %v0

	nop
	nop
	nop
	lw	%t2, 0(%at)

	nop
	nop
	nop
	lw	%t2, 2(%t2)

	nop
	nop
	nop
	add	%at, %t2, %a3

	nop
	nop
	nop
	lw	%t2, 0(%at)

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.27917

	nop
	nop
	nop
	addi	%t2, %v0, -1

	nop
	nop
	nop
	add	%at, %a1, %t2

	nop
	nop
	nop
	lw	%t2, 0(%at)

	nop
	nop
	nop
	lw	%t2, 2(%t2)

	nop
	nop
	nop
	add	%at, %t2, %a3

	nop
	nop
	nop
	lw	%t2, 0(%at)

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.27919

	nop
	nop
	nop
	addi	%t2, %v0, 1

	nop
	nop
	nop
	add	%at, %a1, %t2

	nop
	nop
	nop
	lw	%t2, 0(%at)

	nop
	nop
	nop
	lw	%t2, 2(%t2)

	nop
	nop
	nop
	add	%at, %t2, %a3

	nop
	nop
	nop
	lw	%t2, 0(%at)

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.27921

	nop
	nop
	nop
	addi	%t1, %zero, 1

	nop
	nop
	nop
	j	beq_cont.27916

beq_else.27921:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.27922:
	nop
	nop
	nop
	j	beq_cont.27916

beq_else.27919:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.27920:
	nop
	nop
	nop
	j	beq_cont.27916

beq_else.27917:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.27918:
	nop
	nop
	nop
	j	beq_cont.27916

beq_else.27915:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.27916:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.27923

	nop
	nop
	lw	%t0, 3(%t0)
	sw	%a2, 0(%sp)

	nop
	nop
	add	%at, %t0, %a3
	sw	%a1, 1(%sp)

	nop
	nop
	lw	%t0, 0(%at)
	sw	%a0, 2(%sp)

	nop
	nop
	nop
	sw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%a3, 5(%sp)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.27924

	nop
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)

	nop
	nop
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	calc_diffuse_using_5points.3008

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.27925

bnei_else.27924:
bnei_cont.27925:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 3(%sp)

	nop
	addi	%a3, %v0, 1
	lw	%v0, 4(%sp)
	lw	%a0, 2(%sp)

	nop
	nop
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)

	nop
	nop
	nop
	j	try_exploit_neighbors.3030

bnei_else.27923:
	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0

	nop
	nop
	nop
	j	do_without_neighbors.3014

bgti_else.27914:
	nop
	nop
	nop
	jr	%ra

bgt_else.27913:
	nop
	nop
	nop
	jr	%ra

bnei_else.27910:
	nop
	nop
	nop
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.27928

	nop
	nop
	nop
	lw	%v0, 2(%t0)

	nop
	nop
	nop
	add	%at, %v0, %a3

	nop
	nop
	nop
	lw	%v0, 0(%at)

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.27929

	nop
	nop
	lw	%v0, 3(%t0)
	sw	%t0, 6(%sp)

	nop
	nop
	add	%at, %v0, %a3
	sw	%a3, 7(%sp)

	nop
	nop
	nop
	lw	%v0, 0(%at)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.27930

	nop
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	calc_diffuse_using_1point.3005

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	j	bnei_cont.27931

bnei_else.27930:
bnei_cont.27931:
	nop
	nop
	nop
	lw	%v0, 7(%sp)

	nop
	nop
	addi	%v1, %v0, 1
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	j	do_without_neighbors.3014

bgti_else.27929:
	nop
	nop
	nop
	jr	%ra

bgt_else.27928:
	nop
	nop
	nop
	jr	%ra

bgti_else.27901:
	nop
	nop
	nop
	jr	%ra

bgt_else.27900:
	nop
	nop
	nop
	jr	%ra

write_ppm_header.3037:
	nop
	nop
	addi	%v0, %zero, 80
	sw	%ra, 0(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 51

	nop
	nop
	nop
	lw	%ra, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 0(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 10

	nop
	nop
	lw	%ra, 0(%sp)
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 1(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -2
	lw	%v0, 154(%zero)

	nop
	nop
	lw	%ra, 1(%sp)
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.29983

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.29985

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.29987

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.29989

	nop
	nop
	nop
	addi	%v1, %v0, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.29991

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.29993

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.29995

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.29997

	nop
	addi	%v1, %v1, -40
	addi	%a0, %zero, 8
	sw	%ra, 2(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -3

	nop
	nop
	nop
	lw	%ra, 2(%sp)

	nop
	nop
	nop
	j	bgti_cont.29984

bgti_else.29997:
	nop
	nop
	nop
	addi	%v0, %zero, 7

bgti_cont.29998:
	nop
	nop
	nop
	j	bgti_cont.29984

bgti_else.29995:
	nop
	nop
	nop
	addi	%v0, %zero, 6

bgti_cont.29996:
	nop
	nop
	nop
	j	bgti_cont.29984

bgti_else.29993:
	nop
	nop
	nop
	addi	%v0, %zero, 5

bgti_cont.29994:
	nop
	nop
	nop
	j	bgti_cont.29984

bgti_else.29991:
	nop
	nop
	nop
	addi	%v0, %zero, 4

bgti_cont.29992:
	nop
	nop
	nop
	j	bgti_cont.29984

bgti_else.29989:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.29990:
	nop
	nop
	nop
	j	bgti_cont.29984

bgti_else.29987:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.29988:
	nop
	nop
	nop
	j	bgti_cont.29984

bgti_else.29985:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.29986:
	nop
	nop
	nop
	j	bgti_cont.29984

bgti_else.29983:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.29984:
	nop
	nop
	lw	%v1, 1(%sp)
	sw	%v0, 2(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.29999

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30001

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30003

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30005

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30007

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30009

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30011

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30013

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30015

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30017

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30019

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30021

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30023

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30025

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30027

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30029

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30031

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30033

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30035

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30037

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30039

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30041

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30043

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30045

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 3(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30045:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30046:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30043:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30044:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30041:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30042:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30039:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30040:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30037:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30038:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30035:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30036:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30033:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30034:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30031:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30032:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30029:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30030:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30027:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30028:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30025:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30026:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30023:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30024:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30021:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30022:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30019:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30020:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30017:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30018:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30015:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30016:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30013:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30014:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30011:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30012:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30009:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30010:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30007:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30008:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30005:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30006:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30003:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30004:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.30001:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30002:
	nop
	nop
	nop
	j	bgti_cont.30000

bgti_else.29999:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30000:
	nop
	nop
	nop
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.30047

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 3(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	j	bgt_cont.30048

bgt_else.30047:
	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30049

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30051

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30053

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30055

	nop
	nop
	nop
	addi	%a0, %v1, -40

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.30057

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.30059

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.30061

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.30063

	nop
	addi	%a0, %a0, -40
	addi	%a1, %zero, 8
	sw	%ra, 4(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	j	bgti_cont.30050

bgti_else.30063:
	nop
	nop
	nop
	addi	%v0, %zero, 7

bgti_cont.30064:
	nop
	nop
	nop
	j	bgti_cont.30050

bgti_else.30061:
	nop
	nop
	nop
	addi	%v0, %zero, 6

bgti_cont.30062:
	nop
	nop
	nop
	j	bgti_cont.30050

bgti_else.30059:
	nop
	nop
	nop
	addi	%v0, %zero, 5

bgti_cont.30060:
	nop
	nop
	nop
	j	bgti_cont.30050

bgti_else.30057:
	nop
	nop
	nop
	addi	%v0, %zero, 4

bgti_cont.30058:
	nop
	nop
	nop
	j	bgti_cont.30050

bgti_else.30055:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.30056:
	nop
	nop
	nop
	j	bgti_cont.30050

bgti_else.30053:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.30054:
	nop
	nop
	nop
	j	bgti_cont.30050

bgti_else.30051:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.30052:
	nop
	nop
	nop
	j	bgti_cont.30050

bgti_else.30049:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.30050:
	nop
	nop
	lw	%v1, 2(%sp)
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30065

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30067

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30069

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30071

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30073

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30075

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30077

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30079

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30081

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30083

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30085

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30087

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30089

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30091

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30093

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30095

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30097

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30099

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30101

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30103

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30105

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30107

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30109

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30111

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30111:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30112:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30109:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30110:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30107:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30108:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30105:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30106:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30103:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30104:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30101:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30102:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30099:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30100:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30097:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30098:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30095:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30096:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30093:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30094:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30091:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30092:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30089:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30090:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30087:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30088:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30085:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30086:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30083:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30084:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30081:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30082:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30079:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30080:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30077:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30078:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30075:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30076:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30073:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30074:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30071:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30072:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30069:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30070:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30067:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30068:
	nop
	nop
	nop
	j	bgti_cont.30066

bgti_else.30065:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30066:
	nop
	nop
	nop
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.30113

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bgt_cont.30114

bgt_else.30113:
	nop
	nop
	nop
	sw	%v0, 5(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30115

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30117

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30119

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30121

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30123

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30125

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30127

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30129

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30131

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30133

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30135

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30137

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30139

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30141

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30143

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30145

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30147

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30149

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30151

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30153

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30155

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30157

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30159

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30161

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 6(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30161:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30162:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30159:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30160:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30157:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30158:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30155:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30156:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30153:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30154:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30151:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30152:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30149:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30150:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30147:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30148:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30145:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30146:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30143:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30144:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30141:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30142:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30139:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30140:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30137:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30138:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30135:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30136:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30133:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30134:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30131:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30132:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30129:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30130:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30127:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30128:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30125:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30126:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30123:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30124:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30121:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30122:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30119:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30120:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30117:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30118:
	nop
	nop
	nop
	j	bgti_cont.30116

bgti_else.30115:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30116:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

bgt_cont.30114:
bgt_cont.30048:
	nop
	nop
	nop
	addi	%v0, %zero, 32

	nop
	nop
	nop
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -8
	lw	%v0, 155(%zero)

	nop
	nop
	lw	%ra, 7(%sp)
	sw	%v0, 7(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.30163

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.30165

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.30167

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.30169

	nop
	nop
	nop
	addi	%v1, %v0, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30171

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30173

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30175

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30177

	nop
	addi	%v1, %v1, -40
	addi	%a0, %zero, 8
	sw	%ra, 8(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	j	bgti_cont.30164

bgti_else.30177:
	nop
	nop
	nop
	addi	%v0, %zero, 7

bgti_cont.30178:
	nop
	nop
	nop
	j	bgti_cont.30164

bgti_else.30175:
	nop
	nop
	nop
	addi	%v0, %zero, 6

bgti_cont.30176:
	nop
	nop
	nop
	j	bgti_cont.30164

bgti_else.30173:
	nop
	nop
	nop
	addi	%v0, %zero, 5

bgti_cont.30174:
	nop
	nop
	nop
	j	bgti_cont.30164

bgti_else.30171:
	nop
	nop
	nop
	addi	%v0, %zero, 4

bgti_cont.30172:
	nop
	nop
	nop
	j	bgti_cont.30164

bgti_else.30169:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.30170:
	nop
	nop
	nop
	j	bgti_cont.30164

bgti_else.30167:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.30168:
	nop
	nop
	nop
	j	bgti_cont.30164

bgti_else.30165:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.30166:
	nop
	nop
	nop
	j	bgti_cont.30164

bgti_else.30163:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.30164:
	nop
	nop
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30179

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30181

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30183

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30185

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30187

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30189

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30191

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30193

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30195

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30197

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30199

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30201

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30203

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30205

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30207

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30209

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30211

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30213

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30215

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30217

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30219

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30221

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30223

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30225

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30225:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30226:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30223:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30224:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30221:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30222:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30219:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30220:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30217:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30218:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30215:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30216:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30213:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30214:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30211:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30212:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30209:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30210:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30207:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30208:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30205:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30206:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30203:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30204:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30201:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30202:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30199:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30200:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30197:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30198:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30195:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30196:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30193:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30194:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30191:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30192:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30189:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30190:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30187:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30188:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30185:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30186:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30183:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30184:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30181:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30182:
	nop
	nop
	nop
	j	bgti_cont.30180

bgti_else.30179:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30180:
	nop
	nop
	nop
	lw	%v1, 8(%sp)

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.30227

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bgt_cont.30228

bgt_else.30227:
	nop
	nop
	nop
	sw	%v0, 9(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30229

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30231

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30233

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30235

	nop
	nop
	nop
	addi	%a0, %v1, -40

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.30237

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.30239

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.30241

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.30243

	nop
	addi	%a0, %a0, -40
	addi	%a1, %zero, 8
	sw	%ra, 10(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bgti_cont.30230

bgti_else.30243:
	nop
	nop
	nop
	addi	%v0, %zero, 7

bgti_cont.30244:
	nop
	nop
	nop
	j	bgti_cont.30230

bgti_else.30241:
	nop
	nop
	nop
	addi	%v0, %zero, 6

bgti_cont.30242:
	nop
	nop
	nop
	j	bgti_cont.30230

bgti_else.30239:
	nop
	nop
	nop
	addi	%v0, %zero, 5

bgti_cont.30240:
	nop
	nop
	nop
	j	bgti_cont.30230

bgti_else.30237:
	nop
	nop
	nop
	addi	%v0, %zero, 4

bgti_cont.30238:
	nop
	nop
	nop
	j	bgti_cont.30230

bgti_else.30235:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.30236:
	nop
	nop
	nop
	j	bgti_cont.30230

bgti_else.30233:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.30234:
	nop
	nop
	nop
	j	bgti_cont.30230

bgti_else.30231:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.30232:
	nop
	nop
	nop
	j	bgti_cont.30230

bgti_else.30229:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.30230:
	nop
	nop
	lw	%v1, 8(%sp)
	sw	%v0, 10(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30245

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30247

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30249

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30251

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30253

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30255

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30257

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30259

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30261

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30263

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30265

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30267

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30269

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30271

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30273

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30275

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30277

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30279

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30281

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30283

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30285

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30287

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30289

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30291

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 11(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30291:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30292:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30289:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30290:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30287:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30288:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30285:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30286:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30283:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30284:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30281:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30282:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30279:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30280:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30277:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30278:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30275:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30276:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30273:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30274:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30271:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30272:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30269:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30270:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30267:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30268:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30265:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30266:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30263:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30264:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30261:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30262:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30259:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30260:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30257:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30258:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30255:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30256:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30253:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30254:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30251:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30252:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30249:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30250:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30247:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30248:
	nop
	nop
	nop
	j	bgti_cont.30246

bgti_else.30245:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30246:
	nop
	nop
	nop
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.30293

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	bgt_cont.30294

bgt_else.30293:
	nop
	nop
	nop
	sw	%v0, 11(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30295

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30297

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30299

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30301

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30303

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30305

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30307

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30309

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30311

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30313

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30315

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30317

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30319

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30321

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30323

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30325

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30327

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30329

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30331

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30333

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30335

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30337

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30339

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30341

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30341:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30342:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30339:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30340:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30337:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30338:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30335:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30336:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30333:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30334:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30331:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30332:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30329:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30330:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30327:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30328:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30325:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30326:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30323:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30324:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30321:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30322:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30319:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30320:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30317:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30318:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30315:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30316:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30313:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30314:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30311:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30312:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30309:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30310:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30307:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30308:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30305:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30306:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30303:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30304:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30301:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30302:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30299:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30300:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30297:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30298:
	nop
	nop
	nop
	j	bgti_cont.30296

bgti_else.30295:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30296:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

bgt_cont.30294:
bgt_cont.30228:
	nop
	nop
	lw	%v0, 6(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v0, %zero, 175

	nop
	nop
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 8

	nop
	nop
	nop
	sw	%v1, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v1, %zero, 15

	nop
	lw	%ra, 13(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.30343

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bgt_cont.30344

bgt_else.30343:
	nop
	nop
	nop
	sw	%v0, 14(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30345

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30347

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30349

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30351

	nop
	nop
	nop
	addi	%a0, %v1, -40

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.30353

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.30355

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.30357

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.30359

	nop
	addi	%a0, %a0, -40
	lw	%a1, 12(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bgti_cont.30346

bgti_else.30359:
	nop
	nop
	nop
	addi	%v0, %zero, 7

bgti_cont.30360:
	nop
	nop
	nop
	j	bgti_cont.30346

bgti_else.30357:
	nop
	nop
	nop
	addi	%v0, %zero, 6

bgti_cont.30358:
	nop
	nop
	nop
	j	bgti_cont.30346

bgti_else.30355:
	nop
	nop
	nop
	addi	%v0, %zero, 5

bgti_cont.30356:
	nop
	nop
	nop
	j	bgti_cont.30346

bgti_else.30353:
	nop
	nop
	nop
	addi	%v0, %zero, 4

bgti_cont.30354:
	nop
	nop
	nop
	j	bgti_cont.30346

bgti_else.30351:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.30352:
	nop
	nop
	nop
	j	bgti_cont.30346

bgti_else.30349:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.30350:
	nop
	nop
	nop
	j	bgti_cont.30346

bgti_else.30347:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.30348:
	nop
	nop
	nop
	j	bgti_cont.30346

bgti_else.30345:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.30346:
	nop
	nop
	lw	%v1, 13(%sp)
	sw	%v0, 15(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30361

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30363

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30365

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30367

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30369

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30371

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30373

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30375

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30377

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30379

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30381

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30383

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30385

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30387

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30389

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30391

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30393

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30395

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30397

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30399

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30401

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30403

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30405

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30407

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 16(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30407:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30408:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30405:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30406:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30403:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30404:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30401:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30402:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30399:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30400:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30397:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30398:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30395:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30396:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30393:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30394:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30391:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30392:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30389:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30390:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30387:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30388:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30385:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30386:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30383:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30384:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30381:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30382:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30379:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30380:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30377:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30378:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30375:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30376:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30373:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30374:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30371:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30372:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30369:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30370:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30367:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30368:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30365:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30366:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30363:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30364:
	nop
	nop
	nop
	j	bgti_cont.30362

bgti_else.30361:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30362:
	nop
	nop
	nop
	lw	%v1, 15(%sp)

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.30409

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	lw	%v0, 14(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bgt_cont.30410

bgt_else.30409:
	nop
	nop
	nop
	sw	%v0, 16(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30411

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30413

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30415

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30417

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30419

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30421

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30423

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30425

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30427

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30429

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30431

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30433

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30435

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30437

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30439

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30441

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30443

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30445

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30447

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30449

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.30451

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.30453

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.30455

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.30457

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 17(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	nop
	lw	%ra, 17(%sp)

	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30457:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30458:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30455:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30456:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30453:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30454:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30451:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30452:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30449:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30450:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30447:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30448:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30445:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30446:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30443:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30444:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30441:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30442:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30439:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30440:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30437:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30438:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30435:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30436:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30433:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30434:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30431:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30432:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30429:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30430:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30427:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30428:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30425:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30426:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30423:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30424:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30421:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30422:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30419:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30420:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30417:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.30418:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30415:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.30416:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30413:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.30414:
	nop
	nop
	nop
	j	bgti_cont.30412

bgti_else.30411:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.30412:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	lw	%ra, 17(%sp)
	lw	%v0, 16(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	lw	%ra, 17(%sp)
	lw	%v0, 14(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	nop
	lw	%ra, 17(%sp)

bgt_cont.30410:
bgt_cont.30344:
	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	j	min_caml_print_char

pretrace_diffuse_rays.3043:
	nop
	nop
	nop
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.30479

	nop
	nop
	nop
	lw	%a0, 2(%v0)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.30480

	nop
	nop
	lw	%a0, 3(%v0)
	sw	%v1, 0(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30481

	nop
	nop
	lw	%a0, 6(%v0)
	flw	%f0, 470(%zero)

	nop
	nop
	lw	%a0, 0(%a0)
	fsw	%f0, 148(%zero)

	nop
	nop
	fsw	%f0, 149(%zero)
	lw	%a1, 7(%v0)

	nop
	fsw	%f0, 150(%zero)
	lw	%a2, 1(%v0)
	add	%at, %a1, %v1

	nop
	lw	%a0, 179(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v1

	nop
	nop
	lw	%a2, 0(%at)
	sw	%v0, 1(%sp)

	nop
	flw	%f0, 0(%a2)
	sw	%a2, 2(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%a1, 3(%sp)

	nop
	nop
	lw	%a3, 0(%zero)
	sw	%a0, 4(%sp)

	nop
	nop
	addi	%a3, %a3, -1
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%v1, %a3, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -6
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	addi	%sp, %sp, -6
	flw	%f0, 148(%zero)

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	lw	%v1, 5(%v0)
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	add	%at, %v1, %a0

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)

	nop
	nop
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)

	nop
	nop
	nop
	fsw	%f0, 2(%v1)

	nop
	nop
	nop
	j	bnei_cont.30482

bnei_else.30481:
bnei_cont.30482:
	nop
	nop
	lw	%v1, 0(%sp)
	addi	%at, %zero, 4

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.30483

	nop
	nop
	nop
	lw	%a0, 2(%v0)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.30484

	nop
	nop
	lw	%a0, 3(%v0)
	sw	%v1, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30485

	nop
	nop
	lw	%a0, 6(%v0)
	flw	%f0, 470(%zero)

	nop
	nop
	lw	%a0, 0(%a0)
	fsw	%f0, 148(%zero)

	nop
	nop
	fsw	%f0, 149(%zero)
	lw	%a1, 7(%v0)

	nop
	fsw	%f0, 150(%zero)
	lw	%a2, 1(%v0)
	add	%at, %a1, %v1

	nop
	lw	%a0, 179(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v1

	nop
	nop
	lw	%a2, 0(%at)
	sw	%v0, 1(%sp)

	nop
	flw	%f1, 0(%a2)
	sw	%a2, 6(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)

	nop
	nop
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)

	nop
	nop
	fsw	%f1, 164(%zero)
	fsw	%f0, 7(%sp)

	nop
	nop
	lw	%a3, 0(%zero)
	sw	%a1, 8(%sp)

	nop
	nop
	addi	%a3, %a3, -1
	sw	%a0, 9(%sp)

	nop
	nop
	addi	%v1, %a3, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a1, 8(%sp)

	nop
	nop
	lw	%a0, 0(%v1)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 7(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.30487

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.30488

fbgt_else.30487:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.30488:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30489

	nop
	nop
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)

	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.30490

bnei_else.30489:
	nop
	flw	%f1, 437(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.30490:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	lw	%a0, 6(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	addi	%sp, %sp, -11
	flw	%f0, 148(%zero)

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	lw	%v1, 5(%v0)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %v1, %a0

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)

	nop
	nop
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)

	nop
	nop
	nop
	fsw	%f0, 2(%v1)

	nop
	nop
	nop
	j	bnei_cont.30486

bnei_else.30485:
bnei_cont.30486:
	nop
	nop
	nop
	lw	%v1, 5(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	j	pretrace_diffuse_rays.3043

bgti_else.30484:
	nop
	nop
	nop
	jr	%ra

bgt_else.30483:
	nop
	nop
	nop
	jr	%ra

bgti_else.30480:
	nop
	nop
	nop
	jr	%ra

bgt_else.30479:
	nop
	nop
	nop
	jr	%ra

pretrace_pixels.3046:
	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.30519

	nop
	nop
	flw	%f3, 158(%zero)
	lw	%a2, 156(%zero)

	nop
	nop
	nop
	sub	%a2, %v1, %a2

	nop
	nop
	nop
	itof	%f4, %a2

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f4, 165(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f4

	nop
	nop
	nop
	fadd	%f4, %f4, %f0

	nop
	nop
	nop
	fsw	%f4, 174(%zero)

	nop
	nop
	addi	%a2, %zero, 1
	flw	%f4, 166(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f4

	nop
	nop
	nop
	fadd	%f4, %f4, %f1

	nop
	nop
	nop
	fsw	%f4, 175(%zero)

	nop
	nop
	nop
	flw	%f4, 167(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f3, %f2

	nop
	nop
	nop
	fsw	%f3, 176(%zero)

	nop
	nop
	flw	%f3, 174(%zero)
	flw	%f5, 175(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f5, %f5

	nop
	nop
	fadd	%f4, %f4, %f6
	flw	%f6, 176(%zero)

	nop
	nop
	nop
	fmul	%f7, %f6, %f6

	nop
	nop
	fadd	%f4, %f4, %f7
	flw	%f7, 470(%zero)

	nop
	nop
	nop
	fsqrt	%f4, %f4

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.30520

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.30521

fbeq_else.30520:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.30521:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30522

	nop
	nop
	nop
	flw	%f4, 474(%zero)

	nop
	nop
	nop
	j	bnei_cont.30523

bnei_else.30522:
	nop
	nop
	nop
	flw	%f8, 474(%zero)

	nop
	nop
	nop
	fdiv	%f4, %f8, %f4

bnei_cont.30523:
	nop
	fmul	%f3, %f3, %f4
	add	%at, %v0, %v1
	fsw	%f2, 0(%sp)

	nop
	fsw	%f3, 174(%zero)
	fmul	%f3, %f5, %f4
	lw	%a3, 0(%at)

	fsw	%f3, 175(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f1, 1(%sp)
	fmov	%f1, %f7

	nop
	nop
	fsw	%f3, 176(%zero)
	fsw	%f0, 2(%sp)

	nop
	fsw	%f7, 151(%zero)
	sw	%v0, 3(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	fsw	%f7, 152(%zero)
	sw	%v1, 4(%sp)

	nop
	nop
	fsw	%f7, 153(%zero)
	sw	%a2, 5(%sp)

	nop
	nop
	flw	%f3, 75(%zero)
	fsw	%f7, 6(%sp)

	nop
	fsw	%f3, 159(%zero)
	sw	%a0, 7(%sp)
	addi	%a0, %a3, 0

	nop
	nop
	flw	%f3, 76(%zero)
	sw	%a3, 8(%sp)

	nop
	nop
	fsw	%f3, 160(%zero)
	sw	%ra, 9(%sp)

	nop
	nop
	flw	%f3, 77(%zero)
	addi	%sp, %sp, 10

	nop
	nop
	nop
	fsw	%f3, 161(%zero)

	nop
	nop
	flw	%f3, 474(%zero)
	addi	%t0, %zero, 174

	nop
	nop
	addi	%v1, %t0, 0
	fmov	%f0, %f3

	nop
	nop
	nop
	jal	trace_ray.2983

	nop
	nop
	addi	%sp, %sp, -10
	flw	%f0, 151(%zero)

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	lw	%v1, 0(%v0)
	lw	%a0, 7(%sp)

	nop
	nop
	fsw	%f0, 0(%v1)
	flw	%f0, 152(%zero)

	nop
	nop
	fsw	%f0, 1(%v1)
	flw	%f0, 153(%zero)

	nop
	nop
	nop
	fsw	%f0, 2(%v1)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	sw	%a0, 0(%v1)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.30524

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.30526

	nop
	nop
	lw	%v1, 6(%v0)
	flw	%f0, 6(%sp)

	nop
	nop
	lw	%v1, 0(%v1)
	fsw	%f0, 148(%zero)

	nop
	nop
	fsw	%f0, 149(%zero)
	lw	%a1, 7(%v0)

	nop
	nop
	fsw	%f0, 150(%zero)
	lw	%a2, 1(%v0)

	nop
	nop
	lw	%v1, 179(%v1)
	lw	%a1, 0(%a1)

	nop
	nop
	nop
	lw	%a2, 0(%a2)

	nop
	flw	%f1, 0(%a2)
	sw	%a2, 9(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)

	nop
	nop
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)

	nop
	nop
	fsw	%f1, 164(%zero)
	sw	%a1, 10(%sp)

	nop
	nop
	lw	%a3, 0(%zero)
	sw	%v1, 11(%sp)

	nop
	nop
	addi	%a3, %a3, -1
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%v1, %a3, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	setup_startp_constants.2894

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a1, 10(%sp)

	nop
	nop
	lw	%a0, 0(%v1)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.30528

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.30529

fbgt_else.30528:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.30529:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30530

	nop
	nop
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)

	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	bnei_cont.30531

bnei_else.30530:
	nop
	flw	%f1, 437(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	trace_diffuse_ray.2989

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

bnei_cont.30531:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 11(%sp)
	lw	%v1, 10(%sp)

	nop
	nop
	lw	%a0, 9(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	addi	%sp, %sp, -13
	flw	%f0, 148(%zero)

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)

	nop
	nop
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)

	nop
	nop
	nop
	fsw	%f0, 2(%v1)

	nop
	nop
	nop
	j	bnei_cont.30527

bnei_else.30526:
bnei_cont.30527:
	nop
	nop
	lw	%v1, 5(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	pretrace_diffuse_rays.3043

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	bgti_cont.30525

bgti_else.30524:
bgti_cont.30525:
	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	addi	%v1, %v0, -1
	lw	%v0, 7(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.30532

	nop
	nop
	nop
	addi	%a0, %v0, -5

	nop
	nop
	nop
	j	bgti_cont.30533

bgti_else.30532:
	nop
	nop
	nop
	add	%a0, %zero, %v0

bgti_cont.30533:
	nop
	nop
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)

	nop
	nop
	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	j	pretrace_pixels.3046

bgti_else.30519:
	nop
	nop
	nop
	jr	%ra

scan_pixel.3057:
	nop
	nop
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)

	nop
	nop
	nop
	blt	%v0, %t0, bgt_else.31977

	nop
	nop
	nop
	jr	%ra

bgt_else.31977:
	nop
	nop
	add	%at, %a1, %v0
	addi	%t4, %v1, 1

	nop
	nop
	nop
	lw	%t1, 0(%at)

	nop
	nop
	nop
	lw	%t2, 0(%t1)

	nop
	nop
	nop
	flw	%f0, 0(%t2)

	nop
	nop
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%t2)

	nop
	addi	%t3, %zero, 1
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%t2)

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	lw	%t2, 155(%zero)

	nop
	nop
	nop
	blt	%t4, %t2, bgt_else.31979

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.31980

bgt_else.31979:
	nop
	nop
	nop
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.31981

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.31982

bgt_else.31981:
	nop
	nop
	nop
	addi	%t5, %v0, 1

	nop
	nop
	nop
	blt	%t5, %t0, bgt_else.31983

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.31984

bgt_else.31983:
	nop
	nop
	nop
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.31985

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.31986

bgt_else.31985:
	nop
	nop
	nop
	addi	%t5, %zero, 1

bgt_cont.31986:
bgt_cont.31984:
bgt_cont.31982:
bgt_cont.31980:
	nop
	nop
	nop
	sw	%a2, 0(%sp)

	nop
	nop
	nop
	sw	%a0, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%t4, 3(%sp)

	nop
	nop
	nop
	sw	%t2, 4(%sp)

	nop
	nop
	nop
	sw	%a1, 5(%sp)

	nop
	nop
	nop
	sw	%t0, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 7(%sp)

	nop
	nop
	nop
	sw	%a3, 8(%sp)

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.31987

	nop
	nop
	nop
	lw	%t5, 2(%t1)

	nop
	nop
	nop
	lw	%t5, 0(%t5)

	nop
	nop
	nop
	blti	%t5, 0, bnei_cont.31988

	nop
	nop
	lw	%t5, 2(%t1)
	add	%at, %a0, %v0

	nop
	nop
	lw	%t5, 0(%t5)
	lw	%t6, 0(%at)

	nop
	nop
	nop
	lw	%t6, 2(%t6)

	nop
	nop
	nop
	lw	%t6, 0(%t6)

	nop
	nop
	nop
	bne	%t6, %t5, beq_else.31991

	nop
	nop
	nop
	add	%at, %a2, %v0

	nop
	nop
	nop
	lw	%t6, 0(%at)

	nop
	nop
	nop
	lw	%t6, 2(%t6)

	nop
	nop
	nop
	lw	%t6, 0(%t6)

	nop
	nop
	nop
	bne	%t6, %t5, beq_else.31993

	nop
	nop
	nop
	addi	%t6, %v0, -1

	nop
	nop
	nop
	add	%at, %a1, %t6

	nop
	nop
	nop
	lw	%t6, 0(%at)

	nop
	nop
	nop
	lw	%t6, 2(%t6)

	nop
	nop
	nop
	lw	%t6, 0(%t6)

	nop
	nop
	nop
	bne	%t6, %t5, beq_else.31995

	nop
	nop
	nop
	addi	%t6, %v0, 1

	nop
	nop
	nop
	add	%at, %a1, %t6

	nop
	nop
	nop
	lw	%t6, 0(%at)

	nop
	nop
	nop
	lw	%t6, 2(%t6)

	nop
	nop
	nop
	lw	%t6, 0(%t6)

	nop
	nop
	nop
	bne	%t6, %t5, beq_else.31997

	nop
	nop
	nop
	addi	%t5, %zero, 1

	nop
	nop
	nop
	j	beq_cont.31992

beq_else.31997:
	nop
	nop
	nop
	addi	%t5, %zero, 0

beq_cont.31998:
	nop
	nop
	nop
	j	beq_cont.31992

beq_else.31995:
	nop
	nop
	nop
	addi	%t5, %zero, 0

beq_cont.31996:
	nop
	nop
	nop
	j	beq_cont.31992

beq_else.31993:
	nop
	nop
	nop
	addi	%t5, %zero, 0

beq_cont.31994:
	nop
	nop
	nop
	j	beq_cont.31992

beq_else.31991:
	nop
	nop
	nop
	addi	%t5, %zero, 0

beq_cont.31992:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.31999

	nop
	nop
	lw	%t1, 3(%t1)
	sw	%t3, 9(%sp)

	nop
	nop
	nop
	lw	%t1, 0(%t1)

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.32001

	nop
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	calc_diffuse_using_5points.3008

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.32002

bnei_else.32001:
bnei_cont.32002:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	lw	%a0, 1(%sp)
	lw	%a1, 5(%sp)

	nop
	nop
	lw	%a2, 0(%sp)
	lw	%a3, 9(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	try_exploit_neighbors.3030

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.31988

bnei_else.31999:
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	do_without_neighbors.3014

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.32000:
	nop
	nop
	nop
	j	bnei_cont.31988

bgti_else.31989:
bgti_cont.31990:
	nop
	nop
	nop
	j	bnei_cont.31988

bnei_else.31987:
	nop
	nop
	nop
	lw	%t5, 2(%t1)

	nop
	nop
	nop
	lw	%t5, 0(%t5)

	nop
	nop
	nop
	blti	%t5, 0, bgti_else.32003

	nop
	nop
	lw	%t5, 3(%t1)
	sw	%t3, 9(%sp)

	nop
	nop
	lw	%t5, 0(%t5)
	sw	%t1, 10(%sp)

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.32005

	nop
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	calc_diffuse_using_1point.3005

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	bnei_cont.32006

bnei_else.32005:
bnei_cont.32006:
	nop
	nop
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	do_without_neighbors.3014

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	bgti_cont.32004

bgti_else.32003:
bgti_cont.32004:
bnei_cont.31988:
	nop
	nop
	flw	%f0, 151(%zero)
	addi	%at, %zero, 255

	nop
	nop
	nop
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32007

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32009

	nop
	nop
	nop
	j	bgt_cont.32008

bgti_else.32009:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.32010:
	nop
	nop
	nop
	j	bgt_cont.32008

bgt_else.32007:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.32008:
	nop
	nop
	lw	%v1, 8(%sp)
	sw	%v0, 11(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %zero, 10

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%a0, 11(%sp)

	nop
	nop
	nop
	sw	%v1, 12(%sp)

	nop
	nop
	nop
	sw	%v0, 13(%sp)

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.32011

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.32013

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.32015

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.32017

	nop
	nop
	nop
	addi	%a0, %a0, -40

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.32019

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.32021

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.32023

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.32025

	nop
	nop
	nop
	addi	%a0, %a0, -40

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.32027

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.32029

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.32031

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.32033

	nop
	nop
	nop
	addi	%a0, %a0, -40

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.32035

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.32037

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.32039

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.32041

	nop
	nop
	addi	%a0, %a0, -40
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32041:
	nop
	nop
	nop
	addi	%v0, %a0, -30

bgti_cont.32042:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32039:
	nop
	nop
	nop
	addi	%v0, %a0, -20

bgti_cont.32040:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32037:
	nop
	nop
	nop
	addi	%v0, %a0, -10

bgti_cont.32038:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32035:
	nop
	nop
	nop
	add	%v0, %zero, %a0

bgti_cont.32036:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32033:
	nop
	nop
	nop
	addi	%v0, %a0, -30

bgti_cont.32034:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32031:
	nop
	nop
	nop
	addi	%v0, %a0, -20

bgti_cont.32032:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32029:
	nop
	nop
	nop
	addi	%v0, %a0, -10

bgti_cont.32030:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32027:
	nop
	nop
	nop
	add	%v0, %zero, %a0

bgti_cont.32028:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32025:
	nop
	nop
	nop
	addi	%v0, %a0, -30

bgti_cont.32026:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32023:
	nop
	nop
	nop
	addi	%v0, %a0, -20

bgti_cont.32024:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32021:
	nop
	nop
	nop
	addi	%v0, %a0, -10

bgti_cont.32022:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32019:
	nop
	nop
	nop
	add	%v0, %zero, %a0

bgti_cont.32020:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32017:
	nop
	nop
	nop
	addi	%v0, %a0, -30

bgti_cont.32018:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32015:
	nop
	nop
	nop
	addi	%v0, %a0, -20

bgti_cont.32016:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32013:
	nop
	nop
	nop
	addi	%v0, %a0, -10

bgti_cont.32014:
	nop
	nop
	nop
	j	bgti_cont.32012

bgti_else.32011:
	nop
	nop
	nop
	add	%v0, %zero, %a0

bgti_cont.32012:
	nop
	nop
	lw	%v1, 13(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.32043

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bgt_cont.32044

bgt_else.32043:
	nop
	lw	%a0, 8(%sp)
	sw	%v0, 14(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 13(%sp)

	nop
	nop
	nop
	sw	%v0, 15(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32045

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32047

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32049

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32051

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32053

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32055

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32057

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32059

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32061

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32063

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32065

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32067

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32069

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32071

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32073

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32075

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 16(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32075:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32076:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32073:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32074:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32071:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32072:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32069:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32070:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32067:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32068:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32065:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32066:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32063:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32064:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32061:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32062:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32059:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32060:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32057:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32058:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32055:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32056:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32053:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32054:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32051:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32052:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32049:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32050:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32047:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32048:
	nop
	nop
	nop
	j	bgti_cont.32046

bgti_else.32045:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32046:
	nop
	nop
	lw	%v1, 15(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.32077

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	lw	%v0, 14(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bgt_cont.32078

bgt_else.32077:
	nop
	nop
	nop
	sw	%v0, 16(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32079

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32081

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32083

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32085

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32087

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32089

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32091

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32093

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32095

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32097

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32099

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32101

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32103

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32105

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32107

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32109

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 17(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	nop
	lw	%ra, 17(%sp)

	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32109:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32110:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32107:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32108:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32105:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32106:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32103:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32104:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32101:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32102:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32099:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32100:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32097:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32098:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32095:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32096:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32093:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32094:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32091:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32092:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32089:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32090:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32087:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32088:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32085:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32086:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32083:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32084:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32081:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32082:
	nop
	nop
	nop
	j	bgti_cont.32080

bgti_else.32079:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32080:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	lw	%ra, 17(%sp)
	lw	%v0, 16(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	lw	%ra, 17(%sp)
	lw	%v0, 14(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	nop
	lw	%ra, 17(%sp)

bgt_cont.32078:
bgt_cont.32044:
	nop
	nop
	nop
	addi	%v0, %zero, 32

	nop
	nop
	nop
	sw	%v0, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -19
	flw	%f0, 152(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 18(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32111

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32113

	nop
	nop
	nop
	j	bgt_cont.32112

bgti_else.32113:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.32114:
	nop
	nop
	nop
	j	bgt_cont.32112

bgt_else.32111:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.32112:
	nop
	nop
	lw	%v1, 8(%sp)
	sw	%v0, 18(%sp)

	nop
	nop
	nop
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	nop
	sw	%v0, 19(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32115

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32117

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32119

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32121

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32123

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32125

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32127

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32129

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32131

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32133

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32135

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32137

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32139

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32141

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32143

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32145

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 20(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32145:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32146:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32143:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32144:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32141:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32142:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32139:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32140:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32137:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32138:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32135:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32136:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32133:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32134:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32131:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32132:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32129:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32130:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32127:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32128:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32125:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32126:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32123:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32124:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32121:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32122:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32119:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32120:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32117:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32118:
	nop
	nop
	nop
	j	bgti_cont.32116

bgti_else.32115:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32116:
	nop
	nop
	lw	%v1, 19(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.32147

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	bgt_cont.32148

bgt_else.32147:
	nop
	lw	%a0, 8(%sp)
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 19(%sp)

	nop
	nop
	nop
	sw	%v0, 21(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32149

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32151

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32153

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32155

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32157

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32159

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32161

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32163

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32165

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32167

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32169

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32171

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32173

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32175

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32177

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32179

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 22(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32179:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32180:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32177:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32178:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32175:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32176:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32173:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32174:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32171:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32172:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32169:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32170:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32167:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32168:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32165:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32166:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32163:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32164:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32161:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32162:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32159:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32160:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32157:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32158:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32155:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32156:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32153:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32154:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32151:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32152:
	nop
	nop
	nop
	j	bgti_cont.32150

bgti_else.32149:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32150:
	nop
	nop
	lw	%v1, 21(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.32181

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v0, 20(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

	nop
	nop
	nop
	j	bgt_cont.32182

bgt_else.32181:
	nop
	nop
	nop
	sw	%v0, 22(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32183

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32185

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32187

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32189

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32191

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32193

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32195

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32197

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32199

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32201

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32203

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32205

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32207

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32209

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32211

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32213

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 23(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32213:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32214:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32211:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32212:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32209:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32210:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32207:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32208:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32205:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32206:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32203:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32204:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32201:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32202:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32199:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32200:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32197:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32198:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32195:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32196:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32193:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32194:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32191:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32192:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32189:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32190:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32187:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32188:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32185:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32186:
	nop
	nop
	nop
	j	bgti_cont.32184

bgti_else.32183:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32184:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	lw	%ra, 23(%sp)
	lw	%v0, 22(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	lw	%ra, 23(%sp)
	lw	%v0, 20(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

bgt_cont.32182:
bgt_cont.32148:
	nop
	nop
	lw	%v0, 17(%sp)
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -24
	flw	%f0, 153(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 23(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32215

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32217

	nop
	nop
	nop
	j	bgt_cont.32216

bgti_else.32217:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.32218:
	nop
	nop
	nop
	j	bgt_cont.32216

bgt_else.32215:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.32216:
	nop
	nop
	lw	%v1, 8(%sp)
	sw	%v0, 23(%sp)

	nop
	nop
	nop
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)

	nop
	nop
	nop
	sw	%v0, 24(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32219

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32221

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32223

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32225

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32227

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32229

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32231

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32233

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32235

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32237

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32239

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32241

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32243

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32245

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32247

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32249

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 25(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32249:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32250:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32247:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32248:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32245:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32246:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32243:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32244:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32241:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32242:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32239:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32240:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32237:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32238:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32235:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32236:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32233:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32234:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32231:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32232:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32229:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32230:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32227:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32228:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32225:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32226:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32223:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32224:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32221:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32222:
	nop
	nop
	nop
	j	bgti_cont.32220

bgti_else.32219:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32220:
	nop
	nop
	lw	%v1, 24(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.32251

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 25(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	bgt_cont.32252

bgt_else.32251:
	nop
	lw	%a0, 8(%sp)
	sw	%v0, 25(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v1, 24(%sp)

	nop
	nop
	nop
	sw	%v0, 26(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32253

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32255

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32257

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32259

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32261

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32263

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32265

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32267

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32269

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32271

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32273

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32275

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32277

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32279

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32281

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32283

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 27(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32283:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32284:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32281:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32282:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32279:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32280:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32277:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32278:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32275:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32276:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32273:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32274:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32271:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32272:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32269:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32270:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32267:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32268:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32265:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32266:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32263:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32264:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32261:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32262:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32259:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32260:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32257:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32258:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32255:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32256:
	nop
	nop
	nop
	j	bgti_cont.32254

bgti_else.32253:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32254:
	nop
	nop
	lw	%v1, 26(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.32285

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v0, 25(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	bgt_cont.32286

bgt_else.32285:
	nop
	nop
	nop
	sw	%v0, 27(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32287

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32289

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32291

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32293

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32295

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32297

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32299

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32301

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32303

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32305

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32307

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32309

	nop
	nop
	nop
	addi	%v1, %v1, -40

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.32311

	nop
	nop
	nop
	blti	%v1, 20, bgti_else.32313

	nop
	nop
	nop
	blti	%v1, 30, bgti_else.32315

	nop
	nop
	nop
	blti	%v1, 40, bgti_else.32317

	nop
	nop
	addi	%v1, %v1, -40
	sw	%ra, 28(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32317:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32318:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32315:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32316:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32313:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32314:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32311:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32312:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32309:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32310:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32307:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32308:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32305:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32306:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32303:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32304:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32301:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32302:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32299:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32300:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32297:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32298:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32295:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32296:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32293:
	nop
	nop
	nop
	addi	%v0, %v1, -30

bgti_cont.32294:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32291:
	nop
	nop
	nop
	addi	%v0, %v1, -20

bgti_cont.32292:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32289:
	nop
	nop
	nop
	addi	%v0, %v1, -10

bgti_cont.32290:
	nop
	nop
	nop
	j	bgti_cont.32288

bgti_else.32287:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.32288:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	lw	%ra, 28(%sp)
	lw	%v0, 27(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	lw	%ra, 28(%sp)
	lw	%v0, 25(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

bgt_cont.32286:
bgt_cont.32252:
	nop
	nop
	lw	%v0, 12(%sp)
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	lw	%ra, 28(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)

	nop
	nop
	nop
	blt	%v0, %v1, bgt_else.32319

	nop
	nop
	nop
	jr	%ra

bgt_else.32319:
	nop
	nop
	lw	%a1, 5(%sp)
	lw	%a3, 4(%sp)

	nop
	nop
	nop
	add	%at, %a1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a2, 0(%a0)

	nop
	nop
	nop
	flw	%f0, 0(%a2)

	nop
	nop
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)

	nop
	nop
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)

	nop
	nop
	fsw	%f0, 153(%zero)
	lw	%a2, 3(%sp)

	nop
	nop
	nop
	blt	%a2, %a3, bgt_else.32321

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.32322

bgt_else.32321:
	nop
	nop
	lw	%a2, 2(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.32323

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.32324

bgt_else.32323:
	nop
	nop
	nop
	addi	%a3, %v0, 1

	nop
	nop
	nop
	blt	%a3, %v1, bgt_else.32325

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.32326

bgt_else.32325:
	nop
	nop
	nop
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32327

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.32328

bgt_else.32327:
	nop
	nop
	nop
	addi	%v1, %zero, 1

bgt_cont.32328:
bgt_cont.32326:
bgt_cont.32324:
bgt_cont.32322:
	nop
	nop
	nop
	sw	%v0, 28(%sp)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32329

	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)

	nop
	nop
	lw	%a2, 0(%sp)
	lw	%a3, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	try_exploit_neighbors.3030

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	nop
	lw	%ra, 29(%sp)

	nop
	nop
	nop
	j	bnei_cont.32330

bnei_else.32329:
	nop
	lw	%v1, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	do_without_neighbors.3014

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	nop
	lw	%ra, 29(%sp)

bnei_cont.32330:
	nop
	nop
	flw	%f0, 151(%zero)
	addi	%at, %zero, 255

	nop
	nop
	nop
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32331

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32333

	nop
	nop
	nop
	j	bgt_cont.32332

bgti_else.32333:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.32334:
	nop
	nop
	nop
	j	bgt_cont.32332

bgt_else.32331:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.32332:
	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	print_int.2646

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v0, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -30
	flw	%f0, 152(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 29(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32335

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32337

	nop
	nop
	nop
	j	bgt_cont.32336

bgti_else.32337:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.32338:
	nop
	nop
	nop
	j	bgt_cont.32336

bgt_else.32335:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.32336:
	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	print_int.2646

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v0, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -30
	flw	%f0, 153(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 29(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32339

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32341

	nop
	nop
	nop
	j	bgt_cont.32340

bgti_else.32341:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.32342:
	nop
	nop
	nop
	j	bgt_cont.32340

bgt_else.32339:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.32340:
	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	print_int.2646

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v0, 28(%sp)

	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)

	nop
	nop
	lw	%a1, 5(%sp)
	lw	%a2, 0(%sp)

	nop
	nop
	nop
	j	scan_pixel.3057

scan_line.3063:
	nop
	nop
	addi	%a3, %zero, 1
	lw	%t0, 155(%zero)

	nop
	nop
	nop
	blt	%v0, %t0, bgt_else.32408

	nop
	nop
	nop
	jr	%ra

bgt_else.32408:
	nop
	nop
	nop
	addi	%t1, %t0, -1

	nop
	nop
	nop
	sw	%t1, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	nop
	sw	%a3, 2(%sp)

	nop
	nop
	nop
	sw	%a1, 3(%sp)

	nop
	nop
	nop
	sw	%v1, 4(%sp)

	nop
	nop
	nop
	sw	%t0, 5(%sp)

	nop
	nop
	nop
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%a0, 7(%sp)

	nop
	nop
	nop
	blt	%v0, %t1, bgt_else.32410

	nop
	nop
	nop
	j	bgt_cont.32411

bgt_else.32410:
	addi	%t2, %v0, 1
	flw	%f0, 158(%zero)
	lw	%t3, 157(%zero)
	addi	%a0, %a2, 0

	sub	%t2, %t2, %t3
	flw	%f2, 171(%zero)
	flw	%f3, 172(%zero)
	addi	%v0, %a1, 0

	nop
	itof	%f1, %t2
	lw	%t2, 154(%zero)
	sw	%ra, 8(%sp)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	addi	%t2, %t2, -1

	nop
	nop
	fmul	%f1, %f0, %f1
	addi	%v1, %t2, 0

	nop
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	addi	%sp, %sp, 9

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)

	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 173(%zero)
	fmov	%f29, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

	nop
	nop
	fmov	%f2, %f0
	fmov	%f0, %f1

	nop
	nop
	nop
	fmov	%f1, %f29

	nop
	nop
	nop
	jal	pretrace_pixels.3046

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

bgt_cont.32411:
	nop
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	addi	%at, %zero, 0

	nop
	nop
	nop
	sw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%v0, 9(%sp)

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32412

	nop
	nop
	nop
	j	bgt_cont.32413

bgt_else.32412:
	nop
	nop
	lw	%a1, 7(%sp)
	lw	%t0, 5(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%a1)

	nop
	nop
	nop
	lw	%a2, 0(%a0)

	nop
	nop
	nop
	flw	%f0, 0(%a2)

	nop
	nop
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)

	nop
	nop
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)

	nop
	nop
	fsw	%f0, 153(%zero)
	lw	%a2, 6(%sp)

	nop
	nop
	nop
	addi	%a3, %a2, 1

	nop
	nop
	nop
	blt	%a3, %t0, bgt_else.32414

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.32415

bgt_else.32414:
	nop
	nop
	nop
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.32416

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.32417

bgt_else.32416:
	nop
	nop
	nop
	addi	%at, %zero, 1

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32418

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.32419

bgt_else.32418:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bgt_cont.32419:
bgt_cont.32417:
bgt_cont.32415:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.32420

	nop
	lw	%a0, 4(%sp)
	lw	%a3, 3(%sp)
	addi	%v0, %v1, 0

	nop
	addi	%k0, %a3, 0
	addi	%a3, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	addi	%v1, %a2, 0
	addi	%a2, %k0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	try_exploit_neighbors.3030

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.32421

bnei_else.32420:
	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	do_without_neighbors.3014

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.32421:
	nop
	nop
	flw	%f0, 151(%zero)
	addi	%at, %zero, 255

	nop
	nop
	nop
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32422

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32424

	nop
	nop
	nop
	j	bgt_cont.32423

bgti_else.32424:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.32425:
	nop
	nop
	nop
	j	bgt_cont.32423

bgt_else.32422:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.32423:
	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int.2646

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %zero, 32

	nop
	nop
	lw	%ra, 10(%sp)
	sw	%v0, 10(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -12
	flw	%f0, 152(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 11(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32426

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32428

	nop
	nop
	nop
	j	bgt_cont.32427

bgti_else.32428:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.32429:
	nop
	nop
	nop
	j	bgt_cont.32427

bgt_else.32426:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.32427:
	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	print_int.2646

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -12
	flw	%f0, 153(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 11(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.32430

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32432

	nop
	nop
	nop
	j	bgt_cont.32431

bgti_else.32432:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.32433:
	nop
	nop
	nop
	j	bgt_cont.32431

bgt_else.32430:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.32431:
	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	print_int.2646

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v0, %zero, 10

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)

	nop
	nop
	lw	%v1, 6(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	lw	%a1, 7(%sp)
	lw	%a2, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	scan_pixel.3057

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

bgt_cont.32413:
	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 2

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.32434

	nop
	nop
	nop
	addi	%a0, %v0, -5

	nop
	nop
	nop
	j	bgti_cont.32435

bgti_else.32434:
	nop
	nop
	nop
	add	%a0, %zero, %v0

bgti_cont.32435:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	blt	%v1, %v0, bgt_else.32436

	nop
	nop
	nop
	jr	%ra

bgt_else.32436:
	nop
	nop
	lw	%v0, 0(%sp)
	sw	%a0, 11(%sp)

	nop
	nop
	nop
	sw	%v1, 12(%sp)

	nop
	nop
	nop
	blt	%v1, %v0, bgt_else.32438

	nop
	nop
	nop
	j	bgt_cont.32439

bgt_else.32438:
	nop
	addi	%v0, %v1, 1
	flw	%f0, 158(%zero)
	lw	%a1, 157(%zero)

	nop
	sub	%v0, %v0, %a1
	flw	%f2, 171(%zero)
	flw	%f3, 172(%zero)

	nop
	itof	%f1, %v0
	lw	%v0, 9(%sp)
	lw	%a1, 4(%sp)

	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	addi	%v0, %v0, -1
	sw	%ra, 13(%sp)

	nop
	nop
	fmul	%f1, %f0, %f1
	addi	%v1, %v0, 0

	nop
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	addi	%v0, %a1, 0

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%sp, %sp, 14

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)

	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 173(%zero)
	fmov	%f29, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

	nop
	nop
	fmov	%f2, %f0
	fmov	%f0, %f1

	nop
	nop
	nop
	fmov	%f1, %f29

	nop
	nop
	nop
	jal	pretrace_pixels.3046

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	nop
	lw	%ra, 13(%sp)

bgt_cont.32439:
	nop
	nop
	lw	%v0, 8(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	lw	%a0, 7(%sp)
	lw	%a1, 3(%sp)

	nop
	nop
	lw	%a2, 4(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	scan_pixel.3057

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 11(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 2

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.32440

	nop
	nop
	nop
	addi	%a2, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.32441

bgti_else.32440:
	nop
	nop
	nop
	add	%a2, %zero, %v1

bgti_cont.32441:
	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	lw	%a1, 7(%sp)

	nop
	nop
	nop
	j	scan_line.3063

create_pixel.3071:
	nop
	nop
	addi	%v0, %zero, 3
	flw	%f0, 470(%zero)

	nop
	nop
	nop
	fsw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 2(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -3

	nop
	nop
	lw	%ra, 2(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%v0, 2(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 5

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v1, %zero, 1

	nop
	nop
	lw	%ra, 4(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%a0, 1(%sp)
	sw	%v1, 4(%sp)

	nop
	nop
	sw	%v0, 5(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)

	nop
	sw	%v0, 4(%v1)
	addi	%v0, %zero, 0
	lw	%a0, 3(%sp)

	nop
	sw	%v0, 6(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 3(%sp)

	nop
	lw	%a0, 6(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%v0, 8(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%v0, 10(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 4(%sp)

	nop
	nop
	lw	%a0, 6(%sp)
	sw	%ra, 11(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%v0, 12(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 10(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 9(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 7(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 5(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	jr	%ra

init_line_elements.3073:
	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.32668

	nop
	addi	%a1, %zero, 3
	flw	%f0, 470(%zero)
	sw	%v1, 0(%sp)

	nop
	nop
	sw	%v0, 1(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%a0, 2(%sp)

	nop
	nop
	nop
	fsw	%f0, 3(%sp)

	nop
	nop
	nop
	sw	%a1, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 5(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 5

	nop
	nop
	nop
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 1

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%a0, 4(%sp)
	sw	%v1, 7(%sp)

	nop
	nop
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 6(%sp)

	nop
	lw	%a0, 2(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 10(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 12(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 13(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -15
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 14(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)

	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 10(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 9(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 5(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 0(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32669

	nop
	nop
	nop
	sw	%v0, 15(%sp)

	nop
	nop
	nop
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	create_pixel.3071

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	lw	%v1, 15(%sp)

	nop
	nop
	nop
	lw	%a0, 1(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32670

	nop
	nop
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	lw	%ra, 17(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 17(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 18(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 6(%sp)

	nop
	lw	%a0, 2(%sp)
	sw	%v0, 19(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	lw	%ra, 20(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 20(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 21(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -23
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 22(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 23(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	lw	%ra, 23(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 23(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -25
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 24(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	lw	%ra, 24(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 24(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 25(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)

	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 23(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 22(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 20(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 19(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 16(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32671

	nop
	nop
	nop
	sw	%v0, 25(%sp)

	nop
	nop
	nop
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	create_pixel.3071

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)

	nop
	nop
	nop
	lw	%a0, 1(%sp)

	nop
	nop
	add	%at, %a0, %v1
	addi	%v1, %v1, -1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	j	init_line_elements.3073

bgti_else.32671:
	nop
	nop
	nop
	add	%v0, %zero, %a0

	nop
	nop
	nop
	jr	%ra

bgti_else.32670:
	nop
	nop
	nop
	add	%v0, %zero, %a0

	nop
	nop
	nop
	jr	%ra

bgti_else.32669:
	nop
	nop
	nop
	add	%v0, %zero, %a0

	nop
	nop
	nop
	jr	%ra

bgti_else.32668:
	nop
	nop
	nop
	jr	%ra

calc_dirvec.3083:
	nop
	nop
	nop
	blti	%v0, 5, bgti_else.33676

	nop
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	lw	%v0, 179(%v1)

	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 474(%zero)
	add	%at, %v0, %a0

	nop
	nop
	fadd	%f2, %f2, %f3
	lw	%v1, 0(%at)

	nop
	nop
	fsqrt	%f2, %f2
	lw	%v1, 0(%v1)

	nop
	nop
	fdiv	%f0, %f0, %f2
	fdiv	%f1, %f1, %f2

	nop
	fdiv	%f2, %f3, %f2
	fsw	%f0, 0(%v1)
	fneg	%f3, %f1

	nop
	fsw	%f1, 1(%v1)
	fneg	%f4, %f1
	fneg	%f5, %f2

	nop
	nop
	nop
	fsw	%f2, 2(%v1)

	nop
	nop
	nop
	addi	%v1, %a0, 40

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	fsw	%f0, 0(%v1)

	nop
	nop
	nop
	fsw	%f2, 1(%v1)

	nop
	nop
	fsw	%f3, 2(%v1)
	fneg	%f3, %f0

	nop
	nop
	nop
	addi	%v1, %a0, 80

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	fsw	%f2, 0(%v1)

	nop
	nop
	fsw	%f3, 1(%v1)
	fneg	%f3, %f0

	nop
	nop
	fsw	%f4, 2(%v1)
	fneg	%f4, %f1

	nop
	nop
	nop
	addi	%v1, %a0, 1

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	fsw	%f3, 0(%v1)
	fneg	%f3, %f0

	nop
	fsw	%f4, 1(%v1)
	fneg	%f4, %f2
	fneg	%f2, %f2

	nop
	nop
	nop
	fsw	%f5, 2(%v1)

	nop
	nop
	nop
	addi	%v1, %a0, 41

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	fsw	%f3, 0(%v1)

	nop
	nop
	nop
	fsw	%f4, 1(%v1)

	nop
	nop
	nop
	fsw	%f1, 2(%v1)

	nop
	nop
	nop
	addi	%v1, %a0, 81

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v0, 0(%at)

	nop
	nop
	nop
	lw	%v0, 0(%v0)

	nop
	nop
	nop
	fsw	%f2, 0(%v0)

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

	nop
	nop
	nop
	fsw	%f1, 2(%v0)

	nop
	nop
	nop
	jr	%ra

bgti_else.33676:
	nop
	fmul	%f0, %f1, %f1
	flw	%f1, 439(%zero)
	flw	%f4, 474(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	sw	%a0, 0(%sp)

	nop
	nop
	fsqrt	%f0, %f0
	sw	%v1, 1(%sp)

	nop
	nop
	fdiv	%f5, %f4, %f0
	fsw	%f3, 2(%sp)

	nop
	nop
	nop
	fsw	%f1, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 4(%sp)

	nop
	nop
	fsw	%f0, 5(%sp)
	fmov	%f0, %f5

	nop
	nop
	nop
	fsw	%f4, 6(%sp)

	nop
	nop
	nop
	fsw	%f2, 7(%sp)

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
	nop
	jal	atan.2639

	nop
	addi	%sp, %sp, -9
	flw	%f2, 495(%zero)
	flw	%f3, 470(%zero)

	nop
	nop
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.33678

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.33679

fbgt_else.33678:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.33679:
	nop
	fabs	%f4, %f0
	flw	%f5, 494(%zero)
	fsw	%f3, 8(%sp)

	nop
	nop
	nop
	fsw	%f0, 9(%sp)

	nop
	nop
	nop
	sw	%v0, 10(%sp)

	nop
	nop
	nop
	fsw	%f2, 11(%sp)

	nop
	nop
	nop
	fsw	%f4, 12(%sp)

	nop
	nop
	nop
	fsw	%f5, 13(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.33680

	nop
	nop
	nop
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33682

	nop
	nop
	nop
	flw	%f6, 492(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33684

	nop
	nop
	nop
	flw	%f6, 491(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33686

	nop
	nop
	nop
	flw	%f6, 490(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33688

	nop
	nop
	nop
	flw	%f6, 489(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33690

	nop
	nop
	nop
	flw	%f6, 488(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33692

	nop
	nop
	nop
	flw	%f6, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33694

	nop
	nop
	nop
	flw	%f6, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33696

	nop
	nop
	nop
	flw	%f6, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33698

	nop
	nop
	nop
	flw	%f6, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33700

	nop
	flw	%f6, 483(%zero)
	fmov	%f0, %f4
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33700:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33701:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33698:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33699:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33696:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33697:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33694:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33695:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33692:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33693:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33690:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33691:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33688:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33689:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33686:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33687:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33684:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33685:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33682:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33683:
	nop
	nop
	nop
	j	fbgt_cont.33681

fbgt_else.33680:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.33681:
	nop
	nop
	flw	%f1, 12(%sp)
	flw	%f2, 13(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33702

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33704

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33706

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33708

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33710

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33712

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33712:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

fbgt_cont.33713:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33710:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33711:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33708:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33714

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33716

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33716:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

fbgt_cont.33717:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33714:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33715:
fbgt_cont.33709:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33706:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33707:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33704:
	nop
	nop
	nop
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33718

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33720

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33722

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33724

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33724:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

fbgt_cont.33725:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33722:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33723:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33720:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33726

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33728

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33728:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 14(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

fbgt_cont.33729:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33726:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33727:
fbgt_cont.33721:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33718:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33719:
fbgt_cont.33705:
	nop
	nop
	nop
	j	fbgt_cont.33703

fbgt_else.33702:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33703:
	nop
	nop
	nop
	flw	%f1, 11(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33730

	nop
	nop
	nop
	lw	%v0, 10(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33732

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.33731

bnei_else.33732:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.33733:
	nop
	nop
	nop
	j	fbgt_cont.33731

fbgt_else.33730:
	nop
	nop
	nop
	lw	%v0, 10(%sp)

fbgt_cont.33731:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33734

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.33735

fbgt_else.33734:
fbgt_cont.33735:
	nop
	nop
	nop
	flw	%f2, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33736

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.33737

fbgt_else.33736:
fbgt_cont.33737:
	nop
	nop
	nop
	flw	%f3, 478(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.33738

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.33739

fbgt_else.33738:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 473(%zero)
	flw	%f6, 6(%sp)

	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f7, 472(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f5, %f5, %f7
	flw	%f7, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.33739:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33740

	nop
	nop
	nop
	j	bnei_cont.33741

bnei_else.33740:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.33741:
	nop
	nop
	flw	%f4, 9(%sp)
	flw	%f5, 13(%sp)

	nop
	nop
	fabs	%f4, %f4
	fsw	%f0, 14(%sp)

	nop
	nop
	nop
	fsw	%f3, 15(%sp)

	nop
	nop
	nop
	fsw	%f2, 16(%sp)

	nop
	nop
	nop
	fsw	%f4, 17(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.33742

	nop
	nop
	nop
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33744

	nop
	nop
	nop
	flw	%f6, 492(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33746

	nop
	nop
	nop
	flw	%f6, 491(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33748

	nop
	nop
	nop
	flw	%f6, 490(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33750

	nop
	nop
	nop
	flw	%f6, 489(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33752

	nop
	nop
	nop
	flw	%f6, 488(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33754

	nop
	nop
	nop
	flw	%f6, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33756

	nop
	nop
	nop
	flw	%f6, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33758

	nop
	nop
	nop
	flw	%f6, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33760

	nop
	nop
	nop
	flw	%f6, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33762

	nop
	flw	%f6, 483(%zero)
	fmov	%f0, %f4
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33762:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33763:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33760:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33761:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33758:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33759:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33756:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33757:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33754:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33755:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33752:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33753:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33750:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33751:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33748:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33749:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33746:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33747:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33744:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33745:
	nop
	nop
	nop
	j	fbgt_cont.33743

fbgt_else.33742:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.33743:
	nop
	nop
	flw	%f1, 17(%sp)
	flw	%f2, 13(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33764

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33766

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33768

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33770

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33772

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33774

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33774:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

fbgt_cont.33775:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33772:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33773:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33770:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33776

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33778

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33778:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

fbgt_cont.33779:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33776:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33777:
fbgt_cont.33771:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33768:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33769:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33766:
	nop
	nop
	nop
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33780

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33782

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33784

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33786

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33786:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

fbgt_cont.33787:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33784:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33785:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33782:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33788

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33790

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33790:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

fbgt_cont.33791:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33788:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33789:
fbgt_cont.33783:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33780:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33781:
fbgt_cont.33767:
	nop
	nop
	nop
	j	fbgt_cont.33765

fbgt_else.33764:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33765:
	nop
	nop
	nop
	flw	%f1, 11(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33792

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.33793

fbgt_else.33792:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.33793:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33794

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.33795

fbgt_else.33794:
fbgt_cont.33795:
	nop
	nop
	nop
	flw	%f2, 16(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33796

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33798

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.33797

bnei_else.33798:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.33799:
	nop
	nop
	nop
	j	fbgt_cont.33797

fbgt_else.33796:
fbgt_cont.33797:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33800

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.33801

fbgt_else.33800:
fbgt_cont.33801:
	nop
	nop
	nop
	flw	%f3, 15(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.33802

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 473(%zero)
	flw	%f6, 6(%sp)

	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0
	flw	%f7, 472(%zero)

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f5, %f5, %f7
	flw	%f7, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.33803

fbgt_else.33802:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.33803:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33804

	nop
	nop
	nop
	j	bnei_cont.33805

bnei_else.33804:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.33805:
	nop
	nop
	flw	%f4, 14(%sp)
	lw	%v0, 4(%sp)

	fdiv	%f0, %f4, %f0
	flw	%f4, 5(%sp)
	addi	%v0, %v0, 1
	flw	%f5, 3(%sp)

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f4, %f0, %f0

	nop
	fadd	%f4, %f4, %f5
	flw	%f5, 6(%sp)
	fsw	%f0, 18(%sp)

	nop
	nop
	fsqrt	%f4, %f4
	sw	%v0, 19(%sp)

	nop
	nop
	fdiv	%f6, %f5, %f4
	fsw	%f4, 20(%sp)

	nop
	nop
	fmov	%f0, %f6
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	atan.2639

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	flw	%f3, 2(%sp)

	nop
	nop
	fmul	%f0, %f0, %f3
	flw	%f1, 8(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33806

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.33807

fbgt_else.33806:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.33807:
	nop
	fabs	%f1, %f0
	flw	%f2, 13(%sp)
	fsw	%f0, 21(%sp)

	nop
	nop
	nop
	sw	%v0, 22(%sp)

	nop
	nop
	nop
	fsw	%f1, 23(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33808

	nop
	nop
	nop
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33810

	nop
	nop
	nop
	flw	%f4, 492(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33812

	nop
	nop
	nop
	flw	%f4, 491(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33814

	nop
	nop
	nop
	flw	%f4, 490(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33816

	nop
	nop
	nop
	flw	%f4, 489(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33818

	nop
	nop
	nop
	flw	%f4, 488(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33820

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33822

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33824

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33826

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.33828

	nop
	flw	%f4, 483(%zero)
	fmov	%f0, %f1
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33828:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33829:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33826:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33827:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33824:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33825:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33822:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33823:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33820:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33821:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33818:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33819:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33816:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33817:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33814:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33815:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33812:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33813:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33810:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.33811:
	nop
	nop
	nop
	j	fbgt_cont.33809

fbgt_else.33808:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.33809:
	nop
	nop
	flw	%f1, 23(%sp)
	flw	%f2, 13(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33830

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33832

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33834

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33836

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33838

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33840

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33840:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

fbgt_cont.33841:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33838:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33839:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33836:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33842

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33844

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33844:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

fbgt_cont.33845:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33842:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33843:
fbgt_cont.33837:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33834:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33835:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33832:
	nop
	nop
	nop
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33846

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33848

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33850

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33852

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33852:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

fbgt_cont.33853:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33850:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33851:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33848:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33854

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33856

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33856:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

fbgt_cont.33857:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33854:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33855:
fbgt_cont.33849:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33846:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33847:
fbgt_cont.33833:
	nop
	nop
	nop
	j	fbgt_cont.33831

fbgt_else.33830:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33831:
	nop
	nop
	nop
	flw	%f1, 11(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33858

	nop
	nop
	nop
	lw	%v0, 22(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33860

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.33859

bnei_else.33860:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.33861:
	nop
	nop
	nop
	j	fbgt_cont.33859

fbgt_else.33858:
	nop
	nop
	nop
	lw	%v0, 22(%sp)

fbgt_cont.33859:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33862

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.33863

fbgt_else.33862:
fbgt_cont.33863:
	nop
	nop
	nop
	flw	%f2, 16(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33864

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.33865

fbgt_else.33864:
fbgt_cont.33865:
	nop
	nop
	nop
	flw	%f3, 15(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.33866

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.33867

fbgt_else.33866:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 473(%zero)
	flw	%f6, 6(%sp)

	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f7, 472(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f5, %f5, %f7
	flw	%f7, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.33867:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33868

	nop
	nop
	nop
	j	bnei_cont.33869

bnei_else.33868:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.33869:
	nop
	nop
	flw	%f4, 21(%sp)
	flw	%f5, 13(%sp)

	nop
	nop
	fabs	%f4, %f4
	fsw	%f0, 24(%sp)

	nop
	nop
	nop
	fsw	%f4, 25(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.33870

	nop
	nop
	nop
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33872

	nop
	nop
	nop
	flw	%f6, 492(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33874

	nop
	nop
	nop
	flw	%f6, 491(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33876

	nop
	nop
	nop
	flw	%f6, 490(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33878

	nop
	nop
	nop
	flw	%f6, 489(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33880

	nop
	nop
	nop
	flw	%f6, 488(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33882

	nop
	nop
	nop
	flw	%f6, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33884

	nop
	nop
	nop
	flw	%f6, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33886

	nop
	nop
	nop
	flw	%f6, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33888

	nop
	nop
	nop
	flw	%f6, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.33890

	nop
	flw	%f6, 483(%zero)
	fmov	%f0, %f4
	sw	%ra, 26(%sp)

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33890:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33891:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33888:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33889:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33886:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33887:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33884:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33885:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33882:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33883:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33880:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33881:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33878:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33879:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33876:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33877:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33874:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33875:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33872:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.33873:
	nop
	nop
	nop
	j	fbgt_cont.33871

fbgt_else.33870:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.33871:
	nop
	nop
	flw	%f1, 25(%sp)
	flw	%f2, 13(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33892

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33894

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33896

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33898

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33900

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33902

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 26(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33902:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 26(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

fbgt_cont.33903:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33900:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33901:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33898:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33904

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33906

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 26(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33906:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 26(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

fbgt_cont.33907:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33904:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33905:
fbgt_cont.33899:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33896:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33897:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33894:
	nop
	nop
	nop
	flw	%f3, 496(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33908

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33910

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33912

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33914

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 26(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33914:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 26(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

fbgt_cont.33915:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33912:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33913:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33910:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.33916

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33918

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 26(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33918:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 26(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

fbgt_cont.33919:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33916:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33917:
fbgt_cont.33911:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33908:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33909:
fbgt_cont.33895:
	nop
	nop
	nop
	j	fbgt_cont.33893

fbgt_else.33892:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.33893:
	nop
	nop
	nop
	flw	%f1, 11(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33920

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.33921

fbgt_else.33920:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.33921:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33922

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.33923

fbgt_else.33922:
fbgt_cont.33923:
	nop
	nop
	nop
	flw	%f2, 16(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33924

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33926

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.33925

bnei_else.33926:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.33927:
	nop
	nop
	nop
	j	fbgt_cont.33925

fbgt_else.33924:
fbgt_cont.33925:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33928

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.33929

fbgt_else.33928:
fbgt_cont.33929:
	nop
	nop
	nop
	flw	%f1, 15(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33930

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 473(%zero)
	flw	%f3, 6(%sp)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f2, %f2, %f0

	nop
	nop
	fsub	%f2, %f3, %f2
	flw	%f3, 472(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.33931

fbgt_else.33930:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.33931:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33932

	nop
	nop
	nop
	j	bnei_cont.33933

bnei_else.33932:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.33933:
	nop
	nop
	flw	%f1, 24(%sp)
	flw	%f2, 7(%sp)

	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 20(%sp)
	flw	%f3, 2(%sp)

	nop
	fmul	%f1, %f0, %f1
	flw	%f0, 18(%sp)
	lw	%v0, 19(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	calc_dirvec.3083

calc_dirvecs.3091:
	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.33962

	nop
	itof	%f1, %v0
	flw	%f2, 467(%zero)
	flw	%f3, 436(%zero)

	nop
	fmul	%f1, %f1, %f2
	flw	%f4, 470(%zero)
	fsw	%f3, 0(%sp)

	nop
	fsub	%f1, %f1, %f3
	fsw	%f0, 1(%sp)
	fmov	%f3, %f0

	nop
	nop
	fsw	%f4, 2(%sp)
	fmov	%f0, %f4

	nop
	nop
	nop
	sw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%a1, 4(%sp)

	nop
	nop
	nop
	sw	%a0, 5(%sp)

	nop
	fsw	%f2, 6(%sp)
	fmov	%f2, %f1
	fmov	%f1, %f4

	nop
	nop
	sw	%v0, 7(%sp)
	addi	%v0, %a1, 0

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
	nop
	jal	calc_dirvec.3083

	nop
	nop
	addi	%sp, %sp, -9
	flw	%f2, 439(%zero)

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	lw	%v1, 5(%sp)

	fmul	%f0, %f0, %f1
	addi	%a0, %v1, 2
	flw	%f3, 2(%sp)
	flw	%f4, 1(%sp)

	fadd	%f0, %f0, %f2
	lw	%a1, 4(%sp)
	lw	%a2, 3(%sp)
	fmov	%f1, %f3

	nop
	sw	%a0, 8(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0

	nop
	fsw	%f2, 9(%sp)
	fmov	%f2, %f0
	fmov	%f0, %f3

	nop
	nop
	fmov	%f3, %f4
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	calc_dirvec.3083

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	addi	%v0, %v0, -1
	lw	%v1, 3(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.33963

	nop
	nop
	nop
	addi	%v1, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.33964

bgti_else.33963:
bgti_cont.33964:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.33965

	nop
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	flw	%f2, 0(%sp)

	nop
	fmul	%f0, %f0, %f1
	flw	%f3, 1(%sp)
	lw	%a0, 4(%sp)

	nop
	fsub	%f2, %f0, %f2
	flw	%f0, 2(%sp)
	lw	%a1, 5(%sp)

	nop
	nop
	sw	%v1, 10(%sp)
	fmov	%f1, %f0

	nop
	sw	%v0, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	calc_dirvec.3083

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	flw	%f3, 1(%sp)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 9(%sp)
	lw	%v1, 4(%sp)

	fadd	%f2, %f0, %f1
	flw	%f0, 2(%sp)
	lw	%a0, 10(%sp)
	addi	%v0, %v1, 0

	lw	%a1, 8(%sp)
	addi	%v1, %a0, 0
	fmov	%f1, %f0
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	calc_dirvec.3083

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.33966

	nop
	nop
	nop
	addi	%v1, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.33967

bgti_else.33966:
bgti_cont.33967:
	nop
	nop
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	j	calc_dirvecs.3091

bgti_else.33965:
	nop
	nop
	nop
	jr	%ra

bgti_else.33962:
	nop
	nop
	nop
	jr	%ra

calc_dirvec_rows.3096:
	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.33990

	itof	%f0, %v0
	flw	%f1, 467(%zero)
	flw	%f2, 436(%zero)
	addi	%a2, %zero, 4

	nop
	fmul	%f0, %f0, %f1
	flw	%f4, 470(%zero)
	fsw	%f2, 0(%sp)

	nop
	fsub	%f3, %f0, %f2
	itof	%f0, %a2
	sw	%v0, 1(%sp)

	nop
	fmul	%f0, %f0, %f1
	fsw	%f3, 2(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	fsub	%f0, %f0, %f2
	fsw	%f4, 3(%sp)

	nop
	sw	%v1, 4(%sp)
	fmov	%f2, %f0
	fmov	%f0, %f4

	nop
	nop
	nop
	sw	%a1, 5(%sp)

	nop
	nop
	nop
	sw	%a0, 6(%sp)

	nop
	nop
	fsw	%f1, 7(%sp)
	fmov	%f1, %f4

	nop
	nop
	nop
	sw	%a2, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	calc_dirvec.3083

	nop
	nop
	addi	%sp, %sp, -10
	flw	%f2, 439(%zero)

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	itof	%f0, %v0
	flw	%f1, 7(%sp)
	lw	%v1, 6(%sp)

	fmul	%f0, %f0, %f1
	addi	%a0, %v1, 2
	flw	%f3, 2(%sp)
	lw	%a1, 5(%sp)

	fadd	%f2, %f0, %f2
	flw	%f0, 3(%sp)
	lw	%a2, 4(%sp)
	addi	%v0, %a1, 0

	nop
	addi	%v1, %a2, 0
	fmov	%f1, %f0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	calc_dirvec.3083

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v0, %zero, 3

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	addi	%a0, %v1, 1

	nop
	nop
	nop
	blti	%a0, 5, bgti_else.33991

	nop
	nop
	nop
	addi	%a0, %a0, -5

	nop
	nop
	nop
	j	bgti_cont.33992

bgti_else.33991:
bgti_cont.33992:
	nop
	flw	%f0, 2(%sp)
	lw	%a1, 6(%sp)
	addi	%v1, %a0, 0

	nop
	nop
	addi	%a0, %a1, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	calc_dirvecs.3091

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	addi	%v0, %v0, -1
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 2

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.33993

	nop
	nop
	nop
	addi	%v1, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.33994

bgti_else.33993:
bgti_cont.33994:
	nop
	nop
	nop
	lw	%a0, 6(%sp)

	nop
	nop
	nop
	addi	%a0, %a0, 4

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.33995

	nop
	itof	%f0, %v0
	flw	%f1, 7(%sp)
	lw	%a1, 8(%sp)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 0(%sp)
	sw	%a0, 9(%sp)

	nop
	nop
	fsub	%f0, %f0, %f1
	sw	%v1, 10(%sp)

	nop
	nop
	sw	%v0, 11(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	calc_dirvecs.3091

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 2

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.33996

	nop
	nop
	nop
	addi	%v1, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.33997

bgti_else.33996:
bgti_cont.33997:
	nop
	nop
	nop
	lw	%a0, 9(%sp)

	nop
	nop
	nop
	addi	%a0, %a0, 4

	nop
	nop
	nop
	j	calc_dirvec_rows.3096

bgti_else.33995:
	nop
	nop
	nop
	jr	%ra

bgti_else.33990:
	nop
	nop
	nop
	jr	%ra

create_dirvec_elements.3102:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.34022

	nop
	nop
	addi	%a0, %zero, 3
	flw	%f0, 470(%zero)

	nop
	nop
	nop
	fsw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%a0, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	sw	%v0, 3(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)

	nop
	nop
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -7
	add	%v1, %zero, %hp

	nop
	lw	%ra, 6(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 5(%sp)
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34023

	nop
	nop
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 6(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 7(%sp)

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
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	add	%v1, %zero, %hp

	nop
	lw	%ra, 8(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 7(%sp)
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34024

	nop
	nop
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 9(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -11
	add	%v1, %zero, %hp

	nop
	lw	%ra, 10(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 9(%sp)
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 8(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34025

	nop
	nop
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 11(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -13
	add	%v1, %zero, %hp

	nop
	lw	%ra, 12(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 11(%sp)
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 10(%sp)

	nop
	nop
	add	%at, %a0, %v1
	addi	%v1, %v1, -1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	j	create_dirvec_elements.3102

bgti_else.34025:
	nop
	nop
	nop
	jr	%ra

bgti_else.34024:
	nop
	nop
	nop
	jr	%ra

bgti_else.34023:
	nop
	nop
	nop
	jr	%ra

bgti_else.34022:
	nop
	nop
	nop
	jr	%ra

create_dirvecs.3105:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34068

	nop
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 470(%zero)

	nop
	nop
	nop
	fsw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%a0, 1(%sp)

	nop
	nop
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)

	nop
	nop
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -7
	add	%v1, %zero, %hp

	nop
	lw	%ra, 6(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	sw	%v0, 179(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 179(%v1)
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v0, 6(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 7(%sp)

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
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	add	%v1, %zero, %hp

	nop
	lw	%ra, 8(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 7(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)

	nop
	nop
	sw	%v0, 118(%v1)
	lw	%v0, 1(%sp)

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
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -10
	add	%v1, %zero, %hp

	nop
	lw	%ra, 9(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 8(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	lw	%a0, 1(%sp)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)

	nop
	nop
	sw	%v0, 117(%v1)
	addi	%v0, %zero, 116

	nop
	nop
	sw	%v0, 9(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 10(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -12
	add	%v1, %zero, %hp

	nop
	lw	%ra, 11(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	nop
	lw	%v0, 10(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)
	sw	%ra, 11(%sp)

	nop
	sw	%v0, 116(%v1)
	addi	%v0, %zero, 115
	addi	%sp, %sp, 12

	nop
	nop
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0

	nop
	nop
	nop
	addi	%v0, %k0, 0

	nop
	nop
	nop
	jal	create_dirvec_elements.3102

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34069

	nop
	nop
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -14
	add	%v1, %zero, %hp

	nop
	lw	%ra, 13(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	nop
	lw	%v0, 12(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 179(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 179(%v1)
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v0, 13(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -15
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 14(%sp)

	nop
	nop
	nop
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -16
	add	%v1, %zero, %hp

	nop
	lw	%ra, 15(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 14(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v0, 118(%v1)
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -16
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 15(%sp)

	nop
	nop
	nop
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -17
	add	%v1, %zero, %hp

	nop
	lw	%ra, 16(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	nop
	lw	%v0, 15(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v0, 117(%v1)
	lw	%v0, 9(%sp)

	nop
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	sw	%ra, 16(%sp)

	nop
	nop
	addi	%v0, %k0, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	create_dirvec_elements.3102

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	j	create_dirvecs.3105

bgti_else.34069:
	nop
	nop
	nop
	jr	%ra

bgti_else.34068:
	nop
	nop
	nop
	jr	%ra

init_dirvec_constants.3107:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.34133

	nop
	nop
	add	%at, %v0, %v1
	lw	%a1, 0(%zero)

	nop
	nop
	lw	%a0, 0(%at)
	addi	%a1, %a1, -1

	nop
	nop
	nop
	sw	%a1, 0(%sp)

	nop
	nop
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	sw	%v1, 2(%sp)
	addi	%v1, %a1, 0

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
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34134

	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a1, 0(%sp)

	nop
	nop
	add	%at, %v1, %v0
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.34135

	nop
	nop
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)

	nop
	nop
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)

	nop
	nop
	nop
	sw	%a0, 4(%sp)

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.34137

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.34139

	nop
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	setup_second_table.2886

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)

	nop
	nop
	nop
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.34138

bnei_else.34139:
	nop
	addi	%t1, %zero, 4
	flw	%f0, 470(%zero)
	sw	%a3, 5(%sp)

	nop
	nop
	fsw	%f0, 6(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%a2, 7(%sp)

	nop
	nop
	nop
	sw	%t0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34141

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.34142

fbgt_else.34141:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.34142:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.34143

	nop
	nop
	flw	%f1, 458(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.34144

bnei_else.34143:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.34144:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.34140:
	nop
	nop
	nop
	j	bnei_cont.34138

bnei_else.34137:
	nop
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	setup_rect_table.2880

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 0(%sp)

	nop
	nop
	nop
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.34138:
	nop
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bgti_cont.34136

bgti_else.34135:
bgti_cont.34136:
	nop
	nop
	nop
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34145

	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a1, 0(%sp)

	nop
	add	%at, %v1, %v0
	sw	%v0, 9(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	lw	%a0, 0(%at)
	sw	%ra, 10(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34146

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%v0, 10(%sp)

	nop
	nop
	add	%at, %v1, %v0
	sw	%ra, 11(%sp)

	nop
	nop
	lw	%a0, 0(%at)
	addi	%sp, %sp, 12

	nop
	nop
	nop
	addi	%v0, %a0, 0

	nop
	nop
	nop
	jal	setup_dirvec_constants.2892

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)

	nop
	nop
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	j	init_dirvec_constants.3107

bgti_else.34146:
	nop
	nop
	nop
	jr	%ra

bgti_else.34145:
	nop
	nop
	nop
	jr	%ra

bgti_else.34134:
	nop
	nop
	nop
	jr	%ra

bgti_else.34133:
	nop
	nop
	nop
	jr	%ra

init_vecset_constants.3110:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34197

	nop
	lw	%v1, 179(%v0)
	addi	%a0, %zero, 119
	lw	%a2, 0(%zero)

	nop
	lw	%a1, 119(%v1)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%a2, 2(%sp)

	nop
	nop
	nop
	sw	%v1, 3(%sp)

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.34198

	nop
	nop
	lw	%a3, 12(%a2)
	lw	%t0, 1(%a1)

	nop
	nop
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)

	nop
	nop
	nop
	sw	%a1, 4(%sp)

	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.34200

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.34202

	nop
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	setup_second_table.2886

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.34201

bnei_else.34202:
	nop
	addi	%t2, %zero, 4
	flw	%f0, 470(%zero)
	sw	%t0, 5(%sp)

	nop
	nop
	fsw	%f0, 6(%sp)
	addi	%v0, %t2, 0

	nop
	nop
	nop
	sw	%a3, 7(%sp)

	nop
	nop
	nop
	sw	%t1, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34204

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.34205

fbgt_else.34204:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.34205:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.34206

	nop
	nop
	flw	%f1, 458(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.34207

bnei_else.34206:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.34207:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.34203:
	nop
	nop
	nop
	j	bnei_cont.34201

bnei_else.34200:
	nop
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	setup_rect_table.2880

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.34201:
	nop
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bgti_cont.34199

bgti_else.34198:
bgti_cont.34199:
	nop
	addi	%v0, %zero, 118
	lw	%v1, 3(%sp)
	lw	%a1, 2(%sp)

	nop
	lw	%a0, 118(%v1)
	sw	%v0, 9(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %zero, 117

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 3(%sp)

	nop
	nop
	lw	%a0, 117(%v1)
	sw	%v0, 10(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	setup_dirvec_constants.2892

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v1, %zero, 116

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	init_dirvec_constants.3107

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34208

	nop
	nop
	lw	%v1, 179(%v0)
	lw	%a1, 2(%sp)

	nop
	nop
	lw	%a0, 119(%v1)
	sw	%v0, 11(%sp)

	nop
	sw	%v1, 12(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	sw	%ra, 13(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	setup_dirvec_constants.2892

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	lw	%v1, 10(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	init_dirvec_constants.3107

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34209

	nop
	nop
	lw	%v1, 179(%v0)
	sw	%v0, 13(%sp)

	nop
	nop
	lw	%a0, 119(%v1)
	sw	%v1, 14(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	setup_dirvec_constants.2892

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v0, 14(%sp)

	nop
	nop
	lw	%v1, 9(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	init_dirvec_constants.3107

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34210

	nop
	nop
	lw	%v1, 179(%v0)
	lw	%a0, 0(%sp)

	nop
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	init_dirvec_constants.3107

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	lw	%v0, 15(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	j	init_vecset_constants.3110

bgti_else.34210:
	nop
	nop
	nop
	jr	%ra

bgti_else.34209:
	nop
	nop
	nop
	jr	%ra

bgti_else.34208:
	nop
	nop
	nop
	jr	%ra

bgti_else.34197:
	nop
	nop
	nop
	jr	%ra

setup_reflections.3127:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34262

	nop
	nop
	nop
	lw	%v1, 12(%v0)

	nop
	nop
	nop
	lw	%a0, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.34263

	nop
	nop
	nop
	jr	%ra

bnei_else.34263:
	nop
	nop
	lw	%a0, 7(%v1)
	flw	%f1, 474(%zero)

	nop
	nop
	nop
	flw	%f0, 0(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34265

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.34266

fbgt_else.34265:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.34266:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34267

	nop
	nop
	nop
	lw	%a0, 1(%v1)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.34268

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.34269

	nop
	nop
	nop
	jr	%ra

bnei_else.34269:
	nop
	sll	%v0, %v0, 2
	lw	%a0, 434(%zero)
	lw	%a1, 7(%v1)

	nop
	addi	%v0, %v0, 1
	flw	%f0, 0(%a1)
	lw	%a1, 4(%v1)

	nop
	fsub	%f0, %f1, %f0
	flw	%f1, 78(%zero)
	flw	%f2, 0(%a1)

	nop
	fmul	%f2, %f1, %f2
	flw	%f3, 79(%zero)
	flw	%f4, 1(%a1)

	nop
	fmul	%f4, %f3, %f4
	flw	%f5, 2(%a1)
	lw	%a1, 4(%v1)

	nop
	fadd	%f2, %f2, %f4
	flw	%f4, 80(%zero)
	flw	%f6, 0(%a1)

	nop
	fmul	%f5, %f4, %f5
	lw	%a1, 4(%v1)
	lw	%v1, 4(%v1)

	nop
	fadd	%f2, %f2, %f5
	flw	%f5, 496(%zero)
	sw	%a0, 0(%sp)

	nop
	nop
	fmul	%f6, %f5, %f6
	sw	%v0, 1(%sp)

	nop
	nop
	fmul	%f6, %f6, %f2
	fsw	%f0, 2(%sp)

	nop
	nop
	fsub	%f1, %f6, %f1
	flw	%f6, 1(%a1)

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	nop
	fmul	%f6, %f6, %f2

	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 2(%v1)
	addi	%v1, %zero, 3

	nop
	nop
	fmul	%f5, %f5, %f6
	addi	%v0, %v1, 0

	nop
	nop
	nop
	fmul	%f2, %f5, %f2

	nop
	nop
	fsub	%f2, %f2, %f4
	flw	%f4, 470(%zero)

	nop
	nop
	fsw	%f2, 3(%sp)
	fmov	%f0, %f4

	nop
	nop
	nop
	fsw	%f3, 4(%sp)

	nop
	nop
	nop
	fsw	%f1, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)

	nop
	nop
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%v1, 7(%sp)

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
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	add	%v1, %zero, %hp

	nop
	lw	%ra, 8(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 7(%sp)
	flw	%f0, 5(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	fsw	%f0, 0(%v0)

	nop
	nop
	flw	%f0, 4(%sp)
	addi	%k0, %v1, 0

	nop
	nop
	fsw	%f0, 1(%v0)
	flw	%f0, 3(%sp)

	nop
	nop
	nop
	fsw	%f0, 2(%v0)

	nop
	nop
	lw	%v0, 6(%sp)
	sw	%v1, 8(%sp)

	nop
	nop
	addi	%v0, %v0, -1
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -10
	add	%v0, %zero, %hp

	nop
	lw	%ra, 9(%sp)
	addi	%hp, %hp, 3
	flw	%f0, 2(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 254(%v1)

	nop
	nop
	nop
	addi	%v0, %v1, 1

	nop
	nop
	nop
	sw	%v0, 434(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.34268:
	sll	%v0, %v0, 2
	lw	%a0, 434(%zero)
	lw	%v1, 7(%v1)
	addi	%a1, %zero, 3

	nop
	flw	%f0, 0(%v1)
	flw	%f3, 79(%zero)
	addi	%v1, %v0, 1

	fsub	%f0, %f1, %f0
	flw	%f1, 78(%zero)
	fneg	%f4, %f3
	flw	%f5, 80(%zero)

	fneg	%f2, %f1
	fneg	%f6, %f5
	flw	%f7, 470(%zero)
	fsw	%f5, 9(%sp)

	nop
	nop
	nop
	fsw	%f3, 10(%sp)

	nop
	nop
	nop
	fsw	%f2, 11(%sp)

	nop
	nop
	nop
	fsw	%f7, 12(%sp)

	nop
	nop
	nop
	sw	%a1, 13(%sp)

	nop
	nop
	sw	%v0, 14(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%a0, 15(%sp)

	nop
	nop
	nop
	sw	%v1, 16(%sp)

	nop
	nop
	fsw	%f0, 17(%sp)
	fmov	%f0, %f7

	nop
	nop
	nop
	fsw	%f6, 18(%sp)

	nop
	nop
	nop
	fsw	%f4, 19(%sp)

	nop
	nop
	nop
	fsw	%f1, 20(%sp)

	nop
	nop
	nop
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	addi	%sp, %sp, -22
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)

	nop
	nop
	lw	%ra, 21(%sp)
	sw	%v0, 21(%sp)

	nop
	nop
	nop
	sw	%v1, 22(%sp)

	nop
	nop
	nop
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -24
	add	%v1, %zero, %hp

	nop
	lw	%ra, 23(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 22(%sp)
	flw	%f0, 20(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	fsw	%f0, 0(%v0)

	nop
	nop
	flw	%f0, 19(%sp)
	flw	%f1, 18(%sp)

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

	nop
	nop
	nop
	fsw	%f1, 2(%v0)

	nop
	nop
	nop
	lw	%v0, 21(%sp)

	nop
	nop
	addi	%a0, %v0, -1
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%a0, 23(%sp)

	nop
	nop
	sw	%v1, 24(%sp)
	addi	%v1, %a0, 0

	nop
	nop
	nop
	sw	%ra, 25(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -26
	add	%v0, %zero, %hp

	nop
	lw	%ra, 25(%sp)
	addi	%hp, %hp, 3
	flw	%f0, 17(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	lw	%v1, 24(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 16(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 15(%sp)

	nop
	nop
	sw	%v0, 254(%v1)
	lw	%a0, 14(%sp)

	addi	%v0, %v1, 1
	addi	%a1, %a0, 2
	flw	%f1, 12(%sp)
	lw	%a2, 13(%sp)

	nop
	sw	%v0, 25(%sp)
	addi	%v0, %a2, 0
	fmov	%f0, %f1

	nop
	nop
	nop
	sw	%a1, 26(%sp)

	nop
	nop
	nop
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -28
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v0, 21(%sp)

	nop
	nop
	nop
	sw	%v1, 27(%sp)

	nop
	nop
	nop
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -29
	add	%v1, %zero, %hp

	nop
	lw	%ra, 28(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 27(%sp)
	flw	%f0, 11(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	fsw	%f0, 0(%v0)

	nop
	nop
	flw	%f1, 10(%sp)
	addi	%k0, %v1, 0

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 18(%sp)

	nop
	nop
	nop
	fsw	%f1, 2(%v0)

	nop
	nop
	lw	%v0, 23(%sp)
	sw	%v1, 28(%sp)

	nop
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -30
	add	%v0, %zero, %hp

	nop
	lw	%ra, 29(%sp)
	addi	%hp, %hp, 3
	flw	%f0, 17(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	lw	%v1, 28(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 26(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 25(%sp)

	nop
	nop
	sw	%v0, 254(%v1)
	lw	%v0, 15(%sp)

	nop
	addi	%v1, %v0, 2
	lw	%a0, 14(%sp)
	flw	%f1, 12(%sp)

	addi	%a0, %a0, 3
	lw	%a1, 13(%sp)
	sw	%v1, 29(%sp)
	fmov	%f0, %f1

	nop
	nop
	sw	%a0, 30(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 31(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 31(%sp)
	lw	%v0, 21(%sp)

	nop
	nop
	nop
	sw	%v1, 31(%sp)

	nop
	nop
	nop
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -33
	add	%v1, %zero, %hp

	nop
	lw	%ra, 32(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 31(%sp)
	flw	%f0, 11(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	fsw	%f0, 0(%v0)

	nop
	nop
	flw	%f0, 19(%sp)
	addi	%k0, %v1, 0

	nop
	nop
	fsw	%f0, 1(%v0)
	flw	%f0, 9(%sp)

	nop
	nop
	nop
	fsw	%f0, 2(%v0)

	nop
	nop
	lw	%v0, 23(%sp)
	sw	%v1, 32(%sp)

	nop
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 33(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 34

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -34
	add	%v0, %zero, %hp

	nop
	lw	%ra, 33(%sp)
	addi	%hp, %hp, 3
	flw	%f0, 17(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	lw	%v1, 32(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 30(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v0, 254(%v1)
	lw	%v0, 15(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 3

	nop
	nop
	nop
	sw	%v0, 434(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.34267:
	nop
	nop
	nop
	jr	%ra

bgti_else.34262:
	nop
	nop
	nop
	jr	%ra

min_caml_start:
	nop
	nop
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0

	nop
	nop
	addi	%a0, %zero, 0
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 2(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	addi	%sp, %sp, -3
	flw	%f0, 470(%zero)
	addi	%v1, %zero, 1

	nop
	nop
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	fsw	%f0, 2(%sp)

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
	nop
	jal	min_caml_create_float_extarray

	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 60
	sw	%v0, 11(%zero)

	nop
	nop
	lw	%ra, 3(%sp)
	sw	%v0, 10(%zero)

	nop
	nop
	sw	%v0, 9(%zero)
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v0, 8(%zero)
	sw	%v1, 3(%sp)

	nop
	nop
	sw	%a0, 7(%zero)
	sw	%ra, 4(%sp)

	nop
	nop
	sw	%v0, 6(%zero)
	addi	%sp, %sp, 5

	nop
	nop
	nop
	sw	%v0, 5(%zero)

	nop
	nop
	nop
	sw	%a0, 4(%zero)

	nop
	nop
	nop
	sw	%a0, 3(%zero)

	nop
	nop
	nop
	sw	%a0, 2(%zero)

	nop
	nop
	nop
	sw	%a0, 1(%zero)

	nop
	nop
	addi	%v0, %zero, 12
	addi	%a1, %zero, 1

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v0, %zero, 3

	nop
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 72
	flw	%f0, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %zero, 75

	nop
	nop
	lw	%ra, 5(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %zero, 78

	nop
	nop
	lw	%ra, 5(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	addi	%sp, %sp, -6
	flw	%f0, 449(%zero)
	addi	%v1, %zero, 81

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 50

	lw	%ra, 5(%sp)
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	lw	%a1, 0(%sp)

	nop
	nop
	sw	%v0, 5(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 83

	nop
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 82
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	addi	%sp, %sp, -7
	lw	%v1, 83(%zero)
	addi	%a0, %zero, 133

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 134

	nop
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 133
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 135

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 0(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 136

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	addi	%sp, %sp, -7
	flw	%f0, 443(%zero)
	addi	%v1, %zero, 137

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 138

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 141

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 142

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 145

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 148

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 151

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 2

	nop
	lw	%ra, 6(%sp)
	addi	%a0, %zero, 154
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a0, %zero, 156

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 158

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 159

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 162

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 165

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 168

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 171

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 174

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 177

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a0, %zero, 177

	nop
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 177
	lw	%a1, 1(%sp)

	nop
	nop
	sw	%v0, 7(%sp)
	addi	%v0, %a1, 0

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
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -9
	sw	%v0, 178(%zero)

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	sw	%v0, 177(%zero)
	lw	%v0, 1(%sp)

	nop
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v0, %zero, 5

	lw	%ra, 8(%sp)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	sw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %zero, 184

	nop
	nop
	lw	%ra, 9(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %zero, 184

	nop
	nop
	lw	%ra, 9(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -10
	addi	%a0, %zero, 187

	nop
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 184
	lw	%a1, 3(%sp)

	nop
	nop
	sw	%v0, 9(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -11
	sw	%v0, 248(%zero)

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	sw	%v0, 247(%zero)
	flw	%f0, 2(%sp)

	nop
	addi	%v1, %zero, 249
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %zero, 249

	nop
	lw	%ra, 10(%sp)
	addi	%v1, %zero, 249
	lw	%a1, 1(%sp)

	nop
	nop
	sw	%v0, 10(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	addi	%sp, %sp, -12
	addi	%v1, %zero, 249
	sw	%v0, 250(%zero)

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)

	nop
	nop
	sw	%v0, 249(%zero)
	flw	%f0, 2(%sp)

	nop
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	fsw	%f0, 253(%zero)

	nop
	nop
	sw	%v0, 252(%zero)
	lw	%v0, 1(%sp)

	nop
	sw	%v0, 251(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)

	nop
	nop
	addi	%a0, %zero, 254
	addi	%a1, %zero, 251

	nop
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -12
	addi	%a0, %zero, 434

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v0, %zero, 128

	nop
	lw	%ra, 11(%sp)
	sw	%v0, 154(%zero)
	itof	%f1, %v0

	nop
	nop
	nop
	sw	%v0, 155(%zero)

	nop
	nop
	nop
	addi	%v1, %zero, 64

	nop
	nop
	nop
	sw	%v1, 156(%zero)

	nop
	nop
	sw	%v1, 157(%zero)
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	flw	%f0, 435(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 158(%zero)
	flw	%f0, 2(%sp)

	nop
	nop
	nop
	lw	%v0, 154(%zero)

	nop
	nop
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 12(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 13(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)

	nop
	sw	%v0, 3(%v1)
	addi	%v0, %zero, 4
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%a0, 4(%sp)
	sw	%v0, 14(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)

	nop
	nop
	lw	%a0, 1(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 8(%sp)

	nop
	lw	%a0, 1(%sp)
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 16(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -18
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 17(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	lw	%ra, 17(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 17(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 18(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)

	nop
	nop
	lw	%a0, 1(%sp)
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 19(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -21
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 20(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	lw	%ra, 20(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 20(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)

	nop
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 19(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 16(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 15(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 12(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	add	%v1, %zero, %v0
	lw	%v0, 11(%sp)
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	nop
	addi	%a0, %v1, -2

	nop
	nop
	nop
	sw	%a0, 21(%sp)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.34629

	nop
	nop
	nop
	sw	%v0, 22(%sp)

	nop
	nop
	nop
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	create_pixel.3071

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	lw	%ra, 23(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	lw	%a0, 22(%sp)
	sw	%ra, 23(%sp)

	nop
	nop
	add	%at, %a0, %v1
	addi	%sp, %sp, 24

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	jal	init_line_elements.3073

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

	nop
	nop
	nop
	j	bgti_cont.34630

bgti_else.34629:
bgti_cont.34630:
	nop
	nop
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	sw	%v0, 23(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	lw	%ra, 24(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 24(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 25(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -26
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 25(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 25(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	lw	%ra, 25(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 25(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)

	nop
	nop
	lw	%a0, 1(%sp)
	sw	%ra, 26(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v1, 8(%sp)

	nop
	lw	%a0, 1(%sp)
	sw	%v0, 26(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 27(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -29
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 28(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	lw	%ra, 28(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 28(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 29(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)

	nop
	nop
	lw	%a0, 1(%sp)
	sw	%ra, 30(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 30(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 31(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 31(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	lw	%ra, 31(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 31(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	lw	%ra, 32(%sp)
	lw	%v1, 31(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	lw	%ra, 32(%sp)
	lw	%v1, 31(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	lw	%ra, 32(%sp)
	lw	%v1, 31(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	lw	%ra, 32(%sp)
	lw	%v1, 31(%sp)

	nop
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 30(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 28(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 27(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 26(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 25(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 24(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	add	%v1, %zero, %v0
	lw	%v0, 11(%sp)
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	lw	%ra, 32(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.34631

	nop
	nop
	nop
	sw	%v0, 32(%sp)

	nop
	nop
	nop
	sw	%ra, 33(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 34

	nop
	nop
	nop
	jal	create_pixel.3071

	nop
	nop
	nop
	addi	%sp, %sp, -34

	nop
	nop
	lw	%ra, 33(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	lw	%a0, 32(%sp)
	sw	%ra, 33(%sp)

	nop
	nop
	add	%at, %a0, %v1
	addi	%sp, %sp, 34

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	jal	init_line_elements.3073

	nop
	nop
	nop
	addi	%sp, %sp, -34

	nop
	nop
	nop
	lw	%ra, 33(%sp)

	nop
	nop
	nop
	j	bgti_cont.34632

bgti_else.34631:
bgti_cont.34632:
	nop
	nop
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	sw	%v0, 33(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 34(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	lw	%ra, 34(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 34(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 35(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 36

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -36
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 35(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 35(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 36

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -36

	nop
	nop
	lw	%ra, 35(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 35(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)

	nop
	nop
	lw	%a0, 1(%sp)
	sw	%ra, 36(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 8(%sp)

	nop
	lw	%a0, 1(%sp)
	sw	%v0, 36(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 37(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	lw	%ra, 37(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 37(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -39
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 38(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	lw	%ra, 38(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 38(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -40
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 39(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)

	nop
	nop
	lw	%a0, 1(%sp)
	sw	%ra, 40(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 40(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 41(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 42

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -42
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 41(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 41(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 42

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -42

	nop
	nop
	lw	%ra, 41(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 41(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)

	nop
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 40(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 37(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 36(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 34(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	add	%v1, %zero, %v0
	lw	%v0, 11(%sp)
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.34633

	nop
	nop
	nop
	sw	%v0, 42(%sp)

	nop
	nop
	nop
	sw	%ra, 43(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 44

	nop
	nop
	nop
	jal	create_pixel.3071

	nop
	nop
	nop
	addi	%sp, %sp, -44

	nop
	nop
	lw	%ra, 43(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	lw	%a0, 42(%sp)
	sw	%ra, 43(%sp)

	nop
	nop
	add	%at, %a0, %v1
	addi	%v1, %v1, -1

	nop
	sw	%v0, 0(%at)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 44

	nop
	nop
	nop
	jal	init_line_elements.3073

	nop
	nop
	nop
	addi	%sp, %sp, -44

	nop
	nop
	nop
	lw	%ra, 43(%sp)

	nop
	nop
	nop
	j	bgti_cont.34634

bgti_else.34633:
bgti_cont.34634:
	nop
	nop
	nop
	sw	%v0, 43(%sp)

	nop
	nop
	nop
	sw	%ra, 44(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 45

	nop
	nop
	nop
	jal	read_screen_settings.2775

	nop
	nop
	nop
	addi	%sp, %sp, -45

	nop
	nop
	nop
	lw	%ra, 44(%sp)

	nop
	nop
	nop
	sw	%ra, 44(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 45

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -45

	nop
	nop
	nop
	lw	%ra, 44(%sp)

	nop
	nop
	nop
	sw	%ra, 44(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 45

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -45
	flw	%f1, 461(%zero)

	nop
	nop
	lw	%ra, 44(%sp)
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 44(%sp)

	nop
	nop
	nop
	fsw	%f1, 45(%sp)

	nop
	nop
	nop
	sw	%ra, 46(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	sin.2637

	nop
	nop
	addi	%sp, %sp, -47
	fneg	%f0, %f0

	nop
	nop
	lw	%ra, 46(%sp)
	fsw	%f0, 79(%zero)

	nop
	nop
	nop
	sw	%ra, 46(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	lw	%ra, 46(%sp)
	flw	%f1, 45(%sp)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 44(%sp)

	nop
	nop
	fsw	%f0, 46(%sp)
	fmov	%f0, %f1

	nop
	nop
	nop
	sw	%ra, 47(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 48

	nop
	nop
	nop
	jal	cos.2635

	nop
	nop
	nop
	addi	%sp, %sp, -48

	nop
	nop
	lw	%ra, 47(%sp)
	flw	%f1, 46(%sp)

	nop
	nop
	fsw	%f0, 47(%sp)
	fmov	%f0, %f1

	nop
	nop
	nop
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	sin.2637

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	lw	%ra, 48(%sp)
	flw	%f1, 47(%sp)

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	fsw	%f0, 78(%zero)
	flw	%f0, 46(%sp)

	nop
	nop
	nop
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	cos.2635

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	lw	%ra, 48(%sp)
	flw	%f1, 47(%sp)

	nop
	nop
	fmul	%f0, %f1, %f0
	sw	%ra, 48(%sp)

	nop
	nop
	fsw	%f0, 80(%zero)
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -49
	fsw	%f0, 81(%zero)

	nop
	nop
	lw	%ra, 48(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	nop
	lw	%ra, 48(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34635

	nop
	nop
	lw	%v0, 0(%sp)
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	nop
	lw	%ra, 48(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34637

	nop
	nop
	lw	%v0, 6(%sp)
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	nop
	lw	%ra, 48(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34639

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	read_nth_object.2782

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	nop
	lw	%ra, 48(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34641

	nop
	nop
	lw	%v0, 14(%sp)
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	read_object.2784

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	nop
	lw	%ra, 48(%sp)

	nop
	nop
	nop
	j	bnei_cont.34636

bnei_else.34641:
	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

bnei_cont.34642:
	nop
	nop
	nop
	j	bnei_cont.34636

bnei_else.34639:
	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

bnei_cont.34640:
	nop
	nop
	nop
	j	bnei_cont.34636

bnei_else.34637:
	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

bnei_cont.34638:
	nop
	nop
	nop
	j	bnei_cont.34636

bnei_else.34635:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

bnei_cont.34636:
	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	addi	%sp, %sp, -49
	lw	%v1, 0(%v0)

	nop
	nop
	nop
	lw	%ra, 48(%sp)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.34643

	nop
	nop
	sw	%v0, 83(%zero)
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	read_and_network.2792

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	nop
	lw	%ra, 48(%sp)

	nop
	nop
	nop
	j	bnei_cont.34644

bnei_else.34643:
bnei_cont.34644:
	nop
	nop
	lw	%v0, 1(%sp)
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	addi	%sp, %sp, -49
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 48(%sp)
	lw	%v0, 0(%v1)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.34645

	nop
	nop
	lw	%v0, 0(%sp)
	sw	%v1, 48(%sp)

	nop
	nop
	nop
	sw	%ra, 49(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 50

	nop
	nop
	nop
	jal	read_or_network.2790

	nop
	nop
	nop
	addi	%sp, %sp, -50

	nop
	nop
	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	j	bnei_cont.34646

bnei_else.34645:
	nop
	nop
	lw	%v0, 0(%sp)
	sw	%ra, 49(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 50

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -50

	nop
	nop
	nop
	lw	%ra, 49(%sp)

bnei_cont.34646:
	nop
	nop
	sw	%v0, 134(%zero)
	sw	%ra, 49(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 50

	nop
	nop
	nop
	jal	write_ppm_header.3037

	nop
	nop
	addi	%sp, %sp, -50
	addi	%v0, %zero, 120

	nop
	nop
	lw	%ra, 49(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 49(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 50(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 51

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	addi	%sp, %sp, -51
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)

	nop
	nop
	lw	%ra, 50(%sp)
	sw	%v0, 50(%sp)

	nop
	nop
	nop
	sw	%v1, 51(%sp)

	nop
	nop
	nop
	sw	%ra, 52(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 53

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -53
	add	%v1, %zero, %hp

	nop
	lw	%ra, 52(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	nop
	lw	%v0, 51(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	lw	%v0, 49(%sp)

	nop
	nop
	nop
	sw	%ra, 52(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 53

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -53
	sw	%v0, 183(%zero)

	nop
	lw	%ra, 52(%sp)
	lw	%v0, 183(%zero)
	addi	%v1, %zero, 118

	nop
	nop
	nop
	sw	%v0, 52(%sp)

	nop
	nop
	nop
	sw	%ra, 53(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	create_dirvec_elements.3102

	nop
	nop
	nop
	addi	%sp, %sp, -54

	nop
	nop
	lw	%ra, 53(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 53(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	create_dirvecs.3105

	nop
	addi	%sp, %sp, -54
	addi	%v0, %zero, 9
	flw	%f1, 467(%zero)

	nop
	lw	%ra, 53(%sp)
	itof	%f0, %v0
	lw	%v0, 14(%sp)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 436(%zero)
	lw	%v1, 1(%sp)

	nop
	fsub	%f0, %f0, %f1
	addi	%a0, %v1, 0
	sw	%ra, 53(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	calc_dirvecs.3091

	nop
	nop
	addi	%sp, %sp, -54
	addi	%v0, %zero, 8

	nop
	nop
	lw	%ra, 53(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 14(%sp)
	sw	%ra, 53(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	calc_dirvec_rows.3096

	nop
	nop
	addi	%sp, %sp, -54
	addi	%v1, %zero, 119

	nop
	nop
	lw	%ra, 53(%sp)
	lw	%v0, 52(%sp)

	nop
	nop
	nop
	sw	%ra, 53(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	init_dirvec_constants.3107

	nop
	nop
	nop
	addi	%sp, %sp, -54

	nop
	nop
	lw	%ra, 53(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 53(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	init_vecset_constants.3110

	nop
	nop
	addi	%sp, %sp, -54
	flw	%f0, 78(%zero)

	nop
	nop
	lw	%ra, 53(%sp)
	fsw	%f0, 184(%zero)

	nop
	nop
	flw	%f0, 79(%zero)
	lw	%v0, 50(%sp)

	nop
	nop
	fsw	%f0, 185(%zero)
	addi	%v0, %v0, -1

	nop
	nop
	flw	%f0, 80(%zero)
	sw	%v0, 53(%sp)

	nop
	nop
	nop
	fsw	%f0, 186(%zero)

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.34647

	nop
	nop
	nop
	lw	%v1, 12(%v0)

	nop
	nop
	nop
	lw	%a0, 1(%v1)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.34649

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.34651

	nop
	nop
	addi	%a0, %zero, 184
	sw	%ra, 54(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 55

	nop
	nop
	nop
	jal	setup_second_table.2886

	nop
	nop
	nop
	addi	%sp, %sp, -55

	nop
	nop
	lw	%ra, 54(%sp)
	lw	%v1, 53(%sp)

	nop
	nop
	nop
	sw	%v0, 187(%v1)

	nop
	nop
	nop
	j	bnei_cont.34650

bnei_else.34651:
	nop
	nop
	flw	%f0, 2(%sp)
	lw	%a0, 14(%sp)

	nop
	nop
	sw	%v1, 54(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 55(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 56

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -56
	flw	%f0, 184(%zero)

	nop
	nop
	lw	%ra, 55(%sp)
	lw	%v1, 54(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f1, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 185(%zero)
	flw	%f2, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	lw	%a0, 4(%v1)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 186(%zero)
	flw	%f2, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34653

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.34654

fbgt_else.34653:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.34654:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34655

	nop
	nop
	flw	%f1, 458(%zero)
	lw	%a0, 4(%v1)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%a0)

	nop
	fdiv	%f1, %f1, %f0
	lw	%a0, 4(%v1)
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.34656

bnei_else.34655:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.34656:
	nop
	nop
	nop
	lw	%v1, 53(%sp)

	nop
	nop
	nop
	sw	%v0, 187(%v1)

bnei_cont.34652:
	nop
	nop
	nop
	j	bnei_cont.34650

bnei_else.34649:
	nop
	nop
	addi	%a0, %zero, 184
	sw	%ra, 55(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 56

	nop
	nop
	nop
	jal	setup_rect_table.2880

	nop
	nop
	nop
	addi	%sp, %sp, -56

	nop
	nop
	lw	%ra, 55(%sp)
	lw	%v1, 53(%sp)

	nop
	nop
	nop
	sw	%v0, 187(%v1)

bnei_cont.34650:
	nop
	addi	%v0, %v1, -1
	addi	%a0, %zero, 247
	sw	%ra, 55(%sp)

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 56

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	nop
	addi	%sp, %sp, -56

	nop
	nop
	nop
	lw	%ra, 55(%sp)

	nop
	nop
	nop
	j	bgti_cont.34648

bgti_else.34647:
bgti_cont.34648:
	nop
	nop
	lw	%v0, 53(%sp)
	sw	%ra, 55(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 56

	nop
	nop
	nop
	jal	setup_reflections.3127

	nop
	addi	%sp, %sp, -56
	flw	%f0, 158(%zero)
	lw	%v0, 157(%zero)

	nop
	nop
	lw	%ra, 55(%sp)
	lw	%a0, 1(%sp)

	nop
	sub	%v0, %a0, %v0
	flw	%f2, 171(%zero)
	flw	%f3, 172(%zero)

	nop
	nop
	itof	%f1, %v0
	lw	%v0, 11(%sp)

	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	addi	%v1, %v0, -1
	lw	%v0, 33(%sp)

	nop
	nop
	fmul	%f1, %f0, %f1
	sw	%ra, 55(%sp)

	nop
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	addi	%sp, %sp, 56

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)

	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 173(%zero)
	fmov	%f29, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

	nop
	nop
	fmov	%f2, %f0
	fmov	%f0, %f1

	nop
	nop
	nop
	fmov	%f1, %f29

	nop
	nop
	nop
	jal	pretrace_pixels.3046

	nop
	nop
	nop
	addi	%sp, %sp, -56

	nop
	nop
	lw	%ra, 55(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	lw	%v1, 23(%sp)
	lw	%a0, 33(%sp)

	nop
	nop
	lw	%a1, 43(%sp)
	lw	%a2, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 55(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 56

	nop
	nop
	nop
	jal	scan_line.3063

	nop
	nop
	nop
	addi	%sp, %sp, -56

	nop
	nop
	nop
	lw	%ra, 55(%sp)

	nop
	nop
	nop
	ret

