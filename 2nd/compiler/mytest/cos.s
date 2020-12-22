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
f.297.522:
	fblt	%f0, %f1, fbgt_else.872
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.873
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.874
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.875
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.876
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.877
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.878
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.879
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.880
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.881
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.882
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.883
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.884
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.885
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.886
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.887
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	j	f.297.522
fbgt_else.887:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.886:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.885:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.884:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.883:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.882:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.881:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.880:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.879:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.878:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.877:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.876:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.875:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.874:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.873:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.872:
	fmov	%f0, %f1
	jr	%ra
g.301.526:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.888
	fblt	%f0, %f1, fbgt_else.889
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.890
	fblt	%f0, %f1, fbgt_else.891
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.892
	fblt	%f0, %f1, fbgt_else.893
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.894
	fblt	%f0, %f1, fbgt_else.895
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.895:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.894:
	jr	%ra
fbgt_else.893:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.896
	fblt	%f0, %f1, fbgt_else.897
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.897:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.896:
	jr	%ra
fbgt_else.892:
	jr	%ra
fbgt_else.891:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.898
	fblt	%f0, %f1, fbgt_else.899
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.900
	fblt	%f0, %f1, fbgt_else.901
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.901:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.900:
	jr	%ra
fbgt_else.899:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.902
	fblt	%f0, %f1, fbgt_else.903
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.903:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.902:
	jr	%ra
fbgt_else.898:
	jr	%ra
fbgt_else.890:
	jr	%ra
fbgt_else.889:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.904
	fblt	%f0, %f1, fbgt_else.905
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.906
	fblt	%f0, %f1, fbgt_else.907
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.908
	fblt	%f0, %f1, fbgt_else.909
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.909:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.908:
	jr	%ra
fbgt_else.907:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.910
	fblt	%f0, %f1, fbgt_else.911
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.911:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.910:
	jr	%ra
fbgt_else.906:
	jr	%ra
fbgt_else.905:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.912
	fblt	%f0, %f1, fbgt_else.913
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.914
	fblt	%f0, %f1, fbgt_else.915
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.915:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.914:
	jr	%ra
fbgt_else.913:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.916
	fblt	%f0, %f1, fbgt_else.917
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.917:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.916:
	jr	%ra
fbgt_else.912:
	jr	%ra
fbgt_else.904:
	jr	%ra
fbgt_else.888:
	jr	%ra
cos.222:
	flw	%f1, 26(%zero)
	fabs	%f0, %f0
	flw	%f2, 25(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.918
	flw	%f3, 24(%zero)
	fblt	%f0, %f3, fbgt_else.920
	flw	%f3, 23(%zero)
	fblt	%f0, %f3, fbgt_else.922
	flw	%f3, 22(%zero)
	fblt	%f0, %f3, fbgt_else.924
	flw	%f3, 21(%zero)
	fblt	%f0, %f3, fbgt_else.926
	flw	%f3, 20(%zero)
	fblt	%f0, %f3, fbgt_else.928
	flw	%f3, 19(%zero)
	fblt	%f0, %f3, fbgt_else.930
	flw	%f3, 18(%zero)
	fblt	%f0, %f3, fbgt_else.932
	flw	%f3, 17(%zero)
	fblt	%f0, %f3, fbgt_else.934
	flw	%f3, 16(%zero)
	fblt	%f0, %f3, fbgt_else.936
	flw	%f3, 15(%zero)
	fblt	%f0, %f3, fbgt_else.938
	flw	%f3, 14(%zero)
	fblt	%f0, %f3, fbgt_else.940
	flw	%f3, 13(%zero)
	fblt	%f0, %f3, fbgt_else.942
	flw	%f3, 12(%zero)
	fblt	%f0, %f3, fbgt_else.944
	flw	%f3, 11(%zero)
	fblt	%f0, %f3, fbgt_else.946
	flw	%f3, 10(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	f.297.522
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.947
fbgt_else.946:
	fmov	%f0, %f3
fbgt_cont.947:
	j	fbgt_cont.945
fbgt_else.944:
	fmov	%f0, %f3
fbgt_cont.945:
	j	fbgt_cont.943
fbgt_else.942:
	fmov	%f0, %f3
fbgt_cont.943:
	j	fbgt_cont.941
fbgt_else.940:
	fmov	%f0, %f3
fbgt_cont.941:
	j	fbgt_cont.939
fbgt_else.938:
	fmov	%f0, %f3
fbgt_cont.939:
	j	fbgt_cont.937
fbgt_else.936:
	fmov	%f0, %f3
fbgt_cont.937:
	j	fbgt_cont.935
fbgt_else.934:
	fmov	%f0, %f3
fbgt_cont.935:
	j	fbgt_cont.933
fbgt_else.932:
	fmov	%f0, %f3
fbgt_cont.933:
	j	fbgt_cont.931
fbgt_else.930:
	fmov	%f0, %f3
fbgt_cont.931:
	j	fbgt_cont.929
fbgt_else.928:
	fmov	%f0, %f3
fbgt_cont.929:
	j	fbgt_cont.927
fbgt_else.926:
	fmov	%f0, %f3
fbgt_cont.927:
	j	fbgt_cont.925
fbgt_else.924:
	fmov	%f0, %f3
fbgt_cont.925:
	j	fbgt_cont.923
fbgt_else.922:
	fmov	%f0, %f3
fbgt_cont.923:
	j	fbgt_cont.921
fbgt_else.920:
	fmov	%f0, %f3
fbgt_cont.921:
	j	fbgt_cont.919
fbgt_else.918:
	fmov	%f0, %f2
fbgt_cont.919:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.301.526
	sw	%v0, 0(%k1)
	flw	%f1, 2(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 1(%sp)
	fblt	%f2, %f1, fbgt_else.948
	fblt	%f2, %f0, fbgt_else.950
	fsub	%f2, %f2, %f0
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.952
	fblt	%f2, %f0, fbgt_else.954
	fsub	%f2, %f2, %f0
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.956
	fblt	%f2, %f0, fbgt_else.958
	fsub	%f1, %f2, %f0
	flw	%f2, 27(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.959
fbgt_else.958:
	flw	%f1, 27(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.959:
	j	fbgt_cont.957
fbgt_else.956:
	fmov	%f0, %f2
fbgt_cont.957:
	j	fbgt_cont.955
fbgt_else.954:
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.960
	fblt	%f2, %f0, fbgt_else.962
	fsub	%f1, %f2, %f0
	flw	%f2, 27(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.963
fbgt_else.962:
	flw	%f1, 27(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.963:
	j	fbgt_cont.961
fbgt_else.960:
	fmov	%f0, %f2
fbgt_cont.961:
fbgt_cont.955:
	j	fbgt_cont.953
fbgt_else.952:
	fmov	%f0, %f2
fbgt_cont.953:
	j	fbgt_cont.951
fbgt_else.950:
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.964
	fblt	%f2, %f0, fbgt_else.966
	fsub	%f2, %f2, %f0
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.968
	fblt	%f2, %f0, fbgt_else.970
	fsub	%f1, %f2, %f0
	flw	%f2, 27(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.971
fbgt_else.970:
	flw	%f1, 27(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.971:
	j	fbgt_cont.969
fbgt_else.968:
	fmov	%f0, %f2
fbgt_cont.969:
	j	fbgt_cont.967
fbgt_else.966:
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.972
	fblt	%f2, %f0, fbgt_else.974
	fsub	%f1, %f2, %f0
	flw	%f2, 27(%zero)
	fdiv	%f0, %f0, %f2
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.975
fbgt_else.974:
	flw	%f1, 27(%zero)
	fdiv	%f1, %f0, %f1
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.975:
	j	fbgt_cont.973
fbgt_else.972:
	fmov	%f0, %f2
fbgt_cont.973:
fbgt_cont.967:
	j	fbgt_cont.965
fbgt_else.964:
	fmov	%f0, %f2
fbgt_cont.965:
fbgt_cont.951:
	j	fbgt_cont.949
fbgt_else.948:
	fmov	%f0, %f2
fbgt_cont.949:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.976
	addi	%v0, %zero, 0
	j	fbgt_cont.977
fbgt_else.976:
	addi	%v0, %zero, 1
fbgt_cont.977:
	fblt	%f0, %f1, fbgt_else.978
	fsub	%f0, %f0, %f1
	j	fbgt_cont.979
fbgt_else.978:
fbgt_cont.979:
	flw	%f2, 9(%zero)
	fblt	%f0, %f2, fbgt_else.980
	beqi	%v0, 0, bnei_else.982
	addi	%v0, %zero, 0
	j	bnei_cont.983
bnei_else.982:
	addi	%v0, %zero, 1
bnei_cont.983:
	j	fbgt_cont.981
fbgt_else.980:
fbgt_cont.981:
	flw	%f2, 9(%zero)
	fblt	%f0, %f2, fbgt_else.984
	fsub	%f0, %f1, %f0
	j	fbgt_cont.985
fbgt_else.984:
fbgt_cont.985:
	flw	%f1, 8(%zero)
	fblt	%f1, %f0, fbgt_else.986
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
	j	fbgt_cont.987
fbgt_else.986:
	flw	%f1, 9(%zero)
	fsub	%f0, %f1, %f0
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
fbgt_cont.987:
	beqi	%v0, 0, bnei_else.988
	jr	%ra
bnei_else.988:
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
	jal	cos.222
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	ret
