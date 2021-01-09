.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 29
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
f.295.477:
	fblt	%f0, %f1, fbgt_else.831
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.832
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.833
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.834
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.835
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.836
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.837
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.838
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.839
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.840
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.841
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.842
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.843
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.844
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.845
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.846
	fmul	%f1, %f2, %f1
	j	f.295.477
fbgt_else.846:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.845:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.844:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.843:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.842:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.841:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.840:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.839:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.838:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.837:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.836:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.835:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.834:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.833:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.832:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.831:
	fmov	%f0, %f1
	jr	%ra
g.299.481:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.847
	fblt	%f0, %f1, fbgt_else.848
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.849
	fblt	%f0, %f1, fbgt_else.850
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.851
	fblt	%f0, %f1, fbgt_else.852
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.853
	fblt	%f0, %f1, fbgt_else.854
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.854:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.853:
	jr	%ra
fbgt_else.852:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.855
	fblt	%f0, %f1, fbgt_else.856
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.856:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.855:
	jr	%ra
fbgt_else.851:
	jr	%ra
fbgt_else.850:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.857
	fblt	%f0, %f1, fbgt_else.858
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.859
	fblt	%f0, %f1, fbgt_else.860
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.860:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.859:
	jr	%ra
fbgt_else.858:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.861
	fblt	%f0, %f1, fbgt_else.862
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.862:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.861:
	jr	%ra
fbgt_else.857:
	jr	%ra
fbgt_else.849:
	jr	%ra
fbgt_else.848:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.863
	fblt	%f0, %f1, fbgt_else.864
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.865
	fblt	%f0, %f1, fbgt_else.866
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.867
	fblt	%f0, %f1, fbgt_else.868
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.868:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.867:
	jr	%ra
fbgt_else.866:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.869
	fblt	%f0, %f1, fbgt_else.870
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.870:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.869:
	jr	%ra
fbgt_else.865:
	jr	%ra
fbgt_else.864:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.871
	fblt	%f0, %f1, fbgt_else.872
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.873
	fblt	%f0, %f1, fbgt_else.874
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.874:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.873:
	jr	%ra
fbgt_else.872:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.875
	fblt	%f0, %f1, fbgt_else.876
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.876:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.875:
	jr	%ra
fbgt_else.871:
	jr	%ra
fbgt_else.863:
	jr	%ra
fbgt_else.847:
	jr	%ra
sin.223:
	flw	%f1, 27(%zero)
	flw	%f2, 26(%zero)
	fblt	%f0, %f2, fbgt_else.877
	addi	%v0, %zero, 1
	j	fbgt_cont.878
fbgt_else.877:
	addi	%v0, %zero, 0
fbgt_cont.878:
	fabs	%f0, %f0
	flw	%f2, 25(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.879
	flw	%f3, 24(%zero)
	fblt	%f0, %f3, fbgt_else.881
	flw	%f3, 23(%zero)
	fblt	%f0, %f3, fbgt_else.883
	flw	%f3, 22(%zero)
	fblt	%f0, %f3, fbgt_else.885
	flw	%f3, 21(%zero)
	fblt	%f0, %f3, fbgt_else.887
	flw	%f3, 20(%zero)
	fblt	%f0, %f3, fbgt_else.889
	flw	%f3, 19(%zero)
	fblt	%f0, %f3, fbgt_else.891
	flw	%f3, 18(%zero)
	fblt	%f0, %f3, fbgt_else.893
	flw	%f3, 17(%zero)
	fblt	%f0, %f3, fbgt_else.895
	flw	%f3, 16(%zero)
	fblt	%f0, %f3, fbgt_else.897
	flw	%f3, 15(%zero)
	fblt	%f0, %f3, fbgt_else.899
	flw	%f3, 14(%zero)
	fblt	%f0, %f3, fbgt_else.901
	flw	%f3, 13(%zero)
	fblt	%f0, %f3, fbgt_else.903
	flw	%f3, 12(%zero)
	fblt	%f0, %f3, fbgt_else.905
	flw	%f3, 11(%zero)
	fblt	%f0, %f3, fbgt_else.907
	flw	%f3, 10(%zero)
	fmov	%f1, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	f.295.477
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.908
fbgt_else.907:
	fmov	%f0, %f3
fbgt_cont.908:
	j	fbgt_cont.906
fbgt_else.905:
	fmov	%f0, %f3
fbgt_cont.906:
	j	fbgt_cont.904
fbgt_else.903:
	fmov	%f0, %f3
fbgt_cont.904:
	j	fbgt_cont.902
fbgt_else.901:
	fmov	%f0, %f3
fbgt_cont.902:
	j	fbgt_cont.900
fbgt_else.899:
	fmov	%f0, %f3
fbgt_cont.900:
	j	fbgt_cont.898
fbgt_else.897:
	fmov	%f0, %f3
fbgt_cont.898:
	j	fbgt_cont.896
fbgt_else.895:
	fmov	%f0, %f3
fbgt_cont.896:
	j	fbgt_cont.894
fbgt_else.893:
	fmov	%f0, %f3
fbgt_cont.894:
	j	fbgt_cont.892
fbgt_else.891:
	fmov	%f0, %f3
fbgt_cont.892:
	j	fbgt_cont.890
fbgt_else.889:
	fmov	%f0, %f3
fbgt_cont.890:
	j	fbgt_cont.888
fbgt_else.887:
	fmov	%f0, %f3
fbgt_cont.888:
	j	fbgt_cont.886
fbgt_else.885:
	fmov	%f0, %f3
fbgt_cont.886:
	j	fbgt_cont.884
fbgt_else.883:
	fmov	%f0, %f3
fbgt_cont.884:
	j	fbgt_cont.882
fbgt_else.881:
	fmov	%f0, %f3
fbgt_cont.882:
	j	fbgt_cont.880
fbgt_else.879:
	fmov	%f0, %f2
fbgt_cont.880:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.299.481
	sw	%v0, 0(%k1)
	flw	%f1, 3(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 2(%sp)
	fblt	%f2, %f1, fbgt_else.909
	fblt	%f2, %f0, fbgt_else.911
	fsub	%f2, %f2, %f0
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.913
	fblt	%f2, %f0, fbgt_else.915
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.917
	fblt	%f2, %f0, fbgt_else.919
	fsub	%f1, %f2, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.920
fbgt_else.919:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.920:
	j	fbgt_cont.918
fbgt_else.917:
	fmov	%f0, %f2
fbgt_cont.918:
	j	fbgt_cont.916
fbgt_else.915:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.921
	fblt	%f2, %f0, fbgt_else.923
	fsub	%f1, %f2, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.924
fbgt_else.923:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.924:
	j	fbgt_cont.922
fbgt_else.921:
	fmov	%f0, %f2
fbgt_cont.922:
fbgt_cont.916:
	j	fbgt_cont.914
fbgt_else.913:
	fmov	%f0, %f2
fbgt_cont.914:
	j	fbgt_cont.912
fbgt_else.911:
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.925
	fblt	%f2, %f0, fbgt_else.927
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.929
	fblt	%f2, %f0, fbgt_else.931
	fsub	%f1, %f2, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.932
fbgt_else.931:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.932:
	j	fbgt_cont.930
fbgt_else.929:
	fmov	%f0, %f2
fbgt_cont.930:
	j	fbgt_cont.928
fbgt_else.927:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.933
	fblt	%f2, %f0, fbgt_else.935
	fsub	%f1, %f2, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.936
fbgt_else.935:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.936:
	j	fbgt_cont.934
fbgt_else.933:
	fmov	%f0, %f2
fbgt_cont.934:
fbgt_cont.928:
	j	fbgt_cont.926
fbgt_else.925:
	fmov	%f0, %f2
fbgt_cont.926:
fbgt_cont.912:
	j	fbgt_cont.910
fbgt_else.909:
	fmov	%f0, %f2
fbgt_cont.910:
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.937
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.939
	addi	%v0, %zero, 0
	j	bnei_cont.940
bnei_else.939:
	addi	%v0, %zero, 1
bnei_cont.940:
	j	fbgt_cont.938
fbgt_else.937:
	lw	%v0, 0(%sp)
fbgt_cont.938:
	fblt	%f0, %f1, fbgt_else.941
	fsub	%f0, %f0, %f1
	j	fbgt_cont.942
fbgt_else.941:
fbgt_cont.942:
	flw	%f2, 9(%zero)
	fblt	%f0, %f2, fbgt_else.943
	fsub	%f0, %f1, %f0
	j	fbgt_cont.944
fbgt_else.943:
fbgt_cont.944:
	flw	%f1, 8(%zero)
	fblt	%f1, %f0, fbgt_else.945
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 3(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 2(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 1(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.946
fbgt_else.945:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 7(%zero)
	flw	%f3, 6(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 5(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 4(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.946:
	beqi	%v0, 0, bnei_else.947
	jr	%ra
bnei_else.947:
	fneg	%f0, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 0(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	sin.223
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fmov	%g0, %f0
	ret
