.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 28
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
f.295.520:
	fblt	%f0, %f1, fbgt_else.814
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.815
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.816
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.817
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.818
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.819
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.820
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.821
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.822
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.823
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.824
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.825
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.826
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.827
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.828
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.829
	fmul	%f1, %f2, %f1
	j	f.295.520
fbgt_else.829:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.828:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.827:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.826:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.825:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.824:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.823:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.822:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.821:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.820:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.819:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.818:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.817:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.816:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.815:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.814:
	fmov	%f0, %f1
	jr	%ra
g.299.524:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.830
	fblt	%f0, %f1, fbgt_else.831
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.832
	fblt	%f0, %f1, fbgt_else.833
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.834
	fblt	%f0, %f1, fbgt_else.835
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.836
	fblt	%f0, %f1, fbgt_else.837
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.837:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.836:
	jr	%ra
fbgt_else.835:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.838
	fblt	%f0, %f1, fbgt_else.839
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.839:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.838:
	jr	%ra
fbgt_else.834:
	jr	%ra
fbgt_else.833:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.840
	fblt	%f0, %f1, fbgt_else.841
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.842
	fblt	%f0, %f1, fbgt_else.843
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.843:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.842:
	jr	%ra
fbgt_else.841:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.844
	fblt	%f0, %f1, fbgt_else.845
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.845:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.844:
	jr	%ra
fbgt_else.840:
	jr	%ra
fbgt_else.832:
	jr	%ra
fbgt_else.831:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.846
	fblt	%f0, %f1, fbgt_else.847
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.848
	fblt	%f0, %f1, fbgt_else.849
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.850
	fblt	%f0, %f1, fbgt_else.851
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.851:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.850:
	jr	%ra
fbgt_else.849:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.852
	fblt	%f0, %f1, fbgt_else.853
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.853:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.852:
	jr	%ra
fbgt_else.848:
	jr	%ra
fbgt_else.847:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.854
	fblt	%f0, %f1, fbgt_else.855
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.856
	fblt	%f0, %f1, fbgt_else.857
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.857:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.856:
	jr	%ra
fbgt_else.855:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.858
	fblt	%f0, %f1, fbgt_else.859
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.859:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.858:
	jr	%ra
fbgt_else.854:
	jr	%ra
fbgt_else.846:
	jr	%ra
fbgt_else.830:
	jr	%ra
cos.221:
	flw	%f1, 26(%zero)
	fabs	%f0, %f0
	flw	%f2, 25(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.860
	flw	%f3, 24(%zero)
	fblt	%f0, %f3, fbgt_else.862
	flw	%f3, 23(%zero)
	fblt	%f0, %f3, fbgt_else.864
	flw	%f3, 22(%zero)
	fblt	%f0, %f3, fbgt_else.866
	flw	%f3, 21(%zero)
	fblt	%f0, %f3, fbgt_else.868
	flw	%f3, 20(%zero)
	fblt	%f0, %f3, fbgt_else.870
	flw	%f3, 19(%zero)
	fblt	%f0, %f3, fbgt_else.872
	flw	%f3, 18(%zero)
	fblt	%f0, %f3, fbgt_else.874
	flw	%f3, 17(%zero)
	fblt	%f0, %f3, fbgt_else.876
	flw	%f3, 16(%zero)
	fblt	%f0, %f3, fbgt_else.878
	flw	%f3, 15(%zero)
	fblt	%f0, %f3, fbgt_else.880
	flw	%f3, 14(%zero)
	fblt	%f0, %f3, fbgt_else.882
	flw	%f3, 13(%zero)
	fblt	%f0, %f3, fbgt_else.884
	flw	%f3, 12(%zero)
	fblt	%f0, %f3, fbgt_else.886
	flw	%f3, 11(%zero)
	fblt	%f0, %f3, fbgt_else.888
	flw	%f3, 10(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	f.295.520
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.889
fbgt_else.888:
	fmov	%f0, %f3
fbgt_cont.889:
	j	fbgt_cont.887
fbgt_else.886:
	fmov	%f0, %f3
fbgt_cont.887:
	j	fbgt_cont.885
fbgt_else.884:
	fmov	%f0, %f3
fbgt_cont.885:
	j	fbgt_cont.883
fbgt_else.882:
	fmov	%f0, %f3
fbgt_cont.883:
	j	fbgt_cont.881
fbgt_else.880:
	fmov	%f0, %f3
fbgt_cont.881:
	j	fbgt_cont.879
fbgt_else.878:
	fmov	%f0, %f3
fbgt_cont.879:
	j	fbgt_cont.877
fbgt_else.876:
	fmov	%f0, %f3
fbgt_cont.877:
	j	fbgt_cont.875
fbgt_else.874:
	fmov	%f0, %f3
fbgt_cont.875:
	j	fbgt_cont.873
fbgt_else.872:
	fmov	%f0, %f3
fbgt_cont.873:
	j	fbgt_cont.871
fbgt_else.870:
	fmov	%f0, %f3
fbgt_cont.871:
	j	fbgt_cont.869
fbgt_else.868:
	fmov	%f0, %f3
fbgt_cont.869:
	j	fbgt_cont.867
fbgt_else.866:
	fmov	%f0, %f3
fbgt_cont.867:
	j	fbgt_cont.865
fbgt_else.864:
	fmov	%f0, %f3
fbgt_cont.865:
	j	fbgt_cont.863
fbgt_else.862:
	fmov	%f0, %f3
fbgt_cont.863:
	j	fbgt_cont.861
fbgt_else.860:
	fmov	%f0, %f2
fbgt_cont.861:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.299.524
	sw	%v0, 0(%k1)
	flw	%f1, 2(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 1(%sp)
	fblt	%f2, %f1, fbgt_else.890
	fblt	%f2, %f0, fbgt_else.892
	fsub	%f2, %f2, %f0
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.894
	fblt	%f2, %f0, fbgt_else.896
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.898
	fblt	%f2, %f0, fbgt_else.900
	fsub	%f1, %f2, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.901
fbgt_else.900:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.901:
	j	fbgt_cont.899
fbgt_else.898:
	fmov	%f0, %f2
fbgt_cont.899:
	j	fbgt_cont.897
fbgt_else.896:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.902
	fblt	%f2, %f0, fbgt_else.904
	fsub	%f1, %f2, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.905
fbgt_else.904:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.905:
	j	fbgt_cont.903
fbgt_else.902:
	fmov	%f0, %f2
fbgt_cont.903:
fbgt_cont.897:
	j	fbgt_cont.895
fbgt_else.894:
	fmov	%f0, %f2
fbgt_cont.895:
	j	fbgt_cont.893
fbgt_else.892:
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.906
	fblt	%f2, %f0, fbgt_else.908
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.910
	fblt	%f2, %f0, fbgt_else.912
	fsub	%f1, %f2, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.913
fbgt_else.912:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.913:
	j	fbgt_cont.911
fbgt_else.910:
	fmov	%f0, %f2
fbgt_cont.911:
	j	fbgt_cont.909
fbgt_else.908:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.914
	fblt	%f2, %f0, fbgt_else.916
	fsub	%f1, %f2, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.917
fbgt_else.916:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.917:
	j	fbgt_cont.915
fbgt_else.914:
	fmov	%f0, %f2
fbgt_cont.915:
fbgt_cont.909:
	j	fbgt_cont.907
fbgt_else.906:
	fmov	%f0, %f2
fbgt_cont.907:
fbgt_cont.893:
	j	fbgt_cont.891
fbgt_else.890:
	fmov	%f0, %f2
fbgt_cont.891:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.918
	addi	%v0, %zero, 0
	j	fbgt_cont.919
fbgt_else.918:
	addi	%v0, %zero, 1
fbgt_cont.919:
	fblt	%f0, %f1, fbgt_else.920
	fsub	%f0, %f0, %f1
	j	fbgt_cont.921
fbgt_else.920:
fbgt_cont.921:
	flw	%f2, 9(%zero)
	fblt	%f0, %f2, fbgt_else.922
	beqi	%v0, 0, bnei_else.924
	addi	%v0, %zero, 0
	j	bnei_cont.925
bnei_else.924:
	addi	%v0, %zero, 1
bnei_cont.925:
	j	fbgt_cont.923
fbgt_else.922:
fbgt_cont.923:
	fblt	%f0, %f2, fbgt_else.926
	fsub	%f0, %f1, %f0
	j	fbgt_cont.927
fbgt_else.926:
fbgt_cont.927:
	flw	%f1, 8(%zero)
	fblt	%f1, %f0, fbgt_else.928
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 4(%zero)
	flw	%f3, 3(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 2(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 1(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.929
fbgt_else.928:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 7(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 6(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 5(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.929:
	beqi	%v0, 0, bnei_else.930
	jr	%ra
bnei_else.930:
	fneg	%f0, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 0(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	cos.221
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fmov	%g0, %f0
	ret
