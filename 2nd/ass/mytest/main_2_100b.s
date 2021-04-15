.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 44464
	lui	%hp, 0
	ori	%hp, %hp, 497
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
	fblt	%f0, %f1, fbgt_else.21790
	flw	%f2, 496(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21791
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21792
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21793
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21794
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21795
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21796
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21797
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21798
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21799
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21800
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21801
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21802
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21803
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21804
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21805
	fmul	%f1, %f2, %f1
	j	reduction_2pi_sub1.2626
fbgt_else.21805:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21804:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21803:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21802:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21801:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21800:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21799:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21798:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21797:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21796:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21795:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21794:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21793:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21792:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21791:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21790:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2629:
	fblt	%f0, %f2, fbgt_else.21806
	fblt	%f0, %f1, fbgt_else.21807
	fsub	%f0, %f0, %f1
	flw	%f3, 496(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21808
	fblt	%f0, %f1, fbgt_else.21809
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21810
	fblt	%f0, %f1, fbgt_else.21811
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21812
	fblt	%f0, %f1, fbgt_else.21813
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21813:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21812:
	jr	%ra
fbgt_else.21811:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21814
	fblt	%f0, %f1, fbgt_else.21815
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21815:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21814:
	jr	%ra
fbgt_else.21810:
	jr	%ra
fbgt_else.21809:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21816
	fblt	%f0, %f1, fbgt_else.21817
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21818
	fblt	%f0, %f1, fbgt_else.21819
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21819:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21818:
	jr	%ra
fbgt_else.21817:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21820
	fblt	%f0, %f1, fbgt_else.21821
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21821:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21820:
	jr	%ra
fbgt_else.21816:
	jr	%ra
fbgt_else.21808:
	jr	%ra
fbgt_else.21807:
	flw	%f3, 496(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21822
	fblt	%f0, %f1, fbgt_else.21823
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21824
	fblt	%f0, %f1, fbgt_else.21825
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21826
	fblt	%f0, %f1, fbgt_else.21827
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21827:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21826:
	jr	%ra
fbgt_else.21825:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21828
	fblt	%f0, %f1, fbgt_else.21829
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21829:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21828:
	jr	%ra
fbgt_else.21824:
	jr	%ra
fbgt_else.21823:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21830
	fblt	%f0, %f1, fbgt_else.21831
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21832
	fblt	%f0, %f1, fbgt_else.21833
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21833:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21832:
	jr	%ra
fbgt_else.21831:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21834
	fblt	%f0, %f1, fbgt_else.21835
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21835:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21834:
	jr	%ra
fbgt_else.21830:
	jr	%ra
fbgt_else.21822:
	jr	%ra
fbgt_else.21806:
	jr	%ra
cos.2635:
	flw	%f1, 495(%zero)
	fabs	%f0, %f0
	flw	%f2, 494(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.21881
	flw	%f3, 493(%zero)
	fblt	%f0, %f3, fbgt_else.21883
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.21885
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.21887
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.21889
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.21891
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.21893
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.21895
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.21897
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.21899
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.21901
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.21903
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.21905
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.21907
	flw	%f3, 480(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.21882
fbgt_else.21907:
	fmov	%f0, %f3
fbgt_cont.21908:
	j	fbgt_cont.21882
fbgt_else.21905:
	fmov	%f0, %f3
fbgt_cont.21906:
	j	fbgt_cont.21882
fbgt_else.21903:
	fmov	%f0, %f3
fbgt_cont.21904:
	j	fbgt_cont.21882
fbgt_else.21901:
	fmov	%f0, %f3
fbgt_cont.21902:
	j	fbgt_cont.21882
fbgt_else.21899:
	fmov	%f0, %f3
fbgt_cont.21900:
	j	fbgt_cont.21882
fbgt_else.21897:
	fmov	%f0, %f3
fbgt_cont.21898:
	j	fbgt_cont.21882
fbgt_else.21895:
	fmov	%f0, %f3
fbgt_cont.21896:
	j	fbgt_cont.21882
fbgt_else.21893:
	fmov	%f0, %f3
fbgt_cont.21894:
	j	fbgt_cont.21882
fbgt_else.21891:
	fmov	%f0, %f3
fbgt_cont.21892:
	j	fbgt_cont.21882
fbgt_else.21889:
	fmov	%f0, %f3
fbgt_cont.21890:
	j	fbgt_cont.21882
fbgt_else.21887:
	fmov	%f0, %f3
fbgt_cont.21888:
	j	fbgt_cont.21882
fbgt_else.21885:
	fmov	%f0, %f3
fbgt_cont.21886:
	j	fbgt_cont.21882
fbgt_else.21883:
	fmov	%f0, %f3
fbgt_cont.21884:
	j	fbgt_cont.21882
fbgt_else.21881:
	fmov	%f0, %f2
fbgt_cont.21882:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	fblt	%f1, %f2, fbgt_else.21909
	fblt	%f1, %f0, fbgt_else.21911
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.21913
	fblt	%f1, %f0, fbgt_else.21915
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.21910
fbgt_else.21915:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.21916:
	j	fbgt_cont.21910
fbgt_else.21913:
	fmov	%f0, %f1
fbgt_cont.21914:
	j	fbgt_cont.21910
fbgt_else.21911:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.21917
	fblt	%f1, %f0, fbgt_else.21919
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.21910
fbgt_else.21919:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.21920:
	j	fbgt_cont.21910
fbgt_else.21917:
	fmov	%f0, %f1
fbgt_cont.21918:
fbgt_cont.21912:
	j	fbgt_cont.21910
fbgt_else.21909:
	fmov	%f0, %f1
fbgt_cont.21910:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.21921
	addi	%v0, %zero, 0
	j	fbgt_cont.21922
fbgt_else.21921:
	addi	%v0, %zero, 1
fbgt_cont.21922:
	fblt	%f0, %f1, fbgt_else.21923
	fsub	%f0, %f0, %f1
	j	fbgt_cont.21924
fbgt_else.21923:
fbgt_cont.21924:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.21925
	beqi	%v0, 0, bnei_else.21927
	addi	%v0, %zero, 0
	j	fbgt_cont.21926
bnei_else.21927:
	addi	%v0, %zero, 1
bnei_cont.21928:
	j	fbgt_cont.21926
fbgt_else.21925:
fbgt_cont.21926:
	fblt	%f0, %f2, fbgt_else.21929
	fsub	%f0, %f1, %f0
	j	fbgt_cont.21930
fbgt_else.21929:
fbgt_cont.21930:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.21931
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.21932
fbgt_else.21931:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.21932:
	beqi	%v0, 0, bnei_else.21933
	jr	%ra
bnei_else.21933:
	fneg	%f0, %f0
	jr	%ra
sin.2637:
	flw	%f1, 495(%zero)
	flw	%f2, 470(%zero)
	fblt	%f0, %f2, fbgt_else.21994
	addi	%v0, %zero, 1
	j	fbgt_cont.21995
fbgt_else.21994:
	addi	%v0, %zero, 0
fbgt_cont.21995:
	fabs	%f0, %f0
	flw	%f2, 494(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.21996
	flw	%f3, 493(%zero)
	fblt	%f0, %f3, fbgt_else.21998
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.22000
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.22002
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.22004
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.22006
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.22008
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.22010
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.22012
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.22014
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.22016
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.22018
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.22020
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.22022
	flw	%f3, 480(%zero)
	fmov	%f1, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.21997
fbgt_else.22022:
	fmov	%f0, %f3
fbgt_cont.22023:
	j	fbgt_cont.21997
fbgt_else.22020:
	fmov	%f0, %f3
fbgt_cont.22021:
	j	fbgt_cont.21997
fbgt_else.22018:
	fmov	%f0, %f3
fbgt_cont.22019:
	j	fbgt_cont.21997
fbgt_else.22016:
	fmov	%f0, %f3
fbgt_cont.22017:
	j	fbgt_cont.21997
fbgt_else.22014:
	fmov	%f0, %f3
fbgt_cont.22015:
	j	fbgt_cont.21997
fbgt_else.22012:
	fmov	%f0, %f3
fbgt_cont.22013:
	j	fbgt_cont.21997
fbgt_else.22010:
	fmov	%f0, %f3
fbgt_cont.22011:
	j	fbgt_cont.21997
fbgt_else.22008:
	fmov	%f0, %f3
fbgt_cont.22009:
	j	fbgt_cont.21997
fbgt_else.22006:
	fmov	%f0, %f3
fbgt_cont.22007:
	j	fbgt_cont.21997
fbgt_else.22004:
	fmov	%f0, %f3
fbgt_cont.22005:
	j	fbgt_cont.21997
fbgt_else.22002:
	fmov	%f0, %f3
fbgt_cont.22003:
	j	fbgt_cont.21997
fbgt_else.22000:
	fmov	%f0, %f3
fbgt_cont.22001:
	j	fbgt_cont.21997
fbgt_else.21998:
	fmov	%f0, %f3
fbgt_cont.21999:
	j	fbgt_cont.21997
fbgt_else.21996:
	fmov	%f0, %f2
fbgt_cont.21997:
	flw	%f1, 2(%sp)
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.22024
	fblt	%f1, %f0, fbgt_else.22026
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.22028
	fblt	%f1, %f0, fbgt_else.22030
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.22025
fbgt_else.22030:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.22031:
	j	fbgt_cont.22025
fbgt_else.22028:
	fmov	%f0, %f1
fbgt_cont.22029:
	j	fbgt_cont.22025
fbgt_else.22026:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.22032
	fblt	%f1, %f0, fbgt_else.22034
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.22025
fbgt_else.22034:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.22035:
	j	fbgt_cont.22025
fbgt_else.22032:
	fmov	%f0, %f1
fbgt_cont.22033:
fbgt_cont.22027:
	j	fbgt_cont.22025
fbgt_else.22024:
	fmov	%f0, %f1
fbgt_cont.22025:
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.22036
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.22038
	addi	%v0, %zero, 0
	j	fbgt_cont.22037
bnei_else.22038:
	addi	%v0, %zero, 1
bnei_cont.22039:
	j	fbgt_cont.22037
fbgt_else.22036:
	lw	%v0, 0(%sp)
fbgt_cont.22037:
	fblt	%f0, %f1, fbgt_else.22040
	fsub	%f0, %f0, %f1
	j	fbgt_cont.22041
fbgt_else.22040:
fbgt_cont.22041:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.22042
	fsub	%f0, %f1, %f0
	j	fbgt_cont.22043
fbgt_else.22042:
fbgt_cont.22043:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.22044
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.22045
fbgt_else.22044:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.22045:
	beqi	%v0, 0, bnei_else.22046
	jr	%ra
bnei_else.22046:
	fneg	%f0, %f0
	jr	%ra
atan.2639:
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.22047
	addi	%v0, %zero, 1
	j	fbgt_cont.22048
fbgt_else.22047:
	addi	%v0, %zero, 0
fbgt_cont.22048:
	fabs	%f1, %f0
	flw	%f2, 469(%zero)
	fblt	%f1, %f2, fbgt_else.22049
	flw	%f0, 462(%zero)
	fblt	%f1, %f0, fbgt_else.22050
	flw	%f0, 479(%zero)
	flw	%f2, 474(%zero)
	fdiv	%f1, %f2, %f1
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	flw	%f5, 468(%zero)
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f5, %f1, %f5
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fadd	%f5, %f5, %f6
	flw	%f6, 466(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f5, %f5, %f6
	flw	%f6, 465(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fsub	%f2, %f5, %f2
	flw	%f5, 463(%zero)
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	j	fbgt_cont.22051
fbgt_else.22050:
	flw	%f0, 478(%zero)
	flw	%f2, 474(%zero)
	fsub	%f3, %f1, %f2
	fadd	%f1, %f1, %f2
	fdiv	%f1, %f3, %f1
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	flw	%f5, 468(%zero)
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f5, %f1, %f5
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fadd	%f5, %f5, %f6
	flw	%f6, 466(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f5, %f5, %f6
	flw	%f6, 465(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fsub	%f2, %f5, %f2
	flw	%f5, 463(%zero)
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
	fadd	%f0, %f0, %f1
fbgt_cont.22051:
	beqi	%v0, 0, bnei_else.22052
	jr	%ra
bnei_else.22052:
	fneg	%f0, %f0
	jr	%ra
fbgt_else.22049:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	flw	%f4, 468(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 467(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 466(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 465(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 464(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 463(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
print_int_sub1.2641:
	blti	%v0, 10, bgti_else.22053
	blti	%v0, 20, bgti_else.22054
	blti	%v0, 30, bgti_else.22055
	blti	%v0, 40, bgti_else.22056
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	blti	%v0, 10, bgti_else.22057
	blti	%v0, 20, bgti_else.22058
	blti	%v0, 30, bgti_else.22059
	blti	%v0, 40, bgti_else.22060
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	blti	%v0, 10, bgti_else.22061
	blti	%v0, 20, bgti_else.22062
	blti	%v0, 30, bgti_else.22063
	blti	%v0, 40, bgti_else.22064
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	blti	%v0, 10, bgti_else.22065
	blti	%v0, 20, bgti_else.22066
	blti	%v0, 30, bgti_else.22067
	blti	%v0, 40, bgti_else.22068
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	j	print_int_sub1.2641
bgti_else.22068:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.22067:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.22066:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.22065:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.22064:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.22063:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.22062:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.22061:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.22060:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.22059:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.22058:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.22057:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.22056:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.22055:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.22054:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.22053:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2644:
	blti	%v0, 10, bgti_else.22069
	blti	%v0, 20, bgti_else.22070
	blti	%v0, 30, bgti_else.22071
	blti	%v0, 40, bgti_else.22072
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22073
	blti	%v0, 20, bgti_else.22074
	blti	%v0, 30, bgti_else.22075
	blti	%v0, 40, bgti_else.22076
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22077
	blti	%v0, 20, bgti_else.22078
	blti	%v0, 30, bgti_else.22079
	blti	%v0, 40, bgti_else.22080
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22081
	blti	%v0, 20, bgti_else.22082
	blti	%v0, 30, bgti_else.22083
	blti	%v0, 40, bgti_else.22084
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22085
	blti	%v0, 20, bgti_else.22086
	blti	%v0, 30, bgti_else.22087
	blti	%v0, 40, bgti_else.22088
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22089
	blti	%v0, 20, bgti_else.22090
	blti	%v0, 30, bgti_else.22091
	blti	%v0, 40, bgti_else.22092
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22093
	blti	%v0, 20, bgti_else.22094
	blti	%v0, 30, bgti_else.22095
	blti	%v0, 40, bgti_else.22096
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22097
	blti	%v0, 20, bgti_else.22098
	blti	%v0, 30, bgti_else.22099
	blti	%v0, 40, bgti_else.22100
	addi	%v0, %v0, -40
	j	print_int_sub2.2644
bgti_else.22100:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22099:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22098:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22097:
	jr	%ra
bgti_else.22096:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22095:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22094:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22093:
	jr	%ra
bgti_else.22092:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22091:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22090:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22089:
	jr	%ra
bgti_else.22088:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22087:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22086:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22085:
	jr	%ra
bgti_else.22084:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22083:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22082:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22081:
	jr	%ra
bgti_else.22080:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22079:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22078:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22077:
	jr	%ra
bgti_else.22076:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22075:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22074:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22073:
	jr	%ra
bgti_else.22072:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22071:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22070:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22069:
	jr	%ra
print_int.2646:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.22984
	blti	%v0, 20, bgti_else.22986
	blti	%v0, 30, bgti_else.22988
	blti	%v0, 40, bgti_else.22990
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.22992
	blti	%v1, 20, bgti_else.22994
	blti	%v1, 30, bgti_else.22996
	blti	%v1, 40, bgti_else.22998
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23000
	blti	%v1, 20, bgti_else.23002
	blti	%v1, 30, bgti_else.23004
	blti	%v1, 40, bgti_else.23006
	addi	%v1, %v1, -40
	addi	%a0, %zero, 12
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2641
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.22985
bgti_else.23006:
	addi	%v0, %zero, 11
bgti_cont.23007:
	j	bgti_cont.22985
bgti_else.23004:
	addi	%v0, %zero, 10
bgti_cont.23005:
	j	bgti_cont.22985
bgti_else.23002:
	addi	%v0, %zero, 9
bgti_cont.23003:
	j	bgti_cont.22985
bgti_else.23000:
	addi	%v0, %zero, 8
bgti_cont.23001:
	j	bgti_cont.22985
bgti_else.22998:
	addi	%v0, %zero, 7
bgti_cont.22999:
	j	bgti_cont.22985
bgti_else.22996:
	addi	%v0, %zero, 6
bgti_cont.22997:
	j	bgti_cont.22985
bgti_else.22994:
	addi	%v0, %zero, 5
bgti_cont.22995:
	j	bgti_cont.22985
bgti_else.22992:
	addi	%v0, %zero, 4
bgti_cont.22993:
	j	bgti_cont.22985
bgti_else.22990:
	addi	%v0, %zero, 3
bgti_cont.22991:
	j	bgti_cont.22985
bgti_else.22988:
	addi	%v0, %zero, 2
bgti_cont.22989:
	j	bgti_cont.22985
bgti_else.22986:
	addi	%v0, %zero, 1
bgti_cont.22987:
	j	bgti_cont.22985
bgti_else.22984:
	addi	%v0, %zero, 0
bgti_cont.22985:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.23008
	blti	%v1, 20, bgti_else.23010
	blti	%v1, 30, bgti_else.23012
	blti	%v1, 40, bgti_else.23014
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23016
	blti	%v1, 20, bgti_else.23018
	blti	%v1, 30, bgti_else.23020
	blti	%v1, 40, bgti_else.23022
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23024
	blti	%v1, 20, bgti_else.23026
	blti	%v1, 30, bgti_else.23028
	blti	%v1, 40, bgti_else.23030
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23032
	blti	%v1, 20, bgti_else.23034
	blti	%v1, 30, bgti_else.23036
	blti	%v1, 40, bgti_else.23038
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23040
	blti	%v1, 20, bgti_else.23042
	blti	%v1, 30, bgti_else.23044
	blti	%v1, 40, bgti_else.23046
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23048
	blti	%v1, 20, bgti_else.23050
	blti	%v1, 30, bgti_else.23052
	blti	%v1, 40, bgti_else.23054
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23056
	blti	%v1, 20, bgti_else.23058
	blti	%v1, 30, bgti_else.23060
	blti	%v1, 40, bgti_else.23062
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2644
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.23009
bgti_else.23062:
	addi	%v0, %v1, -30
bgti_cont.23063:
	j	bgti_cont.23009
bgti_else.23060:
	addi	%v0, %v1, -20
bgti_cont.23061:
	j	bgti_cont.23009
bgti_else.23058:
	addi	%v0, %v1, -10
bgti_cont.23059:
	j	bgti_cont.23009
bgti_else.23056:
	add	%v0, %zero, %v1
bgti_cont.23057:
	j	bgti_cont.23009
bgti_else.23054:
	addi	%v0, %v1, -30
bgti_cont.23055:
	j	bgti_cont.23009
bgti_else.23052:
	addi	%v0, %v1, -20
bgti_cont.23053:
	j	bgti_cont.23009
bgti_else.23050:
	addi	%v0, %v1, -10
bgti_cont.23051:
	j	bgti_cont.23009
bgti_else.23048:
	add	%v0, %zero, %v1
bgti_cont.23049:
	j	bgti_cont.23009
bgti_else.23046:
	addi	%v0, %v1, -30
bgti_cont.23047:
	j	bgti_cont.23009
bgti_else.23044:
	addi	%v0, %v1, -20
bgti_cont.23045:
	j	bgti_cont.23009
bgti_else.23042:
	addi	%v0, %v1, -10
bgti_cont.23043:
	j	bgti_cont.23009
bgti_else.23040:
	add	%v0, %zero, %v1
bgti_cont.23041:
	j	bgti_cont.23009
bgti_else.23038:
	addi	%v0, %v1, -30
bgti_cont.23039:
	j	bgti_cont.23009
bgti_else.23036:
	addi	%v0, %v1, -20
bgti_cont.23037:
	j	bgti_cont.23009
bgti_else.23034:
	addi	%v0, %v1, -10
bgti_cont.23035:
	j	bgti_cont.23009
bgti_else.23032:
	add	%v0, %zero, %v1
bgti_cont.23033:
	j	bgti_cont.23009
bgti_else.23030:
	addi	%v0, %v1, -30
bgti_cont.23031:
	j	bgti_cont.23009
bgti_else.23028:
	addi	%v0, %v1, -20
bgti_cont.23029:
	j	bgti_cont.23009
bgti_else.23026:
	addi	%v0, %v1, -10
bgti_cont.23027:
	j	bgti_cont.23009
bgti_else.23024:
	add	%v0, %zero, %v1
bgti_cont.23025:
	j	bgti_cont.23009
bgti_else.23022:
	addi	%v0, %v1, -30
bgti_cont.23023:
	j	bgti_cont.23009
bgti_else.23020:
	addi	%v0, %v1, -20
bgti_cont.23021:
	j	bgti_cont.23009
bgti_else.23018:
	addi	%v0, %v1, -10
bgti_cont.23019:
	j	bgti_cont.23009
bgti_else.23016:
	add	%v0, %zero, %v1
bgti_cont.23017:
	j	bgti_cont.23009
bgti_else.23014:
	addi	%v0, %v1, -30
bgti_cont.23015:
	j	bgti_cont.23009
bgti_else.23012:
	addi	%v0, %v1, -20
bgti_cont.23013:
	j	bgti_cont.23009
bgti_else.23010:
	addi	%v0, %v1, -10
bgti_cont.23011:
	j	bgti_cont.23009
bgti_else.23008:
	add	%v0, %zero, %v1
bgti_cont.23009:
	lw	%v1, 1(%sp)
	blt	%zero, %v1, bgt_else.23064
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.23064:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.23065
	blti	%v1, 20, bgti_else.23067
	blti	%v1, 30, bgti_else.23069
	blti	%v1, 40, bgti_else.23071
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.23073
	blti	%a0, 20, bgti_else.23075
	blti	%a0, 30, bgti_else.23077
	blti	%a0, 40, bgti_else.23079
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.23081
	blti	%a0, 20, bgti_else.23083
	blti	%a0, 30, bgti_else.23085
	blti	%a0, 40, bgti_else.23087
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2641
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.23066
bgti_else.23087:
	addi	%v0, %zero, 11
bgti_cont.23088:
	j	bgti_cont.23066
bgti_else.23085:
	addi	%v0, %zero, 10
bgti_cont.23086:
	j	bgti_cont.23066
bgti_else.23083:
	addi	%v0, %zero, 9
bgti_cont.23084:
	j	bgti_cont.23066
bgti_else.23081:
	addi	%v0, %zero, 8
bgti_cont.23082:
	j	bgti_cont.23066
bgti_else.23079:
	addi	%v0, %zero, 7
bgti_cont.23080:
	j	bgti_cont.23066
bgti_else.23077:
	addi	%v0, %zero, 6
bgti_cont.23078:
	j	bgti_cont.23066
bgti_else.23075:
	addi	%v0, %zero, 5
bgti_cont.23076:
	j	bgti_cont.23066
bgti_else.23073:
	addi	%v0, %zero, 4
bgti_cont.23074:
	j	bgti_cont.23066
bgti_else.23071:
	addi	%v0, %zero, 3
bgti_cont.23072:
	j	bgti_cont.23066
bgti_else.23069:
	addi	%v0, %zero, 2
bgti_cont.23070:
	j	bgti_cont.23066
bgti_else.23067:
	addi	%v0, %zero, 1
bgti_cont.23068:
	j	bgti_cont.23066
bgti_else.23065:
	addi	%v0, %zero, 0
bgti_cont.23066:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.23089
	blti	%v1, 20, bgti_else.23091
	blti	%v1, 30, bgti_else.23093
	blti	%v1, 40, bgti_else.23095
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23097
	blti	%v1, 20, bgti_else.23099
	blti	%v1, 30, bgti_else.23101
	blti	%v1, 40, bgti_else.23103
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23105
	blti	%v1, 20, bgti_else.23107
	blti	%v1, 30, bgti_else.23109
	blti	%v1, 40, bgti_else.23111
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23113
	blti	%v1, 20, bgti_else.23115
	blti	%v1, 30, bgti_else.23117
	blti	%v1, 40, bgti_else.23119
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23121
	blti	%v1, 20, bgti_else.23123
	blti	%v1, 30, bgti_else.23125
	blti	%v1, 40, bgti_else.23127
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23129
	blti	%v1, 20, bgti_else.23131
	blti	%v1, 30, bgti_else.23133
	blti	%v1, 40, bgti_else.23135
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23137
	blti	%v1, 20, bgti_else.23139
	blti	%v1, 30, bgti_else.23141
	blti	%v1, 40, bgti_else.23143
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2644
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.23090
bgti_else.23143:
	addi	%v0, %v1, -30
bgti_cont.23144:
	j	bgti_cont.23090
bgti_else.23141:
	addi	%v0, %v1, -20
bgti_cont.23142:
	j	bgti_cont.23090
bgti_else.23139:
	addi	%v0, %v1, -10
bgti_cont.23140:
	j	bgti_cont.23090
bgti_else.23137:
	add	%v0, %zero, %v1
bgti_cont.23138:
	j	bgti_cont.23090
bgti_else.23135:
	addi	%v0, %v1, -30
bgti_cont.23136:
	j	bgti_cont.23090
bgti_else.23133:
	addi	%v0, %v1, -20
bgti_cont.23134:
	j	bgti_cont.23090
bgti_else.23131:
	addi	%v0, %v1, -10
bgti_cont.23132:
	j	bgti_cont.23090
bgti_else.23129:
	add	%v0, %zero, %v1
bgti_cont.23130:
	j	bgti_cont.23090
bgti_else.23127:
	addi	%v0, %v1, -30
bgti_cont.23128:
	j	bgti_cont.23090
bgti_else.23125:
	addi	%v0, %v1, -20
bgti_cont.23126:
	j	bgti_cont.23090
bgti_else.23123:
	addi	%v0, %v1, -10
bgti_cont.23124:
	j	bgti_cont.23090
bgti_else.23121:
	add	%v0, %zero, %v1
bgti_cont.23122:
	j	bgti_cont.23090
bgti_else.23119:
	addi	%v0, %v1, -30
bgti_cont.23120:
	j	bgti_cont.23090
bgti_else.23117:
	addi	%v0, %v1, -20
bgti_cont.23118:
	j	bgti_cont.23090
bgti_else.23115:
	addi	%v0, %v1, -10
bgti_cont.23116:
	j	bgti_cont.23090
bgti_else.23113:
	add	%v0, %zero, %v1
bgti_cont.23114:
	j	bgti_cont.23090
bgti_else.23111:
	addi	%v0, %v1, -30
bgti_cont.23112:
	j	bgti_cont.23090
bgti_else.23109:
	addi	%v0, %v1, -20
bgti_cont.23110:
	j	bgti_cont.23090
bgti_else.23107:
	addi	%v0, %v1, -10
bgti_cont.23108:
	j	bgti_cont.23090
bgti_else.23105:
	add	%v0, %zero, %v1
bgti_cont.23106:
	j	bgti_cont.23090
bgti_else.23103:
	addi	%v0, %v1, -30
bgti_cont.23104:
	j	bgti_cont.23090
bgti_else.23101:
	addi	%v0, %v1, -20
bgti_cont.23102:
	j	bgti_cont.23090
bgti_else.23099:
	addi	%v0, %v1, -10
bgti_cont.23100:
	j	bgti_cont.23090
bgti_else.23097:
	add	%v0, %zero, %v1
bgti_cont.23098:
	j	bgti_cont.23090
bgti_else.23095:
	addi	%v0, %v1, -30
bgti_cont.23096:
	j	bgti_cont.23090
bgti_else.23093:
	addi	%v0, %v1, -20
bgti_cont.23094:
	j	bgti_cont.23090
bgti_else.23091:
	addi	%v0, %v1, -10
bgti_cont.23092:
	j	bgti_cont.23090
bgti_else.23089:
	add	%v0, %zero, %v1
bgti_cont.23090:
	lw	%v1, 3(%sp)
	blt	%zero, %v1, bgt_else.23145
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.23145:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.23146
	blti	%v1, 20, bgti_else.23148
	blti	%v1, 30, bgti_else.23150
	blti	%v1, 40, bgti_else.23152
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23154
	blti	%v1, 20, bgti_else.23156
	blti	%v1, 30, bgti_else.23158
	blti	%v1, 40, bgti_else.23160
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23162
	blti	%v1, 20, bgti_else.23164
	blti	%v1, 30, bgti_else.23166
	blti	%v1, 40, bgti_else.23168
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23170
	blti	%v1, 20, bgti_else.23172
	blti	%v1, 30, bgti_else.23174
	blti	%v1, 40, bgti_else.23176
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23178
	blti	%v1, 20, bgti_else.23180
	blti	%v1, 30, bgti_else.23182
	blti	%v1, 40, bgti_else.23184
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23186
	blti	%v1, 20, bgti_else.23188
	blti	%v1, 30, bgti_else.23190
	blti	%v1, 40, bgti_else.23192
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23194
	blti	%v1, 20, bgti_else.23196
	blti	%v1, 30, bgti_else.23198
	blti	%v1, 40, bgti_else.23200
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2644
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.23147
bgti_else.23200:
	addi	%v0, %v1, -30
bgti_cont.23201:
	j	bgti_cont.23147
bgti_else.23198:
	addi	%v0, %v1, -20
bgti_cont.23199:
	j	bgti_cont.23147
bgti_else.23196:
	addi	%v0, %v1, -10
bgti_cont.23197:
	j	bgti_cont.23147
bgti_else.23194:
	add	%v0, %zero, %v1
bgti_cont.23195:
	j	bgti_cont.23147
bgti_else.23192:
	addi	%v0, %v1, -30
bgti_cont.23193:
	j	bgti_cont.23147
bgti_else.23190:
	addi	%v0, %v1, -20
bgti_cont.23191:
	j	bgti_cont.23147
bgti_else.23188:
	addi	%v0, %v1, -10
bgti_cont.23189:
	j	bgti_cont.23147
bgti_else.23186:
	add	%v0, %zero, %v1
bgti_cont.23187:
	j	bgti_cont.23147
bgti_else.23184:
	addi	%v0, %v1, -30
bgti_cont.23185:
	j	bgti_cont.23147
bgti_else.23182:
	addi	%v0, %v1, -20
bgti_cont.23183:
	j	bgti_cont.23147
bgti_else.23180:
	addi	%v0, %v1, -10
bgti_cont.23181:
	j	bgti_cont.23147
bgti_else.23178:
	add	%v0, %zero, %v1
bgti_cont.23179:
	j	bgti_cont.23147
bgti_else.23176:
	addi	%v0, %v1, -30
bgti_cont.23177:
	j	bgti_cont.23147
bgti_else.23174:
	addi	%v0, %v1, -20
bgti_cont.23175:
	j	bgti_cont.23147
bgti_else.23172:
	addi	%v0, %v1, -10
bgti_cont.23173:
	j	bgti_cont.23147
bgti_else.23170:
	add	%v0, %zero, %v1
bgti_cont.23171:
	j	bgti_cont.23147
bgti_else.23168:
	addi	%v0, %v1, -30
bgti_cont.23169:
	j	bgti_cont.23147
bgti_else.23166:
	addi	%v0, %v1, -20
bgti_cont.23167:
	j	bgti_cont.23147
bgti_else.23164:
	addi	%v0, %v1, -10
bgti_cont.23165:
	j	bgti_cont.23147
bgti_else.23162:
	add	%v0, %zero, %v1
bgti_cont.23163:
	j	bgti_cont.23147
bgti_else.23160:
	addi	%v0, %v1, -30
bgti_cont.23161:
	j	bgti_cont.23147
bgti_else.23158:
	addi	%v0, %v1, -20
bgti_cont.23159:
	j	bgti_cont.23147
bgti_else.23156:
	addi	%v0, %v1, -10
bgti_cont.23157:
	j	bgti_cont.23147
bgti_else.23154:
	add	%v0, %zero, %v1
bgti_cont.23155:
	j	bgti_cont.23147
bgti_else.23152:
	addi	%v0, %v1, -30
bgti_cont.23153:
	j	bgti_cont.23147
bgti_else.23150:
	addi	%v0, %v1, -20
bgti_cont.23151:
	j	bgti_cont.23147
bgti_else.23148:
	addi	%v0, %v1, -10
bgti_cont.23149:
	j	bgti_cont.23147
bgti_else.23146:
	add	%v0, %zero, %v1
bgti_cont.23147:
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
read_screen_settings.2775:
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
	flw	%f1, 461(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 495(%zero)
	fabs	%f3, %f0
	flw	%f4, 494(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f3, 3(%sp)
	fsw	%f4, 4(%sp)
	fblt	%f3, %f4, fbgt_else.23781
	flw	%f5, 493(%zero)
	fblt	%f3, %f5, fbgt_else.23783
	flw	%f5, 492(%zero)
	fblt	%f3, %f5, fbgt_else.23785
	flw	%f5, 491(%zero)
	fblt	%f3, %f5, fbgt_else.23787
	flw	%f5, 490(%zero)
	fblt	%f3, %f5, fbgt_else.23789
	flw	%f5, 489(%zero)
	fblt	%f3, %f5, fbgt_else.23791
	flw	%f5, 488(%zero)
	fblt	%f3, %f5, fbgt_else.23793
	flw	%f5, 487(%zero)
	fblt	%f3, %f5, fbgt_else.23795
	flw	%f5, 486(%zero)
	fblt	%f3, %f5, fbgt_else.23797
	flw	%f5, 485(%zero)
	fblt	%f3, %f5, fbgt_else.23799
	flw	%f5, 484(%zero)
	fblt	%f3, %f5, fbgt_else.23801
	flw	%f5, 483(%zero)
	fblt	%f3, %f5, fbgt_else.23803
	flw	%f5, 482(%zero)
	fblt	%f3, %f5, fbgt_else.23805
	flw	%f5, 481(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	fbgt_cont.23782
fbgt_else.23805:
	fmov	%f0, %f5
fbgt_cont.23806:
	j	fbgt_cont.23782
fbgt_else.23803:
	fmov	%f0, %f5
fbgt_cont.23804:
	j	fbgt_cont.23782
fbgt_else.23801:
	fmov	%f0, %f5
fbgt_cont.23802:
	j	fbgt_cont.23782
fbgt_else.23799:
	fmov	%f0, %f5
fbgt_cont.23800:
	j	fbgt_cont.23782
fbgt_else.23797:
	fmov	%f0, %f5
fbgt_cont.23798:
	j	fbgt_cont.23782
fbgt_else.23795:
	fmov	%f0, %f5
fbgt_cont.23796:
	j	fbgt_cont.23782
fbgt_else.23793:
	fmov	%f0, %f5
fbgt_cont.23794:
	j	fbgt_cont.23782
fbgt_else.23791:
	fmov	%f0, %f5
fbgt_cont.23792:
	j	fbgt_cont.23782
fbgt_else.23789:
	fmov	%f0, %f5
fbgt_cont.23790:
	j	fbgt_cont.23782
fbgt_else.23787:
	fmov	%f0, %f5
fbgt_cont.23788:
	j	fbgt_cont.23782
fbgt_else.23785:
	fmov	%f0, %f5
fbgt_cont.23786:
	j	fbgt_cont.23782
fbgt_else.23783:
	fmov	%f0, %f5
fbgt_cont.23784:
	j	fbgt_cont.23782
fbgt_else.23781:
	fmov	%f0, %f4
fbgt_cont.23782:
	flw	%f1, 3(%sp)
	flw	%f2, 4(%sp)
	fblt	%f1, %f2, fbgt_else.23807
	fblt	%f1, %f0, fbgt_else.23809
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	fbgt_cont.23808
fbgt_else.23809:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
fbgt_cont.23810:
	j	fbgt_cont.23808
fbgt_else.23807:
	fmov	%f0, %f1
fbgt_cont.23808:
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.23811
	addi	%v0, %zero, 0
	j	fbgt_cont.23812
fbgt_else.23811:
	addi	%v0, %zero, 1
fbgt_cont.23812:
	fblt	%f0, %f1, fbgt_else.23813
	fsub	%f0, %f0, %f1
	j	fbgt_cont.23814
fbgt_else.23813:
fbgt_cont.23814:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.23815
	beqi	%v0, 0, bnei_else.23817
	addi	%v0, %zero, 0
	j	fbgt_cont.23816
bnei_else.23817:
	addi	%v0, %zero, 1
bnei_cont.23818:
	j	fbgt_cont.23816
fbgt_else.23815:
fbgt_cont.23816:
	fblt	%f0, %f2, fbgt_else.23819
	fsub	%f0, %f1, %f0
	j	fbgt_cont.23820
fbgt_else.23819:
fbgt_cont.23820:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.23821
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.23822
fbgt_else.23821:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.23822:
	beqi	%v0, 0, bnei_else.23823
	j	bnei_cont.23824
bnei_else.23823:
	fneg	%f0, %f0
bnei_cont.23824:
	flw	%f4, 470(%zero)
	flw	%f5, 1(%sp)
	fblt	%f5, %f4, fbgt_else.23825
	addi	%v0, %zero, 1
	j	fbgt_cont.23826
fbgt_else.23825:
	addi	%v0, %zero, 0
fbgt_cont.23826:
	fabs	%f5, %f5
	flw	%f6, 4(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f4, 6(%sp)
	fsw	%f3, 7(%sp)
	fsw	%f2, 8(%sp)
	sw	%v0, 9(%sp)
	fsw	%f5, 10(%sp)
	fblt	%f5, %f6, fbgt_else.23827
	flw	%f7, 493(%zero)
	fblt	%f5, %f7, fbgt_else.23829
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.23831
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.23833
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.23835
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.23837
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.23839
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.23841
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.23843
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.23845
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.23847
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.23849
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.23851
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	fbgt_cont.23828
fbgt_else.23851:
	fmov	%f0, %f7
fbgt_cont.23852:
	j	fbgt_cont.23828
fbgt_else.23849:
	fmov	%f0, %f7
fbgt_cont.23850:
	j	fbgt_cont.23828
fbgt_else.23847:
	fmov	%f0, %f7
fbgt_cont.23848:
	j	fbgt_cont.23828
fbgt_else.23845:
	fmov	%f0, %f7
fbgt_cont.23846:
	j	fbgt_cont.23828
fbgt_else.23843:
	fmov	%f0, %f7
fbgt_cont.23844:
	j	fbgt_cont.23828
fbgt_else.23841:
	fmov	%f0, %f7
fbgt_cont.23842:
	j	fbgt_cont.23828
fbgt_else.23839:
	fmov	%f0, %f7
fbgt_cont.23840:
	j	fbgt_cont.23828
fbgt_else.23837:
	fmov	%f0, %f7
fbgt_cont.23838:
	j	fbgt_cont.23828
fbgt_else.23835:
	fmov	%f0, %f7
fbgt_cont.23836:
	j	fbgt_cont.23828
fbgt_else.23833:
	fmov	%f0, %f7
fbgt_cont.23834:
	j	fbgt_cont.23828
fbgt_else.23831:
	fmov	%f0, %f7
fbgt_cont.23832:
	j	fbgt_cont.23828
fbgt_else.23829:
	fmov	%f0, %f7
fbgt_cont.23830:
	j	fbgt_cont.23828
fbgt_else.23827:
	fmov	%f0, %f6
fbgt_cont.23828:
	flw	%f1, 10(%sp)
	flw	%f2, 4(%sp)
	fblt	%f1, %f2, fbgt_else.23853
	fblt	%f1, %f0, fbgt_else.23855
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	fbgt_cont.23854
fbgt_else.23855:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
fbgt_cont.23856:
	j	fbgt_cont.23854
fbgt_else.23853:
	fmov	%f0, %f1
fbgt_cont.23854:
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.23857
	lw	%v0, 9(%sp)
	beqi	%v0, 0, bnei_else.23859
	addi	%v0, %zero, 0
	j	fbgt_cont.23858
bnei_else.23859:
	addi	%v0, %zero, 1
bnei_cont.23860:
	j	fbgt_cont.23858
fbgt_else.23857:
	lw	%v0, 9(%sp)
fbgt_cont.23858:
	fblt	%f0, %f1, fbgt_else.23861
	fsub	%f0, %f0, %f1
	j	fbgt_cont.23862
fbgt_else.23861:
fbgt_cont.23862:
	flw	%f2, 8(%sp)
	fblt	%f0, %f2, fbgt_else.23863
	fsub	%f0, %f1, %f0
	j	fbgt_cont.23864
fbgt_else.23863:
fbgt_cont.23864:
	flw	%f3, 7(%sp)
	fblt	%f3, %f0, fbgt_else.23865
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.23866
fbgt_else.23865:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.23866:
	beqi	%v0, 0, bnei_else.23867
	j	bnei_cont.23868
bnei_else.23867:
	fneg	%f0, %f0
bnei_cont.23868:
	fsw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	fabs	%f1, %f0
	flw	%f2, 4(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f1, 13(%sp)
	fblt	%f1, %f2, fbgt_else.23869
	flw	%f3, 493(%zero)
	fblt	%f1, %f3, fbgt_else.23871
	flw	%f3, 492(%zero)
	fblt	%f1, %f3, fbgt_else.23873
	flw	%f3, 491(%zero)
	fblt	%f1, %f3, fbgt_else.23875
	flw	%f3, 490(%zero)
	fblt	%f1, %f3, fbgt_else.23877
	flw	%f3, 489(%zero)
	fblt	%f1, %f3, fbgt_else.23879
	flw	%f3, 488(%zero)
	fblt	%f1, %f3, fbgt_else.23881
	flw	%f3, 487(%zero)
	fblt	%f1, %f3, fbgt_else.23883
	flw	%f3, 486(%zero)
	fblt	%f1, %f3, fbgt_else.23885
	flw	%f3, 485(%zero)
	fblt	%f1, %f3, fbgt_else.23887
	flw	%f3, 484(%zero)
	fblt	%f1, %f3, fbgt_else.23889
	flw	%f3, 483(%zero)
	fblt	%f1, %f3, fbgt_else.23891
	flw	%f3, 482(%zero)
	fblt	%f1, %f3, fbgt_else.23893
	flw	%f3, 481(%zero)
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.23870
fbgt_else.23893:
	fmov	%f0, %f3
fbgt_cont.23894:
	j	fbgt_cont.23870
fbgt_else.23891:
	fmov	%f0, %f3
fbgt_cont.23892:
	j	fbgt_cont.23870
fbgt_else.23889:
	fmov	%f0, %f3
fbgt_cont.23890:
	j	fbgt_cont.23870
fbgt_else.23887:
	fmov	%f0, %f3
fbgt_cont.23888:
	j	fbgt_cont.23870
fbgt_else.23885:
	fmov	%f0, %f3
fbgt_cont.23886:
	j	fbgt_cont.23870
fbgt_else.23883:
	fmov	%f0, %f3
fbgt_cont.23884:
	j	fbgt_cont.23870
fbgt_else.23881:
	fmov	%f0, %f3
fbgt_cont.23882:
	j	fbgt_cont.23870
fbgt_else.23879:
	fmov	%f0, %f3
fbgt_cont.23880:
	j	fbgt_cont.23870
fbgt_else.23877:
	fmov	%f0, %f3
fbgt_cont.23878:
	j	fbgt_cont.23870
fbgt_else.23875:
	fmov	%f0, %f3
fbgt_cont.23876:
	j	fbgt_cont.23870
fbgt_else.23873:
	fmov	%f0, %f3
fbgt_cont.23874:
	j	fbgt_cont.23870
fbgt_else.23871:
	fmov	%f0, %f3
fbgt_cont.23872:
	j	fbgt_cont.23870
fbgt_else.23869:
	fmov	%f0, %f2
fbgt_cont.23870:
	flw	%f1, 13(%sp)
	flw	%f2, 4(%sp)
	fblt	%f1, %f2, fbgt_else.23895
	fblt	%f1, %f0, fbgt_else.23897
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.23896
fbgt_else.23897:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.23898:
	j	fbgt_cont.23896
fbgt_else.23895:
	fmov	%f0, %f1
fbgt_cont.23896:
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.23899
	addi	%v0, %zero, 0
	j	fbgt_cont.23900
fbgt_else.23899:
	addi	%v0, %zero, 1
fbgt_cont.23900:
	fblt	%f0, %f1, fbgt_else.23901
	fsub	%f0, %f0, %f1
	j	fbgt_cont.23902
fbgt_else.23901:
fbgt_cont.23902:
	flw	%f2, 8(%sp)
	fblt	%f0, %f2, fbgt_else.23903
	beqi	%v0, 0, bnei_else.23905
	addi	%v0, %zero, 0
	j	fbgt_cont.23904
bnei_else.23905:
	addi	%v0, %zero, 1
bnei_cont.23906:
	j	fbgt_cont.23904
fbgt_else.23903:
fbgt_cont.23904:
	fblt	%f0, %f2, fbgt_else.23907
	fsub	%f0, %f1, %f0
	j	fbgt_cont.23908
fbgt_else.23907:
fbgt_cont.23908:
	flw	%f3, 7(%sp)
	fblt	%f3, %f0, fbgt_else.23909
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.23910
fbgt_else.23909:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.23910:
	beqi	%v0, 0, bnei_else.23911
	j	bnei_cont.23912
bnei_else.23911:
	fneg	%f0, %f0
bnei_cont.23912:
	flw	%f4, 12(%sp)
	flw	%f5, 6(%sp)
	fblt	%f4, %f5, fbgt_else.23913
	addi	%v0, %zero, 1
	j	fbgt_cont.23914
fbgt_else.23913:
	addi	%v0, %zero, 0
fbgt_cont.23914:
	fabs	%f4, %f4
	flw	%f6, 4(%sp)
	fsw	%f0, 14(%sp)
	sw	%v0, 15(%sp)
	fsw	%f4, 16(%sp)
	fblt	%f4, %f6, fbgt_else.23915
	flw	%f7, 493(%zero)
	fblt	%f4, %f7, fbgt_else.23917
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.23919
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.23921
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.23923
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.23925
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.23927
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.23929
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.23931
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.23933
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.23935
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.23937
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.23939
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	fbgt_cont.23916
fbgt_else.23939:
	fmov	%f0, %f7
fbgt_cont.23940:
	j	fbgt_cont.23916
fbgt_else.23937:
	fmov	%f0, %f7
fbgt_cont.23938:
	j	fbgt_cont.23916
fbgt_else.23935:
	fmov	%f0, %f7
fbgt_cont.23936:
	j	fbgt_cont.23916
fbgt_else.23933:
	fmov	%f0, %f7
fbgt_cont.23934:
	j	fbgt_cont.23916
fbgt_else.23931:
	fmov	%f0, %f7
fbgt_cont.23932:
	j	fbgt_cont.23916
fbgt_else.23929:
	fmov	%f0, %f7
fbgt_cont.23930:
	j	fbgt_cont.23916
fbgt_else.23927:
	fmov	%f0, %f7
fbgt_cont.23928:
	j	fbgt_cont.23916
fbgt_else.23925:
	fmov	%f0, %f7
fbgt_cont.23926:
	j	fbgt_cont.23916
fbgt_else.23923:
	fmov	%f0, %f7
fbgt_cont.23924:
	j	fbgt_cont.23916
fbgt_else.23921:
	fmov	%f0, %f7
fbgt_cont.23922:
	j	fbgt_cont.23916
fbgt_else.23919:
	fmov	%f0, %f7
fbgt_cont.23920:
	j	fbgt_cont.23916
fbgt_else.23917:
	fmov	%f0, %f7
fbgt_cont.23918:
	j	fbgt_cont.23916
fbgt_else.23915:
	fmov	%f0, %f6
fbgt_cont.23916:
	flw	%f1, 16(%sp)
	flw	%f2, 4(%sp)
	fblt	%f1, %f2, fbgt_else.23941
	fblt	%f1, %f0, fbgt_else.23943
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	fbgt_cont.23942
fbgt_else.23943:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
fbgt_cont.23944:
	j	fbgt_cont.23942
fbgt_else.23941:
	fmov	%f0, %f1
fbgt_cont.23942:
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.23945
	lw	%v0, 15(%sp)
	beqi	%v0, 0, bnei_else.23947
	addi	%v0, %zero, 0
	j	fbgt_cont.23946
bnei_else.23947:
	addi	%v0, %zero, 1
bnei_cont.23948:
	j	fbgt_cont.23946
fbgt_else.23945:
	lw	%v0, 15(%sp)
fbgt_cont.23946:
	fblt	%f0, %f1, fbgt_else.23949
	fsub	%f0, %f0, %f1
	j	fbgt_cont.23950
fbgt_else.23949:
fbgt_cont.23950:
	flw	%f2, 8(%sp)
	fblt	%f0, %f2, fbgt_else.23951
	fsub	%f0, %f1, %f0
	j	fbgt_cont.23952
fbgt_else.23951:
fbgt_cont.23952:
	flw	%f1, 7(%sp)
	fblt	%f1, %f0, fbgt_else.23953
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.23954
fbgt_else.23953:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.23954:
	beqi	%v0, 0, bnei_else.23955
	j	bnei_cont.23956
bnei_else.23955:
	fneg	%f0, %f0
bnei_cont.23956:
	flw	%f1, 5(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 460(%zero)
	fmul	%f2, %f2, %f3
	fsw	%f2, 171(%zero)
	flw	%f2, 459(%zero)
	flw	%f4, 11(%sp)
	fmul	%f2, %f4, %f2
	fsw	%f2, 172(%zero)
	flw	%f2, 14(%sp)
	fmul	%f5, %f1, %f2
	fmul	%f3, %f5, %f3
	fsw	%f3, 173(%zero)
	fsw	%f2, 165(%zero)
	flw	%f3, 6(%sp)
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
rotate_quadratic_matrix.2779:
	flw	%f0, 0(%v1)
	flw	%f1, 495(%zero)
	fabs	%f2, %f0
	flw	%f3, 494(%zero)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f1, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f3, 5(%sp)
	fblt	%f2, %f3, fbgt_else.25081
	flw	%f4, 493(%zero)
	fblt	%f2, %f4, fbgt_else.25083
	flw	%f4, 492(%zero)
	fblt	%f2, %f4, fbgt_else.25085
	flw	%f4, 491(%zero)
	fblt	%f2, %f4, fbgt_else.25087
	flw	%f4, 490(%zero)
	fblt	%f2, %f4, fbgt_else.25089
	flw	%f4, 489(%zero)
	fblt	%f2, %f4, fbgt_else.25091
	flw	%f4, 488(%zero)
	fblt	%f2, %f4, fbgt_else.25093
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.25095
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.25097
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.25099
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.25101
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.25103
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.25105
	flw	%f4, 481(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	fbgt_cont.25082
fbgt_else.25105:
	fmov	%f0, %f4
fbgt_cont.25106:
	j	fbgt_cont.25082
fbgt_else.25103:
	fmov	%f0, %f4
fbgt_cont.25104:
	j	fbgt_cont.25082
fbgt_else.25101:
	fmov	%f0, %f4
fbgt_cont.25102:
	j	fbgt_cont.25082
fbgt_else.25099:
	fmov	%f0, %f4
fbgt_cont.25100:
	j	fbgt_cont.25082
fbgt_else.25097:
	fmov	%f0, %f4
fbgt_cont.25098:
	j	fbgt_cont.25082
fbgt_else.25095:
	fmov	%f0, %f4
fbgt_cont.25096:
	j	fbgt_cont.25082
fbgt_else.25093:
	fmov	%f0, %f4
fbgt_cont.25094:
	j	fbgt_cont.25082
fbgt_else.25091:
	fmov	%f0, %f4
fbgt_cont.25092:
	j	fbgt_cont.25082
fbgt_else.25089:
	fmov	%f0, %f4
fbgt_cont.25090:
	j	fbgt_cont.25082
fbgt_else.25087:
	fmov	%f0, %f4
fbgt_cont.25088:
	j	fbgt_cont.25082
fbgt_else.25085:
	fmov	%f0, %f4
fbgt_cont.25086:
	j	fbgt_cont.25082
fbgt_else.25083:
	fmov	%f0, %f4
fbgt_cont.25084:
	j	fbgt_cont.25082
fbgt_else.25081:
	fmov	%f0, %f3
fbgt_cont.25082:
	flw	%f1, 4(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25107
	fblt	%f1, %f0, fbgt_else.25109
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	fbgt_cont.25108
fbgt_else.25109:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
fbgt_cont.25110:
	j	fbgt_cont.25108
fbgt_else.25107:
	fmov	%f0, %f1
fbgt_cont.25108:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25111
	addi	%v0, %zero, 0
	j	fbgt_cont.25112
fbgt_else.25111:
	addi	%v0, %zero, 1
fbgt_cont.25112:
	fblt	%f0, %f1, fbgt_else.25113
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25114
fbgt_else.25113:
fbgt_cont.25114:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.25115
	beqi	%v0, 0, bnei_else.25117
	addi	%v0, %zero, 0
	j	fbgt_cont.25116
bnei_else.25117:
	addi	%v0, %zero, 1
bnei_cont.25118:
	j	fbgt_cont.25116
fbgt_else.25115:
fbgt_cont.25116:
	fblt	%f0, %f2, fbgt_else.25119
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25120
fbgt_else.25119:
fbgt_cont.25120:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.25121
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.25122
fbgt_else.25121:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.25122:
	beqi	%v0, 0, bnei_else.25123
	j	bnei_cont.25124
bnei_else.25123:
	fneg	%f0, %f0
bnei_cont.25124:
	flw	%f4, 470(%zero)
	flw	%f5, 2(%sp)
	fblt	%f5, %f4, fbgt_else.25125
	addi	%v0, %zero, 1
	j	fbgt_cont.25126
fbgt_else.25125:
	addi	%v0, %zero, 0
fbgt_cont.25126:
	fabs	%f5, %f5
	flw	%f6, 5(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f4, 7(%sp)
	fsw	%f3, 8(%sp)
	fsw	%f2, 9(%sp)
	sw	%v0, 10(%sp)
	fsw	%f5, 11(%sp)
	fblt	%f5, %f6, fbgt_else.25127
	flw	%f7, 493(%zero)
	fblt	%f5, %f7, fbgt_else.25129
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.25131
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.25133
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.25135
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.25137
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.25139
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.25141
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.25143
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.25145
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.25147
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.25149
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.25151
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.25128
fbgt_else.25151:
	fmov	%f0, %f7
fbgt_cont.25152:
	j	fbgt_cont.25128
fbgt_else.25149:
	fmov	%f0, %f7
fbgt_cont.25150:
	j	fbgt_cont.25128
fbgt_else.25147:
	fmov	%f0, %f7
fbgt_cont.25148:
	j	fbgt_cont.25128
fbgt_else.25145:
	fmov	%f0, %f7
fbgt_cont.25146:
	j	fbgt_cont.25128
fbgt_else.25143:
	fmov	%f0, %f7
fbgt_cont.25144:
	j	fbgt_cont.25128
fbgt_else.25141:
	fmov	%f0, %f7
fbgt_cont.25142:
	j	fbgt_cont.25128
fbgt_else.25139:
	fmov	%f0, %f7
fbgt_cont.25140:
	j	fbgt_cont.25128
fbgt_else.25137:
	fmov	%f0, %f7
fbgt_cont.25138:
	j	fbgt_cont.25128
fbgt_else.25135:
	fmov	%f0, %f7
fbgt_cont.25136:
	j	fbgt_cont.25128
fbgt_else.25133:
	fmov	%f0, %f7
fbgt_cont.25134:
	j	fbgt_cont.25128
fbgt_else.25131:
	fmov	%f0, %f7
fbgt_cont.25132:
	j	fbgt_cont.25128
fbgt_else.25129:
	fmov	%f0, %f7
fbgt_cont.25130:
	j	fbgt_cont.25128
fbgt_else.25127:
	fmov	%f0, %f6
fbgt_cont.25128:
	flw	%f1, 11(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25153
	fblt	%f1, %f0, fbgt_else.25155
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.25154
fbgt_else.25155:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
fbgt_cont.25156:
	j	fbgt_cont.25154
fbgt_else.25153:
	fmov	%f0, %f1
fbgt_cont.25154:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25157
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.25159
	addi	%v0, %zero, 0
	j	fbgt_cont.25158
bnei_else.25159:
	addi	%v0, %zero, 1
bnei_cont.25160:
	j	fbgt_cont.25158
fbgt_else.25157:
	lw	%v0, 10(%sp)
fbgt_cont.25158:
	fblt	%f0, %f1, fbgt_else.25161
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25162
fbgt_else.25161:
fbgt_cont.25162:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25163
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25164
fbgt_else.25163:
fbgt_cont.25164:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.25165
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.25166
fbgt_else.25165:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.25166:
	beqi	%v0, 0, bnei_else.25167
	j	bnei_cont.25168
bnei_else.25167:
	fneg	%f0, %f0
bnei_cont.25168:
	lw	%v0, 1(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f4, 13(%sp)
	fsw	%f5, 14(%sp)
	fblt	%f5, %f6, fbgt_else.25169
	flw	%f7, 493(%zero)
	fblt	%f5, %f7, fbgt_else.25171
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.25173
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.25175
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.25177
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.25179
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.25181
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.25183
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.25185
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.25187
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.25189
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.25191
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.25193
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.25170
fbgt_else.25193:
	fmov	%f0, %f7
fbgt_cont.25194:
	j	fbgt_cont.25170
fbgt_else.25191:
	fmov	%f0, %f7
fbgt_cont.25192:
	j	fbgt_cont.25170
fbgt_else.25189:
	fmov	%f0, %f7
fbgt_cont.25190:
	j	fbgt_cont.25170
fbgt_else.25187:
	fmov	%f0, %f7
fbgt_cont.25188:
	j	fbgt_cont.25170
fbgt_else.25185:
	fmov	%f0, %f7
fbgt_cont.25186:
	j	fbgt_cont.25170
fbgt_else.25183:
	fmov	%f0, %f7
fbgt_cont.25184:
	j	fbgt_cont.25170
fbgt_else.25181:
	fmov	%f0, %f7
fbgt_cont.25182:
	j	fbgt_cont.25170
fbgt_else.25179:
	fmov	%f0, %f7
fbgt_cont.25180:
	j	fbgt_cont.25170
fbgt_else.25177:
	fmov	%f0, %f7
fbgt_cont.25178:
	j	fbgt_cont.25170
fbgt_else.25175:
	fmov	%f0, %f7
fbgt_cont.25176:
	j	fbgt_cont.25170
fbgt_else.25173:
	fmov	%f0, %f7
fbgt_cont.25174:
	j	fbgt_cont.25170
fbgt_else.25171:
	fmov	%f0, %f7
fbgt_cont.25172:
	j	fbgt_cont.25170
fbgt_else.25169:
	fmov	%f0, %f6
fbgt_cont.25170:
	flw	%f1, 14(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25195
	fblt	%f1, %f0, fbgt_else.25197
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.25196
fbgt_else.25197:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.25198:
	j	fbgt_cont.25196
fbgt_else.25195:
	fmov	%f0, %f1
fbgt_cont.25196:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25199
	addi	%v0, %zero, 0
	j	fbgt_cont.25200
fbgt_else.25199:
	addi	%v0, %zero, 1
fbgt_cont.25200:
	fblt	%f0, %f1, fbgt_else.25201
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25202
fbgt_else.25201:
fbgt_cont.25202:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25203
	beqi	%v0, 0, bnei_else.25205
	addi	%v0, %zero, 0
	j	fbgt_cont.25204
bnei_else.25205:
	addi	%v0, %zero, 1
bnei_cont.25206:
	j	fbgt_cont.25204
fbgt_else.25203:
fbgt_cont.25204:
	fblt	%f0, %f2, fbgt_else.25207
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25208
fbgt_else.25207:
fbgt_cont.25208:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.25209
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.25210
fbgt_else.25209:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.25210:
	beqi	%v0, 0, bnei_else.25211
	j	bnei_cont.25212
bnei_else.25211:
	fneg	%f0, %f0
bnei_cont.25212:
	flw	%f4, 13(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.25213
	addi	%v0, %zero, 1
	j	fbgt_cont.25214
fbgt_else.25213:
	addi	%v0, %zero, 0
fbgt_cont.25214:
	fabs	%f4, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 15(%sp)
	sw	%v0, 16(%sp)
	fsw	%f4, 17(%sp)
	fblt	%f4, %f6, fbgt_else.25215
	flw	%f7, 493(%zero)
	fblt	%f4, %f7, fbgt_else.25217
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.25219
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.25221
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.25223
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.25225
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.25227
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.25229
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.25231
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.25233
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.25235
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.25237
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.25239
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.25216
fbgt_else.25239:
	fmov	%f0, %f7
fbgt_cont.25240:
	j	fbgt_cont.25216
fbgt_else.25237:
	fmov	%f0, %f7
fbgt_cont.25238:
	j	fbgt_cont.25216
fbgt_else.25235:
	fmov	%f0, %f7
fbgt_cont.25236:
	j	fbgt_cont.25216
fbgt_else.25233:
	fmov	%f0, %f7
fbgt_cont.25234:
	j	fbgt_cont.25216
fbgt_else.25231:
	fmov	%f0, %f7
fbgt_cont.25232:
	j	fbgt_cont.25216
fbgt_else.25229:
	fmov	%f0, %f7
fbgt_cont.25230:
	j	fbgt_cont.25216
fbgt_else.25227:
	fmov	%f0, %f7
fbgt_cont.25228:
	j	fbgt_cont.25216
fbgt_else.25225:
	fmov	%f0, %f7
fbgt_cont.25226:
	j	fbgt_cont.25216
fbgt_else.25223:
	fmov	%f0, %f7
fbgt_cont.25224:
	j	fbgt_cont.25216
fbgt_else.25221:
	fmov	%f0, %f7
fbgt_cont.25222:
	j	fbgt_cont.25216
fbgt_else.25219:
	fmov	%f0, %f7
fbgt_cont.25220:
	j	fbgt_cont.25216
fbgt_else.25217:
	fmov	%f0, %f7
fbgt_cont.25218:
	j	fbgt_cont.25216
fbgt_else.25215:
	fmov	%f0, %f6
fbgt_cont.25216:
	flw	%f1, 17(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25241
	fblt	%f1, %f0, fbgt_else.25243
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.25242
fbgt_else.25243:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.25244:
	j	fbgt_cont.25242
fbgt_else.25241:
	fmov	%f0, %f1
fbgt_cont.25242:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25245
	lw	%v0, 16(%sp)
	beqi	%v0, 0, bnei_else.25247
	addi	%v0, %zero, 0
	j	fbgt_cont.25246
bnei_else.25247:
	addi	%v0, %zero, 1
bnei_cont.25248:
	j	fbgt_cont.25246
fbgt_else.25245:
	lw	%v0, 16(%sp)
fbgt_cont.25246:
	fblt	%f0, %f1, fbgt_else.25249
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25250
fbgt_else.25249:
fbgt_cont.25250:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25251
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25252
fbgt_else.25251:
fbgt_cont.25252:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.25253
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.25254
fbgt_else.25253:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.25254:
	beqi	%v0, 0, bnei_else.25255
	j	bnei_cont.25256
bnei_else.25255:
	fneg	%f0, %f0
bnei_cont.25256:
	lw	%v0, 1(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 18(%sp)
	fsw	%f4, 19(%sp)
	fsw	%f5, 20(%sp)
	fblt	%f5, %f6, fbgt_else.25257
	flw	%f7, 493(%zero)
	fblt	%f5, %f7, fbgt_else.25259
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.25261
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.25263
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.25265
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.25267
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.25269
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.25271
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.25273
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.25275
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.25277
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.25279
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.25281
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	fbgt_cont.25258
fbgt_else.25281:
	fmov	%f0, %f7
fbgt_cont.25282:
	j	fbgt_cont.25258
fbgt_else.25279:
	fmov	%f0, %f7
fbgt_cont.25280:
	j	fbgt_cont.25258
fbgt_else.25277:
	fmov	%f0, %f7
fbgt_cont.25278:
	j	fbgt_cont.25258
fbgt_else.25275:
	fmov	%f0, %f7
fbgt_cont.25276:
	j	fbgt_cont.25258
fbgt_else.25273:
	fmov	%f0, %f7
fbgt_cont.25274:
	j	fbgt_cont.25258
fbgt_else.25271:
	fmov	%f0, %f7
fbgt_cont.25272:
	j	fbgt_cont.25258
fbgt_else.25269:
	fmov	%f0, %f7
fbgt_cont.25270:
	j	fbgt_cont.25258
fbgt_else.25267:
	fmov	%f0, %f7
fbgt_cont.25268:
	j	fbgt_cont.25258
fbgt_else.25265:
	fmov	%f0, %f7
fbgt_cont.25266:
	j	fbgt_cont.25258
fbgt_else.25263:
	fmov	%f0, %f7
fbgt_cont.25264:
	j	fbgt_cont.25258
fbgt_else.25261:
	fmov	%f0, %f7
fbgt_cont.25262:
	j	fbgt_cont.25258
fbgt_else.25259:
	fmov	%f0, %f7
fbgt_cont.25260:
	j	fbgt_cont.25258
fbgt_else.25257:
	fmov	%f0, %f6
fbgt_cont.25258:
	flw	%f1, 20(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25283
	fblt	%f1, %f0, fbgt_else.25285
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	fbgt_cont.25284
fbgt_else.25285:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
fbgt_cont.25286:
	j	fbgt_cont.25284
fbgt_else.25283:
	fmov	%f0, %f1
fbgt_cont.25284:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25287
	addi	%v0, %zero, 0
	j	fbgt_cont.25288
fbgt_else.25287:
	addi	%v0, %zero, 1
fbgt_cont.25288:
	fblt	%f0, %f1, fbgt_else.25289
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25290
fbgt_else.25289:
fbgt_cont.25290:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25291
	beqi	%v0, 0, bnei_else.25293
	addi	%v0, %zero, 0
	j	fbgt_cont.25292
bnei_else.25293:
	addi	%v0, %zero, 1
bnei_cont.25294:
	j	fbgt_cont.25292
fbgt_else.25291:
fbgt_cont.25292:
	fblt	%f0, %f2, fbgt_else.25295
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25296
fbgt_else.25295:
fbgt_cont.25296:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.25297
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.25298
fbgt_else.25297:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.25298:
	beqi	%v0, 0, bnei_else.25299
	j	bnei_cont.25300
bnei_else.25299:
	fneg	%f0, %f0
bnei_cont.25300:
	flw	%f4, 19(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.25301
	addi	%v0, %zero, 1
	j	fbgt_cont.25302
fbgt_else.25301:
	addi	%v0, %zero, 0
fbgt_cont.25302:
	fabs	%f4, %f4
	flw	%f5, 5(%sp)
	fsw	%f0, 21(%sp)
	sw	%v0, 22(%sp)
	fsw	%f4, 23(%sp)
	fblt	%f4, %f5, fbgt_else.25303
	flw	%f6, 493(%zero)
	fblt	%f4, %f6, fbgt_else.25305
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.25307
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.25309
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.25311
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.25313
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.25315
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.25317
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.25319
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.25321
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.25323
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.25325
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.25327
	flw	%f6, 481(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.25304
fbgt_else.25327:
	fmov	%f0, %f6
fbgt_cont.25328:
	j	fbgt_cont.25304
fbgt_else.25325:
	fmov	%f0, %f6
fbgt_cont.25326:
	j	fbgt_cont.25304
fbgt_else.25323:
	fmov	%f0, %f6
fbgt_cont.25324:
	j	fbgt_cont.25304
fbgt_else.25321:
	fmov	%f0, %f6
fbgt_cont.25322:
	j	fbgt_cont.25304
fbgt_else.25319:
	fmov	%f0, %f6
fbgt_cont.25320:
	j	fbgt_cont.25304
fbgt_else.25317:
	fmov	%f0, %f6
fbgt_cont.25318:
	j	fbgt_cont.25304
fbgt_else.25315:
	fmov	%f0, %f6
fbgt_cont.25316:
	j	fbgt_cont.25304
fbgt_else.25313:
	fmov	%f0, %f6
fbgt_cont.25314:
	j	fbgt_cont.25304
fbgt_else.25311:
	fmov	%f0, %f6
fbgt_cont.25312:
	j	fbgt_cont.25304
fbgt_else.25309:
	fmov	%f0, %f6
fbgt_cont.25310:
	j	fbgt_cont.25304
fbgt_else.25307:
	fmov	%f0, %f6
fbgt_cont.25308:
	j	fbgt_cont.25304
fbgt_else.25305:
	fmov	%f0, %f6
fbgt_cont.25306:
	j	fbgt_cont.25304
fbgt_else.25303:
	fmov	%f0, %f5
fbgt_cont.25304:
	flw	%f1, 23(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25329
	fblt	%f1, %f0, fbgt_else.25331
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.25330
fbgt_else.25331:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.25332:
	j	fbgt_cont.25330
fbgt_else.25329:
	fmov	%f0, %f1
fbgt_cont.25330:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25333
	lw	%v0, 22(%sp)
	beqi	%v0, 0, bnei_else.25335
	addi	%v0, %zero, 0
	j	fbgt_cont.25334
bnei_else.25335:
	addi	%v0, %zero, 1
bnei_cont.25336:
	j	fbgt_cont.25334
fbgt_else.25333:
	lw	%v0, 22(%sp)
fbgt_cont.25334:
	fblt	%f0, %f1, fbgt_else.25337
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25338
fbgt_else.25337:
fbgt_cont.25338:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25339
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25340
fbgt_else.25339:
fbgt_cont.25340:
	flw	%f1, 8(%sp)
	fblt	%f1, %f0, fbgt_else.25341
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.25342
fbgt_else.25341:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.25342:
	beqi	%v0, 0, bnei_else.25343
	j	bnei_cont.25344
bnei_else.25343:
	fneg	%f0, %f0
bnei_cont.25344:
	flw	%f1, 21(%sp)
	flw	%f2, 15(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 18(%sp)
	flw	%f5, 12(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f7, %f6, %f1
	flw	%f8, 6(%sp)
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
	flw	%f12, 496(%zero)
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
read_nth_object.2782:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.25392
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
	flw	%f0, 470(%zero)
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
	fblt	%f0, %f1, fbgt_else.25393
	addi	%v0, %zero, 0
	j	fbgt_cont.25394
fbgt_else.25393:
	addi	%v0, %zero, 1
fbgt_cont.25394:
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
	beqi	%v1, 0, bnei_else.25395
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 461(%zero)
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
	j	bnei_cont.25396
bnei_else.25395:
bnei_cont.25396:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.25397
	lw	%a0, 10(%sp)
	j	bnei_cont.25398
bnei_else.25397:
	addi	%a0, %zero, 1
bnei_cont.25398:
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
	lw	%a3, 0(%sp)
	sw	%v1, 12(%a3)
	beqi	%a2, 3, bnei_else.25399
	beqi	%a2, 2, bnei_else.25401
	j	bnei_cont.25400
bnei_else.25401:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.25403
	addi	%v1, %zero, 0
	j	bnei_cont.25404
bnei_else.25403:
	addi	%v1, %zero, 1
bnei_cont.25404:
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f0
	flw	%f2, 1(%a0)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%a0)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 5(%sp)
	fbne	%f1, %f4, fbeq_else.25405
	addi	%a2, %zero, 1
	j	fbeq_cont.25406
fbeq_else.25405:
	addi	%a2, %zero, 0
fbeq_cont.25406:
	beqi	%a2, 0, bnei_else.25407
	flw	%f1, 474(%zero)
	j	bnei_cont.25408
bnei_else.25407:
	beqi	%v1, 0, bnei_else.25409
	flw	%f4, 458(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.25410
bnei_else.25409:
	flw	%f4, 474(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.25410:
bnei_cont.25408:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.25402:
	j	bnei_cont.25400
bnei_else.25399:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.25411
	addi	%v1, %zero, 1
	j	fbeq_cont.25412
fbeq_else.25411:
	addi	%v1, %zero, 0
fbeq_cont.25412:
	beqi	%v1, 0, bnei_else.25413
	fmov	%f0, %f1
	j	bnei_cont.25414
bnei_else.25413:
	fbne	%f0, %f1, fbeq_else.25415
	addi	%v1, %zero, 1
	j	fbeq_cont.25416
fbeq_else.25415:
	addi	%v1, %zero, 0
fbeq_cont.25416:
	beqi	%v1, 0, bnei_else.25417
	fmov	%f2, %f1
	j	bnei_cont.25418
bnei_else.25417:
	fblt	%f1, %f0, fbgt_else.25419
	addi	%v1, %zero, 0
	j	fbgt_cont.25420
fbgt_else.25419:
	addi	%v1, %zero, 1
fbgt_cont.25420:
	beqi	%v1, 0, bnei_else.25421
	flw	%f2, 474(%zero)
	j	bnei_cont.25422
bnei_else.25421:
	flw	%f2, 458(%zero)
bnei_cont.25422:
bnei_cont.25418:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.25414:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.25423
	addi	%v1, %zero, 1
	j	fbeq_cont.25424
fbeq_else.25423:
	addi	%v1, %zero, 0
fbeq_cont.25424:
	beqi	%v1, 0, bnei_else.25425
	fmov	%f0, %f1
	j	bnei_cont.25426
bnei_else.25425:
	fbne	%f0, %f1, fbeq_else.25427
	addi	%v1, %zero, 1
	j	fbeq_cont.25428
fbeq_else.25427:
	addi	%v1, %zero, 0
fbeq_cont.25428:
	beqi	%v1, 0, bnei_else.25429
	fmov	%f2, %f1
	j	bnei_cont.25430
bnei_else.25429:
	fblt	%f1, %f0, fbgt_else.25431
	addi	%v1, %zero, 0
	j	fbgt_cont.25432
fbgt_else.25431:
	addi	%v1, %zero, 1
fbgt_cont.25432:
	beqi	%v1, 0, bnei_else.25433
	flw	%f2, 474(%zero)
	j	bnei_cont.25434
bnei_else.25433:
	flw	%f2, 458(%zero)
bnei_cont.25434:
bnei_cont.25430:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.25426:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.25435
	addi	%v1, %zero, 1
	j	fbeq_cont.25436
fbeq_else.25435:
	addi	%v1, %zero, 0
fbeq_cont.25436:
	beqi	%v1, 0, bnei_else.25437
	fmov	%f0, %f1
	j	bnei_cont.25438
bnei_else.25437:
	fbne	%f0, %f1, fbeq_else.25439
	addi	%v1, %zero, 1
	j	fbeq_cont.25440
fbeq_else.25439:
	addi	%v1, %zero, 0
fbeq_cont.25440:
	beqi	%v1, 0, bnei_else.25441
	j	bnei_cont.25442
bnei_else.25441:
	fblt	%f1, %f0, fbgt_else.25443
	addi	%v1, %zero, 0
	j	fbgt_cont.25444
fbgt_else.25443:
	addi	%v1, %zero, 1
fbgt_cont.25444:
	beqi	%v1, 0, bnei_else.25445
	flw	%f1, 474(%zero)
	j	bnei_cont.25446
bnei_else.25445:
	flw	%f1, 458(%zero)
bnei_cont.25446:
bnei_cont.25442:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.25438:
	fsw	%f0, 2(%a0)
bnei_cont.25400:
	beqi	%a1, 0, bnei_else.25447
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2779
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.25448
bnei_else.25447:
bnei_cont.25448:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25392:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2784:
	blti	%v0, 60, bgti_else.25458
	jr	%ra
bgti_else.25458:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2782
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.25460
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25461
	jr	%ra
bgti_else.25461:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2782
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.25463
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25464
	jr	%ra
bgti_else.25464:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2782
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.25466
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25467
	jr	%ra
bgti_else.25467:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2782
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.25469
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25470
	jr	%ra
bgti_else.25470:
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_nth_object.2782
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.25472
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25473
	jr	%ra
bgti_else.25473:
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_nth_object.2782
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.25475
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25476
	jr	%ra
bgti_else.25476:
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	read_nth_object.2782
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.25478
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25479
	jr	%ra
bgti_else.25479:
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	read_nth_object.2782
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.25481
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	j	read_object.2784
bnei_else.25481:
	lw	%v0, 7(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25478:
	lw	%v0, 6(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25475:
	lw	%v0, 5(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25472:
	lw	%v0, 4(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25469:
	lw	%v0, 3(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25466:
	lw	%v0, 2(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25463:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25460:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
read_net_item.2788:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.25503
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
	beqi	%v0, -1, bnei_else.25504
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.25506
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.25508
	lw	%v1, 7(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	read_net_item.2788
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.25509
bnei_else.25508:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.25509:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.25507
bnei_else.25506:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.25507:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.25505
bnei_else.25504:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.25505:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.25503:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_or_network.2790:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	sw	%v1, 1(%sp)
	beqi	%v0, -1, bnei_else.25527
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.25529
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.25531
	addi	%v1, %zero, 3
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_net_item.2788
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.25532
bnei_else.25531:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.25532:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.25530
bnei_else.25529:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.25530:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.25528
bnei_else.25527:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.25528:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.25533
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
	beqi	%v0, -1, bnei_else.25534
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.25536
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2788
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.25537
bnei_else.25536:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.25537:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.25535
bnei_else.25534:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.25535:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.25538
	lw	%v0, 6(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	read_or_network.2790
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 10(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.25539
bnei_else.25538:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.25539:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.25533:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_and_network.2792:
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
	beqi	%v0, -1, bnei_else.25561
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.25563
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.25565
	addi	%v1, %zero, 3
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_net_item.2788
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.25566
bnei_else.25565:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.25566:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.25564
bnei_else.25563:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.25564:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.25562
bnei_else.25561:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.25562:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.25567
	lw	%v1, 1(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %zero, 1
	addi	%v1, %v1, 1
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.25568
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.25570
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2788
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.25571
bnei_else.25570:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.25571:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.25569
bnei_else.25568:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.25569:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.25572
	lw	%v1, 6(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, -1, bnei_else.25573
	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	read_net_item.2788
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.25574
bnei_else.25573:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.25574:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.25575
	lw	%v1, 10(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	lw	%v1, 0(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	read_net_item.2788
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.25576
	lw	%v1, 12(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	j	read_and_network.2792
bnei_else.25576:
	jr	%ra
bnei_else.25575:
	jr	%ra
bnei_else.25572:
	jr	%ra
bnei_else.25567:
	jr	%ra
solver_rect.2805:
	flw	%f3, 0(%v1)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.25581
	addi	%a0, %zero, 1
	j	fbeq_cont.25582
fbeq_else.25581:
	addi	%a0, %zero, 0
fbeq_cont.25582:
	beqi	%a0, 0, bnei_else.25583
	addi	%a0, %zero, 0
	j	bnei_cont.25584
bnei_else.25583:
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f3, %f4, fbgt_else.25585
	addi	%a2, %zero, 0
	j	fbgt_cont.25586
fbgt_else.25585:
	addi	%a2, %zero, 1
fbgt_cont.25586:
	beqi	%a1, 0, bnei_else.25587
	beqi	%a2, 0, bnei_else.25589
	addi	%a1, %zero, 0
	j	bnei_cont.25588
bnei_else.25589:
	addi	%a1, %zero, 1
bnei_cont.25590:
	j	bnei_cont.25588
bnei_else.25587:
	add	%a1, %zero, %a2
bnei_cont.25588:
	flw	%f5, 0(%a0)
	beqi	%a1, 0, bnei_else.25591
	j	bnei_cont.25592
bnei_else.25591:
	fneg	%f5, %f5
bnei_cont.25592:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%v1)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%a0)
	fblt	%f6, %f7, fbgt_else.25593
	addi	%a1, %zero, 0
	j	fbgt_cont.25594
fbgt_else.25593:
	addi	%a1, %zero, 1
fbgt_cont.25594:
	beqi	%a1, 0, bnei_else.25595
	flw	%f6, 2(%v1)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%a0)
	fblt	%f6, %f7, fbgt_else.25597
	addi	%a0, %zero, 0
	j	fbgt_cont.25598
fbgt_else.25597:
	addi	%a0, %zero, 1
fbgt_cont.25598:
	beqi	%a0, 0, bnei_else.25599
	fsw	%f5, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.25596
bnei_else.25599:
	addi	%a0, %zero, 0
bnei_cont.25600:
	j	bnei_cont.25596
bnei_else.25595:
	addi	%a0, %zero, 0
bnei_cont.25596:
bnei_cont.25584:
	beqi	%a0, 0, bnei_else.25601
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25601:
	flw	%f5, 1(%v1)
	fbne	%f5, %f4, fbeq_else.25602
	addi	%a0, %zero, 1
	j	fbeq_cont.25603
fbeq_else.25602:
	addi	%a0, %zero, 0
fbeq_cont.25603:
	beqi	%a0, 0, bnei_else.25604
	addi	%a0, %zero, 0
	j	bnei_cont.25605
bnei_else.25604:
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f5, %f4, fbgt_else.25606
	addi	%a2, %zero, 0
	j	fbgt_cont.25607
fbgt_else.25606:
	addi	%a2, %zero, 1
fbgt_cont.25607:
	beqi	%a1, 0, bnei_else.25608
	beqi	%a2, 0, bnei_else.25610
	addi	%a1, %zero, 0
	j	bnei_cont.25609
bnei_else.25610:
	addi	%a1, %zero, 1
bnei_cont.25611:
	j	bnei_cont.25609
bnei_else.25608:
	add	%a1, %zero, %a2
bnei_cont.25609:
	flw	%f6, 1(%a0)
	beqi	%a1, 0, bnei_else.25612
	j	bnei_cont.25613
bnei_else.25612:
	fneg	%f6, %f6
bnei_cont.25613:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%v1)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%a0)
	fblt	%f7, %f8, fbgt_else.25614
	addi	%a1, %zero, 0
	j	fbgt_cont.25615
fbgt_else.25614:
	addi	%a1, %zero, 1
fbgt_cont.25615:
	beqi	%a1, 0, bnei_else.25616
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%a0)
	fblt	%f7, %f8, fbgt_else.25618
	addi	%a0, %zero, 0
	j	fbgt_cont.25619
fbgt_else.25618:
	addi	%a0, %zero, 1
fbgt_cont.25619:
	beqi	%a0, 0, bnei_else.25620
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.25617
bnei_else.25620:
	addi	%a0, %zero, 0
bnei_cont.25621:
	j	bnei_cont.25617
bnei_else.25616:
	addi	%a0, %zero, 0
bnei_cont.25617:
bnei_cont.25605:
	beqi	%a0, 0, bnei_else.25622
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.25622:
	flw	%f6, 2(%v1)
	fbne	%f6, %f4, fbeq_else.25623
	addi	%v1, %zero, 1
	j	fbeq_cont.25624
fbeq_else.25623:
	addi	%v1, %zero, 0
fbeq_cont.25624:
	beqi	%v1, 0, bnei_else.25625
	addi	%v0, %zero, 0
	j	bnei_cont.25626
bnei_else.25625:
	lw	%v1, 4(%v0)
	lw	%v0, 6(%v0)
	fblt	%f6, %f4, fbgt_else.25627
	addi	%a0, %zero, 0
	j	fbgt_cont.25628
fbgt_else.25627:
	addi	%a0, %zero, 1
fbgt_cont.25628:
	beqi	%v0, 0, bnei_else.25629
	beqi	%a0, 0, bnei_else.25631
	addi	%v0, %zero, 0
	j	bnei_cont.25630
bnei_else.25631:
	addi	%v0, %zero, 1
bnei_cont.25632:
	j	bnei_cont.25630
bnei_else.25629:
	add	%v0, %zero, %a0
bnei_cont.25630:
	flw	%f4, 2(%v1)
	beqi	%v0, 0, bnei_else.25633
	j	bnei_cont.25634
bnei_else.25633:
	fneg	%f4, %f4
bnei_cont.25634:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.25635
	addi	%v0, %zero, 0
	j	fbgt_cont.25636
fbgt_else.25635:
	addi	%v0, %zero, 1
fbgt_cont.25636:
	beqi	%v0, 0, bnei_else.25637
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.25639
	addi	%v0, %zero, 0
	j	fbgt_cont.25640
fbgt_else.25639:
	addi	%v0, %zero, 1
fbgt_cont.25640:
	beqi	%v0, 0, bnei_else.25641
	fsw	%f2, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.25638
bnei_else.25641:
	addi	%v0, %zero, 0
bnei_cont.25642:
	j	bnei_cont.25638
bnei_else.25637:
	addi	%v0, %zero, 0
bnei_cont.25638:
bnei_cont.25626:
	beqi	%v0, 0, bnei_else.25643
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.25643:
	addi	%v0, %zero, 0
	jr	%ra
solver_second.2830:
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)
	flw	%f5, 2(%v1)
	fmul	%f6, %f3, %f3
	lw	%v1, 4(%v0)
	flw	%f7, 0(%v1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%v1, 4(%v0)
	flw	%f8, 1(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.25644
	fmul	%f7, %f4, %f5
	lw	%v1, 9(%v0)
	flw	%f8, 0(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f3, %f4
	lw	%v1, 9(%v0)
	flw	%f8, 2(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	j	bnei_cont.25645
bnei_else.25644:
bnei_cont.25645:
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.25646
	addi	%v1, %zero, 1
	j	fbeq_cont.25647
fbeq_else.25646:
	addi	%v1, %zero, 0
fbeq_cont.25647:
	beqi	%v1, 0, bnei_else.25648
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25648:
	fmul	%f8, %f3, %f0
	lw	%v1, 4(%v0)
	flw	%f9, 0(%v1)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1
	lw	%v1, 4(%v0)
	flw	%f10, 1(%v1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f5, %f2
	lw	%v1, 4(%v0)
	flw	%f10, 2(%v1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.25649
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2
	fadd	%f9, %f9, %f10
	lw	%v1, 9(%v0)
	flw	%f10, 0(%v1)
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2
	fmul	%f5, %f5, %f0
	fadd	%f5, %f10, %f5
	lw	%v1, 9(%v0)
	flw	%f10, 1(%v1)
	fmul	%f5, %f5, %f10
	fadd	%f5, %f9, %f5
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0
	fadd	%f3, %f3, %f4
	lw	%v1, 9(%v0)
	flw	%f4, 2(%v1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	flw	%f4, 473(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f8, %f3
	j	bnei_cont.25650
bnei_else.25649:
	fmov	%f3, %f8
bnei_cont.25650:
	fmul	%f4, %f0, %f0
	lw	%v1, 4(%v0)
	flw	%f5, 0(%v1)
	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1
	lw	%v1, 4(%v0)
	flw	%f8, 1(%v1)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.25651
	fmul	%f5, %f1, %f2
	lw	%v1, 9(%v0)
	flw	%f8, 0(%v1)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f2, %f2, %f0
	lw	%v1, 9(%v0)
	flw	%f5, 1(%v1)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1
	lw	%v1, 9(%v0)
	flw	%f1, 2(%v1)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.25652
bnei_else.25651:
	fmov	%f0, %f4
bnei_cont.25652:
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.25653
	j	bnei_cont.25654
bnei_else.25653:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.25654:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.25655
	addi	%v1, %zero, 0
	j	fbgt_cont.25656
fbgt_else.25655:
	addi	%v1, %zero, 1
fbgt_cont.25656:
	beqi	%v1, 0, bnei_else.25657
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.25658
	j	bnei_cont.25659
bnei_else.25658:
	fneg	%f0, %f0
bnei_cont.25659:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25657:
	addi	%v0, %zero, 0
	jr	%ra
solver.2836:
	lw	%v0, 12(%v0)
	flw	%f0, 0(%a0)
	lw	%a1, 5(%v0)
	flw	%f1, 0(%a1)
	fsub	%f0, %f0, %f1
	flw	%f1, 1(%a0)
	lw	%a1, 5(%v0)
	flw	%f2, 1(%a1)
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%a0)
	lw	%a0, 5(%v0)
	flw	%f3, 2(%a0)
	fsub	%f2, %f2, %f3
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.25660
	beqi	%a0, 2, bnei_else.25661
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)
	flw	%f5, 2(%v1)
	fmul	%f6, %f3, %f3
	lw	%v1, 4(%v0)
	flw	%f7, 0(%v1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%v1, 4(%v0)
	flw	%f8, 1(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.25662
	fmul	%f7, %f4, %f5
	lw	%v1, 9(%v0)
	flw	%f8, 0(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f3, %f4
	lw	%v1, 9(%v0)
	flw	%f8, 2(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	j	bnei_cont.25663
bnei_else.25662:
bnei_cont.25663:
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.25664
	addi	%v1, %zero, 1
	j	fbeq_cont.25665
fbeq_else.25664:
	addi	%v1, %zero, 0
fbeq_cont.25665:
	beqi	%v1, 0, bnei_else.25666
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25666:
	fmul	%f8, %f3, %f0
	lw	%v1, 4(%v0)
	flw	%f9, 0(%v1)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1
	lw	%v1, 4(%v0)
	flw	%f10, 1(%v1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f5, %f2
	lw	%v1, 4(%v0)
	flw	%f10, 2(%v1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.25667
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2
	fadd	%f9, %f9, %f10
	lw	%v1, 9(%v0)
	flw	%f10, 0(%v1)
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2
	fmul	%f5, %f5, %f0
	fadd	%f5, %f10, %f5
	lw	%v1, 9(%v0)
	flw	%f10, 1(%v1)
	fmul	%f5, %f5, %f10
	fadd	%f5, %f9, %f5
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0
	fadd	%f3, %f3, %f4
	lw	%v1, 9(%v0)
	flw	%f4, 2(%v1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	flw	%f4, 473(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f8, %f3
	j	bnei_cont.25668
bnei_else.25667:
	fmov	%f3, %f8
bnei_cont.25668:
	fmul	%f4, %f0, %f0
	lw	%v1, 4(%v0)
	flw	%f5, 0(%v1)
	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1
	lw	%v1, 4(%v0)
	flw	%f8, 1(%v1)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.25669
	fmul	%f5, %f1, %f2
	lw	%v1, 9(%v0)
	flw	%f8, 0(%v1)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f2, %f2, %f0
	lw	%v1, 9(%v0)
	flw	%f5, 1(%v1)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1
	lw	%v1, 9(%v0)
	flw	%f1, 2(%v1)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.25670
bnei_else.25669:
	fmov	%f0, %f4
bnei_cont.25670:
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.25671
	j	bnei_cont.25672
bnei_else.25671:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.25672:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.25673
	addi	%v1, %zero, 0
	j	fbgt_cont.25674
fbgt_else.25673:
	addi	%v1, %zero, 1
fbgt_cont.25674:
	beqi	%v1, 0, bnei_else.25675
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.25676
	j	bnei_cont.25677
bnei_else.25676:
	fneg	%f0, %f0
bnei_cont.25677:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25675:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25661:
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
	flw	%f5, 470(%zero)
	fblt	%f5, %f3, fbgt_else.25678
	addi	%v0, %zero, 0
	j	fbgt_cont.25679
fbgt_else.25678:
	addi	%v0, %zero, 1
fbgt_cont.25679:
	beqi	%v0, 0, bnei_else.25680
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
bnei_else.25680:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25660:
	flw	%f3, 0(%v1)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.25681
	addi	%a0, %zero, 1
	j	fbeq_cont.25682
fbeq_else.25681:
	addi	%a0, %zero, 0
fbeq_cont.25682:
	beqi	%a0, 0, bnei_else.25683
	addi	%a0, %zero, 0
	j	bnei_cont.25684
bnei_else.25683:
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f3, %f4, fbgt_else.25685
	addi	%a2, %zero, 0
	j	fbgt_cont.25686
fbgt_else.25685:
	addi	%a2, %zero, 1
fbgt_cont.25686:
	beqi	%a1, 0, bnei_else.25687
	beqi	%a2, 0, bnei_else.25689
	addi	%a1, %zero, 0
	j	bnei_cont.25688
bnei_else.25689:
	addi	%a1, %zero, 1
bnei_cont.25690:
	j	bnei_cont.25688
bnei_else.25687:
	add	%a1, %zero, %a2
bnei_cont.25688:
	flw	%f5, 0(%a0)
	beqi	%a1, 0, bnei_else.25691
	j	bnei_cont.25692
bnei_else.25691:
	fneg	%f5, %f5
bnei_cont.25692:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%v1)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%a0)
	fblt	%f6, %f7, fbgt_else.25693
	addi	%a1, %zero, 0
	j	fbgt_cont.25694
fbgt_else.25693:
	addi	%a1, %zero, 1
fbgt_cont.25694:
	beqi	%a1, 0, bnei_else.25695
	flw	%f6, 2(%v1)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%a0)
	fblt	%f6, %f7, fbgt_else.25697
	addi	%a0, %zero, 0
	j	fbgt_cont.25698
fbgt_else.25697:
	addi	%a0, %zero, 1
fbgt_cont.25698:
	beqi	%a0, 0, bnei_else.25699
	fsw	%f5, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.25696
bnei_else.25699:
	addi	%a0, %zero, 0
bnei_cont.25700:
	j	bnei_cont.25696
bnei_else.25695:
	addi	%a0, %zero, 0
bnei_cont.25696:
bnei_cont.25684:
	beqi	%a0, 0, bnei_else.25701
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25701:
	flw	%f5, 1(%v1)
	fbne	%f5, %f4, fbeq_else.25702
	addi	%a0, %zero, 1
	j	fbeq_cont.25703
fbeq_else.25702:
	addi	%a0, %zero, 0
fbeq_cont.25703:
	beqi	%a0, 0, bnei_else.25704
	addi	%a0, %zero, 0
	j	bnei_cont.25705
bnei_else.25704:
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f5, %f4, fbgt_else.25706
	addi	%a2, %zero, 0
	j	fbgt_cont.25707
fbgt_else.25706:
	addi	%a2, %zero, 1
fbgt_cont.25707:
	beqi	%a1, 0, bnei_else.25708
	beqi	%a2, 0, bnei_else.25710
	addi	%a1, %zero, 0
	j	bnei_cont.25709
bnei_else.25710:
	addi	%a1, %zero, 1
bnei_cont.25711:
	j	bnei_cont.25709
bnei_else.25708:
	add	%a1, %zero, %a2
bnei_cont.25709:
	flw	%f6, 1(%a0)
	beqi	%a1, 0, bnei_else.25712
	j	bnei_cont.25713
bnei_else.25712:
	fneg	%f6, %f6
bnei_cont.25713:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%v1)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%a0)
	fblt	%f7, %f8, fbgt_else.25714
	addi	%a1, %zero, 0
	j	fbgt_cont.25715
fbgt_else.25714:
	addi	%a1, %zero, 1
fbgt_cont.25715:
	beqi	%a1, 0, bnei_else.25716
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%a0)
	fblt	%f7, %f8, fbgt_else.25718
	addi	%a0, %zero, 0
	j	fbgt_cont.25719
fbgt_else.25718:
	addi	%a0, %zero, 1
fbgt_cont.25719:
	beqi	%a0, 0, bnei_else.25720
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.25717
bnei_else.25720:
	addi	%a0, %zero, 0
bnei_cont.25721:
	j	bnei_cont.25717
bnei_else.25716:
	addi	%a0, %zero, 0
bnei_cont.25717:
bnei_cont.25705:
	beqi	%a0, 0, bnei_else.25722
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.25722:
	flw	%f6, 2(%v1)
	fbne	%f6, %f4, fbeq_else.25723
	addi	%v1, %zero, 1
	j	fbeq_cont.25724
fbeq_else.25723:
	addi	%v1, %zero, 0
fbeq_cont.25724:
	beqi	%v1, 0, bnei_else.25725
	addi	%v0, %zero, 0
	j	bnei_cont.25726
bnei_else.25725:
	lw	%v1, 4(%v0)
	lw	%v0, 6(%v0)
	fblt	%f6, %f4, fbgt_else.25727
	addi	%a0, %zero, 0
	j	fbgt_cont.25728
fbgt_else.25727:
	addi	%a0, %zero, 1
fbgt_cont.25728:
	beqi	%v0, 0, bnei_else.25729
	beqi	%a0, 0, bnei_else.25731
	addi	%v0, %zero, 0
	j	bnei_cont.25730
bnei_else.25731:
	addi	%v0, %zero, 1
bnei_cont.25732:
	j	bnei_cont.25730
bnei_else.25729:
	add	%v0, %zero, %a0
bnei_cont.25730:
	flw	%f4, 2(%v1)
	beqi	%v0, 0, bnei_else.25733
	j	bnei_cont.25734
bnei_else.25733:
	fneg	%f4, %f4
bnei_cont.25734:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.25735
	addi	%v0, %zero, 0
	j	fbgt_cont.25736
fbgt_else.25735:
	addi	%v0, %zero, 1
fbgt_cont.25736:
	beqi	%v0, 0, bnei_else.25737
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.25739
	addi	%v0, %zero, 0
	j	fbgt_cont.25740
fbgt_else.25739:
	addi	%v0, %zero, 1
fbgt_cont.25740:
	beqi	%v0, 0, bnei_else.25741
	fsw	%f2, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.25738
bnei_else.25741:
	addi	%v0, %zero, 0
bnei_cont.25742:
	j	bnei_cont.25738
bnei_else.25737:
	addi	%v0, %zero, 0
bnei_cont.25738:
bnei_cont.25726:
	beqi	%v0, 0, bnei_else.25743
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.25743:
	addi	%v0, %zero, 0
	jr	%ra
solver_rect_fast.2840:
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
	fblt	%f6, %f7, fbgt_else.25744
	addi	%a1, %zero, 0
	j	fbgt_cont.25745
fbgt_else.25744:
	addi	%a1, %zero, 1
fbgt_cont.25745:
	beqi	%a1, 0, bnei_else.25746
	flw	%f6, 2(%v1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%a1, 4(%v0)
	flw	%f7, 2(%a1)
	fblt	%f6, %f7, fbgt_else.25748
	addi	%a1, %zero, 0
	j	fbgt_cont.25749
fbgt_else.25748:
	addi	%a1, %zero, 1
fbgt_cont.25749:
	beqi	%a1, 0, bnei_else.25750
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.25752
	addi	%a1, %zero, 1
	j	fbeq_cont.25753
fbeq_else.25752:
	addi	%a1, %zero, 0
fbeq_cont.25753:
	beqi	%a1, 0, bnei_else.25754
	addi	%a1, %zero, 0
	j	bnei_cont.25747
bnei_else.25754:
	addi	%a1, %zero, 1
bnei_cont.25755:
	j	bnei_cont.25747
bnei_else.25750:
	addi	%a1, %zero, 0
bnei_cont.25751:
	j	bnei_cont.25747
bnei_else.25746:
	addi	%a1, %zero, 0
bnei_cont.25747:
	beqi	%a1, 0, bnei_else.25756
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25756:
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
	fblt	%f7, %f8, fbgt_else.25757
	addi	%a1, %zero, 0
	j	fbgt_cont.25758
fbgt_else.25757:
	addi	%a1, %zero, 1
fbgt_cont.25758:
	beqi	%a1, 0, bnei_else.25759
	flw	%f7, 2(%v1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fblt	%f7, %f8, fbgt_else.25761
	addi	%v1, %zero, 0
	j	fbgt_cont.25762
fbgt_else.25761:
	addi	%v1, %zero, 1
fbgt_cont.25762:
	beqi	%v1, 0, bnei_else.25763
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.25765
	addi	%v1, %zero, 1
	j	fbeq_cont.25766
fbeq_else.25765:
	addi	%v1, %zero, 0
fbeq_cont.25766:
	beqi	%v1, 0, bnei_else.25767
	addi	%v1, %zero, 0
	j	bnei_cont.25760
bnei_else.25767:
	addi	%v1, %zero, 1
bnei_cont.25768:
	j	bnei_cont.25760
bnei_else.25763:
	addi	%v1, %zero, 0
bnei_cont.25764:
	j	bnei_cont.25760
bnei_else.25759:
	addi	%v1, %zero, 0
bnei_cont.25760:
	beqi	%v1, 0, bnei_else.25769
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.25769:
	flw	%f3, 4(%a0)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a0)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f4, 0(%v1)
	fblt	%f0, %f4, fbgt_else.25770
	addi	%v1, %zero, 0
	j	fbgt_cont.25771
fbgt_else.25770:
	addi	%v1, %zero, 1
fbgt_cont.25771:
	beqi	%v1, 0, bnei_else.25772
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%v0, 4(%v0)
	flw	%f1, 1(%v0)
	fblt	%f0, %f1, fbgt_else.25774
	addi	%v0, %zero, 0
	j	fbgt_cont.25775
fbgt_else.25774:
	addi	%v0, %zero, 1
fbgt_cont.25775:
	beqi	%v0, 0, bnei_else.25776
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.25778
	addi	%v0, %zero, 1
	j	fbeq_cont.25779
fbeq_else.25778:
	addi	%v0, %zero, 0
fbeq_cont.25779:
	beqi	%v0, 0, bnei_else.25780
	addi	%v0, %zero, 0
	j	bnei_cont.25773
bnei_else.25780:
	addi	%v0, %zero, 1
bnei_cont.25781:
	j	bnei_cont.25773
bnei_else.25776:
	addi	%v0, %zero, 0
bnei_cont.25777:
	j	bnei_cont.25773
bnei_else.25772:
	addi	%v0, %zero, 0
bnei_cont.25773:
	beqi	%v0, 0, bnei_else.25782
	fsw	%f2, 135(%zero)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.25782:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2853:
	flw	%f3, 0(%v1)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.25783
	addi	%a0, %zero, 1
	j	fbeq_cont.25784
fbeq_else.25783:
	addi	%a0, %zero, 0
fbeq_cont.25784:
	beqi	%a0, 0, bnei_else.25785
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25785:
	flw	%f5, 1(%v1)
	fmul	%f5, %f5, %f0
	flw	%f6, 2(%v1)
	fmul	%f6, %f6, %f1
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%v1)
	fmul	%f6, %f6, %f2
	fadd	%f5, %f5, %f6
	fmul	%f6, %f0, %f0
	lw	%a0, 4(%v0)
	flw	%f7, 0(%a0)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f1, %f1
	lw	%a0, 4(%v0)
	flw	%f8, 1(%a0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f2, %f2
	lw	%a0, 4(%v0)
	flw	%f8, 2(%a0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a0, 3(%v0)
	beqi	%a0, 0, bnei_else.25786
	fmul	%f7, %f1, %f2
	lw	%a0, 9(%v0)
	flw	%f8, 0(%a0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f2, %f2, %f0
	lw	%a0, 9(%v0)
	flw	%f7, 1(%a0)
	fmul	%f2, %f2, %f7
	fadd	%f2, %f6, %f2
	fmul	%f0, %f0, %f1
	lw	%a0, 9(%v0)
	flw	%f1, 2(%a0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.25787
bnei_else.25786:
	fmov	%f0, %f6
bnei_cont.25787:
	lw	%a0, 1(%v0)
	beqi	%a0, 3, bnei_else.25788
	j	bnei_cont.25789
bnei_else.25788:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.25789:
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0
	fsub	%f0, %f1, %f0
	fblt	%f4, %f0, fbgt_else.25790
	addi	%a0, %zero, 0
	j	fbgt_cont.25791
fbgt_else.25790:
	addi	%a0, %zero, 1
fbgt_cont.25791:
	beqi	%a0, 0, bnei_else.25792
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.25793
	fsqrt	%f0, %f0
	fadd	%f0, %f5, %f0
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.25794
bnei_else.25793:
	fsqrt	%f0, %f0
	fsub	%f0, %f5, %f0
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.25794:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25792:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2877:
	lw	%a0, 12(%v0)
	lw	%a1, 10(%a0)
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	lw	%a2, 1(%v1)
	add	%at, %a2, %v0
	lw	%v0, 0(%at)
	lw	%a2, 1(%a0)
	beqi	%a2, 1, bnei_else.25795
	beqi	%a2, 2, bnei_else.25796
	flw	%f3, 0(%v0)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.25797
	addi	%v1, %zero, 1
	j	fbeq_cont.25798
fbeq_else.25797:
	addi	%v1, %zero, 0
fbeq_cont.25798:
	beqi	%v1, 0, bnei_else.25799
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25799:
	flw	%f5, 1(%v0)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%v0)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a1)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.25800
	addi	%v1, %zero, 0
	j	fbgt_cont.25801
fbgt_else.25800:
	addi	%v1, %zero, 1
fbgt_cont.25801:
	beqi	%v1, 0, bnei_else.25802
	lw	%v1, 6(%a0)
	beqi	%v1, 0, bnei_else.25803
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.25804
bnei_else.25803:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.25804:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25802:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25796:
	flw	%f0, 0(%v0)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.25805
	addi	%v0, %zero, 0
	j	fbgt_cont.25806
fbgt_else.25805:
	addi	%v0, %zero, 1
fbgt_cont.25806:
	beqi	%v0, 0, bnei_else.25807
	flw	%f1, 3(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25807:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25795:
	lw	%v1, 0(%v1)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	j	solver_rect_fast.2840
setup_rect_table.2880:
	addi	%a0, %zero, 6
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.25811
	addi	%a0, %zero, 1
	j	fbeq_cont.25812
fbeq_else.25811:
	addi	%a0, %zero, 0
fbeq_cont.25812:
	beqi	%a0, 0, bnei_else.25813
	fsw	%f1, 1(%v0)
	j	bnei_cont.25814
bnei_else.25813:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.25815
	addi	%a2, %zero, 0
	j	fbgt_cont.25816
fbgt_else.25815:
	addi	%a2, %zero, 1
fbgt_cont.25816:
	beqi	%a1, 0, bnei_else.25817
	beqi	%a2, 0, bnei_else.25819
	addi	%a1, %zero, 0
	j	bnei_cont.25818
bnei_else.25819:
	addi	%a1, %zero, 1
bnei_cont.25820:
	j	bnei_cont.25818
bnei_else.25817:
	add	%a1, %zero, %a2
bnei_cont.25818:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.25821
	j	bnei_cont.25822
bnei_else.25821:
	fneg	%f2, %f2
bnei_cont.25822:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.25814:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.25823
	addi	%a0, %zero, 1
	j	fbeq_cont.25824
fbeq_else.25823:
	addi	%a0, %zero, 0
fbeq_cont.25824:
	beqi	%a0, 0, bnei_else.25825
	fsw	%f1, 3(%v0)
	j	bnei_cont.25826
bnei_else.25825:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.25827
	addi	%a2, %zero, 0
	j	fbgt_cont.25828
fbgt_else.25827:
	addi	%a2, %zero, 1
fbgt_cont.25828:
	beqi	%a1, 0, bnei_else.25829
	beqi	%a2, 0, bnei_else.25831
	addi	%a1, %zero, 0
	j	bnei_cont.25830
bnei_else.25831:
	addi	%a1, %zero, 1
bnei_cont.25832:
	j	bnei_cont.25830
bnei_else.25829:
	add	%a1, %zero, %a2
bnei_cont.25830:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.25833
	j	bnei_cont.25834
bnei_else.25833:
	fneg	%f2, %f2
bnei_cont.25834:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.25826:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.25835
	addi	%v1, %zero, 1
	j	fbeq_cont.25836
fbeq_else.25835:
	addi	%v1, %zero, 0
fbeq_cont.25836:
	beqi	%v1, 0, bnei_else.25837
	fsw	%f1, 5(%v0)
	j	bnei_cont.25838
bnei_else.25837:
	lw	%v1, 0(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.25839
	addi	%a1, %zero, 0
	j	fbgt_cont.25840
fbgt_else.25839:
	addi	%a1, %zero, 1
fbgt_cont.25840:
	beqi	%a0, 0, bnei_else.25841
	beqi	%a1, 0, bnei_else.25843
	addi	%a0, %zero, 0
	j	bnei_cont.25842
bnei_else.25843:
	addi	%a0, %zero, 1
bnei_cont.25844:
	j	bnei_cont.25842
bnei_else.25841:
	add	%a0, %zero, %a1
bnei_cont.25842:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.25845
	j	bnei_cont.25846
bnei_else.25845:
	fneg	%f1, %f1
bnei_cont.25846:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.25838:
	jr	%ra
setup_second_table.2886:
	addi	%a0, %zero, 5
	flw	%f0, 470(%zero)
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
	fmul	%f3, %f0, %f0
	lw	%v1, 1(%sp)
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a0, 4(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.25850
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)
	flw	%f5, 0(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0
	lw	%a0, 9(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1
	lw	%a0, 9(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	j	bnei_cont.25851
bnei_else.25850:
bnei_cont.25851:
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f4, %f0, %f4
	fneg	%f4, %f4
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f5, %f1, %f5
	fneg	%f5, %f5
	lw	%a0, 4(%v1)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fneg	%f6, %f6
	fsw	%f3, 0(%v0)
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.25852
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 473(%zero)
	fmul	%f7, %f7, %f8
	fsub	%f4, %f4, %f7
	fsw	%f4, 1(%v0)
	lw	%a0, 9(%v1)
	flw	%f4, 0(%a0)
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)
	flw	%f4, 2(%a0)
	fmul	%f4, %f0, %f4
	fadd	%f2, %f2, %f4
	fmul	%f2, %f2, %f8
	fsub	%f2, %f5, %f2
	fsw	%f2, 2(%v0)
	lw	%a0, 9(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	lw	%v1, 9(%v1)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f8
	fsub	%f0, %f6, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.25853
bnei_else.25852:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.25853:
	flw	%f0, 0(%sp)
	fbne	%f3, %f0, fbeq_else.25854
	addi	%v1, %zero, 1
	j	fbeq_cont.25855
fbeq_else.25854:
	addi	%v1, %zero, 0
fbeq_cont.25855:
	beqi	%v1, 0, bnei_else.25856
	j	bnei_cont.25857
bnei_else.25856:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.25857:
	jr	%ra
iter_setup_dirvec_constants.2889:
	blti	%v1, 0, bgti_else.25887
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.25888
	beqi	%a3, 2, bnei_else.25890
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_second_table.2886
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.25889
bnei_else.25890:
	addi	%a3, %zero, 4
	flw	%f0, 470(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 4(%sp)
	lw	%a1, 4(%a0)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f2, 1(%v1)
	lw	%a1, 4(%a0)
	flw	%f3, 1(%a1)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%v1)
	lw	%v1, 4(%a0)
	flw	%f4, 2(%v1)
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	flw	%f2, 3(%sp)
	fblt	%f2, %f0, fbgt_else.25892
	addi	%v1, %zero, 0
	j	fbgt_cont.25893
fbgt_else.25892:
	addi	%v1, %zero, 1
fbgt_cont.25893:
	beqi	%v1, 0, bnei_else.25894
	flw	%f2, 458(%zero)
	fdiv	%f2, %f2, %f0
	fsw	%f2, 0(%v0)
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	fsw	%f1, 1(%v0)
	fdiv	%f1, %f3, %f0
	fneg	%f1, %f1
	fsw	%f1, 2(%v0)
	fdiv	%f0, %f4, %f0
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.25895
bnei_else.25894:
	fsw	%f2, 0(%v0)
bnei_cont.25895:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.25891:
	j	bnei_cont.25889
bnei_else.25888:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_rect_table.2880
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.25889:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.25896
	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.25897
	beqi	%a3, 2, bnei_else.25899
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_second_table.2886
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.25898
bnei_else.25899:
	addi	%a3, %zero, 4
	flw	%f0, 470(%zero)
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	fsw	%f0, 8(%sp)
	sw	%v1, 9(%sp)
	sw	%a2, 10(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 10(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 9(%sp)
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
	flw	%f1, 8(%sp)
	fblt	%f1, %f0, fbgt_else.25901
	addi	%v1, %zero, 0
	j	fbgt_cont.25902
fbgt_else.25901:
	addi	%v1, %zero, 1
fbgt_cont.25902:
	beqi	%v1, 0, bnei_else.25903
	flw	%f1, 458(%zero)
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
	j	bnei_cont.25904
bnei_else.25903:
	fsw	%f1, 0(%v0)
bnei_cont.25904:
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.25900:
	j	bnei_cont.25898
bnei_else.25897:
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_rect_table.2880
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.25898:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2889
bgti_else.25896:
	jr	%ra
bgti_else.25887:
	jr	%ra
setup_dirvec_constants.2892:
	lw	%v1, 0(%zero)
	addi	%v1, %v1, -1
	blti	%v1, 0, bgti_else.25922
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.25923
	beqi	%a3, 2, bnei_else.25925
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_second_table.2886
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.25924
bnei_else.25925:
	addi	%a3, %zero, 4
	flw	%f0, 470(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 4(%sp)
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
	flw	%f1, 3(%sp)
	fblt	%f1, %f0, fbgt_else.25927
	addi	%v1, %zero, 0
	j	fbgt_cont.25928
fbgt_else.25927:
	addi	%v1, %zero, 1
fbgt_cont.25928:
	beqi	%v1, 0, bnei_else.25929
	flw	%f1, 458(%zero)
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
	j	bnei_cont.25930
bnei_else.25929:
	fsw	%f1, 0(%v0)
bnei_cont.25930:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.25926:
	j	bnei_cont.25924
bnei_else.25923:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_rect_table.2880
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.25924:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2889
bgti_else.25922:
	jr	%ra
setup_startp_constants.2894:
	blti	%v1, 0, bgti_else.25933
	lw	%a0, 12(%v1)
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
	beqi	%a2, 2, bnei_else.25934
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.25936
	j	bnei_cont.25935
bgt_else.25936:
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	fmul	%f3, %f0, %f0
	lw	%a3, 4(%a0)
	flw	%f4, 0(%a3)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a3, 4(%a0)
	flw	%f5, 1(%a3)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a3, 4(%a0)
	flw	%f5, 2(%a3)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a3, 3(%a0)
	beqi	%a3, 0, bnei_else.25938
	fmul	%f4, %f1, %f2
	lw	%a3, 9(%a0)
	flw	%f5, 0(%a3)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f2, %f2, %f0
	lw	%a3, 9(%a0)
	flw	%f4, 1(%a3)
	fmul	%f2, %f2, %f4
	fadd	%f2, %f3, %f2
	fmul	%f0, %f0, %f1
	lw	%a0, 9(%a0)
	flw	%f1, 2(%a0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.25939
bnei_else.25938:
	fmov	%f0, %f3
bnei_cont.25939:
	beqi	%a2, 3, bnei_else.25940
	j	bnei_cont.25941
bnei_else.25940:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.25941:
	fsw	%f0, 3(%a1)
bgt_cont.25937:
	j	bnei_cont.25935
bnei_else.25934:
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
bnei_cont.25935:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2894
bgti_else.25933:
	jr	%ra
check_all_inside.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.25943
	lw	%a0, 12(%a0)
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
	beqi	%a1, 1, bnei_else.25944
	beqi	%a1, 2, bnei_else.25946
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)
	flw	%f7, 0(%a1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a1, 4(%a0)
	flw	%f8, 1(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a1, 4(%a0)
	flw	%f8, 2(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a1, 3(%a0)
	beqi	%a1, 0, bnei_else.25948
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	flw	%f8, 0(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f5, %f5, %f3
	lw	%a1, 9(%a0)
	flw	%f7, 1(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4
	lw	%a1, 9(%a0)
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	j	bnei_cont.25949
bnei_else.25948:
	fmov	%f3, %f6
bnei_cont.25949:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.25950
	j	bnei_cont.25951
bnei_else.25950:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.25951:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.25952
	addi	%a1, %zero, 0
	j	fbgt_cont.25953
fbgt_else.25952:
	addi	%a1, %zero, 1
fbgt_cont.25953:
	beqi	%a0, 0, bnei_else.25954
	beqi	%a1, 0, bnei_else.25956
	addi	%a0, %zero, 0
	j	bnei_cont.25955
bnei_else.25956:
	addi	%a0, %zero, 1
bnei_cont.25957:
	j	bnei_cont.25955
bnei_else.25954:
	add	%a0, %zero, %a1
bnei_cont.25955:
	beqi	%a0, 0, bnei_else.25958
	addi	%a0, %zero, 0
	j	bnei_cont.25945
bnei_else.25958:
	addi	%a0, %zero, 1
bnei_cont.25959:
	j	bnei_cont.25945
bnei_else.25946:
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
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.25960
	addi	%a1, %zero, 0
	j	fbgt_cont.25961
fbgt_else.25960:
	addi	%a1, %zero, 1
fbgt_cont.25961:
	beqi	%a0, 0, bnei_else.25962
	beqi	%a1, 0, bnei_else.25964
	addi	%a0, %zero, 0
	j	bnei_cont.25963
bnei_else.25964:
	addi	%a0, %zero, 1
bnei_cont.25965:
	j	bnei_cont.25963
bnei_else.25962:
	add	%a0, %zero, %a1
bnei_cont.25963:
	beqi	%a0, 0, bnei_else.25966
	addi	%a0, %zero, 0
	j	bnei_cont.25945
bnei_else.25966:
	addi	%a0, %zero, 1
bnei_cont.25967:
bnei_cont.25947:
	j	bnei_cont.25945
bnei_else.25944:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.25968
	addi	%a1, %zero, 0
	j	fbgt_cont.25969
fbgt_else.25968:
	addi	%a1, %zero, 1
fbgt_cont.25969:
	beqi	%a1, 0, bnei_else.25970
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.25972
	addi	%a1, %zero, 0
	j	fbgt_cont.25973
fbgt_else.25972:
	addi	%a1, %zero, 1
fbgt_cont.25973:
	beqi	%a1, 0, bnei_else.25974
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.25976
	addi	%a1, %zero, 0
	j	bnei_cont.25971
fbgt_else.25976:
	addi	%a1, %zero, 1
fbgt_cont.25977:
	j	bnei_cont.25971
bnei_else.25974:
	addi	%a1, %zero, 0
bnei_cont.25975:
	j	bnei_cont.25971
bnei_else.25970:
	addi	%a1, %zero, 0
bnei_cont.25971:
	beqi	%a1, 0, bnei_else.25978
	lw	%a0, 6(%a0)
	j	bnei_cont.25979
bnei_else.25978:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.25980
	addi	%a0, %zero, 0
	j	bnei_cont.25981
bnei_else.25980:
	addi	%a0, %zero, 1
bnei_cont.25981:
bnei_cont.25979:
bnei_cont.25945:
	beqi	%a0, 0, bnei_else.25982
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25982:
	addi	%v0, %v0, 1
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.25983
	lw	%a0, 12(%a0)
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
	beqi	%a1, 1, bnei_else.25984
	beqi	%a1, 2, bnei_else.25986
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)
	flw	%f7, 0(%a1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a1, 4(%a0)
	flw	%f8, 1(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a1, 4(%a0)
	flw	%f8, 2(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a1, 3(%a0)
	beqi	%a1, 0, bnei_else.25988
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	flw	%f8, 0(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f5, %f5, %f3
	lw	%a1, 9(%a0)
	flw	%f7, 1(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4
	lw	%a1, 9(%a0)
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	j	bnei_cont.25989
bnei_else.25988:
	fmov	%f3, %f6
bnei_cont.25989:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.25990
	j	bnei_cont.25991
bnei_else.25990:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.25991:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.25992
	addi	%a1, %zero, 0
	j	fbgt_cont.25993
fbgt_else.25992:
	addi	%a1, %zero, 1
fbgt_cont.25993:
	beqi	%a0, 0, bnei_else.25994
	beqi	%a1, 0, bnei_else.25996
	addi	%a0, %zero, 0
	j	bnei_cont.25995
bnei_else.25996:
	addi	%a0, %zero, 1
bnei_cont.25997:
	j	bnei_cont.25995
bnei_else.25994:
	add	%a0, %zero, %a1
bnei_cont.25995:
	beqi	%a0, 0, bnei_else.25998
	addi	%a0, %zero, 0
	j	bnei_cont.25985
bnei_else.25998:
	addi	%a0, %zero, 1
bnei_cont.25999:
	j	bnei_cont.25985
bnei_else.25986:
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
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.26000
	addi	%a1, %zero, 0
	j	fbgt_cont.26001
fbgt_else.26000:
	addi	%a1, %zero, 1
fbgt_cont.26001:
	beqi	%a0, 0, bnei_else.26002
	beqi	%a1, 0, bnei_else.26004
	addi	%a0, %zero, 0
	j	bnei_cont.26003
bnei_else.26004:
	addi	%a0, %zero, 1
bnei_cont.26005:
	j	bnei_cont.26003
bnei_else.26002:
	add	%a0, %zero, %a1
bnei_cont.26003:
	beqi	%a0, 0, bnei_else.26006
	addi	%a0, %zero, 0
	j	bnei_cont.25985
bnei_else.26006:
	addi	%a0, %zero, 1
bnei_cont.26007:
bnei_cont.25987:
	j	bnei_cont.25985
bnei_else.25984:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.26008
	addi	%a1, %zero, 0
	j	fbgt_cont.26009
fbgt_else.26008:
	addi	%a1, %zero, 1
fbgt_cont.26009:
	beqi	%a1, 0, bnei_else.26010
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.26012
	addi	%a1, %zero, 0
	j	fbgt_cont.26013
fbgt_else.26012:
	addi	%a1, %zero, 1
fbgt_cont.26013:
	beqi	%a1, 0, bnei_else.26014
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.26016
	addi	%a1, %zero, 0
	j	bnei_cont.26011
fbgt_else.26016:
	addi	%a1, %zero, 1
fbgt_cont.26017:
	j	bnei_cont.26011
bnei_else.26014:
	addi	%a1, %zero, 0
bnei_cont.26015:
	j	bnei_cont.26011
bnei_else.26010:
	addi	%a1, %zero, 0
bnei_cont.26011:
	beqi	%a1, 0, bnei_else.26018
	lw	%a0, 6(%a0)
	j	bnei_cont.26019
bnei_else.26018:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.26020
	addi	%a0, %zero, 0
	j	bnei_cont.26021
bnei_else.26020:
	addi	%a0, %zero, 1
bnei_cont.26021:
bnei_cont.26019:
bnei_cont.25985:
	beqi	%a0, 0, bnei_else.26022
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26022:
	addi	%v0, %v0, 1
	j	check_all_inside.2919
bnei_else.25983:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25943:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2925:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26054
	lw	%a1, 12(%a0)
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
	lw	%a0, 187(%a0)
	lw	%a3, 1(%a1)
	sw	%a2, 0(%sp)
	fsw	%f4, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%a1, 6(%sp)
	beqi	%a3, 1, bnei_else.26055
	beqi	%a3, 2, bnei_else.26057
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast.2853
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.26056
bnei_else.26057:
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	fblt	%f6, %f7, fbgt_else.26059
	addi	%a3, %zero, 0
	j	fbgt_cont.26060
fbgt_else.26059:
	addi	%a3, %zero, 1
fbgt_cont.26060:
	beqi	%a3, 0, bnei_else.26061
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
	j	bnei_cont.26056
bnei_else.26061:
	addi	%v0, %zero, 0
bnei_cont.26062:
bnei_cont.26058:
	j	bnei_cont.26056
bnei_else.26055:
	addi	%a3, %zero, 184
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2840
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.26056:
	flw	%f0, 135(%zero)
	beqi	%v0, 0, bnei_else.26063
	flw	%f1, 457(%zero)
	fblt	%f0, %f1, fbgt_else.26065
	addi	%v0, %zero, 0
	j	bnei_cont.26064
fbgt_else.26065:
	addi	%v0, %zero, 1
fbgt_cont.26066:
	j	bnei_cont.26064
bnei_else.26063:
	addi	%v0, %zero, 0
bnei_cont.26064:
	beqi	%v0, 0, bnei_else.26067
	flw	%f1, 456(%zero)
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
	beqi	%v0, -1, bnei_else.26068
	lw	%v0, 12(%v0)
	lw	%a0, 5(%v0)
	flw	%f3, 0(%a0)
	fsub	%f3, %f1, %f3
	lw	%a0, 5(%v0)
	flw	%f4, 1(%a0)
	fsub	%f4, %f2, %f4
	lw	%a0, 5(%v0)
	flw	%f5, 2(%a0)
	fsub	%f5, %f0, %f5
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.26070
	beqi	%a0, 2, bnei_else.26072
	fmul	%f6, %f3, %f3
	lw	%a0, 4(%v0)
	flw	%f7, 0(%a0)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a0, 4(%v0)
	flw	%f8, 1(%a0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a0, 4(%v0)
	flw	%f8, 2(%a0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a0, 3(%v0)
	beqi	%a0, 0, bnei_else.26074
	fmul	%f7, %f4, %f5
	lw	%a0, 9(%v0)
	flw	%f8, 0(%a0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f5, %f5, %f3
	lw	%a0, 9(%v0)
	flw	%f7, 1(%a0)
	fmul	%f5, %f5, %f7
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4
	lw	%a0, 9(%v0)
	flw	%f4, 2(%a0)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	j	bnei_cont.26075
bnei_else.26074:
	fmov	%f3, %f6
bnei_cont.26075:
	lw	%a0, 1(%v0)
	beqi	%a0, 3, bnei_else.26076
	j	bnei_cont.26077
bnei_else.26076:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.26077:
	lw	%v0, 6(%v0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.26078
	addi	%a0, %zero, 0
	j	fbgt_cont.26079
fbgt_else.26078:
	addi	%a0, %zero, 1
fbgt_cont.26079:
	beqi	%v0, 0, bnei_else.26080
	beqi	%a0, 0, bnei_else.26082
	addi	%v0, %zero, 0
	j	bnei_cont.26081
bnei_else.26082:
	addi	%v0, %zero, 1
bnei_cont.26083:
	j	bnei_cont.26081
bnei_else.26080:
	add	%v0, %zero, %a0
bnei_cont.26081:
	beqi	%v0, 0, bnei_else.26084
	addi	%v0, %zero, 0
	j	bnei_cont.26071
bnei_else.26084:
	addi	%v0, %zero, 1
bnei_cont.26085:
	j	bnei_cont.26071
bnei_else.26072:
	lw	%a0, 4(%v0)
	flw	%f6, 0(%a0)
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a0)
	fmul	%f4, %f6, %f4
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%v0, 6(%v0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.26086
	addi	%a0, %zero, 0
	j	fbgt_cont.26087
fbgt_else.26086:
	addi	%a0, %zero, 1
fbgt_cont.26087:
	beqi	%v0, 0, bnei_else.26088
	beqi	%a0, 0, bnei_else.26090
	addi	%v0, %zero, 0
	j	bnei_cont.26089
bnei_else.26090:
	addi	%v0, %zero, 1
bnei_cont.26091:
	j	bnei_cont.26089
bnei_else.26088:
	add	%v0, %zero, %a0
bnei_cont.26089:
	beqi	%v0, 0, bnei_else.26092
	addi	%v0, %zero, 0
	j	bnei_cont.26071
bnei_else.26092:
	addi	%v0, %zero, 1
bnei_cont.26093:
bnei_cont.26073:
	j	bnei_cont.26071
bnei_else.26070:
	fabs	%f3, %f3
	lw	%a0, 4(%v0)
	flw	%f6, 0(%a0)
	fblt	%f3, %f6, fbgt_else.26094
	addi	%a0, %zero, 0
	j	fbgt_cont.26095
fbgt_else.26094:
	addi	%a0, %zero, 1
fbgt_cont.26095:
	beqi	%a0, 0, bnei_else.26096
	fabs	%f3, %f4
	lw	%a0, 4(%v0)
	flw	%f4, 1(%a0)
	fblt	%f3, %f4, fbgt_else.26098
	addi	%a0, %zero, 0
	j	fbgt_cont.26099
fbgt_else.26098:
	addi	%a0, %zero, 1
fbgt_cont.26099:
	beqi	%a0, 0, bnei_else.26100
	fabs	%f3, %f5
	lw	%a0, 4(%v0)
	flw	%f4, 2(%a0)
	fblt	%f3, %f4, fbgt_else.26102
	addi	%a0, %zero, 0
	j	bnei_cont.26097
fbgt_else.26102:
	addi	%a0, %zero, 1
fbgt_cont.26103:
	j	bnei_cont.26097
bnei_else.26100:
	addi	%a0, %zero, 0
bnei_cont.26101:
	j	bnei_cont.26097
bnei_else.26096:
	addi	%a0, %zero, 0
bnei_cont.26097:
	beqi	%a0, 0, bnei_else.26104
	lw	%v0, 6(%v0)
	j	bnei_cont.26105
bnei_else.26104:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.26106
	addi	%v0, %zero, 0
	j	bnei_cont.26107
bnei_else.26106:
	addi	%v0, %zero, 1
bnei_cont.26107:
bnei_cont.26105:
bnei_cont.26071:
	beqi	%v0, 0, bnei_else.26108
	addi	%v0, %zero, 0
	j	bnei_cont.26069
bnei_else.26108:
	lw	%v0, 0(%sp)
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	check_all_inside.2919
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.26109:
	j	bnei_cont.26069
bnei_else.26068:
	addi	%v0, %zero, 1
bnei_cont.26069:
	beqi	%v0, 0, bnei_else.26110
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26110:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2925
bnei_else.26067:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.26111
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2925
bnei_else.26111:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26054:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2928:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26123
	lw	%a0, 83(%a0)
	addi	%a1, %zero, 0
	sw	%a1, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.26124
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26124:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26125
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26126
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26126:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26127
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.26128
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26128:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26129
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.26130
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26130:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2928
bnei_else.26129:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26127:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26125:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26123:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2931:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.26166
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.26167
	lw	%a3, 12(%a2)
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
	lw	%a2, 187(%a2)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.26169
	beqi	%t0, 2, bnei_else.26171
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast.2853
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.26170
bnei_else.26171:
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.26173
	addi	%a3, %zero, 0
	j	fbgt_cont.26174
fbgt_else.26173:
	addi	%a3, %zero, 1
fbgt_cont.26174:
	beqi	%a3, 0, bnei_else.26175
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
	j	bnei_cont.26170
bnei_else.26175:
	addi	%v0, %zero, 0
bnei_cont.26176:
bnei_cont.26172:
	j	bnei_cont.26170
bnei_else.26169:
	addi	%t0, %zero, 184
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2840
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.26170:
	beqi	%v0, 0, bnei_else.26177
	flw	%f0, 135(%zero)
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.26179
	addi	%v0, %zero, 0
	j	fbgt_cont.26180
fbgt_else.26179:
	addi	%v0, %zero, 1
fbgt_cont.26180:
	beqi	%v0, 0, bnei_else.26181
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.26183
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26185
	addi	%v0, %zero, 1
	j	bnei_cont.26184
bnei_else.26185:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.26187
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26189
	addi	%v0, %zero, 1
	j	bnei_cont.26184
bnei_else.26189:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.26191
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26193
	addi	%v0, %zero, 1
	j	bnei_cont.26184
bnei_else.26193:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2928
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.26194:
	j	bnei_cont.26184
bnei_else.26191:
	addi	%v0, %zero, 0
bnei_cont.26192:
bnei_cont.26190:
	j	bnei_cont.26184
bnei_else.26187:
	addi	%v0, %zero, 0
bnei_cont.26188:
bnei_cont.26186:
	j	bnei_cont.26184
bnei_else.26183:
	addi	%v0, %zero, 0
bnei_cont.26184:
	beqi	%v0, 0, bnei_else.26195
	addi	%v0, %zero, 1
	j	bnei_cont.26168
bnei_else.26195:
	addi	%v0, %zero, 0
bnei_cont.26196:
	j	bnei_cont.26168
bnei_else.26181:
	addi	%v0, %zero, 0
bnei_cont.26182:
	j	bnei_cont.26168
bnei_else.26177:
	addi	%v0, %zero, 0
bnei_cont.26178:
	j	bnei_cont.26168
bnei_else.26167:
	addi	%v0, %zero, 1
bnei_cont.26168:
	beqi	%v0, 0, bnei_else.26197
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.26198
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26200
	addi	%v0, %zero, 1
	j	bnei_cont.26199
bnei_else.26200:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.26202
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26204
	addi	%v0, %zero, 1
	j	bnei_cont.26199
bnei_else.26204:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.26206
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26208
	addi	%v0, %zero, 1
	j	bnei_cont.26199
bnei_else.26208:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2928
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.26209:
	j	bnei_cont.26199
bnei_else.26206:
	addi	%v0, %zero, 0
bnei_cont.26207:
bnei_cont.26205:
	j	bnei_cont.26199
bnei_else.26202:
	addi	%v0, %zero, 0
bnei_cont.26203:
bnei_cont.26201:
	j	bnei_cont.26199
bnei_else.26198:
	addi	%v0, %zero, 0
bnei_cont.26199:
	beqi	%v0, 0, bnei_else.26210
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26210:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2931
bnei_else.26197:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2931
bnei_else.26166:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2934:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.26269
	lw	%a2, 12(%a1)
	flw	%f0, 159(%zero)
	lw	%a3, 5(%a2)
	flw	%f1, 0(%a3)
	fsub	%f1, %f0, %f1
	addi	%a3, %zero, 1
	flw	%f2, 160(%zero)
	lw	%t0, 5(%a2)
	flw	%f3, 1(%t0)
	fsub	%f3, %f2, %f3
	flw	%f4, 161(%zero)
	lw	%t0, 5(%a2)
	flw	%f5, 2(%t0)
	fsub	%f5, %f4, %f5
	lw	%t0, 1(%a2)
	sw	%a1, 0(%sp)
	sw	%a3, 1(%sp)
	fsw	%f4, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a2, 8(%sp)
	beqi	%t0, 1, bnei_else.26270
	beqi	%t0, 2, bnei_else.26272
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solver_second.2830
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.26271
bnei_else.26272:
	lw	%t0, 4(%a2)
	flw	%f6, 0(%a0)
	flw	%f7, 0(%t0)
	fmul	%f6, %f6, %f7
	flw	%f8, 1(%a0)
	flw	%f9, 1(%t0)
	fmul	%f8, %f8, %f9
	fadd	%f6, %f6, %f8
	flw	%f8, 2(%a0)
	flw	%f10, 2(%t0)
	fmul	%f8, %f8, %f10
	fadd	%f6, %f6, %f8
	flw	%f8, 470(%zero)
	fblt	%f8, %f6, fbgt_else.26274
	addi	%t0, %zero, 0
	j	fbgt_cont.26275
fbgt_else.26274:
	addi	%t0, %zero, 1
fbgt_cont.26275:
	beqi	%t0, 0, bnei_else.26276
	fmul	%f1, %f7, %f1
	fmul	%f3, %f9, %f3
	fadd	%f1, %f1, %f3
	fmul	%f3, %f10, %f5
	fadd	%f1, %f1, %f3
	fneg	%f1, %f1
	fdiv	%f1, %f1, %f6
	fsw	%f1, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.26271
bnei_else.26276:
	addi	%v0, %zero, 0
bnei_cont.26277:
bnei_cont.26273:
	j	bnei_cont.26271
bnei_else.26270:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solver_rect.2805
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.26271:
	beqi	%v0, 0, bnei_else.26278
	flw	%f0, 135(%zero)
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.26279
	addi	%v1, %zero, 0
	j	fbgt_cont.26280
fbgt_else.26279:
	addi	%v1, %zero, 1
fbgt_cont.26280:
	beqi	%v1, 0, bnei_else.26281
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.26283
	addi	%v1, %zero, 0
	j	fbgt_cont.26284
fbgt_else.26283:
	addi	%v1, %zero, 1
fbgt_cont.26284:
	beqi	%v1, 0, bnei_cont.26282
	flw	%f2, 456(%zero)
	fadd	%f0, %f0, %f2
	lw	%a0, 5(%sp)
	flw	%f2, 0(%a0)
	fmul	%f2, %f2, %f0
	flw	%f3, 4(%sp)
	fadd	%f2, %f2, %f3
	flw	%f3, 1(%a0)
	fmul	%f3, %f3, %f0
	flw	%f4, 3(%sp)
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a0)
	fmul	%f4, %f4, %f0
	flw	%f5, 2(%sp)
	fadd	%f4, %f4, %f5
	lw	%v1, 6(%sp)
	lw	%a1, 0(%v1)
	sw	%v0, 9(%sp)
	fsw	%f4, 10(%sp)
	fsw	%f3, 11(%sp)
	fsw	%f2, 12(%sp)
	fsw	%f0, 13(%sp)
	beqi	%a1, -1, bnei_else.26287
	lw	%a1, 12(%a1)
	lw	%a2, 5(%a1)
	flw	%f5, 0(%a2)
	fsub	%f5, %f2, %f5
	lw	%a2, 5(%a1)
	flw	%f6, 1(%a2)
	fsub	%f6, %f3, %f6
	lw	%a2, 5(%a1)
	flw	%f7, 2(%a2)
	fsub	%f7, %f4, %f7
	lw	%a2, 1(%a1)
	beqi	%a2, 1, bnei_else.26289
	beqi	%a2, 2, bnei_else.26291
	fmul	%f8, %f5, %f5
	lw	%a2, 4(%a1)
	flw	%f9, 0(%a2)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	lw	%a2, 4(%a1)
	flw	%f10, 1(%a2)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7
	lw	%a2, 4(%a1)
	flw	%f10, 2(%a2)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%a2, 3(%a1)
	beqi	%a2, 0, bnei_else.26293
	fmul	%f9, %f6, %f7
	lw	%a2, 9(%a1)
	flw	%f10, 0(%a2)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f7, %f7, %f5
	lw	%a2, 9(%a1)
	flw	%f9, 1(%a2)
	fmul	%f7, %f7, %f9
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6
	lw	%a2, 9(%a1)
	flw	%f6, 2(%a2)
	fmul	%f5, %f5, %f6
	fadd	%f5, %f7, %f5
	j	bnei_cont.26294
bnei_else.26293:
	fmov	%f5, %f8
bnei_cont.26294:
	lw	%a2, 1(%a1)
	beqi	%a2, 3, bnei_else.26295
	j	bnei_cont.26296
bnei_else.26295:
	flw	%f6, 474(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.26296:
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.26297
	addi	%a2, %zero, 0
	j	fbgt_cont.26298
fbgt_else.26297:
	addi	%a2, %zero, 1
fbgt_cont.26298:
	beqi	%a1, 0, bnei_else.26299
	beqi	%a2, 0, bnei_else.26301
	addi	%a1, %zero, 0
	j	bnei_cont.26300
bnei_else.26301:
	addi	%a1, %zero, 1
bnei_cont.26302:
	j	bnei_cont.26300
bnei_else.26299:
	add	%a1, %zero, %a2
bnei_cont.26300:
	beqi	%a1, 0, bnei_else.26303
	addi	%a1, %zero, 0
	j	bnei_cont.26290
bnei_else.26303:
	addi	%a1, %zero, 1
bnei_cont.26304:
	j	bnei_cont.26290
bnei_else.26291:
	lw	%a2, 4(%a1)
	flw	%f8, 0(%a2)
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%a2)
	fmul	%f6, %f8, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%a2)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.26305
	addi	%a2, %zero, 0
	j	fbgt_cont.26306
fbgt_else.26305:
	addi	%a2, %zero, 1
fbgt_cont.26306:
	beqi	%a1, 0, bnei_else.26307
	beqi	%a2, 0, bnei_else.26309
	addi	%a1, %zero, 0
	j	bnei_cont.26308
bnei_else.26309:
	addi	%a1, %zero, 1
bnei_cont.26310:
	j	bnei_cont.26308
bnei_else.26307:
	add	%a1, %zero, %a2
bnei_cont.26308:
	beqi	%a1, 0, bnei_else.26311
	addi	%a1, %zero, 0
	j	bnei_cont.26290
bnei_else.26311:
	addi	%a1, %zero, 1
bnei_cont.26312:
bnei_cont.26292:
	j	bnei_cont.26290
bnei_else.26289:
	fabs	%f1, %f5
	lw	%a2, 4(%a1)
	flw	%f5, 0(%a2)
	fblt	%f1, %f5, fbgt_else.26313
	addi	%a2, %zero, 0
	j	fbgt_cont.26314
fbgt_else.26313:
	addi	%a2, %zero, 1
fbgt_cont.26314:
	beqi	%a2, 0, bnei_else.26315
	fabs	%f1, %f6
	lw	%a2, 4(%a1)
	flw	%f5, 1(%a2)
	fblt	%f1, %f5, fbgt_else.26317
	addi	%a2, %zero, 0
	j	fbgt_cont.26318
fbgt_else.26317:
	addi	%a2, %zero, 1
fbgt_cont.26318:
	beqi	%a2, 0, bnei_else.26319
	fabs	%f1, %f7
	lw	%a2, 4(%a1)
	flw	%f5, 2(%a2)
	fblt	%f1, %f5, fbgt_else.26321
	addi	%a2, %zero, 0
	j	bnei_cont.26316
fbgt_else.26321:
	addi	%a2, %zero, 1
fbgt_cont.26322:
	j	bnei_cont.26316
bnei_else.26319:
	addi	%a2, %zero, 0
bnei_cont.26320:
	j	bnei_cont.26316
bnei_else.26315:
	addi	%a2, %zero, 0
bnei_cont.26316:
	beqi	%a2, 0, bnei_else.26323
	lw	%a1, 6(%a1)
	j	bnei_cont.26324
bnei_else.26323:
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.26325
	addi	%a1, %zero, 0
	j	bnei_cont.26326
bnei_else.26325:
	addi	%a1, %zero, 1
bnei_cont.26326:
bnei_cont.26324:
bnei_cont.26290:
	beqi	%a1, 0, bnei_else.26327
	addi	%v0, %zero, 0
	j	bnei_cont.26288
bnei_else.26327:
	lw	%a1, 1(%sp)
	addi	%v0, %a1, 0
	fmov	%f1, %f3
	fmov	%f0, %f2
	fmov	%f2, %f4
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	check_all_inside.2919
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
bnei_cont.26328:
	j	bnei_cont.26288
bnei_else.26287:
	addi	%v0, %zero, 1
bnei_cont.26288:
	beqi	%v0, 0, bnei_cont.26282
	flw	%f0, 13(%sp)
	fsw	%f0, 137(%zero)
	flw	%f0, 12(%sp)
	fsw	%f0, 138(%zero)
	flw	%f0, 11(%sp)
	fsw	%f0, 139(%zero)
	flw	%f0, 10(%sp)
	fsw	%f0, 140(%zero)
	lw	%v0, 0(%sp)
	sw	%v0, 141(%zero)
	lw	%v0, 9(%sp)
	sw	%v0, 136(%zero)
	j	bnei_cont.26282
bnei_else.26329:
bnei_cont.26330:
	j	bnei_cont.26282
bnei_else.26285:
bnei_cont.26286:
	j	bnei_cont.26282
bnei_else.26281:
bnei_cont.26282:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2934
bnei_else.26278:
	lw	%v0, 8(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.26331
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2934
bnei_else.26331:
	jr	%ra
bnei_else.26269:
	jr	%ra
solve_one_or_network.2938:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.26366
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26367
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26368
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element.2934
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26369
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26370
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2934
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26371
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element.2934
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26372
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element.2934
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26373
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2934
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.2938
bnei_else.26373:
	jr	%ra
bnei_else.26372:
	jr	%ra
bnei_else.26371:
	jr	%ra
bnei_else.26370:
	jr	%ra
bnei_else.26369:
	jr	%ra
bnei_else.26368:
	jr	%ra
bnei_else.26367:
	jr	%ra
bnei_else.26366:
	jr	%ra
trace_or_matrix.2942:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.26503
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.26504
	lw	%a3, 12(%a3)
	flw	%f0, 159(%zero)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	flw	%f1, 160(%zero)
	lw	%t0, 5(%a3)
	flw	%f2, 1(%t0)
	fsub	%f1, %f1, %f2
	flw	%f2, 161(%zero)
	lw	%t0, 5(%a3)
	flw	%f3, 2(%t0)
	fsub	%f2, %f2, %f3
	lw	%t0, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t0, 1, bnei_else.26506
	beqi	%t0, 2, bnei_else.26508
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second.2830
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.26507
bnei_else.26508:
	lw	%a3, 4(%a3)
	flw	%f3, 0(%a0)
	flw	%f4, 0(%a3)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%a0)
	flw	%f6, 1(%a3)
	fmul	%f5, %f5, %f6
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%a0)
	flw	%f7, 2(%a3)
	fmul	%f5, %f5, %f7
	fadd	%f3, %f3, %f5
	flw	%f5, 470(%zero)
	fblt	%f5, %f3, fbgt_else.26510
	addi	%a3, %zero, 0
	j	fbgt_cont.26511
fbgt_else.26510:
	addi	%a3, %zero, 1
fbgt_cont.26511:
	beqi	%a3, 0, bnei_else.26512
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.26507
bnei_else.26512:
	addi	%v0, %zero, 0
bnei_cont.26513:
bnei_cont.26509:
	j	bnei_cont.26507
bnei_else.26506:
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect.2805
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.26507:
	beqi	%v0, 0, bnei_cont.26505
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.26516
	addi	%v0, %zero, 0
	j	fbgt_cont.26517
fbgt_else.26516:
	addi	%v0, %zero, 1
fbgt_cont.26517:
	beqi	%v0, 0, bnei_cont.26505
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.26505
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.26505
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.26505
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.26505
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.26505
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.26505
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_cont.26505
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.26505
bnei_else.26532:
bnei_cont.26533:
	j	bnei_cont.26505
bnei_else.26530:
bnei_cont.26531:
	j	bnei_cont.26505
bnei_else.26528:
bnei_cont.26529:
	j	bnei_cont.26505
bnei_else.26526:
bnei_cont.26527:
	j	bnei_cont.26505
bnei_else.26524:
bnei_cont.26525:
	j	bnei_cont.26505
bnei_else.26522:
bnei_cont.26523:
	j	bnei_cont.26505
bnei_else.26520:
bnei_cont.26521:
	j	bnei_cont.26505
bnei_else.26518:
bnei_cont.26519:
	j	bnei_cont.26505
bnei_else.26514:
bnei_cont.26515:
	j	bnei_cont.26505
bnei_else.26504:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.26534
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.26535
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.26535
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.26535
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.26535
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.26535
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_cont.26535
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.26535
bnei_else.26546:
bnei_cont.26547:
	j	bnei_cont.26535
bnei_else.26544:
bnei_cont.26545:
	j	bnei_cont.26535
bnei_else.26542:
bnei_cont.26543:
	j	bnei_cont.26535
bnei_else.26540:
bnei_cont.26541:
	j	bnei_cont.26535
bnei_else.26538:
bnei_cont.26539:
	j	bnei_cont.26535
bnei_else.26536:
bnei_cont.26537:
	j	bnei_cont.26535
bnei_else.26534:
bnei_cont.26535:
bnei_cont.26505:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.26548
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.26549
	addi	%a2, %zero, 159
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver.2836
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_cont.26550
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.26553
	addi	%v0, %zero, 0
	j	fbgt_cont.26554
fbgt_else.26553:
	addi	%v0, %zero, 1
fbgt_cont.26554:
	beqi	%v0, 0, bnei_cont.26550
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.26550
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.26550
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.26550
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.26550
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.26550
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.26550
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.26550
bnei_else.26567:
bnei_cont.26568:
	j	bnei_cont.26550
bnei_else.26565:
bnei_cont.26566:
	j	bnei_cont.26550
bnei_else.26563:
bnei_cont.26564:
	j	bnei_cont.26550
bnei_else.26561:
bnei_cont.26562:
	j	bnei_cont.26550
bnei_else.26559:
bnei_cont.26560:
	j	bnei_cont.26550
bnei_else.26557:
bnei_cont.26558:
	j	bnei_cont.26550
bnei_else.26555:
bnei_cont.26556:
	j	bnei_cont.26550
bnei_else.26551:
bnei_cont.26552:
	j	bnei_cont.26550
bnei_else.26549:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.26569
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.26570
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.26570
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.26570
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.26570
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.26570
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.26570
bnei_else.26579:
bnei_cont.26580:
	j	bnei_cont.26570
bnei_else.26577:
bnei_cont.26578:
	j	bnei_cont.26570
bnei_else.26575:
bnei_cont.26576:
	j	bnei_cont.26570
bnei_else.26573:
bnei_cont.26574:
	j	bnei_cont.26570
bnei_else.26571:
bnei_cont.26572:
	j	bnei_cont.26570
bnei_else.26569:
bnei_cont.26570:
bnei_cont.26550:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2942
bnei_else.26548:
	jr	%ra
bnei_else.26503:
	jr	%ra
solve_each_element_fast.2948:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.26616
	lw	%a3, 12(%a2)
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
	beqi	%t3, 1, bnei_else.26617
	beqi	%t3, 2, bnei_else.26619
	flw	%f3, 0(%t2)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.26621
	addi	%t3, %zero, 1
	j	fbeq_cont.26622
fbeq_else.26621:
	addi	%t3, %zero, 0
fbeq_cont.26622:
	beqi	%t3, 0, bnei_else.26623
	addi	%v0, %zero, 0
	j	bnei_cont.26618
bnei_else.26623:
	flw	%f5, 1(%t2)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%t2)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t0)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.26625
	addi	%t0, %zero, 0
	j	fbgt_cont.26626
fbgt_else.26625:
	addi	%t0, %zero, 1
fbgt_cont.26626:
	beqi	%t0, 0, bnei_else.26627
	lw	%t0, 6(%a3)
	beqi	%t0, 0, bnei_else.26629
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.26630
bnei_else.26629:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.26630:
	addi	%v0, %zero, 1
	j	bnei_cont.26618
bnei_else.26627:
	addi	%v0, %zero, 0
bnei_cont.26628:
bnei_cont.26624:
	j	bnei_cont.26618
bnei_else.26619:
	flw	%f0, 0(%t2)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.26631
	addi	%t2, %zero, 0
	j	fbgt_cont.26632
fbgt_else.26631:
	addi	%t2, %zero, 1
fbgt_cont.26632:
	beqi	%t2, 0, bnei_else.26633
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.26618
bnei_else.26633:
	addi	%v0, %zero, 0
bnei_cont.26634:
bnei_cont.26620:
	j	bnei_cont.26618
bnei_else.26617:
	lw	%t0, 0(%a0)
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2840
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.26618:
	beqi	%v0, 0, bnei_else.26635
	flw	%f0, 135(%zero)
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.26636
	addi	%v1, %zero, 0
	j	fbgt_cont.26637
fbgt_else.26636:
	addi	%v1, %zero, 1
fbgt_cont.26637:
	beqi	%v1, 0, bnei_else.26638
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.26640
	addi	%v1, %zero, 0
	j	fbgt_cont.26641
fbgt_else.26640:
	addi	%v1, %zero, 1
fbgt_cont.26641:
	beqi	%v1, 0, bnei_cont.26639
	flw	%f2, 456(%zero)
	fadd	%f0, %f0, %f2
	lw	%v1, 2(%sp)
	flw	%f2, 0(%v1)
	fmul	%f2, %f2, %f0
	flw	%f3, 162(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 1(%v1)
	fmul	%f3, %f3, %f0
	flw	%f4, 163(%zero)
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)
	fmul	%f4, %f4, %f0
	flw	%f5, 164(%zero)
	fadd	%f4, %f4, %f5
	lw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	sw	%v0, 7(%sp)
	fsw	%f4, 8(%sp)
	fsw	%f3, 9(%sp)
	fsw	%f2, 10(%sp)
	fsw	%f0, 11(%sp)
	beqi	%a0, -1, bnei_else.26644
	lw	%a0, 12(%a0)
	lw	%a1, 5(%a0)
	flw	%f5, 0(%a1)
	fsub	%f5, %f2, %f5
	lw	%a1, 5(%a0)
	flw	%f6, 1(%a1)
	fsub	%f6, %f3, %f6
	lw	%a1, 5(%a0)
	flw	%f7, 2(%a1)
	fsub	%f7, %f4, %f7
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.26646
	beqi	%a1, 2, bnei_else.26648
	fmul	%f8, %f5, %f5
	lw	%a1, 4(%a0)
	flw	%f9, 0(%a1)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	lw	%a1, 4(%a0)
	flw	%f10, 1(%a1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7
	lw	%a1, 4(%a0)
	flw	%f10, 2(%a1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%a1, 3(%a0)
	beqi	%a1, 0, bnei_else.26650
	fmul	%f9, %f6, %f7
	lw	%a1, 9(%a0)
	flw	%f10, 0(%a1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f7, %f7, %f5
	lw	%a1, 9(%a0)
	flw	%f9, 1(%a1)
	fmul	%f7, %f7, %f9
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6
	lw	%a1, 9(%a0)
	flw	%f6, 2(%a1)
	fmul	%f5, %f5, %f6
	fadd	%f5, %f7, %f5
	j	bnei_cont.26651
bnei_else.26650:
	fmov	%f5, %f8
bnei_cont.26651:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.26652
	j	bnei_cont.26653
bnei_else.26652:
	flw	%f6, 474(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.26653:
	lw	%a0, 6(%a0)
	fblt	%f5, %f1, fbgt_else.26654
	addi	%a1, %zero, 0
	j	fbgt_cont.26655
fbgt_else.26654:
	addi	%a1, %zero, 1
fbgt_cont.26655:
	beqi	%a0, 0, bnei_else.26656
	beqi	%a1, 0, bnei_else.26658
	addi	%a0, %zero, 0
	j	bnei_cont.26657
bnei_else.26658:
	addi	%a0, %zero, 1
bnei_cont.26659:
	j	bnei_cont.26657
bnei_else.26656:
	add	%a0, %zero, %a1
bnei_cont.26657:
	beqi	%a0, 0, bnei_else.26660
	addi	%a0, %zero, 0
	j	bnei_cont.26647
bnei_else.26660:
	addi	%a0, %zero, 1
bnei_cont.26661:
	j	bnei_cont.26647
bnei_else.26648:
	lw	%a1, 4(%a0)
	flw	%f8, 0(%a1)
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%a1)
	fmul	%f6, %f8, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%a1)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	lw	%a0, 6(%a0)
	fblt	%f5, %f1, fbgt_else.26662
	addi	%a1, %zero, 0
	j	fbgt_cont.26663
fbgt_else.26662:
	addi	%a1, %zero, 1
fbgt_cont.26663:
	beqi	%a0, 0, bnei_else.26664
	beqi	%a1, 0, bnei_else.26666
	addi	%a0, %zero, 0
	j	bnei_cont.26665
bnei_else.26666:
	addi	%a0, %zero, 1
bnei_cont.26667:
	j	bnei_cont.26665
bnei_else.26664:
	add	%a0, %zero, %a1
bnei_cont.26665:
	beqi	%a0, 0, bnei_else.26668
	addi	%a0, %zero, 0
	j	bnei_cont.26647
bnei_else.26668:
	addi	%a0, %zero, 1
bnei_cont.26669:
bnei_cont.26649:
	j	bnei_cont.26647
bnei_else.26646:
	fabs	%f1, %f5
	lw	%a1, 4(%a0)
	flw	%f5, 0(%a1)
	fblt	%f1, %f5, fbgt_else.26670
	addi	%a1, %zero, 0
	j	fbgt_cont.26671
fbgt_else.26670:
	addi	%a1, %zero, 1
fbgt_cont.26671:
	beqi	%a1, 0, bnei_else.26672
	fabs	%f1, %f6
	lw	%a1, 4(%a0)
	flw	%f5, 1(%a1)
	fblt	%f1, %f5, fbgt_else.26674
	addi	%a1, %zero, 0
	j	fbgt_cont.26675
fbgt_else.26674:
	addi	%a1, %zero, 1
fbgt_cont.26675:
	beqi	%a1, 0, bnei_else.26676
	fabs	%f1, %f7
	lw	%a1, 4(%a0)
	flw	%f5, 2(%a1)
	fblt	%f1, %f5, fbgt_else.26678
	addi	%a1, %zero, 0
	j	bnei_cont.26673
fbgt_else.26678:
	addi	%a1, %zero, 1
fbgt_cont.26679:
	j	bnei_cont.26673
bnei_else.26676:
	addi	%a1, %zero, 0
bnei_cont.26677:
	j	bnei_cont.26673
bnei_else.26672:
	addi	%a1, %zero, 0
bnei_cont.26673:
	beqi	%a1, 0, bnei_else.26680
	lw	%a0, 6(%a0)
	j	bnei_cont.26681
bnei_else.26680:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.26682
	addi	%a0, %zero, 0
	j	bnei_cont.26683
bnei_else.26682:
	addi	%a0, %zero, 1
bnei_cont.26683:
bnei_cont.26681:
bnei_cont.26647:
	beqi	%a0, 0, bnei_else.26684
	addi	%v0, %zero, 0
	j	bnei_cont.26645
bnei_else.26684:
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 0
	fmov	%f1, %f3
	fmov	%f0, %f2
	fmov	%f2, %f4
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	check_all_inside.2919
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.26685:
	j	bnei_cont.26645
bnei_else.26644:
	addi	%v0, %zero, 1
bnei_cont.26645:
	beqi	%v0, 0, bnei_cont.26639
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
	j	bnei_cont.26639
bnei_else.26686:
bnei_cont.26687:
	j	bnei_cont.26639
bnei_else.26642:
bnei_cont.26643:
	j	bnei_cont.26639
bnei_else.26638:
bnei_cont.26639:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2948
bnei_else.26635:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.26688
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2948
bnei_else.26688:
	jr	%ra
bnei_else.26616:
	jr	%ra
solve_one_or_network_fast.2952:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.26723
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26724
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26725
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26726
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26727
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26728
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26729
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26730
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.2952
bnei_else.26730:
	jr	%ra
bnei_else.26729:
	jr	%ra
bnei_else.26728:
	jr	%ra
bnei_else.26727:
	jr	%ra
bnei_else.26726:
	jr	%ra
bnei_else.26725:
	jr	%ra
bnei_else.26724:
	jr	%ra
bnei_else.26723:
	jr	%ra
trace_or_matrix_fast.2956:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.26850
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.26851
	lw	%t0, 12(%a3)
	lw	%t1, 10(%t0)
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a3
	lw	%a3, 0(%at)
	lw	%t2, 1(%t0)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.26853
	beqi	%t2, 2, bnei_else.26855
	flw	%f3, 0(%a3)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.26857
	addi	%t2, %zero, 1
	j	fbeq_cont.26858
fbeq_else.26857:
	addi	%t2, %zero, 0
fbeq_cont.26858:
	beqi	%t2, 0, bnei_else.26859
	addi	%v0, %zero, 0
	j	bnei_cont.26854
bnei_else.26859:
	flw	%f5, 1(%a3)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%a3)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a3)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t1)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.26861
	addi	%t1, %zero, 0
	j	fbgt_cont.26862
fbgt_else.26861:
	addi	%t1, %zero, 1
fbgt_cont.26862:
	beqi	%t1, 0, bnei_else.26863
	lw	%t0, 6(%t0)
	beqi	%t0, 0, bnei_else.26865
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.26866
bnei_else.26865:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.26866:
	addi	%v0, %zero, 1
	j	bnei_cont.26854
bnei_else.26863:
	addi	%v0, %zero, 0
bnei_cont.26864:
bnei_cont.26860:
	j	bnei_cont.26854
bnei_else.26855:
	flw	%f0, 0(%a3)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.26867
	addi	%a3, %zero, 0
	j	fbgt_cont.26868
fbgt_else.26867:
	addi	%a3, %zero, 1
fbgt_cont.26868:
	beqi	%a3, 0, bnei_else.26869
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.26854
bnei_else.26869:
	addi	%v0, %zero, 0
bnei_cont.26870:
bnei_cont.26856:
	j	bnei_cont.26854
bnei_else.26853:
	lw	%t1, 0(%a0)
	addi	%a0, %a3, 0
	addi	%v1, %t1, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_fast.2840
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.26854:
	beqi	%v0, 0, bnei_cont.26852
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.26873
	addi	%v0, %zero, 0
	j	fbgt_cont.26874
fbgt_else.26873:
	addi	%v0, %zero, 1
fbgt_cont.26874:
	beqi	%v0, 0, bnei_cont.26852
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.26852
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.26852
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.26852
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.26852
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.26852
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.26852
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_cont.26852
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.26852
bnei_else.26889:
bnei_cont.26890:
	j	bnei_cont.26852
bnei_else.26887:
bnei_cont.26888:
	j	bnei_cont.26852
bnei_else.26885:
bnei_cont.26886:
	j	bnei_cont.26852
bnei_else.26883:
bnei_cont.26884:
	j	bnei_cont.26852
bnei_else.26881:
bnei_cont.26882:
	j	bnei_cont.26852
bnei_else.26879:
bnei_cont.26880:
	j	bnei_cont.26852
bnei_else.26877:
bnei_cont.26878:
	j	bnei_cont.26852
bnei_else.26875:
bnei_cont.26876:
	j	bnei_cont.26852
bnei_else.26871:
bnei_cont.26872:
	j	bnei_cont.26852
bnei_else.26851:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.26891
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.26892
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.26892
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.26892
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.26892
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.26892
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_cont.26892
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.26892
bnei_else.26903:
bnei_cont.26904:
	j	bnei_cont.26892
bnei_else.26901:
bnei_cont.26902:
	j	bnei_cont.26892
bnei_else.26899:
bnei_cont.26900:
	j	bnei_cont.26892
bnei_else.26897:
bnei_cont.26898:
	j	bnei_cont.26892
bnei_else.26895:
bnei_cont.26896:
	j	bnei_cont.26892
bnei_else.26893:
bnei_cont.26894:
	j	bnei_cont.26892
bnei_else.26891:
bnei_cont.26892:
bnei_cont.26852:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.26905
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.26906
	lw	%a2, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_fast2.2877
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_cont.26907
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.26910
	addi	%v0, %zero, 0
	j	fbgt_cont.26911
fbgt_else.26910:
	addi	%v0, %zero, 1
fbgt_cont.26911:
	beqi	%v0, 0, bnei_cont.26907
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.26907
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.26907
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.26907
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.26907
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.26907
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.26907
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.26907
bnei_else.26924:
bnei_cont.26925:
	j	bnei_cont.26907
bnei_else.26922:
bnei_cont.26923:
	j	bnei_cont.26907
bnei_else.26920:
bnei_cont.26921:
	j	bnei_cont.26907
bnei_else.26918:
bnei_cont.26919:
	j	bnei_cont.26907
bnei_else.26916:
bnei_cont.26917:
	j	bnei_cont.26907
bnei_else.26914:
bnei_cont.26915:
	j	bnei_cont.26907
bnei_else.26912:
bnei_cont.26913:
	j	bnei_cont.26907
bnei_else.26908:
bnei_cont.26909:
	j	bnei_cont.26907
bnei_else.26906:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.26926
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.26927
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.26927
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.26927
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.26927
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.26927
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.26927
bnei_else.26936:
bnei_cont.26937:
	j	bnei_cont.26927
bnei_else.26934:
bnei_cont.26935:
	j	bnei_cont.26927
bnei_else.26932:
bnei_cont.26933:
	j	bnei_cont.26927
bnei_else.26930:
bnei_cont.26931:
	j	bnei_cont.26927
bnei_else.26928:
bnei_cont.26929:
	j	bnei_cont.26927
bnei_else.26926:
bnei_cont.26927:
bnei_cont.26907:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2956
bnei_else.26905:
	jr	%ra
bnei_else.26850:
	jr	%ra
get_nvector_second.2966:
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
	beqi	%v1, 0, bnei_else.26941
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 473(%zero)
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
	j	bnei_cont.26942
bnei_else.26941:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.26942:
	lw	%v0, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 470(%zero)
	fbne	%f1, %f4, fbeq_else.26943
	addi	%v1, %zero, 1
	j	fbeq_cont.26944
fbeq_else.26943:
	addi	%v1, %zero, 0
fbeq_cont.26944:
	beqi	%v1, 0, bnei_else.26945
	flw	%f1, 474(%zero)
	j	bnei_cont.26946
bnei_else.26945:
	beqi	%v0, 0, bnei_else.26947
	flw	%f4, 458(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.26948
bnei_else.26947:
	flw	%f4, 474(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.26948:
bnei_cont.26946:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	jr	%ra
utexture.2971:
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
	beqi	%a0, 1, bnei_else.27049
	beqi	%a0, 2, bnei_else.27050
	beqi	%a0, 3, bnei_else.27051
	beqi	%a0, 4, bnei_else.27052
	jr	%ra
bnei_else.27052:
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
	flw	%f4, 454(%zero)
	fblt	%f3, %f4, fbgt_else.27054
	addi	%a0, %zero, 0
	j	fbgt_cont.27055
fbgt_else.27054:
	addi	%a0, %zero, 1
fbgt_cont.27055:
	beqi	%a0, 0, bnei_else.27056
	flw	%f0, 453(%zero)
	j	bnei_cont.27057
bnei_else.27056:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.27058
	addi	%a0, %zero, 1
	j	fbgt_cont.27059
fbgt_else.27058:
	addi	%a0, %zero, 0
fbgt_cont.27059:
	fabs	%f1, %f0
	flw	%f3, 469(%zero)
	fblt	%f1, %f3, fbgt_else.27060
	flw	%f0, 462(%zero)
	fblt	%f1, %f0, fbgt_else.27062
	flw	%f0, 479(%zero)
	flw	%f3, 474(%zero)
	fdiv	%f1, %f3, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 468(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 467(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 466(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 465(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 464(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 463(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fsub	%f0, %f0, %f1
	j	fbgt_cont.27063
fbgt_else.27062:
	flw	%f0, 478(%zero)
	flw	%f3, 474(%zero)
	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f5, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 468(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 467(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 466(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 465(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 464(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 463(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
fbgt_cont.27063:
	beqi	%a0, 0, bnei_else.27064
	j	fbgt_cont.27061
bnei_else.27064:
	fneg	%f0, %f0
bnei_cont.27065:
	j	fbgt_cont.27061
fbgt_else.27060:
	fmul	%f1, %f0, %f0
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	flw	%f6, 468(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f1
	fsub	%f6, %f0, %f6
	flw	%f7, 467(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fadd	%f6, %f6, %f7
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fsub	%f1, %f6, %f1
	flw	%f6, 463(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f3
	fmul	%f0, %f0, %f5
	fadd	%f0, %f1, %f0
fbgt_cont.27061:
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 451(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.27057:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v0, 4(%v0)
	flw	%f3, 1(%v0)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.27066
	addi	%v0, %zero, 0
	j	fbgt_cont.27067
fbgt_else.27066:
	addi	%v0, %zero, 1
fbgt_cont.27067:
	beqi	%v0, 0, bnei_else.27068
	flw	%f1, 453(%zero)
	j	bnei_cont.27069
bnei_else.27068:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 470(%zero)
	fblt	%f1, %f2, fbgt_else.27070
	addi	%v0, %zero, 1
	j	fbgt_cont.27071
fbgt_else.27070:
	addi	%v0, %zero, 0
fbgt_cont.27071:
	fabs	%f2, %f1
	flw	%f3, 469(%zero)
	fblt	%f2, %f3, fbgt_else.27072
	flw	%f1, 462(%zero)
	fblt	%f2, %f1, fbgt_else.27074
	flw	%f1, 479(%zero)
	flw	%f3, 474(%zero)
	fdiv	%f2, %f3, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 468(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 467(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 463(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fsub	%f1, %f1, %f2
	j	fbgt_cont.27075
fbgt_else.27074:
	flw	%f1, 478(%zero)
	flw	%f3, 474(%zero)
	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3
	fdiv	%f2, %f4, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 468(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 467(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 463(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
fbgt_cont.27075:
	beqi	%v0, 0, bnei_else.27076
	j	fbgt_cont.27073
bnei_else.27076:
	fneg	%f1, %f1
bnei_cont.27077:
	j	fbgt_cont.27073
fbgt_else.27072:
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	flw	%f5, 468(%zero)
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f5, %f1, %f5
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fadd	%f5, %f5, %f6
	flw	%f6, 466(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f5, %f5, %f6
	flw	%f6, 465(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fsub	%f2, %f5, %f2
	flw	%f5, 463(%zero)
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
fbgt_cont.27073:
	flw	%f2, 452(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	fdiv	%f1, %f1, %f2
bnei_cont.27069:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 450(%zero)
	flw	%f3, 473(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.27078
	addi	%v0, %zero, 0
	j	fbgt_cont.27079
fbgt_else.27078:
	addi	%v0, %zero, 1
fbgt_cont.27079:
	beqi	%v0, 0, bnei_else.27080
	fmov	%f0, %f1
	j	bnei_cont.27081
bnei_else.27080:
bnei_cont.27081:
	flw	%f1, 449(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.27051:
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
	flw	%f1, 447(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 451(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 495(%zero)
	fabs	%f0, %f0
	flw	%f2, 494(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.27083
	flw	%f3, 493(%zero)
	fblt	%f0, %f3, fbgt_else.27085
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.27087
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.27089
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.27091
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.27093
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.27095
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.27097
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.27099
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.27101
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.27103
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.27105
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.27107
	flw	%f3, 481(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.27084
fbgt_else.27107:
	fmov	%f0, %f3
fbgt_cont.27108:
	j	fbgt_cont.27084
fbgt_else.27105:
	fmov	%f0, %f3
fbgt_cont.27106:
	j	fbgt_cont.27084
fbgt_else.27103:
	fmov	%f0, %f3
fbgt_cont.27104:
	j	fbgt_cont.27084
fbgt_else.27101:
	fmov	%f0, %f3
fbgt_cont.27102:
	j	fbgt_cont.27084
fbgt_else.27099:
	fmov	%f0, %f3
fbgt_cont.27100:
	j	fbgt_cont.27084
fbgt_else.27097:
	fmov	%f0, %f3
fbgt_cont.27098:
	j	fbgt_cont.27084
fbgt_else.27095:
	fmov	%f0, %f3
fbgt_cont.27096:
	j	fbgt_cont.27084
fbgt_else.27093:
	fmov	%f0, %f3
fbgt_cont.27094:
	j	fbgt_cont.27084
fbgt_else.27091:
	fmov	%f0, %f3
fbgt_cont.27092:
	j	fbgt_cont.27084
fbgt_else.27089:
	fmov	%f0, %f3
fbgt_cont.27090:
	j	fbgt_cont.27084
fbgt_else.27087:
	fmov	%f0, %f3
fbgt_cont.27088:
	j	fbgt_cont.27084
fbgt_else.27085:
	fmov	%f0, %f3
fbgt_cont.27086:
	j	fbgt_cont.27084
fbgt_else.27083:
	fmov	%f0, %f2
fbgt_cont.27084:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	fblt	%f1, %f2, fbgt_else.27109
	fblt	%f1, %f0, fbgt_else.27111
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.27110
fbgt_else.27111:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.27112:
	j	fbgt_cont.27110
fbgt_else.27109:
	fmov	%f0, %f1
fbgt_cont.27110:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.27113
	addi	%v0, %zero, 0
	j	fbgt_cont.27114
fbgt_else.27113:
	addi	%v0, %zero, 1
fbgt_cont.27114:
	fblt	%f0, %f1, fbgt_else.27115
	fsub	%f0, %f0, %f1
	j	fbgt_cont.27116
fbgt_else.27115:
fbgt_cont.27116:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.27117
	beqi	%v0, 0, bnei_else.27119
	addi	%v0, %zero, 0
	j	fbgt_cont.27118
bnei_else.27119:
	addi	%v0, %zero, 1
bnei_cont.27120:
	j	fbgt_cont.27118
fbgt_else.27117:
fbgt_cont.27118:
	fblt	%f0, %f2, fbgt_else.27121
	fsub	%f0, %f1, %f0
	j	fbgt_cont.27122
fbgt_else.27121:
fbgt_cont.27122:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.27123
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.27124
fbgt_else.27123:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.27124:
	beqi	%v0, 0, bnei_else.27125
	j	bnei_cont.27126
bnei_else.27125:
	fneg	%f0, %f0
bnei_cont.27126:
	fmul	%f0, %f0, %f0
	flw	%f1, 449(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 474(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.27050:
	flw	%f0, 1(%v1)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 495(%zero)
	flw	%f2, 470(%zero)
	fblt	%f0, %f2, fbgt_else.27128
	addi	%v0, %zero, 1
	j	fbgt_cont.27129
fbgt_else.27128:
	addi	%v0, %zero, 0
fbgt_cont.27129:
	fabs	%f0, %f0
	flw	%f2, 494(%zero)
	sw	%v0, 3(%sp)
	fsw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f2, 6(%sp)
	fblt	%f0, %f2, fbgt_else.27130
	flw	%f3, 493(%zero)
	fblt	%f0, %f3, fbgt_else.27132
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.27134
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.27136
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.27138
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.27140
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.27142
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.27144
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.27146
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.27148
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.27150
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.27152
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.27154
	flw	%f3, 481(%zero)
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	fbgt_cont.27131
fbgt_else.27154:
	fmov	%f0, %f3
fbgt_cont.27155:
	j	fbgt_cont.27131
fbgt_else.27152:
	fmov	%f0, %f3
fbgt_cont.27153:
	j	fbgt_cont.27131
fbgt_else.27150:
	fmov	%f0, %f3
fbgt_cont.27151:
	j	fbgt_cont.27131
fbgt_else.27148:
	fmov	%f0, %f3
fbgt_cont.27149:
	j	fbgt_cont.27131
fbgt_else.27146:
	fmov	%f0, %f3
fbgt_cont.27147:
	j	fbgt_cont.27131
fbgt_else.27144:
	fmov	%f0, %f3
fbgt_cont.27145:
	j	fbgt_cont.27131
fbgt_else.27142:
	fmov	%f0, %f3
fbgt_cont.27143:
	j	fbgt_cont.27131
fbgt_else.27140:
	fmov	%f0, %f3
fbgt_cont.27141:
	j	fbgt_cont.27131
fbgt_else.27138:
	fmov	%f0, %f3
fbgt_cont.27139:
	j	fbgt_cont.27131
fbgt_else.27136:
	fmov	%f0, %f3
fbgt_cont.27137:
	j	fbgt_cont.27131
fbgt_else.27134:
	fmov	%f0, %f3
fbgt_cont.27135:
	j	fbgt_cont.27131
fbgt_else.27132:
	fmov	%f0, %f3
fbgt_cont.27133:
	j	fbgt_cont.27131
fbgt_else.27130:
	fmov	%f0, %f2
fbgt_cont.27131:
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	fblt	%f1, %f2, fbgt_else.27156
	fblt	%f1, %f0, fbgt_else.27158
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	fbgt_cont.27157
fbgt_else.27158:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
fbgt_cont.27159:
	j	fbgt_cont.27157
fbgt_else.27156:
	fmov	%f0, %f1
fbgt_cont.27157:
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.27160
	lw	%v0, 3(%sp)
	beqi	%v0, 0, bnei_else.27162
	addi	%v0, %zero, 0
	j	fbgt_cont.27161
bnei_else.27162:
	addi	%v0, %zero, 1
bnei_cont.27163:
	j	fbgt_cont.27161
fbgt_else.27160:
	lw	%v0, 3(%sp)
fbgt_cont.27161:
	fblt	%f0, %f1, fbgt_else.27164
	fsub	%f0, %f0, %f1
	j	fbgt_cont.27165
fbgt_else.27164:
fbgt_cont.27165:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.27166
	fsub	%f0, %f1, %f0
	j	fbgt_cont.27167
fbgt_else.27166:
fbgt_cont.27167:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.27168
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.27169
fbgt_else.27168:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.27169:
	beqi	%v0, 0, bnei_else.27170
	j	bnei_cont.27171
bnei_else.27170:
	fneg	%f0, %f0
bnei_cont.27171:
	fmul	%f0, %f0, %f0
	flw	%f1, 449(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 474(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.27049:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	flw	%f1, 0(%a0)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 447(%zero)
	fblt	%f0, %f2, fbgt_else.27173
	addi	%a0, %zero, 0
	j	fbgt_cont.27174
fbgt_else.27173:
	addi	%a0, %zero, 1
fbgt_cont.27174:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f4, 2(%v0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.27175
	addi	%v0, %zero, 0
	j	fbgt_cont.27176
fbgt_else.27175:
	addi	%v0, %zero, 1
fbgt_cont.27176:
	beqi	%a0, 0, bnei_else.27177
	beqi	%v0, 0, bnei_else.27179
	flw	%f0, 449(%zero)
	j	bnei_cont.27178
bnei_else.27179:
	flw	%f0, 470(%zero)
bnei_cont.27180:
	j	bnei_cont.27178
bnei_else.27177:
	beqi	%v0, 0, bnei_else.27181
	flw	%f0, 470(%zero)
	j	bnei_cont.27182
bnei_else.27181:
	flw	%f0, 449(%zero)
bnei_cont.27182:
bnei_cont.27178:
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2978:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.27194
	lw	%a1, 254(%v0)
	lw	%a2, 1(%a1)
	flw	%f2, 443(%zero)
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
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)
	fblt	%f1, %f0, fbgt_else.27195
	addi	%v0, %zero, 0
	j	fbgt_cont.27196
fbgt_else.27195:
	addi	%v0, %zero, 1
fbgt_cont.27196:
	beqi	%v0, 0, bnei_else.27197
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27199
	addi	%v0, %zero, 0
	j	bnei_cont.27198
fbgt_else.27199:
	addi	%v0, %zero, 1
fbgt_cont.27200:
	j	bnei_cont.27198
bnei_else.27197:
	addi	%v0, %zero, 0
bnei_cont.27198:
	beqi	%v0, 0, bnei_else.27201
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, bnei_cont.27202
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.27205
	j	bnei_cont.27202
bnei_else.27205:
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
	flw	%f3, 470(%zero)
	fblt	%f3, %f0, fbgt_else.27207
	addi	%v0, %zero, 0
	j	fbgt_cont.27208
fbgt_else.27207:
	addi	%v0, %zero, 1
fbgt_cont.27208:
	beqi	%v0, 0, bnei_else.27209
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
	j	bnei_cont.27210
bnei_else.27209:
bnei_cont.27210:
	fblt	%f3, %f1, fbgt_else.27211
	addi	%v0, %zero, 0
	j	fbgt_cont.27212
fbgt_else.27211:
	addi	%v0, %zero, 1
fbgt_cont.27212:
	beqi	%v0, 0, bnei_cont.27202
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
	j	bnei_cont.27202
bnei_else.27213:
bnei_cont.27214:
bnei_cont.27206:
	j	bnei_cont.27202
beq_else.27203:
beq_cont.27204:
	j	bnei_cont.27202
bnei_else.27201:
bnei_cont.27202:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2978
bgti_else.27194:
	jr	%ra
trace_ray.2983:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.27264
	lw	%a1, 2(%a0)
	addi	%a2, %zero, 0
	flw	%f2, 443(%zero)
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
	jal	trace_or_matrix.2942
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)
	fblt	%f1, %f0, fbgt_else.27265
	addi	%v0, %zero, 0
	j	fbgt_cont.27266
fbgt_else.27265:
	addi	%v0, %zero, 1
fbgt_cont.27266:
	beqi	%v0, 0, bnei_else.27267
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27269
	addi	%v0, %zero, 0
	j	bnei_cont.27268
fbgt_else.27269:
	addi	%v0, %zero, 1
fbgt_cont.27270:
	j	bnei_cont.27268
bnei_else.27267:
	addi	%v0, %zero, 0
bnei_cont.27268:
	beqi	%v0, 0, bnei_else.27271
	lw	%v0, 141(%zero)
	lw	%v1, 12(%v0)
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
	beqi	%a1, 1, bnei_else.27272
	beqi	%a1, 2, bnei_else.27274
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	get_nvector_second.2966
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.27273
bnei_else.27274:
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
bnei_cont.27275:
	j	bnei_cont.27273
bnei_else.27272:
	lw	%a1, 136(%zero)
	flw	%f3, 470(%zero)
	fsw	%f3, 142(%zero)
	fsw	%f3, 143(%zero)
	fsw	%f3, 144(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.27276
	addi	%t0, %zero, 1
	j	fbeq_cont.27277
fbeq_else.27276:
	addi	%t0, %zero, 0
fbeq_cont.27277:
	beqi	%t0, 0, bnei_else.27278
	j	bnei_cont.27279
bnei_else.27278:
	fblt	%f3, %f4, fbgt_else.27280
	addi	%t0, %zero, 0
	j	fbgt_cont.27281
fbgt_else.27280:
	addi	%t0, %zero, 1
fbgt_cont.27281:
	beqi	%t0, 0, bnei_else.27282
	flw	%f3, 474(%zero)
	j	bnei_cont.27283
bnei_else.27282:
	flw	%f3, 458(%zero)
bnei_cont.27283:
bnei_cont.27279:
	fneg	%f3, %f3
	fsw	%f3, 142(%a1)
bnei_cont.27273:
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
	jal	utexture.2971
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
	flw	%f4, 473(%zero)
	fblt	%f3, %f4, fbgt_else.27284
	addi	%a3, %zero, 0
	j	fbgt_cont.27285
fbgt_else.27284:
	addi	%a3, %zero, 1
fbgt_cont.27285:
	beqi	%a3, 0, bnei_else.27286
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.27287
bnei_else.27286:
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
	flw	%f3, 441(%zero)
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
bnei_cont.27287:
	flw	%f3, 440(%zero)
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
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	beqi	%v0, 0, bnei_else.27288
	j	bnei_cont.27289
bnei_else.27288:
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
	flw	%f2, 470(%zero)
	fblt	%f2, %f1, fbgt_else.27290
	addi	%v1, %zero, 0
	j	fbgt_cont.27291
fbgt_else.27290:
	addi	%v1, %zero, 1
fbgt_cont.27291:
	beqi	%v1, 0, bnei_else.27292
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
	j	bnei_cont.27293
bnei_else.27292:
bnei_cont.27293:
	fblt	%f2, %f0, fbgt_else.27294
	addi	%v1, %zero, 0
	j	fbgt_cont.27295
fbgt_else.27294:
	addi	%v1, %zero, 1
fbgt_cont.27295:
	beqi	%v1, 0, bnei_else.27296
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
	j	bnei_cont.27297
bnei_else.27296:
bnei_cont.27297:
bnei_cont.27289:
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v0, 434(%zero)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 17(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_reflections.2978
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f0, 439(%zero)
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.27298
	addi	%v0, %zero, 0
	j	fbgt_cont.27299
fbgt_else.27298:
	addi	%v0, %zero, 1
fbgt_cont.27299:
	beqi	%v0, 0, bnei_else.27300
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.27301
	j	bgti_cont.27302
bgti_else.27301:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.27302:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.27303
	jr	%ra
bnei_else.27303:
	flw	%f0, 474(%zero)
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
	j	trace_ray.2983
bnei_else.27300:
	jr	%ra
bnei_else.27271:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.27306
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
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.27307
	addi	%v0, %zero, 0
	j	fbgt_cont.27308
fbgt_else.27307:
	addi	%v0, %zero, 1
fbgt_cont.27308:
	beqi	%v0, 0, bnei_else.27309
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
bnei_else.27309:
	jr	%ra
bnei_else.27306:
	jr	%ra
bgt_else.27264:
	jr	%ra
trace_diffuse_ray.2989:
	addi	%v1, %zero, 0
	flw	%f1, 443(%zero)
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
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)
	fblt	%f1, %f0, fbgt_else.27323
	addi	%v0, %zero, 0
	j	fbgt_cont.27324
fbgt_else.27323:
	addi	%v0, %zero, 1
fbgt_cont.27324:
	beqi	%v0, 0, bnei_else.27325
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27327
	addi	%v0, %zero, 0
	j	bnei_cont.27326
fbgt_else.27327:
	addi	%v0, %zero, 1
fbgt_cont.27328:
	j	bnei_cont.27326
bnei_else.27325:
	addi	%v0, %zero, 0
bnei_cont.27326:
	beqi	%v0, 0, bnei_else.27329
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 4(%sp)
	beqi	%a0, 1, bnei_else.27330
	beqi	%a0, 2, bnei_else.27332
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	get_nvector_second.2966
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.27331
bnei_else.27332:
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
bnei_cont.27333:
	j	bnei_cont.27331
bnei_else.27330:
	lw	%a0, 136(%zero)
	flw	%f0, 470(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.27334
	addi	%v1, %zero, 1
	j	fbeq_cont.27335
fbeq_else.27334:
	addi	%v1, %zero, 0
fbeq_cont.27335:
	beqi	%v1, 0, bnei_else.27336
	j	bnei_cont.27337
bnei_else.27336:
	fblt	%f0, %f1, fbgt_else.27338
	addi	%v1, %zero, 0
	j	fbgt_cont.27339
fbgt_else.27338:
	addi	%v1, %zero, 1
fbgt_cont.27339:
	beqi	%v1, 0, bnei_else.27340
	flw	%f0, 474(%zero)
	j	bnei_cont.27341
bnei_else.27340:
	flw	%f0, 458(%zero)
bnei_cont.27341:
bnei_cont.27337:
	fneg	%f0, %f0
	fsw	%f0, 142(%a0)
bnei_cont.27331:
	addi	%v1, %zero, 138
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	utexture.2971
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.27342
	jr	%ra
bnei_else.27342:
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
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.27344
	addi	%v0, %zero, 0
	j	fbgt_cont.27345
fbgt_else.27344:
	addi	%v0, %zero, 1
fbgt_cont.27345:
	beqi	%v0, 0, bnei_else.27346
	j	bnei_cont.27347
bnei_else.27346:
	fmov	%f0, %f1
bnei_cont.27347:
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
bnei_else.27329:
	jr	%ra
iter_trace_diffuse_rays.2992:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.27555
	add	%at, %v0, %a1
	lw	%a3, 0(%at)
	lw	%t0, 0(%a3)
	flw	%f0, 0(%t0)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	addi	%t1, %zero, 1
	flw	%f2, 1(%t0)
	flw	%f3, 1(%v1)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%t0)
	flw	%f4, 2(%v1)
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	flw	%f2, 470(%zero)
	fblt	%f0, %f2, fbgt_else.27556
	addi	%t0, %zero, 0
	j	fbgt_cont.27557
fbgt_else.27556:
	addi	%t0, %zero, 1
fbgt_cont.27557:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f4, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	beqi	%t0, 0, bnei_else.27558
	addi	%a3, %a1, 1
	add	%at, %v0, %a3
	lw	%a3, 0(%at)
	flw	%f5, 438(%zero)
	fdiv	%f0, %f0, %f5
	flw	%f5, 443(%zero)
	fsw	%f5, 137(%zero)
	lw	%t0, 134(%zero)
	lw	%t2, 0(%t0)
	lw	%t3, 0(%t2)
	fsw	%f0, 8(%sp)
	sw	%t0, 9(%sp)
	sw	%a2, 10(%sp)
	sw	%a3, 11(%sp)
	beqi	%t3, -1, bnei_else.27560
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.27562
	sw	%t2, 13(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solver_fast2.2877
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_cont.27563
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.27566
	addi	%v0, %zero, 0
	j	fbgt_cont.27567
fbgt_else.27566:
	addi	%v0, %zero, 1
fbgt_cont.27567:
	beqi	%v0, 0, bnei_cont.27563
	lw	%v0, 13(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.27563
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.27563
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.27563
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.27563
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 13(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.27563
bnei_else.27576:
bnei_cont.27577:
	j	bnei_cont.27563
bnei_else.27574:
bnei_cont.27575:
	j	bnei_cont.27563
bnei_else.27572:
bnei_cont.27573:
	j	bnei_cont.27563
bnei_else.27570:
bnei_cont.27571:
	j	bnei_cont.27563
bnei_else.27568:
bnei_cont.27569:
	j	bnei_cont.27563
bnei_else.27564:
bnei_cont.27565:
	j	bnei_cont.27563
bnei_else.27562:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.27578
	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.27579
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.27579
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.27579
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 13(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.27579
bnei_else.27584:
bnei_cont.27585:
	j	bnei_cont.27579
bnei_else.27582:
bnei_cont.27583:
	j	bnei_cont.27579
bnei_else.27580:
bnei_cont.27581:
	j	bnei_cont.27579
bnei_else.27578:
bnei_cont.27579:
bnei_cont.27563:
	lw	%v0, 12(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.27561
bnei_else.27560:
bnei_cont.27561:
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)
	fblt	%f1, %f0, fbgt_else.27586
	addi	%v0, %zero, 0
	j	fbgt_cont.27587
fbgt_else.27586:
	addi	%v0, %zero, 1
fbgt_cont.27587:
	beqi	%v0, 0, bnei_else.27588
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27590
	addi	%v0, %zero, 0
	j	bnei_cont.27589
fbgt_else.27590:
	addi	%v0, %zero, 1
fbgt_cont.27591:
	j	bnei_cont.27589
bnei_else.27588:
	addi	%v0, %zero, 0
bnei_cont.27589:
	beqi	%v0, 0, bnei_cont.27559
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 14(%sp)
	beqi	%a0, 1, bnei_else.27594
	beqi	%a0, 2, bnei_else.27596
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	get_nvector_second.2966
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.27595
bnei_else.27596:
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
bnei_cont.27597:
	j	bnei_cont.27595
bnei_else.27594:
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.27598
	addi	%v1, %zero, 1
	j	fbeq_cont.27599
fbeq_else.27598:
	addi	%v1, %zero, 0
fbeq_cont.27599:
	beqi	%v1, 0, bnei_else.27600
	fmov	%f1, %f0
	j	bnei_cont.27601
bnei_else.27600:
	fblt	%f0, %f1, fbgt_else.27602
	addi	%v1, %zero, 0
	j	fbgt_cont.27603
fbgt_else.27602:
	addi	%v1, %zero, 1
fbgt_cont.27603:
	beqi	%v1, 0, bnei_else.27604
	flw	%f1, 474(%zero)
	j	bnei_cont.27605
bnei_else.27604:
	flw	%f1, 458(%zero)
bnei_cont.27605:
bnei_cont.27601:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.27595:
	addi	%v1, %zero, 138
	lw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	utexture.2971
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	beqi	%v0, 0, bnei_else.27606
	j	bnei_cont.27559
bnei_else.27606:
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
	fblt	%f1, %f0, fbgt_else.27608
	addi	%v0, %zero, 0
	j	fbgt_cont.27609
fbgt_else.27608:
	addi	%v0, %zero, 1
fbgt_cont.27609:
	beqi	%v0, 0, bnei_else.27610
	j	bnei_cont.27611
bnei_else.27610:
	fmov	%f0, %f1
bnei_cont.27611:
	flw	%f2, 8(%sp)
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
bnei_cont.27607:
	j	bnei_cont.27559
bnei_else.27592:
bnei_cont.27593:
	j	bnei_cont.27559
bnei_else.27558:
	flw	%f5, 437(%zero)
	fdiv	%f0, %f0, %f5
	flw	%f5, 443(%zero)
	fsw	%f5, 137(%zero)
	lw	%t0, 134(%zero)
	lw	%t2, 0(%t0)
	lw	%t3, 0(%t2)
	fsw	%f0, 15(%sp)
	sw	%t0, 16(%sp)
	sw	%a2, 10(%sp)
	sw	%a3, 17(%sp)
	beqi	%t3, -1, bnei_else.27612
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.27614
	sw	%t2, 18(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solver_fast2.2877
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	beqi	%v0, 0, bnei_cont.27615
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.27618
	addi	%v0, %zero, 0
	j	fbgt_cont.27619
fbgt_else.27618:
	addi	%v0, %zero, 1
fbgt_cont.27619:
	beqi	%v0, 0, bnei_cont.27615
	lw	%v0, 18(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.27615
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.27615
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.27615
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.27615
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 18(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.27615
bnei_else.27628:
bnei_cont.27629:
	j	bnei_cont.27615
bnei_else.27626:
bnei_cont.27627:
	j	bnei_cont.27615
bnei_else.27624:
bnei_cont.27625:
	j	bnei_cont.27615
bnei_else.27622:
bnei_cont.27623:
	j	bnei_cont.27615
bnei_else.27620:
bnei_cont.27621:
	j	bnei_cont.27615
bnei_else.27616:
bnei_cont.27617:
	j	bnei_cont.27615
bnei_else.27614:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.27630
	lw	%t3, 83(%t3)
	sw	%t2, 18(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.27631
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.27631
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.27631
	lw	%v1, 83(%v1)
	lw	%a0, 10(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 18(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.27631
bnei_else.27636:
bnei_cont.27637:
	j	bnei_cont.27631
bnei_else.27634:
bnei_cont.27635:
	j	bnei_cont.27631
bnei_else.27632:
bnei_cont.27633:
	j	bnei_cont.27631
bnei_else.27630:
bnei_cont.27631:
bnei_cont.27615:
	lw	%v0, 12(%sp)
	lw	%v1, 16(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.27613
bnei_else.27612:
bnei_cont.27613:
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)
	fblt	%f1, %f0, fbgt_else.27638
	addi	%v0, %zero, 0
	j	fbgt_cont.27639
fbgt_else.27638:
	addi	%v0, %zero, 1
fbgt_cont.27639:
	beqi	%v0, 0, bnei_else.27640
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27642
	addi	%v0, %zero, 0
	j	bnei_cont.27641
fbgt_else.27642:
	addi	%v0, %zero, 1
fbgt_cont.27643:
	j	bnei_cont.27641
bnei_else.27640:
	addi	%v0, %zero, 0
bnei_cont.27641:
	beqi	%v0, 0, bnei_else.27644
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 17(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 19(%sp)
	beqi	%a0, 1, bnei_else.27646
	beqi	%a0, 2, bnei_else.27648
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	get_nvector_second.2966
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bnei_cont.27647
bnei_else.27648:
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
bnei_cont.27649:
	j	bnei_cont.27647
bnei_else.27646:
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.27650
	addi	%v1, %zero, 1
	j	fbeq_cont.27651
fbeq_else.27650:
	addi	%v1, %zero, 0
fbeq_cont.27651:
	beqi	%v1, 0, bnei_else.27652
	fmov	%f1, %f0
	j	bnei_cont.27653
bnei_else.27652:
	fblt	%f0, %f1, fbgt_else.27654
	addi	%v1, %zero, 0
	j	fbgt_cont.27655
fbgt_else.27654:
	addi	%v1, %zero, 1
fbgt_cont.27655:
	beqi	%v1, 0, bnei_else.27656
	flw	%f1, 474(%zero)
	j	bnei_cont.27657
bnei_else.27656:
	flw	%f1, 458(%zero)
bnei_cont.27657:
bnei_cont.27653:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.27647:
	addi	%v1, %zero, 138
	lw	%v0, 19(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	utexture.2971
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	lw	%v0, 10(%sp)
	lw	%v1, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	beqi	%v0, 0, bnei_else.27658
	j	bnei_cont.27645
bnei_else.27658:
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
	fblt	%f1, %f0, fbgt_else.27660
	addi	%v0, %zero, 0
	j	fbgt_cont.27661
fbgt_else.27660:
	addi	%v0, %zero, 1
fbgt_cont.27661:
	beqi	%v0, 0, bnei_else.27662
	j	bnei_cont.27663
bnei_else.27662:
	fmov	%f0, %f1
bnei_cont.27663:
	flw	%f2, 15(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 19(%sp)
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
bnei_cont.27659:
	j	bnei_cont.27645
bnei_else.27644:
bnei_cont.27645:
bnei_cont.27559:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.27664
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
	fblt	%f0, %f1, fbgt_else.27665
	addi	%a1, %zero, 0
	j	fbgt_cont.27666
fbgt_else.27665:
	addi	%a1, %zero, 1
fbgt_cont.27666:
	sw	%v0, 20(%sp)
	beqi	%a1, 0, bnei_else.27667
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bnei_cont.27668
bnei_else.27667:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
bnei_cont.27668:
	lw	%v0, 20(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2992
bgti_else.27664:
	jr	%ra
bgti_else.27555:
	jr	%ra
calc_diffuse_using_1point.3005:
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
	beqi	%v0, 0, bnei_else.27773
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
	jal	setup_startp_constants.2894
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
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.27775
	addi	%a0, %zero, 0
	j	fbgt_cont.27776
fbgt_else.27775:
	addi	%a0, %zero, 1
fbgt_cont.27776:
	beqi	%a0, 0, bnei_else.27777
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.27778
bnei_else.27777:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.27778:
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.27774
bnei_else.27773:
bnei_cont.27774:
	lw	%v0, 4(%sp)
	beqi	%v0, 1, bnei_else.27779
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
	jal	setup_startp_constants.2894
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
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.27781
	addi	%a0, %zero, 0
	j	fbgt_cont.27782
fbgt_else.27781:
	addi	%a0, %zero, 1
fbgt_cont.27782:
	beqi	%a0, 0, bnei_else.27783
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.27784
bnei_else.27783:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.27784:
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.27780
bnei_else.27779:
bnei_cont.27780:
	lw	%v0, 4(%sp)
	beqi	%v0, 2, bnei_else.27785
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
	jal	setup_startp_constants.2894
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
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.27787
	addi	%a0, %zero, 0
	j	fbgt_cont.27788
fbgt_else.27787:
	addi	%a0, %zero, 1
fbgt_cont.27788:
	beqi	%a0, 0, bnei_else.27789
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.27790
bnei_else.27789:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.27790:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.27786
bnei_else.27785:
bnei_cont.27786:
	lw	%v0, 4(%sp)
	beqi	%v0, 3, bnei_else.27791
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
	jal	setup_startp_constants.2894
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
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.27793
	addi	%a0, %zero, 0
	j	fbgt_cont.27794
fbgt_else.27793:
	addi	%a0, %zero, 1
fbgt_cont.27794:
	beqi	%a0, 0, bnei_else.27795
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.27796
bnei_else.27795:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.27796:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.27792
bnei_else.27791:
bnei_cont.27792:
	lw	%v0, 4(%sp)
	beqi	%v0, 4, bnei_else.27797
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
	jal	setup_startp_constants.2894
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
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.27799
	addi	%a0, %zero, 0
	j	fbgt_cont.27800
fbgt_else.27799:
	addi	%a0, %zero, 1
fbgt_cont.27800:
	beqi	%a0, 0, bnei_else.27801
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.27802
bnei_else.27801:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.27802:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.27798
bnei_else.27797:
bnei_cont.27798:
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
calc_diffuse_using_5points.3008:
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
do_without_neighbors.3014:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.27862
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.27863
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.27864
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
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%a0, 5(%sp)
	beqi	%a0, 0, bnei_else.27866
	lw	%t0, 179(%zero)
	flw	%f0, 0(%a2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 164(%zero)
	lw	%t1, 0(%zero)
	addi	%t1, %t1, -1
	sw	%t0, 6(%sp)
	addi	%v1, %t1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 6(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.27867
bnei_else.27866:
bnei_cont.27867:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.27868
	lw	%v1, 180(%zero)
	lw	%a0, 4(%sp)
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 7(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.27869
bnei_else.27868:
bnei_cont.27869:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.27870
	lw	%v1, 181(%zero)
	lw	%a0, 4(%sp)
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 8(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.27871
bnei_else.27870:
bnei_cont.27871:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.27872
	lw	%v1, 182(%zero)
	lw	%a0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 9(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 9(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.27873
bnei_else.27872:
bnei_cont.27873:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.27874
	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%a0, %a0, -1
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 10(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.27875
bnei_else.27874:
bnei_cont.27875:
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
	j	bnei_cont.27865
bnei_else.27864:
bnei_cont.27865:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.27876
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.27877
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 11(%sp)
	beqi	%a0, 0, bnei_else.27878
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	calc_diffuse_using_1point.3005
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.27879
bnei_else.27878:
bnei_cont.27879:
	lw	%v0, 11(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3014
bgti_else.27877:
	jr	%ra
bgt_else.27876:
	jr	%ra
bgti_else.27863:
	jr	%ra
bgt_else.27862:
	jr	%ra
try_exploit_neighbors.3030:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.27901
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.27902
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.27903
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.27905
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.27907
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.27909
	addi	%t1, %zero, 1
	j	beq_cont.27904
beq_else.27909:
	addi	%t1, %zero, 0
beq_cont.27910:
	j	beq_cont.27904
beq_else.27907:
	addi	%t1, %zero, 0
beq_cont.27908:
	j	beq_cont.27904
beq_else.27905:
	addi	%t1, %zero, 0
beq_cont.27906:
	j	beq_cont.27904
beq_else.27903:
	addi	%t1, %zero, 0
beq_cont.27904:
	beqi	%t1, 0, bnei_else.27911
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.27912
	lw	%t1, 5(%t2)
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 5(%t3)
	lw	%t4, 5(%t0)
	addi	%t5, %v0, 1
	add	%at, %a1, %t5
	lw	%t5, 0(%at)
	lw	%t5, 5(%t5)
	add	%at, %a2, %v0
	lw	%t6, 0(%at)
	lw	%t6, 5(%t6)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	flw	%f0, 0(%t1)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)
	fsw	%f0, 150(%zero)
	add	%at, %t3, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t4, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t5, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t6, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t1, 4(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%t1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%t1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%t1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.27913
bnei_else.27912:
bnei_cont.27913:
	addi	%a3, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.27914
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.27915
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.27916
	add	%at, %a2, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.27918
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.27920
	addi	%t2, %v0, 1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.27922
	addi	%t1, %zero, 1
	j	beq_cont.27917
beq_else.27922:
	addi	%t1, %zero, 0
beq_cont.27923:
	j	beq_cont.27917
beq_else.27920:
	addi	%t1, %zero, 0
beq_cont.27921:
	j	beq_cont.27917
beq_else.27918:
	addi	%t1, %zero, 0
beq_cont.27919:
	j	beq_cont.27917
beq_else.27916:
	addi	%t1, %zero, 0
beq_cont.27917:
	beqi	%t1, 0, bnei_else.27924
	lw	%t0, 3(%t0)
	add	%at, %t0, %a3
	lw	%t0, 0(%at)
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%a3, 5(%sp)
	beqi	%t0, 0, bnei_else.27925
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_5points.3008
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.27926
bnei_else.27925:
bnei_cont.27926:
	lw	%v0, 5(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	j	try_exploit_neighbors.3030
bnei_else.27924:
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	j	do_without_neighbors.3014
bgti_else.27915:
	jr	%ra
bgt_else.27914:
	jr	%ra
bnei_else.27911:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.27929
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.27930
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 6(%sp)
	sw	%a3, 7(%sp)
	beqi	%v0, 0, bnei_else.27931
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_diffuse_using_1point.3005
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.27932
bnei_else.27931:
bnei_cont.27932:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 6(%sp)
	j	do_without_neighbors.3014
bgti_else.27930:
	jr	%ra
bgt_else.27929:
	jr	%ra
bgti_else.27902:
	jr	%ra
bgt_else.27901:
	jr	%ra
write_ppm_header.3037:
	addi	%v0, %zero, 80
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 51
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 154(%zero)
	sw	%v0, 1(%sp)
	blti	%v0, 10, bgti_else.29984
	blti	%v0, 20, bgti_else.29986
	blti	%v0, 30, bgti_else.29988
	blti	%v0, 40, bgti_else.29990
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.29992
	blti	%v1, 20, bgti_else.29994
	blti	%v1, 30, bgti_else.29996
	blti	%v1, 40, bgti_else.29998
	addi	%v1, %v1, -40
	addi	%a0, %zero, 8
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub1.2641
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.29985
bgti_else.29998:
	addi	%v0, %zero, 7
bgti_cont.29999:
	j	bgti_cont.29985
bgti_else.29996:
	addi	%v0, %zero, 6
bgti_cont.29997:
	j	bgti_cont.29985
bgti_else.29994:
	addi	%v0, %zero, 5
bgti_cont.29995:
	j	bgti_cont.29985
bgti_else.29992:
	addi	%v0, %zero, 4
bgti_cont.29993:
	j	bgti_cont.29985
bgti_else.29990:
	addi	%v0, %zero, 3
bgti_cont.29991:
	j	bgti_cont.29985
bgti_else.29988:
	addi	%v0, %zero, 2
bgti_cont.29989:
	j	bgti_cont.29985
bgti_else.29986:
	addi	%v0, %zero, 1
bgti_cont.29987:
	j	bgti_cont.29985
bgti_else.29984:
	addi	%v0, %zero, 0
bgti_cont.29985:
	lw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.30000
	blti	%v1, 20, bgti_else.30002
	blti	%v1, 30, bgti_else.30004
	blti	%v1, 40, bgti_else.30006
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30008
	blti	%v1, 20, bgti_else.30010
	blti	%v1, 30, bgti_else.30012
	blti	%v1, 40, bgti_else.30014
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30016
	blti	%v1, 20, bgti_else.30018
	blti	%v1, 30, bgti_else.30020
	blti	%v1, 40, bgti_else.30022
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30024
	blti	%v1, 20, bgti_else.30026
	blti	%v1, 30, bgti_else.30028
	blti	%v1, 40, bgti_else.30030
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30032
	blti	%v1, 20, bgti_else.30034
	blti	%v1, 30, bgti_else.30036
	blti	%v1, 40, bgti_else.30038
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30040
	blti	%v1, 20, bgti_else.30042
	blti	%v1, 30, bgti_else.30044
	blti	%v1, 40, bgti_else.30046
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub2.2644
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.30001
bgti_else.30046:
	addi	%v0, %v1, -30
bgti_cont.30047:
	j	bgti_cont.30001
bgti_else.30044:
	addi	%v0, %v1, -20
bgti_cont.30045:
	j	bgti_cont.30001
bgti_else.30042:
	addi	%v0, %v1, -10
bgti_cont.30043:
	j	bgti_cont.30001
bgti_else.30040:
	add	%v0, %zero, %v1
bgti_cont.30041:
	j	bgti_cont.30001
bgti_else.30038:
	addi	%v0, %v1, -30
bgti_cont.30039:
	j	bgti_cont.30001
bgti_else.30036:
	addi	%v0, %v1, -20
bgti_cont.30037:
	j	bgti_cont.30001
bgti_else.30034:
	addi	%v0, %v1, -10
bgti_cont.30035:
	j	bgti_cont.30001
bgti_else.30032:
	add	%v0, %zero, %v1
bgti_cont.30033:
	j	bgti_cont.30001
bgti_else.30030:
	addi	%v0, %v1, -30
bgti_cont.30031:
	j	bgti_cont.30001
bgti_else.30028:
	addi	%v0, %v1, -20
bgti_cont.30029:
	j	bgti_cont.30001
bgti_else.30026:
	addi	%v0, %v1, -10
bgti_cont.30027:
	j	bgti_cont.30001
bgti_else.30024:
	add	%v0, %zero, %v1
bgti_cont.30025:
	j	bgti_cont.30001
bgti_else.30022:
	addi	%v0, %v1, -30
bgti_cont.30023:
	j	bgti_cont.30001
bgti_else.30020:
	addi	%v0, %v1, -20
bgti_cont.30021:
	j	bgti_cont.30001
bgti_else.30018:
	addi	%v0, %v1, -10
bgti_cont.30019:
	j	bgti_cont.30001
bgti_else.30016:
	add	%v0, %zero, %v1
bgti_cont.30017:
	j	bgti_cont.30001
bgti_else.30014:
	addi	%v0, %v1, -30
bgti_cont.30015:
	j	bgti_cont.30001
bgti_else.30012:
	addi	%v0, %v1, -20
bgti_cont.30013:
	j	bgti_cont.30001
bgti_else.30010:
	addi	%v0, %v1, -10
bgti_cont.30011:
	j	bgti_cont.30001
bgti_else.30008:
	add	%v0, %zero, %v1
bgti_cont.30009:
	j	bgti_cont.30001
bgti_else.30006:
	addi	%v0, %v1, -30
bgti_cont.30007:
	j	bgti_cont.30001
bgti_else.30004:
	addi	%v0, %v1, -20
bgti_cont.30005:
	j	bgti_cont.30001
bgti_else.30002:
	addi	%v0, %v1, -10
bgti_cont.30003:
	j	bgti_cont.30001
bgti_else.30000:
	add	%v0, %zero, %v1
bgti_cont.30001:
	lw	%v1, 2(%sp)
	blt	%zero, %v1, bgt_else.30048
	addi	%v0, %v0, 48
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgt_cont.30049
bgt_else.30048:
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.30050
	blti	%v1, 20, bgti_else.30052
	blti	%v1, 30, bgti_else.30054
	blti	%v1, 40, bgti_else.30056
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.30058
	blti	%a0, 20, bgti_else.30060
	blti	%a0, 30, bgti_else.30062
	blti	%a0, 40, bgti_else.30064
	addi	%a0, %a0, -40
	addi	%a1, %zero, 8
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub1.2641
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.30051
bgti_else.30064:
	addi	%v0, %zero, 7
bgti_cont.30065:
	j	bgti_cont.30051
bgti_else.30062:
	addi	%v0, %zero, 6
bgti_cont.30063:
	j	bgti_cont.30051
bgti_else.30060:
	addi	%v0, %zero, 5
bgti_cont.30061:
	j	bgti_cont.30051
bgti_else.30058:
	addi	%v0, %zero, 4
bgti_cont.30059:
	j	bgti_cont.30051
bgti_else.30056:
	addi	%v0, %zero, 3
bgti_cont.30057:
	j	bgti_cont.30051
bgti_else.30054:
	addi	%v0, %zero, 2
bgti_cont.30055:
	j	bgti_cont.30051
bgti_else.30052:
	addi	%v0, %zero, 1
bgti_cont.30053:
	j	bgti_cont.30051
bgti_else.30050:
	addi	%v0, %zero, 0
bgti_cont.30051:
	lw	%v1, 2(%sp)
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.30066
	blti	%v1, 20, bgti_else.30068
	blti	%v1, 30, bgti_else.30070
	blti	%v1, 40, bgti_else.30072
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30074
	blti	%v1, 20, bgti_else.30076
	blti	%v1, 30, bgti_else.30078
	blti	%v1, 40, bgti_else.30080
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30082
	blti	%v1, 20, bgti_else.30084
	blti	%v1, 30, bgti_else.30086
	blti	%v1, 40, bgti_else.30088
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30090
	blti	%v1, 20, bgti_else.30092
	blti	%v1, 30, bgti_else.30094
	blti	%v1, 40, bgti_else.30096
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30098
	blti	%v1, 20, bgti_else.30100
	blti	%v1, 30, bgti_else.30102
	blti	%v1, 40, bgti_else.30104
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30106
	blti	%v1, 20, bgti_else.30108
	blti	%v1, 30, bgti_else.30110
	blti	%v1, 40, bgti_else.30112
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2644
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.30067
bgti_else.30112:
	addi	%v0, %v1, -30
bgti_cont.30113:
	j	bgti_cont.30067
bgti_else.30110:
	addi	%v0, %v1, -20
bgti_cont.30111:
	j	bgti_cont.30067
bgti_else.30108:
	addi	%v0, %v1, -10
bgti_cont.30109:
	j	bgti_cont.30067
bgti_else.30106:
	add	%v0, %zero, %v1
bgti_cont.30107:
	j	bgti_cont.30067
bgti_else.30104:
	addi	%v0, %v1, -30
bgti_cont.30105:
	j	bgti_cont.30067
bgti_else.30102:
	addi	%v0, %v1, -20
bgti_cont.30103:
	j	bgti_cont.30067
bgti_else.30100:
	addi	%v0, %v1, -10
bgti_cont.30101:
	j	bgti_cont.30067
bgti_else.30098:
	add	%v0, %zero, %v1
bgti_cont.30099:
	j	bgti_cont.30067
bgti_else.30096:
	addi	%v0, %v1, -30
bgti_cont.30097:
	j	bgti_cont.30067
bgti_else.30094:
	addi	%v0, %v1, -20
bgti_cont.30095:
	j	bgti_cont.30067
bgti_else.30092:
	addi	%v0, %v1, -10
bgti_cont.30093:
	j	bgti_cont.30067
bgti_else.30090:
	add	%v0, %zero, %v1
bgti_cont.30091:
	j	bgti_cont.30067
bgti_else.30088:
	addi	%v0, %v1, -30
bgti_cont.30089:
	j	bgti_cont.30067
bgti_else.30086:
	addi	%v0, %v1, -20
bgti_cont.30087:
	j	bgti_cont.30067
bgti_else.30084:
	addi	%v0, %v1, -10
bgti_cont.30085:
	j	bgti_cont.30067
bgti_else.30082:
	add	%v0, %zero, %v1
bgti_cont.30083:
	j	bgti_cont.30067
bgti_else.30080:
	addi	%v0, %v1, -30
bgti_cont.30081:
	j	bgti_cont.30067
bgti_else.30078:
	addi	%v0, %v1, -20
bgti_cont.30079:
	j	bgti_cont.30067
bgti_else.30076:
	addi	%v0, %v1, -10
bgti_cont.30077:
	j	bgti_cont.30067
bgti_else.30074:
	add	%v0, %zero, %v1
bgti_cont.30075:
	j	bgti_cont.30067
bgti_else.30072:
	addi	%v0, %v1, -30
bgti_cont.30073:
	j	bgti_cont.30067
bgti_else.30070:
	addi	%v0, %v1, -20
bgti_cont.30071:
	j	bgti_cont.30067
bgti_else.30068:
	addi	%v0, %v1, -10
bgti_cont.30069:
	j	bgti_cont.30067
bgti_else.30066:
	add	%v0, %zero, %v1
bgti_cont.30067:
	lw	%v1, 4(%sp)
	blt	%zero, %v1, bgt_else.30114
	addi	%v0, %v0, 48
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_print_char
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_print_char
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgt_cont.30115
bgt_else.30114:
	sw	%v0, 5(%sp)
	blti	%v1, 10, bgti_else.30116
	blti	%v1, 20, bgti_else.30118
	blti	%v1, 30, bgti_else.30120
	blti	%v1, 40, bgti_else.30122
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30124
	blti	%v1, 20, bgti_else.30126
	blti	%v1, 30, bgti_else.30128
	blti	%v1, 40, bgti_else.30130
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30132
	blti	%v1, 20, bgti_else.30134
	blti	%v1, 30, bgti_else.30136
	blti	%v1, 40, bgti_else.30138
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30140
	blti	%v1, 20, bgti_else.30142
	blti	%v1, 30, bgti_else.30144
	blti	%v1, 40, bgti_else.30146
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30148
	blti	%v1, 20, bgti_else.30150
	blti	%v1, 30, bgti_else.30152
	blti	%v1, 40, bgti_else.30154
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30156
	blti	%v1, 20, bgti_else.30158
	blti	%v1, 30, bgti_else.30160
	blti	%v1, 40, bgti_else.30162
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.30117
bgti_else.30162:
	addi	%v0, %v1, -30
bgti_cont.30163:
	j	bgti_cont.30117
bgti_else.30160:
	addi	%v0, %v1, -20
bgti_cont.30161:
	j	bgti_cont.30117
bgti_else.30158:
	addi	%v0, %v1, -10
bgti_cont.30159:
	j	bgti_cont.30117
bgti_else.30156:
	add	%v0, %zero, %v1
bgti_cont.30157:
	j	bgti_cont.30117
bgti_else.30154:
	addi	%v0, %v1, -30
bgti_cont.30155:
	j	bgti_cont.30117
bgti_else.30152:
	addi	%v0, %v1, -20
bgti_cont.30153:
	j	bgti_cont.30117
bgti_else.30150:
	addi	%v0, %v1, -10
bgti_cont.30151:
	j	bgti_cont.30117
bgti_else.30148:
	add	%v0, %zero, %v1
bgti_cont.30149:
	j	bgti_cont.30117
bgti_else.30146:
	addi	%v0, %v1, -30
bgti_cont.30147:
	j	bgti_cont.30117
bgti_else.30144:
	addi	%v0, %v1, -20
bgti_cont.30145:
	j	bgti_cont.30117
bgti_else.30142:
	addi	%v0, %v1, -10
bgti_cont.30143:
	j	bgti_cont.30117
bgti_else.30140:
	add	%v0, %zero, %v1
bgti_cont.30141:
	j	bgti_cont.30117
bgti_else.30138:
	addi	%v0, %v1, -30
bgti_cont.30139:
	j	bgti_cont.30117
bgti_else.30136:
	addi	%v0, %v1, -20
bgti_cont.30137:
	j	bgti_cont.30117
bgti_else.30134:
	addi	%v0, %v1, -10
bgti_cont.30135:
	j	bgti_cont.30117
bgti_else.30132:
	add	%v0, %zero, %v1
bgti_cont.30133:
	j	bgti_cont.30117
bgti_else.30130:
	addi	%v0, %v1, -30
bgti_cont.30131:
	j	bgti_cont.30117
bgti_else.30128:
	addi	%v0, %v1, -20
bgti_cont.30129:
	j	bgti_cont.30117
bgti_else.30126:
	addi	%v0, %v1, -10
bgti_cont.30127:
	j	bgti_cont.30117
bgti_else.30124:
	add	%v0, %zero, %v1
bgti_cont.30125:
	j	bgti_cont.30117
bgti_else.30122:
	addi	%v0, %v1, -30
bgti_cont.30123:
	j	bgti_cont.30117
bgti_else.30120:
	addi	%v0, %v1, -20
bgti_cont.30121:
	j	bgti_cont.30117
bgti_else.30118:
	addi	%v0, %v1, -10
bgti_cont.30119:
	j	bgti_cont.30117
bgti_else.30116:
	add	%v0, %zero, %v1
bgti_cont.30117:
	addi	%v0, %v0, 48
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bgt_cont.30115:
bgt_cont.30049:
	addi	%v0, %zero, 32
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 155(%zero)
	sw	%v0, 7(%sp)
	blti	%v0, 10, bgti_else.30164
	blti	%v0, 20, bgti_else.30166
	blti	%v0, 30, bgti_else.30168
	blti	%v0, 40, bgti_else.30170
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.30172
	blti	%v1, 20, bgti_else.30174
	blti	%v1, 30, bgti_else.30176
	blti	%v1, 40, bgti_else.30178
	addi	%v1, %v1, -40
	addi	%a0, %zero, 8
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	print_int_sub1.2641
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bgti_cont.30165
bgti_else.30178:
	addi	%v0, %zero, 7
bgti_cont.30179:
	j	bgti_cont.30165
bgti_else.30176:
	addi	%v0, %zero, 6
bgti_cont.30177:
	j	bgti_cont.30165
bgti_else.30174:
	addi	%v0, %zero, 5
bgti_cont.30175:
	j	bgti_cont.30165
bgti_else.30172:
	addi	%v0, %zero, 4
bgti_cont.30173:
	j	bgti_cont.30165
bgti_else.30170:
	addi	%v0, %zero, 3
bgti_cont.30171:
	j	bgti_cont.30165
bgti_else.30168:
	addi	%v0, %zero, 2
bgti_cont.30169:
	j	bgti_cont.30165
bgti_else.30166:
	addi	%v0, %zero, 1
bgti_cont.30167:
	j	bgti_cont.30165
bgti_else.30164:
	addi	%v0, %zero, 0
bgti_cont.30165:
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	blti	%v1, 10, bgti_else.30180
	blti	%v1, 20, bgti_else.30182
	blti	%v1, 30, bgti_else.30184
	blti	%v1, 40, bgti_else.30186
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30188
	blti	%v1, 20, bgti_else.30190
	blti	%v1, 30, bgti_else.30192
	blti	%v1, 40, bgti_else.30194
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30196
	blti	%v1, 20, bgti_else.30198
	blti	%v1, 30, bgti_else.30200
	blti	%v1, 40, bgti_else.30202
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30204
	blti	%v1, 20, bgti_else.30206
	blti	%v1, 30, bgti_else.30208
	blti	%v1, 40, bgti_else.30210
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30212
	blti	%v1, 20, bgti_else.30214
	blti	%v1, 30, bgti_else.30216
	blti	%v1, 40, bgti_else.30218
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30220
	blti	%v1, 20, bgti_else.30222
	blti	%v1, 30, bgti_else.30224
	blti	%v1, 40, bgti_else.30226
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	print_int_sub2.2644
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bgti_cont.30181
bgti_else.30226:
	addi	%v0, %v1, -30
bgti_cont.30227:
	j	bgti_cont.30181
bgti_else.30224:
	addi	%v0, %v1, -20
bgti_cont.30225:
	j	bgti_cont.30181
bgti_else.30222:
	addi	%v0, %v1, -10
bgti_cont.30223:
	j	bgti_cont.30181
bgti_else.30220:
	add	%v0, %zero, %v1
bgti_cont.30221:
	j	bgti_cont.30181
bgti_else.30218:
	addi	%v0, %v1, -30
bgti_cont.30219:
	j	bgti_cont.30181
bgti_else.30216:
	addi	%v0, %v1, -20
bgti_cont.30217:
	j	bgti_cont.30181
bgti_else.30214:
	addi	%v0, %v1, -10
bgti_cont.30215:
	j	bgti_cont.30181
bgti_else.30212:
	add	%v0, %zero, %v1
bgti_cont.30213:
	j	bgti_cont.30181
bgti_else.30210:
	addi	%v0, %v1, -30
bgti_cont.30211:
	j	bgti_cont.30181
bgti_else.30208:
	addi	%v0, %v1, -20
bgti_cont.30209:
	j	bgti_cont.30181
bgti_else.30206:
	addi	%v0, %v1, -10
bgti_cont.30207:
	j	bgti_cont.30181
bgti_else.30204:
	add	%v0, %zero, %v1
bgti_cont.30205:
	j	bgti_cont.30181
bgti_else.30202:
	addi	%v0, %v1, -30
bgti_cont.30203:
	j	bgti_cont.30181
bgti_else.30200:
	addi	%v0, %v1, -20
bgti_cont.30201:
	j	bgti_cont.30181
bgti_else.30198:
	addi	%v0, %v1, -10
bgti_cont.30199:
	j	bgti_cont.30181
bgti_else.30196:
	add	%v0, %zero, %v1
bgti_cont.30197:
	j	bgti_cont.30181
bgti_else.30194:
	addi	%v0, %v1, -30
bgti_cont.30195:
	j	bgti_cont.30181
bgti_else.30192:
	addi	%v0, %v1, -20
bgti_cont.30193:
	j	bgti_cont.30181
bgti_else.30190:
	addi	%v0, %v1, -10
bgti_cont.30191:
	j	bgti_cont.30181
bgti_else.30188:
	add	%v0, %zero, %v1
bgti_cont.30189:
	j	bgti_cont.30181
bgti_else.30186:
	addi	%v0, %v1, -30
bgti_cont.30187:
	j	bgti_cont.30181
bgti_else.30184:
	addi	%v0, %v1, -20
bgti_cont.30185:
	j	bgti_cont.30181
bgti_else.30182:
	addi	%v0, %v1, -10
bgti_cont.30183:
	j	bgti_cont.30181
bgti_else.30180:
	add	%v0, %zero, %v1
bgti_cont.30181:
	lw	%v1, 8(%sp)
	blt	%zero, %v1, bgt_else.30228
	addi	%v0, %v0, 48
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_print_char
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bgt_cont.30229
bgt_else.30228:
	sw	%v0, 9(%sp)
	blti	%v1, 10, bgti_else.30230
	blti	%v1, 20, bgti_else.30232
	blti	%v1, 30, bgti_else.30234
	blti	%v1, 40, bgti_else.30236
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.30238
	blti	%a0, 20, bgti_else.30240
	blti	%a0, 30, bgti_else.30242
	blti	%a0, 40, bgti_else.30244
	addi	%a0, %a0, -40
	addi	%a1, %zero, 8
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.30231
bgti_else.30244:
	addi	%v0, %zero, 7
bgti_cont.30245:
	j	bgti_cont.30231
bgti_else.30242:
	addi	%v0, %zero, 6
bgti_cont.30243:
	j	bgti_cont.30231
bgti_else.30240:
	addi	%v0, %zero, 5
bgti_cont.30241:
	j	bgti_cont.30231
bgti_else.30238:
	addi	%v0, %zero, 4
bgti_cont.30239:
	j	bgti_cont.30231
bgti_else.30236:
	addi	%v0, %zero, 3
bgti_cont.30237:
	j	bgti_cont.30231
bgti_else.30234:
	addi	%v0, %zero, 2
bgti_cont.30235:
	j	bgti_cont.30231
bgti_else.30232:
	addi	%v0, %zero, 1
bgti_cont.30233:
	j	bgti_cont.30231
bgti_else.30230:
	addi	%v0, %zero, 0
bgti_cont.30231:
	lw	%v1, 8(%sp)
	sw	%v0, 10(%sp)
	blti	%v1, 10, bgti_else.30246
	blti	%v1, 20, bgti_else.30248
	blti	%v1, 30, bgti_else.30250
	blti	%v1, 40, bgti_else.30252
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30254
	blti	%v1, 20, bgti_else.30256
	blti	%v1, 30, bgti_else.30258
	blti	%v1, 40, bgti_else.30260
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30262
	blti	%v1, 20, bgti_else.30264
	blti	%v1, 30, bgti_else.30266
	blti	%v1, 40, bgti_else.30268
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30270
	blti	%v1, 20, bgti_else.30272
	blti	%v1, 30, bgti_else.30274
	blti	%v1, 40, bgti_else.30276
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30278
	blti	%v1, 20, bgti_else.30280
	blti	%v1, 30, bgti_else.30282
	blti	%v1, 40, bgti_else.30284
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30286
	blti	%v1, 20, bgti_else.30288
	blti	%v1, 30, bgti_else.30290
	blti	%v1, 40, bgti_else.30292
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.30247
bgti_else.30292:
	addi	%v0, %v1, -30
bgti_cont.30293:
	j	bgti_cont.30247
bgti_else.30290:
	addi	%v0, %v1, -20
bgti_cont.30291:
	j	bgti_cont.30247
bgti_else.30288:
	addi	%v0, %v1, -10
bgti_cont.30289:
	j	bgti_cont.30247
bgti_else.30286:
	add	%v0, %zero, %v1
bgti_cont.30287:
	j	bgti_cont.30247
bgti_else.30284:
	addi	%v0, %v1, -30
bgti_cont.30285:
	j	bgti_cont.30247
bgti_else.30282:
	addi	%v0, %v1, -20
bgti_cont.30283:
	j	bgti_cont.30247
bgti_else.30280:
	addi	%v0, %v1, -10
bgti_cont.30281:
	j	bgti_cont.30247
bgti_else.30278:
	add	%v0, %zero, %v1
bgti_cont.30279:
	j	bgti_cont.30247
bgti_else.30276:
	addi	%v0, %v1, -30
bgti_cont.30277:
	j	bgti_cont.30247
bgti_else.30274:
	addi	%v0, %v1, -20
bgti_cont.30275:
	j	bgti_cont.30247
bgti_else.30272:
	addi	%v0, %v1, -10
bgti_cont.30273:
	j	bgti_cont.30247
bgti_else.30270:
	add	%v0, %zero, %v1
bgti_cont.30271:
	j	bgti_cont.30247
bgti_else.30268:
	addi	%v0, %v1, -30
bgti_cont.30269:
	j	bgti_cont.30247
bgti_else.30266:
	addi	%v0, %v1, -20
bgti_cont.30267:
	j	bgti_cont.30247
bgti_else.30264:
	addi	%v0, %v1, -10
bgti_cont.30265:
	j	bgti_cont.30247
bgti_else.30262:
	add	%v0, %zero, %v1
bgti_cont.30263:
	j	bgti_cont.30247
bgti_else.30260:
	addi	%v0, %v1, -30
bgti_cont.30261:
	j	bgti_cont.30247
bgti_else.30258:
	addi	%v0, %v1, -20
bgti_cont.30259:
	j	bgti_cont.30247
bgti_else.30256:
	addi	%v0, %v1, -10
bgti_cont.30257:
	j	bgti_cont.30247
bgti_else.30254:
	add	%v0, %zero, %v1
bgti_cont.30255:
	j	bgti_cont.30247
bgti_else.30252:
	addi	%v0, %v1, -30
bgti_cont.30253:
	j	bgti_cont.30247
bgti_else.30250:
	addi	%v0, %v1, -20
bgti_cont.30251:
	j	bgti_cont.30247
bgti_else.30248:
	addi	%v0, %v1, -10
bgti_cont.30249:
	j	bgti_cont.30247
bgti_else.30246:
	add	%v0, %zero, %v1
bgti_cont.30247:
	lw	%v1, 10(%sp)
	blt	%zero, %v1, bgt_else.30294
	addi	%v0, %v0, 48
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgt_cont.30295
bgt_else.30294:
	sw	%v0, 11(%sp)
	blti	%v1, 10, bgti_else.30296
	blti	%v1, 20, bgti_else.30298
	blti	%v1, 30, bgti_else.30300
	blti	%v1, 40, bgti_else.30302
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30304
	blti	%v1, 20, bgti_else.30306
	blti	%v1, 30, bgti_else.30308
	blti	%v1, 40, bgti_else.30310
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30312
	blti	%v1, 20, bgti_else.30314
	blti	%v1, 30, bgti_else.30316
	blti	%v1, 40, bgti_else.30318
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30320
	blti	%v1, 20, bgti_else.30322
	blti	%v1, 30, bgti_else.30324
	blti	%v1, 40, bgti_else.30326
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30328
	blti	%v1, 20, bgti_else.30330
	blti	%v1, 30, bgti_else.30332
	blti	%v1, 40, bgti_else.30334
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30336
	blti	%v1, 20, bgti_else.30338
	blti	%v1, 30, bgti_else.30340
	blti	%v1, 40, bgti_else.30342
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	print_int_sub2.2644
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.30297
bgti_else.30342:
	addi	%v0, %v1, -30
bgti_cont.30343:
	j	bgti_cont.30297
bgti_else.30340:
	addi	%v0, %v1, -20
bgti_cont.30341:
	j	bgti_cont.30297
bgti_else.30338:
	addi	%v0, %v1, -10
bgti_cont.30339:
	j	bgti_cont.30297
bgti_else.30336:
	add	%v0, %zero, %v1
bgti_cont.30337:
	j	bgti_cont.30297
bgti_else.30334:
	addi	%v0, %v1, -30
bgti_cont.30335:
	j	bgti_cont.30297
bgti_else.30332:
	addi	%v0, %v1, -20
bgti_cont.30333:
	j	bgti_cont.30297
bgti_else.30330:
	addi	%v0, %v1, -10
bgti_cont.30331:
	j	bgti_cont.30297
bgti_else.30328:
	add	%v0, %zero, %v1
bgti_cont.30329:
	j	bgti_cont.30297
bgti_else.30326:
	addi	%v0, %v1, -30
bgti_cont.30327:
	j	bgti_cont.30297
bgti_else.30324:
	addi	%v0, %v1, -20
bgti_cont.30325:
	j	bgti_cont.30297
bgti_else.30322:
	addi	%v0, %v1, -10
bgti_cont.30323:
	j	bgti_cont.30297
bgti_else.30320:
	add	%v0, %zero, %v1
bgti_cont.30321:
	j	bgti_cont.30297
bgti_else.30318:
	addi	%v0, %v1, -30
bgti_cont.30319:
	j	bgti_cont.30297
bgti_else.30316:
	addi	%v0, %v1, -20
bgti_cont.30317:
	j	bgti_cont.30297
bgti_else.30314:
	addi	%v0, %v1, -10
bgti_cont.30315:
	j	bgti_cont.30297
bgti_else.30312:
	add	%v0, %zero, %v1
bgti_cont.30313:
	j	bgti_cont.30297
bgti_else.30310:
	addi	%v0, %v1, -30
bgti_cont.30311:
	j	bgti_cont.30297
bgti_else.30308:
	addi	%v0, %v1, -20
bgti_cont.30309:
	j	bgti_cont.30297
bgti_else.30306:
	addi	%v0, %v1, -10
bgti_cont.30307:
	j	bgti_cont.30297
bgti_else.30304:
	add	%v0, %zero, %v1
bgti_cont.30305:
	j	bgti_cont.30297
bgti_else.30302:
	addi	%v0, %v1, -30
bgti_cont.30303:
	j	bgti_cont.30297
bgti_else.30300:
	addi	%v0, %v1, -20
bgti_cont.30301:
	j	bgti_cont.30297
bgti_else.30298:
	addi	%v0, %v1, -10
bgti_cont.30299:
	j	bgti_cont.30297
bgti_else.30296:
	add	%v0, %zero, %v1
bgti_cont.30297:
	addi	%v0, %v0, 48
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_print_char
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_print_char
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_print_char
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bgt_cont.30295:
bgt_cont.30229:
	lw	%v0, 6(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_print_char
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 175
	addi	%v1, %zero, 8
	sw	%v1, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v1, %zero, 15
	sw	%v0, 13(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	blt	%zero, %v1, bgt_else.30344
	addi	%v0, %v0, 48
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgt_cont.30345
bgt_else.30344:
	sw	%v0, 14(%sp)
	blti	%v1, 10, bgti_else.30346
	blti	%v1, 20, bgti_else.30348
	blti	%v1, 30, bgti_else.30350
	blti	%v1, 40, bgti_else.30352
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.30354
	blti	%a0, 20, bgti_else.30356
	blti	%a0, 30, bgti_else.30358
	blti	%a0, 40, bgti_else.30360
	addi	%a0, %a0, -40
	lw	%a1, 12(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub1.2641
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.30347
bgti_else.30360:
	addi	%v0, %zero, 7
bgti_cont.30361:
	j	bgti_cont.30347
bgti_else.30358:
	addi	%v0, %zero, 6
bgti_cont.30359:
	j	bgti_cont.30347
bgti_else.30356:
	addi	%v0, %zero, 5
bgti_cont.30357:
	j	bgti_cont.30347
bgti_else.30354:
	addi	%v0, %zero, 4
bgti_cont.30355:
	j	bgti_cont.30347
bgti_else.30352:
	addi	%v0, %zero, 3
bgti_cont.30353:
	j	bgti_cont.30347
bgti_else.30350:
	addi	%v0, %zero, 2
bgti_cont.30351:
	j	bgti_cont.30347
bgti_else.30348:
	addi	%v0, %zero, 1
bgti_cont.30349:
	j	bgti_cont.30347
bgti_else.30346:
	addi	%v0, %zero, 0
bgti_cont.30347:
	lw	%v1, 13(%sp)
	sw	%v0, 15(%sp)
	blti	%v1, 10, bgti_else.30362
	blti	%v1, 20, bgti_else.30364
	blti	%v1, 30, bgti_else.30366
	blti	%v1, 40, bgti_else.30368
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30370
	blti	%v1, 20, bgti_else.30372
	blti	%v1, 30, bgti_else.30374
	blti	%v1, 40, bgti_else.30376
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30378
	blti	%v1, 20, bgti_else.30380
	blti	%v1, 30, bgti_else.30382
	blti	%v1, 40, bgti_else.30384
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30386
	blti	%v1, 20, bgti_else.30388
	blti	%v1, 30, bgti_else.30390
	blti	%v1, 40, bgti_else.30392
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30394
	blti	%v1, 20, bgti_else.30396
	blti	%v1, 30, bgti_else.30398
	blti	%v1, 40, bgti_else.30400
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30402
	blti	%v1, 20, bgti_else.30404
	blti	%v1, 30, bgti_else.30406
	blti	%v1, 40, bgti_else.30408
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	print_int_sub2.2644
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgti_cont.30363
bgti_else.30408:
	addi	%v0, %v1, -30
bgti_cont.30409:
	j	bgti_cont.30363
bgti_else.30406:
	addi	%v0, %v1, -20
bgti_cont.30407:
	j	bgti_cont.30363
bgti_else.30404:
	addi	%v0, %v1, -10
bgti_cont.30405:
	j	bgti_cont.30363
bgti_else.30402:
	add	%v0, %zero, %v1
bgti_cont.30403:
	j	bgti_cont.30363
bgti_else.30400:
	addi	%v0, %v1, -30
bgti_cont.30401:
	j	bgti_cont.30363
bgti_else.30398:
	addi	%v0, %v1, -20
bgti_cont.30399:
	j	bgti_cont.30363
bgti_else.30396:
	addi	%v0, %v1, -10
bgti_cont.30397:
	j	bgti_cont.30363
bgti_else.30394:
	add	%v0, %zero, %v1
bgti_cont.30395:
	j	bgti_cont.30363
bgti_else.30392:
	addi	%v0, %v1, -30
bgti_cont.30393:
	j	bgti_cont.30363
bgti_else.30390:
	addi	%v0, %v1, -20
bgti_cont.30391:
	j	bgti_cont.30363
bgti_else.30388:
	addi	%v0, %v1, -10
bgti_cont.30389:
	j	bgti_cont.30363
bgti_else.30386:
	add	%v0, %zero, %v1
bgti_cont.30387:
	j	bgti_cont.30363
bgti_else.30384:
	addi	%v0, %v1, -30
bgti_cont.30385:
	j	bgti_cont.30363
bgti_else.30382:
	addi	%v0, %v1, -20
bgti_cont.30383:
	j	bgti_cont.30363
bgti_else.30380:
	addi	%v0, %v1, -10
bgti_cont.30381:
	j	bgti_cont.30363
bgti_else.30378:
	add	%v0, %zero, %v1
bgti_cont.30379:
	j	bgti_cont.30363
bgti_else.30376:
	addi	%v0, %v1, -30
bgti_cont.30377:
	j	bgti_cont.30363
bgti_else.30374:
	addi	%v0, %v1, -20
bgti_cont.30375:
	j	bgti_cont.30363
bgti_else.30372:
	addi	%v0, %v1, -10
bgti_cont.30373:
	j	bgti_cont.30363
bgti_else.30370:
	add	%v0, %zero, %v1
bgti_cont.30371:
	j	bgti_cont.30363
bgti_else.30368:
	addi	%v0, %v1, -30
bgti_cont.30369:
	j	bgti_cont.30363
bgti_else.30366:
	addi	%v0, %v1, -20
bgti_cont.30367:
	j	bgti_cont.30363
bgti_else.30364:
	addi	%v0, %v1, -10
bgti_cont.30365:
	j	bgti_cont.30363
bgti_else.30362:
	add	%v0, %zero, %v1
bgti_cont.30363:
	lw	%v1, 15(%sp)
	blt	%zero, %v1, bgt_else.30410
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_print_char
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 14(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_print_char
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgt_cont.30411
bgt_else.30410:
	sw	%v0, 16(%sp)
	blti	%v1, 10, bgti_else.30412
	blti	%v1, 20, bgti_else.30414
	blti	%v1, 30, bgti_else.30416
	blti	%v1, 40, bgti_else.30418
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30420
	blti	%v1, 20, bgti_else.30422
	blti	%v1, 30, bgti_else.30424
	blti	%v1, 40, bgti_else.30426
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30428
	blti	%v1, 20, bgti_else.30430
	blti	%v1, 30, bgti_else.30432
	blti	%v1, 40, bgti_else.30434
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30436
	blti	%v1, 20, bgti_else.30438
	blti	%v1, 30, bgti_else.30440
	blti	%v1, 40, bgti_else.30442
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30444
	blti	%v1, 20, bgti_else.30446
	blti	%v1, 30, bgti_else.30448
	blti	%v1, 40, bgti_else.30450
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30452
	blti	%v1, 20, bgti_else.30454
	blti	%v1, 30, bgti_else.30456
	blti	%v1, 40, bgti_else.30458
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	print_int_sub2.2644
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.30413
bgti_else.30458:
	addi	%v0, %v1, -30
bgti_cont.30459:
	j	bgti_cont.30413
bgti_else.30456:
	addi	%v0, %v1, -20
bgti_cont.30457:
	j	bgti_cont.30413
bgti_else.30454:
	addi	%v0, %v1, -10
bgti_cont.30455:
	j	bgti_cont.30413
bgti_else.30452:
	add	%v0, %zero, %v1
bgti_cont.30453:
	j	bgti_cont.30413
bgti_else.30450:
	addi	%v0, %v1, -30
bgti_cont.30451:
	j	bgti_cont.30413
bgti_else.30448:
	addi	%v0, %v1, -20
bgti_cont.30449:
	j	bgti_cont.30413
bgti_else.30446:
	addi	%v0, %v1, -10
bgti_cont.30447:
	j	bgti_cont.30413
bgti_else.30444:
	add	%v0, %zero, %v1
bgti_cont.30445:
	j	bgti_cont.30413
bgti_else.30442:
	addi	%v0, %v1, -30
bgti_cont.30443:
	j	bgti_cont.30413
bgti_else.30440:
	addi	%v0, %v1, -20
bgti_cont.30441:
	j	bgti_cont.30413
bgti_else.30438:
	addi	%v0, %v1, -10
bgti_cont.30439:
	j	bgti_cont.30413
bgti_else.30436:
	add	%v0, %zero, %v1
bgti_cont.30437:
	j	bgti_cont.30413
bgti_else.30434:
	addi	%v0, %v1, -30
bgti_cont.30435:
	j	bgti_cont.30413
bgti_else.30432:
	addi	%v0, %v1, -20
bgti_cont.30433:
	j	bgti_cont.30413
bgti_else.30430:
	addi	%v0, %v1, -10
bgti_cont.30431:
	j	bgti_cont.30413
bgti_else.30428:
	add	%v0, %zero, %v1
bgti_cont.30429:
	j	bgti_cont.30413
bgti_else.30426:
	addi	%v0, %v1, -30
bgti_cont.30427:
	j	bgti_cont.30413
bgti_else.30424:
	addi	%v0, %v1, -20
bgti_cont.30425:
	j	bgti_cont.30413
bgti_else.30422:
	addi	%v0, %v1, -10
bgti_cont.30423:
	j	bgti_cont.30413
bgti_else.30420:
	add	%v0, %zero, %v1
bgti_cont.30421:
	j	bgti_cont.30413
bgti_else.30418:
	addi	%v0, %v1, -30
bgti_cont.30419:
	j	bgti_cont.30413
bgti_else.30416:
	addi	%v0, %v1, -20
bgti_cont.30417:
	j	bgti_cont.30413
bgti_else.30414:
	addi	%v0, %v1, -10
bgti_cont.30415:
	j	bgti_cont.30413
bgti_else.30412:
	add	%v0, %zero, %v1
bgti_cont.30413:
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_print_char
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 16(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_print_char
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 14(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_print_char
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
bgt_cont.30411:
bgt_cont.30345:
	lw	%v0, 0(%sp)
	j	min_caml_print_char
pretrace_diffuse_rays.3043:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.30480
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.30481
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.30482
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 470(%zero)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a0, 179(%a0)
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2992
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
	j	bnei_cont.30483
bnei_else.30482:
bnei_cont.30483:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.30484
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.30485
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.30486
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 470(%zero)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a0, 179(%a0)
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
	jal	setup_startp_constants.2894
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
	fblt	%f0, %f1, fbgt_else.30488
	addi	%a0, %zero, 0
	j	fbgt_cont.30489
fbgt_else.30488:
	addi	%a0, %zero, 1
fbgt_cont.30489:
	beqi	%a0, 0, bnei_else.30490
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.30491
bnei_else.30490:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.30491:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2992
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
	j	bnei_cont.30487
bnei_else.30486:
bnei_cont.30487:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3043
bgti_else.30485:
	jr	%ra
bgt_else.30484:
	jr	%ra
bgti_else.30481:
	jr	%ra
bgt_else.30480:
	jr	%ra
pretrace_pixels.3046:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.30520
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
	flw	%f3, 174(%zero)
	fmul	%f4, %f3, %f3
	flw	%f5, 175(%zero)
	fmul	%f6, %f5, %f5
	fadd	%f4, %f4, %f6
	flw	%f6, 176(%zero)
	fmul	%f7, %f6, %f6
	fadd	%f4, %f4, %f7
	fsqrt	%f4, %f4
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.30521
	addi	%a3, %zero, 1
	j	fbeq_cont.30522
fbeq_else.30521:
	addi	%a3, %zero, 0
fbeq_cont.30522:
	beqi	%a3, 0, bnei_else.30523
	flw	%f4, 474(%zero)
	j	bnei_cont.30524
bnei_else.30523:
	flw	%f8, 474(%zero)
	fdiv	%f4, %f8, %f4
bnei_cont.30524:
	fmul	%f3, %f3, %f4
	fsw	%f3, 174(%zero)
	fmul	%f3, %f5, %f4
	fsw	%f3, 175(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f3, 176(%zero)
	fsw	%f7, 151(%zero)
	fsw	%f7, 152(%zero)
	fsw	%f7, 153(%zero)
	flw	%f3, 75(%zero)
	fsw	%f3, 159(%zero)
	flw	%f3, 76(%zero)
	fsw	%f3, 160(%zero)
	flw	%f3, 77(%zero)
	fsw	%f3, 161(%zero)
	flw	%f3, 474(%zero)
	add	%at, %v0, %v1
	lw	%a3, 0(%at)
	addi	%t0, %zero, 174
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a2, 5(%sp)
	fsw	%f7, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%a3, 8(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t0, 0
	addi	%v0, %a1, 0
	fmov	%f1, %f7
	fmov	%f0, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_ray.2983
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 0(%v0)
	flw	%f0, 151(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 152(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 153(%zero)
	fsw	%f0, 2(%v1)
	lw	%v1, 6(%v0)
	lw	%a0, 7(%sp)
	sw	%a0, 0(%v1)
	lw	%v1, 2(%v0)
	lw	%v1, 0(%v1)
	blti	%v1, 0, bgti_else.30525
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.30527
	lw	%v1, 6(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 6(%sp)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%v1, 179(%v1)
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
	sw	%a2, 9(%sp)
	sw	%a1, 10(%sp)
	sw	%v1, 11(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 10(%sp)
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
	flw	%f1, 6(%sp)
	fblt	%f0, %f1, fbgt_else.30529
	addi	%a0, %zero, 0
	j	fbgt_cont.30530
fbgt_else.30529:
	addi	%a0, %zero, 1
fbgt_cont.30530:
	beqi	%a0, 0, bnei_else.30531
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.30532
bnei_else.30531:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.30532:
	addi	%a1, %zero, 116
	lw	%v0, 11(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 5(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.30528
bnei_else.30527:
bnei_cont.30528:
	lw	%v1, 5(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	pretrace_diffuse_rays.3043
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.30526
bgti_else.30525:
bgti_cont.30526:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.30533
	addi	%a0, %v0, -5
	j	bgti_cont.30534
bgti_else.30533:
	add	%a0, %zero, %v0
bgti_cont.30534:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3046
bgti_else.30520:
	jr	%ra
scan_pixel.3057:
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.31978
	jr	%ra
bgt_else.31978:
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
	blt	%t4, %t2, bgt_else.31980
	addi	%t5, %zero, 0
	j	bgt_cont.31981
bgt_else.31980:
	blt	%zero, %v1, bgt_else.31982
	addi	%t5, %zero, 0
	j	bgt_cont.31983
bgt_else.31982:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.31984
	addi	%t5, %zero, 0
	j	bgt_cont.31985
bgt_else.31984:
	blt	%zero, %v0, bgt_else.31986
	addi	%t5, %zero, 0
	j	bgt_cont.31987
bgt_else.31986:
	addi	%t5, %zero, 1
bgt_cont.31987:
bgt_cont.31985:
bgt_cont.31983:
bgt_cont.31981:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%t4, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%a1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a3, 8(%sp)
	beqi	%t5, 0, bnei_else.31988
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bnei_cont.31989
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.31992
	add	%at, %a2, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.31994
	addi	%t6, %v0, -1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.31996
	addi	%t6, %v0, 1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.31998
	addi	%t5, %zero, 1
	j	beq_cont.31993
beq_else.31998:
	addi	%t5, %zero, 0
beq_cont.31999:
	j	beq_cont.31993
beq_else.31996:
	addi	%t5, %zero, 0
beq_cont.31997:
	j	beq_cont.31993
beq_else.31994:
	addi	%t5, %zero, 0
beq_cont.31995:
	j	beq_cont.31993
beq_else.31992:
	addi	%t5, %zero, 0
beq_cont.31993:
	beqi	%t5, 0, bnei_else.32000
	lw	%t1, 3(%t1)
	lw	%t1, 0(%t1)
	sw	%t3, 9(%sp)
	beqi	%t1, 0, bnei_else.32002
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	calc_diffuse_using_5points.3008
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.32003
bnei_else.32002:
bnei_cont.32003:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 5(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.31989
bnei_else.32000:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.32001:
	j	bnei_cont.31989
bgti_else.31990:
bgti_cont.31991:
	j	bnei_cont.31989
bnei_else.31988:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.32004
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.32006
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	calc_diffuse_using_1point.3005
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.32007
bnei_else.32006:
bnei_cont.32007:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.32005
bgti_else.32004:
bgti_cont.32005:
bnei_cont.31989:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32008
	blti	%v0, 0, bgti_else.32010
	j	bgt_cont.32009
bgti_else.32010:
	addi	%v0, %zero, 0
bgti_cont.32011:
	j	bgt_cont.32009
bgt_else.32008:
	addi	%v0, %zero, 255
bgt_cont.32009:
	lw	%v1, 8(%sp)
	sw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	print_int_sub1.2641
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 10
	lw	%a0, 11(%sp)
	sw	%v1, 12(%sp)
	sw	%v0, 13(%sp)
	blti	%a0, 10, bgti_else.32012
	blti	%a0, 20, bgti_else.32014
	blti	%a0, 30, bgti_else.32016
	blti	%a0, 40, bgti_else.32018
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.32020
	blti	%a0, 20, bgti_else.32022
	blti	%a0, 30, bgti_else.32024
	blti	%a0, 40, bgti_else.32026
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.32028
	blti	%a0, 20, bgti_else.32030
	blti	%a0, 30, bgti_else.32032
	blti	%a0, 40, bgti_else.32034
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.32036
	blti	%a0, 20, bgti_else.32038
	blti	%a0, 30, bgti_else.32040
	blti	%a0, 40, bgti_else.32042
	addi	%a0, %a0, -40
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.32013
bgti_else.32042:
	addi	%v0, %a0, -30
bgti_cont.32043:
	j	bgti_cont.32013
bgti_else.32040:
	addi	%v0, %a0, -20
bgti_cont.32041:
	j	bgti_cont.32013
bgti_else.32038:
	addi	%v0, %a0, -10
bgti_cont.32039:
	j	bgti_cont.32013
bgti_else.32036:
	add	%v0, %zero, %a0
bgti_cont.32037:
	j	bgti_cont.32013
bgti_else.32034:
	addi	%v0, %a0, -30
bgti_cont.32035:
	j	bgti_cont.32013
bgti_else.32032:
	addi	%v0, %a0, -20
bgti_cont.32033:
	j	bgti_cont.32013
bgti_else.32030:
	addi	%v0, %a0, -10
bgti_cont.32031:
	j	bgti_cont.32013
bgti_else.32028:
	add	%v0, %zero, %a0
bgti_cont.32029:
	j	bgti_cont.32013
bgti_else.32026:
	addi	%v0, %a0, -30
bgti_cont.32027:
	j	bgti_cont.32013
bgti_else.32024:
	addi	%v0, %a0, -20
bgti_cont.32025:
	j	bgti_cont.32013
bgti_else.32022:
	addi	%v0, %a0, -10
bgti_cont.32023:
	j	bgti_cont.32013
bgti_else.32020:
	add	%v0, %zero, %a0
bgti_cont.32021:
	j	bgti_cont.32013
bgti_else.32018:
	addi	%v0, %a0, -30
bgti_cont.32019:
	j	bgti_cont.32013
bgti_else.32016:
	addi	%v0, %a0, -20
bgti_cont.32017:
	j	bgti_cont.32013
bgti_else.32014:
	addi	%v0, %a0, -10
bgti_cont.32015:
	j	bgti_cont.32013
bgti_else.32012:
	add	%v0, %zero, %a0
bgti_cont.32013:
	lw	%v1, 13(%sp)
	blt	%zero, %v1, bgt_else.32044
	addi	%v0, %v0, 48
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgt_cont.32045
bgt_else.32044:
	lw	%a0, 8(%sp)
	sw	%v0, 14(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub1.2641
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 15(%sp)
	blti	%v1, 10, bgti_else.32046
	blti	%v1, 20, bgti_else.32048
	blti	%v1, 30, bgti_else.32050
	blti	%v1, 40, bgti_else.32052
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32054
	blti	%v1, 20, bgti_else.32056
	blti	%v1, 30, bgti_else.32058
	blti	%v1, 40, bgti_else.32060
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32062
	blti	%v1, 20, bgti_else.32064
	blti	%v1, 30, bgti_else.32066
	blti	%v1, 40, bgti_else.32068
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32070
	blti	%v1, 20, bgti_else.32072
	blti	%v1, 30, bgti_else.32074
	blti	%v1, 40, bgti_else.32076
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	print_int_sub2.2644
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgti_cont.32047
bgti_else.32076:
	addi	%v0, %v1, -30
bgti_cont.32077:
	j	bgti_cont.32047
bgti_else.32074:
	addi	%v0, %v1, -20
bgti_cont.32075:
	j	bgti_cont.32047
bgti_else.32072:
	addi	%v0, %v1, -10
bgti_cont.32073:
	j	bgti_cont.32047
bgti_else.32070:
	add	%v0, %zero, %v1
bgti_cont.32071:
	j	bgti_cont.32047
bgti_else.32068:
	addi	%v0, %v1, -30
bgti_cont.32069:
	j	bgti_cont.32047
bgti_else.32066:
	addi	%v0, %v1, -20
bgti_cont.32067:
	j	bgti_cont.32047
bgti_else.32064:
	addi	%v0, %v1, -10
bgti_cont.32065:
	j	bgti_cont.32047
bgti_else.32062:
	add	%v0, %zero, %v1
bgti_cont.32063:
	j	bgti_cont.32047
bgti_else.32060:
	addi	%v0, %v1, -30
bgti_cont.32061:
	j	bgti_cont.32047
bgti_else.32058:
	addi	%v0, %v1, -20
bgti_cont.32059:
	j	bgti_cont.32047
bgti_else.32056:
	addi	%v0, %v1, -10
bgti_cont.32057:
	j	bgti_cont.32047
bgti_else.32054:
	add	%v0, %zero, %v1
bgti_cont.32055:
	j	bgti_cont.32047
bgti_else.32052:
	addi	%v0, %v1, -30
bgti_cont.32053:
	j	bgti_cont.32047
bgti_else.32050:
	addi	%v0, %v1, -20
bgti_cont.32051:
	j	bgti_cont.32047
bgti_else.32048:
	addi	%v0, %v1, -10
bgti_cont.32049:
	j	bgti_cont.32047
bgti_else.32046:
	add	%v0, %zero, %v1
bgti_cont.32047:
	lw	%v1, 15(%sp)
	blt	%zero, %v1, bgt_else.32078
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_print_char
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 14(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_print_char
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgt_cont.32079
bgt_else.32078:
	sw	%v0, 16(%sp)
	blti	%v1, 10, bgti_else.32080
	blti	%v1, 20, bgti_else.32082
	blti	%v1, 30, bgti_else.32084
	blti	%v1, 40, bgti_else.32086
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32088
	blti	%v1, 20, bgti_else.32090
	blti	%v1, 30, bgti_else.32092
	blti	%v1, 40, bgti_else.32094
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32096
	blti	%v1, 20, bgti_else.32098
	blti	%v1, 30, bgti_else.32100
	blti	%v1, 40, bgti_else.32102
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32104
	blti	%v1, 20, bgti_else.32106
	blti	%v1, 30, bgti_else.32108
	blti	%v1, 40, bgti_else.32110
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	print_int_sub2.2644
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.32081
bgti_else.32110:
	addi	%v0, %v1, -30
bgti_cont.32111:
	j	bgti_cont.32081
bgti_else.32108:
	addi	%v0, %v1, -20
bgti_cont.32109:
	j	bgti_cont.32081
bgti_else.32106:
	addi	%v0, %v1, -10
bgti_cont.32107:
	j	bgti_cont.32081
bgti_else.32104:
	add	%v0, %zero, %v1
bgti_cont.32105:
	j	bgti_cont.32081
bgti_else.32102:
	addi	%v0, %v1, -30
bgti_cont.32103:
	j	bgti_cont.32081
bgti_else.32100:
	addi	%v0, %v1, -20
bgti_cont.32101:
	j	bgti_cont.32081
bgti_else.32098:
	addi	%v0, %v1, -10
bgti_cont.32099:
	j	bgti_cont.32081
bgti_else.32096:
	add	%v0, %zero, %v1
bgti_cont.32097:
	j	bgti_cont.32081
bgti_else.32094:
	addi	%v0, %v1, -30
bgti_cont.32095:
	j	bgti_cont.32081
bgti_else.32092:
	addi	%v0, %v1, -20
bgti_cont.32093:
	j	bgti_cont.32081
bgti_else.32090:
	addi	%v0, %v1, -10
bgti_cont.32091:
	j	bgti_cont.32081
bgti_else.32088:
	add	%v0, %zero, %v1
bgti_cont.32089:
	j	bgti_cont.32081
bgti_else.32086:
	addi	%v0, %v1, -30
bgti_cont.32087:
	j	bgti_cont.32081
bgti_else.32084:
	addi	%v0, %v1, -20
bgti_cont.32085:
	j	bgti_cont.32081
bgti_else.32082:
	addi	%v0, %v1, -10
bgti_cont.32083:
	j	bgti_cont.32081
bgti_else.32080:
	add	%v0, %zero, %v1
bgti_cont.32081:
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_print_char
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 16(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_print_char
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 14(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_print_char
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
bgt_cont.32079:
bgt_cont.32045:
	addi	%v0, %zero, 32
	sw	%v0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_print_char
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32112
	blti	%v0, 0, bgti_else.32114
	j	bgt_cont.32113
bgti_else.32114:
	addi	%v0, %zero, 0
bgti_cont.32115:
	j	bgt_cont.32113
bgt_else.32112:
	addi	%v0, %zero, 255
bgt_cont.32113:
	lw	%v1, 8(%sp)
	sw	%v0, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub1.2641
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.32116
	blti	%v1, 20, bgti_else.32118
	blti	%v1, 30, bgti_else.32120
	blti	%v1, 40, bgti_else.32122
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32124
	blti	%v1, 20, bgti_else.32126
	blti	%v1, 30, bgti_else.32128
	blti	%v1, 40, bgti_else.32130
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32132
	blti	%v1, 20, bgti_else.32134
	blti	%v1, 30, bgti_else.32136
	blti	%v1, 40, bgti_else.32138
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32140
	blti	%v1, 20, bgti_else.32142
	blti	%v1, 30, bgti_else.32144
	blti	%v1, 40, bgti_else.32146
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub2.2644
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.32117
bgti_else.32146:
	addi	%v0, %v1, -30
bgti_cont.32147:
	j	bgti_cont.32117
bgti_else.32144:
	addi	%v0, %v1, -20
bgti_cont.32145:
	j	bgti_cont.32117
bgti_else.32142:
	addi	%v0, %v1, -10
bgti_cont.32143:
	j	bgti_cont.32117
bgti_else.32140:
	add	%v0, %zero, %v1
bgti_cont.32141:
	j	bgti_cont.32117
bgti_else.32138:
	addi	%v0, %v1, -30
bgti_cont.32139:
	j	bgti_cont.32117
bgti_else.32136:
	addi	%v0, %v1, -20
bgti_cont.32137:
	j	bgti_cont.32117
bgti_else.32134:
	addi	%v0, %v1, -10
bgti_cont.32135:
	j	bgti_cont.32117
bgti_else.32132:
	add	%v0, %zero, %v1
bgti_cont.32133:
	j	bgti_cont.32117
bgti_else.32130:
	addi	%v0, %v1, -30
bgti_cont.32131:
	j	bgti_cont.32117
bgti_else.32128:
	addi	%v0, %v1, -20
bgti_cont.32129:
	j	bgti_cont.32117
bgti_else.32126:
	addi	%v0, %v1, -10
bgti_cont.32127:
	j	bgti_cont.32117
bgti_else.32124:
	add	%v0, %zero, %v1
bgti_cont.32125:
	j	bgti_cont.32117
bgti_else.32122:
	addi	%v0, %v1, -30
bgti_cont.32123:
	j	bgti_cont.32117
bgti_else.32120:
	addi	%v0, %v1, -20
bgti_cont.32121:
	j	bgti_cont.32117
bgti_else.32118:
	addi	%v0, %v1, -10
bgti_cont.32119:
	j	bgti_cont.32117
bgti_else.32116:
	add	%v0, %zero, %v1
bgti_cont.32117:
	lw	%v1, 19(%sp)
	blt	%zero, %v1, bgt_else.32148
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_print_char
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgt_cont.32149
bgt_else.32148:
	lw	%a0, 8(%sp)
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	print_int_sub1.2641
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 19(%sp)
	sw	%v0, 21(%sp)
	blti	%v1, 10, bgti_else.32150
	blti	%v1, 20, bgti_else.32152
	blti	%v1, 30, bgti_else.32154
	blti	%v1, 40, bgti_else.32156
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32158
	blti	%v1, 20, bgti_else.32160
	blti	%v1, 30, bgti_else.32162
	blti	%v1, 40, bgti_else.32164
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32166
	blti	%v1, 20, bgti_else.32168
	blti	%v1, 30, bgti_else.32170
	blti	%v1, 40, bgti_else.32172
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32174
	blti	%v1, 20, bgti_else.32176
	blti	%v1, 30, bgti_else.32178
	blti	%v1, 40, bgti_else.32180
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	print_int_sub2.2644
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.32151
bgti_else.32180:
	addi	%v0, %v1, -30
bgti_cont.32181:
	j	bgti_cont.32151
bgti_else.32178:
	addi	%v0, %v1, -20
bgti_cont.32179:
	j	bgti_cont.32151
bgti_else.32176:
	addi	%v0, %v1, -10
bgti_cont.32177:
	j	bgti_cont.32151
bgti_else.32174:
	add	%v0, %zero, %v1
bgti_cont.32175:
	j	bgti_cont.32151
bgti_else.32172:
	addi	%v0, %v1, -30
bgti_cont.32173:
	j	bgti_cont.32151
bgti_else.32170:
	addi	%v0, %v1, -20
bgti_cont.32171:
	j	bgti_cont.32151
bgti_else.32168:
	addi	%v0, %v1, -10
bgti_cont.32169:
	j	bgti_cont.32151
bgti_else.32166:
	add	%v0, %zero, %v1
bgti_cont.32167:
	j	bgti_cont.32151
bgti_else.32164:
	addi	%v0, %v1, -30
bgti_cont.32165:
	j	bgti_cont.32151
bgti_else.32162:
	addi	%v0, %v1, -20
bgti_cont.32163:
	j	bgti_cont.32151
bgti_else.32160:
	addi	%v0, %v1, -10
bgti_cont.32161:
	j	bgti_cont.32151
bgti_else.32158:
	add	%v0, %zero, %v1
bgti_cont.32159:
	j	bgti_cont.32151
bgti_else.32156:
	addi	%v0, %v1, -30
bgti_cont.32157:
	j	bgti_cont.32151
bgti_else.32154:
	addi	%v0, %v1, -20
bgti_cont.32155:
	j	bgti_cont.32151
bgti_else.32152:
	addi	%v0, %v1, -10
bgti_cont.32153:
	j	bgti_cont.32151
bgti_else.32150:
	add	%v0, %zero, %v1
bgti_cont.32151:
	lw	%v1, 21(%sp)
	blt	%zero, %v1, bgt_else.32182
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v0, 20(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgt_cont.32183
bgt_else.32182:
	sw	%v0, 22(%sp)
	blti	%v1, 10, bgti_else.32184
	blti	%v1, 20, bgti_else.32186
	blti	%v1, 30, bgti_else.32188
	blti	%v1, 40, bgti_else.32190
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32192
	blti	%v1, 20, bgti_else.32194
	blti	%v1, 30, bgti_else.32196
	blti	%v1, 40, bgti_else.32198
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32200
	blti	%v1, 20, bgti_else.32202
	blti	%v1, 30, bgti_else.32204
	blti	%v1, 40, bgti_else.32206
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32208
	blti	%v1, 20, bgti_else.32210
	blti	%v1, 30, bgti_else.32212
	blti	%v1, 40, bgti_else.32214
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub2.2644
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.32185
bgti_else.32214:
	addi	%v0, %v1, -30
bgti_cont.32215:
	j	bgti_cont.32185
bgti_else.32212:
	addi	%v0, %v1, -20
bgti_cont.32213:
	j	bgti_cont.32185
bgti_else.32210:
	addi	%v0, %v1, -10
bgti_cont.32211:
	j	bgti_cont.32185
bgti_else.32208:
	add	%v0, %zero, %v1
bgti_cont.32209:
	j	bgti_cont.32185
bgti_else.32206:
	addi	%v0, %v1, -30
bgti_cont.32207:
	j	bgti_cont.32185
bgti_else.32204:
	addi	%v0, %v1, -20
bgti_cont.32205:
	j	bgti_cont.32185
bgti_else.32202:
	addi	%v0, %v1, -10
bgti_cont.32203:
	j	bgti_cont.32185
bgti_else.32200:
	add	%v0, %zero, %v1
bgti_cont.32201:
	j	bgti_cont.32185
bgti_else.32198:
	addi	%v0, %v1, -30
bgti_cont.32199:
	j	bgti_cont.32185
bgti_else.32196:
	addi	%v0, %v1, -20
bgti_cont.32197:
	j	bgti_cont.32185
bgti_else.32194:
	addi	%v0, %v1, -10
bgti_cont.32195:
	j	bgti_cont.32185
bgti_else.32192:
	add	%v0, %zero, %v1
bgti_cont.32193:
	j	bgti_cont.32185
bgti_else.32190:
	addi	%v0, %v1, -30
bgti_cont.32191:
	j	bgti_cont.32185
bgti_else.32188:
	addi	%v0, %v1, -20
bgti_cont.32189:
	j	bgti_cont.32185
bgti_else.32186:
	addi	%v0, %v1, -10
bgti_cont.32187:
	j	bgti_cont.32185
bgti_else.32184:
	add	%v0, %zero, %v1
bgti_cont.32185:
	addi	%v0, %v0, 48
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_print_char
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	lw	%v0, 22(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_print_char
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	lw	%v0, 20(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_print_char
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
bgt_cont.32183:
bgt_cont.32149:
	lw	%v0, 17(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_print_char
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32216
	blti	%v0, 0, bgti_else.32218
	j	bgt_cont.32217
bgti_else.32218:
	addi	%v0, %zero, 0
bgti_cont.32219:
	j	bgt_cont.32217
bgt_else.32216:
	addi	%v0, %zero, 255
bgt_cont.32217:
	lw	%v1, 8(%sp)
	sw	%v0, 23(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub1.2641
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)
	sw	%v0, 24(%sp)
	blti	%v1, 10, bgti_else.32220
	blti	%v1, 20, bgti_else.32222
	blti	%v1, 30, bgti_else.32224
	blti	%v1, 40, bgti_else.32226
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32228
	blti	%v1, 20, bgti_else.32230
	blti	%v1, 30, bgti_else.32232
	blti	%v1, 40, bgti_else.32234
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32236
	blti	%v1, 20, bgti_else.32238
	blti	%v1, 30, bgti_else.32240
	blti	%v1, 40, bgti_else.32242
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32244
	blti	%v1, 20, bgti_else.32246
	blti	%v1, 30, bgti_else.32248
	blti	%v1, 40, bgti_else.32250
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub2.2644
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgti_cont.32221
bgti_else.32250:
	addi	%v0, %v1, -30
bgti_cont.32251:
	j	bgti_cont.32221
bgti_else.32248:
	addi	%v0, %v1, -20
bgti_cont.32249:
	j	bgti_cont.32221
bgti_else.32246:
	addi	%v0, %v1, -10
bgti_cont.32247:
	j	bgti_cont.32221
bgti_else.32244:
	add	%v0, %zero, %v1
bgti_cont.32245:
	j	bgti_cont.32221
bgti_else.32242:
	addi	%v0, %v1, -30
bgti_cont.32243:
	j	bgti_cont.32221
bgti_else.32240:
	addi	%v0, %v1, -20
bgti_cont.32241:
	j	bgti_cont.32221
bgti_else.32238:
	addi	%v0, %v1, -10
bgti_cont.32239:
	j	bgti_cont.32221
bgti_else.32236:
	add	%v0, %zero, %v1
bgti_cont.32237:
	j	bgti_cont.32221
bgti_else.32234:
	addi	%v0, %v1, -30
bgti_cont.32235:
	j	bgti_cont.32221
bgti_else.32232:
	addi	%v0, %v1, -20
bgti_cont.32233:
	j	bgti_cont.32221
bgti_else.32230:
	addi	%v0, %v1, -10
bgti_cont.32231:
	j	bgti_cont.32221
bgti_else.32228:
	add	%v0, %zero, %v1
bgti_cont.32229:
	j	bgti_cont.32221
bgti_else.32226:
	addi	%v0, %v1, -30
bgti_cont.32227:
	j	bgti_cont.32221
bgti_else.32224:
	addi	%v0, %v1, -20
bgti_cont.32225:
	j	bgti_cont.32221
bgti_else.32222:
	addi	%v0, %v1, -10
bgti_cont.32223:
	j	bgti_cont.32221
bgti_else.32220:
	add	%v0, %zero, %v1
bgti_cont.32221:
	lw	%v1, 24(%sp)
	blt	%zero, %v1, bgt_else.32252
	addi	%v0, %v0, 48
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_print_char
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgt_cont.32253
bgt_else.32252:
	lw	%a0, 8(%sp)
	sw	%v0, 25(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	print_int_sub1.2641
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 26(%sp)
	blti	%v1, 10, bgti_else.32254
	blti	%v1, 20, bgti_else.32256
	blti	%v1, 30, bgti_else.32258
	blti	%v1, 40, bgti_else.32260
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32262
	blti	%v1, 20, bgti_else.32264
	blti	%v1, 30, bgti_else.32266
	blti	%v1, 40, bgti_else.32268
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32270
	blti	%v1, 20, bgti_else.32272
	blti	%v1, 30, bgti_else.32274
	blti	%v1, 40, bgti_else.32276
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32278
	blti	%v1, 20, bgti_else.32280
	blti	%v1, 30, bgti_else.32282
	blti	%v1, 40, bgti_else.32284
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2644
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.32255
bgti_else.32284:
	addi	%v0, %v1, -30
bgti_cont.32285:
	j	bgti_cont.32255
bgti_else.32282:
	addi	%v0, %v1, -20
bgti_cont.32283:
	j	bgti_cont.32255
bgti_else.32280:
	addi	%v0, %v1, -10
bgti_cont.32281:
	j	bgti_cont.32255
bgti_else.32278:
	add	%v0, %zero, %v1
bgti_cont.32279:
	j	bgti_cont.32255
bgti_else.32276:
	addi	%v0, %v1, -30
bgti_cont.32277:
	j	bgti_cont.32255
bgti_else.32274:
	addi	%v0, %v1, -20
bgti_cont.32275:
	j	bgti_cont.32255
bgti_else.32272:
	addi	%v0, %v1, -10
bgti_cont.32273:
	j	bgti_cont.32255
bgti_else.32270:
	add	%v0, %zero, %v1
bgti_cont.32271:
	j	bgti_cont.32255
bgti_else.32268:
	addi	%v0, %v1, -30
bgti_cont.32269:
	j	bgti_cont.32255
bgti_else.32266:
	addi	%v0, %v1, -20
bgti_cont.32267:
	j	bgti_cont.32255
bgti_else.32264:
	addi	%v0, %v1, -10
bgti_cont.32265:
	j	bgti_cont.32255
bgti_else.32262:
	add	%v0, %zero, %v1
bgti_cont.32263:
	j	bgti_cont.32255
bgti_else.32260:
	addi	%v0, %v1, -30
bgti_cont.32261:
	j	bgti_cont.32255
bgti_else.32258:
	addi	%v0, %v1, -20
bgti_cont.32259:
	j	bgti_cont.32255
bgti_else.32256:
	addi	%v0, %v1, -10
bgti_cont.32257:
	j	bgti_cont.32255
bgti_else.32254:
	add	%v0, %zero, %v1
bgti_cont.32255:
	lw	%v1, 26(%sp)
	blt	%zero, %v1, bgt_else.32286
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v0, 25(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgt_cont.32287
bgt_else.32286:
	sw	%v0, 27(%sp)
	blti	%v1, 10, bgti_else.32288
	blti	%v1, 20, bgti_else.32290
	blti	%v1, 30, bgti_else.32292
	blti	%v1, 40, bgti_else.32294
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32296
	blti	%v1, 20, bgti_else.32298
	blti	%v1, 30, bgti_else.32300
	blti	%v1, 40, bgti_else.32302
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32304
	blti	%v1, 20, bgti_else.32306
	blti	%v1, 30, bgti_else.32308
	blti	%v1, 40, bgti_else.32310
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32312
	blti	%v1, 20, bgti_else.32314
	blti	%v1, 30, bgti_else.32316
	blti	%v1, 40, bgti_else.32318
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	print_int_sub2.2644
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	bgti_cont.32289
bgti_else.32318:
	addi	%v0, %v1, -30
bgti_cont.32319:
	j	bgti_cont.32289
bgti_else.32316:
	addi	%v0, %v1, -20
bgti_cont.32317:
	j	bgti_cont.32289
bgti_else.32314:
	addi	%v0, %v1, -10
bgti_cont.32315:
	j	bgti_cont.32289
bgti_else.32312:
	add	%v0, %zero, %v1
bgti_cont.32313:
	j	bgti_cont.32289
bgti_else.32310:
	addi	%v0, %v1, -30
bgti_cont.32311:
	j	bgti_cont.32289
bgti_else.32308:
	addi	%v0, %v1, -20
bgti_cont.32309:
	j	bgti_cont.32289
bgti_else.32306:
	addi	%v0, %v1, -10
bgti_cont.32307:
	j	bgti_cont.32289
bgti_else.32304:
	add	%v0, %zero, %v1
bgti_cont.32305:
	j	bgti_cont.32289
bgti_else.32302:
	addi	%v0, %v1, -30
bgti_cont.32303:
	j	bgti_cont.32289
bgti_else.32300:
	addi	%v0, %v1, -20
bgti_cont.32301:
	j	bgti_cont.32289
bgti_else.32298:
	addi	%v0, %v1, -10
bgti_cont.32299:
	j	bgti_cont.32289
bgti_else.32296:
	add	%v0, %zero, %v1
bgti_cont.32297:
	j	bgti_cont.32289
bgti_else.32294:
	addi	%v0, %v1, -30
bgti_cont.32295:
	j	bgti_cont.32289
bgti_else.32292:
	addi	%v0, %v1, -20
bgti_cont.32293:
	j	bgti_cont.32289
bgti_else.32290:
	addi	%v0, %v1, -10
bgti_cont.32291:
	j	bgti_cont.32289
bgti_else.32288:
	add	%v0, %zero, %v1
bgti_cont.32289:
	addi	%v0, %v0, 48
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v0, 27(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v0, 25(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
bgt_cont.32287:
bgt_cont.32253:
	lw	%v0, 12(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	blt	%v0, %v1, bgt_else.32320
	jr	%ra
bgt_else.32320:
	lw	%a1, 5(%sp)
	add	%at, %a1, %v0
	lw	%a0, 0(%at)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 153(%zero)
	lw	%a2, 3(%sp)
	lw	%a3, 4(%sp)
	blt	%a2, %a3, bgt_else.32322
	addi	%v1, %zero, 0
	j	bgt_cont.32323
bgt_else.32322:
	lw	%a2, 2(%sp)
	blt	%zero, %a2, bgt_else.32324
	addi	%v1, %zero, 0
	j	bgt_cont.32325
bgt_else.32324:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.32326
	addi	%v1, %zero, 0
	j	bgt_cont.32327
bgt_else.32326:
	blt	%zero, %v0, bgt_else.32328
	addi	%v1, %zero, 0
	j	bgt_cont.32329
bgt_else.32328:
	addi	%v1, %zero, 1
bgt_cont.32329:
bgt_cont.32327:
bgt_cont.32325:
bgt_cont.32323:
	sw	%v0, 28(%sp)
	beqi	%v1, 0, bnei_else.32330
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 8(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bnei_cont.32331
bnei_else.32330:
	lw	%v1, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
bnei_cont.32331:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32332
	blti	%v0, 0, bgti_else.32334
	j	bgt_cont.32333
bgti_else.32334:
	addi	%v0, %zero, 0
bgti_cont.32335:
	j	bgt_cont.32333
bgt_else.32332:
	addi	%v0, %zero, 255
bgt_cont.32333:
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int.2646
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v0, 17(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32336
	blti	%v0, 0, bgti_else.32338
	j	bgt_cont.32337
bgti_else.32338:
	addi	%v0, %zero, 0
bgti_cont.32339:
	j	bgt_cont.32337
bgt_else.32336:
	addi	%v0, %zero, 255
bgt_cont.32337:
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int.2646
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v0, 17(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32340
	blti	%v0, 0, bgti_else.32342
	j	bgt_cont.32341
bgti_else.32342:
	addi	%v0, %zero, 0
bgti_cont.32343:
	j	bgt_cont.32341
bgt_else.32340:
	addi	%v0, %zero, 255
bgt_cont.32341:
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int.2646
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v0, 12(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v0, 28(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 5(%sp)
	lw	%a2, 0(%sp)
	j	scan_pixel.3057
scan_line.3063:
	addi	%a3, %zero, 1
	lw	%t0, 155(%zero)
	blt	%v0, %t0, bgt_else.32409
	jr	%ra
bgt_else.32409:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.32411
	j	bgt_cont.32412
bgt_else.32411:
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
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bgt_cont.32412:
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	blt	%zero, %v0, bgt_else.32413
	j	bgt_cont.32414
bgt_else.32413:
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
	blt	%a3, %t0, bgt_else.32415
	addi	%a3, %zero, 0
	j	bgt_cont.32416
bgt_else.32415:
	blt	%zero, %a2, bgt_else.32417
	addi	%a3, %zero, 0
	j	bgt_cont.32418
bgt_else.32417:
	blt	%k1, %v0, bgt_else.32419
	addi	%a3, %zero, 0
	j	bgt_cont.32420
bgt_else.32419:
	addi	%a3, %zero, 0
bgt_cont.32420:
	blt	%at, %v0, bgt_else.32421
	addi	%a3, %zero, 0
	j	bgt_cont.32422
bgt_else.32421:
	addi	%a3, %zero, 0
bgt_cont.32422:
bgt_cont.32418:
bgt_cont.32416:
	beqi	%a3, 0, bnei_else.32423
	lw	%a0, 4(%sp)
	lw	%a3, 3(%sp)
	addi	%v0, %v1, 0
	addi	%k0, %a3, 0
	addi	%a3, %v1, 0
	addi	%v1, %a2, 0
	addi	%a2, %k0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.32424
bnei_else.32423:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.32424:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32425
	blti	%v0, 0, bgti_else.32427
	j	bgt_cont.32426
bgti_else.32427:
	addi	%v0, %zero, 0
bgti_cont.32428:
	j	bgt_cont.32426
bgt_else.32425:
	addi	%v0, %zero, 255
bgt_cont.32426:
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	print_int.2646
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 32
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32429
	blti	%v0, 0, bgti_else.32431
	j	bgt_cont.32430
bgti_else.32431:
	addi	%v0, %zero, 0
bgti_cont.32432:
	j	bgt_cont.32430
bgt_else.32429:
	addi	%v0, %zero, 255
bgt_cont.32430:
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	print_int.2646
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32433
	blti	%v0, 0, bgti_else.32435
	j	bgt_cont.32434
bgti_else.32435:
	addi	%v0, %zero, 0
bgti_cont.32436:
	j	bgt_cont.32434
bgt_else.32433:
	addi	%v0, %zero, 255
bgt_cont.32434:
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	print_int.2646
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_print_char
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	lw	%a2, 3(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	scan_pixel.3057
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bgt_cont.32414:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.32437
	addi	%a0, %v0, -5
	j	bgti_cont.32438
bgti_else.32437:
	add	%a0, %zero, %v0
bgti_cont.32438:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.32439
	jr	%ra
bgt_else.32439:
	lw	%v0, 0(%sp)
	sw	%a0, 11(%sp)
	sw	%v1, 12(%sp)
	blt	%v1, %v0, bgt_else.32441
	j	bgt_cont.32442
bgt_else.32441:
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
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bgt_cont.32442:
	lw	%v0, 8(%sp)
	lw	%v1, 12(%sp)
	lw	%a0, 7(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	scan_pixel.3057
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 11(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.32443
	addi	%a2, %v1, -5
	j	bgti_cont.32444
bgti_else.32443:
	add	%a2, %zero, %v1
bgti_cont.32444:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	j	scan_line.3063
create_pixel.3071:
	addi	%v0, %zero, 3
	flw	%f0, 470(%zero)
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
init_line_elements.3073:
	addi	%a0, %zero, 0
	blti	%v1, 0, bgti_else.32671
	addi	%a1, %zero, 3
	flw	%f0, 470(%zero)
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
	blti	%v0, 0, bgti_else.32672
	sw	%v0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	create_pixel.3071
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v1, 15(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.32673
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
	blti	%v0, 0, bgti_else.32674
	sw	%v0, 25(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	create_pixel.3071
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	init_line_elements.3073
bgti_else.32674:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.32673:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.32672:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.32671:
	jr	%ra
calc_dirvec.3083:
	blti	%v0, 5, bgti_else.33679
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 474(%zero)
	fadd	%f2, %f2, %f3
	fsqrt	%f2, %f2
	fdiv	%f0, %f0, %f2
	fdiv	%f1, %f1, %f2
	fdiv	%f2, %f3, %f2
	lw	%v0, 179(%v1)
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
bgti_else.33679:
	fmul	%f0, %f1, %f1
	flw	%f1, 439(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 474(%zero)
	fdiv	%f5, %f4, %f0
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f3, 2(%sp)
	fsw	%f1, 3(%sp)
	sw	%v0, 4(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f4, 6(%sp)
	fsw	%f2, 7(%sp)
	fmov	%f0, %f5
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	atan.2639
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 495(%zero)
	flw	%f3, 470(%zero)
	fblt	%f0, %f3, fbgt_else.33681
	addi	%v0, %zero, 1
	j	fbgt_cont.33682
fbgt_else.33681:
	addi	%v0, %zero, 0
fbgt_cont.33682:
	fabs	%f4, %f0
	flw	%f5, 494(%zero)
	fsw	%f3, 8(%sp)
	fsw	%f0, 9(%sp)
	sw	%v0, 10(%sp)
	fsw	%f2, 11(%sp)
	fsw	%f4, 12(%sp)
	fsw	%f5, 13(%sp)
	fblt	%f4, %f5, fbgt_else.33683
	flw	%f6, 493(%zero)
	fblt	%f4, %f6, fbgt_else.33685
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.33687
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.33689
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.33691
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.33693
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.33695
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.33697
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.33699
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.33701
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.33703
	flw	%f6, 483(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.33684
fbgt_else.33703:
	fmov	%f0, %f6
fbgt_cont.33704:
	j	fbgt_cont.33684
fbgt_else.33701:
	fmov	%f0, %f6
fbgt_cont.33702:
	j	fbgt_cont.33684
fbgt_else.33699:
	fmov	%f0, %f6
fbgt_cont.33700:
	j	fbgt_cont.33684
fbgt_else.33697:
	fmov	%f0, %f6
fbgt_cont.33698:
	j	fbgt_cont.33684
fbgt_else.33695:
	fmov	%f0, %f6
fbgt_cont.33696:
	j	fbgt_cont.33684
fbgt_else.33693:
	fmov	%f0, %f6
fbgt_cont.33694:
	j	fbgt_cont.33684
fbgt_else.33691:
	fmov	%f0, %f6
fbgt_cont.33692:
	j	fbgt_cont.33684
fbgt_else.33689:
	fmov	%f0, %f6
fbgt_cont.33690:
	j	fbgt_cont.33684
fbgt_else.33687:
	fmov	%f0, %f6
fbgt_cont.33688:
	j	fbgt_cont.33684
fbgt_else.33685:
	fmov	%f0, %f6
fbgt_cont.33686:
	j	fbgt_cont.33684
fbgt_else.33683:
	fmov	%f0, %f5
fbgt_cont.33684:
	flw	%f1, 12(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.33705
	fblt	%f1, %f0, fbgt_else.33707
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33709
	fblt	%f1, %f0, fbgt_else.33711
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33713
	fblt	%f1, %f0, fbgt_else.33715
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.33706
fbgt_else.33715:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.33716:
	j	fbgt_cont.33706
fbgt_else.33713:
	fmov	%f0, %f1
fbgt_cont.33714:
	j	fbgt_cont.33706
fbgt_else.33711:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33717
	fblt	%f1, %f0, fbgt_else.33719
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.33706
fbgt_else.33719:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.33720:
	j	fbgt_cont.33706
fbgt_else.33717:
	fmov	%f0, %f1
fbgt_cont.33718:
fbgt_cont.33712:
	j	fbgt_cont.33706
fbgt_else.33709:
	fmov	%f0, %f1
fbgt_cont.33710:
	j	fbgt_cont.33706
fbgt_else.33707:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33721
	fblt	%f1, %f0, fbgt_else.33723
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33725
	fblt	%f1, %f0, fbgt_else.33727
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.33706
fbgt_else.33727:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.33728:
	j	fbgt_cont.33706
fbgt_else.33725:
	fmov	%f0, %f1
fbgt_cont.33726:
	j	fbgt_cont.33706
fbgt_else.33723:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33729
	fblt	%f1, %f0, fbgt_else.33731
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.33706
fbgt_else.33731:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.33732:
	j	fbgt_cont.33706
fbgt_else.33729:
	fmov	%f0, %f1
fbgt_cont.33730:
fbgt_cont.33724:
	j	fbgt_cont.33706
fbgt_else.33721:
	fmov	%f0, %f1
fbgt_cont.33722:
fbgt_cont.33708:
	j	fbgt_cont.33706
fbgt_else.33705:
	fmov	%f0, %f1
fbgt_cont.33706:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.33733
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.33735
	addi	%v0, %zero, 0
	j	fbgt_cont.33734
bnei_else.33735:
	addi	%v0, %zero, 1
bnei_cont.33736:
	j	fbgt_cont.33734
fbgt_else.33733:
	lw	%v0, 10(%sp)
fbgt_cont.33734:
	fblt	%f0, %f1, fbgt_else.33737
	fsub	%f0, %f0, %f1
	j	fbgt_cont.33738
fbgt_else.33737:
fbgt_cont.33738:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.33739
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33740
fbgt_else.33739:
fbgt_cont.33740:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.33741
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.33742
fbgt_else.33741:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 473(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 6(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 472(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 471(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.33742:
	beqi	%v0, 0, bnei_else.33743
	j	bnei_cont.33744
bnei_else.33743:
	fneg	%f0, %f0
bnei_cont.33744:
	flw	%f4, 9(%sp)
	fabs	%f4, %f4
	flw	%f5, 13(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f3, 15(%sp)
	fsw	%f2, 16(%sp)
	fsw	%f4, 17(%sp)
	fblt	%f4, %f5, fbgt_else.33745
	flw	%f6, 493(%zero)
	fblt	%f4, %f6, fbgt_else.33747
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.33749
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.33751
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.33753
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.33755
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.33757
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.33759
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.33761
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.33763
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.33765
	flw	%f6, 483(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.33746
fbgt_else.33765:
	fmov	%f0, %f6
fbgt_cont.33766:
	j	fbgt_cont.33746
fbgt_else.33763:
	fmov	%f0, %f6
fbgt_cont.33764:
	j	fbgt_cont.33746
fbgt_else.33761:
	fmov	%f0, %f6
fbgt_cont.33762:
	j	fbgt_cont.33746
fbgt_else.33759:
	fmov	%f0, %f6
fbgt_cont.33760:
	j	fbgt_cont.33746
fbgt_else.33757:
	fmov	%f0, %f6
fbgt_cont.33758:
	j	fbgt_cont.33746
fbgt_else.33755:
	fmov	%f0, %f6
fbgt_cont.33756:
	j	fbgt_cont.33746
fbgt_else.33753:
	fmov	%f0, %f6
fbgt_cont.33754:
	j	fbgt_cont.33746
fbgt_else.33751:
	fmov	%f0, %f6
fbgt_cont.33752:
	j	fbgt_cont.33746
fbgt_else.33749:
	fmov	%f0, %f6
fbgt_cont.33750:
	j	fbgt_cont.33746
fbgt_else.33747:
	fmov	%f0, %f6
fbgt_cont.33748:
	j	fbgt_cont.33746
fbgt_else.33745:
	fmov	%f0, %f5
fbgt_cont.33746:
	flw	%f1, 17(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.33767
	fblt	%f1, %f0, fbgt_else.33769
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33771
	fblt	%f1, %f0, fbgt_else.33773
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33775
	fblt	%f1, %f0, fbgt_else.33777
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.33768
fbgt_else.33777:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.33778:
	j	fbgt_cont.33768
fbgt_else.33775:
	fmov	%f0, %f1
fbgt_cont.33776:
	j	fbgt_cont.33768
fbgt_else.33773:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33779
	fblt	%f1, %f0, fbgt_else.33781
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.33768
fbgt_else.33781:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.33782:
	j	fbgt_cont.33768
fbgt_else.33779:
	fmov	%f0, %f1
fbgt_cont.33780:
fbgt_cont.33774:
	j	fbgt_cont.33768
fbgt_else.33771:
	fmov	%f0, %f1
fbgt_cont.33772:
	j	fbgt_cont.33768
fbgt_else.33769:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33783
	fblt	%f1, %f0, fbgt_else.33785
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33787
	fblt	%f1, %f0, fbgt_else.33789
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.33768
fbgt_else.33789:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.33790:
	j	fbgt_cont.33768
fbgt_else.33787:
	fmov	%f0, %f1
fbgt_cont.33788:
	j	fbgt_cont.33768
fbgt_else.33785:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33791
	fblt	%f1, %f0, fbgt_else.33793
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.33768
fbgt_else.33793:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.33794:
	j	fbgt_cont.33768
fbgt_else.33791:
	fmov	%f0, %f1
fbgt_cont.33792:
fbgt_cont.33786:
	j	fbgt_cont.33768
fbgt_else.33783:
	fmov	%f0, %f1
fbgt_cont.33784:
fbgt_cont.33770:
	j	fbgt_cont.33768
fbgt_else.33767:
	fmov	%f0, %f1
fbgt_cont.33768:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.33795
	addi	%v0, %zero, 0
	j	fbgt_cont.33796
fbgt_else.33795:
	addi	%v0, %zero, 1
fbgt_cont.33796:
	fblt	%f0, %f1, fbgt_else.33797
	fsub	%f0, %f0, %f1
	j	fbgt_cont.33798
fbgt_else.33797:
fbgt_cont.33798:
	flw	%f2, 16(%sp)
	fblt	%f0, %f2, fbgt_else.33799
	beqi	%v0, 0, bnei_else.33801
	addi	%v0, %zero, 0
	j	fbgt_cont.33800
bnei_else.33801:
	addi	%v0, %zero, 1
bnei_cont.33802:
	j	fbgt_cont.33800
fbgt_else.33799:
fbgt_cont.33800:
	fblt	%f0, %f2, fbgt_else.33803
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33804
fbgt_else.33803:
fbgt_cont.33804:
	flw	%f3, 15(%sp)
	fblt	%f3, %f0, fbgt_else.33805
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 473(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 6(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 472(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 471(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.33806
fbgt_else.33805:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.33806:
	beqi	%v0, 0, bnei_else.33807
	j	bnei_cont.33808
bnei_else.33807:
	fneg	%f0, %f0
bnei_cont.33808:
	flw	%f4, 14(%sp)
	fdiv	%f0, %f4, %f0
	flw	%f4, 5(%sp)
	fmul	%f0, %f0, %f4
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	fmul	%f4, %f0, %f0
	flw	%f5, 3(%sp)
	fadd	%f4, %f4, %f5
	fsqrt	%f4, %f4
	flw	%f5, 6(%sp)
	fdiv	%f6, %f5, %f4
	fsw	%f0, 18(%sp)
	sw	%v0, 19(%sp)
	fsw	%f4, 20(%sp)
	fmov	%f0, %f6
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	atan.2639
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f3, 2(%sp)
	fmul	%f0, %f0, %f3
	flw	%f1, 8(%sp)
	fblt	%f0, %f1, fbgt_else.33809
	addi	%v0, %zero, 1
	j	fbgt_cont.33810
fbgt_else.33809:
	addi	%v0, %zero, 0
fbgt_cont.33810:
	fabs	%f1, %f0
	flw	%f2, 13(%sp)
	fsw	%f0, 21(%sp)
	sw	%v0, 22(%sp)
	fsw	%f1, 23(%sp)
	fblt	%f1, %f2, fbgt_else.33811
	flw	%f4, 493(%zero)
	fblt	%f1, %f4, fbgt_else.33813
	flw	%f4, 492(%zero)
	fblt	%f1, %f4, fbgt_else.33815
	flw	%f4, 491(%zero)
	fblt	%f1, %f4, fbgt_else.33817
	flw	%f4, 490(%zero)
	fblt	%f1, %f4, fbgt_else.33819
	flw	%f4, 489(%zero)
	fblt	%f1, %f4, fbgt_else.33821
	flw	%f4, 488(%zero)
	fblt	%f1, %f4, fbgt_else.33823
	flw	%f4, 487(%zero)
	fblt	%f1, %f4, fbgt_else.33825
	flw	%f4, 486(%zero)
	fblt	%f1, %f4, fbgt_else.33827
	flw	%f4, 485(%zero)
	fblt	%f1, %f4, fbgt_else.33829
	flw	%f4, 484(%zero)
	fblt	%f1, %f4, fbgt_else.33831
	flw	%f4, 483(%zero)
	fmov	%f0, %f1
	fmov	%f1, %f4
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.33812
fbgt_else.33831:
	fmov	%f0, %f4
fbgt_cont.33832:
	j	fbgt_cont.33812
fbgt_else.33829:
	fmov	%f0, %f4
fbgt_cont.33830:
	j	fbgt_cont.33812
fbgt_else.33827:
	fmov	%f0, %f4
fbgt_cont.33828:
	j	fbgt_cont.33812
fbgt_else.33825:
	fmov	%f0, %f4
fbgt_cont.33826:
	j	fbgt_cont.33812
fbgt_else.33823:
	fmov	%f0, %f4
fbgt_cont.33824:
	j	fbgt_cont.33812
fbgt_else.33821:
	fmov	%f0, %f4
fbgt_cont.33822:
	j	fbgt_cont.33812
fbgt_else.33819:
	fmov	%f0, %f4
fbgt_cont.33820:
	j	fbgt_cont.33812
fbgt_else.33817:
	fmov	%f0, %f4
fbgt_cont.33818:
	j	fbgt_cont.33812
fbgt_else.33815:
	fmov	%f0, %f4
fbgt_cont.33816:
	j	fbgt_cont.33812
fbgt_else.33813:
	fmov	%f0, %f4
fbgt_cont.33814:
	j	fbgt_cont.33812
fbgt_else.33811:
	fmov	%f0, %f2
fbgt_cont.33812:
	flw	%f1, 23(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.33833
	fblt	%f1, %f0, fbgt_else.33835
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33837
	fblt	%f1, %f0, fbgt_else.33839
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33841
	fblt	%f1, %f0, fbgt_else.33843
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.33834
fbgt_else.33843:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.33844:
	j	fbgt_cont.33834
fbgt_else.33841:
	fmov	%f0, %f1
fbgt_cont.33842:
	j	fbgt_cont.33834
fbgt_else.33839:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33845
	fblt	%f1, %f0, fbgt_else.33847
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.33834
fbgt_else.33847:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.33848:
	j	fbgt_cont.33834
fbgt_else.33845:
	fmov	%f0, %f1
fbgt_cont.33846:
fbgt_cont.33840:
	j	fbgt_cont.33834
fbgt_else.33837:
	fmov	%f0, %f1
fbgt_cont.33838:
	j	fbgt_cont.33834
fbgt_else.33835:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33849
	fblt	%f1, %f0, fbgt_else.33851
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33853
	fblt	%f1, %f0, fbgt_else.33855
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.33834
fbgt_else.33855:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.33856:
	j	fbgt_cont.33834
fbgt_else.33853:
	fmov	%f0, %f1
fbgt_cont.33854:
	j	fbgt_cont.33834
fbgt_else.33851:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33857
	fblt	%f1, %f0, fbgt_else.33859
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.33834
fbgt_else.33859:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.33860:
	j	fbgt_cont.33834
fbgt_else.33857:
	fmov	%f0, %f1
fbgt_cont.33858:
fbgt_cont.33852:
	j	fbgt_cont.33834
fbgt_else.33849:
	fmov	%f0, %f1
fbgt_cont.33850:
fbgt_cont.33836:
	j	fbgt_cont.33834
fbgt_else.33833:
	fmov	%f0, %f1
fbgt_cont.33834:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.33861
	lw	%v0, 22(%sp)
	beqi	%v0, 0, bnei_else.33863
	addi	%v0, %zero, 0
	j	fbgt_cont.33862
bnei_else.33863:
	addi	%v0, %zero, 1
bnei_cont.33864:
	j	fbgt_cont.33862
fbgt_else.33861:
	lw	%v0, 22(%sp)
fbgt_cont.33862:
	fblt	%f0, %f1, fbgt_else.33865
	fsub	%f0, %f0, %f1
	j	fbgt_cont.33866
fbgt_else.33865:
fbgt_cont.33866:
	flw	%f2, 16(%sp)
	fblt	%f0, %f2, fbgt_else.33867
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33868
fbgt_else.33867:
fbgt_cont.33868:
	flw	%f3, 15(%sp)
	fblt	%f3, %f0, fbgt_else.33869
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.33870
fbgt_else.33869:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 473(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 6(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 472(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 471(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.33870:
	beqi	%v0, 0, bnei_else.33871
	j	bnei_cont.33872
bnei_else.33871:
	fneg	%f0, %f0
bnei_cont.33872:
	flw	%f4, 21(%sp)
	fabs	%f4, %f4
	flw	%f5, 13(%sp)
	fsw	%f0, 24(%sp)
	fsw	%f4, 25(%sp)
	fblt	%f4, %f5, fbgt_else.33873
	flw	%f6, 493(%zero)
	fblt	%f4, %f6, fbgt_else.33875
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.33877
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.33879
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.33881
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.33883
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.33885
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.33887
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.33889
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.33891
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.33893
	flw	%f6, 483(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.33874
fbgt_else.33893:
	fmov	%f0, %f6
fbgt_cont.33894:
	j	fbgt_cont.33874
fbgt_else.33891:
	fmov	%f0, %f6
fbgt_cont.33892:
	j	fbgt_cont.33874
fbgt_else.33889:
	fmov	%f0, %f6
fbgt_cont.33890:
	j	fbgt_cont.33874
fbgt_else.33887:
	fmov	%f0, %f6
fbgt_cont.33888:
	j	fbgt_cont.33874
fbgt_else.33885:
	fmov	%f0, %f6
fbgt_cont.33886:
	j	fbgt_cont.33874
fbgt_else.33883:
	fmov	%f0, %f6
fbgt_cont.33884:
	j	fbgt_cont.33874
fbgt_else.33881:
	fmov	%f0, %f6
fbgt_cont.33882:
	j	fbgt_cont.33874
fbgt_else.33879:
	fmov	%f0, %f6
fbgt_cont.33880:
	j	fbgt_cont.33874
fbgt_else.33877:
	fmov	%f0, %f6
fbgt_cont.33878:
	j	fbgt_cont.33874
fbgt_else.33875:
	fmov	%f0, %f6
fbgt_cont.33876:
	j	fbgt_cont.33874
fbgt_else.33873:
	fmov	%f0, %f5
fbgt_cont.33874:
	flw	%f1, 25(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.33895
	fblt	%f1, %f0, fbgt_else.33897
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33899
	fblt	%f1, %f0, fbgt_else.33901
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33903
	fblt	%f1, %f0, fbgt_else.33905
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.33896
fbgt_else.33905:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.33906:
	j	fbgt_cont.33896
fbgt_else.33903:
	fmov	%f0, %f1
fbgt_cont.33904:
	j	fbgt_cont.33896
fbgt_else.33901:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33907
	fblt	%f1, %f0, fbgt_else.33909
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.33896
fbgt_else.33909:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.33910:
	j	fbgt_cont.33896
fbgt_else.33907:
	fmov	%f0, %f1
fbgt_cont.33908:
fbgt_cont.33902:
	j	fbgt_cont.33896
fbgt_else.33899:
	fmov	%f0, %f1
fbgt_cont.33900:
	j	fbgt_cont.33896
fbgt_else.33897:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33911
	fblt	%f1, %f0, fbgt_else.33913
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33915
	fblt	%f1, %f0, fbgt_else.33917
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.33896
fbgt_else.33917:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.33918:
	j	fbgt_cont.33896
fbgt_else.33915:
	fmov	%f0, %f1
fbgt_cont.33916:
	j	fbgt_cont.33896
fbgt_else.33913:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33919
	fblt	%f1, %f0, fbgt_else.33921
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.33896
fbgt_else.33921:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.33922:
	j	fbgt_cont.33896
fbgt_else.33919:
	fmov	%f0, %f1
fbgt_cont.33920:
fbgt_cont.33914:
	j	fbgt_cont.33896
fbgt_else.33911:
	fmov	%f0, %f1
fbgt_cont.33912:
fbgt_cont.33898:
	j	fbgt_cont.33896
fbgt_else.33895:
	fmov	%f0, %f1
fbgt_cont.33896:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.33923
	addi	%v0, %zero, 0
	j	fbgt_cont.33924
fbgt_else.33923:
	addi	%v0, %zero, 1
fbgt_cont.33924:
	fblt	%f0, %f1, fbgt_else.33925
	fsub	%f0, %f0, %f1
	j	fbgt_cont.33926
fbgt_else.33925:
fbgt_cont.33926:
	flw	%f2, 16(%sp)
	fblt	%f0, %f2, fbgt_else.33927
	beqi	%v0, 0, bnei_else.33929
	addi	%v0, %zero, 0
	j	fbgt_cont.33928
bnei_else.33929:
	addi	%v0, %zero, 1
bnei_cont.33930:
	j	fbgt_cont.33928
fbgt_else.33927:
fbgt_cont.33928:
	fblt	%f0, %f2, fbgt_else.33931
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33932
fbgt_else.33931:
fbgt_cont.33932:
	flw	%f1, 15(%sp)
	fblt	%f1, %f0, fbgt_else.33933
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 473(%zero)
	fmul	%f2, %f2, %f0
	flw	%f3, 6(%sp)
	fsub	%f2, %f3, %f2
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.33934
fbgt_else.33933:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.33934:
	beqi	%v0, 0, bnei_else.33935
	j	bnei_cont.33936
bnei_else.33935:
	fneg	%f0, %f0
bnei_cont.33936:
	flw	%f1, 24(%sp)
	fdiv	%f0, %f1, %f0
	flw	%f1, 20(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 18(%sp)
	flw	%f2, 7(%sp)
	flw	%f3, 2(%sp)
	lw	%v0, 19(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	calc_dirvec.3083
calc_dirvecs.3091:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.33965
	itof	%f1, %v0
	flw	%f2, 467(%zero)
	fmul	%f1, %f1, %f2
	flw	%f3, 436(%zero)
	fsub	%f1, %f1, %f3
	flw	%f4, 470(%zero)
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
	jal	calc_dirvec.3083
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 439(%zero)
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
	jal	calc_dirvec.3083
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 3(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.33966
	addi	%v1, %v1, -5
	j	bgti_cont.33967
bgti_else.33966:
bgti_cont.33967:
	blti	%v0, 0, bgti_else.33968
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
	jal	calc_dirvec.3083
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
	jal	calc_dirvec.3083
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.33969
	addi	%v1, %v1, -5
	j	bgti_cont.33970
bgti_else.33969:
bgti_cont.33970:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3091
bgti_else.33968:
	jr	%ra
bgti_else.33965:
	jr	%ra
calc_dirvec_rows.3096:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.33993
	itof	%f0, %v0
	flw	%f1, 467(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 436(%zero)
	fsub	%f3, %f0, %f2
	addi	%a2, %zero, 4
	itof	%f0, %a2
	fmul	%f0, %f0, %f1
	fsub	%f0, %f0, %f2
	flw	%f4, 470(%zero)
	fsw	%f2, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f3, 2(%sp)
	fsw	%f4, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a1, 5(%sp)
	sw	%a0, 6(%sp)
	fsw	%f1, 7(%sp)
	sw	%a2, 8(%sp)
	addi	%v0, %a1, 0
	fmov	%f2, %f0
	fmov	%f1, %f4
	fmov	%f0, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvec.3083
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	itof	%f0, %v0
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 439(%zero)
	fadd	%f2, %f0, %f2
	lw	%v1, 6(%sp)
	addi	%a0, %v1, 2
	flw	%f0, 3(%sp)
	flw	%f3, 2(%sp)
	lw	%a1, 5(%sp)
	lw	%a2, 4(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	fmov	%f1, %f0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvec.3083
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 4(%sp)
	addi	%a0, %v1, 1
	blti	%a0, 5, bgti_else.33994
	addi	%a0, %a0, -5
	j	bgti_cont.33995
bgti_else.33994:
bgti_cont.33995:
	flw	%f0, 2(%sp)
	lw	%a1, 6(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 4(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.33996
	addi	%v1, %v1, -5
	j	bgti_cont.33997
bgti_else.33996:
bgti_cont.33997:
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.33998
	itof	%f0, %v0
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 0(%sp)
	fsub	%f0, %f0, %f1
	lw	%a1, 8(%sp)
	sw	%a0, 9(%sp)
	sw	%v1, 10(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.33999
	addi	%v1, %v1, -5
	j	bgti_cont.34000
bgti_else.33999:
bgti_cont.34000:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3096
bgti_else.33998:
	jr	%ra
bgti_else.33993:
	jr	%ra
create_dirvec_elements.3102:
	blti	%v1, 0, bgti_else.34025
	addi	%a0, %zero, 3
	flw	%f0, 470(%zero)
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
	blti	%v0, 0, bgti_else.34026
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
	blti	%v0, 0, bgti_else.34027
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
	blti	%v0, 0, bgti_else.34028
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
	j	create_dirvec_elements.3102
bgti_else.34028:
	jr	%ra
bgti_else.34027:
	jr	%ra
bgti_else.34026:
	jr	%ra
bgti_else.34025:
	jr	%ra
create_dirvecs.3105:
	blti	%v0, 0, bgti_else.34071
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 470(%zero)
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
	lw	%v1, 2(%sp)
	sw	%v0, 179(%v1)
	lw	%v0, 179(%v1)
	flw	%f0, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %a0, 0
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
	jal	create_dirvec_elements.3102
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.34072
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
	lw	%v1, 11(%sp)
	sw	%v0, 179(%v1)
	lw	%v0, 179(%v1)
	flw	%f0, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %a0, 0
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
	jal	create_dirvec_elements.3102
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	j	create_dirvecs.3105
bgti_else.34072:
	jr	%ra
bgti_else.34071:
	jr	%ra
init_dirvec_constants.3107:
	blti	%v1, 0, bgti_else.34136
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
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.34137
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.34138
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.34140
	beqi	%t1, 2, bnei_else.34142
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_second_table.2886
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.34141
bnei_else.34142:
	addi	%t1, %zero, 4
	flw	%f0, 470(%zero)
	sw	%a3, 5(%sp)
	fsw	%f0, 6(%sp)
	sw	%a2, 7(%sp)
	sw	%t0, 8(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)
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
	flw	%f1, 6(%sp)
	fblt	%f1, %f0, fbgt_else.34144
	addi	%v1, %zero, 0
	j	fbgt_cont.34145
fbgt_else.34144:
	addi	%v1, %zero, 1
fbgt_cont.34145:
	beqi	%v1, 0, bnei_else.34146
	flw	%f1, 458(%zero)
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
	j	bnei_cont.34147
bnei_else.34146:
	fsw	%f1, 0(%v0)
bnei_cont.34147:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.34143:
	j	bnei_cont.34141
bnei_else.34140:
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	setup_rect_table.2880
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.34141:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bgti_cont.34139
bgti_else.34138:
bgti_cont.34139:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.34148
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.34149
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	sw	%v0, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_dirvec_constants.2892
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	init_dirvec_constants.3107
bgti_else.34149:
	jr	%ra
bgti_else.34148:
	jr	%ra
bgti_else.34137:
	jr	%ra
bgti_else.34136:
	jr	%ra
init_vecset_constants.3110:
	blti	%v0, 0, bgti_else.34200
	lw	%v1, 179(%v0)
	addi	%a0, %zero, 119
	lw	%a1, 119(%v1)
	lw	%a2, 0(%zero)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v1, 3(%sp)
	blti	%a2, 0, bgti_else.34201
	lw	%a3, 12(%a2)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.34203
	beqi	%t2, 2, bnei_else.34205
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_second_table.2886
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.34204
bnei_else.34205:
	addi	%t2, %zero, 4
	flw	%f0, 470(%zero)
	sw	%t0, 5(%sp)
	fsw	%f0, 6(%sp)
	sw	%a3, 7(%sp)
	sw	%t1, 8(%sp)
	addi	%v0, %t2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)
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
	flw	%f1, 6(%sp)
	fblt	%f1, %f0, fbgt_else.34207
	addi	%v1, %zero, 0
	j	fbgt_cont.34208
fbgt_else.34207:
	addi	%v1, %zero, 1
fbgt_cont.34208:
	beqi	%v1, 0, bnei_else.34209
	flw	%f1, 458(%zero)
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
	j	bnei_cont.34210
bnei_else.34209:
	fsw	%f1, 0(%v0)
bnei_cont.34210:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.34206:
	j	bnei_cont.34204
bnei_else.34203:
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	setup_rect_table.2880
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.34204:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bgti_cont.34202
bgti_else.34201:
bgti_cont.34202:
	addi	%v0, %zero, 118
	lw	%v1, 3(%sp)
	lw	%a0, 118(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 117
	lw	%v1, 3(%sp)
	lw	%a0, 117(%v1)
	sw	%v0, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_dirvec_constants.2892
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %zero, 116
	lw	%v0, 3(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.34211
	lw	%v1, 179(%v0)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 11(%sp)
	sw	%v1, 12(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 118(%v0)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_dirvec_constants.2892
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.34212
	lw	%v1, 179(%v0)
	lw	%a0, 119(%v1)
	sw	%v0, 13(%sp)
	sw	%v1, 14(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	setup_dirvec_constants.2892
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 14(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 13(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.34213
	lw	%v1, 179(%v0)
	lw	%a0, 0(%sp)
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 15(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3110
bgti_else.34213:
	jr	%ra
bgti_else.34212:
	jr	%ra
bgti_else.34211:
	jr	%ra
bgti_else.34200:
	jr	%ra
setup_reflections.3127:
	blti	%v0, 0, bgti_else.34265
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.34266
	jr	%ra
bnei_else.34266:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 474(%zero)
	fblt	%f0, %f1, fbgt_else.34268
	addi	%a0, %zero, 0
	j	fbgt_cont.34269
fbgt_else.34268:
	addi	%a0, %zero, 1
fbgt_cont.34269:
	beqi	%a0, 0, bnei_else.34270
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.34271
	beqi	%a0, 2, bnei_else.34272
	jr	%ra
bnei_else.34272:
	sll	%v0, %v0, 2
	addi	%v0, %v0, 1
	lw	%a0, 434(%zero)
	lw	%a1, 7(%v1)
	flw	%f0, 0(%a1)
	fsub	%f0, %f1, %f0
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
	flw	%f5, 496(%zero)
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
	flw	%f4, 470(%zero)
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
	lw	%v0, 7(%sp)
	sw	%v0, 0(%v1)
	flw	%f0, 5(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 4(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 3(%sp)
	fsw	%f0, 2(%v0)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, -1
	sw	%v1, 8(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 8(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 0(%sp)
	sw	%v0, 254(%v1)
	addi	%v0, %v1, 1
	sw	%v0, 434(%zero)
	jr	%ra
bnei_else.34271:
	sll	%v0, %v0, 2
	lw	%a0, 434(%zero)
	lw	%v1, 7(%v1)
	flw	%f0, 0(%v1)
	fsub	%f0, %f1, %f0
	flw	%f1, 78(%zero)
	fneg	%f2, %f1
	flw	%f3, 79(%zero)
	fneg	%f4, %f3
	flw	%f5, 80(%zero)
	fneg	%f6, %f5
	addi	%v1, %v0, 1
	addi	%a1, %zero, 3
	flw	%f7, 470(%zero)
	fsw	%f5, 9(%sp)
	fsw	%f3, 10(%sp)
	fsw	%f2, 11(%sp)
	fsw	%f7, 12(%sp)
	sw	%a1, 13(%sp)
	sw	%v0, 14(%sp)
	sw	%a0, 15(%sp)
	sw	%v1, 16(%sp)
	fsw	%f0, 17(%sp)
	fsw	%f6, 18(%sp)
	fsw	%f4, 19(%sp)
	fsw	%f1, 20(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f7
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)
	sw	%v0, 21(%sp)
	sw	%v1, 22(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 22(%sp)
	sw	%v0, 0(%v1)
	flw	%f0, 20(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 19(%sp)
	fsw	%f0, 1(%v0)
	flw	%f1, 18(%sp)
	fsw	%f1, 2(%v0)
	lw	%v0, 21(%sp)
	addi	%a0, %v0, -1
	sw	%a0, 23(%sp)
	sw	%v1, 24(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 17(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 24(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 16(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 15(%sp)
	sw	%v0, 254(%v1)
	addi	%v0, %v1, 1
	lw	%a0, 14(%sp)
	addi	%a1, %a0, 2
	flw	%f1, 12(%sp)
	lw	%a2, 13(%sp)
	sw	%v0, 25(%sp)
	sw	%a1, 26(%sp)
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_float_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 21(%sp)
	sw	%v1, 27(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 27(%sp)
	sw	%v0, 0(%v1)
	flw	%f0, 11(%sp)
	fsw	%f0, 0(%v0)
	flw	%f1, 10(%sp)
	fsw	%f1, 1(%v0)
	flw	%f1, 18(%sp)
	fsw	%f1, 2(%v0)
	lw	%v0, 23(%sp)
	sw	%v1, 28(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 17(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 28(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 26(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 25(%sp)
	sw	%v0, 254(%v1)
	lw	%v0, 15(%sp)
	addi	%v1, %v0, 2
	lw	%a0, 14(%sp)
	addi	%a0, %a0, 3
	flw	%f1, 12(%sp)
	lw	%a1, 13(%sp)
	sw	%v1, 29(%sp)
	sw	%a0, 30(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f1
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 21(%sp)
	sw	%v1, 31(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_create_array
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 31(%sp)
	sw	%v0, 0(%v1)
	flw	%f0, 11(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 19(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 9(%sp)
	fsw	%f0, 2(%v0)
	lw	%v0, 23(%sp)
	sw	%v1, 32(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 17(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 32(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 30(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 29(%sp)
	sw	%v0, 254(%v1)
	lw	%v0, 15(%sp)
	addi	%v0, %v0, 3
	sw	%v0, 434(%zero)
	jr	%ra
bnei_else.34270:
	jr	%ra
bgti_else.34265:
	jr	%ra
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
	flw	%f0, 470(%zero)
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
	flw	%f0, 449(%zero)
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
	flw	%f0, 443(%zero)
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
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_extarray
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	lw	%a1, 3(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_extarray
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	sw	%v0, 248(%zero)
	lw	%v0, 9(%sp)
	sw	%v0, 247(%zero)
	addi	%v1, %zero, 249
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%a0, %zero, 249
	addi	%v1, %zero, 249
	lw	%a1, 1(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_extarray
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %zero, 249
	sw	%v0, 250(%zero)
	lw	%v0, 10(%sp)
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
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_extarray
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%a0, %zero, 434
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_extarray
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 6(%sp)
	sw	%v0, 154(%zero)
	sw	%v0, 155(%zero)
	lw	%v1, 0(%sp)
	sw	%v1, 156(%zero)
	sw	%v1, 157(%zero)
	flw	%f0, 435(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	fsw	%f0, 158(%zero)
	lw	%a0, 154(%zero)
	flw	%f0, 2(%sp)
	lw	%a1, 4(%sp)
	sw	%a0, 11(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 3(%v1)
	addi	%v0, %zero, 4
	flw	%f0, 2(%sp)
	lw	%a0, 4(%sp)
	sw	%v0, 14(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_float_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 17(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f0, 2(%sp)
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
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 19(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_float_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 19(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 18(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 17(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 16(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 15(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 13(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 12(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	lw	%v0, 11(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 11(%sp)
	addi	%a0, %v1, -2
	sw	%a0, 21(%sp)
	blti	%a0, 0, bgti_else.34634
	sw	%v0, 22(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	create_pixel.3071
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	lw	%v1, 21(%sp)
	lw	%a0, 22(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	init_line_elements.3073
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.34635
bgti_else.34634:
bgti_cont.34635:
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 23(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_float_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 24(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 25(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_float_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_float_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_float_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_float_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 26(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 27(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 28(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 29(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 30(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 31(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_create_float_array
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 31(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_create_float_array
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 31(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_create_float_array
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 31(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_create_float_array
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 31(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 30(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 29(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 28(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 27(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 26(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 25(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 24(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	lw	%v0, 11(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_create_array
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 21(%sp)
	blti	%v1, 0, bgti_else.34636
	sw	%v0, 32(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	create_pixel.3071
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	lw	%v1, 21(%sp)
	lw	%a0, 32(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	init_line_elements.3073
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	j	bgti_cont.34637
bgti_else.34636:
bgti_cont.34637:
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 33(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	min_caml_create_float_array
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 34(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	min_caml_create_float_array
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	min_caml_create_array
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 35(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 36(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 37(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_float_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 38(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 39(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 40(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	min_caml_create_float_array
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	min_caml_create_array
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 41(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 40(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 39(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 38(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 37(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 36(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 35(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 34(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	lw	%v0, 11(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 21(%sp)
	blti	%v1, 0, bgti_else.34638
	sw	%v0, 42(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	create_pixel.3071
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 21(%sp)
	lw	%a0, 42(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	init_line_elements.3073
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	j	bgti_cont.34639
bgti_else.34638:
bgti_cont.34639:
	sw	%v0, 43(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	read_screen_settings.2775
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	min_caml_read_int
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	min_caml_read_float
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	flw	%f1, 461(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 44(%sp)
	fsw	%f1, 45(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	sin.2637
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_read_float
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	flw	%f1, 45(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 44(%sp)
	fsw	%f0, 46(%sp)
	fmov	%f0, %f1
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	cos.2635
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	flw	%f1, 46(%sp)
	fsw	%f0, 47(%sp)
	fmov	%f0, %f1
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	sin.2637
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	flw	%f1, 47(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 78(%zero)
	flw	%f0, 46(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	cos.2635
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	flw	%f1, 47(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 80(%zero)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_read_float
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	fsw	%f0, 81(%zero)
	lw	%v0, 1(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_nth_object.2782
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	beqi	%v0, 0, bnei_else.34640
	lw	%v0, 0(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_nth_object.2782
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	beqi	%v0, 0, bnei_else.34642
	lw	%v0, 6(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_nth_object.2782
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	beqi	%v0, 0, bnei_else.34644
	lw	%v0, 4(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_nth_object.2782
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	beqi	%v0, 0, bnei_else.34646
	lw	%v0, 14(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_object.2784
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	bnei_cont.34641
bnei_else.34646:
	lw	%v0, 4(%sp)
	sw	%v0, 0(%zero)
bnei_cont.34647:
	j	bnei_cont.34641
bnei_else.34644:
	lw	%v0, 6(%sp)
	sw	%v0, 0(%zero)
bnei_cont.34645:
	j	bnei_cont.34641
bnei_else.34642:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
bnei_cont.34643:
	j	bnei_cont.34641
bnei_else.34640:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
bnei_cont.34641:
	lw	%v0, 1(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_net_item.2788
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.34648
	sw	%v0, 83(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_and_network.2792
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	bnei_cont.34649
bnei_else.34648:
bnei_cont.34649:
	lw	%v0, 1(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_net_item.2788
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.34650
	lw	%v0, 0(%sp)
	sw	%v1, 48(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	read_or_network.2790
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.34651
bnei_else.34650:
	lw	%v0, 0(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_create_array
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
bnei_cont.34651:
	sw	%v0, 134(%zero)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	write_ppm_header.3037
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	addi	%v0, %zero, 120
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 49(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_create_float_array
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)
	sw	%v0, 50(%sp)
	sw	%v1, 51(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_create_array
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 51(%sp)
	sw	%v0, 0(%v1)
	lw	%v0, 49(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_create_array
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	sw	%v0, 183(%zero)
	lw	%v0, 183(%zero)
	addi	%v1, %zero, 118
	sw	%v0, 52(%sp)
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	create_dirvec_elements.3102
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	create_dirvecs.3105
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	addi	%v0, %zero, 9
	itof	%f0, %v0
	flw	%f1, 467(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 436(%zero)
	fsub	%f0, %f0, %f1
	lw	%v0, 14(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %v1, 0
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 6(%sp)
	lw	%a0, 14(%sp)
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	calc_dirvec_rows.3096
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	addi	%v1, %zero, 119
	lw	%v0, 52(%sp)
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	init_vecset_constants.3110
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	flw	%f0, 78(%zero)
	fsw	%f0, 184(%zero)
	flw	%f0, 79(%zero)
	fsw	%f0, 185(%zero)
	flw	%f0, 80(%zero)
	fsw	%f0, 186(%zero)
	lw	%v0, 50(%sp)
	addi	%v0, %v0, -1
	sw	%v0, 53(%sp)
	blti	%v0, 0, bgti_else.34652
	lw	%v1, 12(%v0)
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.34654
	beqi	%a0, 2, bnei_else.34656
	addi	%a0, %zero, 184
	addi	%v0, %a0, 0
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	setup_second_table.2886
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	lw	%v1, 53(%sp)
	sw	%v0, 187(%v1)
	j	bnei_cont.34655
bnei_else.34656:
	flw	%f0, 2(%sp)
	lw	%a0, 14(%sp)
	sw	%v1, 54(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	flw	%f0, 184(%zero)
	lw	%v1, 54(%sp)
	lw	%a0, 4(%v1)
	flw	%f1, 0(%a0)
	fmul	%f0, %f0, %f1
	flw	%f1, 185(%zero)
	lw	%a0, 4(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 186(%zero)
	lw	%a0, 4(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%sp)
	fblt	%f1, %f0, fbgt_else.34658
	addi	%a0, %zero, 0
	j	fbgt_cont.34659
fbgt_else.34658:
	addi	%a0, %zero, 1
fbgt_cont.34659:
	beqi	%a0, 0, bnei_else.34660
	flw	%f1, 458(%zero)
	fdiv	%f1, %f1, %f0
	fsw	%f1, 0(%v0)
	lw	%a0, 4(%v1)
	flw	%f1, 0(%a0)
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	fsw	%f1, 1(%v0)
	lw	%a0, 4(%v1)
	flw	%f1, 1(%a0)
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	fsw	%f1, 2(%v0)
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	fdiv	%f0, %f1, %f0
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.34661
bnei_else.34660:
	fsw	%f1, 0(%v0)
bnei_cont.34661:
	lw	%v1, 53(%sp)
	sw	%v0, 187(%v1)
bnei_cont.34657:
	j	bnei_cont.34655
bnei_else.34654:
	addi	%a0, %zero, 184
	addi	%v0, %a0, 0
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	setup_rect_table.2880
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	lw	%v1, 53(%sp)
	sw	%v0, 187(%v1)
bnei_cont.34655:
	addi	%v0, %v1, -1
	addi	%a0, %zero, 247
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	j	bgti_cont.34653
bgti_else.34652:
bgti_cont.34653:
	lw	%v0, 53(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	setup_reflections.3127
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	flw	%f0, 158(%zero)
	lw	%v0, 157(%zero)
	lw	%a0, 1(%sp)
	sub	%v0, %a0, %v0
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
	lw	%v0, 11(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 33(%sp)
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 23(%sp)
	lw	%a0, 33(%sp)
	lw	%a1, 43(%sp)
	lw	%a2, 6(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	scan_line.3063
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	addi	%g0, %zero, 0
	ret
