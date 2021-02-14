.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 44464
	lui	%hp, 0
	ori	%hp, %hp, 496
	lui	%k1, 0
	ori	%k1, %k1, 1
	lui	%f30, 16256
	ori	%f30, %f30, 0
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
reduction_2pi_sub1.2626:
	fblt	%f0, %f1, fbgt_else.33115
	flw	%f2, 495(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33116
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33117
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33118
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33119
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33120
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33121
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33122
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33123
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33124
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33125
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33126
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33127
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33128
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33129
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33130
	fmul	%f1, %f2, %f1
	j	reduction_2pi_sub1.2626
fbgt_else.33130:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33129:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33128:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33127:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33126:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33125:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33124:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33123:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33122:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33121:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33120:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33119:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33118:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33117:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33116:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33115:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2629:
	fblt	%f0, %f2, fbgt_else.33131
	fblt	%f0, %f1, fbgt_else.33132
	fsub	%f0, %f0, %f1
	flw	%f3, 495(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33133
	fblt	%f0, %f1, fbgt_else.33134
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33135
	fblt	%f0, %f1, fbgt_else.33136
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33137
	fblt	%f0, %f1, fbgt_else.33138
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33138:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33137:
	jr	%ra
fbgt_else.33136:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33139
	fblt	%f0, %f1, fbgt_else.33140
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33140:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33139:
	jr	%ra
fbgt_else.33135:
	jr	%ra
fbgt_else.33134:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33141
	fblt	%f0, %f1, fbgt_else.33142
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33143
	fblt	%f0, %f1, fbgt_else.33144
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33144:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33143:
	jr	%ra
fbgt_else.33142:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33145
	fblt	%f0, %f1, fbgt_else.33146
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33146:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33145:
	jr	%ra
fbgt_else.33141:
	jr	%ra
fbgt_else.33133:
	jr	%ra
fbgt_else.33132:
	flw	%f3, 495(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33147
	fblt	%f0, %f1, fbgt_else.33148
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33149
	fblt	%f0, %f1, fbgt_else.33150
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33151
	fblt	%f0, %f1, fbgt_else.33152
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33152:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33151:
	jr	%ra
fbgt_else.33150:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33153
	fblt	%f0, %f1, fbgt_else.33154
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33154:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33153:
	jr	%ra
fbgt_else.33149:
	jr	%ra
fbgt_else.33148:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33155
	fblt	%f0, %f1, fbgt_else.33156
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33157
	fblt	%f0, %f1, fbgt_else.33158
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33158:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33157:
	jr	%ra
fbgt_else.33156:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33159
	fblt	%f0, %f1, fbgt_else.33160
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33160:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2629
fbgt_else.33159:
	jr	%ra
fbgt_else.33155:
	jr	%ra
fbgt_else.33147:
	jr	%ra
fbgt_else.33131:
	jr	%ra
print_int_sub1.2641:
	blti	%v0, 10, bgti_else.33161
	blti	%v0, 20, bgti_else.33162
	blti	%v0, 30, bgti_else.33163
	blti	%v0, 40, bgti_else.33164
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	blti	%v0, 10, bgti_else.33165
	blti	%v0, 20, bgti_else.33166
	blti	%v0, 30, bgti_else.33167
	blti	%v0, 40, bgti_else.33168
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	blti	%v0, 10, bgti_else.33169
	blti	%v0, 20, bgti_else.33170
	blti	%v0, 30, bgti_else.33171
	blti	%v0, 40, bgti_else.33172
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	blti	%v0, 10, bgti_else.33173
	blti	%v0, 20, bgti_else.33174
	blti	%v0, 30, bgti_else.33175
	blti	%v0, 40, bgti_else.33176
	addi	%v0, %v0, -40
	addi	%v1, %v1, 4
	j	print_int_sub1.2641
bgti_else.33176:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.33175:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.33174:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.33173:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33172:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.33171:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.33170:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.33169:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33168:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.33167:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.33166:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.33165:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33164:
	addi	%v0, %v1, 3
	jr	%ra
bgti_else.33163:
	addi	%v0, %v1, 2
	jr	%ra
bgti_else.33162:
	addi	%v0, %v1, 1
	jr	%ra
bgti_else.33161:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2644:
	blti	%v0, 10, bgti_else.33177
	blti	%v0, 20, bgti_else.33178
	blti	%v0, 30, bgti_else.33179
	blti	%v0, 40, bgti_else.33180
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33181
	blti	%v0, 20, bgti_else.33182
	blti	%v0, 30, bgti_else.33183
	blti	%v0, 40, bgti_else.33184
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33185
	blti	%v0, 20, bgti_else.33186
	blti	%v0, 30, bgti_else.33187
	blti	%v0, 40, bgti_else.33188
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33189
	blti	%v0, 20, bgti_else.33190
	blti	%v0, 30, bgti_else.33191
	blti	%v0, 40, bgti_else.33192
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33193
	blti	%v0, 20, bgti_else.33194
	blti	%v0, 30, bgti_else.33195
	blti	%v0, 40, bgti_else.33196
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33197
	blti	%v0, 20, bgti_else.33198
	blti	%v0, 30, bgti_else.33199
	blti	%v0, 40, bgti_else.33200
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33201
	blti	%v0, 20, bgti_else.33202
	blti	%v0, 30, bgti_else.33203
	blti	%v0, 40, bgti_else.33204
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.33205
	blti	%v0, 20, bgti_else.33206
	blti	%v0, 30, bgti_else.33207
	blti	%v0, 40, bgti_else.33208
	addi	%v0, %v0, -40
	j	print_int_sub2.2644
bgti_else.33208:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33207:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33206:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33205:
	jr	%ra
bgti_else.33204:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33203:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33202:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33201:
	jr	%ra
bgti_else.33200:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33199:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33198:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33197:
	jr	%ra
bgti_else.33196:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33195:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33194:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33193:
	jr	%ra
bgti_else.33192:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33191:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33190:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33189:
	jr	%ra
bgti_else.33188:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33187:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33186:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33185:
	jr	%ra
bgti_else.33184:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33183:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33182:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33181:
	jr	%ra
bgti_else.33180:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.33179:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.33178:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.33177:
	jr	%ra
rotate_quadratic_matrix.2779:
	flw	%f0, 0(%v1)
	flw	%f1, 494(%zero)
	fabs	%f2, %f0
	flw	%f3, 493(%zero)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	fsw	%f0, 2(%sp)
	fsw	%f1, 3(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f3, 5(%sp)
	fblt	%f2, %f3, fbgt_else.34332
	flw	%f4, 492(%zero)
	fblt	%f2, %f4, fbgt_else.34334
	flw	%f4, 491(%zero)
	fblt	%f2, %f4, fbgt_else.34336
	flw	%f4, 490(%zero)
	fblt	%f2, %f4, fbgt_else.34338
	flw	%f4, 489(%zero)
	fblt	%f2, %f4, fbgt_else.34340
	flw	%f4, 488(%zero)
	fblt	%f2, %f4, fbgt_else.34342
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.34344
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.34346
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.34348
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.34350
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.34352
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.34354
	flw	%f4, 481(%zero)
	fblt	%f2, %f4, fbgt_else.34356
	flw	%f4, 480(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	fbgt_cont.34333
fbgt_else.34356:
	fmov	%f0, %f4
fbgt_cont.34357:
	j	fbgt_cont.34333
fbgt_else.34354:
	fmov	%f0, %f4
fbgt_cont.34355:
	j	fbgt_cont.34333
fbgt_else.34352:
	fmov	%f0, %f4
fbgt_cont.34353:
	j	fbgt_cont.34333
fbgt_else.34350:
	fmov	%f0, %f4
fbgt_cont.34351:
	j	fbgt_cont.34333
fbgt_else.34348:
	fmov	%f0, %f4
fbgt_cont.34349:
	j	fbgt_cont.34333
fbgt_else.34346:
	fmov	%f0, %f4
fbgt_cont.34347:
	j	fbgt_cont.34333
fbgt_else.34344:
	fmov	%f0, %f4
fbgt_cont.34345:
	j	fbgt_cont.34333
fbgt_else.34342:
	fmov	%f0, %f4
fbgt_cont.34343:
	j	fbgt_cont.34333
fbgt_else.34340:
	fmov	%f0, %f4
fbgt_cont.34341:
	j	fbgt_cont.34333
fbgt_else.34338:
	fmov	%f0, %f4
fbgt_cont.34339:
	j	fbgt_cont.34333
fbgt_else.34336:
	fmov	%f0, %f4
fbgt_cont.34337:
	j	fbgt_cont.34333
fbgt_else.34334:
	fmov	%f0, %f4
fbgt_cont.34335:
	j	fbgt_cont.34333
fbgt_else.34332:
	fmov	%f0, %f3
fbgt_cont.34333:
	flw	%f1, 4(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34358
	fblt	%f1, %f0, fbgt_else.34360
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	fbgt_cont.34359
fbgt_else.34360:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
fbgt_cont.34361:
	j	fbgt_cont.34359
fbgt_else.34358:
	fmov	%f0, %f1
fbgt_cont.34359:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34362
	addi	%v0, %zero, 0
	j	fbgt_cont.34363
fbgt_else.34362:
	addi	%v0, %zero, 1
fbgt_cont.34363:
	fblt	%f0, %f1, fbgt_else.34364
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34365
fbgt_else.34364:
fbgt_cont.34365:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.34366
	beqi	%v0, 0, bnei_else.34368
	addi	%v0, %zero, 0
	j	fbgt_cont.34367
bnei_else.34368:
	addi	%v0, %zero, 1
bnei_cont.34369:
	j	fbgt_cont.34367
fbgt_else.34366:
fbgt_cont.34367:
	fblt	%f0, %f2, fbgt_else.34370
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34371
fbgt_else.34370:
fbgt_cont.34371:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.34372
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.34373
fbgt_else.34372:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.34373:
	beqi	%v0, 0, bnei_else.34374
	j	bnei_cont.34375
bnei_else.34374:
	fneg	%f0, %f0
bnei_cont.34375:
	flw	%f4, 470(%zero)
	flw	%f5, 2(%sp)
	fblt	%f5, %f4, fbgt_else.34376
	addi	%v0, %zero, 1
	j	fbgt_cont.34377
fbgt_else.34376:
	addi	%v0, %zero, 0
fbgt_cont.34377:
	fabs	%f5, %f5
	flw	%f6, 5(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f4, 7(%sp)
	fsw	%f3, 8(%sp)
	fsw	%f2, 9(%sp)
	sw	%v0, 10(%sp)
	fsw	%f5, 11(%sp)
	fblt	%f5, %f6, fbgt_else.34378
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.34380
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.34382
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.34384
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.34386
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.34388
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.34390
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.34392
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.34394
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.34396
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.34398
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.34400
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.34402
	flw	%f7, 480(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.34379
fbgt_else.34402:
	fmov	%f0, %f7
fbgt_cont.34403:
	j	fbgt_cont.34379
fbgt_else.34400:
	fmov	%f0, %f7
fbgt_cont.34401:
	j	fbgt_cont.34379
fbgt_else.34398:
	fmov	%f0, %f7
fbgt_cont.34399:
	j	fbgt_cont.34379
fbgt_else.34396:
	fmov	%f0, %f7
fbgt_cont.34397:
	j	fbgt_cont.34379
fbgt_else.34394:
	fmov	%f0, %f7
fbgt_cont.34395:
	j	fbgt_cont.34379
fbgt_else.34392:
	fmov	%f0, %f7
fbgt_cont.34393:
	j	fbgt_cont.34379
fbgt_else.34390:
	fmov	%f0, %f7
fbgt_cont.34391:
	j	fbgt_cont.34379
fbgt_else.34388:
	fmov	%f0, %f7
fbgt_cont.34389:
	j	fbgt_cont.34379
fbgt_else.34386:
	fmov	%f0, %f7
fbgt_cont.34387:
	j	fbgt_cont.34379
fbgt_else.34384:
	fmov	%f0, %f7
fbgt_cont.34385:
	j	fbgt_cont.34379
fbgt_else.34382:
	fmov	%f0, %f7
fbgt_cont.34383:
	j	fbgt_cont.34379
fbgt_else.34380:
	fmov	%f0, %f7
fbgt_cont.34381:
	j	fbgt_cont.34379
fbgt_else.34378:
	fmov	%f0, %f6
fbgt_cont.34379:
	flw	%f1, 11(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34404
	fblt	%f1, %f0, fbgt_else.34406
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.34405
fbgt_else.34406:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
fbgt_cont.34407:
	j	fbgt_cont.34405
fbgt_else.34404:
	fmov	%f0, %f1
fbgt_cont.34405:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34408
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.34410
	addi	%v0, %zero, 0
	j	fbgt_cont.34409
bnei_else.34410:
	addi	%v0, %zero, 1
bnei_cont.34411:
	j	fbgt_cont.34409
fbgt_else.34408:
	lw	%v0, 10(%sp)
fbgt_cont.34409:
	fblt	%f0, %f1, fbgt_else.34412
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34413
fbgt_else.34412:
fbgt_cont.34413:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34414
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34415
fbgt_else.34414:
fbgt_cont.34415:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.34416
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.34417
fbgt_else.34416:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.34417:
	beqi	%v0, 0, bnei_else.34418
	j	bnei_cont.34419
bnei_else.34418:
	fneg	%f0, %f0
bnei_cont.34419:
	lw	%v0, 1(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f4, 13(%sp)
	fsw	%f5, 14(%sp)
	fblt	%f5, %f6, fbgt_else.34420
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.34422
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.34424
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.34426
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.34428
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.34430
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.34432
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.34434
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.34436
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.34438
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.34440
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.34442
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.34444
	flw	%f7, 480(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.34421
fbgt_else.34444:
	fmov	%f0, %f7
fbgt_cont.34445:
	j	fbgt_cont.34421
fbgt_else.34442:
	fmov	%f0, %f7
fbgt_cont.34443:
	j	fbgt_cont.34421
fbgt_else.34440:
	fmov	%f0, %f7
fbgt_cont.34441:
	j	fbgt_cont.34421
fbgt_else.34438:
	fmov	%f0, %f7
fbgt_cont.34439:
	j	fbgt_cont.34421
fbgt_else.34436:
	fmov	%f0, %f7
fbgt_cont.34437:
	j	fbgt_cont.34421
fbgt_else.34434:
	fmov	%f0, %f7
fbgt_cont.34435:
	j	fbgt_cont.34421
fbgt_else.34432:
	fmov	%f0, %f7
fbgt_cont.34433:
	j	fbgt_cont.34421
fbgt_else.34430:
	fmov	%f0, %f7
fbgt_cont.34431:
	j	fbgt_cont.34421
fbgt_else.34428:
	fmov	%f0, %f7
fbgt_cont.34429:
	j	fbgt_cont.34421
fbgt_else.34426:
	fmov	%f0, %f7
fbgt_cont.34427:
	j	fbgt_cont.34421
fbgt_else.34424:
	fmov	%f0, %f7
fbgt_cont.34425:
	j	fbgt_cont.34421
fbgt_else.34422:
	fmov	%f0, %f7
fbgt_cont.34423:
	j	fbgt_cont.34421
fbgt_else.34420:
	fmov	%f0, %f6
fbgt_cont.34421:
	flw	%f1, 14(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34446
	fblt	%f1, %f0, fbgt_else.34448
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.34447
fbgt_else.34448:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.34449:
	j	fbgt_cont.34447
fbgt_else.34446:
	fmov	%f0, %f1
fbgt_cont.34447:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34450
	addi	%v0, %zero, 0
	j	fbgt_cont.34451
fbgt_else.34450:
	addi	%v0, %zero, 1
fbgt_cont.34451:
	fblt	%f0, %f1, fbgt_else.34452
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34453
fbgt_else.34452:
fbgt_cont.34453:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34454
	beqi	%v0, 0, bnei_else.34456
	addi	%v0, %zero, 0
	j	fbgt_cont.34455
bnei_else.34456:
	addi	%v0, %zero, 1
bnei_cont.34457:
	j	fbgt_cont.34455
fbgt_else.34454:
fbgt_cont.34455:
	fblt	%f0, %f2, fbgt_else.34458
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34459
fbgt_else.34458:
fbgt_cont.34459:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.34460
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.34461
fbgt_else.34460:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.34461:
	beqi	%v0, 0, bnei_else.34462
	j	bnei_cont.34463
bnei_else.34462:
	fneg	%f0, %f0
bnei_cont.34463:
	flw	%f4, 13(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.34464
	addi	%v0, %zero, 1
	j	fbgt_cont.34465
fbgt_else.34464:
	addi	%v0, %zero, 0
fbgt_cont.34465:
	fabs	%f4, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 15(%sp)
	sw	%v0, 16(%sp)
	fsw	%f4, 17(%sp)
	fblt	%f4, %f6, fbgt_else.34466
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.34468
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.34470
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.34472
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.34474
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.34476
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.34478
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.34480
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.34482
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.34484
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.34486
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.34488
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.34490
	flw	%f7, 480(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.34467
fbgt_else.34490:
	fmov	%f0, %f7
fbgt_cont.34491:
	j	fbgt_cont.34467
fbgt_else.34488:
	fmov	%f0, %f7
fbgt_cont.34489:
	j	fbgt_cont.34467
fbgt_else.34486:
	fmov	%f0, %f7
fbgt_cont.34487:
	j	fbgt_cont.34467
fbgt_else.34484:
	fmov	%f0, %f7
fbgt_cont.34485:
	j	fbgt_cont.34467
fbgt_else.34482:
	fmov	%f0, %f7
fbgt_cont.34483:
	j	fbgt_cont.34467
fbgt_else.34480:
	fmov	%f0, %f7
fbgt_cont.34481:
	j	fbgt_cont.34467
fbgt_else.34478:
	fmov	%f0, %f7
fbgt_cont.34479:
	j	fbgt_cont.34467
fbgt_else.34476:
	fmov	%f0, %f7
fbgt_cont.34477:
	j	fbgt_cont.34467
fbgt_else.34474:
	fmov	%f0, %f7
fbgt_cont.34475:
	j	fbgt_cont.34467
fbgt_else.34472:
	fmov	%f0, %f7
fbgt_cont.34473:
	j	fbgt_cont.34467
fbgt_else.34470:
	fmov	%f0, %f7
fbgt_cont.34471:
	j	fbgt_cont.34467
fbgt_else.34468:
	fmov	%f0, %f7
fbgt_cont.34469:
	j	fbgt_cont.34467
fbgt_else.34466:
	fmov	%f0, %f6
fbgt_cont.34467:
	flw	%f1, 17(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34492
	fblt	%f1, %f0, fbgt_else.34494
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.34493
fbgt_else.34494:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.34495:
	j	fbgt_cont.34493
fbgt_else.34492:
	fmov	%f0, %f1
fbgt_cont.34493:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34496
	lw	%v0, 16(%sp)
	beqi	%v0, 0, bnei_else.34498
	addi	%v0, %zero, 0
	j	fbgt_cont.34497
bnei_else.34498:
	addi	%v0, %zero, 1
bnei_cont.34499:
	j	fbgt_cont.34497
fbgt_else.34496:
	lw	%v0, 16(%sp)
fbgt_cont.34497:
	fblt	%f0, %f1, fbgt_else.34500
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34501
fbgt_else.34500:
fbgt_cont.34501:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34502
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34503
fbgt_else.34502:
fbgt_cont.34503:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.34504
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.34505
fbgt_else.34504:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.34505:
	beqi	%v0, 0, bnei_else.34506
	j	bnei_cont.34507
bnei_else.34506:
	fneg	%f0, %f0
bnei_cont.34507:
	lw	%v0, 1(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 18(%sp)
	fsw	%f4, 19(%sp)
	fsw	%f5, 20(%sp)
	fblt	%f5, %f6, fbgt_else.34508
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.34510
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.34512
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.34514
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.34516
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.34518
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.34520
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.34522
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.34524
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.34526
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.34528
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.34530
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.34532
	flw	%f7, 480(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	fbgt_cont.34509
fbgt_else.34532:
	fmov	%f0, %f7
fbgt_cont.34533:
	j	fbgt_cont.34509
fbgt_else.34530:
	fmov	%f0, %f7
fbgt_cont.34531:
	j	fbgt_cont.34509
fbgt_else.34528:
	fmov	%f0, %f7
fbgt_cont.34529:
	j	fbgt_cont.34509
fbgt_else.34526:
	fmov	%f0, %f7
fbgt_cont.34527:
	j	fbgt_cont.34509
fbgt_else.34524:
	fmov	%f0, %f7
fbgt_cont.34525:
	j	fbgt_cont.34509
fbgt_else.34522:
	fmov	%f0, %f7
fbgt_cont.34523:
	j	fbgt_cont.34509
fbgt_else.34520:
	fmov	%f0, %f7
fbgt_cont.34521:
	j	fbgt_cont.34509
fbgt_else.34518:
	fmov	%f0, %f7
fbgt_cont.34519:
	j	fbgt_cont.34509
fbgt_else.34516:
	fmov	%f0, %f7
fbgt_cont.34517:
	j	fbgt_cont.34509
fbgt_else.34514:
	fmov	%f0, %f7
fbgt_cont.34515:
	j	fbgt_cont.34509
fbgt_else.34512:
	fmov	%f0, %f7
fbgt_cont.34513:
	j	fbgt_cont.34509
fbgt_else.34510:
	fmov	%f0, %f7
fbgt_cont.34511:
	j	fbgt_cont.34509
fbgt_else.34508:
	fmov	%f0, %f6
fbgt_cont.34509:
	flw	%f1, 20(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34534
	fblt	%f1, %f0, fbgt_else.34536
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	fbgt_cont.34535
fbgt_else.34536:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
fbgt_cont.34537:
	j	fbgt_cont.34535
fbgt_else.34534:
	fmov	%f0, %f1
fbgt_cont.34535:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34538
	addi	%v0, %zero, 0
	j	fbgt_cont.34539
fbgt_else.34538:
	addi	%v0, %zero, 1
fbgt_cont.34539:
	fblt	%f0, %f1, fbgt_else.34540
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34541
fbgt_else.34540:
fbgt_cont.34541:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34542
	beqi	%v0, 0, bnei_else.34544
	addi	%v0, %zero, 0
	j	fbgt_cont.34543
bnei_else.34544:
	addi	%v0, %zero, 1
bnei_cont.34545:
	j	fbgt_cont.34543
fbgt_else.34542:
fbgt_cont.34543:
	fblt	%f0, %f2, fbgt_else.34546
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34547
fbgt_else.34546:
fbgt_cont.34547:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.34548
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.34549
fbgt_else.34548:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.34549:
	beqi	%v0, 0, bnei_else.34550
	j	bnei_cont.34551
bnei_else.34550:
	fneg	%f0, %f0
bnei_cont.34551:
	flw	%f4, 19(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.34552
	addi	%v0, %zero, 1
	j	fbgt_cont.34553
fbgt_else.34552:
	addi	%v0, %zero, 0
fbgt_cont.34553:
	fabs	%f4, %f4
	flw	%f5, 5(%sp)
	fsw	%f0, 21(%sp)
	sw	%v0, 22(%sp)
	fsw	%f4, 23(%sp)
	fblt	%f4, %f5, fbgt_else.34554
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.34556
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.34558
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.34560
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.34562
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.34564
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.34566
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.34568
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.34570
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.34572
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.34574
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.34576
	flw	%f6, 481(%zero)
	fblt	%f4, %f6, fbgt_else.34578
	flw	%f6, 480(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.34555
fbgt_else.34578:
	fmov	%f0, %f6
fbgt_cont.34579:
	j	fbgt_cont.34555
fbgt_else.34576:
	fmov	%f0, %f6
fbgt_cont.34577:
	j	fbgt_cont.34555
fbgt_else.34574:
	fmov	%f0, %f6
fbgt_cont.34575:
	j	fbgt_cont.34555
fbgt_else.34572:
	fmov	%f0, %f6
fbgt_cont.34573:
	j	fbgt_cont.34555
fbgt_else.34570:
	fmov	%f0, %f6
fbgt_cont.34571:
	j	fbgt_cont.34555
fbgt_else.34568:
	fmov	%f0, %f6
fbgt_cont.34569:
	j	fbgt_cont.34555
fbgt_else.34566:
	fmov	%f0, %f6
fbgt_cont.34567:
	j	fbgt_cont.34555
fbgt_else.34564:
	fmov	%f0, %f6
fbgt_cont.34565:
	j	fbgt_cont.34555
fbgt_else.34562:
	fmov	%f0, %f6
fbgt_cont.34563:
	j	fbgt_cont.34555
fbgt_else.34560:
	fmov	%f0, %f6
fbgt_cont.34561:
	j	fbgt_cont.34555
fbgt_else.34558:
	fmov	%f0, %f6
fbgt_cont.34559:
	j	fbgt_cont.34555
fbgt_else.34556:
	fmov	%f0, %f6
fbgt_cont.34557:
	j	fbgt_cont.34555
fbgt_else.34554:
	fmov	%f0, %f5
fbgt_cont.34555:
	flw	%f1, 23(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34580
	fblt	%f1, %f0, fbgt_else.34582
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.34581
fbgt_else.34582:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
fbgt_cont.34583:
	j	fbgt_cont.34581
fbgt_else.34580:
	fmov	%f0, %f1
fbgt_cont.34581:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34584
	lw	%v0, 22(%sp)
	beqi	%v0, 0, bnei_else.34586
	addi	%v0, %zero, 0
	j	fbgt_cont.34585
bnei_else.34586:
	addi	%v0, %zero, 1
bnei_cont.34587:
	j	fbgt_cont.34585
fbgt_else.34584:
	lw	%v0, 22(%sp)
fbgt_cont.34585:
	fblt	%f0, %f1, fbgt_else.34588
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34589
fbgt_else.34588:
fbgt_cont.34589:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34590
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34591
fbgt_else.34590:
fbgt_cont.34591:
	flw	%f1, 8(%sp)
	fblt	%f1, %f0, fbgt_else.34592
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.34593
fbgt_else.34592:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.34593:
	beqi	%v0, 0, bnei_else.34594
	j	bnei_cont.34595
bnei_else.34594:
	fneg	%f0, %f0
bnei_cont.34595:
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
read_nth_object.2782:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.35641
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
	flw	%f0, 470(%zero)
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
	fblt	%f0, %f1, fbgt_else.35642
	addi	%v0, %zero, 0
	j	fbgt_cont.35643
fbgt_else.35642:
	addi	%v0, %zero, 1
fbgt_cont.35643:
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
	beqi	%v1, 0, bnei_else.35644
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 469(%zero)
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
	j	bnei_cont.35645
bnei_else.35644:
bnei_cont.35645:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.35646
	lw	%a0, 10(%sp)
	j	bnei_cont.35647
bnei_else.35646:
	addi	%a0, %zero, 1
bnei_cont.35647:
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
	beqi	%a2, 3, bnei_else.35648
	beqi	%a2, 2, bnei_else.35650
	j	bnei_cont.35649
bnei_else.35650:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.35652
	addi	%v1, %zero, 0
	j	bnei_cont.35653
bnei_else.35652:
	addi	%v1, %zero, 1
bnei_cont.35653:
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
	fbne	%f1, %f4, fbeq_else.35654
	addi	%a2, %zero, 1
	j	fbeq_cont.35655
fbeq_else.35654:
	addi	%a2, %zero, 0
fbeq_cont.35655:
	beqi	%a2, 0, bnei_else.35656
	flw	%f1, 474(%zero)
	j	bnei_cont.35657
bnei_else.35656:
	beqi	%v1, 0, bnei_else.35658
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.35659
bnei_else.35658:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.35659:
bnei_cont.35657:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.35651:
	j	bnei_cont.35649
bnei_else.35648:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.35660
	addi	%v1, %zero, 1
	j	fbeq_cont.35661
fbeq_else.35660:
	addi	%v1, %zero, 0
fbeq_cont.35661:
	beqi	%v1, 0, bnei_else.35662
	fmov	%f0, %f1
	j	bnei_cont.35663
bnei_else.35662:
	fbne	%f0, %f1, fbeq_else.35664
	addi	%v1, %zero, 1
	j	fbeq_cont.35665
fbeq_else.35664:
	addi	%v1, %zero, 0
fbeq_cont.35665:
	beqi	%v1, 0, bnei_else.35666
	fmov	%f2, %f1
	j	bnei_cont.35667
bnei_else.35666:
	fblt	%f1, %f0, fbgt_else.35668
	addi	%v1, %zero, 0
	j	fbgt_cont.35669
fbgt_else.35668:
	addi	%v1, %zero, 1
fbgt_cont.35669:
	beqi	%v1, 0, bnei_else.35670
	flw	%f2, 474(%zero)
	j	bnei_cont.35671
bnei_else.35670:
	flw	%f2, 468(%zero)
bnei_cont.35671:
bnei_cont.35667:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.35663:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.35672
	addi	%v1, %zero, 1
	j	fbeq_cont.35673
fbeq_else.35672:
	addi	%v1, %zero, 0
fbeq_cont.35673:
	beqi	%v1, 0, bnei_else.35674
	fmov	%f0, %f1
	j	bnei_cont.35675
bnei_else.35674:
	fbne	%f0, %f1, fbeq_else.35676
	addi	%v1, %zero, 1
	j	fbeq_cont.35677
fbeq_else.35676:
	addi	%v1, %zero, 0
fbeq_cont.35677:
	beqi	%v1, 0, bnei_else.35678
	fmov	%f2, %f1
	j	bnei_cont.35679
bnei_else.35678:
	fblt	%f1, %f0, fbgt_else.35680
	addi	%v1, %zero, 0
	j	fbgt_cont.35681
fbgt_else.35680:
	addi	%v1, %zero, 1
fbgt_cont.35681:
	beqi	%v1, 0, bnei_else.35682
	flw	%f2, 474(%zero)
	j	bnei_cont.35683
bnei_else.35682:
	flw	%f2, 468(%zero)
bnei_cont.35683:
bnei_cont.35679:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.35675:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.35684
	addi	%v1, %zero, 1
	j	fbeq_cont.35685
fbeq_else.35684:
	addi	%v1, %zero, 0
fbeq_cont.35685:
	beqi	%v1, 0, bnei_else.35686
	fmov	%f0, %f1
	j	bnei_cont.35687
bnei_else.35686:
	fbne	%f0, %f1, fbeq_else.35688
	addi	%v1, %zero, 1
	j	fbeq_cont.35689
fbeq_else.35688:
	addi	%v1, %zero, 0
fbeq_cont.35689:
	beqi	%v1, 0, bnei_else.35690
	fmov	%f2, %f1
	j	bnei_cont.35691
bnei_else.35690:
	fblt	%f1, %f0, fbgt_else.35692
	addi	%v1, %zero, 0
	j	fbgt_cont.35693
fbgt_else.35692:
	addi	%v1, %zero, 1
fbgt_cont.35693:
	beqi	%v1, 0, bnei_else.35694
	flw	%f2, 474(%zero)
	j	bnei_cont.35695
bnei_else.35694:
	flw	%f2, 468(%zero)
bnei_cont.35695:
bnei_cont.35691:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.35687:
	fsw	%f0, 2(%a0)
bnei_cont.35649:
	beqi	%a1, 0, bnei_else.35696
	flw	%f0, 0(%v0)
	flw	%f1, 494(%zero)
	fabs	%f2, %f0
	flw	%f3, 493(%zero)
	fsw	%f0, 16(%sp)
	fsw	%f1, 17(%sp)
	fsw	%f3, 18(%sp)
	fsw	%f2, 19(%sp)
	fblt	%f2, %f3, fbgt_else.35698
	flw	%f4, 492(%zero)
	fblt	%f2, %f4, fbgt_else.35700
	flw	%f4, 491(%zero)
	fblt	%f2, %f4, fbgt_else.35702
	flw	%f4, 490(%zero)
	fblt	%f2, %f4, fbgt_else.35704
	flw	%f4, 489(%zero)
	fblt	%f2, %f4, fbgt_else.35706
	flw	%f4, 488(%zero)
	fblt	%f2, %f4, fbgt_else.35708
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.35710
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.35712
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.35714
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.35716
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.35718
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.35720
	flw	%f4, 481(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35699
fbgt_else.35720:
	fmov	%f1, %f4
fbgt_cont.35721:
	j	fbgt_cont.35699
fbgt_else.35718:
	fmov	%f1, %f4
fbgt_cont.35719:
	j	fbgt_cont.35699
fbgt_else.35716:
	fmov	%f1, %f4
fbgt_cont.35717:
	j	fbgt_cont.35699
fbgt_else.35714:
	fmov	%f1, %f4
fbgt_cont.35715:
	j	fbgt_cont.35699
fbgt_else.35712:
	fmov	%f1, %f4
fbgt_cont.35713:
	j	fbgt_cont.35699
fbgt_else.35710:
	fmov	%f1, %f4
fbgt_cont.35711:
	j	fbgt_cont.35699
fbgt_else.35708:
	fmov	%f1, %f4
fbgt_cont.35709:
	j	fbgt_cont.35699
fbgt_else.35706:
	fmov	%f1, %f4
fbgt_cont.35707:
	j	fbgt_cont.35699
fbgt_else.35704:
	fmov	%f1, %f4
fbgt_cont.35705:
	j	fbgt_cont.35699
fbgt_else.35702:
	fmov	%f1, %f4
fbgt_cont.35703:
	j	fbgt_cont.35699
fbgt_else.35700:
	fmov	%f1, %f4
fbgt_cont.35701:
	j	fbgt_cont.35699
fbgt_else.35698:
	fmov	%f1, %f3
fbgt_cont.35699:
	flw	%f0, 19(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35722
	addi	%v0, %zero, 0
	j	fbgt_cont.35723
fbgt_else.35722:
	addi	%v0, %zero, 1
fbgt_cont.35723:
	fblt	%f0, %f1, fbgt_else.35724
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35725
fbgt_else.35724:
fbgt_cont.35725:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.35726
	beqi	%v0, 0, bnei_else.35728
	addi	%v0, %zero, 0
	j	fbgt_cont.35727
bnei_else.35728:
	addi	%v0, %zero, 1
bnei_cont.35729:
	j	fbgt_cont.35727
fbgt_else.35726:
fbgt_cont.35727:
	fblt	%f0, %f2, fbgt_else.35730
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35731
fbgt_else.35730:
fbgt_cont.35731:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.35732
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.35733
fbgt_else.35732:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.35733:
	beqi	%v0, 0, bnei_else.35734
	j	bnei_cont.35735
bnei_else.35734:
	fneg	%f0, %f0
bnei_cont.35735:
	flw	%f4, 16(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.35736
	addi	%v0, %zero, 1
	j	fbgt_cont.35737
fbgt_else.35736:
	addi	%v0, %zero, 0
fbgt_cont.35737:
	fabs	%f4, %f4
	flw	%f6, 18(%sp)
	fsw	%f0, 20(%sp)
	fsw	%f3, 21(%sp)
	fsw	%f2, 22(%sp)
	sw	%v0, 23(%sp)
	fsw	%f4, 24(%sp)
	fblt	%f4, %f6, fbgt_else.35738
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.35740
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.35742
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.35744
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.35746
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.35748
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.35750
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.35752
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.35754
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.35756
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.35758
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.35760
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35739
fbgt_else.35760:
	fmov	%f1, %f7
fbgt_cont.35761:
	j	fbgt_cont.35739
fbgt_else.35758:
	fmov	%f1, %f7
fbgt_cont.35759:
	j	fbgt_cont.35739
fbgt_else.35756:
	fmov	%f1, %f7
fbgt_cont.35757:
	j	fbgt_cont.35739
fbgt_else.35754:
	fmov	%f1, %f7
fbgt_cont.35755:
	j	fbgt_cont.35739
fbgt_else.35752:
	fmov	%f1, %f7
fbgt_cont.35753:
	j	fbgt_cont.35739
fbgt_else.35750:
	fmov	%f1, %f7
fbgt_cont.35751:
	j	fbgt_cont.35739
fbgt_else.35748:
	fmov	%f1, %f7
fbgt_cont.35749:
	j	fbgt_cont.35739
fbgt_else.35746:
	fmov	%f1, %f7
fbgt_cont.35747:
	j	fbgt_cont.35739
fbgt_else.35744:
	fmov	%f1, %f7
fbgt_cont.35745:
	j	fbgt_cont.35739
fbgt_else.35742:
	fmov	%f1, %f7
fbgt_cont.35743:
	j	fbgt_cont.35739
fbgt_else.35740:
	fmov	%f1, %f7
fbgt_cont.35741:
	j	fbgt_cont.35739
fbgt_else.35738:
	fmov	%f1, %f6
fbgt_cont.35739:
	flw	%f0, 24(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35762
	lw	%v0, 23(%sp)
	beqi	%v0, 0, bnei_else.35764
	addi	%v0, %zero, 0
	j	fbgt_cont.35763
bnei_else.35764:
	addi	%v0, %zero, 1
bnei_cont.35765:
	j	fbgt_cont.35763
fbgt_else.35762:
	lw	%v0, 23(%sp)
fbgt_cont.35763:
	fblt	%f0, %f1, fbgt_else.35766
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35767
fbgt_else.35766:
fbgt_cont.35767:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35768
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35769
fbgt_else.35768:
fbgt_cont.35769:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.35770
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.35771
fbgt_else.35770:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.35771:
	beqi	%v0, 0, bnei_else.35772
	j	bnei_cont.35773
bnei_else.35772:
	fneg	%f0, %f0
bnei_cont.35773:
	lw	%v0, 13(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 18(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f4, 26(%sp)
	fsw	%f5, 27(%sp)
	fblt	%f5, %f6, fbgt_else.35774
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.35776
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.35778
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.35780
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.35782
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.35784
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.35786
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.35788
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.35790
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.35792
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.35794
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.35796
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35775
fbgt_else.35796:
	fmov	%f1, %f7
fbgt_cont.35797:
	j	fbgt_cont.35775
fbgt_else.35794:
	fmov	%f1, %f7
fbgt_cont.35795:
	j	fbgt_cont.35775
fbgt_else.35792:
	fmov	%f1, %f7
fbgt_cont.35793:
	j	fbgt_cont.35775
fbgt_else.35790:
	fmov	%f1, %f7
fbgt_cont.35791:
	j	fbgt_cont.35775
fbgt_else.35788:
	fmov	%f1, %f7
fbgt_cont.35789:
	j	fbgt_cont.35775
fbgt_else.35786:
	fmov	%f1, %f7
fbgt_cont.35787:
	j	fbgt_cont.35775
fbgt_else.35784:
	fmov	%f1, %f7
fbgt_cont.35785:
	j	fbgt_cont.35775
fbgt_else.35782:
	fmov	%f1, %f7
fbgt_cont.35783:
	j	fbgt_cont.35775
fbgt_else.35780:
	fmov	%f1, %f7
fbgt_cont.35781:
	j	fbgt_cont.35775
fbgt_else.35778:
	fmov	%f1, %f7
fbgt_cont.35779:
	j	fbgt_cont.35775
fbgt_else.35776:
	fmov	%f1, %f7
fbgt_cont.35777:
	j	fbgt_cont.35775
fbgt_else.35774:
	fmov	%f1, %f6
fbgt_cont.35775:
	flw	%f0, 27(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35798
	addi	%v0, %zero, 0
	j	fbgt_cont.35799
fbgt_else.35798:
	addi	%v0, %zero, 1
fbgt_cont.35799:
	fblt	%f0, %f1, fbgt_else.35800
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35801
fbgt_else.35800:
fbgt_cont.35801:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35802
	beqi	%v0, 0, bnei_else.35804
	addi	%v0, %zero, 0
	j	fbgt_cont.35803
bnei_else.35804:
	addi	%v0, %zero, 1
bnei_cont.35805:
	j	fbgt_cont.35803
fbgt_else.35802:
fbgt_cont.35803:
	fblt	%f0, %f2, fbgt_else.35806
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35807
fbgt_else.35806:
fbgt_cont.35807:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.35808
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.35809
fbgt_else.35808:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.35809:
	beqi	%v0, 0, bnei_else.35810
	j	bnei_cont.35811
bnei_else.35810:
	fneg	%f0, %f0
bnei_cont.35811:
	flw	%f4, 26(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.35812
	addi	%v0, %zero, 1
	j	fbgt_cont.35813
fbgt_else.35812:
	addi	%v0, %zero, 0
fbgt_cont.35813:
	fabs	%f4, %f4
	flw	%f6, 18(%sp)
	fsw	%f0, 28(%sp)
	sw	%v0, 29(%sp)
	fsw	%f4, 30(%sp)
	fblt	%f4, %f6, fbgt_else.35814
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.35816
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.35818
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.35820
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.35822
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.35824
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.35826
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.35828
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.35830
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.35832
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.35834
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.35836
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35815
fbgt_else.35836:
	fmov	%f1, %f7
fbgt_cont.35837:
	j	fbgt_cont.35815
fbgt_else.35834:
	fmov	%f1, %f7
fbgt_cont.35835:
	j	fbgt_cont.35815
fbgt_else.35832:
	fmov	%f1, %f7
fbgt_cont.35833:
	j	fbgt_cont.35815
fbgt_else.35830:
	fmov	%f1, %f7
fbgt_cont.35831:
	j	fbgt_cont.35815
fbgt_else.35828:
	fmov	%f1, %f7
fbgt_cont.35829:
	j	fbgt_cont.35815
fbgt_else.35826:
	fmov	%f1, %f7
fbgt_cont.35827:
	j	fbgt_cont.35815
fbgt_else.35824:
	fmov	%f1, %f7
fbgt_cont.35825:
	j	fbgt_cont.35815
fbgt_else.35822:
	fmov	%f1, %f7
fbgt_cont.35823:
	j	fbgt_cont.35815
fbgt_else.35820:
	fmov	%f1, %f7
fbgt_cont.35821:
	j	fbgt_cont.35815
fbgt_else.35818:
	fmov	%f1, %f7
fbgt_cont.35819:
	j	fbgt_cont.35815
fbgt_else.35816:
	fmov	%f1, %f7
fbgt_cont.35817:
	j	fbgt_cont.35815
fbgt_else.35814:
	fmov	%f1, %f6
fbgt_cont.35815:
	flw	%f0, 30(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35838
	lw	%v0, 29(%sp)
	beqi	%v0, 0, bnei_else.35840
	addi	%v0, %zero, 0
	j	fbgt_cont.35839
bnei_else.35840:
	addi	%v0, %zero, 1
bnei_cont.35841:
	j	fbgt_cont.35839
fbgt_else.35838:
	lw	%v0, 29(%sp)
fbgt_cont.35839:
	fblt	%f0, %f1, fbgt_else.35842
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35843
fbgt_else.35842:
fbgt_cont.35843:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35844
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35845
fbgt_else.35844:
fbgt_cont.35845:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.35846
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.35847
fbgt_else.35846:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.35847:
	beqi	%v0, 0, bnei_else.35848
	j	bnei_cont.35849
bnei_else.35848:
	fneg	%f0, %f0
bnei_cont.35849:
	lw	%v0, 13(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 18(%sp)
	fsw	%f0, 31(%sp)
	fsw	%f4, 32(%sp)
	fsw	%f5, 33(%sp)
	fblt	%f5, %f6, fbgt_else.35850
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.35852
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.35854
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.35856
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.35858
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.35860
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.35862
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.35864
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.35866
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.35868
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.35870
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.35872
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35851
fbgt_else.35872:
	fmov	%f1, %f7
fbgt_cont.35873:
	j	fbgt_cont.35851
fbgt_else.35870:
	fmov	%f1, %f7
fbgt_cont.35871:
	j	fbgt_cont.35851
fbgt_else.35868:
	fmov	%f1, %f7
fbgt_cont.35869:
	j	fbgt_cont.35851
fbgt_else.35866:
	fmov	%f1, %f7
fbgt_cont.35867:
	j	fbgt_cont.35851
fbgt_else.35864:
	fmov	%f1, %f7
fbgt_cont.35865:
	j	fbgt_cont.35851
fbgt_else.35862:
	fmov	%f1, %f7
fbgt_cont.35863:
	j	fbgt_cont.35851
fbgt_else.35860:
	fmov	%f1, %f7
fbgt_cont.35861:
	j	fbgt_cont.35851
fbgt_else.35858:
	fmov	%f1, %f7
fbgt_cont.35859:
	j	fbgt_cont.35851
fbgt_else.35856:
	fmov	%f1, %f7
fbgt_cont.35857:
	j	fbgt_cont.35851
fbgt_else.35854:
	fmov	%f1, %f7
fbgt_cont.35855:
	j	fbgt_cont.35851
fbgt_else.35852:
	fmov	%f1, %f7
fbgt_cont.35853:
	j	fbgt_cont.35851
fbgt_else.35850:
	fmov	%f1, %f6
fbgt_cont.35851:
	flw	%f0, 33(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35874
	addi	%v0, %zero, 0
	j	fbgt_cont.35875
fbgt_else.35874:
	addi	%v0, %zero, 1
fbgt_cont.35875:
	fblt	%f0, %f1, fbgt_else.35876
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35877
fbgt_else.35876:
fbgt_cont.35877:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35878
	beqi	%v0, 0, bnei_else.35880
	addi	%v0, %zero, 0
	j	fbgt_cont.35879
bnei_else.35880:
	addi	%v0, %zero, 1
bnei_cont.35881:
	j	fbgt_cont.35879
fbgt_else.35878:
fbgt_cont.35879:
	fblt	%f0, %f2, fbgt_else.35882
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35883
fbgt_else.35882:
fbgt_cont.35883:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.35884
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.35885
fbgt_else.35884:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.35885:
	beqi	%v0, 0, bnei_else.35886
	j	bnei_cont.35887
bnei_else.35886:
	fneg	%f0, %f0
bnei_cont.35887:
	flw	%f4, 32(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.35888
	addi	%v0, %zero, 1
	j	fbgt_cont.35889
fbgt_else.35888:
	addi	%v0, %zero, 0
fbgt_cont.35889:
	fabs	%f4, %f4
	flw	%f5, 18(%sp)
	fsw	%f0, 34(%sp)
	sw	%v0, 35(%sp)
	fsw	%f4, 36(%sp)
	fblt	%f4, %f5, fbgt_else.35890
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.35892
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.35894
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.35896
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.35898
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.35900
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.35902
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.35904
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.35906
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.35908
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.35910
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.35912
	flw	%f6, 481(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35891
fbgt_else.35912:
	fmov	%f1, %f6
fbgt_cont.35913:
	j	fbgt_cont.35891
fbgt_else.35910:
	fmov	%f1, %f6
fbgt_cont.35911:
	j	fbgt_cont.35891
fbgt_else.35908:
	fmov	%f1, %f6
fbgt_cont.35909:
	j	fbgt_cont.35891
fbgt_else.35906:
	fmov	%f1, %f6
fbgt_cont.35907:
	j	fbgt_cont.35891
fbgt_else.35904:
	fmov	%f1, %f6
fbgt_cont.35905:
	j	fbgt_cont.35891
fbgt_else.35902:
	fmov	%f1, %f6
fbgt_cont.35903:
	j	fbgt_cont.35891
fbgt_else.35900:
	fmov	%f1, %f6
fbgt_cont.35901:
	j	fbgt_cont.35891
fbgt_else.35898:
	fmov	%f1, %f6
fbgt_cont.35899:
	j	fbgt_cont.35891
fbgt_else.35896:
	fmov	%f1, %f6
fbgt_cont.35897:
	j	fbgt_cont.35891
fbgt_else.35894:
	fmov	%f1, %f6
fbgt_cont.35895:
	j	fbgt_cont.35891
fbgt_else.35892:
	fmov	%f1, %f6
fbgt_cont.35893:
	j	fbgt_cont.35891
fbgt_else.35890:
	fmov	%f1, %f5
fbgt_cont.35891:
	flw	%f0, 36(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35914
	lw	%v0, 35(%sp)
	beqi	%v0, 0, bnei_else.35916
	addi	%v0, %zero, 0
	j	fbgt_cont.35915
bnei_else.35916:
	addi	%v0, %zero, 1
bnei_cont.35917:
	j	fbgt_cont.35915
fbgt_else.35914:
	lw	%v0, 35(%sp)
fbgt_cont.35915:
	fblt	%f0, %f1, fbgt_else.35918
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35919
fbgt_else.35918:
fbgt_cont.35919:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35920
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35921
fbgt_else.35920:
fbgt_cont.35921:
	flw	%f1, 21(%sp)
	fblt	%f1, %f0, fbgt_else.35922
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.35923
fbgt_else.35922:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.35923:
	beqi	%v0, 0, bnei_else.35924
	j	bnei_cont.35925
bnei_else.35924:
	fneg	%f0, %f0
bnei_cont.35925:
	flw	%f1, 34(%sp)
	flw	%f2, 28(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 31(%sp)
	flw	%f5, 25(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f7, %f6, %f1
	flw	%f8, 20(%sp)
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
	lw	%v0, 7(%sp)
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
	lw	%v0, 13(%sp)
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
	j	bnei_cont.35697
bnei_else.35696:
bnei_cont.35697:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.35641:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2784:
	blti	%v0, 60, bgti_else.35976
	jr	%ra
bgti_else.35976:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.35978
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
	flw	%f0, 470(%zero)
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
	fblt	%f0, %f1, fbgt_else.35980
	addi	%v0, %zero, 0
	j	fbgt_cont.35981
fbgt_else.35980:
	addi	%v0, %zero, 1
fbgt_cont.35981:
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
	beqi	%v1, 0, bnei_else.35982
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 469(%zero)
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
	j	bnei_cont.35983
bnei_else.35982:
bnei_cont.35983:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.35984
	lw	%a0, 10(%sp)
	j	bnei_cont.35985
bnei_else.35984:
	addi	%a0, %zero, 1
bnei_cont.35985:
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
	beqi	%a2, 3, bnei_else.35986
	beqi	%a2, 2, bnei_else.35988
	j	bnei_cont.35987
bnei_else.35988:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.35990
	addi	%v1, %zero, 0
	j	bnei_cont.35991
bnei_else.35990:
	addi	%v1, %zero, 1
bnei_cont.35991:
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
	fbne	%f1, %f4, fbeq_else.35992
	addi	%a2, %zero, 1
	j	fbeq_cont.35993
fbeq_else.35992:
	addi	%a2, %zero, 0
fbeq_cont.35993:
	beqi	%a2, 0, bnei_else.35994
	flw	%f1, 474(%zero)
	j	bnei_cont.35995
bnei_else.35994:
	beqi	%v1, 0, bnei_else.35996
	flw	%f4, 468(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.35997
bnei_else.35996:
	flw	%f4, 474(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.35997:
bnei_cont.35995:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.35989:
	j	bnei_cont.35987
bnei_else.35986:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.35998
	addi	%v1, %zero, 1
	j	fbeq_cont.35999
fbeq_else.35998:
	addi	%v1, %zero, 0
fbeq_cont.35999:
	beqi	%v1, 0, bnei_else.36000
	fmov	%f0, %f1
	j	bnei_cont.36001
bnei_else.36000:
	fbne	%f0, %f1, fbeq_else.36002
	addi	%v1, %zero, 1
	j	fbeq_cont.36003
fbeq_else.36002:
	addi	%v1, %zero, 0
fbeq_cont.36003:
	beqi	%v1, 0, bnei_else.36004
	fmov	%f2, %f1
	j	bnei_cont.36005
bnei_else.36004:
	fblt	%f1, %f0, fbgt_else.36006
	addi	%v1, %zero, 0
	j	fbgt_cont.36007
fbgt_else.36006:
	addi	%v1, %zero, 1
fbgt_cont.36007:
	beqi	%v1, 0, bnei_else.36008
	flw	%f2, 474(%zero)
	j	bnei_cont.36009
bnei_else.36008:
	flw	%f2, 468(%zero)
bnei_cont.36009:
bnei_cont.36005:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.36001:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.36010
	addi	%v1, %zero, 1
	j	fbeq_cont.36011
fbeq_else.36010:
	addi	%v1, %zero, 0
fbeq_cont.36011:
	beqi	%v1, 0, bnei_else.36012
	fmov	%f0, %f1
	j	bnei_cont.36013
bnei_else.36012:
	fbne	%f0, %f1, fbeq_else.36014
	addi	%v1, %zero, 1
	j	fbeq_cont.36015
fbeq_else.36014:
	addi	%v1, %zero, 0
fbeq_cont.36015:
	beqi	%v1, 0, bnei_else.36016
	fmov	%f2, %f1
	j	bnei_cont.36017
bnei_else.36016:
	fblt	%f1, %f0, fbgt_else.36018
	addi	%v1, %zero, 0
	j	fbgt_cont.36019
fbgt_else.36018:
	addi	%v1, %zero, 1
fbgt_cont.36019:
	beqi	%v1, 0, bnei_else.36020
	flw	%f2, 474(%zero)
	j	bnei_cont.36021
bnei_else.36020:
	flw	%f2, 468(%zero)
bnei_cont.36021:
bnei_cont.36017:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.36013:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.36022
	addi	%v1, %zero, 1
	j	fbeq_cont.36023
fbeq_else.36022:
	addi	%v1, %zero, 0
fbeq_cont.36023:
	beqi	%v1, 0, bnei_else.36024
	fmov	%f0, %f1
	j	bnei_cont.36025
bnei_else.36024:
	fbne	%f0, %f1, fbeq_else.36026
	addi	%v1, %zero, 1
	j	fbeq_cont.36027
fbeq_else.36026:
	addi	%v1, %zero, 0
fbeq_cont.36027:
	beqi	%v1, 0, bnei_else.36028
	j	bnei_cont.36029
bnei_else.36028:
	fblt	%f1, %f0, fbgt_else.36030
	addi	%v1, %zero, 0
	j	fbgt_cont.36031
fbgt_else.36030:
	addi	%v1, %zero, 1
fbgt_cont.36031:
	beqi	%v1, 0, bnei_else.36032
	flw	%f1, 474(%zero)
	j	bnei_cont.36033
bnei_else.36032:
	flw	%f1, 468(%zero)
bnei_cont.36033:
bnei_cont.36029:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.36025:
	fsw	%f0, 2(%a0)
bnei_cont.35987:
	beqi	%a1, 0, bnei_else.36034
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2779
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.36035
bnei_else.36034:
bnei_cont.36035:
	addi	%v0, %zero, 1
	j	bnei_cont.35979
bnei_else.35978:
	addi	%v0, %zero, 0
bnei_cont.35979:
	beqi	%v0, 0, bnei_else.36036
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.36037
	jr	%ra
bgti_else.36037:
	sw	%v0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	read_nth_object.2782
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	beqi	%v0, 0, bnei_else.36039
	lw	%v0, 16(%sp)
	addi	%v0, %v0, 1
	j	read_object.2784
bnei_else.36039:
	lw	%v0, 16(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.36036:
	lw	%v0, 0(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
read_net_item.2788:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	beqi	%v0, -1, bnei_else.36055
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
	beqi	%v0, -1, bnei_else.36056
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.36058
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.36060
	lw	%v1, 7(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	read_net_item.2788
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.36061
bnei_else.36060:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.36061:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.36059
bnei_else.36058:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.36059:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.36057
bnei_else.36056:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.36057:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.36055:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_or_network.2790:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	addi	%v1, %zero, -1
	sw	%v1, 1(%sp)
	beqi	%v0, -1, bnei_else.36079
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.36081
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.36083
	addi	%v1, %zero, 3
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	read_net_item.2788
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.36084
bnei_else.36083:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.36084:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.36082
bnei_else.36081:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.36082:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.36080
bnei_else.36079:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.36080:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.36085
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
	beqi	%v0, -1, bnei_else.36086
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.36088
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2788
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.36089
bnei_else.36088:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.36089:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.36087
bnei_else.36086:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.36087:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.36090
	lw	%v0, 6(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 10(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	read_or_network.2790
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	lw	%a0, 10(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.36091
bnei_else.36090:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.36091:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.36085:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
read_and_network.2792:
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
	beqi	%v0, -1, bnei_else.36113
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.36115
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.36117
	addi	%v1, %zero, 3
	sw	%v0, 5(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	read_net_item.2788
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	sw	%v1, 2(%v0)
	j	bnei_cont.36118
bnei_else.36117:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.36118:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.36116
bnei_else.36115:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.36116:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.36114
bnei_else.36113:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.36114:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.36119
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
	beqi	%v0, -1, bnei_else.36120
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.36122
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	read_net_item.2788
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.36123
bnei_else.36122:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.36123:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.36121
bnei_else.36120:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.36121:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.36124
	lw	%v1, 6(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, -1, bnei_else.36125
	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	read_net_item.2788
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.36126
bnei_else.36125:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.36126:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.36127
	lw	%v1, 10(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	lw	%v1, 0(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	read_net_item.2788
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.36128
	lw	%v1, 12(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	j	read_and_network.2792
bnei_else.36128:
	jr	%ra
bnei_else.36127:
	jr	%ra
bnei_else.36124:
	jr	%ra
bnei_else.36119:
	jr	%ra
iter_setup_dirvec_constants.2889:
	blti	%v1, 0, bgti_else.36174
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.36175
	beqi	%a3, 2, bnei_else.36177
	addi	%a3, %zero, 5
	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.36179
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
	j	bnei_cont.36180
bnei_else.36179:
bnei_cont.36180:
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
	beqi	%a0, 0, bnei_else.36181
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f8, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f9, 2(%a0)
	fmul	%f10, %f1, %f9
	fadd	%f8, %f8, %f10
	flw	%f10, 473(%zero)
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
	j	bnei_cont.36182
bnei_else.36181:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.36182:
	flw	%f0, 3(%sp)
	fbne	%f3, %f0, fbeq_else.36183
	addi	%v1, %zero, 1
	j	fbeq_cont.36184
fbeq_else.36183:
	addi	%v1, %zero, 0
fbeq_cont.36184:
	beqi	%v1, 0, bnei_else.36185
	j	bnei_cont.36186
bnei_else.36185:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.36186:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.36176
bnei_else.36177:
	addi	%a3, %zero, 4
	flw	%f0, 470(%zero)
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
	fblt	%f2, %f0, fbgt_else.36187
	addi	%v1, %zero, 0
	j	fbgt_cont.36188
fbgt_else.36187:
	addi	%v1, %zero, 1
fbgt_cont.36188:
	beqi	%v1, 0, bnei_else.36189
	flw	%f2, 468(%zero)
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
	j	bnei_cont.36190
bnei_else.36189:
	fsw	%f2, 0(%v0)
bnei_cont.36190:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36178:
	j	bnei_cont.36176
bnei_else.36175:
	addi	%a3, %zero, 6
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.36191
	addi	%a0, %zero, 1
	j	fbeq_cont.36192
fbeq_else.36191:
	addi	%a0, %zero, 0
fbeq_cont.36192:
	beqi	%a0, 0, bnei_else.36193
	fsw	%f1, 1(%v0)
	j	bnei_cont.36194
bnei_else.36193:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36195
	addi	%a2, %zero, 0
	j	fbgt_cont.36196
fbgt_else.36195:
	addi	%a2, %zero, 1
fbgt_cont.36196:
	beqi	%a1, 0, bnei_else.36197
	beqi	%a2, 0, bnei_else.36199
	addi	%a1, %zero, 0
	j	bnei_cont.36198
bnei_else.36199:
	addi	%a1, %zero, 1
bnei_cont.36200:
	j	bnei_cont.36198
bnei_else.36197:
	add	%a1, %zero, %a2
bnei_cont.36198:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.36201
	j	bnei_cont.36202
bnei_else.36201:
	fneg	%f2, %f2
bnei_cont.36202:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.36194:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.36203
	addi	%a0, %zero, 1
	j	fbeq_cont.36204
fbeq_else.36203:
	addi	%a0, %zero, 0
fbeq_cont.36204:
	beqi	%a0, 0, bnei_else.36205
	fsw	%f1, 3(%v0)
	j	bnei_cont.36206
bnei_else.36205:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36207
	addi	%a2, %zero, 0
	j	fbgt_cont.36208
fbgt_else.36207:
	addi	%a2, %zero, 1
fbgt_cont.36208:
	beqi	%a1, 0, bnei_else.36209
	beqi	%a2, 0, bnei_else.36211
	addi	%a1, %zero, 0
	j	bnei_cont.36210
bnei_else.36211:
	addi	%a1, %zero, 1
bnei_cont.36212:
	j	bnei_cont.36210
bnei_else.36209:
	add	%a1, %zero, %a2
bnei_cont.36210:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.36213
	j	bnei_cont.36214
bnei_else.36213:
	fneg	%f2, %f2
bnei_cont.36214:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.36206:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.36215
	addi	%v1, %zero, 1
	j	fbeq_cont.36216
fbeq_else.36215:
	addi	%v1, %zero, 0
fbeq_cont.36216:
	beqi	%v1, 0, bnei_else.36217
	fsw	%f1, 5(%v0)
	j	bnei_cont.36218
bnei_else.36217:
	lw	%v1, 4(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.36219
	addi	%a1, %zero, 0
	j	fbgt_cont.36220
fbgt_else.36219:
	addi	%a1, %zero, 1
fbgt_cont.36220:
	beqi	%a0, 0, bnei_else.36221
	beqi	%a1, 0, bnei_else.36223
	addi	%a0, %zero, 0
	j	bnei_cont.36222
bnei_else.36223:
	addi	%a0, %zero, 1
bnei_cont.36224:
	j	bnei_cont.36222
bnei_else.36221:
	add	%a0, %zero, %a1
bnei_cont.36222:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.36225
	j	bnei_cont.36226
bnei_else.36225:
	fneg	%f1, %f1
bnei_cont.36226:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.36218:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36176:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.36227
	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.36228
	beqi	%a3, 2, bnei_else.36230
	addi	%a3, %zero, 5
	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.36232
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
	j	bnei_cont.36233
bnei_else.36232:
bnei_cont.36233:
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
	beqi	%a0, 0, bnei_else.36234
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 473(%zero)
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
	j	bnei_cont.36235
bnei_else.36234:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.36235:
	flw	%f0, 10(%sp)
	fbne	%f3, %f0, fbeq_else.36236
	addi	%v1, %zero, 1
	j	fbeq_cont.36237
fbeq_else.36236:
	addi	%v1, %zero, 0
fbeq_cont.36237:
	beqi	%v1, 0, bnei_else.36238
	j	bnei_cont.36239
bnei_else.36238:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.36239:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.36229
bnei_else.36230:
	addi	%a3, %zero, 4
	flw	%f0, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.36240
	addi	%v1, %zero, 0
	j	fbgt_cont.36241
fbgt_else.36240:
	addi	%v1, %zero, 1
fbgt_cont.36241:
	beqi	%v1, 0, bnei_else.36242
	flw	%f1, 468(%zero)
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
	j	bnei_cont.36243
bnei_else.36242:
	fsw	%f1, 0(%v0)
bnei_cont.36243:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36231:
	j	bnei_cont.36229
bnei_else.36228:
	addi	%a3, %zero, 6
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.36244
	addi	%a0, %zero, 1
	j	fbeq_cont.36245
fbeq_else.36244:
	addi	%a0, %zero, 0
fbeq_cont.36245:
	beqi	%a0, 0, bnei_else.36246
	fsw	%f1, 1(%v0)
	j	bnei_cont.36247
bnei_else.36246:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36248
	addi	%a2, %zero, 0
	j	fbgt_cont.36249
fbgt_else.36248:
	addi	%a2, %zero, 1
fbgt_cont.36249:
	beqi	%a1, 0, bnei_else.36250
	beqi	%a2, 0, bnei_else.36252
	addi	%a1, %zero, 0
	j	bnei_cont.36251
bnei_else.36252:
	addi	%a1, %zero, 1
bnei_cont.36253:
	j	bnei_cont.36251
bnei_else.36250:
	add	%a1, %zero, %a2
bnei_cont.36251:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.36254
	j	bnei_cont.36255
bnei_else.36254:
	fneg	%f2, %f2
bnei_cont.36255:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.36247:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.36256
	addi	%a0, %zero, 1
	j	fbeq_cont.36257
fbeq_else.36256:
	addi	%a0, %zero, 0
fbeq_cont.36257:
	beqi	%a0, 0, bnei_else.36258
	fsw	%f1, 3(%v0)
	j	bnei_cont.36259
bnei_else.36258:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36260
	addi	%a2, %zero, 0
	j	fbgt_cont.36261
fbgt_else.36260:
	addi	%a2, %zero, 1
fbgt_cont.36261:
	beqi	%a1, 0, bnei_else.36262
	beqi	%a2, 0, bnei_else.36264
	addi	%a1, %zero, 0
	j	bnei_cont.36263
bnei_else.36264:
	addi	%a1, %zero, 1
bnei_cont.36265:
	j	bnei_cont.36263
bnei_else.36262:
	add	%a1, %zero, %a2
bnei_cont.36263:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.36266
	j	bnei_cont.36267
bnei_else.36266:
	fneg	%f2, %f2
bnei_cont.36267:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.36259:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.36268
	addi	%v1, %zero, 1
	j	fbeq_cont.36269
fbeq_else.36268:
	addi	%v1, %zero, 0
fbeq_cont.36269:
	beqi	%v1, 0, bnei_else.36270
	fsw	%f1, 5(%v0)
	j	bnei_cont.36271
bnei_else.36270:
	lw	%v1, 11(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.36272
	addi	%a1, %zero, 0
	j	fbgt_cont.36273
fbgt_else.36272:
	addi	%a1, %zero, 1
fbgt_cont.36273:
	beqi	%a0, 0, bnei_else.36274
	beqi	%a1, 0, bnei_else.36276
	addi	%a0, %zero, 0
	j	bnei_cont.36275
bnei_else.36276:
	addi	%a0, %zero, 1
bnei_cont.36277:
	j	bnei_cont.36275
bnei_else.36274:
	add	%a0, %zero, %a1
bnei_cont.36275:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.36278
	j	bnei_cont.36279
bnei_else.36278:
	fneg	%f1, %f1
bnei_cont.36279:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.36271:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36229:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2889
bgti_else.36227:
	jr	%ra
bgti_else.36174:
	jr	%ra
setup_dirvec_constants.2892:
	lw	%v1, 0(%zero)
	addi	%v1, %v1, -1
	blti	%v1, 0, bgti_else.36303
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.36304
	beqi	%a3, 2, bnei_else.36306
	addi	%a3, %zero, 5
	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.36308
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
	j	bnei_cont.36309
bnei_else.36308:
bnei_cont.36309:
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
	beqi	%a0, 0, bnei_else.36310
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 473(%zero)
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
	j	bnei_cont.36311
bnei_else.36310:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.36311:
	flw	%f0, 3(%sp)
	fbne	%f3, %f0, fbeq_else.36312
	addi	%v1, %zero, 1
	j	fbeq_cont.36313
fbeq_else.36312:
	addi	%v1, %zero, 0
fbeq_cont.36313:
	beqi	%v1, 0, bnei_else.36314
	j	bnei_cont.36315
bnei_else.36314:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.36315:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.36305
bnei_else.36306:
	addi	%a3, %zero, 4
	flw	%f0, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.36316
	addi	%v1, %zero, 0
	j	fbgt_cont.36317
fbgt_else.36316:
	addi	%v1, %zero, 1
fbgt_cont.36317:
	beqi	%v1, 0, bnei_else.36318
	flw	%f1, 468(%zero)
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
	j	bnei_cont.36319
bnei_else.36318:
	fsw	%f1, 0(%v0)
bnei_cont.36319:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36307:
	j	bnei_cont.36305
bnei_else.36304:
	addi	%a3, %zero, 6
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.36320
	addi	%a0, %zero, 1
	j	fbeq_cont.36321
fbeq_else.36320:
	addi	%a0, %zero, 0
fbeq_cont.36321:
	beqi	%a0, 0, bnei_else.36322
	fsw	%f1, 1(%v0)
	j	bnei_cont.36323
bnei_else.36322:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36324
	addi	%a2, %zero, 0
	j	fbgt_cont.36325
fbgt_else.36324:
	addi	%a2, %zero, 1
fbgt_cont.36325:
	beqi	%a1, 0, bnei_else.36326
	beqi	%a2, 0, bnei_else.36328
	addi	%a1, %zero, 0
	j	bnei_cont.36327
bnei_else.36328:
	addi	%a1, %zero, 1
bnei_cont.36329:
	j	bnei_cont.36327
bnei_else.36326:
	add	%a1, %zero, %a2
bnei_cont.36327:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.36330
	j	bnei_cont.36331
bnei_else.36330:
	fneg	%f2, %f2
bnei_cont.36331:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.36323:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.36332
	addi	%a0, %zero, 1
	j	fbeq_cont.36333
fbeq_else.36332:
	addi	%a0, %zero, 0
fbeq_cont.36333:
	beqi	%a0, 0, bnei_else.36334
	fsw	%f1, 3(%v0)
	j	bnei_cont.36335
bnei_else.36334:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36336
	addi	%a2, %zero, 0
	j	fbgt_cont.36337
fbgt_else.36336:
	addi	%a2, %zero, 1
fbgt_cont.36337:
	beqi	%a1, 0, bnei_else.36338
	beqi	%a2, 0, bnei_else.36340
	addi	%a1, %zero, 0
	j	bnei_cont.36339
bnei_else.36340:
	addi	%a1, %zero, 1
bnei_cont.36341:
	j	bnei_cont.36339
bnei_else.36338:
	add	%a1, %zero, %a2
bnei_cont.36339:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.36342
	j	bnei_cont.36343
bnei_else.36342:
	fneg	%f2, %f2
bnei_cont.36343:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.36335:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.36344
	addi	%v1, %zero, 1
	j	fbeq_cont.36345
fbeq_else.36344:
	addi	%v1, %zero, 0
fbeq_cont.36345:
	beqi	%v1, 0, bnei_else.36346
	fsw	%f1, 5(%v0)
	j	bnei_cont.36347
bnei_else.36346:
	lw	%v1, 4(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.36348
	addi	%a1, %zero, 0
	j	fbgt_cont.36349
fbgt_else.36348:
	addi	%a1, %zero, 1
fbgt_cont.36349:
	beqi	%a0, 0, bnei_else.36350
	beqi	%a1, 0, bnei_else.36352
	addi	%a0, %zero, 0
	j	bnei_cont.36351
bnei_else.36352:
	addi	%a0, %zero, 1
bnei_cont.36353:
	j	bnei_cont.36351
bnei_else.36350:
	add	%a0, %zero, %a1
bnei_cont.36351:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.36354
	j	bnei_cont.36355
bnei_else.36354:
	fneg	%f1, %f1
bnei_cont.36355:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.36347:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36305:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2889
bgti_else.36303:
	jr	%ra
setup_startp_constants.2894:
	blti	%v1, 0, bgti_else.36358
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
	beqi	%a2, 2, bnei_else.36359
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.36361
	j	bnei_cont.36360
bgt_else.36361:
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
	beqi	%a3, 0, bnei_else.36363
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
	j	bnei_cont.36364
bnei_else.36363:
	fmov	%f0, %f3
bnei_cont.36364:
	beqi	%a2, 3, bnei_else.36365
	j	bnei_cont.36366
bnei_else.36365:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.36366:
	fsw	%f0, 3(%a1)
bgt_cont.36362:
	j	bnei_cont.36360
bnei_else.36359:
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
bnei_cont.36360:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2894
bgti_else.36358:
	jr	%ra
check_all_inside.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36368
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
	beqi	%a1, 1, bnei_else.36369
	beqi	%a1, 2, bnei_else.36371
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
	beqi	%a1, 0, bnei_else.36373
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
	j	bnei_cont.36374
bnei_else.36373:
	fmov	%f3, %f6
bnei_cont.36374:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.36375
	j	bnei_cont.36376
bnei_else.36375:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.36376:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36377
	addi	%a1, %zero, 0
	j	fbgt_cont.36378
fbgt_else.36377:
	addi	%a1, %zero, 1
fbgt_cont.36378:
	beqi	%a0, 0, bnei_else.36379
	beqi	%a1, 0, bnei_else.36381
	addi	%a0, %zero, 0
	j	bnei_cont.36380
bnei_else.36381:
	addi	%a0, %zero, 1
bnei_cont.36382:
	j	bnei_cont.36380
bnei_else.36379:
	add	%a0, %zero, %a1
bnei_cont.36380:
	beqi	%a0, 0, bnei_else.36383
	addi	%a0, %zero, 0
	j	bnei_cont.36370
bnei_else.36383:
	addi	%a0, %zero, 1
bnei_cont.36384:
	j	bnei_cont.36370
bnei_else.36371:
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
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36385
	addi	%a1, %zero, 0
	j	fbgt_cont.36386
fbgt_else.36385:
	addi	%a1, %zero, 1
fbgt_cont.36386:
	beqi	%a0, 0, bnei_else.36387
	beqi	%a1, 0, bnei_else.36389
	addi	%a0, %zero, 0
	j	bnei_cont.36388
bnei_else.36389:
	addi	%a0, %zero, 1
bnei_cont.36390:
	j	bnei_cont.36388
bnei_else.36387:
	add	%a0, %zero, %a1
bnei_cont.36388:
	beqi	%a0, 0, bnei_else.36391
	addi	%a0, %zero, 0
	j	bnei_cont.36370
bnei_else.36391:
	addi	%a0, %zero, 1
bnei_cont.36392:
bnei_cont.36372:
	j	bnei_cont.36370
bnei_else.36369:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.36393
	addi	%a1, %zero, 0
	j	fbgt_cont.36394
fbgt_else.36393:
	addi	%a1, %zero, 1
fbgt_cont.36394:
	beqi	%a1, 0, bnei_else.36395
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.36397
	addi	%a1, %zero, 0
	j	fbgt_cont.36398
fbgt_else.36397:
	addi	%a1, %zero, 1
fbgt_cont.36398:
	beqi	%a1, 0, bnei_else.36399
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.36401
	addi	%a1, %zero, 0
	j	bnei_cont.36396
fbgt_else.36401:
	addi	%a1, %zero, 1
fbgt_cont.36402:
	j	bnei_cont.36396
bnei_else.36399:
	addi	%a1, %zero, 0
bnei_cont.36400:
	j	bnei_cont.36396
bnei_else.36395:
	addi	%a1, %zero, 0
bnei_cont.36396:
	beqi	%a1, 0, bnei_else.36403
	lw	%a0, 6(%a0)
	j	bnei_cont.36404
bnei_else.36403:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.36405
	addi	%a0, %zero, 0
	j	bnei_cont.36406
bnei_else.36405:
	addi	%a0, %zero, 1
bnei_cont.36406:
bnei_cont.36404:
bnei_cont.36370:
	beqi	%a0, 0, bnei_else.36407
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36407:
	addi	%v0, %v0, 1
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36408
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
	beqi	%a1, 1, bnei_else.36409
	beqi	%a1, 2, bnei_else.36411
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
	beqi	%a1, 0, bnei_else.36413
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
	j	bnei_cont.36414
bnei_else.36413:
	fmov	%f3, %f6
bnei_cont.36414:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.36415
	j	bnei_cont.36416
bnei_else.36415:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.36416:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36417
	addi	%a1, %zero, 0
	j	fbgt_cont.36418
fbgt_else.36417:
	addi	%a1, %zero, 1
fbgt_cont.36418:
	beqi	%a0, 0, bnei_else.36419
	beqi	%a1, 0, bnei_else.36421
	addi	%a0, %zero, 0
	j	bnei_cont.36420
bnei_else.36421:
	addi	%a0, %zero, 1
bnei_cont.36422:
	j	bnei_cont.36420
bnei_else.36419:
	add	%a0, %zero, %a1
bnei_cont.36420:
	beqi	%a0, 0, bnei_else.36423
	addi	%a0, %zero, 0
	j	bnei_cont.36410
bnei_else.36423:
	addi	%a0, %zero, 1
bnei_cont.36424:
	j	bnei_cont.36410
bnei_else.36411:
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
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36425
	addi	%a1, %zero, 0
	j	fbgt_cont.36426
fbgt_else.36425:
	addi	%a1, %zero, 1
fbgt_cont.36426:
	beqi	%a0, 0, bnei_else.36427
	beqi	%a1, 0, bnei_else.36429
	addi	%a0, %zero, 0
	j	bnei_cont.36428
bnei_else.36429:
	addi	%a0, %zero, 1
bnei_cont.36430:
	j	bnei_cont.36428
bnei_else.36427:
	add	%a0, %zero, %a1
bnei_cont.36428:
	beqi	%a0, 0, bnei_else.36431
	addi	%a0, %zero, 0
	j	bnei_cont.36410
bnei_else.36431:
	addi	%a0, %zero, 1
bnei_cont.36432:
bnei_cont.36412:
	j	bnei_cont.36410
bnei_else.36409:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.36433
	addi	%a1, %zero, 0
	j	fbgt_cont.36434
fbgt_else.36433:
	addi	%a1, %zero, 1
fbgt_cont.36434:
	beqi	%a1, 0, bnei_else.36435
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.36437
	addi	%a1, %zero, 0
	j	fbgt_cont.36438
fbgt_else.36437:
	addi	%a1, %zero, 1
fbgt_cont.36438:
	beqi	%a1, 0, bnei_else.36439
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.36441
	addi	%a1, %zero, 0
	j	bnei_cont.36436
fbgt_else.36441:
	addi	%a1, %zero, 1
fbgt_cont.36442:
	j	bnei_cont.36436
bnei_else.36439:
	addi	%a1, %zero, 0
bnei_cont.36440:
	j	bnei_cont.36436
bnei_else.36435:
	addi	%a1, %zero, 0
bnei_cont.36436:
	beqi	%a1, 0, bnei_else.36443
	lw	%a0, 6(%a0)
	j	bnei_cont.36444
bnei_else.36443:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.36445
	addi	%a0, %zero, 0
	j	bnei_cont.36446
bnei_else.36445:
	addi	%a0, %zero, 1
bnei_cont.36446:
bnei_cont.36444:
bnei_cont.36410:
	beqi	%a0, 0, bnei_else.36447
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36447:
	addi	%v0, %v0, 1
	j	check_all_inside.2919
bnei_else.36408:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36368:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2925:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36454
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
	beqi	%a3, 1, bnei_else.36455
	beqi	%a3, 2, bnei_else.36457
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.36459
	addi	%a3, %zero, 1
	j	fbeq_cont.36460
fbeq_else.36459:
	addi	%a3, %zero, 0
fbeq_cont.36460:
	beqi	%a3, 0, bnei_else.36461
	addi	%a0, %zero, 0
	j	bnei_cont.36456
bnei_else.36461:
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
	beqi	%a3, 0, bnei_else.36463
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
	j	bnei_cont.36464
bnei_else.36463:
	fmov	%f1, %f9
bnei_cont.36464:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.36465
	j	bnei_cont.36466
bnei_else.36465:
	flw	%f3, 474(%zero)
	fsub	%f1, %f1, %f3
bnei_cont.36466:
	fmul	%f3, %f8, %f8
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	fblt	%f7, %f1, fbgt_else.36467
	addi	%a3, %zero, 0
	j	fbgt_cont.36468
fbgt_else.36467:
	addi	%a3, %zero, 1
fbgt_cont.36468:
	beqi	%a3, 0, bnei_else.36469
	lw	%a3, 6(%a1)
	beqi	%a3, 0, bnei_else.36471
	fsqrt	%f1, %f1
	fadd	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
	j	bnei_cont.36472
bnei_else.36471:
	fsqrt	%f1, %f1
	fsub	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
bnei_cont.36472:
	addi	%a0, %zero, 1
	j	bnei_cont.36456
bnei_else.36469:
	addi	%a0, %zero, 0
bnei_cont.36470:
bnei_cont.36462:
	j	bnei_cont.36456
bnei_else.36457:
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	fblt	%f6, %f7, fbgt_else.36473
	addi	%a3, %zero, 0
	j	fbgt_cont.36474
fbgt_else.36473:
	addi	%a3, %zero, 1
fbgt_cont.36474:
	beqi	%a3, 0, bnei_else.36475
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
	j	bnei_cont.36456
bnei_else.36475:
	addi	%a0, %zero, 0
bnei_cont.36476:
bnei_cont.36458:
	j	bnei_cont.36456
bnei_else.36455:
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
	fblt	%f9, %f10, fbgt_else.36477
	addi	%a3, %zero, 0
	j	fbgt_cont.36478
fbgt_else.36477:
	addi	%a3, %zero, 1
fbgt_cont.36478:
	beqi	%a3, 0, bnei_else.36479
	flw	%f9, 186(%zero)
	fmul	%f9, %f6, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	lw	%a3, 4(%a1)
	flw	%f10, 2(%a3)
	fblt	%f9, %f10, fbgt_else.36481
	addi	%a3, %zero, 0
	j	fbgt_cont.36482
fbgt_else.36481:
	addi	%a3, %zero, 1
fbgt_cont.36482:
	beqi	%a3, 0, bnei_else.36483
	flw	%f9, 470(%zero)
	fbne	%f7, %f9, fbeq_else.36485
	addi	%a3, %zero, 1
	j	fbeq_cont.36486
fbeq_else.36485:
	addi	%a3, %zero, 0
fbeq_cont.36486:
	beqi	%a3, 0, bnei_else.36487
	addi	%a3, %zero, 0
	j	bnei_cont.36480
bnei_else.36487:
	addi	%a3, %zero, 1
bnei_cont.36488:
	j	bnei_cont.36480
bnei_else.36483:
	addi	%a3, %zero, 0
bnei_cont.36484:
	j	bnei_cont.36480
bnei_else.36479:
	addi	%a3, %zero, 0
bnei_cont.36480:
	beqi	%a3, 0, bnei_else.36489
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.36490
bnei_else.36489:
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
	fblt	%f10, %f11, fbgt_else.36491
	addi	%a3, %zero, 0
	j	fbgt_cont.36492
fbgt_else.36491:
	addi	%a3, %zero, 1
fbgt_cont.36492:
	beqi	%a3, 0, bnei_else.36493
	flw	%f10, 186(%zero)
	fmul	%f10, %f6, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	lw	%a3, 4(%a1)
	flw	%f11, 2(%a3)
	fblt	%f10, %f11, fbgt_else.36495
	addi	%a3, %zero, 0
	j	fbgt_cont.36496
fbgt_else.36495:
	addi	%a3, %zero, 1
fbgt_cont.36496:
	beqi	%a3, 0, bnei_else.36497
	flw	%f10, 470(%zero)
	fbne	%f7, %f10, fbeq_else.36499
	addi	%a3, %zero, 1
	j	fbeq_cont.36500
fbeq_else.36499:
	addi	%a3, %zero, 0
fbeq_cont.36500:
	beqi	%a3, 0, bnei_else.36501
	addi	%a3, %zero, 0
	j	bnei_cont.36494
bnei_else.36501:
	addi	%a3, %zero, 1
bnei_cont.36502:
	j	bnei_cont.36494
bnei_else.36497:
	addi	%a3, %zero, 0
bnei_cont.36498:
	j	bnei_cont.36494
bnei_else.36493:
	addi	%a3, %zero, 0
bnei_cont.36494:
	beqi	%a3, 0, bnei_else.36503
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36504
bnei_else.36503:
	flw	%f6, 4(%a0)
	fsub	%f5, %f6, %f5
	flw	%f6, 5(%a0)
	fmul	%f5, %f5, %f6
	fmul	%f7, %f5, %f9
	fadd	%f1, %f7, %f1
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f7, 0(%a0)
	fblt	%f1, %f7, fbgt_else.36505
	addi	%a0, %zero, 0
	j	fbgt_cont.36506
fbgt_else.36505:
	addi	%a0, %zero, 1
fbgt_cont.36506:
	beqi	%a0, 0, bnei_else.36507
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f3, 1(%a0)
	fblt	%f1, %f3, fbgt_else.36509
	addi	%a0, %zero, 0
	j	fbgt_cont.36510
fbgt_else.36509:
	addi	%a0, %zero, 1
fbgt_cont.36510:
	beqi	%a0, 0, bnei_else.36511
	flw	%f1, 470(%zero)
	fbne	%f6, %f1, fbeq_else.36513
	addi	%a0, %zero, 1
	j	fbeq_cont.36514
fbeq_else.36513:
	addi	%a0, %zero, 0
fbeq_cont.36514:
	beqi	%a0, 0, bnei_else.36515
	addi	%a0, %zero, 0
	j	bnei_cont.36508
bnei_else.36515:
	addi	%a0, %zero, 1
bnei_cont.36516:
	j	bnei_cont.36508
bnei_else.36511:
	addi	%a0, %zero, 0
bnei_cont.36512:
	j	bnei_cont.36508
bnei_else.36507:
	addi	%a0, %zero, 0
bnei_cont.36508:
	beqi	%a0, 0, bnei_else.36517
	fsw	%f5, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36518
bnei_else.36517:
	addi	%a0, %zero, 0
bnei_cont.36518:
bnei_cont.36504:
bnei_cont.36490:
bnei_cont.36456:
	flw	%f1, 135(%zero)
	beqi	%a0, 0, bnei_else.36519
	flw	%f3, 467(%zero)
	fblt	%f1, %f3, fbgt_else.36521
	addi	%a0, %zero, 0
	j	bnei_cont.36520
fbgt_else.36521:
	addi	%a0, %zero, 1
fbgt_cont.36522:
	j	bnei_cont.36520
bnei_else.36519:
	addi	%a0, %zero, 0
bnei_cont.36520:
	beqi	%a0, 0, bnei_else.36523
	flw	%f3, 466(%zero)
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
	beqi	%a0, -1, bnei_else.36524
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
	beqi	%a1, 1, bnei_else.36526
	beqi	%a1, 2, bnei_else.36528
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
	beqi	%a1, 0, bnei_else.36530
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
	j	bnei_cont.36531
bnei_else.36530:
	fmov	%f3, %f6
bnei_cont.36531:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.36532
	j	bnei_cont.36533
bnei_else.36532:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.36533:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36534
	addi	%a1, %zero, 0
	j	fbgt_cont.36535
fbgt_else.36534:
	addi	%a1, %zero, 1
fbgt_cont.36535:
	beqi	%a0, 0, bnei_else.36536
	beqi	%a1, 0, bnei_else.36538
	addi	%a0, %zero, 0
	j	bnei_cont.36537
bnei_else.36538:
	addi	%a0, %zero, 1
bnei_cont.36539:
	j	bnei_cont.36537
bnei_else.36536:
	add	%a0, %zero, %a1
bnei_cont.36537:
	beqi	%a0, 0, bnei_else.36540
	addi	%a0, %zero, 0
	j	bnei_cont.36527
bnei_else.36540:
	addi	%a0, %zero, 1
bnei_cont.36541:
	j	bnei_cont.36527
bnei_else.36528:
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
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36542
	addi	%a1, %zero, 0
	j	fbgt_cont.36543
fbgt_else.36542:
	addi	%a1, %zero, 1
fbgt_cont.36543:
	beqi	%a0, 0, bnei_else.36544
	beqi	%a1, 0, bnei_else.36546
	addi	%a0, %zero, 0
	j	bnei_cont.36545
bnei_else.36546:
	addi	%a0, %zero, 1
bnei_cont.36547:
	j	bnei_cont.36545
bnei_else.36544:
	add	%a0, %zero, %a1
bnei_cont.36545:
	beqi	%a0, 0, bnei_else.36548
	addi	%a0, %zero, 0
	j	bnei_cont.36527
bnei_else.36548:
	addi	%a0, %zero, 1
bnei_cont.36549:
bnei_cont.36529:
	j	bnei_cont.36527
bnei_else.36526:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.36550
	addi	%a1, %zero, 0
	j	fbgt_cont.36551
fbgt_else.36550:
	addi	%a1, %zero, 1
fbgt_cont.36551:
	beqi	%a1, 0, bnei_else.36552
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.36554
	addi	%a1, %zero, 0
	j	fbgt_cont.36555
fbgt_else.36554:
	addi	%a1, %zero, 1
fbgt_cont.36555:
	beqi	%a1, 0, bnei_else.36556
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.36558
	addi	%a1, %zero, 0
	j	bnei_cont.36553
fbgt_else.36558:
	addi	%a1, %zero, 1
fbgt_cont.36559:
	j	bnei_cont.36553
bnei_else.36556:
	addi	%a1, %zero, 0
bnei_cont.36557:
	j	bnei_cont.36553
bnei_else.36552:
	addi	%a1, %zero, 0
bnei_cont.36553:
	beqi	%a1, 0, bnei_else.36560
	lw	%a0, 6(%a0)
	j	bnei_cont.36561
bnei_else.36560:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.36562
	addi	%a0, %zero, 0
	j	bnei_cont.36563
bnei_else.36562:
	addi	%a0, %zero, 1
bnei_cont.36563:
bnei_cont.36561:
bnei_cont.36527:
	beqi	%a0, 0, bnei_else.36564
	addi	%v0, %zero, 0
	j	bnei_cont.36525
bnei_else.36564:
	addi	%v0, %a2, 0
	fmov	%f29, %f2
	fmov	%f2, %f1
	fmov	%f1, %f29
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	check_all_inside.2919
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
bnei_cont.36565:
	j	bnei_cont.36525
bnei_else.36524:
	addi	%v0, %zero, 1
bnei_cont.36525:
	beqi	%v0, 0, bnei_else.36566
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36566:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2925
bnei_else.36523:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.36567
	addi	%v0, %v0, 1
	j	shadow_check_and_group.2925
bnei_else.36567:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36454:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2928:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36579
	lw	%a0, 83(%a0)
	addi	%a1, %zero, 0
	sw	%a1, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, 0, bnei_else.36580
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36580:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36581
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36582
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36582:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36583
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.36584
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36584:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36585
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, 0, bnei_else.36586
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36586:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2928
bnei_else.36585:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36583:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36581:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36579:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2931:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.36619
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.36620
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
	beqi	%t0, 1, bnei_else.36622
	beqi	%t0, 2, bnei_else.36624
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.36626
	addi	%t0, %zero, 1
	j	fbeq_cont.36627
fbeq_else.36626:
	addi	%t0, %zero, 0
fbeq_cont.36627:
	beqi	%t0, 0, bnei_else.36628
	addi	%a2, %zero, 0
	j	bnei_cont.36623
bnei_else.36628:
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
	beqi	%t0, 0, bnei_else.36630
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
	j	bnei_cont.36631
bnei_else.36630:
	fmov	%f0, %f6
bnei_cont.36631:
	lw	%t0, 1(%a3)
	beqi	%t0, 3, bnei_else.36632
	j	bnei_cont.36633
bnei_else.36632:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.36633:
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0
	fsub	%f0, %f1, %f0
	fblt	%f4, %f0, fbgt_else.36634
	addi	%t0, %zero, 0
	j	fbgt_cont.36635
fbgt_else.36634:
	addi	%t0, %zero, 1
fbgt_cont.36635:
	beqi	%t0, 0, bnei_else.36636
	lw	%a3, 6(%a3)
	beqi	%a3, 0, bnei_else.36638
	fsqrt	%f0, %f0
	fadd	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.36639
bnei_else.36638:
	fsqrt	%f0, %f0
	fsub	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.36639:
	addi	%a2, %zero, 1
	j	bnei_cont.36623
bnei_else.36636:
	addi	%a2, %zero, 0
bnei_cont.36637:
bnei_cont.36629:
	j	bnei_cont.36623
bnei_else.36624:
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36640
	addi	%a3, %zero, 0
	j	fbgt_cont.36641
fbgt_else.36640:
	addi	%a3, %zero, 1
fbgt_cont.36641:
	beqi	%a3, 0, bnei_else.36642
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
	j	bnei_cont.36623
bnei_else.36642:
	addi	%a2, %zero, 0
bnei_cont.36643:
bnei_cont.36625:
	j	bnei_cont.36623
bnei_else.36622:
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
	fblt	%f6, %f7, fbgt_else.36644
	addi	%t0, %zero, 0
	j	fbgt_cont.36645
fbgt_else.36644:
	addi	%t0, %zero, 1
fbgt_cont.36645:
	beqi	%t0, 0, bnei_else.36646
	flw	%f6, 186(%zero)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t0, 4(%a3)
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.36648
	addi	%t0, %zero, 0
	j	fbgt_cont.36649
fbgt_else.36648:
	addi	%t0, %zero, 1
fbgt_cont.36649:
	beqi	%t0, 0, bnei_else.36650
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.36652
	addi	%t0, %zero, 1
	j	fbeq_cont.36653
fbeq_else.36652:
	addi	%t0, %zero, 0
fbeq_cont.36653:
	beqi	%t0, 0, bnei_else.36654
	addi	%t0, %zero, 0
	j	bnei_cont.36647
bnei_else.36654:
	addi	%t0, %zero, 1
bnei_cont.36655:
	j	bnei_cont.36647
bnei_else.36650:
	addi	%t0, %zero, 0
bnei_cont.36651:
	j	bnei_cont.36647
bnei_else.36646:
	addi	%t0, %zero, 0
bnei_cont.36647:
	beqi	%t0, 0, bnei_else.36656
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 1
	j	bnei_cont.36657
bnei_else.36656:
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
	fblt	%f7, %f8, fbgt_else.36658
	addi	%t0, %zero, 0
	j	fbgt_cont.36659
fbgt_else.36658:
	addi	%t0, %zero, 1
fbgt_cont.36659:
	beqi	%t0, 0, bnei_else.36660
	flw	%f7, 186(%zero)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.36662
	addi	%t0, %zero, 0
	j	fbgt_cont.36663
fbgt_else.36662:
	addi	%t0, %zero, 1
fbgt_cont.36663:
	beqi	%t0, 0, bnei_else.36664
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.36666
	addi	%t0, %zero, 1
	j	fbeq_cont.36667
fbeq_else.36666:
	addi	%t0, %zero, 0
fbeq_cont.36667:
	beqi	%t0, 0, bnei_else.36668
	addi	%t0, %zero, 0
	j	bnei_cont.36661
bnei_else.36668:
	addi	%t0, %zero, 1
bnei_cont.36669:
	j	bnei_cont.36661
bnei_else.36664:
	addi	%t0, %zero, 0
bnei_cont.36665:
	j	bnei_cont.36661
bnei_else.36660:
	addi	%t0, %zero, 0
bnei_cont.36661:
	beqi	%t0, 0, bnei_else.36670
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 2
	j	bnei_cont.36671
bnei_else.36670:
	flw	%f3, 4(%a2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f4, 0(%a2)
	fblt	%f0, %f4, fbgt_else.36672
	addi	%a2, %zero, 0
	j	fbgt_cont.36673
fbgt_else.36672:
	addi	%a2, %zero, 1
fbgt_cont.36673:
	beqi	%a2, 0, bnei_else.36674
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f1, 1(%a2)
	fblt	%f0, %f1, fbgt_else.36676
	addi	%a2, %zero, 0
	j	fbgt_cont.36677
fbgt_else.36676:
	addi	%a2, %zero, 1
fbgt_cont.36677:
	beqi	%a2, 0, bnei_else.36678
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.36680
	addi	%a2, %zero, 1
	j	fbeq_cont.36681
fbeq_else.36680:
	addi	%a2, %zero, 0
fbeq_cont.36681:
	beqi	%a2, 0, bnei_else.36682
	addi	%a2, %zero, 0
	j	bnei_cont.36675
bnei_else.36682:
	addi	%a2, %zero, 1
bnei_cont.36683:
	j	bnei_cont.36675
bnei_else.36678:
	addi	%a2, %zero, 0
bnei_cont.36679:
	j	bnei_cont.36675
bnei_else.36674:
	addi	%a2, %zero, 0
bnei_cont.36675:
	beqi	%a2, 0, bnei_else.36684
	fsw	%f2, 135(%zero)
	addi	%a2, %zero, 3
	j	bnei_cont.36685
bnei_else.36684:
	addi	%a2, %zero, 0
bnei_cont.36685:
bnei_cont.36671:
bnei_cont.36657:
bnei_cont.36623:
	beqi	%a2, 0, bnei_else.36686
	flw	%f0, 135(%zero)
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.36688
	addi	%a2, %zero, 0
	j	fbgt_cont.36689
fbgt_else.36688:
	addi	%a2, %zero, 1
fbgt_cont.36689:
	beqi	%a2, 0, bnei_else.36690
	lw	%a2, 1(%a0)
	beqi	%a2, -1, bnei_else.36692
	lw	%a2, 83(%a2)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36694
	addi	%v0, %zero, 1
	j	bnei_cont.36693
bnei_else.36694:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.36696
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36698
	addi	%v0, %zero, 1
	j	bnei_cont.36693
bnei_else.36698:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.36700
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36702
	addi	%v0, %zero, 1
	j	bnei_cont.36693
bnei_else.36702:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2928
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.36703:
	j	bnei_cont.36693
bnei_else.36700:
	addi	%v0, %zero, 0
bnei_cont.36701:
bnei_cont.36699:
	j	bnei_cont.36693
bnei_else.36696:
	addi	%v0, %zero, 0
bnei_cont.36697:
bnei_cont.36695:
	j	bnei_cont.36693
bnei_else.36692:
	addi	%v0, %zero, 0
bnei_cont.36693:
	beqi	%v0, 0, bnei_else.36704
	addi	%v0, %zero, 1
	j	bnei_cont.36621
bnei_else.36704:
	addi	%v0, %zero, 0
bnei_cont.36705:
	j	bnei_cont.36621
bnei_else.36690:
	addi	%v0, %zero, 0
bnei_cont.36691:
	j	bnei_cont.36621
bnei_else.36686:
	addi	%v0, %zero, 0
bnei_cont.36687:
	j	bnei_cont.36621
bnei_else.36620:
	addi	%v0, %zero, 1
bnei_cont.36621:
	beqi	%v0, 0, bnei_else.36706
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.36707
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36709
	addi	%v0, %zero, 1
	j	bnei_cont.36708
bnei_else.36709:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.36711
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36713
	addi	%v0, %zero, 1
	j	bnei_cont.36708
bnei_else.36713:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.36715
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2925
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36717
	addi	%v0, %zero, 1
	j	bnei_cont.36708
bnei_else.36717:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2928
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.36718:
	j	bnei_cont.36708
bnei_else.36715:
	addi	%v0, %zero, 0
bnei_cont.36716:
bnei_cont.36714:
	j	bnei_cont.36708
bnei_else.36711:
	addi	%v0, %zero, 0
bnei_cont.36712:
bnei_cont.36710:
	j	bnei_cont.36708
bnei_else.36707:
	addi	%v0, %zero, 0
bnei_cont.36708:
	beqi	%v0, 0, bnei_else.36719
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36719:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2931
bnei_else.36706:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2931
bnei_else.36619:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2934:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.36754
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
	beqi	%t0, 1, bnei_else.36755
	beqi	%t0, 2, bnei_else.36757
	flw	%f6, 0(%a0)
	flw	%f7, 1(%a0)
	flw	%f8, 2(%a0)
	fmul	%f9, %f6, %f6
	lw	%t0, 4(%a2)
	flw	%f10, 0(%t0)
	fmul	%f9, %f9, %f10
	fmul	%f11, %f7, %f7
	lw	%t0, 4(%a2)
	flw	%f12, 1(%t0)
	fmul	%f11, %f11, %f12
	fadd	%f9, %f9, %f11
	fmul	%f11, %f8, %f8
	lw	%t0, 4(%a2)
	flw	%f13, 2(%t0)
	fmul	%f11, %f11, %f13
	fadd	%f9, %f9, %f11
	lw	%t0, 3(%a2)
	beqi	%t0, 0, bnei_else.36759
	fmul	%f11, %f7, %f8
	lw	%t1, 9(%a2)
	flw	%f14, 0(%t1)
	fmul	%f11, %f11, %f14
	fadd	%f9, %f9, %f11
	fmul	%f11, %f8, %f6
	lw	%t1, 9(%a2)
	flw	%f14, 1(%t1)
	fmul	%f11, %f11, %f14
	fadd	%f9, %f9, %f11
	fmul	%f11, %f6, %f7
	lw	%t1, 9(%a2)
	flw	%f14, 2(%t1)
	fmul	%f11, %f11, %f14
	fadd	%f9, %f9, %f11
	j	bnei_cont.36760
bnei_else.36759:
bnei_cont.36760:
	flw	%f11, 470(%zero)
	fbne	%f9, %f11, fbeq_else.36761
	addi	%t1, %zero, 1
	j	fbeq_cont.36762
fbeq_else.36761:
	addi	%t1, %zero, 0
fbeq_cont.36762:
	beqi	%t1, 0, bnei_else.36763
	addi	%t0, %zero, 0
	j	bnei_cont.36756
bnei_else.36763:
	fmul	%f14, %f6, %f1
	fmul	%f14, %f14, %f10
	fmul	%f15, %f7, %f3
	fmul	%f15, %f15, %f12
	fadd	%f14, %f14, %f15
	fmul	%f15, %f8, %f5
	fmul	%f15, %f15, %f13
	fadd	%f14, %f14, %f15
	beqi	%t0, 0, bnei_else.36765
	fmul	%f15, %f8, %f3
	fmul	%f16, %f7, %f5
	fadd	%f15, %f15, %f16
	lw	%t1, 9(%a2)
	flw	%f16, 0(%t1)
	fmul	%f15, %f15, %f16
	fmul	%f16, %f6, %f5
	fmul	%f8, %f8, %f1
	fadd	%f8, %f16, %f8
	lw	%t1, 9(%a2)
	flw	%f16, 1(%t1)
	fmul	%f8, %f8, %f16
	fadd	%f8, %f15, %f8
	fmul	%f6, %f6, %f3
	fmul	%f7, %f7, %f1
	fadd	%f6, %f6, %f7
	lw	%t1, 9(%a2)
	flw	%f7, 2(%t1)
	fmul	%f6, %f6, %f7
	fadd	%f6, %f8, %f6
	flw	%f7, 473(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f6, %f14, %f6
	j	bnei_cont.36766
bnei_else.36765:
	fmov	%f6, %f14
bnei_cont.36766:
	fmul	%f7, %f1, %f1
	fmul	%f7, %f7, %f10
	fmul	%f8, %f3, %f3
	fmul	%f8, %f8, %f12
	fadd	%f7, %f7, %f8
	fmul	%f8, %f5, %f5
	fmul	%f8, %f8, %f13
	fadd	%f7, %f7, %f8
	beqi	%t0, 0, bnei_else.36767
	fmul	%f8, %f3, %f5
	lw	%t0, 9(%a2)
	flw	%f10, 0(%t0)
	fmul	%f8, %f8, %f10
	fadd	%f7, %f7, %f8
	fmul	%f5, %f5, %f1
	lw	%t0, 9(%a2)
	flw	%f8, 1(%t0)
	fmul	%f5, %f5, %f8
	fadd	%f5, %f7, %f5
	fmul	%f1, %f1, %f3
	lw	%t0, 9(%a2)
	flw	%f3, 2(%t0)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f5, %f1
	j	bnei_cont.36768
bnei_else.36767:
	fmov	%f1, %f7
bnei_cont.36768:
	lw	%t0, 1(%a2)
	beqi	%t0, 3, bnei_else.36769
	j	bnei_cont.36770
bnei_else.36769:
	flw	%f3, 474(%zero)
	fsub	%f1, %f1, %f3
bnei_cont.36770:
	fmul	%f3, %f6, %f6
	fmul	%f1, %f9, %f1
	fsub	%f1, %f3, %f1
	fblt	%f11, %f1, fbgt_else.36771
	addi	%t0, %zero, 0
	j	fbgt_cont.36772
fbgt_else.36771:
	addi	%t0, %zero, 1
fbgt_cont.36772:
	beqi	%t0, 0, bnei_else.36773
	fsqrt	%f1, %f1
	lw	%t0, 6(%a2)
	beqi	%t0, 0, bnei_else.36775
	j	bnei_cont.36776
bnei_else.36775:
	fneg	%f1, %f1
bnei_cont.36776:
	fsub	%f1, %f1, %f6
	fdiv	%f1, %f1, %f9
	fsw	%f1, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36756
bnei_else.36773:
	addi	%t0, %zero, 0
bnei_cont.36774:
bnei_cont.36764:
	j	bnei_cont.36756
bnei_else.36757:
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
	flw	%f8, 470(%zero)
	fblt	%f8, %f6, fbgt_else.36777
	addi	%t0, %zero, 0
	j	fbgt_cont.36778
fbgt_else.36777:
	addi	%t0, %zero, 1
fbgt_cont.36778:
	beqi	%t0, 0, bnei_else.36779
	fmul	%f1, %f7, %f1
	fmul	%f3, %f9, %f3
	fadd	%f1, %f1, %f3
	fmul	%f3, %f10, %f5
	fadd	%f1, %f1, %f3
	fneg	%f1, %f1
	fdiv	%f1, %f1, %f6
	fsw	%f1, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36756
bnei_else.36779:
	addi	%t0, %zero, 0
bnei_cont.36780:
bnei_cont.36758:
	j	bnei_cont.36756
bnei_else.36755:
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.36781
	addi	%t0, %zero, 1
	j	fbeq_cont.36782
fbeq_else.36781:
	addi	%t0, %zero, 0
fbeq_cont.36782:
	beqi	%t0, 0, bnei_else.36783
	addi	%t0, %zero, 0
	j	bnei_cont.36784
bnei_else.36783:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f6, %f7, fbgt_else.36785
	addi	%t2, %zero, 0
	j	fbgt_cont.36786
fbgt_else.36785:
	addi	%t2, %zero, 1
fbgt_cont.36786:
	beqi	%t1, 0, bnei_else.36787
	beqi	%t2, 0, bnei_else.36789
	addi	%t1, %zero, 0
	j	bnei_cont.36788
bnei_else.36789:
	addi	%t1, %zero, 1
bnei_cont.36790:
	j	bnei_cont.36788
bnei_else.36787:
	add	%t1, %zero, %t2
bnei_cont.36788:
	flw	%f8, 0(%t0)
	beqi	%t1, 0, bnei_else.36791
	j	bnei_cont.36792
bnei_else.36791:
	fneg	%f8, %f8
bnei_cont.36792:
	fsub	%f8, %f8, %f1
	fdiv	%f8, %f8, %f6
	flw	%f9, 1(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f3
	fabs	%f9, %f9
	flw	%f10, 1(%t0)
	fblt	%f9, %f10, fbgt_else.36793
	addi	%t1, %zero, 0
	j	fbgt_cont.36794
fbgt_else.36793:
	addi	%t1, %zero, 1
fbgt_cont.36794:
	beqi	%t1, 0, bnei_else.36795
	flw	%f9, 2(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	flw	%f10, 2(%t0)
	fblt	%f9, %f10, fbgt_else.36797
	addi	%t0, %zero, 0
	j	fbgt_cont.36798
fbgt_else.36797:
	addi	%t0, %zero, 1
fbgt_cont.36798:
	beqi	%t0, 0, bnei_else.36799
	fsw	%f8, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36796
bnei_else.36799:
	addi	%t0, %zero, 0
bnei_cont.36800:
	j	bnei_cont.36796
bnei_else.36795:
	addi	%t0, %zero, 0
bnei_cont.36796:
bnei_cont.36784:
	beqi	%t0, 0, bnei_else.36801
	addi	%t0, %zero, 1
	j	bnei_cont.36802
bnei_else.36801:
	flw	%f8, 1(%a0)
	fbne	%f8, %f7, fbeq_else.36803
	addi	%t0, %zero, 1
	j	fbeq_cont.36804
fbeq_else.36803:
	addi	%t0, %zero, 0
fbeq_cont.36804:
	beqi	%t0, 0, bnei_else.36805
	addi	%t0, %zero, 0
	j	bnei_cont.36806
bnei_else.36805:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f8, %f7, fbgt_else.36807
	addi	%t2, %zero, 0
	j	fbgt_cont.36808
fbgt_else.36807:
	addi	%t2, %zero, 1
fbgt_cont.36808:
	beqi	%t1, 0, bnei_else.36809
	beqi	%t2, 0, bnei_else.36811
	addi	%t1, %zero, 0
	j	bnei_cont.36810
bnei_else.36811:
	addi	%t1, %zero, 1
bnei_cont.36812:
	j	bnei_cont.36810
bnei_else.36809:
	add	%t1, %zero, %t2
bnei_cont.36810:
	flw	%f9, 1(%t0)
	beqi	%t1, 0, bnei_else.36813
	j	bnei_cont.36814
bnei_else.36813:
	fneg	%f9, %f9
bnei_cont.36814:
	fsub	%f9, %f9, %f3
	fdiv	%f9, %f9, %f8
	flw	%f10, 2(%a0)
	fmul	%f10, %f9, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	flw	%f11, 2(%t0)
	fblt	%f10, %f11, fbgt_else.36815
	addi	%t1, %zero, 0
	j	fbgt_cont.36816
fbgt_else.36815:
	addi	%t1, %zero, 1
fbgt_cont.36816:
	beqi	%t1, 0, bnei_else.36817
	fmul	%f10, %f9, %f6
	fadd	%f10, %f10, %f1
	fabs	%f10, %f10
	flw	%f11, 0(%t0)
	fblt	%f10, %f11, fbgt_else.36819
	addi	%t0, %zero, 0
	j	fbgt_cont.36820
fbgt_else.36819:
	addi	%t0, %zero, 1
fbgt_cont.36820:
	beqi	%t0, 0, bnei_else.36821
	fsw	%f9, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36818
bnei_else.36821:
	addi	%t0, %zero, 0
bnei_cont.36822:
	j	bnei_cont.36818
bnei_else.36817:
	addi	%t0, %zero, 0
bnei_cont.36818:
bnei_cont.36806:
	beqi	%t0, 0, bnei_else.36823
	addi	%t0, %zero, 2
	j	bnei_cont.36824
bnei_else.36823:
	flw	%f9, 2(%a0)
	fbne	%f9, %f7, fbeq_else.36825
	addi	%t0, %zero, 1
	j	fbeq_cont.36826
fbeq_else.36825:
	addi	%t0, %zero, 0
fbeq_cont.36826:
	beqi	%t0, 0, bnei_else.36827
	addi	%t0, %zero, 0
	j	bnei_cont.36828
bnei_else.36827:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f9, %f7, fbgt_else.36829
	addi	%t2, %zero, 0
	j	fbgt_cont.36830
fbgt_else.36829:
	addi	%t2, %zero, 1
fbgt_cont.36830:
	beqi	%t1, 0, bnei_else.36831
	beqi	%t2, 0, bnei_else.36833
	addi	%t1, %zero, 0
	j	bnei_cont.36832
bnei_else.36833:
	addi	%t1, %zero, 1
bnei_cont.36834:
	j	bnei_cont.36832
bnei_else.36831:
	add	%t1, %zero, %t2
bnei_cont.36832:
	flw	%f7, 2(%t0)
	beqi	%t1, 0, bnei_else.36835
	j	bnei_cont.36836
bnei_else.36835:
	fneg	%f7, %f7
bnei_cont.36836:
	fsub	%f5, %f7, %f5
	fdiv	%f5, %f5, %f9
	fmul	%f6, %f5, %f6
	fadd	%f1, %f6, %f1
	fabs	%f1, %f1
	flw	%f6, 0(%t0)
	fblt	%f1, %f6, fbgt_else.36837
	addi	%t1, %zero, 0
	j	fbgt_cont.36838
fbgt_else.36837:
	addi	%t1, %zero, 1
fbgt_cont.36838:
	beqi	%t1, 0, bnei_else.36839
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	flw	%f3, 1(%t0)
	fblt	%f1, %f3, fbgt_else.36841
	addi	%t0, %zero, 0
	j	fbgt_cont.36842
fbgt_else.36841:
	addi	%t0, %zero, 1
fbgt_cont.36842:
	beqi	%t0, 0, bnei_else.36843
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36840
bnei_else.36843:
	addi	%t0, %zero, 0
bnei_cont.36844:
	j	bnei_cont.36840
bnei_else.36839:
	addi	%t0, %zero, 0
bnei_cont.36840:
bnei_cont.36828:
	beqi	%t0, 0, bnei_else.36845
	addi	%t0, %zero, 3
	j	bnei_cont.36846
bnei_else.36845:
	addi	%t0, %zero, 0
bnei_cont.36846:
bnei_cont.36824:
bnei_cont.36802:
bnei_cont.36756:
	beqi	%t0, 0, bnei_else.36847
	flw	%f1, 135(%zero)
	flw	%f3, 470(%zero)
	fblt	%f3, %f1, fbgt_else.36848
	addi	%a2, %zero, 0
	j	fbgt_cont.36849
fbgt_else.36848:
	addi	%a2, %zero, 1
fbgt_cont.36849:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 0, bnei_else.36850
	flw	%f5, 137(%zero)
	fblt	%f1, %f5, fbgt_else.36852
	addi	%a2, %zero, 0
	j	fbgt_cont.36853
fbgt_else.36852:
	addi	%a2, %zero, 1
fbgt_cont.36853:
	beqi	%a2, 0, bnei_cont.36851
	flw	%f5, 466(%zero)
	fadd	%f1, %f1, %f5
	flw	%f5, 0(%a0)
	fmul	%f5, %f5, %f1
	fadd	%f0, %f5, %f0
	flw	%f5, 1(%a0)
	fmul	%f5, %f5, %f1
	fadd	%f2, %f5, %f2
	flw	%f5, 2(%a0)
	fmul	%f5, %f5, %f1
	fadd	%f4, %f5, %f4
	lw	%a2, 0(%v1)
	sw	%t0, 3(%sp)
	sw	%a1, 4(%sp)
	fsw	%f4, 5(%sp)
	fsw	%f2, 6(%sp)
	fsw	%f0, 7(%sp)
	fsw	%f1, 8(%sp)
	beqi	%a2, -1, bnei_else.36856
	lw	%a2, 12(%a2)
	lw	%t1, 5(%a2)
	flw	%f5, 0(%t1)
	fsub	%f5, %f0, %f5
	lw	%t1, 5(%a2)
	flw	%f6, 1(%t1)
	fsub	%f6, %f2, %f6
	lw	%t1, 5(%a2)
	flw	%f7, 2(%t1)
	fsub	%f7, %f4, %f7
	lw	%t1, 1(%a2)
	beqi	%t1, 1, bnei_else.36858
	beqi	%t1, 2, bnei_else.36860
	fmul	%f8, %f5, %f5
	lw	%t1, 4(%a2)
	flw	%f9, 0(%t1)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	lw	%t1, 4(%a2)
	flw	%f10, 1(%t1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7
	lw	%t1, 4(%a2)
	flw	%f10, 2(%t1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	lw	%t1, 3(%a2)
	beqi	%t1, 0, bnei_else.36862
	fmul	%f9, %f6, %f7
	lw	%t1, 9(%a2)
	flw	%f10, 0(%t1)
	fmul	%f9, %f9, %f10
	fadd	%f8, %f8, %f9
	fmul	%f7, %f7, %f5
	lw	%t1, 9(%a2)
	flw	%f9, 1(%t1)
	fmul	%f7, %f7, %f9
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6
	lw	%t1, 9(%a2)
	flw	%f6, 2(%t1)
	fmul	%f5, %f5, %f6
	fadd	%f5, %f7, %f5
	j	bnei_cont.36863
bnei_else.36862:
	fmov	%f5, %f8
bnei_cont.36863:
	lw	%t1, 1(%a2)
	beqi	%t1, 3, bnei_else.36864
	j	bnei_cont.36865
bnei_else.36864:
	flw	%f6, 474(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.36865:
	lw	%a2, 6(%a2)
	fblt	%f5, %f3, fbgt_else.36866
	addi	%t1, %zero, 0
	j	fbgt_cont.36867
fbgt_else.36866:
	addi	%t1, %zero, 1
fbgt_cont.36867:
	beqi	%a2, 0, bnei_else.36868
	beqi	%t1, 0, bnei_else.36870
	addi	%a2, %zero, 0
	j	bnei_cont.36869
bnei_else.36870:
	addi	%a2, %zero, 1
bnei_cont.36871:
	j	bnei_cont.36869
bnei_else.36868:
	add	%a2, %zero, %t1
bnei_cont.36869:
	beqi	%a2, 0, bnei_else.36872
	addi	%a2, %zero, 0
	j	bnei_cont.36859
bnei_else.36872:
	addi	%a2, %zero, 1
bnei_cont.36873:
	j	bnei_cont.36859
bnei_else.36860:
	lw	%t1, 4(%a2)
	flw	%f8, 0(%t1)
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%t1)
	fmul	%f6, %f8, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%t1)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	lw	%a2, 6(%a2)
	fblt	%f5, %f3, fbgt_else.36874
	addi	%t1, %zero, 0
	j	fbgt_cont.36875
fbgt_else.36874:
	addi	%t1, %zero, 1
fbgt_cont.36875:
	beqi	%a2, 0, bnei_else.36876
	beqi	%t1, 0, bnei_else.36878
	addi	%a2, %zero, 0
	j	bnei_cont.36877
bnei_else.36878:
	addi	%a2, %zero, 1
bnei_cont.36879:
	j	bnei_cont.36877
bnei_else.36876:
	add	%a2, %zero, %t1
bnei_cont.36877:
	beqi	%a2, 0, bnei_else.36880
	addi	%a2, %zero, 0
	j	bnei_cont.36859
bnei_else.36880:
	addi	%a2, %zero, 1
bnei_cont.36881:
bnei_cont.36861:
	j	bnei_cont.36859
bnei_else.36858:
	fabs	%f3, %f5
	lw	%t1, 4(%a2)
	flw	%f5, 0(%t1)
	fblt	%f3, %f5, fbgt_else.36882
	addi	%t1, %zero, 0
	j	fbgt_cont.36883
fbgt_else.36882:
	addi	%t1, %zero, 1
fbgt_cont.36883:
	beqi	%t1, 0, bnei_else.36884
	fabs	%f3, %f6
	lw	%t1, 4(%a2)
	flw	%f5, 1(%t1)
	fblt	%f3, %f5, fbgt_else.36886
	addi	%t1, %zero, 0
	j	fbgt_cont.36887
fbgt_else.36886:
	addi	%t1, %zero, 1
fbgt_cont.36887:
	beqi	%t1, 0, bnei_else.36888
	fabs	%f3, %f7
	lw	%t1, 4(%a2)
	flw	%f5, 2(%t1)
	fblt	%f3, %f5, fbgt_else.36890
	addi	%t1, %zero, 0
	j	bnei_cont.36885
fbgt_else.36890:
	addi	%t1, %zero, 1
fbgt_cont.36891:
	j	bnei_cont.36885
bnei_else.36888:
	addi	%t1, %zero, 0
bnei_cont.36889:
	j	bnei_cont.36885
bnei_else.36884:
	addi	%t1, %zero, 0
bnei_cont.36885:
	beqi	%t1, 0, bnei_else.36892
	lw	%a2, 6(%a2)
	j	bnei_cont.36893
bnei_else.36892:
	lw	%a2, 6(%a2)
	beqi	%a2, 0, bnei_else.36894
	addi	%a2, %zero, 0
	j	bnei_cont.36895
bnei_else.36894:
	addi	%a2, %zero, 1
bnei_cont.36895:
bnei_cont.36893:
bnei_cont.36859:
	beqi	%a2, 0, bnei_else.36896
	addi	%v0, %zero, 0
	j	bnei_cont.36857
bnei_else.36896:
	addi	%v0, %a3, 0
	fmov	%f1, %f2
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	check_all_inside.2919
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.36897:
	j	bnei_cont.36857
bnei_else.36856:
	addi	%v0, %zero, 1
bnei_cont.36857:
	beqi	%v0, 0, bnei_cont.36851
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
	j	bnei_cont.36851
bnei_else.36898:
bnei_cont.36899:
	j	bnei_cont.36851
bnei_else.36854:
bnei_cont.36855:
	j	bnei_cont.36851
bnei_else.36850:
bnei_cont.36851:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2934
bnei_else.36847:
	lw	%a1, 6(%a2)
	beqi	%a1, 0, bnei_else.36900
	addi	%v0, %v0, 1
	j	solve_each_element.2934
bnei_else.36900:
	jr	%ra
bnei_else.36754:
	jr	%ra
solve_one_or_network.2938:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.36935
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
	jal	solve_each_element.2934
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36936
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36937
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element.2934
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36938
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36939
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element.2934
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36940
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element.2934
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36941
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element.2934
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36942
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element.2934
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network.2938
bnei_else.36942:
	jr	%ra
bnei_else.36941:
	jr	%ra
bnei_else.36940:
	jr	%ra
bnei_else.36939:
	jr	%ra
bnei_else.36938:
	jr	%ra
bnei_else.36937:
	jr	%ra
bnei_else.36936:
	jr	%ra
bnei_else.36935:
	jr	%ra
trace_or_matrix.2942:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.37073
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.37074
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
	beqi	%t0, 1, bnei_else.37076
	beqi	%t0, 2, bnei_else.37078
	flw	%f3, 0(%a0)
	flw	%f4, 1(%a0)
	flw	%f5, 2(%a0)
	fmul	%f6, %f3, %f3
	lw	%t0, 4(%a3)
	flw	%f7, 0(%t0)
	fmul	%f6, %f6, %f7
	fmul	%f8, %f4, %f4
	lw	%t0, 4(%a3)
	flw	%f9, 1(%t0)
	fmul	%f8, %f8, %f9
	fadd	%f6, %f6, %f8
	fmul	%f8, %f5, %f5
	lw	%t0, 4(%a3)
	flw	%f10, 2(%t0)
	fmul	%f8, %f8, %f10
	fadd	%f6, %f6, %f8
	lw	%t0, 3(%a3)
	beqi	%t0, 0, bnei_else.37080
	fmul	%f8, %f4, %f5
	lw	%t1, 9(%a3)
	flw	%f11, 0(%t1)
	fmul	%f8, %f8, %f11
	fadd	%f6, %f6, %f8
	fmul	%f8, %f5, %f3
	lw	%t1, 9(%a3)
	flw	%f11, 1(%t1)
	fmul	%f8, %f8, %f11
	fadd	%f6, %f6, %f8
	fmul	%f8, %f3, %f4
	lw	%t1, 9(%a3)
	flw	%f11, 2(%t1)
	fmul	%f8, %f8, %f11
	fadd	%f6, %f6, %f8
	j	bnei_cont.37081
bnei_else.37080:
bnei_cont.37081:
	flw	%f8, 470(%zero)
	fbne	%f6, %f8, fbeq_else.37082
	addi	%t1, %zero, 1
	j	fbeq_cont.37083
fbeq_else.37082:
	addi	%t1, %zero, 0
fbeq_cont.37083:
	beqi	%t1, 0, bnei_else.37084
	addi	%a3, %zero, 0
	j	bnei_cont.37077
bnei_else.37084:
	fmul	%f11, %f3, %f0
	fmul	%f11, %f11, %f7
	fmul	%f12, %f4, %f1
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	fmul	%f12, %f5, %f2
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	beqi	%t0, 0, bnei_else.37086
	fmul	%f12, %f5, %f1
	fmul	%f13, %f4, %f2
	fadd	%f12, %f12, %f13
	lw	%t1, 9(%a3)
	flw	%f13, 0(%t1)
	fmul	%f12, %f12, %f13
	fmul	%f13, %f3, %f2
	fmul	%f5, %f5, %f0
	fadd	%f5, %f13, %f5
	lw	%t1, 9(%a3)
	flw	%f13, 1(%t1)
	fmul	%f5, %f5, %f13
	fadd	%f5, %f12, %f5
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0
	fadd	%f3, %f3, %f4
	lw	%t1, 9(%a3)
	flw	%f4, 2(%t1)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f5, %f3
	flw	%f4, 473(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f11, %f3
	j	bnei_cont.37087
bnei_else.37086:
	fmov	%f3, %f11
bnei_cont.37087:
	fmul	%f4, %f0, %f0
	fmul	%f4, %f4, %f7
	fmul	%f5, %f1, %f1
	fmul	%f5, %f5, %f9
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2
	fmul	%f5, %f5, %f10
	fadd	%f4, %f4, %f5
	beqi	%t0, 0, bnei_else.37088
	fmul	%f5, %f1, %f2
	lw	%t0, 9(%a3)
	flw	%f7, 0(%t0)
	fmul	%f5, %f5, %f7
	fadd	%f4, %f4, %f5
	fmul	%f2, %f2, %f0
	lw	%t0, 9(%a3)
	flw	%f5, 1(%t0)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1
	lw	%t0, 9(%a3)
	flw	%f1, 2(%t0)
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	j	bnei_cont.37089
bnei_else.37088:
	fmov	%f0, %f4
bnei_cont.37089:
	lw	%t0, 1(%a3)
	beqi	%t0, 3, bnei_else.37090
	j	bnei_cont.37091
bnei_else.37090:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.37091:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f8, %f0, fbgt_else.37092
	addi	%t0, %zero, 0
	j	fbgt_cont.37093
fbgt_else.37092:
	addi	%t0, %zero, 1
fbgt_cont.37093:
	beqi	%t0, 0, bnei_else.37094
	fsqrt	%f0, %f0
	lw	%a3, 6(%a3)
	beqi	%a3, 0, bnei_else.37096
	j	bnei_cont.37097
bnei_else.37096:
	fneg	%f0, %f0
bnei_cont.37097:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37077
bnei_else.37094:
	addi	%a3, %zero, 0
bnei_cont.37095:
bnei_cont.37085:
	j	bnei_cont.37077
bnei_else.37078:
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
	flw	%f5, 470(%zero)
	fblt	%f5, %f3, fbgt_else.37098
	addi	%a3, %zero, 0
	j	fbgt_cont.37099
fbgt_else.37098:
	addi	%a3, %zero, 1
fbgt_cont.37099:
	beqi	%a3, 0, bnei_else.37100
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37077
bnei_else.37100:
	addi	%a3, %zero, 0
bnei_cont.37101:
bnei_cont.37079:
	j	bnei_cont.37077
bnei_else.37076:
	flw	%f3, 0(%a0)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37102
	addi	%t0, %zero, 1
	j	fbeq_cont.37103
fbeq_else.37102:
	addi	%t0, %zero, 0
fbeq_cont.37103:
	beqi	%t0, 0, bnei_else.37104
	addi	%t0, %zero, 0
	j	bnei_cont.37105
bnei_else.37104:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f3, %f4, fbgt_else.37106
	addi	%t2, %zero, 0
	j	fbgt_cont.37107
fbgt_else.37106:
	addi	%t2, %zero, 1
fbgt_cont.37107:
	beqi	%t1, 0, bnei_else.37108
	beqi	%t2, 0, bnei_else.37110
	addi	%t1, %zero, 0
	j	bnei_cont.37109
bnei_else.37110:
	addi	%t1, %zero, 1
bnei_cont.37111:
	j	bnei_cont.37109
bnei_else.37108:
	add	%t1, %zero, %t2
bnei_cont.37109:
	flw	%f5, 0(%t0)
	beqi	%t1, 0, bnei_else.37112
	j	bnei_cont.37113
bnei_else.37112:
	fneg	%f5, %f5
bnei_cont.37113:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%t0)
	fblt	%f6, %f7, fbgt_else.37114
	addi	%t1, %zero, 0
	j	fbgt_cont.37115
fbgt_else.37114:
	addi	%t1, %zero, 1
fbgt_cont.37115:
	beqi	%t1, 0, bnei_else.37116
	flw	%f6, 2(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.37118
	addi	%t0, %zero, 0
	j	fbgt_cont.37119
fbgt_else.37118:
	addi	%t0, %zero, 1
fbgt_cont.37119:
	beqi	%t0, 0, bnei_else.37120
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.37117
bnei_else.37120:
	addi	%t0, %zero, 0
bnei_cont.37121:
	j	bnei_cont.37117
bnei_else.37116:
	addi	%t0, %zero, 0
bnei_cont.37117:
bnei_cont.37105:
	beqi	%t0, 0, bnei_else.37122
	addi	%a3, %zero, 1
	j	bnei_cont.37123
bnei_else.37122:
	flw	%f5, 1(%a0)
	fbne	%f5, %f4, fbeq_else.37124
	addi	%t0, %zero, 1
	j	fbeq_cont.37125
fbeq_else.37124:
	addi	%t0, %zero, 0
fbeq_cont.37125:
	beqi	%t0, 0, bnei_else.37126
	addi	%t0, %zero, 0
	j	bnei_cont.37127
bnei_else.37126:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f5, %f4, fbgt_else.37128
	addi	%t2, %zero, 0
	j	fbgt_cont.37129
fbgt_else.37128:
	addi	%t2, %zero, 1
fbgt_cont.37129:
	beqi	%t1, 0, bnei_else.37130
	beqi	%t2, 0, bnei_else.37132
	addi	%t1, %zero, 0
	j	bnei_cont.37131
bnei_else.37132:
	addi	%t1, %zero, 1
bnei_cont.37133:
	j	bnei_cont.37131
bnei_else.37130:
	add	%t1, %zero, %t2
bnei_cont.37131:
	flw	%f6, 1(%t0)
	beqi	%t1, 0, bnei_else.37134
	j	bnei_cont.37135
bnei_else.37134:
	fneg	%f6, %f6
bnei_cont.37135:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a0)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.37136
	addi	%t1, %zero, 0
	j	fbgt_cont.37137
fbgt_else.37136:
	addi	%t1, %zero, 1
fbgt_cont.37137:
	beqi	%t1, 0, bnei_else.37138
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%t0)
	fblt	%f7, %f8, fbgt_else.37140
	addi	%t0, %zero, 0
	j	fbgt_cont.37141
fbgt_else.37140:
	addi	%t0, %zero, 1
fbgt_cont.37141:
	beqi	%t0, 0, bnei_else.37142
	fsw	%f6, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.37139
bnei_else.37142:
	addi	%t0, %zero, 0
bnei_cont.37143:
	j	bnei_cont.37139
bnei_else.37138:
	addi	%t0, %zero, 0
bnei_cont.37139:
bnei_cont.37127:
	beqi	%t0, 0, bnei_else.37144
	addi	%a3, %zero, 2
	j	bnei_cont.37145
bnei_else.37144:
	flw	%f6, 2(%a0)
	fbne	%f6, %f4, fbeq_else.37146
	addi	%t0, %zero, 1
	j	fbeq_cont.37147
fbeq_else.37146:
	addi	%t0, %zero, 0
fbeq_cont.37147:
	beqi	%t0, 0, bnei_else.37148
	addi	%a3, %zero, 0
	j	bnei_cont.37149
bnei_else.37148:
	lw	%t0, 4(%a3)
	lw	%a3, 6(%a3)
	fblt	%f6, %f4, fbgt_else.37150
	addi	%t1, %zero, 0
	j	fbgt_cont.37151
fbgt_else.37150:
	addi	%t1, %zero, 1
fbgt_cont.37151:
	beqi	%a3, 0, bnei_else.37152
	beqi	%t1, 0, bnei_else.37154
	addi	%a3, %zero, 0
	j	bnei_cont.37153
bnei_else.37154:
	addi	%a3, %zero, 1
bnei_cont.37155:
	j	bnei_cont.37153
bnei_else.37152:
	add	%a3, %zero, %t1
bnei_cont.37153:
	flw	%f4, 2(%t0)
	beqi	%a3, 0, bnei_else.37156
	j	bnei_cont.37157
bnei_else.37156:
	fneg	%f4, %f4
bnei_cont.37157:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%t0)
	fblt	%f0, %f3, fbgt_else.37158
	addi	%a3, %zero, 0
	j	fbgt_cont.37159
fbgt_else.37158:
	addi	%a3, %zero, 1
fbgt_cont.37159:
	beqi	%a3, 0, bnei_else.37160
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.37162
	addi	%a3, %zero, 0
	j	fbgt_cont.37163
fbgt_else.37162:
	addi	%a3, %zero, 1
fbgt_cont.37163:
	beqi	%a3, 0, bnei_else.37164
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37161
bnei_else.37164:
	addi	%a3, %zero, 0
bnei_cont.37165:
	j	bnei_cont.37161
bnei_else.37160:
	addi	%a3, %zero, 0
bnei_cont.37161:
bnei_cont.37149:
	beqi	%a3, 0, bnei_else.37166
	addi	%a3, %zero, 3
	j	bnei_cont.37167
bnei_else.37166:
	addi	%a3, %zero, 0
bnei_cont.37167:
bnei_cont.37145:
bnei_cont.37123:
bnei_cont.37077:
	beqi	%a3, 0, bnei_cont.37075
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.37170
	addi	%a3, %zero, 0
	j	fbgt_cont.37171
fbgt_else.37170:
	addi	%a3, %zero, 1
fbgt_cont.37171:
	beqi	%a3, 0, bnei_cont.37075
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_cont.37075
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.37075
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.37075
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.37075
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.37075
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.37075
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_cont.37075
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.37075
bnei_else.37186:
bnei_cont.37187:
	j	bnei_cont.37075
bnei_else.37184:
bnei_cont.37185:
	j	bnei_cont.37075
bnei_else.37182:
bnei_cont.37183:
	j	bnei_cont.37075
bnei_else.37180:
bnei_cont.37181:
	j	bnei_cont.37075
bnei_else.37178:
bnei_cont.37179:
	j	bnei_cont.37075
bnei_else.37176:
bnei_cont.37177:
	j	bnei_cont.37075
bnei_else.37174:
bnei_cont.37175:
	j	bnei_cont.37075
bnei_else.37172:
bnei_cont.37173:
	j	bnei_cont.37075
bnei_else.37168:
bnei_cont.37169:
	j	bnei_cont.37075
bnei_else.37074:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.37188
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.37189
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.37189
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.37189
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.37189
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.37189
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_cont.37189
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element.2934
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.37189
bnei_else.37200:
bnei_cont.37201:
	j	bnei_cont.37189
bnei_else.37198:
bnei_cont.37199:
	j	bnei_cont.37189
bnei_else.37196:
bnei_cont.37197:
	j	bnei_cont.37189
bnei_else.37194:
bnei_cont.37195:
	j	bnei_cont.37189
bnei_else.37192:
bnei_cont.37193:
	j	bnei_cont.37189
bnei_else.37190:
bnei_cont.37191:
	j	bnei_cont.37189
bnei_else.37188:
bnei_cont.37189:
bnei_cont.37075:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.37202
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.37203
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
	beqi	%a2, 1, bnei_else.37205
	beqi	%a2, 2, bnei_else.37207
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
	beqi	%a3, 0, bnei_else.37209
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
	j	bnei_cont.37210
bnei_else.37209:
bnei_cont.37210:
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.37211
	addi	%a3, %zero, 1
	j	fbeq_cont.37212
fbeq_else.37211:
	addi	%a3, %zero, 0
fbeq_cont.37212:
	beqi	%a3, 0, bnei_else.37213
	addi	%a1, %zero, 0
	j	bnei_cont.37206
bnei_else.37213:
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
	beqi	%a3, 0, bnei_else.37215
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
	flw	%f4, 473(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f8, %f3
	j	bnei_cont.37216
bnei_else.37215:
	fmov	%f3, %f8
bnei_cont.37216:
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
	beqi	%a3, 0, bnei_else.37217
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
	j	bnei_cont.37218
bnei_else.37217:
	fmov	%f0, %f4
bnei_cont.37218:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.37219
	j	bnei_cont.37220
bnei_else.37219:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.37220:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.37221
	addi	%a3, %zero, 0
	j	fbgt_cont.37222
fbgt_else.37221:
	addi	%a3, %zero, 1
fbgt_cont.37222:
	beqi	%a3, 0, bnei_else.37223
	fsqrt	%f0, %f0
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.37225
	j	bnei_cont.37226
bnei_else.37225:
	fneg	%f0, %f0
bnei_cont.37226:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37206
bnei_else.37223:
	addi	%a1, %zero, 0
bnei_cont.37224:
bnei_cont.37214:
	j	bnei_cont.37206
bnei_else.37207:
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
	flw	%f5, 470(%zero)
	fblt	%f5, %f3, fbgt_else.37227
	addi	%a1, %zero, 0
	j	fbgt_cont.37228
fbgt_else.37227:
	addi	%a1, %zero, 1
fbgt_cont.37228:
	beqi	%a1, 0, bnei_else.37229
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37206
bnei_else.37229:
	addi	%a1, %zero, 0
bnei_cont.37230:
bnei_cont.37208:
	j	bnei_cont.37206
bnei_else.37205:
	lw	%a2, 0(%sp)
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37231
	addi	%a3, %zero, 1
	j	fbeq_cont.37232
fbeq_else.37231:
	addi	%a3, %zero, 0
fbeq_cont.37232:
	beqi	%a3, 0, bnei_else.37233
	addi	%a3, %zero, 0
	j	bnei_cont.37234
bnei_else.37233:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f3, %f4, fbgt_else.37235
	addi	%t1, %zero, 0
	j	fbgt_cont.37236
fbgt_else.37235:
	addi	%t1, %zero, 1
fbgt_cont.37236:
	beqi	%t0, 0, bnei_else.37237
	beqi	%t1, 0, bnei_else.37239
	addi	%t0, %zero, 0
	j	bnei_cont.37238
bnei_else.37239:
	addi	%t0, %zero, 1
bnei_cont.37240:
	j	bnei_cont.37238
bnei_else.37237:
	add	%t0, %zero, %t1
bnei_cont.37238:
	flw	%f5, 0(%a3)
	beqi	%t0, 0, bnei_else.37241
	j	bnei_cont.37242
bnei_else.37241:
	fneg	%f5, %f5
bnei_cont.37242:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%a3)
	fblt	%f6, %f7, fbgt_else.37243
	addi	%t0, %zero, 0
	j	fbgt_cont.37244
fbgt_else.37243:
	addi	%t0, %zero, 1
fbgt_cont.37244:
	beqi	%t0, 0, bnei_else.37245
	flw	%f6, 2(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%a3)
	fblt	%f6, %f7, fbgt_else.37247
	addi	%a3, %zero, 0
	j	fbgt_cont.37248
fbgt_else.37247:
	addi	%a3, %zero, 1
fbgt_cont.37248:
	beqi	%a3, 0, bnei_else.37249
	fsw	%f5, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37246
bnei_else.37249:
	addi	%a3, %zero, 0
bnei_cont.37250:
	j	bnei_cont.37246
bnei_else.37245:
	addi	%a3, %zero, 0
bnei_cont.37246:
bnei_cont.37234:
	beqi	%a3, 0, bnei_else.37251
	addi	%a1, %zero, 1
	j	bnei_cont.37252
bnei_else.37251:
	flw	%f5, 1(%a2)
	fbne	%f5, %f4, fbeq_else.37253
	addi	%a3, %zero, 1
	j	fbeq_cont.37254
fbeq_else.37253:
	addi	%a3, %zero, 0
fbeq_cont.37254:
	beqi	%a3, 0, bnei_else.37255
	addi	%a3, %zero, 0
	j	bnei_cont.37256
bnei_else.37255:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f5, %f4, fbgt_else.37257
	addi	%t1, %zero, 0
	j	fbgt_cont.37258
fbgt_else.37257:
	addi	%t1, %zero, 1
fbgt_cont.37258:
	beqi	%t0, 0, bnei_else.37259
	beqi	%t1, 0, bnei_else.37261
	addi	%t0, %zero, 0
	j	bnei_cont.37260
bnei_else.37261:
	addi	%t0, %zero, 1
bnei_cont.37262:
	j	bnei_cont.37260
bnei_else.37259:
	add	%t0, %zero, %t1
bnei_cont.37260:
	flw	%f6, 1(%a3)
	beqi	%t0, 0, bnei_else.37263
	j	bnei_cont.37264
bnei_else.37263:
	fneg	%f6, %f6
bnei_cont.37264:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a2)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%a3)
	fblt	%f7, %f8, fbgt_else.37265
	addi	%t0, %zero, 0
	j	fbgt_cont.37266
fbgt_else.37265:
	addi	%t0, %zero, 1
fbgt_cont.37266:
	beqi	%t0, 0, bnei_else.37267
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%a3)
	fblt	%f7, %f8, fbgt_else.37269
	addi	%a3, %zero, 0
	j	fbgt_cont.37270
fbgt_else.37269:
	addi	%a3, %zero, 1
fbgt_cont.37270:
	beqi	%a3, 0, bnei_else.37271
	fsw	%f6, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37268
bnei_else.37271:
	addi	%a3, %zero, 0
bnei_cont.37272:
	j	bnei_cont.37268
bnei_else.37267:
	addi	%a3, %zero, 0
bnei_cont.37268:
bnei_cont.37256:
	beqi	%a3, 0, bnei_else.37273
	addi	%a1, %zero, 2
	j	bnei_cont.37274
bnei_else.37273:
	flw	%f6, 2(%a2)
	fbne	%f6, %f4, fbeq_else.37275
	addi	%a3, %zero, 1
	j	fbeq_cont.37276
fbeq_else.37275:
	addi	%a3, %zero, 0
fbeq_cont.37276:
	beqi	%a3, 0, bnei_else.37277
	addi	%a1, %zero, 0
	j	bnei_cont.37278
bnei_else.37277:
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f6, %f4, fbgt_else.37279
	addi	%t0, %zero, 0
	j	fbgt_cont.37280
fbgt_else.37279:
	addi	%t0, %zero, 1
fbgt_cont.37280:
	beqi	%a1, 0, bnei_else.37281
	beqi	%t0, 0, bnei_else.37283
	addi	%a1, %zero, 0
	j	bnei_cont.37282
bnei_else.37283:
	addi	%a1, %zero, 1
bnei_cont.37284:
	j	bnei_cont.37282
bnei_else.37281:
	add	%a1, %zero, %t0
bnei_cont.37282:
	flw	%f4, 2(%a3)
	beqi	%a1, 0, bnei_else.37285
	j	bnei_cont.37286
bnei_else.37285:
	fneg	%f4, %f4
bnei_cont.37286:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%a3)
	fblt	%f0, %f3, fbgt_else.37287
	addi	%a1, %zero, 0
	j	fbgt_cont.37288
fbgt_else.37287:
	addi	%a1, %zero, 1
fbgt_cont.37288:
	beqi	%a1, 0, bnei_else.37289
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.37291
	addi	%a1, %zero, 0
	j	fbgt_cont.37292
fbgt_else.37291:
	addi	%a1, %zero, 1
fbgt_cont.37292:
	beqi	%a1, 0, bnei_else.37293
	fsw	%f2, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37290
bnei_else.37293:
	addi	%a1, %zero, 0
bnei_cont.37294:
	j	bnei_cont.37290
bnei_else.37289:
	addi	%a1, %zero, 0
bnei_cont.37290:
bnei_cont.37278:
	beqi	%a1, 0, bnei_else.37295
	addi	%a1, %zero, 3
	j	bnei_cont.37296
bnei_else.37295:
	addi	%a1, %zero, 0
bnei_cont.37296:
bnei_cont.37274:
bnei_cont.37252:
bnei_cont.37206:
	beqi	%a1, 0, bnei_cont.37204
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.37299
	addi	%a1, %zero, 0
	j	fbgt_cont.37300
fbgt_else.37299:
	addi	%a1, %zero, 1
fbgt_cont.37300:
	beqi	%a1, 0, bnei_cont.37204
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_cont.37204
	lw	%a1, 83(%a1)
	lw	%a3, 1(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.37204
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.37204
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.37204
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.37204
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.37204
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.37204
bnei_else.37313:
bnei_cont.37314:
	j	bnei_cont.37204
bnei_else.37311:
bnei_cont.37312:
	j	bnei_cont.37204
bnei_else.37309:
bnei_cont.37310:
	j	bnei_cont.37204
bnei_else.37307:
bnei_cont.37308:
	j	bnei_cont.37204
bnei_else.37305:
bnei_cont.37306:
	j	bnei_cont.37204
bnei_else.37303:
bnei_cont.37304:
	j	bnei_cont.37204
bnei_else.37301:
bnei_cont.37302:
	j	bnei_cont.37204
bnei_else.37297:
bnei_cont.37298:
	j	bnei_cont.37204
bnei_else.37203:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.37315
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.37316
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.37316
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.37316
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.37316
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.37316
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element.2934
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.37316
bnei_else.37325:
bnei_cont.37326:
	j	bnei_cont.37316
bnei_else.37323:
bnei_cont.37324:
	j	bnei_cont.37316
bnei_else.37321:
bnei_cont.37322:
	j	bnei_cont.37316
bnei_else.37319:
bnei_cont.37320:
	j	bnei_cont.37316
bnei_else.37317:
bnei_cont.37318:
	j	bnei_cont.37316
bnei_else.37315:
bnei_cont.37316:
bnei_cont.37204:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2942
bnei_else.37202:
	jr	%ra
bnei_else.37073:
	jr	%ra
solve_each_element_fast.2948:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.37363
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
	beqi	%t3, 1, bnei_else.37364
	beqi	%t3, 2, bnei_else.37366
	flw	%f3, 0(%t2)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37368
	addi	%t3, %zero, 1
	j	fbeq_cont.37369
fbeq_else.37368:
	addi	%t3, %zero, 0
fbeq_cont.37369:
	beqi	%t3, 0, bnei_else.37370
	addi	%t0, %zero, 0
	j	bnei_cont.37365
bnei_else.37370:
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
	fblt	%f4, %f1, fbgt_else.37372
	addi	%t0, %zero, 0
	j	fbgt_cont.37373
fbgt_else.37372:
	addi	%t0, %zero, 1
fbgt_cont.37373:
	beqi	%t0, 0, bnei_else.37374
	lw	%t0, 6(%a3)
	beqi	%t0, 0, bnei_else.37376
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.37377
bnei_else.37376:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.37377:
	addi	%t0, %zero, 1
	j	bnei_cont.37365
bnei_else.37374:
	addi	%t0, %zero, 0
bnei_cont.37375:
bnei_cont.37371:
	j	bnei_cont.37365
bnei_else.37366:
	flw	%f0, 0(%t2)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.37378
	addi	%t2, %zero, 0
	j	fbgt_cont.37379
fbgt_else.37378:
	addi	%t2, %zero, 1
fbgt_cont.37379:
	beqi	%t2, 0, bnei_else.37380
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.37365
bnei_else.37380:
	addi	%t0, %zero, 0
bnei_cont.37381:
bnei_cont.37367:
	j	bnei_cont.37365
bnei_else.37364:
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
	fblt	%f6, %f7, fbgt_else.37382
	addi	%t3, %zero, 0
	j	fbgt_cont.37383
fbgt_else.37382:
	addi	%t3, %zero, 1
fbgt_cont.37383:
	beqi	%t3, 0, bnei_else.37384
	flw	%f6, 2(%t0)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t3, 4(%a3)
	flw	%f7, 2(%t3)
	fblt	%f6, %f7, fbgt_else.37386
	addi	%t3, %zero, 0
	j	fbgt_cont.37387
fbgt_else.37386:
	addi	%t3, %zero, 1
fbgt_cont.37387:
	beqi	%t3, 0, bnei_else.37388
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.37390
	addi	%t3, %zero, 1
	j	fbeq_cont.37391
fbeq_else.37390:
	addi	%t3, %zero, 0
fbeq_cont.37391:
	beqi	%t3, 0, bnei_else.37392
	addi	%t3, %zero, 0
	j	bnei_cont.37385
bnei_else.37392:
	addi	%t3, %zero, 1
bnei_cont.37393:
	j	bnei_cont.37385
bnei_else.37388:
	addi	%t3, %zero, 0
bnei_cont.37389:
	j	bnei_cont.37385
bnei_else.37384:
	addi	%t3, %zero, 0
bnei_cont.37385:
	beqi	%t3, 0, bnei_else.37394
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.37395
bnei_else.37394:
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
	fblt	%f7, %f8, fbgt_else.37396
	addi	%t3, %zero, 0
	j	fbgt_cont.37397
fbgt_else.37396:
	addi	%t3, %zero, 1
fbgt_cont.37397:
	beqi	%t3, 0, bnei_else.37398
	flw	%f7, 2(%t0)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.37400
	addi	%t0, %zero, 0
	j	fbgt_cont.37401
fbgt_else.37400:
	addi	%t0, %zero, 1
fbgt_cont.37401:
	beqi	%t0, 0, bnei_else.37402
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.37404
	addi	%t0, %zero, 1
	j	fbeq_cont.37405
fbeq_else.37404:
	addi	%t0, %zero, 0
fbeq_cont.37405:
	beqi	%t0, 0, bnei_else.37406
	addi	%t0, %zero, 0
	j	bnei_cont.37399
bnei_else.37406:
	addi	%t0, %zero, 1
bnei_cont.37407:
	j	bnei_cont.37399
bnei_else.37402:
	addi	%t0, %zero, 0
bnei_cont.37403:
	j	bnei_cont.37399
bnei_else.37398:
	addi	%t0, %zero, 0
bnei_cont.37399:
	beqi	%t0, 0, bnei_else.37408
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 2
	j	bnei_cont.37409
bnei_else.37408:
	flw	%f3, 4(%t2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%t2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f4, 0(%t0)
	fblt	%f0, %f4, fbgt_else.37410
	addi	%t0, %zero, 0
	j	fbgt_cont.37411
fbgt_else.37410:
	addi	%t0, %zero, 1
fbgt_cont.37411:
	beqi	%t0, 0, bnei_else.37412
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.37414
	addi	%t0, %zero, 0
	j	fbgt_cont.37415
fbgt_else.37414:
	addi	%t0, %zero, 1
fbgt_cont.37415:
	beqi	%t0, 0, bnei_else.37416
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.37418
	addi	%t0, %zero, 1
	j	fbeq_cont.37419
fbeq_else.37418:
	addi	%t0, %zero, 0
fbeq_cont.37419:
	beqi	%t0, 0, bnei_else.37420
	addi	%t0, %zero, 0
	j	bnei_cont.37413
bnei_else.37420:
	addi	%t0, %zero, 1
bnei_cont.37421:
	j	bnei_cont.37413
bnei_else.37416:
	addi	%t0, %zero, 0
bnei_cont.37417:
	j	bnei_cont.37413
bnei_else.37412:
	addi	%t0, %zero, 0
bnei_cont.37413:
	beqi	%t0, 0, bnei_else.37422
	fsw	%f2, 135(%zero)
	addi	%t0, %zero, 3
	j	bnei_cont.37423
bnei_else.37422:
	addi	%t0, %zero, 0
bnei_cont.37423:
bnei_cont.37409:
bnei_cont.37395:
bnei_cont.37365:
	beqi	%t0, 0, bnei_else.37424
	flw	%f0, 135(%zero)
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.37425
	addi	%a3, %zero, 0
	j	fbgt_cont.37426
fbgt_else.37425:
	addi	%a3, %zero, 1
fbgt_cont.37426:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a3, 0, bnei_else.37427
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.37429
	addi	%a3, %zero, 0
	j	fbgt_cont.37430
fbgt_else.37429:
	addi	%a3, %zero, 1
fbgt_cont.37430:
	beqi	%a3, 0, bnei_cont.37428
	flw	%f2, 466(%zero)
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
	beqi	%a1, -1, bnei_else.37433
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
	beqi	%a3, 1, bnei_else.37435
	beqi	%a3, 2, bnei_else.37437
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
	beqi	%a3, 0, bnei_else.37439
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
	j	bnei_cont.37440
bnei_else.37439:
	fmov	%f5, %f8
bnei_cont.37440:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.37441
	j	bnei_cont.37442
bnei_else.37441:
	flw	%f6, 474(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.37442:
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.37443
	addi	%a3, %zero, 0
	j	fbgt_cont.37444
fbgt_else.37443:
	addi	%a3, %zero, 1
fbgt_cont.37444:
	beqi	%a1, 0, bnei_else.37445
	beqi	%a3, 0, bnei_else.37447
	addi	%a1, %zero, 0
	j	bnei_cont.37446
bnei_else.37447:
	addi	%a1, %zero, 1
bnei_cont.37448:
	j	bnei_cont.37446
bnei_else.37445:
	add	%a1, %zero, %a3
bnei_cont.37446:
	beqi	%a1, 0, bnei_else.37449
	addi	%a1, %zero, 0
	j	bnei_cont.37436
bnei_else.37449:
	addi	%a1, %zero, 1
bnei_cont.37450:
	j	bnei_cont.37436
bnei_else.37437:
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
	fblt	%f5, %f1, fbgt_else.37451
	addi	%a3, %zero, 0
	j	fbgt_cont.37452
fbgt_else.37451:
	addi	%a3, %zero, 1
fbgt_cont.37452:
	beqi	%a1, 0, bnei_else.37453
	beqi	%a3, 0, bnei_else.37455
	addi	%a1, %zero, 0
	j	bnei_cont.37454
bnei_else.37455:
	addi	%a1, %zero, 1
bnei_cont.37456:
	j	bnei_cont.37454
bnei_else.37453:
	add	%a1, %zero, %a3
bnei_cont.37454:
	beqi	%a1, 0, bnei_else.37457
	addi	%a1, %zero, 0
	j	bnei_cont.37436
bnei_else.37457:
	addi	%a1, %zero, 1
bnei_cont.37458:
bnei_cont.37438:
	j	bnei_cont.37436
bnei_else.37435:
	fabs	%f1, %f5
	lw	%a3, 4(%a1)
	flw	%f5, 0(%a3)
	fblt	%f1, %f5, fbgt_else.37459
	addi	%a3, %zero, 0
	j	fbgt_cont.37460
fbgt_else.37459:
	addi	%a3, %zero, 1
fbgt_cont.37460:
	beqi	%a3, 0, bnei_else.37461
	fabs	%f1, %f6
	lw	%a3, 4(%a1)
	flw	%f5, 1(%a3)
	fblt	%f1, %f5, fbgt_else.37463
	addi	%a3, %zero, 0
	j	fbgt_cont.37464
fbgt_else.37463:
	addi	%a3, %zero, 1
fbgt_cont.37464:
	beqi	%a3, 0, bnei_else.37465
	fabs	%f1, %f7
	lw	%a3, 4(%a1)
	flw	%f5, 2(%a3)
	fblt	%f1, %f5, fbgt_else.37467
	addi	%a3, %zero, 0
	j	bnei_cont.37462
fbgt_else.37467:
	addi	%a3, %zero, 1
fbgt_cont.37468:
	j	bnei_cont.37462
bnei_else.37465:
	addi	%a3, %zero, 0
bnei_cont.37466:
	j	bnei_cont.37462
bnei_else.37461:
	addi	%a3, %zero, 0
bnei_cont.37462:
	beqi	%a3, 0, bnei_else.37469
	lw	%a1, 6(%a1)
	j	bnei_cont.37470
bnei_else.37469:
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.37471
	addi	%a1, %zero, 0
	j	bnei_cont.37472
bnei_else.37471:
	addi	%a1, %zero, 1
bnei_cont.37472:
bnei_cont.37470:
bnei_cont.37436:
	beqi	%a1, 0, bnei_else.37473
	addi	%v0, %zero, 0
	j	bnei_cont.37434
bnei_else.37473:
	addi	%v0, %t1, 0
	fmov	%f1, %f3
	fmov	%f0, %f2
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	check_all_inside.2919
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.37474:
	j	bnei_cont.37434
bnei_else.37433:
	addi	%v0, %zero, 1
bnei_cont.37434:
	beqi	%v0, 0, bnei_cont.37428
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
	j	bnei_cont.37428
bnei_else.37475:
bnei_cont.37476:
	j	bnei_cont.37428
bnei_else.37431:
bnei_cont.37432:
	j	bnei_cont.37428
bnei_else.37427:
bnei_cont.37428:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.2948
bnei_else.37424:
	lw	%a1, 6(%a3)
	beqi	%a1, 0, bnei_else.37477
	addi	%v0, %v0, 1
	j	solve_each_element_fast.2948
bnei_else.37477:
	jr	%ra
bnei_else.37363:
	jr	%ra
solve_one_or_network_fast.2952:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.37512
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
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37513
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37514
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37515
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37516
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37517
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37518
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.37519
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	solve_one_or_network_fast.2952
bnei_else.37519:
	jr	%ra
bnei_else.37518:
	jr	%ra
bnei_else.37517:
	jr	%ra
bnei_else.37516:
	jr	%ra
bnei_else.37515:
	jr	%ra
bnei_else.37514:
	jr	%ra
bnei_else.37513:
	jr	%ra
bnei_else.37512:
	jr	%ra
trace_or_matrix_fast.2956:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.37650
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.37651
	lw	%t0, 12(%a3)
	lw	%t1, 10(%t0)
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a3
	lw	%a3, 0(%at)
	lw	%t2, 1(%t0)
	beqi	%t2, 1, bnei_else.37653
	beqi	%t2, 2, bnei_else.37655
	flw	%f3, 0(%a3)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37657
	addi	%t2, %zero, 1
	j	fbeq_cont.37658
fbeq_else.37657:
	addi	%t2, %zero, 0
fbeq_cont.37658:
	beqi	%t2, 0, bnei_else.37659
	addi	%a3, %zero, 0
	j	bnei_cont.37654
bnei_else.37659:
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
	fblt	%f4, %f1, fbgt_else.37661
	addi	%t1, %zero, 0
	j	fbgt_cont.37662
fbgt_else.37661:
	addi	%t1, %zero, 1
fbgt_cont.37662:
	beqi	%t1, 0, bnei_else.37663
	lw	%t0, 6(%t0)
	beqi	%t0, 0, bnei_else.37665
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.37666
bnei_else.37665:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.37666:
	addi	%a3, %zero, 1
	j	bnei_cont.37654
bnei_else.37663:
	addi	%a3, %zero, 0
bnei_cont.37664:
bnei_cont.37660:
	j	bnei_cont.37654
bnei_else.37655:
	flw	%f0, 0(%a3)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.37667
	addi	%a3, %zero, 0
	j	fbgt_cont.37668
fbgt_else.37667:
	addi	%a3, %zero, 1
fbgt_cont.37668:
	beqi	%a3, 0, bnei_else.37669
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37654
bnei_else.37669:
	addi	%a3, %zero, 0
bnei_cont.37670:
bnei_cont.37656:
	j	bnei_cont.37654
bnei_else.37653:
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
	fblt	%f6, %f7, fbgt_else.37671
	addi	%t2, %zero, 0
	j	fbgt_cont.37672
fbgt_else.37671:
	addi	%t2, %zero, 1
fbgt_cont.37672:
	beqi	%t2, 0, bnei_else.37673
	flw	%f6, 2(%t1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t2, 4(%t0)
	flw	%f7, 2(%t2)
	fblt	%f6, %f7, fbgt_else.37675
	addi	%t2, %zero, 0
	j	fbgt_cont.37676
fbgt_else.37675:
	addi	%t2, %zero, 1
fbgt_cont.37676:
	beqi	%t2, 0, bnei_else.37677
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.37679
	addi	%t2, %zero, 1
	j	fbeq_cont.37680
fbeq_else.37679:
	addi	%t2, %zero, 0
fbeq_cont.37680:
	beqi	%t2, 0, bnei_else.37681
	addi	%t2, %zero, 0
	j	bnei_cont.37674
bnei_else.37681:
	addi	%t2, %zero, 1
bnei_cont.37682:
	j	bnei_cont.37674
bnei_else.37677:
	addi	%t2, %zero, 0
bnei_cont.37678:
	j	bnei_cont.37674
bnei_else.37673:
	addi	%t2, %zero, 0
bnei_cont.37674:
	beqi	%t2, 0, bnei_else.37683
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37684
bnei_else.37683:
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
	fblt	%f7, %f8, fbgt_else.37685
	addi	%t2, %zero, 0
	j	fbgt_cont.37686
fbgt_else.37685:
	addi	%t2, %zero, 1
fbgt_cont.37686:
	beqi	%t2, 0, bnei_else.37687
	flw	%f7, 2(%t1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t1, 4(%t0)
	flw	%f8, 2(%t1)
	fblt	%f7, %f8, fbgt_else.37689
	addi	%t1, %zero, 0
	j	fbgt_cont.37690
fbgt_else.37689:
	addi	%t1, %zero, 1
fbgt_cont.37690:
	beqi	%t1, 0, bnei_else.37691
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.37693
	addi	%t1, %zero, 1
	j	fbeq_cont.37694
fbeq_else.37693:
	addi	%t1, %zero, 0
fbeq_cont.37694:
	beqi	%t1, 0, bnei_else.37695
	addi	%t1, %zero, 0
	j	bnei_cont.37688
bnei_else.37695:
	addi	%t1, %zero, 1
bnei_cont.37696:
	j	bnei_cont.37688
bnei_else.37691:
	addi	%t1, %zero, 0
bnei_cont.37692:
	j	bnei_cont.37688
bnei_else.37687:
	addi	%t1, %zero, 0
bnei_cont.37688:
	beqi	%t1, 0, bnei_else.37697
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 2
	j	bnei_cont.37698
bnei_else.37697:
	flw	%f3, 4(%a3)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a3)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f4, 0(%a3)
	fblt	%f0, %f4, fbgt_else.37699
	addi	%a3, %zero, 0
	j	fbgt_cont.37700
fbgt_else.37699:
	addi	%a3, %zero, 1
fbgt_cont.37700:
	beqi	%a3, 0, bnei_else.37701
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.37703
	addi	%a3, %zero, 0
	j	fbgt_cont.37704
fbgt_else.37703:
	addi	%a3, %zero, 1
fbgt_cont.37704:
	beqi	%a3, 0, bnei_else.37705
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.37707
	addi	%a3, %zero, 1
	j	fbeq_cont.37708
fbeq_else.37707:
	addi	%a3, %zero, 0
fbeq_cont.37708:
	beqi	%a3, 0, bnei_else.37709
	addi	%a3, %zero, 0
	j	bnei_cont.37702
bnei_else.37709:
	addi	%a3, %zero, 1
bnei_cont.37710:
	j	bnei_cont.37702
bnei_else.37705:
	addi	%a3, %zero, 0
bnei_cont.37706:
	j	bnei_cont.37702
bnei_else.37701:
	addi	%a3, %zero, 0
bnei_cont.37702:
	beqi	%a3, 0, bnei_else.37711
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 3
	j	bnei_cont.37712
bnei_else.37711:
	addi	%a3, %zero, 0
bnei_cont.37712:
bnei_cont.37698:
bnei_cont.37684:
bnei_cont.37654:
	beqi	%a3, 0, bnei_cont.37652
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.37715
	addi	%a3, %zero, 0
	j	fbgt_cont.37716
fbgt_else.37715:
	addi	%a3, %zero, 1
fbgt_cont.37716:
	beqi	%a3, 0, bnei_cont.37652
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_cont.37652
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.37652
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.37652
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.37652
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.37652
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.37652
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_cont.37652
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.37652
bnei_else.37731:
bnei_cont.37732:
	j	bnei_cont.37652
bnei_else.37729:
bnei_cont.37730:
	j	bnei_cont.37652
bnei_else.37727:
bnei_cont.37728:
	j	bnei_cont.37652
bnei_else.37725:
bnei_cont.37726:
	j	bnei_cont.37652
bnei_else.37723:
bnei_cont.37724:
	j	bnei_cont.37652
bnei_else.37721:
bnei_cont.37722:
	j	bnei_cont.37652
bnei_else.37719:
bnei_cont.37720:
	j	bnei_cont.37652
bnei_else.37717:
bnei_cont.37718:
	j	bnei_cont.37652
bnei_else.37713:
bnei_cont.37714:
	j	bnei_cont.37652
bnei_else.37651:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.37733
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.37734
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.37734
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.37734
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.37734
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.37734
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	lw	%v1, 7(%v0)
	beqi	%v1, -1, bnei_cont.37734
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 4(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	j	bnei_cont.37734
bnei_else.37745:
bnei_cont.37746:
	j	bnei_cont.37734
bnei_else.37743:
bnei_cont.37744:
	j	bnei_cont.37734
bnei_else.37741:
bnei_cont.37742:
	j	bnei_cont.37734
bnei_else.37739:
bnei_cont.37740:
	j	bnei_cont.37734
bnei_else.37737:
bnei_cont.37738:
	j	bnei_cont.37734
bnei_else.37735:
bnei_cont.37736:
	j	bnei_cont.37734
bnei_else.37733:
bnei_cont.37734:
bnei_cont.37652:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.37747
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.37748
	lw	%a2, 12(%a1)
	lw	%a3, 10(%a2)
	flw	%f0, 0(%a3)
	flw	%f1, 1(%a3)
	flw	%f2, 2(%a3)
	lw	%t0, 0(%sp)
	lw	%t1, 1(%t0)
	add	%at, %t1, %a1
	lw	%a1, 0(%at)
	lw	%t1, 1(%a2)
	beqi	%t1, 1, bnei_else.37750
	beqi	%t1, 2, bnei_else.37752
	flw	%f3, 0(%a1)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37754
	addi	%t1, %zero, 1
	j	fbeq_cont.37755
fbeq_else.37754:
	addi	%t1, %zero, 0
fbeq_cont.37755:
	beqi	%t1, 0, bnei_else.37756
	addi	%a1, %zero, 0
	j	bnei_cont.37751
bnei_else.37756:
	flw	%f5, 1(%a1)
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%a1)
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a1)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a3)
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	fblt	%f4, %f1, fbgt_else.37758
	addi	%a3, %zero, 0
	j	fbgt_cont.37759
fbgt_else.37758:
	addi	%a3, %zero, 1
fbgt_cont.37759:
	beqi	%a3, 0, bnei_else.37760
	lw	%a2, 6(%a2)
	beqi	%a2, 0, bnei_else.37762
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.37763
bnei_else.37762:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.37763:
	addi	%a1, %zero, 1
	j	bnei_cont.37751
bnei_else.37760:
	addi	%a1, %zero, 0
bnei_cont.37761:
bnei_cont.37757:
	j	bnei_cont.37751
bnei_else.37752:
	flw	%f0, 0(%a1)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.37764
	addi	%a1, %zero, 0
	j	fbgt_cont.37765
fbgt_else.37764:
	addi	%a1, %zero, 1
fbgt_cont.37765:
	beqi	%a1, 0, bnei_else.37766
	flw	%f1, 3(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37751
bnei_else.37766:
	addi	%a1, %zero, 0
bnei_cont.37767:
bnei_cont.37753:
	j	bnei_cont.37751
bnei_else.37750:
	lw	%a3, 0(%t0)
	flw	%f3, 0(%a1)
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a1)
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%a3)
	fmul	%f6, %f3, %f5
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	lw	%t1, 4(%a2)
	flw	%f7, 1(%t1)
	fblt	%f6, %f7, fbgt_else.37768
	addi	%t1, %zero, 0
	j	fbgt_cont.37769
fbgt_else.37768:
	addi	%t1, %zero, 1
fbgt_cont.37769:
	beqi	%t1, 0, bnei_else.37770
	flw	%f6, 2(%a3)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t1, 4(%a2)
	flw	%f8, 2(%t1)
	fblt	%f6, %f8, fbgt_else.37772
	addi	%t1, %zero, 0
	j	fbgt_cont.37773
fbgt_else.37772:
	addi	%t1, %zero, 1
fbgt_cont.37773:
	beqi	%t1, 0, bnei_else.37774
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.37776
	addi	%t1, %zero, 1
	j	fbeq_cont.37777
fbeq_else.37776:
	addi	%t1, %zero, 0
fbeq_cont.37777:
	beqi	%t1, 0, bnei_else.37778
	addi	%t1, %zero, 0
	j	bnei_cont.37771
bnei_else.37778:
	addi	%t1, %zero, 1
bnei_cont.37779:
	j	bnei_cont.37771
bnei_else.37774:
	addi	%t1, %zero, 0
bnei_cont.37775:
	j	bnei_cont.37771
bnei_else.37770:
	addi	%t1, %zero, 0
bnei_cont.37771:
	beqi	%t1, 0, bnei_else.37780
	fsw	%f3, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37781
bnei_else.37780:
	flw	%f3, 2(%a1)
	fsub	%f3, %f3, %f1
	flw	%f4, 3(%a1)
	fmul	%f3, %f3, %f4
	flw	%f6, 0(%a3)
	fmul	%f8, %f3, %f6
	fadd	%f8, %f8, %f0
	fabs	%f8, %f8
	lw	%t1, 4(%a2)
	flw	%f9, 0(%t1)
	fblt	%f8, %f9, fbgt_else.37782
	addi	%t1, %zero, 0
	j	fbgt_cont.37783
fbgt_else.37782:
	addi	%t1, %zero, 1
fbgt_cont.37783:
	beqi	%t1, 0, bnei_else.37784
	flw	%f8, 2(%a3)
	fmul	%f8, %f3, %f8
	fadd	%f8, %f8, %f2
	fabs	%f8, %f8
	lw	%a2, 4(%a2)
	flw	%f10, 2(%a2)
	fblt	%f8, %f10, fbgt_else.37786
	addi	%a2, %zero, 0
	j	fbgt_cont.37787
fbgt_else.37786:
	addi	%a2, %zero, 1
fbgt_cont.37787:
	beqi	%a2, 0, bnei_else.37788
	flw	%f8, 470(%zero)
	fbne	%f4, %f8, fbeq_else.37790
	addi	%a2, %zero, 1
	j	fbeq_cont.37791
fbeq_else.37790:
	addi	%a2, %zero, 0
fbeq_cont.37791:
	beqi	%a2, 0, bnei_else.37792
	addi	%a2, %zero, 0
	j	bnei_cont.37785
bnei_else.37792:
	addi	%a2, %zero, 1
bnei_cont.37793:
	j	bnei_cont.37785
bnei_else.37788:
	addi	%a2, %zero, 0
bnei_cont.37789:
	j	bnei_cont.37785
bnei_else.37784:
	addi	%a2, %zero, 0
bnei_cont.37785:
	beqi	%a2, 0, bnei_else.37794
	fsw	%f3, 135(%zero)
	addi	%a1, %zero, 2
	j	bnei_cont.37795
bnei_else.37794:
	flw	%f3, 4(%a1)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a1)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	fblt	%f0, %f9, fbgt_else.37796
	addi	%a1, %zero, 0
	j	fbgt_cont.37797
fbgt_else.37796:
	addi	%a1, %zero, 1
fbgt_cont.37797:
	beqi	%a1, 0, bnei_else.37798
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fblt	%f0, %f7, fbgt_else.37800
	addi	%a1, %zero, 0
	j	fbgt_cont.37801
fbgt_else.37800:
	addi	%a1, %zero, 1
fbgt_cont.37801:
	beqi	%a1, 0, bnei_else.37802
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.37804
	addi	%a1, %zero, 1
	j	fbeq_cont.37805
fbeq_else.37804:
	addi	%a1, %zero, 0
fbeq_cont.37805:
	beqi	%a1, 0, bnei_else.37806
	addi	%a1, %zero, 0
	j	bnei_cont.37799
bnei_else.37806:
	addi	%a1, %zero, 1
bnei_cont.37807:
	j	bnei_cont.37799
bnei_else.37802:
	addi	%a1, %zero, 0
bnei_cont.37803:
	j	bnei_cont.37799
bnei_else.37798:
	addi	%a1, %zero, 0
bnei_cont.37799:
	beqi	%a1, 0, bnei_else.37808
	fsw	%f2, 135(%zero)
	addi	%a1, %zero, 3
	j	bnei_cont.37809
bnei_else.37808:
	addi	%a1, %zero, 0
bnei_cont.37809:
bnei_cont.37795:
bnei_cont.37781:
bnei_cont.37751:
	beqi	%a1, 0, bnei_cont.37749
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.37812
	addi	%a1, %zero, 0
	j	fbgt_cont.37813
fbgt_else.37812:
	addi	%a1, %zero, 1
fbgt_cont.37813:
	beqi	%a1, 0, bnei_cont.37749
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_cont.37749
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %t0, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.37749
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.37749
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.37749
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.37749
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.37749
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.37749
bnei_else.37826:
bnei_cont.37827:
	j	bnei_cont.37749
bnei_else.37824:
bnei_cont.37825:
	j	bnei_cont.37749
bnei_else.37822:
bnei_cont.37823:
	j	bnei_cont.37749
bnei_else.37820:
bnei_cont.37821:
	j	bnei_cont.37749
bnei_else.37818:
bnei_cont.37819:
	j	bnei_cont.37749
bnei_else.37816:
bnei_cont.37817:
	j	bnei_cont.37749
bnei_else.37814:
bnei_cont.37815:
	j	bnei_cont.37749
bnei_else.37810:
bnei_cont.37811:
	j	bnei_cont.37749
bnei_else.37748:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.37828
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.37829
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.37829
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.37829
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 5(%v0)
	beqi	%v1, -1, bnei_cont.37829
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 6(%v0)
	beqi	%v1, -1, bnei_cont.37829
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%v0, %zero, 7
	lw	%v1, 6(%sp)
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.37829
bnei_else.37838:
bnei_cont.37839:
	j	bnei_cont.37829
bnei_else.37836:
bnei_cont.37837:
	j	bnei_cont.37829
bnei_else.37834:
bnei_cont.37835:
	j	bnei_cont.37829
bnei_else.37832:
bnei_cont.37833:
	j	bnei_cont.37829
bnei_else.37830:
bnei_cont.37831:
	j	bnei_cont.37829
bnei_else.37828:
bnei_cont.37829:
bnei_cont.37749:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2956
bnei_else.37747:
	jr	%ra
bnei_else.37650:
	jr	%ra
utexture.2971:
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
	beqi	%a0, 1, bnei_else.37941
	beqi	%a0, 2, bnei_else.37942
	beqi	%a0, 3, bnei_else.37943
	beqi	%a0, 4, bnei_else.37944
	jr	%ra
bnei_else.37944:
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
	flw	%f4, 464(%zero)
	fblt	%f3, %f4, fbgt_else.37946
	addi	%a0, %zero, 0
	j	fbgt_cont.37947
fbgt_else.37946:
	addi	%a0, %zero, 1
fbgt_cont.37947:
	beqi	%a0, 0, bnei_else.37948
	flw	%f0, 463(%zero)
	j	bnei_cont.37949
bnei_else.37948:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.37950
	addi	%a0, %zero, 1
	j	fbgt_cont.37951
fbgt_else.37950:
	addi	%a0, %zero, 0
fbgt_cont.37951:
	fabs	%f1, %f0
	flw	%f3, 462(%zero)
	fblt	%f1, %f3, fbgt_else.37952
	flw	%f0, 455(%zero)
	fblt	%f1, %f0, fbgt_else.37954
	flw	%f0, 479(%zero)
	flw	%f3, 474(%zero)
	fdiv	%f1, %f3, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 461(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 456(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fsub	%f0, %f0, %f1
	j	fbgt_cont.37955
fbgt_else.37954:
	flw	%f0, 478(%zero)
	flw	%f3, 474(%zero)
	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f5, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 461(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 456(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
fbgt_cont.37955:
	beqi	%a0, 0, bnei_else.37956
	j	fbgt_cont.37953
bnei_else.37956:
	fneg	%f0, %f0
bnei_cont.37957:
	j	fbgt_cont.37953
fbgt_else.37952:
	fmul	%f1, %f0, %f0
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	flw	%f6, 461(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f1
	fsub	%f6, %f0, %f6
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fadd	%f6, %f6, %f7
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fsub	%f1, %f6, %f1
	flw	%f6, 456(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f3
	fmul	%f0, %f0, %f5
	fadd	%f0, %f1, %f0
fbgt_cont.37953:
	flw	%f1, 454(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 453(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.37949:
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
	fblt	%f3, %f4, fbgt_else.37958
	addi	%v0, %zero, 0
	j	fbgt_cont.37959
fbgt_else.37958:
	addi	%v0, %zero, 1
fbgt_cont.37959:
	beqi	%v0, 0, bnei_else.37960
	flw	%f1, 463(%zero)
	j	bnei_cont.37961
bnei_else.37960:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 470(%zero)
	fblt	%f1, %f2, fbgt_else.37962
	addi	%v0, %zero, 1
	j	fbgt_cont.37963
fbgt_else.37962:
	addi	%v0, %zero, 0
fbgt_cont.37963:
	fabs	%f2, %f1
	flw	%f3, 462(%zero)
	fblt	%f2, %f3, fbgt_else.37964
	flw	%f1, 455(%zero)
	fblt	%f2, %f1, fbgt_else.37966
	flw	%f1, 479(%zero)
	flw	%f3, 474(%zero)
	fdiv	%f2, %f3, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 461(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 456(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fsub	%f1, %f1, %f2
	j	fbgt_cont.37967
fbgt_else.37966:
	flw	%f1, 478(%zero)
	flw	%f3, 474(%zero)
	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3
	fdiv	%f2, %f4, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 461(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 456(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
fbgt_cont.37967:
	beqi	%v0, 0, bnei_else.37968
	j	fbgt_cont.37965
bnei_else.37968:
	fneg	%f1, %f1
bnei_cont.37969:
	j	fbgt_cont.37965
fbgt_else.37964:
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	flw	%f5, 461(%zero)
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f5, %f1, %f5
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fadd	%f5, %f5, %f6
	flw	%f6, 459(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f5, %f5, %f6
	flw	%f6, 458(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 457(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fsub	%f2, %f5, %f2
	flw	%f5, 456(%zero)
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
fbgt_cont.37965:
	flw	%f2, 454(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 453(%zero)
	fdiv	%f1, %f1, %f2
bnei_cont.37961:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 452(%zero)
	flw	%f3, 473(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.37970
	addi	%v0, %zero, 0
	j	fbgt_cont.37971
fbgt_else.37970:
	addi	%v0, %zero, 1
fbgt_cont.37971:
	beqi	%v0, 0, bnei_else.37972
	fmov	%f0, %f1
	j	bnei_cont.37973
bnei_else.37972:
bnei_cont.37973:
	flw	%f1, 451(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 450(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.37943:
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
	flw	%f1, 494(%zero)
	fabs	%f0, %f0
	flw	%f2, 493(%zero)
	fsw	%f1, 0(%sp)
	fsw	%f0, 1(%sp)
	fsw	%f2, 2(%sp)
	fblt	%f0, %f2, fbgt_else.37975
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.37977
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.37979
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.37981
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.37983
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.37985
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.37987
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.37989
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.37991
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.37993
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.37995
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.37997
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.37999
	flw	%f3, 480(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.37976
fbgt_else.37999:
	fmov	%f0, %f3
fbgt_cont.38000:
	j	fbgt_cont.37976
fbgt_else.37997:
	fmov	%f0, %f3
fbgt_cont.37998:
	j	fbgt_cont.37976
fbgt_else.37995:
	fmov	%f0, %f3
fbgt_cont.37996:
	j	fbgt_cont.37976
fbgt_else.37993:
	fmov	%f0, %f3
fbgt_cont.37994:
	j	fbgt_cont.37976
fbgt_else.37991:
	fmov	%f0, %f3
fbgt_cont.37992:
	j	fbgt_cont.37976
fbgt_else.37989:
	fmov	%f0, %f3
fbgt_cont.37990:
	j	fbgt_cont.37976
fbgt_else.37987:
	fmov	%f0, %f3
fbgt_cont.37988:
	j	fbgt_cont.37976
fbgt_else.37985:
	fmov	%f0, %f3
fbgt_cont.37986:
	j	fbgt_cont.37976
fbgt_else.37983:
	fmov	%f0, %f3
fbgt_cont.37984:
	j	fbgt_cont.37976
fbgt_else.37981:
	fmov	%f0, %f3
fbgt_cont.37982:
	j	fbgt_cont.37976
fbgt_else.37979:
	fmov	%f0, %f3
fbgt_cont.37980:
	j	fbgt_cont.37976
fbgt_else.37977:
	fmov	%f0, %f3
fbgt_cont.37978:
	j	fbgt_cont.37976
fbgt_else.37975:
	fmov	%f0, %f2
fbgt_cont.37976:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	fblt	%f1, %f2, fbgt_else.38001
	fblt	%f1, %f0, fbgt_else.38003
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.38002
fbgt_else.38003:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
fbgt_cont.38004:
	j	fbgt_cont.38002
fbgt_else.38001:
	fmov	%f0, %f1
fbgt_cont.38002:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.38005
	addi	%v0, %zero, 0
	j	fbgt_cont.38006
fbgt_else.38005:
	addi	%v0, %zero, 1
fbgt_cont.38006:
	fblt	%f0, %f1, fbgt_else.38007
	fsub	%f0, %f0, %f1
	j	fbgt_cont.38008
fbgt_else.38007:
fbgt_cont.38008:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.38009
	beqi	%v0, 0, bnei_else.38011
	addi	%v0, %zero, 0
	j	fbgt_cont.38010
bnei_else.38011:
	addi	%v0, %zero, 1
bnei_cont.38012:
	j	fbgt_cont.38010
fbgt_else.38009:
fbgt_cont.38010:
	fblt	%f0, %f2, fbgt_else.38013
	fsub	%f0, %f1, %f0
	j	fbgt_cont.38014
fbgt_else.38013:
fbgt_cont.38014:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.38015
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.38016
fbgt_else.38015:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.38016:
	beqi	%v0, 0, bnei_else.38017
	j	bnei_cont.38018
bnei_else.38017:
	fneg	%f0, %f0
bnei_cont.38018:
	fmul	%f0, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 474(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.37942:
	flw	%f0, 1(%v1)
	flw	%f1, 448(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 494(%zero)
	flw	%f2, 470(%zero)
	fblt	%f0, %f2, fbgt_else.38020
	addi	%v0, %zero, 1
	j	fbgt_cont.38021
fbgt_else.38020:
	addi	%v0, %zero, 0
fbgt_cont.38021:
	fabs	%f0, %f0
	flw	%f2, 493(%zero)
	sw	%v0, 3(%sp)
	fsw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f2, 6(%sp)
	fblt	%f0, %f2, fbgt_else.38022
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.38024
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.38026
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.38028
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.38030
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.38032
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.38034
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.38036
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.38038
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.38040
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.38042
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.38044
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.38046
	flw	%f3, 480(%zero)
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	fbgt_cont.38023
fbgt_else.38046:
	fmov	%f0, %f3
fbgt_cont.38047:
	j	fbgt_cont.38023
fbgt_else.38044:
	fmov	%f0, %f3
fbgt_cont.38045:
	j	fbgt_cont.38023
fbgt_else.38042:
	fmov	%f0, %f3
fbgt_cont.38043:
	j	fbgt_cont.38023
fbgt_else.38040:
	fmov	%f0, %f3
fbgt_cont.38041:
	j	fbgt_cont.38023
fbgt_else.38038:
	fmov	%f0, %f3
fbgt_cont.38039:
	j	fbgt_cont.38023
fbgt_else.38036:
	fmov	%f0, %f3
fbgt_cont.38037:
	j	fbgt_cont.38023
fbgt_else.38034:
	fmov	%f0, %f3
fbgt_cont.38035:
	j	fbgt_cont.38023
fbgt_else.38032:
	fmov	%f0, %f3
fbgt_cont.38033:
	j	fbgt_cont.38023
fbgt_else.38030:
	fmov	%f0, %f3
fbgt_cont.38031:
	j	fbgt_cont.38023
fbgt_else.38028:
	fmov	%f0, %f3
fbgt_cont.38029:
	j	fbgt_cont.38023
fbgt_else.38026:
	fmov	%f0, %f3
fbgt_cont.38027:
	j	fbgt_cont.38023
fbgt_else.38024:
	fmov	%f0, %f3
fbgt_cont.38025:
	j	fbgt_cont.38023
fbgt_else.38022:
	fmov	%f0, %f2
fbgt_cont.38023:
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	fblt	%f1, %f2, fbgt_else.38048
	fblt	%f1, %f0, fbgt_else.38050
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	fbgt_cont.38049
fbgt_else.38050:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
fbgt_cont.38051:
	j	fbgt_cont.38049
fbgt_else.38048:
	fmov	%f0, %f1
fbgt_cont.38049:
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.38052
	lw	%v0, 3(%sp)
	beqi	%v0, 0, bnei_else.38054
	addi	%v0, %zero, 0
	j	fbgt_cont.38053
bnei_else.38054:
	addi	%v0, %zero, 1
bnei_cont.38055:
	j	fbgt_cont.38053
fbgt_else.38052:
	lw	%v0, 3(%sp)
fbgt_cont.38053:
	fblt	%f0, %f1, fbgt_else.38056
	fsub	%f0, %f0, %f1
	j	fbgt_cont.38057
fbgt_else.38056:
fbgt_cont.38057:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.38058
	fsub	%f0, %f1, %f0
	j	fbgt_cont.38059
fbgt_else.38058:
fbgt_cont.38059:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.38060
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.38061
fbgt_else.38060:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.38061:
	beqi	%v0, 0, bnei_else.38062
	j	bnei_cont.38063
bnei_else.38062:
	fneg	%f0, %f0
bnei_cont.38063:
	fmul	%f0, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 474(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.37941:
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
	fblt	%f0, %f2, fbgt_else.38065
	addi	%a0, %zero, 0
	j	fbgt_cont.38066
fbgt_else.38065:
	addi	%a0, %zero, 1
fbgt_cont.38066:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f4, 2(%v0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.38067
	addi	%v0, %zero, 0
	j	fbgt_cont.38068
fbgt_else.38067:
	addi	%v0, %zero, 1
fbgt_cont.38068:
	beqi	%a0, 0, bnei_else.38069
	beqi	%v0, 0, bnei_else.38071
	flw	%f0, 451(%zero)
	j	bnei_cont.38070
bnei_else.38071:
	flw	%f0, 470(%zero)
bnei_cont.38072:
	j	bnei_cont.38070
bnei_else.38069:
	beqi	%v0, 0, bnei_else.38073
	flw	%f0, 470(%zero)
	j	bnei_cont.38074
bnei_else.38073:
	flw	%f0, 451(%zero)
bnei_cont.38074:
bnei_cont.38070:
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2978:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.38086
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
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38087
	addi	%v0, %zero, 0
	j	fbgt_cont.38088
fbgt_else.38087:
	addi	%v0, %zero, 1
fbgt_cont.38088:
	beqi	%v0, 0, bnei_else.38089
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38091
	addi	%v0, %zero, 0
	j	bnei_cont.38090
fbgt_else.38091:
	addi	%v0, %zero, 1
fbgt_cont.38092:
	j	bnei_cont.38090
bnei_else.38089:
	addi	%v0, %zero, 0
bnei_cont.38090:
	beqi	%v0, 0, bnei_else.38093
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, bnei_cont.38094
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.38097
	j	bnei_cont.38094
bnei_else.38097:
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
	flw	%f3, 470(%zero)
	fblt	%f3, %f0, fbgt_else.38099
	addi	%v0, %zero, 0
	j	fbgt_cont.38100
fbgt_else.38099:
	addi	%v0, %zero, 1
fbgt_cont.38100:
	beqi	%v0, 0, bnei_else.38101
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
	j	bnei_cont.38102
bnei_else.38101:
bnei_cont.38102:
	fblt	%f3, %f1, fbgt_else.38103
	addi	%v0, %zero, 0
	j	fbgt_cont.38104
fbgt_else.38103:
	addi	%v0, %zero, 1
fbgt_cont.38104:
	beqi	%v0, 0, bnei_cont.38094
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
	j	bnei_cont.38094
bnei_else.38105:
bnei_cont.38106:
bnei_cont.38098:
	j	bnei_cont.38094
beq_else.38095:
beq_cont.38096:
	j	bnei_cont.38094
bnei_else.38093:
bnei_cont.38094:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2978
bgti_else.38086:
	jr	%ra
trace_ray.2983:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.38141
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
	jal	trace_or_matrix.2942
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38142
	addi	%v0, %zero, 0
	j	fbgt_cont.38143
fbgt_else.38142:
	addi	%v0, %zero, 1
fbgt_cont.38143:
	beqi	%v0, 0, bnei_else.38144
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38146
	addi	%v0, %zero, 0
	j	bnei_cont.38145
fbgt_else.38146:
	addi	%v0, %zero, 1
fbgt_cont.38147:
	j	bnei_cont.38145
bnei_else.38144:
	addi	%v0, %zero, 0
bnei_cont.38145:
	beqi	%v0, 0, bnei_else.38148
	lw	%v0, 141(%zero)
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	lw	%a1, 1(%v1)
	addi	%a2, %zero, 1
	beqi	%a1, 1, bnei_else.38149
	beqi	%a1, 2, bnei_else.38151
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
	beqi	%a1, 0, bnei_else.38153
	lw	%a1, 9(%v1)
	flw	%f9, 2(%a1)
	fmul	%f9, %f4, %f9
	lw	%a1, 9(%v1)
	flw	%f10, 1(%a1)
	fmul	%f10, %f5, %f10
	fadd	%f9, %f9, %f10
	flw	%f10, 473(%zero)
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
	j	bnei_cont.38154
bnei_else.38153:
	fsw	%f6, 142(%zero)
	fsw	%f7, 143(%zero)
	fsw	%f8, 144(%zero)
bnei_cont.38154:
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
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.38155
	addi	%a3, %zero, 1
	j	fbeq_cont.38156
fbeq_else.38155:
	addi	%a3, %zero, 0
fbeq_cont.38156:
	beqi	%a3, 0, bnei_else.38157
	flw	%f4, 474(%zero)
	j	bnei_cont.38158
bnei_else.38157:
	beqi	%a1, 0, bnei_else.38159
	flw	%f7, 468(%zero)
	fdiv	%f4, %f7, %f4
	j	bnei_cont.38160
bnei_else.38159:
	flw	%f7, 474(%zero)
	fdiv	%f4, %f7, %f4
bnei_cont.38160:
bnei_cont.38158:
	fmul	%f3, %f3, %f4
	fsw	%f3, 142(%zero)
	fmul	%f3, %f5, %f4
	fsw	%f3, 143(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f3, 144(%zero)
	j	bnei_cont.38150
bnei_else.38151:
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
bnei_cont.38152:
	j	bnei_cont.38150
bnei_else.38149:
	lw	%a1, 136(%zero)
	flw	%f3, 470(%zero)
	fsw	%f3, 142(%zero)
	fsw	%f3, 143(%zero)
	fsw	%f3, 144(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.38161
	addi	%t0, %zero, 1
	j	fbeq_cont.38162
fbeq_else.38161:
	addi	%t0, %zero, 0
fbeq_cont.38162:
	beqi	%t0, 0, bnei_else.38163
	j	bnei_cont.38164
bnei_else.38163:
	fblt	%f3, %f4, fbgt_else.38165
	addi	%t0, %zero, 0
	j	fbgt_cont.38166
fbgt_else.38165:
	addi	%t0, %zero, 1
fbgt_cont.38166:
	beqi	%t0, 0, bnei_else.38167
	flw	%f3, 474(%zero)
	j	bnei_cont.38168
bnei_else.38167:
	flw	%f3, 468(%zero)
bnei_cont.38168:
bnei_cont.38164:
	fneg	%f3, %f3
	fsw	%f3, 142(%a1)
bnei_cont.38150:
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
	jal	utexture.2971
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
	flw	%f4, 473(%zero)
	fblt	%f3, %f4, fbgt_else.38169
	addi	%a3, %zero, 0
	j	fbgt_cont.38170
fbgt_else.38169:
	addi	%a3, %zero, 1
fbgt_cont.38170:
	beqi	%a3, 0, bnei_else.38171
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.38172
bnei_else.38171:
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
bnei_cont.38172:
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
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	beqi	%v0, 0, bnei_else.38173
	j	bnei_cont.38174
bnei_else.38173:
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
	flw	%f2, 470(%zero)
	fblt	%f2, %f1, fbgt_else.38175
	addi	%v1, %zero, 0
	j	fbgt_cont.38176
fbgt_else.38175:
	addi	%v1, %zero, 1
fbgt_cont.38176:
	beqi	%v1, 0, bnei_else.38177
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
	j	bnei_cont.38178
bnei_else.38177:
bnei_cont.38178:
	fblt	%f2, %f0, fbgt_else.38179
	addi	%v1, %zero, 0
	j	fbgt_cont.38180
fbgt_else.38179:
	addi	%v1, %zero, 1
fbgt_cont.38180:
	beqi	%v1, 0, bnei_else.38181
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
	j	bnei_cont.38182
bnei_else.38181:
bnei_cont.38182:
bnei_cont.38174:
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v0, 434(%zero)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 17(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	trace_reflections.2978
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	flw	%f0, 441(%zero)
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.38183
	addi	%v0, %zero, 0
	j	fbgt_cont.38184
fbgt_else.38183:
	addi	%v0, %zero, 1
fbgt_cont.38184:
	beqi	%v0, 0, bnei_else.38185
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.38186
	j	bgti_cont.38187
bgti_else.38186:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.38187:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.38188
	jr	%ra
bnei_else.38188:
	flw	%f0, 474(%zero)
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
	j	trace_ray.2983
bnei_else.38185:
	jr	%ra
bnei_else.38148:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.38191
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
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.38192
	addi	%v0, %zero, 0
	j	fbgt_cont.38193
fbgt_else.38192:
	addi	%v0, %zero, 1
fbgt_cont.38193:
	beqi	%v0, 0, bnei_else.38194
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
bnei_else.38194:
	jr	%ra
bnei_else.38191:
	jr	%ra
bgt_else.38141:
	jr	%ra
trace_diffuse_ray.2989:
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
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38205
	addi	%v0, %zero, 0
	j	fbgt_cont.38206
fbgt_else.38205:
	addi	%v0, %zero, 1
fbgt_cont.38206:
	beqi	%v0, 0, bnei_else.38207
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38209
	addi	%v0, %zero, 0
	j	bnei_cont.38208
fbgt_else.38209:
	addi	%v0, %zero, 1
fbgt_cont.38210:
	j	bnei_cont.38208
bnei_else.38207:
	addi	%v0, %zero, 0
bnei_cont.38208:
	beqi	%v0, 0, bnei_else.38211
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38212
	beqi	%a0, 2, bnei_else.38214
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
	beqi	%v1, 0, bnei_else.38216
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 473(%zero)
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
	j	bnei_cont.38217
bnei_else.38216:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38217:
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
	flw	%f4, 470(%zero)
	fbne	%f1, %f4, fbeq_else.38218
	addi	%a0, %zero, 1
	j	fbeq_cont.38219
fbeq_else.38218:
	addi	%a0, %zero, 0
fbeq_cont.38219:
	beqi	%a0, 0, bnei_else.38220
	flw	%f1, 474(%zero)
	j	bnei_cont.38221
bnei_else.38220:
	beqi	%v1, 0, bnei_else.38222
	flw	%f4, 468(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.38223
bnei_else.38222:
	flw	%f4, 474(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.38223:
bnei_cont.38221:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38213
bnei_else.38214:
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
bnei_cont.38215:
	j	bnei_cont.38213
bnei_else.38212:
	lw	%a0, 136(%zero)
	flw	%f0, 470(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38224
	addi	%v1, %zero, 1
	j	fbeq_cont.38225
fbeq_else.38224:
	addi	%v1, %zero, 0
fbeq_cont.38225:
	beqi	%v1, 0, bnei_else.38226
	j	bnei_cont.38227
bnei_else.38226:
	fblt	%f0, %f1, fbgt_else.38228
	addi	%v1, %zero, 0
	j	fbgt_cont.38229
fbgt_else.38228:
	addi	%v1, %zero, 1
fbgt_cont.38229:
	beqi	%v1, 0, bnei_else.38230
	flw	%f0, 474(%zero)
	j	bnei_cont.38231
bnei_else.38230:
	flw	%f0, 468(%zero)
bnei_cont.38231:
bnei_cont.38227:
	fneg	%f0, %f0
	fsw	%f0, 142(%a0)
bnei_cont.38213:
	addi	%v1, %zero, 138
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	utexture.2971
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, 0, bnei_else.38232
	jr	%ra
bnei_else.38232:
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
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.38234
	addi	%v0, %zero, 0
	j	fbgt_cont.38235
fbgt_else.38234:
	addi	%v0, %zero, 1
fbgt_cont.38235:
	beqi	%v0, 0, bnei_else.38236
	j	bnei_cont.38237
bnei_else.38236:
	fmov	%f0, %f1
bnei_cont.38237:
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
bnei_else.38211:
	jr	%ra
iter_trace_diffuse_rays.2992:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.38526
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
	flw	%f2, 470(%zero)
	fblt	%f0, %f2, fbgt_else.38527
	addi	%t0, %zero, 0
	j	fbgt_cont.38528
fbgt_else.38527:
	addi	%t0, %zero, 1
fbgt_cont.38528:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a2, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f4, 4(%sp)
	fsw	%f3, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a1, 8(%sp)
	beqi	%t0, 0, bnei_else.38529
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
	beqi	%t3, -1, bnei_else.38531
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.38533
	lw	%t4, 12(%t3)
	lw	%t5, 10(%t4)
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)
	flw	%f7, 2(%t5)
	lw	%t6, 1(%a3)
	add	%at, %t6, %t3
	lw	%t3, 0(%at)
	lw	%t6, 1(%t4)
	beqi	%t6, 1, bnei_else.38535
	beqi	%t6, 2, bnei_else.38537
	flw	%f8, 0(%t3)
	fbne	%f8, %f2, fbeq_else.38539
	addi	%t6, %zero, 1
	j	fbeq_cont.38540
fbeq_else.38539:
	addi	%t6, %zero, 0
fbeq_cont.38540:
	beqi	%t6, 0, bnei_else.38541
	addi	%t3, %zero, 0
	j	bnei_cont.38536
bnei_else.38541:
	flw	%f9, 1(%t3)
	fmul	%f5, %f9, %f5
	flw	%f9, 2(%t3)
	fmul	%f6, %f9, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t3)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t5)
	fmul	%f7, %f5, %f5
	fmul	%f6, %f8, %f6
	fsub	%f6, %f7, %f6
	fblt	%f2, %f6, fbgt_else.38543
	addi	%t5, %zero, 0
	j	fbgt_cont.38544
fbgt_else.38543:
	addi	%t5, %zero, 1
fbgt_cont.38544:
	beqi	%t5, 0, bnei_else.38545
	lw	%t4, 6(%t4)
	beqi	%t4, 0, bnei_else.38547
	fsqrt	%f6, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	j	bnei_cont.38548
bnei_else.38547:
	fsqrt	%f6, %f6
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
bnei_cont.38548:
	addi	%t3, %zero, 1
	j	bnei_cont.38536
bnei_else.38545:
	addi	%t3, %zero, 0
bnei_cont.38546:
bnei_cont.38542:
	j	bnei_cont.38536
bnei_else.38537:
	flw	%f5, 0(%t3)
	fblt	%f5, %f2, fbgt_else.38549
	addi	%t3, %zero, 0
	j	fbgt_cont.38550
fbgt_else.38549:
	addi	%t3, %zero, 1
fbgt_cont.38550:
	beqi	%t3, 0, bnei_else.38551
	flw	%f6, 3(%t5)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.38536
bnei_else.38551:
	addi	%t3, %zero, 0
bnei_cont.38552:
bnei_cont.38538:
	j	bnei_cont.38536
bnei_else.38535:
	lw	%t5, 0(%a3)
	flw	%f8, 0(%t3)
	fsub	%f8, %f8, %f5
	flw	%f9, 1(%t3)
	fmul	%f8, %f8, %f9
	flw	%f10, 1(%t5)
	fmul	%f11, %f8, %f10
	fadd	%f11, %f11, %f6
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f12, 1(%t6)
	fblt	%f11, %f12, fbgt_else.38553
	addi	%t6, %zero, 0
	j	fbgt_cont.38554
fbgt_else.38553:
	addi	%t6, %zero, 1
fbgt_cont.38554:
	beqi	%t6, 0, bnei_else.38555
	flw	%f11, 2(%t5)
	fmul	%f11, %f8, %f11
	fadd	%f11, %f11, %f7
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f13, 2(%t6)
	fblt	%f11, %f13, fbgt_else.38557
	addi	%t6, %zero, 0
	j	fbgt_cont.38558
fbgt_else.38557:
	addi	%t6, %zero, 1
fbgt_cont.38558:
	beqi	%t6, 0, bnei_else.38559
	fbne	%f9, %f2, fbeq_else.38561
	addi	%t6, %zero, 1
	j	fbeq_cont.38562
fbeq_else.38561:
	addi	%t6, %zero, 0
fbeq_cont.38562:
	beqi	%t6, 0, bnei_else.38563
	addi	%t6, %zero, 0
	j	bnei_cont.38556
bnei_else.38563:
	addi	%t6, %zero, 1
bnei_cont.38564:
	j	bnei_cont.38556
bnei_else.38559:
	addi	%t6, %zero, 0
bnei_cont.38560:
	j	bnei_cont.38556
bnei_else.38555:
	addi	%t6, %zero, 0
bnei_cont.38556:
	beqi	%t6, 0, bnei_else.38565
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.38566
bnei_else.38565:
	flw	%f8, 2(%t3)
	fsub	%f8, %f8, %f6
	flw	%f9, 3(%t3)
	fmul	%f8, %f8, %f9
	flw	%f11, 0(%t5)
	fmul	%f13, %f8, %f11
	fadd	%f13, %f13, %f5
	fabs	%f13, %f13
	lw	%t6, 4(%t4)
	flw	%f14, 0(%t6)
	fblt	%f13, %f14, fbgt_else.38567
	addi	%t6, %zero, 0
	j	fbgt_cont.38568
fbgt_else.38567:
	addi	%t6, %zero, 1
fbgt_cont.38568:
	beqi	%t6, 0, bnei_else.38569
	flw	%f13, 2(%t5)
	fmul	%f13, %f8, %f13
	fadd	%f13, %f13, %f7
	fabs	%f13, %f13
	lw	%t4, 4(%t4)
	flw	%f15, 2(%t4)
	fblt	%f13, %f15, fbgt_else.38571
	addi	%t4, %zero, 0
	j	fbgt_cont.38572
fbgt_else.38571:
	addi	%t4, %zero, 1
fbgt_cont.38572:
	beqi	%t4, 0, bnei_else.38573
	fbne	%f9, %f2, fbeq_else.38575
	addi	%t4, %zero, 1
	j	fbeq_cont.38576
fbeq_else.38575:
	addi	%t4, %zero, 0
fbeq_cont.38576:
	beqi	%t4, 0, bnei_else.38577
	addi	%t4, %zero, 0
	j	bnei_cont.38570
bnei_else.38577:
	addi	%t4, %zero, 1
bnei_cont.38578:
	j	bnei_cont.38570
bnei_else.38573:
	addi	%t4, %zero, 0
bnei_cont.38574:
	j	bnei_cont.38570
bnei_else.38569:
	addi	%t4, %zero, 0
bnei_cont.38570:
	beqi	%t4, 0, bnei_else.38579
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 2
	j	bnei_cont.38580
bnei_else.38579:
	flw	%f8, 4(%t3)
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)
	fmul	%f7, %f7, %f8
	fmul	%f9, %f7, %f11
	fadd	%f5, %f9, %f5
	fabs	%f5, %f5
	fblt	%f5, %f14, fbgt_else.38581
	addi	%t3, %zero, 0
	j	fbgt_cont.38582
fbgt_else.38581:
	addi	%t3, %zero, 1
fbgt_cont.38582:
	beqi	%t3, 0, bnei_else.38583
	fmul	%f5, %f7, %f10
	fadd	%f5, %f5, %f6
	fabs	%f5, %f5
	fblt	%f5, %f12, fbgt_else.38585
	addi	%t3, %zero, 0
	j	fbgt_cont.38586
fbgt_else.38585:
	addi	%t3, %zero, 1
fbgt_cont.38586:
	beqi	%t3, 0, bnei_else.38587
	fbne	%f8, %f2, fbeq_else.38589
	addi	%t3, %zero, 1
	j	fbeq_cont.38590
fbeq_else.38589:
	addi	%t3, %zero, 0
fbeq_cont.38590:
	beqi	%t3, 0, bnei_else.38591
	addi	%t3, %zero, 0
	j	bnei_cont.38584
bnei_else.38591:
	addi	%t3, %zero, 1
bnei_cont.38592:
	j	bnei_cont.38584
bnei_else.38587:
	addi	%t3, %zero, 0
bnei_cont.38588:
	j	bnei_cont.38584
bnei_else.38583:
	addi	%t3, %zero, 0
bnei_cont.38584:
	beqi	%t3, 0, bnei_else.38593
	fsw	%f7, 135(%zero)
	addi	%t3, %zero, 3
	j	bnei_cont.38594
bnei_else.38593:
	addi	%t3, %zero, 0
bnei_cont.38594:
bnei_cont.38580:
bnei_cont.38566:
bnei_cont.38536:
	beqi	%t3, 0, bnei_cont.38534
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	fblt	%f5, %f6, fbgt_else.38597
	addi	%t3, %zero, 0
	j	fbgt_cont.38598
fbgt_else.38597:
	addi	%t3, %zero, 1
fbgt_cont.38598:
	beqi	%t3, 0, bnei_cont.38534
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_cont.38534
	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.38534
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.38534
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.38534
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 13(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.38534
bnei_else.38607:
bnei_cont.38608:
	j	bnei_cont.38534
bnei_else.38605:
bnei_cont.38606:
	j	bnei_cont.38534
bnei_else.38603:
bnei_cont.38604:
	j	bnei_cont.38534
bnei_else.38601:
bnei_cont.38602:
	j	bnei_cont.38534
bnei_else.38599:
bnei_cont.38600:
	j	bnei_cont.38534
bnei_else.38595:
bnei_cont.38596:
	j	bnei_cont.38534
bnei_else.38533:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.38609
	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.38610
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.38610
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.38610
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 13(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.38610
bnei_else.38615:
bnei_cont.38616:
	j	bnei_cont.38610
bnei_else.38613:
bnei_cont.38614:
	j	bnei_cont.38610
bnei_else.38611:
bnei_cont.38612:
	j	bnei_cont.38610
bnei_else.38609:
bnei_cont.38610:
bnei_cont.38534:
	lw	%v0, 12(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.38532
bnei_else.38531:
bnei_cont.38532:
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38617
	addi	%v0, %zero, 0
	j	fbgt_cont.38618
fbgt_else.38617:
	addi	%v0, %zero, 1
fbgt_cont.38618:
	beqi	%v0, 0, bnei_else.38619
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38621
	addi	%v0, %zero, 0
	j	bnei_cont.38620
fbgt_else.38621:
	addi	%v0, %zero, 1
fbgt_cont.38622:
	j	bnei_cont.38620
bnei_else.38619:
	addi	%v0, %zero, 0
bnei_cont.38620:
	beqi	%v0, 0, bnei_cont.38530
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38625
	beqi	%a0, 2, bnei_else.38627
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
	beqi	%v1, 0, bnei_else.38629
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f7, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f9, %f2, %f8
	fadd	%f7, %f7, %f9
	flw	%f9, 473(%zero)
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
	j	bnei_cont.38630
bnei_else.38629:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38630:
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
	fbne	%f1, %f4, fbeq_else.38631
	addi	%a0, %zero, 1
	j	fbeq_cont.38632
fbeq_else.38631:
	addi	%a0, %zero, 0
fbeq_cont.38632:
	beqi	%a0, 0, bnei_else.38633
	flw	%f1, 474(%zero)
	j	bnei_cont.38634
bnei_else.38633:
	beqi	%v1, 0, bnei_else.38635
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38636
bnei_else.38635:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38636:
bnei_cont.38634:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38626
bnei_else.38627:
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
bnei_cont.38628:
	j	bnei_cont.38626
bnei_else.38625:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38637
	addi	%v1, %zero, 1
	j	fbeq_cont.38638
fbeq_else.38637:
	addi	%v1, %zero, 0
fbeq_cont.38638:
	beqi	%v1, 0, bnei_else.38639
	fmov	%f1, %f0
	j	bnei_cont.38640
bnei_else.38639:
	fblt	%f0, %f1, fbgt_else.38641
	addi	%v1, %zero, 0
	j	fbgt_cont.38642
fbgt_else.38641:
	addi	%v1, %zero, 1
fbgt_cont.38642:
	beqi	%v1, 0, bnei_else.38643
	flw	%f1, 474(%zero)
	j	bnei_cont.38644
bnei_else.38643:
	flw	%f1, 468(%zero)
bnei_cont.38644:
bnei_cont.38640:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38626:
	addi	%v1, %zero, 138
	sw	%v0, 14(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	utexture.2971
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	beqi	%v0, 0, bnei_else.38645
	j	bnei_cont.38530
bnei_else.38645:
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
	fblt	%f1, %f0, fbgt_else.38647
	addi	%v0, %zero, 0
	j	fbgt_cont.38648
fbgt_else.38647:
	addi	%v0, %zero, 1
fbgt_cont.38648:
	beqi	%v0, 0, bnei_else.38649
	j	bnei_cont.38650
bnei_else.38649:
	fmov	%f0, %f1
bnei_cont.38650:
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
bnei_cont.38646:
	j	bnei_cont.38530
bnei_else.38623:
bnei_cont.38624:
	j	bnei_cont.38530
bnei_else.38529:
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
	beqi	%t3, -1, bnei_else.38651
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.38653
	lw	%t4, 12(%t3)
	lw	%t5, 10(%t4)
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)
	flw	%f7, 2(%t5)
	lw	%t6, 1(%a3)
	add	%at, %t6, %t3
	lw	%t3, 0(%at)
	lw	%t6, 1(%t4)
	beqi	%t6, 1, bnei_else.38655
	beqi	%t6, 2, bnei_else.38657
	flw	%f8, 0(%t3)
	fbne	%f8, %f2, fbeq_else.38659
	addi	%t6, %zero, 1
	j	fbeq_cont.38660
fbeq_else.38659:
	addi	%t6, %zero, 0
fbeq_cont.38660:
	beqi	%t6, 0, bnei_else.38661
	addi	%t3, %zero, 0
	j	bnei_cont.38656
bnei_else.38661:
	flw	%f9, 1(%t3)
	fmul	%f5, %f9, %f5
	flw	%f9, 2(%t3)
	fmul	%f6, %f9, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t3)
	fmul	%f6, %f6, %f7
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t5)
	fmul	%f7, %f5, %f5
	fmul	%f6, %f8, %f6
	fsub	%f6, %f7, %f6
	fblt	%f2, %f6, fbgt_else.38663
	addi	%t5, %zero, 0
	j	fbgt_cont.38664
fbgt_else.38663:
	addi	%t5, %zero, 1
fbgt_cont.38664:
	beqi	%t5, 0, bnei_else.38665
	lw	%t4, 6(%t4)
	beqi	%t4, 0, bnei_else.38667
	fsqrt	%f6, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	j	bnei_cont.38668
bnei_else.38667:
	fsqrt	%f6, %f6
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
bnei_cont.38668:
	addi	%t3, %zero, 1
	j	bnei_cont.38656
bnei_else.38665:
	addi	%t3, %zero, 0
bnei_cont.38666:
bnei_cont.38662:
	j	bnei_cont.38656
bnei_else.38657:
	flw	%f5, 0(%t3)
	fblt	%f5, %f2, fbgt_else.38669
	addi	%t3, %zero, 0
	j	fbgt_cont.38670
fbgt_else.38669:
	addi	%t3, %zero, 1
fbgt_cont.38670:
	beqi	%t3, 0, bnei_else.38671
	flw	%f6, 3(%t5)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.38656
bnei_else.38671:
	addi	%t3, %zero, 0
bnei_cont.38672:
bnei_cont.38658:
	j	bnei_cont.38656
bnei_else.38655:
	lw	%t5, 0(%a3)
	flw	%f8, 0(%t3)
	fsub	%f8, %f8, %f5
	flw	%f9, 1(%t3)
	fmul	%f8, %f8, %f9
	flw	%f10, 1(%t5)
	fmul	%f11, %f8, %f10
	fadd	%f11, %f11, %f6
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f12, 1(%t6)
	fblt	%f11, %f12, fbgt_else.38673
	addi	%t6, %zero, 0
	j	fbgt_cont.38674
fbgt_else.38673:
	addi	%t6, %zero, 1
fbgt_cont.38674:
	beqi	%t6, 0, bnei_else.38675
	flw	%f11, 2(%t5)
	fmul	%f11, %f8, %f11
	fadd	%f11, %f11, %f7
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f13, 2(%t6)
	fblt	%f11, %f13, fbgt_else.38677
	addi	%t6, %zero, 0
	j	fbgt_cont.38678
fbgt_else.38677:
	addi	%t6, %zero, 1
fbgt_cont.38678:
	beqi	%t6, 0, bnei_else.38679
	fbne	%f9, %f2, fbeq_else.38681
	addi	%t6, %zero, 1
	j	fbeq_cont.38682
fbeq_else.38681:
	addi	%t6, %zero, 0
fbeq_cont.38682:
	beqi	%t6, 0, bnei_else.38683
	addi	%t6, %zero, 0
	j	bnei_cont.38676
bnei_else.38683:
	addi	%t6, %zero, 1
bnei_cont.38684:
	j	bnei_cont.38676
bnei_else.38679:
	addi	%t6, %zero, 0
bnei_cont.38680:
	j	bnei_cont.38676
bnei_else.38675:
	addi	%t6, %zero, 0
bnei_cont.38676:
	beqi	%t6, 0, bnei_else.38685
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.38686
bnei_else.38685:
	flw	%f8, 2(%t3)
	fsub	%f8, %f8, %f6
	flw	%f9, 3(%t3)
	fmul	%f8, %f8, %f9
	flw	%f11, 0(%t5)
	fmul	%f13, %f8, %f11
	fadd	%f13, %f13, %f5
	fabs	%f13, %f13
	lw	%t6, 4(%t4)
	flw	%f14, 0(%t6)
	fblt	%f13, %f14, fbgt_else.38687
	addi	%t6, %zero, 0
	j	fbgt_cont.38688
fbgt_else.38687:
	addi	%t6, %zero, 1
fbgt_cont.38688:
	beqi	%t6, 0, bnei_else.38689
	flw	%f13, 2(%t5)
	fmul	%f13, %f8, %f13
	fadd	%f13, %f13, %f7
	fabs	%f13, %f13
	lw	%t4, 4(%t4)
	flw	%f15, 2(%t4)
	fblt	%f13, %f15, fbgt_else.38691
	addi	%t4, %zero, 0
	j	fbgt_cont.38692
fbgt_else.38691:
	addi	%t4, %zero, 1
fbgt_cont.38692:
	beqi	%t4, 0, bnei_else.38693
	fbne	%f9, %f2, fbeq_else.38695
	addi	%t4, %zero, 1
	j	fbeq_cont.38696
fbeq_else.38695:
	addi	%t4, %zero, 0
fbeq_cont.38696:
	beqi	%t4, 0, bnei_else.38697
	addi	%t4, %zero, 0
	j	bnei_cont.38690
bnei_else.38697:
	addi	%t4, %zero, 1
bnei_cont.38698:
	j	bnei_cont.38690
bnei_else.38693:
	addi	%t4, %zero, 0
bnei_cont.38694:
	j	bnei_cont.38690
bnei_else.38689:
	addi	%t4, %zero, 0
bnei_cont.38690:
	beqi	%t4, 0, bnei_else.38699
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 2
	j	bnei_cont.38700
bnei_else.38699:
	flw	%f8, 4(%t3)
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)
	fmul	%f7, %f7, %f8
	fmul	%f9, %f7, %f11
	fadd	%f5, %f9, %f5
	fabs	%f5, %f5
	fblt	%f5, %f14, fbgt_else.38701
	addi	%t3, %zero, 0
	j	fbgt_cont.38702
fbgt_else.38701:
	addi	%t3, %zero, 1
fbgt_cont.38702:
	beqi	%t3, 0, bnei_else.38703
	fmul	%f5, %f7, %f10
	fadd	%f5, %f5, %f6
	fabs	%f5, %f5
	fblt	%f5, %f12, fbgt_else.38705
	addi	%t3, %zero, 0
	j	fbgt_cont.38706
fbgt_else.38705:
	addi	%t3, %zero, 1
fbgt_cont.38706:
	beqi	%t3, 0, bnei_else.38707
	fbne	%f8, %f2, fbeq_else.38709
	addi	%t3, %zero, 1
	j	fbeq_cont.38710
fbeq_else.38709:
	addi	%t3, %zero, 0
fbeq_cont.38710:
	beqi	%t3, 0, bnei_else.38711
	addi	%t3, %zero, 0
	j	bnei_cont.38704
bnei_else.38711:
	addi	%t3, %zero, 1
bnei_cont.38712:
	j	bnei_cont.38704
bnei_else.38707:
	addi	%t3, %zero, 0
bnei_cont.38708:
	j	bnei_cont.38704
bnei_else.38703:
	addi	%t3, %zero, 0
bnei_cont.38704:
	beqi	%t3, 0, bnei_else.38713
	fsw	%f7, 135(%zero)
	addi	%t3, %zero, 3
	j	bnei_cont.38714
bnei_else.38713:
	addi	%t3, %zero, 0
bnei_cont.38714:
bnei_cont.38700:
bnei_cont.38686:
bnei_cont.38656:
	beqi	%t3, 0, bnei_cont.38654
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	fblt	%f5, %f6, fbgt_else.38717
	addi	%t3, %zero, 0
	j	fbgt_cont.38718
fbgt_else.38717:
	addi	%t3, %zero, 1
fbgt_cont.38718:
	beqi	%t3, 0, bnei_cont.38654
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_cont.38654
	lw	%t3, 83(%t3)
	sw	%t2, 18(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.38654
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.38654
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.38654
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 18(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.38654
bnei_else.38727:
bnei_cont.38728:
	j	bnei_cont.38654
bnei_else.38725:
bnei_cont.38726:
	j	bnei_cont.38654
bnei_else.38723:
bnei_cont.38724:
	j	bnei_cont.38654
bnei_else.38721:
bnei_cont.38722:
	j	bnei_cont.38654
bnei_else.38719:
bnei_cont.38720:
	j	bnei_cont.38654
bnei_else.38715:
bnei_cont.38716:
	j	bnei_cont.38654
bnei_else.38653:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.38729
	lw	%t3, 83(%t3)
	sw	%t2, 18(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_cont.38730
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_cont.38730
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_cont.38730
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 17(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 18(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.38730
bnei_else.38735:
bnei_cont.38736:
	j	bnei_cont.38730
bnei_else.38733:
bnei_cont.38734:
	j	bnei_cont.38730
bnei_else.38731:
bnei_cont.38732:
	j	bnei_cont.38730
bnei_else.38729:
bnei_cont.38730:
bnei_cont.38654:
	lw	%v0, 12(%sp)
	lw	%v1, 16(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.38652
bnei_else.38651:
bnei_cont.38652:
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38737
	addi	%v0, %zero, 0
	j	fbgt_cont.38738
fbgt_else.38737:
	addi	%v0, %zero, 1
fbgt_cont.38738:
	beqi	%v0, 0, bnei_else.38739
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38741
	addi	%v0, %zero, 0
	j	bnei_cont.38740
fbgt_else.38741:
	addi	%v0, %zero, 1
fbgt_cont.38742:
	j	bnei_cont.38740
bnei_else.38739:
	addi	%v0, %zero, 0
bnei_cont.38740:
	beqi	%v0, 0, bnei_else.38743
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 17(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38745
	beqi	%a0, 2, bnei_else.38747
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
	beqi	%v1, 0, bnei_else.38749
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f7, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f9, %f2, %f8
	fadd	%f7, %f7, %f9
	flw	%f9, 473(%zero)
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
	j	bnei_cont.38750
bnei_else.38749:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38750:
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
	fbne	%f1, %f4, fbeq_else.38751
	addi	%a0, %zero, 1
	j	fbeq_cont.38752
fbeq_else.38751:
	addi	%a0, %zero, 0
fbeq_cont.38752:
	beqi	%a0, 0, bnei_else.38753
	flw	%f1, 474(%zero)
	j	bnei_cont.38754
bnei_else.38753:
	beqi	%v1, 0, bnei_else.38755
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38756
bnei_else.38755:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38756:
bnei_cont.38754:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38746
bnei_else.38747:
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
bnei_cont.38748:
	j	bnei_cont.38746
bnei_else.38745:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38757
	addi	%v1, %zero, 1
	j	fbeq_cont.38758
fbeq_else.38757:
	addi	%v1, %zero, 0
fbeq_cont.38758:
	beqi	%v1, 0, bnei_else.38759
	fmov	%f1, %f0
	j	bnei_cont.38760
bnei_else.38759:
	fblt	%f0, %f1, fbgt_else.38761
	addi	%v1, %zero, 0
	j	fbgt_cont.38762
fbgt_else.38761:
	addi	%v1, %zero, 1
fbgt_cont.38762:
	beqi	%v1, 0, bnei_else.38763
	flw	%f1, 474(%zero)
	j	bnei_cont.38764
bnei_else.38763:
	flw	%f1, 468(%zero)
bnei_cont.38764:
bnei_cont.38760:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38746:
	addi	%v1, %zero, 138
	sw	%v0, 19(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	utexture.2971
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	beqi	%v0, 0, bnei_else.38765
	j	bnei_cont.38744
bnei_else.38765:
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
	fblt	%f1, %f0, fbgt_else.38767
	addi	%v0, %zero, 0
	j	fbgt_cont.38768
fbgt_else.38767:
	addi	%v0, %zero, 1
fbgt_cont.38768:
	beqi	%v0, 0, bnei_else.38769
	j	bnei_cont.38770
bnei_else.38769:
	fmov	%f0, %f1
bnei_cont.38770:
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
bnei_cont.38766:
	j	bnei_cont.38744
bnei_else.38743:
bnei_cont.38744:
bnei_cont.38530:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.38771
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
	fblt	%f0, %f1, fbgt_else.38772
	addi	%a1, %zero, 0
	j	fbgt_cont.38773
fbgt_else.38772:
	addi	%a1, %zero, 1
fbgt_cont.38773:
	sw	%v0, 20(%sp)
	beqi	%a1, 0, bnei_else.38774
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
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38776
	addi	%v0, %zero, 0
	j	fbgt_cont.38777
fbgt_else.38776:
	addi	%v0, %zero, 1
fbgt_cont.38777:
	beqi	%v0, 0, bnei_else.38778
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38780
	addi	%v0, %zero, 0
	j	bnei_cont.38779
fbgt_else.38780:
	addi	%v0, %zero, 1
fbgt_cont.38781:
	j	bnei_cont.38779
bnei_else.38778:
	addi	%v0, %zero, 0
bnei_cont.38779:
	beqi	%v0, 0, bnei_cont.38775
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 23(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38784
	beqi	%a0, 2, bnei_else.38786
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
	beqi	%v1, 0, bnei_else.38788
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 473(%zero)
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
	j	bnei_cont.38789
bnei_else.38788:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38789:
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
	fbne	%f1, %f4, fbeq_else.38790
	addi	%a0, %zero, 1
	j	fbeq_cont.38791
fbeq_else.38790:
	addi	%a0, %zero, 0
fbeq_cont.38791:
	beqi	%a0, 0, bnei_else.38792
	flw	%f1, 474(%zero)
	j	bnei_cont.38793
bnei_else.38792:
	beqi	%v1, 0, bnei_else.38794
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38795
bnei_else.38794:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38795:
bnei_cont.38793:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38785
bnei_else.38786:
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
bnei_cont.38787:
	j	bnei_cont.38785
bnei_else.38784:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38796
	addi	%v1, %zero, 1
	j	fbeq_cont.38797
fbeq_else.38796:
	addi	%v1, %zero, 0
fbeq_cont.38797:
	beqi	%v1, 0, bnei_else.38798
	fmov	%f1, %f0
	j	bnei_cont.38799
bnei_else.38798:
	fblt	%f0, %f1, fbgt_else.38800
	addi	%v1, %zero, 0
	j	fbgt_cont.38801
fbgt_else.38800:
	addi	%v1, %zero, 1
fbgt_cont.38801:
	beqi	%v1, 0, bnei_else.38802
	flw	%f1, 474(%zero)
	j	bnei_cont.38803
bnei_else.38802:
	flw	%f1, 468(%zero)
bnei_cont.38803:
bnei_cont.38799:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38785:
	addi	%v1, %zero, 138
	sw	%v0, 24(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	utexture.2971
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 22(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	beqi	%v0, 0, bnei_else.38804
	j	bnei_cont.38775
bnei_else.38804:
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
	fblt	%f1, %f0, fbgt_else.38806
	addi	%v0, %zero, 0
	j	fbgt_cont.38807
fbgt_else.38806:
	addi	%v0, %zero, 1
fbgt_cont.38807:
	beqi	%v0, 0, bnei_else.38808
	j	bnei_cont.38809
bnei_else.38808:
	fmov	%f0, %f1
bnei_cont.38809:
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
bnei_cont.38805:
	j	bnei_cont.38775
bnei_else.38782:
bnei_cont.38783:
	j	bnei_cont.38775
bnei_else.38774:
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
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38810
	addi	%v0, %zero, 0
	j	fbgt_cont.38811
fbgt_else.38810:
	addi	%v0, %zero, 1
fbgt_cont.38811:
	beqi	%v0, 0, bnei_else.38812
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38814
	addi	%v0, %zero, 0
	j	bnei_cont.38813
fbgt_else.38814:
	addi	%v0, %zero, 1
fbgt_cont.38815:
	j	bnei_cont.38813
bnei_else.38812:
	addi	%v0, %zero, 0
bnei_cont.38813:
	beqi	%v0, 0, bnei_else.38816
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 27(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38818
	beqi	%a0, 2, bnei_else.38820
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
	beqi	%v1, 0, bnei_else.38822
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 473(%zero)
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
	j	bnei_cont.38823
bnei_else.38822:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38823:
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
	fbne	%f1, %f4, fbeq_else.38824
	addi	%a0, %zero, 1
	j	fbeq_cont.38825
fbeq_else.38824:
	addi	%a0, %zero, 0
fbeq_cont.38825:
	beqi	%a0, 0, bnei_else.38826
	flw	%f1, 474(%zero)
	j	bnei_cont.38827
bnei_else.38826:
	beqi	%v1, 0, bnei_else.38828
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38829
bnei_else.38828:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38829:
bnei_cont.38827:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38819
bnei_else.38820:
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
bnei_cont.38821:
	j	bnei_cont.38819
bnei_else.38818:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38830
	addi	%v1, %zero, 1
	j	fbeq_cont.38831
fbeq_else.38830:
	addi	%v1, %zero, 0
fbeq_cont.38831:
	beqi	%v1, 0, bnei_else.38832
	fmov	%f1, %f0
	j	bnei_cont.38833
bnei_else.38832:
	fblt	%f0, %f1, fbgt_else.38834
	addi	%v1, %zero, 0
	j	fbgt_cont.38835
fbgt_else.38834:
	addi	%v1, %zero, 1
fbgt_cont.38835:
	beqi	%v1, 0, bnei_else.38836
	flw	%f1, 474(%zero)
	j	bnei_cont.38837
bnei_else.38836:
	flw	%f1, 468(%zero)
bnei_cont.38837:
bnei_cont.38833:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38819:
	addi	%v1, %zero, 138
	sw	%v0, 28(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	utexture.2971
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v0, 2(%sp)
	lw	%v1, 26(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	beqi	%v0, 0, bnei_else.38838
	j	bnei_cont.38817
bnei_else.38838:
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
	fblt	%f1, %f0, fbgt_else.38840
	addi	%v0, %zero, 0
	j	fbgt_cont.38841
fbgt_else.38840:
	addi	%v0, %zero, 1
fbgt_cont.38841:
	beqi	%v0, 0, bnei_else.38842
	j	bnei_cont.38843
bnei_else.38842:
	fmov	%f0, %f1
bnei_cont.38843:
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
bnei_cont.38839:
	j	bnei_cont.38817
bnei_else.38816:
bnei_cont.38817:
bnei_cont.38775:
	lw	%v0, 20(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2992
bgti_else.38771:
	jr	%ra
bgti_else.38526:
	jr	%ra
trace_diffuse_rays.2997:
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
	jal	setup_startp_constants.2894
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
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.38869
	addi	%v1, %zero, 0
	j	fbgt_cont.38870
fbgt_else.38869:
	addi	%v1, %zero, 1
fbgt_cont.38870:
	beqi	%v1, 0, bnei_else.38871
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
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38873
	addi	%v0, %zero, 0
	j	fbgt_cont.38874
fbgt_else.38873:
	addi	%v0, %zero, 1
fbgt_cont.38874:
	beqi	%v0, 0, bnei_else.38875
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38877
	addi	%v0, %zero, 0
	j	bnei_cont.38876
fbgt_else.38877:
	addi	%v0, %zero, 1
fbgt_cont.38878:
	j	bnei_cont.38876
bnei_else.38875:
	addi	%v0, %zero, 0
bnei_cont.38876:
	beqi	%v0, 0, bnei_cont.38872
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 7(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38881
	beqi	%a0, 2, bnei_else.38883
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
	beqi	%v1, 0, bnei_else.38885
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 473(%zero)
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
	j	bnei_cont.38886
bnei_else.38885:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38886:
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
	fbne	%f1, %f4, fbeq_else.38887
	addi	%a0, %zero, 1
	j	fbeq_cont.38888
fbeq_else.38887:
	addi	%a0, %zero, 0
fbeq_cont.38888:
	beqi	%a0, 0, bnei_else.38889
	flw	%f1, 474(%zero)
	j	bnei_cont.38890
bnei_else.38889:
	beqi	%v1, 0, bnei_else.38891
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38892
bnei_else.38891:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38892:
bnei_cont.38890:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38882
bnei_else.38883:
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
bnei_cont.38884:
	j	bnei_cont.38882
bnei_else.38881:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38893
	addi	%v1, %zero, 1
	j	fbeq_cont.38894
fbeq_else.38893:
	addi	%v1, %zero, 0
fbeq_cont.38894:
	beqi	%v1, 0, bnei_else.38895
	fmov	%f1, %f0
	j	bnei_cont.38896
bnei_else.38895:
	fblt	%f0, %f1, fbgt_else.38897
	addi	%v1, %zero, 0
	j	fbgt_cont.38898
fbgt_else.38897:
	addi	%v1, %zero, 1
fbgt_cont.38898:
	beqi	%v1, 0, bnei_else.38899
	flw	%f1, 474(%zero)
	j	bnei_cont.38900
bnei_else.38899:
	flw	%f1, 468(%zero)
bnei_cont.38900:
bnei_cont.38896:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38882:
	addi	%v1, %zero, 138
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	utexture.2971
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, 0, bnei_else.38901
	j	bnei_cont.38872
bnei_else.38901:
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
	fblt	%f1, %f0, fbgt_else.38903
	addi	%v0, %zero, 0
	j	fbgt_cont.38904
fbgt_else.38903:
	addi	%v0, %zero, 1
fbgt_cont.38904:
	beqi	%v0, 0, bnei_else.38905
	j	bnei_cont.38906
bnei_else.38905:
	fmov	%f0, %f1
bnei_cont.38906:
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
bnei_cont.38902:
	j	bnei_cont.38872
bnei_else.38879:
bnei_cont.38880:
	j	bnei_cont.38872
bnei_else.38871:
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
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38907
	addi	%v0, %zero, 0
	j	fbgt_cont.38908
fbgt_else.38907:
	addi	%v0, %zero, 1
fbgt_cont.38908:
	beqi	%v0, 0, bnei_else.38909
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38911
	addi	%v0, %zero, 0
	j	bnei_cont.38910
fbgt_else.38911:
	addi	%v0, %zero, 1
fbgt_cont.38912:
	j	bnei_cont.38910
bnei_else.38909:
	addi	%v0, %zero, 0
bnei_cont.38910:
	beqi	%v0, 0, bnei_else.38913
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38915
	beqi	%a0, 2, bnei_else.38917
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
	beqi	%v1, 0, bnei_else.38919
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 473(%zero)
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
	j	bnei_cont.38920
bnei_else.38919:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38920:
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
	fbne	%f1, %f4, fbeq_else.38921
	addi	%a0, %zero, 1
	j	fbeq_cont.38922
fbeq_else.38921:
	addi	%a0, %zero, 0
fbeq_cont.38922:
	beqi	%a0, 0, bnei_else.38923
	flw	%f1, 474(%zero)
	j	bnei_cont.38924
bnei_else.38923:
	beqi	%v1, 0, bnei_else.38925
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38926
bnei_else.38925:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38926:
bnei_cont.38924:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38916
bnei_else.38917:
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
bnei_cont.38918:
	j	bnei_cont.38916
bnei_else.38915:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38927
	addi	%v1, %zero, 1
	j	fbeq_cont.38928
fbeq_else.38927:
	addi	%v1, %zero, 0
fbeq_cont.38928:
	beqi	%v1, 0, bnei_else.38929
	fmov	%f1, %f0
	j	bnei_cont.38930
bnei_else.38929:
	fblt	%f0, %f1, fbgt_else.38931
	addi	%v1, %zero, 0
	j	fbgt_cont.38932
fbgt_else.38931:
	addi	%v1, %zero, 1
fbgt_cont.38932:
	beqi	%v1, 0, bnei_else.38933
	flw	%f1, 474(%zero)
	j	bnei_cont.38934
bnei_else.38933:
	flw	%f1, 468(%zero)
bnei_cont.38934:
bnei_cont.38930:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38916:
	addi	%v1, %zero, 138
	sw	%v0, 12(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	utexture.2971
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	beqi	%v0, 0, bnei_else.38935
	j	bnei_cont.38914
bnei_else.38935:
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
	fblt	%f1, %f0, fbgt_else.38937
	addi	%v0, %zero, 0
	j	fbgt_cont.38938
fbgt_else.38937:
	addi	%v0, %zero, 1
fbgt_cont.38938:
	beqi	%v0, 0, bnei_else.38939
	j	bnei_cont.38940
bnei_else.38939:
	fmov	%f0, %f1
bnei_cont.38940:
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
bnei_cont.38936:
	j	bnei_cont.38914
bnei_else.38913:
bnei_cont.38914:
bnei_cont.38872:
	addi	%a1, %zero, 116
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2992
do_without_neighbors.3014:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.39024
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39025
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.39026
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
	beqi	%a0, 0, bnei_else.39028
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 6(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	bnei_cont.39029
bnei_else.39028:
bnei_cont.39029:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.39030
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 7(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	j	bnei_cont.39031
bnei_else.39030:
bnei_cont.39031:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.39032
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 8(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.39033
bnei_else.39032:
bnei_cont.39033:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.39034
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 9(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.39035
bnei_else.39034:
bnei_cont.39035:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.39036
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 10(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bnei_cont.39037
bnei_else.39036:
bnei_cont.39037:
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
	j	bnei_cont.39027
bnei_else.39026:
bnei_cont.39027:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.39038
	lw	%v1, 0(%sp)
	lw	%a0, 2(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39039
	lw	%a0, 3(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39040
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
	beqi	%a0, 0, bnei_else.39042
	lw	%t0, 179(%zero)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0
	addi	%v0, %t0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.39043
bnei_else.39042:
bnei_cont.39043:
	lw	%v0, 15(%sp)
	beqi	%v0, 1, bnei_else.39044
	lw	%v1, 180(%zero)
	lw	%a0, 14(%sp)
	lw	%a1, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.39045
bnei_else.39044:
bnei_cont.39045:
	lw	%v0, 15(%sp)
	beqi	%v0, 2, bnei_else.39046
	lw	%v1, 181(%zero)
	lw	%a0, 14(%sp)
	lw	%a1, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.39047
bnei_else.39046:
bnei_cont.39047:
	lw	%v0, 15(%sp)
	beqi	%v0, 3, bnei_else.39048
	lw	%v1, 182(%zero)
	lw	%a0, 14(%sp)
	lw	%a1, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.39049
bnei_else.39048:
bnei_cont.39049:
	lw	%v0, 15(%sp)
	beqi	%v0, 4, bnei_else.39050
	lw	%v0, 183(%zero)
	lw	%v1, 14(%sp)
	lw	%a0, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.39051
bnei_else.39050:
bnei_cont.39051:
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
	j	bnei_cont.39041
bnei_else.39040:
bnei_cont.39041:
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3014
bgti_else.39039:
	jr	%ra
bgt_else.39038:
	jr	%ra
bgti_else.39025:
	jr	%ra
bgt_else.39024:
	jr	%ra
try_exploit_neighbors.3030:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.39089
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.39090
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39091
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39093
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39095
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39097
	addi	%t1, %zero, 1
	j	beq_cont.39092
beq_else.39097:
	addi	%t1, %zero, 0
beq_cont.39098:
	j	beq_cont.39092
beq_else.39095:
	addi	%t1, %zero, 0
beq_cont.39096:
	j	beq_cont.39092
beq_else.39093:
	addi	%t1, %zero, 0
beq_cont.39094:
	j	beq_cont.39092
beq_else.39091:
	addi	%t1, %zero, 0
beq_cont.39092:
	beqi	%t1, 0, bnei_else.39099
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.39100
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
	j	bnei_cont.39101
bnei_else.39100:
bnei_cont.39101:
	addi	%a3, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.39102
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.39103
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39104
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39106
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39108
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39110
	addi	%t1, %zero, 1
	j	beq_cont.39105
beq_else.39110:
	addi	%t1, %zero, 0
beq_cont.39111:
	j	beq_cont.39105
beq_else.39108:
	addi	%t1, %zero, 0
beq_cont.39109:
	j	beq_cont.39105
beq_else.39106:
	addi	%t1, %zero, 0
beq_cont.39107:
	j	beq_cont.39105
beq_else.39104:
	addi	%t1, %zero, 0
beq_cont.39105:
	beqi	%t1, 0, bnei_else.39112
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.39113
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
	j	bnei_cont.39114
bnei_else.39113:
bnei_cont.39114:
	addi	%a3, %a3, 1
	j	try_exploit_neighbors.3030
bnei_else.39112:
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	j	do_without_neighbors.3014
bgti_else.39103:
	jr	%ra
bgt_else.39102:
	jr	%ra
bnei_else.39099:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.39117
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.39118
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 0(%sp)
	sw	%a3, 1(%sp)
	beqi	%v0, 0, bnei_else.39119
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
	beqi	%v0, 0, bnei_else.39121
	lw	%a2, 179(%zero)
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.39122
bnei_else.39121:
bnei_cont.39122:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.39123
	lw	%v1, 180(%zero)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.39124
bnei_else.39123:
bnei_cont.39124:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.39125
	lw	%v1, 181(%zero)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.39126
bnei_else.39125:
bnei_cont.39126:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.39127
	lw	%v1, 182(%zero)
	lw	%a0, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.39128
bnei_else.39127:
bnei_cont.39128:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.39129
	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.39130
bnei_else.39129:
bnei_cont.39130:
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
	j	bnei_cont.39120
bnei_else.39119:
bnei_cont.39120:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3014
bgti_else.39118:
	jr	%ra
bgt_else.39117:
	jr	%ra
bgti_else.39090:
	jr	%ra
bgt_else.39089:
	jr	%ra
pretrace_diffuse_rays.3043:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.39155
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39156
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.39157
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 470(%zero)
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
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%a1, %zero, 118
	lw	%v0, 4(%sp)
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	iter_trace_diffuse_rays.2992
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
	j	bnei_cont.39158
bnei_else.39157:
bnei_cont.39158:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.39159
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39160
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.39161
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 470(%zero)
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
	jal	setup_startp_constants.2894
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
	fblt	%f0, %f1, fbgt_else.39163
	addi	%a0, %zero, 0
	j	fbgt_cont.39164
fbgt_else.39163:
	addi	%a0, %zero, 1
fbgt_cont.39164:
	beqi	%a0, 0, bnei_else.39165
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.39166
bnei_else.39165:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.39166:
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 6(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2992
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
	j	bnei_cont.39162
bnei_else.39161:
bnei_cont.39162:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3043
bgti_else.39160:
	jr	%ra
bgt_else.39159:
	jr	%ra
bgti_else.39156:
	jr	%ra
bgt_else.39155:
	jr	%ra
pretrace_pixels.3046:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.39195
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
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.39196
	addi	%a3, %zero, 1
	j	fbeq_cont.39197
fbeq_else.39196:
	addi	%a3, %zero, 0
fbeq_cont.39197:
	beqi	%a3, 0, bnei_else.39198
	flw	%f4, 474(%zero)
	j	bnei_cont.39199
bnei_else.39198:
	flw	%f8, 474(%zero)
	fdiv	%f4, %f8, %f4
bnei_cont.39199:
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
	flw	%f3, 474(%zero)
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
	jal	trace_ray.2983
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
	blti	%v1, 0, bgti_else.39200
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.39202
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
	jal	setup_startp_constants.2894
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
	fblt	%f0, %f1, fbgt_else.39204
	addi	%a0, %zero, 0
	j	fbgt_cont.39205
fbgt_else.39204:
	addi	%a0, %zero, 1
fbgt_cont.39205:
	beqi	%a0, 0, bnei_else.39206
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.39207
bnei_else.39206:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.39207:
	addi	%a1, %zero, 116
	lw	%v0, 11(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 9(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_trace_diffuse_rays.2992
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
	j	bnei_cont.39203
bnei_else.39202:
bnei_cont.39203:
	lw	%v1, 5(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	pretrace_diffuse_rays.3043
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.39201
bgti_else.39200:
bgti_cont.39201:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.39208
	addi	%a0, %v0, -5
	j	bgti_cont.39209
bgti_else.39208:
	add	%a0, %zero, %v0
bgti_cont.39209:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3046
bgti_else.39195:
	jr	%ra
scan_pixel.3057:
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.43374
	jr	%ra
bgt_else.43374:
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
	blt	%t4, %t2, bgt_else.43376
	addi	%t5, %zero, 0
	j	bgt_cont.43377
bgt_else.43376:
	blt	%zero, %v1, bgt_else.43378
	addi	%t5, %zero, 0
	j	bgt_cont.43379
bgt_else.43378:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.43380
	addi	%t5, %zero, 0
	j	bgt_cont.43381
bgt_else.43380:
	blt	%zero, %v0, bgt_else.43382
	addi	%t5, %zero, 0
	j	bgt_cont.43383
bgt_else.43382:
	addi	%t5, %zero, 1
bgt_cont.43383:
bgt_cont.43381:
bgt_cont.43379:
bgt_cont.43377:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%t4, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%a1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a3, 8(%sp)
	beqi	%t5, 0, bnei_else.43384
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bnei_cont.43385
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t7, 2(%t6)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.43388
	add	%at, %a2, %v0
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.43390
	addi	%t7, %v0, -1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.43392
	addi	%t7, %v0, 1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.43394
	addi	%t5, %zero, 1
	j	beq_cont.43389
beq_else.43394:
	addi	%t5, %zero, 0
beq_cont.43395:
	j	beq_cont.43389
beq_else.43392:
	addi	%t5, %zero, 0
beq_cont.43393:
	j	beq_cont.43389
beq_else.43390:
	addi	%t5, %zero, 0
beq_cont.43391:
	j	beq_cont.43389
beq_else.43388:
	addi	%t5, %zero, 0
beq_cont.43389:
	beqi	%t5, 0, bnei_else.43396
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	beqi	%t5, 0, bnei_else.43398
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
	j	bnei_cont.43399
bnei_else.43398:
bnei_cont.43399:
	addi	%a3, %t3, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.43385
bnei_else.43396:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.43397:
	j	bnei_cont.43385
bgti_else.43386:
bgti_cont.43387:
	j	bnei_cont.43385
bnei_else.43384:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.43400
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.43402
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
	beqi	%t5, 0, bnei_else.43404
	lw	%s1, 179(%zero)
	addi	%a0, %t7, 0
	addi	%v1, %t6, 0
	addi	%v0, %s1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.43405
bnei_else.43404:
bnei_cont.43405:
	lw	%v0, 14(%sp)
	beqi	%v0, 1, bnei_else.43406
	lw	%v1, 180(%zero)
	lw	%a0, 13(%sp)
	lw	%a1, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.43407
bnei_else.43406:
bnei_cont.43407:
	lw	%v0, 14(%sp)
	beqi	%v0, 2, bnei_else.43408
	lw	%v1, 181(%zero)
	lw	%a0, 13(%sp)
	lw	%a1, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.43409
bnei_else.43408:
bnei_cont.43409:
	lw	%v0, 14(%sp)
	beqi	%v0, 3, bnei_else.43410
	lw	%v1, 182(%zero)
	lw	%a0, 13(%sp)
	lw	%a1, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.43411
bnei_else.43410:
bnei_cont.43411:
	lw	%v0, 14(%sp)
	beqi	%v0, 4, bnei_else.43412
	lw	%v0, 183(%zero)
	lw	%v1, 13(%sp)
	lw	%a0, 12(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2997
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.43413
bnei_else.43412:
bnei_cont.43413:
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
	j	bnei_cont.43403
bnei_else.43402:
bnei_cont.43403:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.43401
bgti_else.43400:
bgti_cont.43401:
bnei_cont.43385:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.43414
	blti	%v0, 0, bgti_else.43416
	j	bgt_cont.43415
bgti_else.43416:
	addi	%v0, %zero, 0
bgti_cont.43417:
	j	bgt_cont.43415
bgt_else.43414:
	addi	%v0, %zero, 255
bgt_cont.43415:
	lw	%v1, 8(%sp)
	sw	%v0, 15(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	print_int_sub1.2641
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	addi	%v1, %zero, 10
	lw	%a0, 15(%sp)
	sw	%v1, 16(%sp)
	sw	%v0, 17(%sp)
	blti	%a0, 10, bgti_else.43418
	blti	%a0, 20, bgti_else.43420
	blti	%a0, 30, bgti_else.43422
	blti	%a0, 40, bgti_else.43424
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43426
	blti	%a0, 20, bgti_else.43428
	blti	%a0, 30, bgti_else.43430
	blti	%a0, 40, bgti_else.43432
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43434
	blti	%a0, 20, bgti_else.43436
	blti	%a0, 30, bgti_else.43438
	blti	%a0, 40, bgti_else.43440
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43442
	blti	%a0, 20, bgti_else.43444
	blti	%a0, 30, bgti_else.43446
	blti	%a0, 40, bgti_else.43448
	addi	%a0, %a0, -40
	addi	%v0, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	print_int_sub2.2644
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.43419
bgti_else.43448:
	addi	%v0, %a0, -30
bgti_cont.43449:
	j	bgti_cont.43419
bgti_else.43446:
	addi	%v0, %a0, -20
bgti_cont.43447:
	j	bgti_cont.43419
bgti_else.43444:
	addi	%v0, %a0, -10
bgti_cont.43445:
	j	bgti_cont.43419
bgti_else.43442:
	add	%v0, %zero, %a0
bgti_cont.43443:
	j	bgti_cont.43419
bgti_else.43440:
	addi	%v0, %a0, -30
bgti_cont.43441:
	j	bgti_cont.43419
bgti_else.43438:
	addi	%v0, %a0, -20
bgti_cont.43439:
	j	bgti_cont.43419
bgti_else.43436:
	addi	%v0, %a0, -10
bgti_cont.43437:
	j	bgti_cont.43419
bgti_else.43434:
	add	%v0, %zero, %a0
bgti_cont.43435:
	j	bgti_cont.43419
bgti_else.43432:
	addi	%v0, %a0, -30
bgti_cont.43433:
	j	bgti_cont.43419
bgti_else.43430:
	addi	%v0, %a0, -20
bgti_cont.43431:
	j	bgti_cont.43419
bgti_else.43428:
	addi	%v0, %a0, -10
bgti_cont.43429:
	j	bgti_cont.43419
bgti_else.43426:
	add	%v0, %zero, %a0
bgti_cont.43427:
	j	bgti_cont.43419
bgti_else.43424:
	addi	%v0, %a0, -30
bgti_cont.43425:
	j	bgti_cont.43419
bgti_else.43422:
	addi	%v0, %a0, -20
bgti_cont.43423:
	j	bgti_cont.43419
bgti_else.43420:
	addi	%v0, %a0, -10
bgti_cont.43421:
	j	bgti_cont.43419
bgti_else.43418:
	add	%v0, %zero, %a0
bgti_cont.43419:
	lw	%v1, 17(%sp)
	blt	%zero, %v1, bgt_else.43450
	addi	%v0, %v0, 48
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_print_char
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgt_cont.43451
bgt_else.43450:
	lw	%a0, 8(%sp)
	sw	%v0, 18(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub1.2641
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 17(%sp)
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.43452
	blti	%v1, 20, bgti_else.43454
	blti	%v1, 30, bgti_else.43456
	blti	%v1, 40, bgti_else.43458
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43460
	blti	%v1, 20, bgti_else.43462
	blti	%v1, 30, bgti_else.43464
	blti	%v1, 40, bgti_else.43466
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43468
	blti	%v1, 20, bgti_else.43470
	blti	%v1, 30, bgti_else.43472
	blti	%v1, 40, bgti_else.43474
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43476
	blti	%v1, 20, bgti_else.43478
	blti	%v1, 30, bgti_else.43480
	blti	%v1, 40, bgti_else.43482
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub2.2644
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.43453
bgti_else.43482:
	addi	%v0, %v1, -30
bgti_cont.43483:
	j	bgti_cont.43453
bgti_else.43480:
	addi	%v0, %v1, -20
bgti_cont.43481:
	j	bgti_cont.43453
bgti_else.43478:
	addi	%v0, %v1, -10
bgti_cont.43479:
	j	bgti_cont.43453
bgti_else.43476:
	add	%v0, %zero, %v1
bgti_cont.43477:
	j	bgti_cont.43453
bgti_else.43474:
	addi	%v0, %v1, -30
bgti_cont.43475:
	j	bgti_cont.43453
bgti_else.43472:
	addi	%v0, %v1, -20
bgti_cont.43473:
	j	bgti_cont.43453
bgti_else.43470:
	addi	%v0, %v1, -10
bgti_cont.43471:
	j	bgti_cont.43453
bgti_else.43468:
	add	%v0, %zero, %v1
bgti_cont.43469:
	j	bgti_cont.43453
bgti_else.43466:
	addi	%v0, %v1, -30
bgti_cont.43467:
	j	bgti_cont.43453
bgti_else.43464:
	addi	%v0, %v1, -20
bgti_cont.43465:
	j	bgti_cont.43453
bgti_else.43462:
	addi	%v0, %v1, -10
bgti_cont.43463:
	j	bgti_cont.43453
bgti_else.43460:
	add	%v0, %zero, %v1
bgti_cont.43461:
	j	bgti_cont.43453
bgti_else.43458:
	addi	%v0, %v1, -30
bgti_cont.43459:
	j	bgti_cont.43453
bgti_else.43456:
	addi	%v0, %v1, -20
bgti_cont.43457:
	j	bgti_cont.43453
bgti_else.43454:
	addi	%v0, %v1, -10
bgti_cont.43455:
	j	bgti_cont.43453
bgti_else.43452:
	add	%v0, %zero, %v1
bgti_cont.43453:
	lw	%v1, 19(%sp)
	blt	%zero, %v1, bgt_else.43484
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
	j	bgt_cont.43485
bgt_else.43484:
	sw	%v0, 20(%sp)
	blti	%v1, 10, bgti_else.43486
	blti	%v1, 20, bgti_else.43488
	blti	%v1, 30, bgti_else.43490
	blti	%v1, 40, bgti_else.43492
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43494
	blti	%v1, 20, bgti_else.43496
	blti	%v1, 30, bgti_else.43498
	blti	%v1, 40, bgti_else.43500
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43502
	blti	%v1, 20, bgti_else.43504
	blti	%v1, 30, bgti_else.43506
	blti	%v1, 40, bgti_else.43508
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43510
	blti	%v1, 20, bgti_else.43512
	blti	%v1, 30, bgti_else.43514
	blti	%v1, 40, bgti_else.43516
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	print_int_sub2.2644
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bgti_cont.43487
bgti_else.43516:
	addi	%v0, %v1, -30
bgti_cont.43517:
	j	bgti_cont.43487
bgti_else.43514:
	addi	%v0, %v1, -20
bgti_cont.43515:
	j	bgti_cont.43487
bgti_else.43512:
	addi	%v0, %v1, -10
bgti_cont.43513:
	j	bgti_cont.43487
bgti_else.43510:
	add	%v0, %zero, %v1
bgti_cont.43511:
	j	bgti_cont.43487
bgti_else.43508:
	addi	%v0, %v1, -30
bgti_cont.43509:
	j	bgti_cont.43487
bgti_else.43506:
	addi	%v0, %v1, -20
bgti_cont.43507:
	j	bgti_cont.43487
bgti_else.43504:
	addi	%v0, %v1, -10
bgti_cont.43505:
	j	bgti_cont.43487
bgti_else.43502:
	add	%v0, %zero, %v1
bgti_cont.43503:
	j	bgti_cont.43487
bgti_else.43500:
	addi	%v0, %v1, -30
bgti_cont.43501:
	j	bgti_cont.43487
bgti_else.43498:
	addi	%v0, %v1, -20
bgti_cont.43499:
	j	bgti_cont.43487
bgti_else.43496:
	addi	%v0, %v1, -10
bgti_cont.43497:
	j	bgti_cont.43487
bgti_else.43494:
	add	%v0, %zero, %v1
bgti_cont.43495:
	j	bgti_cont.43487
bgti_else.43492:
	addi	%v0, %v1, -30
bgti_cont.43493:
	j	bgti_cont.43487
bgti_else.43490:
	addi	%v0, %v1, -20
bgti_cont.43491:
	j	bgti_cont.43487
bgti_else.43488:
	addi	%v0, %v1, -10
bgti_cont.43489:
	j	bgti_cont.43487
bgti_else.43486:
	add	%v0, %zero, %v1
bgti_cont.43487:
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
bgt_cont.43485:
bgt_cont.43451:
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
	blt	%at, %v0, bgt_else.43518
	blti	%v0, 0, bgti_else.43520
	j	bgt_cont.43519
bgti_else.43520:
	addi	%v0, %zero, 0
bgti_cont.43521:
	j	bgt_cont.43519
bgt_else.43518:
	addi	%v0, %zero, 255
bgt_cont.43519:
	lw	%v1, 8(%sp)
	sw	%v0, 22(%sp)
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub1.2641
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	blti	%v1, 10, bgti_else.43522
	blti	%v1, 20, bgti_else.43524
	blti	%v1, 30, bgti_else.43526
	blti	%v1, 40, bgti_else.43528
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43530
	blti	%v1, 20, bgti_else.43532
	blti	%v1, 30, bgti_else.43534
	blti	%v1, 40, bgti_else.43536
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43538
	blti	%v1, 20, bgti_else.43540
	blti	%v1, 30, bgti_else.43542
	blti	%v1, 40, bgti_else.43544
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43546
	blti	%v1, 20, bgti_else.43548
	blti	%v1, 30, bgti_else.43550
	blti	%v1, 40, bgti_else.43552
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub2.2644
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgti_cont.43523
bgti_else.43552:
	addi	%v0, %v1, -30
bgti_cont.43553:
	j	bgti_cont.43523
bgti_else.43550:
	addi	%v0, %v1, -20
bgti_cont.43551:
	j	bgti_cont.43523
bgti_else.43548:
	addi	%v0, %v1, -10
bgti_cont.43549:
	j	bgti_cont.43523
bgti_else.43546:
	add	%v0, %zero, %v1
bgti_cont.43547:
	j	bgti_cont.43523
bgti_else.43544:
	addi	%v0, %v1, -30
bgti_cont.43545:
	j	bgti_cont.43523
bgti_else.43542:
	addi	%v0, %v1, -20
bgti_cont.43543:
	j	bgti_cont.43523
bgti_else.43540:
	addi	%v0, %v1, -10
bgti_cont.43541:
	j	bgti_cont.43523
bgti_else.43538:
	add	%v0, %zero, %v1
bgti_cont.43539:
	j	bgti_cont.43523
bgti_else.43536:
	addi	%v0, %v1, -30
bgti_cont.43537:
	j	bgti_cont.43523
bgti_else.43534:
	addi	%v0, %v1, -20
bgti_cont.43535:
	j	bgti_cont.43523
bgti_else.43532:
	addi	%v0, %v1, -10
bgti_cont.43533:
	j	bgti_cont.43523
bgti_else.43530:
	add	%v0, %zero, %v1
bgti_cont.43531:
	j	bgti_cont.43523
bgti_else.43528:
	addi	%v0, %v1, -30
bgti_cont.43529:
	j	bgti_cont.43523
bgti_else.43526:
	addi	%v0, %v1, -20
bgti_cont.43527:
	j	bgti_cont.43523
bgti_else.43524:
	addi	%v0, %v1, -10
bgti_cont.43525:
	j	bgti_cont.43523
bgti_else.43522:
	add	%v0, %zero, %v1
bgti_cont.43523:
	lw	%v1, 23(%sp)
	blt	%zero, %v1, bgt_else.43554
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_print_char
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgt_cont.43555
bgt_else.43554:
	lw	%a0, 8(%sp)
	sw	%v0, 24(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub1.2641
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	blti	%v1, 10, bgti_else.43556
	blti	%v1, 20, bgti_else.43558
	blti	%v1, 30, bgti_else.43560
	blti	%v1, 40, bgti_else.43562
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43564
	blti	%v1, 20, bgti_else.43566
	blti	%v1, 30, bgti_else.43568
	blti	%v1, 40, bgti_else.43570
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43572
	blti	%v1, 20, bgti_else.43574
	blti	%v1, 30, bgti_else.43576
	blti	%v1, 40, bgti_else.43578
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43580
	blti	%v1, 20, bgti_else.43582
	blti	%v1, 30, bgti_else.43584
	blti	%v1, 40, bgti_else.43586
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	print_int_sub2.2644
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.43557
bgti_else.43586:
	addi	%v0, %v1, -30
bgti_cont.43587:
	j	bgti_cont.43557
bgti_else.43584:
	addi	%v0, %v1, -20
bgti_cont.43585:
	j	bgti_cont.43557
bgti_else.43582:
	addi	%v0, %v1, -10
bgti_cont.43583:
	j	bgti_cont.43557
bgti_else.43580:
	add	%v0, %zero, %v1
bgti_cont.43581:
	j	bgti_cont.43557
bgti_else.43578:
	addi	%v0, %v1, -30
bgti_cont.43579:
	j	bgti_cont.43557
bgti_else.43576:
	addi	%v0, %v1, -20
bgti_cont.43577:
	j	bgti_cont.43557
bgti_else.43574:
	addi	%v0, %v1, -10
bgti_cont.43575:
	j	bgti_cont.43557
bgti_else.43572:
	add	%v0, %zero, %v1
bgti_cont.43573:
	j	bgti_cont.43557
bgti_else.43570:
	addi	%v0, %v1, -30
bgti_cont.43571:
	j	bgti_cont.43557
bgti_else.43568:
	addi	%v0, %v1, -20
bgti_cont.43569:
	j	bgti_cont.43557
bgti_else.43566:
	addi	%v0, %v1, -10
bgti_cont.43567:
	j	bgti_cont.43557
bgti_else.43564:
	add	%v0, %zero, %v1
bgti_cont.43565:
	j	bgti_cont.43557
bgti_else.43562:
	addi	%v0, %v1, -30
bgti_cont.43563:
	j	bgti_cont.43557
bgti_else.43560:
	addi	%v0, %v1, -20
bgti_cont.43561:
	j	bgti_cont.43557
bgti_else.43558:
	addi	%v0, %v1, -10
bgti_cont.43559:
	j	bgti_cont.43557
bgti_else.43556:
	add	%v0, %zero, %v1
bgti_cont.43557:
	lw	%v1, 25(%sp)
	blt	%zero, %v1, bgt_else.43588
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
	j	bgt_cont.43589
bgt_else.43588:
	sw	%v0, 26(%sp)
	blti	%v1, 10, bgti_else.43590
	blti	%v1, 20, bgti_else.43592
	blti	%v1, 30, bgti_else.43594
	blti	%v1, 40, bgti_else.43596
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43598
	blti	%v1, 20, bgti_else.43600
	blti	%v1, 30, bgti_else.43602
	blti	%v1, 40, bgti_else.43604
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43606
	blti	%v1, 20, bgti_else.43608
	blti	%v1, 30, bgti_else.43610
	blti	%v1, 40, bgti_else.43612
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43614
	blti	%v1, 20, bgti_else.43616
	blti	%v1, 30, bgti_else.43618
	blti	%v1, 40, bgti_else.43620
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2644
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.43591
bgti_else.43620:
	addi	%v0, %v1, -30
bgti_cont.43621:
	j	bgti_cont.43591
bgti_else.43618:
	addi	%v0, %v1, -20
bgti_cont.43619:
	j	bgti_cont.43591
bgti_else.43616:
	addi	%v0, %v1, -10
bgti_cont.43617:
	j	bgti_cont.43591
bgti_else.43614:
	add	%v0, %zero, %v1
bgti_cont.43615:
	j	bgti_cont.43591
bgti_else.43612:
	addi	%v0, %v1, -30
bgti_cont.43613:
	j	bgti_cont.43591
bgti_else.43610:
	addi	%v0, %v1, -20
bgti_cont.43611:
	j	bgti_cont.43591
bgti_else.43608:
	addi	%v0, %v1, -10
bgti_cont.43609:
	j	bgti_cont.43591
bgti_else.43606:
	add	%v0, %zero, %v1
bgti_cont.43607:
	j	bgti_cont.43591
bgti_else.43604:
	addi	%v0, %v1, -30
bgti_cont.43605:
	j	bgti_cont.43591
bgti_else.43602:
	addi	%v0, %v1, -20
bgti_cont.43603:
	j	bgti_cont.43591
bgti_else.43600:
	addi	%v0, %v1, -10
bgti_cont.43601:
	j	bgti_cont.43591
bgti_else.43598:
	add	%v0, %zero, %v1
bgti_cont.43599:
	j	bgti_cont.43591
bgti_else.43596:
	addi	%v0, %v1, -30
bgti_cont.43597:
	j	bgti_cont.43591
bgti_else.43594:
	addi	%v0, %v1, -20
bgti_cont.43595:
	j	bgti_cont.43591
bgti_else.43592:
	addi	%v0, %v1, -10
bgti_cont.43593:
	j	bgti_cont.43591
bgti_else.43590:
	add	%v0, %zero, %v1
bgti_cont.43591:
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
bgt_cont.43589:
bgt_cont.43555:
	lw	%v0, 21(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.43622
	blti	%v0, 0, bgti_else.43624
	j	bgt_cont.43623
bgti_else.43624:
	addi	%v0, %zero, 0
bgti_cont.43625:
	j	bgt_cont.43623
bgt_else.43622:
	addi	%v0, %zero, 255
bgt_cont.43623:
	lw	%v1, 8(%sp)
	sw	%v0, 27(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	print_int_sub1.2641
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	sw	%v0, 28(%sp)
	blti	%v1, 10, bgti_else.43626
	blti	%v1, 20, bgti_else.43628
	blti	%v1, 30, bgti_else.43630
	blti	%v1, 40, bgti_else.43632
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43634
	blti	%v1, 20, bgti_else.43636
	blti	%v1, 30, bgti_else.43638
	blti	%v1, 40, bgti_else.43640
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43642
	blti	%v1, 20, bgti_else.43644
	blti	%v1, 30, bgti_else.43646
	blti	%v1, 40, bgti_else.43648
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43650
	blti	%v1, 20, bgti_else.43652
	blti	%v1, 30, bgti_else.43654
	blti	%v1, 40, bgti_else.43656
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int_sub2.2644
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bgti_cont.43627
bgti_else.43656:
	addi	%v0, %v1, -30
bgti_cont.43657:
	j	bgti_cont.43627
bgti_else.43654:
	addi	%v0, %v1, -20
bgti_cont.43655:
	j	bgti_cont.43627
bgti_else.43652:
	addi	%v0, %v1, -10
bgti_cont.43653:
	j	bgti_cont.43627
bgti_else.43650:
	add	%v0, %zero, %v1
bgti_cont.43651:
	j	bgti_cont.43627
bgti_else.43648:
	addi	%v0, %v1, -30
bgti_cont.43649:
	j	bgti_cont.43627
bgti_else.43646:
	addi	%v0, %v1, -20
bgti_cont.43647:
	j	bgti_cont.43627
bgti_else.43644:
	addi	%v0, %v1, -10
bgti_cont.43645:
	j	bgti_cont.43627
bgti_else.43642:
	add	%v0, %zero, %v1
bgti_cont.43643:
	j	bgti_cont.43627
bgti_else.43640:
	addi	%v0, %v1, -30
bgti_cont.43641:
	j	bgti_cont.43627
bgti_else.43638:
	addi	%v0, %v1, -20
bgti_cont.43639:
	j	bgti_cont.43627
bgti_else.43636:
	addi	%v0, %v1, -10
bgti_cont.43637:
	j	bgti_cont.43627
bgti_else.43634:
	add	%v0, %zero, %v1
bgti_cont.43635:
	j	bgti_cont.43627
bgti_else.43632:
	addi	%v0, %v1, -30
bgti_cont.43633:
	j	bgti_cont.43627
bgti_else.43630:
	addi	%v0, %v1, -20
bgti_cont.43631:
	j	bgti_cont.43627
bgti_else.43628:
	addi	%v0, %v1, -10
bgti_cont.43629:
	j	bgti_cont.43627
bgti_else.43626:
	add	%v0, %zero, %v1
bgti_cont.43627:
	lw	%v1, 28(%sp)
	blt	%zero, %v1, bgt_else.43658
	addi	%v0, %v0, 48
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bgt_cont.43659
bgt_else.43658:
	lw	%a0, 8(%sp)
	sw	%v0, 29(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	print_int_sub1.2641
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	lw	%v1, 28(%sp)
	sw	%v0, 30(%sp)
	blti	%v1, 10, bgti_else.43660
	blti	%v1, 20, bgti_else.43662
	blti	%v1, 30, bgti_else.43664
	blti	%v1, 40, bgti_else.43666
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43668
	blti	%v1, 20, bgti_else.43670
	blti	%v1, 30, bgti_else.43672
	blti	%v1, 40, bgti_else.43674
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43676
	blti	%v1, 20, bgti_else.43678
	blti	%v1, 30, bgti_else.43680
	blti	%v1, 40, bgti_else.43682
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43684
	blti	%v1, 20, bgti_else.43686
	blti	%v1, 30, bgti_else.43688
	blti	%v1, 40, bgti_else.43690
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	print_int_sub2.2644
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	bgti_cont.43661
bgti_else.43690:
	addi	%v0, %v1, -30
bgti_cont.43691:
	j	bgti_cont.43661
bgti_else.43688:
	addi	%v0, %v1, -20
bgti_cont.43689:
	j	bgti_cont.43661
bgti_else.43686:
	addi	%v0, %v1, -10
bgti_cont.43687:
	j	bgti_cont.43661
bgti_else.43684:
	add	%v0, %zero, %v1
bgti_cont.43685:
	j	bgti_cont.43661
bgti_else.43682:
	addi	%v0, %v1, -30
bgti_cont.43683:
	j	bgti_cont.43661
bgti_else.43680:
	addi	%v0, %v1, -20
bgti_cont.43681:
	j	bgti_cont.43661
bgti_else.43678:
	addi	%v0, %v1, -10
bgti_cont.43679:
	j	bgti_cont.43661
bgti_else.43676:
	add	%v0, %zero, %v1
bgti_cont.43677:
	j	bgti_cont.43661
bgti_else.43674:
	addi	%v0, %v1, -30
bgti_cont.43675:
	j	bgti_cont.43661
bgti_else.43672:
	addi	%v0, %v1, -20
bgti_cont.43673:
	j	bgti_cont.43661
bgti_else.43670:
	addi	%v0, %v1, -10
bgti_cont.43671:
	j	bgti_cont.43661
bgti_else.43668:
	add	%v0, %zero, %v1
bgti_cont.43669:
	j	bgti_cont.43661
bgti_else.43666:
	addi	%v0, %v1, -30
bgti_cont.43667:
	j	bgti_cont.43661
bgti_else.43664:
	addi	%v0, %v1, -20
bgti_cont.43665:
	j	bgti_cont.43661
bgti_else.43662:
	addi	%v0, %v1, -10
bgti_cont.43663:
	j	bgti_cont.43661
bgti_else.43660:
	add	%v0, %zero, %v1
bgti_cont.43661:
	lw	%v1, 30(%sp)
	blt	%zero, %v1, bgt_else.43692
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
	j	bgt_cont.43693
bgt_else.43692:
	sw	%v0, 31(%sp)
	blti	%v1, 10, bgti_else.43694
	blti	%v1, 20, bgti_else.43696
	blti	%v1, 30, bgti_else.43698
	blti	%v1, 40, bgti_else.43700
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43702
	blti	%v1, 20, bgti_else.43704
	blti	%v1, 30, bgti_else.43706
	blti	%v1, 40, bgti_else.43708
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43710
	blti	%v1, 20, bgti_else.43712
	blti	%v1, 30, bgti_else.43714
	blti	%v1, 40, bgti_else.43716
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43718
	blti	%v1, 20, bgti_else.43720
	blti	%v1, 30, bgti_else.43722
	blti	%v1, 40, bgti_else.43724
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	print_int_sub2.2644
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	j	bgti_cont.43695
bgti_else.43724:
	addi	%v0, %v1, -30
bgti_cont.43725:
	j	bgti_cont.43695
bgti_else.43722:
	addi	%v0, %v1, -20
bgti_cont.43723:
	j	bgti_cont.43695
bgti_else.43720:
	addi	%v0, %v1, -10
bgti_cont.43721:
	j	bgti_cont.43695
bgti_else.43718:
	add	%v0, %zero, %v1
bgti_cont.43719:
	j	bgti_cont.43695
bgti_else.43716:
	addi	%v0, %v1, -30
bgti_cont.43717:
	j	bgti_cont.43695
bgti_else.43714:
	addi	%v0, %v1, -20
bgti_cont.43715:
	j	bgti_cont.43695
bgti_else.43712:
	addi	%v0, %v1, -10
bgti_cont.43713:
	j	bgti_cont.43695
bgti_else.43710:
	add	%v0, %zero, %v1
bgti_cont.43711:
	j	bgti_cont.43695
bgti_else.43708:
	addi	%v0, %v1, -30
bgti_cont.43709:
	j	bgti_cont.43695
bgti_else.43706:
	addi	%v0, %v1, -20
bgti_cont.43707:
	j	bgti_cont.43695
bgti_else.43704:
	addi	%v0, %v1, -10
bgti_cont.43705:
	j	bgti_cont.43695
bgti_else.43702:
	add	%v0, %zero, %v1
bgti_cont.43703:
	j	bgti_cont.43695
bgti_else.43700:
	addi	%v0, %v1, -30
bgti_cont.43701:
	j	bgti_cont.43695
bgti_else.43698:
	addi	%v0, %v1, -20
bgti_cont.43699:
	j	bgti_cont.43695
bgti_else.43696:
	addi	%v0, %v1, -10
bgti_cont.43697:
	j	bgti_cont.43695
bgti_else.43694:
	add	%v0, %zero, %v1
bgti_cont.43695:
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
bgt_cont.43693:
bgt_cont.43659:
	lw	%v0, 16(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_print_char
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 6(%sp)
	blt	%v0, %v1, bgt_else.43726
	jr	%ra
bgt_else.43726:
	lw	%a1, 5(%sp)
	add	%at, %a1, %v0
	lw	%a0, 0(%at)
	lw	%a2, 0(%a0)
	flw	%f0, 0(%a2)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)
	fsw	%f0, 153(%zero)
	lw	%a2, 3(%sp)
	lw	%a3, 4(%sp)
	blt	%a2, %a3, bgt_else.43728
	addi	%v1, %zero, 0
	j	bgt_cont.43729
bgt_else.43728:
	lw	%a2, 2(%sp)
	blt	%zero, %a2, bgt_else.43730
	addi	%v1, %zero, 0
	j	bgt_cont.43731
bgt_else.43730:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.43732
	addi	%v1, %zero, 0
	j	bgt_cont.43733
bgt_else.43732:
	blt	%zero, %v0, bgt_else.43734
	addi	%v1, %zero, 0
	j	bgt_cont.43735
bgt_else.43734:
	addi	%v1, %zero, 1
bgt_cont.43735:
bgt_cont.43733:
bgt_cont.43731:
bgt_cont.43729:
	sw	%v0, 32(%sp)
	beqi	%v1, 0, bnei_else.43736
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 8(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	j	bnei_cont.43737
bnei_else.43736:
	lw	%v1, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
bnei_cont.43737:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.43738
	blti	%v0, 0, bgti_else.43740
	j	bgt_cont.43739
bgti_else.43740:
	addi	%v0, %zero, 0
bgti_cont.43741:
	j	bgt_cont.43739
bgt_else.43738:
	addi	%v0, %zero, 255
bgt_cont.43739:
	sw	%v0, 33(%sp)
	blti	%v0, 10, bgti_else.43742
	blti	%v0, 20, bgti_else.43744
	blti	%v0, 30, bgti_else.43746
	blti	%v0, 40, bgti_else.43748
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.43750
	blti	%v1, 20, bgti_else.43752
	blti	%v1, 30, bgti_else.43754
	blti	%v1, 40, bgti_else.43756
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43758
	blti	%v1, 20, bgti_else.43760
	blti	%v1, 30, bgti_else.43762
	blti	%v1, 40, bgti_else.43764
	addi	%v1, %v1, -40
	addi	%a0, %zero, 12
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	print_int_sub1.2641
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	bgti_cont.43743
bgti_else.43764:
	addi	%v0, %zero, 11
bgti_cont.43765:
	j	bgti_cont.43743
bgti_else.43762:
	addi	%v0, %zero, 10
bgti_cont.43763:
	j	bgti_cont.43743
bgti_else.43760:
	addi	%v0, %zero, 9
bgti_cont.43761:
	j	bgti_cont.43743
bgti_else.43758:
	addi	%v0, %zero, 8
bgti_cont.43759:
	j	bgti_cont.43743
bgti_else.43756:
	addi	%v0, %zero, 7
bgti_cont.43757:
	j	bgti_cont.43743
bgti_else.43754:
	addi	%v0, %zero, 6
bgti_cont.43755:
	j	bgti_cont.43743
bgti_else.43752:
	addi	%v0, %zero, 5
bgti_cont.43753:
	j	bgti_cont.43743
bgti_else.43750:
	addi	%v0, %zero, 4
bgti_cont.43751:
	j	bgti_cont.43743
bgti_else.43748:
	addi	%v0, %zero, 3
bgti_cont.43749:
	j	bgti_cont.43743
bgti_else.43746:
	addi	%v0, %zero, 2
bgti_cont.43747:
	j	bgti_cont.43743
bgti_else.43744:
	addi	%v0, %zero, 1
bgti_cont.43745:
	j	bgti_cont.43743
bgti_else.43742:
	addi	%v0, %zero, 0
bgti_cont.43743:
	lw	%v1, 33(%sp)
	sw	%v0, 34(%sp)
	blti	%v1, 10, bgti_else.43766
	blti	%v1, 20, bgti_else.43768
	blti	%v1, 30, bgti_else.43770
	blti	%v1, 40, bgti_else.43772
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43774
	blti	%v1, 20, bgti_else.43776
	blti	%v1, 30, bgti_else.43778
	blti	%v1, 40, bgti_else.43780
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43782
	blti	%v1, 20, bgti_else.43784
	blti	%v1, 30, bgti_else.43786
	blti	%v1, 40, bgti_else.43788
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	print_int_sub2.2644
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	bgti_cont.43767
bgti_else.43788:
	addi	%v0, %v1, -30
bgti_cont.43789:
	j	bgti_cont.43767
bgti_else.43786:
	addi	%v0, %v1, -20
bgti_cont.43787:
	j	bgti_cont.43767
bgti_else.43784:
	addi	%v0, %v1, -10
bgti_cont.43785:
	j	bgti_cont.43767
bgti_else.43782:
	add	%v0, %zero, %v1
bgti_cont.43783:
	j	bgti_cont.43767
bgti_else.43780:
	addi	%v0, %v1, -30
bgti_cont.43781:
	j	bgti_cont.43767
bgti_else.43778:
	addi	%v0, %v1, -20
bgti_cont.43779:
	j	bgti_cont.43767
bgti_else.43776:
	addi	%v0, %v1, -10
bgti_cont.43777:
	j	bgti_cont.43767
bgti_else.43774:
	add	%v0, %zero, %v1
bgti_cont.43775:
	j	bgti_cont.43767
bgti_else.43772:
	addi	%v0, %v1, -30
bgti_cont.43773:
	j	bgti_cont.43767
bgti_else.43770:
	addi	%v0, %v1, -20
bgti_cont.43771:
	j	bgti_cont.43767
bgti_else.43768:
	addi	%v0, %v1, -10
bgti_cont.43769:
	j	bgti_cont.43767
bgti_else.43766:
	add	%v0, %zero, %v1
bgti_cont.43767:
	lw	%v1, 34(%sp)
	blt	%zero, %v1, bgt_else.43790
	addi	%v0, %v0, 48
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	min_caml_print_char
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	bgt_cont.43791
bgt_else.43790:
	sw	%v0, 35(%sp)
	blti	%v1, 10, bgti_else.43792
	blti	%v1, 20, bgti_else.43794
	blti	%v1, 30, bgti_else.43796
	blti	%v1, 40, bgti_else.43798
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.43800
	blti	%a0, 20, bgti_else.43802
	blti	%a0, 30, bgti_else.43804
	blti	%a0, 40, bgti_else.43806
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43808
	blti	%a0, 20, bgti_else.43810
	blti	%a0, 30, bgti_else.43812
	blti	%a0, 40, bgti_else.43814
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	print_int_sub1.2641
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	j	bgti_cont.43793
bgti_else.43814:
	addi	%v0, %zero, 11
bgti_cont.43815:
	j	bgti_cont.43793
bgti_else.43812:
	addi	%v0, %zero, 10
bgti_cont.43813:
	j	bgti_cont.43793
bgti_else.43810:
	addi	%v0, %zero, 9
bgti_cont.43811:
	j	bgti_cont.43793
bgti_else.43808:
	addi	%v0, %zero, 8
bgti_cont.43809:
	j	bgti_cont.43793
bgti_else.43806:
	addi	%v0, %zero, 7
bgti_cont.43807:
	j	bgti_cont.43793
bgti_else.43804:
	addi	%v0, %zero, 6
bgti_cont.43805:
	j	bgti_cont.43793
bgti_else.43802:
	addi	%v0, %zero, 5
bgti_cont.43803:
	j	bgti_cont.43793
bgti_else.43800:
	addi	%v0, %zero, 4
bgti_cont.43801:
	j	bgti_cont.43793
bgti_else.43798:
	addi	%v0, %zero, 3
bgti_cont.43799:
	j	bgti_cont.43793
bgti_else.43796:
	addi	%v0, %zero, 2
bgti_cont.43797:
	j	bgti_cont.43793
bgti_else.43794:
	addi	%v0, %zero, 1
bgti_cont.43795:
	j	bgti_cont.43793
bgti_else.43792:
	addi	%v0, %zero, 0
bgti_cont.43793:
	lw	%v1, 34(%sp)
	sw	%v0, 36(%sp)
	blti	%v1, 10, bgti_else.43816
	blti	%v1, 20, bgti_else.43818
	blti	%v1, 30, bgti_else.43820
	blti	%v1, 40, bgti_else.43822
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43824
	blti	%v1, 20, bgti_else.43826
	blti	%v1, 30, bgti_else.43828
	blti	%v1, 40, bgti_else.43830
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43832
	blti	%v1, 20, bgti_else.43834
	blti	%v1, 30, bgti_else.43836
	blti	%v1, 40, bgti_else.43838
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	print_int_sub2.2644
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	bgti_cont.43817
bgti_else.43838:
	addi	%v0, %v1, -30
bgti_cont.43839:
	j	bgti_cont.43817
bgti_else.43836:
	addi	%v0, %v1, -20
bgti_cont.43837:
	j	bgti_cont.43817
bgti_else.43834:
	addi	%v0, %v1, -10
bgti_cont.43835:
	j	bgti_cont.43817
bgti_else.43832:
	add	%v0, %zero, %v1
bgti_cont.43833:
	j	bgti_cont.43817
bgti_else.43830:
	addi	%v0, %v1, -30
bgti_cont.43831:
	j	bgti_cont.43817
bgti_else.43828:
	addi	%v0, %v1, -20
bgti_cont.43829:
	j	bgti_cont.43817
bgti_else.43826:
	addi	%v0, %v1, -10
bgti_cont.43827:
	j	bgti_cont.43817
bgti_else.43824:
	add	%v0, %zero, %v1
bgti_cont.43825:
	j	bgti_cont.43817
bgti_else.43822:
	addi	%v0, %v1, -30
bgti_cont.43823:
	j	bgti_cont.43817
bgti_else.43820:
	addi	%v0, %v1, -20
bgti_cont.43821:
	j	bgti_cont.43817
bgti_else.43818:
	addi	%v0, %v1, -10
bgti_cont.43819:
	j	bgti_cont.43817
bgti_else.43816:
	add	%v0, %zero, %v1
bgti_cont.43817:
	lw	%v1, 36(%sp)
	blt	%zero, %v1, bgt_else.43840
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
	j	bgt_cont.43841
bgt_else.43840:
	sw	%v0, 37(%sp)
	blti	%v1, 10, bgti_else.43842
	blti	%v1, 20, bgti_else.43844
	blti	%v1, 30, bgti_else.43846
	blti	%v1, 40, bgti_else.43848
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43850
	blti	%v1, 20, bgti_else.43852
	blti	%v1, 30, bgti_else.43854
	blti	%v1, 40, bgti_else.43856
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43858
	blti	%v1, 20, bgti_else.43860
	blti	%v1, 30, bgti_else.43862
	blti	%v1, 40, bgti_else.43864
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	print_int_sub2.2644
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	j	bgti_cont.43843
bgti_else.43864:
	addi	%v0, %v1, -30
bgti_cont.43865:
	j	bgti_cont.43843
bgti_else.43862:
	addi	%v0, %v1, -20
bgti_cont.43863:
	j	bgti_cont.43843
bgti_else.43860:
	addi	%v0, %v1, -10
bgti_cont.43861:
	j	bgti_cont.43843
bgti_else.43858:
	add	%v0, %zero, %v1
bgti_cont.43859:
	j	bgti_cont.43843
bgti_else.43856:
	addi	%v0, %v1, -30
bgti_cont.43857:
	j	bgti_cont.43843
bgti_else.43854:
	addi	%v0, %v1, -20
bgti_cont.43855:
	j	bgti_cont.43843
bgti_else.43852:
	addi	%v0, %v1, -10
bgti_cont.43853:
	j	bgti_cont.43843
bgti_else.43850:
	add	%v0, %zero, %v1
bgti_cont.43851:
	j	bgti_cont.43843
bgti_else.43848:
	addi	%v0, %v1, -30
bgti_cont.43849:
	j	bgti_cont.43843
bgti_else.43846:
	addi	%v0, %v1, -20
bgti_cont.43847:
	j	bgti_cont.43843
bgti_else.43844:
	addi	%v0, %v1, -10
bgti_cont.43845:
	j	bgti_cont.43843
bgti_else.43842:
	add	%v0, %zero, %v1
bgti_cont.43843:
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
bgt_cont.43841:
bgt_cont.43791:
	lw	%v0, 21(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_print_char
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.43866
	blti	%v0, 0, bgti_else.43868
	j	bgt_cont.43867
bgti_else.43868:
	addi	%v0, %zero, 0
bgti_cont.43869:
	j	bgt_cont.43867
bgt_else.43866:
	addi	%v0, %zero, 255
bgt_cont.43867:
	sw	%v0, 38(%sp)
	blti	%v0, 10, bgti_else.43870
	blti	%v0, 20, bgti_else.43872
	blti	%v0, 30, bgti_else.43874
	blti	%v0, 40, bgti_else.43876
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.43878
	blti	%v1, 20, bgti_else.43880
	blti	%v1, 30, bgti_else.43882
	blti	%v1, 40, bgti_else.43884
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43886
	blti	%v1, 20, bgti_else.43888
	blti	%v1, 30, bgti_else.43890
	blti	%v1, 40, bgti_else.43892
	addi	%v1, %v1, -40
	addi	%a0, %zero, 12
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	print_int_sub1.2641
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	j	bgti_cont.43871
bgti_else.43892:
	addi	%v0, %zero, 11
bgti_cont.43893:
	j	bgti_cont.43871
bgti_else.43890:
	addi	%v0, %zero, 10
bgti_cont.43891:
	j	bgti_cont.43871
bgti_else.43888:
	addi	%v0, %zero, 9
bgti_cont.43889:
	j	bgti_cont.43871
bgti_else.43886:
	addi	%v0, %zero, 8
bgti_cont.43887:
	j	bgti_cont.43871
bgti_else.43884:
	addi	%v0, %zero, 7
bgti_cont.43885:
	j	bgti_cont.43871
bgti_else.43882:
	addi	%v0, %zero, 6
bgti_cont.43883:
	j	bgti_cont.43871
bgti_else.43880:
	addi	%v0, %zero, 5
bgti_cont.43881:
	j	bgti_cont.43871
bgti_else.43878:
	addi	%v0, %zero, 4
bgti_cont.43879:
	j	bgti_cont.43871
bgti_else.43876:
	addi	%v0, %zero, 3
bgti_cont.43877:
	j	bgti_cont.43871
bgti_else.43874:
	addi	%v0, %zero, 2
bgti_cont.43875:
	j	bgti_cont.43871
bgti_else.43872:
	addi	%v0, %zero, 1
bgti_cont.43873:
	j	bgti_cont.43871
bgti_else.43870:
	addi	%v0, %zero, 0
bgti_cont.43871:
	lw	%v1, 38(%sp)
	sw	%v0, 39(%sp)
	blti	%v1, 10, bgti_else.43894
	blti	%v1, 20, bgti_else.43896
	blti	%v1, 30, bgti_else.43898
	blti	%v1, 40, bgti_else.43900
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43902
	blti	%v1, 20, bgti_else.43904
	blti	%v1, 30, bgti_else.43906
	blti	%v1, 40, bgti_else.43908
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43910
	blti	%v1, 20, bgti_else.43912
	blti	%v1, 30, bgti_else.43914
	blti	%v1, 40, bgti_else.43916
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	print_int_sub2.2644
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	bgti_cont.43895
bgti_else.43916:
	addi	%v0, %v1, -30
bgti_cont.43917:
	j	bgti_cont.43895
bgti_else.43914:
	addi	%v0, %v1, -20
bgti_cont.43915:
	j	bgti_cont.43895
bgti_else.43912:
	addi	%v0, %v1, -10
bgti_cont.43913:
	j	bgti_cont.43895
bgti_else.43910:
	add	%v0, %zero, %v1
bgti_cont.43911:
	j	bgti_cont.43895
bgti_else.43908:
	addi	%v0, %v1, -30
bgti_cont.43909:
	j	bgti_cont.43895
bgti_else.43906:
	addi	%v0, %v1, -20
bgti_cont.43907:
	j	bgti_cont.43895
bgti_else.43904:
	addi	%v0, %v1, -10
bgti_cont.43905:
	j	bgti_cont.43895
bgti_else.43902:
	add	%v0, %zero, %v1
bgti_cont.43903:
	j	bgti_cont.43895
bgti_else.43900:
	addi	%v0, %v1, -30
bgti_cont.43901:
	j	bgti_cont.43895
bgti_else.43898:
	addi	%v0, %v1, -20
bgti_cont.43899:
	j	bgti_cont.43895
bgti_else.43896:
	addi	%v0, %v1, -10
bgti_cont.43897:
	j	bgti_cont.43895
bgti_else.43894:
	add	%v0, %zero, %v1
bgti_cont.43895:
	lw	%v1, 39(%sp)
	blt	%zero, %v1, bgt_else.43918
	addi	%v0, %v0, 48
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_print_char
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	bgt_cont.43919
bgt_else.43918:
	sw	%v0, 40(%sp)
	blti	%v1, 10, bgti_else.43920
	blti	%v1, 20, bgti_else.43922
	blti	%v1, 30, bgti_else.43924
	blti	%v1, 40, bgti_else.43926
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.43928
	blti	%a0, 20, bgti_else.43930
	blti	%a0, 30, bgti_else.43932
	blti	%a0, 40, bgti_else.43934
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.43936
	blti	%a0, 20, bgti_else.43938
	blti	%a0, 30, bgti_else.43940
	blti	%a0, 40, bgti_else.43942
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	print_int_sub1.2641
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	j	bgti_cont.43921
bgti_else.43942:
	addi	%v0, %zero, 11
bgti_cont.43943:
	j	bgti_cont.43921
bgti_else.43940:
	addi	%v0, %zero, 10
bgti_cont.43941:
	j	bgti_cont.43921
bgti_else.43938:
	addi	%v0, %zero, 9
bgti_cont.43939:
	j	bgti_cont.43921
bgti_else.43936:
	addi	%v0, %zero, 8
bgti_cont.43937:
	j	bgti_cont.43921
bgti_else.43934:
	addi	%v0, %zero, 7
bgti_cont.43935:
	j	bgti_cont.43921
bgti_else.43932:
	addi	%v0, %zero, 6
bgti_cont.43933:
	j	bgti_cont.43921
bgti_else.43930:
	addi	%v0, %zero, 5
bgti_cont.43931:
	j	bgti_cont.43921
bgti_else.43928:
	addi	%v0, %zero, 4
bgti_cont.43929:
	j	bgti_cont.43921
bgti_else.43926:
	addi	%v0, %zero, 3
bgti_cont.43927:
	j	bgti_cont.43921
bgti_else.43924:
	addi	%v0, %zero, 2
bgti_cont.43925:
	j	bgti_cont.43921
bgti_else.43922:
	addi	%v0, %zero, 1
bgti_cont.43923:
	j	bgti_cont.43921
bgti_else.43920:
	addi	%v0, %zero, 0
bgti_cont.43921:
	lw	%v1, 39(%sp)
	sw	%v0, 41(%sp)
	blti	%v1, 10, bgti_else.43944
	blti	%v1, 20, bgti_else.43946
	blti	%v1, 30, bgti_else.43948
	blti	%v1, 40, bgti_else.43950
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43952
	blti	%v1, 20, bgti_else.43954
	blti	%v1, 30, bgti_else.43956
	blti	%v1, 40, bgti_else.43958
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43960
	blti	%v1, 20, bgti_else.43962
	blti	%v1, 30, bgti_else.43964
	blti	%v1, 40, bgti_else.43966
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	print_int_sub2.2644
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	bgti_cont.43945
bgti_else.43966:
	addi	%v0, %v1, -30
bgti_cont.43967:
	j	bgti_cont.43945
bgti_else.43964:
	addi	%v0, %v1, -20
bgti_cont.43965:
	j	bgti_cont.43945
bgti_else.43962:
	addi	%v0, %v1, -10
bgti_cont.43963:
	j	bgti_cont.43945
bgti_else.43960:
	add	%v0, %zero, %v1
bgti_cont.43961:
	j	bgti_cont.43945
bgti_else.43958:
	addi	%v0, %v1, -30
bgti_cont.43959:
	j	bgti_cont.43945
bgti_else.43956:
	addi	%v0, %v1, -20
bgti_cont.43957:
	j	bgti_cont.43945
bgti_else.43954:
	addi	%v0, %v1, -10
bgti_cont.43955:
	j	bgti_cont.43945
bgti_else.43952:
	add	%v0, %zero, %v1
bgti_cont.43953:
	j	bgti_cont.43945
bgti_else.43950:
	addi	%v0, %v1, -30
bgti_cont.43951:
	j	bgti_cont.43945
bgti_else.43948:
	addi	%v0, %v1, -20
bgti_cont.43949:
	j	bgti_cont.43945
bgti_else.43946:
	addi	%v0, %v1, -10
bgti_cont.43947:
	j	bgti_cont.43945
bgti_else.43944:
	add	%v0, %zero, %v1
bgti_cont.43945:
	lw	%v1, 41(%sp)
	blt	%zero, %v1, bgt_else.43968
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
	j	bgt_cont.43969
bgt_else.43968:
	sw	%v0, 42(%sp)
	blti	%v1, 10, bgti_else.43970
	blti	%v1, 20, bgti_else.43972
	blti	%v1, 30, bgti_else.43974
	blti	%v1, 40, bgti_else.43976
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43978
	blti	%v1, 20, bgti_else.43980
	blti	%v1, 30, bgti_else.43982
	blti	%v1, 40, bgti_else.43984
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.43986
	blti	%v1, 20, bgti_else.43988
	blti	%v1, 30, bgti_else.43990
	blti	%v1, 40, bgti_else.43992
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	print_int_sub2.2644
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	j	bgti_cont.43971
bgti_else.43992:
	addi	%v0, %v1, -30
bgti_cont.43993:
	j	bgti_cont.43971
bgti_else.43990:
	addi	%v0, %v1, -20
bgti_cont.43991:
	j	bgti_cont.43971
bgti_else.43988:
	addi	%v0, %v1, -10
bgti_cont.43989:
	j	bgti_cont.43971
bgti_else.43986:
	add	%v0, %zero, %v1
bgti_cont.43987:
	j	bgti_cont.43971
bgti_else.43984:
	addi	%v0, %v1, -30
bgti_cont.43985:
	j	bgti_cont.43971
bgti_else.43982:
	addi	%v0, %v1, -20
bgti_cont.43983:
	j	bgti_cont.43971
bgti_else.43980:
	addi	%v0, %v1, -10
bgti_cont.43981:
	j	bgti_cont.43971
bgti_else.43978:
	add	%v0, %zero, %v1
bgti_cont.43979:
	j	bgti_cont.43971
bgti_else.43976:
	addi	%v0, %v1, -30
bgti_cont.43977:
	j	bgti_cont.43971
bgti_else.43974:
	addi	%v0, %v1, -20
bgti_cont.43975:
	j	bgti_cont.43971
bgti_else.43972:
	addi	%v0, %v1, -10
bgti_cont.43973:
	j	bgti_cont.43971
bgti_else.43970:
	add	%v0, %zero, %v1
bgti_cont.43971:
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
bgt_cont.43969:
bgt_cont.43919:
	lw	%v0, 21(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_print_char
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.43994
	blti	%v0, 0, bgti_else.43996
	j	bgt_cont.43995
bgti_else.43996:
	addi	%v0, %zero, 0
bgti_cont.43997:
	j	bgt_cont.43995
bgt_else.43994:
	addi	%v0, %zero, 255
bgt_cont.43995:
	sw	%v0, 43(%sp)
	blti	%v0, 10, bgti_else.43998
	blti	%v0, 20, bgti_else.44000
	blti	%v0, 30, bgti_else.44002
	blti	%v0, 40, bgti_else.44004
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.44006
	blti	%v1, 20, bgti_else.44008
	blti	%v1, 30, bgti_else.44010
	blti	%v1, 40, bgti_else.44012
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.44014
	blti	%v1, 20, bgti_else.44016
	blti	%v1, 30, bgti_else.44018
	blti	%v1, 40, bgti_else.44020
	addi	%v1, %v1, -40
	addi	%a0, %zero, 12
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	print_int_sub1.2641
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	j	bgti_cont.43999
bgti_else.44020:
	addi	%v0, %zero, 11
bgti_cont.44021:
	j	bgti_cont.43999
bgti_else.44018:
	addi	%v0, %zero, 10
bgti_cont.44019:
	j	bgti_cont.43999
bgti_else.44016:
	addi	%v0, %zero, 9
bgti_cont.44017:
	j	bgti_cont.43999
bgti_else.44014:
	addi	%v0, %zero, 8
bgti_cont.44015:
	j	bgti_cont.43999
bgti_else.44012:
	addi	%v0, %zero, 7
bgti_cont.44013:
	j	bgti_cont.43999
bgti_else.44010:
	addi	%v0, %zero, 6
bgti_cont.44011:
	j	bgti_cont.43999
bgti_else.44008:
	addi	%v0, %zero, 5
bgti_cont.44009:
	j	bgti_cont.43999
bgti_else.44006:
	addi	%v0, %zero, 4
bgti_cont.44007:
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
	lw	%v1, 43(%sp)
	sw	%v0, 44(%sp)
	blti	%v1, 10, bgti_else.44022
	blti	%v1, 20, bgti_else.44024
	blti	%v1, 30, bgti_else.44026
	blti	%v1, 40, bgti_else.44028
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.44030
	blti	%v1, 20, bgti_else.44032
	blti	%v1, 30, bgti_else.44034
	blti	%v1, 40, bgti_else.44036
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.44038
	blti	%v1, 20, bgti_else.44040
	blti	%v1, 30, bgti_else.44042
	blti	%v1, 40, bgti_else.44044
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	print_int_sub2.2644
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	j	bgti_cont.44023
bgti_else.44044:
	addi	%v0, %v1, -30
bgti_cont.44045:
	j	bgti_cont.44023
bgti_else.44042:
	addi	%v0, %v1, -20
bgti_cont.44043:
	j	bgti_cont.44023
bgti_else.44040:
	addi	%v0, %v1, -10
bgti_cont.44041:
	j	bgti_cont.44023
bgti_else.44038:
	add	%v0, %zero, %v1
bgti_cont.44039:
	j	bgti_cont.44023
bgti_else.44036:
	addi	%v0, %v1, -30
bgti_cont.44037:
	j	bgti_cont.44023
bgti_else.44034:
	addi	%v0, %v1, -20
bgti_cont.44035:
	j	bgti_cont.44023
bgti_else.44032:
	addi	%v0, %v1, -10
bgti_cont.44033:
	j	bgti_cont.44023
bgti_else.44030:
	add	%v0, %zero, %v1
bgti_cont.44031:
	j	bgti_cont.44023
bgti_else.44028:
	addi	%v0, %v1, -30
bgti_cont.44029:
	j	bgti_cont.44023
bgti_else.44026:
	addi	%v0, %v1, -20
bgti_cont.44027:
	j	bgti_cont.44023
bgti_else.44024:
	addi	%v0, %v1, -10
bgti_cont.44025:
	j	bgti_cont.44023
bgti_else.44022:
	add	%v0, %zero, %v1
bgti_cont.44023:
	lw	%v1, 44(%sp)
	blt	%zero, %v1, bgt_else.44046
	addi	%v0, %v0, 48
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_print_char
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	j	bgt_cont.44047
bgt_else.44046:
	sw	%v0, 45(%sp)
	blti	%v1, 10, bgti_else.44048
	blti	%v1, 20, bgti_else.44050
	blti	%v1, 30, bgti_else.44052
	blti	%v1, 40, bgti_else.44054
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.44056
	blti	%a0, 20, bgti_else.44058
	blti	%a0, 30, bgti_else.44060
	blti	%a0, 40, bgti_else.44062
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.44064
	blti	%a0, 20, bgti_else.44066
	blti	%a0, 30, bgti_else.44068
	blti	%a0, 40, bgti_else.44070
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	print_int_sub1.2641
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	bgti_cont.44049
bgti_else.44070:
	addi	%v0, %zero, 11
bgti_cont.44071:
	j	bgti_cont.44049
bgti_else.44068:
	addi	%v0, %zero, 10
bgti_cont.44069:
	j	bgti_cont.44049
bgti_else.44066:
	addi	%v0, %zero, 9
bgti_cont.44067:
	j	bgti_cont.44049
bgti_else.44064:
	addi	%v0, %zero, 8
bgti_cont.44065:
	j	bgti_cont.44049
bgti_else.44062:
	addi	%v0, %zero, 7
bgti_cont.44063:
	j	bgti_cont.44049
bgti_else.44060:
	addi	%v0, %zero, 6
bgti_cont.44061:
	j	bgti_cont.44049
bgti_else.44058:
	addi	%v0, %zero, 5
bgti_cont.44059:
	j	bgti_cont.44049
bgti_else.44056:
	addi	%v0, %zero, 4
bgti_cont.44057:
	j	bgti_cont.44049
bgti_else.44054:
	addi	%v0, %zero, 3
bgti_cont.44055:
	j	bgti_cont.44049
bgti_else.44052:
	addi	%v0, %zero, 2
bgti_cont.44053:
	j	bgti_cont.44049
bgti_else.44050:
	addi	%v0, %zero, 1
bgti_cont.44051:
	j	bgti_cont.44049
bgti_else.44048:
	addi	%v0, %zero, 0
bgti_cont.44049:
	lw	%v1, 44(%sp)
	sw	%v0, 46(%sp)
	blti	%v1, 10, bgti_else.44072
	blti	%v1, 20, bgti_else.44074
	blti	%v1, 30, bgti_else.44076
	blti	%v1, 40, bgti_else.44078
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.44080
	blti	%v1, 20, bgti_else.44082
	blti	%v1, 30, bgti_else.44084
	blti	%v1, 40, bgti_else.44086
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.44088
	blti	%v1, 20, bgti_else.44090
	blti	%v1, 30, bgti_else.44092
	blti	%v1, 40, bgti_else.44094
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	print_int_sub2.2644
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	j	bgti_cont.44073
bgti_else.44094:
	addi	%v0, %v1, -30
bgti_cont.44095:
	j	bgti_cont.44073
bgti_else.44092:
	addi	%v0, %v1, -20
bgti_cont.44093:
	j	bgti_cont.44073
bgti_else.44090:
	addi	%v0, %v1, -10
bgti_cont.44091:
	j	bgti_cont.44073
bgti_else.44088:
	add	%v0, %zero, %v1
bgti_cont.44089:
	j	bgti_cont.44073
bgti_else.44086:
	addi	%v0, %v1, -30
bgti_cont.44087:
	j	bgti_cont.44073
bgti_else.44084:
	addi	%v0, %v1, -20
bgti_cont.44085:
	j	bgti_cont.44073
bgti_else.44082:
	addi	%v0, %v1, -10
bgti_cont.44083:
	j	bgti_cont.44073
bgti_else.44080:
	add	%v0, %zero, %v1
bgti_cont.44081:
	j	bgti_cont.44073
bgti_else.44078:
	addi	%v0, %v1, -30
bgti_cont.44079:
	j	bgti_cont.44073
bgti_else.44076:
	addi	%v0, %v1, -20
bgti_cont.44077:
	j	bgti_cont.44073
bgti_else.44074:
	addi	%v0, %v1, -10
bgti_cont.44075:
	j	bgti_cont.44073
bgti_else.44072:
	add	%v0, %zero, %v1
bgti_cont.44073:
	lw	%v1, 46(%sp)
	blt	%zero, %v1, bgt_else.44096
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
	j	bgt_cont.44097
bgt_else.44096:
	sw	%v0, 47(%sp)
	blti	%v1, 10, bgti_else.44098
	blti	%v1, 20, bgti_else.44100
	blti	%v1, 30, bgti_else.44102
	blti	%v1, 40, bgti_else.44104
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.44106
	blti	%v1, 20, bgti_else.44108
	blti	%v1, 30, bgti_else.44110
	blti	%v1, 40, bgti_else.44112
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.44114
	blti	%v1, 20, bgti_else.44116
	blti	%v1, 30, bgti_else.44118
	blti	%v1, 40, bgti_else.44120
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	print_int_sub2.2644
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	bgti_cont.44099
bgti_else.44120:
	addi	%v0, %v1, -30
bgti_cont.44121:
	j	bgti_cont.44099
bgti_else.44118:
	addi	%v0, %v1, -20
bgti_cont.44119:
	j	bgti_cont.44099
bgti_else.44116:
	addi	%v0, %v1, -10
bgti_cont.44117:
	j	bgti_cont.44099
bgti_else.44114:
	add	%v0, %zero, %v1
bgti_cont.44115:
	j	bgti_cont.44099
bgti_else.44112:
	addi	%v0, %v1, -30
bgti_cont.44113:
	j	bgti_cont.44099
bgti_else.44110:
	addi	%v0, %v1, -20
bgti_cont.44111:
	j	bgti_cont.44099
bgti_else.44108:
	addi	%v0, %v1, -10
bgti_cont.44109:
	j	bgti_cont.44099
bgti_else.44106:
	add	%v0, %zero, %v1
bgti_cont.44107:
	j	bgti_cont.44099
bgti_else.44104:
	addi	%v0, %v1, -30
bgti_cont.44105:
	j	bgti_cont.44099
bgti_else.44102:
	addi	%v0, %v1, -20
bgti_cont.44103:
	j	bgti_cont.44099
bgti_else.44100:
	addi	%v0, %v1, -10
bgti_cont.44101:
	j	bgti_cont.44099
bgti_else.44098:
	add	%v0, %zero, %v1
bgti_cont.44099:
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
bgt_cont.44097:
bgt_cont.44047:
	lw	%v0, 16(%sp)
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_print_char
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	lw	%v0, 32(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%a1, 5(%sp)
	lw	%a2, 0(%sp)
	j	scan_pixel.3057
scan_line.3063:
	addi	%a3, %zero, 1
	lw	%t0, 155(%zero)
	blt	%v0, %t0, bgt_else.45550
	jr	%ra
bgt_else.45550:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.45552
	j	bgt_cont.45553
bgt_else.45552:
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
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
bgt_cont.45553:
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	blt	%zero, %v0, bgt_else.45554
	j	bgt_cont.45555
bgt_else.45554:
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
	blt	%a3, %t0, bgt_else.45556
	addi	%a3, %zero, 0
	j	bgt_cont.45557
bgt_else.45556:
	blt	%zero, %a2, bgt_else.45558
	addi	%a3, %zero, 0
	j	bgt_cont.45559
bgt_else.45558:
	blt	%k1, %v0, bgt_else.45560
	addi	%a3, %zero, 0
	j	bgt_cont.45561
bgt_else.45560:
	addi	%a3, %zero, 0
bgt_cont.45561:
	blt	%at, %v0, bgt_else.45562
	addi	%a3, %zero, 0
	j	bgt_cont.45563
bgt_else.45562:
	addi	%a3, %zero, 0
bgt_cont.45563:
bgt_cont.45559:
bgt_cont.45557:
	beqi	%a3, 0, bnei_else.45564
	lw	%a0, 4(%sp)
	lw	%a3, 3(%sp)
	addi	%v0, %v1, 0
	addi	%k0, %a3, 0
	addi	%a3, %v1, 0
	addi	%v1, %a2, 0
	addi	%a2, %k0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.45565
bnei_else.45564:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.45565:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.45566
	blti	%v0, 0, bgti_else.45568
	j	bgt_cont.45567
bgti_else.45568:
	addi	%v0, %zero, 0
bgti_cont.45569:
	j	bgt_cont.45567
bgt_else.45566:
	addi	%v0, %zero, 255
bgt_cont.45567:
	addi	%v1, %zero, 10
	sw	%v1, 10(%sp)
	sw	%v0, 11(%sp)
	blti	%v0, 10, bgti_else.45570
	blti	%v0, 20, bgti_else.45572
	blti	%v0, 30, bgti_else.45574
	blti	%v0, 40, bgti_else.45576
	addi	%a0, %v0, -40
	blti	%a0, 10, bgti_else.45578
	blti	%a0, 20, bgti_else.45580
	blti	%a0, 30, bgti_else.45582
	blti	%a0, 40, bgti_else.45584
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45586
	blti	%a0, 20, bgti_else.45588
	blti	%a0, 30, bgti_else.45590
	blti	%a0, 40, bgti_else.45592
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	print_int_sub1.2641
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.45571
bgti_else.45592:
	addi	%v0, %zero, 11
bgti_cont.45593:
	j	bgti_cont.45571
bgti_else.45590:
	addi	%v0, %zero, 10
bgti_cont.45591:
	j	bgti_cont.45571
bgti_else.45588:
	addi	%v0, %zero, 9
bgti_cont.45589:
	j	bgti_cont.45571
bgti_else.45586:
	addi	%v0, %zero, 8
bgti_cont.45587:
	j	bgti_cont.45571
bgti_else.45584:
	addi	%v0, %zero, 7
bgti_cont.45585:
	j	bgti_cont.45571
bgti_else.45582:
	addi	%v0, %zero, 6
bgti_cont.45583:
	j	bgti_cont.45571
bgti_else.45580:
	addi	%v0, %zero, 5
bgti_cont.45581:
	j	bgti_cont.45571
bgti_else.45578:
	addi	%v0, %zero, 4
bgti_cont.45579:
	j	bgti_cont.45571
bgti_else.45576:
	addi	%v0, %zero, 3
bgti_cont.45577:
	j	bgti_cont.45571
bgti_else.45574:
	addi	%v0, %zero, 2
bgti_cont.45575:
	j	bgti_cont.45571
bgti_else.45572:
	addi	%v0, %zero, 1
bgti_cont.45573:
	j	bgti_cont.45571
bgti_else.45570:
	addi	%v0, %zero, 0
bgti_cont.45571:
	lw	%v1, 11(%sp)
	sw	%v0, 12(%sp)
	blti	%v1, 10, bgti_else.45594
	blti	%v1, 20, bgti_else.45596
	blti	%v1, 30, bgti_else.45598
	blti	%v1, 40, bgti_else.45600
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45602
	blti	%v1, 20, bgti_else.45604
	blti	%v1, 30, bgti_else.45606
	blti	%v1, 40, bgti_else.45608
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45610
	blti	%v1, 20, bgti_else.45612
	blti	%v1, 30, bgti_else.45614
	blti	%v1, 40, bgti_else.45616
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	print_int_sub2.2644
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.45595
bgti_else.45616:
	addi	%v0, %v1, -30
bgti_cont.45617:
	j	bgti_cont.45595
bgti_else.45614:
	addi	%v0, %v1, -20
bgti_cont.45615:
	j	bgti_cont.45595
bgti_else.45612:
	addi	%v0, %v1, -10
bgti_cont.45613:
	j	bgti_cont.45595
bgti_else.45610:
	add	%v0, %zero, %v1
bgti_cont.45611:
	j	bgti_cont.45595
bgti_else.45608:
	addi	%v0, %v1, -30
bgti_cont.45609:
	j	bgti_cont.45595
bgti_else.45606:
	addi	%v0, %v1, -20
bgti_cont.45607:
	j	bgti_cont.45595
bgti_else.45604:
	addi	%v0, %v1, -10
bgti_cont.45605:
	j	bgti_cont.45595
bgti_else.45602:
	add	%v0, %zero, %v1
bgti_cont.45603:
	j	bgti_cont.45595
bgti_else.45600:
	addi	%v0, %v1, -30
bgti_cont.45601:
	j	bgti_cont.45595
bgti_else.45598:
	addi	%v0, %v1, -20
bgti_cont.45599:
	j	bgti_cont.45595
bgti_else.45596:
	addi	%v0, %v1, -10
bgti_cont.45597:
	j	bgti_cont.45595
bgti_else.45594:
	add	%v0, %zero, %v1
bgti_cont.45595:
	lw	%v1, 12(%sp)
	blt	%zero, %v1, bgt_else.45618
	addi	%v0, %v0, 48
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgt_cont.45619
bgt_else.45618:
	sw	%v0, 13(%sp)
	blti	%v1, 10, bgti_else.45620
	blti	%v1, 20, bgti_else.45622
	blti	%v1, 30, bgti_else.45624
	blti	%v1, 40, bgti_else.45626
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.45628
	blti	%a0, 20, bgti_else.45630
	blti	%a0, 30, bgti_else.45632
	blti	%a0, 40, bgti_else.45634
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45636
	blti	%a0, 20, bgti_else.45638
	blti	%a0, 30, bgti_else.45640
	blti	%a0, 40, bgti_else.45642
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	print_int_sub1.2641
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.45621
bgti_else.45642:
	addi	%v0, %zero, 11
bgti_cont.45643:
	j	bgti_cont.45621
bgti_else.45640:
	addi	%v0, %zero, 10
bgti_cont.45641:
	j	bgti_cont.45621
bgti_else.45638:
	addi	%v0, %zero, 9
bgti_cont.45639:
	j	bgti_cont.45621
bgti_else.45636:
	addi	%v0, %zero, 8
bgti_cont.45637:
	j	bgti_cont.45621
bgti_else.45634:
	addi	%v0, %zero, 7
bgti_cont.45635:
	j	bgti_cont.45621
bgti_else.45632:
	addi	%v0, %zero, 6
bgti_cont.45633:
	j	bgti_cont.45621
bgti_else.45630:
	addi	%v0, %zero, 5
bgti_cont.45631:
	j	bgti_cont.45621
bgti_else.45628:
	addi	%v0, %zero, 4
bgti_cont.45629:
	j	bgti_cont.45621
bgti_else.45626:
	addi	%v0, %zero, 3
bgti_cont.45627:
	j	bgti_cont.45621
bgti_else.45624:
	addi	%v0, %zero, 2
bgti_cont.45625:
	j	bgti_cont.45621
bgti_else.45622:
	addi	%v0, %zero, 1
bgti_cont.45623:
	j	bgti_cont.45621
bgti_else.45620:
	addi	%v0, %zero, 0
bgti_cont.45621:
	lw	%v1, 12(%sp)
	sw	%v0, 14(%sp)
	blti	%v1, 10, bgti_else.45644
	blti	%v1, 20, bgti_else.45646
	blti	%v1, 30, bgti_else.45648
	blti	%v1, 40, bgti_else.45650
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45652
	blti	%v1, 20, bgti_else.45654
	blti	%v1, 30, bgti_else.45656
	blti	%v1, 40, bgti_else.45658
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45660
	blti	%v1, 20, bgti_else.45662
	blti	%v1, 30, bgti_else.45664
	blti	%v1, 40, bgti_else.45666
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub2.2644
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.45645
bgti_else.45666:
	addi	%v0, %v1, -30
bgti_cont.45667:
	j	bgti_cont.45645
bgti_else.45664:
	addi	%v0, %v1, -20
bgti_cont.45665:
	j	bgti_cont.45645
bgti_else.45662:
	addi	%v0, %v1, -10
bgti_cont.45663:
	j	bgti_cont.45645
bgti_else.45660:
	add	%v0, %zero, %v1
bgti_cont.45661:
	j	bgti_cont.45645
bgti_else.45658:
	addi	%v0, %v1, -30
bgti_cont.45659:
	j	bgti_cont.45645
bgti_else.45656:
	addi	%v0, %v1, -20
bgti_cont.45657:
	j	bgti_cont.45645
bgti_else.45654:
	addi	%v0, %v1, -10
bgti_cont.45655:
	j	bgti_cont.45645
bgti_else.45652:
	add	%v0, %zero, %v1
bgti_cont.45653:
	j	bgti_cont.45645
bgti_else.45650:
	addi	%v0, %v1, -30
bgti_cont.45651:
	j	bgti_cont.45645
bgti_else.45648:
	addi	%v0, %v1, -20
bgti_cont.45649:
	j	bgti_cont.45645
bgti_else.45646:
	addi	%v0, %v1, -10
bgti_cont.45647:
	j	bgti_cont.45645
bgti_else.45644:
	add	%v0, %zero, %v1
bgti_cont.45645:
	lw	%v1, 14(%sp)
	blt	%zero, %v1, bgt_else.45668
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
	j	bgt_cont.45669
bgt_else.45668:
	sw	%v0, 15(%sp)
	blti	%v1, 10, bgti_else.45670
	blti	%v1, 20, bgti_else.45672
	blti	%v1, 30, bgti_else.45674
	blti	%v1, 40, bgti_else.45676
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45678
	blti	%v1, 20, bgti_else.45680
	blti	%v1, 30, bgti_else.45682
	blti	%v1, 40, bgti_else.45684
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45686
	blti	%v1, 20, bgti_else.45688
	blti	%v1, 30, bgti_else.45690
	blti	%v1, 40, bgti_else.45692
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	print_int_sub2.2644
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgti_cont.45671
bgti_else.45692:
	addi	%v0, %v1, -30
bgti_cont.45693:
	j	bgti_cont.45671
bgti_else.45690:
	addi	%v0, %v1, -20
bgti_cont.45691:
	j	bgti_cont.45671
bgti_else.45688:
	addi	%v0, %v1, -10
bgti_cont.45689:
	j	bgti_cont.45671
bgti_else.45686:
	add	%v0, %zero, %v1
bgti_cont.45687:
	j	bgti_cont.45671
bgti_else.45684:
	addi	%v0, %v1, -30
bgti_cont.45685:
	j	bgti_cont.45671
bgti_else.45682:
	addi	%v0, %v1, -20
bgti_cont.45683:
	j	bgti_cont.45671
bgti_else.45680:
	addi	%v0, %v1, -10
bgti_cont.45681:
	j	bgti_cont.45671
bgti_else.45678:
	add	%v0, %zero, %v1
bgti_cont.45679:
	j	bgti_cont.45671
bgti_else.45676:
	addi	%v0, %v1, -30
bgti_cont.45677:
	j	bgti_cont.45671
bgti_else.45674:
	addi	%v0, %v1, -20
bgti_cont.45675:
	j	bgti_cont.45671
bgti_else.45672:
	addi	%v0, %v1, -10
bgti_cont.45673:
	j	bgti_cont.45671
bgti_else.45670:
	add	%v0, %zero, %v1
bgti_cont.45671:
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
bgt_cont.45669:
bgt_cont.45619:
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
	blt	%at, %v0, bgt_else.45694
	blti	%v0, 0, bgti_else.45696
	j	bgt_cont.45695
bgti_else.45696:
	addi	%v0, %zero, 0
bgti_cont.45697:
	j	bgt_cont.45695
bgt_else.45694:
	addi	%v0, %zero, 255
bgt_cont.45695:
	sw	%v0, 17(%sp)
	blti	%v0, 10, bgti_else.45698
	blti	%v0, 20, bgti_else.45700
	blti	%v0, 30, bgti_else.45702
	blti	%v0, 40, bgti_else.45704
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.45706
	blti	%v1, 20, bgti_else.45708
	blti	%v1, 30, bgti_else.45710
	blti	%v1, 40, bgti_else.45712
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45714
	blti	%v1, 20, bgti_else.45716
	blti	%v1, 30, bgti_else.45718
	blti	%v1, 40, bgti_else.45720
	addi	%v1, %v1, -40
	addi	%a0, %zero, 12
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	print_int_sub1.2641
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.45699
bgti_else.45720:
	addi	%v0, %zero, 11
bgti_cont.45721:
	j	bgti_cont.45699
bgti_else.45718:
	addi	%v0, %zero, 10
bgti_cont.45719:
	j	bgti_cont.45699
bgti_else.45716:
	addi	%v0, %zero, 9
bgti_cont.45717:
	j	bgti_cont.45699
bgti_else.45714:
	addi	%v0, %zero, 8
bgti_cont.45715:
	j	bgti_cont.45699
bgti_else.45712:
	addi	%v0, %zero, 7
bgti_cont.45713:
	j	bgti_cont.45699
bgti_else.45710:
	addi	%v0, %zero, 6
bgti_cont.45711:
	j	bgti_cont.45699
bgti_else.45708:
	addi	%v0, %zero, 5
bgti_cont.45709:
	j	bgti_cont.45699
bgti_else.45706:
	addi	%v0, %zero, 4
bgti_cont.45707:
	j	bgti_cont.45699
bgti_else.45704:
	addi	%v0, %zero, 3
bgti_cont.45705:
	j	bgti_cont.45699
bgti_else.45702:
	addi	%v0, %zero, 2
bgti_cont.45703:
	j	bgti_cont.45699
bgti_else.45700:
	addi	%v0, %zero, 1
bgti_cont.45701:
	j	bgti_cont.45699
bgti_else.45698:
	addi	%v0, %zero, 0
bgti_cont.45699:
	lw	%v1, 17(%sp)
	sw	%v0, 18(%sp)
	blti	%v1, 10, bgti_else.45722
	blti	%v1, 20, bgti_else.45724
	blti	%v1, 30, bgti_else.45726
	blti	%v1, 40, bgti_else.45728
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45730
	blti	%v1, 20, bgti_else.45732
	blti	%v1, 30, bgti_else.45734
	blti	%v1, 40, bgti_else.45736
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45738
	blti	%v1, 20, bgti_else.45740
	blti	%v1, 30, bgti_else.45742
	blti	%v1, 40, bgti_else.45744
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub2.2644
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgti_cont.45723
bgti_else.45744:
	addi	%v0, %v1, -30
bgti_cont.45745:
	j	bgti_cont.45723
bgti_else.45742:
	addi	%v0, %v1, -20
bgti_cont.45743:
	j	bgti_cont.45723
bgti_else.45740:
	addi	%v0, %v1, -10
bgti_cont.45741:
	j	bgti_cont.45723
bgti_else.45738:
	add	%v0, %zero, %v1
bgti_cont.45739:
	j	bgti_cont.45723
bgti_else.45736:
	addi	%v0, %v1, -30
bgti_cont.45737:
	j	bgti_cont.45723
bgti_else.45734:
	addi	%v0, %v1, -20
bgti_cont.45735:
	j	bgti_cont.45723
bgti_else.45732:
	addi	%v0, %v1, -10
bgti_cont.45733:
	j	bgti_cont.45723
bgti_else.45730:
	add	%v0, %zero, %v1
bgti_cont.45731:
	j	bgti_cont.45723
bgti_else.45728:
	addi	%v0, %v1, -30
bgti_cont.45729:
	j	bgti_cont.45723
bgti_else.45726:
	addi	%v0, %v1, -20
bgti_cont.45727:
	j	bgti_cont.45723
bgti_else.45724:
	addi	%v0, %v1, -10
bgti_cont.45725:
	j	bgti_cont.45723
bgti_else.45722:
	add	%v0, %zero, %v1
bgti_cont.45723:
	lw	%v1, 18(%sp)
	blt	%zero, %v1, bgt_else.45746
	addi	%v0, %v0, 48
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_print_char
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgt_cont.45747
bgt_else.45746:
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.45748
	blti	%v1, 20, bgti_else.45750
	blti	%v1, 30, bgti_else.45752
	blti	%v1, 40, bgti_else.45754
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.45756
	blti	%a0, 20, bgti_else.45758
	blti	%a0, 30, bgti_else.45760
	blti	%a0, 40, bgti_else.45762
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45764
	blti	%a0, 20, bgti_else.45766
	blti	%a0, 30, bgti_else.45768
	blti	%a0, 40, bgti_else.45770
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub1.2641
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.45749
bgti_else.45770:
	addi	%v0, %zero, 11
bgti_cont.45771:
	j	bgti_cont.45749
bgti_else.45768:
	addi	%v0, %zero, 10
bgti_cont.45769:
	j	bgti_cont.45749
bgti_else.45766:
	addi	%v0, %zero, 9
bgti_cont.45767:
	j	bgti_cont.45749
bgti_else.45764:
	addi	%v0, %zero, 8
bgti_cont.45765:
	j	bgti_cont.45749
bgti_else.45762:
	addi	%v0, %zero, 7
bgti_cont.45763:
	j	bgti_cont.45749
bgti_else.45760:
	addi	%v0, %zero, 6
bgti_cont.45761:
	j	bgti_cont.45749
bgti_else.45758:
	addi	%v0, %zero, 5
bgti_cont.45759:
	j	bgti_cont.45749
bgti_else.45756:
	addi	%v0, %zero, 4
bgti_cont.45757:
	j	bgti_cont.45749
bgti_else.45754:
	addi	%v0, %zero, 3
bgti_cont.45755:
	j	bgti_cont.45749
bgti_else.45752:
	addi	%v0, %zero, 2
bgti_cont.45753:
	j	bgti_cont.45749
bgti_else.45750:
	addi	%v0, %zero, 1
bgti_cont.45751:
	j	bgti_cont.45749
bgti_else.45748:
	addi	%v0, %zero, 0
bgti_cont.45749:
	lw	%v1, 18(%sp)
	sw	%v0, 20(%sp)
	blti	%v1, 10, bgti_else.45772
	blti	%v1, 20, bgti_else.45774
	blti	%v1, 30, bgti_else.45776
	blti	%v1, 40, bgti_else.45778
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45780
	blti	%v1, 20, bgti_else.45782
	blti	%v1, 30, bgti_else.45784
	blti	%v1, 40, bgti_else.45786
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45788
	blti	%v1, 20, bgti_else.45790
	blti	%v1, 30, bgti_else.45792
	blti	%v1, 40, bgti_else.45794
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	print_int_sub2.2644
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bgti_cont.45773
bgti_else.45794:
	addi	%v0, %v1, -30
bgti_cont.45795:
	j	bgti_cont.45773
bgti_else.45792:
	addi	%v0, %v1, -20
bgti_cont.45793:
	j	bgti_cont.45773
bgti_else.45790:
	addi	%v0, %v1, -10
bgti_cont.45791:
	j	bgti_cont.45773
bgti_else.45788:
	add	%v0, %zero, %v1
bgti_cont.45789:
	j	bgti_cont.45773
bgti_else.45786:
	addi	%v0, %v1, -30
bgti_cont.45787:
	j	bgti_cont.45773
bgti_else.45784:
	addi	%v0, %v1, -20
bgti_cont.45785:
	j	bgti_cont.45773
bgti_else.45782:
	addi	%v0, %v1, -10
bgti_cont.45783:
	j	bgti_cont.45773
bgti_else.45780:
	add	%v0, %zero, %v1
bgti_cont.45781:
	j	bgti_cont.45773
bgti_else.45778:
	addi	%v0, %v1, -30
bgti_cont.45779:
	j	bgti_cont.45773
bgti_else.45776:
	addi	%v0, %v1, -20
bgti_cont.45777:
	j	bgti_cont.45773
bgti_else.45774:
	addi	%v0, %v1, -10
bgti_cont.45775:
	j	bgti_cont.45773
bgti_else.45772:
	add	%v0, %zero, %v1
bgti_cont.45773:
	lw	%v1, 20(%sp)
	blt	%zero, %v1, bgt_else.45796
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
	j	bgt_cont.45797
bgt_else.45796:
	sw	%v0, 21(%sp)
	blti	%v1, 10, bgti_else.45798
	blti	%v1, 20, bgti_else.45800
	blti	%v1, 30, bgti_else.45802
	blti	%v1, 40, bgti_else.45804
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45806
	blti	%v1, 20, bgti_else.45808
	blti	%v1, 30, bgti_else.45810
	blti	%v1, 40, bgti_else.45812
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45814
	blti	%v1, 20, bgti_else.45816
	blti	%v1, 30, bgti_else.45818
	blti	%v1, 40, bgti_else.45820
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	print_int_sub2.2644
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.45799
bgti_else.45820:
	addi	%v0, %v1, -30
bgti_cont.45821:
	j	bgti_cont.45799
bgti_else.45818:
	addi	%v0, %v1, -20
bgti_cont.45819:
	j	bgti_cont.45799
bgti_else.45816:
	addi	%v0, %v1, -10
bgti_cont.45817:
	j	bgti_cont.45799
bgti_else.45814:
	add	%v0, %zero, %v1
bgti_cont.45815:
	j	bgti_cont.45799
bgti_else.45812:
	addi	%v0, %v1, -30
bgti_cont.45813:
	j	bgti_cont.45799
bgti_else.45810:
	addi	%v0, %v1, -20
bgti_cont.45811:
	j	bgti_cont.45799
bgti_else.45808:
	addi	%v0, %v1, -10
bgti_cont.45809:
	j	bgti_cont.45799
bgti_else.45806:
	add	%v0, %zero, %v1
bgti_cont.45807:
	j	bgti_cont.45799
bgti_else.45804:
	addi	%v0, %v1, -30
bgti_cont.45805:
	j	bgti_cont.45799
bgti_else.45802:
	addi	%v0, %v1, -20
bgti_cont.45803:
	j	bgti_cont.45799
bgti_else.45800:
	addi	%v0, %v1, -10
bgti_cont.45801:
	j	bgti_cont.45799
bgti_else.45798:
	add	%v0, %zero, %v1
bgti_cont.45799:
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
bgt_cont.45797:
bgt_cont.45747:
	lw	%v0, 16(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.45822
	blti	%v0, 0, bgti_else.45824
	j	bgt_cont.45823
bgti_else.45824:
	addi	%v0, %zero, 0
bgti_cont.45825:
	j	bgt_cont.45823
bgt_else.45822:
	addi	%v0, %zero, 255
bgt_cont.45823:
	sw	%v0, 22(%sp)
	blti	%v0, 10, bgti_else.45826
	blti	%v0, 20, bgti_else.45828
	blti	%v0, 30, bgti_else.45830
	blti	%v0, 40, bgti_else.45832
	addi	%v1, %v0, -40
	blti	%v1, 10, bgti_else.45834
	blti	%v1, 20, bgti_else.45836
	blti	%v1, 30, bgti_else.45838
	blti	%v1, 40, bgti_else.45840
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45842
	blti	%v1, 20, bgti_else.45844
	blti	%v1, 30, bgti_else.45846
	blti	%v1, 40, bgti_else.45848
	addi	%v1, %v1, -40
	addi	%a0, %zero, 12
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub1.2641
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.45827
bgti_else.45848:
	addi	%v0, %zero, 11
bgti_cont.45849:
	j	bgti_cont.45827
bgti_else.45846:
	addi	%v0, %zero, 10
bgti_cont.45847:
	j	bgti_cont.45827
bgti_else.45844:
	addi	%v0, %zero, 9
bgti_cont.45845:
	j	bgti_cont.45827
bgti_else.45842:
	addi	%v0, %zero, 8
bgti_cont.45843:
	j	bgti_cont.45827
bgti_else.45840:
	addi	%v0, %zero, 7
bgti_cont.45841:
	j	bgti_cont.45827
bgti_else.45838:
	addi	%v0, %zero, 6
bgti_cont.45839:
	j	bgti_cont.45827
bgti_else.45836:
	addi	%v0, %zero, 5
bgti_cont.45837:
	j	bgti_cont.45827
bgti_else.45834:
	addi	%v0, %zero, 4
bgti_cont.45835:
	j	bgti_cont.45827
bgti_else.45832:
	addi	%v0, %zero, 3
bgti_cont.45833:
	j	bgti_cont.45827
bgti_else.45830:
	addi	%v0, %zero, 2
bgti_cont.45831:
	j	bgti_cont.45827
bgti_else.45828:
	addi	%v0, %zero, 1
bgti_cont.45829:
	j	bgti_cont.45827
bgti_else.45826:
	addi	%v0, %zero, 0
bgti_cont.45827:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	blti	%v1, 10, bgti_else.45850
	blti	%v1, 20, bgti_else.45852
	blti	%v1, 30, bgti_else.45854
	blti	%v1, 40, bgti_else.45856
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45858
	blti	%v1, 20, bgti_else.45860
	blti	%v1, 30, bgti_else.45862
	blti	%v1, 40, bgti_else.45864
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45866
	blti	%v1, 20, bgti_else.45868
	blti	%v1, 30, bgti_else.45870
	blti	%v1, 40, bgti_else.45872
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub2.2644
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgti_cont.45851
bgti_else.45872:
	addi	%v0, %v1, -30
bgti_cont.45873:
	j	bgti_cont.45851
bgti_else.45870:
	addi	%v0, %v1, -20
bgti_cont.45871:
	j	bgti_cont.45851
bgti_else.45868:
	addi	%v0, %v1, -10
bgti_cont.45869:
	j	bgti_cont.45851
bgti_else.45866:
	add	%v0, %zero, %v1
bgti_cont.45867:
	j	bgti_cont.45851
bgti_else.45864:
	addi	%v0, %v1, -30
bgti_cont.45865:
	j	bgti_cont.45851
bgti_else.45862:
	addi	%v0, %v1, -20
bgti_cont.45863:
	j	bgti_cont.45851
bgti_else.45860:
	addi	%v0, %v1, -10
bgti_cont.45861:
	j	bgti_cont.45851
bgti_else.45858:
	add	%v0, %zero, %v1
bgti_cont.45859:
	j	bgti_cont.45851
bgti_else.45856:
	addi	%v0, %v1, -30
bgti_cont.45857:
	j	bgti_cont.45851
bgti_else.45854:
	addi	%v0, %v1, -20
bgti_cont.45855:
	j	bgti_cont.45851
bgti_else.45852:
	addi	%v0, %v1, -10
bgti_cont.45853:
	j	bgti_cont.45851
bgti_else.45850:
	add	%v0, %zero, %v1
bgti_cont.45851:
	lw	%v1, 23(%sp)
	blt	%zero, %v1, bgt_else.45874
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_print_char
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgt_cont.45875
bgt_else.45874:
	sw	%v0, 24(%sp)
	blti	%v1, 10, bgti_else.45876
	blti	%v1, 20, bgti_else.45878
	blti	%v1, 30, bgti_else.45880
	blti	%v1, 40, bgti_else.45882
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.45884
	blti	%a0, 20, bgti_else.45886
	blti	%a0, 30, bgti_else.45888
	blti	%a0, 40, bgti_else.45890
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.45892
	blti	%a0, 20, bgti_else.45894
	blti	%a0, 30, bgti_else.45896
	blti	%a0, 40, bgti_else.45898
	addi	%a0, %a0, -40
	addi	%a1, %zero, 12
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub1.2641
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgti_cont.45877
bgti_else.45898:
	addi	%v0, %zero, 11
bgti_cont.45899:
	j	bgti_cont.45877
bgti_else.45896:
	addi	%v0, %zero, 10
bgti_cont.45897:
	j	bgti_cont.45877
bgti_else.45894:
	addi	%v0, %zero, 9
bgti_cont.45895:
	j	bgti_cont.45877
bgti_else.45892:
	addi	%v0, %zero, 8
bgti_cont.45893:
	j	bgti_cont.45877
bgti_else.45890:
	addi	%v0, %zero, 7
bgti_cont.45891:
	j	bgti_cont.45877
bgti_else.45888:
	addi	%v0, %zero, 6
bgti_cont.45889:
	j	bgti_cont.45877
bgti_else.45886:
	addi	%v0, %zero, 5
bgti_cont.45887:
	j	bgti_cont.45877
bgti_else.45884:
	addi	%v0, %zero, 4
bgti_cont.45885:
	j	bgti_cont.45877
bgti_else.45882:
	addi	%v0, %zero, 3
bgti_cont.45883:
	j	bgti_cont.45877
bgti_else.45880:
	addi	%v0, %zero, 2
bgti_cont.45881:
	j	bgti_cont.45877
bgti_else.45878:
	addi	%v0, %zero, 1
bgti_cont.45879:
	j	bgti_cont.45877
bgti_else.45876:
	addi	%v0, %zero, 0
bgti_cont.45877:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	blti	%v1, 10, bgti_else.45900
	blti	%v1, 20, bgti_else.45902
	blti	%v1, 30, bgti_else.45904
	blti	%v1, 40, bgti_else.45906
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45908
	blti	%v1, 20, bgti_else.45910
	blti	%v1, 30, bgti_else.45912
	blti	%v1, 40, bgti_else.45914
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45916
	blti	%v1, 20, bgti_else.45918
	blti	%v1, 30, bgti_else.45920
	blti	%v1, 40, bgti_else.45922
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	print_int_sub2.2644
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.45901
bgti_else.45922:
	addi	%v0, %v1, -30
bgti_cont.45923:
	j	bgti_cont.45901
bgti_else.45920:
	addi	%v0, %v1, -20
bgti_cont.45921:
	j	bgti_cont.45901
bgti_else.45918:
	addi	%v0, %v1, -10
bgti_cont.45919:
	j	bgti_cont.45901
bgti_else.45916:
	add	%v0, %zero, %v1
bgti_cont.45917:
	j	bgti_cont.45901
bgti_else.45914:
	addi	%v0, %v1, -30
bgti_cont.45915:
	j	bgti_cont.45901
bgti_else.45912:
	addi	%v0, %v1, -20
bgti_cont.45913:
	j	bgti_cont.45901
bgti_else.45910:
	addi	%v0, %v1, -10
bgti_cont.45911:
	j	bgti_cont.45901
bgti_else.45908:
	add	%v0, %zero, %v1
bgti_cont.45909:
	j	bgti_cont.45901
bgti_else.45906:
	addi	%v0, %v1, -30
bgti_cont.45907:
	j	bgti_cont.45901
bgti_else.45904:
	addi	%v0, %v1, -20
bgti_cont.45905:
	j	bgti_cont.45901
bgti_else.45902:
	addi	%v0, %v1, -10
bgti_cont.45903:
	j	bgti_cont.45901
bgti_else.45900:
	add	%v0, %zero, %v1
bgti_cont.45901:
	lw	%v1, 25(%sp)
	blt	%zero, %v1, bgt_else.45924
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
	j	bgt_cont.45925
bgt_else.45924:
	sw	%v0, 26(%sp)
	blti	%v1, 10, bgti_else.45926
	blti	%v1, 20, bgti_else.45928
	blti	%v1, 30, bgti_else.45930
	blti	%v1, 40, bgti_else.45932
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45934
	blti	%v1, 20, bgti_else.45936
	blti	%v1, 30, bgti_else.45938
	blti	%v1, 40, bgti_else.45940
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.45942
	blti	%v1, 20, bgti_else.45944
	blti	%v1, 30, bgti_else.45946
	blti	%v1, 40, bgti_else.45948
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2644
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.45927
bgti_else.45948:
	addi	%v0, %v1, -30
bgti_cont.45949:
	j	bgti_cont.45927
bgti_else.45946:
	addi	%v0, %v1, -20
bgti_cont.45947:
	j	bgti_cont.45927
bgti_else.45944:
	addi	%v0, %v1, -10
bgti_cont.45945:
	j	bgti_cont.45927
bgti_else.45942:
	add	%v0, %zero, %v1
bgti_cont.45943:
	j	bgti_cont.45927
bgti_else.45940:
	addi	%v0, %v1, -30
bgti_cont.45941:
	j	bgti_cont.45927
bgti_else.45938:
	addi	%v0, %v1, -20
bgti_cont.45939:
	j	bgti_cont.45927
bgti_else.45936:
	addi	%v0, %v1, -10
bgti_cont.45937:
	j	bgti_cont.45927
bgti_else.45934:
	add	%v0, %zero, %v1
bgti_cont.45935:
	j	bgti_cont.45927
bgti_else.45932:
	addi	%v0, %v1, -30
bgti_cont.45933:
	j	bgti_cont.45927
bgti_else.45930:
	addi	%v0, %v1, -20
bgti_cont.45931:
	j	bgti_cont.45927
bgti_else.45928:
	addi	%v0, %v1, -10
bgti_cont.45929:
	j	bgti_cont.45927
bgti_else.45926:
	add	%v0, %zero, %v1
bgti_cont.45927:
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
bgt_cont.45925:
bgt_cont.45875:
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
	jal	scan_pixel.3057
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
bgt_cont.45555:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.45950
	addi	%a0, %v0, -5
	j	bgti_cont.45951
bgti_else.45950:
	add	%a0, %zero, %v0
bgti_cont.45951:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.45952
	jr	%ra
bgt_else.45952:
	lw	%v0, 0(%sp)
	sw	%a0, 27(%sp)
	sw	%v1, 28(%sp)
	blt	%v1, %v0, bgt_else.45954
	j	bgt_cont.45955
bgt_else.45954:
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
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
bgt_cont.45955:
	lw	%v0, 8(%sp)
	lw	%v1, 28(%sp)
	lw	%a0, 7(%sp)
	lw	%a1, 3(%sp)
	lw	%a2, 4(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	scan_pixel.3057
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v0, 28(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 27(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.45956
	addi	%a2, %v1, -5
	j	bgti_cont.45957
bgti_else.45956:
	add	%a2, %zero, %v1
bgti_cont.45957:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	j	scan_line.3063
init_line_elements.3073:
	addi	%a0, %zero, 0
	blti	%v1, 0, bgti_else.46263
	addi	%a1, %zero, 3
	flw	%f0, 470(%zero)
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
	blti	%v0, 0, bgti_else.46264
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
	blti	%v0, 0, bgti_else.46265
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
	blti	%v0, 0, bgti_else.46266
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
	j	init_line_elements.3073
bgti_else.46266:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.46265:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.46264:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.46263:
	jr	%ra
calc_dirvec.3083:
	blti	%v0, 5, bgti_else.47513
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 474(%zero)
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
bgti_else.47513:
	fmul	%f0, %f1, %f1
	flw	%f1, 441(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 474(%zero)
	fdiv	%f5, %f4, %f0
	flw	%f6, 470(%zero)
	fblt	%f5, %f6, fbgt_else.47515
	addi	%a1, %zero, 1
	j	fbgt_cont.47516
fbgt_else.47515:
	addi	%a1, %zero, 0
fbgt_cont.47516:
	fabs	%f7, %f5
	flw	%f8, 462(%zero)
	fblt	%f7, %f8, fbgt_else.47517
	flw	%f5, 455(%zero)
	fblt	%f7, %f5, fbgt_else.47519
	flw	%f5, 479(%zero)
	fdiv	%f7, %f4, %f7
	fmul	%f9, %f7, %f7
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 461(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fsub	%f12, %f7, %f12
	flw	%f13, 460(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 456(%zero)
	fmul	%f7, %f12, %f7
	fmul	%f7, %f7, %f10
	fmul	%f7, %f7, %f11
	fadd	%f7, %f9, %f7
	fsub	%f5, %f5, %f7
	j	fbgt_cont.47520
fbgt_else.47519:
	flw	%f5, 478(%zero)
	fsub	%f9, %f7, %f4
	fadd	%f7, %f7, %f4
	fdiv	%f7, %f9, %f7
	fmul	%f9, %f7, %f7
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 461(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fsub	%f12, %f7, %f12
	flw	%f13, 460(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 456(%zero)
	fmul	%f7, %f12, %f7
	fmul	%f7, %f7, %f10
	fmul	%f7, %f7, %f11
	fadd	%f7, %f9, %f7
	fadd	%f5, %f5, %f7
fbgt_cont.47520:
	beqi	%a1, 0, bnei_else.47521
	j	fbgt_cont.47518
bnei_else.47521:
	fneg	%f5, %f5
bnei_cont.47522:
	j	fbgt_cont.47518
fbgt_else.47517:
	fmul	%f7, %f5, %f5
	fmul	%f9, %f7, %f7
	fmul	%f10, %f9, %f9
	flw	%f11, 461(%zero)
	fmul	%f11, %f11, %f5
	fmul	%f11, %f11, %f7
	fsub	%f11, %f5, %f11
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f7, %f12, %f7
	fmul	%f7, %f7, %f10
	fsub	%f7, %f11, %f7
	flw	%f11, 456(%zero)
	fmul	%f5, %f11, %f5
	fmul	%f5, %f5, %f9
	fmul	%f5, %f5, %f10
	fadd	%f5, %f7, %f5
fbgt_cont.47518:
	fmul	%f5, %f5, %f2
	flw	%f7, 494(%zero)
	fblt	%f5, %f6, fbgt_else.47523
	addi	%a1, %zero, 1
	j	fbgt_cont.47524
fbgt_else.47523:
	addi	%a1, %zero, 0
fbgt_cont.47524:
	fabs	%f9, %f5
	flw	%f10, 493(%zero)
	fsw	%f2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	fsw	%f3, 3(%sp)
	fsw	%f8, 4(%sp)
	fsw	%f6, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%v0, 7(%sp)
	fsw	%f0, 8(%sp)
	fsw	%f5, 9(%sp)
	fsw	%f4, 10(%sp)
	sw	%a1, 11(%sp)
	fsw	%f7, 12(%sp)
	fsw	%f9, 13(%sp)
	fsw	%f10, 14(%sp)
	fblt	%f9, %f10, fbgt_else.47525
	flw	%f11, 492(%zero)
	fblt	%f9, %f11, fbgt_else.47527
	flw	%f11, 491(%zero)
	fblt	%f9, %f11, fbgt_else.47529
	flw	%f11, 490(%zero)
	fblt	%f9, %f11, fbgt_else.47531
	flw	%f11, 489(%zero)
	fblt	%f9, %f11, fbgt_else.47533
	flw	%f11, 488(%zero)
	fblt	%f9, %f11, fbgt_else.47535
	flw	%f11, 487(%zero)
	fblt	%f9, %f11, fbgt_else.47537
	flw	%f11, 486(%zero)
	fblt	%f9, %f11, fbgt_else.47539
	flw	%f11, 485(%zero)
	fblt	%f9, %f11, fbgt_else.47541
	flw	%f11, 484(%zero)
	fblt	%f9, %f11, fbgt_else.47543
	flw	%f11, 483(%zero)
	fblt	%f9, %f11, fbgt_else.47545
	flw	%f11, 482(%zero)
	fmov	%f1, %f11
	fmov	%f0, %f9
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.47526
fbgt_else.47545:
	fmov	%f0, %f11
fbgt_cont.47546:
	j	fbgt_cont.47526
fbgt_else.47543:
	fmov	%f0, %f11
fbgt_cont.47544:
	j	fbgt_cont.47526
fbgt_else.47541:
	fmov	%f0, %f11
fbgt_cont.47542:
	j	fbgt_cont.47526
fbgt_else.47539:
	fmov	%f0, %f11
fbgt_cont.47540:
	j	fbgt_cont.47526
fbgt_else.47537:
	fmov	%f0, %f11
fbgt_cont.47538:
	j	fbgt_cont.47526
fbgt_else.47535:
	fmov	%f0, %f11
fbgt_cont.47536:
	j	fbgt_cont.47526
fbgt_else.47533:
	fmov	%f0, %f11
fbgt_cont.47534:
	j	fbgt_cont.47526
fbgt_else.47531:
	fmov	%f0, %f11
fbgt_cont.47532:
	j	fbgt_cont.47526
fbgt_else.47529:
	fmov	%f0, %f11
fbgt_cont.47530:
	j	fbgt_cont.47526
fbgt_else.47527:
	fmov	%f0, %f11
fbgt_cont.47528:
	j	fbgt_cont.47526
fbgt_else.47525:
	fmov	%f0, %f10
fbgt_cont.47526:
	flw	%f1, 13(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.47547
	fblt	%f1, %f0, fbgt_else.47549
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47551
	fblt	%f1, %f0, fbgt_else.47553
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47555
	fblt	%f1, %f0, fbgt_else.47557
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.47548
fbgt_else.47557:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.47558:
	j	fbgt_cont.47548
fbgt_else.47555:
	fmov	%f0, %f1
fbgt_cont.47556:
	j	fbgt_cont.47548
fbgt_else.47553:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47559
	fblt	%f1, %f0, fbgt_else.47561
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.47548
fbgt_else.47561:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.47562:
	j	fbgt_cont.47548
fbgt_else.47559:
	fmov	%f0, %f1
fbgt_cont.47560:
fbgt_cont.47554:
	j	fbgt_cont.47548
fbgt_else.47551:
	fmov	%f0, %f1
fbgt_cont.47552:
	j	fbgt_cont.47548
fbgt_else.47549:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47563
	fblt	%f1, %f0, fbgt_else.47565
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47567
	fblt	%f1, %f0, fbgt_else.47569
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.47548
fbgt_else.47569:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.47570:
	j	fbgt_cont.47548
fbgt_else.47567:
	fmov	%f0, %f1
fbgt_cont.47568:
	j	fbgt_cont.47548
fbgt_else.47565:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47571
	fblt	%f1, %f0, fbgt_else.47573
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.47548
fbgt_else.47573:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.47574:
	j	fbgt_cont.47548
fbgt_else.47571:
	fmov	%f0, %f1
fbgt_cont.47572:
fbgt_cont.47566:
	j	fbgt_cont.47548
fbgt_else.47563:
	fmov	%f0, %f1
fbgt_cont.47564:
fbgt_cont.47550:
	j	fbgt_cont.47548
fbgt_else.47547:
	fmov	%f0, %f1
fbgt_cont.47548:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.47575
	lw	%v0, 11(%sp)
	beqi	%v0, 0, bnei_else.47577
	addi	%v0, %zero, 0
	j	fbgt_cont.47576
bnei_else.47577:
	addi	%v0, %zero, 1
bnei_cont.47578:
	j	fbgt_cont.47576
fbgt_else.47575:
	lw	%v0, 11(%sp)
fbgt_cont.47576:
	fblt	%f0, %f1, fbgt_else.47579
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47580
fbgt_else.47579:
fbgt_cont.47580:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.47581
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47582
fbgt_else.47581:
fbgt_cont.47582:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.47583
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.47584
fbgt_else.47583:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 473(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 10(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 472(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 471(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.47584:
	beqi	%v0, 0, bnei_else.47585
	j	bnei_cont.47586
bnei_else.47585:
	fneg	%f0, %f0
bnei_cont.47586:
	flw	%f4, 9(%sp)
	fabs	%f4, %f4
	flw	%f5, 14(%sp)
	fsw	%f0, 15(%sp)
	fsw	%f3, 16(%sp)
	fsw	%f2, 17(%sp)
	fsw	%f4, 18(%sp)
	fblt	%f4, %f5, fbgt_else.47587
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.47589
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.47591
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.47593
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.47595
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.47597
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.47599
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.47601
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.47603
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.47605
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.47607
	flw	%f6, 482(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.47588
fbgt_else.47607:
	fmov	%f0, %f6
fbgt_cont.47608:
	j	fbgt_cont.47588
fbgt_else.47605:
	fmov	%f0, %f6
fbgt_cont.47606:
	j	fbgt_cont.47588
fbgt_else.47603:
	fmov	%f0, %f6
fbgt_cont.47604:
	j	fbgt_cont.47588
fbgt_else.47601:
	fmov	%f0, %f6
fbgt_cont.47602:
	j	fbgt_cont.47588
fbgt_else.47599:
	fmov	%f0, %f6
fbgt_cont.47600:
	j	fbgt_cont.47588
fbgt_else.47597:
	fmov	%f0, %f6
fbgt_cont.47598:
	j	fbgt_cont.47588
fbgt_else.47595:
	fmov	%f0, %f6
fbgt_cont.47596:
	j	fbgt_cont.47588
fbgt_else.47593:
	fmov	%f0, %f6
fbgt_cont.47594:
	j	fbgt_cont.47588
fbgt_else.47591:
	fmov	%f0, %f6
fbgt_cont.47592:
	j	fbgt_cont.47588
fbgt_else.47589:
	fmov	%f0, %f6
fbgt_cont.47590:
	j	fbgt_cont.47588
fbgt_else.47587:
	fmov	%f0, %f5
fbgt_cont.47588:
	flw	%f1, 18(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.47609
	fblt	%f1, %f0, fbgt_else.47611
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47613
	fblt	%f1, %f0, fbgt_else.47615
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47617
	fblt	%f1, %f0, fbgt_else.47619
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.47610
fbgt_else.47619:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.47620:
	j	fbgt_cont.47610
fbgt_else.47617:
	fmov	%f0, %f1
fbgt_cont.47618:
	j	fbgt_cont.47610
fbgt_else.47615:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47621
	fblt	%f1, %f0, fbgt_else.47623
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.47610
fbgt_else.47623:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.47624:
	j	fbgt_cont.47610
fbgt_else.47621:
	fmov	%f0, %f1
fbgt_cont.47622:
fbgt_cont.47616:
	j	fbgt_cont.47610
fbgt_else.47613:
	fmov	%f0, %f1
fbgt_cont.47614:
	j	fbgt_cont.47610
fbgt_else.47611:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47625
	fblt	%f1, %f0, fbgt_else.47627
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47629
	fblt	%f1, %f0, fbgt_else.47631
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.47610
fbgt_else.47631:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.47632:
	j	fbgt_cont.47610
fbgt_else.47629:
	fmov	%f0, %f1
fbgt_cont.47630:
	j	fbgt_cont.47610
fbgt_else.47627:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47633
	fblt	%f1, %f0, fbgt_else.47635
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.47610
fbgt_else.47635:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.47636:
	j	fbgt_cont.47610
fbgt_else.47633:
	fmov	%f0, %f1
fbgt_cont.47634:
fbgt_cont.47628:
	j	fbgt_cont.47610
fbgt_else.47625:
	fmov	%f0, %f1
fbgt_cont.47626:
fbgt_cont.47612:
	j	fbgt_cont.47610
fbgt_else.47609:
	fmov	%f0, %f1
fbgt_cont.47610:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.47637
	addi	%v0, %zero, 0
	j	fbgt_cont.47638
fbgt_else.47637:
	addi	%v0, %zero, 1
fbgt_cont.47638:
	fblt	%f0, %f1, fbgt_else.47639
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47640
fbgt_else.47639:
fbgt_cont.47640:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.47641
	beqi	%v0, 0, bnei_else.47643
	addi	%v0, %zero, 0
	j	fbgt_cont.47642
bnei_else.47643:
	addi	%v0, %zero, 1
bnei_cont.47644:
	j	fbgt_cont.47642
fbgt_else.47641:
fbgt_cont.47642:
	fblt	%f0, %f2, fbgt_else.47645
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47646
fbgt_else.47645:
fbgt_cont.47646:
	flw	%f3, 16(%sp)
	fblt	%f3, %f0, fbgt_else.47647
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 473(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 10(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 472(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 471(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.47648
fbgt_else.47647:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.47648:
	beqi	%v0, 0, bnei_else.47649
	j	bnei_cont.47650
bnei_else.47649:
	fneg	%f0, %f0
bnei_cont.47650:
	flw	%f4, 15(%sp)
	fdiv	%f0, %f4, %f0
	flw	%f4, 8(%sp)
	fmul	%f0, %f0, %f4
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	fmul	%f4, %f0, %f0
	flw	%f5, 6(%sp)
	fadd	%f4, %f4, %f5
	fsqrt	%f4, %f4
	flw	%f5, 10(%sp)
	fdiv	%f6, %f5, %f4
	flw	%f7, 5(%sp)
	fblt	%f6, %f7, fbgt_else.47651
	addi	%v1, %zero, 1
	j	fbgt_cont.47652
fbgt_else.47651:
	addi	%v1, %zero, 0
fbgt_cont.47652:
	fabs	%f8, %f6
	flw	%f9, 4(%sp)
	fblt	%f8, %f9, fbgt_else.47653
	flw	%f6, 455(%zero)
	fblt	%f8, %f6, fbgt_else.47655
	fdiv	%f6, %f5, %f8
	fmul	%f8, %f6, %f6
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 461(%zero)
	fmul	%f11, %f11, %f6
	fmul	%f11, %f11, %f8
	fsub	%f11, %f6, %f11
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 456(%zero)
	fmul	%f6, %f11, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f10
	fadd	%f6, %f8, %f6
	fsub	%f6, %f2, %f6
	j	fbgt_cont.47656
fbgt_else.47655:
	fsub	%f6, %f8, %f5
	fadd	%f8, %f8, %f5
	fdiv	%f6, %f6, %f8
	fmul	%f8, %f6, %f6
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 461(%zero)
	fmul	%f11, %f11, %f6
	fmul	%f11, %f11, %f8
	fsub	%f11, %f6, %f11
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 456(%zero)
	fmul	%f6, %f11, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f10
	fadd	%f6, %f8, %f6
	fadd	%f6, %f3, %f6
fbgt_cont.47656:
	beqi	%v1, 0, bnei_else.47657
	j	fbgt_cont.47654
bnei_else.47657:
	fneg	%f6, %f6
bnei_cont.47658:
	j	fbgt_cont.47654
fbgt_else.47653:
	fmul	%f8, %f6, %f6
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 461(%zero)
	fmul	%f11, %f11, %f6
	fmul	%f11, %f11, %f8
	fsub	%f11, %f6, %f11
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 456(%zero)
	fmul	%f6, %f11, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f10
	fadd	%f6, %f8, %f6
fbgt_cont.47654:
	flw	%f8, 3(%sp)
	fmul	%f6, %f6, %f8
	fblt	%f6, %f7, fbgt_else.47659
	addi	%v1, %zero, 1
	j	fbgt_cont.47660
fbgt_else.47659:
	addi	%v1, %zero, 0
fbgt_cont.47660:
	fabs	%f7, %f6
	flw	%f9, 14(%sp)
	fsw	%f0, 19(%sp)
	sw	%v0, 20(%sp)
	fsw	%f4, 21(%sp)
	fsw	%f6, 22(%sp)
	sw	%v1, 23(%sp)
	fsw	%f7, 24(%sp)
	fblt	%f7, %f9, fbgt_else.47661
	flw	%f10, 492(%zero)
	fblt	%f7, %f10, fbgt_else.47663
	flw	%f10, 491(%zero)
	fblt	%f7, %f10, fbgt_else.47665
	flw	%f10, 490(%zero)
	fblt	%f7, %f10, fbgt_else.47667
	flw	%f10, 489(%zero)
	fblt	%f7, %f10, fbgt_else.47669
	flw	%f10, 488(%zero)
	fblt	%f7, %f10, fbgt_else.47671
	flw	%f10, 487(%zero)
	fblt	%f7, %f10, fbgt_else.47673
	flw	%f10, 486(%zero)
	fblt	%f7, %f10, fbgt_else.47675
	flw	%f10, 485(%zero)
	fblt	%f7, %f10, fbgt_else.47677
	flw	%f10, 484(%zero)
	fblt	%f7, %f10, fbgt_else.47679
	flw	%f10, 483(%zero)
	fblt	%f7, %f10, fbgt_else.47681
	flw	%f10, 482(%zero)
	fmov	%f1, %f10
	fmov	%f0, %f7
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.47662
fbgt_else.47681:
	fmov	%f0, %f10
fbgt_cont.47682:
	j	fbgt_cont.47662
fbgt_else.47679:
	fmov	%f0, %f10
fbgt_cont.47680:
	j	fbgt_cont.47662
fbgt_else.47677:
	fmov	%f0, %f10
fbgt_cont.47678:
	j	fbgt_cont.47662
fbgt_else.47675:
	fmov	%f0, %f10
fbgt_cont.47676:
	j	fbgt_cont.47662
fbgt_else.47673:
	fmov	%f0, %f10
fbgt_cont.47674:
	j	fbgt_cont.47662
fbgt_else.47671:
	fmov	%f0, %f10
fbgt_cont.47672:
	j	fbgt_cont.47662
fbgt_else.47669:
	fmov	%f0, %f10
fbgt_cont.47670:
	j	fbgt_cont.47662
fbgt_else.47667:
	fmov	%f0, %f10
fbgt_cont.47668:
	j	fbgt_cont.47662
fbgt_else.47665:
	fmov	%f0, %f10
fbgt_cont.47666:
	j	fbgt_cont.47662
fbgt_else.47663:
	fmov	%f0, %f10
fbgt_cont.47664:
	j	fbgt_cont.47662
fbgt_else.47661:
	fmov	%f0, %f9
fbgt_cont.47662:
	flw	%f1, 24(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.47683
	fblt	%f1, %f0, fbgt_else.47685
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47687
	fblt	%f1, %f0, fbgt_else.47689
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47691
	fblt	%f1, %f0, fbgt_else.47693
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.47684
fbgt_else.47693:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.47694:
	j	fbgt_cont.47684
fbgt_else.47691:
	fmov	%f0, %f1
fbgt_cont.47692:
	j	fbgt_cont.47684
fbgt_else.47689:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47695
	fblt	%f1, %f0, fbgt_else.47697
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.47684
fbgt_else.47697:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.47698:
	j	fbgt_cont.47684
fbgt_else.47695:
	fmov	%f0, %f1
fbgt_cont.47696:
fbgt_cont.47690:
	j	fbgt_cont.47684
fbgt_else.47687:
	fmov	%f0, %f1
fbgt_cont.47688:
	j	fbgt_cont.47684
fbgt_else.47685:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47699
	fblt	%f1, %f0, fbgt_else.47701
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47703
	fblt	%f1, %f0, fbgt_else.47705
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.47684
fbgt_else.47705:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.47706:
	j	fbgt_cont.47684
fbgt_else.47703:
	fmov	%f0, %f1
fbgt_cont.47704:
	j	fbgt_cont.47684
fbgt_else.47701:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47707
	fblt	%f1, %f0, fbgt_else.47709
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.47684
fbgt_else.47709:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.47710:
	j	fbgt_cont.47684
fbgt_else.47707:
	fmov	%f0, %f1
fbgt_cont.47708:
fbgt_cont.47702:
	j	fbgt_cont.47684
fbgt_else.47699:
	fmov	%f0, %f1
fbgt_cont.47700:
fbgt_cont.47686:
	j	fbgt_cont.47684
fbgt_else.47683:
	fmov	%f0, %f1
fbgt_cont.47684:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.47711
	lw	%v0, 23(%sp)
	beqi	%v0, 0, bnei_else.47713
	addi	%v0, %zero, 0
	j	fbgt_cont.47712
bnei_else.47713:
	addi	%v0, %zero, 1
bnei_cont.47714:
	j	fbgt_cont.47712
fbgt_else.47711:
	lw	%v0, 23(%sp)
fbgt_cont.47712:
	fblt	%f0, %f1, fbgt_else.47715
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47716
fbgt_else.47715:
fbgt_cont.47716:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.47717
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47718
fbgt_else.47717:
fbgt_cont.47718:
	flw	%f3, 16(%sp)
	fblt	%f3, %f0, fbgt_else.47719
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.47720
fbgt_else.47719:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 473(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 10(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 472(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 471(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.47720:
	beqi	%v0, 0, bnei_else.47721
	j	bnei_cont.47722
bnei_else.47721:
	fneg	%f0, %f0
bnei_cont.47722:
	flw	%f4, 22(%sp)
	fabs	%f4, %f4
	flw	%f5, 14(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f4, 26(%sp)
	fblt	%f4, %f5, fbgt_else.47723
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.47725
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.47727
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.47729
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.47731
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.47733
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.47735
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.47737
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.47739
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.47741
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.47743
	flw	%f6, 482(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.47724
fbgt_else.47743:
	fmov	%f0, %f6
fbgt_cont.47744:
	j	fbgt_cont.47724
fbgt_else.47741:
	fmov	%f0, %f6
fbgt_cont.47742:
	j	fbgt_cont.47724
fbgt_else.47739:
	fmov	%f0, %f6
fbgt_cont.47740:
	j	fbgt_cont.47724
fbgt_else.47737:
	fmov	%f0, %f6
fbgt_cont.47738:
	j	fbgt_cont.47724
fbgt_else.47735:
	fmov	%f0, %f6
fbgt_cont.47736:
	j	fbgt_cont.47724
fbgt_else.47733:
	fmov	%f0, %f6
fbgt_cont.47734:
	j	fbgt_cont.47724
fbgt_else.47731:
	fmov	%f0, %f6
fbgt_cont.47732:
	j	fbgt_cont.47724
fbgt_else.47729:
	fmov	%f0, %f6
fbgt_cont.47730:
	j	fbgt_cont.47724
fbgt_else.47727:
	fmov	%f0, %f6
fbgt_cont.47728:
	j	fbgt_cont.47724
fbgt_else.47725:
	fmov	%f0, %f6
fbgt_cont.47726:
	j	fbgt_cont.47724
fbgt_else.47723:
	fmov	%f0, %f5
fbgt_cont.47724:
	flw	%f1, 26(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.47745
	fblt	%f1, %f0, fbgt_else.47747
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47749
	fblt	%f1, %f0, fbgt_else.47751
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47753
	fblt	%f1, %f0, fbgt_else.47755
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.47746
fbgt_else.47755:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.47756:
	j	fbgt_cont.47746
fbgt_else.47753:
	fmov	%f0, %f1
fbgt_cont.47754:
	j	fbgt_cont.47746
fbgt_else.47751:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47757
	fblt	%f1, %f0, fbgt_else.47759
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.47746
fbgt_else.47759:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.47760:
	j	fbgt_cont.47746
fbgt_else.47757:
	fmov	%f0, %f1
fbgt_cont.47758:
fbgt_cont.47752:
	j	fbgt_cont.47746
fbgt_else.47749:
	fmov	%f0, %f1
fbgt_cont.47750:
	j	fbgt_cont.47746
fbgt_else.47747:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47761
	fblt	%f1, %f0, fbgt_else.47763
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47765
	fblt	%f1, %f0, fbgt_else.47767
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.47746
fbgt_else.47767:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.47768:
	j	fbgt_cont.47746
fbgt_else.47765:
	fmov	%f0, %f1
fbgt_cont.47766:
	j	fbgt_cont.47746
fbgt_else.47763:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47769
	fblt	%f1, %f0, fbgt_else.47771
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.47746
fbgt_else.47771:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.47772:
	j	fbgt_cont.47746
fbgt_else.47769:
	fmov	%f0, %f1
fbgt_cont.47770:
fbgt_cont.47764:
	j	fbgt_cont.47746
fbgt_else.47761:
	fmov	%f0, %f1
fbgt_cont.47762:
fbgt_cont.47748:
	j	fbgt_cont.47746
fbgt_else.47745:
	fmov	%f0, %f1
fbgt_cont.47746:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.47773
	addi	%v0, %zero, 0
	j	fbgt_cont.47774
fbgt_else.47773:
	addi	%v0, %zero, 1
fbgt_cont.47774:
	fblt	%f0, %f1, fbgt_else.47775
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47776
fbgt_else.47775:
fbgt_cont.47776:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.47777
	beqi	%v0, 0, bnei_else.47779
	addi	%v0, %zero, 0
	j	fbgt_cont.47778
bnei_else.47779:
	addi	%v0, %zero, 1
bnei_cont.47780:
	j	fbgt_cont.47778
fbgt_else.47777:
fbgt_cont.47778:
	fblt	%f0, %f2, fbgt_else.47781
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47782
fbgt_else.47781:
fbgt_cont.47782:
	flw	%f1, 16(%sp)
	fblt	%f1, %f0, fbgt_else.47783
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 473(%zero)
	fmul	%f2, %f2, %f0
	flw	%f3, 10(%sp)
	fsub	%f2, %f3, %f2
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.47784
fbgt_else.47783:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.47784:
	beqi	%v0, 0, bnei_else.47785
	j	bnei_cont.47786
bnei_else.47785:
	fneg	%f0, %f0
bnei_cont.47786:
	flw	%f1, 25(%sp)
	fdiv	%f0, %f1, %f0
	flw	%f1, 21(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 19(%sp)
	flw	%f2, 0(%sp)
	flw	%f3, 3(%sp)
	lw	%v0, 20(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	j	calc_dirvec.3083
calc_dirvecs.3091:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.47815
	itof	%f1, %v0
	flw	%f2, 460(%zero)
	fmul	%f1, %f1, %f2
	flw	%f3, 438(%zero)
	fsub	%f1, %f1, %f3
	flw	%f4, 470(%zero)
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
	jal	calc_dirvec.3083
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
	jal	calc_dirvec.3083
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 3(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.47816
	addi	%v1, %v1, -5
	j	bgti_cont.47817
bgti_else.47816:
bgti_cont.47817:
	blti	%v0, 0, bgti_else.47818
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
	jal	calc_dirvec.3083
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
	jal	calc_dirvec.3083
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.47819
	addi	%v1, %v1, -5
	j	bgti_cont.47820
bgti_else.47819:
bgti_cont.47820:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3091
bgti_else.47818:
	jr	%ra
bgti_else.47815:
	jr	%ra
calc_dirvec_rows.3096:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.47843
	itof	%f0, %v0
	flw	%f1, 460(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 438(%zero)
	fsub	%f3, %f0, %f2
	addi	%a2, %zero, 4
	itof	%f0, %a2
	fmul	%f0, %f0, %f1
	fsub	%f0, %f0, %f2
	flw	%f4, 470(%zero)
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
	jal	calc_dirvec.3083
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
	jal	calc_dirvec.3083
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	addi	%v0, %zero, 3
	lw	%v1, 4(%sp)
	addi	%a0, %v1, 1
	blti	%a0, 5, bgti_else.47844
	addi	%a0, %a0, -5
	j	bgti_cont.47845
bgti_else.47844:
bgti_cont.47845:
	flw	%f0, 2(%sp)
	lw	%a1, 6(%sp)
	addi	%v1, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 4(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.47846
	addi	%v1, %v1, -5
	j	bgti_cont.47847
bgti_else.47846:
bgti_cont.47847:
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.47848
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
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)
	addi	%v1, %v1, 2
	blti	%v1, 5, bgti_else.47849
	addi	%v1, %v1, -5
	j	bgti_cont.47850
bgti_else.47849:
bgti_cont.47850:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3096
bgti_else.47848:
	jr	%ra
bgti_else.47843:
	jr	%ra
create_dirvec_elements.3102:
	blti	%v1, 0, bgti_else.47875
	addi	%a0, %zero, 3
	flw	%f0, 470(%zero)
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
	blti	%v0, 0, bgti_else.47876
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
	blti	%v0, 0, bgti_else.47877
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
	blti	%v0, 0, bgti_else.47878
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
	j	create_dirvec_elements.3102
bgti_else.47878:
	jr	%ra
bgti_else.47877:
	jr	%ra
bgti_else.47876:
	jr	%ra
bgti_else.47875:
	jr	%ra
create_dirvecs.3105:
	blti	%v0, 0, bgti_else.47921
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 470(%zero)
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
	jal	create_dirvec_elements.3102
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.47922
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
	jal	create_dirvec_elements.3102
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	j	create_dirvecs.3105
bgti_else.47922:
	jr	%ra
bgti_else.47921:
	jr	%ra
init_dirvec_constants.3107:
	blti	%v1, 0, bgti_else.47998
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
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.47999
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.48000
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.48002
	beqi	%t1, 2, bnei_else.48004
	addi	%t1, %zero, 5
	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.48006
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
	j	bnei_cont.48007
bnei_else.48006:
bnei_cont.48007:
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
	beqi	%a0, 0, bnei_else.48008
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 473(%zero)
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
	j	bnei_cont.48009
bnei_else.48008:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.48009:
	flw	%f0, 6(%sp)
	fbne	%f3, %f0, fbeq_else.48010
	addi	%v1, %zero, 1
	j	fbeq_cont.48011
fbeq_else.48010:
	addi	%v1, %zero, 0
fbeq_cont.48011:
	beqi	%v1, 0, bnei_else.48012
	j	bnei_cont.48013
bnei_else.48012:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.48013:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.48003
bnei_else.48004:
	addi	%t1, %zero, 4
	flw	%f0, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.48014
	addi	%v1, %zero, 0
	j	fbgt_cont.48015
fbgt_else.48014:
	addi	%v1, %zero, 1
fbgt_cont.48015:
	beqi	%v1, 0, bnei_else.48016
	flw	%f1, 468(%zero)
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
	j	bnei_cont.48017
bnei_else.48016:
	fsw	%f1, 0(%v0)
bnei_cont.48017:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.48005:
	j	bnei_cont.48003
bnei_else.48002:
	addi	%t1, %zero, 6
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.48018
	addi	%a0, %zero, 1
	j	fbeq_cont.48019
fbeq_else.48018:
	addi	%a0, %zero, 0
fbeq_cont.48019:
	beqi	%a0, 0, bnei_else.48020
	fsw	%f1, 1(%v0)
	j	bnei_cont.48021
bnei_else.48020:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.48022
	addi	%a2, %zero, 0
	j	fbgt_cont.48023
fbgt_else.48022:
	addi	%a2, %zero, 1
fbgt_cont.48023:
	beqi	%a1, 0, bnei_else.48024
	beqi	%a2, 0, bnei_else.48026
	addi	%a1, %zero, 0
	j	bnei_cont.48025
bnei_else.48026:
	addi	%a1, %zero, 1
bnei_cont.48027:
	j	bnei_cont.48025
bnei_else.48024:
	add	%a1, %zero, %a2
bnei_cont.48025:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.48028
	j	bnei_cont.48029
bnei_else.48028:
	fneg	%f2, %f2
bnei_cont.48029:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.48021:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.48030
	addi	%a0, %zero, 1
	j	fbeq_cont.48031
fbeq_else.48030:
	addi	%a0, %zero, 0
fbeq_cont.48031:
	beqi	%a0, 0, bnei_else.48032
	fsw	%f1, 3(%v0)
	j	bnei_cont.48033
bnei_else.48032:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.48034
	addi	%a2, %zero, 0
	j	fbgt_cont.48035
fbgt_else.48034:
	addi	%a2, %zero, 1
fbgt_cont.48035:
	beqi	%a1, 0, bnei_else.48036
	beqi	%a2, 0, bnei_else.48038
	addi	%a1, %zero, 0
	j	bnei_cont.48037
bnei_else.48038:
	addi	%a1, %zero, 1
bnei_cont.48039:
	j	bnei_cont.48037
bnei_else.48036:
	add	%a1, %zero, %a2
bnei_cont.48037:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.48040
	j	bnei_cont.48041
bnei_else.48040:
	fneg	%f2, %f2
bnei_cont.48041:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.48033:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.48042
	addi	%v1, %zero, 1
	j	fbeq_cont.48043
fbeq_else.48042:
	addi	%v1, %zero, 0
fbeq_cont.48043:
	beqi	%v1, 0, bnei_else.48044
	fsw	%f1, 5(%v0)
	j	bnei_cont.48045
bnei_else.48044:
	lw	%v1, 7(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.48046
	addi	%a1, %zero, 0
	j	fbgt_cont.48047
fbgt_else.48046:
	addi	%a1, %zero, 1
fbgt_cont.48047:
	beqi	%a0, 0, bnei_else.48048
	beqi	%a1, 0, bnei_else.48050
	addi	%a0, %zero, 0
	j	bnei_cont.48049
bnei_else.48050:
	addi	%a0, %zero, 1
bnei_cont.48051:
	j	bnei_cont.48049
bnei_else.48048:
	add	%a0, %zero, %a1
bnei_cont.48049:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.48052
	j	bnei_cont.48053
bnei_else.48052:
	fneg	%f1, %f1
bnei_cont.48053:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.48045:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.48003:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.48001
bgti_else.48000:
bgti_cont.48001:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.48054
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 11(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.48055
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	sw	%v0, 12(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_dirvec_constants.2892
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	init_dirvec_constants.3107
bgti_else.48055:
	jr	%ra
bgti_else.48054:
	jr	%ra
bgti_else.47999:
	jr	%ra
bgti_else.47998:
	jr	%ra
init_vecset_constants.3110:
	blti	%v0, 0, bgti_else.48112
	lw	%v1, 179(%v0)
	addi	%a0, %zero, 119
	lw	%a1, 119(%v1)
	lw	%a2, 0(%zero)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v1, 3(%sp)
	blti	%a2, 0, bgti_else.48113
	lw	%a3, 12(%a2)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.48115
	beqi	%t2, 2, bnei_else.48117
	addi	%t2, %zero, 5
	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.48119
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
	j	bnei_cont.48120
bnei_else.48119:
bnei_cont.48120:
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
	beqi	%a0, 0, bnei_else.48121
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 473(%zero)
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
	j	bnei_cont.48122
bnei_else.48121:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.48122:
	flw	%f0, 6(%sp)
	fbne	%f3, %f0, fbeq_else.48123
	addi	%v1, %zero, 1
	j	fbeq_cont.48124
fbeq_else.48123:
	addi	%v1, %zero, 0
fbeq_cont.48124:
	beqi	%v1, 0, bnei_else.48125
	j	bnei_cont.48126
bnei_else.48125:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.48126:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.48116
bnei_else.48117:
	addi	%t2, %zero, 4
	flw	%f0, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.48127
	addi	%v1, %zero, 0
	j	fbgt_cont.48128
fbgt_else.48127:
	addi	%v1, %zero, 1
fbgt_cont.48128:
	beqi	%v1, 0, bnei_else.48129
	flw	%f1, 468(%zero)
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
	j	bnei_cont.48130
bnei_else.48129:
	fsw	%f1, 0(%v0)
bnei_cont.48130:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.48118:
	j	bnei_cont.48116
bnei_else.48115:
	addi	%t2, %zero, 6
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.48131
	addi	%a0, %zero, 1
	j	fbeq_cont.48132
fbeq_else.48131:
	addi	%a0, %zero, 0
fbeq_cont.48132:
	beqi	%a0, 0, bnei_else.48133
	fsw	%f1, 1(%v0)
	j	bnei_cont.48134
bnei_else.48133:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.48135
	addi	%a2, %zero, 0
	j	fbgt_cont.48136
fbgt_else.48135:
	addi	%a2, %zero, 1
fbgt_cont.48136:
	beqi	%a1, 0, bnei_else.48137
	beqi	%a2, 0, bnei_else.48139
	addi	%a1, %zero, 0
	j	bnei_cont.48138
bnei_else.48139:
	addi	%a1, %zero, 1
bnei_cont.48140:
	j	bnei_cont.48138
bnei_else.48137:
	add	%a1, %zero, %a2
bnei_cont.48138:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.48141
	j	bnei_cont.48142
bnei_else.48141:
	fneg	%f2, %f2
bnei_cont.48142:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.48134:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.48143
	addi	%a0, %zero, 1
	j	fbeq_cont.48144
fbeq_else.48143:
	addi	%a0, %zero, 0
fbeq_cont.48144:
	beqi	%a0, 0, bnei_else.48145
	fsw	%f1, 3(%v0)
	j	bnei_cont.48146
bnei_else.48145:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.48147
	addi	%a2, %zero, 0
	j	fbgt_cont.48148
fbgt_else.48147:
	addi	%a2, %zero, 1
fbgt_cont.48148:
	beqi	%a1, 0, bnei_else.48149
	beqi	%a2, 0, bnei_else.48151
	addi	%a1, %zero, 0
	j	bnei_cont.48150
bnei_else.48151:
	addi	%a1, %zero, 1
bnei_cont.48152:
	j	bnei_cont.48150
bnei_else.48149:
	add	%a1, %zero, %a2
bnei_cont.48150:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.48153
	j	bnei_cont.48154
bnei_else.48153:
	fneg	%f2, %f2
bnei_cont.48154:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.48146:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.48155
	addi	%v1, %zero, 1
	j	fbeq_cont.48156
fbeq_else.48155:
	addi	%v1, %zero, 0
fbeq_cont.48156:
	beqi	%v1, 0, bnei_else.48157
	fsw	%f1, 5(%v0)
	j	bnei_cont.48158
bnei_else.48157:
	lw	%v1, 7(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.48159
	addi	%a1, %zero, 0
	j	fbgt_cont.48160
fbgt_else.48159:
	addi	%a1, %zero, 1
fbgt_cont.48160:
	beqi	%a0, 0, bnei_else.48161
	beqi	%a1, 0, bnei_else.48163
	addi	%a0, %zero, 0
	j	bnei_cont.48162
bnei_else.48163:
	addi	%a0, %zero, 1
bnei_cont.48164:
	j	bnei_cont.48162
bnei_else.48161:
	add	%a0, %zero, %a1
bnei_cont.48162:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.48165
	j	bnei_cont.48166
bnei_else.48165:
	fneg	%f1, %f1
bnei_cont.48166:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.48158:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.48116:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.48114
bgti_else.48113:
bgti_cont.48114:
	addi	%v0, %zero, 118
	lw	%v1, 3(%sp)
	lw	%a0, 118(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 11(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 117
	lw	%v1, 3(%sp)
	lw	%a0, 117(%v1)
	sw	%v0, 12(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	setup_dirvec_constants.2892
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	addi	%v1, %zero, 116
	lw	%v0, 3(%sp)
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.48167
	lw	%v1, 179(%v0)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 13(%sp)
	sw	%v1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 14(%sp)
	lw	%v1, 118(%v0)
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	setup_dirvec_constants.2892
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 14(%sp)
	lw	%v1, 12(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v0, 13(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.48168
	lw	%v1, 179(%v0)
	lw	%a0, 119(%v1)
	sw	%v0, 15(%sp)
	sw	%v1, 16(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	setup_dirvec_constants.2892
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 16(%sp)
	lw	%v1, 11(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	lw	%v0, 15(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.48169
	lw	%v1, 179(%v0)
	lw	%a0, 0(%sp)
	sw	%v0, 17(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v0, 17(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3110
bgti_else.48169:
	jr	%ra
bgti_else.48168:
	jr	%ra
bgti_else.48167:
	jr	%ra
bgti_else.48112:
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
	flw	%f0, 470(%zero)
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
	addi	%v0, %zero, 4
	sw	%v0, 154(%zero)
	sw	%v0, 155(%zero)
	lw	%v1, 6(%sp)
	sw	%v1, 156(%zero)
	sw	%v1, 157(%zero)
	flw	%f0, 437(%zero)
	itof	%f1, %v0
	fdiv	%f0, %f0, %f1
	fsw	%f0, 158(%zero)
	lw	%a0, 154(%zero)
	flw	%f0, 2(%sp)
	lw	%a1, 4(%sp)
	sw	%v0, 11(%sp)
	sw	%a0, 12(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_create_float_array
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
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_create_array
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f0, 2(%sp)
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
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)
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
	lw	%v1, 14(%sp)
	sw	%v1, 1(%v0)
	lw	%v1, 13(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	lw	%v0, 12(%sp)
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	min_caml_create_array
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	lw	%v1, 12(%sp)
	addi	%a0, %v1, -2
	sw	%a0, 21(%sp)
	blti	%a0, 0, bgti_else.51542
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
	jal	init_line_elements.3073
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	bgti_cont.51543
bgti_else.51542:
bgti_cont.51543:
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
	lw	%v0, 12(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_create_array
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	lw	%v1, 21(%sp)
	blti	%v1, 0, bgti_else.51544
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
	jal	init_line_elements.3073
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	j	bgti_cont.51545
bgti_else.51544:
bgti_cont.51545:
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
	lw	%v0, 12(%sp)
	sw	%ra, 58(%sp)
	addi	%sp, %sp, 59
	jal	min_caml_create_array
	addi	%sp, %sp, -59
	lw	%ra, 58(%sp)
	lw	%v1, 21(%sp)
	blti	%v1, 0, bgti_else.51546
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
	jal	init_line_elements.3073
	addi	%sp, %sp, -68
	lw	%ra, 67(%sp)
	j	bgti_cont.51547
bgti_else.51546:
bgti_cont.51547:
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
	flw	%f1, 469(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 494(%zero)
	fabs	%f3, %f0
	flw	%f4, 493(%zero)
	fsw	%f1, 68(%sp)
	fsw	%f0, 69(%sp)
	fsw	%f2, 70(%sp)
	fsw	%f3, 71(%sp)
	fsw	%f4, 72(%sp)
	fblt	%f3, %f4, fbgt_else.51548
	flw	%f5, 492(%zero)
	fblt	%f3, %f5, fbgt_else.51550
	flw	%f5, 491(%zero)
	fblt	%f3, %f5, fbgt_else.51552
	flw	%f5, 490(%zero)
	fblt	%f3, %f5, fbgt_else.51554
	flw	%f5, 489(%zero)
	fblt	%f3, %f5, fbgt_else.51556
	flw	%f5, 488(%zero)
	fblt	%f3, %f5, fbgt_else.51558
	flw	%f5, 487(%zero)
	fblt	%f3, %f5, fbgt_else.51560
	flw	%f5, 486(%zero)
	fblt	%f3, %f5, fbgt_else.51562
	flw	%f5, 485(%zero)
	fblt	%f3, %f5, fbgt_else.51564
	flw	%f5, 484(%zero)
	fblt	%f3, %f5, fbgt_else.51566
	flw	%f5, 483(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
	j	fbgt_cont.51549
fbgt_else.51566:
	fmov	%f0, %f5
fbgt_cont.51567:
	j	fbgt_cont.51549
fbgt_else.51564:
	fmov	%f0, %f5
fbgt_cont.51565:
	j	fbgt_cont.51549
fbgt_else.51562:
	fmov	%f0, %f5
fbgt_cont.51563:
	j	fbgt_cont.51549
fbgt_else.51560:
	fmov	%f0, %f5
fbgt_cont.51561:
	j	fbgt_cont.51549
fbgt_else.51558:
	fmov	%f0, %f5
fbgt_cont.51559:
	j	fbgt_cont.51549
fbgt_else.51556:
	fmov	%f0, %f5
fbgt_cont.51557:
	j	fbgt_cont.51549
fbgt_else.51554:
	fmov	%f0, %f5
fbgt_cont.51555:
	j	fbgt_cont.51549
fbgt_else.51552:
	fmov	%f0, %f5
fbgt_cont.51553:
	j	fbgt_cont.51549
fbgt_else.51550:
	fmov	%f0, %f5
fbgt_cont.51551:
	j	fbgt_cont.51549
fbgt_else.51548:
	fmov	%f0, %f4
fbgt_cont.51549:
	flw	%f1, 71(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.51568
	fblt	%f1, %f0, fbgt_else.51570
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51572
	fblt	%f1, %f0, fbgt_else.51574
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
	j	fbgt_cont.51569
fbgt_else.51574:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
fbgt_cont.51575:
	j	fbgt_cont.51569
fbgt_else.51572:
	fmov	%f0, %f1
fbgt_cont.51573:
	j	fbgt_cont.51569
fbgt_else.51570:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51576
	fblt	%f1, %f0, fbgt_else.51578
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
	j	fbgt_cont.51569
fbgt_else.51578:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
fbgt_cont.51579:
	j	fbgt_cont.51569
fbgt_else.51576:
	fmov	%f0, %f1
fbgt_cont.51577:
fbgt_cont.51571:
	j	fbgt_cont.51569
fbgt_else.51568:
	fmov	%f0, %f1
fbgt_cont.51569:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.51580
	addi	%v0, %zero, 0
	j	fbgt_cont.51581
fbgt_else.51580:
	addi	%v0, %zero, 1
fbgt_cont.51581:
	fblt	%f0, %f1, fbgt_else.51582
	fsub	%f0, %f0, %f1
	j	fbgt_cont.51583
fbgt_else.51582:
fbgt_cont.51583:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.51584
	beqi	%v0, 0, bnei_else.51586
	addi	%v0, %zero, 0
	j	fbgt_cont.51585
bnei_else.51586:
	addi	%v0, %zero, 1
bnei_cont.51587:
	j	fbgt_cont.51585
fbgt_else.51584:
fbgt_cont.51585:
	fblt	%f0, %f2, fbgt_else.51588
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51589
fbgt_else.51588:
fbgt_cont.51589:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.51590
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.51591
fbgt_else.51590:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.51591:
	beqi	%v0, 0, bnei_else.51592
	j	bnei_cont.51593
bnei_else.51592:
	fneg	%f0, %f0
bnei_cont.51593:
	flw	%f4, 69(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.51594
	addi	%v0, %zero, 1
	j	fbgt_cont.51595
fbgt_else.51594:
	addi	%v0, %zero, 0
fbgt_cont.51595:
	fabs	%f4, %f4
	flw	%f6, 72(%sp)
	fsw	%f0, 73(%sp)
	fsw	%f3, 74(%sp)
	fsw	%f2, 75(%sp)
	sw	%v0, 76(%sp)
	fsw	%f4, 77(%sp)
	fblt	%f4, %f6, fbgt_else.51596
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.51598
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.51600
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.51602
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.51604
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.51606
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.51608
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.51610
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.51612
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.51614
	flw	%f7, 483(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.51597
fbgt_else.51614:
	fmov	%f0, %f7
fbgt_cont.51615:
	j	fbgt_cont.51597
fbgt_else.51612:
	fmov	%f0, %f7
fbgt_cont.51613:
	j	fbgt_cont.51597
fbgt_else.51610:
	fmov	%f0, %f7
fbgt_cont.51611:
	j	fbgt_cont.51597
fbgt_else.51608:
	fmov	%f0, %f7
fbgt_cont.51609:
	j	fbgt_cont.51597
fbgt_else.51606:
	fmov	%f0, %f7
fbgt_cont.51607:
	j	fbgt_cont.51597
fbgt_else.51604:
	fmov	%f0, %f7
fbgt_cont.51605:
	j	fbgt_cont.51597
fbgt_else.51602:
	fmov	%f0, %f7
fbgt_cont.51603:
	j	fbgt_cont.51597
fbgt_else.51600:
	fmov	%f0, %f7
fbgt_cont.51601:
	j	fbgt_cont.51597
fbgt_else.51598:
	fmov	%f0, %f7
fbgt_cont.51599:
	j	fbgt_cont.51597
fbgt_else.51596:
	fmov	%f0, %f6
fbgt_cont.51597:
	flw	%f1, 77(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.51616
	fblt	%f1, %f0, fbgt_else.51618
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51620
	fblt	%f1, %f0, fbgt_else.51622
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.51617
fbgt_else.51622:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.51623:
	j	fbgt_cont.51617
fbgt_else.51620:
	fmov	%f0, %f1
fbgt_cont.51621:
	j	fbgt_cont.51617
fbgt_else.51618:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51624
	fblt	%f1, %f0, fbgt_else.51626
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.51617
fbgt_else.51626:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.51627:
	j	fbgt_cont.51617
fbgt_else.51624:
	fmov	%f0, %f1
fbgt_cont.51625:
fbgt_cont.51619:
	j	fbgt_cont.51617
fbgt_else.51616:
	fmov	%f0, %f1
fbgt_cont.51617:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.51628
	lw	%v0, 76(%sp)
	beqi	%v0, 0, bnei_else.51630
	addi	%v0, %zero, 0
	j	fbgt_cont.51629
bnei_else.51630:
	addi	%v0, %zero, 1
bnei_cont.51631:
	j	fbgt_cont.51629
fbgt_else.51628:
	lw	%v0, 76(%sp)
fbgt_cont.51629:
	fblt	%f0, %f1, fbgt_else.51632
	fsub	%f0, %f0, %f1
	j	fbgt_cont.51633
fbgt_else.51632:
fbgt_cont.51633:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.51634
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51635
fbgt_else.51634:
fbgt_cont.51635:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.51636
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.51637
fbgt_else.51636:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.51637:
	beqi	%v0, 0, bnei_else.51638
	j	bnei_cont.51639
bnei_else.51638:
	fneg	%f0, %f0
bnei_cont.51639:
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
	fblt	%f2, %f3, fbgt_else.51640
	flw	%f4, 492(%zero)
	fblt	%f2, %f4, fbgt_else.51642
	flw	%f4, 491(%zero)
	fblt	%f2, %f4, fbgt_else.51644
	flw	%f4, 490(%zero)
	fblt	%f2, %f4, fbgt_else.51646
	flw	%f4, 489(%zero)
	fblt	%f2, %f4, fbgt_else.51648
	flw	%f4, 488(%zero)
	fblt	%f2, %f4, fbgt_else.51650
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.51652
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.51654
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.51656
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.51658
	flw	%f4, 483(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
	j	fbgt_cont.51641
fbgt_else.51658:
	fmov	%f0, %f4
fbgt_cont.51659:
	j	fbgt_cont.51641
fbgt_else.51656:
	fmov	%f0, %f4
fbgt_cont.51657:
	j	fbgt_cont.51641
fbgt_else.51654:
	fmov	%f0, %f4
fbgt_cont.51655:
	j	fbgt_cont.51641
fbgt_else.51652:
	fmov	%f0, %f4
fbgt_cont.51653:
	j	fbgt_cont.51641
fbgt_else.51650:
	fmov	%f0, %f4
fbgt_cont.51651:
	j	fbgt_cont.51641
fbgt_else.51648:
	fmov	%f0, %f4
fbgt_cont.51649:
	j	fbgt_cont.51641
fbgt_else.51646:
	fmov	%f0, %f4
fbgt_cont.51647:
	j	fbgt_cont.51641
fbgt_else.51644:
	fmov	%f0, %f4
fbgt_cont.51645:
	j	fbgt_cont.51641
fbgt_else.51642:
	fmov	%f0, %f4
fbgt_cont.51643:
	j	fbgt_cont.51641
fbgt_else.51640:
	fmov	%f0, %f3
fbgt_cont.51641:
	flw	%f1, 80(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.51660
	fblt	%f1, %f0, fbgt_else.51662
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51664
	fblt	%f1, %f0, fbgt_else.51666
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
	j	fbgt_cont.51661
fbgt_else.51666:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
fbgt_cont.51667:
	j	fbgt_cont.51661
fbgt_else.51664:
	fmov	%f0, %f1
fbgt_cont.51665:
	j	fbgt_cont.51661
fbgt_else.51662:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51668
	fblt	%f1, %f0, fbgt_else.51670
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
	j	fbgt_cont.51661
fbgt_else.51670:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
fbgt_cont.51671:
	j	fbgt_cont.51661
fbgt_else.51668:
	fmov	%f0, %f1
fbgt_cont.51669:
fbgt_cont.51663:
	j	fbgt_cont.51661
fbgt_else.51660:
	fmov	%f0, %f1
fbgt_cont.51661:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.51672
	addi	%v0, %zero, 0
	j	fbgt_cont.51673
fbgt_else.51672:
	addi	%v0, %zero, 1
fbgt_cont.51673:
	fblt	%f0, %f1, fbgt_else.51674
	fsub	%f0, %f0, %f1
	j	fbgt_cont.51675
fbgt_else.51674:
fbgt_cont.51675:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.51676
	beqi	%v0, 0, bnei_else.51678
	addi	%v0, %zero, 0
	j	fbgt_cont.51677
bnei_else.51678:
	addi	%v0, %zero, 1
bnei_cont.51679:
	j	fbgt_cont.51677
fbgt_else.51676:
fbgt_cont.51677:
	fblt	%f0, %f2, fbgt_else.51680
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51681
fbgt_else.51680:
fbgt_cont.51681:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.51682
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.51683
fbgt_else.51682:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.51683:
	beqi	%v0, 0, bnei_else.51684
	j	bnei_cont.51685
bnei_else.51684:
	fneg	%f0, %f0
bnei_cont.51685:
	flw	%f4, 79(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.51686
	addi	%v0, %zero, 1
	j	fbgt_cont.51687
fbgt_else.51686:
	addi	%v0, %zero, 0
fbgt_cont.51687:
	fabs	%f4, %f4
	flw	%f6, 72(%sp)
	fsw	%f0, 81(%sp)
	sw	%v0, 82(%sp)
	fsw	%f4, 83(%sp)
	fblt	%f4, %f6, fbgt_else.51688
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.51690
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.51692
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.51694
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.51696
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.51698
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.51700
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.51702
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.51704
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.51706
	flw	%f7, 483(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
	j	fbgt_cont.51689
fbgt_else.51706:
	fmov	%f0, %f7
fbgt_cont.51707:
	j	fbgt_cont.51689
fbgt_else.51704:
	fmov	%f0, %f7
fbgt_cont.51705:
	j	fbgt_cont.51689
fbgt_else.51702:
	fmov	%f0, %f7
fbgt_cont.51703:
	j	fbgt_cont.51689
fbgt_else.51700:
	fmov	%f0, %f7
fbgt_cont.51701:
	j	fbgt_cont.51689
fbgt_else.51698:
	fmov	%f0, %f7
fbgt_cont.51699:
	j	fbgt_cont.51689
fbgt_else.51696:
	fmov	%f0, %f7
fbgt_cont.51697:
	j	fbgt_cont.51689
fbgt_else.51694:
	fmov	%f0, %f7
fbgt_cont.51695:
	j	fbgt_cont.51689
fbgt_else.51692:
	fmov	%f0, %f7
fbgt_cont.51693:
	j	fbgt_cont.51689
fbgt_else.51690:
	fmov	%f0, %f7
fbgt_cont.51691:
	j	fbgt_cont.51689
fbgt_else.51688:
	fmov	%f0, %f6
fbgt_cont.51689:
	flw	%f1, 83(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.51708
	fblt	%f1, %f0, fbgt_else.51710
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51712
	fblt	%f1, %f0, fbgt_else.51714
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
	j	fbgt_cont.51709
fbgt_else.51714:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
fbgt_cont.51715:
	j	fbgt_cont.51709
fbgt_else.51712:
	fmov	%f0, %f1
fbgt_cont.51713:
	j	fbgt_cont.51709
fbgt_else.51710:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51716
	fblt	%f1, %f0, fbgt_else.51718
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
	j	fbgt_cont.51709
fbgt_else.51718:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
fbgt_cont.51719:
	j	fbgt_cont.51709
fbgt_else.51716:
	fmov	%f0, %f1
fbgt_cont.51717:
fbgt_cont.51711:
	j	fbgt_cont.51709
fbgt_else.51708:
	fmov	%f0, %f1
fbgt_cont.51709:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.51720
	lw	%v0, 82(%sp)
	beqi	%v0, 0, bnei_else.51722
	addi	%v0, %zero, 0
	j	fbgt_cont.51721
bnei_else.51722:
	addi	%v0, %zero, 1
bnei_cont.51723:
	j	fbgt_cont.51721
fbgt_else.51720:
	lw	%v0, 82(%sp)
fbgt_cont.51721:
	fblt	%f0, %f1, fbgt_else.51724
	fsub	%f0, %f0, %f1
	j	fbgt_cont.51725
fbgt_else.51724:
fbgt_cont.51725:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.51726
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51727
fbgt_else.51726:
fbgt_cont.51727:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.51728
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.51729
fbgt_else.51728:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.51729:
	beqi	%v0, 0, bnei_else.51730
	j	bnei_cont.51731
bnei_else.51730:
	fneg	%f0, %f0
bnei_cont.51731:
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
	fblt	%f0, %f2, fbgt_else.51732
	addi	%v0, %zero, 1
	j	fbgt_cont.51733
fbgt_else.51732:
	addi	%v0, %zero, 0
fbgt_cont.51733:
	fabs	%f3, %f0
	flw	%f4, 72(%sp)
	fsw	%f0, 87(%sp)
	sw	%v0, 88(%sp)
	fsw	%f3, 89(%sp)
	fblt	%f3, %f4, fbgt_else.51734
	flw	%f5, 492(%zero)
	fblt	%f3, %f5, fbgt_else.51736
	flw	%f5, 491(%zero)
	fblt	%f3, %f5, fbgt_else.51738
	flw	%f5, 490(%zero)
	fblt	%f3, %f5, fbgt_else.51740
	flw	%f5, 489(%zero)
	fblt	%f3, %f5, fbgt_else.51742
	flw	%f5, 488(%zero)
	fblt	%f3, %f5, fbgt_else.51744
	flw	%f5, 487(%zero)
	fblt	%f3, %f5, fbgt_else.51746
	flw	%f5, 486(%zero)
	fblt	%f3, %f5, fbgt_else.51748
	flw	%f5, 485(%zero)
	fblt	%f3, %f5, fbgt_else.51750
	flw	%f5, 484(%zero)
	fblt	%f3, %f5, fbgt_else.51752
	flw	%f5, 483(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	j	fbgt_cont.51735
fbgt_else.51752:
	fmov	%f0, %f5
fbgt_cont.51753:
	j	fbgt_cont.51735
fbgt_else.51750:
	fmov	%f0, %f5
fbgt_cont.51751:
	j	fbgt_cont.51735
fbgt_else.51748:
	fmov	%f0, %f5
fbgt_cont.51749:
	j	fbgt_cont.51735
fbgt_else.51746:
	fmov	%f0, %f5
fbgt_cont.51747:
	j	fbgt_cont.51735
fbgt_else.51744:
	fmov	%f0, %f5
fbgt_cont.51745:
	j	fbgt_cont.51735
fbgt_else.51742:
	fmov	%f0, %f5
fbgt_cont.51743:
	j	fbgt_cont.51735
fbgt_else.51740:
	fmov	%f0, %f5
fbgt_cont.51741:
	j	fbgt_cont.51735
fbgt_else.51738:
	fmov	%f0, %f5
fbgt_cont.51739:
	j	fbgt_cont.51735
fbgt_else.51736:
	fmov	%f0, %f5
fbgt_cont.51737:
	j	fbgt_cont.51735
fbgt_else.51734:
	fmov	%f0, %f4
fbgt_cont.51735:
	flw	%f1, 89(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.51754
	fblt	%f1, %f0, fbgt_else.51756
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51758
	fblt	%f1, %f0, fbgt_else.51760
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	j	fbgt_cont.51755
fbgt_else.51760:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
fbgt_cont.51761:
	j	fbgt_cont.51755
fbgt_else.51758:
	fmov	%f0, %f1
fbgt_cont.51759:
	j	fbgt_cont.51755
fbgt_else.51756:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51762
	fblt	%f1, %f0, fbgt_else.51764
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	j	fbgt_cont.51755
fbgt_else.51764:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
fbgt_cont.51765:
	j	fbgt_cont.51755
fbgt_else.51762:
	fmov	%f0, %f1
fbgt_cont.51763:
fbgt_cont.51757:
	j	fbgt_cont.51755
fbgt_else.51754:
	fmov	%f0, %f1
fbgt_cont.51755:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.51766
	lw	%v0, 88(%sp)
	beqi	%v0, 0, bnei_else.51768
	addi	%v0, %zero, 0
	j	fbgt_cont.51767
bnei_else.51768:
	addi	%v0, %zero, 1
bnei_cont.51769:
	j	fbgt_cont.51767
fbgt_else.51766:
	lw	%v0, 88(%sp)
fbgt_cont.51767:
	fblt	%f0, %f1, fbgt_else.51770
	fsub	%f0, %f0, %f1
	j	fbgt_cont.51771
fbgt_else.51770:
fbgt_cont.51771:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.51772
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51773
fbgt_else.51772:
fbgt_cont.51773:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.51774
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.51775
fbgt_else.51774:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.51775:
	beqi	%v0, 0, bnei_else.51776
	j	bnei_cont.51777
bnei_else.51776:
	fneg	%f0, %f0
bnei_cont.51777:
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
	fblt	%f1, %f2, fbgt_else.51778
	flw	%f3, 492(%zero)
	fblt	%f1, %f3, fbgt_else.51780
	flw	%f3, 491(%zero)
	fblt	%f1, %f3, fbgt_else.51782
	flw	%f3, 490(%zero)
	fblt	%f1, %f3, fbgt_else.51784
	flw	%f3, 489(%zero)
	fblt	%f1, %f3, fbgt_else.51786
	flw	%f3, 488(%zero)
	fblt	%f1, %f3, fbgt_else.51788
	flw	%f3, 487(%zero)
	fblt	%f1, %f3, fbgt_else.51790
	flw	%f3, 486(%zero)
	fblt	%f1, %f3, fbgt_else.51792
	flw	%f3, 485(%zero)
	fblt	%f1, %f3, fbgt_else.51794
	flw	%f3, 484(%zero)
	fblt	%f1, %f3, fbgt_else.51796
	flw	%f3, 483(%zero)
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.51779
fbgt_else.51796:
	fmov	%f0, %f3
fbgt_cont.51797:
	j	fbgt_cont.51779
fbgt_else.51794:
	fmov	%f0, %f3
fbgt_cont.51795:
	j	fbgt_cont.51779
fbgt_else.51792:
	fmov	%f0, %f3
fbgt_cont.51793:
	j	fbgt_cont.51779
fbgt_else.51790:
	fmov	%f0, %f3
fbgt_cont.51791:
	j	fbgt_cont.51779
fbgt_else.51788:
	fmov	%f0, %f3
fbgt_cont.51789:
	j	fbgt_cont.51779
fbgt_else.51786:
	fmov	%f0, %f3
fbgt_cont.51787:
	j	fbgt_cont.51779
fbgt_else.51784:
	fmov	%f0, %f3
fbgt_cont.51785:
	j	fbgt_cont.51779
fbgt_else.51782:
	fmov	%f0, %f3
fbgt_cont.51783:
	j	fbgt_cont.51779
fbgt_else.51780:
	fmov	%f0, %f3
fbgt_cont.51781:
	j	fbgt_cont.51779
fbgt_else.51778:
	fmov	%f0, %f2
fbgt_cont.51779:
	flw	%f1, 91(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.51798
	fblt	%f1, %f0, fbgt_else.51800
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51802
	fblt	%f1, %f0, fbgt_else.51804
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.51799
fbgt_else.51804:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.51805:
	j	fbgt_cont.51799
fbgt_else.51802:
	fmov	%f0, %f1
fbgt_cont.51803:
	j	fbgt_cont.51799
fbgt_else.51800:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51806
	fblt	%f1, %f0, fbgt_else.51808
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.51799
fbgt_else.51808:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.51809:
	j	fbgt_cont.51799
fbgt_else.51806:
	fmov	%f0, %f1
fbgt_cont.51807:
fbgt_cont.51801:
	j	fbgt_cont.51799
fbgt_else.51798:
	fmov	%f0, %f1
fbgt_cont.51799:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.51810
	addi	%v0, %zero, 0
	j	fbgt_cont.51811
fbgt_else.51810:
	addi	%v0, %zero, 1
fbgt_cont.51811:
	fblt	%f0, %f1, fbgt_else.51812
	fsub	%f0, %f0, %f1
	j	fbgt_cont.51813
fbgt_else.51812:
fbgt_cont.51813:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.51814
	beqi	%v0, 0, bnei_else.51816
	addi	%v0, %zero, 0
	j	fbgt_cont.51815
bnei_else.51816:
	addi	%v0, %zero, 1
bnei_cont.51817:
	j	fbgt_cont.51815
fbgt_else.51814:
fbgt_cont.51815:
	fblt	%f0, %f2, fbgt_else.51818
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51819
fbgt_else.51818:
fbgt_cont.51819:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.51820
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.51821
fbgt_else.51820:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.51821:
	beqi	%v0, 0, bnei_else.51822
	j	bnei_cont.51823
bnei_else.51822:
	fneg	%f0, %f0
bnei_cont.51823:
	flw	%f4, 90(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.51824
	addi	%v0, %zero, 1
	j	fbgt_cont.51825
fbgt_else.51824:
	addi	%v0, %zero, 0
fbgt_cont.51825:
	fabs	%f6, %f4
	flw	%f7, 72(%sp)
	fsw	%f0, 92(%sp)
	sw	%v0, 93(%sp)
	fsw	%f6, 94(%sp)
	fblt	%f6, %f7, fbgt_else.51826
	flw	%f8, 492(%zero)
	fblt	%f6, %f8, fbgt_else.51828
	flw	%f8, 491(%zero)
	fblt	%f6, %f8, fbgt_else.51830
	flw	%f8, 490(%zero)
	fblt	%f6, %f8, fbgt_else.51832
	flw	%f8, 489(%zero)
	fblt	%f6, %f8, fbgt_else.51834
	flw	%f8, 488(%zero)
	fblt	%f6, %f8, fbgt_else.51836
	flw	%f8, 487(%zero)
	fblt	%f6, %f8, fbgt_else.51838
	flw	%f8, 486(%zero)
	fblt	%f6, %f8, fbgt_else.51840
	flw	%f8, 485(%zero)
	fblt	%f6, %f8, fbgt_else.51842
	flw	%f8, 484(%zero)
	fblt	%f6, %f8, fbgt_else.51844
	flw	%f8, 483(%zero)
	fmov	%f1, %f8
	fmov	%f0, %f6
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
	j	fbgt_cont.51827
fbgt_else.51844:
	fmov	%f0, %f8
fbgt_cont.51845:
	j	fbgt_cont.51827
fbgt_else.51842:
	fmov	%f0, %f8
fbgt_cont.51843:
	j	fbgt_cont.51827
fbgt_else.51840:
	fmov	%f0, %f8
fbgt_cont.51841:
	j	fbgt_cont.51827
fbgt_else.51838:
	fmov	%f0, %f8
fbgt_cont.51839:
	j	fbgt_cont.51827
fbgt_else.51836:
	fmov	%f0, %f8
fbgt_cont.51837:
	j	fbgt_cont.51827
fbgt_else.51834:
	fmov	%f0, %f8
fbgt_cont.51835:
	j	fbgt_cont.51827
fbgt_else.51832:
	fmov	%f0, %f8
fbgt_cont.51833:
	j	fbgt_cont.51827
fbgt_else.51830:
	fmov	%f0, %f8
fbgt_cont.51831:
	j	fbgt_cont.51827
fbgt_else.51828:
	fmov	%f0, %f8
fbgt_cont.51829:
	j	fbgt_cont.51827
fbgt_else.51826:
	fmov	%f0, %f7
fbgt_cont.51827:
	flw	%f1, 94(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.51846
	fblt	%f1, %f0, fbgt_else.51848
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51850
	fblt	%f1, %f0, fbgt_else.51852
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
	j	fbgt_cont.51847
fbgt_else.51852:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
fbgt_cont.51853:
	j	fbgt_cont.51847
fbgt_else.51850:
	fmov	%f0, %f1
fbgt_cont.51851:
	j	fbgt_cont.51847
fbgt_else.51848:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51854
	fblt	%f1, %f0, fbgt_else.51856
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
	j	fbgt_cont.51847
fbgt_else.51856:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
fbgt_cont.51857:
	j	fbgt_cont.51847
fbgt_else.51854:
	fmov	%f0, %f1
fbgt_cont.51855:
fbgt_cont.51849:
	j	fbgt_cont.51847
fbgt_else.51846:
	fmov	%f0, %f1
fbgt_cont.51847:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.51858
	lw	%v0, 93(%sp)
	beqi	%v0, 0, bnei_else.51860
	addi	%v0, %zero, 0
	j	fbgt_cont.51859
bnei_else.51860:
	addi	%v0, %zero, 1
bnei_cont.51861:
	j	fbgt_cont.51859
fbgt_else.51858:
	lw	%v0, 93(%sp)
fbgt_cont.51859:
	fblt	%f0, %f1, fbgt_else.51862
	fsub	%f0, %f0, %f1
	j	fbgt_cont.51863
fbgt_else.51862:
fbgt_cont.51863:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.51864
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51865
fbgt_else.51864:
fbgt_cont.51865:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.51866
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 477(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 476(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 475(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.51867
fbgt_else.51866:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 472(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 471(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.51867:
	beqi	%v0, 0, bnei_else.51868
	j	bnei_cont.51869
bnei_else.51868:
	fneg	%f0, %f0
bnei_cont.51869:
	flw	%f4, 92(%sp)
	fmul	%f0, %f4, %f0
	fsw	%f0, 78(%zero)
	flw	%f0, 90(%sp)
	fabs	%f0, %f0
	flw	%f5, 72(%sp)
	fsw	%f0, 95(%sp)
	fblt	%f0, %f5, fbgt_else.51870
	flw	%f6, 492(%zero)
	fblt	%f0, %f6, fbgt_else.51872
	flw	%f6, 491(%zero)
	fblt	%f0, %f6, fbgt_else.51874
	flw	%f6, 490(%zero)
	fblt	%f0, %f6, fbgt_else.51876
	flw	%f6, 489(%zero)
	fblt	%f0, %f6, fbgt_else.51878
	flw	%f6, 488(%zero)
	fblt	%f0, %f6, fbgt_else.51880
	flw	%f6, 487(%zero)
	fblt	%f0, %f6, fbgt_else.51882
	flw	%f6, 486(%zero)
	fblt	%f0, %f6, fbgt_else.51884
	flw	%f6, 485(%zero)
	fblt	%f0, %f6, fbgt_else.51886
	flw	%f6, 484(%zero)
	fblt	%f0, %f6, fbgt_else.51888
	flw	%f6, 483(%zero)
	fmov	%f1, %f6
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub1.2626
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.51871
fbgt_else.51888:
	fmov	%f0, %f6
fbgt_cont.51889:
	j	fbgt_cont.51871
fbgt_else.51886:
	fmov	%f0, %f6
fbgt_cont.51887:
	j	fbgt_cont.51871
fbgt_else.51884:
	fmov	%f0, %f6
fbgt_cont.51885:
	j	fbgt_cont.51871
fbgt_else.51882:
	fmov	%f0, %f6
fbgt_cont.51883:
	j	fbgt_cont.51871
fbgt_else.51880:
	fmov	%f0, %f6
fbgt_cont.51881:
	j	fbgt_cont.51871
fbgt_else.51878:
	fmov	%f0, %f6
fbgt_cont.51879:
	j	fbgt_cont.51871
fbgt_else.51876:
	fmov	%f0, %f6
fbgt_cont.51877:
	j	fbgt_cont.51871
fbgt_else.51874:
	fmov	%f0, %f6
fbgt_cont.51875:
	j	fbgt_cont.51871
fbgt_else.51872:
	fmov	%f0, %f6
fbgt_cont.51873:
	j	fbgt_cont.51871
fbgt_else.51870:
	fmov	%f0, %f5
fbgt_cont.51871:
	flw	%f1, 95(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.51890
	fblt	%f1, %f0, fbgt_else.51892
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51894
	fblt	%f1, %f0, fbgt_else.51896
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.51891
fbgt_else.51896:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.51897:
	j	fbgt_cont.51891
fbgt_else.51894:
	fmov	%f0, %f1
fbgt_cont.51895:
	j	fbgt_cont.51891
fbgt_else.51892:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.51898
	fblt	%f1, %f0, fbgt_else.51900
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.51891
fbgt_else.51900:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2629
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.51901:
	j	fbgt_cont.51891
fbgt_else.51898:
	fmov	%f0, %f1
fbgt_cont.51899:
fbgt_cont.51893:
	j	fbgt_cont.51891
fbgt_else.51890:
	fmov	%f0, %f1
fbgt_cont.51891:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.51902
	addi	%v0, %zero, 0
	j	fbgt_cont.51903
fbgt_else.51902:
	addi	%v0, %zero, 1
fbgt_cont.51903:
	fblt	%f0, %f1, fbgt_else.51904
	fsub	%f0, %f0, %f1
	j	fbgt_cont.51905
fbgt_else.51904:
fbgt_cont.51905:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.51906
	beqi	%v0, 0, bnei_else.51908
	addi	%v0, %zero, 0
	j	fbgt_cont.51907
bnei_else.51908:
	addi	%v0, %zero, 1
bnei_cont.51909:
	j	fbgt_cont.51907
fbgt_else.51906:
fbgt_cont.51907:
	fblt	%f0, %f2, fbgt_else.51910
	fsub	%f0, %f1, %f0
	j	fbgt_cont.51911
fbgt_else.51910:
fbgt_cont.51911:
	flw	%f1, 74(%sp)
	fblt	%f1, %f0, fbgt_else.51912
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 472(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 471(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.51913
fbgt_else.51912:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 477(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 476(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 475(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.51913:
	beqi	%v0, 0, bnei_else.51914
	j	bnei_cont.51915
bnei_else.51914:
	fneg	%f0, %f0
bnei_cont.51915:
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
	jal	read_object.2784
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_net_item.2788
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.51916
	sw	%v0, 83(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_and_network.2792
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	bnei_cont.51917
bnei_else.51916:
bnei_cont.51917:
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_net_item.2788
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.51918
	lw	%v0, 0(%sp)
	sw	%v1, 96(%sp)
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	read_or_network.2790
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
	lw	%v1, 96(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.51919
bnei_else.51918:
	lw	%v0, 0(%sp)
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	min_caml_create_array
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
bnei_cont.51919:
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
	lw	%v0, 12(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	print_int_sub1.2641
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 98(%sp)
	blti	%v1, 10, bgti_else.51920
	blti	%v1, 20, bgti_else.51922
	blti	%v1, 30, bgti_else.51924
	blti	%v1, 40, bgti_else.51926
	addi	%a0, %v1, -40
	blti	%a0, 10, bgti_else.51928
	blti	%a0, 20, bgti_else.51930
	blti	%a0, 30, bgti_else.51932
	blti	%a0, 40, bgti_else.51934
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.51936
	blti	%a0, 20, bgti_else.51938
	blti	%a0, 30, bgti_else.51940
	blti	%a0, 40, bgti_else.51942
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.51944
	blti	%a0, 20, bgti_else.51946
	blti	%a0, 30, bgti_else.51948
	blti	%a0, 40, bgti_else.51950
	addi	%a0, %a0, -40
	addi	%v0, %a0, 0
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	print_int_sub2.2644
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	bgti_cont.51921
bgti_else.51950:
	addi	%v0, %a0, -30
bgti_cont.51951:
	j	bgti_cont.51921
bgti_else.51948:
	addi	%v0, %a0, -20
bgti_cont.51949:
	j	bgti_cont.51921
bgti_else.51946:
	addi	%v0, %a0, -10
bgti_cont.51947:
	j	bgti_cont.51921
bgti_else.51944:
	add	%v0, %zero, %a0
bgti_cont.51945:
	j	bgti_cont.51921
bgti_else.51942:
	addi	%v0, %a0, -30
bgti_cont.51943:
	j	bgti_cont.51921
bgti_else.51940:
	addi	%v0, %a0, -20
bgti_cont.51941:
	j	bgti_cont.51921
bgti_else.51938:
	addi	%v0, %a0, -10
bgti_cont.51939:
	j	bgti_cont.51921
bgti_else.51936:
	add	%v0, %zero, %a0
bgti_cont.51937:
	j	bgti_cont.51921
bgti_else.51934:
	addi	%v0, %a0, -30
bgti_cont.51935:
	j	bgti_cont.51921
bgti_else.51932:
	addi	%v0, %a0, -20
bgti_cont.51933:
	j	bgti_cont.51921
bgti_else.51930:
	addi	%v0, %a0, -10
bgti_cont.51931:
	j	bgti_cont.51921
bgti_else.51928:
	add	%v0, %zero, %a0
bgti_cont.51929:
	j	bgti_cont.51921
bgti_else.51926:
	addi	%v0, %v1, -30
bgti_cont.51927:
	j	bgti_cont.51921
bgti_else.51924:
	addi	%v0, %v1, -20
bgti_cont.51925:
	j	bgti_cont.51921
bgti_else.51922:
	addi	%v0, %v1, -10
bgti_cont.51923:
	j	bgti_cont.51921
bgti_else.51920:
	add	%v0, %zero, %v1
bgti_cont.51921:
	lw	%v1, 98(%sp)
	blt	%zero, %v1, bgt_else.51952
	addi	%v0, %v0, 48
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	min_caml_print_char
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	bgt_cont.51953
bgt_else.51952:
	lw	%a0, 1(%sp)
	sw	%v0, 99(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 100(%sp)
	addi	%sp, %sp, 101
	jal	print_int_sub1.2641
	addi	%sp, %sp, -101
	lw	%ra, 100(%sp)
	lw	%v1, 98(%sp)
	sw	%v0, 100(%sp)
	blti	%v1, 10, bgti_else.51954
	blti	%v1, 20, bgti_else.51956
	blti	%v1, 30, bgti_else.51958
	blti	%v1, 40, bgti_else.51960
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.51962
	blti	%v1, 20, bgti_else.51964
	blti	%v1, 30, bgti_else.51966
	blti	%v1, 40, bgti_else.51968
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.51970
	blti	%v1, 20, bgti_else.51972
	blti	%v1, 30, bgti_else.51974
	blti	%v1, 40, bgti_else.51976
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.51978
	blti	%v1, 20, bgti_else.51980
	blti	%v1, 30, bgti_else.51982
	blti	%v1, 40, bgti_else.51984
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 101(%sp)
	addi	%sp, %sp, 102
	jal	print_int_sub2.2644
	addi	%sp, %sp, -102
	lw	%ra, 101(%sp)
	j	bgti_cont.51955
bgti_else.51984:
	addi	%v0, %v1, -30
bgti_cont.51985:
	j	bgti_cont.51955
bgti_else.51982:
	addi	%v0, %v1, -20
bgti_cont.51983:
	j	bgti_cont.51955
bgti_else.51980:
	addi	%v0, %v1, -10
bgti_cont.51981:
	j	bgti_cont.51955
bgti_else.51978:
	add	%v0, %zero, %v1
bgti_cont.51979:
	j	bgti_cont.51955
bgti_else.51976:
	addi	%v0, %v1, -30
bgti_cont.51977:
	j	bgti_cont.51955
bgti_else.51974:
	addi	%v0, %v1, -20
bgti_cont.51975:
	j	bgti_cont.51955
bgti_else.51972:
	addi	%v0, %v1, -10
bgti_cont.51973:
	j	bgti_cont.51955
bgti_else.51970:
	add	%v0, %zero, %v1
bgti_cont.51971:
	j	bgti_cont.51955
bgti_else.51968:
	addi	%v0, %v1, -30
bgti_cont.51969:
	j	bgti_cont.51955
bgti_else.51966:
	addi	%v0, %v1, -20
bgti_cont.51967:
	j	bgti_cont.51955
bgti_else.51964:
	addi	%v0, %v1, -10
bgti_cont.51965:
	j	bgti_cont.51955
bgti_else.51962:
	add	%v0, %zero, %v1
bgti_cont.51963:
	j	bgti_cont.51955
bgti_else.51960:
	addi	%v0, %v1, -30
bgti_cont.51961:
	j	bgti_cont.51955
bgti_else.51958:
	addi	%v0, %v1, -20
bgti_cont.51959:
	j	bgti_cont.51955
bgti_else.51956:
	addi	%v0, %v1, -10
bgti_cont.51957:
	j	bgti_cont.51955
bgti_else.51954:
	add	%v0, %zero, %v1
bgti_cont.51955:
	lw	%v1, 100(%sp)
	blt	%zero, %v1, bgt_else.51986
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
	j	bgt_cont.51987
bgt_else.51986:
	sw	%v0, 101(%sp)
	blti	%v1, 10, bgti_else.51988
	blti	%v1, 20, bgti_else.51990
	blti	%v1, 30, bgti_else.51992
	blti	%v1, 40, bgti_else.51994
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.51996
	blti	%v1, 20, bgti_else.51998
	blti	%v1, 30, bgti_else.52000
	blti	%v1, 40, bgti_else.52002
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52004
	blti	%v1, 20, bgti_else.52006
	blti	%v1, 30, bgti_else.52008
	blti	%v1, 40, bgti_else.52010
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52012
	blti	%v1, 20, bgti_else.52014
	blti	%v1, 30, bgti_else.52016
	blti	%v1, 40, bgti_else.52018
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	print_int_sub2.2644
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	j	bgti_cont.51989
bgti_else.52018:
	addi	%v0, %v1, -30
bgti_cont.52019:
	j	bgti_cont.51989
bgti_else.52016:
	addi	%v0, %v1, -20
bgti_cont.52017:
	j	bgti_cont.51989
bgti_else.52014:
	addi	%v0, %v1, -10
bgti_cont.52015:
	j	bgti_cont.51989
bgti_else.52012:
	add	%v0, %zero, %v1
bgti_cont.52013:
	j	bgti_cont.51989
bgti_else.52010:
	addi	%v0, %v1, -30
bgti_cont.52011:
	j	bgti_cont.51989
bgti_else.52008:
	addi	%v0, %v1, -20
bgti_cont.52009:
	j	bgti_cont.51989
bgti_else.52006:
	addi	%v0, %v1, -10
bgti_cont.52007:
	j	bgti_cont.51989
bgti_else.52004:
	add	%v0, %zero, %v1
bgti_cont.52005:
	j	bgti_cont.51989
bgti_else.52002:
	addi	%v0, %v1, -30
bgti_cont.52003:
	j	bgti_cont.51989
bgti_else.52000:
	addi	%v0, %v1, -20
bgti_cont.52001:
	j	bgti_cont.51989
bgti_else.51998:
	addi	%v0, %v1, -10
bgti_cont.51999:
	j	bgti_cont.51989
bgti_else.51996:
	add	%v0, %zero, %v1
bgti_cont.51997:
	j	bgti_cont.51989
bgti_else.51994:
	addi	%v0, %v1, -30
bgti_cont.51995:
	j	bgti_cont.51989
bgti_else.51992:
	addi	%v0, %v1, -20
bgti_cont.51993:
	j	bgti_cont.51989
bgti_else.51990:
	addi	%v0, %v1, -10
bgti_cont.51991:
	j	bgti_cont.51989
bgti_else.51988:
	add	%v0, %zero, %v1
bgti_cont.51989:
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
bgt_cont.51987:
bgt_cont.51953:
	addi	%v0, %zero, 32
	sw	%v0, 102(%sp)
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	min_caml_print_char
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
	lw	%v0, 155(%zero)
	lw	%v1, 1(%sp)
	sw	%v0, 103(%sp)
	sw	%ra, 104(%sp)
	addi	%sp, %sp, 105
	jal	print_int_sub1.2641
	addi	%sp, %sp, -105
	lw	%ra, 104(%sp)
	lw	%v1, 103(%sp)
	sw	%v0, 104(%sp)
	blti	%v1, 10, bgti_else.52020
	blti	%v1, 20, bgti_else.52022
	blti	%v1, 30, bgti_else.52024
	blti	%v1, 40, bgti_else.52026
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52028
	blti	%v1, 20, bgti_else.52030
	blti	%v1, 30, bgti_else.52032
	blti	%v1, 40, bgti_else.52034
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52036
	blti	%v1, 20, bgti_else.52038
	blti	%v1, 30, bgti_else.52040
	blti	%v1, 40, bgti_else.52042
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52044
	blti	%v1, 20, bgti_else.52046
	blti	%v1, 30, bgti_else.52048
	blti	%v1, 40, bgti_else.52050
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 105(%sp)
	addi	%sp, %sp, 106
	jal	print_int_sub2.2644
	addi	%sp, %sp, -106
	lw	%ra, 105(%sp)
	j	bgti_cont.52021
bgti_else.52050:
	addi	%v0, %v1, -30
bgti_cont.52051:
	j	bgti_cont.52021
bgti_else.52048:
	addi	%v0, %v1, -20
bgti_cont.52049:
	j	bgti_cont.52021
bgti_else.52046:
	addi	%v0, %v1, -10
bgti_cont.52047:
	j	bgti_cont.52021
bgti_else.52044:
	add	%v0, %zero, %v1
bgti_cont.52045:
	j	bgti_cont.52021
bgti_else.52042:
	addi	%v0, %v1, -30
bgti_cont.52043:
	j	bgti_cont.52021
bgti_else.52040:
	addi	%v0, %v1, -20
bgti_cont.52041:
	j	bgti_cont.52021
bgti_else.52038:
	addi	%v0, %v1, -10
bgti_cont.52039:
	j	bgti_cont.52021
bgti_else.52036:
	add	%v0, %zero, %v1
bgti_cont.52037:
	j	bgti_cont.52021
bgti_else.52034:
	addi	%v0, %v1, -30
bgti_cont.52035:
	j	bgti_cont.52021
bgti_else.52032:
	addi	%v0, %v1, -20
bgti_cont.52033:
	j	bgti_cont.52021
bgti_else.52030:
	addi	%v0, %v1, -10
bgti_cont.52031:
	j	bgti_cont.52021
bgti_else.52028:
	add	%v0, %zero, %v1
bgti_cont.52029:
	j	bgti_cont.52021
bgti_else.52026:
	addi	%v0, %v1, -30
bgti_cont.52027:
	j	bgti_cont.52021
bgti_else.52024:
	addi	%v0, %v1, -20
bgti_cont.52025:
	j	bgti_cont.52021
bgti_else.52022:
	addi	%v0, %v1, -10
bgti_cont.52023:
	j	bgti_cont.52021
bgti_else.52020:
	add	%v0, %zero, %v1
bgti_cont.52021:
	lw	%v1, 104(%sp)
	blt	%zero, %v1, bgt_else.52052
	addi	%v0, %v0, 48
	sw	%ra, 105(%sp)
	addi	%sp, %sp, 106
	jal	min_caml_print_char
	addi	%sp, %sp, -106
	lw	%ra, 105(%sp)
	j	bgt_cont.52053
bgt_else.52052:
	lw	%a0, 1(%sp)
	sw	%v0, 105(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 106(%sp)
	addi	%sp, %sp, 107
	jal	print_int_sub1.2641
	addi	%sp, %sp, -107
	lw	%ra, 106(%sp)
	lw	%v1, 104(%sp)
	sw	%v0, 106(%sp)
	blti	%v1, 10, bgti_else.52054
	blti	%v1, 20, bgti_else.52056
	blti	%v1, 30, bgti_else.52058
	blti	%v1, 40, bgti_else.52060
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52062
	blti	%v1, 20, bgti_else.52064
	blti	%v1, 30, bgti_else.52066
	blti	%v1, 40, bgti_else.52068
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52070
	blti	%v1, 20, bgti_else.52072
	blti	%v1, 30, bgti_else.52074
	blti	%v1, 40, bgti_else.52076
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52078
	blti	%v1, 20, bgti_else.52080
	blti	%v1, 30, bgti_else.52082
	blti	%v1, 40, bgti_else.52084
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 107(%sp)
	addi	%sp, %sp, 108
	jal	print_int_sub2.2644
	addi	%sp, %sp, -108
	lw	%ra, 107(%sp)
	j	bgti_cont.52055
bgti_else.52084:
	addi	%v0, %v1, -30
bgti_cont.52085:
	j	bgti_cont.52055
bgti_else.52082:
	addi	%v0, %v1, -20
bgti_cont.52083:
	j	bgti_cont.52055
bgti_else.52080:
	addi	%v0, %v1, -10
bgti_cont.52081:
	j	bgti_cont.52055
bgti_else.52078:
	add	%v0, %zero, %v1
bgti_cont.52079:
	j	bgti_cont.52055
bgti_else.52076:
	addi	%v0, %v1, -30
bgti_cont.52077:
	j	bgti_cont.52055
bgti_else.52074:
	addi	%v0, %v1, -20
bgti_cont.52075:
	j	bgti_cont.52055
bgti_else.52072:
	addi	%v0, %v1, -10
bgti_cont.52073:
	j	bgti_cont.52055
bgti_else.52070:
	add	%v0, %zero, %v1
bgti_cont.52071:
	j	bgti_cont.52055
bgti_else.52068:
	addi	%v0, %v1, -30
bgti_cont.52069:
	j	bgti_cont.52055
bgti_else.52066:
	addi	%v0, %v1, -20
bgti_cont.52067:
	j	bgti_cont.52055
bgti_else.52064:
	addi	%v0, %v1, -10
bgti_cont.52065:
	j	bgti_cont.52055
bgti_else.52062:
	add	%v0, %zero, %v1
bgti_cont.52063:
	j	bgti_cont.52055
bgti_else.52060:
	addi	%v0, %v1, -30
bgti_cont.52061:
	j	bgti_cont.52055
bgti_else.52058:
	addi	%v0, %v1, -20
bgti_cont.52059:
	j	bgti_cont.52055
bgti_else.52056:
	addi	%v0, %v1, -10
bgti_cont.52057:
	j	bgti_cont.52055
bgti_else.52054:
	add	%v0, %zero, %v1
bgti_cont.52055:
	lw	%v1, 106(%sp)
	blt	%zero, %v1, bgt_else.52086
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
	j	bgt_cont.52087
bgt_else.52086:
	sw	%v0, 107(%sp)
	blti	%v1, 10, bgti_else.52088
	blti	%v1, 20, bgti_else.52090
	blti	%v1, 30, bgti_else.52092
	blti	%v1, 40, bgti_else.52094
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52096
	blti	%v1, 20, bgti_else.52098
	blti	%v1, 30, bgti_else.52100
	blti	%v1, 40, bgti_else.52102
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52104
	blti	%v1, 20, bgti_else.52106
	blti	%v1, 30, bgti_else.52108
	blti	%v1, 40, bgti_else.52110
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52112
	blti	%v1, 20, bgti_else.52114
	blti	%v1, 30, bgti_else.52116
	blti	%v1, 40, bgti_else.52118
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	print_int_sub2.2644
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	j	bgti_cont.52089
bgti_else.52118:
	addi	%v0, %v1, -30
bgti_cont.52119:
	j	bgti_cont.52089
bgti_else.52116:
	addi	%v0, %v1, -20
bgti_cont.52117:
	j	bgti_cont.52089
bgti_else.52114:
	addi	%v0, %v1, -10
bgti_cont.52115:
	j	bgti_cont.52089
bgti_else.52112:
	add	%v0, %zero, %v1
bgti_cont.52113:
	j	bgti_cont.52089
bgti_else.52110:
	addi	%v0, %v1, -30
bgti_cont.52111:
	j	bgti_cont.52089
bgti_else.52108:
	addi	%v0, %v1, -20
bgti_cont.52109:
	j	bgti_cont.52089
bgti_else.52106:
	addi	%v0, %v1, -10
bgti_cont.52107:
	j	bgti_cont.52089
bgti_else.52104:
	add	%v0, %zero, %v1
bgti_cont.52105:
	j	bgti_cont.52089
bgti_else.52102:
	addi	%v0, %v1, -30
bgti_cont.52103:
	j	bgti_cont.52089
bgti_else.52100:
	addi	%v0, %v1, -20
bgti_cont.52101:
	j	bgti_cont.52089
bgti_else.52098:
	addi	%v0, %v1, -10
bgti_cont.52099:
	j	bgti_cont.52089
bgti_else.52096:
	add	%v0, %zero, %v1
bgti_cont.52097:
	j	bgti_cont.52089
bgti_else.52094:
	addi	%v0, %v1, -30
bgti_cont.52095:
	j	bgti_cont.52089
bgti_else.52092:
	addi	%v0, %v1, -20
bgti_cont.52093:
	j	bgti_cont.52089
bgti_else.52090:
	addi	%v0, %v1, -10
bgti_cont.52091:
	j	bgti_cont.52089
bgti_else.52088:
	add	%v0, %zero, %v1
bgti_cont.52089:
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
bgt_cont.52087:
bgt_cont.52053:
	lw	%v0, 102(%sp)
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	min_caml_print_char
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	addi	%v0, %zero, 255
	lw	%v1, 1(%sp)
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	print_int_sub1.2641
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	addi	%v1, %zero, 95
	sw	%v0, 108(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	print_int_sub2.2644
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
	lw	%v1, 108(%sp)
	blt	%zero, %v1, bgt_else.52120
	addi	%v0, %v0, 48
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	min_caml_print_char
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
	j	bgt_cont.52121
bgt_else.52120:
	lw	%a0, 1(%sp)
	sw	%v0, 109(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 110(%sp)
	addi	%sp, %sp, 111
	jal	print_int_sub1.2641
	addi	%sp, %sp, -111
	lw	%ra, 110(%sp)
	lw	%v1, 108(%sp)
	sw	%v0, 110(%sp)
	blti	%v1, 10, bgti_else.52122
	blti	%v1, 20, bgti_else.52124
	blti	%v1, 30, bgti_else.52126
	blti	%v1, 40, bgti_else.52128
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52130
	blti	%v1, 20, bgti_else.52132
	blti	%v1, 30, bgti_else.52134
	blti	%v1, 40, bgti_else.52136
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52138
	blti	%v1, 20, bgti_else.52140
	blti	%v1, 30, bgti_else.52142
	blti	%v1, 40, bgti_else.52144
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52146
	blti	%v1, 20, bgti_else.52148
	blti	%v1, 30, bgti_else.52150
	blti	%v1, 40, bgti_else.52152
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 111(%sp)
	addi	%sp, %sp, 112
	jal	print_int_sub2.2644
	addi	%sp, %sp, -112
	lw	%ra, 111(%sp)
	j	bgti_cont.52123
bgti_else.52152:
	addi	%v0, %v1, -30
bgti_cont.52153:
	j	bgti_cont.52123
bgti_else.52150:
	addi	%v0, %v1, -20
bgti_cont.52151:
	j	bgti_cont.52123
bgti_else.52148:
	addi	%v0, %v1, -10
bgti_cont.52149:
	j	bgti_cont.52123
bgti_else.52146:
	add	%v0, %zero, %v1
bgti_cont.52147:
	j	bgti_cont.52123
bgti_else.52144:
	addi	%v0, %v1, -30
bgti_cont.52145:
	j	bgti_cont.52123
bgti_else.52142:
	addi	%v0, %v1, -20
bgti_cont.52143:
	j	bgti_cont.52123
bgti_else.52140:
	addi	%v0, %v1, -10
bgti_cont.52141:
	j	bgti_cont.52123
bgti_else.52138:
	add	%v0, %zero, %v1
bgti_cont.52139:
	j	bgti_cont.52123
bgti_else.52136:
	addi	%v0, %v1, -30
bgti_cont.52137:
	j	bgti_cont.52123
bgti_else.52134:
	addi	%v0, %v1, -20
bgti_cont.52135:
	j	bgti_cont.52123
bgti_else.52132:
	addi	%v0, %v1, -10
bgti_cont.52133:
	j	bgti_cont.52123
bgti_else.52130:
	add	%v0, %zero, %v1
bgti_cont.52131:
	j	bgti_cont.52123
bgti_else.52128:
	addi	%v0, %v1, -30
bgti_cont.52129:
	j	bgti_cont.52123
bgti_else.52126:
	addi	%v0, %v1, -20
bgti_cont.52127:
	j	bgti_cont.52123
bgti_else.52124:
	addi	%v0, %v1, -10
bgti_cont.52125:
	j	bgti_cont.52123
bgti_else.52122:
	add	%v0, %zero, %v1
bgti_cont.52123:
	lw	%v1, 110(%sp)
	blt	%zero, %v1, bgt_else.52154
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
	j	bgt_cont.52155
bgt_else.52154:
	sw	%v0, 111(%sp)
	blti	%v1, 10, bgti_else.52156
	blti	%v1, 20, bgti_else.52158
	blti	%v1, 30, bgti_else.52160
	blti	%v1, 40, bgti_else.52162
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52164
	blti	%v1, 20, bgti_else.52166
	blti	%v1, 30, bgti_else.52168
	blti	%v1, 40, bgti_else.52170
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52172
	blti	%v1, 20, bgti_else.52174
	blti	%v1, 30, bgti_else.52176
	blti	%v1, 40, bgti_else.52178
	addi	%v1, %v1, -40
	blti	%v1, 10, bgti_else.52180
	blti	%v1, 20, bgti_else.52182
	blti	%v1, 30, bgti_else.52184
	blti	%v1, 40, bgti_else.52186
	addi	%v1, %v1, -40
	addi	%v0, %v1, 0
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	print_int_sub2.2644
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	j	bgti_cont.52157
bgti_else.52186:
	addi	%v0, %v1, -30
bgti_cont.52187:
	j	bgti_cont.52157
bgti_else.52184:
	addi	%v0, %v1, -20
bgti_cont.52185:
	j	bgti_cont.52157
bgti_else.52182:
	addi	%v0, %v1, -10
bgti_cont.52183:
	j	bgti_cont.52157
bgti_else.52180:
	add	%v0, %zero, %v1
bgti_cont.52181:
	j	bgti_cont.52157
bgti_else.52178:
	addi	%v0, %v1, -30
bgti_cont.52179:
	j	bgti_cont.52157
bgti_else.52176:
	addi	%v0, %v1, -20
bgti_cont.52177:
	j	bgti_cont.52157
bgti_else.52174:
	addi	%v0, %v1, -10
bgti_cont.52175:
	j	bgti_cont.52157
bgti_else.52172:
	add	%v0, %zero, %v1
bgti_cont.52173:
	j	bgti_cont.52157
bgti_else.52170:
	addi	%v0, %v1, -30
bgti_cont.52171:
	j	bgti_cont.52157
bgti_else.52168:
	addi	%v0, %v1, -20
bgti_cont.52169:
	j	bgti_cont.52157
bgti_else.52166:
	addi	%v0, %v1, -10
bgti_cont.52167:
	j	bgti_cont.52157
bgti_else.52164:
	add	%v0, %zero, %v1
bgti_cont.52165:
	j	bgti_cont.52157
bgti_else.52162:
	addi	%v0, %v1, -30
bgti_cont.52163:
	j	bgti_cont.52157
bgti_else.52160:
	addi	%v0, %v1, -20
bgti_cont.52161:
	j	bgti_cont.52157
bgti_else.52158:
	addi	%v0, %v1, -10
bgti_cont.52159:
	j	bgti_cont.52157
bgti_else.52156:
	add	%v0, %zero, %v1
bgti_cont.52157:
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
bgt_cont.52155:
bgt_cont.52121:
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
	jal	create_dirvec_elements.3102
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	create_dirvecs.3105
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	addi	%v0, %zero, 9
	itof	%f0, %v0
	flw	%f1, 460(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 438(%zero)
	fsub	%f0, %f0, %f1
	lw	%v0, 11(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %v1, 0
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	addi	%v0, %zero, 8
	lw	%v1, 6(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	calc_dirvec_rows.3096
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	addi	%v1, %zero, 119
	lw	%v0, 115(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -117
	lw	%ra, 116(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 116(%sp)
	addi	%sp, %sp, 117
	jal	init_vecset_constants.3110
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
	blti	%v1, 0, bgti_else.52188
	lw	%a0, 12(%v1)
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.52190
	beqi	%a1, 2, bnei_else.52192
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
	beqi	%a0, 0, bnei_else.52194
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
	j	bnei_cont.52195
bnei_else.52194:
bnei_cont.52195:
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
	beqi	%a0, 0, bnei_else.52196
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 473(%zero)
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
	j	bnei_cont.52197
bnei_else.52196:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.52197:
	flw	%f0, 2(%sp)
	fbne	%f3, %f0, fbeq_else.52198
	addi	%v1, %zero, 1
	j	fbeq_cont.52199
fbeq_else.52198:
	addi	%v1, %zero, 0
fbeq_cont.52199:
	beqi	%v1, 0, bnei_else.52200
	j	bnei_cont.52201
bnei_else.52200:
	flw	%f1, 474(%zero)
	fdiv	%f1, %f1, %f3
	fsw	%f1, 4(%v0)
bnei_cont.52201:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
	j	bnei_cont.52191
bnei_else.52192:
	flw	%f3, 2(%sp)
	lw	%a1, 11(%sp)
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
	fblt	%f1, %f0, fbgt_else.52202
	addi	%a0, %zero, 0
	j	fbgt_cont.52203
fbgt_else.52202:
	addi	%a0, %zero, 1
fbgt_cont.52203:
	beqi	%a0, 0, bnei_else.52204
	flw	%f2, 468(%zero)
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
	j	bnei_cont.52205
bnei_else.52204:
	fsw	%f1, 0(%v0)
bnei_cont.52205:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
bnei_cont.52193:
	j	bnei_cont.52191
bnei_else.52190:
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
	fbne	%f0, %f1, fbeq_else.52206
	addi	%v1, %zero, 1
	j	fbeq_cont.52207
fbeq_else.52206:
	addi	%v1, %zero, 0
fbeq_cont.52207:
	beqi	%v1, 0, bnei_else.52208
	fsw	%f1, 1(%v0)
	j	bnei_cont.52209
bnei_else.52208:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.52210
	addi	%a1, %zero, 0
	j	fbgt_cont.52211
fbgt_else.52210:
	addi	%a1, %zero, 1
fbgt_cont.52211:
	beqi	%a0, 0, bnei_else.52212
	beqi	%a1, 0, bnei_else.52214
	addi	%a0, %zero, 0
	j	bnei_cont.52213
bnei_else.52214:
	addi	%a0, %zero, 1
bnei_cont.52215:
	j	bnei_cont.52213
bnei_else.52212:
	add	%a0, %zero, %a1
bnei_cont.52213:
	lw	%a1, 4(%v1)
	flw	%f2, 0(%a1)
	beqi	%a0, 0, bnei_else.52216
	j	bnei_cont.52217
bnei_else.52216:
	fneg	%f2, %f2
bnei_cont.52217:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.52209:
	flw	%f0, 185(%zero)
	fbne	%f0, %f1, fbeq_else.52218
	addi	%v1, %zero, 1
	j	fbeq_cont.52219
fbeq_else.52218:
	addi	%v1, %zero, 0
fbeq_cont.52219:
	beqi	%v1, 0, bnei_else.52220
	fsw	%f1, 3(%v0)
	j	bnei_cont.52221
bnei_else.52220:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.52222
	addi	%a1, %zero, 0
	j	fbgt_cont.52223
fbgt_else.52222:
	addi	%a1, %zero, 1
fbgt_cont.52223:
	beqi	%a0, 0, bnei_else.52224
	beqi	%a1, 0, bnei_else.52226
	addi	%a0, %zero, 0
	j	bnei_cont.52225
bnei_else.52226:
	addi	%a0, %zero, 1
bnei_cont.52227:
	j	bnei_cont.52225
bnei_else.52224:
	add	%a0, %zero, %a1
bnei_cont.52225:
	lw	%a1, 4(%v1)
	flw	%f2, 1(%a1)
	beqi	%a0, 0, bnei_else.52228
	j	bnei_cont.52229
bnei_else.52228:
	fneg	%f2, %f2
bnei_cont.52229:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.52221:
	flw	%f0, 186(%zero)
	fbne	%f0, %f1, fbeq_else.52230
	addi	%v1, %zero, 1
	j	fbeq_cont.52231
fbeq_else.52230:
	addi	%v1, %zero, 0
fbeq_cont.52231:
	beqi	%v1, 0, bnei_else.52232
	fsw	%f1, 5(%v0)
	j	bnei_cont.52233
bnei_else.52232:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.52234
	addi	%a1, %zero, 0
	j	fbgt_cont.52235
fbgt_else.52234:
	addi	%a1, %zero, 1
fbgt_cont.52235:
	beqi	%a0, 0, bnei_else.52236
	beqi	%a1, 0, bnei_else.52238
	addi	%a0, %zero, 0
	j	bnei_cont.52237
bnei_else.52238:
	addi	%a0, %zero, 1
bnei_cont.52239:
	j	bnei_cont.52237
bnei_else.52236:
	add	%a0, %zero, %a1
bnei_cont.52237:
	lw	%v1, 4(%v1)
	flw	%f2, 2(%v1)
	beqi	%a0, 0, bnei_else.52240
	j	bnei_cont.52241
bnei_else.52240:
	fneg	%f2, %f2
bnei_cont.52241:
	fsw	%f2, 4(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 5(%v0)
bnei_cont.52233:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
bnei_cont.52191:
	addi	%v0, %v1, -1
	addi	%a0, %zero, 247
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 121(%sp)
	addi	%sp, %sp, 122
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -122
	lw	%ra, 121(%sp)
	j	bgti_cont.52189
bgti_else.52188:
bgti_cont.52189:
	lw	%v0, 119(%sp)
	blti	%v0, 0, bgti_else.52242
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.52244
	j	bgti_cont.52243
bnei_else.52244:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 474(%zero)
	fblt	%f0, %f1, fbgt_else.52246
	addi	%a0, %zero, 0
	j	fbgt_cont.52247
fbgt_else.52246:
	addi	%a0, %zero, 1
fbgt_cont.52247:
	beqi	%a0, 0, bgti_cont.52243
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.52250
	beqi	%a0, 2, bnei_else.52252
	j	bgti_cont.52243
bnei_else.52252:
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
	jal	iter_setup_dirvec_constants.2889
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
bnei_cont.52253:
	j	bgti_cont.52243
bnei_else.52250:
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
	jal	iter_setup_dirvec_constants.2889
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
	jal	iter_setup_dirvec_constants.2889
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
	jal	iter_setup_dirvec_constants.2889
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
bnei_cont.52251:
	j	bgti_cont.52243
bnei_else.52248:
bnei_cont.52249:
bnei_cont.52245:
	j	bgti_cont.52243
bgti_else.52242:
bgti_cont.52243:
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
	lw	%v0, 12(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 49(%sp)
	fmov	%f29, %f2
	fmov	%f2, %f0
	fmov	%f0, %f1
	fmov	%f1, %f29
	sw	%ra, 146(%sp)
	addi	%sp, %sp, 147
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -147
	lw	%ra, 146(%sp)
	lw	%v0, 1(%sp)
	lw	%v1, 31(%sp)
	lw	%a0, 49(%sp)
	lw	%a1, 67(%sp)
	lw	%a2, 6(%sp)
	sw	%ra, 146(%sp)
	addi	%sp, %sp, 147
	jal	scan_line.3063
	addi	%sp, %sp, -147
	lw	%ra, 146(%sp)
	addi	%g0, %zero, 0
	ret
