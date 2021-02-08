.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 501
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
	flw	%f4, 500(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 499(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 498(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 497(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 496(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 495(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
f.6155.10191:
	fblt	%f0, %f1, fbgt_else.18901
	flw	%f2, 494(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18902
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18903
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18904
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18905
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18906
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18907
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18908
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18909
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18910
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18911
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18912
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18913
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18914
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18915
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18916
	fmul	%f1, %f2, %f1
	j	f.6155.10191
fbgt_else.18916:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18915:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18914:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18913:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18912:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18911:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18910:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18909:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18908:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18907:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18906:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18905:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18904:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18903:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18902:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.18901:
	fmov	%f0, %f1
	jr	%ra
g.6159.10195:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.18917
	fblt	%f0, %f1, fbgt_else.18918
	fsub	%f0, %f0, %f1
	flw	%f3, 494(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18919
	fblt	%f0, %f1, fbgt_else.18920
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18921
	fblt	%f0, %f1, fbgt_else.18922
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18923
	fblt	%f0, %f1, fbgt_else.18924
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18924:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18923:
	jr	%ra
fbgt_else.18922:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18925
	fblt	%f0, %f1, fbgt_else.18926
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18926:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18925:
	jr	%ra
fbgt_else.18921:
	jr	%ra
fbgt_else.18920:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18927
	fblt	%f0, %f1, fbgt_else.18928
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18929
	fblt	%f0, %f1, fbgt_else.18930
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18930:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18929:
	jr	%ra
fbgt_else.18928:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18931
	fblt	%f0, %f1, fbgt_else.18932
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18932:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18931:
	jr	%ra
fbgt_else.18927:
	jr	%ra
fbgt_else.18919:
	jr	%ra
fbgt_else.18918:
	flw	%f3, 494(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18933
	fblt	%f0, %f1, fbgt_else.18934
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18935
	fblt	%f0, %f1, fbgt_else.18936
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18937
	fblt	%f0, %f1, fbgt_else.18938
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18938:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18937:
	jr	%ra
fbgt_else.18936:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18939
	fblt	%f0, %f1, fbgt_else.18940
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18940:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18939:
	jr	%ra
fbgt_else.18935:
	jr	%ra
fbgt_else.18934:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18941
	fblt	%f0, %f1, fbgt_else.18942
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18943
	fblt	%f0, %f1, fbgt_else.18944
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18944:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18943:
	jr	%ra
fbgt_else.18942:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18945
	fblt	%f0, %f1, fbgt_else.18946
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18946:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18945:
	jr	%ra
fbgt_else.18941:
	jr	%ra
fbgt_else.18933:
	jr	%ra
fbgt_else.18917:
	jr	%ra
cos.2616:
	flw	%f1, 493(%zero)
	fabs	%f0, %f0
	flw	%f2, 492(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.18947
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.18949
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.18951
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.18953
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.18955
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.18957
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.18959
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.18961
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.18963
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.18965
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.18967
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.18969
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.18971
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.18973
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.18975
	flw	%f3, 477(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	f.6155.10191
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.18976
fbgt_else.18975:
	fmov	%f0, %f3
fbgt_cont.18976:
	j	fbgt_cont.18974
fbgt_else.18973:
	fmov	%f0, %f3
fbgt_cont.18974:
	j	fbgt_cont.18972
fbgt_else.18971:
	fmov	%f0, %f3
fbgt_cont.18972:
	j	fbgt_cont.18970
fbgt_else.18969:
	fmov	%f0, %f3
fbgt_cont.18970:
	j	fbgt_cont.18968
fbgt_else.18967:
	fmov	%f0, %f3
fbgt_cont.18968:
	j	fbgt_cont.18966
fbgt_else.18965:
	fmov	%f0, %f3
fbgt_cont.18966:
	j	fbgt_cont.18964
fbgt_else.18963:
	fmov	%f0, %f3
fbgt_cont.18964:
	j	fbgt_cont.18962
fbgt_else.18961:
	fmov	%f0, %f3
fbgt_cont.18962:
	j	fbgt_cont.18960
fbgt_else.18959:
	fmov	%f0, %f3
fbgt_cont.18960:
	j	fbgt_cont.18958
fbgt_else.18957:
	fmov	%f0, %f3
fbgt_cont.18958:
	j	fbgt_cont.18956
fbgt_else.18955:
	fmov	%f0, %f3
fbgt_cont.18956:
	j	fbgt_cont.18954
fbgt_else.18953:
	fmov	%f0, %f3
fbgt_cont.18954:
	j	fbgt_cont.18952
fbgt_else.18951:
	fmov	%f0, %f3
fbgt_cont.18952:
	j	fbgt_cont.18950
fbgt_else.18949:
	fmov	%f0, %f3
fbgt_cont.18950:
	j	fbgt_cont.18948
fbgt_else.18947:
	fmov	%f0, %f2
fbgt_cont.18948:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10195
	sw	%v0, 0(%k1)
	flw	%f1, 2(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 1(%sp)
	fblt	%f2, %f1, fbgt_else.18977
	fblt	%f2, %f0, fbgt_else.18979
	fsub	%f2, %f2, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18981
	fblt	%f2, %f0, fbgt_else.18983
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18985
	fblt	%f2, %f0, fbgt_else.18987
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
	j	fbgt_cont.18988
fbgt_else.18987:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.18988:
	j	fbgt_cont.18986
fbgt_else.18985:
	fmov	%f0, %f2
fbgt_cont.18986:
	j	fbgt_cont.18984
fbgt_else.18983:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18989
	fblt	%f2, %f0, fbgt_else.18991
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
	j	fbgt_cont.18992
fbgt_else.18991:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.18992:
	j	fbgt_cont.18990
fbgt_else.18989:
	fmov	%f0, %f2
fbgt_cont.18990:
fbgt_cont.18984:
	j	fbgt_cont.18982
fbgt_else.18981:
	fmov	%f0, %f2
fbgt_cont.18982:
	j	fbgt_cont.18980
fbgt_else.18979:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18993
	fblt	%f2, %f0, fbgt_else.18995
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18997
	fblt	%f2, %f0, fbgt_else.18999
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
	j	fbgt_cont.19000
fbgt_else.18999:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.19000:
	j	fbgt_cont.18998
fbgt_else.18997:
	fmov	%f0, %f2
fbgt_cont.18998:
	j	fbgt_cont.18996
fbgt_else.18995:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19001
	fblt	%f2, %f0, fbgt_else.19003
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
	j	fbgt_cont.19004
fbgt_else.19003:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.19004:
	j	fbgt_cont.19002
fbgt_else.19001:
	fmov	%f0, %f2
fbgt_cont.19002:
fbgt_cont.18996:
	j	fbgt_cont.18994
fbgt_else.18993:
	fmov	%f0, %f2
fbgt_cont.18994:
fbgt_cont.18980:
	j	fbgt_cont.18978
fbgt_else.18977:
	fmov	%f0, %f2
fbgt_cont.18978:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.19005
	addi	%v0, %zero, 0
	j	fbgt_cont.19006
fbgt_else.19005:
	addi	%v0, %zero, 1
fbgt_cont.19006:
	fblt	%f0, %f1, fbgt_else.19007
	fsub	%f0, %f0, %f1
	j	fbgt_cont.19008
fbgt_else.19007:
fbgt_cont.19008:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.19009
	beqi	%v0, 0, bnei_else.19011
	addi	%v0, %zero, 0
	j	bnei_cont.19012
bnei_else.19011:
	addi	%v0, %zero, 1
bnei_cont.19012:
	j	fbgt_cont.19010
fbgt_else.19009:
fbgt_cont.19010:
	fblt	%f0, %f2, fbgt_else.19013
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19014
fbgt_else.19013:
fbgt_cont.19014:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.19015
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
	j	fbgt_cont.19016
fbgt_else.19015:
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
fbgt_cont.19016:
	beqi	%v0, 0, bnei_else.19017
	jr	%ra
bnei_else.19017:
	fneg	%f0, %f0
	jr	%ra
f.6155.10148:
	fblt	%f0, %f1, fbgt_else.19018
	flw	%f2, 494(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19019
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19020
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19021
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19022
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19023
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19024
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19025
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19026
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19027
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19028
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19029
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19030
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19031
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19032
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19033
	fmul	%f1, %f2, %f1
	j	f.6155.10148
fbgt_else.19033:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19032:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19031:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19030:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19029:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19028:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19027:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19026:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19025:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19024:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19023:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19022:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19021:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19020:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19019:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.19018:
	fmov	%f0, %f1
	jr	%ra
g.6159.10152:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.19034
	fblt	%f0, %f1, fbgt_else.19035
	fsub	%f0, %f0, %f1
	flw	%f3, 494(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19036
	fblt	%f0, %f1, fbgt_else.19037
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19038
	fblt	%f0, %f1, fbgt_else.19039
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19040
	fblt	%f0, %f1, fbgt_else.19041
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19041:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19040:
	jr	%ra
fbgt_else.19039:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19042
	fblt	%f0, %f1, fbgt_else.19043
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19043:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19042:
	jr	%ra
fbgt_else.19038:
	jr	%ra
fbgt_else.19037:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19044
	fblt	%f0, %f1, fbgt_else.19045
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19046
	fblt	%f0, %f1, fbgt_else.19047
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19047:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19046:
	jr	%ra
fbgt_else.19045:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19048
	fblt	%f0, %f1, fbgt_else.19049
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19049:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19048:
	jr	%ra
fbgt_else.19044:
	jr	%ra
fbgt_else.19036:
	jr	%ra
fbgt_else.19035:
	flw	%f3, 494(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19050
	fblt	%f0, %f1, fbgt_else.19051
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19052
	fblt	%f0, %f1, fbgt_else.19053
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19054
	fblt	%f0, %f1, fbgt_else.19055
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19055:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19054:
	jr	%ra
fbgt_else.19053:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19056
	fblt	%f0, %f1, fbgt_else.19057
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19057:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19056:
	jr	%ra
fbgt_else.19052:
	jr	%ra
fbgt_else.19051:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19058
	fblt	%f0, %f1, fbgt_else.19059
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19060
	fblt	%f0, %f1, fbgt_else.19061
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19061:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19060:
	jr	%ra
fbgt_else.19059:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19062
	fblt	%f0, %f1, fbgt_else.19063
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19063:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19062:
	jr	%ra
fbgt_else.19058:
	jr	%ra
fbgt_else.19050:
	jr	%ra
fbgt_else.19034:
	jr	%ra
sin.2618:
	flw	%f1, 493(%zero)
	flw	%f2, 467(%zero)
	fblt	%f0, %f2, fbgt_else.19064
	addi	%v0, %zero, 1
	j	fbgt_cont.19065
fbgt_else.19064:
	addi	%v0, %zero, 0
fbgt_cont.19065:
	fabs	%f0, %f0
	flw	%f2, 492(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.19066
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.19068
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.19070
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.19072
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.19074
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.19076
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.19078
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.19080
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.19082
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.19084
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.19086
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.19088
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.19090
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.19092
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.19094
	flw	%f3, 477(%zero)
	fmov	%f1, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	f.6155.10148
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.19095
fbgt_else.19094:
	fmov	%f0, %f3
fbgt_cont.19095:
	j	fbgt_cont.19093
fbgt_else.19092:
	fmov	%f0, %f3
fbgt_cont.19093:
	j	fbgt_cont.19091
fbgt_else.19090:
	fmov	%f0, %f3
fbgt_cont.19091:
	j	fbgt_cont.19089
fbgt_else.19088:
	fmov	%f0, %f3
fbgt_cont.19089:
	j	fbgt_cont.19087
fbgt_else.19086:
	fmov	%f0, %f3
fbgt_cont.19087:
	j	fbgt_cont.19085
fbgt_else.19084:
	fmov	%f0, %f3
fbgt_cont.19085:
	j	fbgt_cont.19083
fbgt_else.19082:
	fmov	%f0, %f3
fbgt_cont.19083:
	j	fbgt_cont.19081
fbgt_else.19080:
	fmov	%f0, %f3
fbgt_cont.19081:
	j	fbgt_cont.19079
fbgt_else.19078:
	fmov	%f0, %f3
fbgt_cont.19079:
	j	fbgt_cont.19077
fbgt_else.19076:
	fmov	%f0, %f3
fbgt_cont.19077:
	j	fbgt_cont.19075
fbgt_else.19074:
	fmov	%f0, %f3
fbgt_cont.19075:
	j	fbgt_cont.19073
fbgt_else.19072:
	fmov	%f0, %f3
fbgt_cont.19073:
	j	fbgt_cont.19071
fbgt_else.19070:
	fmov	%f0, %f3
fbgt_cont.19071:
	j	fbgt_cont.19069
fbgt_else.19068:
	fmov	%f0, %f3
fbgt_cont.19069:
	j	fbgt_cont.19067
fbgt_else.19066:
	fmov	%f0, %f2
fbgt_cont.19067:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10152
	sw	%v0, 0(%k1)
	flw	%f1, 3(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 2(%sp)
	fblt	%f2, %f1, fbgt_else.19096
	fblt	%f2, %f0, fbgt_else.19098
	fsub	%f2, %f2, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19100
	fblt	%f2, %f0, fbgt_else.19102
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19104
	fblt	%f2, %f0, fbgt_else.19106
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
	j	fbgt_cont.19107
fbgt_else.19106:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.19107:
	j	fbgt_cont.19105
fbgt_else.19104:
	fmov	%f0, %f2
fbgt_cont.19105:
	j	fbgt_cont.19103
fbgt_else.19102:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19108
	fblt	%f2, %f0, fbgt_else.19110
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
	j	fbgt_cont.19111
fbgt_else.19110:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.19111:
	j	fbgt_cont.19109
fbgt_else.19108:
	fmov	%f0, %f2
fbgt_cont.19109:
fbgt_cont.19103:
	j	fbgt_cont.19101
fbgt_else.19100:
	fmov	%f0, %f2
fbgt_cont.19101:
	j	fbgt_cont.19099
fbgt_else.19098:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19112
	fblt	%f2, %f0, fbgt_else.19114
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19116
	fblt	%f2, %f0, fbgt_else.19118
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
	j	fbgt_cont.19119
fbgt_else.19118:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.19119:
	j	fbgt_cont.19117
fbgt_else.19116:
	fmov	%f0, %f2
fbgt_cont.19117:
	j	fbgt_cont.19115
fbgt_else.19114:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19120
	fblt	%f2, %f0, fbgt_else.19122
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
	j	fbgt_cont.19123
fbgt_else.19122:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.19123:
	j	fbgt_cont.19121
fbgt_else.19120:
	fmov	%f0, %f2
fbgt_cont.19121:
fbgt_cont.19115:
	j	fbgt_cont.19113
fbgt_else.19112:
	fmov	%f0, %f2
fbgt_cont.19113:
fbgt_cont.19099:
	j	fbgt_cont.19097
fbgt_else.19096:
	fmov	%f0, %f2
fbgt_cont.19097:
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.19124
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.19126
	addi	%v0, %zero, 0
	j	bnei_cont.19127
bnei_else.19126:
	addi	%v0, %zero, 1
bnei_cont.19127:
	j	fbgt_cont.19125
fbgt_else.19124:
	lw	%v0, 0(%sp)
fbgt_cont.19125:
	fblt	%f0, %f1, fbgt_else.19128
	fsub	%f0, %f0, %f1
	j	fbgt_cont.19129
fbgt_else.19128:
fbgt_cont.19129:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.19130
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19131
fbgt_else.19130:
fbgt_cont.19131:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.19132
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
	j	fbgt_cont.19133
fbgt_else.19132:
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
fbgt_cont.19133:
	beqi	%v0, 0, bnei_else.19134
	jr	%ra
bnei_else.19134:
	fneg	%f0, %f0
	jr	%ra
print_int_sub1.2622:
	blti	%v0, 10, bgti_else.19135
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.19136
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.19137
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.19138
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.19139
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.19140
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.19141
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.19142
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2622
bgti_else.19142:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.19141:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.19140:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.19139:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.19138:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.19137:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.19136:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.19135:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2625:
	blti	%v0, 10, bgti_else.19143
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19144
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19145
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19146
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19147
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19148
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19149
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19150
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19151
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19152
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19153
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19154
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19155
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19156
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19157
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.19158
	addi	%v0, %v0, -10
	j	print_int_sub2.2625
bgti_else.19158:
	jr	%ra
bgti_else.19157:
	jr	%ra
bgti_else.19156:
	jr	%ra
bgti_else.19155:
	jr	%ra
bgti_else.19154:
	jr	%ra
bgti_else.19153:
	jr	%ra
bgti_else.19152:
	jr	%ra
bgti_else.19151:
	jr	%ra
bgti_else.19150:
	jr	%ra
bgti_else.19149:
	jr	%ra
bgti_else.19148:
	jr	%ra
bgti_else.19147:
	jr	%ra
bgti_else.19146:
	jr	%ra
bgti_else.19145:
	jr	%ra
bgti_else.19144:
	jr	%ra
bgti_else.19143:
	jr	%ra
print_int.2627:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.19159
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.19161
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19163
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19165
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19167
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19169
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19171
	addi	%v1, %v1, -10
	addi	%a0, %zero, 7
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.19172
bgti_else.19171:
	addi	%v0, %zero, 6
bgti_cont.19172:
	j	bgti_cont.19170
bgti_else.19169:
	addi	%v0, %zero, 5
bgti_cont.19170:
	j	bgti_cont.19168
bgti_else.19167:
	addi	%v0, %zero, 4
bgti_cont.19168:
	j	bgti_cont.19166
bgti_else.19165:
	addi	%v0, %zero, 3
bgti_cont.19166:
	j	bgti_cont.19164
bgti_else.19163:
	addi	%v0, %zero, 2
bgti_cont.19164:
	j	bgti_cont.19162
bgti_else.19161:
	addi	%v0, %zero, 1
bgti_cont.19162:
	j	bgti_cont.19160
bgti_else.19159:
	addi	%v0, %zero, 0
bgti_cont.19160:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.19173
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19175
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19177
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19179
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19181
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19183
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19185
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19187
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19189
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19191
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19193
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19195
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19197
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19199
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19201
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2625
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.19202
bgti_else.19201:
	add	%v0, %zero, %v1
bgti_cont.19202:
	j	bgti_cont.19200
bgti_else.19199:
	add	%v0, %zero, %v1
bgti_cont.19200:
	j	bgti_cont.19198
bgti_else.19197:
	add	%v0, %zero, %v1
bgti_cont.19198:
	j	bgti_cont.19196
bgti_else.19195:
	add	%v0, %zero, %v1
bgti_cont.19196:
	j	bgti_cont.19194
bgti_else.19193:
	add	%v0, %zero, %v1
bgti_cont.19194:
	j	bgti_cont.19192
bgti_else.19191:
	add	%v0, %zero, %v1
bgti_cont.19192:
	j	bgti_cont.19190
bgti_else.19189:
	add	%v0, %zero, %v1
bgti_cont.19190:
	j	bgti_cont.19188
bgti_else.19187:
	add	%v0, %zero, %v1
bgti_cont.19188:
	j	bgti_cont.19186
bgti_else.19185:
	add	%v0, %zero, %v1
bgti_cont.19186:
	j	bgti_cont.19184
bgti_else.19183:
	add	%v0, %zero, %v1
bgti_cont.19184:
	j	bgti_cont.19182
bgti_else.19181:
	add	%v0, %zero, %v1
bgti_cont.19182:
	j	bgti_cont.19180
bgti_else.19179:
	add	%v0, %zero, %v1
bgti_cont.19180:
	j	bgti_cont.19178
bgti_else.19177:
	add	%v0, %zero, %v1
bgti_cont.19178:
	j	bgti_cont.19176
bgti_else.19175:
	add	%v0, %zero, %v1
bgti_cont.19176:
	j	bgti_cont.19174
bgti_else.19173:
	add	%v0, %zero, %v1
bgti_cont.19174:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.19203
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.19203:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.19204
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.19206
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19208
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19210
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19212
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19214
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19216
	addi	%a0, %a0, -10
	addi	%a1, %zero, 7
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2622
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.19217
bgti_else.19216:
	addi	%v0, %zero, 6
bgti_cont.19217:
	j	bgti_cont.19215
bgti_else.19214:
	addi	%v0, %zero, 5
bgti_cont.19215:
	j	bgti_cont.19213
bgti_else.19212:
	addi	%v0, %zero, 4
bgti_cont.19213:
	j	bgti_cont.19211
bgti_else.19210:
	addi	%v0, %zero, 3
bgti_cont.19211:
	j	bgti_cont.19209
bgti_else.19208:
	addi	%v0, %zero, 2
bgti_cont.19209:
	j	bgti_cont.19207
bgti_else.19206:
	addi	%v0, %zero, 1
bgti_cont.19207:
	j	bgti_cont.19205
bgti_else.19204:
	addi	%v0, %zero, 0
bgti_cont.19205:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.19218
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19220
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19222
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19224
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19226
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19228
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19230
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19232
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19234
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19236
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19238
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19240
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19242
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19244
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19246
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2625
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.19247
bgti_else.19246:
	add	%v0, %zero, %v1
bgti_cont.19247:
	j	bgti_cont.19245
bgti_else.19244:
	add	%v0, %zero, %v1
bgti_cont.19245:
	j	bgti_cont.19243
bgti_else.19242:
	add	%v0, %zero, %v1
bgti_cont.19243:
	j	bgti_cont.19241
bgti_else.19240:
	add	%v0, %zero, %v1
bgti_cont.19241:
	j	bgti_cont.19239
bgti_else.19238:
	add	%v0, %zero, %v1
bgti_cont.19239:
	j	bgti_cont.19237
bgti_else.19236:
	add	%v0, %zero, %v1
bgti_cont.19237:
	j	bgti_cont.19235
bgti_else.19234:
	add	%v0, %zero, %v1
bgti_cont.19235:
	j	bgti_cont.19233
bgti_else.19232:
	add	%v0, %zero, %v1
bgti_cont.19233:
	j	bgti_cont.19231
bgti_else.19230:
	add	%v0, %zero, %v1
bgti_cont.19231:
	j	bgti_cont.19229
bgti_else.19228:
	add	%v0, %zero, %v1
bgti_cont.19229:
	j	bgti_cont.19227
bgti_else.19226:
	add	%v0, %zero, %v1
bgti_cont.19227:
	j	bgti_cont.19225
bgti_else.19224:
	add	%v0, %zero, %v1
bgti_cont.19225:
	j	bgti_cont.19223
bgti_else.19222:
	add	%v0, %zero, %v1
bgti_cont.19223:
	j	bgti_cont.19221
bgti_else.19220:
	add	%v0, %zero, %v1
bgti_cont.19221:
	j	bgti_cont.19219
bgti_else.19218:
	add	%v0, %zero, %v1
bgti_cont.19219:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.19248
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.19248:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.19249
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19251
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19253
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19255
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19257
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19259
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19261
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19263
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19265
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19267
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19269
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19271
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19273
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19275
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19277
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.19278
bgti_else.19277:
	add	%v0, %zero, %v1
bgti_cont.19278:
	j	bgti_cont.19276
bgti_else.19275:
	add	%v0, %zero, %v1
bgti_cont.19276:
	j	bgti_cont.19274
bgti_else.19273:
	add	%v0, %zero, %v1
bgti_cont.19274:
	j	bgti_cont.19272
bgti_else.19271:
	add	%v0, %zero, %v1
bgti_cont.19272:
	j	bgti_cont.19270
bgti_else.19269:
	add	%v0, %zero, %v1
bgti_cont.19270:
	j	bgti_cont.19268
bgti_else.19267:
	add	%v0, %zero, %v1
bgti_cont.19268:
	j	bgti_cont.19266
bgti_else.19265:
	add	%v0, %zero, %v1
bgti_cont.19266:
	j	bgti_cont.19264
bgti_else.19263:
	add	%v0, %zero, %v1
bgti_cont.19264:
	j	bgti_cont.19262
bgti_else.19261:
	add	%v0, %zero, %v1
bgti_cont.19262:
	j	bgti_cont.19260
bgti_else.19259:
	add	%v0, %zero, %v1
bgti_cont.19260:
	j	bgti_cont.19258
bgti_else.19257:
	add	%v0, %zero, %v1
bgti_cont.19258:
	j	bgti_cont.19256
bgti_else.19255:
	add	%v0, %zero, %v1
bgti_cont.19256:
	j	bgti_cont.19254
bgti_else.19253:
	add	%v0, %zero, %v1
bgti_cont.19254:
	j	bgti_cont.19252
bgti_else.19251:
	add	%v0, %zero, %v1
bgti_cont.19252:
	j	bgti_cont.19250
bgti_else.19249:
	add	%v0, %zero, %v1
bgti_cont.19250:
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
vecunit_sgn.2655:
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
	fbne	%f1, %f4, fbeq_else.19279
	addi	%a0, %zero, 1
	j	fbeq_cont.19280
fbeq_else.19279:
	addi	%a0, %zero, 0
fbeq_cont.19280:
	beqi	%a0, 0, bnei_else.19281
	flw	%f1, 471(%zero)
	j	bnei_cont.19282
bnei_else.19281:
	beqi	%v1, 0, bnei_else.19283
	flw	%f4, 466(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.19284
bnei_else.19283:
	flw	%f4, 471(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.19284:
bnei_cont.19282:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%v0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%v0)
	jr	%ra
read_screen_settings.2756:
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
	jal	cos.2616
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fmov	%f0, %f1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2618
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
	jal	cos.2616
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	sin.2618
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
rotate_quadratic_matrix.2760:
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	cos.2616
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fsw	%f0, 3(%sp)
	fmov	%f0, %f1
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	sin.2618
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 4(%sp)
	fsw	%f1, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	cos.2616
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsw	%f0, 6(%sp)
	fmov	%f0, %f1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	sin.2618
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	fmov	%f0, %f1
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	cos.2616
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsw	%f0, 9(%sp)
	fmov	%f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	sin.2618
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
	flw	%f12, 494(%zero)
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
read_nth_object.2763:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.19288
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
	fblt	%f0, %f1, fbgt_else.19289
	addi	%v0, %zero, 0
	j	fbgt_cont.19290
fbgt_else.19289:
	addi	%v0, %zero, 1
fbgt_cont.19290:
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
	beqi	%v1, 0, bnei_else.19291
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
	j	bnei_cont.19292
bnei_else.19291:
bnei_cont.19292:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.19293
	lw	%a0, 10(%sp)
	j	bnei_cont.19294
bnei_else.19293:
	addi	%a0, %zero, 1
bnei_cont.19294:
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
	beqi	%a2, 3, bnei_else.19295
	beqi	%a2, 2, bnei_else.19297
	j	bnei_cont.19298
bnei_else.19297:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.19299
	addi	%v1, %zero, 0
	j	bnei_cont.19300
bnei_else.19299:
	addi	%v1, %zero, 1
bnei_cont.19300:
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
bnei_cont.19298:
	j	bnei_cont.19296
bnei_else.19295:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.19301
	addi	%v1, %zero, 1
	j	fbeq_cont.19302
fbeq_else.19301:
	addi	%v1, %zero, 0
fbeq_cont.19302:
	beqi	%v1, 0, bnei_else.19303
	fmov	%f0, %f1
	j	bnei_cont.19304
bnei_else.19303:
	fbne	%f0, %f1, fbeq_else.19305
	addi	%v1, %zero, 1
	j	fbeq_cont.19306
fbeq_else.19305:
	addi	%v1, %zero, 0
fbeq_cont.19306:
	beqi	%v1, 0, bnei_else.19307
	fmov	%f2, %f1
	j	bnei_cont.19308
bnei_else.19307:
	fblt	%f1, %f0, fbgt_else.19309
	addi	%v1, %zero, 0
	j	fbgt_cont.19310
fbgt_else.19309:
	addi	%v1, %zero, 1
fbgt_cont.19310:
	beqi	%v1, 0, bnei_else.19311
	flw	%f2, 471(%zero)
	j	bnei_cont.19312
bnei_else.19311:
	flw	%f2, 466(%zero)
bnei_cont.19312:
bnei_cont.19308:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.19304:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.19313
	addi	%v1, %zero, 1
	j	fbeq_cont.19314
fbeq_else.19313:
	addi	%v1, %zero, 0
fbeq_cont.19314:
	beqi	%v1, 0, bnei_else.19315
	fmov	%f0, %f1
	j	bnei_cont.19316
bnei_else.19315:
	fbne	%f0, %f1, fbeq_else.19317
	addi	%v1, %zero, 1
	j	fbeq_cont.19318
fbeq_else.19317:
	addi	%v1, %zero, 0
fbeq_cont.19318:
	beqi	%v1, 0, bnei_else.19319
	fmov	%f2, %f1
	j	bnei_cont.19320
bnei_else.19319:
	fblt	%f1, %f0, fbgt_else.19321
	addi	%v1, %zero, 0
	j	fbgt_cont.19322
fbgt_else.19321:
	addi	%v1, %zero, 1
fbgt_cont.19322:
	beqi	%v1, 0, bnei_else.19323
	flw	%f2, 471(%zero)
	j	bnei_cont.19324
bnei_else.19323:
	flw	%f2, 466(%zero)
bnei_cont.19324:
bnei_cont.19320:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.19316:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.19325
	addi	%v1, %zero, 1
	j	fbeq_cont.19326
fbeq_else.19325:
	addi	%v1, %zero, 0
fbeq_cont.19326:
	beqi	%v1, 0, bnei_else.19327
	fmov	%f0, %f1
	j	bnei_cont.19328
bnei_else.19327:
	fbne	%f0, %f1, fbeq_else.19329
	addi	%v1, %zero, 1
	j	fbeq_cont.19330
fbeq_else.19329:
	addi	%v1, %zero, 0
fbeq_cont.19330:
	beqi	%v1, 0, bnei_else.19331
	j	bnei_cont.19332
bnei_else.19331:
	fblt	%f1, %f0, fbgt_else.19333
	addi	%v1, %zero, 0
	j	fbgt_cont.19334
fbgt_else.19333:
	addi	%v1, %zero, 1
fbgt_cont.19334:
	beqi	%v1, 0, bnei_else.19335
	flw	%f1, 471(%zero)
	j	bnei_cont.19336
bnei_else.19335:
	flw	%f1, 466(%zero)
bnei_cont.19336:
bnei_cont.19332:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.19328:
	fsw	%f0, 2(%a0)
bnei_cont.19296:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.19337
	lw	%v0, 7(%sp)
	lw	%v1, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2760
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.19338
bnei_else.19337:
bnei_cont.19338:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19288:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2765:
	blti	%v0, 60, bgti_else.19339
	jr	%ra
bgti_else.19339:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2763
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.19341
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19342
	jr	%ra
bgti_else.19342:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2763
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.19344
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19345
	jr	%ra
bgti_else.19345:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2763
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.19347
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19348
	jr	%ra
bgti_else.19348:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2763
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19350
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19351
	jr	%ra
bgti_else.19351:
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_nth_object.2763
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.19353
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19354
	jr	%ra
bgti_else.19354:
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_nth_object.2763
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.19356
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19357
	jr	%ra
bgti_else.19357:
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	read_nth_object.2763
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.19359
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19360
	jr	%ra
bgti_else.19360:
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	read_nth_object.2763
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19362
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	j	read_object.2765
bnei_else.19362:
	lw	%v0, 7(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19359:
	lw	%v0, 6(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19356:
	lw	%v0, 5(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19353:
	lw	%v0, 4(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19350:
	lw	%v0, 3(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19347:
	lw	%v0, 2(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19344:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.19341:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
read_net_item.2769:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.19371
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
	beqi	%v0, -1, bnei_else.19372
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.19374
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.19376
	lw	%v1, 7(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	read_net_item.2769
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19377
bnei_else.19376:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19377:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19375
bnei_else.19374:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19375:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19373
bnei_else.19372:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19373:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.19371:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_or_network.2771:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	sw	%v1, 1(%sp)
	beqi	%v0, -1, bnei_else.19378
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.19380
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.19382
	addi	%v1, %zero, 3
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_net_item.2769
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.19383
bnei_else.19382:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19383:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19381
bnei_else.19380:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19381:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.19379
bnei_else.19378:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.19379:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.19384
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
	beqi	%v0, -1, bnei_else.19385
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.19387
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2769
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19388
bnei_else.19387:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19388:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.19386
bnei_else.19385:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.19386:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.19389
	lw	%v0, 6(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	read_or_network.2771
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 10(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19390
bnei_else.19389:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.19390:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.19384:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_and_network.2773:
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
	beqi	%v0, -1, bnei_else.19391
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.19393
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.19395
	addi	%v1, %zero, 3
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_net_item.2769
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.19396
bnei_else.19395:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19396:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19394
bnei_else.19393:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19394:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19392
bnei_else.19391:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19392:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19397
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
	beqi	%v0, -1, bnei_else.19398
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.19400
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2769
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19401
bnei_else.19400:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19401:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19399
bnei_else.19398:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19399:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19402
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
	beqi	%v0, -1, bnei_else.19403
	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	read_net_item.2769
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19404
bnei_else.19403:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.19404:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19405
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
	jal	read_net_item.2769
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19406
	addi	%v1, %zero, 83
	lw	%a0, 12(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2773
bnei_else.19406:
	jr	%ra
bnei_else.19405:
	jr	%ra
bnei_else.19402:
	jr	%ra
bnei_else.19397:
	jr	%ra
solver_rect_surface.2777:
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	flw	%f4, 467(%zero)
	fbne	%f3, %f4, fbeq_else.19411
	addi	%a3, %zero, 1
	j	fbeq_cont.19412
fbeq_else.19411:
	addi	%a3, %zero, 0
fbeq_cont.19412:
	beqi	%a3, 0, bnei_else.19413
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19413:
	lw	%a3, 4(%v0)
	lw	%v0, 6(%v0)
	fblt	%f3, %f4, fbgt_else.19414
	addi	%t0, %zero, 0
	j	fbgt_cont.19415
fbgt_else.19414:
	addi	%t0, %zero, 1
fbgt_cont.19415:
	beqi	%v0, 0, bnei_else.19416
	beqi	%t0, 0, bnei_else.19418
	addi	%v0, %zero, 0
	j	bnei_cont.19419
bnei_else.19418:
	addi	%v0, %zero, 1
bnei_cont.19419:
	j	bnei_cont.19417
bnei_else.19416:
	add	%v0, %zero, %t0
bnei_cont.19417:
	add	%at, %a3, %a0
	flw	%f4, 0(%at)
	beqi	%v0, 0, bnei_else.19420
	j	bnei_cont.19421
bnei_else.19420:
	fneg	%f4, %f4
bnei_cont.19421:
	fsub	%f0, %f4, %f0
	fdiv	%f0, %f0, %f3
	add	%at, %v1, %a1
	flw	%f3, 0(%at)
	fmul	%f3, %f0, %f3
	fadd	%f1, %f3, %f1
	fabs	%f1, %f1
	add	%at, %a3, %a1
	flw	%f3, 0(%at)
	fblt	%f1, %f3, fbgt_else.19422
	addi	%v0, %zero, 0
	j	fbgt_cont.19423
fbgt_else.19422:
	addi	%v0, %zero, 1
fbgt_cont.19423:
	beqi	%v0, 0, bnei_else.19424
	add	%at, %v1, %a2
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	add	%at, %a3, %a2
	flw	%f2, 0(%at)
	fblt	%f1, %f2, fbgt_else.19425
	addi	%v0, %zero, 0
	j	fbgt_cont.19426
fbgt_else.19425:
	addi	%v0, %zero, 1
fbgt_cont.19426:
	beqi	%v0, 0, bnei_else.19427
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19427:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19424:
	addi	%v0, %zero, 0
	jr	%ra
solver_surface.2792:
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
	fblt	%f5, %f3, fbgt_else.19428
	addi	%v0, %zero, 0
	j	fbgt_cont.19429
fbgt_else.19428:
	addi	%v0, %zero, 1
fbgt_cont.19429:
	beqi	%v0, 0, bnei_else.19430
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
bnei_else.19430:
	addi	%v0, %zero, 0
	jr	%ra
quadratic.2798:
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
	beqi	%v1, 0, bnei_else.19431
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
bnei_else.19431:
	fmov	%f0, %f3
	jr	%ra
bilinear.2803:
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
	beqi	%v1, 0, bnei_else.19432
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
bnei_else.19432:
	fmov	%f0, %f6
	jr	%ra
solver_second.2811:
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
	jal	quadratic.2798
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 467(%zero)
	fbne	%f0, %f1, fbeq_else.19433
	addi	%v0, %zero, 1
	j	fbeq_cont.19434
fbeq_else.19433:
	addi	%v0, %zero, 0
fbeq_cont.19434:
	beqi	%v0, 0, bnei_else.19435
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19435:
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
	jal	bilinear.2803
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
	jal	quadratic.2798
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.19436
	j	bnei_cont.19437
bnei_else.19436:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19437:
	flw	%f1, 9(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 8(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 7(%sp)
	fblt	%f2, %f0, fbgt_else.19438
	addi	%v1, %zero, 0
	j	fbgt_cont.19439
fbgt_else.19438:
	addi	%v1, %zero, 1
fbgt_cont.19439:
	beqi	%v1, 0, bnei_else.19440
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19441
	j	bnei_cont.19442
bnei_else.19441:
	fneg	%f0, %f0
bnei_cont.19442:
	fsub	%f0, %f0, %f1
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19440:
	addi	%v0, %zero, 0
	jr	%ra
solver.2817:
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
	beqi	%a0, 1, bnei_else.19443
	beqi	%a0, 2, bnei_else.19444
	j	solver_second.2811
bnei_else.19444:
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
	fblt	%f5, %f3, fbgt_else.19445
	addi	%v0, %zero, 0
	j	fbgt_cont.19446
fbgt_else.19445:
	addi	%v0, %zero, 1
fbgt_cont.19446:
	beqi	%v0, 0, bnei_else.19447
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
bnei_else.19447:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19443:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19448
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19448:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19449
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.19449:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19450
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.19450:
	addi	%v0, %zero, 0
	jr	%ra
solver_rect_fast.2821:
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
	fblt	%f6, %f7, fbgt_else.19451
	addi	%a1, %zero, 0
	j	fbgt_cont.19452
fbgt_else.19451:
	addi	%a1, %zero, 1
fbgt_cont.19452:
	beqi	%a1, 0, bnei_else.19453
	flw	%f6, 2(%v1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%a1, 4(%v0)
	flw	%f7, 2(%a1)
	fblt	%f6, %f7, fbgt_else.19455
	addi	%a1, %zero, 0
	j	fbgt_cont.19456
fbgt_else.19455:
	addi	%a1, %zero, 1
fbgt_cont.19456:
	beqi	%a1, 0, bnei_else.19457
	flw	%f6, 467(%zero)
	fbne	%f4, %f6, fbeq_else.19459
	addi	%a1, %zero, 1
	j	fbeq_cont.19460
fbeq_else.19459:
	addi	%a1, %zero, 0
fbeq_cont.19460:
	beqi	%a1, 0, bnei_else.19461
	addi	%a1, %zero, 0
	j	bnei_cont.19462
bnei_else.19461:
	addi	%a1, %zero, 1
bnei_cont.19462:
	j	bnei_cont.19458
bnei_else.19457:
	addi	%a1, %zero, 0
bnei_cont.19458:
	j	bnei_cont.19454
bnei_else.19453:
	addi	%a1, %zero, 0
bnei_cont.19454:
	beqi	%a1, 0, bnei_else.19463
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19463:
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
	fblt	%f7, %f8, fbgt_else.19464
	addi	%a1, %zero, 0
	j	fbgt_cont.19465
fbgt_else.19464:
	addi	%a1, %zero, 1
fbgt_cont.19465:
	beqi	%a1, 0, bnei_else.19466
	flw	%f7, 2(%v1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fblt	%f7, %f8, fbgt_else.19468
	addi	%v1, %zero, 0
	j	fbgt_cont.19469
fbgt_else.19468:
	addi	%v1, %zero, 1
fbgt_cont.19469:
	beqi	%v1, 0, bnei_else.19470
	flw	%f7, 467(%zero)
	fbne	%f4, %f7, fbeq_else.19472
	addi	%v1, %zero, 1
	j	fbeq_cont.19473
fbeq_else.19472:
	addi	%v1, %zero, 0
fbeq_cont.19473:
	beqi	%v1, 0, bnei_else.19474
	addi	%v1, %zero, 0
	j	bnei_cont.19475
bnei_else.19474:
	addi	%v1, %zero, 1
bnei_cont.19475:
	j	bnei_cont.19471
bnei_else.19470:
	addi	%v1, %zero, 0
bnei_cont.19471:
	j	bnei_cont.19467
bnei_else.19466:
	addi	%v1, %zero, 0
bnei_cont.19467:
	beqi	%v1, 0, bnei_else.19476
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.19476:
	flw	%f3, 4(%a0)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a0)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f4, 0(%v1)
	fblt	%f0, %f4, fbgt_else.19477
	addi	%v1, %zero, 0
	j	fbgt_cont.19478
fbgt_else.19477:
	addi	%v1, %zero, 1
fbgt_cont.19478:
	beqi	%v1, 0, bnei_else.19479
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%v0, 4(%v0)
	flw	%f1, 1(%v0)
	fblt	%f0, %f1, fbgt_else.19481
	addi	%v0, %zero, 0
	j	fbgt_cont.19482
fbgt_else.19481:
	addi	%v0, %zero, 1
fbgt_cont.19482:
	beqi	%v0, 0, bnei_else.19483
	flw	%f0, 467(%zero)
	fbne	%f3, %f0, fbeq_else.19485
	addi	%v0, %zero, 1
	j	fbeq_cont.19486
fbeq_else.19485:
	addi	%v0, %zero, 0
fbeq_cont.19486:
	beqi	%v0, 0, bnei_else.19487
	addi	%v0, %zero, 0
	j	bnei_cont.19488
bnei_else.19487:
	addi	%v0, %zero, 1
bnei_cont.19488:
	j	bnei_cont.19484
bnei_else.19483:
	addi	%v0, %zero, 0
bnei_cont.19484:
	j	bnei_cont.19480
bnei_else.19479:
	addi	%v0, %zero, 0
bnei_cont.19480:
	beqi	%v0, 0, bnei_else.19489
	fsw	%f2, 135(%zero)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.19489:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2834:
	flw	%f3, 0(%v1)
	flw	%f4, 467(%zero)
	fbne	%f3, %f4, fbeq_else.19490
	addi	%a0, %zero, 1
	j	fbeq_cont.19491
fbeq_else.19490:
	addi	%a0, %zero, 0
fbeq_cont.19491:
	beqi	%a0, 0, bnei_else.19492
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19492:
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
	jal	quadratic.2798
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.19493
	j	bnei_cont.19494
bnei_else.19493:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19494:
	flw	%f1, 3(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 2(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 1(%sp)
	fblt	%f2, %f0, fbgt_else.19495
	addi	%v1, %zero, 0
	j	fbgt_cont.19496
fbgt_else.19495:
	addi	%v1, %zero, 1
fbgt_cont.19496:
	beqi	%v1, 0, bnei_else.19497
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19498
	fsqrt	%f0, %f0
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.19499
bnei_else.19498:
	fsqrt	%f0, %f0
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.19499:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19497:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2851:
	flw	%f3, 0(%v1)
	flw	%f4, 467(%zero)
	fbne	%f3, %f4, fbeq_else.19500
	addi	%a1, %zero, 1
	j	fbeq_cont.19501
fbeq_else.19500:
	addi	%a1, %zero, 0
fbeq_cont.19501:
	beqi	%a1, 0, bnei_else.19502
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19502:
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
	fblt	%f4, %f1, fbgt_else.19503
	addi	%a0, %zero, 0
	j	fbgt_cont.19504
fbgt_else.19503:
	addi	%a0, %zero, 1
fbgt_cont.19504:
	beqi	%a0, 0, bnei_else.19505
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19506
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.19507
bnei_else.19506:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.19507:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19505:
	addi	%v0, %zero, 0
	jr	%ra
setup_rect_table.2861:
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
	fbne	%f0, %f1, fbeq_else.19508
	addi	%a0, %zero, 1
	j	fbeq_cont.19509
fbeq_else.19508:
	addi	%a0, %zero, 0
fbeq_cont.19509:
	beqi	%a0, 0, bnei_else.19510
	fsw	%f1, 1(%v0)
	j	bnei_cont.19511
bnei_else.19510:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.19512
	addi	%a2, %zero, 0
	j	fbgt_cont.19513
fbgt_else.19512:
	addi	%a2, %zero, 1
fbgt_cont.19513:
	beqi	%a1, 0, bnei_else.19514
	beqi	%a2, 0, bnei_else.19516
	addi	%a1, %zero, 0
	j	bnei_cont.19517
bnei_else.19516:
	addi	%a1, %zero, 1
bnei_cont.19517:
	j	bnei_cont.19515
bnei_else.19514:
	add	%a1, %zero, %a2
bnei_cont.19515:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.19518
	j	bnei_cont.19519
bnei_else.19518:
	fneg	%f2, %f2
bnei_cont.19519:
	fsw	%f2, 0(%v0)
	flw	%f2, 471(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.19511:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.19520
	addi	%a0, %zero, 1
	j	fbeq_cont.19521
fbeq_else.19520:
	addi	%a0, %zero, 0
fbeq_cont.19521:
	beqi	%a0, 0, bnei_else.19522
	fsw	%f1, 3(%v0)
	j	bnei_cont.19523
bnei_else.19522:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.19524
	addi	%a2, %zero, 0
	j	fbgt_cont.19525
fbgt_else.19524:
	addi	%a2, %zero, 1
fbgt_cont.19525:
	beqi	%a1, 0, bnei_else.19526
	beqi	%a2, 0, bnei_else.19528
	addi	%a1, %zero, 0
	j	bnei_cont.19529
bnei_else.19528:
	addi	%a1, %zero, 1
bnei_cont.19529:
	j	bnei_cont.19527
bnei_else.19526:
	add	%a1, %zero, %a2
bnei_cont.19527:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.19530
	j	bnei_cont.19531
bnei_else.19530:
	fneg	%f2, %f2
bnei_cont.19531:
	fsw	%f2, 2(%v0)
	flw	%f2, 471(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.19523:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.19532
	addi	%v1, %zero, 1
	j	fbeq_cont.19533
fbeq_else.19532:
	addi	%v1, %zero, 0
fbeq_cont.19533:
	beqi	%v1, 0, bnei_else.19534
	fsw	%f1, 5(%v0)
	j	bnei_cont.19535
bnei_else.19534:
	lw	%v1, 0(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.19536
	addi	%a1, %zero, 0
	j	fbgt_cont.19537
fbgt_else.19536:
	addi	%a1, %zero, 1
fbgt_cont.19537:
	beqi	%a0, 0, bnei_else.19538
	beqi	%a1, 0, bnei_else.19540
	addi	%a0, %zero, 0
	j	bnei_cont.19541
bnei_else.19540:
	addi	%a0, %zero, 1
bnei_cont.19541:
	j	bnei_cont.19539
bnei_else.19538:
	add	%a0, %zero, %a1
bnei_cont.19539:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.19542
	j	bnei_cont.19543
bnei_else.19542:
	fneg	%f1, %f1
bnei_cont.19543:
	fsw	%f1, 4(%v0)
	flw	%f1, 471(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.19535:
	jr	%ra
setup_surface_table.2864:
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
	fblt	%f1, %f0, fbgt_else.19544
	addi	%v1, %zero, 0
	j	fbgt_cont.19545
fbgt_else.19544:
	addi	%v1, %zero, 1
fbgt_cont.19545:
	beqi	%v1, 0, bnei_else.19546
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
	j	bnei_cont.19547
bnei_else.19546:
	fsw	%f1, 0(%v0)
bnei_cont.19547:
	jr	%ra
setup_second_table.2867:
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
	jal	quadratic.2798
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
	beqi	%a0, 0, bnei_else.19548
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
	j	bnei_cont.19549
bnei_else.19548:
	fsw	%f1, 1(%v1)
	fsw	%f3, 2(%v1)
	fsw	%f5, 3(%v1)
bnei_cont.19549:
	flw	%f1, 0(%sp)
	fbne	%f0, %f1, fbeq_else.19550
	addi	%v0, %zero, 1
	j	fbeq_cont.19551
fbeq_else.19550:
	addi	%v0, %zero, 0
fbeq_cont.19551:
	beqi	%v0, 0, bnei_else.19552
	j	bnei_cont.19553
bnei_else.19552:
	flw	%f1, 471(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v1)
bnei_cont.19553:
	add	%v0, %zero, %v1
	jr	%ra
iter_setup_dirvec_constants.2870:
	blti	%v1, 0, bgti_else.19554
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.19555
	beqi	%a3, 2, bnei_else.19557
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_second_table.2867
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19558
bnei_else.19557:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_surface_table.2864
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19558:
	j	bnei_cont.19556
bnei_else.19555:
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_rect_table.2861
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19556:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.19559
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.19560
	beqi	%a3, 2, bnei_else.19562
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_second_table.2867
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.19563
bnei_else.19562:
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_surface_table.2864
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19563:
	j	bnei_cont.19561
bnei_else.19560:
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_rect_table.2861
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.19561:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2870
bgti_else.19559:
	jr	%ra
bgti_else.19554:
	jr	%ra
setup_startp_constants.2875:
	blti	%v1, 0, bgti_else.19566
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
	beqi	%a2, 2, bnei_else.19567
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.19569
	j	bgt_cont.19570
bgt_else.19569:
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	sw	%a1, 2(%sp)
	sw	%a2, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	quadratic.2798
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	beqi	%v0, 3, bnei_else.19571
	j	bnei_cont.19572
bnei_else.19571:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19572:
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
bgt_cont.19570:
	j	bnei_cont.19568
bnei_else.19567:
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
bnei_cont.19568:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2875
bgti_else.19566:
	jr	%ra
is_outside.2895:
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
	beqi	%v1, 1, bnei_else.19574
	beqi	%v1, 2, bnei_else.19575
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	quadratic.2798
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.19576
	j	bnei_cont.19577
bnei_else.19576:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19577:
	lw	%v0, 6(%v0)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19578
	addi	%v1, %zero, 0
	j	fbgt_cont.19579
fbgt_else.19578:
	addi	%v1, %zero, 1
fbgt_cont.19579:
	beqi	%v0, 0, bnei_else.19580
	beqi	%v1, 0, bnei_else.19582
	addi	%v0, %zero, 0
	j	bnei_cont.19583
bnei_else.19582:
	addi	%v0, %zero, 1
bnei_cont.19583:
	j	bnei_cont.19581
bnei_else.19580:
	add	%v0, %zero, %v1
bnei_cont.19581:
	beqi	%v0, 0, bnei_else.19584
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19584:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19575:
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
	fblt	%f0, %f1, fbgt_else.19585
	addi	%v1, %zero, 0
	j	fbgt_cont.19586
fbgt_else.19585:
	addi	%v1, %zero, 1
fbgt_cont.19586:
	beqi	%v0, 0, bnei_else.19587
	beqi	%v1, 0, bnei_else.19589
	addi	%v0, %zero, 0
	j	bnei_cont.19590
bnei_else.19589:
	addi	%v0, %zero, 1
bnei_cont.19590:
	j	bnei_cont.19588
bnei_else.19587:
	add	%v0, %zero, %v1
bnei_cont.19588:
	beqi	%v0, 0, bnei_else.19591
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19591:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19574:
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.19592
	addi	%v1, %zero, 0
	j	fbgt_cont.19593
fbgt_else.19592:
	addi	%v1, %zero, 1
fbgt_cont.19593:
	beqi	%v1, 0, bnei_else.19594
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.19596
	addi	%v1, %zero, 0
	j	fbgt_cont.19597
fbgt_else.19596:
	addi	%v1, %zero, 1
fbgt_cont.19597:
	beqi	%v1, 0, bnei_else.19598
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fblt	%f0, %f1, fbgt_else.19600
	addi	%v1, %zero, 0
	j	fbgt_cont.19601
fbgt_else.19600:
	addi	%v1, %zero, 1
fbgt_cont.19601:
	j	bnei_cont.19599
bnei_else.19598:
	addi	%v1, %zero, 0
bnei_cont.19599:
	j	bnei_cont.19595
bnei_else.19594:
	addi	%v1, %zero, 0
bnei_cont.19595:
	beqi	%v1, 0, bnei_else.19602
	lw	%v0, 6(%v0)
	jr	%ra
bnei_else.19602:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19603
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19603:
	addi	%v0, %zero, 1
	jr	%ra
check_all_inside.2900:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19604
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
	beqi	%a1, 1, bnei_else.19605
	beqi	%a1, 2, bnei_else.19607
	sw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	fmov	%f2, %f5
	fmov	%f1, %f4
	fmov	%f0, %f3
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	quadratic.2798
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.19609
	j	bnei_cont.19610
bnei_else.19609:
	flw	%f1, 471(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19610:
	lw	%v0, 6(%v0)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19611
	addi	%v1, %zero, 0
	j	fbgt_cont.19612
fbgt_else.19611:
	addi	%v1, %zero, 1
fbgt_cont.19612:
	beqi	%v0, 0, bnei_else.19613
	beqi	%v1, 0, bnei_else.19615
	addi	%v0, %zero, 0
	j	bnei_cont.19616
bnei_else.19615:
	addi	%v0, %zero, 1
bnei_cont.19616:
	j	bnei_cont.19614
bnei_else.19613:
	add	%v0, %zero, %v1
bnei_cont.19614:
	beqi	%v0, 0, bnei_else.19617
	addi	%v0, %zero, 0
	j	bnei_cont.19618
bnei_else.19617:
	addi	%v0, %zero, 1
bnei_cont.19618:
	j	bnei_cont.19608
bnei_else.19607:
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
	fblt	%f3, %f4, fbgt_else.19619
	addi	%a1, %zero, 0
	j	fbgt_cont.19620
fbgt_else.19619:
	addi	%a1, %zero, 1
fbgt_cont.19620:
	beqi	%a0, 0, bnei_else.19621
	beqi	%a1, 0, bnei_else.19623
	addi	%a0, %zero, 0
	j	bnei_cont.19624
bnei_else.19623:
	addi	%a0, %zero, 1
bnei_cont.19624:
	j	bnei_cont.19622
bnei_else.19621:
	add	%a0, %zero, %a1
bnei_cont.19622:
	beqi	%a0, 0, bnei_else.19625
	addi	%v0, %zero, 0
	j	bnei_cont.19626
bnei_else.19625:
	addi	%v0, %zero, 1
bnei_cont.19626:
bnei_cont.19608:
	j	bnei_cont.19606
bnei_else.19605:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.19627
	addi	%a1, %zero, 0
	j	fbgt_cont.19628
fbgt_else.19627:
	addi	%a1, %zero, 1
fbgt_cont.19628:
	beqi	%a1, 0, bnei_else.19629
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.19631
	addi	%a1, %zero, 0
	j	fbgt_cont.19632
fbgt_else.19631:
	addi	%a1, %zero, 1
fbgt_cont.19632:
	beqi	%a1, 0, bnei_else.19633
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.19635
	addi	%a1, %zero, 0
	j	fbgt_cont.19636
fbgt_else.19635:
	addi	%a1, %zero, 1
fbgt_cont.19636:
	j	bnei_cont.19634
bnei_else.19633:
	addi	%a1, %zero, 0
bnei_cont.19634:
	j	bnei_cont.19630
bnei_else.19629:
	addi	%a1, %zero, 0
bnei_cont.19630:
	beqi	%a1, 0, bnei_else.19637
	lw	%a0, 6(%a0)
	add	%v0, %zero, %a0
	j	bnei_cont.19638
bnei_else.19637:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.19639
	addi	%v0, %zero, 0
	j	bnei_cont.19640
bnei_else.19639:
	addi	%v0, %zero, 1
bnei_cont.19640:
bnei_cont.19638:
bnei_cont.19606:
	beqi	%v0, 0, bnei_else.19641
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19641:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19642
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
	jal	is_outside.2895
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.19643
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19643:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2900
bnei_else.19642:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19604:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2906:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19644
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
	beqi	%a3, 1, bnei_else.19645
	beqi	%a3, 2, bnei_else.19647
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast.2834
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19648
bnei_else.19647:
	flw	%f6, 0(%a0)
	flw	%f7, 467(%zero)
	fblt	%f6, %f7, fbgt_else.19649
	addi	%a3, %zero, 0
	j	fbgt_cont.19650
fbgt_else.19649:
	addi	%a3, %zero, 1
fbgt_cont.19650:
	beqi	%a3, 0, bnei_else.19651
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
	j	bnei_cont.19652
bnei_else.19651:
	addi	%v0, %zero, 0
bnei_cont.19652:
bnei_cont.19648:
	j	bnei_cont.19646
bnei_else.19645:
	addi	%a3, %zero, 184
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19646:
	flw	%f0, 135(%zero)
	beqi	%v0, 0, bnei_else.19653
	flw	%f1, 462(%zero)
	fblt	%f0, %f1, fbgt_else.19655
	addi	%v0, %zero, 0
	j	fbgt_cont.19656
fbgt_else.19655:
	addi	%v0, %zero, 1
fbgt_cont.19656:
	j	bnei_cont.19654
bnei_else.19653:
	addi	%v0, %zero, 0
bnei_cont.19654:
	beqi	%v0, 0, bnei_else.19657
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
	beqi	%v0, -1, bnei_else.19658
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
	jal	is_outside.2895
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.19660
	addi	%v0, %zero, 0
	j	bnei_cont.19661
bnei_else.19660:
	flw	%f0, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 7(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 4(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	check_all_inside.2900
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19661:
	j	bnei_cont.19659
bnei_else.19658:
	addi	%v0, %zero, 1
bnei_cont.19659:
	beqi	%v0, 0, bnei_else.19662
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19662:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2906
bnei_else.19657:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19663
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2906
bnei_else.19663:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19644:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2909:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19664
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
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.19665
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19665:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19666
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19667
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19667:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19668
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.19669
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19669:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19670
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.19671
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19671:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2909
bnei_else.19670:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19668:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19666:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19664:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2912:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.19672
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.19673
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
	beqi	%t0, 1, bnei_else.19675
	beqi	%t0, 2, bnei_else.19677
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast.2834
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19678
bnei_else.19677:
	flw	%f3, 0(%a2)
	flw	%f4, 467(%zero)
	fblt	%f3, %f4, fbgt_else.19679
	addi	%a3, %zero, 0
	j	fbgt_cont.19680
fbgt_else.19679:
	addi	%a3, %zero, 1
fbgt_cont.19680:
	beqi	%a3, 0, bnei_else.19681
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
	j	bnei_cont.19682
bnei_else.19681:
	addi	%v0, %zero, 0
bnei_cont.19682:
bnei_cont.19678:
	j	bnei_cont.19676
bnei_else.19675:
	addi	%t0, %zero, 184
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19676:
	beqi	%v0, 0, bnei_else.19683
	flw	%f0, 135(%zero)
	flw	%f1, 460(%zero)
	fblt	%f0, %f1, fbgt_else.19685
	addi	%v0, %zero, 0
	j	fbgt_cont.19686
fbgt_else.19685:
	addi	%v0, %zero, 1
fbgt_cont.19686:
	beqi	%v0, 0, bnei_else.19687
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19689
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19691
	addi	%v0, %zero, 1
	j	bnei_cont.19692
bnei_else.19691:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19693
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19695
	addi	%v0, %zero, 1
	j	bnei_cont.19696
bnei_else.19695:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19697
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19699
	addi	%v0, %zero, 1
	j	bnei_cont.19700
bnei_else.19699:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19700:
	j	bnei_cont.19698
bnei_else.19697:
	addi	%v0, %zero, 0
bnei_cont.19698:
bnei_cont.19696:
	j	bnei_cont.19694
bnei_else.19693:
	addi	%v0, %zero, 0
bnei_cont.19694:
bnei_cont.19692:
	j	bnei_cont.19690
bnei_else.19689:
	addi	%v0, %zero, 0
bnei_cont.19690:
	beqi	%v0, 0, bnei_else.19701
	addi	%v0, %zero, 1
	j	bnei_cont.19702
bnei_else.19701:
	addi	%v0, %zero, 0
bnei_cont.19702:
	j	bnei_cont.19688
bnei_else.19687:
	addi	%v0, %zero, 0
bnei_cont.19688:
	j	bnei_cont.19684
bnei_else.19683:
	addi	%v0, %zero, 0
bnei_cont.19684:
	j	bnei_cont.19674
bnei_else.19673:
	addi	%v0, %zero, 1
bnei_cont.19674:
	beqi	%v0, 0, bnei_else.19703
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19704
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19706
	addi	%v0, %zero, 1
	j	bnei_cont.19707
bnei_else.19706:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19708
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19710
	addi	%v0, %zero, 1
	j	bnei_cont.19711
bnei_else.19710:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19712
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19714
	addi	%v0, %zero, 1
	j	bnei_cont.19715
bnei_else.19714:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19715:
	j	bnei_cont.19713
bnei_else.19712:
	addi	%v0, %zero, 0
bnei_cont.19713:
bnei_cont.19711:
	j	bnei_cont.19709
bnei_else.19708:
	addi	%v0, %zero, 0
bnei_cont.19709:
bnei_cont.19707:
	j	bnei_cont.19705
bnei_else.19704:
	addi	%v0, %zero, 0
bnei_cont.19705:
	beqi	%v0, 0, bnei_else.19716
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19716:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.19703:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.19672:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2915:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19717
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
	beqi	%t2, 1, bnei_else.19718
	beqi	%t2, 2, bnei_else.19720
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solver_second.2811
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.19721
bnei_else.19720:
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solver_surface.2792
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19721:
	j	bnei_cont.19719
bnei_else.19718:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19722
	addi	%v0, %zero, 1
	j	bnei_cont.19723
bnei_else.19722:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19724
	addi	%v0, %zero, 2
	j	bnei_cont.19725
bnei_else.19724:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.19726
	addi	%v0, %zero, 3
	j	bnei_cont.19727
bnei_else.19726:
	addi	%v0, %zero, 0
bnei_cont.19727:
bnei_cont.19725:
bnei_cont.19723:
bnei_cont.19719:
	beqi	%v0, 0, bnei_else.19728
	flw	%f0, 135(%zero)
	flw	%f1, 467(%zero)
	fblt	%f1, %f0, fbgt_else.19729
	addi	%v1, %zero, 0
	j	fbgt_cont.19730
fbgt_else.19729:
	addi	%v1, %zero, 1
fbgt_cont.19730:
	beqi	%v1, 0, bnei_else.19731
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19733
	addi	%v1, %zero, 0
	j	fbgt_cont.19734
fbgt_else.19733:
	addi	%v1, %zero, 1
fbgt_cont.19734:
	beqi	%v1, 0, bnei_else.19735
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
	beqi	%a1, -1, bnei_else.19737
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%v0, %a1, 0
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	is_outside.2895
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	beqi	%v0, 0, bnei_else.19739
	addi	%v0, %zero, 0
	j	bnei_cont.19740
bnei_else.19739:
	flw	%f0, 17(%sp)
	flw	%f1, 16(%sp)
	flw	%f2, 15(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 6(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	check_all_inside.2900
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
bnei_cont.19740:
	j	bnei_cont.19738
bnei_else.19737:
	addi	%v0, %zero, 1
bnei_cont.19738:
	beqi	%v0, 0, bnei_else.19741
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
	j	bnei_cont.19742
bnei_else.19741:
bnei_cont.19742:
	j	bnei_cont.19736
bnei_else.19735:
bnei_cont.19736:
	j	bnei_cont.19732
bnei_else.19731:
bnei_cont.19732:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2915
bnei_else.19728:
	lw	%v0, 8(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19743
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2915
bnei_else.19743:
	jr	%ra
bnei_else.19717:
	jr	%ra
solve_one_or_network.2919:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19746
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19747
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19748
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19749
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19750
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19751
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19752
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19753
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.2919
bnei_else.19753:
	jr	%ra
bnei_else.19752:
	jr	%ra
bnei_else.19751:
	jr	%ra
bnei_else.19750:
	jr	%ra
bnei_else.19749:
	jr	%ra
bnei_else.19748:
	jr	%ra
bnei_else.19747:
	jr	%ra
bnei_else.19746:
	jr	%ra
trace_or_matrix.2923:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.19762
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.19763
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
	beqi	%t2, 1, bnei_else.19765
	beqi	%t2, 2, bnei_else.19767
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second.2811
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19768
bnei_else.19767:
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_surface.2792
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19768:
	j	bnei_cont.19766
bnei_else.19765:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19769
	addi	%v0, %zero, 1
	j	bnei_cont.19770
bnei_else.19769:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19771
	addi	%v0, %zero, 2
	j	bnei_cont.19772
bnei_else.19771:
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
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.19773
	addi	%v0, %zero, 3
	j	bnei_cont.19774
bnei_else.19773:
	addi	%v0, %zero, 0
bnei_cont.19774:
bnei_cont.19772:
bnei_cont.19770:
bnei_cont.19766:
	beqi	%v0, 0, bnei_else.19775
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19777
	addi	%v0, %zero, 0
	j	fbgt_cont.19778
fbgt_else.19777:
	addi	%v0, %zero, 1
fbgt_cont.19778:
	beqi	%v0, 0, bnei_else.19779
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19781
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19783
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19785
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19787
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19789
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19791
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19793
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.19794
bnei_else.19793:
bnei_cont.19794:
	j	bnei_cont.19792
bnei_else.19791:
bnei_cont.19792:
	j	bnei_cont.19790
bnei_else.19789:
bnei_cont.19790:
	j	bnei_cont.19788
bnei_else.19787:
bnei_cont.19788:
	j	bnei_cont.19786
bnei_else.19785:
bnei_cont.19786:
	j	bnei_cont.19784
bnei_else.19783:
bnei_cont.19784:
	j	bnei_cont.19782
bnei_else.19781:
bnei_cont.19782:
	j	bnei_cont.19780
bnei_else.19779:
bnei_cont.19780:
	j	bnei_cont.19776
bnei_else.19775:
bnei_cont.19776:
	j	bnei_cont.19764
bnei_else.19763:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.19795
	addi	%t0, %zero, 83
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19797
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19799
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19801
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19803
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19805
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19807
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2915
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.19808
bnei_else.19807:
bnei_cont.19808:
	j	bnei_cont.19806
bnei_else.19805:
bnei_cont.19806:
	j	bnei_cont.19804
bnei_else.19803:
bnei_cont.19804:
	j	bnei_cont.19802
bnei_else.19801:
bnei_cont.19802:
	j	bnei_cont.19800
bnei_else.19799:
bnei_cont.19800:
	j	bnei_cont.19798
bnei_else.19797:
bnei_cont.19798:
	j	bnei_cont.19796
bnei_else.19795:
bnei_cont.19796:
bnei_cont.19764:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.19809
	sw	%v0, 11(%sp)
	beqi	%a1, 99, bnei_else.19810
	addi	%a2, %zero, 159
	lw	%a3, 0(%sp)
	sw	%a0, 12(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solver.2817
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.19812
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19814
	addi	%v0, %zero, 0
	j	fbgt_cont.19815
fbgt_else.19814:
	addi	%v0, %zero, 1
fbgt_cont.19815:
	beqi	%v0, 0, bnei_else.19816
	lw	%v0, 12(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19818
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19820
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19822
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19824
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19826
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19828
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 12(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.19829
bnei_else.19828:
bnei_cont.19829:
	j	bnei_cont.19827
bnei_else.19826:
bnei_cont.19827:
	j	bnei_cont.19825
bnei_else.19824:
bnei_cont.19825:
	j	bnei_cont.19823
bnei_else.19822:
bnei_cont.19823:
	j	bnei_cont.19821
bnei_else.19820:
bnei_cont.19821:
	j	bnei_cont.19819
bnei_else.19818:
bnei_cont.19819:
	j	bnei_cont.19817
bnei_else.19816:
bnei_cont.19817:
	j	bnei_cont.19813
bnei_else.19812:
bnei_cont.19813:
	j	bnei_cont.19811
bnei_else.19810:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.19830
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
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19832
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19834
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19836
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19838
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19840
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_each_element.2915
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 12(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.19841
bnei_else.19840:
bnei_cont.19841:
	j	bnei_cont.19839
bnei_else.19838:
bnei_cont.19839:
	j	bnei_cont.19837
bnei_else.19836:
bnei_cont.19837:
	j	bnei_cont.19835
bnei_else.19834:
bnei_cont.19835:
	j	bnei_cont.19833
bnei_else.19832:
bnei_cont.19833:
	j	bnei_cont.19831
bnei_else.19830:
bnei_cont.19831:
bnei_cont.19811:
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2923
bnei_else.19809:
	jr	%ra
bnei_else.19762:
	jr	%ra
solve_each_element_fast.2929:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.19844
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
	beqi	%t3, 1, bnei_else.19845
	beqi	%t3, 2, bnei_else.19847
	addi	%a0, %t0, 0
	addi	%v1, %t2, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19848
bnei_else.19847:
	flw	%f0, 0(%t2)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19849
	addi	%t2, %zero, 0
	j	fbgt_cont.19850
fbgt_else.19849:
	addi	%t2, %zero, 1
fbgt_cont.19850:
	beqi	%t2, 0, bnei_else.19851
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19852
bnei_else.19851:
	addi	%v0, %zero, 0
bnei_cont.19852:
bnei_cont.19848:
	j	bnei_cont.19846
bnei_else.19845:
	lw	%t0, 0(%a0)
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19846:
	beqi	%v0, 0, bnei_else.19853
	flw	%f0, 135(%zero)
	flw	%f1, 467(%zero)
	fblt	%f1, %f0, fbgt_else.19854
	addi	%v1, %zero, 0
	j	fbgt_cont.19855
fbgt_else.19854:
	addi	%v1, %zero, 1
fbgt_cont.19855:
	beqi	%v1, 0, bnei_else.19856
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19858
	addi	%v1, %zero, 0
	j	fbgt_cont.19859
fbgt_else.19858:
	addi	%v1, %zero, 1
fbgt_cont.19859:
	beqi	%v1, 0, bnei_else.19860
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
	beqi	%a0, -1, bnei_else.19862
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%v0, %a0, 0
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	is_outside.2895
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.19864
	addi	%v0, %zero, 0
	j	bnei_cont.19865
bnei_else.19864:
	flw	%f0, 10(%sp)
	flw	%f1, 9(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	check_all_inside.2900
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.19865:
	j	bnei_cont.19863
bnei_else.19862:
	addi	%v0, %zero, 1
bnei_cont.19863:
	beqi	%v0, 0, bnei_else.19866
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
	j	bnei_cont.19867
bnei_else.19866:
bnei_cont.19867:
	j	bnei_cont.19861
bnei_else.19860:
bnei_cont.19861:
	j	bnei_cont.19857
bnei_else.19856:
bnei_cont.19857:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2929
bnei_else.19853:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19868
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2929
bnei_else.19868:
	jr	%ra
bnei_else.19844:
	jr	%ra
solve_one_or_network_fast.2933:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19871
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19872
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19873
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19874
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19875
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19876
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19877
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19878
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.2933
bnei_else.19878:
	jr	%ra
bnei_else.19877:
	jr	%ra
bnei_else.19876:
	jr	%ra
bnei_else.19875:
	jr	%ra
bnei_else.19874:
	jr	%ra
bnei_else.19873:
	jr	%ra
bnei_else.19872:
	jr	%ra
bnei_else.19871:
	jr	%ra
trace_or_matrix_fast.2937:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.19887
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.19888
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
	beqi	%t2, 1, bnei_else.19890
	beqi	%t2, 2, bnei_else.19892
	addi	%a0, %t1, 0
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19893
bnei_else.19892:
	flw	%f0, 0(%a3)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19894
	addi	%a3, %zero, 0
	j	fbgt_cont.19895
fbgt_else.19894:
	addi	%a3, %zero, 1
fbgt_cont.19895:
	beqi	%a3, 0, bnei_else.19896
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19897
bnei_else.19896:
	addi	%v0, %zero, 0
bnei_cont.19897:
bnei_cont.19893:
	j	bnei_cont.19891
bnei_else.19890:
	lw	%t1, 0(%a0)
	addi	%a0, %a3, 0
	addi	%v1, %t1, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19891:
	beqi	%v0, 0, bnei_else.19898
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19900
	addi	%v0, %zero, 0
	j	fbgt_cont.19901
fbgt_else.19900:
	addi	%v0, %zero, 1
fbgt_cont.19901:
	beqi	%v0, 0, bnei_else.19902
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19904
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19906
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19908
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19910
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19912
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19914
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19916
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19917
bnei_else.19916:
bnei_cont.19917:
	j	bnei_cont.19915
bnei_else.19914:
bnei_cont.19915:
	j	bnei_cont.19913
bnei_else.19912:
bnei_cont.19913:
	j	bnei_cont.19911
bnei_else.19910:
bnei_cont.19911:
	j	bnei_cont.19909
bnei_else.19908:
bnei_cont.19909:
	j	bnei_cont.19907
bnei_else.19906:
bnei_cont.19907:
	j	bnei_cont.19905
bnei_else.19904:
bnei_cont.19905:
	j	bnei_cont.19903
bnei_else.19902:
bnei_cont.19903:
	j	bnei_cont.19899
bnei_else.19898:
bnei_cont.19899:
	j	bnei_cont.19889
bnei_else.19888:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.19918
	addi	%t0, %zero, 83
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19920
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19922
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19924
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19926
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19928
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.19930
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19931
bnei_else.19930:
bnei_cont.19931:
	j	bnei_cont.19929
bnei_else.19928:
bnei_cont.19929:
	j	bnei_cont.19927
bnei_else.19926:
bnei_cont.19927:
	j	bnei_cont.19925
bnei_else.19924:
bnei_cont.19925:
	j	bnei_cont.19923
bnei_else.19922:
bnei_cont.19923:
	j	bnei_cont.19921
bnei_else.19920:
bnei_cont.19921:
	j	bnei_cont.19919
bnei_else.19918:
bnei_cont.19919:
bnei_cont.19889:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.19932
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.19933
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
	beqi	%t1, 1, bnei_else.19935
	beqi	%t1, 2, bnei_else.19937
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19938
bnei_else.19937:
	flw	%f0, 0(%a1)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19939
	addi	%a1, %zero, 0
	j	fbgt_cont.19940
fbgt_else.19939:
	addi	%a1, %zero, 1
fbgt_cont.19940:
	beqi	%a1, 0, bnei_else.19941
	flw	%f1, 3(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19942
bnei_else.19941:
	addi	%v0, %zero, 0
bnei_cont.19942:
bnei_cont.19938:
	j	bnei_cont.19936
bnei_else.19935:
	lw	%a3, 0(%t0)
	addi	%a0, %a1, 0
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19936:
	beqi	%v0, 0, bnei_else.19943
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19945
	addi	%v0, %zero, 0
	j	fbgt_cont.19946
fbgt_else.19945:
	addi	%v0, %zero, 1
fbgt_cont.19946:
	beqi	%v0, 0, bnei_else.19947
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19949
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19951
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19953
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19955
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19957
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19959
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19960
bnei_else.19959:
bnei_cont.19960:
	j	bnei_cont.19958
bnei_else.19957:
bnei_cont.19958:
	j	bnei_cont.19956
bnei_else.19955:
bnei_cont.19956:
	j	bnei_cont.19954
bnei_else.19953:
bnei_cont.19954:
	j	bnei_cont.19952
bnei_else.19951:
bnei_cont.19952:
	j	bnei_cont.19950
bnei_else.19949:
bnei_cont.19950:
	j	bnei_cont.19948
bnei_else.19947:
bnei_cont.19948:
	j	bnei_cont.19944
bnei_else.19943:
bnei_cont.19944:
	j	bnei_cont.19934
bnei_else.19933:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.19961
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19963
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19965
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19967
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.19969
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.19971
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19972
bnei_else.19971:
bnei_cont.19972:
	j	bnei_cont.19970
bnei_else.19969:
bnei_cont.19970:
	j	bnei_cont.19968
bnei_else.19967:
bnei_cont.19968:
	j	bnei_cont.19966
bnei_else.19965:
bnei_cont.19966:
	j	bnei_cont.19964
bnei_else.19963:
bnei_cont.19964:
	j	bnei_cont.19962
bnei_else.19961:
bnei_cont.19962:
bnei_cont.19934:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2937
bnei_else.19932:
	jr	%ra
bnei_else.19887:
	jr	%ra
judge_intersection_fast.2941:
	addi	%v1, %zero, 0
	flw	%f0, 459(%zero)
	fsw	%f0, 137(%zero)
	lw	%a0, 134(%zero)
	lw	%a1, 0(%a0)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.19975
	sw	%v0, 0(%sp)
	sw	%a0, 1(%sp)
	beqi	%a2, 99, bnei_else.19977
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
	beqi	%t1, 1, bnei_else.19979
	beqi	%t1, 2, bnei_else.19981
	addi	%a0, %t0, 0
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19982
bnei_else.19981:
	flw	%f0, 0(%a2)
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.19983
	addi	%a2, %zero, 0
	j	fbgt_cont.19984
fbgt_else.19983:
	addi	%a2, %zero, 1
fbgt_cont.19984:
	beqi	%a2, 0, bnei_else.19985
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.19986
bnei_else.19985:
	addi	%v0, %zero, 0
bnei_cont.19986:
bnei_cont.19982:
	j	bnei_cont.19980
bnei_else.19979:
	lw	%t0, 0(%v0)
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19980:
	beqi	%v0, 0, bnei_else.19987
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.19989
	addi	%v0, %zero, 0
	j	fbgt_cont.19990
fbgt_else.19989:
	addi	%v0, %zero, 1
fbgt_cont.19990:
	beqi	%v0, 0, bnei_else.19991
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19993
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19995
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19997
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.19999
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.20001
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.20003
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.20004
bnei_else.20003:
bnei_cont.20004:
	j	bnei_cont.20002
bnei_else.20001:
bnei_cont.20002:
	j	bnei_cont.20000
bnei_else.19999:
bnei_cont.20000:
	j	bnei_cont.19998
bnei_else.19997:
bnei_cont.19998:
	j	bnei_cont.19996
bnei_else.19995:
bnei_cont.19996:
	j	bnei_cont.19994
bnei_else.19993:
bnei_cont.19994:
	j	bnei_cont.19992
bnei_else.19991:
bnei_cont.19992:
	j	bnei_cont.19988
bnei_else.19987:
bnei_cont.19988:
	j	bnei_cont.19978
bnei_else.19977:
	lw	%a2, 1(%a1)
	beqi	%a2, -1, bnei_else.20005
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
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.20007
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.20009
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.20011
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.20013
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.20015
	addi	%a0, %zero, 83
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.20016
bnei_else.20015:
bnei_cont.20016:
	j	bnei_cont.20014
bnei_else.20013:
bnei_cont.20014:
	j	bnei_cont.20012
bnei_else.20011:
bnei_cont.20012:
	j	bnei_cont.20010
bnei_else.20009:
bnei_cont.20010:
	j	bnei_cont.20008
bnei_else.20007:
bnei_cont.20008:
	j	bnei_cont.20006
bnei_else.20005:
bnei_cont.20006:
bnei_cont.19978:
	addi	%v0, %zero, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19976
bnei_else.19975:
bnei_cont.19976:
	flw	%f0, 137(%zero)
	flw	%f1, 460(%zero)
	fblt	%f1, %f0, fbgt_else.20017
	addi	%v0, %zero, 0
	j	fbgt_cont.20018
fbgt_else.20017:
	addi	%v0, %zero, 1
fbgt_cont.20018:
	beqi	%v0, 0, bnei_else.20019
	flw	%f1, 458(%zero)
	fblt	%f0, %f1, fbgt_else.20020
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.20020:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.20019:
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_second.2947:
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
	beqi	%v1, 0, bnei_else.20021
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
	j	bnei_cont.20022
bnei_else.20021:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.20022:
	lw	%v1, 6(%v0)
	addi	%v0, %zero, 142
	j	vecunit_sgn.2655
utexture.2952:
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
	beqi	%a0, 1, bnei_else.20023
	beqi	%a0, 2, bnei_else.20024
	beqi	%a0, 3, bnei_else.20025
	beqi	%a0, 4, bnei_else.20026
	jr	%ra
bnei_else.20026:
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
	fblt	%f3, %f4, fbgt_else.20028
	addi	%a0, %zero, 0
	j	fbgt_cont.20029
fbgt_else.20028:
	addi	%a0, %zero, 1
fbgt_cont.20029:
	fsw	%f4, 0(%sp)
	fsw	%f2, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.20030
	flw	%f0, 456(%zero)
	j	bnei_cont.20031
bnei_else.20030:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 467(%zero)
	fblt	%f0, %f1, fbgt_else.20032
	addi	%a0, %zero, 1
	j	fbgt_cont.20033
fbgt_else.20032:
	addi	%a0, %zero, 0
fbgt_cont.20033:
	fabs	%f1, %f0
	flw	%f3, 455(%zero)
	fblt	%f1, %f3, fbgt_else.20034
	flw	%f0, 454(%zero)
	sw	%a0, 4(%sp)
	fblt	%f1, %f0, fbgt_else.20036
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
	j	fbgt_cont.20037
fbgt_else.20036:
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
fbgt_cont.20037:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.20038
	j	bnei_cont.20039
bnei_else.20038:
	fneg	%f0, %f0
bnei_cont.20039:
	j	fbgt_cont.20035
fbgt_else.20034:
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	kernel_atan.2612
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
fbgt_cont.20035:
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.20031:
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
	fblt	%f3, %f4, fbgt_else.20040
	addi	%v0, %zero, 0
	j	fbgt_cont.20041
fbgt_else.20040:
	addi	%v0, %zero, 1
fbgt_cont.20041:
	fsw	%f0, 7(%sp)
	beqi	%v0, 0, bnei_else.20042
	flw	%f0, 456(%zero)
	j	bnei_cont.20043
bnei_else.20042:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 467(%zero)
	fblt	%f1, %f2, fbgt_else.20044
	addi	%v0, %zero, 1
	j	fbgt_cont.20045
fbgt_else.20044:
	addi	%v0, %zero, 0
fbgt_cont.20045:
	fabs	%f2, %f1
	flw	%f3, 455(%zero)
	fblt	%f2, %f3, fbgt_else.20046
	flw	%f1, 454(%zero)
	sw	%v0, 8(%sp)
	fblt	%f2, %f1, fbgt_else.20048
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
	j	fbgt_cont.20049
fbgt_else.20048:
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
fbgt_cont.20049:
	lw	%v0, 8(%sp)
	beqi	%v0, 0, bnei_else.20050
	j	bnei_cont.20051
bnei_else.20050:
	fneg	%f0, %f0
bnei_cont.20051:
	j	fbgt_cont.20047
fbgt_else.20046:
	fmov	%f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	kernel_atan.2612
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
fbgt_cont.20047:
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.20043:
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
	fblt	%f0, %f1, fbgt_else.20052
	addi	%v0, %zero, 0
	j	fbgt_cont.20053
fbgt_else.20052:
	addi	%v0, %zero, 1
fbgt_cont.20053:
	beqi	%v0, 0, bnei_else.20054
	fmov	%f0, %f1
	j	bnei_cont.20055
bnei_else.20054:
bnei_cont.20055:
	flw	%f1, 450(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.20025:
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
	jal	cos.2616
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
bnei_else.20024:
	flw	%f0, 1(%v1)
	flw	%f1, 447(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	sin.2618
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
bnei_else.20023:
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
	fblt	%f0, %f2, fbgt_else.20059
	addi	%a0, %zero, 0
	j	fbgt_cont.20060
fbgt_else.20059:
	addi	%a0, %zero, 1
fbgt_cont.20060:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f4, 2(%v0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.20061
	addi	%v0, %zero, 0
	j	fbgt_cont.20062
fbgt_else.20061:
	addi	%v0, %zero, 1
fbgt_cont.20062:
	beqi	%a0, 0, bnei_else.20063
	beqi	%v0, 0, bnei_else.20065
	flw	%f0, 450(%zero)
	j	bnei_cont.20066
bnei_else.20065:
	flw	%f0, 467(%zero)
bnei_cont.20066:
	j	bnei_cont.20064
bnei_else.20063:
	beqi	%v0, 0, bnei_else.20067
	flw	%f0, 467(%zero)
	j	bnei_cont.20068
bnei_else.20067:
	flw	%f0, 450(%zero)
bnei_cont.20068:
bnei_cont.20064:
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2959:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.20070
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
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 460(%zero)
	fblt	%f1, %f0, fbgt_else.20071
	addi	%v0, %zero, 0
	j	fbgt_cont.20072
fbgt_else.20071:
	addi	%v0, %zero, 1
fbgt_cont.20072:
	beqi	%v0, 0, bnei_else.20073
	flw	%f1, 458(%zero)
	fblt	%f0, %f1, fbgt_else.20075
	addi	%v0, %zero, 0
	j	fbgt_cont.20076
fbgt_else.20075:
	addi	%v0, %zero, 1
fbgt_cont.20076:
	j	bnei_cont.20074
bnei_else.20073:
	addi	%v0, %zero, 0
bnei_cont.20074:
	beqi	%v0, 0, bnei_else.20077
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.20079
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.20081
	j	bnei_cont.20082
bnei_else.20081:
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
	fblt	%f3, %f0, fbgt_else.20083
	addi	%v0, %zero, 0
	j	fbgt_cont.20084
fbgt_else.20083:
	addi	%v0, %zero, 1
fbgt_cont.20084:
	beqi	%v0, 0, bnei_else.20085
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
	j	bnei_cont.20086
bnei_else.20085:
bnei_cont.20086:
	fblt	%f3, %f1, fbgt_else.20087
	addi	%v0, %zero, 0
	j	fbgt_cont.20088
fbgt_else.20087:
	addi	%v0, %zero, 1
fbgt_cont.20088:
	beqi	%v0, 0, bnei_else.20089
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
	j	bnei_cont.20090
bnei_else.20089:
bnei_cont.20090:
bnei_cont.20082:
	j	beq_cont.20080
beq_else.20079:
beq_cont.20080:
	j	bnei_cont.20078
bnei_else.20077:
bnei_cont.20078:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2959
bgti_else.20070:
	jr	%ra
trace_ray.2964:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.20092
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
	jal	trace_or_matrix.2923
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 460(%zero)
	fblt	%f1, %f0, fbgt_else.20093
	addi	%v0, %zero, 0
	j	fbgt_cont.20094
fbgt_else.20093:
	addi	%v0, %zero, 1
fbgt_cont.20094:
	beqi	%v0, 0, bnei_else.20095
	flw	%f1, 458(%zero)
	fblt	%f0, %f1, fbgt_else.20097
	addi	%v0, %zero, 0
	j	fbgt_cont.20098
fbgt_else.20097:
	addi	%v0, %zero, 1
fbgt_cont.20098:
	j	bnei_cont.20096
bnei_else.20095:
	addi	%v0, %zero, 0
bnei_cont.20096:
	beqi	%v0, 0, bnei_else.20099
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
	beqi	%a1, 1, bnei_else.20100
	beqi	%a1, 2, bnei_else.20102
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	get_nvector_second.2947
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.20103
bnei_else.20102:
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
bnei_cont.20103:
	j	bnei_cont.20101
bnei_else.20100:
	lw	%a1, 136(%zero)
	flw	%f3, 467(%zero)
	fsw	%f3, 142(%zero)
	fsw	%f3, 143(%zero)
	fsw	%f3, 144(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.20104
	addi	%t0, %zero, 1
	j	fbeq_cont.20105
fbeq_else.20104:
	addi	%t0, %zero, 0
fbeq_cont.20105:
	beqi	%t0, 0, bnei_else.20106
	j	bnei_cont.20107
bnei_else.20106:
	fblt	%f3, %f4, fbgt_else.20108
	addi	%t0, %zero, 0
	j	fbgt_cont.20109
fbgt_else.20108:
	addi	%t0, %zero, 1
fbgt_cont.20109:
	beqi	%t0, 0, bnei_else.20110
	flw	%f3, 471(%zero)
	j	bnei_cont.20111
bnei_else.20110:
	flw	%f3, 466(%zero)
bnei_cont.20111:
bnei_cont.20107:
	fneg	%f3, %f3
	addi	%t0, %zero, 142
	add	%at, %t0, %a1
	fsw	%f3, 0(%at)
bnei_cont.20101:
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
	jal	utexture.2952
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
	fblt	%f3, %f4, fbgt_else.20112
	addi	%a3, %zero, 0
	j	fbgt_cont.20113
fbgt_else.20112:
	addi	%a3, %zero, 1
fbgt_cont.20113:
	beqi	%a3, 0, bnei_else.20114
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.20115
bnei_else.20114:
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
bnei_cont.20115:
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
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	beqi	%v0, 0, bnei_else.20116
	j	bnei_cont.20117
bnei_else.20116:
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
	fblt	%f2, %f1, fbgt_else.20118
	addi	%v1, %zero, 0
	j	fbgt_cont.20119
fbgt_else.20118:
	addi	%v1, %zero, 1
fbgt_cont.20119:
	beqi	%v1, 0, bnei_else.20120
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
	j	bnei_cont.20121
bnei_else.20120:
bnei_cont.20121:
	fblt	%f2, %f0, fbgt_else.20122
	addi	%v1, %zero, 0
	j	fbgt_cont.20123
fbgt_else.20122:
	addi	%v1, %zero, 1
fbgt_cont.20123:
	beqi	%v1, 0, bnei_else.20124
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
	j	bnei_cont.20125
bnei_else.20124:
bnei_cont.20125:
bnei_cont.20117:
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
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v0, 434(%zero)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 17(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_reflections.2959
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f0, 442(%zero)
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.20126
	addi	%v0, %zero, 0
	j	fbgt_cont.20127
fbgt_else.20126:
	addi	%v0, %zero, 1
fbgt_cont.20127:
	beqi	%v0, 0, bnei_else.20128
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.20129
	j	bgti_cont.20130
bgti_else.20129:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.20130:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.20131
	jr	%ra
bnei_else.20131:
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
	j	trace_ray.2964
bnei_else.20128:
	jr	%ra
bnei_else.20099:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.20134
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
	fblt	%f1, %f0, fbgt_else.20135
	addi	%v0, %zero, 0
	j	fbgt_cont.20136
fbgt_else.20135:
	addi	%v0, %zero, 1
fbgt_cont.20136:
	beqi	%v0, 0, bnei_else.20137
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
bnei_else.20137:
	jr	%ra
bnei_else.20134:
	jr	%ra
bgt_else.20092:
	jr	%ra
trace_diffuse_ray.2970:
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
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 460(%zero)
	fblt	%f1, %f0, fbgt_else.20142
	addi	%v0, %zero, 0
	j	fbgt_cont.20143
fbgt_else.20142:
	addi	%v0, %zero, 1
fbgt_cont.20143:
	beqi	%v0, 0, bnei_else.20144
	flw	%f1, 458(%zero)
	fblt	%f0, %f1, fbgt_else.20146
	addi	%v0, %zero, 0
	j	fbgt_cont.20147
fbgt_else.20146:
	addi	%v0, %zero, 1
fbgt_cont.20147:
	j	bnei_cont.20145
bnei_else.20144:
	addi	%v0, %zero, 0
bnei_cont.20145:
	beqi	%v0, 0, bnei_else.20148
	lw	%v0, 141(%zero)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 4(%sp)
	beqi	%a0, 1, bnei_else.20149
	beqi	%a0, 2, bnei_else.20151
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	get_nvector_second.2947
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.20152
bnei_else.20151:
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
bnei_cont.20152:
	j	bnei_cont.20150
bnei_else.20149:
	lw	%a0, 136(%zero)
	flw	%f0, 467(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.20153
	addi	%v1, %zero, 1
	j	fbeq_cont.20154
fbeq_else.20153:
	addi	%v1, %zero, 0
fbeq_cont.20154:
	beqi	%v1, 0, bnei_else.20155
	j	bnei_cont.20156
bnei_else.20155:
	fblt	%f0, %f1, fbgt_else.20157
	addi	%v1, %zero, 0
	j	fbgt_cont.20158
fbgt_else.20157:
	addi	%v1, %zero, 1
fbgt_cont.20158:
	beqi	%v1, 0, bnei_else.20159
	flw	%f0, 471(%zero)
	j	bnei_cont.20160
bnei_else.20159:
	flw	%f0, 466(%zero)
bnei_cont.20160:
bnei_cont.20156:
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f0, 0(%at)
bnei_cont.20150:
	addi	%v1, %zero, 138
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	utexture.2952
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.20161
	jr	%ra
bnei_else.20161:
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
	fblt	%f1, %f0, fbgt_else.20163
	addi	%v0, %zero, 0
	j	fbgt_cont.20164
fbgt_else.20163:
	addi	%v0, %zero, 1
fbgt_cont.20164:
	beqi	%v0, 0, bnei_else.20165
	j	bnei_cont.20166
bnei_else.20165:
	fmov	%f0, %f1
bnei_cont.20166:
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
bnei_else.20148:
	jr	%ra
iter_trace_diffuse_rays.2973:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.20169
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
	fblt	%f0, %f2, fbgt_else.20170
	addi	%t0, %zero, 0
	j	fbgt_cont.20171
fbgt_else.20170:
	addi	%t0, %zero, 1
fbgt_cont.20171:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f4, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	beqi	%t0, 0, bnei_else.20172
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
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.20174
	lw	%v0, 141(%zero)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 10(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 11(%sp)
	beqi	%a0, 1, bnei_else.20176
	beqi	%a0, 2, bnei_else.20178
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	get_nvector_second.2947
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.20179
bnei_else.20178:
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
bnei_cont.20179:
	j	bnei_cont.20177
bnei_else.20176:
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.20180
	addi	%v1, %zero, 1
	j	fbeq_cont.20181
fbeq_else.20180:
	addi	%v1, %zero, 0
fbeq_cont.20181:
	beqi	%v1, 0, bnei_else.20182
	fmov	%f1, %f0
	j	bnei_cont.20183
bnei_else.20182:
	fblt	%f0, %f1, fbgt_else.20184
	addi	%v1, %zero, 0
	j	fbgt_cont.20185
fbgt_else.20184:
	addi	%v1, %zero, 1
fbgt_cont.20185:
	beqi	%v1, 0, bnei_else.20186
	flw	%f1, 471(%zero)
	j	bnei_cont.20187
bnei_else.20186:
	flw	%f1, 466(%zero)
bnei_cont.20187:
bnei_cont.20183:
	fneg	%f1, %f1
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f1, 0(%at)
bnei_cont.20177:
	addi	%v1, %zero, 138
	lw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	utexture.2952
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 134(%zero)
	lw	%v0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.20188
	j	bnei_cont.20189
bnei_else.20188:
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
	fblt	%f1, %f0, fbgt_else.20190
	addi	%v0, %zero, 0
	j	fbgt_cont.20191
fbgt_else.20190:
	addi	%v0, %zero, 1
fbgt_cont.20191:
	beqi	%v0, 0, bnei_else.20192
	j	bnei_cont.20193
bnei_else.20192:
	fmov	%f0, %f1
bnei_cont.20193:
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
bnei_cont.20189:
	j	bnei_cont.20175
bnei_else.20174:
bnei_cont.20175:
	j	bnei_cont.20173
bnei_else.20172:
	flw	%f5, 440(%zero)
	fdiv	%f0, %f0, %f5
	fsw	%f0, 12(%sp)
	sw	%a2, 9(%sp)
	sw	%a3, 13(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.20194
	lw	%v0, 141(%zero)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 13(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 14(%sp)
	beqi	%a0, 1, bnei_else.20196
	beqi	%a0, 2, bnei_else.20198
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	get_nvector_second.2947
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.20199
bnei_else.20198:
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
bnei_cont.20199:
	j	bnei_cont.20197
bnei_else.20196:
	lw	%a0, 136(%zero)
	flw	%f0, 2(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.20200
	addi	%v1, %zero, 1
	j	fbeq_cont.20201
fbeq_else.20200:
	addi	%v1, %zero, 0
fbeq_cont.20201:
	beqi	%v1, 0, bnei_else.20202
	fmov	%f1, %f0
	j	bnei_cont.20203
bnei_else.20202:
	fblt	%f0, %f1, fbgt_else.20204
	addi	%v1, %zero, 0
	j	fbgt_cont.20205
fbgt_else.20204:
	addi	%v1, %zero, 1
fbgt_cont.20205:
	beqi	%v1, 0, bnei_else.20206
	flw	%f1, 471(%zero)
	j	bnei_cont.20207
bnei_else.20206:
	flw	%f1, 466(%zero)
bnei_cont.20207:
bnei_cont.20203:
	fneg	%f1, %f1
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f1, 0(%at)
bnei_cont.20197:
	addi	%v1, %zero, 138
	lw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	utexture.2952
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 134(%zero)
	lw	%v0, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	beqi	%v0, 0, bnei_else.20208
	j	bnei_cont.20209
bnei_else.20208:
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
	fblt	%f1, %f0, fbgt_else.20210
	addi	%v0, %zero, 0
	j	fbgt_cont.20211
fbgt_else.20210:
	addi	%v0, %zero, 1
fbgt_cont.20211:
	beqi	%v0, 0, bnei_else.20212
	j	bnei_cont.20213
bnei_else.20212:
	fmov	%f0, %f1
bnei_cont.20213:
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
bnei_cont.20209:
	j	bnei_cont.20195
bnei_else.20194:
bnei_cont.20195:
bnei_cont.20173:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.20214
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
	fblt	%f0, %f1, fbgt_else.20215
	addi	%a1, %zero, 0
	j	fbgt_cont.20216
fbgt_else.20215:
	addi	%a1, %zero, 1
fbgt_cont.20216:
	sw	%v0, 15(%sp)
	beqi	%a1, 0, bnei_else.20217
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.20218
bnei_else.20217:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
bnei_cont.20218:
	lw	%v0, 15(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
bgti_else.20214:
	jr	%ra
bgti_else.20169:
	jr	%ra
trace_diffuse_ray_80percent.2982:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.20221
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
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.20222
bnei_else.20221:
bnei_cont.20222:
	lw	%v0, 2(%sp)
	beqi	%v0, 1, bnei_else.20223
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
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.20224
bnei_else.20223:
bnei_cont.20224:
	lw	%v0, 2(%sp)
	beqi	%v0, 2, bnei_else.20225
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
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.20226
bnei_else.20225:
bnei_cont.20226:
	lw	%v0, 2(%sp)
	beqi	%v0, 3, bnei_else.20227
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
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.20228
bnei_else.20227:
bnei_cont.20228:
	lw	%v0, 2(%sp)
	beqi	%v0, 4, bnei_else.20229
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
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 7(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	j	iter_trace_diffuse_rays.2973
bnei_else.20229:
	jr	%ra
calc_diffuse_using_1point.2986:
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
	beqi	%v0, 0, bnei_else.20231
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
	jal	setup_startp_constants.2875
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
	fblt	%f0, %f1, fbgt_else.20233
	addi	%a0, %zero, 0
	j	fbgt_cont.20234
fbgt_else.20233:
	addi	%a0, %zero, 1
fbgt_cont.20234:
	beqi	%a0, 0, bnei_else.20235
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.20236
bnei_else.20235:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.20236:
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.20232
bnei_else.20231:
bnei_cont.20232:
	lw	%v0, 4(%sp)
	beqi	%v0, 1, bnei_else.20237
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
	jal	setup_startp_constants.2875
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
	fblt	%f0, %f1, fbgt_else.20239
	addi	%a0, %zero, 0
	j	fbgt_cont.20240
fbgt_else.20239:
	addi	%a0, %zero, 1
fbgt_cont.20240:
	beqi	%a0, 0, bnei_else.20241
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.20242
bnei_else.20241:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.20242:
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.20238
bnei_else.20237:
bnei_cont.20238:
	lw	%v0, 4(%sp)
	beqi	%v0, 2, bnei_else.20243
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
	jal	setup_startp_constants.2875
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
	fblt	%f0, %f1, fbgt_else.20245
	addi	%a0, %zero, 0
	j	fbgt_cont.20246
fbgt_else.20245:
	addi	%a0, %zero, 1
fbgt_cont.20246:
	beqi	%a0, 0, bnei_else.20247
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.20248
bnei_else.20247:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.20248:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.20244
bnei_else.20243:
bnei_cont.20244:
	lw	%v0, 4(%sp)
	beqi	%v0, 3, bnei_else.20249
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
	jal	setup_startp_constants.2875
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
	fblt	%f0, %f1, fbgt_else.20251
	addi	%a0, %zero, 0
	j	fbgt_cont.20252
fbgt_else.20251:
	addi	%a0, %zero, 1
fbgt_cont.20252:
	beqi	%a0, 0, bnei_else.20253
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20254
bnei_else.20253:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.20254:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20250
bnei_else.20249:
bnei_cont.20250:
	lw	%v0, 4(%sp)
	beqi	%v0, 4, bnei_else.20255
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
	jal	setup_startp_constants.2875
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
	fblt	%f0, %f1, fbgt_else.20257
	addi	%a0, %zero, 0
	j	fbgt_cont.20258
fbgt_else.20257:
	addi	%a0, %zero, 1
fbgt_cont.20258:
	beqi	%a0, 0, bnei_else.20259
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20260
bnei_else.20259:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20260:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20256
bnei_else.20255:
bnei_cont.20256:
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
calc_diffuse_using_5points.2989:
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
do_without_neighbors.2995:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20263
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20264
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.20265
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
	jal	trace_diffuse_ray_80percent.2982
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
	j	bnei_cont.20266
bnei_else.20265:
bnei_cont.20266:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20267
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20268
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.20269
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.20270
bnei_else.20269:
bnei_cont.20270:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2995
bgti_else.20268:
	jr	%ra
bgt_else.20267:
	jr	%ra
bgti_else.20264:
	jr	%ra
bgt_else.20263:
	jr	%ra
try_exploit_neighbors.3011:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.20275
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.20276
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20277
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20279
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20281
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20283
	addi	%t1, %zero, 1
	j	beq_cont.20284
beq_else.20283:
	addi	%t1, %zero, 0
beq_cont.20284:
	j	beq_cont.20282
beq_else.20281:
	addi	%t1, %zero, 0
beq_cont.20282:
	j	beq_cont.20280
beq_else.20279:
	addi	%t1, %zero, 0
beq_cont.20280:
	j	beq_cont.20278
beq_else.20277:
	addi	%t1, %zero, 0
beq_cont.20278:
	beqi	%t1, 0, bnei_else.20285
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
	beqi	%t1, 0, bnei_else.20286
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.20287
bnei_else.20286:
bnei_cont.20287:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20288
	lw	%v0, 6(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20289
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 5(%sp)
	lw	%a1, 2(%a1)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	bne	%a1, %a0, beq_else.20290
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	add	%at, %a2, %a1
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.20292
	addi	%a3, %a1, -1
	lw	%t0, 2(%sp)
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.20294
	addi	%a3, %a1, 1
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.20296
	addi	%a0, %zero, 1
	j	beq_cont.20297
beq_else.20296:
	addi	%a0, %zero, 0
beq_cont.20297:
	j	beq_cont.20295
beq_else.20294:
	addi	%a0, %zero, 0
beq_cont.20295:
	j	beq_cont.20293
beq_else.20292:
	addi	%a0, %zero, 0
beq_cont.20293:
	j	beq_cont.20291
beq_else.20290:
	addi	%a0, %zero, 0
beq_cont.20291:
	beqi	%a0, 0, bnei_else.20298
	lw	%v0, 3(%v0)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%v1, 8(%sp)
	beqi	%v0, 0, bnei_else.20299
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
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20300
bnei_else.20299:
bnei_cont.20300:
	lw	%v0, 8(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 2(%sp)
	lw	%a2, 4(%sp)
	j	try_exploit_neighbors.3011
bnei_else.20298:
	j	do_without_neighbors.2995
bgti_else.20289:
	jr	%ra
bgt_else.20288:
	jr	%ra
bnei_else.20285:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.20303
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.20304
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 6(%sp)
	sw	%a3, 7(%sp)
	beqi	%v0, 0, bnei_else.20305
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20306
bnei_else.20305:
bnei_cont.20306:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 6(%sp)
	j	do_without_neighbors.2995
bgti_else.20304:
	jr	%ra
bgt_else.20303:
	jr	%ra
bgti_else.20276:
	jr	%ra
bgt_else.20275:
	jr	%ra
write_rgb_element.3020:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20311
	blti	%v0, 0, bgti_else.20313
	j	bgti_cont.20314
bgti_else.20313:
	addi	%v0, %zero, 0
bgti_cont.20314:
	j	bgt_cont.20312
bgt_else.20311:
	addi	%v0, %zero, 255
bgt_cont.20312:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.20315
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.20317
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20319
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20321
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20323
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20325
	addi	%v1, %v1, -10
	addi	%a0, %zero, 6
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.20326
bgti_else.20325:
	addi	%v0, %zero, 5
bgti_cont.20326:
	j	bgti_cont.20324
bgti_else.20323:
	addi	%v0, %zero, 4
bgti_cont.20324:
	j	bgti_cont.20322
bgti_else.20321:
	addi	%v0, %zero, 3
bgti_cont.20322:
	j	bgti_cont.20320
bgti_else.20319:
	addi	%v0, %zero, 2
bgti_cont.20320:
	j	bgti_cont.20318
bgti_else.20317:
	addi	%v0, %zero, 1
bgti_cont.20318:
	j	bgti_cont.20316
bgti_else.20315:
	addi	%v0, %zero, 0
bgti_cont.20316:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.20327
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20329
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20331
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20333
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20335
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20337
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20339
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20341
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20343
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20345
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20347
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20349
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20351
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20353
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2625
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.20354
bgti_else.20353:
	add	%v0, %zero, %v1
bgti_cont.20354:
	j	bgti_cont.20352
bgti_else.20351:
	add	%v0, %zero, %v1
bgti_cont.20352:
	j	bgti_cont.20350
bgti_else.20349:
	add	%v0, %zero, %v1
bgti_cont.20350:
	j	bgti_cont.20348
bgti_else.20347:
	add	%v0, %zero, %v1
bgti_cont.20348:
	j	bgti_cont.20346
bgti_else.20345:
	add	%v0, %zero, %v1
bgti_cont.20346:
	j	bgti_cont.20344
bgti_else.20343:
	add	%v0, %zero, %v1
bgti_cont.20344:
	j	bgti_cont.20342
bgti_else.20341:
	add	%v0, %zero, %v1
bgti_cont.20342:
	j	bgti_cont.20340
bgti_else.20339:
	add	%v0, %zero, %v1
bgti_cont.20340:
	j	bgti_cont.20338
bgti_else.20337:
	add	%v0, %zero, %v1
bgti_cont.20338:
	j	bgti_cont.20336
bgti_else.20335:
	add	%v0, %zero, %v1
bgti_cont.20336:
	j	bgti_cont.20334
bgti_else.20333:
	add	%v0, %zero, %v1
bgti_cont.20334:
	j	bgti_cont.20332
bgti_else.20331:
	add	%v0, %zero, %v1
bgti_cont.20332:
	j	bgti_cont.20330
bgti_else.20329:
	add	%v0, %zero, %v1
bgti_cont.20330:
	j	bgti_cont.20328
bgti_else.20327:
	add	%v0, %zero, %v1
bgti_cont.20328:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.20355
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.20355:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.20356
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.20358
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20360
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20362
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20364
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20366
	addi	%a0, %a0, -10
	addi	%a1, %zero, 6
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2622
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.20367
bgti_else.20366:
	addi	%v0, %zero, 5
bgti_cont.20367:
	j	bgti_cont.20365
bgti_else.20364:
	addi	%v0, %zero, 4
bgti_cont.20365:
	j	bgti_cont.20363
bgti_else.20362:
	addi	%v0, %zero, 3
bgti_cont.20363:
	j	bgti_cont.20361
bgti_else.20360:
	addi	%v0, %zero, 2
bgti_cont.20361:
	j	bgti_cont.20359
bgti_else.20358:
	addi	%v0, %zero, 1
bgti_cont.20359:
	j	bgti_cont.20357
bgti_else.20356:
	addi	%v0, %zero, 0
bgti_cont.20357:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.20368
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20370
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20372
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20374
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20376
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20378
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20380
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20382
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20384
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20386
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20388
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20390
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20392
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20394
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2625
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.20395
bgti_else.20394:
	add	%v0, %zero, %v1
bgti_cont.20395:
	j	bgti_cont.20393
bgti_else.20392:
	add	%v0, %zero, %v1
bgti_cont.20393:
	j	bgti_cont.20391
bgti_else.20390:
	add	%v0, %zero, %v1
bgti_cont.20391:
	j	bgti_cont.20389
bgti_else.20388:
	add	%v0, %zero, %v1
bgti_cont.20389:
	j	bgti_cont.20387
bgti_else.20386:
	add	%v0, %zero, %v1
bgti_cont.20387:
	j	bgti_cont.20385
bgti_else.20384:
	add	%v0, %zero, %v1
bgti_cont.20385:
	j	bgti_cont.20383
bgti_else.20382:
	add	%v0, %zero, %v1
bgti_cont.20383:
	j	bgti_cont.20381
bgti_else.20380:
	add	%v0, %zero, %v1
bgti_cont.20381:
	j	bgti_cont.20379
bgti_else.20378:
	add	%v0, %zero, %v1
bgti_cont.20379:
	j	bgti_cont.20377
bgti_else.20376:
	add	%v0, %zero, %v1
bgti_cont.20377:
	j	bgti_cont.20375
bgti_else.20374:
	add	%v0, %zero, %v1
bgti_cont.20375:
	j	bgti_cont.20373
bgti_else.20372:
	add	%v0, %zero, %v1
bgti_cont.20373:
	j	bgti_cont.20371
bgti_else.20370:
	add	%v0, %zero, %v1
bgti_cont.20371:
	j	bgti_cont.20369
bgti_else.20368:
	add	%v0, %zero, %v1
bgti_cont.20369:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.20396
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.20396:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.20397
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20399
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20401
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20403
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20405
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20407
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20409
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20411
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20413
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20415
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20417
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20419
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20421
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20423
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.20424
bgti_else.20423:
	add	%v0, %zero, %v1
bgti_cont.20424:
	j	bgti_cont.20422
bgti_else.20421:
	add	%v0, %zero, %v1
bgti_cont.20422:
	j	bgti_cont.20420
bgti_else.20419:
	add	%v0, %zero, %v1
bgti_cont.20420:
	j	bgti_cont.20418
bgti_else.20417:
	add	%v0, %zero, %v1
bgti_cont.20418:
	j	bgti_cont.20416
bgti_else.20415:
	add	%v0, %zero, %v1
bgti_cont.20416:
	j	bgti_cont.20414
bgti_else.20413:
	add	%v0, %zero, %v1
bgti_cont.20414:
	j	bgti_cont.20412
bgti_else.20411:
	add	%v0, %zero, %v1
bgti_cont.20412:
	j	bgti_cont.20410
bgti_else.20409:
	add	%v0, %zero, %v1
bgti_cont.20410:
	j	bgti_cont.20408
bgti_else.20407:
	add	%v0, %zero, %v1
bgti_cont.20408:
	j	bgti_cont.20406
bgti_else.20405:
	add	%v0, %zero, %v1
bgti_cont.20406:
	j	bgti_cont.20404
bgti_else.20403:
	add	%v0, %zero, %v1
bgti_cont.20404:
	j	bgti_cont.20402
bgti_else.20401:
	add	%v0, %zero, %v1
bgti_cont.20402:
	j	bgti_cont.20400
bgti_else.20399:
	add	%v0, %zero, %v1
bgti_cont.20400:
	j	bgti_cont.20398
bgti_else.20397:
	add	%v0, %zero, %v1
bgti_cont.20398:
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
write_rgb.3022:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20425
	blti	%v0, 0, bgti_else.20427
	j	bgti_cont.20428
bgti_else.20427:
	addi	%v0, %zero, 0
bgti_cont.20428:
	j	bgt_cont.20426
bgt_else.20425:
	addi	%v0, %zero, 255
bgt_cont.20426:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2627
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
	blt	%at, %v0, bgt_else.20429
	blti	%v0, 0, bgti_else.20431
	j	bgti_cont.20432
bgti_else.20431:
	addi	%v0, %zero, 0
bgti_cont.20432:
	j	bgt_cont.20430
bgt_else.20429:
	addi	%v0, %zero, 255
bgt_cont.20430:
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int.2627
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
	blt	%at, %v0, bgt_else.20433
	blti	%v0, 0, bgti_else.20435
	j	bgti_cont.20436
bgti_else.20435:
	addi	%v0, %zero, 0
bgti_cont.20436:
	j	bgt_cont.20434
bgt_else.20433:
	addi	%v0, %zero, 255
bgt_cont.20434:
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int.2627
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3024:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20437
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20438
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.20439
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
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2973
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
	j	bnei_cont.20440
bnei_else.20439:
bnei_cont.20440:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20441
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20442
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.20443
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
	jal	setup_startp_constants.2875
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
	fblt	%f0, %f1, fbgt_else.20445
	addi	%a0, %zero, 0
	j	fbgt_cont.20446
fbgt_else.20445:
	addi	%a0, %zero, 1
fbgt_cont.20446:
	beqi	%a0, 0, bnei_else.20447
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20448
bnei_else.20447:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20448:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2973
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
	j	bnei_cont.20444
bnei_else.20443:
bnei_cont.20444:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3024
bgti_else.20442:
	jr	%ra
bgt_else.20441:
	jr	%ra
bgti_else.20438:
	jr	%ra
bgt_else.20437:
	jr	%ra
pretrace_pixels.3027:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.20453
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
	jal	vecunit_sgn.2655
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
	jal	trace_ray.2964
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
	blti	%v1, 0, bgti_else.20454
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.20456
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
	jal	setup_startp_constants.2875
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
	fblt	%f0, %f1, fbgt_else.20458
	addi	%a0, %zero, 0
	j	fbgt_cont.20459
fbgt_else.20458:
	addi	%a0, %zero, 1
fbgt_cont.20459:
	beqi	%a0, 0, bnei_else.20460
	lw	%v1, 119(%v0)
	flw	%f1, 441(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.20461
bnei_else.20460:
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bnei_cont.20461:
	addi	%a1, %zero, 116
	lw	%v0, 12(%sp)
	lw	%v1, 11(%sp)
	lw	%a0, 10(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	iter_trace_diffuse_rays.2973
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
	j	bnei_cont.20457
bnei_else.20456:
bnei_cont.20457:
	lw	%v1, 3(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	pretrace_diffuse_rays.3024
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.20455
bgti_else.20454:
bgti_cont.20455:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.20462
	addi	%a0, %v0, -5
	j	bgti_cont.20463
bgti_else.20462:
	add	%a0, %zero, %v0
bgti_cont.20463:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 7(%sp)
	j	pretrace_pixels.3027
bgti_else.20453:
	jr	%ra
scan_pixel.3038:
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.20465
	jr	%ra
bgt_else.20465:
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
	blt	%t4, %t2, bgt_else.20467
	addi	%t5, %zero, 0
	j	bgt_cont.20468
bgt_else.20467:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.20469
	addi	%t5, %zero, 0
	j	bgt_cont.20470
bgt_else.20469:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.20471
	addi	%t5, %zero, 0
	j	bgt_cont.20472
bgt_else.20471:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20473
	addi	%t5, %zero, 0
	j	bgt_cont.20474
bgt_else.20473:
	addi	%t5, %zero, 1
bgt_cont.20474:
bgt_cont.20472:
bgt_cont.20470:
bgt_cont.20468:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%t4, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%v0, 8(%sp)
	beqi	%t5, 0, bnei_else.20475
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.20477
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20479
	add	%at, %a2, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20481
	addi	%t6, %v0, -1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20483
	addi	%t6, %v0, 1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20485
	addi	%t5, %zero, 1
	j	beq_cont.20486
beq_else.20485:
	addi	%t5, %zero, 0
beq_cont.20486:
	j	beq_cont.20484
beq_else.20483:
	addi	%t5, %zero, 0
beq_cont.20484:
	j	beq_cont.20482
beq_else.20481:
	addi	%t5, %zero, 0
beq_cont.20482:
	j	beq_cont.20480
beq_else.20479:
	addi	%t5, %zero, 0
beq_cont.20480:
	beqi	%t5, 0, bnei_else.20487
	lw	%t1, 3(%t1)
	lw	%t1, 0(%t1)
	sw	%t3, 9(%sp)
	beqi	%t1, 0, bnei_else.20489
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20490
bnei_else.20489:
bnei_cont.20490:
	lw	%v0, 8(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20488
bnei_else.20487:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20488:
	j	bgti_cont.20478
bgti_else.20477:
bgti_cont.20478:
	j	bnei_cont.20476
bnei_else.20475:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.20491
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.20493
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.20494
bnei_else.20493:
bnei_cont.20494:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.20492
bgti_else.20491:
bgti_cont.20492:
bnei_cont.20476:
	flw	%f0, 151(%zero)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	write_rgb_element.3020
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
	jal	write_rgb_element.3020
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
	jal	write_rgb_element.3020
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
	blt	%v0, %v1, bgt_else.20495
	jr	%ra
bgt_else.20495:
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
	blt	%a2, %a3, bgt_else.20497
	addi	%v1, %zero, 0
	j	bgt_cont.20498
bgt_else.20497:
	lw	%a2, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.20499
	addi	%v1, %zero, 0
	j	bgt_cont.20500
bgt_else.20499:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.20501
	addi	%v1, %zero, 0
	j	bgt_cont.20502
bgt_else.20501:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20503
	addi	%v1, %zero, 0
	j	bgt_cont.20504
bgt_else.20503:
	addi	%v1, %zero, 1
bgt_cont.20504:
bgt_cont.20502:
bgt_cont.20500:
bgt_cont.20498:
	sw	%v0, 12(%sp)
	beqi	%v1, 0, bnei_else.20505
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 2(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.20506
bnei_else.20505:
	lw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bnei_cont.20506:
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	write_rgb.3022
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 0(%sp)
	j	scan_pixel.3038
scan_line.3044:
	addi	%a3, %zero, 1
	lw	%t0, 155(%zero)
	blt	%v0, %t0, bgt_else.20507
	jr	%ra
bgt_else.20507:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.20509
	j	bgt_cont.20510
bgt_else.20509:
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
	jal	pretrace_pixels.3027
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bgt_cont.20510:
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20511
	j	bgt_cont.20512
bgt_else.20511:
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
	blt	%a3, %t0, bgt_else.20513
	addi	%a3, %zero, 0
	j	bgt_cont.20514
bgt_else.20513:
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.20515
	addi	%a3, %zero, 0
	j	bgt_cont.20516
bgt_else.20515:
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.20517
	addi	%a3, %zero, 0
	j	bgt_cont.20518
bgt_else.20517:
	addi	%a3, %zero, 0
bgt_cont.20518:
bgt_cont.20516:
bgt_cont.20514:
	beqi	%a3, 0, bnei_else.20519
	lw	%a0, 4(%sp)
	lw	%a3, 3(%sp)
	addi	%v0, %v1, 0
	addi	%k0, %a3, 0
	addi	%a3, %v1, 0
	addi	%v1, %a2, 0
	addi	%a2, %k0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20520
bnei_else.20519:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20520:
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	write_rgb.3022
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	lw	%a2, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	scan_pixel.3038
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bgt_cont.20512:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.20521
	addi	%a0, %v0, -5
	j	bgti_cont.20522
bgti_else.20521:
	add	%a0, %zero, %v0
bgti_cont.20522:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.20523
	jr	%ra
bgt_else.20523:
	lw	%v0, 0(%sp)
	sw	%a0, 10(%sp)
	sw	%v1, 11(%sp)
	blt	%v1, %v0, bgt_else.20525
	j	bgt_cont.20526
bgt_else.20525:
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
	jal	pretrace_pixels.3027
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bgt_cont.20526:
	lw	%v0, 8(%sp)
	lw	%v1, 11(%sp)
	lw	%a0, 7(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	scan_pixel.3038
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.20527
	addi	%a2, %v1, -5
	j	bgti_cont.20528
bgti_else.20527:
	add	%a2, %zero, %v1
bgti_cont.20528:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	j	scan_line.3044
create_pixel.3052:
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
init_line_elements.3054:
	addi	%a0, %zero, 0
	blti	%v1, 0, bgti_else.20529
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
	blti	%v0, 0, bgti_else.20530
	sw	%v0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	create_pixel.3052
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v1, 15(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.20531
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
	blti	%v0, 0, bgti_else.20532
	sw	%v0, 25(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	create_pixel.3052
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	init_line_elements.3054
bgti_else.20532:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.20531:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.20530:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.20529:
	jr	%ra
calc_dirvec.3064:
	blti	%v0, 5, bgti_else.20533
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
bgti_else.20533:
	fmul	%f0, %f1, %f1
	flw	%f1, 442(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 471(%zero)
	fdiv	%f5, %f4, %f0
	flw	%f6, 467(%zero)
	fblt	%f5, %f6, fbgt_else.20535
	addi	%a1, %zero, 1
	j	fbgt_cont.20536
fbgt_else.20535:
	addi	%a1, %zero, 0
fbgt_cont.20536:
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
	fblt	%f7, %f8, fbgt_else.20537
	flw	%f5, 454(%zero)
	sw	%a1, 10(%sp)
	fblt	%f7, %f5, fbgt_else.20539
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
	j	fbgt_cont.20540
fbgt_else.20539:
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
fbgt_cont.20540:
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.20541
	j	bnei_cont.20542
bnei_else.20541:
	fneg	%f0, %f0
bnei_cont.20542:
	j	fbgt_cont.20538
fbgt_else.20537:
	fmov	%f0, %f5
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	kernel_atan.2612
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
fbgt_cont.20538:
	flw	%f1, 9(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	sin.2618
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fsw	%f0, 14(%sp)
	fmov	%f0, %f1
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	cos.2616
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
	fblt	%f3, %f4, fbgt_else.20543
	addi	%v1, %zero, 1
	j	fbgt_cont.20544
fbgt_else.20543:
	addi	%v1, %zero, 0
fbgt_cont.20544:
	fabs	%f4, %f3
	flw	%f5, 3(%sp)
	fsw	%f0, 15(%sp)
	sw	%v0, 16(%sp)
	fsw	%f1, 17(%sp)
	fblt	%f4, %f5, fbgt_else.20545
	flw	%f3, 454(%zero)
	sw	%v1, 18(%sp)
	fblt	%f4, %f3, fbgt_else.20547
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
	j	fbgt_cont.20548
fbgt_else.20547:
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
fbgt_cont.20548:
	lw	%v0, 18(%sp)
	beqi	%v0, 0, bnei_else.20549
	j	bnei_cont.20550
bnei_else.20549:
	fneg	%f0, %f0
bnei_cont.20550:
	j	fbgt_cont.20546
fbgt_else.20545:
	fmov	%f0, %f3
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	kernel_atan.2612
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
fbgt_cont.20546:
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 21(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	sin.2618
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 21(%sp)
	fsw	%f0, 22(%sp)
	fmov	%f0, %f1
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	cos.2616
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
	j	calc_dirvec.3064
calc_dirvecs.3072:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.20551
	itof	%f1, %v0
	flw	%f2, 499(%zero)
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
	jal	calc_dirvec.3064
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
	jal	calc_dirvec.3064
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 3(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.20552
	addi	%v1, %v1, -5
	j	bgti_cont.20553
bgti_else.20552:
bgti_cont.20553:
	blti	%v0, 0, bgti_else.20554
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
	jal	calc_dirvec.3064
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
	jal	calc_dirvec.3064
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.20555
	addi	%v1, %v1, -5
	j	bgti_cont.20556
bgti_else.20555:
bgti_cont.20556:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3072
bgti_else.20554:
	jr	%ra
bgti_else.20551:
	jr	%ra
calc_dirvec_rows.3077:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.20559
	itof	%f0, %v0
	flw	%f1, 499(%zero)
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
	jal	calc_dirvec.3064
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
	jal	calc_dirvec.3064
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 6(%sp)
	addi	%a0, %v1, 1
	blti	%a0, 5, bgti_else.20560
	addi	%a0, %a0, -5
	j	bgti_cont.20561
bgti_else.20560:
bgti_cont.20561:
	flw	%f0, 4(%sp)
	lw	%a1, 8(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvecs.3072
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 6(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.20562
	addi	%v1, %v1, -5
	j	bgti_cont.20563
bgti_else.20562:
bgti_cont.20563:
	lw	%a0, 8(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.20564
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
	jal	calc_dirvecs.3072
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.20565
	addi	%v1, %v1, -5
	j	bgti_cont.20566
bgti_else.20565:
bgti_cont.20566:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3077
bgti_else.20564:
	jr	%ra
bgti_else.20559:
	jr	%ra
create_dirvec_elements.3083:
	blti	%v1, 0, bgti_else.20569
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
	blti	%v0, 0, bgti_else.20570
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
	blti	%v0, 0, bgti_else.20571
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
	blti	%v0, 0, bgti_else.20572
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
	j	create_dirvec_elements.3083
bgti_else.20572:
	jr	%ra
bgti_else.20571:
	jr	%ra
bgti_else.20570:
	jr	%ra
bgti_else.20569:
	jr	%ra
create_dirvecs.3086:
	blti	%v0, 0, bgti_else.20577
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
	jal	create_dirvec_elements.3083
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20578
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
	jal	create_dirvec_elements.3083
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	j	create_dirvecs.3086
bgti_else.20578:
	jr	%ra
bgti_else.20577:
	jr	%ra
init_dirvec_constants.3088:
	blti	%v1, 0, bgti_else.20581
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
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20582
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.20583
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.20585
	beqi	%t1, 2, bnei_else.20587
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_second_table.2867
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20588
bnei_else.20587:
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_surface_table.2864
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20588:
	j	bnei_cont.20586
bnei_else.20585:
	sw	%a3, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_rect_table.2861
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20586:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.20584
bgti_else.20583:
bgti_cont.20584:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20589
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20590
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 7(%sp)
	blti	%a1, 0, bgti_else.20591
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.20593
	beqi	%t1, 2, bnei_else.20595
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_second_table.2867
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20596
bnei_else.20595:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_surface_table.2864
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20596:
	j	bnei_cont.20594
bnei_else.20593:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_rect_table.2861
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20594:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.20592
bgti_else.20591:
bgti_cont.20592:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	init_dirvec_constants.3088
bgti_else.20590:
	jr	%ra
bgti_else.20589:
	jr	%ra
bgti_else.20582:
	jr	%ra
bgti_else.20581:
	jr	%ra
init_vecset_constants.3091:
	blti	%v0, 0, bgti_else.20601
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
	blti	%a2, 0, bgti_else.20602
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.20604
	beqi	%t2, 2, bnei_else.20606
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_second_table.2867
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20607
bnei_else.20606:
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_surface_table.2864
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20607:
	j	bnei_cont.20605
bnei_else.20604:
	sw	%t0, 5(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_rect_table.2861
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20605:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.20603
bgti_else.20602:
bgti_cont.20603:
	addi	%v0, %zero, 118
	lw	%v1, 3(%sp)
	lw	%a0, 118(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 117
	lw	%v1, 3(%sp)
	lw	%a0, 117(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 7(%sp)
	blti	%a1, 0, bgti_else.20608
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.20610
	beqi	%t1, 2, bnei_else.20612
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_second_table.2867
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20613
bnei_else.20612:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_surface_table.2864
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20613:
	j	bnei_cont.20611
bnei_else.20610:
	sw	%a3, 9(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_rect_table.2861
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20611:
	addi	%v0, %v1, -1
	lw	%a0, 8(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.20609
bgti_else.20608:
bgti_cont.20609:
	addi	%v1, %zero, 116
	lw	%v0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20614
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
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)
	blti	%a0, 0, bgti_else.20615
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 12(%sp)
	beqi	%t0, 1, bnei_else.20617
	beqi	%t0, 2, bnei_else.20619
	sw	%a2, 13(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	setup_second_table.2867
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 13(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20620
bnei_else.20619:
	sw	%a2, 13(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	setup_surface_table.2864
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 13(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20620:
	j	bnei_cont.20618
bnei_else.20617:
	sw	%a2, 13(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	setup_rect_table.2861
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 13(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20618:
	addi	%v0, %v1, -1
	lw	%a0, 12(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.20616
bgti_else.20615:
bgti_cont.20616:
	lw	%v0, 11(%sp)
	lw	%v1, 7(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20621
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 14(%sp)
	sw	%v1, 15(%sp)
	blti	%a1, 0, bgti_else.20622
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 16(%sp)
	beqi	%t1, 1, bnei_else.20624
	beqi	%t1, 2, bnei_else.20626
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_second_table.2867
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20627
bnei_else.20626:
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_surface_table.2864
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20627:
	j	bnei_cont.20625
bnei_else.20624:
	sw	%a3, 17(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	setup_rect_table.2861
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 17(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20625:
	addi	%v1, %v1, -1
	lw	%v0, 16(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.20623
bgti_else.20622:
bgti_cont.20623:
	lw	%v0, 15(%sp)
	lw	%v1, 6(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 14(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20628
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	sw	%v0, 18(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3091
bgti_else.20628:
	jr	%ra
bgti_else.20621:
	jr	%ra
bgti_else.20614:
	jr	%ra
bgti_else.20601:
	jr	%ra
setup_rect_reflection.3102:
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
	blti	%a2, 0, bgti_else.20633
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.20635
	beqi	%t0, 2, bnei_else.20637
	sw	%v0, 16(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_second_table.2867
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 16(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20638
bnei_else.20637:
	sw	%v0, 16(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_surface_table.2864
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 16(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20638:
	j	bnei_cont.20636
bnei_else.20635:
	sw	%v0, 16(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_rect_table.2861
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 16(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20636:
	addi	%v0, %v1, -1
	lw	%a0, 15(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.20634
bgti_else.20633:
bgti_cont.20634:
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
	blti	%a1, 0, bgti_else.20639
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20641
	beqi	%a3, 2, bnei_else.20643
	sw	%v0, 21(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	setup_second_table.2867
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 21(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20644
bnei_else.20643:
	sw	%v0, 21(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	setup_surface_table.2864
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 21(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20644:
	j	bnei_cont.20642
bnei_else.20641:
	sw	%v0, 21(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	setup_rect_table.2861
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 21(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20642:
	addi	%v0, %v1, -1
	lw	%a0, 20(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.20640
bgti_else.20639:
bgti_cont.20640:
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
	blti	%a1, 0, bgti_else.20645
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20647
	beqi	%a3, 2, bnei_else.20649
	sw	%v0, 26(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	setup_second_table.2867
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 26(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20650
bnei_else.20649:
	sw	%v0, 26(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	setup_surface_table.2864
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 26(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20650:
	j	bnei_cont.20648
bnei_else.20647:
	sw	%v0, 26(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	setup_rect_table.2861
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 14(%sp)
	lw	%a0, 26(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20648:
	addi	%v1, %v1, -1
	lw	%v0, 25(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.20646
bgti_else.20645:
bgti_cont.20646:
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
setup_surface_reflection.3105:
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
	flw	%f5, 494(%zero)
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
	blti	%a1, 0, bgti_else.20652
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20654
	beqi	%a3, 2, bnei_else.20656
	sw	%a1, 9(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_second_table.2867
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20657
bnei_else.20656:
	sw	%a1, 9(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_surface_table.2864
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20657:
	j	bnei_cont.20655
bnei_else.20654:
	sw	%a1, 9(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_rect_table.2861
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 9(%sp)
	lw	%a0, 10(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20655:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.20653
bgti_else.20652:
bgti_cont.20653:
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
rt.3110:
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
	jal	create_pixel.3052
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
	blti	%a0, 0, bgti_else.20659
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
	blti	%v0, 0, bgti_else.20661
	sw	%v0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	create_pixel.3052
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
	jal	init_line_elements.3054
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.20662
bgti_else.20661:
	add	%v0, %zero, %a0
bgti_cont.20662:
	j	bgti_cont.20660
bgti_else.20659:
bgti_cont.20660:
	sw	%v0, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	create_pixel.3052
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
	blti	%v1, 0, bgti_else.20663
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
	blti	%v0, 0, bgti_else.20665
	sw	%v0, 31(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	create_pixel.3052
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
	jal	init_line_elements.3054
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	j	bgti_cont.20666
bgti_else.20665:
	add	%v0, %zero, %a0
bgti_cont.20666:
	j	bgti_cont.20664
bgti_else.20663:
bgti_cont.20664:
	sw	%v0, 32(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	create_pixel.3052
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
	blti	%v1, 0, bgti_else.20667
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
	blti	%v0, 0, bgti_else.20669
	sw	%v0, 45(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	create_pixel.3052
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
	jal	init_line_elements.3054
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	bgti_cont.20670
bgti_else.20669:
	add	%v0, %zero, %a0
bgti_cont.20670:
	j	bgti_cont.20668
bgti_else.20667:
bgti_cont.20668:
	sw	%v0, 46(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	read_screen_settings.2756
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
	jal	sin.2618
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
	jal	cos.2616
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	flw	%f1, 49(%sp)
	fsw	%f0, 50(%sp)
	fmov	%f0, %f1
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	sin.2618
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	flw	%f1, 50(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 78(%zero)
	flw	%f0, 49(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	cos.2616
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
	jal	read_nth_object.2763
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20671
	lw	%v0, 1(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2763
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20673
	lw	%v0, 0(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2763
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20675
	addi	%v0, %zero, 3
	sw	%v0, 51(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	read_nth_object.2763
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	beqi	%v0, 0, bnei_else.20677
	addi	%v0, %zero, 4
	sw	%v0, 52(%sp)
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	read_nth_object.2763
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	beqi	%v0, 0, bnei_else.20679
	addi	%v0, %zero, 5
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	read_object.2765
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	bnei_cont.20680
bnei_else.20679:
	lw	%v0, 52(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20680:
	j	bnei_cont.20678
bnei_else.20677:
	lw	%v0, 51(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20678:
	j	bnei_cont.20676
bnei_else.20675:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20676:
	j	bnei_cont.20674
bnei_else.20673:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20674:
	j	bnei_cont.20672
bnei_else.20671:
	lw	%v0, 2(%sp)
	sw	%v0, 0(%zero)
bnei_cont.20672:
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	min_caml_read_int
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.20681
	lw	%v1, 1(%sp)
	sw	%v0, 53(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_net_item.2769
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	lw	%v1, 53(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.20682
bnei_else.20681:
	lw	%v0, 1(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	min_caml_create_array
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
bnei_cont.20682:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.20683
	sw	%v0, 83(%zero)
	lw	%v0, 2(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_net_item.2769
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.20685
	sw	%v0, 84(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_and_network.2773
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	j	bnei_cont.20686
bnei_else.20685:
bnei_cont.20686:
	j	bnei_cont.20684
bnei_else.20683:
bnei_cont.20684:
	lw	%v0, 2(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_or_network.2771
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
	jal	print_int.2627
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
	jal	print_int.2627
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
	jal	print_int.2627
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
	jal	create_dirvecs.3086
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	addi	%v0, %zero, 9
	lw	%v1, 2(%sp)
	addi	%a0, %v1, 0
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	calc_dirvec_rows.3077
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
	blti	%a1, 0, bgti_else.20687
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 61(%sp)
	beqi	%t1, 1, bnei_else.20689
	beqi	%t1, 2, bnei_else.20691
	sw	%a3, 62(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_second_table.2867
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v1, 58(%sp)
	lw	%a0, 62(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.20692
bnei_else.20691:
	sw	%a3, 62(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_surface_table.2864
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v1, 58(%sp)
	lw	%a0, 62(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20692:
	j	bnei_cont.20690
bnei_else.20689:
	sw	%a3, 62(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_rect_table.2861
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v1, 58(%sp)
	lw	%a0, 62(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.20690:
	addi	%v0, %v1, -1
	lw	%a0, 61(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	j	bgti_cont.20688
bgti_else.20687:
bgti_cont.20688:
	addi	%v1, %zero, 118
	lw	%v0, 60(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v0, 182(%zero)
	lw	%v1, 59(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_vecset_constants.3091
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
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v0, 58(%sp)
	blti	%v0, 0, bgti_else.20693
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.20695
	j	bnei_cont.20696
bnei_else.20695:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 471(%zero)
	fblt	%f0, %f1, fbgt_else.20697
	addi	%a0, %zero, 0
	j	fbgt_cont.20698
fbgt_else.20697:
	addi	%a0, %zero, 1
fbgt_cont.20698:
	beqi	%a0, 0, bnei_else.20699
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.20701
	beqi	%a0, 2, bnei_else.20703
	j	bnei_cont.20704
bnei_else.20703:
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_surface_reflection.3105
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
bnei_cont.20704:
	j	bnei_cont.20702
bnei_else.20701:
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_rect_reflection.3102
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
bnei_cont.20702:
	j	bnei_cont.20700
bnei_else.20699:
bnei_cont.20700:
bnei_cont.20696:
	j	bgti_cont.20694
bgti_else.20693:
bgti_cont.20694:
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
	jal	pretrace_pixels.3027
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
	lw	%v0, 56(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20705
	jr	%ra
bgt_else.20705:
	addi	%v0, %v0, -1
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20707
	j	bgt_cont.20708
bgt_else.20707:
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
	jal	pretrace_pixels.3027
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
bgt_cont.20708:
	lw	%v0, 2(%sp)
	lw	%a0, 18(%sp)
	lw	%a1, 32(%sp)
	lw	%a2, 46(%sp)
	addi	%v1, %v0, 0
	sw	%ra, 72(%sp)
	addi	%sp, %sp, 73
	jal	scan_pixel.3038
	addi	%sp, %sp, -73
	lw	%ra, 72(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 32(%sp)
	lw	%a0, 46(%sp)
	lw	%a1, 18(%sp)
	lw	%a2, 57(%sp)
	j	scan_line.3044
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
	jal	rt.3110
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%g0, %zero, 0
	ret
