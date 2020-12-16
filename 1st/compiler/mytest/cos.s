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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.872
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.873
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.874
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.875
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.876
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.877
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.878
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.879
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.880
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.881
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.882
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.883
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.884
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.885
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.886
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.887
	flw	%f2, 27(%zero)
	fmul	%f1, %f2, %f1
	j	f.297.522
beq_else.887:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.886:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.885:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.884:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.883:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.882:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.881:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.880:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.879:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.878:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.877:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.876:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.875:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.874:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.873:
	fadd	%f0, %fzero, %f1
	jr	%ra
beq_else.872:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.301.526:
	flw	%f2, 1(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.888
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.889
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.890
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.891
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.892
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.893
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.894
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.895
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.895:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.894:
	jr	%ra
beq_else.893:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.896
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.897
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.897:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.896:
	jr	%ra
beq_else.892:
	jr	%ra
beq_else.891:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.898
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.899
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.900
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.901
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.901:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.900:
	jr	%ra
beq_else.899:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.902
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.903
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.903:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.902:
	jr	%ra
beq_else.898:
	jr	%ra
beq_else.890:
	jr	%ra
beq_else.889:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.904
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.905
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.906
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.907
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.908
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.909
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.909:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.908:
	jr	%ra
beq_else.907:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.910
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.911
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.911:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.910:
	jr	%ra
beq_else.906:
	jr	%ra
beq_else.905:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.912
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.913
	fsub	%f0, %f0, %f1
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.914
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.915
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.915:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.914:
	jr	%ra
beq_else.913:
	flw	%f3, 27(%zero)
	fdiv	%f1, %f1, %f3
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.916
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.917
	fsub	%f0, %f0, %f1
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.917:
	flw	%f2, 27(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.916:
	jr	%ra
beq_else.912:
	jr	%ra
beq_else.904:
	jr	%ra
beq_else.888:
	jr	%ra
cos.222:
	flw	%f1, 26(%zero)
	fabs	%f0, %f0
	flw	%f2, 25(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.918
	flw	%f3, 24(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.920
	flw	%f3, 23(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.922
	flw	%f3, 22(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.924
	flw	%f3, 21(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.926
	flw	%f3, 20(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.928
	flw	%f3, 19(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.930
	flw	%f3, 18(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.932
	flw	%f3, 17(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.934
	flw	%f3, 16(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.936
	flw	%f3, 15(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.938
	flw	%f3, 14(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.940
	flw	%f3, 13(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.942
	flw	%f3, 12(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.944
	flw	%f3, 11(%zero)
	fslt	%at, %f0, %f3
	bne	%at, %zero, beq_else.946
	flw	%f3, 10(%zero)
	fadd	%f1, %f3, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	f.297.522
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.947
beq_else.946:
	fadd	%f0, %fzero, %f3
beq_cont.947:
	j	beq_cont.945
beq_else.944:
	fadd	%f0, %fzero, %f3
beq_cont.945:
	j	beq_cont.943
beq_else.942:
	fadd	%f0, %fzero, %f3
beq_cont.943:
	j	beq_cont.941
beq_else.940:
	fadd	%f0, %fzero, %f3
beq_cont.941:
	j	beq_cont.939
beq_else.938:
	fadd	%f0, %fzero, %f3
beq_cont.939:
	j	beq_cont.937
beq_else.936:
	fadd	%f0, %fzero, %f3
beq_cont.937:
	j	beq_cont.935
beq_else.934:
	fadd	%f0, %fzero, %f3
beq_cont.935:
	j	beq_cont.933
beq_else.932:
	fadd	%f0, %fzero, %f3
beq_cont.933:
	j	beq_cont.931
beq_else.930:
	fadd	%f0, %fzero, %f3
beq_cont.931:
	j	beq_cont.929
beq_else.928:
	fadd	%f0, %fzero, %f3
beq_cont.929:
	j	beq_cont.927
beq_else.926:
	fadd	%f0, %fzero, %f3
beq_cont.927:
	j	beq_cont.925
beq_else.924:
	fadd	%f0, %fzero, %f3
beq_cont.925:
	j	beq_cont.923
beq_else.922:
	fadd	%f0, %fzero, %f3
beq_cont.923:
	j	beq_cont.921
beq_else.920:
	fadd	%f0, %fzero, %f3
beq_cont.921:
	j	beq_cont.919
beq_else.918:
	fadd	%f0, %fzero, %f2
beq_cont.919:
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.301.526
	sw	%v0, 0(%k1)
	flw	%f1, 2(%sp)
	fsw	%f1, 1(%k1)
	flw	%f2, 1(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.948
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.950
	fsub	%f2, %f2, %f0
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.952
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.954
	fsub	%f2, %f2, %f0
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.956
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.958
	fsub	%f1, %f2, %f0
	flw	%f2, 27(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.959
beq_else.958:
	flw	%f1, 27(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.959:
	j	beq_cont.957
beq_else.956:
	fadd	%f0, %fzero, %f2
beq_cont.957:
	j	beq_cont.955
beq_else.954:
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.960
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.962
	fsub	%f1, %f2, %f0
	flw	%f2, 27(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.963
beq_else.962:
	flw	%f1, 27(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.963:
	j	beq_cont.961
beq_else.960:
	fadd	%f0, %fzero, %f2
beq_cont.961:
beq_cont.955:
	j	beq_cont.953
beq_else.952:
	fadd	%f0, %fzero, %f2
beq_cont.953:
	j	beq_cont.951
beq_else.950:
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.964
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.966
	fsub	%f2, %f2, %f0
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.968
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.970
	fsub	%f1, %f2, %f0
	flw	%f2, 27(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.971
beq_else.970:
	flw	%f1, 27(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.971:
	j	beq_cont.969
beq_else.968:
	fadd	%f0, %fzero, %f2
beq_cont.969:
	j	beq_cont.967
beq_else.966:
	flw	%f3, 27(%zero)
	fdiv	%f0, %f0, %f3
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.972
	fslt	%at, %f2, %f0
	bne	%at, %zero, beq_else.974
	fsub	%f1, %f2, %f0
	flw	%f2, 27(%zero)
	fdiv	%f0, %f0, %f2
	fadd	%f29, %f1, %fzero
	fadd	%f1, %f0, %fzero
	fadd	%f0, %f29, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.975
beq_else.974:
	flw	%f1, 27(%zero)
	fdiv	%f1, %f0, %f1
	fadd	%f0, %f2, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.975:
	j	beq_cont.973
beq_else.972:
	fadd	%f0, %fzero, %f2
beq_cont.973:
beq_cont.967:
	j	beq_cont.965
beq_else.964:
	fadd	%f0, %fzero, %f2
beq_cont.965:
beq_cont.951:
	j	beq_cont.949
beq_else.948:
	fadd	%f0, %fzero, %f2
beq_cont.949:
	flw	%f1, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.976
	addi	%v0, %zero, 0
	j	beq_cont.977
beq_else.976:
	addi	%v0, %zero, 1
beq_cont.977:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.978
	fsub	%f0, %f0, %f1
	j	beq_cont.979
beq_else.978:
beq_cont.979:
	flw	%f2, 9(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.980
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.982
	addi	%v0, %zero, 1
	j	beq_cont.983
beq_else.982:
	addi	%v0, %zero, 0
beq_cont.983:
	j	beq_cont.981
beq_else.980:
beq_cont.981:
	flw	%f2, 9(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.984
	fsub	%f0, %f1, %f0
	j	beq_cont.985
beq_else.984:
beq_cont.985:
	flw	%f1, 8(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.986
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
	j	beq_cont.987
beq_else.986:
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
beq_cont.987:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.988
	fneg	%f0, %f0
	jr	%ra
beq_else.988:
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
