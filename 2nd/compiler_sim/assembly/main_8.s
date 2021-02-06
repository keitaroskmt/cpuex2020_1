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
fless.2592:
	fblt	%f0, %f1, fbgt_else.12674
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.12674:
	addi	%v0, %zero, 1
	jr	%ra
fispos.2595:
	flw	%f1, 482(%zero)
	fblt	%f1, %f0, fbgt_else.12675
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.12675:
	addi	%v0, %zero, 1
	jr	%ra
fisneg.2597:
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.12676
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.12676:
	addi	%v0, %zero, 1
	jr	%ra
fiszero.2599:
	flw	%f1, 482(%zero)
	fbne	%f0, %f1, fbeq_else.12677
	addi	%v0, %zero, 1
	jr	%ra
fbeq_else.12677:
	addi	%v0, %zero, 0
	jr	%ra
xor.2601:
	beqi	%v0, 0, bnei_else.12678
	beqi	%v1, 0, bnei_else.12679
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12679:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12678:
	add	%v0, %zero, %v1
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
f.6155:
	fmov	%f16, %f0
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f0, 0(%sp)
	fblt	%f16, %f0, fbgt_else.12680
	flw	%f1, 468(%zero)
	flw	%f0, 0(%sp)
	fmul	%f1, %f1, %f0
	lw	%ra, 1(%sp)
	fmov	%f0, %f16
	j	f.6155
fbgt_else.12680:
	lw	%ra, 1(%sp)
	flw	%f0, 0(%sp)
	jr	%ra
g.6159:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f1, 1(%k1)
	flw	%f0, 0(%sp)
	fblt	%f0, %f1, fbgt_else.12681
	flw	%f16, 1(%sp)
	flw	%f0, 0(%sp)
	fblt	%f0, %f16, fbgt_else.12682
	flw	%f0, 0(%sp)
	flw	%f16, 1(%sp)
	fsub	%f0, %f0, %f16
	flw	%f1, 468(%zero)
	flw	%f16, 1(%sp)
	fdiv	%f1, %f16, %f1
	lw	%ra, 2(%sp)
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.12682:
	flw	%f0, 468(%zero)
	flw	%f16, 1(%sp)
	fdiv	%f1, %f16, %f0
	lw	%ra, 2(%sp)
	flw	%f0, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.12681:
	lw	%ra, 2(%sp)
	flw	%f0, 0(%sp)
	jr	%ra
reduction_2pi.2614:
	fsw	%f0, 0(%sp)
	fsw	%f15, 1(%sp)
	fsw	%f14, 2(%sp)
	add	%k1, %zero, %ra
	flw	%f14, 467(%zero)
	flw	%f0, 0(%sp)
	fmov	%f1, %f14
	addi	%sp, %sp, 3
	jal	f.6155
	addi	%sp, %sp, -3
	fmov	%f1, %f0
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a1, %zero, g.6159
	sw	%a1, 0(%a0)
	fsw	%f14, 1(%a0)
	flw	%f15, 1(%sp)
	flw	%f14, 2(%sp)
	add	%ra, %zero, %k1
	flw	%f0, 0(%sp)
	addi	%k1, %a0, 0
	lw	%at, 0(%k1)
	jr	%at
cos.2616:
	fmov	%f10, %f0
	fmov	%f11, %f0
	fmov	%f12, %f0
	fmov	%f13, %f0
	fmov	%f14, %f0
	fmov	%f15, %f0
	fmov	%f7, %f0
	fmov	%f8, %f0
	fmov	%f9, %f0
	fsw	%f6, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f6, 466(%zero)
	fabs	%f0, %f0
	addi	%sp, %sp, 3
	jal	reduction_2pi.2614
	addi	%sp, %sp, -3
	fblt	%f0, %f6, fbgt_else.12683
	addi	%t0, %zero, 0
	j	fbgt_cont.12684
fbgt_else.12683:
	addi	%t0, %zero, 1
fbgt_cont.12684:
	fblt	%f0, %f6, fbgt_else.12685
	fsub	%f0, %f0, %f6
	j	fbgt_cont.12686
fbgt_else.12685:
fbgt_cont.12686:
	flw	%f16, 465(%zero)
	fblt	%f0, %f16, fbgt_else.12687
	beqi	%t0, 0, bnei_else.12689
	addi	%t0, %zero, 0
	j	bnei_cont.12690
bnei_else.12689:
	addi	%t0, %zero, 1
bnei_cont.12690:
	j	fbgt_cont.12688
fbgt_else.12687:
fbgt_cont.12688:
	fblt	%f0, %f16, fbgt_else.12691
	fsub	%f0, %f6, %f0
	j	fbgt_cont.12692
fbgt_else.12691:
fbgt_cont.12692:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.12693
	addi	%sp, %sp, 3
	jal	kernel_cos.2610
	addi	%sp, %sp, -3
	fmov	%f1, %f0
	j	fbgt_cont.12694
fbgt_else.12693:
	fsub	%f0, %f16, %f0
	addi	%sp, %sp, 3
	jal	kernel_sin.2608
	addi	%sp, %sp, -3
	fmov	%f1, %f0
fbgt_cont.12694:
	beqi	%t0, 0, bnei_else.12695
	fmov	%f0, %f10
	fmov	%f0, %f11
	fmov	%f0, %f12
	fmov	%f0, %f13
	fmov	%f0, %f14
	fmov	%f0, %f15
	fmov	%f0, %f7
	fmov	%f0, %f8
	fmov	%f0, %f9
	flw	%f6, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%ra, 2(%sp)
	fmov	%f0, %f1
	jr	%ra
bnei_else.12695:
	fmov	%f0, %f10
	fmov	%f0, %f11
	fmov	%f0, %f12
	fmov	%f0, %f13
	fmov	%f0, %f14
	fmov	%f0, %f15
	fmov	%f0, %f7
	fmov	%f0, %f8
	fmov	%f0, %f9
	flw	%f6, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%ra, 2(%sp)
	fneg	%f0, %f1
	jr	%ra
sin.2618:
	fmov	%f10, %f0
	fmov	%f11, %f0
	fmov	%f12, %f0
	fmov	%f13, %f0
	fmov	%f14, %f0
	fmov	%f15, %f0
	fmov	%f7, %f0
	fmov	%f8, %f0
	fmov	%f9, %f0
	fsw	%f6, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f6, 466(%zero)
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.12696
	addi	%t0, %zero, 1
	j	fbgt_cont.12697
fbgt_else.12696:
	addi	%t0, %zero, 0
fbgt_cont.12697:
	fabs	%f0, %f0
	addi	%sp, %sp, 3
	jal	reduction_2pi.2614
	addi	%sp, %sp, -3
	fblt	%f0, %f6, fbgt_else.12698
	beqi	%t0, 0, bnei_else.12700
	addi	%t0, %zero, 0
	j	bnei_cont.12701
bnei_else.12700:
	addi	%t0, %zero, 1
bnei_cont.12701:
	j	fbgt_cont.12699
fbgt_else.12698:
fbgt_cont.12699:
	fblt	%f0, %f6, fbgt_else.12702
	fsub	%f0, %f0, %f6
	j	fbgt_cont.12703
fbgt_else.12702:
fbgt_cont.12703:
	flw	%f16, 465(%zero)
	fblt	%f0, %f16, fbgt_else.12704
	fsub	%f0, %f6, %f0
	j	fbgt_cont.12705
fbgt_else.12704:
fbgt_cont.12705:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.12706
	addi	%sp, %sp, 3
	jal	kernel_sin.2608
	addi	%sp, %sp, -3
	fmov	%f1, %f0
	j	fbgt_cont.12707
fbgt_else.12706:
	fsub	%f0, %f16, %f0
	addi	%sp, %sp, 3
	jal	kernel_cos.2610
	addi	%sp, %sp, -3
	fmov	%f1, %f0
fbgt_cont.12707:
	beqi	%t0, 0, bnei_else.12708
	fmov	%f0, %f10
	fmov	%f0, %f11
	fmov	%f0, %f12
	fmov	%f0, %f13
	fmov	%f0, %f14
	fmov	%f0, %f15
	fmov	%f0, %f7
	fmov	%f0, %f8
	fmov	%f0, %f9
	flw	%f6, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%ra, 2(%sp)
	fmov	%f0, %f1
	jr	%ra
bnei_else.12708:
	fmov	%f0, %f10
	fmov	%f0, %f11
	fmov	%f0, %f12
	fmov	%f0, %f13
	fmov	%f0, %f14
	fmov	%f0, %f15
	fmov	%f0, %f7
	fmov	%f0, %f8
	fmov	%f0, %f9
	flw	%f6, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%ra, 2(%sp)
	fneg	%f0, %f1
	jr	%ra
atan.2620:
	fsw	%f0, 0(%sp)
	fsw	%f6, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f1, 482(%zero)
	flw	%f0, 0(%sp)
	fblt	%f0, %f1, fbgt_else.12709
	addi	%f0, %zero, 1
	j	fbgt_cont.12710
fbgt_else.12709:
	addi	%f0, %zero, 0
fbgt_cont.12710:
	flw	%f0, 0(%sp)
	fabs	%f16, %f0
	flw	%f0, 463(%zero)
	fblt	%f16, %f0, fbgt_else.12711
	flw	%f0, 462(%zero)
	fblt	%f16, %f0, fbgt_else.12712
	flw	%f0, 465(%zero)
	fsw	%f0, 3(%sp)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f16
	addi	%sp, %sp, 4
	jal	kernel_atan.2612
	addi	%sp, %sp, -4
	flw	%f1, 3(%sp)
	fsub	%f1, %f1, %f0
	j	fbgt_cont.12713
fbgt_else.12712:
	flw	%f0, 464(%zero)
	fsw	%f0, 4(%sp)
	flw	%f0, 477(%zero)
	fsub	%f1, %f16, %f0
	fadd	%f0, %f16, %f0
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 5
	jal	kernel_atan.2612
	addi	%sp, %sp, -5
	flw	%f1, 4(%sp)
	fadd	%f1, %f1, %f0
fbgt_cont.12713:
	beqi	%f0, 0, bnei_else.12714
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	fmov	%f0, %f1
	jr	%ra
bnei_else.12714:
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	fneg	%f0, %f1
	jr	%ra
fbgt_else.12711:
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	flw	%f0, 0(%sp)
	j	kernel_atan.2612
print_int_sub1.2622:
	sw	%v1, 0(%sp)
	sw	%ra, 1(%sp)
	blti	%v0, 10, bgti_else.12715
	addi	%a0, %v0, -10
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 1
	lw	%ra, 1(%sp)
	addi	%v0, %a0, 0
	j	print_int_sub1.2622
bgti_else.12715:
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	jr	%ra
print_int_sub2.2625:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	blti	%v0, 10, bgti_else.12716
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -10
	lw	%ra, 1(%sp)
	j	print_int_sub2.2625
bgti_else.12716:
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	jr	%ra
print_int.2627:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 2(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub1.2622
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub2.2625
	addi	%sp, %sp, -4
	sw	%v0, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.12717
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 48
	lw	%ra, 1(%sp)
	j	min_caml_print_char
bgt_else.12717:
	lw	%v1, 2(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub1.2622
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.12718
	lw	%a0, 6(%sp)
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 48
	lw	%ra, 1(%sp)
	j	min_caml_print_char
bgt_else.12718:
	lw	%v0, 5(%sp)
	addi	%sp, %sp, 7
	jal	print_int_sub2.2625
	addi	%sp, %sp, -7
	addi	%v0, %v0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 48
	lw	%ra, 1(%sp)
	j	min_caml_print_char
sgn.2629:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 2
	jal	fiszero.2599
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.12719
	lw	%ra, 1(%sp)
	flw	%f0, 482(%zero)
	jr	%ra
bnei_else.12719:
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 2
	jal	fispos.2595
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.12720
	lw	%ra, 1(%sp)
	flw	%f0, 477(%zero)
	jr	%ra
bnei_else.12720:
	lw	%ra, 1(%sp)
	flw	%f0, 461(%zero)
	jr	%ra
fneg_cond.2631:
	fmov	%f1, %f0
	beqi	%v0, 0, bnei_else.12721
	fmov	%f0, %f1
	jr	%ra
bnei_else.12721:
	fneg	%f0, %f1
	jr	%ra
add_mod5.2634:
	add	%a0, %v0, %v1
	blti	%a0, 5, bgti_else.12722
	addi	%v0, %a0, -5
	jr	%ra
bgti_else.12722:
	add	%v0, %zero, %a0
	jr	%ra
vecset.2637:
	fsw	%f0, 0(%v0)
	fsw	%f1, 1(%v0)
	fsw	%f2, 2(%v0)
	jr	%ra
vecfill.2642:
	fsw	%f0, 0(%v0)
	fsw	%f0, 1(%v0)
	fsw	%f0, 2(%v0)
	jr	%ra
vecbzero.2645:
	flw	%f0, 482(%zero)
	j	vecfill.2642
veccpy.2647:
	flw	%f0, 0(%v1)
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v1)
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v1)
	fsw	%f0, 2(%v0)
	jr	%ra
vecunit_sgn.2655:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f9, 2(%sp)
	fsw	%f8, 3(%sp)
	fsw	%f7, 4(%sp)
	fsw	%f6, 5(%sp)
	sw	%ra, 6(%sp)
	lw	%a0, 0(%sp)
	flw	%f7, 0(%a0)
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fsqr.2606
	addi	%sp, %sp, -7
	fmov	%f6, %f0
	lw	%a0, 0(%sp)
	flw	%f8, 1(%a0)
	fmov	%f0, %f8
	addi	%sp, %sp, 7
	jal	fsqr.2606
	addi	%sp, %sp, -7
	fadd	%f6, %f6, %f0
	lw	%a0, 0(%sp)
	flw	%f9, 2(%a0)
	fmov	%f0, %f9
	addi	%sp, %sp, 7
	jal	fsqr.2606
	addi	%sp, %sp, -7
	fadd	%f0, %f6, %f0
	fsqrt	%f6, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.12726
	flw	%f1, 477(%zero)
	j	bnei_cont.12727
bnei_else.12726:
	lw	%a0, 1(%sp)
	beqi	%a0, 0, bnei_else.12728
	flw	%f0, 461(%zero)
	fdiv	%f1, %f0, %f6
	j	bnei_cont.12729
bnei_else.12728:
	flw	%f0, 477(%zero)
	fdiv	%f1, %f0, %f6
bnei_cont.12729:
bnei_cont.12727:
	fmul	%f0, %f7, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 0(%a0)
	fmul	%f0, %f8, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 1(%a0)
	fmul	%f0, %f9, %f1
	flw	%f9, 2(%sp)
	flw	%f8, 3(%sp)
	flw	%f7, 4(%sp)
	flw	%f6, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%a0, 0(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
veciprod.2658:
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
veciprod2.2661:
	flw	%f16, 0(%v0)
	fmul	%f16, %f16, %f0
	flw	%f0, 1(%v0)
	fmul	%f0, %f0, %f1
	fadd	%f1, %f16, %f0
	flw	%f0, 2(%v0)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	jr	%ra
vecaccum.2666:
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
vecadd.2670:
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
vecscale.2676:
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
vecaccumv.2679:
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
o_texturetype.2683:
	lw	%v0, 0(%v0)
	jr	%ra
o_form.2685:
	lw	%v0, 1(%v0)
	jr	%ra
o_reflectiontype.2687:
	lw	%v0, 2(%v0)
	jr	%ra
o_isinvert.2689:
	add	%a0, %zero, %v0
	lw	%v0, 6(%a0)
	jr	%ra
o_isrot.2691:
	lw	%v0, 3(%v0)
	jr	%ra
o_param_a.2693:
	lw	%f0, 4(%v0)
	flw	%f0, 0(%f0)
	jr	%ra
o_param_b.2695:
	lw	%f0, 4(%v0)
	flw	%f0, 1(%f0)
	jr	%ra
o_param_c.2697:
	lw	%f0, 4(%v0)
	flw	%f0, 2(%f0)
	jr	%ra
o_param_abc.2699:
	add	%a0, %zero, %v0
	lw	%v0, 4(%a0)
	jr	%ra
o_param_x.2701:
	lw	%f0, 5(%v0)
	flw	%f0, 0(%f0)
	jr	%ra
o_param_y.2703:
	lw	%f0, 5(%v0)
	flw	%f0, 1(%f0)
	jr	%ra
o_param_z.2705:
	lw	%f0, 5(%v0)
	flw	%f0, 2(%f0)
	jr	%ra
o_diffuse.2707:
	lw	%f0, 7(%v0)
	flw	%f0, 0(%f0)
	jr	%ra
o_hilight.2709:
	lw	%f0, 7(%v0)
	flw	%f0, 1(%f0)
	jr	%ra
o_color_red.2711:
	lw	%f0, 8(%v0)
	flw	%f0, 0(%f0)
	jr	%ra
o_color_green.2713:
	lw	%f0, 8(%v0)
	flw	%f0, 1(%f0)
	jr	%ra
o_color_blue.2715:
	lw	%f0, 8(%v0)
	flw	%f0, 2(%f0)
	jr	%ra
o_param_r1.2717:
	lw	%f0, 9(%v0)
	flw	%f0, 0(%f0)
	jr	%ra
o_param_r2.2719:
	lw	%f0, 9(%v0)
	flw	%f0, 1(%f0)
	jr	%ra
o_param_r3.2721:
	lw	%f0, 9(%v0)
	flw	%f0, 2(%f0)
	jr	%ra
o_param_ctbl.2723:
	add	%a0, %zero, %v0
	lw	%v0, 10(%a0)
	jr	%ra
p_rgb.2725:
	add	%a0, %zero, %v0
	lw	%v0, 0(%a0)
	jr	%ra
p_intersection_points.2727:
	add	%a0, %zero, %v0
	lw	%v0, 1(%a0)
	jr	%ra
p_surface_ids.2729:
	add	%a0, %zero, %v0
	lw	%v0, 2(%a0)
	jr	%ra
p_calc_diffuse.2731:
	add	%a0, %zero, %v0
	lw	%v0, 3(%a0)
	jr	%ra
p_energy.2733:
	add	%a0, %zero, %v0
	lw	%v0, 4(%a0)
	jr	%ra
p_received_ray_20percent.2735:
	add	%a0, %zero, %v0
	lw	%v0, 5(%a0)
	jr	%ra
p_group_id.2737:
	lw	%f0, 6(%v0)
	lw	%v0, 0(%f0)
	jr	%ra
p_set_group_id.2739:
	lw	%f0, 6(%v0)
	sw	%v1, 0(%f0)
	jr	%ra
p_nvectors.2742:
	add	%a0, %zero, %v0
	lw	%v0, 7(%a0)
	jr	%ra
d_vec.2744:
	add	%a0, %zero, %v0
	lw	%v0, 0(%a0)
	jr	%ra
d_const.2746:
	add	%a0, %zero, %v0
	lw	%v0, 1(%a0)
	jr	%ra
r_surface_id.2748:
	lw	%v0, 0(%v0)
	jr	%ra
r_dvec.2750:
	add	%a0, %zero, %v0
	lw	%v0, 1(%a0)
	jr	%ra
r_bright.2752:
	flw	%f0, 2(%v0)
	jr	%ra
rad.2754:
	flw	%f1, 460(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
read_screen_settings.2756:
	fsw	%f15, 0(%sp)
	fsw	%f14, 1(%sp)
	fsw	%f13, 2(%sp)
	fsw	%f12, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	addi	%a0, %zero, 72
	fsw	%f0, 0(%a0)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	addi	%a0, %zero, 72
	fsw	%f0, 1(%a0)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	addi	%a0, %zero, 72
	fsw	%f0, 2(%a0)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	addi	%sp, %sp, 5
	jal	rad.2754
	addi	%sp, %sp, -5
	fmov	%f12, %f0
	fmov	%f0, %f12
	addi	%sp, %sp, 5
	jal	cos.2616
	addi	%sp, %sp, -5
	fmov	%f15, %f0
	fmov	%f0, %f12
	addi	%sp, %sp, 5
	jal	sin.2618
	addi	%sp, %sp, -5
	fmov	%f14, %f0
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	addi	%sp, %sp, 5
	jal	rad.2754
	addi	%sp, %sp, -5
	fmov	%f13, %f0
	fmov	%f0, %f13
	addi	%sp, %sp, 5
	jal	cos.2616
	addi	%sp, %sp, -5
	fmov	%f12, %f0
	fmov	%f0, %f13
	addi	%sp, %sp, 5
	jal	sin.2618
	addi	%sp, %sp, -5
	fmul	%f1, %f15, %f0
	flw	%f13, 459(%zero)
	fmul	%f1, %f1, %f13
	addi	%a0, %zero, 171
	fsw	%f1, 0(%a0)
	flw	%f1, 458(%zero)
	fmul	%f1, %f14, %f1
	addi	%a0, %zero, 171
	fsw	%f1, 1(%a0)
	fmul	%f1, %f15, %f12
	fmul	%f1, %f1, %f13
	addi	%a0, %zero, 171
	fsw	%f1, 2(%a0)
	addi	%a0, %zero, 165
	fsw	%f12, 0(%a0)
	flw	%f1, 482(%zero)
	addi	%a0, %zero, 165
	fsw	%f1, 1(%a0)
	fneg	%f1, %f0
	addi	%a0, %zero, 165
	fsw	%f1, 2(%a0)
	fneg	%f1, %f14
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 168
	fsw	%f0, 0(%a0)
	fneg	%f0, %f15
	addi	%a0, %zero, 168
	fsw	%f0, 1(%a0)
	fneg	%f0, %f14
	fmul	%f0, %f0, %f12
	addi	%a0, %zero, 168
	fsw	%f0, 2(%a0)
	addi	%a0, %zero, 72
	flw	%f1, 0(%a0)
	addi	%a0, %zero, 171
	flw	%f0, 0(%a0)
	fsub	%f0, %f1, %f0
	addi	%a0, %zero, 75
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 72
	flw	%f1, 1(%a0)
	addi	%a0, %zero, 171
	flw	%f0, 1(%a0)
	fsub	%f0, %f1, %f0
	addi	%a0, %zero, 75
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 72
	flw	%f1, 2(%a0)
	addi	%a0, %zero, 171
	flw	%f0, 2(%a0)
	fsub	%f0, %f1, %f0
	addi	%a0, %zero, 75
	flw	%f15, 0(%sp)
	flw	%f14, 1(%sp)
	flw	%f13, 2(%sp)
	flw	%f12, 3(%sp)
	lw	%ra, 4(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
read_light.2758:
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
	jal	rad.2754
	addi	%sp, %sp, -3
	fmov	%f14, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 3
	jal	sin.2618
	addi	%sp, %sp, -3
	fneg	%f0, %f0
	addi	%a0, %zero, 78
	fsw	%f0, 1(%a0)
	addi	%sp, %sp, 3
	jal	min_caml_read_float
	addi	%sp, %sp, -3
	addi	%sp, %sp, 3
	jal	rad.2754
	addi	%sp, %sp, -3
	fmov	%f15, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 3
	jal	cos.2616
	addi	%sp, %sp, -3
	fmov	%f14, %f0
	fmov	%f0, %f15
	addi	%sp, %sp, 3
	jal	sin.2618
	addi	%sp, %sp, -3
	fmul	%f0, %f14, %f0
	addi	%a0, %zero, 78
	fsw	%f0, 0(%a0)
	fmov	%f0, %f15
	addi	%sp, %sp, 3
	jal	cos.2616
	addi	%sp, %sp, -3
	fmul	%f0, %f14, %f0
	addi	%a0, %zero, 78
	fsw	%f0, 2(%a0)
	addi	%sp, %sp, 3
	jal	min_caml_read_float
	addi	%sp, %sp, -3
	addi	%a0, %zero, 81
	flw	%f15, 0(%sp)
	flw	%f14, 1(%sp)
	lw	%ra, 2(%sp)
	fsw	%f0, 0(%a0)
	jr	%ra
rotate_quadratic_matrix.2760:
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
	lw	%a0, 1(%sp)
	flw	%f10, 0(%a0)
	fmov	%f0, %f10
	addi	%sp, %sp, 13
	jal	cos.2616
	addi	%sp, %sp, -13
	fmov	%f12, %f0
	fmov	%f0, %f10
	addi	%sp, %sp, 13
	jal	sin.2618
	addi	%sp, %sp, -13
	fmov	%f9, %f0
	lw	%a0, 1(%sp)
	flw	%f10, 1(%a0)
	fmov	%f0, %f10
	addi	%sp, %sp, 13
	jal	cos.2616
	addi	%sp, %sp, -13
	fmov	%f13, %f0
	fmov	%f0, %f10
	addi	%sp, %sp, 13
	jal	sin.2618
	addi	%sp, %sp, -13
	fmov	%f15, %f0
	lw	%a0, 1(%sp)
	flw	%f11, 2(%a0)
	fmov	%f0, %f11
	addi	%sp, %sp, 13
	jal	cos.2616
	addi	%sp, %sp, -13
	fmov	%f10, %f0
	fmov	%f0, %f11
	addi	%sp, %sp, 13
	jal	sin.2618
	addi	%sp, %sp, -13
	fmul	%f1, %f13, %f10
	fsw	%f1, 13(%sp)
	fmul	%f16, %f9, %f15
	fmul	%f11, %f16, %f10
	fmul	%f1, %f12, %f0
	fsub	%f6, %f11, %f1
	fmul	%f14, %f12, %f15
	fmul	%f11, %f14, %f10
	fmul	%f1, %f9, %f0
	fadd	%f7, %f11, %f1
	fmul	%f1, %f13, %f0
	fsw	%f1, 14(%sp)
	fmul	%f11, %f16, %f0
	fmul	%f1, %f12, %f10
	fadd	%f8, %f11, %f1
	fmul	%f1, %f14, %f0
	fmul	%f0, %f9, %f10
	fsub	%f14, %f1, %f0
	fneg	%f15, %f15
	fmul	%f9, %f9, %f13
	fmul	%f10, %f12, %f13
	lw	%a0, 0(%sp)
	flw	%f11, 0(%a0)
	lw	%a0, 0(%sp)
	flw	%f12, 1(%a0)
	lw	%a0, 0(%sp)
	flw	%f13, 2(%a0)
	flw	%f0, 13(%sp)
	addi	%sp, %sp, 15
	jal	fsqr.2606
	addi	%sp, %sp, -15
	fmul	%f0, %f11, %f0
	fsw	%f0, 15(%sp)
	flw	%f0, 14(%sp)
	addi	%sp, %sp, 16
	jal	fsqr.2606
	addi	%sp, %sp, -16
	fmul	%f1, %f12, %f0
	flw	%f0, 15(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 16(%sp)
	fmov	%f0, %f15
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	fmul	%f1, %f13, %f0
	flw	%f0, 16(%sp)
	fadd	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 0(%a0)
	fmov	%f0, %f6
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	fmul	%f0, %f11, %f0
	fsw	%f0, 17(%sp)
	fmov	%f0, %f8
	addi	%sp, %sp, 18
	jal	fsqr.2606
	addi	%sp, %sp, -18
	fmul	%f1, %f12, %f0
	flw	%f0, 17(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 18(%sp)
	fmov	%f0, %f9
	addi	%sp, %sp, 19
	jal	fsqr.2606
	addi	%sp, %sp, -19
	fmul	%f1, %f13, %f0
	flw	%f0, 18(%sp)
	fadd	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 1(%a0)
	fmov	%f0, %f7
	addi	%sp, %sp, 19
	jal	fsqr.2606
	addi	%sp, %sp, -19
	fmul	%f0, %f11, %f0
	fsw	%f0, 19(%sp)
	fmov	%f0, %f14
	addi	%sp, %sp, 20
	jal	fsqr.2606
	addi	%sp, %sp, -20
	fmul	%f1, %f12, %f0
	flw	%f0, 19(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 20(%sp)
	fmov	%f0, %f10
	addi	%sp, %sp, 21
	jal	fsqr.2606
	addi	%sp, %sp, -21
	fmul	%f1, %f13, %f0
	flw	%f0, 20(%sp)
	fadd	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 2(%a0)
	flw	%f17, 468(%zero)
	fmul	%f0, %f11, %f6
	fmul	%f1, %f0, %f7
	fmul	%f0, %f12, %f8
	fmul	%f0, %f0, %f14
	fadd	%f1, %f1, %f0
	fmul	%f0, %f13, %f9
	fmul	%f0, %f0, %f10
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	lw	%a0, 1(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 13(%sp)
	fmul	%f16, %f11, %f0
	fmul	%f1, %f16, %f7
	flw	%f0, 14(%sp)
	fmul	%f12, %f12, %f0
	fmul	%f0, %f12, %f14
	fadd	%f1, %f1, %f0
	fmul	%f11, %f13, %f15
	fmul	%f0, %f11, %f10
	fadd	%f0, %f1, %f0
	fmul	%f0, %f17, %f0
	lw	%a0, 1(%sp)
	fsw	%f0, 1(%a0)
	fmul	%f1, %f16, %f6
	fmul	%f0, %f12, %f8
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f9
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
	lw	%a0, 1(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
read_nth_object.2763:
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
	lw	%a1, 11(%sp)
	beqi	%a1, -1, bnei_else.12739
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	addi	%t2, %v0, 0
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	sw	%v0, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_read_int
	addi	%sp, %sp, -13
	addi	%t3, %v0, 0
	addi	%t5, %zero, 3
	flw	%f6, 482(%zero)
	addi	%v0, %t5, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	addi	%t0, %v0, 0
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 0(%t0)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 1(%t0)
	addi	%t1, %zero, 2
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 2(%t0)
	addi	%v0, %t5, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	addi	%t6, %v0, 0
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 0(%t6)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 1(%t6)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	fsw	%f0, 2(%t6)
	addi	%sp, %sp, 13
	jal	min_caml_read_float
	addi	%sp, %sp, -13
	addi	%sp, %sp, 13
	jal	fisneg.2597
	addi	%sp, %sp, -13
	sw	%v0, 13(%sp)
	addi	%v0, %t1, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	addi	%t4, %v0, 0
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 0(%t4)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 1(%t4)
	addi	%v0, %t5, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	addi	%t1, %v0, 0
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 0(%t1)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 1(%t1)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	fsw	%f0, 2(%t1)
	addi	%v0, %t5, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	addi	%t5, %v0, 0
	beqi	%t3, 0, bnei_else.12740
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	addi	%sp, %sp, 14
	jal	rad.2754
	addi	%sp, %sp, -14
	fsw	%f0, 0(%t5)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	addi	%sp, %sp, 14
	jal	rad.2754
	addi	%sp, %sp, -14
	fsw	%f0, 1(%t5)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	addi	%sp, %sp, 14
	jal	rad.2754
	addi	%sp, %sp, -14
	fsw	%f0, 2(%t5)
	j	bnei_cont.12741
bnei_else.12740:
bnei_cont.12741:
	beqi	%t2, 2, bnei_else.12742
	lw	%a0, 13(%sp)
	j	bnei_cont.12743
bnei_else.12742:
	addi	%a0, %zero, 1
bnei_cont.12743:
	sw	%a0, 14(%sp)
	addi	%v0, %zero, 4
	fmov	%f0, %f6
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	add	%a0, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%a0)
	sw	%t5, 9(%a0)
	sw	%t1, 8(%a0)
	sw	%t4, 7(%a0)
	lw	%a1, 14(%sp)
	sw	%a1, 6(%a0)
	sw	%t6, 5(%a0)
	sw	%t0, 4(%a0)
	sw	%t3, 3(%a0)
	lw	%a1, 12(%sp)
	sw	%a1, 2(%a0)
	sw	%t2, 1(%a0)
	lw	%a1, 11(%sp)
	sw	%a1, 0(%a0)
	addi	%a2, %zero, 12
	lw	%a1, 0(%sp)
	add	%at, %a2, %a1
	sw	%a0, 0(%at)
	beqi	%t2, 3, bnei_else.12744
	beqi	%t2, 2, bnei_else.12746
	j	bnei_cont.12747
bnei_else.12746:
	lw	%a0, 13(%sp)
	beqi	%a0, 0, bnei_else.12748
	addi	%v1, %zero, 0
	j	bnei_cont.12749
bnei_else.12748:
	addi	%v1, %zero, 1
bnei_cont.12749:
	addi	%v0, %t0, 0
	addi	%sp, %sp, 15
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -15
bnei_cont.12747:
	j	bnei_cont.12745
bnei_else.12744:
	flw	%f7, 0(%t0)
	fmov	%f0, %f7
	addi	%sp, %sp, 15
	jal	fiszero.2599
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.12750
	fmov	%f0, %f6
	j	bnei_cont.12751
bnei_else.12750:
	fmov	%f0, %f7
	addi	%sp, %sp, 15
	jal	sgn.2629
	addi	%sp, %sp, -15
	fsw	%f0, 15(%sp)
	fmov	%f0, %f7
	addi	%sp, %sp, 16
	jal	fsqr.2606
	addi	%sp, %sp, -16
	flw	%f1, 15(%sp)
	fdiv	%f0, %f1, %f0
bnei_cont.12751:
	fsw	%f0, 0(%t0)
	flw	%f7, 1(%t0)
	fmov	%f0, %f7
	addi	%sp, %sp, 16
	jal	fiszero.2599
	addi	%sp, %sp, -16
	beqi	%v0, 0, bnei_else.12752
	fmov	%f0, %f6
	j	bnei_cont.12753
bnei_else.12752:
	fmov	%f0, %f7
	addi	%sp, %sp, 16
	jal	sgn.2629
	addi	%sp, %sp, -16
	fsw	%f0, 16(%sp)
	fmov	%f0, %f7
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	flw	%f1, 16(%sp)
	fdiv	%f0, %f1, %f0
bnei_cont.12753:
	fsw	%f0, 1(%t0)
	flw	%f7, 2(%t0)
	fmov	%f0, %f7
	addi	%sp, %sp, 17
	jal	fiszero.2599
	addi	%sp, %sp, -17
	beqi	%v0, 0, bnei_else.12754
	j	bnei_cont.12755
bnei_else.12754:
	fmov	%f0, %f7
	addi	%sp, %sp, 17
	jal	sgn.2629
	addi	%sp, %sp, -17
	fmov	%f6, %f0
	fmov	%f0, %f7
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	fdiv	%f6, %f6, %f0
bnei_cont.12755:
	fsw	%f6, 2(%t0)
bnei_cont.12745:
	beqi	%t3, 0, bnei_else.12756
	addi	%v1, %t5, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2760
	addi	%sp, %sp, -17
	j	bnei_cont.12757
bnei_else.12756:
bnei_cont.12757:
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
bnei_else.12739:
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
read_object.2765:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	blti	%v0, 60, bgti_else.12758
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.12758:
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2763
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.12760
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	lw	%ra, 1(%sp)
	j	read_object.2765
bnei_else.12760:
	addi	%a0, %zero, 0
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	sw	%v0, 0(%a0)
	jr	%ra
read_all_object.2767:
	addi	%v0, %zero, 0
	j	read_object.2765
read_net_item.2769:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	sw	%v0, 2(%sp)
	addi	%v1, %zero, -1
	lw	%a1, 2(%sp)
	beqi	%a1, -1, bnei_else.12762
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	addi	%sp, %sp, 3
	jal	read_net_item.2769
	addi	%sp, %sp, -3
	lw	%a1, 2(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%a1, 0(%at)
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.12762:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	j	min_caml_create_array
read_or_network.2771:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	read_net_item.2769
	addi	%sp, %sp, -2
	sw	%v0, 2(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.12763
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	addi	%sp, %sp, 3
	jal	read_or_network.2771
	addi	%sp, %sp, -3
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%v1, 0(%at)
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.12763:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	lw	%v1, 2(%sp)
	j	min_caml_create_array
read_and_network.2773:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	read_net_item.2769
	addi	%sp, %sp, -2
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.12764
	addi	%a1, %zero, 83
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	j	read_and_network.2773
bnei_else.12764:
	lw	%ra, 1(%sp)
	jr	%ra
read_parameter.2775:
	sw	%t6, 0(%sp)
	sw	%t5, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_screen_settings.2756
	addi	%sp, %sp, -3
	addi	%sp, %sp, 3
	jal	read_light.2758
	addi	%sp, %sp, -3
	addi	%sp, %sp, 3
	jal	read_all_object.2767
	addi	%sp, %sp, -3
	addi	%t5, %zero, 0
	addi	%v0, %t5, 0
	addi	%sp, %sp, 3
	jal	read_and_network.2773
	addi	%sp, %sp, -3
	addi	%v0, %t5, 0
	addi	%sp, %sp, 3
	jal	read_or_network.2771
	addi	%sp, %sp, -3
	addi	%a0, %zero, 134
	lw	%t6, 0(%sp)
	lw	%t5, 1(%sp)
	lw	%ra, 2(%sp)
	sw	%v0, 0(%a0)
	jr	%ra
solver_rect_surface.2777:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%a2, 7(%sp)
	sw	%t0, 8(%sp)
	sw	%ra, 9(%sp)
	lw	%a0, 5(%sp)
	lw	%a1, 4(%sp)
	add	%at, %a1, %a0
	flw	%f0, 0(%at)
	fsw	%f0, 10(%sp)
	flw	%f0, 10(%sp)
	addi	%sp, %sp, 11
	jal	fiszero.2599
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.12767
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12767:
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 11
	jal	o_param_abc.2699
	addi	%sp, %sp, -11
	sw	%v0, 11(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 12
	jal	o_isinvert.2689
	addi	%sp, %sp, -12
	sw	%v0, 12(%sp)
	flw	%f0, 10(%sp)
	addi	%sp, %sp, 13
	jal	fisneg.2597
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0
	lw	%v0, 12(%sp)
	addi	%sp, %sp, 13
	jal	xor.2601
	addi	%sp, %sp, -13
	lw	%a1, 11(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a1, %a0
	flw	%f0, 0(%at)
	addi	%sp, %sp, 13
	jal	fneg_cond.2631
	addi	%sp, %sp, -13
	flw	%f1, 0(%sp)
	fsub	%f1, %f0, %f1
	flw	%f0, 10(%sp)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 13(%sp)
	lw	%a0, 6(%sp)
	lw	%a1, 4(%sp)
	add	%at, %a1, %a0
	flw	%f0, 0(%at)
	flw	%f1, 13(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 1(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	lw	%a1, 11(%sp)
	lw	%a0, 6(%sp)
	add	%at, %a1, %a0
	flw	%f1, 0(%at)
	addi	%sp, %sp, 14
	jal	fless.2592
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.12768
	lw	%a0, 7(%sp)
	lw	%a1, 4(%sp)
	add	%at, %a1, %a0
	flw	%f0, 0(%at)
	flw	%f1, 13(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 2(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	lw	%a1, 11(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a1, %a0
	flw	%f1, 0(%at)
	addi	%sp, %sp, 14
	jal	fless.2592
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.12769
	addi	%a0, %zero, 135
	flw	%f1, 13(%sp)
	fsw	%f1, 0(%a0)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12769:
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12768:
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_rect.2786:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 8(%sp)
	addi	%a0, %zero, 1
	sw	%a0, 9(%sp)
	addi	%a0, %zero, 2
	sw	%a0, 10(%sp)
	flw	%f0, 2(%sp)
	flw	%f17, 1(%sp)
	flw	%f16, 0(%sp)
	lw	%a0, 10(%sp)
	lw	%k0, 9(%sp)
	lw	%a3, 8(%sp)
	lw	%v1, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%a2, %a0, 0
	addi	%a1, %k0, 0
	addi	%a0, %a3, 0
	fmov	%f2, %f0
	fmov	%f1, %f17
	fmov	%f0, %f16
	addi	%sp, %sp, 11
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.12770
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12770:
	flw	%f16, 0(%sp)
	flw	%f0, 2(%sp)
	flw	%f17, 1(%sp)
	lw	%a3, 8(%sp)
	lw	%a0, 10(%sp)
	lw	%k0, 9(%sp)
	lw	%v1, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%a2, %a3, 0
	addi	%a1, %a0, 0
	addi	%a0, %k0, 0
	fmov	%f2, %f16
	fmov	%f1, %f0
	fmov	%f0, %f17
	addi	%sp, %sp, 11
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.12771
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.12771:
	flw	%f17, 1(%sp)
	flw	%f16, 0(%sp)
	flw	%f0, 2(%sp)
	lw	%k0, 9(%sp)
	lw	%a3, 8(%sp)
	lw	%a0, 10(%sp)
	lw	%v1, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%a2, %k0, 0
	addi	%a1, %a3, 0
	fmov	%f2, %f17
	fmov	%f1, %f16
	addi	%sp, %sp, 11
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.12772
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.12772:
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_surface.2792:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_abc.2699
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	lw	%v0, 5(%sp)
	lw	%a0, 3(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	addi	%sp, %sp, 6
	jal	veciprod.2658
	addi	%sp, %sp, -6
	fsw	%f0, 6(%sp)
	flw	%f0, 6(%sp)
	addi	%sp, %sp, 7
	jal	fispos.2595
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.12773
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 5(%sp)
	addi	%sp, %sp, 7
	jal	veciprod2.2661
	addi	%sp, %sp, -7
	fneg	%f1, %f0
	flw	%f0, 6(%sp)
	fdiv	%f0, %f1, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12773:
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 0
	jr	%ra
quadratic.2798:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f9, 4(%sp)
	fsw	%f8, 5(%sp)
	fsw	%f7, 6(%sp)
	fsw	%f6, 7(%sp)
	sw	%ra, 8(%sp)
	flw	%f16, 0(%sp)
	fmov	%f0, %f16
	addi	%sp, %sp, 9
	jal	fsqr.2606
	addi	%sp, %sp, -9
	fmov	%f6, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	o_param_a.2693
	addi	%sp, %sp, -9
	fmul	%f0, %f6, %f0
	fsw	%f0, 9(%sp)
	flw	%f1, 1(%sp)
	fmov	%f0, %f1
	addi	%sp, %sp, 10
	jal	fsqr.2606
	addi	%sp, %sp, -10
	fmov	%f6, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 10
	jal	o_param_b.2695
	addi	%sp, %sp, -10
	fmul	%f1, %f6, %f0
	flw	%f0, 9(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 10(%sp)
	flw	%f0, 2(%sp)
	addi	%sp, %sp, 11
	jal	fsqr.2606
	addi	%sp, %sp, -11
	fmov	%f6, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 11
	jal	o_param_c.2697
	addi	%sp, %sp, -11
	fmul	%f1, %f6, %f0
	flw	%f0, 10(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 11(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 12
	jal	o_isrot.2691
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.12774
	flw	%f1, 1(%sp)
	flw	%f0, 2(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 12(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 13
	jal	o_param_r1.2717
	addi	%sp, %sp, -13
	flw	%f1, 12(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 11(%sp)
	fadd	%f6, %f0, %f1
	flw	%f0, 2(%sp)
	flw	%f16, 0(%sp)
	fmul	%f7, %f0, %f16
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 13
	jal	o_param_r2.2719
	addi	%sp, %sp, -13
	fmul	%f0, %f7, %f0
	fadd	%f0, %f6, %f0
	fsw	%f0, 13(%sp)
	flw	%f16, 0(%sp)
	flw	%f1, 1(%sp)
	fmul	%f6, %f16, %f1
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r3.2721
	addi	%sp, %sp, -14
	fmul	%f1, %f6, %f0
	flw	%f9, 4(%sp)
	flw	%f8, 5(%sp)
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	flw	%f0, 13(%sp)
	fadd	%f0, %f0, %f1
	jr	%ra
bnei_else.12774:
	flw	%f9, 4(%sp)
	flw	%f8, 5(%sp)
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	flw	%f0, 11(%sp)
	jr	%ra
bilinear.2803:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f3, 3(%sp)
	fsw	%f4, 4(%sp)
	fsw	%f5, 5(%sp)
	sw	%v0, 6(%sp)
	fsw	%f12, 7(%sp)
	fsw	%f11, 8(%sp)
	fsw	%f10, 9(%sp)
	fsw	%f9, 10(%sp)
	fsw	%f8, 11(%sp)
	fsw	%f7, 12(%sp)
	fsw	%f6, 13(%sp)
	sw	%ra, 14(%sp)
	flw	%f1, 0(%sp)
	flw	%f0, 3(%sp)
	fmul	%f10, %f1, %f0
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 15
	jal	o_param_a.2693
	addi	%sp, %sp, -15
	fmul	%f0, %f10, %f0
	fsw	%f0, 15(%sp)
	flw	%f10, 1(%sp)
	flw	%f0, 4(%sp)
	fmul	%f10, %f10, %f0
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 16
	jal	o_param_b.2695
	addi	%sp, %sp, -16
	fmul	%f1, %f10, %f0
	flw	%f0, 15(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 16(%sp)
	flw	%f10, 2(%sp)
	flw	%f0, 5(%sp)
	fmul	%f10, %f10, %f0
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 17
	jal	o_param_c.2697
	addi	%sp, %sp, -17
	fmul	%f1, %f10, %f0
	flw	%f0, 16(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 17(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 18
	jal	o_isrot.2691
	addi	%sp, %sp, -18
	beqi	%v0, 0, bnei_else.12775
	flw	%f10, 2(%sp)
	flw	%f0, 4(%sp)
	fmul	%f1, %f10, %f0
	flw	%f10, 1(%sp)
	flw	%f0, 5(%sp)
	fmul	%f0, %f10, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 18(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 19
	jal	o_param_r1.2717
	addi	%sp, %sp, -19
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 19(%sp)
	flw	%f1, 0(%sp)
	flw	%f0, 5(%sp)
	fmul	%f1, %f1, %f0
	flw	%f10, 2(%sp)
	flw	%f0, 3(%sp)
	fmul	%f0, %f10, %f0
	fadd	%f10, %f1, %f0
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 20
	jal	o_param_r2.2719
	addi	%sp, %sp, -20
	fmul	%f1, %f10, %f0
	flw	%f0, 19(%sp)
	fadd	%f11, %f0, %f1
	flw	%f1, 0(%sp)
	flw	%f0, 4(%sp)
	fmul	%f1, %f1, %f0
	flw	%f10, 1(%sp)
	flw	%f0, 3(%sp)
	fmul	%f0, %f10, %f0
	fadd	%f10, %f1, %f0
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 20
	jal	o_param_r3.2721
	addi	%sp, %sp, -20
	fmul	%f0, %f10, %f0
	fadd	%f0, %f11, %f0
	addi	%sp, %sp, 20
	jal	fhalf.2604
	addi	%sp, %sp, -20
	flw	%f12, 7(%sp)
	flw	%f11, 8(%sp)
	flw	%f10, 9(%sp)
	flw	%f9, 10(%sp)
	flw	%f8, 11(%sp)
	flw	%f7, 12(%sp)
	flw	%f6, 13(%sp)
	lw	%ra, 14(%sp)
	flw	%f1, 17(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
bnei_else.12775:
	flw	%f12, 7(%sp)
	flw	%f11, 8(%sp)
	flw	%f10, 9(%sp)
	flw	%f9, 10(%sp)
	flw	%f8, 11(%sp)
	flw	%f7, 12(%sp)
	flw	%f6, 13(%sp)
	lw	%ra, 14(%sp)
	flw	%f1, 17(%sp)
	fmov	%f0, %f1
	jr	%ra
solver_second.2811:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f9, 4(%sp)
	fsw	%f8, 5(%sp)
	fsw	%f7, 6(%sp)
	fsw	%f6, 7(%sp)
	sw	%ra, 8(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 9(%sp)
	flw	%f0, 1(%v1)
	fsw	%f0, 10(%sp)
	flw	%f0, 2(%v1)
	fsw	%f0, 11(%sp)
	flw	%f18, 11(%sp)
	flw	%f17, 10(%sp)
	flw	%f16, 9(%sp)
	lw	%v0, 3(%sp)
	fmov	%f2, %f18
	fmov	%f1, %f17
	fmov	%f0, %f16
	addi	%sp, %sp, 12
	jal	quadratic.2798
	addi	%sp, %sp, -12
	fsw	%f0, 12(%sp)
	flw	%f1, 12(%sp)
	fmov	%f0, %f1
	addi	%sp, %sp, 13
	jal	fiszero.2599
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.12776
	flw	%f9, 4(%sp)
	flw	%f8, 5(%sp)
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12776:
	flw	%f18, 11(%sp)
	flw	%f17, 10(%sp)
	flw	%f16, 9(%sp)
	lw	%v0, 3(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	fmov	%f5, %f2
	fmov	%f4, %f1
	fmov	%f3, %f0
	fmov	%f2, %f18
	fmov	%f1, %f17
	fmov	%f0, %f16
	addi	%sp, %sp, 13
	jal	bilinear.2803
	addi	%sp, %sp, -13
	fsw	%f0, 13(%sp)
	lw	%v0, 3(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 14
	jal	quadratic.2798
	addi	%sp, %sp, -14
	fmov	%f6, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 14
	jal	o_form.2685
	addi	%sp, %sp, -14
	beqi	%v0, 3, bnei_else.12777
	j	bnei_cont.12778
bnei_else.12777:
	flw	%f0, 477(%zero)
	fsub	%f6, %f6, %f0
bnei_cont.12778:
	flw	%f0, 13(%sp)
	addi	%sp, %sp, 14
	jal	fsqr.2606
	addi	%sp, %sp, -14
	flw	%f1, 12(%sp)
	fmul	%f1, %f1, %f6
	fsub	%f0, %f0, %f1
	fsw	%f0, 14(%sp)
	flw	%f0, 14(%sp)
	addi	%sp, %sp, 15
	jal	fispos.2595
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.12779
	flw	%f0, 14(%sp)
	fsqrt	%f6, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 15
	jal	o_isinvert.2689
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.12780
	j	bnei_cont.12781
bnei_else.12780:
	fneg	%f6, %f6
bnei_cont.12781:
	flw	%f0, 13(%sp)
	fsub	%f0, %f6, %f0
	flw	%f1, 12(%sp)
	fdiv	%f0, %f0, %f1
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	flw	%f9, 4(%sp)
	flw	%f8, 5(%sp)
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12779:
	flw	%f9, 4(%sp)
	flw	%f8, 5(%sp)
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver.2817:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	fsw	%f8, 2(%sp)
	fsw	%f7, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%a0, %zero, 12
	add	%at, %a0, %v0
	lw	%at, 0(%at)
	lw	%a0, 1(%sp)
	flw	%f6, 0(%a0)
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	o_param_x.2701
	addi	%sp, %sp, -6
	fsub	%f0, %f6, %f0
	fsw	%f0, 6(%sp)
	lw	%a0, 1(%sp)
	flw	%f6, 1(%a0)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	o_param_y.2703
	addi	%sp, %sp, -7
	fsub	%f0, %f6, %f0
	fsw	%f0, 7(%sp)
	lw	%a0, 1(%sp)
	flw	%f6, 2(%a0)
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	o_param_z.2705
	addi	%sp, %sp, -8
	fsub	%f0, %f6, %f0
	fsw	%f0, 8(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	o_form.2685
	addi	%sp, %sp, -9
	sw	%v0, 9(%sp)
	lw	%a0, 9(%sp)
	beqi	%a0, 1, bnei_else.12782
	lw	%a0, 9(%sp)
	beqi	%a0, 2, bnei_else.12783
	flw	%f8, 2(%sp)
	flw	%f7, 3(%sp)
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	flw	%f2, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 6(%sp)
	addi	%v0, %at, 0
	j	solver_second.2811
bnei_else.12783:
	flw	%f8, 2(%sp)
	flw	%f7, 3(%sp)
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	flw	%f2, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 6(%sp)
	addi	%v0, %at, 0
	j	solver_surface.2792
bnei_else.12782:
	flw	%f8, 2(%sp)
	flw	%f7, 3(%sp)
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	flw	%f2, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 6(%sp)
	addi	%v0, %at, 0
	j	solver_rect.2786
solver_rect_fast.2821:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	fsw	%f8, 6(%sp)
	fsw	%f7, 7(%sp)
	fsw	%f6, 8(%sp)
	sw	%ra, 9(%sp)
	lw	%a0, 5(%sp)
	flw	%f0, 0(%a0)
	flw	%f1, 0(%sp)
	fsub	%f1, %f0, %f1
	lw	%a0, 5(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 10(%sp)
	flw	%f0, 10(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 11(%sp)
	lw	%a0, 4(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 12(%sp)
	flw	%f16, 11(%sp)
	flw	%f1, 12(%sp)
	fmul	%f0, %f16, %f1
	flw	%f1, 1(%sp)
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fsw	%f0, 13(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 14
	jal	o_param_b.2695
	addi	%sp, %sp, -14
	fmov	%f1, %f0
	flw	%f0, 13(%sp)
	addi	%sp, %sp, 14
	jal	fless.2592
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.12784
	lw	%a0, 4(%sp)
	flw	%f0, 2(%a0)
	flw	%f16, 11(%sp)
	fmul	%f0, %f16, %f0
	flw	%f1, 2(%sp)
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fsw	%f0, 14(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 15
	jal	o_param_c.2697
	addi	%sp, %sp, -15
	fmov	%f1, %f0
	flw	%f0, 14(%sp)
	addi	%sp, %sp, 15
	jal	fless.2592
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.12786
	flw	%f0, 10(%sp)
	addi	%sp, %sp, 15
	jal	fiszero.2599
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.12788
	addi	%a0, %zero, 0
	j	bnei_cont.12789
bnei_else.12788:
	addi	%a0, %zero, 1
bnei_cont.12789:
	j	bnei_cont.12787
bnei_else.12786:
	addi	%a0, %zero, 0
bnei_cont.12787:
	j	bnei_cont.12785
bnei_else.12784:
	addi	%a0, %zero, 0
bnei_cont.12785:
	beqi	%a0, 0, bnei_else.12790
	addi	%a0, %zero, 135
	flw	%f16, 11(%sp)
	fsw	%f16, 0(%a0)
	flw	%f8, 6(%sp)
	flw	%f7, 7(%sp)
	flw	%f6, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12790:
	lw	%a0, 5(%sp)
	flw	%f0, 2(%a0)
	flw	%f1, 1(%sp)
	fsub	%f1, %f0, %f1
	lw	%a0, 5(%sp)
	flw	%f0, 3(%a0)
	fsw	%f0, 15(%sp)
	flw	%f0, 15(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 16(%sp)
	lw	%a0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 17(%sp)
	flw	%f16, 16(%sp)
	flw	%f1, 17(%sp)
	fmul	%f0, %f16, %f1
	flw	%f1, 0(%sp)
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fsw	%f0, 18(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 19
	jal	o_param_a.2693
	addi	%sp, %sp, -19
	fmov	%f1, %f0
	flw	%f0, 18(%sp)
	addi	%sp, %sp, 19
	jal	fless.2592
	addi	%sp, %sp, -19
	beqi	%v0, 0, bnei_else.12791
	lw	%a0, 4(%sp)
	flw	%f0, 2(%a0)
	flw	%f16, 16(%sp)
	fmul	%f0, %f16, %f0
	flw	%f1, 2(%sp)
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fsw	%f0, 19(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 20
	jal	o_param_c.2697
	addi	%sp, %sp, -20
	fmov	%f1, %f0
	flw	%f0, 19(%sp)
	addi	%sp, %sp, 20
	jal	fless.2592
	addi	%sp, %sp, -20
	beqi	%v0, 0, bnei_else.12793
	flw	%f0, 15(%sp)
	addi	%sp, %sp, 20
	jal	fiszero.2599
	addi	%sp, %sp, -20
	beqi	%v0, 0, bnei_else.12795
	addi	%a0, %zero, 0
	j	bnei_cont.12796
bnei_else.12795:
	addi	%a0, %zero, 1
bnei_cont.12796:
	j	bnei_cont.12794
bnei_else.12793:
	addi	%a0, %zero, 0
bnei_cont.12794:
	j	bnei_cont.12792
bnei_else.12791:
	addi	%a0, %zero, 0
bnei_cont.12792:
	beqi	%a0, 0, bnei_else.12797
	addi	%a0, %zero, 135
	flw	%f16, 16(%sp)
	fsw	%f16, 0(%a0)
	flw	%f8, 6(%sp)
	flw	%f7, 7(%sp)
	flw	%f6, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.12797:
	lw	%a0, 5(%sp)
	flw	%f0, 4(%a0)
	flw	%f1, 2(%sp)
	fsub	%f1, %f0, %f1
	lw	%a0, 5(%sp)
	flw	%f0, 5(%a0)
	fsw	%f0, 20(%sp)
	flw	%f0, 20(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 21(%sp)
	flw	%f1, 17(%sp)
	flw	%f0, 21(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 0(%sp)
	fadd	%f0, %f0, %f1
	fabs	%f6, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 22
	jal	o_param_a.2693
	addi	%sp, %sp, -22
	fmov	%f1, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 22
	jal	fless.2592
	addi	%sp, %sp, -22
	beqi	%v0, 0, bnei_else.12798
	flw	%f1, 12(%sp)
	flw	%f0, 21(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%sp)
	fadd	%f0, %f0, %f1
	fabs	%f6, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 22
	jal	o_param_b.2695
	addi	%sp, %sp, -22
	fmov	%f1, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 22
	jal	fless.2592
	addi	%sp, %sp, -22
	beqi	%v0, 0, bnei_else.12800
	flw	%f0, 20(%sp)
	addi	%sp, %sp, 22
	jal	fiszero.2599
	addi	%sp, %sp, -22
	beqi	%v0, 0, bnei_else.12802
	addi	%a0, %zero, 0
	j	bnei_cont.12803
bnei_else.12802:
	addi	%a0, %zero, 1
bnei_cont.12803:
	j	bnei_cont.12801
bnei_else.12800:
	addi	%a0, %zero, 0
bnei_cont.12801:
	j	bnei_cont.12799
bnei_else.12798:
	addi	%a0, %zero, 0
bnei_cont.12799:
	beqi	%a0, 0, bnei_else.12804
	addi	%a0, %zero, 135
	flw	%f0, 21(%sp)
	fsw	%f0, 0(%a0)
	flw	%f8, 6(%sp)
	flw	%f7, 7(%sp)
	flw	%f6, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.12804:
	flw	%f8, 6(%sp)
	flw	%f7, 7(%sp)
	flw	%f6, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_surface_fast.2828:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%ra, 4(%sp)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	addi	%sp, %sp, 5
	jal	fisneg.2597
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.12805
	lw	%a0, 3(%sp)
	flw	%f1, 1(%a0)
	flw	%f0, 0(%sp)
	fmul	%f16, %f1, %f0
	lw	%a0, 3(%sp)
	flw	%f1, 2(%a0)
	flw	%f0, 1(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	lw	%a0, 3(%sp)
	flw	%f1, 3(%a0)
	flw	%f0, 2(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12805:
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2834:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	fsw	%f9, 5(%sp)
	fsw	%f8, 6(%sp)
	fsw	%f7, 7(%sp)
	fsw	%f6, 8(%sp)
	sw	%ra, 9(%sp)
	lw	%a0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 10(%sp)
	flw	%f1, 10(%sp)
	fmov	%f0, %f1
	addi	%sp, %sp, 11
	jal	fiszero.2599
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.12806
	flw	%f9, 5(%sp)
	flw	%f8, 6(%sp)
	flw	%f7, 7(%sp)
	flw	%f6, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12806:
	lw	%a0, 4(%sp)
	flw	%f1, 1(%a0)
	flw	%f0, 0(%sp)
	fmul	%f16, %f1, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 2(%a0)
	flw	%f1, 1(%sp)
	fmul	%f0, %f0, %f1
	fadd	%f1, %f16, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 3(%a0)
	flw	%f2, 2(%sp)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 11(%sp)
	lw	%v0, 3(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 12
	jal	quadratic.2798
	addi	%sp, %sp, -12
	fmov	%f6, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 12
	jal	o_form.2685
	addi	%sp, %sp, -12
	beqi	%v0, 3, bnei_else.12807
	j	bnei_cont.12808
bnei_else.12807:
	flw	%f0, 477(%zero)
	fsub	%f6, %f6, %f0
bnei_cont.12808:
	flw	%f0, 11(%sp)
	addi	%sp, %sp, 12
	jal	fsqr.2606
	addi	%sp, %sp, -12
	flw	%f1, 10(%sp)
	fmul	%f1, %f1, %f6
	fsub	%f0, %f0, %f1
	fsw	%f0, 12(%sp)
	flw	%f0, 12(%sp)
	addi	%sp, %sp, 13
	jal	fispos.2595
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.12809
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 13
	jal	o_isinvert.2689
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.12810
	flw	%f0, 12(%sp)
	fsqrt	%f1, %f0
	flw	%f0, 11(%sp)
	fadd	%f1, %f0, %f1
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	j	bnei_cont.12811
bnei_else.12810:
	flw	%f0, 12(%sp)
	fsqrt	%f1, %f0
	flw	%f0, 11(%sp)
	fsub	%f1, %f0, %f1
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
bnei_cont.12811:
	flw	%f9, 5(%sp)
	flw	%f8, 6(%sp)
	flw	%f7, 7(%sp)
	flw	%f6, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12809:
	flw	%f9, 5(%sp)
	flw	%f8, 6(%sp)
	flw	%f7, 7(%sp)
	flw	%f6, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_fast.2840:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	fsw	%f8, 3(%sp)
	fsw	%f7, 4(%sp)
	fsw	%f6, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%a1, %zero, 12
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	lw	%a0, 2(%sp)
	flw	%f6, 0(%a0)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	o_param_x.2701
	addi	%sp, %sp, -7
	fsub	%f0, %f6, %f0
	fsw	%f0, 7(%sp)
	lw	%a0, 2(%sp)
	flw	%f6, 1(%a0)
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	o_param_y.2703
	addi	%sp, %sp, -8
	fsub	%f0, %f6, %f0
	fsw	%f0, 8(%sp)
	lw	%a0, 2(%sp)
	flw	%f6, 2(%a0)
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	o_param_z.2705
	addi	%sp, %sp, -9
	fsub	%f0, %f6, %f0
	fsw	%f0, 9(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	d_const.2746
	addi	%sp, %sp, -10
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	o_form.2685
	addi	%sp, %sp, -10
	sw	%v0, 10(%sp)
	lw	%a0, 10(%sp)
	beqi	%a0, 1, bnei_else.12812
	lw	%a0, 10(%sp)
	beqi	%a0, 2, bnei_else.12813
	flw	%f8, 3(%sp)
	flw	%f7, 4(%sp)
	flw	%f6, 5(%sp)
	lw	%ra, 6(%sp)
	flw	%f2, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f0, 7(%sp)
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	j	solver_second_fast.2834
bnei_else.12813:
	flw	%f8, 3(%sp)
	flw	%f7, 4(%sp)
	flw	%f6, 5(%sp)
	lw	%ra, 6(%sp)
	flw	%f2, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f0, 7(%sp)
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	j	solver_surface_fast.2828
bnei_else.12812:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 11
	jal	d_vec.2744
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0
	flw	%f8, 3(%sp)
	flw	%f7, 4(%sp)
	flw	%f6, 5(%sp)
	lw	%ra, 6(%sp)
	flw	%f2, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f0, 7(%sp)
	addi	%a0, %at, 0
	addi	%v0, %at, 0
	j	solver_rect_fast.2821
solver_surface_fast2.2844:
	sw	%a0, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 2(%sp)
	flw	%f0, 2(%sp)
	addi	%sp, %sp, 3
	jal	fisneg.2597
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.12814
	lw	%a0, 0(%sp)
	flw	%f1, 3(%a0)
	flw	%f0, 2(%sp)
	fmul	%f0, %f0, %f1
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12814:
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2851:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	fsw	%f7, 6(%sp)
	fsw	%f6, 7(%sp)
	sw	%ra, 8(%sp)
	lw	%a0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 9(%sp)
	flw	%f1, 9(%sp)
	fmov	%f0, %f1
	addi	%sp, %sp, 10
	jal	fiszero.2599
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.12815
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12815:
	lw	%a0, 4(%sp)
	flw	%f1, 1(%a0)
	flw	%f0, 0(%sp)
	fmul	%f16, %f1, %f0
	lw	%a0, 4(%sp)
	flw	%f1, 2(%a0)
	flw	%f0, 1(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	lw	%a0, 4(%sp)
	flw	%f1, 3(%a0)
	flw	%f0, 2(%sp)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 10(%sp)
	lw	%a0, 5(%sp)
	flw	%f6, 3(%a0)
	flw	%f0, 10(%sp)
	addi	%sp, %sp, 11
	jal	fsqr.2606
	addi	%sp, %sp, -11
	flw	%f1, 9(%sp)
	fmul	%f1, %f1, %f6
	fsub	%f0, %f0, %f1
	fsw	%f0, 11(%sp)
	flw	%f0, 11(%sp)
	addi	%sp, %sp, 12
	jal	fispos.2595
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.12816
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 12
	jal	o_isinvert.2689
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.12817
	flw	%f0, 11(%sp)
	fsqrt	%f1, %f0
	flw	%f0, 10(%sp)
	fadd	%f1, %f0, %f1
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	j	bnei_cont.12818
bnei_else.12817:
	flw	%f0, 11(%sp)
	fsqrt	%f1, %f0
	flw	%f0, 10(%sp)
	fsub	%f1, %f0, %f1
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
bnei_cont.12818:
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12816:
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2858:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%a1, %zero, 12
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 3
	jal	o_param_ctbl.2723
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	lw	%a0, 3(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 4(%sp)
	lw	%a0, 3(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 5(%sp)
	lw	%a0, 3(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 6(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	d_const.2746
	addi	%sp, %sp, -7
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	o_form.2685
	addi	%sp, %sp, -7
	sw	%v0, 7(%sp)
	lw	%a0, 7(%sp)
	beqi	%a0, 1, bnei_else.12819
	lw	%a0, 7(%sp)
	beqi	%a0, 2, bnei_else.12820
	lw	%ra, 2(%sp)
	flw	%f2, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f0, 4(%sp)
	lw	%a0, 3(%sp)
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	j	solver_second_fast2.2851
bnei_else.12820:
	lw	%ra, 2(%sp)
	flw	%f2, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f0, 4(%sp)
	lw	%a0, 3(%sp)
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	j	solver_surface_fast2.2844
bnei_else.12819:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 8
	jal	d_vec.2744
	addi	%sp, %sp, -8
	addi	%v1, %v0, 0
	lw	%ra, 2(%sp)
	flw	%f2, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f0, 4(%sp)
	addi	%a0, %at, 0
	addi	%v0, %at, 0
	j	solver_rect_fast.2821
setup_rect_table.2861:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f7, 2(%sp)
	fsw	%f6, 3(%sp)
	sw	%t3, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%t1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%v0, %zero, 6
	flw	%f7, 482(%zero)
	fmov	%f0, %f7
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	sw	%v0, 9(%sp)
	lw	%a0, 0(%sp)
	flw	%f6, 0(%a0)
	fmov	%f0, %f6
	addi	%sp, %sp, 10
	jal	fiszero.2599
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.12821
	lw	%v0, 9(%sp)
	fsw	%f7, 1(%v0)
	j	bnei_cont.12822
bnei_else.12821:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	o_isinvert.2689
	addi	%sp, %sp, -10
	addi	%t0, %v0, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 10
	jal	fisneg.2597
	addi	%sp, %sp, -10
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	xor.2601
	addi	%sp, %sp, -10
	addi	%t0, %v0, 0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	o_param_a.2693
	addi	%sp, %sp, -10
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	fneg_cond.2631
	addi	%sp, %sp, -10
	lw	%v0, 9(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f6
	lw	%v0, 9(%sp)
	fsw	%f0, 1(%v0)
bnei_cont.12822:
	lw	%a0, 0(%sp)
	flw	%f6, 1(%a0)
	fmov	%f0, %f6
	addi	%sp, %sp, 10
	jal	fiszero.2599
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.12823
	lw	%v0, 9(%sp)
	fsw	%f7, 3(%v0)
	j	bnei_cont.12824
bnei_else.12823:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	o_isinvert.2689
	addi	%sp, %sp, -10
	addi	%t0, %v0, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 10
	jal	fisneg.2597
	addi	%sp, %sp, -10
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	xor.2601
	addi	%sp, %sp, -10
	addi	%t0, %v0, 0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	o_param_b.2695
	addi	%sp, %sp, -10
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	fneg_cond.2631
	addi	%sp, %sp, -10
	lw	%v0, 9(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f6
	lw	%v0, 9(%sp)
	fsw	%f0, 3(%v0)
bnei_cont.12824:
	lw	%a0, 0(%sp)
	flw	%f6, 2(%a0)
	fmov	%f0, %f6
	addi	%sp, %sp, 10
	jal	fiszero.2599
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.12825
	lw	%v0, 9(%sp)
	fsw	%f7, 5(%v0)
	j	bnei_cont.12826
bnei_else.12825:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	o_isinvert.2689
	addi	%sp, %sp, -10
	addi	%t0, %v0, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 10
	jal	fisneg.2597
	addi	%sp, %sp, -10
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	xor.2601
	addi	%sp, %sp, -10
	addi	%t0, %v0, 0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10
	jal	fneg_cond.2631
	addi	%sp, %sp, -10
	lw	%v0, 9(%sp)
	fsw	%f0, 4(%v0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f6
	lw	%v0, 9(%sp)
	fsw	%f0, 5(%v0)
bnei_cont.12826:
	flw	%f7, 2(%sp)
	flw	%f6, 3(%sp)
	lw	%t3, 4(%sp)
	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	lw	%v0, 9(%sp)
	jr	%ra
setup_surface_table.2864:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f8, 2(%sp)
	fsw	%f7, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %zero, 4
	flw	%f7, 482(%zero)
	fmov	%f0, %f7
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%a0, 0(%sp)
	flw	%f6, 0(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_a.2693
	addi	%sp, %sp, -7
	fmul	%f6, %f6, %f0
	lw	%a0, 0(%sp)
	flw	%f8, 1(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_b.2695
	addi	%sp, %sp, -7
	fmul	%f0, %f8, %f0
	fadd	%f6, %f6, %f0
	lw	%a0, 0(%sp)
	flw	%f8, 2(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2697
	addi	%sp, %sp, -7
	fmul	%f0, %f8, %f0
	fadd	%f6, %f6, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 7
	jal	fispos.2595
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.12827
	flw	%f0, 461(%zero)
	fdiv	%f0, %f0, %f6
	lw	%v0, 6(%sp)
	fsw	%f0, 0(%v0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_a.2693
	addi	%sp, %sp, -7
	fdiv	%f0, %f0, %f6
	fneg	%f0, %f0
	lw	%v0, 6(%sp)
	fsw	%f0, 1(%v0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_b.2695
	addi	%sp, %sp, -7
	fdiv	%f0, %f0, %f6
	fneg	%f0, %f0
	lw	%v0, 6(%sp)
	fsw	%f0, 2(%v0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2697
	addi	%sp, %sp, -7
	fdiv	%f0, %f0, %f6
	fneg	%f0, %f0
	lw	%v0, 6(%sp)
	fsw	%f0, 3(%v0)
	j	bnei_cont.12828
bnei_else.12827:
	lw	%v0, 6(%sp)
	fsw	%f7, 0(%v0)
bnei_cont.12828:
	flw	%f8, 2(%sp)
	flw	%f7, 3(%sp)
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v0, 6(%sp)
	jr	%ra
setup_second_table.2867:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f13, 2(%sp)
	fsw	%f12, 3(%sp)
	fsw	%f11, 4(%sp)
	fsw	%f10, 5(%sp)
	fsw	%f9, 6(%sp)
	fsw	%f8, 7(%sp)
	fsw	%f7, 8(%sp)
	fsw	%f6, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%v0, %zero, 5
	flw	%f0, 482(%zero)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	sw	%v0, 11(%sp)
	lw	%a0, 0(%sp)
	flw	%f7, 0(%a0)
	lw	%a0, 0(%sp)
	flw	%f8, 1(%a0)
	lw	%a0, 0(%sp)
	flw	%f9, 2(%a0)
	lw	%v0, 1(%sp)
	fmov	%f2, %f9
	fmov	%f1, %f8
	fmov	%f0, %f7
	addi	%sp, %sp, 12
	jal	quadratic.2798
	addi	%sp, %sp, -12
	fmov	%f6, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_a.2693
	addi	%sp, %sp, -12
	fmul	%f0, %f7, %f0
	fneg	%f13, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_b.2695
	addi	%sp, %sp, -12
	fmul	%f0, %f8, %f0
	fneg	%f12, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_c.2697
	addi	%sp, %sp, -12
	fmul	%f0, %f9, %f0
	fneg	%f11, %f0
	lw	%v0, 11(%sp)
	fsw	%f6, 0(%v0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_isrot.2691
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.12829
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r2.2719
	addi	%sp, %sp, -12
	fmul	%f10, %f9, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r3.2721
	addi	%sp, %sp, -12
	fmul	%f0, %f8, %f0
	fadd	%f0, %f10, %f0
	addi	%sp, %sp, 12
	jal	fhalf.2604
	addi	%sp, %sp, -12
	fsub	%f0, %f13, %f0
	lw	%v0, 11(%sp)
	fsw	%f0, 1(%v0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r1.2717
	addi	%sp, %sp, -12
	fmul	%f10, %f9, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r3.2721
	addi	%sp, %sp, -12
	fmul	%f0, %f7, %f0
	fadd	%f0, %f10, %f0
	addi	%sp, %sp, 12
	jal	fhalf.2604
	addi	%sp, %sp, -12
	fsub	%f0, %f12, %f0
	lw	%v0, 11(%sp)
	fsw	%f0, 2(%v0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r1.2717
	addi	%sp, %sp, -12
	fmul	%f10, %f8, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r2.2719
	addi	%sp, %sp, -12
	fmul	%f0, %f7, %f0
	fadd	%f0, %f10, %f0
	addi	%sp, %sp, 12
	jal	fhalf.2604
	addi	%sp, %sp, -12
	fsub	%f0, %f11, %f0
	lw	%v0, 11(%sp)
	fsw	%f0, 3(%v0)
	j	bnei_cont.12830
bnei_else.12829:
	lw	%v0, 11(%sp)
	fsw	%f13, 1(%v0)
	lw	%v0, 11(%sp)
	fsw	%f12, 2(%v0)
	lw	%v0, 11(%sp)
	fsw	%f11, 3(%v0)
bnei_cont.12830:
	fmov	%f0, %f6
	addi	%sp, %sp, 12
	jal	fiszero.2599
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.12831
	j	bnei_cont.12832
bnei_else.12831:
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f6
	lw	%v0, 11(%sp)
	fsw	%f0, 4(%v0)
bnei_cont.12832:
	flw	%f13, 2(%sp)
	flw	%f12, 3(%sp)
	flw	%f11, 4(%sp)
	flw	%f10, 5(%sp)
	flw	%f9, 6(%sp)
	flw	%f8, 7(%sp)
	flw	%f7, 8(%sp)
	flw	%f6, 9(%sp)
	lw	%ra, 10(%sp)
	lw	%v0, 11(%sp)
	jr	%ra
iter_setup_dirvec_constants.2870:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t6, 2(%sp)
	sw	%t3, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	lw	%a1, 1(%sp)
	blti	%a1, 0, bgti_else.12833
	addi	%a0, %zero, 12
	lw	%a1, 1(%sp)
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 8
	jal	d_const.2746
	addi	%sp, %sp, -8
	addi	%t1, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 8
	jal	d_vec.2744
	addi	%sp, %sp, -8
	addi	%t0, %v0, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	o_form.2685
	addi	%sp, %sp, -8
	beqi	%v0, 1, bnei_else.12834
	beqi	%v0, 2, bnei_else.12836
	addi	%v1, %at, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 8
	jal	setup_second_table.2867
	addi	%sp, %sp, -8
	lw	%a1, 1(%sp)
	add	%at, %t1, %a1
	sw	%v0, 0(%at)
	j	bnei_cont.12837
bnei_else.12836:
	addi	%v1, %at, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 8
	jal	setup_surface_table.2864
	addi	%sp, %sp, -8
	lw	%a1, 1(%sp)
	add	%at, %t1, %a1
	sw	%v0, 0(%at)
bnei_cont.12837:
	j	bnei_cont.12835
bnei_else.12834:
	addi	%v1, %at, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 8
	jal	setup_rect_table.2861
	addi	%sp, %sp, -8
	lw	%a1, 1(%sp)
	add	%at, %t1, %a1
	sw	%v0, 0(%at)
bnei_cont.12835:
	lw	%a1, 1(%sp)
	addi	%v1, %a1, -1
	lw	%t6, 2(%sp)
	lw	%t3, 3(%sp)
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2870
bgti_else.12833:
	lw	%t6, 2(%sp)
	lw	%t3, 3(%sp)
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
setup_dirvec_constants.2873:
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%v1, %a0, -1
	j	iter_setup_dirvec_constants.2870
setup_startp_constants.2875:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t6, 2(%sp)
	sw	%t3, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	lw	%a1, 1(%sp)
	blti	%a1, 0, bgti_else.12839
	addi	%a0, %zero, 12
	lw	%a1, 1(%sp)
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	o_param_ctbl.2723
	addi	%sp, %sp, -8
	addi	%t1, %v0, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	o_form.2685
	addi	%sp, %sp, -8
	addi	%t0, %v0, 0
	lw	%v0, 0(%sp)
	flw	%f0, 0(%v0)
	fsw	%f0, 8(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	o_param_x.2701
	addi	%sp, %sp, -9
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 0(%t1)
	lw	%v0, 0(%sp)
	flw	%f0, 1(%v0)
	fsw	%f0, 9(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	o_param_y.2703
	addi	%sp, %sp, -10
	flw	%f1, 9(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 1(%t1)
	lw	%v0, 0(%sp)
	flw	%f0, 2(%v0)
	fsw	%f0, 10(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	o_param_z.2705
	addi	%sp, %sp, -11
	flw	%f1, 10(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 2(%t1)
	beqi	%t0, 2, bnei_else.12840
	addi	%at, %zero, 2
	blt	%at, %t0, bgt_else.12842
	j	bgt_cont.12843
bgt_else.12842:
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	quadratic.2798
	addi	%sp, %sp, -11
	beqi	%t0, 3, bnei_else.12844
	j	bnei_cont.12845
bnei_else.12844:
	flw	%f1, 477(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.12845:
	fsw	%f0, 3(%t1)
bgt_cont.12843:
	j	bnei_cont.12841
bnei_else.12840:
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	o_param_abc.2699
	addi	%sp, %sp, -11
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	addi	%sp, %sp, 11
	jal	veciprod2.2661
	addi	%sp, %sp, -11
	fsw	%f0, 3(%t1)
bnei_cont.12841:
	lw	%a1, 1(%sp)
	addi	%v1, %a1, -1
	lw	%t6, 2(%sp)
	lw	%t3, 3(%sp)
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2875
bgti_else.12839:
	lw	%t6, 2(%sp)
	lw	%t3, 3(%sp)
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
setup_startp.2878:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%a0, %zero, 162
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	addi	%sp, %sp, 2
	jal	veccpy.2647
	addi	%sp, %sp, -2
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%v1, %a0, -1
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2875
is_rect_outside.2880:
	fsw	%f1, 0(%sp)
	fsw	%f2, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	fabs	%f0, %f0
	fsw	%f0, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 5
	jal	o_param_a.2693
	addi	%sp, %sp, -5
	fmov	%f1, %f0
	flw	%f0, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.12847
	flw	%f0, 0(%sp)
	fabs	%f0, %f0
	fsw	%f0, 5(%sp)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 6
	jal	o_param_b.2695
	addi	%sp, %sp, -6
	fmov	%f1, %f0
	flw	%f0, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.12849
	flw	%f0, 1(%sp)
	fabs	%f0, %f0
	fsw	%f0, 6(%sp)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2697
	addi	%sp, %sp, -7
	fmov	%f1, %f0
	flw	%f0, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2592
	addi	%sp, %sp, -7
	j	bnei_cont.12850
bnei_else.12849:
	addi	%v0, %zero, 0
bnei_cont.12850:
	j	bnei_cont.12848
bnei_else.12847:
	addi	%v0, %zero, 0
bnei_cont.12848:
	beqi	%v0, 0, bnei_else.12851
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	j	o_isinvert.2689
bnei_else.12851:
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2689
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.12852
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12852:
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 1
	jr	%ra
is_plane_outside.2885:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f8, 4(%sp)
	fsw	%f7, 5(%sp)
	fsw	%f6, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%ra, 8(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	o_param_abc.2699
	addi	%sp, %sp, -9
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 9
	jal	veciprod2.2661
	addi	%sp, %sp, -9
	fmov	%f6, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	o_isinvert.2689
	addi	%sp, %sp, -9
	addi	%t0, %v0, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 9
	jal	fisneg.2597
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	xor.2601
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.12853
	flw	%f8, 4(%sp)
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12853:
	flw	%f8, 4(%sp)
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 1
	jr	%ra
is_second_outside.2890:
	sw	%v0, 0(%sp)
	fsw	%f6, 1(%sp)
	sw	%t0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	quadratic.2798
	addi	%sp, %sp, -4
	fmov	%f6, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	o_form.2685
	addi	%sp, %sp, -4
	beqi	%v0, 3, bnei_else.12854
	j	bnei_cont.12855
bnei_else.12854:
	flw	%f0, 477(%zero)
	fsub	%f6, %f6, %f0
bnei_cont.12855:
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	o_isinvert.2689
	addi	%sp, %sp, -4
	addi	%t0, %v0, 0
	fmov	%f0, %f6
	addi	%sp, %sp, 4
	jal	fisneg.2597
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 4
	jal	xor.2601
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.12856
	flw	%f6, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12856:
	flw	%f6, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 1
	jr	%ra
is_outside.2895:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2701
	addi	%sp, %sp, -5
	flw	%f1, 0(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 6
	jal	o_param_y.2703
	addi	%sp, %sp, -6
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 6(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 7
	jal	o_param_z.2705
	addi	%sp, %sp, -7
	flw	%f1, 2(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 7(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 8
	jal	o_form.2685
	addi	%sp, %sp, -8
	sw	%v0, 8(%sp)
	lw	%a0, 8(%sp)
	beqi	%a0, 1, bnei_else.12857
	lw	%a0, 8(%sp)
	beqi	%a0, 2, bnei_else.12858
	lw	%ra, 4(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	j	is_second_outside.2890
bnei_else.12858:
	lw	%ra, 4(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	j	is_plane_outside.2885
bnei_else.12857:
	lw	%ra, 4(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	j	is_rect_outside.2880
check_all_inside.2900:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	lw	%a1, 3(%sp)
	add	%at, %v1, %a1
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.12859
	addi	%a1, %zero, 12
	add	%at, %a1, %a2
	lw	%a0, 0(%at)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 6
	jal	is_outside.2895
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.12860
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12860:
	lw	%a1, 3(%sp)
	addi	%v0, %a1, 1
	lw	%ra, 5(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 4(%sp)
	j	check_all_inside.2900
bnei_else.12859:
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2906:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%a0, 0(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	sw	%a0, 3(%sp)
	lw	%v0, 3(%sp)
	beqi	%v0, -1, bnei_else.12861
	addi	%a0, %zero, 138
	addi	%v1, %zero, 247
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_fast.2840
	addi	%sp, %sp, -4
	addi	%a0, %zero, 0
	sw	%a0, 4(%sp)
	addi	%a0, %zero, 135
	flw	%f0, 0(%a0)
	fsw	%f0, 5(%sp)
	beqi	%v0, 0, bnei_else.12862
	flw	%f1, 457(%zero)
	flw	%f0, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	j	bnei_cont.12863
bnei_else.12862:
	addi	%v0, %zero, 0
bnei_cont.12863:
	beqi	%v0, 0, bnei_else.12864
	flw	%f1, 456(%zero)
	flw	%f0, 5(%sp)
	fadd	%f17, %f0, %f1
	addi	%a0, %zero, 78
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f17
	addi	%a0, %zero, 138
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	addi	%a0, %zero, 78
	flw	%f1, 1(%a0)
	fmul	%f16, %f1, %f17
	addi	%a0, %zero, 138
	flw	%f1, 1(%a0)
	fadd	%f1, %f16, %f1
	addi	%a0, %zero, 78
	flw	%f16, 2(%a0)
	fmul	%f17, %f16, %f17
	addi	%a0, %zero, 138
	flw	%f16, 2(%a0)
	fadd	%f2, %f17, %f16
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 6
	jal	check_all_inside.2900
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.12865
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12865:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_and_group.2906
bnei_else.12864:
	addi	%a0, %zero, 12
	lw	%v0, 3(%sp)
	add	%at, %a0, %v0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	o_isinvert.2689
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.12866
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_and_group.2906
bnei_else.12866:
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.12861:
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2909:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%a1, 0(%sp)
	add	%at, %v1, %a1
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.12867
	addi	%a1, %zero, 83
	add	%at, %a1, %a2
	lw	%a0, 0(%at)
	addi	%v0, %zero, 0
	addi	%v1, %a0, 0
	addi	%sp, %sp, 3
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.12868
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12868:
	lw	%a1, 0(%sp)
	addi	%v0, %a1, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2909
bnei_else.12867:
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2912:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%at, 0(%at)
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.12869
	beqi	%a1, 99, bnei_else.12870
	addi	%a0, %zero, 138
	addi	%v1, %zero, 247
	addi	%v0, %a1, 0
	addi	%sp, %sp, 3
	jal	solver_fast.2840
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.12872
	addi	%a0, %zero, 135
	flw	%f0, 0(%a0)
	flw	%f1, 455(%zero)
	addi	%sp, %sp, 3
	jal	fless.2592
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.12874
	addi	%v0, %zero, 1
	addi	%v1, %at, 0
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.12876
	addi	%a0, %zero, 1
	j	bnei_cont.12877
bnei_else.12876:
	addi	%a0, %zero, 0
bnei_cont.12877:
	j	bnei_cont.12875
bnei_else.12874:
	addi	%a0, %zero, 0
bnei_cont.12875:
	j	bnei_cont.12873
bnei_else.12872:
	addi	%a0, %zero, 0
bnei_cont.12873:
	j	bnei_cont.12871
bnei_else.12870:
	addi	%a0, %zero, 1
bnei_cont.12871:
	beqi	%a0, 0, bnei_else.12878
	addi	%v0, %zero, 1
	addi	%v1, %at, 0
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.12879
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12879:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.12878:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.12869:
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2915:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	fsw	%f6, 3(%sp)
	sw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	sw	%a0, 5(%sp)
	lw	%v0, 5(%sp)
	beqi	%v0, -1, bnei_else.12880
	addi	%a0, %zero, 159
	lw	%v0, 5(%sp)
	lw	%a1, 2(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 6
	jal	solver.2817
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 7(%sp)
	lw	%a1, 6(%sp)
	beqi	%a1, 0, bnei_else.12881
	addi	%a0, %zero, 135
	flw	%f6, 0(%a0)
	flw	%f0, 482(%zero)
	fmov	%f1, %f6
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.12882
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	fmov	%f0, %f6
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.12884
	flw	%f0, 456(%zero)
	fadd	%f6, %f6, %f0
	lw	%a1, 2(%sp)
	flw	%f0, 0(%a1)
	fmul	%f1, %f0, %f6
	addi	%a0, %zero, 159
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 8(%sp)
	lw	%a1, 2(%sp)
	flw	%f0, 1(%a1)
	fmul	%f1, %f0, %f6
	addi	%a0, %zero, 159
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 9(%sp)
	lw	%a1, 2(%sp)
	flw	%f0, 2(%a1)
	fmul	%f1, %f0, %f6
	addi	%a0, %zero, 159
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 10(%sp)
	flw	%f2, 10(%sp)
	flw	%f1, 9(%sp)
	flw	%f0, 8(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 7(%sp)
	addi	%sp, %sp, 11
	jal	check_all_inside.2900
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.12886
	addi	%a0, %zero, 137
	fsw	%f6, 0(%a0)
	addi	%v0, %zero, 138
	flw	%f2, 10(%sp)
	flw	%f1, 9(%sp)
	flw	%f0, 8(%sp)
	addi	%sp, %sp, 11
	jal	vecset.2637
	addi	%sp, %sp, -11
	addi	%a0, %zero, 141
	lw	%v0, 5(%sp)
	sw	%v0, 0(%a0)
	addi	%a0, %zero, 136
	lw	%a1, 6(%sp)
	sw	%a1, 0(%a0)
	j	bnei_cont.12887
bnei_else.12886:
bnei_cont.12887:
	j	bnei_cont.12885
bnei_else.12884:
bnei_cont.12885:
	j	bnei_cont.12883
bnei_else.12882:
bnei_cont.12883:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	lw	%a1, 2(%sp)
	addi	%a0, %a1, 0
	j	solve_each_element.2915
bnei_else.12881:
	addi	%a0, %zero, 12
	lw	%v0, 5(%sp)
	add	%at, %a0, %v0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	o_isinvert.2689
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.12888
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	lw	%a1, 2(%sp)
	addi	%a0, %a1, 0
	j	solve_each_element.2915
bnei_else.12888:
	flw	%f6, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.12880:
	flw	%f6, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
solve_one_or_network.2919:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.12891
	addi	%a0, %zero, 83
	add	%at, %a0, %a2
	lw	%a1, 0(%at)
	addi	%v0, %zero, 0
	lw	%a0, 2(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 4
	jal	solve_each_element.2915
	addi	%sp, %sp, -4
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_one_or_network.2919
bnei_else.12891:
	lw	%ra, 3(%sp)
	jr	%ra
trace_or_matrix.2923:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%at, 0(%at)
	lw	%v0, 0(%at)
	beqi	%v0, -1, bnei_else.12893
	beqi	%v0, 99, bnei_else.12894
	addi	%a0, %zero, 159
	lw	%a1, 2(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 4
	jal	solver.2817
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.12896
	addi	%a0, %zero, 135
	flw	%f0, 0(%a0)
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	addi	%sp, %sp, 4
	jal	fless.2592
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.12898
	addi	%v0, %zero, 1
	lw	%a1, 2(%sp)
	addi	%a0, %a1, 0
	addi	%v1, %at, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -4
	j	bnei_cont.12899
bnei_else.12898:
bnei_cont.12899:
	j	bnei_cont.12897
bnei_else.12896:
bnei_cont.12897:
	j	bnei_cont.12895
bnei_else.12894:
	addi	%v0, %zero, 1
	lw	%a1, 2(%sp)
	addi	%a0, %a1, 0
	addi	%v1, %at, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -4
bnei_cont.12895:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %a1, 0
	j	trace_or_matrix.2923
bnei_else.12893:
	lw	%ra, 3(%sp)
	jr	%ra
judge_intersection.2927:
	add	%a0, %zero, %v0
	sw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 454(%zero)
	addi	%a1, %zero, 137
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 134
	lw	%v1, 0(%a1)
	addi	%sp, %sp, 1
	jal	trace_or_matrix.2923
	addi	%sp, %sp, -1
	addi	%a0, %zero, 137
	flw	%f0, 0(%a0)
	fsw	%f0, 1(%sp)
	flw	%f16, 455(%zero)
	flw	%f0, 1(%sp)
	fmov	%f1, %f0
	fmov	%f0, %f16
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.12901
	flw	%f1, 453(%zero)
	lw	%ra, 0(%sp)
	flw	%f0, 1(%sp)
	j	fless.2592
bnei_else.12901:
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element_fast.2929:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	fsw	%f6, 3(%sp)
	sw	%ra, 4(%sp)
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 5
	jal	d_vec.2744
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	sw	%a0, 6(%sp)
	lw	%v0, 6(%sp)
	beqi	%v0, -1, bnei_else.12902
	lw	%v0, 6(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	addi	%sp, %sp, 7
	jal	solver_fast2.2858
	addi	%sp, %sp, -7
	sw	%v0, 7(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 8(%sp)
	lw	%a1, 7(%sp)
	beqi	%a1, 0, bnei_else.12903
	addi	%a0, %zero, 135
	flw	%f6, 0(%a0)
	flw	%f0, 482(%zero)
	fmov	%f1, %f6
	addi	%sp, %sp, 9
	jal	fless.2592
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.12904
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	fmov	%f0, %f6
	addi	%sp, %sp, 9
	jal	fless.2592
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.12906
	flw	%f0, 456(%zero)
	fadd	%f6, %f6, %f0
	lw	%a0, 5(%sp)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f6
	addi	%a0, %zero, 162
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 9(%sp)
	lw	%a0, 5(%sp)
	flw	%f0, 1(%a0)
	fmul	%f1, %f0, %f6
	addi	%a0, %zero, 162
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 10(%sp)
	lw	%a0, 5(%sp)
	flw	%f0, 2(%a0)
	fmul	%f1, %f0, %f6
	addi	%a0, %zero, 162
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 11(%sp)
	flw	%f2, 11(%sp)
	flw	%f1, 10(%sp)
	flw	%f0, 9(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 8(%sp)
	addi	%sp, %sp, 12
	jal	check_all_inside.2900
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.12908
	addi	%a0, %zero, 137
	fsw	%f6, 0(%a0)
	addi	%v0, %zero, 138
	flw	%f2, 11(%sp)
	flw	%f1, 10(%sp)
	flw	%f0, 9(%sp)
	addi	%sp, %sp, 12
	jal	vecset.2637
	addi	%sp, %sp, -12
	addi	%a0, %zero, 141
	lw	%v0, 6(%sp)
	sw	%v0, 0(%a0)
	addi	%a0, %zero, 136
	lw	%a1, 7(%sp)
	sw	%a1, 0(%a0)
	j	bnei_cont.12909
bnei_else.12908:
bnei_cont.12909:
	j	bnei_cont.12907
bnei_else.12906:
bnei_cont.12907:
	j	bnei_cont.12905
bnei_else.12904:
bnei_cont.12905:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	j	solve_each_element_fast.2929
bnei_else.12903:
	addi	%a0, %zero, 12
	lw	%v0, 6(%sp)
	add	%at, %a0, %v0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 12
	jal	o_isinvert.2689
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.12910
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	j	solve_each_element_fast.2929
bnei_else.12910:
	flw	%f6, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.12902:
	flw	%f6, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
solve_one_or_network_fast.2933:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.12913
	addi	%a0, %zero, 83
	add	%at, %a0, %a2
	lw	%a1, 0(%at)
	addi	%v0, %zero, 0
	lw	%a0, 2(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -4
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_one_or_network_fast.2933
bnei_else.12913:
	lw	%ra, 3(%sp)
	jr	%ra
trace_or_matrix_fast.2937:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%at, 0(%at)
	lw	%v0, 0(%at)
	beqi	%v0, -1, bnei_else.12915
	beqi	%v0, 99, bnei_else.12916
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	addi	%sp, %sp, 4
	jal	solver_fast2.2858
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.12918
	addi	%a0, %zero, 135
	flw	%f0, 0(%a0)
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	addi	%sp, %sp, 4
	jal	fless.2592
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.12920
	addi	%v0, %zero, 1
	lw	%a0, 2(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -4
	j	bnei_cont.12921
bnei_else.12920:
bnei_cont.12921:
	j	bnei_cont.12919
bnei_else.12918:
bnei_cont.12919:
	j	bnei_cont.12917
bnei_else.12916:
	addi	%v0, %zero, 1
	lw	%a0, 2(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -4
bnei_cont.12917:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix_fast.2937
bnei_else.12915:
	lw	%ra, 3(%sp)
	jr	%ra
judge_intersection_fast.2941:
	add	%a0, %zero, %v0
	sw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 454(%zero)
	addi	%a1, %zero, 137
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 134
	lw	%v1, 0(%a1)
	addi	%sp, %sp, 1
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -1
	addi	%a0, %zero, 137
	flw	%f0, 0(%a0)
	fsw	%f0, 1(%sp)
	flw	%f16, 455(%zero)
	flw	%f0, 1(%sp)
	fmov	%f1, %f0
	fmov	%f0, %f16
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.12923
	flw	%f1, 453(%zero)
	lw	%ra, 0(%sp)
	flw	%f0, 1(%sp)
	j	fless.2592
bnei_else.12923:
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_rect.2943:
	sw	%v0, 0(%sp)
	sw	%t6, 1(%sp)
	sw	%t5, 2(%sp)
	sw	%t4, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%a0, %zero, 136
	lw	%t4, 0(%a0)
	addi	%v0, %zero, 142
	addi	%sp, %sp, 5
	jal	vecbzero.2645
	addi	%sp, %sp, -5
	addi	%a0, %t4, -1
	sw	%a0, 5(%sp)
	lw	%a0, 0(%sp)
	lw	%a1, 5(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	addi	%sp, %sp, 6
	jal	sgn.2629
	addi	%sp, %sp, -6
	fneg	%f0, %f0
	addi	%a0, %zero, 142
	lw	%t6, 1(%sp)
	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%a1, 5(%sp)
	add	%at, %a0, %a1
	fsw	%f0, 0(%at)
	jr	%ra
get_nvector_plane.2945:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 2
	jal	o_param_a.2693
	addi	%sp, %sp, -2
	fneg	%f0, %f0
	addi	%a0, %zero, 142
	fsw	%f0, 0(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 2
	jal	o_param_b.2695
	addi	%sp, %sp, -2
	fneg	%f0, %f0
	addi	%a0, %zero, 142
	fsw	%f0, 1(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 2
	jal	o_param_c.2697
	addi	%sp, %sp, -2
	fneg	%f0, %f0
	addi	%a0, %zero, 142
	lw	%ra, 1(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
get_nvector_second.2947:
	sw	%v0, 0(%sp)
	fsw	%f12, 1(%sp)
	fsw	%f11, 2(%sp)
	fsw	%f10, 3(%sp)
	fsw	%f9, 4(%sp)
	fsw	%f8, 5(%sp)
	fsw	%f7, 6(%sp)
	fsw	%f6, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%a0, %zero, 138
	flw	%f10, 0(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_x.2701
	addi	%sp, %sp, -9
	fsub	%f9, %f10, %f0
	addi	%a0, %zero, 138
	flw	%f10, 1(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_y.2703
	addi	%sp, %sp, -9
	fsub	%f8, %f10, %f0
	addi	%a0, %zero, 138
	flw	%f10, 2(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_z.2705
	addi	%sp, %sp, -9
	fsub	%f7, %f10, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_a.2693
	addi	%sp, %sp, -9
	fmul	%f6, %f9, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2695
	addi	%sp, %sp, -9
	fmul	%f12, %f8, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_c.2697
	addi	%sp, %sp, -9
	fmul	%f11, %f7, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_isrot.2691
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.12926
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r3.2721
	addi	%sp, %sp, -9
	fmul	%f10, %f8, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r2.2719
	addi	%sp, %sp, -9
	fmul	%f0, %f7, %f0
	fadd	%f0, %f10, %f0
	addi	%sp, %sp, 9
	jal	fhalf.2604
	addi	%sp, %sp, -9
	fadd	%f0, %f6, %f0
	addi	%a0, %zero, 142
	fsw	%f0, 0(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r3.2721
	addi	%sp, %sp, -9
	fmul	%f10, %f9, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r1.2717
	addi	%sp, %sp, -9
	fmul	%f0, %f7, %f0
	fadd	%f0, %f10, %f0
	addi	%sp, %sp, 9
	jal	fhalf.2604
	addi	%sp, %sp, -9
	fadd	%f0, %f12, %f0
	addi	%a0, %zero, 142
	fsw	%f0, 1(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r2.2719
	addi	%sp, %sp, -9
	fmul	%f10, %f9, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r1.2717
	addi	%sp, %sp, -9
	fmul	%f0, %f8, %f0
	fadd	%f0, %f10, %f0
	addi	%sp, %sp, 9
	jal	fhalf.2604
	addi	%sp, %sp, -9
	fadd	%f0, %f11, %f0
	addi	%a0, %zero, 142
	fsw	%f0, 2(%a0)
	j	bnei_cont.12927
bnei_else.12926:
	addi	%a0, %zero, 142
	fsw	%f6, 0(%a0)
	addi	%a0, %zero, 142
	fsw	%f12, 1(%a0)
	addi	%a0, %zero, 142
	fsw	%f11, 2(%a0)
bnei_cont.12927:
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_isinvert.2689
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0
	addi	%v0, %zero, 142
	flw	%f12, 1(%sp)
	flw	%f11, 2(%sp)
	flw	%f10, 3(%sp)
	flw	%f9, 4(%sp)
	flw	%f8, 5(%sp)
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	j	vecunit_sgn.2655
get_nvector.2949:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2685
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	lw	%a0, 3(%sp)
	beqi	%a0, 1, bnei_else.12928
	lw	%a0, 3(%sp)
	beqi	%a0, 2, bnei_else.12929
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	get_nvector_second.2947
bnei_else.12929:
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	get_nvector_plane.2945
bnei_else.12928:
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	j	get_nvector_rect.2943
utexture.2952:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	o_texturetype.2683
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	o_color_red.2711
	addi	%sp, %sp, -6
	addi	%a0, %zero, 145
	fsw	%f0, 0(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	o_color_green.2713
	addi	%sp, %sp, -6
	addi	%a0, %zero, 145
	fsw	%f0, 1(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	o_color_blue.2715
	addi	%sp, %sp, -6
	addi	%a0, %zero, 145
	fsw	%f0, 2(%a0)
	lw	%a0, 5(%sp)
	beqi	%a0, 1, bnei_else.12930
	lw	%a0, 5(%sp)
	beqi	%a0, 2, bnei_else.12931
	lw	%a0, 5(%sp)
	beqi	%a0, 3, bnei_else.12932
	lw	%a0, 5(%sp)
	beqi	%a0, 4, bnei_else.12933
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.12933:
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 6(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	o_param_x.2701
	addi	%sp, %sp, -7
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 7(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 8
	jal	o_param_a.2693
	addi	%sp, %sp, -8
	fsqrt	%f1, %f0
	flw	%f0, 7(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 8(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 10
	jal	o_param_z.2705
	addi	%sp, %sp, -10
	flw	%f1, 9(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 10(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_c.2697
	addi	%sp, %sp, -11
	fsqrt	%f1, %f0
	flw	%f0, 10(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 11(%sp)
	flw	%f1, 8(%sp)
	fmov	%f0, %f1
	addi	%sp, %sp, 12
	jal	fsqr.2606
	addi	%sp, %sp, -12
	fsw	%f0, 12(%sp)
	flw	%f0, 11(%sp)
	addi	%sp, %sp, 13
	jal	fsqr.2606
	addi	%sp, %sp, -13
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
	fsw	%f0, 13(%sp)
	flw	%f1, 8(%sp)
	fabs	%f0, %f1
	flw	%f1, 452(%zero)
	fsw	%f1, 14(%sp)
	flw	%f1, 14(%sp)
	addi	%sp, %sp, 15
	jal	fless.2592
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.12935
	flw	%f1, 451(%zero)
	j	bnei_cont.12936
bnei_else.12935:
	flw	%f0, 11(%sp)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f0, %f1
	fabs	%f0, %f0
	addi	%sp, %sp, 15
	jal	atan.2620
	addi	%sp, %sp, -15
	flw	%f1, 450(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.12936:
	floor	%f0, %f1
	fsub	%f0, %f1, %f0
	fsw	%f0, 15(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 16(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 17
	jal	o_param_y.2703
	addi	%sp, %sp, -17
	flw	%f1, 16(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 17(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 18
	jal	o_param_b.2695
	addi	%sp, %sp, -18
	fsqrt	%f1, %f0
	flw	%f0, 17(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 18(%sp)
	flw	%f1, 13(%sp)
	fabs	%f0, %f1
	flw	%f1, 14(%sp)
	addi	%sp, %sp, 19
	jal	fless.2592
	addi	%sp, %sp, -19
	beqi	%v0, 0, bnei_else.12937
	flw	%f1, 451(%zero)
	j	bnei_cont.12938
bnei_else.12937:
	flw	%f0, 18(%sp)
	flw	%f1, 13(%sp)
	fdiv	%f0, %f0, %f1
	fabs	%f0, %f0
	addi	%sp, %sp, 19
	jal	atan.2620
	addi	%sp, %sp, -19
	flw	%f1, 450(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.12938:
	floor	%f0, %f1
	fsub	%f0, %f1, %f0
	fsw	%f0, 19(%sp)
	flw	%f0, 448(%zero)
	fsw	%f0, 20(%sp)
	flw	%f0, 481(%zero)
	fsw	%f0, 21(%sp)
	flw	%f1, 21(%sp)
	flw	%f0, 15(%sp)
	fsub	%f0, %f1, %f0
	addi	%sp, %sp, 22
	jal	fsqr.2606
	addi	%sp, %sp, -22
	flw	%f1, 20(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 22(%sp)
	flw	%f1, 21(%sp)
	flw	%f0, 19(%sp)
	fsub	%f0, %f1, %f0
	addi	%sp, %sp, 23
	jal	fsqr.2606
	addi	%sp, %sp, -23
	flw	%f1, 22(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 23(%sp)
	flw	%f0, 23(%sp)
	addi	%sp, %sp, 24
	jal	fisneg.2597
	addi	%sp, %sp, -24
	beqi	%v0, 0, bnei_else.12939
	flw	%f0, 482(%zero)
	j	bnei_cont.12940
bnei_else.12939:
	flw	%f0, 23(%sp)
bnei_cont.12940:
	flw	%f1, 447(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 446(%zero)
	fdiv	%f0, %f1, %f0
	addi	%a0, %zero, 145
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
bnei_else.12932:
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 24(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 25
	jal	o_param_x.2701
	addi	%sp, %sp, -25
	flw	%f1, 24(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 25(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 26(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 27
	jal	o_param_z.2705
	addi	%sp, %sp, -27
	flw	%f1, 26(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 27(%sp)
	flw	%f0, 25(%sp)
	addi	%sp, %sp, 28
	jal	fsqr.2606
	addi	%sp, %sp, -28
	fsw	%f0, 28(%sp)
	flw	%f0, 27(%sp)
	addi	%sp, %sp, 29
	jal	fsqr.2606
	addi	%sp, %sp, -29
	flw	%f1, 28(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	flw	%f0, 445(%zero)
	fdiv	%f1, %f1, %f0
	floor	%f0, %f1
	fsub	%f1, %f1, %f0
	flw	%f0, 449(%zero)
	fmul	%f0, %f1, %f0
	addi	%sp, %sp, 29
	jal	cos.2616
	addi	%sp, %sp, -29
	addi	%sp, %sp, 29
	jal	fsqr.2606
	addi	%sp, %sp, -29
	flw	%f16, 447(%zero)
	fmul	%f1, %f0, %f16
	addi	%a0, %zero, 145
	fsw	%f1, 1(%a0)
	flw	%f1, 477(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f0, %f16
	addi	%a0, %zero, 145
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
bnei_else.12931:
	lw	%a0, 1(%sp)
	flw	%f1, 1(%a0)
	flw	%f0, 444(%zero)
	fmul	%f0, %f1, %f0
	addi	%sp, %sp, 29
	jal	sin.2618
	addi	%sp, %sp, -29
	addi	%sp, %sp, 29
	jal	fsqr.2606
	addi	%sp, %sp, -29
	flw	%f16, 447(%zero)
	fmul	%f1, %f16, %f0
	addi	%a0, %zero, 145
	fsw	%f1, 0(%a0)
	flw	%f1, 477(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f16, %f0
	addi	%a0, %zero, 145
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	fsw	%f0, 1(%a0)
	jr	%ra
bnei_else.12930:
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 29(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 30
	jal	o_param_x.2701
	addi	%sp, %sp, -30
	flw	%f1, 29(%sp)
	fsub	%f17, %f1, %f0
	flw	%f0, 443(%zero)
	fsw	%f0, 30(%sp)
	flw	%f0, 30(%sp)
	fmul	%f0, %f17, %f0
	floor	%f1, %f0
	flw	%f0, 442(%zero)
	fsw	%f0, 31(%sp)
	flw	%f16, 31(%sp)
	fmul	%f0, %f1, %f16
	fsub	%f0, %f17, %f0
	flw	%f1, 445(%zero)
	fsw	%f1, 32(%sp)
	flw	%f1, 32(%sp)
	addi	%sp, %sp, 33
	jal	fless.2592
	addi	%sp, %sp, -33
	sw	%v0, 33(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 34(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 35
	jal	o_param_z.2705
	addi	%sp, %sp, -35
	flw	%f1, 34(%sp)
	fsub	%f1, %f1, %f0
	flw	%f0, 30(%sp)
	fmul	%f0, %f1, %f0
	floor	%f0, %f0
	flw	%f16, 31(%sp)
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	flw	%f1, 32(%sp)
	addi	%sp, %sp, 35
	jal	fless.2592
	addi	%sp, %sp, -35
	lw	%a0, 33(%sp)
	beqi	%a0, 0, bnei_else.12944
	beqi	%v0, 0, bnei_else.12946
	flw	%f0, 447(%zero)
	j	bnei_cont.12947
bnei_else.12946:
	flw	%f0, 482(%zero)
bnei_cont.12947:
	j	bnei_cont.12945
bnei_else.12944:
	beqi	%v0, 0, bnei_else.12948
	flw	%f0, 482(%zero)
	j	bnei_cont.12949
bnei_else.12948:
	flw	%f0, 447(%zero)
bnei_cont.12949:
bnei_cont.12945:
	addi	%a0, %zero, 145
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	fsw	%f0, 1(%a0)
	jr	%ra
add_light.2955:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%ra, 3(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2595
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.12951
	addi	%v1, %zero, 145
	addi	%v0, %zero, 151
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 4
	jal	vecaccum.2666
	addi	%sp, %sp, -4
	j	bnei_cont.12952
bnei_else.12951:
bnei_cont.12952:
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2595
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.12953
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 4
	jal	fsqr.2606
	addi	%sp, %sp, -4
	addi	%sp, %sp, 4
	jal	fsqr.2606
	addi	%sp, %sp, -4
	flw	%f1, 2(%sp)
	fmul	%f1, %f0, %f1
	addi	%a0, %zero, 151
	flw	%f0, 0(%a0)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 151
	flw	%f0, 1(%a0)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 151
	flw	%f0, 2(%a0)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	lw	%ra, 3(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
bnei_else.12953:
	lw	%ra, 3(%sp)
	jr	%ra
trace_reflections.2959:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	fsw	%f8, 4(%sp)
	fsw	%f7, 5(%sp)
	fsw	%f6, 6(%sp)
	sw	%t2, 7(%sp)
	sw	%t1, 8(%sp)
	sw	%t0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 11(%sp)
	lw	%a1, 2(%sp)
	blti	%a1, 0, bgti_else.12956
	addi	%a0, %zero, 254
	lw	%a1, 2(%sp)
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 12
	jal	r_dvec.2750
	addi	%sp, %sp, -12
	addi	%t0, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 12
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.12957
	addi	%a0, %zero, 141
	lw	%a0, 0(%a0)
	sll	%a1, %a0, 2
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	add	%a0, %a1, %a0
	sw	%a0, 12(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 13
	jal	r_surface_id.2748
	addi	%sp, %sp, -13
	lw	%a0, 12(%sp)
	bne	%a0, %v0, beq_else.12959
	addi	%a0, %zero, 134
	lw	%at, 0(%a0)
	lw	%v0, 11(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 13
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.12961
	j	bnei_cont.12962
bnei_else.12961:
	addi	%v0, %t0, 0
	addi	%sp, %sp, 13
	jal	d_vec.2744
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0
	addi	%v0, %zero, 142
	addi	%sp, %sp, 13
	jal	veciprod.2658
	addi	%sp, %sp, -13
	fsw	%f0, 13(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 14
	jal	r_bright.2752
	addi	%sp, %sp, -14
	fmov	%f6, %f0
	flw	%f0, 0(%sp)
	fmul	%f1, %f6, %f0
	flw	%f0, 13(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 14(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 15
	jal	d_vec.2744
	addi	%sp, %sp, -15
	addi	%v1, %v0, 0
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 15
	jal	veciprod.2658
	addi	%sp, %sp, -15
	fmul	%f16, %f6, %f0
	flw	%f0, 14(%sp)
	flw	%f1, 1(%sp)
	fmov	%f2, %f1
	fmov	%f1, %f16
	addi	%sp, %sp, 15
	jal	add_light.2955
	addi	%sp, %sp, -15
bnei_cont.12962:
	j	beq_cont.12960
beq_else.12959:
beq_cont.12960:
	j	bnei_cont.12958
bnei_else.12957:
bnei_cont.12958:
	lw	%a1, 2(%sp)
	addi	%v0, %a1, -1
	flw	%f8, 4(%sp)
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%a0, 3(%sp)
	addi	%v1, %a0, 0
	j	trace_reflections.2959
bgti_else.12956:
	flw	%f8, 4(%sp)
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	jr	%ra
trace_ray.2964:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	lw	%a3, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.12964
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 8
	jal	p_surface_ids.2729
	addi	%sp, %sp, -8
	sw	%v0, 8(%sp)
	lw	%a1, 3(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 9
	jal	judge_intersection.2927
	addi	%sp, %sp, -9
	addi	%a0, %zero, 0
	sw	%a0, 9(%sp)
	beqi	%v0, 0, bnei_else.12965
	addi	%a0, %zero, 141
	lw	%a0, 0(%a0)
	sw	%a0, 10(%sp)
	addi	%a1, %zero, 12
	lw	%a0, 10(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	o_reflectiontype.2687
	addi	%sp, %sp, -11
	sw	%v0, 11(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 12
	jal	o_diffuse.2707
	addi	%sp, %sp, -12
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 12(%sp)
	lw	%a1, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 13
	jal	get_nvector.2949
	addi	%sp, %sp, -13
	addi	%v1, %zero, 138
	addi	%v0, %zero, 159
	addi	%sp, %sp, 13
	jal	veccpy.2647
	addi	%sp, %sp, -13
	addi	%v1, %zero, 138
	addi	%v0, %at, 0
	addi	%sp, %sp, 13
	jal	utexture.2952
	addi	%sp, %sp, -13
	lw	%a0, 10(%sp)
	sll	%a1, %a0, 2
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	add	%a0, %a1, %a0
	lw	%a2, 8(%sp)
	lw	%a3, 2(%sp)
	add	%at, %a2, %a3
	sw	%a0, 0(%at)
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 13
	jal	p_intersection_points.2727
	addi	%sp, %sp, -13
	lw	%a3, 2(%sp)
	add	%at, %v0, %a3
	lw	%at, 0(%at)
	addi	%v1, %zero, 138
	addi	%v0, %at, 0
	addi	%sp, %sp, 13
	jal	veccpy.2647
	addi	%sp, %sp, -13
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 13
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -13
	sw	%v0, 13(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 14
	jal	o_diffuse.2707
	addi	%sp, %sp, -14
	flw	%f1, 481(%zero)
	addi	%sp, %sp, 14
	jal	fless.2592
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.12966
	lw	%v0, 9(%sp)
	lw	%a0, 13(%sp)
	lw	%a3, 2(%sp)
	add	%at, %a0, %a3
	sw	%v0, 0(%at)
	j	bnei_cont.12967
bnei_else.12966:
	addi	%a1, %zero, 1
	lw	%a0, 13(%sp)
	lw	%a3, 2(%sp)
	add	%at, %a0, %a3
	sw	%a1, 0(%at)
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 14
	jal	p_energy.2733
	addi	%sp, %sp, -14
	lw	%a3, 2(%sp)
	add	%at, %v0, %a3
	lw	%at, 0(%at)
	addi	%v1, %zero, 145
	addi	%v0, %at, 0
	addi	%sp, %sp, 14
	jal	veccpy.2647
	addi	%sp, %sp, -14
	flw	%f1, 441(%zero)
	flw	%f0, 12(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %at, 0
	addi	%sp, %sp, 14
	jal	vecscale.2676
	addi	%sp, %sp, -14
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 14
	jal	p_nvectors.2742
	addi	%sp, %sp, -14
	lw	%a3, 2(%sp)
	add	%at, %v0, %a3
	lw	%at, 0(%at)
	addi	%v1, %zero, 142
	addi	%v0, %at, 0
	addi	%sp, %sp, 14
	jal	veccpy.2647
	addi	%sp, %sp, -14
bnei_cont.12967:
	flw	%f0, 440(%zero)
	fsw	%f0, 14(%sp)
	addi	%v1, %zero, 142
	lw	%a1, 3(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 15
	jal	veciprod.2658
	addi	%sp, %sp, -15
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 142
	lw	%a1, 3(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 15
	jal	vecaccum.2666
	addi	%sp, %sp, -15
	addi	%v0, %at, 0
	addi	%sp, %sp, 15
	jal	o_hilight.2709
	addi	%sp, %sp, -15
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 15(%sp)
	addi	%a0, %zero, 134
	lw	%at, 0(%a0)
	lw	%v0, 9(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -16
	beqi	%v0, 0, bnei_else.12968
	j	bnei_cont.12969
bnei_else.12968:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	addi	%sp, %sp, 16
	jal	veciprod.2658
	addi	%sp, %sp, -16
	fneg	%f1, %f0
	flw	%f0, 12(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 16(%sp)
	addi	%v1, %zero, 78
	lw	%a1, 3(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 17
	jal	veciprod.2658
	addi	%sp, %sp, -17
	fneg	%f16, %f0
	flw	%f1, 15(%sp)
	flw	%f0, 16(%sp)
	fmov	%f2, %f1
	fmov	%f1, %f16
	addi	%sp, %sp, 17
	jal	add_light.2955
	addi	%sp, %sp, -17
bnei_cont.12969:
	addi	%v0, %zero, 138
	addi	%sp, %sp, 17
	jal	setup_startp.2878
	addi	%sp, %sp, -17
	addi	%a0, %zero, 434
	lw	%a0, 0(%a0)
	addi	%v0, %a0, -1
	flw	%f1, 15(%sp)
	flw	%f0, 12(%sp)
	lw	%a1, 3(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 17
	jal	trace_reflections.2959
	addi	%sp, %sp, -17
	flw	%f0, 439(%zero)
	flw	%f1, 0(%sp)
	addi	%sp, %sp, 17
	jal	fless.2592
	addi	%sp, %sp, -17
	beqi	%v0, 0, bnei_else.12970
	lw	%a3, 2(%sp)
	blti	%a3, 4, bgti_else.12971
	j	bgti_cont.12972
bgti_else.12971:
	lw	%a3, 2(%sp)
	addi	%a1, %a3, 1
	addi	%a0, %zero, -1
	lw	%a2, 8(%sp)
	add	%at, %a2, %a1
	sw	%a0, 0(%at)
bgti_cont.12972:
	lw	%a0, 11(%sp)
	beqi	%a0, 2, bnei_else.12973
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bnei_else.12973:
	flw	%f0, 477(%zero)
	fsw	%f0, 17(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 18
	jal	o_diffuse.2707
	addi	%sp, %sp, -18
	flw	%f1, 17(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%a3, 2(%sp)
	addi	%v0, %a3, 1
	addi	%a0, %zero, 137
	flw	%f16, 0(%a0)
	flw	%f1, 1(%sp)
	fadd	%f1, %f1, %f16
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%v1, %a1, 0
	j	trace_ray.2964
bnei_else.12970:
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bnei_else.12965:
	addi	%a0, %zero, -1
	lw	%a2, 8(%sp)
	lw	%a3, 2(%sp)
	add	%at, %a2, %a3
	sw	%a0, 0(%at)
	lw	%a3, 2(%sp)
	beqi	%a3, 0, bnei_else.12976
	addi	%v1, %zero, 78
	lw	%a1, 3(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 18
	jal	veciprod.2658
	addi	%sp, %sp, -18
	fneg	%f0, %f0
	fsw	%f0, 18(%sp)
	flw	%f1, 18(%sp)
	fmov	%f0, %f1
	addi	%sp, %sp, 19
	jal	fispos.2595
	addi	%sp, %sp, -19
	beqi	%v0, 0, bnei_else.12977
	flw	%f1, 18(%sp)
	fmov	%f0, %f1
	addi	%sp, %sp, 19
	jal	fsqr.2606
	addi	%sp, %sp, -19
	flw	%f1, 18(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 0(%sp)
	fmul	%f1, %f0, %f1
	addi	%a0, %zero, 81
	flw	%f0, 0(%a0)
	fmul	%f1, %f1, %f0
	addi	%a0, %zero, 151
	flw	%f0, 0(%a0)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 151
	flw	%f0, 1(%a0)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 151
	flw	%f0, 2(%a0)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
bnei_else.12977:
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bnei_else.12976:
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bgt_else.12964:
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
trace_diffuse_ray.2970:
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 3
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -3
	addi	%a0, %zero, 0
	sw	%a0, 3(%sp)
	beqi	%v0, 0, bnei_else.12982
	addi	%a0, %zero, 141
	lw	%a1, 0(%a0)
	addi	%a0, %zero, 12
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 4
	jal	d_vec.2744
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	get_nvector.2949
	addi	%sp, %sp, -4
	addi	%v1, %zero, 138
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	utexture.2952
	addi	%sp, %sp, -4
	addi	%a0, %zero, 134
	lw	%at, 0(%a0)
	lw	%v0, 3(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.12983
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.12983:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	addi	%sp, %sp, 4
	jal	veciprod.2658
	addi	%sp, %sp, -4
	fneg	%f0, %f0
	fsw	%f0, 4(%sp)
	flw	%f0, 4(%sp)
	addi	%sp, %sp, 5
	jal	fispos.2595
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.12985
	flw	%f0, 4(%sp)
	j	bnei_cont.12986
bnei_else.12985:
	flw	%f0, 482(%zero)
bnei_cont.12986:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 5(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	o_diffuse.2707
	addi	%sp, %sp, -6
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 145
	addi	%v0, %zero, 148
	lw	%ra, 2(%sp)
	j	vecaccum.2666
bnei_else.12982:
	lw	%ra, 2(%sp)
	jr	%ra
iter_trace_diffuse_rays.2973:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%ra, 5(%sp)
	lw	%a0, 3(%sp)
	blti	%a0, 0, bgti_else.12988
	lw	%v0, 0(%sp)
	lw	%a0, 3(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	d_vec.2744
	addi	%sp, %sp, -6
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2658
	addi	%sp, %sp, -6
	fmov	%f6, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 6
	jal	fisneg.2597
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.12989
	lw	%a0, 3(%sp)
	addi	%a0, %a0, 1
	lw	%v0, 0(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f6, %f0
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -6
	j	bnei_cont.12990
bnei_else.12989:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f6, %f0
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -6
bnei_cont.12990:
	lw	%a0, 3(%sp)
	addi	%a1, %a0, -2
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
bgti_else.12988:
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
trace_diffuse_rays.2978:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 4
	jal	setup_startp.2878
	addi	%sp, %sp, -4
	addi	%a1, %zero, 118
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
trace_diffuse_ray_80percent.2982:
	add	%a1, %zero, %v0
	sw	%a1, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%a0, 0(%sp)
	beqi	%a0, 0, bnei_else.12992
	addi	%a0, %zero, 179
	lw	%v0, 0(%a0)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	j	bnei_cont.12993
bnei_else.12992:
bnei_cont.12993:
	lw	%a0, 0(%sp)
	beqi	%a0, 1, bnei_else.12994
	addi	%a0, %zero, 179
	lw	%at, 1(%a0)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	j	bnei_cont.12995
bnei_else.12994:
bnei_cont.12995:
	lw	%a0, 0(%sp)
	beqi	%a0, 2, bnei_else.12996
	addi	%a0, %zero, 179
	lw	%at, 2(%a0)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	j	bnei_cont.12997
bnei_else.12996:
bnei_cont.12997:
	lw	%a0, 0(%sp)
	beqi	%a0, 3, bnei_else.12998
	addi	%a0, %zero, 179
	lw	%at, 3(%a0)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	j	bnei_cont.12999
bnei_else.12998:
bnei_cont.12999:
	lw	%a0, 0(%sp)
	beqi	%a0, 4, bnei_else.13000
	addi	%a0, %zero, 179
	lw	%at, 4(%a0)
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %at, 0
	j	trace_diffuse_rays.2978
bnei_else.13000:
	lw	%ra, 3(%sp)
	jr	%ra
calc_diffuse_using_1point.2986:
	add	%k1, %zero, %v0
	add	%t0, %zero, %v1
	add	%a1, %zero, %a0
	sw	%a1, 0(%sp)
	add	%a1, %zero, %a0
	sw	%a1, 1(%sp)
	sw	%t4, 2(%sp)
	sw	%t3, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%t1, 5(%sp)
	add	%t6, %zero, %a0
	add	%t5, %zero, %ra
	addi	%v0, %k1, 0
	addi	%sp, %sp, 6
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -6
	addi	%t1, %v0, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 6
	jal	p_nvectors.2742
	addi	%sp, %sp, -6
	addi	%t2, %v0, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 6
	jal	p_intersection_points.2727
	addi	%sp, %sp, -6
	addi	%t3, %v0, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 6
	jal	p_energy.2733
	addi	%sp, %sp, -6
	addi	%t4, %v0, 0
	add	%at, %t1, %t0
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 6
	jal	veccpy.2647
	addi	%sp, %sp, -6
	addi	%v0, %k1, 0
	addi	%sp, %sp, 6
	jal	p_group_id.2737
	addi	%sp, %sp, -6
	add	%at, %t2, %t0
	lw	%at, 0(%at)
	add	%at, %t3, %t0
	lw	%at, 0(%at)
	addi	%a0, %at, 0
	addi	%v1, %at, 0
	addi	%sp, %sp, 6
	jal	trace_diffuse_ray_80percent.2982
	addi	%sp, %sp, -6
	add	%at, %t4, %t0
	lw	%at, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	lw	%a0, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%t4, 2(%sp)
	lw	%t3, 3(%sp)
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	add	%a0, %zero, %t6
	add	%ra, %zero, %t5
	addi	%v1, %at, 0
	j	vecaccumv.2679
calc_diffuse_using_5points.2989:
	add	%t2, %zero, %v0
	add	%t3, %zero, %a0
	add	%t4, %zero, %a1
	add	%k1, %zero, %a2
	add	%a1, %zero, %a0
	sw	%a1, 0(%sp)
	add	%a1, %zero, %a0
	sw	%a1, 1(%sp)
	add	%a1, %zero, %a0
	sw	%a1, 2(%sp)
	add	%a1, %zero, %a0
	sw	%a1, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	add	%t6, %zero, %ra
	add	%at, %v1, %t2
	lw	%v0, 0(%at)
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	addi	%a1, %t2, -1
	add	%at, %t3, %a1
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -7
	addi	%t1, %v0, 0
	add	%at, %t3, %t2
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -7
	addi	%t5, %v0, 0
	addi	%a1, %t2, 1
	add	%at, %t3, %a1
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -7
	addi	%t3, %v0, 0
	add	%at, %t4, %t2
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -7
	addi	%t2, %v0, 0
	add	%at, %t0, %k1
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 7
	jal	veccpy.2647
	addi	%sp, %sp, -7
	add	%at, %t1, %k1
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 7
	jal	vecadd.2670
	addi	%sp, %sp, -7
	add	%at, %t5, %k1
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 7
	jal	vecadd.2670
	addi	%sp, %sp, -7
	add	%at, %t3, %k1
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 7
	jal	vecadd.2670
	addi	%sp, %sp, -7
	add	%at, %t2, %k1
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 7
	jal	vecadd.2670
	addi	%sp, %sp, -7
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	p_energy.2733
	addi	%sp, %sp, -7
	add	%at, %v0, %k1
	lw	%at, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	lw	%a0, 0(%sp)
	lw	%a0, 1(%sp)
	lw	%a0, 2(%sp)
	lw	%a0, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	add	%ra, %zero, %t6
	addi	%v1, %at, 0
	j	vecaccumv.2679
do_without_neighbors.2995:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.13002
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_surface_ids.2729
	addi	%sp, %sp, -3
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.13003
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -3
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%at, 0(%at)
	beqi	%at, 0, bnei_else.13004
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -3
	j	bnei_cont.13005
bnei_else.13004:
bnei_cont.13005:
	lw	%v1, 1(%sp)
	addi	%v1, %v1, 1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2995
bgti_else.13003:
	lw	%ra, 2(%sp)
	jr	%ra
bgt_else.13002:
	lw	%ra, 2(%sp)
	jr	%ra
neighbors_exist.2998:
	add	%a1, %zero, %v0
	addi	%a0, %zero, 154
	lw	%a2, 1(%a0)
	addi	%a0, %v1, 1
	blt	%a0, %a2, bgt_else.13008
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.13008:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.13009
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.13009:
	addi	%a0, %zero, 154
	lw	%a2, 0(%a0)
	addi	%a0, %a1, 1
	blt	%a0, %a2, bgt_else.13010
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.13010:
	addi	%at, %zero, 0
	blt	%at, %a1, bgt_else.13011
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.13011:
	addi	%v0, %zero, 1
	jr	%ra
get_surface_id.3002:
	sw	%v1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	p_surface_ids.2729
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	jr	%ra
neighbors_are_available.3005:
	add	%t0, %zero, %v0
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a1, 2(%sp)
	add	%t1, %zero, %a2
	add	%t2, %zero, %a0
	add	%t3, %zero, %a0
	add	%t4, %zero, %a0
	add	%t5, %zero, %a0
	add	%t6, %zero, %a0
	add	%a1, %zero, %a0
	sw	%a1, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%ra, 5(%sp)
	lw	%a1, 1(%sp)
	add	%at, %a1, %t0
	lw	%v0, 0(%at)
	addi	%v1, %t1, 0
	addi	%sp, %sp, 6
	jal	get_surface_id.3002
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a0, %t0
	lw	%at, 0(%at)
	addi	%v1, %t1, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.13012
	lw	%a0, 2(%sp)
	add	%at, %a0, %t0
	lw	%at, 0(%at)
	addi	%v1, %t1, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.13013
	addi	%a0, %t0, -1
	lw	%a1, 1(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	addi	%v1, %t1, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.13014
	addi	%a0, %t0, 1
	lw	%a1, 1(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	addi	%v1, %t1, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.13015
	add	%a0, %zero, %t2
	add	%a0, %zero, %t3
	add	%a0, %zero, %t4
	add	%a0, %zero, %t5
	add	%a0, %zero, %t6
	lw	%a0, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.13015:
	add	%a0, %zero, %t2
	add	%a0, %zero, %t3
	add	%a0, %zero, %t4
	add	%a0, %zero, %t5
	add	%a0, %zero, %t6
	lw	%a0, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
beq_else.13014:
	add	%a0, %zero, %t2
	add	%a0, %zero, %t3
	add	%a0, %zero, %t4
	add	%a0, %zero, %t5
	add	%a0, %zero, %t6
	lw	%a0, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
beq_else.13013:
	add	%a0, %zero, %t2
	add	%a0, %zero, %t3
	add	%a0, %zero, %t4
	add	%a0, %zero, %t5
	add	%a0, %zero, %t6
	lw	%a0, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
beq_else.13012:
	add	%a0, %zero, %t2
	add	%a0, %zero, %t3
	add	%a0, %zero, %t4
	add	%a0, %zero, %t5
	add	%a0, %zero, %t6
	lw	%a0, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	jr	%ra
try_exploit_neighbors.3011:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%a3, 5(%sp)
	sw	%ra, 6(%sp)
	lw	%a0, 3(%sp)
	lw	%v0, 0(%sp)
	add	%at, %a0, %v0
	lw	%at, 0(%at)
	lw	%a2, 5(%sp)
	addi	%at, %zero, 4
	blt	%at, %a2, bgt_else.13016
	lw	%a2, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	blti	%v0, 0, bgti_else.13017
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%k0, 2(%sp)
	lw	%v0, 0(%sp)
	lw	%a2, 5(%sp)
	addi	%v1, %k0, 0
	addi	%sp, %sp, 7
	jal	neighbors_are_available.3005
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.13018
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -7
	lw	%a2, 5(%sp)
	add	%at, %v0, %a2
	lw	%at, 0(%at)
	beqi	%at, 0, bnei_else.13019
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%k0, 2(%sp)
	lw	%v0, 0(%sp)
	lw	%a2, 5(%sp)
	addi	%v1, %k0, 0
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -7
	j	bnei_cont.13020
bnei_else.13019:
bnei_cont.13020:
	lw	%a2, 5(%sp)
	addi	%a3, %a2, 1
	lw	%ra, 6(%sp)
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%k0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a2, %a1, 0
	addi	%a1, %a0, 0
	addi	%a0, %k0, 0
	j	try_exploit_neighbors.3011
bnei_else.13018:
	lw	%ra, 6(%sp)
	lw	%a2, 5(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %at, 0
	j	do_without_neighbors.2995
bgti_else.13017:
	lw	%ra, 6(%sp)
	jr	%ra
bgt_else.13016:
	lw	%ra, 6(%sp)
	jr	%ra
write_ppm_header.3018:
	sw	%t6, 0(%sp)
	sw	%t5, 1(%sp)
	sw	%t4, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%v0, %zero, 80
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	addi	%v0, %zero, 51
	addi	%sp, %sp, 4
	jal	min_caml_print_char
	addi	%sp, %sp, -4
	addi	%a0, %zero, 10
	sw	%a0, 4(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	addi	%a0, %zero, 154
	lw	%v0, 0(%a0)
	addi	%sp, %sp, 5
	jal	print_int.2627
	addi	%sp, %sp, -5
	addi	%t4, %zero, 32
	addi	%v0, %t4, 0
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	addi	%a0, %zero, 154
	lw	%v0, 1(%a0)
	addi	%sp, %sp, 5
	jal	print_int.2627
	addi	%sp, %sp, -5
	addi	%v0, %t4, 0
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	addi	%v0, %zero, 255
	addi	%sp, %sp, 5
	jal	print_int.2627
	addi	%sp, %sp, -5
	lw	%t6, 0(%sp)
	lw	%t5, 1(%sp)
	lw	%t4, 2(%sp)
	lw	%ra, 3(%sp)
	lw	%v0, 4(%sp)
	j	min_caml_print_char
write_rgb_element.3020:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.13023
	blti	%v0, 0, bgti_else.13025
	j	bgti_cont.13026
bgti_else.13025:
	addi	%v0, %zero, 0
bgti_cont.13026:
	j	bgt_cont.13024
bgt_else.13023:
	addi	%v0, %zero, 255
bgt_cont.13024:
	j	print_int.2627
write_rgb.3022:
	sw	%t6, 0(%sp)
	sw	%t5, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%a0, %zero, 151
	flw	%f0, 0(%a0)
	addi	%sp, %sp, 3
	jal	write_rgb_element.3020
	addi	%sp, %sp, -3
	addi	%t5, %zero, 32
	addi	%v0, %t5, 0
	addi	%sp, %sp, 3
	jal	min_caml_print_char
	addi	%sp, %sp, -3
	addi	%a0, %zero, 151
	flw	%f0, 1(%a0)
	addi	%sp, %sp, 3
	jal	write_rgb_element.3020
	addi	%sp, %sp, -3
	addi	%v0, %t5, 0
	addi	%sp, %sp, 3
	jal	min_caml_print_char
	addi	%sp, %sp, -3
	addi	%a0, %zero, 151
	flw	%f0, 2(%a0)
	addi	%sp, %sp, 3
	jal	write_rgb_element.3020
	addi	%sp, %sp, -3
	addi	%v0, %zero, 10
	lw	%t6, 0(%sp)
	lw	%t5, 1(%sp)
	lw	%ra, 2(%sp)
	j	min_caml_print_char
pretrace_diffuse_rays.3024:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.13027
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	get_surface_id.3002
	addi	%sp, %sp, -4
	blti	%v0, 0, bgti_else.13028
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -4
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%at, 0(%at)
	beqi	%at, 0, bnei_else.13029
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	p_group_id.2737
	addi	%sp, %sp, -4
	sw	%v0, 4(%sp)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 5
	jal	vecbzero.2645
	addi	%sp, %sp, -5
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	p_nvectors.2742
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	p_intersection_points.2727
	addi	%sp, %sp, -6
	addi	%a1, %zero, 179
	lw	%a0, 4(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	lw	%a0, 5(%sp)
	lw	%v1, 1(%sp)
	add	%at, %a0, %v1
	lw	%at, 0(%at)
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%at, 0(%at)
	addi	%a0, %at, 0
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -6
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -6
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%at, 0(%at)
	addi	%v1, %zero, 148
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	veccpy.2647
	addi	%sp, %sp, -6
	j	bnei_cont.13030
bnei_else.13029:
bnei_cont.13030:
	lw	%v1, 1(%sp)
	addi	%v1, %v1, 1
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3024
bgti_else.13028:
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
bgt_else.13027:
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
pretrace_pixels.3027:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%t6, 6(%sp)
	sw	%t4, 7(%sp)
	sw	%t3, 8(%sp)
	sw	%t2, 9(%sp)
	sw	%t1, 10(%sp)
	sw	%t0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%t0, %zero, 0
	lw	%a1, 4(%sp)
	blti	%a1, 0, bgti_else.13033
	addi	%a0, %zero, 158
	flw	%f1, 0(%a0)
	addi	%a0, %zero, 156
	lw	%a0, 0(%a0)
	lw	%a1, 4(%sp)
	sub	%a0, %a1, %a0
	itof	%f0, %a0
	fmul	%f16, %f1, %f0
	addi	%a0, %zero, 165
	flw	%f0, 0(%a0)
	fmul	%f1, %f16, %f0
	flw	%f0, 0(%sp)
	fadd	%f0, %f1, %f0
	addi	%a0, %zero, 174
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 1
	sw	%a0, 13(%sp)
	addi	%a0, %zero, 165
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	flw	%f1, 1(%sp)
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 174
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 165
	flw	%f0, 2(%a0)
	fmul	%f0, %f16, %f0
	flw	%f2, 2(%sp)
	fadd	%f0, %f0, %f2
	addi	%a0, %zero, 174
	fsw	%f0, 2(%a0)
	addi	%v0, %zero, 174
	addi	%v1, %t0, 0
	addi	%sp, %sp, 14
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -14
	addi	%v0, %zero, 151
	addi	%sp, %sp, 14
	jal	vecbzero.2645
	addi	%sp, %sp, -14
	addi	%v1, %zero, 75
	addi	%v0, %zero, 159
	addi	%sp, %sp, 14
	jal	veccpy.2647
	addi	%sp, %sp, -14
	flw	%f0, 477(%zero)
	lw	%v0, 3(%sp)
	lw	%a1, 4(%sp)
	add	%at, %v0, %a1
	lw	%at, 0(%at)
	flw	%f1, 482(%zero)
	addi	%v1, %zero, 174
	addi	%a0, %at, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 14
	jal	trace_ray.2964
	addi	%sp, %sp, -14
	addi	%v0, %at, 0
	addi	%sp, %sp, 14
	jal	p_rgb.2725
	addi	%sp, %sp, -14
	addi	%v1, %zero, 151
	addi	%sp, %sp, 14
	jal	veccpy.2647
	addi	%sp, %sp, -14
	lw	%v0, 5(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 14
	jal	p_set_group_id.2739
	addi	%sp, %sp, -14
	addi	%v1, %t0, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 14
	jal	pretrace_diffuse_rays.3024
	addi	%sp, %sp, -14
	lw	%a1, 4(%sp)
	addi	%a0, %a1, -1
	sw	%a0, 14(%sp)
	lw	%v1, 13(%sp)
	lw	%v0, 5(%sp)
	addi	%sp, %sp, 15
	jal	add_mod5.2634
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	lw	%t6, 6(%sp)
	lw	%t4, 7(%sp)
	lw	%t3, 8(%sp)
	lw	%t2, 9(%sp)
	lw	%t1, 10(%sp)
	lw	%t0, 11(%sp)
	lw	%ra, 12(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 14(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3027
bgti_else.13033:
	lw	%t6, 6(%sp)
	lw	%t4, 7(%sp)
	lw	%t3, 8(%sp)
	lw	%t2, 9(%sp)
	lw	%t1, 10(%sp)
	lw	%t0, 11(%sp)
	lw	%ra, 12(%sp)
	jr	%ra
pretrace_line.3034:
	addi	%a1, %zero, 158
	flw	%f1, 0(%a1)
	addi	%a1, %zero, 156
	lw	%a1, 1(%a1)
	sub	%a1, %v1, %a1
	itof	%f0, %a1
	fmul	%f17, %f1, %f0
	addi	%a1, %zero, 168
	flw	%f0, 0(%a1)
	fmul	%f1, %f17, %f0
	addi	%a1, %zero, 171
	flw	%f0, 0(%a1)
	fadd	%f0, %f1, %f0
	addi	%a1, %zero, 168
	flw	%f1, 1(%a1)
	fmul	%f16, %f17, %f1
	addi	%a1, %zero, 171
	flw	%f1, 1(%a1)
	fadd	%f1, %f16, %f1
	addi	%a1, %zero, 168
	flw	%f16, 2(%a1)
	fmul	%f17, %f17, %f16
	addi	%a1, %zero, 171
	flw	%f16, 2(%a1)
	fadd	%f2, %f17, %f16
	addi	%a1, %zero, 154
	lw	%a1, 0(%a1)
	addi	%v1, %a1, -1
	j	pretrace_pixels.3027
scan_pixel.3038:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 6(%sp)
	addi	%a0, %zero, 154
	lw	%a0, 0(%a0)
	lw	%v0, 0(%sp)
	blt	%v0, %a0, bgt_else.13035
	lw	%ra, 5(%sp)
	jr	%ra
bgt_else.13035:
	lw	%a1, 3(%sp)
	lw	%v0, 0(%sp)
	add	%at, %a1, %v0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	p_rgb.2725
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0
	addi	%v0, %zero, 151
	addi	%sp, %sp, 7
	jal	veccpy.2647
	addi	%sp, %sp, -7
	lw	%a2, 4(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a0, %a2, 0
	addi	%sp, %sp, 7
	jal	neighbors_exist.2998
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.13037
	lw	%a3, 6(%sp)
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -7
	j	bnei_cont.13038
bnei_else.13037:
	lw	%a3, 6(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -7
bnei_cont.13038:
	addi	%sp, %sp, 7
	jal	write_rgb.3022
	addi	%sp, %sp, -7
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	lw	%ra, 5(%sp)
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	scan_pixel.3038
scan_line.3044:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%a0, %zero, 154
	lw	%a0, 1(%a0)
	lw	%a3, 0(%sp)
	blt	%a3, %a0, bgt_else.13039
	lw	%ra, 5(%sp)
	jr	%ra
bgt_else.13039:
	addi	%a0, %a0, -1
	lw	%a3, 0(%sp)
	blt	%a3, %a0, bgt_else.13041
	j	bgt_cont.13042
bgt_else.13041:
	lw	%a3, 0(%sp)
	addi	%v1, %a3, 1
	lw	%a0, 4(%sp)
	lw	%k0, 3(%sp)
	addi	%v0, %k0, 0
	addi	%sp, %sp, 6
	jal	pretrace_line.3034
	addi	%sp, %sp, -6
bgt_cont.13042:
	addi	%a0, %zero, 0
	lw	%k0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a3, 0(%sp)
	addi	%a2, %k0, 0
	addi	%a1, %v1, 0
	addi	%v0, %a0, 0
	addi	%v1, %a3, 0
	addi	%sp, %sp, 6
	jal	scan_pixel.3038
	addi	%sp, %sp, -6
	lw	%a3, 0(%sp)
	addi	%a0, %a3, 1
	sw	%a0, 6(%sp)
	addi	%v1, %zero, 2
	lw	%a0, 4(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 7
	jal	add_mod5.2634
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	lw	%ra, 5(%sp)
	lw	%a0, 1(%sp)
	lw	%k0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%a3, 6(%sp)
	addi	%a1, %a0, 0
	addi	%v0, %a3, 0
	addi	%a0, %k0, 0
	j	scan_line.3044
create_float5x3array.3050:
	fsw	%f15, 0(%sp)
	sw	%t6, 1(%sp)
	sw	%t5, 2(%sp)
	sw	%t4, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%t4, %zero, 3
	flw	%f15, 482(%zero)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	addi	%a0, %v0, 0
	lw	%v0, 5(%sp)
	sw	%a0, 1(%v0)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	addi	%a0, %v0, 0
	lw	%v0, 5(%sp)
	sw	%a0, 2(%v0)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	addi	%a0, %v0, 0
	lw	%v0, 5(%sp)
	sw	%a0, 3(%v0)
	addi	%v0, %t4, 0
	fmov	%f0, %f15
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	addi	%a0, %v0, 0
	lw	%v0, 5(%sp)
	sw	%a0, 4(%v0)
	flw	%f15, 0(%sp)
	lw	%t6, 1(%sp)
	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 5(%sp)
	jr	%ra
create_pixel.3052:
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
	jal	create_float5x3array.3050
	addi	%sp, %sp, -8
	addi	%t1, %v0, 0
	addi	%t3, %zero, 5
	addi	%t6, %zero, 0
	addi	%v1, %t6, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	addi	%t2, %v0, 0
	addi	%v1, %t6, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	addi	%t3, %v0, 0
	addi	%sp, %sp, 8
	jal	create_float5x3array.3050
	addi	%sp, %sp, -8
	addi	%t4, %v0, 0
	addi	%sp, %sp, 8
	jal	create_float5x3array.3050
	addi	%sp, %sp, -8
	addi	%t5, %v0, 0
	addi	%v0, %zero, 1
	addi	%v1, %t6, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	addi	%t6, %v0, 0
	addi	%sp, %sp, 8
	jal	create_float5x3array.3050
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v0)
	sw	%t6, 6(%v0)
	sw	%t5, 5(%v0)
	sw	%t4, 4(%v0)
	sw	%t3, 3(%v0)
	sw	%t2, 2(%v0)
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
init_line_elements.3054:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%a1, 1(%sp)
	blti	%a1, 0, bgti_else.13043
	addi	%sp, %sp, 3
	jal	create_pixel.3052
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	lw	%v0, 0(%sp)
	lw	%a1, 1(%sp)
	add	%at, %v0, %a1
	sw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	addi	%v1, %a1, -1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	init_line_elements.3054
bgti_else.13043:
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	jr	%ra
create_pixelline.3057:
	sw	%t6, 0(%sp)
	sw	%t5, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%a0, %zero, 154
	lw	%t5, 0(%a0)
	addi	%sp, %sp, 3
	jal	create_pixel.3052
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %t5, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%v1, %t5, -2
	lw	%t6, 0(%sp)
	lw	%t5, 1(%sp)
	lw	%ra, 2(%sp)
	j	init_line_elements.3054
tan.3059:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 2
	jal	sin.2618
	addi	%sp, %sp, -2
	fsw	%f0, 2(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 3
	jal	cos.2616
	addi	%sp, %sp, -3
	lw	%ra, 1(%sp)
	flw	%f1, 2(%sp)
	fdiv	%f0, %f1, %f0
	jr	%ra
adjust_position.3061:
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	fmul	%f1, %f0, %f0
	flw	%f0, 439(%zero)
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	fsw	%f0, 2(%sp)
	flw	%f0, 477(%zero)
	flw	%f1, 2(%sp)
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 3
	jal	atan.2620
	addi	%sp, %sp, -3
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	addi	%sp, %sp, 3
	jal	tan.3059
	addi	%sp, %sp, -3
	lw	%ra, 1(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	jr	%ra
calc_dirvec.3064:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f3, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%v1, 5(%sp)
	sw	%a0, 6(%sp)
	fsw	%f11, 7(%sp)
	fsw	%f10, 8(%sp)
	fsw	%f9, 9(%sp)
	fsw	%f8, 10(%sp)
	fsw	%f7, 11(%sp)
	fsw	%f6, 12(%sp)
	sw	%ra, 13(%sp)
	lw	%a0, 4(%sp)
	blti	%a0, 5, bgti_else.13044
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 14
	jal	fsqr.2606
	addi	%sp, %sp, -14
	fmov	%f10, %f0
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 14
	jal	fsqr.2606
	addi	%sp, %sp, -14
	fadd	%f0, %f10, %f0
	flw	%f10, 477(%zero)
	fadd	%f0, %f0, %f10
	fsqrt	%f1, %f0
	flw	%f0, 0(%sp)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 14(%sp)
	flw	%f0, 1(%sp)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 15(%sp)
	fdiv	%f6, %f10, %f1
	addi	%a0, %zero, 179
	lw	%v1, 5(%sp)
	add	%at, %a0, %v1
	lw	%at, 0(%at)
	lw	%a0, 6(%sp)
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 16
	jal	d_vec.2744
	addi	%sp, %sp, -16
	flw	%f11, 15(%sp)
	flw	%f10, 14(%sp)
	fmov	%f2, %f6
	fmov	%f1, %f11
	fmov	%f0, %f10
	addi	%sp, %sp, 16
	jal	vecset.2637
	addi	%sp, %sp, -16
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 40
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 16
	jal	d_vec.2744
	addi	%sp, %sp, -16
	flw	%f11, 15(%sp)
	fneg	%f2, %f11
	flw	%f10, 14(%sp)
	fmov	%f1, %f6
	fmov	%f0, %f10
	addi	%sp, %sp, 16
	jal	vecset.2637
	addi	%sp, %sp, -16
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 80
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 16
	jal	d_vec.2744
	addi	%sp, %sp, -16
	flw	%f10, 14(%sp)
	fneg	%f1, %f10
	flw	%f11, 15(%sp)
	fneg	%f2, %f11
	fmov	%f0, %f6
	addi	%sp, %sp, 16
	jal	vecset.2637
	addi	%sp, %sp, -16
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 1
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 16
	jal	d_vec.2744
	addi	%sp, %sp, -16
	flw	%f10, 14(%sp)
	fneg	%f0, %f10
	flw	%f11, 15(%sp)
	fneg	%f1, %f11
	fneg	%f2, %f6
	addi	%sp, %sp, 16
	jal	vecset.2637
	addi	%sp, %sp, -16
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 41
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 16
	jal	d_vec.2744
	addi	%sp, %sp, -16
	flw	%f10, 14(%sp)
	fneg	%f0, %f10
	fneg	%f1, %f6
	flw	%f11, 15(%sp)
	fmov	%f2, %f11
	addi	%sp, %sp, 16
	jal	vecset.2637
	addi	%sp, %sp, -16
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 81
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 16
	jal	d_vec.2744
	addi	%sp, %sp, -16
	fneg	%f0, %f6
	flw	%f11, 7(%sp)
	flw	%f10, 8(%sp)
	flw	%f9, 9(%sp)
	flw	%f8, 10(%sp)
	flw	%f7, 11(%sp)
	flw	%f6, 12(%sp)
	lw	%ra, 13(%sp)
	flw	%f11, 15(%sp)
	flw	%f10, 14(%sp)
	fmov	%f2, %f11
	fmov	%f1, %f10
	j	vecset.2637
bgti_else.13044:
	flw	%f2, 2(%sp)
	flw	%f0, 1(%sp)
	fmov	%f1, %f2
	addi	%sp, %sp, 16
	jal	adjust_position.3061
	addi	%sp, %sp, -16
	fsw	%f0, 16(%sp)
	lw	%a0, 4(%sp)
	addi	%a0, %a0, 1
	sw	%a0, 17(%sp)
	flw	%f3, 3(%sp)
	flw	%f0, 16(%sp)
	fmov	%f1, %f3
	addi	%sp, %sp, 18
	jal	adjust_position.3061
	addi	%sp, %sp, -18
	fmov	%f1, %f0
	flw	%f11, 7(%sp)
	flw	%f10, 8(%sp)
	flw	%f9, 9(%sp)
	flw	%f8, 10(%sp)
	flw	%f7, 11(%sp)
	flw	%f6, 12(%sp)
	lw	%ra, 13(%sp)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	lw	%v0, 17(%sp)
	flw	%f3, 3(%sp)
	flw	%f2, 2(%sp)
	flw	%f0, 16(%sp)
	j	calc_dirvec.3064
calc_dirvecs.3072:
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%a0, 3(%sp)
	fsw	%f8, 4(%sp)
	fsw	%f7, 5(%sp)
	fsw	%f6, 6(%sp)
	sw	%t3, 7(%sp)
	sw	%t2, 8(%sp)
	sw	%t1, 9(%sp)
	sw	%t0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%t0, %zero, 0
	lw	%a0, 1(%sp)
	blti	%a0, 0, bgti_else.13045
	lw	%a0, 1(%sp)
	itof	%f0, %a0
	flw	%f6, 473(%zero)
	fmul	%f1, %f0, %f6
	flw	%f0, 436(%zero)
	fsub	%f2, %f1, %f0
	flw	%f7, 482(%zero)
	flw	%f0, 0(%sp)
	lw	%a0, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	fmov	%f3, %f0
	fmov	%f1, %f7
	fmov	%f0, %f7
	addi	%sp, %sp, 12
	jal	calc_dirvec.3064
	addi	%sp, %sp, -12
	lw	%a0, 1(%sp)
	itof	%f0, %a0
	fmul	%f1, %f0, %f6
	flw	%f0, 439(%zero)
	fadd	%f2, %f1, %f0
	lw	%a0, 3(%sp)
	addi	%a0, %a0, 2
	flw	%f0, 0(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %t0, 0
	fmov	%f3, %f0
	fmov	%f1, %f7
	fmov	%f0, %f7
	addi	%sp, %sp, 12
	jal	calc_dirvec.3064
	addi	%sp, %sp, -12
	addi	%v1, %zero, 1
	lw	%a0, 1(%sp)
	addi	%a0, %a0, -1
	sw	%a0, 12(%sp)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 13
	jal	add_mod5.2634
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0
	flw	%f8, 4(%sp)
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%t3, 7(%sp)
	lw	%t2, 8(%sp)
	lw	%t1, 9(%sp)
	lw	%t0, 10(%sp)
	lw	%ra, 11(%sp)
	flw	%f0, 0(%sp)
	lw	%a0, 3(%sp)
	lw	%v0, 12(%sp)
	j	calc_dirvecs.3072
bgti_else.13045:
	flw	%f8, 4(%sp)
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%t3, 7(%sp)
	lw	%t2, 8(%sp)
	lw	%t1, 9(%sp)
	lw	%t0, 10(%sp)
	lw	%ra, 11(%sp)
	jr	%ra
calc_dirvec_rows.3077:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	lw	%a0, 0(%sp)
	blti	%a0, 0, bgti_else.13047
	lw	%a0, 0(%sp)
	itof	%f1, %a0
	flw	%f0, 473(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 436(%zero)
	fsub	%f0, %f1, %f0
	addi	%a1, %zero, 4
	lw	%a0, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 4
	jal	calc_dirvecs.3072
	addi	%sp, %sp, -4
	lw	%a0, 0(%sp)
	addi	%a0, %a0, -1
	sw	%a0, 4(%sp)
	addi	%v1, %zero, 2
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 5
	jal	add_mod5.2634
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0
	lw	%a0, 2(%sp)
	addi	%a0, %a0, 4
	lw	%ra, 3(%sp)
	lw	%v0, 4(%sp)
	j	calc_dirvec_rows.3077
bgti_else.13047:
	lw	%ra, 3(%sp)
	jr	%ra
create_dirvec.3081:
	sw	%t6, 0(%sp)
	sw	%t5, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 482(%zero)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%t5, %v0, 0
	addi	%a0, %zero, 0
	lw	%v0, 0(%a0)
	addi	%v1, %t5, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%a0, 1(%v0)
	sw	%t5, 0(%v0)
	lw	%t6, 0(%sp)
	lw	%t5, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
create_dirvec_elements.3083:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%a1, 1(%sp)
	blti	%a1, 0, bgti_else.13049
	addi	%sp, %sp, 3
	jal	create_dirvec.3081
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	lw	%v0, 0(%sp)
	lw	%a1, 1(%sp)
	add	%at, %v0, %a1
	sw	%a0, 0(%at)
	lw	%a1, 1(%sp)
	addi	%v1, %a1, -1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	create_dirvec_elements.3083
bgti_else.13049:
	lw	%ra, 2(%sp)
	jr	%ra
create_dirvecs.3086:
	sw	%v0, 0(%sp)
	sw	%t0, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%a1, 0(%sp)
	blti	%a1, 0, bgti_else.13051
	addi	%a0, %zero, 120
	sw	%a0, 3(%sp)
	addi	%sp, %sp, 4
	jal	create_dirvec.3081
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a0, %zero, 179
	lw	%a1, 0(%sp)
	add	%at, %a0, %a1
	sw	%v0, 0(%at)
	addi	%a0, %zero, 179
	lw	%a1, 0(%sp)
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	addi	%v1, %zero, 118
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	create_dirvec_elements.3083
	addi	%sp, %sp, -4
	lw	%a1, 0(%sp)
	addi	%v0, %a1, -1
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	j	create_dirvecs.3086
bgti_else.13051:
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
init_dirvec_constants.3088:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	lw	%a1, 1(%sp)
	blti	%a1, 0, bgti_else.13053
	lw	%v0, 0(%sp)
	lw	%a1, 1(%sp)
	add	%at, %v0, %a1
	lw	%a0, 0(%at)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 3
	jal	setup_dirvec_constants.2873
	addi	%sp, %sp, -3
	lw	%a1, 1(%sp)
	addi	%v1, %a1, -1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	init_dirvec_constants.3088
bgti_else.13053:
	lw	%ra, 2(%sp)
	jr	%ra
init_vecset_constants.3091:
	add	%a0, %zero, %v0
	sw	%a0, 0(%sp)
	sw	%ra, 1(%sp)
	lw	%a1, 0(%sp)
	blti	%a1, 0, bgti_else.13055
	addi	%a0, %zero, 179
	lw	%a1, 0(%sp)
	add	%at, %a0, %a1
	lw	%v0, 0(%at)
	addi	%v1, %zero, 119
	addi	%sp, %sp, 2
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -2
	lw	%a1, 0(%sp)
	addi	%v0, %a1, -1
	lw	%ra, 1(%sp)
	j	init_vecset_constants.3091
bgti_else.13055:
	lw	%ra, 1(%sp)
	jr	%ra
init_dirvecs.3093:
	sw	%ra, 0(%sp)
	addi	%a0, %zero, 4
	sw	%a0, 1(%sp)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 2
	jal	create_dirvecs.3086
	addi	%sp, %sp, -2
	addi	%v0, %zero, 9
	addi	%v1, %zero, 0
	addi	%a0, %v1, 0
	addi	%sp, %sp, 2
	jal	calc_dirvec_rows.3077
	addi	%sp, %sp, -2
	lw	%ra, 0(%sp)
	lw	%v0, 1(%sp)
	j	init_vecset_constants.3091
add_reflection.3095:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f3, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%v1, 5(%sp)
	sw	%t6, 6(%sp)
	sw	%t5, 7(%sp)
	sw	%t4, 8(%sp)
	sw	%t3, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	create_dirvec.3081
	addi	%sp, %sp, -11
	addi	%t3, %v0, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 11
	jal	d_vec.2744
	addi	%sp, %sp, -11
	flw	%f2, 3(%sp)
	flw	%f1, 2(%sp)
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 11
	jal	vecset.2637
	addi	%sp, %sp, -11
	addi	%v0, %t3, 0
	addi	%sp, %sp, 11
	jal	setup_dirvec_constants.2873
	addi	%sp, %sp, -11
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 0(%sp)
	fsw	%f0, 2(%a0)
	sw	%t3, 1(%a0)
	lw	%a1, 5(%sp)
	sw	%a1, 0(%a0)
	addi	%a2, %zero, 254
	lw	%t6, 6(%sp)
	lw	%t5, 7(%sp)
	lw	%t4, 8(%sp)
	lw	%t3, 9(%sp)
	lw	%ra, 10(%sp)
	lw	%a1, 4(%sp)
	add	%at, %a2, %a1
	sw	%a0, 0(%at)
	jr	%ra
setup_rect_reflection.3102:
	fsw	%f15, 0(%sp)
	fsw	%f14, 1(%sp)
	fsw	%f13, 2(%sp)
	fsw	%f12, 3(%sp)
	fsw	%f11, 4(%sp)
	fsw	%f10, 5(%sp)
	sw	%t6, 6(%sp)
	sw	%t5, 7(%sp)
	sw	%t4, 8(%sp)
	sw	%t3, 9(%sp)
	sw	%ra, 10(%sp)
	sll	%t3, %v0, 2
	addi	%a0, %zero, 434
	lw	%t4, 0(%a0)
	flw	%f10, 477(%zero)
	addi	%v0, %v1, 0
	addi	%sp, %sp, 11
	jal	o_diffuse.2707
	addi	%sp, %sp, -11
	fsub	%f10, %f10, %f0
	addi	%a0, %zero, 78
	flw	%f1, 0(%a0)
	fneg	%f11, %f1
	addi	%a0, %zero, 78
	flw	%f12, 1(%a0)
	fneg	%f14, %f12
	addi	%a0, %zero, 78
	flw	%f13, 2(%a0)
	fneg	%f15, %f13
	addi	%v1, %t3, 1
	addi	%v0, %t4, 0
	fmov	%f3, %f15
	fmov	%f2, %f14
	fmov	%f0, %f10
	addi	%sp, %sp, 11
	jal	add_reflection.3095
	addi	%sp, %sp, -11
	addi	%v0, %t4, 1
	addi	%v1, %t3, 2
	fmov	%f3, %f15
	fmov	%f2, %f12
	fmov	%f1, %f11
	fmov	%f0, %f10
	addi	%sp, %sp, 11
	jal	add_reflection.3095
	addi	%sp, %sp, -11
	addi	%v0, %t4, 2
	addi	%v1, %t3, 3
	fmov	%f3, %f13
	fmov	%f2, %f14
	fmov	%f1, %f11
	fmov	%f0, %f10
	addi	%sp, %sp, 11
	jal	add_reflection.3095
	addi	%sp, %sp, -11
	addi	%a1, %t4, 3
	addi	%a0, %zero, 434
	flw	%f15, 0(%sp)
	flw	%f14, 1(%sp)
	flw	%f13, 2(%sp)
	flw	%f12, 3(%sp)
	flw	%f11, 4(%sp)
	flw	%f10, 5(%sp)
	lw	%t6, 6(%sp)
	lw	%t5, 7(%sp)
	lw	%t4, 8(%sp)
	lw	%t3, 9(%sp)
	lw	%ra, 10(%sp)
	sw	%a1, 0(%a0)
	jr	%ra
setup_surface_reflection.3105:
	sw	%v1, 0(%sp)
	fsw	%f15, 1(%sp)
	fsw	%f14, 2(%sp)
	fsw	%f13, 3(%sp)
	fsw	%f12, 4(%sp)
	fsw	%f11, 5(%sp)
	sw	%t6, 6(%sp)
	sw	%t5, 7(%sp)
	sw	%t4, 8(%sp)
	sw	%t3, 9(%sp)
	sw	%ra, 10(%sp)
	sll	%a0, %v0, 2
	addi	%t3, %a0, 1
	addi	%a0, %zero, 434
	lw	%t4, 0(%a0)
	flw	%f11, 477(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_diffuse.2707
	addi	%sp, %sp, -11
	fsub	%f13, %f11, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_abc.2699
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0
	addi	%v0, %zero, 78
	addi	%sp, %sp, 11
	jal	veciprod.2658
	addi	%sp, %sp, -11
	fmov	%f15, %f0
	flw	%f14, 468(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_a.2693
	addi	%sp, %sp, -11
	fmul	%f0, %f14, %f0
	fmul	%f1, %f0, %f15
	addi	%a0, %zero, 78
	flw	%f0, 0(%a0)
	fsub	%f12, %f1, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_b.2695
	addi	%sp, %sp, -11
	fmul	%f0, %f14, %f0
	fmul	%f1, %f0, %f15
	addi	%a0, %zero, 78
	flw	%f0, 1(%a0)
	fsub	%f11, %f1, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 11
	jal	o_param_c.2697
	addi	%sp, %sp, -11
	fmul	%f0, %f14, %f0
	fmul	%f1, %f0, %f15
	addi	%a0, %zero, 78
	flw	%f0, 2(%a0)
	fsub	%f3, %f1, %f0
	addi	%v1, %t3, 0
	addi	%v0, %t4, 0
	fmov	%f2, %f11
	fmov	%f1, %f12
	fmov	%f0, %f13
	addi	%sp, %sp, 11
	jal	add_reflection.3095
	addi	%sp, %sp, -11
	addi	%a1, %t4, 1
	addi	%a0, %zero, 434
	flw	%f15, 1(%sp)
	flw	%f14, 2(%sp)
	flw	%f13, 3(%sp)
	flw	%f12, 4(%sp)
	flw	%f11, 5(%sp)
	lw	%t6, 6(%sp)
	lw	%t5, 7(%sp)
	lw	%t4, 8(%sp)
	lw	%t3, 9(%sp)
	lw	%ra, 10(%sp)
	sw	%a1, 0(%a0)
	jr	%ra
setup_reflections.3108:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	blti	%v0, 0, bgti_else.13060
	addi	%a0, %zero, 12
	lw	%v0, 0(%sp)
	add	%at, %a0, %v0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 2
	jal	o_reflectiontype.2687
	addi	%sp, %sp, -2
	beqi	%v0, 2, bnei_else.13061
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.13061:
	addi	%v0, %at, 0
	addi	%sp, %sp, 2
	jal	o_diffuse.2707
	addi	%sp, %sp, -2
	flw	%f1, 477(%zero)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.13063
	addi	%v0, %at, 0
	addi	%sp, %sp, 2
	jal	o_form.2685
	addi	%sp, %sp, -2
	sw	%v0, 2(%sp)
	lw	%a0, 2(%sp)
	beqi	%a0, 1, bnei_else.13064
	lw	%a0, 2(%sp)
	beqi	%a0, 2, bnei_else.13065
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.13065:
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %at, 0
	j	setup_surface_reflection.3105
bnei_else.13064:
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %at, 0
	j	setup_rect_reflection.3102
bnei_else.13063:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.13060:
	lw	%ra, 1(%sp)
	jr	%ra
rt.3110:
	sw	%ra, 0(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 1(%sp)
	addi	%a0, %zero, 154
	sw	%v0, 0(%a0)
	addi	%a0, %zero, 154
	sw	%v1, 1(%a0)
	addi	%a0, %zero, 2
	sw	%a0, 2(%sp)
	srl	%a1, %v0, 1
	addi	%a0, %zero, 156
	sw	%a1, 0(%a0)
	srl	%a1, %v1, 1
	addi	%a0, %zero, 156
	sw	%a1, 1(%a0)
	flw	%f1, 435(%zero)
	itof	%f0, %v0
	fdiv	%f0, %f1, %f0
	addi	%a0, %zero, 158
	fsw	%f0, 0(%a0)
	addi	%sp, %sp, 3
	jal	create_pixelline.3057
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	addi	%sp, %sp, 4
	jal	create_pixelline.3057
	addi	%sp, %sp, -4
	sw	%v0, 4(%sp)
	addi	%sp, %sp, 5
	jal	create_pixelline.3057
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_parameter.2775
	addi	%sp, %sp, -6
	addi	%sp, %sp, 6
	jal	write_ppm_header.3018
	addi	%sp, %sp, -6
	addi	%sp, %sp, 6
	jal	init_dirvecs.3093
	addi	%sp, %sp, -6
	addi	%v0, %zero, 247
	addi	%sp, %sp, 6
	jal	d_vec.2744
	addi	%sp, %sp, -6
	addi	%v1, %zero, 78
	addi	%sp, %sp, 6
	jal	veccpy.2647
	addi	%sp, %sp, -6
	addi	%v0, %zero, 247
	addi	%sp, %sp, 6
	jal	setup_dirvec_constants.2873
	addi	%sp, %sp, -6
	addi	%a0, %zero, 0
	lw	%a0, 0(%a0)
	addi	%v0, %a0, -1
	addi	%sp, %sp, 6
	jal	setup_reflections.3108
	addi	%sp, %sp, -6
	lw	%v0, 1(%sp)
	lw	%v0, 1(%sp)
	lw	%a3, 4(%sp)
	addi	%a0, %v0, 0
	addi	%v1, %v0, 0
	addi	%v0, %a3, 0
	addi	%sp, %sp, 6
	jal	pretrace_line.3034
	addi	%sp, %sp, -6
	lw	%ra, 0(%sp)
	lw	%a2, 2(%sp)
	lw	%a1, 5(%sp)
	lw	%a3, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%v0, 1(%sp)
	addi	%a0, %a3, 0
	j	scan_line.3044
.global	min_caml_start
min_caml_start:
	addi	%a0, %zero, 1
	sw	%a0, 0(%sp)
	addi	%a0, %zero, 0
	sw	%a0, 1(%sp)
	addi	%a0, %zero, 0
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_extarray
	addi	%sp, %sp, -2
	addi	%a0, %v0, 0
	flw	%f0, 482(%zero)
	fsw	%f0, 2(%sp)
	addi	%v1, %zero, 1
	flw	%f0, 2(%sp)
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0
	addi	%a0, %zero, 60
	sw	%a0, 3(%sp)
	addi	%f0, %zero, 1
	fsw	%f0, 4(%sp)
	lw	%a1, 4(%sp)
	sw	%a2, 10(%a1)
	lw	%a1, 4(%sp)
	sw	%a2, 9(%a1)
	lw	%a1, 4(%sp)
	sw	%a2, 8(%a1)
	lw	%a1, 4(%sp)
	sw	%a2, 7(%a1)
	lw	%a0, 1(%sp)
	lw	%a1, 4(%sp)
	sw	%a0, 6(%a1)
	lw	%a1, 4(%sp)
	sw	%a2, 5(%a1)
	lw	%a1, 4(%sp)
	sw	%a2, 4(%a1)
	lw	%a0, 1(%sp)
	lw	%a1, 4(%sp)
	sw	%a0, 3(%a1)
	lw	%a0, 1(%sp)
	lw	%a1, 4(%sp)
	sw	%a0, 2(%a1)
	lw	%a0, 1(%sp)
	lw	%a1, 4(%sp)
	sw	%a0, 1(%a1)
	lw	%a0, 1(%sp)
	lw	%a1, 4(%sp)
	sw	%a0, 0(%a1)
	lw	%a1, 4(%sp)
	addi	%a0, %zero, 12
	addi	%v1, %zero, 1
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_extarray
	addi	%sp, %sp, -5
	addi	%a0, %v0, 0
	addi	%a0, %zero, 3
	sw	%a0, 5(%sp)
	addi	%v1, %zero, 72
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%a0, %v0, 0
	addi	%v1, %zero, 75
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%a0, %v0, 0
	addi	%v1, %zero, 78
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%a0, %v0, 0
	flw	%f0, 447(%zero)
	addi	%v1, %zero, 81
	lw	%a1, 0(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	addi	%a0, %v0, 0
	addi	%a0, %zero, 50
	sw	%a0, 6(%sp)
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	lw	%a1, 0(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	lw	%a0, 6(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%a0, %zero, 83
	lw	%at, 0(%a0)
	addi	%a0, %zero, 133
	lw	%a1, 0(%sp)
	addi	%v1, %at, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	lw	%a1, 0(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%v1, %zero, 135
	flw	%f0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%a0, %zero, 136
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	flw	%f0, 454(%zero)
	addi	%v1, %zero, 137
	lw	%a1, 0(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%v1, %zero, 138
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%a0, %zero, 141
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%v1, %zero, 142
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%v1, %zero, 145
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%v1, %zero, 148
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%v1, %zero, 151
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 7
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0
	addi	%a0, %zero, 2
	sw	%a0, 7(%sp)
	addi	%a0, %zero, 154
	lw	%a0, 1(%sp)
	lw	%a1, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	addi	%a0, %zero, 156
	lw	%a0, 1(%sp)
	lw	%a1, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	addi	%v1, %zero, 158
	flw	%f0, 2(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a1, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	addi	%v1, %zero, 159
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	addi	%v1, %zero, 162
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	addi	%v1, %zero, 165
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	addi	%v1, %zero, 168
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	addi	%v1, %zero, 171
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	addi	%v1, %zero, 174
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	addi	%v1, %zero, 177
	flw	%f0, 2(%sp)
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -8
	addi	%a0, %v0, 0
	sw	%a0, 8(%sp)
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_extarray
	addi	%sp, %sp, -9
	addi	%a0, %v0, 0
	addi	%f0, %zero, 177
	fsw	%f0, 9(%sp)
	lw	%a1, 9(%sp)
	sw	%a0, 1(%a1)
	lw	%a0, 8(%sp)
	lw	%a1, 9(%sp)
	sw	%a0, 0(%a1)
	lw	%a1, 9(%sp)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_extarray
	addi	%sp, %sp, -10
	addi	%a0, %v0, 0
	addi	%a0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	addi	%v0, %a0, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_extarray
	addi	%sp, %sp, -10
	addi	%a0, %v0, 0
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -10
	addi	%a0, %v0, 0
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%a0, 5(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 10
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -10
	addi	%a0, %v0, 0
	sw	%a0, 10(%sp)
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 11
	jal	min_caml_create_extarray
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	addi	%f0, %zero, 247
	fsw	%f0, 11(%sp)
	lw	%a1, 11(%sp)
	sw	%a0, 1(%a1)
	lw	%a0, 10(%sp)
	lw	%a1, 11(%sp)
	sw	%a0, 0(%a1)
	lw	%a1, 11(%sp)
	addi	%v1, %zero, 249
	flw	%f0, 2(%sp)
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 12
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -12
	addi	%a0, %v0, 0
	sw	%a0, 12(%sp)
	addi	%a0, %zero, 249
	addi	%v1, %zero, 249
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 0
	addi	%sp, %sp, 13
	jal	min_caml_create_extarray
	addi	%sp, %sp, -13
	addi	%a0, %v0, 0
	addi	%f0, %zero, 249
	fsw	%f0, 13(%sp)
	lw	%a3, 13(%sp)
	sw	%a0, 1(%a3)
	lw	%a0, 12(%sp)
	lw	%a3, 13(%sp)
	sw	%a0, 0(%a3)
	lw	%a3, 13(%sp)
	addi	%a1, %zero, 180
	addi	%f0, %zero, 251
	fsw	%f0, 14(%sp)
	flw	%f0, 2(%sp)
	lw	%a2, 14(%sp)
	fsw	%f0, 2(%a2)
	lw	%a2, 14(%sp)
	sw	%a3, 1(%a2)
	lw	%a0, 1(%sp)
	lw	%a2, 14(%sp)
	sw	%a0, 0(%a2)
	lw	%a2, 14(%sp)
	addi	%a0, %zero, 254
	addi	%v1, %zero, 251
	addi	%v0, %a1, 0
	addi	%sp, %sp, 15
	jal	min_caml_create_extarray
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	addi	%a0, %zero, 434
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 15
	jal	min_caml_create_extarray
	addi	%sp, %sp, -15
	addi	%a0, %v0, 0
	addi	%a0, %zero, 8
	addi	%v1, %a0, 0
	addi	%v0, %a0, 0
	addi	%sp, %sp, 15
	jal	rt.3110
	addi	%sp, %sp, -15
	addi	%g0, %zero, 0
	ret
