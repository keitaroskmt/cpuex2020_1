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
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f1, 467(%zero)
	fsw	%f1, 2(%sp)
	addi	%sp, %sp, 3
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -3
	fmov	%f1, %f0
	lw	%ra, 1(%sp)
	flw	%f2, 2(%sp)
	flw	%f0, 0(%sp)
	j	reduction_2pi_sub2.2617
cos.2623:
	fsw	%f6, 0(%sp)
	sw	%t0, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f6, 466(%zero)
	fabs	%f0, %f0
	addi	%sp, %sp, 3
	jal	reduction_2pi.2621
	addi	%sp, %sp, -3
	fblt	%f0, %f6, fbgt_else.7072
	addi	%t0, %zero, 0
	j	fbgt_cont.7073
fbgt_else.7072:
	addi	%t0, %zero, 1
fbgt_cont.7073:
	fblt	%f0, %f6, fbgt_else.7074
	fsub	%f0, %f0, %f6
	j	fbgt_cont.7075
fbgt_else.7074:
fbgt_cont.7075:
	flw	%f16, 465(%zero)
	fblt	%f0, %f16, fbgt_else.7076
	beqi	%t0, 0, bnei_else.7078
	addi	%t0, %zero, 0
	j	fbgt_cont.7077
bnei_else.7078:
	addi	%t0, %zero, 1
bnei_cont.7079:
	j	fbgt_cont.7077
fbgt_else.7076:
fbgt_cont.7077:
	fblt	%f0, %f16, fbgt_else.7080
	fsub	%f0, %f6, %f0
	j	fbgt_cont.7081
fbgt_else.7080:
fbgt_cont.7081:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.7082
	addi	%sp, %sp, 3
	jal	kernel_cos.2610
	addi	%sp, %sp, -3
	j	fbgt_cont.7083
fbgt_else.7082:
	fsub	%f0, %f16, %f0
	addi	%sp, %sp, 3
	jal	kernel_sin.2608
	addi	%sp, %sp, -3
fbgt_cont.7083:
	beqi	%t0, 0, bnei_else.7084
	flw	%f6, 0(%sp)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.7084:
	flw	%f6, 0(%sp)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	fneg	%f0, %f0
	jr	%ra
sin.2625:
	fsw	%f6, 0(%sp)
	sw	%t0, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f6, 466(%zero)
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.7154
	addi	%t0, %zero, 1
	j	fbgt_cont.7155
fbgt_else.7154:
	addi	%t0, %zero, 0
fbgt_cont.7155:
	fabs	%f0, %f0
	addi	%sp, %sp, 3
	jal	reduction_2pi.2621
	addi	%sp, %sp, -3
	fblt	%f0, %f6, fbgt_else.7156
	beqi	%t0, 0, bnei_else.7158
	addi	%t0, %zero, 0
	j	fbgt_cont.7157
bnei_else.7158:
	addi	%t0, %zero, 1
bnei_cont.7159:
	j	fbgt_cont.7157
fbgt_else.7156:
fbgt_cont.7157:
	fblt	%f0, %f6, fbgt_else.7160
	fsub	%f0, %f0, %f6
	j	fbgt_cont.7161
fbgt_else.7160:
fbgt_cont.7161:
	flw	%f16, 465(%zero)
	fblt	%f0, %f16, fbgt_else.7162
	fsub	%f0, %f6, %f0
	j	fbgt_cont.7163
fbgt_else.7162:
fbgt_cont.7163:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.7164
	addi	%sp, %sp, 3
	jal	kernel_sin.2608
	addi	%sp, %sp, -3
	j	fbgt_cont.7165
fbgt_else.7164:
	fsub	%f0, %f16, %f0
	addi	%sp, %sp, 3
	jal	kernel_cos.2610
	addi	%sp, %sp, -3
fbgt_cont.7165:
	beqi	%t0, 0, bnei_else.7166
	flw	%f6, 0(%sp)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.7166:
	flw	%f6, 0(%sp)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	fneg	%f0, %f0
	jr	%ra
atan.2627:
	sw	%ra, 0(%sp)
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.7219
	addi	%a0, %zero, 1
	j	fbgt_cont.7220
fbgt_else.7219:
	addi	%a0, %zero, 0
fbgt_cont.7220:
	sw	%a0, 1(%sp)
	fabs	%f16, %f0
	flw	%f1, 463(%zero)
	fblt	%f16, %f1, fbgt_else.7221
	flw	%f0, 462(%zero)
	fblt	%f16, %f0, fbgt_else.7222
	flw	%f0, 465(%zero)
	fsw	%f0, 2(%sp)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f16
	addi	%sp, %sp, 3
	jal	kernel_atan.2612
	addi	%sp, %sp, -3
	flw	%f1, 2(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.7223
fbgt_else.7222:
	flw	%f0, 464(%zero)
	fsw	%f0, 3(%sp)
	flw	%f0, 477(%zero)
	fsub	%f1, %f16, %f0
	fadd	%f0, %f16, %f0
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 4
	jal	kernel_atan.2612
	addi	%sp, %sp, -4
	flw	%f1, 3(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.7223:
	lw	%a0, 1(%sp)
	beqi	%a0, 0, bnei_else.7224
	lw	%ra, 0(%sp)
	jr	%ra
bnei_else.7224:
	lw	%ra, 0(%sp)
	fneg	%f0, %f0
	jr	%ra
fbgt_else.7221:
	lw	%ra, 0(%sp)
	j	kernel_atan.2612
print_int_sub1.2629:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	blti	%a0, 10, bgti_else.7246
	addi	%a0, %a0, -10
	addi	%v1, %v0, 1
	addi	%v0, %a0, 0
	j	print_int_sub1.2629
bgti_else.7246:
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.7268
	addi	%v0, %v0, -10
	j	print_int_sub2.2632
bgti_else.7268:
	jr	%ra
print_int.2634:
	sw	%v0, 0(%sp)
	sw	%t1, 1(%sp)
	sw	%t0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%v1, %zero, 0
	sw	%v1, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub1.2629
	addi	%sp, %sp, -5
	addi	%t0, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2632
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	blt	%zero, %t0, bgt_else.7317
	addi	%v0, %t1, 48
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	j	min_caml_print_char
bgt_else.7317:
	lw	%v1, 4(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 5
	jal	print_int_sub1.2629
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 6
	jal	print_int_sub2.2632
	addi	%sp, %sp, -6
	addi	%t0, %v0, 0
	lw	%v0, 5(%sp)
	blt	%zero, %v0, bgt_else.7318
	addi	%v0, %t0, 48
	addi	%sp, %sp, 6
	jal	min_caml_print_char
	addi	%sp, %sp, -6
	addi	%v0, %t1, 48
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	j	min_caml_print_char
bgt_else.7318:
	addi	%sp, %sp, 6
	jal	print_int_sub2.2632
	addi	%sp, %sp, -6
	addi	%v0, %v0, 48
	addi	%sp, %sp, 6
	jal	min_caml_print_char
	addi	%sp, %sp, -6
	addi	%v0, %t0, 48
	addi	%sp, %sp, 6
	jal	min_caml_print_char
	addi	%sp, %sp, -6
	addi	%v0, %t1, 48
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	j	min_caml_print_char
sgn.2636:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fiszero.2599
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.7355
	lw	%ra, 1(%sp)
	flw	%f0, 482(%zero)
	jr	%ra
bnei_else.7355:
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 2
	jal	fispos.2595
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.7356
	lw	%ra, 1(%sp)
	flw	%f0, 477(%zero)
	jr	%ra
bnei_else.7356:
	lw	%ra, 1(%sp)
	flw	%f0, 461(%zero)
	jr	%ra
fneg_cond.2638:
	beqi	%v0, 0, bnei_else.7378
	jr	%ra
bnei_else.7378:
	fneg	%f0, %f0
	jr	%ra
add_mod5.2641:
	add	%v0, %v0, %v1
	blti	%v0, 5, bgti_else.7400
	addi	%v0, %v0, -5
	jr	%ra
bgti_else.7400:
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
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f9, 2(%sp)
	fsw	%f8, 3(%sp)
	fsw	%f7, 4(%sp)
	fsw	%f6, 5(%sp)
	sw	%ra, 6(%sp)
	flw	%f6, 0(%v0)
	fmov	%f0, %f6
	addi	%sp, %sp, 7
	jal	fsqr.2606
	addi	%sp, %sp, -7
	fmov	%f7, %f0
	lw	%a0, 0(%sp)
	flw	%f8, 1(%a0)
	fmov	%f0, %f8
	addi	%sp, %sp, 7
	jal	fsqr.2606
	addi	%sp, %sp, -7
	fadd	%f9, %f7, %f0
	lw	%a0, 0(%sp)
	flw	%f7, 2(%a0)
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fsqr.2606
	addi	%sp, %sp, -7
	fadd	%f0, %f9, %f0
	fsqrt	%f9, %f0
	fmov	%f0, %f9
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.7527
	flw	%f1, 477(%zero)
	j	bnei_cont.7528
bnei_else.7527:
	lw	%a0, 1(%sp)
	beqi	%a0, 0, bnei_else.7529
	flw	%f0, 461(%zero)
	fdiv	%f1, %f0, %f9
	j	bnei_cont.7530
bnei_else.7529:
	flw	%f0, 477(%zero)
	fdiv	%f1, %f0, %f9
bnei_cont.7530:
bnei_cont.7528:
	fmul	%f0, %f6, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 0(%a0)
	fmul	%f0, %f8, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f7, %f1
	flw	%f9, 2(%sp)
	flw	%f8, 3(%sp)
	flw	%f7, 4(%sp)
	flw	%f6, 5(%sp)
	lw	%ra, 6(%sp)
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
	fsw	%f15, 0(%sp)
	fsw	%f14, 1(%sp)
	fsw	%f13, 2(%sp)
	fsw	%f12, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	fsw	%f0, 72(%zero)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	fsw	%f0, 73(%zero)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	fsw	%f0, 74(%zero)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	addi	%sp, %sp, 5
	jal	rad.2761
	addi	%sp, %sp, -5
	fmov	%f12, %f0
	fmov	%f0, %f12
	addi	%sp, %sp, 5
	jal	cos.2623
	addi	%sp, %sp, -5
	fmov	%f13, %f0
	fmov	%f0, %f12
	addi	%sp, %sp, 5
	jal	sin.2625
	addi	%sp, %sp, -5
	fmov	%f12, %f0
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	addi	%sp, %sp, 5
	jal	rad.2761
	addi	%sp, %sp, -5
	fmov	%f14, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 5
	jal	cos.2623
	addi	%sp, %sp, -5
	fmov	%f15, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 5
	jal	sin.2625
	addi	%sp, %sp, -5
	fmul	%f1, %f13, %f0
	flw	%f14, 459(%zero)
	fmul	%f1, %f1, %f14
	fsw	%f1, 171(%zero)
	flw	%f1, 458(%zero)
	fmul	%f1, %f12, %f1
	fsw	%f1, 172(%zero)
	fmul	%f1, %f13, %f15
	fmul	%f1, %f1, %f14
	fsw	%f1, 173(%zero)
	fsw	%f15, 165(%zero)
	flw	%f1, 482(%zero)
	fsw	%f1, 166(%zero)
	fneg	%f1, %f0
	fsw	%f1, 167(%zero)
	fneg	%f1, %f12
	fmul	%f0, %f1, %f0
	fsw	%f0, 168(%zero)
	fneg	%f0, %f13
	fsw	%f0, 169(%zero)
	fneg	%f0, %f12
	fmul	%f0, %f0, %f15
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
	flw	%f15, 0(%sp)
	flw	%f14, 1(%sp)
	flw	%f13, 2(%sp)
	flw	%f12, 3(%sp)
	lw	%ra, 4(%sp)
	fsw	%f0, 77(%zero)
	jr	%ra
read_light.2765:
	fsw	%f15, 0(%sp)
	fsw	%f14, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	addi	%sp, %sp, 3
	jal	min_caml_read_float
	addi	%sp, %sp, -3
	addi	%sp, %sp, 3
	jal	rad.2761
	addi	%sp, %sp, -3
	fmov	%f14, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 3
	jal	sin.2625
	addi	%sp, %sp, -3
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	addi	%sp, %sp, 3
	jal	min_caml_read_float
	addi	%sp, %sp, -3
	addi	%sp, %sp, 3
	jal	rad.2761
	addi	%sp, %sp, -3
	fmov	%f15, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 3
	jal	cos.2623
	addi	%sp, %sp, -3
	fmov	%f14, %f0
	fmov	%f0, %f15
	addi	%sp, %sp, 3
	jal	sin.2625
	addi	%sp, %sp, -3
	fmul	%f0, %f14, %f0
	fsw	%f0, 78(%zero)
	fmov	%f0, %f15
	addi	%sp, %sp, 3
	jal	cos.2623
	addi	%sp, %sp, -3
	fmul	%f0, %f14, %f0
	fsw	%f0, 80(%zero)
	addi	%sp, %sp, 3
	jal	min_caml_read_float
	addi	%sp, %sp, -3
	flw	%f15, 0(%sp)
	flw	%f14, 1(%sp)
	lw	%ra, 2(%sp)
	fsw	%f0, 81(%zero)
	jr	%ra
rotate_quadratic_matrix.2767:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f15, 2(%sp)
	fsw	%f14, 3(%sp)
	fsw	%f13, 4(%sp)
	fsw	%f12, 5(%sp)
	fsw	%f11, 6(%sp)
	fsw	%f10, 7(%sp)
	fsw	%f9, 8(%sp)
	fsw	%f8, 9(%sp)
	fsw	%f7, 10(%sp)
	fsw	%f6, 11(%sp)
	sw	%ra, 12(%sp)
	flw	%f10, 0(%v1)
	fmov	%f0, %f10
	addi	%sp, %sp, 13
	jal	cos.2623
	addi	%sp, %sp, -13
	fmov	%f11, %f0
	fmov	%f0, %f10
	addi	%sp, %sp, 13
	jal	sin.2625
	addi	%sp, %sp, -13
	fmov	%f10, %f0
	lw	%a0, 1(%sp)
	flw	%f12, 1(%a0)
	fmov	%f0, %f12
	addi	%sp, %sp, 13
	jal	cos.2623
	addi	%sp, %sp, -13
	fmov	%f13, %f0
	fmov	%f0, %f12
	addi	%sp, %sp, 13
	jal	sin.2625
	addi	%sp, %sp, -13
	fmov	%f12, %f0
	lw	%a0, 1(%sp)
	flw	%f14, 2(%a0)
	fmov	%f0, %f14
	addi	%sp, %sp, 13
	jal	cos.2623
	addi	%sp, %sp, -13
	fmov	%f15, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 13
	jal	sin.2625
	addi	%sp, %sp, -13
	fmov	%f1, %f0
	fmul	%f0, %f13, %f15
	fsw	%f0, 13(%sp)
	fmul	%f19, %f10, %f12
	fmul	%f16, %f19, %f15
	fmul	%f14, %f11, %f1
	fsub	%f14, %f16, %f14
	fmul	%f18, %f11, %f12
	fmul	%f17, %f18, %f15
	fmul	%f16, %f10, %f1
	fadd	%f6, %f17, %f16
	fmul	%f16, %f13, %f1
	fsw	%f16, 14(%sp)
	fmul	%f17, %f19, %f1
	fmul	%f16, %f11, %f15
	fadd	%f7, %f17, %f16
	fmul	%f16, %f18, %f1
	fmul	%f1, %f10, %f15
	fsub	%f15, %f16, %f1
	fneg	%f12, %f12
	fmul	%f8, %f10, %f13
	fmul	%f10, %f11, %f13
	lw	%a0, 0(%sp)
	flw	%f11, 0(%a0)
	flw	%f13, 1(%a0)
	flw	%f9, 2(%a0)
	addi	%sp, %sp, 15
	jal	fsqr.2606
	addi	%sp, %sp, -15
	fmul	%f0, %f11, %f0
	fsw	%f0, 15(%sp)
	flw	%f0, 14(%sp)
	addi	%sp, %sp, 16
	jal	fsqr.2606
	addi	%sp, %sp, -16
	fmul	%f1, %f13, %f0
	flw	%f0, 15(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 16(%sp)
	fmov	%f0, %f12
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	fmul	%f1, %f9, %f0
	flw	%f0, 16(%sp)
	fadd	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 0(%a0)
	fmov	%f0, %f14
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	fmul	%f0, %f11, %f0
	fsw	%f0, 17(%sp)
	fmov	%f0, %f7
	addi	%sp, %sp, 18
	jal	fsqr.2606
	addi	%sp, %sp, -18
	fmul	%f1, %f13, %f0
	flw	%f0, 17(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 18(%sp)
	fmov	%f0, %f8
	addi	%sp, %sp, 19
	jal	fsqr.2606
	addi	%sp, %sp, -19
	fmul	%f1, %f9, %f0
	flw	%f0, 18(%sp)
	fadd	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 1(%a0)
	fmov	%f0, %f6
	addi	%sp, %sp, 19
	jal	fsqr.2606
	addi	%sp, %sp, -19
	fmul	%f0, %f11, %f0
	fsw	%f0, 19(%sp)
	fmov	%f0, %f15
	addi	%sp, %sp, 20
	jal	fsqr.2606
	addi	%sp, %sp, -20
	fmul	%f1, %f13, %f0
	flw	%f0, 19(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 20(%sp)
	fmov	%f0, %f10
	addi	%sp, %sp, 21
	jal	fsqr.2606
	addi	%sp, %sp, -21
	fmul	%f1, %f9, %f0
	flw	%f0, 20(%sp)
	fadd	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 2(%a0)
	flw	%f17, 468(%zero)
	fmul	%f0, %f11, %f14
	fmul	%f1, %f0, %f6
	fmul	%f0, %f13, %f7
	fmul	%f0, %f0, %f15
	fadd	%f1, %f1, %f0
	fmul	%f0, %f9, %f8
	fmul	%f0, %f0, %f10
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	lw	%a0, 1(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 13(%sp)
	fmul	%f16, %f11, %f0
	fmul	%f1, %f16, %f6
	flw	%f0, 14(%sp)
	fmul	%f13, %f13, %f0
	fmul	%f0, %f13, %f15
	fadd	%f1, %f1, %f0
	fmul	%f11, %f9, %f12
	fmul	%f0, %f11, %f10
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	fsw	%f0, 1(%a0)
	fmul	%f1, %f16, %f14
	fmul	%f0, %f13, %f7
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f8
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	flw	%f15, 2(%sp)
	flw	%f14, 3(%sp)
	flw	%f13, 4(%sp)
	flw	%f12, 5(%sp)
	flw	%f11, 6(%sp)
	flw	%f10, 7(%sp)
	flw	%f9, 8(%sp)
	flw	%f8, 9(%sp)
	flw	%f7, 10(%sp)
	flw	%f6, 11(%sp)
	lw	%ra, 12(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
read_nth_object.2770:
	sw	%v0, 0(%sp)
	fsw	%f7, 1(%sp)
	fsw	%f6, 2(%sp)
	sw	%t6, 3(%sp)
	sw	%t5, 4(%sp)
	sw	%t4, 5(%sp)
	sw	%t3, 6(%sp)
	sw	%t2, 7(%sp)
	sw	%t1, 8(%sp)
	sw	%t0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_read_int
	addi	%sp, %sp, -11
	sw	%v0, 11(%sp)
	beqi	%v0, -1, bnei_else.8548
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	addi	%t0, %v0, 0
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	sw	%v0, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_read_int
	addi	%sp, %sp, -13
	addi	%t1, %v0, 0
	addi	%t2, %zero, 3
	flw	%f6, 482(%zero)
	addi	%v0, %t2, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	addi	%t3, %v0, 0
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 0(%t3)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 1(%t3)
	addi	%t5, %zero, 2
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 2(%t3)
	addi	%v0, %t2, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	addi	%t4, %v0, 0
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 0(%t4)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 1(%t4)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 2(%t4)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	addi	%sp, %sp, 13
	jal	fisneg.2597
	addi	%sp, %sp, -13
	sw	%v0, 13(%sp)
	addi	%v0, %t5, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	addi	%t5, %v0, 0
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 0(%t5)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 1(%t5)
	addi	%v0, %t2, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	addi	%t6, %v0, 0
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 0(%t6)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 1(%t6)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 2(%t6)
	addi	%v0, %t2, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	addi	%t2, %v0, 0
	beqi	%t1, 0, bnei_else.8549
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	addi	%sp, %sp, 14
	jal	rad.2761
	addi	%sp, %sp, -14
	fsw	%f0, 0(%t2)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	addi	%sp, %sp, 14
	jal	rad.2761
	addi	%sp, %sp, -14
	fsw	%f0, 1(%t2)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	addi	%sp, %sp, 14
	jal	rad.2761
	addi	%sp, %sp, -14
	fsw	%f0, 2(%t2)
	j	bnei_cont.8550
bnei_else.8549:
bnei_cont.8550:
	beqi	%t0, 2, bnei_else.8551
	lw	%a0, 13(%sp)
	j	bnei_cont.8552
bnei_else.8551:
	addi	%a0, %zero, 1
bnei_cont.8552:
	sw	%a0, 14(%sp)
	addi	%v0, %zero, 4
	fmov	%f0, %f6
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	add	%a0, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%a0)
	sw	%t2, 9(%a0)
	sw	%t6, 8(%a0)
	sw	%t5, 7(%a0)
	lw	%a1, 14(%sp)
	sw	%a1, 6(%a0)
	sw	%t4, 5(%a0)
	sw	%t3, 4(%a0)
	sw	%t1, 3(%a0)
	lw	%a1, 12(%sp)
	sw	%a1, 2(%a0)
	sw	%t0, 1(%a0)
	lw	%a1, 11(%sp)
	sw	%a1, 0(%a0)
	lw	%a1, 0(%sp)
	sw	%a0, 12(%a1)
	beqi	%t0, 3, bnei_else.8553
	beqi	%t0, 2, bnei_else.8555
	j	bnei_cont.8554
bnei_else.8555:
	lw	%a0, 13(%sp)
	beqi	%a0, 0, bnei_else.8557
	addi	%v1, %zero, 0
	j	bnei_cont.8558
bnei_else.8557:
	addi	%v1, %zero, 1
bnei_cont.8558:
	addi	%v0, %t3, 0
	addi	%sp, %sp, 15
	jal	vecunit_sgn.2662
	addi	%sp, %sp, -15
bnei_cont.8556:
	j	bnei_cont.8554
bnei_else.8553:
	flw	%f7, 0(%t3)
	fmov	%f0, %f7
	addi	%sp, %sp, 15
	jal	fiszero.2599
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.8559
	fmov	%f0, %f6
	j	bnei_cont.8560
bnei_else.8559:
	fmov	%f0, %f7
	addi	%sp, %sp, 15
	jal	sgn.2636
	addi	%sp, %sp, -15
	fsw	%f0, 15(%sp)
	fmov	%f0, %f7
	addi	%sp, %sp, 16
	jal	fsqr.2606
	addi	%sp, %sp, -16
	flw	%f1, 15(%sp)
	fdiv	%f0, %f1, %f0
bnei_cont.8560:
	fsw	%f0, 0(%t3)
	flw	%f7, 1(%t3)
	fmov	%f0, %f7
	addi	%sp, %sp, 16
	jal	fiszero.2599
	addi	%sp, %sp, -16
	beqi	%v0, 0, bnei_else.8561
	fmov	%f0, %f6
	j	bnei_cont.8562
bnei_else.8561:
	fmov	%f0, %f7
	addi	%sp, %sp, 16
	jal	sgn.2636
	addi	%sp, %sp, -16
	fsw	%f0, 16(%sp)
	fmov	%f0, %f7
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	flw	%f1, 16(%sp)
	fdiv	%f0, %f1, %f0
bnei_cont.8562:
	fsw	%f0, 1(%t3)
	flw	%f7, 2(%t3)
	fmov	%f0, %f7
	addi	%sp, %sp, 17
	jal	fiszero.2599
	addi	%sp, %sp, -17
	beqi	%v0, 0, bnei_else.8563
	j	bnei_cont.8564
bnei_else.8563:
	fmov	%f0, %f7
	addi	%sp, %sp, 17
	jal	sgn.2636
	addi	%sp, %sp, -17
	fmov	%f6, %f0
	fmov	%f0, %f7
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	fdiv	%f6, %f6, %f0
bnei_cont.8564:
	fsw	%f6, 2(%t3)
bnei_cont.8554:
	beqi	%t1, 0, bnei_else.8565
	addi	%v1, %t2, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2767
	addi	%sp, %sp, -17
	j	bnei_cont.8566
bnei_else.8565:
bnei_cont.8566:
	flw	%f7, 1(%sp)
	flw	%f6, 2(%sp)
	lw	%t6, 3(%sp)
	lw	%t5, 4(%sp)
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8548:
	flw	%f7, 1(%sp)
	flw	%f6, 2(%sp)
	lw	%t6, 3(%sp)
	lw	%t5, 4(%sp)
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 0
	jr	%ra
read_object.2772:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	blti	%v0, 60, bgti_else.8607
	jr	%ra
bgti_else.8607:
	addi	%sp, %sp, 2
	jal	read_nth_object.2770
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.8609
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	j	read_object.2772
bnei_else.8609:
	lw	%ra, 1(%sp)
	lw	%a0, 0(%sp)
	sw	%a0, 0(%zero)
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
	beqi	%t0, -1, bnei_else.8663
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
bnei_else.8663:
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
	beqi	%a0, -1, bnei_else.8697
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
bnei_else.8697:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	j	min_caml_create_array
read_and_network.2780:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	read_net_item.2776
	addi	%sp, %sp, -2
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.8729
	lw	%a0, 0(%sp)
	sw	%v0, 83(%a0)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	j	read_and_network.2780
bnei_else.8729:
	lw	%ra, 1(%sp)
	jr	%ra
read_parameter.2782:
	sw	%t5, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_screen_settings.2763
	addi	%sp, %sp, -2
	addi	%sp, %sp, 2
	jal	read_light.2765
	addi	%sp, %sp, -2
	addi	%sp, %sp, 2
	jal	read_all_object.2774
	addi	%sp, %sp, -2
	addi	%t5, %zero, 0
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	read_and_network.2780
	addi	%sp, %sp, -2
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	read_or_network.2778
	addi	%sp, %sp, -2
	lw	%t5, 0(%sp)
	lw	%ra, 1(%sp)
	sw	%v0, 134(%zero)
	jr	%ra
solver_rect_surface.2784:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%a2, 7(%sp)
	sw	%ra, 8(%sp)
	add	%at, %v1, %a0
	flw	%f0, 0(%at)
	fsw	%f0, 9(%sp)
	addi	%sp, %sp, 10
	jal	fiszero.2599
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.8827
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8827:
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 10
	jal	o_param_abc.2706
	addi	%sp, %sp, -10
	sw	%v0, 10(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2696
	addi	%sp, %sp, -11
	sw	%v0, 11(%sp)
	flw	%f0, 9(%sp)
	addi	%sp, %sp, 12
	jal	fisneg.2597
	addi	%sp, %sp, -12
	addi	%v1, %v0, 0
	lw	%v0, 11(%sp)
	addi	%sp, %sp, 12
	jal	xor.2601
	addi	%sp, %sp, -12
	lw	%a1, 10(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a1, %a0
	flw	%f0, 0(%at)
	addi	%sp, %sp, 12
	jal	fneg_cond.2638
	addi	%sp, %sp, -12
	flw	%f1, 0(%sp)
	fsub	%f1, %f0, %f1
	flw	%f0, 9(%sp)
	fdiv	%f1, %f1, %f0
	fsw	%f1, 12(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 6(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fmul	%f1, %f1, %f0
	flw	%f0, 1(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	lw	%a0, 10(%sp)
	add	%at, %a0, %a1
	flw	%f1, 0(%at)
	addi	%sp, %sp, 13
	jal	fless.2592
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.8828
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	add	%at, %a0, %a1
	flw	%f1, 0(%at)
	flw	%f0, 12(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 2(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	lw	%a0, 10(%sp)
	add	%at, %a0, %a1
	flw	%f1, 0(%at)
	addi	%sp, %sp, 13
	jal	fless.2592
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.8829
	flw	%f0, 12(%sp)
	fsw	%f0, 135(%zero)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8829:
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8828:
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_rect.2793:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 6(%sp)
	addi	%a1, %zero, 1
	sw	%a1, 7(%sp)
	addi	%a2, %zero, 2
	sw	%a2, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.8895
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8895:
	flw	%f2, 0(%sp)
	flw	%f1, 2(%sp)
	flw	%f0, 1(%sp)
	lw	%a2, 6(%sp)
	lw	%a1, 8(%sp)
	lw	%a0, 7(%sp)
	lw	%v1, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.8896
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.8896:
	flw	%f2, 1(%sp)
	flw	%f1, 0(%sp)
	flw	%f0, 2(%sp)
	lw	%a2, 7(%sp)
	lw	%a1, 6(%sp)
	lw	%a0, 8(%sp)
	lw	%v1, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2784
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.8897
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.8897:
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_surface.2799:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v1, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_abc.2706
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	lw	%v0, 3(%sp)
	addi	%v1, %t0, 0
	addi	%sp, %sp, 7
	jal	veciprod.2665
	addi	%sp, %sp, -7
	fmov	%f6, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 7
	jal	fispos.2595
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.8939
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	veciprod2.2668
	addi	%sp, %sp, -7
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	flw	%f6, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8939:
	flw	%f6, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 0
	jr	%ra
quadratic.2805:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fsqr.2606
	addi	%sp, %sp, -5
	fsw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2700
	addi	%sp, %sp, -6
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 6(%sp)
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 7
	jal	fsqr.2606
	addi	%sp, %sp, -7
	fsw	%f0, 7(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 8
	jal	o_param_b.2702
	addi	%sp, %sp, -8
	flw	%f1, 7(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 6(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 8(%sp)
	flw	%f0, 2(%sp)
	addi	%sp, %sp, 9
	jal	fsqr.2606
	addi	%sp, %sp, -9
	fsw	%f0, 9(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2704
	addi	%sp, %sp, -10
	flw	%f1, 9(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 8(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 10(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2698
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.9009
	flw	%f1, 1(%sp)
	flw	%f0, 2(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 11(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r1.2724
	addi	%sp, %sp, -12
	flw	%f1, 11(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 10(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 12(%sp)
	flw	%f1, 2(%sp)
	flw	%f0, 0(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 13(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r2.2726
	addi	%sp, %sp, -14
	flw	%f1, 13(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 12(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 14(%sp)
	flw	%f1, 0(%sp)
	flw	%f0, 1(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 15(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 16
	jal	o_param_r3.2728
	addi	%sp, %sp, -16
	flw	%f1, 15(%sp)
	fmul	%f1, %f1, %f0
	lw	%ra, 4(%sp)
	flw	%f0, 14(%sp)
	fadd	%f0, %f0, %f1
	jr	%ra
bnei_else.9009:
	lw	%ra, 4(%sp)
	flw	%f0, 10(%sp)
	jr	%ra
bilinear.2810:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f3, 3(%sp)
	fsw	%f4, 4(%sp)
	fsw	%f5, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	fmul	%f0, %f0, %f3
	fsw	%f0, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_a.2700
	addi	%sp, %sp, -9
	flw	%f1, 8(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 9(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 4(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 10(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 11
	jal	o_param_b.2702
	addi	%sp, %sp, -11
	flw	%f1, 10(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 9(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 11(%sp)
	flw	%f1, 2(%sp)
	flw	%f0, 5(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 12(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 13
	jal	o_param_c.2704
	addi	%sp, %sp, -13
	flw	%f1, 12(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 11(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 13(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 14
	jal	o_isrot.2698
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.9089
	flw	%f1, 2(%sp)
	flw	%f0, 4(%sp)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%sp)
	flw	%f0, 5(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 14(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 15
	jal	o_param_r1.2724
	addi	%sp, %sp, -15
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 15(%sp)
	flw	%f1, 0(%sp)
	flw	%f0, 5(%sp)
	fmul	%f16, %f1, %f0
	flw	%f1, 2(%sp)
	flw	%f0, 3(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 16(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 17
	jal	o_param_r2.2726
	addi	%sp, %sp, -17
	flw	%f1, 16(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 15(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 17(%sp)
	flw	%f1, 0(%sp)
	flw	%f0, 4(%sp)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%sp)
	flw	%f0, 3(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 18(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 19
	jal	o_param_r3.2728
	addi	%sp, %sp, -19
	flw	%f1, 18(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 17(%sp)
	fadd	%f0, %f0, %f1
	addi	%sp, %sp, 19
	jal	fhalf.2604
	addi	%sp, %sp, -19
	lw	%ra, 7(%sp)
	flw	%f1, 13(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
bnei_else.9089:
	lw	%ra, 7(%sp)
	flw	%f0, 13(%sp)
	jr	%ra
solver_second.2818:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%ra, 5(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 6(%sp)
	flw	%f1, 1(%v1)
	fsw	%f1, 7(%sp)
	flw	%f2, 2(%v1)
	fsw	%f2, 8(%sp)
	addi	%sp, %sp, 9
	jal	quadratic.2805
	addi	%sp, %sp, -9
	fmov	%f6, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 9
	jal	fiszero.2599
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.9173
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.9173:
	flw	%f5, 2(%sp)
	flw	%f4, 1(%sp)
	flw	%f3, 0(%sp)
	flw	%f2, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 6(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	bilinear.2810
	addi	%sp, %sp, -9
	fsw	%f0, 9(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 10
	jal	quadratic.2805
	addi	%sp, %sp, -10
	fsw	%f0, 10(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 11
	jal	o_form.2692
	addi	%sp, %sp, -11
	beqi	%v0, 3, bnei_else.9174
	flw	%f0, 10(%sp)
	j	bnei_cont.9175
bnei_else.9174:
	flw	%f1, 477(%zero)
	flw	%f0, 10(%sp)
	fsub	%f0, %f0, %f1
bnei_cont.9175:
	fsw	%f0, 11(%sp)
	flw	%f0, 9(%sp)
	addi	%sp, %sp, 12
	jal	fsqr.2606
	addi	%sp, %sp, -12
	flw	%f1, 11(%sp)
	fmul	%f1, %f6, %f1
	fsub	%f0, %f0, %f1
	fsw	%f0, 12(%sp)
	addi	%sp, %sp, 13
	jal	fispos.2595
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.9176
	flw	%f0, 12(%sp)
	fsqrt	%f0, %f0
	fsw	%f0, 13(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 14
	jal	o_isinvert.2696
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.9177
	flw	%f0, 13(%sp)
	j	bnei_cont.9178
bnei_else.9177:
	flw	%f0, 13(%sp)
	fneg	%f0, %f0
bnei_cont.9178:
	flw	%f1, 9(%sp)
	fsub	%f0, %f0, %f1
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.9176:
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver.2824:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%v0, 12(%v0)
	sw	%v0, 3(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2708
	addi	%sp, %sp, -5
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 5(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 6(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 7
	jal	o_param_y.2710
	addi	%sp, %sp, -7
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 7(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 8(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	o_param_z.2712
	addi	%sp, %sp, -9
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 9(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 10
	jal	o_form.2692
	addi	%sp, %sp, -10
	beqi	%v0, 1, bnei_else.9245
	beqi	%v0, 2, bnei_else.9246
	lw	%ra, 2(%sp)
	flw	%f2, 9(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%v0, 3(%sp)
	j	solver_second.2818
bnei_else.9246:
	lw	%ra, 2(%sp)
	flw	%f2, 9(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%v0, 3(%sp)
	j	solver_surface.2799
bnei_else.9245:
	lw	%ra, 2(%sp)
	flw	%f2, 9(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%v0, 3(%sp)
	j	solver_rect.2793
solver_rect_fast.2828:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	flw	%f16, 0(%a0)
	fsub	%f16, %f16, %f0
	flw	%f0, 1(%a0)
	fsw	%f0, 7(%sp)
	fmul	%f16, %f16, %f0
	fsw	%f16, 8(%sp)
	flw	%f0, 1(%v1)
	fsw	%f0, 9(%sp)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fsw	%f0, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_param_b.2702
	addi	%sp, %sp, -11
	fmov	%f1, %f0
	fsw	%f1, 11(%sp)
	flw	%f0, 10(%sp)
	addi	%sp, %sp, 12
	jal	fless.2592
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.9394
	lw	%a0, 4(%sp)
	flw	%f1, 2(%a0)
	flw	%f0, 8(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 2(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	fsw	%f0, 12(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 13
	jal	o_param_c.2704
	addi	%sp, %sp, -13
	fmov	%f1, %f0
	flw	%f0, 12(%sp)
	addi	%sp, %sp, 13
	jal	fless.2592
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.9396
	flw	%f0, 7(%sp)
	addi	%sp, %sp, 13
	jal	fiszero.2599
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.9398
	addi	%a0, %zero, 0
	j	bnei_cont.9395
bnei_else.9398:
	addi	%a0, %zero, 1
bnei_cont.9399:
	j	bnei_cont.9395
bnei_else.9396:
	addi	%a0, %zero, 0
bnei_cont.9397:
	j	bnei_cont.9395
bnei_else.9394:
	addi	%a0, %zero, 0
bnei_cont.9395:
	beqi	%a0, 0, bnei_else.9400
	flw	%f0, 8(%sp)
	fsw	%f0, 135(%zero)
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.9400:
	lw	%a0, 5(%sp)
	flw	%f1, 2(%a0)
	flw	%f0, 1(%sp)
	fsub	%f1, %f1, %f0
	flw	%f0, 3(%a0)
	fsw	%f0, 13(%sp)
	fmul	%f1, %f1, %f0
	fsw	%f1, 14(%sp)
	lw	%a0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 15(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 0(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	fsw	%f0, 16(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 17
	jal	o_param_a.2700
	addi	%sp, %sp, -17
	fmov	%f1, %f0
	fsw	%f1, 17(%sp)
	flw	%f0, 16(%sp)
	addi	%sp, %sp, 18
	jal	fless.2592
	addi	%sp, %sp, -18
	beqi	%v0, 0, bnei_else.9401
	lw	%a0, 4(%sp)
	flw	%f1, 2(%a0)
	flw	%f0, 14(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 2(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	fsw	%f0, 18(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 19
	jal	o_param_c.2704
	addi	%sp, %sp, -19
	fmov	%f1, %f0
	flw	%f0, 18(%sp)
	addi	%sp, %sp, 19
	jal	fless.2592
	addi	%sp, %sp, -19
	beqi	%v0, 0, bnei_else.9403
	flw	%f0, 13(%sp)
	addi	%sp, %sp, 19
	jal	fiszero.2599
	addi	%sp, %sp, -19
	beqi	%v0, 0, bnei_else.9405
	addi	%a0, %zero, 0
	j	bnei_cont.9402
bnei_else.9405:
	addi	%a0, %zero, 1
bnei_cont.9406:
	j	bnei_cont.9402
bnei_else.9403:
	addi	%a0, %zero, 0
bnei_cont.9404:
	j	bnei_cont.9402
bnei_else.9401:
	addi	%a0, %zero, 0
bnei_cont.9402:
	beqi	%a0, 0, bnei_else.9407
	flw	%f0, 14(%sp)
	fsw	%f0, 135(%zero)
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.9407:
	lw	%a0, 5(%sp)
	flw	%f1, 4(%a0)
	flw	%f0, 2(%sp)
	fsub	%f1, %f1, %f0
	flw	%f0, 5(%a0)
	fsw	%f0, 19(%sp)
	fmul	%f1, %f1, %f0
	fsw	%f1, 20(%sp)
	flw	%f0, 15(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 0(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 17(%sp)
	addi	%sp, %sp, 21
	jal	fless.2592
	addi	%sp, %sp, -21
	beqi	%v0, 0, bnei_else.9408
	flw	%f1, 20(%sp)
	flw	%f0, 9(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 1(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 11(%sp)
	addi	%sp, %sp, 21
	jal	fless.2592
	addi	%sp, %sp, -21
	beqi	%v0, 0, bnei_else.9410
	flw	%f0, 19(%sp)
	addi	%sp, %sp, 21
	jal	fiszero.2599
	addi	%sp, %sp, -21
	beqi	%v0, 0, bnei_else.9412
	addi	%a0, %zero, 0
	j	bnei_cont.9409
bnei_else.9412:
	addi	%a0, %zero, 1
bnei_cont.9413:
	j	bnei_cont.9409
bnei_else.9410:
	addi	%a0, %zero, 0
bnei_cont.9411:
	j	bnei_cont.9409
bnei_else.9408:
	addi	%a0, %zero, 0
bnei_cont.9409:
	beqi	%a0, 0, bnei_else.9414
	flw	%f0, 20(%sp)
	fsw	%f0, 135(%zero)
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.9414:
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_surface_fast.2835:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%ra, 4(%sp)
	flw	%f0, 0(%v1)
	addi	%sp, %sp, 5
	jal	fisneg.2597
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.9450
	lw	%a0, 3(%sp)
	flw	%f1, 1(%a0)
	flw	%f0, 0(%sp)
	fmul	%f16, %f1, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 1(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 3(%a0)
	flw	%f0, 2(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 135(%zero)
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.9450:
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2841:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	fsw	%f7, 5(%sp)
	fsw	%f6, 6(%sp)
	sw	%ra, 7(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 8(%sp)
	addi	%sp, %sp, 9
	jal	fiszero.2599
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.9521
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.9521:
	lw	%a0, 4(%sp)
	flw	%f1, 1(%a0)
	flw	%f0, 0(%sp)
	fmul	%f17, %f1, %f0
	flw	%f16, 2(%a0)
	flw	%f1, 1(%sp)
	fmul	%f16, %f16, %f1
	fadd	%f17, %f17, %f16
	flw	%f16, 3(%a0)
	flw	%f2, 2(%sp)
	fmul	%f16, %f16, %f2
	fadd	%f6, %f17, %f16
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	quadratic.2805
	addi	%sp, %sp, -9
	fmov	%f7, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	o_form.2692
	addi	%sp, %sp, -9
	beqi	%v0, 3, bnei_else.9522
	j	bnei_cont.9523
bnei_else.9522:
	flw	%f0, 477(%zero)
	fsub	%f7, %f7, %f0
bnei_cont.9523:
	fmov	%f0, %f6
	addi	%sp, %sp, 9
	jal	fsqr.2606
	addi	%sp, %sp, -9
	flw	%f1, 8(%sp)
	fmul	%f1, %f1, %f7
	fsub	%f7, %f0, %f1
	fmov	%f0, %f7
	addi	%sp, %sp, 9
	jal	fispos.2595
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.9524
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	o_isinvert.2696
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.9525
	fsqrt	%f0, %f7
	fadd	%f1, %f6, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.9526
bnei_else.9525:
	fsqrt	%f0, %f7
	fsub	%f1, %f6, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.9526:
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.9524:
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_fast.2847:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%v0, 12(%v0)
	sw	%v0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_x.2708
	addi	%sp, %sp, -6
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 6(%sp)
	lw	%a0, 2(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 7(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 8
	jal	o_param_y.2710
	addi	%sp, %sp, -8
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 8(%sp)
	lw	%a0, 2(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 9(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 10
	jal	o_param_z.2712
	addi	%sp, %sp, -10
	flw	%f1, 9(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 10(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 11
	jal	d_const.2753
	addi	%sp, %sp, -11
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	lw	%a0, 0(%at)
	sw	%a0, 11(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 12
	jal	o_form.2692
	addi	%sp, %sp, -12
	beqi	%v0, 1, bnei_else.9598
	beqi	%v0, 2, bnei_else.9599
	lw	%ra, 3(%sp)
	flw	%f2, 10(%sp)
	flw	%f1, 8(%sp)
	flw	%f0, 6(%sp)
	lw	%v1, 11(%sp)
	lw	%v0, 4(%sp)
	j	solver_second_fast.2841
bnei_else.9599:
	lw	%ra, 3(%sp)
	flw	%f2, 10(%sp)
	flw	%f1, 8(%sp)
	flw	%f0, 6(%sp)
	lw	%v1, 11(%sp)
	lw	%v0, 4(%sp)
	j	solver_surface_fast.2835
bnei_else.9598:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	d_vec.2751
	addi	%sp, %sp, -12
	addi	%v1, %v0, 0
	lw	%ra, 3(%sp)
	flw	%f2, 10(%sp)
	flw	%f1, 8(%sp)
	flw	%f0, 6(%sp)
	lw	%a0, 11(%sp)
	lw	%v0, 4(%sp)
	j	solver_rect_fast.2828
solver_surface_fast2.2851:
	sw	%a0, 0(%sp)
	fsw	%f6, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f6, 0(%v1)
	fmov	%f0, %f6
	addi	%sp, %sp, 3
	jal	fisneg.2597
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.9632
	lw	%a0, 0(%sp)
	flw	%f0, 3(%a0)
	fmul	%f0, %f6, %f0
	fsw	%f0, 135(%zero)
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.9632:
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2858:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	fsw	%f7, 6(%sp)
	fsw	%f6, 7(%sp)
	sw	%ra, 8(%sp)
	flw	%f6, 0(%v1)
	fmov	%f0, %f6
	addi	%sp, %sp, 9
	jal	fiszero.2599
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.9697
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.9697:
	lw	%a0, 4(%sp)
	flw	%f1, 1(%a0)
	flw	%f0, 0(%sp)
	fmul	%f16, %f1, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 1(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 3(%a0)
	flw	%f0, 2(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f7, %f16, %f0
	lw	%a0, 5(%sp)
	flw	%f0, 3(%a0)
	fsw	%f0, 9(%sp)
	fmov	%f0, %f7
	addi	%sp, %sp, 10
	jal	fsqr.2606
	addi	%sp, %sp, -10
	flw	%f1, 9(%sp)
	fmul	%f1, %f6, %f1
	fsub	%f6, %f0, %f1
	fmov	%f0, %f6
	addi	%sp, %sp, 10
	jal	fispos.2595
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.9698
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 10
	jal	o_isinvert.2696
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.9699
	fsqrt	%f0, %f6
	fadd	%f1, %f7, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.9700
bnei_else.9699:
	fsqrt	%f0, %f6
	fsub	%f1, %f7, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.9700:
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.9698:
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2865:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%v0, 12(%v0)
	sw	%v0, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_param_ctbl.2730
	addi	%sp, %sp, -4
	sw	%v0, 4(%sp)
	flw	%f0, 0(%v0)
	fsw	%f0, 5(%sp)
	flw	%f0, 1(%v0)
	fsw	%f0, 6(%sp)
	flw	%f0, 2(%v0)
	fsw	%f0, 7(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 8
	jal	d_const.2753
	addi	%sp, %sp, -8
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	lw	%a0, 0(%at)
	sw	%a0, 8(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	o_form.2692
	addi	%sp, %sp, -9
	beqi	%v0, 1, bnei_else.9764
	beqi	%v0, 2, bnei_else.9765
	lw	%ra, 2(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%v1, 8(%sp)
	lw	%v0, 3(%sp)
	j	solver_second_fast2.2858
bnei_else.9765:
	lw	%ra, 2(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%v1, 8(%sp)
	lw	%v0, 3(%sp)
	j	solver_surface_fast2.2851
bnei_else.9764:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 9
	jal	d_vec.2751
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0
	lw	%ra, 2(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%a0, 8(%sp)
	lw	%v0, 3(%sp)
	j	solver_rect_fast.2828
setup_rect_table.2868:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f7, 2(%sp)
	fsw	%f6, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %zero, 6
	flw	%f6, 482(%zero)
	fmov	%f0, %f6
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%a0, 0(%sp)
	flw	%f7, 0(%a0)
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.9829
	lw	%a0, 6(%sp)
	fsw	%f6, 1(%a0)
	j	bnei_cont.9830
bnei_else.9829:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2696
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fisneg.2597
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	xor.2601
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_a.2700
	addi	%sp, %sp, -7
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	fneg_cond.2638
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f7
	fsw	%f0, 1(%a0)
bnei_cont.9830:
	lw	%a0, 0(%sp)
	flw	%f7, 1(%a0)
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.9831
	lw	%a0, 6(%sp)
	fsw	%f6, 3(%a0)
	j	bnei_cont.9832
bnei_else.9831:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2696
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fisneg.2597
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	xor.2601
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_b.2702
	addi	%sp, %sp, -7
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	fneg_cond.2638
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	fsw	%f0, 2(%a0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f7
	fsw	%f0, 3(%a0)
bnei_cont.9832:
	lw	%a0, 0(%sp)
	flw	%f7, 2(%a0)
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.9833
	lw	%a0, 6(%sp)
	fsw	%f6, 5(%a0)
	j	bnei_cont.9834
bnei_else.9833:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2696
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fisneg.2597
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	xor.2601
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2704
	addi	%sp, %sp, -7
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	fneg_cond.2638
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	fsw	%f0, 4(%a0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f7
	fsw	%f0, 5(%a0)
bnei_cont.9834:
	flw	%f7, 2(%sp)
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v0, 6(%sp)
	jr	%ra
setup_surface_table.2871:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f11, 2(%sp)
	fsw	%f10, 3(%sp)
	fsw	%f9, 4(%sp)
	fsw	%f8, 5(%sp)
	fsw	%f7, 6(%sp)
	fsw	%f6, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%v0, %zero, 4
	flw	%f10, 482(%zero)
	fmov	%f0, %f10
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	sw	%v0, 9(%sp)
	lw	%a0, 0(%sp)
	flw	%f6, 0(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	o_param_a.2700
	addi	%sp, %sp, -10
	fmov	%f11, %f0
	fmul	%f8, %f6, %f11
	lw	%a0, 0(%sp)
	flw	%f7, 1(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	o_param_b.2702
	addi	%sp, %sp, -10
	fmov	%f6, %f0
	fmul	%f0, %f7, %f6
	fadd	%f8, %f8, %f0
	lw	%a0, 0(%sp)
	flw	%f9, 2(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2704
	addi	%sp, %sp, -10
	fmov	%f7, %f0
	fmul	%f0, %f9, %f7
	fadd	%f8, %f8, %f0
	fmov	%f0, %f8
	addi	%sp, %sp, 10
	jal	fispos.2595
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.9885
	flw	%f0, 461(%zero)
	fdiv	%f0, %f0, %f8
	lw	%a0, 9(%sp)
	fsw	%f0, 0(%a0)
	fdiv	%f0, %f11, %f8
	fneg	%f0, %f0
	fsw	%f0, 1(%a0)
	fdiv	%f0, %f6, %f8
	fneg	%f0, %f0
	fsw	%f0, 2(%a0)
	fdiv	%f0, %f7, %f8
	fneg	%f0, %f0
	fsw	%f0, 3(%a0)
	j	bnei_cont.9886
bnei_else.9885:
	lw	%a0, 9(%sp)
	fsw	%f10, 0(%a0)
bnei_cont.9886:
	flw	%f11, 2(%sp)
	flw	%f10, 3(%sp)
	flw	%f9, 4(%sp)
	flw	%f8, 5(%sp)
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	lw	%v0, 9(%sp)
	jr	%ra
setup_second_table.2874:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f15, 2(%sp)
	fsw	%f14, 3(%sp)
	fsw	%f13, 4(%sp)
	fsw	%f12, 5(%sp)
	fsw	%f11, 6(%sp)
	fsw	%f10, 7(%sp)
	fsw	%f9, 8(%sp)
	fsw	%f8, 9(%sp)
	fsw	%f7, 10(%sp)
	fsw	%f6, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%v0, %zero, 5
	flw	%f0, 482(%zero)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	sw	%v0, 13(%sp)
	lw	%a0, 0(%sp)
	flw	%f12, 0(%a0)
	flw	%f11, 1(%a0)
	flw	%f10, 2(%a0)
	lw	%v0, 1(%sp)
	fmov	%f2, %f10
	fmov	%f1, %f11
	fmov	%f0, %f12
	addi	%sp, %sp, 14
	jal	quadratic.2805
	addi	%sp, %sp, -14
	fmov	%f13, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 14
	jal	o_param_a.2700
	addi	%sp, %sp, -14
	fmul	%f0, %f12, %f0
	fneg	%f6, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 14
	jal	o_param_b.2702
	addi	%sp, %sp, -14
	fmul	%f0, %f11, %f0
	fneg	%f7, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 14
	jal	o_param_c.2704
	addi	%sp, %sp, -14
	fmul	%f0, %f10, %f0
	fneg	%f8, %f0
	lw	%a0, 13(%sp)
	fsw	%f13, 0(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 14
	jal	o_isrot.2698
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.9958
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r2.2726
	addi	%sp, %sp, -14
	fmov	%f14, %f0
	fmul	%f9, %f10, %f14
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r3.2728
	addi	%sp, %sp, -14
	fmov	%f15, %f0
	fmul	%f0, %f11, %f15
	fadd	%f0, %f9, %f0
	addi	%sp, %sp, 14
	jal	fhalf.2604
	addi	%sp, %sp, -14
	fsub	%f0, %f6, %f0
	lw	%a0, 13(%sp)
	fsw	%f0, 1(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r1.2724
	addi	%sp, %sp, -14
	fmov	%f6, %f0
	fmul	%f1, %f10, %f6
	fmul	%f0, %f12, %f15
	fadd	%f0, %f1, %f0
	addi	%sp, %sp, 14
	jal	fhalf.2604
	addi	%sp, %sp, -14
	fsub	%f0, %f7, %f0
	lw	%a0, 13(%sp)
	fsw	%f0, 2(%a0)
	fmul	%f1, %f11, %f6
	fmul	%f0, %f12, %f14
	fadd	%f0, %f1, %f0
	addi	%sp, %sp, 14
	jal	fhalf.2604
	addi	%sp, %sp, -14
	fsub	%f0, %f8, %f0
	lw	%a0, 13(%sp)
	fsw	%f0, 3(%a0)
	j	bnei_cont.9959
bnei_else.9958:
	lw	%a0, 13(%sp)
	fsw	%f6, 1(%a0)
	fsw	%f7, 2(%a0)
	fsw	%f8, 3(%a0)
bnei_cont.9959:
	fmov	%f0, %f13
	addi	%sp, %sp, 14
	jal	fiszero.2599
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.9960
	j	bnei_cont.9961
bnei_else.9960:
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f13
	lw	%a0, 13(%sp)
	fsw	%f0, 4(%a0)
bnei_cont.9961:
	flw	%f15, 2(%sp)
	flw	%f14, 3(%sp)
	flw	%f13, 4(%sp)
	flw	%f12, 5(%sp)
	flw	%f11, 6(%sp)
	flw	%f10, 7(%sp)
	flw	%f9, 8(%sp)
	flw	%f8, 9(%sp)
	flw	%f7, 10(%sp)
	flw	%f6, 11(%sp)
	lw	%ra, 12(%sp)
	lw	%v0, 13(%sp)
	jr	%ra
iter_setup_dirvec_constants.2877:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t2, 2(%sp)
	sw	%t1, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	blti	%v1, 0, bgti_else.10016
	lw	%t1, 12(%v1)
	addi	%sp, %sp, 6
	jal	d_const.2753
	addi	%sp, %sp, -6
	addi	%t0, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	d_vec.2751
	addi	%sp, %sp, -6
	addi	%t2, %v0, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 6
	jal	o_form.2692
	addi	%sp, %sp, -6
	beqi	%v0, 1, bnei_else.10017
	beqi	%v0, 2, bnei_else.10019
	addi	%v1, %t1, 0
	addi	%v0, %t2, 0
	addi	%sp, %sp, 6
	jal	setup_second_table.2874
	addi	%sp, %sp, -6
	lw	%a0, 1(%sp)
	add	%at, %t0, %a0
	sw	%v0, 0(%at)
	j	bnei_cont.10018
bnei_else.10019:
	addi	%v1, %t1, 0
	addi	%v0, %t2, 0
	addi	%sp, %sp, 6
	jal	setup_surface_table.2871
	addi	%sp, %sp, -6
	lw	%a0, 1(%sp)
	add	%at, %t0, %a0
	sw	%v0, 0(%at)
bnei_cont.10020:
	j	bnei_cont.10018
bnei_else.10017:
	addi	%v1, %t1, 0
	addi	%v0, %t2, 0
	addi	%sp, %sp, 6
	jal	setup_rect_table.2868
	addi	%sp, %sp, -6
	lw	%a0, 1(%sp)
	add	%at, %t0, %a0
	sw	%v0, 0(%at)
bnei_cont.10018:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, -1
	lw	%t2, 2(%sp)
	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2877
bgti_else.10016:
	jr	%ra
setup_dirvec_constants.2880:
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	j	iter_setup_dirvec_constants.2877
setup_startp_constants.2882:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t2, 2(%sp)
	sw	%t1, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	blti	%v1, 0, bgti_else.10105
	lw	%t0, 12(%v1)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 6
	jal	o_param_ctbl.2730
	addi	%sp, %sp, -6
	addi	%t1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 6
	jal	o_form.2692
	addi	%sp, %sp, -6
	addi	%t2, %v0, 0
	lw	%a0, 0(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 6(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	o_param_x.2708
	addi	%sp, %sp, -7
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 0(%t1)
	lw	%a0, 0(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 7(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 8
	jal	o_param_y.2710
	addi	%sp, %sp, -8
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 1(%t1)
	lw	%a0, 0(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 8(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	o_param_z.2712
	addi	%sp, %sp, -9
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 2(%t1)
	beqi	%t2, 2, bnei_else.10106
	addi	%at, %zero, 2
	blt	%at, %t2, bgt_else.10108
	j	bnei_cont.10107
bgt_else.10108:
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	quadratic.2805
	addi	%sp, %sp, -9
	beqi	%t2, 3, bnei_else.10110
	j	bnei_cont.10111
bnei_else.10110:
	flw	%f1, 477(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.10111:
	fsw	%f0, 3(%t1)
bgt_cont.10109:
	j	bnei_cont.10107
bnei_else.10106:
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	o_param_abc.2706
	addi	%sp, %sp, -9
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	addi	%sp, %sp, 9
	jal	veciprod2.2668
	addi	%sp, %sp, -9
	fsw	%f0, 3(%t1)
bnei_cont.10107:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, -1
	lw	%t2, 2(%sp)
	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2882
bgti_else.10105:
	jr	%ra
setup_startp.2885:
	add	%v1, %zero, %v0
	sw	%v1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 162
	addi	%sp, %sp, 2
	jal	veccpy.2654
	addi	%sp, %sp, -2
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2882
is_rect_outside.2887:
	fsw	%f1, 0(%sp)
	fsw	%f2, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	fabs	%f0, %f0
	fsw	%f0, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_a.2700
	addi	%sp, %sp, -5
	fmov	%f1, %f0
	flw	%f0, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.10196
	flw	%f0, 0(%sp)
	fabs	%f0, %f0
	fsw	%f0, 5(%sp)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 6
	jal	o_param_b.2702
	addi	%sp, %sp, -6
	fmov	%f1, %f0
	flw	%f0, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.10198
	flw	%f0, 1(%sp)
	fabs	%f0, %f0
	fsw	%f0, 6(%sp)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2704
	addi	%sp, %sp, -7
	fmov	%f1, %f0
	flw	%f0, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2592
	addi	%sp, %sp, -7
	j	bnei_cont.10197
bnei_else.10198:
	addi	%v0, %zero, 0
bnei_cont.10199:
	j	bnei_cont.10197
bnei_else.10196:
	addi	%v0, %zero, 0
bnei_cont.10197:
	beqi	%v0, 0, bnei_else.10200
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	j	o_isinvert.2696
bnei_else.10200:
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2696
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.10201
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.10201:
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 1
	jr	%ra
is_plane_outside.2892:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_abc.2706
	addi	%sp, %sp, -5
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 5
	jal	veciprod2.2668
	addi	%sp, %sp, -5
	fsw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2696
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	flw	%f0, 5(%sp)
	addi	%sp, %sp, 7
	jal	fisneg.2597
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 7
	jal	xor.2601
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.10241
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.10241:
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 1
	jr	%ra
is_second_outside.2897:
	sw	%v0, 0(%sp)
	fsw	%f6, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	quadratic.2805
	addi	%sp, %sp, -3
	fmov	%f6, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2692
	addi	%sp, %sp, -3
	beqi	%v0, 3, bnei_else.10283
	j	bnei_cont.10284
bnei_else.10283:
	flw	%f0, 477(%zero)
	fsub	%f6, %f6, %f0
bnei_cont.10284:
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	o_isinvert.2696
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	fmov	%f0, %f6
	addi	%sp, %sp, 4
	jal	fisneg.2597
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 4
	jal	xor.2601
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.10285
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.10285:
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
is_outside.2902:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2708
	addi	%sp, %sp, -5
	flw	%f1, 0(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 6
	jal	o_param_y.2710
	addi	%sp, %sp, -6
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 6(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 7
	jal	o_param_z.2712
	addi	%sp, %sp, -7
	flw	%f1, 2(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 7(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 8
	jal	o_form.2692
	addi	%sp, %sp, -8
	beqi	%v0, 1, bnei_else.10345
	beqi	%v0, 2, bnei_else.10346
	lw	%ra, 4(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	j	is_second_outside.2897
bnei_else.10346:
	lw	%ra, 4(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	j	is_plane_outside.2892
bnei_else.10345:
	lw	%ra, 4(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	j	is_rect_outside.2887
check_all_inside.2907:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.10390
	lw	%v0, 12(%a0)
	addi	%sp, %sp, 6
	jal	is_outside.2902
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.10391
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.10391:
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 5(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 4(%sp)
	j	check_all_inside.2907
bnei_else.10390:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2913:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	sw	%v0, 3(%sp)
	beqi	%v0, -1, bnei_else.10458
	addi	%a0, %zero, 138
	addi	%v1, %zero, 247
	addi	%sp, %sp, 4
	jal	solver_fast.2847
	addi	%sp, %sp, -4
	addi	%a0, %zero, 0
	sw	%a0, 4(%sp)
	flw	%f0, 135(%zero)
	fsw	%f0, 5(%sp)
	beqi	%v0, 0, bnei_else.10459
	flw	%f1, 457(%zero)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	j	bnei_cont.10460
bnei_else.10459:
	addi	%v0, %zero, 0
bnei_cont.10460:
	beqi	%v0, 0, bnei_else.10461
	flw	%f1, 456(%zero)
	flw	%f0, 5(%sp)
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
	lw	%v1, 1(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	check_all_inside.2907
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.10462
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.10462:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_and_group.2913
bnei_else.10461:
	lw	%a0, 3(%sp)
	lw	%v0, 12(%a0)
	addi	%sp, %sp, 6
	jal	o_isinvert.2696
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.10463
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_and_group.2913
bnei_else.10463:
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.10458:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2916:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.10501
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.10502
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.10502:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2916
bnei_else.10501:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2919:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	sw	%a0, 3(%sp)
	lw	%v0, 0(%a0)
	beqi	%v0, -1, bnei_else.10576
	beqi	%v0, 99, bnei_else.10577
	addi	%a0, %zero, 138
	addi	%v1, %zero, 247
	addi	%sp, %sp, 4
	jal	solver_fast.2847
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.10579
	flw	%f0, 135(%zero)
	flw	%f1, 455(%zero)
	addi	%sp, %sp, 4
	jal	fless.2592
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.10581
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.10583
	addi	%a0, %zero, 1
	j	bnei_cont.10578
bnei_else.10583:
	addi	%a0, %zero, 0
bnei_cont.10584:
	j	bnei_cont.10578
bnei_else.10581:
	addi	%a0, %zero, 0
bnei_cont.10582:
	j	bnei_cont.10578
bnei_else.10579:
	addi	%a0, %zero, 0
bnei_cont.10580:
	j	bnei_cont.10578
bnei_else.10577:
	addi	%a0, %zero, 1
bnei_cont.10578:
	beqi	%a0, 0, bnei_else.10585
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.10586
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.10586:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.10585:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.10576:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2922:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	add	%v1, %zero, %a0
	sw	%v1, 2(%sp)
	fsw	%f6, 3(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 4(%sp)
	sw	%ra, 5(%sp)
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	beqi	%t0, -1, bnei_else.10678
	addi	%a0, %zero, 159
	addi	%v0, %t0, 0
	addi	%sp, %sp, 6
	jal	solver.2824
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 7(%sp)
	beqi	%v0, 0, bnei_else.10679
	flw	%f6, 135(%zero)
	flw	%f0, 482(%zero)
	fmov	%f1, %f6
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.10680
	flw	%f1, 137(%zero)
	fmov	%f0, %f6
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.10682
	flw	%f0, 456(%zero)
	fadd	%f6, %f6, %f0
	lw	%a0, 2(%sp)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f6
	flw	%f0, 159(%zero)
	fadd	%f0, %f1, %f0
	fsw	%f0, 8(%sp)
	flw	%f1, 1(%a0)
	fmul	%f16, %f1, %f6
	flw	%f1, 160(%zero)
	fadd	%f1, %f16, %f1
	fsw	%f1, 9(%sp)
	flw	%f16, 2(%a0)
	fmul	%f17, %f16, %f6
	flw	%f16, 161(%zero)
	fadd	%f2, %f17, %f16
	fsw	%f2, 10(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 7(%sp)
	addi	%sp, %sp, 11
	jal	check_all_inside.2907
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.10684
	fsw	%f6, 137(%zero)
	addi	%v0, %zero, 138
	flw	%f2, 10(%sp)
	flw	%f1, 9(%sp)
	flw	%f0, 8(%sp)
	addi	%sp, %sp, 11
	jal	vecset.2644
	addi	%sp, %sp, -11
	sw	%t0, 141(%zero)
	lw	%a0, 6(%sp)
	sw	%a0, 136(%zero)
	j	bnei_cont.10681
bnei_else.10684:
bnei_cont.10685:
	j	bnei_cont.10681
bnei_else.10682:
bnei_cont.10683:
	j	bnei_cont.10681
bnei_else.10680:
bnei_cont.10681:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_each_element.2922
bnei_else.10679:
	lw	%v0, 12(%t0)
	addi	%sp, %sp, 11
	jal	o_isinvert.2696
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.10686
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_each_element.2922
bnei_else.10686:
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.10678:
	add	%t0, %zero, %a0
	jr	%ra
solve_one_or_network.2926:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.10723
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
bnei_else.10723:
	jr	%ra
trace_or_matrix.2930:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	add	%v1, %zero, %a0
	sw	%v1, 2(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 3(%sp)
	sw	%ra, 4(%sp)
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	lw	%v0, 0(%t0)
	beqi	%v0, -1, bnei_else.10780
	beqi	%v0, 99, bnei_else.10781
	addi	%a0, %zero, 159
	addi	%sp, %sp, 5
	jal	solver.2824
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.10783
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.10785
	addi	%v0, %zero, 1
	lw	%a0, 2(%sp)
	addi	%v1, %t0, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -5
	j	bnei_cont.10782
bnei_else.10785:
bnei_cont.10786:
	j	bnei_cont.10782
bnei_else.10783:
bnei_cont.10784:
	j	bnei_cont.10782
bnei_else.10781:
	addi	%v0, %zero, 1
	addi	%a0, %v1, 0
	addi	%v1, %t0, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -5
bnei_cont.10782:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix.2930
bnei_else.10780:
	add	%t0, %zero, %a0
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
	flw	%f1, 137(%zero)
	fsw	%f1, 1(%sp)
	flw	%f0, 455(%zero)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.10817
	flw	%f1, 453(%zero)
	lw	%ra, 0(%sp)
	flw	%f0, 1(%sp)
	j	fless.2592
bnei_else.10817:
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element_fast.2936:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 2(%sp)
	fsw	%f6, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	d_vec.2751
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%a1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%t0, 0(%at)
	beqi	%t0, -1, bnei_else.10916
	lw	%v1, 2(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	solver_fast2.2865
	addi	%sp, %sp, -7
	sw	%v0, 7(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 8(%sp)
	beqi	%v0, 0, bnei_else.10917
	flw	%f6, 135(%zero)
	flw	%f0, 482(%zero)
	fmov	%f1, %f6
	addi	%sp, %sp, 9
	jal	fless.2592
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.10918
	flw	%f1, 137(%zero)
	fmov	%f0, %f6
	addi	%sp, %sp, 9
	jal	fless.2592
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.10920
	flw	%f0, 456(%zero)
	fadd	%f6, %f6, %f0
	lw	%a0, 6(%sp)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f6
	flw	%f0, 162(%zero)
	fadd	%f0, %f1, %f0
	fsw	%f0, 9(%sp)
	flw	%f1, 1(%a0)
	fmul	%f16, %f1, %f6
	flw	%f1, 163(%zero)
	fadd	%f1, %f16, %f1
	fsw	%f1, 10(%sp)
	flw	%f16, 2(%a0)
	fmul	%f17, %f16, %f6
	flw	%f16, 164(%zero)
	fadd	%f2, %f17, %f16
	fsw	%f2, 11(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 8(%sp)
	addi	%sp, %sp, 12
	jal	check_all_inside.2907
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.10922
	fsw	%f6, 137(%zero)
	addi	%v0, %zero, 138
	flw	%f2, 11(%sp)
	flw	%f1, 10(%sp)
	flw	%f0, 9(%sp)
	addi	%sp, %sp, 12
	jal	vecset.2644
	addi	%sp, %sp, -12
	sw	%t0, 141(%zero)
	lw	%a0, 7(%sp)
	sw	%a0, 136(%zero)
	j	bnei_cont.10919
bnei_else.10922:
bnei_cont.10923:
	j	bnei_cont.10919
bnei_else.10920:
bnei_cont.10921:
	j	bnei_cont.10919
bnei_else.10918:
bnei_cont.10919:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_each_element_fast.2936
bnei_else.10917:
	lw	%v0, 12(%t0)
	addi	%sp, %sp, 12
	jal	o_isinvert.2696
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.10924
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_each_element_fast.2936
bnei_else.10924:
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.10916:
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
solve_one_or_network_fast.2940:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.10961
	lw	%v1, 83(%a1)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -4
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_one_or_network_fast.2940
bnei_else.10961:
	jr	%ra
trace_or_matrix_fast.2944:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	add	%v1, %zero, %a0
	sw	%v1, 2(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 3(%sp)
	sw	%ra, 4(%sp)
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	lw	%v0, 0(%t0)
	beqi	%v0, -1, bnei_else.11018
	beqi	%v0, 99, bnei_else.11019
	addi	%sp, %sp, 5
	jal	solver_fast2.2865
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.11021
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.11023
	addi	%v0, %zero, 1
	lw	%a0, 2(%sp)
	addi	%v1, %t0, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -5
	j	bnei_cont.11020
bnei_else.11023:
bnei_cont.11024:
	j	bnei_cont.11020
bnei_else.11021:
bnei_cont.11022:
	j	bnei_cont.11020
bnei_else.11019:
	addi	%v0, %zero, 1
	addi	%a0, %v1, 0
	addi	%v1, %t0, 0
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -5
bnei_cont.11020:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix_fast.2944
bnei_else.11018:
	add	%t0, %zero, %a0
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
	flw	%f1, 137(%zero)
	fsw	%f1, 1(%sp)
	flw	%f0, 455(%zero)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.11055
	flw	%f1, 453(%zero)
	lw	%ra, 0(%sp)
	flw	%f0, 1(%sp)
	j	fless.2592
bnei_else.11055:
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_rect.2950:
	sw	%v0, 0(%sp)
	sw	%t5, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%t5, 136(%zero)
	addi	%v0, %zero, 142
	addi	%sp, %sp, 3
	jal	vecbzero.2652
	addi	%sp, %sp, -3
	addi	%a1, %t5, -1
	sw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	addi	%sp, %sp, 4
	jal	sgn.2636
	addi	%sp, %sp, -4
	fneg	%f0, %f0
	lw	%t5, 1(%sp)
	lw	%ra, 2(%sp)
	lw	%a0, 3(%sp)
	fsw	%f0, 142(%a0)
	jr	%ra
get_nvector_plane.2952:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	o_param_a.2700
	addi	%sp, %sp, -2
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 2
	jal	o_param_b.2702
	addi	%sp, %sp, -2
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 2
	jal	o_param_c.2704
	addi	%sp, %sp, -2
	fneg	%f0, %f0
	lw	%ra, 1(%sp)
	fsw	%f0, 144(%zero)
	jr	%ra
get_nvector_second.2954:
	sw	%v0, 0(%sp)
	fsw	%f14, 1(%sp)
	fsw	%f13, 2(%sp)
	fsw	%f12, 3(%sp)
	fsw	%f11, 4(%sp)
	fsw	%f10, 5(%sp)
	fsw	%f9, 6(%sp)
	fsw	%f8, 7(%sp)
	fsw	%f7, 8(%sp)
	fsw	%f6, 9(%sp)
	sw	%ra, 10(%sp)
	flw	%f10, 138(%zero)
	addi	%sp, %sp, 11
	jal	o_param_x.2708
	addi	%sp, %sp, -11
	fsub	%f12, %f10, %f0
	flw	%f10, 139(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_y.2710
	addi	%sp, %sp, -11
	fsub	%f13, %f10, %f0
	flw	%f10, 140(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_z.2712
	addi	%sp, %sp, -11
	fsub	%f14, %f10, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_a.2700
	addi	%sp, %sp, -11
	fmul	%f6, %f12, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_b.2702
	addi	%sp, %sp, -11
	fmul	%f7, %f13, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_c.2704
	addi	%sp, %sp, -11
	fmul	%f8, %f14, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2698
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.11166
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_r3.2728
	addi	%sp, %sp, -11
	fmov	%f10, %f0
	fmul	%f9, %f13, %f10
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_r2.2726
	addi	%sp, %sp, -11
	fmov	%f11, %f0
	fmul	%f0, %f14, %f11
	fadd	%f0, %f9, %f0
	addi	%sp, %sp, 11
	jal	fhalf.2604
	addi	%sp, %sp, -11
	fadd	%f0, %f6, %f0
	fsw	%f0, 142(%zero)
	fmul	%f6, %f12, %f10
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_r1.2724
	addi	%sp, %sp, -11
	fmov	%f10, %f0
	fmul	%f0, %f14, %f10
	fadd	%f0, %f6, %f0
	addi	%sp, %sp, 11
	jal	fhalf.2604
	addi	%sp, %sp, -11
	fadd	%f0, %f7, %f0
	fsw	%f0, 143(%zero)
	fmul	%f1, %f12, %f11
	fmul	%f0, %f13, %f10
	fadd	%f0, %f1, %f0
	addi	%sp, %sp, 11
	jal	fhalf.2604
	addi	%sp, %sp, -11
	fadd	%f0, %f8, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.11167
bnei_else.11166:
	fsw	%f6, 142(%zero)
	fsw	%f7, 143(%zero)
	fsw	%f8, 144(%zero)
bnei_cont.11167:
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2696
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0
	addi	%v0, %zero, 142
	flw	%f14, 1(%sp)
	flw	%f13, 2(%sp)
	flw	%f12, 3(%sp)
	flw	%f11, 4(%sp)
	flw	%f10, 5(%sp)
	flw	%f9, 6(%sp)
	flw	%f8, 7(%sp)
	flw	%f7, 8(%sp)
	flw	%f6, 9(%sp)
	lw	%ra, 10(%sp)
	j	vecunit_sgn.2662
get_nvector.2956:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2692
	addi	%sp, %sp, -3
	beqi	%v0, 1, bnei_else.11207
	beqi	%v0, 2, bnei_else.11208
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	get_nvector_second.2954
bnei_else.11208:
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	get_nvector_plane.2952
bnei_else.11207:
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	j	get_nvector_rect.2950
utexture.2959:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_texturetype.2690
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	o_color_red.2718
	addi	%sp, %sp, -4
	fsw	%f0, 145(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	o_color_green.2720
	addi	%sp, %sp, -4
	fsw	%f0, 146(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	o_color_blue.2722
	addi	%sp, %sp, -4
	fsw	%f0, 147(%zero)
	lw	%a0, 3(%sp)
	beqi	%a0, 1, bnei_else.11390
	beqi	%a0, 2, bnei_else.11391
	beqi	%a0, 3, bnei_else.11392
	beqi	%a0, 4, bnei_else.11393
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.11393:
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 4(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2708
	addi	%sp, %sp, -5
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 5(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2700
	addi	%sp, %sp, -6
	fsqrt	%f1, %f0
	flw	%f0, 5(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 6(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 7(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 8
	jal	o_param_z.2712
	addi	%sp, %sp, -8
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 8(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_c.2704
	addi	%sp, %sp, -9
	fsqrt	%f1, %f0
	flw	%f0, 8(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 9(%sp)
	flw	%f0, 6(%sp)
	addi	%sp, %sp, 10
	jal	fsqr.2606
	addi	%sp, %sp, -10
	fsw	%f0, 10(%sp)
	flw	%f0, 9(%sp)
	addi	%sp, %sp, 11
	jal	fsqr.2606
	addi	%sp, %sp, -11
	flw	%f1, 10(%sp)
	fadd	%f0, %f1, %f0
	fsw	%f0, 11(%sp)
	flw	%f0, 6(%sp)
	fabs	%f0, %f0
	flw	%f1, 452(%zero)
	fsw	%f1, 12(%sp)
	addi	%sp, %sp, 13
	jal	fless.2592
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.11395
	flw	%f1, 451(%zero)
	j	bnei_cont.11396
bnei_else.11395:
	flw	%f1, 9(%sp)
	flw	%f0, 6(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	addi	%sp, %sp, 13
	jal	atan.2627
	addi	%sp, %sp, -13
	flw	%f1, 450(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.11396:
	floor	%f0, %f1
	fsub	%f0, %f1, %f0
	fsw	%f0, 13(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 14(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 15
	jal	o_param_y.2710
	addi	%sp, %sp, -15
	flw	%f1, 14(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 15(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 16
	jal	o_param_b.2702
	addi	%sp, %sp, -16
	fsqrt	%f1, %f0
	flw	%f0, 15(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 16(%sp)
	flw	%f0, 11(%sp)
	fabs	%f0, %f0
	flw	%f1, 12(%sp)
	addi	%sp, %sp, 17
	jal	fless.2592
	addi	%sp, %sp, -17
	beqi	%v0, 0, bnei_else.11397
	flw	%f1, 451(%zero)
	j	bnei_cont.11398
bnei_else.11397:
	flw	%f1, 16(%sp)
	flw	%f0, 11(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	addi	%sp, %sp, 17
	jal	atan.2627
	addi	%sp, %sp, -17
	flw	%f1, 450(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.11398:
	floor	%f0, %f1
	fsub	%f0, %f1, %f0
	fsw	%f0, 17(%sp)
	flw	%f0, 448(%zero)
	fsw	%f0, 18(%sp)
	flw	%f1, 481(%zero)
	fsw	%f1, 19(%sp)
	flw	%f0, 13(%sp)
	fsub	%f0, %f1, %f0
	addi	%sp, %sp, 20
	jal	fsqr.2606
	addi	%sp, %sp, -20
	flw	%f1, 18(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 20(%sp)
	flw	%f1, 19(%sp)
	flw	%f0, 17(%sp)
	fsub	%f0, %f1, %f0
	addi	%sp, %sp, 21
	jal	fsqr.2606
	addi	%sp, %sp, -21
	flw	%f1, 20(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 21(%sp)
	addi	%sp, %sp, 22
	jal	fisneg.2597
	addi	%sp, %sp, -22
	beqi	%v0, 0, bnei_else.11399
	flw	%f0, 482(%zero)
	j	bnei_cont.11400
bnei_else.11399:
	flw	%f0, 21(%sp)
bnei_cont.11400:
	flw	%f1, 447(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 446(%zero)
	fdiv	%f0, %f1, %f0
	lw	%ra, 2(%sp)
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.11392:
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 22(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 23
	jal	o_param_x.2708
	addi	%sp, %sp, -23
	flw	%f1, 22(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 23(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 24(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 25
	jal	o_param_z.2712
	addi	%sp, %sp, -25
	flw	%f1, 24(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 25(%sp)
	flw	%f0, 23(%sp)
	addi	%sp, %sp, 26
	jal	fsqr.2606
	addi	%sp, %sp, -26
	fsw	%f0, 26(%sp)
	flw	%f0, 25(%sp)
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	flw	%f1, 26(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	flw	%f0, 445(%zero)
	fdiv	%f1, %f1, %f0
	floor	%f0, %f1
	fsub	%f1, %f1, %f0
	flw	%f0, 449(%zero)
	fmul	%f0, %f1, %f0
	addi	%sp, %sp, 27
	jal	cos.2623
	addi	%sp, %sp, -27
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	flw	%f16, 447(%zero)
	fmul	%f1, %f0, %f16
	fsw	%f1, 146(%zero)
	flw	%f1, 477(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f0, %f16
	lw	%ra, 2(%sp)
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.11391:
	lw	%a0, 1(%sp)
	flw	%f1, 1(%a0)
	flw	%f0, 444(%zero)
	fmul	%f0, %f1, %f0
	addi	%sp, %sp, 27
	jal	sin.2625
	addi	%sp, %sp, -27
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	flw	%f16, 447(%zero)
	fmul	%f1, %f16, %f0
	fsw	%f1, 145(%zero)
	flw	%f1, 477(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f16, %f0
	lw	%ra, 2(%sp)
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.11390:
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 27(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 28
	jal	o_param_x.2708
	addi	%sp, %sp, -28
	flw	%f1, 27(%sp)
	fsub	%f16, %f1, %f0
	flw	%f0, 443(%zero)
	fsw	%f0, 28(%sp)
	fmul	%f0, %f16, %f0
	floor	%f1, %f0
	flw	%f0, 442(%zero)
	fsw	%f0, 29(%sp)
	fmul	%f0, %f1, %f0
	fsub	%f0, %f16, %f0
	flw	%f1, 445(%zero)
	fsw	%f1, 30(%sp)
	addi	%sp, %sp, 31
	jal	fless.2592
	addi	%sp, %sp, -31
	sw	%v0, 31(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 32(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 33
	jal	o_param_z.2712
	addi	%sp, %sp, -33
	flw	%f1, 32(%sp)
	fsub	%f16, %f1, %f0
	flw	%f0, 28(%sp)
	fmul	%f0, %f16, %f0
	floor	%f1, %f0
	flw	%f0, 29(%sp)
	fmul	%f0, %f1, %f0
	fsub	%f0, %f16, %f0
	flw	%f1, 30(%sp)
	addi	%sp, %sp, 33
	jal	fless.2592
	addi	%sp, %sp, -33
	lw	%a0, 31(%sp)
	beqi	%a0, 0, bnei_else.11404
	beqi	%v0, 0, bnei_else.11406
	flw	%f0, 447(%zero)
	j	bnei_cont.11405
bnei_else.11406:
	flw	%f0, 482(%zero)
bnei_cont.11407:
	j	bnei_cont.11405
bnei_else.11404:
	beqi	%v0, 0, bnei_else.11408
	flw	%f0, 482(%zero)
	j	bnei_cont.11409
bnei_else.11408:
	flw	%f0, 447(%zero)
bnei_cont.11409:
bnei_cont.11405:
	lw	%ra, 2(%sp)
	fsw	%f0, 146(%zero)
	jr	%ra
add_light.2962:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2595
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.11455
	addi	%v1, %zero, 145
	addi	%v0, %zero, 151
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 4
	jal	vecaccum.2673
	addi	%sp, %sp, -4
	j	bnei_cont.11456
bnei_else.11455:
bnei_cont.11456:
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2595
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.11457
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 4
	jal	fsqr.2606
	addi	%sp, %sp, -4
	addi	%sp, %sp, 4
	jal	fsqr.2606
	addi	%sp, %sp, -4
	flw	%f1, 2(%sp)
	fmul	%f1, %f0, %f1
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
bnei_else.11457:
	lw	%ra, 3(%sp)
	jr	%ra
trace_reflections.2966:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 8(%sp)
	blti	%v0, 0, bgti_else.11531
	lw	%t0, 254(%v0)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	r_dvec.2757
	addi	%sp, %sp, -9
	addi	%t1, %v0, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 9
	jal	judge_intersection_fast.2948
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.11532
	lw	%a0, 141(%zero)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a0, %a1, %a0
	sw	%a0, 9(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	r_surface_id.2755
	addi	%sp, %sp, -10
	lw	%a0, 9(%sp)
	bne	%a0, %v0, beq_else.11534
	lw	%v1, 134(%zero)
	lw	%v0, 8(%sp)
	addi	%sp, %sp, 10
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.11536
	j	bnei_cont.11533
bnei_else.11536:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 10
	jal	d_vec.2751
	addi	%sp, %sp, -10
	addi	%t1, %v0, 0
	addi	%v0, %zero, 142
	addi	%v1, %t1, 0
	addi	%sp, %sp, 10
	jal	veciprod.2665
	addi	%sp, %sp, -10
	fsw	%f0, 10(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 11
	jal	r_bright.2759
	addi	%sp, %sp, -11
	fmov	%f6, %f0
	flw	%f0, 0(%sp)
	fmul	%f1, %f6, %f0
	flw	%f0, 10(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 11(%sp)
	lw	%v0, 3(%sp)
	addi	%v1, %t1, 0
	addi	%sp, %sp, 12
	jal	veciprod.2665
	addi	%sp, %sp, -12
	fmul	%f1, %f6, %f0
	flw	%f2, 1(%sp)
	flw	%f0, 11(%sp)
	addi	%sp, %sp, 12
	jal	add_light.2962
	addi	%sp, %sp, -12
bnei_cont.11537:
	j	bnei_cont.11533
beq_else.11534:
beq_cont.11535:
	j	bnei_cont.11533
bnei_else.11532:
bnei_cont.11533:
	lw	%a0, 2(%sp)
	addi	%v0, %a0, -1
	flw	%f6, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 3(%sp)
	j	trace_reflections.2966
bgti_else.11531:
	jr	%ra
trace_ray.2971:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	add	%a1, %zero, %v0
	sw	%a1, 2(%sp)
	sw	%v1, 3(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%at, %zero, 4
	blt	%at, %a1, bgt_else.11701
	addi	%sp, %sp, 6
	jal	p_surface_ids.2736
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 7
	jal	judge_intersection.2934
	addi	%sp, %sp, -7
	addi	%a0, %zero, 0
	sw	%a0, 7(%sp)
	beqi	%v0, 0, bnei_else.11702
	lw	%a0, 141(%zero)
	sw	%a0, 8(%sp)
	lw	%v0, 12(%a0)
	sw	%v0, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_reflectiontype.2694
	addi	%sp, %sp, -10
	sw	%v0, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%sp, %sp, 11
	jal	o_diffuse.2714
	addi	%sp, %sp, -11
	fsw	%f0, 11(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 12(%sp)
	lw	%v1, 3(%sp)
	lw	%v0, 9(%sp)
	addi	%sp, %sp, 13
	jal	get_nvector.2956
	addi	%sp, %sp, -13
	addi	%v1, %zero, 138
	addi	%v0, %zero, 159
	addi	%sp, %sp, 13
	jal	veccpy.2654
	addi	%sp, %sp, -13
	addi	%v1, %zero, 138
	lw	%v0, 9(%sp)
	addi	%sp, %sp, 13
	jal	utexture.2959
	addi	%sp, %sp, -13
	lw	%a0, 8(%sp)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a2, %a1, %a0
	lw	%a1, 6(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 13
	jal	p_intersection_points.2734
	addi	%sp, %sp, -13
	lw	%a0, 2(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 138
	addi	%sp, %sp, 13
	jal	veccpy.2654
	addi	%sp, %sp, -13
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 13
	jal	p_calc_diffuse.2738
	addi	%sp, %sp, -13
	sw	%v0, 13(%sp)
	flw	%f1, 481(%zero)
	flw	%f0, 11(%sp)
	addi	%sp, %sp, 14
	jal	fless.2592
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.11703
	lw	%a2, 7(%sp)
	lw	%a1, 13(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	j	bnei_cont.11704
bnei_else.11703:
	addi	%a2, %zero, 1
	lw	%a1, 13(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 14
	jal	p_energy.2740
	addi	%sp, %sp, -14
	lw	%a0, 2(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	sw	%v0, 14(%sp)
	addi	%v1, %zero, 145
	addi	%sp, %sp, 15
	jal	veccpy.2654
	addi	%sp, %sp, -15
	flw	%f1, 441(%zero)
	flw	%f0, 12(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 14(%sp)
	addi	%sp, %sp, 15
	jal	vecscale.2683
	addi	%sp, %sp, -15
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 15
	jal	p_nvectors.2749
	addi	%sp, %sp, -15
	lw	%a0, 2(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 142
	addi	%sp, %sp, 15
	jal	veccpy.2654
	addi	%sp, %sp, -15
bnei_cont.11704:
	flw	%f0, 440(%zero)
	fsw	%f0, 15(%sp)
	addi	%v1, %zero, 142
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 16
	jal	veciprod.2665
	addi	%sp, %sp, -16
	flw	%f1, 15(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 142
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 16
	jal	vecaccum.2673
	addi	%sp, %sp, -16
	lw	%v0, 9(%sp)
	addi	%sp, %sp, 16
	jal	o_hilight.2716
	addi	%sp, %sp, -16
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 16(%sp)
	lw	%v1, 134(%zero)
	lw	%v0, 7(%sp)
	addi	%sp, %sp, 17
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -17
	beqi	%v0, 0, bnei_else.11705
	j	bnei_cont.11706
bnei_else.11705:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	addi	%sp, %sp, 17
	jal	veciprod.2665
	addi	%sp, %sp, -17
	fneg	%f1, %f0
	flw	%f0, 12(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 17(%sp)
	addi	%v1, %zero, 78
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 18
	jal	veciprod.2665
	addi	%sp, %sp, -18
	fneg	%f1, %f0
	flw	%f2, 16(%sp)
	flw	%f0, 17(%sp)
	addi	%sp, %sp, 18
	jal	add_light.2962
	addi	%sp, %sp, -18
bnei_cont.11706:
	addi	%v0, %zero, 138
	addi	%sp, %sp, 18
	jal	setup_startp.2885
	addi	%sp, %sp, -18
	lw	%a0, 434(%zero)
	addi	%v0, %a0, -1
	flw	%f1, 16(%sp)
	flw	%f0, 12(%sp)
	lw	%v1, 3(%sp)
	addi	%sp, %sp, 18
	jal	trace_reflections.2966
	addi	%sp, %sp, -18
	flw	%f0, 439(%zero)
	flw	%f1, 0(%sp)
	addi	%sp, %sp, 18
	jal	fless.2592
	addi	%sp, %sp, -18
	beqi	%v0, 0, bnei_else.11707
	lw	%a0, 2(%sp)
	blti	%a0, 4, bgti_else.11708
	j	bgti_cont.11709
bgti_else.11708:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 6(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.11709:
	lw	%a0, 10(%sp)
	beqi	%a0, 2, bnei_else.11710
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.11710:
	flw	%f1, 477(%zero)
	flw	%f0, 11(%sp)
	fsub	%f1, %f1, %f0
	flw	%f0, 0(%sp)
	fmul	%f0, %f0, %f1
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 1
	flw	%f16, 137(%zero)
	flw	%f1, 1(%sp)
	fadd	%f1, %f1, %f16
	lw	%ra, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%v1, 3(%sp)
	j	trace_ray.2971
bnei_else.11707:
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.11702:
	addi	%a2, %zero, -1
	lw	%a1, 6(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.11713
	addi	%v1, %zero, 78
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 18
	jal	veciprod.2665
	addi	%sp, %sp, -18
	fneg	%f0, %f0
	fsw	%f0, 18(%sp)
	addi	%sp, %sp, 19
	jal	fispos.2595
	addi	%sp, %sp, -19
	beqi	%v0, 0, bnei_else.11714
	flw	%f0, 18(%sp)
	addi	%sp, %sp, 19
	jal	fsqr.2606
	addi	%sp, %sp, -19
	flw	%f1, 18(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 0(%sp)
	fmul	%f1, %f1, %f0
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
	lw	%ra, 5(%sp)
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.11714:
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.11713:
	lw	%ra, 5(%sp)
	jr	%ra
bgt_else.11701:
	jr	%ra
trace_diffuse_ray.2977:
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%t0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	judge_intersection_fast.2948
	addi	%sp, %sp, -4
	addi	%a0, %zero, 0
	sw	%a0, 4(%sp)
	beqi	%v0, 0, bnei_else.11777
	lw	%a0, 141(%zero)
	lw	%t0, 12(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 5
	jal	d_vec.2751
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 5
	jal	get_nvector.2956
	addi	%sp, %sp, -5
	addi	%v1, %zero, 138
	addi	%v0, %t0, 0
	addi	%sp, %sp, 5
	jal	utexture.2959
	addi	%sp, %sp, -5
	lw	%v1, 134(%zero)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.11778
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.11778:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	addi	%sp, %sp, 5
	jal	veciprod.2665
	addi	%sp, %sp, -5
	fneg	%f0, %f0
	fsw	%f0, 5(%sp)
	addi	%sp, %sp, 6
	jal	fispos.2595
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.11780
	flw	%f0, 5(%sp)
	j	bnei_cont.11781
bnei_else.11780:
	flw	%f0, 482(%zero)
bnei_cont.11781:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 6(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	o_diffuse.2714
	addi	%sp, %sp, -7
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 145
	addi	%v0, %zero, 148
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	j	vecaccum.2673
bnei_else.11777:
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
iter_trace_diffuse_rays.2980:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	blti	%a1, 0, bgti_else.11832
	add	%at, %v0, %a1
	lw	%t0, 0(%at)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	d_vec.2751
	addi	%sp, %sp, -7
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 7
	jal	veciprod.2665
	addi	%sp, %sp, -7
	fmov	%f6, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 7
	jal	fisneg.2597
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.11833
	lw	%a0, 3(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%v0, 0(%at)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f6, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -7
	j	bnei_cont.11834
bnei_else.11833:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f6, %f0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -7
bnei_cont.11834:
	lw	%a0, 3(%sp)
	addi	%a1, %a0, -2
	flw	%f6, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.11832:
	jr	%ra
trace_diffuse_rays.2985:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_startp.2885
	addi	%sp, %sp, -4
	addi	%a1, %zero, 118
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
trace_diffuse_ray_80percent.2989:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.11930
	lw	%v0, 179(%zero)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -4
	j	bnei_cont.11931
bnei_else.11930:
bnei_cont.11931:
	lw	%a0, 0(%sp)
	beqi	%a0, 1, bnei_else.11932
	lw	%v0, 180(%zero)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -4
	j	bnei_cont.11933
bnei_else.11932:
bnei_cont.11933:
	lw	%a0, 0(%sp)
	beqi	%a0, 2, bnei_else.11934
	lw	%v0, 181(%zero)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -4
	j	bnei_cont.11935
bnei_else.11934:
bnei_cont.11935:
	lw	%a0, 0(%sp)
	beqi	%a0, 3, bnei_else.11936
	lw	%v0, 182(%zero)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -4
	j	bnei_cont.11937
bnei_else.11936:
bnei_cont.11937:
	lw	%a0, 0(%sp)
	beqi	%a0, 4, bnei_else.11938
	lw	%v0, 183(%zero)
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_diffuse_rays.2985
bnei_else.11938:
	lw	%ra, 3(%sp)
	jr	%ra
calc_diffuse_using_1point.2993:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t3, 2(%sp)
	sw	%t2, 3(%sp)
	sw	%t1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2742
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	p_nvectors.2749
	addi	%sp, %sp, -7
	addi	%t1, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	p_intersection_points.2734
	addi	%sp, %sp, -7
	addi	%t2, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	p_energy.2740
	addi	%sp, %sp, -7
	addi	%t3, %v0, 0
	lw	%a0, 1(%sp)
	add	%at, %t0, %a0
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 7
	jal	veccpy.2654
	addi	%sp, %sp, -7
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	p_group_id.2744
	addi	%sp, %sp, -7
	lw	%a0, 1(%sp)
	add	%at, %t1, %a0
	lw	%v1, 0(%at)
	add	%at, %t2, %a0
	lw	%a0, 0(%at)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray_80percent.2989
	addi	%sp, %sp, -7
	lw	%a0, 1(%sp)
	add	%at, %t3, %a0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	j	vecaccumv.2686
calc_diffuse_using_5points.2996:
	sw	%v0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a2, 3(%sp)
	sw	%t5, 4(%sp)
	sw	%t4, 5(%sp)
	sw	%t3, 6(%sp)
	sw	%t2, 7(%sp)
	sw	%t1, 8(%sp)
	sw	%t0, 9(%sp)
	sw	%ra, 10(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	addi	%sp, %sp, 11
	jal	p_received_ray_20percent.2742
	addi	%sp, %sp, -11
	addi	%t0, %v0, 0
	lw	%a0, 0(%sp)
	addi	%a1, %a0, -1
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%v0, 0(%at)
	addi	%sp, %sp, 11
	jal	p_received_ray_20percent.2742
	addi	%sp, %sp, -11
	addi	%t1, %v0, 0
	lw	%a1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%t2, 0(%at)
	addi	%v0, %t2, 0
	addi	%sp, %sp, 11
	jal	p_received_ray_20percent.2742
	addi	%sp, %sp, -11
	addi	%t3, %v0, 0
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%v0, 0(%at)
	addi	%sp, %sp, 11
	jal	p_received_ray_20percent.2742
	addi	%sp, %sp, -11
	addi	%t4, %v0, 0
	lw	%a1, 2(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%v0, 0(%at)
	addi	%sp, %sp, 11
	jal	p_received_ray_20percent.2742
	addi	%sp, %sp, -11
	addi	%t5, %v0, 0
	lw	%a0, 3(%sp)
	add	%at, %t0, %a0
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 11
	jal	veccpy.2654
	addi	%sp, %sp, -11
	lw	%a0, 3(%sp)
	add	%at, %t1, %a0
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 11
	jal	vecadd.2677
	addi	%sp, %sp, -11
	lw	%a0, 3(%sp)
	add	%at, %t3, %a0
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 11
	jal	vecadd.2677
	addi	%sp, %sp, -11
	lw	%a0, 3(%sp)
	add	%at, %t4, %a0
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 11
	jal	vecadd.2677
	addi	%sp, %sp, -11
	lw	%a0, 3(%sp)
	add	%at, %t5, %a0
	lw	%v1, 0(%at)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 11
	jal	vecadd.2677
	addi	%sp, %sp, -11
	addi	%v0, %t2, 0
	addi	%sp, %sp, 11
	jal	p_energy.2740
	addi	%sp, %sp, -11
	lw	%a0, 3(%sp)
	add	%at, %v0, %a0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	lw	%t5, 4(%sp)
	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	j	vecaccumv.2686
do_without_neighbors.3002:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.12078
	addi	%sp, %sp, 3
	jal	p_surface_ids.2736
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	add	%at, %v0, %a0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.12079
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_calc_diffuse.2738
	addi	%sp, %sp, -3
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.12080
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	calc_diffuse_using_1point.2993
	addi	%sp, %sp, -3
	j	bnei_cont.12081
bnei_else.12080:
bnei_cont.12081:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.12079:
	lw	%ra, 2(%sp)
	jr	%ra
bgt_else.12078:
	jr	%ra
neighbors_exist.3005:
	lw	%a1, 155(%zero)
	addi	%a0, %v1, 1
	blt	%a0, %a1, bgt_else.12114
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.12114:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.12115
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.12115:
	lw	%a1, 154(%zero)
	addi	%a0, %v0, 1
	blt	%a0, %a1, bgt_else.12116
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.12116:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.12117
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.12117:
	addi	%v0, %zero, 1
	jr	%ra
get_surface_id.3009:
	sw	%v1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	p_surface_ids.2736
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	jr	%ra
neighbors_are_available.3012:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	add	%v1, %zero, %a2
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	addi	%sp, %sp, 6
	jal	get_surface_id.3009
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%a1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%v0, 0(%at)
	lw	%v1, 4(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3009
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.12210
	lw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%v0, 0(%at)
	lw	%v1, 4(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3009
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.12211
	lw	%a0, 0(%sp)
	addi	%a1, %a0, -1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	lw	%v0, 0(%at)
	lw	%v1, 4(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3009
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.12212
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	lw	%v0, 0(%at)
	lw	%v1, 4(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3009
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.12213
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.12213:
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
beq_else.12212:
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
beq_else.12211:
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
beq_else.12210:
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
try_exploit_neighbors.3018:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	add	%v1, %zero, %a3
	sw	%v1, 5(%sp)
	sw	%ra, 6(%sp)
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	sw	%v0, 7(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.12290
	addi	%sp, %sp, 8
	jal	get_surface_id.3009
	addi	%sp, %sp, -8
	blti	%v0, 0, bgti_else.12291
	lw	%a2, 5(%sp)
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 8
	jal	neighbors_are_available.3012
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.12292
	lw	%v0, 7(%sp)
	addi	%sp, %sp, 8
	jal	p_calc_diffuse.2738
	addi	%sp, %sp, -8
	lw	%a2, 5(%sp)
	add	%at, %v0, %a2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.12293
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 8
	jal	calc_diffuse_using_5points.2996
	addi	%sp, %sp, -8
	j	bnei_cont.12294
bnei_else.12293:
bnei_cont.12294:
	lw	%a0, 5(%sp)
	addi	%a3, %a0, 1
	lw	%ra, 6(%sp)
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	try_exploit_neighbors.3018
bnei_else.12292:
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	lw	%v0, 7(%sp)
	j	do_without_neighbors.3002
bgti_else.12291:
	lw	%ra, 6(%sp)
	jr	%ra
bgt_else.12290:
	jr	%ra
write_ppm_header.3025:
	sw	%t4, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 80
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	addi	%v0, %zero, 51
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	addi	%v0, %zero, 10
	sw	%v0, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_print_char
	addi	%sp, %sp, -3
	lw	%v0, 154(%zero)
	addi	%sp, %sp, 3
	jal	print_int.2634
	addi	%sp, %sp, -3
	addi	%t4, %zero, 32
	addi	%v0, %t4, 0
	addi	%sp, %sp, 3
	jal	min_caml_print_char
	addi	%sp, %sp, -3
	lw	%v0, 155(%zero)
	addi	%sp, %sp, 3
	jal	print_int.2634
	addi	%sp, %sp, -3
	addi	%v0, %t4, 0
	addi	%sp, %sp, 3
	jal	min_caml_print_char
	addi	%sp, %sp, -3
	addi	%v0, %zero, 255
	addi	%sp, %sp, 3
	jal	print_int.2634
	addi	%sp, %sp, -3
	lw	%t4, 0(%sp)
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	j	min_caml_print_char
write_rgb_element.3027:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.12345
	blti	%v0, 0, bgti_else.12347
	j	print_int.2634
bgti_else.12347:
	addi	%v0, %zero, 0
bgti_cont.12348:
	j	print_int.2634
bgt_else.12345:
	addi	%v0, %zero, 255
bgt_cont.12346:
	j	print_int.2634
write_rgb.3029:
	sw	%t5, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f0, 151(%zero)
	addi	%sp, %sp, 2
	jal	write_rgb_element.3027
	addi	%sp, %sp, -2
	addi	%t5, %zero, 32
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	flw	%f0, 152(%zero)
	addi	%sp, %sp, 2
	jal	write_rgb_element.3027
	addi	%sp, %sp, -2
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	flw	%f0, 153(%zero)
	addi	%sp, %sp, 2
	jal	write_rgb_element.3027
	addi	%sp, %sp, -2
	addi	%v0, %zero, 10
	lw	%t5, 0(%sp)
	lw	%ra, 1(%sp)
	j	min_caml_print_char
pretrace_diffuse_rays.3031:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.12430
	addi	%sp, %sp, 3
	jal	get_surface_id.3009
	addi	%sp, %sp, -3
	blti	%v0, 0, bgti_else.12431
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_calc_diffuse.2738
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	add	%at, %v0, %a0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.12432
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_group_id.2744
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 4
	jal	vecbzero.2652
	addi	%sp, %sp, -4
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	p_nvectors.2749
	addi	%sp, %sp, -4
	sw	%v0, 4(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	p_intersection_points.2734
	addi	%sp, %sp, -5
	addi	%a0, %v0, 0
	lw	%a1, 3(%sp)
	lw	%v0, 179(%a1)
	lw	%a2, 4(%sp)
	lw	%a1, 1(%sp)
	add	%at, %a2, %a1
	lw	%v1, 0(%at)
	add	%at, %a0, %a1
	lw	%a0, 0(%at)
	addi	%sp, %sp, 5
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -5
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	p_received_ray_20percent.2742
	addi	%sp, %sp, -5
	lw	%a0, 1(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 148
	addi	%sp, %sp, 5
	jal	veccpy.2654
	addi	%sp, %sp, -5
	j	bnei_cont.12433
bnei_else.12432:
bnei_cont.12433:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3031
bgti_else.12431:
	lw	%ra, 2(%sp)
	jr	%ra
bgt_else.12430:
	jr	%ra
pretrace_pixels.3034:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%t1, 6(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%t0, %zero, 0
	blti	%v1, 0, bgti_else.12487
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
	sw	%a0, 9(%sp)
	flw	%f0, 166(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f1
	fsw	%f0, 175(%zero)
	flw	%f0, 167(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f2
	fsw	%f0, 176(%zero)
	addi	%v0, %zero, 174
	addi	%v1, %t0, 0
	addi	%sp, %sp, 10
	jal	vecunit_sgn.2662
	addi	%sp, %sp, -10
	addi	%v0, %zero, 151
	addi	%sp, %sp, 10
	jal	vecbzero.2652
	addi	%sp, %sp, -10
	addi	%v1, %zero, 75
	addi	%v0, %zero, 159
	addi	%sp, %sp, 10
	jal	veccpy.2654
	addi	%sp, %sp, -10
	flw	%f0, 477(%zero)
	lw	%a1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a1, %a0
	lw	%t1, 0(%at)
	flw	%f1, 482(%zero)
	addi	%v1, %zero, 174
	addi	%a0, %t1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	trace_ray.2971
	addi	%sp, %sp, -10
	addi	%v0, %t1, 0
	addi	%sp, %sp, 10
	jal	p_rgb.2732
	addi	%sp, %sp, -10
	addi	%v1, %zero, 151
	addi	%sp, %sp, 10
	jal	veccpy.2654
	addi	%sp, %sp, -10
	lw	%v1, 5(%sp)
	addi	%v0, %t1, 0
	addi	%sp, %sp, 10
	jal	p_set_group_id.2746
	addi	%sp, %sp, -10
	addi	%v1, %t0, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 10
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -10
	lw	%a0, 4(%sp)
	addi	%a0, %a0, -1
	sw	%a0, 10(%sp)
	lw	%v1, 9(%sp)
	lw	%v0, 5(%sp)
	addi	%sp, %sp, 11
	jal	add_mod5.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 10(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3034
bgti_else.12487:
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
	sw	%t1, 5(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%t0, %zero, 0
	lw	%a2, 154(%zero)
	blt	%v0, %a2, bgt_else.12563
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.12563:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	addi	%v0, %t1, 0
	addi	%sp, %sp, 8
	jal	p_rgb.2732
	addi	%sp, %sp, -8
	addi	%v1, %v0, 0
	addi	%v0, %zero, 151
	addi	%sp, %sp, 8
	jal	veccpy.2654
	addi	%sp, %sp, -8
	lw	%a0, 4(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 8
	jal	neighbors_exist.3005
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.12565
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a3, %t0, 0
	addi	%sp, %sp, 8
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -8
	j	bnei_cont.12566
bnei_else.12565:
	addi	%v1, %t0, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 8
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -8
bnei_cont.12566:
	addi	%sp, %sp, 8
	jal	write_rgb.3029
	addi	%sp, %sp, -8
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
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
	blt	%a3, %a1, bgt_else.12617
	jr	%ra
bgt_else.12617:
	addi	%a1, %a1, -1
	blt	%a3, %a1, bgt_else.12619
	j	bgt_cont.12620
bgt_else.12619:
	addi	%v1, %a3, 1
	addi	%sp, %sp, 6
	jal	pretrace_line.3041
	addi	%sp, %sp, -6
bgt_cont.12620:
	addi	%v0, %zero, 0
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 6
	jal	scan_pixel.3045
	addi	%sp, %sp, -6
	lw	%a0, 0(%sp)
	addi	%a0, %a0, 1
	sw	%a0, 6(%sp)
	addi	%v1, %zero, 2
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	add_mod5.2641
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	lw	%ra, 5(%sp)
	lw	%a1, 1(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 6(%sp)
	j	scan_line.3051
create_float5x3array.3057:
	fsw	%f15, 0(%sp)
	sw	%t4, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%t4, %zero, 3
	flw	%f15, 482(%zero)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%a0, 3(%sp)
	sw	%v0, 1(%a0)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%a0, 3(%sp)
	sw	%v0, 2(%a0)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%a0, 3(%sp)
	sw	%v0, 3(%a0)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	lw	%v0, 3(%sp)
	sw	%a0, 4(%v0)
	flw	%f15, 0(%sp)
	lw	%t4, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
create_pixel.3059:
	sw	%t6, 0(%sp)
	sw	%t5, 1(%sp)
	sw	%t4, 2(%sp)
	sw	%t3, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 482(%zero)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	addi	%t0, %v0, 0
	addi	%sp, %sp, 8
	jal	create_float5x3array.3057
	addi	%sp, %sp, -8
	addi	%t1, %v0, 0
	addi	%t3, %zero, 5
	addi	%t2, %zero, 0
	addi	%v1, %t2, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	addi	%t4, %v0, 0
	addi	%v1, %t2, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	addi	%t3, %v0, 0
	addi	%sp, %sp, 8
	jal	create_float5x3array.3057
	addi	%sp, %sp, -8
	addi	%t5, %v0, 0
	addi	%sp, %sp, 8
	jal	create_float5x3array.3057
	addi	%sp, %sp, -8
	addi	%t6, %v0, 0
	addi	%v0, %zero, 1
	addi	%v1, %t2, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	addi	%t2, %v0, 0
	addi	%sp, %sp, 8
	jal	create_float5x3array.3057
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v0)
	sw	%t2, 6(%v0)
	sw	%t6, 5(%v0)
	sw	%t5, 4(%v0)
	sw	%t3, 3(%v0)
	sw	%t4, 2(%v0)
	sw	%t1, 1(%v0)
	sw	%t0, 0(%v0)
	lw	%t6, 0(%sp)
	lw	%t5, 1(%sp)
	lw	%t4, 2(%sp)
	lw	%t3, 3(%sp)
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
init_line_elements.3061:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	blti	%v1, 0, bgti_else.12714
	addi	%sp, %sp, 3
	jal	create_pixel.3059
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	lw	%v0, 0(%sp)
	lw	%a1, 1(%sp)
	add	%at, %v0, %a1
	sw	%a0, 0(%at)
	addi	%v1, %a1, -1
	lw	%ra, 2(%sp)
	j	init_line_elements.3061
bgti_else.12714:
	jr	%ra
create_pixelline.3064:
	sw	%t5, 0(%sp)
	sw	%ra, 1(%sp)
	lw	%t5, 154(%zero)
	addi	%sp, %sp, 2
	jal	create_pixel.3059
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%v1, %t5, -2
	lw	%t5, 0(%sp)
	lw	%ra, 1(%sp)
	j	init_line_elements.3061
tan.3066:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	sin.2625
	addi	%sp, %sp, -2
	fsw	%f0, 2(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 3
	jal	cos.2623
	addi	%sp, %sp, -3
	lw	%ra, 1(%sp)
	flw	%f1, 2(%sp)
	fdiv	%f0, %f1, %f0
	jr	%ra
adjust_position.3068:
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	fmul	%f1, %f0, %f0
	flw	%f0, 439(%zero)
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fsw	%f1, 2(%sp)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 3
	jal	atan.2627
	addi	%sp, %sp, -3
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	addi	%sp, %sp, 3
	jal	tan.3066
	addi	%sp, %sp, -3
	lw	%ra, 1(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	jr	%ra
calc_dirvec.3071:
	fmov	%f16, %f0
	fsw	%f16, 0(%sp)
	fmov	%f0, %f1
	fsw	%f0, 1(%sp)
	fmov	%f1, %f2
	fsw	%f1, 2(%sp)
	fsw	%f3, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%v1, 5(%sp)
	sw	%a0, 6(%sp)
	fsw	%f6, 7(%sp)
	sw	%t0, 8(%sp)
	sw	%ra, 9(%sp)
	blti	%v0, 5, bgti_else.12859
	fmov	%f0, %f16
	addi	%sp, %sp, 10
	jal	fsqr.2606
	addi	%sp, %sp, -10
	fmov	%f6, %f0
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 10
	jal	fsqr.2606
	addi	%sp, %sp, -10
	fadd	%f0, %f6, %f0
	flw	%f16, 477(%zero)
	fadd	%f0, %f0, %f16
	fsqrt	%f1, %f0
	flw	%f0, 0(%sp)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 10(%sp)
	flw	%f0, 1(%sp)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 11(%sp)
	fdiv	%f6, %f16, %f1
	lw	%a0, 5(%sp)
	lw	%t0, 179(%a0)
	lw	%a0, 6(%sp)
	add	%at, %t0, %a0
	lw	%v0, 0(%at)
	addi	%sp, %sp, 12
	jal	d_vec.2751
	addi	%sp, %sp, -12
	flw	%f1, 11(%sp)
	flw	%f0, 10(%sp)
	fmov	%f2, %f6
	addi	%sp, %sp, 12
	jal	vecset.2644
	addi	%sp, %sp, -12
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 40
	add	%at, %t0, %a0
	lw	%v0, 0(%at)
	addi	%sp, %sp, 12
	jal	d_vec.2751
	addi	%sp, %sp, -12
	flw	%f0, 11(%sp)
	fneg	%f2, %f0
	flw	%f0, 10(%sp)
	fmov	%f1, %f6
	addi	%sp, %sp, 12
	jal	vecset.2644
	addi	%sp, %sp, -12
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 80
	add	%at, %t0, %a0
	lw	%v0, 0(%at)
	addi	%sp, %sp, 12
	jal	d_vec.2751
	addi	%sp, %sp, -12
	flw	%f0, 10(%sp)
	fneg	%f1, %f0
	flw	%f0, 11(%sp)
	fneg	%f2, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 12
	jal	vecset.2644
	addi	%sp, %sp, -12
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 1
	add	%at, %t0, %a0
	lw	%v0, 0(%at)
	addi	%sp, %sp, 12
	jal	d_vec.2751
	addi	%sp, %sp, -12
	flw	%f0, 10(%sp)
	fneg	%f0, %f0
	flw	%f1, 11(%sp)
	fneg	%f1, %f1
	fneg	%f2, %f6
	addi	%sp, %sp, 12
	jal	vecset.2644
	addi	%sp, %sp, -12
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 41
	add	%at, %t0, %a0
	lw	%v0, 0(%at)
	addi	%sp, %sp, 12
	jal	d_vec.2751
	addi	%sp, %sp, -12
	flw	%f0, 10(%sp)
	fneg	%f0, %f0
	fneg	%f1, %f6
	flw	%f2, 11(%sp)
	addi	%sp, %sp, 12
	jal	vecset.2644
	addi	%sp, %sp, -12
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 81
	add	%at, %t0, %a0
	lw	%v0, 0(%at)
	addi	%sp, %sp, 12
	jal	d_vec.2751
	addi	%sp, %sp, -12
	fneg	%f0, %f6
	flw	%f6, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	flw	%f2, 11(%sp)
	flw	%f1, 10(%sp)
	j	vecset.2644
bgti_else.12859:
	addi	%sp, %sp, 12
	jal	adjust_position.3068
	addi	%sp, %sp, -12
	fsw	%f0, 12(%sp)
	lw	%a0, 4(%sp)
	addi	%a0, %a0, 1
	sw	%a0, 13(%sp)
	flw	%f1, 3(%sp)
	addi	%sp, %sp, 14
	jal	adjust_position.3068
	addi	%sp, %sp, -14
	fmov	%f1, %f0
	flw	%f6, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	flw	%f3, 3(%sp)
	flw	%f2, 2(%sp)
	flw	%f0, 12(%sp)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	lw	%v0, 13(%sp)
	j	calc_dirvec.3071
calc_dirvecs.3079:
	fmov	%f3, %f0
	fsw	%f3, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%a0, 3(%sp)
	fsw	%f7, 4(%sp)
	fsw	%f6, 5(%sp)
	add	%a1, %zero, %t0
	sw	%a1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%t0, %zero, 0
	blti	%v0, 0, bgti_else.12908
	itof	%f0, %v0
	flw	%f6, 473(%zero)
	fmul	%f1, %f0, %f6
	flw	%f0, 436(%zero)
	fsub	%f2, %f1, %f0
	flw	%f7, 482(%zero)
	addi	%v0, %t0, 0
	fmov	%f1, %f7
	fmov	%f0, %f7
	addi	%sp, %sp, 8
	jal	calc_dirvec.3071
	addi	%sp, %sp, -8
	lw	%a0, 1(%sp)
	itof	%f0, %a0
	fmul	%f1, %f0, %f6
	flw	%f0, 439(%zero)
	fadd	%f2, %f1, %f0
	lw	%a0, 3(%sp)
	addi	%a0, %a0, 2
	flw	%f3, 0(%sp)
	lw	%v1, 2(%sp)
	addi	%v0, %t0, 0
	fmov	%f1, %f7
	fmov	%f0, %f7
	addi	%sp, %sp, 8
	jal	calc_dirvec.3071
	addi	%sp, %sp, -8
	addi	%v1, %zero, 1
	lw	%a0, 1(%sp)
	addi	%a0, %a0, -1
	sw	%a0, 8(%sp)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 9
	jal	add_mod5.2641
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0
	flw	%f7, 4(%sp)
	flw	%f6, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	flw	%f0, 0(%sp)
	lw	%a0, 3(%sp)
	lw	%v0, 8(%sp)
	j	calc_dirvecs.3079
bgti_else.12908:
	add	%t0, %zero, %a1
	jr	%ra
calc_dirvec_rows.3084:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	blti	%v0, 0, bgti_else.12946
	itof	%f1, %v0
	flw	%f0, 473(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 436(%zero)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 4
	addi	%sp, %sp, 4
	jal	calc_dirvecs.3079
	addi	%sp, %sp, -4
	lw	%a0, 0(%sp)
	addi	%a0, %a0, -1
	sw	%a0, 4(%sp)
	addi	%v1, %zero, 2
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 5
	jal	add_mod5.2641
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0
	lw	%a0, 2(%sp)
	addi	%a0, %a0, 4
	lw	%ra, 3(%sp)
	lw	%v0, 4(%sp)
	j	calc_dirvec_rows.3084
bgti_else.12946:
	jr	%ra
create_dirvec.3088:
	sw	%t5, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 482(%zero)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%t5, %v0, 0
	lw	%v0, 0(%zero)
	addi	%v1, %t5, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%a0, %v0, 0
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%a0, 1(%v0)
	sw	%t5, 0(%v0)
	lw	%t5, 0(%sp)
	lw	%ra, 1(%sp)
	jr	%ra
create_dirvec_elements.3090:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	blti	%v1, 0, bgti_else.13002
	addi	%sp, %sp, 3
	jal	create_dirvec.3088
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	lw	%v0, 0(%sp)
	lw	%a1, 1(%sp)
	add	%at, %v0, %a1
	sw	%a0, 0(%at)
	addi	%v1, %a1, -1
	lw	%ra, 2(%sp)
	j	create_dirvec_elements.3090
bgti_else.13002:
	jr	%ra
create_dirvecs.3093:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	blti	%v0, 0, bgti_else.13037
	addi	%a0, %zero, 120
	sw	%a0, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_dirvec.3088
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	lw	%a0, 0(%sp)
	sw	%v0, 179(%a0)
	lw	%v0, 179(%a0)
	addi	%v1, %zero, 118
	addi	%sp, %sp, 3
	jal	create_dirvec_elements.3090
	addi	%sp, %sp, -3
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%ra, 1(%sp)
	j	create_dirvecs.3093
bgti_else.13037:
	jr	%ra
init_dirvec_constants.3095:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	blti	%v1, 0, bgti_else.13071
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%sp, %sp, 3
	jal	setup_dirvec_constants.2880
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	addi	%v1, %a0, -1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	init_dirvec_constants.3095
bgti_else.13071:
	jr	%ra
init_vecset_constants.3098:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	blti	%v0, 0, bgti_else.13103
	lw	%v0, 179(%v0)
	addi	%v1, %zero, 119
	addi	%sp, %sp, 2
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -2
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%ra, 1(%sp)
	j	init_vecset_constants.3098
bgti_else.13103:
	jr	%ra
init_dirvecs.3100:
	sw	%ra, 0(%sp)
	addi	%v0, %zero, 4
	sw	%v0, 1(%sp)
	addi	%sp, %sp, 2
	jal	create_dirvecs.3093
	addi	%sp, %sp, -2
	addi	%v0, %zero, 9
	addi	%v1, %zero, 0
	addi	%a0, %v1, 0
	addi	%sp, %sp, 2
	jal	calc_dirvec_rows.3084
	addi	%sp, %sp, -2
	lw	%ra, 0(%sp)
	lw	%v0, 1(%sp)
	j	init_vecset_constants.3098
add_reflection.3102:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f3, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%v1, 5(%sp)
	sw	%t5, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	create_dirvec.3088
	addi	%sp, %sp, -8
	addi	%t5, %v0, 0
	addi	%v0, %t5, 0
	addi	%sp, %sp, 8
	jal	d_vec.2751
	addi	%sp, %sp, -8
	flw	%f2, 3(%sp)
	flw	%f1, 2(%sp)
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 8
	jal	vecset.2644
	addi	%sp, %sp, -8
	addi	%v0, %t5, 0
	addi	%sp, %sp, 8
	jal	setup_dirvec_constants.2880
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 0(%sp)
	fsw	%f0, 2(%a0)
	sw	%t5, 1(%a0)
	lw	%a1, 5(%sp)
	sw	%a1, 0(%a0)
	lw	%t5, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%a1, 4(%sp)
	sw	%a0, 254(%a1)
	jr	%ra
setup_rect_reflection.3109:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	fsw	%f15, 0(%sp)
	fsw	%f14, 1(%sp)
	fsw	%f13, 2(%sp)
	fsw	%f12, 3(%sp)
	fsw	%f11, 4(%sp)
	fsw	%f10, 5(%sp)
	sw	%t5, 6(%sp)
	sw	%t4, 7(%sp)
	sw	%ra, 8(%sp)
	sll	%t4, %a0, 2
	lw	%t5, 434(%zero)
	flw	%f10, 477(%zero)
	addi	%sp, %sp, 9
	jal	o_diffuse.2714
	addi	%sp, %sp, -9
	fsub	%f12, %f10, %f0
	flw	%f1, 78(%zero)
	fneg	%f13, %f1
	flw	%f14, 79(%zero)
	fneg	%f11, %f14
	flw	%f15, 80(%zero)
	fneg	%f10, %f15
	addi	%v1, %t4, 1
	addi	%v0, %t5, 0
	fmov	%f3, %f10
	fmov	%f2, %f11
	fmov	%f0, %f12
	addi	%sp, %sp, 9
	jal	add_reflection.3102
	addi	%sp, %sp, -9
	addi	%v0, %t5, 1
	addi	%v1, %t4, 2
	fmov	%f3, %f10
	fmov	%f2, %f14
	fmov	%f1, %f13
	fmov	%f0, %f12
	addi	%sp, %sp, 9
	jal	add_reflection.3102
	addi	%sp, %sp, -9
	addi	%v0, %t5, 2
	addi	%v1, %t4, 3
	fmov	%f3, %f15
	fmov	%f2, %f11
	fmov	%f1, %f13
	fmov	%f0, %f12
	addi	%sp, %sp, 9
	jal	add_reflection.3102
	addi	%sp, %sp, -9
	addi	%a0, %t5, 3
	flw	%f15, 0(%sp)
	flw	%f14, 1(%sp)
	flw	%f13, 2(%sp)
	flw	%f12, 3(%sp)
	flw	%f11, 4(%sp)
	flw	%f10, 5(%sp)
	lw	%t5, 6(%sp)
	lw	%t4, 7(%sp)
	lw	%ra, 8(%sp)
	sw	%a0, 434(%zero)
	jr	%ra
setup_surface_reflection.3112:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	sw	%v0, 0(%sp)
	fsw	%f15, 1(%sp)
	fsw	%f14, 2(%sp)
	fsw	%f13, 3(%sp)
	fsw	%f12, 4(%sp)
	fsw	%f11, 5(%sp)
	sw	%t4, 6(%sp)
	sw	%t3, 7(%sp)
	sw	%ra, 8(%sp)
	sll	%a0, %a0, 2
	addi	%t3, %a0, 1
	lw	%t4, 434(%zero)
	flw	%f11, 477(%zero)
	addi	%sp, %sp, 9
	jal	o_diffuse.2714
	addi	%sp, %sp, -9
	fsub	%f12, %f11, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_abc.2706
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0
	addi	%v0, %zero, 78
	addi	%sp, %sp, 9
	jal	veciprod.2665
	addi	%sp, %sp, -9
	fmov	%f11, %f0
	flw	%f13, 468(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_a.2700
	addi	%sp, %sp, -9
	fmul	%f0, %f13, %f0
	fmul	%f1, %f0, %f11
	flw	%f0, 78(%zero)
	fsub	%f14, %f1, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2702
	addi	%sp, %sp, -9
	fmul	%f0, %f13, %f0
	fmul	%f1, %f0, %f11
	flw	%f0, 79(%zero)
	fsub	%f15, %f1, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_c.2704
	addi	%sp, %sp, -9
	fmul	%f0, %f13, %f0
	fmul	%f1, %f0, %f11
	flw	%f0, 80(%zero)
	fsub	%f3, %f1, %f0
	addi	%v1, %t3, 0
	addi	%v0, %t4, 0
	fmov	%f2, %f15
	fmov	%f1, %f14
	fmov	%f0, %f12
	addi	%sp, %sp, 9
	jal	add_reflection.3102
	addi	%sp, %sp, -9
	addi	%a0, %t4, 1
	flw	%f15, 1(%sp)
	flw	%f14, 2(%sp)
	flw	%f13, 3(%sp)
	flw	%f12, 4(%sp)
	flw	%f11, 5(%sp)
	lw	%t4, 6(%sp)
	lw	%t3, 7(%sp)
	lw	%ra, 8(%sp)
	sw	%a0, 434(%zero)
	jr	%ra
setup_reflections.3115:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	blti	%v0, 0, bgti_else.13315
	lw	%v0, 12(%v0)
	sw	%v0, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_reflectiontype.2694
	addi	%sp, %sp, -3
	beqi	%v0, 2, bnei_else.13316
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.13316:
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_diffuse.2714
	addi	%sp, %sp, -3
	flw	%f1, 477(%zero)
	addi	%sp, %sp, 3
	jal	fless.2592
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.13318
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2692
	addi	%sp, %sp, -3
	beqi	%v0, 1, bnei_else.13319
	beqi	%v0, 2, bnei_else.13320
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.13320:
	lw	%ra, 1(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 0(%sp)
	j	setup_surface_reflection.3112
bnei_else.13319:
	lw	%ra, 1(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 0(%sp)
	j	setup_rect_reflection.3109
bnei_else.13318:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.13315:
	jr	%ra
rt.3117:
	sw	%ra, 0(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 1(%sp)
	sw	%v0, 154(%zero)
	sw	%v1, 155(%zero)
	addi	%a0, %zero, 2
	sw	%a0, 2(%sp)
	srl	%a0, %v0, 1
	sw	%a0, 156(%zero)
	srl	%a0, %v1, 1
	sw	%a0, 157(%zero)
	flw	%f1, 435(%zero)
	itof	%f0, %v0
	fdiv	%f0, %f1, %f0
	fsw	%f0, 158(%zero)
	addi	%sp, %sp, 3
	jal	create_pixelline.3064
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	addi	%sp, %sp, 4
	jal	create_pixelline.3064
	addi	%sp, %sp, -4
	sw	%v0, 4(%sp)
	addi	%sp, %sp, 5
	jal	create_pixelline.3064
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_parameter.2782
	addi	%sp, %sp, -6
	addi	%sp, %sp, 6
	jal	write_ppm_header.3025
	addi	%sp, %sp, -6
	addi	%sp, %sp, 6
	jal	init_dirvecs.3100
	addi	%sp, %sp, -6
	addi	%v0, %zero, 247
	addi	%sp, %sp, 6
	jal	d_vec.2751
	addi	%sp, %sp, -6
	addi	%v1, %zero, 78
	addi	%sp, %sp, 6
	jal	veccpy.2654
	addi	%sp, %sp, -6
	addi	%v0, %zero, 247
	addi	%sp, %sp, 6
	jal	setup_dirvec_constants.2880
	addi	%sp, %sp, -6
	lw	%a0, 0(%zero)
	addi	%v0, %a0, -1
	addi	%sp, %sp, 6
	jal	setup_reflections.3115
	addi	%sp, %sp, -6
	lw	%v1, 1(%sp)
	lw	%a0, 1(%sp)
	lw	%v0, 4(%sp)
	addi	%a0, %v1, 0
	addi	%sp, %sp, 6
	jal	pretrace_line.3041
	addi	%sp, %sp, -6
	lw	%ra, 0(%sp)
	lw	%a2, 2(%sp)
	lw	%a1, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%v0, 1(%sp)
	j	scan_line.3051
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 1
	sw	%v0, 0(%sp)
	addi	%v1, %zero, 0
	sw	%v1, 1(%sp)
	addi	%a0, %zero, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_extarray
	addi	%sp, %sp, -2
	flw	%f0, 482(%zero)
	fsw	%f0, 2(%sp)
	addi	%v1, %zero, 1
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	addi	%v0, %zero, 60
	sw	%v0, 3(%sp)
	sw	%a0, 11(%zero)
	sw	%a0, 10(%zero)
	sw	%a0, 9(%zero)
	sw	%a0, 8(%zero)
	lw	%a1, 1(%sp)
	sw	%a1, 7(%zero)
	sw	%a0, 6(%zero)
	sw	%a0, 5(%zero)
	sw	%a1, 4(%zero)
	sw	%a1, 3(%zero)
	sw	%a1, 2(%zero)
	sw	%a1, 1(%zero)
	addi	%a0, %zero, 12
	addi	%v1, %zero, 1
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	addi	%v0, %zero, 3
	sw	%v0, 4(%sp)
	addi	%v1, %zero, 72
	flw	%f0, 2(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -5
	addi	%v1, %zero, 75
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -5
	addi	%v1, %zero, 78
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -5
	flw	%f0, 447(%zero)
	addi	%v1, %zero, 81
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -5
	addi	%a0, %zero, 50
	sw	%a0, 5(%sp)
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	lw	%v0, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	lw	%v1, 83(%zero)
	addi	%a0, %zero, 133
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 135
	flw	%f0, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%a0, %zero, 136
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	flw	%f0, 454(%zero)
	addi	%v1, %zero, 137
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 138
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%a0, %zero, 141
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 142
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 145
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 148
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v1, %zero, 151
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%v0, %zero, 2
	sw	%v0, 6(%sp)
	addi	%a0, %zero, 154
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%a0, %zero, 156
	lw	%v1, 1(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 158
	flw	%f0, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 159
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 162
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 165
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 168
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 171
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 174
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%v1, %zero, 177
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	sw	%v0, 7(%sp)
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	sw	%v0, 178(%zero)
	lw	%a0, 7(%sp)
	sw	%a0, 177(%zero)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	sw	%v0, 8(%sp)
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_extarray
	addi	%sp, %sp, -9
	sw	%v0, 248(%zero)
	lw	%a0, 8(%sp)
	sw	%a0, 247(%zero)
	addi	%v1, %zero, 249
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -9
	sw	%v0, 9(%sp)
	addi	%a0, %zero, 249
	addi	%v1, %zero, 249
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_extarray
	addi	%sp, %sp, -10
	addi	%a0, %zero, 249
	sw	%v0, 250(%zero)
	lw	%a1, 9(%sp)
	sw	%a1, 249(%zero)
	addi	%v0, %zero, 180
	flw	%f0, 2(%sp)
	fsw	%f0, 253(%zero)
	sw	%a0, 252(%zero)
	lw	%a0, 1(%sp)
	sw	%a0, 251(%zero)
	addi	%a0, %zero, 254
	addi	%v1, %zero, 251
	addi	%sp, %sp, 10
	jal	min_caml_create_extarray
	addi	%sp, %sp, -10
	addi	%a0, %zero, 434
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_extarray
	addi	%sp, %sp, -10
	addi	%v0, %zero, 128
	addi	%v1, %v0, 0
	addi	%sp, %sp, 10
	jal	rt.3117
	addi	%sp, %sp, -10
	addi	%g0, %zero, 0
	ret
