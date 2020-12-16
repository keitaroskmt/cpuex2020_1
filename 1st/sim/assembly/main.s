.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 463
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
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8123
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8123:
	addi	%v0, %zero, 1
	jr	%ra
fispos.2595:
	flw	%f1, 462(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.8124
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8124:
	addi	%v0, %zero, 1
	jr	%ra
fisneg.2597:
	flw	%f1, 462(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8125
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8125:
	addi	%v0, %zero, 1
	jr	%ra
fiszero.2599:
	flw	%f1, 462(%zero)
	fbne	%f0, %f1, fbeq_else.8126
	addi	%v0, %zero, 1
	jr	%ra
fbeq_else.8126:
	addi	%v0, %zero, 0
	jr	%ra
xor.2601:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8127
	add	%v0, %zero, %v1
	jr	%ra
beq_else.8127:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8128
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8128:
	addi	%v0, %zero, 0
	jr	%ra
fhalf.2604:
	flw	%f1, 461(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
fsqr.2606:
	fmul	%f0, %f0, %f0
	jr	%ra
kernel_sin.2608:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 460(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 459(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 458(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	jr	%ra
kernel_cos.2610:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 457(%zero)
	flw	%f3, 461(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 456(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 455(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	jr	%ra
kernel_atan.2612:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	flw	%f4, 454(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 453(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 452(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 451(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 450(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 449(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
f.6155:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8129
	flw	%f2, 448(%zero)
	fmul	%f1, %f2, %f1
	j	f.6155
beq_else.8129:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.6159:
	flw	%f2, 1(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8130
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8131
	fsub	%f0, %f0, %f1
	flw	%f2, 448(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.8131:
	flw	%f2, 448(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.8130:
	jr	%ra
reduction_2pi.2614:
	flw	%f1, 447(%zero)
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	f.6155
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	fadd	%f1, %f0, %fzero
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
	flw	%f1, 446(%zero)
	fabs	%f0, %f0
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	reduction_2pi.2614
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8132
	addi	%v0, %zero, 0
	j	beq_cont.8133
beq_else.8132:
	addi	%v0, %zero, 1
beq_cont.8133:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8134
	fsub	%f0, %f0, %f1
	j	beq_cont.8135
beq_else.8134:
beq_cont.8135:
	flw	%f2, 445(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8136
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8138
	addi	%v0, %zero, 1
	j	beq_cont.8139
beq_else.8138:
	addi	%v0, %zero, 0
beq_cont.8139:
	j	beq_cont.8137
beq_else.8136:
beq_cont.8137:
	flw	%f2, 445(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8140
	fsub	%f0, %f1, %f0
	j	beq_cont.8141
beq_else.8140:
beq_cont.8141:
	flw	%f1, 444(%zero)
	sw	%v0, 1(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.8142
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_cos.2610
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	j	beq_cont.8143
beq_else.8142:
	flw	%f1, 445(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_sin.2608
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
beq_cont.8143:
	lw	%v0, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8144
	fneg	%f0, %f0
	jr	%ra
beq_else.8144:
	jr	%ra
sin.2618:
	flw	%f1, 446(%zero)
	flw	%f2, 462(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8145
	addi	%v0, %zero, 1
	j	beq_cont.8146
beq_else.8145:
	addi	%v0, %zero, 0
beq_cont.8146:
	fabs	%f0, %f0
	sw	%v0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	reduction_2pi.2614
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8147
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8149
	addi	%v0, %zero, 1
	j	beq_cont.8150
beq_else.8149:
	addi	%v0, %zero, 0
beq_cont.8150:
	j	beq_cont.8148
beq_else.8147:
	lw	%v0, 0(%sp)
beq_cont.8148:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8151
	fsub	%f0, %f0, %f1
	j	beq_cont.8152
beq_else.8151:
beq_cont.8152:
	flw	%f2, 445(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.8153
	fsub	%f0, %f1, %f0
	j	beq_cont.8154
beq_else.8153:
beq_cont.8154:
	flw	%f1, 444(%zero)
	sw	%v0, 2(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.8155
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_sin.2608
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.8156
beq_else.8155:
	flw	%f1, 445(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_cos.2610
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.8156:
	lw	%v0, 2(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8157
	fneg	%f0, %f0
	jr	%ra
beq_else.8157:
	jr	%ra
atan.2620:
	flw	%f1, 462(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.8158
	addi	%v0, %zero, 1
	j	beq_cont.8159
beq_else.8158:
	addi	%v0, %zero, 0
beq_cont.8159:
	fabs	%f1, %f0
	flw	%f2, 443(%zero)
	fslt	%at, %f1, %f2
	bne	%at, %zero, beq_else.8160
	flw	%f0, 442(%zero)
	sw	%v0, 0(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.8161
	flw	%f0, 445(%zero)
	flw	%f2, 457(%zero)
	fdiv	%f1, %f2, %f1
	fsw	%f0, 1(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	kernel_atan.2612
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.8162
beq_else.8161:
	flw	%f0, 444(%zero)
	flw	%f2, 457(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 457(%zero)
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f2, %f1
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	kernel_atan.2612
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
beq_cont.8162:
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8163
	fneg	%f0, %f0
	jr	%ra
beq_else.8163:
	jr	%ra
beq_else.8160:
	j	kernel_atan.2612
print_int_sub1.2622:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.8164
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2622
beq_else.8164:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2625:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.8165
	addi	%v0, %v0, -10
	j	print_int_sub2.2625
beq_else.8165:
	jr	%ra
print_int.2627:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	print_int_sub1.2622
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	print_int_sub2.2625
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8166
	addi	%v0, %v0, 48
	j	min_caml_print_char
beq_else.8166:
	addi	%a0, %zero, 0
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	print_int_sub1.2622
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	print_int_sub2.2625
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8167
	addi	%v0, %v0, 48
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_print_char
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
beq_else.8167:
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	print_int_sub2.2625
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
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
sgn.2629:
	fsw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fiszero.2599
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8168
	flw	%f0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fispos.2595
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8169
	flw	%f0, 441(%zero)
	jr	%ra
beq_else.8169:
	flw	%f0, 457(%zero)
	jr	%ra
beq_else.8168:
	flw	%f0, 462(%zero)
	jr	%ra
fneg_cond.2631:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8170
	fneg	%f0, %f0
	jr	%ra
beq_else.8170:
	jr	%ra
add_mod5.2634:
	add	%v0, %v0, %v1
	slti	%at, %v0, 5
	bne	%at, %zero, beq_else.8171
	addi	%v0, %v0, -5
	jr	%ra
beq_else.8171:
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
	flw	%f0, 462(%zero)
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
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	fsqr.2606
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fsqr.2606
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 3(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fsqr.2606
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fiszero.2599
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8175
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8177
	flw	%f0, 457(%zero)
	flw	%f1, 4(%sp)
	fdiv	%f0, %f0, %f1
	j	beq_cont.8178
beq_else.8177:
	flw	%f0, 441(%zero)
	flw	%f1, 4(%sp)
	fdiv	%f0, %f0, %f1
beq_cont.8178:
	j	beq_cont.8176
beq_else.8175:
	flw	%f0, 457(%zero)
beq_cont.8176:
	lw	%v0, 1(%sp)
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
	flw	%f1, 440(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
read_screen_settings.2756:
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 61
	fsw	%f0, 0(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 61
	fsw	%f0, 1(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_read_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 61
	fsw	%f0, 2(%v0)
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
	fadd	%f0, %f1, %fzero
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
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	sin.2618
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 1(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 439(%zero)
	fmul	%f2, %f2, %f3
	addi	%v0, %zero, 160
	fsw	%f2, 0(%v0)
	flw	%f2, 438(%zero)
	flw	%f3, 2(%sp)
	fmul	%f2, %f3, %f2
	addi	%v0, %zero, 160
	fsw	%f2, 1(%v0)
	flw	%f2, 4(%sp)
	fmul	%f4, %f1, %f2
	flw	%f5, 439(%zero)
	fmul	%f4, %f4, %f5
	addi	%v0, %zero, 160
	fsw	%f4, 2(%v0)
	addi	%v0, %zero, 154
	fsw	%f2, 0(%v0)
	flw	%f4, 462(%zero)
	addi	%v0, %zero, 154
	fsw	%f4, 1(%v0)
	fneg	%f4, %f0
	addi	%v0, %zero, 154
	fsw	%f4, 2(%v0)
	fneg	%f4, %f3
	fmul	%f0, %f4, %f0
	addi	%v0, %zero, 157
	fsw	%f0, 0(%v0)
	fneg	%f0, %f1
	addi	%v0, %zero, 157
	fsw	%f0, 1(%v0)
	fneg	%f0, %f3
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 157
	fsw	%f0, 2(%v0)
	addi	%v0, %zero, 61
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 160
	flw	%f1, 0(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 64
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 61
	flw	%f0, 1(%v0)
	addi	%v0, %zero, 160
	flw	%f1, 1(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 64
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 61
	flw	%f0, 2(%v0)
	addi	%v0, %zero, 160
	flw	%f1, 2(%v0)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 64
	fsw	%f0, 2(%v0)
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
	addi	%v0, %zero, 67
	fsw	%f0, 1(%v0)
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
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2616
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2618
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 67
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	cos.2616
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 67
	fsw	%f0, 2(%v0)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_float
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 70
	fsw	%f0, 0(%v0)
	jr	%ra
rotate_quadratic_matrix.2760:
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	cos.2616
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sin.2618
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 3(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	cos.2616
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	sin.2618
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 5(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	cos.2616
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	fsw	%f0, 6(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	sin.2618
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 4(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 5(%sp)
	flw	%f5, 3(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f6, %f6, %f1
	flw	%f7, 2(%sp)
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
	flw	%f7, 1(%v0)
	flw	%f11, 2(%v0)
	fsw	%f3, 7(%sp)
	fsw	%f2, 8(%sp)
	fsw	%f0, 9(%sp)
	fsw	%f8, 10(%sp)
	fsw	%f4, 11(%sp)
	fsw	%f10, 12(%sp)
	fsw	%f6, 13(%sp)
	fsw	%f11, 14(%sp)
	fsw	%f1, 15(%sp)
	fsw	%f7, 16(%sp)
	fsw	%f9, 17(%sp)
	fsw	%f5, 18(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fsqr.2606
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 17(%sp)
	fsw	%f0, 19(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	fsqr.2606
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 19(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 15(%sp)
	fsw	%f0, 20(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	fsqr.2606
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 20(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 13(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	fsqr.2606
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 12(%sp)
	fsw	%f0, 21(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	fsqr.2606
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 21(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 11(%sp)
	fsw	%f0, 22(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	fsqr.2606
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 22(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 10(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	fsqr.2606
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 9(%sp)
	fsw	%f0, 23(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	fsqr.2606
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 23(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 8(%sp)
	fsw	%f0, 24(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	fsqr.2606
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f1, 14(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 24(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 448(%zero)
	flw	%f2, 13(%sp)
	flw	%f3, 18(%sp)
	fmul	%f4, %f3, %f2
	flw	%f5, 10(%sp)
	fmul	%f4, %f4, %f5
	flw	%f6, 12(%sp)
	flw	%f7, 16(%sp)
	fmul	%f8, %f7, %f6
	flw	%f9, 9(%sp)
	fmul	%f8, %f8, %f9
	fadd	%f4, %f4, %f8
	flw	%f8, 11(%sp)
	fmul	%f10, %f1, %f8
	flw	%f11, 8(%sp)
	fmul	%f10, %f10, %f11
	fadd	%f4, %f4, %f10
	fmul	%f0, %f0, %f4
	lw	%v0, 1(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 448(%zero)
	flw	%f4, 7(%sp)
	fmul	%f10, %f3, %f4
	fmul	%f5, %f10, %f5
	flw	%f10, 17(%sp)
	fmul	%f12, %f7, %f10
	fmul	%f9, %f12, %f9
	fadd	%f5, %f5, %f9
	flw	%f9, 15(%sp)
	fmul	%f12, %f1, %f9
	fmul	%f11, %f12, %f11
	fadd	%f5, %f5, %f11
	fmul	%f0, %f0, %f5
	fsw	%f0, 1(%v0)
	flw	%f0, 448(%zero)
	fmul	%f3, %f3, %f4
	fmul	%f2, %f3, %f2
	fmul	%f3, %f7, %f10
	fmul	%f3, %f3, %f6
	fadd	%f2, %f2, %f3
	fmul	%f1, %f1, %f9
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
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.8188
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8188:
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
	flw	%f0, 462(%zero)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_float
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	fsw	%f0, 2(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 2(%v0)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_float
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fisneg.2597
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v1, %zero, 2
	flw	%f0, 462(%zero)
	sw	%v0, 7(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_float
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_float
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	fsw	%f0, 1(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 462(%zero)
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
	addi	%v1, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 4(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8189
	j	beq_cont.8190
beq_else.8189:
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	rad.2754
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	rad.2754
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_float
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	rad.2754
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	fsw	%f0, 2(%v0)
beq_cont.8190:
	lw	%v1, 2(%sp)
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.8191
	addi	%a0, %zero, 1
	j	beq_cont.8192
beq_else.8191:
	lw	%a0, 7(%sp)
beq_cont.8192:
	addi	%a1, %zero, 4
	flw	%f0, 462(%zero)
	sw	%a0, 11(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)
	lw	%v0, 10(%sp)
	sw	%v0, 9(%v1)
	lw	%a0, 9(%sp)
	sw	%a0, 8(%v1)
	lw	%a0, 8(%sp)
	sw	%a0, 7(%v1)
	lw	%a0, 11(%sp)
	sw	%a0, 6(%v1)
	lw	%a0, 6(%sp)
	sw	%a0, 5(%v1)
	lw	%a0, 5(%sp)
	sw	%a0, 4(%v1)
	lw	%a1, 4(%sp)
	sw	%a1, 3(%v1)
	lw	%a2, 3(%sp)
	sw	%a2, 2(%v1)
	lw	%a2, 2(%sp)
	sw	%a2, 1(%v1)
	lw	%a3, 1(%sp)
	sw	%a3, 0(%v1)
	addi	%a3, %zero, 1
	lw	%t0, 0(%sp)
	add	%at, %a3, %t0
	sw	%v1, 0(%at)
	addi	%at, %zero, 3
	bne	%a2, %at, beq_else.8193
	flw	%f0, 0(%a0)
	fsw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fiszero.2599
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8195
	flw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	sgn.2629
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 12(%sp)
	fsw	%f0, 13(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	fsqr.2606
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.8196
beq_else.8195:
	flw	%f0, 462(%zero)
beq_cont.8196:
	lw	%v0, 5(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 1(%v0)
	fsw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fiszero.2599
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8197
	flw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	sgn.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fsw	%f0, 15(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	fsqr.2606
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 15(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.8198
beq_else.8197:
	flw	%f0, 462(%zero)
beq_cont.8198:
	lw	%v0, 5(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 2(%v0)
	fsw	%f0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	fiszero.2599
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8199
	flw	%f0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	sgn.2629
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fsw	%f0, 17(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fsqr.2606
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.8200
beq_else.8199:
	flw	%f0, 462(%zero)
beq_cont.8200:
	lw	%v0, 5(%sp)
	fsw	%f0, 2(%v0)
	j	beq_cont.8194
beq_else.8193:
	addi	%at, %zero, 2
	bne	%a2, %at, beq_else.8201
	lw	%v1, 7(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8203
	addi	%v1, %zero, 1
	j	beq_cont.8204
beq_else.8203:
	addi	%v1, %zero, 0
beq_cont.8204:
	addi	%v0, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	beq_cont.8202
beq_else.8201:
beq_cont.8202:
beq_cont.8194:
	lw	%v0, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8205
	j	beq_cont.8206
beq_else.8205:
	lw	%v0, 5(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	rotate_quadratic_matrix.2760
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
beq_cont.8206:
	addi	%v0, %zero, 1
	jr	%ra
read_object.2765:
	slti	%at, %v0, 60
	bne	%at, %zero, beq_else.8207
	jr	%ra
beq_else.8207:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2763
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8209
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
beq_else.8209:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	read_object.2765
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
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.8211
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	j	min_caml_create_array
beq_else.8211:
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
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.8212
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
beq_else.8212:
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
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.8213
	jr	%ra
beq_else.8213:
	addi	%v1, %zero, 72
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %a0, 1
	j	read_and_network.2773
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
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_and_network.2773
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	read_or_network.2771
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %zero, 123
	sw	%v0, 0(%v1)
	jr	%ra
solver_rect_surface.2777:
	add	%at, %v1, %a0
	flw	%f3, 0(%at)
	fsw	%f2, 0(%sp)
	sw	%a2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%a1, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fiszero.2599
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8216
	lw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_abc.2699
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_isinvert.2689
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %a0, %v1
	flw	%f0, 0(%at)
	sw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fisneg.2597
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	xor.2601
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 8(%sp)
	add	%at, %a0, %v1
	flw	%f0, 0(%at)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fneg_cond.2631
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 4(%sp)
	fsub	%f0, %f0, %f1
	lw	%v0, 5(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	flw	%f1, 0(%at)
	fdiv	%f0, %f0, %f1
	lw	%v0, 3(%sp)
	add	%at, %v1, %v0
	flw	%f1, 0(%at)
	fmul	%f1, %f0, %f1
	flw	%f2, 2(%sp)
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	lw	%a0, 8(%sp)
	add	%at, %a0, %v0
	flw	%f2, 0(%at)
	fsw	%f0, 10(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fless.2592
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8217
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8217:
	lw	%v0, 1(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	flw	%f0, 0(%at)
	flw	%f1, 10(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 0(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v1, 8(%sp)
	add	%at, %v1, %v0
	flw	%f2, 0(%at)
	fadd	%f1, %f2, %fzero
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fless.2592
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8218
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8218:
	addi	%v0, %zero, 124
	flw	%f0, 10(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8216:
	addi	%v0, %zero, 0
	jr	%ra
solver_rect.2786:
	addi	%a0, %zero, 0
	addi	%a1, %zero, 1
	addi	%a2, %zero, 2
	fsw	%f0, 0(%sp)
	fsw	%f2, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8219
	addi	%a0, %zero, 1
	addi	%a1, %zero, 2
	addi	%a2, %zero, 0
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8220
	addi	%a0, %zero, 2
	addi	%a1, %zero, 0
	addi	%a2, %zero, 1
	flw	%f0, 1(%sp)
	flw	%f1, 0(%sp)
	flw	%f2, 2(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_rect_surface.2777
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8221
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8221:
	addi	%v0, %zero, 3
	jr	%ra
beq_else.8220:
	addi	%v0, %zero, 2
	jr	%ra
beq_else.8219:
	addi	%v0, %zero, 1
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8222
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8222:
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
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
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
	fadd	%f0, %f1, %fzero
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
	fadd	%f0, %f1, %fzero
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8223
	flw	%f0, 9(%sp)
	jr	%ra
beq_else.8223:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8224
	flw	%f0, 12(%sp)
	jr	%ra
beq_else.8224:
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
solver_second.2811:
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)
	flw	%f5, 2(%v1)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	fadd	%f2, %f5, %fzero
	fadd	%f1, %f4, %fzero
	fadd	%f0, %f3, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	quadratic.2798
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8225
	lw	%v0, 4(%sp)
	flw	%f0, 0(%v0)
	flw	%f1, 1(%v0)
	flw	%f2, 2(%v0)
	flw	%f3, 2(%sp)
	flw	%f4, 1(%sp)
	flw	%f5, 0(%sp)
	lw	%v0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	bilinear.2803
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 2(%sp)
	flw	%f2, 1(%sp)
	flw	%f3, 0(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 6(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	quadratic.2798
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 3(%sp)
	fsw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_form.2685
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8226
	flw	%f0, 457(%zero)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.8227
beq_else.8226:
	flw	%f0, 7(%sp)
beq_cont.8227:
	flw	%f1, 6(%sp)
	fsw	%f0, 8(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fsqr.2606
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 5(%sp)
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fispos.2595
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8228
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8228:
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_isinvert.2689
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8229
	flw	%f0, 10(%sp)
	fneg	%f0, %f0
	j	beq_cont.8230
beq_else.8229:
	flw	%f0, 10(%sp)
beq_cont.8230:
	flw	%f1, 6(%sp)
	fsub	%f0, %f0, %f1
	flw	%f1, 5(%sp)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8225:
	addi	%v0, %zero, 0
	jr	%ra
solver.2817:
	addi	%a1, %zero, 1
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
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8231
	flw	%f0, 4(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	j	solver_rect.2786
beq_else.8231:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8232
	flw	%f0, 4(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	j	solver_surface.2792
beq_else.8232:
	flw	%f0, 4(%sp)
	flw	%f1, 6(%sp)
	flw	%f2, 8(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	j	solver_second.2811
solver_rect_fast.2821:
	flw	%f3, 0(%a0)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a0)
	fmul	%f3, %f3, %f4
	flw	%f4, 1(%v1)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	fabs	%f4, %f4
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f3, 5(%sp)
	sw	%v1, 6(%sp)
	fsw	%f4, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_b.2695
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fless.2592
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8233
	addi	%v0, %zero, 0
	j	beq_cont.8234
beq_else.8233:
	lw	%v0, 6(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 4(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v1, 3(%sp)
	fsw	%f0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fless.2592
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8235
	addi	%v0, %zero, 0
	j	beq_cont.8236
beq_else.8235:
	lw	%v0, 2(%sp)
	flw	%f0, 1(%v0)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fiszero.2599
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8237
	addi	%v0, %zero, 1
	j	beq_cont.8238
beq_else.8237:
	addi	%v0, %zero, 0
beq_cont.8238:
beq_cont.8236:
beq_cont.8234:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8239
	lw	%v0, 2(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 1(%sp)
	fsub	%f0, %f0, %f1
	flw	%f2, 3(%v0)
	fmul	%f0, %f0, %f2
	lw	%v1, 6(%sp)
	flw	%f2, 0(%v1)
	fmul	%f2, %f0, %f2
	flw	%f3, 0(%sp)
	fadd	%f2, %f2, %f3
	fabs	%f2, %f2
	lw	%a0, 3(%sp)
	fsw	%f0, 9(%sp)
	fsw	%f2, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_a.2693
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fless.2592
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8240
	addi	%v0, %zero, 0
	j	beq_cont.8241
beq_else.8240:
	lw	%v0, 6(%sp)
	flw	%f0, 2(%v0)
	flw	%f1, 9(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 4(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v1, 3(%sp)
	fsw	%f0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_c.2697
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fless.2592
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8242
	addi	%v0, %zero, 0
	j	beq_cont.8243
beq_else.8242:
	lw	%v0, 2(%sp)
	flw	%f0, 3(%v0)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fiszero.2599
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8244
	addi	%v0, %zero, 1
	j	beq_cont.8245
beq_else.8244:
	addi	%v0, %zero, 0
beq_cont.8245:
beq_cont.8243:
beq_cont.8241:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8246
	lw	%v0, 2(%sp)
	flw	%f0, 4(%v0)
	flw	%f1, 4(%sp)
	fsub	%f0, %f0, %f1
	flw	%f1, 5(%v0)
	fmul	%f0, %f0, %f1
	lw	%v1, 6(%sp)
	flw	%f1, 0(%v1)
	fmul	%f1, %f0, %f1
	flw	%f2, 0(%sp)
	fadd	%f1, %f1, %f2
	fabs	%f1, %f1
	lw	%a0, 3(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f1, 13(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	o_param_a.2693
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	fless.2592
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8247
	addi	%v0, %zero, 0
	j	beq_cont.8248
beq_else.8247:
	lw	%v0, 6(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 12(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 1(%sp)
	fadd	%f0, %f0, %f2
	fabs	%f0, %f0
	lw	%v0, 3(%sp)
	fsw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_param_b.2695
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fless.2592
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8249
	addi	%v0, %zero, 0
	j	beq_cont.8250
beq_else.8249:
	lw	%v0, 2(%sp)
	flw	%f0, 5(%v0)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fiszero.2599
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8251
	addi	%v0, %zero, 1
	j	beq_cont.8252
beq_else.8251:
	addi	%v0, %zero, 0
beq_cont.8252:
beq_cont.8250:
beq_cont.8248:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8253
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8253:
	addi	%v0, %zero, 124
	flw	%f0, 12(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 3
	jr	%ra
beq_else.8246:
	addi	%v0, %zero, 124
	flw	%f0, 9(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 2
	jr	%ra
beq_else.8239:
	addi	%v0, %zero, 124
	flw	%f0, 5(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
solver_surface_fast.2828:
	flw	%f3, 0(%v1)
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v1, 3(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fisneg.2597
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8254
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8254:
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
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
	jr	%ra
solver_second_fast.2834:
	flw	%f3, 0(%v1)
	fsw	%f3, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f2, 2(%sp)
	fsw	%f1, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%v1, 5(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fiszero.2599
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8255
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
	fadd	%f2, %f4, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
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
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8256
	flw	%f0, 457(%zero)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.8257
beq_else.8256:
	flw	%f0, 7(%sp)
beq_cont.8257:
	flw	%f1, 6(%sp)
	fsw	%f0, 8(%sp)
	fadd	%f0, %f1, %fzero
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8258
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8258:
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2689
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8259
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 5(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	j	beq_cont.8260
beq_else.8259:
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 5(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
beq_cont.8260:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8255:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast.2840:
	addi	%a1, %zero, 1
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
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8261
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
beq_else.8261:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8262
	flw	%f0, 5(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	j	solver_surface_fast.2828
beq_else.8262:
	flw	%f0, 5(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	j	solver_second_fast.2834
solver_surface_fast2.2844:
	flw	%f0, 0(%v1)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	fisneg.2597
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8263
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8263:
	lw	%v0, 1(%sp)
	flw	%f0, 0(%v0)
	lw	%v0, 0(%sp)
	flw	%f1, 3(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 1
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
	fadd	%f0, %f3, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fiszero.2599
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8264
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8265
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8265:
	lw	%v0, 0(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isinvert.2689
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8266
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
	j	beq_cont.8267
beq_else.8266:
	flw	%f0, 9(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124
	fsw	%f0, 0(%v0)
beq_cont.8267:
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8264:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2858:
	addi	%a0, %zero, 1
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
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8268
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
beq_else.8268:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8269
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 3(%sp)
	j	solver_surface_fast2.2844
beq_else.8269:
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 3(%sp)
	j	solver_second_fast2.2851
setup_rect_table.2861:
	addi	%a0, %zero, 6
	flw	%f0, 462(%zero)
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
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fiszero.2599
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8270
	lw	%v0, 0(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_isinvert.2689
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 0(%v1)
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
	lw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2693
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fneg_cond.2631
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 457(%zero)
	lw	%v1, 1(%sp)
	flw	%f1, 0(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 1(%v0)
	j	beq_cont.8271
beq_else.8270:
	flw	%f0, 462(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 1(%v0)
beq_cont.8271:
	lw	%v1, 1(%sp)
	flw	%f0, 1(%v1)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fiszero.2599
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8272
	lw	%v0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2689
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 1(%v1)
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
	lw	%v1, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_b.2695
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fneg_cond.2631
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 2(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 457(%zero)
	lw	%v1, 1(%sp)
	flw	%f1, 1(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 3(%v0)
	j	beq_cont.8273
beq_else.8272:
	flw	%f0, 462(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
beq_cont.8273:
	lw	%v1, 1(%sp)
	flw	%f0, 2(%v1)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fiszero.2599
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8274
	lw	%v0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_isinvert.2689
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 1(%sp)
	flw	%f0, 2(%v1)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	fisneg.2597
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	xor.2601
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fneg_cond.2631
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 2(%sp)
	fsw	%f0, 4(%v0)
	flw	%f0, 457(%zero)
	lw	%v1, 1(%sp)
	flw	%f1, 2(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 5(%v0)
	j	beq_cont.8275
beq_else.8274:
	flw	%f0, 462(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 5(%v0)
beq_cont.8275:
	jr	%ra
setup_surface_table.2864:
	addi	%a0, %zero, 4
	flw	%f0, 462(%zero)
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
	lw	%a0, 0(%sp)
	sw	%v0, 2(%sp)
	fsw	%f0, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_param_a.2693
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 3(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 4(%sp)
	fsw	%f1, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_b.2695
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	lw	%v0, 0(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f1, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	o_param_c.2697
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	fsw	%f0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	fispos.2595
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8276
	flw	%f0, 462(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 0(%v0)
	j	beq_cont.8277
beq_else.8276:
	flw	%f0, 441(%zero)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f0, %f1
	lw	%v0, 2(%sp)
	fsw	%f0, 0(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_a.2693
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 1(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_b.2695
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
beq_cont.8277:
	jr	%ra
setup_second_table.2867:
	addi	%a0, %zero, 5
	flw	%f0, 462(%zero)
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
	lw	%a0, 0(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	quadratic.2798
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 3(%sp)
	fsw	%f1, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_a.2693
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f1, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_b.2695
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 2(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_c.2697
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 2(%sp)
	flw	%f1, 3(%sp)
	fsw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_isrot.2691
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8278
	lw	%v0, 2(%sp)
	flw	%f0, 5(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 7(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 9(%sp)
	fsw	%f0, 3(%v0)
	j	beq_cont.8279
beq_else.8278:
	lw	%v0, 1(%sp)
	flw	%f0, 2(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 10(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r2.2719
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 1(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 11(%sp)
	fsw	%f1, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r3.2721
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 12(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 11(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fhalf.2604
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 1(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 2(%v1)
	lw	%a0, 0(%sp)
	fsw	%f0, 13(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	o_param_r1.2717
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 13(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f1, 15(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	o_param_r3.2721
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 15(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 14(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	fhalf.2604
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f1, 7(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 1(%sp)
	flw	%f0, 1(%v1)
	lw	%a0, 0(%sp)
	fsw	%f0, 16(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	o_param_r1.2717
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	flw	%f1, 0(%v0)
	lw	%v0, 0(%sp)
	fsw	%f0, 17(%sp)
	fsw	%f1, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	o_param_r2.2719
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 18(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 17(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fhalf.2604
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 9(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 2(%sp)
	fsw	%f0, 3(%v0)
beq_cont.8279:
	flw	%f0, 3(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fiszero.2599
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8280
	flw	%f0, 457(%zero)
	flw	%f1, 3(%sp)
	fdiv	%f0, %f0, %f1
	lw	%v0, 2(%sp)
	fsw	%f0, 4(%v0)
	j	beq_cont.8281
beq_else.8280:
beq_cont.8281:
	lw	%v0, 2(%sp)
	jr	%ra
iter_setup_dirvec_constants.2870:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8282
	addi	%a0, %zero, 1
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
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8283
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
	j	beq_cont.8284
beq_else.8283:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8285
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
	j	beq_cont.8286
beq_else.8285:
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
beq_cont.8286:
beq_cont.8284:
	addi	%v1, %v1, -1
	lw	%v0, 2(%sp)
	j	iter_setup_dirvec_constants.2870
beq_else.8282:
	jr	%ra
setup_dirvec_constants.2873:
	addi	%v1, %zero, 0
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -1
	j	iter_setup_dirvec_constants.2870
setup_startp_constants.2875:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8288
	addi	%a0, %zero, 1
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
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.8289
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
	j	beq_cont.8290
beq_else.8289:
	addi	%at, %zero, 2
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8291
	j	beq_cont.8292
beq_else.8291:
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
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8293
	flw	%f1, 457(%zero)
	fsub	%f0, %f0, %f1
	j	beq_cont.8294
beq_else.8293:
beq_cont.8294:
	lw	%v0, 3(%sp)
	fsw	%f0, 3(%v0)
beq_cont.8292:
beq_cont.8290:
	lw	%v0, 0(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	setup_startp_constants.2875
beq_else.8288:
	jr	%ra
setup_startp.2878:
	addi	%v1, %zero, 151
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
	lw	%v0, 0(%v0)
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
	fadd	%f1, %f0, %fzero
	flw	%f0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8296
	addi	%v0, %zero, 0
	j	beq_cont.8297
beq_else.8296:
	flw	%f0, 2(%sp)
	fabs	%f0, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_param_b.2695
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8298
	addi	%v0, %zero, 0
	j	beq_cont.8299
beq_else.8298:
	flw	%f0, 0(%sp)
	fabs	%f0, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_c.2697
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2592
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.8299:
beq_cont.8297:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8300
	lw	%v0, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_isinvert.2689
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8301
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8301:
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8300:
	lw	%v0, 1(%sp)
	j	o_isinvert.2689
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8302
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8302:
	addi	%v0, %zero, 0
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
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8303
	flw	%f0, 457(%zero)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.8304
beq_else.8303:
	flw	%f0, 1(%sp)
beq_cont.8304:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8305
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8305:
	addi	%v0, %zero, 0
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
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8306
	flw	%f0, 4(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 2(%sp)
	j	is_rect_outside.2880
beq_else.8306:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8307
	flw	%f0, 4(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 2(%sp)
	j	is_plane_outside.2885
beq_else.8307:
	flw	%f0, 4(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	lw	%v0, 2(%sp)
	j	is_second_outside.2890
check_all_inside.2900:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%at, %zero, -1
	bne	%a0, %at, beq_else.8308
	addi	%v0, %zero, 1
	jr	%ra
beq_else.8308:
	addi	%a1, %zero, 1
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8309
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v1, 3(%sp)
	j	check_all_inside.2900
beq_else.8309:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_and_group.2906:
	lw	%a0, 1(%k1)
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8310
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8310:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 127
	sw	%v1, 0(%sp)
	sw	%k1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_fast.2840
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 124
	flw	%f0, 0(%v1)
	fsw	%f0, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8311
	addi	%v0, %zero, 0
	j	beq_cont.8312
beq_else.8311:
	flw	%f1, 437(%zero)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
beq_cont.8312:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8313
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2689
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8314
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8314:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8313:
	flw	%f0, 436(%zero)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 67
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 127
	flw	%f2, 0(%v0)
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	addi	%v0, %zero, 127
	flw	%f3, 1(%v0)
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 67
	flw	%f3, 2(%v0)
	fmul	%f0, %f3, %f0
	addi	%v0, %zero, 127
	flw	%f3, 2(%v0)
	fadd	%f0, %f0, %f3
	addi	%v0, %zero, 0
	lw	%v1, 0(%sp)
	fadd	%f29, %f2, %fzero
	fadd	%f2, %f0, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f29, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	check_all_inside.2900
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8315
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8315:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_one_or_group.2909:
	lw	%a0, 1(%k1)
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8316
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8316:
	addi	%a2, %zero, 72
	add	%at, %a2, %a1
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	sw	%v1, 0(%sp)
	sw	%k1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	addi	%k1, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8317
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8317:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_one_or_matrix.2912:
	lw	%a0, 2(%k1)
	lw	%a1, 1(%k1)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	lw	%a3, 0(%a2)
	addi	%at, %zero, -1
	bne	%a3, %at, beq_else.8318
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8318:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%k1, 3(%sp)
	sw	%v0, 4(%sp)
	addi	%at, %zero, 99
	bne	%a3, %at, beq_else.8319
	addi	%v0, %zero, 1
	j	beq_cont.8320
beq_else.8319:
	addi	%t0, %zero, 127
	addi	%a0, %t0, 0
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_fast.2840
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8321
	addi	%v0, %zero, 0
	j	beq_cont.8322
beq_else.8321:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	flw	%f1, 435(%zero)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fless.2592
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8323
	addi	%v0, %zero, 0
	j	beq_cont.8324
beq_else.8323:
	addi	%v0, %zero, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8325
	addi	%v0, %zero, 0
	j	beq_cont.8326
beq_else.8325:
	addi	%v0, %zero, 1
beq_cont.8326:
beq_cont.8324:
beq_cont.8322:
beq_cont.8320:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8327
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%k1, 3(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8327:
	addi	%v0, %zero, 1
	lw	%v1, 0(%sp)
	lw	%k1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8328
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%k1, 3(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8328:
	addi	%v0, %zero, 1
	jr	%ra
solve_each_element.2915:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8329
	jr	%ra
beq_else.8329:
	addi	%a2, %zero, 148
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8331
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	o_isinvert.2689
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8332
	jr	%ra
beq_else.8332:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
beq_else.8331:
	addi	%v1, %zero, 124
	flw	%f1, 0(%v1)
	flw	%f0, 462(%zero)
	sw	%v0, 4(%sp)
	fsw	%f1, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2592
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8334
	j	beq_cont.8335
beq_else.8334:
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	flw	%f0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2592
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8336
	j	beq_cont.8337
beq_else.8336:
	flw	%f0, 436(%zero)
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 148
	flw	%f2, 0(%v1)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	addi	%v1, %zero, 148
	flw	%f3, 1(%v1)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v0)
	fmul	%f3, %f3, %f0
	addi	%v1, %zero, 148
	flw	%f4, 2(%v1)
	fadd	%f3, %f3, %f4
	addi	%v1, %zero, 0
	lw	%a0, 1(%sp)
	fsw	%f3, 6(%sp)
	fsw	%f2, 7(%sp)
	fsw	%f1, 8(%sp)
	fsw	%f0, 9(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	check_all_inside.2900
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8338
	j	beq_cont.8339
beq_else.8338:
	addi	%v0, %zero, 126
	flw	%f0, 9(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 8(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	vecset.2637
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v0, %zero, 130
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 125
	lw	%v1, 4(%sp)
	sw	%v1, 0(%v0)
beq_cont.8339:
beq_cont.8337:
beq_cont.8335:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2915
solve_one_or_network.2919:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8340
	jr	%ra
beq_else.8340:
	addi	%a2, %zero, 72
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
trace_or_matrix.2923:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	addi	%at, %zero, -1
	bne	%a2, %at, beq_else.8342
	jr	%ra
beq_else.8342:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%at, %zero, 99
	bne	%a2, %at, beq_else.8344
	addi	%a2, %zero, 1
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.8345
beq_else.8344:
	addi	%a3, %zero, 148
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	addi	%a0, %a3, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver.2817
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8346
	j	beq_cont.8347
beq_else.8346:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8348
	j	beq_cont.8349
beq_else.8348:
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network.2919
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8349:
beq_cont.8347:
beq_cont.8345:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2923
judge_intersection.2927:
	flw	%f0, 434(%zero)
	addi	%v1, %zero, 126
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 123
	lw	%a0, 0(%a0)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	trace_or_matrix.2923
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	flw	%f0, 435(%zero)
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8350
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8350:
	flw	%f1, 433(%zero)
	flw	%f0, 0(%sp)
	j	fless.2592
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
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8351
	jr	%ra
beq_else.8351:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8353
	addi	%v0, %zero, 1
	lw	%v1, 4(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	o_isinvert.2689
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8354
	jr	%ra
beq_else.8354:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.2929
beq_else.8353:
	addi	%v1, %zero, 124
	flw	%f1, 0(%v1)
	flw	%f0, 462(%zero)
	sw	%v0, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8356
	j	beq_cont.8357
beq_else.8356:
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	flw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fless.2592
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8358
	j	beq_cont.8359
beq_else.8358:
	flw	%f0, 436(%zero)
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 3(%sp)
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 151
	flw	%f2, 0(%v1)
	fadd	%f1, %f1, %f2
	flw	%f2, 1(%v0)
	fmul	%f2, %f2, %f0
	addi	%v1, %zero, 151
	flw	%f3, 1(%v1)
	fadd	%f2, %f2, %f3
	flw	%f3, 2(%v0)
	fmul	%f3, %f3, %f0
	addi	%v0, %zero, 151
	flw	%f4, 2(%v0)
	fadd	%f3, %f3, %f4
	addi	%v0, %zero, 0
	lw	%v1, 2(%sp)
	fsw	%f3, 7(%sp)
	fsw	%f2, 8(%sp)
	fsw	%f1, 9(%sp)
	fsw	%f0, 10(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	fadd	%f2, %f3, %fzero
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	check_all_inside.2900
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8360
	j	beq_cont.8361
beq_else.8360:
	addi	%v0, %zero, 126
	flw	%f0, 10(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 127
	flw	%f0, 9(%sp)
	flw	%f1, 8(%sp)
	flw	%f2, 7(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	vecset.2637
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 130
	lw	%v1, 4(%sp)
	sw	%v1, 0(%v0)
	addi	%v0, %zero, 125
	lw	%v1, 5(%sp)
	sw	%v1, 0(%v0)
beq_cont.8361:
beq_cont.8359:
beq_cont.8357:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.2929
solve_one_or_network_fast.2933:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%at, %zero, -1
	bne	%a1, %at, beq_else.8362
	jr	%ra
beq_else.8362:
	addi	%a2, %zero, 72
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
trace_or_matrix_fast.2937:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	lw	%a2, 0(%a1)
	addi	%at, %zero, -1
	bne	%a2, %at, beq_else.8364
	jr	%ra
beq_else.8364:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%at, %zero, 99
	bne	%a2, %at, beq_else.8366
	addi	%a2, %zero, 1
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	beq_cont.8367
beq_else.8366:
	sw	%a1, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solver_fast2.2858
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8368
	j	beq_cont.8369
beq_else.8368:
	addi	%v0, %zero, 124
	flw	%f0, 0(%v0)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8370
	j	beq_cont.8371
beq_else.8370:
	addi	%v0, %zero, 1
	lw	%v1, 3(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_one_or_network_fast.2933
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8371:
beq_cont.8369:
beq_cont.8367:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2937
judge_intersection_fast.2941:
	flw	%f0, 434(%zero)
	addi	%v1, %zero, 126
	fsw	%f0, 0(%v1)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 123
	lw	%a0, 0(%a0)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	trace_or_matrix_fast.2937
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 126
	flw	%f1, 0(%v0)
	flw	%f0, 435(%zero)
	fsw	%f1, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	fless.2592
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8372
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8372:
	flw	%f1, 433(%zero)
	flw	%f0, 0(%sp)
	j	fless.2592
get_nvector_rect.2943:
	addi	%v1, %zero, 125
	lw	%v1, 0(%v1)
	addi	%a0, %zero, 131
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	vecbzero.2645
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
	addi	%v1, %v0, -1
	addi	%v0, %v0, -1
	lw	%a0, 0(%sp)
	add	%at, %a0, %v0
	flw	%f0, 0(%at)
	sw	%v1, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	sgn.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 131
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
	addi	%v0, %zero, 131
	fsw	%f0, 0(%v0)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	o_param_b.2695
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 1(%v0)
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	o_param_c.2697
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	fneg	%f0, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 2(%v0)
	jr	%ra
get_nvector_second.2947:
	addi	%v1, %zero, 127
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	fsw	%f0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_param_x.2701
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 127
	flw	%f1, 1(%v0)
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
	addi	%v0, %zero, 127
	flw	%f1, 2(%v0)
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8375
	addi	%v0, %zero, 131
	flw	%f0, 7(%sp)
	fsw	%f0, 0(%v0)
	addi	%v0, %zero, 131
	flw	%f0, 8(%sp)
	fsw	%f0, 1(%v0)
	addi	%v0, %zero, 131
	flw	%f0, 9(%sp)
	fsw	%f0, 2(%v0)
	j	beq_cont.8376
beq_else.8375:
	lw	%v0, 0(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	o_param_r3.2721
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r2.2719
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 10(%sp)
	fadd	%f0, %f2, %f0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fhalf.2604
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 0(%v0)
	lw	%v0, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_r3.2721
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_r1.2717
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 6(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 11(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	fhalf.2604
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 1(%v0)
	lw	%v0, 0(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_r2.2719
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 2(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_param_r1.2717
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	fhalf.2604
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 9(%sp)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 131
	fsw	%f0, 2(%v0)
beq_cont.8376:
	lw	%v0, 0(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_isinvert.2689
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 131
	j	vecunit_sgn.2655
get_nvector.2949:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2685
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8377
	lw	%v0, 1(%sp)
	j	get_nvector_rect.2943
beq_else.8377:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8378
	lw	%v0, 0(%sp)
	j	get_nvector_plane.2945
beq_else.8378:
	lw	%v0, 0(%sp)
	j	get_nvector_second.2947
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
	addi	%v0, %zero, 134
	fsw	%f0, 0(%v0)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_color_green.2713
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 134
	fsw	%f0, 1(%v0)
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	o_color_blue.2715
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 134
	fsw	%f0, 2(%v0)
	lw	%v0, 2(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8379
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
	flw	%f1, 423(%zero)
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	flw	%f2, 422(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	flw	%f1, 425(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	fless.2592
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	flw	%f0, 2(%v1)
	lw	%v1, 1(%sp)
	sw	%v0, 4(%sp)
	fsw	%f0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	o_param_z.2705
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 5(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 423(%zero)
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	flw	%f2, 422(%zero)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	flw	%f1, 425(%zero)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fless.2592
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 4(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8380
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8382
	flw	%f0, 427(%zero)
	j	beq_cont.8383
beq_else.8382:
	flw	%f0, 462(%zero)
beq_cont.8383:
	j	beq_cont.8381
beq_else.8380:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8384
	flw	%f0, 462(%zero)
	j	beq_cont.8385
beq_else.8384:
	flw	%f0, 427(%zero)
beq_cont.8385:
beq_cont.8381:
	addi	%v0, %zero, 134
	fsw	%f0, 1(%v0)
	jr	%ra
beq_else.8379:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8387
	lw	%v0, 0(%sp)
	flw	%f0, 1(%v0)
	flw	%f1, 424(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	sin.2618
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	fsqr.2606
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 427(%zero)
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 134
	fsw	%f1, 0(%v0)
	flw	%f1, 427(%zero)
	flw	%f2, 457(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 134
	fsw	%f0, 1(%v0)
	jr	%ra
beq_else.8387:
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8389
	lw	%v0, 0(%sp)
	flw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	o_param_x.2701
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 2(%v0)
	lw	%v0, 1(%sp)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_z.2705
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 7(%sp)
	fsw	%f0, 9(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fsqr.2606
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fsw	%f0, 10(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fsqr.2606
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	flw	%f1, 425(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fmul	%f0, %f0, %f1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	cos.2616
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	fsqr.2606
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 427(%zero)
	fmul	%f1, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f1, 1(%v0)
	flw	%f1, 457(%zero)
	fsub	%f0, %f1, %f0
	flw	%f1, 427(%zero)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f0, 2(%v0)
	jr	%ra
beq_else.8389:
	addi	%at, %zero, 4
	bne	%v0, %at, beq_else.8391
	lw	%v0, 0(%sp)
	flw	%f0, 0(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_param_x.2701
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_param_a.2693
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 12(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 0(%sp)
	flw	%f1, 2(%v0)
	lw	%v1, 1(%sp)
	fsw	%f0, 13(%sp)
	fsw	%f1, 14(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_param_z.2705
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	o_param_c.2697
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 15(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 13(%sp)
	fsw	%f0, 16(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	fsqr.2606
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fsw	%f0, 17(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	fsqr.2606
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f1, 17(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 13(%sp)
	fabs	%f2, %f1
	flw	%f3, 432(%zero)
	fsw	%f0, 18(%sp)
	fadd	%f1, %f3, %fzero
	fadd	%f0, %f2, %fzero
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fless.2592
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8392
	flw	%f0, 13(%sp)
	flw	%f1, 16(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	atan.2620
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 430(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fdiv	%f0, %f0, %f1
	j	beq_cont.8393
beq_else.8392:
	flw	%f0, 431(%zero)
beq_cont.8393:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	lw	%v0, 0(%sp)
	flw	%f1, 1(%v0)
	lw	%v0, 1(%sp)
	fsw	%f0, 19(%sp)
	fsw	%f1, 20(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	o_param_y.2703
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f1, 20(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 1(%sp)
	fsw	%f0, 21(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	o_param_b.2695
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	fsqrt	%f0, %f0
	flw	%f1, 21(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 18(%sp)
	fabs	%f2, %f1
	flw	%f3, 432(%zero)
	fsw	%f0, 22(%sp)
	fadd	%f1, %f3, %fzero
	fadd	%f0, %f2, %fzero
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	fless.2592
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8394
	flw	%f0, 18(%sp)
	flw	%f1, 22(%sp)
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	atan.2620
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 430(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 429(%zero)
	fdiv	%f0, %f0, %f1
	j	beq_cont.8395
beq_else.8394:
	flw	%f0, 431(%zero)
beq_cont.8395:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 428(%zero)
	flw	%f2, 461(%zero)
	flw	%f3, 19(%sp)
	fsub	%f2, %f2, %f3
	fsw	%f0, 23(%sp)
	fsw	%f1, 24(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	fsqr.2606
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f1, 24(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 461(%zero)
	flw	%f2, 23(%sp)
	fsub	%f1, %f1, %f2
	fsw	%f0, 25(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	fsqr.2606
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f1, 25(%sp)
	fsub	%f0, %f1, %f0
	fsw	%f0, 26(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	fisneg.2597
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8396
	flw	%f0, 26(%sp)
	j	beq_cont.8397
beq_else.8396:
	flw	%f0, 462(%zero)
beq_cont.8397:
	flw	%f1, 427(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 426(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 134
	fsw	%f0, 2(%v0)
	jr	%ra
beq_else.8391:
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8400
	j	beq_cont.8401
beq_else.8400:
	addi	%v1, %zero, 134
	addi	%v0, %zero, 140
	flw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	vecaccum.2666
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
beq_cont.8401:
	flw	%f0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	fispos.2595
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8402
	jr	%ra
beq_else.8402:
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
	addi	%v0, %zero, 140
	flw	%f1, 0(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 140
	flw	%f1, 1(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 140
	flw	%f1, 2(%v0)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f0, 2(%v0)
	jr	%ra
trace_reflections.2959:
	lw	%a0, 1(%k1)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8405
	addi	%a1, %zero, 234
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	sw	%k1, 0(%sp)
	sw	%v0, 1(%sp)
	fsw	%f1, 2(%sp)
	sw	%v1, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%a1, 6(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	r_dvec.2750
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8406
	j	beq_cont.8407
beq_else.8406:
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 125
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 6(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	r_surface_id.2748
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	bne	%v1, %v0, beq_else.8408
	addi	%v0, %zero, 0
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	lw	%k1, 5(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8410
	lw	%v0, 7(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	d_vec.2744
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 131
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veciprod.2658
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 6(%sp)
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	r_bright.2752
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 4(%sp)
	fmul	%f2, %f0, %f1
	flw	%f3, 9(%sp)
	fmul	%f2, %f2, %f3
	lw	%v0, 7(%sp)
	fsw	%f2, 10(%sp)
	fsw	%f0, 11(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	d_vec.2744
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 3(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	veciprod.2658
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 10(%sp)
	flw	%f2, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	add_light.2955
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	beq_cont.8411
beq_else.8410:
beq_cont.8411:
	j	beq_cont.8409
beq_else.8408:
beq_cont.8409:
beq_cont.8407:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 4(%sp)
	flw	%f1, 2(%sp)
	lw	%v1, 3(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8405:
	jr	%ra
trace_ray.2964:
	lw	%a1, 2(%k1)
	lw	%a2, 1(%k1)
	addi	%at, %zero, 4
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.8413
	sw	%k1, 0(%sp)
	fsw	%f1, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a2, 3(%sp)
	sw	%a0, 4(%sp)
	fsw	%f0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%v1, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	p_surface_ids.2729
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	judge_intersection.2927
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8414
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 8(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.8415
	jr	%ra
beq_else.8415:
	addi	%v1, %zero, 67
	lw	%v0, 7(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veciprod.2658
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	fneg	%f0, %f0
	fsw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fispos.2595
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8417
	jr	%ra
beq_else.8417:
	flw	%f0, 9(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	fsqr.2606
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	flw	%f1, 9(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 70
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 140
	flw	%f1, 0(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f1, 0(%v0)
	addi	%v0, %zero, 140
	flw	%f1, 1(%v0)
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f1, 1(%v0)
	addi	%v0, %zero, 140
	flw	%f1, 2(%v0)
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 140
	fsw	%f0, 2(%v0)
	jr	%ra
beq_else.8414:
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	sw	%v0, 10(%sp)
	sw	%v1, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	o_reflectiontype.2687
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	o_diffuse.2707
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 11(%sp)
	lw	%v1, 7(%sp)
	fsw	%f0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	get_nvector.2949
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v1, %zero, 127
	addi	%v0, %zero, 148
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	veccpy.2647
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v1, %zero, 127
	lw	%v0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	utexture.2952
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 10(%sp)
	sll	%v0, %v0, 2
	addi	%v1, %zero, 125
	lw	%v1, 0(%v1)
	add	%v0, %v0, %v1
	lw	%v1, 6(%sp)
	lw	%a0, 8(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	p_intersection_points.2727
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 127
	addi	%v1, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	veccpy.2647
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 11(%sp)
	sw	%v0, 14(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	o_diffuse.2707
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 461(%zero)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	fless.2592
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8420
	addi	%v0, %zero, 1
	lw	%v1, 6(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	p_energy.2733
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 134
	sw	%v0, 15(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	veccpy.2647
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 15(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	flw	%f0, 421(%zero)
	flw	%f1, 13(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	vecscale.2676
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	p_nvectors.2742
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 131
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	veccpy.2647
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	beq_cont.8421
beq_else.8420:
	addi	%v0, %zero, 0
	lw	%v1, 6(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
beq_cont.8421:
	flw	%f0, 420(%zero)
	addi	%v1, %zero, 131
	lw	%v0, 7(%sp)
	fsw	%f0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	veciprod.2658
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	addi	%v1, %zero, 131
	lw	%v0, 7(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	vecaccum.2666
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 11(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	o_hilight.2709
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 0
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	lw	%k1, 3(%sp)
	fsw	%f0, 17(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8422
	addi	%v1, %zero, 67
	addi	%v0, %zero, 131
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	veciprod.2658
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	fneg	%f0, %f0
	flw	%f1, 13(%sp)
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 67
	lw	%v0, 7(%sp)
	fsw	%f0, 18(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	veciprod.2658
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	fneg	%f1, %f0
	flw	%f0, 18(%sp)
	flw	%f2, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	add_light.2955
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	beq_cont.8423
beq_else.8422:
beq_cont.8423:
	addi	%v0, %zero, 127
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	setup_startp.2878
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v0, %zero, 414
	lw	%v0, 0(%v0)
	addi	%v0, %v0, -1
	flw	%f0, 13(%sp)
	flw	%f1, 17(%sp)
	lw	%v1, 7(%sp)
	lw	%k1, 2(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f0, 419(%zero)
	flw	%f1, 5(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	fless.2592
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8424
	jr	%ra
beq_else.8424:
	lw	%v0, 6(%sp)
	slti	%at, %v0, 4
	bne	%at, %zero, beq_else.8426
	j	beq_cont.8427
beq_else.8426:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 8(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
beq_cont.8427:
	lw	%v1, 12(%sp)
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.8428
	flw	%f0, 457(%zero)
	lw	%v1, 11(%sp)
	fsw	%f0, 19(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	o_diffuse.2707
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 19(%sp)
	fsub	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, 126
	flw	%f1, 0(%v1)
	flw	%f2, 1(%sp)
	fadd	%f1, %f2, %f1
	lw	%v1, 7(%sp)
	lw	%a0, 4(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8428:
	jr	%ra
beq_else.8413:
	jr	%ra
trace_diffuse_ray.2970:
	lw	%v1, 1(%k1)
	fsw	%f0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	judge_intersection_fast.2941
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8431
	jr	%ra
beq_else.8431:
	addi	%v0, %zero, 130
	lw	%v0, 0(%v0)
	addi	%v1, %zero, 1
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
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
	addi	%v1, %zero, 127
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	utexture.2952
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 0
	addi	%v1, %zero, 123
	lw	%v1, 0(%v1)
	lw	%k1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8433
	addi	%v1, %zero, 67
	addi	%v0, %zero, 131
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
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8434
	flw	%f0, 462(%zero)
	j	beq_cont.8435
beq_else.8434:
	flw	%f0, 4(%sp)
beq_cont.8435:
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
	addi	%v1, %zero, 134
	addi	%v0, %zero, 137
	j	vecaccum.2666
beq_else.8433:
	jr	%ra
iter_trace_diffuse_rays.2973:
	lw	%a2, 1(%k1)
	slti	%at, %a1, 0
	bne	%at, %zero, beq_else.8437
	add	%at, %v0, %a1
	lw	%a3, 0(%at)
	sw	%a0, 0(%sp)
	sw	%k1, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v0, 4(%sp)
	sw	%v1, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	d_vec.2744
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	veciprod.2658
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	fsw	%f0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	fisneg.2597
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8438
	lw	%v0, 3(%sp)
	lw	%v1, 4(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	flw	%f0, 417(%zero)
	flw	%f1, 6(%sp)
	fdiv	%f0, %f1, %f0
	lw	%k1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	beq_cont.8439
beq_else.8438:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	flw	%f0, 418(%zero)
	flw	%f1, 6(%sp)
	fdiv	%f0, %f1, %f0
	lw	%k1, 2(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
beq_cont.8439:
	lw	%v0, 3(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 4(%sp)
	lw	%v1, 5(%sp)
	lw	%a0, 0(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8437:
	jr	%ra
trace_diffuse_rays.2978:
	lw	%a1, 1(%k1)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%a1, 3(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	setup_startp.2878
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	lw	%k1, 3(%sp)
	lw	%at, 0(%k1)
	jr	%at
trace_diffuse_ray_80percent.2982:
	lw	%k1, 1(%k1)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%k1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8441
	j	beq_cont.8442
beq_else.8441:
	addi	%a1, %zero, 166
	lw	%a1, 0(%a1)
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8442:
	lw	%v0, 3(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8443
	j	beq_cont.8444
beq_else.8443:
	addi	%v1, %zero, 166
	lw	%v1, 1(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	lw	%k1, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8444:
	lw	%v0, 3(%sp)
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8445
	j	beq_cont.8446
beq_else.8445:
	addi	%v1, %zero, 166
	lw	%v1, 2(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	lw	%k1, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8446:
	lw	%v0, 3(%sp)
	addi	%at, %zero, 3
	bne	%v0, %at, beq_else.8447
	j	beq_cont.8448
beq_else.8447:
	addi	%v1, %zero, 166
	lw	%v1, 3(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	lw	%k1, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8448:
	lw	%v0, 3(%sp)
	addi	%at, %zero, 4
	bne	%v0, %at, beq_else.8449
	jr	%ra
beq_else.8449:
	addi	%v0, %zero, 166
	lw	%v0, 4(%v0)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	lw	%k1, 2(%sp)
	lw	%at, 0(%k1)
	jr	%at
calc_diffuse_using_1point.2986:
	lw	%a0, 1(%k1)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_nvectors.2742
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	p_intersection_points.2727
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 2(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_energy.2733
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 3(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 137
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	veccpy.2647
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 2(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	p_group_id.2737
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 5(%sp)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	lw	%k1, 0(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %zero, 140
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
	sw	%v0, 5(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	lw	%a1, 2(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	sw	%v0, 6(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 137
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veccpy.2647
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 5(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecadd.2670
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecadd.2670
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 7(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecadd.2670
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 8(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecadd.2670
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	p_energy.2733
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	addi	%a0, %zero, 137
	addi	%v0, %zero, 140
	j	vecaccumv.2679
do_without_neighbors.2995:
	lw	%a0, 1(%k1)
	addi	%at, %zero, 4
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8451
	sw	%k1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v0, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_surface_ids.2729
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8452
	lw	%v0, 2(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 3(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8453
	j	beq_cont.8454
beq_else.8453:
	lw	%v0, 2(%sp)
	lw	%k1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
beq_cont.8454:
	lw	%v0, 3(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 2(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8452:
	jr	%ra
beq_else.8451:
	jr	%ra
neighbors_exist.2998:
	addi	%a0, %zero, 143
	lw	%a0, 1(%a0)
	addi	%a1, %v1, 1
	slt	%at, %a1, %a0
	bne	%at, %zero, beq_else.8457
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8457:
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8458
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8458:
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%a0, %v0, 1
	slt	%at, %a0, %v1
	bne	%at, %zero, beq_else.8459
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8459:
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.8460
	addi	%v0, %zero, 0
	jr	%ra
beq_else.8460:
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
	bne	%v0, %v1, beq_else.8461
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
	bne	%v0, %v1, beq_else.8462
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
	bne	%v0, %v1, beq_else.8463
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
	bne	%v0, %v1, beq_else.8464
	addi	%v0, %zero, 1
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
beq_else.8461:
	addi	%v0, %zero, 0
	jr	%ra
try_exploit_neighbors.3011:
	lw	%t0, 1(%k1)
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	addi	%at, %zero, 4
	slt	%at, %at, %a3
	bne	%at, %zero, beq_else.8465
	sw	%v1, 0(%sp)
	sw	%k1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%a3, 4(%sp)
	sw	%a2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	get_surface_id.3002
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8466
	lw	%v0, 8(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 6(%sp)
	lw	%a1, 5(%sp)
	lw	%a2, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	neighbors_are_available.3005
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8467
	lw	%v0, 8(%sp)
	lw	%v1, 6(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 4(%sp)
	lw	%k1, 3(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8467:
	lw	%v0, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%a2, 4(%sp)
	add	%at, %v0, %a2
	lw	%v0, 0(%at)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8468
	j	beq_cont.8469
beq_else.8468:
	lw	%v0, 8(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 6(%sp)
	lw	%a1, 5(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_diffuse_using_5points.2989
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
beq_cont.8469:
	lw	%v0, 4(%sp)
	addi	%a3, %v0, 1
	lw	%v0, 8(%sp)
	lw	%v1, 0(%sp)
	lw	%a0, 7(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 5(%sp)
	lw	%k1, 1(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8466:
	jr	%ra
beq_else.8465:
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
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 143
	lw	%v0, 0(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2627
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 143
	lw	%v0, 1(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2627
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 255
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	print_int.2627
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
write_rgb_element.3020:
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.8472
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8474
	j	beq_cont.8475
beq_else.8474:
	addi	%v0, %zero, 0
beq_cont.8475:
	j	beq_cont.8473
beq_else.8472:
	addi	%v0, %zero, 255
beq_cont.8473:
	j	print_int.2627
write_rgb.3022:
	addi	%v0, %zero, 140
	flw	%f0, 0(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	write_rgb_element.3020
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 140
	flw	%f0, 1(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	write_rgb_element.3020
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_char
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 140
	flw	%f0, 2(%v0)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	write_rgb_element.3020
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.3024:
	lw	%a0, 1(%k1)
	addi	%at, %zero, 4
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.8476
	sw	%k1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	get_surface_id.3002
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8477
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_calc_diffuse.2731
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8478
	j	beq_cont.8479
beq_else.8478:
	lw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	p_group_id.2737
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 137
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	vecbzero.2645
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 3(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	p_nvectors.2742
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 3(%sp)
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_intersection_points.2727
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 166
	lw	%a0, 4(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	lw	%a0, 2(%sp)
	lw	%a1, 5(%sp)
	add	%at, %a1, %a0
	lw	%a1, 0(%at)
	add	%at, %v0, %a0
	lw	%v0, 0(%at)
	lw	%k1, 1(%sp)
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	p_received_ray_20percent.2735
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	addi	%a0, %zero, 137
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	veccpy.2647
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
beq_cont.8479:
	lw	%v0, 2(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 3(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8477:
	jr	%ra
beq_else.8476:
	jr	%ra
pretrace_pixels.3027:
	lw	%a1, 2(%k1)
	lw	%a2, 1(%k1)
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8482
	addi	%a3, %zero, 147
	flw	%f3, 0(%a3)
	addi	%a3, %zero, 145
	lw	%a3, 0(%a3)
	sub	%a3, %v1, %a3
	itof	%f4, %a3
	fmul	%f3, %f3, %f4
	addi	%a3, %zero, 154
	flw	%f4, 0(%a3)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	addi	%a3, %zero, 163
	fsw	%f4, 0(%a3)
	addi	%a3, %zero, 154
	flw	%f4, 1(%a3)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	addi	%a3, %zero, 163
	fsw	%f4, 1(%a3)
	addi	%a3, %zero, 154
	flw	%f4, 2(%a3)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f3, %f2
	addi	%a3, %zero, 163
	fsw	%f3, 2(%a3)
	addi	%a3, %zero, 0
	addi	%t0, %zero, 163
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%k1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecunit_sgn.2655
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 140
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	vecbzero.2645
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 64
	addi	%v0, %zero, 148
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veccpy.2647
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 457(%zero)
	lw	%v1, 7(%sp)
	lw	%a0, 8(%sp)
	add	%at, %a0, %v1
	lw	%a1, 0(%at)
	flw	%f1, 462(%zero)
	addi	%a2, %zero, 163
	lw	%k1, 6(%sp)
	addi	%a0, %a1, 0
	addi	%v1, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 8(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	p_rgb.2725
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 140
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	veccpy.2647
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 8(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 5(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	p_set_group_id.2739
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 8(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%k1, 4(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -1
	addi	%v1, %zero, 1
	lw	%a0, 5(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	add_mod5.2634
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%a0, %v0, 0
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 9(%sp)
	lw	%k1, 3(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.8482:
	jr	%ra
pretrace_line.3034:
	lw	%k1, 1(%k1)
	addi	%a1, %zero, 147
	flw	%f0, 0(%a1)
	addi	%a1, %zero, 145
	lw	%a1, 1(%a1)
	sub	%v1, %v1, %a1
	itof	%f1, %v1
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 157
	flw	%f1, 0(%v1)
	fmul	%f1, %f0, %f1
	addi	%v1, %zero, 160
	flw	%f2, 0(%v1)
	fadd	%f1, %f1, %f2
	addi	%v1, %zero, 157
	flw	%f2, 1(%v1)
	fmul	%f2, %f0, %f2
	addi	%v1, %zero, 160
	flw	%f3, 1(%v1)
	fadd	%f2, %f2, %f3
	addi	%v1, %zero, 157
	flw	%f3, 2(%v1)
	fmul	%f0, %f0, %f3
	addi	%v1, %zero, 160
	flw	%f3, 2(%v1)
	fadd	%f0, %f0, %f3
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -1
	fadd	%f29, %f2, %fzero
	fadd	%f2, %f0, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f29, %fzero
	lw	%at, 0(%k1)
	jr	%at
scan_pixel.3038:
	lw	%a3, 2(%k1)
	lw	%t0, 1(%k1)
	addi	%t1, %zero, 143
	lw	%t1, 0(%t1)
	slt	%at, %v0, %t1
	bne	%at, %zero, beq_else.8484
	jr	%ra
beq_else.8484:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	sw	%k1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%a1, 4(%sp)
	sw	%a2, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	p_rgb.2725
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 140
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	veccpy.2647
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	neighbors_exist.2998
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8486
	lw	%v0, 7(%sp)
	lw	%v1, 4(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%k1, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	beq_cont.8487
beq_else.8486:
	addi	%a3, %zero, 0
	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 5(%sp)
	lw	%k1, 2(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
beq_cont.8487:
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	write_rgb.3022
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 4(%sp)
	lw	%a2, 5(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
scan_line.3044:
	lw	%a3, 2(%k1)
	lw	%t0, 1(%k1)
	addi	%t1, %zero, 143
	lw	%t1, 1(%t1)
	slt	%at, %v0, %t1
	bne	%at, %zero, beq_else.8488
	jr	%ra
beq_else.8488:
	addi	%t1, %zero, 143
	lw	%t1, 1(%t1)
	addi	%t1, %t1, -1
	sw	%k1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	sw	%a3, 6(%sp)
	slt	%at, %v0, %t1
	bne	%at, %zero, beq_else.8490
	j	beq_cont.8491
beq_else.8490:
	addi	%t1, %v0, 1
	addi	%a0, %a2, 0
	addi	%v1, %t1, 0
	addi	%v0, %a1, 0
	addi	%k1, %t0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
beq_cont.8491:
	addi	%v0, %zero, 0
	lw	%v1, 5(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 2(%sp)
	lw	%k1, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, 2
	lw	%a0, 1(%sp)
	sw	%v0, 7(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	add_mod5.2634
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a2, %v0, 0
	lw	%v0, 7(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%a1, 4(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
create_float5x3array.3050:
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 462(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 1(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 2(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 3(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %v1
	jr	%ra
create_pixel.3052:
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
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
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	create_float5x3array.3050
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	create_float5x3array.3050
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	create_float5x3array.3050
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 7(%v1)
	lw	%v0, 6(%sp)
	sw	%v0, 6(%v1)
	lw	%v0, 5(%sp)
	sw	%v0, 5(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 3(%sp)
	sw	%v0, 3(%v1)
	lw	%v0, 2(%sp)
	sw	%v0, 2(%v1)
	lw	%v0, 1(%sp)
	sw	%v0, 1(%v1)
	lw	%v0, 0(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	jr	%ra
init_line_elements.3054:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8492
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
beq_else.8492:
	jr	%ra
create_pixelline.3057:
	addi	%v0, %zero, 143
	lw	%v0, 0(%v0)
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
	addi	%v1, %zero, 143
	lw	%v1, 0(%v1)
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
	fadd	%f0, %f1, %fzero
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
	flw	%f2, 419(%zero)
	fadd	%f0, %f0, %f2
	fsqrt	%f0, %f0
	flw	%f2, 457(%zero)
	fdiv	%f2, %f2, %f0
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fadd	%f0, %f2, %fzero
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
	slti	%at, %v0, 5
	bne	%at, %zero, beq_else.8493
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
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	fsqr.2606
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 457(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 2(%sp)
	fdiv	%f1, %f1, %f0
	flw	%f2, 3(%sp)
	fdiv	%f2, %f2, %f0
	flw	%f3, 457(%zero)
	fdiv	%f0, %f3, %f0
	addi	%v0, %zero, 166
	lw	%v1, 1(%sp)
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v1, 0(%sp)
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 5(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f2, 7(%sp)
	fsw	%f1, 8(%sp)
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
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
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
	fadd	%f2, %f3, %fzero
	fadd	%f0, %f4, %fzero
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
	fadd	%f2, %f5, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
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
	fadd	%f2, %f4, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
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
beq_else.8493:
	fsw	%f2, 9(%sp)
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f3, 10(%sp)
	sw	%v0, 11(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
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
	fadd	%f1, %f0, %fzero
	flw	%f0, 12(%sp)
	flw	%f2, 9(%sp)
	flw	%f3, 10(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	calc_dirvec.3064
calc_dirvecs.3072:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8494
	itof	%f1, %v0
	flw	%f2, 453(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 416(%zero)
	fsub	%f2, %f1, %f2
	addi	%a1, %zero, 0
	flw	%f1, 462(%zero)
	flw	%f3, 462(%zero)
	fsw	%f0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v0, %a1, 0
	fadd	%f29, %f3, %fzero
	fadd	%f3, %f0, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f29, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_dirvec.3064
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	itof	%f0, %v0
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 419(%zero)
	fadd	%f2, %f0, %f1
	addi	%v1, %zero, 0
	flw	%f0, 462(%zero)
	flw	%f1, 462(%zero)
	lw	%a0, 2(%sp)
	addi	%a1, %a0, 2
	flw	%f3, 0(%sp)
	lw	%a2, 1(%sp)
	addi	%a0, %a1, 0
	addi	%v0, %v1, 0
	addi	%v1, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	calc_dirvec.3064
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	addi	%v1, %zero, 1
	lw	%a0, 1(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	add_mod5.2634
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 0(%sp)
	lw	%v0, 4(%sp)
	lw	%a0, 2(%sp)
	j	calc_dirvecs.3072
beq_else.8494:
	jr	%ra
calc_dirvec_rows.3077:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8496
	itof	%f0, %v0
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 416(%zero)
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
beq_else.8496:
	jr	%ra
create_dirvec.3081:
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
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
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8498
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
beq_else.8498:
	jr	%ra
create_dirvecs.3086:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8500
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
	addi	%v1, %zero, 166
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %zero, 166
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
beq_else.8500:
	jr	%ra
init_dirvec_constants.3088:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.8502
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
beq_else.8502:
	jr	%ra
init_vecset_constants.3091:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8504
	addi	%v1, %zero, 166
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
beq_else.8504:
	jr	%ra
init_dirvecs.3093:
	addi	%v0, %zero, 4
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	create_dirvecs.3086
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 9
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	calc_dirvec_rows.3077
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 4
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
	addi	%v1, %zero, 234
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	sw	%v0, 0(%at)
	jr	%ra
setup_rect_reflection.3102:
	sll	%v0, %v0, 2
	addi	%a0, %zero, 414
	lw	%a0, 0(%a0)
	flw	%f0, 457(%zero)
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
	addi	%v0, %zero, 67
	flw	%f1, 0(%v0)
	fneg	%f1, %f1
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fneg	%f2, %f2
	addi	%v0, %zero, 67
	flw	%f3, 2(%v0)
	fneg	%f3, %f3
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	addi	%a0, %zero, 67
	flw	%f4, 0(%a0)
	lw	%a0, 0(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f3, 4(%sp)
	fsw	%f1, 5(%sp)
	fsw	%f0, 6(%sp)
	addi	%v0, %a0, 0
	fadd	%f1, %f4, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	add_reflection.3095
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 1
	lw	%a0, 1(%sp)
	addi	%a1, %a0, 2
	addi	%a2, %zero, 67
	flw	%f2, 1(%a2)
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f3, 4(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	add_reflection.3095
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 2
	lw	%a0, 1(%sp)
	addi	%a0, %a0, 3
	addi	%a1, %zero, 67
	flw	%f3, 2(%a1)
	flw	%f0, 6(%sp)
	flw	%f1, 5(%sp)
	flw	%f2, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	add_reflection.3095
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 3
	addi	%v1, %zero, 414
	sw	%v0, 0(%v1)
	jr	%ra
setup_surface_reflection.3105:
	sll	%v0, %v0, 2
	addi	%v0, %v0, 1
	addi	%a0, %zero, 414
	lw	%a0, 0(%a0)
	flw	%f0, 457(%zero)
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
	addi	%v0, %zero, 67
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	veciprod.2658
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 448(%zero)
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
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 67
	flw	%f2, 0(%v0)
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 7(%sp)
	fsw	%f2, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	o_param_b.2695
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	flw	%f1, 8(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 67
	flw	%f2, 1(%v0)
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	lw	%v0, 2(%sp)
	fsw	%f0, 9(%sp)
	fsw	%f2, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	o_param_c.2697
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 10(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 67
	flw	%f1, 2(%v0)
	fsub	%f3, %f0, %f1
	flw	%f0, 4(%sp)
	flw	%f1, 7(%sp)
	flw	%f2, 9(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	add_reflection.3095
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, 414
	sw	%v0, 0(%v1)
	jr	%ra
setup_reflections.3108:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.8509
	addi	%v1, %zero, 1
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
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8510
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_diffuse.2707
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 457(%zero)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	fless.2592
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.8511
	jr	%ra
beq_else.8511:
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	o_form.2685
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.8513
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	j	setup_rect_reflection.3102
beq_else.8513:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.8514
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	j	setup_surface_reflection.3105
beq_else.8514:
	jr	%ra
beq_else.8510:
	jr	%ra
beq_else.8509:
	jr	%ra
rt.3110:
	lw	%a0, 3(%k1)
	lw	%a1, 2(%k1)
	lw	%a2, 1(%k1)
	addi	%a3, %zero, 143
	sw	%v0, 0(%a3)
	addi	%a3, %zero, 143
	sw	%v1, 1(%a3)
	srl	%a3, %v0, 1
	addi	%t0, %zero, 145
	sw	%a3, 0(%t0)
	srl	%v1, %v1, 1
	addi	%a3, %zero, 145
	sw	%v1, 1(%a3)
	flw	%f0, 415(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 147
	fsw	%f0, 0(%v0)
	sw	%a0, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%a2, 2(%sp)
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
	jal	create_pixelline.3057
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_parameter.2775
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	write_ppm_header.3018
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	init_dirvecs.3093
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	d_vec.2744
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 67
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	veccpy.2647
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_dirvec_constants.2873
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 0
	lw	%v0, 0(%v0)
	addi	%v0, %v0, -1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	setup_reflections.3108
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	lw	%v0, 4(%sp)
	lw	%k1, 1(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 0
	addi	%a2, %zero, 2
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 5(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 1
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v1, %zero, 60
	addi	%a0, %zero, 0
	addi	%a1, %zero, 0
	addi	%a2, %zero, 0
	addi	%a3, %zero, 0
	addi	%t0, %zero, 0
	add	%t1, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%t1)
	sw	%v0, 9(%t1)
	sw	%v0, 8(%t1)
	sw	%v0, 7(%t1)
	sw	%t0, 6(%t1)
	sw	%v0, 5(%t1)
	sw	%v0, 4(%t1)
	sw	%a3, 3(%t1)
	sw	%a2, 2(%t1)
	sw	%a1, 1(%t1)
	sw	%a0, 0(%t1)
	add	%v0, %zero, %t1
	addi	%a0, %zero, 1
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 61
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 64
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 67
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 427(%zero)
	addi	%v1, %zero, 70
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%v0, %zero, 50
	addi	%v1, %zero, 1
	addi	%a0, %zero, -1
	addi	%a1, %zero, 71
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_extarray
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%a0, %zero, 72
	addi	%v1, %zero, 71
	lw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_create_extarray
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 1
	addi	%a0, %zero, 72
	lw	%a0, 0(%a0)
	addi	%a1, %zero, 122
	sw	%v0, 1(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%a0, %zero, 123
	addi	%v1, %zero, 122
	lw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 124
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 125
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 434(%zero)
	addi	%v1, %zero, 126
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 127
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 130
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 131
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 134
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 137
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 140
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	addi	%a0, %zero, 143
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	addi	%a0, %zero, 145
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 147
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 148
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 151
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 154
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 157
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 160
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 163
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 166
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 166
	addi	%a1, %zero, 166
	sw	%v0, 2(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 0
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	lw	%v0, 2(%sp)
	sw	%v0, 0(%a0)
	add	%v0, %zero, %a0
	addi	%a0, %zero, 166
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 5
	addi	%a0, %zero, 166
	addi	%v1, %zero, 166
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 171
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 462(%zero)
	addi	%v1, %zero, 171
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 60
	addi	%a0, %zero, 174
	addi	%a1, %zero, 171
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_create_extarray
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 3(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 0
	flw	%f0, 462(%zero)
	addi	%a0, %zero, 234
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %zero, 0
	addi	%a0, %zero, 234
	addi	%a1, %zero, 234
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 5(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	addi	%a0, %zero, 0
	flw	%f0, 462(%zero)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f0, 2(%a1)
	sw	%v0, 1(%a1)
	sw	%a0, 0(%a1)
	add	%v0, %zero, %a1
	addi	%a0, %zero, 234
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	addi	%a0, %zero, 414
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_extarray
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%v1, %zero, shadow_check_and_group.2906
	sw	%v1, 0(%v0)
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a1, %zero, shadow_check_one_or_group.2909
	sw	%a1, 0(%a0)
	sw	%v0, 1(%a0)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%a1, %zero, shadow_check_one_or_matrix.2912
	sw	%a1, 0(%v0)
	sw	%a0, 2(%v0)
	sw	%v1, 1(%v0)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a1, %zero, trace_reflections.2959
	sw	%a1, 0(%a0)
	sw	%v0, 1(%a0)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 3
	addi	%a2, %zero, trace_ray.2964
	sw	%a2, 0(%a1)
	sw	%a0, 2(%a1)
	sw	%v0, 1(%a1)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a2, %zero, trace_diffuse_ray.2970
	sw	%a2, 0(%a0)
	sw	%v0, 1(%a0)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a2, %zero, iter_trace_diffuse_rays.2973
	sw	%a2, 0(%v0)
	sw	%a0, 1(%v0)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a2, %zero, trace_diffuse_rays.2978
	sw	%a2, 0(%a0)
	sw	%v0, 1(%a0)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a2, %zero, trace_diffuse_ray_80percent.2982
	sw	%a2, 0(%v0)
	sw	%a0, 1(%v0)
	add	%a2, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a3, %zero, calc_diffuse_using_1point.2986
	sw	%a3, 0(%a2)
	sw	%v0, 1(%a2)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a3, %zero, do_without_neighbors.2995
	sw	%a3, 0(%v0)
	sw	%a2, 1(%v0)
	add	%a2, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a3, %zero, try_exploit_neighbors.3011
	sw	%a3, 0(%a2)
	sw	%v0, 1(%a2)
	add	%a3, %zero, %hp
	addi	%hp, %hp, 2
	addi	%t0, %zero, pretrace_diffuse_rays.3024
	sw	%t0, 0(%a3)
	sw	%a0, 1(%a3)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%t0, %zero, pretrace_pixels.3027
	sw	%t0, 0(%a0)
	sw	%a1, 2(%a0)
	sw	%a3, 1(%a0)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a3, %zero, pretrace_line.3034
	sw	%a3, 0(%a1)
	sw	%a0, 1(%a1)
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%a3, %zero, scan_pixel.3038
	sw	%a3, 0(%a0)
	sw	%a2, 2(%a0)
	sw	%v0, 1(%a0)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	addi	%a2, %zero, scan_line.3044
	sw	%a2, 0(%v0)
	sw	%a0, 2(%v0)
	sw	%a1, 1(%v0)
	add	%k1, %zero, %hp
	addi	%hp, %hp, 4
	addi	%a0, %zero, rt.3110
	sw	%a0, 0(%k1)
	sw	%v0, 3(%k1)
	sw	%a1, 2(%k1)
	sw	%v1, 1(%k1)
	addi	%v0, %zero, 128
	addi	%v1, %zero, 128
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	addi	%g0, %zero, 0
	ret
