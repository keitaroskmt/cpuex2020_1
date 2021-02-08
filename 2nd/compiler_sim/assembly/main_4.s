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
	fblt	%f0, %f1, fbgt_else.8124
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.8124:
	addi	%v0, %zero, 1
	jr	%ra
fispos.2595:
	flw	%f1, 482(%zero)
	fblt	%f1, %f0, fbgt_else.8125
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.8125:
	addi	%v0, %zero, 1
	jr	%ra
fisneg.2597:
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.8126
	addi	%v0, %zero, 0
	jr	%ra
fbgt_else.8126:
	addi	%v0, %zero, 1
	jr	%ra
fiszero.2599:
	flw	%f1, 482(%zero)
	fbne	%f0, %f1, fbeq_else.8127
	addi	%v0, %zero, 1
	jr	%ra
fbeq_else.8127:
	addi	%v0, %zero, 0
	jr	%ra
xor.2601:
	beqi	%v0, 0, bnei_else.8128
	beqi	%v1, 0, bnei_else.8129
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8129:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8128:
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
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 480(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 479(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 478(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	jr	%ra
kernel_cos.2610:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 477(%zero)
	flw	%f3, 481(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 476(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 475(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	jr	%ra
kernel_atan.2612:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	flw	%f4, 474(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 473(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 472(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 471(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 470(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 469(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
f.6155:
	fblt	%f0, %f1, fbgt_else.8130
	flw	%f2, 468(%zero)
	fmul	%f1, %f2, %f1
	j	f.6155
fbgt_else.8130:
	fmov	%f0, %f1
	jr	%ra
g.6159:
	flw	%f2, 1(%k1)
	fblt	%f0, %f2, fbgt_else.8131
	fblt	%f0, %f1, fbgt_else.8132
	fsub	%f0, %f0, %f1
	flw	%f2, 468(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.8132:
	flw	%f2, 468(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.8131:
	jr	%ra
reduction_2pi.2614:
	flw	%f1, 467(%zero)
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	f.6155
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fmov	%f1, %f0
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159
	sw	%v0, 0(%k1)
	flw	%f0, 1(%sp)
	fsw	%f0, 1(%k1)
	flw	%f0, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
cos.2616:
	flw	%f1, 466(%zero)
	fabs	%f0, %f0
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	reduction_2pi.2614
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.8133
	addi	%v0, %zero, 0
	j	fbgt_cont.8134
fbgt_else.8133:
	addi	%v0, %zero, 1
fbgt_cont.8134:
	fblt	%f0, %f1, fbgt_else.8135
	fsub	%f0, %f0, %f1
	j	fbgt_cont.8136
fbgt_else.8135:
fbgt_cont.8136:
	flw	%f2, 465(%zero)
	fblt	%f0, %f2, fbgt_else.8137
	beqi	%v0, 0, bnei_else.8139
	addi	%v0, %zero, 0
	j	bnei_cont.8140
bnei_else.8139:
	addi	%v0, %zero, 1
bnei_cont.8140:
	j	fbgt_cont.8138
fbgt_else.8137:
fbgt_cont.8138:
	fblt	%f0, %f2, fbgt_else.8141
	fsub	%f0, %f1, %f0
	j	fbgt_cont.8142
fbgt_else.8141:
fbgt_cont.8142:
	flw	%f1, 464(%zero)
	sw	%v0, 1(%sp)
	fblt	%f1, %f0, fbgt_else.8143
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_cos.2610
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	fbgt_cont.8144
fbgt_else.8143:
	fsub	%f0, %f2, %f0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_sin.2608
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
fbgt_cont.8144:
	lw	%v0, 1(%sp)
	beqi	%v0, 0, bnei_else.8145
	jr	%ra
bnei_else.8145:
	fneg	%f0, %f0
	jr	%ra
sin.2618:
	flw	%f1, 466(%zero)
	flw	%f2, 482(%zero)
	fblt	%f0, %f2, fbgt_else.8146
	addi	%v0, %zero, 1
	j	fbgt_cont.8147
fbgt_else.8146:
	addi	%v0, %zero, 0
fbgt_cont.8147:
	fabs	%f0, %f0
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	reduction_2pi.2614
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fblt	%f0, %f1, fbgt_else.8148
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.8150
	addi	%v0, %zero, 0
	j	bnei_cont.8151
bnei_else.8150:
	addi	%v0, %zero, 1
bnei_cont.8151:
	j	fbgt_cont.8149
fbgt_else.8148:
	lw	%v0, 0(%sp)
fbgt_cont.8149:
	fblt	%f0, %f1, fbgt_else.8152
	fsub	%f0, %f0, %f1
	j	fbgt_cont.8153
fbgt_else.8152:
fbgt_cont.8153:
	flw	%f2, 465(%zero)
	fblt	%f0, %f2, fbgt_else.8154
	fsub	%f0, %f1, %f0
	j	fbgt_cont.8155
fbgt_else.8154:
fbgt_cont.8155:
	flw	%f1, 464(%zero)
	sw	%v0, 2(%sp)
	fblt	%f1, %f0, fbgt_else.8156
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_sin.2608
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.8157
fbgt_else.8156:
	fsub	%f0, %f2, %f0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_cos.2610
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.8157:
	lw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.8158
	jr	%ra
bnei_else.8158:
	fneg	%f0, %f0
	jr	%ra
atan.2620:
	flw	%f1, 482(%zero)
	fblt	%f0, %f1, fbgt_else.8159
	addi	%v0, %zero, 1
	j	fbgt_cont.8160
fbgt_else.8159:
	addi	%v0, %zero, 0
fbgt_cont.8160:
	fabs	%f1, %f0
	flw	%f2, 463(%zero)
	fblt	%f1, %f2, fbgt_else.8161
	flw	%f0, 462(%zero)
	sw	%v0, 0(%sp)
	fblt	%f1, %f0, fbgt_else.8162
	flw	%f0, 465(%zero)
	flw	%f2, 477(%zero)
	fdiv	%f1, %f2, %f1
	fsw	%f0, 1(%sp)
	fmov	%f0, %f1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_atan.2612
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	j	fbgt_cont.8163
fbgt_else.8162:
	flw	%f0, 464(%zero)
	flw	%f2, 477(%zero)
	fsub	%f3, %f1, %f2
	fadd	%f1, %f1, %f2
	fdiv	%f1, %f3, %f1
	fsw	%f0, 2(%sp)
	fmov	%f0, %f1
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_atan.2612
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
fbgt_cont.8163:
	lw	%v0, 0(%sp)
	beqi	%v0, 0, bnei_else.8164
	jr	%ra
bnei_else.8164:
	fneg	%f0, %f0
	jr	%ra
fbgt_else.8161:
	j	kernel_atan.2612
print_int_sub1.2622:
	blti	%v0, 10, bgti_else.8165
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2622
bgti_else.8165:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2625:
	blti	%v0, 10, bgti_else.8166
	addi	%v0, %v0, -10
	j	print_int_sub2.2625
bgti_else.8166:
	jr	%ra
print_int.2627:
	addi	%v1, %zero, 0
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub1.2622
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub2.2625
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.8167
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.8167:
	lw	%a0, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub1.2622
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.8168
	addi	%v0, %v0, 48
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_print_char
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
bgt_else.8168:
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	print_int_sub2.2625
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_print_char
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
sgn.2629:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fiszero.2599
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.8169
	flw	%f0, 482(%zero)
	jr	%ra
bnei_else.8169:
	flw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fispos.2595
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.8170
	flw	%f0, 477(%zero)
	jr	%ra
bnei_else.8170:
	flw	%f0, 461(%zero)
	jr	%ra
fneg_cond.2631:
	beqi	%v0, 0, bnei_else.8171
	jr	%ra
bnei_else.8171:
	fneg	%f0, %f0
	jr	%ra
add_mod5.2634:
	add	%v0, %v0, %v1
	blti	%v0, 5, bgti_else.8172
	addi	%v0, %v0, -5
	jr	%ra
bgti_else.8172:
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
	flw	%f0, 0(%v0)
	fsw	%f0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fsqr.2606
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	flw	%f1, 1(%v0)
	fsw	%f1, 3(%sp)
	fsw	%f0, 4(%sp)
	fmov	%f0, %f1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fsqr.2606
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	flw	%f1, 2(%v0)
	fsw	%f1, 5(%sp)
	fsw	%f0, 6(%sp)
	fmov	%f0, %f1
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fsqr.2606
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fiszero.2599
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.8176
	flw	%f0, 477(%zero)
	j	bnei_cont.8177
bnei_else.8176:
	lw	%v0, 1(%sp)
	beqi	%v0, 0, bnei_else.8178
	flw	%f0, 461(%zero)
	flw	%f1, 7(%sp)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.8179
bnei_else.8178:
	flw	%f0, 477(%zero)
	flw	%f1, 7(%sp)
	fdiv	%f0, %f0, %f1
bnei_cont.8179:
bnei_cont.8177:
	flw	%f1, 0(%sp)
	fmul	%f1, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f1, 0(%v0)
	flw	%f1, 3(%sp)
	fmul	%f1, %f1, %f0
	fsw	%f1, 1(%v0)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
veciprod.2658:
	flw	%f0, 0(%v0)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	flw	%f2, 2(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	jr	%ra
veciprod2.2661:
	flw	%f3, 0(%v0)
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%v0)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	jr	%ra
vecaccum.2666:
	flw	%f1, 0(%v0)
	flw	%f2, 0(%v1)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 0(%v0)
	flw	%f1, 1(%v0)
	flw	%f2, 1(%v1)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 1(%v0)
	flw	%f1, 2(%v0)
	flw	%f2, 2(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 2(%v0)
	jr	%ra
vecadd.2670:
	flw	%f0, 0(%v0)
	flw	%f1, 0(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v0)
	flw	%f1, 1(%v1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v0)
	flw	%f1, 2(%v1)
	fadd	%f0, %f0, %f1
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
	flw	%f0, 0(%v0)
	flw	%f1, 0(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v0)
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v0)
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
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
	lw	%v0, 6(%v0)
	jr	%ra
o_isrot.2691:
	lw	%v0, 3(%v0)
	jr	%ra
o_param_a.2693:
	lw	%v0, 4(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_param_b.2695:
	lw	%v0, 4(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_param_c.2697:
	lw	%v0, 4(%v0)
	flw	%f0, 2(%v0)
	jr	%ra
o_param_abc.2699:
	lw	%v0, 4(%v0)
	jr	%ra
o_param_x.2701:
	lw	%v0, 5(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_param_y.2703:
	lw	%v0, 5(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_param_z.2705:
	lw	%v0, 5(%v0)
	flw	%f0, 2(%v0)
	jr	%ra
o_diffuse.2707:
	lw	%v0, 7(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_hilight.2709:
	lw	%v0, 7(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_color_red.2711:
	lw	%v0, 8(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_color_green.2713:
	lw	%v0, 8(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_color_blue.2715:
	lw	%v0, 8(%v0)
	flw	%f0, 2(%v0)
	jr	%ra
o_param_r1.2717:
	lw	%v0, 9(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_param_r2.2719:
	lw	%v0, 9(%v0)
	flw	%f0, 1(%v0)
	jr	%ra
o_param_r3.2721:
	lw	%v0, 9(%v0)
	flw	%f0, 2(%v0)
	jr	%ra
o_param_ctbl.2723:
	lw	%v0, 10(%v0)
	jr	%ra
p_rgb.2725:
	lw	%v0, 0(%v0)
	jr	%ra
p_intersection_points.2727:
	lw	%v0, 1(%v0)
	jr	%ra
p_surface_ids.2729:
	lw	%v0, 2(%v0)
	jr	%ra
p_calc_diffuse.2731:
	lw	%v0, 3(%v0)
	jr	%ra
p_energy.2733:
	lw	%v0, 4(%v0)
	jr	%ra
p_received_ray_20percent.2735:
	lw	%v0, 5(%v0)
	jr	%ra
p_group_id.2737:
	lw	%v0, 6(%v0)
	lw	%v0, 0(%v0)
	jr	%ra
p_set_group_id.2739:
	lw	%v0, 6(%v0)
	sw	%v1, 0(%v0)
	jr	%ra
p_nvectors.2742:
	lw	%v0, 7(%v0)
	jr	%ra
d_vec.2744:
	lw	%v0, 0(%v0)
	jr	%ra
d_const.2746:
	lw	%v0, 1(%v0)
	jr	%ra
r_surface_id.2748:
	lw	%v0, 0(%v0)
	jr	%ra
r_dvec.2750:
	lw	%v0, 1(%v0)
	jr	%ra
r_bright.2752:
	flw	%f0, 2(%v0)
	jr	%ra
rad.2754:
	flw	%f1, 460(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
read_screen_settings.2756:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 72
	fsw	%f0, 72(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 72
	fsw	%f0, 73(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 72
	fsw	%f0, 74(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	rad.2754
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	cos.2616
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fmov	%f0, %f1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	sin.2618
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	rad.2754
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	cos.2616
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsw	%f0, 4(%sp)
	fmov	%f0, %f1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	sin.2618
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 1(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 459(%zero)
	fmul	%f2, %f2, %f3
	addi	%v0, %zero, 171
	fsw	%f2, 171(%zero)
	flw	%f2, 458(%zero)
	flw	%f4, 2(%sp)
	fmul	%f2, %f4, %f2
	addi	%v0, %zero, 171
	fsw	%f2, 172(%zero)
	flw	%f2, 4(%sp)
	fmul	%f5, %f1, %f2
	fmul	%f3, %f5, %f3
	addi	%v0, %zero, 171
	fsw	%f3, 173(%zero)
	addi	%v0, %zero, 165
	fsw	%f2, 165(%zero)
	flw	%f3, 482(%zero)
	addi	%v0, %zero, 165
	fsw	%f3, 166(%zero)
	fneg	%f3, %f0
	addi	%v0, %zero, 165
	fsw	%f3, 167(%zero)
	fneg	%f3, %f4
	fmul	%f0, %f3, %f0
	addi	%v0, %zero, 168
	fsw	%f0, 168(%zero)
	fneg	%f0, %f1
	addi	%v0, %zero, 168
	fsw	%f0, 169(%zero)
	fneg	%f0, %f4
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 168
	fsw	%f0, 170(%zero)
	addi	%v0, %zero, 72
	flw	%f0, 72(%zero)
	addi	%v0, %zero, 171
	flw	%f1, 171(%zero)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 75
	fsw	%f0, 75(%zero)
	addi	%v0, %zero, 72
	flw	%f0, 73(%zero)
	addi	%v0, %zero, 171
	flw	%f1, 172(%zero)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 75
	fsw	%f0, 76(%zero)
	addi	%v0, %zero, 72
	flw	%f0, 74(%zero)
	addi	%v0, %zero, 171
	flw	%f1, 173(%zero)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 75
	fsw	%f0, 77(%zero)
	jr	%ra
read_light.2758:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_int
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	rad.2754
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	sin.2618
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 79(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_float
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	rad.2754
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fmov	%f0, %f1
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
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 78(%zero)
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	cos.2616
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 78
	fsw	%f0, 80(%zero)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 81
	fsw	%f0, 81(%zero)
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
	fsw	%f3, 10(%sp)
	fsw	%f2, 11(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f10, 13(%sp)
	fsw	%f4, 14(%sp)
	fsw	%f6, 15(%sp)
	fsw	%f7, 16(%sp)
	fsw	%f9, 17(%sp)
	fsw	%f1, 18(%sp)
	fsw	%f8, 19(%sp)
	fsw	%f11, 20(%sp)
	fsw	%f5, 21(%sp)
	fmov	%f0, %f3
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	fsqr.2606
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 21(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 20(%sp)
	fsw	%f0, 22(%sp)
	fmov	%f0, %f2
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	fsqr.2606
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 19(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 22(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 18(%sp)
	fsw	%f0, 23(%sp)
	fmov	%f0, %f2
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	fsqr.2606
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f1, 17(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 23(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 16(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	fsqr.2606
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f1, 21(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 15(%sp)
	fsw	%f0, 24(%sp)
	fmov	%f0, %f2
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	fsqr.2606
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f1, 19(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 24(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 14(%sp)
	fsw	%f0, 25(%sp)
	fmov	%f0, %f2
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f1, 17(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 25(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 13(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f1, 21(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 12(%sp)
	fsw	%f0, 26(%sp)
	fmov	%f0, %f2
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	fsqr.2606
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f1, 19(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 26(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 11(%sp)
	fsw	%f0, 27(%sp)
	fmov	%f0, %f2
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	fsqr.2606
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f1, 17(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 27(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 468(%zero)
	flw	%f2, 16(%sp)
	flw	%f3, 21(%sp)
	fmul	%f4, %f3, %f2
	flw	%f5, 13(%sp)
	fmul	%f4, %f4, %f5
	flw	%f6, 15(%sp)
	flw	%f7, 19(%sp)
	fmul	%f8, %f7, %f6
	flw	%f9, 12(%sp)
	fmul	%f8, %f8, %f9
	fadd	%f4, %f4, %f8
	flw	%f8, 14(%sp)
	fmul	%f10, %f1, %f8
	flw	%f11, 11(%sp)
	fmul	%f10, %f10, %f11
	fadd	%f4, %f4, %f10
	fmul	%f4, %f0, %f4
	lw	%v0, 1(%sp)
	fsw	%f4, 0(%v0)
	flw	%f4, 10(%sp)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f3, %f5
	flw	%f5, 20(%sp)
	fmul	%f5, %f7, %f5
	fmul	%f7, %f5, %f9
	fadd	%f4, %f4, %f7
	flw	%f7, 18(%sp)
	fmul	%f1, %f1, %f7
	fmul	%f7, %f1, %f11
	fadd	%f4, %f4, %f7
	fmul	%f4, %f0, %f4
	fsw	%f4, 1(%v0)
	fmul	%f2, %f3, %f2
	fmul	%f3, %f5, %f6
	fadd	%f2, %f2, %f3
	fmul	%f1, %f1, %f8
	fadd	%f1, %f2, %f1
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%v0)
	jr	%ra
read_nth_object.2763:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.8189
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
	flw	%f0, 482(%zero)
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
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fisneg.2597
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f0, 5(%sp)
	lw	%v1, 8(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
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
	beqi	%v1, 0, bnei_else.8190
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	rad.2754
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	rad.2754
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	rad.2754
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	fsw	%f0, 2(%v0)
	j	bnei_cont.8191
bnei_else.8190:
bnei_cont.8191:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.8192
	lw	%a0, 10(%sp)
	j	bnei_cont.8193
bnei_else.8192:
	addi	%a0, %zero, 1
bnei_cont.8193:
	addi	%a1, %zero, 4
	flw	%f0, 5(%sp)
	sw	%a0, 14(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)
	lw	%v0, 13(%sp)
	sw	%v0, 9(%v1)
	lw	%a0, 12(%sp)
	sw	%a0, 8(%v1)
	lw	%a0, 11(%sp)
	sw	%a0, 7(%v1)
	lw	%a0, 14(%sp)
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
	beqi	%a2, 3, bnei_else.8194
	beqi	%a2, 2, bnei_else.8196
	j	bnei_cont.8197
bnei_else.8196:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.8198
	addi	%v1, %zero, 0
	j	bnei_cont.8199
bnei_else.8198:
	addi	%v1, %zero, 1
bnei_cont.8199:
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
bnei_cont.8197:
	j	bnei_cont.8195
bnei_else.8194:
	flw	%f0, 0(%a0)
	fsw	%f0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	fiszero.2599
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	beqi	%v0, 0, bnei_else.8200
	flw	%f0, 5(%sp)
	j	bnei_cont.8201
bnei_else.8200:
	flw	%f0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	sgn.2629
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 15(%sp)
	fsw	%f0, 16(%sp)
	fmov	%f0, %f1
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	fsqr.2606
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fdiv	%f0, %f1, %f0
bnei_cont.8201:
	lw	%v0, 7(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v0)
	fsw	%f0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fiszero.2599
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	beqi	%v0, 0, bnei_else.8202
	flw	%f0, 5(%sp)
	j	bnei_cont.8203
bnei_else.8202:
	flw	%f0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	sgn.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fsw	%f0, 18(%sp)
	fmov	%f0, %f1
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fsqr.2606
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 18(%sp)
	fdiv	%f0, %f1, %f0
bnei_cont.8203:
	lw	%v0, 7(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v0)
	fsw	%f0, 19(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	fiszero.2599
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	beqi	%v0, 0, bnei_else.8204
	flw	%f0, 5(%sp)
	j	bnei_cont.8205
bnei_else.8204:
	flw	%f0, 19(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	sgn.2629
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 19(%sp)
	fsw	%f0, 20(%sp)
	fmov	%f0, %f1
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	fsqr.2606
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f1, 20(%sp)
	fdiv	%f0, %f1, %f0
bnei_cont.8205:
	lw	%v0, 7(%sp)
	fsw	%f0, 2(%v0)
bnei_cont.8195:
	lw	%v0, 4(%sp)
	beqi	%v0, 0, bnei_else.8206
	lw	%v0, 7(%sp)
	lw	%v1, 13(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	rotate_quadratic_matrix.2760
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bnei_cont.8207
bnei_else.8206:
bnei_cont.8207:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8189:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2765:
	blti	%v0, 60, bgti_else.8208
	jr	%ra
bgti_else.8208:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2763
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.8210
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	read_object.2765
bnei_else.8210:
	addi	%v0, %zero, 0
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
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
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.8212
	lw	%v1, 0(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_net_item.2769
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.8212:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_or_network.2771:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_net_item.2769
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.8213
	lw	%v0, 0(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_or_network.2771
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.8213:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_and_network.2773:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_net_item.2769
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.8214
	addi	%v1, %zero, 83
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2773
bnei_else.8214:
	jr	%ra
read_parameter.2775:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_screen_settings.2756
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_light.2758
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_all_object.2767
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_and_network.2773
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_or_network.2771
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, 134
	sw	%v0, 134(%zero)
	jr	%ra
solver_rect_surface.2777:
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	fsw	%f2, 0(%sp)
	sw	%a2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	fsw	%f0, 5(%sp)
	sw	%a0, 6(%sp)
	fsw	%f3, 7(%sp)
	sw	%v0, 8(%sp)
	fmov	%f0, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fiszero.2599
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, 0, bnei_else.8217
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8217:
	lw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_abc.2699
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2689
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f0, 7(%sp)
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fisneg.2597
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	xor.2601
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	flw	%f0, 0(%at)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fneg_cond.2631
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f0, %f1
	flw	%f1, 7(%sp)
	fdiv	%f0, %f0, %f1
	lw	%v0, 3(%sp)
	lw	%v1, 4(%sp)
	add	%at, %v1, %v0
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	flw	%f2, 2(%sp)
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	lw	%a0, 9(%sp)
	add	%at, %a0, %v0
	flw	%f2, 0(%at)
	fsw	%f0, 11(%sp)
	fmov	%f0, %f1
	fmov	%f1, %f2
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fless.2592
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.8218
	lw	%v0, 1(%sp)
	lw	%v1, 4(%sp)
	add	%at, %v1, %v0
	flw	%f0, 0(%at)
	flw	%f1, 11(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 0(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v1, 9(%sp)
	add	%at, %v1, %v0
	flw	%f2, 0(%at)
	fmov	%f1, %f2
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fless.2592
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.8219
	addi	%v0, %zero, 135
	flw	%f0, 11(%sp)
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8219:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8218:
	addi	%v0, %zero, 0
	jr	%ra
solver_rect.2786:
	addi	%a0, %zero, 0
	addi	%a1, %zero, 1
	addi	%a2, %zero, 2
	fsw	%f0, 0(%sp)
	fsw	%f2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%a1, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.8220
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8220:
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
	beqi	%v0, 0, bnei_else.8221
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.8221:
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
	beqi	%v0, 0, bnei_else.8222
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.8222:
	addi	%v0, %zero, 0
	jr	%ra
solver_surface.2792:
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_abc.2699
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2658
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fispos.2595
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.8223
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	veciprod2.2661
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	fneg	%f0, %f0
	flw	%f1, 5(%sp)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8223:
	addi	%v0, %zero, 0
	jr	%ra
quadratic.2798:
	fsw	%f0, 0(%sp)
	fsw	%f2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fsqr.2606
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2693
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	fsw	%f0, 5(%sp)
	fmov	%f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fsqr.2606
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_b.2695
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%sp)
	fsw	%f0, 7(%sp)
	fmov	%f0, %f1
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fsqr.2606
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2691
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.8224
	flw	%f0, 1(%sp)
	flw	%f1, 2(%sp)
	fmul	%f2, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f2, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r1.2717
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 9(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 0(%sp)
	flw	%f2, 1(%sp)
	fmul	%f2, %f2, %f1
	lw	%v0, 3(%sp)
	fsw	%f0, 11(%sp)
	fsw	%f2, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r2.2719
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 12(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 11(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	flw	%f2, 0(%sp)
	fmul	%f1, %f2, %f1
	lw	%v0, 3(%sp)
	fsw	%f0, 13(%sp)
	fsw	%f1, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_param_r3.2721
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 13(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
bnei_else.8224:
	flw	%f0, 9(%sp)
	jr	%ra
bilinear.2803:
	fmul	%f6, %f0, %f3
	fsw	%f3, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f5, 2(%sp)
	fsw	%f2, 3(%sp)
	sw	%v0, 4(%sp)
	fsw	%f4, 5(%sp)
	fsw	%f1, 6(%sp)
	fsw	%f6, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_a.2693
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	fmul	%f3, %f2, %f1
	lw	%v0, 4(%sp)
	fsw	%f0, 8(%sp)
	fsw	%f3, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_param_b.2695
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	flw	%f2, 3(%sp)
	fmul	%f3, %f2, %f1
	lw	%v0, 4(%sp)
	fsw	%f0, 10(%sp)
	fsw	%f3, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_c.2697
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 10(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	fsw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_isrot.2691
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.8225
	flw	%f0, 5(%sp)
	flw	%f1, 3(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 2(%sp)
	flw	%f4, 6(%sp)
	fmul	%f5, %f4, %f3
	fadd	%f2, %f2, %f5
	lw	%v0, 4(%sp)
	fsw	%f2, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	o_param_r1.2717
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	fmul	%f1, %f2, %f1
	flw	%f3, 0(%sp)
	flw	%f4, 3(%sp)
	fmul	%f4, %f4, %f3
	fadd	%f1, %f1, %f4
	lw	%v0, 4(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f1, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	o_param_r2.2719
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 15(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 14(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	flw	%f2, 1(%sp)
	fmul	%f1, %f2, %f1
	flw	%f2, 0(%sp)
	flw	%f3, 6(%sp)
	fmul	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
	lw	%v0, 4(%sp)
	fsw	%f0, 16(%sp)
	fsw	%f1, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	o_param_r3.2721
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 16(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fhalf.2604
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
bnei_else.8225:
	flw	%f0, 12(%sp)
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
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fiszero.2599
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.8226
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8226:
	flw	%f0, 5(%sp)
	flw	%f1, 4(%sp)
	flw	%f2, 3(%sp)
	flw	%f3, 2(%sp)
	flw	%f4, 1(%sp)
	flw	%f5, 0(%sp)
	lw	%v0, 6(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	bilinear.2803
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	flw	%f3, 0(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 8(%sp)
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	quadratic.2798
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_form.2685
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 3, bnei_else.8227
	flw	%f0, 9(%sp)
	j	bnei_cont.8228
bnei_else.8227:
	flw	%f0, 477(%zero)
	flw	%f1, 9(%sp)
	fsub	%f0, %f1, %f0
bnei_cont.8228:
	flw	%f1, 8(%sp)
	fsw	%f0, 10(%sp)
	fmov	%f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fsqr.2606
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	flw	%f2, 7(%sp)
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	fsw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fispos.2595
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.8229
	flw	%f0, 11(%sp)
	fsqrt	%f0, %f0
	lw	%v0, 6(%sp)
	fsw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_isinvert.2689
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.8230
	flw	%f0, 12(%sp)
	j	bnei_cont.8231
bnei_else.8230:
	flw	%f0, 12(%sp)
	fneg	%f0, %f0
bnei_cont.8231:
	flw	%f1, 8(%sp)
	fsub	%f0, %f0, %f1
	flw	%f1, 7(%sp)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8229:
	addi	%v0, %zero, 0
	jr	%ra
solver.2817:
	addi	%a1, %zero, 12
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	flw	%f0, 0(%a0)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2701
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f1, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_y.2703
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	flw	%f1, 2(%v0)
	lw	%v0, 1(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f1, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_z.2705
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_form.2685
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, 1, bnei_else.8232
	beqi	%v0, 2, bnei_else.8233
	flw	%f0, 4(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	j	solver_second.2811
bnei_else.8233:
	flw	%f0, 4(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	j	solver_surface.2792
bnei_else.8232:
	flw	%f0, 4(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	j	solver_rect.2786
solver_rect_fast.2821:
	flw	%f3, 0(%a0)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a0)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%v1)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	fsw	%f5, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%a0, 3(%sp)
	fsw	%f4, 4(%sp)
	sw	%v0, 5(%sp)
	fsw	%f2, 6(%sp)
	fsw	%f3, 7(%sp)
	sw	%v1, 8(%sp)
	fsw	%f6, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_param_b.2695
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	fmov	%f1, %f0
	flw	%f0, 9(%sp)
	fsw	%f1, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fless.2592
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.8234
	lw	%v0, 8(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 7(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 6(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v1, 5(%sp)
	fsw	%f0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_c.2697
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	fmov	%f1, %f0
	flw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fless.2592
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.8236
	flw	%f0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fiszero.2599
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.8238
	addi	%v0, %zero, 0
	j	bnei_cont.8239
bnei_else.8238:
	addi	%v0, %zero, 1
bnei_cont.8239:
	j	bnei_cont.8237
bnei_else.8236:
	addi	%v0, %zero, 0
bnei_cont.8237:
	j	bnei_cont.8235
bnei_else.8234:
	addi	%v0, %zero, 0
bnei_cont.8235:
	beqi	%v0, 0, bnei_else.8240
	addi	%v0, %zero, 135
	flw	%f0, 7(%sp)
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8240:
	lw	%v0, 3(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 2(%sp)
	fsub	%f0, %f0, %f1
	flw	%f2, 3(%v0)
	fmul	%f0, %f0, %f2
	lw	%v1, 8(%sp)
	flw	%f3, 0(%v1)
	fmul	%f4, %f0, %f3
	flw	%f5, 1(%sp)
	fadd	%f4, %f4, %f5
	fabs	%f4, %f4
	lw	%a0, 5(%sp)
	fsw	%f3, 12(%sp)
	fsw	%f2, 13(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f4, 15(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	o_param_a.2693
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	fmov	%f1, %f0
	flw	%f0, 15(%sp)
	fsw	%f1, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	fless.2592
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	beqi	%v0, 0, bnei_else.8241
	lw	%v0, 8(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 6(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v0, 5(%sp)
	fsw	%f0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	o_param_c.2697
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	fmov	%f1, %f0
	flw	%f0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fless.2592
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	beqi	%v0, 0, bnei_else.8243
	flw	%f0, 13(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fiszero.2599
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	beqi	%v0, 0, bnei_else.8245
	addi	%v0, %zero, 0
	j	bnei_cont.8246
bnei_else.8245:
	addi	%v0, %zero, 1
bnei_cont.8246:
	j	bnei_cont.8244
bnei_else.8243:
	addi	%v0, %zero, 0
bnei_cont.8244:
	j	bnei_cont.8242
bnei_else.8241:
	addi	%v0, %zero, 0
bnei_cont.8242:
	beqi	%v0, 0, bnei_else.8247
	addi	%v0, %zero, 135
	flw	%f0, 14(%sp)
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.8247:
	lw	%v0, 3(%sp)
	flw	%f0, 4(%v0)
	flw	%f1, 6(%sp)
	fsub	%f0, %f0, %f1
	flw	%f1, 5(%v0)
	fmul	%f0, %f0, %f1
	flw	%f2, 12(%sp)
	fmul	%f2, %f0, %f2
	flw	%f3, 1(%sp)
	fadd	%f2, %f2, %f3
	fabs	%f2, %f2
	flw	%f3, 16(%sp)
	fsw	%f1, 18(%sp)
	fsw	%f0, 19(%sp)
	fmov	%f1, %f3
	fmov	%f0, %f2
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	fless.2592
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	beqi	%v0, 0, bnei_else.8248
	flw	%f0, 0(%sp)
	flw	%f1, 19(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 2(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	flw	%f2, 10(%sp)
	fmov	%f1, %f2
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	fless.2592
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	beqi	%v0, 0, bnei_else.8250
	flw	%f0, 18(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	fiszero.2599
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	beqi	%v0, 0, bnei_else.8252
	addi	%v0, %zero, 0
	j	bnei_cont.8253
bnei_else.8252:
	addi	%v0, %zero, 1
bnei_cont.8253:
	j	bnei_cont.8251
bnei_else.8250:
	addi	%v0, %zero, 0
bnei_cont.8251:
	j	bnei_cont.8249
bnei_else.8248:
	addi	%v0, %zero, 0
bnei_cont.8249:
	beqi	%v0, 0, bnei_else.8254
	addi	%v0, %zero, 135
	flw	%f0, 19(%sp)
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.8254:
	addi	%v0, %zero, 0
	jr	%ra
solver_surface_fast.2828:
	flw	%f3, 0(%v1)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v1, 3(%sp)
	fmov	%f0, %f3
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fisneg.2597
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.8255
	lw	%v0, 3(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	flw	%f2, 1(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%v0)
	flw	%f2, 0(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8255:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast.2834:
	flw	%f3, 0(%v1)
	fsw	%f3, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f1, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%v1, 5(%sp)
	fmov	%f0, %f3
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.8256
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8256:
	lw	%v0, 5(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 4(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 2(%v0)
	flw	%f3, 3(%sp)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	flw	%f2, 3(%v0)
	flw	%f4, 2(%sp)
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	lw	%v1, 1(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %v1, 0
	fmov	%f2, %f4
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	quadratic.2798
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 1(%sp)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_form.2685
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 3, bnei_else.8257
	flw	%f0, 7(%sp)
	j	bnei_cont.8258
bnei_else.8257:
	flw	%f0, 477(%zero)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
bnei_cont.8258:
	flw	%f1, 6(%sp)
	fsw	%f0, 8(%sp)
	fmov	%f0, %f1
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fsqr.2606
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 0(%sp)
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fispos.2595
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.8259
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2689
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.8260
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 5(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 135(%zero)
	j	bnei_cont.8261
bnei_else.8260:
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 5(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 135(%zero)
bnei_cont.8261:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8259:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast.2840:
	addi	%a1, %zero, 12
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	flw	%f0, 0(%a0)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	fsw	%f0, 4(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_x.2701
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 2(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_y.2703
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	flw	%f1, 2(%v0)
	lw	%v0, 2(%sp)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_z.2705
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	d_const.2746
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v1, 2(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_form.2685
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 1, bnei_else.8262
	beqi	%v0, 2, bnei_else.8263
	flw	%f0, 5(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	j	solver_second_fast.2834
bnei_else.8263:
	flw	%f0, 5(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	j	solver_surface_fast.2828
bnei_else.8262:
	lw	%v0, 1(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	d_vec.2744
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 5(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 2(%sp)
	lw	%a0, 10(%sp)
	j	solver_rect_fast.2821
solver_surface_fast2.2844:
	flw	%f0, 0(%v1)
	fsw	%f0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	fisneg.2597
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.8264
	lw	%v0, 1(%sp)
	flw	%f0, 3(%v0)
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 135
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8264:
	addi	%v0, %zero, 0
	jr	%ra
solver_second_fast2.2851:
	flw	%f3, 0(%v1)
	sw	%v0, 0(%sp)
	fsw	%f3, 1(%sp)
	sw	%a0, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	sw	%v1, 6(%sp)
	fmov	%f0, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fiszero.2599
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.8265
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8265:
	lw	%v0, 6(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%v0)
	flw	%f2, 3(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lw	%v1, 2(%sp)
	flw	%f1, 3(%v1)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fsqr.2606
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 1(%sp)
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fispos.2595
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.8266
	lw	%v0, 0(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2689
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.8267
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 135(%zero)
	j	bnei_cont.8268
bnei_else.8267:
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 135
	fsw	%f0, 135(%zero)
bnei_cont.8268:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8266:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2858:
	addi	%a0, %zero, 12
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_param_ctbl.2723
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f0, 0(%v0)
	flw	%f1, 1(%v0)
	flw	%f2, 2(%v0)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f1, 5(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	d_const.2746
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v1, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_form.2685
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 1, bnei_else.8269
	beqi	%v0, 2, bnei_else.8270
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 3(%sp)
	j	solver_second_fast2.2851
bnei_else.8270:
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 3(%sp)
	j	solver_surface_fast2.2844
bnei_else.8269:
	lw	%v0, 2(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	d_vec.2744
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%a0, 7(%sp)
	j	solver_rect_fast.2821
setup_rect_table.2861:
	addi	%a0, %zero, 6
	flw	%f0, 482(%zero)
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
	sw	%v0, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fiszero.2599
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.8271
	lw	%v0, 3(%sp)
	flw	%f0, 0(%sp)
	fsw	%f0, 1(%v0)
	j	bnei_cont.8272
bnei_else.8271:
	lw	%v0, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2689
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f0, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fisneg.2597
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	xor.2601
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_a.2693
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fneg_cond.2631
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 477(%zero)
	flw	%f1, 4(%sp)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
bnei_cont.8272:
	lw	%v1, 2(%sp)
	flw	%f0, 1(%v1)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fiszero.2599
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.8273
	lw	%v0, 3(%sp)
	flw	%f0, 0(%sp)
	fsw	%f0, 3(%v0)
	j	bnei_cont.8274
bnei_else.8273:
	lw	%v0, 1(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_isinvert.2689
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 7(%sp)
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fisneg.2597
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	xor.2601
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_param_b.2695
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fneg_cond.2631
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 477(%zero)
	flw	%f1, 7(%sp)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 3(%v0)
bnei_cont.8274:
	lw	%v1, 2(%sp)
	flw	%f0, 2(%v1)
	fsw	%f0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fiszero.2599
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.8275
	lw	%v0, 3(%sp)
	flw	%f0, 0(%sp)
	fsw	%f0, 5(%v0)
	j	bnei_cont.8276
bnei_else.8275:
	lw	%v0, 1(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_isinvert.2689
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f0, 10(%sp)
	sw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fisneg.2597
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	xor.2601
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_param_c.2697
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fneg_cond.2631
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 4(%v0)
	flw	%f0, 477(%zero)
	flw	%f1, 10(%sp)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 5(%v0)
bnei_cont.8276:
	jr	%ra
setup_surface_table.2864:
	addi	%a0, %zero, 4
	flw	%f0, 482(%zero)
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
	sw	%v0, 3(%sp)
	fsw	%f0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2693
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fmul	%f1, %f1, %f0
	lw	%v0, 2(%sp)
	flw	%f2, 1(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f1, 6(%sp)
	fsw	%f2, 7(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2695
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fmul	%f1, %f1, %f0
	flw	%f2, 6(%sp)
	fadd	%f1, %f2, %f1
	lw	%v0, 2(%sp)
	flw	%f2, 2(%v0)
	lw	%v0, 1(%sp)
	fsw	%f0, 8(%sp)
	fsw	%f1, 9(%sp)
	fsw	%f2, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_c.2697
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fmul	%f1, %f1, %f0
	flw	%f2, 9(%sp)
	fadd	%f1, %f2, %f1
	fsw	%f0, 11(%sp)
	fsw	%f1, 12(%sp)
	fmov	%f0, %f1
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fispos.2595
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.8277
	flw	%f0, 461(%zero)
	flw	%f1, 12(%sp)
	fdiv	%f0, %f0, %f1
	lw	%v0, 3(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 5(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	flw	%f0, 8(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	flw	%f0, 11(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.8278
bnei_else.8277:
	lw	%v0, 3(%sp)
	flw	%f0, 0(%sp)
	fsw	%f0, 0(%v0)
bnei_cont.8278:
	jr	%ra
setup_second_table.2867:
	addi	%a0, %zero, 5
	flw	%f0, 482(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	lw	%v1, 0(%sp)
	sw	%v0, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	quadratic.2798
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	fsw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_a.2693
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2695
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 3(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 2(%sp)
	flw	%f2, 6(%sp)
	fsw	%f2, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2691
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.8279
	lw	%v0, 0(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_param_r2.2719
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 3(%sp)
	fmul	%f2, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 10(%sp)
	fsw	%f2, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_r3.2721
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 4(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 11(%sp)
	fadd	%f2, %f3, %f2
	fsw	%f0, 12(%sp)
	fmov	%f0, %f2
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fhalf.2604
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 1(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r1.2717
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 3(%sp)
	fmul	%f1, %f1, %f0
	flw	%f2, 12(%sp)
	flw	%f3, 5(%sp)
	fmul	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
	fsw	%f0, 13(%sp)
	fmov	%f0, %f1
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	fhalf.2604
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 13(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 10(%sp)
	flw	%f2, 5(%sp)
	fmul	%f1, %f2, %f1
	fadd	%f0, %f0, %f1
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	fhalf.2604
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 9(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
	j	bnei_cont.8280
bnei_else.8279:
	lw	%v0, 2(%sp)
	flw	%f0, 7(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 8(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 9(%sp)
	fsw	%f0, 3(%v0)
bnei_cont.8280:
	flw	%f0, 6(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	fiszero.2599
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.8281
	j	bnei_cont.8282
bnei_else.8281:
	flw	%f0, 477(%zero)
	flw	%f1, 6(%sp)
	fdiv	%f0, %f0, %f1
	lw	%v0, 2(%sp)
	fsw	%f0, 4(%v0)
bnei_cont.8282:
	lw	%v0, 2(%sp)
	jr	%ra
iter_setup_dirvec_constants.2870:
	blti	%v1, 0, bgti_else.8283
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	d_const.2746
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	d_vec.2744
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_form.2685
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 1, bnei_else.8284
	beqi	%v0, 2, bnei_else.8286
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_second_table.2867
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.8287
bnei_else.8286:
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_surface_table.2864
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.8287:
	j	bnei_cont.8285
bnei_else.8284:
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_rect_table.2861
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.8285:
	addi	%v1, %v1, -1
	lw	%v0, 2(%sp)
	j	iter_setup_dirvec_constants.2870
bgti_else.8283:
	jr	%ra
setup_dirvec_constants.2873:
	addi	%v1, %zero, 0
	lw	%v1, 0(%zero)
	addi	%v1, %v1, -1
	j	iter_setup_dirvec_constants.2870
setup_startp_constants.2875:
	blti	%v1, 0, bgti_else.8289
	addi	%a0, %zero, 12
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_param_ctbl.2723
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_form.2685
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 2(%sp)
	sw	%v0, 4(%sp)
	fsw	%f0, 5(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_x.2701
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 1(%v1)
	lw	%a0, 2(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_y.2703
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 1(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 2(%v1)
	lw	%a0, 2(%sp)
	fsw	%f0, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_z.2705
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 4(%sp)
	beqi	%v1, 2, bnei_else.8290
	addi	%at, %zero, 2
	blt	%at, %v1, bgt_else.8292
	j	bgt_cont.8293
bgt_else.8292:
	flw	%f0, 0(%v0)
	flw	%f1, 1(%v0)
	flw	%f2, 2(%v0)
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	quadratic.2798
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 4(%sp)
	beqi	%v0, 3, bnei_else.8294
	j	bnei_cont.8295
bnei_else.8294:
	flw	%f1, 477(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.8295:
	lw	%v0, 3(%sp)
	fsw	%f0, 3(%v0)
bgt_cont.8293:
	j	bnei_cont.8291
bnei_else.8290:
	lw	%v1, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_abc.2699
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 3(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	veciprod2.2661
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 3(%v0)
bnei_cont.8291:
	lw	%v0, 0(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	setup_startp_constants.2875
bgti_else.8289:
	jr	%ra
setup_startp.2878:
	addi	%v1, %zero, 162
	sw	%v0, 0(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	veccpy.2647
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 0
	lw	%v0, 0(%zero)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	setup_startp_constants.2875
is_rect_outside.2880:
	fabs	%f0, %f0
	fsw	%f2, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_a.2693
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	fmov	%f1, %f0
	flw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.8297
	flw	%f0, 2(%sp)
	fabs	%f0, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_b.2695
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	fmov	%f1, %f0
	flw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.8299
	flw	%f0, 0(%sp)
	fabs	%f0, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2697
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	fmov	%f1, %f0
	flw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2592
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.8300
bnei_else.8299:
	addi	%v0, %zero, 0
bnei_cont.8300:
	j	bnei_cont.8298
bnei_else.8297:
	addi	%v0, %zero, 0
bnei_cont.8298:
	beqi	%v0, 0, bnei_else.8301
	lw	%v0, 1(%sp)
	j	o_isinvert.2689
bnei_else.8301:
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2689
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.8302
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8302:
	addi	%v0, %zero, 1
	jr	%ra
is_plane_outside.2885:
	sw	%v0, 0(%sp)
	fsw	%f2, 1(%sp)
	fsw	%f1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_abc.2699
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f0, 3(%sp)
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	veciprod2.2661
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2689
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f0, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fisneg.2597
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	xor.2601
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.8303
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8303:
	addi	%v0, %zero, 1
	jr	%ra
is_second_outside.2890:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	quadratic.2798
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2685
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 3, bnei_else.8304
	flw	%f0, 1(%sp)
	j	bnei_cont.8305
bnei_else.8304:
	flw	%f0, 477(%zero)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
bnei_cont.8305:
	lw	%v0, 0(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_isinvert.2689
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fisneg.2597
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	xor.2601
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.8306
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8306:
	addi	%v0, %zero, 1
	jr	%ra
is_outside.2895:
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v0, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2701
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_y.2703
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_z.2705
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 0(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_form.2685
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 1, bnei_else.8307
	beqi	%v0, 2, bnei_else.8308
	flw	%f0, 4(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 2(%sp)
	j	is_second_outside.2890
bnei_else.8308:
	flw	%f0, 4(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 2(%sp)
	j	is_plane_outside.2885
bnei_else.8307:
	flw	%f0, 4(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 2(%sp)
	j	is_rect_outside.2880
check_all_inside.2900:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.8309
	addi	%a1, %zero, 12
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	is_outside.2895
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.8310
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8310:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2900
bnei_else.8309:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2906:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.8311
	addi	%a1, %zero, 138
	addi	%a2, %zero, 247
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_fast.2840
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 135
	flw	%f0, 135(%zero)
	sw	%v1, 3(%sp)
	fsw	%f0, 4(%sp)
	beqi	%v0, 0, bnei_else.8312
	flw	%f1, 457(%zero)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.8313
bnei_else.8312:
	addi	%v0, %zero, 0
bnei_cont.8313:
	beqi	%v0, 0, bnei_else.8314
	flw	%f0, 456(%zero)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 78
	flw	%f1, 78(%zero)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 138
	flw	%f2, 138(%zero)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 78
	flw	%f2, 79(%zero)
	fmul	%f2, %f2, %f0
	addi	%v0, %zero, 138
	flw	%f3, 139(%zero)
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 78
	flw	%f3, 80(%zero)
	fmul	%f0, %f3, %f0
	addi	%v0, %zero, 138
	flw	%f3, 140(%zero)
	fadd	%f0, %f0, %f3
	lw	%v0, 3(%sp)
	lw	%v1, 0(%sp)
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	check_all_inside.2900
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.8315
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8315:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2906
bnei_else.8314:
	addi	%v0, %zero, 12
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2689
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.8316
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2906
bnei_else.8316:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.8311:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2909:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.8317
	addi	%a1, %zero, 83
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	shadow_check_and_group.2906
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.8318
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8318:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_one_or_group.2909
bnei_else.8317:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2912:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.8319
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a1, 99, bnei_else.8320
	addi	%a2, %zero, 138
	addi	%a3, %zero, 247
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solver_fast.2840
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.8322
	addi	%v0, %zero, 135
	flw	%f0, 135(%zero)
	flw	%f1, 455(%zero)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fless.2592
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.8324
	addi	%v0, %zero, 1
	lw	%v1, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.8326
	addi	%v0, %zero, 1
	j	bnei_cont.8327
bnei_else.8326:
	addi	%v0, %zero, 0
bnei_cont.8327:
	j	bnei_cont.8325
bnei_else.8324:
	addi	%v0, %zero, 0
bnei_cont.8325:
	j	bnei_cont.8323
bnei_else.8322:
	addi	%v0, %zero, 0
bnei_cont.8323:
	j	bnei_cont.8321
bnei_else.8320:
	addi	%v0, %zero, 1
bnei_cont.8321:
	beqi	%v0, 0, bnei_else.8328
	addi	%v0, %zero, 1
	lw	%v1, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_one_or_group.2909
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.8329
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.8329:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.8328:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_matrix.2912
bnei_else.8319:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2915:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.8330
	addi	%a2, %zero, 159
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver.2817
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 0
	beqi	%v0, 0, bnei_else.8331
	addi	%a0, %zero, 135
	flw	%f1, 135(%zero)
	flw	%f0, 482(%zero)
	sw	%v0, 4(%sp)
	sw	%v1, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.8332
	addi	%v0, %zero, 137
	flw	%f1, 137(%zero)
	flw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.8334
	flw	%f0, 456(%zero)
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 159
	flw	%f2, 159(%zero)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	addi	%v1, %zero, 159
	flw	%f3, 160(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v0)
	fmul	%f3, %f3, %f0
	addi	%v1, %zero, 159
	flw	%f4, 161(%zero)
	fadd	%f3, %f3, %f4
	lw	%v1, 5(%sp)
	lw	%a0, 1(%sp)
	fsw	%f3, 7(%sp)
	fsw	%f2, 8(%sp)
	fsw	%f1, 9(%sp)
	fsw	%f0, 10(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	check_all_inside.2900
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.8336
	addi	%v0, %zero, 137
	flw	%f0, 10(%sp)
	fsw	%f0, 137(%zero)
	addi	%v0, %zero, 138
	flw	%f0, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 7(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	vecset.2637
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 141
	lw	%v0, 3(%sp)
	sw	%v0, 141(%zero)
	addi	%v0, %zero, 136
	lw	%v0, 4(%sp)
	sw	%v0, 136(%zero)
	j	bnei_cont.8337
bnei_else.8336:
bnei_cont.8337:
	j	bnei_cont.8335
bnei_else.8334:
bnei_cont.8335:
	j	bnei_cont.8333
bnei_else.8332:
bnei_cont.8333:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
bnei_else.8331:
	addi	%v0, %zero, 12
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_isinvert.2689
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, 0, bnei_else.8338
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
bnei_else.8338:
	jr	%ra
bnei_else.8330:
	jr	%ra
solve_one_or_network.2919:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.8341
	addi	%a2, %zero, 83
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_each_element.2915
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.2919
bnei_else.8341:
	jr	%ra
trace_or_matrix.2923:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.8343
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 99, bnei_else.8344
	addi	%a3, %zero, 159
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	addi	%a0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver.2817
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.8346
	addi	%v0, %zero, 135
	flw	%f0, 135(%zero)
	addi	%v0, %zero, 137
	flw	%f1, 137(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.8348
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.8349
bnei_else.8348:
bnei_cont.8349:
	j	bnei_cont.8347
bnei_else.8346:
bnei_cont.8347:
	j	bnei_cont.8345
bnei_else.8344:
	addi	%a2, %zero, 1
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.8345:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2923
bnei_else.8343:
	jr	%ra
judge_intersection.2927:
	addi	%v1, %zero, 0
	flw	%f0, 454(%zero)
	addi	%a0, %zero, 137
	fsw	%f0, 137(%zero)
	addi	%a0, %zero, 134
	lw	%a0, 134(%zero)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	trace_or_matrix.2923
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 137
	flw	%f1, 137(%zero)
	flw	%f0, 455(%zero)
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.8351
	flw	%f1, 453(%zero)
	flw	%f0, 0(%sp)
	j	fless.2592
bnei_else.8351:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element_fast.2929:
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	d_vec.2744
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.8352
	lw	%a2, 0(%sp)
	sw	%v0, 3(%sp)
	sw	%a1, 4(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_fast2.2858
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %zero, 0
	beqi	%v0, 0, bnei_else.8353
	addi	%a0, %zero, 135
	flw	%f1, 135(%zero)
	flw	%f0, 482(%zero)
	sw	%v0, 5(%sp)
	sw	%v1, 6(%sp)
	fsw	%f1, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fless.2592
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.8354
	addi	%v0, %zero, 137
	flw	%f1, 137(%zero)
	flw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fless.2592
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.8356
	flw	%f0, 456(%zero)
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 162
	flw	%f2, 162(%zero)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	addi	%v1, %zero, 162
	flw	%f3, 163(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v0)
	fmul	%f3, %f3, %f0
	addi	%v0, %zero, 162
	flw	%f4, 164(%zero)
	fadd	%f3, %f3, %f4
	lw	%v0, 6(%sp)
	lw	%v1, 2(%sp)
	fsw	%f3, 8(%sp)
	fsw	%f2, 9(%sp)
	fsw	%f1, 10(%sp)
	fsw	%f0, 11(%sp)
	fmov	%f0, %f1
	fmov	%f1, %f2
	fmov	%f2, %f3
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	check_all_inside.2900
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.8358
	addi	%v0, %zero, 137
	flw	%f0, 11(%sp)
	fsw	%f0, 137(%zero)
	addi	%v0, %zero, 138
	flw	%f0, 10(%sp)
	flw	%f1, 9(%sp)
	flw	%f2, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	vecset.2637
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 141
	lw	%v0, 4(%sp)
	sw	%v0, 141(%zero)
	addi	%v0, %zero, 136
	lw	%v0, 5(%sp)
	sw	%v0, 136(%zero)
	j	bnei_cont.8359
bnei_else.8358:
bnei_cont.8359:
	j	bnei_cont.8357
bnei_else.8356:
bnei_cont.8357:
	j	bnei_cont.8355
bnei_else.8354:
bnei_cont.8355:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.2929
bnei_else.8353:
	addi	%v0, %zero, 12
	lw	%v1, 4(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_isinvert.2689
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.8360
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.2929
bnei_else.8360:
	jr	%ra
bnei_else.8352:
	jr	%ra
solve_one_or_network_fast.2933:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.8363
	addi	%a2, %zero, 83
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2929
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.2933
bnei_else.8363:
	jr	%ra
trace_or_matrix_fast.2937:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	beqi	%a2, -1, bnei_else.8365
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 99, bnei_else.8366
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_fast2.2858
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.8368
	addi	%v0, %zero, 135
	flw	%f0, 135(%zero)
	addi	%v0, %zero, 137
	flw	%f1, 137(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.8370
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.8371
bnei_else.8370:
bnei_cont.8371:
	j	bnei_cont.8369
bnei_else.8368:
bnei_cont.8369:
	j	bnei_cont.8367
bnei_else.8366:
	addi	%a2, %zero, 1
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.8367:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2937
bnei_else.8365:
	jr	%ra
judge_intersection_fast.2941:
	addi	%v1, %zero, 0
	flw	%f0, 454(%zero)
	addi	%a0, %zero, 137
	fsw	%f0, 137(%zero)
	addi	%a0, %zero, 134
	lw	%a0, 134(%zero)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 137
	flw	%f1, 137(%zero)
	flw	%f0, 455(%zero)
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.8373
	flw	%f1, 453(%zero)
	flw	%f0, 0(%sp)
	j	fless.2592
bnei_else.8373:
	addi	%v0, %zero, 0
	jr	%ra
get_nvector_rect.2943:
	addi	%v1, %zero, 136
	lw	%v1, 136(%zero)
	addi	%a0, %zero, 142
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	vecbzero.2645
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 0(%sp)
	add	%at, %v1, %v0
	flw	%f0, 0(%at)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sgn.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 142
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	fsw	%f0, 0(%at)
	jr	%ra
get_nvector_plane.2945:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	o_param_a.2693
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 142
	fsw	%f0, 142(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	o_param_b.2695
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 142
	fsw	%f0, 143(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	o_param_c.2697
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 142
	fsw	%f0, 144(%zero)
	jr	%ra
get_nvector_second.2947:
	addi	%v1, %zero, 138
	flw	%f0, 138(%zero)
	sw	%v0, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_param_x.2701
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 138
	flw	%f1, 139(%zero)
	lw	%v0, 0(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_y.2703
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 138
	flw	%f1, 140(%zero)
	lw	%v0, 0(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_z.2705
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_a.2693
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2695
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2691
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	beqi	%v0, 0, bnei_else.8376
	lw	%v0, 0(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_param_r3.2721
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 4(%sp)
	fmul	%f2, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 10(%sp)
	fsw	%f2, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_r2.2719
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 6(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 11(%sp)
	fadd	%f2, %f3, %f2
	fsw	%f0, 12(%sp)
	fmov	%f0, %f2
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fhalf.2604
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 142
	fsw	%f0, 142(%zero)
	flw	%f0, 10(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	o_param_r1.2717
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 6(%sp)
	fmul	%f1, %f1, %f0
	flw	%f2, 13(%sp)
	fadd	%f1, %f2, %f1
	fsw	%f0, 14(%sp)
	fmov	%f0, %f1
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fhalf.2604
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 142
	fsw	%f0, 143(%zero)
	flw	%f0, 12(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 14(%sp)
	flw	%f2, 4(%sp)
	fmul	%f1, %f2, %f1
	fadd	%f0, %f0, %f1
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fhalf.2604
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 9(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 142
	fsw	%f0, 144(%zero)
	j	bnei_cont.8377
bnei_else.8376:
	addi	%v0, %zero, 142
	flw	%f0, 7(%sp)
	fsw	%f0, 142(%zero)
	addi	%v0, %zero, 142
	flw	%f0, 8(%sp)
	fsw	%f0, 143(%zero)
	addi	%v0, %zero, 142
	flw	%f0, 9(%sp)
	fsw	%f0, 144(%zero)
bnei_cont.8377:
	lw	%v0, 0(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_isinvert.2689
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 142
	j	vecunit_sgn.2655
get_nvector.2949:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2685
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 1, bnei_else.8378
	beqi	%v0, 2, bnei_else.8379
	lw	%v0, 0(%sp)
	j	get_nvector_second.2947
bnei_else.8379:
	lw	%v0, 0(%sp)
	j	get_nvector_plane.2945
bnei_else.8378:
	lw	%v0, 1(%sp)
	j	get_nvector_rect.2943
utexture.2952:
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_texturetype.2683
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_color_red.2711
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 145
	fsw	%f0, 145(%zero)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_color_green.2713
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 145
	fsw	%f0, 146(%zero)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_color_blue.2715
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 145
	fsw	%f0, 147(%zero)
	lw	%v0, 2(%sp)
	beqi	%v0, 1, bnei_else.8380
	beqi	%v0, 2, bnei_else.8381
	beqi	%v0, 3, bnei_else.8382
	beqi	%v0, 4, bnei_else.8383
	jr	%ra
bnei_else.8383:
	lw	%v0, 0(%sp)
	flw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_x.2701
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2693
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 2(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_z.2705
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_c.2697
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 7(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fsw	%f0, 8(%sp)
	fmov	%f0, %f1
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fsqr.2606
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsw	%f0, 9(%sp)
	fmov	%f0, %f1
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fsqr.2606
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fabs	%f2, %f1
	flw	%f3, 452(%zero)
	fsw	%f3, 10(%sp)
	fsw	%f0, 11(%sp)
	fmov	%f1, %f3
	fmov	%f0, %f2
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fless.2592
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.8385
	flw	%f0, 451(%zero)
	j	bnei_cont.8386
bnei_else.8385:
	flw	%f0, 5(%sp)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	atan.2620
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 450(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.8386:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	lw	%v0, 0(%sp)
	flw	%f1, 1(%v0)
	lw	%v0, 1(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f1, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	o_param_y.2703
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_param_b.2695
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 11(%sp)
	fabs	%f2, %f1
	flw	%f3, 10(%sp)
	fsw	%f0, 15(%sp)
	fmov	%f1, %f3
	fmov	%f0, %f2
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	fless.2592
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	beqi	%v0, 0, bnei_else.8387
	flw	%f0, 451(%zero)
	j	bnei_cont.8388
bnei_else.8387:
	flw	%f0, 11(%sp)
	flw	%f1, 15(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	atan.2620
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 450(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.8388:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 448(%zero)
	flw	%f2, 481(%zero)
	flw	%f3, 12(%sp)
	fsub	%f3, %f2, %f3
	fsw	%f0, 16(%sp)
	fsw	%f2, 17(%sp)
	fsw	%f1, 18(%sp)
	fmov	%f0, %f3
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fsqr.2606
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 18(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 16(%sp)
	flw	%f2, 17(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 19(%sp)
	fmov	%f0, %f1
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	fsqr.2606
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 19(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 20(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	fisneg.2597
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	beqi	%v0, 0, bnei_else.8389
	flw	%f0, 482(%zero)
	j	bnei_cont.8390
bnei_else.8389:
	flw	%f0, 20(%sp)
bnei_cont.8390:
	flw	%f1, 447(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 446(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.8382:
	lw	%v0, 0(%sp)
	flw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 21(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	o_param_x.2701
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 21(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 2(%v0)
	lw	%v0, 1(%sp)
	fsw	%f0, 22(%sp)
	fsw	%f1, 23(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	o_param_z.2705
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f1, 23(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 22(%sp)
	fsw	%f0, 24(%sp)
	fmov	%f0, %f1
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	fsqr.2606
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f1, 24(%sp)
	fsw	%f0, 25(%sp)
	fmov	%f0, %f1
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f1, 25(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	flw	%f1, 445(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 449(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	cos.2616
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f1, 447(%zero)
	fmul	%f2, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f2, 146(%zero)
	flw	%f2, 477(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 145
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.8381:
	lw	%v0, 0(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 444(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	sin.2618
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f1, 447(%zero)
	fmul	%f2, %f1, %f0
	addi	%v0, %zero, 145
	fsw	%f2, 145(%zero)
	flw	%f2, 477(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 145
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.8380:
	lw	%v0, 0(%sp)
	flw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 26(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	o_param_x.2701
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f1, 26(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 443(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 442(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 445(%zero)
	fsw	%f2, 27(%sp)
	fsw	%f3, 28(%sp)
	fsw	%f1, 29(%sp)
	fmov	%f1, %f2
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	fless.2592
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 0(%sp)
	flw	%f0, 2(%v1)
	lw	%v1, 1(%sp)
	sw	%v0, 30(%sp)
	fsw	%f0, 31(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	o_param_z.2705
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	flw	%f1, 31(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 29(%sp)
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	flw	%f2, 28(%sp)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	flw	%f1, 27(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	fless.2592
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v1, 30(%sp)
	beqi	%v1, 0, bnei_else.8394
	beqi	%v0, 0, bnei_else.8396
	flw	%f0, 447(%zero)
	j	bnei_cont.8397
bnei_else.8396:
	flw	%f0, 482(%zero)
bnei_cont.8397:
	j	bnei_cont.8395
bnei_else.8394:
	beqi	%v0, 0, bnei_else.8398
	flw	%f0, 482(%zero)
	j	bnei_cont.8399
bnei_else.8398:
	flw	%f0, 447(%zero)
bnei_cont.8399:
bnei_cont.8395:
	addi	%v0, %zero, 145
	fsw	%f0, 146(%zero)
	jr	%ra
add_light.2955:
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2595
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.8401
	addi	%v1, %zero, 145
	addi	%v0, %zero, 151
	flw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	vecaccum.2666
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.8402
bnei_else.8401:
bnei_cont.8402:
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2595
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.8403
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fsqr.2606
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fsqr.2606
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 151
	flw	%f1, 151(%zero)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f1, 151(%zero)
	addi	%v0, %zero, 151
	flw	%f1, 152(%zero)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f1, 152(%zero)
	addi	%v0, %zero, 151
	flw	%f1, 153(%zero)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.8403:
	jr	%ra
trace_reflections.2959:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.8406
	addi	%a1, %zero, 254
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%v1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%a1, 5(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	r_dvec.2750
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.8407
	addi	%v0, %zero, 141
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 136
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 5(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	r_surface_id.2748
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 7(%sp)
	bne	%v1, %v0, beq_else.8409
	addi	%v0, %zero, 134
	lw	%v1, 134(%zero)
	lw	%v0, 4(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.8411
	j	bnei_cont.8412
bnei_else.8411:
	lw	%v0, 6(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	d_vec.2744
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 142
	sw	%v1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veciprod.2658
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 5(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	r_bright.2752
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 3(%sp)
	fmul	%f2, %f0, %f1
	flw	%f3, 9(%sp)
	fmul	%f2, %f2, %f3
	lw	%v0, 2(%sp)
	lw	%v1, 8(%sp)
	fsw	%f2, 10(%sp)
	fsw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	veciprod.2658
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 10(%sp)
	flw	%f2, 1(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	add_light.2955
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.8412:
	j	beq_cont.8410
beq_else.8409:
beq_cont.8410:
	j	bnei_cont.8408
bnei_else.8407:
bnei_cont.8408:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2959
bgti_else.8406:
	jr	%ra
trace_ray.2964:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.8414
	fsw	%f1, 0(%sp)
	sw	%a0, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	p_surface_ids.2729
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	judge_intersection.2927
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 0
	beqi	%v0, 0, bnei_else.8415
	addi	%v0, %zero, 141
	lw	%v0, 141(%zero)
	addi	%a0, %zero, 12
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_reflectiontype.2687
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_diffuse.2707
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 2(%sp)
	fmul	%f2, %f0, %f1
	lw	%v0, 8(%sp)
	lw	%v1, 4(%sp)
	fsw	%f2, 10(%sp)
	fsw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	get_nvector.2949
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 138
	addi	%v0, %zero, 159
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	veccpy.2647
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 138
	lw	%v0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	utexture.2952
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 7(%sp)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 136
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 3(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 1(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	p_intersection_points.2727
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 138
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	veccpy.2647
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 481(%zero)
	flw	%f0, 11(%sp)
	sw	%v0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fless.2592
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.8416
	lw	%v0, 3(%sp)
	lw	%v1, 12(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v1, %v0
	sw	%a0, 0(%at)
	j	bnei_cont.8417
bnei_else.8416:
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	lw	%a0, 12(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 1(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	p_energy.2733
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 145
	sw	%v0, 13(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	veccpy.2647
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f0, 441(%zero)
	flw	%f1, 10(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	vecscale.2676
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	p_nvectors.2742
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 142
	addi	%v1, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	veccpy.2647
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
bnei_cont.8417:
	flw	%f0, 440(%zero)
	addi	%v1, %zero, 142
	lw	%v0, 4(%sp)
	fsw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	veciprod.2658
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 142
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	vecaccum.2666
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 8(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_hilight.2709
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 134
	lw	%v1, 134(%zero)
	lw	%v0, 6(%sp)
	fsw	%f0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	beqi	%v0, 0, bnei_else.8418
	j	bnei_cont.8419
bnei_else.8418:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	veciprod.2658
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	fneg	%f0, %f0
	flw	%f1, 10(%sp)
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 78
	lw	%v0, 4(%sp)
	fsw	%f0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	veciprod.2658
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	fneg	%f1, %f0
	flw	%f0, 16(%sp)
	flw	%f2, 15(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	add_light.2955
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
bnei_cont.8419:
	addi	%v0, %zero, 138
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_startp.2878
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	addi	%v0, %zero, 434
	lw	%v0, 434(%zero)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 15(%sp)
	lw	%v1, 4(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	trace_reflections.2959
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f0, 439(%zero)
	flw	%f1, 2(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	fless.2592
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	beqi	%v0, 0, bnei_else.8420
	lw	%v0, 3(%sp)
	blti	%v0, 4, bgti_else.8421
	j	bgti_cont.8422
bgti_else.8421:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 5(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.8422:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.8423
	jr	%ra
bnei_else.8423:
	flw	%f0, 477(%zero)
	flw	%f1, 11(%sp)
	fsub	%f0, %f0, %f1
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %v0, 1
	addi	%v1, %zero, 137
	flw	%f1, 137(%zero)
	flw	%f2, 0(%sp)
	fadd	%f1, %f2, %f1
	lw	%v1, 4(%sp)
	lw	%a0, 1(%sp)
	j	trace_ray.2964
bnei_else.8420:
	jr	%ra
bnei_else.8415:
	addi	%v0, %zero, -1
	lw	%v1, 3(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.8426
	addi	%v1, %zero, 78
	lw	%v0, 4(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	veciprod.2658
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	fneg	%f0, %f0
	fsw	%f0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fispos.2595
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	beqi	%v0, 0, bnei_else.8427
	flw	%f0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fsqr.2606
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 2(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 81
	flw	%f1, 81(%zero)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 151
	flw	%f1, 151(%zero)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f1, 151(%zero)
	addi	%v0, %zero, 151
	flw	%f1, 152(%zero)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f1, 152(%zero)
	addi	%v0, %zero, 151
	flw	%f1, 153(%zero)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 151
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.8427:
	jr	%ra
bnei_else.8426:
	jr	%ra
bgt_else.8414:
	jr	%ra
trace_diffuse_ray.2970:
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, 0
	beqi	%v0, 0, bnei_else.8432
	addi	%v0, %zero, 141
	lw	%v0, 141(%zero)
	addi	%a0, %zero, 12
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	lw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	d_vec.2744
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	get_nvector.2949
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 138
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	utexture.2952
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 134
	lw	%v1, 134(%zero)
	lw	%v0, 2(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_matrix.2912
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.8433
	jr	%ra
bnei_else.8433:
	addi	%v1, %zero, 78
	addi	%v0, %zero, 142
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	veciprod.2658
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	fneg	%f0, %f0
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fispos.2595
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.8435
	flw	%f0, 4(%sp)
	j	bnei_cont.8436
bnei_else.8435:
	flw	%f0, 482(%zero)
bnei_cont.8436:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_diffuse.2707
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 145
	addi	%v0, %zero, 148
	j	vecaccum.2666
bnei_else.8432:
	jr	%ra
iter_trace_diffuse_rays.2973:
	blti	%a1, 0, bgti_else.8438
	add	%at, %v0, %a1
	lw	%a2, 0(%at)
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a2, 3(%sp)
	sw	%v1, 4(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	d_vec.2744
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2658
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fisneg.2597
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.8439
	lw	%v0, 2(%sp)
	addi	%v1, %v0, 1
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	flw	%f0, 438(%zero)
	flw	%f1, 5(%sp)
	fdiv	%f0, %f1, %f0
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.8440
bnei_else.8439:
	flw	%f0, 437(%zero)
	flw	%f1, 5(%sp)
	fdiv	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2970
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.8440:
	lw	%v0, 2(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 1(%sp)
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
bgti_else.8438:
	jr	%ra
trace_diffuse_rays.2978:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	setup_startp.2878
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2973
trace_diffuse_ray_80percent.2982:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%v0, 0, bnei_else.8442
	addi	%a1, %zero, 179
	lw	%a1, 179(%zero)
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.8443
bnei_else.8442:
bnei_cont.8443:
	lw	%v0, 2(%sp)
	beqi	%v0, 1, bnei_else.8444
	addi	%v1, %zero, 179
	lw	%v1, 180(%zero)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.8445
bnei_else.8444:
bnei_cont.8445:
	lw	%v0, 2(%sp)
	beqi	%v0, 2, bnei_else.8446
	addi	%v1, %zero, 179
	lw	%v1, 181(%zero)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.8447
bnei_else.8446:
bnei_cont.8447:
	lw	%v0, 2(%sp)
	beqi	%v0, 3, bnei_else.8448
	addi	%v1, %zero, 179
	lw	%v1, 182(%zero)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	bnei_cont.8449
bnei_else.8448:
bnei_cont.8449:
	lw	%v0, 2(%sp)
	beqi	%v0, 4, bnei_else.8450
	addi	%v0, %zero, 179
	lw	%v0, 183(%zero)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_diffuse_rays.2978
bnei_else.8450:
	jr	%ra
calc_diffuse_using_1point.2986:
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	p_nvectors.2742
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_intersection_points.2727
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	p_energy.2733
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 148
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	veccpy.2647
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_group_id.2737
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 4(%sp)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray_80percent.2982
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 5(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	j	vecaccumv.2679
calc_diffuse_using_5points.2989:
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	addi	%a0, %v1, -1
	lw	%a1, 2(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	lw	%a1, 0(%at)
	sw	%a1, 5(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	lw	%a1, 2(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	sw	%v0, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 148
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	veccpy.2647
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	vecadd.2670
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 7(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	vecadd.2670
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 8(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	vecadd.2670
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 9(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	vecadd.2670
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 5(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	p_energy.2733
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 148
	addi	%v0, %zero, 151
	j	vecaccumv.2679
do_without_neighbors.2995:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.8452
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	p_surface_ids.2729
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.8453
	lw	%v0, 0(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	beqi	%v0, 0, bnei_else.8454
	lw	%v0, 0(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	calc_diffuse_using_1point.2986
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	bnei_cont.8455
bnei_else.8454:
bnei_cont.8455:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.2995
bgti_else.8453:
	jr	%ra
bgt_else.8452:
	jr	%ra
neighbors_exist.2998:
	addi	%a0, %zero, 154
	lw	%a0, 155(%zero)
	addi	%a1, %v1, 1
	blt	%a1, %a0, bgt_else.8458
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.8458:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.8459
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.8459:
	addi	%v1, %zero, 154
	lw	%v1, 154(%zero)
	addi	%a0, %v0, 1
	blt	%a0, %v1, bgt_else.8460
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.8460:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.8461
	addi	%v0, %zero, 0
	jr	%ra
bgt_else.8461:
	addi	%v0, %zero, 1
	jr	%ra
get_surface_id.3002:
	sw	%v1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	p_surface_ids.2729
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	jr	%ra
neighbors_are_available.3005:
	add	%at, %a0, %v0
	lw	%a3, 0(%at)
	sw	%a0, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	get_surface_id.3002
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 2(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	bne	%v0, %v1, beq_else.8462
	lw	%v0, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	lw	%a1, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	bne	%v0, %v1, beq_else.8463
	lw	%v0, 3(%sp)
	addi	%a0, %v0, -1
	lw	%a1, 0(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a2, 2(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	bne	%v0, %v1, beq_else.8464
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %v0
	lw	%v0, 0(%at)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	get_surface_id.3002
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	bne	%v0, %v1, beq_else.8465
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8465:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8464:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8463:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8462:
	addi	%v0, %zero, 0
	jr	%ra
try_exploit_neighbors.3011:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.8466
	sw	%v1, 0(%sp)
	sw	%t0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a2, 3(%sp)
	sw	%a1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	get_surface_id.3002
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	blti	%v0, 0, bgti_else.8467
	lw	%v0, 6(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 2(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	neighbors_are_available.3005
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.8468
	lw	%v0, 1(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%a2, 2(%sp)
	add	%at, %v0, %a2
	lw	%v0, 0(%at)
	beqi	%v0, 0, bnei_else.8469
	lw	%v0, 6(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.8470
bnei_else.8469:
bnei_cont.8470:
	lw	%v0, 2(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 6(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 3(%sp)
	j	try_exploit_neighbors.3011
bnei_else.8468:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
	j	do_without_neighbors.2995
bgti_else.8467:
	jr	%ra
bgt_else.8466:
	jr	%ra
write_ppm_header.3018:
	addi	%v0, %zero, 80
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 51
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 154
	lw	%v0, 154(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int.2627
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 32
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_print_char
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 154
	lw	%v0, 155(%zero)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int.2627
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_print_char
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 255
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int.2627
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	j	min_caml_print_char
write_rgb_element.3020:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.8473
	blti	%v0, 0, bgti_else.8475
	j	bgti_cont.8476
bgti_else.8475:
	addi	%v0, %zero, 0
bgti_cont.8476:
	j	bgt_cont.8474
bgt_else.8473:
	addi	%v0, %zero, 255
bgt_cont.8474:
	j	print_int.2627
write_rgb.3022:
	addi	%v0, %zero, 151
	flw	%f0, 151(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	write_rgb_element.3020
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
	flw	%f0, 152(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	write_rgb_element.3020
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_print_char
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 151
	flw	%f0, 153(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	write_rgb_element.3020
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3024:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.8477
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	get_surface_id.3002
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	blti	%v0, 0, bgti_else.8478
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	beqi	%v0, 0, bnei_else.8479
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	p_group_id.2737
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, 148
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	vecbzero.2645
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	p_nvectors.2742
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_intersection_points.2727
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 179
	lw	%a0, 2(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	lw	%a0, 0(%sp)
	lw	%a1, 3(%sp)
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	trace_diffuse_rays.2978
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 148
	addi	%v1, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	veccpy.2647
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	j	bnei_cont.8480
bnei_else.8479:
bnei_cont.8480:
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	j	pretrace_diffuse_rays.3024
bgti_else.8478:
	jr	%ra
bgt_else.8477:
	jr	%ra
pretrace_pixels.3027:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.8483
	addi	%a2, %zero, 158
	flw	%f3, 158(%zero)
	addi	%a2, %zero, 156
	lw	%a2, 156(%zero)
	sub	%a2, %v1, %a2
	itof	%f4, %a2
	fmul	%f3, %f3, %f4
	addi	%a2, %zero, 165
	flw	%f4, 165(%zero)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	addi	%a2, %zero, 174
	fsw	%f4, 174(%zero)
	addi	%a2, %zero, 1
	addi	%a3, %zero, 165
	flw	%f4, 166(%zero)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	addi	%a3, %zero, 174
	fsw	%f4, 175(%zero)
	addi	%a3, %zero, 165
	flw	%f4, 167(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f3, %f2
	addi	%a3, %zero, 174
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
	addi	%v0, %zero, 151
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	vecbzero.2645
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %zero, 75
	addi	%v0, %zero, 159
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	veccpy.2647
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 477(%zero)
	lw	%v0, 6(%sp)
	lw	%v1, 7(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	flw	%f1, 482(%zero)
	addi	%a1, %zero, 174
	lw	%a2, 5(%sp)
	sw	%a0, 8(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_ray.2964
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	p_rgb.2725
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 151
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veccpy.2647
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	p_set_group_id.2739
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	pretrace_diffuse_rays.3024
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	add_mod5.2634
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%a0, %v0, 0
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 9(%sp)
	j	pretrace_pixels.3027
bgti_else.8483:
	jr	%ra
pretrace_line.3034:
	addi	%a1, %zero, 158
	flw	%f0, 158(%zero)
	addi	%a1, %zero, 156
	lw	%a1, 157(%zero)
	sub	%v1, %v1, %a1
	itof	%f1, %v1
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 168
	flw	%f1, 168(%zero)
	fmul	%f1, %f0, %f1
	addi	%v1, %zero, 171
	flw	%f2, 171(%zero)
	fadd	%f1, %f1, %f2
	addi	%v1, %zero, 168
	flw	%f2, 169(%zero)
	fmul	%f2, %f0, %f2
	addi	%v1, %zero, 171
	flw	%f3, 172(%zero)
	fadd	%f2, %f2, %f3
	addi	%v1, %zero, 168
	flw	%f3, 170(%zero)
	fmul	%f0, %f0, %f3
	addi	%v1, %zero, 171
	flw	%f3, 173(%zero)
	fadd	%f0, %f0, %f3
	addi	%v1, %zero, 154
	lw	%v1, 154(%zero)
	addi	%v1, %v1, -1
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	j	pretrace_pixels.3027
scan_pixel.3038:
	addi	%a3, %zero, 0
	addi	%t0, %zero, 154
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.8485
	jr	%ra
bgt_else.8485:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%v1, 5(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %t0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	p_rgb.2725
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 151
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	veccpy.2647
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	neighbors_exist.2998
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.8487
	lw	%v0, 6(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	lw	%a2, 4(%sp)
	lw	%a3, 2(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	try_exploit_neighbors.3011
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.8488
bnei_else.8487:
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	do_without_neighbors.2995
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
bnei_cont.8488:
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	write_rgb.3022
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 5(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	lw	%a2, 4(%sp)
	j	scan_pixel.3038
scan_line.3044:
	addi	%a3, %zero, 154
	lw	%a3, 155(%zero)
	blt	%v0, %a3, bgt_else.8489
	jr	%ra
bgt_else.8489:
	addi	%a3, %a3, -1
	sw	%a2, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	blt	%v0, %a3, bgt_else.8491
	j	bgt_cont.8492
bgt_else.8491:
	addi	%a3, %v0, 1
	addi	%a0, %a2, 0
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	pretrace_line.3034
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bgt_cont.8492:
	addi	%v0, %zero, 0
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a2, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	scan_pixel.3038
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, 2
	lw	%a0, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	add_mod5.2634
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%a2, %v0, 0
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 3(%sp)
	j	scan_line.3044
create_float5x3array.3050:
	addi	%v0, %zero, 3
	flw	%f0, 482(%zero)
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
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
	lw	%v1, 2(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %v1
	jr	%ra
create_pixel.3052:
	addi	%v0, %zero, 3
	flw	%f0, 482(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	create_float5x3array.3050
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	create_float5x3array.3050
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	create_float5x3array.3050
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 1
	lw	%a0, 2(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	create_float5x3array.3050
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 8(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 7(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 6(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 5(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 1(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 0(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	jr	%ra
init_line_elements.3054:
	blti	%v1, 0, bgti_else.8493
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_pixel.3052
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	init_line_elements.3054
bgti_else.8493:
	jr	%ra
create_pixelline.3057:
	addi	%v0, %zero, 154
	lw	%v0, 154(%zero)
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	create_pixel.3052
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%v1, %v1, -2
	j	init_line_elements.3054
tan.3059:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	sin.2618
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fmov	%f0, %f1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2616
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fdiv	%f0, %f1, %f0
	jr	%ra
adjust_position.3061:
	fmul	%f0, %f0, %f0
	flw	%f2, 439(%zero)
	fadd	%f0, %f0, %f2
	fsqrt	%f0, %f0
	flw	%f2, 477(%zero)
	fdiv	%f2, %f2, %f0
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fmov	%f0, %f2
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	atan.2620
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fmul	%f0, %f0, %f1
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	tan.3059
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	jr	%ra
calc_dirvec.3064:
	blti	%v0, 5, bgti_else.8494
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fsqr.2606
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsw	%f0, 4(%sp)
	fmov	%f0, %f1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fsqr.2606
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 477(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f2, 2(%sp)
	fdiv	%f2, %f2, %f0
	flw	%f3, 3(%sp)
	fdiv	%f3, %f3, %f0
	fdiv	%f0, %f1, %f0
	addi	%v0, %zero, 179
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 5(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f3, 7(%sp)
	fsw	%f2, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2744
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 6(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2637
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 40
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2744
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 7(%sp)
	fneg	%f2, %f0
	flw	%f1, 8(%sp)
	flw	%f3, 6(%sp)
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2637
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 80
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2744
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 8(%sp)
	fneg	%f1, %f0
	flw	%f2, 7(%sp)
	fneg	%f3, %f2
	flw	%f4, 6(%sp)
	fmov	%f2, %f3
	fmov	%f0, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2637
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 1
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2744
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 8(%sp)
	fneg	%f1, %f0
	flw	%f2, 7(%sp)
	fneg	%f3, %f2
	flw	%f4, 6(%sp)
	fneg	%f5, %f4
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2637
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 41
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2744
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 8(%sp)
	fneg	%f1, %f0
	flw	%f2, 6(%sp)
	fneg	%f3, %f2
	flw	%f4, 7(%sp)
	fmov	%f2, %f4
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecset.2637
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 81
	lw	%v1, 5(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2744
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f0, 6(%sp)
	fneg	%f0, %f0
	flw	%f1, 8(%sp)
	flw	%f2, 7(%sp)
	j	vecset.2637
bgti_else.8494:
	fsw	%f2, 9(%sp)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f3, 10(%sp)
	sw	%v0, 11(%sp)
	fmov	%f0, %f1
	fmov	%f1, %f2
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	adjust_position.3061
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, 1
	flw	%f1, 10(%sp)
	fsw	%f0, 12(%sp)
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	adjust_position.3061
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	fmov	%f1, %f0
	flw	%f0, 12(%sp)
	flw	%f2, 9(%sp)
	flw	%f3, 10(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	calc_dirvec.3064
calc_dirvecs.3072:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.8495
	itof	%f1, %v0
	flw	%f2, 473(%zero)
	fmul	%f1, %f1, %f2
	flw	%f3, 436(%zero)
	fsub	%f1, %f1, %f3
	flw	%f3, 482(%zero)
	fsw	%f0, 0(%sp)
	fsw	%f3, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a0, 4(%sp)
	fsw	%f2, 5(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %a1, 0
	fmov	%f2, %f1
	fmov	%f1, %f3
	fmov	%f29, %f3
	fmov	%f3, %f0
	fmov	%f0, %f29
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	calc_dirvec.3064
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	itof	%f0, %v0
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 439(%zero)
	fadd	%f2, %f0, %f1
	lw	%v1, 4(%sp)
	addi	%a0, %v1, 2
	flw	%f0, 1(%sp)
	flw	%f3, 0(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 2(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	fmov	%f1, %f0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	calc_dirvec.3064
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 1
	lw	%v0, 6(%sp)
	addi	%v0, %v0, -1
	lw	%a0, 2(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	add_mod5.2634
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 0(%sp)
	lw	%v0, 7(%sp)
	lw	%a0, 4(%sp)
	j	calc_dirvecs.3072
bgti_else.8495:
	jr	%ra
calc_dirvec_rows.3077:
	blti	%v0, 0, bgti_else.8497
	itof	%f0, %v0
	flw	%f1, 473(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 436(%zero)
	fsub	%f0, %f0, %f1
	addi	%a1, %zero, 4
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	calc_dirvecs.3072
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	addi	%v1, %zero, 2
	lw	%a0, 1(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	add_mod5.2634
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%sp)
	addi	%a0, %v0, 4
	lw	%v0, 3(%sp)
	j	calc_dirvec_rows.3077
bgti_else.8497:
	jr	%ra
create_dirvec.3081:
	addi	%v0, %zero, 3
	flw	%f0, 482(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%zero)
	sw	%v1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 0(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	jr	%ra
create_dirvec_elements.3083:
	blti	%v1, 0, bgti_else.8499
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_dirvec.3081
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	create_dirvec_elements.3083
bgti_else.8499:
	jr	%ra
create_dirvecs.3086:
	blti	%v0, 0, bgti_else.8501
	addi	%v1, %zero, 120
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_dirvec.3081
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, 179
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 179
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	addi	%v1, %zero, 118
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_dirvec_elements.3083
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	j	create_dirvecs.3086
bgti_else.8501:
	jr	%ra
init_dirvec_constants.3088:
	blti	%v1, 0, bgti_else.8503
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	setup_dirvec_constants.2873
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	j	init_dirvec_constants.3088
bgti_else.8503:
	jr	%ra
init_vecset_constants.3091:
	blti	%v0, 0, bgti_else.8505
	addi	%v1, %zero, 179
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 119
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	init_dirvec_constants.3088
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3091
bgti_else.8505:
	jr	%ra
init_dirvecs.3093:
	addi	%v0, %zero, 4
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	create_dirvecs.3086
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 9
	addi	%v1, %zero, 0
	addi	%a0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	calc_dirvec_rows.3077
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v0, 0(%sp)
	j	init_vecset_constants.3091
add_reflection.3095:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f3, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	create_dirvec.3081
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	d_vec.2744
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f0, 5(%sp)
	flw	%f1, 4(%sp)
	flw	%f2, 3(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	vecset.2637
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_dirvec_constants.2873
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 6(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 1(%sp)
	sw	%v1, 0(%v0)
	addi	%v1, %zero, 254
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	jr	%ra
setup_rect_reflection.3102:
	sll	%v0, %v0, 2
	addi	%a0, %zero, 434
	lw	%a0, 434(%zero)
	flw	%f0, 477(%zero)
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_diffuse.2707
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 78
	flw	%f1, 78(%zero)
	fneg	%f2, %f1
	addi	%v0, %zero, 78
	flw	%f3, 79(%zero)
	fneg	%f4, %f3
	addi	%v0, %zero, 78
	flw	%f5, 80(%zero)
	fneg	%f6, %f5
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	lw	%a0, 0(%sp)
	fsw	%f5, 3(%sp)
	fsw	%f4, 4(%sp)
	fsw	%f6, 5(%sp)
	fsw	%f3, 6(%sp)
	fsw	%f2, 7(%sp)
	fsw	%f0, 8(%sp)
	addi	%v0, %a0, 0
	fmov	%f3, %f6
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	add_reflection.3095
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 1
	lw	%a0, 1(%sp)
	addi	%a1, %a0, 2
	flw	%f0, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 6(%sp)
	flw	%f3, 5(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	add_reflection.3095
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 2
	lw	%a0, 1(%sp)
	addi	%a0, %a0, 3
	flw	%f0, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 4(%sp)
	flw	%f3, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	add_reflection.3095
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 3
	addi	%v1, %zero, 434
	sw	%v0, 434(%zero)
	jr	%ra
setup_surface_reflection.3105:
	sll	%v0, %v0, 2
	addi	%v0, %v0, 1
	addi	%a0, %zero, 434
	lw	%a0, 434(%zero)
	flw	%f0, 477(%zero)
	sw	%v0, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	fsw	%f0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_diffuse.2707
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_abc.2699
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 78
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2658
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 468(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_a.2693
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 5(%sp)
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 78
	flw	%f3, 78(%zero)
	fsub	%f0, %f0, %f3
	lw	%v0, 2(%sp)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2695
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 5(%sp)
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 78
	flw	%f3, 79(%zero)
	fsub	%f0, %f0, %f3
	lw	%v0, 2(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 78
	flw	%f1, 80(%zero)
	fsub	%f3, %f0, %f1
	flw	%f0, 4(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	add_reflection.3095
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, 434
	sw	%v0, 434(%zero)
	jr	%ra
setup_reflections.3108:
	blti	%v0, 0, bgti_else.8510
	addi	%v1, %zero, 12
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_reflectiontype.2687
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 2, bnei_else.8511
	jr	%ra
bnei_else.8511:
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_diffuse.2707
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 477(%zero)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	fless.2592
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.8513
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2685
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 1, bnei_else.8514
	beqi	%v0, 2, bnei_else.8515
	jr	%ra
bnei_else.8515:
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	j	setup_surface_reflection.3105
bnei_else.8514:
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	j	setup_rect_reflection.3102
bnei_else.8513:
	jr	%ra
bgti_else.8510:
	jr	%ra
rt.3110:
	addi	%a0, %zero, 0
	addi	%a1, %zero, 154
	sw	%v0, 154(%zero)
	addi	%a1, %zero, 154
	sw	%v1, 155(%zero)
	addi	%a1, %zero, 2
	srl	%a2, %v0, 1
	addi	%a3, %zero, 156
	sw	%a2, 156(%zero)
	srl	%v1, %v1, 1
	addi	%a2, %zero, 156
	sw	%v1, 157(%zero)
	flw	%f0, 435(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 158
	fsw	%f0, 158(%zero)
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	create_pixelline.3057
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	create_pixelline.3057
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	create_pixelline.3057
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_parameter.2775
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	write_ppm_header.3018
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	init_dirvecs.3093
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 247
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	d_vec.2744
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %zero, 78
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	veccpy.2647
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 247
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_dirvec_constants.2873
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 0
	lw	%v0, 0(%zero)
	addi	%v0, %v0, -1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_reflections.3108
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	pretrace_line.3034
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 3(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 0(%sp)
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
	flw	%f0, 482(%zero)
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
	sw	%v0, 11(%zero)
	sw	%v0, 10(%zero)
	sw	%v0, 9(%zero)
	sw	%v0, 8(%zero)
	lw	%a1, 1(%sp)
	sw	%a1, 7(%zero)
	sw	%v0, 6(%zero)
	sw	%v0, 5(%zero)
	sw	%a1, 4(%zero)
	sw	%a1, 3(%zero)
	sw	%a1, 2(%zero)
	sw	%a1, 1(%zero)
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
	flw	%f0, 454(%zero)
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
	sw	%v0, 178(%zero)
	lw	%v0, 7(%sp)
	sw	%v0, 177(%zero)
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
	sw	%v0, 248(%zero)
	lw	%v0, 8(%sp)
	sw	%v0, 247(%zero)
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
	sw	%v0, 250(%zero)
	lw	%v0, 9(%sp)
	sw	%v0, 249(%zero)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	addi	%a0, %zero, 251
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
	addi	%v0, %zero, 4
	addi	%v1, %v0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	rt.3110
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%g0, %zero, 0
	ret
