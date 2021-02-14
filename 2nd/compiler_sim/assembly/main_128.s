.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 483
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
fless.2592:
	fblt	%f0, %f1, fbgt_else.6748
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.6748:
	addi	%v0, %zero, 1
	jr	%ra
fispos.2595:
	flw	%f1, 482(%zero)
	fblt	%f1, %f0, fbgt_else.6770
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.6770:
	addi	%v0, %zero, 1
	jr	%ra
fisneg.2597:
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.6792
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.6792:
	addi	%v0, %zero, 1
	jr	%ra
fiszero.2599:
	flw	%f1, 482(%zero)
	fbne	%f0, %f1, fbeq_else.6814
	addi	%v0, %zero, 1
	jr	%ra
fbeq_else.6814:
	addi	%v0, %zero, 0
	jr	%ra
xor.2601:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	beqi	%a0, 0, bnei_else.6839
	beqi	%v0, 0, bnei_else.6840
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.6840:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.6839:
	jr	%ra
fhalf.2604:
	flw	%f1, 481(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
fsqr.2606:
	fmul	%f0, %f0, %f0
	jr	%ra
kernel_sin.2608:
	fmul	%f18, %f0, %f0
	fmul	%f17, %f18, %f18
	flw	%f1, 480(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f18
	fsub	%f16, %f0, %f1
	flw	%f1, 479(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 478(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f0, %f16, %f0
	jr	%ra
kernel_cos.2610:
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f1, 477(%zero)
	flw	%f0, 481(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	jr	%ra
kernel_atan.2612:
	fmul	%f19, %f0, %f0
	fmul	%f18, %f19, %f19
	fmul	%f17, %f18, %f18
	flw	%f1, 474(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fsub	%f16, %f0, %f1
	flw	%f1, 473(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f18
	fadd	%f16, %f16, %f1
	flw	%f1, 472(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fsub	%f16, %f16, %f1
	flw	%f1, 471(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 470(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f17
	fsub	%f16, %f16, %f1
	flw	%f1, 469(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fadd	%f0, %f16, %f0
	jr	%ra
reduction_2pi_sub1.2614:
	fmov	%f16, %f0
	fmov	%f0, %f1
	fblt	%f16, %f0, fbgt_else.6952
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f0
	fmov	%f0, %f16
	j	reduction_2pi_sub1.2614
fbgt_else.6952:
	jr	%ra
reduction_2pi_sub2.2617:
	fblt	%f0, %f2, fbgt_else.6977
	fblt	%f0, %f1, fbgt_else.6978
	fsub	%f0, %f0, %f1
	flw	%f16, 468(%zero)
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2617
fbgt_else.6978:
	flw	%f16, 468(%zero)
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2617
fbgt_else.6977:
	jr	%ra
reduction_2pi.2621:
	fmov	%f17, %f0
	add	%a0, %zero, %ra
	flw	%f2, 467(%zero)
	fmov	%f1, %f2
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2614
	fmov	%f1, %f0
	add	%ra, %zero, %a0
	fmov	%f0, %f17
	j	reduction_2pi_sub2.2617
cos.2623:
	add	%a1, %zero, %ra
	flw	%f18, 466(%zero)
	fabs	%f0, %f0
	jal	reduction_2pi.2621
	fblt	%f0, %f18, fbgt_else.7036
	addi	%a0, %zero, 0
	j	fbgt_cont.7037
fbgt_else.7036:
	addi	%a0, %zero, 1
fbgt_cont.7037:
	fblt	%f0, %f18, fbgt_else.7038
	fsub	%f0, %f0, %f18
	j	fbgt_cont.7039
fbgt_else.7038:
fbgt_cont.7039:
	flw	%f16, 465(%zero)
	fblt	%f0, %f16, fbgt_else.7040
	beqi	%a0, 0, bnei_else.7042
	addi	%a0, %zero, 0
	j	fbgt_cont.7041
bnei_else.7042:
	addi	%a0, %zero, 1
bnei_cont.7043:
	j	fbgt_cont.7041
fbgt_else.7040:
fbgt_cont.7041:
	fblt	%f0, %f16, fbgt_else.7044
	fsub	%f0, %f18, %f0
	j	fbgt_cont.7045
fbgt_else.7044:
fbgt_cont.7045:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.7046
	jal	kernel_cos.2610
	j	fbgt_cont.7047
fbgt_else.7046:
	fsub	%f0, %f16, %f0
	jal	kernel_sin.2608
fbgt_cont.7047:
	beqi	%a0, 0, bnei_else.7048
	add	%ra, %zero, %a1
	jr	%ra
bnei_else.7048:
	add	%ra, %zero, %a1
	fneg	%f0, %f0
	jr	%ra
sin.2625:
	add	%a1, %zero, %ra
	flw	%f18, 466(%zero)
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.7088
	addi	%a2, %zero, 1
	j	fbgt_cont.7089
fbgt_else.7088:
	addi	%a2, %zero, 0
fbgt_cont.7089:
	fabs	%f0, %f0
	jal	reduction_2pi.2621
	fblt	%f0, %f18, fbgt_else.7090
	beqi	%a2, 0, bnei_else.7092
	addi	%a2, %zero, 0
	j	fbgt_cont.7091
bnei_else.7092:
	addi	%a2, %zero, 1
bnei_cont.7093:
	j	fbgt_cont.7091
fbgt_else.7090:
fbgt_cont.7091:
	fblt	%f0, %f18, fbgt_else.7094
	fsub	%f0, %f0, %f18
	j	fbgt_cont.7095
fbgt_else.7094:
fbgt_cont.7095:
	flw	%f16, 465(%zero)
	fblt	%f0, %f16, fbgt_else.7096
	fsub	%f0, %f18, %f0
	j	fbgt_cont.7097
fbgt_else.7096:
fbgt_cont.7097:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.7098
	jal	kernel_sin.2608
	j	fbgt_cont.7099
fbgt_else.7098:
	fsub	%f0, %f16, %f0
	jal	kernel_cos.2610
fbgt_cont.7099:
	beqi	%a2, 0, bnei_else.7100
	add	%ra, %zero, %a1
	jr	%ra
bnei_else.7100:
	add	%ra, %zero, %a1
	fneg	%f0, %f0
	jr	%ra
atan.2627:
	add	%a0, %zero, %ra
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.7131
	addi	%a1, %zero, 1
	j	fbgt_cont.7132
fbgt_else.7131:
	addi	%a1, %zero, 0
fbgt_cont.7132:
	fabs	%f16, %f0
	flw	%f1, 463(%zero)
	fblt	%f16, %f1, fbgt_else.7133
	flw	%f0, 462(%zero)
	fblt	%f16, %f0, fbgt_else.7134
	flw	%f2, 465(%zero)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f16
	jal	kernel_atan.2612
	fsub	%f0, %f2, %f0
	j	fbgt_cont.7135
fbgt_else.7134:
	flw	%f2, 464(%zero)
	flw	%f0, 477(%zero)
	fsub	%f1, %f16, %f0
	fadd	%f0, %f16, %f0
	fdiv	%f0, %f1, %f0
	jal	kernel_atan.2612
	fadd	%f0, %f2, %f0
fbgt_cont.7135:
	beqi	%a1, 0, bnei_else.7136
	add	%ra, %zero, %a0
	jr	%ra
bnei_else.7136:
	add	%ra, %zero, %a0
	fneg	%f0, %f0
	jr	%ra
fbgt_else.7133:
	add	%ra, %zero, %a0
	j	kernel_atan.2612
print_int_sub1.2629:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	blti	%a0, 10, bgti_else.7158
	addi	%a0, %a0, -10
	addi	%v1, %v0, 1
	addi	%v0, %a0, 0
	j	print_int_sub1.2629
bgti_else.7158:
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.7180
	addi	%v0, %v0, -10
	j	print_int_sub2.2632
bgti_else.7180:
	jr	%ra
print_int.2634:
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	addi	%a3, %zero, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	jal	print_int_sub1.2629
	addi	%k0, %v0, 0
	addi	%v0, %a1, 0
	jal	print_int_sub2.2632
	addi	%a1, %v0, 0
	blt	%zero, %k0, bgt_else.7205
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2
	j	min_caml_print_char
bgt_else.7205:
	addi	%v1, %a3, 0
	addi	%v0, %k0, 0
	jal	print_int_sub1.2629
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0
	jal	print_int_sub2.2632
	addi	%a3, %v0, 0
	blt	%zero, %a0, bgt_else.7206
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2
	j	min_caml_print_char
bgt_else.7206:
	addi	%v0, %a0, 0
	jal	print_int_sub2.2632
	addi	%v0, %v0, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2
	j	min_caml_print_char
sgn.2636:
	add	%a0, %zero, %ra
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.7231
	add	%ra, %zero, %a0
	flw	%f0, 482(%zero)
	jr	%ra
bnei_else.7231:
	jal	fispos.2595
	beqi	%v0, 0, bnei_else.7232
	add	%ra, %zero, %a0
	flw	%f0, 477(%zero)
	jr	%ra
bnei_else.7232:
	add	%ra, %zero, %a0
	flw	%f0, 461(%zero)
	jr	%ra
fneg_cond.2638:
	beqi	%v0, 0, bnei_else.7254
	jr	%ra
bnei_else.7254:
	fneg	%f0, %f0
	jr	%ra
add_mod5.2641:
	add	%v0, %v0, %v1
	blti	%v0, 5, bgti_else.7276
	addi	%v0, %v0, -5
	jr	%ra
bgti_else.7276:
	jr	%ra
vecset.2644:
	fsw	%f0, 0(%v0)
	fsw	%f1, 1(%v0)
	fsw	%f2, 2(%v0)
	jr	%ra
vecfill.2649:
	fsw	%f0, 0(%v0)
	fsw	%f0, 1(%v0)
	fsw	%f0, 2(%v0)
	jr	%ra
vecbzero.2652:
	flw	%f0, 482(%zero)
	j	vecfill.2649
veccpy.2654:
	flw	%f0, 0(%v1)
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v1)
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v1)
	fsw	%f0, 2(%v0)
	jr	%ra
vecunit_sgn.2662:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	flw	%f16, 0(%a0)
	fmov	%f0, %f16
	jal	fsqr.2606
	fmov	%f1, %f0
	flw	%f17, 1(%a0)
	fmov	%f0, %f17
	jal	fsqr.2606
	fadd	%f1, %f1, %f0
	flw	%f18, 2(%a0)
	fmov	%f0, %f18
	jal	fsqr.2606
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.7380
	flw	%f1, 477(%zero)
	j	bnei_cont.7381
bnei_else.7380:
	beqi	%v1, 0, bnei_else.7382
	flw	%f1, 461(%zero)
	fdiv	%f1, %f1, %f0
	j	bnei_cont.7383
bnei_else.7382:
	flw	%f1, 477(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.7383:
bnei_cont.7381:
	fmul	%f0, %f16, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f17, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f18, %f1
	add	%ra, %zero, %a1
	fsw	%f0, 2(%a0)
	jr	%ra
veciprod.2665:
	flw	%f1, 0(%v0)
	flw	%f0, 0(%v1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%v0)
	flw	%f0, 1(%v1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%v0)
	flw	%f0, 2(%v1)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	jr	%ra
veciprod2.2668:
	flw	%f16, 0(%v0)
	fmul	%f16, %f16, %f0
	flw	%f0, 1(%v0)
	fmul	%f0, %f0, %f1
	fadd	%f1, %f16, %f0
	flw	%f0, 2(%v0)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	jr	%ra
vecaccum.2673:
	flw	%f16, 0(%v0)
	flw	%f1, 0(%v1)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f16, %f1
	fsw	%f1, 0(%v0)
	flw	%f16, 1(%v0)
	flw	%f1, 1(%v1)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f16, %f1
	fsw	%f1, 1(%v0)
	flw	%f16, 2(%v0)
	flw	%f1, 2(%v1)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f16, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
vecadd.2677:
	flw	%f1, 0(%v0)
	flw	%f0, 0(%v1)
	fadd	%f0, %f1, %f0
	fsw	%f0, 0(%v0)
	flw	%f1, 1(%v0)
	flw	%f0, 1(%v1)
	fadd	%f0, %f1, %f0
	fsw	%f0, 1(%v0)
	flw	%f1, 2(%v0)
	flw	%f0, 2(%v1)
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
vecscale.2683:
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 0(%v0)
	flw	%f1, 1(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 1(%v0)
	flw	%f1, 2(%v0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
vecaccumv.2686:
	flw	%f16, 0(%v0)
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 0(%v0)
	flw	%f16, 1(%v0)
	flw	%f1, 1(%v1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 1(%v0)
	flw	%f16, 2(%v0)
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
o_texturetype.2690:
	lw	%v0, 0(%v0)
	jr	%ra
o_form.2692:
	lw	%v0, 1(%v0)
	jr	%ra
o_reflectiontype.2694:
	lw	%v0, 2(%v0)
	jr	%ra
o_isinvert.2696:
	lw	%v0, 6(%v0)
	jr	%ra
o_isrot.2698:
	lw	%v0, 3(%v0)
	jr	%ra
o_param_a.2700:
	lw	%a0, 4(%v0)
	flw	%f0, 0(%a0)
	jr	%ra
o_param_b.2702:
	lw	%a0, 4(%v0)
	flw	%f0, 1(%a0)
	jr	%ra
o_param_c.2704:
	lw	%a0, 4(%v0)
	flw	%f0, 2(%a0)
	jr	%ra
o_param_abc.2706:
	lw	%v0, 4(%v0)
	jr	%ra
o_param_x.2708:
	lw	%a0, 5(%v0)
	flw	%f0, 0(%a0)
	jr	%ra
o_param_y.2710:
	lw	%a0, 5(%v0)
	flw	%f0, 1(%a0)
	jr	%ra
o_param_z.2712:
	lw	%a0, 5(%v0)
	flw	%f0, 2(%a0)
	jr	%ra
o_diffuse.2714:
	lw	%a0, 7(%v0)
	flw	%f0, 0(%a0)
	jr	%ra
o_hilight.2716:
	lw	%a0, 7(%v0)
	flw	%f0, 1(%a0)
	jr	%ra
o_color_red.2718:
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	jr	%ra
o_color_green.2720:
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	jr	%ra
o_color_blue.2722:
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	jr	%ra
o_param_r1.2724:
	lw	%a0, 9(%v0)
	flw	%f0, 0(%a0)
	jr	%ra
o_param_r2.2726:
	lw	%a0, 9(%v0)
	flw	%f0, 1(%a0)
	jr	%ra
o_param_r3.2728:
	lw	%a0, 9(%v0)
	flw	%f0, 2(%a0)
	jr	%ra
o_param_ctbl.2730:
	lw	%v0, 10(%v0)
	jr	%ra
p_rgb.2732:
	lw	%v0, 0(%v0)
	jr	%ra
p_intersection_points.2734:
	lw	%v0, 1(%v0)
	jr	%ra
p_surface_ids.2736:
	lw	%v0, 2(%v0)
	jr	%ra
p_calc_diffuse.2738:
	lw	%v0, 3(%v0)
	jr	%ra
p_energy.2740:
	lw	%v0, 4(%v0)
	jr	%ra
p_received_ray_20percent.2742:
	lw	%v0, 5(%v0)
	jr	%ra
p_group_id.2744:
	lw	%a0, 6(%v0)
	lw	%v0, 0(%a0)
	jr	%ra
p_set_group_id.2746:
	lw	%a0, 6(%v0)
	sw	%v1, 0(%a0)
	jr	%ra
p_nvectors.2749:
	lw	%v0, 7(%v0)
	jr	%ra
d_vec.2751:
	lw	%v0, 0(%v0)
	jr	%ra
d_const.2753:
	lw	%v0, 1(%v0)
	jr	%ra
r_surface_id.2755:
	lw	%v0, 0(%v0)
	jr	%ra
r_dvec.2757:
	lw	%v0, 1(%v0)
	jr	%ra
r_bright.2759:
	flw	%f0, 2(%v0)
	jr	%ra
rad.2761:
	flw	%f1, 460(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
read_screen_settings.2763:
	add	%a3, %zero, %ra
	jal	min_caml_read_float
	fsw	%f0, 72(%zero)
	jal	min_caml_read_float
	fsw	%f0, 73(%zero)
	jal	min_caml_read_float
	fsw	%f0, 74(%zero)
	jal	min_caml_read_float
	jal	rad.2761
	fmov	%f19, %f0
	fmov	%f0, %f19
	jal	cos.2623
	fmov	%f20, %f0
	fmov	%f0, %f19
	jal	sin.2625
	fmov	%f19, %f0
	jal	min_caml_read_float
	jal	rad.2761
	fmov	%f21, %f0
	fmov	%f0, %f21
	jal	cos.2623
	fmov	%f22, %f0
	fmov	%f0, %f21
	jal	sin.2625
	fmul	%f1, %f20, %f0
	flw	%f16, 459(%zero)
	fmul	%f1, %f1, %f16
	fsw	%f1, 171(%zero)
	flw	%f1, 458(%zero)
	fmul	%f1, %f19, %f1
	fsw	%f1, 172(%zero)
	fmul	%f1, %f20, %f22
	fmul	%f1, %f1, %f16
	fsw	%f1, 173(%zero)
	fsw	%f22, 165(%zero)
	flw	%f1, 482(%zero)
	fsw	%f1, 166(%zero)
	fneg	%f1, %f0
	fsw	%f1, 167(%zero)
	fneg	%f1, %f19
	fmul	%f0, %f1, %f0
	fsw	%f0, 168(%zero)
	fneg	%f0, %f20
	fsw	%f0, 169(%zero)
	fneg	%f0, %f19
	fmul	%f0, %f0, %f22
	fsw	%f0, 170(%zero)
	flw	%f1, 72(%zero)
	flw	%f0, 171(%zero)
	fsub	%f0, %f1, %f0
	fsw	%f0, 75(%zero)
	flw	%f1, 73(%zero)
	flw	%f0, 172(%zero)
	fsub	%f0, %f1, %f0
	fsw	%f0, 76(%zero)
	flw	%f1, 74(%zero)
	flw	%f0, 173(%zero)
	fsub	%f0, %f1, %f0
	add	%ra, %zero, %a3
	fsw	%f0, 77(%zero)
	jr	%ra
read_light.2765:
	add	%a3, %zero, %ra
	jal	min_caml_read_int
	jal	min_caml_read_float
	jal	rad.2761
	fmov	%f19, %f0
	fmov	%f0, %f19
	jal	sin.2625
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	jal	min_caml_read_float
	jal	rad.2761
	fmov	%f20, %f0
	fmov	%f0, %f19
	jal	cos.2623
	fmov	%f19, %f0
	fmov	%f0, %f20
	jal	sin.2625
	fmul	%f0, %f19, %f0
	fsw	%f0, 78(%zero)
	fmov	%f0, %f20
	jal	cos.2623
	fmul	%f0, %f19, %f0
	fsw	%f0, 80(%zero)
	jal	min_caml_read_float
	add	%ra, %zero, %a3
	fsw	%f0, 81(%zero)
	jr	%ra
rotate_quadratic_matrix.2767:
	add	%a3, %zero, %ra
	flw	%f19, 0(%v1)
	fmov	%f0, %f19
	jal	cos.2623
	fmov	%f20, %f0
	fmov	%f0, %f19
	jal	sin.2625
	fmov	%f19, %f0
	flw	%f21, 1(%v1)
	fmov	%f0, %f21
	jal	cos.2623
	fmov	%f22, %f0
	fmov	%f0, %f21
	jal	sin.2625
	fmov	%f21, %f0
	flw	%f23, 2(%v1)
	fmov	%f0, %f23
	jal	cos.2623
	fmov	%f24, %f0
	fmov	%f0, %f23
	jal	sin.2625
	fmul	%f1, %f22, %f24
	fmul	%f2, %f19, %f21
	fmul	%f17, %f2, %f24
	fmul	%f16, %f20, %f0
	fsub	%f18, %f17, %f16
	fmul	%f25, %f20, %f21
	fmul	%f17, %f25, %f24
	fmul	%f16, %f19, %f0
	fadd	%f23, %f17, %f16
	fmul	%f16, %f22, %f0
	fmul	%f2, %f2, %f0
	fmul	%f17, %f20, %f24
	fadd	%f2, %f2, %f17
	fmul	%f17, %f25, %f0
	fmul	%f0, %f19, %f24
	fsub	%f24, %f17, %f0
	fneg	%f17, %f21
	fmul	%f19, %f19, %f22
	fmul	%f20, %f20, %f22
	flw	%f21, 0(%v0)
	flw	%f22, 1(%v0)
	flw	%f25, 2(%v0)
	fmov	%f0, %f1
	jal	fsqr.2606
	fmul	%f26, %f21, %f0
	fmov	%f0, %f16
	jal	fsqr.2606
	fmul	%f0, %f22, %f0
	fadd	%f26, %f26, %f0
	fmov	%f0, %f17
	jal	fsqr.2606
	fmul	%f0, %f25, %f0
	fadd	%f0, %f26, %f0
	fsw	%f0, 0(%v0)
	fmov	%f0, %f18
	jal	fsqr.2606
	fmul	%f26, %f21, %f0
	fmov	%f0, %f2
	jal	fsqr.2606
	fmul	%f0, %f22, %f0
	fadd	%f26, %f26, %f0
	fmov	%f0, %f19
	jal	fsqr.2606
	fmul	%f0, %f25, %f0
	fadd	%f0, %f26, %f0
	fsw	%f0, 1(%v0)
	fmov	%f0, %f23
	jal	fsqr.2606
	fmul	%f26, %f21, %f0
	fmov	%f0, %f24
	jal	fsqr.2606
	fmul	%f0, %f22, %f0
	fadd	%f26, %f26, %f0
	fmov	%f0, %f20
	jal	fsqr.2606
	fmul	%f0, %f25, %f0
	fadd	%f0, %f26, %f0
	fsw	%f0, 2(%v0)
	flw	%f26, 468(%zero)
	fmul	%f0, %f21, %f18
	fmul	%f27, %f0, %f23
	fmul	%f0, %f22, %f2
	fmul	%f0, %f0, %f24
	fadd	%f27, %f27, %f0
	fmul	%f0, %f25, %f19
	fmul	%f0, %f0, %f20
	fadd	%f0, %f27, %f0
	fmul	%f0, %f26, %f0
	fsw	%f0, 0(%v1)
	fmul	%f27, %f21, %f1
	fmul	%f1, %f27, %f23
	fmul	%f21, %f22, %f16
	fmul	%f0, %f21, %f24
	fadd	%f1, %f1, %f0
	fmul	%f16, %f25, %f17
	fmul	%f0, %f16, %f20
	fadd	%f0, %f1, %f0
	fmul	%f0, %f26, %f0
	fsw	%f0, 1(%v1)
	fmul	%f1, %f27, %f18
	fmul	%f0, %f21, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f19
	fadd	%f0, %f1, %f0
	fmul	%f0, %f26, %f0
	add	%ra, %zero, %a3
	fsw	%f0, 2(%v1)
	jr	%ra
read_nth_object.2770:
	add	%a0, %zero, %v0
	add	%k0, %zero, %ra
	jal	min_caml_read_int
	addi	%a1, %v0, 0
	beqi	%a1, -1, bnei_else.8259
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	jal	min_caml_read_int
	addi	%a3, %v0, 0
	jal	min_caml_read_int
	addi	%s0, %v0, 0
	addi	%s1, %zero, 3
	flw	%f16, 482(%zero)
	addi	%v0, %s1, 0
	fmov	%f0, %f16
	jal	min_caml_create_float_array
	addi	%s2, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s2)
	jal	min_caml_read_float
	fsw	%f0, 1(%s2)
	addi	%s5, %zero, 2
	jal	min_caml_read_float
	fsw	%f0, 2(%s2)
	addi	%v0, %s1, 0
	fmov	%f0, %f16
	jal	min_caml_create_float_array
	addi	%s3, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s3)
	jal	min_caml_read_float
	fsw	%f0, 1(%s3)
	jal	min_caml_read_float
	fsw	%f0, 2(%s3)
	jal	min_caml_read_float
	jal	fisneg.2597
	addi	%s4, %v0, 0
	addi	%v0, %s5, 0
	fmov	%f0, %f16
	jal	min_caml_create_float_array
	addi	%s5, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s5)
	jal	min_caml_read_float
	fsw	%f0, 1(%s5)
	addi	%v0, %s1, 0
	fmov	%f0, %f16
	jal	min_caml_create_float_array
	addi	%s6, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s6)
	jal	min_caml_read_float
	fsw	%f0, 1(%s6)
	jal	min_caml_read_float
	fsw	%f0, 2(%s6)
	addi	%v0, %s1, 0
	fmov	%f0, %f16
	jal	min_caml_create_float_array
	addi	%s1, %v0, 0
	beqi	%s0, 0, bnei_else.8260
	jal	min_caml_read_float
	jal	rad.2761
	fsw	%f0, 0(%s1)
	jal	min_caml_read_float
	jal	rad.2761
	fsw	%f0, 1(%s1)
	jal	min_caml_read_float
	jal	rad.2761
	fsw	%f0, 2(%s1)
	j	bnei_cont.8261
bnei_else.8260:
bnei_cont.8261:
	beqi	%a2, 2, bnei_else.8262
	add	%s7, %zero, %s4
	j	bnei_cont.8263
bnei_else.8262:
	addi	%s7, %zero, 1
bnei_cont.8263:
	addi	%v0, %zero, 4
	fmov	%f0, %f16
	jal	min_caml_create_float_array
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%ra)
	sw	%s1, 9(%ra)
	sw	%s6, 8(%ra)
	sw	%s5, 7(%ra)
	sw	%s7, 6(%ra)
	sw	%s3, 5(%ra)
	sw	%s2, 4(%ra)
	sw	%s0, 3(%ra)
	sw	%a3, 2(%ra)
	sw	%a2, 1(%ra)
	sw	%a1, 0(%ra)
	sw	%ra, 12(%a0)
	beqi	%a2, 3, bnei_else.8264
	beqi	%a2, 2, bnei_else.8266
	j	bnei_cont.8265
bnei_else.8266:
	beqi	%s4, 0, bnei_else.8268
	addi	%v1, %zero, 0
	j	bnei_cont.8269
bnei_else.8268:
	addi	%v1, %zero, 1
bnei_cont.8269:
	addi	%v0, %s2, 0
	jal	vecunit_sgn.2662
bnei_cont.8267:
	j	bnei_cont.8265
bnei_else.8264:
	flw	%f17, 0(%s2)
	fmov	%f0, %f17
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8270
	fmov	%f0, %f16
	j	bnei_cont.8271
bnei_else.8270:
	fmov	%f0, %f17
	jal	sgn.2636
	fmov	%f1, %f0
	fmov	%f0, %f17
	jal	fsqr.2606
	fdiv	%f0, %f1, %f0
bnei_cont.8271:
	fsw	%f0, 0(%s2)
	flw	%f17, 1(%s2)
	fmov	%f0, %f17
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8272
	fmov	%f0, %f16
	j	bnei_cont.8273
bnei_else.8272:
	fmov	%f0, %f17
	jal	sgn.2636
	fmov	%f1, %f0
	fmov	%f0, %f17
	jal	fsqr.2606
	fdiv	%f0, %f1, %f0
bnei_cont.8273:
	fsw	%f0, 1(%s2)
	flw	%f17, 2(%s2)
	fmov	%f0, %f17
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8274
	j	bnei_cont.8275
bnei_else.8274:
	fmov	%f0, %f17
	jal	sgn.2636
	fmov	%f1, %f0
	fmov	%f0, %f17
	jal	fsqr.2606
	fdiv	%f16, %f1, %f0
bnei_cont.8275:
	fsw	%f16, 2(%s2)
bnei_cont.8265:
	beqi	%s0, 0, bnei_else.8276
	addi	%v1, %s1, 0
	addi	%v0, %s2, 0
	jal	rotate_quadratic_matrix.2767
	j	bnei_cont.8277
bnei_else.8276:
bnei_cont.8277:
	add	%ra, %zero, %k0
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8259:
	add	%ra, %zero, %k0
	addi	%v0, %zero, 0
	jr	%ra
read_object.2772:
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra
	blti	%t7, 60, bgti_else.8304
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.8304:
	addi	%v0, %t7, 0
	jal	read_nth_object.2770
	beqi	%v0, 0, bnei_else.8306
	addi	%v0, %t7, 1
	add	%ra, %zero, %t8
	j	read_object.2772
bnei_else.8306:
	add	%ra, %zero, %t8
	sw	%t7, 0(%zero)
	jr	%ra
read_all_object.2774:
	addi	%v0, %zero, 0
	j	read_object.2772
read_net_item.2776:
	sw	%v0, 0(%sp)
	sw	%t0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	addi	%t0, %v0, 0
	addi	%v1, %zero, -1
	beqi	%t0, -1, bnei_else.8360
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	addi	%sp, %sp, 3
	jal	read_net_item.2776
	addi	%sp, %sp, -3
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%t0, 0(%at)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.8360:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	j	min_caml_create_array
read_or_network.2778:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	read_net_item.2776
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	sw	%v1, 2(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.8394
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	addi	%sp, %sp, 3
	jal	read_or_network.2778
	addi	%sp, %sp, -3
	lw	%a1, 2(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%a1, 0(%at)
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.8394:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	j	min_caml_create_array
read_and_network.2780:
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	addi	%v0, %zero, 0
	jal	read_net_item.2776
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.8417
	sw	%v0, 83(%a1)
	addi	%v0, %a1, 1
	add	%ra, %zero, %a2
	j	read_and_network.2780
bnei_else.8417:
	add	%ra, %zero, %a2
	jr	%ra
read_parameter.2782:
	add	%t9, %zero, %ra
	jal	read_screen_settings.2763
	jal	read_light.2765
	jal	read_all_object.2774
	addi	%a3, %zero, 0
	addi	%v0, %a3, 0
	jal	read_and_network.2780
	addi	%v0, %a3, 0
	jal	read_or_network.2778
	add	%ra, %zero, %t9
	sw	%v0, 134(%zero)
	jr	%ra
solver_rect_surface.2784:
	fmov	%f16, %f0
	fmov	%f17, %f1
	add	%a3, %zero, %v0
	add	%k0, %zero, %v1
	add	%s0, %zero, %a0
	add	%s1, %zero, %ra
	add	%at, %k0, %s0
	flw	%f18, 0(%at)
	fmov	%f0, %f18
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8466
	add	%ra, %zero, %s1
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8466:
	addi	%v0, %a3, 0
	jal	o_param_abc.2706
	addi	%s2, %v0, 0
	addi	%v0, %a3, 0
	jal	o_isinvert.2696
	addi	%a0, %v0, 0
	fmov	%f0, %f18
	jal	fisneg.2597
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	jal	xor.2601
	add	%at, %s2, %s0
	flw	%f0, 0(%at)
	jal	fneg_cond.2638
	fsub	%f0, %f0, %f16
	fdiv	%f16, %f0, %f18
	add	%at, %k0, %a1
	flw	%f0, 0(%at)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f17
	fabs	%f0, %f0
	add	%at, %s2, %a1
	flw	%f1, 0(%at)
	jal	fless.2592
	beqi	%v0, 0, bnei_else.8467
	add	%at, %k0, %a2
	flw	%f0, 0(%at)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	add	%at, %s2, %a2
	flw	%f1, 0(%at)
	jal	fless.2592
	beqi	%v0, 0, bnei_else.8468
	fsw	%f16, 135(%zero)
	add	%ra, %zero, %s1
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8468:
	add	%ra, %zero, %s1
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8467:
	add	%ra, %zero, %s1
	addi	%v0, %zero, 0
	jr	%ra
solver_rect.2793:
	fmov	%f19, %f0
	fmov	%f20, %f1
	fmov	%f21, %f2
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %ra
	addi	%t7, %zero, 0
	addi	%s7, %zero, 1
	addi	%s6, %zero, 2
	addi	%a2, %s6, 0
	addi	%a1, %s7, 0
	addi	%a0, %t7, 0
	addi	%v1, %s4, 0
	addi	%v0, %s3, 0
	fmov	%f2, %f21
	fmov	%f1, %f20
	fmov	%f0, %f19
	jal	solver_rect_surface.2784
	beqi	%v0, 0, bnei_else.8496
	add	%ra, %zero, %s5
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8496:
	addi	%a2, %t7, 0
	addi	%a1, %s6, 0
	addi	%a0, %s7, 0
	addi	%v1, %s4, 0
	addi	%v0, %s3, 0
	fmov	%f2, %f19
	fmov	%f1, %f21
	fmov	%f0, %f20
	jal	solver_rect_surface.2784
	beqi	%v0, 0, bnei_else.8497
	add	%ra, %zero, %s5
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.8497:
	addi	%a2, %s7, 0
	addi	%a1, %t7, 0
	addi	%a0, %s6, 0
	addi	%v1, %s4, 0
	addi	%v0, %s3, 0
	fmov	%f2, %f20
	fmov	%f1, %f19
	fmov	%f0, %f21
	jal	solver_rect_surface.2784
	beqi	%v0, 0, bnei_else.8498
	add	%ra, %zero, %s5
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.8498:
	add	%ra, %zero, %s5
	addi	%v0, %zero, 0
	jr	%ra
solver_surface.2799:
	fmov	%f17, %f0
	fmov	%f18, %f1
	add	%a0, %zero, %v1
	add	%a1, %zero, %ra
	jal	o_param_abc.2706
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	jal	veciprod.2665
	fmov	%f19, %f0
	fmov	%f0, %f19
	jal	fispos.2595
	beqi	%v0, 0, bnei_else.8520
	addi	%v0, %v1, 0
	fmov	%f1, %f18
	fmov	%f0, %f17
	jal	veciprod2.2668
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f19
	fsw	%f0, 135(%zero)
	add	%ra, %zero, %a1
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8520:
	add	%ra, %zero, %a1
	addi	%v0, %zero, 0
	jr	%ra
quadratic.2805:
	fmov	%f16, %f0
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	fmov	%f0, %f16
	jal	fsqr.2606
	fmov	%f17, %f0
	addi	%v0, %a1, 0
	jal	o_param_a.2700
	fmul	%f18, %f17, %f0
	fmov	%f0, %f1
	jal	fsqr.2606
	fmov	%f17, %f0
	addi	%v0, %a1, 0
	jal	o_param_b.2702
	fmul	%f0, %f17, %f0
	fadd	%f18, %f18, %f0
	fmov	%f0, %f2
	jal	fsqr.2606
	fmov	%f17, %f0
	addi	%v0, %a1, 0
	jal	o_param_c.2704
	fmul	%f0, %f17, %f0
	fadd	%f17, %f18, %f0
	addi	%v0, %a1, 0
	jal	o_isrot.2698
	beqi	%v0, 0, bnei_else.8542
	fmul	%f18, %f1, %f2
	addi	%v0, %a1, 0
	jal	o_param_r1.2724
	fmul	%f0, %f18, %f0
	fadd	%f18, %f17, %f0
	fmul	%f17, %f2, %f16
	addi	%v0, %a1, 0
	jal	o_param_r2.2726
	fmul	%f0, %f17, %f0
	fadd	%f17, %f18, %f0
	fmul	%f1, %f16, %f1
	addi	%v0, %a1, 0
	jal	o_param_r3.2728
	fmul	%f0, %f1, %f0
	add	%ra, %zero, %a2
	fadd	%f0, %f17, %f0
	jr	%ra
bnei_else.8542:
	add	%ra, %zero, %a2
	fmov	%f0, %f17
	jr	%ra
bilinear.2810:
	fmov	%f16, %f0
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	fmul	%f17, %f16, %f3
	addi	%v0, %a1, 0
	jal	o_param_a.2700
	fmul	%f18, %f17, %f0
	fmul	%f17, %f1, %f4
	addi	%v0, %a1, 0
	jal	o_param_b.2702
	fmul	%f0, %f17, %f0
	fadd	%f18, %f18, %f0
	fmul	%f17, %f2, %f5
	addi	%v0, %a1, 0
	jal	o_param_c.2704
	fmul	%f0, %f17, %f0
	fadd	%f17, %f18, %f0
	addi	%v0, %a1, 0
	jal	o_isrot.2698
	beqi	%v0, 0, bnei_else.8564
	fmul	%f18, %f2, %f4
	fmul	%f0, %f1, %f5
	fadd	%f18, %f18, %f0
	addi	%v0, %a1, 0
	jal	o_param_r1.2724
	fmul	%f19, %f18, %f0
	fmul	%f18, %f16, %f5
	fmul	%f0, %f2, %f3
	fadd	%f18, %f18, %f0
	addi	%v0, %a1, 0
	jal	o_param_r2.2726
	fmul	%f0, %f18, %f0
	fadd	%f18, %f19, %f0
	fmul	%f16, %f16, %f4
	fmul	%f0, %f1, %f3
	fadd	%f1, %f16, %f0
	addi	%v0, %a1, 0
	jal	o_param_r3.2728
	fmul	%f0, %f1, %f0
	fadd	%f0, %f18, %f0
	jal	fhalf.2604
	add	%ra, %zero, %a2
	fadd	%f0, %f17, %f0
	jr	%ra
bnei_else.8564:
	add	%ra, %zero, %a2
	fmov	%f0, %f17
	jr	%ra
solver_second.2818:
	fmov	%f3, %f0
	fmov	%f4, %f1
	fmov	%f5, %f2
	add	%a3, %zero, %v0
	add	%k0, %zero, %ra
	flw	%f20, 0(%v1)
	flw	%f19, 1(%v1)
	flw	%f2, 2(%v1)
	addi	%v0, %a3, 0
	fmov	%f1, %f19
	fmov	%f0, %f20
	jal	quadratic.2805
	fmov	%f21, %f0
	fmov	%f0, %f21
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8595
	add	%ra, %zero, %k0
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8595:
	addi	%v0, %a3, 0
	fmov	%f1, %f19
	fmov	%f0, %f20
	jal	bilinear.2810
	fmov	%f19, %f0
	addi	%v0, %a3, 0
	fmov	%f2, %f5
	fmov	%f1, %f4
	fmov	%f0, %f3
	jal	quadratic.2805
	fmov	%f1, %f0
	addi	%v0, %a3, 0
	jal	o_form.2692
	beqi	%v0, 3, bnei_else.8596
	j	bnei_cont.8597
bnei_else.8596:
	flw	%f0, 477(%zero)
	fsub	%f1, %f1, %f0
bnei_cont.8597:
	fmov	%f0, %f19
	jal	fsqr.2606
	fmul	%f1, %f21, %f1
	fsub	%f0, %f0, %f1
	jal	fispos.2595
	beqi	%v0, 0, bnei_else.8598
	fsqrt	%f0, %f0
	addi	%v0, %a3, 0
	jal	o_isinvert.2696
	beqi	%v0, 0, bnei_else.8599
	j	bnei_cont.8600
bnei_else.8599:
	fneg	%f0, %f0
bnei_cont.8600:
	fsub	%f0, %f0, %f19
	fdiv	%f0, %f0, %f21
	fsw	%f0, 135(%zero)
	add	%ra, %zero, %k0
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8598:
	add	%ra, %zero, %k0
	addi	%v0, %zero, 0
	jr	%ra
solver.2824:
	add	%a1, %zero, %a0
	add	%a2, %zero, %ra
	lw	%a3, 12(%v0)
	flw	%f1, 0(%a1)
	addi	%v0, %a3, 0
	jal	o_param_x.2708
	fsub	%f16, %f1, %f0
	flw	%f1, 1(%a1)
	addi	%v0, %a3, 0
	jal	o_param_y.2710
	fsub	%f1, %f1, %f0
	flw	%f17, 2(%a1)
	addi	%v0, %a3, 0
	jal	o_param_z.2712
	fsub	%f2, %f17, %f0
	addi	%v0, %a3, 0
	jal	o_form.2692
	beqi	%v0, 1, bnei_else.8625
	beqi	%v0, 2, bnei_else.8626
	add	%ra, %zero, %a2
	addi	%v0, %a3, 0
	fmov	%f0, %f16
	j	solver_second.2818
bnei_else.8626:
	add	%ra, %zero, %a2
	addi	%v0, %a3, 0
	fmov	%f0, %f16
	j	solver_surface.2799
bnei_else.8625:
	add	%ra, %zero, %a2
	addi	%v0, %a3, 0
	fmov	%f0, %f16
	j	solver_rect.2793
solver_rect_fast.2828:
	fmov	%f16, %f0
	fmov	%f17, %f1
	add	%a1, %zero, %v0
	add	%a2, %zero, %a0
	add	%a3, %zero, %ra
	flw	%f0, 0(%a2)
	fsub	%f0, %f0, %f16
	flw	%f20, 1(%a2)
	fmul	%f21, %f0, %f20
	flw	%f22, 1(%v1)
	fmul	%f0, %f21, %f22
	fadd	%f0, %f0, %f17
	fabs	%f19, %f0
	addi	%v0, %a1, 0
	jal	o_param_b.2702
	fmov	%f18, %f0
	fmov	%f1, %f18
	fmov	%f0, %f19
	jal	fless.2592
	beqi	%v0, 0, bnei_else.8681
	flw	%f0, 2(%v1)
	fmul	%f0, %f21, %f0
	fadd	%f0, %f0, %f2
	fabs	%f19, %f0
	addi	%v0, %a1, 0
	jal	o_param_c.2704
	fmov	%f1, %f0
	fmov	%f0, %f19
	jal	fless.2592
	beqi	%v0, 0, bnei_else.8683
	fmov	%f0, %f20
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8685
	addi	%a0, %zero, 0
	j	bnei_cont.8682
bnei_else.8685:
	addi	%a0, %zero, 1
bnei_cont.8686:
	j	bnei_cont.8682
bnei_else.8683:
	addi	%a0, %zero, 0
bnei_cont.8684:
	j	bnei_cont.8682
bnei_else.8681:
	addi	%a0, %zero, 0
bnei_cont.8682:
	beqi	%a0, 0, bnei_else.8687
	fsw	%f21, 135(%zero)
	add	%ra, %zero, %a3
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8687:
	flw	%f0, 2(%a2)
	fsub	%f0, %f0, %f17
	flw	%f21, 3(%a2)
	fmul	%f24, %f0, %f21
	flw	%f23, 0(%v1)
	fmul	%f0, %f24, %f23
	fadd	%f0, %f0, %f16
	fabs	%f20, %f0
	addi	%v0, %a1, 0
	jal	o_param_a.2700
	fmov	%f19, %f0
	fmov	%f1, %f19
	fmov	%f0, %f20
	jal	fless.2592
	beqi	%v0, 0, bnei_else.8688
	flw	%f0, 2(%v1)
	fmul	%f0, %f24, %f0
	fadd	%f0, %f0, %f2
	fabs	%f20, %f0
	addi	%v0, %a1, 0
	jal	o_param_c.2704
	fmov	%f1, %f0
	fmov	%f0, %f20
	jal	fless.2592
	beqi	%v0, 0, bnei_else.8690
	fmov	%f0, %f21
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8692
	addi	%a0, %zero, 0
	j	bnei_cont.8689
bnei_else.8692:
	addi	%a0, %zero, 1
bnei_cont.8693:
	j	bnei_cont.8689
bnei_else.8690:
	addi	%a0, %zero, 0
bnei_cont.8691:
	j	bnei_cont.8689
bnei_else.8688:
	addi	%a0, %zero, 0
bnei_cont.8689:
	beqi	%a0, 0, bnei_else.8694
	fsw	%f24, 135(%zero)
	add	%ra, %zero, %a3
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.8694:
	flw	%f0, 4(%a2)
	fsub	%f0, %f0, %f2
	flw	%f2, 5(%a2)
	fmul	%f20, %f0, %f2
	fmul	%f0, %f20, %f23
	fadd	%f0, %f0, %f16
	fabs	%f0, %f0
	fmov	%f1, %f19
	jal	fless.2592
	beqi	%v0, 0, bnei_else.8695
	fmul	%f0, %f20, %f22
	fadd	%f0, %f0, %f17
	fabs	%f0, %f0
	fmov	%f1, %f18
	jal	fless.2592
	beqi	%v0, 0, bnei_else.8697
	fmov	%f0, %f2
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8699
	addi	%a0, %zero, 0
	j	bnei_cont.8696
bnei_else.8699:
	addi	%a0, %zero, 1
bnei_cont.8700:
	j	bnei_cont.8696
bnei_else.8697:
	addi	%a0, %zero, 0
bnei_cont.8698:
	j	bnei_cont.8696
bnei_else.8695:
	addi	%a0, %zero, 0
bnei_cont.8696:
	beqi	%a0, 0, bnei_else.8701
	fsw	%f20, 135(%zero)
	add	%ra, %zero, %a3
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.8701:
	add	%ra, %zero, %a3
	addi	%v0, %zero, 0
	jr	%ra
solver_surface_fast.2835:
	fmov	%f16, %f0
	fmov	%f17, %f1
	add	%a0, %zero, %ra
	flw	%f0, 0(%v1)
	jal	fisneg.2597
	beqi	%v0, 0, bnei_else.8723
	flw	%f0, 1(%v1)
	fmul	%f1, %f0, %f16
	flw	%f0, 2(%v1)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%ra, %zero, %a0
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8723:
	add	%ra, %zero, %a0
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2841:
	fmov	%f16, %f0
	fmov	%f17, %f1
	add	%a3, %zero, %v0
	add	%k0, %zero, %ra
	flw	%f19, 0(%v1)
	fmov	%f0, %f19
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8754
	add	%ra, %zero, %k0
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8754:
	flw	%f0, 1(%v1)
	fmul	%f1, %f0, %f16
	flw	%f0, 2(%v1)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f20, %f1, %f0
	addi	%v0, %a3, 0
	fmov	%f1, %f17
	fmov	%f0, %f16
	jal	quadratic.2805
	fmov	%f1, %f0
	addi	%v0, %a3, 0
	jal	o_form.2692
	beqi	%v0, 3, bnei_else.8755
	j	bnei_cont.8756
bnei_else.8755:
	flw	%f0, 477(%zero)
	fsub	%f1, %f1, %f0
bnei_cont.8756:
	fmov	%f0, %f20
	jal	fsqr.2606
	fmul	%f1, %f19, %f1
	fsub	%f0, %f0, %f1
	jal	fispos.2595
	beqi	%v0, 0, bnei_else.8757
	addi	%v0, %a3, 0
	jal	o_isinvert.2696
	beqi	%v0, 0, bnei_else.8758
	fsqrt	%f0, %f0
	fadd	%f1, %f20, %f0
	flw	%f0, 4(%v1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.8759
bnei_else.8758:
	fsqrt	%f0, %f0
	fsub	%f1, %f20, %f0
	flw	%f0, 4(%v1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.8759:
	add	%ra, %zero, %k0
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8757:
	add	%ra, %zero, %k0
	addi	%v0, %zero, 0
	jr	%ra
solver_fast.2847:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %a0
	add	%k0, %zero, %ra
	lw	%s0, 12(%a1)
	flw	%f1, 0(%a3)
	addi	%v0, %s0, 0
	jal	o_param_x.2708
	fsub	%f16, %f1, %f0
	flw	%f1, 1(%a3)
	addi	%v0, %s0, 0
	jal	o_param_y.2710
	fsub	%f1, %f1, %f0
	flw	%f17, 2(%a3)
	addi	%v0, %s0, 0
	jal	o_param_z.2712
	fsub	%f2, %f17, %f0
	addi	%v0, %a2, 0
	jal	d_const.2753
	add	%at, %v0, %a1
	lw	%v1, 0(%at)
	addi	%v0, %s0, 0
	jal	o_form.2692
	beqi	%v0, 1, bnei_else.8784
	beqi	%v0, 2, bnei_else.8785
	add	%ra, %zero, %k0
	addi	%v0, %s0, 0
	fmov	%f0, %f16
	j	solver_second_fast.2841
bnei_else.8785:
	add	%ra, %zero, %k0
	addi	%v0, %s0, 0
	fmov	%f0, %f16
	j	solver_surface_fast.2835
bnei_else.8784:
	addi	%v0, %a2, 0
	jal	d_vec.2751
	add	%ra, %zero, %k0
	addi	%a0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0
	fmov	%f0, %f16
	j	solver_rect_fast.2828
solver_surface_fast2.2851:
	add	%a1, %zero, %ra
	flw	%f0, 0(%v1)
	jal	fisneg.2597
	beqi	%v0, 0, bnei_else.8807
	flw	%f1, 3(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	add	%ra, %zero, %a1
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8807:
	add	%ra, %zero, %a1
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2858:
	fmov	%f16, %f0
	fmov	%f17, %f1
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	flw	%f18, 0(%v1)
	fmov	%f0, %f18
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8835
	add	%ra, %zero, %a2
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8835:
	flw	%f0, 1(%v1)
	fmul	%f1, %f0, %f16
	flw	%f0, 2(%v1)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 3(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f16, %f1, %f0
	flw	%f1, 3(%a0)
	fmov	%f0, %f16
	jal	fsqr.2606
	fmul	%f1, %f18, %f1
	fsub	%f0, %f0, %f1
	jal	fispos.2595
	beqi	%v0, 0, bnei_else.8836
	addi	%v0, %a1, 0
	jal	o_isinvert.2696
	beqi	%v0, 0, bnei_else.8837
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%v1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.8838
bnei_else.8837:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%v1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.8838:
	add	%ra, %zero, %a2
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8836:
	add	%ra, %zero, %a2
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2865:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	lw	%k0, 12(%a1)
	addi	%v0, %k0, 0
	jal	o_param_ctbl.2730
	addi	%a0, %v0, 0
	flw	%f0, 0(%a0)
	flw	%f1, 1(%a0)
	flw	%f2, 2(%a0)
	addi	%v0, %a2, 0
	jal	d_const.2753
	add	%at, %v0, %a1
	lw	%v1, 0(%at)
	addi	%v0, %k0, 0
	jal	o_form.2692
	beqi	%v0, 1, bnei_else.8863
	beqi	%v0, 2, bnei_else.8864
	add	%ra, %zero, %a3
	addi	%v0, %k0, 0
	j	solver_second_fast2.2858
bnei_else.8864:
	add	%ra, %zero, %a3
	addi	%v0, %k0, 0
	j	solver_surface_fast2.2851
bnei_else.8863:
	addi	%v0, %a2, 0
	jal	d_vec.2751
	add	%ra, %zero, %a3
	addi	%a0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	j	solver_rect_fast.2828
setup_rect_table.2868:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	addi	%v0, %zero, 6
	flw	%f16, 482(%zero)
	fmov	%f0, %f16
	jal	min_caml_create_float_array
	addi	%k0, %v0, 0
	flw	%f17, 0(%a1)
	fmov	%f0, %f17
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8892
	fsw	%f16, 1(%k0)
	j	bnei_cont.8893
bnei_else.8892:
	addi	%v0, %a2, 0
	jal	o_isinvert.2696
	addi	%a0, %v0, 0
	fmov	%f0, %f17
	jal	fisneg.2597
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	jal	xor.2601
	addi	%s0, %v0, 0
	addi	%v0, %a2, 0
	jal	o_param_a.2700
	addi	%v0, %s0, 0
	jal	fneg_cond.2638
	fsw	%f0, 0(%k0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f17
	fsw	%f0, 1(%k0)
bnei_cont.8893:
	flw	%f17, 1(%a1)
	fmov	%f0, %f17
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8894
	fsw	%f16, 3(%k0)
	j	bnei_cont.8895
bnei_else.8894:
	addi	%v0, %a2, 0
	jal	o_isinvert.2696
	addi	%a0, %v0, 0
	fmov	%f0, %f17
	jal	fisneg.2597
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	jal	xor.2601
	addi	%s0, %v0, 0
	addi	%v0, %a2, 0
	jal	o_param_b.2702
	addi	%v0, %s0, 0
	jal	fneg_cond.2638
	fsw	%f0, 2(%k0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f17
	fsw	%f0, 3(%k0)
bnei_cont.8895:
	flw	%f17, 2(%a1)
	fmov	%f0, %f17
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8896
	fsw	%f16, 5(%k0)
	j	bnei_cont.8897
bnei_else.8896:
	addi	%v0, %a2, 0
	jal	o_isinvert.2696
	addi	%a0, %v0, 0
	fmov	%f0, %f17
	jal	fisneg.2597
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	jal	xor.2601
	addi	%a1, %v0, 0
	addi	%v0, %a2, 0
	jal	o_param_c.2704
	addi	%v0, %a1, 0
	jal	fneg_cond.2638
	fsw	%f0, 4(%k0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f17
	fsw	%f0, 5(%k0)
bnei_cont.8897:
	add	%ra, %zero, %a3
	add	%v0, %zero, %k0
	jr	%ra
setup_surface_table.2871:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	addi	%v0, %zero, 4
	flw	%f16, 482(%zero)
	fmov	%f0, %f16
	jal	min_caml_create_float_array
	addi	%k0, %v0, 0
	flw	%f1, 0(%a1)
	addi	%v0, %a2, 0
	jal	o_param_a.2700
	fmov	%f17, %f0
	fmul	%f19, %f1, %f17
	flw	%f1, 1(%a1)
	addi	%v0, %a2, 0
	jal	o_param_b.2702
	fmov	%f18, %f0
	fmul	%f0, %f1, %f18
	fadd	%f2, %f19, %f0
	flw	%f1, 2(%a1)
	addi	%v0, %a2, 0
	jal	o_param_c.2704
	fmov	%f19, %f0
	fmul	%f0, %f1, %f19
	fadd	%f0, %f2, %f0
	jal	fispos.2595
	beqi	%v0, 0, bnei_else.8919
	flw	%f1, 461(%zero)
	fdiv	%f1, %f1, %f0
	fsw	%f1, 0(%k0)
	fdiv	%f1, %f17, %f0
	fneg	%f1, %f1
	fsw	%f1, 1(%k0)
	fdiv	%f1, %f18, %f0
	fneg	%f1, %f1
	fsw	%f1, 2(%k0)
	fdiv	%f0, %f19, %f0
	fneg	%f0, %f0
	fsw	%f0, 3(%k0)
	j	bnei_cont.8920
bnei_else.8919:
	fsw	%f16, 0(%k0)
bnei_cont.8920:
	add	%ra, %zero, %a3
	add	%v0, %zero, %k0
	jr	%ra
setup_second_table.2874:
	add	%a0, %zero, %v0
	add	%a3, %zero, %v1
	add	%k0, %zero, %ra
	addi	%v0, %zero, 5
	flw	%f0, 482(%zero)
	jal	min_caml_create_float_array
	addi	%s0, %v0, 0
	flw	%f20, 0(%a0)
	flw	%f19, 1(%a0)
	flw	%f2, 2(%a0)
	addi	%v0, %a3, 0
	fmov	%f1, %f19
	fmov	%f0, %f20
	jal	quadratic.2805
	fmov	%f16, %f0
	addi	%v0, %a3, 0
	jal	o_param_a.2700
	fmul	%f0, %f20, %f0
	fneg	%f21, %f0
	addi	%v0, %a3, 0
	jal	o_param_b.2702
	fmul	%f0, %f19, %f0
	fneg	%f23, %f0
	addi	%v0, %a3, 0
	jal	o_param_c.2704
	fmul	%f0, %f2, %f0
	fneg	%f22, %f0
	fsw	%f16, 0(%s0)
	addi	%v0, %a3, 0
	jal	o_isrot.2698
	beqi	%v0, 0, bnei_else.8945
	addi	%v0, %a3, 0
	jal	o_param_r2.2726
	fmov	%f17, %f0
	fmul	%f1, %f2, %f17
	addi	%v0, %a3, 0
	jal	o_param_r3.2728
	fmov	%f18, %f0
	fmul	%f0, %f19, %f18
	fadd	%f0, %f1, %f0
	jal	fhalf.2604
	fsub	%f0, %f21, %f0
	fsw	%f0, 1(%s0)
	addi	%v0, %a3, 0
	jal	o_param_r1.2724
	fmov	%f21, %f0
	fmul	%f1, %f2, %f21
	fmul	%f0, %f20, %f18
	fadd	%f0, %f1, %f0
	jal	fhalf.2604
	fsub	%f0, %f23, %f0
	fsw	%f0, 2(%s0)
	fmul	%f1, %f19, %f21
	fmul	%f0, %f20, %f17
	fadd	%f0, %f1, %f0
	jal	fhalf.2604
	fsub	%f0, %f22, %f0
	fsw	%f0, 3(%s0)
	j	bnei_cont.8946
bnei_else.8945:
	fsw	%f21, 1(%s0)
	fsw	%f23, 2(%s0)
	fsw	%f22, 3(%s0)
bnei_cont.8946:
	fmov	%f0, %f16
	jal	fiszero.2599
	beqi	%v0, 0, bnei_else.8947
	j	bnei_cont.8948
bnei_else.8947:
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f16
	fsw	%f0, 4(%s0)
bnei_cont.8948:
	add	%ra, %zero, %k0
	add	%v0, %zero, %s0
	jr	%ra
iter_setup_dirvec_constants.2877:
	add	%s1, %zero, %v0
	add	%s2, %zero, %v1
	add	%s3, %zero, %ra
	blti	%s2, 0, bgti_else.8977
	lw	%v1, 12(%s2)
	addi	%v0, %s1, 0
	jal	d_const.2753
	addi	%s4, %v0, 0
	addi	%v0, %s1, 0
	jal	d_vec.2751
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	jal	o_form.2692
	beqi	%v0, 1, bnei_else.8978
	beqi	%v0, 2, bnei_else.8980
	addi	%v0, %a0, 0
	jal	setup_second_table.2874
	add	%at, %s4, %s2
	sw	%v0, 0(%at)
	j	bnei_cont.8979
bnei_else.8980:
	addi	%v0, %a0, 0
	jal	setup_surface_table.2871
	add	%at, %s4, %s2
	sw	%v0, 0(%at)
bnei_cont.8981:
	j	bnei_cont.8979
bnei_else.8978:
	addi	%v0, %a0, 0
	jal	setup_rect_table.2868
	add	%at, %s4, %s2
	sw	%v0, 0(%at)
bnei_cont.8979:
	addi	%v1, %s2, -1
	add	%ra, %zero, %s3
	addi	%v0, %s1, 0
	j	iter_setup_dirvec_constants.2877
bgti_else.8977:
	add	%ra, %zero, %s3
	jr	%ra
setup_dirvec_constants.2880:
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	j	iter_setup_dirvec_constants.2877
setup_startp_constants.2882:
	add	%a3, %zero, %v0
	add	%k0, %zero, %ra
	blti	%v1, 0, bgti_else.9032
	lw	%a1, 12(%v1)
	addi	%v0, %a1, 0
	jal	o_param_ctbl.2730
	addi	%s0, %v0, 0
	addi	%v0, %a1, 0
	jal	o_form.2692
	addi	%s1, %v0, 0
	flw	%f1, 0(%a3)
	addi	%v0, %a1, 0
	jal	o_param_x.2708
	fsub	%f0, %f1, %f0
	fsw	%f0, 0(%s0)
	flw	%f1, 1(%a3)
	addi	%v0, %a1, 0
	jal	o_param_y.2710
	fsub	%f0, %f1, %f0
	fsw	%f0, 1(%s0)
	flw	%f1, 2(%a3)
	addi	%v0, %a1, 0
	jal	o_param_z.2712
	fsub	%f0, %f1, %f0
	fsw	%f0, 2(%s0)
	beqi	%s1, 2, bnei_else.9033
	addi	%at, %zero, 2
	blt	%at, %s1, bgt_else.9035
	j	bnei_cont.9034
bgt_else.9035:
	flw	%f0, 0(%s0)
	flw	%f1, 1(%s0)
	flw	%f2, 2(%s0)
	addi	%v0, %a1, 0
	jal	quadratic.2805
	beqi	%s1, 3, bnei_else.9037
	j	bnei_cont.9038
bnei_else.9037:
	flw	%f1, 477(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.9038:
	fsw	%f0, 3(%s0)
bgt_cont.9036:
	j	bnei_cont.9034
bnei_else.9033:
	addi	%v0, %a1, 0
	jal	o_param_abc.2706
	flw	%f0, 0(%s0)
	flw	%f1, 1(%s0)
	flw	%f2, 2(%s0)
	jal	veciprod2.2668
	fsw	%f0, 3(%s0)
bnei_cont.9034:
	addi	%v1, %v1, -1
	add	%ra, %zero, %k0
	addi	%v0, %a3, 0
	j	setup_startp_constants.2882
bgti_else.9032:
	add	%ra, %zero, %k0
	jr	%ra
setup_startp.2885:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	addi	%v0, %zero, 162
	addi	%v1, %a0, 0
	jal	veccpy.2654
	lw	%a2, 0(%zero)
	addi	%v1, %a2, -1
	add	%ra, %zero, %a1
	addi	%v0, %a0, 0
	j	setup_startp_constants.2882
is_rect_outside.2887:
	fmov	%f16, %f1
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	fabs	%f17, %f0
	addi	%v0, %a1, 0
	jal	o_param_a.2700
	fmov	%f1, %f0
	fmov	%f0, %f17
	jal	fless.2592
	beqi	%v0, 0, bnei_else.9088
	fabs	%f16, %f16
	addi	%v0, %a1, 0
	jal	o_param_b.2702
	fmov	%f1, %f0
	fmov	%f0, %f16
	jal	fless.2592
	beqi	%v0, 0, bnei_else.9090
	fabs	%f16, %f2
	addi	%v0, %a1, 0
	jal	o_param_c.2704
	fmov	%f1, %f0
	fmov	%f0, %f16
	jal	fless.2592
	j	bnei_cont.9089
bnei_else.9090:
	addi	%v0, %zero, 0
bnei_cont.9091:
	j	bnei_cont.9089
bnei_else.9088:
	addi	%v0, %zero, 0
bnei_cont.9089:
	beqi	%v0, 0, bnei_else.9092
	add	%ra, %zero, %a2
	addi	%v0, %a1, 0
	j	o_isinvert.2696
bnei_else.9092:
	addi	%v0, %a1, 0
	jal	o_isinvert.2696
	beqi	%v0, 0, bnei_else.9093
	add	%ra, %zero, %a2
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.9093:
	add	%ra, %zero, %a2
	addi	%v0, %zero, 1
	jr	%ra
is_plane_outside.2892:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	addi	%v0, %a0, 0
	jal	o_param_abc.2706
	jal	veciprod2.2668
	addi	%v0, %a0, 0
	jal	o_isinvert.2696
	addi	%a0, %v0, 0
	jal	fisneg.2597
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	jal	xor.2601
	beqi	%v0, 0, bnei_else.9115
	add	%ra, %zero, %a1
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.9115:
	add	%ra, %zero, %a1
	addi	%v0, %zero, 1
	jr	%ra
is_second_outside.2897:
	add	%a3, %zero, %v0
	add	%k0, %zero, %ra
	addi	%v0, %a3, 0
	jal	quadratic.2805
	addi	%v0, %a3, 0
	jal	o_form.2692
	beqi	%v0, 3, bnei_else.9140
	j	bnei_cont.9141
bnei_else.9140:
	flw	%f1, 477(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.9141:
	addi	%v0, %a3, 0
	jal	o_isinvert.2696
	addi	%a0, %v0, 0
	jal	fisneg.2597
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	jal	xor.2601
	beqi	%v0, 0, bnei_else.9142
	add	%ra, %zero, %k0
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.9142:
	add	%ra, %zero, %k0
	addi	%v0, %zero, 1
	jr	%ra
is_outside.2902:
	fmov	%f16, %f0
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	addi	%v0, %a1, 0
	jal	o_param_x.2708
	fsub	%f16, %f16, %f0
	addi	%v0, %a1, 0
	jal	o_param_y.2710
	fsub	%f1, %f1, %f0
	addi	%v0, %a1, 0
	jal	o_param_z.2712
	fsub	%f2, %f2, %f0
	addi	%v0, %a1, 0
	jal	o_form.2692
	beqi	%v0, 1, bnei_else.9167
	beqi	%v0, 2, bnei_else.9168
	add	%ra, %zero, %a2
	addi	%v0, %a1, 0
	fmov	%f0, %f16
	j	is_second_outside.2897
bnei_else.9168:
	add	%ra, %zero, %a2
	addi	%v0, %a1, 0
	fmov	%f0, %f16
	j	is_plane_outside.2892
bnei_else.9167:
	add	%ra, %zero, %a2
	addi	%v0, %a1, 0
	fmov	%f0, %f16
	j	is_rect_outside.2887
check_all_inside.2907:
	fmov	%f19, %f0
	fmov	%f20, %f1
	fmov	%f21, %f2
	add	%s0, %zero, %v0
	add	%s1, %zero, %v1
	add	%s2, %zero, %ra
	add	%at, %s1, %s0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.9193
	lw	%v0, 12(%a0)
	fmov	%f2, %f21
	fmov	%f1, %f20
	fmov	%f0, %f19
	jal	is_outside.2902
	beqi	%v0, 0, bnei_else.9194
	add	%ra, %zero, %s2
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.9194:
	addi	%v0, %s0, 1
	add	%ra, %zero, %s2
	addi	%v1, %s1, 0
	fmov	%f2, %f21
	fmov	%f1, %f20
	fmov	%f0, %f19
	j	check_all_inside.2907
bnei_else.9193:
	add	%ra, %zero, %s2
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2913:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %ra
	add	%at, %s4, %s3
	lw	%s1, 0(%at)
	beqi	%s1, -1, bnei_else.9228
	addi	%a0, %zero, 138
	addi	%v1, %zero, 247
	addi	%v0, %s1, 0
	jal	solver_fast.2847
	addi	%a0, %zero, 0
	flw	%f0, 135(%zero)
	beqi	%v0, 0, bnei_else.9229
	flw	%f1, 457(%zero)
	jal	fless.2592
	j	bnei_cont.9230
bnei_else.9229:
	addi	%v0, %zero, 0
bnei_cont.9230:
	beqi	%v0, 0, bnei_else.9231
	flw	%f1, 456(%zero)
	fadd	%f17, %f0, %f1
	flw	%f0, 78(%zero)
	fmul	%f1, %f0, %f17
	flw	%f0, 138(%zero)
	fadd	%f0, %f1, %f0
	flw	%f1, 79(%zero)
	fmul	%f16, %f1, %f17
	flw	%f1, 139(%zero)
	fadd	%f1, %f16, %f1
	flw	%f16, 80(%zero)
	fmul	%f17, %f16, %f17
	flw	%f16, 140(%zero)
	fadd	%f2, %f17, %f16
	addi	%v1, %s4, 0
	addi	%v0, %a0, 0
	jal	check_all_inside.2907
	beqi	%v0, 0, bnei_else.9232
	add	%ra, %zero, %s5
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.9232:
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5
	addi	%v1, %s4, 0
	j	shadow_check_and_group.2913
bnei_else.9231:
	lw	%v0, 12(%s1)
	jal	o_isinvert.2696
	beqi	%v0, 0, bnei_else.9233
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5
	addi	%v1, %s4, 0
	j	shadow_check_and_group.2913
bnei_else.9233:
	add	%ra, %zero, %s5
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.9228:
	add	%ra, %zero, %s5
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2916:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %ra
	add	%at, %s7, %s6
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.9258
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913
	beqi	%v0, 0, bnei_else.9259
	add	%ra, %zero, %t7
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.9259:
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7
	addi	%v1, %s7, 0
	j	shadow_check_one_or_group.2916
bnei_else.9258:
	add	%ra, %zero, %t7
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2919:
	sw	%v0, 0(%sp)
	add	%t9, %zero, %v1
	add	%t8, %zero, %ra
	add	%at, %t9, %v0
	lw	%a0, 0(%at)
	sw	%a0, 1(%sp)
	lw	%v0, 0(%a0)
	beqi	%v0, -1, bnei_else.9326
	beqi	%v0, 99, bnei_else.9327
	addi	%a0, %zero, 138
	addi	%v1, %zero, 247
	addi	%sp, %sp, 2
	jal	solver_fast.2847
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.9329
	flw	%f0, 135(%zero)
	flw	%f1, 455(%zero)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.9331
	addi	%v0, %zero, 1
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 2
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.9333
	addi	%a0, %zero, 1
	j	bnei_cont.9328
bnei_else.9333:
	addi	%a0, %zero, 0
bnei_cont.9334:
	j	bnei_cont.9328
bnei_else.9331:
	addi	%a0, %zero, 0
bnei_cont.9332:
	j	bnei_cont.9328
bnei_else.9329:
	addi	%a0, %zero, 0
bnei_cont.9330:
	j	bnei_cont.9328
bnei_else.9327:
	addi	%a0, %zero, 1
bnei_cont.9328:
	beqi	%a0, 0, bnei_else.9335
	addi	%v0, %zero, 1
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 2
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.9336
	add	%ra, %zero, %t8
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.9336:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	add	%ra, %zero, %t8
	addi	%v1, %t9, 0
	j	shadow_check_one_or_matrix.2919
bnei_else.9335:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	add	%ra, %zero, %t8
	addi	%v1, %t9, 0
	j	shadow_check_one_or_matrix.2919
bnei_else.9326:
	add	%ra, %zero, %t8
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2922:
	sw	%v0, 0(%sp)
	add	%t8, %zero, %v1
	add	%t9, %zero, %a0
	add	%a0, %zero, %t0
	sw	%a0, 1(%sp)
	sw	%ra, 2(%sp)
	add	%at, %t8, %v0
	lw	%t0, 0(%at)
	beqi	%t0, -1, bnei_else.9406
	addi	%a0, %zero, 159
	addi	%v1, %t9, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 3
	jal	solver.2824
	addi	%sp, %sp, -3
	addi	%s3, %v0, 0
	addi	%a0, %zero, 0
	beqi	%s3, 0, bnei_else.9407
	flw	%f16, 135(%zero)
	flw	%f0, 482(%zero)
	fmov	%f1, %f16
	addi	%sp, %sp, 3
	jal	fless.2592
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.9408
	flw	%f1, 137(%zero)
	fmov	%f0, %f16
	addi	%sp, %sp, 3
	jal	fless.2592
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.9410
	flw	%f0, 456(%zero)
	fadd	%f25, %f16, %f0
	flw	%f0, 0(%t9)
	fmul	%f1, %f0, %f25
	flw	%f0, 159(%zero)
	fadd	%f24, %f1, %f0
	flw	%f0, 1(%t9)
	fmul	%f1, %f0, %f25
	flw	%f0, 160(%zero)
	fadd	%f23, %f1, %f0
	flw	%f0, 2(%t9)
	fmul	%f1, %f0, %f25
	flw	%f0, 161(%zero)
	fadd	%f22, %f1, %f0
	addi	%v1, %t8, 0
	addi	%v0, %a0, 0
	fmov	%f2, %f22
	fmov	%f1, %f23
	fmov	%f0, %f24
	addi	%sp, %sp, 3
	jal	check_all_inside.2907
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.9412
	fsw	%f25, 137(%zero)
	addi	%v0, %zero, 138
	fmov	%f2, %f22
	fmov	%f1, %f23
	fmov	%f0, %f24
	addi	%sp, %sp, 3
	jal	vecset.2644
	addi	%sp, %sp, -3
	sw	%t0, 141(%zero)
	sw	%s3, 136(%zero)
	j	bnei_cont.9409
bnei_else.9412:
bnei_cont.9413:
	j	bnei_cont.9409
bnei_else.9410:
bnei_cont.9411:
	j	bnei_cont.9409
bnei_else.9408:
bnei_cont.9409:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	addi	%a0, %t9, 0
	addi	%v1, %t8, 0
	j	solve_each_element.2922
bnei_else.9407:
	lw	%v0, 12(%t0)
	addi	%sp, %sp, 3
	jal	o_isinvert.2696
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.9414
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	addi	%a0, %t9, 0
	addi	%v1, %t8, 0
	j	solve_each_element.2922
bnei_else.9414:
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.9406:
	add	%t0, %zero, %a0
	jr	%ra
solve_one_or_network.2926:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.9451
	lw	%v1, 83(%a1)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2922
	addi	%sp, %sp, -4
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_one_or_network.2926
bnei_else.9451:
	jr	%ra
trace_or_matrix.2930:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	add	%v1, %zero, %a0
	sw	%v1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	add	%at, %a1, %v0
	lw	%t8, 0(%at)
	lw	%v0, 0(%t8)
	beqi	%v0, -1, bnei_else.9508
	beqi	%v0, 99, bnei_else.9509
	addi	%a0, %zero, 159
	addi	%sp, %sp, 5
	jal	solver.2824
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.9511
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.9513
	addi	%v0, %zero, 1
	lw	%a0, 2(%sp)
	addi	%v1, %t8, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -5
	j	bnei_cont.9510
bnei_else.9513:
bnei_cont.9514:
	j	bnei_cont.9510
bnei_else.9511:
bnei_cont.9512:
	j	bnei_cont.9510
bnei_else.9509:
	addi	%v0, %zero, 1
	addi	%a0, %v1, 0
	addi	%v1, %t8, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -5
bnei_cont.9510:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix.2930
bnei_else.9508:
	jr	%ra
judge_intersection.2934:
	add	%a0, %zero, %v0
	sw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 454(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	addi	%sp, %sp, 1
	jal	trace_or_matrix.2930
	addi	%sp, %sp, -1
	flw	%f16, 137(%zero)
	flw	%f0, 455(%zero)
	fmov	%f1, %f16
	addi	%sp, %sp, 1
	jal	fless.2592
	addi	%sp, %sp, -1
	beqi	%v0, 0, bnei_else.9543
	flw	%f1, 453(%zero)
	lw	%ra, 0(%sp)
	fmov	%f0, %f16
	j	fless.2592
bnei_else.9543:
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element_fast.2936:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %a0
	add	%s6, %zero, %ra
	addi	%v0, %s5, 0
	jal	d_vec.2751
	addi	%s0, %v0, 0
	add	%at, %s4, %s3
	lw	%s7, 0(%at)
	beqi	%s7, -1, bnei_else.9582
	addi	%v1, %s5, 0
	addi	%v0, %s7, 0
	jal	solver_fast2.2865
	addi	%t7, %v0, 0
	addi	%a0, %zero, 0
	beqi	%t7, 0, bnei_else.9583
	flw	%f16, 135(%zero)
	flw	%f0, 482(%zero)
	fmov	%f1, %f16
	jal	fless.2592
	beqi	%v0, 0, bnei_else.9584
	flw	%f1, 137(%zero)
	fmov	%f0, %f16
	jal	fless.2592
	beqi	%v0, 0, bnei_else.9586
	flw	%f0, 456(%zero)
	fadd	%f25, %f16, %f0
	flw	%f0, 0(%s0)
	fmul	%f1, %f0, %f25
	flw	%f0, 162(%zero)
	fadd	%f24, %f1, %f0
	flw	%f0, 1(%s0)
	fmul	%f1, %f0, %f25
	flw	%f0, 163(%zero)
	fadd	%f23, %f1, %f0
	flw	%f0, 2(%s0)
	fmul	%f1, %f0, %f25
	flw	%f0, 164(%zero)
	fadd	%f22, %f1, %f0
	addi	%v1, %s4, 0
	addi	%v0, %a0, 0
	fmov	%f2, %f22
	fmov	%f1, %f23
	fmov	%f0, %f24
	jal	check_all_inside.2907
	beqi	%v0, 0, bnei_else.9588
	fsw	%f25, 137(%zero)
	addi	%v0, %zero, 138
	fmov	%f2, %f22
	fmov	%f1, %f23
	fmov	%f0, %f24
	jal	vecset.2644
	sw	%s7, 141(%zero)
	sw	%t7, 136(%zero)
	j	bnei_cont.9585
bnei_else.9588:
bnei_cont.9589:
	j	bnei_cont.9585
bnei_else.9586:
bnei_cont.9587:
	j	bnei_cont.9585
bnei_else.9584:
bnei_cont.9585:
	addi	%v0, %s3, 1
	add	%ra, %zero, %s6
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0
	j	solve_each_element_fast.2936
bnei_else.9583:
	lw	%v0, 12(%s7)
	jal	o_isinvert.2696
	beqi	%v0, 0, bnei_else.9590
	addi	%v0, %s3, 1
	add	%ra, %zero, %s6
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0
	j	solve_each_element_fast.2936
bnei_else.9590:
	add	%ra, %zero, %s6
	jr	%ra
bnei_else.9582:
	add	%ra, %zero, %s6
	jr	%ra
solve_one_or_network_fast.2940:
	add	%t8, %zero, %v0
	add	%t9, %zero, %v1
	sw	%a0, 0(%sp)
	sw	%ra, 1(%sp)
	add	%at, %t9, %t8
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.9623
	lw	%v1, 83(%a1)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -2
	addi	%v0, %t8, 1
	lw	%ra, 1(%sp)
	lw	%a0, 0(%sp)
	addi	%v1, %t9, 0
	j	solve_one_or_network_fast.2940
bnei_else.9623:
	jr	%ra
trace_or_matrix_fast.2944:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	add	%v1, %zero, %a0
	sw	%v1, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %a1, %v0
	lw	%s0, 0(%at)
	lw	%v0, 0(%s0)
	beqi	%v0, -1, bnei_else.9678
	beqi	%v0, 99, bnei_else.9679
	addi	%sp, %sp, 4
	jal	solver_fast2.2865
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.9681
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	addi	%sp, %sp, 4
	jal	fless.2592
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.9683
	addi	%v0, %zero, 1
	lw	%a0, 2(%sp)
	addi	%v1, %s0, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -4
	j	bnei_cont.9680
bnei_else.9683:
bnei_cont.9684:
	j	bnei_cont.9680
bnei_else.9681:
bnei_cont.9682:
	j	bnei_cont.9680
bnei_else.9679:
	addi	%v0, %zero, 1
	addi	%a0, %v1, 0
	addi	%v1, %s0, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -4
bnei_cont.9680:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix_fast.2944
bnei_else.9678:
	jr	%ra
judge_intersection_fast.2948:
	add	%a0, %zero, %v0
	sw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 454(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	addi	%sp, %sp, 1
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -1
	flw	%f16, 137(%zero)
	flw	%f0, 455(%zero)
	fmov	%f1, %f16
	addi	%sp, %sp, 1
	jal	fless.2592
	addi	%sp, %sp, -1
	beqi	%v0, 0, bnei_else.9713
	flw	%f1, 453(%zero)
	lw	%ra, 0(%sp)
	fmov	%f0, %f16
	j	fless.2592
bnei_else.9713:
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_rect.2950:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	lw	%a2, 136(%zero)
	addi	%v0, %zero, 142
	jal	vecbzero.2652
	addi	%a2, %a2, -1
	add	%at, %a0, %a2
	flw	%f0, 0(%at)
	jal	sgn.2636
	fneg	%f0, %f0
	add	%ra, %zero, %a1
	fsw	%f0, 142(%a2)
	jr	%ra
get_nvector_plane.2952:
	add	%a1, %zero, %ra
	jal	o_param_a.2700
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	jal	o_param_b.2702
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	jal	o_param_c.2704
	fneg	%f0, %f0
	add	%ra, %zero, %a1
	fsw	%f0, 144(%zero)
	jr	%ra
get_nvector_second.2954:
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	flw	%f1, 138(%zero)
	addi	%v0, %a1, 0
	jal	o_param_x.2708
	fsub	%f18, %f1, %f0
	flw	%f1, 139(%zero)
	addi	%v0, %a1, 0
	jal	o_param_y.2710
	fsub	%f19, %f1, %f0
	flw	%f1, 140(%zero)
	addi	%v0, %a1, 0
	jal	o_param_z.2712
	fsub	%f20, %f1, %f0
	addi	%v0, %a1, 0
	jal	o_param_a.2700
	fmul	%f22, %f18, %f0
	addi	%v0, %a1, 0
	jal	o_param_b.2702
	fmul	%f21, %f19, %f0
	addi	%v0, %a1, 0
	jal	o_param_c.2704
	fmul	%f2, %f20, %f0
	addi	%v0, %a1, 0
	jal	o_isrot.2698
	beqi	%v0, 0, bnei_else.9775
	addi	%v0, %a1, 0
	jal	o_param_r3.2728
	fmov	%f16, %f0
	fmul	%f1, %f19, %f16
	addi	%v0, %a1, 0
	jal	o_param_r2.2726
	fmov	%f17, %f0
	fmul	%f0, %f20, %f17
	fadd	%f0, %f1, %f0
	jal	fhalf.2604
	fadd	%f0, %f22, %f0
	fsw	%f0, 142(%zero)
	fmul	%f1, %f18, %f16
	addi	%v0, %a1, 0
	jal	o_param_r1.2724
	fmov	%f16, %f0
	fmul	%f0, %f20, %f16
	fadd	%f0, %f1, %f0
	jal	fhalf.2604
	fadd	%f0, %f21, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f18, %f17
	fmul	%f0, %f19, %f16
	fadd	%f0, %f1, %f0
	jal	fhalf.2604
	fadd	%f0, %f2, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.9776
bnei_else.9775:
	fsw	%f22, 142(%zero)
	fsw	%f21, 143(%zero)
	fsw	%f2, 144(%zero)
bnei_cont.9776:
	addi	%v0, %a1, 0
	jal	o_isinvert.2696
	addi	%v1, %v0, 0
	addi	%v0, %zero, 142
	add	%ra, %zero, %a2
	j	vecunit_sgn.2662
get_nvector.2956:
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra
	addi	%v0, %a0, 0
	jal	o_form.2692
	beqi	%v0, 1, bnei_else.9801
	beqi	%v0, 2, bnei_else.9802
	add	%ra, %zero, %a1
	addi	%v0, %a0, 0
	j	get_nvector_second.2954
bnei_else.9802:
	add	%ra, %zero, %a1
	addi	%v0, %a0, 0
	j	get_nvector_plane.2952
bnei_else.9801:
	add	%ra, %zero, %a1
	addi	%v0, %v1, 0
	j	get_nvector_rect.2950
utexture.2959:
	add	%a2, %zero, %v0
	add	%a3, %zero, %ra
	addi	%v0, %a2, 0
	jal	o_texturetype.2690
	addi	%a1, %v0, 0
	addi	%v0, %a2, 0
	jal	o_color_red.2718
	fsw	%f0, 145(%zero)
	addi	%v0, %a2, 0
	jal	o_color_green.2720
	fsw	%f0, 146(%zero)
	addi	%v0, %a2, 0
	jal	o_color_blue.2722
	fsw	%f0, 147(%zero)
	beqi	%a1, 1, bnei_else.9856
	beqi	%a1, 2, bnei_else.9857
	beqi	%a1, 3, bnei_else.9858
	beqi	%a1, 4, bnei_else.9859
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.9859:
	flw	%f1, 0(%v1)
	addi	%v0, %a2, 0
	jal	o_param_x.2708
	fsub	%f1, %f1, %f0
	addi	%v0, %a2, 0
	jal	o_param_a.2700
	fsqrt	%f0, %f0
	fmul	%f16, %f1, %f0
	flw	%f1, 2(%v1)
	addi	%v0, %a2, 0
	jal	o_param_z.2712
	fsub	%f1, %f1, %f0
	addi	%v0, %a2, 0
	jal	o_param_c.2704
	fsqrt	%f0, %f0
	fmul	%f17, %f1, %f0
	fmov	%f0, %f16
	jal	fsqr.2606
	fmov	%f1, %f0
	fmov	%f0, %f17
	jal	fsqr.2606
	fadd	%f22, %f1, %f0
	fabs	%f0, %f16
	flw	%f20, 452(%zero)
	fmov	%f1, %f20
	jal	fless.2592
	beqi	%v0, 0, bnei_else.9861
	flw	%f1, 451(%zero)
	j	bnei_cont.9862
bnei_else.9861:
	fdiv	%f0, %f17, %f16
	fabs	%f0, %f0
	jal	atan.2627
	flw	%f1, 450(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.9862:
	floor	%f0, %f1
	fsub	%f21, %f1, %f0
	flw	%f1, 1(%v1)
	addi	%v0, %a2, 0
	jal	o_param_y.2710
	fsub	%f1, %f1, %f0
	addi	%v0, %a2, 0
	jal	o_param_b.2702
	fsqrt	%f0, %f0
	fmul	%f16, %f1, %f0
	fabs	%f0, %f22
	fmov	%f1, %f20
	jal	fless.2592
	beqi	%v0, 0, bnei_else.9863
	flw	%f1, 451(%zero)
	j	bnei_cont.9864
bnei_else.9863:
	fdiv	%f0, %f16, %f22
	fabs	%f0, %f0
	jal	atan.2627
	flw	%f1, 450(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.9864:
	floor	%f0, %f1
	fsub	%f17, %f1, %f0
	flw	%f1, 448(%zero)
	flw	%f16, 481(%zero)
	fsub	%f0, %f16, %f21
	jal	fsqr.2606
	fsub	%f1, %f1, %f0
	fsub	%f0, %f16, %f17
	jal	fsqr.2606
	fsub	%f0, %f1, %f0
	jal	fisneg.2597
	beqi	%v0, 0, bnei_else.9865
	flw	%f0, 482(%zero)
	j	bnei_cont.9866
bnei_else.9865:
bnei_cont.9866:
	flw	%f1, 447(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 446(%zero)
	fdiv	%f0, %f1, %f0
	add	%ra, %zero, %a3
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.9858:
	flw	%f1, 0(%v1)
	addi	%v0, %a2, 0
	jal	o_param_x.2708
	fsub	%f1, %f1, %f0
	flw	%f16, 2(%v1)
	addi	%v0, %a2, 0
	jal	o_param_z.2712
	fsub	%f16, %f16, %f0
	fmov	%f0, %f1
	jal	fsqr.2606
	fmov	%f1, %f0
	fmov	%f0, %f16
	jal	fsqr.2606
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	flw	%f0, 445(%zero)
	fdiv	%f1, %f1, %f0
	floor	%f0, %f1
	fsub	%f1, %f1, %f0
	flw	%f0, 449(%zero)
	fmul	%f0, %f1, %f0
	jal	cos.2623
	jal	fsqr.2606
	flw	%f16, 447(%zero)
	fmul	%f1, %f0, %f16
	fsw	%f1, 146(%zero)
	flw	%f1, 477(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f0, %f16
	add	%ra, %zero, %a3
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.9857:
	flw	%f1, 1(%v1)
	flw	%f0, 444(%zero)
	fmul	%f0, %f1, %f0
	jal	sin.2625
	jal	fsqr.2606
	flw	%f16, 447(%zero)
	fmul	%f1, %f16, %f0
	fsw	%f1, 145(%zero)
	flw	%f1, 477(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f16, %f0
	add	%ra, %zero, %a3
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.9856:
	flw	%f1, 0(%v1)
	addi	%v0, %a2, 0
	jal	o_param_x.2708
	fsub	%f1, %f1, %f0
	flw	%f18, 443(%zero)
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	flw	%f17, 442(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	flw	%f1, 445(%zero)
	jal	fless.2592
	addi	%a1, %v0, 0
	flw	%f16, 2(%v1)
	addi	%v0, %a2, 0
	jal	o_param_z.2712
	fsub	%f16, %f16, %f0
	fmul	%f0, %f16, %f18
	floor	%f0, %f0
	fmul	%f0, %f0, %f17
	fsub	%f0, %f16, %f0
	jal	fless.2592
	beqi	%a1, 0, bnei_else.9870
	beqi	%v0, 0, bnei_else.9872
	flw	%f0, 447(%zero)
	j	bnei_cont.9871
bnei_else.9872:
	flw	%f0, 482(%zero)
bnei_cont.9873:
	j	bnei_cont.9871
bnei_else.9870:
	beqi	%v0, 0, bnei_else.9874
	flw	%f0, 482(%zero)
	j	bnei_cont.9875
bnei_else.9874:
	flw	%f0, 447(%zero)
bnei_cont.9875:
bnei_cont.9871:
	add	%ra, %zero, %a3
	fsw	%f0, 146(%zero)
	jr	%ra
add_light.2962:
	fmov	%f17, %f1
	add	%a0, %zero, %ra
	jal	fispos.2595
	beqi	%v0, 0, bnei_else.9903
	addi	%v1, %zero, 145
	addi	%v0, %zero, 151
	jal	vecaccum.2673
	j	bnei_cont.9904
bnei_else.9903:
bnei_cont.9904:
	fmov	%f0, %f17
	jal	fispos.2595
	beqi	%v0, 0, bnei_else.9905
	fmov	%f0, %f17
	jal	fsqr.2606
	jal	fsqr.2606
	fmul	%f1, %f0, %f2
	flw	%f0, 151(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	fadd	%f0, %f0, %f1
	add	%ra, %zero, %a0
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.9905:
	add	%ra, %zero, %a0
	jr	%ra
trace_reflections.2966:
	fmov	%f26, %f0
	fmov	%f27, %f1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.9964
	lw	%t0, 254(%v0)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 5
	jal	r_dvec.2757
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 5
	jal	judge_intersection_fast.2948
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.9965
	lw	%a0, 141(%zero)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a0, %a1, %a0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 5
	jal	r_surface_id.2755
	addi	%sp, %sp, -5
	bne	%a0, %v0, beq_else.9967
	lw	%v1, 134(%zero)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.9969
	j	bnei_cont.9966
bnei_else.9969:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 5
	jal	d_vec.2751
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0
	addi	%v0, %zero, 142
	addi	%sp, %sp, 5
	jal	veciprod.2665
	addi	%sp, %sp, -5
	fmov	%f1, %f0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 5
	jal	r_bright.2759
	addi	%sp, %sp, -5
	fmov	%f17, %f0
	fmul	%f0, %f17, %f26
	fmul	%f18, %f0, %f1
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 5
	jal	veciprod.2665
	addi	%sp, %sp, -5
	fmul	%f1, %f17, %f0
	fmov	%f2, %f27
	fmov	%f0, %f18
	addi	%sp, %sp, 5
	jal	add_light.2962
	addi	%sp, %sp, -5
bnei_cont.9970:
	j	bnei_cont.9966
beq_else.9967:
beq_cont.9968:
	j	bnei_cont.9966
bnei_else.9965:
bnei_cont.9966:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	fmov	%f1, %f27
	fmov	%f0, %f26
	j	trace_reflections.2966
bgti_else.9964:
	jr	%ra
trace_ray.2971:
	fmov	%f28, %f0
	fmov	%f29, %f1
	add	%a1, %zero, %v0
	sw	%a1, 0(%sp)
	sw	%v1, 1(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%at, %zero, 4
	blt	%at, %a1, bgt_else.10094
	addi	%sp, %sp, 4
	jal	p_surface_ids.2736
	addi	%sp, %sp, -4
	sw	%v0, 4(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 5
	jal	judge_intersection.2934
	addi	%sp, %sp, -5
	addi	%s0, %zero, 0
	beqi	%v0, 0, bnei_else.10095
	lw	%s1, 141(%zero)
	lw	%k0, 12(%s1)
	addi	%v0, %k0, 0
	addi	%sp, %sp, 5
	jal	o_reflectiontype.2694
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	addi	%v0, %k0, 0
	addi	%sp, %sp, 6
	jal	o_diffuse.2714
	addi	%sp, %sp, -6
	fmov	%f3, %f0
	fmul	%f25, %f3, %f28
	lw	%v1, 1(%sp)
	addi	%v0, %k0, 0
	addi	%sp, %sp, 6
	jal	get_nvector.2956
	addi	%sp, %sp, -6
	addi	%v1, %zero, 138
	addi	%v0, %zero, 159
	addi	%sp, %sp, 6
	jal	veccpy.2654
	addi	%sp, %sp, -6
	addi	%v1, %zero, 138
	addi	%v0, %k0, 0
	addi	%sp, %sp, 6
	jal	utexture.2959
	addi	%sp, %sp, -6
	sll	%a1, %s1, 2
	lw	%a0, 136(%zero)
	add	%a2, %a1, %a0
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 6
	jal	p_intersection_points.2734
	addi	%sp, %sp, -6
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 138
	addi	%sp, %sp, 6
	jal	veccpy.2654
	addi	%sp, %sp, -6
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 6
	jal	p_calc_diffuse.2738
	addi	%sp, %sp, -6
	addi	%a0, %v0, 0
	flw	%f1, 481(%zero)
	fmov	%f0, %f3
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.10096
	lw	%a1, 0(%sp)
	add	%at, %a0, %a1
	sw	%s0, 0(%at)
	j	bnei_cont.10097
bnei_else.10096:
	addi	%a2, %zero, 1
	lw	%a1, 0(%sp)
	add	%at, %a0, %a1
	sw	%a2, 0(%at)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 6
	jal	p_energy.2740
	addi	%sp, %sp, -6
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 145
	addi	%sp, %sp, 6
	jal	veccpy.2654
	addi	%sp, %sp, -6
	flw	%f0, 441(%zero)
	fmul	%f0, %f0, %f25
	addi	%sp, %sp, 6
	jal	vecscale.2683
	addi	%sp, %sp, -6
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 6
	jal	p_nvectors.2749
	addi	%sp, %sp, -6
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 142
	addi	%sp, %sp, 6
	jal	veccpy.2654
	addi	%sp, %sp, -6
bnei_cont.10097:
	flw	%f17, 440(%zero)
	addi	%v1, %zero, 142
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2665
	addi	%sp, %sp, -6
	fmul	%f0, %f17, %f0
	addi	%v1, %zero, 142
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 6
	jal	vecaccum.2673
	addi	%sp, %sp, -6
	addi	%v0, %k0, 0
	addi	%sp, %sp, 6
	jal	o_hilight.2716
	addi	%sp, %sp, -6
	fmul	%f26, %f28, %f0
	lw	%v1, 134(%zero)
	addi	%v0, %s0, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.10098
	j	bnei_cont.10099
bnei_else.10098:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	addi	%sp, %sp, 6
	jal	veciprod.2665
	addi	%sp, %sp, -6
	fneg	%f0, %f0
	fmul	%f17, %f0, %f25
	addi	%v1, %zero, 78
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2665
	addi	%sp, %sp, -6
	fneg	%f1, %f0
	fmov	%f2, %f26
	fmov	%f0, %f17
	addi	%sp, %sp, 6
	jal	add_light.2962
	addi	%sp, %sp, -6
bnei_cont.10099:
	addi	%v0, %zero, 138
	addi	%sp, %sp, 6
	jal	setup_startp.2885
	addi	%sp, %sp, -6
	lw	%a0, 434(%zero)
	addi	%v0, %a0, -1
	lw	%v1, 1(%sp)
	fmov	%f1, %f26
	fmov	%f0, %f25
	addi	%sp, %sp, 6
	jal	trace_reflections.2966
	addi	%sp, %sp, -6
	flw	%f0, 439(%zero)
	fmov	%f1, %f28
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.10100
	lw	%a0, 0(%sp)
	blti	%a0, 4, bgti_else.10101
	j	bgti_cont.10102
bgti_else.10101:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 4(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.10102:
	lw	%a0, 5(%sp)
	beqi	%a0, 2, bnei_else.10103
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.10103:
	flw	%f0, 477(%zero)
	fsub	%f0, %f0, %f3
	fmul	%f0, %f28, %f0
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f1, 137(%zero)
	fadd	%f1, %f29, %f1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_ray.2971
bnei_else.10100:
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.10095:
	addi	%a2, %zero, -1
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.10106
	addi	%v1, %zero, 78
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2665
	addi	%sp, %sp, -6
	fneg	%f16, %f0
	fmov	%f0, %f16
	addi	%sp, %sp, 6
	jal	fispos.2595
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.10107
	fmov	%f0, %f16
	addi	%sp, %sp, 6
	jal	fsqr.2606
	addi	%sp, %sp, -6
	fmul	%f0, %f0, %f16
	fmul	%f1, %f0, %f28
	flw	%f0, 81(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 151(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	fadd	%f0, %f0, %f1
	lw	%ra, 3(%sp)
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.10107:
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.10106:
	lw	%ra, 3(%sp)
	jr	%ra
bgt_else.10094:
	jr	%ra
trace_diffuse_ray.2977:
	fmov	%f26, %f0
	sw	%v0, 0(%sp)
	sw	%t0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	judge_intersection_fast.2948
	addi	%sp, %sp, -3
	addi	%k0, %zero, 0
	beqi	%v0, 0, bnei_else.10162
	lw	%a0, 141(%zero)
	lw	%t0, 12(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	d_vec.2751
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 3
	jal	get_nvector.2956
	addi	%sp, %sp, -3
	addi	%v1, %zero, 138
	addi	%v0, %t0, 0
	addi	%sp, %sp, 3
	jal	utexture.2959
	addi	%sp, %sp, -3
	lw	%v1, 134(%zero)
	addi	%v0, %k0, 0
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.10163
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.10163:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	addi	%sp, %sp, 3
	jal	veciprod.2665
	addi	%sp, %sp, -3
	fneg	%f0, %f0
	addi	%sp, %sp, 3
	jal	fispos.2595
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.10165
	j	bnei_cont.10166
bnei_else.10165:
	flw	%f0, 482(%zero)
bnei_cont.10166:
	fmul	%f1, %f26, %f0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 3
	jal	o_diffuse.2714
	addi	%sp, %sp, -3
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 145
	addi	%v0, %zero, 148
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	j	vecaccum.2673
bnei_else.10162:
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
iter_trace_diffuse_rays.2980:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%ra, 4(%sp)
	blti	%a1, 0, bgti_else.10213
	add	%at, %v0, %a1
	lw	%a0, 0(%at)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 5
	jal	d_vec.2751
	addi	%sp, %sp, -5
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 5
	jal	veciprod.2665
	addi	%sp, %sp, -5
	addi	%sp, %sp, 5
	jal	fisneg.2597
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.10214
	lw	%a0, 3(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%v0, 0(%at)
	flw	%f1, 438(%zero)
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 5
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -5
	j	bnei_cont.10215
bnei_else.10214:
	flw	%f1, 437(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %a0, 0
	addi	%sp, %sp, 5
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -5
bnei_cont.10215:
	lw	%a0, 3(%sp)
	addi	%a1, %a0, -2
	lw	%ra, 4(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.10213:
	jr	%ra
trace_diffuse_rays.2985:
	add	%s2, %zero, %v0
	add	%s3, %zero, %v1
	add	%s4, %zero, %a0
	add	%s5, %zero, %ra
	addi	%v0, %s4, 0
	jal	setup_startp.2885
	addi	%a1, %zero, 118
	add	%ra, %zero, %s5
	addi	%a0, %s4, 0
	addi	%v1, %s3, 0
	addi	%v0, %s2, 0
	j	iter_trace_diffuse_rays.2980
trace_diffuse_ray_80percent.2989:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.10303
	lw	%v0, 179(%zero)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -4
	j	bnei_cont.10304
bnei_else.10303:
bnei_cont.10304:
	lw	%a0, 0(%sp)
	beqi	%a0, 1, bnei_else.10305
	lw	%v0, 180(%zero)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -4
	j	bnei_cont.10306
bnei_else.10305:
bnei_cont.10306:
	lw	%a0, 0(%sp)
	beqi	%a0, 2, bnei_else.10307
	lw	%v0, 181(%zero)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -4
	j	bnei_cont.10308
bnei_else.10307:
bnei_cont.10308:
	lw	%a0, 0(%sp)
	beqi	%a0, 3, bnei_else.10309
	lw	%v0, 182(%zero)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -4
	j	bnei_cont.10310
bnei_else.10309:
bnei_cont.10310:
	lw	%a0, 0(%sp)
	beqi	%a0, 4, bnei_else.10311
	lw	%v0, 183(%zero)
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_diffuse_rays.2985
bnei_else.10311:
	lw	%ra, 3(%sp)
	jr	%ra
calc_diffuse_using_1point.2993:
	add	%a0, %zero, %v0
	sw	%v1, 0(%sp)
	sw	%t4, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 3
	jal	p_received_ray_20percent.2742
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0
	addi	%sp, %sp, 3
	jal	p_nvectors.2749
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0
	addi	%v0, %a0, 0
	addi	%sp, %sp, 3
	jal	p_intersection_points.2734
	addi	%sp, %sp, -3
	addi	%a3, %v0, 0
	addi	%v0, %a0, 0
	addi	%sp, %sp, 3
	jal	p_energy.2740
	addi	%sp, %sp, -3
	addi	%t4, %v0, 0
	lw	%k0, 0(%sp)
	add	%at, %a1, %k0
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 3
	jal	veccpy.2654
	addi	%sp, %sp, -3
	addi	%v0, %a0, 0
	addi	%sp, %sp, 3
	jal	p_group_id.2744
	addi	%sp, %sp, -3
	lw	%a0, 0(%sp)
	add	%at, %a2, %a0
	lw	%v1, 0(%at)
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	addi	%sp, %sp, 3
	jal	trace_diffuse_ray_80percent.2989
	addi	%sp, %sp, -3
	lw	%a0, 0(%sp)
	add	%at, %t4, %a0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	lw	%t4, 1(%sp)
	lw	%ra, 2(%sp)
	j	vecaccumv.2686
calc_diffuse_using_5points.2996:
	add	%a3, %zero, %v0
	add	%k0, %zero, %ra
	add	%at, %v1, %a3
	lw	%v0, 0(%at)
	jal	p_received_ray_20percent.2742
	addi	%s0, %v0, 0
	addi	%ra, %a3, -1
	add	%at, %a0, %ra
	lw	%v0, 0(%at)
	jal	p_received_ray_20percent.2742
	addi	%s1, %v0, 0
	add	%at, %a0, %a3
	lw	%s2, 0(%at)
	addi	%v0, %s2, 0
	jal	p_received_ray_20percent.2742
	addi	%s3, %v0, 0
	addi	%ra, %a3, 1
	add	%at, %a0, %ra
	lw	%v0, 0(%at)
	jal	p_received_ray_20percent.2742
	addi	%a0, %v0, 0
	add	%at, %a1, %a3
	lw	%v0, 0(%at)
	jal	p_received_ray_20percent.2742
	addi	%a1, %v0, 0
	add	%at, %s0, %a2
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	jal	veccpy.2654
	add	%at, %s1, %a2
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	jal	vecadd.2677
	add	%at, %s3, %a2
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	jal	vecadd.2677
	add	%at, %a0, %a2
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	jal	vecadd.2677
	add	%at, %a1, %a2
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	jal	vecadd.2677
	addi	%v0, %s2, 0
	jal	p_energy.2740
	add	%at, %v0, %a2
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	add	%ra, %zero, %k0
	j	vecaccumv.2686
do_without_neighbors.3002:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.10408
	addi	%sp, %sp, 3
	jal	p_surface_ids.2736
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	add	%at, %v0, %a0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.10409
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_calc_diffuse.2738
	addi	%sp, %sp, -3
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.10410
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	calc_diffuse_using_1point.2993
	addi	%sp, %sp, -3
	j	bnei_cont.10411
bnei_else.10410:
bnei_cont.10411:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.10409:
	lw	%ra, 2(%sp)
	jr	%ra
bgt_else.10408:
	jr	%ra
neighbors_exist.3005:
	lw	%a1, 155(%zero)
	addi	%a0, %v1, 1
	blt	%a0, %a1, bgt_else.10444
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.10444:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.10445
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.10445:
	lw	%a1, 154(%zero)
	addi	%a0, %v0, 1
	blt	%a0, %a1, bgt_else.10446
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.10446:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.10447
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.10447:
	addi	%v0, %zero, 1
	jr	%ra
get_surface_id.3009:
	add	%a0, %zero, %ra
	jal	p_surface_ids.2736
	add	%ra, %zero, %a0
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	jr	%ra
neighbors_are_available.3012:
	add	%a3, %zero, %v0
	add	%k0, %zero, %v1
	add	%s0, %zero, %a0
	add	%v1, %zero, %a2
	add	%a2, %zero, %ra
	add	%at, %s0, %a3
	lw	%v0, 0(%at)
	jal	get_surface_id.3009
	addi	%s1, %v0, 0
	add	%at, %k0, %a3
	lw	%v0, 0(%at)
	jal	get_surface_id.3009
	bne	%v0, %s1, beq_else.10496
	add	%at, %a1, %a3
	lw	%v0, 0(%at)
	jal	get_surface_id.3009
	bne	%v0, %s1, beq_else.10497
	addi	%a0, %a3, -1
	add	%at, %s0, %a0
	lw	%v0, 0(%at)
	jal	get_surface_id.3009
	bne	%v0, %s1, beq_else.10498
	addi	%a0, %a3, 1
	add	%at, %s0, %a0
	lw	%v0, 0(%at)
	jal	get_surface_id.3009
	bne	%v0, %s1, beq_else.10499
	add	%ra, %zero, %a2
	addi	%v0, %zero, 1
	jr	%ra
beq_else.10499:
	add	%ra, %zero, %a2
	addi	%v0, %zero, 0
	jr	%ra
beq_else.10498:
	add	%ra, %zero, %a2
	addi	%v0, %zero, 0
	jr	%ra
beq_else.10497:
	add	%ra, %zero, %a2
	addi	%v0, %zero, 0
	jr	%ra
beq_else.10496:
	add	%ra, %zero, %a2
	addi	%v0, %zero, 0
	jr	%ra
try_exploit_neighbors.3018:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %a0
	add	%s7, %zero, %a1
	add	%t7, %zero, %a2
	add	%t8, %zero, %a3
	add	%t9, %zero, %ra
	add	%at, %s7, %s4
	lw	%s2, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %t8, bgt_else.10532
	addi	%v1, %t8, 0
	addi	%v0, %s2, 0
	jal	get_surface_id.3009
	blti	%v0, 0, bgti_else.10533
	addi	%a2, %t8, 0
	addi	%a1, %t7, 0
	addi	%a0, %s7, 0
	addi	%v1, %s6, 0
	addi	%v0, %s4, 0
	jal	neighbors_are_available.3012
	beqi	%v0, 0, bnei_else.10534
	addi	%v0, %s2, 0
	jal	p_calc_diffuse.2738
	add	%at, %v0, %t8
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.10535
	addi	%a2, %t8, 0
	addi	%a1, %t7, 0
	addi	%a0, %s7, 0
	addi	%v1, %s6, 0
	addi	%v0, %s4, 0
	jal	calc_diffuse_using_5points.2996
	j	bnei_cont.10536
bnei_else.10535:
bnei_cont.10536:
	addi	%a3, %t8, 1
	add	%ra, %zero, %t9
	addi	%a2, %t7, 0
	addi	%a1, %s7, 0
	addi	%a0, %s6, 0
	addi	%v1, %s5, 0
	addi	%v0, %s4, 0
	j	try_exploit_neighbors.3018
bnei_else.10534:
	add	%ra, %zero, %t9
	addi	%v1, %t8, 0
	addi	%v0, %s2, 0
	j	do_without_neighbors.3002
bgti_else.10533:
	add	%ra, %zero, %t9
	jr	%ra
bgt_else.10532:
	add	%ra, %zero, %t9
	jr	%ra
write_ppm_header.3025:
	add	%s0, %zero, %ra
	addi	%v0, %zero, 80
	jal	min_caml_print_char
	addi	%v0, %zero, 51
	jal	min_caml_print_char
	addi	%s1, %zero, 10
	addi	%v0, %s1, 0
	jal	min_caml_print_char
	lw	%v0, 154(%zero)
	jal	print_int.2634
	addi	%s2, %zero, 32
	addi	%v0, %s2, 0
	jal	min_caml_print_char
	lw	%v0, 155(%zero)
	jal	print_int.2634
	addi	%v0, %s2, 0
	jal	min_caml_print_char
	addi	%v0, %zero, 255
	jal	print_int.2634
	add	%ra, %zero, %s0
	addi	%v0, %s1, 0
	j	min_caml_print_char
write_rgb_element.3027:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.10581
	blti	%v0, 0, bgti_else.10583
	j	print_int.2634
bgti_else.10583:
	addi	%v0, %zero, 0
bgti_cont.10584:
	j	print_int.2634
bgt_else.10581:
	addi	%v0, %zero, 255
bgt_cont.10582:
	j	print_int.2634
write_rgb.3029:
	add	%s0, %zero, %ra
	flw	%f0, 151(%zero)
	jal	write_rgb_element.3027
	addi	%s1, %zero, 32
	addi	%v0, %s1, 0
	jal	min_caml_print_char
	flw	%f0, 152(%zero)
	jal	write_rgb_element.3027
	addi	%v0, %s1, 0
	jal	min_caml_print_char
	flw	%f0, 153(%zero)
	jal	write_rgb_element.3027
	addi	%v0, %zero, 10
	add	%ra, %zero, %s0
	j	min_caml_print_char
pretrace_diffuse_rays.3031:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.10658
	addi	%sp, %sp, 3
	jal	get_surface_id.3009
	addi	%sp, %sp, -3
	blti	%v0, 0, bgti_else.10659
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_calc_diffuse.2738
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	add	%at, %v0, %a0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.10660
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_group_id.2744
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	addi	%v0, %zero, 148
	addi	%sp, %sp, 3
	jal	vecbzero.2652
	addi	%sp, %sp, -3
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_nvectors.2749
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_intersection_points.2734
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0
	lw	%v0, 179(%a0)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	lw	%v1, 0(%at)
	add	%at, %a2, %a0
	lw	%a0, 0(%at)
	addi	%sp, %sp, 3
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -3
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_received_ray_20percent.2742
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 148
	addi	%sp, %sp, 3
	jal	veccpy.2654
	addi	%sp, %sp, -3
	j	bnei_cont.10661
bnei_else.10660:
bnei_cont.10661:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3031
bgti_else.10659:
	lw	%ra, 2(%sp)
	jr	%ra
bgt_else.10658:
	jr	%ra
pretrace_pixels.3034:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fmov	%f30, %f2
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%t1, 5(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%t0, %zero, 0
	blti	%v1, 0, bgti_else.10710
	flw	%f17, 158(%zero)
	lw	%a0, 156(%zero)
	sub	%a0, %v1, %a0
	itof	%f16, %a0
	fmul	%f17, %f17, %f16
	flw	%f16, 165(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f0, %f16, %f0
	fsw	%f0, 174(%zero)
	addi	%a0, %zero, 1
	flw	%f0, 166(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f1
	fsw	%f0, 175(%zero)
	flw	%f0, 167(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f30
	fsw	%f0, 176(%zero)
	addi	%v0, %zero, 174
	addi	%v1, %t0, 0
	addi	%sp, %sp, 8
	jal	vecunit_sgn.2662
	addi	%sp, %sp, -8
	addi	%v0, %zero, 151
	addi	%sp, %sp, 8
	jal	vecbzero.2652
	addi	%sp, %sp, -8
	addi	%v1, %zero, 75
	addi	%v0, %zero, 159
	addi	%sp, %sp, 8
	jal	veccpy.2654
	addi	%sp, %sp, -8
	flw	%f0, 477(%zero)
	lw	%a1, 2(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a1, %a0
	lw	%t1, 0(%at)
	flw	%f1, 482(%zero)
	addi	%v1, %zero, 174
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 8
	jal	trace_ray.2971
	addi	%sp, %sp, -8
	addi	%v0, %t1, 0
	addi	%sp, %sp, 8
	jal	p_rgb.2732
	addi	%sp, %sp, -8
	addi	%v1, %zero, 151
	addi	%sp, %sp, 8
	jal	veccpy.2654
	addi	%sp, %sp, -8
	lw	%v1, 4(%sp)
	addi	%v0, %t1, 0
	addi	%sp, %sp, 8
	jal	p_set_group_id.2746
	addi	%sp, %sp, -8
	addi	%v1, %t0, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 8
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -8
	lw	%a0, 3(%sp)
	addi	%a1, %a0, -1
	addi	%v1, %zero, 1
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 8
	jal	add_mod5.2641
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %a1, 0
	fmov	%f2, %f30
	j	pretrace_pixels.3034
bgti_else.10710:
	add	%t0, %zero, %a0
	jr	%ra
pretrace_line.3041:
	flw	%f1, 158(%zero)
	lw	%a1, 157(%zero)
	sub	%a1, %v1, %a1
	itof	%f0, %a1
	fmul	%f17, %f1, %f0
	flw	%f0, 168(%zero)
	fmul	%f1, %f17, %f0
	flw	%f0, 171(%zero)
	fadd	%f0, %f1, %f0
	flw	%f1, 169(%zero)
	fmul	%f16, %f17, %f1
	flw	%f1, 172(%zero)
	fadd	%f1, %f16, %f1
	flw	%f16, 170(%zero)
	fmul	%f17, %f17, %f16
	flw	%f16, 173(%zero)
	fadd	%f2, %f17, %f16
	lw	%a1, 154(%zero)
	addi	%v1, %a1, -1
	j	pretrace_pixels.3034
scan_pixel.3045:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%a3, %zero, 0
	lw	%a0, 154(%zero)
	blt	%v0, %a0, bgt_else.10782
	jr	%ra
bgt_else.10782:
	add	%at, %a1, %v0
	lw	%a2, 0(%at)
	addi	%v0, %a2, 0
	addi	%sp, %sp, 6
	jal	p_rgb.2732
	addi	%sp, %sp, -6
	addi	%v1, %v0, 0
	addi	%v0, %zero, 151
	addi	%sp, %sp, 6
	jal	veccpy.2654
	addi	%sp, %sp, -6
	lw	%a0, 4(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	neighbors_exist.3005
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.10784
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -6
	j	bnei_cont.10785
bnei_else.10784:
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 6
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -6
bnei_cont.10785:
	addi	%sp, %sp, 6
	jal	write_rgb.3029
	addi	%sp, %sp, -6
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 5(%sp)
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	scan_pixel.3045
scan_line.3051:
	add	%a3, %zero, %v0
	sw	%a3, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	add	%v0, %zero, %a1
	sw	%v0, 3(%sp)
	add	%a0, %zero, %a2
	sw	%a0, 4(%sp)
	sw	%ra, 5(%sp)
	lw	%a1, 155(%zero)
	blt	%a3, %a1, bgt_else.10834
	jr	%ra
bgt_else.10834:
	addi	%a1, %a1, -1
	blt	%a3, %a1, bgt_else.10836
	j	bgt_cont.10837
bgt_else.10836:
	addi	%v1, %a3, 1
	addi	%sp, %sp, 6
	jal	pretrace_line.3041
	addi	%sp, %sp, -6
bgt_cont.10837:
	addi	%v0, %zero, 0
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 6
	jal	scan_pixel.3045
	addi	%sp, %sp, -6
	lw	%a0, 0(%sp)
	addi	%a3, %a0, 1
	addi	%v1, %zero, 2
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	add_mod5.2641
	addi	%sp, %sp, -6
	addi	%a2, %v0, 0
	lw	%ra, 5(%sp)
	lw	%a1, 1(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	addi	%v0, %a3, 0
	j	scan_line.3051
create_float5x3array.3057:
	add	%a1, %zero, %ra
	addi	%a2, %zero, 3
	flw	%f1, 482(%zero)
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %a1
	add	%v0, %zero, %a0
	jr	%ra
create_pixel.3059:
	add	%a3, %zero, %ra
	addi	%v0, %zero, 3
	flw	%f0, 482(%zero)
	jal	min_caml_create_float_array
	addi	%k0, %v0, 0
	jal	create_float5x3array.3057
	addi	%s0, %v0, 0
	addi	%a1, %zero, 5
	addi	%s1, %zero, 0
	addi	%v1, %s1, 0
	addi	%v0, %a1, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v1, %s1, 0
	addi	%v0, %a1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	jal	create_float5x3array.3057
	addi	%s4, %v0, 0
	jal	create_float5x3array.3057
	addi	%s5, %v0, 0
	addi	%v0, %zero, 1
	addi	%v1, %s1, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	jal	create_float5x3array.3057
	addi	%a0, %v0, 0
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v0)
	sw	%s1, 6(%v0)
	sw	%s5, 5(%v0)
	sw	%s4, 4(%v0)
	sw	%s3, 3(%v0)
	sw	%s2, 2(%v0)
	sw	%s0, 1(%v0)
	sw	%k0, 0(%v0)
	add	%ra, %zero, %a3
	jr	%ra
init_line_elements.3061:
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1
	add	%t7, %zero, %ra
	blti	%s7, 0, bgti_else.10895
	jal	create_pixel.3059
	add	%at, %s6, %s7
	sw	%v0, 0(%at)
	addi	%v1, %s7, -1
	add	%ra, %zero, %t7
	addi	%v0, %s6, 0
	j	init_line_elements.3061
bgti_else.10895:
	add	%ra, %zero, %t7
	add	%v0, %zero, %s6
	jr	%ra
create_pixelline.3064:
	add	%s6, %zero, %ra
	lw	%s7, 154(%zero)
	jal	create_pixel.3059
	addi	%v1, %v0, 0
	addi	%v0, %s7, 0
	jal	min_caml_create_array
	addi	%v1, %s7, -2
	add	%ra, %zero, %s6
	j	init_line_elements.3061
tan.3066:
	fmov	%f19, %f0
	add	%a3, %zero, %ra
	fmov	%f0, %f19
	jal	sin.2625
	fmov	%f20, %f0
	fmov	%f0, %f19
	jal	cos.2623
	add	%ra, %zero, %a3
	fdiv	%f0, %f20, %f0
	jr	%ra
adjust_position.3068:
	fmov	%f20, %f1
	add	%k0, %zero, %ra
	fmul	%f1, %f0, %f0
	flw	%f0, 439(%zero)
	fadd	%f0, %f1, %f0
	fsqrt	%f21, %f0
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f21
	jal	atan.2627
	fmul	%f0, %f0, %f20
	jal	tan.3066
	add	%ra, %zero, %k0
	fmul	%f0, %f0, %f21
	jr	%ra
calc_dirvec.3071:
	fmov	%f16, %f0
	fmov	%f17, %f1
	fmov	%f22, %f2
	add	%s0, %zero, %a0
	add	%s1, %zero, %ra
	blti	%v0, 5, bgti_else.10971
	fmov	%f0, %f16
	jal	fsqr.2606
	fmov	%f1, %f0
	fmov	%f0, %f17
	jal	fsqr.2606
	fadd	%f0, %f1, %f0
	flw	%f1, 477(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	fdiv	%f18, %f16, %f0
	fdiv	%f17, %f17, %f0
	fdiv	%f16, %f1, %f0
	lw	%a1, 179(%v1)
	add	%at, %a1, %s0
	lw	%v0, 0(%at)
	jal	d_vec.2751
	fmov	%f2, %f16
	fmov	%f1, %f17
	fmov	%f0, %f18
	jal	vecset.2644
	addi	%a0, %s0, 40
	add	%at, %a1, %a0
	lw	%v0, 0(%at)
	jal	d_vec.2751
	fneg	%f2, %f17
	fmov	%f1, %f16
	fmov	%f0, %f18
	jal	vecset.2644
	addi	%a0, %s0, 80
	add	%at, %a1, %a0
	lw	%v0, 0(%at)
	jal	d_vec.2751
	fneg	%f1, %f18
	fneg	%f2, %f17
	fmov	%f0, %f16
	jal	vecset.2644
	addi	%a0, %s0, 1
	add	%at, %a1, %a0
	lw	%v0, 0(%at)
	jal	d_vec.2751
	fneg	%f0, %f18
	fneg	%f1, %f17
	fneg	%f2, %f16
	jal	vecset.2644
	addi	%a0, %s0, 41
	add	%at, %a1, %a0
	lw	%v0, 0(%at)
	jal	d_vec.2751
	fneg	%f0, %f18
	fneg	%f1, %f16
	fmov	%f2, %f17
	jal	vecset.2644
	addi	%a0, %s0, 81
	add	%at, %a1, %a0
	lw	%v0, 0(%at)
	jal	d_vec.2751
	fneg	%f0, %f16
	add	%ra, %zero, %s1
	fmov	%f2, %f17
	fmov	%f1, %f18
	j	vecset.2644
bgti_else.10971:
	fmov	%f1, %f22
	fmov	%f0, %f17
	jal	adjust_position.3068
	fmov	%f23, %f0
	addi	%v0, %v0, 1
	fmov	%f1, %f3
	fmov	%f0, %f23
	jal	adjust_position.3068
	fmov	%f1, %f0
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0
	fmov	%f2, %f22
	fmov	%f0, %f23
	j	calc_dirvec.3071
calc_dirvecs.3079:
	fmov	%f3, %f0
	add	%s2, %zero, %v0
	add	%s3, %zero, %v1
	add	%s4, %zero, %a0
	add	%s5, %zero, %ra
	addi	%s6, %zero, 0
	blti	%s2, 0, bgti_else.10994
	itof	%f0, %s2
	flw	%f25, 473(%zero)
	fmul	%f1, %f0, %f25
	flw	%f0, 436(%zero)
	fsub	%f2, %f1, %f0
	flw	%f24, 482(%zero)
	addi	%a0, %s4, 0
	addi	%v1, %s3, 0
	addi	%v0, %s6, 0
	fmov	%f1, %f24
	fmov	%f0, %f24
	jal	calc_dirvec.3071
	itof	%f0, %s2
	fmul	%f1, %f0, %f25
	flw	%f0, 439(%zero)
	fadd	%f2, %f1, %f0
	addi	%a0, %s4, 2
	addi	%v1, %s3, 0
	addi	%v0, %s6, 0
	fmov	%f1, %f24
	fmov	%f0, %f24
	jal	calc_dirvec.3071
	addi	%v1, %zero, 1
	addi	%a1, %s2, -1
	addi	%v0, %s3, 0
	jal	add_mod5.2641
	addi	%v1, %v0, 0
	add	%ra, %zero, %s5
	addi	%a0, %s4, 0
	addi	%v0, %a1, 0
	fmov	%f0, %f3
	j	calc_dirvecs.3079
bgti_else.10994:
	add	%ra, %zero, %s5
	jr	%ra
calc_dirvec_rows.3084:
	add	%s7, %zero, %v0
	add	%t7, %zero, %v1
	add	%t8, %zero, %a0
	add	%t9, %zero, %ra
	blti	%s7, 0, bgti_else.11018
	itof	%f1, %s7
	flw	%f0, 473(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 436(%zero)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 4
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0
	jal	calc_dirvecs.3079
	addi	%a1, %s7, -1
	addi	%v1, %zero, 2
	addi	%v0, %t7, 0
	jal	add_mod5.2641
	addi	%v1, %v0, 0
	addi	%a0, %t8, 4
	add	%ra, %zero, %t9
	addi	%v0, %a1, 0
	j	calc_dirvec_rows.3084
bgti_else.11018:
	add	%ra, %zero, %t9
	jr	%ra
create_dirvec.3088:
	add	%a1, %zero, %ra
	addi	%v0, %zero, 3
	flw	%f0, 482(%zero)
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	lw	%v0, 0(%zero)
	addi	%v1, %a2, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%a0, 1(%v0)
	sw	%a2, 0(%v0)
	add	%ra, %zero, %a1
	jr	%ra
create_dirvec_elements.3090:
	add	%a3, %zero, %v0
	add	%k0, %zero, %v1
	add	%s0, %zero, %ra
	blti	%k0, 0, bgti_else.11060
	jal	create_dirvec.3088
	add	%at, %a3, %k0
	sw	%v0, 0(%at)
	addi	%v1, %k0, -1
	add	%ra, %zero, %s0
	addi	%v0, %a3, 0
	j	create_dirvec_elements.3090
bgti_else.11060:
	add	%ra, %zero, %s0
	jr	%ra
create_dirvecs.3093:
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra
	blti	%s1, 0, bgti_else.11084
	addi	%a3, %zero, 120
	jal	create_dirvec.3088
	addi	%v1, %v0, 0
	addi	%v0, %a3, 0
	jal	min_caml_create_array
	sw	%v0, 179(%s1)
	lw	%v0, 179(%s1)
	addi	%v1, %zero, 118
	jal	create_dirvec_elements.3090
	addi	%v0, %s1, -1
	add	%ra, %zero, %s2
	j	create_dirvecs.3093
bgti_else.11084:
	add	%ra, %zero, %s2
	jr	%ra
init_dirvec_constants.3095:
	add	%s5, %zero, %v0
	add	%s6, %zero, %v1
	add	%s7, %zero, %ra
	blti	%s6, 0, bgti_else.11108
	add	%at, %s5, %s6
	lw	%v0, 0(%at)
	jal	setup_dirvec_constants.2880
	addi	%v1, %s6, -1
	add	%ra, %zero, %s7
	addi	%v0, %s5, 0
	j	init_dirvec_constants.3095
bgti_else.11108:
	add	%ra, %zero, %s7
	jr	%ra
init_vecset_constants.3098:
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra
	blti	%t7, 0, bgti_else.11132
	lw	%v0, 179(%t7)
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3095
	addi	%v0, %t7, -1
	add	%ra, %zero, %t8
	j	init_vecset_constants.3098
bgti_else.11132:
	add	%ra, %zero, %t8
	jr	%ra
init_dirvecs.3100:
	sw	%ra, 0(%sp)
	addi	%v0, %zero, 4
	addi	%sp, %sp, 1
	jal	create_dirvecs.3093
	addi	%sp, %sp, -1
	addi	%v0, %zero, 9
	addi	%v1, %zero, 0
	addi	%a0, %v1, 0
	addi	%sp, %sp, 1
	jal	calc_dirvec_rows.3084
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 4
	j	init_vecset_constants.3098
add_reflection.3102:
	fmov	%f24, %f0
	fmov	%f16, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	add	%s5, %zero, %v0
	add	%s6, %zero, %v1
	add	%s7, %zero, %ra
	jal	create_dirvec.3088
	addi	%t7, %v0, 0
	addi	%v0, %t7, 0
	jal	d_vec.2751
	fmov	%f0, %f16
	jal	vecset.2644
	addi	%v0, %t7, 0
	jal	setup_dirvec_constants.2880
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f24, 2(%a0)
	sw	%t7, 1(%a0)
	sw	%s6, 0(%a0)
	add	%ra, %zero, %s7
	sw	%a0, 254(%s5)
	jr	%ra
setup_rect_reflection.3109:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	sw	%t6, 0(%sp)
	add	%t8, %zero, %ra
	sll	%t6, %a0, 2
	lw	%t9, 434(%zero)
	flw	%f1, 477(%zero)
	addi	%sp, %sp, 1
	jal	o_diffuse.2714
	addi	%sp, %sp, -1
	fsub	%f26, %f1, %f0
	flw	%f1, 78(%zero)
	fneg	%f28, %f1
	flw	%f27, 79(%zero)
	fneg	%f25, %f27
	flw	%f29, 80(%zero)
	fneg	%f3, %f29
	addi	%v1, %t6, 1
	addi	%v0, %t9, 0
	fmov	%f2, %f25
	fmov	%f0, %f26
	addi	%sp, %sp, 1
	jal	add_reflection.3102
	addi	%sp, %sp, -1
	addi	%v0, %t9, 1
	addi	%v1, %t6, 2
	fmov	%f2, %f27
	fmov	%f1, %f28
	fmov	%f0, %f26
	addi	%sp, %sp, 1
	jal	add_reflection.3102
	addi	%sp, %sp, -1
	addi	%v0, %t9, 2
	addi	%v1, %t6, 3
	fmov	%f3, %f29
	fmov	%f2, %f25
	fmov	%f1, %f28
	fmov	%f0, %f26
	addi	%sp, %sp, 1
	jal	add_reflection.3102
	addi	%sp, %sp, -1
	addi	%a0, %t9, 3
	lw	%t6, 0(%sp)
	add	%ra, %zero, %t8
	sw	%a0, 434(%zero)
	jr	%ra
setup_surface_reflection.3112:
	add	%a1, %zero, %v1
	add	%t8, %zero, %ra
	sll	%a0, %v0, 2
	addi	%a2, %a0, 1
	lw	%t9, 434(%zero)
	flw	%f1, 477(%zero)
	addi	%v0, %a1, 0
	jal	o_diffuse.2714
	fsub	%f17, %f1, %f0
	addi	%v0, %a1, 0
	jal	o_param_abc.2706
	addi	%v1, %v0, 0
	addi	%v0, %zero, 78
	jal	veciprod.2665
	fmov	%f16, %f0
	flw	%f19, 468(%zero)
	addi	%v0, %a1, 0
	jal	o_param_a.2700
	fmul	%f0, %f19, %f0
	fmul	%f1, %f0, %f16
	flw	%f0, 78(%zero)
	fsub	%f1, %f1, %f0
	addi	%v0, %a1, 0
	jal	o_param_b.2702
	fmul	%f0, %f19, %f0
	fmul	%f18, %f0, %f16
	flw	%f0, 79(%zero)
	fsub	%f2, %f18, %f0
	addi	%v0, %a1, 0
	jal	o_param_c.2704
	fmul	%f0, %f19, %f0
	fmul	%f16, %f0, %f16
	flw	%f0, 80(%zero)
	fsub	%f3, %f16, %f0
	addi	%v1, %a2, 0
	addi	%v0, %t9, 0
	fmov	%f0, %f17
	jal	add_reflection.3102
	addi	%a0, %t9, 1
	add	%ra, %zero, %t8
	sw	%a0, 434(%zero)
	jr	%ra
setup_reflections.3115:
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	blti	%a1, 0, bgti_else.11255
	lw	%v1, 12(%a1)
	addi	%v0, %v1, 0
	jal	o_reflectiontype.2694
	beqi	%v0, 2, bnei_else.11256
	add	%ra, %zero, %a2
	jr	%ra
bnei_else.11256:
	addi	%v0, %v1, 0
	jal	o_diffuse.2714
	flw	%f1, 477(%zero)
	jal	fless.2592
	beqi	%v0, 0, bnei_else.11258
	addi	%v0, %v1, 0
	jal	o_form.2692
	beqi	%v0, 1, bnei_else.11259
	beqi	%v0, 2, bnei_else.11260
	add	%ra, %zero, %a2
	jr	%ra
bnei_else.11260:
	add	%ra, %zero, %a2
	addi	%v0, %a1, 0
	j	setup_surface_reflection.3112
bnei_else.11259:
	add	%ra, %zero, %a2
	addi	%v0, %a1, 0
	j	setup_rect_reflection.3109
bnei_else.11258:
	add	%ra, %zero, %a2
	jr	%ra
bgti_else.11255:
	add	%ra, %zero, %a2
	jr	%ra
rt.3117:
	sw	%ra, 0(%sp)
	addi	%a0, %zero, 0
	sw	%v0, 154(%zero)
	sw	%v1, 155(%zero)
	addi	%a0, %zero, 2
	srl	%a0, %v0, 1
	sw	%a0, 156(%zero)
	srl	%a0, %v1, 1
	sw	%a0, 157(%zero)
	flw	%f1, 435(%zero)
	itof	%f0, %v0
	fdiv	%f0, %f1, %f0
	fsw	%f0, 158(%zero)
	addi	%sp, %sp, 1
	jal	create_pixelline.3064
	addi	%sp, %sp, -1
	sw	%v0, 1(%sp)
	addi	%sp, %sp, 2
	jal	create_pixelline.3064
	addi	%sp, %sp, -2
	sw	%v0, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_pixelline.3064
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_parameter.2782
	addi	%sp, %sp, -4
	addi	%sp, %sp, 4
	jal	write_ppm_header.3025
	addi	%sp, %sp, -4
	addi	%sp, %sp, 4
	jal	init_dirvecs.3100
	addi	%sp, %sp, -4
	addi	%v0, %zero, 247
	addi	%sp, %sp, 4
	jal	d_vec.2751
	addi	%sp, %sp, -4
	addi	%v1, %zero, 78
	addi	%sp, %sp, 4
	jal	veccpy.2654
	addi	%sp, %sp, -4
	addi	%v0, %zero, 247
	addi	%sp, %sp, 4
	jal	setup_dirvec_constants.2880
	addi	%sp, %sp, -4
	lw	%a0, 0(%zero)
	addi	%v0, %a0, -1
	addi	%sp, %sp, 4
	jal	setup_reflections.3115
	addi	%sp, %sp, -4
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	lw	%v0, 2(%sp)
	addi	%a0, %v1, 0
	addi	%sp, %sp, 4
	jal	pretrace_line.3041
	addi	%sp, %sp, -4
	lw	%ra, 0(%sp)
	addi	%a2, %zero, 2
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %zero, 0
	j	scan_line.3051
.global	min_caml_start
min_caml_start:
	addi	%a3, %zero, 1
	addi	%a2, %zero, 0
	addi	%a0, %zero, 0
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	flw	%f1, 482(%zero)
	addi	%v1, %zero, 1
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%k0, %zero, 60
	sw	%v0, 11(%zero)
	sw	%v0, 10(%zero)
	sw	%v0, 9(%zero)
	sw	%v0, 8(%zero)
	sw	%a2, 7(%zero)
	sw	%v0, 6(%zero)
	sw	%v0, 5(%zero)
	sw	%a2, 4(%zero)
	sw	%a2, 3(%zero)
	sw	%a2, 2(%zero)
	sw	%a2, 1(%zero)
	addi	%a0, %zero, 12
	addi	%v1, %zero, 1
	addi	%v0, %k0, 0
	jal	min_caml_create_extarray
	addi	%s0, %zero, 3
	addi	%v1, %zero, 72
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 75
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 78
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	flw	%f0, 447(%zero)
	addi	%v1, %zero, 81
	addi	%v0, %a3, 0
	jal	min_caml_create_float_extarray
	addi	%s1, %zero, 50
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	addi	%v0, %s1, 0
	jal	min_caml_create_extarray
	lw	%v1, 83(%zero)
	addi	%a0, %zero, 133
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 135
	addi	%v0, %a3, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 136
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	flw	%f0, 454(%zero)
	addi	%v1, %zero, 137
	addi	%v0, %a3, 0
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 138
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 141
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 142
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 145
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 148
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 151
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%s1, %zero, 2
	addi	%a0, %zero, 154
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 156
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 158
	addi	%v0, %a3, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 159
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 162
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 165
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 168
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 171
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 174
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 177
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%s1, %v0, 0
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	sw	%v0, 178(%zero)
	sw	%s1, 177(%zero)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	jal	min_caml_create_extarray
	addi	%v1, %zero, 184
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 184
	addi	%v0, %s0, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%s0, %v0, 0
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	addi	%v0, %k0, 0
	jal	min_caml_create_extarray
	sw	%v0, 248(%zero)
	sw	%s0, 247(%zero)
	addi	%v1, %zero, 249
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	jal	min_caml_create_float_extarray
	addi	%k0, %v0, 0
	addi	%a0, %zero, 249
	addi	%v1, %zero, 249
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 249
	sw	%v0, 250(%zero)
	sw	%k0, 249(%zero)
	addi	%v0, %zero, 180
	fsw	%f1, 253(%zero)
	sw	%a0, 252(%zero)
	sw	%a2, 251(%zero)
	addi	%a0, %zero, 254
	addi	%v1, %zero, 251
	jal	min_caml_create_extarray
	addi	%a0, %zero, 434
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	addi	%v0, %zero, 128
	addi	%v1, %v0, 0
	jal	rt.3117
	addi	%g0, %zero, 0
	ret
