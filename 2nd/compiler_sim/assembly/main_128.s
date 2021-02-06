.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 498
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
	flw	%f4, 497(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 496(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 495(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 494(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 493(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 492(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
f.6155.10191:
	fblt	%f0, %f1, fbgt_else.18900
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.18901
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
	j	f.6155.10191
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
fbgt_else.18900:
	fmov	%f0, %f1
	jr	%ra
g.6159.10195:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.18916
	fblt	%f0, %f1, fbgt_else.18917
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18918
	fblt	%f0, %f1, fbgt_else.18919
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18920
	fblt	%f0, %f1, fbgt_else.18921
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18922
	fblt	%f0, %f1, fbgt_else.18923
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18923:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18922:
	jr	%ra
fbgt_else.18921:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18924
	fblt	%f0, %f1, fbgt_else.18925
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18925:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18924:
	jr	%ra
fbgt_else.18920:
	jr	%ra
fbgt_else.18919:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18926
	fblt	%f0, %f1, fbgt_else.18927
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18928
	fblt	%f0, %f1, fbgt_else.18929
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18929:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18928:
	jr	%ra
fbgt_else.18927:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18930
	fblt	%f0, %f1, fbgt_else.18931
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18931:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18930:
	jr	%ra
fbgt_else.18926:
	jr	%ra
fbgt_else.18918:
	jr	%ra
fbgt_else.18917:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18932
	fblt	%f0, %f1, fbgt_else.18933
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18934
	fblt	%f0, %f1, fbgt_else.18935
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18936
	fblt	%f0, %f1, fbgt_else.18937
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18937:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18936:
	jr	%ra
fbgt_else.18935:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18938
	fblt	%f0, %f1, fbgt_else.18939
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18939:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18938:
	jr	%ra
fbgt_else.18934:
	jr	%ra
fbgt_else.18933:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18940
	fblt	%f0, %f1, fbgt_else.18941
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18942
	fblt	%f0, %f1, fbgt_else.18943
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18943:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18942:
	jr	%ra
fbgt_else.18941:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.18944
	fblt	%f0, %f1, fbgt_else.18945
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18945:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.18944:
	jr	%ra
fbgt_else.18940:
	jr	%ra
fbgt_else.18932:
	jr	%ra
fbgt_else.18916:
	jr	%ra
cos.2616:
	flw	%f1, 490(%zero)
	fabs	%f0, %f0
	flw	%f2, 489(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.18946
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.18948
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.18950
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.18952
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.18954
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.18956
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.18958
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.18960
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.18962
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.18964
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.18966
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.18968
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.18970
	flw	%f3, 476(%zero)
	fblt	%f0, %f3, fbgt_else.18972
	flw	%f3, 475(%zero)
	fblt	%f0, %f3, fbgt_else.18974
	flw	%f3, 474(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	f.6155.10191
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.18975
fbgt_else.18974:
	fmov	%f0, %f3
fbgt_cont.18975:
	j	fbgt_cont.18973
fbgt_else.18972:
	fmov	%f0, %f3
fbgt_cont.18973:
	j	fbgt_cont.18971
fbgt_else.18970:
	fmov	%f0, %f3
fbgt_cont.18971:
	j	fbgt_cont.18969
fbgt_else.18968:
	fmov	%f0, %f3
fbgt_cont.18969:
	j	fbgt_cont.18967
fbgt_else.18966:
	fmov	%f0, %f3
fbgt_cont.18967:
	j	fbgt_cont.18965
fbgt_else.18964:
	fmov	%f0, %f3
fbgt_cont.18965:
	j	fbgt_cont.18963
fbgt_else.18962:
	fmov	%f0, %f3
fbgt_cont.18963:
	j	fbgt_cont.18961
fbgt_else.18960:
	fmov	%f0, %f3
fbgt_cont.18961:
	j	fbgt_cont.18959
fbgt_else.18958:
	fmov	%f0, %f3
fbgt_cont.18959:
	j	fbgt_cont.18957
fbgt_else.18956:
	fmov	%f0, %f3
fbgt_cont.18957:
	j	fbgt_cont.18955
fbgt_else.18954:
	fmov	%f0, %f3
fbgt_cont.18955:
	j	fbgt_cont.18953
fbgt_else.18952:
	fmov	%f0, %f3
fbgt_cont.18953:
	j	fbgt_cont.18951
fbgt_else.18950:
	fmov	%f0, %f3
fbgt_cont.18951:
	j	fbgt_cont.18949
fbgt_else.18948:
	fmov	%f0, %f3
fbgt_cont.18949:
	j	fbgt_cont.18947
fbgt_else.18946:
	fmov	%f0, %f2
fbgt_cont.18947:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10195
	sw	%v0, 0(%k1)
	flw	%f1, 2(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 1(%sp)
	fblt	%f2, %f1, fbgt_else.18976
	fblt	%f2, %f0, fbgt_else.18978
	fsub	%f2, %f2, %f0
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18980
	fblt	%f2, %f0, fbgt_else.18982
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18984
	fblt	%f2, %f0, fbgt_else.18986
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
	j	fbgt_cont.18987
fbgt_else.18986:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.18987:
	j	fbgt_cont.18985
fbgt_else.18984:
	fmov	%f0, %f2
fbgt_cont.18985:
	j	fbgt_cont.18983
fbgt_else.18982:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18988
	fblt	%f2, %f0, fbgt_else.18990
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
	j	fbgt_cont.18991
fbgt_else.18990:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.18991:
	j	fbgt_cont.18989
fbgt_else.18988:
	fmov	%f0, %f2
fbgt_cont.18989:
fbgt_cont.18983:
	j	fbgt_cont.18981
fbgt_else.18980:
	fmov	%f0, %f2
fbgt_cont.18981:
	j	fbgt_cont.18979
fbgt_else.18978:
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18992
	fblt	%f2, %f0, fbgt_else.18994
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.18996
	fblt	%f2, %f0, fbgt_else.18998
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
	j	fbgt_cont.18999
fbgt_else.18998:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.18999:
	j	fbgt_cont.18997
fbgt_else.18996:
	fmov	%f0, %f2
fbgt_cont.18997:
	j	fbgt_cont.18995
fbgt_else.18994:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19000
	fblt	%f2, %f0, fbgt_else.19002
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
	j	fbgt_cont.19003
fbgt_else.19002:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.19003:
	j	fbgt_cont.19001
fbgt_else.19000:
	fmov	%f0, %f2
fbgt_cont.19001:
fbgt_cont.18995:
	j	fbgt_cont.18993
fbgt_else.18992:
	fmov	%f0, %f2
fbgt_cont.18993:
fbgt_cont.18979:
	j	fbgt_cont.18977
fbgt_else.18976:
	fmov	%f0, %f2
fbgt_cont.18977:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.19004
	addi	%v0, %zero, 0
	j	fbgt_cont.19005
fbgt_else.19004:
	addi	%v0, %zero, 1
fbgt_cont.19005:
	fblt	%f0, %f1, fbgt_else.19006
	fsub	%f0, %f0, %f1
	j	fbgt_cont.19007
fbgt_else.19006:
fbgt_cont.19007:
	flw	%f2, 473(%zero)
	fblt	%f0, %f2, fbgt_else.19008
	beqi	%v0, 0, bnei_else.19010
	addi	%v0, %zero, 0
	j	bnei_cont.19011
bnei_else.19010:
	addi	%v0, %zero, 1
bnei_cont.19011:
	j	fbgt_cont.19009
fbgt_else.19008:
fbgt_cont.19009:
	fblt	%f0, %f2, fbgt_else.19012
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19013
fbgt_else.19012:
fbgt_cont.19013:
	flw	%f1, 472(%zero)
	fblt	%f1, %f0, fbgt_else.19014
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 468(%zero)
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 466(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 465(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.19015
fbgt_else.19014:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 470(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 469(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.19015:
	beqi	%v0, 0, bnei_else.19016
	jr	%ra
bnei_else.19016:
	fneg	%f0, %f0
	jr	%ra
f.6155.10148:
	fblt	%f0, %f1, fbgt_else.19017
	flw	%f2, 491(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.19018
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
	j	f.6155.10148
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
fbgt_else.19017:
	fmov	%f0, %f1
	jr	%ra
g.6159.10152:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.19033
	fblt	%f0, %f1, fbgt_else.19034
	fsub	%f0, %f0, %f1
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19035
	fblt	%f0, %f1, fbgt_else.19036
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19037
	fblt	%f0, %f1, fbgt_else.19038
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19039
	fblt	%f0, %f1, fbgt_else.19040
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19040:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19039:
	jr	%ra
fbgt_else.19038:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19041
	fblt	%f0, %f1, fbgt_else.19042
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19042:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19041:
	jr	%ra
fbgt_else.19037:
	jr	%ra
fbgt_else.19036:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19043
	fblt	%f0, %f1, fbgt_else.19044
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19045
	fblt	%f0, %f1, fbgt_else.19046
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19046:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19045:
	jr	%ra
fbgt_else.19044:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19047
	fblt	%f0, %f1, fbgt_else.19048
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19048:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19047:
	jr	%ra
fbgt_else.19043:
	jr	%ra
fbgt_else.19035:
	jr	%ra
fbgt_else.19034:
	flw	%f3, 491(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19049
	fblt	%f0, %f1, fbgt_else.19050
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19051
	fblt	%f0, %f1, fbgt_else.19052
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19053
	fblt	%f0, %f1, fbgt_else.19054
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19054:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19053:
	jr	%ra
fbgt_else.19052:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19055
	fblt	%f0, %f1, fbgt_else.19056
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19056:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19055:
	jr	%ra
fbgt_else.19051:
	jr	%ra
fbgt_else.19050:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19057
	fblt	%f0, %f1, fbgt_else.19058
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19059
	fblt	%f0, %f1, fbgt_else.19060
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19060:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19059:
	jr	%ra
fbgt_else.19058:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.19061
	fblt	%f0, %f1, fbgt_else.19062
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19062:
	fdiv	%f1, %f1, %f3
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.19061:
	jr	%ra
fbgt_else.19057:
	jr	%ra
fbgt_else.19049:
	jr	%ra
fbgt_else.19033:
	jr	%ra
sin.2618:
	flw	%f1, 490(%zero)
	flw	%f2, 464(%zero)
	fblt	%f0, %f2, fbgt_else.19063
	addi	%v0, %zero, 1
	j	fbgt_cont.19064
fbgt_else.19063:
	addi	%v0, %zero, 0
fbgt_cont.19064:
	fabs	%f0, %f0
	flw	%f2, 489(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.19065
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.19067
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.19069
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.19071
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.19073
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.19075
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.19077
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.19079
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.19081
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.19083
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.19085
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.19087
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.19089
	flw	%f3, 476(%zero)
	fblt	%f0, %f3, fbgt_else.19091
	flw	%f3, 475(%zero)
	fblt	%f0, %f3, fbgt_else.19093
	flw	%f3, 474(%zero)
	fmov	%f1, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	f.6155.10148
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	fbgt_cont.19094
fbgt_else.19093:
	fmov	%f0, %f3
fbgt_cont.19094:
	j	fbgt_cont.19092
fbgt_else.19091:
	fmov	%f0, %f3
fbgt_cont.19092:
	j	fbgt_cont.19090
fbgt_else.19089:
	fmov	%f0, %f3
fbgt_cont.19090:
	j	fbgt_cont.19088
fbgt_else.19087:
	fmov	%f0, %f3
fbgt_cont.19088:
	j	fbgt_cont.19086
fbgt_else.19085:
	fmov	%f0, %f3
fbgt_cont.19086:
	j	fbgt_cont.19084
fbgt_else.19083:
	fmov	%f0, %f3
fbgt_cont.19084:
	j	fbgt_cont.19082
fbgt_else.19081:
	fmov	%f0, %f3
fbgt_cont.19082:
	j	fbgt_cont.19080
fbgt_else.19079:
	fmov	%f0, %f3
fbgt_cont.19080:
	j	fbgt_cont.19078
fbgt_else.19077:
	fmov	%f0, %f3
fbgt_cont.19078:
	j	fbgt_cont.19076
fbgt_else.19075:
	fmov	%f0, %f3
fbgt_cont.19076:
	j	fbgt_cont.19074
fbgt_else.19073:
	fmov	%f0, %f3
fbgt_cont.19074:
	j	fbgt_cont.19072
fbgt_else.19071:
	fmov	%f0, %f3
fbgt_cont.19072:
	j	fbgt_cont.19070
fbgt_else.19069:
	fmov	%f0, %f3
fbgt_cont.19070:
	j	fbgt_cont.19068
fbgt_else.19067:
	fmov	%f0, %f3
fbgt_cont.19068:
	j	fbgt_cont.19066
fbgt_else.19065:
	fmov	%f0, %f2
fbgt_cont.19066:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10152
	sw	%v0, 0(%k1)
	flw	%f1, 3(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 2(%sp)
	fblt	%f2, %f1, fbgt_else.19095
	fblt	%f2, %f0, fbgt_else.19097
	fsub	%f2, %f2, %f0
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19099
	fblt	%f2, %f0, fbgt_else.19101
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19103
	fblt	%f2, %f0, fbgt_else.19105
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
	j	fbgt_cont.19106
fbgt_else.19105:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.19106:
	j	fbgt_cont.19104
fbgt_else.19103:
	fmov	%f0, %f2
fbgt_cont.19104:
	j	fbgt_cont.19102
fbgt_else.19101:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19107
	fblt	%f2, %f0, fbgt_else.19109
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
	j	fbgt_cont.19110
fbgt_else.19109:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.19110:
	j	fbgt_cont.19108
fbgt_else.19107:
	fmov	%f0, %f2
fbgt_cont.19108:
fbgt_cont.19102:
	j	fbgt_cont.19100
fbgt_else.19099:
	fmov	%f0, %f2
fbgt_cont.19100:
	j	fbgt_cont.19098
fbgt_else.19097:
	flw	%f3, 491(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19111
	fblt	%f2, %f0, fbgt_else.19113
	fsub	%f2, %f2, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19115
	fblt	%f2, %f0, fbgt_else.19117
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
	j	fbgt_cont.19118
fbgt_else.19117:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.19118:
	j	fbgt_cont.19116
fbgt_else.19115:
	fmov	%f0, %f2
fbgt_cont.19116:
	j	fbgt_cont.19114
fbgt_else.19113:
	fdiv	%f0, %f0, %f3
	fblt	%f2, %f1, fbgt_else.19119
	fblt	%f2, %f0, fbgt_else.19121
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
	j	fbgt_cont.19122
fbgt_else.19121:
	fdiv	%f1, %f0, %f3
	fmov	%f0, %f2
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
fbgt_cont.19122:
	j	fbgt_cont.19120
fbgt_else.19119:
	fmov	%f0, %f2
fbgt_cont.19120:
fbgt_cont.19114:
	j	fbgt_cont.19112
fbgt_else.19111:
	fmov	%f0, %f2
fbgt_cont.19112:
fbgt_cont.19098:
	j	fbgt_cont.19096
fbgt_else.19095:
	fmov	%f0, %f2
fbgt_cont.19096:
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.19123
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.19125
	addi	%v0, %zero, 0
	j	bnei_cont.19126
bnei_else.19125:
	addi	%v0, %zero, 1
bnei_cont.19126:
	j	fbgt_cont.19124
fbgt_else.19123:
	lw	%v0, 0(%sp)
fbgt_cont.19124:
	fblt	%f0, %f1, fbgt_else.19127
	fsub	%f0, %f0, %f1
	j	fbgt_cont.19128
fbgt_else.19127:
fbgt_cont.19128:
	flw	%f2, 473(%zero)
	fblt	%f0, %f2, fbgt_else.19129
	fsub	%f0, %f1, %f0
	j	fbgt_cont.19130
fbgt_else.19129:
fbgt_cont.19130:
	flw	%f1, 472(%zero)
	fblt	%f1, %f0, fbgt_else.19131
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 470(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 469(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.19132
fbgt_else.19131:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 468(%zero)
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 466(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 465(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.19132:
	beqi	%v0, 0, bnei_else.19133
	jr	%ra
bnei_else.19133:
	fneg	%f0, %f0
	jr	%ra
print_int_sub1.2622:
	blti	%v0, 10, bgti_else.19134
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
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
	j	print_int_sub1.2622
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
bgti_else.19134:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2625:
	blti	%v0, 10, bgti_else.19142
	addi	%v0, %v0, -10
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
	j	print_int_sub2.2625
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
bgti_else.19142:
	jr	%ra
print_int.2627:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.19158
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.19160
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19162
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19164
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19166
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19168
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19170
	addi	%v1, %v1, -10
	addi	%a0, %zero, 7
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.19171
bgti_else.19170:
	addi	%v0, %zero, 6
bgti_cont.19171:
	j	bgti_cont.19169
bgti_else.19168:
	addi	%v0, %zero, 5
bgti_cont.19169:
	j	bgti_cont.19167
bgti_else.19166:
	addi	%v0, %zero, 4
bgti_cont.19167:
	j	bgti_cont.19165
bgti_else.19164:
	addi	%v0, %zero, 3
bgti_cont.19165:
	j	bgti_cont.19163
bgti_else.19162:
	addi	%v0, %zero, 2
bgti_cont.19163:
	j	bgti_cont.19161
bgti_else.19160:
	addi	%v0, %zero, 1
bgti_cont.19161:
	j	bgti_cont.19159
bgti_else.19158:
	addi	%v0, %zero, 0
bgti_cont.19159:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.19172
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19174
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19176
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19178
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19180
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19182
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19184
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19186
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19188
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19190
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19192
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19194
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19196
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19198
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19200
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2625
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.19201
bgti_else.19200:
	add	%v0, %zero, %v1
bgti_cont.19201:
	j	bgti_cont.19199
bgti_else.19198:
	add	%v0, %zero, %v1
bgti_cont.19199:
	j	bgti_cont.19197
bgti_else.19196:
	add	%v0, %zero, %v1
bgti_cont.19197:
	j	bgti_cont.19195
bgti_else.19194:
	add	%v0, %zero, %v1
bgti_cont.19195:
	j	bgti_cont.19193
bgti_else.19192:
	add	%v0, %zero, %v1
bgti_cont.19193:
	j	bgti_cont.19191
bgti_else.19190:
	add	%v0, %zero, %v1
bgti_cont.19191:
	j	bgti_cont.19189
bgti_else.19188:
	add	%v0, %zero, %v1
bgti_cont.19189:
	j	bgti_cont.19187
bgti_else.19186:
	add	%v0, %zero, %v1
bgti_cont.19187:
	j	bgti_cont.19185
bgti_else.19184:
	add	%v0, %zero, %v1
bgti_cont.19185:
	j	bgti_cont.19183
bgti_else.19182:
	add	%v0, %zero, %v1
bgti_cont.19183:
	j	bgti_cont.19181
bgti_else.19180:
	add	%v0, %zero, %v1
bgti_cont.19181:
	j	bgti_cont.19179
bgti_else.19178:
	add	%v0, %zero, %v1
bgti_cont.19179:
	j	bgti_cont.19177
bgti_else.19176:
	add	%v0, %zero, %v1
bgti_cont.19177:
	j	bgti_cont.19175
bgti_else.19174:
	add	%v0, %zero, %v1
bgti_cont.19175:
	j	bgti_cont.19173
bgti_else.19172:
	add	%v0, %zero, %v1
bgti_cont.19173:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.19202
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.19202:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.19203
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.19205
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19207
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19209
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19211
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19213
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.19215
	addi	%a0, %a0, -10
	addi	%a1, %zero, 7
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2622
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.19216
bgti_else.19215:
	addi	%v0, %zero, 6
bgti_cont.19216:
	j	bgti_cont.19214
bgti_else.19213:
	addi	%v0, %zero, 5
bgti_cont.19214:
	j	bgti_cont.19212
bgti_else.19211:
	addi	%v0, %zero, 4
bgti_cont.19212:
	j	bgti_cont.19210
bgti_else.19209:
	addi	%v0, %zero, 3
bgti_cont.19210:
	j	bgti_cont.19208
bgti_else.19207:
	addi	%v0, %zero, 2
bgti_cont.19208:
	j	bgti_cont.19206
bgti_else.19205:
	addi	%v0, %zero, 1
bgti_cont.19206:
	j	bgti_cont.19204
bgti_else.19203:
	addi	%v0, %zero, 0
bgti_cont.19204:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.19217
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19219
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19221
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19223
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19225
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19227
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19229
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19231
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19233
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19235
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19237
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19239
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19241
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19243
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19245
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2625
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.19246
bgti_else.19245:
	add	%v0, %zero, %v1
bgti_cont.19246:
	j	bgti_cont.19244
bgti_else.19243:
	add	%v0, %zero, %v1
bgti_cont.19244:
	j	bgti_cont.19242
bgti_else.19241:
	add	%v0, %zero, %v1
bgti_cont.19242:
	j	bgti_cont.19240
bgti_else.19239:
	add	%v0, %zero, %v1
bgti_cont.19240:
	j	bgti_cont.19238
bgti_else.19237:
	add	%v0, %zero, %v1
bgti_cont.19238:
	j	bgti_cont.19236
bgti_else.19235:
	add	%v0, %zero, %v1
bgti_cont.19236:
	j	bgti_cont.19234
bgti_else.19233:
	add	%v0, %zero, %v1
bgti_cont.19234:
	j	bgti_cont.19232
bgti_else.19231:
	add	%v0, %zero, %v1
bgti_cont.19232:
	j	bgti_cont.19230
bgti_else.19229:
	add	%v0, %zero, %v1
bgti_cont.19230:
	j	bgti_cont.19228
bgti_else.19227:
	add	%v0, %zero, %v1
bgti_cont.19228:
	j	bgti_cont.19226
bgti_else.19225:
	add	%v0, %zero, %v1
bgti_cont.19226:
	j	bgti_cont.19224
bgti_else.19223:
	add	%v0, %zero, %v1
bgti_cont.19224:
	j	bgti_cont.19222
bgti_else.19221:
	add	%v0, %zero, %v1
bgti_cont.19222:
	j	bgti_cont.19220
bgti_else.19219:
	add	%v0, %zero, %v1
bgti_cont.19220:
	j	bgti_cont.19218
bgti_else.19217:
	add	%v0, %zero, %v1
bgti_cont.19218:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.19247
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.19247:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.19248
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19250
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19252
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19254
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19256
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19258
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19260
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19262
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19264
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19266
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19268
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19270
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19272
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19274
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.19276
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.19277
bgti_else.19276:
	add	%v0, %zero, %v1
bgti_cont.19277:
	j	bgti_cont.19275
bgti_else.19274:
	add	%v0, %zero, %v1
bgti_cont.19275:
	j	bgti_cont.19273
bgti_else.19272:
	add	%v0, %zero, %v1
bgti_cont.19273:
	j	bgti_cont.19271
bgti_else.19270:
	add	%v0, %zero, %v1
bgti_cont.19271:
	j	bgti_cont.19269
bgti_else.19268:
	add	%v0, %zero, %v1
bgti_cont.19269:
	j	bgti_cont.19267
bgti_else.19266:
	add	%v0, %zero, %v1
bgti_cont.19267:
	j	bgti_cont.19265
bgti_else.19264:
	add	%v0, %zero, %v1
bgti_cont.19265:
	j	bgti_cont.19263
bgti_else.19262:
	add	%v0, %zero, %v1
bgti_cont.19263:
	j	bgti_cont.19261
bgti_else.19260:
	add	%v0, %zero, %v1
bgti_cont.19261:
	j	bgti_cont.19259
bgti_else.19258:
	add	%v0, %zero, %v1
bgti_cont.19259:
	j	bgti_cont.19257
bgti_else.19256:
	add	%v0, %zero, %v1
bgti_cont.19257:
	j	bgti_cont.19255
bgti_else.19254:
	add	%v0, %zero, %v1
bgti_cont.19255:
	j	bgti_cont.19253
bgti_else.19252:
	add	%v0, %zero, %v1
bgti_cont.19253:
	j	bgti_cont.19251
bgti_else.19250:
	add	%v0, %zero, %v1
bgti_cont.19251:
	j	bgti_cont.19249
bgti_else.19248:
	add	%v0, %zero, %v1
bgti_cont.19249:
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
	flw	%f4, 464(%zero)
	fbne	%f1, %f4, fbeq_else.19278
	addi	%a0, %zero, 1
	j	fbeq_cont.19279
fbeq_else.19278:
	addi	%a0, %zero, 0
fbeq_cont.19279:
	beqi	%a0, 0, bnei_else.19280
	flw	%f1, 468(%zero)
	j	bnei_cont.19281
bnei_else.19280:
	beqi	%v1, 0, bnei_else.19282
	flw	%f4, 463(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.19283
bnei_else.19282:
	flw	%f4, 468(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.19283:
bnei_cont.19281:
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
	addi	%v0, %zero, 72
	fsw	%f0, 0(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 72
	fsw	%f0, 1(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 72
	fsw	%f0, 2(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	flw	%f1, 462(%zero)
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
	flw	%f3, 461(%zero)
	fmul	%f2, %f2, %f3
	addi	%v0, %zero, 171
	fsw	%f2, 0(%v0)
	flw	%f2, 460(%zero)
	flw	%f4, 3(%sp)
	fmul	%f2, %f4, %f2
	addi	%v0, %zero, 171
	fsw	%f2, 1(%v0)
	flw	%f2, 5(%sp)
	fmul	%f5, %f1, %f2
	fmul	%f3, %f5, %f3
	addi	%v0, %zero, 171
	fsw	%f3, 2(%v0)
	addi	%v0, %zero, 165
	fsw	%f2, 0(%v0)
	flw	%f3, 464(%zero)
	addi	%v0, %zero, 165
	fsw	%f3, 1(%v0)
	fneg	%f3, %f0
	addi	%v0, %zero, 165
	fsw	%f3, 2(%v0)
	fneg	%f3, %f4
	fmul	%f0, %f3, %f0
	addi	%v0, %zero, 168
	fsw	%f0, 0(%v0)
	fneg	%f0, %f1
	addi	%v0, %zero, 168
	fsw	%f0, 1(%v0)
	fneg	%f0, %f4
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 168
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 72
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 171
	flw	%f1, 0(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 75
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 72
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 171
	flw	%f1, 1(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 75
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 72
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 171
	flw	%f1, 2(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 75
	fsw	%f0, 2(%v0)
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
	flw	%f12, 491(%zero)
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
	beqi	%v0, -1, bnei_else.19287
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
	flw	%f0, 464(%zero)
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
	fblt	%f0, %f1, fbgt_else.19288
	addi	%v0, %zero, 0
	j	fbgt_cont.19289
fbgt_else.19288:
	addi	%v0, %zero, 1
fbgt_cont.19289:
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
	beqi	%v1, 0, bnei_else.19290
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 462(%zero)
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
	j	bnei_cont.19291
bnei_else.19290:
bnei_cont.19291:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.19292
	lw	%a0, 10(%sp)
	j	bnei_cont.19293
bnei_else.19292:
	addi	%a0, %zero, 1
bnei_cont.19293:
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
	beqi	%a2, 3, bnei_else.19294
	beqi	%a2, 2, bnei_else.19296
	j	bnei_cont.19297
bnei_else.19296:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.19298
	addi	%v1, %zero, 0
	j	bnei_cont.19299
bnei_else.19298:
	addi	%v1, %zero, 1
bnei_cont.19299:
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
bnei_cont.19297:
	j	bnei_cont.19295
bnei_else.19294:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.19300
	addi	%v1, %zero, 1
	j	fbeq_cont.19301
fbeq_else.19300:
	addi	%v1, %zero, 0
fbeq_cont.19301:
	beqi	%v1, 0, bnei_else.19302
	fmov	%f0, %f1
	j	bnei_cont.19303
bnei_else.19302:
	fbne	%f0, %f1, fbeq_else.19304
	addi	%v1, %zero, 1
	j	fbeq_cont.19305
fbeq_else.19304:
	addi	%v1, %zero, 0
fbeq_cont.19305:
	beqi	%v1, 0, bnei_else.19306
	fmov	%f2, %f1
	j	bnei_cont.19307
bnei_else.19306:
	fblt	%f1, %f0, fbgt_else.19308
	addi	%v1, %zero, 0
	j	fbgt_cont.19309
fbgt_else.19308:
	addi	%v1, %zero, 1
fbgt_cont.19309:
	beqi	%v1, 0, bnei_else.19310
	flw	%f2, 468(%zero)
	j	bnei_cont.19311
bnei_else.19310:
	flw	%f2, 463(%zero)
bnei_cont.19311:
bnei_cont.19307:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.19303:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.19312
	addi	%v1, %zero, 1
	j	fbeq_cont.19313
fbeq_else.19312:
	addi	%v1, %zero, 0
fbeq_cont.19313:
	beqi	%v1, 0, bnei_else.19314
	fmov	%f0, %f1
	j	bnei_cont.19315
bnei_else.19314:
	fbne	%f0, %f1, fbeq_else.19316
	addi	%v1, %zero, 1
	j	fbeq_cont.19317
fbeq_else.19316:
	addi	%v1, %zero, 0
fbeq_cont.19317:
	beqi	%v1, 0, bnei_else.19318
	fmov	%f2, %f1
	j	bnei_cont.19319
bnei_else.19318:
	fblt	%f1, %f0, fbgt_else.19320
	addi	%v1, %zero, 0
	j	fbgt_cont.19321
fbgt_else.19320:
	addi	%v1, %zero, 1
fbgt_cont.19321:
	beqi	%v1, 0, bnei_else.19322
	flw	%f2, 468(%zero)
	j	bnei_cont.19323
bnei_else.19322:
	flw	%f2, 463(%zero)
bnei_cont.19323:
bnei_cont.19319:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.19315:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.19324
	addi	%v1, %zero, 1
	j	fbeq_cont.19325
fbeq_else.19324:
	addi	%v1, %zero, 0
fbeq_cont.19325:
	beqi	%v1, 0, bnei_else.19326
	fmov	%f0, %f1
	j	bnei_cont.19327
bnei_else.19326:
	fbne	%f0, %f1, fbeq_else.19328
	addi	%v1, %zero, 1
	j	fbeq_cont.19329
fbeq_else.19328:
	addi	%v1, %zero, 0
fbeq_cont.19329:
	beqi	%v1, 0, bnei_else.19330
	j	bnei_cont.19331
bnei_else.19330:
	fblt	%f1, %f0, fbgt_else.19332
	addi	%v1, %zero, 0
	j	fbgt_cont.19333
fbgt_else.19332:
	addi	%v1, %zero, 1
fbgt_cont.19333:
	beqi	%v1, 0, bnei_else.19334
	flw	%f1, 468(%zero)
	j	bnei_cont.19335
bnei_else.19334:
	flw	%f1, 463(%zero)
bnei_cont.19335:
bnei_cont.19331:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.19327:
	fsw	%f0, 2(%a0)
bnei_cont.19295:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.19336
	lw	%v0, 7(%sp)
	lw	%v1, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2760
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.19337
bnei_else.19336:
bnei_cont.19337:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19287:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2765:
	blti	%v0, 60, bgti_else.19338
	jr	%ra
bgti_else.19338:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2763
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.19340
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19341
	jr	%ra
bgti_else.19341:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2763
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.19343
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19344
	jr	%ra
bgti_else.19344:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2763
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.19346
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19347
	jr	%ra
bgti_else.19347:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2763
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.19349
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19350
	jr	%ra
bgti_else.19350:
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_nth_object.2763
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.19352
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19353
	jr	%ra
bgti_else.19353:
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_nth_object.2763
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.19355
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19356
	jr	%ra
bgti_else.19356:
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	read_nth_object.2763
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.19358
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.19359
	jr	%ra
bgti_else.19359:
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	read_nth_object.2763
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.19361
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	j	read_object.2765
bnei_else.19361:
	addi	%v0, %zero, 0
	lw	%v1, 7(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.19358:
	addi	%v0, %zero, 0
	lw	%v1, 6(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.19355:
	addi	%v0, %zero, 0
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.19352:
	addi	%v0, %zero, 0
	lw	%v1, 4(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.19349:
	addi	%v0, %zero, 0
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.19346:
	addi	%v0, %zero, 0
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.19343:
	addi	%v0, %zero, 0
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
bnei_else.19340:
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
read_net_item.2769:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.19370
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
	beqi	%v0, -1, bnei_else.19371
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.19373
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.19375
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
	j	bnei_cont.19376
bnei_else.19375:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19376:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19374
bnei_else.19373:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19374:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.19372
bnei_else.19371:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.19372:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.19370:
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
	beqi	%v0, -1, bnei_else.19377
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.19379
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.19381
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
	j	bnei_cont.19382
bnei_else.19381:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19382:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19380
bnei_else.19379:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19380:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.19378
bnei_else.19377:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.19378:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.19383
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
	beqi	%v0, -1, bnei_else.19384
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.19386
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
	j	bnei_cont.19387
bnei_else.19386:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19387:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.19385
bnei_else.19384:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.19385:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.19388
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
	j	bnei_cont.19389
bnei_else.19388:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.19389:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.19383:
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
	beqi	%v0, -1, bnei_else.19390
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.19392
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.19394
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
	j	bnei_cont.19395
bnei_else.19394:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19395:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.19393
bnei_else.19392:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19393:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19391
bnei_else.19390:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.19391:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19396
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
	beqi	%v0, -1, bnei_else.19397
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.19399
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
	j	bnei_cont.19400
bnei_else.19399:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19400:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19398
bnei_else.19397:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.19398:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19401
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
	beqi	%v0, -1, bnei_else.19402
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
	j	bnei_cont.19403
bnei_else.19402:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.19403:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.19404
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
	beqi	%v1, -1, bnei_else.19405
	addi	%v1, %zero, 83
	lw	%a0, 12(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2773
bnei_else.19405:
	jr	%ra
bnei_else.19404:
	jr	%ra
bnei_else.19401:
	jr	%ra
bnei_else.19396:
	jr	%ra
solver_rect_surface.2777:
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	flw	%f4, 464(%zero)
	fbne	%f3, %f4, fbeq_else.19410
	addi	%a3, %zero, 1
	j	fbeq_cont.19411
fbeq_else.19410:
	addi	%a3, %zero, 0
fbeq_cont.19411:
	beqi	%a3, 0, bnei_else.19412
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19412:
	lw	%a3, 4(%v0)
	lw	%v0, 6(%v0)
	fblt	%f3, %f4, fbgt_else.19413
	addi	%t0, %zero, 0
	j	fbgt_cont.19414
fbgt_else.19413:
	addi	%t0, %zero, 1
fbgt_cont.19414:
	beqi	%v0, 0, bnei_else.19415
	beqi	%t0, 0, bnei_else.19417
	addi	%v0, %zero, 0
	j	bnei_cont.19418
bnei_else.19417:
	addi	%v0, %zero, 1
bnei_cont.19418:
	j	bnei_cont.19416
bnei_else.19415:
	add	%v0, %zero, %t0
bnei_cont.19416:
	add	%at, %a3, %a0
	flw	%f4, 0(%at)
	beqi	%v0, 0, bnei_else.19419
	j	bnei_cont.19420
bnei_else.19419:
	fneg	%f4, %f4
bnei_cont.19420:
	fsub	%f0, %f4, %f0
	fdiv	%f0, %f0, %f3
	add	%at, %v1, %a1
	flw	%f3, 0(%at)
	fmul	%f3, %f0, %f3
	fadd	%f1, %f3, %f1
	fabs	%f1, %f1
	add	%at, %a3, %a1
	flw	%f3, 0(%at)
	fblt	%f1, %f3, fbgt_else.19421
	addi	%v0, %zero, 0
	j	fbgt_cont.19422
fbgt_else.19421:
	addi	%v0, %zero, 1
fbgt_cont.19422:
	beqi	%v0, 0, bnei_else.19423
	add	%at, %v1, %a2
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	add	%at, %a3, %a2
	flw	%f2, 0(%at)
	fblt	%f1, %f2, fbgt_else.19424
	addi	%v0, %zero, 0
	j	fbgt_cont.19425
fbgt_else.19424:
	addi	%v0, %zero, 1
fbgt_cont.19425:
	beqi	%v0, 0, bnei_else.19426
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19426:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19423:
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
	flw	%f5, 464(%zero)
	fblt	%f5, %f3, fbgt_else.19427
	addi	%v0, %zero, 0
	j	fbgt_cont.19428
fbgt_else.19427:
	addi	%v0, %zero, 1
fbgt_cont.19428:
	beqi	%v0, 0, bnei_else.19429
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19429:
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
	beqi	%v1, 0, bnei_else.19430
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
bnei_else.19430:
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
	beqi	%v1, 0, bnei_else.19431
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
	flw	%f1, 467(%zero)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f6, %f0
	jr	%ra
bnei_else.19431:
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
	flw	%f1, 464(%zero)
	fbne	%f0, %f1, fbeq_else.19432
	addi	%v0, %zero, 1
	j	fbeq_cont.19433
fbeq_else.19432:
	addi	%v0, %zero, 0
fbeq_cont.19433:
	beqi	%v0, 0, bnei_else.19434
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19434:
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
	beqi	%v1, 3, bnei_else.19435
	j	bnei_cont.19436
bnei_else.19435:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19436:
	flw	%f1, 9(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 8(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 7(%sp)
	fblt	%f2, %f0, fbgt_else.19437
	addi	%v1, %zero, 0
	j	fbgt_cont.19438
fbgt_else.19437:
	addi	%v1, %zero, 1
fbgt_cont.19438:
	beqi	%v1, 0, bnei_else.19439
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19440
	j	bnei_cont.19441
bnei_else.19440:
	fneg	%f0, %f0
bnei_cont.19441:
	fsub	%f0, %f0, %f1
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19439:
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
	beqi	%a0, 1, bnei_else.19442
	beqi	%a0, 2, bnei_else.19443
	j	solver_second.2811
bnei_else.19443:
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
	flw	%f5, 464(%zero)
	fblt	%f5, %f3, fbgt_else.19444
	addi	%v0, %zero, 0
	j	fbgt_cont.19445
fbgt_else.19444:
	addi	%v0, %zero, 1
fbgt_cont.19445:
	beqi	%v0, 0, bnei_else.19446
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19446:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19442:
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
	beqi	%v0, 0, bnei_else.19447
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19447:
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
	beqi	%v0, 0, bnei_else.19448
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.19448:
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
	beqi	%v0, 0, bnei_else.19449
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.19449:
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
	fblt	%f6, %f7, fbgt_else.19450
	addi	%a1, %zero, 0
	j	fbgt_cont.19451
fbgt_else.19450:
	addi	%a1, %zero, 1
fbgt_cont.19451:
	beqi	%a1, 0, bnei_else.19452
	flw	%f6, 2(%v1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%a1, 4(%v0)
	flw	%f7, 2(%a1)
	fblt	%f6, %f7, fbgt_else.19454
	addi	%a1, %zero, 0
	j	fbgt_cont.19455
fbgt_else.19454:
	addi	%a1, %zero, 1
fbgt_cont.19455:
	beqi	%a1, 0, bnei_else.19456
	flw	%f6, 464(%zero)
	fbne	%f4, %f6, fbeq_else.19458
	addi	%a1, %zero, 1
	j	fbeq_cont.19459
fbeq_else.19458:
	addi	%a1, %zero, 0
fbeq_cont.19459:
	beqi	%a1, 0, bnei_else.19460
	addi	%a1, %zero, 0
	j	bnei_cont.19461
bnei_else.19460:
	addi	%a1, %zero, 1
bnei_cont.19461:
	j	bnei_cont.19457
bnei_else.19456:
	addi	%a1, %zero, 0
bnei_cont.19457:
	j	bnei_cont.19453
bnei_else.19452:
	addi	%a1, %zero, 0
bnei_cont.19453:
	beqi	%a1, 0, bnei_else.19462
	addi	%v0, %zero, 135
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19462:
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
	fblt	%f7, %f8, fbgt_else.19463
	addi	%a1, %zero, 0
	j	fbgt_cont.19464
fbgt_else.19463:
	addi	%a1, %zero, 1
fbgt_cont.19464:
	beqi	%a1, 0, bnei_else.19465
	flw	%f7, 2(%v1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fblt	%f7, %f8, fbgt_else.19467
	addi	%v1, %zero, 0
	j	fbgt_cont.19468
fbgt_else.19467:
	addi	%v1, %zero, 1
fbgt_cont.19468:
	beqi	%v1, 0, bnei_else.19469
	flw	%f7, 464(%zero)
	fbne	%f4, %f7, fbeq_else.19471
	addi	%v1, %zero, 1
	j	fbeq_cont.19472
fbeq_else.19471:
	addi	%v1, %zero, 0
fbeq_cont.19472:
	beqi	%v1, 0, bnei_else.19473
	addi	%v1, %zero, 0
	j	bnei_cont.19474
bnei_else.19473:
	addi	%v1, %zero, 1
bnei_cont.19474:
	j	bnei_cont.19470
bnei_else.19469:
	addi	%v1, %zero, 0
bnei_cont.19470:
	j	bnei_cont.19466
bnei_else.19465:
	addi	%v1, %zero, 0
bnei_cont.19466:
	beqi	%v1, 0, bnei_else.19475
	addi	%v0, %zero, 135
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.19475:
	flw	%f3, 4(%a0)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a0)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f4, 0(%v1)
	fblt	%f0, %f4, fbgt_else.19476
	addi	%v1, %zero, 0
	j	fbgt_cont.19477
fbgt_else.19476:
	addi	%v1, %zero, 1
fbgt_cont.19477:
	beqi	%v1, 0, bnei_else.19478
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%v0, 4(%v0)
	flw	%f1, 1(%v0)
	fblt	%f0, %f1, fbgt_else.19480
	addi	%v0, %zero, 0
	j	fbgt_cont.19481
fbgt_else.19480:
	addi	%v0, %zero, 1
fbgt_cont.19481:
	beqi	%v0, 0, bnei_else.19482
	flw	%f0, 464(%zero)
	fbne	%f3, %f0, fbeq_else.19484
	addi	%v0, %zero, 1
	j	fbeq_cont.19485
fbeq_else.19484:
	addi	%v0, %zero, 0
fbeq_cont.19485:
	beqi	%v0, 0, bnei_else.19486
	addi	%v0, %zero, 0
	j	bnei_cont.19487
bnei_else.19486:
	addi	%v0, %zero, 1
bnei_cont.19487:
	j	bnei_cont.19483
bnei_else.19482:
	addi	%v0, %zero, 0
bnei_cont.19483:
	j	bnei_cont.19479
bnei_else.19478:
	addi	%v0, %zero, 0
bnei_cont.19479:
	beqi	%v0, 0, bnei_else.19488
	addi	%v0, %zero, 135
	fsw	%f2, 0(%v0)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.19488:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2834:
	flw	%f3, 0(%v1)
	flw	%f4, 464(%zero)
	fbne	%f3, %f4, fbeq_else.19489
	addi	%a0, %zero, 1
	j	fbeq_cont.19490
fbeq_else.19489:
	addi	%a0, %zero, 0
fbeq_cont.19490:
	beqi	%a0, 0, bnei_else.19491
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19491:
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
	beqi	%v1, 3, bnei_else.19492
	j	bnei_cont.19493
bnei_else.19492:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19493:
	flw	%f1, 3(%sp)
	fmul	%f2, %f1, %f1
	flw	%f3, 2(%sp)
	fmul	%f0, %f3, %f0
	fsub	%f0, %f2, %f0
	flw	%f2, 1(%sp)
	fblt	%f2, %f0, fbgt_else.19494
	addi	%v1, %zero, 0
	j	fbgt_cont.19495
fbgt_else.19494:
	addi	%v1, %zero, 1
fbgt_cont.19495:
	beqi	%v1, 0, bnei_else.19496
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19497
	fsqrt	%f0, %f0
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	j	bnei_cont.19498
bnei_else.19497:
	fsqrt	%f0, %f0
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
bnei_cont.19498:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19496:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2851:
	flw	%f3, 0(%v1)
	flw	%f4, 464(%zero)
	fbne	%f3, %f4, fbeq_else.19499
	addi	%a1, %zero, 1
	j	fbeq_cont.19500
fbeq_else.19499:
	addi	%a1, %zero, 0
fbeq_cont.19500:
	beqi	%a1, 0, bnei_else.19501
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19501:
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
	fblt	%f4, %f1, fbgt_else.19502
	addi	%a0, %zero, 0
	j	fbgt_cont.19503
fbgt_else.19502:
	addi	%a0, %zero, 1
fbgt_cont.19503:
	beqi	%a0, 0, bnei_else.19504
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19505
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
	j	bnei_cont.19506
bnei_else.19505:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v1)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 0(%v0)
bnei_cont.19506:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19504:
	addi	%v0, %zero, 0
	jr	%ra
setup_rect_table.2861:
	addi	%a0, %zero, 6
	flw	%f0, 464(%zero)
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
	fbne	%f0, %f1, fbeq_else.19507
	addi	%a0, %zero, 1
	j	fbeq_cont.19508
fbeq_else.19507:
	addi	%a0, %zero, 0
fbeq_cont.19508:
	beqi	%a0, 0, bnei_else.19509
	fsw	%f1, 1(%v0)
	j	bnei_cont.19510
bnei_else.19509:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.19511
	addi	%a2, %zero, 0
	j	fbgt_cont.19512
fbgt_else.19511:
	addi	%a2, %zero, 1
fbgt_cont.19512:
	beqi	%a1, 0, bnei_else.19513
	beqi	%a2, 0, bnei_else.19515
	addi	%a1, %zero, 0
	j	bnei_cont.19516
bnei_else.19515:
	addi	%a1, %zero, 1
bnei_cont.19516:
	j	bnei_cont.19514
bnei_else.19513:
	add	%a1, %zero, %a2
bnei_cont.19514:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.19517
	j	bnei_cont.19518
bnei_else.19517:
	fneg	%f2, %f2
bnei_cont.19518:
	fsw	%f2, 0(%v0)
	flw	%f2, 468(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.19510:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.19519
	addi	%a0, %zero, 1
	j	fbeq_cont.19520
fbeq_else.19519:
	addi	%a0, %zero, 0
fbeq_cont.19520:
	beqi	%a0, 0, bnei_else.19521
	fsw	%f1, 3(%v0)
	j	bnei_cont.19522
bnei_else.19521:
	lw	%a0, 0(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.19523
	addi	%a2, %zero, 0
	j	fbgt_cont.19524
fbgt_else.19523:
	addi	%a2, %zero, 1
fbgt_cont.19524:
	beqi	%a1, 0, bnei_else.19525
	beqi	%a2, 0, bnei_else.19527
	addi	%a1, %zero, 0
	j	bnei_cont.19528
bnei_else.19527:
	addi	%a1, %zero, 1
bnei_cont.19528:
	j	bnei_cont.19526
bnei_else.19525:
	add	%a1, %zero, %a2
bnei_cont.19526:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.19529
	j	bnei_cont.19530
bnei_else.19529:
	fneg	%f2, %f2
bnei_cont.19530:
	fsw	%f2, 2(%v0)
	flw	%f2, 468(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.19522:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.19531
	addi	%v1, %zero, 1
	j	fbeq_cont.19532
fbeq_else.19531:
	addi	%v1, %zero, 0
fbeq_cont.19532:
	beqi	%v1, 0, bnei_else.19533
	fsw	%f1, 5(%v0)
	j	bnei_cont.19534
bnei_else.19533:
	lw	%v1, 0(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.19535
	addi	%a1, %zero, 0
	j	fbgt_cont.19536
fbgt_else.19535:
	addi	%a1, %zero, 1
fbgt_cont.19536:
	beqi	%a0, 0, bnei_else.19537
	beqi	%a1, 0, bnei_else.19539
	addi	%a0, %zero, 0
	j	bnei_cont.19540
bnei_else.19539:
	addi	%a0, %zero, 1
bnei_cont.19540:
	j	bnei_cont.19538
bnei_else.19537:
	add	%a0, %zero, %a1
bnei_cont.19538:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.19541
	j	bnei_cont.19542
bnei_else.19541:
	fneg	%f1, %f1
bnei_cont.19542:
	fsw	%f1, 4(%v0)
	flw	%f1, 468(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.19534:
	jr	%ra
setup_surface_table.2864:
	addi	%a0, %zero, 4
	flw	%f0, 464(%zero)
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
	fblt	%f1, %f0, fbgt_else.19543
	addi	%v1, %zero, 0
	j	fbgt_cont.19544
fbgt_else.19543:
	addi	%v1, %zero, 1
fbgt_cont.19544:
	beqi	%v1, 0, bnei_else.19545
	flw	%f1, 463(%zero)
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
	j	bnei_cont.19546
bnei_else.19545:
	fsw	%f1, 0(%v0)
bnei_cont.19546:
	jr	%ra
setup_second_table.2867:
	addi	%a0, %zero, 5
	flw	%f0, 464(%zero)
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
	beqi	%a0, 0, bnei_else.19547
	lw	%a0, 9(%v0)
	flw	%f7, 1(%a0)
	fmul	%f7, %f6, %f7
	lw	%a0, 9(%v0)
	flw	%f8, 2(%a0)
	fmul	%f8, %f4, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 467(%zero)
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
	j	bnei_cont.19548
bnei_else.19547:
	fsw	%f1, 1(%v1)
	fsw	%f3, 2(%v1)
	fsw	%f5, 3(%v1)
bnei_cont.19548:
	flw	%f1, 0(%sp)
	fbne	%f0, %f1, fbeq_else.19549
	addi	%v0, %zero, 1
	j	fbeq_cont.19550
fbeq_else.19549:
	addi	%v0, %zero, 0
fbeq_cont.19550:
	beqi	%v0, 0, bnei_else.19551
	j	bnei_cont.19552
bnei_else.19551:
	flw	%f1, 468(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 4(%v1)
bnei_cont.19552:
	add	%v0, %zero, %v1
	jr	%ra
iter_setup_dirvec_constants.2870:
	blti	%v1, 0, bgti_else.19553
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.19554
	beqi	%a3, 2, bnei_else.19556
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
	j	bnei_cont.19557
bnei_else.19556:
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
bnei_cont.19557:
	j	bnei_cont.19555
bnei_else.19554:
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
bnei_cont.19555:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.19558
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.19559
	beqi	%a3, 2, bnei_else.19561
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
	j	bnei_cont.19562
bnei_else.19561:
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
bnei_cont.19562:
	j	bnei_cont.19560
bnei_else.19559:
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
bnei_cont.19560:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2870
bgti_else.19558:
	jr	%ra
bgti_else.19553:
	jr	%ra
setup_startp_constants.2875:
	blti	%v1, 0, bgti_else.19565
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
	beqi	%a2, 2, bnei_else.19566
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.19568
	j	bgt_cont.19569
bgt_else.19568:
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
	beqi	%v0, 3, bnei_else.19570
	j	bnei_cont.19571
bnei_else.19570:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19571:
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
bgt_cont.19569:
	j	bnei_cont.19567
bnei_else.19566:
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
bnei_cont.19567:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2875
bgti_else.19565:
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
	beqi	%v1, 1, bnei_else.19573
	beqi	%v1, 2, bnei_else.19574
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	quadratic.2798
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.19575
	j	bnei_cont.19576
bnei_else.19575:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19576:
	lw	%v0, 6(%v0)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.19577
	addi	%v1, %zero, 0
	j	fbgt_cont.19578
fbgt_else.19577:
	addi	%v1, %zero, 1
fbgt_cont.19578:
	beqi	%v0, 0, bnei_else.19579
	beqi	%v1, 0, bnei_else.19581
	addi	%v0, %zero, 0
	j	bnei_cont.19582
bnei_else.19581:
	addi	%v0, %zero, 1
bnei_cont.19582:
	j	bnei_cont.19580
bnei_else.19579:
	add	%v0, %zero, %v1
bnei_cont.19580:
	beqi	%v0, 0, bnei_else.19583
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19583:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19574:
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
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.19584
	addi	%v1, %zero, 0
	j	fbgt_cont.19585
fbgt_else.19584:
	addi	%v1, %zero, 1
fbgt_cont.19585:
	beqi	%v0, 0, bnei_else.19586
	beqi	%v1, 0, bnei_else.19588
	addi	%v0, %zero, 0
	j	bnei_cont.19589
bnei_else.19588:
	addi	%v0, %zero, 1
bnei_cont.19589:
	j	bnei_cont.19587
bnei_else.19586:
	add	%v0, %zero, %v1
bnei_cont.19587:
	beqi	%v0, 0, bnei_else.19590
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19590:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19573:
	fabs	%f0, %f0
	lw	%v1, 4(%v0)
	flw	%f3, 0(%v1)
	fblt	%f0, %f3, fbgt_else.19591
	addi	%v1, %zero, 0
	j	fbgt_cont.19592
fbgt_else.19591:
	addi	%v1, %zero, 1
fbgt_cont.19592:
	beqi	%v1, 0, bnei_else.19593
	fabs	%f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 1(%v1)
	fblt	%f0, %f1, fbgt_else.19595
	addi	%v1, %zero, 0
	j	fbgt_cont.19596
fbgt_else.19595:
	addi	%v1, %zero, 1
fbgt_cont.19596:
	beqi	%v1, 0, bnei_else.19597
	fabs	%f0, %f2
	lw	%v1, 4(%v0)
	flw	%f1, 2(%v1)
	fblt	%f0, %f1, fbgt_else.19599
	addi	%v1, %zero, 0
	j	fbgt_cont.19600
fbgt_else.19599:
	addi	%v1, %zero, 1
fbgt_cont.19600:
	j	bnei_cont.19598
bnei_else.19597:
	addi	%v1, %zero, 0
bnei_cont.19598:
	j	bnei_cont.19594
bnei_else.19593:
	addi	%v1, %zero, 0
bnei_cont.19594:
	beqi	%v1, 0, bnei_else.19601
	lw	%v0, 6(%v0)
	jr	%ra
bnei_else.19601:
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19602
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19602:
	addi	%v0, %zero, 1
	jr	%ra
check_all_inside.2900:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19603
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
	beqi	%a1, 1, bnei_else.19604
	beqi	%a1, 2, bnei_else.19606
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
	beqi	%v1, 3, bnei_else.19608
	j	bnei_cont.19609
bnei_else.19608:
	flw	%f1, 468(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.19609:
	lw	%v0, 6(%v0)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.19610
	addi	%v1, %zero, 0
	j	fbgt_cont.19611
fbgt_else.19610:
	addi	%v1, %zero, 1
fbgt_cont.19611:
	beqi	%v0, 0, bnei_else.19612
	beqi	%v1, 0, bnei_else.19614
	addi	%v0, %zero, 0
	j	bnei_cont.19615
bnei_else.19614:
	addi	%v0, %zero, 1
bnei_cont.19615:
	j	bnei_cont.19613
bnei_else.19612:
	add	%v0, %zero, %v1
bnei_cont.19613:
	beqi	%v0, 0, bnei_else.19616
	addi	%v0, %zero, 0
	j	bnei_cont.19617
bnei_else.19616:
	addi	%v0, %zero, 1
bnei_cont.19617:
	j	bnei_cont.19607
bnei_else.19606:
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
	flw	%f4, 464(%zero)
	fblt	%f3, %f4, fbgt_else.19618
	addi	%a1, %zero, 0
	j	fbgt_cont.19619
fbgt_else.19618:
	addi	%a1, %zero, 1
fbgt_cont.19619:
	beqi	%a0, 0, bnei_else.19620
	beqi	%a1, 0, bnei_else.19622
	addi	%a0, %zero, 0
	j	bnei_cont.19623
bnei_else.19622:
	addi	%a0, %zero, 1
bnei_cont.19623:
	j	bnei_cont.19621
bnei_else.19620:
	add	%a0, %zero, %a1
bnei_cont.19621:
	beqi	%a0, 0, bnei_else.19624
	addi	%v0, %zero, 0
	j	bnei_cont.19625
bnei_else.19624:
	addi	%v0, %zero, 1
bnei_cont.19625:
bnei_cont.19607:
	j	bnei_cont.19605
bnei_else.19604:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.19626
	addi	%a1, %zero, 0
	j	fbgt_cont.19627
fbgt_else.19626:
	addi	%a1, %zero, 1
fbgt_cont.19627:
	beqi	%a1, 0, bnei_else.19628
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.19630
	addi	%a1, %zero, 0
	j	fbgt_cont.19631
fbgt_else.19630:
	addi	%a1, %zero, 1
fbgt_cont.19631:
	beqi	%a1, 0, bnei_else.19632
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.19634
	addi	%a1, %zero, 0
	j	fbgt_cont.19635
fbgt_else.19634:
	addi	%a1, %zero, 1
fbgt_cont.19635:
	j	bnei_cont.19633
bnei_else.19632:
	addi	%a1, %zero, 0
bnei_cont.19633:
	j	bnei_cont.19629
bnei_else.19628:
	addi	%a1, %zero, 0
bnei_cont.19629:
	beqi	%a1, 0, bnei_else.19636
	lw	%a0, 6(%a0)
	add	%v0, %zero, %a0
	j	bnei_cont.19637
bnei_else.19636:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.19638
	addi	%v0, %zero, 0
	j	bnei_cont.19639
bnei_else.19638:
	addi	%v0, %zero, 1
bnei_cont.19639:
bnei_cont.19637:
bnei_cont.19605:
	beqi	%v0, 0, bnei_else.19640
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19640:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19641
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
	beqi	%v0, 0, bnei_else.19642
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19642:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2900
bnei_else.19641:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19603:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2906:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19643
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 138
	flw	%f0, 0(%a2)
	lw	%a2, 5(%a1)
	flw	%f1, 0(%a2)
	fsub	%f1, %f0, %f1
	addi	%a2, %zero, 1
	addi	%a3, %zero, 138
	flw	%f2, 1(%a3)
	lw	%a3, 5(%a1)
	flw	%f3, 1(%a3)
	fsub	%f3, %f2, %f3
	addi	%a3, %zero, 138
	flw	%f4, 2(%a3)
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
	beqi	%a3, 1, bnei_else.19644
	beqi	%a3, 2, bnei_else.19646
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
	j	bnei_cont.19647
bnei_else.19646:
	flw	%f6, 0(%a0)
	flw	%f7, 464(%zero)
	fblt	%f6, %f7, fbgt_else.19648
	addi	%a3, %zero, 0
	j	fbgt_cont.19649
fbgt_else.19648:
	addi	%a3, %zero, 1
fbgt_cont.19649:
	beqi	%a3, 0, bnei_else.19650
	flw	%f6, 1(%a0)
	fmul	%f1, %f6, %f1
	flw	%f6, 2(%a0)
	fmul	%f3, %f6, %f3
	fadd	%f1, %f1, %f3
	flw	%f3, 3(%a0)
	fmul	%f3, %f3, %f5
	fadd	%f1, %f1, %f3
	addi	%a0, %zero, 135
	fsw	%f1, 0(%a0)
	addi	%v0, %zero, 1
	j	bnei_cont.19651
bnei_else.19650:
	addi	%v0, %zero, 0
bnei_cont.19651:
bnei_cont.19647:
	j	bnei_cont.19645
bnei_else.19644:
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
bnei_cont.19645:
	addi	%v1, %zero, 135
	flw	%f0, 0(%v1)
	beqi	%v0, 0, bnei_else.19652
	flw	%f1, 459(%zero)
	fblt	%f0, %f1, fbgt_else.19654
	addi	%v0, %zero, 0
	j	fbgt_cont.19655
fbgt_else.19654:
	addi	%v0, %zero, 1
fbgt_cont.19655:
	j	bnei_cont.19653
bnei_else.19652:
	addi	%v0, %zero, 0
bnei_cont.19653:
	beqi	%v0, 0, bnei_else.19656
	flw	%f1, 458(%zero)
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	flw	%f2, 3(%sp)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	flw	%f3, 2(%sp)
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 78
	flw	%f3, 2(%v0)
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%sp)
	fadd	%f0, %f0, %f3
	lw	%v1, 4(%sp)
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.19657
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
	beqi	%v0, 0, bnei_else.19659
	addi	%v0, %zero, 0
	j	bnei_cont.19660
bnei_else.19659:
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
bnei_cont.19660:
	j	bnei_cont.19658
bnei_else.19657:
	addi	%v0, %zero, 1
bnei_cont.19658:
	beqi	%v0, 0, bnei_else.19661
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19661:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2906
bnei_else.19656:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19662
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	j	shadow_check_and_group.2906
bnei_else.19662:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19643:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2909:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19663
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
	beqi	%v0, 0, bnei_else.19664
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19664:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19665
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
	beqi	%v0, 0, bnei_else.19666
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19666:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19667
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
	beqi	%v0, 0, bnei_else.19668
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19668:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.19669
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
	beqi	%v0, 0, bnei_else.19670
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19670:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2909
bnei_else.19669:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19667:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19665:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.19663:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2912:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.19671
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.19672
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	addi	%t0, %zero, 138
	flw	%f0, 0(%t0)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	addi	%t0, %zero, 138
	flw	%f1, 1(%t0)
	lw	%t0, 5(%a3)
	flw	%f2, 1(%t0)
	fsub	%f1, %f1, %f2
	addi	%t0, %zero, 138
	flw	%f2, 2(%t0)
	lw	%t0, 5(%a3)
	flw	%f3, 2(%t0)
	fsub	%f2, %f2, %f3
	addi	%t0, %zero, 187
	add	%at, %t0, %a2
	lw	%a2, 0(%at)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.19674
	beqi	%t0, 2, bnei_else.19676
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast.2834
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19677
bnei_else.19676:
	flw	%f3, 0(%a2)
	flw	%f4, 464(%zero)
	fblt	%f3, %f4, fbgt_else.19678
	addi	%a3, %zero, 0
	j	fbgt_cont.19679
fbgt_else.19678:
	addi	%a3, %zero, 1
fbgt_cont.19679:
	beqi	%a3, 0, bnei_else.19680
	flw	%f3, 1(%a2)
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a2)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a2, %zero, 135
	fsw	%f0, 0(%a2)
	addi	%v0, %zero, 1
	j	bnei_cont.19681
bnei_else.19680:
	addi	%v0, %zero, 0
bnei_cont.19681:
bnei_cont.19677:
	j	bnei_cont.19675
bnei_else.19674:
	addi	%t0, %zero, 184
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19675:
	beqi	%v0, 0, bnei_else.19682
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f0, %f1, fbgt_else.19684
	addi	%v0, %zero, 0
	j	fbgt_cont.19685
fbgt_else.19684:
	addi	%v0, %zero, 1
fbgt_cont.19685:
	beqi	%v0, 0, bnei_else.19686
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19688
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
	beqi	%v0, 0, bnei_else.19690
	addi	%v0, %zero, 1
	j	bnei_cont.19691
bnei_else.19690:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19692
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
	beqi	%v0, 0, bnei_else.19694
	addi	%v0, %zero, 1
	j	bnei_cont.19695
bnei_else.19694:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19696
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
	beqi	%v0, 0, bnei_else.19698
	addi	%v0, %zero, 1
	j	bnei_cont.19699
bnei_else.19698:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19699:
	j	bnei_cont.19697
bnei_else.19696:
	addi	%v0, %zero, 0
bnei_cont.19697:
bnei_cont.19695:
	j	bnei_cont.19693
bnei_else.19692:
	addi	%v0, %zero, 0
bnei_cont.19693:
bnei_cont.19691:
	j	bnei_cont.19689
bnei_else.19688:
	addi	%v0, %zero, 0
bnei_cont.19689:
	beqi	%v0, 0, bnei_else.19700
	addi	%v0, %zero, 1
	j	bnei_cont.19701
bnei_else.19700:
	addi	%v0, %zero, 0
bnei_cont.19701:
	j	bnei_cont.19687
bnei_else.19686:
	addi	%v0, %zero, 0
bnei_cont.19687:
	j	bnei_cont.19683
bnei_else.19682:
	addi	%v0, %zero, 0
bnei_cont.19683:
	j	bnei_cont.19673
bnei_else.19672:
	addi	%v0, %zero, 1
bnei_cont.19673:
	beqi	%v0, 0, bnei_else.19702
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19703
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
	beqi	%v0, 0, bnei_else.19705
	addi	%v0, %zero, 1
	j	bnei_cont.19706
bnei_else.19705:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.19707
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
	beqi	%v0, 0, bnei_else.19709
	addi	%v0, %zero, 1
	j	bnei_cont.19710
bnei_else.19709:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.19711
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
	beqi	%v0, 0, bnei_else.19713
	addi	%v0, %zero, 1
	j	bnei_cont.19714
bnei_else.19713:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19714:
	j	bnei_cont.19712
bnei_else.19711:
	addi	%v0, %zero, 0
bnei_cont.19712:
bnei_cont.19710:
	j	bnei_cont.19708
bnei_else.19707:
	addi	%v0, %zero, 0
bnei_cont.19708:
bnei_cont.19706:
	j	bnei_cont.19704
bnei_else.19703:
	addi	%v0, %zero, 0
bnei_cont.19704:
	beqi	%v0, 0, bnei_else.19715
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.19715:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.19702:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.19671:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2915:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19716
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	addi	%a3, %zero, 0
	addi	%t0, %zero, 159
	flw	%f0, 0(%t0)
	lw	%t0, 5(%a2)
	flw	%f1, 0(%t0)
	fsub	%f1, %f0, %f1
	addi	%t0, %zero, 1
	addi	%t1, %zero, 159
	flw	%f2, 1(%t1)
	lw	%t1, 5(%a2)
	flw	%f3, 1(%t1)
	fsub	%f3, %f2, %f3
	addi	%t1, %zero, 2
	addi	%t2, %zero, 159
	flw	%f4, 2(%t2)
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
	beqi	%t2, 1, bnei_else.19717
	beqi	%t2, 2, bnei_else.19719
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
	j	bnei_cont.19720
bnei_else.19719:
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
bnei_cont.19720:
	j	bnei_cont.19718
bnei_else.19717:
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
	beqi	%v0, 0, bnei_else.19721
	addi	%v0, %zero, 1
	j	bnei_cont.19722
bnei_else.19721:
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
	beqi	%v0, 0, bnei_else.19723
	addi	%v0, %zero, 2
	j	bnei_cont.19724
bnei_else.19723:
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
	beqi	%v0, 0, bnei_else.19725
	addi	%v0, %zero, 3
	j	bnei_cont.19726
bnei_else.19725:
	addi	%v0, %zero, 0
bnei_cont.19726:
bnei_cont.19724:
bnei_cont.19722:
bnei_cont.19718:
	beqi	%v0, 0, bnei_else.19727
	addi	%v1, %zero, 135
	flw	%f0, 0(%v1)
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.19728
	addi	%v1, %zero, 0
	j	fbgt_cont.19729
fbgt_else.19728:
	addi	%v1, %zero, 1
fbgt_cont.19729:
	beqi	%v1, 0, bnei_else.19730
	addi	%v1, %zero, 137
	flw	%f1, 0(%v1)
	fblt	%f0, %f1, fbgt_else.19732
	addi	%v1, %zero, 0
	j	fbgt_cont.19733
fbgt_else.19732:
	addi	%v1, %zero, 1
fbgt_cont.19733:
	beqi	%v1, 0, bnei_else.19734
	flw	%f1, 458(%zero)
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
	beqi	%a1, -1, bnei_else.19736
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
	beqi	%v0, 0, bnei_else.19738
	addi	%v0, %zero, 0
	j	bnei_cont.19739
bnei_else.19738:
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
bnei_cont.19739:
	j	bnei_cont.19737
bnei_else.19736:
	addi	%v0, %zero, 1
bnei_cont.19737:
	beqi	%v0, 0, bnei_else.19740
	addi	%v0, %zero, 137
	flw	%f0, 18(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 17(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 16(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 15(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 141
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 136
	lw	%v1, 14(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19741
bnei_else.19740:
bnei_cont.19741:
	j	bnei_cont.19735
bnei_else.19734:
bnei_cont.19735:
	j	bnei_cont.19731
bnei_else.19730:
bnei_cont.19731:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2915
bnei_else.19727:
	lw	%v0, 8(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19742
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2915
bnei_else.19742:
	jr	%ra
bnei_else.19716:
	jr	%ra
solve_one_or_network.2919:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19745
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
	beqi	%a0, -1, bnei_else.19746
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
	beqi	%a0, -1, bnei_else.19747
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
	beqi	%a0, -1, bnei_else.19748
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
	beqi	%a0, -1, bnei_else.19749
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
	beqi	%a0, -1, bnei_else.19750
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
	beqi	%a0, -1, bnei_else.19751
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
	beqi	%a0, -1, bnei_else.19752
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
bnei_else.19745:
	jr	%ra
trace_or_matrix.2923:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.19761
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.19762
	addi	%t0, %zero, 12
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	addi	%t0, %zero, 159
	flw	%f0, 0(%t0)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	addi	%t0, %zero, 1
	addi	%t1, %zero, 159
	flw	%f1, 1(%t1)
	lw	%t1, 5(%a3)
	flw	%f2, 1(%t1)
	fsub	%f1, %f1, %f2
	addi	%t1, %zero, 2
	addi	%t2, %zero, 159
	flw	%f2, 2(%t2)
	lw	%t2, 5(%a3)
	flw	%f3, 2(%t2)
	fsub	%f2, %f2, %f3
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.19764
	beqi	%t2, 2, bnei_else.19766
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second.2811
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19767
bnei_else.19766:
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_surface.2792
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19767:
	j	bnei_cont.19765
bnei_else.19764:
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
	beqi	%v0, 0, bnei_else.19768
	addi	%v0, %zero, 1
	j	bnei_cont.19769
bnei_else.19768:
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
	beqi	%v0, 0, bnei_else.19770
	addi	%v0, %zero, 2
	j	bnei_cont.19771
bnei_else.19770:
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
	beqi	%v0, 0, bnei_else.19772
	addi	%v0, %zero, 3
	j	bnei_cont.19773
bnei_else.19772:
	addi	%v0, %zero, 0
bnei_cont.19773:
bnei_cont.19771:
bnei_cont.19769:
bnei_cont.19765:
	beqi	%v0, 0, bnei_else.19774
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19776
	addi	%v0, %zero, 0
	j	fbgt_cont.19777
fbgt_else.19776:
	addi	%v0, %zero, 1
fbgt_cont.19777:
	beqi	%v0, 0, bnei_else.19778
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19780
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
	beqi	%v1, -1, bnei_else.19782
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
	beqi	%v1, -1, bnei_else.19784
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
	beqi	%v1, -1, bnei_else.19786
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
	beqi	%v1, -1, bnei_else.19788
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
	beqi	%v1, -1, bnei_else.19790
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
	beqi	%v1, -1, bnei_else.19792
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
	j	bnei_cont.19793
bnei_else.19792:
bnei_cont.19793:
	j	bnei_cont.19791
bnei_else.19790:
bnei_cont.19791:
	j	bnei_cont.19789
bnei_else.19788:
bnei_cont.19789:
	j	bnei_cont.19787
bnei_else.19786:
bnei_cont.19787:
	j	bnei_cont.19785
bnei_else.19784:
bnei_cont.19785:
	j	bnei_cont.19783
bnei_else.19782:
bnei_cont.19783:
	j	bnei_cont.19781
bnei_else.19780:
bnei_cont.19781:
	j	bnei_cont.19779
bnei_else.19778:
bnei_cont.19779:
	j	bnei_cont.19775
bnei_else.19774:
bnei_cont.19775:
	j	bnei_cont.19763
bnei_else.19762:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.19794
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
	beqi	%v1, -1, bnei_else.19796
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
	beqi	%v1, -1, bnei_else.19798
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
	beqi	%v1, -1, bnei_else.19800
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
	beqi	%v1, -1, bnei_else.19802
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
	beqi	%v1, -1, bnei_else.19804
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
	beqi	%v1, -1, bnei_else.19806
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
	j	bnei_cont.19807
bnei_else.19806:
bnei_cont.19807:
	j	bnei_cont.19805
bnei_else.19804:
bnei_cont.19805:
	j	bnei_cont.19803
bnei_else.19802:
bnei_cont.19803:
	j	bnei_cont.19801
bnei_else.19800:
bnei_cont.19801:
	j	bnei_cont.19799
bnei_else.19798:
bnei_cont.19799:
	j	bnei_cont.19797
bnei_else.19796:
bnei_cont.19797:
	j	bnei_cont.19795
bnei_else.19794:
bnei_cont.19795:
bnei_cont.19763:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.19808
	sw	%v0, 11(%sp)
	beqi	%a1, 99, bnei_else.19809
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
	beqi	%v0, 0, bnei_else.19811
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19813
	addi	%v0, %zero, 0
	j	fbgt_cont.19814
fbgt_else.19813:
	addi	%v0, %zero, 1
fbgt_cont.19814:
	beqi	%v0, 0, bnei_else.19815
	lw	%v0, 12(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19817
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
	beqi	%v1, -1, bnei_else.19819
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
	beqi	%v1, -1, bnei_else.19821
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
	beqi	%v1, -1, bnei_else.19823
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
	beqi	%v1, -1, bnei_else.19825
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
	beqi	%v1, -1, bnei_else.19827
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
	j	bnei_cont.19828
bnei_else.19827:
bnei_cont.19828:
	j	bnei_cont.19826
bnei_else.19825:
bnei_cont.19826:
	j	bnei_cont.19824
bnei_else.19823:
bnei_cont.19824:
	j	bnei_cont.19822
bnei_else.19821:
bnei_cont.19822:
	j	bnei_cont.19820
bnei_else.19819:
bnei_cont.19820:
	j	bnei_cont.19818
bnei_else.19817:
bnei_cont.19818:
	j	bnei_cont.19816
bnei_else.19815:
bnei_cont.19816:
	j	bnei_cont.19812
bnei_else.19811:
bnei_cont.19812:
	j	bnei_cont.19810
bnei_else.19809:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.19829
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
	beqi	%v1, -1, bnei_else.19831
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
	beqi	%v1, -1, bnei_else.19833
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
	beqi	%v1, -1, bnei_else.19835
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
	beqi	%v1, -1, bnei_else.19837
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
	beqi	%v1, -1, bnei_else.19839
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
	j	bnei_cont.19840
bnei_else.19839:
bnei_cont.19840:
	j	bnei_cont.19838
bnei_else.19837:
bnei_cont.19838:
	j	bnei_cont.19836
bnei_else.19835:
bnei_cont.19836:
	j	bnei_cont.19834
bnei_else.19833:
bnei_cont.19834:
	j	bnei_cont.19832
bnei_else.19831:
bnei_cont.19832:
	j	bnei_cont.19830
bnei_else.19829:
bnei_cont.19830:
bnei_cont.19810:
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2923
bnei_else.19808:
	jr	%ra
bnei_else.19761:
	jr	%ra
solve_each_element_fast.2929:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.19843
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
	beqi	%t3, 1, bnei_else.19844
	beqi	%t3, 2, bnei_else.19846
	addi	%a0, %t0, 0
	addi	%v1, %t2, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19847
bnei_else.19846:
	flw	%f0, 0(%t2)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.19848
	addi	%t2, %zero, 0
	j	fbgt_cont.19849
fbgt_else.19848:
	addi	%t2, %zero, 1
fbgt_cont.19849:
	beqi	%t2, 0, bnei_else.19850
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%t0, %zero, 135
	fsw	%f0, 0(%t0)
	addi	%v0, %zero, 1
	j	bnei_cont.19851
bnei_else.19850:
	addi	%v0, %zero, 0
bnei_cont.19851:
bnei_cont.19847:
	j	bnei_cont.19845
bnei_else.19844:
	lw	%t0, 0(%a0)
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19845:
	beqi	%v0, 0, bnei_else.19852
	addi	%v1, %zero, 135
	flw	%f0, 0(%v1)
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.19853
	addi	%v1, %zero, 0
	j	fbgt_cont.19854
fbgt_else.19853:
	addi	%v1, %zero, 1
fbgt_cont.19854:
	beqi	%v1, 0, bnei_else.19855
	addi	%v1, %zero, 137
	flw	%f1, 0(%v1)
	fblt	%f0, %f1, fbgt_else.19857
	addi	%v1, %zero, 0
	j	fbgt_cont.19858
fbgt_else.19857:
	addi	%v1, %zero, 1
fbgt_cont.19858:
	beqi	%v1, 0, bnei_else.19859
	flw	%f1, 458(%zero)
	fadd	%f0, %f0, %f1
	lw	%v1, 2(%sp)
	flw	%f1, 0(%v1)
	fmul	%f1, %f1, %f0
	addi	%a0, %zero, 162
	flw	%f2, 0(%a0)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v1)
	fmul	%f2, %f2, %f0
	addi	%a0, %zero, 162
	flw	%f3, 1(%a0)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v1)
	fmul	%f3, %f3, %f0
	addi	%v1, %zero, 162
	flw	%f4, 2(%v1)
	fadd	%f3, %f3, %f4
	lw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	sw	%v0, 7(%sp)
	fsw	%f3, 8(%sp)
	fsw	%f2, 9(%sp)
	fsw	%f1, 10(%sp)
	fsw	%f0, 11(%sp)
	beqi	%a0, -1, bnei_else.19861
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
	beqi	%v0, 0, bnei_else.19863
	addi	%v0, %zero, 0
	j	bnei_cont.19864
bnei_else.19863:
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
bnei_cont.19864:
	j	bnei_cont.19862
bnei_else.19861:
	addi	%v0, %zero, 1
bnei_cont.19862:
	beqi	%v0, 0, bnei_else.19865
	addi	%v0, %zero, 137
	flw	%f0, 11(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 10(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 9(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f0, 8(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 141
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 136
	lw	%v1, 7(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.19866
bnei_else.19865:
bnei_cont.19866:
	j	bnei_cont.19860
bnei_else.19859:
bnei_cont.19860:
	j	bnei_cont.19856
bnei_else.19855:
bnei_cont.19856:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2929
bnei_else.19852:
	lw	%v0, 6(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.19867
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	j	solve_each_element_fast.2929
bnei_else.19867:
	jr	%ra
bnei_else.19843:
	jr	%ra
solve_one_or_network_fast.2933:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.19870
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
	beqi	%a0, -1, bnei_else.19871
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
	beqi	%a0, -1, bnei_else.19872
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
	beqi	%a0, -1, bnei_else.19873
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
	beqi	%a0, -1, bnei_else.19874
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
	beqi	%a0, -1, bnei_else.19875
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
	beqi	%a0, -1, bnei_else.19876
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
	beqi	%a0, -1, bnei_else.19877
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
bnei_else.19870:
	jr	%ra
trace_or_matrix_fast.2937:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.19886
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.19887
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
	beqi	%t2, 1, bnei_else.19889
	beqi	%t2, 2, bnei_else.19891
	addi	%a0, %t1, 0
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.19892
bnei_else.19891:
	flw	%f0, 0(%a3)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.19893
	addi	%a3, %zero, 0
	j	fbgt_cont.19894
fbgt_else.19893:
	addi	%a3, %zero, 1
fbgt_cont.19894:
	beqi	%a3, 0, bnei_else.19895
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	addi	%a3, %zero, 135
	fsw	%f0, 0(%a3)
	addi	%v0, %zero, 1
	j	bnei_cont.19896
bnei_else.19895:
	addi	%v0, %zero, 0
bnei_cont.19896:
bnei_cont.19892:
	j	bnei_cont.19890
bnei_else.19889:
	lw	%t1, 0(%a0)
	addi	%a0, %a3, 0
	addi	%v1, %t1, 0
	addi	%v0, %t0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.19890:
	beqi	%v0, 0, bnei_else.19897
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19899
	addi	%v0, %zero, 0
	j	fbgt_cont.19900
fbgt_else.19899:
	addi	%v0, %zero, 1
fbgt_cont.19900:
	beqi	%v0, 0, bnei_else.19901
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19903
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
	beqi	%v1, -1, bnei_else.19905
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
	beqi	%v1, -1, bnei_else.19907
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
	beqi	%v1, -1, bnei_else.19909
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
	beqi	%v1, -1, bnei_else.19911
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
	beqi	%v1, -1, bnei_else.19913
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
	beqi	%v1, -1, bnei_else.19915
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
	j	bnei_cont.19916
bnei_else.19915:
bnei_cont.19916:
	j	bnei_cont.19914
bnei_else.19913:
bnei_cont.19914:
	j	bnei_cont.19912
bnei_else.19911:
bnei_cont.19912:
	j	bnei_cont.19910
bnei_else.19909:
bnei_cont.19910:
	j	bnei_cont.19908
bnei_else.19907:
bnei_cont.19908:
	j	bnei_cont.19906
bnei_else.19905:
bnei_cont.19906:
	j	bnei_cont.19904
bnei_else.19903:
bnei_cont.19904:
	j	bnei_cont.19902
bnei_else.19901:
bnei_cont.19902:
	j	bnei_cont.19898
bnei_else.19897:
bnei_cont.19898:
	j	bnei_cont.19888
bnei_else.19887:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.19917
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
	beqi	%v1, -1, bnei_else.19919
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
	beqi	%v1, -1, bnei_else.19921
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
	beqi	%v1, -1, bnei_else.19923
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
	beqi	%v1, -1, bnei_else.19925
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
	beqi	%v1, -1, bnei_else.19927
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
	beqi	%v1, -1, bnei_else.19929
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
	j	bnei_cont.19930
bnei_else.19929:
bnei_cont.19930:
	j	bnei_cont.19928
bnei_else.19927:
bnei_cont.19928:
	j	bnei_cont.19926
bnei_else.19925:
bnei_cont.19926:
	j	bnei_cont.19924
bnei_else.19923:
bnei_cont.19924:
	j	bnei_cont.19922
bnei_else.19921:
bnei_cont.19922:
	j	bnei_cont.19920
bnei_else.19919:
bnei_cont.19920:
	j	bnei_cont.19918
bnei_else.19917:
bnei_cont.19918:
bnei_cont.19888:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.19931
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.19932
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
	beqi	%t1, 1, bnei_else.19934
	beqi	%t1, 2, bnei_else.19936
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.19937
bnei_else.19936:
	flw	%f0, 0(%a1)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.19938
	addi	%a1, %zero, 0
	j	fbgt_cont.19939
fbgt_else.19938:
	addi	%a1, %zero, 1
fbgt_cont.19939:
	beqi	%a1, 0, bnei_else.19940
	flw	%f1, 3(%a3)
	fmul	%f0, %f0, %f1
	addi	%a1, %zero, 135
	fsw	%f0, 0(%a1)
	addi	%v0, %zero, 1
	j	bnei_cont.19941
bnei_else.19940:
	addi	%v0, %zero, 0
bnei_cont.19941:
bnei_cont.19937:
	j	bnei_cont.19935
bnei_else.19934:
	lw	%a3, 0(%t0)
	addi	%a0, %a1, 0
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.19935:
	beqi	%v0, 0, bnei_else.19942
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19944
	addi	%v0, %zero, 0
	j	fbgt_cont.19945
fbgt_else.19944:
	addi	%v0, %zero, 1
fbgt_cont.19945:
	beqi	%v0, 0, bnei_else.19946
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19948
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
	beqi	%v1, -1, bnei_else.19950
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
	beqi	%v1, -1, bnei_else.19952
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
	beqi	%v1, -1, bnei_else.19954
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
	beqi	%v1, -1, bnei_else.19956
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
	beqi	%v1, -1, bnei_else.19958
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
	j	bnei_cont.19959
bnei_else.19958:
bnei_cont.19959:
	j	bnei_cont.19957
bnei_else.19956:
bnei_cont.19957:
	j	bnei_cont.19955
bnei_else.19954:
bnei_cont.19955:
	j	bnei_cont.19953
bnei_else.19952:
bnei_cont.19953:
	j	bnei_cont.19951
bnei_else.19950:
bnei_cont.19951:
	j	bnei_cont.19949
bnei_else.19948:
bnei_cont.19949:
	j	bnei_cont.19947
bnei_else.19946:
bnei_cont.19947:
	j	bnei_cont.19943
bnei_else.19942:
bnei_cont.19943:
	j	bnei_cont.19933
bnei_else.19932:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.19960
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
	beqi	%v1, -1, bnei_else.19962
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
	beqi	%v1, -1, bnei_else.19964
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
	beqi	%v1, -1, bnei_else.19966
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
	beqi	%v1, -1, bnei_else.19968
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
	beqi	%v1, -1, bnei_else.19970
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
	j	bnei_cont.19971
bnei_else.19970:
bnei_cont.19971:
	j	bnei_cont.19969
bnei_else.19968:
bnei_cont.19969:
	j	bnei_cont.19967
bnei_else.19966:
bnei_cont.19967:
	j	bnei_cont.19965
bnei_else.19964:
bnei_cont.19965:
	j	bnei_cont.19963
bnei_else.19962:
bnei_cont.19963:
	j	bnei_cont.19961
bnei_else.19960:
bnei_cont.19961:
bnei_cont.19933:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2937
bnei_else.19931:
	jr	%ra
bnei_else.19886:
	jr	%ra
judge_intersection_fast.2941:
	addi	%v1, %zero, 0
	flw	%f0, 456(%zero)
	addi	%a0, %zero, 137
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 134
	lw	%a0, 0(%a0)
	lw	%a1, 0(%a0)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.19974
	sw	%v0, 0(%sp)
	sw	%a0, 1(%sp)
	beqi	%a2, 99, bnei_else.19976
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
	beqi	%t1, 1, bnei_else.19978
	beqi	%t1, 2, bnei_else.19980
	addi	%a0, %t0, 0
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_second_fast2.2851
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19981
bnei_else.19980:
	flw	%f0, 0(%a2)
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.19982
	addi	%a2, %zero, 0
	j	fbgt_cont.19983
fbgt_else.19982:
	addi	%a2, %zero, 1
fbgt_cont.19983:
	beqi	%a2, 0, bnei_else.19984
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	addi	%a2, %zero, 135
	fsw	%f0, 0(%a2)
	addi	%v0, %zero, 1
	j	bnei_cont.19985
bnei_else.19984:
	addi	%v0, %zero, 0
bnei_cont.19985:
bnei_cont.19981:
	j	bnei_cont.19979
bnei_else.19978:
	lw	%t0, 0(%v0)
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_rect_fast.2821
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.19979:
	beqi	%v0, 0, bnei_else.19986
	addi	%v0, %zero, 135
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 137
	flw	%f1, 0(%v0)
	fblt	%f0, %f1, fbgt_else.19988
	addi	%v0, %zero, 0
	j	fbgt_cont.19989
fbgt_else.19988:
	addi	%v0, %zero, 1
fbgt_cont.19989:
	beqi	%v0, 0, bnei_else.19990
	lw	%v0, 3(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.19992
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
	beqi	%v1, -1, bnei_else.19994
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
	beqi	%v1, -1, bnei_else.19996
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
	beqi	%v1, -1, bnei_else.19998
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
	beqi	%v1, -1, bnei_else.20000
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
	beqi	%v1, -1, bnei_else.20002
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
	j	bnei_cont.20003
bnei_else.20002:
bnei_cont.20003:
	j	bnei_cont.20001
bnei_else.20000:
bnei_cont.20001:
	j	bnei_cont.19999
bnei_else.19998:
bnei_cont.19999:
	j	bnei_cont.19997
bnei_else.19996:
bnei_cont.19997:
	j	bnei_cont.19995
bnei_else.19994:
bnei_cont.19995:
	j	bnei_cont.19993
bnei_else.19992:
bnei_cont.19993:
	j	bnei_cont.19991
bnei_else.19990:
bnei_cont.19991:
	j	bnei_cont.19987
bnei_else.19986:
bnei_cont.19987:
	j	bnei_cont.19977
bnei_else.19976:
	lw	%a2, 1(%a1)
	beqi	%a2, -1, bnei_else.20004
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
	beqi	%v1, -1, bnei_else.20006
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
	beqi	%v1, -1, bnei_else.20008
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
	beqi	%v1, -1, bnei_else.20010
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
	beqi	%v1, -1, bnei_else.20012
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
	beqi	%v1, -1, bnei_else.20014
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
	j	bnei_cont.20015
bnei_else.20014:
bnei_cont.20015:
	j	bnei_cont.20013
bnei_else.20012:
bnei_cont.20013:
	j	bnei_cont.20011
bnei_else.20010:
bnei_cont.20011:
	j	bnei_cont.20009
bnei_else.20008:
bnei_cont.20009:
	j	bnei_cont.20007
bnei_else.20006:
bnei_cont.20007:
	j	bnei_cont.20005
bnei_else.20004:
bnei_cont.20005:
bnei_cont.19977:
	addi	%v0, %zero, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.19975
bnei_else.19974:
bnei_cont.19975:
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.20016
	addi	%v0, %zero, 0
	j	fbgt_cont.20017
fbgt_else.20016:
	addi	%v0, %zero, 1
fbgt_cont.20017:
	beqi	%v0, 0, bnei_else.20018
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.20019
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.20019:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.20018:
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_second.2947:
	addi	%v1, %zero, 138
	flw	%f0, 0(%v1)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 138
	flw	%f1, 1(%v1)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	addi	%v1, %zero, 138
	flw	%f2, 2(%v1)
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
	beqi	%v1, 0, bnei_else.20020
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 467(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	addi	%v1, %zero, 142
	fsw	%f3, 0(%v1)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	addi	%v1, %zero, 142
	fsw	%f2, 1(%v1)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 2(%v1)
	j	bnei_cont.20021
bnei_else.20020:
	addi	%v1, %zero, 142
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 142
	fsw	%f4, 1(%v1)
	addi	%v1, %zero, 142
	fsw	%f5, 2(%v1)
bnei_cont.20021:
	lw	%v1, 6(%v0)
	addi	%v0, %zero, 142
	j	vecunit_sgn.2655
utexture.2952:
	lw	%a0, 0(%v0)
	lw	%a1, 8(%v0)
	flw	%f0, 0(%a1)
	addi	%a1, %zero, 145
	fsw	%f0, 0(%a1)
	lw	%a1, 8(%v0)
	flw	%f0, 1(%a1)
	addi	%a1, %zero, 145
	fsw	%f0, 1(%a1)
	lw	%a1, 8(%v0)
	flw	%f0, 2(%a1)
	addi	%a1, %zero, 145
	fsw	%f0, 2(%a1)
	beqi	%a0, 1, bnei_else.20022
	beqi	%a0, 2, bnei_else.20023
	beqi	%a0, 3, bnei_else.20024
	beqi	%a0, 4, bnei_else.20025
	jr	%ra
bnei_else.20025:
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
	fblt	%f3, %f4, fbgt_else.20027
	addi	%a0, %zero, 0
	j	fbgt_cont.20028
fbgt_else.20027:
	addi	%a0, %zero, 1
fbgt_cont.20028:
	fsw	%f4, 0(%sp)
	fsw	%f2, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.20029
	flw	%f0, 453(%zero)
	j	bnei_cont.20030
bnei_else.20029:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.20031
	addi	%a0, %zero, 1
	j	fbgt_cont.20032
fbgt_else.20031:
	addi	%a0, %zero, 0
fbgt_cont.20032:
	fabs	%f1, %f0
	flw	%f3, 452(%zero)
	fblt	%f1, %f3, fbgt_else.20033
	flw	%f0, 451(%zero)
	sw	%a0, 4(%sp)
	fblt	%f1, %f0, fbgt_else.20035
	flw	%f0, 473(%zero)
	flw	%f3, 468(%zero)
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
	j	fbgt_cont.20036
fbgt_else.20035:
	flw	%f0, 472(%zero)
	flw	%f3, 468(%zero)
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
fbgt_cont.20036:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.20037
	j	bnei_cont.20038
bnei_else.20037:
	fneg	%f0, %f0
bnei_cont.20038:
	j	fbgt_cont.20034
fbgt_else.20033:
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	kernel_atan.2612
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
fbgt_cont.20034:
	flw	%f1, 450(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.20030:
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
	fblt	%f3, %f4, fbgt_else.20039
	addi	%v0, %zero, 0
	j	fbgt_cont.20040
fbgt_else.20039:
	addi	%v0, %zero, 1
fbgt_cont.20040:
	fsw	%f0, 7(%sp)
	beqi	%v0, 0, bnei_else.20041
	flw	%f0, 453(%zero)
	j	bnei_cont.20042
bnei_else.20041:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 464(%zero)
	fblt	%f1, %f2, fbgt_else.20043
	addi	%v0, %zero, 1
	j	fbgt_cont.20044
fbgt_else.20043:
	addi	%v0, %zero, 0
fbgt_cont.20044:
	fabs	%f2, %f1
	flw	%f3, 452(%zero)
	fblt	%f2, %f3, fbgt_else.20045
	flw	%f1, 451(%zero)
	sw	%v0, 8(%sp)
	fblt	%f2, %f1, fbgt_else.20047
	flw	%f1, 473(%zero)
	flw	%f3, 468(%zero)
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
	j	fbgt_cont.20048
fbgt_else.20047:
	flw	%f1, 472(%zero)
	flw	%f3, 468(%zero)
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
fbgt_cont.20048:
	lw	%v0, 8(%sp)
	beqi	%v0, 0, bnei_else.20049
	j	bnei_cont.20050
bnei_else.20049:
	fneg	%f0, %f0
bnei_cont.20050:
	j	fbgt_cont.20046
fbgt_else.20045:
	fmov	%f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	kernel_atan.2612
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
fbgt_cont.20046:
	flw	%f1, 450(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.20042:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 448(%zero)
	flw	%f2, 467(%zero)
	flw	%f3, 7(%sp)
	fsub	%f3, %f2, %f3
	fmul	%f3, %f3, %f3
	fsub	%f1, %f1, %f3
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.20051
	addi	%v0, %zero, 0
	j	fbgt_cont.20052
fbgt_else.20051:
	addi	%v0, %zero, 1
fbgt_cont.20052:
	beqi	%v0, 0, bnei_else.20053
	fmov	%f0, %f1
	j	bnei_cont.20054
bnei_else.20053:
bnei_cont.20054:
	flw	%f1, 447(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 446(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.20024:
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
	flw	%f1, 445(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	cos.2616
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 447(%zero)
	fmul	%f2, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f2, 1(%v0)
	flw	%f2, 468(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.20023:
	flw	%f0, 1(%v1)
	flw	%f1, 444(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	sin.2618
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	fmul	%f0, %f0, %f0
	flw	%f1, 447(%zero)
	fmul	%f2, %f1, %f0
	addi	%v0, %zero, 145
	fsw	%f2, 0(%v0)
	flw	%f2, 468(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 145
	fsw	%f0, 1(%v0)
	jr	%ra
bnei_else.20022:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	flw	%f1, 0(%a0)
	fsub	%f0, %f0, %f1
	flw	%f1, 443(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 442(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 445(%zero)
	fblt	%f0, %f2, fbgt_else.20058
	addi	%a0, %zero, 0
	j	fbgt_cont.20059
fbgt_else.20058:
	addi	%a0, %zero, 1
fbgt_cont.20059:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f4, 2(%v0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.20060
	addi	%v0, %zero, 0
	j	fbgt_cont.20061
fbgt_else.20060:
	addi	%v0, %zero, 1
fbgt_cont.20061:
	beqi	%a0, 0, bnei_else.20062
	beqi	%v0, 0, bnei_else.20064
	flw	%f0, 447(%zero)
	j	bnei_cont.20065
bnei_else.20064:
	flw	%f0, 464(%zero)
bnei_cont.20065:
	j	bnei_cont.20063
bnei_else.20062:
	beqi	%v0, 0, bnei_else.20066
	flw	%f0, 464(%zero)
	j	bnei_cont.20067
bnei_else.20066:
	flw	%f0, 447(%zero)
bnei_cont.20067:
bnei_cont.20063:
	addi	%v0, %zero, 145
	fsw	%f0, 1(%v0)
	jr	%ra
trace_reflections.2959:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.20069
	addi	%a1, %zero, 254
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 1(%a1)
	flw	%f2, 456(%zero)
	addi	%a3, %zero, 137
	fsw	%f2, 0(%a3)
	addi	%a3, %zero, 134
	lw	%a3, 0(%a3)
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
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.20070
	addi	%v0, %zero, 0
	j	fbgt_cont.20071
fbgt_else.20070:
	addi	%v0, %zero, 1
fbgt_cont.20071:
	beqi	%v0, 0, bnei_else.20072
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.20074
	addi	%v0, %zero, 0
	j	fbgt_cont.20075
fbgt_else.20074:
	addi	%v0, %zero, 1
fbgt_cont.20075:
	j	bnei_cont.20073
bnei_else.20072:
	addi	%v0, %zero, 0
bnei_cont.20073:
	beqi	%v0, 0, bnei_else.20076
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 136
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.20078
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.20080
	j	bnei_cont.20081
bnei_else.20080:
	lw	%v0, 4(%sp)
	lw	%v1, 0(%v0)
	addi	%a0, %zero, 142
	flw	%f0, 0(%a0)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	addi	%a0, %zero, 142
	flw	%f1, 1(%a0)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 142
	flw	%f1, 2(%a0)
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
	flw	%f3, 464(%zero)
	fblt	%f3, %f0, fbgt_else.20082
	addi	%v0, %zero, 0
	j	fbgt_cont.20083
fbgt_else.20082:
	addi	%v0, %zero, 1
fbgt_cont.20083:
	beqi	%v0, 0, bnei_else.20084
	addi	%v0, %zero, 151
	flw	%f4, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f5, 0(%v0)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	addi	%v0, %zero, 151
	fsw	%f4, 0(%v0)
	addi	%v0, %zero, 151
	flw	%f4, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f5, 1(%v0)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	addi	%v0, %zero, 151
	fsw	%f4, 1(%v0)
	addi	%v0, %zero, 151
	flw	%f4, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f5, 2(%v0)
	fmul	%f0, %f0, %f5
	fadd	%f0, %f4, %f0
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	j	bnei_cont.20085
bnei_else.20084:
bnei_cont.20085:
	fblt	%f3, %f1, fbgt_else.20086
	addi	%v0, %zero, 0
	j	fbgt_cont.20087
fbgt_else.20086:
	addi	%v0, %zero, 1
fbgt_cont.20087:
	beqi	%v0, 0, bnei_else.20088
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f0
	flw	%f1, 1(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 151
	flw	%f3, 0(%v0)
	fadd	%f3, %f3, %f0
	addi	%v0, %zero, 151
	fsw	%f3, 0(%v0)
	addi	%v0, %zero, 151
	flw	%f3, 1(%v0)
	fadd	%f3, %f3, %f0
	addi	%v0, %zero, 151
	fsw	%f3, 1(%v0)
	addi	%v0, %zero, 151
	flw	%f3, 2(%v0)
	fadd	%f0, %f3, %f0
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	j	bnei_cont.20089
bnei_else.20088:
bnei_cont.20089:
bnei_cont.20081:
	j	beq_cont.20079
beq_else.20078:
beq_cont.20079:
	j	bnei_cont.20077
bnei_else.20076:
bnei_cont.20077:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2959
bgti_else.20069:
	jr	%ra
trace_ray.2964:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.20091
	lw	%a1, 2(%a0)
	addi	%a2, %zero, 0
	flw	%f2, 456(%zero)
	addi	%a3, %zero, 137
	fsw	%f2, 0(%a3)
	addi	%a3, %zero, 134
	lw	%a3, 0(%a3)
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
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.20092
	addi	%v0, %zero, 0
	j	fbgt_cont.20093
fbgt_else.20092:
	addi	%v0, %zero, 1
fbgt_cont.20093:
	beqi	%v0, 0, bnei_else.20094
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.20096
	addi	%v0, %zero, 0
	j	fbgt_cont.20097
fbgt_else.20096:
	addi	%v0, %zero, 1
fbgt_cont.20097:
	j	bnei_cont.20095
bnei_else.20094:
	addi	%v0, %zero, 0
bnei_cont.20095:
	beqi	%v0, 0, bnei_else.20098
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
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
	beqi	%a1, 1, bnei_else.20099
	beqi	%a1, 2, bnei_else.20101
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	get_nvector_second.2947
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.20102
bnei_else.20101:
	lw	%a1, 4(%v1)
	flw	%f3, 0(%a1)
	fneg	%f3, %f3
	addi	%a1, %zero, 142
	fsw	%f3, 0(%a1)
	lw	%a1, 4(%v1)
	flw	%f3, 1(%a1)
	fneg	%f3, %f3
	addi	%a1, %zero, 142
	fsw	%f3, 1(%a1)
	lw	%a1, 4(%v1)
	flw	%f3, 2(%a1)
	fneg	%f3, %f3
	addi	%a1, %zero, 142
	fsw	%f3, 2(%a1)
bnei_cont.20102:
	j	bnei_cont.20100
bnei_else.20099:
	addi	%a1, %zero, 136
	lw	%a1, 0(%a1)
	flw	%f3, 464(%zero)
	addi	%a3, %zero, 142
	fsw	%f3, 0(%a3)
	addi	%a3, %zero, 142
	fsw	%f3, 1(%a3)
	addi	%a3, %zero, 142
	fsw	%f3, 2(%a3)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.20103
	addi	%t0, %zero, 1
	j	fbeq_cont.20104
fbeq_else.20103:
	addi	%t0, %zero, 0
fbeq_cont.20104:
	beqi	%t0, 0, bnei_else.20105
	j	bnei_cont.20106
bnei_else.20105:
	fblt	%f3, %f4, fbgt_else.20107
	addi	%t0, %zero, 0
	j	fbgt_cont.20108
fbgt_else.20107:
	addi	%t0, %zero, 1
fbgt_cont.20108:
	beqi	%t0, 0, bnei_else.20109
	flw	%f3, 468(%zero)
	j	bnei_cont.20110
bnei_else.20109:
	flw	%f3, 463(%zero)
bnei_cont.20110:
bnei_cont.20106:
	fneg	%f3, %f3
	addi	%t0, %zero, 142
	add	%at, %t0, %a1
	fsw	%f3, 0(%at)
bnei_cont.20100:
	addi	%v0, %zero, 138
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 138
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 159
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 138
	flw	%f2, 2(%v0)
	addi	%v0, %zero, 159
	fsw	%f2, 2(%v0)
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
	addi	%v1, %zero, 136
	lw	%v1, 0(%v1)
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
	flw	%f4, 467(%zero)
	fblt	%f3, %f4, fbgt_else.20111
	addi	%a3, %zero, 0
	j	fbgt_cont.20112
fbgt_else.20111:
	addi	%a3, %zero, 1
fbgt_cont.20112:
	beqi	%a3, 0, bnei_else.20113
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.20114
bnei_else.20113:
	lw	%a3, 11(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	lw	%a1, 4(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	addi	%a3, %zero, 145
	flw	%f3, 0(%a3)
	fsw	%f3, 0(%a1)
	addi	%a3, %zero, 145
	flw	%f3, 1(%a3)
	fsw	%f3, 1(%a1)
	addi	%a3, %zero, 145
	flw	%f3, 2(%a3)
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
	addi	%a3, %zero, 142
	flw	%f3, 0(%a3)
	fsw	%f3, 0(%a1)
	addi	%a3, %zero, 142
	flw	%f3, 1(%a3)
	fsw	%f3, 1(%a1)
	addi	%a3, %zero, 142
	flw	%f3, 2(%a3)
	fsw	%f3, 2(%a1)
bnei_cont.20114:
	flw	%f3, 440(%zero)
	lw	%a1, 5(%sp)
	flw	%f4, 0(%a1)
	addi	%a3, %zero, 142
	flw	%f5, 0(%a3)
	fmul	%f6, %f4, %f5
	flw	%f7, 1(%a1)
	addi	%a3, %zero, 142
	flw	%f8, 1(%a3)
	fmul	%f9, %f7, %f8
	fadd	%f6, %f6, %f9
	flw	%f9, 2(%a1)
	addi	%a3, %zero, 142
	flw	%f10, 2(%a3)
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
	beqi	%v0, 0, bnei_else.20115
	j	bnei_cont.20116
bnei_else.20115:
	addi	%v0, %zero, 78
	flw	%f0, 0(%v0)
	flw	%f1, 20(%sp)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	flw	%f3, 19(%sp)
	fmul	%f3, %f3, %f2
	fadd	%f1, %f1, %f3
	addi	%v0, %zero, 78
	flw	%f3, 2(%v0)
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
	flw	%f2, 464(%zero)
	fblt	%f2, %f1, fbgt_else.20117
	addi	%v1, %zero, 0
	j	fbgt_cont.20118
fbgt_else.20117:
	addi	%v1, %zero, 1
fbgt_cont.20118:
	beqi	%v1, 0, bnei_else.20119
	addi	%v1, %zero, 151
	flw	%f3, 0(%v1)
	addi	%v1, %zero, 145
	flw	%f5, 0(%v1)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	addi	%v1, %zero, 151
	fsw	%f3, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f3, 1(%v1)
	addi	%v1, %zero, 145
	flw	%f5, 1(%v1)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	addi	%v1, %zero, 151
	fsw	%f3, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f3, 2(%v1)
	addi	%v1, %zero, 145
	flw	%f5, 2(%v1)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
	addi	%v1, %zero, 151
	fsw	%f1, 2(%v1)
	j	bnei_cont.20120
bnei_else.20119:
bnei_cont.20120:
	fblt	%f2, %f0, fbgt_else.20121
	addi	%v1, %zero, 0
	j	fbgt_cont.20122
fbgt_else.20121:
	addi	%v1, %zero, 1
fbgt_cont.20122:
	beqi	%v1, 0, bnei_else.20123
	fmul	%f0, %f0, %f0
	fmul	%f0, %f0, %f0
	flw	%f1, 17(%sp)
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 151
	flw	%f2, 0(%v1)
	fadd	%f2, %f2, %f0
	addi	%v1, %zero, 151
	fsw	%f2, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f2, 1(%v1)
	fadd	%f2, %f2, %f0
	addi	%v1, %zero, 151
	fsw	%f2, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f2, 2(%v1)
	fadd	%f0, %f2, %f0
	addi	%v1, %zero, 151
	fsw	%f0, 2(%v1)
	j	bnei_cont.20124
bnei_else.20123:
bnei_cont.20124:
bnei_cont.20116:
	addi	%v0, %zero, 162
	flw	%f0, 16(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 162
	flw	%f0, 15(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 162
	flw	%f0, 14(%sp)
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	setup_startp_constants.2875
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	addi	%v0, %zero, 434
	lw	%v0, 0(%v0)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 17(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_reflections.2959
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f0, 439(%zero)
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.20125
	addi	%v0, %zero, 0
	j	fbgt_cont.20126
fbgt_else.20125:
	addi	%v0, %zero, 1
fbgt_cont.20126:
	beqi	%v0, 0, bnei_else.20127
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.20128
	j	bgti_cont.20129
bgti_else.20128:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.20129:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.20130
	jr	%ra
bnei_else.20130:
	flw	%f0, 468(%zero)
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
bnei_else.20127:
	jr	%ra
bnei_else.20098:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.20133
	lw	%v0, 5(%sp)
	flw	%f0, 0(%v0)
	addi	%v1, %zero, 78
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)
	addi	%v1, %zero, 78
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.20134
	addi	%v0, %zero, 0
	j	fbgt_cont.20135
fbgt_else.20134:
	addi	%v0, %zero, 1
fbgt_cont.20135:
	beqi	%v0, 0, bnei_else.20136
	fmul	%f1, %f0, %f0
	fmul	%f0, %f1, %f0
	flw	%f1, 4(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 81
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 151
	flw	%f1, 0(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 151
	flw	%f1, 1(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 151
	flw	%f1, 2(%v0)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.20136:
	jr	%ra
bnei_else.20133:
	jr	%ra
bgt_else.20091:
	jr	%ra
trace_diffuse_ray.2970:
	addi	%v1, %zero, 0
	flw	%f1, 456(%zero)
	addi	%a0, %zero, 137
	fsw	%f1, 0(%a0)
	addi	%a0, %zero, 134
	lw	%a0, 0(%a0)
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
	addi	%v0, %zero, 137
	flw	%f0, 0(%v0)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.20141
	addi	%v0, %zero, 0
	j	fbgt_cont.20142
fbgt_else.20141:
	addi	%v0, %zero, 1
fbgt_cont.20142:
	beqi	%v0, 0, bnei_else.20143
	flw	%f1, 455(%zero)
	fblt	%f0, %f1, fbgt_else.20145
	addi	%v0, %zero, 0
	j	fbgt_cont.20146
fbgt_else.20145:
	addi	%v0, %zero, 1
fbgt_cont.20146:
	j	bnei_cont.20144
bnei_else.20143:
	addi	%v0, %zero, 0
bnei_cont.20144:
	beqi	%v0, 0, bnei_else.20147
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 4(%sp)
	beqi	%a0, 1, bnei_else.20148
	beqi	%a0, 2, bnei_else.20150
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	get_nvector_second.2947
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.20151
bnei_else.20150:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 1(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 2(%v1)
bnei_cont.20151:
	j	bnei_cont.20149
bnei_else.20148:
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	flw	%f0, 464(%zero)
	addi	%a1, %zero, 142
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 2(%a1)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.20152
	addi	%v1, %zero, 1
	j	fbeq_cont.20153
fbeq_else.20152:
	addi	%v1, %zero, 0
fbeq_cont.20153:
	beqi	%v1, 0, bnei_else.20154
	j	bnei_cont.20155
bnei_else.20154:
	fblt	%f0, %f1, fbgt_else.20156
	addi	%v1, %zero, 0
	j	fbgt_cont.20157
fbgt_else.20156:
	addi	%v1, %zero, 1
fbgt_cont.20157:
	beqi	%v1, 0, bnei_else.20158
	flw	%f0, 468(%zero)
	j	bnei_cont.20159
bnei_else.20158:
	flw	%f0, 463(%zero)
bnei_cont.20159:
bnei_cont.20155:
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f0, 0(%at)
bnei_cont.20149:
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
	beqi	%v0, 0, bnei_else.20160
	jr	%ra
bnei_else.20160:
	addi	%v0, %zero, 142
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.20162
	addi	%v0, %zero, 0
	j	fbgt_cont.20163
fbgt_else.20162:
	addi	%v0, %zero, 1
fbgt_cont.20163:
	beqi	%v0, 0, bnei_else.20164
	j	bnei_cont.20165
bnei_else.20164:
	fmov	%f0, %f1
bnei_cont.20165:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 148
	flw	%f1, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 0(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 148
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 148
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 148
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 148
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f2, 2(%v0)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
	jr	%ra
bnei_else.20147:
	jr	%ra
iter_trace_diffuse_rays.2973:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.20168
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
	flw	%f2, 464(%zero)
	fblt	%f0, %f2, fbgt_else.20169
	addi	%t0, %zero, 0
	j	fbgt_cont.20170
fbgt_else.20169:
	addi	%t0, %zero, 1
fbgt_cont.20170:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f4, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a1, 7(%sp)
	beqi	%t0, 0, bnei_else.20171
	addi	%a3, %a1, 1
	add	%at, %v0, %a3
	lw	%a3, 0(%at)
	flw	%f5, 438(%zero)
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
	beqi	%v0, 0, bnei_else.20173
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 10(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 11(%sp)
	beqi	%a0, 1, bnei_else.20175
	beqi	%a0, 2, bnei_else.20177
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	get_nvector_second.2947
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.20178
bnei_else.20177:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 1(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 2(%v1)
bnei_cont.20178:
	j	bnei_cont.20176
bnei_else.20175:
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	addi	%a1, %zero, 142
	flw	%f0, 2(%sp)
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 2(%a1)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.20179
	addi	%v1, %zero, 1
	j	fbeq_cont.20180
fbeq_else.20179:
	addi	%v1, %zero, 0
fbeq_cont.20180:
	beqi	%v1, 0, bnei_else.20181
	fmov	%f1, %f0
	j	bnei_cont.20182
bnei_else.20181:
	fblt	%f0, %f1, fbgt_else.20183
	addi	%v1, %zero, 0
	j	fbgt_cont.20184
fbgt_else.20183:
	addi	%v1, %zero, 1
fbgt_cont.20184:
	beqi	%v1, 0, bnei_else.20185
	flw	%f1, 468(%zero)
	j	bnei_cont.20186
bnei_else.20185:
	flw	%f1, 463(%zero)
bnei_cont.20186:
bnei_cont.20182:
	fneg	%f1, %f1
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f1, 0(%at)
bnei_cont.20176:
	addi	%v1, %zero, 138
	lw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	utexture.2952
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 134
	lw	%v1, 0(%v0)
	lw	%v0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.20187
	j	bnei_cont.20188
bnei_else.20187:
	addi	%v0, %zero, 142
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 2(%sp)
	fblt	%f1, %f0, fbgt_else.20189
	addi	%v0, %zero, 0
	j	fbgt_cont.20190
fbgt_else.20189:
	addi	%v0, %zero, 1
fbgt_cont.20190:
	beqi	%v0, 0, bnei_else.20191
	j	bnei_cont.20192
bnei_else.20191:
	fmov	%f0, %f1
bnei_cont.20192:
	flw	%f2, 8(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 11(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 148
	flw	%f2, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 0(%v0)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 148
	fsw	%f2, 0(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 1(%v0)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 148
	fsw	%f2, 1(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 2(%v0)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
bnei_cont.20188:
	j	bnei_cont.20174
bnei_else.20173:
bnei_cont.20174:
	j	bnei_cont.20172
bnei_else.20171:
	flw	%f5, 437(%zero)
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
	beqi	%v0, 0, bnei_else.20193
	addi	%v0, %zero, 141
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 13(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	sw	%v0, 14(%sp)
	beqi	%a0, 1, bnei_else.20195
	beqi	%a0, 2, bnei_else.20197
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	get_nvector_second.2947
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.20198
bnei_else.20197:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 1(%v1)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	addi	%v1, %zero, 142
	fsw	%f0, 2(%v1)
bnei_cont.20198:
	j	bnei_cont.20196
bnei_else.20195:
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	addi	%a1, %zero, 142
	flw	%f0, 2(%sp)
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 142
	fsw	%f0, 2(%a1)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.20199
	addi	%v1, %zero, 1
	j	fbeq_cont.20200
fbeq_else.20199:
	addi	%v1, %zero, 0
fbeq_cont.20200:
	beqi	%v1, 0, bnei_else.20201
	fmov	%f1, %f0
	j	bnei_cont.20202
bnei_else.20201:
	fblt	%f0, %f1, fbgt_else.20203
	addi	%v1, %zero, 0
	j	fbgt_cont.20204
fbgt_else.20203:
	addi	%v1, %zero, 1
fbgt_cont.20204:
	beqi	%v1, 0, bnei_else.20205
	flw	%f1, 468(%zero)
	j	bnei_cont.20206
bnei_else.20205:
	flw	%f1, 463(%zero)
bnei_cont.20206:
bnei_cont.20202:
	fneg	%f1, %f1
	addi	%v1, %zero, 142
	add	%at, %v1, %a0
	fsw	%f1, 0(%at)
bnei_cont.20196:
	addi	%v1, %zero, 138
	lw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	utexture.2952
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%v0, %zero, 134
	lw	%v1, 0(%v0)
	lw	%v0, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	beqi	%v0, 0, bnei_else.20207
	j	bnei_cont.20208
bnei_else.20207:
	addi	%v0, %zero, 142
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 78
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 1(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 1(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 142
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 78
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 2(%sp)
	fblt	%f1, %f0, fbgt_else.20209
	addi	%v0, %zero, 0
	j	fbgt_cont.20210
fbgt_else.20209:
	addi	%v0, %zero, 1
fbgt_cont.20210:
	beqi	%v0, 0, bnei_else.20211
	j	bnei_cont.20212
bnei_else.20211:
	fmov	%f0, %f1
bnei_cont.20212:
	flw	%f2, 12(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 14(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 148
	flw	%f2, 0(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 0(%v0)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 148
	fsw	%f2, 0(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 1(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 1(%v0)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 148
	fsw	%f2, 1(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 2(%v0)
	addi	%v0, %zero, 145
	flw	%f3, 2(%v0)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
bnei_cont.20208:
	j	bnei_cont.20194
bnei_else.20193:
bnei_cont.20194:
bnei_cont.20172:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.20213
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
	fblt	%f0, %f1, fbgt_else.20214
	addi	%a1, %zero, 0
	j	fbgt_cont.20215
fbgt_else.20214:
	addi	%a1, %zero, 1
fbgt_cont.20215:
	sw	%v0, 15(%sp)
	beqi	%a1, 0, bnei_else.20216
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.20217
bnei_else.20216:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
bnei_cont.20217:
	lw	%v0, 15(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
bgti_else.20213:
	jr	%ra
bgti_else.20168:
	jr	%ra
trace_diffuse_ray_80percent.2982:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.20220
	addi	%a1, %zero, 179
	lw	%a1, 0(%a1)
	flw	%f0, 0(%a0)
	addi	%a2, %zero, 162
	fsw	%f0, 0(%a2)
	flw	%f0, 1(%a0)
	addi	%a2, %zero, 162
	fsw	%f0, 1(%a2)
	flw	%f0, 2(%a0)
	addi	%a2, %zero, 162
	fsw	%f0, 2(%a2)
	addi	%a2, %zero, 0
	lw	%a2, 0(%a2)
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
	j	bnei_cont.20221
bnei_else.20220:
bnei_cont.20221:
	lw	%v0, 2(%sp)
	beqi	%v0, 1, bnei_else.20222
	addi	%v1, %zero, 179
	lw	%v1, 1(%v1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
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
	j	bnei_cont.20223
bnei_else.20222:
bnei_cont.20223:
	lw	%v0, 2(%sp)
	beqi	%v0, 2, bnei_else.20224
	addi	%v1, %zero, 179
	lw	%v1, 2(%v1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
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
	j	bnei_cont.20225
bnei_else.20224:
bnei_cont.20225:
	lw	%v0, 2(%sp)
	beqi	%v0, 3, bnei_else.20226
	addi	%v1, %zero, 179
	lw	%v1, 3(%v1)
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
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
	j	bnei_cont.20227
bnei_else.20226:
bnei_cont.20227:
	lw	%v0, 2(%sp)
	beqi	%v0, 4, bnei_else.20228
	addi	%v0, %zero, 179
	lw	%v0, 4(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 2(%a0)
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
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
bnei_else.20228:
	jr	%ra
calc_diffuse_using_1point.2986:
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	addi	%t0, %zero, 148
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a0)
	addi	%t0, %zero, 148
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a0)
	addi	%a0, %zero, 148
	fsw	%f0, 2(%a0)
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
	beqi	%v0, 0, bnei_else.20230
	addi	%a2, %zero, 179
	lw	%a2, 0(%a2)
	flw	%f0, 0(%a1)
	addi	%t0, %zero, 162
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a1)
	addi	%t0, %zero, 162
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a1)
	addi	%t0, %zero, 162
	fsw	%f0, 2(%t0)
	addi	%t0, %zero, 0
	lw	%t0, 0(%t0)
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
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.20232
	addi	%a0, %zero, 0
	j	fbgt_cont.20233
fbgt_else.20232:
	addi	%a0, %zero, 1
fbgt_cont.20233:
	beqi	%a0, 0, bnei_else.20234
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.20235
bnei_else.20234:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.20235:
	addi	%a1, %zero, 116
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.20231
bnei_else.20230:
bnei_cont.20231:
	lw	%v0, 4(%sp)
	beqi	%v0, 1, bnei_else.20236
	addi	%v1, %zero, 179
	lw	%v1, 1(%v1)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
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
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.20238
	addi	%a0, %zero, 0
	j	fbgt_cont.20239
fbgt_else.20238:
	addi	%a0, %zero, 1
fbgt_cont.20239:
	beqi	%a0, 0, bnei_else.20240
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.20241
bnei_else.20240:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.20241:
	addi	%a1, %zero, 116
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.20237
bnei_else.20236:
bnei_cont.20237:
	lw	%v0, 4(%sp)
	beqi	%v0, 2, bnei_else.20242
	addi	%v1, %zero, 179
	lw	%v1, 2(%v1)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
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
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.20244
	addi	%a0, %zero, 0
	j	fbgt_cont.20245
fbgt_else.20244:
	addi	%a0, %zero, 1
fbgt_cont.20245:
	beqi	%a0, 0, bnei_else.20246
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.20247
bnei_else.20246:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bnei_cont.20247:
	addi	%a1, %zero, 116
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.20243
bnei_else.20242:
bnei_cont.20243:
	lw	%v0, 4(%sp)
	beqi	%v0, 3, bnei_else.20248
	addi	%v1, %zero, 179
	lw	%v1, 3(%v1)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%a0)
	addi	%a1, %zero, 162
	fsw	%f0, 2(%a1)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
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
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.20250
	addi	%a0, %zero, 0
	j	fbgt_cont.20251
fbgt_else.20250:
	addi	%a0, %zero, 1
fbgt_cont.20251:
	beqi	%a0, 0, bnei_else.20252
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20253
bnei_else.20252:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.20253:
	addi	%a1, %zero, 116
	lw	%v0, 8(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20249
bnei_else.20248:
bnei_cont.20249:
	lw	%v0, 4(%sp)
	beqi	%v0, 4, bnei_else.20254
	addi	%v0, %zero, 179
	lw	%v0, 4(%v0)
	lw	%v1, 3(%sp)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%v1)
	addi	%a0, %zero, 162
	fsw	%f0, 2(%a0)
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
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
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.20256
	addi	%a0, %zero, 0
	j	fbgt_cont.20257
fbgt_else.20256:
	addi	%a0, %zero, 1
fbgt_cont.20257:
	beqi	%a0, 0, bnei_else.20258
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20259
bnei_else.20258:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20259:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2973
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20255
bnei_else.20254:
bnei_cont.20255:
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 151
	flw	%f0, 0(%v1)
	flw	%f1, 0(%v0)
	addi	%v1, %zero, 148
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f0, 1(%v1)
	flw	%f1, 1(%v0)
	addi	%v1, %zero, 148
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f0, 2(%v1)
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
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
	addi	%a1, %zero, 148
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%v1)
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%v1)
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %a3, %a2
	lw	%v1, 0(%at)
	addi	%a1, %zero, 148
	flw	%f0, 0(%a1)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 148
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 148
	flw	%f0, 1(%a1)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 148
	flw	%f0, 2(%a1)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %t1, %a2
	lw	%v1, 0(%at)
	addi	%a1, %zero, 148
	flw	%f0, 0(%a1)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 148
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 148
	flw	%f0, 1(%a1)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 148
	flw	%f0, 2(%a1)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %a0, %a2
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	flw	%f0, 0(%a0)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 148
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 148
	flw	%f0, 1(%a0)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 148
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 148
	flw	%f0, 2(%a0)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 2(%v1)
	add	%at, %v0, %a2
	lw	%v0, 0(%at)
	addi	%v1, %zero, 148
	flw	%f0, 0(%v1)
	flw	%f1, 0(%v0)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 148
	flw	%f0, 1(%v1)
	flw	%f1, 1(%v0)
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148
	fsw	%f0, 1(%v1)
	addi	%v1, %zero, 148
	flw	%f0, 2(%v1)
	flw	%f1, 2(%v0)
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 148
	fsw	%f0, 2(%v0)
	lw	%v0, 4(%t0)
	add	%at, %v0, %a2
	lw	%v0, 0(%at)
	addi	%v1, %zero, 151
	flw	%f0, 0(%v1)
	flw	%f1, 0(%v0)
	addi	%v1, %zero, 148
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 151
	flw	%f0, 1(%v1)
	flw	%f1, 1(%v0)
	addi	%v1, %zero, 148
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 1(%v1)
	addi	%v1, %zero, 151
	flw	%f0, 2(%v1)
	flw	%f1, 2(%v0)
	addi	%v0, %zero, 148
	flw	%f2, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 151
	fsw	%f0, 2(%v0)
	jr	%ra
do_without_neighbors.2995:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20262
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20263
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.20264
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	addi	%t0, %zero, 148
	fsw	%f0, 0(%t0)
	flw	%f0, 1(%a0)
	addi	%t0, %zero, 148
	fsw	%f0, 1(%t0)
	flw	%f0, 2(%a0)
	addi	%a0, %zero, 148
	fsw	%f0, 2(%a0)
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
	addi	%a0, %zero, 151
	flw	%f0, 0(%a0)
	flw	%f1, 0(%v1)
	addi	%a0, %zero, 148
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 151
	flw	%f0, 1(%a0)
	flw	%f1, 1(%v1)
	addi	%a0, %zero, 148
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 151
	flw	%f0, 2(%a0)
	flw	%f1, 2(%v1)
	addi	%v1, %zero, 148
	flw	%f2, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 151
	fsw	%f0, 2(%v1)
	j	bnei_cont.20265
bnei_else.20264:
bnei_cont.20265:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20266
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20267
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 3(%sp)
	beqi	%a0, 0, bnei_else.20268
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.20269
bnei_else.20268:
bnei_cont.20269:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2995
bgti_else.20267:
	jr	%ra
bgt_else.20266:
	jr	%ra
bgti_else.20263:
	jr	%ra
bgt_else.20262:
	jr	%ra
try_exploit_neighbors.3011:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.20274
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.20275
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20276
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20278
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20280
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.20282
	addi	%t1, %zero, 1
	j	beq_cont.20283
beq_else.20282:
	addi	%t1, %zero, 0
beq_cont.20283:
	j	beq_cont.20281
beq_else.20280:
	addi	%t1, %zero, 0
beq_cont.20281:
	j	beq_cont.20279
beq_else.20278:
	addi	%t1, %zero, 0
beq_cont.20279:
	j	beq_cont.20277
beq_else.20276:
	addi	%t1, %zero, 0
beq_cont.20277:
	beqi	%t1, 0, bnei_else.20284
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
	beqi	%t1, 0, bnei_else.20285
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.20286
bnei_else.20285:
bnei_cont.20286:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20287
	lw	%v0, 6(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20288
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 5(%sp)
	lw	%a1, 2(%a1)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	bne	%a1, %a0, beq_else.20289
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	add	%at, %a2, %a1
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.20291
	addi	%a3, %a1, -1
	lw	%t0, 2(%sp)
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.20293
	addi	%a3, %a1, 1
	add	%at, %t0, %a3
	lw	%a3, 0(%at)
	lw	%a3, 2(%a3)
	add	%at, %a3, %v1
	lw	%a3, 0(%at)
	bne	%a3, %a0, beq_else.20295
	addi	%a0, %zero, 1
	j	beq_cont.20296
beq_else.20295:
	addi	%a0, %zero, 0
beq_cont.20296:
	j	beq_cont.20294
beq_else.20293:
	addi	%a0, %zero, 0
beq_cont.20294:
	j	beq_cont.20292
beq_else.20291:
	addi	%a0, %zero, 0
beq_cont.20292:
	j	beq_cont.20290
beq_else.20289:
	addi	%a0, %zero, 0
beq_cont.20290:
	beqi	%a0, 0, bnei_else.20297
	lw	%v0, 3(%v0)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%v1, 8(%sp)
	beqi	%v0, 0, bnei_else.20298
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
	j	bnei_cont.20299
bnei_else.20298:
bnei_cont.20299:
	lw	%v0, 8(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 2(%sp)
	lw	%a2, 4(%sp)
	j	try_exploit_neighbors.3011
bnei_else.20297:
	j	do_without_neighbors.2995
bgti_else.20288:
	jr	%ra
bgt_else.20287:
	jr	%ra
bnei_else.20284:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.20302
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.20303
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 6(%sp)
	sw	%a3, 7(%sp)
	beqi	%v0, 0, bnei_else.20304
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.20305
bnei_else.20304:
bnei_cont.20305:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 6(%sp)
	j	do_without_neighbors.2995
bgti_else.20303:
	jr	%ra
bgt_else.20302:
	jr	%ra
bgti_else.20275:
	jr	%ra
bgt_else.20274:
	jr	%ra
write_rgb_element.3020:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20310
	blti	%v0, 0, bgti_else.20312
	j	bgti_cont.20313
bgti_else.20312:
	addi	%v0, %zero, 0
bgti_cont.20313:
	j	bgt_cont.20311
bgt_else.20310:
	addi	%v0, %zero, 255
bgt_cont.20311:
	sw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.20314
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.20316
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20318
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20320
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20322
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20324
	addi	%v1, %v1, -10
	addi	%a0, %zero, 6
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	j	bgti_cont.20325
bgti_else.20324:
	addi	%v0, %zero, 5
bgti_cont.20325:
	j	bgti_cont.20323
bgti_else.20322:
	addi	%v0, %zero, 4
bgti_cont.20323:
	j	bgti_cont.20321
bgti_else.20320:
	addi	%v0, %zero, 3
bgti_cont.20321:
	j	bgti_cont.20319
bgti_else.20318:
	addi	%v0, %zero, 2
bgti_cont.20319:
	j	bgti_cont.20317
bgti_else.20316:
	addi	%v0, %zero, 1
bgti_cont.20317:
	j	bgti_cont.20315
bgti_else.20314:
	addi	%v0, %zero, 0
bgti_cont.20315:
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	blti	%v1, 10, bgti_else.20326
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20328
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20330
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20332
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20334
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20336
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20338
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20340
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20342
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20344
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20346
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20348
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20350
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20352
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2625
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bgti_cont.20353
bgti_else.20352:
	add	%v0, %zero, %v1
bgti_cont.20353:
	j	bgti_cont.20351
bgti_else.20350:
	add	%v0, %zero, %v1
bgti_cont.20351:
	j	bgti_cont.20349
bgti_else.20348:
	add	%v0, %zero, %v1
bgti_cont.20349:
	j	bgti_cont.20347
bgti_else.20346:
	add	%v0, %zero, %v1
bgti_cont.20347:
	j	bgti_cont.20345
bgti_else.20344:
	add	%v0, %zero, %v1
bgti_cont.20345:
	j	bgti_cont.20343
bgti_else.20342:
	add	%v0, %zero, %v1
bgti_cont.20343:
	j	bgti_cont.20341
bgti_else.20340:
	add	%v0, %zero, %v1
bgti_cont.20341:
	j	bgti_cont.20339
bgti_else.20338:
	add	%v0, %zero, %v1
bgti_cont.20339:
	j	bgti_cont.20337
bgti_else.20336:
	add	%v0, %zero, %v1
bgti_cont.20337:
	j	bgti_cont.20335
bgti_else.20334:
	add	%v0, %zero, %v1
bgti_cont.20335:
	j	bgti_cont.20333
bgti_else.20332:
	add	%v0, %zero, %v1
bgti_cont.20333:
	j	bgti_cont.20331
bgti_else.20330:
	add	%v0, %zero, %v1
bgti_cont.20331:
	j	bgti_cont.20329
bgti_else.20328:
	add	%v0, %zero, %v1
bgti_cont.20329:
	j	bgti_cont.20327
bgti_else.20326:
	add	%v0, %zero, %v1
bgti_cont.20327:
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.20354
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.20354:
	sw	%v0, 2(%sp)
	blti	%v1, 10, bgti_else.20355
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.20357
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20359
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20361
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20363
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.20365
	addi	%a0, %a0, -10
	addi	%a1, %zero, 6
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2622
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bgti_cont.20366
bgti_else.20365:
	addi	%v0, %zero, 5
bgti_cont.20366:
	j	bgti_cont.20364
bgti_else.20363:
	addi	%v0, %zero, 4
bgti_cont.20364:
	j	bgti_cont.20362
bgti_else.20361:
	addi	%v0, %zero, 3
bgti_cont.20362:
	j	bgti_cont.20360
bgti_else.20359:
	addi	%v0, %zero, 2
bgti_cont.20360:
	j	bgti_cont.20358
bgti_else.20357:
	addi	%v0, %zero, 1
bgti_cont.20358:
	j	bgti_cont.20356
bgti_else.20355:
	addi	%v0, %zero, 0
bgti_cont.20356:
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	blti	%v1, 10, bgti_else.20367
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20369
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20371
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20373
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20375
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20377
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20379
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20381
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20383
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20385
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20387
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20389
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20391
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20393
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2625
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bgti_cont.20394
bgti_else.20393:
	add	%v0, %zero, %v1
bgti_cont.20394:
	j	bgti_cont.20392
bgti_else.20391:
	add	%v0, %zero, %v1
bgti_cont.20392:
	j	bgti_cont.20390
bgti_else.20389:
	add	%v0, %zero, %v1
bgti_cont.20390:
	j	bgti_cont.20388
bgti_else.20387:
	add	%v0, %zero, %v1
bgti_cont.20388:
	j	bgti_cont.20386
bgti_else.20385:
	add	%v0, %zero, %v1
bgti_cont.20386:
	j	bgti_cont.20384
bgti_else.20383:
	add	%v0, %zero, %v1
bgti_cont.20384:
	j	bgti_cont.20382
bgti_else.20381:
	add	%v0, %zero, %v1
bgti_cont.20382:
	j	bgti_cont.20380
bgti_else.20379:
	add	%v0, %zero, %v1
bgti_cont.20380:
	j	bgti_cont.20378
bgti_else.20377:
	add	%v0, %zero, %v1
bgti_cont.20378:
	j	bgti_cont.20376
bgti_else.20375:
	add	%v0, %zero, %v1
bgti_cont.20376:
	j	bgti_cont.20374
bgti_else.20373:
	add	%v0, %zero, %v1
bgti_cont.20374:
	j	bgti_cont.20372
bgti_else.20371:
	add	%v0, %zero, %v1
bgti_cont.20372:
	j	bgti_cont.20370
bgti_else.20369:
	add	%v0, %zero, %v1
bgti_cont.20370:
	j	bgti_cont.20368
bgti_else.20367:
	add	%v0, %zero, %v1
bgti_cont.20368:
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.20395
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.20395:
	sw	%v0, 4(%sp)
	blti	%v1, 10, bgti_else.20396
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20398
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20400
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20402
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20404
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20406
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20408
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20410
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20412
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20414
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20416
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20418
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20420
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.20422
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bgti_cont.20423
bgti_else.20422:
	add	%v0, %zero, %v1
bgti_cont.20423:
	j	bgti_cont.20421
bgti_else.20420:
	add	%v0, %zero, %v1
bgti_cont.20421:
	j	bgti_cont.20419
bgti_else.20418:
	add	%v0, %zero, %v1
bgti_cont.20419:
	j	bgti_cont.20417
bgti_else.20416:
	add	%v0, %zero, %v1
bgti_cont.20417:
	j	bgti_cont.20415
bgti_else.20414:
	add	%v0, %zero, %v1
bgti_cont.20415:
	j	bgti_cont.20413
bgti_else.20412:
	add	%v0, %zero, %v1
bgti_cont.20413:
	j	bgti_cont.20411
bgti_else.20410:
	add	%v0, %zero, %v1
bgti_cont.20411:
	j	bgti_cont.20409
bgti_else.20408:
	add	%v0, %zero, %v1
bgti_cont.20409:
	j	bgti_cont.20407
bgti_else.20406:
	add	%v0, %zero, %v1
bgti_cont.20407:
	j	bgti_cont.20405
bgti_else.20404:
	add	%v0, %zero, %v1
bgti_cont.20405:
	j	bgti_cont.20403
bgti_else.20402:
	add	%v0, %zero, %v1
bgti_cont.20403:
	j	bgti_cont.20401
bgti_else.20400:
	add	%v0, %zero, %v1
bgti_cont.20401:
	j	bgti_cont.20399
bgti_else.20398:
	add	%v0, %zero, %v1
bgti_cont.20399:
	j	bgti_cont.20397
bgti_else.20396:
	add	%v0, %zero, %v1
bgti_cont.20397:
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
	addi	%v0, %zero, 151
	flw	%f0, 0(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20424
	blti	%v0, 0, bgti_else.20426
	j	bgti_cont.20427
bgti_else.20426:
	addi	%v0, %zero, 0
bgti_cont.20427:
	j	bgt_cont.20425
bgt_else.20424:
	addi	%v0, %zero, 255
bgt_cont.20425:
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
	addi	%v0, %zero, 151
	flw	%f0, 1(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20428
	blti	%v0, 0, bgti_else.20430
	j	bgti_cont.20431
bgti_else.20430:
	addi	%v0, %zero, 0
bgti_cont.20431:
	j	bgt_cont.20429
bgt_else.20428:
	addi	%v0, %zero, 255
bgt_cont.20429:
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
	addi	%v0, %zero, 151
	flw	%f0, 2(%v0)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.20432
	blti	%v0, 0, bgti_else.20434
	j	bgti_cont.20435
bgti_else.20434:
	addi	%v0, %zero, 0
bgti_cont.20435:
	j	bgt_cont.20433
bgt_else.20432:
	addi	%v0, %zero, 255
bgt_cont.20433:
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int.2627
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3024:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20436
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20437
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.20438
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 464(%zero)
	addi	%a1, %zero, 148
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 2(%a1)
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
	addi	%a3, %zero, 162
	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a2)
	addi	%a3, %zero, 162
	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a2)
	addi	%a3, %zero, 162
	fsw	%f0, 2(%a3)
	addi	%a3, %zero, 0
	lw	%a3, 0(%a3)
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
	addi	%a1, %zero, 148
	flw	%f0, 0(%a1)
	fsw	%f0, 0(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 1(%a1)
	fsw	%f0, 1(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 2(%a1)
	fsw	%f0, 2(%v1)
	j	bnei_cont.20439
bnei_else.20438:
bnei_cont.20439:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.20440
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.20441
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.20442
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 464(%zero)
	addi	%a1, %zero, 148
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 2(%a1)
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
	addi	%a3, %zero, 162
	fsw	%f1, 0(%a3)
	flw	%f1, 1(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 1(%a3)
	flw	%f1, 2(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 2(%a3)
	addi	%a3, %zero, 0
	lw	%a3, 0(%a3)
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
	fblt	%f0, %f1, fbgt_else.20444
	addi	%a0, %zero, 0
	j	fbgt_cont.20445
fbgt_else.20444:
	addi	%a0, %zero, 1
fbgt_cont.20445:
	beqi	%a0, 0, bnei_else.20446
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20447
bnei_else.20446:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20447:
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
	addi	%a1, %zero, 148
	flw	%f0, 0(%a1)
	fsw	%f0, 0(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 1(%a1)
	fsw	%f0, 1(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 2(%a1)
	fsw	%f0, 2(%v1)
	j	bnei_cont.20443
bnei_else.20442:
bnei_cont.20443:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3024
bgti_else.20441:
	jr	%ra
bgt_else.20440:
	jr	%ra
bgti_else.20437:
	jr	%ra
bgt_else.20436:
	jr	%ra
pretrace_pixels.3027:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.20452
	addi	%a2, %zero, 158
	flw	%f3, 0(%a2)
	addi	%a2, %zero, 156
	lw	%a2, 0(%a2)
	sub	%a2, %v1, %a2
	itof	%f4, %a2
	fmul	%f3, %f3, %f4
	addi	%a2, %zero, 165
	flw	%f4, 0(%a2)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	addi	%a2, %zero, 174
	fsw	%f4, 0(%a2)
	addi	%a2, %zero, 1
	addi	%a3, %zero, 165
	flw	%f4, 1(%a3)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	addi	%a3, %zero, 174
	fsw	%f4, 1(%a3)
	addi	%a3, %zero, 165
	flw	%f4, 2(%a3)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f3, %f2
	addi	%a3, %zero, 174
	fsw	%f3, 2(%a3)
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
	flw	%f1, 464(%zero)
	addi	%v0, %zero, 151
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 151
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 151
	fsw	%f1, 2(%v0)
	addi	%v0, %zero, 75
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 75
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 75
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 159
	fsw	%f0, 2(%v0)
	flw	%f0, 468(%zero)
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
	addi	%a0, %zero, 151
	flw	%f0, 0(%a0)
	fsw	%f0, 0(%v1)
	addi	%a0, %zero, 151
	flw	%f0, 1(%a0)
	fsw	%f0, 1(%v1)
	addi	%a0, %zero, 151
	flw	%f0, 2(%a0)
	fsw	%f0, 2(%v1)
	lw	%v1, 6(%v0)
	lw	%a0, 4(%sp)
	sw	%a0, 0(%v1)
	lw	%v1, 2(%v0)
	lw	%v1, 0(%v1)
	blti	%v1, 0, bgti_else.20453
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.20455
	lw	%v1, 6(%v0)
	lw	%v1, 0(%v1)
	addi	%a1, %zero, 148
	flw	%f0, 8(%sp)
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 1(%a1)
	addi	%a1, %zero, 148
	fsw	%f0, 2(%a1)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	addi	%a3, %zero, 179
	add	%at, %a3, %v1
	lw	%v1, 0(%at)
	lw	%a1, 0(%a1)
	lw	%a2, 0(%a2)
	flw	%f1, 0(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 0(%a3)
	flw	%f1, 1(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 1(%a3)
	flw	%f1, 2(%a2)
	addi	%a3, %zero, 162
	fsw	%f1, 2(%a3)
	addi	%a3, %zero, 0
	lw	%a3, 0(%a3)
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
	fblt	%f0, %f1, fbgt_else.20457
	addi	%a0, %zero, 0
	j	fbgt_cont.20458
fbgt_else.20457:
	addi	%a0, %zero, 1
fbgt_cont.20458:
	beqi	%a0, 0, bnei_else.20459
	lw	%v1, 119(%v0)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.20460
bnei_else.20459:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bnei_cont.20460:
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
	addi	%a0, %zero, 148
	flw	%f0, 0(%a0)
	fsw	%f0, 0(%v1)
	addi	%a0, %zero, 148
	flw	%f0, 1(%a0)
	fsw	%f0, 1(%v1)
	addi	%a0, %zero, 148
	flw	%f0, 2(%a0)
	fsw	%f0, 2(%v1)
	j	bnei_cont.20456
bnei_else.20455:
bnei_cont.20456:
	lw	%v1, 3(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	pretrace_diffuse_rays.3024
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.20454
bgti_else.20453:
bgti_cont.20454:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.20461
	addi	%a0, %v0, -5
	j	bgti_cont.20462
bgti_else.20461:
	add	%a0, %zero, %v0
bgti_cont.20462:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 7(%sp)
	j	pretrace_pixels.3027
bgti_else.20452:
	jr	%ra
scan_pixel.3038:
	addi	%a3, %zero, 0
	addi	%t0, %zero, 154
	lw	%t0, 0(%t0)
	blt	%v0, %t0, bgt_else.20464
	jr	%ra
bgt_else.20464:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%t2, 0(%t1)
	flw	%f0, 0(%t2)
	addi	%t3, %zero, 151
	fsw	%f0, 0(%t3)
	addi	%t3, %zero, 1
	flw	%f0, 1(%t2)
	addi	%t4, %zero, 151
	fsw	%f0, 1(%t4)
	flw	%f0, 2(%t2)
	addi	%t2, %zero, 151
	fsw	%f0, 2(%t2)
	addi	%t2, %zero, 154
	lw	%t2, 1(%t2)
	addi	%t4, %v1, 1
	blt	%t4, %t2, bgt_else.20466
	addi	%t5, %zero, 0
	j	bgt_cont.20467
bgt_else.20466:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.20468
	addi	%t5, %zero, 0
	j	bgt_cont.20469
bgt_else.20468:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.20470
	addi	%t5, %zero, 0
	j	bgt_cont.20471
bgt_else.20470:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20472
	addi	%t5, %zero, 0
	j	bgt_cont.20473
bgt_else.20472:
	addi	%t5, %zero, 1
bgt_cont.20473:
bgt_cont.20471:
bgt_cont.20469:
bgt_cont.20467:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%t4, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%v0, 8(%sp)
	beqi	%t5, 0, bnei_else.20474
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.20476
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20478
	add	%at, %a2, %v0
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20480
	addi	%t6, %v0, -1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20482
	addi	%t6, %v0, 1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 2(%t6)
	lw	%t6, 0(%t6)
	bne	%t6, %t5, beq_else.20484
	addi	%t5, %zero, 1
	j	beq_cont.20485
beq_else.20484:
	addi	%t5, %zero, 0
beq_cont.20485:
	j	beq_cont.20483
beq_else.20482:
	addi	%t5, %zero, 0
beq_cont.20483:
	j	beq_cont.20481
beq_else.20480:
	addi	%t5, %zero, 0
beq_cont.20481:
	j	beq_cont.20479
beq_else.20478:
	addi	%t5, %zero, 0
beq_cont.20479:
	beqi	%t5, 0, bnei_else.20486
	lw	%t1, 3(%t1)
	lw	%t1, 0(%t1)
	sw	%t3, 9(%sp)
	beqi	%t1, 0, bnei_else.20488
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	addi	%a1, %a2, 0
	addi	%a2, %a3, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.20489
bnei_else.20488:
bnei_cont.20489:
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
	j	bnei_cont.20487
bnei_else.20486:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20487:
	j	bgti_cont.20477
bgti_else.20476:
bgti_cont.20477:
	j	bnei_cont.20475
bnei_else.20474:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.20490
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.20492
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.20493
bnei_else.20492:
bnei_cont.20493:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.20491
bgti_else.20490:
bgti_cont.20491:
bnei_cont.20475:
	addi	%v0, %zero, 151
	flw	%f0, 0(%v0)
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
	addi	%v0, %zero, 151
	flw	%f0, 1(%v0)
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
	addi	%v0, %zero, 151
	flw	%f0, 2(%v0)
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
	blt	%v0, %v1, bgt_else.20494
	jr	%ra
bgt_else.20494:
	lw	%a1, 6(%sp)
	add	%at, %a1, %v0
	lw	%a0, 0(%at)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a2)
	addi	%a2, %zero, 151
	fsw	%f0, 2(%a2)
	lw	%a2, 4(%sp)
	lw	%a3, 5(%sp)
	blt	%a2, %a3, bgt_else.20496
	addi	%v1, %zero, 0
	j	bgt_cont.20497
bgt_else.20496:
	lw	%a2, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.20498
	addi	%v1, %zero, 0
	j	bgt_cont.20499
bgt_else.20498:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.20500
	addi	%v1, %zero, 0
	j	bgt_cont.20501
bgt_else.20500:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20502
	addi	%v1, %zero, 0
	j	bgt_cont.20503
bgt_else.20502:
	addi	%v1, %zero, 1
bgt_cont.20503:
bgt_cont.20501:
bgt_cont.20499:
bgt_cont.20497:
	sw	%v0, 12(%sp)
	beqi	%v1, 0, bnei_else.20504
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 2(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bnei_cont.20505
bnei_else.20504:
	lw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
bnei_cont.20505:
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
	addi	%t0, %zero, 154
	lw	%t0, 1(%t0)
	blt	%v0, %t0, bgt_else.20506
	jr	%ra
bgt_else.20506:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.20508
	j	bgt_cont.20509
bgt_else.20508:
	addi	%t2, %v0, 1
	addi	%t3, %zero, 158
	flw	%f0, 0(%t3)
	addi	%t3, %zero, 156
	lw	%t3, 1(%t3)
	sub	%t2, %t2, %t3
	itof	%f1, %t2
	fmul	%f0, %f0, %f1
	addi	%t2, %zero, 168
	flw	%f1, 0(%t2)
	fmul	%f1, %f0, %f1
	addi	%t2, %zero, 171
	flw	%f2, 0(%t2)
	fadd	%f1, %f1, %f2
	addi	%t2, %zero, 168
	flw	%f2, 1(%t2)
	fmul	%f2, %f0, %f2
	addi	%t2, %zero, 171
	flw	%f3, 1(%t2)
	fadd	%f2, %f2, %f3
	addi	%t2, %zero, 168
	flw	%f3, 2(%t2)
	fmul	%f0, %f0, %f3
	addi	%t2, %zero, 171
	flw	%f3, 2(%t2)
	fadd	%f0, %f0, %f3
	addi	%t2, %zero, 154
	lw	%t2, 0(%t2)
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
bgt_cont.20509:
	addi	%v1, %zero, 0
	addi	%v0, %zero, 154
	lw	%v0, 0(%v0)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20510
	j	bgt_cont.20511
bgt_else.20510:
	lw	%a1, 7(%sp)
	lw	%a0, 0(%a1)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a2)
	addi	%a3, %zero, 151
	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a2)
	addi	%a2, %zero, 151
	fsw	%f0, 2(%a2)
	lw	%a2, 6(%sp)
	addi	%a3, %a2, 1
	lw	%t0, 5(%sp)
	blt	%a3, %t0, bgt_else.20512
	addi	%a3, %zero, 0
	j	bgt_cont.20513
bgt_else.20512:
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.20514
	addi	%a3, %zero, 0
	j	bgt_cont.20515
bgt_else.20514:
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.20516
	addi	%a3, %zero, 0
	j	bgt_cont.20517
bgt_else.20516:
	addi	%a3, %zero, 0
bgt_cont.20517:
bgt_cont.20515:
bgt_cont.20513:
	beqi	%a3, 0, bnei_else.20518
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
	j	bnei_cont.20519
bnei_else.20518:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.20519:
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
bgt_cont.20511:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.20520
	addi	%a0, %v0, -5
	j	bgti_cont.20521
bgti_else.20520:
	add	%a0, %zero, %v0
bgti_cont.20521:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.20522
	jr	%ra
bgt_else.20522:
	lw	%v0, 0(%sp)
	sw	%a0, 10(%sp)
	sw	%v1, 11(%sp)
	blt	%v1, %v0, bgt_else.20524
	j	bgt_cont.20525
bgt_else.20524:
	addi	%v0, %v1, 1
	addi	%a1, %zero, 158
	flw	%f0, 0(%a1)
	addi	%a1, %zero, 156
	lw	%a1, 1(%a1)
	sub	%v0, %v0, %a1
	itof	%f1, %v0
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 168
	flw	%f1, 0(%v0)
	fmul	%f1, %f0, %f1
	addi	%v0, %zero, 171
	flw	%f2, 0(%v0)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 168
	flw	%f2, 1(%v0)
	fmul	%f2, %f0, %f2
	addi	%v0, %zero, 171
	flw	%f3, 1(%v0)
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 168
	flw	%f3, 2(%v0)
	fmul	%f0, %f0, %f3
	addi	%v0, %zero, 171
	flw	%f3, 2(%v0)
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
bgt_cont.20525:
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
	blti	%v1, 5, bgti_else.20526
	addi	%a2, %v1, -5
	j	bgti_cont.20527
bgti_else.20526:
	add	%a2, %zero, %v1
bgti_cont.20527:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	j	scan_line.3044
create_pixel.3052:
	addi	%v0, %zero, 3
	flw	%f0, 464(%zero)
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
	blti	%v1, 0, bgti_else.20528
	addi	%a1, %zero, 3
	flw	%f0, 464(%zero)
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
	blti	%v0, 0, bgti_else.20529
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
	blti	%v0, 0, bgti_else.20530
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
	blti	%v0, 0, bgti_else.20531
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
bgti_else.20531:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.20530:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.20529:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.20528:
	jr	%ra
calc_dirvec.3064:
	blti	%v0, 5, bgti_else.20532
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 468(%zero)
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
bgti_else.20532:
	fmul	%f0, %f1, %f1
	flw	%f1, 439(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 468(%zero)
	fdiv	%f5, %f4, %f0
	flw	%f6, 464(%zero)
	fblt	%f5, %f6, fbgt_else.20534
	addi	%a1, %zero, 1
	j	fbgt_cont.20535
fbgt_else.20534:
	addi	%a1, %zero, 0
fbgt_cont.20535:
	fabs	%f7, %f5
	flw	%f8, 452(%zero)
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
	fblt	%f7, %f8, fbgt_else.20536
	flw	%f5, 451(%zero)
	sw	%a1, 10(%sp)
	fblt	%f7, %f5, fbgt_else.20538
	flw	%f5, 473(%zero)
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
	j	fbgt_cont.20539
fbgt_else.20538:
	flw	%f5, 472(%zero)
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
fbgt_cont.20539:
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.20540
	j	bnei_cont.20541
bnei_else.20540:
	fneg	%f0, %f0
bnei_cont.20541:
	j	fbgt_cont.20537
fbgt_else.20536:
	fmov	%f0, %f5
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	kernel_atan.2612
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
fbgt_cont.20537:
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
	fblt	%f3, %f4, fbgt_else.20542
	addi	%v1, %zero, 1
	j	fbgt_cont.20543
fbgt_else.20542:
	addi	%v1, %zero, 0
fbgt_cont.20543:
	fabs	%f4, %f3
	flw	%f5, 3(%sp)
	fsw	%f0, 15(%sp)
	sw	%v0, 16(%sp)
	fsw	%f1, 17(%sp)
	fblt	%f4, %f5, fbgt_else.20544
	flw	%f3, 451(%zero)
	sw	%v1, 18(%sp)
	fblt	%f4, %f3, fbgt_else.20546
	flw	%f3, 473(%zero)
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
	j	fbgt_cont.20547
fbgt_else.20546:
	flw	%f3, 472(%zero)
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
fbgt_cont.20547:
	lw	%v0, 18(%sp)
	beqi	%v0, 0, bnei_else.20548
	j	bnei_cont.20549
bnei_else.20548:
	fneg	%f0, %f0
bnei_cont.20549:
	j	fbgt_cont.20545
fbgt_else.20544:
	fmov	%f0, %f3
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	kernel_atan.2612
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
fbgt_cont.20545:
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
	blti	%v0, 0, bgti_else.20550
	itof	%f1, %v0
	flw	%f2, 496(%zero)
	fmul	%f1, %f1, %f2
	flw	%f3, 436(%zero)
	fsub	%f1, %f1, %f3
	flw	%f4, 464(%zero)
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
	jal	calc_dirvec.3064
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 3(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.20551
	addi	%v1, %v1, -5
	j	bgti_cont.20552
bgti_else.20551:
bgti_cont.20552:
	blti	%v0, 0, bgti_else.20553
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
	blti	%v1, 5, bgti_else.20554
	addi	%v1, %v1, -5
	j	bgti_cont.20555
bgti_else.20554:
bgti_cont.20555:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3072
bgti_else.20553:
	jr	%ra
bgti_else.20550:
	jr	%ra
calc_dirvec_rows.3077:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.20558
	itof	%f0, %v0
	flw	%f1, 496(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 436(%zero)
	fsub	%f3, %f0, %f2
	addi	%a2, %zero, 4
	itof	%f0, %a2
	fmul	%f0, %f0, %f1
	fsub	%f0, %f0, %f2
	flw	%f4, 464(%zero)
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
	jal	calc_dirvec.3064
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
	jal	calc_dirvec.3064
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 4(%sp)
	addi	%a0, %v1, 1
	blti	%a0, 5, bgti_else.20559
	addi	%a0, %a0, -5
	j	bgti_cont.20560
bgti_else.20559:
bgti_cont.20560:
	flw	%f0, 2(%sp)
	lw	%a1, 6(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvecs.3072
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 4(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.20561
	addi	%v1, %v1, -5
	j	bgti_cont.20562
bgti_else.20561:
bgti_cont.20562:
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.20563
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
	jal	calc_dirvecs.3072
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.20564
	addi	%v1, %v1, -5
	j	bgti_cont.20565
bgti_else.20564:
bgti_cont.20565:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3077
bgti_else.20563:
	jr	%ra
bgti_else.20558:
	jr	%ra
create_dirvec_elements.3083:
	blti	%v1, 0, bgti_else.20568
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
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
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
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
	blti	%v0, 0, bgti_else.20569
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
	blti	%v0, 0, bgti_else.20570
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
	blti	%v0, 0, bgti_else.20571
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
bgti_else.20571:
	jr	%ra
bgti_else.20570:
	jr	%ra
bgti_else.20569:
	jr	%ra
bgti_else.20568:
	jr	%ra
create_dirvecs.3086:
	blti	%v0, 0, bgti_else.20576
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
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
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
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
	blti	%v0, 0, bgti_else.20577
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
bgti_else.20577:
	jr	%ra
bgti_else.20576:
	jr	%ra
init_dirvec_constants.3088:
	blti	%v1, 0, bgti_else.20580
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
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
	blti	%v0, 0, bgti_else.20581
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.20582
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.20584
	beqi	%t1, 2, bnei_else.20586
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
	j	bnei_cont.20587
bnei_else.20586:
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
bnei_cont.20587:
	j	bnei_cont.20585
bnei_else.20584:
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
bnei_cont.20585:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.20583
bgti_else.20582:
bgti_cont.20583:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20588
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
	blti	%v0, 0, bgti_else.20589
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 7(%sp)
	blti	%a1, 0, bgti_else.20590
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.20592
	beqi	%t1, 2, bnei_else.20594
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
	j	bnei_cont.20595
bnei_else.20594:
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
bnei_cont.20595:
	j	bnei_cont.20593
bnei_else.20592:
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
bnei_cont.20593:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.20591
bgti_else.20590:
bgti_cont.20591:
	lw	%v0, 7(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	init_dirvec_constants.3088
bgti_else.20589:
	jr	%ra
bgti_else.20588:
	jr	%ra
bgti_else.20581:
	jr	%ra
bgti_else.20580:
	jr	%ra
init_vecset_constants.3091:
	blti	%v0, 0, bgti_else.20600
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 119
	lw	%a1, 119(%v1)
	addi	%a2, %zero, 0
	lw	%a2, 0(%a2)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v1, 3(%sp)
	blti	%a2, 0, bgti_else.20601
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.20603
	beqi	%t2, 2, bnei_else.20605
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
	j	bnei_cont.20606
bnei_else.20605:
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
bnei_cont.20606:
	j	bnei_cont.20604
bnei_else.20603:
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
bnei_cont.20604:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bgti_cont.20602
bgti_else.20601:
bgti_cont.20602:
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
	blti	%a1, 0, bgti_else.20607
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 8(%sp)
	beqi	%t1, 1, bnei_else.20609
	beqi	%t1, 2, bnei_else.20611
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
	j	bnei_cont.20612
bnei_else.20611:
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
bnei_cont.20612:
	j	bnei_cont.20610
bnei_else.20609:
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
bnei_cont.20610:
	addi	%v0, %v1, -1
	lw	%a0, 8(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bgti_cont.20608
bgti_else.20607:
bgti_cont.20608:
	addi	%v1, %zero, 116
	lw	%v0, 3(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20613
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
	blti	%a0, 0, bgti_else.20614
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 12(%sp)
	beqi	%t0, 1, bnei_else.20616
	beqi	%t0, 2, bnei_else.20618
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
	j	bnei_cont.20619
bnei_else.20618:
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
bnei_cont.20619:
	j	bnei_cont.20617
bnei_else.20616:
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
bnei_cont.20617:
	addi	%v0, %v1, -1
	lw	%a0, 12(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.20615
bgti_else.20614:
bgti_cont.20615:
	lw	%v0, 11(%sp)
	lw	%v1, 7(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20620
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 14(%sp)
	sw	%v1, 15(%sp)
	blti	%a1, 0, bgti_else.20621
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 16(%sp)
	beqi	%t1, 1, bnei_else.20623
	beqi	%t1, 2, bnei_else.20625
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
	j	bnei_cont.20626
bnei_else.20625:
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
bnei_cont.20626:
	j	bnei_cont.20624
bnei_else.20623:
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
bnei_cont.20624:
	addi	%v1, %v1, -1
	lw	%v0, 16(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.20622
bgti_else.20621:
bgti_cont.20622:
	lw	%v0, 15(%sp)
	lw	%v1, 6(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 14(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.20627
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
bgti_else.20627:
	jr	%ra
bgti_else.20620:
	jr	%ra
bgti_else.20613:
	jr	%ra
bgti_else.20600:
	jr	%ra
setup_rect_reflection.3102:
	sll	%v0, %v0, 2
	addi	%a0, %zero, 434
	lw	%a0, 0(%a0)
	flw	%f0, 468(%zero)
	lw	%v1, 7(%v1)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 78
	flw	%f1, 0(%v1)
	fneg	%f2, %f1
	addi	%v1, %zero, 78
	flw	%f3, 1(%v1)
	fneg	%f4, %f3
	addi	%v1, %zero, 78
	flw	%f5, 2(%v1)
	fneg	%f6, %f5
	addi	%v1, %v0, 1
	addi	%a1, %zero, 3
	flw	%f7, 464(%zero)
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
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
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
	blti	%a2, 0, bgti_else.20632
	addi	%a3, %zero, 12
	add	%at, %a3, %a2
	lw	%a3, 0(%at)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.20634
	beqi	%t0, 2, bnei_else.20636
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
	j	bnei_cont.20637
bnei_else.20636:
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
bnei_cont.20637:
	j	bnei_cont.20635
bnei_else.20634:
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
bnei_cont.20635:
	addi	%v0, %v1, -1
	lw	%a0, 15(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.20633
bgti_else.20632:
bgti_cont.20633:
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
	blti	%a1, 0, bgti_else.20638
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20640
	beqi	%a3, 2, bnei_else.20642
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
	j	bnei_cont.20643
bnei_else.20642:
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
bnei_cont.20643:
	j	bnei_cont.20641
bnei_else.20640:
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
bnei_cont.20641:
	addi	%v0, %v1, -1
	lw	%a0, 20(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.20639
bgti_else.20638:
bgti_cont.20639:
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
	blti	%a1, 0, bgti_else.20644
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20646
	beqi	%a3, 2, bnei_else.20648
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
	j	bnei_cont.20649
bnei_else.20648:
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
bnei_cont.20649:
	j	bnei_cont.20647
bnei_else.20646:
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
bnei_cont.20647:
	addi	%v1, %v1, -1
	lw	%v0, 25(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.20645
bgti_else.20644:
bgti_cont.20645:
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
	addi	%v1, %zero, 434
	sw	%v0, 0(%v1)
	jr	%ra
setup_surface_reflection.3105:
	sll	%v0, %v0, 2
	addi	%v0, %v0, 1
	addi	%a0, %zero, 434
	lw	%a0, 0(%a0)
	flw	%f0, 468(%zero)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	fsub	%f0, %f0, %f1
	lw	%a1, 4(%v1)
	addi	%a2, %zero, 78
	flw	%f1, 0(%a2)
	flw	%f2, 0(%a1)
	fmul	%f2, %f1, %f2
	addi	%a2, %zero, 78
	flw	%f3, 1(%a2)
	flw	%f4, 1(%a1)
	fmul	%f4, %f3, %f4
	fadd	%f2, %f2, %f4
	addi	%a2, %zero, 78
	flw	%f4, 2(%a2)
	flw	%f5, 2(%a1)
	fmul	%f5, %f4, %f5
	fadd	%f2, %f2, %f5
	flw	%f5, 491(%zero)
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
	flw	%f4, 464(%zero)
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
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
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
	blti	%a1, 0, bgti_else.20651
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a2)
	beqi	%a3, 1, bnei_else.20653
	beqi	%a3, 2, bnei_else.20655
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
	j	bnei_cont.20656
bnei_else.20655:
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
bnei_cont.20656:
	j	bnei_cont.20654
bnei_else.20653:
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
bnei_cont.20654:
	addi	%v1, %v1, -1
	lw	%v0, 8(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.20652
bgti_else.20651:
bgti_cont.20652:
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
	addi	%v1, %zero, 434
	sw	%v0, 0(%v1)
	jr	%ra
rt.3110:
	addi	%a0, %zero, 0
	addi	%a1, %zero, 154
	sw	%v0, 0(%a1)
	addi	%a1, %zero, 1
	addi	%a2, %zero, 154
	sw	%v1, 1(%a2)
	addi	%a2, %zero, 2
	srl	%a3, %v0, 1
	addi	%t0, %zero, 156
	sw	%a3, 0(%t0)
	srl	%v1, %v1, 1
	addi	%a3, %zero, 156
	sw	%v1, 1(%a3)
	flw	%f0, 435(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 158
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 154
	lw	%v0, 0(%v0)
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
	blti	%a0, 0, bgti_else.20658
	addi	%a1, %zero, 3
	flw	%f0, 464(%zero)
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
	blti	%v0, 0, bgti_else.20660
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
	j	bgti_cont.20661
bgti_else.20660:
	add	%v0, %zero, %a0
bgti_cont.20661:
	j	bgti_cont.20659
bgti_else.20658:
bgti_cont.20659:
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
	blti	%v1, 0, bgti_else.20662
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
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
	blti	%v0, 0, bgti_else.20664
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
	j	bgti_cont.20665
bgti_else.20664:
	add	%v0, %zero, %a0
bgti_cont.20665:
	j	bgti_cont.20663
bgti_else.20662:
bgti_cont.20663:
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
	blti	%v1, 0, bgti_else.20666
	addi	%a0, %zero, 3
	flw	%f0, 464(%zero)
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
	blti	%v0, 0, bgti_else.20668
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
	j	bgti_cont.20669
bgti_else.20668:
	add	%v0, %zero, %a0
bgti_cont.20669:
	j	bgti_cont.20667
bgti_else.20666:
bgti_cont.20667:
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
	flw	%f1, 462(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 47(%sp)
	fsw	%f1, 48(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	sin.2618
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 1(%v0)
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
	addi	%v0, %zero, 78
	fsw	%f0, 0(%v0)
	flw	%f0, 49(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	cos.2616
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	flw	%f1, 50(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 2(%v0)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	min_caml_read_float
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	addi	%v0, %zero, 81
	fsw	%f0, 0(%v0)
	lw	%v0, 2(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2763
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20670
	lw	%v0, 1(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2763
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20672
	lw	%v0, 0(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	read_nth_object.2763
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	beqi	%v0, 0, bnei_else.20674
	addi	%v0, %zero, 3
	sw	%v0, 51(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	read_nth_object.2763
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	beqi	%v0, 0, bnei_else.20676
	addi	%v0, %zero, 4
	sw	%v0, 52(%sp)
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	read_nth_object.2763
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	beqi	%v0, 0, bnei_else.20678
	addi	%v0, %zero, 5
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	read_object.2765
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	bnei_cont.20679
bnei_else.20678:
	addi	%v0, %zero, 0
	lw	%v1, 52(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20679:
	j	bnei_cont.20677
bnei_else.20676:
	addi	%v0, %zero, 0
	lw	%v1, 51(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20677:
	j	bnei_cont.20675
bnei_else.20674:
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20675:
	j	bnei_cont.20673
bnei_else.20672:
	addi	%v0, %zero, 0
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20673:
	j	bnei_cont.20671
bnei_else.20670:
	addi	%v0, %zero, 0
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
bnei_cont.20671:
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	min_caml_read_int
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.20680
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
	j	bnei_cont.20681
bnei_else.20680:
	lw	%v0, 1(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	min_caml_create_array
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
bnei_cont.20681:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.20682
	addi	%v1, %zero, 83
	sw	%v0, 0(%v1)
	lw	%v0, 2(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_net_item.2769
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.20684
	addi	%v1, %zero, 83
	sw	%v0, 1(%v1)
	lw	%v0, 0(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_and_network.2773
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	j	bnei_cont.20685
bnei_else.20684:
bnei_cont.20685:
	j	bnei_cont.20683
bnei_else.20682:
bnei_cont.20683:
	lw	%v0, 2(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	read_or_network.2771
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	addi	%v1, %zero, 134
	sw	%v0, 0(%v1)
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
	addi	%v0, %zero, 154
	lw	%v0, 1(%v0)
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
	addi	%v0, %zero, 179
	lw	%v0, 4(%v0)
	addi	%v1, %zero, 119
	lw	%a0, 119(%v0)
	addi	%a1, %zero, 0
	lw	%a1, 0(%a1)
	addi	%a1, %a1, -1
	sw	%a1, 58(%sp)
	sw	%v1, 59(%sp)
	sw	%v0, 60(%sp)
	blti	%a1, 0, bgti_else.20686
	addi	%a2, %zero, 12
	add	%at, %a2, %a1
	lw	%a2, 0(%at)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 61(%sp)
	beqi	%t1, 1, bnei_else.20688
	beqi	%t1, 2, bnei_else.20690
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
	j	bnei_cont.20691
bnei_else.20690:
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
bnei_cont.20691:
	j	bnei_cont.20689
bnei_else.20688:
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
bnei_cont.20689:
	addi	%v0, %v1, -1
	lw	%a0, 61(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	j	bgti_cont.20687
bgti_else.20686:
bgti_cont.20687:
	addi	%v1, %zero, 118
	lw	%v0, 60(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	addi	%v0, %zero, 179
	lw	%v0, 3(%v0)
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
	addi	%v0, %zero, 78
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 184
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 78
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 184
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 78
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 184
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 247
	lw	%v1, 58(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	iter_setup_dirvec_constants.2870
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	lw	%v0, 58(%sp)
	blti	%v0, 0, bgti_else.20692
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.20694
	j	bnei_cont.20695
bnei_else.20694:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 468(%zero)
	fblt	%f0, %f1, fbgt_else.20696
	addi	%a0, %zero, 0
	j	fbgt_cont.20697
fbgt_else.20696:
	addi	%a0, %zero, 1
fbgt_cont.20697:
	beqi	%a0, 0, bnei_else.20698
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.20700
	beqi	%a0, 2, bnei_else.20702
	j	bnei_cont.20703
bnei_else.20702:
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_surface_reflection.3105
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
bnei_cont.20703:
	j	bnei_cont.20701
bnei_else.20700:
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	setup_rect_reflection.3102
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
bnei_cont.20701:
	j	bnei_cont.20699
bnei_else.20698:
bnei_cont.20699:
bnei_cont.20695:
	j	bgti_cont.20693
bgti_else.20692:
bgti_cont.20693:
	addi	%v0, %zero, 158
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 156
	lw	%v0, 1(%v0)
	lw	%a0, 2(%sp)
	sub	%v1, %a0, %v0
	itof	%f1, %v1
	fmul	%f1, %f0, %f1
	addi	%v1, %zero, 168
	flw	%f2, 0(%v1)
	fmul	%f3, %f1, %f2
	addi	%v1, %zero, 171
	flw	%f4, 0(%v1)
	fadd	%f3, %f3, %f4
	addi	%v1, %zero, 168
	flw	%f5, 1(%v1)
	fmul	%f6, %f1, %f5
	addi	%v1, %zero, 171
	flw	%f7, 1(%v1)
	fadd	%f6, %f6, %f7
	addi	%v1, %zero, 168
	flw	%f8, 2(%v1)
	fmul	%f1, %f1, %f8
	addi	%v1, %zero, 171
	flw	%f9, 2(%v1)
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
	blt	%at, %v0, bgt_else.20704
	jr	%ra
bgt_else.20704:
	addi	%v0, %v0, -1
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.20706
	j	bgt_cont.20707
bgt_else.20706:
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
bgt_cont.20707:
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
	flw	%f0, 464(%zero)
	addi	%v1, %zero, 1
	lw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 60
	addi	%a0, %zero, 1
	sw	%v0, 10(%a0)
	sw	%v0, 9(%a0)
	sw	%v0, 8(%a0)
	sw	%v0, 7(%a0)
	lw	%a1, 1(%sp)
	sw	%a1, 6(%a0)
	sw	%v0, 5(%a0)
	sw	%v0, 4(%a0)
	sw	%a1, 3(%a0)
	sw	%a1, 2(%a0)
	sw	%a1, 1(%a0)
	sw	%a1, 0(%a0)
	add	%v0, %zero, %a0
	addi	%a0, %zero, 12
	addi	%v0, %zero, 1
	sw	%v1, 3(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
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
	flw	%f0, 447(%zero)
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
	addi	%v0, %zero, 83
	lw	%v1, 0(%v0)
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
	flw	%f0, 456(%zero)
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
	addi	%v1, %zero, 177
	sw	%v0, 1(%v1)
	lw	%v0, 7(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
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
	addi	%v1, %zero, 247
	sw	%v0, 1(%v1)
	lw	%v0, 8(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
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
	sw	%v0, 1(%v1)
	lw	%v0, 9(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	addi	%a0, %zero, 251
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%a0)
	sw	%v0, 1(%a0)
	lw	%v0, 1(%sp)
	sw	%v0, 0(%a0)
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
