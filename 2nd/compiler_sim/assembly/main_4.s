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
	fblt	%f0, %f1, fbgt_else.12966
	jr	%ra
fbgt_else.12966:
	addi	%v0, %zero, 1
	jr	%ra
fispos.2595:
	flw	%f1, 482(%zero)
	fblt	%f1, %f0, fbgt_else.12967
	jr	%ra
fbgt_else.12967:
	addi	%v0, %zero, 1
	jr	%ra
fisneg.2597:
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.12968
	jr	%ra
fbgt_else.12968:
	addi	%v0, %zero, 1
	jr	%ra
fiszero.2599:
	flw	%f1, 482(%zero)
	fbne	%f0, %f1, fbeq_else.12969
	addi	%v0, %zero, 1
	jr	%ra
fbeq_else.12969:
	jr	%ra
xor.2601:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	beqi	%a0, 0, bnei_else.12970
	beqi	%v0, 0, bnei_else.12971
	jr	%ra
bnei_else.12971:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.12970:
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
	fmov	%f0, %f1
	fblt	%f16, %f0, fbgt_else.12972
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f0
	fmov	%f0, %f16
	j	f.6155
fbgt_else.12972:
	jr	%ra
g.6159:
	flw	%f16, 1(%k1)
	fblt	%f0, %f16, fbgt_else.12973
	fblt	%f0, %f1, fbgt_else.12974
	fsub	%f0, %f0, %f1
	flw	%f16, 468(%zero)
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.12974:
	flw	%f16, 468(%zero)
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.12973:
	jr	%ra
reduction_2pi.2614:
	fsw	%f0, 0(%sp)
	fsw	%f14, 1(%sp)
	add	%k1, %zero, %ra
	flw	%f14, 467(%zero)
	fmov	%f1, %f14
	addi	%sp, %sp, 2
	jal	f.6155
	addi	%sp, %sp, -2
	fmov	%f1, %f0
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a1, %zero, g.6159
	sw	%a1, 0(%a0)
	fsw	%f14, 1(%a0)
	flw	%f14, 1(%sp)
	add	%ra, %zero, %k1
	flw	%f0, 0(%sp)
	addi	%k1, %a0, 0
	lw	%at, 0(%k1)
	jr	%at
cos.2616:
	fsw	%f6, 0(%sp)
	sw	%t0, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f6, 466(%zero)
	fabs	%f0, %f0
	addi	%sp, %sp, 3
	jal	reduction_2pi.2614
	addi	%sp, %sp, -3
	fblt	%f0, %f6, fbgt_else.12975
	j	fbgt_cont.12976
fbgt_else.12975:
	addi	%t0, %zero, 1
fbgt_cont.12976:
	fblt	%f0, %f6, fbgt_else.12977
	fsub	%f0, %f0, %f6
	j	fbgt_cont.12978
fbgt_else.12977:
fbgt_cont.12978:
	flw	%f16, 465(%zero)
	fblt	%f0, %f16, fbgt_else.12979
	beqi	%t0, 0, bnei_else.12981
	j	bnei_cont.12982
bnei_else.12981:
	addi	%t0, %zero, 1
bnei_cont.12982:
	j	fbgt_cont.12980
fbgt_else.12979:
fbgt_cont.12980:
	fblt	%f0, %f16, fbgt_else.12983
	fsub	%f0, %f6, %f0
	j	fbgt_cont.12984
fbgt_else.12983:
fbgt_cont.12984:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.12985
	addi	%sp, %sp, 3
	jal	kernel_cos.2610
	addi	%sp, %sp, -3
	j	fbgt_cont.12986
fbgt_else.12985:
	fsub	%f0, %f16, %f0
	addi	%sp, %sp, 3
	jal	kernel_sin.2608
	addi	%sp, %sp, -3
fbgt_cont.12986:
	beqi	%t0, 0, bnei_else.12987
	flw	%f6, 0(%sp)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.12987:
	flw	%f6, 0(%sp)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	fneg	%f0, %f0
	jr	%ra
sin.2618:
	fsw	%f6, 0(%sp)
	sw	%t0, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f6, 466(%zero)
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.12988
	addi	%t0, %zero, 1
	j	fbgt_cont.12989
fbgt_else.12988:
fbgt_cont.12989:
	fabs	%f0, %f0
	addi	%sp, %sp, 3
	jal	reduction_2pi.2614
	addi	%sp, %sp, -3
	fblt	%f0, %f6, fbgt_else.12990
	beqi	%t0, 0, bnei_else.12992
	j	bnei_cont.12993
bnei_else.12992:
	addi	%t0, %zero, 1
bnei_cont.12993:
	j	fbgt_cont.12991
fbgt_else.12990:
fbgt_cont.12991:
	fblt	%f0, %f6, fbgt_else.12994
	fsub	%f0, %f0, %f6
	j	fbgt_cont.12995
fbgt_else.12994:
fbgt_cont.12995:
	flw	%f16, 465(%zero)
	fblt	%f0, %f16, fbgt_else.12996
	fsub	%f0, %f6, %f0
	j	fbgt_cont.12997
fbgt_else.12996:
fbgt_cont.12997:
	flw	%f1, 464(%zero)
	fblt	%f1, %f0, fbgt_else.12998
	addi	%sp, %sp, 3
	jal	kernel_sin.2608
	addi	%sp, %sp, -3
	j	fbgt_cont.12999
fbgt_else.12998:
	fsub	%f0, %f16, %f0
	addi	%sp, %sp, 3
	jal	kernel_cos.2610
	addi	%sp, %sp, -3
fbgt_cont.12999:
	beqi	%t0, 0, bnei_else.13000
	flw	%f6, 0(%sp)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.13000:
	flw	%f6, 0(%sp)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	fneg	%f0, %f0
	jr	%ra
atan.2620:
	sw	%ra, 0(%sp)
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.13001
	addi	%a0, %zero, 1
	j	fbgt_cont.13002
fbgt_else.13001:
fbgt_cont.13002:
	sw	%a0, 1(%sp)
	fabs	%f16, %f0
	flw	%f1, 463(%zero)
	fblt	%f16, %f1, fbgt_else.13003
	flw	%f0, 462(%zero)
	fblt	%f16, %f0, fbgt_else.13004
	flw	%f0, 465(%zero)
	fsw	%f0, 2(%sp)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f16
	addi	%sp, %sp, 3
	jal	kernel_atan.2612
	addi	%sp, %sp, -3
	flw	%f1, 2(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.13005
fbgt_else.13004:
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
fbgt_cont.13005:
	lw	%a0, 1(%sp)
	beqi	%a0, 0, bnei_else.13006
	lw	%ra, 0(%sp)
	jr	%ra
bnei_else.13006:
	lw	%ra, 0(%sp)
	fneg	%f0, %f0
	jr	%ra
fbgt_else.13003:
	lw	%ra, 0(%sp)
	j	kernel_atan.2612
print_int_sub1.2622:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	blti	%a0, 10, bgti_else.13007
	addi	%a0, %a0, -10
	addi	%v1, %v0, 1
	addi	%v0, %a0, 0
	j	print_int_sub1.2622
bgti_else.13007:
	jr	%ra
print_int_sub2.2625:
	blti	%v0, 10, bgti_else.13008
	addi	%v0, %v0, -10
	j	print_int_sub2.2625
bgti_else.13008:
	jr	%ra
print_int.2627:
	sw	%v0, 0(%sp)
	sw	%t1, 1(%sp)
	sw	%t0, 2(%sp)
	sw	%ra, 3(%sp)
	sw	%v1, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub1.2622
	addi	%sp, %sp, -5
	addi	%t0, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2625
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	blt	%at, %t0, bgt_else.13009
	addi	%v0, %t1, 48
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	j	min_caml_print_char
bgt_else.13009:
	lw	%v1, 4(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 5
	jal	print_int_sub1.2622
	addi	%sp, %sp, -5
	sw	%v0, 5(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	addi	%t0, %v0, 0
	lw	%v0, 5(%sp)
	blt	%at, %v0, bgt_else.13010
	addi	%v0, %t0, 48
	addi	%sp, %sp, 6
	jal	min_caml_print_char
	addi	%sp, %sp, -6
	addi	%v0, %t1, 48
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	j	min_caml_print_char
bgt_else.13010:
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
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
sgn.2629:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fiszero.2599
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.13011
	lw	%ra, 1(%sp)
	flw	%f0, 482(%zero)
	jr	%ra
bnei_else.13011:
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 2
	jal	fispos.2595
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.13012
	lw	%ra, 1(%sp)
	flw	%f0, 477(%zero)
	jr	%ra
bnei_else.13012:
	lw	%ra, 1(%sp)
	flw	%f0, 461(%zero)
	jr	%ra
fneg_cond.2631:
	beqi	%v0, 0, bnei_else.13013
	jr	%ra
bnei_else.13013:
	fneg	%f0, %f0
	jr	%ra
add_mod5.2634:
	add	%v0, %v0, %v1
	blti	%v0, 5, bgti_else.13014
	addi	%v0, %v0, -5
	jr	%ra
bgti_else.13014:
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
	beqi	%v0, 0, bnei_else.13018
	flw	%f1, 477(%zero)
	j	bnei_cont.13019
bnei_else.13018:
	lw	%a0, 1(%sp)
	beqi	%a0, 0, bnei_else.13020
	flw	%f0, 461(%zero)
	fdiv	%f1, %f0, %f9
	j	bnei_cont.13021
bnei_else.13020:
	flw	%f0, 477(%zero)
	fdiv	%f1, %f0, %f9
bnei_cont.13021:
bnei_cont.13019:
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
	fmov	%f13, %f0
	fmov	%f0, %f12
	addi	%sp, %sp, 5
	jal	sin.2618
	addi	%sp, %sp, -5
	fmov	%f12, %f0
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	addi	%sp, %sp, 5
	jal	rad.2754
	addi	%sp, %sp, -5
	fmov	%f14, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 5
	jal	cos.2616
	addi	%sp, %sp, -5
	fmov	%f15, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 5
	jal	sin.2618
	addi	%sp, %sp, -5
	fmul	%f1, %f13, %f0
	flw	%f14, 459(%zero)
	fmul	%f1, %f1, %f14
	addi	%a0, %zero, 171
	fsw	%f1, 0(%a0)
	flw	%f1, 458(%zero)
	fmul	%f1, %f12, %f1
	addi	%a0, %zero, 171
	fsw	%f1, 1(%a0)
	fmul	%f1, %f13, %f15
	fmul	%f1, %f1, %f14
	addi	%a0, %zero, 171
	fsw	%f1, 2(%a0)
	addi	%a0, %zero, 165
	fsw	%f15, 0(%a0)
	flw	%f1, 482(%zero)
	addi	%a0, %zero, 165
	fsw	%f1, 1(%a0)
	fneg	%f1, %f0
	addi	%a0, %zero, 165
	fsw	%f1, 2(%a0)
	fneg	%f1, %f12
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 168
	fsw	%f0, 0(%a0)
	fneg	%f0, %f13
	addi	%a0, %zero, 168
	fsw	%f0, 1(%a0)
	fneg	%f0, %f12
	fmul	%f0, %f0, %f15
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
	flw	%f10, 0(%v1)
	fmov	%f0, %f10
	addi	%sp, %sp, 13
	jal	cos.2616
	addi	%sp, %sp, -13
	fmov	%f11, %f0
	fmov	%f0, %f10
	addi	%sp, %sp, 13
	jal	sin.2618
	addi	%sp, %sp, -13
	fmov	%f10, %f0
	lw	%a0, 1(%sp)
	flw	%f12, 1(%a0)
	fmov	%f0, %f12
	addi	%sp, %sp, 13
	jal	cos.2616
	addi	%sp, %sp, -13
	fmov	%f13, %f0
	fmov	%f0, %f12
	addi	%sp, %sp, 13
	jal	sin.2618
	addi	%sp, %sp, -13
	fmov	%f12, %f0
	lw	%a0, 1(%sp)
	flw	%f14, 2(%a0)
	fmov	%f0, %f14
	addi	%sp, %sp, 13
	jal	cos.2616
	addi	%sp, %sp, -13
	fmov	%f15, %f0
	fmov	%f0, %f14
	addi	%sp, %sp, 13
	jal	sin.2618
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
	beqi	%v0, -1, bnei_else.13031
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
	beqi	%t1, 0, bnei_else.13032
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	addi	%sp, %sp, 14
	jal	rad.2754
	addi	%sp, %sp, -14
	fsw	%f0, 0(%t2)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	addi	%sp, %sp, 14
	jal	rad.2754
	addi	%sp, %sp, -14
	fsw	%f0, 1(%t2)
	addi	%sp, %sp, 14
	jal	min_caml_read_float
	addi	%sp, %sp, -14
	addi	%sp, %sp, 14
	jal	rad.2754
	addi	%sp, %sp, -14
	fsw	%f0, 2(%t2)
	j	bnei_cont.13033
bnei_else.13032:
bnei_cont.13033:
	beqi	%t0, 2, bnei_else.13034
	lw	%a0, 13(%sp)
	j	bnei_cont.13035
bnei_else.13034:
	addi	%a0, %zero, 1
bnei_cont.13035:
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
	addi	%a2, %zero, 12
	lw	%a1, 0(%sp)
	add	%at, %a2, %a1
	sw	%a0, 0(%at)
	beqi	%t0, 3, bnei_else.13036
	beqi	%t0, 2, bnei_else.13038
	j	bnei_cont.13039
bnei_else.13038:
	lw	%a0, 13(%sp)
	beqi	%a0, 0, bnei_else.13040
	j	bnei_cont.13041
bnei_else.13040:
	addi	%v1, %zero, 1
bnei_cont.13041:
	addi	%v0, %t3, 0
	addi	%sp, %sp, 15
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -15
bnei_cont.13039:
	j	bnei_cont.13037
bnei_else.13036:
	flw	%f7, 0(%t3)
	fmov	%f0, %f7
	addi	%sp, %sp, 15
	jal	fiszero.2599
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.13042
	fmov	%f0, %f6
	j	bnei_cont.13043
bnei_else.13042:
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
bnei_cont.13043:
	fsw	%f0, 0(%t3)
	flw	%f7, 1(%t3)
	fmov	%f0, %f7
	addi	%sp, %sp, 16
	jal	fiszero.2599
	addi	%sp, %sp, -16
	beqi	%v0, 0, bnei_else.13044
	fmov	%f0, %f6
	j	bnei_cont.13045
bnei_else.13044:
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
bnei_cont.13045:
	fsw	%f0, 1(%t3)
	flw	%f7, 2(%t3)
	fmov	%f0, %f7
	addi	%sp, %sp, 17
	jal	fiszero.2599
	addi	%sp, %sp, -17
	beqi	%v0, 0, bnei_else.13046
	j	bnei_cont.13047
bnei_else.13046:
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
bnei_cont.13047:
	fsw	%f6, 2(%t3)
bnei_cont.13037:
	beqi	%t1, 0, bnei_else.13048
	addi	%v1, %t2, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2760
	addi	%sp, %sp, -17
	j	bnei_cont.13049
bnei_else.13048:
bnei_cont.13049:
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
bnei_else.13031:
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
	jr	%ra
read_object.2765:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	blti	%v0, 60, bgti_else.13050
	jr	%ra
bgti_else.13050:
	addi	%sp, %sp, 2
	jal	read_nth_object.2763
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.13052
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	j	read_object.2765
bnei_else.13052:
	lw	%ra, 1(%sp)
	lw	%a0, 0(%sp)
	sw	%a0, 0(%a1)
	jr	%ra
read_all_object.2767:
	j	read_object.2765
read_net_item.2769:
	sw	%v0, 0(%sp)
	sw	%t0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_read_int
	addi	%sp, %sp, -3
	addi	%t0, %v0, 0
	addi	%v1, %zero, -1
	beqi	%t0, -1, bnei_else.13054
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	addi	%sp, %sp, 3
	jal	read_net_item.2769
	addi	%sp, %sp, -3
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%t0, 0(%at)
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.13054:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t0, 1(%sp)
	lw	%ra, 2(%sp)
	j	min_caml_create_array
read_or_network.2771:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_net_item.2769
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	sw	%v1, 2(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.13055
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	addi	%sp, %sp, 3
	jal	read_or_network.2771
	addi	%sp, %sp, -3
	lw	%a1, 2(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%a1, 0(%at)
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.13055:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	j	min_caml_create_array
read_and_network.2773:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_net_item.2769
	addi	%sp, %sp, -2
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.13056
	addi	%a1, %zero, 83
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	j	read_and_network.2773
bnei_else.13056:
	lw	%ra, 1(%sp)
	jr	%ra
read_parameter.2775:
	sw	%t5, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_screen_settings.2756
	addi	%sp, %sp, -2
	addi	%sp, %sp, 2
	jal	read_light.2758
	addi	%sp, %sp, -2
	addi	%sp, %sp, 2
	jal	read_all_object.2767
	addi	%sp, %sp, -2
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	read_and_network.2773
	addi	%sp, %sp, -2
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	read_or_network.2771
	addi	%sp, %sp, -2
	addi	%a0, %zero, 134
	lw	%t5, 0(%sp)
	lw	%ra, 1(%sp)
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
	sw	%ra, 8(%sp)
	add	%at, %v1, %a0
	flw	%f0, 0(%at)
	fsw	%f0, 9(%sp)
	addi	%sp, %sp, 10
	jal	fiszero.2599
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.13059
	lw	%ra, 8(%sp)
	jr	%ra
bnei_else.13059:
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 10
	jal	o_param_abc.2699
	addi	%sp, %sp, -10
	sw	%v0, 10(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2689
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
	jal	fneg_cond.2631
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
	beqi	%v0, 0, bnei_else.13060
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
	beqi	%v0, 0, bnei_else.13061
	addi	%a0, %zero, 135
	flw	%f0, 12(%sp)
	fsw	%f0, 0(%a0)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13061:
	lw	%ra, 8(%sp)
	jr	%ra
bnei_else.13060:
	lw	%ra, 8(%sp)
	jr	%ra
solver_rect.2786:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	sw	%a0, 6(%sp)
	addi	%a1, %zero, 1
	sw	%a1, 7(%sp)
	addi	%a2, %zero, 2
	sw	%a2, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13062
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13062:
	flw	%f2, 0(%sp)
	flw	%f1, 2(%sp)
	flw	%f0, 1(%sp)
	lw	%a2, 6(%sp)
	lw	%a1, 8(%sp)
	lw	%a0, 7(%sp)
	lw	%v1, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13063
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.13063:
	flw	%f2, 1(%sp)
	flw	%f1, 0(%sp)
	flw	%f0, 2(%sp)
	lw	%a2, 7(%sp)
	lw	%a1, 6(%sp)
	lw	%a0, 8(%sp)
	lw	%v1, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13064
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.13064:
	lw	%ra, 5(%sp)
	jr	%ra
solver_surface.2792:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v1, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_abc.2699
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	lw	%v0, 3(%sp)
	addi	%v1, %t0, 0
	addi	%sp, %sp, 7
	jal	veciprod.2658
	addi	%sp, %sp, -7
	fmov	%f6, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 7
	jal	fispos.2595
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.13065
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	veciprod2.2661
	addi	%sp, %sp, -7
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f6
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	flw	%f6, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13065:
	flw	%f6, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	jr	%ra
quadratic.2798:
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
	jal	o_param_a.2693
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
	jal	o_param_b.2695
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
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	flw	%f1, 9(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 8(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 10(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2691
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.13066
	flw	%f1, 1(%sp)
	flw	%f0, 2(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 11(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r1.2717
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
	jal	o_param_r2.2719
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
	jal	o_param_r3.2721
	addi	%sp, %sp, -16
	flw	%f1, 15(%sp)
	fmul	%f1, %f1, %f0
	lw	%ra, 4(%sp)
	flw	%f0, 14(%sp)
	fadd	%f0, %f0, %f1
	jr	%ra
bnei_else.13066:
	lw	%ra, 4(%sp)
	flw	%f0, 10(%sp)
	jr	%ra
bilinear.2803:
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
	jal	o_param_a.2693
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
	jal	o_param_b.2695
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
	jal	o_param_c.2697
	addi	%sp, %sp, -13
	flw	%f1, 12(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 11(%sp)
	fadd	%f0, %f0, %f1
	fsw	%f0, 13(%sp)
	lw	%v0, 6(%sp)
	addi	%sp, %sp, 14
	jal	o_isrot.2691
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.13067
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
	jal	o_param_r1.2717
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
	jal	o_param_r2.2719
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
	jal	o_param_r3.2721
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
bnei_else.13067:
	lw	%ra, 7(%sp)
	flw	%f0, 13(%sp)
	jr	%ra
solver_second.2811:
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
	jal	quadratic.2798
	addi	%sp, %sp, -9
	fmov	%f6, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 9
	jal	fiszero.2599
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13068
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.13068:
	flw	%f5, 2(%sp)
	flw	%f4, 1(%sp)
	flw	%f3, 0(%sp)
	flw	%f2, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 6(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	bilinear.2803
	addi	%sp, %sp, -9
	fsw	%f0, 9(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 10
	jal	quadratic.2798
	addi	%sp, %sp, -10
	fsw	%f0, 10(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 11
	jal	o_form.2685
	addi	%sp, %sp, -11
	beqi	%v0, 3, bnei_else.13069
	flw	%f0, 10(%sp)
	j	bnei_cont.13070
bnei_else.13069:
	flw	%f1, 477(%zero)
	flw	%f0, 10(%sp)
	fsub	%f0, %f0, %f1
bnei_cont.13070:
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
	beqi	%v0, 0, bnei_else.13071
	flw	%f0, 12(%sp)
	fsqrt	%f0, %f0
	fsw	%f0, 13(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 14
	jal	o_isinvert.2689
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.13072
	flw	%f0, 13(%sp)
	j	bnei_cont.13073
bnei_else.13072:
	flw	%f0, 13(%sp)
	fneg	%f0, %f0
bnei_cont.13073:
	flw	%f1, 9(%sp)
	fsub	%f0, %f0, %f1
	fdiv	%f0, %f0, %f6
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13071:
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
solver.2817:
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%a1, %zero, 12
	add	%at, %a1, %v0
	lw	%at, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 3(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	o_param_x.2701
	addi	%sp, %sp, -4
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 4(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 5(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	o_param_y.2703
	addi	%sp, %sp, -6
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 6(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 7(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	o_param_z.2705
	addi	%sp, %sp, -8
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 8(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	o_form.2685
	addi	%sp, %sp, -9
	beqi	%v0, 1, bnei_else.13074
	beqi	%v0, 2, bnei_else.13075
	lw	%ra, 2(%sp)
	flw	%f2, 8(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 4(%sp)
	lw	%v1, 0(%sp)
	addi	%v0, %at, 0
	j	solver_second.2811
bnei_else.13075:
	lw	%ra, 2(%sp)
	flw	%f2, 8(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 4(%sp)
	lw	%v1, 0(%sp)
	addi	%v0, %at, 0
	j	solver_surface.2792
bnei_else.13074:
	lw	%ra, 2(%sp)
	flw	%f2, 8(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 4(%sp)
	lw	%v1, 0(%sp)
	addi	%v0, %at, 0
	j	solver_rect.2786
solver_rect_fast.2821:
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
	jal	o_param_b.2695
	addi	%sp, %sp, -11
	fmov	%f1, %f0
	flw	%f0, 10(%sp)
	addi	%sp, %sp, 11
	jal	fless.2592
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.13076
	lw	%a0, 4(%sp)
	flw	%f1, 2(%a0)
	flw	%f0, 8(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 2(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	fsw	%f0, 11(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 12
	jal	o_param_c.2697
	addi	%sp, %sp, -12
	fmov	%f1, %f0
	flw	%f0, 11(%sp)
	addi	%sp, %sp, 12
	jal	fless.2592
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.13078
	flw	%f0, 7(%sp)
	addi	%sp, %sp, 12
	jal	fiszero.2599
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.13080
	j	bnei_cont.13081
bnei_else.13080:
	addi	%a0, %zero, 1
bnei_cont.13081:
	j	bnei_cont.13079
bnei_else.13078:
bnei_cont.13079:
	j	bnei_cont.13077
bnei_else.13076:
bnei_cont.13077:
	beqi	%a0, 0, bnei_else.13082
	addi	%a0, %zero, 135
	flw	%f0, 8(%sp)
	fsw	%f0, 0(%a0)
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13082:
	lw	%a0, 5(%sp)
	flw	%f1, 2(%a0)
	flw	%f0, 1(%sp)
	fsub	%f1, %f1, %f0
	flw	%f0, 3(%a0)
	fsw	%f0, 12(%sp)
	fmul	%f1, %f1, %f0
	fsw	%f1, 13(%sp)
	lw	%a0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 14(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 0(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	fsw	%f0, 15(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 16
	jal	o_param_a.2693
	addi	%sp, %sp, -16
	fmov	%f1, %f0
	flw	%f0, 15(%sp)
	addi	%sp, %sp, 16
	jal	fless.2592
	addi	%sp, %sp, -16
	beqi	%v0, 0, bnei_else.13083
	lw	%a0, 4(%sp)
	flw	%f1, 2(%a0)
	flw	%f0, 13(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 2(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	fsw	%f0, 16(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 17
	jal	o_param_c.2697
	addi	%sp, %sp, -17
	fmov	%f1, %f0
	flw	%f0, 16(%sp)
	addi	%sp, %sp, 17
	jal	fless.2592
	addi	%sp, %sp, -17
	beqi	%v0, 0, bnei_else.13085
	flw	%f0, 12(%sp)
	addi	%sp, %sp, 17
	jal	fiszero.2599
	addi	%sp, %sp, -17
	beqi	%v0, 0, bnei_else.13087
	j	bnei_cont.13088
bnei_else.13087:
	addi	%a0, %zero, 1
bnei_cont.13088:
	j	bnei_cont.13086
bnei_else.13085:
bnei_cont.13086:
	j	bnei_cont.13084
bnei_else.13083:
bnei_cont.13084:
	beqi	%a0, 0, bnei_else.13089
	addi	%a0, %zero, 135
	flw	%f0, 13(%sp)
	fsw	%f0, 0(%a0)
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.13089:
	lw	%a0, 5(%sp)
	flw	%f1, 4(%a0)
	flw	%f0, 2(%sp)
	fsub	%f1, %f1, %f0
	flw	%f0, 5(%a0)
	fsw	%f0, 17(%sp)
	fmul	%f1, %f1, %f0
	fsw	%f1, 18(%sp)
	flw	%f0, 14(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 0(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	fsw	%f0, 19(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 20
	jal	o_param_a.2693
	addi	%sp, %sp, -20
	fmov	%f1, %f0
	flw	%f0, 19(%sp)
	addi	%sp, %sp, 20
	jal	fless.2592
	addi	%sp, %sp, -20
	beqi	%v0, 0, bnei_else.13090
	flw	%f1, 18(%sp)
	flw	%f0, 9(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 1(%sp)
	fadd	%f0, %f1, %f0
	fabs	%f0, %f0
	fsw	%f0, 20(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 21
	jal	o_param_b.2695
	addi	%sp, %sp, -21
	fmov	%f1, %f0
	flw	%f0, 20(%sp)
	addi	%sp, %sp, 21
	jal	fless.2592
	addi	%sp, %sp, -21
	beqi	%v0, 0, bnei_else.13092
	flw	%f0, 17(%sp)
	addi	%sp, %sp, 21
	jal	fiszero.2599
	addi	%sp, %sp, -21
	beqi	%v0, 0, bnei_else.13094
	j	bnei_cont.13095
bnei_else.13094:
	addi	%a0, %zero, 1
bnei_cont.13095:
	j	bnei_cont.13093
bnei_else.13092:
bnei_cont.13093:
	j	bnei_cont.13091
bnei_else.13090:
bnei_cont.13091:
	beqi	%a0, 0, bnei_else.13096
	addi	%a0, %zero, 135
	flw	%f0, 18(%sp)
	fsw	%f0, 0(%a0)
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.13096:
	lw	%ra, 6(%sp)
	jr	%ra
solver_surface_fast.2828:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%ra, 4(%sp)
	flw	%f0, 0(%v1)
	addi	%sp, %sp, 5
	jal	fisneg.2597
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.13097
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
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13097:
	lw	%ra, 4(%sp)
	jr	%ra
solver_second_fast.2834:
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
	beqi	%v0, 0, bnei_else.13098
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bnei_else.13098:
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
	jal	quadratic.2798
	addi	%sp, %sp, -9
	fmov	%f7, %f0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	o_form.2685
	addi	%sp, %sp, -9
	beqi	%v0, 3, bnei_else.13099
	j	bnei_cont.13100
bnei_else.13099:
	flw	%f0, 477(%zero)
	fsub	%f7, %f7, %f0
bnei_cont.13100:
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
	beqi	%v0, 0, bnei_else.13101
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 9
	jal	o_isinvert.2689
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13102
	fsqrt	%f0, %f7
	fadd	%f1, %f6, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	j	bnei_cont.13103
bnei_else.13102:
	fsqrt	%f0, %f7
	fsub	%f1, %f6, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
bnei_cont.13103:
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13101:
	flw	%f7, 5(%sp)
	flw	%f6, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
solver_fast.2840:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%a1, %zero, 12
	add	%at, %a1, %v0
	lw	%at, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 4(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 5
	jal	o_param_x.2701
	addi	%sp, %sp, -5
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 5(%sp)
	lw	%a0, 2(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 6(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	o_param_y.2703
	addi	%sp, %sp, -7
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 7(%sp)
	lw	%a0, 2(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 8(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	o_param_z.2705
	addi	%sp, %sp, -9
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
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
	beqi	%v0, 1, bnei_else.13104
	beqi	%v0, 2, bnei_else.13105
	lw	%ra, 3(%sp)
	flw	%f2, 9(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 5(%sp)
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	j	solver_second_fast.2834
bnei_else.13105:
	lw	%ra, 3(%sp)
	flw	%f2, 9(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 5(%sp)
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	j	solver_surface_fast.2828
bnei_else.13104:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2744
	addi	%sp, %sp, -10
	addi	%v1, %v0, 0
	lw	%ra, 3(%sp)
	flw	%f2, 9(%sp)
	flw	%f1, 7(%sp)
	flw	%f0, 5(%sp)
	addi	%a0, %at, 0
	addi	%v0, %at, 0
	j	solver_rect_fast.2821
solver_surface_fast2.2844:
	sw	%a0, 0(%sp)
	fsw	%f6, 1(%sp)
	sw	%ra, 2(%sp)
	flw	%f6, 0(%v1)
	fmov	%f0, %f6
	addi	%sp, %sp, 3
	jal	fisneg.2597
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.13106
	lw	%a0, 0(%sp)
	flw	%f0, 3(%a0)
	fmul	%f0, %f6, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13106:
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
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
	flw	%f6, 0(%v1)
	fmov	%f0, %f6
	addi	%sp, %sp, 9
	jal	fiszero.2599
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13107
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	jr	%ra
bnei_else.13107:
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
	beqi	%v0, 0, bnei_else.13108
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 10
	jal	o_isinvert.2689
	addi	%sp, %sp, -10
	beqi	%v0, 0, bnei_else.13109
	fsqrt	%f0, %f6
	fadd	%f1, %f7, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
	j	bnei_cont.13110
bnei_else.13109:
	fsqrt	%f0, %f6
	fsub	%f1, %f7, %f0
	lw	%a0, 4(%sp)
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	addi	%a0, %zero, 135
	fsw	%f0, 0(%a0)
bnei_cont.13110:
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13108:
	flw	%f7, 6(%sp)
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	jr	%ra
solver_fast2.2858:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%a0, %zero, 12
	add	%at, %a0, %v0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 3
	jal	o_param_ctbl.2723
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	flw	%f0, 0(%v0)
	fsw	%f0, 4(%sp)
	flw	%f0, 1(%v0)
	fsw	%f0, 5(%sp)
	flw	%f0, 2(%v0)
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
	beqi	%v0, 1, bnei_else.13111
	beqi	%v0, 2, bnei_else.13112
	lw	%ra, 2(%sp)
	flw	%f2, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f0, 4(%sp)
	lw	%a0, 3(%sp)
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	j	solver_second_fast2.2851
bnei_else.13112:
	lw	%ra, 2(%sp)
	flw	%f2, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f0, 4(%sp)
	lw	%a0, 3(%sp)
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	j	solver_surface_fast2.2844
bnei_else.13111:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	d_vec.2744
	addi	%sp, %sp, -7
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
	beqi	%v0, 0, bnei_else.13113
	lw	%a0, 6(%sp)
	fsw	%f6, 1(%a0)
	j	bnei_cont.13114
bnei_else.13113:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2689
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
	jal	o_param_a.2693
	addi	%sp, %sp, -7
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	fneg_cond.2631
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f7
	fsw	%f0, 1(%a0)
bnei_cont.13114:
	lw	%a0, 0(%sp)
	flw	%f7, 1(%a0)
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.13115
	lw	%a0, 6(%sp)
	fsw	%f6, 3(%a0)
	j	bnei_cont.13116
bnei_else.13115:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2689
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
	jal	o_param_b.2695
	addi	%sp, %sp, -7
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	fneg_cond.2631
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	fsw	%f0, 2(%a0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f7
	fsw	%f0, 3(%a0)
bnei_cont.13116:
	lw	%a0, 0(%sp)
	flw	%f7, 2(%a0)
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.13117
	lw	%a0, 6(%sp)
	fsw	%f6, 5(%a0)
	j	bnei_cont.13118
bnei_else.13117:
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2689
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
	jal	o_param_c.2697
	addi	%sp, %sp, -7
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	fneg_cond.2631
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	fsw	%f0, 4(%a0)
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f7
	fsw	%f0, 5(%a0)
bnei_cont.13118:
	flw	%f7, 2(%sp)
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v0, 6(%sp)
	jr	%ra
setup_surface_table.2864:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f8, 2(%sp)
	fsw	%f7, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %zero, 4
	flw	%f6, 482(%zero)
	fmov	%f0, %f6
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%a0, 0(%sp)
	flw	%f7, 0(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_a.2693
	addi	%sp, %sp, -7
	fmul	%f7, %f7, %f0
	lw	%a0, 0(%sp)
	flw	%f8, 1(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_b.2695
	addi	%sp, %sp, -7
	fmul	%f0, %f8, %f0
	fadd	%f7, %f7, %f0
	lw	%a0, 0(%sp)
	flw	%f8, 2(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2697
	addi	%sp, %sp, -7
	fmul	%f0, %f8, %f0
	fadd	%f7, %f7, %f0
	fmov	%f0, %f7
	addi	%sp, %sp, 7
	jal	fispos.2595
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.13119
	flw	%f0, 461(%zero)
	fdiv	%f0, %f0, %f7
	lw	%a0, 6(%sp)
	fsw	%f0, 0(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_a.2693
	addi	%sp, %sp, -7
	fdiv	%f0, %f0, %f7
	fneg	%f0, %f0
	lw	%a0, 6(%sp)
	fsw	%f0, 1(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_b.2695
	addi	%sp, %sp, -7
	fdiv	%f0, %f0, %f7
	fneg	%f0, %f0
	lw	%a0, 6(%sp)
	fsw	%f0, 2(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2697
	addi	%sp, %sp, -7
	fdiv	%f0, %f0, %f7
	fneg	%f0, %f0
	lw	%a0, 6(%sp)
	fsw	%f0, 3(%a0)
	j	bnei_cont.13120
bnei_else.13119:
	lw	%a0, 6(%sp)
	fsw	%f6, 0(%a0)
bnei_cont.13120:
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
	flw	%f12, 0(%a0)
	flw	%f11, 1(%a0)
	flw	%f10, 2(%a0)
	lw	%v0, 1(%sp)
	fmov	%f2, %f10
	fmov	%f1, %f11
	fmov	%f0, %f12
	addi	%sp, %sp, 12
	jal	quadratic.2798
	addi	%sp, %sp, -12
	fmov	%f13, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_a.2693
	addi	%sp, %sp, -12
	fmul	%f0, %f12, %f0
	fneg	%f6, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_b.2695
	addi	%sp, %sp, -12
	fmul	%f0, %f11, %f0
	fneg	%f7, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_c.2697
	addi	%sp, %sp, -12
	fmul	%f0, %f10, %f0
	fneg	%f8, %f0
	lw	%a0, 11(%sp)
	fsw	%f13, 0(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_isrot.2691
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.13121
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r2.2719
	addi	%sp, %sp, -12
	fmul	%f9, %f10, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r3.2721
	addi	%sp, %sp, -12
	fmul	%f0, %f11, %f0
	fadd	%f0, %f9, %f0
	addi	%sp, %sp, 12
	jal	fhalf.2604
	addi	%sp, %sp, -12
	fsub	%f0, %f6, %f0
	lw	%a0, 11(%sp)
	fsw	%f0, 1(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r1.2717
	addi	%sp, %sp, -12
	fmul	%f10, %f10, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r3.2721
	addi	%sp, %sp, -12
	fmul	%f0, %f12, %f0
	fadd	%f0, %f10, %f0
	addi	%sp, %sp, 12
	jal	fhalf.2604
	addi	%sp, %sp, -12
	fsub	%f0, %f7, %f0
	lw	%a0, 11(%sp)
	fsw	%f0, 2(%a0)
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r1.2717
	addi	%sp, %sp, -12
	fmul	%f10, %f11, %f0
	lw	%v0, 1(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r2.2719
	addi	%sp, %sp, -12
	fmul	%f0, %f12, %f0
	fadd	%f0, %f10, %f0
	addi	%sp, %sp, 12
	jal	fhalf.2604
	addi	%sp, %sp, -12
	fsub	%f0, %f8, %f0
	lw	%a0, 11(%sp)
	fsw	%f0, 3(%a0)
	j	bnei_cont.13122
bnei_else.13121:
	lw	%a0, 11(%sp)
	fsw	%f6, 1(%a0)
	fsw	%f7, 2(%a0)
	fsw	%f8, 3(%a0)
bnei_cont.13122:
	fmov	%f0, %f13
	addi	%sp, %sp, 12
	jal	fiszero.2599
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.13123
	j	bnei_cont.13124
bnei_else.13123:
	flw	%f0, 477(%zero)
	fdiv	%f0, %f0, %f13
	lw	%a0, 11(%sp)
	fsw	%f0, 4(%a0)
bnei_cont.13124:
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
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	blti	%v1, 0, bgti_else.13125
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%at, 0(%at)
	addi	%sp, %sp, 5
	jal	d_const.2746
	addi	%sp, %sp, -5
	addi	%t0, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	d_vec.2744
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 5
	jal	o_form.2685
	addi	%sp, %sp, -5
	beqi	%v0, 1, bnei_else.13126
	beqi	%v0, 2, bnei_else.13128
	addi	%v1, %at, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 5
	jal	setup_second_table.2867
	addi	%sp, %sp, -5
	lw	%a0, 1(%sp)
	add	%at, %t0, %a0
	sw	%v0, 0(%at)
	j	bnei_cont.13129
bnei_else.13128:
	addi	%v1, %at, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 5
	jal	setup_surface_table.2864
	addi	%sp, %sp, -5
	lw	%a0, 1(%sp)
	add	%at, %t0, %a0
	sw	%v0, 0(%at)
bnei_cont.13129:
	j	bnei_cont.13127
bnei_else.13126:
	addi	%v1, %at, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 5
	jal	setup_rect_table.2861
	addi	%sp, %sp, -5
	lw	%a0, 1(%sp)
	add	%at, %t0, %a0
	sw	%v0, 0(%at)
bnei_cont.13127:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, -1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2870
bgti_else.13125:
	jr	%ra
setup_dirvec_constants.2873:
	lw	%a0, 0(%a0)
	addi	%v1, %a0, -1
	j	iter_setup_dirvec_constants.2870
setup_startp_constants.2875:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	blti	%v1, 0, bgti_else.13131
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 5
	jal	o_param_ctbl.2723
	addi	%sp, %sp, -5
	addi	%t0, %v0, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 5
	jal	o_form.2685
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	lw	%a0, 0(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 5(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	o_param_x.2701
	addi	%sp, %sp, -6
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 0(%t0)
	lw	%a0, 0(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 6(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	o_param_y.2703
	addi	%sp, %sp, -7
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 1(%t0)
	lw	%a0, 0(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 7(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	o_param_z.2705
	addi	%sp, %sp, -8
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 2(%t0)
	beqi	%t1, 2, bnei_else.13132
	addi	%at, %zero, 2
	blt	%at, %t1, bgt_else.13134
	j	bgt_cont.13135
bgt_else.13134:
	flw	%f0, 0(%t0)
	flw	%f1, 1(%t0)
	flw	%f2, 2(%t0)
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	quadratic.2798
	addi	%sp, %sp, -8
	beqi	%t1, 3, bnei_else.13136
	j	bnei_cont.13137
bnei_else.13136:
	flw	%f1, 477(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.13137:
	fsw	%f0, 3(%t0)
bgt_cont.13135:
	j	bnei_cont.13133
bnei_else.13132:
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	o_param_abc.2699
	addi	%sp, %sp, -8
	flw	%f0, 0(%t0)
	flw	%f1, 1(%t0)
	flw	%f2, 2(%t0)
	addi	%sp, %sp, 8
	jal	veciprod2.2661
	addi	%sp, %sp, -8
	fsw	%f0, 3(%t0)
bnei_cont.13133:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, -1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2875
bgti_else.13131:
	jr	%ra
setup_startp.2878:
	add	%v1, %zero, %v0
	sw	%v1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 162
	addi	%sp, %sp, 2
	jal	veccpy.2647
	addi	%sp, %sp, -2
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
	addi	%sp, %sp, 5
	jal	o_param_a.2693
	addi	%sp, %sp, -5
	fmov	%f1, %f0
	flw	%f0, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.13139
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
	beqi	%v0, 0, bnei_else.13141
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
	j	bnei_cont.13142
bnei_else.13141:
bnei_cont.13142:
	j	bnei_cont.13140
bnei_else.13139:
bnei_cont.13140:
	beqi	%v0, 0, bnei_else.13143
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	j	o_isinvert.2689
bnei_else.13143:
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2689
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.13144
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.13144:
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 1
	jr	%ra
is_plane_outside.2885:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_abc.2699
	addi	%sp, %sp, -5
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 5
	jal	veciprod2.2661
	addi	%sp, %sp, -5
	fsw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2689
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
	beqi	%v0, 0, bnei_else.13145
	lw	%ra, 4(%sp)
	jr	%ra
bnei_else.13145:
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 1
	jr	%ra
is_second_outside.2890:
	sw	%v0, 0(%sp)
	fsw	%f6, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	quadratic.2798
	addi	%sp, %sp, -3
	fmov	%f6, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2685
	addi	%sp, %sp, -3
	beqi	%v0, 3, bnei_else.13146
	j	bnei_cont.13147
bnei_else.13146:
	flw	%f0, 477(%zero)
	fsub	%f6, %f6, %f0
bnei_cont.13147:
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	o_isinvert.2689
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
	beqi	%v0, 0, bnei_else.13148
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.13148:
	flw	%f6, 1(%sp)
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
is_outside.2895:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
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
	beqi	%v0, 1, bnei_else.13149
	beqi	%v0, 2, bnei_else.13150
	lw	%ra, 4(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	j	is_second_outside.2890
bnei_else.13150:
	lw	%ra, 4(%sp)
	flw	%f2, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f0, 5(%sp)
	lw	%v0, 3(%sp)
	j	is_plane_outside.2885
bnei_else.13149:
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
	add	%a0, %zero, %v0
	sw	%a0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	add	%at, %v1, %a0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.13151
	addi	%a0, %zero, 12
	add	%at, %a0, %a1
	lw	%v0, 0(%at)
	addi	%sp, %sp, 6
	jal	is_outside.2895
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.13152
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.13152:
	lw	%a0, 3(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 5(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 4(%sp)
	j	check_all_inside.2900
bnei_else.13151:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2906:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	sw	%v0, 3(%sp)
	beqi	%v0, -1, bnei_else.13153
	addi	%a0, %zero, 138
	addi	%v1, %zero, 247
	addi	%sp, %sp, 4
	jal	solver_fast.2840
	addi	%sp, %sp, -4
	sw	%a0, 4(%sp)
	addi	%a0, %zero, 135
	flw	%f0, 0(%a0)
	fsw	%f0, 5(%sp)
	beqi	%v0, 0, bnei_else.13154
	flw	%f1, 457(%zero)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	j	bnei_cont.13155
bnei_else.13154:
bnei_cont.13155:
	beqi	%v0, 0, bnei_else.13156
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
	lw	%v1, 1(%sp)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 6
	jal	check_all_inside.2900
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.13157
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13157:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_and_group.2906
bnei_else.13156:
	addi	%a1, %zero, 12
	lw	%a0, 3(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	o_isinvert.2689
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.13158
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_and_group.2906
bnei_else.13158:
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.13153:
	jr	%ra
shadow_check_one_or_group.2909:
	sw	%v0, 0(%sp)
	add	%a0, %zero, %v1
	sw	%a0, 1(%sp)
	sw	%ra, 2(%sp)
	add	%at, %a0, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.13159
	addi	%a0, %zero, 83
	add	%at, %a0, %a1
	lw	%v1, 0(%at)
	addi	%sp, %sp, 3
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.13160
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13160:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2909
bnei_else.13159:
	jr	%ra
shadow_check_one_or_matrix.2912:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	add	%at, %v1, %v0
	lw	%at, 0(%at)
	lw	%v0, 0(%at)
	beqi	%v0, -1, bnei_else.13161
	beqi	%v0, 99, bnei_else.13162
	addi	%a0, %zero, 138
	addi	%v1, %zero, 247
	addi	%sp, %sp, 3
	jal	solver_fast.2840
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.13164
	addi	%a0, %zero, 135
	flw	%f0, 0(%a0)
	flw	%f1, 455(%zero)
	addi	%sp, %sp, 3
	jal	fless.2592
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.13166
	addi	%v0, %zero, 1
	addi	%v1, %at, 0
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.13168
	addi	%a0, %zero, 1
	j	bnei_cont.13169
bnei_else.13168:
bnei_cont.13169:
	j	bnei_cont.13167
bnei_else.13166:
bnei_cont.13167:
	j	bnei_cont.13165
bnei_else.13164:
bnei_cont.13165:
	j	bnei_cont.13163
bnei_else.13162:
	addi	%a0, %zero, 1
bnei_cont.13163:
	beqi	%a0, 0, bnei_else.13170
	addi	%v0, %zero, 1
	addi	%v1, %at, 0
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.13171
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.13171:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.13170:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.13161:
	jr	%ra
solve_each_element.2915:
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
	beqi	%t0, -1, bnei_else.13172
	addi	%a0, %zero, 159
	addi	%v0, %t0, 0
	addi	%sp, %sp, 6
	jal	solver.2817
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	beqi	%v0, 0, bnei_else.13173
	addi	%a0, %zero, 135
	flw	%f6, 0(%a0)
	flw	%f0, 482(%zero)
	fmov	%f1, %f6
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.13174
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	fmov	%f0, %f6
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.13176
	flw	%f0, 456(%zero)
	fadd	%f6, %f6, %f0
	lw	%a1, 2(%sp)
	flw	%f0, 0(%a1)
	fmul	%f1, %f0, %f6
	addi	%a0, %zero, 159
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 8(%sp)
	flw	%f1, 1(%a1)
	fmul	%f16, %f1, %f6
	addi	%a0, %zero, 159
	flw	%f1, 1(%a0)
	fadd	%f1, %f16, %f1
	fsw	%f1, 9(%sp)
	flw	%f16, 2(%a1)
	fmul	%f17, %f16, %f6
	addi	%a0, %zero, 159
	flw	%f16, 2(%a0)
	fadd	%f2, %f17, %f16
	fsw	%f2, 10(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 7(%sp)
	addi	%sp, %sp, 11
	jal	check_all_inside.2900
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.13178
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
	sw	%t0, 0(%a0)
	addi	%a1, %zero, 136
	lw	%a0, 6(%sp)
	sw	%a0, 0(%a1)
	j	bnei_cont.13179
bnei_else.13178:
bnei_cont.13179:
	j	bnei_cont.13177
bnei_else.13176:
bnei_cont.13177:
	j	bnei_cont.13175
bnei_else.13174:
bnei_cont.13175:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_each_element.2915
bnei_else.13173:
	addi	%a0, %zero, 12
	add	%at, %a0, %t0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	o_isinvert.2689
	addi	%sp, %sp, -11
	beqi	%v0, 0, bnei_else.13180
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_each_element.2915
bnei_else.13180:
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.13172:
	add	%t0, %zero, %a0
	jr	%ra
solve_one_or_network.2919:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %a1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.13183
	addi	%a1, %zero, 83
	add	%at, %a1, %a2
	lw	%v1, 0(%at)
	addi	%sp, %sp, 4
	jal	solve_each_element.2915
	addi	%sp, %sp, -4
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_one_or_network.2919
bnei_else.13183:
	jr	%ra
trace_or_matrix.2923:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	add	%v1, %zero, %a0
	sw	%v1, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %a1, %v0
	lw	%at, 0(%at)
	lw	%v0, 0(%at)
	beqi	%v0, -1, bnei_else.13185
	beqi	%v0, 99, bnei_else.13186
	addi	%a0, %zero, 159
	addi	%sp, %sp, 4
	jal	solver.2817
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.13188
	addi	%a0, %zero, 135
	flw	%f0, 0(%a0)
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	addi	%sp, %sp, 4
	jal	fless.2592
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.13190
	addi	%v0, %zero, 1
	lw	%a0, 2(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -4
	j	bnei_cont.13191
bnei_else.13190:
bnei_cont.13191:
	j	bnei_cont.13189
bnei_else.13188:
bnei_cont.13189:
	j	bnei_cont.13187
bnei_else.13186:
	addi	%v0, %zero, 1
	addi	%a0, %v1, 0
	addi	%v1, %at, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -4
bnei_cont.13187:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix.2923
bnei_else.13185:
	jr	%ra
judge_intersection.2927:
	add	%a0, %zero, %v0
	sw	%ra, 0(%sp)
	flw	%f0, 454(%zero)
	addi	%a1, %zero, 137
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 134
	lw	%v1, 0(%a1)
	addi	%sp, %sp, 1
	jal	trace_or_matrix.2923
	addi	%sp, %sp, -1
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	fsw	%f1, 1(%sp)
	flw	%f0, 455(%zero)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.13193
	flw	%f1, 453(%zero)
	lw	%ra, 0(%sp)
	flw	%f0, 1(%sp)
	j	fless.2592
bnei_else.13193:
	lw	%ra, 0(%sp)
	jr	%ra
solve_each_element_fast.2929:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 2(%sp)
	fsw	%f6, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	d_vec.2744
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%a1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%t0, 0(%at)
	beqi	%t0, -1, bnei_else.13194
	lw	%v1, 2(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	solver_fast2.2858
	addi	%sp, %sp, -7
	sw	%v0, 7(%sp)
	sw	%a0, 8(%sp)
	beqi	%v0, 0, bnei_else.13195
	addi	%a0, %zero, 135
	flw	%f6, 0(%a0)
	flw	%f0, 482(%zero)
	fmov	%f1, %f6
	addi	%sp, %sp, 9
	jal	fless.2592
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13196
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	fmov	%f0, %f6
	addi	%sp, %sp, 9
	jal	fless.2592
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13198
	flw	%f0, 456(%zero)
	fadd	%f6, %f6, %f0
	lw	%a1, 6(%sp)
	flw	%f0, 0(%a1)
	fmul	%f1, %f0, %f6
	addi	%a0, %zero, 162
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 9(%sp)
	flw	%f1, 1(%a1)
	fmul	%f16, %f1, %f6
	addi	%a0, %zero, 162
	flw	%f1, 1(%a0)
	fadd	%f1, %f16, %f1
	fsw	%f1, 10(%sp)
	flw	%f16, 2(%a1)
	fmul	%f17, %f16, %f6
	addi	%a0, %zero, 162
	flw	%f16, 2(%a0)
	fadd	%f2, %f17, %f16
	fsw	%f2, 11(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 8(%sp)
	addi	%sp, %sp, 12
	jal	check_all_inside.2900
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.13200
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
	sw	%t0, 0(%a0)
	addi	%a1, %zero, 136
	lw	%a0, 7(%sp)
	sw	%a0, 0(%a1)
	j	bnei_cont.13201
bnei_else.13200:
bnei_cont.13201:
	j	bnei_cont.13199
bnei_else.13198:
bnei_cont.13199:
	j	bnei_cont.13197
bnei_else.13196:
bnei_cont.13197:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_each_element_fast.2929
bnei_else.13195:
	addi	%a0, %zero, 12
	add	%at, %a0, %t0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 12
	jal	o_isinvert.2689
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.13202
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_each_element_fast.2929
bnei_else.13202:
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.13194:
	flw	%f6, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
solve_one_or_network_fast.2933:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %a1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.13205
	addi	%a1, %zero, 83
	add	%at, %a1, %a2
	lw	%v1, 0(%at)
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -4
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	solve_one_or_network_fast.2933
bnei_else.13205:
	jr	%ra
trace_or_matrix_fast.2937:
	sw	%v0, 0(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 1(%sp)
	add	%v1, %zero, %a0
	sw	%v1, 2(%sp)
	sw	%ra, 3(%sp)
	add	%at, %a1, %v0
	lw	%at, 0(%at)
	lw	%v0, 0(%at)
	beqi	%v0, -1, bnei_else.13207
	beqi	%v0, 99, bnei_else.13208
	addi	%sp, %sp, 4
	jal	solver_fast2.2858
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.13210
	addi	%a0, %zero, 135
	flw	%f0, 0(%a0)
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	addi	%sp, %sp, 4
	jal	fless.2592
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.13212
	addi	%v0, %zero, 1
	lw	%a0, 2(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -4
	j	bnei_cont.13213
bnei_else.13212:
bnei_cont.13213:
	j	bnei_cont.13211
bnei_else.13210:
bnei_cont.13211:
	j	bnei_cont.13209
bnei_else.13208:
	addi	%v0, %zero, 1
	addi	%a0, %v1, 0
	addi	%v1, %at, 0
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -4
bnei_cont.13209:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	trace_or_matrix_fast.2937
bnei_else.13207:
	jr	%ra
judge_intersection_fast.2941:
	add	%a0, %zero, %v0
	sw	%ra, 0(%sp)
	flw	%f0, 454(%zero)
	addi	%a1, %zero, 137
	fsw	%f0, 0(%a1)
	addi	%a1, %zero, 134
	lw	%v1, 0(%a1)
	addi	%sp, %sp, 1
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -1
	addi	%a0, %zero, 137
	flw	%f1, 0(%a0)
	fsw	%f1, 1(%sp)
	flw	%f0, 455(%zero)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.13215
	flw	%f1, 453(%zero)
	lw	%ra, 0(%sp)
	flw	%f0, 1(%sp)
	j	fless.2592
bnei_else.13215:
	lw	%ra, 0(%sp)
	jr	%ra
get_nvector_rect.2943:
	sw	%v0, 0(%sp)
	sw	%t5, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%a0, %zero, 136
	lw	%t5, 0(%a0)
	addi	%v0, %zero, 142
	addi	%sp, %sp, 3
	jal	vecbzero.2645
	addi	%sp, %sp, -3
	addi	%a1, %t5, -1
	sw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	addi	%sp, %sp, 4
	jal	sgn.2629
	addi	%sp, %sp, -4
	fneg	%f0, %f0
	addi	%a1, %zero, 142
	lw	%t5, 1(%sp)
	lw	%ra, 2(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a1, %a0
	fsw	%f0, 0(%at)
	jr	%ra
get_nvector_plane.2945:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
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
	addi	%sp, %sp, 9
	jal	o_param_x.2701
	addi	%sp, %sp, -9
	fsub	%f10, %f10, %f0
	addi	%a0, %zero, 138
	flw	%f11, 1(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_y.2703
	addi	%sp, %sp, -9
	fsub	%f11, %f11, %f0
	addi	%a0, %zero, 138
	flw	%f12, 2(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_z.2705
	addi	%sp, %sp, -9
	fsub	%f12, %f12, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_a.2693
	addi	%sp, %sp, -9
	fmul	%f6, %f10, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2695
	addi	%sp, %sp, -9
	fmul	%f7, %f11, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_c.2697
	addi	%sp, %sp, -9
	fmul	%f8, %f12, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_isrot.2691
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13218
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r3.2721
	addi	%sp, %sp, -9
	fmul	%f9, %f11, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r2.2719
	addi	%sp, %sp, -9
	fmul	%f0, %f12, %f0
	fadd	%f0, %f9, %f0
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
	fmul	%f6, %f10, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r1.2717
	addi	%sp, %sp, -9
	fmul	%f0, %f12, %f0
	fadd	%f0, %f6, %f0
	addi	%sp, %sp, 9
	jal	fhalf.2604
	addi	%sp, %sp, -9
	fadd	%f0, %f7, %f0
	addi	%a0, %zero, 142
	fsw	%f0, 1(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r2.2719
	addi	%sp, %sp, -9
	fmul	%f10, %f10, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_r1.2717
	addi	%sp, %sp, -9
	fmul	%f0, %f11, %f0
	fadd	%f0, %f10, %f0
	addi	%sp, %sp, 9
	jal	fhalf.2604
	addi	%sp, %sp, -9
	fadd	%f0, %f8, %f0
	addi	%a0, %zero, 142
	fsw	%f0, 2(%a0)
	j	bnei_cont.13219
bnei_else.13218:
	addi	%a0, %zero, 142
	fsw	%f6, 0(%a0)
	addi	%a0, %zero, 142
	fsw	%f7, 1(%a0)
	addi	%a0, %zero, 142
	fsw	%f8, 2(%a0)
bnei_cont.13219:
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
	addi	%sp, %sp, 3
	jal	o_form.2685
	addi	%sp, %sp, -3
	beqi	%v0, 1, bnei_else.13220
	beqi	%v0, 2, bnei_else.13221
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	get_nvector_second.2947
bnei_else.13221:
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	get_nvector_plane.2945
bnei_else.13220:
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	j	get_nvector_rect.2943
utexture.2952:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_texturetype.2683
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	o_color_red.2711
	addi	%sp, %sp, -4
	addi	%a0, %zero, 145
	fsw	%f0, 0(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	o_color_green.2713
	addi	%sp, %sp, -4
	addi	%a0, %zero, 145
	fsw	%f0, 1(%a0)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	o_color_blue.2715
	addi	%sp, %sp, -4
	addi	%a0, %zero, 145
	fsw	%f0, 2(%a0)
	lw	%a0, 3(%sp)
	beqi	%a0, 1, bnei_else.13222
	beqi	%a0, 2, bnei_else.13223
	beqi	%a0, 3, bnei_else.13224
	beqi	%a0, 4, bnei_else.13225
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.13225:
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 4(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2701
	addi	%sp, %sp, -5
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 5(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2693
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
	jal	o_param_z.2705
	addi	%sp, %sp, -8
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 8(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_c.2697
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
	beqi	%v0, 0, bnei_else.13227
	flw	%f1, 451(%zero)
	j	bnei_cont.13228
bnei_else.13227:
	flw	%f1, 9(%sp)
	flw	%f0, 6(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	addi	%sp, %sp, 13
	jal	atan.2620
	addi	%sp, %sp, -13
	flw	%f1, 450(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.13228:
	floor	%f0, %f1
	fsub	%f0, %f1, %f0
	fsw	%f0, 13(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 1(%a0)
	fsw	%f0, 14(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 15
	jal	o_param_y.2703
	addi	%sp, %sp, -15
	flw	%f1, 14(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 15(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 16
	jal	o_param_b.2695
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
	beqi	%v0, 0, bnei_else.13229
	flw	%f1, 451(%zero)
	j	bnei_cont.13230
bnei_else.13229:
	flw	%f1, 16(%sp)
	flw	%f0, 11(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	addi	%sp, %sp, 17
	jal	atan.2620
	addi	%sp, %sp, -17
	flw	%f1, 450(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 449(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.13230:
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
	beqi	%v0, 0, bnei_else.13231
	flw	%f0, 482(%zero)
	j	bnei_cont.13232
bnei_else.13231:
	flw	%f0, 21(%sp)
bnei_cont.13232:
	flw	%f1, 447(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 446(%zero)
	fdiv	%f0, %f1, %f0
	addi	%a0, %zero, 145
	lw	%ra, 2(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
bnei_else.13224:
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 22(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 23
	jal	o_param_x.2701
	addi	%sp, %sp, -23
	flw	%f1, 22(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 23(%sp)
	lw	%a0, 1(%sp)
	flw	%f0, 2(%a0)
	fsw	%f0, 24(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 25
	jal	o_param_z.2705
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
	jal	cos.2616
	addi	%sp, %sp, -27
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	flw	%f16, 447(%zero)
	fmul	%f1, %f0, %f16
	addi	%a0, %zero, 145
	fsw	%f1, 1(%a0)
	flw	%f1, 477(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f0, %f16
	addi	%a0, %zero, 145
	lw	%ra, 2(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
bnei_else.13223:
	lw	%a0, 1(%sp)
	flw	%f1, 1(%a0)
	flw	%f0, 444(%zero)
	fmul	%f0, %f1, %f0
	addi	%sp, %sp, 27
	jal	sin.2618
	addi	%sp, %sp, -27
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	flw	%f16, 447(%zero)
	fmul	%f1, %f16, %f0
	addi	%a0, %zero, 145
	fsw	%f1, 0(%a0)
	flw	%f1, 477(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f0, %f16, %f0
	addi	%a0, %zero, 145
	lw	%ra, 2(%sp)
	fsw	%f0, 1(%a0)
	jr	%ra
bnei_else.13222:
	lw	%a0, 1(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 27(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 28
	jal	o_param_x.2701
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
	jal	o_param_z.2705
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
	beqi	%a0, 0, bnei_else.13236
	beqi	%v0, 0, bnei_else.13238
	flw	%f0, 447(%zero)
	j	bnei_cont.13239
bnei_else.13238:
	flw	%f0, 482(%zero)
bnei_cont.13239:
	j	bnei_cont.13237
bnei_else.13236:
	beqi	%v0, 0, bnei_else.13240
	flw	%f0, 482(%zero)
	j	bnei_cont.13241
bnei_else.13240:
	flw	%f0, 447(%zero)
bnei_cont.13241:
bnei_cont.13237:
	addi	%a0, %zero, 145
	lw	%ra, 2(%sp)
	fsw	%f0, 1(%a0)
	jr	%ra
add_light.2955:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2595
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.13243
	addi	%v1, %zero, 145
	addi	%v0, %zero, 151
	flw	%f0, 0(%sp)
	addi	%sp, %sp, 4
	jal	vecaccum.2666
	addi	%sp, %sp, -4
	j	bnei_cont.13244
bnei_else.13243:
bnei_cont.13244:
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2595
	addi	%sp, %sp, -4
	beqi	%v0, 0, bnei_else.13245
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
bnei_else.13245:
	lw	%ra, 3(%sp)
	jr	%ra
trace_reflections.2959:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	sw	%a0, 7(%sp)
	blti	%v0, 0, bgti_else.13248
	addi	%a0, %zero, 254
	add	%at, %a0, %v0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 8
	jal	r_dvec.2750
	addi	%sp, %sp, -8
	addi	%t0, %v0, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 8
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.13249
	addi	%a0, %zero, 141
	lw	%a0, 0(%a0)
	sll	%a1, %a0, 2
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	add	%a0, %a1, %a0
	sw	%a0, 8(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	r_surface_id.2748
	addi	%sp, %sp, -9
	lw	%a0, 8(%sp)
	bne	%a0, %v0, beq_else.13251
	addi	%a0, %zero, 134
	lw	%at, 0(%a0)
	lw	%v0, 7(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -9
	beqi	%v0, 0, bnei_else.13253
	j	bnei_cont.13254
bnei_else.13253:
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	d_vec.2744
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0
	addi	%v0, %zero, 142
	addi	%sp, %sp, 9
	jal	veciprod.2658
	addi	%sp, %sp, -9
	fsw	%f0, 9(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	r_bright.2752
	addi	%sp, %sp, -10
	fmov	%f6, %f0
	flw	%f0, 0(%sp)
	fmul	%f1, %f6, %f0
	flw	%f0, 9(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 10(%sp)
	addi	%v0, %t0, 0
	addi	%sp, %sp, 11
	jal	d_vec.2744
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 11
	jal	veciprod.2658
	addi	%sp, %sp, -11
	fmul	%f1, %f6, %f0
	flw	%f2, 1(%sp)
	flw	%f0, 10(%sp)
	addi	%sp, %sp, 11
	jal	add_light.2955
	addi	%sp, %sp, -11
bnei_cont.13254:
	j	beq_cont.13252
beq_else.13251:
beq_cont.13252:
	j	bnei_cont.13250
bnei_else.13249:
bnei_cont.13250:
	lw	%a0, 2(%sp)
	addi	%v0, %a0, -1
	flw	%f6, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 3(%sp)
	j	trace_reflections.2959
bgti_else.13248:
	jr	%ra
trace_ray.2964:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	add	%a1, %zero, %v0
	sw	%a1, 2(%sp)
	sw	%v1, 3(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%at, %zero, 4
	blt	%at, %a1, bgt_else.13256
	addi	%sp, %sp, 6
	jal	p_surface_ids.2729
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 7
	jal	judge_intersection.2927
	addi	%sp, %sp, -7
	sw	%a0, 7(%sp)
	beqi	%v0, 0, bnei_else.13257
	addi	%a0, %zero, 141
	lw	%a1, 0(%a0)
	sw	%a1, 8(%sp)
	addi	%a0, %zero, 12
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	o_reflectiontype.2687
	addi	%sp, %sp, -9
	sw	%v0, 9(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	o_diffuse.2707
	addi	%sp, %sp, -10
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	fsw	%f0, 10(%sp)
	lw	%v1, 3(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	get_nvector.2949
	addi	%sp, %sp, -11
	addi	%v1, %zero, 138
	addi	%v0, %zero, 159
	addi	%sp, %sp, 11
	jal	veccpy.2647
	addi	%sp, %sp, -11
	addi	%v1, %zero, 138
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	utexture.2952
	addi	%sp, %sp, -11
	lw	%a0, 8(%sp)
	sll	%a1, %a0, 2
	addi	%a0, %zero, 136
	lw	%a0, 0(%a0)
	add	%a2, %a1, %a0
	lw	%a1, 6(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 11
	jal	p_intersection_points.2727
	addi	%sp, %sp, -11
	lw	%a0, 2(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	addi	%v1, %zero, 138
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	veccpy.2647
	addi	%sp, %sp, -11
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 11
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -11
	sw	%v0, 11(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 12
	jal	o_diffuse.2707
	addi	%sp, %sp, -12
	flw	%f1, 481(%zero)
	addi	%sp, %sp, 12
	jal	fless.2592
	addi	%sp, %sp, -12
	beqi	%v0, 0, bnei_else.13258
	lw	%a2, 7(%sp)
	lw	%a1, 11(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	j	bnei_cont.13259
bnei_else.13258:
	addi	%a2, %zero, 1
	lw	%a1, 11(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 12
	jal	p_energy.2733
	addi	%sp, %sp, -12
	lw	%a0, 2(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	addi	%v1, %zero, 145
	addi	%v0, %at, 0
	addi	%sp, %sp, 12
	jal	veccpy.2647
	addi	%sp, %sp, -12
	flw	%f1, 441(%zero)
	flw	%f0, 10(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %at, 0
	addi	%sp, %sp, 12
	jal	vecscale.2676
	addi	%sp, %sp, -12
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 12
	jal	p_nvectors.2742
	addi	%sp, %sp, -12
	lw	%a0, 2(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	addi	%v1, %zero, 142
	addi	%v0, %at, 0
	addi	%sp, %sp, 12
	jal	veccpy.2647
	addi	%sp, %sp, -12
bnei_cont.13259:
	flw	%f0, 440(%zero)
	fsw	%f0, 12(%sp)
	addi	%v1, %zero, 142
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 13
	jal	veciprod.2658
	addi	%sp, %sp, -13
	flw	%f1, 12(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 142
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 13
	jal	vecaccum.2666
	addi	%sp, %sp, -13
	addi	%v0, %at, 0
	addi	%sp, %sp, 13
	jal	o_hilight.2709
	addi	%sp, %sp, -13
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 13(%sp)
	addi	%a0, %zero, 134
	lw	%at, 0(%a0)
	lw	%v0, 7(%sp)
	addi	%v1, %at, 0
	addi	%sp, %sp, 14
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -14
	beqi	%v0, 0, bnei_else.13260
	j	bnei_cont.13261
bnei_else.13260:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	addi	%sp, %sp, 14
	jal	veciprod.2658
	addi	%sp, %sp, -14
	fneg	%f1, %f0
	flw	%f0, 10(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 14(%sp)
	addi	%v1, %zero, 78
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 15
	jal	veciprod.2658
	addi	%sp, %sp, -15
	fneg	%f1, %f0
	flw	%f2, 13(%sp)
	flw	%f0, 14(%sp)
	addi	%sp, %sp, 15
	jal	add_light.2955
	addi	%sp, %sp, -15
bnei_cont.13261:
	addi	%v0, %zero, 138
	addi	%sp, %sp, 15
	jal	setup_startp.2878
	addi	%sp, %sp, -15
	addi	%a0, %zero, 434
	lw	%a0, 0(%a0)
	addi	%v0, %a0, -1
	flw	%f1, 13(%sp)
	flw	%f0, 10(%sp)
	lw	%v1, 3(%sp)
	addi	%sp, %sp, 15
	jal	trace_reflections.2959
	addi	%sp, %sp, -15
	flw	%f0, 439(%zero)
	flw	%f1, 0(%sp)
	addi	%sp, %sp, 15
	jal	fless.2592
	addi	%sp, %sp, -15
	beqi	%v0, 0, bnei_else.13262
	lw	%a0, 2(%sp)
	blti	%a0, 4, bgti_else.13263
	j	bgti_cont.13264
bgti_else.13263:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 6(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.13264:
	lw	%a0, 9(%sp)
	beqi	%a0, 2, bnei_else.13265
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.13265:
	flw	%f0, 477(%zero)
	fsw	%f0, 15(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 16
	jal	o_diffuse.2707
	addi	%sp, %sp, -16
	flw	%f1, 15(%sp)
	fsub	%f1, %f1, %f0
	flw	%f0, 0(%sp)
	fmul	%f0, %f0, %f1
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 1
	addi	%a0, %zero, 137
	flw	%f16, 0(%a0)
	flw	%f1, 1(%sp)
	fadd	%f1, %f1, %f16
	lw	%ra, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%v1, 3(%sp)
	j	trace_ray.2964
bnei_else.13262:
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.13257:
	addi	%a2, %zero, -1
	lw	%a1, 6(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.13268
	addi	%v1, %zero, 78
	lw	%v0, 3(%sp)
	addi	%sp, %sp, 16
	jal	veciprod.2658
	addi	%sp, %sp, -16
	fneg	%f0, %f0
	fsw	%f0, 16(%sp)
	addi	%sp, %sp, 17
	jal	fispos.2595
	addi	%sp, %sp, -17
	beqi	%v0, 0, bnei_else.13269
	flw	%f0, 16(%sp)
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	flw	%f1, 16(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 0(%sp)
	fmul	%f1, %f1, %f0
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
	lw	%ra, 5(%sp)
	fsw	%f0, 2(%a0)
	jr	%ra
bnei_else.13269:
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.13268:
	lw	%ra, 5(%sp)
	jr	%ra
bgt_else.13256:
	jr	%ra
trace_diffuse_ray.2970:
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -3
	sw	%a0, 3(%sp)
	beqi	%v0, 0, bnei_else.13274
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
	beqi	%v0, 0, bnei_else.13275
	lw	%ra, 2(%sp)
	jr	%ra
bnei_else.13275:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	addi	%sp, %sp, 4
	jal	veciprod.2658
	addi	%sp, %sp, -4
	fneg	%f0, %f0
	fsw	%f0, 4(%sp)
	addi	%sp, %sp, 5
	jal	fispos.2595
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.13277
	flw	%f0, 4(%sp)
	j	bnei_cont.13278
bnei_else.13277:
	flw	%f0, 482(%zero)
bnei_cont.13278:
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
bnei_else.13274:
	lw	%ra, 2(%sp)
	jr	%ra
iter_trace_diffuse_rays.2973:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	fsw	%f6, 4(%sp)
	sw	%ra, 5(%sp)
	blti	%a1, 0, bgti_else.13280
	add	%at, %v0, %a1
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
	beqi	%v0, 0, bnei_else.13281
	lw	%a0, 3(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f6, %f0
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -6
	j	bnei_cont.13282
bnei_else.13281:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f6, %f0
	addi	%v0, %at, 0
	addi	%sp, %sp, 6
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -6
bnei_cont.13282:
	lw	%a0, 3(%sp)
	addi	%a1, %a0, -2
	flw	%f6, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
bgti_else.13280:
	jr	%ra
trace_diffuse_rays.2978:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	add	%v0, %zero, %a0
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
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
	beqi	%a1, 0, bnei_else.13284
	addi	%a1, %zero, 179
	lw	%v0, 0(%a1)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	j	bnei_cont.13285
bnei_else.13284:
bnei_cont.13285:
	lw	%a0, 0(%sp)
	beqi	%a0, 1, bnei_else.13286
	addi	%a0, %zero, 179
	lw	%at, 1(%a0)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	j	bnei_cont.13287
bnei_else.13286:
bnei_cont.13287:
	lw	%a0, 0(%sp)
	beqi	%a0, 2, bnei_else.13288
	addi	%a0, %zero, 179
	lw	%at, 2(%a0)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	j	bnei_cont.13289
bnei_else.13288:
bnei_cont.13289:
	lw	%a0, 0(%sp)
	beqi	%a0, 3, bnei_else.13290
	addi	%a0, %zero, 179
	lw	%at, 3(%a0)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	j	bnei_cont.13291
bnei_else.13290:
bnei_cont.13291:
	lw	%a0, 0(%sp)
	beqi	%a0, 4, bnei_else.13292
	addi	%a0, %zero, 179
	lw	%at, 4(%a0)
	lw	%ra, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %at, 0
	j	trace_diffuse_rays.2978
bnei_else.13292:
	lw	%ra, 3(%sp)
	jr	%ra
calc_diffuse_using_1point.2986:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t3, 2(%sp)
	sw	%t2, 3(%sp)
	sw	%t1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -7
	addi	%t0, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	p_nvectors.2742
	addi	%sp, %sp, -7
	addi	%t1, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	p_intersection_points.2727
	addi	%sp, %sp, -7
	addi	%t2, %v0, 0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	p_energy.2733
	addi	%sp, %sp, -7
	addi	%t3, %v0, 0
	lw	%a0, 1(%sp)
	add	%at, %t0, %a0
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 7
	jal	veccpy.2647
	addi	%sp, %sp, -7
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	p_group_id.2737
	addi	%sp, %sp, -7
	lw	%a0, 1(%sp)
	add	%at, %t1, %a0
	lw	%at, 0(%at)
	add	%at, %t2, %a0
	lw	%at, 0(%at)
	addi	%a0, %at, 0
	addi	%v1, %at, 0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray_80percent.2982
	addi	%sp, %sp, -7
	lw	%a0, 1(%sp)
	add	%at, %t3, %a0
	lw	%at, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	addi	%v1, %at, 0
	j	vecaccumv.2679
calc_diffuse_using_5points.2989:
	sw	%v0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a2, 3(%sp)
	sw	%t4, 4(%sp)
	sw	%t3, 5(%sp)
	sw	%t2, 6(%sp)
	sw	%t1, 7(%sp)
	sw	%t0, 8(%sp)
	sw	%ra, 9(%sp)
	add	%at, %v1, %v0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -10
	addi	%t0, %v0, 0
	lw	%a0, 0(%sp)
	addi	%a1, %a0, -1
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -10
	addi	%t1, %v0, 0
	lw	%a1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -10
	addi	%t2, %v0, 0
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 1(%sp)
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -10
	addi	%t3, %v0, 0
	lw	%a1, 2(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -10
	addi	%t4, %v0, 0
	lw	%a0, 3(%sp)
	add	%at, %t0, %a0
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 10
	jal	veccpy.2647
	addi	%sp, %sp, -10
	lw	%a0, 3(%sp)
	add	%at, %t1, %a0
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 10
	jal	vecadd.2670
	addi	%sp, %sp, -10
	lw	%a0, 3(%sp)
	add	%at, %t2, %a0
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 10
	jal	vecadd.2670
	addi	%sp, %sp, -10
	lw	%a0, 3(%sp)
	add	%at, %t3, %a0
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 10
	jal	vecadd.2670
	addi	%sp, %sp, -10
	lw	%a0, 3(%sp)
	add	%at, %t4, %a0
	lw	%at, 0(%at)
	addi	%v0, %zero, 148
	addi	%v1, %at, 0
	addi	%sp, %sp, 10
	jal	vecadd.2670
	addi	%sp, %sp, -10
	addi	%v0, %at, 0
	addi	%sp, %sp, 10
	jal	p_energy.2733
	addi	%sp, %sp, -10
	lw	%a0, 3(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	lw	%t4, 4(%sp)
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	addi	%v1, %at, 0
	j	vecaccumv.2679
do_without_neighbors.2995:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.13294
	addi	%sp, %sp, 3
	jal	p_surface_ids.2729
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	add	%at, %v0, %a0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.13295
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -3
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%at, 0(%at)
	beqi	%at, 0, bnei_else.13296
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -3
	j	bnei_cont.13297
bnei_else.13296:
bnei_cont.13297:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2995
bgti_else.13295:
	lw	%ra, 2(%sp)
	jr	%ra
bgt_else.13294:
	jr	%ra
neighbors_exist.2998:
	addi	%a0, %zero, 154
	lw	%a1, 1(%a0)
	addi	%a0, %v1, 1
	blt	%a0, %a1, bgt_else.13300
	jr	%ra
bgt_else.13300:
	blt	%at, %v1, bgt_else.13301
	jr	%ra
bgt_else.13301:
	addi	%a0, %zero, 154
	lw	%a1, 0(%a0)
	addi	%a0, %v0, 1
	blt	%a0, %a1, bgt_else.13302
	jr	%ra
bgt_else.13302:
	blt	%at, %v0, bgt_else.13303
	jr	%ra
bgt_else.13303:
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
	add	%a3, %zero, %v0
	sw	%a3, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	add	%v1, %zero, %a2
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	add	%at, %a0, %a3
	lw	%v0, 0(%at)
	addi	%sp, %sp, 6
	jal	get_surface_id.3002
	addi	%sp, %sp, -6
	sw	%v0, 6(%sp)
	lw	%a1, 1(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	lw	%v1, 4(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.13304
	lw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	lw	%v1, 4(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.13305
	lw	%a0, 0(%sp)
	addi	%a1, %a0, -1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	lw	%v1, 4(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.13306
	lw	%a0, 0(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	lw	%v1, 4(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%a0, 6(%sp)
	bne	%v0, %a0, beq_else.13307
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.13307:
	lw	%ra, 5(%sp)
	jr	%ra
beq_else.13306:
	lw	%ra, 5(%sp)
	jr	%ra
beq_else.13305:
	lw	%ra, 5(%sp)
	jr	%ra
beq_else.13304:
	lw	%ra, 5(%sp)
	jr	%ra
try_exploit_neighbors.3011:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	add	%v1, %zero, %a3
	sw	%v1, 5(%sp)
	sw	%ra, 6(%sp)
	add	%at, %a1, %v0
	lw	%at, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.13308
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	blti	%v0, 0, bgti_else.13309
	lw	%a2, 5(%sp)
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	neighbors_are_available.3005
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.13310
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -7
	lw	%a2, 5(%sp)
	add	%at, %v0, %a2
	lw	%at, 0(%at)
	beqi	%at, 0, bnei_else.13311
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -7
	j	bnei_cont.13312
bnei_else.13311:
bnei_cont.13312:
	lw	%a0, 5(%sp)
	addi	%a3, %a0, 1
	lw	%ra, 6(%sp)
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	try_exploit_neighbors.3011
bnei_else.13310:
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	addi	%v0, %at, 0
	j	do_without_neighbors.2995
bgti_else.13309:
	lw	%ra, 6(%sp)
	jr	%ra
bgt_else.13308:
	jr	%ra
write_ppm_header.3018:
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
	addi	%a0, %zero, 154
	lw	%v0, 0(%a0)
	addi	%sp, %sp, 3
	jal	print_int.2627
	addi	%sp, %sp, -3
	addi	%t4, %zero, 32
	addi	%v0, %t4, 0
	addi	%sp, %sp, 3
	jal	min_caml_print_char
	addi	%sp, %sp, -3
	addi	%a0, %zero, 154
	lw	%v0, 1(%a0)
	addi	%sp, %sp, 3
	jal	print_int.2627
	addi	%sp, %sp, -3
	addi	%v0, %t4, 0
	addi	%sp, %sp, 3
	jal	min_caml_print_char
	addi	%sp, %sp, -3
	addi	%v0, %zero, 255
	addi	%sp, %sp, 3
	jal	print_int.2627
	addi	%sp, %sp, -3
	lw	%t4, 0(%sp)
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	j	min_caml_print_char
write_rgb_element.3020:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.13315
	blti	%v0, 0, bgti_else.13317
	j	bgti_cont.13318
bgti_else.13317:
bgti_cont.13318:
	j	bgt_cont.13316
bgt_else.13315:
	addi	%v0, %zero, 255
bgt_cont.13316:
	j	print_int.2627
write_rgb.3022:
	sw	%t5, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%a0, %zero, 151
	flw	%f0, 0(%a0)
	addi	%sp, %sp, 2
	jal	write_rgb_element.3020
	addi	%sp, %sp, -2
	addi	%t5, %zero, 32
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	addi	%a0, %zero, 151
	flw	%f0, 1(%a0)
	addi	%sp, %sp, 2
	jal	write_rgb_element.3020
	addi	%sp, %sp, -2
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	addi	%a0, %zero, 151
	flw	%f0, 2(%a0)
	addi	%sp, %sp, 2
	jal	write_rgb_element.3020
	addi	%sp, %sp, -2
	addi	%v0, %zero, 10
	lw	%t5, 0(%sp)
	lw	%ra, 1(%sp)
	j	min_caml_print_char
pretrace_diffuse_rays.3024:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.13319
	addi	%sp, %sp, 3
	jal	get_surface_id.3002
	addi	%sp, %sp, -3
	blti	%v0, 0, bgti_else.13320
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	beqi	%at, 0, bnei_else.13321
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	p_group_id.2737
	addi	%sp, %sp, -3
	sw	%v0, 3(%sp)
	addi	%v0, %zero, 148
	addi	%sp, %sp, 4
	jal	vecbzero.2645
	addi	%sp, %sp, -4
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	p_nvectors.2742
	addi	%sp, %sp, -4
	sw	%v0, 4(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	p_intersection_points.2727
	addi	%sp, %sp, -5
	addi	%a1, %zero, 179
	lw	%a0, 3(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	lw	%a1, 4(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	addi	%a0, %at, 0
	addi	%v1, %at, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 5
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -5
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 5
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -5
	lw	%a0, 1(%sp)
	add	%at, %v0, %a0
	lw	%at, 0(%at)
	addi	%v1, %zero, 148
	addi	%v0, %at, 0
	addi	%sp, %sp, 5
	jal	veccpy.2647
	addi	%sp, %sp, -5
	j	bnei_cont.13322
bnei_else.13321:
bnei_cont.13322:
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3024
bgti_else.13320:
	lw	%ra, 2(%sp)
	jr	%ra
bgt_else.13319:
	jr	%ra
pretrace_pixels.3027:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 6(%sp)
	sw	%ra, 7(%sp)
	blti	%v1, 0, bgti_else.13325
	addi	%a0, %zero, 158
	flw	%f17, 0(%a0)
	addi	%a0, %zero, 156
	lw	%a0, 0(%a0)
	sub	%a0, %v1, %a0
	itof	%f16, %a0
	fmul	%f17, %f17, %f16
	addi	%a0, %zero, 165
	flw	%f16, 0(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f0, %f16, %f0
	addi	%a0, %zero, 174
	fsw	%f0, 0(%a0)
	addi	%a0, %zero, 1
	sw	%a0, 8(%sp)
	addi	%a0, %zero, 165
	flw	%f0, 1(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 174
	fsw	%f0, 1(%a0)
	addi	%a0, %zero, 165
	flw	%f0, 2(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f2
	addi	%a0, %zero, 174
	fsw	%f0, 2(%a0)
	addi	%v0, %zero, 174
	addi	%v1, %t0, 0
	addi	%sp, %sp, 9
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -9
	addi	%v0, %zero, 151
	addi	%sp, %sp, 9
	jal	vecbzero.2645
	addi	%sp, %sp, -9
	addi	%v1, %zero, 75
	addi	%v0, %zero, 159
	addi	%sp, %sp, 9
	jal	veccpy.2647
	addi	%sp, %sp, -9
	flw	%f0, 477(%zero)
	lw	%a1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	flw	%f1, 482(%zero)
	addi	%v1, %zero, 174
	addi	%a0, %at, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 9
	jal	trace_ray.2964
	addi	%sp, %sp, -9
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	p_rgb.2725
	addi	%sp, %sp, -9
	addi	%v1, %zero, 151
	addi	%sp, %sp, 9
	jal	veccpy.2647
	addi	%sp, %sp, -9
	lw	%v1, 5(%sp)
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	p_set_group_id.2739
	addi	%sp, %sp, -9
	addi	%v1, %t0, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 9
	jal	pretrace_diffuse_rays.3024
	addi	%sp, %sp, -9
	lw	%a0, 4(%sp)
	addi	%a0, %a0, -1
	sw	%a0, 9(%sp)
	lw	%v1, 8(%sp)
	lw	%v0, 5(%sp)
	addi	%sp, %sp, 10
	jal	add_mod5.2634
	addi	%sp, %sp, -10
	addi	%a0, %v0, 0
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v1, 9(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3027
bgti_else.13325:
	add	%t0, %zero, %a0
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
	add	%a0, %zero, %t0
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%a2, %zero, 154
	lw	%a2, 0(%a2)
	blt	%v0, %a2, bgt_else.13327
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.13327:
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
	lw	%a0, 4(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 7
	jal	neighbors_exist.2998
	addi	%sp, %sp, -7
	beqi	%v0, 0, bnei_else.13329
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a3, %t0, 0
	addi	%sp, %sp, 7
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -7
	j	bnei_cont.13330
bnei_else.13329:
	addi	%v1, %t0, 0
	addi	%v0, %at, 0
	addi	%sp, %sp, 7
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -7
bnei_cont.13330:
	addi	%sp, %sp, 7
	jal	write_rgb.3022
	addi	%sp, %sp, -7
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	scan_pixel.3038
scan_line.3044:
	add	%a3, %zero, %v0
	sw	%a3, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	add	%v0, %zero, %a1
	sw	%v0, 3(%sp)
	add	%a0, %zero, %a2
	sw	%a0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%a1, %zero, 154
	lw	%a1, 1(%a1)
	blt	%a3, %a1, bgt_else.13331
	jr	%ra
bgt_else.13331:
	addi	%a1, %a1, -1
	blt	%a3, %a1, bgt_else.13333
	j	bgt_cont.13334
bgt_else.13333:
	addi	%v1, %a3, 1
	addi	%sp, %sp, 6
	jal	pretrace_line.3034
	addi	%sp, %sp, -6
bgt_cont.13334:
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 6
	jal	scan_pixel.3038
	addi	%sp, %sp, -6
	lw	%a0, 0(%sp)
	addi	%a0, %a0, 1
	sw	%a0, 6(%sp)
	addi	%v1, %zero, 2
	lw	%v0, 4(%sp)
	addi	%sp, %sp, 7
	jal	add_mod5.2634
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0
	lw	%ra, 5(%sp)
	lw	%a1, 1(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 6(%sp)
	j	scan_line.3044
create_float5x3array.3050:
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
	jal	create_float5x3array.3050
	addi	%sp, %sp, -8
	addi	%t5, %v0, 0
	addi	%sp, %sp, 8
	jal	create_float5x3array.3050
	addi	%sp, %sp, -8
	addi	%t6, %v0, 0
	addi	%v0, %zero, 1
	addi	%v1, %t2, 0
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	addi	%t2, %v0, 0
	addi	%sp, %sp, 8
	jal	create_float5x3array.3050
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
init_line_elements.3054:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	blti	%v1, 0, bgti_else.13335
	addi	%sp, %sp, 3
	jal	create_pixel.3052
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	lw	%v0, 0(%sp)
	lw	%a1, 1(%sp)
	add	%at, %v0, %a1
	sw	%a0, 0(%at)
	addi	%v1, %a1, -1
	lw	%ra, 2(%sp)
	j	init_line_elements.3054
bgti_else.13335:
	jr	%ra
create_pixelline.3057:
	sw	%t5, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%a0, %zero, 154
	lw	%t5, 0(%a0)
	addi	%sp, %sp, 2
	jal	create_pixel.3052
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0
	addi	%v0, %t5, 0
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	addi	%v1, %t5, -2
	lw	%t5, 0(%sp)
	lw	%ra, 1(%sp)
	j	init_line_elements.3054
tan.3059:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
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
	fsqrt	%f1, %f0
	fsw	%f1, 2(%sp)
	flw	%f0, 477(%zero)
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
	sw	%ra, 8(%sp)
	blti	%v0, 5, bgti_else.13336
	fmov	%f0, %f16
	addi	%sp, %sp, 9
	jal	fsqr.2606
	addi	%sp, %sp, -9
	fmov	%f6, %f0
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 9
	jal	fsqr.2606
	addi	%sp, %sp, -9
	fadd	%f0, %f6, %f0
	flw	%f16, 477(%zero)
	fadd	%f0, %f0, %f16
	fsqrt	%f1, %f0
	flw	%f0, 0(%sp)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 9(%sp)
	flw	%f0, 1(%sp)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 10(%sp)
	fdiv	%f6, %f16, %f1
	addi	%a1, %zero, 179
	lw	%a0, 5(%sp)
	add	%at, %a1, %a0
	lw	%at, 0(%at)
	lw	%a0, 6(%sp)
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	d_vec.2744
	addi	%sp, %sp, -11
	flw	%f1, 10(%sp)
	flw	%f0, 9(%sp)
	fmov	%f2, %f6
	addi	%sp, %sp, 11
	jal	vecset.2637
	addi	%sp, %sp, -11
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 40
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	d_vec.2744
	addi	%sp, %sp, -11
	flw	%f0, 10(%sp)
	fneg	%f2, %f0
	flw	%f0, 9(%sp)
	fmov	%f1, %f6
	addi	%sp, %sp, 11
	jal	vecset.2637
	addi	%sp, %sp, -11
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 80
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	d_vec.2744
	addi	%sp, %sp, -11
	flw	%f0, 9(%sp)
	fneg	%f1, %f0
	flw	%f0, 10(%sp)
	fneg	%f2, %f0
	fmov	%f0, %f6
	addi	%sp, %sp, 11
	jal	vecset.2637
	addi	%sp, %sp, -11
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 1
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	d_vec.2744
	addi	%sp, %sp, -11
	flw	%f0, 9(%sp)
	fneg	%f0, %f0
	flw	%f1, 10(%sp)
	fneg	%f1, %f1
	fneg	%f2, %f6
	addi	%sp, %sp, 11
	jal	vecset.2637
	addi	%sp, %sp, -11
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 41
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	d_vec.2744
	addi	%sp, %sp, -11
	flw	%f0, 9(%sp)
	fneg	%f0, %f0
	fneg	%f1, %f6
	flw	%f2, 10(%sp)
	addi	%sp, %sp, 11
	jal	vecset.2637
	addi	%sp, %sp, -11
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 81
	add	%at, %at, %a0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 11
	jal	d_vec.2744
	addi	%sp, %sp, -11
	fneg	%f0, %f6
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	flw	%f2, 10(%sp)
	flw	%f1, 9(%sp)
	j	vecset.2637
bgti_else.13336:
	addi	%sp, %sp, 11
	jal	adjust_position.3061
	addi	%sp, %sp, -11
	fsw	%f0, 11(%sp)
	lw	%a0, 4(%sp)
	addi	%a0, %a0, 1
	sw	%a0, 12(%sp)
	flw	%f1, 3(%sp)
	addi	%sp, %sp, 13
	jal	adjust_position.3061
	addi	%sp, %sp, -13
	fmov	%f1, %f0
	flw	%f6, 7(%sp)
	lw	%ra, 8(%sp)
	flw	%f3, 3(%sp)
	flw	%f2, 2(%sp)
	flw	%f0, 11(%sp)
	lw	%a0, 6(%sp)
	lw	%v1, 5(%sp)
	lw	%v0, 12(%sp)
	j	calc_dirvec.3064
calc_dirvecs.3072:
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
	blti	%v0, 0, bgti_else.13337
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
	jal	calc_dirvec.3064
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
	jal	calc_dirvec.3064
	addi	%sp, %sp, -8
	addi	%v1, %zero, 1
	lw	%a0, 1(%sp)
	addi	%a0, %a0, -1
	sw	%a0, 8(%sp)
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 9
	jal	add_mod5.2634
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0
	flw	%f7, 4(%sp)
	flw	%f6, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	flw	%f0, 0(%sp)
	lw	%a0, 3(%sp)
	lw	%v0, 8(%sp)
	j	calc_dirvecs.3072
bgti_else.13337:
	add	%t0, %zero, %a1
	jr	%ra
calc_dirvec_rows.3077:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%ra, 3(%sp)
	blti	%v0, 0, bgti_else.13339
	itof	%f1, %v0
	flw	%f0, 473(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 436(%zero)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 4
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
bgti_else.13339:
	jr	%ra
create_dirvec.3081:
	sw	%t5, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 482(%zero)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	addi	%t5, %v0, 0
	lw	%v0, 0(%a0)
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
create_dirvec_elements.3083:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	blti	%v1, 0, bgti_else.13341
	addi	%sp, %sp, 3
	jal	create_dirvec.3081
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	lw	%v0, 0(%sp)
	lw	%a1, 1(%sp)
	add	%at, %v0, %a1
	sw	%a0, 0(%at)
	addi	%v1, %a1, -1
	lw	%ra, 2(%sp)
	j	create_dirvec_elements.3083
bgti_else.13341:
	jr	%ra
create_dirvecs.3086:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	blti	%v0, 0, bgti_else.13343
	addi	%a0, %zero, 120
	sw	%a0, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_dirvec.3081
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	lw	%v0, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a0, %zero, 179
	lw	%a1, 0(%sp)
	add	%at, %a0, %a1
	sw	%v0, 0(%at)
	addi	%a0, %zero, 179
	add	%at, %a0, %a1
	lw	%at, 0(%at)
	addi	%v1, %zero, 118
	addi	%v0, %at, 0
	addi	%sp, %sp, 3
	jal	create_dirvec_elements.3083
	addi	%sp, %sp, -3
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%ra, 1(%sp)
	j	create_dirvecs.3086
bgti_else.13343:
	jr	%ra
init_dirvec_constants.3088:
	add	%a0, %zero, %v0
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	blti	%v1, 0, bgti_else.13345
	add	%at, %a0, %v1
	lw	%v0, 0(%at)
	addi	%sp, %sp, 3
	jal	setup_dirvec_constants.2873
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	addi	%v1, %a0, -1
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	init_dirvec_constants.3088
bgti_else.13345:
	jr	%ra
init_vecset_constants.3091:
	add	%a0, %zero, %v0
	sw	%a0, 0(%sp)
	sw	%ra, 1(%sp)
	blti	%a0, 0, bgti_else.13347
	addi	%a1, %zero, 179
	add	%at, %a1, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 119
	addi	%sp, %sp, 2
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -2
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%ra, 1(%sp)
	j	init_vecset_constants.3091
bgti_else.13347:
	jr	%ra
init_dirvecs.3093:
	sw	%ra, 0(%sp)
	addi	%v0, %zero, 4
	sw	%v0, 1(%sp)
	addi	%sp, %sp, 2
	jal	create_dirvecs.3086
	addi	%sp, %sp, -2
	addi	%v0, %zero, 9
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
	sw	%t5, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	create_dirvec.3081
	addi	%sp, %sp, -8
	addi	%t5, %v0, 0
	addi	%v0, %t5, 0
	addi	%sp, %sp, 8
	jal	d_vec.2744
	addi	%sp, %sp, -8
	flw	%f2, 3(%sp)
	flw	%f1, 2(%sp)
	flw	%f0, 1(%sp)
	addi	%sp, %sp, 8
	jal	vecset.2637
	addi	%sp, %sp, -8
	addi	%v0, %t5, 0
	addi	%sp, %sp, 8
	jal	setup_dirvec_constants.2873
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 0(%sp)
	fsw	%f0, 2(%a0)
	sw	%t5, 1(%a0)
	lw	%a1, 5(%sp)
	sw	%a1, 0(%a0)
	addi	%a2, %zero, 254
	lw	%t5, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%a1, 4(%sp)
	add	%at, %a2, %a1
	sw	%a0, 0(%at)
	jr	%ra
setup_rect_reflection.3102:
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
	addi	%a0, %zero, 434
	lw	%t5, 0(%a0)
	flw	%f10, 477(%zero)
	addi	%sp, %sp, 9
	jal	o_diffuse.2707
	addi	%sp, %sp, -9
	fsub	%f12, %f10, %f0
	addi	%a0, %zero, 78
	flw	%f1, 0(%a0)
	fneg	%f13, %f1
	addi	%a0, %zero, 78
	flw	%f14, 1(%a0)
	fneg	%f11, %f14
	addi	%a0, %zero, 78
	flw	%f15, 2(%a0)
	fneg	%f10, %f15
	addi	%v1, %t4, 1
	addi	%v0, %t5, 0
	fmov	%f3, %f10
	fmov	%f2, %f11
	fmov	%f0, %f12
	addi	%sp, %sp, 9
	jal	add_reflection.3095
	addi	%sp, %sp, -9
	addi	%v0, %t5, 1
	addi	%v1, %t4, 2
	fmov	%f3, %f10
	fmov	%f2, %f14
	fmov	%f1, %f13
	fmov	%f0, %f12
	addi	%sp, %sp, 9
	jal	add_reflection.3095
	addi	%sp, %sp, -9
	addi	%v0, %t5, 2
	addi	%v1, %t4, 3
	fmov	%f3, %f15
	fmov	%f2, %f11
	fmov	%f1, %f13
	fmov	%f0, %f12
	addi	%sp, %sp, 9
	jal	add_reflection.3095
	addi	%sp, %sp, -9
	addi	%a1, %t5, 3
	addi	%a0, %zero, 434
	flw	%f15, 0(%sp)
	flw	%f14, 1(%sp)
	flw	%f13, 2(%sp)
	flw	%f12, 3(%sp)
	flw	%f11, 4(%sp)
	flw	%f10, 5(%sp)
	lw	%t5, 6(%sp)
	lw	%t4, 7(%sp)
	lw	%ra, 8(%sp)
	sw	%a1, 0(%a0)
	jr	%ra
setup_surface_reflection.3105:
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
	addi	%a0, %zero, 434
	lw	%t4, 0(%a0)
	flw	%f11, 477(%zero)
	addi	%sp, %sp, 9
	jal	o_diffuse.2707
	addi	%sp, %sp, -9
	fsub	%f12, %f11, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_abc.2699
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0
	addi	%v0, %zero, 78
	addi	%sp, %sp, 9
	jal	veciprod.2658
	addi	%sp, %sp, -9
	fmov	%f11, %f0
	flw	%f13, 468(%zero)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_a.2693
	addi	%sp, %sp, -9
	fmul	%f0, %f13, %f0
	fmul	%f1, %f0, %f11
	addi	%a0, %zero, 78
	flw	%f0, 0(%a0)
	fsub	%f14, %f1, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2695
	addi	%sp, %sp, -9
	fmul	%f0, %f13, %f0
	fmul	%f1, %f0, %f11
	addi	%a0, %zero, 78
	flw	%f0, 1(%a0)
	fsub	%f15, %f1, %f0
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 9
	jal	o_param_c.2697
	addi	%sp, %sp, -9
	fmul	%f0, %f13, %f0
	fmul	%f1, %f0, %f11
	addi	%a0, %zero, 78
	flw	%f0, 2(%a0)
	fsub	%f3, %f1, %f0
	addi	%v1, %t3, 0
	addi	%v0, %t4, 0
	fmov	%f2, %f15
	fmov	%f1, %f14
	fmov	%f0, %f12
	addi	%sp, %sp, 9
	jal	add_reflection.3095
	addi	%sp, %sp, -9
	addi	%a1, %t4, 1
	addi	%a0, %zero, 434
	flw	%f15, 1(%sp)
	flw	%f14, 2(%sp)
	flw	%f13, 3(%sp)
	flw	%f12, 4(%sp)
	flw	%f11, 5(%sp)
	lw	%t4, 6(%sp)
	lw	%t3, 7(%sp)
	lw	%ra, 8(%sp)
	sw	%a1, 0(%a0)
	jr	%ra
setup_reflections.3108:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	blti	%v0, 0, bgti_else.13352
	addi	%a0, %zero, 12
	add	%at, %a0, %v0
	lw	%at, 0(%at)
	addi	%v0, %at, 0
	addi	%sp, %sp, 2
	jal	o_reflectiontype.2687
	addi	%sp, %sp, -2
	beqi	%v0, 2, bnei_else.13353
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.13353:
	addi	%v0, %at, 0
	addi	%sp, %sp, 2
	jal	o_diffuse.2707
	addi	%sp, %sp, -2
	flw	%f1, 477(%zero)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	beqi	%v0, 0, bnei_else.13355
	addi	%v0, %at, 0
	addi	%sp, %sp, 2
	jal	o_form.2685
	addi	%sp, %sp, -2
	beqi	%v0, 1, bnei_else.13356
	beqi	%v0, 2, bnei_else.13357
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.13357:
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %at, 0
	j	setup_surface_reflection.3105
bnei_else.13356:
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %at, 0
	j	setup_rect_reflection.3102
bnei_else.13355:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.13352:
	jr	%ra
rt.3110:
	sw	%ra, 0(%sp)
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
	lw	%a0, 0(%a0)
	addi	%v0, %a0, -1
	addi	%sp, %sp, 6
	jal	setup_reflections.3108
	addi	%sp, %sp, -6
	lw	%v1, 1(%sp)
	lw	%a0, 1(%sp)
	lw	%v0, 4(%sp)
	addi	%a0, %v1, 0
	addi	%sp, %sp, 6
	jal	pretrace_line.3034
	addi	%sp, %sp, -6
	lw	%ra, 0(%sp)
	lw	%a2, 2(%sp)
	lw	%a1, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%v0, 1(%sp)
	j	scan_line.3044
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
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
	addi	%a1, %zero, 1
	sw	%a0, 10(%a1)
	sw	%a0, 9(%a1)
	sw	%a0, 8(%a1)
	sw	%a0, 7(%a1)
	lw	%a2, 1(%sp)
	sw	%a2, 6(%a1)
	sw	%a0, 5(%a1)
	sw	%a0, 4(%a1)
	sw	%a2, 3(%a1)
	sw	%a2, 2(%a1)
	sw	%a2, 1(%a1)
	sw	%a2, 0(%a1)
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
	addi	%a0, %zero, 83
	lw	%at, 0(%a0)
	addi	%a0, %zero, 133
	lw	%v0, 0(%sp)
	addi	%v1, %at, 0
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
	addi	%a0, %zero, 177
	sw	%v0, 1(%a0)
	lw	%a1, 7(%sp)
	sw	%a1, 0(%a0)
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
	addi	%a0, %zero, 247
	sw	%v0, 1(%a0)
	lw	%a1, 8(%sp)
	sw	%a1, 0(%a0)
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
	sw	%v0, 1(%a0)
	lw	%a1, 9(%sp)
	sw	%a1, 0(%a0)
	addi	%v0, %zero, 180
	addi	%a1, %zero, 251
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%a1)
	sw	%a0, 1(%a1)
	lw	%a0, 1(%sp)
	sw	%a0, 0(%a1)
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
	addi	%v0, %zero, 4
	addi	%v1, %v0, 0
	addi	%sp, %sp, 10
	jal	rt.3110
	addi	%sp, %sp, -10
	ret
