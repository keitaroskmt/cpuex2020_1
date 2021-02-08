.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 500
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
kernel_atan.2612:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	flw	%f4, 499(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 498(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 497(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 496(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 495(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 494(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
reduction_2pi_sub1.2614:
	fblt	%f0, %f1, fbgt_else.18741
	flw	%f2, 493(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18742
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18743
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18744
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18745
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18746
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18747
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18748
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18749
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18750
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18751
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18752
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18753
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18754
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18755
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18756
	fmul	%f1, %f2, %f1
	j	reduction_2pi_sub1.2614
fbgt_else.18756:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18755:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18754:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18753:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18752:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18751:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18750:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18749:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18748:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18747:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18746:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18745:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18744:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18743:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18742:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18741:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2617:
	fblt	%f0, %f2, fbgt_else.18757
	fblt	%f0, %f1, fbgt_else.18758
	fsub	%f0, %f0, %f1
	flw	%f3, 493(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18759
	fblt	%f0, %f1, fbgt_else.18760
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18761
	fblt	%f0, %f1, fbgt_else.18762
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18763
	fblt	%f0, %f1, fbgt_else.18764
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18764:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18763:
	jr	%ra
fbgt_else.18762:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18765
	fblt	%f0, %f1, fbgt_else.18766
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18766:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18765:
	jr	%ra
fbgt_else.18761:
	jr	%ra
fbgt_else.18760:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18767
	fblt	%f0, %f1, fbgt_else.18768
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18769
	fblt	%f0, %f1, fbgt_else.18770
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18770:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18769:
	jr	%ra
fbgt_else.18768:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18771
	fblt	%f0, %f1, fbgt_else.18772
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18772:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18771:
	jr	%ra
fbgt_else.18767:
	jr	%ra
fbgt_else.18759:
	jr	%ra
fbgt_else.18758:
	flw	%f3, 493(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18773
	fblt	%f0, %f1, fbgt_else.18774
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18775
	fblt	%f0, %f1, fbgt_else.18776
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18777
	fblt	%f0, %f1, fbgt_else.18778
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18778:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18777:
	jr	%ra
fbgt_else.18776:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18779
	fblt	%f0, %f1, fbgt_else.18780
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18780:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18779:
	jr	%ra
fbgt_else.18775:
	jr	%ra
fbgt_else.18774:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18781
	fblt	%f0, %f1, fbgt_else.18782
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18783
	fblt	%f0, %f1, fbgt_else.18784
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18784:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18783:
	jr	%ra
fbgt_else.18782:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18785
	fblt	%f0, %f1, fbgt_else.18786
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18786:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.18785:
	jr	%ra
fbgt_else.18781:
	jr	%ra
fbgt_else.18773:
	jr	%ra
fbgt_else.18757:
	jr	%ra
cos.2623:
	flw	%f1, 492(%zero)
	fabs	%f0, %f0
	flw	%f2, 491(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.18787
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.18789
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.18791
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.18793
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.18795
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.18797
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.18799
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.18801
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.18803
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.18805
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.18807
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.18809
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.18811
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.18813
	flw	%f3, 477(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.18814
fbgt_else.18813:
	fmov	%f0, %f3
fbgt_cont.18814:
	j	fbgt_cont.18812
fbgt_else.18811:
	fmov	%f0, %f3
fbgt_cont.18812:
	j	fbgt_cont.18810
fbgt_else.18809:
	fmov	%f0, %f3
fbgt_cont.18810:
	j	fbgt_cont.18808
fbgt_else.18807:
	fmov	%f0, %f3
fbgt_cont.18808:
	j	fbgt_cont.18806
fbgt_else.18805:
	fmov	%f0, %f3
fbgt_cont.18806:
	j	fbgt_cont.18804
fbgt_else.18803:
	fmov	%f0, %f3
fbgt_cont.18804:
	j	fbgt_cont.18802
fbgt_else.18801:
	fmov	%f0, %f3
fbgt_cont.18802:
	j	fbgt_cont.18800
fbgt_else.18799:
	fmov	%f0, %f3
fbgt_cont.18800:
	j	fbgt_cont.18798
fbgt_else.18797:
	fmov	%f0, %f3
fbgt_cont.18798:
	j	fbgt_cont.18796
fbgt_else.18795:
	fmov	%f0, %f3
fbgt_cont.18796:
	j	fbgt_cont.18794
fbgt_else.18793:
	fmov	%f0, %f3
fbgt_cont.18794:
	j	fbgt_cont.18792
fbgt_else.18791:
	fmov	%f0, %f3
fbgt_cont.18792:
	j	fbgt_cont.18790
fbgt_else.18789:
	fmov	%f0, %f3
fbgt_cont.18790:
	j	fbgt_cont.18788
fbgt_else.18787:
	fmov	%f0, %f2
fbgt_cont.18788:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	fblt	%f1, %f2, fbgt_else.18815
	fblt	%f1, %f0, fbgt_else.18817
	fsub	%f1, %f1, %f0
	flw	%f3, 493(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.18819
	fblt	%f1, %f0, fbgt_else.18821
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.18822
fbgt_else.18821:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.18822:
	j	fbgt_cont.18820
fbgt_else.18819:
	fmov	%f0, %f1
fbgt_cont.18820:
	j	fbgt_cont.18818
fbgt_else.18817:
	flw	%f3, 493(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.18823
	fblt	%f1, %f0, fbgt_else.18825
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.18826
fbgt_else.18825:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.18826:
	j	fbgt_cont.18824
fbgt_else.18823:
	fmov	%f0, %f1
fbgt_cont.18824:
fbgt_cont.18818:
	j	fbgt_cont.18816
fbgt_else.18815:
	fmov	%f0, %f1
fbgt_cont.18816:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.18827
	addi	%v0, %zero, 0
	j	fbgt_cont.18828
fbgt_else.18827:
	addi	%v0, %zero, 1
fbgt_cont.18828:
	fblt	%f0, %f1, fbgt_else.18829
	fsub	%f0, %f0, %f1
	j	fbgt_cont.18830
fbgt_else.18829:
fbgt_cont.18830:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.18831
	beqi	%v0, 0, bnei_else.18833
	addi	%v0, %zero, 0
	j	bnei_cont.18834
bnei_else.18833:
	addi	%v0, %zero, 1
bnei_cont.18834:
	j	fbgt_cont.18832
fbgt_else.18831:
fbgt_cont.18832:
	fblt	%f0, %f2, fbgt_else.18835
	fsub	%f0, %f1, %f0
	j	fbgt_cont.18836
fbgt_else.18835:
fbgt_cont.18836:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.18837
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 471(%zero)
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 468(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.18838
fbgt_else.18837:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.18838:
	beqi	%v0, 0, bnei_else.18839
	jr	%ra
bnei_else.18839:
	fneg	%f0, %f0
	jr	%ra
sin.2625:
	flw	%f1, 492(%zero)
	flw	%f2, 467(%zero)
	fblt	%f0, %f2, fbgt_else.18840
	addi	%v0, %zero, 1
	j	fbgt_cont.18841
fbgt_else.18840:
	addi	%v0, %zero, 0
fbgt_cont.18841:
	fabs	%f0, %f0
	flw	%f2, 491(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.18842
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.18844
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.18846
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.18848
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.18850
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.18852
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.18854
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.18856
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.18858
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.18860
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.18862
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.18864
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.18866
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.18868
	flw	%f3, 477(%zero)
	fmov	%f1, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.18869
fbgt_else.18868:
	fmov	%f0, %f3
fbgt_cont.18869:
	j	fbgt_cont.18867
fbgt_else.18866:
	fmov	%f0, %f3
fbgt_cont.18867:
	j	fbgt_cont.18865
fbgt_else.18864:
	fmov	%f0, %f3
fbgt_cont.18865:
	j	fbgt_cont.18863
fbgt_else.18862:
	fmov	%f0, %f3
fbgt_cont.18863:
	j	fbgt_cont.18861
fbgt_else.18860:
	fmov	%f0, %f3
fbgt_cont.18861:
	j	fbgt_cont.18859
fbgt_else.18858:
	fmov	%f0, %f3
fbgt_cont.18859:
	j	fbgt_cont.18857
fbgt_else.18856:
	fmov	%f0, %f3
fbgt_cont.18857:
	j	fbgt_cont.18855
fbgt_else.18854:
	fmov	%f0, %f3
fbgt_cont.18855:
	j	fbgt_cont.18853
fbgt_else.18852:
	fmov	%f0, %f3
fbgt_cont.18853:
	j	fbgt_cont.18851
fbgt_else.18850:
	fmov	%f0, %f3
fbgt_cont.18851:
	j	fbgt_cont.18849
fbgt_else.18848:
	fmov	%f0, %f3
fbgt_cont.18849:
	j	fbgt_cont.18847
fbgt_else.18846:
	fmov	%f0, %f3
fbgt_cont.18847:
	j	fbgt_cont.18845
fbgt_else.18844:
	fmov	%f0, %f3
fbgt_cont.18845:
	j	fbgt_cont.18843
fbgt_else.18842:
	fmov	%f0, %f2
fbgt_cont.18843:
	flw	%f1, 2(%sp)
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.18870
	fblt	%f1, %f0, fbgt_else.18872
	fsub	%f1, %f1, %f0
	flw	%f3, 493(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.18874
	fblt	%f1, %f0, fbgt_else.18876
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.18877
fbgt_else.18876:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.18877:
	j	fbgt_cont.18875
fbgt_else.18874:
	fmov	%f0, %f1
fbgt_cont.18875:
	j	fbgt_cont.18873
fbgt_else.18872:
	flw	%f3, 493(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.18878
	fblt	%f1, %f0, fbgt_else.18880
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.18881
fbgt_else.18880:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.18881:
	j	fbgt_cont.18879
fbgt_else.18878:
	fmov	%f0, %f1
fbgt_cont.18879:
fbgt_cont.18873:
	j	fbgt_cont.18871
fbgt_else.18870:
	fmov	%f0, %f1
fbgt_cont.18871:
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.18882
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.18884
	addi	%v0, %zero, 0
	j	bnei_cont.18885
bnei_else.18884:
	addi	%v0, %zero, 1
bnei_cont.18885:
	j	fbgt_cont.18883
fbgt_else.18882:
	lw	%v0, 0(%sp)
fbgt_cont.18883:
	fblt	%f0, %f1, fbgt_else.18886
	fsub	%f0, %f0, %f1
	j	fbgt_cont.18887
fbgt_else.18886:
fbgt_cont.18887:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.18888
	fsub	%f0, %f1, %f0
	j	fbgt_cont.18889
fbgt_else.18888:
fbgt_cont.18889:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.18890
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.18891
fbgt_else.18890:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 471(%zero)
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 468(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.18891:
	beqi	%v0, 0, bnei_else.18892
	jr	%ra
bnei_else.18892:
	fneg	%f0, %f0
	jr	%ra
print_int_sub1.2629:
	blti	%v0, 10, bgti_else.18893
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18894
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18895
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18896
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18897
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18898
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18899
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.18900
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2629
bgti_else.18900:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18899:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18898:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18897:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18896:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18895:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18894:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.18893:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.18901
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18902
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18903
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18904
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18905
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18906
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18907
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18908
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18909
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18910
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18911
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18912
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18913
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18914
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18915
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.18916
	addi	%v0, %v0, -10
	j	print_int_sub2.2632
bgti_else.18916:
	jr	%ra
bgti_else.18915:
	jr	%ra
bgti_else.18914:
	jr	%ra
bgti_else.18913:
	jr	%ra
bgti_else.18912:
	jr	%ra
bgti_else.18911:
	jr	%ra
bgti_else.18910:
	jr	%ra
bgti_else.18909:
	jr	%ra
bgti_else.18908:
	jr	%ra
bgti_else.18907:
	jr	%ra
bgti_else.18906:
	jr	%ra
bgti_else.18905:
	jr	%ra
bgti_else.18904:
	jr	%ra
bgti_else.18903:
	jr	%ra
bgti_else.18902:
	jr	%ra
bgti_else.18901:
	jr	%ra
print_int.2634:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.18917
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.18919
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18921
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18923
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18925
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18927
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18929
	addi	%v1, %v1, -10
	addi	%a0, %zero, 7
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2629
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.18930
bgti_else.18929:
	addi	%v0, %zero, 6
bgti_cont.18930:
	j	bgti_cont.18928
bgti_else.18927:
	addi	%v0, %zero, 5
bgti_cont.18928:
	j	bgti_cont.18926
bgti_else.18925:
	addi	%v0, %zero, 4
bgti_cont.18926:
	j	bgti_cont.18924
bgti_else.18923:
	addi	%v0, %zero, 3
bgti_cont.18924:
	j	bgti_cont.18922
bgti_else.18921:
	addi	%v0, %zero, 2
bgti_cont.18922:
	j	bgti_cont.18920
bgti_else.18919:
	addi	%v0, %zero, 1
bgti_cont.18920:
	j	bgti_cont.18918
bgti_else.18917:
	addi	%v0, %zero, 0
bgti_cont.18918:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.18931
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18933
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18935
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18937
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18939
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18941
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18943
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18945
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18947
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18949
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18951
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18953
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18955
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18957
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18959
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2632
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.18960
bgti_else.18959:
	add	%v0, %zero, %v1
bgti_cont.18960:
	j	bgti_cont.18958
bgti_else.18957:
	add	%v0, %zero, %v1
bgti_cont.18958:
	j	bgti_cont.18956
bgti_else.18955:
	add	%v0, %zero, %v1
bgti_cont.18956:
	j	bgti_cont.18954
bgti_else.18953:
	add	%v0, %zero, %v1
bgti_cont.18954:
	j	bgti_cont.18952
bgti_else.18951:
	add	%v0, %zero, %v1
bgti_cont.18952:
	j	bgti_cont.18950
bgti_else.18949:
	add	%v0, %zero, %v1
bgti_cont.18950:
	j	bgti_cont.18948
bgti_else.18947:
	add	%v0, %zero, %v1
bgti_cont.18948:
	j	bgti_cont.18946
bgti_else.18945:
	add	%v0, %zero, %v1
bgti_cont.18946:
	j	bgti_cont.18944
bgti_else.18943:
	add	%v0, %zero, %v1
bgti_cont.18944:
	j	bgti_cont.18942
bgti_else.18941:
	add	%v0, %zero, %v1
bgti_cont.18942:
	j	bgti_cont.18940
bgti_else.18939:
	add	%v0, %zero, %v1
bgti_cont.18940:
	j	bgti_cont.18938
bgti_else.18937:
	add	%v0, %zero, %v1
bgti_cont.18938:
	j	bgti_cont.18936
bgti_else.18935:
	add	%v0, %zero, %v1
bgti_cont.18936:
	j	bgti_cont.18934
bgti_else.18933:
	add	%v0, %zero, %v1
bgti_cont.18934:
	j	bgti_cont.18932
bgti_else.18931:
	add	%v0, %zero, %v1
bgti_cont.18932:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.18961
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.18961:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.18962
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.18964
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18966
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18968
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18970
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18972
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.18974
	addi	%a0, %a0, -10
	addi	%a1, %zero, 7
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.18975
bgti_else.18974:
	addi	%v0, %zero, 6
bgti_cont.18975:
	j	bgti_cont.18973
bgti_else.18972:
	addi	%v0, %zero, 5
bgti_cont.18973:
	j	bgti_cont.18971
bgti_else.18970:
	addi	%v0, %zero, 4
bgti_cont.18971:
	j	bgti_cont.18969
bgti_else.18968:
	addi	%v0, %zero, 3
bgti_cont.18969:
	j	bgti_cont.18967
bgti_else.18966:
	addi	%v0, %zero, 2
bgti_cont.18967:
	j	bgti_cont.18965
bgti_else.18964:
	addi	%v0, %zero, 1
bgti_cont.18965:
	j	bgti_cont.18963
bgti_else.18962:
	addi	%v0, %zero, 0
bgti_cont.18963:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.18976
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18978
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18980
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18982
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18984
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18986
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18988
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18990
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18992
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18994
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18996
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.18998
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19000
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19002
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19004
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2632
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.19005
bgti_else.19004:
	add	%v0, %zero, %v1
bgti_cont.19005:
	j	bgti_cont.19003
bgti_else.19002:
	add	%v0, %zero, %v1
bgti_cont.19003:
	j	bgti_cont.19001
bgti_else.19000:
	add	%v0, %zero, %v1
bgti_cont.19001:
	j	bgti_cont.18999
bgti_else.18998:
	add	%v0, %zero, %v1
bgti_cont.18999:
	j	bgti_cont.18997
bgti_else.18996:
	add	%v0, %zero, %v1
bgti_cont.18997:
	j	bgti_cont.18995
bgti_else.18994:
	add	%v0, %zero, %v1
bgti_cont.18995:
	j	bgti_cont.18993
bgti_else.18992:
	add	%v0, %zero, %v1
bgti_cont.18993:
	j	bgti_cont.18991
bgti_else.18990:
	add	%v0, %zero, %v1
bgti_cont.18991:
	j	bgti_cont.18989
bgti_else.18988:
	add	%v0, %zero, %v1
bgti_cont.18989:
	j	bgti_cont.18987
bgti_else.18986:
	add	%v0, %zero, %v1
bgti_cont.18987:
	j	bgti_cont.18985
bgti_else.18984:
	add	%v0, %zero, %v1
bgti_cont.18985:
	j	bgti_cont.18983
bgti_else.18982:
	add	%v0, %zero, %v1
bgti_cont.18983:
	j	bgti_cont.18981
bgti_else.18980:
	add	%v0, %zero, %v1
bgti_cont.18981:
	j	bgti_cont.18979
bgti_else.18978:
	add	%v0, %zero, %v1
bgti_cont.18979:
	j	bgti_cont.18977
bgti_else.18976:
	add	%v0, %zero, %v1
bgti_cont.18977:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.19006
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.19006:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.19007
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19009
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19011
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19013
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19015
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19017
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19019
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19021
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19023
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19025
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19027
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19029
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19031
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19033
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19035
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2632
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.19036
bgti_else.19035:
	add	%v0, %zero, %v1
bgti_cont.19036:
	j	bgti_cont.19034
bgti_else.19033:
	add	%v0, %zero, %v1
bgti_cont.19034:
	j	bgti_cont.19032
bgti_else.19031:
	add	%v0, %zero, %v1
bgti_cont.19032:
	j	bgti_cont.19030
bgti_else.19029:
	add	%v0, %zero, %v1
bgti_cont.19030:
	j	bgti_cont.19028
bgti_else.19027:
	add	%v0, %zero, %v1
bgti_cont.19028:
	j	bgti_cont.19026
bgti_else.19025:
	add	%v0, %zero, %v1
bgti_cont.19026:
	j	bgti_cont.19024
bgti_else.19023:
	add	%v0, %zero, %v1
bgti_cont.19024:
	j	bgti_cont.19022
bgti_else.19021:
	add	%v0, %zero, %v1
bgti_cont.19022:
	j	bgti_cont.19020
bgti_else.19019:
	add	%v0, %zero, %v1
bgti_cont.19020:
	j	bgti_cont.19018
bgti_else.19017:
	add	%v0, %zero, %v1
bgti_cont.19018:
	j	bgti_cont.19016
bgti_else.19015:
	add	%v0, %zero, %v1
bgti_cont.19016:
	j	bgti_cont.19014
bgti_else.19013:
	add	%v0, %zero, %v1
bgti_cont.19014:
	j	bgti_cont.19012
bgti_else.19011:
	add	%v0, %zero, %v1
bgti_cont.19012:
	j	bgti_cont.19010
bgti_else.19009:
	add	%v0, %zero, %v1
bgti_cont.19010:
	j	bgti_cont.19008
bgti_else.19007:
	add	%v0, %zero, %v1
bgti_cont.19008:
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
vecunit_sgn.2662:
	flw	%f0, 0(%v0)
	fmul	%f1, %f0, %f0
	flw	%f2, 1(%v0)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%v0)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 467(%zero)
	fbne	%f1, %f4, fbeq_else.19037
	addi	%a0, %zero, 1
	j	fbeq_cont.19038
fbeq_else.19037:
	addi	%a0, %zero, 0
fbeq_cont.19038:
	beqi	%a0, 0, bnei_else.19039
	flw	%f1, 471(%zero)
	j	bnei_cont.19040
bnei_else.19039:
	beqi	%v1, 0, bnei_else.19041
	flw	%f4, 466(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.19042
bnei_else.19041:
	flw	%f4, 471(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.19042:
bnei_cont.19040:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%v0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%v0)
	jr	%ra
read_screen_settings.2763:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fsw	%f0, 72(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fsw	%f0, 73(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fsw	%f0, 74(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	flw	%f1, 465(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2623
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fmov	%f0, %f1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2625
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
	jal	cos.2623
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	sin.2625
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 2(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 464(%zero)
	fmul	%f2, %f2, %f3
	fsw	%f2, 171(%zero)
	flw	%f2, 463(%zero)
	flw	%f4, 3(%sp)
	fmul	%f2, %f4, %f2
	fsw	%f2, 172(%zero)
	flw	%f2, 5(%sp)
	fmul	%f5, %f1, %f2
	fmul	%f3, %f5, %f3
	fsw	%f3, 173(%zero)
	fsw	%f2, 165(%zero)
	flw	%f3, 467(%zero)
	fsw	%f3, 166(%zero)
	fneg	%f3, %f0
	fsw	%f3, 167(%zero)
	fneg	%f3, %f4
	fmul	%f0, %f3, %f0
	fsw	%f0, 168(%zero)
	fneg	%f0, %f1
	fsw	%f0, 169(%zero)
	fneg	%f0, %f4
	fmul	%f0, %f0, %f2
	fsw	%f0, 170(%zero)
	flw	%f0, 72(%zero)
	flw	%f1, 171(%zero)
	fsub	%f0, %f0, %f1
	fsw	%f0, 75(%zero)
	flw	%f0, 73(%zero)
	flw	%f1, 172(%zero)
	fsub	%f0, %f0, %f1
	fsw	%f0, 76(%zero)
	flw	%f0, 74(%zero)
	flw	%f1, 173(%zero)
	fsub	%f0, %f0, %f1
	fsw	%f0, 77(%zero)
	jr	%ra
rotate_quadratic_matrix.2767:
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	cos.2623
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fsw	%f0, 3(%sp)
	fmov	%f0, %f1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	sin.2625
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 4(%sp)
	fsw	%f1, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	cos.2623
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsw	%f0, 6(%sp)
	fmov	%f0, %f1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	sin.2625
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	fmov	%f0, %f1
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	cos.2623
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsw	%f0, 9(%sp)
	fmov	%f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	sin.2625
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
	flw	%f12, 493(%zero)
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
read_nth_object.2770:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.19046
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
	flw	%f0, 467(%zero)
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
	fblt	%f0, %f1, fbgt_else.19047
	addi	%v0, %zero, 0
	j	fbgt_cont.19048
fbgt_else.19047:
	addi	%v0, %zero, 1
fbgt_cont.19048:
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
	beqi	%v1, 0, bnei_else.19049
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 465(%zero)
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
	j	bnei_cont.19050
bnei_else.19049:
bnei_cont.19050:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.19051
	lw	%a0, 10(%sp)
	j	bnei_cont.19052
bnei_else.19051:
	addi	%a0, %zero, 1
bnei_cont.19052:
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
	beqi	%a2, 3, bnei_else.19053
	beqi	%a2, 2, bnei_else.19055
	j	bnei_cont.19056
bnei_else.19055:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.19057
	addi	%v1, %zero, 0
	j	bnei_cont.19058
bnei_else.19057:
	addi	%v1, %zero, 1
bnei_cont.19058:
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	vecunit_sgn.2662
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
bnei_cont.19056:
	j	bnei_cont.19054
bnei_else.19053:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.19059
	addi	%v1, %zero, 1
	j	fbeq_cont.19060
fbeq_else.19059:
	addi	%v1, %zero, 0
fbeq_cont.19060:
	beqi	%v1, 0, bnei_else.19061
	fmov	%f0, %f1
	j	bnei_cont.19062
bnei_else.19061:
	fbne	%f0, %f1, fbeq_else.19063
	addi	%v1, %zero, 1
	j	fbeq_cont.19064
fbeq_else.19063:
	addi	%v1, %zero, 0
fbeq_cont.19064:
	beqi	%v1, 0, bnei_else.19065
	fmov	%f2, %f1
	j	bnei_cont.19066
bnei_else.19065:
	fblt	%f1, %f0, fbgt_else.19067
	addi	%v1, %zero, 0
	j	fbgt_cont.19068
fbgt_else.19067:
	addi	%v1, %zero, 1
fbgt_cont.19068:
	beqi	%v1, 0, bnei_else.19069
	flw	%f2, 471(%zero)
	j	bnei_cont.19070
bnei_else.19069:
	flw	%f2, 466(%zero)
bnei_cont.19070:
bnei_cont.19066:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.19062:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.19071
	addi	%v1, %zero, 1
	j	fbeq_cont.19072
fbeq_else.19071:
	addi	%v1, %zero, 0
fbeq_cont.19072:
	beqi	%v1, 0, bnei_else.19073
	fmov	%f0, %f1
	j	bnei_cont.19074
bnei_else.19073:
	fbne	%f0, %f1, fbeq_else.19075
	addi	%v1, %zero, 1
	j	fbeq_cont.19076
fbeq_else.19075:
	addi	%v1, %zero, 0
fbeq_cont.19076:
	beqi	%v1, 0, bnei_else.19077
	fmov	%f2, %f1
	j	bnei_cont.19078
bnei_else.19077:
	fblt	%f1, %f0, fbgt_else.19079
	addi	%v1, %zero, 0
	j	fbgt_cont.19080
fbgt_else.19079:
	addi	%v1, %zero, 1
fbgt_cont.19080:
	beqi	%v1, 0, bnei_else.19081
	flw	%f2, 471(%zero)
	j	bnei_cont.19082
bnei_else.19081:
	flw	%f2, 466(%zero)
bnei_cont.19082:
bnei_cont.19078:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.19074:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.19083
	addi	%v1, %zero, 1
	j	fbeq_cont.19084
fbeq_else.19083:
	addi	%v1, %zero, 0
fbeq_cont.19084:
	beqi	%v1, 0, bnei_else.19085
	fmov	%f0, %f1
	j	bnei_cont.19086
bnei_else.19085:
	fbne	%f0, %f1, fbeq_else.19087
	addi	%v1, %zero, 1
	j	fbeq_cont.19088
fbeq_else.19087:
	addi	%v1, %zero, 0
fbeq_cont.19088:
	beqi	%v1, 0, bnei_else.19089
	j	bnei_cont.19090
bnei_else.19089:
	fblt	%f1, %f0, fbgt_else.19091
	addi	%v1, %zero, 0
	j	fbgt_cont.19092
fbgt_else.19091:
	addi	%v1, %zero, 1
fbgt_cont.19092:
	beqi	%v1, 0, bnei_else.19093
	flw	%f1, 471(%zero)
	j	bnei_cont.19094
bnei_else.19093:
	flw	%f1, 466(%zero)
bnei_cont.19094:
bnei_cont.19090:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.19086:
	fsw	%f0, 2(%a0)
bnei_cont.19054:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.19095
	lw	%v0, 7(%sp)
	lw	%v1, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2767
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.19096
bnei_else.19095:
bnei_cont.19096:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19046:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2772:
	blti	%v0, 60, bgti_else.19097
	jr	%ra
bgti_else.19097:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2770
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.19099
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19100
	jr	%ra
bgti_else.19100:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2770
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.19102
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19103
	jr	%ra
bgti_else.19103:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2770
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.19105
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19106
	jr	%ra
bgti_else.19106:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2770
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19108
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19109
	jr	%ra
bgti_else.19109:
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_nth_object.2770
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.19111
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19112
	jr	%ra
bgti_else.19112:
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_nth_object.2770
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.19114
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19115
	jr	%ra
bgti_else.19115:
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	read_nth_object.2770
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.19117
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19118
	jr	%ra
bgti_else.19118:
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	read_nth_object.2770
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19120
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	j	read_object.2772
bnei_else.19120:
	lw	%v0, 7(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19117:
	lw	%v0, 6(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19114:
	lw	%v0, 5(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19111:
	lw	%v0, 4(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19108:
	lw	%v0, 3(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19105:
	lw	%v0, 2(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19102:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19099:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
read_net_item.2776:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.19129
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
	beqi	%v0, -1, bnei_else.19130
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.19132
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.19134
	lw	%v1, 7(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	read_net_item.2776
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19135
bnei_else.19134:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19135:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19133
bnei_else.19132:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19133:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19131
bnei_else.19130:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19131:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.19129:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_or_network.2778:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	sw	%v1, 1(%sp)
	beqi	%v0, -1, bnei_else.19136
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.19138
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.19140
	addi	%v1, %zero, 3
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_net_item.2776
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.19141
bnei_else.19140:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19141:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19139
bnei_else.19138:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19139:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.19137
bnei_else.19136:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.19137:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.19142
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
	beqi	%v0, -1, bnei_else.19143
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.19145
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2776
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19146
bnei_else.19145:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19146:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.19144
bnei_else.19143:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.19144:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.19147
	lw	%v0, 6(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	read_or_network.2778
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 10(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19148
bnei_else.19147:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.19148:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.19142:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_and_network.2780:
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
	beqi	%v0, -1, bnei_else.19149
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.19151
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.19153
	addi	%v1, %zero, 3
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_net_item.2776
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.19154
bnei_else.19153:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19154:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19152
bnei_else.19151:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19152:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19150
bnei_else.19149:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19150:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19155
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
	beqi	%v0, -1, bnei_else.19156
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.19158
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2776
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19159
bnei_else.19158:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19159:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19157
bnei_else.19156:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19157:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19160
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
	beqi	%v0, -1, bnei_else.19161
	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	read_net_item.2776
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19162
bnei_else.19161:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.19162:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19163
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
	jal	read_net_item.2776
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19164
	addi	%v1, %zero, 83
	lw	%a0, 12(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2780
bnei_else.19164:
	jr	%ra
bnei_else.19163:
	jr	%ra
bnei_else.19160:
	jr	%ra
bnei_else.19155:
	jr	%ra
solver_rect_surface.2784:
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	flw	%f4, 467(%zero)
	fbne	%f3, %f4, fbeq_else.19169
	addi	%a3, %zero, 1
	j	fbeq_cont.19170
fbeq_else.19169:
	addi	%a3, %zero, 0
fbeq_cont.19170:
	beqi	%a3, 0, bnei_else.19171
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19171:
	lw	%a3, 4(%v0)
	lw	%v0, 6(%v0)
	fblt	%f3, %f4, fbgt_else.19172
	addi	%t0, %zero, 0
	j	fbgt_cont.19173
fbgt_else.19172:
	addi	%t0, %zero, 1
fbgt_cont.19173:
	beqi	%v0, 0, bnei_else.19174
	beqi	%t0, 0, bnei_else.19176
	addi	%v0, %zero, 0
	j	bnei_cont.19177
bnei_else.19176:
	addi	%v0, %zero, 1
bnei_cont.19177:
	j	bnei_cont.19175
bnei_else.19174:
	add	%v0, %zero, %t0
bnei_cont.19175:
	add	%at, %a3, %a0
	flw	%f4, 0(%at)
	beqi	%v0, 0, bnei_else.19178
	j	bnei_cont.19179
bnei_else.19178:
	fneg	%f4, %f4
bnei_cont.19179:
	fsub	%f0, %f4, %f0
	fdiv	%f0, %f0, %f3
	add	%at, %v1, %a1
	flw	%f3, 0(%at)
	fmul	%f3, %f0, %f3
	fadd	%f1, %f3, %f1
	fabs	%f1, %f1
	add	%at, %a3, %a1
	flw	%f3, 0(%at)
	fblt	%f1, %f3, fbgt_else.19180
	addi	%v0, %zero, 0
	j	fbgt_cont.19181
fbgt_else.19180:
	addi	%v0, %zero, 1
fbgt_cont.19181:
	beqi	%v0, 0, bnei_else.19182
	add	%at, %v1, %a2
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	add	%at, %a3, %a2
	flw	%f2, 0(%at)
	fblt	%f1, %f2, fbgt_else.19183
	addi	%v0, %zero, 0
	j	fbgt_cont.19184
fbgt_else.19183:
	addi	%v0, %zero, 1
fbgt_cont.19184:
	beqi	%v0, 0, bnei_else.19185
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19185:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19182:
	addi	%v0, %zero, 0
	jr	%ra
solver_surface.2799:
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
	flw	%f5, 467(%zero)
	fblt	%f5, %f3, fbgt_else.19186
	addi	%v0, %zero, 0
	j	fbgt_cont.19187
fbgt_else.19186:
	addi	%v0, %zero, 1
fbgt_cont.19187:
	beqi	%v0, 0, bnei_else.19188
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19188:
	addi	%v0, %zero, 0
	jr	%ra
quadratic.2805:
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
	beqi	%v1, 0, bnei_else.19189
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
bnei_else.19189:
	fmov	%f0, %f3
	jr	%ra
bilinear.2810:
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
	beqi	%v1, 0, bnei_else.19190
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
	flw	%f1, 470(%zero)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f6, %f0
	jr	%ra
bnei_else.19190:
	fmov	%f0, %f6
	jr	%ra
solver_second.2818:
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
	jal	quadratic.2805
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 467(%zero)
	fbne	%f0, %f1, fbeq_else.19191
	addi	%v0, %zero, 1
	j	fbeq_cont.19192
fbeq_else.19191:
	addi	%v0, %zero, 0
fbeq_cont.19192:
	beqi	%v0, 0, bnei_else.19193
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19193:
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
	jal	bilinear.2810
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
	jal	quadratic.2805
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.19194
	j	bnei_cont.19195
bnei_else.19194:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19195:
	flw	%f1, 9(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 8(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 7(%sp)
	fblt	%f2, %f0, fbgt_else.19196
	addi	%v1, %zero, 0
	j	fbgt_cont.19197
fbgt_else.19196:
	addi	%v1, %zero, 1
fbgt_cont.19197:
	beqi	%v1, 0, bnei_else.19198
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19199
	j	bnei_cont.19200
bnei_else.19199:
	fneg	%f0, %f0
bnei_cont.19200:
	fsub	%f0, %f0, %f1
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19198:
	addi	%v0, %zero, 0
	jr	%ra
solver.2824:
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
	beqi	%a0, 1, bnei_else.19201
	beqi	%a0, 2, bnei_else.19202
	j	solver_second.2818
bnei_else.19202:
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
	flw	%f5, 467(%zero)
	fblt	%f5, %f3, fbgt_else.19203
	addi	%v0, %zero, 0
	j	fbgt_cont.19204
fbgt_else.19203:
	addi	%v0, %zero, 1
fbgt_cont.19204:
	beqi	%v0, 0, bnei_else.19205
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19205:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19201:
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
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19206
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19206:
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
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19207
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.19207:
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
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19208
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.19208:
	addi	%v0, %zero, 0
	jr	%ra
solver_rect_fast.2828:
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
	fblt	%f6, %f7, fbgt_else.19209
	addi	%a1, %zero, 0
	j	fbgt_cont.19210
fbgt_else.19209:
	addi	%a1, %zero, 1
fbgt_cont.19210:
	beqi	%a1, 0, bnei_else.19211
	flw	%f6, 2(%v1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%a1, 4(%v0)
	flw	%f7, 2(%a1)
	fblt	%f6, %f7, fbgt_else.19213
	addi	%a1, %zero, 0
	j	fbgt_cont.19214
fbgt_else.19213:
	addi	%a1, %zero, 1
fbgt_cont.19214:
	beqi	%a1, 0, bnei_else.19215
	flw	%f6, 467(%zero)
	fbne	%f4, %f6, fbeq_else.19217
	addi	%a1, %zero, 1
	j	fbeq_cont.19218
fbeq_else.19217:
	addi	%a1, %zero, 0
fbeq_cont.19218:
	beqi	%a1, 0, bnei_else.19219
	addi	%a1, %zero, 0
	j	bnei_cont.19220
bnei_else.19219:
	addi	%a1, %zero, 1
bnei_cont.19220:
	j	bnei_cont.19216
bnei_else.19215:
	addi	%a1, %zero, 0
bnei_cont.19216:
	j	bnei_cont.19212
bnei_else.19211:
	addi	%a1, %zero, 0
bnei_cont.19212:
	beqi	%a1, 0, bnei_else.19221
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19221:
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
	fblt	%f7, %f8, fbgt_else.19222
	addi	%a1, %zero, 0
	j	fbgt_cont.19223
fbgt_else.19222:
	addi	%a1, %zero, 1
fbgt_cont.19223:
	beqi	%a1, 0, bnei_else.19224
	flw	%f7, 2(%v1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fblt	%f7, %f8, fbgt_else.19226
	addi	%v1, %zero, 0
	j	fbgt_cont.19227
fbgt_else.19226:
	addi	%v1, %zero, 1
fbgt_cont.19227:
	beqi	%v1, 0, bnei_else.19228
	flw	%f7, 467(%zero)
	fbne	%f4, %f7, fbeq_else.19230
	addi	%v1, %zero, 1
	j	fbeq_cont.19231
fbeq_else.19230:
	addi	%v1, %zero, 0
fbeq_cont.19231:
	beqi	%v1, 0, bnei_else.19232
	addi	%v1, %zero, 0
	j	bnei_cont.19233
bnei_else.19232:
	addi	%v1, %zero, 1
bnei_cont.19233:
	j	bnei_cont.19229
bnei_else.19228:
	addi	%v1, %zero, 0
bnei_cont.19229:
	j	bnei_cont.19225
bnei_else.19224:
	addi	%v1, %zero, 0
bnei_cont.19225:
	beqi	%v1, 0, bnei_else.19234
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.19234:
	flw	%f3, 4(%a0)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a0)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f4, 0(%v1)
	fblt	%f0, %f4, fbgt_else.19235
	addi	%v1, %zero, 0
	j	fbgt_cont.19236
fbgt_else.19235:
	addi	%v1, %zero, 1
fbgt_cont.19236:
	beqi	%v1, 0, bnei_else.19237
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%v0, 4(%v0)
	flw	%f1, 1(%v0)
	fblt	%f0, %f1, fbgt_else.19239
	addi	%v0, %zero, 0
	j	fbgt_cont.19240
fbgt_else.19239:
	addi	%v0, %zero, 1
fbgt_cont.19240:
	beqi	%v0, 0, bnei_else.19241
	flw	%f0, 467(%zero)
	fbne	%f3, %f0, fbeq_else.19243
	addi	%v0, %zero, 1
	j	fbeq_cont.19244
fbeq_else.19243:
	addi	%v0, %zero, 0
fbeq_cont.19244:
	beqi	%v0, 0, bnei_else.19245
	addi	%v0, %zero, 0
	j	bnei_cont.19246
bnei_else.19245:
	addi	%v0, %zero, 1
bnei_cont.19246:
	j	bnei_cont.19242
bnei_else.19241:
	addi	%v0, %zero, 0
bnei_cont.19242:
	j	bnei_cont.19238
bnei_else.19237:
	addi	%v0, %zero, 0
bnei_cont.19238:
	beqi	%v0, 0, bnei_else.19247
	fsw	%f2, 135(%zero)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.19247:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2841:
	flw	%f3, 0(%v1)
	flw	%f4, 467(%zero)
	fbne	%f3, %f4, fbeq_else.19248
	addi	%a0, %zero, 1
	j	fbeq_cont.19249
fbeq_else.19248:
	addi	%a0, %zero, 0
fbeq_cont.19249:
	beqi	%a0, 0, bnei_else.19250
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19250:
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
	jal	quadratic.2805
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.19251
	j	bnei_cont.19252
bnei_else.19251:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19252:
	flw	%f1, 3(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 2(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 1(%sp)
	fblt	%f2, %f0, fbgt_else.19253
	addi	%v1, %zero, 0
	j	fbgt_cont.19254
fbgt_else.19253:
	addi	%v1, %zero, 1
fbgt_cont.19254:
	beqi	%v1, 0, bnei_else.19255
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19256
	fsqrt	%f0, %f0
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.19257
bnei_else.19256:
	fsqrt	%f0, %f0
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.19257:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19255:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2858:
	flw	%f3, 0(%v1)
	flw	%f4, 467(%zero)
	fbne	%f3, %f4, fbeq_else.19258
	addi	%a1, %zero, 1
	j	fbeq_cont.19259
fbeq_else.19258:
	addi	%a1, %zero, 0
fbeq_cont.19259:
	beqi	%a1, 0, bnei_else.19260
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19260:
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
	fblt	%f4, %f1, fbgt_else.19261
	addi	%a0, %zero, 0
	j	fbgt_cont.19262
fbgt_else.19261:
	addi	%a0, %zero, 1
fbgt_cont.19262:
	beqi	%a0, 0, bnei_else.19263
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19264
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.19265
bnei_else.19264:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.19265:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19263:
	addi	%v0, %zero, 0
	jr	%ra
setup_rect_table.2868:
	addi	%a0, %zero, 6
	flw	%f0, 467(%zero)
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
	fbne	%f0, %f1, fbeq_else.19266
	addi	%a0, %zero, 1
	j	fbeq_cont.19267
fbeq_else.19266:
	addi	%a0, %zero, 0
fbeq_cont.19267:
	beqi	%a0, 0, bnei_else.19268
	fsw	%f1, 1(%v0)
	j	bnei_cont.19269
bnei_else.19268:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.19270
	addi	%a2, %zero, 0
	j	fbgt_cont.19271
fbgt_else.19270:
	addi	%a2, %zero, 1
fbgt_cont.19271:
	beqi	%a1, 0, bnei_else.19272
	beqi	%a2, 0, bnei_else.19274
	addi	%a1, %zero, 0
	j	bnei_cont.19275
bnei_else.19274:
	addi	%a1, %zero, 1
bnei_cont.19275:
	j	bnei_cont.19273
bnei_else.19272:
	add	%a1, %zero, %a2
bnei_cont.19273:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.19276
	j	bnei_cont.19277
bnei_else.19276:
	fneg	%f2, %f2
bnei_cont.19277:
	fsw	%f2, 0(%v0)
	flw	%f2, 471(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.19269:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.19278
	addi	%a0, %zero, 1
	j	fbeq_cont.19279
fbeq_else.19278:
	addi	%a0, %zero, 0
fbeq_cont.19279:
	beqi	%a0, 0, bnei_else.19280
	fsw	%f1, 3(%v0)
	j	bnei_cont.19281
bnei_else.19280:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.19282
	addi	%a2, %zero, 0
	j	fbgt_cont.19283
fbgt_else.19282:
	addi	%a2, %zero, 1
fbgt_cont.19283:
	beqi	%a1, 0, bnei_else.19284
	beqi	%a2, 0, bnei_else.19286
	addi	%a1, %zero, 0
	j	bnei_cont.19287
bnei_else.19286:
	addi	%a1, %zero, 1
bnei_cont.19287:
	j	bnei_cont.19285
bnei_else.19284:
	add	%a1, %zero, %a2
bnei_cont.19285:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.19288
	j	bnei_cont.19289
bnei_else.19288:
	fneg	%f2, %f2
bnei_cont.19289:
	fsw	%f2, 2(%v0)
	flw	%f2, 471(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.19281:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.19290
	addi	%v1, %zero, 1
	j	fbeq_cont.19291
fbeq_else.19290:
	addi	%v1, %zero, 0
fbeq_cont.19291:
	beqi	%v1, 0, bnei_else.19292
	fsw	%f1, 5(%v0)
	j	bnei_cont.19293
bnei_else.19292:
	lw	%v1, 0(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.19294
	addi	%a1, %zero, 0
	j	fbgt_cont.19295
fbgt_else.19294:
	addi	%a1, %zero, 1
fbgt_cont.19295:
	beqi	%a0, 0, bnei_else.19296
	beqi	%a1, 0, bnei_else.19298
	addi	%a0, %zero, 0
	j	bnei_cont.19299
bnei_else.19298:
	addi	%a0, %zero, 1
bnei_cont.19299:
	j	bnei_cont.19297
bnei_else.19296:
	add	%a0, %zero, %a1
bnei_cont.19297:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.19300
	j	bnei_cont.19301
bnei_else.19300:
	fneg	%f1, %f1
bnei_cont.19301:
	fsw	%f1, 4(%v0)
	flw	%f1, 471(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.19293:
	jr	%ra
setup_surface_table.2871:
	addi	%a0, %zero, 4
	flw	%f0, 467(%zero)
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
	fblt	%f1, %f0, fbgt_else.19302
	addi	%v1, %zero, 0
	j	fbgt_cont.19303
fbgt_else.19302:
	addi	%v1, %zero, 1
fbgt_cont.19303:
	beqi	%v1, 0, bnei_else.19304
	flw	%f1, 466(%zero)
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
	j	bnei_cont.19305
bnei_else.19304:
	fsw	%f1, 0(%v0)
bnei_cont.19305:
	jr	%ra
setup_second_table.2874:
	addi	%a0, %zero, 5
	flw	%f0, 467(%zero)
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
	jal	quadratic.2805
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
	beqi	%a0, 0, bnei_else.19306
	lw	%a0, 9(%v0)
	flw	%f7, 1(%a0)
	fmul	%f7, %f6, %f7
	lw	%a0, 9(%v0)
	flw	%f8, 2(%a0)
	fmul	%f8, %f4, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 470(%zero)
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
	j	bnei_cont.19307
bnei_else.19306:
	fsw	%f1, 1(%v1)
	fsw	%f3, 2(%v1)
	fsw	%f5, 3(%v1)
bnei_cont.19307:
	flw	%f1, 0(%sp)
	fbne	%f0, %f1, fbeq_else.19308
	addi	%v0, %zero, 1
	j	fbeq_cont.19309
fbeq_else.19308:
	addi	%v0, %zero, 0
fbeq_cont.19309:
	beqi	%v0, 0, bnei_else.19310
	j	bnei_cont.19311
bnei_else.19310:
	flw	%f1, 471(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v1)
bnei_cont.19311:
	add	%v0, %zero, %v1
	jr	%ra
iter_setup_dirvec_constants.2877:
	blti	%v1, 0, bgti_else.19312
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.19313
	beqi	%a3, 2, bnei_else.19315
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_second_table.2874
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19316
bnei_else.19315:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_surface_table.2871
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19316:
	j	bnei_cont.19314
bnei_else.19313:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_rect_table.2868
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19314:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.19317
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.19318
	beqi	%a3, 2, bnei_else.19320
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_second_table.2874
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19321
bnei_else.19320:
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_surface_table.2871
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19321:
	j	bnei_cont.19319
bnei_else.19318:
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_rect_table.2868
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19319:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2877
bgti_else.19317:
	jr	%ra
bgti_else.19312:
	jr	%ra
setup_startp_constants.2882:
	blti	%v1, 0, bgti_else.19324
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
	beqi	%a2, 2, bnei_else.19325
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.19327
	j	bgt_cont.19328
bgt_else.19327:
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	sw	%a1, 2(%sp)
	sw	%a2, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	quadratic.2805
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	beqi	%v0, 3, bnei_else.19329
	j	bnei_cont.19330
bnei_else.19329:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19330:
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
bgt_cont.19328:
	j	bnei_cont.19326
bnei_else.19325:
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
bnei_cont.19326:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2882
bgti_else.19324:
	jr	%ra
is_outside.2902:
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
	beqi	%v1, 1, bnei_else.19332
	beqi	%v1, 2, bnei_else.19333
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	quadratic.2805
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.19334
	j	bnei_cont.19335
bnei_else.19334:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19335:
	lw	%v0, 6(%v0)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19336
	addi	%v1, %zero, 0
	j	fbgt_cont.19337
fbgt_else.19336:
	addi	%v1, %zero, 1
fbgt_cont.19337:
	beqi	%v0, 0, bnei_else.19338
	beqi	%v1, 0, bnei_else.19340
	addi	%v0, %zero, 0
	j	bnei_cont.19341
bnei_else.19340:
	addi	%v0, %zero, 1
bnei_cont.19341:
	j	bnei_cont.19339
bnei_else.19338:
	add	%v0, %zero, %v1
bnei_cont.19339:
	beqi	%v0, 0, bnei_else.19342
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19342:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19333:
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
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19343
	addi	%v1, %zero, 0
	j	fbgt_cont.19344
fbgt_else.19343:
	addi	%v1, %zero, 1
fbgt_cont.19344:
	beqi	%v0, 0, bnei_else.19345
	beqi	%v1, 0, bnei_else.19347
	addi	%v0, %zero, 0
	j	bnei_cont.19348
bnei_else.19347:
	addi	%v0, %zero, 1
bnei_cont.19348:
	j	bnei_cont.19346
bnei_else.19345:
	add	%v0, %zero, %v1
bnei_cont.19346:
	beqi	%v0, 0, bnei_else.19349
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19349:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19332:
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.19350
	addi	%v1, %zero, 0
	j	fbgt_cont.19351
fbgt_else.19350:
	addi	%v1, %zero, 1
fbgt_cont.19351:
	beqi	%v1, 0, bnei_else.19352
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.19354
	addi	%v1, %zero, 0
	j	fbgt_cont.19355
fbgt_else.19354:
	addi	%v1, %zero, 1
fbgt_cont.19355:
	beqi	%v1, 0, bnei_else.19356
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fblt	%f0, %f1, fbgt_else.19358
	addi	%v1, %zero, 0
	j	fbgt_cont.19359
fbgt_else.19358:
	addi	%v1, %zero, 1
fbgt_cont.19359:
	j	bnei_cont.19357
bnei_else.19356:
	addi	%v1, %zero, 0
bnei_cont.19357:
	j	bnei_cont.19353
bnei_else.19352:
	addi	%v1, %zero, 0
bnei_cont.19353:
	beqi	%v1, 0, bnei_else.19360
	lw	%v0, 6(%v0)
	jr	%ra
bnei_else.19360:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19361
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19361:
	addi	%v0, %zero, 1
	jr	%ra
check_all_inside.2907:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19362
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
	beqi	%a1, 1, bnei_else.19363
	beqi	%a1, 2, bnei_else.19365
	sw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	fmov	%f2, %f5
	fmov	%f1, %f4
	fmov	%f0, %f3
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	quadratic.2805
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.19367
	j	bnei_cont.19368
bnei_else.19367:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19368:
	lw	%v0, 6(%v0)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19369
	addi	%v1, %zero, 0
	j	fbgt_cont.19370
fbgt_else.19369:
	addi	%v1, %zero, 1
fbgt_cont.19370:
	beqi	%v0, 0, bnei_else.19371
	beqi	%v1, 0, bnei_else.19373
	addi	%v0, %zero, 0
	j	bnei_cont.19374
bnei_else.19373:
	addi	%v0, %zero, 1
bnei_cont.19374:
	j	bnei_cont.19372
bnei_else.19371:
	add	%v0, %zero, %v1
bnei_cont.19372:
	beqi	%v0, 0, bnei_else.19375
	addi	%v0, %zero, 0
	j	bnei_cont.19376
bnei_else.19375:
	addi	%v0, %zero, 1
bnei_cont.19376:
	j	bnei_cont.19366
bnei_else.19365:
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
	flw	%f4, 467(%zero)
	fblt	%f3, %f4, fbgt_else.19377
	addi	%a1, %zero, 0
	j	fbgt_cont.19378
fbgt_else.19377:
	addi	%a1, %zero, 1
fbgt_cont.19378:
	beqi	%a0, 0, bnei_else.19379
	beqi	%a1, 0, bnei_else.19381
	addi	%a0, %zero, 0
	j	bnei_cont.19382
bnei_else.19381:
	addi	%a0, %zero, 1
bnei_cont.19382:
	j	bnei_cont.19380
bnei_else.19379:
	add	%a0, %zero, %a1
bnei_cont.19380:
	beqi	%a0, 0, bnei_else.19383
	addi	%v0, %zero, 0
	j	bnei_cont.19384
bnei_else.19383:
	addi	%v0, %zero, 1
bnei_cont.19384:
bnei_cont.19366:
	j	bnei_cont.19364
bnei_else.19363:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.19385
	addi	%a1, %zero, 0
	j	fbgt_cont.19386
fbgt_else.19385:
	addi	%a1, %zero, 1
fbgt_cont.19386:
	beqi	%a1, 0, bnei_else.19387
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.19389
	addi	%a1, %zero, 0
	j	fbgt_cont.19390
fbgt_else.19389:
	addi	%a1, %zero, 1
fbgt_cont.19390:
	beqi	%a1, 0, bnei_else.19391
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.19393
	addi	%a1, %zero, 0
	j	fbgt_cont.19394
fbgt_else.19393:
	addi	%a1, %zero, 1
fbgt_cont.19394:
	j	bnei_cont.19392
bnei_else.19391:
	addi	%a1, %zero, 0
bnei_cont.19392:
	j	bnei_cont.19388
bnei_else.19387:
	addi	%a1, %zero, 0
bnei_cont.19388:
	beqi	%a1, 0, bnei_else.19395
	lw	%a0, 6(%a0)
	add	%v0, %zero, %a0
	j	bnei_cont.19396
bnei_else.19395:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.19397
	addi	%v0, %zero, 0
	j	bnei_cont.19398
bnei_else.19397:
	addi	%v0, %zero, 1
bnei_cont.19398:
bnei_cont.19396:
bnei_cont.19364:
	beqi	%v0, 0, bnei_else.19399
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19399:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19400
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
	jal	is_outside.2902
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.19401
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19401:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2907
bnei_else.19400:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19362:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2913:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19402
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	flw	%f0, 138(%zero)
	lw	%a2, 5(%a1)
	flw	%f1, 0(%a2)
	fsub	%f1, %f0, %f1
	addi	%a2, %zero, 1
	flw	%f2, 139(%zero)
	lw	%a3, 5(%a1)
	flw	%f3, 1(%a3)
	fsub	%f3, %f2, %f3
	flw	%f4, 140(%zero)
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
	beqi	%a3, 1, bnei_else.19403
	beqi	%a3, 2, bnei_else.19405
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast.2841
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19406
bnei_else.19405:
	flw	%f6, 0(%a0)
	flw	%f7, 467(%zero)
	fblt	%f6, %f7, fbgt_else.19407
	addi	%a3, %zero, 0
	j	fbgt_cont.19408
fbgt_else.19407:
	addi	%a3, %zero, 1
fbgt_cont.19408:
	beqi	%a3, 0, bnei_else.19409
	flw	%f6, 1(%a0)
	fmul	%f1, %f6, %f1
	flw	%f6, 2(%a0)
	fmul	%f3, %f6, %f3
	fadd	%f1, %f1, %f3
	flw	%f3, 3(%a0)
	fmul	%f3, %f3, %f5
	fadd	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19410
bnei_else.19409:
	addi	%v0, %zero, 0
bnei_cont.19410:
bnei_cont.19406:
	j	bnei_cont.19404
bnei_else.19403:
	addi	%a3, %zero, 184
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2828
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19404:
	flw	%f0, 135(%zero)
	beqi	%v0, 0, bnei_else.19411
	flw	%f1, 462(%zero)
	fblt	%f0, %f1, fbgt_else.19413
	addi	%v0, %zero, 0
	j	fbgt_cont.19414
fbgt_else.19413:
	addi	%v0, %zero, 1
fbgt_cont.19414:
	j	bnei_cont.19412
bnei_else.19411:
	addi	%v0, %zero, 0
bnei_cont.19412:
	beqi	%v0, 0, bnei_else.19415
	flw	%f1, 461(%zero)
	fadd	%f0, %f0, %f1
	flw	%f1, 78(%zero)
	fmul	%f1, %f1, %f0
	flw	%f2, 3(%sp)
	fadd	%f1, %f1, %f2
	flw	%f2, 79(%zero)
	fmul	%f2, %f2, %f0
	flw	%f3, 2(%sp)
	fadd	%f2, %f2, %f3
	flw	%f3, 80(%zero)
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%sp)
	fadd	%f0, %f0, %f3
	lw	%v1, 4(%sp)
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.19416
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
	jal	is_outside.2902
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.19418
	addi	%v0, %zero, 0
	j	bnei_cont.19419
bnei_else.19418:
	flw	%f0, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 7(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 4(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	check_all_inside.2907
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19419:
	j	bnei_cont.19417
bnei_else.19416:
	addi	%v0, %zero, 1
bnei_cont.19417:
	beqi	%v0, 0, bnei_else.19420
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19420:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2913
bnei_else.19415:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19421
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2913
bnei_else.19421:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19402:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2916:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19422
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
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.19423
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19423:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19424
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19425
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19425:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19426
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.19427
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19427:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19428
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.19429
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19429:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2916
bnei_else.19428:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19426:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19424:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19422:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.19430
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.19431
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	flw	%f0, 138(%zero)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%t0, 5(%a3)
	flw	%f2, 1(%t0)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%t0, 5(%a3)
	flw	%f3, 2(%t0)
	fsub	%f2, %f2, %f3
	addi	%t0, %zero, 187
	add	%at, %t0, %a2
	lw	%a2, 0(%at)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.19433
	beqi	%t0, 2, bnei_else.19435
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast.2841
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19436
bnei_else.19435:
	flw	%f3, 0(%a2)
	flw	%f4, 467(%zero)
	fblt	%f3, %f4, fbgt_else.19437
	addi	%a3, %zero, 0
	j	fbgt_cont.19438
fbgt_else.19437:
	addi	%a3, %zero, 1
fbgt_cont.19438:
	beqi	%a3, 0, bnei_else.19439
	flw	%f3, 1(%a2)
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a2)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19440
bnei_else.19439:
	addi	%v0, %zero, 0
bnei_cont.19440:
bnei_cont.19436:
	j	bnei_cont.19434
bnei_else.19433:
	addi	%t0, %zero, 184
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2828
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19434:
	beqi	%v0, 0, bnei_else.19441
	flw	%f0, 135(%zero)
	flw	%f1, 460(%zero)
	fblt	%f0, %f1, fbgt_else.19443
	addi	%v0, %zero, 0
	j	fbgt_cont.19444
fbgt_else.19443:
	addi	%v0, %zero, 1
fbgt_cont.19444:
	beqi	%v0, 0, bnei_else.19445
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19447
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19449
	addi	%v0, %zero, 1
	j	bnei_cont.19450
bnei_else.19449:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19451
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19453
	addi	%v0, %zero, 1
	j	bnei_cont.19454
bnei_else.19453:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19455
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19457
	addi	%v0, %zero, 1
	j	bnei_cont.19458
bnei_else.19457:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19458:
	j	bnei_cont.19456
bnei_else.19455:
	addi	%v0, %zero, 0
bnei_cont.19456:
bnei_cont.19454:
	j	bnei_cont.19452
bnei_else.19451:
	addi	%v0, %zero, 0
bnei_cont.19452:
bnei_cont.19450:
	j	bnei_cont.19448
bnei_else.19447:
	addi	%v0, %zero, 0
bnei_cont.19448:
	beqi	%v0, 0, bnei_else.19459
	addi	%v0, %zero, 1
	j	bnei_cont.19460
bnei_else.19459:
	addi	%v0, %zero, 0
bnei_cont.19460:
	j	bnei_cont.19446
bnei_else.19445:
	addi	%v0, %zero, 0
bnei_cont.19446:
	j	bnei_cont.19442
bnei_else.19441:
	addi	%v0, %zero, 0
bnei_cont.19442:
	j	bnei_cont.19432
bnei_else.19431:
	addi	%v0, %zero, 1
bnei_cont.19432:
	beqi	%v0, 0, bnei_else.19461
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19462
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19464
	addi	%v0, %zero, 1
	j	bnei_cont.19465
bnei_else.19464:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19466
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19468
	addi	%v0, %zero, 1
	j	bnei_cont.19469
bnei_else.19468:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19470
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19472
	addi	%v0, %zero, 1
	j	bnei_cont.19473
bnei_else.19472:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19473:
	j	bnei_cont.19471
bnei_else.19470:
	addi	%v0, %zero, 0
bnei_cont.19471:
bnei_cont.19469:
	j	bnei_cont.19467
bnei_else.19466:
	addi	%v0, %zero, 0
bnei_cont.19467:
bnei_cont.19465:
	j	bnei_cont.19463
bnei_else.19462:
	addi	%v0, %zero, 0
bnei_cont.19463:
	beqi	%v0, 0, bnei_else.19474
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19474:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.19461:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.19430:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2922:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19475
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	addi	%a3, %zero, 0
	flw	%f0, 159(%zero)
	lw	%t0, 5(%a2)
	flw	%f1, 0(%t0)
	fsub	%f1, %f0, %f1
	addi	%t0, %zero, 1
	flw	%f2, 160(%zero)
	lw	%t1, 5(%a2)
	flw	%f3, 1(%t1)
	fsub	%f3, %f2, %f3
	addi	%t1, %zero, 2
	flw	%f4, 161(%zero)
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
	beqi	%t2, 1, bnei_else.19476
	beqi	%t2, 2, bnei_else.19478
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solver_second.2818
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.19479
bnei_else.19478:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solver_surface.2799
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19479:
	j	bnei_cont.19477
bnei_else.19476:
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
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19480
	addi	%v0, %zero, 1
	j	bnei_cont.19481
bnei_else.19480:
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
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19482
	addi	%v0, %zero, 2
	j	bnei_cont.19483
bnei_else.19482:
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
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19484
	addi	%v0, %zero, 3
	j	bnei_cont.19485
bnei_else.19484:
	addi	%v0, %zero, 0
bnei_cont.19485:
bnei_cont.19483:
bnei_cont.19481:
bnei_cont.19477:
	beqi	%v0, 0, bnei_else.19486
	flw	%f0, 135(%zero)
	flw	%f1, 467(%zero)
	fblt	%f1, %f0, fbgt_else.19487
	addi	%v1, %zero, 0
	j	fbgt_cont.19488
fbgt_else.19487:
	addi	%v1, %zero, 1
fbgt_cont.19488:
	beqi	%v1, 0, bnei_else.19489
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19491
	addi	%v1, %zero, 0
	j	fbgt_cont.19492
fbgt_else.19491:
	addi	%v1, %zero, 1
fbgt_cont.19492:
	beqi	%v1, 0, bnei_else.19493
	flw	%f1, 461(%zero)
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
	beqi	%a1, -1, bnei_else.19495
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%v0, %a1, 0
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	is_outside.2902
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	beqi	%v0, 0, bnei_else.19497
	addi	%v0, %zero, 0
	j	bnei_cont.19498
bnei_else.19497:
	flw	%f0, 17(%sp)
	flw	%f1, 16(%sp)
	flw	%f2, 15(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 6(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	check_all_inside.2907
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
bnei_cont.19498:
	j	bnei_cont.19496
bnei_else.19495:
	addi	%v0, %zero, 1
bnei_cont.19496:
	beqi	%v0, 0, bnei_else.19499
	flw	%f0, 18(%sp)
	fsw	%f0, 137(%zero)
	flw	%f0, 17(%sp)
	fsw	%f0, 138(%zero)
	flw	%f0, 16(%sp)
	fsw	%f0, 139(%zero)
	flw	%f0, 15(%sp)
	fsw	%f0, 140(%zero)
	lw	%v0, 0(%sp)
	sw	%v0, 141(%zero)
	lw	%v0, 14(%sp)
	sw	%v0, 136(%zero)
	j	bnei_cont.19500
bnei_else.19499:
bnei_cont.19500:
	j	bnei_cont.19494
bnei_else.19493:
bnei_cont.19494:
	j	bnei_cont.19490
bnei_else.19489:
bnei_cont.19490:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2922
bnei_else.19486:
	lw	%v0, 8(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19501
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2922
bnei_else.19501:
	jr	%ra
bnei_else.19475:
	jr	%ra
solve_one_or_network.2926:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19504
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
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19505
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
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19506
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
	jal	solve_each_element.2922
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19507
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
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19508
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
	jal	solve_each_element.2922
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19509
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
	jal	solve_each_element.2922
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19510
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
	jal	solve_each_element.2922
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19511
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
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.2926
bnei_else.19511:
	jr	%ra
bnei_else.19510:
	jr	%ra
bnei_else.19509:
	jr	%ra
bnei_else.19508:
	jr	%ra
bnei_else.19507:
	jr	%ra
bnei_else.19506:
	jr	%ra
bnei_else.19505:
	jr	%ra
bnei_else.19504:
	jr	%ra
trace_or_matrix.2930:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.19520
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.19521
	addi	%t0, %zero, 12
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	flw	%f0, 159(%zero)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	addi	%t0, %zero, 1
	flw	%f1, 160(%zero)
	lw	%t1, 5(%a3)
	flw	%f2, 1(%t1)
	fsub	%f1, %f1, %f2
	addi	%t1, %zero, 2
	flw	%f2, 161(%zero)
	lw	%t2, 5(%a3)
	flw	%f3, 2(%t2)
	fsub	%f2, %f2, %f3
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.19523
	beqi	%t2, 2, bnei_else.19525
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second.2818
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19526
bnei_else.19525:
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_surface.2799
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19526:
	j	bnei_cont.19524
bnei_else.19523:
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
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19527
	addi	%v0, %zero, 1
	j	bnei_cont.19528
bnei_else.19527:
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
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19529
	addi	%v0, %zero, 2
	j	bnei_cont.19530
bnei_else.19529:
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
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19531
	addi	%v0, %zero, 3
	j	bnei_cont.19532
bnei_else.19531:
	addi	%v0, %zero, 0
bnei_cont.19532:
bnei_cont.19530:
bnei_cont.19528:
bnei_cont.19524:
	beqi	%v0, 0, bnei_else.19533
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19535
	addi	%v0, %zero, 0
	j	fbgt_cont.19536
fbgt_else.19535:
	addi	%v0, %zero, 1
fbgt_cont.19536:
	beqi	%v0, 0, bnei_else.19537
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19539
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19541
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19543
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19545
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19547
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19549
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19551
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.19552
bnei_else.19551:
bnei_cont.19552:
	j	bnei_cont.19550
bnei_else.19549:
bnei_cont.19550:
	j	bnei_cont.19548
bnei_else.19547:
bnei_cont.19548:
	j	bnei_cont.19546
bnei_else.19545:
bnei_cont.19546:
	j	bnei_cont.19544
bnei_else.19543:
bnei_cont.19544:
	j	bnei_cont.19542
bnei_else.19541:
bnei_cont.19542:
	j	bnei_cont.19540
bnei_else.19539:
bnei_cont.19540:
	j	bnei_cont.19538
bnei_else.19537:
bnei_cont.19538:
	j	bnei_cont.19534
bnei_else.19533:
bnei_cont.19534:
	j	bnei_cont.19522
bnei_else.19521:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.19553
	addi	%t0, %zero, 83
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19555
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19557
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19559
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19561
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19563
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19565
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.19566
bnei_else.19565:
bnei_cont.19566:
	j	bnei_cont.19564
bnei_else.19563:
bnei_cont.19564:
	j	bnei_cont.19562
bnei_else.19561:
bnei_cont.19562:
	j	bnei_cont.19560
bnei_else.19559:
bnei_cont.19560:
	j	bnei_cont.19558
bnei_else.19557:
bnei_cont.19558:
	j	bnei_cont.19556
bnei_else.19555:
bnei_cont.19556:
	j	bnei_cont.19554
bnei_else.19553:
bnei_cont.19554:
bnei_cont.19522:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.19567
	sw	%v0, 11(%sp)
	beqi	%a1, 99, bnei_else.19568
	addi	%a2, %zero, 159
	lw	%a3, 0(%sp)
	sw	%a0, 12(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solver.2824
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.19570
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19572
	addi	%v0, %zero, 0
	j	fbgt_cont.19573
fbgt_else.19572:
	addi	%v0, %zero, 1
fbgt_cont.19573:
	beqi	%v0, 0, bnei_else.19574
	lw	%v0, 12(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19576
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19578
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19580
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19582
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19584
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19586
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 12(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.19587
bnei_else.19586:
bnei_cont.19587:
	j	bnei_cont.19585
bnei_else.19584:
bnei_cont.19585:
	j	bnei_cont.19583
bnei_else.19582:
bnei_cont.19583:
	j	bnei_cont.19581
bnei_else.19580:
bnei_cont.19581:
	j	bnei_cont.19579
bnei_else.19578:
bnei_cont.19579:
	j	bnei_cont.19577
bnei_else.19576:
bnei_cont.19577:
	j	bnei_cont.19575
bnei_else.19574:
bnei_cont.19575:
	j	bnei_cont.19571
bnei_else.19570:
bnei_cont.19571:
	j	bnei_cont.19569
bnei_else.19568:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.19588
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
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19590
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19592
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19594
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19596
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19598
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2922
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 12(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.19599
bnei_else.19598:
bnei_cont.19599:
	j	bnei_cont.19597
bnei_else.19596:
bnei_cont.19597:
	j	bnei_cont.19595
bnei_else.19594:
bnei_cont.19595:
	j	bnei_cont.19593
bnei_else.19592:
bnei_cont.19593:
	j	bnei_cont.19591
bnei_else.19590:
bnei_cont.19591:
	j	bnei_cont.19589
bnei_else.19588:
bnei_cont.19589:
bnei_cont.19569:
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2930
bnei_else.19567:
	jr	%ra
bnei_else.19520:
	jr	%ra
solve_each_element_fast.2936:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.19602
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
	beqi	%t3, 1, bnei_else.19603
	beqi	%t3, 2, bnei_else.19605
	addi	%a0, %t0, 0
	addi	%v1, %t2, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast2.2858
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19606
bnei_else.19605:
	flw	%f0, 0(%t2)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19607
	addi	%t2, %zero, 0
	j	fbgt_cont.19608
fbgt_else.19607:
	addi	%t2, %zero, 1
fbgt_cont.19608:
	beqi	%t2, 0, bnei_else.19609
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19610
bnei_else.19609:
	addi	%v0, %zero, 0
bnei_cont.19610:
bnei_cont.19606:
	j	bnei_cont.19604
bnei_else.19603:
	lw	%t0, 0(%a0)
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2828
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19604:
	beqi	%v0, 0, bnei_else.19611
	flw	%f0, 135(%zero)
	flw	%f1, 467(%zero)
	fblt	%f1, %f0, fbgt_else.19612
	addi	%v1, %zero, 0
	j	fbgt_cont.19613
fbgt_else.19612:
	addi	%v1, %zero, 1
fbgt_cont.19613:
	beqi	%v1, 0, bnei_else.19614
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19616
	addi	%v1, %zero, 0
	j	fbgt_cont.19617
fbgt_else.19616:
	addi	%v1, %zero, 1
fbgt_cont.19617:
	beqi	%v1, 0, bnei_else.19618
	flw	%f1, 461(%zero)
	fadd	%f0, %f0, %f1
	lw	%v1, 2(%sp)
	flw	%f1, 0(%v1)
	fmul	%f1, %f1, %f0
	flw	%f2, 162(%zero)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v1)
	fmul	%f2, %f2, %f0
	flw	%f3, 163(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v1)
	fmul	%f3, %f3, %f0
	flw	%f4, 164(%zero)
	fadd	%f3, %f3, %f4
	lw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	sw	%v0, 7(%sp)
	fsw	%f3, 8(%sp)
	fsw	%f2, 9(%sp)
	fsw	%f1, 10(%sp)
	fsw	%f0, 11(%sp)
	beqi	%a0, -1, bnei_else.19620
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%v0, %a0, 0
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	is_outside.2902
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.19622
	addi	%v0, %zero, 0
	j	bnei_cont.19623
bnei_else.19622:
	flw	%f0, 10(%sp)
	flw	%f1, 9(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	check_all_inside.2907
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.19623:
	j	bnei_cont.19621
bnei_else.19620:
	addi	%v0, %zero, 1
bnei_cont.19621:
	beqi	%v0, 0, bnei_else.19624
	flw	%f0, 11(%sp)
	fsw	%f0, 137(%zero)
	flw	%f0, 10(%sp)
	fsw	%f0, 138(%zero)
	flw	%f0, 9(%sp)
	fsw	%f0, 139(%zero)
	flw	%f0, 8(%sp)
	fsw	%f0, 140(%zero)
	lw	%v0, 0(%sp)
	sw	%v0, 141(%zero)
	lw	%v0, 7(%sp)
	sw	%v0, 136(%zero)
	j	bnei_cont.19625
bnei_else.19624:
bnei_cont.19625:
	j	bnei_cont.19619
bnei_else.19618:
bnei_cont.19619:
	j	bnei_cont.19615
bnei_else.19614:
bnei_cont.19615:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2936
bnei_else.19611:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19626
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2936
bnei_else.19626:
	jr	%ra
bnei_else.19602:
	jr	%ra
solve_one_or_network_fast.2940:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19629
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19630
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19631
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19632
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19633
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19634
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19635
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19636
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.2940
bnei_else.19636:
	jr	%ra
bnei_else.19635:
	jr	%ra
bnei_else.19634:
	jr	%ra
bnei_else.19633:
	jr	%ra
bnei_else.19632:
	jr	%ra
bnei_else.19631:
	jr	%ra
bnei_else.19630:
	jr	%ra
bnei_else.19629:
	jr	%ra
trace_or_matrix_fast.2944:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.19645
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.19646
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
	beqi	%t2, 1, bnei_else.19648
	beqi	%t2, 2, bnei_else.19650
	addi	%a0, %t1, 0
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second_fast2.2858
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19651
bnei_else.19650:
	flw	%f0, 0(%a3)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19652
	addi	%a3, %zero, 0
	j	fbgt_cont.19653
fbgt_else.19652:
	addi	%a3, %zero, 1
fbgt_cont.19653:
	beqi	%a3, 0, bnei_else.19654
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19655
bnei_else.19654:
	addi	%v0, %zero, 0
bnei_cont.19655:
bnei_cont.19651:
	j	bnei_cont.19649
bnei_else.19648:
	lw	%t1, 0(%a0)
	addi	%a0, %a3, 0
	addi	%v1, %t1, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_fast.2828
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19649:
	beqi	%v0, 0, bnei_else.19656
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19658
	addi	%v0, %zero, 0
	j	fbgt_cont.19659
fbgt_else.19658:
	addi	%v0, %zero, 1
fbgt_cont.19659:
	beqi	%v0, 0, bnei_else.19660
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19662
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19664
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19666
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19668
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19670
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19672
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19674
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19675
bnei_else.19674:
bnei_cont.19675:
	j	bnei_cont.19673
bnei_else.19672:
bnei_cont.19673:
	j	bnei_cont.19671
bnei_else.19670:
bnei_cont.19671:
	j	bnei_cont.19669
bnei_else.19668:
bnei_cont.19669:
	j	bnei_cont.19667
bnei_else.19666:
bnei_cont.19667:
	j	bnei_cont.19665
bnei_else.19664:
bnei_cont.19665:
	j	bnei_cont.19663
bnei_else.19662:
bnei_cont.19663:
	j	bnei_cont.19661
bnei_else.19660:
bnei_cont.19661:
	j	bnei_cont.19657
bnei_else.19656:
bnei_cont.19657:
	j	bnei_cont.19647
bnei_else.19646:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.19676
	addi	%t0, %zero, 83
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19678
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19680
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19682
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19684
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19686
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19688
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19689
bnei_else.19688:
bnei_cont.19689:
	j	bnei_cont.19687
bnei_else.19686:
bnei_cont.19687:
	j	bnei_cont.19685
bnei_else.19684:
bnei_cont.19685:
	j	bnei_cont.19683
bnei_else.19682:
bnei_cont.19683:
	j	bnei_cont.19681
bnei_else.19680:
bnei_cont.19681:
	j	bnei_cont.19679
bnei_else.19678:
bnei_cont.19679:
	j	bnei_cont.19677
bnei_else.19676:
bnei_cont.19677:
bnei_cont.19647:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.19690
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.19691
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
	beqi	%t1, 1, bnei_else.19693
	beqi	%t1, 2, bnei_else.19695
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast2.2858
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19696
bnei_else.19695:
	flw	%f0, 0(%a1)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19697
	addi	%a1, %zero, 0
	j	fbgt_cont.19698
fbgt_else.19697:
	addi	%a1, %zero, 1
fbgt_cont.19698:
	beqi	%a1, 0, bnei_else.19699
	flw	%f1, 3(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19700
bnei_else.19699:
	addi	%v0, %zero, 0
bnei_cont.19700:
bnei_cont.19696:
	j	bnei_cont.19694
bnei_else.19693:
	lw	%a3, 0(%t0)
	addi	%a0, %a1, 0
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2828
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19694:
	beqi	%v0, 0, bnei_else.19701
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19703
	addi	%v0, %zero, 0
	j	fbgt_cont.19704
fbgt_else.19703:
	addi	%v0, %zero, 1
fbgt_cont.19704:
	beqi	%v0, 0, bnei_else.19705
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19707
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19709
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19711
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19713
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19715
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19717
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19718
bnei_else.19717:
bnei_cont.19718:
	j	bnei_cont.19716
bnei_else.19715:
bnei_cont.19716:
	j	bnei_cont.19714
bnei_else.19713:
bnei_cont.19714:
	j	bnei_cont.19712
bnei_else.19711:
bnei_cont.19712:
	j	bnei_cont.19710
bnei_else.19709:
bnei_cont.19710:
	j	bnei_cont.19708
bnei_else.19707:
bnei_cont.19708:
	j	bnei_cont.19706
bnei_else.19705:
bnei_cont.19706:
	j	bnei_cont.19702
bnei_else.19701:
bnei_cont.19702:
	j	bnei_cont.19692
bnei_else.19691:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.19719
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19721
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19723
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19725
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19727
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19729
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19730
bnei_else.19729:
bnei_cont.19730:
	j	bnei_cont.19728
bnei_else.19727:
bnei_cont.19728:
	j	bnei_cont.19726
bnei_else.19725:
bnei_cont.19726:
	j	bnei_cont.19724
bnei_else.19723:
bnei_cont.19724:
	j	bnei_cont.19722
bnei_else.19721:
bnei_cont.19722:
	j	bnei_cont.19720
bnei_else.19719:
bnei_cont.19720:
bnei_cont.19692:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2944
bnei_else.19690:
	jr	%ra
bnei_else.19645:
	jr	%ra
judge_intersection_fast.2948:
	addi	%v1, %zero, 0
	flw	%f0, 459(%zero)
	fsw	%f0, 137(%zero)
	lw	%a0, 134(%zero)
	lw	%a1, 0(%a0)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.19733
	sw	%v0, 0(%sp)
	sw	%a0, 1(%sp)
	beqi	%a2, 99, bnei_else.19735
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
	beqi	%t1, 1, bnei_else.19737
	beqi	%t1, 2, bnei_else.19739
	addi	%a0, %t0, 0
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast2.2858
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19740
bnei_else.19739:
	flw	%f0, 0(%a2)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19741
	addi	%a2, %zero, 0
	j	fbgt_cont.19742
fbgt_else.19741:
	addi	%a2, %zero, 1
fbgt_cont.19742:
	beqi	%a2, 0, bnei_else.19743
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19744
bnei_else.19743:
	addi	%v0, %zero, 0
bnei_cont.19744:
bnei_cont.19740:
	j	bnei_cont.19738
bnei_else.19737:
	lw	%t0, 0(%v0)
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2828
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19738:
	beqi	%v0, 0, bnei_else.19745
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19747
	addi	%v0, %zero, 0
	j	fbgt_cont.19748
fbgt_else.19747:
	addi	%v0, %zero, 1
fbgt_cont.19748:
	beqi	%v0, 0, bnei_else.19749
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19751
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19753
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19755
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19757
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19759
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19761
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19762
bnei_else.19761:
bnei_cont.19762:
	j	bnei_cont.19760
bnei_else.19759:
bnei_cont.19760:
	j	bnei_cont.19758
bnei_else.19757:
bnei_cont.19758:
	j	bnei_cont.19756
bnei_else.19755:
bnei_cont.19756:
	j	bnei_cont.19754
bnei_else.19753:
bnei_cont.19754:
	j	bnei_cont.19752
bnei_else.19751:
bnei_cont.19752:
	j	bnei_cont.19750
bnei_else.19749:
bnei_cont.19750:
	j	bnei_cont.19746
bnei_else.19745:
bnei_cont.19746:
	j	bnei_cont.19736
bnei_else.19735:
	lw	%a2, 1(%a1)
	beqi	%a2, -1, bnei_else.19763
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
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19765
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19767
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19769
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19771
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19773
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19774
bnei_else.19773:
bnei_cont.19774:
	j	bnei_cont.19772
bnei_else.19771:
bnei_cont.19772:
	j	bnei_cont.19770
bnei_else.19769:
bnei_cont.19770:
	j	bnei_cont.19768
bnei_else.19767:
bnei_cont.19768:
	j	bnei_cont.19766
bnei_else.19765:
bnei_cont.19766:
	j	bnei_cont.19764
bnei_else.19763:
bnei_cont.19764:
bnei_cont.19736:
	addi	%v0, %zero, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19734
bnei_else.19733:
bnei_cont.19734:
	flw	%f0, 137(%zero)
	flw	%f1, 460(%zero)
	fblt	%f1, %f0, fbgt_else.19775
	addi	%v0, %zero, 0
	j	fbgt_cont.19776
fbgt_else.19775:
	addi	%v0, %zero, 1
fbgt_cont.19776:
	beqi	%v0, 0, bnei_else.19777
	flw	%f1, 458(%zero)
	fblt	%f0, %f1, fbgt_else.19778
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.19778:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19777:
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_second.2954:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
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
	beqi	%v1, 0, bnei_else.19779
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 470(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.19780
bnei_else.19779:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.19780:
	lw	%v1, 6(%v0)
	addi	%v0, %zero, 142
	j	vecunit_sgn.2662
utexture.2959:
	lw	%a0, 0(%v0)
	lw	%a1, 8(%v0)
	flw	%f0, 0(%a1)
	fsw	%f0, 145(%zero)
	lw	%a1, 8(%v0)
	flw	%f0, 1(%a1)
	fsw	%f0, 146(%zero)
	lw	%a1, 8(%v0)
	flw	%f0, 2(%a1)
	fsw	%f0, 147(%zero)
	beqi	%a0, 1, bnei_else.19781
	beqi	%a0, 2, bnei_else.19782
	beqi	%a0, 3, bnei_else.19783
	beqi	%a0, 4, bnei_else.19784
	jr	%ra
bnei_else.19784:
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
	flw	%f4, 457(%zero)
	fblt	%f3, %f4, fbgt_else.19786
	addi	%a0, %zero, 0
	j	fbgt_cont.19787
fbgt_else.19786:
	addi	%a0, %zero, 1
fbgt_cont.19787:
	fsw	%f4, 0(%sp)
	fsw	%f2, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.19788
	flw	%f0, 456(%zero)
	j	bnei_cont.19789
bnei_else.19788:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19790
	addi	%a0, %zero, 1
	j	fbgt_cont.19791
fbgt_else.19790:
	addi	%a0, %zero, 0
fbgt_cont.19791:
	fabs	%f1, %f0
	flw	%f3, 455(%zero)
	fblt	%f1, %f3, fbgt_else.19792
	flw	%f0, 454(%zero)
	sw	%a0, 4(%sp)
	fblt	%f1, %f0, fbgt_else.19794
	flw	%f0, 476(%zero)
	flw	%f3, 471(%zero)
	fdiv	%f1, %f3, %f1
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	kernel_atan.2612
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19795
fbgt_else.19794:
	flw	%f0, 475(%zero)
	flw	%f3, 471(%zero)
	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f5, %f1
	fsw	%f0, 6(%sp)
	fmov	%f0, %f1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	kernel_atan.2612
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.19795:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.19796
	j	bnei_cont.19797
bnei_else.19796:
	fneg	%f0, %f0
bnei_cont.19797:
	j	fbgt_cont.19793
fbgt_else.19792:
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	kernel_atan.2612
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
fbgt_cont.19793:
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.19789:
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
	fblt	%f3, %f4, fbgt_else.19798
	addi	%v0, %zero, 0
	j	fbgt_cont.19799
fbgt_else.19798:
	addi	%v0, %zero, 1
fbgt_cont.19799:
	fsw	%f0, 7(%sp)
	beqi	%v0, 0, bnei_else.19800
	flw	%f0, 456(%zero)
	j	bnei_cont.19801
bnei_else.19800:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 467(%zero)
	fblt	%f1, %f2, fbgt_else.19802
	addi	%v0, %zero, 1
	j	fbgt_cont.19803
fbgt_else.19802:
	addi	%v0, %zero, 0
fbgt_cont.19803:
	fabs	%f2, %f1
	flw	%f3, 455(%zero)
	fblt	%f2, %f3, fbgt_else.19804
	flw	%f1, 454(%zero)
	sw	%v0, 8(%sp)
	fblt	%f2, %f1, fbgt_else.19806
	flw	%f1, 476(%zero)
	flw	%f3, 471(%zero)
	fdiv	%f2, %f3, %f2
	fsw	%f1, 9(%sp)
	fmov	%f0, %f2
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	kernel_atan.2612
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19807
fbgt_else.19806:
	flw	%f1, 475(%zero)
	flw	%f3, 471(%zero)
	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3
	fdiv	%f2, %f4, %f2
	fsw	%f1, 10(%sp)
	fmov	%f0, %f2
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	kernel_atan.2612
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.19807:
	lw	%v0, 8(%sp)
	beqi	%v0, 0, bnei_else.19808
	j	bnei_cont.19809
bnei_else.19808:
	fneg	%f0, %f0
bnei_cont.19809:
	j	fbgt_cont.19805
fbgt_else.19804:
	fmov	%f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	kernel_atan.2612
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
fbgt_cont.19805:
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.19801:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 451(%zero)
	flw	%f2, 470(%zero)
	flw	%f3, 7(%sp)
	fsub	%f3, %f2, %f3
	fmul	%f3, %f3, %f3
	fsub	%f1, %f1, %f3
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19810
	addi	%v0, %zero, 0
	j	fbgt_cont.19811
fbgt_else.19810:
	addi	%v0, %zero, 1
fbgt_cont.19811:
	beqi	%v0, 0, bnei_else.19812
	fmov	%f0, %f1
	j	bnei_cont.19813
bnei_else.19812:
bnei_cont.19813:
	flw	%f1, 450(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.19783:
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
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	cos.2623
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 471(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.19782:
	flw	%f0, 1(%v1)
	flw	%f1, 447(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	sin.2625
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 471(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.19781:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	flw	%f1, 0(%a0)
	fsub	%f0, %f0, %f1
	flw	%f1, 446(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 445(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.19817
	addi	%a0, %zero, 0
	j	fbgt_cont.19818
fbgt_else.19817:
	addi	%a0, %zero, 1
fbgt_cont.19818:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f4, 2(%v0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.19819
	addi	%v0, %zero, 0
	j	fbgt_cont.19820
fbgt_else.19819:
	addi	%v0, %zero, 1
fbgt_cont.19820:
	beqi	%a0, 0, bnei_else.19821
	beqi	%v0, 0, bnei_else.19823
	flw	%f0, 450(%zero)
	j	bnei_cont.19824
bnei_else.19823:
	flw	%f0, 467(%zero)
bnei_cont.19824:
	j	bnei_cont.19822
bnei_else.19821:
	beqi	%v0, 0, bnei_else.19825
	flw	%f0, 467(%zero)
	j	bnei_cont.19826
bnei_else.19825:
	flw	%f0, 450(%zero)
bnei_cont.19826:
bnei_cont.19822:
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2966:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.19828
	addi	%a1, %zero, 254
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 1(%a1)
	flw	%f2, 459(%zero)
	fsw	%f2, 137(%zero)
	lw	%a3, 134(%zero)
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 460(%zero)
	fblt	%f1, %f0, fbgt_else.19829
	addi	%v0, %zero, 0
	j	fbgt_cont.19830
fbgt_else.19829:
	addi	%v0, %zero, 1
fbgt_cont.19830:
	beqi	%v0, 0, bnei_else.19831
	flw	%f1, 458(%zero)
	fblt	%f0, %f1, fbgt_else.19833
	addi	%v0, %zero, 0
	j	fbgt_cont.19834
fbgt_else.19833:
	addi	%v0, %zero, 1
fbgt_cont.19834:
	j	bnei_cont.19832
bnei_else.19831:
	addi	%v0, %zero, 0
bnei_cont.19832:
	beqi	%v0, 0, bnei_else.19835
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.19837
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19839
	j	bnei_cont.19840
bnei_else.19839:
	lw	%v0, 4(%sp)
	lw	%v1, 0(%v0)
	flw	%f0, 142(%zero)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
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
	flw	%f3, 467(%zero)
	fblt	%f3, %f0, fbgt_else.19841
	addi	%v0, %zero, 0
	j	fbgt_cont.19842
fbgt_else.19841:
	addi	%v0, %zero, 1
fbgt_cont.19842:
	beqi	%v0, 0, bnei_else.19843
	flw	%f4, 151(%zero)
	flw	%f5, 145(%zero)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	fsw	%f4, 151(%zero)
	flw	%f4, 152(%zero)
	flw	%f5, 146(%zero)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	fsw	%f4, 152(%zero)
	flw	%f4, 153(%zero)
	flw	%f5, 147(%zero)
	fmul	%f0, %f0, %f5
	fadd	%f0, %f4, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.19844
bnei_else.19843:
bnei_cont.19844:
	fblt	%f3, %f1, fbgt_else.19845
	addi	%v0, %zero, 0
	j	fbgt_cont.19846
fbgt_else.19845:
	addi	%v0, %zero, 1
fbgt_cont.19846:
	beqi	%v0, 0, bnei_else.19847
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f0
	flw	%f1, 1(%sp)
	fmul	%f0, %f0, %f1
	flw	%f3, 151(%zero)
	fadd	%f3, %f3, %f0
	fsw	%f3, 151(%zero)
	flw	%f3, 152(%zero)
	fadd	%f3, %f3, %f0
	fsw	%f3, 152(%zero)
	flw	%f3, 153(%zero)
	fadd	%f0, %f3, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.19848
bnei_else.19847:
bnei_cont.19848:
bnei_cont.19840:
	j	beq_cont.19838
beq_else.19837:
beq_cont.19838:
	j	bnei_cont.19836
bnei_else.19835:
bnei_cont.19836:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2966
bgti_else.19828:
	jr	%ra
trace_ray.2971:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.19850
	lw	%a1, 2(%a0)
	addi	%a2, %zero, 0
	flw	%f2, 459(%zero)
	fsw	%f2, 137(%zero)
	lw	%a3, 134(%zero)
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
	jal	trace_or_matrix.2930
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 460(%zero)
	fblt	%f1, %f0, fbgt_else.19851
	addi	%v0, %zero, 0
	j	fbgt_cont.19852
fbgt_else.19851:
	addi	%v0, %zero, 1
fbgt_cont.19852:
	beqi	%v0, 0, bnei_else.19853
	flw	%f1, 458(%zero)
	fblt	%f0, %f1, fbgt_else.19855
	addi	%v0, %zero, 0
	j	fbgt_cont.19856
fbgt_else.19855:
	addi	%v0, %zero, 1
fbgt_cont.19856:
	j	bnei_cont.19854
bnei_else.19853:
	addi	%v0, %zero, 0
bnei_cont.19854:
	beqi	%v0, 0, bnei_else.19857
	lw	%v0, 141(%zero)
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
	beqi	%a1, 1, bnei_else.19858
	beqi	%a1, 2, bnei_else.19860
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	get_nvector_second.2954
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.19861
bnei_else.19860:
	lw	%a1, 4(%v1)
	flw	%f3, 0(%a1)
	fneg	%f3, %f3
	fsw	%f3, 142(%zero)
	lw	%a1, 4(%v1)
	flw	%f3, 1(%a1)
	fneg	%f3, %f3
	fsw	%f3, 143(%zero)
	lw	%a1, 4(%v1)
	flw	%f3, 2(%a1)
	fneg	%f3, %f3
	fsw	%f3, 144(%zero)
bnei_cont.19861:
	j	bnei_cont.19859
bnei_else.19858:
	lw	%a1, 136(%zero)
	flw	%f3, 467(%zero)
	fsw	%f3, 142(%zero)
	fsw	%f3, 143(%zero)
	fsw	%f3, 144(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.19862
	addi	%t0, %zero, 1
	j	fbeq_cont.19863
fbeq_else.19862:
	addi	%t0, %zero, 0
fbeq_cont.19863:
	beqi	%t0, 0, bnei_else.19864
	j	bnei_cont.19865
bnei_else.19864:
	fblt	%f3, %f4, fbgt_else.19866
	addi	%t0, %zero, 0
	j	fbgt_cont.19867
fbgt_else.19866:
	addi	%t0, %zero, 1
fbgt_cont.19867:
	beqi	%t0, 0, bnei_else.19868
	flw	%f3, 471(%zero)
	j	bnei_cont.19869
bnei_else.19868:
	flw	%f3, 466(%zero)
bnei_cont.19869:
bnei_cont.19865:
	fneg	%f3, %f3
	addi	%t0, %zero, 142
	add	%at, %t0, %a1
	fsw	%f3, 0(%at)
bnei_cont.19859:
	flw	%f0, 138(%zero)
	fsw	%f0, 159(%zero)
	flw	%f1, 139(%zero)
	fsw	%f1, 160(%zero)
	flw	%f2, 140(%zero)
	fsw	%f2, 161(%zero)
	addi	%v1, %zero, 138
	lw	%v0, 13(%sp)
	fsw	%f2, 14(%sp)
	fsw	%f1, 15(%sp)
	fsw	%f0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	utexture.2959
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 12(%sp)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
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
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.19870
	addi	%a3, %zero, 0
	j	fbgt_cont.19871
fbgt_else.19870:
	addi	%a3, %zero, 1
fbgt_cont.19871:
	beqi	%a3, 0, bnei_else.19872
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.19873
bnei_else.19872:
	lw	%a3, 11(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	lw	%a1, 4(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	flw	%f3, 145(%zero)
	fsw	%f3, 0(%a1)
	flw	%f3, 146(%zero)
	fsw	%f3, 1(%a1)
	flw	%f3, 147(%zero)
	fsw	%f3, 2(%a1)
	flw	%f3, 444(%zero)
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
	flw	%f3, 142(%zero)
	fsw	%f3, 0(%a1)
	flw	%f3, 143(%zero)
	fsw	%f3, 1(%a1)
	flw	%f3, 144(%zero)
	fsw	%f3, 2(%a1)
bnei_cont.19873:
	flw	%f3, 443(%zero)
	lw	%a1, 5(%sp)
	flw	%f4, 0(%a1)
	flw	%f5, 142(%zero)
	fmul	%f6, %f4, %f5
	flw	%f7, 1(%a1)
	flw	%f8, 143(%zero)
	fmul	%f9, %f7, %f8
	fadd	%f6, %f6, %f9
	flw	%f9, 2(%a1)
	flw	%f10, 144(%zero)
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
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	beqi	%v0, 0, bnei_else.19874
	j	bnei_cont.19875
bnei_else.19874:
	flw	%f0, 78(%zero)
	flw	%f1, 20(%sp)
	fmul	%f1, %f1, %f0
	flw	%f2, 79(%zero)
	flw	%f3, 19(%sp)
	fmul	%f3, %f3, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 80(%zero)
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
	flw	%f2, 467(%zero)
	fblt	%f2, %f1, fbgt_else.19876
	addi	%v1, %zero, 0
	j	fbgt_cont.19877
fbgt_else.19876:
	addi	%v1, %zero, 1
fbgt_cont.19877:
	beqi	%v1, 0, bnei_else.19878
	flw	%f3, 151(%zero)
	flw	%f5, 145(%zero)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	fsw	%f3, 151(%zero)
	flw	%f3, 152(%zero)
	flw	%f5, 146(%zero)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	fsw	%f3, 152(%zero)
	flw	%f3, 153(%zero)
	flw	%f5, 147(%zero)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
	fsw	%f1, 153(%zero)
	j	bnei_cont.19879
bnei_else.19878:
bnei_cont.19879:
	fblt	%f2, %f0, fbgt_else.19880
	addi	%v1, %zero, 0
	j	fbgt_cont.19881
fbgt_else.19880:
	addi	%v1, %zero, 1
fbgt_cont.19881:
	beqi	%v1, 0, bnei_else.19882
	fmul	%f0, %f0, %f0
	fmul	%f0, %f0, %f0
	flw	%f1, 17(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 151(%zero)
	fadd	%f2, %f2, %f0
	fsw	%f2, 151(%zero)
	flw	%f2, 152(%zero)
	fadd	%f2, %f2, %f0
	fsw	%f2, 152(%zero)
	flw	%f2, 153(%zero)
	fadd	%f0, %f2, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.19883
bnei_else.19882:
bnei_cont.19883:
bnei_cont.19875:
	flw	%f0, 16(%sp)
	fsw	%f0, 162(%zero)
	flw	%f0, 15(%sp)
	fsw	%f0, 163(%zero)
	flw	%f0, 14(%sp)
	fsw	%f0, 164(%zero)
	lw	%v0, 0(%zero)
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v0, 434(%zero)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 17(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_reflections.2966
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f0, 442(%zero)
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.19884
	addi	%v0, %zero, 0
	j	fbgt_cont.19885
fbgt_else.19884:
	addi	%v0, %zero, 1
fbgt_cont.19885:
	beqi	%v0, 0, bnei_else.19886
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.19887
	j	bgti_cont.19888
bgti_else.19887:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.19888:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.19889
	jr	%ra
bnei_else.19889:
	flw	%f0, 471(%zero)
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
	j	trace_ray.2971
bnei_else.19886:
	jr	%ra
bnei_else.19857:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.19892
	lw	%v0, 5(%sp)
	flw	%f0, 0(%v0)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 467(%zero)
	fblt	%f1, %f0, fbgt_else.19893
	addi	%v0, %zero, 0
	j	fbgt_cont.19894
fbgt_else.19893:
	addi	%v0, %zero, 1
fbgt_cont.19894:
	beqi	%v0, 0, bnei_else.19895
	fmul	%f1, %f0, %f0
	fmul	%f0, %f1, %f0
	flw	%f1, 4(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 81(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 151(%zero)
	fadd	%f1, %f1, %f0
	fsw	%f1, 151(%zero)
	flw	%f1, 152(%zero)
	fadd	%f1, %f1, %f0
	fsw	%f1, 152(%zero)
	flw	%f1, 153(%zero)
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.19895:
	jr	%ra
bnei_else.19892:
	jr	%ra
bgt_else.19850:
	jr	%ra
trace_diffuse_ray.2977:
	addi	%v1, %zero, 0
	flw	%f1, 459(%zero)
	fsw	%f1, 137(%zero)
	lw	%a0, 134(%zero)
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 460(%zero)
	fblt	%f1, %f0, fbgt_else.19900
	addi	%v0, %zero, 0
	j	fbgt_cont.19901
fbgt_else.19900:
	addi	%v0, %zero, 1
fbgt_cont.19901:
	beqi	%v0, 0, bnei_else.19902
	flw	%f1, 458(%zero)
	fblt	%f0, %f1, fbgt_else.19904
	addi	%v0, %zero, 0
	j	fbgt_cont.19905
fbgt_else.19904:
	addi	%v0, %zero, 1
fbgt_cont.19905:
	j	bnei_cont.19903
bnei_else.19902:
	addi	%v0, %zero, 0
bnei_cont.19903:
	beqi	%v0, 0, bnei_else.19906
	lw	%v0, 141(%zero)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 4(%sp)
	beqi	%a0, 1, bnei_else.19907
	beqi	%a0, 2, bnei_else.19909
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	get_nvector_second.2954
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19910
bnei_else.19909:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.19910:
	j	bnei_cont.19908
bnei_else.19907:
	lw	%a0, 136(%zero)
	flw	%f0, 467(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.19911
	addi	%v1, %zero, 1
	j	fbeq_cont.19912
fbeq_else.19911:
	addi	%v1, %zero, 0
fbeq_cont.19912:
	beqi	%v1, 0, bnei_else.19913
	j	bnei_cont.19914
bnei_else.19913:
	fblt	%f0, %f1, fbgt_else.19915
	addi	%v1, %zero, 0
	j	fbgt_cont.19916
fbgt_else.19915:
	addi	%v1, %zero, 1
fbgt_cont.19916:
	beqi	%v1, 0, bnei_else.19917
	flw	%f0, 471(%zero)
	j	bnei_cont.19918
bnei_else.19917:
	flw	%f0, 466(%zero)
bnei_cont.19918:
bnei_cont.19914:
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f0, 0(%at)
bnei_cont.19908:
	addi	%v1, %zero, 138
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	utexture.2959
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.19919
	jr	%ra
bnei_else.19919:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 467(%zero)
	fblt	%f1, %f0, fbgt_else.19921
	addi	%v0, %zero, 0
	j	fbgt_cont.19922
fbgt_else.19921:
	addi	%v0, %zero, 1
fbgt_cont.19922:
	beqi	%v0, 0, bnei_else.19923
	j	bnei_cont.19924
bnei_else.19923:
	fmov	%f0, %f1
bnei_cont.19924:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	jr	%ra
bnei_else.19906:
	jr	%ra
iter_trace_diffuse_rays.2980:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.19927
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
	flw	%f2, 467(%zero)
	fblt	%f0, %f2, fbgt_else.19928
	addi	%t0, %zero, 0
	j	fbgt_cont.19929
fbgt_else.19928:
	addi	%t0, %zero, 1
fbgt_cont.19929:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f4, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	beqi	%t0, 0, bnei_else.19930
	addi	%a3, %a1, 1
	add	%at, %v0, %a3
	lw	%a3, 0(%at)
	flw	%f5, 441(%zero)
	fdiv	%f0, %f0, %f5
	fsw	%f0, 8(%sp)
	sw	%a2, 9(%sp)
	sw	%a3, 10(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	judge_intersection_fast.2948
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19932
	lw	%v0, 141(%zero)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 10(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 11(%sp)
	beqi	%a0, 1, bnei_else.19934
	beqi	%a0, 2, bnei_else.19936
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	get_nvector_second.2954
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.19937
bnei_else.19936:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.19937:
	j	bnei_cont.19935
bnei_else.19934:
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.19938
	addi	%v1, %zero, 1
	j	fbeq_cont.19939
fbeq_else.19938:
	addi	%v1, %zero, 0
fbeq_cont.19939:
	beqi	%v1, 0, bnei_else.19940
	fmov	%f1, %f0
	j	bnei_cont.19941
bnei_else.19940:
	fblt	%f0, %f1, fbgt_else.19942
	addi	%v1, %zero, 0
	j	fbgt_cont.19943
fbgt_else.19942:
	addi	%v1, %zero, 1
fbgt_cont.19943:
	beqi	%v1, 0, bnei_else.19944
	flw	%f1, 471(%zero)
	j	bnei_cont.19945
bnei_else.19944:
	flw	%f1, 466(%zero)
bnei_cont.19945:
bnei_cont.19941:
	fneg	%f1, %f1
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f1, 0(%at)
bnei_cont.19935:
	addi	%v1, %zero, 138
	lw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	utexture.2959
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 134(%zero)
	lw	%v0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.19946
	j	bnei_cont.19947
bnei_else.19946:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 2(%sp)
	fblt	%f1, %f0, fbgt_else.19948
	addi	%v0, %zero, 0
	j	fbgt_cont.19949
fbgt_else.19948:
	addi	%v0, %zero, 1
fbgt_cont.19949:
	beqi	%v0, 0, bnei_else.19950
	j	bnei_cont.19951
bnei_else.19950:
	fmov	%f0, %f1
bnei_cont.19951:
	flw	%f2, 8(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 11(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)
	flw	%f3, 145(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 148(%zero)
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 149(%zero)
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	fsw	%f0, 150(%zero)
bnei_cont.19947:
	j	bnei_cont.19933
bnei_else.19932:
bnei_cont.19933:
	j	bnei_cont.19931
bnei_else.19930:
	flw	%f5, 440(%zero)
	fdiv	%f0, %f0, %f5
	fsw	%f0, 12(%sp)
	sw	%a2, 9(%sp)
	sw	%a3, 13(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	judge_intersection_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19952
	lw	%v0, 141(%zero)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 13(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 14(%sp)
	beqi	%a0, 1, bnei_else.19954
	beqi	%a0, 2, bnei_else.19956
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	get_nvector_second.2954
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.19957
bnei_else.19956:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.19957:
	j	bnei_cont.19955
bnei_else.19954:
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.19958
	addi	%v1, %zero, 1
	j	fbeq_cont.19959
fbeq_else.19958:
	addi	%v1, %zero, 0
fbeq_cont.19959:
	beqi	%v1, 0, bnei_else.19960
	fmov	%f1, %f0
	j	bnei_cont.19961
bnei_else.19960:
	fblt	%f0, %f1, fbgt_else.19962
	addi	%v1, %zero, 0
	j	fbgt_cont.19963
fbgt_else.19962:
	addi	%v1, %zero, 1
fbgt_cont.19963:
	beqi	%v1, 0, bnei_else.19964
	flw	%f1, 471(%zero)
	j	bnei_cont.19965
bnei_else.19964:
	flw	%f1, 466(%zero)
bnei_cont.19965:
bnei_cont.19961:
	fneg	%f1, %f1
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f1, 0(%at)
bnei_cont.19955:
	addi	%v1, %zero, 138
	lw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	utexture.2959
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 134(%zero)
	lw	%v0, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	beqi	%v0, 0, bnei_else.19966
	j	bnei_cont.19967
bnei_else.19966:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 2(%sp)
	fblt	%f1, %f0, fbgt_else.19968
	addi	%v0, %zero, 0
	j	fbgt_cont.19969
fbgt_else.19968:
	addi	%v0, %zero, 1
fbgt_cont.19969:
	beqi	%v0, 0, bnei_else.19970
	j	bnei_cont.19971
bnei_else.19970:
	fmov	%f0, %f1
bnei_cont.19971:
	flw	%f2, 12(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 14(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)
	flw	%f3, 145(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 148(%zero)
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 149(%zero)
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	fsw	%f0, 150(%zero)
bnei_cont.19967:
	j	bnei_cont.19953
bnei_else.19952:
bnei_cont.19953:
bnei_cont.19931:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.19972
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
	fblt	%f0, %f1, fbgt_else.19973
	addi	%a1, %zero, 0
	j	fbgt_cont.19974
fbgt_else.19973:
	addi	%a1, %zero, 1
fbgt_cont.19974:
	sw	%v0, 15(%sp)
	beqi	%a1, 0, bnei_else.19975
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.19976
bnei_else.19975:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
bnei_cont.19976:
	lw	%v0, 15(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.19972:
	jr	%ra
bgti_else.19927:
	jr	%ra
trace_diffuse_ray_80percent.2989:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.19979
	lw	%a1, 179(%zero)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a2, 0(%zero)
	addi	%a2, %a2, -1
	sw	%a1, 3(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19980
bnei_else.19979:
bnei_cont.19980:
	lw	%v0, 2(%sp)
	beqi	%v0, 1, bnei_else.19981
	lw	%v1, 180(%zero)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 4(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19982
bnei_else.19981:
bnei_cont.19982:
	lw	%v0, 2(%sp)
	beqi	%v0, 2, bnei_else.19983
	lw	%v1, 181(%zero)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 5(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.19984
bnei_else.19983:
bnei_cont.19984:
	lw	%v0, 2(%sp)
	beqi	%v0, 3, bnei_else.19985
	lw	%v1, 182(%zero)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19986
bnei_else.19985:
bnei_cont.19986:
	lw	%v0, 2(%sp)
	beqi	%v0, 4, bnei_else.19987
	lw	%v0, 183(%zero)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%a0, %a0, -1
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 7(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	j	iter_trace_diffuse_rays.2980
bnei_else.19987:
	jr	%ra
calc_diffuse_using_1point.2993:
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
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
	beqi	%v0, 0, bnei_else.19989
	lw	%a2, 179(%zero)
	flw	%f0, 0(%a1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a1)
	fsw	%f0, 164(%zero)
	lw	%t0, 0(%zero)
	addi	%t0, %t0, -1
	sw	%a2, 5(%sp)
	addi	%v1, %t0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2882
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
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19991
	addi	%a0, %zero, 0
	j	fbgt_cont.19992
fbgt_else.19991:
	addi	%a0, %zero, 1
fbgt_cont.19992:
	beqi	%a0, 0, bnei_else.19993
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.19994
bnei_else.19993:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19994:
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.19990
bnei_else.19989:
bnei_cont.19990:
	lw	%v0, 4(%sp)
	beqi	%v0, 1, bnei_else.19995
	lw	%v1, 180(%zero)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_startp_constants.2882
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
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19997
	addi	%a0, %zero, 0
	j	fbgt_cont.19998
fbgt_else.19997:
	addi	%a0, %zero, 1
fbgt_cont.19998:
	beqi	%a0, 0, bnei_else.19999
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.20000
bnei_else.19999:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.20000:
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19996
bnei_else.19995:
bnei_cont.19996:
	lw	%v0, 4(%sp)
	beqi	%v0, 2, bnei_else.20001
	lw	%v1, 181(%zero)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 7(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_startp_constants.2882
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
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.20003
	addi	%a0, %zero, 0
	j	fbgt_cont.20004
fbgt_else.20003:
	addi	%a0, %zero, 1
fbgt_cont.20004:
	beqi	%a0, 0, bnei_else.20005
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.20006
bnei_else.20005:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.20006:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.20002
bnei_else.20001:
bnei_cont.20002:
	lw	%v0, 4(%sp)
	beqi	%v0, 3, bnei_else.20007
	lw	%v1, 182(%zero)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 8(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	setup_startp_constants.2882
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
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.20009
	addi	%a0, %zero, 0
	j	fbgt_cont.20010
fbgt_else.20009:
	addi	%a0, %zero, 1
fbgt_cont.20010:
	beqi	%a0, 0, bnei_else.20011
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20012
bnei_else.20011:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.20012:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20008
bnei_else.20007:
bnei_cont.20008:
	lw	%v0, 4(%sp)
	beqi	%v0, 4, bnei_else.20013
	lw	%v0, 183(%zero)
	lw	%v1, 3(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%a0, %a0, -1
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2882
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
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.20015
	addi	%a0, %zero, 0
	j	fbgt_cont.20016
fbgt_else.20015:
	addi	%a0, %zero, 1
fbgt_cont.20016:
	beqi	%a0, 0, bnei_else.20017
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20018
bnei_else.20017:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20018:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20014
bnei_else.20013:
bnei_cont.20014:
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v0)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v0)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v0)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	jr	%ra
calc_diffuse_using_5points.2996:
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
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%v1)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%v1)
	fsw	%f0, 150(%zero)
	add	%at, %a3, %a2
	lw	%v1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t1, %a2
	lw	%v1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %a0, %a2
	lw	%v1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %v0, %a2
	lw	%v0, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%v0)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%v0)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%v0)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%v0, 4(%t0)
	add	%at, %v0, %a2
	lw	%v0, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v0)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v0)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v0)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	jr	%ra
do_without_neighbors.3002:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20021
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20022
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.20023
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
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
	jal	trace_diffuse_ray_80percent.2989
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.20024
bnei_else.20023:
bnei_cont.20024:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20025
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20026
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.20027
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_diffuse_using_1point.2993
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.20028
bnei_else.20027:
bnei_cont.20028:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.20026:
	jr	%ra
bgt_else.20025:
	jr	%ra
bgti_else.20022:
	jr	%ra
bgt_else.20021:
	jr	%ra
try_exploit_neighbors.3018:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.20033
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.20034
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20035
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20037
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20039
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20041
	addi	%t1, %zero, 1
	j	beq_cont.20042
beq_else.20041:
	addi	%t1, %zero, 0
beq_cont.20042:
	j	beq_cont.20040
beq_else.20039:
	addi	%t1, %zero, 0
beq_cont.20040:
	j	beq_cont.20038
beq_else.20037:
	addi	%t1, %zero, 0
beq_cont.20038:
	j	beq_cont.20036
beq_else.20035:
	addi	%t1, %zero, 0
beq_cont.20036:
	beqi	%t1, 0, bnei_else.20043
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
	beqi	%t1, 0, bnei_else.20044
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_diffuse_using_5points.2996
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.20045
bnei_else.20044:
bnei_cont.20045:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20046
	lw	%v0, 6(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20047
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 5(%sp)
	lw	%a1, 2(%a1)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	bne	%a1, %a0, beq_else.20048
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	add	%at, %a2, %a1
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.20050
	addi	%a3, %a1, -1
	lw	%t0, 2(%sp)
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.20052
	addi	%a3, %a1, 1
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.20054
	addi	%a0, %zero, 1
	j	beq_cont.20055
beq_else.20054:
	addi	%a0, %zero, 0
beq_cont.20055:
	j	beq_cont.20053
beq_else.20052:
	addi	%a0, %zero, 0
beq_cont.20053:
	j	beq_cont.20051
beq_else.20050:
	addi	%a0, %zero, 0
beq_cont.20051:
	j	beq_cont.20049
beq_else.20048:
	addi	%a0, %zero, 0
beq_cont.20049:
	beqi	%a0, 0, bnei_else.20056
	lw	%v0, 3(%v0)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%v1, 8(%sp)
	beqi	%v0, 0, bnei_else.20057
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
	jal	calc_diffuse_using_5points.2996
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20058
bnei_else.20057:
bnei_cont.20058:
	lw	%v0, 8(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 2(%sp)
	lw	%a2, 4(%sp)
	j	try_exploit_neighbors.3018
bnei_else.20056:
	j	do_without_neighbors.3002
bgti_else.20047:
	jr	%ra
bgt_else.20046:
	jr	%ra
bnei_else.20043:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.20061
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.20062
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 6(%sp)
	sw	%a3, 7(%sp)
	beqi	%v0, 0, bnei_else.20063
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_diffuse_using_1point.2993
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20064
bnei_else.20063:
bnei_cont.20064:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 6(%sp)
	j	do_without_neighbors.3002
bgti_else.20062:
	jr	%ra
bgt_else.20061:
	jr	%ra
bgti_else.20034:
	jr	%ra
bgt_else.20033:
	jr	%ra
write_rgb_element.3027:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20069
	blti	%v0, 0, bgti_else.20071
	j	bgti_cont.20072
bgti_else.20071:
	addi	%v0, %zero, 0
bgti_cont.20072:
	j	bgt_cont.20070
bgt_else.20069:
	addi	%v0, %zero, 255
bgt_cont.20070:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.20073
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.20075
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20077
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20079
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20081
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20083
	addi	%v1, %v1, -10
	addi	%a0, %zero, 6
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2629
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.20084
bgti_else.20083:
	addi	%v0, %zero, 5
bgti_cont.20084:
	j	bgti_cont.20082
bgti_else.20081:
	addi	%v0, %zero, 4
bgti_cont.20082:
	j	bgti_cont.20080
bgti_else.20079:
	addi	%v0, %zero, 3
bgti_cont.20080:
	j	bgti_cont.20078
bgti_else.20077:
	addi	%v0, %zero, 2
bgti_cont.20078:
	j	bgti_cont.20076
bgti_else.20075:
	addi	%v0, %zero, 1
bgti_cont.20076:
	j	bgti_cont.20074
bgti_else.20073:
	addi	%v0, %zero, 0
bgti_cont.20074:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.20085
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20087
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20089
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20091
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20093
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20095
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20097
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20099
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20101
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20103
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20105
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20107
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20109
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20111
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2632
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.20112
bgti_else.20111:
	add	%v0, %zero, %v1
bgti_cont.20112:
	j	bgti_cont.20110
bgti_else.20109:
	add	%v0, %zero, %v1
bgti_cont.20110:
	j	bgti_cont.20108
bgti_else.20107:
	add	%v0, %zero, %v1
bgti_cont.20108:
	j	bgti_cont.20106
bgti_else.20105:
	add	%v0, %zero, %v1
bgti_cont.20106:
	j	bgti_cont.20104
bgti_else.20103:
	add	%v0, %zero, %v1
bgti_cont.20104:
	j	bgti_cont.20102
bgti_else.20101:
	add	%v0, %zero, %v1
bgti_cont.20102:
	j	bgti_cont.20100
bgti_else.20099:
	add	%v0, %zero, %v1
bgti_cont.20100:
	j	bgti_cont.20098
bgti_else.20097:
	add	%v0, %zero, %v1
bgti_cont.20098:
	j	bgti_cont.20096
bgti_else.20095:
	add	%v0, %zero, %v1
bgti_cont.20096:
	j	bgti_cont.20094
bgti_else.20093:
	add	%v0, %zero, %v1
bgti_cont.20094:
	j	bgti_cont.20092
bgti_else.20091:
	add	%v0, %zero, %v1
bgti_cont.20092:
	j	bgti_cont.20090
bgti_else.20089:
	add	%v0, %zero, %v1
bgti_cont.20090:
	j	bgti_cont.20088
bgti_else.20087:
	add	%v0, %zero, %v1
bgti_cont.20088:
	j	bgti_cont.20086
bgti_else.20085:
	add	%v0, %zero, %v1
bgti_cont.20086:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.20113
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.20113:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.20114
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.20116
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20118
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20120
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20122
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20124
	addi	%a0, %a0, -10
	addi	%a1, %zero, 6
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.20125
bgti_else.20124:
	addi	%v0, %zero, 5
bgti_cont.20125:
	j	bgti_cont.20123
bgti_else.20122:
	addi	%v0, %zero, 4
bgti_cont.20123:
	j	bgti_cont.20121
bgti_else.20120:
	addi	%v0, %zero, 3
bgti_cont.20121:
	j	bgti_cont.20119
bgti_else.20118:
	addi	%v0, %zero, 2
bgti_cont.20119:
	j	bgti_cont.20117
bgti_else.20116:
	addi	%v0, %zero, 1
bgti_cont.20117:
	j	bgti_cont.20115
bgti_else.20114:
	addi	%v0, %zero, 0
bgti_cont.20115:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.20126
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20128
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20130
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20132
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20134
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20136
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20138
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20140
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20142
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20144
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20146
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20148
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20150
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20152
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2632
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.20153
bgti_else.20152:
	add	%v0, %zero, %v1
bgti_cont.20153:
	j	bgti_cont.20151
bgti_else.20150:
	add	%v0, %zero, %v1
bgti_cont.20151:
	j	bgti_cont.20149
bgti_else.20148:
	add	%v0, %zero, %v1
bgti_cont.20149:
	j	bgti_cont.20147
bgti_else.20146:
	add	%v0, %zero, %v1
bgti_cont.20147:
	j	bgti_cont.20145
bgti_else.20144:
	add	%v0, %zero, %v1
bgti_cont.20145:
	j	bgti_cont.20143
bgti_else.20142:
	add	%v0, %zero, %v1
bgti_cont.20143:
	j	bgti_cont.20141
bgti_else.20140:
	add	%v0, %zero, %v1
bgti_cont.20141:
	j	bgti_cont.20139
bgti_else.20138:
	add	%v0, %zero, %v1
bgti_cont.20139:
	j	bgti_cont.20137
bgti_else.20136:
	add	%v0, %zero, %v1
bgti_cont.20137:
	j	bgti_cont.20135
bgti_else.20134:
	add	%v0, %zero, %v1
bgti_cont.20135:
	j	bgti_cont.20133
bgti_else.20132:
	add	%v0, %zero, %v1
bgti_cont.20133:
	j	bgti_cont.20131
bgti_else.20130:
	add	%v0, %zero, %v1
bgti_cont.20131:
	j	bgti_cont.20129
bgti_else.20128:
	add	%v0, %zero, %v1
bgti_cont.20129:
	j	bgti_cont.20127
bgti_else.20126:
	add	%v0, %zero, %v1
bgti_cont.20127:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.20154
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.20154:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.20155
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20157
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20159
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20161
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20163
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20165
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20167
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20169
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20171
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20173
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20175
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20177
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20179
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20181
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2632
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.20182
bgti_else.20181:
	add	%v0, %zero, %v1
bgti_cont.20182:
	j	bgti_cont.20180
bgti_else.20179:
	add	%v0, %zero, %v1
bgti_cont.20180:
	j	bgti_cont.20178
bgti_else.20177:
	add	%v0, %zero, %v1
bgti_cont.20178:
	j	bgti_cont.20176
bgti_else.20175:
	add	%v0, %zero, %v1
bgti_cont.20176:
	j	bgti_cont.20174
bgti_else.20173:
	add	%v0, %zero, %v1
bgti_cont.20174:
	j	bgti_cont.20172
bgti_else.20171:
	add	%v0, %zero, %v1
bgti_cont.20172:
	j	bgti_cont.20170
bgti_else.20169:
	add	%v0, %zero, %v1
bgti_cont.20170:
	j	bgti_cont.20168
bgti_else.20167:
	add	%v0, %zero, %v1
bgti_cont.20168:
	j	bgti_cont.20166
bgti_else.20165:
	add	%v0, %zero, %v1
bgti_cont.20166:
	j	bgti_cont.20164
bgti_else.20163:
	add	%v0, %zero, %v1
bgti_cont.20164:
	j	bgti_cont.20162
bgti_else.20161:
	add	%v0, %zero, %v1
bgti_cont.20162:
	j	bgti_cont.20160
bgti_else.20159:
	add	%v0, %zero, %v1
bgti_cont.20160:
	j	bgti_cont.20158
bgti_else.20157:
	add	%v0, %zero, %v1
bgti_cont.20158:
	j	bgti_cont.20156
bgti_else.20155:
	add	%v0, %zero, %v1
bgti_cont.20156:
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
write_rgb.3029:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20183
	blti	%v0, 0, bgti_else.20185
	j	bgti_cont.20186
bgti_else.20185:
	addi	%v0, %zero, 0
bgti_cont.20186:
	j	bgt_cont.20184
bgt_else.20183:
	addi	%v0, %zero, 255
bgt_cont.20184:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2634
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20187
	blti	%v0, 0, bgti_else.20189
	j	bgti_cont.20190
bgti_else.20189:
	addi	%v0, %zero, 0
bgti_cont.20190:
	j	bgt_cont.20188
bgt_else.20187:
	addi	%v0, %zero, 255
bgt_cont.20188:
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int.2634
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20191
	blti	%v0, 0, bgti_else.20193
	j	bgti_cont.20194
bgti_else.20193:
	addi	%v0, %zero, 0
bgti_cont.20194:
	j	bgt_cont.20192
bgt_else.20191:
	addi	%v0, %zero, 255
bgt_cont.20192:
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int.2634
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3031:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20195
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20196
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.20197
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 467(%zero)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
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
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 164(%zero)
	lw	%a3, 0(%zero)
	addi	%a3, %a3, -1
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a0, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%v0)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.20198
bnei_else.20197:
bnei_cont.20198:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20199
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20200
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.20201
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 467(%zero)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
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
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)
	fsw	%f1, 164(%zero)
	lw	%a3, 0(%zero)
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
	jal	setup_startp_constants.2882
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
	fblt	%f0, %f1, fbgt_else.20203
	addi	%a0, %zero, 0
	j	fbgt_cont.20204
fbgt_else.20203:
	addi	%a0, %zero, 1
fbgt_cont.20204:
	beqi	%a0, 0, bnei_else.20205
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20206
bnei_else.20205:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20206:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%v0)
	lw	%a0, 5(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.20202
bnei_else.20201:
bnei_cont.20202:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3031
bgti_else.20200:
	jr	%ra
bgt_else.20199:
	jr	%ra
bgti_else.20196:
	jr	%ra
bgt_else.20195:
	jr	%ra
pretrace_pixels.3034:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.20211
	flw	%f3, 158(%zero)
	lw	%a2, 156(%zero)
	sub	%a2, %v1, %a2
	itof	%f4, %a2
	fmul	%f3, %f3, %f4
	flw	%f4, 165(%zero)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	fsw	%f4, 174(%zero)
	addi	%a2, %zero, 1
	flw	%f4, 166(%zero)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	fsw	%f4, 175(%zero)
	flw	%f4, 167(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f3, %f2
	fsw	%f3, 176(%zero)
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
	jal	vecunit_sgn.2662
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 467(%zero)
	fsw	%f1, 151(%zero)
	fsw	%f1, 152(%zero)
	fsw	%f1, 153(%zero)
	flw	%f0, 75(%zero)
	fsw	%f0, 159(%zero)
	flw	%f0, 76(%zero)
	fsw	%f0, 160(%zero)
	flw	%f0, 77(%zero)
	fsw	%f0, 161(%zero)
	flw	%f0, 471(%zero)
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
	jal	trace_ray.2971
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 0(%v0)
	flw	%f0, 151(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 152(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 153(%zero)
	fsw	%f0, 2(%v1)
	lw	%v1, 6(%v0)
	lw	%a0, 4(%sp)
	sw	%a0, 0(%v1)
	lw	%v1, 2(%v0)
	lw	%v1, 0(%v1)
	blti	%v1, 0, bgti_else.20212
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.20214
	lw	%v1, 6(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 8(%sp)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	addi	%a3, %zero, 179
	add	%at, %a3, %v1
	lw	%v1, 0(%at)
	lw	%a1, 0(%a1)
	lw	%a2, 0(%a2)
	flw	%f1, 0(%a2)
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)
	fsw	%f1, 164(%zero)
	lw	%a3, 0(%zero)
	addi	%a3, %a3, -1
	sw	%a2, 10(%sp)
	sw	%a1, 11(%sp)
	sw	%v1, 12(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_startp_constants.2882
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
	fblt	%f0, %f1, fbgt_else.20216
	addi	%a0, %zero, 0
	j	fbgt_cont.20217
fbgt_else.20216:
	addi	%a0, %zero, 1
fbgt_cont.20217:
	beqi	%a0, 0, bnei_else.20218
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.20219
bnei_else.20218:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bnei_cont.20219:
	addi	%a1, %zero, 116
	lw	%v0, 12(%sp)
	lw	%v1, 11(%sp)
	lw	%a0, 10(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 9(%sp)
	lw	%v1, 5(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.20215
bnei_else.20214:
bnei_cont.20215:
	lw	%v1, 3(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.20213
bgti_else.20212:
bgti_cont.20213:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.20220
	addi	%a0, %v0, -5
	j	bgti_cont.20221
bgti_else.20220:
	add	%a0, %zero, %v0
bgti_cont.20221:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 7(%sp)
	j	pretrace_pixels.3034
bgti_else.20211:
	jr	%ra
scan_pixel.3045:
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.20223
	jr	%ra
bgt_else.20223:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%t2, 0(%t1)
	flw	%f0, 0(%t2)
	fsw	%f0, 151(%zero)
	addi	%t3, %zero, 1
	flw	%f0, 1(%t2)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%t2)
	fsw	%f0, 153(%zero)
	lw	%t2, 155(%zero)
	addi	%t4, %v1, 1
	blt	%t4, %t2, bgt_else.20225
	addi	%t5, %zero, 0
	j	bgt_cont.20226
bgt_else.20225:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.20227
	addi	%t5, %zero, 0
	j	bgt_cont.20228
bgt_else.20227:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.20229
	addi	%t5, %zero, 0
	j	bgt_cont.20230
bgt_else.20229:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20231
	addi	%t5, %zero, 0
	j	bgt_cont.20232
bgt_else.20231:
	addi	%t5, %zero, 1
bgt_cont.20232:
bgt_cont.20230:
bgt_cont.20228:
bgt_cont.20226:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%t4, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%v0, 8(%sp)
	beqi	%t5, 0, bnei_else.20233
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.20235
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20237
	add	%at, %a2, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20239
	addi	%t6, %v0, -1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20241
	addi	%t6, %v0, 1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20243
	addi	%t5, %zero, 1
	j	beq_cont.20244
beq_else.20243:
	addi	%t5, %zero, 0
beq_cont.20244:
	j	beq_cont.20242
beq_else.20241:
	addi	%t5, %zero, 0
beq_cont.20242:
	j	beq_cont.20240
beq_else.20239:
	addi	%t5, %zero, 0
beq_cont.20240:
	j	beq_cont.20238
beq_else.20237:
	addi	%t5, %zero, 0
beq_cont.20238:
	beqi	%t5, 0, bnei_else.20245
	lw	%t1, 3(%t1)
	lw	%t1, 0(%t1)
	sw	%t3, 9(%sp)
	beqi	%t1, 0, bnei_else.20247
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	calc_diffuse_using_5points.2996
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20248
bnei_else.20247:
bnei_cont.20248:
	lw	%v0, 8(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20246
bnei_else.20245:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20246:
	j	bgti_cont.20236
bgti_else.20235:
bgti_cont.20236:
	j	bnei_cont.20234
bnei_else.20233:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.20249
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.20251
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	calc_diffuse_using_1point.2993
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.20252
bnei_else.20251:
bnei_cont.20252:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.20250
bgti_else.20249:
bgti_cont.20250:
bnei_cont.20234:
	flw	%f0, 151(%zero)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	write_rgb_element.3027
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 32
	sw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_print_char
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 152(%zero)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	write_rgb_element.3027
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_print_char
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 153(%zero)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	write_rgb_element.3027
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
	blt	%v0, %v1, bgt_else.20253
	jr	%ra
bgt_else.20253:
	lw	%a1, 6(%sp)
	add	%at, %a1, %v0
	lw	%a0, 0(%at)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 153(%zero)
	lw	%a2, 4(%sp)
	lw	%a3, 5(%sp)
	blt	%a2, %a3, bgt_else.20255
	addi	%v1, %zero, 0
	j	bgt_cont.20256
bgt_else.20255:
	lw	%a2, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.20257
	addi	%v1, %zero, 0
	j	bgt_cont.20258
bgt_else.20257:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.20259
	addi	%v1, %zero, 0
	j	bgt_cont.20260
bgt_else.20259:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20261
	addi	%v1, %zero, 0
	j	bgt_cont.20262
bgt_else.20261:
	addi	%v1, %zero, 1
bgt_cont.20262:
bgt_cont.20260:
bgt_cont.20258:
bgt_cont.20256:
	sw	%v0, 12(%sp)
	beqi	%v1, 0, bnei_else.20263
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 2(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.20264
bnei_else.20263:
	lw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bnei_cont.20264:
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	write_rgb.3029
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 0(%sp)
	j	scan_pixel.3045
scan_line.3051:
	addi	%a3, %zero, 1
	lw	%t0, 155(%zero)
	blt	%v0, %t0, bgt_else.20265
	jr	%ra
bgt_else.20265:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.20267
	j	bgt_cont.20268
bgt_else.20267:
	addi	%t2, %v0, 1
	flw	%f0, 158(%zero)
	lw	%t3, 157(%zero)
	sub	%t2, %t2, %t3
	itof	%f1, %t2
	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	fmul	%f1, %f0, %f1
	flw	%f2, 171(%zero)
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	fmul	%f2, %f0, %f2
	flw	%f3, 172(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 173(%zero)
	fadd	%f0, %f0, %f3
	lw	%t2, 154(%zero)
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
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bgt_cont.20268:
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20269
	j	bgt_cont.20270
bgt_else.20269:
	lw	%a1, 7(%sp)
	lw	%a0, 0(%a1)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 153(%zero)
	lw	%a2, 6(%sp)
	addi	%a3, %a2, 1
	lw	%t0, 5(%sp)
	blt	%a3, %t0, bgt_else.20271
	addi	%a3, %zero, 0
	j	bgt_cont.20272
bgt_else.20271:
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.20273
	addi	%a3, %zero, 0
	j	bgt_cont.20274
bgt_else.20273:
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.20275
	addi	%a3, %zero, 0
	j	bgt_cont.20276
bgt_else.20275:
	addi	%a3, %zero, 0
bgt_cont.20276:
bgt_cont.20274:
bgt_cont.20272:
	beqi	%a3, 0, bnei_else.20277
	lw	%a0, 4(%sp)
	lw	%a3, 3(%sp)
	addi	%v0, %v1, 0
	addi	%k0, %a3, 0
	addi	%a3, %v1, 0
	addi	%v1, %a2, 0
	addi	%a2, %k0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20278
bnei_else.20277:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20278:
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	write_rgb.3029
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	lw	%a2, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	scan_pixel.3045
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bgt_cont.20270:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.20279
	addi	%a0, %v0, -5
	j	bgti_cont.20280
bgti_else.20279:
	add	%a0, %zero, %v0
bgti_cont.20280:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.20281
	jr	%ra
bgt_else.20281:
	lw	%v0, 0(%sp)
	sw	%a0, 10(%sp)
	sw	%v1, 11(%sp)
	blt	%v1, %v0, bgt_else.20283
	j	bgt_cont.20284
bgt_else.20283:
	addi	%v0, %v1, 1
	flw	%f0, 158(%zero)
	lw	%a1, 157(%zero)
	sub	%v0, %v0, %a1
	itof	%f1, %v0
	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	fmul	%f1, %f0, %f1
	flw	%f2, 171(%zero)
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	fmul	%f2, %f0, %f2
	flw	%f3, 172(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 173(%zero)
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
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bgt_cont.20284:
	lw	%v0, 8(%sp)
	lw	%v1, 11(%sp)
	lw	%a0, 7(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	scan_pixel.3045
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.20285
	addi	%a2, %v1, -5
	j	bgti_cont.20286
bgti_else.20285:
	add	%a2, %zero, %v1
bgti_cont.20286:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	j	scan_line.3051
create_pixel.3059:
	addi	%v0, %zero, 3
	flw	%f0, 467(%zero)
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
init_line_elements.3061:
	addi	%a0, %zero, 0
	blti	%v1, 0, bgti_else.20287
	addi	%a1, %zero, 3
	flw	%f0, 467(%zero)
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
	blti	%v0, 0, bgti_else.20288
	sw	%v0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	create_pixel.3059
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v1, 15(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.20289
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
	blti	%v0, 0, bgti_else.20290
	sw	%v0, 25(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	create_pixel.3059
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	init_line_elements.3061
bgti_else.20290:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.20289:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.20288:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.20287:
	jr	%ra
calc_dirvec.3071:
	blti	%v0, 5, bgti_else.20291
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
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
bgti_else.20291:
	fmul	%f0, %f1, %f1
	flw	%f1, 442(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 471(%zero)
	fdiv	%f5, %f4, %f0
	flw	%f6, 467(%zero)
	fblt	%f5, %f6, fbgt_else.20293
	addi	%a1, %zero, 1
	j	fbgt_cont.20294
fbgt_else.20293:
	addi	%a1, %zero, 0
fbgt_cont.20294:
	fabs	%f7, %f5
	flw	%f8, 455(%zero)
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
	fblt	%f7, %f8, fbgt_else.20295
	flw	%f5, 454(%zero)
	sw	%a1, 10(%sp)
	fblt	%f7, %f5, fbgt_else.20297
	flw	%f5, 476(%zero)
	fdiv	%f7, %f4, %f7
	fsw	%f5, 11(%sp)
	fmov	%f0, %f7
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	kernel_atan.2612
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.20298
fbgt_else.20297:
	flw	%f5, 475(%zero)
	fsub	%f9, %f7, %f4
	fadd	%f7, %f7, %f4
	fdiv	%f7, %f9, %f7
	fsw	%f5, 12(%sp)
	fmov	%f0, %f7
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	kernel_atan.2612
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.20298:
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.20299
	j	bnei_cont.20300
bnei_else.20299:
	fneg	%f0, %f0
bnei_cont.20300:
	j	fbgt_cont.20296
fbgt_else.20295:
	fmov	%f0, %f5
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	kernel_atan.2612
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
fbgt_cont.20296:
	flw	%f1, 9(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	sin.2625
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fsw	%f0, 14(%sp)
	fmov	%f0, %f1
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	cos.2623
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
	fblt	%f3, %f4, fbgt_else.20301
	addi	%v1, %zero, 1
	j	fbgt_cont.20302
fbgt_else.20301:
	addi	%v1, %zero, 0
fbgt_cont.20302:
	fabs	%f4, %f3
	flw	%f5, 3(%sp)
	fsw	%f0, 15(%sp)
	sw	%v0, 16(%sp)
	fsw	%f1, 17(%sp)
	fblt	%f4, %f5, fbgt_else.20303
	flw	%f3, 454(%zero)
	sw	%v1, 18(%sp)
	fblt	%f4, %f3, fbgt_else.20305
	flw	%f3, 476(%zero)
	fdiv	%f2, %f2, %f4
	fsw	%f3, 19(%sp)
	fmov	%f0, %f2
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	kernel_atan.2612
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 19(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.20306
fbgt_else.20305:
	flw	%f3, 475(%zero)
	fsub	%f5, %f4, %f2
	fadd	%f2, %f4, %f2
	fdiv	%f2, %f5, %f2
	fsw	%f3, 20(%sp)
	fmov	%f0, %f2
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	kernel_atan.2612
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f1, 20(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.20306:
	lw	%v0, 18(%sp)
	beqi	%v0, 0, bnei_else.20307
	j	bnei_cont.20308
bnei_else.20307:
	fneg	%f0, %f0
bnei_cont.20308:
	j	fbgt_cont.20304
fbgt_else.20303:
	fmov	%f0, %f3
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	kernel_atan.2612
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
fbgt_cont.20304:
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 21(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	sin.2625
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 21(%sp)
	fsw	%f0, 22(%sp)
	fmov	%f0, %f1
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	cos.2623
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
	j	calc_dirvec.3071
calc_dirvecs.3079:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.20309
	itof	%f1, %v0
	flw	%f2, 498(%zero)
	fmul	%f1, %f1, %f2
	flw	%f3, 439(%zero)
	fsub	%f1, %f1, %f3
	flw	%f4, 467(%zero)
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
	jal	calc_dirvec.3071
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 442(%zero)
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
	jal	calc_dirvec.3071
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 3(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.20310
	addi	%v1, %v1, -5
	j	bgti_cont.20311
bgti_else.20310:
bgti_cont.20311:
	blti	%v0, 0, bgti_else.20312
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
	jal	calc_dirvec.3071
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
	jal	calc_dirvec.3071
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.20313
	addi	%v1, %v1, -5
	j	bgti_cont.20314
bgti_else.20313:
bgti_cont.20314:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3079
bgti_else.20312:
	jr	%ra
bgti_else.20309:
	jr	%ra
calc_dirvec_rows.3084:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.20317
	itof	%f0, %v0
	flw	%f1, 498(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 439(%zero)
	fsub	%f3, %f0, %f2
	addi	%a2, %zero, 4
	flw	%f0, 435(%zero)
	flw	%f4, 467(%zero)
	sw	%a2, 0(%sp)
	fsw	%f2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f4, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%a1, 7(%sp)
	sw	%a0, 8(%sp)
	addi	%v0, %a1, 0
	fmov	%f2, %f0
	fmov	%f1, %f4
	fmov	%f0, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvec.3071
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f2, 439(%zero)
	lw	%v0, 8(%sp)
	addi	%a0, %v0, 2
	flw	%f0, 5(%sp)
	flw	%f3, 4(%sp)
	lw	%v1, 7(%sp)
	lw	%a1, 6(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	fmov	%f1, %f0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvec.3071
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 6(%sp)
	addi	%a0, %v1, 1
	blti	%a0, 5, bgti_else.20318
	addi	%a0, %a0, -5
	j	bgti_cont.20319
bgti_else.20318:
bgti_cont.20319:
	flw	%f0, 4(%sp)
	lw	%a1, 8(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvecs.3079
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 6(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.20320
	addi	%v1, %v1, -5
	j	bgti_cont.20321
bgti_else.20320:
bgti_cont.20321:
	lw	%a0, 8(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.20322
	itof	%f0, %v0
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%sp)
	fsub	%f0, %f0, %f1
	lw	%a1, 0(%sp)
	sw	%a0, 9(%sp)
	sw	%v1, 10(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	calc_dirvecs.3079
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.20323
	addi	%v1, %v1, -5
	j	bgti_cont.20324
bgti_else.20323:
bgti_cont.20324:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3084
bgti_else.20322:
	jr	%ra
bgti_else.20317:
	jr	%ra
create_dirvec_elements.3090:
	blti	%v1, 0, bgti_else.20327
	addi	%a0, %zero, 3
	flw	%f0, 467(%zero)
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
	lw	%v0, 0(%zero)
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
	blti	%v0, 0, bgti_else.20328
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
	blti	%v0, 0, bgti_else.20329
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
	blti	%v0, 0, bgti_else.20330
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
	j	create_dirvec_elements.3090
bgti_else.20330:
	jr	%ra
bgti_else.20329:
	jr	%ra
bgti_else.20328:
	jr	%ra
bgti_else.20327:
	jr	%ra
create_dirvecs.3093:
	blti	%v0, 0, bgti_else.20335
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 467(%zero)
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
	lw	%v0, 0(%zero)
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
	jal	create_dirvec_elements.3090
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20336
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
	jal	create_dirvec_elements.3090
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	j	create_dirvecs.3093
bgti_else.20336:
	jr	%ra
bgti_else.20335:
	jr	%ra
init_dirvec_constants.3095:
	blti	%v1, 0, bgti_else.20339
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%a1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20340
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.20341
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.20343
	beqi	%t1, 2, bnei_else.20345
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_second_table.2874
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20346
bnei_else.20345:
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_surface_table.2871
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20346:
	j	bnei_cont.20344
bnei_else.20343:
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_rect_table.2868
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20344:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.20342
bgti_else.20341:
bgti_cont.20342:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20347
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20348
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 7(%sp)
	blti	%a1, 0, bgti_else.20349
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.20351
	beqi	%t1, 2, bnei_else.20353
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_second_table.2874
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20354
bnei_else.20353:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_surface_table.2871
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20354:
	j	bnei_cont.20352
bnei_else.20351:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_rect_table.2868
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20352:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.20350
bgti_else.20349:
bgti_cont.20350:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	init_dirvec_constants.3095
bgti_else.20348:
	jr	%ra
bgti_else.20347:
	jr	%ra
bgti_else.20340:
	jr	%ra
bgti_else.20339:
	jr	%ra
init_vecset_constants.3098:
	blti	%v0, 0, bgti_else.20359
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 119
	lw	%a1, 119(%v1)
	lw	%a2, 0(%zero)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v1, 3(%sp)
	blti	%a2, 0, bgti_else.20360
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.20362
	beqi	%t2, 2, bnei_else.20364
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_second_table.2874
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20365
bnei_else.20364:
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_surface_table.2871
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20365:
	j	bnei_cont.20363
bnei_else.20362:
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_rect_table.2868
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20363:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.20361
bgti_else.20360:
bgti_cont.20361:
	addi	%v0, %zero, 118
	lw	%v1, 3(%sp)
	lw	%a0, 118(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 117
	lw	%v1, 3(%sp)
	lw	%a0, 117(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 7(%sp)
	blti	%a1, 0, bgti_else.20366
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.20368
	beqi	%t1, 2, bnei_else.20370
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_second_table.2874
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20371
bnei_else.20370:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_surface_table.2871
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20371:
	j	bnei_cont.20369
bnei_else.20368:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_rect_table.2868
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20369:
	addi	%v0, %v1, -1
	lw	%a0, 8(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.20367
bgti_else.20366:
bgti_cont.20367:
	addi	%v1, %zero, 116
	lw	%v0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20372
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
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)
	blti	%a0, 0, bgti_else.20373
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 12(%sp)
	beqi	%t0, 1, bnei_else.20375
	beqi	%t0, 2, bnei_else.20377
	sw	%a2, 13(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	setup_second_table.2874
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 13(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20378
bnei_else.20377:
	sw	%a2, 13(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	setup_surface_table.2871
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 13(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20378:
	j	bnei_cont.20376
bnei_else.20375:
	sw	%a2, 13(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	setup_rect_table.2868
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 13(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20376:
	addi	%v0, %v1, -1
	lw	%a0, 12(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.20374
bgti_else.20373:
bgti_cont.20374:
	lw	%v0, 11(%sp)
	lw	%v1, 7(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20379
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 14(%sp)
	sw	%v1, 15(%sp)
	blti	%a1, 0, bgti_else.20380
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 16(%sp)
	beqi	%t1, 1, bnei_else.20382
	beqi	%t1, 2, bnei_else.20384
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_second_table.2874
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20385
bnei_else.20384:
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_surface_table.2871
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20385:
	j	bnei_cont.20383
bnei_else.20382:
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_rect_table.2868
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20383:
	addi	%v1, %v1, -1
	lw	%v0, 16(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.20381
bgti_else.20380:
bgti_cont.20381:
	lw	%v0, 15(%sp)
	lw	%v1, 6(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 14(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20386
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	sw	%v0, 18(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3098
bgti_else.20386:
	jr	%ra
bgti_else.20379:
	jr	%ra
bgti_else.20372:
	jr	%ra
bgti_else.20359:
	jr	%ra
setup_rect_reflection.3109:
	sll	%v0, %v0, 2
	lw	%a0, 434(%zero)
	flw	%f0, 471(%zero)
	lw	%v1, 7(%v1)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 78(%zero)
	fneg	%f2, %f1
	flw	%f3, 79(%zero)
	fneg	%f4, %f3
	flw	%f5, 80(%zero)
	fneg	%f6, %f5
	addi	%v1, %v0, 1
	addi	%a1, %zero, 3
	flw	%f7, 467(%zero)
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
	lw	%v0, 0(%zero)
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
	blti	%a2, 0, bgti_else.20391
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.20393
	beqi	%t0, 2, bnei_else.20395
	sw	%v0, 16(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_second_table.2874
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 16(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20396
bnei_else.20395:
	sw	%v0, 16(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_surface_table.2871
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 16(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20396:
	j	bnei_cont.20394
bnei_else.20393:
	sw	%v0, 16(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_rect_table.2868
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 16(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20394:
	addi	%v0, %v1, -1
	lw	%a0, 15(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.20392
bgti_else.20391:
bgti_cont.20392:
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
	blti	%a1, 0, bgti_else.20397
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20399
	beqi	%a3, 2, bnei_else.20401
	sw	%v0, 21(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	setup_second_table.2874
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 21(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20402
bnei_else.20401:
	sw	%v0, 21(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	setup_surface_table.2871
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 21(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20402:
	j	bnei_cont.20400
bnei_else.20399:
	sw	%v0, 21(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	setup_rect_table.2868
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 21(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20400:
	addi	%v0, %v1, -1
	lw	%a0, 20(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.20398
bgti_else.20397:
bgti_cont.20398:
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
	blti	%a1, 0, bgti_else.20403
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20405
	beqi	%a3, 2, bnei_else.20407
	sw	%v0, 26(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	setup_second_table.2874
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 26(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20408
bnei_else.20407:
	sw	%v0, 26(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	setup_surface_table.2871
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 26(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20408:
	j	bnei_cont.20406
bnei_else.20405:
	sw	%v0, 26(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	setup_rect_table.2868
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 26(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20406:
	addi	%v1, %v1, -1
	lw	%v0, 25(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.20404
bgti_else.20403:
bgti_cont.20404:
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
	sw	%v0, 434(%zero)
	jr	%ra
setup_surface_reflection.3112:
	sll	%v0, %v0, 2
	addi	%v0, %v0, 1
	lw	%a0, 434(%zero)
	flw	%f0, 471(%zero)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	fsub	%f0, %f0, %f1
	lw	%a1, 4(%v1)
	flw	%f1, 78(%zero)
	flw	%f2, 0(%a1)
	fmul	%f2, %f1, %f2
	flw	%f3, 79(%zero)
	flw	%f4, 1(%a1)
	fmul	%f4, %f3, %f4
	fadd	%f2, %f2, %f4
	flw	%f4, 80(%zero)
	flw	%f5, 2(%a1)
	fmul	%f5, %f4, %f5
	fadd	%f2, %f2, %f5
	flw	%f5, 493(%zero)
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
	flw	%f4, 467(%zero)
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
	lw	%v0, 0(%zero)
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
	blti	%a1, 0, bgti_else.20410
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20412
	beqi	%a3, 2, bnei_else.20414
	sw	%a1, 9(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_second_table.2874
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20415
bnei_else.20414:
	sw	%a1, 9(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_surface_table.2871
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20415:
	j	bnei_cont.20413
bnei_else.20412:
	sw	%a1, 9(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_rect_table.2868
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20413:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.20411
bgti_else.20410:
bgti_cont.20411:
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
	sw	%v0, 434(%zero)
	jr	%ra
rt.3117:
	addi	%a0, %zero, 0
	sw	%v0, 154(%zero)
	addi	%a1, %zero, 1
	sw	%v1, 155(%zero)
	addi	%a2, %zero, 2
	srl	%a3, %v0, 1
	sw	%a3, 156(%zero)
	srl	%v1, %v1, 1
	sw	%v1, 157(%zero)
	flw	%f0, 438(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	fsw	%f0, 158(%zero)
	lw	%v0, 154(%zero)
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	create_pixel.3059
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
	blti	%a0, 0, bgti_else.20417
	addi	%a1, %zero, 3
	flw	%f0, 467(%zero)
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
	blti	%v0, 0, bgti_else.20419
	sw	%v0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	create_pixel.3059
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
	jal	init_line_elements.3061
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.20420
bgti_else.20419:
	add	%v0, %zero, %a0
bgti_cont.20420:
	j	bgti_cont.20418
bgti_else.20417:
bgti_cont.20418:
	sw	%v0, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	create_pixel.3059
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
	blti	%v1, 0, bgti_else.20421
	addi	%a0, %zero, 3
	flw	%f0, 467(%zero)
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
	blti	%v0, 0, bgti_else.20423
	sw	%v0, 31(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	create_pixel.3059
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
	jal	init_line_elements.3061
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	j	bgti_cont.20424
bgti_else.20423:
	add	%v0, %zero, %a0
bgti_cont.20424:
	j	bgti_cont.20422
bgti_else.20421:
bgti_cont.20422:
	sw	%v0, 32(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	create_pixel.3059
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
	blti	%v1, 0, bgti_else.20425
	addi	%a0, %zero, 3
	flw	%f0, 467(%zero)
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
	blti	%v0, 0, bgti_else.20427
	sw	%v0, 45(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	create_pixel.3059
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
	jal	init_line_elements.3061
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	bgti_cont.20428
bgti_else.20427:
	add	%v0, %zero, %a0
bgti_cont.20428:
	j	bgti_cont.20426
bgti_else.20425:
bgti_cont.20426:
	sw	%v0, 46(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	read_screen_settings.2763
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
	flw	%f1, 465(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 47(%sp)
	fsw	%f1, 48(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	sin.2625
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
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
	jal	cos.2623
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	flw	%f1, 49(%sp)
	fsw	%f0, 50(%sp)
	fmov	%f0, %f1
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	sin.2625
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	flw	%f1, 50(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 78(%zero)
	flw	%f0, 49(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	cos.2623
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	flw	%f1, 50(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 80(%zero)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	min_caml_read_float
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	fsw	%f0, 81(%zero)
	lw	%v0, 2(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2770
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20429
	lw	%v0, 1(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2770
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20431
	lw	%v0, 0(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2770
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20433
	addi	%v0, %zero, 3
	sw	%v0, 51(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	read_nth_object.2770
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	beqi	%v0, 0, bnei_else.20435
	addi	%v0, %zero, 4
	sw	%v0, 52(%sp)
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	read_nth_object.2770
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	beqi	%v0, 0, bnei_else.20437
	addi	%v0, %zero, 5
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	read_object.2772
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	bnei_cont.20438
bnei_else.20437:
	lw	%v0, 52(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20438:
	j	bnei_cont.20436
bnei_else.20435:
	lw	%v0, 51(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20436:
	j	bnei_cont.20434
bnei_else.20433:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20434:
	j	bnei_cont.20432
bnei_else.20431:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20432:
	j	bnei_cont.20430
bnei_else.20429:
	lw	%v0, 2(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20430:
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	min_caml_read_int
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.20439
	lw	%v1, 1(%sp)
	sw	%v0, 53(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_net_item.2776
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	lw	%v1, 53(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.20440
bnei_else.20439:
	lw	%v0, 1(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	min_caml_create_array
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
bnei_cont.20440:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.20441
	sw	%v0, 83(%zero)
	lw	%v0, 2(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_net_item.2776
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.20443
	sw	%v0, 84(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_and_network.2780
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	j	bnei_cont.20444
bnei_else.20443:
bnei_cont.20444:
	j	bnei_cont.20442
bnei_else.20441:
bnei_cont.20442:
	lw	%v0, 2(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_or_network.2778
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	sw	%v0, 134(%zero)
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
	jal	print_int.2634
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	addi	%v0, %zero, 32
	sw	%v0, 55(%sp)
	sw	%ra, 56(%sp)
	addi	%sp, %sp, 57
	jal	min_caml_print_char
	addi	%sp, %sp, -57
	lw	%ra, 56(%sp)
	lw	%v0, 155(%zero)
	sw	%v0, 56(%sp)
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	print_int.2634
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
	jal	print_int.2634
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
	jal	create_dirvecs.3093
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	addi	%v0, %zero, 9
	lw	%v1, 2(%sp)
	addi	%a0, %v1, 0
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	calc_dirvec_rows.3084
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	lw	%v0, 183(%zero)
	addi	%v1, %zero, 119
	lw	%a0, 119(%v0)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%a1, 58(%sp)
	sw	%v1, 59(%sp)
	sw	%v0, 60(%sp)
	blti	%a1, 0, bgti_else.20445
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 61(%sp)
	beqi	%t1, 1, bnei_else.20447
	beqi	%t1, 2, bnei_else.20449
	sw	%a3, 62(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_second_table.2874
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v1, 58(%sp)
	lw	%a0, 62(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20450
bnei_else.20449:
	sw	%a3, 62(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_surface_table.2871
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v1, 58(%sp)
	lw	%a0, 62(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20450:
	j	bnei_cont.20448
bnei_else.20447:
	sw	%a3, 62(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_rect_table.2868
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v1, 58(%sp)
	lw	%a0, 62(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20448:
	addi	%v0, %v1, -1
	lw	%a0, 61(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	j	bgti_cont.20446
bgti_else.20445:
bgti_cont.20446:
	addi	%v1, %zero, 118
	lw	%v0, 60(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v0, 182(%zero)
	lw	%v1, 59(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_vecset_constants.3098
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	flw	%f0, 78(%zero)
	fsw	%f0, 184(%zero)
	flw	%f0, 79(%zero)
	fsw	%f0, 185(%zero)
	flw	%f0, 80(%zero)
	fsw	%f0, 186(%zero)
	addi	%v0, %zero, 247
	lw	%v1, 58(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v0, 58(%sp)
	blti	%v0, 0, bgti_else.20451
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.20453
	j	bnei_cont.20454
bnei_else.20453:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 471(%zero)
	fblt	%f0, %f1, fbgt_else.20455
	addi	%a0, %zero, 0
	j	fbgt_cont.20456
fbgt_else.20455:
	addi	%a0, %zero, 1
fbgt_cont.20456:
	beqi	%a0, 0, bnei_else.20457
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.20459
	beqi	%a0, 2, bnei_else.20461
	j	bnei_cont.20462
bnei_else.20461:
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_surface_reflection.3112
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
bnei_cont.20462:
	j	bnei_cont.20460
bnei_else.20459:
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_rect_reflection.3109
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
bnei_cont.20460:
	j	bnei_cont.20458
bnei_else.20457:
bnei_cont.20458:
bnei_cont.20454:
	j	bgti_cont.20452
bgti_else.20451:
bgti_cont.20452:
	flw	%f0, 158(%zero)
	lw	%v0, 157(%zero)
	lw	%a0, 2(%sp)
	sub	%v1, %a0, %v0
	itof	%f1, %v1
	fmul	%f1, %f0, %f1
	flw	%f2, 168(%zero)
	fmul	%f3, %f1, %f2
	flw	%f4, 171(%zero)
	fadd	%f3, %f3, %f4
	flw	%f5, 169(%zero)
	fmul	%f6, %f1, %f5
	flw	%f7, 172(%zero)
	fadd	%f6, %f6, %f7
	flw	%f8, 170(%zero)
	fmul	%f1, %f1, %f8
	flw	%f9, 173(%zero)
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
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
	lw	%v0, 56(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20463
	jr	%ra
bgt_else.20463:
	addi	%v0, %v0, -1
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20465
	j	bgt_cont.20466
bgt_else.20465:
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
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
bgt_cont.20466:
	lw	%v0, 2(%sp)
	lw	%a0, 18(%sp)
	lw	%a1, 32(%sp)
	lw	%a2, 46(%sp)
	addi	%v1, %v0, 0
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	scan_pixel.3045
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 32(%sp)
	lw	%a0, 46(%sp)
	lw	%a1, 18(%sp)
	lw	%a2, 57(%sp)
	j	scan_line.3051
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
	flw	%f0, 467(%zero)
	addi	%v1, %zero, 1
	lw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 60
	sw	%v0, 11(%zero)
	sw	%v0, 10(%zero)
	sw	%v0, 9(%zero)
	sw	%v0, 8(%zero)
	lw	%a0, 1(%sp)
	sw	%a0, 7(%zero)
	sw	%v0, 6(%zero)
	sw	%v0, 5(%zero)
	sw	%a0, 4(%zero)
	sw	%a0, 3(%zero)
	sw	%a0, 2(%zero)
	sw	%a0, 1(%zero)
	addi	%v0, %zero, 12
	addi	%a1, %zero, 1
	sw	%v1, 3(%sp)
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
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
	flw	%f0, 450(%zero)
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
	lw	%v1, 83(%zero)
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
	flw	%f0, 459(%zero)
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
	sw	%v0, 178(%zero)
	lw	%v0, 7(%sp)
	sw	%v0, 177(%zero)
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
	sw	%v0, 248(%zero)
	lw	%v0, 8(%sp)
	sw	%v0, 247(%zero)
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
	sw	%v0, 250(%zero)
	lw	%v0, 9(%sp)
	sw	%v0, 249(%zero)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	flw	%f0, 2(%sp)
	fsw	%f0, 253(%zero)
	sw	%v0, 252(%zero)
	lw	%v0, 1(%sp)
	sw	%v0, 251(%zero)
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
	jal	rt.3117
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%g0, %zero, 0
	ret
