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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.889
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.890
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.891
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.892
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.893
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.894
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.895
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.896
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.897
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.898
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.899
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.900
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.901
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.902
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.903
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.904
	flw	%f2, 28(%zero)
	fmul	%f1, %f2, %f1
	j	f.297.479
beq_else.904:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.903:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.902:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.901:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.900:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.899:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.898:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.897:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.896:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.895:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.894:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.893:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.892:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.891:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.890:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.889:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.301.483:
	flw	%f2, 1(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.905
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.906
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.907
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.908
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.909
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.910
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.911
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.912
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.912:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.911:
	jr	%ra
beq_else.910:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.913
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.914
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.914:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.913:
	jr	%ra
beq_else.909:
	jr	%ra
beq_else.908:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.915
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.916
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.917
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.918
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.918:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.917:
	jr	%ra
beq_else.916:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.919
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.920
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.920:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.919:
	jr	%ra
beq_else.915:
	jr	%ra
beq_else.907:
	jr	%ra
beq_else.906:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.921
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.922
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.923
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.924
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.925
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.926
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.926:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.925:
	jr	%ra
beq_else.924:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.927
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.928
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.928:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.927:
	jr	%ra
beq_else.923:
	jr	%ra
beq_else.922:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.929
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.930
	fsub	%f0, %f0, %f1
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.931
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.932
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.932:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.931:
	jr	%ra
beq_else.930:
	flw	%f3, 28(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.933
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.934
	fsub	%f0, %f0, %f1
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.934:
	flw	%f2, 28(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.933:
	jr	%ra
beq_else.929:
	jr	%ra
beq_else.921:
	jr	%ra
beq_else.905:
	jr	%ra
sin.224:
	flw	%f1, 27(%zero)
	flw	%f2, 26(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.935
	addi	%v0, %zero, 1
	j	beq_cont.936
beq_else.935:
	addi	%v0, %zero, 0
beq_cont.936:
	fabs	%f0, %f0
	flw	%f2, 25(%zero)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f2, 3(%sp)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.937
	flw	%f3, 24(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.939
	flw	%f3, 23(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.941
	flw	%f3, 22(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.943
	flw	%f3, 21(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.945
	flw	%f3, 20(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.947
	flw	%f3, 19(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.949
	flw	%f3, 18(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.951
	flw	%f3, 17(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.953
	flw	%f3, 16(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.955
	flw	%f3, 15(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.957
	flw	%f3, 14(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.959
	flw	%f3, 13(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.961
	flw	%f3, 12(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.963
	flw	%f3, 11(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.965
	flw	%f3, 10(%zero)
	fadd	%f1, %f3, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	f.297.479
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.966
beq_else.965:
	fadd	%f0, %fzero, %f3
beq_cont.966:
	j	beq_cont.964
beq_else.963:
	fadd	%f0, %fzero, %f3
beq_cont.964:
	j	beq_cont.962
beq_else.961:
	fadd	%f0, %fzero, %f3
beq_cont.962:
	j	beq_cont.960
beq_else.959:
	fadd	%f0, %fzero, %f3
beq_cont.960:
	j	beq_cont.958
beq_else.957:
	fadd	%f0, %fzero, %f3
beq_cont.958:
	j	beq_cont.956
beq_else.955:
	fadd	%f0, %fzero, %f3
beq_cont.956:
	j	beq_cont.954
beq_else.953:
	fadd	%f0, %fzero, %f3
beq_cont.954:
	j	beq_cont.952
beq_else.951:
	fadd	%f0, %fzero, %f3
beq_cont.952:
	j	beq_cont.950
beq_else.949:
	fadd	%f0, %fzero, %f3
beq_cont.950:
	j	beq_cont.948
beq_else.947:
	fadd	%f0, %fzero, %f3
beq_cont.948:
	j	beq_cont.946
beq_else.945:
	fadd	%f0, %fzero, %f3
beq_cont.946:
	j	beq_cont.944
beq_else.943:
	fadd	%f0, %fzero, %f3
beq_cont.944:
	j	beq_cont.942
beq_else.941:
	fadd	%f0, %fzero, %f3
beq_cont.942:
	j	beq_cont.940
beq_else.939:
	fadd	%f0, %fzero, %f3
beq_cont.940:
	j	beq_cont.938
beq_else.937:
	fadd	%f0, %fzero, %f2
beq_cont.938:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.301.483
	sw	%v0, 0(%k1)
	flw	%f1, 3(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 2(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.967
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.969
	fsub	%f2, %f2, %f0
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.971
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.973
	fsub	%f2, %f2, %f0
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.975
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.977
	fsub	%f1, %f2, %f0
	flw	%f2, 28(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.978
beq_else.977:
	flw	%f1, 28(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.978:
	j	beq_cont.976
beq_else.975:
	fadd	%f0, %fzero, %f2
beq_cont.976:
	j	beq_cont.974
beq_else.973:
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.979
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.981
	fsub	%f1, %f2, %f0
	flw	%f2, 28(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.982
beq_else.981:
	flw	%f1, 28(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.982:
	j	beq_cont.980
beq_else.979:
	fadd	%f0, %fzero, %f2
beq_cont.980:
beq_cont.974:
	j	beq_cont.972
beq_else.971:
	fadd	%f0, %fzero, %f2
beq_cont.972:
	j	beq_cont.970
beq_else.969:
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.983
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.985
	fsub	%f2, %f2, %f0
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.987
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.989
	fsub	%f1, %f2, %f0
	flw	%f2, 28(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.990
beq_else.989:
	flw	%f1, 28(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.990:
	j	beq_cont.988
beq_else.987:
	fadd	%f0, %fzero, %f2
beq_cont.988:
	j	beq_cont.986
beq_else.985:
	flw	%f3, 28(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.991
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.993
	fsub	%f1, %f2, %f0
	flw	%f2, 28(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	beq_cont.994
beq_else.993:
	flw	%f1, 28(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.994:
	j	beq_cont.992
beq_else.991:
	fadd	%f0, %fzero, %f2
beq_cont.992:
beq_cont.986:
	j	beq_cont.984
beq_else.983:
	fadd	%f0, %fzero, %f2
beq_cont.984:
beq_cont.970:
	j	beq_cont.968
beq_else.967:
	fadd	%f0, %fzero, %f2
beq_cont.968:
	flw	%f1, 1(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.995
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.997
	addi	%v0, %zero, 1
	j	beq_cont.998
beq_else.997:
	addi	%v0, %zero, 0
beq_cont.998:
	j	beq_cont.996
beq_else.995:
	lw	%v0, 0(%sp)
beq_cont.996:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.999
	fsub	%f0, %f0, %f1
	j	beq_cont.1000
beq_else.999:
beq_cont.1000:
	flw	%f2, 9(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.1001
	fsub	%f0, %f1, %f0
	j	beq_cont.1002
beq_else.1001:
beq_cont.1002:
	flw	%f1, 8(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.1003
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
	j	beq_cont.1004
beq_else.1003:
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
beq_cont.1004:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.1005
	fneg	%f0, %f0
	jr	%ra
beq_else.1005:
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
