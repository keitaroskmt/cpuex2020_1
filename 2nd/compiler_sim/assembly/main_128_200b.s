.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 496
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
reduction_2pi_sub1.2614:
	fblt	%f0, %f1, fbgt_else.31091
	flw	%f2, 495(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31092
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31093
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31094
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31095
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31096
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31097
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31098
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31099
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31100
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31101
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31102
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31103
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31104
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31105
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.31106
	fmul	%f1, %f2, %f1
	j	reduction_2pi_sub1.2614
fbgt_else.31106:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31105:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31104:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31103:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31102:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31101:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31100:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31099:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31098:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31097:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31096:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31095:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31094:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31093:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31092:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.31091:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2617:
	fblt	%f0, %f2, fbgt_else.31107
	fblt	%f0, %f1, fbgt_else.31108
	fsub	%f0, %f0, %f1
	flw	%f3, 495(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31109
	fblt	%f0, %f1, fbgt_else.31110
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31111
	fblt	%f0, %f1, fbgt_else.31112
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31113
	fblt	%f0, %f1, fbgt_else.31114
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31114:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31113:
	jr	%ra
fbgt_else.31112:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31115
	fblt	%f0, %f1, fbgt_else.31116
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31116:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31115:
	jr	%ra
fbgt_else.31111:
	jr	%ra
fbgt_else.31110:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31117
	fblt	%f0, %f1, fbgt_else.31118
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31119
	fblt	%f0, %f1, fbgt_else.31120
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31120:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31119:
	jr	%ra
fbgt_else.31118:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31121
	fblt	%f0, %f1, fbgt_else.31122
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31122:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31121:
	jr	%ra
fbgt_else.31117:
	jr	%ra
fbgt_else.31109:
	jr	%ra
fbgt_else.31108:
	flw	%f3, 495(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31123
	fblt	%f0, %f1, fbgt_else.31124
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31125
	fblt	%f0, %f1, fbgt_else.31126
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31127
	fblt	%f0, %f1, fbgt_else.31128
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31128:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31127:
	jr	%ra
fbgt_else.31126:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31129
	fblt	%f0, %f1, fbgt_else.31130
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31130:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31129:
	jr	%ra
fbgt_else.31125:
	jr	%ra
fbgt_else.31124:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31131
	fblt	%f0, %f1, fbgt_else.31132
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31133
	fblt	%f0, %f1, fbgt_else.31134
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31134:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31133:
	jr	%ra
fbgt_else.31132:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.31135
	fblt	%f0, %f1, fbgt_else.31136
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31136:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.31135:
	jr	%ra
fbgt_else.31131:
	jr	%ra
fbgt_else.31123:
	jr	%ra
fbgt_else.31107:
	jr	%ra
atan.2627:
	flw	%f1, 494(%zero)
	fblt	%f0, %f1, fbgt_else.31137
	addi	%v0, %zero, 1
	j	fbgt_cont.31138
fbgt_else.31137:
	addi	%v0, %zero, 0
fbgt_cont.31138:
	fabs	%f1, %f0
	flw	%f2, 493(%zero)
	fblt	%f1, %f2, fbgt_else.31139
	flw	%f0, 486(%zero)
	fblt	%f1, %f0, fbgt_else.31140
	flw	%f0, 483(%zero)
	flw	%f2, 484(%zero)
	fdiv	%f1, %f2, %f1
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	flw	%f5, 492(%zero)
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f5, %f1, %f5
	flw	%f6, 491(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fadd	%f5, %f5, %f6
	flw	%f6, 490(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f5, %f5, %f6
	flw	%f6, 489(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 488(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fsub	%f2, %f5, %f2
	flw	%f5, 487(%zero)
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	j	fbgt_cont.31141
fbgt_else.31140:
	flw	%f0, 485(%zero)
	flw	%f2, 484(%zero)
	fsub	%f3, %f1, %f2
	fadd	%f1, %f1, %f2
	fdiv	%f1, %f3, %f1
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	flw	%f5, 492(%zero)
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f5, %f1, %f5
	flw	%f6, 491(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fadd	%f5, %f5, %f6
	flw	%f6, 490(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f5, %f5, %f6
	flw	%f6, 489(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 488(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fsub	%f2, %f5, %f2
	flw	%f5, 487(%zero)
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
	fadd	%f0, %f0, %f1
fbgt_cont.31141:
	beqi	%v0, 0, bnei_else.31142
	jr	%ra
bnei_else.31142:
	fneg	%f0, %f0
	jr	%ra
fbgt_else.31139:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	flw	%f4, 492(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 491(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 490(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 489(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 488(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 487(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
print_int_sub1.2629:
	blti	%v0, 10, bgti_else.31143
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.31144
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.31145
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.31146
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.31147
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.31148
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.31149
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.31150
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2629
bgti_else.31150:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.31149:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.31148:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.31147:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.31146:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.31145:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.31144:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.31143:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.31151
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31152
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31153
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31154
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31155
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31156
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31157
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31158
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31159
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31160
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31161
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31162
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31163
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31164
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31165
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.31166
	addi	%v0, %v0, -10
	j	print_int_sub2.2632
bgti_else.31166:
	jr	%ra
bgti_else.31165:
	jr	%ra
bgti_else.31164:
	jr	%ra
bgti_else.31163:
	jr	%ra
bgti_else.31162:
	jr	%ra
bgti_else.31161:
	jr	%ra
bgti_else.31160:
	jr	%ra
bgti_else.31159:
	jr	%ra
bgti_else.31158:
	jr	%ra
bgti_else.31157:
	jr	%ra
bgti_else.31156:
	jr	%ra
bgti_else.31155:
	jr	%ra
bgti_else.31154:
	jr	%ra
bgti_else.31153:
	jr	%ra
bgti_else.31152:
	jr	%ra
bgti_else.31151:
	jr	%ra
rotate_quadratic_matrix.2767:
	flw	%f0, 0(%v1)
	flw	%f1, 482(%zero)
	fabs	%f2, %f0
	flw	%f3, 481(%zero)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f1, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f3, 5(%sp)
	fblt	%f2, %f3, fbgt_else.32290
	flw	%f4, 480(%zero)
	fblt	%f2, %f4, fbgt_else.32292
	flw	%f4, 479(%zero)
	fblt	%f2, %f4, fbgt_else.32294
	flw	%f4, 478(%zero)
	fblt	%f2, %f4, fbgt_else.32296
	flw	%f4, 477(%zero)
	fblt	%f2, %f4, fbgt_else.32298
	flw	%f4, 476(%zero)
	fblt	%f2, %f4, fbgt_else.32300
	flw	%f4, 475(%zero)
	fblt	%f2, %f4, fbgt_else.32302
	flw	%f4, 474(%zero)
	fblt	%f2, %f4, fbgt_else.32304
	flw	%f4, 473(%zero)
	fblt	%f2, %f4, fbgt_else.32306
	flw	%f4, 472(%zero)
	fblt	%f2, %f4, fbgt_else.32308
	flw	%f4, 471(%zero)
	fblt	%f2, %f4, fbgt_else.32310
	flw	%f4, 470(%zero)
	fblt	%f2, %f4, fbgt_else.32312
	flw	%f4, 469(%zero)
	fblt	%f2, %f4, fbgt_else.32314
	flw	%f4, 468(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	fbgt_cont.32291
fbgt_else.32314:
	fmov	%f0, %f4
fbgt_cont.32315:
	j	fbgt_cont.32291
fbgt_else.32312:
	fmov	%f0, %f4
fbgt_cont.32313:
	j	fbgt_cont.32291
fbgt_else.32310:
	fmov	%f0, %f4
fbgt_cont.32311:
	j	fbgt_cont.32291
fbgt_else.32308:
	fmov	%f0, %f4
fbgt_cont.32309:
	j	fbgt_cont.32291
fbgt_else.32306:
	fmov	%f0, %f4
fbgt_cont.32307:
	j	fbgt_cont.32291
fbgt_else.32304:
	fmov	%f0, %f4
fbgt_cont.32305:
	j	fbgt_cont.32291
fbgt_else.32302:
	fmov	%f0, %f4
fbgt_cont.32303:
	j	fbgt_cont.32291
fbgt_else.32300:
	fmov	%f0, %f4
fbgt_cont.32301:
	j	fbgt_cont.32291
fbgt_else.32298:
	fmov	%f0, %f4
fbgt_cont.32299:
	j	fbgt_cont.32291
fbgt_else.32296:
	fmov	%f0, %f4
fbgt_cont.32297:
	j	fbgt_cont.32291
fbgt_else.32294:
	fmov	%f0, %f4
fbgt_cont.32295:
	j	fbgt_cont.32291
fbgt_else.32292:
	fmov	%f0, %f4
fbgt_cont.32293:
	j	fbgt_cont.32291
fbgt_else.32290:
	fmov	%f0, %f3
fbgt_cont.32291:
	flw	%f1, 4(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.32316
	fblt	%f1, %f0, fbgt_else.32318
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	fbgt_cont.32317
fbgt_else.32318:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
fbgt_cont.32319:
	j	fbgt_cont.32317
fbgt_else.32316:
	fmov	%f0, %f1
fbgt_cont.32317:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.32320
	addi	%v0, %zero, 0
	j	fbgt_cont.32321
fbgt_else.32320:
	addi	%v0, %zero, 1
fbgt_cont.32321:
	fblt	%f0, %f1, fbgt_else.32322
	fsub	%f0, %f0, %f1
	j	fbgt_cont.32323
fbgt_else.32322:
fbgt_cont.32323:
	flw	%f2, 483(%zero)
	fblt	%f0, %f2, fbgt_else.32324
	beqi	%v0, 0, bnei_else.32326
	addi	%v0, %zero, 0
	j	fbgt_cont.32325
bnei_else.32326:
	addi	%v0, %zero, 1
bnei_cont.32327:
	j	fbgt_cont.32325
fbgt_else.32324:
fbgt_cont.32325:
	fblt	%f0, %f2, fbgt_else.32328
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32329
fbgt_else.32328:
fbgt_cont.32329:
	flw	%f3, 485(%zero)
	fblt	%f3, %f0, fbgt_else.32330
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.32331
fbgt_else.32330:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.32331:
	beqi	%v0, 0, bnei_else.32332
	j	bnei_cont.32333
bnei_else.32332:
	fneg	%f0, %f0
bnei_cont.32333:
	flw	%f4, 494(%zero)
	flw	%f5, 2(%sp)
	fblt	%f5, %f4, fbgt_else.32334
	addi	%v0, %zero, 1
	j	fbgt_cont.32335
fbgt_else.32334:
	addi	%v0, %zero, 0
fbgt_cont.32335:
	fabs	%f5, %f5
	flw	%f6, 5(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f4, 7(%sp)
	fsw	%f3, 8(%sp)
	fsw	%f2, 9(%sp)
	sw	%v0, 10(%sp)
	fsw	%f5, 11(%sp)
	fblt	%f5, %f6, fbgt_else.32336
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.32338
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.32340
	flw	%f7, 478(%zero)
	fblt	%f5, %f7, fbgt_else.32342
	flw	%f7, 477(%zero)
	fblt	%f5, %f7, fbgt_else.32344
	flw	%f7, 476(%zero)
	fblt	%f5, %f7, fbgt_else.32346
	flw	%f7, 475(%zero)
	fblt	%f5, %f7, fbgt_else.32348
	flw	%f7, 474(%zero)
	fblt	%f5, %f7, fbgt_else.32350
	flw	%f7, 473(%zero)
	fblt	%f5, %f7, fbgt_else.32352
	flw	%f7, 472(%zero)
	fblt	%f5, %f7, fbgt_else.32354
	flw	%f7, 471(%zero)
	fblt	%f5, %f7, fbgt_else.32356
	flw	%f7, 470(%zero)
	fblt	%f5, %f7, fbgt_else.32358
	flw	%f7, 469(%zero)
	fblt	%f5, %f7, fbgt_else.32360
	flw	%f7, 468(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.32337
fbgt_else.32360:
	fmov	%f0, %f7
fbgt_cont.32361:
	j	fbgt_cont.32337
fbgt_else.32358:
	fmov	%f0, %f7
fbgt_cont.32359:
	j	fbgt_cont.32337
fbgt_else.32356:
	fmov	%f0, %f7
fbgt_cont.32357:
	j	fbgt_cont.32337
fbgt_else.32354:
	fmov	%f0, %f7
fbgt_cont.32355:
	j	fbgt_cont.32337
fbgt_else.32352:
	fmov	%f0, %f7
fbgt_cont.32353:
	j	fbgt_cont.32337
fbgt_else.32350:
	fmov	%f0, %f7
fbgt_cont.32351:
	j	fbgt_cont.32337
fbgt_else.32348:
	fmov	%f0, %f7
fbgt_cont.32349:
	j	fbgt_cont.32337
fbgt_else.32346:
	fmov	%f0, %f7
fbgt_cont.32347:
	j	fbgt_cont.32337
fbgt_else.32344:
	fmov	%f0, %f7
fbgt_cont.32345:
	j	fbgt_cont.32337
fbgt_else.32342:
	fmov	%f0, %f7
fbgt_cont.32343:
	j	fbgt_cont.32337
fbgt_else.32340:
	fmov	%f0, %f7
fbgt_cont.32341:
	j	fbgt_cont.32337
fbgt_else.32338:
	fmov	%f0, %f7
fbgt_cont.32339:
	j	fbgt_cont.32337
fbgt_else.32336:
	fmov	%f0, %f6
fbgt_cont.32337:
	flw	%f1, 11(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.32362
	fblt	%f1, %f0, fbgt_else.32364
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.32363
fbgt_else.32364:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
fbgt_cont.32365:
	j	fbgt_cont.32363
fbgt_else.32362:
	fmov	%f0, %f1
fbgt_cont.32363:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.32366
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.32368
	addi	%v0, %zero, 0
	j	fbgt_cont.32367
bnei_else.32368:
	addi	%v0, %zero, 1
bnei_cont.32369:
	j	fbgt_cont.32367
fbgt_else.32366:
	lw	%v0, 10(%sp)
fbgt_cont.32367:
	fblt	%f0, %f1, fbgt_else.32370
	fsub	%f0, %f0, %f1
	j	fbgt_cont.32371
fbgt_else.32370:
fbgt_cont.32371:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.32372
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32373
fbgt_else.32372:
fbgt_cont.32373:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.32374
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.32375
fbgt_else.32374:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.32375:
	beqi	%v0, 0, bnei_else.32376
	j	bnei_cont.32377
bnei_else.32376:
	fneg	%f0, %f0
bnei_cont.32377:
	lw	%v0, 1(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f4, 13(%sp)
	fsw	%f5, 14(%sp)
	fblt	%f5, %f6, fbgt_else.32378
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.32380
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.32382
	flw	%f7, 478(%zero)
	fblt	%f5, %f7, fbgt_else.32384
	flw	%f7, 477(%zero)
	fblt	%f5, %f7, fbgt_else.32386
	flw	%f7, 476(%zero)
	fblt	%f5, %f7, fbgt_else.32388
	flw	%f7, 475(%zero)
	fblt	%f5, %f7, fbgt_else.32390
	flw	%f7, 474(%zero)
	fblt	%f5, %f7, fbgt_else.32392
	flw	%f7, 473(%zero)
	fblt	%f5, %f7, fbgt_else.32394
	flw	%f7, 472(%zero)
	fblt	%f5, %f7, fbgt_else.32396
	flw	%f7, 471(%zero)
	fblt	%f5, %f7, fbgt_else.32398
	flw	%f7, 470(%zero)
	fblt	%f5, %f7, fbgt_else.32400
	flw	%f7, 469(%zero)
	fblt	%f5, %f7, fbgt_else.32402
	flw	%f7, 468(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.32379
fbgt_else.32402:
	fmov	%f0, %f7
fbgt_cont.32403:
	j	fbgt_cont.32379
fbgt_else.32400:
	fmov	%f0, %f7
fbgt_cont.32401:
	j	fbgt_cont.32379
fbgt_else.32398:
	fmov	%f0, %f7
fbgt_cont.32399:
	j	fbgt_cont.32379
fbgt_else.32396:
	fmov	%f0, %f7
fbgt_cont.32397:
	j	fbgt_cont.32379
fbgt_else.32394:
	fmov	%f0, %f7
fbgt_cont.32395:
	j	fbgt_cont.32379
fbgt_else.32392:
	fmov	%f0, %f7
fbgt_cont.32393:
	j	fbgt_cont.32379
fbgt_else.32390:
	fmov	%f0, %f7
fbgt_cont.32391:
	j	fbgt_cont.32379
fbgt_else.32388:
	fmov	%f0, %f7
fbgt_cont.32389:
	j	fbgt_cont.32379
fbgt_else.32386:
	fmov	%f0, %f7
fbgt_cont.32387:
	j	fbgt_cont.32379
fbgt_else.32384:
	fmov	%f0, %f7
fbgt_cont.32385:
	j	fbgt_cont.32379
fbgt_else.32382:
	fmov	%f0, %f7
fbgt_cont.32383:
	j	fbgt_cont.32379
fbgt_else.32380:
	fmov	%f0, %f7
fbgt_cont.32381:
	j	fbgt_cont.32379
fbgt_else.32378:
	fmov	%f0, %f6
fbgt_cont.32379:
	flw	%f1, 14(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.32404
	fblt	%f1, %f0, fbgt_else.32406
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.32405
fbgt_else.32406:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.32407:
	j	fbgt_cont.32405
fbgt_else.32404:
	fmov	%f0, %f1
fbgt_cont.32405:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.32408
	addi	%v0, %zero, 0
	j	fbgt_cont.32409
fbgt_else.32408:
	addi	%v0, %zero, 1
fbgt_cont.32409:
	fblt	%f0, %f1, fbgt_else.32410
	fsub	%f0, %f0, %f1
	j	fbgt_cont.32411
fbgt_else.32410:
fbgt_cont.32411:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.32412
	beqi	%v0, 0, bnei_else.32414
	addi	%v0, %zero, 0
	j	fbgt_cont.32413
bnei_else.32414:
	addi	%v0, %zero, 1
bnei_cont.32415:
	j	fbgt_cont.32413
fbgt_else.32412:
fbgt_cont.32413:
	fblt	%f0, %f2, fbgt_else.32416
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32417
fbgt_else.32416:
fbgt_cont.32417:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.32418
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.32419
fbgt_else.32418:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.32419:
	beqi	%v0, 0, bnei_else.32420
	j	bnei_cont.32421
bnei_else.32420:
	fneg	%f0, %f0
bnei_cont.32421:
	flw	%f4, 13(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.32422
	addi	%v0, %zero, 1
	j	fbgt_cont.32423
fbgt_else.32422:
	addi	%v0, %zero, 0
fbgt_cont.32423:
	fabs	%f4, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 15(%sp)
	sw	%v0, 16(%sp)
	fsw	%f4, 17(%sp)
	fblt	%f4, %f6, fbgt_else.32424
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.32426
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.32428
	flw	%f7, 478(%zero)
	fblt	%f4, %f7, fbgt_else.32430
	flw	%f7, 477(%zero)
	fblt	%f4, %f7, fbgt_else.32432
	flw	%f7, 476(%zero)
	fblt	%f4, %f7, fbgt_else.32434
	flw	%f7, 475(%zero)
	fblt	%f4, %f7, fbgt_else.32436
	flw	%f7, 474(%zero)
	fblt	%f4, %f7, fbgt_else.32438
	flw	%f7, 473(%zero)
	fblt	%f4, %f7, fbgt_else.32440
	flw	%f7, 472(%zero)
	fblt	%f4, %f7, fbgt_else.32442
	flw	%f7, 471(%zero)
	fblt	%f4, %f7, fbgt_else.32444
	flw	%f7, 470(%zero)
	fblt	%f4, %f7, fbgt_else.32446
	flw	%f7, 469(%zero)
	fblt	%f4, %f7, fbgt_else.32448
	flw	%f7, 468(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.32425
fbgt_else.32448:
	fmov	%f0, %f7
fbgt_cont.32449:
	j	fbgt_cont.32425
fbgt_else.32446:
	fmov	%f0, %f7
fbgt_cont.32447:
	j	fbgt_cont.32425
fbgt_else.32444:
	fmov	%f0, %f7
fbgt_cont.32445:
	j	fbgt_cont.32425
fbgt_else.32442:
	fmov	%f0, %f7
fbgt_cont.32443:
	j	fbgt_cont.32425
fbgt_else.32440:
	fmov	%f0, %f7
fbgt_cont.32441:
	j	fbgt_cont.32425
fbgt_else.32438:
	fmov	%f0, %f7
fbgt_cont.32439:
	j	fbgt_cont.32425
fbgt_else.32436:
	fmov	%f0, %f7
fbgt_cont.32437:
	j	fbgt_cont.32425
fbgt_else.32434:
	fmov	%f0, %f7
fbgt_cont.32435:
	j	fbgt_cont.32425
fbgt_else.32432:
	fmov	%f0, %f7
fbgt_cont.32433:
	j	fbgt_cont.32425
fbgt_else.32430:
	fmov	%f0, %f7
fbgt_cont.32431:
	j	fbgt_cont.32425
fbgt_else.32428:
	fmov	%f0, %f7
fbgt_cont.32429:
	j	fbgt_cont.32425
fbgt_else.32426:
	fmov	%f0, %f7
fbgt_cont.32427:
	j	fbgt_cont.32425
fbgt_else.32424:
	fmov	%f0, %f6
fbgt_cont.32425:
	flw	%f1, 17(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.32450
	fblt	%f1, %f0, fbgt_else.32452
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.32451
fbgt_else.32452:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.32453:
	j	fbgt_cont.32451
fbgt_else.32450:
	fmov	%f0, %f1
fbgt_cont.32451:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.32454
	lw	%v0, 16(%sp)
	beqi	%v0, 0, bnei_else.32456
	addi	%v0, %zero, 0
	j	fbgt_cont.32455
bnei_else.32456:
	addi	%v0, %zero, 1
bnei_cont.32457:
	j	fbgt_cont.32455
fbgt_else.32454:
	lw	%v0, 16(%sp)
fbgt_cont.32455:
	fblt	%f0, %f1, fbgt_else.32458
	fsub	%f0, %f0, %f1
	j	fbgt_cont.32459
fbgt_else.32458:
fbgt_cont.32459:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.32460
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32461
fbgt_else.32460:
fbgt_cont.32461:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.32462
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.32463
fbgt_else.32462:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.32463:
	beqi	%v0, 0, bnei_else.32464
	j	bnei_cont.32465
bnei_else.32464:
	fneg	%f0, %f0
bnei_cont.32465:
	lw	%v0, 1(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 18(%sp)
	fsw	%f4, 19(%sp)
	fsw	%f5, 20(%sp)
	fblt	%f5, %f6, fbgt_else.32466
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.32468
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.32470
	flw	%f7, 478(%zero)
	fblt	%f5, %f7, fbgt_else.32472
	flw	%f7, 477(%zero)
	fblt	%f5, %f7, fbgt_else.32474
	flw	%f7, 476(%zero)
	fblt	%f5, %f7, fbgt_else.32476
	flw	%f7, 475(%zero)
	fblt	%f5, %f7, fbgt_else.32478
	flw	%f7, 474(%zero)
	fblt	%f5, %f7, fbgt_else.32480
	flw	%f7, 473(%zero)
	fblt	%f5, %f7, fbgt_else.32482
	flw	%f7, 472(%zero)
	fblt	%f5, %f7, fbgt_else.32484
	flw	%f7, 471(%zero)
	fblt	%f5, %f7, fbgt_else.32486
	flw	%f7, 470(%zero)
	fblt	%f5, %f7, fbgt_else.32488
	flw	%f7, 469(%zero)
	fblt	%f5, %f7, fbgt_else.32490
	flw	%f7, 468(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	fbgt_cont.32467
fbgt_else.32490:
	fmov	%f0, %f7
fbgt_cont.32491:
	j	fbgt_cont.32467
fbgt_else.32488:
	fmov	%f0, %f7
fbgt_cont.32489:
	j	fbgt_cont.32467
fbgt_else.32486:
	fmov	%f0, %f7
fbgt_cont.32487:
	j	fbgt_cont.32467
fbgt_else.32484:
	fmov	%f0, %f7
fbgt_cont.32485:
	j	fbgt_cont.32467
fbgt_else.32482:
	fmov	%f0, %f7
fbgt_cont.32483:
	j	fbgt_cont.32467
fbgt_else.32480:
	fmov	%f0, %f7
fbgt_cont.32481:
	j	fbgt_cont.32467
fbgt_else.32478:
	fmov	%f0, %f7
fbgt_cont.32479:
	j	fbgt_cont.32467
fbgt_else.32476:
	fmov	%f0, %f7
fbgt_cont.32477:
	j	fbgt_cont.32467
fbgt_else.32474:
	fmov	%f0, %f7
fbgt_cont.32475:
	j	fbgt_cont.32467
fbgt_else.32472:
	fmov	%f0, %f7
fbgt_cont.32473:
	j	fbgt_cont.32467
fbgt_else.32470:
	fmov	%f0, %f7
fbgt_cont.32471:
	j	fbgt_cont.32467
fbgt_else.32468:
	fmov	%f0, %f7
fbgt_cont.32469:
	j	fbgt_cont.32467
fbgt_else.32466:
	fmov	%f0, %f6
fbgt_cont.32467:
	flw	%f1, 20(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.32492
	fblt	%f1, %f0, fbgt_else.32494
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	fbgt_cont.32493
fbgt_else.32494:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
fbgt_cont.32495:
	j	fbgt_cont.32493
fbgt_else.32492:
	fmov	%f0, %f1
fbgt_cont.32493:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.32496
	addi	%v0, %zero, 0
	j	fbgt_cont.32497
fbgt_else.32496:
	addi	%v0, %zero, 1
fbgt_cont.32497:
	fblt	%f0, %f1, fbgt_else.32498
	fsub	%f0, %f0, %f1
	j	fbgt_cont.32499
fbgt_else.32498:
fbgt_cont.32499:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.32500
	beqi	%v0, 0, bnei_else.32502
	addi	%v0, %zero, 0
	j	fbgt_cont.32501
bnei_else.32502:
	addi	%v0, %zero, 1
bnei_cont.32503:
	j	fbgt_cont.32501
fbgt_else.32500:
fbgt_cont.32501:
	fblt	%f0, %f2, fbgt_else.32504
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32505
fbgt_else.32504:
fbgt_cont.32505:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.32506
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.32507
fbgt_else.32506:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.32507:
	beqi	%v0, 0, bnei_else.32508
	j	bnei_cont.32509
bnei_else.32508:
	fneg	%f0, %f0
bnei_cont.32509:
	flw	%f4, 19(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.32510
	addi	%v0, %zero, 1
	j	fbgt_cont.32511
fbgt_else.32510:
	addi	%v0, %zero, 0
fbgt_cont.32511:
	fabs	%f4, %f4
	flw	%f5, 5(%sp)
	fsw	%f0, 21(%sp)
	sw	%v0, 22(%sp)
	fsw	%f4, 23(%sp)
	fblt	%f4, %f5, fbgt_else.32512
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.32514
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.32516
	flw	%f6, 478(%zero)
	fblt	%f4, %f6, fbgt_else.32518
	flw	%f6, 477(%zero)
	fblt	%f4, %f6, fbgt_else.32520
	flw	%f6, 476(%zero)
	fblt	%f4, %f6, fbgt_else.32522
	flw	%f6, 475(%zero)
	fblt	%f4, %f6, fbgt_else.32524
	flw	%f6, 474(%zero)
	fblt	%f4, %f6, fbgt_else.32526
	flw	%f6, 473(%zero)
	fblt	%f4, %f6, fbgt_else.32528
	flw	%f6, 472(%zero)
	fblt	%f4, %f6, fbgt_else.32530
	flw	%f6, 471(%zero)
	fblt	%f4, %f6, fbgt_else.32532
	flw	%f6, 470(%zero)
	fblt	%f4, %f6, fbgt_else.32534
	flw	%f6, 469(%zero)
	fblt	%f4, %f6, fbgt_else.32536
	flw	%f6, 468(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.32513
fbgt_else.32536:
	fmov	%f0, %f6
fbgt_cont.32537:
	j	fbgt_cont.32513
fbgt_else.32534:
	fmov	%f0, %f6
fbgt_cont.32535:
	j	fbgt_cont.32513
fbgt_else.32532:
	fmov	%f0, %f6
fbgt_cont.32533:
	j	fbgt_cont.32513
fbgt_else.32530:
	fmov	%f0, %f6
fbgt_cont.32531:
	j	fbgt_cont.32513
fbgt_else.32528:
	fmov	%f0, %f6
fbgt_cont.32529:
	j	fbgt_cont.32513
fbgt_else.32526:
	fmov	%f0, %f6
fbgt_cont.32527:
	j	fbgt_cont.32513
fbgt_else.32524:
	fmov	%f0, %f6
fbgt_cont.32525:
	j	fbgt_cont.32513
fbgt_else.32522:
	fmov	%f0, %f6
fbgt_cont.32523:
	j	fbgt_cont.32513
fbgt_else.32520:
	fmov	%f0, %f6
fbgt_cont.32521:
	j	fbgt_cont.32513
fbgt_else.32518:
	fmov	%f0, %f6
fbgt_cont.32519:
	j	fbgt_cont.32513
fbgt_else.32516:
	fmov	%f0, %f6
fbgt_cont.32517:
	j	fbgt_cont.32513
fbgt_else.32514:
	fmov	%f0, %f6
fbgt_cont.32515:
	j	fbgt_cont.32513
fbgt_else.32512:
	fmov	%f0, %f5
fbgt_cont.32513:
	flw	%f1, 23(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.32538
	fblt	%f1, %f0, fbgt_else.32540
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.32539
fbgt_else.32540:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.32541:
	j	fbgt_cont.32539
fbgt_else.32538:
	fmov	%f0, %f1
fbgt_cont.32539:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.32542
	lw	%v0, 22(%sp)
	beqi	%v0, 0, bnei_else.32544
	addi	%v0, %zero, 0
	j	fbgt_cont.32543
bnei_else.32544:
	addi	%v0, %zero, 1
bnei_cont.32545:
	j	fbgt_cont.32543
fbgt_else.32542:
	lw	%v0, 22(%sp)
fbgt_cont.32543:
	fblt	%f0, %f1, fbgt_else.32546
	fsub	%f0, %f0, %f1
	j	fbgt_cont.32547
fbgt_else.32546:
fbgt_cont.32547:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.32548
	fsub	%f0, %f1, %f0
	j	fbgt_cont.32549
fbgt_else.32548:
fbgt_cont.32549:
	flw	%f1, 8(%sp)
	fblt	%f1, %f0, fbgt_else.32550
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 466(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 465(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.32551
fbgt_else.32550:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 484(%zero)
	flw	%f3, 464(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 463(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 462(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.32551:
	beqi	%v0, 0, bnei_else.32552
	j	bnei_cont.32553
bnei_else.32552:
	fneg	%f0, %f0
bnei_cont.32553:
	flw	%f1, 21(%sp)
	flw	%f2, 15(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 18(%sp)
	flw	%f5, 12(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f7, %f6, %f1
	flw	%f8, 6(%sp)
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
	flw	%f12, 495(%zero)
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
read_nth_object.2770:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.32601
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
	flw	%f0, 494(%zero)
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
	fblt	%f0, %f1, fbgt_else.32602
	addi	%v0, %zero, 0
	j	fbgt_cont.32603
fbgt_else.32602:
	addi	%v0, %zero, 1
fbgt_cont.32603:
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
	beqi	%v1, 0, bnei_else.32604
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 461(%zero)
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
	j	bnei_cont.32605
bnei_else.32604:
bnei_cont.32605:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.32606
	lw	%a0, 10(%sp)
	j	bnei_cont.32607
bnei_else.32606:
	addi	%a0, %zero, 1
bnei_cont.32607:
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
	lw	%a3, 0(%sp)
	sw	%v1, 12(%a3)
	beqi	%a2, 3, bnei_else.32608
	beqi	%a2, 2, bnei_else.32610
	j	bnei_cont.32609
bnei_else.32610:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.32612
	addi	%v1, %zero, 0
	j	bnei_cont.32613
bnei_else.32612:
	addi	%v1, %zero, 1
bnei_cont.32613:
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f0
	flw	%f2, 1(%a0)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%a0)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 5(%sp)
	fbne	%f1, %f4, fbeq_else.32614
	addi	%a2, %zero, 1
	j	fbeq_cont.32615
fbeq_else.32614:
	addi	%a2, %zero, 0
fbeq_cont.32615:
	beqi	%a2, 0, bnei_else.32616
	flw	%f1, 484(%zero)
	j	bnei_cont.32617
bnei_else.32616:
	beqi	%v1, 0, bnei_else.32618
	flw	%f4, 460(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.32619
bnei_else.32618:
	flw	%f4, 484(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.32619:
bnei_cont.32617:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.32611:
	j	bnei_cont.32609
bnei_else.32608:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.32620
	addi	%v1, %zero, 1
	j	fbeq_cont.32621
fbeq_else.32620:
	addi	%v1, %zero, 0
fbeq_cont.32621:
	beqi	%v1, 0, bnei_else.32622
	fmov	%f0, %f1
	j	bnei_cont.32623
bnei_else.32622:
	fbne	%f0, %f1, fbeq_else.32624
	addi	%v1, %zero, 1
	j	fbeq_cont.32625
fbeq_else.32624:
	addi	%v1, %zero, 0
fbeq_cont.32625:
	beqi	%v1, 0, bnei_else.32626
	fmov	%f2, %f1
	j	bnei_cont.32627
bnei_else.32626:
	fblt	%f1, %f0, fbgt_else.32628
	addi	%v1, %zero, 0
	j	fbgt_cont.32629
fbgt_else.32628:
	addi	%v1, %zero, 1
fbgt_cont.32629:
	beqi	%v1, 0, bnei_else.32630
	flw	%f2, 484(%zero)
	j	bnei_cont.32631
bnei_else.32630:
	flw	%f2, 460(%zero)
bnei_cont.32631:
bnei_cont.32627:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.32623:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.32632
	addi	%v1, %zero, 1
	j	fbeq_cont.32633
fbeq_else.32632:
	addi	%v1, %zero, 0
fbeq_cont.32633:
	beqi	%v1, 0, bnei_else.32634
	fmov	%f0, %f1
	j	bnei_cont.32635
bnei_else.32634:
	fbne	%f0, %f1, fbeq_else.32636
	addi	%v1, %zero, 1
	j	fbeq_cont.32637
fbeq_else.32636:
	addi	%v1, %zero, 0
fbeq_cont.32637:
	beqi	%v1, 0, bnei_else.32638
	fmov	%f2, %f1
	j	bnei_cont.32639
bnei_else.32638:
	fblt	%f1, %f0, fbgt_else.32640
	addi	%v1, %zero, 0
	j	fbgt_cont.32641
fbgt_else.32640:
	addi	%v1, %zero, 1
fbgt_cont.32641:
	beqi	%v1, 0, bnei_else.32642
	flw	%f2, 484(%zero)
	j	bnei_cont.32643
bnei_else.32642:
	flw	%f2, 460(%zero)
bnei_cont.32643:
bnei_cont.32639:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.32635:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.32644
	addi	%v1, %zero, 1
	j	fbeq_cont.32645
fbeq_else.32644:
	addi	%v1, %zero, 0
fbeq_cont.32645:
	beqi	%v1, 0, bnei_else.32646
	fmov	%f0, %f1
	j	bnei_cont.32647
bnei_else.32646:
	fbne	%f0, %f1, fbeq_else.32648
	addi	%v1, %zero, 1
	j	fbeq_cont.32649
fbeq_else.32648:
	addi	%v1, %zero, 0
fbeq_cont.32649:
	beqi	%v1, 0, bnei_else.32650
	j	bnei_cont.32651
bnei_else.32650:
	fblt	%f1, %f0, fbgt_else.32652
	addi	%v1, %zero, 0
	j	fbgt_cont.32653
fbgt_else.32652:
	addi	%v1, %zero, 1
fbgt_cont.32653:
	beqi	%v1, 0, bnei_else.32654
	flw	%f1, 484(%zero)
	j	bnei_cont.32655
bnei_else.32654:
	flw	%f1, 460(%zero)
bnei_cont.32655:
bnei_cont.32651:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.32647:
	fsw	%f0, 2(%a0)
bnei_cont.32609:
	beqi	%a1, 0, bnei_else.32656
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2767
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.32657
bnei_else.32656:
bnei_cont.32657:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.32601:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2772:
	blti	%v0, 60, bgti_else.32667
	jr	%ra
bgti_else.32667:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	read_nth_object.2770
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, 0, bnei_else.32669
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.32670
	jr	%ra
bgti_else.32670:
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	read_nth_object.2770
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	beqi	%v0, 0, bnei_else.32672
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.32673
	jr	%ra
bgti_else.32673:
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	read_nth_object.2770
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.32675
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.32676
	jr	%ra
bgti_else.32676:
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_nth_object.2770
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.32678
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.32679
	jr	%ra
bgti_else.32679:
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_nth_object.2770
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.32681
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.32682
	jr	%ra
bgti_else.32682:
	sw	%v0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_nth_object.2770
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.32684
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.32685
	jr	%ra
bgti_else.32685:
	sw	%v0, 6(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	read_nth_object.2770
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.32687
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.32688
	jr	%ra
bgti_else.32688:
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	read_nth_object.2770
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.32690
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	j	read_object.2772
bnei_else.32690:
	lw	%v0, 7(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.32687:
	lw	%v0, 6(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.32684:
	lw	%v0, 5(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.32681:
	lw	%v0, 4(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.32678:
	lw	%v0, 3(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.32675:
	lw	%v0, 2(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.32672:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.32669:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
read_net_item.2776:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.32712
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
	beqi	%v0, -1, bnei_else.32713
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.32715
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.32717
	lw	%v1, 7(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	read_net_item.2776
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.32718
bnei_else.32717:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.32718:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.32716
bnei_else.32715:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.32716:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.32714
bnei_else.32713:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.32714:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.32712:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_or_network.2778:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	sw	%v1, 1(%sp)
	beqi	%v0, -1, bnei_else.32736
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.32738
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.32740
	addi	%v1, %zero, 3
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_net_item.2776
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.32741
bnei_else.32740:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.32741:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.32739
bnei_else.32738:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.32739:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.32737
bnei_else.32736:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.32737:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.32742
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
	beqi	%v0, -1, bnei_else.32743
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.32745
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2776
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.32746
bnei_else.32745:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.32746:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.32744
bnei_else.32743:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.32744:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.32747
	lw	%v0, 6(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	read_or_network.2778
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 10(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.32748
bnei_else.32747:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.32748:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.32742:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_and_network.2780:
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
	beqi	%v0, -1, bnei_else.32770
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.32772
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.32774
	addi	%v1, %zero, 3
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_net_item.2776
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.32775
bnei_else.32774:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.32775:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.32773
bnei_else.32772:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.32773:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.32771
bnei_else.32770:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.32771:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.32776
	lw	%v1, 1(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %zero, 1
	addi	%v1, %v1, 1
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.32777
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.32779
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2776
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.32780
bnei_else.32779:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.32780:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.32778
bnei_else.32777:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.32778:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.32781
	lw	%v1, 6(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, -1, bnei_else.32782
	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	read_net_item.2776
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.32783
bnei_else.32782:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.32783:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.32784
	lw	%v1, 10(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	lw	%v1, 0(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	read_net_item.2776
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.32785
	lw	%v1, 12(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	j	read_and_network.2780
bnei_else.32785:
	jr	%ra
bnei_else.32784:
	jr	%ra
bnei_else.32781:
	jr	%ra
bnei_else.32776:
	jr	%ra
solver_second.2818:
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)
	flw	%f5, 2(%v1)
	fmul	%f6, %f3, %f3
	lw	%v1, 4(%v0)
	flw	%f7, 0(%v1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%v1, 4(%v0)
	flw	%f8, 1(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.32790
	fmul	%f7, %f4, %f5
	lw	%v1, 9(%v0)
	flw	%f8, 0(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f3, %f4
	lw	%v1, 9(%v0)
	flw	%f8, 2(%v1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	j	bnei_cont.32791
bnei_else.32790:
bnei_cont.32791:
	flw	%f7, 494(%zero)
	fbne	%f6, %f7, fbeq_else.32792
	addi	%v1, %zero, 1
	j	fbeq_cont.32793
fbeq_else.32792:
	addi	%v1, %zero, 0
fbeq_cont.32793:
	beqi	%v1, 0, bnei_else.32794
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.32794:
	fmul	%f8, %f3, %f0
	lw	%v1, 4(%v0)
	flw	%f9, 0(%v1)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1
	lw	%v1, 4(%v0)
	flw	%f10, 1(%v1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f5, %f2
	lw	%v1, 4(%v0)
	flw	%f10, 2(%v1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.32795
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2
	fadd	%f9, %f9, %f10
	lw	%v1, 9(%v0)
	flw	%f10, 0(%v1)
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2
	fmul	%f5, %f5, %f0
	fadd	%f5, %f10, %f5
	lw	%v1, 9(%v0)
	flw	%f10, 1(%v1)
	fmul	%f5, %f5, %f10
	fadd	%f5, %f9, %f5
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0
	fadd	%f3, %f3, %f4
	lw	%v1, 9(%v0)
	flw	%f4, 2(%v1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	flw	%f4, 464(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f8, %f3
	j	bnei_cont.32796
bnei_else.32795:
	fmov	%f3, %f8
bnei_cont.32796:
	fmul	%f4, %f0, %f0
	lw	%v1, 4(%v0)
	flw	%f5, 0(%v1)
	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1
	lw	%v1, 4(%v0)
	flw	%f8, 1(%v1)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2
	lw	%v1, 4(%v0)
	flw	%f8, 2(%v1)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	lw	%v1, 3(%v0)
	beqi	%v1, 0, bnei_else.32797
	fmul	%f5, %f1, %f2
	lw	%v1, 9(%v0)
	flw	%f8, 0(%v1)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f2, %f2, %f0
	lw	%v1, 9(%v0)
	flw	%f5, 1(%v1)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1
	lw	%v1, 9(%v0)
	flw	%f1, 2(%v1)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.32798
bnei_else.32797:
	fmov	%f0, %f4
bnei_cont.32798:
	lw	%v1, 1(%v0)
	beqi	%v1, 3, bnei_else.32799
	j	bnei_cont.32800
bnei_else.32799:
	flw	%f1, 484(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.32800:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.32801
	addi	%v1, %zero, 0
	j	fbgt_cont.32802
fbgt_else.32801:
	addi	%v1, %zero, 1
fbgt_cont.32802:
	beqi	%v1, 0, bnei_else.32803
	fsqrt	%f0, %f0
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.32804
	j	bnei_cont.32805
bnei_else.32804:
	fneg	%f0, %f0
bnei_cont.32805:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.32803:
	addi	%v0, %zero, 0
	jr	%ra
solver_fast2.2865:
	lw	%a0, 12(%v0)
	lw	%a1, 10(%a0)
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	lw	%a2, 1(%v1)
	add	%at, %a2, %v0
	lw	%v0, 0(%at)
	lw	%a2, 1(%a0)
	beqi	%a2, 1, bnei_else.32806
	beqi	%a2, 2, bnei_else.32807
	flw	%f3, 0(%v0)
	flw	%f4, 494(%zero)
	fbne	%f3, %f4, fbeq_else.32808
	addi	%v1, %zero, 1
	j	fbeq_cont.32809
fbeq_else.32808:
	addi	%v1, %zero, 0
fbeq_cont.32809:
	beqi	%v1, 0, bnei_else.32810
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.32810:
	flw	%f5, 1(%v0)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%v0)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%v0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a1)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.32811
	addi	%v1, %zero, 0
	j	fbgt_cont.32812
fbgt_else.32811:
	addi	%v1, %zero, 1
fbgt_cont.32812:
	beqi	%v1, 0, bnei_else.32813
	lw	%v1, 6(%a0)
	beqi	%v1, 0, bnei_else.32814
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.32815
bnei_else.32814:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%v0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.32815:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.32813:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.32807:
	flw	%f0, 0(%v0)
	flw	%f1, 494(%zero)
	fblt	%f0, %f1, fbgt_else.32816
	addi	%v0, %zero, 0
	j	fbgt_cont.32817
fbgt_else.32816:
	addi	%v0, %zero, 1
fbgt_cont.32817:
	beqi	%v0, 0, bnei_else.32818
	flw	%f1, 3(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.32818:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.32806:
	lw	%v1, 0(%v1)
	flw	%f3, 0(%v0)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%v0)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%v1)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%a1, 4(%a0)
	flw	%f7, 1(%a1)
	fblt	%f6, %f7, fbgt_else.32819
	addi	%a1, %zero, 0
	j	fbgt_cont.32820
fbgt_else.32819:
	addi	%a1, %zero, 1
fbgt_cont.32820:
	beqi	%a1, 0, bnei_else.32821
	flw	%f6, 2(%v1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%a1, 4(%a0)
	flw	%f8, 2(%a1)
	fblt	%f6, %f8, fbgt_else.32823
	addi	%a1, %zero, 0
	j	fbgt_cont.32824
fbgt_else.32823:
	addi	%a1, %zero, 1
fbgt_cont.32824:
	beqi	%a1, 0, bnei_else.32825
	flw	%f6, 494(%zero)
	fbne	%f4, %f6, fbeq_else.32827
	addi	%a1, %zero, 1
	j	fbeq_cont.32828
fbeq_else.32827:
	addi	%a1, %zero, 0
fbeq_cont.32828:
	beqi	%a1, 0, bnei_else.32829
	addi	%a1, %zero, 0
	j	bnei_cont.32822
bnei_else.32829:
	addi	%a1, %zero, 1
bnei_cont.32830:
	j	bnei_cont.32822
bnei_else.32825:
	addi	%a1, %zero, 0
bnei_cont.32826:
	j	bnei_cont.32822
bnei_else.32821:
	addi	%a1, %zero, 0
bnei_cont.32822:
	beqi	%a1, 0, bnei_else.32831
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.32831:
	flw	%f3, 2(%v0)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%v0)
	fmul	%f3, %f3, %f4
	flw	%f6, 0(%v1)
	fmul	%f8, %f3, %f6
	fadd	%f8, %f8, %f0
	fabs	%f8, %f8
	lw	%a1, 4(%a0)
	flw	%f9, 0(%a1)
	fblt	%f8, %f9, fbgt_else.32832
	addi	%a1, %zero, 0
	j	fbgt_cont.32833
fbgt_else.32832:
	addi	%a1, %zero, 1
fbgt_cont.32833:
	beqi	%a1, 0, bnei_else.32834
	flw	%f8, 2(%v1)
	fmul	%f8, %f3, %f8
	fadd	%f8, %f8, %f2
	fabs	%f8, %f8
	lw	%v1, 4(%a0)
	flw	%f10, 2(%v1)
	fblt	%f8, %f10, fbgt_else.32836
	addi	%v1, %zero, 0
	j	fbgt_cont.32837
fbgt_else.32836:
	addi	%v1, %zero, 1
fbgt_cont.32837:
	beqi	%v1, 0, bnei_else.32838
	flw	%f8, 494(%zero)
	fbne	%f4, %f8, fbeq_else.32840
	addi	%v1, %zero, 1
	j	fbeq_cont.32841
fbeq_else.32840:
	addi	%v1, %zero, 0
fbeq_cont.32841:
	beqi	%v1, 0, bnei_else.32842
	addi	%v1, %zero, 0
	j	bnei_cont.32835
bnei_else.32842:
	addi	%v1, %zero, 1
bnei_cont.32843:
	j	bnei_cont.32835
bnei_else.32838:
	addi	%v1, %zero, 0
bnei_cont.32839:
	j	bnei_cont.32835
bnei_else.32834:
	addi	%v1, %zero, 0
bnei_cont.32835:
	beqi	%v1, 0, bnei_else.32844
	fsw	%f3, 135(%zero)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.32844:
	flw	%f3, 4(%v0)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%v0)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	fblt	%f0, %f9, fbgt_else.32845
	addi	%v0, %zero, 0
	j	fbgt_cont.32846
fbgt_else.32845:
	addi	%v0, %zero, 1
fbgt_cont.32846:
	beqi	%v0, 0, bnei_else.32847
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fblt	%f0, %f7, fbgt_else.32849
	addi	%v0, %zero, 0
	j	fbgt_cont.32850
fbgt_else.32849:
	addi	%v0, %zero, 1
fbgt_cont.32850:
	beqi	%v0, 0, bnei_else.32851
	flw	%f0, 494(%zero)
	fbne	%f3, %f0, fbeq_else.32853
	addi	%v0, %zero, 1
	j	fbeq_cont.32854
fbeq_else.32853:
	addi	%v0, %zero, 0
fbeq_cont.32854:
	beqi	%v0, 0, bnei_else.32855
	addi	%v0, %zero, 0
	j	bnei_cont.32848
bnei_else.32855:
	addi	%v0, %zero, 1
bnei_cont.32856:
	j	bnei_cont.32848
bnei_else.32851:
	addi	%v0, %zero, 0
bnei_cont.32852:
	j	bnei_cont.32848
bnei_else.32847:
	addi	%v0, %zero, 0
bnei_cont.32848:
	beqi	%v0, 0, bnei_else.32857
	fsw	%f2, 135(%zero)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.32857:
	addi	%v0, %zero, 0
	jr	%ra
iter_setup_dirvec_constants.2877:
	blti	%v1, 0, bgti_else.32899
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.32900
	beqi	%a3, 2, bnei_else.32902
	addi	%a3, %zero, 5
	flw	%f0, 494(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 4(%sp)
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a0, 4(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.32904
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)
	flw	%f5, 0(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0
	lw	%a0, 9(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1
	lw	%a0, 9(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	j	bnei_cont.32905
bnei_else.32904:
bnei_cont.32905:
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f4, %f0, %f4
	fneg	%f4, %f4
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f5, %f1, %f5
	fneg	%f5, %f5
	lw	%a0, 4(%v1)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fneg	%f6, %f6
	fsw	%f3, 0(%v0)
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.32906
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f8, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f9, 2(%a0)
	fmul	%f10, %f1, %f9
	fadd	%f8, %f8, %f10
	flw	%f10, 464(%zero)
	fmul	%f8, %f8, %f10
	fsub	%f4, %f4, %f8
	fsw	%f4, 1(%v0)
	lw	%v1, 9(%v1)
	flw	%f4, 0(%v1)
	fmul	%f2, %f2, %f4
	fmul	%f8, %f0, %f9
	fadd	%f2, %f2, %f8
	fmul	%f2, %f2, %f10
	fsub	%f2, %f5, %f2
	fsw	%f2, 2(%v0)
	fmul	%f1, %f1, %f4
	fmul	%f0, %f0, %f7
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f10
	fsub	%f0, %f6, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.32907
bnei_else.32906:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.32907:
	flw	%f0, 3(%sp)
	fbne	%f3, %f0, fbeq_else.32908
	addi	%v1, %zero, 1
	j	fbeq_cont.32909
fbeq_else.32908:
	addi	%v1, %zero, 0
fbeq_cont.32909:
	beqi	%v1, 0, bnei_else.32910
	j	bnei_cont.32911
bnei_else.32910:
	flw	%f0, 484(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.32911:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.32901
bnei_else.32902:
	addi	%a3, %zero, 4
	flw	%f0, 494(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	fsw	%f0, 6(%sp)
	sw	%a0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 4(%sp)
	lw	%a1, 4(%a0)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f2, 1(%v1)
	lw	%a1, 4(%a0)
	flw	%f3, 1(%a1)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%v1)
	lw	%v1, 4(%a0)
	flw	%f4, 2(%v1)
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	flw	%f2, 6(%sp)
	fblt	%f2, %f0, fbgt_else.32912
	addi	%v1, %zero, 0
	j	fbgt_cont.32913
fbgt_else.32912:
	addi	%v1, %zero, 1
fbgt_cont.32913:
	beqi	%v1, 0, bnei_else.32914
	flw	%f2, 460(%zero)
	fdiv	%f2, %f2, %f0
	fsw	%f2, 0(%v0)
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	fsw	%f1, 1(%v0)
	fdiv	%f1, %f3, %f0
	fneg	%f1, %f1
	fsw	%f1, 2(%v0)
	fdiv	%f0, %f4, %f0
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.32915
bnei_else.32914:
	fsw	%f2, 0(%v0)
bnei_cont.32915:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.32903:
	j	bnei_cont.32901
bnei_else.32900:
	addi	%a3, %zero, 6
	flw	%f0, 494(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a0, 4(%sp)
	fsw	%f0, 7(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 7(%sp)
	fbne	%f0, %f1, fbeq_else.32916
	addi	%a0, %zero, 1
	j	fbeq_cont.32917
fbeq_else.32916:
	addi	%a0, %zero, 0
fbeq_cont.32917:
	beqi	%a0, 0, bnei_else.32918
	fsw	%f1, 1(%v0)
	j	bnei_cont.32919
bnei_else.32918:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.32920
	addi	%a2, %zero, 0
	j	fbgt_cont.32921
fbgt_else.32920:
	addi	%a2, %zero, 1
fbgt_cont.32921:
	beqi	%a1, 0, bnei_else.32922
	beqi	%a2, 0, bnei_else.32924
	addi	%a1, %zero, 0
	j	bnei_cont.32923
bnei_else.32924:
	addi	%a1, %zero, 1
bnei_cont.32925:
	j	bnei_cont.32923
bnei_else.32922:
	add	%a1, %zero, %a2
bnei_cont.32923:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.32926
	j	bnei_cont.32927
bnei_else.32926:
	fneg	%f2, %f2
bnei_cont.32927:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.32919:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.32928
	addi	%a0, %zero, 1
	j	fbeq_cont.32929
fbeq_else.32928:
	addi	%a0, %zero, 0
fbeq_cont.32929:
	beqi	%a0, 0, bnei_else.32930
	fsw	%f1, 3(%v0)
	j	bnei_cont.32931
bnei_else.32930:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.32932
	addi	%a2, %zero, 0
	j	fbgt_cont.32933
fbgt_else.32932:
	addi	%a2, %zero, 1
fbgt_cont.32933:
	beqi	%a1, 0, bnei_else.32934
	beqi	%a2, 0, bnei_else.32936
	addi	%a1, %zero, 0
	j	bnei_cont.32935
bnei_else.32936:
	addi	%a1, %zero, 1
bnei_cont.32937:
	j	bnei_cont.32935
bnei_else.32934:
	add	%a1, %zero, %a2
bnei_cont.32935:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.32938
	j	bnei_cont.32939
bnei_else.32938:
	fneg	%f2, %f2
bnei_cont.32939:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.32931:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.32940
	addi	%v1, %zero, 1
	j	fbeq_cont.32941
fbeq_else.32940:
	addi	%v1, %zero, 0
fbeq_cont.32941:
	beqi	%v1, 0, bnei_else.32942
	fsw	%f1, 5(%v0)
	j	bnei_cont.32943
bnei_else.32942:
	lw	%v1, 4(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.32944
	addi	%a1, %zero, 0
	j	fbgt_cont.32945
fbgt_else.32944:
	addi	%a1, %zero, 1
fbgt_cont.32945:
	beqi	%a0, 0, bnei_else.32946
	beqi	%a1, 0, bnei_else.32948
	addi	%a0, %zero, 0
	j	bnei_cont.32947
bnei_else.32948:
	addi	%a0, %zero, 1
bnei_cont.32949:
	j	bnei_cont.32947
bnei_else.32946:
	add	%a0, %zero, %a1
bnei_cont.32947:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.32950
	j	bnei_cont.32951
bnei_else.32950:
	fneg	%f1, %f1
bnei_cont.32951:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.32943:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.32901:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.32952
	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.32953
	beqi	%a3, 2, bnei_else.32955
	addi	%a3, %zero, 5
	flw	%f0, 494(%zero)
	sw	%v0, 8(%sp)
	sw	%a1, 9(%sp)
	fsw	%f0, 10(%sp)
	sw	%v1, 11(%sp)
	sw	%a2, 12(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 11(%sp)
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a0, 4(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.32957
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)
	flw	%f5, 0(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0
	lw	%a0, 9(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1
	lw	%a0, 9(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	j	bnei_cont.32958
bnei_else.32957:
bnei_cont.32958:
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f4, %f0, %f4
	fneg	%f4, %f4
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f5, %f1, %f5
	fneg	%f5, %f5
	lw	%a0, 4(%v1)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fneg	%f6, %f6
	fsw	%f3, 0(%v0)
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.32959
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 464(%zero)
	fmul	%f7, %f7, %f8
	fsub	%f4, %f4, %f7
	fsw	%f4, 1(%v0)
	lw	%a0, 9(%v1)
	flw	%f4, 0(%a0)
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)
	flw	%f4, 2(%a0)
	fmul	%f4, %f0, %f4
	fadd	%f2, %f2, %f4
	fmul	%f2, %f2, %f8
	fsub	%f2, %f5, %f2
	fsw	%f2, 2(%v0)
	lw	%a0, 9(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	lw	%v1, 9(%v1)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f8
	fsub	%f0, %f6, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.32960
bnei_else.32959:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.32960:
	flw	%f0, 10(%sp)
	fbne	%f3, %f0, fbeq_else.32961
	addi	%v1, %zero, 1
	j	fbeq_cont.32962
fbeq_else.32961:
	addi	%v1, %zero, 0
fbeq_cont.32962:
	beqi	%v1, 0, bnei_else.32963
	j	bnei_cont.32964
bnei_else.32963:
	flw	%f0, 484(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.32964:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.32954
bnei_else.32955:
	addi	%a3, %zero, 4
	flw	%f0, 494(%zero)
	sw	%v0, 8(%sp)
	sw	%a1, 9(%sp)
	fsw	%f0, 13(%sp)
	sw	%v1, 11(%sp)
	sw	%a2, 12(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 12(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 11(%sp)
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
	flw	%f1, 13(%sp)
	fblt	%f1, %f0, fbgt_else.32965
	addi	%v1, %zero, 0
	j	fbgt_cont.32966
fbgt_else.32965:
	addi	%v1, %zero, 1
fbgt_cont.32966:
	beqi	%v1, 0, bnei_else.32967
	flw	%f1, 460(%zero)
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
	j	bnei_cont.32968
bnei_else.32967:
	fsw	%f1, 0(%v0)
bnei_cont.32968:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.32956:
	j	bnei_cont.32954
bnei_else.32953:
	addi	%a3, %zero, 6
	flw	%f0, 494(%zero)
	sw	%v0, 8(%sp)
	sw	%a1, 9(%sp)
	sw	%v1, 11(%sp)
	fsw	%f0, 14(%sp)
	sw	%a2, 12(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 12(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 14(%sp)
	fbne	%f0, %f1, fbeq_else.32969
	addi	%a0, %zero, 1
	j	fbeq_cont.32970
fbeq_else.32969:
	addi	%a0, %zero, 0
fbeq_cont.32970:
	beqi	%a0, 0, bnei_else.32971
	fsw	%f1, 1(%v0)
	j	bnei_cont.32972
bnei_else.32971:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.32973
	addi	%a2, %zero, 0
	j	fbgt_cont.32974
fbgt_else.32973:
	addi	%a2, %zero, 1
fbgt_cont.32974:
	beqi	%a1, 0, bnei_else.32975
	beqi	%a2, 0, bnei_else.32977
	addi	%a1, %zero, 0
	j	bnei_cont.32976
bnei_else.32977:
	addi	%a1, %zero, 1
bnei_cont.32978:
	j	bnei_cont.32976
bnei_else.32975:
	add	%a1, %zero, %a2
bnei_cont.32976:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.32979
	j	bnei_cont.32980
bnei_else.32979:
	fneg	%f2, %f2
bnei_cont.32980:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.32972:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.32981
	addi	%a0, %zero, 1
	j	fbeq_cont.32982
fbeq_else.32981:
	addi	%a0, %zero, 0
fbeq_cont.32982:
	beqi	%a0, 0, bnei_else.32983
	fsw	%f1, 3(%v0)
	j	bnei_cont.32984
bnei_else.32983:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.32985
	addi	%a2, %zero, 0
	j	fbgt_cont.32986
fbgt_else.32985:
	addi	%a2, %zero, 1
fbgt_cont.32986:
	beqi	%a1, 0, bnei_else.32987
	beqi	%a2, 0, bnei_else.32989
	addi	%a1, %zero, 0
	j	bnei_cont.32988
bnei_else.32989:
	addi	%a1, %zero, 1
bnei_cont.32990:
	j	bnei_cont.32988
bnei_else.32987:
	add	%a1, %zero, %a2
bnei_cont.32988:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.32991
	j	bnei_cont.32992
bnei_else.32991:
	fneg	%f2, %f2
bnei_cont.32992:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.32984:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.32993
	addi	%v1, %zero, 1
	j	fbeq_cont.32994
fbeq_else.32993:
	addi	%v1, %zero, 0
fbeq_cont.32994:
	beqi	%v1, 0, bnei_else.32995
	fsw	%f1, 5(%v0)
	j	bnei_cont.32996
bnei_else.32995:
	lw	%v1, 11(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.32997
	addi	%a1, %zero, 0
	j	fbgt_cont.32998
fbgt_else.32997:
	addi	%a1, %zero, 1
fbgt_cont.32998:
	beqi	%a0, 0, bnei_else.32999
	beqi	%a1, 0, bnei_else.33001
	addi	%a0, %zero, 0
	j	bnei_cont.33000
bnei_else.33001:
	addi	%a0, %zero, 1
bnei_cont.33002:
	j	bnei_cont.33000
bnei_else.32999:
	add	%a0, %zero, %a1
bnei_cont.33000:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.33003
	j	bnei_cont.33004
bnei_else.33003:
	fneg	%f1, %f1
bnei_cont.33004:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.32996:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.32954:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2877
bgti_else.32952:
	jr	%ra
bgti_else.32899:
	jr	%ra
setup_dirvec_constants.2880:
	lw	%v1, 0(%zero)
	addi	%v1, %v1, -1
	blti	%v1, 0, bgti_else.33028
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.33029
	beqi	%a3, 2, bnei_else.33031
	addi	%a3, %zero, 5
	flw	%f0, 494(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	fsw	%f0, 3(%sp)
	sw	%a0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 4(%sp)
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a0, 4(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.33033
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)
	flw	%f5, 0(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0
	lw	%a0, 9(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1
	lw	%a0, 9(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	j	bnei_cont.33034
bnei_else.33033:
bnei_cont.33034:
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f4, %f0, %f4
	fneg	%f4, %f4
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f5, %f1, %f5
	fneg	%f5, %f5
	lw	%a0, 4(%v1)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fneg	%f6, %f6
	fsw	%f3, 0(%v0)
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.33035
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 464(%zero)
	fmul	%f7, %f7, %f8
	fsub	%f4, %f4, %f7
	fsw	%f4, 1(%v0)
	lw	%a0, 9(%v1)
	flw	%f4, 0(%a0)
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)
	flw	%f4, 2(%a0)
	fmul	%f4, %f0, %f4
	fadd	%f2, %f2, %f4
	fmul	%f2, %f2, %f8
	fsub	%f2, %f5, %f2
	fsw	%f2, 2(%v0)
	lw	%a0, 9(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	lw	%v1, 9(%v1)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f8
	fsub	%f0, %f6, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.33036
bnei_else.33035:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.33036:
	flw	%f0, 3(%sp)
	fbne	%f3, %f0, fbeq_else.33037
	addi	%v1, %zero, 1
	j	fbeq_cont.33038
fbeq_else.33037:
	addi	%v1, %zero, 0
fbeq_cont.33038:
	beqi	%v1, 0, bnei_else.33039
	j	bnei_cont.33040
bnei_else.33039:
	flw	%f0, 484(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.33040:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.33030
bnei_else.33031:
	addi	%a3, %zero, 4
	flw	%f0, 494(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	fsw	%f0, 6(%sp)
	sw	%a0, 4(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 4(%sp)
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
	flw	%f1, 6(%sp)
	fblt	%f1, %f0, fbgt_else.33041
	addi	%v1, %zero, 0
	j	fbgt_cont.33042
fbgt_else.33041:
	addi	%v1, %zero, 1
fbgt_cont.33042:
	beqi	%v1, 0, bnei_else.33043
	flw	%f1, 460(%zero)
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
	j	bnei_cont.33044
bnei_else.33043:
	fsw	%f1, 0(%v0)
bnei_cont.33044:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.33032:
	j	bnei_cont.33030
bnei_else.33029:
	addi	%a3, %zero, 6
	flw	%f0, 494(%zero)
	sw	%v1, 1(%sp)
	sw	%a1, 2(%sp)
	sw	%a0, 4(%sp)
	fsw	%f0, 7(%sp)
	sw	%a2, 5(%sp)
	addi	%v0, %a3, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_create_float_array
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v1, 5(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 7(%sp)
	fbne	%f0, %f1, fbeq_else.33045
	addi	%a0, %zero, 1
	j	fbeq_cont.33046
fbeq_else.33045:
	addi	%a0, %zero, 0
fbeq_cont.33046:
	beqi	%a0, 0, bnei_else.33047
	fsw	%f1, 1(%v0)
	j	bnei_cont.33048
bnei_else.33047:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.33049
	addi	%a2, %zero, 0
	j	fbgt_cont.33050
fbgt_else.33049:
	addi	%a2, %zero, 1
fbgt_cont.33050:
	beqi	%a1, 0, bnei_else.33051
	beqi	%a2, 0, bnei_else.33053
	addi	%a1, %zero, 0
	j	bnei_cont.33052
bnei_else.33053:
	addi	%a1, %zero, 1
bnei_cont.33054:
	j	bnei_cont.33052
bnei_else.33051:
	add	%a1, %zero, %a2
bnei_cont.33052:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.33055
	j	bnei_cont.33056
bnei_else.33055:
	fneg	%f2, %f2
bnei_cont.33056:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.33048:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.33057
	addi	%a0, %zero, 1
	j	fbeq_cont.33058
fbeq_else.33057:
	addi	%a0, %zero, 0
fbeq_cont.33058:
	beqi	%a0, 0, bnei_else.33059
	fsw	%f1, 3(%v0)
	j	bnei_cont.33060
bnei_else.33059:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.33061
	addi	%a2, %zero, 0
	j	fbgt_cont.33062
fbgt_else.33061:
	addi	%a2, %zero, 1
fbgt_cont.33062:
	beqi	%a1, 0, bnei_else.33063
	beqi	%a2, 0, bnei_else.33065
	addi	%a1, %zero, 0
	j	bnei_cont.33064
bnei_else.33065:
	addi	%a1, %zero, 1
bnei_cont.33066:
	j	bnei_cont.33064
bnei_else.33063:
	add	%a1, %zero, %a2
bnei_cont.33064:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.33067
	j	bnei_cont.33068
bnei_else.33067:
	fneg	%f2, %f2
bnei_cont.33068:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.33060:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.33069
	addi	%v1, %zero, 1
	j	fbeq_cont.33070
fbeq_else.33069:
	addi	%v1, %zero, 0
fbeq_cont.33070:
	beqi	%v1, 0, bnei_else.33071
	fsw	%f1, 5(%v0)
	j	bnei_cont.33072
bnei_else.33071:
	lw	%v1, 4(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.33073
	addi	%a1, %zero, 0
	j	fbgt_cont.33074
fbgt_else.33073:
	addi	%a1, %zero, 1
fbgt_cont.33074:
	beqi	%a0, 0, bnei_else.33075
	beqi	%a1, 0, bnei_else.33077
	addi	%a0, %zero, 0
	j	bnei_cont.33076
bnei_else.33077:
	addi	%a0, %zero, 1
bnei_cont.33078:
	j	bnei_cont.33076
bnei_else.33075:
	add	%a0, %zero, %a1
bnei_cont.33076:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.33079
	j	bnei_cont.33080
bnei_else.33079:
	fneg	%f1, %f1
bnei_cont.33080:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.33072:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.33030:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2877
bgti_else.33028:
	jr	%ra
setup_startp_constants.2882:
	blti	%v1, 0, bgti_else.33083
	lw	%a0, 12(%v1)
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
	beqi	%a2, 2, bnei_else.33084
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.33086
	j	bnei_cont.33085
bgt_else.33086:
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	fmul	%f3, %f0, %f0
	lw	%a3, 4(%a0)
	flw	%f4, 0(%a3)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a3, 4(%a0)
	flw	%f5, 1(%a3)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a3, 4(%a0)
	flw	%f5, 2(%a3)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a3, 3(%a0)
	beqi	%a3, 0, bnei_else.33088
	fmul	%f4, %f1, %f2
	lw	%a3, 9(%a0)
	flw	%f5, 0(%a3)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f2, %f2, %f0
	lw	%a3, 9(%a0)
	flw	%f4, 1(%a3)
	fmul	%f2, %f2, %f4
	fadd	%f2, %f3, %f2
	fmul	%f0, %f0, %f1
	lw	%a0, 9(%a0)
	flw	%f1, 2(%a0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.33089
bnei_else.33088:
	fmov	%f0, %f3
bnei_cont.33089:
	beqi	%a2, 3, bnei_else.33090
	j	bnei_cont.33091
bnei_else.33090:
	flw	%f1, 484(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.33091:
	fsw	%f0, 3(%a1)
bgt_cont.33087:
	j	bnei_cont.33085
bnei_else.33084:
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
bnei_cont.33085:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2882
bgti_else.33083:
	jr	%ra
check_all_inside.2907:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33093
	lw	%a0, 12(%a0)
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
	beqi	%a1, 1, bnei_else.33094
	beqi	%a1, 2, bnei_else.33096
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)
	flw	%f7, 0(%a1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a1, 4(%a0)
	flw	%f8, 1(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a1, 4(%a0)
	flw	%f8, 2(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a1, 3(%a0)
	beqi	%a1, 0, bnei_else.33098
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	flw	%f8, 0(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f5, %f5, %f3
	lw	%a1, 9(%a0)
	flw	%f7, 1(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4
	lw	%a1, 9(%a0)
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	j	bnei_cont.33099
bnei_else.33098:
	fmov	%f3, %f6
bnei_cont.33099:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.33100
	j	bnei_cont.33101
bnei_else.33100:
	flw	%f4, 484(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.33101:
	lw	%a0, 6(%a0)
	flw	%f4, 494(%zero)
	fblt	%f3, %f4, fbgt_else.33102
	addi	%a1, %zero, 0
	j	fbgt_cont.33103
fbgt_else.33102:
	addi	%a1, %zero, 1
fbgt_cont.33103:
	beqi	%a0, 0, bnei_else.33104
	beqi	%a1, 0, bnei_else.33106
	addi	%a0, %zero, 0
	j	bnei_cont.33105
bnei_else.33106:
	addi	%a0, %zero, 1
bnei_cont.33107:
	j	bnei_cont.33105
bnei_else.33104:
	add	%a0, %zero, %a1
bnei_cont.33105:
	beqi	%a0, 0, bnei_else.33108
	addi	%a0, %zero, 0
	j	bnei_cont.33095
bnei_else.33108:
	addi	%a0, %zero, 1
bnei_cont.33109:
	j	bnei_cont.33095
bnei_else.33096:
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
	flw	%f4, 494(%zero)
	fblt	%f3, %f4, fbgt_else.33110
	addi	%a1, %zero, 0
	j	fbgt_cont.33111
fbgt_else.33110:
	addi	%a1, %zero, 1
fbgt_cont.33111:
	beqi	%a0, 0, bnei_else.33112
	beqi	%a1, 0, bnei_else.33114
	addi	%a0, %zero, 0
	j	bnei_cont.33113
bnei_else.33114:
	addi	%a0, %zero, 1
bnei_cont.33115:
	j	bnei_cont.33113
bnei_else.33112:
	add	%a0, %zero, %a1
bnei_cont.33113:
	beqi	%a0, 0, bnei_else.33116
	addi	%a0, %zero, 0
	j	bnei_cont.33117
bnei_else.33116:
	addi	%a0, %zero, 1
bnei_cont.33117:
bnei_cont.33097:
	j	bnei_cont.33095
bnei_else.33094:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.33118
	addi	%a1, %zero, 0
	j	fbgt_cont.33119
fbgt_else.33118:
	addi	%a1, %zero, 1
fbgt_cont.33119:
	beqi	%a1, 0, bnei_else.33120
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.33122
	addi	%a1, %zero, 0
	j	fbgt_cont.33123
fbgt_else.33122:
	addi	%a1, %zero, 1
fbgt_cont.33123:
	beqi	%a1, 0, bnei_else.33124
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.33126
	addi	%a1, %zero, 0
	j	bnei_cont.33121
fbgt_else.33126:
	addi	%a1, %zero, 1
fbgt_cont.33127:
	j	bnei_cont.33121
bnei_else.33124:
	addi	%a1, %zero, 0
bnei_cont.33125:
	j	bnei_cont.33121
bnei_else.33120:
	addi	%a1, %zero, 0
bnei_cont.33121:
	beqi	%a1, 0, bnei_else.33128
	lw	%a0, 6(%a0)
	j	bnei_cont.33129
bnei_else.33128:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.33130
	addi	%a0, %zero, 0
	j	bnei_cont.33131
bnei_else.33130:
	addi	%a0, %zero, 1
bnei_cont.33131:
bnei_cont.33129:
bnei_cont.33095:
	beqi	%a0, 0, bnei_else.33132
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.33132:
	addi	%v0, %v0, 1
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33133
	lw	%a0, 12(%a0)
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
	beqi	%a1, 1, bnei_else.33134
	beqi	%a1, 2, bnei_else.33136
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)
	flw	%f7, 0(%a1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a1, 4(%a0)
	flw	%f8, 1(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a1, 4(%a0)
	flw	%f8, 2(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a1, 3(%a0)
	beqi	%a1, 0, bnei_else.33138
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	flw	%f8, 0(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f5, %f5, %f3
	lw	%a1, 9(%a0)
	flw	%f7, 1(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4
	lw	%a1, 9(%a0)
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	j	bnei_cont.33139
bnei_else.33138:
	fmov	%f3, %f6
bnei_cont.33139:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.33140
	j	bnei_cont.33141
bnei_else.33140:
	flw	%f4, 484(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.33141:
	lw	%a0, 6(%a0)
	flw	%f4, 494(%zero)
	fblt	%f3, %f4, fbgt_else.33142
	addi	%a1, %zero, 0
	j	fbgt_cont.33143
fbgt_else.33142:
	addi	%a1, %zero, 1
fbgt_cont.33143:
	beqi	%a0, 0, bnei_else.33144
	beqi	%a1, 0, bnei_else.33146
	addi	%a0, %zero, 0
	j	bnei_cont.33145
bnei_else.33146:
	addi	%a0, %zero, 1
bnei_cont.33147:
	j	bnei_cont.33145
bnei_else.33144:
	add	%a0, %zero, %a1
bnei_cont.33145:
	beqi	%a0, 0, bnei_else.33148
	addi	%a0, %zero, 0
	j	bnei_cont.33135
bnei_else.33148:
	addi	%a0, %zero, 1
bnei_cont.33149:
	j	bnei_cont.33135
bnei_else.33136:
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
	flw	%f4, 494(%zero)
	fblt	%f3, %f4, fbgt_else.33150
	addi	%a1, %zero, 0
	j	fbgt_cont.33151
fbgt_else.33150:
	addi	%a1, %zero, 1
fbgt_cont.33151:
	beqi	%a0, 0, bnei_else.33152
	beqi	%a1, 0, bnei_else.33154
	addi	%a0, %zero, 0
	j	bnei_cont.33153
bnei_else.33154:
	addi	%a0, %zero, 1
bnei_cont.33155:
	j	bnei_cont.33153
bnei_else.33152:
	add	%a0, %zero, %a1
bnei_cont.33153:
	beqi	%a0, 0, bnei_else.33156
	addi	%a0, %zero, 0
	j	bnei_cont.33157
bnei_else.33156:
	addi	%a0, %zero, 1
bnei_cont.33157:
bnei_cont.33137:
	j	bnei_cont.33135
bnei_else.33134:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.33158
	addi	%a1, %zero, 0
	j	fbgt_cont.33159
fbgt_else.33158:
	addi	%a1, %zero, 1
fbgt_cont.33159:
	beqi	%a1, 0, bnei_else.33160
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.33162
	addi	%a1, %zero, 0
	j	fbgt_cont.33163
fbgt_else.33162:
	addi	%a1, %zero, 1
fbgt_cont.33163:
	beqi	%a1, 0, bnei_else.33164
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.33166
	addi	%a1, %zero, 0
	j	bnei_cont.33161
fbgt_else.33166:
	addi	%a1, %zero, 1
fbgt_cont.33167:
	j	bnei_cont.33161
bnei_else.33164:
	addi	%a1, %zero, 0
bnei_cont.33165:
	j	bnei_cont.33161
bnei_else.33160:
	addi	%a1, %zero, 0
bnei_cont.33161:
	beqi	%a1, 0, bnei_else.33168
	lw	%a0, 6(%a0)
	j	bnei_cont.33169
bnei_else.33168:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.33170
	addi	%a0, %zero, 0
	j	bnei_cont.33171
bnei_else.33170:
	addi	%a0, %zero, 1
bnei_cont.33171:
bnei_cont.33169:
bnei_cont.33135:
	beqi	%a0, 0, bnei_else.33172
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.33172:
	addi	%v0, %v0, 1
	j	check_all_inside.2907
bnei_else.33133:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.33093:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2913:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33179
	lw	%a1, 12(%a0)
	flw	%f0, 138(%zero)
	lw	%a2, 5(%a1)
	flw	%f1, 0(%a2)
	fsub	%f1, %f0, %f1
	addi	%a2, %zero, 1
	flw	%f2, 139(%zero)
	lw	%a3, 5(%a1)
	flw	%f3, 1(%a3)
	fsub	%f3, %f2, %f3
	flw	%f4, 140(%zero)
	lw	%a3, 5(%a1)
	flw	%f5, 2(%a3)
	fsub	%f5, %f4, %f5
	lw	%a0, 187(%a0)
	lw	%a3, 1(%a1)
	beqi	%a3, 1, bnei_else.33180
	beqi	%a3, 2, bnei_else.33182
	flw	%f6, 0(%a0)
	flw	%f7, 494(%zero)
	fbne	%f6, %f7, fbeq_else.33184
	addi	%a3, %zero, 1
	j	fbeq_cont.33185
fbeq_else.33184:
	addi	%a3, %zero, 0
fbeq_cont.33185:
	beqi	%a3, 0, bnei_else.33186
	addi	%a0, %zero, 0
	j	bnei_cont.33181
bnei_else.33186:
	flw	%f8, 1(%a0)
	fmul	%f8, %f8, %f1
	flw	%f9, 2(%a0)
	fmul	%f9, %f9, %f3
	fadd	%f8, %f8, %f9
	flw	%f9, 3(%a0)
	fmul	%f9, %f9, %f5
	fadd	%f8, %f8, %f9
	fmul	%f9, %f1, %f1
	lw	%a3, 4(%a1)
	flw	%f10, 0(%a3)
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f3
	lw	%a3, 4(%a1)
	flw	%f11, 1(%a3)
	fmul	%f10, %f10, %f11
	fadd	%f9, %f9, %f10
	fmul	%f10, %f5, %f5
	lw	%a3, 4(%a1)
	flw	%f11, 2(%a3)
	fmul	%f10, %f10, %f11
	fadd	%f9, %f9, %f10
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.33188
	fmul	%f10, %f3, %f5
	lw	%a3, 9(%a1)
	flw	%f11, 0(%a3)
	fmul	%f10, %f10, %f11
	fadd	%f9, %f9, %f10
	fmul	%f5, %f5, %f1
	lw	%a3, 9(%a1)
	flw	%f10, 1(%a3)
	fmul	%f5, %f5, %f10
	fadd	%f5, %f9, %f5
	fmul	%f1, %f1, %f3
	lw	%a3, 9(%a1)
	flw	%f3, 2(%a3)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f5, %f1
	j	bnei_cont.33189
bnei_else.33188:
	fmov	%f1, %f9
bnei_cont.33189:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.33190
	j	bnei_cont.33191
bnei_else.33190:
	flw	%f3, 484(%zero)
	fsub	%f1, %f1, %f3
bnei_cont.33191:
	fmul	%f3, %f8, %f8
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	fblt	%f7, %f1, fbgt_else.33192
	addi	%a3, %zero, 0
	j	fbgt_cont.33193
fbgt_else.33192:
	addi	%a3, %zero, 1
fbgt_cont.33193:
	beqi	%a3, 0, bnei_else.33194
	lw	%a3, 6(%a1)
	beqi	%a3, 0, bnei_else.33196
	fsqrt	%f1, %f1
	fadd	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
	j	bnei_cont.33197
bnei_else.33196:
	fsqrt	%f1, %f1
	fsub	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
bnei_cont.33197:
	addi	%a0, %zero, 1
	j	bnei_cont.33195
bnei_else.33194:
	addi	%a0, %zero, 0
bnei_cont.33195:
bnei_cont.33187:
	j	bnei_cont.33181
bnei_else.33182:
	flw	%f6, 0(%a0)
	flw	%f7, 494(%zero)
	fblt	%f6, %f7, fbgt_else.33198
	addi	%a3, %zero, 0
	j	fbgt_cont.33199
fbgt_else.33198:
	addi	%a3, %zero, 1
fbgt_cont.33199:
	beqi	%a3, 0, bnei_else.33200
	flw	%f6, 1(%a0)
	fmul	%f1, %f6, %f1
	flw	%f6, 2(%a0)
	fmul	%f3, %f6, %f3
	fadd	%f1, %f1, %f3
	flw	%f3, 3(%a0)
	fmul	%f3, %f3, %f5
	fadd	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.33201
bnei_else.33200:
	addi	%a0, %zero, 0
bnei_cont.33201:
bnei_cont.33183:
	j	bnei_cont.33181
bnei_else.33180:
	flw	%f6, 0(%a0)
	fsub	%f6, %f6, %f1
	flw	%f7, 1(%a0)
	fmul	%f6, %f6, %f7
	flw	%f8, 185(%zero)
	fmul	%f9, %f6, %f8
	fadd	%f9, %f9, %f3
	fabs	%f9, %f9
	lw	%a3, 4(%a1)
	flw	%f10, 1(%a3)
	fblt	%f9, %f10, fbgt_else.33202
	addi	%a3, %zero, 0
	j	fbgt_cont.33203
fbgt_else.33202:
	addi	%a3, %zero, 1
fbgt_cont.33203:
	beqi	%a3, 0, bnei_else.33204
	flw	%f9, 186(%zero)
	fmul	%f9, %f6, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	lw	%a3, 4(%a1)
	flw	%f10, 2(%a3)
	fblt	%f9, %f10, fbgt_else.33206
	addi	%a3, %zero, 0
	j	fbgt_cont.33207
fbgt_else.33206:
	addi	%a3, %zero, 1
fbgt_cont.33207:
	beqi	%a3, 0, bnei_else.33208
	flw	%f9, 494(%zero)
	fbne	%f7, %f9, fbeq_else.33210
	addi	%a3, %zero, 1
	j	fbeq_cont.33211
fbeq_else.33210:
	addi	%a3, %zero, 0
fbeq_cont.33211:
	beqi	%a3, 0, bnei_else.33212
	addi	%a3, %zero, 0
	j	bnei_cont.33205
bnei_else.33212:
	addi	%a3, %zero, 1
bnei_cont.33213:
	j	bnei_cont.33205
bnei_else.33208:
	addi	%a3, %zero, 0
bnei_cont.33209:
	j	bnei_cont.33205
bnei_else.33204:
	addi	%a3, %zero, 0
bnei_cont.33205:
	beqi	%a3, 0, bnei_else.33214
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.33215
bnei_else.33214:
	flw	%f6, 2(%a0)
	fsub	%f6, %f6, %f3
	flw	%f7, 3(%a0)
	fmul	%f6, %f6, %f7
	flw	%f9, 184(%zero)
	fmul	%f10, %f6, %f9
	fadd	%f10, %f10, %f1
	fabs	%f10, %f10
	lw	%a3, 4(%a1)
	flw	%f11, 0(%a3)
	fblt	%f10, %f11, fbgt_else.33216
	addi	%a3, %zero, 0
	j	fbgt_cont.33217
fbgt_else.33216:
	addi	%a3, %zero, 1
fbgt_cont.33217:
	beqi	%a3, 0, bnei_else.33218
	flw	%f10, 186(%zero)
	fmul	%f10, %f6, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	lw	%a3, 4(%a1)
	flw	%f11, 2(%a3)
	fblt	%f10, %f11, fbgt_else.33220
	addi	%a3, %zero, 0
	j	fbgt_cont.33221
fbgt_else.33220:
	addi	%a3, %zero, 1
fbgt_cont.33221:
	beqi	%a3, 0, bnei_else.33222
	flw	%f10, 494(%zero)
	fbne	%f7, %f10, fbeq_else.33224
	addi	%a3, %zero, 1
	j	fbeq_cont.33225
fbeq_else.33224:
	addi	%a3, %zero, 0
fbeq_cont.33225:
	beqi	%a3, 0, bnei_else.33226
	addi	%a3, %zero, 0
	j	bnei_cont.33219
bnei_else.33226:
	addi	%a3, %zero, 1
bnei_cont.33227:
	j	bnei_cont.33219
bnei_else.33222:
	addi	%a3, %zero, 0
bnei_cont.33223:
	j	bnei_cont.33219
bnei_else.33218:
	addi	%a3, %zero, 0
bnei_cont.33219:
	beqi	%a3, 0, bnei_else.33228
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.33229
bnei_else.33228:
	flw	%f6, 4(%a0)
	fsub	%f5, %f6, %f5
	flw	%f6, 5(%a0)
	fmul	%f5, %f5, %f6
	fmul	%f7, %f5, %f9
	fadd	%f1, %f7, %f1
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f7, 0(%a0)
	fblt	%f1, %f7, fbgt_else.33230
	addi	%a0, %zero, 0
	j	fbgt_cont.33231
fbgt_else.33230:
	addi	%a0, %zero, 1
fbgt_cont.33231:
	beqi	%a0, 0, bnei_else.33232
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f3, 1(%a0)
	fblt	%f1, %f3, fbgt_else.33234
	addi	%a0, %zero, 0
	j	fbgt_cont.33235
fbgt_else.33234:
	addi	%a0, %zero, 1
fbgt_cont.33235:
	beqi	%a0, 0, bnei_else.33236
	flw	%f1, 494(%zero)
	fbne	%f6, %f1, fbeq_else.33238
	addi	%a0, %zero, 1
	j	fbeq_cont.33239
fbeq_else.33238:
	addi	%a0, %zero, 0
fbeq_cont.33239:
	beqi	%a0, 0, bnei_else.33240
	addi	%a0, %zero, 0
	j	bnei_cont.33233
bnei_else.33240:
	addi	%a0, %zero, 1
bnei_cont.33241:
	j	bnei_cont.33233
bnei_else.33236:
	addi	%a0, %zero, 0
bnei_cont.33237:
	j	bnei_cont.33233
bnei_else.33232:
	addi	%a0, %zero, 0
bnei_cont.33233:
	beqi	%a0, 0, bnei_else.33242
	fsw	%f5, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.33243
bnei_else.33242:
	addi	%a0, %zero, 0
bnei_cont.33243:
bnei_cont.33229:
bnei_cont.33215:
bnei_cont.33181:
	flw	%f1, 135(%zero)
	beqi	%a0, 0, bnei_else.33244
	flw	%f3, 459(%zero)
	fblt	%f1, %f3, fbgt_else.33246
	addi	%a0, %zero, 0
	j	bnei_cont.33245
fbgt_else.33246:
	addi	%a0, %zero, 1
fbgt_cont.33247:
	j	bnei_cont.33245
bnei_else.33244:
	addi	%a0, %zero, 0
bnei_cont.33245:
	beqi	%a0, 0, bnei_else.33248
	flw	%f3, 458(%zero)
	fadd	%f1, %f1, %f3
	flw	%f3, 78(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f0, %f3, %f0
	flw	%f3, 79(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f3, %f2
	flw	%f3, 80(%zero)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f1, %f4
	lw	%a0, 0(%v1)
	sw	%v1, 0(%sp)
	sw	%v0, 1(%sp)
	beqi	%a0, -1, bnei_else.33249
	lw	%a0, 12(%a0)
	lw	%a1, 5(%a0)
	flw	%f3, 0(%a1)
	fsub	%f3, %f0, %f3
	lw	%a1, 5(%a0)
	flw	%f4, 1(%a1)
	fsub	%f4, %f2, %f4
	lw	%a1, 5(%a0)
	flw	%f5, 2(%a1)
	fsub	%f5, %f1, %f5
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.33251
	beqi	%a1, 2, bnei_else.33253
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)
	flw	%f7, 0(%a1)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a1, 4(%a0)
	flw	%f8, 1(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a1, 4(%a0)
	flw	%f8, 2(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a1, 3(%a0)
	beqi	%a1, 0, bnei_else.33255
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	flw	%f8, 0(%a1)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f5, %f5, %f3
	lw	%a1, 9(%a0)
	flw	%f7, 1(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4
	lw	%a1, 9(%a0)
	flw	%f4, 2(%a1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	j	bnei_cont.33256
bnei_else.33255:
	fmov	%f3, %f6
bnei_cont.33256:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.33257
	j	bnei_cont.33258
bnei_else.33257:
	flw	%f4, 484(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.33258:
	lw	%a0, 6(%a0)
	flw	%f4, 494(%zero)
	fblt	%f3, %f4, fbgt_else.33259
	addi	%a1, %zero, 0
	j	fbgt_cont.33260
fbgt_else.33259:
	addi	%a1, %zero, 1
fbgt_cont.33260:
	beqi	%a0, 0, bnei_else.33261
	beqi	%a1, 0, bnei_else.33263
	addi	%a0, %zero, 0
	j	bnei_cont.33262
bnei_else.33263:
	addi	%a0, %zero, 1
bnei_cont.33264:
	j	bnei_cont.33262
bnei_else.33261:
	add	%a0, %zero, %a1
bnei_cont.33262:
	beqi	%a0, 0, bnei_else.33265
	addi	%a0, %zero, 0
	j	bnei_cont.33252
bnei_else.33265:
	addi	%a0, %zero, 1
bnei_cont.33266:
	j	bnei_cont.33252
bnei_else.33253:
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
	flw	%f4, 494(%zero)
	fblt	%f3, %f4, fbgt_else.33267
	addi	%a1, %zero, 0
	j	fbgt_cont.33268
fbgt_else.33267:
	addi	%a1, %zero, 1
fbgt_cont.33268:
	beqi	%a0, 0, bnei_else.33269
	beqi	%a1, 0, bnei_else.33271
	addi	%a0, %zero, 0
	j	bnei_cont.33270
bnei_else.33271:
	addi	%a0, %zero, 1
bnei_cont.33272:
	j	bnei_cont.33270
bnei_else.33269:
	add	%a0, %zero, %a1
bnei_cont.33270:
	beqi	%a0, 0, bnei_else.33273
	addi	%a0, %zero, 0
	j	bnei_cont.33274
bnei_else.33273:
	addi	%a0, %zero, 1
bnei_cont.33274:
bnei_cont.33254:
	j	bnei_cont.33252
bnei_else.33251:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.33275
	addi	%a1, %zero, 0
	j	fbgt_cont.33276
fbgt_else.33275:
	addi	%a1, %zero, 1
fbgt_cont.33276:
	beqi	%a1, 0, bnei_else.33277
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.33279
	addi	%a1, %zero, 0
	j	fbgt_cont.33280
fbgt_else.33279:
	addi	%a1, %zero, 1
fbgt_cont.33280:
	beqi	%a1, 0, bnei_else.33281
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.33283
	addi	%a1, %zero, 0
	j	bnei_cont.33278
fbgt_else.33283:
	addi	%a1, %zero, 1
fbgt_cont.33284:
	j	bnei_cont.33278
bnei_else.33281:
	addi	%a1, %zero, 0
bnei_cont.33282:
	j	bnei_cont.33278
bnei_else.33277:
	addi	%a1, %zero, 0
bnei_cont.33278:
	beqi	%a1, 0, bnei_else.33285
	lw	%a0, 6(%a0)
	j	bnei_cont.33286
bnei_else.33285:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.33287
	addi	%a0, %zero, 0
	j	bnei_cont.33288
bnei_else.33287:
	addi	%a0, %zero, 1
bnei_cont.33288:
bnei_cont.33286:
bnei_cont.33252:
	beqi	%a0, 0, bnei_else.33289
	addi	%v0, %zero, 0
	j	bnei_cont.33250
bnei_else.33289:
	addi	%v0, %a2, 0
	fmov	%f29, %f2
	fmov	%f2, %f1
	fmov	%f1, %f29
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	check_all_inside.2907
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
bnei_cont.33290:
	j	bnei_cont.33250
bnei_else.33249:
	addi	%v0, %zero, 1
bnei_cont.33250:
	beqi	%v0, 0, bnei_else.33291
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.33291:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2913
bnei_else.33248:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.33292
	addi	%v0, %v0, 1
	j	shadow_check_and_group.2913
bnei_else.33292:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.33179:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2916:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33304
	lw	%a0, 83(%a0)
	addi	%a1, %zero, 0
	sw	%a1, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.33305
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.33305:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33306
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.33307
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.33307:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33308
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.33309
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.33309:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33310
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.33311
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.33311:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2916
bnei_else.33310:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.33308:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.33306:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.33304:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.33344
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.33345
	lw	%a3, 12(%a2)
	flw	%f0, 138(%zero)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%t0, 5(%a3)
	flw	%f2, 1(%t0)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%t0, 5(%a3)
	flw	%f3, 2(%t0)
	fsub	%f2, %f2, %f3
	lw	%a2, 187(%a2)
	lw	%t0, 1(%a3)
	beqi	%t0, 1, bnei_else.33347
	beqi	%t0, 2, bnei_else.33349
	flw	%f3, 0(%a2)
	flw	%f4, 494(%zero)
	fbne	%f3, %f4, fbeq_else.33351
	addi	%t0, %zero, 1
	j	fbeq_cont.33352
fbeq_else.33351:
	addi	%t0, %zero, 0
fbeq_cont.33352:
	beqi	%t0, 0, bnei_else.33353
	addi	%a2, %zero, 0
	j	bnei_cont.33348
bnei_else.33353:
	flw	%f5, 1(%a2)
	fmul	%f5, %f5, %f0
	flw	%f6, 2(%a2)
	fmul	%f6, %f6, %f1
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%a2)
	fmul	%f6, %f6, %f2
	fadd	%f5, %f5, %f6
	fmul	%f6, %f0, %f0
	lw	%t0, 4(%a3)
	flw	%f7, 0(%t0)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f1, %f1
	lw	%t0, 4(%a3)
	flw	%f8, 1(%t0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f2, %f2
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%t0, 3(%a3)
	beqi	%t0, 0, bnei_else.33355
	fmul	%f7, %f1, %f2
	lw	%t0, 9(%a3)
	flw	%f8, 0(%t0)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f2, %f2, %f0
	lw	%t0, 9(%a3)
	flw	%f7, 1(%t0)
	fmul	%f2, %f2, %f7
	fadd	%f2, %f6, %f2
	fmul	%f0, %f0, %f1
	lw	%t0, 9(%a3)
	flw	%f1, 2(%t0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.33356
bnei_else.33355:
	fmov	%f0, %f6
bnei_cont.33356:
	lw	%t0, 1(%a3)
	beqi	%t0, 3, bnei_else.33357
	j	bnei_cont.33358
bnei_else.33357:
	flw	%f1, 484(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.33358:
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0
	fsub	%f0, %f1, %f0
	fblt	%f4, %f0, fbgt_else.33359
	addi	%t0, %zero, 0
	j	fbgt_cont.33360
fbgt_else.33359:
	addi	%t0, %zero, 1
fbgt_cont.33360:
	beqi	%t0, 0, bnei_else.33361
	lw	%a3, 6(%a3)
	beqi	%a3, 0, bnei_else.33363
	fsqrt	%f0, %f0
	fadd	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.33364
bnei_else.33363:
	fsqrt	%f0, %f0
	fsub	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.33364:
	addi	%a2, %zero, 1
	j	bnei_cont.33362
bnei_else.33361:
	addi	%a2, %zero, 0
bnei_cont.33362:
bnei_cont.33354:
	j	bnei_cont.33348
bnei_else.33349:
	flw	%f3, 0(%a2)
	flw	%f4, 494(%zero)
	fblt	%f3, %f4, fbgt_else.33365
	addi	%a3, %zero, 0
	j	fbgt_cont.33366
fbgt_else.33365:
	addi	%a3, %zero, 1
fbgt_cont.33366:
	beqi	%a3, 0, bnei_else.33367
	flw	%f3, 1(%a2)
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a2)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a2, %zero, 1
	j	bnei_cont.33368
bnei_else.33367:
	addi	%a2, %zero, 0
bnei_cont.33368:
bnei_cont.33350:
	j	bnei_cont.33348
bnei_else.33347:
	flw	%f3, 0(%a2)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a2)
	fmul	%f3, %f3, %f4
	flw	%f5, 185(%zero)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%t0, 4(%a3)
	flw	%f7, 1(%t0)
	fblt	%f6, %f7, fbgt_else.33369
	addi	%t0, %zero, 0
	j	fbgt_cont.33370
fbgt_else.33369:
	addi	%t0, %zero, 1
fbgt_cont.33370:
	beqi	%t0, 0, bnei_else.33371
	flw	%f6, 186(%zero)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t0, 4(%a3)
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.33373
	addi	%t0, %zero, 0
	j	fbgt_cont.33374
fbgt_else.33373:
	addi	%t0, %zero, 1
fbgt_cont.33374:
	beqi	%t0, 0, bnei_else.33375
	flw	%f6, 494(%zero)
	fbne	%f4, %f6, fbeq_else.33377
	addi	%t0, %zero, 1
	j	fbeq_cont.33378
fbeq_else.33377:
	addi	%t0, %zero, 0
fbeq_cont.33378:
	beqi	%t0, 0, bnei_else.33379
	addi	%t0, %zero, 0
	j	bnei_cont.33372
bnei_else.33379:
	addi	%t0, %zero, 1
bnei_cont.33380:
	j	bnei_cont.33372
bnei_else.33375:
	addi	%t0, %zero, 0
bnei_cont.33376:
	j	bnei_cont.33372
bnei_else.33371:
	addi	%t0, %zero, 0
bnei_cont.33372:
	beqi	%t0, 0, bnei_else.33381
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 1
	j	bnei_cont.33382
bnei_else.33381:
	flw	%f3, 2(%a2)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%a2)
	fmul	%f3, %f3, %f4
	flw	%f6, 184(%zero)
	fmul	%f7, %f3, %f6
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 0(%t0)
	fblt	%f7, %f8, fbgt_else.33383
	addi	%t0, %zero, 0
	j	fbgt_cont.33384
fbgt_else.33383:
	addi	%t0, %zero, 1
fbgt_cont.33384:
	beqi	%t0, 0, bnei_else.33385
	flw	%f7, 186(%zero)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.33387
	addi	%t0, %zero, 0
	j	fbgt_cont.33388
fbgt_else.33387:
	addi	%t0, %zero, 1
fbgt_cont.33388:
	beqi	%t0, 0, bnei_else.33389
	flw	%f7, 494(%zero)
	fbne	%f4, %f7, fbeq_else.33391
	addi	%t0, %zero, 1
	j	fbeq_cont.33392
fbeq_else.33391:
	addi	%t0, %zero, 0
fbeq_cont.33392:
	beqi	%t0, 0, bnei_else.33393
	addi	%t0, %zero, 0
	j	bnei_cont.33386
bnei_else.33393:
	addi	%t0, %zero, 1
bnei_cont.33394:
	j	bnei_cont.33386
bnei_else.33389:
	addi	%t0, %zero, 0
bnei_cont.33390:
	j	bnei_cont.33386
bnei_else.33385:
	addi	%t0, %zero, 0
bnei_cont.33386:
	beqi	%t0, 0, bnei_else.33395
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 2
	j	bnei_cont.33396
bnei_else.33395:
	flw	%f3, 4(%a2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f4, 0(%a2)
	fblt	%f0, %f4, fbgt_else.33397
	addi	%a2, %zero, 0
	j	fbgt_cont.33398
fbgt_else.33397:
	addi	%a2, %zero, 1
fbgt_cont.33398:
	beqi	%a2, 0, bnei_else.33399
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f1, 1(%a2)
	fblt	%f0, %f1, fbgt_else.33401
	addi	%a2, %zero, 0
	j	fbgt_cont.33402
fbgt_else.33401:
	addi	%a2, %zero, 1
fbgt_cont.33402:
	beqi	%a2, 0, bnei_else.33403
	flw	%f0, 494(%zero)
	fbne	%f3, %f0, fbeq_else.33405
	addi	%a2, %zero, 1
	j	fbeq_cont.33406
fbeq_else.33405:
	addi	%a2, %zero, 0
fbeq_cont.33406:
	beqi	%a2, 0, bnei_else.33407
	addi	%a2, %zero, 0
	j	bnei_cont.33400
bnei_else.33407:
	addi	%a2, %zero, 1
bnei_cont.33408:
	j	bnei_cont.33400
bnei_else.33403:
	addi	%a2, %zero, 0
bnei_cont.33404:
	j	bnei_cont.33400
bnei_else.33399:
	addi	%a2, %zero, 0
bnei_cont.33400:
	beqi	%a2, 0, bnei_else.33409
	fsw	%f2, 135(%zero)
	addi	%a2, %zero, 3
	j	bnei_cont.33410
bnei_else.33409:
	addi	%a2, %zero, 0
bnei_cont.33410:
bnei_cont.33396:
bnei_cont.33382:
bnei_cont.33348:
	beqi	%a2, 0, bnei_else.33411
	flw	%f0, 135(%zero)
	flw	%f1, 457(%zero)
	fblt	%f0, %f1, fbgt_else.33413
	addi	%a2, %zero, 0
	j	fbgt_cont.33414
fbgt_else.33413:
	addi	%a2, %zero, 1
fbgt_cont.33414:
	beqi	%a2, 0, bnei_else.33415
	lw	%a2, 1(%a0)
	beqi	%a2, -1, bnei_else.33417
	lw	%a2, 83(%a2)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.33419
	addi	%v0, %zero, 1
	j	bnei_cont.33418
bnei_else.33419:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.33421
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.33423
	addi	%v0, %zero, 1
	j	bnei_cont.33422
bnei_else.33423:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.33425
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.33427
	addi	%v0, %zero, 1
	j	bnei_cont.33426
bnei_else.33427:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.33428:
	j	bnei_cont.33426
bnei_else.33425:
	addi	%v0, %zero, 0
bnei_cont.33426:
bnei_cont.33424:
	j	bnei_cont.33422
bnei_else.33421:
	addi	%v0, %zero, 0
bnei_cont.33422:
bnei_cont.33420:
	j	bnei_cont.33418
bnei_else.33417:
	addi	%v0, %zero, 0
bnei_cont.33418:
	beqi	%v0, 0, bnei_else.33429
	addi	%v0, %zero, 1
	j	bnei_cont.33346
bnei_else.33429:
	addi	%v0, %zero, 0
bnei_cont.33430:
	j	bnei_cont.33346
bnei_else.33415:
	addi	%v0, %zero, 0
bnei_cont.33416:
	j	bnei_cont.33346
bnei_else.33411:
	addi	%v0, %zero, 0
bnei_cont.33412:
	j	bnei_cont.33346
bnei_else.33345:
	addi	%v0, %zero, 1
bnei_cont.33346:
	beqi	%v0, 0, bnei_else.33431
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.33432
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.33434
	addi	%v0, %zero, 1
	j	bnei_cont.33433
bnei_else.33434:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.33436
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.33438
	addi	%v0, %zero, 1
	j	bnei_cont.33437
bnei_else.33438:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.33440
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.33442
	addi	%v0, %zero, 1
	j	bnei_cont.33441
bnei_else.33442:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.33443:
	j	bnei_cont.33441
bnei_else.33440:
	addi	%v0, %zero, 0
bnei_cont.33441:
bnei_cont.33439:
	j	bnei_cont.33437
bnei_else.33436:
	addi	%v0, %zero, 0
bnei_cont.33437:
bnei_cont.33435:
	j	bnei_cont.33433
bnei_else.33432:
	addi	%v0, %zero, 0
bnei_cont.33433:
	beqi	%v0, 0, bnei_else.33444
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.33444:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.33431:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.33344:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2922:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.33494
	lw	%a2, 12(%a1)
	flw	%f0, 159(%zero)
	lw	%a3, 5(%a2)
	flw	%f1, 0(%a3)
	fsub	%f1, %f0, %f1
	addi	%a3, %zero, 1
	flw	%f2, 160(%zero)
	lw	%t0, 5(%a2)
	flw	%f3, 1(%t0)
	fsub	%f3, %f2, %f3
	flw	%f4, 161(%zero)
	lw	%t0, 5(%a2)
	flw	%f5, 2(%t0)
	fsub	%f5, %f4, %f5
	lw	%t0, 1(%a2)
	sw	%a1, 0(%sp)
	sw	%a3, 1(%sp)
	fsw	%f4, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%v1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a2, 8(%sp)
	beqi	%t0, 1, bnei_else.33495
	beqi	%t0, 2, bnei_else.33497
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0
	fmov	%f2, %f5
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solver_second.2818
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.33496
bnei_else.33497:
	lw	%t0, 4(%a2)
	flw	%f6, 0(%a0)
	flw	%f7, 0(%t0)
	fmul	%f6, %f6, %f7
	flw	%f8, 1(%a0)
	flw	%f9, 1(%t0)
	fmul	%f8, %f8, %f9
	fadd	%f6, %f6, %f8
	flw	%f8, 2(%a0)
	flw	%f10, 2(%t0)
	fmul	%f8, %f8, %f10
	fadd	%f6, %f6, %f8
	flw	%f8, 494(%zero)
	fblt	%f8, %f6, fbgt_else.33499
	addi	%t0, %zero, 0
	j	fbgt_cont.33500
fbgt_else.33499:
	addi	%t0, %zero, 1
fbgt_cont.33500:
	beqi	%t0, 0, bnei_else.33501
	fmul	%f1, %f7, %f1
	fmul	%f3, %f9, %f3
	fadd	%f1, %f1, %f3
	fmul	%f3, %f10, %f5
	fadd	%f1, %f1, %f3
	fneg	%f1, %f1
	fdiv	%f1, %f1, %f6
	fsw	%f1, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.33502
bnei_else.33501:
	addi	%v0, %zero, 0
bnei_cont.33502:
bnei_cont.33498:
	j	bnei_cont.33496
bnei_else.33495:
	flw	%f6, 0(%a0)
	flw	%f7, 494(%zero)
	fbne	%f6, %f7, fbeq_else.33503
	addi	%t0, %zero, 1
	j	fbeq_cont.33504
fbeq_else.33503:
	addi	%t0, %zero, 0
fbeq_cont.33504:
	beqi	%t0, 0, bnei_else.33505
	addi	%t0, %zero, 0
	j	bnei_cont.33506
bnei_else.33505:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f6, %f7, fbgt_else.33507
	addi	%t2, %zero, 0
	j	fbgt_cont.33508
fbgt_else.33507:
	addi	%t2, %zero, 1
fbgt_cont.33508:
	beqi	%t1, 0, bnei_else.33509
	beqi	%t2, 0, bnei_else.33511
	addi	%t1, %zero, 0
	j	bnei_cont.33510
bnei_else.33511:
	addi	%t1, %zero, 1
bnei_cont.33512:
	j	bnei_cont.33510
bnei_else.33509:
	add	%t1, %zero, %t2
bnei_cont.33510:
	flw	%f8, 0(%t0)
	beqi	%t1, 0, bnei_else.33513
	j	bnei_cont.33514
bnei_else.33513:
	fneg	%f8, %f8
bnei_cont.33514:
	fsub	%f8, %f8, %f1
	fdiv	%f8, %f8, %f6
	flw	%f9, 1(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f3
	fabs	%f9, %f9
	flw	%f10, 1(%t0)
	fblt	%f9, %f10, fbgt_else.33515
	addi	%t1, %zero, 0
	j	fbgt_cont.33516
fbgt_else.33515:
	addi	%t1, %zero, 1
fbgt_cont.33516:
	beqi	%t1, 0, bnei_else.33517
	flw	%f9, 2(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	flw	%f10, 2(%t0)
	fblt	%f9, %f10, fbgt_else.33519
	addi	%t0, %zero, 0
	j	fbgt_cont.33520
fbgt_else.33519:
	addi	%t0, %zero, 1
fbgt_cont.33520:
	beqi	%t0, 0, bnei_else.33521
	fsw	%f8, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.33518
bnei_else.33521:
	addi	%t0, %zero, 0
bnei_cont.33522:
	j	bnei_cont.33518
bnei_else.33517:
	addi	%t0, %zero, 0
bnei_cont.33518:
bnei_cont.33506:
	beqi	%t0, 0, bnei_else.33523
	addi	%v0, %zero, 1
	j	bnei_cont.33524
bnei_else.33523:
	flw	%f8, 1(%a0)
	fbne	%f8, %f7, fbeq_else.33525
	addi	%t0, %zero, 1
	j	fbeq_cont.33526
fbeq_else.33525:
	addi	%t0, %zero, 0
fbeq_cont.33526:
	beqi	%t0, 0, bnei_else.33527
	addi	%t0, %zero, 0
	j	bnei_cont.33528
bnei_else.33527:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f8, %f7, fbgt_else.33529
	addi	%t2, %zero, 0
	j	fbgt_cont.33530
fbgt_else.33529:
	addi	%t2, %zero, 1
fbgt_cont.33530:
	beqi	%t1, 0, bnei_else.33531
	beqi	%t2, 0, bnei_else.33533
	addi	%t1, %zero, 0
	j	bnei_cont.33532
bnei_else.33533:
	addi	%t1, %zero, 1
bnei_cont.33534:
	j	bnei_cont.33532
bnei_else.33531:
	add	%t1, %zero, %t2
bnei_cont.33532:
	flw	%f9, 1(%t0)
	beqi	%t1, 0, bnei_else.33535
	j	bnei_cont.33536
bnei_else.33535:
	fneg	%f9, %f9
bnei_cont.33536:
	fsub	%f9, %f9, %f3
	fdiv	%f9, %f9, %f8
	flw	%f10, 2(%a0)
	fmul	%f10, %f9, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	flw	%f11, 2(%t0)
	fblt	%f10, %f11, fbgt_else.33537
	addi	%t1, %zero, 0
	j	fbgt_cont.33538
fbgt_else.33537:
	addi	%t1, %zero, 1
fbgt_cont.33538:
	beqi	%t1, 0, bnei_else.33539
	fmul	%f10, %f9, %f6
	fadd	%f10, %f10, %f1
	fabs	%f10, %f10
	flw	%f11, 0(%t0)
	fblt	%f10, %f11, fbgt_else.33541
	addi	%t0, %zero, 0
	j	fbgt_cont.33542
fbgt_else.33541:
	addi	%t0, %zero, 1
fbgt_cont.33542:
	beqi	%t0, 0, bnei_else.33543
	fsw	%f9, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.33540
bnei_else.33543:
	addi	%t0, %zero, 0
bnei_cont.33544:
	j	bnei_cont.33540
bnei_else.33539:
	addi	%t0, %zero, 0
bnei_cont.33540:
bnei_cont.33528:
	beqi	%t0, 0, bnei_else.33545
	addi	%v0, %zero, 2
	j	bnei_cont.33546
bnei_else.33545:
	flw	%f9, 2(%a0)
	fbne	%f9, %f7, fbeq_else.33547
	addi	%t0, %zero, 1
	j	fbeq_cont.33548
fbeq_else.33547:
	addi	%t0, %zero, 0
fbeq_cont.33548:
	beqi	%t0, 0, bnei_else.33549
	addi	%t0, %zero, 0
	j	bnei_cont.33550
bnei_else.33549:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f9, %f7, fbgt_else.33551
	addi	%t2, %zero, 0
	j	fbgt_cont.33552
fbgt_else.33551:
	addi	%t2, %zero, 1
fbgt_cont.33552:
	beqi	%t1, 0, bnei_else.33553
	beqi	%t2, 0, bnei_else.33555
	addi	%t1, %zero, 0
	j	bnei_cont.33554
bnei_else.33555:
	addi	%t1, %zero, 1
bnei_cont.33556:
	j	bnei_cont.33554
bnei_else.33553:
	add	%t1, %zero, %t2
bnei_cont.33554:
	flw	%f7, 2(%t0)
	beqi	%t1, 0, bnei_else.33557
	j	bnei_cont.33558
bnei_else.33557:
	fneg	%f7, %f7
bnei_cont.33558:
	fsub	%f5, %f7, %f5
	fdiv	%f5, %f5, %f9
	fmul	%f6, %f5, %f6
	fadd	%f1, %f6, %f1
	fabs	%f1, %f1
	flw	%f6, 0(%t0)
	fblt	%f1, %f6, fbgt_else.33559
	addi	%t1, %zero, 0
	j	fbgt_cont.33560
fbgt_else.33559:
	addi	%t1, %zero, 1
fbgt_cont.33560:
	beqi	%t1, 0, bnei_else.33561
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	flw	%f3, 1(%t0)
	fblt	%f1, %f3, fbgt_else.33563
	addi	%t0, %zero, 0
	j	fbgt_cont.33564
fbgt_else.33563:
	addi	%t0, %zero, 1
fbgt_cont.33564:
	beqi	%t0, 0, bnei_else.33565
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.33562
bnei_else.33565:
	addi	%t0, %zero, 0
bnei_cont.33566:
	j	bnei_cont.33562
bnei_else.33561:
	addi	%t0, %zero, 0
bnei_cont.33562:
bnei_cont.33550:
	beqi	%t0, 0, bnei_else.33567
	addi	%v0, %zero, 3
	j	bnei_cont.33568
bnei_else.33567:
	addi	%v0, %zero, 0
bnei_cont.33568:
bnei_cont.33546:
bnei_cont.33524:
bnei_cont.33496:
	beqi	%v0, 0, bnei_else.33569
	flw	%f0, 135(%zero)
	flw	%f1, 494(%zero)
	fblt	%f1, %f0, fbgt_else.33570
	addi	%v1, %zero, 0
	j	fbgt_cont.33571
fbgt_else.33570:
	addi	%v1, %zero, 1
fbgt_cont.33571:
	beqi	%v1, 0, bnei_else.33572
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.33574
	addi	%v1, %zero, 0
	j	fbgt_cont.33575
fbgt_else.33574:
	addi	%v1, %zero, 1
fbgt_cont.33575:
	beqi	%v1, 0, bnei_else.33576
	flw	%f2, 458(%zero)
	fadd	%f0, %f0, %f2
	lw	%a0, 5(%sp)
	flw	%f2, 0(%a0)
	fmul	%f2, %f2, %f0
	flw	%f3, 4(%sp)
	fadd	%f2, %f2, %f3
	flw	%f3, 1(%a0)
	fmul	%f3, %f3, %f0
	flw	%f4, 3(%sp)
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a0)
	fmul	%f4, %f4, %f0
	flw	%f5, 2(%sp)
	fadd	%f4, %f4, %f5
	lw	%v1, 6(%sp)
	lw	%a1, 0(%v1)
	sw	%v0, 9(%sp)
	fsw	%f4, 10(%sp)
	fsw	%f3, 11(%sp)
	fsw	%f2, 12(%sp)
	fsw	%f0, 13(%sp)
	beqi	%a1, -1, bnei_else.33578
	lw	%a1, 12(%a1)
	lw	%a2, 5(%a1)
	flw	%f5, 0(%a2)
	fsub	%f5, %f2, %f5
	lw	%a2, 5(%a1)
	flw	%f6, 1(%a2)
	fsub	%f6, %f3, %f6
	lw	%a2, 5(%a1)
	flw	%f7, 2(%a2)
	fsub	%f7, %f4, %f7
	lw	%a2, 1(%a1)
	beqi	%a2, 1, bnei_else.33580
	beqi	%a2, 2, bnei_else.33582
	fmul	%f8, %f5, %f5
	lw	%a2, 4(%a1)
	flw	%f9, 0(%a2)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	lw	%a2, 4(%a1)
	flw	%f10, 1(%a2)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7
	lw	%a2, 4(%a1)
	flw	%f10, 2(%a2)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%a2, 3(%a1)
	beqi	%a2, 0, bnei_else.33584
	fmul	%f9, %f6, %f7
	lw	%a2, 9(%a1)
	flw	%f10, 0(%a2)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f7, %f7, %f5
	lw	%a2, 9(%a1)
	flw	%f9, 1(%a2)
	fmul	%f7, %f7, %f9
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6
	lw	%a2, 9(%a1)
	flw	%f6, 2(%a2)
	fmul	%f5, %f5, %f6
	fadd	%f5, %f7, %f5
	j	bnei_cont.33585
bnei_else.33584:
	fmov	%f5, %f8
bnei_cont.33585:
	lw	%a2, 1(%a1)
	beqi	%a2, 3, bnei_else.33586
	j	bnei_cont.33587
bnei_else.33586:
	flw	%f6, 484(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.33587:
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.33588
	addi	%a2, %zero, 0
	j	fbgt_cont.33589
fbgt_else.33588:
	addi	%a2, %zero, 1
fbgt_cont.33589:
	beqi	%a1, 0, bnei_else.33590
	beqi	%a2, 0, bnei_else.33592
	addi	%a1, %zero, 0
	j	bnei_cont.33591
bnei_else.33592:
	addi	%a1, %zero, 1
bnei_cont.33593:
	j	bnei_cont.33591
bnei_else.33590:
	add	%a1, %zero, %a2
bnei_cont.33591:
	beqi	%a1, 0, bnei_else.33594
	addi	%a1, %zero, 0
	j	bnei_cont.33581
bnei_else.33594:
	addi	%a1, %zero, 1
bnei_cont.33595:
	j	bnei_cont.33581
bnei_else.33582:
	lw	%a2, 4(%a1)
	flw	%f8, 0(%a2)
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%a2)
	fmul	%f6, %f8, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%a2)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.33596
	addi	%a2, %zero, 0
	j	fbgt_cont.33597
fbgt_else.33596:
	addi	%a2, %zero, 1
fbgt_cont.33597:
	beqi	%a1, 0, bnei_else.33598
	beqi	%a2, 0, bnei_else.33600
	addi	%a1, %zero, 0
	j	bnei_cont.33599
bnei_else.33600:
	addi	%a1, %zero, 1
bnei_cont.33601:
	j	bnei_cont.33599
bnei_else.33598:
	add	%a1, %zero, %a2
bnei_cont.33599:
	beqi	%a1, 0, bnei_else.33602
	addi	%a1, %zero, 0
	j	bnei_cont.33603
bnei_else.33602:
	addi	%a1, %zero, 1
bnei_cont.33603:
bnei_cont.33583:
	j	bnei_cont.33581
bnei_else.33580:
	fabs	%f1, %f5
	lw	%a2, 4(%a1)
	flw	%f5, 0(%a2)
	fblt	%f1, %f5, fbgt_else.33604
	addi	%a2, %zero, 0
	j	fbgt_cont.33605
fbgt_else.33604:
	addi	%a2, %zero, 1
fbgt_cont.33605:
	beqi	%a2, 0, bnei_else.33606
	fabs	%f1, %f6
	lw	%a2, 4(%a1)
	flw	%f5, 1(%a2)
	fblt	%f1, %f5, fbgt_else.33608
	addi	%a2, %zero, 0
	j	fbgt_cont.33609
fbgt_else.33608:
	addi	%a2, %zero, 1
fbgt_cont.33609:
	beqi	%a2, 0, bnei_else.33610
	fabs	%f1, %f7
	lw	%a2, 4(%a1)
	flw	%f5, 2(%a2)
	fblt	%f1, %f5, fbgt_else.33612
	addi	%a2, %zero, 0
	j	bnei_cont.33607
fbgt_else.33612:
	addi	%a2, %zero, 1
fbgt_cont.33613:
	j	bnei_cont.33607
bnei_else.33610:
	addi	%a2, %zero, 0
bnei_cont.33611:
	j	bnei_cont.33607
bnei_else.33606:
	addi	%a2, %zero, 0
bnei_cont.33607:
	beqi	%a2, 0, bnei_else.33614
	lw	%a1, 6(%a1)
	j	bnei_cont.33615
bnei_else.33614:
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.33616
	addi	%a1, %zero, 0
	j	bnei_cont.33617
bnei_else.33616:
	addi	%a1, %zero, 1
bnei_cont.33617:
bnei_cont.33615:
bnei_cont.33581:
	beqi	%a1, 0, bnei_else.33618
	addi	%v0, %zero, 0
	j	bnei_cont.33579
bnei_else.33618:
	lw	%a1, 1(%sp)
	addi	%v0, %a1, 0
	fmov	%f1, %f3
	fmov	%f0, %f2
	fmov	%f2, %f4
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	check_all_inside.2907
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
bnei_cont.33619:
	j	bnei_cont.33579
bnei_else.33578:
	addi	%v0, %zero, 1
bnei_cont.33579:
	beqi	%v0, 0, bnei_else.33620
	flw	%f0, 13(%sp)
	fsw	%f0, 137(%zero)
	flw	%f0, 12(%sp)
	fsw	%f0, 138(%zero)
	flw	%f0, 11(%sp)
	fsw	%f0, 139(%zero)
	flw	%f0, 10(%sp)
	fsw	%f0, 140(%zero)
	lw	%v0, 0(%sp)
	sw	%v0, 141(%zero)
	lw	%v0, 9(%sp)
	sw	%v0, 136(%zero)
	j	bnei_cont.33573
bnei_else.33620:
bnei_cont.33621:
	j	bnei_cont.33573
bnei_else.33576:
bnei_cont.33577:
	j	bnei_cont.33573
bnei_else.33572:
bnei_cont.33573:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2922
bnei_else.33569:
	lw	%v0, 8(%sp)
	lw	%v0, 6(%v0)
	beqi	%v0, 0, bnei_else.33622
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	lw	%a0, 5(%sp)
	j	solve_each_element.2922
bnei_else.33622:
	jr	%ra
bnei_else.33494:
	jr	%ra
solve_one_or_network.2926:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.33657
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element.2922
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33658
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33659
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element.2922
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33660
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33661
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2922
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33662
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element.2922
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33663
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element.2922
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.33664
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2922
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.2926
bnei_else.33664:
	jr	%ra
bnei_else.33663:
	jr	%ra
bnei_else.33662:
	jr	%ra
bnei_else.33661:
	jr	%ra
bnei_else.33660:
	jr	%ra
bnei_else.33659:
	jr	%ra
bnei_else.33658:
	jr	%ra
bnei_else.33657:
	jr	%ra
trace_or_matrix.2930:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.33796
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.33797
	lw	%a3, 12(%a3)
	flw	%f0, 159(%zero)
	lw	%t0, 5(%a3)
	flw	%f1, 0(%t0)
	fsub	%f0, %f0, %f1
	flw	%f1, 160(%zero)
	lw	%t0, 5(%a3)
	flw	%f2, 1(%t0)
	fsub	%f1, %f1, %f2
	flw	%f2, 161(%zero)
	lw	%t0, 5(%a3)
	flw	%f3, 2(%t0)
	fsub	%f2, %f2, %f3
	lw	%t0, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t0, 1, bnei_else.33799
	beqi	%t0, 2, bnei_else.33801
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solver_second.2818
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.33800
bnei_else.33801:
	lw	%a3, 4(%a3)
	flw	%f3, 0(%a0)
	flw	%f4, 0(%a3)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%a0)
	flw	%f6, 1(%a3)
	fmul	%f5, %f5, %f6
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%a0)
	flw	%f7, 2(%a3)
	fmul	%f5, %f5, %f7
	fadd	%f3, %f3, %f5
	flw	%f5, 494(%zero)
	fblt	%f5, %f3, fbgt_else.33803
	addi	%a3, %zero, 0
	j	fbgt_cont.33804
fbgt_else.33803:
	addi	%a3, %zero, 1
fbgt_cont.33804:
	beqi	%a3, 0, bnei_else.33805
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%v0, %zero, 1
	j	bnei_cont.33806
bnei_else.33805:
	addi	%v0, %zero, 0
bnei_cont.33806:
bnei_cont.33802:
	j	bnei_cont.33800
bnei_else.33799:
	flw	%f3, 0(%a0)
	flw	%f4, 494(%zero)
	fbne	%f3, %f4, fbeq_else.33807
	addi	%t0, %zero, 1
	j	fbeq_cont.33808
fbeq_else.33807:
	addi	%t0, %zero, 0
fbeq_cont.33808:
	beqi	%t0, 0, bnei_else.33809
	addi	%t0, %zero, 0
	j	bnei_cont.33810
bnei_else.33809:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f3, %f4, fbgt_else.33811
	addi	%t2, %zero, 0
	j	fbgt_cont.33812
fbgt_else.33811:
	addi	%t2, %zero, 1
fbgt_cont.33812:
	beqi	%t1, 0, bnei_else.33813
	beqi	%t2, 0, bnei_else.33815
	addi	%t1, %zero, 0
	j	bnei_cont.33814
bnei_else.33815:
	addi	%t1, %zero, 1
bnei_cont.33816:
	j	bnei_cont.33814
bnei_else.33813:
	add	%t1, %zero, %t2
bnei_cont.33814:
	flw	%f5, 0(%t0)
	beqi	%t1, 0, bnei_else.33817
	j	bnei_cont.33818
bnei_else.33817:
	fneg	%f5, %f5
bnei_cont.33818:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%t0)
	fblt	%f6, %f7, fbgt_else.33819
	addi	%t1, %zero, 0
	j	fbgt_cont.33820
fbgt_else.33819:
	addi	%t1, %zero, 1
fbgt_cont.33820:
	beqi	%t1, 0, bnei_else.33821
	flw	%f6, 2(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.33823
	addi	%t0, %zero, 0
	j	fbgt_cont.33824
fbgt_else.33823:
	addi	%t0, %zero, 1
fbgt_cont.33824:
	beqi	%t0, 0, bnei_else.33825
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.33822
bnei_else.33825:
	addi	%t0, %zero, 0
bnei_cont.33826:
	j	bnei_cont.33822
bnei_else.33821:
	addi	%t0, %zero, 0
bnei_cont.33822:
bnei_cont.33810:
	beqi	%t0, 0, bnei_else.33827
	addi	%v0, %zero, 1
	j	bnei_cont.33828
bnei_else.33827:
	flw	%f5, 1(%a0)
	fbne	%f5, %f4, fbeq_else.33829
	addi	%t0, %zero, 1
	j	fbeq_cont.33830
fbeq_else.33829:
	addi	%t0, %zero, 0
fbeq_cont.33830:
	beqi	%t0, 0, bnei_else.33831
	addi	%t0, %zero, 0
	j	bnei_cont.33832
bnei_else.33831:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f5, %f4, fbgt_else.33833
	addi	%t2, %zero, 0
	j	fbgt_cont.33834
fbgt_else.33833:
	addi	%t2, %zero, 1
fbgt_cont.33834:
	beqi	%t1, 0, bnei_else.33835
	beqi	%t2, 0, bnei_else.33837
	addi	%t1, %zero, 0
	j	bnei_cont.33836
bnei_else.33837:
	addi	%t1, %zero, 1
bnei_cont.33838:
	j	bnei_cont.33836
bnei_else.33835:
	add	%t1, %zero, %t2
bnei_cont.33836:
	flw	%f6, 1(%t0)
	beqi	%t1, 0, bnei_else.33839
	j	bnei_cont.33840
bnei_else.33839:
	fneg	%f6, %f6
bnei_cont.33840:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a0)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.33841
	addi	%t1, %zero, 0
	j	fbgt_cont.33842
fbgt_else.33841:
	addi	%t1, %zero, 1
fbgt_cont.33842:
	beqi	%t1, 0, bnei_else.33843
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%t0)
	fblt	%f7, %f8, fbgt_else.33845
	addi	%t0, %zero, 0
	j	fbgt_cont.33846
fbgt_else.33845:
	addi	%t0, %zero, 1
fbgt_cont.33846:
	beqi	%t0, 0, bnei_else.33847
	fsw	%f6, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.33844
bnei_else.33847:
	addi	%t0, %zero, 0
bnei_cont.33848:
	j	bnei_cont.33844
bnei_else.33843:
	addi	%t0, %zero, 0
bnei_cont.33844:
bnei_cont.33832:
	beqi	%t0, 0, bnei_else.33849
	addi	%v0, %zero, 2
	j	bnei_cont.33850
bnei_else.33849:
	flw	%f6, 2(%a0)
	fbne	%f6, %f4, fbeq_else.33851
	addi	%t0, %zero, 1
	j	fbeq_cont.33852
fbeq_else.33851:
	addi	%t0, %zero, 0
fbeq_cont.33852:
	beqi	%t0, 0, bnei_else.33853
	addi	%a3, %zero, 0
	j	bnei_cont.33854
bnei_else.33853:
	lw	%t0, 4(%a3)
	lw	%a3, 6(%a3)
	fblt	%f6, %f4, fbgt_else.33855
	addi	%t1, %zero, 0
	j	fbgt_cont.33856
fbgt_else.33855:
	addi	%t1, %zero, 1
fbgt_cont.33856:
	beqi	%a3, 0, bnei_else.33857
	beqi	%t1, 0, bnei_else.33859
	addi	%a3, %zero, 0
	j	bnei_cont.33858
bnei_else.33859:
	addi	%a3, %zero, 1
bnei_cont.33860:
	j	bnei_cont.33858
bnei_else.33857:
	add	%a3, %zero, %t1
bnei_cont.33858:
	flw	%f4, 2(%t0)
	beqi	%a3, 0, bnei_else.33861
	j	bnei_cont.33862
bnei_else.33861:
	fneg	%f4, %f4
bnei_cont.33862:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%t0)
	fblt	%f0, %f3, fbgt_else.33863
	addi	%a3, %zero, 0
	j	fbgt_cont.33864
fbgt_else.33863:
	addi	%a3, %zero, 1
fbgt_cont.33864:
	beqi	%a3, 0, bnei_else.33865
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.33867
	addi	%a3, %zero, 0
	j	fbgt_cont.33868
fbgt_else.33867:
	addi	%a3, %zero, 1
fbgt_cont.33868:
	beqi	%a3, 0, bnei_else.33869
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.33866
bnei_else.33869:
	addi	%a3, %zero, 0
bnei_cont.33870:
	j	bnei_cont.33866
bnei_else.33865:
	addi	%a3, %zero, 0
bnei_cont.33866:
bnei_cont.33854:
	beqi	%a3, 0, bnei_else.33871
	addi	%v0, %zero, 3
	j	bnei_cont.33872
bnei_else.33871:
	addi	%v0, %zero, 0
bnei_cont.33872:
bnei_cont.33850:
bnei_cont.33828:
bnei_cont.33800:
	beqi	%v0, 0, bnei_else.33873
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.33875
	addi	%v0, %zero, 0
	j	fbgt_cont.33876
fbgt_else.33875:
	addi	%v0, %zero, 1
fbgt_cont.33876:
	beqi	%v0, 0, bnei_else.33877
	lw	%v0, 4(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.33879
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.33881
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.33883
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.33885
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.33887
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.33889
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.33891
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.33798
bnei_else.33891:
bnei_cont.33892:
	j	bnei_cont.33798
bnei_else.33889:
bnei_cont.33890:
	j	bnei_cont.33798
bnei_else.33887:
bnei_cont.33888:
	j	bnei_cont.33798
bnei_else.33885:
bnei_cont.33886:
	j	bnei_cont.33798
bnei_else.33883:
bnei_cont.33884:
	j	bnei_cont.33798
bnei_else.33881:
bnei_cont.33882:
	j	bnei_cont.33798
bnei_else.33879:
bnei_cont.33880:
	j	bnei_cont.33798
bnei_else.33877:
bnei_cont.33878:
	j	bnei_cont.33798
bnei_else.33873:
bnei_cont.33874:
	j	bnei_cont.33798
bnei_else.33797:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.33893
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.33895
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.33897
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.33899
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.33901
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.33903
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.33905
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2922
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.33894
bnei_else.33905:
bnei_cont.33906:
	j	bnei_cont.33894
bnei_else.33903:
bnei_cont.33904:
	j	bnei_cont.33894
bnei_else.33901:
bnei_cont.33902:
	j	bnei_cont.33894
bnei_else.33899:
bnei_cont.33900:
	j	bnei_cont.33894
bnei_else.33897:
bnei_cont.33898:
	j	bnei_cont.33894
bnei_else.33895:
bnei_cont.33896:
	j	bnei_cont.33894
bnei_else.33893:
bnei_cont.33894:
bnei_cont.33798:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.33907
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.33908
	lw	%a1, 12(%a1)
	flw	%f0, 159(%zero)
	lw	%a2, 5(%a1)
	flw	%f1, 0(%a2)
	fsub	%f0, %f0, %f1
	flw	%f1, 160(%zero)
	lw	%a2, 5(%a1)
	flw	%f2, 1(%a2)
	fsub	%f1, %f1, %f2
	flw	%f2, 161(%zero)
	lw	%a2, 5(%a1)
	flw	%f3, 2(%a2)
	fsub	%f2, %f2, %f3
	lw	%a2, 1(%a1)
	beqi	%a2, 1, bnei_else.33910
	beqi	%a2, 2, bnei_else.33912
	lw	%a2, 0(%sp)
	flw	%f3, 0(%a2)
	flw	%f4, 1(%a2)
	flw	%f5, 2(%a2)
	fmul	%f6, %f3, %f3
	lw	%a3, 4(%a1)
	flw	%f7, 0(%a3)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a3, 4(%a1)
	flw	%f8, 1(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5
	lw	%a3, 4(%a1)
	flw	%f8, 2(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.33914
	fmul	%f7, %f4, %f5
	lw	%a3, 9(%a1)
	flw	%f8, 0(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3
	lw	%a3, 9(%a1)
	flw	%f8, 1(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f3, %f4
	lw	%a3, 9(%a1)
	flw	%f8, 2(%a3)
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	j	bnei_cont.33915
bnei_else.33914:
bnei_cont.33915:
	flw	%f7, 494(%zero)
	fbne	%f6, %f7, fbeq_else.33916
	addi	%a3, %zero, 1
	j	fbeq_cont.33917
fbeq_else.33916:
	addi	%a3, %zero, 0
fbeq_cont.33917:
	beqi	%a3, 0, bnei_else.33918
	addi	%a1, %zero, 0
	j	bnei_cont.33911
bnei_else.33918:
	fmul	%f8, %f3, %f0
	lw	%a3, 4(%a1)
	flw	%f9, 0(%a3)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1
	lw	%a3, 4(%a1)
	flw	%f10, 1(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f5, %f2
	lw	%a3, 4(%a1)
	flw	%f10, 2(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.33920
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2
	fadd	%f9, %f9, %f10
	lw	%a3, 9(%a1)
	flw	%f10, 0(%a3)
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2
	fmul	%f5, %f5, %f0
	fadd	%f5, %f10, %f5
	lw	%a3, 9(%a1)
	flw	%f10, 1(%a3)
	fmul	%f5, %f5, %f10
	fadd	%f5, %f9, %f5
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0
	fadd	%f3, %f3, %f4
	lw	%a3, 9(%a1)
	flw	%f4, 2(%a3)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	flw	%f4, 464(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f8, %f3
	j	bnei_cont.33921
bnei_else.33920:
	fmov	%f3, %f8
bnei_cont.33921:
	fmul	%f4, %f0, %f0
	lw	%a3, 4(%a1)
	flw	%f5, 0(%a3)
	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1
	lw	%a3, 4(%a1)
	flw	%f8, 1(%a3)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2
	lw	%a3, 4(%a1)
	flw	%f8, 2(%a3)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.33922
	fmul	%f5, %f1, %f2
	lw	%a3, 9(%a1)
	flw	%f8, 0(%a3)
	fmul	%f5, %f5, %f8
	fadd	%f4, %f4, %f5
	fmul	%f2, %f2, %f0
	lw	%a3, 9(%a1)
	flw	%f5, 1(%a3)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1
	lw	%a3, 9(%a1)
	flw	%f1, 2(%a3)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.33923
bnei_else.33922:
	fmov	%f0, %f4
bnei_cont.33923:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.33924
	j	bnei_cont.33925
bnei_else.33924:
	flw	%f1, 484(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.33925:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.33926
	addi	%a3, %zero, 0
	j	fbgt_cont.33927
fbgt_else.33926:
	addi	%a3, %zero, 1
fbgt_cont.33927:
	beqi	%a3, 0, bnei_else.33928
	fsqrt	%f0, %f0
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.33930
	j	bnei_cont.33931
bnei_else.33930:
	fneg	%f0, %f0
bnei_cont.33931:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.33929
bnei_else.33928:
	addi	%a1, %zero, 0
bnei_cont.33929:
bnei_cont.33919:
	j	bnei_cont.33911
bnei_else.33912:
	lw	%a1, 4(%a1)
	lw	%a2, 0(%sp)
	flw	%f3, 0(%a2)
	flw	%f4, 0(%a1)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%a2)
	flw	%f6, 1(%a1)
	fmul	%f5, %f5, %f6
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%a2)
	flw	%f7, 2(%a1)
	fmul	%f5, %f5, %f7
	fadd	%f3, %f3, %f5
	flw	%f5, 494(%zero)
	fblt	%f5, %f3, fbgt_else.33932
	addi	%a1, %zero, 0
	j	fbgt_cont.33933
fbgt_else.33932:
	addi	%a1, %zero, 1
fbgt_cont.33933:
	beqi	%a1, 0, bnei_else.33934
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.33935
bnei_else.33934:
	addi	%a1, %zero, 0
bnei_cont.33935:
bnei_cont.33913:
	j	bnei_cont.33911
bnei_else.33910:
	lw	%a2, 0(%sp)
	flw	%f3, 0(%a2)
	flw	%f4, 494(%zero)
	fbne	%f3, %f4, fbeq_else.33936
	addi	%a3, %zero, 1
	j	fbeq_cont.33937
fbeq_else.33936:
	addi	%a3, %zero, 0
fbeq_cont.33937:
	beqi	%a3, 0, bnei_else.33938
	addi	%a3, %zero, 0
	j	bnei_cont.33939
bnei_else.33938:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f3, %f4, fbgt_else.33940
	addi	%t1, %zero, 0
	j	fbgt_cont.33941
fbgt_else.33940:
	addi	%t1, %zero, 1
fbgt_cont.33941:
	beqi	%t0, 0, bnei_else.33942
	beqi	%t1, 0, bnei_else.33944
	addi	%t0, %zero, 0
	j	bnei_cont.33943
bnei_else.33944:
	addi	%t0, %zero, 1
bnei_cont.33945:
	j	bnei_cont.33943
bnei_else.33942:
	add	%t0, %zero, %t1
bnei_cont.33943:
	flw	%f5, 0(%a3)
	beqi	%t0, 0, bnei_else.33946
	j	bnei_cont.33947
bnei_else.33946:
	fneg	%f5, %f5
bnei_cont.33947:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%a3)
	fblt	%f6, %f7, fbgt_else.33948
	addi	%t0, %zero, 0
	j	fbgt_cont.33949
fbgt_else.33948:
	addi	%t0, %zero, 1
fbgt_cont.33949:
	beqi	%t0, 0, bnei_else.33950
	flw	%f6, 2(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%a3)
	fblt	%f6, %f7, fbgt_else.33952
	addi	%a3, %zero, 0
	j	fbgt_cont.33953
fbgt_else.33952:
	addi	%a3, %zero, 1
fbgt_cont.33953:
	beqi	%a3, 0, bnei_else.33954
	fsw	%f5, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.33951
bnei_else.33954:
	addi	%a3, %zero, 0
bnei_cont.33955:
	j	bnei_cont.33951
bnei_else.33950:
	addi	%a3, %zero, 0
bnei_cont.33951:
bnei_cont.33939:
	beqi	%a3, 0, bnei_else.33956
	addi	%a1, %zero, 1
	j	bnei_cont.33957
bnei_else.33956:
	flw	%f5, 1(%a2)
	fbne	%f5, %f4, fbeq_else.33958
	addi	%a3, %zero, 1
	j	fbeq_cont.33959
fbeq_else.33958:
	addi	%a3, %zero, 0
fbeq_cont.33959:
	beqi	%a3, 0, bnei_else.33960
	addi	%a3, %zero, 0
	j	bnei_cont.33961
bnei_else.33960:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f5, %f4, fbgt_else.33962
	addi	%t1, %zero, 0
	j	fbgt_cont.33963
fbgt_else.33962:
	addi	%t1, %zero, 1
fbgt_cont.33963:
	beqi	%t0, 0, bnei_else.33964
	beqi	%t1, 0, bnei_else.33966
	addi	%t0, %zero, 0
	j	bnei_cont.33965
bnei_else.33966:
	addi	%t0, %zero, 1
bnei_cont.33967:
	j	bnei_cont.33965
bnei_else.33964:
	add	%t0, %zero, %t1
bnei_cont.33965:
	flw	%f6, 1(%a3)
	beqi	%t0, 0, bnei_else.33968
	j	bnei_cont.33969
bnei_else.33968:
	fneg	%f6, %f6
bnei_cont.33969:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a2)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%a3)
	fblt	%f7, %f8, fbgt_else.33970
	addi	%t0, %zero, 0
	j	fbgt_cont.33971
fbgt_else.33970:
	addi	%t0, %zero, 1
fbgt_cont.33971:
	beqi	%t0, 0, bnei_else.33972
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%a3)
	fblt	%f7, %f8, fbgt_else.33974
	addi	%a3, %zero, 0
	j	fbgt_cont.33975
fbgt_else.33974:
	addi	%a3, %zero, 1
fbgt_cont.33975:
	beqi	%a3, 0, bnei_else.33976
	fsw	%f6, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.33973
bnei_else.33976:
	addi	%a3, %zero, 0
bnei_cont.33977:
	j	bnei_cont.33973
bnei_else.33972:
	addi	%a3, %zero, 0
bnei_cont.33973:
bnei_cont.33961:
	beqi	%a3, 0, bnei_else.33978
	addi	%a1, %zero, 2
	j	bnei_cont.33979
bnei_else.33978:
	flw	%f6, 2(%a2)
	fbne	%f6, %f4, fbeq_else.33980
	addi	%a3, %zero, 1
	j	fbeq_cont.33981
fbeq_else.33980:
	addi	%a3, %zero, 0
fbeq_cont.33981:
	beqi	%a3, 0, bnei_else.33982
	addi	%a1, %zero, 0
	j	bnei_cont.33983
bnei_else.33982:
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f6, %f4, fbgt_else.33984
	addi	%t0, %zero, 0
	j	fbgt_cont.33985
fbgt_else.33984:
	addi	%t0, %zero, 1
fbgt_cont.33985:
	beqi	%a1, 0, bnei_else.33986
	beqi	%t0, 0, bnei_else.33988
	addi	%a1, %zero, 0
	j	bnei_cont.33987
bnei_else.33988:
	addi	%a1, %zero, 1
bnei_cont.33989:
	j	bnei_cont.33987
bnei_else.33986:
	add	%a1, %zero, %t0
bnei_cont.33987:
	flw	%f4, 2(%a3)
	beqi	%a1, 0, bnei_else.33990
	j	bnei_cont.33991
bnei_else.33990:
	fneg	%f4, %f4
bnei_cont.33991:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%a3)
	fblt	%f0, %f3, fbgt_else.33992
	addi	%a1, %zero, 0
	j	fbgt_cont.33993
fbgt_else.33992:
	addi	%a1, %zero, 1
fbgt_cont.33993:
	beqi	%a1, 0, bnei_else.33994
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.33996
	addi	%a1, %zero, 0
	j	fbgt_cont.33997
fbgt_else.33996:
	addi	%a1, %zero, 1
fbgt_cont.33997:
	beqi	%a1, 0, bnei_else.33998
	fsw	%f2, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.33995
bnei_else.33998:
	addi	%a1, %zero, 0
bnei_cont.33999:
	j	bnei_cont.33995
bnei_else.33994:
	addi	%a1, %zero, 0
bnei_cont.33995:
bnei_cont.33983:
	beqi	%a1, 0, bnei_else.34000
	addi	%a1, %zero, 3
	j	bnei_cont.34001
bnei_else.34000:
	addi	%a1, %zero, 0
bnei_cont.34001:
bnei_cont.33979:
bnei_cont.33957:
bnei_cont.33911:
	beqi	%a1, 0, bnei_else.34002
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.34004
	addi	%a1, %zero, 0
	j	fbgt_cont.34005
fbgt_else.34004:
	addi	%a1, %zero, 1
fbgt_cont.34005:
	beqi	%a1, 0, bnei_else.34006
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.34008
	lw	%a1, 83(%a1)
	lw	%a3, 1(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.34010
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.34012
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.34014
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.34016
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.34018
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.33909
bnei_else.34018:
bnei_cont.34019:
	j	bnei_cont.33909
bnei_else.34016:
bnei_cont.34017:
	j	bnei_cont.33909
bnei_else.34014:
bnei_cont.34015:
	j	bnei_cont.33909
bnei_else.34012:
bnei_cont.34013:
	j	bnei_cont.33909
bnei_else.34010:
bnei_cont.34011:
	j	bnei_cont.33909
bnei_else.34008:
bnei_cont.34009:
	j	bnei_cont.33909
bnei_else.34006:
bnei_cont.34007:
	j	bnei_cont.33909
bnei_else.34002:
bnei_cont.34003:
	j	bnei_cont.33909
bnei_else.33908:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.34020
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.34022
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.34024
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.34026
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.34028
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.34030
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2922
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network.2926
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.34021
bnei_else.34030:
bnei_cont.34031:
	j	bnei_cont.34021
bnei_else.34028:
bnei_cont.34029:
	j	bnei_cont.34021
bnei_else.34026:
bnei_cont.34027:
	j	bnei_cont.34021
bnei_else.34024:
bnei_cont.34025:
	j	bnei_cont.34021
bnei_else.34022:
bnei_cont.34023:
	j	bnei_cont.34021
bnei_else.34020:
bnei_cont.34021:
bnei_cont.33909:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2930
bnei_else.33907:
	jr	%ra
bnei_else.33796:
	jr	%ra
solve_each_element_fast.2936:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.34068
	lw	%a3, 12(%a2)
	lw	%t0, 10(%a3)
	flw	%f0, 0(%t0)
	addi	%t1, %zero, 1
	flw	%f1, 1(%t0)
	flw	%f2, 2(%t0)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a2
	lw	%t2, 0(%at)
	lw	%t3, 1(%a3)
	beqi	%t3, 1, bnei_else.34069
	beqi	%t3, 2, bnei_else.34071
	flw	%f3, 0(%t2)
	flw	%f4, 494(%zero)
	fbne	%f3, %f4, fbeq_else.34073
	addi	%t3, %zero, 1
	j	fbeq_cont.34074
fbeq_else.34073:
	addi	%t3, %zero, 0
fbeq_cont.34074:
	beqi	%t3, 0, bnei_else.34075
	addi	%t0, %zero, 0
	j	bnei_cont.34070
bnei_else.34075:
	flw	%f5, 1(%t2)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%t2)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t2)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t0)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.34077
	addi	%t0, %zero, 0
	j	fbgt_cont.34078
fbgt_else.34077:
	addi	%t0, %zero, 1
fbgt_cont.34078:
	beqi	%t0, 0, bnei_else.34079
	lw	%t0, 6(%a3)
	beqi	%t0, 0, bnei_else.34081
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.34082
bnei_else.34081:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.34082:
	addi	%t0, %zero, 1
	j	bnei_cont.34080
bnei_else.34079:
	addi	%t0, %zero, 0
bnei_cont.34080:
bnei_cont.34076:
	j	bnei_cont.34070
bnei_else.34071:
	flw	%f0, 0(%t2)
	flw	%f1, 494(%zero)
	fblt	%f0, %f1, fbgt_else.34083
	addi	%t2, %zero, 0
	j	fbgt_cont.34084
fbgt_else.34083:
	addi	%t2, %zero, 1
fbgt_cont.34084:
	beqi	%t2, 0, bnei_else.34085
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.34086
bnei_else.34085:
	addi	%t0, %zero, 0
bnei_cont.34086:
bnei_cont.34072:
	j	bnei_cont.34070
bnei_else.34069:
	lw	%t0, 0(%a0)
	flw	%f3, 0(%t2)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%t2)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%t0)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%t3, 4(%a3)
	flw	%f7, 1(%t3)
	fblt	%f6, %f7, fbgt_else.34087
	addi	%t3, %zero, 0
	j	fbgt_cont.34088
fbgt_else.34087:
	addi	%t3, %zero, 1
fbgt_cont.34088:
	beqi	%t3, 0, bnei_else.34089
	flw	%f6, 2(%t0)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t3, 4(%a3)
	flw	%f7, 2(%t3)
	fblt	%f6, %f7, fbgt_else.34091
	addi	%t3, %zero, 0
	j	fbgt_cont.34092
fbgt_else.34091:
	addi	%t3, %zero, 1
fbgt_cont.34092:
	beqi	%t3, 0, bnei_else.34093
	flw	%f6, 494(%zero)
	fbne	%f4, %f6, fbeq_else.34095
	addi	%t3, %zero, 1
	j	fbeq_cont.34096
fbeq_else.34095:
	addi	%t3, %zero, 0
fbeq_cont.34096:
	beqi	%t3, 0, bnei_else.34097
	addi	%t3, %zero, 0
	j	bnei_cont.34090
bnei_else.34097:
	addi	%t3, %zero, 1
bnei_cont.34098:
	j	bnei_cont.34090
bnei_else.34093:
	addi	%t3, %zero, 0
bnei_cont.34094:
	j	bnei_cont.34090
bnei_else.34089:
	addi	%t3, %zero, 0
bnei_cont.34090:
	beqi	%t3, 0, bnei_else.34099
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.34100
bnei_else.34099:
	flw	%f3, 2(%t2)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%t2)
	fmul	%f3, %f3, %f4
	flw	%f6, 0(%t0)
	fmul	%f7, %f3, %f6
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	lw	%t3, 4(%a3)
	flw	%f8, 0(%t3)
	fblt	%f7, %f8, fbgt_else.34101
	addi	%t3, %zero, 0
	j	fbgt_cont.34102
fbgt_else.34101:
	addi	%t3, %zero, 1
fbgt_cont.34102:
	beqi	%t3, 0, bnei_else.34103
	flw	%f7, 2(%t0)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.34105
	addi	%t0, %zero, 0
	j	fbgt_cont.34106
fbgt_else.34105:
	addi	%t0, %zero, 1
fbgt_cont.34106:
	beqi	%t0, 0, bnei_else.34107
	flw	%f7, 494(%zero)
	fbne	%f4, %f7, fbeq_else.34109
	addi	%t0, %zero, 1
	j	fbeq_cont.34110
fbeq_else.34109:
	addi	%t0, %zero, 0
fbeq_cont.34110:
	beqi	%t0, 0, bnei_else.34111
	addi	%t0, %zero, 0
	j	bnei_cont.34104
bnei_else.34111:
	addi	%t0, %zero, 1
bnei_cont.34112:
	j	bnei_cont.34104
bnei_else.34107:
	addi	%t0, %zero, 0
bnei_cont.34108:
	j	bnei_cont.34104
bnei_else.34103:
	addi	%t0, %zero, 0
bnei_cont.34104:
	beqi	%t0, 0, bnei_else.34113
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 2
	j	bnei_cont.34114
bnei_else.34113:
	flw	%f3, 4(%t2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%t2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f4, 0(%t0)
	fblt	%f0, %f4, fbgt_else.34115
	addi	%t0, %zero, 0
	j	fbgt_cont.34116
fbgt_else.34115:
	addi	%t0, %zero, 1
fbgt_cont.34116:
	beqi	%t0, 0, bnei_else.34117
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.34119
	addi	%t0, %zero, 0
	j	fbgt_cont.34120
fbgt_else.34119:
	addi	%t0, %zero, 1
fbgt_cont.34120:
	beqi	%t0, 0, bnei_else.34121
	flw	%f0, 494(%zero)
	fbne	%f3, %f0, fbeq_else.34123
	addi	%t0, %zero, 1
	j	fbeq_cont.34124
fbeq_else.34123:
	addi	%t0, %zero, 0
fbeq_cont.34124:
	beqi	%t0, 0, bnei_else.34125
	addi	%t0, %zero, 0
	j	bnei_cont.34118
bnei_else.34125:
	addi	%t0, %zero, 1
bnei_cont.34126:
	j	bnei_cont.34118
bnei_else.34121:
	addi	%t0, %zero, 0
bnei_cont.34122:
	j	bnei_cont.34118
bnei_else.34117:
	addi	%t0, %zero, 0
bnei_cont.34118:
	beqi	%t0, 0, bnei_else.34127
	fsw	%f2, 135(%zero)
	addi	%t0, %zero, 3
	j	bnei_cont.34128
bnei_else.34127:
	addi	%t0, %zero, 0
bnei_cont.34128:
bnei_cont.34114:
bnei_cont.34100:
bnei_cont.34070:
	beqi	%t0, 0, bnei_else.34129
	flw	%f0, 135(%zero)
	flw	%f1, 494(%zero)
	fblt	%f1, %f0, fbgt_else.34130
	addi	%a3, %zero, 0
	j	fbgt_cont.34131
fbgt_else.34130:
	addi	%a3, %zero, 1
fbgt_cont.34131:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a3, 0, bnei_else.34132
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.34134
	addi	%a3, %zero, 0
	j	fbgt_cont.34135
fbgt_else.34134:
	addi	%a3, %zero, 1
fbgt_cont.34135:
	beqi	%a3, 0, bnei_else.34136
	flw	%f2, 458(%zero)
	fadd	%f0, %f0, %f2
	flw	%f2, 0(%a1)
	fmul	%f2, %f2, %f0
	flw	%f3, 162(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 1(%a1)
	fmul	%f3, %f3, %f0
	flw	%f4, 163(%zero)
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)
	fmul	%f4, %f4, %f0
	flw	%f5, 164(%zero)
	fadd	%f4, %f4, %f5
	lw	%a1, 0(%v1)
	sw	%t0, 3(%sp)
	sw	%a2, 4(%sp)
	fsw	%f4, 5(%sp)
	fsw	%f3, 6(%sp)
	fsw	%f2, 7(%sp)
	fsw	%f0, 8(%sp)
	beqi	%a1, -1, bnei_else.34138
	lw	%a1, 12(%a1)
	lw	%a3, 5(%a1)
	flw	%f5, 0(%a3)
	fsub	%f5, %f2, %f5
	lw	%a3, 5(%a1)
	flw	%f6, 1(%a3)
	fsub	%f6, %f3, %f6
	lw	%a3, 5(%a1)
	flw	%f7, 2(%a3)
	fsub	%f7, %f4, %f7
	lw	%a3, 1(%a1)
	beqi	%a3, 1, bnei_else.34140
	beqi	%a3, 2, bnei_else.34142
	fmul	%f8, %f5, %f5
	lw	%a3, 4(%a1)
	flw	%f9, 0(%a3)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	lw	%a3, 4(%a1)
	flw	%f10, 1(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7
	lw	%a3, 4(%a1)
	flw	%f10, 2(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%a3, 3(%a1)
	beqi	%a3, 0, bnei_else.34144
	fmul	%f9, %f6, %f7
	lw	%a3, 9(%a1)
	flw	%f10, 0(%a3)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f7, %f7, %f5
	lw	%a3, 9(%a1)
	flw	%f9, 1(%a3)
	fmul	%f7, %f7, %f9
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6
	lw	%a3, 9(%a1)
	flw	%f6, 2(%a3)
	fmul	%f5, %f5, %f6
	fadd	%f5, %f7, %f5
	j	bnei_cont.34145
bnei_else.34144:
	fmov	%f5, %f8
bnei_cont.34145:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.34146
	j	bnei_cont.34147
bnei_else.34146:
	flw	%f6, 484(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.34147:
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.34148
	addi	%a3, %zero, 0
	j	fbgt_cont.34149
fbgt_else.34148:
	addi	%a3, %zero, 1
fbgt_cont.34149:
	beqi	%a1, 0, bnei_else.34150
	beqi	%a3, 0, bnei_else.34152
	addi	%a1, %zero, 0
	j	bnei_cont.34151
bnei_else.34152:
	addi	%a1, %zero, 1
bnei_cont.34153:
	j	bnei_cont.34151
bnei_else.34150:
	add	%a1, %zero, %a3
bnei_cont.34151:
	beqi	%a1, 0, bnei_else.34154
	addi	%a1, %zero, 0
	j	bnei_cont.34141
bnei_else.34154:
	addi	%a1, %zero, 1
bnei_cont.34155:
	j	bnei_cont.34141
bnei_else.34142:
	lw	%a3, 4(%a1)
	flw	%f8, 0(%a3)
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%a3)
	fmul	%f6, %f8, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%a3)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.34156
	addi	%a3, %zero, 0
	j	fbgt_cont.34157
fbgt_else.34156:
	addi	%a3, %zero, 1
fbgt_cont.34157:
	beqi	%a1, 0, bnei_else.34158
	beqi	%a3, 0, bnei_else.34160
	addi	%a1, %zero, 0
	j	bnei_cont.34159
bnei_else.34160:
	addi	%a1, %zero, 1
bnei_cont.34161:
	j	bnei_cont.34159
bnei_else.34158:
	add	%a1, %zero, %a3
bnei_cont.34159:
	beqi	%a1, 0, bnei_else.34162
	addi	%a1, %zero, 0
	j	bnei_cont.34163
bnei_else.34162:
	addi	%a1, %zero, 1
bnei_cont.34163:
bnei_cont.34143:
	j	bnei_cont.34141
bnei_else.34140:
	fabs	%f1, %f5
	lw	%a3, 4(%a1)
	flw	%f5, 0(%a3)
	fblt	%f1, %f5, fbgt_else.34164
	addi	%a3, %zero, 0
	j	fbgt_cont.34165
fbgt_else.34164:
	addi	%a3, %zero, 1
fbgt_cont.34165:
	beqi	%a3, 0, bnei_else.34166
	fabs	%f1, %f6
	lw	%a3, 4(%a1)
	flw	%f5, 1(%a3)
	fblt	%f1, %f5, fbgt_else.34168
	addi	%a3, %zero, 0
	j	fbgt_cont.34169
fbgt_else.34168:
	addi	%a3, %zero, 1
fbgt_cont.34169:
	beqi	%a3, 0, bnei_else.34170
	fabs	%f1, %f7
	lw	%a3, 4(%a1)
	flw	%f5, 2(%a3)
	fblt	%f1, %f5, fbgt_else.34172
	addi	%a3, %zero, 0
	j	bnei_cont.34167
fbgt_else.34172:
	addi	%a3, %zero, 1
fbgt_cont.34173:
	j	bnei_cont.34167
bnei_else.34170:
	addi	%a3, %zero, 0
bnei_cont.34171:
	j	bnei_cont.34167
bnei_else.34166:
	addi	%a3, %zero, 0
bnei_cont.34167:
	beqi	%a3, 0, bnei_else.34174
	lw	%a1, 6(%a1)
	j	bnei_cont.34175
bnei_else.34174:
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.34176
	addi	%a1, %zero, 0
	j	bnei_cont.34177
bnei_else.34176:
	addi	%a1, %zero, 1
bnei_cont.34177:
bnei_cont.34175:
bnei_cont.34141:
	beqi	%a1, 0, bnei_else.34178
	addi	%v0, %zero, 0
	j	bnei_cont.34139
bnei_else.34178:
	addi	%v0, %t1, 0
	fmov	%f1, %f3
	fmov	%f0, %f2
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	check_all_inside.2907
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.34179:
	j	bnei_cont.34139
bnei_else.34138:
	addi	%v0, %zero, 1
bnei_cont.34139:
	beqi	%v0, 0, bnei_else.34180
	flw	%f0, 8(%sp)
	fsw	%f0, 137(%zero)
	flw	%f0, 7(%sp)
	fsw	%f0, 138(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 139(%zero)
	flw	%f0, 5(%sp)
	fsw	%f0, 140(%zero)
	lw	%v0, 4(%sp)
	sw	%v0, 141(%zero)
	lw	%v0, 3(%sp)
	sw	%v0, 136(%zero)
	j	bnei_cont.34133
bnei_else.34180:
bnei_cont.34181:
	j	bnei_cont.34133
bnei_else.34136:
bnei_cont.34137:
	j	bnei_cont.34133
bnei_else.34132:
bnei_cont.34133:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.2936
bnei_else.34129:
	lw	%a1, 6(%a3)
	beqi	%a1, 0, bnei_else.34182
	addi	%v0, %v0, 1
	j	solve_each_element_fast.2936
bnei_else.34182:
	jr	%ra
bnei_else.34068:
	jr	%ra
solve_one_or_network_fast.2940:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.34217
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34218
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34219
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34220
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34221
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34222
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34223
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.34224
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.2940
bnei_else.34224:
	jr	%ra
bnei_else.34223:
	jr	%ra
bnei_else.34222:
	jr	%ra
bnei_else.34221:
	jr	%ra
bnei_else.34220:
	jr	%ra
bnei_else.34219:
	jr	%ra
bnei_else.34218:
	jr	%ra
bnei_else.34217:
	jr	%ra
trace_or_matrix_fast.2944:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.34348
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.34349
	lw	%t0, 12(%a3)
	lw	%t1, 10(%t0)
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a3
	lw	%a3, 0(%at)
	lw	%t2, 1(%t0)
	beqi	%t2, 1, bnei_else.34351
	beqi	%t2, 2, bnei_else.34353
	flw	%f3, 0(%a3)
	flw	%f4, 494(%zero)
	fbne	%f3, %f4, fbeq_else.34355
	addi	%t2, %zero, 1
	j	fbeq_cont.34356
fbeq_else.34355:
	addi	%t2, %zero, 0
fbeq_cont.34356:
	beqi	%t2, 0, bnei_else.34357
	addi	%a3, %zero, 0
	j	bnei_cont.34352
bnei_else.34357:
	flw	%f5, 1(%a3)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%a3)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a3)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t1)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.34359
	addi	%t1, %zero, 0
	j	fbgt_cont.34360
fbgt_else.34359:
	addi	%t1, %zero, 1
fbgt_cont.34360:
	beqi	%t1, 0, bnei_else.34361
	lw	%t0, 6(%t0)
	beqi	%t0, 0, bnei_else.34363
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.34364
bnei_else.34363:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.34364:
	addi	%a3, %zero, 1
	j	bnei_cont.34362
bnei_else.34361:
	addi	%a3, %zero, 0
bnei_cont.34362:
bnei_cont.34358:
	j	bnei_cont.34352
bnei_else.34353:
	flw	%f0, 0(%a3)
	flw	%f1, 494(%zero)
	fblt	%f0, %f1, fbgt_else.34365
	addi	%a3, %zero, 0
	j	fbgt_cont.34366
fbgt_else.34365:
	addi	%a3, %zero, 1
fbgt_cont.34366:
	beqi	%a3, 0, bnei_else.34367
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.34368
bnei_else.34367:
	addi	%a3, %zero, 0
bnei_cont.34368:
bnei_cont.34354:
	j	bnei_cont.34352
bnei_else.34351:
	lw	%t1, 0(%a0)
	flw	%f3, 0(%a3)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a3)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%t1)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%t2, 4(%t0)
	flw	%f7, 1(%t2)
	fblt	%f6, %f7, fbgt_else.34369
	addi	%t2, %zero, 0
	j	fbgt_cont.34370
fbgt_else.34369:
	addi	%t2, %zero, 1
fbgt_cont.34370:
	beqi	%t2, 0, bnei_else.34371
	flw	%f6, 2(%t1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t2, 4(%t0)
	flw	%f7, 2(%t2)
	fblt	%f6, %f7, fbgt_else.34373
	addi	%t2, %zero, 0
	j	fbgt_cont.34374
fbgt_else.34373:
	addi	%t2, %zero, 1
fbgt_cont.34374:
	beqi	%t2, 0, bnei_else.34375
	flw	%f6, 494(%zero)
	fbne	%f4, %f6, fbeq_else.34377
	addi	%t2, %zero, 1
	j	fbeq_cont.34378
fbeq_else.34377:
	addi	%t2, %zero, 0
fbeq_cont.34378:
	beqi	%t2, 0, bnei_else.34379
	addi	%t2, %zero, 0
	j	bnei_cont.34372
bnei_else.34379:
	addi	%t2, %zero, 1
bnei_cont.34380:
	j	bnei_cont.34372
bnei_else.34375:
	addi	%t2, %zero, 0
bnei_cont.34376:
	j	bnei_cont.34372
bnei_else.34371:
	addi	%t2, %zero, 0
bnei_cont.34372:
	beqi	%t2, 0, bnei_else.34381
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.34382
bnei_else.34381:
	flw	%f3, 2(%a3)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%a3)
	fmul	%f3, %f3, %f4
	flw	%f6, 0(%t1)
	fmul	%f7, %f3, %f6
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	lw	%t2, 4(%t0)
	flw	%f8, 0(%t2)
	fblt	%f7, %f8, fbgt_else.34383
	addi	%t2, %zero, 0
	j	fbgt_cont.34384
fbgt_else.34383:
	addi	%t2, %zero, 1
fbgt_cont.34384:
	beqi	%t2, 0, bnei_else.34385
	flw	%f7, 2(%t1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t1, 4(%t0)
	flw	%f8, 2(%t1)
	fblt	%f7, %f8, fbgt_else.34387
	addi	%t1, %zero, 0
	j	fbgt_cont.34388
fbgt_else.34387:
	addi	%t1, %zero, 1
fbgt_cont.34388:
	beqi	%t1, 0, bnei_else.34389
	flw	%f7, 494(%zero)
	fbne	%f4, %f7, fbeq_else.34391
	addi	%t1, %zero, 1
	j	fbeq_cont.34392
fbeq_else.34391:
	addi	%t1, %zero, 0
fbeq_cont.34392:
	beqi	%t1, 0, bnei_else.34393
	addi	%t1, %zero, 0
	j	bnei_cont.34386
bnei_else.34393:
	addi	%t1, %zero, 1
bnei_cont.34394:
	j	bnei_cont.34386
bnei_else.34389:
	addi	%t1, %zero, 0
bnei_cont.34390:
	j	bnei_cont.34386
bnei_else.34385:
	addi	%t1, %zero, 0
bnei_cont.34386:
	beqi	%t1, 0, bnei_else.34395
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 2
	j	bnei_cont.34396
bnei_else.34395:
	flw	%f3, 4(%a3)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a3)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f4, 0(%a3)
	fblt	%f0, %f4, fbgt_else.34397
	addi	%a3, %zero, 0
	j	fbgt_cont.34398
fbgt_else.34397:
	addi	%a3, %zero, 1
fbgt_cont.34398:
	beqi	%a3, 0, bnei_else.34399
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.34401
	addi	%a3, %zero, 0
	j	fbgt_cont.34402
fbgt_else.34401:
	addi	%a3, %zero, 1
fbgt_cont.34402:
	beqi	%a3, 0, bnei_else.34403
	flw	%f0, 494(%zero)
	fbne	%f3, %f0, fbeq_else.34405
	addi	%a3, %zero, 1
	j	fbeq_cont.34406
fbeq_else.34405:
	addi	%a3, %zero, 0
fbeq_cont.34406:
	beqi	%a3, 0, bnei_else.34407
	addi	%a3, %zero, 0
	j	bnei_cont.34400
bnei_else.34407:
	addi	%a3, %zero, 1
bnei_cont.34408:
	j	bnei_cont.34400
bnei_else.34403:
	addi	%a3, %zero, 0
bnei_cont.34404:
	j	bnei_cont.34400
bnei_else.34399:
	addi	%a3, %zero, 0
bnei_cont.34400:
	beqi	%a3, 0, bnei_else.34409
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 3
	j	bnei_cont.34410
bnei_else.34409:
	addi	%a3, %zero, 0
bnei_cont.34410:
bnei_cont.34396:
bnei_cont.34382:
bnei_cont.34352:
	beqi	%a3, 0, bnei_else.34411
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.34413
	addi	%a3, %zero, 0
	j	fbgt_cont.34414
fbgt_else.34413:
	addi	%a3, %zero, 1
fbgt_cont.34414:
	beqi	%a3, 0, bnei_else.34415
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.34417
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.34419
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.34421
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.34423
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.34425
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.34427
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.34429
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.34350
bnei_else.34429:
bnei_cont.34430:
	j	bnei_cont.34350
bnei_else.34427:
bnei_cont.34428:
	j	bnei_cont.34350
bnei_else.34425:
bnei_cont.34426:
	j	bnei_cont.34350
bnei_else.34423:
bnei_cont.34424:
	j	bnei_cont.34350
bnei_else.34421:
bnei_cont.34422:
	j	bnei_cont.34350
bnei_else.34419:
bnei_cont.34420:
	j	bnei_cont.34350
bnei_else.34417:
bnei_cont.34418:
	j	bnei_cont.34350
bnei_else.34415:
bnei_cont.34416:
	j	bnei_cont.34350
bnei_else.34411:
bnei_cont.34412:
	j	bnei_cont.34350
bnei_else.34349:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.34431
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.34433
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.34435
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.34437
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.34439
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.34441
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_else.34443
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.34432
bnei_else.34443:
bnei_cont.34444:
	j	bnei_cont.34432
bnei_else.34441:
bnei_cont.34442:
	j	bnei_cont.34432
bnei_else.34439:
bnei_cont.34440:
	j	bnei_cont.34432
bnei_else.34437:
bnei_cont.34438:
	j	bnei_cont.34432
bnei_else.34435:
bnei_cont.34436:
	j	bnei_cont.34432
bnei_else.34433:
bnei_cont.34434:
	j	bnei_cont.34432
bnei_else.34431:
bnei_cont.34432:
bnei_cont.34350:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.34445
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.34446
	lw	%a2, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solver_fast2.2865
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	beqi	%v0, 0, bnei_else.34448
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.34450
	addi	%v0, %zero, 0
	j	fbgt_cont.34451
fbgt_else.34450:
	addi	%v0, %zero, 1
fbgt_cont.34451:
	beqi	%v0, 0, bnei_else.34452
	lw	%v0, 6(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.34454
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.34456
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.34458
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.34460
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.34462
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.34464
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.34447
bnei_else.34464:
bnei_cont.34465:
	j	bnei_cont.34447
bnei_else.34462:
bnei_cont.34463:
	j	bnei_cont.34447
bnei_else.34460:
bnei_cont.34461:
	j	bnei_cont.34447
bnei_else.34458:
bnei_cont.34459:
	j	bnei_cont.34447
bnei_else.34456:
bnei_cont.34457:
	j	bnei_cont.34447
bnei_else.34454:
bnei_cont.34455:
	j	bnei_cont.34447
bnei_else.34452:
bnei_cont.34453:
	j	bnei_cont.34447
bnei_else.34448:
bnei_cont.34449:
	j	bnei_cont.34447
bnei_else.34446:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.34466
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.34468
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.34470
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.34472
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_else.34474
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_else.34476
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.34467
bnei_else.34476:
bnei_cont.34477:
	j	bnei_cont.34467
bnei_else.34474:
bnei_cont.34475:
	j	bnei_cont.34467
bnei_else.34472:
bnei_cont.34473:
	j	bnei_cont.34467
bnei_else.34470:
bnei_cont.34471:
	j	bnei_cont.34467
bnei_else.34468:
bnei_cont.34469:
	j	bnei_cont.34467
bnei_else.34466:
bnei_cont.34467:
bnei_cont.34447:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2944
bnei_else.34445:
	jr	%ra
bnei_else.34348:
	jr	%ra
utexture.2959:
	lw	%a0, 0(%v0)
	lw	%a1, 8(%v0)
	flw	%f0, 0(%a1)
	fsw	%f0, 145(%zero)
	lw	%a1, 8(%v0)
	flw	%f0, 1(%a1)
	fsw	%f0, 146(%zero)
	lw	%a1, 8(%v0)
	flw	%f0, 2(%a1)
	fsw	%f0, 147(%zero)
	beqi	%a0, 1, bnei_else.34579
	beqi	%a0, 2, bnei_else.34580
	beqi	%a0, 3, bnei_else.34581
	beqi	%a0, 4, bnei_else.34582
	jr	%ra
bnei_else.34582:
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
	flw	%f4, 456(%zero)
	fblt	%f3, %f4, fbgt_else.34584
	addi	%a0, %zero, 0
	j	fbgt_cont.34585
fbgt_else.34584:
	addi	%a0, %zero, 1
fbgt_cont.34585:
	beqi	%a0, 0, bnei_else.34586
	flw	%f0, 455(%zero)
	j	bnei_cont.34587
bnei_else.34586:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 494(%zero)
	fblt	%f0, %f1, fbgt_else.34588
	addi	%a0, %zero, 1
	j	fbgt_cont.34589
fbgt_else.34588:
	addi	%a0, %zero, 0
fbgt_cont.34589:
	fabs	%f1, %f0
	flw	%f3, 493(%zero)
	fblt	%f1, %f3, fbgt_else.34590
	flw	%f0, 486(%zero)
	fblt	%f1, %f0, fbgt_else.34592
	flw	%f0, 483(%zero)
	flw	%f3, 484(%zero)
	fdiv	%f1, %f3, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 492(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 491(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 490(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 489(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 488(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 487(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34593
fbgt_else.34592:
	flw	%f0, 485(%zero)
	flw	%f3, 484(%zero)
	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f5, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 492(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 491(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 490(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 489(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 488(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 487(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
fbgt_cont.34593:
	beqi	%a0, 0, bnei_else.34594
	j	fbgt_cont.34591
bnei_else.34594:
	fneg	%f0, %f0
bnei_cont.34595:
	j	fbgt_cont.34591
fbgt_else.34590:
	fmul	%f1, %f0, %f0
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	flw	%f6, 492(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f1
	fsub	%f6, %f0, %f6
	flw	%f7, 491(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fadd	%f6, %f6, %f7
	flw	%f7, 490(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f6, %f6, %f7
	flw	%f7, 489(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 488(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fsub	%f1, %f6, %f1
	flw	%f6, 487(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f3
	fmul	%f0, %f0, %f5
	fadd	%f0, %f1, %f0
fbgt_cont.34591:
	flw	%f1, 454(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 453(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.34587:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v0, 4(%v0)
	flw	%f3, 1(%v0)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.34596
	addi	%v0, %zero, 0
	j	fbgt_cont.34597
fbgt_else.34596:
	addi	%v0, %zero, 1
fbgt_cont.34597:
	beqi	%v0, 0, bnei_else.34598
	flw	%f1, 455(%zero)
	j	bnei_cont.34599
bnei_else.34598:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 494(%zero)
	fblt	%f1, %f2, fbgt_else.34600
	addi	%v0, %zero, 1
	j	fbgt_cont.34601
fbgt_else.34600:
	addi	%v0, %zero, 0
fbgt_cont.34601:
	fabs	%f2, %f1
	flw	%f3, 493(%zero)
	fblt	%f2, %f3, fbgt_else.34602
	flw	%f1, 486(%zero)
	fblt	%f2, %f1, fbgt_else.34604
	flw	%f1, 483(%zero)
	flw	%f3, 484(%zero)
	fdiv	%f2, %f3, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 492(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 491(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 490(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 489(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 488(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 487(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fsub	%f1, %f1, %f2
	j	fbgt_cont.34605
fbgt_else.34604:
	flw	%f1, 485(%zero)
	flw	%f3, 484(%zero)
	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3
	fdiv	%f2, %f4, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 492(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 491(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 490(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 489(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 488(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 487(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
fbgt_cont.34605:
	beqi	%v0, 0, bnei_else.34606
	j	fbgt_cont.34603
bnei_else.34606:
	fneg	%f1, %f1
bnei_cont.34607:
	j	fbgt_cont.34603
fbgt_else.34602:
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	flw	%f5, 492(%zero)
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f5, %f1, %f5
	flw	%f6, 491(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fadd	%f5, %f5, %f6
	flw	%f6, 490(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f5, %f5, %f6
	flw	%f6, 489(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 488(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fsub	%f2, %f5, %f2
	flw	%f5, 487(%zero)
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
fbgt_cont.34603:
	flw	%f2, 454(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 453(%zero)
	fdiv	%f1, %f1, %f2
bnei_cont.34599:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 452(%zero)
	flw	%f3, 464(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 494(%zero)
	fblt	%f0, %f1, fbgt_else.34608
	addi	%v0, %zero, 0
	j	fbgt_cont.34609
fbgt_else.34608:
	addi	%v0, %zero, 1
fbgt_cont.34609:
	beqi	%v0, 0, bnei_else.34610
	fmov	%f0, %f1
	j	bnei_cont.34611
bnei_else.34610:
bnei_cont.34611:
	flw	%f1, 451(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 450(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.34581:
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
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 482(%zero)
	fabs	%f0, %f0
	flw	%f2, 481(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.34613
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.34615
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.34617
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.34619
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.34621
	flw	%f3, 476(%zero)
	fblt	%f0, %f3, fbgt_else.34623
	flw	%f3, 475(%zero)
	fblt	%f0, %f3, fbgt_else.34625
	flw	%f3, 474(%zero)
	fblt	%f0, %f3, fbgt_else.34627
	flw	%f3, 473(%zero)
	fblt	%f0, %f3, fbgt_else.34629
	flw	%f3, 472(%zero)
	fblt	%f0, %f3, fbgt_else.34631
	flw	%f3, 471(%zero)
	fblt	%f0, %f3, fbgt_else.34633
	flw	%f3, 470(%zero)
	fblt	%f0, %f3, fbgt_else.34635
	flw	%f3, 469(%zero)
	fblt	%f0, %f3, fbgt_else.34637
	flw	%f3, 468(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.34614
fbgt_else.34637:
	fmov	%f0, %f3
fbgt_cont.34638:
	j	fbgt_cont.34614
fbgt_else.34635:
	fmov	%f0, %f3
fbgt_cont.34636:
	j	fbgt_cont.34614
fbgt_else.34633:
	fmov	%f0, %f3
fbgt_cont.34634:
	j	fbgt_cont.34614
fbgt_else.34631:
	fmov	%f0, %f3
fbgt_cont.34632:
	j	fbgt_cont.34614
fbgt_else.34629:
	fmov	%f0, %f3
fbgt_cont.34630:
	j	fbgt_cont.34614
fbgt_else.34627:
	fmov	%f0, %f3
fbgt_cont.34628:
	j	fbgt_cont.34614
fbgt_else.34625:
	fmov	%f0, %f3
fbgt_cont.34626:
	j	fbgt_cont.34614
fbgt_else.34623:
	fmov	%f0, %f3
fbgt_cont.34624:
	j	fbgt_cont.34614
fbgt_else.34621:
	fmov	%f0, %f3
fbgt_cont.34622:
	j	fbgt_cont.34614
fbgt_else.34619:
	fmov	%f0, %f3
fbgt_cont.34620:
	j	fbgt_cont.34614
fbgt_else.34617:
	fmov	%f0, %f3
fbgt_cont.34618:
	j	fbgt_cont.34614
fbgt_else.34615:
	fmov	%f0, %f3
fbgt_cont.34616:
	j	fbgt_cont.34614
fbgt_else.34613:
	fmov	%f0, %f2
fbgt_cont.34614:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	fblt	%f1, %f2, fbgt_else.34639
	fblt	%f1, %f0, fbgt_else.34641
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.34640
fbgt_else.34641:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.34642:
	j	fbgt_cont.34640
fbgt_else.34639:
	fmov	%f0, %f1
fbgt_cont.34640:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.34643
	addi	%v0, %zero, 0
	j	fbgt_cont.34644
fbgt_else.34643:
	addi	%v0, %zero, 1
fbgt_cont.34644:
	fblt	%f0, %f1, fbgt_else.34645
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34646
fbgt_else.34645:
fbgt_cont.34646:
	flw	%f2, 483(%zero)
	fblt	%f0, %f2, fbgt_else.34647
	beqi	%v0, 0, bnei_else.34649
	addi	%v0, %zero, 0
	j	fbgt_cont.34648
bnei_else.34649:
	addi	%v0, %zero, 1
bnei_cont.34650:
	j	fbgt_cont.34648
fbgt_else.34647:
fbgt_cont.34648:
	fblt	%f0, %f2, fbgt_else.34651
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34652
fbgt_else.34651:
fbgt_cont.34652:
	flw	%f1, 485(%zero)
	fblt	%f1, %f0, fbgt_else.34653
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 484(%zero)
	flw	%f3, 464(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 463(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 462(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.34654
fbgt_else.34653:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 466(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 465(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.34654:
	beqi	%v0, 0, bnei_else.34655
	j	bnei_cont.34656
bnei_else.34655:
	fneg	%f0, %f0
bnei_cont.34656:
	fmul	%f0, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 484(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.34580:
	flw	%f0, 1(%v1)
	flw	%f1, 448(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 482(%zero)
	flw	%f2, 494(%zero)
	fblt	%f0, %f2, fbgt_else.34658
	addi	%v0, %zero, 1
	j	fbgt_cont.34659
fbgt_else.34658:
	addi	%v0, %zero, 0
fbgt_cont.34659:
	fabs	%f0, %f0
	flw	%f2, 481(%zero)
	sw	%v0, 3(%sp)
	fsw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f2, 6(%sp)
	fblt	%f0, %f2, fbgt_else.34660
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.34662
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.34664
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.34666
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.34668
	flw	%f3, 476(%zero)
	fblt	%f0, %f3, fbgt_else.34670
	flw	%f3, 475(%zero)
	fblt	%f0, %f3, fbgt_else.34672
	flw	%f3, 474(%zero)
	fblt	%f0, %f3, fbgt_else.34674
	flw	%f3, 473(%zero)
	fblt	%f0, %f3, fbgt_else.34676
	flw	%f3, 472(%zero)
	fblt	%f0, %f3, fbgt_else.34678
	flw	%f3, 471(%zero)
	fblt	%f0, %f3, fbgt_else.34680
	flw	%f3, 470(%zero)
	fblt	%f0, %f3, fbgt_else.34682
	flw	%f3, 469(%zero)
	fblt	%f0, %f3, fbgt_else.34684
	flw	%f3, 468(%zero)
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	fbgt_cont.34661
fbgt_else.34684:
	fmov	%f0, %f3
fbgt_cont.34685:
	j	fbgt_cont.34661
fbgt_else.34682:
	fmov	%f0, %f3
fbgt_cont.34683:
	j	fbgt_cont.34661
fbgt_else.34680:
	fmov	%f0, %f3
fbgt_cont.34681:
	j	fbgt_cont.34661
fbgt_else.34678:
	fmov	%f0, %f3
fbgt_cont.34679:
	j	fbgt_cont.34661
fbgt_else.34676:
	fmov	%f0, %f3
fbgt_cont.34677:
	j	fbgt_cont.34661
fbgt_else.34674:
	fmov	%f0, %f3
fbgt_cont.34675:
	j	fbgt_cont.34661
fbgt_else.34672:
	fmov	%f0, %f3
fbgt_cont.34673:
	j	fbgt_cont.34661
fbgt_else.34670:
	fmov	%f0, %f3
fbgt_cont.34671:
	j	fbgt_cont.34661
fbgt_else.34668:
	fmov	%f0, %f3
fbgt_cont.34669:
	j	fbgt_cont.34661
fbgt_else.34666:
	fmov	%f0, %f3
fbgt_cont.34667:
	j	fbgt_cont.34661
fbgt_else.34664:
	fmov	%f0, %f3
fbgt_cont.34665:
	j	fbgt_cont.34661
fbgt_else.34662:
	fmov	%f0, %f3
fbgt_cont.34663:
	j	fbgt_cont.34661
fbgt_else.34660:
	fmov	%f0, %f2
fbgt_cont.34661:
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	fblt	%f1, %f2, fbgt_else.34686
	fblt	%f1, %f0, fbgt_else.34688
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	fbgt_cont.34687
fbgt_else.34688:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
fbgt_cont.34689:
	j	fbgt_cont.34687
fbgt_else.34686:
	fmov	%f0, %f1
fbgt_cont.34687:
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.34690
	lw	%v0, 3(%sp)
	beqi	%v0, 0, bnei_else.34692
	addi	%v0, %zero, 0
	j	fbgt_cont.34691
bnei_else.34692:
	addi	%v0, %zero, 1
bnei_cont.34693:
	j	fbgt_cont.34691
fbgt_else.34690:
	lw	%v0, 3(%sp)
fbgt_cont.34691:
	fblt	%f0, %f1, fbgt_else.34694
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34695
fbgt_else.34694:
fbgt_cont.34695:
	flw	%f2, 483(%zero)
	fblt	%f0, %f2, fbgt_else.34696
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34697
fbgt_else.34696:
fbgt_cont.34697:
	flw	%f1, 485(%zero)
	fblt	%f1, %f0, fbgt_else.34698
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 466(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 465(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.34699
fbgt_else.34698:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 484(%zero)
	flw	%f3, 464(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 463(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 462(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.34699:
	beqi	%v0, 0, bnei_else.34700
	j	bnei_cont.34701
bnei_else.34700:
	fneg	%f0, %f0
bnei_cont.34701:
	fmul	%f0, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 484(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.34579:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	flw	%f1, 0(%a0)
	fsub	%f0, %f0, %f1
	flw	%f1, 447(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 446(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 449(%zero)
	fblt	%f0, %f2, fbgt_else.34703
	addi	%a0, %zero, 0
	j	fbgt_cont.34704
fbgt_else.34703:
	addi	%a0, %zero, 1
fbgt_cont.34704:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f4, 2(%v0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.34705
	addi	%v0, %zero, 0
	j	fbgt_cont.34706
fbgt_else.34705:
	addi	%v0, %zero, 1
fbgt_cont.34706:
	beqi	%a0, 0, bnei_else.34707
	beqi	%v0, 0, bnei_else.34709
	flw	%f0, 451(%zero)
	j	bnei_cont.34708
bnei_else.34709:
	flw	%f0, 494(%zero)
bnei_cont.34710:
	j	bnei_cont.34708
bnei_else.34707:
	beqi	%v0, 0, bnei_else.34711
	flw	%f0, 494(%zero)
	j	bnei_cont.34712
bnei_else.34711:
	flw	%f0, 451(%zero)
bnei_cont.34712:
bnei_cont.34708:
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2966:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.34724
	lw	%a1, 254(%v0)
	lw	%a2, 1(%a1)
	flw	%f2, 445(%zero)
	fsw	%f2, 137(%zero)
	lw	%a3, 134(%zero)
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.34725
	addi	%v0, %zero, 0
	j	fbgt_cont.34726
fbgt_else.34725:
	addi	%v0, %zero, 1
fbgt_cont.34726:
	beqi	%v0, 0, bnei_else.34727
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.34729
	addi	%v0, %zero, 0
	j	bnei_cont.34728
fbgt_else.34729:
	addi	%v0, %zero, 1
fbgt_cont.34730:
	j	bnei_cont.34728
bnei_else.34727:
	addi	%v0, %zero, 0
bnei_cont.34728:
	beqi	%v0, 0, bnei_else.34731
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.34733
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.34735
	j	bnei_cont.34732
bnei_else.34735:
	lw	%v0, 4(%sp)
	lw	%v1, 0(%v0)
	flw	%f0, 142(%zero)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 1(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
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
	flw	%f3, 494(%zero)
	fblt	%f3, %f0, fbgt_else.34737
	addi	%v0, %zero, 0
	j	fbgt_cont.34738
fbgt_else.34737:
	addi	%v0, %zero, 1
fbgt_cont.34738:
	beqi	%v0, 0, bnei_else.34739
	flw	%f4, 151(%zero)
	flw	%f5, 145(%zero)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	fsw	%f4, 151(%zero)
	flw	%f4, 152(%zero)
	flw	%f5, 146(%zero)
	fmul	%f5, %f0, %f5
	fadd	%f4, %f4, %f5
	fsw	%f4, 152(%zero)
	flw	%f4, 153(%zero)
	flw	%f5, 147(%zero)
	fmul	%f0, %f0, %f5
	fadd	%f0, %f4, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.34740
bnei_else.34739:
bnei_cont.34740:
	fblt	%f3, %f1, fbgt_else.34741
	addi	%v0, %zero, 0
	j	fbgt_cont.34742
fbgt_else.34741:
	addi	%v0, %zero, 1
fbgt_cont.34742:
	beqi	%v0, 0, bnei_else.34743
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f0
	flw	%f1, 1(%sp)
	fmul	%f0, %f0, %f1
	flw	%f3, 151(%zero)
	fadd	%f3, %f3, %f0
	fsw	%f3, 151(%zero)
	flw	%f3, 152(%zero)
	fadd	%f3, %f3, %f0
	fsw	%f3, 152(%zero)
	flw	%f3, 153(%zero)
	fadd	%f0, %f3, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.34744
bnei_else.34743:
bnei_cont.34744:
bnei_cont.34736:
	j	bnei_cont.34732
beq_else.34733:
beq_cont.34734:
	j	bnei_cont.34732
bnei_else.34731:
bnei_cont.34732:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2966
bgti_else.34724:
	jr	%ra
trace_ray.2971:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.34779
	lw	%a1, 2(%a0)
	addi	%a2, %zero, 0
	flw	%f2, 445(%zero)
	fsw	%f2, 137(%zero)
	lw	%a3, 134(%zero)
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
	jal	trace_or_matrix.2930
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.34780
	addi	%v0, %zero, 0
	j	fbgt_cont.34781
fbgt_else.34780:
	addi	%v0, %zero, 1
fbgt_cont.34781:
	beqi	%v0, 0, bnei_else.34782
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.34784
	addi	%v0, %zero, 0
	j	bnei_cont.34783
fbgt_else.34784:
	addi	%v0, %zero, 1
fbgt_cont.34785:
	j	bnei_cont.34783
bnei_else.34782:
	addi	%v0, %zero, 0
bnei_cont.34783:
	beqi	%v0, 0, bnei_else.34786
	lw	%v0, 141(%zero)
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	lw	%a1, 1(%v1)
	addi	%a2, %zero, 1
	beqi	%a1, 1, bnei_else.34787
	beqi	%a1, 2, bnei_else.34789
	flw	%f3, 138(%zero)
	lw	%a1, 5(%v1)
	flw	%f4, 0(%a1)
	fsub	%f3, %f3, %f4
	flw	%f4, 139(%zero)
	lw	%a1, 5(%v1)
	flw	%f5, 1(%a1)
	fsub	%f4, %f4, %f5
	flw	%f5, 140(%zero)
	lw	%a1, 5(%v1)
	flw	%f6, 2(%a1)
	fsub	%f5, %f5, %f6
	lw	%a1, 4(%v1)
	flw	%f6, 0(%a1)
	fmul	%f6, %f3, %f6
	lw	%a1, 4(%v1)
	flw	%f7, 1(%a1)
	fmul	%f7, %f4, %f7
	lw	%a1, 4(%v1)
	flw	%f8, 2(%a1)
	fmul	%f8, %f5, %f8
	lw	%a1, 3(%v1)
	beqi	%a1, 0, bnei_else.34791
	lw	%a1, 9(%v1)
	flw	%f9, 2(%a1)
	fmul	%f9, %f4, %f9
	lw	%a1, 9(%v1)
	flw	%f10, 1(%a1)
	fmul	%f10, %f5, %f10
	fadd	%f9, %f9, %f10
	flw	%f10, 464(%zero)
	fmul	%f9, %f9, %f10
	fadd	%f6, %f6, %f9
	fsw	%f6, 142(%zero)
	lw	%a1, 9(%v1)
	flw	%f6, 2(%a1)
	fmul	%f6, %f3, %f6
	lw	%a1, 9(%v1)
	flw	%f9, 0(%a1)
	fmul	%f5, %f5, %f9
	fadd	%f5, %f6, %f5
	fmul	%f5, %f5, %f10
	fadd	%f5, %f7, %f5
	fsw	%f5, 143(%zero)
	lw	%a1, 9(%v1)
	flw	%f5, 1(%a1)
	fmul	%f3, %f3, %f5
	lw	%a1, 9(%v1)
	flw	%f5, 0(%a1)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f3, %f3, %f10
	fadd	%f3, %f8, %f3
	fsw	%f3, 144(%zero)
	j	bnei_cont.34792
bnei_else.34791:
	fsw	%f6, 142(%zero)
	fsw	%f7, 143(%zero)
	fsw	%f8, 144(%zero)
bnei_cont.34792:
	lw	%a1, 6(%v1)
	flw	%f3, 142(%zero)
	fmul	%f4, %f3, %f3
	flw	%f5, 143(%zero)
	fmul	%f6, %f5, %f5
	fadd	%f4, %f4, %f6
	flw	%f6, 144(%zero)
	fmul	%f7, %f6, %f6
	fadd	%f4, %f4, %f7
	fsqrt	%f4, %f4
	flw	%f7, 494(%zero)
	fbne	%f4, %f7, fbeq_else.34793
	addi	%a3, %zero, 1
	j	fbeq_cont.34794
fbeq_else.34793:
	addi	%a3, %zero, 0
fbeq_cont.34794:
	beqi	%a3, 0, bnei_else.34795
	flw	%f4, 484(%zero)
	j	bnei_cont.34796
bnei_else.34795:
	beqi	%a1, 0, bnei_else.34797
	flw	%f7, 460(%zero)
	fdiv	%f4, %f7, %f4
	j	bnei_cont.34798
bnei_else.34797:
	flw	%f7, 484(%zero)
	fdiv	%f4, %f7, %f4
bnei_cont.34798:
bnei_cont.34796:
	fmul	%f3, %f3, %f4
	fsw	%f3, 142(%zero)
	fmul	%f3, %f5, %f4
	fsw	%f3, 143(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f3, 144(%zero)
	j	bnei_cont.34788
bnei_else.34789:
	lw	%a1, 4(%v1)
	flw	%f3, 0(%a1)
	fneg	%f3, %f3
	fsw	%f3, 142(%zero)
	lw	%a1, 4(%v1)
	flw	%f3, 1(%a1)
	fneg	%f3, %f3
	fsw	%f3, 143(%zero)
	lw	%a1, 4(%v1)
	flw	%f3, 2(%a1)
	fneg	%f3, %f3
	fsw	%f3, 144(%zero)
bnei_cont.34790:
	j	bnei_cont.34788
bnei_else.34787:
	lw	%a1, 136(%zero)
	flw	%f3, 494(%zero)
	fsw	%f3, 142(%zero)
	fsw	%f3, 143(%zero)
	fsw	%f3, 144(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.34799
	addi	%t0, %zero, 1
	j	fbeq_cont.34800
fbeq_else.34799:
	addi	%t0, %zero, 0
fbeq_cont.34800:
	beqi	%t0, 0, bnei_else.34801
	j	bnei_cont.34802
bnei_else.34801:
	fblt	%f3, %f4, fbgt_else.34803
	addi	%t0, %zero, 0
	j	fbgt_cont.34804
fbgt_else.34803:
	addi	%t0, %zero, 1
fbgt_cont.34804:
	beqi	%t0, 0, bnei_else.34805
	flw	%f3, 484(%zero)
	j	bnei_cont.34806
bnei_else.34805:
	flw	%f3, 460(%zero)
bnei_cont.34806:
bnei_cont.34802:
	fneg	%f3, %f3
	fsw	%f3, 142(%a1)
bnei_cont.34788:
	flw	%f3, 138(%zero)
	fsw	%f3, 159(%zero)
	flw	%f4, 139(%zero)
	fsw	%f4, 160(%zero)
	flw	%f5, 140(%zero)
	fsw	%f5, 161(%zero)
	addi	%a1, %zero, 138
	fsw	%f0, 8(%sp)
	sw	%a0, 9(%sp)
	fsw	%f1, 10(%sp)
	sw	%a2, 11(%sp)
	sw	%v1, 12(%sp)
	fsw	%f5, 13(%sp)
	fsw	%f4, 14(%sp)
	fsw	%f3, 15(%sp)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	utexture.2959
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 16(%sp)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	lw	%v0, 3(%sp)
	lw	%a1, 1(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	flw	%f0, 15(%sp)
	fsw	%f0, 0(%a1)
	flw	%f1, 14(%sp)
	fsw	%f1, 1(%a1)
	flw	%f2, 13(%sp)
	fsw	%f2, 2(%a1)
	lw	%a1, 3(%v0)
	lw	%a2, 12(%sp)
	lw	%a3, 7(%a2)
	flw	%f3, 0(%a3)
	flw	%f4, 464(%zero)
	fblt	%f3, %f4, fbgt_else.34807
	addi	%a3, %zero, 0
	j	fbgt_cont.34808
fbgt_else.34807:
	addi	%a3, %zero, 1
fbgt_cont.34808:
	beqi	%a3, 0, bnei_else.34809
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.34810
bnei_else.34809:
	lw	%a3, 11(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	lw	%a1, 4(%v0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	flw	%f3, 145(%zero)
	fsw	%f3, 0(%a1)
	flw	%f3, 146(%zero)
	fsw	%f3, 1(%a1)
	flw	%f3, 147(%zero)
	fsw	%f3, 2(%a1)
	flw	%f3, 443(%zero)
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
	flw	%f3, 142(%zero)
	fsw	%f3, 0(%a1)
	flw	%f3, 143(%zero)
	fsw	%f3, 1(%a1)
	flw	%f3, 144(%zero)
	fsw	%f3, 2(%a1)
bnei_cont.34810:
	flw	%f3, 442(%zero)
	lw	%a1, 5(%sp)
	flw	%f4, 0(%a1)
	flw	%f5, 142(%zero)
	fmul	%f6, %f4, %f5
	flw	%f7, 1(%a1)
	flw	%f8, 143(%zero)
	fmul	%f9, %f7, %f8
	fadd	%f6, %f6, %f9
	flw	%f9, 2(%a1)
	flw	%f10, 144(%zero)
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
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	beqi	%v0, 0, bnei_else.34811
	j	bnei_cont.34812
bnei_else.34811:
	flw	%f0, 78(%zero)
	flw	%f1, 20(%sp)
	fmul	%f1, %f1, %f0
	flw	%f2, 79(%zero)
	flw	%f3, 19(%sp)
	fmul	%f3, %f3, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 80(%zero)
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
	flw	%f2, 494(%zero)
	fblt	%f2, %f1, fbgt_else.34813
	addi	%v1, %zero, 0
	j	fbgt_cont.34814
fbgt_else.34813:
	addi	%v1, %zero, 1
fbgt_cont.34814:
	beqi	%v1, 0, bnei_else.34815
	flw	%f3, 151(%zero)
	flw	%f5, 145(%zero)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	fsw	%f3, 151(%zero)
	flw	%f3, 152(%zero)
	flw	%f5, 146(%zero)
	fmul	%f5, %f1, %f5
	fadd	%f3, %f3, %f5
	fsw	%f3, 152(%zero)
	flw	%f3, 153(%zero)
	flw	%f5, 147(%zero)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
	fsw	%f1, 153(%zero)
	j	bnei_cont.34816
bnei_else.34815:
bnei_cont.34816:
	fblt	%f2, %f0, fbgt_else.34817
	addi	%v1, %zero, 0
	j	fbgt_cont.34818
fbgt_else.34817:
	addi	%v1, %zero, 1
fbgt_cont.34818:
	beqi	%v1, 0, bnei_else.34819
	fmul	%f0, %f0, %f0
	fmul	%f0, %f0, %f0
	flw	%f1, 17(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 151(%zero)
	fadd	%f2, %f2, %f0
	fsw	%f2, 151(%zero)
	flw	%f2, 152(%zero)
	fadd	%f2, %f2, %f0
	fsw	%f2, 152(%zero)
	flw	%f2, 153(%zero)
	fadd	%f0, %f2, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.34820
bnei_else.34819:
bnei_cont.34820:
bnei_cont.34812:
	flw	%f0, 15(%sp)
	fsw	%f0, 162(%zero)
	flw	%f0, 14(%sp)
	fsw	%f0, 163(%zero)
	flw	%f0, 13(%sp)
	fsw	%f0, 164(%zero)
	lw	%v0, 0(%zero)
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v0, 434(%zero)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 17(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_reflections.2966
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f0, 441(%zero)
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.34821
	addi	%v0, %zero, 0
	j	fbgt_cont.34822
fbgt_else.34821:
	addi	%v0, %zero, 1
fbgt_cont.34822:
	beqi	%v0, 0, bnei_else.34823
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.34824
	j	bgti_cont.34825
bgti_else.34824:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.34825:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.34826
	jr	%ra
bnei_else.34826:
	flw	%f0, 484(%zero)
	lw	%v1, 12(%sp)
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
	j	trace_ray.2971
bnei_else.34823:
	jr	%ra
bnei_else.34786:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.34829
	lw	%v0, 5(%sp)
	flw	%f0, 0(%v0)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 494(%zero)
	fblt	%f1, %f0, fbgt_else.34830
	addi	%v0, %zero, 0
	j	fbgt_cont.34831
fbgt_else.34830:
	addi	%v0, %zero, 1
fbgt_cont.34831:
	beqi	%v0, 0, bnei_else.34832
	fmul	%f1, %f0, %f0
	fmul	%f0, %f1, %f0
	flw	%f1, 4(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 81(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 151(%zero)
	fadd	%f1, %f1, %f0
	fsw	%f1, 151(%zero)
	flw	%f1, 152(%zero)
	fadd	%f1, %f1, %f0
	fsw	%f1, 152(%zero)
	flw	%f1, 153(%zero)
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.34832:
	jr	%ra
bnei_else.34829:
	jr	%ra
bgt_else.34779:
	jr	%ra
trace_diffuse_ray.2977:
	addi	%v1, %zero, 0
	flw	%f1, 445(%zero)
	fsw	%f1, 137(%zero)
	lw	%a0, 134(%zero)
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
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.34843
	addi	%v0, %zero, 0
	j	fbgt_cont.34844
fbgt_else.34843:
	addi	%v0, %zero, 1
fbgt_cont.34844:
	beqi	%v0, 0, bnei_else.34845
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.34847
	addi	%v0, %zero, 0
	j	bnei_cont.34846
fbgt_else.34847:
	addi	%v0, %zero, 1
fbgt_cont.34848:
	j	bnei_cont.34846
bnei_else.34845:
	addi	%v0, %zero, 0
bnei_cont.34846:
	beqi	%v0, 0, bnei_else.34849
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.34850
	beqi	%a0, 2, bnei_else.34852
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
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
	beqi	%v1, 0, bnei_else.34854
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.34855
bnei_else.34854:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.34855:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 494(%zero)
	fbne	%f1, %f4, fbeq_else.34856
	addi	%a0, %zero, 1
	j	fbeq_cont.34857
fbeq_else.34856:
	addi	%a0, %zero, 0
fbeq_cont.34857:
	beqi	%a0, 0, bnei_else.34858
	flw	%f1, 484(%zero)
	j	bnei_cont.34859
bnei_else.34858:
	beqi	%v1, 0, bnei_else.34860
	flw	%f4, 460(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.34861
bnei_else.34860:
	flw	%f4, 484(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.34861:
bnei_cont.34859:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.34851
bnei_else.34852:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.34853:
	j	bnei_cont.34851
bnei_else.34850:
	lw	%a0, 136(%zero)
	flw	%f0, 494(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.34862
	addi	%v1, %zero, 1
	j	fbeq_cont.34863
fbeq_else.34862:
	addi	%v1, %zero, 0
fbeq_cont.34863:
	beqi	%v1, 0, bnei_else.34864
	j	bnei_cont.34865
bnei_else.34864:
	fblt	%f0, %f1, fbgt_else.34866
	addi	%v1, %zero, 0
	j	fbgt_cont.34867
fbgt_else.34866:
	addi	%v1, %zero, 1
fbgt_cont.34867:
	beqi	%v1, 0, bnei_else.34868
	flw	%f0, 484(%zero)
	j	bnei_cont.34869
bnei_else.34868:
	flw	%f0, 460(%zero)
bnei_cont.34869:
bnei_cont.34865:
	fneg	%f0, %f0
	fsw	%f0, 142(%a0)
bnei_cont.34851:
	addi	%v1, %zero, 138
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	utexture.2959
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.34870
	jr	%ra
bnei_else.34870:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 494(%zero)
	fblt	%f1, %f0, fbgt_else.34872
	addi	%v0, %zero, 0
	j	fbgt_cont.34873
fbgt_else.34872:
	addi	%v0, %zero, 1
fbgt_cont.34873:
	beqi	%v0, 0, bnei_else.34874
	j	bnei_cont.34875
bnei_else.34874:
	fmov	%f0, %f1
bnei_cont.34875:
	flw	%f1, 0(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	jr	%ra
bnei_else.34849:
	jr	%ra
iter_trace_diffuse_rays.2980:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.35092
	add	%at, %v0, %a1
	lw	%a3, 0(%at)
	lw	%t0, 0(%a3)
	flw	%f0, 0(%t0)
	flw	%f1, 0(%v1)
	fmul	%f0, %f0, %f1
	addi	%t1, %zero, 1
	flw	%f2, 1(%t0)
	flw	%f3, 1(%v1)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%t0)
	flw	%f4, 2(%v1)
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	flw	%f2, 494(%zero)
	fblt	%f0, %f2, fbgt_else.35093
	addi	%t0, %zero, 0
	j	fbgt_cont.35094
fbgt_else.35093:
	addi	%t0, %zero, 1
fbgt_cont.35094:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a2, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f4, 4(%sp)
	fsw	%f3, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a1, 8(%sp)
	beqi	%t0, 0, bnei_else.35095
	addi	%a3, %a1, 1
	add	%at, %v0, %a3
	lw	%a3, 0(%at)
	flw	%f5, 440(%zero)
	fdiv	%f0, %f0, %f5
	flw	%f5, 445(%zero)
	fsw	%f5, 137(%zero)
	lw	%t0, 134(%zero)
	lw	%t2, 0(%t0)
	lw	%t3, 0(%t2)
	fsw	%f0, 9(%sp)
	sw	%t0, 10(%sp)
	sw	%a3, 11(%sp)
	beqi	%t3, -1, bnei_else.35097
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.35099
	sw	%t2, 13(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solver_fast2.2865
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	beqi	%v0, 0, bnei_else.35101
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.35103
	addi	%v0, %zero, 0
	j	fbgt_cont.35104
fbgt_else.35103:
	addi	%v0, %zero, 1
fbgt_cont.35104:
	beqi	%v0, 0, bnei_else.35105
	lw	%v0, 13(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.35107
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.35109
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.35111
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.35113
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 13(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.35100
bnei_else.35113:
bnei_cont.35114:
	j	bnei_cont.35100
bnei_else.35111:
bnei_cont.35112:
	j	bnei_cont.35100
bnei_else.35109:
bnei_cont.35110:
	j	bnei_cont.35100
bnei_else.35107:
bnei_cont.35108:
	j	bnei_cont.35100
bnei_else.35105:
bnei_cont.35106:
	j	bnei_cont.35100
bnei_else.35101:
bnei_cont.35102:
	j	bnei_cont.35100
bnei_else.35099:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.35115
	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.35117
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.35119
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.35121
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 13(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.35116
bnei_else.35121:
bnei_cont.35122:
	j	bnei_cont.35116
bnei_else.35119:
bnei_cont.35120:
	j	bnei_cont.35116
bnei_else.35117:
bnei_cont.35118:
	j	bnei_cont.35116
bnei_else.35115:
bnei_cont.35116:
bnei_cont.35100:
	lw	%v0, 12(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.35098
bnei_else.35097:
bnei_cont.35098:
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.35123
	addi	%v0, %zero, 0
	j	fbgt_cont.35124
fbgt_else.35123:
	addi	%v0, %zero, 1
fbgt_cont.35124:
	beqi	%v0, 0, bnei_else.35125
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.35127
	addi	%v0, %zero, 0
	j	bnei_cont.35126
fbgt_else.35127:
	addi	%v0, %zero, 1
fbgt_cont.35128:
	j	bnei_cont.35126
bnei_else.35125:
	addi	%v0, %zero, 0
bnei_cont.35126:
	beqi	%v0, 0, bnei_else.35129
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.35131
	beqi	%a0, 2, bnei_else.35133
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
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
	beqi	%v1, 0, bnei_else.35135
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f7, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f9, %f2, %f8
	fadd	%f7, %f7, %f9
	flw	%f9, 464(%zero)
	fmul	%f7, %f7, %f9
	fadd	%f3, %f3, %f7
	fsw	%f3, 142(%zero)
	fmul	%f3, %f0, %f6
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f9
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	fmul	%f0, %f0, %f8
	fmul	%f1, %f1, %f6
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f9
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35136
bnei_else.35135:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.35136:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 3(%sp)
	fbne	%f1, %f4, fbeq_else.35137
	addi	%a0, %zero, 1
	j	fbeq_cont.35138
fbeq_else.35137:
	addi	%a0, %zero, 0
fbeq_cont.35138:
	beqi	%a0, 0, bnei_else.35139
	flw	%f1, 484(%zero)
	j	bnei_cont.35140
bnei_else.35139:
	beqi	%v1, 0, bnei_else.35141
	flw	%f5, 460(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.35142
bnei_else.35141:
	flw	%f5, 484(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.35142:
bnei_cont.35140:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.35132
bnei_else.35133:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35134:
	j	bnei_cont.35132
bnei_else.35131:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.35143
	addi	%v1, %zero, 1
	j	fbeq_cont.35144
fbeq_else.35143:
	addi	%v1, %zero, 0
fbeq_cont.35144:
	beqi	%v1, 0, bnei_else.35145
	fmov	%f1, %f0
	j	bnei_cont.35146
bnei_else.35145:
	fblt	%f0, %f1, fbgt_else.35147
	addi	%v1, %zero, 0
	j	fbgt_cont.35148
fbgt_else.35147:
	addi	%v1, %zero, 1
fbgt_cont.35148:
	beqi	%v1, 0, bnei_else.35149
	flw	%f1, 484(%zero)
	j	bnei_cont.35150
bnei_else.35149:
	flw	%f1, 460(%zero)
bnei_cont.35150:
bnei_cont.35146:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.35132:
	addi	%v1, %zero, 138
	sw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	utexture.2959
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	beqi	%v0, 0, bnei_else.35151
	j	bnei_cont.35096
bnei_else.35151:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f1, %f0, fbgt_else.35153
	addi	%v0, %zero, 0
	j	fbgt_cont.35154
fbgt_else.35153:
	addi	%v0, %zero, 1
fbgt_cont.35154:
	beqi	%v0, 0, bnei_else.35155
	j	bnei_cont.35156
bnei_else.35155:
	fmov	%f0, %f1
bnei_cont.35156:
	flw	%f2, 9(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 14(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)
	flw	%f3, 145(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 148(%zero)
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 149(%zero)
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35152:
	j	bnei_cont.35096
bnei_else.35129:
bnei_cont.35130:
	j	bnei_cont.35096
bnei_else.35095:
	flw	%f5, 439(%zero)
	fdiv	%f0, %f0, %f5
	flw	%f5, 445(%zero)
	fsw	%f5, 137(%zero)
	lw	%t0, 134(%zero)
	lw	%t2, 0(%t0)
	lw	%t3, 0(%t2)
	fsw	%f0, 15(%sp)
	sw	%t0, 16(%sp)
	sw	%a3, 17(%sp)
	beqi	%t3, -1, bnei_else.35157
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.35159
	sw	%t2, 18(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solver_fast2.2865
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	beqi	%v0, 0, bnei_else.35161
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.35163
	addi	%v0, %zero, 0
	j	fbgt_cont.35164
fbgt_else.35163:
	addi	%v0, %zero, 1
fbgt_cont.35164:
	beqi	%v0, 0, bnei_else.35165
	lw	%v0, 18(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.35167
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.35169
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.35171
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.35173
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 18(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.35160
bnei_else.35173:
bnei_cont.35174:
	j	bnei_cont.35160
bnei_else.35171:
bnei_cont.35172:
	j	bnei_cont.35160
bnei_else.35169:
bnei_cont.35170:
	j	bnei_cont.35160
bnei_else.35167:
bnei_cont.35168:
	j	bnei_cont.35160
bnei_else.35165:
bnei_cont.35166:
	j	bnei_cont.35160
bnei_else.35161:
bnei_cont.35162:
	j	bnei_cont.35160
bnei_else.35159:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.35175
	lw	%t3, 83(%t3)
	sw	%t2, 18(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.35177
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.35179
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.35181
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 18(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.35176
bnei_else.35181:
bnei_cont.35182:
	j	bnei_cont.35176
bnei_else.35179:
bnei_cont.35180:
	j	bnei_cont.35176
bnei_else.35177:
bnei_cont.35178:
	j	bnei_cont.35176
bnei_else.35175:
bnei_cont.35176:
bnei_cont.35160:
	lw	%v0, 12(%sp)
	lw	%v1, 16(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.35158
bnei_else.35157:
bnei_cont.35158:
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.35183
	addi	%v0, %zero, 0
	j	fbgt_cont.35184
fbgt_else.35183:
	addi	%v0, %zero, 1
fbgt_cont.35184:
	beqi	%v0, 0, bnei_else.35185
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.35187
	addi	%v0, %zero, 0
	j	bnei_cont.35186
fbgt_else.35187:
	addi	%v0, %zero, 1
fbgt_cont.35188:
	j	bnei_cont.35186
bnei_else.35185:
	addi	%v0, %zero, 0
bnei_cont.35186:
	beqi	%v0, 0, bnei_else.35189
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 17(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.35191
	beqi	%a0, 2, bnei_else.35193
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
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
	beqi	%v1, 0, bnei_else.35195
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f7, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f9, %f2, %f8
	fadd	%f7, %f7, %f9
	flw	%f9, 464(%zero)
	fmul	%f7, %f7, %f9
	fadd	%f3, %f3, %f7
	fsw	%f3, 142(%zero)
	fmul	%f3, %f0, %f6
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f9
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	fmul	%f0, %f0, %f8
	fmul	%f1, %f1, %f6
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f9
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35196
bnei_else.35195:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.35196:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 3(%sp)
	fbne	%f1, %f4, fbeq_else.35197
	addi	%a0, %zero, 1
	j	fbeq_cont.35198
fbeq_else.35197:
	addi	%a0, %zero, 0
fbeq_cont.35198:
	beqi	%a0, 0, bnei_else.35199
	flw	%f1, 484(%zero)
	j	bnei_cont.35200
bnei_else.35199:
	beqi	%v1, 0, bnei_else.35201
	flw	%f5, 460(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.35202
bnei_else.35201:
	flw	%f5, 484(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.35202:
bnei_cont.35200:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.35192
bnei_else.35193:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35194:
	j	bnei_cont.35192
bnei_else.35191:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.35203
	addi	%v1, %zero, 1
	j	fbeq_cont.35204
fbeq_else.35203:
	addi	%v1, %zero, 0
fbeq_cont.35204:
	beqi	%v1, 0, bnei_else.35205
	fmov	%f1, %f0
	j	bnei_cont.35206
bnei_else.35205:
	fblt	%f0, %f1, fbgt_else.35207
	addi	%v1, %zero, 0
	j	fbgt_cont.35208
fbgt_else.35207:
	addi	%v1, %zero, 1
fbgt_cont.35208:
	beqi	%v1, 0, bnei_else.35209
	flw	%f1, 484(%zero)
	j	bnei_cont.35210
bnei_else.35209:
	flw	%f1, 460(%zero)
bnei_cont.35210:
bnei_cont.35206:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.35192:
	addi	%v1, %zero, 138
	sw	%v0, 19(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	utexture.2959
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	beqi	%v0, 0, bnei_else.35211
	j	bnei_cont.35190
bnei_else.35211:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f1, %f0, fbgt_else.35213
	addi	%v0, %zero, 0
	j	fbgt_cont.35214
fbgt_else.35213:
	addi	%v0, %zero, 1
fbgt_cont.35214:
	beqi	%v0, 0, bnei_else.35215
	j	bnei_cont.35216
bnei_else.35215:
	fmov	%f0, %f1
bnei_cont.35216:
	flw	%f2, 15(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 19(%sp)
	lw	%v0, 7(%v0)
	flw	%f2, 0(%v0)
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)
	flw	%f3, 145(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 148(%zero)
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)
	fmul	%f3, %f0, %f3
	fadd	%f2, %f2, %f3
	fsw	%f2, 149(%zero)
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)
	fmul	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35212:
	j	bnei_cont.35190
bnei_else.35189:
bnei_cont.35190:
bnei_cont.35096:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.35217
	lw	%v1, 7(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	flw	%f0, 0(%a1)
	flw	%f1, 6(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a1)
	flw	%f2, 5(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a1)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.35218
	addi	%a1, %zero, 0
	j	fbgt_cont.35219
fbgt_else.35218:
	addi	%a1, %zero, 1
fbgt_cont.35219:
	sw	%v0, 20(%sp)
	beqi	%a1, 0, bnei_else.35220
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 445(%zero)
	fsw	%f2, 137(%zero)
	lw	%a1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 21(%sp)
	sw	%a1, 22(%sp)
	sw	%a0, 23(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.35222
	addi	%v0, %zero, 0
	j	fbgt_cont.35223
fbgt_else.35222:
	addi	%v0, %zero, 1
fbgt_cont.35223:
	beqi	%v0, 0, bnei_else.35224
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.35226
	addi	%v0, %zero, 0
	j	bnei_cont.35225
fbgt_else.35226:
	addi	%v0, %zero, 1
fbgt_cont.35227:
	j	bnei_cont.35225
bnei_else.35224:
	addi	%v0, %zero, 0
bnei_cont.35225:
	beqi	%v0, 0, bnei_else.35228
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 23(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.35230
	beqi	%a0, 2, bnei_else.35232
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
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
	beqi	%v1, 0, bnei_else.35234
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35235
bnei_else.35234:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.35235:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 3(%sp)
	fbne	%f1, %f4, fbeq_else.35236
	addi	%a0, %zero, 1
	j	fbeq_cont.35237
fbeq_else.35236:
	addi	%a0, %zero, 0
fbeq_cont.35237:
	beqi	%a0, 0, bnei_else.35238
	flw	%f1, 484(%zero)
	j	bnei_cont.35239
bnei_else.35238:
	beqi	%v1, 0, bnei_else.35240
	flw	%f5, 460(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.35241
bnei_else.35240:
	flw	%f5, 484(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.35241:
bnei_cont.35239:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.35231
bnei_else.35232:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35233:
	j	bnei_cont.35231
bnei_else.35230:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.35242
	addi	%v1, %zero, 1
	j	fbeq_cont.35243
fbeq_else.35242:
	addi	%v1, %zero, 0
fbeq_cont.35243:
	beqi	%v1, 0, bnei_else.35244
	fmov	%f1, %f0
	j	bnei_cont.35245
bnei_else.35244:
	fblt	%f0, %f1, fbgt_else.35246
	addi	%v1, %zero, 0
	j	fbgt_cont.35247
fbgt_else.35246:
	addi	%v1, %zero, 1
fbgt_cont.35247:
	beqi	%v1, 0, bnei_else.35248
	flw	%f1, 484(%zero)
	j	bnei_cont.35249
bnei_else.35248:
	flw	%f1, 460(%zero)
bnei_cont.35249:
bnei_cont.35245:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.35231:
	addi	%v1, %zero, 138
	sw	%v0, 24(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	utexture.2959
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 22(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	beqi	%v0, 0, bnei_else.35250
	j	bnei_cont.35221
bnei_else.35250:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f1, %f0, fbgt_else.35252
	addi	%v0, %zero, 0
	j	fbgt_cont.35253
fbgt_else.35252:
	addi	%v0, %zero, 1
fbgt_cont.35253:
	beqi	%v0, 0, bnei_else.35254
	j	bnei_cont.35255
bnei_else.35254:
	fmov	%f0, %f1
bnei_cont.35255:
	flw	%f1, 21(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 24(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35251:
	j	bnei_cont.35221
bnei_else.35228:
bnei_cont.35229:
	j	bnei_cont.35221
bnei_else.35220:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 445(%zero)
	fsw	%f2, 137(%zero)
	lw	%a1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 25(%sp)
	sw	%a1, 26(%sp)
	sw	%a0, 27(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.35256
	addi	%v0, %zero, 0
	j	fbgt_cont.35257
fbgt_else.35256:
	addi	%v0, %zero, 1
fbgt_cont.35257:
	beqi	%v0, 0, bnei_else.35258
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.35260
	addi	%v0, %zero, 0
	j	bnei_cont.35259
fbgt_else.35260:
	addi	%v0, %zero, 1
fbgt_cont.35261:
	j	bnei_cont.35259
bnei_else.35258:
	addi	%v0, %zero, 0
bnei_cont.35259:
	beqi	%v0, 0, bnei_else.35262
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 27(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.35264
	beqi	%a0, 2, bnei_else.35266
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
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
	beqi	%v1, 0, bnei_else.35268
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35269
bnei_else.35268:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.35269:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 3(%sp)
	fbne	%f1, %f4, fbeq_else.35270
	addi	%a0, %zero, 1
	j	fbeq_cont.35271
fbeq_else.35270:
	addi	%a0, %zero, 0
fbeq_cont.35271:
	beqi	%a0, 0, bnei_else.35272
	flw	%f1, 484(%zero)
	j	bnei_cont.35273
bnei_else.35272:
	beqi	%v1, 0, bnei_else.35274
	flw	%f5, 460(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.35275
bnei_else.35274:
	flw	%f5, 484(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.35275:
bnei_cont.35273:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.35265
bnei_else.35266:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35267:
	j	bnei_cont.35265
bnei_else.35264:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.35276
	addi	%v1, %zero, 1
	j	fbeq_cont.35277
fbeq_else.35276:
	addi	%v1, %zero, 0
fbeq_cont.35277:
	beqi	%v1, 0, bnei_else.35278
	fmov	%f1, %f0
	j	bnei_cont.35279
bnei_else.35278:
	fblt	%f0, %f1, fbgt_else.35280
	addi	%v1, %zero, 0
	j	fbgt_cont.35281
fbgt_else.35280:
	addi	%v1, %zero, 1
fbgt_cont.35281:
	beqi	%v1, 0, bnei_else.35282
	flw	%f1, 484(%zero)
	j	bnei_cont.35283
bnei_else.35282:
	flw	%f1, 460(%zero)
bnei_cont.35283:
bnei_cont.35279:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.35265:
	addi	%v1, %zero, 138
	sw	%v0, 28(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	utexture.2959
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 26(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	beqi	%v0, 0, bnei_else.35284
	j	bnei_cont.35263
bnei_else.35284:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f1, %f0, fbgt_else.35286
	addi	%v0, %zero, 0
	j	fbgt_cont.35287
fbgt_else.35286:
	addi	%v0, %zero, 1
fbgt_cont.35287:
	beqi	%v0, 0, bnei_else.35288
	j	bnei_cont.35289
bnei_else.35288:
	fmov	%f0, %f1
bnei_cont.35289:
	flw	%f1, 25(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 28(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35285:
	j	bnei_cont.35263
bnei_else.35262:
bnei_cont.35263:
bnei_cont.35221:
	lw	%v0, 20(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.35217:
	jr	%ra
bgti_else.35092:
	jr	%ra
trace_diffuse_rays.2985:
	addi	%a1, %zero, 0
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a2, 0(%zero)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%a1, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	lw	%a0, 118(%v0)
	lw	%v1, 0(%a0)
	flw	%f0, 0(%v1)
	lw	%a1, 2(%sp)
	flw	%f1, 0(%a1)
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	flw	%f2, 2(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 494(%zero)
	fblt	%f0, %f1, fbgt_else.35315
	addi	%v1, %zero, 0
	j	fbgt_cont.35316
fbgt_else.35315:
	addi	%v1, %zero, 1
fbgt_cont.35316:
	beqi	%v1, 0, bnei_else.35317
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 445(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 1(%sp)
	fsw	%f0, 4(%sp)
	sw	%v1, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%a0, 7(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.35319
	addi	%v0, %zero, 0
	j	fbgt_cont.35320
fbgt_else.35319:
	addi	%v0, %zero, 1
fbgt_cont.35320:
	beqi	%v0, 0, bnei_else.35321
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.35323
	addi	%v0, %zero, 0
	j	bnei_cont.35322
fbgt_else.35323:
	addi	%v0, %zero, 1
fbgt_cont.35324:
	j	bnei_cont.35322
bnei_else.35321:
	addi	%v0, %zero, 0
bnei_cont.35322:
	beqi	%v0, 0, bnei_else.35325
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 7(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.35327
	beqi	%a0, 2, bnei_else.35329
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
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
	beqi	%v1, 0, bnei_else.35331
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35332
bnei_else.35331:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.35332:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 6(%sp)
	fbne	%f1, %f4, fbeq_else.35333
	addi	%a0, %zero, 1
	j	fbeq_cont.35334
fbeq_else.35333:
	addi	%a0, %zero, 0
fbeq_cont.35334:
	beqi	%a0, 0, bnei_else.35335
	flw	%f1, 484(%zero)
	j	bnei_cont.35336
bnei_else.35335:
	beqi	%v1, 0, bnei_else.35337
	flw	%f5, 460(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.35338
bnei_else.35337:
	flw	%f5, 484(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.35338:
bnei_cont.35336:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.35328
bnei_else.35329:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35330:
	j	bnei_cont.35328
bnei_else.35327:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.35339
	addi	%v1, %zero, 1
	j	fbeq_cont.35340
fbeq_else.35339:
	addi	%v1, %zero, 0
fbeq_cont.35340:
	beqi	%v1, 0, bnei_else.35341
	fmov	%f1, %f0
	j	bnei_cont.35342
bnei_else.35341:
	fblt	%f0, %f1, fbgt_else.35343
	addi	%v1, %zero, 0
	j	fbgt_cont.35344
fbgt_else.35343:
	addi	%v1, %zero, 1
fbgt_cont.35344:
	beqi	%v1, 0, bnei_else.35345
	flw	%f1, 484(%zero)
	j	bnei_cont.35346
bnei_else.35345:
	flw	%f1, 460(%zero)
bnei_cont.35346:
bnei_cont.35342:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.35328:
	addi	%v1, %zero, 138
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	utexture.2959
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, 0, bnei_else.35347
	j	bnei_cont.35318
bnei_else.35347:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 6(%sp)
	fblt	%f1, %f0, fbgt_else.35349
	addi	%v0, %zero, 0
	j	fbgt_cont.35350
fbgt_else.35349:
	addi	%v0, %zero, 1
fbgt_cont.35350:
	beqi	%v0, 0, bnei_else.35351
	j	bnei_cont.35352
bnei_else.35351:
	fmov	%f0, %f1
bnei_cont.35352:
	flw	%f1, 4(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 8(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35348:
	j	bnei_cont.35318
bnei_else.35325:
bnei_cont.35326:
	j	bnei_cont.35318
bnei_else.35317:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 445(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 1(%sp)
	fsw	%f0, 9(%sp)
	sw	%v1, 10(%sp)
	fsw	%f1, 6(%sp)
	sw	%a0, 11(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	fblt	%f1, %f0, fbgt_else.35353
	addi	%v0, %zero, 0
	j	fbgt_cont.35354
fbgt_else.35353:
	addi	%v0, %zero, 1
fbgt_cont.35354:
	beqi	%v0, 0, bnei_else.35355
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.35357
	addi	%v0, %zero, 0
	j	bnei_cont.35356
fbgt_else.35357:
	addi	%v0, %zero, 1
fbgt_cont.35358:
	j	bnei_cont.35356
bnei_else.35355:
	addi	%v0, %zero, 0
bnei_cont.35356:
	beqi	%v0, 0, bnei_else.35359
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.35361
	beqi	%a0, 2, bnei_else.35363
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 1(%v1)
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
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
	beqi	%v1, 0, bnei_else.35365
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 464(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	fsw	%f3, 142(%zero)
	lw	%v1, 9(%v0)
	flw	%f3, 2(%v1)
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)
	flw	%f6, 0(%v1)
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	fmul	%f2, %f2, %f7
	fadd	%f2, %f4, %f2
	fsw	%f2, 143(%zero)
	lw	%v1, 9(%v0)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)
	flw	%f2, 0(%v1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fmul	%f0, %f0, %f7
	fadd	%f0, %f5, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.35366
bnei_else.35365:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.35366:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 6(%sp)
	fbne	%f1, %f4, fbeq_else.35367
	addi	%a0, %zero, 1
	j	fbeq_cont.35368
fbeq_else.35367:
	addi	%a0, %zero, 0
fbeq_cont.35368:
	beqi	%a0, 0, bnei_else.35369
	flw	%f1, 484(%zero)
	j	bnei_cont.35370
bnei_else.35369:
	beqi	%v1, 0, bnei_else.35371
	flw	%f5, 460(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.35372
bnei_else.35371:
	flw	%f5, 484(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.35372:
bnei_cont.35370:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.35362
bnei_else.35363:
	lw	%v1, 4(%v0)
	flw	%f0, 0(%v1)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 1(%v1)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%v1, 4(%v0)
	flw	%f0, 2(%v1)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.35364:
	j	bnei_cont.35362
bnei_else.35361:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.35373
	addi	%v1, %zero, 1
	j	fbeq_cont.35374
fbeq_else.35373:
	addi	%v1, %zero, 0
fbeq_cont.35374:
	beqi	%v1, 0, bnei_else.35375
	fmov	%f1, %f0
	j	bnei_cont.35376
bnei_else.35375:
	fblt	%f0, %f1, fbgt_else.35377
	addi	%v1, %zero, 0
	j	fbgt_cont.35378
fbgt_else.35377:
	addi	%v1, %zero, 1
fbgt_cont.35378:
	beqi	%v1, 0, bnei_else.35379
	flw	%f1, 484(%zero)
	j	bnei_cont.35380
bnei_else.35379:
	flw	%f1, 460(%zero)
bnei_cont.35380:
bnei_cont.35376:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.35362:
	addi	%v1, %zero, 138
	sw	%v0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	utexture.2959
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.35381
	j	bnei_cont.35360
bnei_else.35381:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f2, 80(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	flw	%f1, 6(%sp)
	fblt	%f1, %f0, fbgt_else.35383
	addi	%v0, %zero, 0
	j	fbgt_cont.35384
fbgt_else.35383:
	addi	%v0, %zero, 1
fbgt_cont.35384:
	beqi	%v0, 0, bnei_else.35385
	j	bnei_cont.35386
bnei_else.35385:
	fmov	%f0, %f1
bnei_cont.35386:
	flw	%f1, 9(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 12(%sp)
	lw	%v0, 7(%v0)
	flw	%f1, 0(%v0)
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)
	flw	%f2, 145(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	fsw	%f1, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.35382:
	j	bnei_cont.35360
bnei_else.35359:
bnei_cont.35360:
bnei_cont.35318:
	addi	%a1, %zero, 116
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
do_without_neighbors.3002:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.35470
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.35471
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.35472
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%a0, 5(%sp)
	beqi	%a0, 0, bnei_else.35474
	lw	%t0, 179(%zero)
	flw	%f0, 0(%a2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 164(%zero)
	lw	%t1, 0(%zero)
	addi	%t1, %t1, -1
	sw	%t0, 6(%sp)
	addi	%v1, %t1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 6(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.35475
bnei_else.35474:
bnei_cont.35475:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.35476
	lw	%v1, 180(%zero)
	lw	%a0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 7(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 7(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.35477
bnei_else.35476:
bnei_cont.35477:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.35478
	lw	%v1, 181(%zero)
	lw	%a0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 8(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 8(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.35479
bnei_else.35478:
bnei_cont.35479:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.35480
	lw	%v1, 182(%zero)
	lw	%a0, 4(%sp)
	flw	%f0, 0(%a0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 164(%zero)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%v1, 9(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 9(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.35481
bnei_else.35480:
bnei_cont.35481:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.35482
	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)
	flw	%f0, 0(%v1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%a0, %a0, -1
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 10(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.35483
bnei_else.35482:
bnei_cont.35483:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.35473
bnei_else.35472:
bnei_cont.35473:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.35484
	lw	%v1, 0(%sp)
	lw	%a0, 2(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.35485
	lw	%a0, 3(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.35486
	lw	%a0, 5(%v1)
	lw	%a1, 7(%v1)
	lw	%a2, 1(%v1)
	lw	%a3, 4(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%v1)
	lw	%a0, 0(%a0)
	add	%at, %a1, %v0
	lw	%a1, 0(%at)
	add	%at, %a2, %v0
	lw	%a2, 0(%at)
	sw	%v0, 11(%sp)
	sw	%a3, 12(%sp)
	sw	%a2, 13(%sp)
	sw	%a1, 14(%sp)
	sw	%a0, 15(%sp)
	beqi	%a0, 0, bnei_else.35488
	lw	%t0, 179(%zero)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0
	addi	%v0, %t0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.35489
bnei_else.35488:
bnei_cont.35489:
	lw	%v0, 15(%sp)
	beqi	%v0, 1, bnei_else.35490
	lw	%v1, 180(%zero)
	lw	%a0, 14(%sp)
	lw	%a1, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.35491
bnei_else.35490:
bnei_cont.35491:
	lw	%v0, 15(%sp)
	beqi	%v0, 2, bnei_else.35492
	lw	%v1, 181(%zero)
	lw	%a0, 14(%sp)
	lw	%a1, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.35493
bnei_else.35492:
bnei_cont.35493:
	lw	%v0, 15(%sp)
	beqi	%v0, 3, bnei_else.35494
	lw	%v1, 182(%zero)
	lw	%a0, 14(%sp)
	lw	%a1, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.35495
bnei_else.35494:
bnei_cont.35495:
	lw	%v0, 15(%sp)
	beqi	%v0, 4, bnei_else.35496
	lw	%v0, 183(%zero)
	lw	%v1, 14(%sp)
	lw	%a0, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.35497
bnei_else.35496:
bnei_cont.35497:
	lw	%v0, 11(%sp)
	lw	%v1, 12(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.35487
bnei_else.35486:
bnei_cont.35487:
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.35485:
	jr	%ra
bgt_else.35484:
	jr	%ra
bgti_else.35471:
	jr	%ra
bgt_else.35470:
	jr	%ra
try_exploit_neighbors.3018:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.35535
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.35536
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.35537
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.35539
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.35541
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.35543
	addi	%t1, %zero, 1
	j	beq_cont.35538
beq_else.35543:
	addi	%t1, %zero, 0
beq_cont.35544:
	j	beq_cont.35538
beq_else.35541:
	addi	%t1, %zero, 0
beq_cont.35542:
	j	beq_cont.35538
beq_else.35539:
	addi	%t1, %zero, 0
beq_cont.35540:
	j	beq_cont.35538
beq_else.35537:
	addi	%t1, %zero, 0
beq_cont.35538:
	beqi	%t1, 0, bnei_else.35545
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.35546
	lw	%t1, 5(%t2)
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 5(%t3)
	lw	%t4, 5(%t0)
	addi	%t5, %v0, 1
	add	%at, %a1, %t5
	lw	%t5, 0(%at)
	lw	%t5, 5(%t5)
	add	%at, %a2, %v0
	lw	%t6, 0(%at)
	lw	%t6, 5(%t6)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	flw	%f0, 0(%t1)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)
	fsw	%f0, 150(%zero)
	add	%at, %t3, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t4, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t5, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t6, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t1, 4(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%t1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%t1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%t1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.35547
bnei_else.35546:
bnei_cont.35547:
	addi	%a3, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.35548
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.35549
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.35550
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.35552
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.35554
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.35556
	addi	%t1, %zero, 1
	j	beq_cont.35551
beq_else.35556:
	addi	%t1, %zero, 0
beq_cont.35557:
	j	beq_cont.35551
beq_else.35554:
	addi	%t1, %zero, 0
beq_cont.35555:
	j	beq_cont.35551
beq_else.35552:
	addi	%t1, %zero, 0
beq_cont.35553:
	j	beq_cont.35551
beq_else.35550:
	addi	%t1, %zero, 0
beq_cont.35551:
	beqi	%t1, 0, bnei_else.35558
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.35559
	lw	%t1, 5(%t2)
	addi	%t2, %v0, -1
	add	%at, %a1, %t2
	lw	%t2, 0(%at)
	lw	%t2, 5(%t2)
	lw	%t3, 5(%t0)
	addi	%t4, %v0, 1
	add	%at, %a1, %t4
	lw	%t4, 0(%at)
	lw	%t4, 5(%t4)
	add	%at, %a2, %v0
	lw	%t5, 0(%at)
	lw	%t5, 5(%t5)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	flw	%f0, 0(%t1)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)
	fsw	%f0, 150(%zero)
	add	%at, %t2, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t3, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t4, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	add	%at, %t5, %a3
	lw	%t1, 0(%at)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t1)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t0, 4(%t0)
	add	%at, %t0, %a3
	lw	%t0, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%t0)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%t0)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%t0)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.35560
bnei_else.35559:
bnei_cont.35560:
	addi	%a3, %a3, 1
	j	try_exploit_neighbors.3018
bnei_else.35558:
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	j	do_without_neighbors.3002
bgti_else.35549:
	jr	%ra
bgt_else.35548:
	jr	%ra
bnei_else.35545:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.35563
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.35564
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 0(%sp)
	sw	%a3, 1(%sp)
	beqi	%v0, 0, bnei_else.35565
	lw	%v0, 5(%t0)
	lw	%v1, 7(%t0)
	lw	%a0, 1(%t0)
	lw	%a1, 4(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	flw	%f0, 0(%v0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%v0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%v0)
	fsw	%f0, 150(%zero)
	lw	%v0, 6(%t0)
	lw	%v0, 0(%v0)
	add	%at, %v1, %a3
	lw	%v1, 0(%at)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	beqi	%v0, 0, bnei_else.35567
	lw	%a2, 179(%zero)
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.35568
bnei_else.35567:
bnei_cont.35568:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.35569
	lw	%v1, 180(%zero)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.35570
bnei_else.35569:
bnei_cont.35570:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.35571
	lw	%v1, 181(%zero)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.35572
bnei_else.35571:
bnei_cont.35572:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.35573
	lw	%v1, 182(%zero)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.35574
bnei_else.35573:
bnei_cont.35574:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.35575
	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.35576
bnei_else.35575:
bnei_cont.35576:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%v1, 0(%at)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.35566
bnei_else.35565:
bnei_cont.35566:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.35564:
	jr	%ra
bgt_else.35563:
	jr	%ra
bgti_else.35536:
	jr	%ra
bgt_else.35535:
	jr	%ra
pretrace_diffuse_rays.3031:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.35601
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.35602
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.35603
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 494(%zero)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a0, 179(%a0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	flw	%f0, 0(%a2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 164(%zero)
	lw	%a3, 0(%zero)
	addi	%a3, %a3, -1
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a0, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%v0)
	lw	%a0, 0(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.35604
bnei_else.35603:
bnei_cont.35604:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.35605
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.35606
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.35607
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 494(%zero)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%a0, 179(%a0)
	add	%at, %a1, %v1
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	lw	%a2, 0(%at)
	flw	%f1, 0(%a2)
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)
	fsw	%f1, 164(%zero)
	lw	%a3, 0(%zero)
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
	jal	setup_startp_constants.2882
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
	fblt	%f0, %f1, fbgt_else.35609
	addi	%a0, %zero, 0
	j	fbgt_cont.35610
fbgt_else.35609:
	addi	%a0, %zero, 1
fbgt_cont.35610:
	beqi	%a0, 0, bnei_else.35611
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.35612
bnei_else.35611:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.35612:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%v0)
	lw	%a0, 5(%sp)
	add	%at, %v1, %a0
	lw	%v1, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.35608
bnei_else.35607:
bnei_cont.35608:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3031
bgti_else.35606:
	jr	%ra
bgt_else.35605:
	jr	%ra
bgti_else.35602:
	jr	%ra
bgt_else.35601:
	jr	%ra
pretrace_pixels.3034:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.35641
	flw	%f3, 158(%zero)
	lw	%a2, 156(%zero)
	sub	%a2, %v1, %a2
	itof	%f4, %a2
	fmul	%f3, %f3, %f4
	flw	%f4, 165(%zero)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	fsw	%f4, 174(%zero)
	addi	%a2, %zero, 1
	flw	%f4, 166(%zero)
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	fsw	%f4, 175(%zero)
	flw	%f4, 167(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f3, %f2
	fsw	%f3, 176(%zero)
	flw	%f3, 174(%zero)
	fmul	%f4, %f3, %f3
	flw	%f5, 175(%zero)
	fmul	%f6, %f5, %f5
	fadd	%f4, %f4, %f6
	flw	%f6, 176(%zero)
	fmul	%f7, %f6, %f6
	fadd	%f4, %f4, %f7
	fsqrt	%f4, %f4
	flw	%f7, 494(%zero)
	fbne	%f4, %f7, fbeq_else.35642
	addi	%a3, %zero, 1
	j	fbeq_cont.35643
fbeq_else.35642:
	addi	%a3, %zero, 0
fbeq_cont.35643:
	beqi	%a3, 0, bnei_else.35644
	flw	%f4, 484(%zero)
	j	bnei_cont.35645
bnei_else.35644:
	flw	%f8, 484(%zero)
	fdiv	%f4, %f8, %f4
bnei_cont.35645:
	fmul	%f3, %f3, %f4
	fsw	%f3, 174(%zero)
	fmul	%f3, %f5, %f4
	fsw	%f3, 175(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f3, 176(%zero)
	fsw	%f7, 151(%zero)
	fsw	%f7, 152(%zero)
	fsw	%f7, 153(%zero)
	flw	%f3, 75(%zero)
	fsw	%f3, 159(%zero)
	flw	%f3, 76(%zero)
	fsw	%f3, 160(%zero)
	flw	%f3, 77(%zero)
	fsw	%f3, 161(%zero)
	flw	%f3, 484(%zero)
	add	%at, %v0, %v1
	lw	%a3, 0(%at)
	addi	%t0, %zero, 174
	fsw	%f2, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a2, 5(%sp)
	fsw	%f7, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%a3, 8(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t0, 0
	addi	%v0, %a1, 0
	fmov	%f1, %f7
	fmov	%f0, %f3
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	trace_ray.2971
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 0(%v0)
	flw	%f0, 151(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 152(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 153(%zero)
	fsw	%f0, 2(%v1)
	lw	%v1, 6(%v0)
	lw	%a0, 7(%sp)
	sw	%a0, 0(%v1)
	lw	%v1, 2(%v0)
	lw	%v1, 0(%v1)
	blti	%v1, 0, bgti_else.35646
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.35648
	lw	%v1, 6(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 6(%sp)
	fsw	%f0, 148(%zero)
	fsw	%f0, 149(%zero)
	fsw	%f0, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a2, 1(%v0)
	lw	%v1, 179(%v1)
	lw	%a1, 0(%a1)
	lw	%a2, 0(%a2)
	flw	%f1, 0(%a2)
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)
	fsw	%f1, 164(%zero)
	lw	%a3, 0(%zero)
	addi	%a3, %a3, -1
	sw	%a2, 9(%sp)
	sw	%a1, 10(%sp)
	sw	%v1, 11(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 0(%v1)
	flw	%f0, 0(%a0)
	lw	%a1, 10(%sp)
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
	flw	%f1, 6(%sp)
	fblt	%f0, %f1, fbgt_else.35650
	addi	%a0, %zero, 0
	j	fbgt_cont.35651
fbgt_else.35650:
	addi	%a0, %zero, 1
fbgt_cont.35651:
	beqi	%a0, 0, bnei_else.35652
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.35653
bnei_else.35652:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.35653:
	addi	%a1, %zero, 116
	lw	%v0, 11(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_trace_diffuse_rays.2980
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 8(%sp)
	lw	%v1, 5(%v0)
	lw	%v1, 0(%v1)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%v1)
	j	bnei_cont.35649
bnei_else.35648:
bnei_cont.35649:
	lw	%v1, 5(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.35647
bgti_else.35646:
bgti_cont.35647:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.35654
	addi	%a0, %v0, -5
	j	bgti_cont.35655
bgti_else.35654:
	add	%a0, %zero, %v0
bgti_cont.35655:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3034
bgti_else.35641:
	jr	%ra
scan_pixel.3045:
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.37341
	jr	%ra
bgt_else.37341:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%t2, 0(%t1)
	flw	%f0, 0(%t2)
	fsw	%f0, 151(%zero)
	addi	%t3, %zero, 1
	flw	%f0, 1(%t2)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%t2)
	fsw	%f0, 153(%zero)
	lw	%t2, 155(%zero)
	addi	%t4, %v1, 1
	blt	%t4, %t2, bgt_else.37343
	addi	%t5, %zero, 0
	j	bgt_cont.37344
bgt_else.37343:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37345
	addi	%t5, %zero, 0
	j	bgt_cont.37346
bgt_else.37345:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.37347
	addi	%t5, %zero, 0
	j	bgt_cont.37348
bgt_else.37347:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.37349
	addi	%t5, %zero, 0
	j	bgt_cont.37350
bgt_else.37349:
	addi	%t5, %zero, 1
bgt_cont.37350:
bgt_cont.37348:
bgt_cont.37346:
bgt_cont.37344:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%t4, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%v0, 8(%sp)
	beqi	%t5, 0, bnei_else.37351
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.37353
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t7, 2(%t6)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.37355
	add	%at, %a2, %v0
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.37357
	addi	%t7, %v0, -1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.37359
	addi	%t7, %v0, 1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.37361
	addi	%t5, %zero, 1
	j	beq_cont.37356
beq_else.37361:
	addi	%t5, %zero, 0
beq_cont.37362:
	j	beq_cont.37356
beq_else.37359:
	addi	%t5, %zero, 0
beq_cont.37360:
	j	beq_cont.37356
beq_else.37357:
	addi	%t5, %zero, 0
beq_cont.37358:
	j	beq_cont.37356
beq_else.37355:
	addi	%t5, %zero, 0
beq_cont.37356:
	beqi	%t5, 0, bnei_else.37363
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	beqi	%t5, 0, bnei_else.37365
	lw	%t5, 5(%t6)
	addi	%t6, %v0, -1
	add	%at, %a1, %t6
	lw	%t6, 0(%at)
	lw	%t6, 5(%t6)
	lw	%t7, 5(%t1)
	addi	%s0, %v0, 1
	add	%at, %a1, %s0
	lw	%s0, 0(%at)
	lw	%s0, 5(%s0)
	add	%at, %a2, %v0
	lw	%s1, 0(%at)
	lw	%s1, 5(%s1)
	lw	%t5, 0(%t5)
	flw	%f0, 0(%t5)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t5)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t5)
	fsw	%f0, 150(%zero)
	lw	%t5, 0(%t6)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t5, 0(%t7)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t5, 0(%s0)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t5, 0(%s1)
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 148(%zero)
	flw	%f0, 149(%zero)
	flw	%f1, 1(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 149(%zero)
	flw	%f0, 150(%zero)
	flw	%f1, 2(%t5)
	fadd	%f0, %f0, %f1
	fsw	%f0, 150(%zero)
	lw	%t1, 4(%t1)
	lw	%t1, 0(%t1)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%t1)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%t1)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%t1)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.37366
bnei_else.37365:
bnei_cont.37366:
	addi	%a3, %t3, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.37352
bnei_else.37363:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.37364:
	j	bnei_cont.37352
bgti_else.37353:
bgti_cont.37354:
	j	bnei_cont.37352
bnei_else.37351:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.37367
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.37369
	lw	%t5, 5(%t1)
	lw	%t6, 7(%t1)
	lw	%t7, 1(%t1)
	lw	%s0, 4(%t1)
	lw	%t5, 0(%t5)
	flw	%f0, 0(%t5)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t5)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t5)
	fsw	%f0, 150(%zero)
	lw	%t5, 6(%t1)
	lw	%t5, 0(%t5)
	lw	%t6, 0(%t6)
	lw	%t7, 0(%t7)
	sw	%s0, 11(%sp)
	sw	%t7, 12(%sp)
	sw	%t6, 13(%sp)
	sw	%t5, 14(%sp)
	beqi	%t5, 0, bnei_else.37371
	lw	%s1, 179(%zero)
	addi	%a0, %t7, 0
	addi	%v1, %t6, 0
	addi	%v0, %s1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.37372
bnei_else.37371:
bnei_cont.37372:
	lw	%v0, 14(%sp)
	beqi	%v0, 1, bnei_else.37373
	lw	%v1, 180(%zero)
	lw	%a0, 13(%sp)
	lw	%a1, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.37374
bnei_else.37373:
bnei_cont.37374:
	lw	%v0, 14(%sp)
	beqi	%v0, 2, bnei_else.37375
	lw	%v1, 181(%zero)
	lw	%a0, 13(%sp)
	lw	%a1, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.37376
bnei_else.37375:
bnei_cont.37376:
	lw	%v0, 14(%sp)
	beqi	%v0, 3, bnei_else.37377
	lw	%v1, 182(%zero)
	lw	%a0, 13(%sp)
	lw	%a1, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.37378
bnei_else.37377:
bnei_cont.37378:
	lw	%v0, 14(%sp)
	beqi	%v0, 4, bnei_else.37379
	lw	%v0, 183(%zero)
	lw	%v1, 13(%sp)
	lw	%a0, 12(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.37380
bnei_else.37379:
bnei_cont.37380:
	lw	%v0, 11(%sp)
	lw	%v0, 0(%v0)
	flw	%f0, 151(%zero)
	flw	%f1, 0(%v0)
	flw	%f2, 148(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	flw	%f1, 1(%v0)
	flw	%f2, 149(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	flw	%f1, 2(%v0)
	flw	%f2, 150(%zero)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.37370
bnei_else.37369:
bnei_cont.37370:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.37368
bgti_else.37367:
bgti_cont.37368:
bnei_cont.37352:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.37381
	blti	%v0, 0, bgti_else.37383
	j	bgt_cont.37382
bgti_else.37383:
	addi	%v0, %zero, 0
bgti_cont.37384:
	j	bgt_cont.37382
bgt_else.37381:
	addi	%v0, %zero, 255
bgt_cont.37382:
	addi	%v1, %zero, 10
	sw	%v1, 15(%sp)
	sw	%v0, 16(%sp)
	blti	%v0, 10, bgti_else.37385
	addi	%a0, %v0, -10
	blti	%a0, 10, bgti_else.37387
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37389
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37391
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	print_int_sub1.2629
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.37386
bgti_else.37391:
	addi	%v0, %zero, 3
bgti_cont.37392:
	j	bgti_cont.37386
bgti_else.37389:
	addi	%v0, %zero, 2
bgti_cont.37390:
	j	bgti_cont.37386
bgti_else.37387:
	addi	%v0, %zero, 1
bgti_cont.37388:
	j	bgti_cont.37386
bgti_else.37385:
	addi	%v0, %zero, 0
bgti_cont.37386:
	lw	%v1, 16(%sp)
	sw	%v0, 17(%sp)
	blti	%v1, 10, bgti_else.37393
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37395
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37397
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37399
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37401
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37403
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37405
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37407
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37409
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37411
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37413
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37415
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	print_int_sub2.2632
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.37394
bgti_else.37415:
	add	%v0, %zero, %v1
bgti_cont.37416:
	j	bgti_cont.37394
bgti_else.37413:
	add	%v0, %zero, %v1
bgti_cont.37414:
	j	bgti_cont.37394
bgti_else.37411:
	add	%v0, %zero, %v1
bgti_cont.37412:
	j	bgti_cont.37394
bgti_else.37409:
	add	%v0, %zero, %v1
bgti_cont.37410:
	j	bgti_cont.37394
bgti_else.37407:
	add	%v0, %zero, %v1
bgti_cont.37408:
	j	bgti_cont.37394
bgti_else.37405:
	add	%v0, %zero, %v1
bgti_cont.37406:
	j	bgti_cont.37394
bgti_else.37403:
	add	%v0, %zero, %v1
bgti_cont.37404:
	j	bgti_cont.37394
bgti_else.37401:
	add	%v0, %zero, %v1
bgti_cont.37402:
	j	bgti_cont.37394
bgti_else.37399:
	add	%v0, %zero, %v1
bgti_cont.37400:
	j	bgti_cont.37394
bgti_else.37397:
	add	%v0, %zero, %v1
bgti_cont.37398:
	j	bgti_cont.37394
bgti_else.37395:
	add	%v0, %zero, %v1
bgti_cont.37396:
	j	bgti_cont.37394
bgti_else.37393:
	add	%v0, %zero, %v1
bgti_cont.37394:
	lw	%v1, 17(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37417
	addi	%v0, %v0, 48
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_print_char
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgt_cont.37418
bgt_else.37417:
	sw	%v0, 18(%sp)
	blti	%v1, 10, bgti_else.37419
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.37421
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37423
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37425
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub1.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgti_cont.37420
bgti_else.37425:
	addi	%v0, %zero, 3
bgti_cont.37426:
	j	bgti_cont.37420
bgti_else.37423:
	addi	%v0, %zero, 2
bgti_cont.37424:
	j	bgti_cont.37420
bgti_else.37421:
	addi	%v0, %zero, 1
bgti_cont.37422:
	j	bgti_cont.37420
bgti_else.37419:
	addi	%v0, %zero, 0
bgti_cont.37420:
	lw	%v1, 17(%sp)
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.37427
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37429
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37431
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37433
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37435
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37437
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37439
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37441
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37443
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37445
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37447
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37449
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub2.2632
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.37428
bgti_else.37449:
	add	%v0, %zero, %v1
bgti_cont.37450:
	j	bgti_cont.37428
bgti_else.37447:
	add	%v0, %zero, %v1
bgti_cont.37448:
	j	bgti_cont.37428
bgti_else.37445:
	add	%v0, %zero, %v1
bgti_cont.37446:
	j	bgti_cont.37428
bgti_else.37443:
	add	%v0, %zero, %v1
bgti_cont.37444:
	j	bgti_cont.37428
bgti_else.37441:
	add	%v0, %zero, %v1
bgti_cont.37442:
	j	bgti_cont.37428
bgti_else.37439:
	add	%v0, %zero, %v1
bgti_cont.37440:
	j	bgti_cont.37428
bgti_else.37437:
	add	%v0, %zero, %v1
bgti_cont.37438:
	j	bgti_cont.37428
bgti_else.37435:
	add	%v0, %zero, %v1
bgti_cont.37436:
	j	bgti_cont.37428
bgti_else.37433:
	add	%v0, %zero, %v1
bgti_cont.37434:
	j	bgti_cont.37428
bgti_else.37431:
	add	%v0, %zero, %v1
bgti_cont.37432:
	j	bgti_cont.37428
bgti_else.37429:
	add	%v0, %zero, %v1
bgti_cont.37430:
	j	bgti_cont.37428
bgti_else.37427:
	add	%v0, %zero, %v1
bgti_cont.37428:
	lw	%v1, 19(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37451
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_print_char
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	lw	%v0, 18(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_print_char
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgt_cont.37452
bgt_else.37451:
	sw	%v0, 20(%sp)
	blti	%v1, 10, bgti_else.37453
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37455
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37457
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37459
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37461
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37463
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37465
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37467
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37469
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37471
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37473
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37475
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	print_int_sub2.2632
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bgti_cont.37454
bgti_else.37475:
	add	%v0, %zero, %v1
bgti_cont.37476:
	j	bgti_cont.37454
bgti_else.37473:
	add	%v0, %zero, %v1
bgti_cont.37474:
	j	bgti_cont.37454
bgti_else.37471:
	add	%v0, %zero, %v1
bgti_cont.37472:
	j	bgti_cont.37454
bgti_else.37469:
	add	%v0, %zero, %v1
bgti_cont.37470:
	j	bgti_cont.37454
bgti_else.37467:
	add	%v0, %zero, %v1
bgti_cont.37468:
	j	bgti_cont.37454
bgti_else.37465:
	add	%v0, %zero, %v1
bgti_cont.37466:
	j	bgti_cont.37454
bgti_else.37463:
	add	%v0, %zero, %v1
bgti_cont.37464:
	j	bgti_cont.37454
bgti_else.37461:
	add	%v0, %zero, %v1
bgti_cont.37462:
	j	bgti_cont.37454
bgti_else.37459:
	add	%v0, %zero, %v1
bgti_cont.37460:
	j	bgti_cont.37454
bgti_else.37457:
	add	%v0, %zero, %v1
bgti_cont.37458:
	j	bgti_cont.37454
bgti_else.37455:
	add	%v0, %zero, %v1
bgti_cont.37456:
	j	bgti_cont.37454
bgti_else.37453:
	add	%v0, %zero, %v1
bgti_cont.37454:
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_print_char
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v0, 20(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_print_char
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v0, 18(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_print_char
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
bgt_cont.37452:
bgt_cont.37418:
	addi	%v0, %zero, 32
	sw	%v0, 21(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.37477
	blti	%v0, 0, bgti_else.37479
	j	bgt_cont.37478
bgti_else.37479:
	addi	%v0, %zero, 0
bgti_cont.37480:
	j	bgt_cont.37478
bgt_else.37477:
	addi	%v0, %zero, 255
bgt_cont.37478:
	sw	%v0, 22(%sp)
	blti	%v0, 10, bgti_else.37481
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.37483
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37485
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37487
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub1.2629
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.37482
bgti_else.37487:
	addi	%v0, %zero, 3
bgti_cont.37488:
	j	bgti_cont.37482
bgti_else.37485:
	addi	%v0, %zero, 2
bgti_cont.37486:
	j	bgti_cont.37482
bgti_else.37483:
	addi	%v0, %zero, 1
bgti_cont.37484:
	j	bgti_cont.37482
bgti_else.37481:
	addi	%v0, %zero, 0
bgti_cont.37482:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	blti	%v1, 10, bgti_else.37489
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37491
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37493
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37495
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37497
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37499
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37501
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37503
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37505
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37507
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37509
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37511
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub2.2632
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgti_cont.37490
bgti_else.37511:
	add	%v0, %zero, %v1
bgti_cont.37512:
	j	bgti_cont.37490
bgti_else.37509:
	add	%v0, %zero, %v1
bgti_cont.37510:
	j	bgti_cont.37490
bgti_else.37507:
	add	%v0, %zero, %v1
bgti_cont.37508:
	j	bgti_cont.37490
bgti_else.37505:
	add	%v0, %zero, %v1
bgti_cont.37506:
	j	bgti_cont.37490
bgti_else.37503:
	add	%v0, %zero, %v1
bgti_cont.37504:
	j	bgti_cont.37490
bgti_else.37501:
	add	%v0, %zero, %v1
bgti_cont.37502:
	j	bgti_cont.37490
bgti_else.37499:
	add	%v0, %zero, %v1
bgti_cont.37500:
	j	bgti_cont.37490
bgti_else.37497:
	add	%v0, %zero, %v1
bgti_cont.37498:
	j	bgti_cont.37490
bgti_else.37495:
	add	%v0, %zero, %v1
bgti_cont.37496:
	j	bgti_cont.37490
bgti_else.37493:
	add	%v0, %zero, %v1
bgti_cont.37494:
	j	bgti_cont.37490
bgti_else.37491:
	add	%v0, %zero, %v1
bgti_cont.37492:
	j	bgti_cont.37490
bgti_else.37489:
	add	%v0, %zero, %v1
bgti_cont.37490:
	lw	%v1, 23(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37513
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_print_char
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgt_cont.37514
bgt_else.37513:
	sw	%v0, 24(%sp)
	blti	%v1, 10, bgti_else.37515
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.37517
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37519
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37521
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub1.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgti_cont.37516
bgti_else.37521:
	addi	%v0, %zero, 3
bgti_cont.37522:
	j	bgti_cont.37516
bgti_else.37519:
	addi	%v0, %zero, 2
bgti_cont.37520:
	j	bgti_cont.37516
bgti_else.37517:
	addi	%v0, %zero, 1
bgti_cont.37518:
	j	bgti_cont.37516
bgti_else.37515:
	addi	%v0, %zero, 0
bgti_cont.37516:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	blti	%v1, 10, bgti_else.37523
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37525
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37527
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37529
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37531
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37533
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37535
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37537
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37539
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37541
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37543
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37545
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	print_int_sub2.2632
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.37524
bgti_else.37545:
	add	%v0, %zero, %v1
bgti_cont.37546:
	j	bgti_cont.37524
bgti_else.37543:
	add	%v0, %zero, %v1
bgti_cont.37544:
	j	bgti_cont.37524
bgti_else.37541:
	add	%v0, %zero, %v1
bgti_cont.37542:
	j	bgti_cont.37524
bgti_else.37539:
	add	%v0, %zero, %v1
bgti_cont.37540:
	j	bgti_cont.37524
bgti_else.37537:
	add	%v0, %zero, %v1
bgti_cont.37538:
	j	bgti_cont.37524
bgti_else.37535:
	add	%v0, %zero, %v1
bgti_cont.37536:
	j	bgti_cont.37524
bgti_else.37533:
	add	%v0, %zero, %v1
bgti_cont.37534:
	j	bgti_cont.37524
bgti_else.37531:
	add	%v0, %zero, %v1
bgti_cont.37532:
	j	bgti_cont.37524
bgti_else.37529:
	add	%v0, %zero, %v1
bgti_cont.37530:
	j	bgti_cont.37524
bgti_else.37527:
	add	%v0, %zero, %v1
bgti_cont.37528:
	j	bgti_cont.37524
bgti_else.37525:
	add	%v0, %zero, %v1
bgti_cont.37526:
	j	bgti_cont.37524
bgti_else.37523:
	add	%v0, %zero, %v1
bgti_cont.37524:
	lw	%v1, 25(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37547
	addi	%v0, %v0, 48
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_print_char
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 24(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_print_char
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgt_cont.37548
bgt_else.37547:
	sw	%v0, 26(%sp)
	blti	%v1, 10, bgti_else.37549
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37551
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37553
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37555
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37557
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37559
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37561
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37563
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37565
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37567
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37569
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37571
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2632
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.37550
bgti_else.37571:
	add	%v0, %zero, %v1
bgti_cont.37572:
	j	bgti_cont.37550
bgti_else.37569:
	add	%v0, %zero, %v1
bgti_cont.37570:
	j	bgti_cont.37550
bgti_else.37567:
	add	%v0, %zero, %v1
bgti_cont.37568:
	j	bgti_cont.37550
bgti_else.37565:
	add	%v0, %zero, %v1
bgti_cont.37566:
	j	bgti_cont.37550
bgti_else.37563:
	add	%v0, %zero, %v1
bgti_cont.37564:
	j	bgti_cont.37550
bgti_else.37561:
	add	%v0, %zero, %v1
bgti_cont.37562:
	j	bgti_cont.37550
bgti_else.37559:
	add	%v0, %zero, %v1
bgti_cont.37560:
	j	bgti_cont.37550
bgti_else.37557:
	add	%v0, %zero, %v1
bgti_cont.37558:
	j	bgti_cont.37550
bgti_else.37555:
	add	%v0, %zero, %v1
bgti_cont.37556:
	j	bgti_cont.37550
bgti_else.37553:
	add	%v0, %zero, %v1
bgti_cont.37554:
	j	bgti_cont.37550
bgti_else.37551:
	add	%v0, %zero, %v1
bgti_cont.37552:
	j	bgti_cont.37550
bgti_else.37549:
	add	%v0, %zero, %v1
bgti_cont.37550:
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v0, 26(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v0, 24(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
bgt_cont.37548:
bgt_cont.37514:
	lw	%v0, 21(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.37573
	blti	%v0, 0, bgti_else.37575
	j	bgt_cont.37574
bgti_else.37575:
	addi	%v0, %zero, 0
bgti_cont.37576:
	j	bgt_cont.37574
bgt_else.37573:
	addi	%v0, %zero, 255
bgt_cont.37574:
	sw	%v0, 27(%sp)
	blti	%v0, 10, bgti_else.37577
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.37579
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37581
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37583
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	print_int_sub1.2629
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	bgti_cont.37578
bgti_else.37583:
	addi	%v0, %zero, 3
bgti_cont.37584:
	j	bgti_cont.37578
bgti_else.37581:
	addi	%v0, %zero, 2
bgti_cont.37582:
	j	bgti_cont.37578
bgti_else.37579:
	addi	%v0, %zero, 1
bgti_cont.37580:
	j	bgti_cont.37578
bgti_else.37577:
	addi	%v0, %zero, 0
bgti_cont.37578:
	lw	%v1, 27(%sp)
	sw	%v0, 28(%sp)
	blti	%v1, 10, bgti_else.37585
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37587
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37589
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37591
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37593
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37595
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37597
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37599
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37601
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37603
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37605
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37607
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int_sub2.2632
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bgti_cont.37586
bgti_else.37607:
	add	%v0, %zero, %v1
bgti_cont.37608:
	j	bgti_cont.37586
bgti_else.37605:
	add	%v0, %zero, %v1
bgti_cont.37606:
	j	bgti_cont.37586
bgti_else.37603:
	add	%v0, %zero, %v1
bgti_cont.37604:
	j	bgti_cont.37586
bgti_else.37601:
	add	%v0, %zero, %v1
bgti_cont.37602:
	j	bgti_cont.37586
bgti_else.37599:
	add	%v0, %zero, %v1
bgti_cont.37600:
	j	bgti_cont.37586
bgti_else.37597:
	add	%v0, %zero, %v1
bgti_cont.37598:
	j	bgti_cont.37586
bgti_else.37595:
	add	%v0, %zero, %v1
bgti_cont.37596:
	j	bgti_cont.37586
bgti_else.37593:
	add	%v0, %zero, %v1
bgti_cont.37594:
	j	bgti_cont.37586
bgti_else.37591:
	add	%v0, %zero, %v1
bgti_cont.37592:
	j	bgti_cont.37586
bgti_else.37589:
	add	%v0, %zero, %v1
bgti_cont.37590:
	j	bgti_cont.37586
bgti_else.37587:
	add	%v0, %zero, %v1
bgti_cont.37588:
	j	bgti_cont.37586
bgti_else.37585:
	add	%v0, %zero, %v1
bgti_cont.37586:
	lw	%v1, 28(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37609
	addi	%v0, %v0, 48
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bgt_cont.37610
bgt_else.37609:
	sw	%v0, 29(%sp)
	blti	%v1, 10, bgti_else.37611
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.37613
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37615
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37617
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	print_int_sub1.2629
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	bgti_cont.37612
bgti_else.37617:
	addi	%v0, %zero, 3
bgti_cont.37618:
	j	bgti_cont.37612
bgti_else.37615:
	addi	%v0, %zero, 2
bgti_cont.37616:
	j	bgti_cont.37612
bgti_else.37613:
	addi	%v0, %zero, 1
bgti_cont.37614:
	j	bgti_cont.37612
bgti_else.37611:
	addi	%v0, %zero, 0
bgti_cont.37612:
	lw	%v1, 28(%sp)
	sw	%v0, 30(%sp)
	blti	%v1, 10, bgti_else.37619
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37621
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37623
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37625
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37627
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37629
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37631
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37633
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37635
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37637
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37639
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37641
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	print_int_sub2.2632
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	bgti_cont.37620
bgti_else.37641:
	add	%v0, %zero, %v1
bgti_cont.37642:
	j	bgti_cont.37620
bgti_else.37639:
	add	%v0, %zero, %v1
bgti_cont.37640:
	j	bgti_cont.37620
bgti_else.37637:
	add	%v0, %zero, %v1
bgti_cont.37638:
	j	bgti_cont.37620
bgti_else.37635:
	add	%v0, %zero, %v1
bgti_cont.37636:
	j	bgti_cont.37620
bgti_else.37633:
	add	%v0, %zero, %v1
bgti_cont.37634:
	j	bgti_cont.37620
bgti_else.37631:
	add	%v0, %zero, %v1
bgti_cont.37632:
	j	bgti_cont.37620
bgti_else.37629:
	add	%v0, %zero, %v1
bgti_cont.37630:
	j	bgti_cont.37620
bgti_else.37627:
	add	%v0, %zero, %v1
bgti_cont.37628:
	j	bgti_cont.37620
bgti_else.37625:
	add	%v0, %zero, %v1
bgti_cont.37626:
	j	bgti_cont.37620
bgti_else.37623:
	add	%v0, %zero, %v1
bgti_cont.37624:
	j	bgti_cont.37620
bgti_else.37621:
	add	%v0, %zero, %v1
bgti_cont.37622:
	j	bgti_cont.37620
bgti_else.37619:
	add	%v0, %zero, %v1
bgti_cont.37620:
	lw	%v1, 30(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37643
	addi	%v0, %v0, 48
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_print_char
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v0, 29(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_print_char
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	bgt_cont.37644
bgt_else.37643:
	sw	%v0, 31(%sp)
	blti	%v1, 10, bgti_else.37645
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37647
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37649
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37651
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37653
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37655
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37657
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37659
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37661
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37663
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37665
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37667
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	print_int_sub2.2632
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	j	bgti_cont.37646
bgti_else.37667:
	add	%v0, %zero, %v1
bgti_cont.37668:
	j	bgti_cont.37646
bgti_else.37665:
	add	%v0, %zero, %v1
bgti_cont.37666:
	j	bgti_cont.37646
bgti_else.37663:
	add	%v0, %zero, %v1
bgti_cont.37664:
	j	bgti_cont.37646
bgti_else.37661:
	add	%v0, %zero, %v1
bgti_cont.37662:
	j	bgti_cont.37646
bgti_else.37659:
	add	%v0, %zero, %v1
bgti_cont.37660:
	j	bgti_cont.37646
bgti_else.37657:
	add	%v0, %zero, %v1
bgti_cont.37658:
	j	bgti_cont.37646
bgti_else.37655:
	add	%v0, %zero, %v1
bgti_cont.37656:
	j	bgti_cont.37646
bgti_else.37653:
	add	%v0, %zero, %v1
bgti_cont.37654:
	j	bgti_cont.37646
bgti_else.37651:
	add	%v0, %zero, %v1
bgti_cont.37652:
	j	bgti_cont.37646
bgti_else.37649:
	add	%v0, %zero, %v1
bgti_cont.37650:
	j	bgti_cont.37646
bgti_else.37647:
	add	%v0, %zero, %v1
bgti_cont.37648:
	j	bgti_cont.37646
bgti_else.37645:
	add	%v0, %zero, %v1
bgti_cont.37646:
	addi	%v0, %v0, 48
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_print_char
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v0, 31(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_print_char
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v0, 29(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_print_char
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
bgt_cont.37644:
bgt_cont.37610:
	lw	%v0, 15(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_print_char
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 7(%sp)
	blt	%v0, %v1, bgt_else.37669
	jr	%ra
bgt_else.37669:
	lw	%a1, 6(%sp)
	add	%at, %a1, %v0
	lw	%a0, 0(%at)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 153(%zero)
	lw	%a2, 4(%sp)
	lw	%a3, 5(%sp)
	blt	%a2, %a3, bgt_else.37671
	addi	%v1, %zero, 0
	j	bgt_cont.37672
bgt_else.37671:
	lw	%a2, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.37673
	addi	%v1, %zero, 0
	j	bgt_cont.37674
bgt_else.37673:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.37675
	addi	%v1, %zero, 0
	j	bgt_cont.37676
bgt_else.37675:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.37677
	addi	%v1, %zero, 0
	j	bgt_cont.37678
bgt_else.37677:
	addi	%v1, %zero, 1
bgt_cont.37678:
bgt_cont.37676:
bgt_cont.37674:
bgt_cont.37672:
	sw	%v0, 32(%sp)
	beqi	%v1, 0, bnei_else.37679
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 2(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	j	bnei_cont.37680
bnei_else.37679:
	lw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
bnei_cont.37680:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.37681
	blti	%v0, 0, bgti_else.37683
	j	bgt_cont.37682
bgti_else.37683:
	addi	%v0, %zero, 0
bgti_cont.37684:
	j	bgt_cont.37682
bgt_else.37681:
	addi	%v0, %zero, 255
bgt_cont.37682:
	sw	%v0, 33(%sp)
	blti	%v0, 10, bgti_else.37685
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.37687
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37689
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	print_int_sub1.2629
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	bgti_cont.37686
bgti_else.37689:
	addi	%v0, %zero, 2
bgti_cont.37690:
	j	bgti_cont.37686
bgti_else.37687:
	addi	%v0, %zero, 1
bgti_cont.37688:
	j	bgti_cont.37686
bgti_else.37685:
	addi	%v0, %zero, 0
bgti_cont.37686:
	lw	%v1, 33(%sp)
	sw	%v0, 34(%sp)
	blti	%v1, 10, bgti_else.37691
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37693
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37695
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37697
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37699
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37701
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37703
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37705
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37707
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37709
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37711
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	print_int_sub2.2632
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	bgti_cont.37692
bgti_else.37711:
	add	%v0, %zero, %v1
bgti_cont.37712:
	j	bgti_cont.37692
bgti_else.37709:
	add	%v0, %zero, %v1
bgti_cont.37710:
	j	bgti_cont.37692
bgti_else.37707:
	add	%v0, %zero, %v1
bgti_cont.37708:
	j	bgti_cont.37692
bgti_else.37705:
	add	%v0, %zero, %v1
bgti_cont.37706:
	j	bgti_cont.37692
bgti_else.37703:
	add	%v0, %zero, %v1
bgti_cont.37704:
	j	bgti_cont.37692
bgti_else.37701:
	add	%v0, %zero, %v1
bgti_cont.37702:
	j	bgti_cont.37692
bgti_else.37699:
	add	%v0, %zero, %v1
bgti_cont.37700:
	j	bgti_cont.37692
bgti_else.37697:
	add	%v0, %zero, %v1
bgti_cont.37698:
	j	bgti_cont.37692
bgti_else.37695:
	add	%v0, %zero, %v1
bgti_cont.37696:
	j	bgti_cont.37692
bgti_else.37693:
	add	%v0, %zero, %v1
bgti_cont.37694:
	j	bgti_cont.37692
bgti_else.37691:
	add	%v0, %zero, %v1
bgti_cont.37692:
	lw	%v1, 34(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37713
	addi	%v0, %v0, 48
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	min_caml_print_char
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	bgt_cont.37714
bgt_else.37713:
	sw	%v0, 35(%sp)
	blti	%v1, 10, bgti_else.37715
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.37717
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37719
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	print_int_sub1.2629
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	j	bgti_cont.37716
bgti_else.37719:
	addi	%v0, %zero, 2
bgti_cont.37720:
	j	bgti_cont.37716
bgti_else.37717:
	addi	%v0, %zero, 1
bgti_cont.37718:
	j	bgti_cont.37716
bgti_else.37715:
	addi	%v0, %zero, 0
bgti_cont.37716:
	lw	%v1, 34(%sp)
	sw	%v0, 36(%sp)
	blti	%v1, 10, bgti_else.37721
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37723
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37725
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37727
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37729
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37731
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37733
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37735
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37737
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37739
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37741
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	print_int_sub2.2632
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	bgti_cont.37722
bgti_else.37741:
	add	%v0, %zero, %v1
bgti_cont.37742:
	j	bgti_cont.37722
bgti_else.37739:
	add	%v0, %zero, %v1
bgti_cont.37740:
	j	bgti_cont.37722
bgti_else.37737:
	add	%v0, %zero, %v1
bgti_cont.37738:
	j	bgti_cont.37722
bgti_else.37735:
	add	%v0, %zero, %v1
bgti_cont.37736:
	j	bgti_cont.37722
bgti_else.37733:
	add	%v0, %zero, %v1
bgti_cont.37734:
	j	bgti_cont.37722
bgti_else.37731:
	add	%v0, %zero, %v1
bgti_cont.37732:
	j	bgti_cont.37722
bgti_else.37729:
	add	%v0, %zero, %v1
bgti_cont.37730:
	j	bgti_cont.37722
bgti_else.37727:
	add	%v0, %zero, %v1
bgti_cont.37728:
	j	bgti_cont.37722
bgti_else.37725:
	add	%v0, %zero, %v1
bgti_cont.37726:
	j	bgti_cont.37722
bgti_else.37723:
	add	%v0, %zero, %v1
bgti_cont.37724:
	j	bgti_cont.37722
bgti_else.37721:
	add	%v0, %zero, %v1
bgti_cont.37722:
	lw	%v1, 36(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37743
	addi	%v0, %v0, 48
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_print_char
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	lw	%v0, 35(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_print_char
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	bgt_cont.37744
bgt_else.37743:
	sw	%v0, 37(%sp)
	blti	%v1, 10, bgti_else.37745
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37747
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37749
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37751
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37753
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37755
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37757
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37759
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37761
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37763
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37765
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	print_int_sub2.2632
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	j	bgti_cont.37746
bgti_else.37765:
	add	%v0, %zero, %v1
bgti_cont.37766:
	j	bgti_cont.37746
bgti_else.37763:
	add	%v0, %zero, %v1
bgti_cont.37764:
	j	bgti_cont.37746
bgti_else.37761:
	add	%v0, %zero, %v1
bgti_cont.37762:
	j	bgti_cont.37746
bgti_else.37759:
	add	%v0, %zero, %v1
bgti_cont.37760:
	j	bgti_cont.37746
bgti_else.37757:
	add	%v0, %zero, %v1
bgti_cont.37758:
	j	bgti_cont.37746
bgti_else.37755:
	add	%v0, %zero, %v1
bgti_cont.37756:
	j	bgti_cont.37746
bgti_else.37753:
	add	%v0, %zero, %v1
bgti_cont.37754:
	j	bgti_cont.37746
bgti_else.37751:
	add	%v0, %zero, %v1
bgti_cont.37752:
	j	bgti_cont.37746
bgti_else.37749:
	add	%v0, %zero, %v1
bgti_cont.37750:
	j	bgti_cont.37746
bgti_else.37747:
	add	%v0, %zero, %v1
bgti_cont.37748:
	j	bgti_cont.37746
bgti_else.37745:
	add	%v0, %zero, %v1
bgti_cont.37746:
	addi	%v0, %v0, 48
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_print_char
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	lw	%v0, 37(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_print_char
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	lw	%v0, 35(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_print_char
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
bgt_cont.37744:
bgt_cont.37714:
	lw	%v0, 21(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_print_char
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.37767
	blti	%v0, 0, bgti_else.37769
	j	bgt_cont.37768
bgti_else.37769:
	addi	%v0, %zero, 0
bgti_cont.37770:
	j	bgt_cont.37768
bgt_else.37767:
	addi	%v0, %zero, 255
bgt_cont.37768:
	sw	%v0, 38(%sp)
	blti	%v0, 10, bgti_else.37771
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.37773
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37775
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	print_int_sub1.2629
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	j	bgti_cont.37772
bgti_else.37775:
	addi	%v0, %zero, 2
bgti_cont.37776:
	j	bgti_cont.37772
bgti_else.37773:
	addi	%v0, %zero, 1
bgti_cont.37774:
	j	bgti_cont.37772
bgti_else.37771:
	addi	%v0, %zero, 0
bgti_cont.37772:
	lw	%v1, 38(%sp)
	sw	%v0, 39(%sp)
	blti	%v1, 10, bgti_else.37777
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37779
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37781
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37783
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37785
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37787
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37789
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37791
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37793
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37795
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37797
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	print_int_sub2.2632
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	bgti_cont.37778
bgti_else.37797:
	add	%v0, %zero, %v1
bgti_cont.37798:
	j	bgti_cont.37778
bgti_else.37795:
	add	%v0, %zero, %v1
bgti_cont.37796:
	j	bgti_cont.37778
bgti_else.37793:
	add	%v0, %zero, %v1
bgti_cont.37794:
	j	bgti_cont.37778
bgti_else.37791:
	add	%v0, %zero, %v1
bgti_cont.37792:
	j	bgti_cont.37778
bgti_else.37789:
	add	%v0, %zero, %v1
bgti_cont.37790:
	j	bgti_cont.37778
bgti_else.37787:
	add	%v0, %zero, %v1
bgti_cont.37788:
	j	bgti_cont.37778
bgti_else.37785:
	add	%v0, %zero, %v1
bgti_cont.37786:
	j	bgti_cont.37778
bgti_else.37783:
	add	%v0, %zero, %v1
bgti_cont.37784:
	j	bgti_cont.37778
bgti_else.37781:
	add	%v0, %zero, %v1
bgti_cont.37782:
	j	bgti_cont.37778
bgti_else.37779:
	add	%v0, %zero, %v1
bgti_cont.37780:
	j	bgti_cont.37778
bgti_else.37777:
	add	%v0, %zero, %v1
bgti_cont.37778:
	lw	%v1, 39(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37799
	addi	%v0, %v0, 48
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_print_char
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	bgt_cont.37800
bgt_else.37799:
	sw	%v0, 40(%sp)
	blti	%v1, 10, bgti_else.37801
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.37803
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37805
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	print_int_sub1.2629
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	j	bgti_cont.37802
bgti_else.37805:
	addi	%v0, %zero, 2
bgti_cont.37806:
	j	bgti_cont.37802
bgti_else.37803:
	addi	%v0, %zero, 1
bgti_cont.37804:
	j	bgti_cont.37802
bgti_else.37801:
	addi	%v0, %zero, 0
bgti_cont.37802:
	lw	%v1, 39(%sp)
	sw	%v0, 41(%sp)
	blti	%v1, 10, bgti_else.37807
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37809
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37811
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37813
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37815
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37817
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37819
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37821
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37823
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37825
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37827
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	print_int_sub2.2632
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	bgti_cont.37808
bgti_else.37827:
	add	%v0, %zero, %v1
bgti_cont.37828:
	j	bgti_cont.37808
bgti_else.37825:
	add	%v0, %zero, %v1
bgti_cont.37826:
	j	bgti_cont.37808
bgti_else.37823:
	add	%v0, %zero, %v1
bgti_cont.37824:
	j	bgti_cont.37808
bgti_else.37821:
	add	%v0, %zero, %v1
bgti_cont.37822:
	j	bgti_cont.37808
bgti_else.37819:
	add	%v0, %zero, %v1
bgti_cont.37820:
	j	bgti_cont.37808
bgti_else.37817:
	add	%v0, %zero, %v1
bgti_cont.37818:
	j	bgti_cont.37808
bgti_else.37815:
	add	%v0, %zero, %v1
bgti_cont.37816:
	j	bgti_cont.37808
bgti_else.37813:
	add	%v0, %zero, %v1
bgti_cont.37814:
	j	bgti_cont.37808
bgti_else.37811:
	add	%v0, %zero, %v1
bgti_cont.37812:
	j	bgti_cont.37808
bgti_else.37809:
	add	%v0, %zero, %v1
bgti_cont.37810:
	j	bgti_cont.37808
bgti_else.37807:
	add	%v0, %zero, %v1
bgti_cont.37808:
	lw	%v1, 41(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37829
	addi	%v0, %v0, 48
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_print_char
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v0, 40(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_print_char
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	bgt_cont.37830
bgt_else.37829:
	sw	%v0, 42(%sp)
	blti	%v1, 10, bgti_else.37831
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37833
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37835
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37837
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37839
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37841
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37843
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37845
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37847
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37849
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37851
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	print_int_sub2.2632
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	j	bgti_cont.37832
bgti_else.37851:
	add	%v0, %zero, %v1
bgti_cont.37852:
	j	bgti_cont.37832
bgti_else.37849:
	add	%v0, %zero, %v1
bgti_cont.37850:
	j	bgti_cont.37832
bgti_else.37847:
	add	%v0, %zero, %v1
bgti_cont.37848:
	j	bgti_cont.37832
bgti_else.37845:
	add	%v0, %zero, %v1
bgti_cont.37846:
	j	bgti_cont.37832
bgti_else.37843:
	add	%v0, %zero, %v1
bgti_cont.37844:
	j	bgti_cont.37832
bgti_else.37841:
	add	%v0, %zero, %v1
bgti_cont.37842:
	j	bgti_cont.37832
bgti_else.37839:
	add	%v0, %zero, %v1
bgti_cont.37840:
	j	bgti_cont.37832
bgti_else.37837:
	add	%v0, %zero, %v1
bgti_cont.37838:
	j	bgti_cont.37832
bgti_else.37835:
	add	%v0, %zero, %v1
bgti_cont.37836:
	j	bgti_cont.37832
bgti_else.37833:
	add	%v0, %zero, %v1
bgti_cont.37834:
	j	bgti_cont.37832
bgti_else.37831:
	add	%v0, %zero, %v1
bgti_cont.37832:
	addi	%v0, %v0, 48
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_print_char
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v0, 42(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_print_char
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v0, 40(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_print_char
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
bgt_cont.37830:
bgt_cont.37800:
	lw	%v0, 21(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_print_char
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.37853
	blti	%v0, 0, bgti_else.37855
	j	bgt_cont.37854
bgti_else.37855:
	addi	%v0, %zero, 0
bgti_cont.37856:
	j	bgt_cont.37854
bgt_else.37853:
	addi	%v0, %zero, 255
bgt_cont.37854:
	sw	%v0, 43(%sp)
	blti	%v0, 10, bgti_else.37857
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.37859
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37861
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	print_int_sub1.2629
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	j	bgti_cont.37858
bgti_else.37861:
	addi	%v0, %zero, 2
bgti_cont.37862:
	j	bgti_cont.37858
bgti_else.37859:
	addi	%v0, %zero, 1
bgti_cont.37860:
	j	bgti_cont.37858
bgti_else.37857:
	addi	%v0, %zero, 0
bgti_cont.37858:
	lw	%v1, 43(%sp)
	sw	%v0, 44(%sp)
	blti	%v1, 10, bgti_else.37863
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37865
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37867
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37869
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37871
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37873
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37875
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37877
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37879
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37881
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37883
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	print_int_sub2.2632
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	j	bgti_cont.37864
bgti_else.37883:
	add	%v0, %zero, %v1
bgti_cont.37884:
	j	bgti_cont.37864
bgti_else.37881:
	add	%v0, %zero, %v1
bgti_cont.37882:
	j	bgti_cont.37864
bgti_else.37879:
	add	%v0, %zero, %v1
bgti_cont.37880:
	j	bgti_cont.37864
bgti_else.37877:
	add	%v0, %zero, %v1
bgti_cont.37878:
	j	bgti_cont.37864
bgti_else.37875:
	add	%v0, %zero, %v1
bgti_cont.37876:
	j	bgti_cont.37864
bgti_else.37873:
	add	%v0, %zero, %v1
bgti_cont.37874:
	j	bgti_cont.37864
bgti_else.37871:
	add	%v0, %zero, %v1
bgti_cont.37872:
	j	bgti_cont.37864
bgti_else.37869:
	add	%v0, %zero, %v1
bgti_cont.37870:
	j	bgti_cont.37864
bgti_else.37867:
	add	%v0, %zero, %v1
bgti_cont.37868:
	j	bgti_cont.37864
bgti_else.37865:
	add	%v0, %zero, %v1
bgti_cont.37866:
	j	bgti_cont.37864
bgti_else.37863:
	add	%v0, %zero, %v1
bgti_cont.37864:
	lw	%v1, 44(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37885
	addi	%v0, %v0, 48
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_print_char
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	j	bgt_cont.37886
bgt_else.37885:
	sw	%v0, 45(%sp)
	blti	%v1, 10, bgti_else.37887
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.37889
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.37891
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	print_int_sub1.2629
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	bgti_cont.37888
bgti_else.37891:
	addi	%v0, %zero, 2
bgti_cont.37892:
	j	bgti_cont.37888
bgti_else.37889:
	addi	%v0, %zero, 1
bgti_cont.37890:
	j	bgti_cont.37888
bgti_else.37887:
	addi	%v0, %zero, 0
bgti_cont.37888:
	lw	%v1, 44(%sp)
	sw	%v0, 46(%sp)
	blti	%v1, 10, bgti_else.37893
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37895
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37897
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37899
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37901
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37903
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37905
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37907
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37909
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37911
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37913
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	print_int_sub2.2632
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	j	bgti_cont.37894
bgti_else.37913:
	add	%v0, %zero, %v1
bgti_cont.37914:
	j	bgti_cont.37894
bgti_else.37911:
	add	%v0, %zero, %v1
bgti_cont.37912:
	j	bgti_cont.37894
bgti_else.37909:
	add	%v0, %zero, %v1
bgti_cont.37910:
	j	bgti_cont.37894
bgti_else.37907:
	add	%v0, %zero, %v1
bgti_cont.37908:
	j	bgti_cont.37894
bgti_else.37905:
	add	%v0, %zero, %v1
bgti_cont.37906:
	j	bgti_cont.37894
bgti_else.37903:
	add	%v0, %zero, %v1
bgti_cont.37904:
	j	bgti_cont.37894
bgti_else.37901:
	add	%v0, %zero, %v1
bgti_cont.37902:
	j	bgti_cont.37894
bgti_else.37899:
	add	%v0, %zero, %v1
bgti_cont.37900:
	j	bgti_cont.37894
bgti_else.37897:
	add	%v0, %zero, %v1
bgti_cont.37898:
	j	bgti_cont.37894
bgti_else.37895:
	add	%v0, %zero, %v1
bgti_cont.37896:
	j	bgti_cont.37894
bgti_else.37893:
	add	%v0, %zero, %v1
bgti_cont.37894:
	lw	%v1, 46(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.37915
	addi	%v0, %v0, 48
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v0, 45(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_print_char
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	j	bgt_cont.37916
bgt_else.37915:
	sw	%v0, 47(%sp)
	blti	%v1, 10, bgti_else.37917
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37919
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37921
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37923
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37925
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37927
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37929
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37931
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37933
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37935
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.37937
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	print_int_sub2.2632
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	bgti_cont.37918
bgti_else.37937:
	add	%v0, %zero, %v1
bgti_cont.37938:
	j	bgti_cont.37918
bgti_else.37935:
	add	%v0, %zero, %v1
bgti_cont.37936:
	j	bgti_cont.37918
bgti_else.37933:
	add	%v0, %zero, %v1
bgti_cont.37934:
	j	bgti_cont.37918
bgti_else.37931:
	add	%v0, %zero, %v1
bgti_cont.37932:
	j	bgti_cont.37918
bgti_else.37929:
	add	%v0, %zero, %v1
bgti_cont.37930:
	j	bgti_cont.37918
bgti_else.37927:
	add	%v0, %zero, %v1
bgti_cont.37928:
	j	bgti_cont.37918
bgti_else.37925:
	add	%v0, %zero, %v1
bgti_cont.37926:
	j	bgti_cont.37918
bgti_else.37923:
	add	%v0, %zero, %v1
bgti_cont.37924:
	j	bgti_cont.37918
bgti_else.37921:
	add	%v0, %zero, %v1
bgti_cont.37922:
	j	bgti_cont.37918
bgti_else.37919:
	add	%v0, %zero, %v1
bgti_cont.37920:
	j	bgti_cont.37918
bgti_else.37917:
	add	%v0, %zero, %v1
bgti_cont.37918:
	addi	%v0, %v0, 48
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_print_char
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	lw	%v0, 47(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_print_char
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	lw	%v0, 45(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_print_char
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
bgt_cont.37916:
bgt_cont.37886:
	lw	%v0, 15(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_print_char
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	lw	%v0, 32(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 6(%sp)
	lw	%a2, 0(%sp)
	j	scan_pixel.3045
scan_line.3051:
	addi	%a3, %zero, 1
	lw	%t0, 155(%zero)
	blt	%v0, %t0, bgt_else.38503
	jr	%ra
bgt_else.38503:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.38505
	j	bgt_cont.38506
bgt_else.38505:
	addi	%t2, %v0, 1
	flw	%f0, 158(%zero)
	lw	%t3, 157(%zero)
	sub	%t2, %t2, %t3
	itof	%f1, %t2
	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	fmul	%f1, %f0, %f1
	flw	%f2, 171(%zero)
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	fmul	%f2, %f0, %f2
	flw	%f3, 172(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 173(%zero)
	fadd	%f0, %f0, %f3
	lw	%t2, 154(%zero)
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
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bgt_cont.38506:
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.38507
	j	bgt_cont.38508
bgt_else.38507:
	lw	%a1, 7(%sp)
	lw	%a0, 0(%a1)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 153(%zero)
	lw	%a2, 6(%sp)
	addi	%a3, %a2, 1
	lw	%t0, 5(%sp)
	blt	%a3, %t0, bgt_else.38509
	addi	%a3, %zero, 0
	j	bgt_cont.38510
bgt_else.38509:
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.38511
	addi	%a3, %zero, 0
	j	bgt_cont.38512
bgt_else.38511:
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.38513
	addi	%a3, %zero, 0
	j	bgt_cont.38514
bgt_else.38513:
	addi	%a3, %zero, 0
bgt_cont.38514:
bgt_cont.38512:
bgt_cont.38510:
	beqi	%a3, 0, bnei_else.38515
	lw	%a0, 4(%sp)
	lw	%a3, 3(%sp)
	addi	%v0, %v1, 0
	addi	%k0, %a3, 0
	addi	%a3, %v1, 0
	addi	%v1, %a2, 0
	addi	%a2, %k0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.38516
bnei_else.38515:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.38516:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.38517
	blti	%v0, 0, bgti_else.38519
	j	bgt_cont.38518
bgti_else.38519:
	addi	%v0, %zero, 0
bgti_cont.38520:
	j	bgt_cont.38518
bgt_else.38517:
	addi	%v0, %zero, 255
bgt_cont.38518:
	addi	%v1, %zero, 10
	sw	%v1, 10(%sp)
	sw	%v0, 11(%sp)
	blti	%v0, 10, bgti_else.38521
	addi	%a0, %v0, -10
	blti	%a0, 10, bgti_else.38523
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.38525
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	print_int_sub1.2629
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.38522
bgti_else.38525:
	addi	%v0, %zero, 2
bgti_cont.38526:
	j	bgti_cont.38522
bgti_else.38523:
	addi	%v0, %zero, 1
bgti_cont.38524:
	j	bgti_cont.38522
bgti_else.38521:
	addi	%v0, %zero, 0
bgti_cont.38522:
	lw	%v1, 11(%sp)
	sw	%v0, 12(%sp)
	blti	%v1, 10, bgti_else.38527
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38529
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38531
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38533
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38535
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38537
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38539
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38541
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38543
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38545
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38547
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.38528
bgti_else.38547:
	add	%v0, %zero, %v1
bgti_cont.38548:
	j	bgti_cont.38528
bgti_else.38545:
	add	%v0, %zero, %v1
bgti_cont.38546:
	j	bgti_cont.38528
bgti_else.38543:
	add	%v0, %zero, %v1
bgti_cont.38544:
	j	bgti_cont.38528
bgti_else.38541:
	add	%v0, %zero, %v1
bgti_cont.38542:
	j	bgti_cont.38528
bgti_else.38539:
	add	%v0, %zero, %v1
bgti_cont.38540:
	j	bgti_cont.38528
bgti_else.38537:
	add	%v0, %zero, %v1
bgti_cont.38538:
	j	bgti_cont.38528
bgti_else.38535:
	add	%v0, %zero, %v1
bgti_cont.38536:
	j	bgti_cont.38528
bgti_else.38533:
	add	%v0, %zero, %v1
bgti_cont.38534:
	j	bgti_cont.38528
bgti_else.38531:
	add	%v0, %zero, %v1
bgti_cont.38532:
	j	bgti_cont.38528
bgti_else.38529:
	add	%v0, %zero, %v1
bgti_cont.38530:
	j	bgti_cont.38528
bgti_else.38527:
	add	%v0, %zero, %v1
bgti_cont.38528:
	lw	%v1, 12(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.38549
	addi	%v0, %v0, 48
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgt_cont.38550
bgt_else.38549:
	sw	%v0, 13(%sp)
	blti	%v1, 10, bgti_else.38551
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.38553
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.38555
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	print_int_sub1.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.38552
bgti_else.38555:
	addi	%v0, %zero, 2
bgti_cont.38556:
	j	bgti_cont.38552
bgti_else.38553:
	addi	%v0, %zero, 1
bgti_cont.38554:
	j	bgti_cont.38552
bgti_else.38551:
	addi	%v0, %zero, 0
bgti_cont.38552:
	lw	%v1, 12(%sp)
	sw	%v0, 14(%sp)
	blti	%v1, 10, bgti_else.38557
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38559
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38561
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38563
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38565
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38567
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38569
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38571
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38573
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38575
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38577
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub2.2632
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.38558
bgti_else.38577:
	add	%v0, %zero, %v1
bgti_cont.38578:
	j	bgti_cont.38558
bgti_else.38575:
	add	%v0, %zero, %v1
bgti_cont.38576:
	j	bgti_cont.38558
bgti_else.38573:
	add	%v0, %zero, %v1
bgti_cont.38574:
	j	bgti_cont.38558
bgti_else.38571:
	add	%v0, %zero, %v1
bgti_cont.38572:
	j	bgti_cont.38558
bgti_else.38569:
	add	%v0, %zero, %v1
bgti_cont.38570:
	j	bgti_cont.38558
bgti_else.38567:
	add	%v0, %zero, %v1
bgti_cont.38568:
	j	bgti_cont.38558
bgti_else.38565:
	add	%v0, %zero, %v1
bgti_cont.38566:
	j	bgti_cont.38558
bgti_else.38563:
	add	%v0, %zero, %v1
bgti_cont.38564:
	j	bgti_cont.38558
bgti_else.38561:
	add	%v0, %zero, %v1
bgti_cont.38562:
	j	bgti_cont.38558
bgti_else.38559:
	add	%v0, %zero, %v1
bgti_cont.38560:
	j	bgti_cont.38558
bgti_else.38557:
	add	%v0, %zero, %v1
bgti_cont.38558:
	lw	%v1, 14(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.38579
	addi	%v0, %v0, 48
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_print_char
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 13(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_print_char
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgt_cont.38580
bgt_else.38579:
	sw	%v0, 15(%sp)
	blti	%v1, 10, bgti_else.38581
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38583
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38585
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38587
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38589
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38591
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38593
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38595
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38597
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38599
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38601
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	print_int_sub2.2632
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgti_cont.38582
bgti_else.38601:
	add	%v0, %zero, %v1
bgti_cont.38602:
	j	bgti_cont.38582
bgti_else.38599:
	add	%v0, %zero, %v1
bgti_cont.38600:
	j	bgti_cont.38582
bgti_else.38597:
	add	%v0, %zero, %v1
bgti_cont.38598:
	j	bgti_cont.38582
bgti_else.38595:
	add	%v0, %zero, %v1
bgti_cont.38596:
	j	bgti_cont.38582
bgti_else.38593:
	add	%v0, %zero, %v1
bgti_cont.38594:
	j	bgti_cont.38582
bgti_else.38591:
	add	%v0, %zero, %v1
bgti_cont.38592:
	j	bgti_cont.38582
bgti_else.38589:
	add	%v0, %zero, %v1
bgti_cont.38590:
	j	bgti_cont.38582
bgti_else.38587:
	add	%v0, %zero, %v1
bgti_cont.38588:
	j	bgti_cont.38582
bgti_else.38585:
	add	%v0, %zero, %v1
bgti_cont.38586:
	j	bgti_cont.38582
bgti_else.38583:
	add	%v0, %zero, %v1
bgti_cont.38584:
	j	bgti_cont.38582
bgti_else.38581:
	add	%v0, %zero, %v1
bgti_cont.38582:
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_print_char
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 15(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_print_char
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 13(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_print_char
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
bgt_cont.38580:
bgt_cont.38550:
	addi	%v0, %zero, 32
	sw	%v0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_print_char
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.38603
	blti	%v0, 0, bgti_else.38605
	j	bgt_cont.38604
bgti_else.38605:
	addi	%v0, %zero, 0
bgti_cont.38606:
	j	bgt_cont.38604
bgt_else.38603:
	addi	%v0, %zero, 255
bgt_cont.38604:
	sw	%v0, 17(%sp)
	blti	%v0, 10, bgti_else.38607
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.38609
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38611
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	print_int_sub1.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.38608
bgti_else.38611:
	addi	%v0, %zero, 2
bgti_cont.38612:
	j	bgti_cont.38608
bgti_else.38609:
	addi	%v0, %zero, 1
bgti_cont.38610:
	j	bgti_cont.38608
bgti_else.38607:
	addi	%v0, %zero, 0
bgti_cont.38608:
	lw	%v1, 17(%sp)
	sw	%v0, 18(%sp)
	blti	%v1, 10, bgti_else.38613
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38615
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38617
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38619
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38621
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38623
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38625
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38627
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38629
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38631
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38633
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub2.2632
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgti_cont.38614
bgti_else.38633:
	add	%v0, %zero, %v1
bgti_cont.38634:
	j	bgti_cont.38614
bgti_else.38631:
	add	%v0, %zero, %v1
bgti_cont.38632:
	j	bgti_cont.38614
bgti_else.38629:
	add	%v0, %zero, %v1
bgti_cont.38630:
	j	bgti_cont.38614
bgti_else.38627:
	add	%v0, %zero, %v1
bgti_cont.38628:
	j	bgti_cont.38614
bgti_else.38625:
	add	%v0, %zero, %v1
bgti_cont.38626:
	j	bgti_cont.38614
bgti_else.38623:
	add	%v0, %zero, %v1
bgti_cont.38624:
	j	bgti_cont.38614
bgti_else.38621:
	add	%v0, %zero, %v1
bgti_cont.38622:
	j	bgti_cont.38614
bgti_else.38619:
	add	%v0, %zero, %v1
bgti_cont.38620:
	j	bgti_cont.38614
bgti_else.38617:
	add	%v0, %zero, %v1
bgti_cont.38618:
	j	bgti_cont.38614
bgti_else.38615:
	add	%v0, %zero, %v1
bgti_cont.38616:
	j	bgti_cont.38614
bgti_else.38613:
	add	%v0, %zero, %v1
bgti_cont.38614:
	lw	%v1, 18(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.38635
	addi	%v0, %v0, 48
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_print_char
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgt_cont.38636
bgt_else.38635:
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.38637
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.38639
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.38641
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub1.2629
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.38638
bgti_else.38641:
	addi	%v0, %zero, 2
bgti_cont.38642:
	j	bgti_cont.38638
bgti_else.38639:
	addi	%v0, %zero, 1
bgti_cont.38640:
	j	bgti_cont.38638
bgti_else.38637:
	addi	%v0, %zero, 0
bgti_cont.38638:
	lw	%v1, 18(%sp)
	sw	%v0, 20(%sp)
	blti	%v1, 10, bgti_else.38643
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38645
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38647
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38649
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38651
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38653
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38655
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38657
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38659
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38661
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38663
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	print_int_sub2.2632
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bgti_cont.38644
bgti_else.38663:
	add	%v0, %zero, %v1
bgti_cont.38664:
	j	bgti_cont.38644
bgti_else.38661:
	add	%v0, %zero, %v1
bgti_cont.38662:
	j	bgti_cont.38644
bgti_else.38659:
	add	%v0, %zero, %v1
bgti_cont.38660:
	j	bgti_cont.38644
bgti_else.38657:
	add	%v0, %zero, %v1
bgti_cont.38658:
	j	bgti_cont.38644
bgti_else.38655:
	add	%v0, %zero, %v1
bgti_cont.38656:
	j	bgti_cont.38644
bgti_else.38653:
	add	%v0, %zero, %v1
bgti_cont.38654:
	j	bgti_cont.38644
bgti_else.38651:
	add	%v0, %zero, %v1
bgti_cont.38652:
	j	bgti_cont.38644
bgti_else.38649:
	add	%v0, %zero, %v1
bgti_cont.38650:
	j	bgti_cont.38644
bgti_else.38647:
	add	%v0, %zero, %v1
bgti_cont.38648:
	j	bgti_cont.38644
bgti_else.38645:
	add	%v0, %zero, %v1
bgti_cont.38646:
	j	bgti_cont.38644
bgti_else.38643:
	add	%v0, %zero, %v1
bgti_cont.38644:
	lw	%v1, 20(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.38665
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_print_char
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v0, 19(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_print_char
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bgt_cont.38666
bgt_else.38665:
	sw	%v0, 21(%sp)
	blti	%v1, 10, bgti_else.38667
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38669
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38671
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38673
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38675
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38677
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38679
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38681
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38683
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38685
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38687
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	print_int_sub2.2632
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.38668
bgti_else.38687:
	add	%v0, %zero, %v1
bgti_cont.38688:
	j	bgti_cont.38668
bgti_else.38685:
	add	%v0, %zero, %v1
bgti_cont.38686:
	j	bgti_cont.38668
bgti_else.38683:
	add	%v0, %zero, %v1
bgti_cont.38684:
	j	bgti_cont.38668
bgti_else.38681:
	add	%v0, %zero, %v1
bgti_cont.38682:
	j	bgti_cont.38668
bgti_else.38679:
	add	%v0, %zero, %v1
bgti_cont.38680:
	j	bgti_cont.38668
bgti_else.38677:
	add	%v0, %zero, %v1
bgti_cont.38678:
	j	bgti_cont.38668
bgti_else.38675:
	add	%v0, %zero, %v1
bgti_cont.38676:
	j	bgti_cont.38668
bgti_else.38673:
	add	%v0, %zero, %v1
bgti_cont.38674:
	j	bgti_cont.38668
bgti_else.38671:
	add	%v0, %zero, %v1
bgti_cont.38672:
	j	bgti_cont.38668
bgti_else.38669:
	add	%v0, %zero, %v1
bgti_cont.38670:
	j	bgti_cont.38668
bgti_else.38667:
	add	%v0, %zero, %v1
bgti_cont.38668:
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v0, 21(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v0, 19(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
bgt_cont.38666:
bgt_cont.38636:
	lw	%v0, 16(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.38689
	blti	%v0, 0, bgti_else.38691
	j	bgt_cont.38690
bgti_else.38691:
	addi	%v0, %zero, 0
bgti_cont.38692:
	j	bgt_cont.38690
bgt_else.38689:
	addi	%v0, %zero, 255
bgt_cont.38690:
	sw	%v0, 22(%sp)
	blti	%v0, 10, bgti_else.38693
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.38695
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38697
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub1.2629
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.38694
bgti_else.38697:
	addi	%v0, %zero, 2
bgti_cont.38698:
	j	bgti_cont.38694
bgti_else.38695:
	addi	%v0, %zero, 1
bgti_cont.38696:
	j	bgti_cont.38694
bgti_else.38693:
	addi	%v0, %zero, 0
bgti_cont.38694:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	blti	%v1, 10, bgti_else.38699
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38701
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38703
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38705
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38707
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38709
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38711
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38713
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38715
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38717
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38719
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub2.2632
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgti_cont.38700
bgti_else.38719:
	add	%v0, %zero, %v1
bgti_cont.38720:
	j	bgti_cont.38700
bgti_else.38717:
	add	%v0, %zero, %v1
bgti_cont.38718:
	j	bgti_cont.38700
bgti_else.38715:
	add	%v0, %zero, %v1
bgti_cont.38716:
	j	bgti_cont.38700
bgti_else.38713:
	add	%v0, %zero, %v1
bgti_cont.38714:
	j	bgti_cont.38700
bgti_else.38711:
	add	%v0, %zero, %v1
bgti_cont.38712:
	j	bgti_cont.38700
bgti_else.38709:
	add	%v0, %zero, %v1
bgti_cont.38710:
	j	bgti_cont.38700
bgti_else.38707:
	add	%v0, %zero, %v1
bgti_cont.38708:
	j	bgti_cont.38700
bgti_else.38705:
	add	%v0, %zero, %v1
bgti_cont.38706:
	j	bgti_cont.38700
bgti_else.38703:
	add	%v0, %zero, %v1
bgti_cont.38704:
	j	bgti_cont.38700
bgti_else.38701:
	add	%v0, %zero, %v1
bgti_cont.38702:
	j	bgti_cont.38700
bgti_else.38699:
	add	%v0, %zero, %v1
bgti_cont.38700:
	lw	%v1, 23(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.38721
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_print_char
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgt_cont.38722
bgt_else.38721:
	sw	%v0, 24(%sp)
	blti	%v1, 10, bgti_else.38723
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.38725
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.38727
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub1.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgti_cont.38724
bgti_else.38727:
	addi	%v0, %zero, 2
bgti_cont.38728:
	j	bgti_cont.38724
bgti_else.38725:
	addi	%v0, %zero, 1
bgti_cont.38726:
	j	bgti_cont.38724
bgti_else.38723:
	addi	%v0, %zero, 0
bgti_cont.38724:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	blti	%v1, 10, bgti_else.38729
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38731
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38733
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38735
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38737
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38739
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38741
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38743
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38745
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38747
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38749
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	print_int_sub2.2632
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.38730
bgti_else.38749:
	add	%v0, %zero, %v1
bgti_cont.38750:
	j	bgti_cont.38730
bgti_else.38747:
	add	%v0, %zero, %v1
bgti_cont.38748:
	j	bgti_cont.38730
bgti_else.38745:
	add	%v0, %zero, %v1
bgti_cont.38746:
	j	bgti_cont.38730
bgti_else.38743:
	add	%v0, %zero, %v1
bgti_cont.38744:
	j	bgti_cont.38730
bgti_else.38741:
	add	%v0, %zero, %v1
bgti_cont.38742:
	j	bgti_cont.38730
bgti_else.38739:
	add	%v0, %zero, %v1
bgti_cont.38740:
	j	bgti_cont.38730
bgti_else.38737:
	add	%v0, %zero, %v1
bgti_cont.38738:
	j	bgti_cont.38730
bgti_else.38735:
	add	%v0, %zero, %v1
bgti_cont.38736:
	j	bgti_cont.38730
bgti_else.38733:
	add	%v0, %zero, %v1
bgti_cont.38734:
	j	bgti_cont.38730
bgti_else.38731:
	add	%v0, %zero, %v1
bgti_cont.38732:
	j	bgti_cont.38730
bgti_else.38729:
	add	%v0, %zero, %v1
bgti_cont.38730:
	lw	%v1, 25(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.38751
	addi	%v0, %v0, 48
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_print_char
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 24(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_print_char
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgt_cont.38752
bgt_else.38751:
	sw	%v0, 26(%sp)
	blti	%v1, 10, bgti_else.38753
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38755
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38757
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38759
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38761
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38763
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38765
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38767
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38769
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38771
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.38773
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2632
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.38754
bgti_else.38773:
	add	%v0, %zero, %v1
bgti_cont.38774:
	j	bgti_cont.38754
bgti_else.38771:
	add	%v0, %zero, %v1
bgti_cont.38772:
	j	bgti_cont.38754
bgti_else.38769:
	add	%v0, %zero, %v1
bgti_cont.38770:
	j	bgti_cont.38754
bgti_else.38767:
	add	%v0, %zero, %v1
bgti_cont.38768:
	j	bgti_cont.38754
bgti_else.38765:
	add	%v0, %zero, %v1
bgti_cont.38766:
	j	bgti_cont.38754
bgti_else.38763:
	add	%v0, %zero, %v1
bgti_cont.38764:
	j	bgti_cont.38754
bgti_else.38761:
	add	%v0, %zero, %v1
bgti_cont.38762:
	j	bgti_cont.38754
bgti_else.38759:
	add	%v0, %zero, %v1
bgti_cont.38760:
	j	bgti_cont.38754
bgti_else.38757:
	add	%v0, %zero, %v1
bgti_cont.38758:
	j	bgti_cont.38754
bgti_else.38755:
	add	%v0, %zero, %v1
bgti_cont.38756:
	j	bgti_cont.38754
bgti_else.38753:
	add	%v0, %zero, %v1
bgti_cont.38754:
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v0, 26(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v0, 24(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
bgt_cont.38752:
bgt_cont.38722:
	lw	%v0, 10(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	lw	%a2, 3(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	scan_pixel.3045
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
bgt_cont.38508:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.38775
	addi	%a0, %v0, -5
	j	bgti_cont.38776
bgti_else.38775:
	add	%a0, %zero, %v0
bgti_cont.38776:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.38777
	jr	%ra
bgt_else.38777:
	lw	%v0, 0(%sp)
	sw	%a0, 27(%sp)
	sw	%v1, 28(%sp)
	blt	%v1, %v0, bgt_else.38779
	j	bgt_cont.38780
bgt_else.38779:
	addi	%v0, %v1, 1
	flw	%f0, 158(%zero)
	lw	%a1, 157(%zero)
	sub	%v0, %v0, %a1
	itof	%f1, %v0
	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	fmul	%f1, %f0, %f1
	flw	%f2, 171(%zero)
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	fmul	%f2, %f0, %f2
	flw	%f3, 172(%zero)
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 173(%zero)
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
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
bgt_cont.38780:
	lw	%v0, 8(%sp)
	lw	%v1, 28(%sp)
	lw	%a0, 7(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	scan_pixel.3045
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v0, 28(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 27(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.38781
	addi	%a2, %v1, -5
	j	bgti_cont.38782
bgti_else.38781:
	add	%a2, %zero, %v1
bgti_cont.38782:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	j	scan_line.3051
init_line_elements.3061:
	addi	%a0, %zero, 0
	blti	%v1, 0, bgti_else.39088
	addi	%a1, %zero, 3
	flw	%f0, 494(%zero)
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
	blti	%v0, 0, bgti_else.39089
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_float_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_float_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_array
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
	lw	%v1, 17(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 2(%sp)
	sw	%v0, 18(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 19(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_float_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
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
	lw	%v1, 20(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
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
	lw	%v0, 7(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
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
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
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
	lw	%v1, 23(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_float_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_float_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_float_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 22(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 21(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 20(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 19(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 18(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 17(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 16(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 15(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.39090
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 24(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 25(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_float_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 26(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_float_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_float_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_float_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_float_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 2(%sp)
	sw	%v0, 27(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 28(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 29(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 30(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 31(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_create_float_array
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_create_array
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 32(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	min_caml_create_float_array
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	lw	%v1, 32(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	min_caml_create_float_array
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	lw	%v1, 32(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	min_caml_create_float_array
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	lw	%v1, 32(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	min_caml_create_float_array
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	lw	%v1, 32(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 31(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 30(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 29(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 28(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 27(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 26(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 25(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 24(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.39091
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 33(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	min_caml_create_float_array
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 34(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	min_caml_create_float_array
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	min_caml_create_array
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 35(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 2(%sp)
	sw	%v0, 36(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 37(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_float_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 38(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 39(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 40(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	min_caml_create_float_array
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 6(%sp)
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	min_caml_create_array
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 41(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 40(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 39(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 38(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 37(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 36(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 35(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 34(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 33(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	j	init_line_elements.3061
bgti_else.39091:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.39090:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.39089:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.39088:
	jr	%ra
calc_dirvec.3071:
	blti	%v0, 5, bgti_else.40096
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 484(%zero)
	fadd	%f2, %f2, %f3
	fsqrt	%f2, %f2
	fdiv	%f0, %f0, %f2
	fdiv	%f1, %f1, %f2
	fdiv	%f2, %f3, %f2
	lw	%v0, 179(%v1)
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
bgti_else.40096:
	fmul	%f0, %f1, %f1
	flw	%f1, 441(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 484(%zero)
	fdiv	%f5, %f4, %f0
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f3, 2(%sp)
	fsw	%f1, 3(%sp)
	sw	%v0, 4(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f4, 6(%sp)
	fsw	%f2, 7(%sp)
	fmov	%f0, %f5
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	atan.2627
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 482(%zero)
	flw	%f3, 494(%zero)
	fblt	%f0, %f3, fbgt_else.40098
	addi	%v0, %zero, 1
	j	fbgt_cont.40099
fbgt_else.40098:
	addi	%v0, %zero, 0
fbgt_cont.40099:
	fabs	%f4, %f0
	flw	%f5, 481(%zero)
	fsw	%f3, 8(%sp)
	fsw	%f0, 9(%sp)
	sw	%v0, 10(%sp)
	fsw	%f2, 11(%sp)
	fsw	%f4, 12(%sp)
	fsw	%f5, 13(%sp)
	fblt	%f4, %f5, fbgt_else.40100
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.40102
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.40104
	flw	%f6, 478(%zero)
	fblt	%f4, %f6, fbgt_else.40106
	flw	%f6, 477(%zero)
	fblt	%f4, %f6, fbgt_else.40108
	flw	%f6, 476(%zero)
	fblt	%f4, %f6, fbgt_else.40110
	flw	%f6, 475(%zero)
	fblt	%f4, %f6, fbgt_else.40112
	flw	%f6, 474(%zero)
	fblt	%f4, %f6, fbgt_else.40114
	flw	%f6, 473(%zero)
	fblt	%f4, %f6, fbgt_else.40116
	flw	%f6, 472(%zero)
	fblt	%f4, %f6, fbgt_else.40118
	flw	%f6, 471(%zero)
	fblt	%f4, %f6, fbgt_else.40120
	flw	%f6, 470(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.40101
fbgt_else.40120:
	fmov	%f0, %f6
fbgt_cont.40121:
	j	fbgt_cont.40101
fbgt_else.40118:
	fmov	%f0, %f6
fbgt_cont.40119:
	j	fbgt_cont.40101
fbgt_else.40116:
	fmov	%f0, %f6
fbgt_cont.40117:
	j	fbgt_cont.40101
fbgt_else.40114:
	fmov	%f0, %f6
fbgt_cont.40115:
	j	fbgt_cont.40101
fbgt_else.40112:
	fmov	%f0, %f6
fbgt_cont.40113:
	j	fbgt_cont.40101
fbgt_else.40110:
	fmov	%f0, %f6
fbgt_cont.40111:
	j	fbgt_cont.40101
fbgt_else.40108:
	fmov	%f0, %f6
fbgt_cont.40109:
	j	fbgt_cont.40101
fbgt_else.40106:
	fmov	%f0, %f6
fbgt_cont.40107:
	j	fbgt_cont.40101
fbgt_else.40104:
	fmov	%f0, %f6
fbgt_cont.40105:
	j	fbgt_cont.40101
fbgt_else.40102:
	fmov	%f0, %f6
fbgt_cont.40103:
	j	fbgt_cont.40101
fbgt_else.40100:
	fmov	%f0, %f5
fbgt_cont.40101:
	flw	%f1, 12(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.40122
	fblt	%f1, %f0, fbgt_else.40124
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40126
	fblt	%f1, %f0, fbgt_else.40128
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40130
	fblt	%f1, %f0, fbgt_else.40132
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.40123
fbgt_else.40132:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.40133:
	j	fbgt_cont.40123
fbgt_else.40130:
	fmov	%f0, %f1
fbgt_cont.40131:
	j	fbgt_cont.40123
fbgt_else.40128:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40134
	fblt	%f1, %f0, fbgt_else.40136
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.40135
fbgt_else.40136:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.40137:
	j	fbgt_cont.40135
fbgt_else.40134:
	fmov	%f0, %f1
fbgt_cont.40135:
fbgt_cont.40129:
	j	fbgt_cont.40123
fbgt_else.40126:
	fmov	%f0, %f1
fbgt_cont.40127:
	j	fbgt_cont.40123
fbgt_else.40124:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40138
	fblt	%f1, %f0, fbgt_else.40140
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40142
	fblt	%f1, %f0, fbgt_else.40144
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.40139
fbgt_else.40144:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.40145:
	j	fbgt_cont.40139
fbgt_else.40142:
	fmov	%f0, %f1
fbgt_cont.40143:
	j	fbgt_cont.40139
fbgt_else.40140:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40146
	fblt	%f1, %f0, fbgt_else.40148
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	fbgt_cont.40147
fbgt_else.40148:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
fbgt_cont.40149:
	j	fbgt_cont.40147
fbgt_else.40146:
	fmov	%f0, %f1
fbgt_cont.40147:
fbgt_cont.40141:
	j	fbgt_cont.40139
fbgt_else.40138:
	fmov	%f0, %f1
fbgt_cont.40139:
fbgt_cont.40125:
	j	fbgt_cont.40123
fbgt_else.40122:
	fmov	%f0, %f1
fbgt_cont.40123:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.40150
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.40152
	addi	%v0, %zero, 0
	j	fbgt_cont.40151
bnei_else.40152:
	addi	%v0, %zero, 1
bnei_cont.40153:
	j	fbgt_cont.40151
fbgt_else.40150:
	lw	%v0, 10(%sp)
fbgt_cont.40151:
	fblt	%f0, %f1, fbgt_else.40154
	fsub	%f0, %f0, %f1
	j	fbgt_cont.40155
fbgt_else.40154:
fbgt_cont.40155:
	flw	%f2, 483(%zero)
	fblt	%f0, %f2, fbgt_else.40156
	fsub	%f0, %f1, %f0
	j	fbgt_cont.40157
fbgt_else.40156:
fbgt_cont.40157:
	flw	%f3, 485(%zero)
	fblt	%f3, %f0, fbgt_else.40158
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.40159
fbgt_else.40158:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 464(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 6(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 463(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 462(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.40159:
	beqi	%v0, 0, bnei_else.40160
	j	bnei_cont.40161
bnei_else.40160:
	fneg	%f0, %f0
bnei_cont.40161:
	flw	%f4, 9(%sp)
	fabs	%f4, %f4
	flw	%f5, 13(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f3, 15(%sp)
	fsw	%f2, 16(%sp)
	fsw	%f4, 17(%sp)
	fblt	%f4, %f5, fbgt_else.40162
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.40164
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.40166
	flw	%f6, 478(%zero)
	fblt	%f4, %f6, fbgt_else.40168
	flw	%f6, 477(%zero)
	fblt	%f4, %f6, fbgt_else.40170
	flw	%f6, 476(%zero)
	fblt	%f4, %f6, fbgt_else.40172
	flw	%f6, 475(%zero)
	fblt	%f4, %f6, fbgt_else.40174
	flw	%f6, 474(%zero)
	fblt	%f4, %f6, fbgt_else.40176
	flw	%f6, 473(%zero)
	fblt	%f4, %f6, fbgt_else.40178
	flw	%f6, 472(%zero)
	fblt	%f4, %f6, fbgt_else.40180
	flw	%f6, 471(%zero)
	fblt	%f4, %f6, fbgt_else.40182
	flw	%f6, 470(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.40163
fbgt_else.40182:
	fmov	%f0, %f6
fbgt_cont.40183:
	j	fbgt_cont.40163
fbgt_else.40180:
	fmov	%f0, %f6
fbgt_cont.40181:
	j	fbgt_cont.40163
fbgt_else.40178:
	fmov	%f0, %f6
fbgt_cont.40179:
	j	fbgt_cont.40163
fbgt_else.40176:
	fmov	%f0, %f6
fbgt_cont.40177:
	j	fbgt_cont.40163
fbgt_else.40174:
	fmov	%f0, %f6
fbgt_cont.40175:
	j	fbgt_cont.40163
fbgt_else.40172:
	fmov	%f0, %f6
fbgt_cont.40173:
	j	fbgt_cont.40163
fbgt_else.40170:
	fmov	%f0, %f6
fbgt_cont.40171:
	j	fbgt_cont.40163
fbgt_else.40168:
	fmov	%f0, %f6
fbgt_cont.40169:
	j	fbgt_cont.40163
fbgt_else.40166:
	fmov	%f0, %f6
fbgt_cont.40167:
	j	fbgt_cont.40163
fbgt_else.40164:
	fmov	%f0, %f6
fbgt_cont.40165:
	j	fbgt_cont.40163
fbgt_else.40162:
	fmov	%f0, %f5
fbgt_cont.40163:
	flw	%f1, 17(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.40184
	fblt	%f1, %f0, fbgt_else.40186
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40188
	fblt	%f1, %f0, fbgt_else.40190
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40192
	fblt	%f1, %f0, fbgt_else.40194
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.40185
fbgt_else.40194:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.40195:
	j	fbgt_cont.40185
fbgt_else.40192:
	fmov	%f0, %f1
fbgt_cont.40193:
	j	fbgt_cont.40185
fbgt_else.40190:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40196
	fblt	%f1, %f0, fbgt_else.40198
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.40197
fbgt_else.40198:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.40199:
	j	fbgt_cont.40197
fbgt_else.40196:
	fmov	%f0, %f1
fbgt_cont.40197:
fbgt_cont.40191:
	j	fbgt_cont.40185
fbgt_else.40188:
	fmov	%f0, %f1
fbgt_cont.40189:
	j	fbgt_cont.40185
fbgt_else.40186:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40200
	fblt	%f1, %f0, fbgt_else.40202
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40204
	fblt	%f1, %f0, fbgt_else.40206
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.40201
fbgt_else.40206:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.40207:
	j	fbgt_cont.40201
fbgt_else.40204:
	fmov	%f0, %f1
fbgt_cont.40205:
	j	fbgt_cont.40201
fbgt_else.40202:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40208
	fblt	%f1, %f0, fbgt_else.40210
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.40209
fbgt_else.40210:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.40211:
	j	fbgt_cont.40209
fbgt_else.40208:
	fmov	%f0, %f1
fbgt_cont.40209:
fbgt_cont.40203:
	j	fbgt_cont.40201
fbgt_else.40200:
	fmov	%f0, %f1
fbgt_cont.40201:
fbgt_cont.40187:
	j	fbgt_cont.40185
fbgt_else.40184:
	fmov	%f0, %f1
fbgt_cont.40185:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.40212
	addi	%v0, %zero, 0
	j	fbgt_cont.40213
fbgt_else.40212:
	addi	%v0, %zero, 1
fbgt_cont.40213:
	fblt	%f0, %f1, fbgt_else.40214
	fsub	%f0, %f0, %f1
	j	fbgt_cont.40215
fbgt_else.40214:
fbgt_cont.40215:
	flw	%f2, 16(%sp)
	fblt	%f0, %f2, fbgt_else.40216
	beqi	%v0, 0, bnei_else.40218
	addi	%v0, %zero, 0
	j	fbgt_cont.40217
bnei_else.40218:
	addi	%v0, %zero, 1
bnei_cont.40219:
	j	fbgt_cont.40217
fbgt_else.40216:
fbgt_cont.40217:
	fblt	%f0, %f2, fbgt_else.40220
	fsub	%f0, %f1, %f0
	j	fbgt_cont.40221
fbgt_else.40220:
fbgt_cont.40221:
	flw	%f3, 15(%sp)
	fblt	%f3, %f0, fbgt_else.40222
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 464(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 6(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 463(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 462(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.40223
fbgt_else.40222:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.40223:
	beqi	%v0, 0, bnei_else.40224
	j	bnei_cont.40225
bnei_else.40224:
	fneg	%f0, %f0
bnei_cont.40225:
	flw	%f4, 14(%sp)
	fdiv	%f0, %f4, %f0
	flw	%f4, 5(%sp)
	fmul	%f0, %f0, %f4
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	fmul	%f4, %f0, %f0
	flw	%f5, 3(%sp)
	fadd	%f4, %f4, %f5
	fsqrt	%f4, %f4
	flw	%f5, 6(%sp)
	fdiv	%f6, %f5, %f4
	fsw	%f0, 18(%sp)
	sw	%v0, 19(%sp)
	fsw	%f4, 20(%sp)
	fmov	%f0, %f6
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	atan.2627
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f3, 2(%sp)
	fmul	%f0, %f0, %f3
	flw	%f1, 8(%sp)
	fblt	%f0, %f1, fbgt_else.40226
	addi	%v0, %zero, 1
	j	fbgt_cont.40227
fbgt_else.40226:
	addi	%v0, %zero, 0
fbgt_cont.40227:
	fabs	%f1, %f0
	flw	%f2, 13(%sp)
	fsw	%f0, 21(%sp)
	sw	%v0, 22(%sp)
	fsw	%f1, 23(%sp)
	fblt	%f1, %f2, fbgt_else.40228
	flw	%f4, 480(%zero)
	fblt	%f1, %f4, fbgt_else.40230
	flw	%f4, 479(%zero)
	fblt	%f1, %f4, fbgt_else.40232
	flw	%f4, 478(%zero)
	fblt	%f1, %f4, fbgt_else.40234
	flw	%f4, 477(%zero)
	fblt	%f1, %f4, fbgt_else.40236
	flw	%f4, 476(%zero)
	fblt	%f1, %f4, fbgt_else.40238
	flw	%f4, 475(%zero)
	fblt	%f1, %f4, fbgt_else.40240
	flw	%f4, 474(%zero)
	fblt	%f1, %f4, fbgt_else.40242
	flw	%f4, 473(%zero)
	fblt	%f1, %f4, fbgt_else.40244
	flw	%f4, 472(%zero)
	fblt	%f1, %f4, fbgt_else.40246
	flw	%f4, 471(%zero)
	fblt	%f1, %f4, fbgt_else.40248
	flw	%f4, 470(%zero)
	fmov	%f0, %f1
	fmov	%f1, %f4
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.40229
fbgt_else.40248:
	fmov	%f0, %f4
fbgt_cont.40249:
	j	fbgt_cont.40229
fbgt_else.40246:
	fmov	%f0, %f4
fbgt_cont.40247:
	j	fbgt_cont.40229
fbgt_else.40244:
	fmov	%f0, %f4
fbgt_cont.40245:
	j	fbgt_cont.40229
fbgt_else.40242:
	fmov	%f0, %f4
fbgt_cont.40243:
	j	fbgt_cont.40229
fbgt_else.40240:
	fmov	%f0, %f4
fbgt_cont.40241:
	j	fbgt_cont.40229
fbgt_else.40238:
	fmov	%f0, %f4
fbgt_cont.40239:
	j	fbgt_cont.40229
fbgt_else.40236:
	fmov	%f0, %f4
fbgt_cont.40237:
	j	fbgt_cont.40229
fbgt_else.40234:
	fmov	%f0, %f4
fbgt_cont.40235:
	j	fbgt_cont.40229
fbgt_else.40232:
	fmov	%f0, %f4
fbgt_cont.40233:
	j	fbgt_cont.40229
fbgt_else.40230:
	fmov	%f0, %f4
fbgt_cont.40231:
	j	fbgt_cont.40229
fbgt_else.40228:
	fmov	%f0, %f2
fbgt_cont.40229:
	flw	%f1, 23(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.40250
	fblt	%f1, %f0, fbgt_else.40252
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40254
	fblt	%f1, %f0, fbgt_else.40256
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40258
	fblt	%f1, %f0, fbgt_else.40260
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.40251
fbgt_else.40260:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.40261:
	j	fbgt_cont.40251
fbgt_else.40258:
	fmov	%f0, %f1
fbgt_cont.40259:
	j	fbgt_cont.40251
fbgt_else.40256:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40262
	fblt	%f1, %f0, fbgt_else.40264
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.40263
fbgt_else.40264:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.40265:
	j	fbgt_cont.40263
fbgt_else.40262:
	fmov	%f0, %f1
fbgt_cont.40263:
fbgt_cont.40257:
	j	fbgt_cont.40251
fbgt_else.40254:
	fmov	%f0, %f1
fbgt_cont.40255:
	j	fbgt_cont.40251
fbgt_else.40252:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40266
	fblt	%f1, %f0, fbgt_else.40268
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40270
	fblt	%f1, %f0, fbgt_else.40272
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.40267
fbgt_else.40272:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.40273:
	j	fbgt_cont.40267
fbgt_else.40270:
	fmov	%f0, %f1
fbgt_cont.40271:
	j	fbgt_cont.40267
fbgt_else.40268:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40274
	fblt	%f1, %f0, fbgt_else.40276
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.40275
fbgt_else.40276:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.40277:
	j	fbgt_cont.40275
fbgt_else.40274:
	fmov	%f0, %f1
fbgt_cont.40275:
fbgt_cont.40269:
	j	fbgt_cont.40267
fbgt_else.40266:
	fmov	%f0, %f1
fbgt_cont.40267:
fbgt_cont.40253:
	j	fbgt_cont.40251
fbgt_else.40250:
	fmov	%f0, %f1
fbgt_cont.40251:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.40278
	lw	%v0, 22(%sp)
	beqi	%v0, 0, bnei_else.40280
	addi	%v0, %zero, 0
	j	fbgt_cont.40279
bnei_else.40280:
	addi	%v0, %zero, 1
bnei_cont.40281:
	j	fbgt_cont.40279
fbgt_else.40278:
	lw	%v0, 22(%sp)
fbgt_cont.40279:
	fblt	%f0, %f1, fbgt_else.40282
	fsub	%f0, %f0, %f1
	j	fbgt_cont.40283
fbgt_else.40282:
fbgt_cont.40283:
	flw	%f2, 16(%sp)
	fblt	%f0, %f2, fbgt_else.40284
	fsub	%f0, %f1, %f0
	j	fbgt_cont.40285
fbgt_else.40284:
fbgt_cont.40285:
	flw	%f3, 15(%sp)
	fblt	%f3, %f0, fbgt_else.40286
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.40287
fbgt_else.40286:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 464(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 6(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 463(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 462(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.40287:
	beqi	%v0, 0, bnei_else.40288
	j	bnei_cont.40289
bnei_else.40288:
	fneg	%f0, %f0
bnei_cont.40289:
	flw	%f4, 21(%sp)
	fabs	%f4, %f4
	flw	%f5, 13(%sp)
	fsw	%f0, 24(%sp)
	fsw	%f4, 25(%sp)
	fblt	%f4, %f5, fbgt_else.40290
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.40292
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.40294
	flw	%f6, 478(%zero)
	fblt	%f4, %f6, fbgt_else.40296
	flw	%f6, 477(%zero)
	fblt	%f4, %f6, fbgt_else.40298
	flw	%f6, 476(%zero)
	fblt	%f4, %f6, fbgt_else.40300
	flw	%f6, 475(%zero)
	fblt	%f4, %f6, fbgt_else.40302
	flw	%f6, 474(%zero)
	fblt	%f4, %f6, fbgt_else.40304
	flw	%f6, 473(%zero)
	fblt	%f4, %f6, fbgt_else.40306
	flw	%f6, 472(%zero)
	fblt	%f4, %f6, fbgt_else.40308
	flw	%f6, 471(%zero)
	fblt	%f4, %f6, fbgt_else.40310
	flw	%f6, 470(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.40291
fbgt_else.40310:
	fmov	%f0, %f6
fbgt_cont.40311:
	j	fbgt_cont.40291
fbgt_else.40308:
	fmov	%f0, %f6
fbgt_cont.40309:
	j	fbgt_cont.40291
fbgt_else.40306:
	fmov	%f0, %f6
fbgt_cont.40307:
	j	fbgt_cont.40291
fbgt_else.40304:
	fmov	%f0, %f6
fbgt_cont.40305:
	j	fbgt_cont.40291
fbgt_else.40302:
	fmov	%f0, %f6
fbgt_cont.40303:
	j	fbgt_cont.40291
fbgt_else.40300:
	fmov	%f0, %f6
fbgt_cont.40301:
	j	fbgt_cont.40291
fbgt_else.40298:
	fmov	%f0, %f6
fbgt_cont.40299:
	j	fbgt_cont.40291
fbgt_else.40296:
	fmov	%f0, %f6
fbgt_cont.40297:
	j	fbgt_cont.40291
fbgt_else.40294:
	fmov	%f0, %f6
fbgt_cont.40295:
	j	fbgt_cont.40291
fbgt_else.40292:
	fmov	%f0, %f6
fbgt_cont.40293:
	j	fbgt_cont.40291
fbgt_else.40290:
	fmov	%f0, %f5
fbgt_cont.40291:
	flw	%f1, 25(%sp)
	flw	%f2, 13(%sp)
	fblt	%f1, %f2, fbgt_else.40312
	fblt	%f1, %f0, fbgt_else.40314
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40316
	fblt	%f1, %f0, fbgt_else.40318
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40320
	fblt	%f1, %f0, fbgt_else.40322
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.40313
fbgt_else.40322:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.40323:
	j	fbgt_cont.40313
fbgt_else.40320:
	fmov	%f0, %f1
fbgt_cont.40321:
	j	fbgt_cont.40313
fbgt_else.40318:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40324
	fblt	%f1, %f0, fbgt_else.40326
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.40325
fbgt_else.40326:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.40327:
	j	fbgt_cont.40325
fbgt_else.40324:
	fmov	%f0, %f1
fbgt_cont.40325:
fbgt_cont.40319:
	j	fbgt_cont.40313
fbgt_else.40316:
	fmov	%f0, %f1
fbgt_cont.40317:
	j	fbgt_cont.40313
fbgt_else.40314:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40328
	fblt	%f1, %f0, fbgt_else.40330
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40332
	fblt	%f1, %f0, fbgt_else.40334
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.40329
fbgt_else.40334:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.40335:
	j	fbgt_cont.40329
fbgt_else.40332:
	fmov	%f0, %f1
fbgt_cont.40333:
	j	fbgt_cont.40329
fbgt_else.40330:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.40336
	fblt	%f1, %f0, fbgt_else.40338
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	fbgt_cont.40337
fbgt_else.40338:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
fbgt_cont.40339:
	j	fbgt_cont.40337
fbgt_else.40336:
	fmov	%f0, %f1
fbgt_cont.40337:
fbgt_cont.40331:
	j	fbgt_cont.40329
fbgt_else.40328:
	fmov	%f0, %f1
fbgt_cont.40329:
fbgt_cont.40315:
	j	fbgt_cont.40313
fbgt_else.40312:
	fmov	%f0, %f1
fbgt_cont.40313:
	flw	%f1, 11(%sp)
	fblt	%f0, %f1, fbgt_else.40340
	addi	%v0, %zero, 0
	j	fbgt_cont.40341
fbgt_else.40340:
	addi	%v0, %zero, 1
fbgt_cont.40341:
	fblt	%f0, %f1, fbgt_else.40342
	fsub	%f0, %f0, %f1
	j	fbgt_cont.40343
fbgt_else.40342:
fbgt_cont.40343:
	flw	%f2, 16(%sp)
	fblt	%f0, %f2, fbgt_else.40344
	beqi	%v0, 0, bnei_else.40346
	addi	%v0, %zero, 0
	j	fbgt_cont.40345
bnei_else.40346:
	addi	%v0, %zero, 1
bnei_cont.40347:
	j	fbgt_cont.40345
fbgt_else.40344:
fbgt_cont.40345:
	fblt	%f0, %f2, fbgt_else.40348
	fsub	%f0, %f1, %f0
	j	fbgt_cont.40349
fbgt_else.40348:
fbgt_cont.40349:
	flw	%f1, 15(%sp)
	fblt	%f1, %f0, fbgt_else.40350
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 464(%zero)
	fmul	%f2, %f2, %f0
	flw	%f3, 6(%sp)
	fsub	%f2, %f3, %f2
	flw	%f3, 463(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 462(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.40351
fbgt_else.40350:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 466(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 465(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.40351:
	beqi	%v0, 0, bnei_else.40352
	j	bnei_cont.40353
bnei_else.40352:
	fneg	%f0, %f0
bnei_cont.40353:
	flw	%f1, 24(%sp)
	fdiv	%f0, %f1, %f0
	flw	%f1, 20(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 18(%sp)
	flw	%f2, 7(%sp)
	flw	%f3, 2(%sp)
	lw	%v0, 19(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	calc_dirvec.3071
calc_dirvecs.3079:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.40382
	itof	%f1, %v0
	flw	%f2, 491(%zero)
	fmul	%f1, %f1, %f2
	flw	%f3, 438(%zero)
	fsub	%f1, %f1, %f3
	flw	%f4, 494(%zero)
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
	jal	calc_dirvec.3071
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 441(%zero)
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
	jal	calc_dirvec.3071
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 3(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.40383
	addi	%v1, %v1, -5
	j	bgti_cont.40384
bgti_else.40383:
bgti_cont.40384:
	blti	%v0, 0, bgti_else.40385
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
	jal	calc_dirvec.3071
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
	jal	calc_dirvec.3071
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.40386
	addi	%v1, %v1, -5
	j	bgti_cont.40387
bgti_else.40386:
bgti_cont.40387:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3079
bgti_else.40385:
	jr	%ra
bgti_else.40382:
	jr	%ra
calc_dirvec_rows.3084:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.40410
	itof	%f0, %v0
	flw	%f1, 491(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 438(%zero)
	fsub	%f3, %f0, %f2
	addi	%a2, %zero, 4
	itof	%f0, %a2
	fmul	%f0, %f0, %f1
	fsub	%f0, %f0, %f2
	flw	%f4, 494(%zero)
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
	jal	calc_dirvec.3071
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	itof	%f0, %v0
	flw	%f1, 7(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 441(%zero)
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
	jal	calc_dirvec.3071
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 4(%sp)
	addi	%a0, %v1, 1
	blti	%a0, 5, bgti_else.40411
	addi	%a0, %a0, -5
	j	bgti_cont.40412
bgti_else.40411:
bgti_cont.40412:
	flw	%f0, 2(%sp)
	lw	%a1, 6(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvecs.3079
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 4(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.40413
	addi	%v1, %v1, -5
	j	bgti_cont.40414
bgti_else.40413:
bgti_cont.40414:
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.40415
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
	jal	calc_dirvecs.3079
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.40416
	addi	%v1, %v1, -5
	j	bgti_cont.40417
bgti_else.40416:
bgti_cont.40417:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3084
bgti_else.40415:
	jr	%ra
bgti_else.40410:
	jr	%ra
create_dirvec_elements.3090:
	blti	%v1, 0, bgti_else.40442
	addi	%a0, %zero, 3
	flw	%f0, 494(%zero)
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
	lw	%v0, 0(%zero)
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
	blti	%v0, 0, bgti_else.40443
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
	blti	%v0, 0, bgti_else.40444
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
	blti	%v0, 0, bgti_else.40445
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
	j	create_dirvec_elements.3090
bgti_else.40445:
	jr	%ra
bgti_else.40444:
	jr	%ra
bgti_else.40443:
	jr	%ra
bgti_else.40442:
	jr	%ra
create_dirvecs.3093:
	blti	%v0, 0, bgti_else.40488
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 494(%zero)
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
	lw	%v0, 0(%zero)
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
	lw	%v1, 2(%sp)
	sw	%v0, 179(%v1)
	lw	%v0, 179(%v1)
	flw	%f0, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 6(%sp)
	addi	%v0, %a0, 0
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
	jal	create_dirvec_elements.3090
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.40489
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
	lw	%v1, 11(%sp)
	sw	%v0, 179(%v1)
	lw	%v0, 179(%v1)
	flw	%f0, 0(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %a0, 0
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
	jal	create_dirvec_elements.3090
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	j	create_dirvecs.3093
bgti_else.40489:
	jr	%ra
bgti_else.40488:
	jr	%ra
init_dirvec_constants.3095:
	blti	%v1, 0, bgti_else.40565
	add	%at, %v0, %v1
	lw	%a0, 0(%at)
	lw	%a1, 0(%zero)
	addi	%a1, %a1, -1
	sw	%a1, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%v1, 2(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.40566
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.40567
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.40569
	beqi	%t1, 2, bnei_else.40571
	addi	%t1, %zero, 5
	flw	%f0, 494(%zero)
	sw	%a3, 5(%sp)
	fsw	%f0, 6(%sp)
	sw	%a2, 7(%sp)
	sw	%t0, 8(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 7(%sp)
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a0, 4(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.40573
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)
	flw	%f5, 0(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0
	lw	%a0, 9(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1
	lw	%a0, 9(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	j	bnei_cont.40574
bnei_else.40573:
bnei_cont.40574:
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f4, %f0, %f4
	fneg	%f4, %f4
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f5, %f1, %f5
	fneg	%f5, %f5
	lw	%a0, 4(%v1)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fneg	%f6, %f6
	fsw	%f3, 0(%v0)
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.40575
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 464(%zero)
	fmul	%f7, %f7, %f8
	fsub	%f4, %f4, %f7
	fsw	%f4, 1(%v0)
	lw	%a0, 9(%v1)
	flw	%f4, 0(%a0)
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)
	flw	%f4, 2(%a0)
	fmul	%f4, %f0, %f4
	fadd	%f2, %f2, %f4
	fmul	%f2, %f2, %f8
	fsub	%f2, %f5, %f2
	fsw	%f2, 2(%v0)
	lw	%a0, 9(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	lw	%v1, 9(%v1)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f8
	fsub	%f0, %f6, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.40576
bnei_else.40575:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.40576:
	flw	%f0, 6(%sp)
	fbne	%f3, %f0, fbeq_else.40577
	addi	%v1, %zero, 1
	j	fbeq_cont.40578
fbeq_else.40577:
	addi	%v1, %zero, 0
fbeq_cont.40578:
	beqi	%v1, 0, bnei_else.40579
	j	bnei_cont.40580
bnei_else.40579:
	flw	%f0, 484(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.40580:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.40570
bnei_else.40571:
	addi	%t1, %zero, 4
	flw	%f0, 494(%zero)
	sw	%a3, 5(%sp)
	fsw	%f0, 9(%sp)
	sw	%a2, 7(%sp)
	sw	%t0, 8(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 8(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)
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
	flw	%f1, 9(%sp)
	fblt	%f1, %f0, fbgt_else.40581
	addi	%v1, %zero, 0
	j	fbgt_cont.40582
fbgt_else.40581:
	addi	%v1, %zero, 1
fbgt_cont.40582:
	beqi	%v1, 0, bnei_else.40583
	flw	%f1, 460(%zero)
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
	j	bnei_cont.40584
bnei_else.40583:
	fsw	%f1, 0(%v0)
bnei_cont.40584:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.40572:
	j	bnei_cont.40570
bnei_else.40569:
	addi	%t1, %zero, 6
	flw	%f0, 494(%zero)
	sw	%a3, 5(%sp)
	sw	%a2, 7(%sp)
	fsw	%f0, 10(%sp)
	sw	%t0, 8(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 8(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 10(%sp)
	fbne	%f0, %f1, fbeq_else.40585
	addi	%a0, %zero, 1
	j	fbeq_cont.40586
fbeq_else.40585:
	addi	%a0, %zero, 0
fbeq_cont.40586:
	beqi	%a0, 0, bnei_else.40587
	fsw	%f1, 1(%v0)
	j	bnei_cont.40588
bnei_else.40587:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.40589
	addi	%a2, %zero, 0
	j	fbgt_cont.40590
fbgt_else.40589:
	addi	%a2, %zero, 1
fbgt_cont.40590:
	beqi	%a1, 0, bnei_else.40591
	beqi	%a2, 0, bnei_else.40593
	addi	%a1, %zero, 0
	j	bnei_cont.40592
bnei_else.40593:
	addi	%a1, %zero, 1
bnei_cont.40594:
	j	bnei_cont.40592
bnei_else.40591:
	add	%a1, %zero, %a2
bnei_cont.40592:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.40595
	j	bnei_cont.40596
bnei_else.40595:
	fneg	%f2, %f2
bnei_cont.40596:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.40588:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.40597
	addi	%a0, %zero, 1
	j	fbeq_cont.40598
fbeq_else.40597:
	addi	%a0, %zero, 0
fbeq_cont.40598:
	beqi	%a0, 0, bnei_else.40599
	fsw	%f1, 3(%v0)
	j	bnei_cont.40600
bnei_else.40599:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.40601
	addi	%a2, %zero, 0
	j	fbgt_cont.40602
fbgt_else.40601:
	addi	%a2, %zero, 1
fbgt_cont.40602:
	beqi	%a1, 0, bnei_else.40603
	beqi	%a2, 0, bnei_else.40605
	addi	%a1, %zero, 0
	j	bnei_cont.40604
bnei_else.40605:
	addi	%a1, %zero, 1
bnei_cont.40606:
	j	bnei_cont.40604
bnei_else.40603:
	add	%a1, %zero, %a2
bnei_cont.40604:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.40607
	j	bnei_cont.40608
bnei_else.40607:
	fneg	%f2, %f2
bnei_cont.40608:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.40600:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.40609
	addi	%v1, %zero, 1
	j	fbeq_cont.40610
fbeq_else.40609:
	addi	%v1, %zero, 0
fbeq_cont.40610:
	beqi	%v1, 0, bnei_else.40611
	fsw	%f1, 5(%v0)
	j	bnei_cont.40612
bnei_else.40611:
	lw	%v1, 7(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.40613
	addi	%a1, %zero, 0
	j	fbgt_cont.40614
fbgt_else.40613:
	addi	%a1, %zero, 1
fbgt_cont.40614:
	beqi	%a0, 0, bnei_else.40615
	beqi	%a1, 0, bnei_else.40617
	addi	%a0, %zero, 0
	j	bnei_cont.40616
bnei_else.40617:
	addi	%a0, %zero, 1
bnei_cont.40618:
	j	bnei_cont.40616
bnei_else.40615:
	add	%a0, %zero, %a1
bnei_cont.40616:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.40619
	j	bnei_cont.40620
bnei_else.40619:
	fneg	%f1, %f1
bnei_cont.40620:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.40612:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.40570:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.40568
bgti_else.40567:
bgti_cont.40568:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.40621
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 11(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.40622
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	sw	%v0, 12(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_dirvec_constants.2880
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	init_dirvec_constants.3095
bgti_else.40622:
	jr	%ra
bgti_else.40621:
	jr	%ra
bgti_else.40566:
	jr	%ra
bgti_else.40565:
	jr	%ra
init_vecset_constants.3098:
	blti	%v0, 0, bgti_else.40679
	lw	%v1, 179(%v0)
	addi	%a0, %zero, 119
	lw	%a1, 119(%v1)
	lw	%a2, 0(%zero)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v1, 3(%sp)
	blti	%a2, 0, bgti_else.40680
	lw	%a3, 12(%a2)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.40682
	beqi	%t2, 2, bnei_else.40684
	addi	%t2, %zero, 5
	flw	%f0, 494(%zero)
	sw	%t0, 5(%sp)
	fsw	%f0, 6(%sp)
	sw	%a3, 7(%sp)
	sw	%t1, 8(%sp)
	addi	%v0, %t2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 7(%sp)
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a0, 4(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.40686
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)
	flw	%f5, 0(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0
	lw	%a0, 9(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1
	lw	%a0, 9(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	j	bnei_cont.40687
bnei_else.40686:
bnei_cont.40687:
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f4, %f0, %f4
	fneg	%f4, %f4
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f5, %f1, %f5
	fneg	%f5, %f5
	lw	%a0, 4(%v1)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fneg	%f6, %f6
	fsw	%f3, 0(%v0)
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.40688
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 464(%zero)
	fmul	%f7, %f7, %f8
	fsub	%f4, %f4, %f7
	fsw	%f4, 1(%v0)
	lw	%a0, 9(%v1)
	flw	%f4, 0(%a0)
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)
	flw	%f4, 2(%a0)
	fmul	%f4, %f0, %f4
	fadd	%f2, %f2, %f4
	fmul	%f2, %f2, %f8
	fsub	%f2, %f5, %f2
	fsw	%f2, 2(%v0)
	lw	%a0, 9(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	lw	%v1, 9(%v1)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f8
	fsub	%f0, %f6, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.40689
bnei_else.40688:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.40689:
	flw	%f0, 6(%sp)
	fbne	%f3, %f0, fbeq_else.40690
	addi	%v1, %zero, 1
	j	fbeq_cont.40691
fbeq_else.40690:
	addi	%v1, %zero, 0
fbeq_cont.40691:
	beqi	%v1, 0, bnei_else.40692
	j	bnei_cont.40693
bnei_else.40692:
	flw	%f0, 484(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.40693:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.40683
bnei_else.40684:
	addi	%t2, %zero, 4
	flw	%f0, 494(%zero)
	sw	%t0, 5(%sp)
	fsw	%f0, 9(%sp)
	sw	%a3, 7(%sp)
	sw	%t1, 8(%sp)
	addi	%v0, %t2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 8(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)
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
	flw	%f1, 9(%sp)
	fblt	%f1, %f0, fbgt_else.40694
	addi	%v1, %zero, 0
	j	fbgt_cont.40695
fbgt_else.40694:
	addi	%v1, %zero, 1
fbgt_cont.40695:
	beqi	%v1, 0, bnei_else.40696
	flw	%f1, 460(%zero)
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
	j	bnei_cont.40697
bnei_else.40696:
	fsw	%f1, 0(%v0)
bnei_cont.40697:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.40685:
	j	bnei_cont.40683
bnei_else.40682:
	addi	%t2, %zero, 6
	flw	%f0, 494(%zero)
	sw	%t0, 5(%sp)
	sw	%a3, 7(%sp)
	fsw	%f0, 10(%sp)
	sw	%t1, 8(%sp)
	addi	%v0, %t2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_float_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 8(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 10(%sp)
	fbne	%f0, %f1, fbeq_else.40698
	addi	%a0, %zero, 1
	j	fbeq_cont.40699
fbeq_else.40698:
	addi	%a0, %zero, 0
fbeq_cont.40699:
	beqi	%a0, 0, bnei_else.40700
	fsw	%f1, 1(%v0)
	j	bnei_cont.40701
bnei_else.40700:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.40702
	addi	%a2, %zero, 0
	j	fbgt_cont.40703
fbgt_else.40702:
	addi	%a2, %zero, 1
fbgt_cont.40703:
	beqi	%a1, 0, bnei_else.40704
	beqi	%a2, 0, bnei_else.40706
	addi	%a1, %zero, 0
	j	bnei_cont.40705
bnei_else.40706:
	addi	%a1, %zero, 1
bnei_cont.40707:
	j	bnei_cont.40705
bnei_else.40704:
	add	%a1, %zero, %a2
bnei_cont.40705:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.40708
	j	bnei_cont.40709
bnei_else.40708:
	fneg	%f2, %f2
bnei_cont.40709:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.40701:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.40710
	addi	%a0, %zero, 1
	j	fbeq_cont.40711
fbeq_else.40710:
	addi	%a0, %zero, 0
fbeq_cont.40711:
	beqi	%a0, 0, bnei_else.40712
	fsw	%f1, 3(%v0)
	j	bnei_cont.40713
bnei_else.40712:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.40714
	addi	%a2, %zero, 0
	j	fbgt_cont.40715
fbgt_else.40714:
	addi	%a2, %zero, 1
fbgt_cont.40715:
	beqi	%a1, 0, bnei_else.40716
	beqi	%a2, 0, bnei_else.40718
	addi	%a1, %zero, 0
	j	bnei_cont.40717
bnei_else.40718:
	addi	%a1, %zero, 1
bnei_cont.40719:
	j	bnei_cont.40717
bnei_else.40716:
	add	%a1, %zero, %a2
bnei_cont.40717:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.40720
	j	bnei_cont.40721
bnei_else.40720:
	fneg	%f2, %f2
bnei_cont.40721:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.40713:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.40722
	addi	%v1, %zero, 1
	j	fbeq_cont.40723
fbeq_else.40722:
	addi	%v1, %zero, 0
fbeq_cont.40723:
	beqi	%v1, 0, bnei_else.40724
	fsw	%f1, 5(%v0)
	j	bnei_cont.40725
bnei_else.40724:
	lw	%v1, 7(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.40726
	addi	%a1, %zero, 0
	j	fbgt_cont.40727
fbgt_else.40726:
	addi	%a1, %zero, 1
fbgt_cont.40727:
	beqi	%a0, 0, bnei_else.40728
	beqi	%a1, 0, bnei_else.40730
	addi	%a0, %zero, 0
	j	bnei_cont.40729
bnei_else.40730:
	addi	%a0, %zero, 1
bnei_cont.40731:
	j	bnei_cont.40729
bnei_else.40728:
	add	%a0, %zero, %a1
bnei_cont.40729:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.40732
	j	bnei_cont.40733
bnei_else.40732:
	fneg	%f1, %f1
bnei_cont.40733:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.40725:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.40683:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.40681
bgti_else.40680:
bgti_cont.40681:
	addi	%v0, %zero, 118
	lw	%v1, 3(%sp)
	lw	%a0, 118(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 11(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 117
	lw	%v1, 3(%sp)
	lw	%a0, 117(%v1)
	sw	%v0, 12(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_dirvec_constants.2880
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v1, %zero, 116
	lw	%v0, 3(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.40734
	lw	%v1, 179(%v0)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 13(%sp)
	sw	%v1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 14(%sp)
	lw	%v1, 118(%v0)
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	setup_dirvec_constants.2880
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 14(%sp)
	lw	%v1, 12(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 13(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.40735
	lw	%v1, 179(%v0)
	lw	%a0, 119(%v1)
	sw	%v0, 15(%sp)
	sw	%v1, 16(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_dirvec_constants.2880
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 16(%sp)
	lw	%v1, 11(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 15(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.40736
	lw	%v1, 179(%v0)
	lw	%a0, 0(%sp)
	sw	%v0, 17(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 17(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3098
bgti_else.40736:
	jr	%ra
bgti_else.40735:
	jr	%ra
bgti_else.40734:
	jr	%ra
bgti_else.40679:
	jr	%ra
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
	flw	%f0, 494(%zero)
	addi	%v1, %zero, 1
	lw	%v0, 1(%sp)
	fsw	%f0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v1, %zero, 60
	sw	%v0, 11(%zero)
	sw	%v0, 10(%zero)
	sw	%v0, 9(%zero)
	sw	%v0, 8(%zero)
	lw	%a0, 1(%sp)
	sw	%a0, 7(%zero)
	sw	%v0, 6(%zero)
	sw	%v0, 5(%zero)
	sw	%a0, 4(%zero)
	sw	%a0, 3(%zero)
	sw	%a0, 2(%zero)
	sw	%a0, 1(%zero)
	addi	%v0, %zero, 12
	addi	%a1, %zero, 1
	sw	%v1, 3(%sp)
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
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
	flw	%f0, 451(%zero)
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
	flw	%f0, 445(%zero)
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
	sw	%v0, 178(%zero)
	lw	%v0, 7(%sp)
	sw	%v0, 177(%zero)
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
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_extarray
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v1, %zero, 184
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	lw	%a1, 3(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_extarray
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	sw	%v0, 248(%zero)
	lw	%v0, 9(%sp)
	sw	%v0, 247(%zero)
	addi	%v1, %zero, 249
	flw	%f0, 2(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%a0, %zero, 249
	addi	%v1, %zero, 249
	lw	%a1, 1(%sp)
	sw	%v0, 10(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_extarray
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v1, %zero, 249
	sw	%v0, 250(%zero)
	lw	%v0, 10(%sp)
	sw	%v0, 249(%zero)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	flw	%f0, 2(%sp)
	fsw	%f0, 253(%zero)
	sw	%v0, 252(%zero)
	lw	%v0, 1(%sp)
	sw	%v0, 251(%zero)
	addi	%a0, %zero, 254
	addi	%a1, %zero, 251
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_extarray
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%a0, %zero, 434
	lw	%v0, 0(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_extarray
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%v0, %zero, 128
	sw	%v0, 154(%zero)
	sw	%v0, 155(%zero)
	addi	%v1, %zero, 64
	sw	%v1, 156(%zero)
	sw	%v1, 157(%zero)
	flw	%f0, 437(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	fsw	%f0, 158(%zero)
	lw	%v0, 154(%zero)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_float_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_array
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 13(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_float_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 3(%v1)
	addi	%v0, %zero, 4
	flw	%f0, 2(%sp)
	lw	%a0, 4(%sp)
	sw	%v0, 14(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 13(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	min_caml_create_array
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_float_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	min_caml_create_array
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 17(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	flw	%f0, 2(%sp)
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
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 19(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_float_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_float_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 19(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 18(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 17(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 16(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 15(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 13(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 12(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	lw	%v0, 11(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 11(%sp)
	addi	%a0, %v1, -2
	sw	%a0, 21(%sp)
	blti	%a0, 0, bgti_else.43426
	flw	%f0, 2(%sp)
	lw	%a1, 4(%sp)
	sw	%v0, 22(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 23(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_float_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_create_array
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f0, 2(%sp)
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
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_float_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	min_caml_create_array
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 25(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	min_caml_create_array
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 26(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_float_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 27(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 28(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 29(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_float_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	min_caml_create_array
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 30(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
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
	lw	%v1, 23(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 21(%sp)
	lw	%a0, 22(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	init_line_elements.3061
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	bgti_cont.43427
bgti_else.43426:
bgti_cont.43427:
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 31(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_create_float_array
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 32(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	min_caml_create_float_array
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	min_caml_create_array
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 33(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	min_caml_create_float_array
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	lw	%v1, 33(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	min_caml_create_float_array
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	lw	%v1, 33(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	min_caml_create_float_array
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	lw	%v1, 33(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	min_caml_create_float_array
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	lw	%v1, 33(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	min_caml_create_array
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 34(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	min_caml_create_array
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 35(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 36(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_float_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	lw	%v1, 36(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_float_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	lw	%v1, 36(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_float_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	lw	%v1, 36(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_float_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	lw	%v1, 36(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_float_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 37(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_float_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	lw	%v1, 37(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_float_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	lw	%v1, 37(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_float_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	lw	%v1, 37(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_float_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	lw	%v1, 37(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 38(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_array
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 39(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_float_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 38(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 37(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 36(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 35(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 34(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 33(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 32(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	lw	%v0, 11(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 21(%sp)
	blti	%v1, 0, bgti_else.43428
	flw	%f0, 2(%sp)
	lw	%a0, 4(%sp)
	sw	%v0, 40(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	min_caml_create_float_array
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 41(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_float_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	min_caml_create_array
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 42(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_float_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_float_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_float_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_float_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_create_array
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 43(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	min_caml_create_array
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 44(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_create_float_array
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_create_array
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 45(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_create_float_array
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	lw	%v1, 45(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_create_float_array
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	lw	%v1, 45(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_create_float_array
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	lw	%v1, 45(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_create_float_array
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	lw	%v1, 45(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_create_float_array
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_create_array
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 46(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v1, 46(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v1, 46(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v1, 46(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v1, 46(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_array
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 47(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_create_float_array
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_create_array
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 48(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_create_float_array
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_create_float_array
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_create_float_array
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_create_float_array
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 47(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 46(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 45(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 44(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 43(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 42(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 41(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 21(%sp)
	lw	%a0, 40(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	init_line_elements.3061
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	j	bgti_cont.43429
bgti_else.43428:
bgti_cont.43429:
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 49(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_create_float_array
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 50(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	min_caml_create_float_array
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	min_caml_create_array
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 51(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_create_float_array
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	lw	%v1, 51(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_create_float_array
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	lw	%v1, 51(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_create_float_array
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	lw	%v1, 51(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_create_float_array
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	lw	%v1, 51(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_create_array
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 52(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	min_caml_create_array
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 53(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	min_caml_create_float_array
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 54(%sp)
	addi	%sp, %sp, 55
	jal	min_caml_create_array
	addi	%sp, %sp, -55
	lw	%ra, 54(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 54(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	lw	%v1, 54(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	lw	%v1, 54(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	lw	%v1, 54(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	lw	%v1, 54(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 55(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_array
	addi	%sp, %sp, -56
	lw	%ra, 55(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 55(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 56(%sp)
	addi	%sp, %sp, 57
	jal	min_caml_create_float_array
	addi	%sp, %sp, -57
	lw	%ra, 56(%sp)
	lw	%v1, 55(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 56(%sp)
	addi	%sp, %sp, 57
	jal	min_caml_create_float_array
	addi	%sp, %sp, -57
	lw	%ra, 56(%sp)
	lw	%v1, 55(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 56(%sp)
	addi	%sp, %sp, 57
	jal	min_caml_create_float_array
	addi	%sp, %sp, -57
	lw	%ra, 56(%sp)
	lw	%v1, 55(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 56(%sp)
	addi	%sp, %sp, 57
	jal	min_caml_create_float_array
	addi	%sp, %sp, -57
	lw	%ra, 56(%sp)
	lw	%v1, 55(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 56(%sp)
	addi	%sp, %sp, 57
	jal	min_caml_create_array
	addi	%sp, %sp, -57
	lw	%ra, 56(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 56(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	min_caml_create_float_array
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	min_caml_create_array
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 57(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	min_caml_create_float_array
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	lw	%v1, 57(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	min_caml_create_float_array
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	lw	%v1, 57(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	min_caml_create_float_array
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	lw	%v1, 57(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	min_caml_create_float_array
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	lw	%v1, 57(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 56(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 55(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 54(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 53(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 52(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 51(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 50(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	lw	%v0, 11(%sp)
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	min_caml_create_array
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	lw	%v1, 21(%sp)
	blti	%v1, 0, bgti_else.43430
	flw	%f0, 2(%sp)
	lw	%a0, 4(%sp)
	sw	%v0, 58(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 59(%sp)
	addi	%sp, %sp, 60
	jal	min_caml_create_float_array
	addi	%sp, %sp, -60
	lw	%ra, 59(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 59(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 61
	jal	min_caml_create_float_array
	addi	%sp, %sp, -61
	lw	%ra, 60(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 61
	jal	min_caml_create_array
	addi	%sp, %sp, -61
	lw	%ra, 60(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 60(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	min_caml_create_float_array
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
	lw	%v1, 60(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	min_caml_create_float_array
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
	lw	%v1, 60(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	min_caml_create_float_array
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
	lw	%v1, 60(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	min_caml_create_float_array
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
	lw	%v1, 60(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 61(%sp)
	addi	%sp, %sp, 62
	jal	min_caml_create_array
	addi	%sp, %sp, -62
	lw	%ra, 61(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 1(%sp)
	sw	%v0, 61(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	min_caml_create_array
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 62(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	min_caml_create_float_array
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 63(%sp)
	addi	%sp, %sp, 64
	jal	min_caml_create_array
	addi	%sp, %sp, -64
	lw	%ra, 63(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 63(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	min_caml_create_float_array
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	lw	%v1, 63(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	min_caml_create_float_array
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	lw	%v1, 63(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	min_caml_create_float_array
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	lw	%v1, 63(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	min_caml_create_float_array
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	lw	%v1, 63(%sp)
	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	min_caml_create_float_array
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 64(%sp)
	addi	%sp, %sp, 65
	jal	min_caml_create_array
	addi	%sp, %sp, -65
	lw	%ra, 64(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 64(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	min_caml_create_float_array
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	lw	%v1, 64(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	min_caml_create_float_array
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	lw	%v1, 64(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	min_caml_create_float_array
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	lw	%v1, 64(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	min_caml_create_float_array
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	lw	%v1, 64(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	lw	%a0, 1(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	min_caml_create_array
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 65(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 66(%sp)
	addi	%sp, %sp, 67
	jal	min_caml_create_float_array
	addi	%sp, %sp, -67
	lw	%ra, 66(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 66(%sp)
	addi	%sp, %sp, 67
	jal	min_caml_create_array
	addi	%sp, %sp, -67
	lw	%ra, 66(%sp)
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 66(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 67(%sp)
	addi	%sp, %sp, 68
	jal	min_caml_create_float_array
	addi	%sp, %sp, -68
	lw	%ra, 67(%sp)
	lw	%v1, 66(%sp)
	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 67(%sp)
	addi	%sp, %sp, 68
	jal	min_caml_create_float_array
	addi	%sp, %sp, -68
	lw	%ra, 67(%sp)
	lw	%v1, 66(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 67(%sp)
	addi	%sp, %sp, 68
	jal	min_caml_create_float_array
	addi	%sp, %sp, -68
	lw	%ra, 67(%sp)
	lw	%v1, 66(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 67(%sp)
	addi	%sp, %sp, 68
	jal	min_caml_create_float_array
	addi	%sp, %sp, -68
	lw	%ra, 67(%sp)
	lw	%v1, 66(%sp)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v1, 7(%v0)
	lw	%v1, 65(%sp)
	sw	%v1, 6(%v0)
	lw	%v1, 64(%sp)
	sw	%v1, 5(%v0)
	lw	%v1, 63(%sp)
	sw	%v1, 4(%v0)
	lw	%v1, 62(%sp)
	sw	%v1, 3(%v0)
	lw	%v1, 61(%sp)
	sw	%v1, 2(%v0)
	lw	%v1, 60(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 59(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 21(%sp)
	lw	%a0, 58(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a0, 0
	sw	%ra, 67(%sp)
	addi	%sp, %sp, 68
	jal	init_line_elements.3061
	addi	%sp, %sp, -68
	lw	%ra, 67(%sp)
	j	bgti_cont.43431
bgti_else.43430:
bgti_cont.43431:
	sw	%v0, 67(%sp)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	min_caml_read_float
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	fsw	%f0, 72(%zero)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	min_caml_read_float
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	fsw	%f0, 73(%zero)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	min_caml_read_float
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	fsw	%f0, 74(%zero)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	min_caml_read_float
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	flw	%f1, 461(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 482(%zero)
	fabs	%f3, %f0
	flw	%f4, 481(%zero)
	fsw	%f1, 68(%sp)
	fsw	%f0, 69(%sp)
	fsw	%f2, 70(%sp)
	fsw	%f3, 71(%sp)
	fsw	%f4, 72(%sp)
	fblt	%f3, %f4, fbgt_else.43432
	flw	%f5, 480(%zero)
	fblt	%f3, %f5, fbgt_else.43434
	flw	%f5, 479(%zero)
	fblt	%f3, %f5, fbgt_else.43436
	flw	%f5, 478(%zero)
	fblt	%f3, %f5, fbgt_else.43438
	flw	%f5, 477(%zero)
	fblt	%f3, %f5, fbgt_else.43440
	flw	%f5, 476(%zero)
	fblt	%f3, %f5, fbgt_else.43442
	flw	%f5, 475(%zero)
	fblt	%f3, %f5, fbgt_else.43444
	flw	%f5, 474(%zero)
	fblt	%f3, %f5, fbgt_else.43446
	flw	%f5, 473(%zero)
	fblt	%f3, %f5, fbgt_else.43448
	flw	%f5, 472(%zero)
	fblt	%f3, %f5, fbgt_else.43450
	flw	%f5, 471(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
	j	fbgt_cont.43433
fbgt_else.43450:
	fmov	%f0, %f5
fbgt_cont.43451:
	j	fbgt_cont.43433
fbgt_else.43448:
	fmov	%f0, %f5
fbgt_cont.43449:
	j	fbgt_cont.43433
fbgt_else.43446:
	fmov	%f0, %f5
fbgt_cont.43447:
	j	fbgt_cont.43433
fbgt_else.43444:
	fmov	%f0, %f5
fbgt_cont.43445:
	j	fbgt_cont.43433
fbgt_else.43442:
	fmov	%f0, %f5
fbgt_cont.43443:
	j	fbgt_cont.43433
fbgt_else.43440:
	fmov	%f0, %f5
fbgt_cont.43441:
	j	fbgt_cont.43433
fbgt_else.43438:
	fmov	%f0, %f5
fbgt_cont.43439:
	j	fbgt_cont.43433
fbgt_else.43436:
	fmov	%f0, %f5
fbgt_cont.43437:
	j	fbgt_cont.43433
fbgt_else.43434:
	fmov	%f0, %f5
fbgt_cont.43435:
	j	fbgt_cont.43433
fbgt_else.43432:
	fmov	%f0, %f4
fbgt_cont.43433:
	flw	%f1, 71(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.43452
	fblt	%f1, %f0, fbgt_else.43454
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43456
	fblt	%f1, %f0, fbgt_else.43458
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
	j	fbgt_cont.43453
fbgt_else.43458:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
fbgt_cont.43459:
	j	fbgt_cont.43453
fbgt_else.43456:
	fmov	%f0, %f1
fbgt_cont.43457:
	j	fbgt_cont.43453
fbgt_else.43454:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43460
	fblt	%f1, %f0, fbgt_else.43462
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
	j	fbgt_cont.43461
fbgt_else.43462:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
fbgt_cont.43463:
	j	fbgt_cont.43461
fbgt_else.43460:
	fmov	%f0, %f1
fbgt_cont.43461:
fbgt_cont.43455:
	j	fbgt_cont.43453
fbgt_else.43452:
	fmov	%f0, %f1
fbgt_cont.43453:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.43464
	addi	%v0, %zero, 0
	j	fbgt_cont.43465
fbgt_else.43464:
	addi	%v0, %zero, 1
fbgt_cont.43465:
	fblt	%f0, %f1, fbgt_else.43466
	fsub	%f0, %f0, %f1
	j	fbgt_cont.43467
fbgt_else.43466:
fbgt_cont.43467:
	flw	%f2, 483(%zero)
	fblt	%f0, %f2, fbgt_else.43468
	beqi	%v0, 0, bnei_else.43470
	addi	%v0, %zero, 0
	j	fbgt_cont.43469
bnei_else.43470:
	addi	%v0, %zero, 1
bnei_cont.43471:
	j	fbgt_cont.43469
fbgt_else.43468:
fbgt_cont.43469:
	fblt	%f0, %f2, fbgt_else.43472
	fsub	%f0, %f1, %f0
	j	fbgt_cont.43473
fbgt_else.43472:
fbgt_cont.43473:
	flw	%f3, 485(%zero)
	fblt	%f3, %f0, fbgt_else.43474
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.43475
fbgt_else.43474:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.43475:
	beqi	%v0, 0, bnei_else.43476
	j	bnei_cont.43477
bnei_else.43476:
	fneg	%f0, %f0
bnei_cont.43477:
	flw	%f4, 69(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.43478
	addi	%v0, %zero, 1
	j	fbgt_cont.43479
fbgt_else.43478:
	addi	%v0, %zero, 0
fbgt_cont.43479:
	fabs	%f4, %f4
	flw	%f6, 72(%sp)
	fsw	%f0, 73(%sp)
	fsw	%f3, 74(%sp)
	fsw	%f2, 75(%sp)
	sw	%v0, 76(%sp)
	fsw	%f4, 77(%sp)
	fblt	%f4, %f6, fbgt_else.43480
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.43482
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.43484
	flw	%f7, 478(%zero)
	fblt	%f4, %f7, fbgt_else.43486
	flw	%f7, 477(%zero)
	fblt	%f4, %f7, fbgt_else.43488
	flw	%f7, 476(%zero)
	fblt	%f4, %f7, fbgt_else.43490
	flw	%f7, 475(%zero)
	fblt	%f4, %f7, fbgt_else.43492
	flw	%f7, 474(%zero)
	fblt	%f4, %f7, fbgt_else.43494
	flw	%f7, 473(%zero)
	fblt	%f4, %f7, fbgt_else.43496
	flw	%f7, 472(%zero)
	fblt	%f4, %f7, fbgt_else.43498
	flw	%f7, 471(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.43481
fbgt_else.43498:
	fmov	%f0, %f7
fbgt_cont.43499:
	j	fbgt_cont.43481
fbgt_else.43496:
	fmov	%f0, %f7
fbgt_cont.43497:
	j	fbgt_cont.43481
fbgt_else.43494:
	fmov	%f0, %f7
fbgt_cont.43495:
	j	fbgt_cont.43481
fbgt_else.43492:
	fmov	%f0, %f7
fbgt_cont.43493:
	j	fbgt_cont.43481
fbgt_else.43490:
	fmov	%f0, %f7
fbgt_cont.43491:
	j	fbgt_cont.43481
fbgt_else.43488:
	fmov	%f0, %f7
fbgt_cont.43489:
	j	fbgt_cont.43481
fbgt_else.43486:
	fmov	%f0, %f7
fbgt_cont.43487:
	j	fbgt_cont.43481
fbgt_else.43484:
	fmov	%f0, %f7
fbgt_cont.43485:
	j	fbgt_cont.43481
fbgt_else.43482:
	fmov	%f0, %f7
fbgt_cont.43483:
	j	fbgt_cont.43481
fbgt_else.43480:
	fmov	%f0, %f6
fbgt_cont.43481:
	flw	%f1, 77(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.43500
	fblt	%f1, %f0, fbgt_else.43502
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43504
	fblt	%f1, %f0, fbgt_else.43506
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.43501
fbgt_else.43506:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.43507:
	j	fbgt_cont.43501
fbgt_else.43504:
	fmov	%f0, %f1
fbgt_cont.43505:
	j	fbgt_cont.43501
fbgt_else.43502:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43508
	fblt	%f1, %f0, fbgt_else.43510
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.43509
fbgt_else.43510:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.43511:
	j	fbgt_cont.43509
fbgt_else.43508:
	fmov	%f0, %f1
fbgt_cont.43509:
fbgt_cont.43503:
	j	fbgt_cont.43501
fbgt_else.43500:
	fmov	%f0, %f1
fbgt_cont.43501:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.43512
	lw	%v0, 76(%sp)
	beqi	%v0, 0, bnei_else.43514
	addi	%v0, %zero, 0
	j	fbgt_cont.43513
bnei_else.43514:
	addi	%v0, %zero, 1
bnei_cont.43515:
	j	fbgt_cont.43513
fbgt_else.43512:
	lw	%v0, 76(%sp)
fbgt_cont.43513:
	fblt	%f0, %f1, fbgt_else.43516
	fsub	%f0, %f0, %f1
	j	fbgt_cont.43517
fbgt_else.43516:
fbgt_cont.43517:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.43518
	fsub	%f0, %f1, %f0
	j	fbgt_cont.43519
fbgt_else.43518:
fbgt_cont.43519:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.43520
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.43521
fbgt_else.43520:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.43521:
	beqi	%v0, 0, bnei_else.43522
	j	bnei_cont.43523
bnei_else.43522:
	fneg	%f0, %f0
bnei_cont.43523:
	fsw	%f0, 78(%sp)
	sw	%ra, 79(%sp)
	addi	%sp, %sp, 80
	jal	min_caml_read_float
	addi	%sp, %sp, -80
	lw	%ra, 79(%sp)
	flw	%f1, 68(%sp)
	fmul	%f0, %f0, %f1
	fabs	%f2, %f0
	flw	%f3, 72(%sp)
	fsw	%f0, 79(%sp)
	fsw	%f2, 80(%sp)
	fblt	%f2, %f3, fbgt_else.43524
	flw	%f4, 480(%zero)
	fblt	%f2, %f4, fbgt_else.43526
	flw	%f4, 479(%zero)
	fblt	%f2, %f4, fbgt_else.43528
	flw	%f4, 478(%zero)
	fblt	%f2, %f4, fbgt_else.43530
	flw	%f4, 477(%zero)
	fblt	%f2, %f4, fbgt_else.43532
	flw	%f4, 476(%zero)
	fblt	%f2, %f4, fbgt_else.43534
	flw	%f4, 475(%zero)
	fblt	%f2, %f4, fbgt_else.43536
	flw	%f4, 474(%zero)
	fblt	%f2, %f4, fbgt_else.43538
	flw	%f4, 473(%zero)
	fblt	%f2, %f4, fbgt_else.43540
	flw	%f4, 472(%zero)
	fblt	%f2, %f4, fbgt_else.43542
	flw	%f4, 471(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
	j	fbgt_cont.43525
fbgt_else.43542:
	fmov	%f0, %f4
fbgt_cont.43543:
	j	fbgt_cont.43525
fbgt_else.43540:
	fmov	%f0, %f4
fbgt_cont.43541:
	j	fbgt_cont.43525
fbgt_else.43538:
	fmov	%f0, %f4
fbgt_cont.43539:
	j	fbgt_cont.43525
fbgt_else.43536:
	fmov	%f0, %f4
fbgt_cont.43537:
	j	fbgt_cont.43525
fbgt_else.43534:
	fmov	%f0, %f4
fbgt_cont.43535:
	j	fbgt_cont.43525
fbgt_else.43532:
	fmov	%f0, %f4
fbgt_cont.43533:
	j	fbgt_cont.43525
fbgt_else.43530:
	fmov	%f0, %f4
fbgt_cont.43531:
	j	fbgt_cont.43525
fbgt_else.43528:
	fmov	%f0, %f4
fbgt_cont.43529:
	j	fbgt_cont.43525
fbgt_else.43526:
	fmov	%f0, %f4
fbgt_cont.43527:
	j	fbgt_cont.43525
fbgt_else.43524:
	fmov	%f0, %f3
fbgt_cont.43525:
	flw	%f1, 80(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.43544
	fblt	%f1, %f0, fbgt_else.43546
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43548
	fblt	%f1, %f0, fbgt_else.43550
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
	j	fbgt_cont.43545
fbgt_else.43550:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
fbgt_cont.43551:
	j	fbgt_cont.43545
fbgt_else.43548:
	fmov	%f0, %f1
fbgt_cont.43549:
	j	fbgt_cont.43545
fbgt_else.43546:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43552
	fblt	%f1, %f0, fbgt_else.43554
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
	j	fbgt_cont.43553
fbgt_else.43554:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
fbgt_cont.43555:
	j	fbgt_cont.43553
fbgt_else.43552:
	fmov	%f0, %f1
fbgt_cont.43553:
fbgt_cont.43547:
	j	fbgt_cont.43545
fbgt_else.43544:
	fmov	%f0, %f1
fbgt_cont.43545:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.43556
	addi	%v0, %zero, 0
	j	fbgt_cont.43557
fbgt_else.43556:
	addi	%v0, %zero, 1
fbgt_cont.43557:
	fblt	%f0, %f1, fbgt_else.43558
	fsub	%f0, %f0, %f1
	j	fbgt_cont.43559
fbgt_else.43558:
fbgt_cont.43559:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.43560
	beqi	%v0, 0, bnei_else.43562
	addi	%v0, %zero, 0
	j	fbgt_cont.43561
bnei_else.43562:
	addi	%v0, %zero, 1
bnei_cont.43563:
	j	fbgt_cont.43561
fbgt_else.43560:
fbgt_cont.43561:
	fblt	%f0, %f2, fbgt_else.43564
	fsub	%f0, %f1, %f0
	j	fbgt_cont.43565
fbgt_else.43564:
fbgt_cont.43565:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.43566
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.43567
fbgt_else.43566:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.43567:
	beqi	%v0, 0, bnei_else.43568
	j	bnei_cont.43569
bnei_else.43568:
	fneg	%f0, %f0
bnei_cont.43569:
	flw	%f4, 79(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.43570
	addi	%v0, %zero, 1
	j	fbgt_cont.43571
fbgt_else.43570:
	addi	%v0, %zero, 0
fbgt_cont.43571:
	fabs	%f4, %f4
	flw	%f6, 72(%sp)
	fsw	%f0, 81(%sp)
	sw	%v0, 82(%sp)
	fsw	%f4, 83(%sp)
	fblt	%f4, %f6, fbgt_else.43572
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.43574
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.43576
	flw	%f7, 478(%zero)
	fblt	%f4, %f7, fbgt_else.43578
	flw	%f7, 477(%zero)
	fblt	%f4, %f7, fbgt_else.43580
	flw	%f7, 476(%zero)
	fblt	%f4, %f7, fbgt_else.43582
	flw	%f7, 475(%zero)
	fblt	%f4, %f7, fbgt_else.43584
	flw	%f7, 474(%zero)
	fblt	%f4, %f7, fbgt_else.43586
	flw	%f7, 473(%zero)
	fblt	%f4, %f7, fbgt_else.43588
	flw	%f7, 472(%zero)
	fblt	%f4, %f7, fbgt_else.43590
	flw	%f7, 471(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
	j	fbgt_cont.43573
fbgt_else.43590:
	fmov	%f0, %f7
fbgt_cont.43591:
	j	fbgt_cont.43573
fbgt_else.43588:
	fmov	%f0, %f7
fbgt_cont.43589:
	j	fbgt_cont.43573
fbgt_else.43586:
	fmov	%f0, %f7
fbgt_cont.43587:
	j	fbgt_cont.43573
fbgt_else.43584:
	fmov	%f0, %f7
fbgt_cont.43585:
	j	fbgt_cont.43573
fbgt_else.43582:
	fmov	%f0, %f7
fbgt_cont.43583:
	j	fbgt_cont.43573
fbgt_else.43580:
	fmov	%f0, %f7
fbgt_cont.43581:
	j	fbgt_cont.43573
fbgt_else.43578:
	fmov	%f0, %f7
fbgt_cont.43579:
	j	fbgt_cont.43573
fbgt_else.43576:
	fmov	%f0, %f7
fbgt_cont.43577:
	j	fbgt_cont.43573
fbgt_else.43574:
	fmov	%f0, %f7
fbgt_cont.43575:
	j	fbgt_cont.43573
fbgt_else.43572:
	fmov	%f0, %f6
fbgt_cont.43573:
	flw	%f1, 83(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.43592
	fblt	%f1, %f0, fbgt_else.43594
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43596
	fblt	%f1, %f0, fbgt_else.43598
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
	j	fbgt_cont.43593
fbgt_else.43598:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
fbgt_cont.43599:
	j	fbgt_cont.43593
fbgt_else.43596:
	fmov	%f0, %f1
fbgt_cont.43597:
	j	fbgt_cont.43593
fbgt_else.43594:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43600
	fblt	%f1, %f0, fbgt_else.43602
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
	j	fbgt_cont.43601
fbgt_else.43602:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
fbgt_cont.43603:
	j	fbgt_cont.43601
fbgt_else.43600:
	fmov	%f0, %f1
fbgt_cont.43601:
fbgt_cont.43595:
	j	fbgt_cont.43593
fbgt_else.43592:
	fmov	%f0, %f1
fbgt_cont.43593:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.43604
	lw	%v0, 82(%sp)
	beqi	%v0, 0, bnei_else.43606
	addi	%v0, %zero, 0
	j	fbgt_cont.43605
bnei_else.43606:
	addi	%v0, %zero, 1
bnei_cont.43607:
	j	fbgt_cont.43605
fbgt_else.43604:
	lw	%v0, 82(%sp)
fbgt_cont.43605:
	fblt	%f0, %f1, fbgt_else.43608
	fsub	%f0, %f0, %f1
	j	fbgt_cont.43609
fbgt_else.43608:
fbgt_cont.43609:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.43610
	fsub	%f0, %f1, %f0
	j	fbgt_cont.43611
fbgt_else.43610:
fbgt_cont.43611:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.43612
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.43613
fbgt_else.43612:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.43613:
	beqi	%v0, 0, bnei_else.43614
	j	bnei_cont.43615
bnei_else.43614:
	fneg	%f0, %f0
bnei_cont.43615:
	flw	%f4, 73(%sp)
	fmul	%f5, %f4, %f0
	flw	%f6, 436(%zero)
	fmul	%f5, %f5, %f6
	fsw	%f5, 171(%zero)
	flw	%f5, 435(%zero)
	flw	%f7, 78(%sp)
	fmul	%f5, %f7, %f5
	fsw	%f5, 172(%zero)
	flw	%f5, 81(%sp)
	fmul	%f8, %f4, %f5
	fmul	%f6, %f8, %f6
	fsw	%f6, 173(%zero)
	fsw	%f5, 165(%zero)
	flw	%f6, 2(%sp)
	fsw	%f6, 166(%zero)
	fneg	%f8, %f0
	fsw	%f8, 167(%zero)
	fneg	%f8, %f7
	fmul	%f0, %f8, %f0
	fsw	%f0, 168(%zero)
	fneg	%f0, %f4
	fsw	%f0, 169(%zero)
	fneg	%f0, %f7
	fmul	%f0, %f0, %f5
	fsw	%f0, 170(%zero)
	flw	%f0, 72(%zero)
	flw	%f4, 171(%zero)
	fsub	%f0, %f0, %f4
	fsw	%f0, 75(%zero)
	flw	%f0, 73(%zero)
	flw	%f5, 172(%zero)
	fsub	%f0, %f0, %f5
	fsw	%f0, 76(%zero)
	flw	%f0, 74(%zero)
	flw	%f7, 173(%zero)
	fsub	%f0, %f0, %f7
	fsw	%f0, 77(%zero)
	fsw	%f7, 84(%sp)
	fsw	%f5, 85(%sp)
	fsw	%f4, 86(%sp)
	sw	%ra, 87(%sp)
	addi	%sp, %sp, 88
	jal	min_caml_read_int
	addi	%sp, %sp, -88
	lw	%ra, 87(%sp)
	sw	%ra, 87(%sp)
	addi	%sp, %sp, 88
	jal	min_caml_read_float
	addi	%sp, %sp, -88
	lw	%ra, 87(%sp)
	flw	%f1, 68(%sp)
	fmul	%f0, %f0, %f1
	flw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.43616
	addi	%v0, %zero, 1
	j	fbgt_cont.43617
fbgt_else.43616:
	addi	%v0, %zero, 0
fbgt_cont.43617:
	fabs	%f3, %f0
	flw	%f4, 72(%sp)
	fsw	%f0, 87(%sp)
	sw	%v0, 88(%sp)
	fsw	%f3, 89(%sp)
	fblt	%f3, %f4, fbgt_else.43618
	flw	%f5, 480(%zero)
	fblt	%f3, %f5, fbgt_else.43620
	flw	%f5, 479(%zero)
	fblt	%f3, %f5, fbgt_else.43622
	flw	%f5, 478(%zero)
	fblt	%f3, %f5, fbgt_else.43624
	flw	%f5, 477(%zero)
	fblt	%f3, %f5, fbgt_else.43626
	flw	%f5, 476(%zero)
	fblt	%f3, %f5, fbgt_else.43628
	flw	%f5, 475(%zero)
	fblt	%f3, %f5, fbgt_else.43630
	flw	%f5, 474(%zero)
	fblt	%f3, %f5, fbgt_else.43632
	flw	%f5, 473(%zero)
	fblt	%f3, %f5, fbgt_else.43634
	flw	%f5, 472(%zero)
	fblt	%f3, %f5, fbgt_else.43636
	flw	%f5, 471(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	j	fbgt_cont.43619
fbgt_else.43636:
	fmov	%f0, %f5
fbgt_cont.43637:
	j	fbgt_cont.43619
fbgt_else.43634:
	fmov	%f0, %f5
fbgt_cont.43635:
	j	fbgt_cont.43619
fbgt_else.43632:
	fmov	%f0, %f5
fbgt_cont.43633:
	j	fbgt_cont.43619
fbgt_else.43630:
	fmov	%f0, %f5
fbgt_cont.43631:
	j	fbgt_cont.43619
fbgt_else.43628:
	fmov	%f0, %f5
fbgt_cont.43629:
	j	fbgt_cont.43619
fbgt_else.43626:
	fmov	%f0, %f5
fbgt_cont.43627:
	j	fbgt_cont.43619
fbgt_else.43624:
	fmov	%f0, %f5
fbgt_cont.43625:
	j	fbgt_cont.43619
fbgt_else.43622:
	fmov	%f0, %f5
fbgt_cont.43623:
	j	fbgt_cont.43619
fbgt_else.43620:
	fmov	%f0, %f5
fbgt_cont.43621:
	j	fbgt_cont.43619
fbgt_else.43618:
	fmov	%f0, %f4
fbgt_cont.43619:
	flw	%f1, 89(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.43638
	fblt	%f1, %f0, fbgt_else.43640
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43642
	fblt	%f1, %f0, fbgt_else.43644
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	j	fbgt_cont.43639
fbgt_else.43644:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
fbgt_cont.43645:
	j	fbgt_cont.43639
fbgt_else.43642:
	fmov	%f0, %f1
fbgt_cont.43643:
	j	fbgt_cont.43639
fbgt_else.43640:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43646
	fblt	%f1, %f0, fbgt_else.43648
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	j	fbgt_cont.43647
fbgt_else.43648:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
fbgt_cont.43649:
	j	fbgt_cont.43647
fbgt_else.43646:
	fmov	%f0, %f1
fbgt_cont.43647:
fbgt_cont.43641:
	j	fbgt_cont.43639
fbgt_else.43638:
	fmov	%f0, %f1
fbgt_cont.43639:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.43650
	lw	%v0, 88(%sp)
	beqi	%v0, 0, bnei_else.43652
	addi	%v0, %zero, 0
	j	fbgt_cont.43651
bnei_else.43652:
	addi	%v0, %zero, 1
bnei_cont.43653:
	j	fbgt_cont.43651
fbgt_else.43650:
	lw	%v0, 88(%sp)
fbgt_cont.43651:
	fblt	%f0, %f1, fbgt_else.43654
	fsub	%f0, %f0, %f1
	j	fbgt_cont.43655
fbgt_else.43654:
fbgt_cont.43655:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.43656
	fsub	%f0, %f1, %f0
	j	fbgt_cont.43657
fbgt_else.43656:
fbgt_cont.43657:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.43658
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.43659
fbgt_else.43658:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.43659:
	beqi	%v0, 0, bnei_else.43660
	j	bnei_cont.43661
bnei_else.43660:
	fneg	%f0, %f0
bnei_cont.43661:
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	min_caml_read_float
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	flw	%f1, 68(%sp)
	fmul	%f0, %f0, %f1
	flw	%f1, 87(%sp)
	fabs	%f1, %f1
	flw	%f2, 72(%sp)
	fsw	%f0, 90(%sp)
	fsw	%f1, 91(%sp)
	fblt	%f1, %f2, fbgt_else.43662
	flw	%f3, 480(%zero)
	fblt	%f1, %f3, fbgt_else.43664
	flw	%f3, 479(%zero)
	fblt	%f1, %f3, fbgt_else.43666
	flw	%f3, 478(%zero)
	fblt	%f1, %f3, fbgt_else.43668
	flw	%f3, 477(%zero)
	fblt	%f1, %f3, fbgt_else.43670
	flw	%f3, 476(%zero)
	fblt	%f1, %f3, fbgt_else.43672
	flw	%f3, 475(%zero)
	fblt	%f1, %f3, fbgt_else.43674
	flw	%f3, 474(%zero)
	fblt	%f1, %f3, fbgt_else.43676
	flw	%f3, 473(%zero)
	fblt	%f1, %f3, fbgt_else.43678
	flw	%f3, 472(%zero)
	fblt	%f1, %f3, fbgt_else.43680
	flw	%f3, 471(%zero)
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.43663
fbgt_else.43680:
	fmov	%f0, %f3
fbgt_cont.43681:
	j	fbgt_cont.43663
fbgt_else.43678:
	fmov	%f0, %f3
fbgt_cont.43679:
	j	fbgt_cont.43663
fbgt_else.43676:
	fmov	%f0, %f3
fbgt_cont.43677:
	j	fbgt_cont.43663
fbgt_else.43674:
	fmov	%f0, %f3
fbgt_cont.43675:
	j	fbgt_cont.43663
fbgt_else.43672:
	fmov	%f0, %f3
fbgt_cont.43673:
	j	fbgt_cont.43663
fbgt_else.43670:
	fmov	%f0, %f3
fbgt_cont.43671:
	j	fbgt_cont.43663
fbgt_else.43668:
	fmov	%f0, %f3
fbgt_cont.43669:
	j	fbgt_cont.43663
fbgt_else.43666:
	fmov	%f0, %f3
fbgt_cont.43667:
	j	fbgt_cont.43663
fbgt_else.43664:
	fmov	%f0, %f3
fbgt_cont.43665:
	j	fbgt_cont.43663
fbgt_else.43662:
	fmov	%f0, %f2
fbgt_cont.43663:
	flw	%f1, 91(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.43682
	fblt	%f1, %f0, fbgt_else.43684
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43686
	fblt	%f1, %f0, fbgt_else.43688
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.43683
fbgt_else.43688:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.43689:
	j	fbgt_cont.43683
fbgt_else.43686:
	fmov	%f0, %f1
fbgt_cont.43687:
	j	fbgt_cont.43683
fbgt_else.43684:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43690
	fblt	%f1, %f0, fbgt_else.43692
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.43691
fbgt_else.43692:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.43693:
	j	fbgt_cont.43691
fbgt_else.43690:
	fmov	%f0, %f1
fbgt_cont.43691:
fbgt_cont.43685:
	j	fbgt_cont.43683
fbgt_else.43682:
	fmov	%f0, %f1
fbgt_cont.43683:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.43694
	addi	%v0, %zero, 0
	j	fbgt_cont.43695
fbgt_else.43694:
	addi	%v0, %zero, 1
fbgt_cont.43695:
	fblt	%f0, %f1, fbgt_else.43696
	fsub	%f0, %f0, %f1
	j	fbgt_cont.43697
fbgt_else.43696:
fbgt_cont.43697:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.43698
	beqi	%v0, 0, bnei_else.43700
	addi	%v0, %zero, 0
	j	fbgt_cont.43699
bnei_else.43700:
	addi	%v0, %zero, 1
bnei_cont.43701:
	j	fbgt_cont.43699
fbgt_else.43698:
fbgt_cont.43699:
	fblt	%f0, %f2, fbgt_else.43702
	fsub	%f0, %f1, %f0
	j	fbgt_cont.43703
fbgt_else.43702:
fbgt_cont.43703:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.43704
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.43705
fbgt_else.43704:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.43705:
	beqi	%v0, 0, bnei_else.43706
	j	bnei_cont.43707
bnei_else.43706:
	fneg	%f0, %f0
bnei_cont.43707:
	flw	%f4, 90(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.43708
	addi	%v0, %zero, 1
	j	fbgt_cont.43709
fbgt_else.43708:
	addi	%v0, %zero, 0
fbgt_cont.43709:
	fabs	%f6, %f4
	flw	%f7, 72(%sp)
	fsw	%f0, 92(%sp)
	sw	%v0, 93(%sp)
	fsw	%f6, 94(%sp)
	fblt	%f6, %f7, fbgt_else.43710
	flw	%f8, 480(%zero)
	fblt	%f6, %f8, fbgt_else.43712
	flw	%f8, 479(%zero)
	fblt	%f6, %f8, fbgt_else.43714
	flw	%f8, 478(%zero)
	fblt	%f6, %f8, fbgt_else.43716
	flw	%f8, 477(%zero)
	fblt	%f6, %f8, fbgt_else.43718
	flw	%f8, 476(%zero)
	fblt	%f6, %f8, fbgt_else.43720
	flw	%f8, 475(%zero)
	fblt	%f6, %f8, fbgt_else.43722
	flw	%f8, 474(%zero)
	fblt	%f6, %f8, fbgt_else.43724
	flw	%f8, 473(%zero)
	fblt	%f6, %f8, fbgt_else.43726
	flw	%f8, 472(%zero)
	fblt	%f6, %f8, fbgt_else.43728
	flw	%f8, 471(%zero)
	fmov	%f1, %f8
	fmov	%f0, %f6
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
	j	fbgt_cont.43711
fbgt_else.43728:
	fmov	%f0, %f8
fbgt_cont.43729:
	j	fbgt_cont.43711
fbgt_else.43726:
	fmov	%f0, %f8
fbgt_cont.43727:
	j	fbgt_cont.43711
fbgt_else.43724:
	fmov	%f0, %f8
fbgt_cont.43725:
	j	fbgt_cont.43711
fbgt_else.43722:
	fmov	%f0, %f8
fbgt_cont.43723:
	j	fbgt_cont.43711
fbgt_else.43720:
	fmov	%f0, %f8
fbgt_cont.43721:
	j	fbgt_cont.43711
fbgt_else.43718:
	fmov	%f0, %f8
fbgt_cont.43719:
	j	fbgt_cont.43711
fbgt_else.43716:
	fmov	%f0, %f8
fbgt_cont.43717:
	j	fbgt_cont.43711
fbgt_else.43714:
	fmov	%f0, %f8
fbgt_cont.43715:
	j	fbgt_cont.43711
fbgt_else.43712:
	fmov	%f0, %f8
fbgt_cont.43713:
	j	fbgt_cont.43711
fbgt_else.43710:
	fmov	%f0, %f7
fbgt_cont.43711:
	flw	%f1, 94(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.43730
	fblt	%f1, %f0, fbgt_else.43732
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43734
	fblt	%f1, %f0, fbgt_else.43736
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
	j	fbgt_cont.43731
fbgt_else.43736:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
fbgt_cont.43737:
	j	fbgt_cont.43731
fbgt_else.43734:
	fmov	%f0, %f1
fbgt_cont.43735:
	j	fbgt_cont.43731
fbgt_else.43732:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43738
	fblt	%f1, %f0, fbgt_else.43740
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
	j	fbgt_cont.43739
fbgt_else.43740:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
fbgt_cont.43741:
	j	fbgt_cont.43739
fbgt_else.43738:
	fmov	%f0, %f1
fbgt_cont.43739:
fbgt_cont.43733:
	j	fbgt_cont.43731
fbgt_else.43730:
	fmov	%f0, %f1
fbgt_cont.43731:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.43742
	lw	%v0, 93(%sp)
	beqi	%v0, 0, bnei_else.43744
	addi	%v0, %zero, 0
	j	fbgt_cont.43743
bnei_else.43744:
	addi	%v0, %zero, 1
bnei_cont.43745:
	j	fbgt_cont.43743
fbgt_else.43742:
	lw	%v0, 93(%sp)
fbgt_cont.43743:
	fblt	%f0, %f1, fbgt_else.43746
	fsub	%f0, %f0, %f1
	j	fbgt_cont.43747
fbgt_else.43746:
fbgt_cont.43747:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.43748
	fsub	%f0, %f1, %f0
	j	fbgt_cont.43749
fbgt_else.43748:
fbgt_cont.43749:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.43750
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 467(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 466(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 465(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.43751
fbgt_else.43750:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 463(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 462(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.43751:
	beqi	%v0, 0, bnei_else.43752
	j	bnei_cont.43753
bnei_else.43752:
	fneg	%f0, %f0
bnei_cont.43753:
	flw	%f4, 92(%sp)
	fmul	%f0, %f4, %f0
	fsw	%f0, 78(%zero)
	flw	%f0, 90(%sp)
	fabs	%f0, %f0
	flw	%f5, 72(%sp)
	fsw	%f0, 95(%sp)
	fblt	%f0, %f5, fbgt_else.43754
	flw	%f6, 480(%zero)
	fblt	%f0, %f6, fbgt_else.43756
	flw	%f6, 479(%zero)
	fblt	%f0, %f6, fbgt_else.43758
	flw	%f6, 478(%zero)
	fblt	%f0, %f6, fbgt_else.43760
	flw	%f6, 477(%zero)
	fblt	%f0, %f6, fbgt_else.43762
	flw	%f6, 476(%zero)
	fblt	%f0, %f6, fbgt_else.43764
	flw	%f6, 475(%zero)
	fblt	%f0, %f6, fbgt_else.43766
	flw	%f6, 474(%zero)
	fblt	%f0, %f6, fbgt_else.43768
	flw	%f6, 473(%zero)
	fblt	%f0, %f6, fbgt_else.43770
	flw	%f6, 472(%zero)
	fblt	%f0, %f6, fbgt_else.43772
	flw	%f6, 471(%zero)
	fmov	%f1, %f6
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.43755
fbgt_else.43772:
	fmov	%f0, %f6
fbgt_cont.43773:
	j	fbgt_cont.43755
fbgt_else.43770:
	fmov	%f0, %f6
fbgt_cont.43771:
	j	fbgt_cont.43755
fbgt_else.43768:
	fmov	%f0, %f6
fbgt_cont.43769:
	j	fbgt_cont.43755
fbgt_else.43766:
	fmov	%f0, %f6
fbgt_cont.43767:
	j	fbgt_cont.43755
fbgt_else.43764:
	fmov	%f0, %f6
fbgt_cont.43765:
	j	fbgt_cont.43755
fbgt_else.43762:
	fmov	%f0, %f6
fbgt_cont.43763:
	j	fbgt_cont.43755
fbgt_else.43760:
	fmov	%f0, %f6
fbgt_cont.43761:
	j	fbgt_cont.43755
fbgt_else.43758:
	fmov	%f0, %f6
fbgt_cont.43759:
	j	fbgt_cont.43755
fbgt_else.43756:
	fmov	%f0, %f6
fbgt_cont.43757:
	j	fbgt_cont.43755
fbgt_else.43754:
	fmov	%f0, %f5
fbgt_cont.43755:
	flw	%f1, 95(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.43774
	fblt	%f1, %f0, fbgt_else.43776
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43778
	fblt	%f1, %f0, fbgt_else.43780
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.43775
fbgt_else.43780:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.43781:
	j	fbgt_cont.43775
fbgt_else.43778:
	fmov	%f0, %f1
fbgt_cont.43779:
	j	fbgt_cont.43775
fbgt_else.43776:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43782
	fblt	%f1, %f0, fbgt_else.43784
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.43783
fbgt_else.43784:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.43785:
	j	fbgt_cont.43783
fbgt_else.43782:
	fmov	%f0, %f1
fbgt_cont.43783:
fbgt_cont.43777:
	j	fbgt_cont.43775
fbgt_else.43774:
	fmov	%f0, %f1
fbgt_cont.43775:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.43786
	addi	%v0, %zero, 0
	j	fbgt_cont.43787
fbgt_else.43786:
	addi	%v0, %zero, 1
fbgt_cont.43787:
	fblt	%f0, %f1, fbgt_else.43788
	fsub	%f0, %f0, %f1
	j	fbgt_cont.43789
fbgt_else.43788:
fbgt_cont.43789:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.43790
	beqi	%v0, 0, bnei_else.43792
	addi	%v0, %zero, 0
	j	fbgt_cont.43791
bnei_else.43792:
	addi	%v0, %zero, 1
bnei_cont.43793:
	j	fbgt_cont.43791
fbgt_else.43790:
fbgt_cont.43791:
	fblt	%f0, %f2, fbgt_else.43794
	fsub	%f0, %f1, %f0
	j	fbgt_cont.43795
fbgt_else.43794:
fbgt_cont.43795:
	flw	%f1, 74(%sp)
	fblt	%f1, %f0, fbgt_else.43796
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 484(%zero)
	flw	%f3, 464(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 463(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 462(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.43797
fbgt_else.43796:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 467(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 466(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 465(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.43797:
	beqi	%v0, 0, bnei_else.43798
	j	bnei_cont.43799
bnei_else.43798:
	fneg	%f0, %f0
bnei_cont.43799:
	flw	%f1, 92(%sp)
	fmul	%f0, %f1, %f0
	fsw	%f0, 80(%zero)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	min_caml_read_float
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	fsw	%f0, 81(%zero)
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_nth_object.2770
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	beqi	%v0, 0, bnei_else.43800
	lw	%v0, 0(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_nth_object.2770
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	beqi	%v0, 0, bnei_else.43802
	lw	%v0, 6(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_nth_object.2770
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	beqi	%v0, 0, bnei_else.43804
	lw	%v0, 4(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_nth_object.2770
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	beqi	%v0, 0, bnei_else.43806
	lw	%v0, 14(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_object.2772
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	bnei_cont.43801
bnei_else.43806:
	lw	%v0, 4(%sp)
	sw	%v0, 0(%zero)
bnei_cont.43807:
	j	bnei_cont.43801
bnei_else.43804:
	lw	%v0, 6(%sp)
	sw	%v0, 0(%zero)
bnei_cont.43805:
	j	bnei_cont.43801
bnei_else.43802:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
bnei_cont.43803:
	j	bnei_cont.43801
bnei_else.43800:
	lw	%v0, 1(%sp)
	sw	%v0, 0(%zero)
bnei_cont.43801:
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_net_item.2776
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.43808
	sw	%v0, 83(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_and_network.2780
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	bnei_cont.43809
bnei_else.43808:
bnei_cont.43809:
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_net_item.2776
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.43810
	lw	%v0, 0(%sp)
	sw	%v1, 96(%sp)
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	read_or_network.2778
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
	lw	%v1, 96(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.43811
bnei_else.43810:
	lw	%v0, 0(%sp)
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	min_caml_create_array
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
bnei_cont.43811:
	sw	%v0, 134(%zero)
	addi	%v0, %zero, 80
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	min_caml_print_char
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
	addi	%v0, %zero, 51
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	min_caml_print_char
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
	addi	%v0, %zero, 10
	sw	%v0, 97(%sp)
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	min_caml_print_char
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
	lw	%v0, 11(%sp)
	blti	%v0, 10, bgti_else.43812
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.43814
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43816
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43818
	addi	%v1, %v1, -10
	lw	%a0, 14(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	print_int_sub1.2629
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
	j	bgti_cont.43813
bgti_else.43818:
	addi	%v0, %zero, 3
bgti_cont.43819:
	j	bgti_cont.43813
bgti_else.43816:
	addi	%v0, %zero, 2
bgti_cont.43817:
	j	bgti_cont.43813
bgti_else.43814:
	addi	%v0, %zero, 1
bgti_cont.43815:
	j	bgti_cont.43813
bgti_else.43812:
	addi	%v0, %zero, 0
bgti_cont.43813:
	lw	%v1, 11(%sp)
	sw	%v0, 98(%sp)
	blti	%v1, 10, bgti_else.43820
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.43822
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43824
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43826
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43828
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43830
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43832
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43834
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43836
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43838
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43840
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43842
	addi	%a0, %a0, -10
	addi	%v0, %a0, 0
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	print_int_sub2.2632
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	bgti_cont.43821
bgti_else.43842:
	add	%v0, %zero, %a0
bgti_cont.43843:
	j	bgti_cont.43821
bgti_else.43840:
	add	%v0, %zero, %a0
bgti_cont.43841:
	j	bgti_cont.43821
bgti_else.43838:
	add	%v0, %zero, %a0
bgti_cont.43839:
	j	bgti_cont.43821
bgti_else.43836:
	add	%v0, %zero, %a0
bgti_cont.43837:
	j	bgti_cont.43821
bgti_else.43834:
	add	%v0, %zero, %a0
bgti_cont.43835:
	j	bgti_cont.43821
bgti_else.43832:
	add	%v0, %zero, %a0
bgti_cont.43833:
	j	bgti_cont.43821
bgti_else.43830:
	add	%v0, %zero, %a0
bgti_cont.43831:
	j	bgti_cont.43821
bgti_else.43828:
	add	%v0, %zero, %a0
bgti_cont.43829:
	j	bgti_cont.43821
bgti_else.43826:
	add	%v0, %zero, %a0
bgti_cont.43827:
	j	bgti_cont.43821
bgti_else.43824:
	add	%v0, %zero, %a0
bgti_cont.43825:
	j	bgti_cont.43821
bgti_else.43822:
	add	%v0, %zero, %a0
bgti_cont.43823:
	j	bgti_cont.43821
bgti_else.43820:
	add	%v0, %zero, %v1
bgti_cont.43821:
	lw	%v1, 98(%sp)
	blt	%zero, %v1, bgt_else.43844
	addi	%v0, %v0, 48
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	min_caml_print_char
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	bgt_cont.43845
bgt_else.43844:
	sw	%v0, 99(%sp)
	blti	%v1, 10, bgti_else.43846
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.43848
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43850
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43852
	addi	%a0, %a0, -10
	lw	%a1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 100(%sp)
	addi	%sp, %sp, 101
	jal	print_int_sub1.2629
	addi	%sp, %sp, -101
	lw	%ra, 100(%sp)
	j	bgti_cont.43847
bgti_else.43852:
	addi	%v0, %zero, 3
bgti_cont.43853:
	j	bgti_cont.43847
bgti_else.43850:
	addi	%v0, %zero, 2
bgti_cont.43851:
	j	bgti_cont.43847
bgti_else.43848:
	addi	%v0, %zero, 1
bgti_cont.43849:
	j	bgti_cont.43847
bgti_else.43846:
	addi	%v0, %zero, 0
bgti_cont.43847:
	lw	%v1, 98(%sp)
	sw	%v0, 100(%sp)
	blti	%v1, 10, bgti_else.43854
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43856
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43858
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43860
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43862
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43864
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43866
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43868
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43870
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43872
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43874
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43876
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 101(%sp)
	addi	%sp, %sp, 102
	jal	print_int_sub2.2632
	addi	%sp, %sp, -102
	lw	%ra, 101(%sp)
	j	bgti_cont.43855
bgti_else.43876:
	add	%v0, %zero, %v1
bgti_cont.43877:
	j	bgti_cont.43855
bgti_else.43874:
	add	%v0, %zero, %v1
bgti_cont.43875:
	j	bgti_cont.43855
bgti_else.43872:
	add	%v0, %zero, %v1
bgti_cont.43873:
	j	bgti_cont.43855
bgti_else.43870:
	add	%v0, %zero, %v1
bgti_cont.43871:
	j	bgti_cont.43855
bgti_else.43868:
	add	%v0, %zero, %v1
bgti_cont.43869:
	j	bgti_cont.43855
bgti_else.43866:
	add	%v0, %zero, %v1
bgti_cont.43867:
	j	bgti_cont.43855
bgti_else.43864:
	add	%v0, %zero, %v1
bgti_cont.43865:
	j	bgti_cont.43855
bgti_else.43862:
	add	%v0, %zero, %v1
bgti_cont.43863:
	j	bgti_cont.43855
bgti_else.43860:
	add	%v0, %zero, %v1
bgti_cont.43861:
	j	bgti_cont.43855
bgti_else.43858:
	add	%v0, %zero, %v1
bgti_cont.43859:
	j	bgti_cont.43855
bgti_else.43856:
	add	%v0, %zero, %v1
bgti_cont.43857:
	j	bgti_cont.43855
bgti_else.43854:
	add	%v0, %zero, %v1
bgti_cont.43855:
	lw	%v1, 100(%sp)
	blt	%zero, %v1, bgt_else.43878
	addi	%v0, %v0, 48
	sw	%ra, 101(%sp)
	addi	%sp, %sp, 102
	jal	min_caml_print_char
	addi	%sp, %sp, -102
	lw	%ra, 101(%sp)
	lw	%v0, 99(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 101(%sp)
	addi	%sp, %sp, 102
	jal	min_caml_print_char
	addi	%sp, %sp, -102
	lw	%ra, 101(%sp)
	j	bgt_cont.43879
bgt_else.43878:
	sw	%v0, 101(%sp)
	blti	%v1, 10, bgti_else.43880
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43882
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43884
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43886
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43888
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43890
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43892
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43894
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43896
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43898
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43900
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43902
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	print_int_sub2.2632
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	j	bgti_cont.43881
bgti_else.43902:
	add	%v0, %zero, %v1
bgti_cont.43903:
	j	bgti_cont.43881
bgti_else.43900:
	add	%v0, %zero, %v1
bgti_cont.43901:
	j	bgti_cont.43881
bgti_else.43898:
	add	%v0, %zero, %v1
bgti_cont.43899:
	j	bgti_cont.43881
bgti_else.43896:
	add	%v0, %zero, %v1
bgti_cont.43897:
	j	bgti_cont.43881
bgti_else.43894:
	add	%v0, %zero, %v1
bgti_cont.43895:
	j	bgti_cont.43881
bgti_else.43892:
	add	%v0, %zero, %v1
bgti_cont.43893:
	j	bgti_cont.43881
bgti_else.43890:
	add	%v0, %zero, %v1
bgti_cont.43891:
	j	bgti_cont.43881
bgti_else.43888:
	add	%v0, %zero, %v1
bgti_cont.43889:
	j	bgti_cont.43881
bgti_else.43886:
	add	%v0, %zero, %v1
bgti_cont.43887:
	j	bgti_cont.43881
bgti_else.43884:
	add	%v0, %zero, %v1
bgti_cont.43885:
	j	bgti_cont.43881
bgti_else.43882:
	add	%v0, %zero, %v1
bgti_cont.43883:
	j	bgti_cont.43881
bgti_else.43880:
	add	%v0, %zero, %v1
bgti_cont.43881:
	addi	%v0, %v0, 48
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	min_caml_print_char
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	lw	%v0, 101(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	min_caml_print_char
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	lw	%v0, 99(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	min_caml_print_char
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
bgt_cont.43879:
bgt_cont.43845:
	addi	%v0, %zero, 32
	sw	%v0, 102(%sp)
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	min_caml_print_char
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
	lw	%v0, 155(%zero)
	sw	%v0, 103(%sp)
	blti	%v0, 10, bgti_else.43904
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.43906
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43908
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43910
	addi	%v1, %v1, -10
	lw	%a0, 14(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 104(%sp)
	addi	%sp, %sp, 105
	jal	print_int_sub1.2629
	addi	%sp, %sp, -105
	lw	%ra, 104(%sp)
	j	bgti_cont.43905
bgti_else.43910:
	addi	%v0, %zero, 3
bgti_cont.43911:
	j	bgti_cont.43905
bgti_else.43908:
	addi	%v0, %zero, 2
bgti_cont.43909:
	j	bgti_cont.43905
bgti_else.43906:
	addi	%v0, %zero, 1
bgti_cont.43907:
	j	bgti_cont.43905
bgti_else.43904:
	addi	%v0, %zero, 0
bgti_cont.43905:
	lw	%v1, 103(%sp)
	sw	%v0, 104(%sp)
	blti	%v1, 10, bgti_else.43912
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43914
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43916
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43918
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43920
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43922
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43924
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43926
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43928
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43930
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43932
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43934
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 105(%sp)
	addi	%sp, %sp, 106
	jal	print_int_sub2.2632
	addi	%sp, %sp, -106
	lw	%ra, 105(%sp)
	j	bgti_cont.43913
bgti_else.43934:
	add	%v0, %zero, %v1
bgti_cont.43935:
	j	bgti_cont.43913
bgti_else.43932:
	add	%v0, %zero, %v1
bgti_cont.43933:
	j	bgti_cont.43913
bgti_else.43930:
	add	%v0, %zero, %v1
bgti_cont.43931:
	j	bgti_cont.43913
bgti_else.43928:
	add	%v0, %zero, %v1
bgti_cont.43929:
	j	bgti_cont.43913
bgti_else.43926:
	add	%v0, %zero, %v1
bgti_cont.43927:
	j	bgti_cont.43913
bgti_else.43924:
	add	%v0, %zero, %v1
bgti_cont.43925:
	j	bgti_cont.43913
bgti_else.43922:
	add	%v0, %zero, %v1
bgti_cont.43923:
	j	bgti_cont.43913
bgti_else.43920:
	add	%v0, %zero, %v1
bgti_cont.43921:
	j	bgti_cont.43913
bgti_else.43918:
	add	%v0, %zero, %v1
bgti_cont.43919:
	j	bgti_cont.43913
bgti_else.43916:
	add	%v0, %zero, %v1
bgti_cont.43917:
	j	bgti_cont.43913
bgti_else.43914:
	add	%v0, %zero, %v1
bgti_cont.43915:
	j	bgti_cont.43913
bgti_else.43912:
	add	%v0, %zero, %v1
bgti_cont.43913:
	lw	%v1, 104(%sp)
	blt	%zero, %v1, bgt_else.43936
	addi	%v0, %v0, 48
	sw	%ra, 105(%sp)
	addi	%sp, %sp, 106
	jal	min_caml_print_char
	addi	%sp, %sp, -106
	lw	%ra, 105(%sp)
	j	bgt_cont.43937
bgt_else.43936:
	sw	%v0, 105(%sp)
	blti	%v1, 10, bgti_else.43938
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.43940
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43942
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.43944
	addi	%a0, %a0, -10
	lw	%a1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 106(%sp)
	addi	%sp, %sp, 107
	jal	print_int_sub1.2629
	addi	%sp, %sp, -107
	lw	%ra, 106(%sp)
	j	bgti_cont.43939
bgti_else.43944:
	addi	%v0, %zero, 3
bgti_cont.43945:
	j	bgti_cont.43939
bgti_else.43942:
	addi	%v0, %zero, 2
bgti_cont.43943:
	j	bgti_cont.43939
bgti_else.43940:
	addi	%v0, %zero, 1
bgti_cont.43941:
	j	bgti_cont.43939
bgti_else.43938:
	addi	%v0, %zero, 0
bgti_cont.43939:
	lw	%v1, 104(%sp)
	sw	%v0, 106(%sp)
	blti	%v1, 10, bgti_else.43946
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43948
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43950
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43952
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43954
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43956
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43958
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43960
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43962
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43964
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43966
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43968
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 107(%sp)
	addi	%sp, %sp, 108
	jal	print_int_sub2.2632
	addi	%sp, %sp, -108
	lw	%ra, 107(%sp)
	j	bgti_cont.43947
bgti_else.43968:
	add	%v0, %zero, %v1
bgti_cont.43969:
	j	bgti_cont.43947
bgti_else.43966:
	add	%v0, %zero, %v1
bgti_cont.43967:
	j	bgti_cont.43947
bgti_else.43964:
	add	%v0, %zero, %v1
bgti_cont.43965:
	j	bgti_cont.43947
bgti_else.43962:
	add	%v0, %zero, %v1
bgti_cont.43963:
	j	bgti_cont.43947
bgti_else.43960:
	add	%v0, %zero, %v1
bgti_cont.43961:
	j	bgti_cont.43947
bgti_else.43958:
	add	%v0, %zero, %v1
bgti_cont.43959:
	j	bgti_cont.43947
bgti_else.43956:
	add	%v0, %zero, %v1
bgti_cont.43957:
	j	bgti_cont.43947
bgti_else.43954:
	add	%v0, %zero, %v1
bgti_cont.43955:
	j	bgti_cont.43947
bgti_else.43952:
	add	%v0, %zero, %v1
bgti_cont.43953:
	j	bgti_cont.43947
bgti_else.43950:
	add	%v0, %zero, %v1
bgti_cont.43951:
	j	bgti_cont.43947
bgti_else.43948:
	add	%v0, %zero, %v1
bgti_cont.43949:
	j	bgti_cont.43947
bgti_else.43946:
	add	%v0, %zero, %v1
bgti_cont.43947:
	lw	%v1, 106(%sp)
	blt	%zero, %v1, bgt_else.43970
	addi	%v0, %v0, 48
	sw	%ra, 107(%sp)
	addi	%sp, %sp, 108
	jal	min_caml_print_char
	addi	%sp, %sp, -108
	lw	%ra, 107(%sp)
	lw	%v0, 105(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 107(%sp)
	addi	%sp, %sp, 108
	jal	min_caml_print_char
	addi	%sp, %sp, -108
	lw	%ra, 107(%sp)
	j	bgt_cont.43971
bgt_else.43970:
	sw	%v0, 107(%sp)
	blti	%v1, 10, bgti_else.43972
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43974
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43976
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43978
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43980
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43982
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43984
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43986
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43988
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43990
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43992
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.43994
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	print_int_sub2.2632
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	j	bgti_cont.43973
bgti_else.43994:
	add	%v0, %zero, %v1
bgti_cont.43995:
	j	bgti_cont.43973
bgti_else.43992:
	add	%v0, %zero, %v1
bgti_cont.43993:
	j	bgti_cont.43973
bgti_else.43990:
	add	%v0, %zero, %v1
bgti_cont.43991:
	j	bgti_cont.43973
bgti_else.43988:
	add	%v0, %zero, %v1
bgti_cont.43989:
	j	bgti_cont.43973
bgti_else.43986:
	add	%v0, %zero, %v1
bgti_cont.43987:
	j	bgti_cont.43973
bgti_else.43984:
	add	%v0, %zero, %v1
bgti_cont.43985:
	j	bgti_cont.43973
bgti_else.43982:
	add	%v0, %zero, %v1
bgti_cont.43983:
	j	bgti_cont.43973
bgti_else.43980:
	add	%v0, %zero, %v1
bgti_cont.43981:
	j	bgti_cont.43973
bgti_else.43978:
	add	%v0, %zero, %v1
bgti_cont.43979:
	j	bgti_cont.43973
bgti_else.43976:
	add	%v0, %zero, %v1
bgti_cont.43977:
	j	bgti_cont.43973
bgti_else.43974:
	add	%v0, %zero, %v1
bgti_cont.43975:
	j	bgti_cont.43973
bgti_else.43972:
	add	%v0, %zero, %v1
bgti_cont.43973:
	addi	%v0, %v0, 48
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	min_caml_print_char
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	lw	%v0, 107(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	min_caml_print_char
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	lw	%v0, 105(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	min_caml_print_char
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
bgt_cont.43971:
bgt_cont.43937:
	lw	%v0, 102(%sp)
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	min_caml_print_char
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	addi	%v0, %zero, 215
	lw	%v1, 14(%sp)
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	print_int_sub1.2629
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	addi	%v1, %zero, 135
	sw	%v0, 108(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	print_int_sub2.2632
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
	lw	%v1, 108(%sp)
	blt	%zero, %v1, bgt_else.43996
	addi	%v0, %v0, 48
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	min_caml_print_char
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
	j	bgt_cont.43997
bgt_else.43996:
	sw	%v0, 109(%sp)
	blti	%v1, 10, bgti_else.43998
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.44000
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.44002
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.44004
	addi	%a0, %a0, -10
	lw	%a1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 110(%sp)
	addi	%sp, %sp, 111
	jal	print_int_sub1.2629
	addi	%sp, %sp, -111
	lw	%ra, 110(%sp)
	j	bgti_cont.43999
bgti_else.44004:
	addi	%v0, %zero, 3
bgti_cont.44005:
	j	bgti_cont.43999
bgti_else.44002:
	addi	%v0, %zero, 2
bgti_cont.44003:
	j	bgti_cont.43999
bgti_else.44000:
	addi	%v0, %zero, 1
bgti_cont.44001:
	j	bgti_cont.43999
bgti_else.43998:
	addi	%v0, %zero, 0
bgti_cont.43999:
	lw	%v1, 108(%sp)
	sw	%v0, 110(%sp)
	blti	%v1, 10, bgti_else.44006
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44008
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44010
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44012
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44014
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44016
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44018
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44020
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44022
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44024
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44026
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44028
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 111(%sp)
	addi	%sp, %sp, 112
	jal	print_int_sub2.2632
	addi	%sp, %sp, -112
	lw	%ra, 111(%sp)
	j	bgti_cont.44007
bgti_else.44028:
	add	%v0, %zero, %v1
bgti_cont.44029:
	j	bgti_cont.44007
bgti_else.44026:
	add	%v0, %zero, %v1
bgti_cont.44027:
	j	bgti_cont.44007
bgti_else.44024:
	add	%v0, %zero, %v1
bgti_cont.44025:
	j	bgti_cont.44007
bgti_else.44022:
	add	%v0, %zero, %v1
bgti_cont.44023:
	j	bgti_cont.44007
bgti_else.44020:
	add	%v0, %zero, %v1
bgti_cont.44021:
	j	bgti_cont.44007
bgti_else.44018:
	add	%v0, %zero, %v1
bgti_cont.44019:
	j	bgti_cont.44007
bgti_else.44016:
	add	%v0, %zero, %v1
bgti_cont.44017:
	j	bgti_cont.44007
bgti_else.44014:
	add	%v0, %zero, %v1
bgti_cont.44015:
	j	bgti_cont.44007
bgti_else.44012:
	add	%v0, %zero, %v1
bgti_cont.44013:
	j	bgti_cont.44007
bgti_else.44010:
	add	%v0, %zero, %v1
bgti_cont.44011:
	j	bgti_cont.44007
bgti_else.44008:
	add	%v0, %zero, %v1
bgti_cont.44009:
	j	bgti_cont.44007
bgti_else.44006:
	add	%v0, %zero, %v1
bgti_cont.44007:
	lw	%v1, 110(%sp)
	blt	%zero, %v1, bgt_else.44030
	addi	%v0, %v0, 48
	sw	%ra, 111(%sp)
	addi	%sp, %sp, 112
	jal	min_caml_print_char
	addi	%sp, %sp, -112
	lw	%ra, 111(%sp)
	lw	%v0, 109(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 111(%sp)
	addi	%sp, %sp, 112
	jal	min_caml_print_char
	addi	%sp, %sp, -112
	lw	%ra, 111(%sp)
	j	bgt_cont.44031
bgt_else.44030:
	sw	%v0, 111(%sp)
	blti	%v1, 10, bgti_else.44032
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44034
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44036
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44038
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44040
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44042
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44044
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44046
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44048
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44050
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44052
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.44054
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	print_int_sub2.2632
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	j	bgti_cont.44033
bgti_else.44054:
	add	%v0, %zero, %v1
bgti_cont.44055:
	j	bgti_cont.44033
bgti_else.44052:
	add	%v0, %zero, %v1
bgti_cont.44053:
	j	bgti_cont.44033
bgti_else.44050:
	add	%v0, %zero, %v1
bgti_cont.44051:
	j	bgti_cont.44033
bgti_else.44048:
	add	%v0, %zero, %v1
bgti_cont.44049:
	j	bgti_cont.44033
bgti_else.44046:
	add	%v0, %zero, %v1
bgti_cont.44047:
	j	bgti_cont.44033
bgti_else.44044:
	add	%v0, %zero, %v1
bgti_cont.44045:
	j	bgti_cont.44033
bgti_else.44042:
	add	%v0, %zero, %v1
bgti_cont.44043:
	j	bgti_cont.44033
bgti_else.44040:
	add	%v0, %zero, %v1
bgti_cont.44041:
	j	bgti_cont.44033
bgti_else.44038:
	add	%v0, %zero, %v1
bgti_cont.44039:
	j	bgti_cont.44033
bgti_else.44036:
	add	%v0, %zero, %v1
bgti_cont.44037:
	j	bgti_cont.44033
bgti_else.44034:
	add	%v0, %zero, %v1
bgti_cont.44035:
	j	bgti_cont.44033
bgti_else.44032:
	add	%v0, %zero, %v1
bgti_cont.44033:
	addi	%v0, %v0, 48
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	min_caml_print_char
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	lw	%v0, 111(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	min_caml_print_char
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	lw	%v0, 109(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	min_caml_print_char
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
bgt_cont.44031:
bgt_cont.43997:
	lw	%v0, 97(%sp)
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	min_caml_print_char
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	addi	%v0, %zero, 120
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 112(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 113(%sp)
	addi	%sp, %sp, 114
	jal	min_caml_create_float_array
	addi	%sp, %sp, -114
	lw	%ra, 113(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)
	sw	%v0, 113(%sp)
	sw	%v1, 114(%sp)
	sw	%ra, 115(%sp)
	addi	%sp, %sp, 116
	jal	min_caml_create_array
	addi	%sp, %sp, -116
	lw	%ra, 115(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 114(%sp)
	sw	%v0, 0(%v1)
	lw	%v0, 112(%sp)
	sw	%ra, 115(%sp)
	addi	%sp, %sp, 116
	jal	min_caml_create_array
	addi	%sp, %sp, -116
	lw	%ra, 115(%sp)
	sw	%v0, 183(%zero)
	lw	%v0, 183(%zero)
	addi	%v1, %zero, 118
	sw	%v0, 115(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	create_dirvec_elements.3090
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	create_dirvecs.3093
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	addi	%v0, %zero, 9
	itof	%f0, %v0
	flw	%f1, 491(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 438(%zero)
	fsub	%f0, %f0, %f1
	lw	%v0, 14(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %v1, 0
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	calc_dirvecs.3079
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 6(%sp)
	lw	%a0, 14(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	calc_dirvec_rows.3084
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	addi	%v1, %zero, 119
	lw	%v0, 115(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	init_vecset_constants.3098
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	flw	%f0, 78(%zero)
	fsw	%f0, 184(%zero)
	flw	%f1, 79(%zero)
	fsw	%f1, 185(%zero)
	flw	%f2, 80(%zero)
	fsw	%f2, 186(%zero)
	lw	%v0, 113(%sp)
	addi	%v1, %v0, -1
	fsw	%f2, 116(%sp)
	fsw	%f1, 117(%sp)
	fsw	%f0, 118(%sp)
	sw	%v1, 119(%sp)
	blti	%v1, 0, bgti_else.44056
	lw	%a0, 12(%v1)
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.44058
	beqi	%a1, 2, bnei_else.44060
	flw	%f3, 2(%sp)
	lw	%a1, 8(%sp)
	sw	%a0, 120(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f3
	sw	%ra, 121(%sp)
	addi	%sp, %sp, 122
	jal	min_caml_create_float_array
	addi	%sp, %sp, -122
	lw	%ra, 121(%sp)
	flw	%f0, 184(%zero)
	flw	%f1, 185(%zero)
	flw	%f2, 186(%zero)
	fmul	%f3, %f0, %f0
	lw	%v1, 120(%sp)
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lw	%a0, 4(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.44062
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)
	flw	%f5, 0(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0
	lw	%a0, 9(%v1)
	flw	%f5, 1(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1
	lw	%a0, 9(%v1)
	flw	%f5, 2(%a0)
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	j	bnei_cont.44063
bnei_else.44062:
bnei_cont.44063:
	lw	%a0, 4(%v1)
	flw	%f4, 0(%a0)
	fmul	%f4, %f0, %f4
	fneg	%f4, %f4
	lw	%a0, 4(%v1)
	flw	%f5, 1(%a0)
	fmul	%f5, %f1, %f5
	fneg	%f5, %f5
	lw	%a0, 4(%v1)
	flw	%f6, 2(%a0)
	fmul	%f6, %f2, %f6
	fneg	%f6, %f6
	fsw	%f3, 0(%v0)
	lw	%a0, 3(%v1)
	beqi	%a0, 0, bnei_else.44064
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 464(%zero)
	fmul	%f7, %f7, %f8
	fsub	%f4, %f4, %f7
	fsw	%f4, 1(%v0)
	lw	%a0, 9(%v1)
	flw	%f4, 0(%a0)
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)
	flw	%f4, 2(%a0)
	fmul	%f4, %f0, %f4
	fadd	%f2, %f2, %f4
	fmul	%f2, %f2, %f8
	fsub	%f2, %f5, %f2
	fsw	%f2, 2(%v0)
	lw	%a0, 9(%v1)
	flw	%f2, 0(%a0)
	fmul	%f1, %f1, %f2
	lw	%v1, 9(%v1)
	flw	%f2, 1(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f8
	fsub	%f0, %f6, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.44065
bnei_else.44064:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.44065:
	flw	%f0, 2(%sp)
	fbne	%f3, %f0, fbeq_else.44066
	addi	%v1, %zero, 1
	j	fbeq_cont.44067
fbeq_else.44066:
	addi	%v1, %zero, 0
fbeq_cont.44067:
	beqi	%v1, 0, bnei_else.44068
	j	bnei_cont.44069
bnei_else.44068:
	flw	%f1, 484(%zero)
	fdiv	%f1, %f1, %f3
	fsw	%f1, 4(%v0)
bnei_cont.44069:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
	j	bnei_cont.44059
bnei_else.44060:
	flw	%f3, 2(%sp)
	lw	%a1, 14(%sp)
	sw	%a0, 120(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f3
	sw	%ra, 121(%sp)
	addi	%sp, %sp, 122
	jal	min_caml_create_float_array
	addi	%sp, %sp, -122
	lw	%ra, 121(%sp)
	flw	%f0, 184(%zero)
	lw	%v1, 120(%sp)
	lw	%a0, 4(%v1)
	flw	%f1, 0(%a0)
	fmul	%f0, %f0, %f1
	flw	%f1, 185(%zero)
	lw	%a0, 4(%v1)
	flw	%f2, 1(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 186(%zero)
	lw	%a0, 4(%v1)
	flw	%f2, 2(%a0)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%sp)
	fblt	%f1, %f0, fbgt_else.44070
	addi	%a0, %zero, 0
	j	fbgt_cont.44071
fbgt_else.44070:
	addi	%a0, %zero, 1
fbgt_cont.44071:
	beqi	%a0, 0, bnei_else.44072
	flw	%f2, 460(%zero)
	fdiv	%f2, %f2, %f0
	fsw	%f2, 0(%v0)
	lw	%a0, 4(%v1)
	flw	%f2, 0(%a0)
	fdiv	%f2, %f2, %f0
	fneg	%f2, %f2
	fsw	%f2, 1(%v0)
	lw	%a0, 4(%v1)
	flw	%f2, 1(%a0)
	fdiv	%f2, %f2, %f0
	fneg	%f2, %f2
	fsw	%f2, 2(%v0)
	lw	%v1, 4(%v1)
	flw	%f2, 2(%v1)
	fdiv	%f0, %f2, %f0
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.44073
bnei_else.44072:
	fsw	%f1, 0(%v0)
bnei_cont.44073:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
bnei_cont.44061:
	j	bnei_cont.44059
bnei_else.44058:
	addi	%a1, %zero, 6
	flw	%f3, 2(%sp)
	sw	%a0, 120(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f3
	sw	%ra, 121(%sp)
	addi	%sp, %sp, 122
	jal	min_caml_create_float_array
	addi	%sp, %sp, -122
	lw	%ra, 121(%sp)
	flw	%f0, 184(%zero)
	flw	%f1, 2(%sp)
	fbne	%f0, %f1, fbeq_else.44074
	addi	%v1, %zero, 1
	j	fbeq_cont.44075
fbeq_else.44074:
	addi	%v1, %zero, 0
fbeq_cont.44075:
	beqi	%v1, 0, bnei_else.44076
	fsw	%f1, 1(%v0)
	j	bnei_cont.44077
bnei_else.44076:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.44078
	addi	%a1, %zero, 0
	j	fbgt_cont.44079
fbgt_else.44078:
	addi	%a1, %zero, 1
fbgt_cont.44079:
	beqi	%a0, 0, bnei_else.44080
	beqi	%a1, 0, bnei_else.44082
	addi	%a0, %zero, 0
	j	bnei_cont.44081
bnei_else.44082:
	addi	%a0, %zero, 1
bnei_cont.44083:
	j	bnei_cont.44081
bnei_else.44080:
	add	%a0, %zero, %a1
bnei_cont.44081:
	lw	%a1, 4(%v1)
	flw	%f2, 0(%a1)
	beqi	%a0, 0, bnei_else.44084
	j	bnei_cont.44085
bnei_else.44084:
	fneg	%f2, %f2
bnei_cont.44085:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.44077:
	flw	%f0, 185(%zero)
	fbne	%f0, %f1, fbeq_else.44086
	addi	%v1, %zero, 1
	j	fbeq_cont.44087
fbeq_else.44086:
	addi	%v1, %zero, 0
fbeq_cont.44087:
	beqi	%v1, 0, bnei_else.44088
	fsw	%f1, 3(%v0)
	j	bnei_cont.44089
bnei_else.44088:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.44090
	addi	%a1, %zero, 0
	j	fbgt_cont.44091
fbgt_else.44090:
	addi	%a1, %zero, 1
fbgt_cont.44091:
	beqi	%a0, 0, bnei_else.44092
	beqi	%a1, 0, bnei_else.44094
	addi	%a0, %zero, 0
	j	bnei_cont.44093
bnei_else.44094:
	addi	%a0, %zero, 1
bnei_cont.44095:
	j	bnei_cont.44093
bnei_else.44092:
	add	%a0, %zero, %a1
bnei_cont.44093:
	lw	%a1, 4(%v1)
	flw	%f2, 1(%a1)
	beqi	%a0, 0, bnei_else.44096
	j	bnei_cont.44097
bnei_else.44096:
	fneg	%f2, %f2
bnei_cont.44097:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.44089:
	flw	%f0, 186(%zero)
	fbne	%f0, %f1, fbeq_else.44098
	addi	%v1, %zero, 1
	j	fbeq_cont.44099
fbeq_else.44098:
	addi	%v1, %zero, 0
fbeq_cont.44099:
	beqi	%v1, 0, bnei_else.44100
	fsw	%f1, 5(%v0)
	j	bnei_cont.44101
bnei_else.44100:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.44102
	addi	%a1, %zero, 0
	j	fbgt_cont.44103
fbgt_else.44102:
	addi	%a1, %zero, 1
fbgt_cont.44103:
	beqi	%a0, 0, bnei_else.44104
	beqi	%a1, 0, bnei_else.44106
	addi	%a0, %zero, 0
	j	bnei_cont.44105
bnei_else.44106:
	addi	%a0, %zero, 1
bnei_cont.44107:
	j	bnei_cont.44105
bnei_else.44104:
	add	%a0, %zero, %a1
bnei_cont.44105:
	lw	%v1, 4(%v1)
	flw	%f2, 2(%v1)
	beqi	%a0, 0, bnei_else.44108
	j	bnei_cont.44109
bnei_else.44108:
	fneg	%f2, %f2
bnei_cont.44109:
	fsw	%f2, 4(%v0)
	flw	%f2, 484(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 5(%v0)
bnei_cont.44101:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
bnei_cont.44059:
	addi	%v0, %v1, -1
	addi	%a0, %zero, 247
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 121(%sp)
	addi	%sp, %sp, 122
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -122
	lw	%ra, 121(%sp)
	j	bgti_cont.44057
bgti_else.44056:
bgti_cont.44057:
	lw	%v0, 119(%sp)
	blti	%v0, 0, bgti_else.44110
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.44112
	j	bgti_cont.44111
bnei_else.44112:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 484(%zero)
	fblt	%f0, %f1, fbgt_else.44114
	addi	%a0, %zero, 0
	j	fbgt_cont.44115
fbgt_else.44114:
	addi	%a0, %zero, 1
fbgt_cont.44115:
	beqi	%a0, 0, bnei_else.44116
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.44118
	beqi	%a0, 2, bnei_else.44120
	j	bnei_cont.44117
bnei_else.44120:
	sll	%a0, %v0, 2
	addi	%a0, %a0, 1
	lw	%a1, 434(%zero)
	lw	%a2, 7(%v1)
	flw	%f0, 0(%a2)
	fsub	%f0, %f1, %f0
	lw	%a2, 4(%v1)
	flw	%f1, 0(%a2)
	flw	%f2, 118(%sp)
	fmul	%f1, %f2, %f1
	flw	%f3, 1(%a2)
	flw	%f4, 117(%sp)
	fmul	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%a2)
	flw	%f5, 116(%sp)
	fmul	%f3, %f5, %f3
	fadd	%f1, %f1, %f3
	flw	%f3, 495(%zero)
	lw	%a2, 4(%v1)
	flw	%f6, 0(%a2)
	fmul	%f6, %f3, %f6
	fmul	%f6, %f6, %f1
	fsub	%f2, %f6, %f2
	lw	%a2, 4(%v1)
	flw	%f6, 1(%a2)
	fmul	%f6, %f3, %f6
	fmul	%f6, %f6, %f1
	fsub	%f4, %f6, %f4
	lw	%v1, 4(%v1)
	flw	%f6, 2(%v1)
	fmul	%f3, %f3, %f6
	fmul	%f1, %f3, %f1
	fsub	%f1, %f1, %f5
	flw	%f3, 2(%sp)
	lw	%v1, 4(%sp)
	sw	%a1, 121(%sp)
	sw	%a0, 122(%sp)
	fsw	%f0, 123(%sp)
	fsw	%f1, 124(%sp)
	fsw	%f4, 125(%sp)
	fsw	%f2, 126(%sp)
	addi	%v0, %v1, 0
	fmov	%f0, %f3
	sw	%ra, 127(%sp)
	addi	%sp, %sp, 128
	jal	min_caml_create_float_array
	addi	%sp, %sp, -128
	lw	%ra, 127(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 113(%sp)
	sw	%v1, 127(%sp)
	sw	%ra, 128(%sp)
	addi	%sp, %sp, 129
	jal	min_caml_create_array
	addi	%sp, %sp, -129
	lw	%ra, 128(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 127(%sp)
	sw	%v0, 0(%v1)
	flw	%f0, 126(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 125(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 124(%sp)
	fsw	%f0, 2(%v0)
	lw	%v0, 119(%sp)
	sw	%v1, 128(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 129(%sp)
	addi	%sp, %sp, 130
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -130
	lw	%ra, 129(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 123(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 128(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 122(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 121(%sp)
	sw	%v0, 254(%v1)
	addi	%v0, %v1, 1
	sw	%v0, 434(%zero)
bnei_cont.44121:
	j	bnei_cont.44117
bnei_else.44118:
	sll	%a0, %v0, 2
	lw	%a1, 434(%zero)
	lw	%v1, 7(%v1)
	flw	%f0, 0(%v1)
	fsub	%f0, %f1, %f0
	flw	%f1, 118(%sp)
	fneg	%f2, %f1
	flw	%f3, 117(%sp)
	fneg	%f4, %f3
	flw	%f5, 116(%sp)
	fneg	%f6, %f5
	addi	%v1, %a0, 1
	flw	%f7, 2(%sp)
	lw	%a2, 4(%sp)
	fsw	%f2, 129(%sp)
	sw	%a0, 130(%sp)
	sw	%a1, 131(%sp)
	sw	%v1, 132(%sp)
	fsw	%f0, 133(%sp)
	fsw	%f6, 134(%sp)
	fsw	%f4, 135(%sp)
	addi	%v0, %a2, 0
	fmov	%f0, %f7
	sw	%ra, 136(%sp)
	addi	%sp, %sp, 137
	jal	min_caml_create_float_array
	addi	%sp, %sp, -137
	lw	%ra, 136(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 113(%sp)
	sw	%v1, 136(%sp)
	sw	%ra, 137(%sp)
	addi	%sp, %sp, 138
	jal	min_caml_create_array
	addi	%sp, %sp, -138
	lw	%ra, 137(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 136(%sp)
	sw	%v0, 0(%v1)
	flw	%f0, 118(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 135(%sp)
	fsw	%f0, 1(%v0)
	flw	%f1, 134(%sp)
	fsw	%f1, 2(%v0)
	lw	%v0, 119(%sp)
	sw	%v1, 137(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 138(%sp)
	addi	%sp, %sp, 139
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -139
	lw	%ra, 138(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 133(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 137(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 132(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 131(%sp)
	sw	%v0, 254(%v1)
	addi	%v0, %v1, 1
	lw	%a0, 130(%sp)
	addi	%a1, %a0, 2
	flw	%f1, 2(%sp)
	lw	%a2, 4(%sp)
	sw	%v0, 138(%sp)
	sw	%a1, 139(%sp)
	addi	%v0, %a2, 0
	fmov	%f0, %f1
	sw	%ra, 140(%sp)
	addi	%sp, %sp, 141
	jal	min_caml_create_float_array
	addi	%sp, %sp, -141
	lw	%ra, 140(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 113(%sp)
	sw	%v1, 140(%sp)
	sw	%ra, 141(%sp)
	addi	%sp, %sp, 142
	jal	min_caml_create_array
	addi	%sp, %sp, -142
	lw	%ra, 141(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 140(%sp)
	sw	%v0, 0(%v1)
	flw	%f0, 129(%sp)
	fsw	%f0, 0(%v0)
	flw	%f1, 117(%sp)
	fsw	%f1, 1(%v0)
	flw	%f1, 134(%sp)
	fsw	%f1, 2(%v0)
	lw	%v0, 119(%sp)
	sw	%v1, 141(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 142(%sp)
	addi	%sp, %sp, 143
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -143
	lw	%ra, 142(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 133(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 141(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 139(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 138(%sp)
	sw	%v0, 254(%v1)
	lw	%v0, 131(%sp)
	addi	%v1, %v0, 2
	lw	%a0, 130(%sp)
	addi	%a0, %a0, 3
	flw	%f1, 2(%sp)
	lw	%a1, 4(%sp)
	sw	%v1, 142(%sp)
	sw	%a0, 143(%sp)
	addi	%v0, %a1, 0
	fmov	%f0, %f1
	sw	%ra, 144(%sp)
	addi	%sp, %sp, 145
	jal	min_caml_create_float_array
	addi	%sp, %sp, -145
	lw	%ra, 144(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 113(%sp)
	sw	%v1, 144(%sp)
	sw	%ra, 145(%sp)
	addi	%sp, %sp, 146
	jal	min_caml_create_array
	addi	%sp, %sp, -146
	lw	%ra, 145(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	lw	%v0, 144(%sp)
	sw	%v0, 0(%v1)
	flw	%f0, 129(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 135(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 116(%sp)
	fsw	%f0, 2(%v0)
	lw	%v0, 119(%sp)
	sw	%v1, 145(%sp)
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 146(%sp)
	addi	%sp, %sp, 147
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -147
	lw	%ra, 146(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 3
	flw	%f0, 133(%sp)
	fsw	%f0, 2(%v0)
	lw	%v1, 145(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 143(%sp)
	sw	%v1, 0(%v0)
	lw	%v1, 142(%sp)
	sw	%v0, 254(%v1)
	lw	%v0, 131(%sp)
	addi	%v0, %v0, 3
	sw	%v0, 434(%zero)
bnei_cont.44119:
	j	bnei_cont.44117
bnei_else.44116:
bnei_cont.44117:
bnei_cont.44113:
	j	bgti_cont.44111
bgti_else.44110:
bgti_cont.44111:
	flw	%f0, 158(%zero)
	lw	%v0, 157(%zero)
	lw	%a0, 1(%sp)
	sub	%v0, %a0, %v0
	itof	%f1, %v0
	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	fmul	%f1, %f0, %f1
	flw	%f2, 86(%sp)
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	fmul	%f2, %f0, %f2
	flw	%f3, 85(%sp)
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 84(%sp)
	fadd	%f0, %f0, %f3
	lw	%v0, 11(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 49(%sp)
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 146(%sp)
	addi	%sp, %sp, 147
	jal	pretrace_pixels.3034
	addi	%sp, %sp, -147
	lw	%ra, 146(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 31(%sp)
	lw	%a0, 49(%sp)
	lw	%a1, 67(%sp)
	lw	%a2, 6(%sp)
	sw	%ra, 146(%sp)
	addi	%sp, %sp, 147
	jal	scan_line.3051
	addi	%sp, %sp, -147
	lw	%ra, 146(%sp)
	addi	%g0, %zero, 0
	ret
