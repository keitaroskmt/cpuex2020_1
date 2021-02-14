.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 44464
	lui	%hp, 0
	ori	%hp, %hp, 497
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
	fblt	%f0, %f1, fbgt_else.21789
	flw	%f2, 496(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.21790
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
	j	reduction_2pi_sub1.2626
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
fbgt_else.21789:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2629:
	fblt	%f0, %f2, fbgt_else.21805
	fblt	%f0, %f1, fbgt_else.21806
	fsub	%f0, %f0, %f1
	flw	%f3, 496(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21807
	fblt	%f0, %f1, fbgt_else.21808
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21809
	fblt	%f0, %f1, fbgt_else.21810
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21811
	fblt	%f0, %f1, fbgt_else.21812
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21812:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21811:
	jr	%ra
fbgt_else.21810:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21813
	fblt	%f0, %f1, fbgt_else.21814
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21814:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21813:
	jr	%ra
fbgt_else.21809:
	jr	%ra
fbgt_else.21808:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21815
	fblt	%f0, %f1, fbgt_else.21816
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21817
	fblt	%f0, %f1, fbgt_else.21818
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21818:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21817:
	jr	%ra
fbgt_else.21816:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21819
	fblt	%f0, %f1, fbgt_else.21820
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21820:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21819:
	jr	%ra
fbgt_else.21815:
	jr	%ra
fbgt_else.21807:
	jr	%ra
fbgt_else.21806:
	flw	%f3, 496(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21821
	fblt	%f0, %f1, fbgt_else.21822
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21823
	fblt	%f0, %f1, fbgt_else.21824
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21825
	fblt	%f0, %f1, fbgt_else.21826
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21826:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21825:
	jr	%ra
fbgt_else.21824:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21827
	fblt	%f0, %f1, fbgt_else.21828
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21828:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21827:
	jr	%ra
fbgt_else.21823:
	jr	%ra
fbgt_else.21822:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21829
	fblt	%f0, %f1, fbgt_else.21830
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21831
	fblt	%f0, %f1, fbgt_else.21832
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21832:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21831:
	jr	%ra
fbgt_else.21830:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.21833
	fblt	%f0, %f1, fbgt_else.21834
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21834:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.21833:
	jr	%ra
fbgt_else.21829:
	jr	%ra
fbgt_else.21821:
	jr	%ra
fbgt_else.21805:
	jr	%ra
cos.2635:
	flw	%f1, 495(%zero)
	fabs	%f0, %f0
	flw	%f2, 494(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.21880
	flw	%f3, 493(%zero)
	fblt	%f0, %f3, fbgt_else.21882
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.21884
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.21886
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.21888
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.21890
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.21892
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.21894
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.21896
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.21898
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.21900
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.21902
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.21904
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.21906
	flw	%f3, 480(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.21881
fbgt_else.21906:
	fmov	%f0, %f3
fbgt_cont.21907:
	j	fbgt_cont.21881
fbgt_else.21904:
	fmov	%f0, %f3
fbgt_cont.21905:
	j	fbgt_cont.21881
fbgt_else.21902:
	fmov	%f0, %f3
fbgt_cont.21903:
	j	fbgt_cont.21881
fbgt_else.21900:
	fmov	%f0, %f3
fbgt_cont.21901:
	j	fbgt_cont.21881
fbgt_else.21898:
	fmov	%f0, %f3
fbgt_cont.21899:
	j	fbgt_cont.21881
fbgt_else.21896:
	fmov	%f0, %f3
fbgt_cont.21897:
	j	fbgt_cont.21881
fbgt_else.21894:
	fmov	%f0, %f3
fbgt_cont.21895:
	j	fbgt_cont.21881
fbgt_else.21892:
	fmov	%f0, %f3
fbgt_cont.21893:
	j	fbgt_cont.21881
fbgt_else.21890:
	fmov	%f0, %f3
fbgt_cont.21891:
	j	fbgt_cont.21881
fbgt_else.21888:
	fmov	%f0, %f3
fbgt_cont.21889:
	j	fbgt_cont.21881
fbgt_else.21886:
	fmov	%f0, %f3
fbgt_cont.21887:
	j	fbgt_cont.21881
fbgt_else.21884:
	fmov	%f0, %f3
fbgt_cont.21885:
	j	fbgt_cont.21881
fbgt_else.21882:
	fmov	%f0, %f3
fbgt_cont.21883:
	j	fbgt_cont.21881
fbgt_else.21880:
	fmov	%f0, %f2
fbgt_cont.21881:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	fblt	%f1, %f2, fbgt_else.21908
	fblt	%f1, %f0, fbgt_else.21910
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.21912
	fblt	%f1, %f0, fbgt_else.21914
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
	j	fbgt_cont.21909
fbgt_else.21914:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.21915:
	j	fbgt_cont.21909
fbgt_else.21912:
	fmov	%f0, %f1
fbgt_cont.21913:
	j	fbgt_cont.21909
fbgt_else.21910:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.21916
	fblt	%f1, %f0, fbgt_else.21918
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
	j	fbgt_cont.21909
fbgt_else.21918:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.21919:
	j	fbgt_cont.21909
fbgt_else.21916:
	fmov	%f0, %f1
fbgt_cont.21917:
fbgt_cont.21911:
	j	fbgt_cont.21909
fbgt_else.21908:
	fmov	%f0, %f1
fbgt_cont.21909:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.21920
	addi	%v0, %zero, 0
	j	fbgt_cont.21921
fbgt_else.21920:
	addi	%v0, %zero, 1
fbgt_cont.21921:
	fblt	%f0, %f1, fbgt_else.21922
	fsub	%f0, %f0, %f1
	j	fbgt_cont.21923
fbgt_else.21922:
fbgt_cont.21923:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.21924
	beqi	%v0, 0, bnei_else.21926
	addi	%v0, %zero, 0
	j	fbgt_cont.21925
bnei_else.21926:
	addi	%v0, %zero, 1
bnei_cont.21927:
	j	fbgt_cont.21925
fbgt_else.21924:
fbgt_cont.21925:
	fblt	%f0, %f2, fbgt_else.21928
	fsub	%f0, %f1, %f0
	j	fbgt_cont.21929
fbgt_else.21928:
fbgt_cont.21929:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.21930
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
	j	fbgt_cont.21931
fbgt_else.21930:
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
fbgt_cont.21931:
	beqi	%v0, 0, bnei_else.21932
	jr	%ra
bnei_else.21932:
	fneg	%f0, %f0
	jr	%ra
sin.2637:
	flw	%f1, 495(%zero)
	flw	%f2, 470(%zero)
	fblt	%f0, %f2, fbgt_else.21993
	addi	%v0, %zero, 1
	j	fbgt_cont.21994
fbgt_else.21993:
	addi	%v0, %zero, 0
fbgt_cont.21994:
	fabs	%f0, %f0
	flw	%f2, 494(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.21995
	flw	%f3, 493(%zero)
	fblt	%f0, %f3, fbgt_else.21997
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.21999
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.22001
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.22003
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.22005
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.22007
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.22009
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.22011
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.22013
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.22015
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.22017
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.22019
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.22021
	flw	%f3, 480(%zero)
	fmov	%f1, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.21996
fbgt_else.22021:
	fmov	%f0, %f3
fbgt_cont.22022:
	j	fbgt_cont.21996
fbgt_else.22019:
	fmov	%f0, %f3
fbgt_cont.22020:
	j	fbgt_cont.21996
fbgt_else.22017:
	fmov	%f0, %f3
fbgt_cont.22018:
	j	fbgt_cont.21996
fbgt_else.22015:
	fmov	%f0, %f3
fbgt_cont.22016:
	j	fbgt_cont.21996
fbgt_else.22013:
	fmov	%f0, %f3
fbgt_cont.22014:
	j	fbgt_cont.21996
fbgt_else.22011:
	fmov	%f0, %f3
fbgt_cont.22012:
	j	fbgt_cont.21996
fbgt_else.22009:
	fmov	%f0, %f3
fbgt_cont.22010:
	j	fbgt_cont.21996
fbgt_else.22007:
	fmov	%f0, %f3
fbgt_cont.22008:
	j	fbgt_cont.21996
fbgt_else.22005:
	fmov	%f0, %f3
fbgt_cont.22006:
	j	fbgt_cont.21996
fbgt_else.22003:
	fmov	%f0, %f3
fbgt_cont.22004:
	j	fbgt_cont.21996
fbgt_else.22001:
	fmov	%f0, %f3
fbgt_cont.22002:
	j	fbgt_cont.21996
fbgt_else.21999:
	fmov	%f0, %f3
fbgt_cont.22000:
	j	fbgt_cont.21996
fbgt_else.21997:
	fmov	%f0, %f3
fbgt_cont.21998:
	j	fbgt_cont.21996
fbgt_else.21995:
	fmov	%f0, %f2
fbgt_cont.21996:
	flw	%f1, 2(%sp)
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.22023
	fblt	%f1, %f0, fbgt_else.22025
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.22027
	fblt	%f1, %f0, fbgt_else.22029
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
	j	fbgt_cont.22024
fbgt_else.22029:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.22030:
	j	fbgt_cont.22024
fbgt_else.22027:
	fmov	%f0, %f1
fbgt_cont.22028:
	j	fbgt_cont.22024
fbgt_else.22025:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.22031
	fblt	%f1, %f0, fbgt_else.22033
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
	j	fbgt_cont.22024
fbgt_else.22033:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.22034:
	j	fbgt_cont.22024
fbgt_else.22031:
	fmov	%f0, %f1
fbgt_cont.22032:
fbgt_cont.22026:
	j	fbgt_cont.22024
fbgt_else.22023:
	fmov	%f0, %f1
fbgt_cont.22024:
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.22035
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.22037
	addi	%v0, %zero, 0
	j	fbgt_cont.22036
bnei_else.22037:
	addi	%v0, %zero, 1
bnei_cont.22038:
	j	fbgt_cont.22036
fbgt_else.22035:
	lw	%v0, 0(%sp)
fbgt_cont.22036:
	fblt	%f0, %f1, fbgt_else.22039
	fsub	%f0, %f0, %f1
	j	fbgt_cont.22040
fbgt_else.22039:
fbgt_cont.22040:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.22041
	fsub	%f0, %f1, %f0
	j	fbgt_cont.22042
fbgt_else.22041:
fbgt_cont.22042:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.22043
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
	j	fbgt_cont.22044
fbgt_else.22043:
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
fbgt_cont.22044:
	beqi	%v0, 0, bnei_else.22045
	jr	%ra
bnei_else.22045:
	fneg	%f0, %f0
	jr	%ra
atan.2639:
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.22046
	addi	%v0, %zero, 1
	j	fbgt_cont.22047
fbgt_else.22046:
	addi	%v0, %zero, 0
fbgt_cont.22047:
	fabs	%f1, %f0
	flw	%f2, 469(%zero)
	fblt	%f1, %f2, fbgt_else.22048
	flw	%f0, 462(%zero)
	fblt	%f1, %f0, fbgt_else.22049
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
	j	fbgt_cont.22050
fbgt_else.22049:
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
fbgt_cont.22050:
	beqi	%v0, 0, bnei_else.22051
	jr	%ra
bnei_else.22051:
	fneg	%f0, %f0
	jr	%ra
fbgt_else.22048:
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
	blti	%v0, 10, bgti_else.22052
	blti	%v0, 20, bgti_else.22053
	blti	%v0, 30, bgti_else.22054
	blti	%v0, 40, bgti_else.22055
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	blti	%v0, 10, bgti_else.22056
	blti	%v0, 20, bgti_else.22057
	blti	%v0, 30, bgti_else.22058
	blti	%v0, 40, bgti_else.22059
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	blti	%v0, 10, bgti_else.22060
	blti	%v0, 20, bgti_else.22061
	blti	%v0, 30, bgti_else.22062
	blti	%v0, 40, bgti_else.22063
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	blti	%v0, 10, bgti_else.22064
	blti	%v0, 20, bgti_else.22065
	blti	%v0, 30, bgti_else.22066
	blti	%v0, 40, bgti_else.22067
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	j	print_int_sub1.2641
bgti_else.22067:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.22066:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.22065:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.22064:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.22063:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.22062:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.22061:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.22060:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.22059:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.22058:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.22057:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.22056:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.22055:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.22054:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.22053:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.22052:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2644:
	blti	%v0, 10, bgti_else.22068
	blti	%v0, 20, bgti_else.22069
	blti	%v0, 30, bgti_else.22070
	blti	%v0, 40, bgti_else.22071
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22072
	blti	%v0, 20, bgti_else.22073
	blti	%v0, 30, bgti_else.22074
	blti	%v0, 40, bgti_else.22075
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22076
	blti	%v0, 20, bgti_else.22077
	blti	%v0, 30, bgti_else.22078
	blti	%v0, 40, bgti_else.22079
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22080
	blti	%v0, 20, bgti_else.22081
	blti	%v0, 30, bgti_else.22082
	blti	%v0, 40, bgti_else.22083
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22084
	blti	%v0, 20, bgti_else.22085
	blti	%v0, 30, bgti_else.22086
	blti	%v0, 40, bgti_else.22087
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22088
	blti	%v0, 20, bgti_else.22089
	blti	%v0, 30, bgti_else.22090
	blti	%v0, 40, bgti_else.22091
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22092
	blti	%v0, 20, bgti_else.22093
	blti	%v0, 30, bgti_else.22094
	blti	%v0, 40, bgti_else.22095
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22096
	blti	%v0, 20, bgti_else.22097
	blti	%v0, 30, bgti_else.22098
	blti	%v0, 40, bgti_else.22099
	addi	%v0, %v0, -40
	j	print_int_sub2.2644
bgti_else.22099:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22098:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22097:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22096:
	jr	%ra
bgti_else.22095:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22094:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22093:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22092:
	jr	%ra
bgti_else.22091:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22090:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22089:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22088:
	jr	%ra
bgti_else.22087:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22086:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22085:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22084:
	jr	%ra
bgti_else.22083:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22082:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22081:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22080:
	jr	%ra
bgti_else.22079:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22078:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22077:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22076:
	jr	%ra
bgti_else.22075:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22074:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22073:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22072:
	jr	%ra
bgti_else.22071:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22070:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22069:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22068:
	jr	%ra
print_int.2646:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.22983
	blti	%v0, 20, bgti_else.22985
	blti	%v0, 30, bgti_else.22987
	blti	%v0, 40, bgti_else.22989
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.22991
	blti	%v1, 20, bgti_else.22993
	blti	%v1, 30, bgti_else.22995
	blti	%v1, 40, bgti_else.22997
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.22999
	blti	%v1, 20, bgti_else.23001
	blti	%v1, 30, bgti_else.23003
	blti	%v1, 40, bgti_else.23005
	addi	%v1, %v1, -40
	addi	%a0, %zero, 12
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2641
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.22984
bgti_else.23005:
	addi	%v0, %zero, 11
bgti_cont.23006:
	j	bgti_cont.22984
bgti_else.23003:
	addi	%v0, %zero, 10
bgti_cont.23004:
	j	bgti_cont.22984
bgti_else.23001:
	addi	%v0, %zero, 9
bgti_cont.23002:
	j	bgti_cont.22984
bgti_else.22999:
	addi	%v0, %zero, 8
bgti_cont.23000:
	j	bgti_cont.22984
bgti_else.22997:
	addi	%v0, %zero, 7
bgti_cont.22998:
	j	bgti_cont.22984
bgti_else.22995:
	addi	%v0, %zero, 6
bgti_cont.22996:
	j	bgti_cont.22984
bgti_else.22993:
	addi	%v0, %zero, 5
bgti_cont.22994:
	j	bgti_cont.22984
bgti_else.22991:
	addi	%v0, %zero, 4
bgti_cont.22992:
	j	bgti_cont.22984
bgti_else.22989:
	addi	%v0, %zero, 3
bgti_cont.22990:
	j	bgti_cont.22984
bgti_else.22987:
	addi	%v0, %zero, 2
bgti_cont.22988:
	j	bgti_cont.22984
bgti_else.22985:
	addi	%v0, %zero, 1
bgti_cont.22986:
	j	bgti_cont.22984
bgti_else.22983:
	addi	%v0, %zero, 0
bgti_cont.22984:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.23007
	blti	%v1, 20, bgti_else.23009
	blti	%v1, 30, bgti_else.23011
	blti	%v1, 40, bgti_else.23013
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23015
	blti	%v1, 20, bgti_else.23017
	blti	%v1, 30, bgti_else.23019
	blti	%v1, 40, bgti_else.23021
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23023
	blti	%v1, 20, bgti_else.23025
	blti	%v1, 30, bgti_else.23027
	blti	%v1, 40, bgti_else.23029
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23031
	blti	%v1, 20, bgti_else.23033
	blti	%v1, 30, bgti_else.23035
	blti	%v1, 40, bgti_else.23037
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23039
	blti	%v1, 20, bgti_else.23041
	blti	%v1, 30, bgti_else.23043
	blti	%v1, 40, bgti_else.23045
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23047
	blti	%v1, 20, bgti_else.23049
	blti	%v1, 30, bgti_else.23051
	blti	%v1, 40, bgti_else.23053
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23055
	blti	%v1, 20, bgti_else.23057
	blti	%v1, 30, bgti_else.23059
	blti	%v1, 40, bgti_else.23061
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2644
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.23008
bgti_else.23061:
	addi	%v0, %v1, -30
bgti_cont.23062:
	j	bgti_cont.23008
bgti_else.23059:
	addi	%v0, %v1, -20
bgti_cont.23060:
	j	bgti_cont.23008
bgti_else.23057:
	addi	%v0, %v1, -10
bgti_cont.23058:
	j	bgti_cont.23008
bgti_else.23055:
	add	%v0, %zero, %v1
bgti_cont.23056:
	j	bgti_cont.23008
bgti_else.23053:
	addi	%v0, %v1, -30
bgti_cont.23054:
	j	bgti_cont.23008
bgti_else.23051:
	addi	%v0, %v1, -20
bgti_cont.23052:
	j	bgti_cont.23008
bgti_else.23049:
	addi	%v0, %v1, -10
bgti_cont.23050:
	j	bgti_cont.23008
bgti_else.23047:
	add	%v0, %zero, %v1
bgti_cont.23048:
	j	bgti_cont.23008
bgti_else.23045:
	addi	%v0, %v1, -30
bgti_cont.23046:
	j	bgti_cont.23008
bgti_else.23043:
	addi	%v0, %v1, -20
bgti_cont.23044:
	j	bgti_cont.23008
bgti_else.23041:
	addi	%v0, %v1, -10
bgti_cont.23042:
	j	bgti_cont.23008
bgti_else.23039:
	add	%v0, %zero, %v1
bgti_cont.23040:
	j	bgti_cont.23008
bgti_else.23037:
	addi	%v0, %v1, -30
bgti_cont.23038:
	j	bgti_cont.23008
bgti_else.23035:
	addi	%v0, %v1, -20
bgti_cont.23036:
	j	bgti_cont.23008
bgti_else.23033:
	addi	%v0, %v1, -10
bgti_cont.23034:
	j	bgti_cont.23008
bgti_else.23031:
	add	%v0, %zero, %v1
bgti_cont.23032:
	j	bgti_cont.23008
bgti_else.23029:
	addi	%v0, %v1, -30
bgti_cont.23030:
	j	bgti_cont.23008
bgti_else.23027:
	addi	%v0, %v1, -20
bgti_cont.23028:
	j	bgti_cont.23008
bgti_else.23025:
	addi	%v0, %v1, -10
bgti_cont.23026:
	j	bgti_cont.23008
bgti_else.23023:
	add	%v0, %zero, %v1
bgti_cont.23024:
	j	bgti_cont.23008
bgti_else.23021:
	addi	%v0, %v1, -30
bgti_cont.23022:
	j	bgti_cont.23008
bgti_else.23019:
	addi	%v0, %v1, -20
bgti_cont.23020:
	j	bgti_cont.23008
bgti_else.23017:
	addi	%v0, %v1, -10
bgti_cont.23018:
	j	bgti_cont.23008
bgti_else.23015:
	add	%v0, %zero, %v1
bgti_cont.23016:
	j	bgti_cont.23008
bgti_else.23013:
	addi	%v0, %v1, -30
bgti_cont.23014:
	j	bgti_cont.23008
bgti_else.23011:
	addi	%v0, %v1, -20
bgti_cont.23012:
	j	bgti_cont.23008
bgti_else.23009:
	addi	%v0, %v1, -10
bgti_cont.23010:
	j	bgti_cont.23008
bgti_else.23007:
	add	%v0, %zero, %v1
bgti_cont.23008:
	lw	%v1, 1(%sp)
	blt	%zero, %v1, bgt_else.23063
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.23063:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.23064
	blti	%v1, 20, bgti_else.23066
	blti	%v1, 30, bgti_else.23068
	blti	%v1, 40, bgti_else.23070
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.23072
	blti	%a0, 20, bgti_else.23074
	blti	%a0, 30, bgti_else.23076
	blti	%a0, 40, bgti_else.23078
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.23080
	blti	%a0, 20, bgti_else.23082
	blti	%a0, 30, bgti_else.23084
	blti	%a0, 40, bgti_else.23086
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2641
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.23065
bgti_else.23086:
	addi	%v0, %zero, 11
bgti_cont.23087:
	j	bgti_cont.23065
bgti_else.23084:
	addi	%v0, %zero, 10
bgti_cont.23085:
	j	bgti_cont.23065
bgti_else.23082:
	addi	%v0, %zero, 9
bgti_cont.23083:
	j	bgti_cont.23065
bgti_else.23080:
	addi	%v0, %zero, 8
bgti_cont.23081:
	j	bgti_cont.23065
bgti_else.23078:
	addi	%v0, %zero, 7
bgti_cont.23079:
	j	bgti_cont.23065
bgti_else.23076:
	addi	%v0, %zero, 6
bgti_cont.23077:
	j	bgti_cont.23065
bgti_else.23074:
	addi	%v0, %zero, 5
bgti_cont.23075:
	j	bgti_cont.23065
bgti_else.23072:
	addi	%v0, %zero, 4
bgti_cont.23073:
	j	bgti_cont.23065
bgti_else.23070:
	addi	%v0, %zero, 3
bgti_cont.23071:
	j	bgti_cont.23065
bgti_else.23068:
	addi	%v0, %zero, 2
bgti_cont.23069:
	j	bgti_cont.23065
bgti_else.23066:
	addi	%v0, %zero, 1
bgti_cont.23067:
	j	bgti_cont.23065
bgti_else.23064:
	addi	%v0, %zero, 0
bgti_cont.23065:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.23088
	blti	%v1, 20, bgti_else.23090
	blti	%v1, 30, bgti_else.23092
	blti	%v1, 40, bgti_else.23094
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23096
	blti	%v1, 20, bgti_else.23098
	blti	%v1, 30, bgti_else.23100
	blti	%v1, 40, bgti_else.23102
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23104
	blti	%v1, 20, bgti_else.23106
	blti	%v1, 30, bgti_else.23108
	blti	%v1, 40, bgti_else.23110
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23112
	blti	%v1, 20, bgti_else.23114
	blti	%v1, 30, bgti_else.23116
	blti	%v1, 40, bgti_else.23118
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23120
	blti	%v1, 20, bgti_else.23122
	blti	%v1, 30, bgti_else.23124
	blti	%v1, 40, bgti_else.23126
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23128
	blti	%v1, 20, bgti_else.23130
	blti	%v1, 30, bgti_else.23132
	blti	%v1, 40, bgti_else.23134
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23136
	blti	%v1, 20, bgti_else.23138
	blti	%v1, 30, bgti_else.23140
	blti	%v1, 40, bgti_else.23142
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2644
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.23089
bgti_else.23142:
	addi	%v0, %v1, -30
bgti_cont.23143:
	j	bgti_cont.23089
bgti_else.23140:
	addi	%v0, %v1, -20
bgti_cont.23141:
	j	bgti_cont.23089
bgti_else.23138:
	addi	%v0, %v1, -10
bgti_cont.23139:
	j	bgti_cont.23089
bgti_else.23136:
	add	%v0, %zero, %v1
bgti_cont.23137:
	j	bgti_cont.23089
bgti_else.23134:
	addi	%v0, %v1, -30
bgti_cont.23135:
	j	bgti_cont.23089
bgti_else.23132:
	addi	%v0, %v1, -20
bgti_cont.23133:
	j	bgti_cont.23089
bgti_else.23130:
	addi	%v0, %v1, -10
bgti_cont.23131:
	j	bgti_cont.23089
bgti_else.23128:
	add	%v0, %zero, %v1
bgti_cont.23129:
	j	bgti_cont.23089
bgti_else.23126:
	addi	%v0, %v1, -30
bgti_cont.23127:
	j	bgti_cont.23089
bgti_else.23124:
	addi	%v0, %v1, -20
bgti_cont.23125:
	j	bgti_cont.23089
bgti_else.23122:
	addi	%v0, %v1, -10
bgti_cont.23123:
	j	bgti_cont.23089
bgti_else.23120:
	add	%v0, %zero, %v1
bgti_cont.23121:
	j	bgti_cont.23089
bgti_else.23118:
	addi	%v0, %v1, -30
bgti_cont.23119:
	j	bgti_cont.23089
bgti_else.23116:
	addi	%v0, %v1, -20
bgti_cont.23117:
	j	bgti_cont.23089
bgti_else.23114:
	addi	%v0, %v1, -10
bgti_cont.23115:
	j	bgti_cont.23089
bgti_else.23112:
	add	%v0, %zero, %v1
bgti_cont.23113:
	j	bgti_cont.23089
bgti_else.23110:
	addi	%v0, %v1, -30
bgti_cont.23111:
	j	bgti_cont.23089
bgti_else.23108:
	addi	%v0, %v1, -20
bgti_cont.23109:
	j	bgti_cont.23089
bgti_else.23106:
	addi	%v0, %v1, -10
bgti_cont.23107:
	j	bgti_cont.23089
bgti_else.23104:
	add	%v0, %zero, %v1
bgti_cont.23105:
	j	bgti_cont.23089
bgti_else.23102:
	addi	%v0, %v1, -30
bgti_cont.23103:
	j	bgti_cont.23089
bgti_else.23100:
	addi	%v0, %v1, -20
bgti_cont.23101:
	j	bgti_cont.23089
bgti_else.23098:
	addi	%v0, %v1, -10
bgti_cont.23099:
	j	bgti_cont.23089
bgti_else.23096:
	add	%v0, %zero, %v1
bgti_cont.23097:
	j	bgti_cont.23089
bgti_else.23094:
	addi	%v0, %v1, -30
bgti_cont.23095:
	j	bgti_cont.23089
bgti_else.23092:
	addi	%v0, %v1, -20
bgti_cont.23093:
	j	bgti_cont.23089
bgti_else.23090:
	addi	%v0, %v1, -10
bgti_cont.23091:
	j	bgti_cont.23089
bgti_else.23088:
	add	%v0, %zero, %v1
bgti_cont.23089:
	lw	%v1, 3(%sp)
	blt	%zero, %v1, bgt_else.23144
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.23144:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.23145
	blti	%v1, 20, bgti_else.23147
	blti	%v1, 30, bgti_else.23149
	blti	%v1, 40, bgti_else.23151
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23153
	blti	%v1, 20, bgti_else.23155
	blti	%v1, 30, bgti_else.23157
	blti	%v1, 40, bgti_else.23159
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23161
	blti	%v1, 20, bgti_else.23163
	blti	%v1, 30, bgti_else.23165
	blti	%v1, 40, bgti_else.23167
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23169
	blti	%v1, 20, bgti_else.23171
	blti	%v1, 30, bgti_else.23173
	blti	%v1, 40, bgti_else.23175
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23177
	blti	%v1, 20, bgti_else.23179
	blti	%v1, 30, bgti_else.23181
	blti	%v1, 40, bgti_else.23183
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23185
	blti	%v1, 20, bgti_else.23187
	blti	%v1, 30, bgti_else.23189
	blti	%v1, 40, bgti_else.23191
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.23193
	blti	%v1, 20, bgti_else.23195
	blti	%v1, 30, bgti_else.23197
	blti	%v1, 40, bgti_else.23199
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2644
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.23146
bgti_else.23199:
	addi	%v0, %v1, -30
bgti_cont.23200:
	j	bgti_cont.23146
bgti_else.23197:
	addi	%v0, %v1, -20
bgti_cont.23198:
	j	bgti_cont.23146
bgti_else.23195:
	addi	%v0, %v1, -10
bgti_cont.23196:
	j	bgti_cont.23146
bgti_else.23193:
	add	%v0, %zero, %v1
bgti_cont.23194:
	j	bgti_cont.23146
bgti_else.23191:
	addi	%v0, %v1, -30
bgti_cont.23192:
	j	bgti_cont.23146
bgti_else.23189:
	addi	%v0, %v1, -20
bgti_cont.23190:
	j	bgti_cont.23146
bgti_else.23187:
	addi	%v0, %v1, -10
bgti_cont.23188:
	j	bgti_cont.23146
bgti_else.23185:
	add	%v0, %zero, %v1
bgti_cont.23186:
	j	bgti_cont.23146
bgti_else.23183:
	addi	%v0, %v1, -30
bgti_cont.23184:
	j	bgti_cont.23146
bgti_else.23181:
	addi	%v0, %v1, -20
bgti_cont.23182:
	j	bgti_cont.23146
bgti_else.23179:
	addi	%v0, %v1, -10
bgti_cont.23180:
	j	bgti_cont.23146
bgti_else.23177:
	add	%v0, %zero, %v1
bgti_cont.23178:
	j	bgti_cont.23146
bgti_else.23175:
	addi	%v0, %v1, -30
bgti_cont.23176:
	j	bgti_cont.23146
bgti_else.23173:
	addi	%v0, %v1, -20
bgti_cont.23174:
	j	bgti_cont.23146
bgti_else.23171:
	addi	%v0, %v1, -10
bgti_cont.23172:
	j	bgti_cont.23146
bgti_else.23169:
	add	%v0, %zero, %v1
bgti_cont.23170:
	j	bgti_cont.23146
bgti_else.23167:
	addi	%v0, %v1, -30
bgti_cont.23168:
	j	bgti_cont.23146
bgti_else.23165:
	addi	%v0, %v1, -20
bgti_cont.23166:
	j	bgti_cont.23146
bgti_else.23163:
	addi	%v0, %v1, -10
bgti_cont.23164:
	j	bgti_cont.23146
bgti_else.23161:
	add	%v0, %zero, %v1
bgti_cont.23162:
	j	bgti_cont.23146
bgti_else.23159:
	addi	%v0, %v1, -30
bgti_cont.23160:
	j	bgti_cont.23146
bgti_else.23157:
	addi	%v0, %v1, -20
bgti_cont.23158:
	j	bgti_cont.23146
bgti_else.23155:
	addi	%v0, %v1, -10
bgti_cont.23156:
	j	bgti_cont.23146
bgti_else.23153:
	add	%v0, %zero, %v1
bgti_cont.23154:
	j	bgti_cont.23146
bgti_else.23151:
	addi	%v0, %v1, -30
bgti_cont.23152:
	j	bgti_cont.23146
bgti_else.23149:
	addi	%v0, %v1, -20
bgti_cont.23150:
	j	bgti_cont.23146
bgti_else.23147:
	addi	%v0, %v1, -10
bgti_cont.23148:
	j	bgti_cont.23146
bgti_else.23145:
	add	%v0, %zero, %v1
bgti_cont.23146:
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
	fblt	%f3, %f4, fbgt_else.23780
	flw	%f5, 493(%zero)
	fblt	%f3, %f5, fbgt_else.23782
	flw	%f5, 492(%zero)
	fblt	%f3, %f5, fbgt_else.23784
	flw	%f5, 491(%zero)
	fblt	%f3, %f5, fbgt_else.23786
	flw	%f5, 490(%zero)
	fblt	%f3, %f5, fbgt_else.23788
	flw	%f5, 489(%zero)
	fblt	%f3, %f5, fbgt_else.23790
	flw	%f5, 488(%zero)
	fblt	%f3, %f5, fbgt_else.23792
	flw	%f5, 487(%zero)
	fblt	%f3, %f5, fbgt_else.23794
	flw	%f5, 486(%zero)
	fblt	%f3, %f5, fbgt_else.23796
	flw	%f5, 485(%zero)
	fblt	%f3, %f5, fbgt_else.23798
	flw	%f5, 484(%zero)
	fblt	%f3, %f5, fbgt_else.23800
	flw	%f5, 483(%zero)
	fblt	%f3, %f5, fbgt_else.23802
	flw	%f5, 482(%zero)
	fblt	%f3, %f5, fbgt_else.23804
	flw	%f5, 481(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	fbgt_cont.23781
fbgt_else.23804:
	fmov	%f0, %f5
fbgt_cont.23805:
	j	fbgt_cont.23781
fbgt_else.23802:
	fmov	%f0, %f5
fbgt_cont.23803:
	j	fbgt_cont.23781
fbgt_else.23800:
	fmov	%f0, %f5
fbgt_cont.23801:
	j	fbgt_cont.23781
fbgt_else.23798:
	fmov	%f0, %f5
fbgt_cont.23799:
	j	fbgt_cont.23781
fbgt_else.23796:
	fmov	%f0, %f5
fbgt_cont.23797:
	j	fbgt_cont.23781
fbgt_else.23794:
	fmov	%f0, %f5
fbgt_cont.23795:
	j	fbgt_cont.23781
fbgt_else.23792:
	fmov	%f0, %f5
fbgt_cont.23793:
	j	fbgt_cont.23781
fbgt_else.23790:
	fmov	%f0, %f5
fbgt_cont.23791:
	j	fbgt_cont.23781
fbgt_else.23788:
	fmov	%f0, %f5
fbgt_cont.23789:
	j	fbgt_cont.23781
fbgt_else.23786:
	fmov	%f0, %f5
fbgt_cont.23787:
	j	fbgt_cont.23781
fbgt_else.23784:
	fmov	%f0, %f5
fbgt_cont.23785:
	j	fbgt_cont.23781
fbgt_else.23782:
	fmov	%f0, %f5
fbgt_cont.23783:
	j	fbgt_cont.23781
fbgt_else.23780:
	fmov	%f0, %f4
fbgt_cont.23781:
	flw	%f1, 3(%sp)
	flw	%f2, 4(%sp)
	fblt	%f1, %f2, fbgt_else.23806
	fblt	%f1, %f0, fbgt_else.23808
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
	j	fbgt_cont.23807
fbgt_else.23808:
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
fbgt_cont.23809:
	j	fbgt_cont.23807
fbgt_else.23806:
	fmov	%f0, %f1
fbgt_cont.23807:
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.23810
	addi	%v0, %zero, 0
	j	fbgt_cont.23811
fbgt_else.23810:
	addi	%v0, %zero, 1
fbgt_cont.23811:
	fblt	%f0, %f1, fbgt_else.23812
	fsub	%f0, %f0, %f1
	j	fbgt_cont.23813
fbgt_else.23812:
fbgt_cont.23813:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.23814
	beqi	%v0, 0, bnei_else.23816
	addi	%v0, %zero, 0
	j	fbgt_cont.23815
bnei_else.23816:
	addi	%v0, %zero, 1
bnei_cont.23817:
	j	fbgt_cont.23815
fbgt_else.23814:
fbgt_cont.23815:
	fblt	%f0, %f2, fbgt_else.23818
	fsub	%f0, %f1, %f0
	j	fbgt_cont.23819
fbgt_else.23818:
fbgt_cont.23819:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.23820
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
	j	fbgt_cont.23821
fbgt_else.23820:
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
fbgt_cont.23821:
	beqi	%v0, 0, bnei_else.23822
	j	bnei_cont.23823
bnei_else.23822:
	fneg	%f0, %f0
bnei_cont.23823:
	flw	%f4, 470(%zero)
	flw	%f5, 1(%sp)
	fblt	%f5, %f4, fbgt_else.23824
	addi	%v0, %zero, 1
	j	fbgt_cont.23825
fbgt_else.23824:
	addi	%v0, %zero, 0
fbgt_cont.23825:
	fabs	%f5, %f5
	flw	%f6, 4(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f4, 6(%sp)
	fsw	%f3, 7(%sp)
	fsw	%f2, 8(%sp)
	sw	%v0, 9(%sp)
	fsw	%f5, 10(%sp)
	fblt	%f5, %f6, fbgt_else.23826
	flw	%f7, 493(%zero)
	fblt	%f5, %f7, fbgt_else.23828
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.23830
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.23832
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.23834
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.23836
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.23838
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.23840
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.23842
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.23844
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.23846
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.23848
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.23850
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	fbgt_cont.23827
fbgt_else.23850:
	fmov	%f0, %f7
fbgt_cont.23851:
	j	fbgt_cont.23827
fbgt_else.23848:
	fmov	%f0, %f7
fbgt_cont.23849:
	j	fbgt_cont.23827
fbgt_else.23846:
	fmov	%f0, %f7
fbgt_cont.23847:
	j	fbgt_cont.23827
fbgt_else.23844:
	fmov	%f0, %f7
fbgt_cont.23845:
	j	fbgt_cont.23827
fbgt_else.23842:
	fmov	%f0, %f7
fbgt_cont.23843:
	j	fbgt_cont.23827
fbgt_else.23840:
	fmov	%f0, %f7
fbgt_cont.23841:
	j	fbgt_cont.23827
fbgt_else.23838:
	fmov	%f0, %f7
fbgt_cont.23839:
	j	fbgt_cont.23827
fbgt_else.23836:
	fmov	%f0, %f7
fbgt_cont.23837:
	j	fbgt_cont.23827
fbgt_else.23834:
	fmov	%f0, %f7
fbgt_cont.23835:
	j	fbgt_cont.23827
fbgt_else.23832:
	fmov	%f0, %f7
fbgt_cont.23833:
	j	fbgt_cont.23827
fbgt_else.23830:
	fmov	%f0, %f7
fbgt_cont.23831:
	j	fbgt_cont.23827
fbgt_else.23828:
	fmov	%f0, %f7
fbgt_cont.23829:
	j	fbgt_cont.23827
fbgt_else.23826:
	fmov	%f0, %f6
fbgt_cont.23827:
	flw	%f1, 10(%sp)
	flw	%f2, 4(%sp)
	fblt	%f1, %f2, fbgt_else.23852
	fblt	%f1, %f0, fbgt_else.23854
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
	j	fbgt_cont.23853
fbgt_else.23854:
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
fbgt_cont.23855:
	j	fbgt_cont.23853
fbgt_else.23852:
	fmov	%f0, %f1
fbgt_cont.23853:
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.23856
	lw	%v0, 9(%sp)
	beqi	%v0, 0, bnei_else.23858
	addi	%v0, %zero, 0
	j	fbgt_cont.23857
bnei_else.23858:
	addi	%v0, %zero, 1
bnei_cont.23859:
	j	fbgt_cont.23857
fbgt_else.23856:
	lw	%v0, 9(%sp)
fbgt_cont.23857:
	fblt	%f0, %f1, fbgt_else.23860
	fsub	%f0, %f0, %f1
	j	fbgt_cont.23861
fbgt_else.23860:
fbgt_cont.23861:
	flw	%f2, 8(%sp)
	fblt	%f0, %f2, fbgt_else.23862
	fsub	%f0, %f1, %f0
	j	fbgt_cont.23863
fbgt_else.23862:
fbgt_cont.23863:
	flw	%f3, 7(%sp)
	fblt	%f3, %f0, fbgt_else.23864
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
	j	fbgt_cont.23865
fbgt_else.23864:
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
fbgt_cont.23865:
	beqi	%v0, 0, bnei_else.23866
	j	bnei_cont.23867
bnei_else.23866:
	fneg	%f0, %f0
bnei_cont.23867:
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
	fblt	%f1, %f2, fbgt_else.23868
	flw	%f3, 493(%zero)
	fblt	%f1, %f3, fbgt_else.23870
	flw	%f3, 492(%zero)
	fblt	%f1, %f3, fbgt_else.23872
	flw	%f3, 491(%zero)
	fblt	%f1, %f3, fbgt_else.23874
	flw	%f3, 490(%zero)
	fblt	%f1, %f3, fbgt_else.23876
	flw	%f3, 489(%zero)
	fblt	%f1, %f3, fbgt_else.23878
	flw	%f3, 488(%zero)
	fblt	%f1, %f3, fbgt_else.23880
	flw	%f3, 487(%zero)
	fblt	%f1, %f3, fbgt_else.23882
	flw	%f3, 486(%zero)
	fblt	%f1, %f3, fbgt_else.23884
	flw	%f3, 485(%zero)
	fblt	%f1, %f3, fbgt_else.23886
	flw	%f3, 484(%zero)
	fblt	%f1, %f3, fbgt_else.23888
	flw	%f3, 483(%zero)
	fblt	%f1, %f3, fbgt_else.23890
	flw	%f3, 482(%zero)
	fblt	%f1, %f3, fbgt_else.23892
	flw	%f3, 481(%zero)
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.23869
fbgt_else.23892:
	fmov	%f0, %f3
fbgt_cont.23893:
	j	fbgt_cont.23869
fbgt_else.23890:
	fmov	%f0, %f3
fbgt_cont.23891:
	j	fbgt_cont.23869
fbgt_else.23888:
	fmov	%f0, %f3
fbgt_cont.23889:
	j	fbgt_cont.23869
fbgt_else.23886:
	fmov	%f0, %f3
fbgt_cont.23887:
	j	fbgt_cont.23869
fbgt_else.23884:
	fmov	%f0, %f3
fbgt_cont.23885:
	j	fbgt_cont.23869
fbgt_else.23882:
	fmov	%f0, %f3
fbgt_cont.23883:
	j	fbgt_cont.23869
fbgt_else.23880:
	fmov	%f0, %f3
fbgt_cont.23881:
	j	fbgt_cont.23869
fbgt_else.23878:
	fmov	%f0, %f3
fbgt_cont.23879:
	j	fbgt_cont.23869
fbgt_else.23876:
	fmov	%f0, %f3
fbgt_cont.23877:
	j	fbgt_cont.23869
fbgt_else.23874:
	fmov	%f0, %f3
fbgt_cont.23875:
	j	fbgt_cont.23869
fbgt_else.23872:
	fmov	%f0, %f3
fbgt_cont.23873:
	j	fbgt_cont.23869
fbgt_else.23870:
	fmov	%f0, %f3
fbgt_cont.23871:
	j	fbgt_cont.23869
fbgt_else.23868:
	fmov	%f0, %f2
fbgt_cont.23869:
	flw	%f1, 13(%sp)
	flw	%f2, 4(%sp)
	fblt	%f1, %f2, fbgt_else.23894
	fblt	%f1, %f0, fbgt_else.23896
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
	j	fbgt_cont.23895
fbgt_else.23896:
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
fbgt_cont.23897:
	j	fbgt_cont.23895
fbgt_else.23894:
	fmov	%f0, %f1
fbgt_cont.23895:
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.23898
	addi	%v0, %zero, 0
	j	fbgt_cont.23899
fbgt_else.23898:
	addi	%v0, %zero, 1
fbgt_cont.23899:
	fblt	%f0, %f1, fbgt_else.23900
	fsub	%f0, %f0, %f1
	j	fbgt_cont.23901
fbgt_else.23900:
fbgt_cont.23901:
	flw	%f2, 8(%sp)
	fblt	%f0, %f2, fbgt_else.23902
	beqi	%v0, 0, bnei_else.23904
	addi	%v0, %zero, 0
	j	fbgt_cont.23903
bnei_else.23904:
	addi	%v0, %zero, 1
bnei_cont.23905:
	j	fbgt_cont.23903
fbgt_else.23902:
fbgt_cont.23903:
	fblt	%f0, %f2, fbgt_else.23906
	fsub	%f0, %f1, %f0
	j	fbgt_cont.23907
fbgt_else.23906:
fbgt_cont.23907:
	flw	%f3, 7(%sp)
	fblt	%f3, %f0, fbgt_else.23908
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
	j	fbgt_cont.23909
fbgt_else.23908:
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
fbgt_cont.23909:
	beqi	%v0, 0, bnei_else.23910
	j	bnei_cont.23911
bnei_else.23910:
	fneg	%f0, %f0
bnei_cont.23911:
	flw	%f4, 12(%sp)
	flw	%f5, 6(%sp)
	fblt	%f4, %f5, fbgt_else.23912
	addi	%v0, %zero, 1
	j	fbgt_cont.23913
fbgt_else.23912:
	addi	%v0, %zero, 0
fbgt_cont.23913:
	fabs	%f4, %f4
	flw	%f6, 4(%sp)
	fsw	%f0, 14(%sp)
	sw	%v0, 15(%sp)
	fsw	%f4, 16(%sp)
	fblt	%f4, %f6, fbgt_else.23914
	flw	%f7, 493(%zero)
	fblt	%f4, %f7, fbgt_else.23916
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.23918
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.23920
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.23922
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.23924
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.23926
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.23928
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.23930
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.23932
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.23934
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.23936
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.23938
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	fbgt_cont.23915
fbgt_else.23938:
	fmov	%f0, %f7
fbgt_cont.23939:
	j	fbgt_cont.23915
fbgt_else.23936:
	fmov	%f0, %f7
fbgt_cont.23937:
	j	fbgt_cont.23915
fbgt_else.23934:
	fmov	%f0, %f7
fbgt_cont.23935:
	j	fbgt_cont.23915
fbgt_else.23932:
	fmov	%f0, %f7
fbgt_cont.23933:
	j	fbgt_cont.23915
fbgt_else.23930:
	fmov	%f0, %f7
fbgt_cont.23931:
	j	fbgt_cont.23915
fbgt_else.23928:
	fmov	%f0, %f7
fbgt_cont.23929:
	j	fbgt_cont.23915
fbgt_else.23926:
	fmov	%f0, %f7
fbgt_cont.23927:
	j	fbgt_cont.23915
fbgt_else.23924:
	fmov	%f0, %f7
fbgt_cont.23925:
	j	fbgt_cont.23915
fbgt_else.23922:
	fmov	%f0, %f7
fbgt_cont.23923:
	j	fbgt_cont.23915
fbgt_else.23920:
	fmov	%f0, %f7
fbgt_cont.23921:
	j	fbgt_cont.23915
fbgt_else.23918:
	fmov	%f0, %f7
fbgt_cont.23919:
	j	fbgt_cont.23915
fbgt_else.23916:
	fmov	%f0, %f7
fbgt_cont.23917:
	j	fbgt_cont.23915
fbgt_else.23914:
	fmov	%f0, %f6
fbgt_cont.23915:
	flw	%f1, 16(%sp)
	flw	%f2, 4(%sp)
	fblt	%f1, %f2, fbgt_else.23940
	fblt	%f1, %f0, fbgt_else.23942
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
	j	fbgt_cont.23941
fbgt_else.23942:
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
fbgt_cont.23943:
	j	fbgt_cont.23941
fbgt_else.23940:
	fmov	%f0, %f1
fbgt_cont.23941:
	flw	%f1, 2(%sp)
	fblt	%f0, %f1, fbgt_else.23944
	lw	%v0, 15(%sp)
	beqi	%v0, 0, bnei_else.23946
	addi	%v0, %zero, 0
	j	fbgt_cont.23945
bnei_else.23946:
	addi	%v0, %zero, 1
bnei_cont.23947:
	j	fbgt_cont.23945
fbgt_else.23944:
	lw	%v0, 15(%sp)
fbgt_cont.23945:
	fblt	%f0, %f1, fbgt_else.23948
	fsub	%f0, %f0, %f1
	j	fbgt_cont.23949
fbgt_else.23948:
fbgt_cont.23949:
	flw	%f2, 8(%sp)
	fblt	%f0, %f2, fbgt_else.23950
	fsub	%f0, %f1, %f0
	j	fbgt_cont.23951
fbgt_else.23950:
fbgt_cont.23951:
	flw	%f1, 7(%sp)
	fblt	%f1, %f0, fbgt_else.23952
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
	j	fbgt_cont.23953
fbgt_else.23952:
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
fbgt_cont.23953:
	beqi	%v0, 0, bnei_else.23954
	j	bnei_cont.23955
bnei_else.23954:
	fneg	%f0, %f0
bnei_cont.23955:
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
	fblt	%f2, %f3, fbgt_else.25080
	flw	%f4, 493(%zero)
	fblt	%f2, %f4, fbgt_else.25082
	flw	%f4, 492(%zero)
	fblt	%f2, %f4, fbgt_else.25084
	flw	%f4, 491(%zero)
	fblt	%f2, %f4, fbgt_else.25086
	flw	%f4, 490(%zero)
	fblt	%f2, %f4, fbgt_else.25088
	flw	%f4, 489(%zero)
	fblt	%f2, %f4, fbgt_else.25090
	flw	%f4, 488(%zero)
	fblt	%f2, %f4, fbgt_else.25092
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.25094
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.25096
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.25098
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.25100
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.25102
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.25104
	flw	%f4, 481(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	fbgt_cont.25081
fbgt_else.25104:
	fmov	%f0, %f4
fbgt_cont.25105:
	j	fbgt_cont.25081
fbgt_else.25102:
	fmov	%f0, %f4
fbgt_cont.25103:
	j	fbgt_cont.25081
fbgt_else.25100:
	fmov	%f0, %f4
fbgt_cont.25101:
	j	fbgt_cont.25081
fbgt_else.25098:
	fmov	%f0, %f4
fbgt_cont.25099:
	j	fbgt_cont.25081
fbgt_else.25096:
	fmov	%f0, %f4
fbgt_cont.25097:
	j	fbgt_cont.25081
fbgt_else.25094:
	fmov	%f0, %f4
fbgt_cont.25095:
	j	fbgt_cont.25081
fbgt_else.25092:
	fmov	%f0, %f4
fbgt_cont.25093:
	j	fbgt_cont.25081
fbgt_else.25090:
	fmov	%f0, %f4
fbgt_cont.25091:
	j	fbgt_cont.25081
fbgt_else.25088:
	fmov	%f0, %f4
fbgt_cont.25089:
	j	fbgt_cont.25081
fbgt_else.25086:
	fmov	%f0, %f4
fbgt_cont.25087:
	j	fbgt_cont.25081
fbgt_else.25084:
	fmov	%f0, %f4
fbgt_cont.25085:
	j	fbgt_cont.25081
fbgt_else.25082:
	fmov	%f0, %f4
fbgt_cont.25083:
	j	fbgt_cont.25081
fbgt_else.25080:
	fmov	%f0, %f3
fbgt_cont.25081:
	flw	%f1, 4(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25106
	fblt	%f1, %f0, fbgt_else.25108
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
	j	fbgt_cont.25107
fbgt_else.25108:
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
fbgt_cont.25109:
	j	fbgt_cont.25107
fbgt_else.25106:
	fmov	%f0, %f1
fbgt_cont.25107:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25110
	addi	%v0, %zero, 0
	j	fbgt_cont.25111
fbgt_else.25110:
	addi	%v0, %zero, 1
fbgt_cont.25111:
	fblt	%f0, %f1, fbgt_else.25112
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25113
fbgt_else.25112:
fbgt_cont.25113:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.25114
	beqi	%v0, 0, bnei_else.25116
	addi	%v0, %zero, 0
	j	fbgt_cont.25115
bnei_else.25116:
	addi	%v0, %zero, 1
bnei_cont.25117:
	j	fbgt_cont.25115
fbgt_else.25114:
fbgt_cont.25115:
	fblt	%f0, %f2, fbgt_else.25118
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25119
fbgt_else.25118:
fbgt_cont.25119:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.25120
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
	j	fbgt_cont.25121
fbgt_else.25120:
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
fbgt_cont.25121:
	beqi	%v0, 0, bnei_else.25122
	j	bnei_cont.25123
bnei_else.25122:
	fneg	%f0, %f0
bnei_cont.25123:
	flw	%f4, 470(%zero)
	flw	%f5, 2(%sp)
	fblt	%f5, %f4, fbgt_else.25124
	addi	%v0, %zero, 1
	j	fbgt_cont.25125
fbgt_else.25124:
	addi	%v0, %zero, 0
fbgt_cont.25125:
	fabs	%f5, %f5
	flw	%f6, 5(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f4, 7(%sp)
	fsw	%f3, 8(%sp)
	fsw	%f2, 9(%sp)
	sw	%v0, 10(%sp)
	fsw	%f5, 11(%sp)
	fblt	%f5, %f6, fbgt_else.25126
	flw	%f7, 493(%zero)
	fblt	%f5, %f7, fbgt_else.25128
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.25130
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.25132
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.25134
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.25136
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.25138
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.25140
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.25142
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.25144
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.25146
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.25148
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.25150
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.25127
fbgt_else.25150:
	fmov	%f0, %f7
fbgt_cont.25151:
	j	fbgt_cont.25127
fbgt_else.25148:
	fmov	%f0, %f7
fbgt_cont.25149:
	j	fbgt_cont.25127
fbgt_else.25146:
	fmov	%f0, %f7
fbgt_cont.25147:
	j	fbgt_cont.25127
fbgt_else.25144:
	fmov	%f0, %f7
fbgt_cont.25145:
	j	fbgt_cont.25127
fbgt_else.25142:
	fmov	%f0, %f7
fbgt_cont.25143:
	j	fbgt_cont.25127
fbgt_else.25140:
	fmov	%f0, %f7
fbgt_cont.25141:
	j	fbgt_cont.25127
fbgt_else.25138:
	fmov	%f0, %f7
fbgt_cont.25139:
	j	fbgt_cont.25127
fbgt_else.25136:
	fmov	%f0, %f7
fbgt_cont.25137:
	j	fbgt_cont.25127
fbgt_else.25134:
	fmov	%f0, %f7
fbgt_cont.25135:
	j	fbgt_cont.25127
fbgt_else.25132:
	fmov	%f0, %f7
fbgt_cont.25133:
	j	fbgt_cont.25127
fbgt_else.25130:
	fmov	%f0, %f7
fbgt_cont.25131:
	j	fbgt_cont.25127
fbgt_else.25128:
	fmov	%f0, %f7
fbgt_cont.25129:
	j	fbgt_cont.25127
fbgt_else.25126:
	fmov	%f0, %f6
fbgt_cont.25127:
	flw	%f1, 11(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25152
	fblt	%f1, %f0, fbgt_else.25154
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
	j	fbgt_cont.25153
fbgt_else.25154:
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
fbgt_cont.25155:
	j	fbgt_cont.25153
fbgt_else.25152:
	fmov	%f0, %f1
fbgt_cont.25153:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25156
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.25158
	addi	%v0, %zero, 0
	j	fbgt_cont.25157
bnei_else.25158:
	addi	%v0, %zero, 1
bnei_cont.25159:
	j	fbgt_cont.25157
fbgt_else.25156:
	lw	%v0, 10(%sp)
fbgt_cont.25157:
	fblt	%f0, %f1, fbgt_else.25160
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25161
fbgt_else.25160:
fbgt_cont.25161:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25162
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25163
fbgt_else.25162:
fbgt_cont.25163:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.25164
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
	j	fbgt_cont.25165
fbgt_else.25164:
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
fbgt_cont.25165:
	beqi	%v0, 0, bnei_else.25166
	j	bnei_cont.25167
bnei_else.25166:
	fneg	%f0, %f0
bnei_cont.25167:
	lw	%v0, 1(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f4, 13(%sp)
	fsw	%f5, 14(%sp)
	fblt	%f5, %f6, fbgt_else.25168
	flw	%f7, 493(%zero)
	fblt	%f5, %f7, fbgt_else.25170
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.25172
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.25174
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.25176
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.25178
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.25180
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.25182
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.25184
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.25186
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.25188
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.25190
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.25192
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.25169
fbgt_else.25192:
	fmov	%f0, %f7
fbgt_cont.25193:
	j	fbgt_cont.25169
fbgt_else.25190:
	fmov	%f0, %f7
fbgt_cont.25191:
	j	fbgt_cont.25169
fbgt_else.25188:
	fmov	%f0, %f7
fbgt_cont.25189:
	j	fbgt_cont.25169
fbgt_else.25186:
	fmov	%f0, %f7
fbgt_cont.25187:
	j	fbgt_cont.25169
fbgt_else.25184:
	fmov	%f0, %f7
fbgt_cont.25185:
	j	fbgt_cont.25169
fbgt_else.25182:
	fmov	%f0, %f7
fbgt_cont.25183:
	j	fbgt_cont.25169
fbgt_else.25180:
	fmov	%f0, %f7
fbgt_cont.25181:
	j	fbgt_cont.25169
fbgt_else.25178:
	fmov	%f0, %f7
fbgt_cont.25179:
	j	fbgt_cont.25169
fbgt_else.25176:
	fmov	%f0, %f7
fbgt_cont.25177:
	j	fbgt_cont.25169
fbgt_else.25174:
	fmov	%f0, %f7
fbgt_cont.25175:
	j	fbgt_cont.25169
fbgt_else.25172:
	fmov	%f0, %f7
fbgt_cont.25173:
	j	fbgt_cont.25169
fbgt_else.25170:
	fmov	%f0, %f7
fbgt_cont.25171:
	j	fbgt_cont.25169
fbgt_else.25168:
	fmov	%f0, %f6
fbgt_cont.25169:
	flw	%f1, 14(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25194
	fblt	%f1, %f0, fbgt_else.25196
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
	j	fbgt_cont.25195
fbgt_else.25196:
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
fbgt_cont.25197:
	j	fbgt_cont.25195
fbgt_else.25194:
	fmov	%f0, %f1
fbgt_cont.25195:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25198
	addi	%v0, %zero, 0
	j	fbgt_cont.25199
fbgt_else.25198:
	addi	%v0, %zero, 1
fbgt_cont.25199:
	fblt	%f0, %f1, fbgt_else.25200
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25201
fbgt_else.25200:
fbgt_cont.25201:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25202
	beqi	%v0, 0, bnei_else.25204
	addi	%v0, %zero, 0
	j	fbgt_cont.25203
bnei_else.25204:
	addi	%v0, %zero, 1
bnei_cont.25205:
	j	fbgt_cont.25203
fbgt_else.25202:
fbgt_cont.25203:
	fblt	%f0, %f2, fbgt_else.25206
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25207
fbgt_else.25206:
fbgt_cont.25207:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.25208
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
	j	fbgt_cont.25209
fbgt_else.25208:
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
fbgt_cont.25209:
	beqi	%v0, 0, bnei_else.25210
	j	bnei_cont.25211
bnei_else.25210:
	fneg	%f0, %f0
bnei_cont.25211:
	flw	%f4, 13(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.25212
	addi	%v0, %zero, 1
	j	fbgt_cont.25213
fbgt_else.25212:
	addi	%v0, %zero, 0
fbgt_cont.25213:
	fabs	%f4, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 15(%sp)
	sw	%v0, 16(%sp)
	fsw	%f4, 17(%sp)
	fblt	%f4, %f6, fbgt_else.25214
	flw	%f7, 493(%zero)
	fblt	%f4, %f7, fbgt_else.25216
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.25218
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.25220
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.25222
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.25224
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.25226
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.25228
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.25230
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.25232
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.25234
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.25236
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.25238
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.25215
fbgt_else.25238:
	fmov	%f0, %f7
fbgt_cont.25239:
	j	fbgt_cont.25215
fbgt_else.25236:
	fmov	%f0, %f7
fbgt_cont.25237:
	j	fbgt_cont.25215
fbgt_else.25234:
	fmov	%f0, %f7
fbgt_cont.25235:
	j	fbgt_cont.25215
fbgt_else.25232:
	fmov	%f0, %f7
fbgt_cont.25233:
	j	fbgt_cont.25215
fbgt_else.25230:
	fmov	%f0, %f7
fbgt_cont.25231:
	j	fbgt_cont.25215
fbgt_else.25228:
	fmov	%f0, %f7
fbgt_cont.25229:
	j	fbgt_cont.25215
fbgt_else.25226:
	fmov	%f0, %f7
fbgt_cont.25227:
	j	fbgt_cont.25215
fbgt_else.25224:
	fmov	%f0, %f7
fbgt_cont.25225:
	j	fbgt_cont.25215
fbgt_else.25222:
	fmov	%f0, %f7
fbgt_cont.25223:
	j	fbgt_cont.25215
fbgt_else.25220:
	fmov	%f0, %f7
fbgt_cont.25221:
	j	fbgt_cont.25215
fbgt_else.25218:
	fmov	%f0, %f7
fbgt_cont.25219:
	j	fbgt_cont.25215
fbgt_else.25216:
	fmov	%f0, %f7
fbgt_cont.25217:
	j	fbgt_cont.25215
fbgt_else.25214:
	fmov	%f0, %f6
fbgt_cont.25215:
	flw	%f1, 17(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25240
	fblt	%f1, %f0, fbgt_else.25242
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
	j	fbgt_cont.25241
fbgt_else.25242:
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
fbgt_cont.25243:
	j	fbgt_cont.25241
fbgt_else.25240:
	fmov	%f0, %f1
fbgt_cont.25241:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25244
	lw	%v0, 16(%sp)
	beqi	%v0, 0, bnei_else.25246
	addi	%v0, %zero, 0
	j	fbgt_cont.25245
bnei_else.25246:
	addi	%v0, %zero, 1
bnei_cont.25247:
	j	fbgt_cont.25245
fbgt_else.25244:
	lw	%v0, 16(%sp)
fbgt_cont.25245:
	fblt	%f0, %f1, fbgt_else.25248
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25249
fbgt_else.25248:
fbgt_cont.25249:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25250
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25251
fbgt_else.25250:
fbgt_cont.25251:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.25252
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
	j	fbgt_cont.25253
fbgt_else.25252:
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
fbgt_cont.25253:
	beqi	%v0, 0, bnei_else.25254
	j	bnei_cont.25255
bnei_else.25254:
	fneg	%f0, %f0
bnei_cont.25255:
	lw	%v0, 1(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 18(%sp)
	fsw	%f4, 19(%sp)
	fsw	%f5, 20(%sp)
	fblt	%f5, %f6, fbgt_else.25256
	flw	%f7, 493(%zero)
	fblt	%f5, %f7, fbgt_else.25258
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.25260
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.25262
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.25264
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.25266
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.25268
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.25270
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.25272
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.25274
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.25276
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.25278
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.25280
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	fbgt_cont.25257
fbgt_else.25280:
	fmov	%f0, %f7
fbgt_cont.25281:
	j	fbgt_cont.25257
fbgt_else.25278:
	fmov	%f0, %f7
fbgt_cont.25279:
	j	fbgt_cont.25257
fbgt_else.25276:
	fmov	%f0, %f7
fbgt_cont.25277:
	j	fbgt_cont.25257
fbgt_else.25274:
	fmov	%f0, %f7
fbgt_cont.25275:
	j	fbgt_cont.25257
fbgt_else.25272:
	fmov	%f0, %f7
fbgt_cont.25273:
	j	fbgt_cont.25257
fbgt_else.25270:
	fmov	%f0, %f7
fbgt_cont.25271:
	j	fbgt_cont.25257
fbgt_else.25268:
	fmov	%f0, %f7
fbgt_cont.25269:
	j	fbgt_cont.25257
fbgt_else.25266:
	fmov	%f0, %f7
fbgt_cont.25267:
	j	fbgt_cont.25257
fbgt_else.25264:
	fmov	%f0, %f7
fbgt_cont.25265:
	j	fbgt_cont.25257
fbgt_else.25262:
	fmov	%f0, %f7
fbgt_cont.25263:
	j	fbgt_cont.25257
fbgt_else.25260:
	fmov	%f0, %f7
fbgt_cont.25261:
	j	fbgt_cont.25257
fbgt_else.25258:
	fmov	%f0, %f7
fbgt_cont.25259:
	j	fbgt_cont.25257
fbgt_else.25256:
	fmov	%f0, %f6
fbgt_cont.25257:
	flw	%f1, 20(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25282
	fblt	%f1, %f0, fbgt_else.25284
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
	j	fbgt_cont.25283
fbgt_else.25284:
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
fbgt_cont.25285:
	j	fbgt_cont.25283
fbgt_else.25282:
	fmov	%f0, %f1
fbgt_cont.25283:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25286
	addi	%v0, %zero, 0
	j	fbgt_cont.25287
fbgt_else.25286:
	addi	%v0, %zero, 1
fbgt_cont.25287:
	fblt	%f0, %f1, fbgt_else.25288
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25289
fbgt_else.25288:
fbgt_cont.25289:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25290
	beqi	%v0, 0, bnei_else.25292
	addi	%v0, %zero, 0
	j	fbgt_cont.25291
bnei_else.25292:
	addi	%v0, %zero, 1
bnei_cont.25293:
	j	fbgt_cont.25291
fbgt_else.25290:
fbgt_cont.25291:
	fblt	%f0, %f2, fbgt_else.25294
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25295
fbgt_else.25294:
fbgt_cont.25295:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.25296
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
	j	fbgt_cont.25297
fbgt_else.25296:
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
fbgt_cont.25297:
	beqi	%v0, 0, bnei_else.25298
	j	bnei_cont.25299
bnei_else.25298:
	fneg	%f0, %f0
bnei_cont.25299:
	flw	%f4, 19(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.25300
	addi	%v0, %zero, 1
	j	fbgt_cont.25301
fbgt_else.25300:
	addi	%v0, %zero, 0
fbgt_cont.25301:
	fabs	%f4, %f4
	flw	%f5, 5(%sp)
	fsw	%f0, 21(%sp)
	sw	%v0, 22(%sp)
	fsw	%f4, 23(%sp)
	fblt	%f4, %f5, fbgt_else.25302
	flw	%f6, 493(%zero)
	fblt	%f4, %f6, fbgt_else.25304
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.25306
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.25308
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.25310
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.25312
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.25314
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.25316
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.25318
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.25320
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.25322
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.25324
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.25326
	flw	%f6, 481(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.25303
fbgt_else.25326:
	fmov	%f0, %f6
fbgt_cont.25327:
	j	fbgt_cont.25303
fbgt_else.25324:
	fmov	%f0, %f6
fbgt_cont.25325:
	j	fbgt_cont.25303
fbgt_else.25322:
	fmov	%f0, %f6
fbgt_cont.25323:
	j	fbgt_cont.25303
fbgt_else.25320:
	fmov	%f0, %f6
fbgt_cont.25321:
	j	fbgt_cont.25303
fbgt_else.25318:
	fmov	%f0, %f6
fbgt_cont.25319:
	j	fbgt_cont.25303
fbgt_else.25316:
	fmov	%f0, %f6
fbgt_cont.25317:
	j	fbgt_cont.25303
fbgt_else.25314:
	fmov	%f0, %f6
fbgt_cont.25315:
	j	fbgt_cont.25303
fbgt_else.25312:
	fmov	%f0, %f6
fbgt_cont.25313:
	j	fbgt_cont.25303
fbgt_else.25310:
	fmov	%f0, %f6
fbgt_cont.25311:
	j	fbgt_cont.25303
fbgt_else.25308:
	fmov	%f0, %f6
fbgt_cont.25309:
	j	fbgt_cont.25303
fbgt_else.25306:
	fmov	%f0, %f6
fbgt_cont.25307:
	j	fbgt_cont.25303
fbgt_else.25304:
	fmov	%f0, %f6
fbgt_cont.25305:
	j	fbgt_cont.25303
fbgt_else.25302:
	fmov	%f0, %f5
fbgt_cont.25303:
	flw	%f1, 23(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.25328
	fblt	%f1, %f0, fbgt_else.25330
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
	j	fbgt_cont.25329
fbgt_else.25330:
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
fbgt_cont.25331:
	j	fbgt_cont.25329
fbgt_else.25328:
	fmov	%f0, %f1
fbgt_cont.25329:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.25332
	lw	%v0, 22(%sp)
	beqi	%v0, 0, bnei_else.25334
	addi	%v0, %zero, 0
	j	fbgt_cont.25333
bnei_else.25334:
	addi	%v0, %zero, 1
bnei_cont.25335:
	j	fbgt_cont.25333
fbgt_else.25332:
	lw	%v0, 22(%sp)
fbgt_cont.25333:
	fblt	%f0, %f1, fbgt_else.25336
	fsub	%f0, %f0, %f1
	j	fbgt_cont.25337
fbgt_else.25336:
fbgt_cont.25337:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.25338
	fsub	%f0, %f1, %f0
	j	fbgt_cont.25339
fbgt_else.25338:
fbgt_cont.25339:
	flw	%f1, 8(%sp)
	fblt	%f1, %f0, fbgt_else.25340
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
	j	fbgt_cont.25341
fbgt_else.25340:
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
fbgt_cont.25341:
	beqi	%v0, 0, bnei_else.25342
	j	bnei_cont.25343
bnei_else.25342:
	fneg	%f0, %f0
bnei_cont.25343:
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
	beqi	%v0, -1, bnei_else.25391
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
	fblt	%f0, %f1, fbgt_else.25392
	addi	%v0, %zero, 0
	j	fbgt_cont.25393
fbgt_else.25392:
	addi	%v0, %zero, 1
fbgt_cont.25393:
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
	beqi	%v1, 0, bnei_else.25394
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
	j	bnei_cont.25395
bnei_else.25394:
bnei_cont.25395:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.25396
	lw	%a0, 10(%sp)
	j	bnei_cont.25397
bnei_else.25396:
	addi	%a0, %zero, 1
bnei_cont.25397:
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
	beqi	%a2, 3, bnei_else.25398
	beqi	%a2, 2, bnei_else.25400
	j	bnei_cont.25399
bnei_else.25400:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.25402
	addi	%v1, %zero, 0
	j	bnei_cont.25403
bnei_else.25402:
	addi	%v1, %zero, 1
bnei_cont.25403:
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
	fbne	%f1, %f4, fbeq_else.25404
	addi	%a2, %zero, 1
	j	fbeq_cont.25405
fbeq_else.25404:
	addi	%a2, %zero, 0
fbeq_cont.25405:
	beqi	%a2, 0, bnei_else.25406
	flw	%f1, 474(%zero)
	j	bnei_cont.25407
bnei_else.25406:
	beqi	%v1, 0, bnei_else.25408
	flw	%f4, 458(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.25409
bnei_else.25408:
	flw	%f4, 474(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.25409:
bnei_cont.25407:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.25401:
	j	bnei_cont.25399
bnei_else.25398:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.25410
	addi	%v1, %zero, 1
	j	fbeq_cont.25411
fbeq_else.25410:
	addi	%v1, %zero, 0
fbeq_cont.25411:
	beqi	%v1, 0, bnei_else.25412
	fmov	%f0, %f1
	j	bnei_cont.25413
bnei_else.25412:
	fbne	%f0, %f1, fbeq_else.25414
	addi	%v1, %zero, 1
	j	fbeq_cont.25415
fbeq_else.25414:
	addi	%v1, %zero, 0
fbeq_cont.25415:
	beqi	%v1, 0, bnei_else.25416
	fmov	%f2, %f1
	j	bnei_cont.25417
bnei_else.25416:
	fblt	%f1, %f0, fbgt_else.25418
	addi	%v1, %zero, 0
	j	fbgt_cont.25419
fbgt_else.25418:
	addi	%v1, %zero, 1
fbgt_cont.25419:
	beqi	%v1, 0, bnei_else.25420
	flw	%f2, 474(%zero)
	j	bnei_cont.25421
bnei_else.25420:
	flw	%f2, 458(%zero)
bnei_cont.25421:
bnei_cont.25417:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.25413:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.25422
	addi	%v1, %zero, 1
	j	fbeq_cont.25423
fbeq_else.25422:
	addi	%v1, %zero, 0
fbeq_cont.25423:
	beqi	%v1, 0, bnei_else.25424
	fmov	%f0, %f1
	j	bnei_cont.25425
bnei_else.25424:
	fbne	%f0, %f1, fbeq_else.25426
	addi	%v1, %zero, 1
	j	fbeq_cont.25427
fbeq_else.25426:
	addi	%v1, %zero, 0
fbeq_cont.25427:
	beqi	%v1, 0, bnei_else.25428
	fmov	%f2, %f1
	j	bnei_cont.25429
bnei_else.25428:
	fblt	%f1, %f0, fbgt_else.25430
	addi	%v1, %zero, 0
	j	fbgt_cont.25431
fbgt_else.25430:
	addi	%v1, %zero, 1
fbgt_cont.25431:
	beqi	%v1, 0, bnei_else.25432
	flw	%f2, 474(%zero)
	j	bnei_cont.25433
bnei_else.25432:
	flw	%f2, 458(%zero)
bnei_cont.25433:
bnei_cont.25429:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.25425:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.25434
	addi	%v1, %zero, 1
	j	fbeq_cont.25435
fbeq_else.25434:
	addi	%v1, %zero, 0
fbeq_cont.25435:
	beqi	%v1, 0, bnei_else.25436
	fmov	%f0, %f1
	j	bnei_cont.25437
bnei_else.25436:
	fbne	%f0, %f1, fbeq_else.25438
	addi	%v1, %zero, 1
	j	fbeq_cont.25439
fbeq_else.25438:
	addi	%v1, %zero, 0
fbeq_cont.25439:
	beqi	%v1, 0, bnei_else.25440
	j	bnei_cont.25441
bnei_else.25440:
	fblt	%f1, %f0, fbgt_else.25442
	addi	%v1, %zero, 0
	j	fbgt_cont.25443
fbgt_else.25442:
	addi	%v1, %zero, 1
fbgt_cont.25443:
	beqi	%v1, 0, bnei_else.25444
	flw	%f1, 474(%zero)
	j	bnei_cont.25445
bnei_else.25444:
	flw	%f1, 458(%zero)
bnei_cont.25445:
bnei_cont.25441:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.25437:
	fsw	%f0, 2(%a0)
bnei_cont.25399:
	beqi	%a1, 0, bnei_else.25446
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2779
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.25447
bnei_else.25446:
bnei_cont.25447:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25391:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2784:
	blti	%v0, 60, bgti_else.25457
	jr	%ra
bgti_else.25457:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2782
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.25459
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25460
	jr	%ra
bgti_else.25460:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2782
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.25462
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25463
	jr	%ra
bgti_else.25463:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2782
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.25465
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25466
	jr	%ra
bgti_else.25466:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2782
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.25468
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25469
	jr	%ra
bgti_else.25469:
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_nth_object.2782
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.25471
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25472
	jr	%ra
bgti_else.25472:
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_nth_object.2782
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.25474
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25475
	jr	%ra
bgti_else.25475:
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	read_nth_object.2782
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.25477
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.25478
	jr	%ra
bgti_else.25478:
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	read_nth_object.2782
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.25480
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	j	read_object.2784
bnei_else.25480:
	lw	%v0, 7(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25477:
	lw	%v0, 6(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25474:
	lw	%v0, 5(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25471:
	lw	%v0, 4(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25468:
	lw	%v0, 3(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25465:
	lw	%v0, 2(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25462:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.25459:
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
	beqi	%v0, -1, bnei_else.25502
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
	beqi	%v0, -1, bnei_else.25503
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.25505
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.25507
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
	j	bnei_cont.25508
bnei_else.25507:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.25508:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.25506
bnei_else.25505:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.25506:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.25504
bnei_else.25503:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.25504:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.25502:
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
	beqi	%v0, -1, bnei_else.25526
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.25528
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.25530
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
	j	bnei_cont.25531
bnei_else.25530:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.25531:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.25529
bnei_else.25528:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.25529:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.25527
bnei_else.25526:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.25527:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.25532
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
	beqi	%v0, -1, bnei_else.25533
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.25535
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
	j	bnei_cont.25536
bnei_else.25535:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.25536:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.25534
bnei_else.25533:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.25534:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.25537
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
	j	bnei_cont.25538
bnei_else.25537:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.25538:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.25532:
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
	beqi	%v0, -1, bnei_else.25560
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.25562
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.25564
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
	j	bnei_cont.25565
bnei_else.25564:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.25565:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.25563
bnei_else.25562:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.25563:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.25561
bnei_else.25560:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.25561:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.25566
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
	beqi	%v0, -1, bnei_else.25567
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.25569
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
	j	bnei_cont.25570
bnei_else.25569:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.25570:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.25568
bnei_else.25567:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.25568:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.25571
	lw	%v1, 6(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, -1, bnei_else.25572
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
	j	bnei_cont.25573
bnei_else.25572:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.25573:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.25574
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
	beqi	%v1, -1, bnei_else.25575
	lw	%v1, 12(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	j	read_and_network.2792
bnei_else.25575:
	jr	%ra
bnei_else.25574:
	jr	%ra
bnei_else.25571:
	jr	%ra
bnei_else.25566:
	jr	%ra
solver_rect.2805:
	flw	%f3, 0(%v1)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.25580
	addi	%a0, %zero, 1
	j	fbeq_cont.25581
fbeq_else.25580:
	addi	%a0, %zero, 0
fbeq_cont.25581:
	beqi	%a0, 0, bnei_else.25582
	addi	%a0, %zero, 0
	j	bnei_cont.25583
bnei_else.25582:
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f3, %f4, fbgt_else.25584
	addi	%a2, %zero, 0
	j	fbgt_cont.25585
fbgt_else.25584:
	addi	%a2, %zero, 1
fbgt_cont.25585:
	beqi	%a1, 0, bnei_else.25586
	beqi	%a2, 0, bnei_else.25588
	addi	%a1, %zero, 0
	j	bnei_cont.25587
bnei_else.25588:
	addi	%a1, %zero, 1
bnei_cont.25589:
	j	bnei_cont.25587
bnei_else.25586:
	add	%a1, %zero, %a2
bnei_cont.25587:
	flw	%f5, 0(%a0)
	beqi	%a1, 0, bnei_else.25590
	j	bnei_cont.25591
bnei_else.25590:
	fneg	%f5, %f5
bnei_cont.25591:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%v1)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%a0)
	fblt	%f6, %f7, fbgt_else.25592
	addi	%a1, %zero, 0
	j	fbgt_cont.25593
fbgt_else.25592:
	addi	%a1, %zero, 1
fbgt_cont.25593:
	beqi	%a1, 0, bnei_else.25594
	flw	%f6, 2(%v1)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%a0)
	fblt	%f6, %f7, fbgt_else.25596
	addi	%a0, %zero, 0
	j	fbgt_cont.25597
fbgt_else.25596:
	addi	%a0, %zero, 1
fbgt_cont.25597:
	beqi	%a0, 0, bnei_else.25598
	fsw	%f5, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.25595
bnei_else.25598:
	addi	%a0, %zero, 0
bnei_cont.25599:
	j	bnei_cont.25595
bnei_else.25594:
	addi	%a0, %zero, 0
bnei_cont.25595:
bnei_cont.25583:
	beqi	%a0, 0, bnei_else.25600
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25600:
	flw	%f5, 1(%v1)
	fbne	%f5, %f4, fbeq_else.25601
	addi	%a0, %zero, 1
	j	fbeq_cont.25602
fbeq_else.25601:
	addi	%a0, %zero, 0
fbeq_cont.25602:
	beqi	%a0, 0, bnei_else.25603
	addi	%a0, %zero, 0
	j	bnei_cont.25604
bnei_else.25603:
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f5, %f4, fbgt_else.25605
	addi	%a2, %zero, 0
	j	fbgt_cont.25606
fbgt_else.25605:
	addi	%a2, %zero, 1
fbgt_cont.25606:
	beqi	%a1, 0, bnei_else.25607
	beqi	%a2, 0, bnei_else.25609
	addi	%a1, %zero, 0
	j	bnei_cont.25608
bnei_else.25609:
	addi	%a1, %zero, 1
bnei_cont.25610:
	j	bnei_cont.25608
bnei_else.25607:
	add	%a1, %zero, %a2
bnei_cont.25608:
	flw	%f6, 1(%a0)
	beqi	%a1, 0, bnei_else.25611
	j	bnei_cont.25612
bnei_else.25611:
	fneg	%f6, %f6
bnei_cont.25612:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%v1)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%a0)
	fblt	%f7, %f8, fbgt_else.25613
	addi	%a1, %zero, 0
	j	fbgt_cont.25614
fbgt_else.25613:
	addi	%a1, %zero, 1
fbgt_cont.25614:
	beqi	%a1, 0, bnei_else.25615
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%a0)
	fblt	%f7, %f8, fbgt_else.25617
	addi	%a0, %zero, 0
	j	fbgt_cont.25618
fbgt_else.25617:
	addi	%a0, %zero, 1
fbgt_cont.25618:
	beqi	%a0, 0, bnei_else.25619
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.25616
bnei_else.25619:
	addi	%a0, %zero, 0
bnei_cont.25620:
	j	bnei_cont.25616
bnei_else.25615:
	addi	%a0, %zero, 0
bnei_cont.25616:
bnei_cont.25604:
	beqi	%a0, 0, bnei_else.25621
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.25621:
	flw	%f6, 2(%v1)
	fbne	%f6, %f4, fbeq_else.25622
	addi	%v1, %zero, 1
	j	fbeq_cont.25623
fbeq_else.25622:
	addi	%v1, %zero, 0
fbeq_cont.25623:
	beqi	%v1, 0, bnei_else.25624
	addi	%v0, %zero, 0
	j	bnei_cont.25625
bnei_else.25624:
	lw	%v1, 4(%v0)
	lw	%v0, 6(%v0)
	fblt	%f6, %f4, fbgt_else.25626
	addi	%a0, %zero, 0
	j	fbgt_cont.25627
fbgt_else.25626:
	addi	%a0, %zero, 1
fbgt_cont.25627:
	beqi	%v0, 0, bnei_else.25628
	beqi	%a0, 0, bnei_else.25630
	addi	%v0, %zero, 0
	j	bnei_cont.25629
bnei_else.25630:
	addi	%v0, %zero, 1
bnei_cont.25631:
	j	bnei_cont.25629
bnei_else.25628:
	add	%v0, %zero, %a0
bnei_cont.25629:
	flw	%f4, 2(%v1)
	beqi	%v0, 0, bnei_else.25632
	j	bnei_cont.25633
bnei_else.25632:
	fneg	%f4, %f4
bnei_cont.25633:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.25634
	addi	%v0, %zero, 0
	j	fbgt_cont.25635
fbgt_else.25634:
	addi	%v0, %zero, 1
fbgt_cont.25635:
	beqi	%v0, 0, bnei_else.25636
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.25638
	addi	%v0, %zero, 0
	j	fbgt_cont.25639
fbgt_else.25638:
	addi	%v0, %zero, 1
fbgt_cont.25639:
	beqi	%v0, 0, bnei_else.25640
	fsw	%f2, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.25637
bnei_else.25640:
	addi	%v0, %zero, 0
bnei_cont.25641:
	j	bnei_cont.25637
bnei_else.25636:
	addi	%v0, %zero, 0
bnei_cont.25637:
bnei_cont.25625:
	beqi	%v0, 0, bnei_else.25642
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.25642:
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
	beqi	%v1, 0, bnei_else.25643
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
	j	bnei_cont.25644
bnei_else.25643:
bnei_cont.25644:
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.25645
	addi	%v1, %zero, 1
	j	fbeq_cont.25646
fbeq_else.25645:
	addi	%v1, %zero, 0
fbeq_cont.25646:
	beqi	%v1, 0, bnei_else.25647
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25647:
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
	beqi	%v1, 0, bnei_else.25648
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
	j	bnei_cont.25649
bnei_else.25648:
	fmov	%f3, %f8
bnei_cont.25649:
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
	beqi	%v1, 0, bnei_else.25650
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
	j	bnei_cont.25651
bnei_else.25650:
	fmov	%f0, %f4
bnei_cont.25651:
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.25652
	j	bnei_cont.25653
bnei_else.25652:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.25653:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.25654
	addi	%v1, %zero, 0
	j	fbgt_cont.25655
fbgt_else.25654:
	addi	%v1, %zero, 1
fbgt_cont.25655:
	beqi	%v1, 0, bnei_else.25656
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.25657
	j	bnei_cont.25658
bnei_else.25657:
	fneg	%f0, %f0
bnei_cont.25658:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25656:
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
	beqi	%a0, 1, bnei_else.25659
	beqi	%a0, 2, bnei_else.25660
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
	beqi	%v1, 0, bnei_else.25661
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
	j	bnei_cont.25662
bnei_else.25661:
bnei_cont.25662:
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.25663
	addi	%v1, %zero, 1
	j	fbeq_cont.25664
fbeq_else.25663:
	addi	%v1, %zero, 0
fbeq_cont.25664:
	beqi	%v1, 0, bnei_else.25665
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25665:
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
	beqi	%v1, 0, bnei_else.25666
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
	j	bnei_cont.25667
bnei_else.25666:
	fmov	%f3, %f8
bnei_cont.25667:
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
	beqi	%v1, 0, bnei_else.25668
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
	j	bnei_cont.25669
bnei_else.25668:
	fmov	%f0, %f4
bnei_cont.25669:
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.25670
	j	bnei_cont.25671
bnei_else.25670:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.25671:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.25672
	addi	%v1, %zero, 0
	j	fbgt_cont.25673
fbgt_else.25672:
	addi	%v1, %zero, 1
fbgt_cont.25673:
	beqi	%v1, 0, bnei_else.25674
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.25675
	j	bnei_cont.25676
bnei_else.25675:
	fneg	%f0, %f0
bnei_cont.25676:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25674:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25660:
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
	fblt	%f5, %f3, fbgt_else.25677
	addi	%v0, %zero, 0
	j	fbgt_cont.25678
fbgt_else.25677:
	addi	%v0, %zero, 1
fbgt_cont.25678:
	beqi	%v0, 0, bnei_else.25679
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
bnei_else.25679:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25659:
	flw	%f3, 0(%v1)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.25680
	addi	%a0, %zero, 1
	j	fbeq_cont.25681
fbeq_else.25680:
	addi	%a0, %zero, 0
fbeq_cont.25681:
	beqi	%a0, 0, bnei_else.25682
	addi	%a0, %zero, 0
	j	bnei_cont.25683
bnei_else.25682:
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f3, %f4, fbgt_else.25684
	addi	%a2, %zero, 0
	j	fbgt_cont.25685
fbgt_else.25684:
	addi	%a2, %zero, 1
fbgt_cont.25685:
	beqi	%a1, 0, bnei_else.25686
	beqi	%a2, 0, bnei_else.25688
	addi	%a1, %zero, 0
	j	bnei_cont.25687
bnei_else.25688:
	addi	%a1, %zero, 1
bnei_cont.25689:
	j	bnei_cont.25687
bnei_else.25686:
	add	%a1, %zero, %a2
bnei_cont.25687:
	flw	%f5, 0(%a0)
	beqi	%a1, 0, bnei_else.25690
	j	bnei_cont.25691
bnei_else.25690:
	fneg	%f5, %f5
bnei_cont.25691:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%v1)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%a0)
	fblt	%f6, %f7, fbgt_else.25692
	addi	%a1, %zero, 0
	j	fbgt_cont.25693
fbgt_else.25692:
	addi	%a1, %zero, 1
fbgt_cont.25693:
	beqi	%a1, 0, bnei_else.25694
	flw	%f6, 2(%v1)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%a0)
	fblt	%f6, %f7, fbgt_else.25696
	addi	%a0, %zero, 0
	j	fbgt_cont.25697
fbgt_else.25696:
	addi	%a0, %zero, 1
fbgt_cont.25697:
	beqi	%a0, 0, bnei_else.25698
	fsw	%f5, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.25695
bnei_else.25698:
	addi	%a0, %zero, 0
bnei_cont.25699:
	j	bnei_cont.25695
bnei_else.25694:
	addi	%a0, %zero, 0
bnei_cont.25695:
bnei_cont.25683:
	beqi	%a0, 0, bnei_else.25700
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25700:
	flw	%f5, 1(%v1)
	fbne	%f5, %f4, fbeq_else.25701
	addi	%a0, %zero, 1
	j	fbeq_cont.25702
fbeq_else.25701:
	addi	%a0, %zero, 0
fbeq_cont.25702:
	beqi	%a0, 0, bnei_else.25703
	addi	%a0, %zero, 0
	j	bnei_cont.25704
bnei_else.25703:
	lw	%a0, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f5, %f4, fbgt_else.25705
	addi	%a2, %zero, 0
	j	fbgt_cont.25706
fbgt_else.25705:
	addi	%a2, %zero, 1
fbgt_cont.25706:
	beqi	%a1, 0, bnei_else.25707
	beqi	%a2, 0, bnei_else.25709
	addi	%a1, %zero, 0
	j	bnei_cont.25708
bnei_else.25709:
	addi	%a1, %zero, 1
bnei_cont.25710:
	j	bnei_cont.25708
bnei_else.25707:
	add	%a1, %zero, %a2
bnei_cont.25708:
	flw	%f6, 1(%a0)
	beqi	%a1, 0, bnei_else.25711
	j	bnei_cont.25712
bnei_else.25711:
	fneg	%f6, %f6
bnei_cont.25712:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%v1)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%a0)
	fblt	%f7, %f8, fbgt_else.25713
	addi	%a1, %zero, 0
	j	fbgt_cont.25714
fbgt_else.25713:
	addi	%a1, %zero, 1
fbgt_cont.25714:
	beqi	%a1, 0, bnei_else.25715
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%a0)
	fblt	%f7, %f8, fbgt_else.25717
	addi	%a0, %zero, 0
	j	fbgt_cont.25718
fbgt_else.25717:
	addi	%a0, %zero, 1
fbgt_cont.25718:
	beqi	%a0, 0, bnei_else.25719
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.25716
bnei_else.25719:
	addi	%a0, %zero, 0
bnei_cont.25720:
	j	bnei_cont.25716
bnei_else.25715:
	addi	%a0, %zero, 0
bnei_cont.25716:
bnei_cont.25704:
	beqi	%a0, 0, bnei_else.25721
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.25721:
	flw	%f6, 2(%v1)
	fbne	%f6, %f4, fbeq_else.25722
	addi	%v1, %zero, 1
	j	fbeq_cont.25723
fbeq_else.25722:
	addi	%v1, %zero, 0
fbeq_cont.25723:
	beqi	%v1, 0, bnei_else.25724
	addi	%v0, %zero, 0
	j	bnei_cont.25725
bnei_else.25724:
	lw	%v1, 4(%v0)
	lw	%v0, 6(%v0)
	fblt	%f6, %f4, fbgt_else.25726
	addi	%a0, %zero, 0
	j	fbgt_cont.25727
fbgt_else.25726:
	addi	%a0, %zero, 1
fbgt_cont.25727:
	beqi	%v0, 0, bnei_else.25728
	beqi	%a0, 0, bnei_else.25730
	addi	%v0, %zero, 0
	j	bnei_cont.25729
bnei_else.25730:
	addi	%v0, %zero, 1
bnei_cont.25731:
	j	bnei_cont.25729
bnei_else.25728:
	add	%v0, %zero, %a0
bnei_cont.25729:
	flw	%f4, 2(%v1)
	beqi	%v0, 0, bnei_else.25732
	j	bnei_cont.25733
bnei_else.25732:
	fneg	%f4, %f4
bnei_cont.25733:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.25734
	addi	%v0, %zero, 0
	j	fbgt_cont.25735
fbgt_else.25734:
	addi	%v0, %zero, 1
fbgt_cont.25735:
	beqi	%v0, 0, bnei_else.25736
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.25738
	addi	%v0, %zero, 0
	j	fbgt_cont.25739
fbgt_else.25738:
	addi	%v0, %zero, 1
fbgt_cont.25739:
	beqi	%v0, 0, bnei_else.25740
	fsw	%f2, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.25737
bnei_else.25740:
	addi	%v0, %zero, 0
bnei_cont.25741:
	j	bnei_cont.25737
bnei_else.25736:
	addi	%v0, %zero, 0
bnei_cont.25737:
bnei_cont.25725:
	beqi	%v0, 0, bnei_else.25742
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.25742:
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
	fblt	%f6, %f7, fbgt_else.25743
	addi	%a1, %zero, 0
	j	fbgt_cont.25744
fbgt_else.25743:
	addi	%a1, %zero, 1
fbgt_cont.25744:
	beqi	%a1, 0, bnei_else.25745
	flw	%f6, 2(%v1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%a1, 4(%v0)
	flw	%f7, 2(%a1)
	fblt	%f6, %f7, fbgt_else.25747
	addi	%a1, %zero, 0
	j	fbgt_cont.25748
fbgt_else.25747:
	addi	%a1, %zero, 1
fbgt_cont.25748:
	beqi	%a1, 0, bnei_else.25749
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.25751
	addi	%a1, %zero, 1
	j	fbeq_cont.25752
fbeq_else.25751:
	addi	%a1, %zero, 0
fbeq_cont.25752:
	beqi	%a1, 0, bnei_else.25753
	addi	%a1, %zero, 0
	j	bnei_cont.25746
bnei_else.25753:
	addi	%a1, %zero, 1
bnei_cont.25754:
	j	bnei_cont.25746
bnei_else.25749:
	addi	%a1, %zero, 0
bnei_cont.25750:
	j	bnei_cont.25746
bnei_else.25745:
	addi	%a1, %zero, 0
bnei_cont.25746:
	beqi	%a1, 0, bnei_else.25755
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25755:
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
	fblt	%f7, %f8, fbgt_else.25756
	addi	%a1, %zero, 0
	j	fbgt_cont.25757
fbgt_else.25756:
	addi	%a1, %zero, 1
fbgt_cont.25757:
	beqi	%a1, 0, bnei_else.25758
	flw	%f7, 2(%v1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fblt	%f7, %f8, fbgt_else.25760
	addi	%v1, %zero, 0
	j	fbgt_cont.25761
fbgt_else.25760:
	addi	%v1, %zero, 1
fbgt_cont.25761:
	beqi	%v1, 0, bnei_else.25762
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.25764
	addi	%v1, %zero, 1
	j	fbeq_cont.25765
fbeq_else.25764:
	addi	%v1, %zero, 0
fbeq_cont.25765:
	beqi	%v1, 0, bnei_else.25766
	addi	%v1, %zero, 0
	j	bnei_cont.25759
bnei_else.25766:
	addi	%v1, %zero, 1
bnei_cont.25767:
	j	bnei_cont.25759
bnei_else.25762:
	addi	%v1, %zero, 0
bnei_cont.25763:
	j	bnei_cont.25759
bnei_else.25758:
	addi	%v1, %zero, 0
bnei_cont.25759:
	beqi	%v1, 0, bnei_else.25768
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.25768:
	flw	%f3, 4(%a0)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a0)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f4, 0(%v1)
	fblt	%f0, %f4, fbgt_else.25769
	addi	%v1, %zero, 0
	j	fbgt_cont.25770
fbgt_else.25769:
	addi	%v1, %zero, 1
fbgt_cont.25770:
	beqi	%v1, 0, bnei_else.25771
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%v0, 4(%v0)
	flw	%f1, 1(%v0)
	fblt	%f0, %f1, fbgt_else.25773
	addi	%v0, %zero, 0
	j	fbgt_cont.25774
fbgt_else.25773:
	addi	%v0, %zero, 1
fbgt_cont.25774:
	beqi	%v0, 0, bnei_else.25775
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.25777
	addi	%v0, %zero, 1
	j	fbeq_cont.25778
fbeq_else.25777:
	addi	%v0, %zero, 0
fbeq_cont.25778:
	beqi	%v0, 0, bnei_else.25779
	addi	%v0, %zero, 0
	j	bnei_cont.25772
bnei_else.25779:
	addi	%v0, %zero, 1
bnei_cont.25780:
	j	bnei_cont.25772
bnei_else.25775:
	addi	%v0, %zero, 0
bnei_cont.25776:
	j	bnei_cont.25772
bnei_else.25771:
	addi	%v0, %zero, 0
bnei_cont.25772:
	beqi	%v0, 0, bnei_else.25781
	fsw	%f2, 135(%zero)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.25781:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2853:
	flw	%f3, 0(%v1)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.25782
	addi	%a0, %zero, 1
	j	fbeq_cont.25783
fbeq_else.25782:
	addi	%a0, %zero, 0
fbeq_cont.25783:
	beqi	%a0, 0, bnei_else.25784
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25784:
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
	beqi	%a0, 0, bnei_else.25785
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
	j	bnei_cont.25786
bnei_else.25785:
	fmov	%f0, %f6
bnei_cont.25786:
	lw	%a0, 1(%v0)
	beqi	%a0, 3, bnei_else.25787
	j	bnei_cont.25788
bnei_else.25787:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.25788:
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0
	fsub	%f0, %f1, %f0
	fblt	%f4, %f0, fbgt_else.25789
	addi	%a0, %zero, 0
	j	fbgt_cont.25790
fbgt_else.25789:
	addi	%a0, %zero, 1
fbgt_cont.25790:
	beqi	%a0, 0, bnei_else.25791
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.25792
	fsqrt	%f0, %f0
	fadd	%f0, %f5, %f0
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.25793
bnei_else.25792:
	fsqrt	%f0, %f0
	fsub	%f0, %f5, %f0
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.25793:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25791:
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
	beqi	%a2, 1, bnei_else.25794
	beqi	%a2, 2, bnei_else.25795
	flw	%f3, 0(%v0)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.25796
	addi	%v1, %zero, 1
	j	fbeq_cont.25797
fbeq_else.25796:
	addi	%v1, %zero, 0
fbeq_cont.25797:
	beqi	%v1, 0, bnei_else.25798
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25798:
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
	fblt	%f4, %f1, fbgt_else.25799
	addi	%v1, %zero, 0
	j	fbgt_cont.25800
fbgt_else.25799:
	addi	%v1, %zero, 1
fbgt_cont.25800:
	beqi	%v1, 0, bnei_else.25801
	lw	%v1, 6(%a0)
	beqi	%v1, 0, bnei_else.25802
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.25803
bnei_else.25802:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.25803:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25801:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25795:
	flw	%f0, 0(%v0)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.25804
	addi	%v0, %zero, 0
	j	fbgt_cont.25805
fbgt_else.25804:
	addi	%v0, %zero, 1
fbgt_cont.25805:
	beqi	%v0, 0, bnei_else.25806
	flw	%f1, 3(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25806:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25794:
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
	fbne	%f0, %f1, fbeq_else.25810
	addi	%a0, %zero, 1
	j	fbeq_cont.25811
fbeq_else.25810:
	addi	%a0, %zero, 0
fbeq_cont.25811:
	beqi	%a0, 0, bnei_else.25812
	fsw	%f1, 1(%v0)
	j	bnei_cont.25813
bnei_else.25812:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.25814
	addi	%a2, %zero, 0
	j	fbgt_cont.25815
fbgt_else.25814:
	addi	%a2, %zero, 1
fbgt_cont.25815:
	beqi	%a1, 0, bnei_else.25816
	beqi	%a2, 0, bnei_else.25818
	addi	%a1, %zero, 0
	j	bnei_cont.25817
bnei_else.25818:
	addi	%a1, %zero, 1
bnei_cont.25819:
	j	bnei_cont.25817
bnei_else.25816:
	add	%a1, %zero, %a2
bnei_cont.25817:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.25820
	j	bnei_cont.25821
bnei_else.25820:
	fneg	%f2, %f2
bnei_cont.25821:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.25813:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.25822
	addi	%a0, %zero, 1
	j	fbeq_cont.25823
fbeq_else.25822:
	addi	%a0, %zero, 0
fbeq_cont.25823:
	beqi	%a0, 0, bnei_else.25824
	fsw	%f1, 3(%v0)
	j	bnei_cont.25825
bnei_else.25824:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.25826
	addi	%a2, %zero, 0
	j	fbgt_cont.25827
fbgt_else.25826:
	addi	%a2, %zero, 1
fbgt_cont.25827:
	beqi	%a1, 0, bnei_else.25828
	beqi	%a2, 0, bnei_else.25830
	addi	%a1, %zero, 0
	j	bnei_cont.25829
bnei_else.25830:
	addi	%a1, %zero, 1
bnei_cont.25831:
	j	bnei_cont.25829
bnei_else.25828:
	add	%a1, %zero, %a2
bnei_cont.25829:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.25832
	j	bnei_cont.25833
bnei_else.25832:
	fneg	%f2, %f2
bnei_cont.25833:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.25825:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.25834
	addi	%v1, %zero, 1
	j	fbeq_cont.25835
fbeq_else.25834:
	addi	%v1, %zero, 0
fbeq_cont.25835:
	beqi	%v1, 0, bnei_else.25836
	fsw	%f1, 5(%v0)
	j	bnei_cont.25837
bnei_else.25836:
	lw	%v1, 0(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.25838
	addi	%a1, %zero, 0
	j	fbgt_cont.25839
fbgt_else.25838:
	addi	%a1, %zero, 1
fbgt_cont.25839:
	beqi	%a0, 0, bnei_else.25840
	beqi	%a1, 0, bnei_else.25842
	addi	%a0, %zero, 0
	j	bnei_cont.25841
bnei_else.25842:
	addi	%a0, %zero, 1
bnei_cont.25843:
	j	bnei_cont.25841
bnei_else.25840:
	add	%a0, %zero, %a1
bnei_cont.25841:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.25844
	j	bnei_cont.25845
bnei_else.25844:
	fneg	%f1, %f1
bnei_cont.25845:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.25837:
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
	beqi	%a0, 0, bnei_else.25849
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
	j	bnei_cont.25850
bnei_else.25849:
bnei_cont.25850:
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
	beqi	%a0, 0, bnei_else.25851
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
	j	bnei_cont.25852
bnei_else.25851:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.25852:
	flw	%f0, 0(%sp)
	fbne	%f3, %f0, fbeq_else.25853
	addi	%v1, %zero, 1
	j	fbeq_cont.25854
fbeq_else.25853:
	addi	%v1, %zero, 0
fbeq_cont.25854:
	beqi	%v1, 0, bnei_else.25855
	j	bnei_cont.25856
bnei_else.25855:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.25856:
	jr	%ra
iter_setup_dirvec_constants.2889:
	blti	%v1, 0, bgti_else.25886
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.25887
	beqi	%a3, 2, bnei_else.25889
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
	j	bnei_cont.25888
bnei_else.25889:
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
	fblt	%f2, %f0, fbgt_else.25891
	addi	%v1, %zero, 0
	j	fbgt_cont.25892
fbgt_else.25891:
	addi	%v1, %zero, 1
fbgt_cont.25892:
	beqi	%v1, 0, bnei_else.25893
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
	j	bnei_cont.25894
bnei_else.25893:
	fsw	%f2, 0(%v0)
bnei_cont.25894:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.25890:
	j	bnei_cont.25888
bnei_else.25887:
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
bnei_cont.25888:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.25895
	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.25896
	beqi	%a3, 2, bnei_else.25898
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
	j	bnei_cont.25897
bnei_else.25898:
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
	fblt	%f1, %f0, fbgt_else.25900
	addi	%v1, %zero, 0
	j	fbgt_cont.25901
fbgt_else.25900:
	addi	%v1, %zero, 1
fbgt_cont.25901:
	beqi	%v1, 0, bnei_else.25902
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
	j	bnei_cont.25903
bnei_else.25902:
	fsw	%f1, 0(%v0)
bnei_cont.25903:
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.25899:
	j	bnei_cont.25897
bnei_else.25896:
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
bnei_cont.25897:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2889
bgti_else.25895:
	jr	%ra
bgti_else.25886:
	jr	%ra
setup_dirvec_constants.2892:
	lw	%v1, 0(%zero)
	addi	%v1, %v1, -1
	blti	%v1, 0, bgti_else.25921
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.25922
	beqi	%a3, 2, bnei_else.25924
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
	j	bnei_cont.25923
bnei_else.25924:
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
	fblt	%f1, %f0, fbgt_else.25926
	addi	%v1, %zero, 0
	j	fbgt_cont.25927
fbgt_else.25926:
	addi	%v1, %zero, 1
fbgt_cont.25927:
	beqi	%v1, 0, bnei_else.25928
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
	j	bnei_cont.25929
bnei_else.25928:
	fsw	%f1, 0(%v0)
bnei_cont.25929:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.25925:
	j	bnei_cont.25923
bnei_else.25922:
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
bnei_cont.25923:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2889
bgti_else.25921:
	jr	%ra
setup_startp_constants.2894:
	blti	%v1, 0, bgti_else.25932
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
	beqi	%a2, 2, bnei_else.25933
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.25935
	j	bnei_cont.25934
bgt_else.25935:
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
	beqi	%a3, 0, bnei_else.25937
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
	j	bnei_cont.25938
bnei_else.25937:
	fmov	%f0, %f3
bnei_cont.25938:
	beqi	%a2, 3, bnei_else.25939
	j	bnei_cont.25940
bnei_else.25939:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.25940:
	fsw	%f0, 3(%a1)
bgt_cont.25936:
	j	bnei_cont.25934
bnei_else.25933:
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
bnei_cont.25934:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2894
bgti_else.25932:
	jr	%ra
check_all_inside.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.25942
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
	beqi	%a1, 1, bnei_else.25943
	beqi	%a1, 2, bnei_else.25945
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
	beqi	%a1, 0, bnei_else.25947
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
	j	bnei_cont.25948
bnei_else.25947:
	fmov	%f3, %f6
bnei_cont.25948:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.25949
	j	bnei_cont.25950
bnei_else.25949:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.25950:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.25951
	addi	%a1, %zero, 0
	j	fbgt_cont.25952
fbgt_else.25951:
	addi	%a1, %zero, 1
fbgt_cont.25952:
	beqi	%a0, 0, bnei_else.25953
	beqi	%a1, 0, bnei_else.25955
	addi	%a0, %zero, 0
	j	bnei_cont.25954
bnei_else.25955:
	addi	%a0, %zero, 1
bnei_cont.25956:
	j	bnei_cont.25954
bnei_else.25953:
	add	%a0, %zero, %a1
bnei_cont.25954:
	beqi	%a0, 0, bnei_else.25957
	addi	%a0, %zero, 0
	j	bnei_cont.25944
bnei_else.25957:
	addi	%a0, %zero, 1
bnei_cont.25958:
	j	bnei_cont.25944
bnei_else.25945:
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
	fblt	%f3, %f4, fbgt_else.25959
	addi	%a1, %zero, 0
	j	fbgt_cont.25960
fbgt_else.25959:
	addi	%a1, %zero, 1
fbgt_cont.25960:
	beqi	%a0, 0, bnei_else.25961
	beqi	%a1, 0, bnei_else.25963
	addi	%a0, %zero, 0
	j	bnei_cont.25962
bnei_else.25963:
	addi	%a0, %zero, 1
bnei_cont.25964:
	j	bnei_cont.25962
bnei_else.25961:
	add	%a0, %zero, %a1
bnei_cont.25962:
	beqi	%a0, 0, bnei_else.25965
	addi	%a0, %zero, 0
	j	bnei_cont.25944
bnei_else.25965:
	addi	%a0, %zero, 1
bnei_cont.25966:
bnei_cont.25946:
	j	bnei_cont.25944
bnei_else.25943:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.25967
	addi	%a1, %zero, 0
	j	fbgt_cont.25968
fbgt_else.25967:
	addi	%a1, %zero, 1
fbgt_cont.25968:
	beqi	%a1, 0, bnei_else.25969
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.25971
	addi	%a1, %zero, 0
	j	fbgt_cont.25972
fbgt_else.25971:
	addi	%a1, %zero, 1
fbgt_cont.25972:
	beqi	%a1, 0, bnei_else.25973
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.25975
	addi	%a1, %zero, 0
	j	bnei_cont.25970
fbgt_else.25975:
	addi	%a1, %zero, 1
fbgt_cont.25976:
	j	bnei_cont.25970
bnei_else.25973:
	addi	%a1, %zero, 0
bnei_cont.25974:
	j	bnei_cont.25970
bnei_else.25969:
	addi	%a1, %zero, 0
bnei_cont.25970:
	beqi	%a1, 0, bnei_else.25977
	lw	%a0, 6(%a0)
	j	bnei_cont.25978
bnei_else.25977:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.25979
	addi	%a0, %zero, 0
	j	bnei_cont.25980
bnei_else.25979:
	addi	%a0, %zero, 1
bnei_cont.25980:
bnei_cont.25978:
bnei_cont.25944:
	beqi	%a0, 0, bnei_else.25981
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.25981:
	addi	%v0, %v0, 1
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.25982
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
	beqi	%a1, 1, bnei_else.25983
	beqi	%a1, 2, bnei_else.25985
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
	beqi	%a1, 0, bnei_else.25987
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
	j	bnei_cont.25988
bnei_else.25987:
	fmov	%f3, %f6
bnei_cont.25988:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.25989
	j	bnei_cont.25990
bnei_else.25989:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.25990:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.25991
	addi	%a1, %zero, 0
	j	fbgt_cont.25992
fbgt_else.25991:
	addi	%a1, %zero, 1
fbgt_cont.25992:
	beqi	%a0, 0, bnei_else.25993
	beqi	%a1, 0, bnei_else.25995
	addi	%a0, %zero, 0
	j	bnei_cont.25994
bnei_else.25995:
	addi	%a0, %zero, 1
bnei_cont.25996:
	j	bnei_cont.25994
bnei_else.25993:
	add	%a0, %zero, %a1
bnei_cont.25994:
	beqi	%a0, 0, bnei_else.25997
	addi	%a0, %zero, 0
	j	bnei_cont.25984
bnei_else.25997:
	addi	%a0, %zero, 1
bnei_cont.25998:
	j	bnei_cont.25984
bnei_else.25985:
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
	fblt	%f3, %f4, fbgt_else.25999
	addi	%a1, %zero, 0
	j	fbgt_cont.26000
fbgt_else.25999:
	addi	%a1, %zero, 1
fbgt_cont.26000:
	beqi	%a0, 0, bnei_else.26001
	beqi	%a1, 0, bnei_else.26003
	addi	%a0, %zero, 0
	j	bnei_cont.26002
bnei_else.26003:
	addi	%a0, %zero, 1
bnei_cont.26004:
	j	bnei_cont.26002
bnei_else.26001:
	add	%a0, %zero, %a1
bnei_cont.26002:
	beqi	%a0, 0, bnei_else.26005
	addi	%a0, %zero, 0
	j	bnei_cont.25984
bnei_else.26005:
	addi	%a0, %zero, 1
bnei_cont.26006:
bnei_cont.25986:
	j	bnei_cont.25984
bnei_else.25983:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.26007
	addi	%a1, %zero, 0
	j	fbgt_cont.26008
fbgt_else.26007:
	addi	%a1, %zero, 1
fbgt_cont.26008:
	beqi	%a1, 0, bnei_else.26009
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.26011
	addi	%a1, %zero, 0
	j	fbgt_cont.26012
fbgt_else.26011:
	addi	%a1, %zero, 1
fbgt_cont.26012:
	beqi	%a1, 0, bnei_else.26013
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.26015
	addi	%a1, %zero, 0
	j	bnei_cont.26010
fbgt_else.26015:
	addi	%a1, %zero, 1
fbgt_cont.26016:
	j	bnei_cont.26010
bnei_else.26013:
	addi	%a1, %zero, 0
bnei_cont.26014:
	j	bnei_cont.26010
bnei_else.26009:
	addi	%a1, %zero, 0
bnei_cont.26010:
	beqi	%a1, 0, bnei_else.26017
	lw	%a0, 6(%a0)
	j	bnei_cont.26018
bnei_else.26017:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.26019
	addi	%a0, %zero, 0
	j	bnei_cont.26020
bnei_else.26019:
	addi	%a0, %zero, 1
bnei_cont.26020:
bnei_cont.26018:
bnei_cont.25984:
	beqi	%a0, 0, bnei_else.26021
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26021:
	addi	%v0, %v0, 1
	j	check_all_inside.2919
bnei_else.25982:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.25942:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2925:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26053
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
	beqi	%a3, 1, bnei_else.26054
	beqi	%a3, 2, bnei_else.26056
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
	j	bnei_cont.26055
bnei_else.26056:
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	fblt	%f6, %f7, fbgt_else.26058
	addi	%a3, %zero, 0
	j	fbgt_cont.26059
fbgt_else.26058:
	addi	%a3, %zero, 1
fbgt_cont.26059:
	beqi	%a3, 0, bnei_else.26060
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
	j	bnei_cont.26055
bnei_else.26060:
	addi	%v0, %zero, 0
bnei_cont.26061:
bnei_cont.26057:
	j	bnei_cont.26055
bnei_else.26054:
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
bnei_cont.26055:
	flw	%f0, 135(%zero)
	beqi	%v0, 0, bnei_else.26062
	flw	%f1, 457(%zero)
	fblt	%f0, %f1, fbgt_else.26064
	addi	%v0, %zero, 0
	j	bnei_cont.26063
fbgt_else.26064:
	addi	%v0, %zero, 1
fbgt_cont.26065:
	j	bnei_cont.26063
bnei_else.26062:
	addi	%v0, %zero, 0
bnei_cont.26063:
	beqi	%v0, 0, bnei_else.26066
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
	beqi	%v0, -1, bnei_else.26067
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
	beqi	%a0, 1, bnei_else.26069
	beqi	%a0, 2, bnei_else.26071
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
	beqi	%a0, 0, bnei_else.26073
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
	j	bnei_cont.26074
bnei_else.26073:
	fmov	%f3, %f6
bnei_cont.26074:
	lw	%a0, 1(%v0)
	beqi	%a0, 3, bnei_else.26075
	j	bnei_cont.26076
bnei_else.26075:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.26076:
	lw	%v0, 6(%v0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.26077
	addi	%a0, %zero, 0
	j	fbgt_cont.26078
fbgt_else.26077:
	addi	%a0, %zero, 1
fbgt_cont.26078:
	beqi	%v0, 0, bnei_else.26079
	beqi	%a0, 0, bnei_else.26081
	addi	%v0, %zero, 0
	j	bnei_cont.26080
bnei_else.26081:
	addi	%v0, %zero, 1
bnei_cont.26082:
	j	bnei_cont.26080
bnei_else.26079:
	add	%v0, %zero, %a0
bnei_cont.26080:
	beqi	%v0, 0, bnei_else.26083
	addi	%v0, %zero, 0
	j	bnei_cont.26070
bnei_else.26083:
	addi	%v0, %zero, 1
bnei_cont.26084:
	j	bnei_cont.26070
bnei_else.26071:
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
	fblt	%f3, %f4, fbgt_else.26085
	addi	%a0, %zero, 0
	j	fbgt_cont.26086
fbgt_else.26085:
	addi	%a0, %zero, 1
fbgt_cont.26086:
	beqi	%v0, 0, bnei_else.26087
	beqi	%a0, 0, bnei_else.26089
	addi	%v0, %zero, 0
	j	bnei_cont.26088
bnei_else.26089:
	addi	%v0, %zero, 1
bnei_cont.26090:
	j	bnei_cont.26088
bnei_else.26087:
	add	%v0, %zero, %a0
bnei_cont.26088:
	beqi	%v0, 0, bnei_else.26091
	addi	%v0, %zero, 0
	j	bnei_cont.26070
bnei_else.26091:
	addi	%v0, %zero, 1
bnei_cont.26092:
bnei_cont.26072:
	j	bnei_cont.26070
bnei_else.26069:
	fabs	%f3, %f3
	lw	%a0, 4(%v0)
	flw	%f6, 0(%a0)
	fblt	%f3, %f6, fbgt_else.26093
	addi	%a0, %zero, 0
	j	fbgt_cont.26094
fbgt_else.26093:
	addi	%a0, %zero, 1
fbgt_cont.26094:
	beqi	%a0, 0, bnei_else.26095
	fabs	%f3, %f4
	lw	%a0, 4(%v0)
	flw	%f4, 1(%a0)
	fblt	%f3, %f4, fbgt_else.26097
	addi	%a0, %zero, 0
	j	fbgt_cont.26098
fbgt_else.26097:
	addi	%a0, %zero, 1
fbgt_cont.26098:
	beqi	%a0, 0, bnei_else.26099
	fabs	%f3, %f5
	lw	%a0, 4(%v0)
	flw	%f4, 2(%a0)
	fblt	%f3, %f4, fbgt_else.26101
	addi	%a0, %zero, 0
	j	bnei_cont.26096
fbgt_else.26101:
	addi	%a0, %zero, 1
fbgt_cont.26102:
	j	bnei_cont.26096
bnei_else.26099:
	addi	%a0, %zero, 0
bnei_cont.26100:
	j	bnei_cont.26096
bnei_else.26095:
	addi	%a0, %zero, 0
bnei_cont.26096:
	beqi	%a0, 0, bnei_else.26103
	lw	%v0, 6(%v0)
	j	bnei_cont.26104
bnei_else.26103:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.26105
	addi	%v0, %zero, 0
	j	bnei_cont.26106
bnei_else.26105:
	addi	%v0, %zero, 1
bnei_cont.26106:
bnei_cont.26104:
bnei_cont.26070:
	beqi	%v0, 0, bnei_else.26107
	addi	%v0, %zero, 0
	j	bnei_cont.26068
bnei_else.26107:
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
bnei_cont.26108:
	j	bnei_cont.26068
bnei_else.26067:
	addi	%v0, %zero, 1
bnei_cont.26068:
	beqi	%v0, 0, bnei_else.26109
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26109:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2925
bnei_else.26066:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.26110
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2925
bnei_else.26110:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26053:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2928:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26122
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
	beqi	%v0, 0, bnei_else.26123
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26123:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26124
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
	beqi	%v0, 0, bnei_else.26125
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26125:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26126
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
	beqi	%v0, 0, bnei_else.26127
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26127:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26128
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
	beqi	%v0, 0, bnei_else.26129
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26129:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2928
bnei_else.26128:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26126:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26124:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.26122:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2931:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.26165
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.26166
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
	beqi	%t0, 1, bnei_else.26168
	beqi	%t0, 2, bnei_else.26170
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast.2853
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.26169
bnei_else.26170:
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.26172
	addi	%a3, %zero, 0
	j	fbgt_cont.26173
fbgt_else.26172:
	addi	%a3, %zero, 1
fbgt_cont.26173:
	beqi	%a3, 0, bnei_else.26174
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
	j	bnei_cont.26169
bnei_else.26174:
	addi	%v0, %zero, 0
bnei_cont.26175:
bnei_cont.26171:
	j	bnei_cont.26169
bnei_else.26168:
	addi	%t0, %zero, 184
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2840
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.26169:
	beqi	%v0, 0, bnei_else.26176
	flw	%f0, 135(%zero)
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.26178
	addi	%v0, %zero, 0
	j	fbgt_cont.26179
fbgt_else.26178:
	addi	%v0, %zero, 1
fbgt_cont.26179:
	beqi	%v0, 0, bnei_else.26180
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.26182
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26184
	addi	%v0, %zero, 1
	j	bnei_cont.26183
bnei_else.26184:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.26186
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26188
	addi	%v0, %zero, 1
	j	bnei_cont.26183
bnei_else.26188:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.26190
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26192
	addi	%v0, %zero, 1
	j	bnei_cont.26183
bnei_else.26192:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2928
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.26193:
	j	bnei_cont.26183
bnei_else.26190:
	addi	%v0, %zero, 0
bnei_cont.26191:
bnei_cont.26189:
	j	bnei_cont.26183
bnei_else.26186:
	addi	%v0, %zero, 0
bnei_cont.26187:
bnei_cont.26185:
	j	bnei_cont.26183
bnei_else.26182:
	addi	%v0, %zero, 0
bnei_cont.26183:
	beqi	%v0, 0, bnei_else.26194
	addi	%v0, %zero, 1
	j	bnei_cont.26167
bnei_else.26194:
	addi	%v0, %zero, 0
bnei_cont.26195:
	j	bnei_cont.26167
bnei_else.26180:
	addi	%v0, %zero, 0
bnei_cont.26181:
	j	bnei_cont.26167
bnei_else.26176:
	addi	%v0, %zero, 0
bnei_cont.26177:
	j	bnei_cont.26167
bnei_else.26166:
	addi	%v0, %zero, 1
bnei_cont.26167:
	beqi	%v0, 0, bnei_else.26196
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.26197
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26199
	addi	%v0, %zero, 1
	j	bnei_cont.26198
bnei_else.26199:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.26201
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26203
	addi	%v0, %zero, 1
	j	bnei_cont.26198
bnei_else.26203:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.26205
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.26207
	addi	%v0, %zero, 1
	j	bnei_cont.26198
bnei_else.26207:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2928
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.26208:
	j	bnei_cont.26198
bnei_else.26205:
	addi	%v0, %zero, 0
bnei_cont.26206:
bnei_cont.26204:
	j	bnei_cont.26198
bnei_else.26201:
	addi	%v0, %zero, 0
bnei_cont.26202:
bnei_cont.26200:
	j	bnei_cont.26198
bnei_else.26197:
	addi	%v0, %zero, 0
bnei_cont.26198:
	beqi	%v0, 0, bnei_else.26209
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.26209:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2931
bnei_else.26196:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2931
bnei_else.26165:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2934:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.26268
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
	beqi	%t0, 1, bnei_else.26269
	beqi	%t0, 2, bnei_else.26271
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
	j	bnei_cont.26270
bnei_else.26271:
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
	fblt	%f8, %f6, fbgt_else.26273
	addi	%t0, %zero, 0
	j	fbgt_cont.26274
fbgt_else.26273:
	addi	%t0, %zero, 1
fbgt_cont.26274:
	beqi	%t0, 0, bnei_else.26275
	fmul	%f1, %f7, %f1
	fmul	%f3, %f9, %f3
	fadd	%f1, %f1, %f3
	fmul	%f3, %f10, %f5
	fadd	%f1, %f1, %f3
	fneg	%f1, %f1
	fdiv	%f1, %f1, %f6
	fsw	%f1, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.26270
bnei_else.26275:
	addi	%v0, %zero, 0
bnei_cont.26276:
bnei_cont.26272:
	j	bnei_cont.26270
bnei_else.26269:
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
bnei_cont.26270:
	beqi	%v0, 0, bnei_else.26277
	flw	%f0, 135(%zero)
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.26278
	addi	%v1, %zero, 0
	j	fbgt_cont.26279
fbgt_else.26278:
	addi	%v1, %zero, 1
fbgt_cont.26279:
	beqi	%v1, 0, bnei_else.26280
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.26282
	addi	%v1, %zero, 0
	j	fbgt_cont.26283
fbgt_else.26282:
	addi	%v1, %zero, 1
fbgt_cont.26283:
	beqi	%v1, 0, bnei_cont.26281
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
	beqi	%a1, -1, bnei_else.26286
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
	beqi	%a2, 1, bnei_else.26288
	beqi	%a2, 2, bnei_else.26290
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
	beqi	%a2, 0, bnei_else.26292
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
	j	bnei_cont.26293
bnei_else.26292:
	fmov	%f5, %f8
bnei_cont.26293:
	lw	%a2, 1(%a1)
	beqi	%a2, 3, bnei_else.26294
	j	bnei_cont.26295
bnei_else.26294:
	flw	%f6, 474(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.26295:
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.26296
	addi	%a2, %zero, 0
	j	fbgt_cont.26297
fbgt_else.26296:
	addi	%a2, %zero, 1
fbgt_cont.26297:
	beqi	%a1, 0, bnei_else.26298
	beqi	%a2, 0, bnei_else.26300
	addi	%a1, %zero, 0
	j	bnei_cont.26299
bnei_else.26300:
	addi	%a1, %zero, 1
bnei_cont.26301:
	j	bnei_cont.26299
bnei_else.26298:
	add	%a1, %zero, %a2
bnei_cont.26299:
	beqi	%a1, 0, bnei_else.26302
	addi	%a1, %zero, 0
	j	bnei_cont.26289
bnei_else.26302:
	addi	%a1, %zero, 1
bnei_cont.26303:
	j	bnei_cont.26289
bnei_else.26290:
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
	fblt	%f5, %f1, fbgt_else.26304
	addi	%a2, %zero, 0
	j	fbgt_cont.26305
fbgt_else.26304:
	addi	%a2, %zero, 1
fbgt_cont.26305:
	beqi	%a1, 0, bnei_else.26306
	beqi	%a2, 0, bnei_else.26308
	addi	%a1, %zero, 0
	j	bnei_cont.26307
bnei_else.26308:
	addi	%a1, %zero, 1
bnei_cont.26309:
	j	bnei_cont.26307
bnei_else.26306:
	add	%a1, %zero, %a2
bnei_cont.26307:
	beqi	%a1, 0, bnei_else.26310
	addi	%a1, %zero, 0
	j	bnei_cont.26289
bnei_else.26310:
	addi	%a1, %zero, 1
bnei_cont.26311:
bnei_cont.26291:
	j	bnei_cont.26289
bnei_else.26288:
	fabs	%f1, %f5
	lw	%a2, 4(%a1)
	flw	%f5, 0(%a2)
	fblt	%f1, %f5, fbgt_else.26312
	addi	%a2, %zero, 0
	j	fbgt_cont.26313
fbgt_else.26312:
	addi	%a2, %zero, 1
fbgt_cont.26313:
	beqi	%a2, 0, bnei_else.26314
	fabs	%f1, %f6
	lw	%a2, 4(%a1)
	flw	%f5, 1(%a2)
	fblt	%f1, %f5, fbgt_else.26316
	addi	%a2, %zero, 0
	j	fbgt_cont.26317
fbgt_else.26316:
	addi	%a2, %zero, 1
fbgt_cont.26317:
	beqi	%a2, 0, bnei_else.26318
	fabs	%f1, %f7
	lw	%a2, 4(%a1)
	flw	%f5, 2(%a2)
	fblt	%f1, %f5, fbgt_else.26320
	addi	%a2, %zero, 0
	j	bnei_cont.26315
fbgt_else.26320:
	addi	%a2, %zero, 1
fbgt_cont.26321:
	j	bnei_cont.26315
bnei_else.26318:
	addi	%a2, %zero, 0
bnei_cont.26319:
	j	bnei_cont.26315
bnei_else.26314:
	addi	%a2, %zero, 0
bnei_cont.26315:
	beqi	%a2, 0, bnei_else.26322
	lw	%a1, 6(%a1)
	j	bnei_cont.26323
bnei_else.26322:
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.26324
	addi	%a1, %zero, 0
	j	bnei_cont.26325
bnei_else.26324:
	addi	%a1, %zero, 1
bnei_cont.26325:
bnei_cont.26323:
bnei_cont.26289:
	beqi	%a1, 0, bnei_else.26326
	addi	%v0, %zero, 0
	j	bnei_cont.26287
bnei_else.26326:
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
bnei_cont.26327:
	j	bnei_cont.26287
bnei_else.26286:
	addi	%v0, %zero, 1
bnei_cont.26287:
	beqi	%v0, 0, bnei_cont.26281
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
	j	bnei_cont.26281
bnei_else.26328:
bnei_cont.26329:
	j	bnei_cont.26281
bnei_else.26284:
bnei_cont.26285:
	j	bnei_cont.26281
bnei_else.26280:
bnei_cont.26281:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2934
bnei_else.26277:
	lw	%v0, 8(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.26330
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2934
bnei_else.26330:
	jr	%ra
bnei_else.26268:
	jr	%ra
solve_one_or_network.2938:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.26365
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
	beqi	%a0, -1, bnei_else.26366
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
	beqi	%a0, -1, bnei_else.26367
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
	beqi	%a0, -1, bnei_else.26368
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
	beqi	%a0, -1, bnei_else.26369
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
	beqi	%a0, -1, bnei_else.26370
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
	beqi	%a0, -1, bnei_else.26371
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
	beqi	%a0, -1, bnei_else.26372
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
bnei_else.26365:
	jr	%ra
trace_or_matrix.2942:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.26502
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.26503
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
	beqi	%t0, 1, bnei_else.26505
	beqi	%t0, 2, bnei_else.26507
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second.2830
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.26506
bnei_else.26507:
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
	fblt	%f5, %f3, fbgt_else.26509
	addi	%a3, %zero, 0
	j	fbgt_cont.26510
fbgt_else.26509:
	addi	%a3, %zero, 1
fbgt_cont.26510:
	beqi	%a3, 0, bnei_else.26511
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.26506
bnei_else.26511:
	addi	%v0, %zero, 0
bnei_cont.26512:
bnei_cont.26508:
	j	bnei_cont.26506
bnei_else.26505:
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect.2805
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.26506:
	beqi	%v0, 0, bnei_cont.26504
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.26515
	addi	%v0, %zero, 0
	j	fbgt_cont.26516
fbgt_else.26515:
	addi	%v0, %zero, 1
fbgt_cont.26516:
	beqi	%v0, 0, bnei_cont.26504
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.26504
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
	beqi	%v1, -1, bnei_cont.26504
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
	beqi	%v1, -1, bnei_cont.26504
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
	beqi	%v1, -1, bnei_cont.26504
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
	beqi	%v1, -1, bnei_cont.26504
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
	beqi	%v1, -1, bnei_cont.26504
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
	beqi	%v1, -1, bnei_cont.26504
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
	j	bnei_cont.26504
bnei_else.26531:
bnei_cont.26532:
	j	bnei_cont.26504
bnei_else.26529:
bnei_cont.26530:
	j	bnei_cont.26504
bnei_else.26527:
bnei_cont.26528:
	j	bnei_cont.26504
bnei_else.26525:
bnei_cont.26526:
	j	bnei_cont.26504
bnei_else.26523:
bnei_cont.26524:
	j	bnei_cont.26504
bnei_else.26521:
bnei_cont.26522:
	j	bnei_cont.26504
bnei_else.26519:
bnei_cont.26520:
	j	bnei_cont.26504
bnei_else.26517:
bnei_cont.26518:
	j	bnei_cont.26504
bnei_else.26513:
bnei_cont.26514:
	j	bnei_cont.26504
bnei_else.26503:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.26533
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
	beqi	%v1, -1, bnei_cont.26534
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
	beqi	%v1, -1, bnei_cont.26534
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
	beqi	%v1, -1, bnei_cont.26534
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
	beqi	%v1, -1, bnei_cont.26534
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
	beqi	%v1, -1, bnei_cont.26534
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
	beqi	%v1, -1, bnei_cont.26534
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
	j	bnei_cont.26534
bnei_else.26545:
bnei_cont.26546:
	j	bnei_cont.26534
bnei_else.26543:
bnei_cont.26544:
	j	bnei_cont.26534
bnei_else.26541:
bnei_cont.26542:
	j	bnei_cont.26534
bnei_else.26539:
bnei_cont.26540:
	j	bnei_cont.26534
bnei_else.26537:
bnei_cont.26538:
	j	bnei_cont.26534
bnei_else.26535:
bnei_cont.26536:
	j	bnei_cont.26534
bnei_else.26533:
bnei_cont.26534:
bnei_cont.26504:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.26547
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.26548
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
	beqi	%v0, 0, bnei_cont.26549
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.26552
	addi	%v0, %zero, 0
	j	fbgt_cont.26553
fbgt_else.26552:
	addi	%v0, %zero, 1
fbgt_cont.26553:
	beqi	%v0, 0, bnei_cont.26549
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.26549
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
	beqi	%v1, -1, bnei_cont.26549
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
	beqi	%v1, -1, bnei_cont.26549
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
	beqi	%v1, -1, bnei_cont.26549
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
	beqi	%v1, -1, bnei_cont.26549
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
	beqi	%v1, -1, bnei_cont.26549
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
	j	bnei_cont.26549
bnei_else.26566:
bnei_cont.26567:
	j	bnei_cont.26549
bnei_else.26564:
bnei_cont.26565:
	j	bnei_cont.26549
bnei_else.26562:
bnei_cont.26563:
	j	bnei_cont.26549
bnei_else.26560:
bnei_cont.26561:
	j	bnei_cont.26549
bnei_else.26558:
bnei_cont.26559:
	j	bnei_cont.26549
bnei_else.26556:
bnei_cont.26557:
	j	bnei_cont.26549
bnei_else.26554:
bnei_cont.26555:
	j	bnei_cont.26549
bnei_else.26550:
bnei_cont.26551:
	j	bnei_cont.26549
bnei_else.26548:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.26568
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
	beqi	%v1, -1, bnei_cont.26569
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
	beqi	%v1, -1, bnei_cont.26569
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
	beqi	%v1, -1, bnei_cont.26569
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
	beqi	%v1, -1, bnei_cont.26569
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
	beqi	%v1, -1, bnei_cont.26569
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
	j	bnei_cont.26569
bnei_else.26578:
bnei_cont.26579:
	j	bnei_cont.26569
bnei_else.26576:
bnei_cont.26577:
	j	bnei_cont.26569
bnei_else.26574:
bnei_cont.26575:
	j	bnei_cont.26569
bnei_else.26572:
bnei_cont.26573:
	j	bnei_cont.26569
bnei_else.26570:
bnei_cont.26571:
	j	bnei_cont.26569
bnei_else.26568:
bnei_cont.26569:
bnei_cont.26549:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2942
bnei_else.26547:
	jr	%ra
bnei_else.26502:
	jr	%ra
solve_each_element_fast.2948:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.26615
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
	beqi	%t3, 1, bnei_else.26616
	beqi	%t3, 2, bnei_else.26618
	flw	%f3, 0(%t2)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.26620
	addi	%t3, %zero, 1
	j	fbeq_cont.26621
fbeq_else.26620:
	addi	%t3, %zero, 0
fbeq_cont.26621:
	beqi	%t3, 0, bnei_else.26622
	addi	%v0, %zero, 0
	j	bnei_cont.26617
bnei_else.26622:
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
	fblt	%f4, %f1, fbgt_else.26624
	addi	%t0, %zero, 0
	j	fbgt_cont.26625
fbgt_else.26624:
	addi	%t0, %zero, 1
fbgt_cont.26625:
	beqi	%t0, 0, bnei_else.26626
	lw	%t0, 6(%a3)
	beqi	%t0, 0, bnei_else.26628
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.26629
bnei_else.26628:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.26629:
	addi	%v0, %zero, 1
	j	bnei_cont.26617
bnei_else.26626:
	addi	%v0, %zero, 0
bnei_cont.26627:
bnei_cont.26623:
	j	bnei_cont.26617
bnei_else.26618:
	flw	%f0, 0(%t2)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.26630
	addi	%t2, %zero, 0
	j	fbgt_cont.26631
fbgt_else.26630:
	addi	%t2, %zero, 1
fbgt_cont.26631:
	beqi	%t2, 0, bnei_else.26632
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.26617
bnei_else.26632:
	addi	%v0, %zero, 0
bnei_cont.26633:
bnei_cont.26619:
	j	bnei_cont.26617
bnei_else.26616:
	lw	%t0, 0(%a0)
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2840
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.26617:
	beqi	%v0, 0, bnei_else.26634
	flw	%f0, 135(%zero)
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.26635
	addi	%v1, %zero, 0
	j	fbgt_cont.26636
fbgt_else.26635:
	addi	%v1, %zero, 1
fbgt_cont.26636:
	beqi	%v1, 0, bnei_else.26637
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.26639
	addi	%v1, %zero, 0
	j	fbgt_cont.26640
fbgt_else.26639:
	addi	%v1, %zero, 1
fbgt_cont.26640:
	beqi	%v1, 0, bnei_cont.26638
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
	beqi	%a0, -1, bnei_else.26643
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
	beqi	%a1, 1, bnei_else.26645
	beqi	%a1, 2, bnei_else.26647
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
	beqi	%a1, 0, bnei_else.26649
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
	j	bnei_cont.26650
bnei_else.26649:
	fmov	%f5, %f8
bnei_cont.26650:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.26651
	j	bnei_cont.26652
bnei_else.26651:
	flw	%f6, 474(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.26652:
	lw	%a0, 6(%a0)
	fblt	%f5, %f1, fbgt_else.26653
	addi	%a1, %zero, 0
	j	fbgt_cont.26654
fbgt_else.26653:
	addi	%a1, %zero, 1
fbgt_cont.26654:
	beqi	%a0, 0, bnei_else.26655
	beqi	%a1, 0, bnei_else.26657
	addi	%a0, %zero, 0
	j	bnei_cont.26656
bnei_else.26657:
	addi	%a0, %zero, 1
bnei_cont.26658:
	j	bnei_cont.26656
bnei_else.26655:
	add	%a0, %zero, %a1
bnei_cont.26656:
	beqi	%a0, 0, bnei_else.26659
	addi	%a0, %zero, 0
	j	bnei_cont.26646
bnei_else.26659:
	addi	%a0, %zero, 1
bnei_cont.26660:
	j	bnei_cont.26646
bnei_else.26647:
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
	fblt	%f5, %f1, fbgt_else.26661
	addi	%a1, %zero, 0
	j	fbgt_cont.26662
fbgt_else.26661:
	addi	%a1, %zero, 1
fbgt_cont.26662:
	beqi	%a0, 0, bnei_else.26663
	beqi	%a1, 0, bnei_else.26665
	addi	%a0, %zero, 0
	j	bnei_cont.26664
bnei_else.26665:
	addi	%a0, %zero, 1
bnei_cont.26666:
	j	bnei_cont.26664
bnei_else.26663:
	add	%a0, %zero, %a1
bnei_cont.26664:
	beqi	%a0, 0, bnei_else.26667
	addi	%a0, %zero, 0
	j	bnei_cont.26646
bnei_else.26667:
	addi	%a0, %zero, 1
bnei_cont.26668:
bnei_cont.26648:
	j	bnei_cont.26646
bnei_else.26645:
	fabs	%f1, %f5
	lw	%a1, 4(%a0)
	flw	%f5, 0(%a1)
	fblt	%f1, %f5, fbgt_else.26669
	addi	%a1, %zero, 0
	j	fbgt_cont.26670
fbgt_else.26669:
	addi	%a1, %zero, 1
fbgt_cont.26670:
	beqi	%a1, 0, bnei_else.26671
	fabs	%f1, %f6
	lw	%a1, 4(%a0)
	flw	%f5, 1(%a1)
	fblt	%f1, %f5, fbgt_else.26673
	addi	%a1, %zero, 0
	j	fbgt_cont.26674
fbgt_else.26673:
	addi	%a1, %zero, 1
fbgt_cont.26674:
	beqi	%a1, 0, bnei_else.26675
	fabs	%f1, %f7
	lw	%a1, 4(%a0)
	flw	%f5, 2(%a1)
	fblt	%f1, %f5, fbgt_else.26677
	addi	%a1, %zero, 0
	j	bnei_cont.26672
fbgt_else.26677:
	addi	%a1, %zero, 1
fbgt_cont.26678:
	j	bnei_cont.26672
bnei_else.26675:
	addi	%a1, %zero, 0
bnei_cont.26676:
	j	bnei_cont.26672
bnei_else.26671:
	addi	%a1, %zero, 0
bnei_cont.26672:
	beqi	%a1, 0, bnei_else.26679
	lw	%a0, 6(%a0)
	j	bnei_cont.26680
bnei_else.26679:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.26681
	addi	%a0, %zero, 0
	j	bnei_cont.26682
bnei_else.26681:
	addi	%a0, %zero, 1
bnei_cont.26682:
bnei_cont.26680:
bnei_cont.26646:
	beqi	%a0, 0, bnei_else.26683
	addi	%v0, %zero, 0
	j	bnei_cont.26644
bnei_else.26683:
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
bnei_cont.26684:
	j	bnei_cont.26644
bnei_else.26643:
	addi	%v0, %zero, 1
bnei_cont.26644:
	beqi	%v0, 0, bnei_cont.26638
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
	j	bnei_cont.26638
bnei_else.26685:
bnei_cont.26686:
	j	bnei_cont.26638
bnei_else.26641:
bnei_cont.26642:
	j	bnei_cont.26638
bnei_else.26637:
bnei_cont.26638:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2948
bnei_else.26634:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.26687
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2948
bnei_else.26687:
	jr	%ra
bnei_else.26615:
	jr	%ra
solve_one_or_network_fast.2952:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.26722
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
	beqi	%a0, -1, bnei_else.26723
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
	beqi	%a0, -1, bnei_else.26724
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
	beqi	%a0, -1, bnei_else.26725
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
	beqi	%a0, -1, bnei_else.26726
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
	beqi	%a0, -1, bnei_else.26727
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
	beqi	%a0, -1, bnei_else.26728
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
	beqi	%a0, -1, bnei_else.26729
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
bnei_else.26722:
	jr	%ra
trace_or_matrix_fast.2956:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.26849
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.26850
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
	beqi	%t2, 1, bnei_else.26852
	beqi	%t2, 2, bnei_else.26854
	flw	%f3, 0(%a3)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.26856
	addi	%t2, %zero, 1
	j	fbeq_cont.26857
fbeq_else.26856:
	addi	%t2, %zero, 0
fbeq_cont.26857:
	beqi	%t2, 0, bnei_else.26858
	addi	%v0, %zero, 0
	j	bnei_cont.26853
bnei_else.26858:
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
	fblt	%f4, %f1, fbgt_else.26860
	addi	%t1, %zero, 0
	j	fbgt_cont.26861
fbgt_else.26860:
	addi	%t1, %zero, 1
fbgt_cont.26861:
	beqi	%t1, 0, bnei_else.26862
	lw	%t0, 6(%t0)
	beqi	%t0, 0, bnei_else.26864
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.26865
bnei_else.26864:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.26865:
	addi	%v0, %zero, 1
	j	bnei_cont.26853
bnei_else.26862:
	addi	%v0, %zero, 0
bnei_cont.26863:
bnei_cont.26859:
	j	bnei_cont.26853
bnei_else.26854:
	flw	%f0, 0(%a3)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.26866
	addi	%a3, %zero, 0
	j	fbgt_cont.26867
fbgt_else.26866:
	addi	%a3, %zero, 1
fbgt_cont.26867:
	beqi	%a3, 0, bnei_else.26868
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.26853
bnei_else.26868:
	addi	%v0, %zero, 0
bnei_cont.26869:
bnei_cont.26855:
	j	bnei_cont.26853
bnei_else.26852:
	lw	%t1, 0(%a0)
	addi	%a0, %a3, 0
	addi	%v1, %t1, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_fast.2840
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.26853:
	beqi	%v0, 0, bnei_cont.26851
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.26872
	addi	%v0, %zero, 0
	j	fbgt_cont.26873
fbgt_else.26872:
	addi	%v0, %zero, 1
fbgt_cont.26873:
	beqi	%v0, 0, bnei_cont.26851
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.26851
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
	beqi	%v1, -1, bnei_cont.26851
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
	beqi	%v1, -1, bnei_cont.26851
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
	beqi	%v1, -1, bnei_cont.26851
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
	beqi	%v1, -1, bnei_cont.26851
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
	beqi	%v1, -1, bnei_cont.26851
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
	beqi	%v1, -1, bnei_cont.26851
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
	j	bnei_cont.26851
bnei_else.26888:
bnei_cont.26889:
	j	bnei_cont.26851
bnei_else.26886:
bnei_cont.26887:
	j	bnei_cont.26851
bnei_else.26884:
bnei_cont.26885:
	j	bnei_cont.26851
bnei_else.26882:
bnei_cont.26883:
	j	bnei_cont.26851
bnei_else.26880:
bnei_cont.26881:
	j	bnei_cont.26851
bnei_else.26878:
bnei_cont.26879:
	j	bnei_cont.26851
bnei_else.26876:
bnei_cont.26877:
	j	bnei_cont.26851
bnei_else.26874:
bnei_cont.26875:
	j	bnei_cont.26851
bnei_else.26870:
bnei_cont.26871:
	j	bnei_cont.26851
bnei_else.26850:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.26890
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
	beqi	%v1, -1, bnei_cont.26891
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
	beqi	%v1, -1, bnei_cont.26891
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
	beqi	%v1, -1, bnei_cont.26891
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
	beqi	%v1, -1, bnei_cont.26891
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
	beqi	%v1, -1, bnei_cont.26891
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
	beqi	%v1, -1, bnei_cont.26891
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
	j	bnei_cont.26891
bnei_else.26902:
bnei_cont.26903:
	j	bnei_cont.26891
bnei_else.26900:
bnei_cont.26901:
	j	bnei_cont.26891
bnei_else.26898:
bnei_cont.26899:
	j	bnei_cont.26891
bnei_else.26896:
bnei_cont.26897:
	j	bnei_cont.26891
bnei_else.26894:
bnei_cont.26895:
	j	bnei_cont.26891
bnei_else.26892:
bnei_cont.26893:
	j	bnei_cont.26891
bnei_else.26890:
bnei_cont.26891:
bnei_cont.26851:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.26904
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.26905
	lw	%a2, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_fast2.2877
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_cont.26906
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.26909
	addi	%v0, %zero, 0
	j	fbgt_cont.26910
fbgt_else.26909:
	addi	%v0, %zero, 1
fbgt_cont.26910:
	beqi	%v0, 0, bnei_cont.26906
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.26906
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
	beqi	%v1, -1, bnei_cont.26906
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
	beqi	%v1, -1, bnei_cont.26906
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
	beqi	%v1, -1, bnei_cont.26906
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
	beqi	%v1, -1, bnei_cont.26906
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
	beqi	%v1, -1, bnei_cont.26906
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
	j	bnei_cont.26906
bnei_else.26923:
bnei_cont.26924:
	j	bnei_cont.26906
bnei_else.26921:
bnei_cont.26922:
	j	bnei_cont.26906
bnei_else.26919:
bnei_cont.26920:
	j	bnei_cont.26906
bnei_else.26917:
bnei_cont.26918:
	j	bnei_cont.26906
bnei_else.26915:
bnei_cont.26916:
	j	bnei_cont.26906
bnei_else.26913:
bnei_cont.26914:
	j	bnei_cont.26906
bnei_else.26911:
bnei_cont.26912:
	j	bnei_cont.26906
bnei_else.26907:
bnei_cont.26908:
	j	bnei_cont.26906
bnei_else.26905:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.26925
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
	beqi	%v1, -1, bnei_cont.26926
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
	beqi	%v1, -1, bnei_cont.26926
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
	beqi	%v1, -1, bnei_cont.26926
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
	beqi	%v1, -1, bnei_cont.26926
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
	beqi	%v1, -1, bnei_cont.26926
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
	j	bnei_cont.26926
bnei_else.26935:
bnei_cont.26936:
	j	bnei_cont.26926
bnei_else.26933:
bnei_cont.26934:
	j	bnei_cont.26926
bnei_else.26931:
bnei_cont.26932:
	j	bnei_cont.26926
bnei_else.26929:
bnei_cont.26930:
	j	bnei_cont.26926
bnei_else.26927:
bnei_cont.26928:
	j	bnei_cont.26926
bnei_else.26925:
bnei_cont.26926:
bnei_cont.26906:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2956
bnei_else.26904:
	jr	%ra
bnei_else.26849:
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
	beqi	%v1, 0, bnei_else.26940
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
	j	bnei_cont.26941
bnei_else.26940:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.26941:
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
	fbne	%f1, %f4, fbeq_else.26942
	addi	%v1, %zero, 1
	j	fbeq_cont.26943
fbeq_else.26942:
	addi	%v1, %zero, 0
fbeq_cont.26943:
	beqi	%v1, 0, bnei_else.26944
	flw	%f1, 474(%zero)
	j	bnei_cont.26945
bnei_else.26944:
	beqi	%v0, 0, bnei_else.26946
	flw	%f4, 458(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.26947
bnei_else.26946:
	flw	%f4, 474(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.26947:
bnei_cont.26945:
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
	beqi	%a0, 1, bnei_else.27048
	beqi	%a0, 2, bnei_else.27049
	beqi	%a0, 3, bnei_else.27050
	beqi	%a0, 4, bnei_else.27051
	jr	%ra
bnei_else.27051:
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
	fblt	%f3, %f4, fbgt_else.27053
	addi	%a0, %zero, 0
	j	fbgt_cont.27054
fbgt_else.27053:
	addi	%a0, %zero, 1
fbgt_cont.27054:
	beqi	%a0, 0, bnei_else.27055
	flw	%f0, 453(%zero)
	j	bnei_cont.27056
bnei_else.27055:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.27057
	addi	%a0, %zero, 1
	j	fbgt_cont.27058
fbgt_else.27057:
	addi	%a0, %zero, 0
fbgt_cont.27058:
	fabs	%f1, %f0
	flw	%f3, 469(%zero)
	fblt	%f1, %f3, fbgt_else.27059
	flw	%f0, 462(%zero)
	fblt	%f1, %f0, fbgt_else.27061
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
	j	fbgt_cont.27062
fbgt_else.27061:
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
fbgt_cont.27062:
	beqi	%a0, 0, bnei_else.27063
	j	fbgt_cont.27060
bnei_else.27063:
	fneg	%f0, %f0
bnei_cont.27064:
	j	fbgt_cont.27060
fbgt_else.27059:
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
fbgt_cont.27060:
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 451(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.27056:
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
	fblt	%f3, %f4, fbgt_else.27065
	addi	%v0, %zero, 0
	j	fbgt_cont.27066
fbgt_else.27065:
	addi	%v0, %zero, 1
fbgt_cont.27066:
	beqi	%v0, 0, bnei_else.27067
	flw	%f1, 453(%zero)
	j	bnei_cont.27068
bnei_else.27067:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 470(%zero)
	fblt	%f1, %f2, fbgt_else.27069
	addi	%v0, %zero, 1
	j	fbgt_cont.27070
fbgt_else.27069:
	addi	%v0, %zero, 0
fbgt_cont.27070:
	fabs	%f2, %f1
	flw	%f3, 469(%zero)
	fblt	%f2, %f3, fbgt_else.27071
	flw	%f1, 462(%zero)
	fblt	%f2, %f1, fbgt_else.27073
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
	j	fbgt_cont.27074
fbgt_else.27073:
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
fbgt_cont.27074:
	beqi	%v0, 0, bnei_else.27075
	j	fbgt_cont.27072
bnei_else.27075:
	fneg	%f1, %f1
bnei_cont.27076:
	j	fbgt_cont.27072
fbgt_else.27071:
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
fbgt_cont.27072:
	flw	%f2, 452(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	fdiv	%f1, %f1, %f2
bnei_cont.27068:
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
	fblt	%f0, %f1, fbgt_else.27077
	addi	%v0, %zero, 0
	j	fbgt_cont.27078
fbgt_else.27077:
	addi	%v0, %zero, 1
fbgt_cont.27078:
	beqi	%v0, 0, bnei_else.27079
	fmov	%f0, %f1
	j	bnei_cont.27080
bnei_else.27079:
bnei_cont.27080:
	flw	%f1, 449(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.27050:
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
	fblt	%f0, %f2, fbgt_else.27082
	flw	%f3, 493(%zero)
	fblt	%f0, %f3, fbgt_else.27084
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.27086
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.27088
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.27090
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.27092
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.27094
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.27096
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.27098
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.27100
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.27102
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.27104
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.27106
	flw	%f3, 481(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.27083
fbgt_else.27106:
	fmov	%f0, %f3
fbgt_cont.27107:
	j	fbgt_cont.27083
fbgt_else.27104:
	fmov	%f0, %f3
fbgt_cont.27105:
	j	fbgt_cont.27083
fbgt_else.27102:
	fmov	%f0, %f3
fbgt_cont.27103:
	j	fbgt_cont.27083
fbgt_else.27100:
	fmov	%f0, %f3
fbgt_cont.27101:
	j	fbgt_cont.27083
fbgt_else.27098:
	fmov	%f0, %f3
fbgt_cont.27099:
	j	fbgt_cont.27083
fbgt_else.27096:
	fmov	%f0, %f3
fbgt_cont.27097:
	j	fbgt_cont.27083
fbgt_else.27094:
	fmov	%f0, %f3
fbgt_cont.27095:
	j	fbgt_cont.27083
fbgt_else.27092:
	fmov	%f0, %f3
fbgt_cont.27093:
	j	fbgt_cont.27083
fbgt_else.27090:
	fmov	%f0, %f3
fbgt_cont.27091:
	j	fbgt_cont.27083
fbgt_else.27088:
	fmov	%f0, %f3
fbgt_cont.27089:
	j	fbgt_cont.27083
fbgt_else.27086:
	fmov	%f0, %f3
fbgt_cont.27087:
	j	fbgt_cont.27083
fbgt_else.27084:
	fmov	%f0, %f3
fbgt_cont.27085:
	j	fbgt_cont.27083
fbgt_else.27082:
	fmov	%f0, %f2
fbgt_cont.27083:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	fblt	%f1, %f2, fbgt_else.27108
	fblt	%f1, %f0, fbgt_else.27110
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
	j	fbgt_cont.27109
fbgt_else.27110:
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
fbgt_cont.27111:
	j	fbgt_cont.27109
fbgt_else.27108:
	fmov	%f0, %f1
fbgt_cont.27109:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.27112
	addi	%v0, %zero, 0
	j	fbgt_cont.27113
fbgt_else.27112:
	addi	%v0, %zero, 1
fbgt_cont.27113:
	fblt	%f0, %f1, fbgt_else.27114
	fsub	%f0, %f0, %f1
	j	fbgt_cont.27115
fbgt_else.27114:
fbgt_cont.27115:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.27116
	beqi	%v0, 0, bnei_else.27118
	addi	%v0, %zero, 0
	j	fbgt_cont.27117
bnei_else.27118:
	addi	%v0, %zero, 1
bnei_cont.27119:
	j	fbgt_cont.27117
fbgt_else.27116:
fbgt_cont.27117:
	fblt	%f0, %f2, fbgt_else.27120
	fsub	%f0, %f1, %f0
	j	fbgt_cont.27121
fbgt_else.27120:
fbgt_cont.27121:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.27122
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
	j	fbgt_cont.27123
fbgt_else.27122:
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
fbgt_cont.27123:
	beqi	%v0, 0, bnei_else.27124
	j	bnei_cont.27125
bnei_else.27124:
	fneg	%f0, %f0
bnei_cont.27125:
	fmul	%f0, %f0, %f0
	flw	%f1, 449(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 474(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.27049:
	flw	%f0, 1(%v1)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 495(%zero)
	flw	%f2, 470(%zero)
	fblt	%f0, %f2, fbgt_else.27127
	addi	%v0, %zero, 1
	j	fbgt_cont.27128
fbgt_else.27127:
	addi	%v0, %zero, 0
fbgt_cont.27128:
	fabs	%f0, %f0
	flw	%f2, 494(%zero)
	sw	%v0, 3(%sp)
	fsw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f2, 6(%sp)
	fblt	%f0, %f2, fbgt_else.27129
	flw	%f3, 493(%zero)
	fblt	%f0, %f3, fbgt_else.27131
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.27133
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.27135
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.27137
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.27139
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.27141
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.27143
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.27145
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.27147
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.27149
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.27151
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.27153
	flw	%f3, 481(%zero)
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	fbgt_cont.27130
fbgt_else.27153:
	fmov	%f0, %f3
fbgt_cont.27154:
	j	fbgt_cont.27130
fbgt_else.27151:
	fmov	%f0, %f3
fbgt_cont.27152:
	j	fbgt_cont.27130
fbgt_else.27149:
	fmov	%f0, %f3
fbgt_cont.27150:
	j	fbgt_cont.27130
fbgt_else.27147:
	fmov	%f0, %f3
fbgt_cont.27148:
	j	fbgt_cont.27130
fbgt_else.27145:
	fmov	%f0, %f3
fbgt_cont.27146:
	j	fbgt_cont.27130
fbgt_else.27143:
	fmov	%f0, %f3
fbgt_cont.27144:
	j	fbgt_cont.27130
fbgt_else.27141:
	fmov	%f0, %f3
fbgt_cont.27142:
	j	fbgt_cont.27130
fbgt_else.27139:
	fmov	%f0, %f3
fbgt_cont.27140:
	j	fbgt_cont.27130
fbgt_else.27137:
	fmov	%f0, %f3
fbgt_cont.27138:
	j	fbgt_cont.27130
fbgt_else.27135:
	fmov	%f0, %f3
fbgt_cont.27136:
	j	fbgt_cont.27130
fbgt_else.27133:
	fmov	%f0, %f3
fbgt_cont.27134:
	j	fbgt_cont.27130
fbgt_else.27131:
	fmov	%f0, %f3
fbgt_cont.27132:
	j	fbgt_cont.27130
fbgt_else.27129:
	fmov	%f0, %f2
fbgt_cont.27130:
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	fblt	%f1, %f2, fbgt_else.27155
	fblt	%f1, %f0, fbgt_else.27157
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
	j	fbgt_cont.27156
fbgt_else.27157:
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
fbgt_cont.27158:
	j	fbgt_cont.27156
fbgt_else.27155:
	fmov	%f0, %f1
fbgt_cont.27156:
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.27159
	lw	%v0, 3(%sp)
	beqi	%v0, 0, bnei_else.27161
	addi	%v0, %zero, 0
	j	fbgt_cont.27160
bnei_else.27161:
	addi	%v0, %zero, 1
bnei_cont.27162:
	j	fbgt_cont.27160
fbgt_else.27159:
	lw	%v0, 3(%sp)
fbgt_cont.27160:
	fblt	%f0, %f1, fbgt_else.27163
	fsub	%f0, %f0, %f1
	j	fbgt_cont.27164
fbgt_else.27163:
fbgt_cont.27164:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.27165
	fsub	%f0, %f1, %f0
	j	fbgt_cont.27166
fbgt_else.27165:
fbgt_cont.27166:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.27167
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
	j	fbgt_cont.27168
fbgt_else.27167:
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
fbgt_cont.27168:
	beqi	%v0, 0, bnei_else.27169
	j	bnei_cont.27170
bnei_else.27169:
	fneg	%f0, %f0
bnei_cont.27170:
	fmul	%f0, %f0, %f0
	flw	%f1, 449(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 474(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.27048:
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
	fblt	%f0, %f2, fbgt_else.27172
	addi	%a0, %zero, 0
	j	fbgt_cont.27173
fbgt_else.27172:
	addi	%a0, %zero, 1
fbgt_cont.27173:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f4, 2(%v0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.27174
	addi	%v0, %zero, 0
	j	fbgt_cont.27175
fbgt_else.27174:
	addi	%v0, %zero, 1
fbgt_cont.27175:
	beqi	%a0, 0, bnei_else.27176
	beqi	%v0, 0, bnei_else.27178
	flw	%f0, 449(%zero)
	j	bnei_cont.27177
bnei_else.27178:
	flw	%f0, 470(%zero)
bnei_cont.27179:
	j	bnei_cont.27177
bnei_else.27176:
	beqi	%v0, 0, bnei_else.27180
	flw	%f0, 470(%zero)
	j	bnei_cont.27181
bnei_else.27180:
	flw	%f0, 449(%zero)
bnei_cont.27181:
bnei_cont.27177:
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2978:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.27193
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
	fblt	%f1, %f0, fbgt_else.27194
	addi	%v0, %zero, 0
	j	fbgt_cont.27195
fbgt_else.27194:
	addi	%v0, %zero, 1
fbgt_cont.27195:
	beqi	%v0, 0, bnei_else.27196
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27198
	addi	%v0, %zero, 0
	j	bnei_cont.27197
fbgt_else.27198:
	addi	%v0, %zero, 1
fbgt_cont.27199:
	j	bnei_cont.27197
bnei_else.27196:
	addi	%v0, %zero, 0
bnei_cont.27197:
	beqi	%v0, 0, bnei_else.27200
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, bnei_cont.27201
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.27204
	j	bnei_cont.27201
bnei_else.27204:
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
	fblt	%f3, %f0, fbgt_else.27206
	addi	%v0, %zero, 0
	j	fbgt_cont.27207
fbgt_else.27206:
	addi	%v0, %zero, 1
fbgt_cont.27207:
	beqi	%v0, 0, bnei_else.27208
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
	j	bnei_cont.27209
bnei_else.27208:
bnei_cont.27209:
	fblt	%f3, %f1, fbgt_else.27210
	addi	%v0, %zero, 0
	j	fbgt_cont.27211
fbgt_else.27210:
	addi	%v0, %zero, 1
fbgt_cont.27211:
	beqi	%v0, 0, bnei_cont.27201
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
	j	bnei_cont.27201
bnei_else.27212:
bnei_cont.27213:
bnei_cont.27205:
	j	bnei_cont.27201
beq_else.27202:
beq_cont.27203:
	j	bnei_cont.27201
bnei_else.27200:
bnei_cont.27201:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2978
bgti_else.27193:
	jr	%ra
trace_ray.2983:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.27263
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
	fblt	%f1, %f0, fbgt_else.27264
	addi	%v0, %zero, 0
	j	fbgt_cont.27265
fbgt_else.27264:
	addi	%v0, %zero, 1
fbgt_cont.27265:
	beqi	%v0, 0, bnei_else.27266
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27268
	addi	%v0, %zero, 0
	j	bnei_cont.27267
fbgt_else.27268:
	addi	%v0, %zero, 1
fbgt_cont.27269:
	j	bnei_cont.27267
bnei_else.27266:
	addi	%v0, %zero, 0
bnei_cont.27267:
	beqi	%v0, 0, bnei_else.27270
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
	beqi	%a1, 1, bnei_else.27271
	beqi	%a1, 2, bnei_else.27273
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	get_nvector_second.2966
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.27272
bnei_else.27273:
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
bnei_cont.27274:
	j	bnei_cont.27272
bnei_else.27271:
	lw	%a1, 136(%zero)
	flw	%f3, 470(%zero)
	fsw	%f3, 142(%zero)
	fsw	%f3, 143(%zero)
	fsw	%f3, 144(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.27275
	addi	%t0, %zero, 1
	j	fbeq_cont.27276
fbeq_else.27275:
	addi	%t0, %zero, 0
fbeq_cont.27276:
	beqi	%t0, 0, bnei_else.27277
	j	bnei_cont.27278
bnei_else.27277:
	fblt	%f3, %f4, fbgt_else.27279
	addi	%t0, %zero, 0
	j	fbgt_cont.27280
fbgt_else.27279:
	addi	%t0, %zero, 1
fbgt_cont.27280:
	beqi	%t0, 0, bnei_else.27281
	flw	%f3, 474(%zero)
	j	bnei_cont.27282
bnei_else.27281:
	flw	%f3, 458(%zero)
bnei_cont.27282:
bnei_cont.27278:
	fneg	%f3, %f3
	fsw	%f3, 142(%a1)
bnei_cont.27272:
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
	fblt	%f3, %f4, fbgt_else.27283
	addi	%a3, %zero, 0
	j	fbgt_cont.27284
fbgt_else.27283:
	addi	%a3, %zero, 1
fbgt_cont.27284:
	beqi	%a3, 0, bnei_else.27285
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.27286
bnei_else.27285:
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
bnei_cont.27286:
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
	beqi	%v0, 0, bnei_else.27287
	j	bnei_cont.27288
bnei_else.27287:
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
	fblt	%f2, %f1, fbgt_else.27289
	addi	%v1, %zero, 0
	j	fbgt_cont.27290
fbgt_else.27289:
	addi	%v1, %zero, 1
fbgt_cont.27290:
	beqi	%v1, 0, bnei_else.27291
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
	j	bnei_cont.27292
bnei_else.27291:
bnei_cont.27292:
	fblt	%f2, %f0, fbgt_else.27293
	addi	%v1, %zero, 0
	j	fbgt_cont.27294
fbgt_else.27293:
	addi	%v1, %zero, 1
fbgt_cont.27294:
	beqi	%v1, 0, bnei_else.27295
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
	j	bnei_cont.27296
bnei_else.27295:
bnei_cont.27296:
bnei_cont.27288:
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
	fblt	%f0, %f1, fbgt_else.27297
	addi	%v0, %zero, 0
	j	fbgt_cont.27298
fbgt_else.27297:
	addi	%v0, %zero, 1
fbgt_cont.27298:
	beqi	%v0, 0, bnei_else.27299
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.27300
	j	bgti_cont.27301
bgti_else.27300:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.27301:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.27302
	jr	%ra
bnei_else.27302:
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
bnei_else.27299:
	jr	%ra
bnei_else.27270:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.27305
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
	fblt	%f1, %f0, fbgt_else.27306
	addi	%v0, %zero, 0
	j	fbgt_cont.27307
fbgt_else.27306:
	addi	%v0, %zero, 1
fbgt_cont.27307:
	beqi	%v0, 0, bnei_else.27308
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
bnei_else.27308:
	jr	%ra
bnei_else.27305:
	jr	%ra
bgt_else.27263:
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
	fblt	%f1, %f0, fbgt_else.27322
	addi	%v0, %zero, 0
	j	fbgt_cont.27323
fbgt_else.27322:
	addi	%v0, %zero, 1
fbgt_cont.27323:
	beqi	%v0, 0, bnei_else.27324
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27326
	addi	%v0, %zero, 0
	j	bnei_cont.27325
fbgt_else.27326:
	addi	%v0, %zero, 1
fbgt_cont.27327:
	j	bnei_cont.27325
bnei_else.27324:
	addi	%v0, %zero, 0
bnei_cont.27325:
	beqi	%v0, 0, bnei_else.27328
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 4(%sp)
	beqi	%a0, 1, bnei_else.27329
	beqi	%a0, 2, bnei_else.27331
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	get_nvector_second.2966
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.27330
bnei_else.27331:
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
bnei_cont.27332:
	j	bnei_cont.27330
bnei_else.27329:
	lw	%a0, 136(%zero)
	flw	%f0, 470(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.27333
	addi	%v1, %zero, 1
	j	fbeq_cont.27334
fbeq_else.27333:
	addi	%v1, %zero, 0
fbeq_cont.27334:
	beqi	%v1, 0, bnei_else.27335
	j	bnei_cont.27336
bnei_else.27335:
	fblt	%f0, %f1, fbgt_else.27337
	addi	%v1, %zero, 0
	j	fbgt_cont.27338
fbgt_else.27337:
	addi	%v1, %zero, 1
fbgt_cont.27338:
	beqi	%v1, 0, bnei_else.27339
	flw	%f0, 474(%zero)
	j	bnei_cont.27340
bnei_else.27339:
	flw	%f0, 458(%zero)
bnei_cont.27340:
bnei_cont.27336:
	fneg	%f0, %f0
	fsw	%f0, 142(%a0)
bnei_cont.27330:
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
	beqi	%v0, 0, bnei_else.27341
	jr	%ra
bnei_else.27341:
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
	fblt	%f1, %f0, fbgt_else.27343
	addi	%v0, %zero, 0
	j	fbgt_cont.27344
fbgt_else.27343:
	addi	%v0, %zero, 1
fbgt_cont.27344:
	beqi	%v0, 0, bnei_else.27345
	j	bnei_cont.27346
bnei_else.27345:
	fmov	%f0, %f1
bnei_cont.27346:
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
bnei_else.27328:
	jr	%ra
iter_trace_diffuse_rays.2992:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.27554
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
	fblt	%f0, %f2, fbgt_else.27555
	addi	%t0, %zero, 0
	j	fbgt_cont.27556
fbgt_else.27555:
	addi	%t0, %zero, 1
fbgt_cont.27556:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f4, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	beqi	%t0, 0, bnei_else.27557
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
	beqi	%t3, -1, bnei_else.27559
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.27561
	sw	%t2, 13(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solver_fast2.2877
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_cont.27562
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.27565
	addi	%v0, %zero, 0
	j	fbgt_cont.27566
fbgt_else.27565:
	addi	%v0, %zero, 1
fbgt_cont.27566:
	beqi	%v0, 0, bnei_cont.27562
	lw	%v0, 13(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.27562
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
	beqi	%v1, -1, bnei_cont.27562
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
	beqi	%v1, -1, bnei_cont.27562
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
	beqi	%v1, -1, bnei_cont.27562
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
	j	bnei_cont.27562
bnei_else.27575:
bnei_cont.27576:
	j	bnei_cont.27562
bnei_else.27573:
bnei_cont.27574:
	j	bnei_cont.27562
bnei_else.27571:
bnei_cont.27572:
	j	bnei_cont.27562
bnei_else.27569:
bnei_cont.27570:
	j	bnei_cont.27562
bnei_else.27567:
bnei_cont.27568:
	j	bnei_cont.27562
bnei_else.27563:
bnei_cont.27564:
	j	bnei_cont.27562
bnei_else.27561:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.27577
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
	beqi	%v1, -1, bnei_cont.27578
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
	beqi	%v1, -1, bnei_cont.27578
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
	beqi	%v1, -1, bnei_cont.27578
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
	j	bnei_cont.27578
bnei_else.27583:
bnei_cont.27584:
	j	bnei_cont.27578
bnei_else.27581:
bnei_cont.27582:
	j	bnei_cont.27578
bnei_else.27579:
bnei_cont.27580:
	j	bnei_cont.27578
bnei_else.27577:
bnei_cont.27578:
bnei_cont.27562:
	lw	%v0, 12(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.27560
bnei_else.27559:
bnei_cont.27560:
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)
	fblt	%f1, %f0, fbgt_else.27585
	addi	%v0, %zero, 0
	j	fbgt_cont.27586
fbgt_else.27585:
	addi	%v0, %zero, 1
fbgt_cont.27586:
	beqi	%v0, 0, bnei_else.27587
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27589
	addi	%v0, %zero, 0
	j	bnei_cont.27588
fbgt_else.27589:
	addi	%v0, %zero, 1
fbgt_cont.27590:
	j	bnei_cont.27588
bnei_else.27587:
	addi	%v0, %zero, 0
bnei_cont.27588:
	beqi	%v0, 0, bnei_cont.27558
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 14(%sp)
	beqi	%a0, 1, bnei_else.27593
	beqi	%a0, 2, bnei_else.27595
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	get_nvector_second.2966
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.27594
bnei_else.27595:
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
bnei_cont.27596:
	j	bnei_cont.27594
bnei_else.27593:
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.27597
	addi	%v1, %zero, 1
	j	fbeq_cont.27598
fbeq_else.27597:
	addi	%v1, %zero, 0
fbeq_cont.27598:
	beqi	%v1, 0, bnei_else.27599
	fmov	%f1, %f0
	j	bnei_cont.27600
bnei_else.27599:
	fblt	%f0, %f1, fbgt_else.27601
	addi	%v1, %zero, 0
	j	fbgt_cont.27602
fbgt_else.27601:
	addi	%v1, %zero, 1
fbgt_cont.27602:
	beqi	%v1, 0, bnei_else.27603
	flw	%f1, 474(%zero)
	j	bnei_cont.27604
bnei_else.27603:
	flw	%f1, 458(%zero)
bnei_cont.27604:
bnei_cont.27600:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.27594:
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
	beqi	%v0, 0, bnei_else.27605
	j	bnei_cont.27558
bnei_else.27605:
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
	fblt	%f1, %f0, fbgt_else.27607
	addi	%v0, %zero, 0
	j	fbgt_cont.27608
fbgt_else.27607:
	addi	%v0, %zero, 1
fbgt_cont.27608:
	beqi	%v0, 0, bnei_else.27609
	j	bnei_cont.27610
bnei_else.27609:
	fmov	%f0, %f1
bnei_cont.27610:
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
bnei_cont.27606:
	j	bnei_cont.27558
bnei_else.27591:
bnei_cont.27592:
	j	bnei_cont.27558
bnei_else.27557:
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
	beqi	%t3, -1, bnei_else.27611
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.27613
	sw	%t2, 18(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solver_fast2.2877
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	beqi	%v0, 0, bnei_cont.27614
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.27617
	addi	%v0, %zero, 0
	j	fbgt_cont.27618
fbgt_else.27617:
	addi	%v0, %zero, 1
fbgt_cont.27618:
	beqi	%v0, 0, bnei_cont.27614
	lw	%v0, 18(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_cont.27614
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
	beqi	%v1, -1, bnei_cont.27614
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
	beqi	%v1, -1, bnei_cont.27614
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
	beqi	%v1, -1, bnei_cont.27614
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
	j	bnei_cont.27614
bnei_else.27627:
bnei_cont.27628:
	j	bnei_cont.27614
bnei_else.27625:
bnei_cont.27626:
	j	bnei_cont.27614
bnei_else.27623:
bnei_cont.27624:
	j	bnei_cont.27614
bnei_else.27621:
bnei_cont.27622:
	j	bnei_cont.27614
bnei_else.27619:
bnei_cont.27620:
	j	bnei_cont.27614
bnei_else.27615:
bnei_cont.27616:
	j	bnei_cont.27614
bnei_else.27613:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.27629
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
	beqi	%v1, -1, bnei_cont.27630
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
	beqi	%v1, -1, bnei_cont.27630
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
	beqi	%v1, -1, bnei_cont.27630
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
	j	bnei_cont.27630
bnei_else.27635:
bnei_cont.27636:
	j	bnei_cont.27630
bnei_else.27633:
bnei_cont.27634:
	j	bnei_cont.27630
bnei_else.27631:
bnei_cont.27632:
	j	bnei_cont.27630
bnei_else.27629:
bnei_cont.27630:
bnei_cont.27614:
	lw	%v0, 12(%sp)
	lw	%v1, 16(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.27612
bnei_else.27611:
bnei_cont.27612:
	flw	%f0, 137(%zero)
	flw	%f1, 455(%zero)
	fblt	%f1, %f0, fbgt_else.27637
	addi	%v0, %zero, 0
	j	fbgt_cont.27638
fbgt_else.27637:
	addi	%v0, %zero, 1
fbgt_cont.27638:
	beqi	%v0, 0, bnei_else.27639
	flw	%f1, 442(%zero)
	fblt	%f0, %f1, fbgt_else.27641
	addi	%v0, %zero, 0
	j	bnei_cont.27640
fbgt_else.27641:
	addi	%v0, %zero, 1
fbgt_cont.27642:
	j	bnei_cont.27640
bnei_else.27639:
	addi	%v0, %zero, 0
bnei_cont.27640:
	beqi	%v0, 0, bnei_else.27643
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 17(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 19(%sp)
	beqi	%a0, 1, bnei_else.27645
	beqi	%a0, 2, bnei_else.27647
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	get_nvector_second.2966
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bnei_cont.27646
bnei_else.27647:
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
bnei_cont.27648:
	j	bnei_cont.27646
bnei_else.27645:
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.27649
	addi	%v1, %zero, 1
	j	fbeq_cont.27650
fbeq_else.27649:
	addi	%v1, %zero, 0
fbeq_cont.27650:
	beqi	%v1, 0, bnei_else.27651
	fmov	%f1, %f0
	j	bnei_cont.27652
bnei_else.27651:
	fblt	%f0, %f1, fbgt_else.27653
	addi	%v1, %zero, 0
	j	fbgt_cont.27654
fbgt_else.27653:
	addi	%v1, %zero, 1
fbgt_cont.27654:
	beqi	%v1, 0, bnei_else.27655
	flw	%f1, 474(%zero)
	j	bnei_cont.27656
bnei_else.27655:
	flw	%f1, 458(%zero)
bnei_cont.27656:
bnei_cont.27652:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.27646:
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
	beqi	%v0, 0, bnei_else.27657
	j	bnei_cont.27644
bnei_else.27657:
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
	fblt	%f1, %f0, fbgt_else.27659
	addi	%v0, %zero, 0
	j	fbgt_cont.27660
fbgt_else.27659:
	addi	%v0, %zero, 1
fbgt_cont.27660:
	beqi	%v0, 0, bnei_else.27661
	j	bnei_cont.27662
bnei_else.27661:
	fmov	%f0, %f1
bnei_cont.27662:
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
bnei_cont.27658:
	j	bnei_cont.27644
bnei_else.27643:
bnei_cont.27644:
bnei_cont.27558:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.27663
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
	fblt	%f0, %f1, fbgt_else.27664
	addi	%a1, %zero, 0
	j	fbgt_cont.27665
fbgt_else.27664:
	addi	%a1, %zero, 1
fbgt_cont.27665:
	sw	%v0, 20(%sp)
	beqi	%a1, 0, bnei_else.27666
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
	j	bnei_cont.27667
bnei_else.27666:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
bnei_cont.27667:
	lw	%v0, 20(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2992
bgti_else.27663:
	jr	%ra
bgti_else.27554:
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
	beqi	%v0, 0, bnei_else.27772
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
	fblt	%f0, %f1, fbgt_else.27774
	addi	%a0, %zero, 0
	j	fbgt_cont.27775
fbgt_else.27774:
	addi	%a0, %zero, 1
fbgt_cont.27775:
	beqi	%a0, 0, bnei_else.27776
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.27777
bnei_else.27776:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.27777:
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.27773
bnei_else.27772:
bnei_cont.27773:
	lw	%v0, 4(%sp)
	beqi	%v0, 1, bnei_else.27778
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
	fblt	%f0, %f1, fbgt_else.27780
	addi	%a0, %zero, 0
	j	fbgt_cont.27781
fbgt_else.27780:
	addi	%a0, %zero, 1
fbgt_cont.27781:
	beqi	%a0, 0, bnei_else.27782
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.27783
bnei_else.27782:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.27783:
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.27779
bnei_else.27778:
bnei_cont.27779:
	lw	%v0, 4(%sp)
	beqi	%v0, 2, bnei_else.27784
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
	fblt	%f0, %f1, fbgt_else.27786
	addi	%a0, %zero, 0
	j	fbgt_cont.27787
fbgt_else.27786:
	addi	%a0, %zero, 1
fbgt_cont.27787:
	beqi	%a0, 0, bnei_else.27788
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.27789
bnei_else.27788:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.27789:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.27785
bnei_else.27784:
bnei_cont.27785:
	lw	%v0, 4(%sp)
	beqi	%v0, 3, bnei_else.27790
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
	fblt	%f0, %f1, fbgt_else.27792
	addi	%a0, %zero, 0
	j	fbgt_cont.27793
fbgt_else.27792:
	addi	%a0, %zero, 1
fbgt_cont.27793:
	beqi	%a0, 0, bnei_else.27794
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.27795
bnei_else.27794:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.27795:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.27791
bnei_else.27790:
bnei_cont.27791:
	lw	%v0, 4(%sp)
	beqi	%v0, 4, bnei_else.27796
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
	fblt	%f0, %f1, fbgt_else.27798
	addi	%a0, %zero, 0
	j	fbgt_cont.27799
fbgt_else.27798:
	addi	%a0, %zero, 1
fbgt_cont.27799:
	beqi	%a0, 0, bnei_else.27800
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.27801
bnei_else.27800:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.27801:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.27797
bnei_else.27796:
bnei_cont.27797:
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
	blt	%at, %v1, bgt_else.27861
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.27862
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.27863
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
	beqi	%a0, 0, bnei_else.27865
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
	j	bnei_cont.27866
bnei_else.27865:
bnei_cont.27866:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.27867
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
	j	bnei_cont.27868
bnei_else.27867:
bnei_cont.27868:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.27869
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
	j	bnei_cont.27870
bnei_else.27869:
bnei_cont.27870:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.27871
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
	j	bnei_cont.27872
bnei_else.27871:
bnei_cont.27872:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.27873
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
	j	bnei_cont.27874
bnei_else.27873:
bnei_cont.27874:
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
	j	bnei_cont.27864
bnei_else.27863:
bnei_cont.27864:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.27875
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.27876
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 11(%sp)
	beqi	%a0, 0, bnei_else.27877
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	calc_diffuse_using_1point.3005
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.27878
bnei_else.27877:
bnei_cont.27878:
	lw	%v0, 11(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3014
bgti_else.27876:
	jr	%ra
bgt_else.27875:
	jr	%ra
bgti_else.27862:
	jr	%ra
bgt_else.27861:
	jr	%ra
try_exploit_neighbors.3030:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.27900
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.27901
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.27902
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.27904
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.27906
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.27908
	addi	%t1, %zero, 1
	j	beq_cont.27903
beq_else.27908:
	addi	%t1, %zero, 0
beq_cont.27909:
	j	beq_cont.27903
beq_else.27906:
	addi	%t1, %zero, 0
beq_cont.27907:
	j	beq_cont.27903
beq_else.27904:
	addi	%t1, %zero, 0
beq_cont.27905:
	j	beq_cont.27903
beq_else.27902:
	addi	%t1, %zero, 0
beq_cont.27903:
	beqi	%t1, 0, bnei_else.27910
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.27911
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
	j	bnei_cont.27912
bnei_else.27911:
bnei_cont.27912:
	addi	%a3, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.27913
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.27914
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.27915
	add	%at, %a2, %v0
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.27917
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.27919
	addi	%t2, %v0, 1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 2(%t2)
	add	%at, %t2, %a3
	lw	%t2, 0(%at)
	bne	%t2, %t1, beq_else.27921
	addi	%t1, %zero, 1
	j	beq_cont.27916
beq_else.27921:
	addi	%t1, %zero, 0
beq_cont.27922:
	j	beq_cont.27916
beq_else.27919:
	addi	%t1, %zero, 0
beq_cont.27920:
	j	beq_cont.27916
beq_else.27917:
	addi	%t1, %zero, 0
beq_cont.27918:
	j	beq_cont.27916
beq_else.27915:
	addi	%t1, %zero, 0
beq_cont.27916:
	beqi	%t1, 0, bnei_else.27923
	lw	%t0, 3(%t0)
	add	%at, %t0, %a3
	lw	%t0, 0(%at)
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%a3, 5(%sp)
	beqi	%t0, 0, bnei_else.27924
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_5points.3008
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.27925
bnei_else.27924:
bnei_cont.27925:
	lw	%v0, 5(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	j	try_exploit_neighbors.3030
bnei_else.27923:
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	j	do_without_neighbors.3014
bgti_else.27914:
	jr	%ra
bgt_else.27913:
	jr	%ra
bnei_else.27910:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.27928
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.27929
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 6(%sp)
	sw	%a3, 7(%sp)
	beqi	%v0, 0, bnei_else.27930
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_diffuse_using_1point.3005
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.27931
bnei_else.27930:
bnei_cont.27931:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 6(%sp)
	j	do_without_neighbors.3014
bgti_else.27929:
	jr	%ra
bgt_else.27928:
	jr	%ra
bgti_else.27901:
	jr	%ra
bgt_else.27900:
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
	blti	%v0, 10, bgti_else.29983
	blti	%v0, 20, bgti_else.29985
	blti	%v0, 30, bgti_else.29987
	blti	%v0, 40, bgti_else.29989
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.29991
	blti	%v1, 20, bgti_else.29993
	blti	%v1, 30, bgti_else.29995
	blti	%v1, 40, bgti_else.29997
	addi	%v1, %v1, -40
	addi	%a0, %zero, 8
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub1.2641
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.29984
bgti_else.29997:
	addi	%v0, %zero, 7
bgti_cont.29998:
	j	bgti_cont.29984
bgti_else.29995:
	addi	%v0, %zero, 6
bgti_cont.29996:
	j	bgti_cont.29984
bgti_else.29993:
	addi	%v0, %zero, 5
bgti_cont.29994:
	j	bgti_cont.29984
bgti_else.29991:
	addi	%v0, %zero, 4
bgti_cont.29992:
	j	bgti_cont.29984
bgti_else.29989:
	addi	%v0, %zero, 3
bgti_cont.29990:
	j	bgti_cont.29984
bgti_else.29987:
	addi	%v0, %zero, 2
bgti_cont.29988:
	j	bgti_cont.29984
bgti_else.29985:
	addi	%v0, %zero, 1
bgti_cont.29986:
	j	bgti_cont.29984
bgti_else.29983:
	addi	%v0, %zero, 0
bgti_cont.29984:
	lw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.29999
	blti	%v1, 20, bgti_else.30001
	blti	%v1, 30, bgti_else.30003
	blti	%v1, 40, bgti_else.30005
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30007
	blti	%v1, 20, bgti_else.30009
	blti	%v1, 30, bgti_else.30011
	blti	%v1, 40, bgti_else.30013
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30015
	blti	%v1, 20, bgti_else.30017
	blti	%v1, 30, bgti_else.30019
	blti	%v1, 40, bgti_else.30021
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30023
	blti	%v1, 20, bgti_else.30025
	blti	%v1, 30, bgti_else.30027
	blti	%v1, 40, bgti_else.30029
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30031
	blti	%v1, 20, bgti_else.30033
	blti	%v1, 30, bgti_else.30035
	blti	%v1, 40, bgti_else.30037
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30039
	blti	%v1, 20, bgti_else.30041
	blti	%v1, 30, bgti_else.30043
	blti	%v1, 40, bgti_else.30045
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub2.2644
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.30000
bgti_else.30045:
	addi	%v0, %v1, -30
bgti_cont.30046:
	j	bgti_cont.30000
bgti_else.30043:
	addi	%v0, %v1, -20
bgti_cont.30044:
	j	bgti_cont.30000
bgti_else.30041:
	addi	%v0, %v1, -10
bgti_cont.30042:
	j	bgti_cont.30000
bgti_else.30039:
	add	%v0, %zero, %v1
bgti_cont.30040:
	j	bgti_cont.30000
bgti_else.30037:
	addi	%v0, %v1, -30
bgti_cont.30038:
	j	bgti_cont.30000
bgti_else.30035:
	addi	%v0, %v1, -20
bgti_cont.30036:
	j	bgti_cont.30000
bgti_else.30033:
	addi	%v0, %v1, -10
bgti_cont.30034:
	j	bgti_cont.30000
bgti_else.30031:
	add	%v0, %zero, %v1
bgti_cont.30032:
	j	bgti_cont.30000
bgti_else.30029:
	addi	%v0, %v1, -30
bgti_cont.30030:
	j	bgti_cont.30000
bgti_else.30027:
	addi	%v0, %v1, -20
bgti_cont.30028:
	j	bgti_cont.30000
bgti_else.30025:
	addi	%v0, %v1, -10
bgti_cont.30026:
	j	bgti_cont.30000
bgti_else.30023:
	add	%v0, %zero, %v1
bgti_cont.30024:
	j	bgti_cont.30000
bgti_else.30021:
	addi	%v0, %v1, -30
bgti_cont.30022:
	j	bgti_cont.30000
bgti_else.30019:
	addi	%v0, %v1, -20
bgti_cont.30020:
	j	bgti_cont.30000
bgti_else.30017:
	addi	%v0, %v1, -10
bgti_cont.30018:
	j	bgti_cont.30000
bgti_else.30015:
	add	%v0, %zero, %v1
bgti_cont.30016:
	j	bgti_cont.30000
bgti_else.30013:
	addi	%v0, %v1, -30
bgti_cont.30014:
	j	bgti_cont.30000
bgti_else.30011:
	addi	%v0, %v1, -20
bgti_cont.30012:
	j	bgti_cont.30000
bgti_else.30009:
	addi	%v0, %v1, -10
bgti_cont.30010:
	j	bgti_cont.30000
bgti_else.30007:
	add	%v0, %zero, %v1
bgti_cont.30008:
	j	bgti_cont.30000
bgti_else.30005:
	addi	%v0, %v1, -30
bgti_cont.30006:
	j	bgti_cont.30000
bgti_else.30003:
	addi	%v0, %v1, -20
bgti_cont.30004:
	j	bgti_cont.30000
bgti_else.30001:
	addi	%v0, %v1, -10
bgti_cont.30002:
	j	bgti_cont.30000
bgti_else.29999:
	add	%v0, %zero, %v1
bgti_cont.30000:
	lw	%v1, 2(%sp)
	blt	%zero, %v1, bgt_else.30047
	addi	%v0, %v0, 48
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgt_cont.30048
bgt_else.30047:
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.30049
	blti	%v1, 20, bgti_else.30051
	blti	%v1, 30, bgti_else.30053
	blti	%v1, 40, bgti_else.30055
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.30057
	blti	%a0, 20, bgti_else.30059
	blti	%a0, 30, bgti_else.30061
	blti	%a0, 40, bgti_else.30063
	addi	%a0, %a0, -40
	addi	%a1, %zero, 8
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub1.2641
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.30050
bgti_else.30063:
	addi	%v0, %zero, 7
bgti_cont.30064:
	j	bgti_cont.30050
bgti_else.30061:
	addi	%v0, %zero, 6
bgti_cont.30062:
	j	bgti_cont.30050
bgti_else.30059:
	addi	%v0, %zero, 5
bgti_cont.30060:
	j	bgti_cont.30050
bgti_else.30057:
	addi	%v0, %zero, 4
bgti_cont.30058:
	j	bgti_cont.30050
bgti_else.30055:
	addi	%v0, %zero, 3
bgti_cont.30056:
	j	bgti_cont.30050
bgti_else.30053:
	addi	%v0, %zero, 2
bgti_cont.30054:
	j	bgti_cont.30050
bgti_else.30051:
	addi	%v0, %zero, 1
bgti_cont.30052:
	j	bgti_cont.30050
bgti_else.30049:
	addi	%v0, %zero, 0
bgti_cont.30050:
	lw	%v1, 2(%sp)
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.30065
	blti	%v1, 20, bgti_else.30067
	blti	%v1, 30, bgti_else.30069
	blti	%v1, 40, bgti_else.30071
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30073
	blti	%v1, 20, bgti_else.30075
	blti	%v1, 30, bgti_else.30077
	blti	%v1, 40, bgti_else.30079
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30081
	blti	%v1, 20, bgti_else.30083
	blti	%v1, 30, bgti_else.30085
	blti	%v1, 40, bgti_else.30087
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30089
	blti	%v1, 20, bgti_else.30091
	blti	%v1, 30, bgti_else.30093
	blti	%v1, 40, bgti_else.30095
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30097
	blti	%v1, 20, bgti_else.30099
	blti	%v1, 30, bgti_else.30101
	blti	%v1, 40, bgti_else.30103
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30105
	blti	%v1, 20, bgti_else.30107
	blti	%v1, 30, bgti_else.30109
	blti	%v1, 40, bgti_else.30111
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2644
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.30066
bgti_else.30111:
	addi	%v0, %v1, -30
bgti_cont.30112:
	j	bgti_cont.30066
bgti_else.30109:
	addi	%v0, %v1, -20
bgti_cont.30110:
	j	bgti_cont.30066
bgti_else.30107:
	addi	%v0, %v1, -10
bgti_cont.30108:
	j	bgti_cont.30066
bgti_else.30105:
	add	%v0, %zero, %v1
bgti_cont.30106:
	j	bgti_cont.30066
bgti_else.30103:
	addi	%v0, %v1, -30
bgti_cont.30104:
	j	bgti_cont.30066
bgti_else.30101:
	addi	%v0, %v1, -20
bgti_cont.30102:
	j	bgti_cont.30066
bgti_else.30099:
	addi	%v0, %v1, -10
bgti_cont.30100:
	j	bgti_cont.30066
bgti_else.30097:
	add	%v0, %zero, %v1
bgti_cont.30098:
	j	bgti_cont.30066
bgti_else.30095:
	addi	%v0, %v1, -30
bgti_cont.30096:
	j	bgti_cont.30066
bgti_else.30093:
	addi	%v0, %v1, -20
bgti_cont.30094:
	j	bgti_cont.30066
bgti_else.30091:
	addi	%v0, %v1, -10
bgti_cont.30092:
	j	bgti_cont.30066
bgti_else.30089:
	add	%v0, %zero, %v1
bgti_cont.30090:
	j	bgti_cont.30066
bgti_else.30087:
	addi	%v0, %v1, -30
bgti_cont.30088:
	j	bgti_cont.30066
bgti_else.30085:
	addi	%v0, %v1, -20
bgti_cont.30086:
	j	bgti_cont.30066
bgti_else.30083:
	addi	%v0, %v1, -10
bgti_cont.30084:
	j	bgti_cont.30066
bgti_else.30081:
	add	%v0, %zero, %v1
bgti_cont.30082:
	j	bgti_cont.30066
bgti_else.30079:
	addi	%v0, %v1, -30
bgti_cont.30080:
	j	bgti_cont.30066
bgti_else.30077:
	addi	%v0, %v1, -20
bgti_cont.30078:
	j	bgti_cont.30066
bgti_else.30075:
	addi	%v0, %v1, -10
bgti_cont.30076:
	j	bgti_cont.30066
bgti_else.30073:
	add	%v0, %zero, %v1
bgti_cont.30074:
	j	bgti_cont.30066
bgti_else.30071:
	addi	%v0, %v1, -30
bgti_cont.30072:
	j	bgti_cont.30066
bgti_else.30069:
	addi	%v0, %v1, -20
bgti_cont.30070:
	j	bgti_cont.30066
bgti_else.30067:
	addi	%v0, %v1, -10
bgti_cont.30068:
	j	bgti_cont.30066
bgti_else.30065:
	add	%v0, %zero, %v1
bgti_cont.30066:
	lw	%v1, 4(%sp)
	blt	%zero, %v1, bgt_else.30113
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
	j	bgt_cont.30114
bgt_else.30113:
	sw	%v0, 5(%sp)
	blti	%v1, 10, bgti_else.30115
	blti	%v1, 20, bgti_else.30117
	blti	%v1, 30, bgti_else.30119
	blti	%v1, 40, bgti_else.30121
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30123
	blti	%v1, 20, bgti_else.30125
	blti	%v1, 30, bgti_else.30127
	blti	%v1, 40, bgti_else.30129
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30131
	blti	%v1, 20, bgti_else.30133
	blti	%v1, 30, bgti_else.30135
	blti	%v1, 40, bgti_else.30137
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30139
	blti	%v1, 20, bgti_else.30141
	blti	%v1, 30, bgti_else.30143
	blti	%v1, 40, bgti_else.30145
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30147
	blti	%v1, 20, bgti_else.30149
	blti	%v1, 30, bgti_else.30151
	blti	%v1, 40, bgti_else.30153
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30155
	blti	%v1, 20, bgti_else.30157
	blti	%v1, 30, bgti_else.30159
	blti	%v1, 40, bgti_else.30161
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	print_int_sub2.2644
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.30116
bgti_else.30161:
	addi	%v0, %v1, -30
bgti_cont.30162:
	j	bgti_cont.30116
bgti_else.30159:
	addi	%v0, %v1, -20
bgti_cont.30160:
	j	bgti_cont.30116
bgti_else.30157:
	addi	%v0, %v1, -10
bgti_cont.30158:
	j	bgti_cont.30116
bgti_else.30155:
	add	%v0, %zero, %v1
bgti_cont.30156:
	j	bgti_cont.30116
bgti_else.30153:
	addi	%v0, %v1, -30
bgti_cont.30154:
	j	bgti_cont.30116
bgti_else.30151:
	addi	%v0, %v1, -20
bgti_cont.30152:
	j	bgti_cont.30116
bgti_else.30149:
	addi	%v0, %v1, -10
bgti_cont.30150:
	j	bgti_cont.30116
bgti_else.30147:
	add	%v0, %zero, %v1
bgti_cont.30148:
	j	bgti_cont.30116
bgti_else.30145:
	addi	%v0, %v1, -30
bgti_cont.30146:
	j	bgti_cont.30116
bgti_else.30143:
	addi	%v0, %v1, -20
bgti_cont.30144:
	j	bgti_cont.30116
bgti_else.30141:
	addi	%v0, %v1, -10
bgti_cont.30142:
	j	bgti_cont.30116
bgti_else.30139:
	add	%v0, %zero, %v1
bgti_cont.30140:
	j	bgti_cont.30116
bgti_else.30137:
	addi	%v0, %v1, -30
bgti_cont.30138:
	j	bgti_cont.30116
bgti_else.30135:
	addi	%v0, %v1, -20
bgti_cont.30136:
	j	bgti_cont.30116
bgti_else.30133:
	addi	%v0, %v1, -10
bgti_cont.30134:
	j	bgti_cont.30116
bgti_else.30131:
	add	%v0, %zero, %v1
bgti_cont.30132:
	j	bgti_cont.30116
bgti_else.30129:
	addi	%v0, %v1, -30
bgti_cont.30130:
	j	bgti_cont.30116
bgti_else.30127:
	addi	%v0, %v1, -20
bgti_cont.30128:
	j	bgti_cont.30116
bgti_else.30125:
	addi	%v0, %v1, -10
bgti_cont.30126:
	j	bgti_cont.30116
bgti_else.30123:
	add	%v0, %zero, %v1
bgti_cont.30124:
	j	bgti_cont.30116
bgti_else.30121:
	addi	%v0, %v1, -30
bgti_cont.30122:
	j	bgti_cont.30116
bgti_else.30119:
	addi	%v0, %v1, -20
bgti_cont.30120:
	j	bgti_cont.30116
bgti_else.30117:
	addi	%v0, %v1, -10
bgti_cont.30118:
	j	bgti_cont.30116
bgti_else.30115:
	add	%v0, %zero, %v1
bgti_cont.30116:
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
bgt_cont.30114:
bgt_cont.30048:
	addi	%v0, %zero, 32
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 155(%zero)
	sw	%v0, 7(%sp)
	blti	%v0, 10, bgti_else.30163
	blti	%v0, 20, bgti_else.30165
	blti	%v0, 30, bgti_else.30167
	blti	%v0, 40, bgti_else.30169
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.30171
	blti	%v1, 20, bgti_else.30173
	blti	%v1, 30, bgti_else.30175
	blti	%v1, 40, bgti_else.30177
	addi	%v1, %v1, -40
	addi	%a0, %zero, 8
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	print_int_sub1.2641
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bgti_cont.30164
bgti_else.30177:
	addi	%v0, %zero, 7
bgti_cont.30178:
	j	bgti_cont.30164
bgti_else.30175:
	addi	%v0, %zero, 6
bgti_cont.30176:
	j	bgti_cont.30164
bgti_else.30173:
	addi	%v0, %zero, 5
bgti_cont.30174:
	j	bgti_cont.30164
bgti_else.30171:
	addi	%v0, %zero, 4
bgti_cont.30172:
	j	bgti_cont.30164
bgti_else.30169:
	addi	%v0, %zero, 3
bgti_cont.30170:
	j	bgti_cont.30164
bgti_else.30167:
	addi	%v0, %zero, 2
bgti_cont.30168:
	j	bgti_cont.30164
bgti_else.30165:
	addi	%v0, %zero, 1
bgti_cont.30166:
	j	bgti_cont.30164
bgti_else.30163:
	addi	%v0, %zero, 0
bgti_cont.30164:
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	blti	%v1, 10, bgti_else.30179
	blti	%v1, 20, bgti_else.30181
	blti	%v1, 30, bgti_else.30183
	blti	%v1, 40, bgti_else.30185
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30187
	blti	%v1, 20, bgti_else.30189
	blti	%v1, 30, bgti_else.30191
	blti	%v1, 40, bgti_else.30193
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30195
	blti	%v1, 20, bgti_else.30197
	blti	%v1, 30, bgti_else.30199
	blti	%v1, 40, bgti_else.30201
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30203
	blti	%v1, 20, bgti_else.30205
	blti	%v1, 30, bgti_else.30207
	blti	%v1, 40, bgti_else.30209
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30211
	blti	%v1, 20, bgti_else.30213
	blti	%v1, 30, bgti_else.30215
	blti	%v1, 40, bgti_else.30217
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30219
	blti	%v1, 20, bgti_else.30221
	blti	%v1, 30, bgti_else.30223
	blti	%v1, 40, bgti_else.30225
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	print_int_sub2.2644
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bgti_cont.30180
bgti_else.30225:
	addi	%v0, %v1, -30
bgti_cont.30226:
	j	bgti_cont.30180
bgti_else.30223:
	addi	%v0, %v1, -20
bgti_cont.30224:
	j	bgti_cont.30180
bgti_else.30221:
	addi	%v0, %v1, -10
bgti_cont.30222:
	j	bgti_cont.30180
bgti_else.30219:
	add	%v0, %zero, %v1
bgti_cont.30220:
	j	bgti_cont.30180
bgti_else.30217:
	addi	%v0, %v1, -30
bgti_cont.30218:
	j	bgti_cont.30180
bgti_else.30215:
	addi	%v0, %v1, -20
bgti_cont.30216:
	j	bgti_cont.30180
bgti_else.30213:
	addi	%v0, %v1, -10
bgti_cont.30214:
	j	bgti_cont.30180
bgti_else.30211:
	add	%v0, %zero, %v1
bgti_cont.30212:
	j	bgti_cont.30180
bgti_else.30209:
	addi	%v0, %v1, -30
bgti_cont.30210:
	j	bgti_cont.30180
bgti_else.30207:
	addi	%v0, %v1, -20
bgti_cont.30208:
	j	bgti_cont.30180
bgti_else.30205:
	addi	%v0, %v1, -10
bgti_cont.30206:
	j	bgti_cont.30180
bgti_else.30203:
	add	%v0, %zero, %v1
bgti_cont.30204:
	j	bgti_cont.30180
bgti_else.30201:
	addi	%v0, %v1, -30
bgti_cont.30202:
	j	bgti_cont.30180
bgti_else.30199:
	addi	%v0, %v1, -20
bgti_cont.30200:
	j	bgti_cont.30180
bgti_else.30197:
	addi	%v0, %v1, -10
bgti_cont.30198:
	j	bgti_cont.30180
bgti_else.30195:
	add	%v0, %zero, %v1
bgti_cont.30196:
	j	bgti_cont.30180
bgti_else.30193:
	addi	%v0, %v1, -30
bgti_cont.30194:
	j	bgti_cont.30180
bgti_else.30191:
	addi	%v0, %v1, -20
bgti_cont.30192:
	j	bgti_cont.30180
bgti_else.30189:
	addi	%v0, %v1, -10
bgti_cont.30190:
	j	bgti_cont.30180
bgti_else.30187:
	add	%v0, %zero, %v1
bgti_cont.30188:
	j	bgti_cont.30180
bgti_else.30185:
	addi	%v0, %v1, -30
bgti_cont.30186:
	j	bgti_cont.30180
bgti_else.30183:
	addi	%v0, %v1, -20
bgti_cont.30184:
	j	bgti_cont.30180
bgti_else.30181:
	addi	%v0, %v1, -10
bgti_cont.30182:
	j	bgti_cont.30180
bgti_else.30179:
	add	%v0, %zero, %v1
bgti_cont.30180:
	lw	%v1, 8(%sp)
	blt	%zero, %v1, bgt_else.30227
	addi	%v0, %v0, 48
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_print_char
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bgt_cont.30228
bgt_else.30227:
	sw	%v0, 9(%sp)
	blti	%v1, 10, bgti_else.30229
	blti	%v1, 20, bgti_else.30231
	blti	%v1, 30, bgti_else.30233
	blti	%v1, 40, bgti_else.30235
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.30237
	blti	%a0, 20, bgti_else.30239
	blti	%a0, 30, bgti_else.30241
	blti	%a0, 40, bgti_else.30243
	addi	%a0, %a0, -40
	addi	%a1, %zero, 8
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.30230
bgti_else.30243:
	addi	%v0, %zero, 7
bgti_cont.30244:
	j	bgti_cont.30230
bgti_else.30241:
	addi	%v0, %zero, 6
bgti_cont.30242:
	j	bgti_cont.30230
bgti_else.30239:
	addi	%v0, %zero, 5
bgti_cont.30240:
	j	bgti_cont.30230
bgti_else.30237:
	addi	%v0, %zero, 4
bgti_cont.30238:
	j	bgti_cont.30230
bgti_else.30235:
	addi	%v0, %zero, 3
bgti_cont.30236:
	j	bgti_cont.30230
bgti_else.30233:
	addi	%v0, %zero, 2
bgti_cont.30234:
	j	bgti_cont.30230
bgti_else.30231:
	addi	%v0, %zero, 1
bgti_cont.30232:
	j	bgti_cont.30230
bgti_else.30229:
	addi	%v0, %zero, 0
bgti_cont.30230:
	lw	%v1, 8(%sp)
	sw	%v0, 10(%sp)
	blti	%v1, 10, bgti_else.30245
	blti	%v1, 20, bgti_else.30247
	blti	%v1, 30, bgti_else.30249
	blti	%v1, 40, bgti_else.30251
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30253
	blti	%v1, 20, bgti_else.30255
	blti	%v1, 30, bgti_else.30257
	blti	%v1, 40, bgti_else.30259
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30261
	blti	%v1, 20, bgti_else.30263
	blti	%v1, 30, bgti_else.30265
	blti	%v1, 40, bgti_else.30267
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30269
	blti	%v1, 20, bgti_else.30271
	blti	%v1, 30, bgti_else.30273
	blti	%v1, 40, bgti_else.30275
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30277
	blti	%v1, 20, bgti_else.30279
	blti	%v1, 30, bgti_else.30281
	blti	%v1, 40, bgti_else.30283
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30285
	blti	%v1, 20, bgti_else.30287
	blti	%v1, 30, bgti_else.30289
	blti	%v1, 40, bgti_else.30291
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	print_int_sub2.2644
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.30246
bgti_else.30291:
	addi	%v0, %v1, -30
bgti_cont.30292:
	j	bgti_cont.30246
bgti_else.30289:
	addi	%v0, %v1, -20
bgti_cont.30290:
	j	bgti_cont.30246
bgti_else.30287:
	addi	%v0, %v1, -10
bgti_cont.30288:
	j	bgti_cont.30246
bgti_else.30285:
	add	%v0, %zero, %v1
bgti_cont.30286:
	j	bgti_cont.30246
bgti_else.30283:
	addi	%v0, %v1, -30
bgti_cont.30284:
	j	bgti_cont.30246
bgti_else.30281:
	addi	%v0, %v1, -20
bgti_cont.30282:
	j	bgti_cont.30246
bgti_else.30279:
	addi	%v0, %v1, -10
bgti_cont.30280:
	j	bgti_cont.30246
bgti_else.30277:
	add	%v0, %zero, %v1
bgti_cont.30278:
	j	bgti_cont.30246
bgti_else.30275:
	addi	%v0, %v1, -30
bgti_cont.30276:
	j	bgti_cont.30246
bgti_else.30273:
	addi	%v0, %v1, -20
bgti_cont.30274:
	j	bgti_cont.30246
bgti_else.30271:
	addi	%v0, %v1, -10
bgti_cont.30272:
	j	bgti_cont.30246
bgti_else.30269:
	add	%v0, %zero, %v1
bgti_cont.30270:
	j	bgti_cont.30246
bgti_else.30267:
	addi	%v0, %v1, -30
bgti_cont.30268:
	j	bgti_cont.30246
bgti_else.30265:
	addi	%v0, %v1, -20
bgti_cont.30266:
	j	bgti_cont.30246
bgti_else.30263:
	addi	%v0, %v1, -10
bgti_cont.30264:
	j	bgti_cont.30246
bgti_else.30261:
	add	%v0, %zero, %v1
bgti_cont.30262:
	j	bgti_cont.30246
bgti_else.30259:
	addi	%v0, %v1, -30
bgti_cont.30260:
	j	bgti_cont.30246
bgti_else.30257:
	addi	%v0, %v1, -20
bgti_cont.30258:
	j	bgti_cont.30246
bgti_else.30255:
	addi	%v0, %v1, -10
bgti_cont.30256:
	j	bgti_cont.30246
bgti_else.30253:
	add	%v0, %zero, %v1
bgti_cont.30254:
	j	bgti_cont.30246
bgti_else.30251:
	addi	%v0, %v1, -30
bgti_cont.30252:
	j	bgti_cont.30246
bgti_else.30249:
	addi	%v0, %v1, -20
bgti_cont.30250:
	j	bgti_cont.30246
bgti_else.30247:
	addi	%v0, %v1, -10
bgti_cont.30248:
	j	bgti_cont.30246
bgti_else.30245:
	add	%v0, %zero, %v1
bgti_cont.30246:
	lw	%v1, 10(%sp)
	blt	%zero, %v1, bgt_else.30293
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
	j	bgt_cont.30294
bgt_else.30293:
	sw	%v0, 11(%sp)
	blti	%v1, 10, bgti_else.30295
	blti	%v1, 20, bgti_else.30297
	blti	%v1, 30, bgti_else.30299
	blti	%v1, 40, bgti_else.30301
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30303
	blti	%v1, 20, bgti_else.30305
	blti	%v1, 30, bgti_else.30307
	blti	%v1, 40, bgti_else.30309
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30311
	blti	%v1, 20, bgti_else.30313
	blti	%v1, 30, bgti_else.30315
	blti	%v1, 40, bgti_else.30317
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30319
	blti	%v1, 20, bgti_else.30321
	blti	%v1, 30, bgti_else.30323
	blti	%v1, 40, bgti_else.30325
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30327
	blti	%v1, 20, bgti_else.30329
	blti	%v1, 30, bgti_else.30331
	blti	%v1, 40, bgti_else.30333
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30335
	blti	%v1, 20, bgti_else.30337
	blti	%v1, 30, bgti_else.30339
	blti	%v1, 40, bgti_else.30341
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	print_int_sub2.2644
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.30296
bgti_else.30341:
	addi	%v0, %v1, -30
bgti_cont.30342:
	j	bgti_cont.30296
bgti_else.30339:
	addi	%v0, %v1, -20
bgti_cont.30340:
	j	bgti_cont.30296
bgti_else.30337:
	addi	%v0, %v1, -10
bgti_cont.30338:
	j	bgti_cont.30296
bgti_else.30335:
	add	%v0, %zero, %v1
bgti_cont.30336:
	j	bgti_cont.30296
bgti_else.30333:
	addi	%v0, %v1, -30
bgti_cont.30334:
	j	bgti_cont.30296
bgti_else.30331:
	addi	%v0, %v1, -20
bgti_cont.30332:
	j	bgti_cont.30296
bgti_else.30329:
	addi	%v0, %v1, -10
bgti_cont.30330:
	j	bgti_cont.30296
bgti_else.30327:
	add	%v0, %zero, %v1
bgti_cont.30328:
	j	bgti_cont.30296
bgti_else.30325:
	addi	%v0, %v1, -30
bgti_cont.30326:
	j	bgti_cont.30296
bgti_else.30323:
	addi	%v0, %v1, -20
bgti_cont.30324:
	j	bgti_cont.30296
bgti_else.30321:
	addi	%v0, %v1, -10
bgti_cont.30322:
	j	bgti_cont.30296
bgti_else.30319:
	add	%v0, %zero, %v1
bgti_cont.30320:
	j	bgti_cont.30296
bgti_else.30317:
	addi	%v0, %v1, -30
bgti_cont.30318:
	j	bgti_cont.30296
bgti_else.30315:
	addi	%v0, %v1, -20
bgti_cont.30316:
	j	bgti_cont.30296
bgti_else.30313:
	addi	%v0, %v1, -10
bgti_cont.30314:
	j	bgti_cont.30296
bgti_else.30311:
	add	%v0, %zero, %v1
bgti_cont.30312:
	j	bgti_cont.30296
bgti_else.30309:
	addi	%v0, %v1, -30
bgti_cont.30310:
	j	bgti_cont.30296
bgti_else.30307:
	addi	%v0, %v1, -20
bgti_cont.30308:
	j	bgti_cont.30296
bgti_else.30305:
	addi	%v0, %v1, -10
bgti_cont.30306:
	j	bgti_cont.30296
bgti_else.30303:
	add	%v0, %zero, %v1
bgti_cont.30304:
	j	bgti_cont.30296
bgti_else.30301:
	addi	%v0, %v1, -30
bgti_cont.30302:
	j	bgti_cont.30296
bgti_else.30299:
	addi	%v0, %v1, -20
bgti_cont.30300:
	j	bgti_cont.30296
bgti_else.30297:
	addi	%v0, %v1, -10
bgti_cont.30298:
	j	bgti_cont.30296
bgti_else.30295:
	add	%v0, %zero, %v1
bgti_cont.30296:
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
bgt_cont.30294:
bgt_cont.30228:
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
	blt	%zero, %v1, bgt_else.30343
	addi	%v0, %v0, 48
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgt_cont.30344
bgt_else.30343:
	sw	%v0, 14(%sp)
	blti	%v1, 10, bgti_else.30345
	blti	%v1, 20, bgti_else.30347
	blti	%v1, 30, bgti_else.30349
	blti	%v1, 40, bgti_else.30351
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.30353
	blti	%a0, 20, bgti_else.30355
	blti	%a0, 30, bgti_else.30357
	blti	%a0, 40, bgti_else.30359
	addi	%a0, %a0, -40
	lw	%a1, 12(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub1.2641
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.30346
bgti_else.30359:
	addi	%v0, %zero, 7
bgti_cont.30360:
	j	bgti_cont.30346
bgti_else.30357:
	addi	%v0, %zero, 6
bgti_cont.30358:
	j	bgti_cont.30346
bgti_else.30355:
	addi	%v0, %zero, 5
bgti_cont.30356:
	j	bgti_cont.30346
bgti_else.30353:
	addi	%v0, %zero, 4
bgti_cont.30354:
	j	bgti_cont.30346
bgti_else.30351:
	addi	%v0, %zero, 3
bgti_cont.30352:
	j	bgti_cont.30346
bgti_else.30349:
	addi	%v0, %zero, 2
bgti_cont.30350:
	j	bgti_cont.30346
bgti_else.30347:
	addi	%v0, %zero, 1
bgti_cont.30348:
	j	bgti_cont.30346
bgti_else.30345:
	addi	%v0, %zero, 0
bgti_cont.30346:
	lw	%v1, 13(%sp)
	sw	%v0, 15(%sp)
	blti	%v1, 10, bgti_else.30361
	blti	%v1, 20, bgti_else.30363
	blti	%v1, 30, bgti_else.30365
	blti	%v1, 40, bgti_else.30367
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30369
	blti	%v1, 20, bgti_else.30371
	blti	%v1, 30, bgti_else.30373
	blti	%v1, 40, bgti_else.30375
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30377
	blti	%v1, 20, bgti_else.30379
	blti	%v1, 30, bgti_else.30381
	blti	%v1, 40, bgti_else.30383
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30385
	blti	%v1, 20, bgti_else.30387
	blti	%v1, 30, bgti_else.30389
	blti	%v1, 40, bgti_else.30391
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30393
	blti	%v1, 20, bgti_else.30395
	blti	%v1, 30, bgti_else.30397
	blti	%v1, 40, bgti_else.30399
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30401
	blti	%v1, 20, bgti_else.30403
	blti	%v1, 30, bgti_else.30405
	blti	%v1, 40, bgti_else.30407
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	print_int_sub2.2644
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgti_cont.30362
bgti_else.30407:
	addi	%v0, %v1, -30
bgti_cont.30408:
	j	bgti_cont.30362
bgti_else.30405:
	addi	%v0, %v1, -20
bgti_cont.30406:
	j	bgti_cont.30362
bgti_else.30403:
	addi	%v0, %v1, -10
bgti_cont.30404:
	j	bgti_cont.30362
bgti_else.30401:
	add	%v0, %zero, %v1
bgti_cont.30402:
	j	bgti_cont.30362
bgti_else.30399:
	addi	%v0, %v1, -30
bgti_cont.30400:
	j	bgti_cont.30362
bgti_else.30397:
	addi	%v0, %v1, -20
bgti_cont.30398:
	j	bgti_cont.30362
bgti_else.30395:
	addi	%v0, %v1, -10
bgti_cont.30396:
	j	bgti_cont.30362
bgti_else.30393:
	add	%v0, %zero, %v1
bgti_cont.30394:
	j	bgti_cont.30362
bgti_else.30391:
	addi	%v0, %v1, -30
bgti_cont.30392:
	j	bgti_cont.30362
bgti_else.30389:
	addi	%v0, %v1, -20
bgti_cont.30390:
	j	bgti_cont.30362
bgti_else.30387:
	addi	%v0, %v1, -10
bgti_cont.30388:
	j	bgti_cont.30362
bgti_else.30385:
	add	%v0, %zero, %v1
bgti_cont.30386:
	j	bgti_cont.30362
bgti_else.30383:
	addi	%v0, %v1, -30
bgti_cont.30384:
	j	bgti_cont.30362
bgti_else.30381:
	addi	%v0, %v1, -20
bgti_cont.30382:
	j	bgti_cont.30362
bgti_else.30379:
	addi	%v0, %v1, -10
bgti_cont.30380:
	j	bgti_cont.30362
bgti_else.30377:
	add	%v0, %zero, %v1
bgti_cont.30378:
	j	bgti_cont.30362
bgti_else.30375:
	addi	%v0, %v1, -30
bgti_cont.30376:
	j	bgti_cont.30362
bgti_else.30373:
	addi	%v0, %v1, -20
bgti_cont.30374:
	j	bgti_cont.30362
bgti_else.30371:
	addi	%v0, %v1, -10
bgti_cont.30372:
	j	bgti_cont.30362
bgti_else.30369:
	add	%v0, %zero, %v1
bgti_cont.30370:
	j	bgti_cont.30362
bgti_else.30367:
	addi	%v0, %v1, -30
bgti_cont.30368:
	j	bgti_cont.30362
bgti_else.30365:
	addi	%v0, %v1, -20
bgti_cont.30366:
	j	bgti_cont.30362
bgti_else.30363:
	addi	%v0, %v1, -10
bgti_cont.30364:
	j	bgti_cont.30362
bgti_else.30361:
	add	%v0, %zero, %v1
bgti_cont.30362:
	lw	%v1, 15(%sp)
	blt	%zero, %v1, bgt_else.30409
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
	j	bgt_cont.30410
bgt_else.30409:
	sw	%v0, 16(%sp)
	blti	%v1, 10, bgti_else.30411
	blti	%v1, 20, bgti_else.30413
	blti	%v1, 30, bgti_else.30415
	blti	%v1, 40, bgti_else.30417
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30419
	blti	%v1, 20, bgti_else.30421
	blti	%v1, 30, bgti_else.30423
	blti	%v1, 40, bgti_else.30425
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30427
	blti	%v1, 20, bgti_else.30429
	blti	%v1, 30, bgti_else.30431
	blti	%v1, 40, bgti_else.30433
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30435
	blti	%v1, 20, bgti_else.30437
	blti	%v1, 30, bgti_else.30439
	blti	%v1, 40, bgti_else.30441
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30443
	blti	%v1, 20, bgti_else.30445
	blti	%v1, 30, bgti_else.30447
	blti	%v1, 40, bgti_else.30449
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.30451
	blti	%v1, 20, bgti_else.30453
	blti	%v1, 30, bgti_else.30455
	blti	%v1, 40, bgti_else.30457
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	print_int_sub2.2644
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.30412
bgti_else.30457:
	addi	%v0, %v1, -30
bgti_cont.30458:
	j	bgti_cont.30412
bgti_else.30455:
	addi	%v0, %v1, -20
bgti_cont.30456:
	j	bgti_cont.30412
bgti_else.30453:
	addi	%v0, %v1, -10
bgti_cont.30454:
	j	bgti_cont.30412
bgti_else.30451:
	add	%v0, %zero, %v1
bgti_cont.30452:
	j	bgti_cont.30412
bgti_else.30449:
	addi	%v0, %v1, -30
bgti_cont.30450:
	j	bgti_cont.30412
bgti_else.30447:
	addi	%v0, %v1, -20
bgti_cont.30448:
	j	bgti_cont.30412
bgti_else.30445:
	addi	%v0, %v1, -10
bgti_cont.30446:
	j	bgti_cont.30412
bgti_else.30443:
	add	%v0, %zero, %v1
bgti_cont.30444:
	j	bgti_cont.30412
bgti_else.30441:
	addi	%v0, %v1, -30
bgti_cont.30442:
	j	bgti_cont.30412
bgti_else.30439:
	addi	%v0, %v1, -20
bgti_cont.30440:
	j	bgti_cont.30412
bgti_else.30437:
	addi	%v0, %v1, -10
bgti_cont.30438:
	j	bgti_cont.30412
bgti_else.30435:
	add	%v0, %zero, %v1
bgti_cont.30436:
	j	bgti_cont.30412
bgti_else.30433:
	addi	%v0, %v1, -30
bgti_cont.30434:
	j	bgti_cont.30412
bgti_else.30431:
	addi	%v0, %v1, -20
bgti_cont.30432:
	j	bgti_cont.30412
bgti_else.30429:
	addi	%v0, %v1, -10
bgti_cont.30430:
	j	bgti_cont.30412
bgti_else.30427:
	add	%v0, %zero, %v1
bgti_cont.30428:
	j	bgti_cont.30412
bgti_else.30425:
	addi	%v0, %v1, -30
bgti_cont.30426:
	j	bgti_cont.30412
bgti_else.30423:
	addi	%v0, %v1, -20
bgti_cont.30424:
	j	bgti_cont.30412
bgti_else.30421:
	addi	%v0, %v1, -10
bgti_cont.30422:
	j	bgti_cont.30412
bgti_else.30419:
	add	%v0, %zero, %v1
bgti_cont.30420:
	j	bgti_cont.30412
bgti_else.30417:
	addi	%v0, %v1, -30
bgti_cont.30418:
	j	bgti_cont.30412
bgti_else.30415:
	addi	%v0, %v1, -20
bgti_cont.30416:
	j	bgti_cont.30412
bgti_else.30413:
	addi	%v0, %v1, -10
bgti_cont.30414:
	j	bgti_cont.30412
bgti_else.30411:
	add	%v0, %zero, %v1
bgti_cont.30412:
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
bgt_cont.30410:
bgt_cont.30344:
	lw	%v0, 0(%sp)
	j	min_caml_print_char
pretrace_diffuse_rays.3043:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.30479
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.30480
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.30481
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
	j	bnei_cont.30482
bnei_else.30481:
bnei_cont.30482:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.30483
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.30484
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.30485
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
	fblt	%f0, %f1, fbgt_else.30487
	addi	%a0, %zero, 0
	j	fbgt_cont.30488
fbgt_else.30487:
	addi	%a0, %zero, 1
fbgt_cont.30488:
	beqi	%a0, 0, bnei_else.30489
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.30490
bnei_else.30489:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.30490:
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
	j	bnei_cont.30486
bnei_else.30485:
bnei_cont.30486:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3043
bgti_else.30484:
	jr	%ra
bgt_else.30483:
	jr	%ra
bgti_else.30480:
	jr	%ra
bgt_else.30479:
	jr	%ra
pretrace_pixels.3046:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.30519
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
	fbne	%f4, %f7, fbeq_else.30520
	addi	%a3, %zero, 1
	j	fbeq_cont.30521
fbeq_else.30520:
	addi	%a3, %zero, 0
fbeq_cont.30521:
	beqi	%a3, 0, bnei_else.30522
	flw	%f4, 474(%zero)
	j	bnei_cont.30523
bnei_else.30522:
	flw	%f8, 474(%zero)
	fdiv	%f4, %f8, %f4
bnei_cont.30523:
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
	blti	%v1, 0, bgti_else.30524
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.30526
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
	fblt	%f0, %f1, fbgt_else.30528
	addi	%a0, %zero, 0
	j	fbgt_cont.30529
fbgt_else.30528:
	addi	%a0, %zero, 1
fbgt_cont.30529:
	beqi	%a0, 0, bnei_else.30530
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.30531
bnei_else.30530:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.30531:
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
	j	bnei_cont.30527
bnei_else.30526:
bnei_cont.30527:
	lw	%v1, 5(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	pretrace_diffuse_rays.3043
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.30525
bgti_else.30524:
bgti_cont.30525:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.30532
	addi	%a0, %v0, -5
	j	bgti_cont.30533
bgti_else.30532:
	add	%a0, %zero, %v0
bgti_cont.30533:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3046
bgti_else.30519:
	jr	%ra
scan_pixel.3057:
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.31977
	jr	%ra
bgt_else.31977:
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
	blt	%t4, %t2, bgt_else.31979
	addi	%t5, %zero, 0
	j	bgt_cont.31980
bgt_else.31979:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.31981
	addi	%t5, %zero, 0
	j	bgt_cont.31982
bgt_else.31981:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.31983
	addi	%t5, %zero, 0
	j	bgt_cont.31984
bgt_else.31983:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.31985
	addi	%t5, %zero, 0
	j	bgt_cont.31986
bgt_else.31985:
	addi	%t5, %zero, 1
bgt_cont.31986:
bgt_cont.31984:
bgt_cont.31982:
bgt_cont.31980:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%t4, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%a1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a3, 8(%sp)
	beqi	%t5, 0, bnei_else.31987
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bnei_cont.31988
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.31991
	add	%at, %a2, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.31993
	addi	%t6, %v0, -1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.31995
	addi	%t6, %v0, 1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.31997
	addi	%t5, %zero, 1
	j	beq_cont.31992
beq_else.31997:
	addi	%t5, %zero, 0
beq_cont.31998:
	j	beq_cont.31992
beq_else.31995:
	addi	%t5, %zero, 0
beq_cont.31996:
	j	beq_cont.31992
beq_else.31993:
	addi	%t5, %zero, 0
beq_cont.31994:
	j	beq_cont.31992
beq_else.31991:
	addi	%t5, %zero, 0
beq_cont.31992:
	beqi	%t5, 0, bnei_else.31999
	lw	%t1, 3(%t1)
	lw	%t1, 0(%t1)
	sw	%t3, 9(%sp)
	beqi	%t1, 0, bnei_else.32001
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	calc_diffuse_using_5points.3008
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.32002
bnei_else.32001:
bnei_cont.32002:
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
	j	bnei_cont.31988
bnei_else.31999:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.32000:
	j	bnei_cont.31988
bgti_else.31989:
bgti_cont.31990:
	j	bnei_cont.31988
bnei_else.31987:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.32003
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.32005
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	calc_diffuse_using_1point.3005
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.32006
bnei_else.32005:
bnei_cont.32006:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.32004
bgti_else.32003:
bgti_cont.32004:
bnei_cont.31988:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32007
	blti	%v0, 0, bgti_else.32009
	j	bgt_cont.32008
bgti_else.32009:
	addi	%v0, %zero, 0
bgti_cont.32010:
	j	bgt_cont.32008
bgt_else.32007:
	addi	%v0, %zero, 255
bgt_cont.32008:
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
	blti	%a0, 10, bgti_else.32011
	blti	%a0, 20, bgti_else.32013
	blti	%a0, 30, bgti_else.32015
	blti	%a0, 40, bgti_else.32017
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.32019
	blti	%a0, 20, bgti_else.32021
	blti	%a0, 30, bgti_else.32023
	blti	%a0, 40, bgti_else.32025
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.32027
	blti	%a0, 20, bgti_else.32029
	blti	%a0, 30, bgti_else.32031
	blti	%a0, 40, bgti_else.32033
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.32035
	blti	%a0, 20, bgti_else.32037
	blti	%a0, 30, bgti_else.32039
	blti	%a0, 40, bgti_else.32041
	addi	%a0, %a0, -40
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	print_int_sub2.2644
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.32012
bgti_else.32041:
	addi	%v0, %a0, -30
bgti_cont.32042:
	j	bgti_cont.32012
bgti_else.32039:
	addi	%v0, %a0, -20
bgti_cont.32040:
	j	bgti_cont.32012
bgti_else.32037:
	addi	%v0, %a0, -10
bgti_cont.32038:
	j	bgti_cont.32012
bgti_else.32035:
	add	%v0, %zero, %a0
bgti_cont.32036:
	j	bgti_cont.32012
bgti_else.32033:
	addi	%v0, %a0, -30
bgti_cont.32034:
	j	bgti_cont.32012
bgti_else.32031:
	addi	%v0, %a0, -20
bgti_cont.32032:
	j	bgti_cont.32012
bgti_else.32029:
	addi	%v0, %a0, -10
bgti_cont.32030:
	j	bgti_cont.32012
bgti_else.32027:
	add	%v0, %zero, %a0
bgti_cont.32028:
	j	bgti_cont.32012
bgti_else.32025:
	addi	%v0, %a0, -30
bgti_cont.32026:
	j	bgti_cont.32012
bgti_else.32023:
	addi	%v0, %a0, -20
bgti_cont.32024:
	j	bgti_cont.32012
bgti_else.32021:
	addi	%v0, %a0, -10
bgti_cont.32022:
	j	bgti_cont.32012
bgti_else.32019:
	add	%v0, %zero, %a0
bgti_cont.32020:
	j	bgti_cont.32012
bgti_else.32017:
	addi	%v0, %a0, -30
bgti_cont.32018:
	j	bgti_cont.32012
bgti_else.32015:
	addi	%v0, %a0, -20
bgti_cont.32016:
	j	bgti_cont.32012
bgti_else.32013:
	addi	%v0, %a0, -10
bgti_cont.32014:
	j	bgti_cont.32012
bgti_else.32011:
	add	%v0, %zero, %a0
bgti_cont.32012:
	lw	%v1, 13(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.32043
	addi	%v0, %v0, 48
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_print_char
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgt_cont.32044
bgt_else.32043:
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
	blti	%v1, 10, bgti_else.32045
	blti	%v1, 20, bgti_else.32047
	blti	%v1, 30, bgti_else.32049
	blti	%v1, 40, bgti_else.32051
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32053
	blti	%v1, 20, bgti_else.32055
	blti	%v1, 30, bgti_else.32057
	blti	%v1, 40, bgti_else.32059
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32061
	blti	%v1, 20, bgti_else.32063
	blti	%v1, 30, bgti_else.32065
	blti	%v1, 40, bgti_else.32067
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32069
	blti	%v1, 20, bgti_else.32071
	blti	%v1, 30, bgti_else.32073
	blti	%v1, 40, bgti_else.32075
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	print_int_sub2.2644
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgti_cont.32046
bgti_else.32075:
	addi	%v0, %v1, -30
bgti_cont.32076:
	j	bgti_cont.32046
bgti_else.32073:
	addi	%v0, %v1, -20
bgti_cont.32074:
	j	bgti_cont.32046
bgti_else.32071:
	addi	%v0, %v1, -10
bgti_cont.32072:
	j	bgti_cont.32046
bgti_else.32069:
	add	%v0, %zero, %v1
bgti_cont.32070:
	j	bgti_cont.32046
bgti_else.32067:
	addi	%v0, %v1, -30
bgti_cont.32068:
	j	bgti_cont.32046
bgti_else.32065:
	addi	%v0, %v1, -20
bgti_cont.32066:
	j	bgti_cont.32046
bgti_else.32063:
	addi	%v0, %v1, -10
bgti_cont.32064:
	j	bgti_cont.32046
bgti_else.32061:
	add	%v0, %zero, %v1
bgti_cont.32062:
	j	bgti_cont.32046
bgti_else.32059:
	addi	%v0, %v1, -30
bgti_cont.32060:
	j	bgti_cont.32046
bgti_else.32057:
	addi	%v0, %v1, -20
bgti_cont.32058:
	j	bgti_cont.32046
bgti_else.32055:
	addi	%v0, %v1, -10
bgti_cont.32056:
	j	bgti_cont.32046
bgti_else.32053:
	add	%v0, %zero, %v1
bgti_cont.32054:
	j	bgti_cont.32046
bgti_else.32051:
	addi	%v0, %v1, -30
bgti_cont.32052:
	j	bgti_cont.32046
bgti_else.32049:
	addi	%v0, %v1, -20
bgti_cont.32050:
	j	bgti_cont.32046
bgti_else.32047:
	addi	%v0, %v1, -10
bgti_cont.32048:
	j	bgti_cont.32046
bgti_else.32045:
	add	%v0, %zero, %v1
bgti_cont.32046:
	lw	%v1, 15(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.32077
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
	j	bgt_cont.32078
bgt_else.32077:
	sw	%v0, 16(%sp)
	blti	%v1, 10, bgti_else.32079
	blti	%v1, 20, bgti_else.32081
	blti	%v1, 30, bgti_else.32083
	blti	%v1, 40, bgti_else.32085
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32087
	blti	%v1, 20, bgti_else.32089
	blti	%v1, 30, bgti_else.32091
	blti	%v1, 40, bgti_else.32093
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32095
	blti	%v1, 20, bgti_else.32097
	blti	%v1, 30, bgti_else.32099
	blti	%v1, 40, bgti_else.32101
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32103
	blti	%v1, 20, bgti_else.32105
	blti	%v1, 30, bgti_else.32107
	blti	%v1, 40, bgti_else.32109
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	print_int_sub2.2644
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.32080
bgti_else.32109:
	addi	%v0, %v1, -30
bgti_cont.32110:
	j	bgti_cont.32080
bgti_else.32107:
	addi	%v0, %v1, -20
bgti_cont.32108:
	j	bgti_cont.32080
bgti_else.32105:
	addi	%v0, %v1, -10
bgti_cont.32106:
	j	bgti_cont.32080
bgti_else.32103:
	add	%v0, %zero, %v1
bgti_cont.32104:
	j	bgti_cont.32080
bgti_else.32101:
	addi	%v0, %v1, -30
bgti_cont.32102:
	j	bgti_cont.32080
bgti_else.32099:
	addi	%v0, %v1, -20
bgti_cont.32100:
	j	bgti_cont.32080
bgti_else.32097:
	addi	%v0, %v1, -10
bgti_cont.32098:
	j	bgti_cont.32080
bgti_else.32095:
	add	%v0, %zero, %v1
bgti_cont.32096:
	j	bgti_cont.32080
bgti_else.32093:
	addi	%v0, %v1, -30
bgti_cont.32094:
	j	bgti_cont.32080
bgti_else.32091:
	addi	%v0, %v1, -20
bgti_cont.32092:
	j	bgti_cont.32080
bgti_else.32089:
	addi	%v0, %v1, -10
bgti_cont.32090:
	j	bgti_cont.32080
bgti_else.32087:
	add	%v0, %zero, %v1
bgti_cont.32088:
	j	bgti_cont.32080
bgti_else.32085:
	addi	%v0, %v1, -30
bgti_cont.32086:
	j	bgti_cont.32080
bgti_else.32083:
	addi	%v0, %v1, -20
bgti_cont.32084:
	j	bgti_cont.32080
bgti_else.32081:
	addi	%v0, %v1, -10
bgti_cont.32082:
	j	bgti_cont.32080
bgti_else.32079:
	add	%v0, %zero, %v1
bgti_cont.32080:
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
bgt_cont.32078:
bgt_cont.32044:
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
	blt	%at, %v0, bgt_else.32111
	blti	%v0, 0, bgti_else.32113
	j	bgt_cont.32112
bgti_else.32113:
	addi	%v0, %zero, 0
bgti_cont.32114:
	j	bgt_cont.32112
bgt_else.32111:
	addi	%v0, %zero, 255
bgt_cont.32112:
	lw	%v1, 8(%sp)
	sw	%v0, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub1.2641
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.32115
	blti	%v1, 20, bgti_else.32117
	blti	%v1, 30, bgti_else.32119
	blti	%v1, 40, bgti_else.32121
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32123
	blti	%v1, 20, bgti_else.32125
	blti	%v1, 30, bgti_else.32127
	blti	%v1, 40, bgti_else.32129
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32131
	blti	%v1, 20, bgti_else.32133
	blti	%v1, 30, bgti_else.32135
	blti	%v1, 40, bgti_else.32137
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32139
	blti	%v1, 20, bgti_else.32141
	blti	%v1, 30, bgti_else.32143
	blti	%v1, 40, bgti_else.32145
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub2.2644
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.32116
bgti_else.32145:
	addi	%v0, %v1, -30
bgti_cont.32146:
	j	bgti_cont.32116
bgti_else.32143:
	addi	%v0, %v1, -20
bgti_cont.32144:
	j	bgti_cont.32116
bgti_else.32141:
	addi	%v0, %v1, -10
bgti_cont.32142:
	j	bgti_cont.32116
bgti_else.32139:
	add	%v0, %zero, %v1
bgti_cont.32140:
	j	bgti_cont.32116
bgti_else.32137:
	addi	%v0, %v1, -30
bgti_cont.32138:
	j	bgti_cont.32116
bgti_else.32135:
	addi	%v0, %v1, -20
bgti_cont.32136:
	j	bgti_cont.32116
bgti_else.32133:
	addi	%v0, %v1, -10
bgti_cont.32134:
	j	bgti_cont.32116
bgti_else.32131:
	add	%v0, %zero, %v1
bgti_cont.32132:
	j	bgti_cont.32116
bgti_else.32129:
	addi	%v0, %v1, -30
bgti_cont.32130:
	j	bgti_cont.32116
bgti_else.32127:
	addi	%v0, %v1, -20
bgti_cont.32128:
	j	bgti_cont.32116
bgti_else.32125:
	addi	%v0, %v1, -10
bgti_cont.32126:
	j	bgti_cont.32116
bgti_else.32123:
	add	%v0, %zero, %v1
bgti_cont.32124:
	j	bgti_cont.32116
bgti_else.32121:
	addi	%v0, %v1, -30
bgti_cont.32122:
	j	bgti_cont.32116
bgti_else.32119:
	addi	%v0, %v1, -20
bgti_cont.32120:
	j	bgti_cont.32116
bgti_else.32117:
	addi	%v0, %v1, -10
bgti_cont.32118:
	j	bgti_cont.32116
bgti_else.32115:
	add	%v0, %zero, %v1
bgti_cont.32116:
	lw	%v1, 19(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.32147
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_print_char
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgt_cont.32148
bgt_else.32147:
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
	blti	%v1, 10, bgti_else.32149
	blti	%v1, 20, bgti_else.32151
	blti	%v1, 30, bgti_else.32153
	blti	%v1, 40, bgti_else.32155
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32157
	blti	%v1, 20, bgti_else.32159
	blti	%v1, 30, bgti_else.32161
	blti	%v1, 40, bgti_else.32163
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32165
	blti	%v1, 20, bgti_else.32167
	blti	%v1, 30, bgti_else.32169
	blti	%v1, 40, bgti_else.32171
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32173
	blti	%v1, 20, bgti_else.32175
	blti	%v1, 30, bgti_else.32177
	blti	%v1, 40, bgti_else.32179
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	print_int_sub2.2644
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.32150
bgti_else.32179:
	addi	%v0, %v1, -30
bgti_cont.32180:
	j	bgti_cont.32150
bgti_else.32177:
	addi	%v0, %v1, -20
bgti_cont.32178:
	j	bgti_cont.32150
bgti_else.32175:
	addi	%v0, %v1, -10
bgti_cont.32176:
	j	bgti_cont.32150
bgti_else.32173:
	add	%v0, %zero, %v1
bgti_cont.32174:
	j	bgti_cont.32150
bgti_else.32171:
	addi	%v0, %v1, -30
bgti_cont.32172:
	j	bgti_cont.32150
bgti_else.32169:
	addi	%v0, %v1, -20
bgti_cont.32170:
	j	bgti_cont.32150
bgti_else.32167:
	addi	%v0, %v1, -10
bgti_cont.32168:
	j	bgti_cont.32150
bgti_else.32165:
	add	%v0, %zero, %v1
bgti_cont.32166:
	j	bgti_cont.32150
bgti_else.32163:
	addi	%v0, %v1, -30
bgti_cont.32164:
	j	bgti_cont.32150
bgti_else.32161:
	addi	%v0, %v1, -20
bgti_cont.32162:
	j	bgti_cont.32150
bgti_else.32159:
	addi	%v0, %v1, -10
bgti_cont.32160:
	j	bgti_cont.32150
bgti_else.32157:
	add	%v0, %zero, %v1
bgti_cont.32158:
	j	bgti_cont.32150
bgti_else.32155:
	addi	%v0, %v1, -30
bgti_cont.32156:
	j	bgti_cont.32150
bgti_else.32153:
	addi	%v0, %v1, -20
bgti_cont.32154:
	j	bgti_cont.32150
bgti_else.32151:
	addi	%v0, %v1, -10
bgti_cont.32152:
	j	bgti_cont.32150
bgti_else.32149:
	add	%v0, %zero, %v1
bgti_cont.32150:
	lw	%v1, 21(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.32181
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
	j	bgt_cont.32182
bgt_else.32181:
	sw	%v0, 22(%sp)
	blti	%v1, 10, bgti_else.32183
	blti	%v1, 20, bgti_else.32185
	blti	%v1, 30, bgti_else.32187
	blti	%v1, 40, bgti_else.32189
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32191
	blti	%v1, 20, bgti_else.32193
	blti	%v1, 30, bgti_else.32195
	blti	%v1, 40, bgti_else.32197
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32199
	blti	%v1, 20, bgti_else.32201
	blti	%v1, 30, bgti_else.32203
	blti	%v1, 40, bgti_else.32205
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32207
	blti	%v1, 20, bgti_else.32209
	blti	%v1, 30, bgti_else.32211
	blti	%v1, 40, bgti_else.32213
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub2.2644
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.32184
bgti_else.32213:
	addi	%v0, %v1, -30
bgti_cont.32214:
	j	bgti_cont.32184
bgti_else.32211:
	addi	%v0, %v1, -20
bgti_cont.32212:
	j	bgti_cont.32184
bgti_else.32209:
	addi	%v0, %v1, -10
bgti_cont.32210:
	j	bgti_cont.32184
bgti_else.32207:
	add	%v0, %zero, %v1
bgti_cont.32208:
	j	bgti_cont.32184
bgti_else.32205:
	addi	%v0, %v1, -30
bgti_cont.32206:
	j	bgti_cont.32184
bgti_else.32203:
	addi	%v0, %v1, -20
bgti_cont.32204:
	j	bgti_cont.32184
bgti_else.32201:
	addi	%v0, %v1, -10
bgti_cont.32202:
	j	bgti_cont.32184
bgti_else.32199:
	add	%v0, %zero, %v1
bgti_cont.32200:
	j	bgti_cont.32184
bgti_else.32197:
	addi	%v0, %v1, -30
bgti_cont.32198:
	j	bgti_cont.32184
bgti_else.32195:
	addi	%v0, %v1, -20
bgti_cont.32196:
	j	bgti_cont.32184
bgti_else.32193:
	addi	%v0, %v1, -10
bgti_cont.32194:
	j	bgti_cont.32184
bgti_else.32191:
	add	%v0, %zero, %v1
bgti_cont.32192:
	j	bgti_cont.32184
bgti_else.32189:
	addi	%v0, %v1, -30
bgti_cont.32190:
	j	bgti_cont.32184
bgti_else.32187:
	addi	%v0, %v1, -20
bgti_cont.32188:
	j	bgti_cont.32184
bgti_else.32185:
	addi	%v0, %v1, -10
bgti_cont.32186:
	j	bgti_cont.32184
bgti_else.32183:
	add	%v0, %zero, %v1
bgti_cont.32184:
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
bgt_cont.32182:
bgt_cont.32148:
	lw	%v0, 17(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_print_char
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32215
	blti	%v0, 0, bgti_else.32217
	j	bgt_cont.32216
bgti_else.32217:
	addi	%v0, %zero, 0
bgti_cont.32218:
	j	bgt_cont.32216
bgt_else.32215:
	addi	%v0, %zero, 255
bgt_cont.32216:
	lw	%v1, 8(%sp)
	sw	%v0, 23(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub1.2641
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)
	sw	%v0, 24(%sp)
	blti	%v1, 10, bgti_else.32219
	blti	%v1, 20, bgti_else.32221
	blti	%v1, 30, bgti_else.32223
	blti	%v1, 40, bgti_else.32225
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32227
	blti	%v1, 20, bgti_else.32229
	blti	%v1, 30, bgti_else.32231
	blti	%v1, 40, bgti_else.32233
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32235
	blti	%v1, 20, bgti_else.32237
	blti	%v1, 30, bgti_else.32239
	blti	%v1, 40, bgti_else.32241
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32243
	blti	%v1, 20, bgti_else.32245
	blti	%v1, 30, bgti_else.32247
	blti	%v1, 40, bgti_else.32249
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub2.2644
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgti_cont.32220
bgti_else.32249:
	addi	%v0, %v1, -30
bgti_cont.32250:
	j	bgti_cont.32220
bgti_else.32247:
	addi	%v0, %v1, -20
bgti_cont.32248:
	j	bgti_cont.32220
bgti_else.32245:
	addi	%v0, %v1, -10
bgti_cont.32246:
	j	bgti_cont.32220
bgti_else.32243:
	add	%v0, %zero, %v1
bgti_cont.32244:
	j	bgti_cont.32220
bgti_else.32241:
	addi	%v0, %v1, -30
bgti_cont.32242:
	j	bgti_cont.32220
bgti_else.32239:
	addi	%v0, %v1, -20
bgti_cont.32240:
	j	bgti_cont.32220
bgti_else.32237:
	addi	%v0, %v1, -10
bgti_cont.32238:
	j	bgti_cont.32220
bgti_else.32235:
	add	%v0, %zero, %v1
bgti_cont.32236:
	j	bgti_cont.32220
bgti_else.32233:
	addi	%v0, %v1, -30
bgti_cont.32234:
	j	bgti_cont.32220
bgti_else.32231:
	addi	%v0, %v1, -20
bgti_cont.32232:
	j	bgti_cont.32220
bgti_else.32229:
	addi	%v0, %v1, -10
bgti_cont.32230:
	j	bgti_cont.32220
bgti_else.32227:
	add	%v0, %zero, %v1
bgti_cont.32228:
	j	bgti_cont.32220
bgti_else.32225:
	addi	%v0, %v1, -30
bgti_cont.32226:
	j	bgti_cont.32220
bgti_else.32223:
	addi	%v0, %v1, -20
bgti_cont.32224:
	j	bgti_cont.32220
bgti_else.32221:
	addi	%v0, %v1, -10
bgti_cont.32222:
	j	bgti_cont.32220
bgti_else.32219:
	add	%v0, %zero, %v1
bgti_cont.32220:
	lw	%v1, 24(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.32251
	addi	%v0, %v0, 48
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_print_char
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgt_cont.32252
bgt_else.32251:
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
	blti	%v1, 10, bgti_else.32253
	blti	%v1, 20, bgti_else.32255
	blti	%v1, 30, bgti_else.32257
	blti	%v1, 40, bgti_else.32259
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32261
	blti	%v1, 20, bgti_else.32263
	blti	%v1, 30, bgti_else.32265
	blti	%v1, 40, bgti_else.32267
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32269
	blti	%v1, 20, bgti_else.32271
	blti	%v1, 30, bgti_else.32273
	blti	%v1, 40, bgti_else.32275
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32277
	blti	%v1, 20, bgti_else.32279
	blti	%v1, 30, bgti_else.32281
	blti	%v1, 40, bgti_else.32283
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2644
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.32254
bgti_else.32283:
	addi	%v0, %v1, -30
bgti_cont.32284:
	j	bgti_cont.32254
bgti_else.32281:
	addi	%v0, %v1, -20
bgti_cont.32282:
	j	bgti_cont.32254
bgti_else.32279:
	addi	%v0, %v1, -10
bgti_cont.32280:
	j	bgti_cont.32254
bgti_else.32277:
	add	%v0, %zero, %v1
bgti_cont.32278:
	j	bgti_cont.32254
bgti_else.32275:
	addi	%v0, %v1, -30
bgti_cont.32276:
	j	bgti_cont.32254
bgti_else.32273:
	addi	%v0, %v1, -20
bgti_cont.32274:
	j	bgti_cont.32254
bgti_else.32271:
	addi	%v0, %v1, -10
bgti_cont.32272:
	j	bgti_cont.32254
bgti_else.32269:
	add	%v0, %zero, %v1
bgti_cont.32270:
	j	bgti_cont.32254
bgti_else.32267:
	addi	%v0, %v1, -30
bgti_cont.32268:
	j	bgti_cont.32254
bgti_else.32265:
	addi	%v0, %v1, -20
bgti_cont.32266:
	j	bgti_cont.32254
bgti_else.32263:
	addi	%v0, %v1, -10
bgti_cont.32264:
	j	bgti_cont.32254
bgti_else.32261:
	add	%v0, %zero, %v1
bgti_cont.32262:
	j	bgti_cont.32254
bgti_else.32259:
	addi	%v0, %v1, -30
bgti_cont.32260:
	j	bgti_cont.32254
bgti_else.32257:
	addi	%v0, %v1, -20
bgti_cont.32258:
	j	bgti_cont.32254
bgti_else.32255:
	addi	%v0, %v1, -10
bgti_cont.32256:
	j	bgti_cont.32254
bgti_else.32253:
	add	%v0, %zero, %v1
bgti_cont.32254:
	lw	%v1, 26(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.32285
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
	j	bgt_cont.32286
bgt_else.32285:
	sw	%v0, 27(%sp)
	blti	%v1, 10, bgti_else.32287
	blti	%v1, 20, bgti_else.32289
	blti	%v1, 30, bgti_else.32291
	blti	%v1, 40, bgti_else.32293
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32295
	blti	%v1, 20, bgti_else.32297
	blti	%v1, 30, bgti_else.32299
	blti	%v1, 40, bgti_else.32301
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32303
	blti	%v1, 20, bgti_else.32305
	blti	%v1, 30, bgti_else.32307
	blti	%v1, 40, bgti_else.32309
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.32311
	blti	%v1, 20, bgti_else.32313
	blti	%v1, 30, bgti_else.32315
	blti	%v1, 40, bgti_else.32317
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	print_int_sub2.2644
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	bgti_cont.32288
bgti_else.32317:
	addi	%v0, %v1, -30
bgti_cont.32318:
	j	bgti_cont.32288
bgti_else.32315:
	addi	%v0, %v1, -20
bgti_cont.32316:
	j	bgti_cont.32288
bgti_else.32313:
	addi	%v0, %v1, -10
bgti_cont.32314:
	j	bgti_cont.32288
bgti_else.32311:
	add	%v0, %zero, %v1
bgti_cont.32312:
	j	bgti_cont.32288
bgti_else.32309:
	addi	%v0, %v1, -30
bgti_cont.32310:
	j	bgti_cont.32288
bgti_else.32307:
	addi	%v0, %v1, -20
bgti_cont.32308:
	j	bgti_cont.32288
bgti_else.32305:
	addi	%v0, %v1, -10
bgti_cont.32306:
	j	bgti_cont.32288
bgti_else.32303:
	add	%v0, %zero, %v1
bgti_cont.32304:
	j	bgti_cont.32288
bgti_else.32301:
	addi	%v0, %v1, -30
bgti_cont.32302:
	j	bgti_cont.32288
bgti_else.32299:
	addi	%v0, %v1, -20
bgti_cont.32300:
	j	bgti_cont.32288
bgti_else.32297:
	addi	%v0, %v1, -10
bgti_cont.32298:
	j	bgti_cont.32288
bgti_else.32295:
	add	%v0, %zero, %v1
bgti_cont.32296:
	j	bgti_cont.32288
bgti_else.32293:
	addi	%v0, %v1, -30
bgti_cont.32294:
	j	bgti_cont.32288
bgti_else.32291:
	addi	%v0, %v1, -20
bgti_cont.32292:
	j	bgti_cont.32288
bgti_else.32289:
	addi	%v0, %v1, -10
bgti_cont.32290:
	j	bgti_cont.32288
bgti_else.32287:
	add	%v0, %zero, %v1
bgti_cont.32288:
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
bgt_cont.32286:
bgt_cont.32252:
	lw	%v0, 12(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_print_char
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	blt	%v0, %v1, bgt_else.32319
	jr	%ra
bgt_else.32319:
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
	blt	%a2, %a3, bgt_else.32321
	addi	%v1, %zero, 0
	j	bgt_cont.32322
bgt_else.32321:
	lw	%a2, 2(%sp)
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.32323
	addi	%v1, %zero, 0
	j	bgt_cont.32324
bgt_else.32323:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.32325
	addi	%v1, %zero, 0
	j	bgt_cont.32326
bgt_else.32325:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.32327
	addi	%v1, %zero, 0
	j	bgt_cont.32328
bgt_else.32327:
	addi	%v1, %zero, 1
bgt_cont.32328:
bgt_cont.32326:
bgt_cont.32324:
bgt_cont.32322:
	sw	%v0, 28(%sp)
	beqi	%v1, 0, bnei_else.32329
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 8(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bnei_cont.32330
bnei_else.32329:
	lw	%v1, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
bnei_cont.32330:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32331
	blti	%v0, 0, bgti_else.32333
	j	bgt_cont.32332
bgti_else.32333:
	addi	%v0, %zero, 0
bgti_cont.32334:
	j	bgt_cont.32332
bgt_else.32331:
	addi	%v0, %zero, 255
bgt_cont.32332:
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
	blt	%at, %v0, bgt_else.32335
	blti	%v0, 0, bgti_else.32337
	j	bgt_cont.32336
bgti_else.32337:
	addi	%v0, %zero, 0
bgti_cont.32338:
	j	bgt_cont.32336
bgt_else.32335:
	addi	%v0, %zero, 255
bgt_cont.32336:
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
	blt	%at, %v0, bgt_else.32339
	blti	%v0, 0, bgti_else.32341
	j	bgt_cont.32340
bgti_else.32341:
	addi	%v0, %zero, 0
bgti_cont.32342:
	j	bgt_cont.32340
bgt_else.32339:
	addi	%v0, %zero, 255
bgt_cont.32340:
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
	blt	%v0, %t0, bgt_else.32408
	jr	%ra
bgt_else.32408:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.32410
	j	bgt_cont.32411
bgt_else.32410:
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
bgt_cont.32411:
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.32412
	j	bgt_cont.32413
bgt_else.32412:
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
	blt	%a3, %t0, bgt_else.32414
	addi	%a3, %zero, 0
	j	bgt_cont.32415
bgt_else.32414:
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.32416
	addi	%a3, %zero, 0
	j	bgt_cont.32417
bgt_else.32416:
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.32418
	addi	%a3, %zero, 0
	j	bgt_cont.32419
bgt_else.32418:
	addi	%a3, %zero, 0
bgt_cont.32419:
bgt_cont.32417:
bgt_cont.32415:
	beqi	%a3, 0, bnei_else.32420
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
	j	bnei_cont.32421
bnei_else.32420:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.32421:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32422
	blti	%v0, 0, bgti_else.32424
	j	bgt_cont.32423
bgti_else.32424:
	addi	%v0, %zero, 0
bgti_cont.32425:
	j	bgt_cont.32423
bgt_else.32422:
	addi	%v0, %zero, 255
bgt_cont.32423:
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
	blt	%at, %v0, bgt_else.32426
	blti	%v0, 0, bgti_else.32428
	j	bgt_cont.32427
bgti_else.32428:
	addi	%v0, %zero, 0
bgti_cont.32429:
	j	bgt_cont.32427
bgt_else.32426:
	addi	%v0, %zero, 255
bgt_cont.32427:
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
	blt	%at, %v0, bgt_else.32430
	blti	%v0, 0, bgti_else.32432
	j	bgt_cont.32431
bgti_else.32432:
	addi	%v0, %zero, 0
bgti_cont.32433:
	j	bgt_cont.32431
bgt_else.32430:
	addi	%v0, %zero, 255
bgt_cont.32431:
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
bgt_cont.32413:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.32434
	addi	%a0, %v0, -5
	j	bgti_cont.32435
bgti_else.32434:
	add	%a0, %zero, %v0
bgti_cont.32435:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.32436
	jr	%ra
bgt_else.32436:
	lw	%v0, 0(%sp)
	sw	%a0, 11(%sp)
	sw	%v1, 12(%sp)
	blt	%v1, %v0, bgt_else.32438
	j	bgt_cont.32439
bgt_else.32438:
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
bgt_cont.32439:
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
	blti	%v1, 5, bgti_else.32440
	addi	%a2, %v1, -5
	j	bgti_cont.32441
bgti_else.32440:
	add	%a2, %zero, %v1
bgti_cont.32441:
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
	blti	%v1, 0, bgti_else.32668
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
	blti	%v0, 0, bgti_else.32669
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
	blti	%v0, 0, bgti_else.32670
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
	blti	%v0, 0, bgti_else.32671
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
bgti_else.32671:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.32670:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.32669:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.32668:
	jr	%ra
calc_dirvec.3083:
	blti	%v0, 5, bgti_else.33676
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
bgti_else.33676:
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
	fblt	%f0, %f3, fbgt_else.33678
	addi	%v0, %zero, 1
	j	fbgt_cont.33679
fbgt_else.33678:
	addi	%v0, %zero, 0
fbgt_cont.33679:
	fabs	%f4, %f0
	flw	%f5, 494(%zero)
	fsw	%f3, 8(%sp)
	fsw	%f0, 9(%sp)
	sw	%v0, 10(%sp)
	fsw	%f2, 11(%sp)
	fsw	%f4, 12(%sp)
	fsw	%f5, 13(%sp)
	fblt	%f4, %f5, fbgt_else.33680
	flw	%f6, 493(%zero)
	fblt	%f4, %f6, fbgt_else.33682
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.33684
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.33686
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.33688
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.33690
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.33692
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.33694
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.33696
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.33698
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.33700
	flw	%f6, 483(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.33681
fbgt_else.33700:
	fmov	%f0, %f6
fbgt_cont.33701:
	j	fbgt_cont.33681
fbgt_else.33698:
	fmov	%f0, %f6
fbgt_cont.33699:
	j	fbgt_cont.33681
fbgt_else.33696:
	fmov	%f0, %f6
fbgt_cont.33697:
	j	fbgt_cont.33681
fbgt_else.33694:
	fmov	%f0, %f6
fbgt_cont.33695:
	j	fbgt_cont.33681
fbgt_else.33692:
	fmov	%f0, %f6
fbgt_cont.33693:
	j	fbgt_cont.33681
fbgt_else.33690:
	fmov	%f0, %f6
fbgt_cont.33691:
	j	fbgt_cont.33681
fbgt_else.33688:
	fmov	%f0, %f6
fbgt_cont.33689:
	j	fbgt_cont.33681
fbgt_else.33686:
	fmov	%f0, %f6
fbgt_cont.33687:
	j	fbgt_cont.33681
fbgt_else.33684:
	fmov	%f0, %f6
fbgt_cont.33685:
	j	fbgt_cont.33681
fbgt_else.33682:
	fmov	%f0, %f6
fbgt_cont.33683:
	j	fbgt_cont.33681
fbgt_else.33680:
	fmov	%f0, %f5
fbgt_cont.33681:
	flw	%f1, 12(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.33702
	fblt	%f1, %f0, fbgt_else.33704
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33706
	fblt	%f1, %f0, fbgt_else.33708
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33710
	fblt	%f1, %f0, fbgt_else.33712
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
	j	fbgt_cont.33703
fbgt_else.33712:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.33713:
	j	fbgt_cont.33703
fbgt_else.33710:
	fmov	%f0, %f1
fbgt_cont.33711:
	j	fbgt_cont.33703
fbgt_else.33708:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33714
	fblt	%f1, %f0, fbgt_else.33716
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
	j	fbgt_cont.33703
fbgt_else.33716:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.33717:
	j	fbgt_cont.33703
fbgt_else.33714:
	fmov	%f0, %f1
fbgt_cont.33715:
fbgt_cont.33709:
	j	fbgt_cont.33703
fbgt_else.33706:
	fmov	%f0, %f1
fbgt_cont.33707:
	j	fbgt_cont.33703
fbgt_else.33704:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33718
	fblt	%f1, %f0, fbgt_else.33720
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33722
	fblt	%f1, %f0, fbgt_else.33724
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
	j	fbgt_cont.33703
fbgt_else.33724:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.33725:
	j	fbgt_cont.33703
fbgt_else.33722:
	fmov	%f0, %f1
fbgt_cont.33723:
	j	fbgt_cont.33703
fbgt_else.33720:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33726
	fblt	%f1, %f0, fbgt_else.33728
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
	j	fbgt_cont.33703
fbgt_else.33728:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.33729:
	j	fbgt_cont.33703
fbgt_else.33726:
	fmov	%f0, %f1
fbgt_cont.33727:
fbgt_cont.33721:
	j	fbgt_cont.33703
fbgt_else.33718:
	fmov	%f0, %f1
fbgt_cont.33719:
fbgt_cont.33705:
	j	fbgt_cont.33703
fbgt_else.33702:
	fmov	%f0, %f1
fbgt_cont.33703:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.33730
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.33732
	addi	%v0, %zero, 0
	j	fbgt_cont.33731
bnei_else.33732:
	addi	%v0, %zero, 1
bnei_cont.33733:
	j	fbgt_cont.33731
fbgt_else.33730:
	lw	%v0, 10(%sp)
fbgt_cont.33731:
	fblt	%f0, %f1, fbgt_else.33734
	fsub	%f0, %f0, %f1
	j	fbgt_cont.33735
fbgt_else.33734:
fbgt_cont.33735:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.33736
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33737
fbgt_else.33736:
fbgt_cont.33737:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.33738
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
	j	fbgt_cont.33739
fbgt_else.33738:
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
fbgt_cont.33739:
	beqi	%v0, 0, bnei_else.33740
	j	bnei_cont.33741
bnei_else.33740:
	fneg	%f0, %f0
bnei_cont.33741:
	flw	%f4, 9(%sp)
	fabs	%f4, %f4
	flw	%f5, 13(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f3, 15(%sp)
	fsw	%f2, 16(%sp)
	fsw	%f4, 17(%sp)
	fblt	%f4, %f5, fbgt_else.33742
	flw	%f6, 493(%zero)
	fblt	%f4, %f6, fbgt_else.33744
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.33746
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.33748
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.33750
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.33752
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.33754
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.33756
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.33758
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.33760
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.33762
	flw	%f6, 483(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.33743
fbgt_else.33762:
	fmov	%f0, %f6
fbgt_cont.33763:
	j	fbgt_cont.33743
fbgt_else.33760:
	fmov	%f0, %f6
fbgt_cont.33761:
	j	fbgt_cont.33743
fbgt_else.33758:
	fmov	%f0, %f6
fbgt_cont.33759:
	j	fbgt_cont.33743
fbgt_else.33756:
	fmov	%f0, %f6
fbgt_cont.33757:
	j	fbgt_cont.33743
fbgt_else.33754:
	fmov	%f0, %f6
fbgt_cont.33755:
	j	fbgt_cont.33743
fbgt_else.33752:
	fmov	%f0, %f6
fbgt_cont.33753:
	j	fbgt_cont.33743
fbgt_else.33750:
	fmov	%f0, %f6
fbgt_cont.33751:
	j	fbgt_cont.33743
fbgt_else.33748:
	fmov	%f0, %f6
fbgt_cont.33749:
	j	fbgt_cont.33743
fbgt_else.33746:
	fmov	%f0, %f6
fbgt_cont.33747:
	j	fbgt_cont.33743
fbgt_else.33744:
	fmov	%f0, %f6
fbgt_cont.33745:
	j	fbgt_cont.33743
fbgt_else.33742:
	fmov	%f0, %f5
fbgt_cont.33743:
	flw	%f1, 17(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.33764
	fblt	%f1, %f0, fbgt_else.33766
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33768
	fblt	%f1, %f0, fbgt_else.33770
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33772
	fblt	%f1, %f0, fbgt_else.33774
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
	j	fbgt_cont.33765
fbgt_else.33774:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.33775:
	j	fbgt_cont.33765
fbgt_else.33772:
	fmov	%f0, %f1
fbgt_cont.33773:
	j	fbgt_cont.33765
fbgt_else.33770:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33776
	fblt	%f1, %f0, fbgt_else.33778
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
	j	fbgt_cont.33765
fbgt_else.33778:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.33779:
	j	fbgt_cont.33765
fbgt_else.33776:
	fmov	%f0, %f1
fbgt_cont.33777:
fbgt_cont.33771:
	j	fbgt_cont.33765
fbgt_else.33768:
	fmov	%f0, %f1
fbgt_cont.33769:
	j	fbgt_cont.33765
fbgt_else.33766:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33780
	fblt	%f1, %f0, fbgt_else.33782
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33784
	fblt	%f1, %f0, fbgt_else.33786
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
	j	fbgt_cont.33765
fbgt_else.33786:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.33787:
	j	fbgt_cont.33765
fbgt_else.33784:
	fmov	%f0, %f1
fbgt_cont.33785:
	j	fbgt_cont.33765
fbgt_else.33782:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33788
	fblt	%f1, %f0, fbgt_else.33790
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
	j	fbgt_cont.33765
fbgt_else.33790:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.33791:
	j	fbgt_cont.33765
fbgt_else.33788:
	fmov	%f0, %f1
fbgt_cont.33789:
fbgt_cont.33783:
	j	fbgt_cont.33765
fbgt_else.33780:
	fmov	%f0, %f1
fbgt_cont.33781:
fbgt_cont.33767:
	j	fbgt_cont.33765
fbgt_else.33764:
	fmov	%f0, %f1
fbgt_cont.33765:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.33792
	addi	%v0, %zero, 0
	j	fbgt_cont.33793
fbgt_else.33792:
	addi	%v0, %zero, 1
fbgt_cont.33793:
	fblt	%f0, %f1, fbgt_else.33794
	fsub	%f0, %f0, %f1
	j	fbgt_cont.33795
fbgt_else.33794:
fbgt_cont.33795:
	flw	%f2, 16(%sp)
	fblt	%f0, %f2, fbgt_else.33796
	beqi	%v0, 0, bnei_else.33798
	addi	%v0, %zero, 0
	j	fbgt_cont.33797
bnei_else.33798:
	addi	%v0, %zero, 1
bnei_cont.33799:
	j	fbgt_cont.33797
fbgt_else.33796:
fbgt_cont.33797:
	fblt	%f0, %f2, fbgt_else.33800
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33801
fbgt_else.33800:
fbgt_cont.33801:
	flw	%f3, 15(%sp)
	fblt	%f3, %f0, fbgt_else.33802
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
	j	fbgt_cont.33803
fbgt_else.33802:
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
fbgt_cont.33803:
	beqi	%v0, 0, bnei_else.33804
	j	bnei_cont.33805
bnei_else.33804:
	fneg	%f0, %f0
bnei_cont.33805:
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
	fblt	%f0, %f1, fbgt_else.33806
	addi	%v0, %zero, 1
	j	fbgt_cont.33807
fbgt_else.33806:
	addi	%v0, %zero, 0
fbgt_cont.33807:
	fabs	%f1, %f0
	flw	%f2, 13(%sp)
	fsw	%f0, 21(%sp)
	sw	%v0, 22(%sp)
	fsw	%f1, 23(%sp)
	fblt	%f1, %f2, fbgt_else.33808
	flw	%f4, 493(%zero)
	fblt	%f1, %f4, fbgt_else.33810
	flw	%f4, 492(%zero)
	fblt	%f1, %f4, fbgt_else.33812
	flw	%f4, 491(%zero)
	fblt	%f1, %f4, fbgt_else.33814
	flw	%f4, 490(%zero)
	fblt	%f1, %f4, fbgt_else.33816
	flw	%f4, 489(%zero)
	fblt	%f1, %f4, fbgt_else.33818
	flw	%f4, 488(%zero)
	fblt	%f1, %f4, fbgt_else.33820
	flw	%f4, 487(%zero)
	fblt	%f1, %f4, fbgt_else.33822
	flw	%f4, 486(%zero)
	fblt	%f1, %f4, fbgt_else.33824
	flw	%f4, 485(%zero)
	fblt	%f1, %f4, fbgt_else.33826
	flw	%f4, 484(%zero)
	fblt	%f1, %f4, fbgt_else.33828
	flw	%f4, 483(%zero)
	fmov	%f0, %f1
	fmov	%f1, %f4
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.33809
fbgt_else.33828:
	fmov	%f0, %f4
fbgt_cont.33829:
	j	fbgt_cont.33809
fbgt_else.33826:
	fmov	%f0, %f4
fbgt_cont.33827:
	j	fbgt_cont.33809
fbgt_else.33824:
	fmov	%f0, %f4
fbgt_cont.33825:
	j	fbgt_cont.33809
fbgt_else.33822:
	fmov	%f0, %f4
fbgt_cont.33823:
	j	fbgt_cont.33809
fbgt_else.33820:
	fmov	%f0, %f4
fbgt_cont.33821:
	j	fbgt_cont.33809
fbgt_else.33818:
	fmov	%f0, %f4
fbgt_cont.33819:
	j	fbgt_cont.33809
fbgt_else.33816:
	fmov	%f0, %f4
fbgt_cont.33817:
	j	fbgt_cont.33809
fbgt_else.33814:
	fmov	%f0, %f4
fbgt_cont.33815:
	j	fbgt_cont.33809
fbgt_else.33812:
	fmov	%f0, %f4
fbgt_cont.33813:
	j	fbgt_cont.33809
fbgt_else.33810:
	fmov	%f0, %f4
fbgt_cont.33811:
	j	fbgt_cont.33809
fbgt_else.33808:
	fmov	%f0, %f2
fbgt_cont.33809:
	flw	%f1, 23(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.33830
	fblt	%f1, %f0, fbgt_else.33832
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33834
	fblt	%f1, %f0, fbgt_else.33836
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33838
	fblt	%f1, %f0, fbgt_else.33840
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
	j	fbgt_cont.33831
fbgt_else.33840:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.33841:
	j	fbgt_cont.33831
fbgt_else.33838:
	fmov	%f0, %f1
fbgt_cont.33839:
	j	fbgt_cont.33831
fbgt_else.33836:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33842
	fblt	%f1, %f0, fbgt_else.33844
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
	j	fbgt_cont.33831
fbgt_else.33844:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.33845:
	j	fbgt_cont.33831
fbgt_else.33842:
	fmov	%f0, %f1
fbgt_cont.33843:
fbgt_cont.33837:
	j	fbgt_cont.33831
fbgt_else.33834:
	fmov	%f0, %f1
fbgt_cont.33835:
	j	fbgt_cont.33831
fbgt_else.33832:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33846
	fblt	%f1, %f0, fbgt_else.33848
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33850
	fblt	%f1, %f0, fbgt_else.33852
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
	j	fbgt_cont.33831
fbgt_else.33852:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.33853:
	j	fbgt_cont.33831
fbgt_else.33850:
	fmov	%f0, %f1
fbgt_cont.33851:
	j	fbgt_cont.33831
fbgt_else.33848:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33854
	fblt	%f1, %f0, fbgt_else.33856
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
	j	fbgt_cont.33831
fbgt_else.33856:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.33857:
	j	fbgt_cont.33831
fbgt_else.33854:
	fmov	%f0, %f1
fbgt_cont.33855:
fbgt_cont.33849:
	j	fbgt_cont.33831
fbgt_else.33846:
	fmov	%f0, %f1
fbgt_cont.33847:
fbgt_cont.33833:
	j	fbgt_cont.33831
fbgt_else.33830:
	fmov	%f0, %f1
fbgt_cont.33831:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.33858
	lw	%v0, 22(%sp)
	beqi	%v0, 0, bnei_else.33860
	addi	%v0, %zero, 0
	j	fbgt_cont.33859
bnei_else.33860:
	addi	%v0, %zero, 1
bnei_cont.33861:
	j	fbgt_cont.33859
fbgt_else.33858:
	lw	%v0, 22(%sp)
fbgt_cont.33859:
	fblt	%f0, %f1, fbgt_else.33862
	fsub	%f0, %f0, %f1
	j	fbgt_cont.33863
fbgt_else.33862:
fbgt_cont.33863:
	flw	%f2, 16(%sp)
	fblt	%f0, %f2, fbgt_else.33864
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33865
fbgt_else.33864:
fbgt_cont.33865:
	flw	%f3, 15(%sp)
	fblt	%f3, %f0, fbgt_else.33866
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
	j	fbgt_cont.33867
fbgt_else.33866:
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
fbgt_cont.33867:
	beqi	%v0, 0, bnei_else.33868
	j	bnei_cont.33869
bnei_else.33868:
	fneg	%f0, %f0
bnei_cont.33869:
	flw	%f4, 21(%sp)
	fabs	%f4, %f4
	flw	%f5, 13(%sp)
	fsw	%f0, 24(%sp)
	fsw	%f4, 25(%sp)
	fblt	%f4, %f5, fbgt_else.33870
	flw	%f6, 493(%zero)
	fblt	%f4, %f6, fbgt_else.33872
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.33874
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.33876
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.33878
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.33880
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.33882
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.33884
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.33886
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.33888
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.33890
	flw	%f6, 483(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.33871
fbgt_else.33890:
	fmov	%f0, %f6
fbgt_cont.33891:
	j	fbgt_cont.33871
fbgt_else.33888:
	fmov	%f0, %f6
fbgt_cont.33889:
	j	fbgt_cont.33871
fbgt_else.33886:
	fmov	%f0, %f6
fbgt_cont.33887:
	j	fbgt_cont.33871
fbgt_else.33884:
	fmov	%f0, %f6
fbgt_cont.33885:
	j	fbgt_cont.33871
fbgt_else.33882:
	fmov	%f0, %f6
fbgt_cont.33883:
	j	fbgt_cont.33871
fbgt_else.33880:
	fmov	%f0, %f6
fbgt_cont.33881:
	j	fbgt_cont.33871
fbgt_else.33878:
	fmov	%f0, %f6
fbgt_cont.33879:
	j	fbgt_cont.33871
fbgt_else.33876:
	fmov	%f0, %f6
fbgt_cont.33877:
	j	fbgt_cont.33871
fbgt_else.33874:
	fmov	%f0, %f6
fbgt_cont.33875:
	j	fbgt_cont.33871
fbgt_else.33872:
	fmov	%f0, %f6
fbgt_cont.33873:
	j	fbgt_cont.33871
fbgt_else.33870:
	fmov	%f0, %f5
fbgt_cont.33871:
	flw	%f1, 25(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.33892
	fblt	%f1, %f0, fbgt_else.33894
	fsub	%f1, %f1, %f0
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33896
	fblt	%f1, %f0, fbgt_else.33898
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33900
	fblt	%f1, %f0, fbgt_else.33902
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
	j	fbgt_cont.33893
fbgt_else.33902:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.33903:
	j	fbgt_cont.33893
fbgt_else.33900:
	fmov	%f0, %f1
fbgt_cont.33901:
	j	fbgt_cont.33893
fbgt_else.33898:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33904
	fblt	%f1, %f0, fbgt_else.33906
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
	j	fbgt_cont.33893
fbgt_else.33906:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.33907:
	j	fbgt_cont.33893
fbgt_else.33904:
	fmov	%f0, %f1
fbgt_cont.33905:
fbgt_cont.33899:
	j	fbgt_cont.33893
fbgt_else.33896:
	fmov	%f0, %f1
fbgt_cont.33897:
	j	fbgt_cont.33893
fbgt_else.33894:
	flw	%f3, 496(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33908
	fblt	%f1, %f0, fbgt_else.33910
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33912
	fblt	%f1, %f0, fbgt_else.33914
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
	j	fbgt_cont.33893
fbgt_else.33914:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.33915:
	j	fbgt_cont.33893
fbgt_else.33912:
	fmov	%f0, %f1
fbgt_cont.33913:
	j	fbgt_cont.33893
fbgt_else.33910:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.33916
	fblt	%f1, %f0, fbgt_else.33918
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
	j	fbgt_cont.33893
fbgt_else.33918:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.33919:
	j	fbgt_cont.33893
fbgt_else.33916:
	fmov	%f0, %f1
fbgt_cont.33917:
fbgt_cont.33911:
	j	fbgt_cont.33893
fbgt_else.33908:
	fmov	%f0, %f1
fbgt_cont.33909:
fbgt_cont.33895:
	j	fbgt_cont.33893
fbgt_else.33892:
	fmov	%f0, %f1
fbgt_cont.33893:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.33920
	addi	%v0, %zero, 0
	j	fbgt_cont.33921
fbgt_else.33920:
	addi	%v0, %zero, 1
fbgt_cont.33921:
	fblt	%f0, %f1, fbgt_else.33922
	fsub	%f0, %f0, %f1
	j	fbgt_cont.33923
fbgt_else.33922:
fbgt_cont.33923:
	flw	%f2, 16(%sp)
	fblt	%f0, %f2, fbgt_else.33924
	beqi	%v0, 0, bnei_else.33926
	addi	%v0, %zero, 0
	j	fbgt_cont.33925
bnei_else.33926:
	addi	%v0, %zero, 1
bnei_cont.33927:
	j	fbgt_cont.33925
fbgt_else.33924:
fbgt_cont.33925:
	fblt	%f0, %f2, fbgt_else.33928
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33929
fbgt_else.33928:
fbgt_cont.33929:
	flw	%f1, 15(%sp)
	fblt	%f1, %f0, fbgt_else.33930
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
	j	fbgt_cont.33931
fbgt_else.33930:
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
fbgt_cont.33931:
	beqi	%v0, 0, bnei_else.33932
	j	bnei_cont.33933
bnei_else.33932:
	fneg	%f0, %f0
bnei_cont.33933:
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
	blti	%v0, 0, bgti_else.33962
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
	blti	%v1, 5, bgti_else.33963
	addi	%v1, %v1, -5
	j	bgti_cont.33964
bgti_else.33963:
bgti_cont.33964:
	blti	%v0, 0, bgti_else.33965
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
	blti	%v1, 5, bgti_else.33966
	addi	%v1, %v1, -5
	j	bgti_cont.33967
bgti_else.33966:
bgti_cont.33967:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3091
bgti_else.33965:
	jr	%ra
bgti_else.33962:
	jr	%ra
calc_dirvec_rows.3096:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.33990
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
	blti	%a0, 5, bgti_else.33991
	addi	%a0, %a0, -5
	j	bgti_cont.33992
bgti_else.33991:
bgti_cont.33992:
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
	blti	%v1, 5, bgti_else.33993
	addi	%v1, %v1, -5
	j	bgti_cont.33994
bgti_else.33993:
bgti_cont.33994:
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.33995
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
	blti	%v1, 5, bgti_else.33996
	addi	%v1, %v1, -5
	j	bgti_cont.33997
bgti_else.33996:
bgti_cont.33997:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3096
bgti_else.33995:
	jr	%ra
bgti_else.33990:
	jr	%ra
create_dirvec_elements.3102:
	blti	%v1, 0, bgti_else.34022
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
	blti	%v0, 0, bgti_else.34023
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
	blti	%v0, 0, bgti_else.34024
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
	blti	%v0, 0, bgti_else.34025
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
bgti_else.34025:
	jr	%ra
bgti_else.34024:
	jr	%ra
bgti_else.34023:
	jr	%ra
bgti_else.34022:
	jr	%ra
create_dirvecs.3105:
	blti	%v0, 0, bgti_else.34068
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
	blti	%v0, 0, bgti_else.34069
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
bgti_else.34069:
	jr	%ra
bgti_else.34068:
	jr	%ra
init_dirvec_constants.3107:
	blti	%v1, 0, bgti_else.34133
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
	blti	%v0, 0, bgti_else.34134
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.34135
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.34137
	beqi	%t1, 2, bnei_else.34139
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
	j	bnei_cont.34138
bnei_else.34139:
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
	fblt	%f1, %f0, fbgt_else.34141
	addi	%v1, %zero, 0
	j	fbgt_cont.34142
fbgt_else.34141:
	addi	%v1, %zero, 1
fbgt_cont.34142:
	beqi	%v1, 0, bnei_else.34143
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
	j	bnei_cont.34144
bnei_else.34143:
	fsw	%f1, 0(%v0)
bnei_cont.34144:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.34140:
	j	bnei_cont.34138
bnei_else.34137:
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
bnei_cont.34138:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bgti_cont.34136
bgti_else.34135:
bgti_cont.34136:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.34145
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
	blti	%v0, 0, bgti_else.34146
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
bgti_else.34146:
	jr	%ra
bgti_else.34145:
	jr	%ra
bgti_else.34134:
	jr	%ra
bgti_else.34133:
	jr	%ra
init_vecset_constants.3110:
	blti	%v0, 0, bgti_else.34197
	lw	%v1, 179(%v0)
	addi	%a0, %zero, 119
	lw	%a1, 119(%v1)
	lw	%a2, 0(%zero)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v1, 3(%sp)
	blti	%a2, 0, bgti_else.34198
	lw	%a3, 12(%a2)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.34200
	beqi	%t2, 2, bnei_else.34202
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
	j	bnei_cont.34201
bnei_else.34202:
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
	fblt	%f1, %f0, fbgt_else.34204
	addi	%v1, %zero, 0
	j	fbgt_cont.34205
fbgt_else.34204:
	addi	%v1, %zero, 1
fbgt_cont.34205:
	beqi	%v1, 0, bnei_else.34206
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
	j	bnei_cont.34207
bnei_else.34206:
	fsw	%f1, 0(%v0)
bnei_cont.34207:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.34203:
	j	bnei_cont.34201
bnei_else.34200:
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
bnei_cont.34201:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bgti_cont.34199
bgti_else.34198:
bgti_cont.34199:
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
	blti	%v0, 0, bgti_else.34208
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
	blti	%v0, 0, bgti_else.34209
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
	blti	%v0, 0, bgti_else.34210
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
bgti_else.34210:
	jr	%ra
bgti_else.34209:
	jr	%ra
bgti_else.34208:
	jr	%ra
bgti_else.34197:
	jr	%ra
setup_reflections.3127:
	blti	%v0, 0, bgti_else.34262
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.34263
	jr	%ra
bnei_else.34263:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 474(%zero)
	fblt	%f0, %f1, fbgt_else.34265
	addi	%a0, %zero, 0
	j	fbgt_cont.34266
fbgt_else.34265:
	addi	%a0, %zero, 1
fbgt_cont.34266:
	beqi	%a0, 0, bnei_else.34267
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.34268
	beqi	%a0, 2, bnei_else.34269
	jr	%ra
bnei_else.34269:
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
bnei_else.34268:
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
bnei_else.34267:
	jr	%ra
bgti_else.34262:
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
	blti	%a0, 0, bgti_else.34631
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
	j	bgti_cont.34632
bgti_else.34631:
bgti_cont.34632:
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
	blti	%v1, 0, bgti_else.34633
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
	j	bgti_cont.34634
bgti_else.34633:
bgti_cont.34634:
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
	blti	%v1, 0, bgti_else.34635
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
	j	bgti_cont.34636
bgti_else.34635:
bgti_cont.34636:
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
	beqi	%v0, 0, bnei_else.34637
	lw	%v0, 0(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_nth_object.2782
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	beqi	%v0, 0, bnei_else.34639
	lw	%v0, 6(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_nth_object.2782
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	beqi	%v0, 0, bnei_else.34641
	lw	%v0, 4(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_nth_object.2782
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	beqi	%v0, 0, bnei_else.34643
	lw	%v0, 14(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_object.2784
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	bnei_cont.34638
bnei_else.34643:
	lw	%v0, 4(%sp)
	sw	%v0, 0(%zero)
bnei_cont.34644:
	j	bnei_cont.34638
bnei_else.34641:
	lw	%v0, 6(%sp)
	sw	%v0, 0(%zero)
bnei_cont.34642:
	j	bnei_cont.34638
bnei_else.34639:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
bnei_cont.34640:
	j	bnei_cont.34638
bnei_else.34637:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
bnei_cont.34638:
	lw	%v0, 1(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_net_item.2788
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.34645
	sw	%v0, 83(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_and_network.2792
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	bnei_cont.34646
bnei_else.34645:
bnei_cont.34646:
	lw	%v0, 1(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	read_net_item.2788
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.34647
	lw	%v0, 0(%sp)
	sw	%v1, 48(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	read_or_network.2790
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.34648
bnei_else.34647:
	lw	%v0, 0(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_create_array
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
bnei_cont.34648:
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
	blti	%v0, 0, bgti_else.34649
	lw	%v1, 12(%v0)
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.34651
	beqi	%a0, 2, bnei_else.34653
	addi	%a0, %zero, 184
	addi	%v0, %a0, 0
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	setup_second_table.2886
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	lw	%v1, 53(%sp)
	sw	%v0, 187(%v1)
	j	bnei_cont.34652
bnei_else.34653:
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
	fblt	%f1, %f0, fbgt_else.34655
	addi	%a0, %zero, 0
	j	fbgt_cont.34656
fbgt_else.34655:
	addi	%a0, %zero, 1
fbgt_cont.34656:
	beqi	%a0, 0, bnei_else.34657
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
	j	bnei_cont.34658
bnei_else.34657:
	fsw	%f1, 0(%v0)
bnei_cont.34658:
	lw	%v1, 53(%sp)
	sw	%v0, 187(%v1)
bnei_cont.34654:
	j	bnei_cont.34652
bnei_else.34651:
	addi	%a0, %zero, 184
	addi	%v0, %a0, 0
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	setup_rect_table.2880
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	lw	%v1, 53(%sp)
	sw	%v0, 187(%v1)
bnei_cont.34652:
	addi	%v0, %v1, -1
	addi	%a0, %zero, 247
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	j	bgti_cont.34650
bgti_else.34649:
bgti_cont.34650:
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
