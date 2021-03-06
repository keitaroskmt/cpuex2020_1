.section	".rodata"
.align	8
	lui	%sp, 15
	ori	%sp, %sp, 16960
	lui	%hp, 0
	ori	%hp, %hp, 10000
	lui	%at, 20078
	ori	%at, %at, 27432
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 17279
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 17152
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 49992
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 17224
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15502
	ori	%at, %at, 64053
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 49024
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16201
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16329
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16457
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16585
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16384
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15027
	ori	%at, %at, 33030
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15658
	ori	%at, %at, 42889
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16128
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 14669
	ori	%at, %at, 25782
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15368
	ori	%at, %at, 34406
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15914
	ori	%at, %at, 43692
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 19200
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 0
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
.section	".text"
	j	min_caml_start
min_caml_print_char:
	out	%v0
	jr	%ra
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
min_caml_create_array:
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0
create_array_loop:
	bne	%a0, %zero, create_array_cont
	jr	%ra
create_array_cont:
	sw	%v1, 0(%hp)
	addi	%a0, %a0, -1
	addi	%hp, %hp, 4
	j	create_array_loop
min_caml_create_float_array:
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0
create_float_array_loop:
	bne	%a0, %zero, create_float_array_cont
	jr	%ra
create_float_array_cont:
	fsw	%f0, 0(%hp)
	addi	%a0, %a0, -1
	addi	%hp, %hp, 4
	j	create_float_array_loop
fispos.2638:
	flw	%f1, 10080(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.6875
	addi	%v0, %zero, 0
	jr	%ra
beq_else.6875:
	addi	%v0, %zero, 1
	jr	%ra
fisneg.2640:
	flw	%f1, 10080(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.6876
	addi	%v0, %zero, 0
	jr	%ra
beq_else.6876:
	addi	%v0, %zero, 1
	jr	%ra
fiszero.2642:
	flw	%f1, 10080(%zero)
	fbne	%f0, %f1, fbeq_else.6877
	addi	%v0, %zero, 1
	jr	%ra
fbeq_else.6877:
	addi	%v0, %zero, 0
	jr	%ra
fsqr.2649:
	fmul	%f0, %f0, %f0
	jr	%ra
float_of_int_sub1.2661:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.6878
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	j	float_of_int_sub1.2661
beq_else.6878:
	add	%v0, %zero, %v1
	jr	%ra
float_of_int_sub2.2664:
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	slt	%at, %v0, %v1
	bne	%at, %zero, beq_else.6879
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	j	float_of_int_sub2.2664
beq_else.6879:
	jr	%ra
float_of_int_sub3.2666:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6880
	jr	%ra
beq_else.6880:
	addi	%v0, %v0, -1
	flw	%f1, 10076(%zero)
	fadd	%f0, %f1, %f0
	j	float_of_int_sub3.2666
float_of_int.2669:
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.6881
	addi	%v1, %zero, 0
	j	beq_cont.6882
beq_else.6881:
	addi	%v1, %zero, 1
beq_cont.6882:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.6883
	j	beq_cont.6884
beq_else.6883:
	sub	%v0, %zero, %v0
beq_cont.6884:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sw	%v1, 0(%sp)
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.6885
	sw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int_sub2.2664
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lui	%at, 19200
	ori	%at, %at, 0
	add	%v1, %zero, %at
	add	%v0, %v0, %v1
	itof	%f0, %v0
	flw	%f1, 10076(%zero)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 0
	lw	%v0, 4(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int_sub1.2661
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f0, 10080(%zero)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int_sub3.2666
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	j	beq_cont.6886
beq_else.6885:
	lui	%at, 19200
	ori	%at, %at, 0
	add	%a0, %zero, %at
	add	%v0, %v0, %a0
	itof	%f0, %v0
	flw	%f1, 10076(%zero)
	fsub	%f0, %f0, %f1
beq_cont.6886:
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6887
	fneg	%f0, %f0
	jr	%ra
beq_else.6887:
	jr	%ra
kernel_sin.2673:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 10072(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 10068(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 10064(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	jr	%ra
kernel_cos.2675:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 10060(%zero)
	flw	%f3, 10056(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 10052(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 10048(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	jr	%ra
f.6197:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.6888
	flw	%f2, 10044(%zero)
	fmul	%f1, %f2, %f1
	j	f.6197
beq_else.6888:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.6201:
	flw	%f2, 4(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.6889
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.6890
	fsub	%f0, %f0, %f1
	flw	%f2, 10044(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.6890:
	flw	%f2, 10044(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.6889:
	jr	%ra
reduction_2pi.2679:
	flw	%f1, 10040(%zero)
	fsw	%f0, 0(%sp)
	fsw	%f1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	f.6197
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	fadd	%f1, %f0, %fzero
	add	%k1, %zero, %hp
	addi	%hp, %hp, 8
	addi	%v0, %zero, g.6201
	sw	%v0, 0(%k1)
	flw	%f0, 4(%sp)
	fsw	%f0, 4(%k1)
	flw	%f0, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
cos.2681:
	flw	%f1, 10036(%zero)
	fabs	%f0, %f0
	fsw	%f1, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi.2679
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%f1, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.6891
	addi	%v0, %zero, 0
	j	beq_cont.6892
beq_else.6891:
	addi	%v0, %zero, 1
beq_cont.6892:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.6893
	fsub	%f0, %f0, %f1
	j	beq_cont.6894
beq_else.6893:
beq_cont.6894:
	flw	%f2, 10032(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.6895
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6897
	addi	%v0, %zero, 1
	j	beq_cont.6898
beq_else.6897:
	addi	%v0, %zero, 0
beq_cont.6898:
	j	beq_cont.6896
beq_else.6895:
beq_cont.6896:
	flw	%f2, 10032(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.6899
	fsub	%f0, %f1, %f0
	j	beq_cont.6900
beq_else.6899:
beq_cont.6900:
	flw	%f1, 10028(%zero)
	sw	%v0, 4(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.6901
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_cos.2675
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	j	beq_cont.6902
beq_else.6901:
	flw	%f1, 10032(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_sin.2673
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
beq_cont.6902:
	lw	%v0, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6903
	fneg	%f0, %f0
	jr	%ra
beq_else.6903:
	jr	%ra
sin.2683:
	flw	%f1, 10036(%zero)
	flw	%f2, 10080(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.6904
	addi	%v0, %zero, 1
	j	beq_cont.6905
beq_else.6904:
	addi	%v0, %zero, 0
beq_cont.6905:
	fabs	%f0, %f0
	sw	%v0, 0(%sp)
	fsw	%f1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi.2679
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 4(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.6906
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6908
	addi	%v0, %zero, 1
	j	beq_cont.6909
beq_else.6908:
	addi	%v0, %zero, 0
beq_cont.6909:
	j	beq_cont.6907
beq_else.6906:
	lw	%v0, 0(%sp)
beq_cont.6907:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.6910
	fsub	%f0, %f0, %f1
	j	beq_cont.6911
beq_else.6910:
beq_cont.6911:
	flw	%f2, 10032(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.6912
	fsub	%f0, %f1, %f0
	j	beq_cont.6913
beq_else.6912:
beq_cont.6913:
	flw	%f1, 10028(%zero)
	sw	%v0, 8(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.6914
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_sin.2673
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	j	beq_cont.6915
beq_else.6914:
	flw	%f1, 10032(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_cos.2675
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
beq_cont.6915:
	lw	%v0, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6916
	fneg	%f0, %f0
	jr	%ra
beq_else.6916:
	jr	%ra
print_int_sub1.2687:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.6917
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2687
beq_else.6917:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2690:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.6918
	addi	%v0, %v0, -10
	j	print_int_sub2.2690
beq_else.6918:
	jr	%ra
print_int.2692:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	print_int_sub1.2687
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub2.2690
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_print_char
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.6919
	jr	%ra
beq_else.6919:
	addi	%v1, %zero, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub1.2687
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub2.2690
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_print_char
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 8(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.6921
	jr	%ra
beq_else.6921:
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub2.2690
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
sgn.2694:
	fsw	%f0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	fiszero.2642
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6923
	flw	%f0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	fispos.2638
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6924
	flw	%f0, 10024(%zero)
	jr	%ra
beq_else.6924:
	flw	%f0, 10060(%zero)
	jr	%ra
beq_else.6923:
	flw	%f0, 10080(%zero)
	jr	%ra
vecunit_sgn.2720:
	flw	%f0, 0(%v0)
	sw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	fsqr.2649
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 4(%v0)
	fsw	%f0, 8(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	fsqr.2649
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	flw	%f1, 8(%v0)
	fsw	%f0, 12(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	fsqr.2649
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	fsw	%f0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	fiszero.2642
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6925
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6927
	flw	%f0, 10060(%zero)
	flw	%f1, 16(%sp)
	fdiv	%f0, %f0, %f1
	j	beq_cont.6928
beq_else.6927:
	flw	%f0, 10024(%zero)
	flw	%f1, 16(%sp)
	fdiv	%f0, %f0, %f1
beq_cont.6928:
	j	beq_cont.6926
beq_else.6925:
	flw	%f0, 10060(%zero)
beq_cont.6926:
	lw	%v0, 4(%sp)
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 0(%v0)
	flw	%f1, 4(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 4(%v0)
	flw	%f1, 8(%v0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 8(%v0)
	jr	%ra
rad.2819:
	flw	%f1, 10020(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
read_screen_settings.2821:
	lw	%v0, 20(%k1)
	lw	%v1, 16(%k1)
	lw	%a0, 12(%k1)
	lw	%a1, 8(%k1)
	lw	%a2, 4(%k1)
	sw	%v0, 0(%sp)
	sw	%a0, 4(%sp)
	sw	%a1, 8(%sp)
	sw	%v1, 12(%sp)
	sw	%a2, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 16(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 16(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 16(%sp)
	fsw	%f0, 8(%v0)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	rad.2819
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	fsw	%f0, 20(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	cos.2681
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 20(%sp)
	fsw	%f0, 24(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	sin.2683
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	fsw	%f0, 28(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	rad.2819
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	fsw	%f0, 32(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	cos.2681
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	flw	%f1, 32(%sp)
	fsw	%f0, 36(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	sin.2683
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f1, 24(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 10016(%zero)
	fmul	%f2, %f2, %f3
	lw	%v0, 12(%sp)
	fsw	%f2, 0(%v0)
	flw	%f2, 10012(%zero)
	flw	%f3, 28(%sp)
	fmul	%f2, %f3, %f2
	fsw	%f2, 4(%v0)
	flw	%f2, 36(%sp)
	fmul	%f4, %f1, %f2
	flw	%f5, 10016(%zero)
	fmul	%f4, %f4, %f5
	fsw	%f4, 8(%v0)
	lw	%v1, 8(%sp)
	fsw	%f2, 0(%v1)
	flw	%f4, 10080(%zero)
	fsw	%f4, 4(%v1)
	fneg	%f4, %f0
	fsw	%f4, 8(%v1)
	fneg	%f4, %f3
	fmul	%f0, %f4, %f0
	lw	%v1, 4(%sp)
	fsw	%f0, 0(%v1)
	fneg	%f0, %f1
	fsw	%f0, 4(%v1)
	fneg	%f0, %f3
	fmul	%f0, %f0, %f2
	fsw	%f0, 8(%v1)
	lw	%v1, 16(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 0(%v0)
	fsub	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 4(%v1)
	flw	%f1, 4(%v0)
	fsub	%f0, %f0, %f1
	fsw	%f0, 4(%a0)
	flw	%f0, 8(%v1)
	flw	%f1, 8(%v0)
	fsub	%f0, %f0, %f1
	fsw	%f0, 8(%a0)
	jr	%ra
read_light.2823:
	lw	%v0, 8(%k1)
	lw	%v1, 4(%k1)
	sw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_int
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_float
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	rad.2819
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	sin.2683
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	fneg	%f0, %f0
	lw	%v0, 4(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_float
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	rad.2819
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fsw	%f0, 12(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	cos.2681
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 12(%sp)
	fsw	%f0, 16(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	sin.2683
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	cos.2681
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	fsw	%f0, 8(%v0)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 0(%sp)
	fsw	%f0, 0(%v0)
	jr	%ra
rotate_quadratic_matrix.2825:
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	cos.2681
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 0(%v0)
	fsw	%f0, 8(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	sin.2683
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 4(%v0)
	fsw	%f0, 12(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	cos.2681
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 4(%v0)
	fsw	%f0, 16(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	sin.2683
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 8(%v0)
	fsw	%f0, 20(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	cos.2681
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 8(%v0)
	fsw	%f0, 24(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	sin.2683
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 24(%sp)
	flw	%f2, 16(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 20(%sp)
	flw	%f5, 12(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f6, %f6, %f1
	flw	%f7, 8(%sp)
	fmul	%f8, %f7, %f0
	fsub	%f6, %f6, %f8
	fmul	%f8, %f7, %f4
	fmul	%f8, %f8, %f1
	fmul	%f9, %f5, %f0
	fadd	%f8, %f8, %f9
	fmul	%f9, %f2, %f0
	fmul	%f10, %f5, %f4
	fmul	%f10, %f10, %f0
	fmul	%f11, %f7, %f1
	fadd	%f10, %f10, %f11
	fmul	%f11, %f7, %f4
	fmul	%f0, %f11, %f0
	fmul	%f1, %f5, %f1
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4
	fmul	%f4, %f5, %f2
	fmul	%f2, %f7, %f2
	lw	%v0, 0(%sp)
	flw	%f5, 0(%v0)
	flw	%f7, 4(%v0)
	flw	%f11, 8(%v0)
	fsw	%f3, 28(%sp)
	fsw	%f2, 32(%sp)
	fsw	%f0, 36(%sp)
	fsw	%f8, 40(%sp)
	fsw	%f4, 44(%sp)
	fsw	%f10, 48(%sp)
	fsw	%f6, 52(%sp)
	fsw	%f11, 56(%sp)
	fsw	%f1, 60(%sp)
	fsw	%f7, 64(%sp)
	fsw	%f9, 68(%sp)
	fsw	%f5, 72(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	fsqr.2649
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	flw	%f1, 72(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 68(%sp)
	fsw	%f0, 76(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 88
	jal	fsqr.2649
	addi	%sp, %sp, -88
	lw	%ra, 84(%sp)
	flw	%f1, 64(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 76(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 60(%sp)
	fsw	%f0, 80(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 88
	jal	fsqr.2649
	addi	%sp, %sp, -88
	lw	%ra, 84(%sp)
	flw	%f1, 56(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 80(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 52(%sp)
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 88
	jal	fsqr.2649
	addi	%sp, %sp, -88
	lw	%ra, 84(%sp)
	flw	%f1, 72(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 48(%sp)
	fsw	%f0, 84(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	jal	fsqr.2649
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	flw	%f1, 64(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 84(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 44(%sp)
	fsw	%f0, 88(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	jal	fsqr.2649
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	flw	%f1, 56(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 88(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 4(%v0)
	flw	%f0, 40(%sp)
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	jal	fsqr.2649
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	flw	%f1, 72(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 36(%sp)
	fsw	%f0, 92(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 100(%sp)
	addi	%sp, %sp, 104
	jal	fsqr.2649
	addi	%sp, %sp, -104
	lw	%ra, 100(%sp)
	flw	%f1, 64(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 92(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 32(%sp)
	fsw	%f0, 96(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 100(%sp)
	addi	%sp, %sp, 104
	jal	fsqr.2649
	addi	%sp, %sp, -104
	lw	%ra, 100(%sp)
	flw	%f1, 56(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 96(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 8(%v0)
	flw	%f0, 10044(%zero)
	flw	%f2, 52(%sp)
	flw	%f3, 72(%sp)
	fmul	%f4, %f3, %f2
	flw	%f5, 40(%sp)
	fmul	%f4, %f4, %f5
	flw	%f6, 48(%sp)
	flw	%f7, 64(%sp)
	fmul	%f8, %f7, %f6
	flw	%f9, 36(%sp)
	fmul	%f8, %f8, %f9
	fadd	%f4, %f4, %f8
	flw	%f8, 44(%sp)
	fmul	%f10, %f1, %f8
	flw	%f11, 32(%sp)
	fmul	%f10, %f10, %f11
	fadd	%f4, %f4, %f10
	fmul	%f0, %f0, %f4
	lw	%v0, 4(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 10044(%zero)
	flw	%f4, 28(%sp)
	fmul	%f10, %f3, %f4
	fmul	%f5, %f10, %f5
	flw	%f10, 68(%sp)
	fmul	%f12, %f7, %f10
	fmul	%f9, %f12, %f9
	fadd	%f5, %f5, %f9
	flw	%f9, 60(%sp)
	fmul	%f12, %f1, %f9
	fmul	%f11, %f12, %f11
	fadd	%f5, %f5, %f11
	fmul	%f0, %f0, %f5
	fsw	%f0, 4(%v0)
	flw	%f0, 10044(%zero)
	fmul	%f3, %f3, %f4
	fmul	%f2, %f3, %f2
	fmul	%f3, %f7, %f10
	fmul	%f3, %f3, %f6
	fadd	%f2, %f2, %f3
	fmul	%f1, %f1, %f9
	fmul	%f1, %f1, %f8
	fadd	%f1, %f2, %f1
	fmul	%f0, %f0, %f1
	fsw	%f0, 8(%v0)
	jr	%ra
read_nth_object.2828:
	lw	%v1, 4(%k1)
	sw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_int
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.6933
	addi	%v0, %zero, 0
	jr	%ra
beq_else.6933:
	sw	%v0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_int
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%v0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_int
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	sw	%v0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_int
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	sw	%v0, 24(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_read_float
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 24(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_read_float
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 24(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_read_float
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 24(%sp)
	fsw	%f0, 8(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	sw	%v0, 28(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 28(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 28(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 28(%sp)
	fsw	%f0, 8(%v0)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	fisneg.2640
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	addi	%v1, %zero, 2
	flw	%f0, 10080(%zero)
	sw	%v0, 32(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	sw	%v0, 36(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 36(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 36(%sp)
	fsw	%f0, 4(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	sw	%v0, 40(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 40(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 40(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 40(%sp)
	fsw	%f0, 8(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v1, 20(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.6934
	j	beq_cont.6935
beq_else.6934:
	sw	%v0, 44(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_read_float
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	rad.2819
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_read_float
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	rad.2819
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_read_float
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	rad.2819
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 8(%v0)
beq_cont.6935:
	lw	%v1, 12(%sp)
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.6936
	addi	%a0, %zero, 1
	j	beq_cont.6937
beq_else.6936:
	lw	%a0, 32(%sp)
beq_cont.6937:
	addi	%a1, %zero, 4
	flw	%f0, 10080(%zero)
	sw	%a0, 48(%sp)
	sw	%v0, 44(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 48
	sw	%v0, 40(%v1)
	lw	%v0, 44(%sp)
	sw	%v0, 36(%v1)
	lw	%a0, 40(%sp)
	sw	%a0, 32(%v1)
	lw	%a0, 36(%sp)
	sw	%a0, 28(%v1)
	lw	%a0, 48(%sp)
	sw	%a0, 24(%v1)
	lw	%a0, 28(%sp)
	sw	%a0, 20(%v1)
	lw	%a0, 24(%sp)
	sw	%a0, 16(%v1)
	lw	%a1, 20(%sp)
	sw	%a1, 12(%v1)
	lw	%a2, 16(%sp)
	sw	%a2, 8(%v1)
	lw	%a2, 12(%sp)
	sw	%a2, 4(%v1)
	lw	%a3, 8(%sp)
	sw	%a3, 0(%v1)
	lw	%a3, 4(%sp)
	sll	%a3, %a3, 2
	lw	%t0, 0(%sp)
	add	%at, %t0, %a3
	sw	%v1, 0(%at)
	addi	%at, %zero, 3
	bne	%a2, %at, beq_else.6938
	flw	%f0, 0(%a0)
	fsw	%f0, 52(%sp)
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	fiszero.2642
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6940
	flw	%f0, 52(%sp)
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	sgn.2694
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	flw	%f1, 52(%sp)
	fsw	%f0, 56(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	fsqr.2649
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	flw	%f1, 56(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.6941
beq_else.6940:
	flw	%f0, 10080(%zero)
beq_cont.6941:
	lw	%v0, 24(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 4(%v0)
	fsw	%f0, 60(%sp)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	fiszero.2642
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6942
	flw	%f0, 60(%sp)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	sgn.2694
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	flw	%f1, 60(%sp)
	fsw	%f0, 64(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	fsqr.2649
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	flw	%f1, 64(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.6943
beq_else.6942:
	flw	%f0, 10080(%zero)
beq_cont.6943:
	lw	%v0, 24(%sp)
	fsw	%f0, 4(%v0)
	flw	%f0, 8(%v0)
	fsw	%f0, 68(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	fiszero.2642
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6944
	flw	%f0, 68(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	sgn.2694
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	flw	%f1, 68(%sp)
	fsw	%f0, 72(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	fsqr.2649
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	flw	%f1, 72(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.6945
beq_else.6944:
	flw	%f0, 10080(%zero)
beq_cont.6945:
	lw	%v0, 24(%sp)
	fsw	%f0, 8(%v0)
	j	beq_cont.6939
beq_else.6938:
	addi	%at, %zero, 2
	bne	%a2, %at, beq_else.6946
	lw	%v1, 32(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.6948
	addi	%v1, %zero, 1
	j	beq_cont.6949
beq_else.6948:
	addi	%v1, %zero, 0
beq_cont.6949:
	addi	%v0, %a0, 0
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	vecunit_sgn.2720
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	j	beq_cont.6947
beq_else.6946:
beq_cont.6947:
beq_cont.6939:
	lw	%v0, 20(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6950
	j	beq_cont.6951
beq_else.6950:
	lw	%v0, 24(%sp)
	lw	%v1, 44(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	rotate_quadratic_matrix.2825
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
beq_cont.6951:
	addi	%v0, %zero, 1
	jr	%ra
read_object.2830:
	lw	%v1, 8(%k1)
	lw	%a0, 4(%k1)
	slti	%at, %v0, 60
	bne	%at, %zero, beq_else.6952
	jr	%ra
beq_else.6952:
	sw	%k1, 0(%sp)
	sw	%a0, 4(%sp)
	sw	%v0, 8(%sp)
	addi	%k1, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.6954
	lw	%v0, 4(%sp)
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
beq_else.6954:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
read_all_object.2832:
	lw	%k1, 4(%k1)
	addi	%v0, %zero, 0
	lw	%at, 0(%k1)
	jr	%at
read_net_item.2834:
	sw	%v0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_int
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.6956
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	j	min_caml_create_array
beq_else.6956:
	lw	%v1, 0(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	read_net_item.2834
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 0(%sp)
	sll	%v1, %v1, 2
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
read_or_network.2836:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	read_net_item.2834
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.6957
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
beq_else.6957:
	lw	%v0, 0(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	read_or_network.2836
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 0(%sp)
	sll	%v1, %v1, 2
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
read_and_network.2838:
	lw	%v1, 4(%k1)
	addi	%a0, %zero, 0
	sw	%k1, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	read_net_item.2834
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 0(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.6958
	jr	%ra
beq_else.6958:
	lw	%v1, 8(%sp)
	sll	%a0, %v1, 2
	lw	%a1, 4(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %v1, 1
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
read_parameter.2840:
	lw	%v0, 20(%k1)
	lw	%v1, 16(%k1)
	lw	%a0, 12(%k1)
	lw	%a1, 8(%k1)
	lw	%a2, 4(%k1)
	sw	%a2, 0(%sp)
	sw	%a0, 4(%sp)
	sw	%a1, 8(%sp)
	sw	%v1, 12(%sp)
	addi	%k1, %v0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%k1, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%k1, 8(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v0, %zero, 0
	lw	%k1, 4(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v0, %zero, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	read_or_network.2836
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 0(%v1)
	jr	%ra
write_ppm_header.3083:
	lw	%v0, 4(%k1)
	addi	%v1, %zero, 80
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 51
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 0(%v0)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	print_int.2692
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v0, 4(%v0)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	print_int.2692
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 255
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	print_int.2692
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
create_float5x3array.3115:
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 4(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 8(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 12(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 16(%v1)
	add	%v0, %zero, %v1
	jr	%ra
create_pixel.3117:
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%v0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	create_float5x3array.3115
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%v0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	create_float5x3array.3115
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	sw	%v0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	create_float5x3array.3115
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	sw	%v0, 24(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	create_float5x3array.3115
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 32
	sw	%v0, 28(%v1)
	lw	%v0, 24(%sp)
	sw	%v0, 24(%v1)
	lw	%v0, 20(%sp)
	sw	%v0, 20(%v1)
	lw	%v0, 16(%sp)
	sw	%v0, 16(%v1)
	lw	%v0, 12(%sp)
	sw	%v0, 12(%v1)
	lw	%v0, 8(%sp)
	sw	%v0, 8(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	jr	%ra
init_line_elements.3119:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.6961
	sw	%v0, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	create_pixel.3117
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	sll	%a0, %v1, 2
	lw	%a1, 0(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a1, 0
	j	init_line_elements.3119
beq_else.6961:
	jr	%ra
create_pixelline.3122:
	lw	%v0, 4(%k1)
	lw	%v1, 0(%v0)
	sw	%v0, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	create_pixel.3117
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 0(%sp)
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -2
	j	init_line_elements.3119
rt.3175:
	lw	%a0, 24(%k1)
	lw	%a1, 20(%k1)
	lw	%a2, 16(%k1)
	lw	%a3, 12(%k1)
	lw	%t0, 8(%k1)
	lw	%t1, 4(%k1)
	sw	%v0, 0(%a3)
	sw	%v1, 4(%a3)
	srl	%a3, %v0, 1
	sw	%a3, 0(%t0)
	srl	%v1, %v1, 1
	sw	%v1, 4(%t0)
	flw	%f0, 10008(%zero)
	sw	%a0, 0(%sp)
	sw	%a2, 4(%sp)
	sw	%t1, 8(%sp)
	sw	%a1, 12(%sp)
	fsw	%f0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	float_of_int.2669
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fdiv	%f0, %f1, %f0
	lw	%v0, 12(%sp)
	fsw	%f0, 0(%v0)
	lw	%k1, 8(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%k1, 8(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%k1, 8(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%k1, 4(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 0
	flw	%f0, 10080(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 60
	addi	%a0, %zero, 0
	addi	%a1, %zero, 0
	addi	%a2, %zero, 0
	addi	%a3, %zero, 0
	addi	%t0, %zero, 0
	add	%t1, %zero, %hp
	addi	%hp, %hp, 48
	sw	%v0, 40(%t1)
	sw	%v0, 36(%t1)
	sw	%v0, 32(%t1)
	sw	%v0, 28(%t1)
	sw	%t0, 24(%t1)
	sw	%v0, 20(%t1)
	sw	%v0, 16(%t1)
	sw	%a3, 12(%t1)
	sw	%a2, 8(%t1)
	sw	%a1, 4(%t1)
	sw	%a0, 0(%t1)
	add	%v0, %zero, %t1
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %zero, 1
	flw	%f0, 10004(%zero)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %zero, 50
	addi	%a0, %zero, 1
	addi	%a1, %zero, -1
	sw	%v0, 20(%sp)
	sw	%v1, 24(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 24(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 1
	lw	%a1, 0(%v0)
	sw	%v0, 28(%sp)
	sw	%v1, 32(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_array
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 32(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_array
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	addi	%v1, %zero, 1
	flw	%f0, 10080(%zero)
	sw	%v0, 36(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 10000(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v1, %zero, 2
	addi	%a0, %zero, 0
	sw	%v0, 40(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v1, %zero, 1
	flw	%f0, 10080(%zero)
	sw	%v0, 44(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 48(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 52(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	min_caml_create_float_array
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 56(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	min_caml_create_float_array
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 60(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_float_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 10080(%zero)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_float_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	sw	%v1, 64(%sp)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v1, %zero, 0
	add	%a0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 4(%a0)
	lw	%v0, 64(%sp)
	sw	%v0, 0(%a0)
	add	%v0, %zero, %a0
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 10080(%zero)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_float_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 10080(%zero)
	sw	%v0, 68(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	min_caml_create_float_array
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%v0, %zero, 60
	lw	%v1, 68(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	min_caml_create_array
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 10080(%zero)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	min_caml_create_float_array
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	sw	%v1, 72(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	min_caml_create_array
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 4(%v1)
	lw	%v0, 72(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	addi	%a0, %zero, 0
	flw	%f0, 10080(%zero)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 16
	fsw	%f0, 8(%a1)
	sw	%v0, 4(%a1)
	sw	%a0, 0(%a1)
	add	%v0, %zero, %a1
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	min_caml_create_array
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	min_caml_create_array
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 24
	addi	%v1, %zero, read_screen_settings.2821
	sw	%v1, 0(%v0)
	lw	%v1, 12(%sp)
	sw	%v1, 20(%v0)
	lw	%v1, 60(%sp)
	sw	%v1, 16(%v0)
	lw	%v1, 56(%sp)
	sw	%v1, 12(%v0)
	lw	%v1, 52(%sp)
	sw	%v1, 8(%v0)
	lw	%v1, 8(%sp)
	sw	%v1, 4(%v0)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 16
	addi	%a0, %zero, read_light.2823
	sw	%a0, 0(%v1)
	lw	%a0, 16(%sp)
	sw	%a0, 8(%v1)
	lw	%a0, 20(%sp)
	sw	%a0, 4(%v1)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 8
	addi	%a1, %zero, read_nth_object.2828
	sw	%a1, 0(%a0)
	lw	%a1, 4(%sp)
	sw	%a1, 4(%a0)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 16
	addi	%a2, %zero, read_object.2830
	sw	%a2, 0(%a1)
	sw	%a0, 8(%a1)
	lw	%a0, 0(%sp)
	sw	%a0, 4(%a1)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 8
	addi	%a2, %zero, read_all_object.2832
	sw	%a2, 0(%a0)
	sw	%a1, 4(%a0)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 8
	addi	%a2, %zero, read_and_network.2838
	sw	%a2, 0(%a1)
	lw	%a2, 28(%sp)
	sw	%a2, 4(%a1)
	add	%a2, %zero, %hp
	addi	%hp, %hp, 24
	addi	%a3, %zero, read_parameter.2840
	sw	%a3, 0(%a2)
	sw	%v0, 20(%a2)
	sw	%v1, 16(%a2)
	sw	%a1, 12(%a2)
	sw	%a0, 8(%a2)
	lw	%v0, 36(%sp)
	sw	%v0, 4(%a2)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	addi	%v1, %zero, write_ppm_header.3083
	sw	%v1, 0(%v0)
	lw	%v1, 40(%sp)
	sw	%v1, 4(%v0)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 8
	addi	%a1, %zero, create_pixelline.3122
	sw	%a1, 0(%a0)
	sw	%v1, 4(%a0)
	add	%k1, %zero, %hp
	addi	%hp, %hp, 32
	addi	%a1, %zero, rt.3175
	sw	%a1, 0(%k1)
	sw	%v0, 24(%k1)
	lw	%v0, 48(%sp)
	sw	%v0, 20(%k1)
	sw	%a2, 16(%k1)
	sw	%v1, 12(%k1)
	lw	%v0, 44(%sp)
	sw	%v0, 8(%k1)
	sw	%a0, 4(%k1)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 2
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%g0, %zero, 0
	ret
