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
f.297.479:
	fblt	%f0, %f1, fbgt_else.889
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.890
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.891
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.892
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.893
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.894
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.895
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.896
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.897
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.898
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.899
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.900
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.901
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.902
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.903
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.904
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	j	f.297.479
fbgt_else.904:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.903:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.902:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.901:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.900:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.899:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.898:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.897:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.896:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.895:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.894:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.893:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.892:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.891:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.890:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.889:
	fmov	%f0, %f1
	jr	%ra
g.301.483:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.905
	fblt	%f0, %f1, fbgt_else.906
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.907
	fblt	%f0, %f1, fbgt_else.908
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.909
	fblt	%f0, %f1, fbgt_else.910
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.911
	fblt	%f0, %f1, fbgt_else.912
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.912:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.911:
	jr	%ra
fbgt_else.910:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.913
	fblt	%f0, %f1, fbgt_else.914
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.914:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.913:
	jr	%ra
fbgt_else.909:
	jr	%ra
fbgt_else.908:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.915
	fblt	%f0, %f1, fbgt_else.916
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.917
	fblt	%f0, %f1, fbgt_else.918
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.918:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.917:
	jr	%ra
fbgt_else.916:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.919
	fblt	%f0, %f1, fbgt_else.920
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.920:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.919:
	jr	%ra
fbgt_else.915:
	jr	%ra
fbgt_else.907:
	jr	%ra
fbgt_else.906:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.921
	fblt	%f0, %f1, fbgt_else.922
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.923
	fblt	%f0, %f1, fbgt_else.924
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.925
	fblt	%f0, %f1, fbgt_else.926
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.926:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.925:
	jr	%ra
fbgt_else.924:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.927
	fblt	%f0, %f1, fbgt_else.928
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.928:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.927:
	jr	%ra
fbgt_else.923:
	jr	%ra
fbgt_else.922:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.929
	fblt	%f0, %f1, fbgt_else.930
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.931
	fblt	%f0, %f1, fbgt_else.932
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.932:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.931:
	jr	%ra
fbgt_else.930:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.933
	fblt	%f0, %f1, fbgt_else.934
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.934:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.933:
	jr	%ra
fbgt_else.929:
	jr	%ra
fbgt_else.921:
	jr	%ra
fbgt_else.905:
	jr	%ra
sin.224:
	flw	%f1, 27(%zero)
	flw	%f2, 26(%zero)
	fblt	%f0, %f2, fbgt_else.935
	addi	%v0, %zero, 1
	j	fbgt_cont.936
fbgt_else.935:
	addi	%v0, %zero, 0
fbgt_cont.936:
	fabs	%f0, %f0
	flw	%f2, 25(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.937
	flw	%f3, 24(%zero)
	fblt	%f0, %f3, fbgt_else.939
	flw	%f3, 23(%zero)
	fblt	%f0, %f3, fbgt_else.941
	flw	%f3, 22(%zero)
	fblt	%f0, %f3, fbgt_else.943
	flw	%f3, 21(%zero)
	fblt	%f0, %f3, fbgt_else.945
	flw	%f3, 20(%zero)
	fblt	%f0, %f3, fbgt_else.947
	flw	%f3, 19(%zero)
	fblt	%f0, %f3, fbgt_else.949
	flw	%f3, 18(%zero)
	fblt	%f0, %f3, fbgt_else.951
	flw	%f3, 17(%zero)
	fblt	%f0, %f3, fbgt_else.953
	flw	%f3, 16(%zero)
	fblt	%f0, %f3, fbgt_else.955
	flw	%f3, 15(%zero)
	fblt	%f0, %f3, fbgt_else.957
	flw	%f3, 14(%zero)
	fblt	%f0, %f3, fbgt_else.959
	flw	%f3, 13(%zero)
	fblt	%f0, %f3, fbgt_else.961
	flw	%f3, 12(%zero)
	fblt	%f0, %f3, fbgt_else.963
	flw	%f3, 11(%zero)
	fblt	%f0, %f3, fbgt_else.965
	flw	%f3, 10(%zero)
	fmov	%f1, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	f.297.479
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.966
fbgt_else.965:
	fmov	%f0, %f3
fbgt_cont.966:
	j	fbgt_cont.964
fbgt_else.963:
	fmov	%f0, %f3
fbgt_cont.964:
	j	fbgt_cont.962
fbgt_else.961:
	fmov	%f0, %f3
fbgt_cont.962:
	j	fbgt_cont.960
fbgt_else.959:
	fmov	%f0, %f3
fbgt_cont.960:
	j	fbgt_cont.958
fbgt_else.957:
	fmov	%f0, %f3
fbgt_cont.958:
	j	fbgt_cont.956
fbgt_else.955:
	fmov	%f0, %f3
fbgt_cont.956:
	j	fbgt_cont.954
fbgt_else.953:
	fmov	%f0, %f3
fbgt_cont.954:
	j	fbgt_cont.952
fbgt_else.951:
	fmov	%f0, %f3
fbgt_cont.952:
	j	fbgt_cont.950
fbgt_else.949:
	fmov	%f0, %f3
fbgt_cont.950:
	j	fbgt_cont.948
fbgt_else.947:
	fmov	%f0, %f3
fbgt_cont.948:
	j	fbgt_cont.946
fbgt_else.945:
	fmov	%f0, %f3
fbgt_cont.946:
	j	fbgt_cont.944
fbgt_else.943:
	fmov	%f0, %f3
fbgt_cont.944:
	j	fbgt_cont.942
fbgt_else.941:
	fmov	%f0, %f3
fbgt_cont.942:
	j	fbgt_cont.940
fbgt_else.939:
	fmov	%f0, %f3
fbgt_cont.940:
	j	fbgt_cont.938
fbgt_else.937:
	fmov	%f0, %f2
fbgt_cont.938:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.301.483
	sw	%v0, 0(%k1)
	flw	%f1, 3(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 2(%sp)
	fblt	%f2, %f1, fbgt_else.967
	fblt	%f2, %f0, fbgt_else.969
	fsub	%f2, %f2, %f0
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.971
	fblt	%f2, %f0, fbgt_else.973
	fsub	%f2, %f2, %f0
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.975
	fblt	%f2, %f0, fbgt_else.977
	fsub	%f1, %f2, %f0
	flw	%f2, 28(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.978
fbgt_else.977:
	flw	%f1, 28(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.978:
	j	fbgt_cont.976
fbgt_else.975:
	fmov	%f0, %f2
fbgt_cont.976:
	j	fbgt_cont.974
fbgt_else.973:
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.979
	fblt	%f2, %f0, fbgt_else.981
	fsub	%f1, %f2, %f0
	flw	%f2, 28(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.982
fbgt_else.981:
	flw	%f1, 28(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.982:
	j	fbgt_cont.980
fbgt_else.979:
	fmov	%f0, %f2
fbgt_cont.980:
fbgt_cont.974:
	j	fbgt_cont.972
fbgt_else.971:
	fmov	%f0, %f2
fbgt_cont.972:
	j	fbgt_cont.970
fbgt_else.969:
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.983
	fblt	%f2, %f0, fbgt_else.985
	fsub	%f2, %f2, %f0
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.987
	fblt	%f2, %f0, fbgt_else.989
	fsub	%f1, %f2, %f0
	flw	%f2, 28(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.990
fbgt_else.989:
	flw	%f1, 28(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.990:
	j	fbgt_cont.988
fbgt_else.987:
	fmov	%f0, %f2
fbgt_cont.988:
	j	fbgt_cont.986
fbgt_else.985:
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.991
	fblt	%f2, %f0, fbgt_else.993
	fsub	%f1, %f2, %f0
	flw	%f2, 28(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.994
fbgt_else.993:
	flw	%f1, 28(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.994:
	j	fbgt_cont.992
fbgt_else.991:
	fmov	%f0, %f2
fbgt_cont.992:
fbgt_cont.986:
	j	fbgt_cont.984
fbgt_else.983:
	fmov	%f0, %f2
fbgt_cont.984:
fbgt_cont.970:
	j	fbgt_cont.968
fbgt_else.967:
	fmov	%f0, %f2
fbgt_cont.968:
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.995
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.997
	addi	%v0, %zero, 0
	j	bnei_cont.998
bnei_else.997:
	addi	%v0, %zero, 1
bnei_cont.998:
	j	fbgt_cont.996
fbgt_else.995:
	lw	%v0, 0(%sp)
fbgt_cont.996:
	fblt	%f0, %f1, fbgt_else.999
	fsub	%f0, %f0, %f1
	j	fbgt_cont.1000
fbgt_else.999:
fbgt_cont.1000:
	flw	%f2, 9(%zero)
	fblt	%f0, %f2, fbgt_else.1001
	fsub	%f0, %f1, %f0
	j	fbgt_cont.1002
fbgt_else.1001:
fbgt_cont.1002:
	flw	%f1, 8(%zero)
	fblt	%f1, %f0, fbgt_else.1003
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
	j	fbgt_cont.1004
fbgt_else.1003:
	flw	%f1, 9(%zero)
	fsub	%f0, %f1, %f0
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
fbgt_cont.1004:
	beqi	%v0, 0, bnei_else.1005
	jr	%ra
bnei_else.1005:
	fneg	%f0, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	flw	%f1, 0(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	sin.224
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	ret
