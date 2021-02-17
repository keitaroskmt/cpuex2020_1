.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 44464
	lui	%hp, 0
	ori	%hp, %hp, 497
	lui	%k1, 0
	ori	%k1, %k1, 1
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	flw	%f30, 0(%hp)
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
	beqi	%a0, 0, create_array_exit
	sw	%v1, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%a0, 1, create_array_exit
	sw	%v1, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%a0, 2, create_array_exit
	sw	%v1, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%a0, 3, create_array_exit
	sw	%v1, 0(%hp)
	addi	%hp, %hp, 1
	addi	%a0, %a0, -4
	j	create_array_loop
create_array_exit:
	jr	%ra
#  min_caml_create_float_array
min_caml_create_float_array:
	addi	%v1, %v0, 0
	addi	%v0, %hp, 0
create_float_array_loop:
	beqi	%v1, 0, create_float_array_exit
	fsw	%f0, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%v1, 1, create_float_array_exit
	fsw	%f0, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%v1, 2, create_float_array_exit
	fsw	%f0, 0(%hp)
	addi	%hp, %hp, 1
	beqi	%v1, 3, create_float_array_exit
	fsw	%f0, 0(%hp)
	addi	%hp, %hp, 1
	addi	%v1, %v1, -4
	j	create_float_array_loop
create_float_array_exit:
	jr	%ra
#  min_caml_create_extarray
min_caml_create_extarray:
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0
create_extarray_loop:
	beqi	%a1, 0, create_extarray_exit
	sw	%v1, 0(%a0)
	addi	%a0, %a0, 1
	beqi	%a1, 1, create_extarray_exit
	sw	%v1, 0(%a0)
	addi	%a0, %a0, 1
	beqi	%a1, 2, create_extarray_exit
	sw	%v1, 0(%a0)
	addi	%a0, %a0, 1
	beqi	%a1, 3, create_extarray_exit
	sw	%v1, 0(%a0)
	addi	%a0, %a0, 1
	addi	%a1, %a1, -4
	j	create_extarray_loop
create_extarray_exit:
	jr	%ra
#  min_caml_create_float_extarray
min_caml_create_float_extarray:
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
create_float_extarray_loop:
	beqi	%a0, 0, create_float_extarray_exit
	fsw	%f0, 0(%v1)
	addi	%v1, %v1, 1
	beqi	%a0, 1, create_float_extarray_exit
	fsw	%f0, 0(%v1)
	addi	%v1, %v1, 1
	beqi	%a0, 2, create_float_extarray_exit
	fsw	%f0, 0(%v1)
	addi	%v1, %v1, 1
	beqi	%a0, 3, create_float_extarray_exit
	fsw	%f0, 0(%v1)
	addi	%v1, %v1, 1
	addi	%a0, %a0, -4
	j	create_float_extarray_loop
create_float_extarray_exit:
	jr	%ra
# ------------ body ---------------------------
reduction_2pi_sub1.2626:
	fblt	%f0, %f1, fbgt_else.21857
	flw	%f16, 496(%zero)
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21858
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21859
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21860
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21861
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21862
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21863
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21864
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21865
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21866
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21867
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21868
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21869
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21870
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21871
	fmul	%f1, %f16, %f1
	fblt	%f0, %f1, fbgt_else.21872
	fmul	%f1, %f16, %f1
	j	reduction_2pi_sub1.2626
fbgt_else.21872:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21871:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21870:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21869:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21868:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21867:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21866:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21865:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21864:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21863:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21862:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21861:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21860:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21859:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21858:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.21857:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2629:
	fblt	%f0, %f2, fbgt_else.21983
	fblt	%f0, %f1, fbgt_else.21984
	fsub	%f0, %f0, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.21985
	fblt	%f0, %f1, fbgt_else.21986
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.21987
	fblt	%f0, %f1, fbgt_else.21988
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.21989
	fblt	%f0, %f1, fbgt_else.21990
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.21990:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.21989:
	jr	%ra
fbgt_else.21988:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.21991
	fblt	%f0, %f1, fbgt_else.21992
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.21992:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.21991:
	jr	%ra
fbgt_else.21987:
	jr	%ra
fbgt_else.21986:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.21993
	fblt	%f0, %f1, fbgt_else.21994
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.21995
	fblt	%f0, %f1, fbgt_else.21996
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.21996:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.21995:
	jr	%ra
fbgt_else.21994:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.21997
	fblt	%f0, %f1, fbgt_else.21998
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.21998:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.21997:
	jr	%ra
fbgt_else.21993:
	jr	%ra
fbgt_else.21985:
	jr	%ra
fbgt_else.21984:
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.21999
	fblt	%f0, %f1, fbgt_else.22000
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.22001
	fblt	%f0, %f1, fbgt_else.22002
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.22003
	fblt	%f0, %f1, fbgt_else.22004
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.22004:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.22003:
	jr	%ra
fbgt_else.22002:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.22005
	fblt	%f0, %f1, fbgt_else.22006
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.22006:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.22005:
	jr	%ra
fbgt_else.22001:
	jr	%ra
fbgt_else.22000:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.22007
	fblt	%f0, %f1, fbgt_else.22008
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.22009
	fblt	%f0, %f1, fbgt_else.22010
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.22010:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.22009:
	jr	%ra
fbgt_else.22008:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f2, fbgt_else.22011
	fblt	%f0, %f1, fbgt_else.22012
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.22012:
	fdiv	%f1, %f1, %f16
	j	reduction_2pi_sub2.2629
fbgt_else.22011:
	jr	%ra
fbgt_else.22007:
	jr	%ra
fbgt_else.21999:
	jr	%ra
fbgt_else.21983:
	jr	%ra
cos.2635:
	add	%a0, %zero, %ra
	flw	%f18, 495(%zero)
	fabs	%f17, %f0
	flw	%f2, 494(%zero)
	fblt	%f17, %f2, fbgt_else.22114
	flw	%f0, 493(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 483(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 482(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f0, 481(%zero)
	fblt	%f17, %f0, fbgt_cont.22115
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.22115
fbgt_else.22140:
fbgt_cont.22141:
	j	fbgt_cont.22115
fbgt_else.22138:
fbgt_cont.22139:
	j	fbgt_cont.22115
fbgt_else.22136:
fbgt_cont.22137:
	j	fbgt_cont.22115
fbgt_else.22134:
fbgt_cont.22135:
	j	fbgt_cont.22115
fbgt_else.22132:
fbgt_cont.22133:
	j	fbgt_cont.22115
fbgt_else.22130:
fbgt_cont.22131:
	j	fbgt_cont.22115
fbgt_else.22128:
fbgt_cont.22129:
	j	fbgt_cont.22115
fbgt_else.22126:
fbgt_cont.22127:
	j	fbgt_cont.22115
fbgt_else.22124:
fbgt_cont.22125:
	j	fbgt_cont.22115
fbgt_else.22122:
fbgt_cont.22123:
	j	fbgt_cont.22115
fbgt_else.22120:
fbgt_cont.22121:
	j	fbgt_cont.22115
fbgt_else.22118:
fbgt_cont.22119:
	j	fbgt_cont.22115
fbgt_else.22116:
fbgt_cont.22117:
	j	fbgt_cont.22115
fbgt_else.22114:
	fmov	%f0, %f2
fbgt_cont.22115:
	fblt	%f17, %f2, fbgt_else.22142
	fblt	%f17, %f0, fbgt_else.22144
	fsub	%f17, %f17, %f0
	flw	%f16, 496(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.22143
	fblt	%f17, %f1, fbgt_else.22148
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.22143
fbgt_else.22148:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.22149:
	j	fbgt_cont.22143
fbgt_else.22146:
fbgt_cont.22147:
	j	fbgt_cont.22143
fbgt_else.22144:
	flw	%f16, 496(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.22143
	fblt	%f17, %f1, fbgt_else.22152
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.22143
fbgt_else.22152:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.22153:
	j	fbgt_cont.22143
fbgt_else.22150:
fbgt_cont.22151:
fbgt_cont.22145:
	j	fbgt_cont.22143
fbgt_else.22142:
fbgt_cont.22143:
	fblt	%f17, %f18, fbgt_else.22154
	add	%a1, %zero, %zero
	j	fbgt_cont.22155
fbgt_else.22154:
	add	%a1, %zero, %k1
fbgt_cont.22155:
	fblt	%f17, %f18, fbgt_else.22156
	fsub	%f17, %f17, %f18
	j	fbgt_cont.22157
fbgt_else.22156:
fbgt_cont.22157:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.22158
	beqi	%a1, 0, bnei_else.22160
	add	%a1, %zero, %zero
	j	fbgt_cont.22159
bnei_else.22160:
	add	%a1, %zero, %k1
bnei_cont.22161:
	j	fbgt_cont.22159
fbgt_else.22158:
fbgt_cont.22159:
	fblt	%f17, %f1, fbgt_else.22162
	fsub	%f17, %f18, %f17
	j	fbgt_cont.22163
fbgt_else.22162:
fbgt_cont.22163:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.22164
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.22165
fbgt_else.22164:
	fsub	%f18, %f1, %f17
	fmul	%f17, %f18, %f18
	fmul	%f16, %f17, %f17
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.22165:
	beqi	%a1, 0, bnei_else.22166
	add	%ra, %zero, %a0
	jr	%ra
bnei_else.22166:
	add	%ra, %zero, %a0
	fneg	%f0, %f0
	jr	%ra
sin.2637:
	add	%a0, %zero, %ra
	flw	%f18, 495(%zero)
	fblt	%f0, %fzero, fbgt_else.22268
	add	%a1, %zero, %k1
	j	fbgt_cont.22269
fbgt_else.22268:
	add	%a1, %zero, %zero
fbgt_cont.22269:
	fabs	%f17, %f0
	flw	%f2, 494(%zero)
	fblt	%f17, %f2, fbgt_else.22270
	flw	%f0, 493(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 483(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 482(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f0, 481(%zero)
	fblt	%f17, %f0, fbgt_cont.22271
	flw	%f1, 480(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.22271
fbgt_else.22296:
fbgt_cont.22297:
	j	fbgt_cont.22271
fbgt_else.22294:
fbgt_cont.22295:
	j	fbgt_cont.22271
fbgt_else.22292:
fbgt_cont.22293:
	j	fbgt_cont.22271
fbgt_else.22290:
fbgt_cont.22291:
	j	fbgt_cont.22271
fbgt_else.22288:
fbgt_cont.22289:
	j	fbgt_cont.22271
fbgt_else.22286:
fbgt_cont.22287:
	j	fbgt_cont.22271
fbgt_else.22284:
fbgt_cont.22285:
	j	fbgt_cont.22271
fbgt_else.22282:
fbgt_cont.22283:
	j	fbgt_cont.22271
fbgt_else.22280:
fbgt_cont.22281:
	j	fbgt_cont.22271
fbgt_else.22278:
fbgt_cont.22279:
	j	fbgt_cont.22271
fbgt_else.22276:
fbgt_cont.22277:
	j	fbgt_cont.22271
fbgt_else.22274:
fbgt_cont.22275:
	j	fbgt_cont.22271
fbgt_else.22272:
fbgt_cont.22273:
	j	fbgt_cont.22271
fbgt_else.22270:
	fmov	%f0, %f2
fbgt_cont.22271:
	fblt	%f17, %f2, fbgt_else.22298
	fblt	%f17, %f0, fbgt_else.22300
	fsub	%f17, %f17, %f0
	flw	%f16, 496(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.22299
	fblt	%f17, %f1, fbgt_else.22304
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.22299
fbgt_else.22304:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.22305:
	j	fbgt_cont.22299
fbgt_else.22302:
fbgt_cont.22303:
	j	fbgt_cont.22299
fbgt_else.22300:
	flw	%f16, 496(%zero)
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f2, fbgt_cont.22299
	fblt	%f17, %f1, fbgt_else.22308
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.22299
fbgt_else.22308:
	fdiv	%f1, %f1, %f16
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.22309:
	j	fbgt_cont.22299
fbgt_else.22306:
fbgt_cont.22307:
fbgt_cont.22301:
	j	fbgt_cont.22299
fbgt_else.22298:
fbgt_cont.22299:
	fblt	%f17, %f18, fbgt_else.22310
	beqi	%a1, 0, bnei_else.22312
	add	%a1, %zero, %zero
	j	fbgt_cont.22311
bnei_else.22312:
	add	%a1, %zero, %k1
bnei_cont.22313:
	j	fbgt_cont.22311
fbgt_else.22310:
fbgt_cont.22311:
	fblt	%f17, %f18, fbgt_else.22314
	fsub	%f17, %f17, %f18
	j	fbgt_cont.22315
fbgt_else.22314:
fbgt_cont.22315:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.22316
	fsub	%f17, %f18, %f17
	j	fbgt_cont.22317
fbgt_else.22316:
fbgt_cont.22317:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.22318
	fmul	%f18, %f17, %f17
	fmul	%f16, %f18, %f18
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f18
	fsub	%f1, %f17, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.22319
fbgt_else.22318:
	fsub	%f0, %f1, %f17
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.22319:
	beqi	%a1, 0, bnei_else.22320
	add	%ra, %zero, %a0
	jr	%ra
bnei_else.22320:
	add	%ra, %zero, %a0
	fneg	%f0, %f0
	jr	%ra
atan.2639:
	fblt	%f0, %fzero, fbgt_else.22353
	add	%a0, %zero, %k1
	j	fbgt_cont.22354
fbgt_else.22353:
	add	%a0, %zero, %zero
fbgt_cont.22354:
	fabs	%f17, %f0
	flw	%f1, 469(%zero)
	fblt	%f17, %f1, fbgt_else.22355
	flw	%f0, 462(%zero)
	fblt	%f17, %f0, fbgt_else.22356
	flw	%f16, 479(%zero)
	fdiv	%f19, %f30, %f17
	fmul	%f2, %f19, %f19
	fmul	%f18, %f2, %f2
	fmul	%f17, %f18, %f18
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fsub	%f1, %f19, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	fsub	%f0, %f16, %f0
	j	fbgt_cont.22357
fbgt_else.22356:
	flw	%f16, 478(%zero)
	fsub	%f1, %f17, %f30
	fadd	%f0, %f17, %f30
	fdiv	%f19, %f1, %f0
	fmul	%f2, %f19, %f19
	fmul	%f18, %f2, %f2
	fmul	%f17, %f18, %f18
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fsub	%f1, %f19, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
fbgt_cont.22357:
	beqi	%a0, 0, bnei_else.22358
	jr	%ra
bnei_else.22358:
	fneg	%f0, %f0
	jr	%ra
fbgt_else.22355:
	fmul	%f19, %f0, %f0
	fmul	%f18, %f19, %f19
	fmul	%f17, %f18, %f18
	flw	%f1, 468(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fsub	%f16, %f0, %f1
	flw	%f1, 467(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f18
	fadd	%f16, %f16, %f1
	flw	%f1, 466(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f18
	fsub	%f16, %f16, %f1
	flw	%f1, 465(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 464(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f19
	fmul	%f1, %f1, %f17
	fsub	%f16, %f16, %f1
	flw	%f1, 463(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fadd	%f0, %f16, %f0
	jr	%ra
print_int_sub1.2641:
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1
	blti	%a0, 10, bgti_else.22427
	blti	%a0, 20, bgti_else.22428
	blti	%a0, 30, bgti_else.22429
	blti	%a0, 40, bgti_else.22430
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.22431
	blti	%a0, 20, bgti_else.22432
	blti	%a0, 30, bgti_else.22433
	blti	%a0, 40, bgti_else.22434
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.22435
	blti	%a0, 20, bgti_else.22436
	blti	%a0, 30, bgti_else.22437
	blti	%a0, 40, bgti_else.22438
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4
	blti	%a0, 10, bgti_else.22439
	blti	%a0, 20, bgti_else.22440
	blti	%a0, 30, bgti_else.22441
	blti	%a0, 40, bgti_else.22442
	addi	%a0, %a0, -40
	addi	%v1, %v0, 4
	addi	%v0, %a0, 0
	j	print_int_sub1.2641
bgti_else.22442:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.22441:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.22440:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.22439:
	jr	%ra
bgti_else.22438:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.22437:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.22436:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.22435:
	jr	%ra
bgti_else.22434:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.22433:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.22432:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.22431:
	jr	%ra
bgti_else.22430:
	addi	%v0, %v0, 3
	jr	%ra
bgti_else.22429:
	addi	%v0, %v0, 2
	jr	%ra
bgti_else.22428:
	addi	%v0, %v0, 1
	jr	%ra
bgti_else.22427:
	jr	%ra
print_int_sub2.2644:
	blti	%v0, 10, bgti_else.22559
	blti	%v0, 20, bgti_else.22560
	blti	%v0, 30, bgti_else.22561
	blti	%v0, 40, bgti_else.22562
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22563
	blti	%v0, 20, bgti_else.22564
	blti	%v0, 30, bgti_else.22565
	blti	%v0, 40, bgti_else.22566
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22567
	blti	%v0, 20, bgti_else.22568
	blti	%v0, 30, bgti_else.22569
	blti	%v0, 40, bgti_else.22570
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22571
	blti	%v0, 20, bgti_else.22572
	blti	%v0, 30, bgti_else.22573
	blti	%v0, 40, bgti_else.22574
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22575
	blti	%v0, 20, bgti_else.22576
	blti	%v0, 30, bgti_else.22577
	blti	%v0, 40, bgti_else.22578
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22579
	blti	%v0, 20, bgti_else.22580
	blti	%v0, 30, bgti_else.22581
	blti	%v0, 40, bgti_else.22582
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22583
	blti	%v0, 20, bgti_else.22584
	blti	%v0, 30, bgti_else.22585
	blti	%v0, 40, bgti_else.22586
	addi	%v0, %v0, -40
	blti	%v0, 10, bgti_else.22587
	blti	%v0, 20, bgti_else.22588
	blti	%v0, 30, bgti_else.22589
	blti	%v0, 40, bgti_else.22590
	addi	%v0, %v0, -40
	j	print_int_sub2.2644
bgti_else.22590:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22589:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22588:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22587:
	jr	%ra
bgti_else.22586:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22585:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22584:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22583:
	jr	%ra
bgti_else.22582:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22581:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22580:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22579:
	jr	%ra
bgti_else.22578:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22577:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22576:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22575:
	jr	%ra
bgti_else.22574:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22573:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22572:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22571:
	jr	%ra
bgti_else.22570:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22569:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22568:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22567:
	jr	%ra
bgti_else.22566:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22565:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22564:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22563:
	jr	%ra
bgti_else.22562:
	addi	%v0, %v0, -30
	jr	%ra
bgti_else.22561:
	addi	%v0, %v0, -20
	jr	%ra
bgti_else.22560:
	addi	%v0, %v0, -10
	jr	%ra
bgti_else.22559:
	jr	%ra
print_int.2646:
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra
	blti	%a1, 10, bgti_else.22941
	blti	%a1, 20, bgti_else.22943
	blti	%a1, 30, bgti_else.22945
	blti	%a1, 40, bgti_else.22947
	addi	%a0, %a1, -40
	blti	%a0, 10, bgti_else.22949
	blti	%a0, 20, bgti_else.22951
	blti	%a0, 30, bgti_else.22953
	blti	%a0, 40, bgti_else.22955
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.22957
	blti	%a0, 20, bgti_else.22959
	blti	%a0, 30, bgti_else.22961
	blti	%a0, 40, bgti_else.22963
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	jal	print_int_sub1.2641
	addi	%a3, %v0, 0
	j	bgti_cont.22942
bgti_else.22963:
	addi	%a3, %zero, 11
bgti_cont.22964:
	j	bgti_cont.22942
bgti_else.22961:
	addi	%a3, %zero, 10
bgti_cont.22962:
	j	bgti_cont.22942
bgti_else.22959:
	addi	%a3, %zero, 9
bgti_cont.22960:
	j	bgti_cont.22942
bgti_else.22957:
	addi	%a3, %zero, 8
bgti_cont.22958:
	j	bgti_cont.22942
bgti_else.22955:
	addi	%a3, %zero, 7
bgti_cont.22956:
	j	bgti_cont.22942
bgti_else.22953:
	addi	%a3, %zero, 6
bgti_cont.22954:
	j	bgti_cont.22942
bgti_else.22951:
	addi	%a3, %zero, 5
bgti_cont.22952:
	j	bgti_cont.22942
bgti_else.22949:
	addi	%a3, %zero, 4
bgti_cont.22950:
	j	bgti_cont.22942
bgti_else.22947:
	addi	%a3, %zero, 3
bgti_cont.22948:
	j	bgti_cont.22942
bgti_else.22945:
	addi	%a3, %zero, 2
bgti_cont.22946:
	j	bgti_cont.22942
bgti_else.22943:
	add	%a3, %zero, %k1
bgti_cont.22944:
	j	bgti_cont.22942
bgti_else.22941:
	add	%a3, %zero, %zero
bgti_cont.22942:
	blti	%a1, 10, bgti_else.22965
	blti	%a1, 20, bgti_else.22967
	blti	%a1, 30, bgti_else.22969
	blti	%a1, 40, bgti_else.22971
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.22966
	blti	%a1, 20, bgti_else.22975
	blti	%a1, 30, bgti_else.22977
	blti	%a1, 40, bgti_else.22979
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.22966
	blti	%a1, 20, bgti_else.22983
	blti	%a1, 30, bgti_else.22985
	blti	%a1, 40, bgti_else.22987
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.22966
	blti	%a1, 20, bgti_else.22991
	blti	%a1, 30, bgti_else.22993
	blti	%a1, 40, bgti_else.22995
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.22966
	blti	%a1, 20, bgti_else.22999
	blti	%a1, 30, bgti_else.23001
	blti	%a1, 40, bgti_else.23003
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.22966
	blti	%a1, 20, bgti_else.23007
	blti	%a1, 30, bgti_else.23009
	blti	%a1, 40, bgti_else.23011
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.22966
	blti	%a1, 20, bgti_else.23015
	blti	%a1, 30, bgti_else.23017
	blti	%a1, 40, bgti_else.23019
	addi	%v0, %a1, -40
	jal	print_int_sub2.2644
	addi	%a1, %v0, 0
	j	bgti_cont.22966
bgti_else.23019:
	addi	%a1, %a1, -30
bgti_cont.23020:
	j	bgti_cont.22966
bgti_else.23017:
	addi	%a1, %a1, -20
bgti_cont.23018:
	j	bgti_cont.22966
bgti_else.23015:
	addi	%a1, %a1, -10
bgti_cont.23016:
	j	bgti_cont.22966
bgti_else.23013:
bgti_cont.23014:
	j	bgti_cont.22966
bgti_else.23011:
	addi	%a1, %a1, -30
bgti_cont.23012:
	j	bgti_cont.22966
bgti_else.23009:
	addi	%a1, %a1, -20
bgti_cont.23010:
	j	bgti_cont.22966
bgti_else.23007:
	addi	%a1, %a1, -10
bgti_cont.23008:
	j	bgti_cont.22966
bgti_else.23005:
bgti_cont.23006:
	j	bgti_cont.22966
bgti_else.23003:
	addi	%a1, %a1, -30
bgti_cont.23004:
	j	bgti_cont.22966
bgti_else.23001:
	addi	%a1, %a1, -20
bgti_cont.23002:
	j	bgti_cont.22966
bgti_else.22999:
	addi	%a1, %a1, -10
bgti_cont.23000:
	j	bgti_cont.22966
bgti_else.22997:
bgti_cont.22998:
	j	bgti_cont.22966
bgti_else.22995:
	addi	%a1, %a1, -30
bgti_cont.22996:
	j	bgti_cont.22966
bgti_else.22993:
	addi	%a1, %a1, -20
bgti_cont.22994:
	j	bgti_cont.22966
bgti_else.22991:
	addi	%a1, %a1, -10
bgti_cont.22992:
	j	bgti_cont.22966
bgti_else.22989:
bgti_cont.22990:
	j	bgti_cont.22966
bgti_else.22987:
	addi	%a1, %a1, -30
bgti_cont.22988:
	j	bgti_cont.22966
bgti_else.22985:
	addi	%a1, %a1, -20
bgti_cont.22986:
	j	bgti_cont.22966
bgti_else.22983:
	addi	%a1, %a1, -10
bgti_cont.22984:
	j	bgti_cont.22966
bgti_else.22981:
bgti_cont.22982:
	j	bgti_cont.22966
bgti_else.22979:
	addi	%a1, %a1, -30
bgti_cont.22980:
	j	bgti_cont.22966
bgti_else.22977:
	addi	%a1, %a1, -20
bgti_cont.22978:
	j	bgti_cont.22966
bgti_else.22975:
	addi	%a1, %a1, -10
bgti_cont.22976:
	j	bgti_cont.22966
bgti_else.22973:
bgti_cont.22974:
	j	bgti_cont.22966
bgti_else.22971:
	addi	%a1, %a1, -30
bgti_cont.22972:
	j	bgti_cont.22966
bgti_else.22969:
	addi	%a1, %a1, -20
bgti_cont.22970:
	j	bgti_cont.22966
bgti_else.22967:
	addi	%a1, %a1, -10
bgti_cont.22968:
	j	bgti_cont.22966
bgti_else.22965:
bgti_cont.22966:
	blt	%zero, %a3, bgt_else.23021
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2
	j	min_caml_print_char
bgt_else.23021:
	blti	%a3, 10, bgti_else.23022
	blti	%a3, 20, bgti_else.23024
	blti	%a3, 30, bgti_else.23026
	blti	%a3, 40, bgti_else.23028
	addi	%a0, %a3, -40
	blti	%a0, 10, bgti_else.23030
	blti	%a0, 20, bgti_else.23032
	blti	%a0, 30, bgti_else.23034
	blti	%a0, 40, bgti_else.23036
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_else.23038
	blti	%a0, 20, bgti_else.23040
	blti	%a0, 30, bgti_else.23042
	blti	%a0, 40, bgti_else.23044
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12
	jal	print_int_sub1.2641
	addi	%a0, %v0, 0
	j	bgti_cont.23023
bgti_else.23044:
	addi	%a0, %zero, 11
bgti_cont.23045:
	j	bgti_cont.23023
bgti_else.23042:
	addi	%a0, %zero, 10
bgti_cont.23043:
	j	bgti_cont.23023
bgti_else.23040:
	addi	%a0, %zero, 9
bgti_cont.23041:
	j	bgti_cont.23023
bgti_else.23038:
	addi	%a0, %zero, 8
bgti_cont.23039:
	j	bgti_cont.23023
bgti_else.23036:
	addi	%a0, %zero, 7
bgti_cont.23037:
	j	bgti_cont.23023
bgti_else.23034:
	addi	%a0, %zero, 6
bgti_cont.23035:
	j	bgti_cont.23023
bgti_else.23032:
	addi	%a0, %zero, 5
bgti_cont.23033:
	j	bgti_cont.23023
bgti_else.23030:
	addi	%a0, %zero, 4
bgti_cont.23031:
	j	bgti_cont.23023
bgti_else.23028:
	addi	%a0, %zero, 3
bgti_cont.23029:
	j	bgti_cont.23023
bgti_else.23026:
	addi	%a0, %zero, 2
bgti_cont.23027:
	j	bgti_cont.23023
bgti_else.23024:
	add	%a0, %zero, %k1
bgti_cont.23025:
	j	bgti_cont.23023
bgti_else.23022:
	add	%a0, %zero, %zero
bgti_cont.23023:
	blti	%a3, 10, bgti_else.23046
	blti	%a3, 20, bgti_else.23048
	blti	%a3, 30, bgti_else.23050
	blti	%a3, 40, bgti_else.23052
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.23047
	blti	%a3, 20, bgti_else.23056
	blti	%a3, 30, bgti_else.23058
	blti	%a3, 40, bgti_else.23060
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.23047
	blti	%a3, 20, bgti_else.23064
	blti	%a3, 30, bgti_else.23066
	blti	%a3, 40, bgti_else.23068
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.23047
	blti	%a3, 20, bgti_else.23072
	blti	%a3, 30, bgti_else.23074
	blti	%a3, 40, bgti_else.23076
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.23047
	blti	%a3, 20, bgti_else.23080
	blti	%a3, 30, bgti_else.23082
	blti	%a3, 40, bgti_else.23084
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.23047
	blti	%a3, 20, bgti_else.23088
	blti	%a3, 30, bgti_else.23090
	blti	%a3, 40, bgti_else.23092
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.23047
	blti	%a3, 20, bgti_else.23096
	blti	%a3, 30, bgti_else.23098
	blti	%a3, 40, bgti_else.23100
	addi	%v0, %a3, -40
	jal	print_int_sub2.2644
	addi	%a3, %v0, 0
	j	bgti_cont.23047
bgti_else.23100:
	addi	%a3, %a3, -30
bgti_cont.23101:
	j	bgti_cont.23047
bgti_else.23098:
	addi	%a3, %a3, -20
bgti_cont.23099:
	j	bgti_cont.23047
bgti_else.23096:
	addi	%a3, %a3, -10
bgti_cont.23097:
	j	bgti_cont.23047
bgti_else.23094:
bgti_cont.23095:
	j	bgti_cont.23047
bgti_else.23092:
	addi	%a3, %a3, -30
bgti_cont.23093:
	j	bgti_cont.23047
bgti_else.23090:
	addi	%a3, %a3, -20
bgti_cont.23091:
	j	bgti_cont.23047
bgti_else.23088:
	addi	%a3, %a3, -10
bgti_cont.23089:
	j	bgti_cont.23047
bgti_else.23086:
bgti_cont.23087:
	j	bgti_cont.23047
bgti_else.23084:
	addi	%a3, %a3, -30
bgti_cont.23085:
	j	bgti_cont.23047
bgti_else.23082:
	addi	%a3, %a3, -20
bgti_cont.23083:
	j	bgti_cont.23047
bgti_else.23080:
	addi	%a3, %a3, -10
bgti_cont.23081:
	j	bgti_cont.23047
bgti_else.23078:
bgti_cont.23079:
	j	bgti_cont.23047
bgti_else.23076:
	addi	%a3, %a3, -30
bgti_cont.23077:
	j	bgti_cont.23047
bgti_else.23074:
	addi	%a3, %a3, -20
bgti_cont.23075:
	j	bgti_cont.23047
bgti_else.23072:
	addi	%a3, %a3, -10
bgti_cont.23073:
	j	bgti_cont.23047
bgti_else.23070:
bgti_cont.23071:
	j	bgti_cont.23047
bgti_else.23068:
	addi	%a3, %a3, -30
bgti_cont.23069:
	j	bgti_cont.23047
bgti_else.23066:
	addi	%a3, %a3, -20
bgti_cont.23067:
	j	bgti_cont.23047
bgti_else.23064:
	addi	%a3, %a3, -10
bgti_cont.23065:
	j	bgti_cont.23047
bgti_else.23062:
bgti_cont.23063:
	j	bgti_cont.23047
bgti_else.23060:
	addi	%a3, %a3, -30
bgti_cont.23061:
	j	bgti_cont.23047
bgti_else.23058:
	addi	%a3, %a3, -20
bgti_cont.23059:
	j	bgti_cont.23047
bgti_else.23056:
	addi	%a3, %a3, -10
bgti_cont.23057:
	j	bgti_cont.23047
bgti_else.23054:
bgti_cont.23055:
	j	bgti_cont.23047
bgti_else.23052:
	addi	%a3, %a3, -30
bgti_cont.23053:
	j	bgti_cont.23047
bgti_else.23050:
	addi	%a3, %a3, -20
bgti_cont.23051:
	j	bgti_cont.23047
bgti_else.23048:
	addi	%a3, %a3, -10
bgti_cont.23049:
	j	bgti_cont.23047
bgti_else.23046:
bgti_cont.23047:
	blt	%zero, %a0, bgt_else.23102
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2
	j	min_caml_print_char
bgt_else.23102:
	blti	%a0, 10, bgti_else.23103
	blti	%a0, 20, bgti_else.23105
	blti	%a0, 30, bgti_else.23107
	blti	%a0, 40, bgti_else.23109
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.23104
	blti	%a0, 20, bgti_else.23113
	blti	%a0, 30, bgti_else.23115
	blti	%a0, 40, bgti_else.23117
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.23104
	blti	%a0, 20, bgti_else.23121
	blti	%a0, 30, bgti_else.23123
	blti	%a0, 40, bgti_else.23125
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.23104
	blti	%a0, 20, bgti_else.23129
	blti	%a0, 30, bgti_else.23131
	blti	%a0, 40, bgti_else.23133
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.23104
	blti	%a0, 20, bgti_else.23137
	blti	%a0, 30, bgti_else.23139
	blti	%a0, 40, bgti_else.23141
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.23104
	blti	%a0, 20, bgti_else.23145
	blti	%a0, 30, bgti_else.23147
	blti	%a0, 40, bgti_else.23149
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.23104
	blti	%a0, 20, bgti_else.23153
	blti	%a0, 30, bgti_else.23155
	blti	%a0, 40, bgti_else.23157
	addi	%v0, %a0, -40
	jal	print_int_sub2.2644
	addi	%a0, %v0, 0
	j	bgti_cont.23104
bgti_else.23157:
	addi	%a0, %a0, -30
bgti_cont.23158:
	j	bgti_cont.23104
bgti_else.23155:
	addi	%a0, %a0, -20
bgti_cont.23156:
	j	bgti_cont.23104
bgti_else.23153:
	addi	%a0, %a0, -10
bgti_cont.23154:
	j	bgti_cont.23104
bgti_else.23151:
bgti_cont.23152:
	j	bgti_cont.23104
bgti_else.23149:
	addi	%a0, %a0, -30
bgti_cont.23150:
	j	bgti_cont.23104
bgti_else.23147:
	addi	%a0, %a0, -20
bgti_cont.23148:
	j	bgti_cont.23104
bgti_else.23145:
	addi	%a0, %a0, -10
bgti_cont.23146:
	j	bgti_cont.23104
bgti_else.23143:
bgti_cont.23144:
	j	bgti_cont.23104
bgti_else.23141:
	addi	%a0, %a0, -30
bgti_cont.23142:
	j	bgti_cont.23104
bgti_else.23139:
	addi	%a0, %a0, -20
bgti_cont.23140:
	j	bgti_cont.23104
bgti_else.23137:
	addi	%a0, %a0, -10
bgti_cont.23138:
	j	bgti_cont.23104
bgti_else.23135:
bgti_cont.23136:
	j	bgti_cont.23104
bgti_else.23133:
	addi	%a0, %a0, -30
bgti_cont.23134:
	j	bgti_cont.23104
bgti_else.23131:
	addi	%a0, %a0, -20
bgti_cont.23132:
	j	bgti_cont.23104
bgti_else.23129:
	addi	%a0, %a0, -10
bgti_cont.23130:
	j	bgti_cont.23104
bgti_else.23127:
bgti_cont.23128:
	j	bgti_cont.23104
bgti_else.23125:
	addi	%a0, %a0, -30
bgti_cont.23126:
	j	bgti_cont.23104
bgti_else.23123:
	addi	%a0, %a0, -20
bgti_cont.23124:
	j	bgti_cont.23104
bgti_else.23121:
	addi	%a0, %a0, -10
bgti_cont.23122:
	j	bgti_cont.23104
bgti_else.23119:
bgti_cont.23120:
	j	bgti_cont.23104
bgti_else.23117:
	addi	%a0, %a0, -30
bgti_cont.23118:
	j	bgti_cont.23104
bgti_else.23115:
	addi	%a0, %a0, -20
bgti_cont.23116:
	j	bgti_cont.23104
bgti_else.23113:
	addi	%a0, %a0, -10
bgti_cont.23114:
	j	bgti_cont.23104
bgti_else.23111:
bgti_cont.23112:
	j	bgti_cont.23104
bgti_else.23109:
	addi	%a0, %a0, -30
bgti_cont.23110:
	j	bgti_cont.23104
bgti_else.23107:
	addi	%a0, %a0, -20
bgti_cont.23108:
	j	bgti_cont.23104
bgti_else.23105:
	addi	%a0, %a0, -10
bgti_cont.23106:
	j	bgti_cont.23104
bgti_else.23103:
bgti_cont.23104:
	addi	%v0, %a0, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2
	j	min_caml_print_char
read_screen_settings.2775:
	add	%a0, %zero, %ra
	jal	min_caml_read_float
	fsw	%f0, 72(%zero)
	jal	min_caml_read_float
	fsw	%f0, 73(%zero)
	jal	min_caml_read_float
	fsw	%f0, 74(%zero)
	jal	min_caml_read_float
	flw	%f19, 461(%zero)
	fmul	%f20, %f0, %f19
	flw	%f18, 495(%zero)
	fabs	%f17, %f20
	flw	%f2, 494(%zero)
	fblt	%f17, %f2, fbgt_else.23444
	flw	%f1, 493(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.23445
	flw	%f1, 481(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.23445
fbgt_else.23468:
fbgt_cont.23469:
	j	fbgt_cont.23445
fbgt_else.23466:
fbgt_cont.23467:
	j	fbgt_cont.23445
fbgt_else.23464:
fbgt_cont.23465:
	j	fbgt_cont.23445
fbgt_else.23462:
fbgt_cont.23463:
	j	fbgt_cont.23445
fbgt_else.23460:
fbgt_cont.23461:
	j	fbgt_cont.23445
fbgt_else.23458:
fbgt_cont.23459:
	j	fbgt_cont.23445
fbgt_else.23456:
fbgt_cont.23457:
	j	fbgt_cont.23445
fbgt_else.23454:
fbgt_cont.23455:
	j	fbgt_cont.23445
fbgt_else.23452:
fbgt_cont.23453:
	j	fbgt_cont.23445
fbgt_else.23450:
fbgt_cont.23451:
	j	fbgt_cont.23445
fbgt_else.23448:
fbgt_cont.23449:
	j	fbgt_cont.23445
fbgt_else.23446:
fbgt_cont.23447:
	j	fbgt_cont.23445
fbgt_else.23444:
	fmov	%f1, %f2
fbgt_cont.23445:
	fblt	%f17, %f2, fbgt_else.23470
	fblt	%f17, %f1, fbgt_else.23472
	fsub	%f0, %f17, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.23471
fbgt_else.23472:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.23473:
	j	fbgt_cont.23471
fbgt_else.23470:
fbgt_cont.23471:
	fblt	%f17, %f18, fbgt_else.23474
	add	%a1, %zero, %zero
	j	fbgt_cont.23475
fbgt_else.23474:
	add	%a1, %zero, %k1
fbgt_cont.23475:
	fblt	%f17, %f18, fbgt_else.23476
	fsub	%f17, %f17, %f18
	j	fbgt_cont.23477
fbgt_else.23476:
fbgt_cont.23477:
	flw	%f21, 479(%zero)
	fblt	%f17, %f21, fbgt_else.23478
	beqi	%a1, 0, bnei_else.23480
	add	%a1, %zero, %zero
	j	fbgt_cont.23479
bnei_else.23480:
	add	%a1, %zero, %k1
bnei_cont.23481:
	j	fbgt_cont.23479
fbgt_else.23478:
fbgt_cont.23479:
	fblt	%f17, %f21, fbgt_else.23482
	fsub	%f17, %f18, %f17
	j	fbgt_cont.23483
fbgt_else.23482:
fbgt_cont.23483:
	flw	%f22, 478(%zero)
	fblt	%f22, %f17, fbgt_else.23484
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.23485
fbgt_else.23484:
	fsub	%f23, %f21, %f17
	fmul	%f17, %f23, %f23
	fmul	%f16, %f17, %f17
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f17
	fsub	%f1, %f23, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
fbgt_cont.23485:
	beqi	%a1, 0, bnei_else.23486
	j	bnei_cont.23487
bnei_else.23486:
	fneg	%f17, %f17
bnei_cont.23487:
	fblt	%f20, %fzero, fbgt_else.23488
	add	%a1, %zero, %k1
	j	fbgt_cont.23489
fbgt_else.23488:
	add	%a1, %zero, %zero
fbgt_cont.23489:
	fabs	%f20, %f20
	fblt	%f20, %f2, fbgt_else.23490
	flw	%f1, 493(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 492(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 491(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 490(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 489(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 488(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 487(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 486(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 485(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 484(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 483(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 482(%zero)
	fblt	%f20, %f1, fbgt_cont.23491
	flw	%f1, 481(%zero)
	fmov	%f0, %f20
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.23491
fbgt_else.23514:
fbgt_cont.23515:
	j	fbgt_cont.23491
fbgt_else.23512:
fbgt_cont.23513:
	j	fbgt_cont.23491
fbgt_else.23510:
fbgt_cont.23511:
	j	fbgt_cont.23491
fbgt_else.23508:
fbgt_cont.23509:
	j	fbgt_cont.23491
fbgt_else.23506:
fbgt_cont.23507:
	j	fbgt_cont.23491
fbgt_else.23504:
fbgt_cont.23505:
	j	fbgt_cont.23491
fbgt_else.23502:
fbgt_cont.23503:
	j	fbgt_cont.23491
fbgt_else.23500:
fbgt_cont.23501:
	j	fbgt_cont.23491
fbgt_else.23498:
fbgt_cont.23499:
	j	fbgt_cont.23491
fbgt_else.23496:
fbgt_cont.23497:
	j	fbgt_cont.23491
fbgt_else.23494:
fbgt_cont.23495:
	j	fbgt_cont.23491
fbgt_else.23492:
fbgt_cont.23493:
	j	fbgt_cont.23491
fbgt_else.23490:
	fmov	%f1, %f2
fbgt_cont.23491:
	fblt	%f20, %f2, fbgt_else.23516
	fblt	%f20, %f1, fbgt_else.23518
	fsub	%f0, %f20, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
	j	fbgt_cont.23517
fbgt_else.23518:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f20
	jal	reduction_2pi_sub2.2629
	fmov	%f20, %f0
fbgt_cont.23519:
	j	fbgt_cont.23517
fbgt_else.23516:
fbgt_cont.23517:
	fblt	%f20, %f18, fbgt_else.23520
	beqi	%a1, 0, bnei_else.23522
	add	%a1, %zero, %zero
	j	fbgt_cont.23521
bnei_else.23522:
	add	%a1, %zero, %k1
bnei_cont.23523:
	j	fbgt_cont.23521
fbgt_else.23520:
fbgt_cont.23521:
	fblt	%f20, %f18, fbgt_else.23524
	fsub	%f20, %f20, %f18
	j	fbgt_cont.23525
fbgt_else.23524:
fbgt_cont.23525:
	fblt	%f20, %f21, fbgt_else.23526
	fsub	%f20, %f18, %f20
	j	fbgt_cont.23527
fbgt_else.23526:
fbgt_cont.23527:
	fblt	%f22, %f20, fbgt_else.23528
	fmul	%f23, %f20, %f20
	fmul	%f16, %f23, %f23
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fsub	%f1, %f20, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f20, %f1, %f0
	j	fbgt_cont.23529
fbgt_else.23528:
	fsub	%f0, %f21, %f20
	fmul	%f20, %f0, %f0
	fmul	%f16, %f20, %f20
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f20
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f16
	fsub	%f20, %f1, %f0
fbgt_cont.23529:
	beqi	%a1, 0, bnei_else.23530
	j	bnei_cont.23531
bnei_else.23530:
	fneg	%f20, %f20
bnei_cont.23531:
	jal	min_caml_read_float
	fmul	%f23, %f0, %f19
	fabs	%f19, %f23
	fblt	%f19, %f2, fbgt_else.23532
	flw	%f1, 493(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 492(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 491(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 490(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 489(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 488(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 487(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 486(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 485(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 484(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 483(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 482(%zero)
	fblt	%f19, %f1, fbgt_cont.23533
	flw	%f1, 481(%zero)
	fmov	%f0, %f19
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.23533
fbgt_else.23556:
fbgt_cont.23557:
	j	fbgt_cont.23533
fbgt_else.23554:
fbgt_cont.23555:
	j	fbgt_cont.23533
fbgt_else.23552:
fbgt_cont.23553:
	j	fbgt_cont.23533
fbgt_else.23550:
fbgt_cont.23551:
	j	fbgt_cont.23533
fbgt_else.23548:
fbgt_cont.23549:
	j	fbgt_cont.23533
fbgt_else.23546:
fbgt_cont.23547:
	j	fbgt_cont.23533
fbgt_else.23544:
fbgt_cont.23545:
	j	fbgt_cont.23533
fbgt_else.23542:
fbgt_cont.23543:
	j	fbgt_cont.23533
fbgt_else.23540:
fbgt_cont.23541:
	j	fbgt_cont.23533
fbgt_else.23538:
fbgt_cont.23539:
	j	fbgt_cont.23533
fbgt_else.23536:
fbgt_cont.23537:
	j	fbgt_cont.23533
fbgt_else.23534:
fbgt_cont.23535:
	j	fbgt_cont.23533
fbgt_else.23532:
	fmov	%f1, %f2
fbgt_cont.23533:
	fblt	%f19, %f2, fbgt_else.23558
	fblt	%f19, %f1, fbgt_else.23560
	fsub	%f0, %f19, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
	j	fbgt_cont.23559
fbgt_else.23560:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f19
	jal	reduction_2pi_sub2.2629
	fmov	%f19, %f0
fbgt_cont.23561:
	j	fbgt_cont.23559
fbgt_else.23558:
fbgt_cont.23559:
	fblt	%f19, %f18, fbgt_else.23562
	add	%a1, %zero, %zero
	j	fbgt_cont.23563
fbgt_else.23562:
	add	%a1, %zero, %k1
fbgt_cont.23563:
	fblt	%f19, %f18, fbgt_else.23564
	fsub	%f19, %f19, %f18
	j	fbgt_cont.23565
fbgt_else.23564:
fbgt_cont.23565:
	fblt	%f19, %f21, fbgt_else.23566
	beqi	%a1, 0, bnei_else.23568
	add	%a1, %zero, %zero
	j	fbgt_cont.23567
bnei_else.23568:
	add	%a1, %zero, %k1
bnei_cont.23569:
	j	fbgt_cont.23567
fbgt_else.23566:
fbgt_cont.23567:
	fblt	%f19, %f21, fbgt_else.23570
	fsub	%f19, %f18, %f19
	j	fbgt_cont.23571
fbgt_else.23570:
fbgt_cont.23571:
	fblt	%f22, %f19, fbgt_else.23572
	fmul	%f19, %f19, %f19
	fmul	%f16, %f19, %f19
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f19, %f1, %f0
	j	fbgt_cont.23573
fbgt_else.23572:
	fsub	%f24, %f21, %f19
	fmul	%f19, %f24, %f24
	fmul	%f16, %f19, %f19
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f19
	fsub	%f1, %f24, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f19, %f1, %f0
fbgt_cont.23573:
	beqi	%a1, 0, bnei_else.23574
	j	bnei_cont.23575
bnei_else.23574:
	fneg	%f19, %f19
bnei_cont.23575:
	fblt	%f23, %fzero, fbgt_else.23576
	add	%a1, %zero, %k1
	j	fbgt_cont.23577
fbgt_else.23576:
	add	%a1, %zero, %zero
fbgt_cont.23577:
	fabs	%f23, %f23
	fblt	%f23, %f2, fbgt_else.23578
	flw	%f1, 493(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 492(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 491(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 490(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 489(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 488(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 487(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 486(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 485(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 484(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 483(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 482(%zero)
	fblt	%f23, %f1, fbgt_cont.23579
	flw	%f1, 481(%zero)
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.23579
fbgt_else.23602:
fbgt_cont.23603:
	j	fbgt_cont.23579
fbgt_else.23600:
fbgt_cont.23601:
	j	fbgt_cont.23579
fbgt_else.23598:
fbgt_cont.23599:
	j	fbgt_cont.23579
fbgt_else.23596:
fbgt_cont.23597:
	j	fbgt_cont.23579
fbgt_else.23594:
fbgt_cont.23595:
	j	fbgt_cont.23579
fbgt_else.23592:
fbgt_cont.23593:
	j	fbgt_cont.23579
fbgt_else.23590:
fbgt_cont.23591:
	j	fbgt_cont.23579
fbgt_else.23588:
fbgt_cont.23589:
	j	fbgt_cont.23579
fbgt_else.23586:
fbgt_cont.23587:
	j	fbgt_cont.23579
fbgt_else.23584:
fbgt_cont.23585:
	j	fbgt_cont.23579
fbgt_else.23582:
fbgt_cont.23583:
	j	fbgt_cont.23579
fbgt_else.23580:
fbgt_cont.23581:
	j	fbgt_cont.23579
fbgt_else.23578:
	fmov	%f1, %f2
fbgt_cont.23579:
	fblt	%f23, %f2, fbgt_else.23604
	fblt	%f23, %f1, fbgt_else.23606
	fsub	%f0, %f23, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.23605
fbgt_else.23606:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.23607:
	j	fbgt_cont.23605
fbgt_else.23604:
fbgt_cont.23605:
	fblt	%f23, %f18, fbgt_else.23608
	beqi	%a1, 0, bnei_else.23610
	add	%a1, %zero, %zero
	j	fbgt_cont.23609
bnei_else.23610:
	add	%a1, %zero, %k1
bnei_cont.23611:
	j	fbgt_cont.23609
fbgt_else.23608:
fbgt_cont.23609:
	fblt	%f23, %f18, fbgt_else.23612
	fsub	%f23, %f23, %f18
	j	fbgt_cont.23613
fbgt_else.23612:
fbgt_cont.23613:
	fblt	%f23, %f21, fbgt_else.23614
	fsub	%f23, %f18, %f23
	j	fbgt_cont.23615
fbgt_else.23614:
fbgt_cont.23615:
	fblt	%f22, %f23, fbgt_else.23616
	fmul	%f18, %f23, %f23
	fmul	%f16, %f18, %f18
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f18
	fsub	%f1, %f23, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.23617
fbgt_else.23616:
	fsub	%f0, %f21, %f23
	fmul	%f18, %f0, %f0
	fmul	%f16, %f18, %f18
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.23617:
	beqi	%a1, 0, bnei_else.23618
	j	bnei_cont.23619
bnei_else.23618:
	fneg	%f0, %f0
bnei_cont.23619:
	fmul	%f1, %f17, %f0
	flw	%f16, 460(%zero)
	fmul	%f1, %f1, %f16
	fsw	%f1, 171(%zero)
	flw	%f1, 459(%zero)
	fmul	%f1, %f20, %f1
	fsw	%f1, 172(%zero)
	fmul	%f1, %f17, %f19
	fmul	%f1, %f1, %f16
	fsw	%f1, 173(%zero)
	fsw	%f19, 165(%zero)
	fsw	%fzero, 166(%zero)
	fneg	%f1, %f0
	fsw	%f1, 167(%zero)
	fneg	%f1, %f20
	fmul	%f0, %f1, %f0
	fsw	%f0, 168(%zero)
	fneg	%f0, %f17
	fsw	%f0, 169(%zero)
	fneg	%f0, %f20
	fmul	%f0, %f0, %f19
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
	add	%ra, %zero, %a0
	fsw	%f0, 77(%zero)
	jr	%ra
rotate_quadratic_matrix.2779:
	add	%a0, %zero, %ra
	flw	%f18, 0(%v1)
	flw	%f19, 495(%zero)
	fabs	%f17, %f18
	flw	%f2, 494(%zero)
	fblt	%f17, %f2, fbgt_else.24038
	flw	%f1, 493(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.24039
	flw	%f1, 481(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.24039
fbgt_else.24062:
fbgt_cont.24063:
	j	fbgt_cont.24039
fbgt_else.24060:
fbgt_cont.24061:
	j	fbgt_cont.24039
fbgt_else.24058:
fbgt_cont.24059:
	j	fbgt_cont.24039
fbgt_else.24056:
fbgt_cont.24057:
	j	fbgt_cont.24039
fbgt_else.24054:
fbgt_cont.24055:
	j	fbgt_cont.24039
fbgt_else.24052:
fbgt_cont.24053:
	j	fbgt_cont.24039
fbgt_else.24050:
fbgt_cont.24051:
	j	fbgt_cont.24039
fbgt_else.24048:
fbgt_cont.24049:
	j	fbgt_cont.24039
fbgt_else.24046:
fbgt_cont.24047:
	j	fbgt_cont.24039
fbgt_else.24044:
fbgt_cont.24045:
	j	fbgt_cont.24039
fbgt_else.24042:
fbgt_cont.24043:
	j	fbgt_cont.24039
fbgt_else.24040:
fbgt_cont.24041:
	j	fbgt_cont.24039
fbgt_else.24038:
	fmov	%f1, %f2
fbgt_cont.24039:
	fblt	%f17, %f2, fbgt_else.24064
	fblt	%f17, %f1, fbgt_else.24066
	fsub	%f0, %f17, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.24065
fbgt_else.24066:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.24067:
	j	fbgt_cont.24065
fbgt_else.24064:
fbgt_cont.24065:
	fblt	%f17, %f19, fbgt_else.24068
	add	%a1, %zero, %zero
	j	fbgt_cont.24069
fbgt_else.24068:
	add	%a1, %zero, %k1
fbgt_cont.24069:
	fblt	%f17, %f19, fbgt_else.24070
	fsub	%f17, %f17, %f19
	j	fbgt_cont.24071
fbgt_else.24070:
fbgt_cont.24071:
	flw	%f20, 479(%zero)
	fblt	%f17, %f20, fbgt_else.24072
	beqi	%a1, 0, bnei_else.24074
	add	%a1, %zero, %zero
	j	fbgt_cont.24073
bnei_else.24074:
	add	%a1, %zero, %k1
bnei_cont.24075:
	j	fbgt_cont.24073
fbgt_else.24072:
fbgt_cont.24073:
	fblt	%f17, %f20, fbgt_else.24076
	fsub	%f17, %f19, %f17
	j	fbgt_cont.24077
fbgt_else.24076:
fbgt_cont.24077:
	flw	%f21, 478(%zero)
	fblt	%f21, %f17, fbgt_else.24078
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.24079
fbgt_else.24078:
	fsub	%f22, %f20, %f17
	fmul	%f16, %f22, %f22
	fmul	%f17, %f16, %f16
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f1, %f22, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f17
	fsub	%f17, %f1, %f0
fbgt_cont.24079:
	beqi	%a1, 0, bnei_else.24080
	j	bnei_cont.24081
bnei_else.24080:
	fneg	%f17, %f17
bnei_cont.24081:
	fblt	%f18, %fzero, fbgt_else.24082
	add	%a1, %zero, %k1
	j	fbgt_cont.24083
fbgt_else.24082:
	add	%a1, %zero, %zero
fbgt_cont.24083:
	fabs	%f18, %f18
	fblt	%f18, %f2, fbgt_else.24084
	flw	%f1, 493(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 492(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 491(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 490(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 489(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 488(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 487(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 486(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 485(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 484(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 483(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 482(%zero)
	fblt	%f18, %f1, fbgt_cont.24085
	flw	%f1, 481(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.24085
fbgt_else.24108:
fbgt_cont.24109:
	j	fbgt_cont.24085
fbgt_else.24106:
fbgt_cont.24107:
	j	fbgt_cont.24085
fbgt_else.24104:
fbgt_cont.24105:
	j	fbgt_cont.24085
fbgt_else.24102:
fbgt_cont.24103:
	j	fbgt_cont.24085
fbgt_else.24100:
fbgt_cont.24101:
	j	fbgt_cont.24085
fbgt_else.24098:
fbgt_cont.24099:
	j	fbgt_cont.24085
fbgt_else.24096:
fbgt_cont.24097:
	j	fbgt_cont.24085
fbgt_else.24094:
fbgt_cont.24095:
	j	fbgt_cont.24085
fbgt_else.24092:
fbgt_cont.24093:
	j	fbgt_cont.24085
fbgt_else.24090:
fbgt_cont.24091:
	j	fbgt_cont.24085
fbgt_else.24088:
fbgt_cont.24089:
	j	fbgt_cont.24085
fbgt_else.24086:
fbgt_cont.24087:
	j	fbgt_cont.24085
fbgt_else.24084:
	fmov	%f1, %f2
fbgt_cont.24085:
	fblt	%f18, %f2, fbgt_else.24110
	fblt	%f18, %f1, fbgt_else.24112
	fsub	%f0, %f18, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.24111
fbgt_else.24112:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.24113:
	j	fbgt_cont.24111
fbgt_else.24110:
fbgt_cont.24111:
	fblt	%f18, %f19, fbgt_else.24114
	beqi	%a1, 0, bnei_else.24116
	add	%a1, %zero, %zero
	j	fbgt_cont.24115
bnei_else.24116:
	add	%a1, %zero, %k1
bnei_cont.24117:
	j	fbgt_cont.24115
fbgt_else.24114:
fbgt_cont.24115:
	fblt	%f18, %f19, fbgt_else.24118
	fsub	%f18, %f18, %f19
	j	fbgt_cont.24119
fbgt_else.24118:
fbgt_cont.24119:
	fblt	%f18, %f20, fbgt_else.24120
	fsub	%f18, %f19, %f18
	j	fbgt_cont.24121
fbgt_else.24120:
fbgt_cont.24121:
	fblt	%f21, %f18, fbgt_else.24122
	fmul	%f22, %f18, %f18
	fmul	%f16, %f22, %f22
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f22
	fsub	%f1, %f18, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
	j	fbgt_cont.24123
fbgt_else.24122:
	fsub	%f0, %f20, %f18
	fmul	%f18, %f0, %f0
	fmul	%f16, %f18, %f18
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f18, %f1, %f0
fbgt_cont.24123:
	beqi	%a1, 0, bnei_else.24124
	j	bnei_cont.24125
bnei_else.24124:
	fneg	%f18, %f18
bnei_cont.24125:
	flw	%f23, 1(%v1)
	fabs	%f22, %f23
	fblt	%f22, %f2, fbgt_else.24126
	flw	%f1, 493(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 492(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 491(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 490(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 489(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 488(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 487(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 486(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 485(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 484(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 483(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 482(%zero)
	fblt	%f22, %f1, fbgt_cont.24127
	flw	%f1, 481(%zero)
	fmov	%f0, %f22
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.24127
fbgt_else.24150:
fbgt_cont.24151:
	j	fbgt_cont.24127
fbgt_else.24148:
fbgt_cont.24149:
	j	fbgt_cont.24127
fbgt_else.24146:
fbgt_cont.24147:
	j	fbgt_cont.24127
fbgt_else.24144:
fbgt_cont.24145:
	j	fbgt_cont.24127
fbgt_else.24142:
fbgt_cont.24143:
	j	fbgt_cont.24127
fbgt_else.24140:
fbgt_cont.24141:
	j	fbgt_cont.24127
fbgt_else.24138:
fbgt_cont.24139:
	j	fbgt_cont.24127
fbgt_else.24136:
fbgt_cont.24137:
	j	fbgt_cont.24127
fbgt_else.24134:
fbgt_cont.24135:
	j	fbgt_cont.24127
fbgt_else.24132:
fbgt_cont.24133:
	j	fbgt_cont.24127
fbgt_else.24130:
fbgt_cont.24131:
	j	fbgt_cont.24127
fbgt_else.24128:
fbgt_cont.24129:
	j	fbgt_cont.24127
fbgt_else.24126:
	fmov	%f1, %f2
fbgt_cont.24127:
	fblt	%f22, %f2, fbgt_else.24152
	fblt	%f22, %f1, fbgt_else.24154
	fsub	%f0, %f22, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
	j	fbgt_cont.24153
fbgt_else.24154:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f22
	jal	reduction_2pi_sub2.2629
	fmov	%f22, %f0
fbgt_cont.24155:
	j	fbgt_cont.24153
fbgt_else.24152:
fbgt_cont.24153:
	fblt	%f22, %f19, fbgt_else.24156
	add	%a1, %zero, %zero
	j	fbgt_cont.24157
fbgt_else.24156:
	add	%a1, %zero, %k1
fbgt_cont.24157:
	fblt	%f22, %f19, fbgt_else.24158
	fsub	%f22, %f22, %f19
	j	fbgt_cont.24159
fbgt_else.24158:
fbgt_cont.24159:
	fblt	%f22, %f20, fbgt_else.24160
	beqi	%a1, 0, bnei_else.24162
	add	%a1, %zero, %zero
	j	fbgt_cont.24161
bnei_else.24162:
	add	%a1, %zero, %k1
bnei_cont.24163:
	j	fbgt_cont.24161
fbgt_else.24160:
fbgt_cont.24161:
	fblt	%f22, %f20, fbgt_else.24164
	fsub	%f22, %f19, %f22
	j	fbgt_cont.24165
fbgt_else.24164:
fbgt_cont.24165:
	fblt	%f21, %f22, fbgt_else.24166
	fmul	%f22, %f22, %f22
	fmul	%f16, %f22, %f22
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f22
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f22, %f1, %f0
	j	fbgt_cont.24167
fbgt_else.24166:
	fsub	%f24, %f20, %f22
	fmul	%f22, %f24, %f24
	fmul	%f16, %f22, %f22
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f22
	fsub	%f1, %f24, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f22
	fmul	%f0, %f0, %f16
	fsub	%f22, %f1, %f0
fbgt_cont.24167:
	beqi	%a1, 0, bnei_else.24168
	j	bnei_cont.24169
bnei_else.24168:
	fneg	%f22, %f22
bnei_cont.24169:
	fblt	%f23, %fzero, fbgt_else.24170
	add	%a1, %zero, %k1
	j	fbgt_cont.24171
fbgt_else.24170:
	add	%a1, %zero, %zero
fbgt_cont.24171:
	fabs	%f23, %f23
	fblt	%f23, %f2, fbgt_else.24172
	flw	%f1, 493(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 492(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 491(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 490(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 489(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 488(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 487(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 486(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 485(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 484(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 483(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 482(%zero)
	fblt	%f23, %f1, fbgt_cont.24173
	flw	%f1, 481(%zero)
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.24173
fbgt_else.24196:
fbgt_cont.24197:
	j	fbgt_cont.24173
fbgt_else.24194:
fbgt_cont.24195:
	j	fbgt_cont.24173
fbgt_else.24192:
fbgt_cont.24193:
	j	fbgt_cont.24173
fbgt_else.24190:
fbgt_cont.24191:
	j	fbgt_cont.24173
fbgt_else.24188:
fbgt_cont.24189:
	j	fbgt_cont.24173
fbgt_else.24186:
fbgt_cont.24187:
	j	fbgt_cont.24173
fbgt_else.24184:
fbgt_cont.24185:
	j	fbgt_cont.24173
fbgt_else.24182:
fbgt_cont.24183:
	j	fbgt_cont.24173
fbgt_else.24180:
fbgt_cont.24181:
	j	fbgt_cont.24173
fbgt_else.24178:
fbgt_cont.24179:
	j	fbgt_cont.24173
fbgt_else.24176:
fbgt_cont.24177:
	j	fbgt_cont.24173
fbgt_else.24174:
fbgt_cont.24175:
	j	fbgt_cont.24173
fbgt_else.24172:
	fmov	%f1, %f2
fbgt_cont.24173:
	fblt	%f23, %f2, fbgt_else.24198
	fblt	%f23, %f1, fbgt_else.24200
	fsub	%f0, %f23, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
	j	fbgt_cont.24199
fbgt_else.24200:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f23
	jal	reduction_2pi_sub2.2629
	fmov	%f23, %f0
fbgt_cont.24201:
	j	fbgt_cont.24199
fbgt_else.24198:
fbgt_cont.24199:
	fblt	%f23, %f19, fbgt_else.24202
	beqi	%a1, 0, bnei_else.24204
	add	%a1, %zero, %zero
	j	fbgt_cont.24203
bnei_else.24204:
	add	%a1, %zero, %k1
bnei_cont.24205:
	j	fbgt_cont.24203
fbgt_else.24202:
fbgt_cont.24203:
	fblt	%f23, %f19, fbgt_else.24206
	fsub	%f23, %f23, %f19
	j	fbgt_cont.24207
fbgt_else.24206:
fbgt_cont.24207:
	fblt	%f23, %f20, fbgt_else.24208
	fsub	%f23, %f19, %f23
	j	fbgt_cont.24209
fbgt_else.24208:
fbgt_cont.24209:
	fblt	%f21, %f23, fbgt_else.24210
	fmul	%f24, %f23, %f23
	fmul	%f16, %f24, %f24
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f24
	fsub	%f1, %f23, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
	j	fbgt_cont.24211
fbgt_else.24210:
	fsub	%f0, %f20, %f23
	fmul	%f23, %f0, %f0
	fmul	%f16, %f23, %f23
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f23
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f23
	fmul	%f0, %f0, %f16
	fsub	%f23, %f1, %f0
fbgt_cont.24211:
	beqi	%a1, 0, bnei_else.24212
	j	bnei_cont.24213
bnei_else.24212:
	fneg	%f23, %f23
bnei_cont.24213:
	flw	%f25, 2(%v1)
	fabs	%f24, %f25
	fblt	%f24, %f2, fbgt_else.24214
	flw	%f1, 493(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 492(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 491(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 490(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 489(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 488(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 487(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 486(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 485(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 484(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 483(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 482(%zero)
	fblt	%f24, %f1, fbgt_cont.24215
	flw	%f1, 481(%zero)
	fmov	%f0, %f24
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.24215
fbgt_else.24238:
fbgt_cont.24239:
	j	fbgt_cont.24215
fbgt_else.24236:
fbgt_cont.24237:
	j	fbgt_cont.24215
fbgt_else.24234:
fbgt_cont.24235:
	j	fbgt_cont.24215
fbgt_else.24232:
fbgt_cont.24233:
	j	fbgt_cont.24215
fbgt_else.24230:
fbgt_cont.24231:
	j	fbgt_cont.24215
fbgt_else.24228:
fbgt_cont.24229:
	j	fbgt_cont.24215
fbgt_else.24226:
fbgt_cont.24227:
	j	fbgt_cont.24215
fbgt_else.24224:
fbgt_cont.24225:
	j	fbgt_cont.24215
fbgt_else.24222:
fbgt_cont.24223:
	j	fbgt_cont.24215
fbgt_else.24220:
fbgt_cont.24221:
	j	fbgt_cont.24215
fbgt_else.24218:
fbgt_cont.24219:
	j	fbgt_cont.24215
fbgt_else.24216:
fbgt_cont.24217:
	j	fbgt_cont.24215
fbgt_else.24214:
	fmov	%f1, %f2
fbgt_cont.24215:
	fblt	%f24, %f2, fbgt_else.24240
	fblt	%f24, %f1, fbgt_else.24242
	fsub	%f0, %f24, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f24, %f0
	j	fbgt_cont.24241
fbgt_else.24242:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f24, %f0
fbgt_cont.24243:
	j	fbgt_cont.24241
fbgt_else.24240:
fbgt_cont.24241:
	fblt	%f24, %f19, fbgt_else.24244
	add	%a1, %zero, %zero
	j	fbgt_cont.24245
fbgt_else.24244:
	add	%a1, %zero, %k1
fbgt_cont.24245:
	fblt	%f24, %f19, fbgt_else.24246
	fsub	%f24, %f24, %f19
	j	fbgt_cont.24247
fbgt_else.24246:
fbgt_cont.24247:
	fblt	%f24, %f20, fbgt_else.24248
	beqi	%a1, 0, bnei_else.24250
	add	%a1, %zero, %zero
	j	fbgt_cont.24249
bnei_else.24250:
	add	%a1, %zero, %k1
bnei_cont.24251:
	j	fbgt_cont.24249
fbgt_else.24248:
fbgt_cont.24249:
	fblt	%f24, %f20, fbgt_else.24252
	fsub	%f24, %f19, %f24
	j	fbgt_cont.24253
fbgt_else.24252:
fbgt_cont.24253:
	fblt	%f21, %f24, fbgt_else.24254
	fmul	%f24, %f24, %f24
	fmul	%f16, %f24, %f24
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f24
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f24, %f1, %f0
	j	fbgt_cont.24255
fbgt_else.24254:
	fsub	%f26, %f20, %f24
	fmul	%f24, %f26, %f26
	fmul	%f16, %f24, %f24
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f24
	fsub	%f1, %f26, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f26
	fmul	%f0, %f0, %f24
	fmul	%f0, %f0, %f16
	fsub	%f24, %f1, %f0
fbgt_cont.24255:
	beqi	%a1, 0, bnei_else.24256
	j	bnei_cont.24257
bnei_else.24256:
	fneg	%f24, %f24
bnei_cont.24257:
	fblt	%f25, %fzero, fbgt_else.24258
	add	%a1, %zero, %k1
	j	fbgt_cont.24259
fbgt_else.24258:
	add	%a1, %zero, %zero
fbgt_cont.24259:
	fabs	%f25, %f25
	fblt	%f25, %f2, fbgt_else.24260
	flw	%f1, 493(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 492(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 491(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 490(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 489(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 488(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 487(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 486(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 485(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 484(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 483(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 482(%zero)
	fblt	%f25, %f1, fbgt_cont.24261
	flw	%f1, 481(%zero)
	fmov	%f0, %f25
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.24261
fbgt_else.24284:
fbgt_cont.24285:
	j	fbgt_cont.24261
fbgt_else.24282:
fbgt_cont.24283:
	j	fbgt_cont.24261
fbgt_else.24280:
fbgt_cont.24281:
	j	fbgt_cont.24261
fbgt_else.24278:
fbgt_cont.24279:
	j	fbgt_cont.24261
fbgt_else.24276:
fbgt_cont.24277:
	j	fbgt_cont.24261
fbgt_else.24274:
fbgt_cont.24275:
	j	fbgt_cont.24261
fbgt_else.24272:
fbgt_cont.24273:
	j	fbgt_cont.24261
fbgt_else.24270:
fbgt_cont.24271:
	j	fbgt_cont.24261
fbgt_else.24268:
fbgt_cont.24269:
	j	fbgt_cont.24261
fbgt_else.24266:
fbgt_cont.24267:
	j	fbgt_cont.24261
fbgt_else.24264:
fbgt_cont.24265:
	j	fbgt_cont.24261
fbgt_else.24262:
fbgt_cont.24263:
	j	fbgt_cont.24261
fbgt_else.24260:
	fmov	%f1, %f2
fbgt_cont.24261:
	fblt	%f25, %f2, fbgt_else.24286
	fblt	%f25, %f1, fbgt_else.24288
	fsub	%f0, %f25, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
	j	fbgt_cont.24287
fbgt_else.24288:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f25
	jal	reduction_2pi_sub2.2629
	fmov	%f25, %f0
fbgt_cont.24289:
	j	fbgt_cont.24287
fbgt_else.24286:
fbgt_cont.24287:
	fblt	%f25, %f19, fbgt_else.24290
	beqi	%a1, 0, bnei_else.24292
	add	%a1, %zero, %zero
	j	fbgt_cont.24291
bnei_else.24292:
	add	%a1, %zero, %k1
bnei_cont.24293:
	j	fbgt_cont.24291
fbgt_else.24290:
fbgt_cont.24291:
	fblt	%f25, %f19, fbgt_else.24294
	fsub	%f25, %f25, %f19
	j	fbgt_cont.24295
fbgt_else.24294:
fbgt_cont.24295:
	fblt	%f25, %f20, fbgt_else.24296
	fsub	%f25, %f19, %f25
	j	fbgt_cont.24297
fbgt_else.24296:
fbgt_cont.24297:
	fblt	%f21, %f25, fbgt_else.24298
	fmul	%f19, %f25, %f25
	fmul	%f16, %f19, %f19
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f19
	fsub	%f1, %f25, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f25
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.24299
fbgt_else.24298:
	fsub	%f0, %f20, %f25
	fmul	%f19, %f0, %f0
	fmul	%f16, %f19, %f19
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f19
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.24299:
	beqi	%a1, 0, bnei_else.24300
	j	bnei_cont.24301
bnei_else.24300:
	fneg	%f0, %f0
bnei_cont.24301:
	fmul	%f1, %f22, %f24
	fmul	%f20, %f18, %f23
	fmul	%f19, %f20, %f24
	fmul	%f16, %f17, %f0
	fsub	%f2, %f19, %f16
	fmul	%f21, %f17, %f23
	fmul	%f19, %f21, %f24
	fmul	%f16, %f18, %f0
	fadd	%f16, %f19, %f16
	fmul	%f25, %f22, %f0
	fmul	%f20, %f20, %f0
	fmul	%f19, %f17, %f24
	fadd	%f19, %f20, %f19
	fmul	%f20, %f21, %f0
	fmul	%f0, %f18, %f24
	fsub	%f24, %f20, %f0
	fneg	%f23, %f23
	fmul	%f18, %f18, %f22
	fmul	%f21, %f17, %f22
	flw	%f27, 0(%v0)
	flw	%f17, 1(%v0)
	flw	%f26, 2(%v0)
	fmul	%f0, %f1, %f1
	fmul	%f20, %f27, %f0
	fmul	%f0, %f25, %f25
	fmul	%f0, %f17, %f0
	fadd	%f20, %f20, %f0
	fmul	%f0, %f23, %f23
	fmul	%f0, %f26, %f0
	fadd	%f0, %f20, %f0
	fsw	%f0, 0(%v0)
	fmul	%f0, %f2, %f2
	fmul	%f20, %f27, %f0
	fmul	%f0, %f19, %f19
	fmul	%f0, %f17, %f0
	fadd	%f20, %f20, %f0
	fmul	%f0, %f18, %f18
	fmul	%f0, %f26, %f0
	fadd	%f0, %f20, %f0
	fsw	%f0, 1(%v0)
	fmul	%f0, %f16, %f16
	fmul	%f20, %f27, %f0
	fmul	%f0, %f24, %f24
	fmul	%f0, %f17, %f0
	fadd	%f20, %f20, %f0
	fmul	%f0, %f21, %f21
	fmul	%f0, %f26, %f0
	fadd	%f0, %f20, %f0
	fsw	%f0, 2(%v0)
	flw	%f20, 496(%zero)
	fmul	%f0, %f27, %f2
	fmul	%f22, %f0, %f16
	fmul	%f0, %f17, %f19
	fmul	%f0, %f0, %f24
	fadd	%f22, %f22, %f0
	fmul	%f0, %f26, %f18
	fmul	%f0, %f0, %f21
	fadd	%f0, %f22, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 0(%v1)
	fmul	%f22, %f27, %f1
	fmul	%f1, %f22, %f16
	fmul	%f17, %f17, %f25
	fmul	%f0, %f17, %f24
	fadd	%f1, %f1, %f0
	fmul	%f16, %f26, %f23
	fmul	%f0, %f16, %f21
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	fsw	%f0, 1(%v1)
	fmul	%f1, %f22, %f2
	fmul	%f0, %f17, %f19
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f18
	fadd	%f0, %f1, %f0
	fmul	%f0, %f20, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 2(%v1)
	jr	%ra
read_nth_object.2782:
	add	%a0, %zero, %v0
	add	%a2, %zero, %ra
	jal	min_caml_read_int
	addi	%a1, %v0, 0
	beqi	%a1, -1, bnei_else.24410
	jal	min_caml_read_int
	addi	%a3, %v0, 0
	jal	min_caml_read_int
	addi	%k0, %v0, 0
	jal	min_caml_read_int
	addi	%s0, %v0, 0
	addi	%s1, %zero, 3
	addi	%v0, %s1, 0
	fmov	%f0, %fzero
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
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s3, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s3)
	jal	min_caml_read_float
	fsw	%f0, 1(%s3)
	jal	min_caml_read_float
	fsw	%f0, 2(%s3)
	jal	min_caml_read_float
	fblt	%f0, %fzero, fbgt_else.24411
	add	%s4, %zero, %zero
	j	fbgt_cont.24412
fbgt_else.24411:
	add	%s4, %zero, %k1
fbgt_cont.24412:
	addi	%v0, %s5, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s5, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s5)
	jal	min_caml_read_float
	fsw	%f0, 1(%s5)
	addi	%v0, %s1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s6, %v0, 0
	jal	min_caml_read_float
	fsw	%f0, 0(%s6)
	jal	min_caml_read_float
	fsw	%f0, 1(%s6)
	jal	min_caml_read_float
	fsw	%f0, 2(%s6)
	addi	%v0, %s1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s1, %v0, 0
	beqi	%s0, 0, bnei_else.24413
	jal	min_caml_read_float
	flw	%f1, 461(%zero)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%s1)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 1(%s1)
	jal	min_caml_read_float
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%s1)
	j	bnei_cont.24414
bnei_else.24413:
bnei_cont.24414:
	beqi	%a3, 2, bnei_else.24415
	add	%s7, %zero, %s4
	j	bnei_cont.24416
bnei_else.24415:
	add	%s7, %zero, %k1
bnei_cont.24416:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
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
	sw	%k0, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a1, 0(%ra)
	sw	%ra, 12(%a0)
	beqi	%a3, 3, bnei_else.24417
	beqi	%a3, 2, bnei_else.24419
	j	bnei_cont.24418
bnei_else.24419:
	beqi	%s4, 0, bnei_else.24421
	add	%a0, %zero, %zero
	j	bnei_cont.24422
bnei_else.24421:
	add	%a0, %zero, %k1
bnei_cont.24422:
	flw	%f18, 0(%s2)
	fmul	%f1, %f18, %f18
	flw	%f17, 1(%s2)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 2(%s2)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.24423
	add	%a1, %zero, %k1
	j	fbeq_cont.24424
fbeq_else.24423:
	add	%a1, %zero, %zero
fbeq_cont.24424:
	beqi	%a1, 0, bnei_else.24425
	fmov	%f0, %f30
	j	bnei_cont.24426
bnei_else.24425:
	beqi	%a0, 0, bnei_else.24427
	flw	%f0, 458(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.24428
bnei_else.24427:
	fdiv	%f0, %f30, %f1
bnei_cont.24428:
bnei_cont.24426:
	fmul	%f1, %f18, %f0
	fsw	%f1, 0(%s2)
	fmul	%f1, %f17, %f0
	fsw	%f1, 1(%s2)
	fmul	%f0, %f16, %f0
	fsw	%f0, 2(%s2)
bnei_cont.24420:
	j	bnei_cont.24418
bnei_else.24417:
	flw	%f1, 0(%s2)
	fbne	%f1, %fzero, fbeq_else.24429
	add	%a0, %zero, %k1
	j	fbeq_cont.24430
fbeq_else.24429:
	add	%a0, %zero, %zero
fbeq_cont.24430:
	beqi	%a0, 0, bnei_else.24431
	fmov	%f0, %fzero
	j	bnei_cont.24432
bnei_else.24431:
	fbne	%f1, %fzero, fbeq_else.24433
	add	%a0, %zero, %k1
	j	fbeq_cont.24434
fbeq_else.24433:
	add	%a0, %zero, %zero
fbeq_cont.24434:
	beqi	%a0, 0, bnei_else.24435
	fmov	%f0, %fzero
	j	bnei_cont.24436
bnei_else.24435:
	fblt	%fzero, %f1, fbgt_else.24437
	add	%a0, %zero, %zero
	j	fbgt_cont.24438
fbgt_else.24437:
	add	%a0, %zero, %k1
fbgt_cont.24438:
	beqi	%a0, 0, bnei_else.24439
	fmov	%f0, %f30
	j	bnei_cont.24440
bnei_else.24439:
	flw	%f0, 458(%zero)
bnei_cont.24440:
bnei_cont.24436:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.24432:
	fsw	%f0, 0(%s2)
	flw	%f1, 1(%s2)
	fbne	%f1, %fzero, fbeq_else.24441
	add	%a0, %zero, %k1
	j	fbeq_cont.24442
fbeq_else.24441:
	add	%a0, %zero, %zero
fbeq_cont.24442:
	beqi	%a0, 0, bnei_else.24443
	fmov	%f0, %fzero
	j	bnei_cont.24444
bnei_else.24443:
	fbne	%f1, %fzero, fbeq_else.24445
	add	%a0, %zero, %k1
	j	fbeq_cont.24446
fbeq_else.24445:
	add	%a0, %zero, %zero
fbeq_cont.24446:
	beqi	%a0, 0, bnei_else.24447
	fmov	%f0, %fzero
	j	bnei_cont.24448
bnei_else.24447:
	fblt	%fzero, %f1, fbgt_else.24449
	add	%a0, %zero, %zero
	j	fbgt_cont.24450
fbgt_else.24449:
	add	%a0, %zero, %k1
fbgt_cont.24450:
	beqi	%a0, 0, bnei_else.24451
	fmov	%f0, %f30
	j	bnei_cont.24452
bnei_else.24451:
	flw	%f0, 458(%zero)
bnei_cont.24452:
bnei_cont.24448:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.24444:
	fsw	%f0, 1(%s2)
	flw	%f1, 2(%s2)
	fbne	%f1, %fzero, fbeq_else.24453
	add	%a0, %zero, %k1
	j	fbeq_cont.24454
fbeq_else.24453:
	add	%a0, %zero, %zero
fbeq_cont.24454:
	beqi	%a0, 0, bnei_else.24455
	fmov	%f0, %fzero
	j	bnei_cont.24456
bnei_else.24455:
	fbne	%f1, %fzero, fbeq_else.24457
	add	%a0, %zero, %k1
	j	fbeq_cont.24458
fbeq_else.24457:
	add	%a0, %zero, %zero
fbeq_cont.24458:
	beqi	%a0, 0, bnei_else.24459
	fmov	%f0, %fzero
	j	bnei_cont.24460
bnei_else.24459:
	fblt	%fzero, %f1, fbgt_else.24461
	add	%a0, %zero, %zero
	j	fbgt_cont.24462
fbgt_else.24461:
	add	%a0, %zero, %k1
fbgt_cont.24462:
	beqi	%a0, 0, bnei_else.24463
	fmov	%f0, %f30
	j	bnei_cont.24464
bnei_else.24463:
	flw	%f0, 458(%zero)
bnei_cont.24464:
bnei_cont.24460:
	fmul	%f1, %f1, %f1
	fdiv	%f0, %f0, %f1
bnei_cont.24456:
	fsw	%f0, 2(%s2)
bnei_cont.24418:
	beqi	%s0, 0, bnei_else.24465
	addi	%v1, %s1, 0
	addi	%v0, %s2, 0
	jal	rotate_quadratic_matrix.2779
	j	bnei_cont.24466
bnei_else.24465:
bnei_cont.24466:
	add	%ra, %zero, %a2
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.24410:
	add	%ra, %zero, %a2
	add	%v0, %zero, %zero
	jr	%ra
read_object.2784:
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra
	blti	%t7, 60, bgti_else.24551
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.24551:
	addi	%v0, %t7, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.24553
	addi	%t7, %t7, 1
	blti	%t7, 60, bgti_else.24554
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.24554:
	addi	%v0, %t7, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.24556
	addi	%t7, %t7, 1
	blti	%t7, 60, bgti_else.24557
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.24557:
	addi	%v0, %t7, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.24559
	addi	%t7, %t7, 1
	blti	%t7, 60, bgti_else.24560
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.24560:
	addi	%v0, %t7, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.24562
	addi	%t7, %t7, 1
	blti	%t7, 60, bgti_else.24563
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.24563:
	addi	%v0, %t7, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.24565
	addi	%t7, %t7, 1
	blti	%t7, 60, bgti_else.24566
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.24566:
	addi	%v0, %t7, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.24568
	addi	%t7, %t7, 1
	blti	%t7, 60, bgti_else.24569
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.24569:
	addi	%v0, %t7, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.24571
	addi	%t7, %t7, 1
	blti	%t7, 60, bgti_else.24572
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.24572:
	addi	%v0, %t7, 0
	jal	read_nth_object.2782
	beqi	%v0, 0, bnei_else.24574
	addi	%v0, %t7, 1
	add	%ra, %zero, %t8
	j	read_object.2784
bnei_else.24574:
	add	%ra, %zero, %t8
	sw	%t7, 0(%zero)
	jr	%ra
bnei_else.24571:
	add	%ra, %zero, %t8
	sw	%t7, 0(%zero)
	jr	%ra
bnei_else.24568:
	add	%ra, %zero, %t8
	sw	%t7, 0(%zero)
	jr	%ra
bnei_else.24565:
	add	%ra, %zero, %t8
	sw	%t7, 0(%zero)
	jr	%ra
bnei_else.24562:
	add	%ra, %zero, %t8
	sw	%t7, 0(%zero)
	jr	%ra
bnei_else.24559:
	add	%ra, %zero, %t8
	sw	%t7, 0(%zero)
	jr	%ra
bnei_else.24556:
	add	%ra, %zero, %t8
	sw	%t7, 0(%zero)
	jr	%ra
bnei_else.24553:
	add	%ra, %zero, %t8
	sw	%t7, 0(%zero)
	jr	%ra
read_net_item.2788:
	sw	%v0, 0(%sp)
	sw	%t6, 1(%sp)
	sw	%t5, 2(%sp)
	sw	%t4, 3(%sp)
	sw	%t3, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%t1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t0, %v0, 0
	addi	%a0, %zero, -1
	beqi	%t0, -1, bnei_else.24655
	lw	%a1, 0(%sp)
	addi	%t1, %a1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t2, %v0, 0
	beqi	%t2, -1, bnei_else.24656
	addi	%t3, %t1, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t4, %v0, 0
	beqi	%t4, -1, bnei_else.24658
	addi	%t5, %t3, 1
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	addi	%t6, %v0, 0
	beqi	%t6, -1, bnei_else.24660
	addi	%v0, %t5, 1
	addi	%sp, %sp, 9
	jal	read_net_item.2788
	addi	%sp, %sp, -9
	add	%at, %v0, %t5
	sw	%t6, 0(%at)
	j	bnei_cont.24661
bnei_else.24660:
	addi	%v0, %t5, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.24661:
	add	%at, %v0, %t3
	sw	%t4, 0(%at)
	j	bnei_cont.24659
bnei_else.24658:
	addi	%v0, %t3, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.24659:
	add	%at, %v0, %t1
	sw	%t2, 0(%at)
	j	bnei_cont.24657
bnei_else.24656:
	addi	%v0, %t1, 1
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9
	jal	min_caml_create_array
	addi	%sp, %sp, -9
bnei_cont.24657:
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%t0, 0(%at)
	lw	%t6, 1(%sp)
	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	lw	%t3, 4(%sp)
	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	jr	%ra
bnei_else.24655:
	lw	%a1, 0(%sp)
	addi	%v0, %a1, 1
	lw	%t6, 1(%sp)
	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	lw	%t3, 4(%sp)
	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	addi	%v1, %a0, 0
	j	min_caml_create_array
read_or_network.2790:
	sw	%v0, 0(%sp)
	sw	%t1, 1(%sp)
	sw	%t0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	addi	%a3, %zero, -1
	beqi	%a2, -1, bnei_else.24739
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.24741
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0
	beqi	%s0, -1, bnei_else.24743
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4
	jal	read_net_item.2788
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	sw	%s0, 2(%v1)
	j	bnei_cont.24744
bnei_else.24743:
	addi	%v0, %zero, 3
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.24744:
	sw	%k0, 1(%v1)
	j	bnei_cont.24742
bnei_else.24741:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.24742:
	sw	%a2, 0(%v1)
	j	bnei_cont.24740
bnei_else.24739:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
bnei_cont.24740:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	beqi	%a0, -1, bnei_else.24745
	lw	%a0, 0(%sp)
	addi	%t0, %a0, 1
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.24746
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.24748
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5
	jal	read_net_item.2788
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
	sw	%k0, 1(%t1)
	j	bnei_cont.24749
bnei_else.24748:
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.24749:
	sw	%a2, 0(%t1)
	j	bnei_cont.24747
bnei_else.24746:
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0
bnei_cont.24747:
	lw	%a0, 0(%t1)
	beqi	%a0, -1, bnei_else.24750
	addi	%v0, %t0, 1
	addi	%sp, %sp, 5
	jal	read_or_network.2790
	addi	%sp, %sp, -5
	add	%at, %v0, %t0
	sw	%t1, 0(%at)
	j	bnei_cont.24751
bnei_else.24750:
	addi	%v0, %t0, 1
	addi	%v1, %t1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
bnei_cont.24751:
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	add	%at, %v0, %a0
	sw	%a1, 0(%at)
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.24745:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 1
	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	j	min_caml_create_array
read_and_network.2792:
	add	%a2, %zero, %v0
	add	%a3, %zero, %ra
	jal	min_caml_read_int
	addi	%k0, %v0, 0
	addi	%s0, %zero, -1
	beqi	%k0, -1, bnei_else.24806
	jal	min_caml_read_int
	addi	%s1, %v0, 0
	beqi	%s1, -1, bnei_else.24808
	jal	min_caml_read_int
	addi	%s2, %v0, 0
	beqi	%s2, -1, bnei_else.24810
	addi	%v0, %zero, 3
	jal	read_net_item.2788
	sw	%s2, 2(%v0)
	j	bnei_cont.24811
bnei_else.24810:
	addi	%v0, %zero, 3
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.24811:
	sw	%s1, 1(%v0)
	j	bnei_cont.24809
bnei_else.24808:
	addi	%v0, %zero, 2
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.24809:
	sw	%k0, 0(%v0)
	j	bnei_cont.24807
bnei_else.24806:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.24807:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.24812
	sw	%v0, 83(%a2)
	addi	%s1, %a2, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.24813
	jal	min_caml_read_int
	addi	%k0, %v0, 0
	beqi	%k0, -1, bnei_else.24815
	addi	%v0, %zero, 2
	jal	read_net_item.2788
	sw	%k0, 1(%v0)
	j	bnei_cont.24816
bnei_else.24815:
	addi	%v0, %zero, 2
	addi	%v1, %s0, 0
	jal	min_caml_create_array
bnei_cont.24816:
	sw	%a2, 0(%v0)
	j	bnei_cont.24814
bnei_else.24813:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.24814:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.24817
	sw	%v0, 83(%s1)
	addi	%k0, %s1, 1
	jal	min_caml_read_int
	addi	%a2, %v0, 0
	beqi	%a2, -1, bnei_else.24818
	addi	%v0, %k1, 0
	jal	read_net_item.2788
	sw	%a2, 0(%v0)
	j	bnei_cont.24819
bnei_else.24818:
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
bnei_cont.24819:
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.24820
	sw	%v0, 83(%k0)
	addi	%a2, %k0, 1
	addi	%v0, %zero, 0
	jal	read_net_item.2788
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.24821
	sw	%v0, 83(%a2)
	addi	%v0, %a2, 1
	add	%ra, %zero, %a3
	j	read_and_network.2792
bnei_else.24821:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.24820:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.24817:
	add	%ra, %zero, %a3
	jr	%ra
bnei_else.24812:
	add	%ra, %zero, %a3
	jr	%ra
solver_rect.2805:
	flw	%f19, 0(%v1)
	fbne	%f19, %fzero, fbeq_else.24945
	add	%a0, %zero, %k1
	j	fbeq_cont.24946
fbeq_else.24945:
	add	%a0, %zero, %zero
fbeq_cont.24946:
	beqi	%a0, 0, bnei_else.24947
	add	%a0, %zero, %zero
	j	bnei_cont.24948
bnei_else.24947:
	lw	%a2, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f19, %fzero, fbgt_else.24949
	add	%a0, %zero, %zero
	j	fbgt_cont.24950
fbgt_else.24949:
	add	%a0, %zero, %k1
fbgt_cont.24950:
	beqi	%a1, 0, bnei_else.24951
	beqi	%a0, 0, bnei_else.24953
	add	%a0, %zero, %zero
	j	bnei_cont.24952
bnei_else.24953:
	add	%a0, %zero, %k1
bnei_cont.24954:
	j	bnei_cont.24952
bnei_else.24951:
bnei_cont.24952:
	flw	%f16, 0(%a2)
	beqi	%a0, 0, bnei_else.24955
	j	bnei_cont.24956
bnei_else.24955:
	fneg	%f16, %f16
bnei_cont.24956:
	fsub	%f16, %f16, %f0
	fdiv	%f18, %f16, %f19
	flw	%f16, 1(%v1)
	fmul	%f16, %f18, %f16
	fadd	%f16, %f16, %f1
	fabs	%f17, %f16
	flw	%f16, 1(%a2)
	fblt	%f17, %f16, fbgt_else.24957
	add	%a0, %zero, %zero
	j	fbgt_cont.24958
fbgt_else.24957:
	add	%a0, %zero, %k1
fbgt_cont.24958:
	beqi	%a0, 0, bnei_else.24959
	flw	%f16, 2(%v1)
	fmul	%f16, %f18, %f16
	fadd	%f16, %f16, %f2
	fabs	%f17, %f16
	flw	%f16, 2(%a2)
	fblt	%f17, %f16, fbgt_else.24961
	add	%a0, %zero, %zero
	j	fbgt_cont.24962
fbgt_else.24961:
	add	%a0, %zero, %k1
fbgt_cont.24962:
	beqi	%a0, 0, bnei_else.24963
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.24960
bnei_else.24963:
	add	%a0, %zero, %zero
bnei_cont.24964:
	j	bnei_cont.24960
bnei_else.24959:
	add	%a0, %zero, %zero
bnei_cont.24960:
bnei_cont.24948:
	beqi	%a0, 0, bnei_else.24965
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.24965:
	flw	%f18, 1(%v1)
	fbne	%f18, %fzero, fbeq_else.24966
	add	%a0, %zero, %k1
	j	fbeq_cont.24967
fbeq_else.24966:
	add	%a0, %zero, %zero
fbeq_cont.24967:
	beqi	%a0, 0, bnei_else.24968
	add	%a0, %zero, %zero
	j	bnei_cont.24969
bnei_else.24968:
	lw	%a2, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f18, %fzero, fbgt_else.24970
	add	%a0, %zero, %zero
	j	fbgt_cont.24971
fbgt_else.24970:
	add	%a0, %zero, %k1
fbgt_cont.24971:
	beqi	%a1, 0, bnei_else.24972
	beqi	%a0, 0, bnei_else.24974
	add	%a0, %zero, %zero
	j	bnei_cont.24973
bnei_else.24974:
	add	%a0, %zero, %k1
bnei_cont.24975:
	j	bnei_cont.24973
bnei_else.24972:
bnei_cont.24973:
	flw	%f16, 1(%a2)
	beqi	%a0, 0, bnei_else.24976
	j	bnei_cont.24977
bnei_else.24976:
	fneg	%f16, %f16
bnei_cont.24977:
	fsub	%f16, %f16, %f1
	fdiv	%f20, %f16, %f18
	flw	%f16, 2(%v1)
	fmul	%f16, %f20, %f16
	fadd	%f16, %f16, %f2
	fabs	%f17, %f16
	flw	%f16, 2(%a2)
	fblt	%f17, %f16, fbgt_else.24978
	add	%a0, %zero, %zero
	j	fbgt_cont.24979
fbgt_else.24978:
	add	%a0, %zero, %k1
fbgt_cont.24979:
	beqi	%a0, 0, bnei_else.24980
	fmul	%f16, %f20, %f19
	fadd	%f16, %f16, %f0
	fabs	%f17, %f16
	flw	%f16, 0(%a2)
	fblt	%f17, %f16, fbgt_else.24982
	add	%a0, %zero, %zero
	j	fbgt_cont.24983
fbgt_else.24982:
	add	%a0, %zero, %k1
fbgt_cont.24983:
	beqi	%a0, 0, bnei_else.24984
	fsw	%f20, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.24981
bnei_else.24984:
	add	%a0, %zero, %zero
bnei_cont.24985:
	j	bnei_cont.24981
bnei_else.24980:
	add	%a0, %zero, %zero
bnei_cont.24981:
bnei_cont.24969:
	beqi	%a0, 0, bnei_else.24986
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.24986:
	flw	%f17, 2(%v1)
	fbne	%f17, %fzero, fbeq_else.24987
	add	%a0, %zero, %k1
	j	fbeq_cont.24988
fbeq_else.24987:
	add	%a0, %zero, %zero
fbeq_cont.24988:
	beqi	%a0, 0, bnei_else.24989
	add	%a0, %zero, %zero
	j	bnei_cont.24990
bnei_else.24989:
	lw	%a2, 4(%v0)
	lw	%a1, 6(%v0)
	fblt	%f17, %fzero, fbgt_else.24991
	add	%a0, %zero, %zero
	j	fbgt_cont.24992
fbgt_else.24991:
	add	%a0, %zero, %k1
fbgt_cont.24992:
	beqi	%a1, 0, bnei_else.24993
	beqi	%a0, 0, bnei_else.24995
	add	%a0, %zero, %zero
	j	bnei_cont.24994
bnei_else.24995:
	add	%a0, %zero, %k1
bnei_cont.24996:
	j	bnei_cont.24994
bnei_else.24993:
bnei_cont.24994:
	flw	%f16, 2(%a2)
	beqi	%a0, 0, bnei_else.24997
	j	bnei_cont.24998
bnei_else.24997:
	fneg	%f16, %f16
bnei_cont.24998:
	fsub	%f16, %f16, %f2
	fdiv	%f17, %f16, %f17
	fmul	%f16, %f17, %f19
	fadd	%f0, %f16, %f0
	fabs	%f16, %f0
	flw	%f0, 0(%a2)
	fblt	%f16, %f0, fbgt_else.24999
	add	%a0, %zero, %zero
	j	fbgt_cont.25000
fbgt_else.24999:
	add	%a0, %zero, %k1
fbgt_cont.25000:
	beqi	%a0, 0, bnei_else.25001
	fmul	%f0, %f17, %f18
	fadd	%f0, %f0, %f1
	fabs	%f1, %f0
	flw	%f0, 1(%a2)
	fblt	%f1, %f0, fbgt_else.25003
	add	%a0, %zero, %zero
	j	fbgt_cont.25004
fbgt_else.25003:
	add	%a0, %zero, %k1
fbgt_cont.25004:
	beqi	%a0, 0, bnei_else.25005
	fsw	%f17, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.25002
bnei_else.25005:
	add	%a0, %zero, %zero
bnei_cont.25006:
	j	bnei_cont.25002
bnei_else.25001:
	add	%a0, %zero, %zero
bnei_cont.25002:
bnei_cont.24990:
	beqi	%a0, 0, bnei_else.25007
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.25007:
	add	%v0, %zero, %zero
	jr	%ra
solver_second.2830:
	flw	%f22, 0(%v1)
	flw	%f21, 1(%v1)
	flw	%f23, 2(%v1)
	fmul	%f17, %f22, %f22
	lw	%a0, 4(%v0)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%v0)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f23, %f23
	lw	%a0, 4(%v0)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%v0)
	beqi	%a0, 0, bnei_else.25055
	fmul	%f18, %f21, %f23
	lw	%a0, 9(%v0)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f23, %f22
	lw	%a0, 9(%v0)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f22, %f21
	lw	%a0, 9(%v0)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.25056
bnei_else.25055:
bnei_cont.25056:
	fbne	%f16, %fzero, fbeq_else.25057
	add	%a0, %zero, %k1
	j	fbeq_cont.25058
fbeq_else.25057:
	add	%a0, %zero, %zero
fbeq_cont.25058:
	beqi	%a0, 0, bnei_else.25059
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.25059:
	fmul	%f18, %f22, %f0
	lw	%a0, 4(%v0)
	flw	%f17, 0(%a0)
	fmul	%f19, %f18, %f17
	fmul	%f18, %f21, %f1
	lw	%a0, 4(%v0)
	flw	%f17, 1(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f19, %f19, %f17
	fmul	%f18, %f23, %f2
	lw	%a0, 4(%v0)
	flw	%f17, 2(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f17, %f19, %f17
	lw	%a0, 3(%v0)
	beqi	%a0, 0, bnei_else.25060
	fmul	%f19, %f23, %f1
	fmul	%f18, %f21, %f2
	fadd	%f19, %f19, %f18
	lw	%a0, 9(%v0)
	flw	%f18, 0(%a0)
	fmul	%f20, %f19, %f18
	fmul	%f19, %f22, %f2
	fmul	%f18, %f23, %f0
	fadd	%f19, %f19, %f18
	lw	%a0, 9(%v0)
	flw	%f18, 1(%a0)
	fmul	%f18, %f19, %f18
	fadd	%f20, %f20, %f18
	fmul	%f19, %f22, %f1
	fmul	%f18, %f21, %f0
	fadd	%f19, %f19, %f18
	lw	%a0, 9(%v0)
	flw	%f18, 2(%a0)
	fmul	%f18, %f19, %f18
	fadd	%f19, %f20, %f18
	flw	%f18, 473(%zero)
	fmul	%f18, %f19, %f18
	fadd	%f17, %f17, %f18
	j	bnei_cont.25061
bnei_else.25060:
bnei_cont.25061:
	fmul	%f19, %f0, %f0
	lw	%a0, 4(%v0)
	flw	%f18, 0(%a0)
	fmul	%f20, %f19, %f18
	fmul	%f19, %f1, %f1
	lw	%a0, 4(%v0)
	flw	%f18, 1(%a0)
	fmul	%f18, %f19, %f18
	fadd	%f20, %f20, %f18
	fmul	%f19, %f2, %f2
	lw	%a0, 4(%v0)
	flw	%f18, 2(%a0)
	fmul	%f18, %f19, %f18
	fadd	%f18, %f20, %f18
	lw	%a0, 3(%v0)
	beqi	%a0, 0, bnei_else.25062
	fmul	%f20, %f1, %f2
	lw	%a0, 9(%v0)
	flw	%f19, 0(%a0)
	fmul	%f19, %f20, %f19
	fadd	%f20, %f18, %f19
	fmul	%f19, %f2, %f0
	lw	%a0, 9(%v0)
	flw	%f18, 1(%a0)
	fmul	%f18, %f19, %f18
	fadd	%f18, %f20, %f18
	fmul	%f1, %f0, %f1
	lw	%a0, 9(%v0)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f18, %f18, %f0
	j	bnei_cont.25063
bnei_else.25062:
bnei_cont.25063:
	lw	%a0, 1(%v0)
	beqi	%a0, 3, bnei_else.25064
	j	bnei_cont.25065
bnei_else.25064:
	fsub	%f18, %f18, %f30
bnei_cont.25065:
	fmul	%f1, %f17, %f17
	fmul	%f0, %f16, %f18
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.25066
	add	%a0, %zero, %zero
	j	fbgt_cont.25067
fbgt_else.25066:
	add	%a0, %zero, %k1
fbgt_cont.25067:
	beqi	%a0, 0, bnei_else.25068
	fsqrt	%f0, %f0
	lw	%a0, 6(%v0)
	beqi	%a0, 0, bnei_else.25069
	j	bnei_cont.25070
bnei_else.25069:
	fneg	%f0, %f0
bnei_cont.25070:
	fsub	%f0, %f0, %f17
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.25068:
	add	%v0, %zero, %zero
	jr	%ra
solver.2836:
	lw	%a1, 12(%v0)
	flw	%f1, 0(%a0)
	lw	%a2, 5(%a1)
	flw	%f0, 0(%a2)
	fsub	%f19, %f1, %f0
	flw	%f1, 1(%a0)
	lw	%a2, 5(%a1)
	flw	%f0, 1(%a2)
	fsub	%f2, %f1, %f0
	flw	%f1, 2(%a0)
	lw	%a0, 5(%a1)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.25229
	beqi	%a0, 2, bnei_else.25230
	flw	%f22, 0(%v1)
	flw	%f21, 1(%v1)
	flw	%f23, 2(%v1)
	fmul	%f1, %f22, %f22
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f23, %f23
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.25231
	fmul	%f16, %f21, %f23
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f23, %f22
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f22, %f21
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.25232
bnei_else.25231:
bnei_cont.25232:
	fbne	%f0, %fzero, fbeq_else.25233
	add	%a0, %zero, %k1
	j	fbeq_cont.25234
fbeq_else.25233:
	add	%a0, %zero, %zero
fbeq_cont.25234:
	beqi	%a0, 0, bnei_else.25235
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.25235:
	fmul	%f16, %f22, %f19
	lw	%a0, 4(%a1)
	flw	%f1, 0(%a0)
	fmul	%f17, %f16, %f1
	fmul	%f16, %f21, %f2
	lw	%a0, 4(%a1)
	flw	%f1, 1(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f17, %f17, %f1
	fmul	%f16, %f23, %f20
	lw	%a0, 4(%a1)
	flw	%f1, 2(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f1, %f17, %f1
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.25236
	fmul	%f17, %f23, %f2
	fmul	%f16, %f21, %f20
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f22, %f20
	fmul	%f16, %f23, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f22, %f2
	fmul	%f16, %f21, %f19
	fadd	%f17, %f17, %f16
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f17, %f18, %f16
	flw	%f16, 473(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f1, %f1, %f16
	j	bnei_cont.25237
bnei_else.25236:
bnei_cont.25237:
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f2, %f2
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.25238
	fmul	%f18, %f2, %f20
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f2
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.25239
bnei_else.25238:
bnei_cont.25239:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.25240
	j	bnei_cont.25241
bnei_else.25240:
	fsub	%f16, %f16, %f30
bnei_cont.25241:
	fmul	%f17, %f1, %f1
	fmul	%f16, %f0, %f16
	fsub	%f16, %f17, %f16
	fblt	%fzero, %f16, fbgt_else.25242
	add	%a0, %zero, %zero
	j	fbgt_cont.25243
fbgt_else.25242:
	add	%a0, %zero, %k1
fbgt_cont.25243:
	beqi	%a0, 0, bnei_else.25244
	fsqrt	%f16, %f16
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.25245
	j	bnei_cont.25246
bnei_else.25245:
	fneg	%f16, %f16
bnei_cont.25246:
	fsub	%f1, %f16, %f1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.25244:
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.25230:
	lw	%a0, 4(%a1)
	flw	%f0, 0(%v1)
	flw	%f21, 0(%a0)
	fmul	%f1, %f0, %f21
	flw	%f0, 1(%v1)
	flw	%f18, 1(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%v1)
	flw	%f17, 2(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f16, %f1, %f0
	fblt	%fzero, %f16, fbgt_else.25247
	add	%a0, %zero, %zero
	j	fbgt_cont.25248
fbgt_else.25247:
	add	%a0, %zero, %k1
fbgt_cont.25248:
	beqi	%a0, 0, bnei_else.25249
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f16
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.25249:
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.25229:
	flw	%f17, 0(%v1)
	fbne	%f17, %fzero, fbeq_else.25250
	add	%a0, %zero, %k1
	j	fbeq_cont.25251
fbeq_else.25250:
	add	%a0, %zero, %zero
fbeq_cont.25251:
	beqi	%a0, 0, bnei_else.25252
	add	%a0, %zero, %zero
	j	bnei_cont.25253
bnei_else.25252:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f17, %fzero, fbgt_else.25254
	add	%a0, %zero, %zero
	j	fbgt_cont.25255
fbgt_else.25254:
	add	%a0, %zero, %k1
fbgt_cont.25255:
	beqi	%a2, 0, bnei_else.25256
	beqi	%a0, 0, bnei_else.25258
	add	%a0, %zero, %zero
	j	bnei_cont.25257
bnei_else.25258:
	add	%a0, %zero, %k1
bnei_cont.25259:
	j	bnei_cont.25257
bnei_else.25256:
bnei_cont.25257:
	flw	%f0, 0(%a3)
	beqi	%a0, 0, bnei_else.25260
	j	bnei_cont.25261
bnei_else.25260:
	fneg	%f0, %f0
bnei_cont.25261:
	fsub	%f0, %f0, %f19
	fdiv	%f16, %f0, %f17
	flw	%f0, 1(%v1)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a3)
	fblt	%f1, %f0, fbgt_else.25262
	add	%a0, %zero, %zero
	j	fbgt_cont.25263
fbgt_else.25262:
	add	%a0, %zero, %k1
fbgt_cont.25263:
	beqi	%a0, 0, bnei_else.25264
	flw	%f0, 2(%v1)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.25266
	add	%a0, %zero, %zero
	j	fbgt_cont.25267
fbgt_else.25266:
	add	%a0, %zero, %k1
fbgt_cont.25267:
	beqi	%a0, 0, bnei_else.25268
	fsw	%f16, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.25265
bnei_else.25268:
	add	%a0, %zero, %zero
bnei_cont.25269:
	j	bnei_cont.25265
bnei_else.25264:
	add	%a0, %zero, %zero
bnei_cont.25265:
bnei_cont.25253:
	beqi	%a0, 0, bnei_else.25270
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.25270:
	flw	%f16, 1(%v1)
	fbne	%f16, %fzero, fbeq_else.25271
	add	%a0, %zero, %k1
	j	fbeq_cont.25272
fbeq_else.25271:
	add	%a0, %zero, %zero
fbeq_cont.25272:
	beqi	%a0, 0, bnei_else.25273
	add	%a0, %zero, %zero
	j	bnei_cont.25274
bnei_else.25273:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.25275
	add	%a0, %zero, %zero
	j	fbgt_cont.25276
fbgt_else.25275:
	add	%a0, %zero, %k1
fbgt_cont.25276:
	beqi	%a2, 0, bnei_else.25277
	beqi	%a0, 0, bnei_else.25279
	add	%a0, %zero, %zero
	j	bnei_cont.25278
bnei_else.25279:
	add	%a0, %zero, %k1
bnei_cont.25280:
	j	bnei_cont.25278
bnei_else.25277:
bnei_cont.25278:
	flw	%f0, 1(%a3)
	beqi	%a0, 0, bnei_else.25281
	j	bnei_cont.25282
bnei_else.25281:
	fneg	%f0, %f0
bnei_cont.25282:
	fsub	%f0, %f0, %f2
	fdiv	%f18, %f0, %f16
	flw	%f0, 2(%v1)
	fmul	%f0, %f18, %f0
	fadd	%f0, %f0, %f20
	fabs	%f1, %f0
	flw	%f0, 2(%a3)
	fblt	%f1, %f0, fbgt_else.25283
	add	%a0, %zero, %zero
	j	fbgt_cont.25284
fbgt_else.25283:
	add	%a0, %zero, %k1
fbgt_cont.25284:
	beqi	%a0, 0, bnei_else.25285
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a3)
	fblt	%f1, %f0, fbgt_else.25287
	add	%a0, %zero, %zero
	j	fbgt_cont.25288
fbgt_else.25287:
	add	%a0, %zero, %k1
fbgt_cont.25288:
	beqi	%a0, 0, bnei_else.25289
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.25286
bnei_else.25289:
	add	%a0, %zero, %zero
bnei_cont.25290:
	j	bnei_cont.25286
bnei_else.25285:
	add	%a0, %zero, %zero
bnei_cont.25286:
bnei_cont.25274:
	beqi	%a0, 0, bnei_else.25291
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.25291:
	flw	%f1, 2(%v1)
	fbne	%f1, %fzero, fbeq_else.25292
	add	%a0, %zero, %k1
	j	fbeq_cont.25293
fbeq_else.25292:
	add	%a0, %zero, %zero
fbeq_cont.25293:
	beqi	%a0, 0, bnei_else.25294
	add	%a0, %zero, %zero
	j	bnei_cont.25295
bnei_else.25294:
	lw	%a2, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.25296
	add	%a0, %zero, %zero
	j	fbgt_cont.25297
fbgt_else.25296:
	add	%a0, %zero, %k1
fbgt_cont.25297:
	beqi	%a1, 0, bnei_else.25298
	beqi	%a0, 0, bnei_else.25300
	add	%a0, %zero, %zero
	j	bnei_cont.25299
bnei_else.25300:
	add	%a0, %zero, %k1
bnei_cont.25301:
	j	bnei_cont.25299
bnei_else.25298:
bnei_cont.25299:
	flw	%f0, 2(%a2)
	beqi	%a0, 0, bnei_else.25302
	j	bnei_cont.25303
bnei_else.25302:
	fneg	%f0, %f0
bnei_cont.25303:
	fsub	%f0, %f0, %f20
	fdiv	%f18, %f0, %f1
	fmul	%f0, %f18, %f17
	fadd	%f0, %f0, %f19
	fabs	%f1, %f0
	flw	%f0, 0(%a2)
	fblt	%f1, %f0, fbgt_else.25304
	add	%a0, %zero, %zero
	j	fbgt_cont.25305
fbgt_else.25304:
	add	%a0, %zero, %k1
fbgt_cont.25305:
	beqi	%a0, 0, bnei_else.25306
	fmul	%f0, %f18, %f16
	fadd	%f0, %f0, %f2
	fabs	%f1, %f0
	flw	%f0, 1(%a2)
	fblt	%f1, %f0, fbgt_else.25308
	add	%a0, %zero, %zero
	j	fbgt_cont.25309
fbgt_else.25308:
	add	%a0, %zero, %k1
fbgt_cont.25309:
	beqi	%a0, 0, bnei_else.25310
	fsw	%f18, 135(%zero)
	add	%a0, %zero, %k1
	j	bnei_cont.25307
bnei_else.25310:
	add	%a0, %zero, %zero
bnei_cont.25311:
	j	bnei_cont.25307
bnei_else.25306:
	add	%a0, %zero, %zero
bnei_cont.25307:
bnei_cont.25295:
	beqi	%a0, 0, bnei_else.25312
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.25312:
	add	%v0, %zero, %zero
	jr	%ra
solver_rect_fast.2840:
	flw	%f16, 0(%a0)
	fsub	%f16, %f16, %f0
	flw	%f20, 1(%a0)
	fmul	%f19, %f16, %f20
	flw	%f18, 1(%v1)
	fmul	%f16, %f19, %f18
	fadd	%f16, %f16, %f1
	fabs	%f17, %f16
	lw	%a1, 4(%v0)
	flw	%f16, 1(%a1)
	fblt	%f17, %f16, fbgt_else.25396
	add	%a1, %zero, %zero
	j	fbgt_cont.25397
fbgt_else.25396:
	add	%a1, %zero, %k1
fbgt_cont.25397:
	beqi	%a1, 0, bnei_else.25398
	flw	%f16, 2(%v1)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f16, %f2
	fabs	%f17, %f16
	lw	%a1, 4(%v0)
	flw	%f16, 2(%a1)
	fblt	%f17, %f16, fbgt_else.25400
	add	%a1, %zero, %zero
	j	fbgt_cont.25401
fbgt_else.25400:
	add	%a1, %zero, %k1
fbgt_cont.25401:
	beqi	%a1, 0, bnei_else.25402
	fbne	%f20, %fzero, fbeq_else.25404
	add	%a1, %zero, %k1
	j	fbeq_cont.25405
fbeq_else.25404:
	add	%a1, %zero, %zero
fbeq_cont.25405:
	beqi	%a1, 0, bnei_else.25406
	add	%a1, %zero, %zero
	j	bnei_cont.25399
bnei_else.25406:
	add	%a1, %zero, %k1
bnei_cont.25407:
	j	bnei_cont.25399
bnei_else.25402:
	add	%a1, %zero, %zero
bnei_cont.25403:
	j	bnei_cont.25399
bnei_else.25398:
	add	%a1, %zero, %zero
bnei_cont.25399:
	beqi	%a1, 0, bnei_else.25408
	fsw	%f19, 135(%zero)
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.25408:
	flw	%f16, 2(%a0)
	fsub	%f16, %f16, %f1
	flw	%f21, 3(%a0)
	fmul	%f19, %f16, %f21
	flw	%f20, 0(%v1)
	fmul	%f16, %f19, %f20
	fadd	%f16, %f16, %f0
	fabs	%f17, %f16
	lw	%a1, 4(%v0)
	flw	%f16, 0(%a1)
	fblt	%f17, %f16, fbgt_else.25409
	add	%a1, %zero, %zero
	j	fbgt_cont.25410
fbgt_else.25409:
	add	%a1, %zero, %k1
fbgt_cont.25410:
	beqi	%a1, 0, bnei_else.25411
	flw	%f16, 2(%v1)
	fmul	%f16, %f19, %f16
	fadd	%f16, %f16, %f2
	fabs	%f17, %f16
	lw	%a1, 4(%v0)
	flw	%f16, 2(%a1)
	fblt	%f17, %f16, fbgt_else.25413
	add	%a1, %zero, %zero
	j	fbgt_cont.25414
fbgt_else.25413:
	add	%a1, %zero, %k1
fbgt_cont.25414:
	beqi	%a1, 0, bnei_else.25415
	fbne	%f21, %fzero, fbeq_else.25417
	add	%a1, %zero, %k1
	j	fbeq_cont.25418
fbeq_else.25417:
	add	%a1, %zero, %zero
fbeq_cont.25418:
	beqi	%a1, 0, bnei_else.25419
	add	%a1, %zero, %zero
	j	bnei_cont.25412
bnei_else.25419:
	add	%a1, %zero, %k1
bnei_cont.25420:
	j	bnei_cont.25412
bnei_else.25415:
	add	%a1, %zero, %zero
bnei_cont.25416:
	j	bnei_cont.25412
bnei_else.25411:
	add	%a1, %zero, %zero
bnei_cont.25412:
	beqi	%a1, 0, bnei_else.25421
	fsw	%f19, 135(%zero)
	addi	%v0, %zero, 2
	jr	%ra
bnei_else.25421:
	flw	%f16, 4(%a0)
	fsub	%f16, %f16, %f2
	flw	%f19, 5(%a0)
	fmul	%f17, %f16, %f19
	fmul	%f16, %f17, %f20
	fadd	%f0, %f16, %f0
	fabs	%f16, %f0
	lw	%a0, 4(%v0)
	flw	%f0, 0(%a0)
	fblt	%f16, %f0, fbgt_else.25422
	add	%a0, %zero, %zero
	j	fbgt_cont.25423
fbgt_else.25422:
	add	%a0, %zero, %k1
fbgt_cont.25423:
	beqi	%a0, 0, bnei_else.25424
	fmul	%f0, %f17, %f18
	fadd	%f0, %f0, %f1
	fabs	%f1, %f0
	lw	%a0, 4(%v0)
	flw	%f0, 1(%a0)
	fblt	%f1, %f0, fbgt_else.25426
	add	%a0, %zero, %zero
	j	fbgt_cont.25427
fbgt_else.25426:
	add	%a0, %zero, %k1
fbgt_cont.25427:
	beqi	%a0, 0, bnei_else.25428
	fbne	%f19, %fzero, fbeq_else.25430
	add	%a0, %zero, %k1
	j	fbeq_cont.25431
fbeq_else.25430:
	add	%a0, %zero, %zero
fbeq_cont.25431:
	beqi	%a0, 0, bnei_else.25432
	add	%a0, %zero, %zero
	j	bnei_cont.25425
bnei_else.25432:
	add	%a0, %zero, %k1
bnei_cont.25433:
	j	bnei_cont.25425
bnei_else.25428:
	add	%a0, %zero, %zero
bnei_cont.25429:
	j	bnei_cont.25425
bnei_else.25424:
	add	%a0, %zero, %zero
bnei_cont.25425:
	beqi	%a0, 0, bnei_else.25434
	fsw	%f17, 135(%zero)
	addi	%v0, %zero, 3
	jr	%ra
bnei_else.25434:
	add	%v0, %zero, %zero
	jr	%ra
solver_second_fast.2853:
	flw	%f20, 0(%v1)
	fbne	%f20, %fzero, fbeq_else.25476
	add	%a0, %zero, %k1
	j	fbeq_cont.25477
fbeq_else.25476:
	add	%a0, %zero, %zero
fbeq_cont.25477:
	beqi	%a0, 0, bnei_else.25478
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.25478:
	flw	%f16, 1(%v1)
	fmul	%f17, %f16, %f0
	flw	%f16, 2(%v1)
	fmul	%f16, %f16, %f1
	fadd	%f17, %f17, %f16
	flw	%f16, 3(%v1)
	fmul	%f16, %f16, %f2
	fadd	%f18, %f17, %f16
	fmul	%f17, %f0, %f0
	lw	%a0, 4(%v0)
	flw	%f16, 0(%a0)
	fmul	%f19, %f17, %f16
	fmul	%f17, %f1, %f1
	lw	%a0, 4(%v0)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f19, %f19, %f16
	fmul	%f17, %f2, %f2
	lw	%a0, 4(%v0)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f19, %f16
	lw	%a0, 3(%v0)
	beqi	%a0, 0, bnei_else.25479
	fmul	%f19, %f1, %f2
	lw	%a0, 9(%v0)
	flw	%f17, 0(%a0)
	fmul	%f17, %f19, %f17
	fadd	%f19, %f16, %f17
	fmul	%f17, %f2, %f0
	lw	%a0, 9(%v0)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f19, %f16
	fmul	%f1, %f0, %f1
	lw	%a0, 9(%v0)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	j	bnei_cont.25480
bnei_else.25479:
bnei_cont.25480:
	lw	%a0, 1(%v0)
	beqi	%a0, 3, bnei_else.25481
	j	bnei_cont.25482
bnei_else.25481:
	fsub	%f16, %f16, %f30
bnei_cont.25482:
	fmul	%f1, %f18, %f18
	fmul	%f0, %f20, %f16
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.25483
	add	%a0, %zero, %zero
	j	fbgt_cont.25484
fbgt_else.25483:
	add	%a0, %zero, %k1
fbgt_cont.25484:
	beqi	%a0, 0, bnei_else.25485
	lw	%a0, 6(%v0)
	beqi	%a0, 0, bnei_else.25486
	fsqrt	%f0, %f0
	fadd	%f1, %f18, %f0
	flw	%f0, 4(%v1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.25487
bnei_else.25486:
	fsqrt	%f0, %f0
	fsub	%f1, %f18, %f0
	flw	%f0, 4(%v1)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.25487:
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.25485:
	add	%v0, %zero, %zero
	jr	%ra
solver_fast2.2877:
	add	%a0, %zero, %v0
	lw	%v0, 12(%a0)
	lw	%a2, 10(%v0)
	flw	%f0, 0(%a2)
	flw	%f1, 1(%a2)
	flw	%f2, 2(%a2)
	lw	%a1, 1(%v1)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a1, 1(%v0)
	beqi	%a1, 1, bnei_else.25535
	beqi	%a1, 2, bnei_else.25536
	flw	%f17, 0(%a0)
	fbne	%f17, %fzero, fbeq_else.25537
	add	%a1, %zero, %k1
	j	fbeq_cont.25538
fbeq_else.25537:
	add	%a1, %zero, %zero
fbeq_cont.25538:
	beqi	%a1, 0, bnei_else.25539
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.25539:
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f1
	fadd	%f1, %f16, %f0
	flw	%f0, 3(%a0)
	fmul	%f0, %f0, %f2
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.25540
	add	%a1, %zero, %zero
	j	fbgt_cont.25541
fbgt_else.25540:
	add	%a1, %zero, %k1
fbgt_cont.25541:
	beqi	%a1, 0, bnei_else.25542
	lw	%a1, 6(%v0)
	beqi	%a1, 0, bnei_else.25543
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.25544
bnei_else.25543:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.25544:
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.25542:
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.25536:
	flw	%f1, 0(%a0)
	fblt	%f1, %fzero, fbgt_else.25545
	add	%a0, %zero, %zero
	j	fbgt_cont.25546
fbgt_else.25545:
	add	%a0, %zero, %k1
fbgt_cont.25546:
	beqi	%a0, 0, bnei_else.25547
	flw	%f0, 3(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.25547:
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.25535:
	lw	%v1, 0(%v1)
	j	solver_rect_fast.2840
setup_rect_table.2880:
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1
	add	%a2, %zero, %ra
	addi	%v0, %zero, 6
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%a0)
	fbne	%f1, %fzero, fbeq_else.25622
	add	%a3, %zero, %k1
	j	fbeq_cont.25623
fbeq_else.25622:
	add	%a3, %zero, %zero
fbeq_cont.25623:
	beqi	%a3, 0, bnei_else.25624
	fsw	%fzero, 1(%v0)
	j	bnei_cont.25625
bnei_else.25624:
	lw	%k0, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.25626
	add	%a3, %zero, %zero
	j	fbgt_cont.25627
fbgt_else.25626:
	add	%a3, %zero, %k1
fbgt_cont.25627:
	beqi	%k0, 0, bnei_else.25628
	beqi	%a3, 0, bnei_else.25630
	add	%a3, %zero, %zero
	j	bnei_cont.25629
bnei_else.25630:
	add	%a3, %zero, %k1
bnei_cont.25631:
	j	bnei_cont.25629
bnei_else.25628:
bnei_cont.25629:
	lw	%k0, 4(%a1)
	flw	%f0, 0(%k0)
	beqi	%a3, 0, bnei_else.25632
	j	bnei_cont.25633
bnei_else.25632:
	fneg	%f0, %f0
bnei_cont.25633:
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 1(%v0)
bnei_cont.25625:
	flw	%f1, 1(%a0)
	fbne	%f1, %fzero, fbeq_else.25634
	add	%a3, %zero, %k1
	j	fbeq_cont.25635
fbeq_else.25634:
	add	%a3, %zero, %zero
fbeq_cont.25635:
	beqi	%a3, 0, bnei_else.25636
	fsw	%fzero, 3(%v0)
	j	bnei_cont.25637
bnei_else.25636:
	lw	%k0, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.25638
	add	%a3, %zero, %zero
	j	fbgt_cont.25639
fbgt_else.25638:
	add	%a3, %zero, %k1
fbgt_cont.25639:
	beqi	%k0, 0, bnei_else.25640
	beqi	%a3, 0, bnei_else.25642
	add	%a3, %zero, %zero
	j	bnei_cont.25641
bnei_else.25642:
	add	%a3, %zero, %k1
bnei_cont.25643:
	j	bnei_cont.25641
bnei_else.25640:
bnei_cont.25641:
	lw	%k0, 4(%a1)
	flw	%f0, 1(%k0)
	beqi	%a3, 0, bnei_else.25644
	j	bnei_cont.25645
bnei_else.25644:
	fneg	%f0, %f0
bnei_cont.25645:
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 3(%v0)
bnei_cont.25637:
	flw	%f1, 2(%a0)
	fbne	%f1, %fzero, fbeq_else.25646
	add	%a0, %zero, %k1
	j	fbeq_cont.25647
fbeq_else.25646:
	add	%a0, %zero, %zero
fbeq_cont.25647:
	beqi	%a0, 0, bnei_else.25648
	fsw	%fzero, 5(%v0)
	j	bnei_cont.25649
bnei_else.25648:
	lw	%a3, 6(%a1)
	fblt	%f1, %fzero, fbgt_else.25650
	add	%a0, %zero, %zero
	j	fbgt_cont.25651
fbgt_else.25650:
	add	%a0, %zero, %k1
fbgt_cont.25651:
	beqi	%a3, 0, bnei_else.25652
	beqi	%a0, 0, bnei_else.25654
	add	%a0, %zero, %zero
	j	bnei_cont.25653
bnei_else.25654:
	add	%a0, %zero, %k1
bnei_cont.25655:
	j	bnei_cont.25653
bnei_else.25652:
bnei_cont.25653:
	lw	%a1, 4(%a1)
	flw	%f0, 2(%a1)
	beqi	%a0, 0, bnei_else.25656
	j	bnei_cont.25657
bnei_else.25656:
	fneg	%f0, %f0
bnei_cont.25657:
	fsw	%f0, 4(%v0)
	fdiv	%f0, %f30, %f1
	fsw	%f0, 5(%v0)
bnei_cont.25649:
	add	%ra, %zero, %a2
	jr	%ra
setup_second_table.2886:
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1
	add	%a2, %zero, %ra
	addi	%v0, %zero, 5
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f19, 0(%a0)
	flw	%f2, 1(%a0)
	flw	%f21, 2(%a0)
	fmul	%f1, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.25690
	fmul	%f16, %f2, %f21
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f19, %f2
	lw	%a0, 9(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.25691
bnei_else.25690:
bnei_cont.25691:
	lw	%a0, 4(%a1)
	flw	%f1, 0(%a0)
	fmul	%f1, %f19, %f1
	fneg	%f22, %f1
	lw	%a0, 4(%a1)
	flw	%f1, 1(%a0)
	fmul	%f1, %f2, %f1
	fneg	%f20, %f1
	lw	%a0, 4(%a1)
	flw	%f1, 2(%a0)
	fmul	%f1, %f21, %f1
	fneg	%f17, %f1
	fsw	%f0, 0(%v0)
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.25692
	lw	%a0, 9(%a1)
	flw	%f1, 1(%a0)
	fmul	%f16, %f21, %f1
	lw	%a0, 9(%a1)
	flw	%f1, 2(%a0)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f16, %f1
	flw	%f18, 473(%zero)
	fmul	%f1, %f1, %f18
	fsub	%f1, %f22, %f1
	fsw	%f1, 1(%v0)
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f16, %f21, %f1
	lw	%a0, 9(%a1)
	flw	%f1, 2(%a0)
	fmul	%f1, %f19, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f18
	fsub	%f1, %f20, %f1
	fsw	%f1, 2(%v0)
	lw	%a0, 9(%a1)
	flw	%f1, 0(%a0)
	fmul	%f16, %f2, %f1
	lw	%a0, 9(%a1)
	flw	%f1, 1(%a0)
	fmul	%f1, %f19, %f1
	fadd	%f1, %f16, %f1
	fmul	%f1, %f1, %f18
	fsub	%f1, %f17, %f1
	fsw	%f1, 3(%v0)
	j	bnei_cont.25693
bnei_else.25692:
	fsw	%f22, 1(%v0)
	fsw	%f20, 2(%v0)
	fsw	%f17, 3(%v0)
bnei_cont.25693:
	fbne	%f0, %fzero, fbeq_else.25694
	add	%a0, %zero, %k1
	j	fbeq_cont.25695
fbeq_else.25694:
	add	%a0, %zero, %zero
fbeq_cont.25695:
	beqi	%a0, 0, bnei_else.25696
	j	bnei_cont.25697
bnei_else.25696:
	fdiv	%f0, %f30, %f0
	fsw	%f0, 4(%v0)
bnei_cont.25697:
	add	%ra, %zero, %a2
	jr	%ra
iter_setup_dirvec_constants.2889:
	add	%s0, %zero, %v0
	add	%s1, %zero, %v1
	add	%s2, %zero, %ra
	blti	%s1, 0, bgti_else.25750
	lw	%a0, 12(%s1)
	lw	%s3, 1(%s0)
	lw	%a1, 0(%s0)
	lw	%a2, 1(%a0)
	beqi	%a2, 1, bnei_else.25751
	beqi	%a2, 2, bnei_else.25753
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_second_table.2886
	add	%at, %s3, %s1
	sw	%v0, 0(%at)
	j	bnei_cont.25752
bnei_else.25753:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f0, 0(%a1)
	lw	%a2, 4(%a0)
	flw	%f18, 0(%a2)
	fmul	%f1, %f0, %f18
	flw	%f0, 1(%a1)
	lw	%a2, 4(%a0)
	flw	%f17, 1(%a2)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a1)
	lw	%a0, 4(%a0)
	flw	%f16, 2(%a0)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	fblt	%fzero, %f1, fbgt_else.25755
	add	%a0, %zero, %zero
	j	fbgt_cont.25756
fbgt_else.25755:
	add	%a0, %zero, %k1
fbgt_cont.25756:
	beqi	%a0, 0, bnei_else.25757
	flw	%f0, 458(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	fdiv	%f0, %f18, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	fdiv	%f0, %f17, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	fdiv	%f0, %f16, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.25758
bnei_else.25757:
	fsw	%fzero, 0(%v0)
bnei_cont.25758:
	add	%at, %s3, %s1
	sw	%v0, 0(%at)
bnei_cont.25754:
	j	bnei_cont.25752
bnei_else.25751:
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_rect_table.2880
	add	%at, %s3, %s1
	sw	%v0, 0(%at)
bnei_cont.25752:
	addi	%s1, %s1, -1
	blti	%s1, 0, bgti_else.25759
	lw	%a0, 12(%s1)
	lw	%s3, 1(%s0)
	lw	%a1, 0(%s0)
	lw	%a2, 1(%a0)
	beqi	%a2, 1, bnei_else.25760
	beqi	%a2, 2, bnei_else.25762
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_second_table.2886
	add	%at, %s3, %s1
	sw	%v0, 0(%at)
	j	bnei_cont.25761
bnei_else.25762:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%a1)
	lw	%a2, 4(%a0)
	flw	%f0, 0(%a2)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a1)
	lw	%a2, 4(%a0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a1)
	lw	%a1, 4(%a0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.25764
	add	%a1, %zero, %zero
	j	fbgt_cont.25765
fbgt_else.25764:
	add	%a1, %zero, %k1
fbgt_cont.25765:
	beqi	%a1, 0, bnei_else.25766
	flw	%f0, 458(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 0(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 1(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a0)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.25767
bnei_else.25766:
	fsw	%fzero, 0(%v0)
bnei_cont.25767:
	add	%at, %s3, %s1
	sw	%v0, 0(%at)
bnei_cont.25763:
	j	bnei_cont.25761
bnei_else.25760:
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_rect_table.2880
	add	%at, %s3, %s1
	sw	%v0, 0(%at)
bnei_cont.25761:
	addi	%v1, %s1, -1
	add	%ra, %zero, %s2
	addi	%v0, %s0, 0
	j	iter_setup_dirvec_constants.2889
bgti_else.25759:
	add	%ra, %zero, %s2
	jr	%ra
bgti_else.25750:
	add	%ra, %zero, %s2
	jr	%ra
setup_dirvec_constants.2892:
	add	%s0, %zero, %v0
	add	%s1, %zero, %ra
	lw	%a0, 0(%zero)
	addi	%s2, %a0, -1
	blti	%s2, 0, bgti_else.25806
	lw	%a0, 12(%s2)
	lw	%s3, 1(%s0)
	lw	%a1, 0(%s0)
	lw	%a2, 1(%a0)
	beqi	%a2, 1, bnei_else.25807
	beqi	%a2, 2, bnei_else.25809
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_second_table.2886
	add	%at, %s3, %s2
	sw	%v0, 0(%at)
	j	bnei_cont.25808
bnei_else.25809:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%a1)
	lw	%a2, 4(%a0)
	flw	%f0, 0(%a2)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a1)
	lw	%a2, 4(%a0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a1)
	lw	%a1, 4(%a0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.25811
	add	%a1, %zero, %zero
	j	fbgt_cont.25812
fbgt_else.25811:
	add	%a1, %zero, %k1
fbgt_cont.25812:
	beqi	%a1, 0, bnei_else.25813
	flw	%f0, 458(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 0(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 1(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a0)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.25814
bnei_else.25813:
	fsw	%fzero, 0(%v0)
bnei_cont.25814:
	add	%at, %s3, %s2
	sw	%v0, 0(%at)
bnei_cont.25810:
	j	bnei_cont.25808
bnei_else.25807:
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_rect_table.2880
	add	%at, %s3, %s2
	sw	%v0, 0(%at)
bnei_cont.25808:
	addi	%v1, %s2, -1
	add	%ra, %zero, %s1
	addi	%v0, %s0, 0
	j	iter_setup_dirvec_constants.2889
bgti_else.25806:
	add	%ra, %zero, %s1
	jr	%ra
setup_startp_constants.2894:
	blti	%v1, 0, bgti_else.25852
	lw	%a2, 12(%v1)
	lw	%a3, 10(%a2)
	lw	%a1, 1(%a2)
	flw	%f1, 0(%v0)
	lw	%a0, 5(%a2)
	flw	%f0, 0(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 0(%a3)
	flw	%f1, 1(%v0)
	lw	%a0, 5(%a2)
	flw	%f0, 1(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 1(%a3)
	flw	%f1, 2(%v0)
	lw	%a0, 5(%a2)
	flw	%f0, 2(%a0)
	fsub	%f0, %f1, %f0
	fsw	%f0, 2(%a3)
	beqi	%a1, 2, bnei_else.25853
	addi	%at, %zero, 2
	blt	%at, %a1, bgt_else.25855
	j	bnei_cont.25854
bgt_else.25855:
	flw	%f17, 0(%a3)
	flw	%f18, 1(%a3)
	flw	%f19, 2(%a3)
	fmul	%f1, %f17, %f17
	lw	%a0, 4(%a2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f18, %f18
	lw	%a0, 4(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f19, %f19
	lw	%a0, 4(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.25857
	fmul	%f16, %f18, %f19
	lw	%a0, 9(%a2)
	flw	%f1, 0(%a0)
	fmul	%f1, %f16, %f1
	fadd	%f16, %f0, %f1
	fmul	%f1, %f19, %f17
	lw	%a0, 9(%a2)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	fmul	%f1, %f17, %f18
	lw	%a0, 9(%a2)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	j	bnei_cont.25858
bnei_else.25857:
bnei_cont.25858:
	beqi	%a1, 3, bnei_else.25859
	j	bnei_cont.25860
bnei_else.25859:
	fsub	%f0, %f0, %f30
bnei_cont.25860:
	fsw	%f0, 3(%a3)
bgt_cont.25856:
	j	bnei_cont.25854
bnei_else.25853:
	lw	%a0, 4(%a2)
	flw	%f1, 0(%a3)
	flw	%f17, 1(%a3)
	flw	%f16, 2(%a3)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f1
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
	fsw	%f0, 3(%a3)
bnei_cont.25854:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2894
bgti_else.25852:
	jr	%ra
check_all_inside.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26008
	lw	%a1, 12(%a0)
	lw	%a0, 5(%a1)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.26009
	beqi	%a0, 2, bnei_else.26011
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.26013
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.26014
bnei_else.26013:
bnei_cont.26014:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.26015
	j	bnei_cont.26016
bnei_else.26015:
	fsub	%f16, %f16, %f30
bnei_cont.26016:
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.26017
	add	%a0, %zero, %zero
	j	fbgt_cont.26018
fbgt_else.26017:
	add	%a0, %zero, %k1
fbgt_cont.26018:
	beqi	%a1, 0, bnei_else.26019
	beqi	%a0, 0, bnei_else.26021
	add	%a0, %zero, %zero
	j	bnei_cont.26020
bnei_else.26021:
	add	%a0, %zero, %k1
bnei_cont.26022:
	j	bnei_cont.26020
bnei_else.26019:
bnei_cont.26020:
	beqi	%a0, 0, bnei_else.26023
	add	%a0, %zero, %zero
	j	bnei_cont.26010
bnei_else.26023:
	add	%a0, %zero, %k1
bnei_cont.26024:
	j	bnei_cont.26010
bnei_else.26011:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.26025
	add	%a0, %zero, %zero
	j	fbgt_cont.26026
fbgt_else.26025:
	add	%a0, %zero, %k1
fbgt_cont.26026:
	beqi	%a1, 0, bnei_else.26027
	beqi	%a0, 0, bnei_else.26029
	add	%a0, %zero, %zero
	j	bnei_cont.26028
bnei_else.26029:
	add	%a0, %zero, %k1
bnei_cont.26030:
	j	bnei_cont.26028
bnei_else.26027:
bnei_cont.26028:
	beqi	%a0, 0, bnei_else.26031
	add	%a0, %zero, %zero
	j	bnei_cont.26010
bnei_else.26031:
	add	%a0, %zero, %k1
bnei_cont.26032:
bnei_cont.26012:
	j	bnei_cont.26010
bnei_else.26009:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.26033
	add	%a0, %zero, %zero
	j	fbgt_cont.26034
fbgt_else.26033:
	add	%a0, %zero, %k1
fbgt_cont.26034:
	beqi	%a0, 0, bnei_else.26035
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.26037
	add	%a0, %zero, %zero
	j	fbgt_cont.26038
fbgt_else.26037:
	add	%a0, %zero, %k1
fbgt_cont.26038:
	beqi	%a0, 0, bnei_else.26039
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.26041
	add	%a0, %zero, %zero
	j	bnei_cont.26036
fbgt_else.26041:
	add	%a0, %zero, %k1
fbgt_cont.26042:
	j	bnei_cont.26036
bnei_else.26039:
	add	%a0, %zero, %zero
bnei_cont.26040:
	j	bnei_cont.26036
bnei_else.26035:
	add	%a0, %zero, %zero
bnei_cont.26036:
	beqi	%a0, 0, bnei_else.26043
	lw	%a0, 6(%a1)
	j	bnei_cont.26044
bnei_else.26043:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.26045
	add	%a0, %zero, %zero
	j	bnei_cont.26046
bnei_else.26045:
	add	%a0, %zero, %k1
bnei_cont.26046:
bnei_cont.26044:
bnei_cont.26010:
	beqi	%a0, 0, bnei_else.26047
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.26047:
	addi	%a1, %v0, 1
	add	%at, %v1, %a1
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26048
	lw	%a2, 12(%a0)
	lw	%a0, 5(%a2)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a2)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a2)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.26049
	beqi	%a0, 2, bnei_else.26051
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a2)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a2)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a2)
	beqi	%a0, 0, bnei_else.26053
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a2)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a2)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a2)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.26054
bnei_else.26053:
bnei_cont.26054:
	lw	%a0, 1(%a2)
	beqi	%a0, 3, bnei_else.26055
	j	bnei_cont.26056
bnei_else.26055:
	fsub	%f16, %f16, %f30
bnei_cont.26056:
	lw	%a2, 6(%a2)
	fblt	%f16, %fzero, fbgt_else.26057
	add	%a0, %zero, %zero
	j	fbgt_cont.26058
fbgt_else.26057:
	add	%a0, %zero, %k1
fbgt_cont.26058:
	beqi	%a2, 0, bnei_else.26059
	beqi	%a0, 0, bnei_else.26061
	add	%a0, %zero, %zero
	j	bnei_cont.26060
bnei_else.26061:
	add	%a0, %zero, %k1
bnei_cont.26062:
	j	bnei_cont.26060
bnei_else.26059:
bnei_cont.26060:
	beqi	%a0, 0, bnei_else.26063
	add	%a0, %zero, %zero
	j	bnei_cont.26050
bnei_else.26063:
	add	%a0, %zero, %k1
bnei_cont.26064:
	j	bnei_cont.26050
bnei_else.26051:
	lw	%a0, 4(%a2)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a2, 6(%a2)
	fblt	%f16, %fzero, fbgt_else.26065
	add	%a0, %zero, %zero
	j	fbgt_cont.26066
fbgt_else.26065:
	add	%a0, %zero, %k1
fbgt_cont.26066:
	beqi	%a2, 0, bnei_else.26067
	beqi	%a0, 0, bnei_else.26069
	add	%a0, %zero, %zero
	j	bnei_cont.26068
bnei_else.26069:
	add	%a0, %zero, %k1
bnei_cont.26070:
	j	bnei_cont.26068
bnei_else.26067:
bnei_cont.26068:
	beqi	%a0, 0, bnei_else.26071
	add	%a0, %zero, %zero
	j	bnei_cont.26050
bnei_else.26071:
	add	%a0, %zero, %k1
bnei_cont.26072:
bnei_cont.26052:
	j	bnei_cont.26050
bnei_else.26049:
	fabs	%f17, %f19
	lw	%a0, 4(%a2)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.26073
	add	%a0, %zero, %zero
	j	fbgt_cont.26074
fbgt_else.26073:
	add	%a0, %zero, %k1
fbgt_cont.26074:
	beqi	%a0, 0, bnei_else.26075
	fabs	%f17, %f20
	lw	%a0, 4(%a2)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.26077
	add	%a0, %zero, %zero
	j	fbgt_cont.26078
fbgt_else.26077:
	add	%a0, %zero, %k1
fbgt_cont.26078:
	beqi	%a0, 0, bnei_else.26079
	fabs	%f17, %f21
	lw	%a0, 4(%a2)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.26081
	add	%a0, %zero, %zero
	j	bnei_cont.26076
fbgt_else.26081:
	add	%a0, %zero, %k1
fbgt_cont.26082:
	j	bnei_cont.26076
bnei_else.26079:
	add	%a0, %zero, %zero
bnei_cont.26080:
	j	bnei_cont.26076
bnei_else.26075:
	add	%a0, %zero, %zero
bnei_cont.26076:
	beqi	%a0, 0, bnei_else.26083
	lw	%a0, 6(%a2)
	j	bnei_cont.26084
bnei_else.26083:
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.26085
	add	%a0, %zero, %zero
	j	bnei_cont.26086
bnei_else.26085:
	add	%a0, %zero, %k1
bnei_cont.26086:
bnei_cont.26084:
bnei_cont.26050:
	beqi	%a0, 0, bnei_else.26087
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.26087:
	addi	%a0, %a1, 1
	addi	%v0, %a0, 0
	j	check_all_inside.2919
bnei_else.26048:
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.26008:
	add	%v0, %zero, %k1
	jr	%ra
shadow_check_and_group.2925:
	add	%a3, %zero, %v0
	add	%k0, %zero, %v1
	add	%s0, %zero, %ra
	add	%at, %k0, %a3
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.26201
	lw	%a2, 12(%a1)
	flw	%f24, 138(%zero)
	lw	%a0, 5(%a2)
	flw	%f0, 0(%a0)
	fsub	%f0, %f24, %f0
	flw	%f23, 139(%zero)
	lw	%a0, 5(%a2)
	flw	%f1, 1(%a0)
	fsub	%f1, %f23, %f1
	flw	%f22, 140(%zero)
	lw	%a0, 5(%a2)
	flw	%f16, 2(%a0)
	fsub	%f2, %f22, %f16
	lw	%v1, 187(%a1)
	lw	%a0, 1(%a2)
	beqi	%a0, 1, bnei_else.26202
	beqi	%a0, 2, bnei_else.26204
	addi	%v0, %a2, 0
	jal	solver_second_fast.2853
	j	bnei_cont.26203
bnei_else.26204:
	flw	%f16, 0(%v1)
	fblt	%f16, %fzero, fbgt_else.26206
	add	%a0, %zero, %zero
	j	fbgt_cont.26207
fbgt_else.26206:
	add	%a0, %zero, %k1
fbgt_cont.26207:
	beqi	%a0, 0, bnei_else.26208
	flw	%f16, 1(%v1)
	fmul	%f16, %f16, %f0
	flw	%f0, 2(%v1)
	fmul	%f0, %f0, %f1
	fadd	%f1, %f16, %f0
	flw	%f0, 3(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	j	bnei_cont.26203
bnei_else.26208:
	add	%v0, %zero, %zero
bnei_cont.26209:
bnei_cont.26205:
	j	bnei_cont.26203
bnei_else.26202:
	addi	%a1, %zero, 184
	addi	%a0, %v1, 0
	addi	%v0, %a2, 0
	addi	%v1, %a1, 0
	jal	solver_rect_fast.2840
bnei_cont.26203:
	flw	%f1, 135(%zero)
	beqi	%v0, 0, bnei_else.26210
	flw	%f0, 457(%zero)
	fblt	%f1, %f0, fbgt_else.26212
	add	%a0, %zero, %zero
	j	bnei_cont.26211
fbgt_else.26212:
	add	%a0, %zero, %k1
fbgt_cont.26213:
	j	bnei_cont.26211
bnei_else.26210:
	add	%a0, %zero, %zero
bnei_cont.26211:
	beqi	%a0, 0, bnei_else.26214
	flw	%f0, 456(%zero)
	fadd	%f17, %f1, %f0
	flw	%f0, 78(%zero)
	fmul	%f0, %f0, %f17
	fadd	%f0, %f0, %f24
	flw	%f1, 79(%zero)
	fmul	%f1, %f1, %f17
	fadd	%f1, %f1, %f23
	flw	%f16, 80(%zero)
	fmul	%f16, %f16, %f17
	fadd	%f2, %f16, %f22
	lw	%a0, 0(%k0)
	beqi	%a0, -1, bnei_else.26215
	lw	%a1, 12(%a0)
	lw	%a0, 5(%a1)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.26217
	beqi	%a0, 2, bnei_else.26219
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.26221
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.26222
bnei_else.26221:
bnei_cont.26222:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.26223
	j	bnei_cont.26224
bnei_else.26223:
	fsub	%f16, %f16, %f30
bnei_cont.26224:
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.26225
	add	%a0, %zero, %zero
	j	fbgt_cont.26226
fbgt_else.26225:
	add	%a0, %zero, %k1
fbgt_cont.26226:
	beqi	%a1, 0, bnei_else.26227
	beqi	%a0, 0, bnei_else.26229
	add	%a0, %zero, %zero
	j	bnei_cont.26228
bnei_else.26229:
	add	%a0, %zero, %k1
bnei_cont.26230:
	j	bnei_cont.26228
bnei_else.26227:
bnei_cont.26228:
	beqi	%a0, 0, bnei_else.26231
	add	%a0, %zero, %zero
	j	bnei_cont.26218
bnei_else.26231:
	add	%a0, %zero, %k1
bnei_cont.26232:
	j	bnei_cont.26218
bnei_else.26219:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.26233
	add	%a0, %zero, %zero
	j	fbgt_cont.26234
fbgt_else.26233:
	add	%a0, %zero, %k1
fbgt_cont.26234:
	beqi	%a1, 0, bnei_else.26235
	beqi	%a0, 0, bnei_else.26237
	add	%a0, %zero, %zero
	j	bnei_cont.26236
bnei_else.26237:
	add	%a0, %zero, %k1
bnei_cont.26238:
	j	bnei_cont.26236
bnei_else.26235:
bnei_cont.26236:
	beqi	%a0, 0, bnei_else.26239
	add	%a0, %zero, %zero
	j	bnei_cont.26218
bnei_else.26239:
	add	%a0, %zero, %k1
bnei_cont.26240:
bnei_cont.26220:
	j	bnei_cont.26218
bnei_else.26217:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.26241
	add	%a0, %zero, %zero
	j	fbgt_cont.26242
fbgt_else.26241:
	add	%a0, %zero, %k1
fbgt_cont.26242:
	beqi	%a0, 0, bnei_else.26243
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.26245
	add	%a0, %zero, %zero
	j	fbgt_cont.26246
fbgt_else.26245:
	add	%a0, %zero, %k1
fbgt_cont.26246:
	beqi	%a0, 0, bnei_else.26247
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.26249
	add	%a0, %zero, %zero
	j	bnei_cont.26244
fbgt_else.26249:
	add	%a0, %zero, %k1
fbgt_cont.26250:
	j	bnei_cont.26244
bnei_else.26247:
	add	%a0, %zero, %zero
bnei_cont.26248:
	j	bnei_cont.26244
bnei_else.26243:
	add	%a0, %zero, %zero
bnei_cont.26244:
	beqi	%a0, 0, bnei_else.26251
	lw	%a0, 6(%a1)
	j	bnei_cont.26252
bnei_else.26251:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.26253
	add	%a0, %zero, %zero
	j	bnei_cont.26254
bnei_else.26253:
	add	%a0, %zero, %k1
bnei_cont.26254:
bnei_cont.26252:
bnei_cont.26218:
	beqi	%a0, 0, bnei_else.26255
	add	%v0, %zero, %zero
	j	bnei_cont.26216
bnei_else.26255:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	check_all_inside.2919
bnei_cont.26256:
	j	bnei_cont.26216
bnei_else.26215:
	add	%v0, %zero, %k1
bnei_cont.26216:
	beqi	%v0, 0, bnei_else.26257
	add	%ra, %zero, %s0
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.26257:
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0
	addi	%v1, %k0, 0
	j	shadow_check_and_group.2925
bnei_else.26214:
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.26258
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0
	addi	%v1, %k0, 0
	j	shadow_check_and_group.2925
bnei_else.26258:
	add	%ra, %zero, %s0
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.26201:
	add	%ra, %zero, %s0
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_group.2928:
	add	%s1, %zero, %v0
	add	%s2, %zero, %v1
	add	%s3, %zero, %ra
	add	%at, %s2, %s1
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26303
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26304
	add	%ra, %zero, %s3
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.26304:
	addi	%s1, %s1, 1
	add	%at, %s2, %s1
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26305
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26306
	add	%ra, %zero, %s3
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.26306:
	addi	%s1, %s1, 1
	add	%at, %s2, %s1
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26307
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26308
	add	%ra, %zero, %s3
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.26308:
	addi	%s1, %s1, 1
	add	%at, %s2, %s1
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26309
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26310
	add	%ra, %zero, %s3
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.26310:
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3
	addi	%v1, %s2, 0
	j	shadow_check_one_or_group.2928
bnei_else.26309:
	add	%ra, %zero, %s3
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.26307:
	add	%ra, %zero, %s3
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.26305:
	add	%ra, %zero, %s3
	add	%v0, %zero, %zero
	jr	%ra
bnei_else.26303:
	add	%ra, %zero, %s3
	add	%v0, %zero, %zero
	jr	%ra
shadow_check_one_or_matrix.2931:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %ra
	add	%at, %s5, %s4
	lw	%s7, 0(%at)
	lw	%a1, 0(%s7)
	beqi	%a1, -1, bnei_else.26403
	beqi	%a1, 99, bnei_else.26404
	lw	%v0, 12(%a1)
	flw	%f1, 138(%zero)
	lw	%a0, 5(%v0)
	flw	%f0, 0(%a0)
	fsub	%f0, %f1, %f0
	flw	%f16, 139(%zero)
	lw	%a0, 5(%v0)
	flw	%f1, 1(%a0)
	fsub	%f1, %f16, %f1
	flw	%f17, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f16, 2(%a0)
	fsub	%f2, %f17, %f16
	lw	%v1, 187(%a1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.26406
	beqi	%a0, 2, bnei_else.26408
	jal	solver_second_fast.2853
	j	bnei_cont.26407
bnei_else.26408:
	flw	%f16, 0(%v1)
	fblt	%f16, %fzero, fbgt_else.26410
	add	%a0, %zero, %zero
	j	fbgt_cont.26411
fbgt_else.26410:
	add	%a0, %zero, %k1
fbgt_cont.26411:
	beqi	%a0, 0, bnei_else.26412
	flw	%f16, 1(%v1)
	fmul	%f16, %f16, %f0
	flw	%f0, 2(%v1)
	fmul	%f0, %f0, %f1
	fadd	%f1, %f16, %f0
	flw	%f0, 3(%v1)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	j	bnei_cont.26407
bnei_else.26412:
	add	%v0, %zero, %zero
bnei_cont.26413:
bnei_cont.26409:
	j	bnei_cont.26407
bnei_else.26406:
	addi	%a1, %zero, 184
	addi	%a0, %v1, 0
	addi	%v1, %a1, 0
	jal	solver_rect_fast.2840
bnei_cont.26407:
	beqi	%v0, 0, bnei_else.26414
	flw	%f1, 135(%zero)
	flw	%f0, 455(%zero)
	fblt	%f1, %f0, fbgt_else.26416
	add	%a0, %zero, %zero
	j	fbgt_cont.26417
fbgt_else.26416:
	add	%a0, %zero, %k1
fbgt_cont.26417:
	beqi	%a0, 0, bnei_else.26418
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_else.26420
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26422
	add	%v0, %zero, %k1
	j	bnei_cont.26421
bnei_else.26422:
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_else.26424
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26426
	add	%v0, %zero, %k1
	j	bnei_cont.26421
bnei_else.26426:
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_else.26428
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26430
	add	%v0, %zero, %k1
	j	bnei_cont.26421
bnei_else.26430:
	addi	%v0, %zero, 4
	addi	%v1, %s7, 0
	jal	shadow_check_one_or_group.2928
bnei_cont.26431:
	j	bnei_cont.26421
bnei_else.26428:
	add	%v0, %zero, %zero
bnei_cont.26429:
bnei_cont.26427:
	j	bnei_cont.26421
bnei_else.26424:
	add	%v0, %zero, %zero
bnei_cont.26425:
bnei_cont.26423:
	j	bnei_cont.26421
bnei_else.26420:
	add	%v0, %zero, %zero
bnei_cont.26421:
	beqi	%v0, 0, bnei_else.26432
	add	%a0, %zero, %k1
	j	bnei_cont.26405
bnei_else.26432:
	add	%a0, %zero, %zero
bnei_cont.26433:
	j	bnei_cont.26405
bnei_else.26418:
	add	%a0, %zero, %zero
bnei_cont.26419:
	j	bnei_cont.26405
bnei_else.26414:
	add	%a0, %zero, %zero
bnei_cont.26415:
	j	bnei_cont.26405
bnei_else.26404:
	add	%a0, %zero, %k1
bnei_cont.26405:
	beqi	%a0, 0, bnei_else.26434
	lw	%a0, 1(%s7)
	beqi	%a0, -1, bnei_else.26435
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26437
	add	%v0, %zero, %k1
	j	bnei_cont.26436
bnei_else.26437:
	lw	%a0, 2(%s7)
	beqi	%a0, -1, bnei_else.26439
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26441
	add	%v0, %zero, %k1
	j	bnei_cont.26436
bnei_else.26441:
	lw	%a0, 3(%s7)
	beqi	%a0, -1, bnei_else.26443
	lw	%v1, 83(%a0)
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925
	beqi	%v0, 0, bnei_else.26445
	add	%v0, %zero, %k1
	j	bnei_cont.26436
bnei_else.26445:
	addi	%v0, %zero, 4
	addi	%v1, %s7, 0
	jal	shadow_check_one_or_group.2928
bnei_cont.26446:
	j	bnei_cont.26436
bnei_else.26443:
	add	%v0, %zero, %zero
bnei_cont.26444:
bnei_cont.26442:
	j	bnei_cont.26436
bnei_else.26439:
	add	%v0, %zero, %zero
bnei_cont.26440:
bnei_cont.26438:
	j	bnei_cont.26436
bnei_else.26435:
	add	%v0, %zero, %zero
bnei_cont.26436:
	beqi	%v0, 0, bnei_else.26447
	add	%ra, %zero, %s6
	add	%v0, %zero, %k1
	jr	%ra
bnei_else.26447:
	addi	%v0, %s4, 1
	add	%ra, %zero, %s6
	addi	%v1, %s5, 0
	j	shadow_check_one_or_matrix.2931
bnei_else.26434:
	addi	%v0, %s4, 1
	add	%ra, %zero, %s6
	addi	%v1, %s5, 0
	j	shadow_check_one_or_matrix.2931
bnei_else.26403:
	add	%ra, %zero, %s6
	add	%v0, %zero, %zero
	jr	%ra
solve_each_element.2934:
	add	%a3, %zero, %v0
	add	%k0, %zero, %v1
	add	%s0, %zero, %a0
	add	%s1, %zero, %ra
	add	%at, %k0, %a3
	lw	%s4, 0(%at)
	beqi	%s4, -1, bnei_else.26569
	lw	%s2, 12(%s4)
	flw	%f26, 159(%zero)
	lw	%a0, 5(%s2)
	flw	%f0, 0(%a0)
	fsub	%f0, %f26, %f0
	flw	%f25, 160(%zero)
	lw	%a0, 5(%s2)
	flw	%f1, 1(%a0)
	fsub	%f1, %f25, %f1
	flw	%f24, 161(%zero)
	lw	%a0, 5(%s2)
	flw	%f16, 2(%a0)
	fsub	%f2, %f24, %f16
	lw	%a0, 1(%s2)
	beqi	%a0, 1, bnei_else.26570
	beqi	%a0, 2, bnei_else.26572
	addi	%v1, %s0, 0
	addi	%v0, %s2, 0
	jal	solver_second.2830
	addi	%s3, %v0, 0
	j	bnei_cont.26571
bnei_else.26572:
	lw	%a0, 4(%s2)
	flw	%f16, 0(%s0)
	flw	%f20, 0(%a0)
	fmul	%f17, %f16, %f20
	flw	%f16, 1(%s0)
	flw	%f19, 1(%a0)
	fmul	%f16, %f16, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%s0)
	flw	%f18, 2(%a0)
	fmul	%f16, %f16, %f18
	fadd	%f17, %f17, %f16
	fblt	%fzero, %f17, fbgt_else.26574
	add	%a0, %zero, %zero
	j	fbgt_cont.26575
fbgt_else.26574:
	add	%a0, %zero, %k1
fbgt_cont.26575:
	beqi	%a0, 0, bnei_else.26576
	fmul	%f16, %f20, %f0
	fmul	%f0, %f19, %f1
	fadd	%f1, %f16, %f0
	fmul	%f0, %f18, %f2
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f17
	fsw	%f0, 135(%zero)
	add	%s3, %zero, %k1
	j	bnei_cont.26571
bnei_else.26576:
	add	%s3, %zero, %zero
bnei_cont.26577:
bnei_cont.26573:
	j	bnei_cont.26571
bnei_else.26570:
	addi	%v1, %s0, 0
	addi	%v0, %s2, 0
	jal	solver_rect.2805
	addi	%s3, %v0, 0
bnei_cont.26571:
	beqi	%s3, 0, bnei_else.26578
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.26579
	add	%a0, %zero, %zero
	j	fbgt_cont.26580
fbgt_else.26579:
	add	%a0, %zero, %k1
fbgt_cont.26580:
	beqi	%a0, 0, bnei_else.26581
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.26583
	add	%a0, %zero, %zero
	j	fbgt_cont.26584
fbgt_else.26583:
	add	%a0, %zero, %k1
fbgt_cont.26584:
	beqi	%a0, 0, bnei_cont.26582
	flw	%f0, 456(%zero)
	fadd	%f22, %f1, %f0
	flw	%f0, 0(%s0)
	fmul	%f0, %f0, %f22
	fadd	%f0, %f0, %f26
	flw	%f1, 1(%s0)
	fmul	%f1, %f1, %f22
	fadd	%f1, %f1, %f25
	flw	%f16, 2(%s0)
	fmul	%f16, %f16, %f22
	fadd	%f2, %f16, %f24
	lw	%a0, 0(%k0)
	beqi	%a0, -1, bnei_else.26587
	lw	%a1, 12(%a0)
	lw	%a0, 5(%a1)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.26589
	beqi	%a0, 2, bnei_else.26591
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.26593
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.26594
bnei_else.26593:
bnei_cont.26594:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.26595
	j	bnei_cont.26596
bnei_else.26595:
	fsub	%f16, %f16, %f30
bnei_cont.26596:
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.26597
	add	%a0, %zero, %zero
	j	fbgt_cont.26598
fbgt_else.26597:
	add	%a0, %zero, %k1
fbgt_cont.26598:
	beqi	%a1, 0, bnei_else.26599
	beqi	%a0, 0, bnei_else.26601
	add	%a0, %zero, %zero
	j	bnei_cont.26600
bnei_else.26601:
	add	%a0, %zero, %k1
bnei_cont.26602:
	j	bnei_cont.26600
bnei_else.26599:
bnei_cont.26600:
	beqi	%a0, 0, bnei_else.26603
	add	%a0, %zero, %zero
	j	bnei_cont.26590
bnei_else.26603:
	add	%a0, %zero, %k1
bnei_cont.26604:
	j	bnei_cont.26590
bnei_else.26591:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.26605
	add	%a0, %zero, %zero
	j	fbgt_cont.26606
fbgt_else.26605:
	add	%a0, %zero, %k1
fbgt_cont.26606:
	beqi	%a1, 0, bnei_else.26607
	beqi	%a0, 0, bnei_else.26609
	add	%a0, %zero, %zero
	j	bnei_cont.26608
bnei_else.26609:
	add	%a0, %zero, %k1
bnei_cont.26610:
	j	bnei_cont.26608
bnei_else.26607:
bnei_cont.26608:
	beqi	%a0, 0, bnei_else.26611
	add	%a0, %zero, %zero
	j	bnei_cont.26590
bnei_else.26611:
	add	%a0, %zero, %k1
bnei_cont.26612:
bnei_cont.26592:
	j	bnei_cont.26590
bnei_else.26589:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.26613
	add	%a0, %zero, %zero
	j	fbgt_cont.26614
fbgt_else.26613:
	add	%a0, %zero, %k1
fbgt_cont.26614:
	beqi	%a0, 0, bnei_else.26615
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.26617
	add	%a0, %zero, %zero
	j	fbgt_cont.26618
fbgt_else.26617:
	add	%a0, %zero, %k1
fbgt_cont.26618:
	beqi	%a0, 0, bnei_else.26619
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.26621
	add	%a0, %zero, %zero
	j	bnei_cont.26616
fbgt_else.26621:
	add	%a0, %zero, %k1
fbgt_cont.26622:
	j	bnei_cont.26616
bnei_else.26619:
	add	%a0, %zero, %zero
bnei_cont.26620:
	j	bnei_cont.26616
bnei_else.26615:
	add	%a0, %zero, %zero
bnei_cont.26616:
	beqi	%a0, 0, bnei_else.26623
	lw	%a0, 6(%a1)
	j	bnei_cont.26624
bnei_else.26623:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.26625
	add	%a0, %zero, %zero
	j	bnei_cont.26626
bnei_else.26625:
	add	%a0, %zero, %k1
bnei_cont.26626:
bnei_cont.26624:
bnei_cont.26590:
	beqi	%a0, 0, bnei_else.26627
	add	%v0, %zero, %zero
	j	bnei_cont.26588
bnei_else.26627:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	check_all_inside.2919
bnei_cont.26628:
	j	bnei_cont.26588
bnei_else.26587:
	add	%v0, %zero, %k1
bnei_cont.26588:
	beqi	%v0, 0, bnei_cont.26582
	fsw	%f22, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s4, 141(%zero)
	sw	%s3, 136(%zero)
	j	bnei_cont.26582
bnei_else.26629:
bnei_cont.26630:
	j	bnei_cont.26582
bnei_else.26585:
bnei_cont.26586:
	j	bnei_cont.26582
bnei_else.26581:
bnei_cont.26582:
	addi	%v0, %a3, 1
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0
	addi	%v1, %k0, 0
	j	solve_each_element.2934
bnei_else.26578:
	lw	%a0, 6(%s2)
	beqi	%a0, 0, bnei_else.26631
	addi	%v0, %a3, 1
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0
	addi	%v1, %k0, 0
	j	solve_each_element.2934
bnei_else.26631:
	add	%ra, %zero, %s1
	jr	%ra
bnei_else.26569:
	add	%ra, %zero, %s1
	jr	%ra
solve_one_or_network.2938:
	add	%s5, %zero, %v0
	add	%s6, %zero, %v1
	add	%s7, %zero, %a0
	add	%t7, %zero, %ra
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26686
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26687
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26688
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26689
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26690
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26691
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26692
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.26693
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element.2934
	addi	%v0, %s5, 1
	add	%ra, %zero, %t7
	addi	%a0, %s7, 0
	addi	%v1, %s6, 0
	j	solve_one_or_network.2938
bnei_else.26693:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.26692:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.26691:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.26690:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.26689:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.26688:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.26687:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.26686:
	add	%ra, %zero, %t7
	jr	%ra
trace_or_matrix.2942:
	sw	%v0, 0(%sp)
	add	%t9, %zero, %v1
	add	%t8, %zero, %a0
	sw	%ra, 1(%sp)
	add	%at, %t9, %v0
	lw	%s5, 0(%at)
	lw	%a0, 0(%s5)
	beqi	%a0, -1, bnei_else.26973
	beqi	%a0, 99, bnei_else.26974
	lw	%v0, 12(%a0)
	flw	%f1, 159(%zero)
	lw	%a0, 5(%v0)
	flw	%f0, 0(%a0)
	fsub	%f0, %f1, %f0
	flw	%f16, 160(%zero)
	lw	%a0, 5(%v0)
	flw	%f1, 1(%a0)
	fsub	%f1, %f16, %f1
	flw	%f17, 161(%zero)
	lw	%a0, 5(%v0)
	flw	%f16, 2(%a0)
	fsub	%f2, %f17, %f16
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.26976
	beqi	%a0, 2, bnei_else.26978
	addi	%v1, %t8, 0
	addi	%sp, %sp, 2
	jal	solver_second.2830
	addi	%sp, %sp, -2
	j	bnei_cont.26977
bnei_else.26978:
	lw	%a0, 4(%v0)
	flw	%f16, 0(%t8)
	flw	%f20, 0(%a0)
	fmul	%f17, %f16, %f20
	flw	%f16, 1(%t8)
	flw	%f19, 1(%a0)
	fmul	%f16, %f16, %f19
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%t8)
	flw	%f18, 2(%a0)
	fmul	%f16, %f16, %f18
	fadd	%f17, %f17, %f16
	fblt	%fzero, %f17, fbgt_else.26980
	add	%a0, %zero, %zero
	j	fbgt_cont.26981
fbgt_else.26980:
	add	%a0, %zero, %k1
fbgt_cont.26981:
	beqi	%a0, 0, bnei_else.26982
	fmul	%f16, %f20, %f0
	fmul	%f0, %f19, %f1
	fadd	%f1, %f16, %f0
	fmul	%f0, %f18, %f2
	fadd	%f0, %f1, %f0
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f17
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	j	bnei_cont.26977
bnei_else.26982:
	add	%v0, %zero, %zero
bnei_cont.26983:
bnei_cont.26979:
	j	bnei_cont.26977
bnei_else.26976:
	addi	%v1, %t8, 0
	addi	%sp, %sp, 2
	jal	solver_rect.2805
	addi	%sp, %sp, -2
bnei_cont.26977:
	beqi	%v0, 0, bnei_cont.26975
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.26986
	add	%a0, %zero, %zero
	j	fbgt_cont.26987
fbgt_else.26986:
	add	%a0, %zero, %k1
fbgt_cont.26987:
	beqi	%a0, 0, bnei_cont.26975
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_cont.26975
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.26975
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.26975
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.26975
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 5(%s5)
	beqi	%a0, -1, bnei_cont.26975
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 6(%s5)
	beqi	%a0, -1, bnei_cont.26975
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 7(%s5)
	beqi	%a0, -1, bnei_cont.26975
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 2
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -2
	j	bnei_cont.26975
bnei_else.27002:
bnei_cont.27003:
	j	bnei_cont.26975
bnei_else.27000:
bnei_cont.27001:
	j	bnei_cont.26975
bnei_else.26998:
bnei_cont.26999:
	j	bnei_cont.26975
bnei_else.26996:
bnei_cont.26997:
	j	bnei_cont.26975
bnei_else.26994:
bnei_cont.26995:
	j	bnei_cont.26975
bnei_else.26992:
bnei_cont.26993:
	j	bnei_cont.26975
bnei_else.26990:
bnei_cont.26991:
	j	bnei_cont.26975
bnei_else.26988:
bnei_cont.26989:
	j	bnei_cont.26975
bnei_else.26984:
bnei_cont.26985:
	j	bnei_cont.26975
bnei_else.26974:
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_else.27004
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.27005
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.27005
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.27005
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 5(%s5)
	beqi	%a0, -1, bnei_cont.27005
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 6(%s5)
	beqi	%a0, -1, bnei_cont.27005
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	lw	%a0, 7(%s5)
	beqi	%a0, -1, bnei_cont.27005
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element.2934
	addi	%sp, %sp, -2
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 2
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -2
	j	bnei_cont.27005
bnei_else.27016:
bnei_cont.27017:
	j	bnei_cont.27005
bnei_else.27014:
bnei_cont.27015:
	j	bnei_cont.27005
bnei_else.27012:
bnei_cont.27013:
	j	bnei_cont.27005
bnei_else.27010:
bnei_cont.27011:
	j	bnei_cont.27005
bnei_else.27008:
bnei_cont.27009:
	j	bnei_cont.27005
bnei_else.27006:
bnei_cont.27007:
	j	bnei_cont.27005
bnei_else.27004:
bnei_cont.27005:
bnei_cont.26975:
	lw	%a0, 0(%sp)
	addi	%a0, %a0, 1
	sw	%a0, 2(%sp)
	add	%at, %t9, %a0
	lw	%s5, 0(%at)
	lw	%v0, 0(%s5)
	beqi	%v0, -1, bnei_else.27018
	beqi	%v0, 99, bnei_else.27019
	addi	%a0, %zero, 159
	addi	%v1, %t8, 0
	addi	%sp, %sp, 3
	jal	solver.2836
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_cont.27020
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.27023
	add	%a0, %zero, %zero
	j	fbgt_cont.27024
fbgt_else.27023:
	add	%a0, %zero, %k1
fbgt_cont.27024:
	beqi	%a0, 0, bnei_cont.27020
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_cont.27020
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.27020
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.27020
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.27020
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 5(%s5)
	beqi	%a0, -1, bnei_cont.27020
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 6(%s5)
	beqi	%a0, -1, bnei_cont.27020
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 3
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -3
	j	bnei_cont.27020
bnei_else.27037:
bnei_cont.27038:
	j	bnei_cont.27020
bnei_else.27035:
bnei_cont.27036:
	j	bnei_cont.27020
bnei_else.27033:
bnei_cont.27034:
	j	bnei_cont.27020
bnei_else.27031:
bnei_cont.27032:
	j	bnei_cont.27020
bnei_else.27029:
bnei_cont.27030:
	j	bnei_cont.27020
bnei_else.27027:
bnei_cont.27028:
	j	bnei_cont.27020
bnei_else.27025:
bnei_cont.27026:
	j	bnei_cont.27020
bnei_else.27021:
bnei_cont.27022:
	j	bnei_cont.27020
bnei_else.27019:
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_else.27039
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.27040
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.27040
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.27040
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 5(%s5)
	beqi	%a0, -1, bnei_cont.27040
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	lw	%a0, 6(%s5)
	beqi	%a0, -1, bnei_cont.27040
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element.2934
	addi	%sp, %sp, -3
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 3
	jal	solve_one_or_network.2938
	addi	%sp, %sp, -3
	j	bnei_cont.27040
bnei_else.27049:
bnei_cont.27050:
	j	bnei_cont.27040
bnei_else.27047:
bnei_cont.27048:
	j	bnei_cont.27040
bnei_else.27045:
bnei_cont.27046:
	j	bnei_cont.27040
bnei_else.27043:
bnei_cont.27044:
	j	bnei_cont.27040
bnei_else.27041:
bnei_cont.27042:
	j	bnei_cont.27040
bnei_else.27039:
bnei_cont.27040:
bnei_cont.27020:
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	addi	%a0, %t8, 0
	addi	%v1, %t9, 0
	j	trace_or_matrix.2942
bnei_else.27018:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.26973:
	jr	%ra
solve_each_element_fast.2948:
	add	%a3, %zero, %v0
	add	%k0, %zero, %v1
	add	%s0, %zero, %a0
	add	%s1, %zero, %ra
	lw	%s4, 0(%s0)
	add	%at, %k0, %a3
	lw	%s3, 0(%at)
	beqi	%s3, -1, bnei_else.27189
	lw	%a2, 12(%s3)
	lw	%ra, 10(%a2)
	flw	%f0, 0(%ra)
	flw	%f1, 1(%ra)
	flw	%f2, 2(%ra)
	lw	%a0, 1(%s0)
	add	%at, %a0, %s3
	lw	%a0, 0(%at)
	lw	%a1, 1(%a2)
	beqi	%a1, 1, bnei_else.27190
	beqi	%a1, 2, bnei_else.27192
	flw	%f17, 0(%a0)
	fbne	%f17, %fzero, fbeq_else.27194
	add	%a1, %zero, %k1
	j	fbeq_cont.27195
fbeq_else.27194:
	add	%a1, %zero, %zero
fbeq_cont.27195:
	beqi	%a1, 0, bnei_else.27196
	add	%s2, %zero, %zero
	j	bnei_cont.27191
bnei_else.27196:
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f1
	fadd	%f1, %f16, %f0
	flw	%f0, 3(%a0)
	fmul	%f0, %f0, %f2
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%ra)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.27198
	add	%a1, %zero, %zero
	j	fbgt_cont.27199
fbgt_else.27198:
	add	%a1, %zero, %k1
fbgt_cont.27199:
	beqi	%a1, 0, bnei_else.27200
	lw	%a1, 6(%a2)
	beqi	%a1, 0, bnei_else.27202
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.27203
bnei_else.27202:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.27203:
	add	%s2, %zero, %k1
	j	bnei_cont.27191
bnei_else.27200:
	add	%s2, %zero, %zero
bnei_cont.27201:
bnei_cont.27197:
	j	bnei_cont.27191
bnei_else.27192:
	flw	%f1, 0(%a0)
	fblt	%f1, %fzero, fbgt_else.27204
	add	%a0, %zero, %zero
	j	fbgt_cont.27205
fbgt_else.27204:
	add	%a0, %zero, %k1
fbgt_cont.27205:
	beqi	%a0, 0, bnei_else.27206
	flw	%f0, 3(%ra)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%s2, %zero, %k1
	j	bnei_cont.27191
bnei_else.27206:
	add	%s2, %zero, %zero
bnei_cont.27207:
bnei_cont.27193:
	j	bnei_cont.27191
bnei_else.27190:
	lw	%v1, 0(%s0)
	addi	%v0, %a2, 0
	jal	solver_rect_fast.2840
	addi	%s2, %v0, 0
bnei_cont.27191:
	beqi	%s2, 0, bnei_else.27208
	flw	%f1, 135(%zero)
	fblt	%fzero, %f1, fbgt_else.27209
	add	%a0, %zero, %zero
	j	fbgt_cont.27210
fbgt_else.27209:
	add	%a0, %zero, %k1
fbgt_cont.27210:
	beqi	%a0, 0, bnei_else.27211
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.27213
	add	%a0, %zero, %zero
	j	fbgt_cont.27214
fbgt_else.27213:
	add	%a0, %zero, %k1
fbgt_cont.27214:
	beqi	%a0, 0, bnei_cont.27212
	flw	%f0, 456(%zero)
	fadd	%f22, %f1, %f0
	flw	%f0, 0(%s4)
	fmul	%f1, %f0, %f22
	flw	%f0, 162(%zero)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%s4)
	fmul	%f16, %f1, %f22
	flw	%f1, 163(%zero)
	fadd	%f1, %f16, %f1
	flw	%f16, 2(%s4)
	fmul	%f17, %f16, %f22
	flw	%f16, 164(%zero)
	fadd	%f2, %f17, %f16
	lw	%a0, 0(%k0)
	beqi	%a0, -1, bnei_else.27217
	lw	%a1, 12(%a0)
	lw	%a0, 5(%a1)
	flw	%f16, 0(%a0)
	fsub	%f19, %f0, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 1(%a0)
	fsub	%f20, %f1, %f16
	lw	%a0, 5(%a1)
	flw	%f16, 2(%a0)
	fsub	%f21, %f2, %f16
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.27219
	beqi	%a0, 2, bnei_else.27221
	fmul	%f17, %f19, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f21, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	lw	%a0, 3(%a1)
	beqi	%a0, 0, bnei_else.27223
	fmul	%f18, %f20, %f21
	lw	%a0, 9(%a1)
	flw	%f17, 0(%a0)
	fmul	%f17, %f18, %f17
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19
	lw	%a0, 9(%a1)
	flw	%f16, 1(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f18, %f18, %f16
	fmul	%f17, %f19, %f20
	lw	%a0, 9(%a1)
	flw	%f16, 2(%a0)
	fmul	%f16, %f17, %f16
	fadd	%f16, %f18, %f16
	j	bnei_cont.27224
bnei_else.27223:
bnei_cont.27224:
	lw	%a0, 1(%a1)
	beqi	%a0, 3, bnei_else.27225
	j	bnei_cont.27226
bnei_else.27225:
	fsub	%f16, %f16, %f30
bnei_cont.27226:
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.27227
	add	%a0, %zero, %zero
	j	fbgt_cont.27228
fbgt_else.27227:
	add	%a0, %zero, %k1
fbgt_cont.27228:
	beqi	%a1, 0, bnei_else.27229
	beqi	%a0, 0, bnei_else.27231
	add	%a0, %zero, %zero
	j	bnei_cont.27230
bnei_else.27231:
	add	%a0, %zero, %k1
bnei_cont.27232:
	j	bnei_cont.27230
bnei_else.27229:
bnei_cont.27230:
	beqi	%a0, 0, bnei_else.27233
	add	%a0, %zero, %zero
	j	bnei_cont.27220
bnei_else.27233:
	add	%a0, %zero, %k1
bnei_cont.27234:
	j	bnei_cont.27220
bnei_else.27221:
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fmul	%f17, %f16, %f19
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f20
	fadd	%f17, %f17, %f16
	flw	%f16, 2(%a0)
	fmul	%f16, %f16, %f21
	fadd	%f16, %f17, %f16
	lw	%a1, 6(%a1)
	fblt	%f16, %fzero, fbgt_else.27235
	add	%a0, %zero, %zero
	j	fbgt_cont.27236
fbgt_else.27235:
	add	%a0, %zero, %k1
fbgt_cont.27236:
	beqi	%a1, 0, bnei_else.27237
	beqi	%a0, 0, bnei_else.27239
	add	%a0, %zero, %zero
	j	bnei_cont.27238
bnei_else.27239:
	add	%a0, %zero, %k1
bnei_cont.27240:
	j	bnei_cont.27238
bnei_else.27237:
bnei_cont.27238:
	beqi	%a0, 0, bnei_else.27241
	add	%a0, %zero, %zero
	j	bnei_cont.27220
bnei_else.27241:
	add	%a0, %zero, %k1
bnei_cont.27242:
bnei_cont.27222:
	j	bnei_cont.27220
bnei_else.27219:
	fabs	%f17, %f19
	lw	%a0, 4(%a1)
	flw	%f16, 0(%a0)
	fblt	%f17, %f16, fbgt_else.27243
	add	%a0, %zero, %zero
	j	fbgt_cont.27244
fbgt_else.27243:
	add	%a0, %zero, %k1
fbgt_cont.27244:
	beqi	%a0, 0, bnei_else.27245
	fabs	%f17, %f20
	lw	%a0, 4(%a1)
	flw	%f16, 1(%a0)
	fblt	%f17, %f16, fbgt_else.27247
	add	%a0, %zero, %zero
	j	fbgt_cont.27248
fbgt_else.27247:
	add	%a0, %zero, %k1
fbgt_cont.27248:
	beqi	%a0, 0, bnei_else.27249
	fabs	%f17, %f21
	lw	%a0, 4(%a1)
	flw	%f16, 2(%a0)
	fblt	%f17, %f16, fbgt_else.27251
	add	%a0, %zero, %zero
	j	bnei_cont.27246
fbgt_else.27251:
	add	%a0, %zero, %k1
fbgt_cont.27252:
	j	bnei_cont.27246
bnei_else.27249:
	add	%a0, %zero, %zero
bnei_cont.27250:
	j	bnei_cont.27246
bnei_else.27245:
	add	%a0, %zero, %zero
bnei_cont.27246:
	beqi	%a0, 0, bnei_else.27253
	lw	%a0, 6(%a1)
	j	bnei_cont.27254
bnei_else.27253:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.27255
	add	%a0, %zero, %zero
	j	bnei_cont.27256
bnei_else.27255:
	add	%a0, %zero, %k1
bnei_cont.27256:
bnei_cont.27254:
bnei_cont.27220:
	beqi	%a0, 0, bnei_else.27257
	add	%v0, %zero, %zero
	j	bnei_cont.27218
bnei_else.27257:
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0
	jal	check_all_inside.2919
bnei_cont.27258:
	j	bnei_cont.27218
bnei_else.27217:
	add	%v0, %zero, %k1
bnei_cont.27218:
	beqi	%v0, 0, bnei_cont.27212
	fsw	%f22, 137(%zero)
	fsw	%f0, 138(%zero)
	fsw	%f1, 139(%zero)
	fsw	%f2, 140(%zero)
	sw	%s3, 141(%zero)
	sw	%s2, 136(%zero)
	j	bnei_cont.27212
bnei_else.27259:
bnei_cont.27260:
	j	bnei_cont.27212
bnei_else.27215:
bnei_cont.27216:
	j	bnei_cont.27212
bnei_else.27211:
bnei_cont.27212:
	addi	%v0, %a3, 1
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0
	addi	%v1, %k0, 0
	j	solve_each_element_fast.2948
bnei_else.27208:
	lw	%a0, 6(%a2)
	beqi	%a0, 0, bnei_else.27261
	addi	%v0, %a3, 1
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0
	addi	%v1, %k0, 0
	j	solve_each_element_fast.2948
bnei_else.27261:
	add	%ra, %zero, %s1
	jr	%ra
bnei_else.27189:
	add	%ra, %zero, %s1
	jr	%ra
solve_one_or_network_fast.2952:
	add	%s5, %zero, %v0
	add	%s6, %zero, %v1
	add	%s7, %zero, %a0
	add	%t7, %zero, %ra
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.27316
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.27317
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.27318
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.27319
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.27320
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.27321
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.27322
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%s5, %s5, 1
	add	%at, %s6, %s5
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.27323
	lw	%v1, 83(%a0)
	addi	%a0, %s7, 0
	addi	%v0, %zero, 0
	jal	solve_each_element_fast.2948
	addi	%v0, %s5, 1
	add	%ra, %zero, %t7
	addi	%a0, %s7, 0
	addi	%v1, %s6, 0
	j	solve_one_or_network_fast.2952
bnei_else.27323:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.27322:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.27321:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.27320:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.27319:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.27318:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.27317:
	add	%ra, %zero, %t7
	jr	%ra
bnei_else.27316:
	add	%ra, %zero, %t7
	jr	%ra
trace_or_matrix_fast.2956:
	sw	%v0, 0(%sp)
	add	%t9, %zero, %v1
	add	%t8, %zero, %a0
	sw	%ra, 1(%sp)
	add	%at, %t9, %v0
	lw	%s5, 0(%at)
	lw	%a1, 0(%s5)
	beqi	%a1, -1, bnei_else.27633
	beqi	%a1, 99, bnei_else.27634
	lw	%v0, 12(%a1)
	lw	%a2, 10(%v0)
	flw	%f0, 0(%a2)
	flw	%f1, 1(%a2)
	flw	%f2, 2(%a2)
	lw	%a0, 1(%t8)
	add	%at, %a0, %a1
	lw	%a0, 0(%at)
	lw	%a1, 1(%v0)
	beqi	%a1, 1, bnei_else.27636
	beqi	%a1, 2, bnei_else.27638
	flw	%f17, 0(%a0)
	fbne	%f17, %fzero, fbeq_else.27640
	add	%a1, %zero, %k1
	j	fbeq_cont.27641
fbeq_else.27640:
	add	%a1, %zero, %zero
fbeq_cont.27641:
	beqi	%a1, 0, bnei_else.27642
	add	%v0, %zero, %zero
	j	bnei_cont.27637
bnei_else.27642:
	flw	%f16, 1(%a0)
	fmul	%f16, %f16, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f1
	fadd	%f1, %f16, %f0
	flw	%f0, 3(%a0)
	fmul	%f0, %f0, %f2
	fadd	%f16, %f1, %f0
	flw	%f0, 3(%a2)
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0
	fsub	%f0, %f1, %f0
	fblt	%fzero, %f0, fbgt_else.27644
	add	%a1, %zero, %zero
	j	fbgt_cont.27645
fbgt_else.27644:
	add	%a1, %zero, %k1
fbgt_cont.27645:
	beqi	%a1, 0, bnei_else.27646
	lw	%a1, 6(%v0)
	beqi	%a1, 0, bnei_else.27648
	fsqrt	%f0, %f0
	fadd	%f1, %f16, %f0
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	j	bnei_cont.27649
bnei_else.27648:
	fsqrt	%f0, %f0
	fsub	%f1, %f16, %f0
	flw	%f0, 4(%a0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
bnei_cont.27649:
	add	%v0, %zero, %k1
	j	bnei_cont.27637
bnei_else.27646:
	add	%v0, %zero, %zero
bnei_cont.27647:
bnei_cont.27643:
	j	bnei_cont.27637
bnei_else.27638:
	flw	%f1, 0(%a0)
	fblt	%f1, %fzero, fbgt_else.27650
	add	%a0, %zero, %zero
	j	fbgt_cont.27651
fbgt_else.27650:
	add	%a0, %zero, %k1
fbgt_cont.27651:
	beqi	%a0, 0, bnei_else.27652
	flw	%f0, 3(%a2)
	fmul	%f0, %f1, %f0
	fsw	%f0, 135(%zero)
	add	%v0, %zero, %k1
	j	bnei_cont.27637
bnei_else.27652:
	add	%v0, %zero, %zero
bnei_cont.27653:
bnei_cont.27639:
	j	bnei_cont.27637
bnei_else.27636:
	lw	%v1, 0(%t8)
	addi	%sp, %sp, 2
	jal	solver_rect_fast.2840
	addi	%sp, %sp, -2
bnei_cont.27637:
	beqi	%v0, 0, bnei_cont.27635
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.27656
	add	%a0, %zero, %zero
	j	fbgt_cont.27657
fbgt_else.27656:
	add	%a0, %zero, %k1
fbgt_cont.27657:
	beqi	%a0, 0, bnei_cont.27635
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_cont.27635
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.27635
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.27635
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.27635
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 5(%s5)
	beqi	%a0, -1, bnei_cont.27635
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 6(%s5)
	beqi	%a0, -1, bnei_cont.27635
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 7(%s5)
	beqi	%a0, -1, bnei_cont.27635
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 2
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -2
	j	bnei_cont.27635
bnei_else.27672:
bnei_cont.27673:
	j	bnei_cont.27635
bnei_else.27670:
bnei_cont.27671:
	j	bnei_cont.27635
bnei_else.27668:
bnei_cont.27669:
	j	bnei_cont.27635
bnei_else.27666:
bnei_cont.27667:
	j	bnei_cont.27635
bnei_else.27664:
bnei_cont.27665:
	j	bnei_cont.27635
bnei_else.27662:
bnei_cont.27663:
	j	bnei_cont.27635
bnei_else.27660:
bnei_cont.27661:
	j	bnei_cont.27635
bnei_else.27658:
bnei_cont.27659:
	j	bnei_cont.27635
bnei_else.27654:
bnei_cont.27655:
	j	bnei_cont.27635
bnei_else.27634:
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_else.27674
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.27675
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.27675
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.27675
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 5(%s5)
	beqi	%a0, -1, bnei_cont.27675
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 6(%s5)
	beqi	%a0, -1, bnei_cont.27675
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	lw	%a0, 7(%s5)
	beqi	%a0, -1, bnei_cont.27675
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 2
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -2
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 2
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -2
	j	bnei_cont.27675
bnei_else.27686:
bnei_cont.27687:
	j	bnei_cont.27675
bnei_else.27684:
bnei_cont.27685:
	j	bnei_cont.27675
bnei_else.27682:
bnei_cont.27683:
	j	bnei_cont.27675
bnei_else.27680:
bnei_cont.27681:
	j	bnei_cont.27675
bnei_else.27678:
bnei_cont.27679:
	j	bnei_cont.27675
bnei_else.27676:
bnei_cont.27677:
	j	bnei_cont.27675
bnei_else.27674:
bnei_cont.27675:
bnei_cont.27635:
	lw	%a0, 0(%sp)
	addi	%a0, %a0, 1
	sw	%a0, 2(%sp)
	add	%at, %t9, %a0
	lw	%s5, 0(%at)
	lw	%v0, 0(%s5)
	beqi	%v0, -1, bnei_else.27688
	beqi	%v0, 99, bnei_else.27689
	addi	%v1, %t8, 0
	addi	%sp, %sp, 3
	jal	solver_fast2.2877
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_cont.27690
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.27693
	add	%a0, %zero, %zero
	j	fbgt_cont.27694
fbgt_else.27693:
	add	%a0, %zero, %k1
fbgt_cont.27694:
	beqi	%a0, 0, bnei_cont.27690
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_cont.27690
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.27690
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.27690
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.27690
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 5(%s5)
	beqi	%a0, -1, bnei_cont.27690
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 6(%s5)
	beqi	%a0, -1, bnei_cont.27690
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 3
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -3
	j	bnei_cont.27690
bnei_else.27707:
bnei_cont.27708:
	j	bnei_cont.27690
bnei_else.27705:
bnei_cont.27706:
	j	bnei_cont.27690
bnei_else.27703:
bnei_cont.27704:
	j	bnei_cont.27690
bnei_else.27701:
bnei_cont.27702:
	j	bnei_cont.27690
bnei_else.27699:
bnei_cont.27700:
	j	bnei_cont.27690
bnei_else.27697:
bnei_cont.27698:
	j	bnei_cont.27690
bnei_else.27695:
bnei_cont.27696:
	j	bnei_cont.27690
bnei_else.27691:
bnei_cont.27692:
	j	bnei_cont.27690
bnei_else.27689:
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_else.27709
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.27710
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.27710
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.27710
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 5(%s5)
	beqi	%a0, -1, bnei_cont.27710
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	lw	%a0, 6(%s5)
	beqi	%a0, -1, bnei_cont.27710
	lw	%v1, 83(%a0)
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -3
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 3
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -3
	j	bnei_cont.27710
bnei_else.27719:
bnei_cont.27720:
	j	bnei_cont.27710
bnei_else.27717:
bnei_cont.27718:
	j	bnei_cont.27710
bnei_else.27715:
bnei_cont.27716:
	j	bnei_cont.27710
bnei_else.27713:
bnei_cont.27714:
	j	bnei_cont.27710
bnei_else.27711:
bnei_cont.27712:
	j	bnei_cont.27710
bnei_else.27709:
bnei_cont.27710:
bnei_cont.27690:
	lw	%a0, 2(%sp)
	addi	%v0, %a0, 1
	lw	%ra, 1(%sp)
	addi	%a0, %t8, 0
	addi	%v1, %t9, 0
	j	trace_or_matrix_fast.2956
bnei_else.27688:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.27633:
	jr	%ra
get_nvector_second.2966:
	flw	%f1, 138(%zero)
	lw	%a0, 5(%v0)
	flw	%f0, 0(%a0)
	fsub	%f19, %f1, %f0
	flw	%f1, 139(%zero)
	lw	%a0, 5(%v0)
	flw	%f0, 1(%a0)
	fsub	%f17, %f1, %f0
	flw	%f1, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f0, 2(%a0)
	fsub	%f20, %f1, %f0
	lw	%a0, 4(%v0)
	flw	%f0, 0(%a0)
	fmul	%f21, %f19, %f0
	lw	%a0, 4(%v0)
	flw	%f0, 1(%a0)
	fmul	%f2, %f17, %f0
	lw	%a0, 4(%v0)
	flw	%f0, 2(%a0)
	fmul	%f16, %f20, %f0
	lw	%a0, 3(%v0)
	beqi	%a0, 0, bnei_else.27756
	lw	%a0, 9(%v0)
	flw	%f0, 2(%a0)
	fmul	%f1, %f17, %f0
	lw	%a0, 9(%v0)
	flw	%f0, 1(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	flw	%f18, 473(%zero)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f21, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 9(%v0)
	flw	%f0, 2(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%v0)
	flw	%f0, 0(%a0)
	fmul	%f0, %f20, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f2, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 9(%v0)
	flw	%f0, 1(%a0)
	fmul	%f1, %f19, %f0
	lw	%a0, 9(%v0)
	flw	%f0, 0(%a0)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fadd	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	j	bnei_cont.27757
bnei_else.27756:
	fsw	%f21, 142(%zero)
	fsw	%f2, 143(%zero)
	fsw	%f16, 144(%zero)
bnei_cont.27757:
	lw	%a1, 6(%v0)
	flw	%f18, 142(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 143(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 144(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	fbne	%f1, %fzero, fbeq_else.27758
	add	%a0, %zero, %k1
	j	fbeq_cont.27759
fbeq_else.27758:
	add	%a0, %zero, %zero
fbeq_cont.27759:
	beqi	%a0, 0, bnei_else.27760
	fmov	%f0, %f30
	j	bnei_cont.27761
bnei_else.27760:
	beqi	%a1, 0, bnei_else.27762
	flw	%f0, 458(%zero)
	fdiv	%f0, %f0, %f1
	j	bnei_cont.27763
bnei_else.27762:
	fdiv	%f0, %f30, %f1
bnei_cont.27763:
bnei_cont.27761:
	fmul	%f1, %f18, %f0
	fsw	%f1, 142(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 143(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 144(%zero)
	jr	%ra
utexture.2971:
	add	%a0, %zero, %ra
	lw	%a2, 0(%v0)
	lw	%a1, 8(%v0)
	flw	%f0, 0(%a1)
	fsw	%f0, 145(%zero)
	lw	%a1, 8(%v0)
	flw	%f0, 1(%a1)
	fsw	%f0, 146(%zero)
	lw	%a1, 8(%v0)
	flw	%f0, 2(%a1)
	fsw	%f0, 147(%zero)
	beqi	%a2, 1, bnei_else.27991
	beqi	%a2, 2, bnei_else.27992
	beqi	%a2, 3, bnei_else.27993
	beqi	%a2, 4, bnei_else.27994
	add	%ra, %zero, %a0
	jr	%ra
bnei_else.27994:
	flw	%f1, 0(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 0(%a1)
	fsub	%f1, %f1, %f0
	lw	%a1, 4(%v0)
	flw	%f0, 0(%a1)
	fsqrt	%f0, %f0
	fmul	%f19, %f1, %f0
	flw	%f1, 2(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 2(%a1)
	fsub	%f1, %f1, %f0
	lw	%a1, 4(%v0)
	flw	%f0, 2(%a1)
	fsqrt	%f0, %f0
	fmul	%f18, %f1, %f0
	fmul	%f1, %f19, %f19
	fmul	%f0, %f18, %f18
	fadd	%f17, %f1, %f0
	fabs	%f0, %f19
	flw	%f16, 454(%zero)
	fblt	%f0, %f16, fbgt_else.27996
	add	%a1, %zero, %zero
	j	fbgt_cont.27997
fbgt_else.27996:
	add	%a1, %zero, %k1
fbgt_cont.27997:
	beqi	%a1, 0, bnei_else.27998
	flw	%f1, 453(%zero)
	j	bnei_cont.27999
bnei_else.27998:
	fdiv	%f0, %f18, %f19
	fabs	%f2, %f0
	fblt	%f2, %fzero, fbgt_else.28000
	add	%a1, %zero, %k1
	j	fbgt_cont.28001
fbgt_else.28000:
	add	%a1, %zero, %zero
fbgt_cont.28001:
	fabs	%f19, %f2
	flw	%f0, 469(%zero)
	fblt	%f19, %f0, fbgt_else.28002
	flw	%f0, 462(%zero)
	fblt	%f19, %f0, fbgt_else.28004
	flw	%f18, 479(%zero)
	fdiv	%f20, %f30, %f19
	fmul	%f21, %f20, %f20
	fmul	%f2, %f21, %f21
	fmul	%f19, %f2, %f2
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fsub	%f1, %f20, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f2
	fsub	%f1, %f1, %f0
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f0, %f1, %f0
	fsub	%f0, %f18, %f0
	j	fbgt_cont.28005
fbgt_else.28004:
	flw	%f18, 478(%zero)
	fsub	%f1, %f19, %f30
	fadd	%f0, %f19, %f30
	fdiv	%f20, %f1, %f0
	fmul	%f21, %f20, %f20
	fmul	%f2, %f21, %f21
	fmul	%f19, %f2, %f2
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fsub	%f1, %f20, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f2
	fsub	%f1, %f1, %f0
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f21
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f0, %f1, %f0
	fadd	%f0, %f18, %f0
fbgt_cont.28005:
	beqi	%a1, 0, bnei_else.28006
	j	fbgt_cont.28003
bnei_else.28006:
	fneg	%f0, %f0
bnei_cont.28007:
	j	fbgt_cont.28003
fbgt_else.28002:
	fmul	%f20, %f2, %f2
	fmul	%f19, %f20, %f20
	fmul	%f18, %f19, %f19
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fsub	%f1, %f2, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f18
	fsub	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
fbgt_cont.28003:
	flw	%f1, 452(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 451(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.27999:
	floor	%f0, %f1
	fsub	%f18, %f1, %f0
	flw	%f1, 1(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 1(%a1)
	fsub	%f1, %f1, %f0
	lw	%a1, 4(%v0)
	flw	%f0, 1(%a1)
	fsqrt	%f0, %f0
	fmul	%f1, %f1, %f0
	fabs	%f0, %f17
	fblt	%f0, %f16, fbgt_else.28008
	add	%a1, %zero, %zero
	j	fbgt_cont.28009
fbgt_else.28008:
	add	%a1, %zero, %k1
fbgt_cont.28009:
	beqi	%a1, 0, bnei_else.28010
	flw	%f1, 453(%zero)
	j	bnei_cont.28011
bnei_else.28010:
	fdiv	%f0, %f1, %f17
	fabs	%f19, %f0
	fblt	%f19, %fzero, fbgt_else.28012
	add	%a1, %zero, %k1
	j	fbgt_cont.28013
fbgt_else.28012:
	add	%a1, %zero, %zero
fbgt_cont.28013:
	fabs	%f17, %f19
	flw	%f0, 469(%zero)
	fblt	%f17, %f0, fbgt_else.28014
	flw	%f0, 462(%zero)
	fblt	%f17, %f0, fbgt_else.28016
	flw	%f16, 479(%zero)
	fdiv	%f2, %f30, %f17
	fmul	%f20, %f2, %f2
	fmul	%f19, %f20, %f20
	fmul	%f17, %f19, %f19
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fsub	%f1, %f2, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	fsub	%f0, %f16, %f0
	j	fbgt_cont.28017
fbgt_else.28016:
	flw	%f16, 478(%zero)
	fsub	%f1, %f17, %f30
	fadd	%f0, %f17, %f30
	fdiv	%f2, %f1, %f0
	fmul	%f20, %f2, %f2
	fmul	%f19, %f20, %f20
	fmul	%f17, %f19, %f19
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fsub	%f1, %f2, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f19
	fsub	%f1, %f1, %f0
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f20
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
fbgt_cont.28017:
	beqi	%a1, 0, bnei_else.28018
	j	fbgt_cont.28015
bnei_else.28018:
	fneg	%f0, %f0
bnei_cont.28019:
	j	fbgt_cont.28015
fbgt_else.28014:
	fmul	%f2, %f19, %f19
	fmul	%f17, %f2, %f2
	fmul	%f16, %f17, %f17
	flw	%f0, 468(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fsub	%f1, %f19, %f0
	flw	%f0, 467(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 466(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 465(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 464(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f16
	fsub	%f1, %f1, %f0
	flw	%f0, 463(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fadd	%f0, %f1, %f0
fbgt_cont.28015:
	flw	%f1, 452(%zero)
	fmul	%f1, %f0, %f1
	flw	%f0, 451(%zero)
	fdiv	%f1, %f1, %f0
bnei_cont.28011:
	floor	%f0, %f1
	fsub	%f17, %f1, %f0
	flw	%f1, 450(%zero)
	flw	%f16, 473(%zero)
	fsub	%f0, %f16, %f18
	fmul	%f0, %f0, %f0
	fsub	%f1, %f1, %f0
	fsub	%f0, %f16, %f17
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	fblt	%f0, %fzero, fbgt_else.28020
	add	%a1, %zero, %zero
	j	fbgt_cont.28021
fbgt_else.28020:
	add	%a1, %zero, %k1
fbgt_cont.28021:
	beqi	%a1, 0, bnei_else.28022
	fmov	%f0, %fzero
	j	bnei_cont.28023
bnei_else.28022:
bnei_cont.28023:
	flw	%f1, 449(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 448(%zero)
	fdiv	%f0, %f1, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.27993:
	flw	%f1, 0(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 0(%a1)
	fsub	%f16, %f1, %f0
	flw	%f1, 2(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 2(%a1)
	fsub	%f0, %f1, %f0
	fmul	%f1, %f16, %f16
	fmul	%f0, %f0, %f0
	fadd	%f0, %f1, %f0
	fsqrt	%f1, %f0
	flw	%f0, 447(%zero)
	fdiv	%f1, %f1, %f0
	floor	%f0, %f1
	fsub	%f1, %f1, %f0
	flw	%f0, 451(%zero)
	fmul	%f0, %f1, %f0
	flw	%f18, 495(%zero)
	fabs	%f17, %f0
	flw	%f2, 494(%zero)
	fblt	%f17, %f2, fbgt_else.28025
	flw	%f1, 493(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.28026
	flw	%f1, 481(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.28026
fbgt_else.28049:
fbgt_cont.28050:
	j	fbgt_cont.28026
fbgt_else.28047:
fbgt_cont.28048:
	j	fbgt_cont.28026
fbgt_else.28045:
fbgt_cont.28046:
	j	fbgt_cont.28026
fbgt_else.28043:
fbgt_cont.28044:
	j	fbgt_cont.28026
fbgt_else.28041:
fbgt_cont.28042:
	j	fbgt_cont.28026
fbgt_else.28039:
fbgt_cont.28040:
	j	fbgt_cont.28026
fbgt_else.28037:
fbgt_cont.28038:
	j	fbgt_cont.28026
fbgt_else.28035:
fbgt_cont.28036:
	j	fbgt_cont.28026
fbgt_else.28033:
fbgt_cont.28034:
	j	fbgt_cont.28026
fbgt_else.28031:
fbgt_cont.28032:
	j	fbgt_cont.28026
fbgt_else.28029:
fbgt_cont.28030:
	j	fbgt_cont.28026
fbgt_else.28027:
fbgt_cont.28028:
	j	fbgt_cont.28026
fbgt_else.28025:
	fmov	%f1, %f2
fbgt_cont.28026:
	fblt	%f17, %f2, fbgt_else.28051
	fblt	%f17, %f1, fbgt_else.28053
	fsub	%f0, %f17, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.28052
fbgt_else.28053:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.28054:
	j	fbgt_cont.28052
fbgt_else.28051:
fbgt_cont.28052:
	fblt	%f17, %f18, fbgt_else.28055
	add	%a1, %zero, %zero
	j	fbgt_cont.28056
fbgt_else.28055:
	add	%a1, %zero, %k1
fbgt_cont.28056:
	fblt	%f17, %f18, fbgt_else.28057
	fsub	%f17, %f17, %f18
	j	fbgt_cont.28058
fbgt_else.28057:
fbgt_cont.28058:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.28059
	beqi	%a1, 0, bnei_else.28061
	add	%a1, %zero, %zero
	j	fbgt_cont.28060
bnei_else.28061:
	add	%a1, %zero, %k1
bnei_cont.28062:
	j	fbgt_cont.28060
fbgt_else.28059:
fbgt_cont.28060:
	fblt	%f17, %f1, fbgt_else.28063
	fsub	%f17, %f18, %f17
	j	fbgt_cont.28064
fbgt_else.28063:
fbgt_cont.28064:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.28065
	fmul	%f17, %f17, %f17
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.28066
fbgt_else.28065:
	fsub	%f18, %f1, %f17
	fmul	%f17, %f18, %f18
	fmul	%f16, %f17, %f17
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.28066:
	beqi	%a1, 0, bnei_else.28067
	j	bnei_cont.28068
bnei_else.28067:
	fneg	%f0, %f0
bnei_cont.28068:
	fmul	%f16, %f0, %f0
	flw	%f1, 449(%zero)
	fmul	%f0, %f16, %f1
	fsw	%f0, 146(%zero)
	fsub	%f0, %f30, %f16
	fmul	%f0, %f0, %f1
	add	%ra, %zero, %a0
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.27992:
	flw	%f1, 1(%v1)
	flw	%f0, 446(%zero)
	fmul	%f0, %f1, %f0
	flw	%f18, 495(%zero)
	fblt	%f0, %fzero, fbgt_else.28070
	add	%a1, %zero, %k1
	j	fbgt_cont.28071
fbgt_else.28070:
	add	%a1, %zero, %zero
fbgt_cont.28071:
	fabs	%f17, %f0
	flw	%f2, 494(%zero)
	fblt	%f17, %f2, fbgt_else.28072
	flw	%f1, 493(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 492(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 491(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 490(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 489(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 488(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 487(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 486(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 485(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 484(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 483(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 482(%zero)
	fblt	%f17, %f1, fbgt_cont.28073
	flw	%f1, 481(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	fmov	%f1, %f0
	j	fbgt_cont.28073
fbgt_else.28096:
fbgt_cont.28097:
	j	fbgt_cont.28073
fbgt_else.28094:
fbgt_cont.28095:
	j	fbgt_cont.28073
fbgt_else.28092:
fbgt_cont.28093:
	j	fbgt_cont.28073
fbgt_else.28090:
fbgt_cont.28091:
	j	fbgt_cont.28073
fbgt_else.28088:
fbgt_cont.28089:
	j	fbgt_cont.28073
fbgt_else.28086:
fbgt_cont.28087:
	j	fbgt_cont.28073
fbgt_else.28084:
fbgt_cont.28085:
	j	fbgt_cont.28073
fbgt_else.28082:
fbgt_cont.28083:
	j	fbgt_cont.28073
fbgt_else.28080:
fbgt_cont.28081:
	j	fbgt_cont.28073
fbgt_else.28078:
fbgt_cont.28079:
	j	fbgt_cont.28073
fbgt_else.28076:
fbgt_cont.28077:
	j	fbgt_cont.28073
fbgt_else.28074:
fbgt_cont.28075:
	j	fbgt_cont.28073
fbgt_else.28072:
	fmov	%f1, %f2
fbgt_cont.28073:
	fblt	%f17, %f2, fbgt_else.28098
	fblt	%f17, %f1, fbgt_else.28100
	fsub	%f0, %f17, %f1
	flw	%f16, 496(%zero)
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.28099
fbgt_else.28100:
	flw	%f0, 496(%zero)
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.28101:
	j	fbgt_cont.28099
fbgt_else.28098:
fbgt_cont.28099:
	fblt	%f17, %f18, fbgt_else.28102
	beqi	%a1, 0, bnei_else.28104
	add	%a1, %zero, %zero
	j	fbgt_cont.28103
bnei_else.28104:
	add	%a1, %zero, %k1
bnei_cont.28105:
	j	fbgt_cont.28103
fbgt_else.28102:
fbgt_cont.28103:
	fblt	%f17, %f18, fbgt_else.28106
	fsub	%f17, %f17, %f18
	j	fbgt_cont.28107
fbgt_else.28106:
fbgt_cont.28107:
	flw	%f1, 479(%zero)
	fblt	%f17, %f1, fbgt_else.28108
	fsub	%f17, %f18, %f17
	j	fbgt_cont.28109
fbgt_else.28108:
fbgt_cont.28109:
	flw	%f0, 478(%zero)
	fblt	%f0, %f17, fbgt_else.28110
	fmul	%f18, %f17, %f17
	fmul	%f16, %f18, %f18
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f18
	fsub	%f1, %f17, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.28111
fbgt_else.28110:
	fsub	%f0, %f1, %f17
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.28111:
	beqi	%a1, 0, bnei_else.28112
	j	bnei_cont.28113
bnei_else.28112:
	fneg	%f0, %f0
bnei_cont.28113:
	fmul	%f16, %f0, %f0
	flw	%f1, 449(%zero)
	fmul	%f0, %f1, %f16
	fsw	%f0, 145(%zero)
	fsub	%f0, %f30, %f16
	fmul	%f0, %f1, %f0
	add	%ra, %zero, %a0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.27991:
	flw	%f1, 0(%v1)
	lw	%a1, 5(%v0)
	flw	%f0, 0(%a1)
	fsub	%f1, %f1, %f0
	flw	%f18, 445(%zero)
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	flw	%f17, 444(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	flw	%f16, 447(%zero)
	fblt	%f0, %f16, fbgt_else.28115
	add	%a1, %zero, %zero
	j	fbgt_cont.28116
fbgt_else.28115:
	add	%a1, %zero, %k1
fbgt_cont.28116:
	flw	%f1, 2(%v1)
	lw	%a2, 5(%v0)
	flw	%f0, 2(%a2)
	fsub	%f1, %f1, %f0
	fmul	%f0, %f1, %f18
	floor	%f0, %f0
	fmul	%f0, %f0, %f17
	fsub	%f0, %f1, %f0
	fblt	%f0, %f16, fbgt_else.28117
	add	%a2, %zero, %zero
	j	fbgt_cont.28118
fbgt_else.28117:
	add	%a2, %zero, %k1
fbgt_cont.28118:
	beqi	%a1, 0, bnei_else.28119
	beqi	%a2, 0, bnei_else.28121
	flw	%f0, 449(%zero)
	j	bnei_cont.28120
bnei_else.28121:
	fmov	%f0, %fzero
bnei_cont.28122:
	j	bnei_cont.28120
bnei_else.28119:
	beqi	%a2, 0, bnei_else.28123
	fmov	%f0, %fzero
	j	bnei_cont.28124
bnei_else.28123:
	flw	%f0, 449(%zero)
bnei_cont.28124:
bnei_cont.28120:
	add	%ra, %zero, %a0
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2978:
	fmov	%f25, %f0
	fmov	%f26, %f1
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t2, 2(%sp)
	sw	%t1, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	blti	%v0, 0, bgti_else.28227
	lw	%t2, 254(%v0)
	lw	%t0, 1(%t2)
	flw	%f0, 443(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -6
	flw	%f1, 137(%zero)
	flw	%f0, 455(%zero)
	fblt	%f0, %f1, fbgt_else.28228
	add	%a0, %zero, %zero
	j	fbgt_cont.28229
fbgt_else.28228:
	add	%a0, %zero, %k1
fbgt_cont.28229:
	beqi	%a0, 0, bnei_else.28230
	flw	%f0, 442(%zero)
	fblt	%f1, %f0, fbgt_else.28232
	add	%a0, %zero, %zero
	j	bnei_cont.28231
fbgt_else.28232:
	add	%a0, %zero, %k1
fbgt_cont.28233:
	j	bnei_cont.28231
bnei_else.28230:
	add	%a0, %zero, %zero
bnei_cont.28231:
	beqi	%a0, 0, bnei_else.28234
	lw	%a0, 141(%zero)
	sll	%a1, %a0, 2
	lw	%a0, 136(%zero)
	add	%a1, %a1, %a0
	lw	%a0, 0(%t2)
	bne	%a1, %a0, bnei_cont.28235
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -6
	beqi	%v0, 0, bnei_else.28238
	j	bnei_cont.28235
bnei_else.28238:
	lw	%a0, 0(%t0)
	flw	%f1, 142(%zero)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	flw	%f18, 2(%t2)
	fmul	%f0, %f18, %f25
	fmul	%f17, %f0, %f1
	lw	%a1, 0(%t0)
	lw	%a0, 1(%sp)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%a1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fmul	%f16, %f18, %f0
	fblt	%fzero, %f17, fbgt_else.28240
	add	%a0, %zero, %zero
	j	fbgt_cont.28241
fbgt_else.28240:
	add	%a0, %zero, %k1
fbgt_cont.28241:
	beqi	%a0, 0, bnei_else.28242
	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 151(%zero)
	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 152(%zero)
	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.28243
bnei_else.28242:
bnei_cont.28243:
	fblt	%fzero, %f16, fbgt_else.28244
	add	%a0, %zero, %zero
	j	fbgt_cont.28245
fbgt_else.28244:
	add	%a0, %zero, %k1
fbgt_cont.28245:
	beqi	%a0, 0, bnei_cont.28235
	fmul	%f0, %f16, %f16
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f26
	flw	%f0, 151(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.28235
bnei_else.28246:
bnei_cont.28247:
bnei_cont.28239:
	j	bnei_cont.28235
beq_else.28236:
beq_cont.28237:
	j	bnei_cont.28235
bnei_else.28234:
bnei_cont.28235:
	lw	%a0, 0(%sp)
	addi	%v0, %a0, -1
	lw	%t2, 2(%sp)
	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v1, 1(%sp)
	fmov	%f1, %f26
	fmov	%f0, %f25
	j	trace_reflections.2978
bgti_else.28227:
	jr	%ra
trace_ray.2983:
	fmov	%f27, %f0
	fsw	%f1, 0(%sp)
	sw	%v0, 1(%sp)
	add	%a1, %zero, %v1
	sw	%a1, 2(%sp)
	sw	%a0, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.28486
	lw	%a0, 2(%a0)
	sw	%a0, 6(%sp)
	flw	%f0, 443(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 7(%sp)
	addi	%a0, %a1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix.2942
	addi	%sp, %sp, -8
	flw	%f1, 137(%zero)
	fsw	%f1, 8(%sp)
	flw	%f0, 455(%zero)
	fblt	%f0, %f1, fbgt_else.28487
	add	%a0, %zero, %zero
	j	fbgt_cont.28488
fbgt_else.28487:
	add	%a0, %zero, %k1
fbgt_cont.28488:
	beqi	%a0, 0, bnei_else.28489
	flw	%f1, 442(%zero)
	flw	%f0, 8(%sp)
	fblt	%f0, %f1, fbgt_else.28491
	add	%a0, %zero, %zero
	j	bnei_cont.28490
fbgt_else.28491:
	add	%a0, %zero, %k1
fbgt_cont.28492:
	j	bnei_cont.28490
bnei_else.28489:
	add	%a0, %zero, %zero
bnei_cont.28490:
	beqi	%a0, 0, bnei_else.28493
	lw	%a3, 141(%zero)
	lw	%t0, 12(%a3)
	lw	%a0, 2(%t0)
	sw	%a0, 9(%sp)
	lw	%a0, 7(%t0)
	flw	%f0, 0(%a0)
	fmul	%f0, %f0, %f27
	fsw	%f0, 10(%sp)
	lw	%a0, 1(%t0)
	beqi	%a0, 1, bnei_else.28494
	beqi	%a0, 2, bnei_else.28496
	addi	%v0, %t0, 0
	addi	%sp, %sp, 11
	jal	get_nvector_second.2966
	addi	%sp, %sp, -11
	j	bnei_cont.28495
bnei_else.28496:
	lw	%a0, 4(%t0)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t0)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t0)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.28497:
	j	bnei_cont.28495
bnei_else.28494:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	lw	%a0, 2(%sp)
	add	%at, %a0, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.28498
	add	%a0, %zero, %k1
	j	fbeq_cont.28499
fbeq_else.28498:
	add	%a0, %zero, %zero
fbeq_cont.28499:
	beqi	%a0, 0, bnei_else.28500
	fmov	%f0, %fzero
	j	bnei_cont.28501
bnei_else.28500:
	fblt	%fzero, %f0, fbgt_else.28502
	add	%a0, %zero, %zero
	j	fbgt_cont.28503
fbgt_else.28502:
	add	%a0, %zero, %k1
fbgt_cont.28503:
	beqi	%a0, 0, bnei_else.28504
	fmov	%f0, %f30
	j	bnei_cont.28505
bnei_else.28504:
	flw	%f0, 458(%zero)
bnei_cont.28505:
bnei_cont.28501:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.28495:
	flw	%f0, 138(%zero)
	fsw	%f0, 11(%sp)
	fsw	%f0, 159(%zero)
	flw	%f25, 139(%zero)
	fsw	%f25, 160(%zero)
	flw	%f26, 140(%zero)
	fsw	%f26, 161(%zero)
	addi	%v1, %zero, 138
	addi	%v0, %t0, 0
	addi	%sp, %sp, 12
	jal	utexture.2971
	addi	%sp, %sp, -12
	sll	%a1, %a3, 2
	lw	%a0, 136(%zero)
	add	%a1, %a1, %a0
	lw	%a0, 6(%sp)
	lw	%a2, 1(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
	lw	%a1, 3(%sp)
	lw	%a0, 1(%a1)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	flw	%f0, 11(%sp)
	fsw	%f0, 0(%a0)
	fsw	%f25, 1(%a0)
	fsw	%f26, 2(%a0)
	lw	%a1, 3(%a1)
	lw	%a0, 7(%t0)
	flw	%f1, 0(%a0)
	flw	%f0, 473(%zero)
	fblt	%f1, %f0, fbgt_else.28506
	add	%a0, %zero, %zero
	j	fbgt_cont.28507
fbgt_else.28506:
	add	%a0, %zero, %k1
fbgt_cont.28507:
	beqi	%a0, 0, bnei_else.28508
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%zero, 0(%at)
	j	bnei_cont.28509
bnei_else.28508:
	lw	%a2, 1(%sp)
	add	%at, %a1, %a2
	sw	%k1, 0(%at)
	lw	%a1, 3(%sp)
	lw	%a0, 4(%a1)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	flw	%f0, 145(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 146(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 147(%zero)
	fsw	%f0, 2(%a0)
	flw	%f1, 441(%zero)
	flw	%f0, 10(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 0(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 2(%a0)
	lw	%a0, 7(%a1)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	flw	%f0, 142(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 143(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 144(%zero)
	fsw	%f0, 2(%a0)
bnei_cont.28509:
	flw	%f19, 440(%zero)
	lw	%a0, 2(%sp)
	flw	%f16, 0(%a0)
	flw	%f3, 142(%zero)
	fmul	%f1, %f16, %f3
	flw	%f17, 1(%a0)
	flw	%f29, 143(%zero)
	fmul	%f0, %f17, %f29
	fadd	%f1, %f1, %f0
	flw	%f18, 2(%a0)
	flw	%f28, 144(%zero)
	fmul	%f0, %f18, %f28
	fadd	%f0, %f1, %f0
	fmul	%f1, %f19, %f0
	fmul	%f0, %f1, %f3
	fadd	%f0, %f16, %f0
	fsw	%f0, 0(%a0)
	fmul	%f0, %f1, %f29
	fadd	%f0, %f17, %f0
	fsw	%f0, 1(%a0)
	fmul	%f0, %f1, %f28
	fadd	%f0, %f18, %f0
	fsw	%f0, 2(%a0)
	lw	%a0, 7(%t0)
	flw	%f0, 1(%a0)
	fmul	%f0, %f27, %f0
	fsw	%f0, 12(%sp)
	lw	%v1, 7(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 13
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -13
	beqi	%v0, 0, bnei_else.28510
	j	bnei_cont.28511
bnei_else.28510:
	flw	%f19, 78(%zero)
	fmul	%f1, %f3, %f19
	flw	%f17, 79(%zero)
	fmul	%f0, %f29, %f17
	fadd	%f1, %f1, %f0
	flw	%f18, 80(%zero)
	fmul	%f0, %f28, %f18
	fadd	%f0, %f1, %f0
	fneg	%f1, %f0
	flw	%f0, 10(%sp)
	fmul	%f16, %f1, %f0
	lw	%a0, 2(%sp)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f19
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f17
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f18
	fadd	%f0, %f1, %f0
	fneg	%f17, %f0
	fblt	%fzero, %f16, fbgt_else.28512
	add	%a0, %zero, %zero
	j	fbgt_cont.28513
fbgt_else.28512:
	add	%a0, %zero, %k1
fbgt_cont.28513:
	beqi	%a0, 0, bnei_else.28514
	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 151(%zero)
	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 152(%zero)
	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.28515
bnei_else.28514:
bnei_cont.28515:
	fblt	%fzero, %f17, fbgt_else.28516
	add	%a0, %zero, %zero
	j	fbgt_cont.28517
fbgt_else.28516:
	add	%a0, %zero, %k1
fbgt_cont.28517:
	beqi	%a0, 0, bnei_else.28518
	fmul	%f0, %f17, %f17
	fmul	%f1, %f0, %f0
	flw	%f0, 12(%sp)
	fmul	%f1, %f1, %f0
	flw	%f0, 151(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 151(%zero)
	flw	%f0, 152(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 152(%zero)
	flw	%f0, 153(%zero)
	fadd	%f0, %f0, %f1
	fsw	%f0, 153(%zero)
	j	bnei_cont.28519
bnei_else.28518:
bnei_cont.28519:
bnei_cont.28511:
	flw	%f0, 11(%sp)
	fsw	%f0, 162(%zero)
	fsw	%f25, 163(%zero)
	fsw	%f26, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %zero, 138
	addi	%sp, %sp, 13
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -13
	lw	%a0, 434(%zero)
	addi	%v0, %a0, -1
	flw	%f1, 12(%sp)
	flw	%f0, 10(%sp)
	lw	%v1, 2(%sp)
	addi	%sp, %sp, 13
	jal	trace_reflections.2978
	addi	%sp, %sp, -13
	flw	%f0, 439(%zero)
	fblt	%f0, %f27, fbgt_else.28520
	add	%a0, %zero, %zero
	j	fbgt_cont.28521
fbgt_else.28520:
	add	%a0, %zero, %k1
fbgt_cont.28521:
	beqi	%a0, 0, bnei_else.28522
	lw	%a0, 1(%sp)
	blti	%a0, 4, bgti_else.28523
	j	bgti_cont.28524
bgti_else.28523:
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1
	lw	%a0, 6(%sp)
	add	%at, %a0, %a2
	sw	%a1, 0(%at)
bgti_cont.28524:
	lw	%a0, 9(%sp)
	beqi	%a0, 2, bnei_else.28525
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.28525:
	lw	%a0, 7(%t0)
	flw	%f0, 0(%a0)
	fsub	%f0, %f30, %f0
	fmul	%f0, %f27, %f0
	lw	%a0, 1(%sp)
	addi	%v0, %a0, 1
	flw	%f16, 0(%sp)
	flw	%f1, 8(%sp)
	fadd	%f1, %f16, %f1
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	j	trace_ray.2983
bnei_else.28522:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.28493:
	addi	%a2, %zero, -1
	lw	%a1, 6(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	sw	%a2, 0(%at)
	beqi	%a0, 0, bnei_else.28528
	lw	%a0, 2(%sp)
	flw	%f1, 0(%a0)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f1, %f0
	fblt	%fzero, %f1, fbgt_else.28529
	add	%a0, %zero, %zero
	j	fbgt_cont.28530
fbgt_else.28529:
	add	%a0, %zero, %k1
fbgt_cont.28530:
	beqi	%a0, 0, bnei_else.28531
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f1
	fmul	%f1, %f0, %f27
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
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	fsw	%f0, 153(%zero)
	jr	%ra
bnei_else.28531:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bnei_else.28528:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bgt_else.28486:
	jr	%ra
trace_diffuse_ray.2989:
	fmov	%f25, %f0
	add	%a0, %zero, %v0
	sw	%a0, 0(%sp)
	sw	%ra, 1(%sp)
	flw	%f0, 443(%zero)
	fsw	%f0, 137(%zero)
	lw	%v1, 134(%zero)
	sw	%v1, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -3
	flw	%f1, 137(%zero)
	flw	%f0, 455(%zero)
	fblt	%f0, %f1, fbgt_else.28648
	add	%a0, %zero, %zero
	j	fbgt_cont.28649
fbgt_else.28648:
	add	%a0, %zero, %k1
fbgt_cont.28649:
	beqi	%a0, 0, bnei_else.28650
	flw	%f0, 442(%zero)
	fblt	%f1, %f0, fbgt_else.28652
	add	%a0, %zero, %zero
	j	bnei_cont.28651
fbgt_else.28652:
	add	%a0, %zero, %k1
fbgt_cont.28653:
	j	bnei_cont.28651
bnei_else.28650:
	add	%a0, %zero, %zero
bnei_cont.28651:
	beqi	%a0, 0, bnei_else.28654
	lw	%a0, 141(%zero)
	lw	%t7, 12(%a0)
	lw	%a0, 0(%sp)
	lw	%a2, 0(%a0)
	lw	%a0, 1(%t7)
	beqi	%a0, 1, bnei_else.28655
	beqi	%a0, 2, bnei_else.28657
	addi	%v0, %t7, 0
	addi	%sp, %sp, 3
	jal	get_nvector_second.2966
	addi	%sp, %sp, -3
	j	bnei_cont.28656
bnei_else.28657:
	lw	%a0, 4(%t7)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t7)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t7)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.28658:
	j	bnei_cont.28656
bnei_else.28655:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.28659
	add	%a0, %zero, %k1
	j	fbeq_cont.28660
fbeq_else.28659:
	add	%a0, %zero, %zero
fbeq_cont.28660:
	beqi	%a0, 0, bnei_else.28661
	fmov	%f0, %fzero
	j	bnei_cont.28662
bnei_else.28661:
	fblt	%fzero, %f0, fbgt_else.28663
	add	%a0, %zero, %zero
	j	fbgt_cont.28664
fbgt_else.28663:
	add	%a0, %zero, %k1
fbgt_cont.28664:
	beqi	%a0, 0, bnei_else.28665
	fmov	%f0, %f30
	j	bnei_cont.28666
bnei_else.28665:
	flw	%f0, 458(%zero)
bnei_cont.28666:
bnei_cont.28662:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.28656:
	addi	%v1, %zero, 138
	addi	%v0, %t7, 0
	addi	%sp, %sp, 3
	jal	utexture.2971
	addi	%sp, %sp, -3
	lw	%v1, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -3
	beqi	%v0, 0, bnei_else.28667
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.28667:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.28669
	add	%a0, %zero, %zero
	j	fbgt_cont.28670
fbgt_else.28669:
	add	%a0, %zero, %k1
fbgt_cont.28670:
	beqi	%a0, 0, bnei_else.28671
	j	bnei_cont.28672
bnei_else.28671:
	fmov	%f0, %fzero
bnei_cont.28672:
	fmul	%f1, %f25, %f0
	lw	%a0, 7(%t7)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	lw	%ra, 1(%sp)
	fsw	%f0, 150(%zero)
	jr	%ra
bnei_else.28654:
	lw	%ra, 1(%sp)
	jr	%ra
iter_trace_diffuse_rays.2992:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%t2, 4(%sp)
	sw	%t1, 5(%sp)
	sw	%t0, 6(%sp)
	sw	%ra, 7(%sp)
	blti	%a1, 0, bgti_else.29071
	add	%at, %v0, %a1
	lw	%t0, 0(%at)
	lw	%a0, 0(%t0)
	flw	%f0, 0(%a0)
	flw	%f25, 0(%v1)
	fmul	%f1, %f0, %f25
	flw	%f0, 1(%a0)
	flw	%f26, 1(%v1)
	fmul	%f0, %f0, %f26
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	flw	%f27, 2(%v1)
	fmul	%f0, %f0, %f27
	fadd	%f1, %f1, %f0
	fblt	%f1, %fzero, fbgt_else.29072
	add	%a0, %zero, %zero
	j	fbgt_cont.29073
fbgt_else.29072:
	add	%a0, %zero, %k1
fbgt_cont.29073:
	beqi	%a0, 0, bnei_else.29074
	lw	%a0, 3(%sp)
	addi	%a1, %a0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%t0, 0(%at)
	flw	%f0, 438(%zero)
	fdiv	%f28, %f1, %f0
	flw	%f0, 443(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	lw	%s5, 0(%t1)
	lw	%v0, 0(%s5)
	beqi	%v0, -1, bnei_else.29076
	beqi	%v0, 99, bnei_else.29078
	addi	%v1, %t0, 0
	addi	%sp, %sp, 8
	jal	solver_fast2.2877
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_cont.29079
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.29082
	add	%a0, %zero, %zero
	j	fbgt_cont.29083
fbgt_else.29082:
	add	%a0, %zero, %k1
fbgt_cont.29083:
	beqi	%a0, 0, bnei_cont.29079
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_cont.29079
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.29079
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.29079
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.29079
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	j	bnei_cont.29079
bnei_else.29092:
bnei_cont.29093:
	j	bnei_cont.29079
bnei_else.29090:
bnei_cont.29091:
	j	bnei_cont.29079
bnei_else.29088:
bnei_cont.29089:
	j	bnei_cont.29079
bnei_else.29086:
bnei_cont.29087:
	j	bnei_cont.29079
bnei_else.29084:
bnei_cont.29085:
	j	bnei_cont.29079
bnei_else.29080:
bnei_cont.29081:
	j	bnei_cont.29079
bnei_else.29078:
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_else.29094
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.29095
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.29095
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.29095
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	j	bnei_cont.29095
bnei_else.29100:
bnei_cont.29101:
	j	bnei_cont.29095
bnei_else.29098:
bnei_cont.29099:
	j	bnei_cont.29095
bnei_else.29096:
bnei_cont.29097:
	j	bnei_cont.29095
bnei_else.29094:
bnei_cont.29095:
bnei_cont.29079:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -8
	j	bnei_cont.29077
bnei_else.29076:
bnei_cont.29077:
	flw	%f1, 137(%zero)
	flw	%f0, 455(%zero)
	fblt	%f0, %f1, fbgt_else.29102
	add	%a0, %zero, %zero
	j	fbgt_cont.29103
fbgt_else.29102:
	add	%a0, %zero, %k1
fbgt_cont.29103:
	beqi	%a0, 0, bnei_else.29104
	flw	%f0, 442(%zero)
	fblt	%f1, %f0, fbgt_else.29106
	add	%a0, %zero, %zero
	j	bnei_cont.29105
fbgt_else.29106:
	add	%a0, %zero, %k1
fbgt_cont.29107:
	j	bnei_cont.29105
bnei_else.29104:
	add	%a0, %zero, %zero
bnei_cont.29105:
	beqi	%a0, 0, bnei_cont.29075
	lw	%a0, 141(%zero)
	lw	%t2, 12(%a0)
	lw	%a2, 0(%t0)
	lw	%a0, 1(%t2)
	beqi	%a0, 1, bnei_else.29110
	beqi	%a0, 2, bnei_else.29112
	addi	%v0, %t2, 0
	addi	%sp, %sp, 8
	jal	get_nvector_second.2966
	addi	%sp, %sp, -8
	j	bnei_cont.29111
bnei_else.29112:
	lw	%a0, 4(%t2)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t2)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t2)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.29113:
	j	bnei_cont.29111
bnei_else.29110:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.29114
	add	%a0, %zero, %k1
	j	fbeq_cont.29115
fbeq_else.29114:
	add	%a0, %zero, %zero
fbeq_cont.29115:
	beqi	%a0, 0, bnei_else.29116
	fmov	%f0, %fzero
	j	bnei_cont.29117
bnei_else.29116:
	fblt	%fzero, %f0, fbgt_else.29118
	add	%a0, %zero, %zero
	j	fbgt_cont.29119
fbgt_else.29118:
	add	%a0, %zero, %k1
fbgt_cont.29119:
	beqi	%a0, 0, bnei_else.29120
	fmov	%f0, %f30
	j	bnei_cont.29121
bnei_else.29120:
	flw	%f0, 458(%zero)
bnei_cont.29121:
bnei_cont.29117:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.29111:
	addi	%v1, %zero, 138
	addi	%v0, %t2, 0
	addi	%sp, %sp, 8
	jal	utexture.2971
	addi	%sp, %sp, -8
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.29122
	j	bnei_cont.29075
bnei_else.29122:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.29124
	add	%a0, %zero, %zero
	j	fbgt_cont.29125
fbgt_else.29124:
	add	%a0, %zero, %k1
fbgt_cont.29125:
	beqi	%a0, 0, bnei_else.29126
	j	bnei_cont.29127
bnei_else.29126:
	fmov	%f0, %fzero
bnei_cont.29127:
	fmul	%f1, %f28, %f0
	lw	%a0, 7(%t2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.29123:
	j	bnei_cont.29075
bnei_else.29108:
bnei_cont.29109:
	j	bnei_cont.29075
bnei_else.29074:
	flw	%f0, 437(%zero)
	fdiv	%f28, %f1, %f0
	flw	%f0, 443(%zero)
	fsw	%f0, 137(%zero)
	lw	%t1, 134(%zero)
	lw	%s5, 0(%t1)
	lw	%v0, 0(%s5)
	beqi	%v0, -1, bnei_else.29128
	beqi	%v0, 99, bnei_else.29130
	addi	%v1, %t0, 0
	addi	%sp, %sp, 8
	jal	solver_fast2.2877
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_cont.29131
	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	fblt	%f1, %f0, fbgt_else.29134
	add	%a0, %zero, %zero
	j	fbgt_cont.29135
fbgt_else.29134:
	add	%a0, %zero, %k1
fbgt_cont.29135:
	beqi	%a0, 0, bnei_cont.29131
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_cont.29131
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.29131
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.29131
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.29131
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	j	bnei_cont.29131
bnei_else.29144:
bnei_cont.29145:
	j	bnei_cont.29131
bnei_else.29142:
bnei_cont.29143:
	j	bnei_cont.29131
bnei_else.29140:
bnei_cont.29141:
	j	bnei_cont.29131
bnei_else.29138:
bnei_cont.29139:
	j	bnei_cont.29131
bnei_else.29136:
bnei_cont.29137:
	j	bnei_cont.29131
bnei_else.29132:
bnei_cont.29133:
	j	bnei_cont.29131
bnei_else.29130:
	lw	%a0, 1(%s5)
	beqi	%a0, -1, bnei_else.29146
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 2(%s5)
	beqi	%a0, -1, bnei_cont.29147
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 3(%s5)
	beqi	%a0, -1, bnei_cont.29147
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	lw	%a0, 4(%s5)
	beqi	%a0, -1, bnei_cont.29147
	lw	%v1, 83(%a0)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2948
	addi	%sp, %sp, -8
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0
	addi	%v1, %s5, 0
	addi	%sp, %sp, 8
	jal	solve_one_or_network_fast.2952
	addi	%sp, %sp, -8
	j	bnei_cont.29147
bnei_else.29152:
bnei_cont.29153:
	j	bnei_cont.29147
bnei_else.29150:
bnei_cont.29151:
	j	bnei_cont.29147
bnei_else.29148:
bnei_cont.29149:
	j	bnei_cont.29147
bnei_else.29146:
bnei_cont.29147:
bnei_cont.29131:
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956
	addi	%sp, %sp, -8
	j	bnei_cont.29129
bnei_else.29128:
bnei_cont.29129:
	flw	%f1, 137(%zero)
	flw	%f0, 455(%zero)
	fblt	%f0, %f1, fbgt_else.29154
	add	%a0, %zero, %zero
	j	fbgt_cont.29155
fbgt_else.29154:
	add	%a0, %zero, %k1
fbgt_cont.29155:
	beqi	%a0, 0, bnei_else.29156
	flw	%f0, 442(%zero)
	fblt	%f1, %f0, fbgt_else.29158
	add	%a0, %zero, %zero
	j	bnei_cont.29157
fbgt_else.29158:
	add	%a0, %zero, %k1
fbgt_cont.29159:
	j	bnei_cont.29157
bnei_else.29156:
	add	%a0, %zero, %zero
bnei_cont.29157:
	beqi	%a0, 0, bnei_else.29160
	lw	%a0, 141(%zero)
	lw	%t2, 12(%a0)
	lw	%a2, 0(%t0)
	lw	%a0, 1(%t2)
	beqi	%a0, 1, bnei_else.29162
	beqi	%a0, 2, bnei_else.29164
	addi	%v0, %t2, 0
	addi	%sp, %sp, 8
	jal	get_nvector_second.2966
	addi	%sp, %sp, -8
	j	bnei_cont.29163
bnei_else.29164:
	lw	%a0, 4(%t2)
	flw	%f0, 0(%a0)
	fneg	%f0, %f0
	fsw	%f0, 142(%zero)
	lw	%a0, 4(%t2)
	flw	%f0, 1(%a0)
	fneg	%f0, %f0
	fsw	%f0, 143(%zero)
	lw	%a0, 4(%t2)
	flw	%f0, 2(%a0)
	fneg	%f0, %f0
	fsw	%f0, 144(%zero)
bnei_cont.29165:
	j	bnei_cont.29163
bnei_else.29162:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	fsw	%fzero, 143(%zero)
	fsw	%fzero, 144(%zero)
	addi	%a1, %a0, -1
	add	%at, %a2, %a1
	flw	%f0, 0(%at)
	fbne	%f0, %fzero, fbeq_else.29166
	add	%a0, %zero, %k1
	j	fbeq_cont.29167
fbeq_else.29166:
	add	%a0, %zero, %zero
fbeq_cont.29167:
	beqi	%a0, 0, bnei_else.29168
	fmov	%f0, %fzero
	j	bnei_cont.29169
bnei_else.29168:
	fblt	%fzero, %f0, fbgt_else.29170
	add	%a0, %zero, %zero
	j	fbgt_cont.29171
fbgt_else.29170:
	add	%a0, %zero, %k1
fbgt_cont.29171:
	beqi	%a0, 0, bnei_else.29172
	fmov	%f0, %f30
	j	bnei_cont.29173
bnei_else.29172:
	flw	%f0, 458(%zero)
bnei_cont.29173:
bnei_cont.29169:
	fneg	%f0, %f0
	fsw	%f0, 142(%a1)
bnei_cont.29163:
	addi	%v1, %zero, 138
	addi	%v0, %t2, 0
	addi	%sp, %sp, 8
	jal	utexture.2971
	addi	%sp, %sp, -8
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 8
	jal	shadow_check_one_or_matrix.2931
	addi	%sp, %sp, -8
	beqi	%v0, 0, bnei_else.29174
	j	bnei_cont.29161
bnei_else.29174:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	fmul	%f16, %f1, %f0
	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 144(%zero)
	flw	%f0, 80(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fneg	%f0, %f0
	fblt	%fzero, %f0, fbgt_else.29176
	add	%a0, %zero, %zero
	j	fbgt_cont.29177
fbgt_else.29176:
	add	%a0, %zero, %k1
fbgt_cont.29177:
	beqi	%a0, 0, bnei_else.29178
	j	bnei_cont.29179
bnei_else.29178:
	fmov	%f0, %fzero
bnei_cont.29179:
	fmul	%f1, %f28, %f0
	lw	%a0, 7(%t2)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	fmul	%f0, %f16, %f0
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
bnei_cont.29175:
	j	bnei_cont.29161
bnei_else.29160:
bnei_cont.29161:
bnei_cont.29075:
	lw	%a0, 3(%sp)
	addi	%t0, %a0, -2
	blti	%t0, 0, bgti_else.29180
	lw	%a0, 0(%sp)
	add	%at, %a0, %t0
	lw	%v0, 0(%at)
	lw	%a0, 0(%v0)
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f25
	flw	%f0, 1(%a0)
	fmul	%f0, %f0, %f26
	fadd	%f1, %f1, %f0
	flw	%f0, 2(%a0)
	fmul	%f0, %f0, %f27
	fadd	%f1, %f1, %f0
	fblt	%f1, %fzero, fbgt_else.29181
	add	%a0, %zero, %zero
	j	fbgt_cont.29182
fbgt_else.29181:
	add	%a0, %zero, %k1
fbgt_cont.29182:
	beqi	%a0, 0, bnei_else.29183
	addi	%a1, %t0, 1
	lw	%a0, 0(%sp)
	add	%at, %a0, %a1
	lw	%v0, 0(%at)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -8
	j	bnei_cont.29184
bnei_else.29183:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 8
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -8
bnei_cont.29184:
	addi	%a1, %t0, -2
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	j	iter_trace_diffuse_rays.2992
bgti_else.29180:
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	jr	%ra
bgti_else.29071:
	jr	%ra
calc_diffuse_using_1point.3005:
	sw	%v1, 0(%sp)
	sw	%t4, 1(%sp)
	sw	%t3, 2(%sp)
	sw	%t2, 3(%sp)
	sw	%t1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%ra, 6(%sp)
	lw	%a0, 5(%v0)
	lw	%a2, 7(%v0)
	lw	%a1, 1(%v0)
	lw	%t2, 4(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%v0)
	lw	%t3, 0(%a0)
	add	%at, %a2, %v1
	lw	%t1, 0(%at)
	add	%at, %a1, %v1
	lw	%t0, 0(%at)
	beqi	%t3, 0, bnei_else.29313
	lw	%t4, 179(%zero)
	flw	%f0, 0(%t0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	lw	%v0, 118(%t4)
	lw	%a0, 0(%v0)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%t1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.29315
	add	%a0, %zero, %zero
	j	fbgt_cont.29316
fbgt_else.29315:
	add	%a0, %zero, %k1
fbgt_cont.29316:
	beqi	%a0, 0, bnei_else.29317
	lw	%v0, 119(%t4)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	j	bnei_cont.29318
bnei_else.29317:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
bnei_cont.29318:
	addi	%a1, %zero, 116
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %t4, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29314
bnei_else.29313:
bnei_cont.29314:
	beqi	%t3, 1, bnei_else.29319
	lw	%t4, 180(%zero)
	flw	%f0, 0(%t0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	lw	%v0, 118(%t4)
	lw	%a0, 0(%v0)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%t1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.29321
	add	%a0, %zero, %zero
	j	fbgt_cont.29322
fbgt_else.29321:
	add	%a0, %zero, %k1
fbgt_cont.29322:
	beqi	%a0, 0, bnei_else.29323
	lw	%v0, 119(%t4)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	j	bnei_cont.29324
bnei_else.29323:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
bnei_cont.29324:
	addi	%a1, %zero, 116
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %t4, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29320
bnei_else.29319:
bnei_cont.29320:
	beqi	%t3, 2, bnei_else.29325
	lw	%t4, 181(%zero)
	flw	%f0, 0(%t0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	lw	%v0, 118(%t4)
	lw	%a0, 0(%v0)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%t1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.29327
	add	%a0, %zero, %zero
	j	fbgt_cont.29328
fbgt_else.29327:
	add	%a0, %zero, %k1
fbgt_cont.29328:
	beqi	%a0, 0, bnei_else.29329
	lw	%v0, 119(%t4)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	j	bnei_cont.29330
bnei_else.29329:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
bnei_cont.29330:
	addi	%a1, %zero, 116
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %t4, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29326
bnei_else.29325:
bnei_cont.29326:
	beqi	%t3, 3, bnei_else.29331
	lw	%t4, 182(%zero)
	flw	%f0, 0(%t0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	lw	%v0, 118(%t4)
	lw	%a0, 0(%v0)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%t1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.29333
	add	%a0, %zero, %zero
	j	fbgt_cont.29334
fbgt_else.29333:
	add	%a0, %zero, %k1
fbgt_cont.29334:
	beqi	%a0, 0, bnei_else.29335
	lw	%v0, 119(%t4)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	j	bnei_cont.29336
bnei_else.29335:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
bnei_cont.29336:
	addi	%a1, %zero, 116
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %t4, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29332
bnei_else.29331:
bnei_cont.29332:
	beqi	%t3, 4, bnei_else.29337
	lw	%t3, 183(%zero)
	flw	%f0, 0(%t0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t0, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	lw	%v0, 118(%t3)
	lw	%a0, 0(%v0)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%t1)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%t1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.29339
	add	%a0, %zero, %zero
	j	fbgt_cont.29340
fbgt_else.29339:
	add	%a0, %zero, %k1
fbgt_cont.29340:
	beqi	%a0, 0, bnei_else.29341
	lw	%v0, 119(%t3)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	j	bnei_cont.29342
bnei_else.29341:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
bnei_cont.29342:
	addi	%a1, %zero, 116
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29338
bnei_else.29337:
bnei_cont.29338:
	lw	%a0, 0(%sp)
	add	%at, %t2, %a0
	lw	%a0, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	lw	%t4, 1(%sp)
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	fsw	%f0, 153(%zero)
	jr	%ra
calc_diffuse_using_5points.3008:
	add	%at, %v1, %v0
	lw	%a3, 0(%at)
	lw	%s2, 5(%a3)
	addi	%a3, %v0, -1
	add	%at, %a0, %a3
	lw	%a3, 0(%at)
	lw	%s1, 5(%a3)
	add	%at, %a0, %v0
	lw	%s0, 0(%at)
	lw	%k0, 5(%s0)
	addi	%a3, %v0, 1
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%a3, 5(%a0)
	add	%at, %a1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 5(%a0)
	add	%at, %s2, %a2
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	add	%at, %s1, %a2
	lw	%a0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %k0, %a2
	lw	%a0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %a3, %a2
	lw	%a0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %a1, %a2
	lw	%a0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	lw	%a0, 4(%s0)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	jr	%ra
do_without_neighbors.3014:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t2, 2(%sp)
	sw	%t1, 3(%sp)
	sw	%t0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.29484
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.29485
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.29486
	lw	%a3, 5(%v0)
	lw	%a2, 7(%v0)
	lw	%a1, 1(%v0)
	lw	%a0, 4(%v0)
	sw	%a0, 6(%sp)
	add	%at, %a3, %v1
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%v0)
	lw	%t1, 0(%a0)
	add	%at, %a2, %v1
	lw	%t0, 0(%at)
	add	%at, %a1, %v1
	lw	%t2, 0(%at)
	beqi	%t1, 0, bnei_else.29488
	lw	%k0, 179(%zero)
	flw	%f0, 0(%t2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t2)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t2, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29489
bnei_else.29488:
bnei_cont.29489:
	beqi	%t1, 1, bnei_else.29490
	lw	%k0, 180(%zero)
	flw	%f0, 0(%t2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t2)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t2, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29491
bnei_else.29490:
bnei_cont.29491:
	beqi	%t1, 2, bnei_else.29492
	lw	%k0, 181(%zero)
	flw	%f0, 0(%t2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t2)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t2, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29493
bnei_else.29492:
bnei_cont.29493:
	beqi	%t1, 3, bnei_else.29494
	lw	%k0, 182(%zero)
	flw	%f0, 0(%t2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t2)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t2, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29495
bnei_else.29494:
bnei_cont.29495:
	beqi	%t1, 4, bnei_else.29496
	lw	%k0, 183(%zero)
	flw	%f0, 0(%t2)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t2)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t2)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t2, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118
	addi	%a0, %t2, 0
	addi	%v1, %t0, 0
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	j	bnei_cont.29497
bnei_else.29496:
bnei_cont.29497:
	lw	%a1, 6(%sp)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.29487
bnei_else.29486:
bnei_cont.29487:
	lw	%a0, 1(%sp)
	addi	%t0, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t0, bgt_else.29498
	lw	%v0, 0(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.29499
	lw	%a0, 3(%v0)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.29500
	addi	%v1, %t0, 0
	addi	%sp, %sp, 7
	jal	calc_diffuse_using_1point.3005
	addi	%sp, %sp, -7
	j	bnei_cont.29501
bnei_else.29500:
bnei_cont.29501:
	addi	%v1, %t0, 1
	lw	%t2, 2(%sp)
	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3014
bgti_else.29499:
	lw	%t2, 2(%sp)
	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bgt_else.29498:
	lw	%t2, 2(%sp)
	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	jr	%ra
bgti_else.29485:
	jr	%ra
bgt_else.29484:
	jr	%ra
try_exploit_neighbors.3030:
	add	%s3, %zero, %v1
	add	%v1, %zero, %a0
	add	%s4, %zero, %a1
	add	%s5, %zero, %a2
	sw	%a3, 0(%sp)
	sw	%ra, 1(%sp)
	add	%at, %s4, %v0
	lw	%a1, 0(%at)
	sw	%a1, 2(%sp)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.29672
	lw	%a0, 2(%a1)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.29673
	lw	%a0, 2(%a1)
	add	%at, %a0, %a3
	lw	%a1, 0(%at)
	add	%at, %v1, %v0
	lw	%k0, 0(%at)
	lw	%a0, 2(%k0)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	bne	%a0, %a1, beq_else.29674
	add	%at, %s5, %v0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	bne	%a0, %a1, beq_else.29676
	addi	%a0, %v0, -1
	add	%at, %s4, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	bne	%a0, %a1, beq_else.29678
	addi	%a0, %v0, 1
	add	%at, %s4, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	bne	%a0, %a1, beq_else.29680
	add	%a0, %zero, %k1
	j	beq_cont.29675
beq_else.29680:
	add	%a0, %zero, %zero
beq_cont.29681:
	j	beq_cont.29675
beq_else.29678:
	add	%a0, %zero, %zero
beq_cont.29679:
	j	beq_cont.29675
beq_else.29676:
	add	%a0, %zero, %zero
beq_cont.29677:
	j	beq_cont.29675
beq_else.29674:
	add	%a0, %zero, %zero
beq_cont.29675:
	beqi	%a0, 0, bnei_else.29682
	lw	%s0, 2(%sp)
	lw	%a0, 3(%s0)
	lw	%ra, 0(%sp)
	add	%at, %a0, %ra
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.29683
	lw	%s2, 5(%k0)
	addi	%a0, %v0, -1
	add	%at, %s4, %a0
	lw	%a0, 0(%at)
	lw	%s1, 5(%a0)
	lw	%a3, 5(%s0)
	addi	%a0, %v0, 1
	add	%at, %s4, %a0
	lw	%a0, 0(%at)
	lw	%a2, 5(%a0)
	add	%at, %s5, %v0
	lw	%a0, 0(%at)
	lw	%a1, 5(%a0)
	add	%at, %s2, %ra
	lw	%a0, 0(%at)
	flw	%f0, 0(%a0)
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 150(%zero)
	add	%at, %s1, %ra
	lw	%a0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %a3, %ra
	lw	%a0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %a2, %ra
	lw	%a0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	add	%at, %a1, %ra
	lw	%a0, 0(%at)
	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 148(%zero)
	flw	%f1, 149(%zero)
	flw	%f0, 1(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 149(%zero)
	flw	%f1, 150(%zero)
	flw	%f0, 2(%a0)
	fadd	%f0, %f1, %f0
	fsw	%f0, 150(%zero)
	lw	%a0, 4(%s0)
	add	%at, %a0, %ra
	lw	%a0, 0(%at)
	flw	%f16, 151(%zero)
	flw	%f1, 0(%a0)
	flw	%f0, 148(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 151(%zero)
	flw	%f16, 152(%zero)
	flw	%f1, 1(%a0)
	flw	%f0, 149(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 152(%zero)
	flw	%f16, 153(%zero)
	flw	%f1, 2(%a0)
	flw	%f0, 150(%zero)
	fmul	%f0, %f1, %f0
	fadd	%f0, %f16, %f0
	fsw	%f0, 153(%zero)
	j	bnei_cont.29684
bnei_else.29683:
bnei_cont.29684:
	lw	%a0, 0(%sp)
	addi	%a2, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %a2, bgt_else.29685
	lw	%a1, 2(%sp)
	lw	%a0, 2(%a1)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.29686
	lw	%a0, 2(%a1)
	add	%at, %a0, %a2
	lw	%a1, 0(%at)
	lw	%a0, 2(%k0)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	bne	%a0, %a1, beq_else.29687
	add	%at, %s5, %v0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	bne	%a0, %a1, beq_else.29689
	addi	%a0, %v0, -1
	add	%at, %s4, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	bne	%a0, %a1, beq_else.29691
	addi	%a0, %v0, 1
	add	%at, %s4, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	bne	%a0, %a1, beq_else.29693
	add	%a0, %zero, %k1
	j	beq_cont.29688
beq_else.29693:
	add	%a0, %zero, %zero
beq_cont.29694:
	j	beq_cont.29688
beq_else.29691:
	add	%a0, %zero, %zero
beq_cont.29692:
	j	beq_cont.29688
beq_else.29689:
	add	%a0, %zero, %zero
beq_cont.29690:
	j	beq_cont.29688
beq_else.29687:
	add	%a0, %zero, %zero
beq_cont.29688:
	beqi	%a0, 0, bnei_else.29695
	lw	%a0, 2(%sp)
	lw	%a0, 3(%a0)
	add	%at, %a0, %a2
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.29696
	addi	%a1, %s5, 0
	addi	%a0, %s4, 0
	addi	%sp, %sp, 3
	jal	calc_diffuse_using_5points.3008
	addi	%sp, %sp, -3
	j	bnei_cont.29697
bnei_else.29696:
bnei_cont.29697:
	addi	%a3, %a2, 1
	lw	%ra, 1(%sp)
	addi	%a2, %s5, 0
	addi	%a1, %s4, 0
	addi	%a0, %v1, 0
	addi	%v1, %s3, 0
	j	try_exploit_neighbors.3030
bnei_else.29695:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %a2, 0
	j	do_without_neighbors.3014
bgti_else.29686:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.29685:
	lw	%ra, 1(%sp)
	jr	%ra
bnei_else.29682:
	lw	%v1, 0(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.29700
	lw	%v0, 2(%sp)
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.29701
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.29702
	addi	%sp, %sp, 3
	jal	calc_diffuse_using_1point.3005
	addi	%sp, %sp, -3
	j	bnei_cont.29703
bnei_else.29702:
bnei_cont.29703:
	lw	%a0, 0(%sp)
	addi	%v1, %a0, 1
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	j	do_without_neighbors.3014
bgti_else.29701:
	lw	%ra, 1(%sp)
	jr	%ra
bgt_else.29700:
	lw	%ra, 1(%sp)
	jr	%ra
bgti_else.29673:
	jr	%ra
bgt_else.29672:
	jr	%ra
write_ppm_header.3037:
	add	%a1, %zero, %ra
	addi	%v0, %zero, 80
	jal	min_caml_print_char
	addi	%v0, %zero, 51
	jal	min_caml_print_char
	addi	%a2, %zero, 10
	addi	%v0, %a2, 0
	jal	min_caml_print_char
	lw	%k0, 154(%zero)
	blti	%k0, 10, bgti_else.30442
	blti	%k0, 20, bgti_else.30444
	blti	%k0, 30, bgti_else.30446
	blti	%k0, 40, bgti_else.30448
	addi	%a0, %k0, -40
	blti	%a0, 10, bgti_else.30450
	blti	%a0, 20, bgti_else.30452
	blti	%a0, 30, bgti_else.30454
	blti	%a0, 40, bgti_else.30456
	addi	%v0, %a0, -40
	addi	%v1, %zero, 8
	jal	print_int_sub1.2641
	addi	%a3, %v0, 0
	j	bgti_cont.30443
bgti_else.30456:
	addi	%a3, %zero, 7
bgti_cont.30457:
	j	bgti_cont.30443
bgti_else.30454:
	addi	%a3, %zero, 6
bgti_cont.30455:
	j	bgti_cont.30443
bgti_else.30452:
	addi	%a3, %zero, 5
bgti_cont.30453:
	j	bgti_cont.30443
bgti_else.30450:
	addi	%a3, %zero, 4
bgti_cont.30451:
	j	bgti_cont.30443
bgti_else.30448:
	addi	%a3, %zero, 3
bgti_cont.30449:
	j	bgti_cont.30443
bgti_else.30446:
	addi	%a3, %zero, 2
bgti_cont.30447:
	j	bgti_cont.30443
bgti_else.30444:
	add	%a3, %zero, %k1
bgti_cont.30445:
	j	bgti_cont.30443
bgti_else.30442:
	add	%a3, %zero, %zero
bgti_cont.30443:
	blti	%k0, 10, bgti_else.30458
	blti	%k0, 20, bgti_else.30460
	blti	%k0, 30, bgti_else.30462
	blti	%k0, 40, bgti_else.30464
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30459
	blti	%k0, 20, bgti_else.30468
	blti	%k0, 30, bgti_else.30470
	blti	%k0, 40, bgti_else.30472
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30459
	blti	%k0, 20, bgti_else.30476
	blti	%k0, 30, bgti_else.30478
	blti	%k0, 40, bgti_else.30480
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30459
	blti	%k0, 20, bgti_else.30484
	blti	%k0, 30, bgti_else.30486
	blti	%k0, 40, bgti_else.30488
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30459
	blti	%k0, 20, bgti_else.30492
	blti	%k0, 30, bgti_else.30494
	blti	%k0, 40, bgti_else.30496
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30459
	blti	%k0, 20, bgti_else.30500
	blti	%k0, 30, bgti_else.30502
	blti	%k0, 40, bgti_else.30504
	addi	%v0, %k0, -40
	jal	print_int_sub2.2644
	addi	%k0, %v0, 0
	j	bgti_cont.30459
bgti_else.30504:
	addi	%k0, %k0, -30
bgti_cont.30505:
	j	bgti_cont.30459
bgti_else.30502:
	addi	%k0, %k0, -20
bgti_cont.30503:
	j	bgti_cont.30459
bgti_else.30500:
	addi	%k0, %k0, -10
bgti_cont.30501:
	j	bgti_cont.30459
bgti_else.30498:
bgti_cont.30499:
	j	bgti_cont.30459
bgti_else.30496:
	addi	%k0, %k0, -30
bgti_cont.30497:
	j	bgti_cont.30459
bgti_else.30494:
	addi	%k0, %k0, -20
bgti_cont.30495:
	j	bgti_cont.30459
bgti_else.30492:
	addi	%k0, %k0, -10
bgti_cont.30493:
	j	bgti_cont.30459
bgti_else.30490:
bgti_cont.30491:
	j	bgti_cont.30459
bgti_else.30488:
	addi	%k0, %k0, -30
bgti_cont.30489:
	j	bgti_cont.30459
bgti_else.30486:
	addi	%k0, %k0, -20
bgti_cont.30487:
	j	bgti_cont.30459
bgti_else.30484:
	addi	%k0, %k0, -10
bgti_cont.30485:
	j	bgti_cont.30459
bgti_else.30482:
bgti_cont.30483:
	j	bgti_cont.30459
bgti_else.30480:
	addi	%k0, %k0, -30
bgti_cont.30481:
	j	bgti_cont.30459
bgti_else.30478:
	addi	%k0, %k0, -20
bgti_cont.30479:
	j	bgti_cont.30459
bgti_else.30476:
	addi	%k0, %k0, -10
bgti_cont.30477:
	j	bgti_cont.30459
bgti_else.30474:
bgti_cont.30475:
	j	bgti_cont.30459
bgti_else.30472:
	addi	%k0, %k0, -30
bgti_cont.30473:
	j	bgti_cont.30459
bgti_else.30470:
	addi	%k0, %k0, -20
bgti_cont.30471:
	j	bgti_cont.30459
bgti_else.30468:
	addi	%k0, %k0, -10
bgti_cont.30469:
	j	bgti_cont.30459
bgti_else.30466:
bgti_cont.30467:
	j	bgti_cont.30459
bgti_else.30464:
	addi	%k0, %k0, -30
bgti_cont.30465:
	j	bgti_cont.30459
bgti_else.30462:
	addi	%k0, %k0, -20
bgti_cont.30463:
	j	bgti_cont.30459
bgti_else.30460:
	addi	%k0, %k0, -10
bgti_cont.30461:
	j	bgti_cont.30459
bgti_else.30458:
bgti_cont.30459:
	blt	%zero, %a3, bgt_else.30506
	addi	%v0, %k0, 48
	jal	min_caml_print_char
	j	bgt_cont.30507
bgt_else.30506:
	blti	%a3, 10, bgti_else.30508
	blti	%a3, 20, bgti_else.30510
	blti	%a3, 30, bgti_else.30512
	blti	%a3, 40, bgti_else.30514
	addi	%a0, %a3, -40
	blti	%a0, 10, bgti_else.30516
	blti	%a0, 20, bgti_else.30518
	blti	%a0, 30, bgti_else.30520
	blti	%a0, 40, bgti_else.30522
	addi	%v0, %a0, -40
	addi	%v1, %zero, 8
	jal	print_int_sub1.2641
	addi	%a0, %v0, 0
	j	bgti_cont.30509
bgti_else.30522:
	addi	%a0, %zero, 7
bgti_cont.30523:
	j	bgti_cont.30509
bgti_else.30520:
	addi	%a0, %zero, 6
bgti_cont.30521:
	j	bgti_cont.30509
bgti_else.30518:
	addi	%a0, %zero, 5
bgti_cont.30519:
	j	bgti_cont.30509
bgti_else.30516:
	addi	%a0, %zero, 4
bgti_cont.30517:
	j	bgti_cont.30509
bgti_else.30514:
	addi	%a0, %zero, 3
bgti_cont.30515:
	j	bgti_cont.30509
bgti_else.30512:
	addi	%a0, %zero, 2
bgti_cont.30513:
	j	bgti_cont.30509
bgti_else.30510:
	add	%a0, %zero, %k1
bgti_cont.30511:
	j	bgti_cont.30509
bgti_else.30508:
	add	%a0, %zero, %zero
bgti_cont.30509:
	blti	%a3, 10, bgti_else.30524
	blti	%a3, 20, bgti_else.30526
	blti	%a3, 30, bgti_else.30528
	blti	%a3, 40, bgti_else.30530
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.30525
	blti	%a3, 20, bgti_else.30534
	blti	%a3, 30, bgti_else.30536
	blti	%a3, 40, bgti_else.30538
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.30525
	blti	%a3, 20, bgti_else.30542
	blti	%a3, 30, bgti_else.30544
	blti	%a3, 40, bgti_else.30546
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.30525
	blti	%a3, 20, bgti_else.30550
	blti	%a3, 30, bgti_else.30552
	blti	%a3, 40, bgti_else.30554
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.30525
	blti	%a3, 20, bgti_else.30558
	blti	%a3, 30, bgti_else.30560
	blti	%a3, 40, bgti_else.30562
	addi	%a3, %a3, -40
	blti	%a3, 10, bgti_cont.30525
	blti	%a3, 20, bgti_else.30566
	blti	%a3, 30, bgti_else.30568
	blti	%a3, 40, bgti_else.30570
	addi	%v0, %a3, -40
	jal	print_int_sub2.2644
	addi	%a3, %v0, 0
	j	bgti_cont.30525
bgti_else.30570:
	addi	%a3, %a3, -30
bgti_cont.30571:
	j	bgti_cont.30525
bgti_else.30568:
	addi	%a3, %a3, -20
bgti_cont.30569:
	j	bgti_cont.30525
bgti_else.30566:
	addi	%a3, %a3, -10
bgti_cont.30567:
	j	bgti_cont.30525
bgti_else.30564:
bgti_cont.30565:
	j	bgti_cont.30525
bgti_else.30562:
	addi	%a3, %a3, -30
bgti_cont.30563:
	j	bgti_cont.30525
bgti_else.30560:
	addi	%a3, %a3, -20
bgti_cont.30561:
	j	bgti_cont.30525
bgti_else.30558:
	addi	%a3, %a3, -10
bgti_cont.30559:
	j	bgti_cont.30525
bgti_else.30556:
bgti_cont.30557:
	j	bgti_cont.30525
bgti_else.30554:
	addi	%a3, %a3, -30
bgti_cont.30555:
	j	bgti_cont.30525
bgti_else.30552:
	addi	%a3, %a3, -20
bgti_cont.30553:
	j	bgti_cont.30525
bgti_else.30550:
	addi	%a3, %a3, -10
bgti_cont.30551:
	j	bgti_cont.30525
bgti_else.30548:
bgti_cont.30549:
	j	bgti_cont.30525
bgti_else.30546:
	addi	%a3, %a3, -30
bgti_cont.30547:
	j	bgti_cont.30525
bgti_else.30544:
	addi	%a3, %a3, -20
bgti_cont.30545:
	j	bgti_cont.30525
bgti_else.30542:
	addi	%a3, %a3, -10
bgti_cont.30543:
	j	bgti_cont.30525
bgti_else.30540:
bgti_cont.30541:
	j	bgti_cont.30525
bgti_else.30538:
	addi	%a3, %a3, -30
bgti_cont.30539:
	j	bgti_cont.30525
bgti_else.30536:
	addi	%a3, %a3, -20
bgti_cont.30537:
	j	bgti_cont.30525
bgti_else.30534:
	addi	%a3, %a3, -10
bgti_cont.30535:
	j	bgti_cont.30525
bgti_else.30532:
bgti_cont.30533:
	j	bgti_cont.30525
bgti_else.30530:
	addi	%a3, %a3, -30
bgti_cont.30531:
	j	bgti_cont.30525
bgti_else.30528:
	addi	%a3, %a3, -20
bgti_cont.30529:
	j	bgti_cont.30525
bgti_else.30526:
	addi	%a3, %a3, -10
bgti_cont.30527:
	j	bgti_cont.30525
bgti_else.30524:
bgti_cont.30525:
	blt	%zero, %a0, bgt_else.30572
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%v0, %k0, 48
	jal	min_caml_print_char
	j	bgt_cont.30573
bgt_else.30572:
	blti	%a0, 10, bgti_else.30574
	blti	%a0, 20, bgti_else.30576
	blti	%a0, 30, bgti_else.30578
	blti	%a0, 40, bgti_else.30580
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30575
	blti	%a0, 20, bgti_else.30584
	blti	%a0, 30, bgti_else.30586
	blti	%a0, 40, bgti_else.30588
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30575
	blti	%a0, 20, bgti_else.30592
	blti	%a0, 30, bgti_else.30594
	blti	%a0, 40, bgti_else.30596
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30575
	blti	%a0, 20, bgti_else.30600
	blti	%a0, 30, bgti_else.30602
	blti	%a0, 40, bgti_else.30604
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30575
	blti	%a0, 20, bgti_else.30608
	blti	%a0, 30, bgti_else.30610
	blti	%a0, 40, bgti_else.30612
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30575
	blti	%a0, 20, bgti_else.30616
	blti	%a0, 30, bgti_else.30618
	blti	%a0, 40, bgti_else.30620
	addi	%v0, %a0, -40
	jal	print_int_sub2.2644
	addi	%a0, %v0, 0
	j	bgti_cont.30575
bgti_else.30620:
	addi	%a0, %a0, -30
bgti_cont.30621:
	j	bgti_cont.30575
bgti_else.30618:
	addi	%a0, %a0, -20
bgti_cont.30619:
	j	bgti_cont.30575
bgti_else.30616:
	addi	%a0, %a0, -10
bgti_cont.30617:
	j	bgti_cont.30575
bgti_else.30614:
bgti_cont.30615:
	j	bgti_cont.30575
bgti_else.30612:
	addi	%a0, %a0, -30
bgti_cont.30613:
	j	bgti_cont.30575
bgti_else.30610:
	addi	%a0, %a0, -20
bgti_cont.30611:
	j	bgti_cont.30575
bgti_else.30608:
	addi	%a0, %a0, -10
bgti_cont.30609:
	j	bgti_cont.30575
bgti_else.30606:
bgti_cont.30607:
	j	bgti_cont.30575
bgti_else.30604:
	addi	%a0, %a0, -30
bgti_cont.30605:
	j	bgti_cont.30575
bgti_else.30602:
	addi	%a0, %a0, -20
bgti_cont.30603:
	j	bgti_cont.30575
bgti_else.30600:
	addi	%a0, %a0, -10
bgti_cont.30601:
	j	bgti_cont.30575
bgti_else.30598:
bgti_cont.30599:
	j	bgti_cont.30575
bgti_else.30596:
	addi	%a0, %a0, -30
bgti_cont.30597:
	j	bgti_cont.30575
bgti_else.30594:
	addi	%a0, %a0, -20
bgti_cont.30595:
	j	bgti_cont.30575
bgti_else.30592:
	addi	%a0, %a0, -10
bgti_cont.30593:
	j	bgti_cont.30575
bgti_else.30590:
bgti_cont.30591:
	j	bgti_cont.30575
bgti_else.30588:
	addi	%a0, %a0, -30
bgti_cont.30589:
	j	bgti_cont.30575
bgti_else.30586:
	addi	%a0, %a0, -20
bgti_cont.30587:
	j	bgti_cont.30575
bgti_else.30584:
	addi	%a0, %a0, -10
bgti_cont.30585:
	j	bgti_cont.30575
bgti_else.30582:
bgti_cont.30583:
	j	bgti_cont.30575
bgti_else.30580:
	addi	%a0, %a0, -30
bgti_cont.30581:
	j	bgti_cont.30575
bgti_else.30578:
	addi	%a0, %a0, -20
bgti_cont.30579:
	j	bgti_cont.30575
bgti_else.30576:
	addi	%a0, %a0, -10
bgti_cont.30577:
	j	bgti_cont.30575
bgti_else.30574:
bgti_cont.30575:
	addi	%v0, %a0, 48
	jal	min_caml_print_char
	addi	%v0, %a3, 48
	jal	min_caml_print_char
	addi	%v0, %k0, 48
	jal	min_caml_print_char
bgt_cont.30573:
bgt_cont.30507:
	addi	%a3, %zero, 32
	addi	%v0, %a3, 0
	jal	min_caml_print_char
	lw	%s0, 155(%zero)
	blti	%s0, 10, bgti_else.30622
	blti	%s0, 20, bgti_else.30624
	blti	%s0, 30, bgti_else.30626
	blti	%s0, 40, bgti_else.30628
	addi	%a0, %s0, -40
	blti	%a0, 10, bgti_else.30630
	blti	%a0, 20, bgti_else.30632
	blti	%a0, 30, bgti_else.30634
	blti	%a0, 40, bgti_else.30636
	addi	%v0, %a0, -40
	addi	%v1, %zero, 8
	jal	print_int_sub1.2641
	addi	%k0, %v0, 0
	j	bgti_cont.30623
bgti_else.30636:
	addi	%k0, %zero, 7
bgti_cont.30637:
	j	bgti_cont.30623
bgti_else.30634:
	addi	%k0, %zero, 6
bgti_cont.30635:
	j	bgti_cont.30623
bgti_else.30632:
	addi	%k0, %zero, 5
bgti_cont.30633:
	j	bgti_cont.30623
bgti_else.30630:
	addi	%k0, %zero, 4
bgti_cont.30631:
	j	bgti_cont.30623
bgti_else.30628:
	addi	%k0, %zero, 3
bgti_cont.30629:
	j	bgti_cont.30623
bgti_else.30626:
	addi	%k0, %zero, 2
bgti_cont.30627:
	j	bgti_cont.30623
bgti_else.30624:
	add	%k0, %zero, %k1
bgti_cont.30625:
	j	bgti_cont.30623
bgti_else.30622:
	add	%k0, %zero, %zero
bgti_cont.30623:
	blti	%s0, 10, bgti_else.30638
	blti	%s0, 20, bgti_else.30640
	blti	%s0, 30, bgti_else.30642
	blti	%s0, 40, bgti_else.30644
	addi	%s0, %s0, -40
	blti	%s0, 10, bgti_cont.30639
	blti	%s0, 20, bgti_else.30648
	blti	%s0, 30, bgti_else.30650
	blti	%s0, 40, bgti_else.30652
	addi	%s0, %s0, -40
	blti	%s0, 10, bgti_cont.30639
	blti	%s0, 20, bgti_else.30656
	blti	%s0, 30, bgti_else.30658
	blti	%s0, 40, bgti_else.30660
	addi	%s0, %s0, -40
	blti	%s0, 10, bgti_cont.30639
	blti	%s0, 20, bgti_else.30664
	blti	%s0, 30, bgti_else.30666
	blti	%s0, 40, bgti_else.30668
	addi	%s0, %s0, -40
	blti	%s0, 10, bgti_cont.30639
	blti	%s0, 20, bgti_else.30672
	blti	%s0, 30, bgti_else.30674
	blti	%s0, 40, bgti_else.30676
	addi	%s0, %s0, -40
	blti	%s0, 10, bgti_cont.30639
	blti	%s0, 20, bgti_else.30680
	blti	%s0, 30, bgti_else.30682
	blti	%s0, 40, bgti_else.30684
	addi	%v0, %s0, -40
	jal	print_int_sub2.2644
	addi	%s0, %v0, 0
	j	bgti_cont.30639
bgti_else.30684:
	addi	%s0, %s0, -30
bgti_cont.30685:
	j	bgti_cont.30639
bgti_else.30682:
	addi	%s0, %s0, -20
bgti_cont.30683:
	j	bgti_cont.30639
bgti_else.30680:
	addi	%s0, %s0, -10
bgti_cont.30681:
	j	bgti_cont.30639
bgti_else.30678:
bgti_cont.30679:
	j	bgti_cont.30639
bgti_else.30676:
	addi	%s0, %s0, -30
bgti_cont.30677:
	j	bgti_cont.30639
bgti_else.30674:
	addi	%s0, %s0, -20
bgti_cont.30675:
	j	bgti_cont.30639
bgti_else.30672:
	addi	%s0, %s0, -10
bgti_cont.30673:
	j	bgti_cont.30639
bgti_else.30670:
bgti_cont.30671:
	j	bgti_cont.30639
bgti_else.30668:
	addi	%s0, %s0, -30
bgti_cont.30669:
	j	bgti_cont.30639
bgti_else.30666:
	addi	%s0, %s0, -20
bgti_cont.30667:
	j	bgti_cont.30639
bgti_else.30664:
	addi	%s0, %s0, -10
bgti_cont.30665:
	j	bgti_cont.30639
bgti_else.30662:
bgti_cont.30663:
	j	bgti_cont.30639
bgti_else.30660:
	addi	%s0, %s0, -30
bgti_cont.30661:
	j	bgti_cont.30639
bgti_else.30658:
	addi	%s0, %s0, -20
bgti_cont.30659:
	j	bgti_cont.30639
bgti_else.30656:
	addi	%s0, %s0, -10
bgti_cont.30657:
	j	bgti_cont.30639
bgti_else.30654:
bgti_cont.30655:
	j	bgti_cont.30639
bgti_else.30652:
	addi	%s0, %s0, -30
bgti_cont.30653:
	j	bgti_cont.30639
bgti_else.30650:
	addi	%s0, %s0, -20
bgti_cont.30651:
	j	bgti_cont.30639
bgti_else.30648:
	addi	%s0, %s0, -10
bgti_cont.30649:
	j	bgti_cont.30639
bgti_else.30646:
bgti_cont.30647:
	j	bgti_cont.30639
bgti_else.30644:
	addi	%s0, %s0, -30
bgti_cont.30645:
	j	bgti_cont.30639
bgti_else.30642:
	addi	%s0, %s0, -20
bgti_cont.30643:
	j	bgti_cont.30639
bgti_else.30640:
	addi	%s0, %s0, -10
bgti_cont.30641:
	j	bgti_cont.30639
bgti_else.30638:
bgti_cont.30639:
	blt	%zero, %k0, bgt_else.30686
	addi	%v0, %s0, 48
	jal	min_caml_print_char
	j	bgt_cont.30687
bgt_else.30686:
	blti	%k0, 10, bgti_else.30688
	blti	%k0, 20, bgti_else.30690
	blti	%k0, 30, bgti_else.30692
	blti	%k0, 40, bgti_else.30694
	addi	%a0, %k0, -40
	blti	%a0, 10, bgti_else.30696
	blti	%a0, 20, bgti_else.30698
	blti	%a0, 30, bgti_else.30700
	blti	%a0, 40, bgti_else.30702
	addi	%v0, %a0, -40
	addi	%v1, %zero, 8
	jal	print_int_sub1.2641
	addi	%a0, %v0, 0
	j	bgti_cont.30689
bgti_else.30702:
	addi	%a0, %zero, 7
bgti_cont.30703:
	j	bgti_cont.30689
bgti_else.30700:
	addi	%a0, %zero, 6
bgti_cont.30701:
	j	bgti_cont.30689
bgti_else.30698:
	addi	%a0, %zero, 5
bgti_cont.30699:
	j	bgti_cont.30689
bgti_else.30696:
	addi	%a0, %zero, 4
bgti_cont.30697:
	j	bgti_cont.30689
bgti_else.30694:
	addi	%a0, %zero, 3
bgti_cont.30695:
	j	bgti_cont.30689
bgti_else.30692:
	addi	%a0, %zero, 2
bgti_cont.30693:
	j	bgti_cont.30689
bgti_else.30690:
	add	%a0, %zero, %k1
bgti_cont.30691:
	j	bgti_cont.30689
bgti_else.30688:
	add	%a0, %zero, %zero
bgti_cont.30689:
	blti	%k0, 10, bgti_else.30704
	blti	%k0, 20, bgti_else.30706
	blti	%k0, 30, bgti_else.30708
	blti	%k0, 40, bgti_else.30710
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30705
	blti	%k0, 20, bgti_else.30714
	blti	%k0, 30, bgti_else.30716
	blti	%k0, 40, bgti_else.30718
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30705
	blti	%k0, 20, bgti_else.30722
	blti	%k0, 30, bgti_else.30724
	blti	%k0, 40, bgti_else.30726
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30705
	blti	%k0, 20, bgti_else.30730
	blti	%k0, 30, bgti_else.30732
	blti	%k0, 40, bgti_else.30734
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30705
	blti	%k0, 20, bgti_else.30738
	blti	%k0, 30, bgti_else.30740
	blti	%k0, 40, bgti_else.30742
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30705
	blti	%k0, 20, bgti_else.30746
	blti	%k0, 30, bgti_else.30748
	blti	%k0, 40, bgti_else.30750
	addi	%v0, %k0, -40
	jal	print_int_sub2.2644
	addi	%k0, %v0, 0
	j	bgti_cont.30705
bgti_else.30750:
	addi	%k0, %k0, -30
bgti_cont.30751:
	j	bgti_cont.30705
bgti_else.30748:
	addi	%k0, %k0, -20
bgti_cont.30749:
	j	bgti_cont.30705
bgti_else.30746:
	addi	%k0, %k0, -10
bgti_cont.30747:
	j	bgti_cont.30705
bgti_else.30744:
bgti_cont.30745:
	j	bgti_cont.30705
bgti_else.30742:
	addi	%k0, %k0, -30
bgti_cont.30743:
	j	bgti_cont.30705
bgti_else.30740:
	addi	%k0, %k0, -20
bgti_cont.30741:
	j	bgti_cont.30705
bgti_else.30738:
	addi	%k0, %k0, -10
bgti_cont.30739:
	j	bgti_cont.30705
bgti_else.30736:
bgti_cont.30737:
	j	bgti_cont.30705
bgti_else.30734:
	addi	%k0, %k0, -30
bgti_cont.30735:
	j	bgti_cont.30705
bgti_else.30732:
	addi	%k0, %k0, -20
bgti_cont.30733:
	j	bgti_cont.30705
bgti_else.30730:
	addi	%k0, %k0, -10
bgti_cont.30731:
	j	bgti_cont.30705
bgti_else.30728:
bgti_cont.30729:
	j	bgti_cont.30705
bgti_else.30726:
	addi	%k0, %k0, -30
bgti_cont.30727:
	j	bgti_cont.30705
bgti_else.30724:
	addi	%k0, %k0, -20
bgti_cont.30725:
	j	bgti_cont.30705
bgti_else.30722:
	addi	%k0, %k0, -10
bgti_cont.30723:
	j	bgti_cont.30705
bgti_else.30720:
bgti_cont.30721:
	j	bgti_cont.30705
bgti_else.30718:
	addi	%k0, %k0, -30
bgti_cont.30719:
	j	bgti_cont.30705
bgti_else.30716:
	addi	%k0, %k0, -20
bgti_cont.30717:
	j	bgti_cont.30705
bgti_else.30714:
	addi	%k0, %k0, -10
bgti_cont.30715:
	j	bgti_cont.30705
bgti_else.30712:
bgti_cont.30713:
	j	bgti_cont.30705
bgti_else.30710:
	addi	%k0, %k0, -30
bgti_cont.30711:
	j	bgti_cont.30705
bgti_else.30708:
	addi	%k0, %k0, -20
bgti_cont.30709:
	j	bgti_cont.30705
bgti_else.30706:
	addi	%k0, %k0, -10
bgti_cont.30707:
	j	bgti_cont.30705
bgti_else.30704:
bgti_cont.30705:
	blt	%zero, %a0, bgt_else.30752
	addi	%v0, %k0, 48
	jal	min_caml_print_char
	addi	%v0, %s0, 48
	jal	min_caml_print_char
	j	bgt_cont.30753
bgt_else.30752:
	blti	%a0, 10, bgti_else.30754
	blti	%a0, 20, bgti_else.30756
	blti	%a0, 30, bgti_else.30758
	blti	%a0, 40, bgti_else.30760
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30755
	blti	%a0, 20, bgti_else.30764
	blti	%a0, 30, bgti_else.30766
	blti	%a0, 40, bgti_else.30768
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30755
	blti	%a0, 20, bgti_else.30772
	blti	%a0, 30, bgti_else.30774
	blti	%a0, 40, bgti_else.30776
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30755
	blti	%a0, 20, bgti_else.30780
	blti	%a0, 30, bgti_else.30782
	blti	%a0, 40, bgti_else.30784
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30755
	blti	%a0, 20, bgti_else.30788
	blti	%a0, 30, bgti_else.30790
	blti	%a0, 40, bgti_else.30792
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30755
	blti	%a0, 20, bgti_else.30796
	blti	%a0, 30, bgti_else.30798
	blti	%a0, 40, bgti_else.30800
	addi	%v0, %a0, -40
	jal	print_int_sub2.2644
	addi	%a0, %v0, 0
	j	bgti_cont.30755
bgti_else.30800:
	addi	%a0, %a0, -30
bgti_cont.30801:
	j	bgti_cont.30755
bgti_else.30798:
	addi	%a0, %a0, -20
bgti_cont.30799:
	j	bgti_cont.30755
bgti_else.30796:
	addi	%a0, %a0, -10
bgti_cont.30797:
	j	bgti_cont.30755
bgti_else.30794:
bgti_cont.30795:
	j	bgti_cont.30755
bgti_else.30792:
	addi	%a0, %a0, -30
bgti_cont.30793:
	j	bgti_cont.30755
bgti_else.30790:
	addi	%a0, %a0, -20
bgti_cont.30791:
	j	bgti_cont.30755
bgti_else.30788:
	addi	%a0, %a0, -10
bgti_cont.30789:
	j	bgti_cont.30755
bgti_else.30786:
bgti_cont.30787:
	j	bgti_cont.30755
bgti_else.30784:
	addi	%a0, %a0, -30
bgti_cont.30785:
	j	bgti_cont.30755
bgti_else.30782:
	addi	%a0, %a0, -20
bgti_cont.30783:
	j	bgti_cont.30755
bgti_else.30780:
	addi	%a0, %a0, -10
bgti_cont.30781:
	j	bgti_cont.30755
bgti_else.30778:
bgti_cont.30779:
	j	bgti_cont.30755
bgti_else.30776:
	addi	%a0, %a0, -30
bgti_cont.30777:
	j	bgti_cont.30755
bgti_else.30774:
	addi	%a0, %a0, -20
bgti_cont.30775:
	j	bgti_cont.30755
bgti_else.30772:
	addi	%a0, %a0, -10
bgti_cont.30773:
	j	bgti_cont.30755
bgti_else.30770:
bgti_cont.30771:
	j	bgti_cont.30755
bgti_else.30768:
	addi	%a0, %a0, -30
bgti_cont.30769:
	j	bgti_cont.30755
bgti_else.30766:
	addi	%a0, %a0, -20
bgti_cont.30767:
	j	bgti_cont.30755
bgti_else.30764:
	addi	%a0, %a0, -10
bgti_cont.30765:
	j	bgti_cont.30755
bgti_else.30762:
bgti_cont.30763:
	j	bgti_cont.30755
bgti_else.30760:
	addi	%a0, %a0, -30
bgti_cont.30761:
	j	bgti_cont.30755
bgti_else.30758:
	addi	%a0, %a0, -20
bgti_cont.30759:
	j	bgti_cont.30755
bgti_else.30756:
	addi	%a0, %a0, -10
bgti_cont.30757:
	j	bgti_cont.30755
bgti_else.30754:
bgti_cont.30755:
	addi	%v0, %a0, 48
	jal	min_caml_print_char
	addi	%v0, %k0, 48
	jal	min_caml_print_char
	addi	%v0, %s0, 48
	jal	min_caml_print_char
bgt_cont.30753:
bgt_cont.30687:
	addi	%v0, %a3, 0
	jal	min_caml_print_char
	addi	%v0, %zero, 175
	addi	%a3, %zero, 8
	addi	%v1, %a3, 0
	jal	print_int_sub1.2641
	addi	%k0, %v0, 0
	addi	%v0, %zero, 15
	jal	print_int_sub2.2644
	addi	%s0, %v0, 0
	blt	%zero, %k0, bgt_else.30802
	addi	%v0, %s0, 48
	jal	min_caml_print_char
	j	bgt_cont.30803
bgt_else.30802:
	blti	%k0, 10, bgti_else.30804
	blti	%k0, 20, bgti_else.30806
	blti	%k0, 30, bgti_else.30808
	blti	%k0, 40, bgti_else.30810
	addi	%a0, %k0, -40
	blti	%a0, 10, bgti_else.30812
	blti	%a0, 20, bgti_else.30814
	blti	%a0, 30, bgti_else.30816
	blti	%a0, 40, bgti_else.30818
	addi	%v0, %a0, -40
	addi	%v1, %a3, 0
	jal	print_int_sub1.2641
	addi	%a0, %v0, 0
	j	bgti_cont.30805
bgti_else.30818:
	addi	%a0, %zero, 7
bgti_cont.30819:
	j	bgti_cont.30805
bgti_else.30816:
	addi	%a0, %zero, 6
bgti_cont.30817:
	j	bgti_cont.30805
bgti_else.30814:
	addi	%a0, %zero, 5
bgti_cont.30815:
	j	bgti_cont.30805
bgti_else.30812:
	addi	%a0, %zero, 4
bgti_cont.30813:
	j	bgti_cont.30805
bgti_else.30810:
	addi	%a0, %zero, 3
bgti_cont.30811:
	j	bgti_cont.30805
bgti_else.30808:
	addi	%a0, %zero, 2
bgti_cont.30809:
	j	bgti_cont.30805
bgti_else.30806:
	add	%a0, %zero, %k1
bgti_cont.30807:
	j	bgti_cont.30805
bgti_else.30804:
	add	%a0, %zero, %zero
bgti_cont.30805:
	blti	%k0, 10, bgti_else.30820
	blti	%k0, 20, bgti_else.30822
	blti	%k0, 30, bgti_else.30824
	blti	%k0, 40, bgti_else.30826
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30821
	blti	%k0, 20, bgti_else.30830
	blti	%k0, 30, bgti_else.30832
	blti	%k0, 40, bgti_else.30834
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30821
	blti	%k0, 20, bgti_else.30838
	blti	%k0, 30, bgti_else.30840
	blti	%k0, 40, bgti_else.30842
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30821
	blti	%k0, 20, bgti_else.30846
	blti	%k0, 30, bgti_else.30848
	blti	%k0, 40, bgti_else.30850
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30821
	blti	%k0, 20, bgti_else.30854
	blti	%k0, 30, bgti_else.30856
	blti	%k0, 40, bgti_else.30858
	addi	%k0, %k0, -40
	blti	%k0, 10, bgti_cont.30821
	blti	%k0, 20, bgti_else.30862
	blti	%k0, 30, bgti_else.30864
	blti	%k0, 40, bgti_else.30866
	addi	%v0, %k0, -40
	jal	print_int_sub2.2644
	addi	%k0, %v0, 0
	j	bgti_cont.30821
bgti_else.30866:
	addi	%k0, %k0, -30
bgti_cont.30867:
	j	bgti_cont.30821
bgti_else.30864:
	addi	%k0, %k0, -20
bgti_cont.30865:
	j	bgti_cont.30821
bgti_else.30862:
	addi	%k0, %k0, -10
bgti_cont.30863:
	j	bgti_cont.30821
bgti_else.30860:
bgti_cont.30861:
	j	bgti_cont.30821
bgti_else.30858:
	addi	%k0, %k0, -30
bgti_cont.30859:
	j	bgti_cont.30821
bgti_else.30856:
	addi	%k0, %k0, -20
bgti_cont.30857:
	j	bgti_cont.30821
bgti_else.30854:
	addi	%k0, %k0, -10
bgti_cont.30855:
	j	bgti_cont.30821
bgti_else.30852:
bgti_cont.30853:
	j	bgti_cont.30821
bgti_else.30850:
	addi	%k0, %k0, -30
bgti_cont.30851:
	j	bgti_cont.30821
bgti_else.30848:
	addi	%k0, %k0, -20
bgti_cont.30849:
	j	bgti_cont.30821
bgti_else.30846:
	addi	%k0, %k0, -10
bgti_cont.30847:
	j	bgti_cont.30821
bgti_else.30844:
bgti_cont.30845:
	j	bgti_cont.30821
bgti_else.30842:
	addi	%k0, %k0, -30
bgti_cont.30843:
	j	bgti_cont.30821
bgti_else.30840:
	addi	%k0, %k0, -20
bgti_cont.30841:
	j	bgti_cont.30821
bgti_else.30838:
	addi	%k0, %k0, -10
bgti_cont.30839:
	j	bgti_cont.30821
bgti_else.30836:
bgti_cont.30837:
	j	bgti_cont.30821
bgti_else.30834:
	addi	%k0, %k0, -30
bgti_cont.30835:
	j	bgti_cont.30821
bgti_else.30832:
	addi	%k0, %k0, -20
bgti_cont.30833:
	j	bgti_cont.30821
bgti_else.30830:
	addi	%k0, %k0, -10
bgti_cont.30831:
	j	bgti_cont.30821
bgti_else.30828:
bgti_cont.30829:
	j	bgti_cont.30821
bgti_else.30826:
	addi	%k0, %k0, -30
bgti_cont.30827:
	j	bgti_cont.30821
bgti_else.30824:
	addi	%k0, %k0, -20
bgti_cont.30825:
	j	bgti_cont.30821
bgti_else.30822:
	addi	%k0, %k0, -10
bgti_cont.30823:
	j	bgti_cont.30821
bgti_else.30820:
bgti_cont.30821:
	blt	%zero, %a0, bgt_else.30868
	addi	%v0, %k0, 48
	jal	min_caml_print_char
	addi	%v0, %s0, 48
	jal	min_caml_print_char
	j	bgt_cont.30869
bgt_else.30868:
	blti	%a0, 10, bgti_else.30870
	blti	%a0, 20, bgti_else.30872
	blti	%a0, 30, bgti_else.30874
	blti	%a0, 40, bgti_else.30876
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30871
	blti	%a0, 20, bgti_else.30880
	blti	%a0, 30, bgti_else.30882
	blti	%a0, 40, bgti_else.30884
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30871
	blti	%a0, 20, bgti_else.30888
	blti	%a0, 30, bgti_else.30890
	blti	%a0, 40, bgti_else.30892
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30871
	blti	%a0, 20, bgti_else.30896
	blti	%a0, 30, bgti_else.30898
	blti	%a0, 40, bgti_else.30900
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30871
	blti	%a0, 20, bgti_else.30904
	blti	%a0, 30, bgti_else.30906
	blti	%a0, 40, bgti_else.30908
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.30871
	blti	%a0, 20, bgti_else.30912
	blti	%a0, 30, bgti_else.30914
	blti	%a0, 40, bgti_else.30916
	addi	%v0, %a0, -40
	jal	print_int_sub2.2644
	addi	%a0, %v0, 0
	j	bgti_cont.30871
bgti_else.30916:
	addi	%a0, %a0, -30
bgti_cont.30917:
	j	bgti_cont.30871
bgti_else.30914:
	addi	%a0, %a0, -20
bgti_cont.30915:
	j	bgti_cont.30871
bgti_else.30912:
	addi	%a0, %a0, -10
bgti_cont.30913:
	j	bgti_cont.30871
bgti_else.30910:
bgti_cont.30911:
	j	bgti_cont.30871
bgti_else.30908:
	addi	%a0, %a0, -30
bgti_cont.30909:
	j	bgti_cont.30871
bgti_else.30906:
	addi	%a0, %a0, -20
bgti_cont.30907:
	j	bgti_cont.30871
bgti_else.30904:
	addi	%a0, %a0, -10
bgti_cont.30905:
	j	bgti_cont.30871
bgti_else.30902:
bgti_cont.30903:
	j	bgti_cont.30871
bgti_else.30900:
	addi	%a0, %a0, -30
bgti_cont.30901:
	j	bgti_cont.30871
bgti_else.30898:
	addi	%a0, %a0, -20
bgti_cont.30899:
	j	bgti_cont.30871
bgti_else.30896:
	addi	%a0, %a0, -10
bgti_cont.30897:
	j	bgti_cont.30871
bgti_else.30894:
bgti_cont.30895:
	j	bgti_cont.30871
bgti_else.30892:
	addi	%a0, %a0, -30
bgti_cont.30893:
	j	bgti_cont.30871
bgti_else.30890:
	addi	%a0, %a0, -20
bgti_cont.30891:
	j	bgti_cont.30871
bgti_else.30888:
	addi	%a0, %a0, -10
bgti_cont.30889:
	j	bgti_cont.30871
bgti_else.30886:
bgti_cont.30887:
	j	bgti_cont.30871
bgti_else.30884:
	addi	%a0, %a0, -30
bgti_cont.30885:
	j	bgti_cont.30871
bgti_else.30882:
	addi	%a0, %a0, -20
bgti_cont.30883:
	j	bgti_cont.30871
bgti_else.30880:
	addi	%a0, %a0, -10
bgti_cont.30881:
	j	bgti_cont.30871
bgti_else.30878:
bgti_cont.30879:
	j	bgti_cont.30871
bgti_else.30876:
	addi	%a0, %a0, -30
bgti_cont.30877:
	j	bgti_cont.30871
bgti_else.30874:
	addi	%a0, %a0, -20
bgti_cont.30875:
	j	bgti_cont.30871
bgti_else.30872:
	addi	%a0, %a0, -10
bgti_cont.30873:
	j	bgti_cont.30871
bgti_else.30870:
bgti_cont.30871:
	addi	%v0, %a0, 48
	jal	min_caml_print_char
	addi	%v0, %k0, 48
	jal	min_caml_print_char
	addi	%v0, %s0, 48
	jal	min_caml_print_char
bgt_cont.30869:
bgt_cont.30803:
	add	%ra, %zero, %a1
	addi	%v0, %a2, 0
	j	min_caml_print_char
pretrace_diffuse_rays.3043:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%t1, 2(%sp)
	sw	%t0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.31021
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.31022
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.31023
	lw	%a0, 6(%v0)
	lw	%a2, 0(%a0)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%a1, 7(%v0)
	lw	%a0, 1(%v0)
	lw	%s0, 179(%a2)
	add	%at, %a1, %v1
	lw	%k0, 0(%at)
	add	%at, %a0, %v1
	lw	%v0, 0(%at)
	flw	%f0, 0(%v0)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v0)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v0)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%sp, %sp, 5
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -5
	addi	%a1, %zero, 118
	addi	%a0, %v0, 0
	addi	%v1, %k0, 0
	addi	%v0, %s0, 0
	addi	%sp, %sp, 5
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -5
	lw	%a0, 0(%sp)
	lw	%a1, 5(%a0)
	lw	%a0, 1(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.31024
bnei_else.31023:
bnei_cont.31024:
	lw	%a0, 1(%sp)
	addi	%t0, %a0, 1
	addi	%at, %zero, 4
	blt	%at, %t0, bgt_else.31025
	lw	%a1, 0(%sp)
	lw	%a0, 2(%a1)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.31026
	lw	%a0, 3(%a1)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.31027
	lw	%a0, 6(%a1)
	lw	%a0, 0(%a0)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%a2, 7(%a1)
	lw	%a1, 1(%a1)
	lw	%a0, 179(%a0)
	sw	%a0, 5(%sp)
	add	%at, %a2, %t0
	lw	%a0, 0(%at)
	sw	%a0, 6(%sp)
	add	%at, %a1, %t0
	lw	%t1, 0(%at)
	flw	%f0, 0(%t1)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t1)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t1)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t1, 0
	addi	%sp, %sp, 7
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -7
	lw	%a0, 5(%sp)
	lw	%v0, 118(%a0)
	lw	%a1, 0(%v0)
	flw	%f1, 0(%a1)
	lw	%a0, 6(%sp)
	flw	%f0, 0(%a0)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.31029
	add	%a0, %zero, %zero
	j	fbgt_cont.31030
fbgt_else.31029:
	add	%a0, %zero, %k1
fbgt_cont.31030:
	beqi	%a0, 0, bnei_else.31031
	lw	%a0, 5(%sp)
	lw	%v0, 119(%a0)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
	j	bnei_cont.31032
bnei_else.31031:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 7
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -7
bnei_cont.31032:
	addi	%a1, %zero, 116
	lw	%v1, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%a0, %t1, 0
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -7
	lw	%a0, 0(%sp)
	lw	%a0, 5(%a0)
	add	%at, %a0, %t0
	lw	%a0, 0(%at)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.31028
bnei_else.31027:
bnei_cont.31028:
	addi	%v1, %t0, 1
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	j	pretrace_diffuse_rays.3043
bgti_else.31026:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgt_else.31025:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	jr	%ra
bgti_else.31022:
	jr	%ra
bgt_else.31021:
	jr	%ra
pretrace_pixels.3046:
	fsw	%f0, 0(%sp)
	fsw	%f1, 1(%sp)
	fsw	%f2, 2(%sp)
	sw	%v0, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%t3, 6(%sp)
	sw	%t2, 7(%sp)
	sw	%t1, 8(%sp)
	sw	%t0, 9(%sp)
	sw	%ra, 10(%sp)
	blti	%v1, 0, bgti_else.31132
	flw	%f17, 158(%zero)
	lw	%a0, 156(%zero)
	sub	%a0, %v1, %a0
	itof	%f16, %a0
	fmul	%f17, %f17, %f16
	flw	%f16, 165(%zero)
	fmul	%f16, %f17, %f16
	fadd	%f0, %f16, %f0
	fsw	%f0, 174(%zero)
	flw	%f0, 166(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f1
	fsw	%f0, 175(%zero)
	flw	%f0, 167(%zero)
	fmul	%f0, %f17, %f0
	fadd	%f0, %f0, %f2
	fsw	%f0, 176(%zero)
	flw	%f18, 174(%zero)
	fmul	%f1, %f18, %f18
	flw	%f17, 175(%zero)
	fmul	%f0, %f17, %f17
	fadd	%f1, %f1, %f0
	flw	%f16, 176(%zero)
	fmul	%f0, %f16, %f16
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	fbne	%f0, %fzero, fbeq_else.31133
	add	%a0, %zero, %k1
	j	fbeq_cont.31134
fbeq_else.31133:
	add	%a0, %zero, %zero
fbeq_cont.31134:
	beqi	%a0, 0, bnei_else.31135
	fmov	%f0, %f30
	j	bnei_cont.31136
bnei_else.31135:
	fdiv	%f0, %f30, %f0
bnei_cont.31136:
	fmul	%f1, %f18, %f0
	fsw	%f1, 174(%zero)
	fmul	%f1, %f17, %f0
	fsw	%f1, 175(%zero)
	fmul	%f0, %f16, %f0
	fsw	%f0, 176(%zero)
	fsw	%fzero, 151(%zero)
	fsw	%fzero, 152(%zero)
	fsw	%fzero, 153(%zero)
	flw	%f0, 75(%zero)
	fsw	%f0, 159(%zero)
	flw	%f0, 76(%zero)
	fsw	%f0, 160(%zero)
	flw	%f0, 77(%zero)
	fsw	%f0, 161(%zero)
	lw	%a1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %a1, %a0
	lw	%t0, 0(%at)
	addi	%v1, %zero, 174
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %f30
	addi	%sp, %sp, 11
	jal	trace_ray.2983
	addi	%sp, %sp, -11
	lw	%a0, 0(%t0)
	flw	%f0, 151(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 152(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 153(%zero)
	fsw	%f0, 2(%a0)
	lw	%a1, 6(%t0)
	lw	%a0, 5(%sp)
	sw	%a0, 0(%a1)
	lw	%a0, 2(%t0)
	lw	%a0, 0(%a0)
	blti	%a0, 0, bgti_else.31137
	lw	%a0, 3(%t0)
	lw	%a0, 0(%a0)
	beqi	%a0, 0, bnei_else.31139
	lw	%a0, 6(%t0)
	lw	%a2, 0(%a0)
	fsw	%fzero, 148(%zero)
	fsw	%fzero, 149(%zero)
	fsw	%fzero, 150(%zero)
	lw	%a1, 7(%t0)
	lw	%a0, 1(%t0)
	lw	%t1, 179(%a2)
	lw	%t2, 0(%a1)
	lw	%t3, 0(%a0)
	flw	%f0, 0(%t3)
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	fsw	%f0, 164(%zero)
	lw	%a0, 0(%zero)
	addi	%v1, %a0, -1
	addi	%v0, %t3, 0
	addi	%sp, %sp, 11
	jal	setup_startp_constants.2894
	addi	%sp, %sp, -11
	lw	%v0, 118(%t1)
	lw	%a0, 0(%v0)
	flw	%f1, 0(%a0)
	flw	%f0, 0(%t2)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a0)
	flw	%f0, 1(%t2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a0)
	flw	%f0, 2(%t2)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%f1, %fzero, fbgt_else.31141
	add	%a0, %zero, %zero
	j	fbgt_cont.31142
fbgt_else.31141:
	add	%a0, %zero, %k1
fbgt_cont.31142:
	beqi	%a0, 0, bnei_else.31143
	lw	%v0, 119(%t1)
	flw	%f0, 438(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
	j	bnei_cont.31144
bnei_else.31143:
	flw	%f0, 437(%zero)
	fdiv	%f0, %f1, %f0
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2989
	addi	%sp, %sp, -11
bnei_cont.31144:
	addi	%a1, %zero, 116
	addi	%a0, %t3, 0
	addi	%v1, %t2, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2992
	addi	%sp, %sp, -11
	lw	%a0, 5(%t0)
	lw	%a0, 0(%a0)
	flw	%f0, 148(%zero)
	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	fsw	%f0, 2(%a0)
	j	bnei_cont.31140
bnei_else.31139:
bnei_cont.31140:
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0
	addi	%sp, %sp, 11
	jal	pretrace_diffuse_rays.3043
	addi	%sp, %sp, -11
	j	bgti_cont.31138
bgti_else.31137:
bgti_cont.31138:
	lw	%a0, 4(%sp)
	addi	%v1, %a0, -1
	lw	%a0, 5(%sp)
	addi	%a0, %a0, 1
	blti	%a0, 5, bgti_else.31145
	addi	%a0, %a0, -5
	j	bgti_cont.31146
bgti_else.31145:
bgti_cont.31146:
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	flw	%f2, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3046
bgti_else.31132:
	jr	%ra
scan_pixel.3057:
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%a2, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%t1, 6(%sp)
	add	%a0, %zero, %t0
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.32317
	add	%t0, %zero, %a0
	jr	%ra
bgt_else.32317:
	add	%at, %a1, %v0
	lw	%t1, 0(%at)
	lw	%a0, 0(%t1)
	flw	%f0, 0(%a0)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 153(%zero)
	lw	%a1, 155(%zero)
	sw	%a1, 9(%sp)
	addi	%a0, %v1, 1
	sw	%a0, 10(%sp)
	blt	%a0, %a1, bgt_else.32319
	add	%a0, %zero, %zero
	j	bgt_cont.32320
bgt_else.32319:
	blt	%zero, %v1, bgt_else.32321
	add	%a0, %zero, %zero
	j	bgt_cont.32322
bgt_else.32321:
	addi	%a0, %v0, 1
	blt	%a0, %t0, bgt_else.32323
	add	%a0, %zero, %zero
	j	bgt_cont.32324
bgt_else.32323:
	blt	%zero, %v0, bgt_else.32325
	add	%a0, %zero, %zero
	j	bgt_cont.32326
bgt_else.32325:
	add	%a0, %zero, %k1
bgt_cont.32326:
bgt_cont.32324:
bgt_cont.32322:
bgt_cont.32320:
	beqi	%a0, 0, bnei_else.32327
	lw	%a0, 2(%t1)
	lw	%a0, 0(%a0)
	blti	%a0, 0, bnei_cont.32328
	lw	%a0, 2(%t1)
	lw	%a2, 0(%a0)
	lw	%a0, 2(%sp)
	lw	%a3, 0(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.32331
	lw	%a0, 4(%sp)
	add	%at, %a0, %a3
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.32333
	addi	%a0, %a3, -1
	lw	%a1, 3(%sp)
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.32335
	addi	%a0, %a3, 1
	add	%at, %a1, %a0
	lw	%a0, 0(%at)
	lw	%a0, 2(%a0)
	lw	%a0, 0(%a0)
	bne	%a0, %a2, beq_else.32337
	add	%a0, %zero, %k1
	j	beq_cont.32332
beq_else.32337:
	add	%a0, %zero, %zero
beq_cont.32338:
	j	beq_cont.32332
beq_else.32335:
	add	%a0, %zero, %zero
beq_cont.32336:
	j	beq_cont.32332
beq_else.32333:
	add	%a0, %zero, %zero
beq_cont.32334:
	j	beq_cont.32332
beq_else.32331:
	add	%a0, %zero, %zero
beq_cont.32332:
	beqi	%a0, 0, bnei_else.32339
	lw	%a0, 3(%t1)
	lw	%a0, 0(%a0)
	beqi	%a0, 0, bnei_else.32341
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%v0, 0(%sp)
	addi	%a2, %zero, 0
	addi	%sp, %sp, 11
	jal	calc_diffuse_using_5points.3008
	addi	%sp, %sp, -11
	j	bnei_cont.32342
bnei_else.32341:
bnei_cont.32342:
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	addi	%a3, %k1, 0
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -11
	j	bnei_cont.32328
bnei_else.32339:
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
bnei_cont.32340:
	j	bnei_cont.32328
bgti_else.32329:
bgti_cont.32330:
	j	bnei_cont.32328
bnei_else.32327:
	lw	%a0, 2(%t1)
	lw	%a0, 0(%a0)
	blti	%a0, 0, bgti_else.32343
	lw	%a0, 3(%t1)
	lw	%a0, 0(%a0)
	beqi	%a0, 0, bnei_else.32345
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 11
	jal	calc_diffuse_using_1point.3005
	addi	%sp, %sp, -11
	j	bnei_cont.32346
bnei_else.32345:
bnei_cont.32346:
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
	j	bgti_cont.32344
bgti_else.32343:
bgti_cont.32344:
bnei_cont.32328:
	flw	%f0, 151(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.32347
	blti	%a1, 0, bgti_else.32349
	j	bgt_cont.32348
bgti_else.32349:
	add	%a1, %zero, %zero
bgti_cont.32350:
	j	bgt_cont.32348
bgt_else.32347:
	addi	%a1, %zero, 255
bgt_cont.32348:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	addi	%a0, %zero, 10
	blti	%a1, 10, bgti_else.32351
	blti	%a1, 20, bgti_else.32353
	blti	%a1, 30, bgti_else.32355
	blti	%a1, 40, bgti_else.32357
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.32352
	blti	%a1, 20, bgti_else.32361
	blti	%a1, 30, bgti_else.32363
	blti	%a1, 40, bgti_else.32365
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.32352
	blti	%a1, 20, bgti_else.32369
	blti	%a1, 30, bgti_else.32371
	blti	%a1, 40, bgti_else.32373
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.32352
	blti	%a1, 20, bgti_else.32377
	blti	%a1, 30, bgti_else.32379
	blti	%a1, 40, bgti_else.32381
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.32352
bgti_else.32381:
	addi	%a1, %a1, -30
bgti_cont.32382:
	j	bgti_cont.32352
bgti_else.32379:
	addi	%a1, %a1, -20
bgti_cont.32380:
	j	bgti_cont.32352
bgti_else.32377:
	addi	%a1, %a1, -10
bgti_cont.32378:
	j	bgti_cont.32352
bgti_else.32375:
bgti_cont.32376:
	j	bgti_cont.32352
bgti_else.32373:
	addi	%a1, %a1, -30
bgti_cont.32374:
	j	bgti_cont.32352
bgti_else.32371:
	addi	%a1, %a1, -20
bgti_cont.32372:
	j	bgti_cont.32352
bgti_else.32369:
	addi	%a1, %a1, -10
bgti_cont.32370:
	j	bgti_cont.32352
bgti_else.32367:
bgti_cont.32368:
	j	bgti_cont.32352
bgti_else.32365:
	addi	%a1, %a1, -30
bgti_cont.32366:
	j	bgti_cont.32352
bgti_else.32363:
	addi	%a1, %a1, -20
bgti_cont.32364:
	j	bgti_cont.32352
bgti_else.32361:
	addi	%a1, %a1, -10
bgti_cont.32362:
	j	bgti_cont.32352
bgti_else.32359:
bgti_cont.32360:
	j	bgti_cont.32352
bgti_else.32357:
	addi	%a1, %a1, -30
bgti_cont.32358:
	j	bgti_cont.32352
bgti_else.32355:
	addi	%a1, %a1, -20
bgti_cont.32356:
	j	bgti_cont.32352
bgti_else.32353:
	addi	%a1, %a1, -10
bgti_cont.32354:
	j	bgti_cont.32352
bgti_else.32351:
bgti_cont.32352:
	blt	%zero, %a2, bgt_else.32383
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.32384
bgt_else.32383:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.32385
	blti	%a2, 20, bgti_else.32387
	blti	%a2, 30, bgti_else.32389
	blti	%a2, 40, bgti_else.32391
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.32386
	blti	%a2, 20, bgti_else.32395
	blti	%a2, 30, bgti_else.32397
	blti	%a2, 40, bgti_else.32399
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.32386
	blti	%a2, 20, bgti_else.32403
	blti	%a2, 30, bgti_else.32405
	blti	%a2, 40, bgti_else.32407
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.32386
	blti	%a2, 20, bgti_else.32411
	blti	%a2, 30, bgti_else.32413
	blti	%a2, 40, bgti_else.32415
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.32386
bgti_else.32415:
	addi	%a2, %a2, -30
bgti_cont.32416:
	j	bgti_cont.32386
bgti_else.32413:
	addi	%a2, %a2, -20
bgti_cont.32414:
	j	bgti_cont.32386
bgti_else.32411:
	addi	%a2, %a2, -10
bgti_cont.32412:
	j	bgti_cont.32386
bgti_else.32409:
bgti_cont.32410:
	j	bgti_cont.32386
bgti_else.32407:
	addi	%a2, %a2, -30
bgti_cont.32408:
	j	bgti_cont.32386
bgti_else.32405:
	addi	%a2, %a2, -20
bgti_cont.32406:
	j	bgti_cont.32386
bgti_else.32403:
	addi	%a2, %a2, -10
bgti_cont.32404:
	j	bgti_cont.32386
bgti_else.32401:
bgti_cont.32402:
	j	bgti_cont.32386
bgti_else.32399:
	addi	%a2, %a2, -30
bgti_cont.32400:
	j	bgti_cont.32386
bgti_else.32397:
	addi	%a2, %a2, -20
bgti_cont.32398:
	j	bgti_cont.32386
bgti_else.32395:
	addi	%a2, %a2, -10
bgti_cont.32396:
	j	bgti_cont.32386
bgti_else.32393:
bgti_cont.32394:
	j	bgti_cont.32386
bgti_else.32391:
	addi	%a2, %a2, -30
bgti_cont.32392:
	j	bgti_cont.32386
bgti_else.32389:
	addi	%a2, %a2, -20
bgti_cont.32390:
	j	bgti_cont.32386
bgti_else.32387:
	addi	%a2, %a2, -10
bgti_cont.32388:
	j	bgti_cont.32386
bgti_else.32385:
bgti_cont.32386:
	blt	%zero, %a0, bgt_else.32417
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.32418
bgt_else.32417:
	blti	%a0, 10, bgti_else.32419
	blti	%a0, 20, bgti_else.32421
	blti	%a0, 30, bgti_else.32423
	blti	%a0, 40, bgti_else.32425
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.32420
	blti	%a0, 20, bgti_else.32429
	blti	%a0, 30, bgti_else.32431
	blti	%a0, 40, bgti_else.32433
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.32420
	blti	%a0, 20, bgti_else.32437
	blti	%a0, 30, bgti_else.32439
	blti	%a0, 40, bgti_else.32441
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.32420
	blti	%a0, 20, bgti_else.32445
	blti	%a0, 30, bgti_else.32447
	blti	%a0, 40, bgti_else.32449
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.32420
bgti_else.32449:
	addi	%a0, %a0, -30
bgti_cont.32450:
	j	bgti_cont.32420
bgti_else.32447:
	addi	%a0, %a0, -20
bgti_cont.32448:
	j	bgti_cont.32420
bgti_else.32445:
	addi	%a0, %a0, -10
bgti_cont.32446:
	j	bgti_cont.32420
bgti_else.32443:
bgti_cont.32444:
	j	bgti_cont.32420
bgti_else.32441:
	addi	%a0, %a0, -30
bgti_cont.32442:
	j	bgti_cont.32420
bgti_else.32439:
	addi	%a0, %a0, -20
bgti_cont.32440:
	j	bgti_cont.32420
bgti_else.32437:
	addi	%a0, %a0, -10
bgti_cont.32438:
	j	bgti_cont.32420
bgti_else.32435:
bgti_cont.32436:
	j	bgti_cont.32420
bgti_else.32433:
	addi	%a0, %a0, -30
bgti_cont.32434:
	j	bgti_cont.32420
bgti_else.32431:
	addi	%a0, %a0, -20
bgti_cont.32432:
	j	bgti_cont.32420
bgti_else.32429:
	addi	%a0, %a0, -10
bgti_cont.32430:
	j	bgti_cont.32420
bgti_else.32427:
bgti_cont.32428:
	j	bgti_cont.32420
bgti_else.32425:
	addi	%a0, %a0, -30
bgti_cont.32426:
	j	bgti_cont.32420
bgti_else.32423:
	addi	%a0, %a0, -20
bgti_cont.32424:
	j	bgti_cont.32420
bgti_else.32421:
	addi	%a0, %a0, -10
bgti_cont.32422:
	j	bgti_cont.32420
bgti_else.32419:
bgti_cont.32420:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.32418:
bgt_cont.32384:
	addi	%t1, %zero, 32
	addi	%v0, %t1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 152(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.32451
	blti	%a1, 0, bgti_else.32453
	j	bgt_cont.32452
bgti_else.32453:
	add	%a1, %zero, %zero
bgti_cont.32454:
	j	bgt_cont.32452
bgt_else.32451:
	addi	%a1, %zero, 255
bgt_cont.32452:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.32455
	blti	%a1, 20, bgti_else.32457
	blti	%a1, 30, bgti_else.32459
	blti	%a1, 40, bgti_else.32461
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.32456
	blti	%a1, 20, bgti_else.32465
	blti	%a1, 30, bgti_else.32467
	blti	%a1, 40, bgti_else.32469
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.32456
	blti	%a1, 20, bgti_else.32473
	blti	%a1, 30, bgti_else.32475
	blti	%a1, 40, bgti_else.32477
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.32456
	blti	%a1, 20, bgti_else.32481
	blti	%a1, 30, bgti_else.32483
	blti	%a1, 40, bgti_else.32485
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.32456
bgti_else.32485:
	addi	%a1, %a1, -30
bgti_cont.32486:
	j	bgti_cont.32456
bgti_else.32483:
	addi	%a1, %a1, -20
bgti_cont.32484:
	j	bgti_cont.32456
bgti_else.32481:
	addi	%a1, %a1, -10
bgti_cont.32482:
	j	bgti_cont.32456
bgti_else.32479:
bgti_cont.32480:
	j	bgti_cont.32456
bgti_else.32477:
	addi	%a1, %a1, -30
bgti_cont.32478:
	j	bgti_cont.32456
bgti_else.32475:
	addi	%a1, %a1, -20
bgti_cont.32476:
	j	bgti_cont.32456
bgti_else.32473:
	addi	%a1, %a1, -10
bgti_cont.32474:
	j	bgti_cont.32456
bgti_else.32471:
bgti_cont.32472:
	j	bgti_cont.32456
bgti_else.32469:
	addi	%a1, %a1, -30
bgti_cont.32470:
	j	bgti_cont.32456
bgti_else.32467:
	addi	%a1, %a1, -20
bgti_cont.32468:
	j	bgti_cont.32456
bgti_else.32465:
	addi	%a1, %a1, -10
bgti_cont.32466:
	j	bgti_cont.32456
bgti_else.32463:
bgti_cont.32464:
	j	bgti_cont.32456
bgti_else.32461:
	addi	%a1, %a1, -30
bgti_cont.32462:
	j	bgti_cont.32456
bgti_else.32459:
	addi	%a1, %a1, -20
bgti_cont.32460:
	j	bgti_cont.32456
bgti_else.32457:
	addi	%a1, %a1, -10
bgti_cont.32458:
	j	bgti_cont.32456
bgti_else.32455:
bgti_cont.32456:
	blt	%zero, %a2, bgt_else.32487
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.32488
bgt_else.32487:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.32489
	blti	%a2, 20, bgti_else.32491
	blti	%a2, 30, bgti_else.32493
	blti	%a2, 40, bgti_else.32495
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.32490
	blti	%a2, 20, bgti_else.32499
	blti	%a2, 30, bgti_else.32501
	blti	%a2, 40, bgti_else.32503
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.32490
	blti	%a2, 20, bgti_else.32507
	blti	%a2, 30, bgti_else.32509
	blti	%a2, 40, bgti_else.32511
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.32490
	blti	%a2, 20, bgti_else.32515
	blti	%a2, 30, bgti_else.32517
	blti	%a2, 40, bgti_else.32519
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.32490
bgti_else.32519:
	addi	%a2, %a2, -30
bgti_cont.32520:
	j	bgti_cont.32490
bgti_else.32517:
	addi	%a2, %a2, -20
bgti_cont.32518:
	j	bgti_cont.32490
bgti_else.32515:
	addi	%a2, %a2, -10
bgti_cont.32516:
	j	bgti_cont.32490
bgti_else.32513:
bgti_cont.32514:
	j	bgti_cont.32490
bgti_else.32511:
	addi	%a2, %a2, -30
bgti_cont.32512:
	j	bgti_cont.32490
bgti_else.32509:
	addi	%a2, %a2, -20
bgti_cont.32510:
	j	bgti_cont.32490
bgti_else.32507:
	addi	%a2, %a2, -10
bgti_cont.32508:
	j	bgti_cont.32490
bgti_else.32505:
bgti_cont.32506:
	j	bgti_cont.32490
bgti_else.32503:
	addi	%a2, %a2, -30
bgti_cont.32504:
	j	bgti_cont.32490
bgti_else.32501:
	addi	%a2, %a2, -20
bgti_cont.32502:
	j	bgti_cont.32490
bgti_else.32499:
	addi	%a2, %a2, -10
bgti_cont.32500:
	j	bgti_cont.32490
bgti_else.32497:
bgti_cont.32498:
	j	bgti_cont.32490
bgti_else.32495:
	addi	%a2, %a2, -30
bgti_cont.32496:
	j	bgti_cont.32490
bgti_else.32493:
	addi	%a2, %a2, -20
bgti_cont.32494:
	j	bgti_cont.32490
bgti_else.32491:
	addi	%a2, %a2, -10
bgti_cont.32492:
	j	bgti_cont.32490
bgti_else.32489:
bgti_cont.32490:
	blt	%zero, %a0, bgt_else.32521
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.32522
bgt_else.32521:
	blti	%a0, 10, bgti_else.32523
	blti	%a0, 20, bgti_else.32525
	blti	%a0, 30, bgti_else.32527
	blti	%a0, 40, bgti_else.32529
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.32524
	blti	%a0, 20, bgti_else.32533
	blti	%a0, 30, bgti_else.32535
	blti	%a0, 40, bgti_else.32537
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.32524
	blti	%a0, 20, bgti_else.32541
	blti	%a0, 30, bgti_else.32543
	blti	%a0, 40, bgti_else.32545
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.32524
	blti	%a0, 20, bgti_else.32549
	blti	%a0, 30, bgti_else.32551
	blti	%a0, 40, bgti_else.32553
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.32524
bgti_else.32553:
	addi	%a0, %a0, -30
bgti_cont.32554:
	j	bgti_cont.32524
bgti_else.32551:
	addi	%a0, %a0, -20
bgti_cont.32552:
	j	bgti_cont.32524
bgti_else.32549:
	addi	%a0, %a0, -10
bgti_cont.32550:
	j	bgti_cont.32524
bgti_else.32547:
bgti_cont.32548:
	j	bgti_cont.32524
bgti_else.32545:
	addi	%a0, %a0, -30
bgti_cont.32546:
	j	bgti_cont.32524
bgti_else.32543:
	addi	%a0, %a0, -20
bgti_cont.32544:
	j	bgti_cont.32524
bgti_else.32541:
	addi	%a0, %a0, -10
bgti_cont.32542:
	j	bgti_cont.32524
bgti_else.32539:
bgti_cont.32540:
	j	bgti_cont.32524
bgti_else.32537:
	addi	%a0, %a0, -30
bgti_cont.32538:
	j	bgti_cont.32524
bgti_else.32535:
	addi	%a0, %a0, -20
bgti_cont.32536:
	j	bgti_cont.32524
bgti_else.32533:
	addi	%a0, %a0, -10
bgti_cont.32534:
	j	bgti_cont.32524
bgti_else.32531:
bgti_cont.32532:
	j	bgti_cont.32524
bgti_else.32529:
	addi	%a0, %a0, -30
bgti_cont.32530:
	j	bgti_cont.32524
bgti_else.32527:
	addi	%a0, %a0, -20
bgti_cont.32528:
	j	bgti_cont.32524
bgti_else.32525:
	addi	%a0, %a0, -10
bgti_cont.32526:
	j	bgti_cont.32524
bgti_else.32523:
bgti_cont.32524:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.32522:
bgt_cont.32488:
	addi	%v0, %t1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 153(%zero)
	ftoi	%a1, %f0
	addi	%at, %zero, 255
	blt	%at, %a1, bgt_else.32555
	blti	%a1, 0, bgti_else.32557
	j	bgt_cont.32556
bgti_else.32557:
	add	%a1, %zero, %zero
bgti_cont.32558:
	j	bgt_cont.32556
bgt_else.32555:
	addi	%a1, %zero, 255
bgt_cont.32556:
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	blti	%a1, 10, bgti_else.32559
	blti	%a1, 20, bgti_else.32561
	blti	%a1, 30, bgti_else.32563
	blti	%a1, 40, bgti_else.32565
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.32560
	blti	%a1, 20, bgti_else.32569
	blti	%a1, 30, bgti_else.32571
	blti	%a1, 40, bgti_else.32573
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.32560
	blti	%a1, 20, bgti_else.32577
	blti	%a1, 30, bgti_else.32579
	blti	%a1, 40, bgti_else.32581
	addi	%a1, %a1, -40
	blti	%a1, 10, bgti_cont.32560
	blti	%a1, 20, bgti_else.32585
	blti	%a1, 30, bgti_else.32587
	blti	%a1, 40, bgti_else.32589
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0
	j	bgti_cont.32560
bgti_else.32589:
	addi	%a1, %a1, -30
bgti_cont.32590:
	j	bgti_cont.32560
bgti_else.32587:
	addi	%a1, %a1, -20
bgti_cont.32588:
	j	bgti_cont.32560
bgti_else.32585:
	addi	%a1, %a1, -10
bgti_cont.32586:
	j	bgti_cont.32560
bgti_else.32583:
bgti_cont.32584:
	j	bgti_cont.32560
bgti_else.32581:
	addi	%a1, %a1, -30
bgti_cont.32582:
	j	bgti_cont.32560
bgti_else.32579:
	addi	%a1, %a1, -20
bgti_cont.32580:
	j	bgti_cont.32560
bgti_else.32577:
	addi	%a1, %a1, -10
bgti_cont.32578:
	j	bgti_cont.32560
bgti_else.32575:
bgti_cont.32576:
	j	bgti_cont.32560
bgti_else.32573:
	addi	%a1, %a1, -30
bgti_cont.32574:
	j	bgti_cont.32560
bgti_else.32571:
	addi	%a1, %a1, -20
bgti_cont.32572:
	j	bgti_cont.32560
bgti_else.32569:
	addi	%a1, %a1, -10
bgti_cont.32570:
	j	bgti_cont.32560
bgti_else.32567:
bgti_cont.32568:
	j	bgti_cont.32560
bgti_else.32565:
	addi	%a1, %a1, -30
bgti_cont.32566:
	j	bgti_cont.32560
bgti_else.32563:
	addi	%a1, %a1, -20
bgti_cont.32564:
	j	bgti_cont.32560
bgti_else.32561:
	addi	%a1, %a1, -10
bgti_cont.32562:
	j	bgti_cont.32560
bgti_else.32559:
bgti_cont.32560:
	blt	%zero, %a2, bgt_else.32591
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.32592
bgt_else.32591:
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	blti	%a2, 10, bgti_else.32593
	blti	%a2, 20, bgti_else.32595
	blti	%a2, 30, bgti_else.32597
	blti	%a2, 40, bgti_else.32599
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.32594
	blti	%a2, 20, bgti_else.32603
	blti	%a2, 30, bgti_else.32605
	blti	%a2, 40, bgti_else.32607
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.32594
	blti	%a2, 20, bgti_else.32611
	blti	%a2, 30, bgti_else.32613
	blti	%a2, 40, bgti_else.32615
	addi	%a2, %a2, -40
	blti	%a2, 10, bgti_cont.32594
	blti	%a2, 20, bgti_else.32619
	blti	%a2, 30, bgti_else.32621
	blti	%a2, 40, bgti_else.32623
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0
	j	bgti_cont.32594
bgti_else.32623:
	addi	%a2, %a2, -30
bgti_cont.32624:
	j	bgti_cont.32594
bgti_else.32621:
	addi	%a2, %a2, -20
bgti_cont.32622:
	j	bgti_cont.32594
bgti_else.32619:
	addi	%a2, %a2, -10
bgti_cont.32620:
	j	bgti_cont.32594
bgti_else.32617:
bgti_cont.32618:
	j	bgti_cont.32594
bgti_else.32615:
	addi	%a2, %a2, -30
bgti_cont.32616:
	j	bgti_cont.32594
bgti_else.32613:
	addi	%a2, %a2, -20
bgti_cont.32614:
	j	bgti_cont.32594
bgti_else.32611:
	addi	%a2, %a2, -10
bgti_cont.32612:
	j	bgti_cont.32594
bgti_else.32609:
bgti_cont.32610:
	j	bgti_cont.32594
bgti_else.32607:
	addi	%a2, %a2, -30
bgti_cont.32608:
	j	bgti_cont.32594
bgti_else.32605:
	addi	%a2, %a2, -20
bgti_cont.32606:
	j	bgti_cont.32594
bgti_else.32603:
	addi	%a2, %a2, -10
bgti_cont.32604:
	j	bgti_cont.32594
bgti_else.32601:
bgti_cont.32602:
	j	bgti_cont.32594
bgti_else.32599:
	addi	%a2, %a2, -30
bgti_cont.32600:
	j	bgti_cont.32594
bgti_else.32597:
	addi	%a2, %a2, -20
bgti_cont.32598:
	j	bgti_cont.32594
bgti_else.32595:
	addi	%a2, %a2, -10
bgti_cont.32596:
	j	bgti_cont.32594
bgti_else.32593:
bgti_cont.32594:
	blt	%zero, %a0, bgt_else.32625
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	j	bgt_cont.32626
bgt_else.32625:
	blti	%a0, 10, bgti_else.32627
	blti	%a0, 20, bgti_else.32629
	blti	%a0, 30, bgti_else.32631
	blti	%a0, 40, bgti_else.32633
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.32628
	blti	%a0, 20, bgti_else.32637
	blti	%a0, 30, bgti_else.32639
	blti	%a0, 40, bgti_else.32641
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.32628
	blti	%a0, 20, bgti_else.32645
	blti	%a0, 30, bgti_else.32647
	blti	%a0, 40, bgti_else.32649
	addi	%a0, %a0, -40
	blti	%a0, 10, bgti_cont.32628
	blti	%a0, 20, bgti_else.32653
	blti	%a0, 30, bgti_else.32655
	blti	%a0, 40, bgti_else.32657
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11
	jal	print_int_sub2.2644
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0
	j	bgti_cont.32628
bgti_else.32657:
	addi	%a0, %a0, -30
bgti_cont.32658:
	j	bgti_cont.32628
bgti_else.32655:
	addi	%a0, %a0, -20
bgti_cont.32656:
	j	bgti_cont.32628
bgti_else.32653:
	addi	%a0, %a0, -10
bgti_cont.32654:
	j	bgti_cont.32628
bgti_else.32651:
bgti_cont.32652:
	j	bgti_cont.32628
bgti_else.32649:
	addi	%a0, %a0, -30
bgti_cont.32650:
	j	bgti_cont.32628
bgti_else.32647:
	addi	%a0, %a0, -20
bgti_cont.32648:
	j	bgti_cont.32628
bgti_else.32645:
	addi	%a0, %a0, -10
bgti_cont.32646:
	j	bgti_cont.32628
bgti_else.32643:
bgti_cont.32644:
	j	bgti_cont.32628
bgti_else.32641:
	addi	%a0, %a0, -30
bgti_cont.32642:
	j	bgti_cont.32628
bgti_else.32639:
	addi	%a0, %a0, -20
bgti_cont.32640:
	j	bgti_cont.32628
bgti_else.32637:
	addi	%a0, %a0, -10
bgti_cont.32638:
	j	bgti_cont.32628
bgti_else.32635:
bgti_cont.32636:
	j	bgti_cont.32628
bgti_else.32633:
	addi	%a0, %a0, -30
bgti_cont.32634:
	j	bgti_cont.32628
bgti_else.32631:
	addi	%a0, %a0, -20
bgti_cont.32632:
	j	bgti_cont.32628
bgti_else.32629:
	addi	%a0, %a0, -10
bgti_cont.32630:
	j	bgti_cont.32628
bgti_else.32627:
bgti_cont.32628:
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
bgt_cont.32626:
bgt_cont.32592:
	addi	%v0, %zero, 10
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	lw	%a0, 0(%sp)
	addi	%t2, %a0, 1
	blt	%t2, %t0, bgt_else.32659
	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	jr	%ra
bgt_else.32659:
	lw	%a0, 3(%sp)
	add	%at, %a0, %t2
	lw	%v0, 0(%at)
	lw	%a0, 0(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 153(%zero)
	lw	%a1, 9(%sp)
	lw	%a0, 10(%sp)
	blt	%a0, %a1, bgt_else.32661
	add	%a0, %zero, %zero
	j	bgt_cont.32662
bgt_else.32661:
	lw	%a0, 1(%sp)
	blt	%zero, %a0, bgt_else.32663
	add	%a0, %zero, %zero
	j	bgt_cont.32664
bgt_else.32663:
	addi	%a0, %t2, 1
	blt	%a0, %t0, bgt_else.32665
	add	%a0, %zero, %zero
	j	bgt_cont.32666
bgt_else.32665:
	blt	%zero, %t2, bgt_else.32667
	add	%a0, %zero, %zero
	j	bgt_cont.32668
bgt_else.32667:
	add	%a0, %zero, %k1
bgt_cont.32668:
bgt_cont.32666:
bgt_cont.32664:
bgt_cont.32662:
	beqi	%a0, 0, bnei_else.32669
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t2, 0
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -11
	j	bnei_cont.32670
bnei_else.32669:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
bnei_cont.32670:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32671
	blti	%v0, 0, bgti_else.32673
	j	bgt_cont.32672
bgti_else.32673:
	add	%v0, %zero, %zero
bgti_cont.32674:
	j	bgt_cont.32672
bgt_else.32671:
	addi	%v0, %zero, 255
bgt_cont.32672:
	addi	%sp, %sp, 11
	jal	print_int.2646
	addi	%sp, %sp, -11
	addi	%v0, %t1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32675
	blti	%v0, 0, bgti_else.32677
	j	bgt_cont.32676
bgti_else.32677:
	add	%v0, %zero, %zero
bgti_cont.32678:
	j	bgt_cont.32676
bgt_else.32675:
	addi	%v0, %zero, 255
bgt_cont.32676:
	addi	%sp, %sp, 11
	jal	print_int.2646
	addi	%sp, %sp, -11
	addi	%v0, %t1, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32679
	blti	%v0, 0, bgti_else.32681
	j	bgt_cont.32680
bgti_else.32681:
	add	%v0, %zero, %zero
bgti_cont.32682:
	j	bgt_cont.32680
bgt_else.32679:
	addi	%v0, %zero, 255
bgt_cont.32680:
	addi	%sp, %sp, 11
	jal	print_int.2646
	addi	%sp, %sp, -11
	addi	%v0, %zero, 10
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	addi	%v0, %t2, 1
	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	j	scan_pixel.3057
scan_line.3063:
	add	%a3, %zero, %v0
	sw	%a3, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a0, 2(%sp)
	add	%v0, %zero, %a1
	sw	%v0, 3(%sp)
	add	%a0, %zero, %a2
	sw	%a0, 4(%sp)
	sw	%t3, 5(%sp)
	sw	%t2, 6(%sp)
	sw	%t1, 7(%sp)
	add	%a1, %zero, %t0
	sw	%a1, 8(%sp)
	sw	%ra, 9(%sp)
	lw	%t0, 155(%zero)
	blt	%a3, %t0, bgt_else.32850
	add	%t0, %zero, %a1
	jr	%ra
bgt_else.32850:
	addi	%a1, %t0, -1
	sw	%a1, 10(%sp)
	blt	%a3, %a1, bgt_else.32852
	j	bgt_cont.32853
bgt_else.32852:
	addi	%a2, %a3, 1
	flw	%f1, 158(%zero)
	lw	%a1, 157(%zero)
	sub	%a1, %a2, %a1
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
	addi	%sp, %sp, 11
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -11
bgt_cont.32853:
	lw	%t1, 154(%zero)
	blt	%zero, %t1, bgt_else.32854
	j	bgt_cont.32855
bgt_else.32854:
	lw	%a0, 2(%sp)
	lw	%v0, 0(%a0)
	lw	%a0, 0(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	fsw	%f0, 153(%zero)
	lw	%a1, 0(%sp)
	addi	%a0, %a1, 1
	blt	%a0, %t0, bgt_else.32856
	j	bgt_cont.32857
bgt_else.32856:
	blt	%zero, %a1, bgt_else.32858
	j	bgt_cont.32859
bgt_else.32858:
	blt	%k1, %t1, bgt_else.32860
	j	bgt_cont.32861
bgt_else.32860:
bgt_cont.32861:
	blt	%at, %t1, bgt_else.32862
	j	bgt_cont.32863
bgt_else.32862:
bgt_cont.32863:
bgt_cont.32859:
bgt_cont.32857:
	beqi	%zero, 0, bnei_else.32864
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3030
	addi	%sp, %sp, -11
	j	bnei_cont.32865
bnei_else.32864:
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3014
	addi	%sp, %sp, -11
bnei_cont.32865:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32866
	blti	%v0, 0, bgti_else.32868
	j	bgt_cont.32867
bgti_else.32868:
	add	%v0, %zero, %zero
bgti_cont.32869:
	j	bgt_cont.32867
bgt_else.32866:
	addi	%v0, %zero, 255
bgt_cont.32867:
	addi	%sp, %sp, 11
	jal	print_int.2646
	addi	%sp, %sp, -11
	addi	%k0, %zero, 32
	addi	%v0, %k0, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32870
	blti	%v0, 0, bgti_else.32872
	j	bgt_cont.32871
bgti_else.32872:
	add	%v0, %zero, %zero
bgti_cont.32873:
	j	bgt_cont.32871
bgt_else.32870:
	addi	%v0, %zero, 255
bgt_cont.32871:
	addi	%sp, %sp, 11
	jal	print_int.2646
	addi	%sp, %sp, -11
	addi	%v0, %k0, 0
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.32874
	blti	%v0, 0, bgti_else.32876
	j	bgt_cont.32875
bgti_else.32876:
	add	%v0, %zero, %zero
bgti_cont.32877:
	j	bgt_cont.32875
bgt_else.32874:
	addi	%v0, %zero, 255
bgt_cont.32875:
	addi	%sp, %sp, 11
	jal	print_int.2646
	addi	%sp, %sp, -11
	addi	%v0, %zero, 10
	addi	%sp, %sp, 11
	jal	min_caml_print_char
	addi	%sp, %sp, -11
	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 11
	jal	scan_pixel.3057
	addi	%sp, %sp, -11
bgt_cont.32855:
	lw	%a0, 0(%sp)
	addi	%t2, %a0, 1
	lw	%a0, 4(%sp)
	addi	%t3, %a0, 2
	blti	%t3, 5, bgti_else.32878
	addi	%t3, %t3, -5
	j	bgti_cont.32879
bgti_else.32878:
bgti_cont.32879:
	blt	%t2, %t0, bgt_else.32880
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	jr	%ra
bgt_else.32880:
	lw	%a0, 10(%sp)
	blt	%t2, %a0, bgt_else.32882
	j	bgt_cont.32883
bgt_else.32882:
	addi	%a1, %t2, 1
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	sub	%a0, %a1, %a0
	itof	%f0, %a0
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
	addi	%v1, %t1, -1
	lw	%v0, 1(%sp)
	addi	%a0, %t3, 0
	addi	%sp, %sp, 11
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -11
bgt_cont.32883:
	lw	%a2, 1(%sp)
	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0
	addi	%sp, %sp, 11
	jal	scan_pixel.3057
	addi	%sp, %sp, -11
	addi	%v0, %t2, 1
	addi	%a2, %t3, 2
	blti	%a2, 5, bgti_else.32884
	addi	%a2, %a2, -5
	j	bgti_cont.32885
bgti_else.32884:
bgti_cont.32885:
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	lw	%ra, 9(%sp)
	lw	%a1, 2(%sp)
	lw	%a0, 1(%sp)
	lw	%v1, 3(%sp)
	j	scan_line.3063
create_pixel.3071:
	add	%a1, %zero, %ra
	addi	%a2, %zero, 3
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a3, %v0, 0
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%k0, %zero, 5
	addi	%v0, %k0, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s0)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s0)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s0)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s0)
	addi	%v1, %zero, 0
	addi	%v0, %k0, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %k0, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s3)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s3)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s3)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s3)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	jal	min_caml_create_array
	addi	%s4, %v0, 0
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s4)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s4)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s4)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s4)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s5, %v0, 0
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %a2, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v0)
	sw	%s5, 6(%v0)
	sw	%s4, 5(%v0)
	sw	%s3, 4(%v0)
	sw	%s2, 3(%v0)
	sw	%s1, 2(%v0)
	sw	%s0, 1(%v0)
	sw	%a3, 0(%v0)
	add	%ra, %zero, %a1
	jr	%ra
init_line_elements.3073:
	add	%s6, %zero, %v0
	add	%a1, %zero, %v1
	add	%s7, %zero, %ra
	blti	%a1, 0, bgti_else.32938
	addi	%t7, %zero, 3
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%t8, %zero, 5
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%a3, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a3)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a3)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a3)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a3)
	addi	%v1, %zero, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%s0, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s1)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s1)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s1)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s1)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s2)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s2)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s2)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s3, 6(%ra)
	sw	%s2, 5(%ra)
	sw	%s1, 4(%ra)
	sw	%s0, 3(%ra)
	sw	%k0, 2(%ra)
	sw	%a3, 1(%ra)
	sw	%a2, 0(%ra)
	add	%at, %s6, %a1
	sw	%ra, 0(%at)
	addi	%t9, %a1, -1
	blti	%t9, 0, bgti_else.32939
	jal	create_pixel.3071
	add	%at, %s6, %t9
	sw	%v0, 0(%at)
	addi	%s0, %t9, -1
	blti	%s0, 0, bgti_else.32940
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%a2, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a2)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a2)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a2)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a2)
	addi	%v1, %zero, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%a3, %v0, 0
	addi	%v1, %zero, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%k0, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%s1, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s1)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s1)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s1)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s1)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%s2, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%s2)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%s2)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%s2)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%s2)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_array
	addi	%s3, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%v1, %v0, 0
	addi	%v0, %t8, 0
	jal	min_caml_create_array
	addi	%a0, %v0, 0
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 1(%a0)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 2(%a0)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 3(%a0)
	addi	%v0, %t7, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	sw	%v0, 4(%a0)
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%ra)
	sw	%s3, 6(%ra)
	sw	%s2, 5(%ra)
	sw	%s1, 4(%ra)
	sw	%k0, 3(%ra)
	sw	%a3, 2(%ra)
	sw	%a2, 1(%ra)
	sw	%a1, 0(%ra)
	add	%at, %s6, %s0
	sw	%ra, 0(%at)
	addi	%t7, %s0, -1
	blti	%t7, 0, bgti_else.32941
	jal	create_pixel.3071
	add	%at, %s6, %t7
	sw	%v0, 0(%at)
	addi	%v1, %t7, -1
	add	%ra, %zero, %s7
	addi	%v0, %s6, 0
	j	init_line_elements.3073
bgti_else.32941:
	add	%ra, %zero, %s7
	add	%v0, %zero, %s6
	jr	%ra
bgti_else.32940:
	add	%ra, %zero, %s7
	add	%v0, %zero, %s6
	jr	%ra
bgti_else.32939:
	add	%ra, %zero, %s7
	add	%v0, %zero, %s6
	jr	%ra
bgti_else.32938:
	add	%ra, %zero, %s7
	add	%v0, %zero, %s6
	jr	%ra
calc_dirvec.3083:
	fmov	%f20, %f2
	add	%a1, %zero, %a0
	add	%a2, %zero, %ra
	blti	%v0, 5, bgti_else.33350
	fmul	%f17, %f0, %f0
	fmul	%f16, %f1, %f1
	fadd	%f16, %f17, %f16
	fadd	%f16, %f16, %f30
	fsqrt	%f17, %f16
	fdiv	%f19, %f0, %f17
	fdiv	%f16, %f1, %f17
	fdiv	%f18, %f30, %f17
	lw	%a3, 179(%v1)
	add	%at, %a3, %a1
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fsw	%f19, 0(%a0)
	fsw	%f16, 1(%a0)
	fsw	%f18, 2(%a0)
	addi	%a0, %a1, 40
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f0, %f16
	fsw	%f19, 0(%a0)
	fsw	%f18, 1(%a0)
	fsw	%f0, 2(%a0)
	addi	%a0, %a1, 80
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f1, %f19
	fneg	%f0, %f16
	fsw	%f18, 0(%a0)
	fsw	%f1, 1(%a0)
	fsw	%f0, 2(%a0)
	addi	%a0, %a1, 1
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f17, %f19
	fneg	%f1, %f16
	fneg	%f0, %f18
	fsw	%f17, 0(%a0)
	fsw	%f1, 1(%a0)
	fsw	%f0, 2(%a0)
	addi	%a0, %a1, 41
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f1, %f19
	fneg	%f0, %f18
	fsw	%f1, 0(%a0)
	fsw	%f0, 1(%a0)
	fsw	%f16, 2(%a0)
	addi	%a0, %a1, 81
	add	%at, %a3, %a0
	lw	%a0, 0(%at)
	lw	%a0, 0(%a0)
	fneg	%f0, %f18
	fsw	%f0, 0(%a0)
	fsw	%f19, 1(%a0)
	add	%ra, %zero, %a2
	fsw	%f16, 2(%a0)
	jr	%ra
bgti_else.33350:
	fmul	%f0, %f1, %f1
	flw	%f23, 439(%zero)
	fadd	%f0, %f0, %f23
	fsqrt	%f21, %f0
	fdiv	%f0, %f30, %f21
	jal	atan.2639
	fmul	%f18, %f0, %f20
	flw	%f22, 495(%zero)
	fblt	%f18, %fzero, fbgt_else.33352
	add	%a0, %zero, %k1
	j	fbgt_cont.33353
fbgt_else.33352:
	add	%a0, %zero, %zero
fbgt_cont.33353:
	fabs	%f17, %f18
	flw	%f24, 494(%zero)
	fblt	%f17, %f24, fbgt_else.33354
	flw	%f0, 493(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.33355
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.33355
fbgt_else.33374:
fbgt_cont.33375:
	j	fbgt_cont.33355
fbgt_else.33372:
fbgt_cont.33373:
	j	fbgt_cont.33355
fbgt_else.33370:
fbgt_cont.33371:
	j	fbgt_cont.33355
fbgt_else.33368:
fbgt_cont.33369:
	j	fbgt_cont.33355
fbgt_else.33366:
fbgt_cont.33367:
	j	fbgt_cont.33355
fbgt_else.33364:
fbgt_cont.33365:
	j	fbgt_cont.33355
fbgt_else.33362:
fbgt_cont.33363:
	j	fbgt_cont.33355
fbgt_else.33360:
fbgt_cont.33361:
	j	fbgt_cont.33355
fbgt_else.33358:
fbgt_cont.33359:
	j	fbgt_cont.33355
fbgt_else.33356:
fbgt_cont.33357:
	j	fbgt_cont.33355
fbgt_else.33354:
	fmov	%f0, %f24
fbgt_cont.33355:
	fblt	%f17, %f24, fbgt_else.33376
	fblt	%f17, %f0, fbgt_else.33378
	fsub	%f17, %f17, %f0
	flw	%f16, 496(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33377
	fblt	%f17, %f0, fbgt_else.33382
	fsub	%f17, %f17, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33377
	fblt	%f17, %f1, fbgt_else.33386
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.33377
fbgt_else.33386:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.33387:
	j	fbgt_cont.33377
fbgt_else.33384:
fbgt_cont.33385:
	j	fbgt_cont.33377
fbgt_else.33382:
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33377
	fblt	%f17, %f1, fbgt_else.33390
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.33377
fbgt_else.33390:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.33391:
	j	fbgt_cont.33377
fbgt_else.33388:
fbgt_cont.33389:
fbgt_cont.33383:
	j	fbgt_cont.33377
fbgt_else.33380:
fbgt_cont.33381:
	j	fbgt_cont.33377
fbgt_else.33378:
	flw	%f16, 496(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33377
	fblt	%f17, %f0, fbgt_else.33394
	fsub	%f17, %f17, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33377
	fblt	%f17, %f1, fbgt_else.33398
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.33377
fbgt_else.33398:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.33399:
	j	fbgt_cont.33377
fbgt_else.33396:
fbgt_cont.33397:
	j	fbgt_cont.33377
fbgt_else.33394:
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33377
	fblt	%f17, %f1, fbgt_else.33402
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.33377
fbgt_else.33402:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.33403:
	j	fbgt_cont.33377
fbgt_else.33400:
fbgt_cont.33401:
fbgt_cont.33395:
	j	fbgt_cont.33377
fbgt_else.33392:
fbgt_cont.33393:
fbgt_cont.33379:
	j	fbgt_cont.33377
fbgt_else.33376:
fbgt_cont.33377:
	fblt	%f17, %f22, fbgt_else.33404
	beqi	%a0, 0, bnei_else.33406
	add	%a0, %zero, %zero
	j	fbgt_cont.33405
bnei_else.33406:
	add	%a0, %zero, %k1
bnei_cont.33407:
	j	fbgt_cont.33405
fbgt_else.33404:
fbgt_cont.33405:
	fblt	%f17, %f22, fbgt_else.33408
	fsub	%f17, %f17, %f22
	j	fbgt_cont.33409
fbgt_else.33408:
fbgt_cont.33409:
	flw	%f25, 479(%zero)
	fblt	%f17, %f25, fbgt_else.33410
	fsub	%f17, %f22, %f17
	j	fbgt_cont.33411
fbgt_else.33410:
fbgt_cont.33411:
	flw	%f26, 478(%zero)
	fblt	%f26, %f17, fbgt_else.33412
	fmul	%f19, %f17, %f17
	fmul	%f16, %f19, %f19
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f19
	fsub	%f1, %f17, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.33413
fbgt_else.33412:
	fsub	%f0, %f25, %f17
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
fbgt_cont.33413:
	beqi	%a0, 0, bnei_else.33414
	j	bnei_cont.33415
bnei_else.33414:
	fneg	%f17, %f17
bnei_cont.33415:
	fabs	%f18, %f18
	fblt	%f18, %f24, fbgt_else.33416
	flw	%f0, 493(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f0, 492(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f0, 491(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f0, 490(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f0, 489(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f0, 488(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f0, 487(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f0, 486(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f0, 485(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f0, 484(%zero)
	fblt	%f18, %f0, fbgt_cont.33417
	flw	%f1, 483(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.33417
fbgt_else.33436:
fbgt_cont.33437:
	j	fbgt_cont.33417
fbgt_else.33434:
fbgt_cont.33435:
	j	fbgt_cont.33417
fbgt_else.33432:
fbgt_cont.33433:
	j	fbgt_cont.33417
fbgt_else.33430:
fbgt_cont.33431:
	j	fbgt_cont.33417
fbgt_else.33428:
fbgt_cont.33429:
	j	fbgt_cont.33417
fbgt_else.33426:
fbgt_cont.33427:
	j	fbgt_cont.33417
fbgt_else.33424:
fbgt_cont.33425:
	j	fbgt_cont.33417
fbgt_else.33422:
fbgt_cont.33423:
	j	fbgt_cont.33417
fbgt_else.33420:
fbgt_cont.33421:
	j	fbgt_cont.33417
fbgt_else.33418:
fbgt_cont.33419:
	j	fbgt_cont.33417
fbgt_else.33416:
	fmov	%f0, %f24
fbgt_cont.33417:
	fblt	%f18, %f24, fbgt_else.33438
	fblt	%f18, %f0, fbgt_else.33440
	fsub	%f18, %f18, %f0
	flw	%f16, 496(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33439
	fblt	%f18, %f0, fbgt_else.33444
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33439
	fblt	%f18, %f1, fbgt_else.33448
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.33439
fbgt_else.33448:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.33449:
	j	fbgt_cont.33439
fbgt_else.33446:
fbgt_cont.33447:
	j	fbgt_cont.33439
fbgt_else.33444:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33439
	fblt	%f18, %f1, fbgt_else.33452
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.33439
fbgt_else.33452:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.33453:
	j	fbgt_cont.33439
fbgt_else.33450:
fbgt_cont.33451:
fbgt_cont.33445:
	j	fbgt_cont.33439
fbgt_else.33442:
fbgt_cont.33443:
	j	fbgt_cont.33439
fbgt_else.33440:
	flw	%f16, 496(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33439
	fblt	%f18, %f0, fbgt_else.33456
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33439
	fblt	%f18, %f1, fbgt_else.33460
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.33439
fbgt_else.33460:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.33461:
	j	fbgt_cont.33439
fbgt_else.33458:
fbgt_cont.33459:
	j	fbgt_cont.33439
fbgt_else.33456:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33439
	fblt	%f18, %f1, fbgt_else.33464
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.33439
fbgt_else.33464:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.33465:
	j	fbgt_cont.33439
fbgt_else.33462:
fbgt_cont.33463:
fbgt_cont.33457:
	j	fbgt_cont.33439
fbgt_else.33454:
fbgt_cont.33455:
fbgt_cont.33441:
	j	fbgt_cont.33439
fbgt_else.33438:
fbgt_cont.33439:
	fblt	%f18, %f22, fbgt_else.33466
	add	%a0, %zero, %zero
	j	fbgt_cont.33467
fbgt_else.33466:
	add	%a0, %zero, %k1
fbgt_cont.33467:
	fblt	%f18, %f22, fbgt_else.33468
	fsub	%f18, %f18, %f22
	j	fbgt_cont.33469
fbgt_else.33468:
fbgt_cont.33469:
	fblt	%f18, %f25, fbgt_else.33470
	beqi	%a0, 0, bnei_else.33472
	add	%a0, %zero, %zero
	j	fbgt_cont.33471
bnei_else.33472:
	add	%a0, %zero, %k1
bnei_cont.33473:
	j	fbgt_cont.33471
fbgt_else.33470:
fbgt_cont.33471:
	fblt	%f18, %f25, fbgt_else.33474
	fsub	%f18, %f22, %f18
	j	fbgt_cont.33475
fbgt_else.33474:
fbgt_cont.33475:
	fblt	%f26, %f18, fbgt_else.33476
	fmul	%f18, %f18, %f18
	fmul	%f16, %f18, %f18
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33477
fbgt_else.33476:
	fsub	%f19, %f25, %f18
	fmul	%f18, %f19, %f19
	fmul	%f16, %f18, %f18
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fsub	%f1, %f19, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.33477:
	beqi	%a0, 0, bnei_else.33478
	j	bnei_cont.33479
bnei_else.33478:
	fneg	%f0, %f0
bnei_cont.33479:
	fdiv	%f0, %f17, %f0
	fmul	%f21, %f0, %f21
	addi	%v0, %v0, 1
	fmul	%f0, %f21, %f21
	fadd	%f0, %f0, %f23
	fsqrt	%f23, %f0
	fdiv	%f0, %f30, %f23
	jal	atan.2639
	fmul	%f18, %f0, %f3
	fblt	%f18, %fzero, fbgt_else.33480
	add	%a0, %zero, %k1
	j	fbgt_cont.33481
fbgt_else.33480:
	add	%a0, %zero, %zero
fbgt_cont.33481:
	fabs	%f17, %f18
	fblt	%f17, %f24, fbgt_else.33482
	flw	%f0, 493(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f0, 492(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f0, 491(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f0, 490(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f0, 489(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f0, 488(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f0, 487(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f0, 486(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f0, 485(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f0, 484(%zero)
	fblt	%f17, %f0, fbgt_cont.33483
	flw	%f1, 483(%zero)
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.33483
fbgt_else.33502:
fbgt_cont.33503:
	j	fbgt_cont.33483
fbgt_else.33500:
fbgt_cont.33501:
	j	fbgt_cont.33483
fbgt_else.33498:
fbgt_cont.33499:
	j	fbgt_cont.33483
fbgt_else.33496:
fbgt_cont.33497:
	j	fbgt_cont.33483
fbgt_else.33494:
fbgt_cont.33495:
	j	fbgt_cont.33483
fbgt_else.33492:
fbgt_cont.33493:
	j	fbgt_cont.33483
fbgt_else.33490:
fbgt_cont.33491:
	j	fbgt_cont.33483
fbgt_else.33488:
fbgt_cont.33489:
	j	fbgt_cont.33483
fbgt_else.33486:
fbgt_cont.33487:
	j	fbgt_cont.33483
fbgt_else.33484:
fbgt_cont.33485:
	j	fbgt_cont.33483
fbgt_else.33482:
	fmov	%f0, %f24
fbgt_cont.33483:
	fblt	%f17, %f24, fbgt_else.33504
	fblt	%f17, %f0, fbgt_else.33506
	fsub	%f17, %f17, %f0
	flw	%f16, 496(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33505
	fblt	%f17, %f0, fbgt_else.33510
	fsub	%f17, %f17, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33505
	fblt	%f17, %f1, fbgt_else.33514
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.33505
fbgt_else.33514:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.33515:
	j	fbgt_cont.33505
fbgt_else.33512:
fbgt_cont.33513:
	j	fbgt_cont.33505
fbgt_else.33510:
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33505
	fblt	%f17, %f1, fbgt_else.33518
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.33505
fbgt_else.33518:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.33519:
	j	fbgt_cont.33505
fbgt_else.33516:
fbgt_cont.33517:
fbgt_cont.33511:
	j	fbgt_cont.33505
fbgt_else.33508:
fbgt_cont.33509:
	j	fbgt_cont.33505
fbgt_else.33506:
	flw	%f16, 496(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33505
	fblt	%f17, %f0, fbgt_else.33522
	fsub	%f17, %f17, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33505
	fblt	%f17, %f1, fbgt_else.33526
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.33505
fbgt_else.33526:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.33527:
	j	fbgt_cont.33505
fbgt_else.33524:
fbgt_cont.33525:
	j	fbgt_cont.33505
fbgt_else.33522:
	fdiv	%f1, %f0, %f16
	fblt	%f17, %f24, fbgt_cont.33505
	fblt	%f17, %f1, fbgt_else.33530
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
	j	fbgt_cont.33505
fbgt_else.33530:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f17
	jal	reduction_2pi_sub2.2629
	fmov	%f17, %f0
fbgt_cont.33531:
	j	fbgt_cont.33505
fbgt_else.33528:
fbgt_cont.33529:
fbgt_cont.33523:
	j	fbgt_cont.33505
fbgt_else.33520:
fbgt_cont.33521:
fbgt_cont.33507:
	j	fbgt_cont.33505
fbgt_else.33504:
fbgt_cont.33505:
	fblt	%f17, %f22, fbgt_else.33532
	beqi	%a0, 0, bnei_else.33534
	add	%a0, %zero, %zero
	j	fbgt_cont.33533
bnei_else.33534:
	add	%a0, %zero, %k1
bnei_cont.33535:
	j	fbgt_cont.33533
fbgt_else.33532:
fbgt_cont.33533:
	fblt	%f17, %f22, fbgt_else.33536
	fsub	%f17, %f17, %f22
	j	fbgt_cont.33537
fbgt_else.33536:
fbgt_cont.33537:
	fblt	%f17, %f25, fbgt_else.33538
	fsub	%f17, %f22, %f17
	j	fbgt_cont.33539
fbgt_else.33538:
fbgt_cont.33539:
	fblt	%f26, %f17, fbgt_else.33540
	fmul	%f19, %f17, %f17
	fmul	%f16, %f19, %f19
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f19
	fsub	%f1, %f17, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
	j	fbgt_cont.33541
fbgt_else.33540:
	fsub	%f0, %f25, %f17
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f17, %f1, %f0
fbgt_cont.33541:
	beqi	%a0, 0, bnei_else.33542
	j	bnei_cont.33543
bnei_else.33542:
	fneg	%f17, %f17
bnei_cont.33543:
	fabs	%f18, %f18
	fblt	%f18, %f24, fbgt_else.33544
	flw	%f0, 493(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f0, 492(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f0, 491(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f0, 490(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f0, 489(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f0, 488(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f0, 487(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f0, 486(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f0, 485(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f0, 484(%zero)
	fblt	%f18, %f0, fbgt_cont.33545
	flw	%f1, 483(%zero)
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626
	j	fbgt_cont.33545
fbgt_else.33564:
fbgt_cont.33565:
	j	fbgt_cont.33545
fbgt_else.33562:
fbgt_cont.33563:
	j	fbgt_cont.33545
fbgt_else.33560:
fbgt_cont.33561:
	j	fbgt_cont.33545
fbgt_else.33558:
fbgt_cont.33559:
	j	fbgt_cont.33545
fbgt_else.33556:
fbgt_cont.33557:
	j	fbgt_cont.33545
fbgt_else.33554:
fbgt_cont.33555:
	j	fbgt_cont.33545
fbgt_else.33552:
fbgt_cont.33553:
	j	fbgt_cont.33545
fbgt_else.33550:
fbgt_cont.33551:
	j	fbgt_cont.33545
fbgt_else.33548:
fbgt_cont.33549:
	j	fbgt_cont.33545
fbgt_else.33546:
fbgt_cont.33547:
	j	fbgt_cont.33545
fbgt_else.33544:
	fmov	%f0, %f24
fbgt_cont.33545:
	fblt	%f18, %f24, fbgt_else.33566
	fblt	%f18, %f0, fbgt_else.33568
	fsub	%f18, %f18, %f0
	flw	%f16, 496(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33567
	fblt	%f18, %f0, fbgt_else.33572
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33567
	fblt	%f18, %f1, fbgt_else.33576
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.33567
fbgt_else.33576:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.33577:
	j	fbgt_cont.33567
fbgt_else.33574:
fbgt_cont.33575:
	j	fbgt_cont.33567
fbgt_else.33572:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33567
	fblt	%f18, %f1, fbgt_else.33580
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.33567
fbgt_else.33580:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.33581:
	j	fbgt_cont.33567
fbgt_else.33578:
fbgt_cont.33579:
fbgt_cont.33573:
	j	fbgt_cont.33567
fbgt_else.33570:
fbgt_cont.33571:
	j	fbgt_cont.33567
fbgt_else.33568:
	flw	%f16, 496(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33567
	fblt	%f18, %f0, fbgt_else.33584
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33567
	fblt	%f18, %f1, fbgt_else.33588
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.33567
fbgt_else.33588:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.33589:
	j	fbgt_cont.33567
fbgt_else.33586:
fbgt_cont.33587:
	j	fbgt_cont.33567
fbgt_else.33584:
	fdiv	%f1, %f0, %f16
	fblt	%f18, %f24, fbgt_cont.33567
	fblt	%f18, %f1, fbgt_else.33592
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
	j	fbgt_cont.33567
fbgt_else.33592:
	fdiv	%f1, %f1, %f16
	fmov	%f2, %f24
	fmov	%f0, %f18
	jal	reduction_2pi_sub2.2629
	fmov	%f18, %f0
fbgt_cont.33593:
	j	fbgt_cont.33567
fbgt_else.33590:
fbgt_cont.33591:
fbgt_cont.33585:
	j	fbgt_cont.33567
fbgt_else.33582:
fbgt_cont.33583:
fbgt_cont.33569:
	j	fbgt_cont.33567
fbgt_else.33566:
fbgt_cont.33567:
	fblt	%f18, %f22, fbgt_else.33594
	add	%a0, %zero, %zero
	j	fbgt_cont.33595
fbgt_else.33594:
	add	%a0, %zero, %k1
fbgt_cont.33595:
	fblt	%f18, %f22, fbgt_else.33596
	fsub	%f18, %f18, %f22
	j	fbgt_cont.33597
fbgt_else.33596:
fbgt_cont.33597:
	fblt	%f18, %f25, fbgt_else.33598
	beqi	%a0, 0, bnei_else.33600
	add	%a0, %zero, %zero
	j	fbgt_cont.33599
bnei_else.33600:
	add	%a0, %zero, %k1
bnei_cont.33601:
	j	fbgt_cont.33599
fbgt_else.33598:
fbgt_cont.33599:
	fblt	%f18, %f25, fbgt_else.33602
	fsub	%f18, %f22, %f18
	j	fbgt_cont.33603
fbgt_else.33602:
fbgt_cont.33603:
	fblt	%f26, %f18, fbgt_else.33604
	fmul	%f18, %f18, %f18
	fmul	%f16, %f18, %f18
	flw	%f0, 473(%zero)
	fmul	%f0, %f0, %f18
	fsub	%f1, %f30, %f0
	flw	%f0, 472(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 471(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33605
fbgt_else.33604:
	fsub	%f19, %f25, %f18
	fmul	%f16, %f19, %f19
	fmul	%f18, %f16, %f16
	flw	%f0, 477(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fsub	%f1, %f19, %f0
	flw	%f0, 476(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f18
	fadd	%f1, %f1, %f0
	flw	%f0, 475(%zero)
	fmul	%f0, %f0, %f19
	fmul	%f0, %f0, %f16
	fmul	%f0, %f0, %f18
	fsub	%f0, %f1, %f0
fbgt_cont.33605:
	beqi	%a0, 0, bnei_else.33606
	j	bnei_cont.33607
bnei_else.33606:
	fneg	%f0, %f0
bnei_cont.33607:
	fdiv	%f0, %f17, %f0
	fmul	%f1, %f0, %f23
	add	%ra, %zero, %a2
	addi	%a0, %a1, 0
	fmov	%f2, %f20
	fmov	%f0, %f21
	j	calc_dirvec.3083
calc_dirvecs.3091:
	fmov	%f3, %f0
	add	%k0, %zero, %v0
	add	%s0, %zero, %a0
	add	%s1, %zero, %ra
	blti	%k0, 0, bgti_else.33642
	itof	%f0, %k0
	flw	%f27, 467(%zero)
	fmul	%f0, %f0, %f27
	flw	%f28, 436(%zero)
	fsub	%f2, %f0, %f28
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	itof	%f0, %k0
	fmul	%f0, %f0, %f27
	flw	%f29, 439(%zero)
	fadd	%f2, %f0, %f29
	addi	%s2, %s0, 2
	addi	%a0, %s2, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	addi	%k0, %k0, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.33643
	addi	%v1, %v1, -5
	j	bgti_cont.33644
bgti_else.33643:
bgti_cont.33644:
	blti	%k0, 0, bgti_else.33645
	itof	%f0, %k0
	fmul	%f0, %f0, %f27
	fsub	%f2, %f0, %f28
	addi	%a0, %s0, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	itof	%f0, %k0
	fmul	%f0, %f0, %f27
	fadd	%f2, %f0, %f29
	addi	%a0, %s2, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	jal	calc_dirvec.3083
	addi	%v0, %k0, -1
	addi	%v1, %v1, 1
	blti	%v1, 5, bgti_else.33646
	addi	%v1, %v1, -5
	j	bgti_cont.33647
bgti_else.33646:
bgti_cont.33647:
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0
	fmov	%f0, %f3
	j	calc_dirvecs.3091
bgti_else.33645:
	add	%ra, %zero, %s1
	jr	%ra
bgti_else.33642:
	add	%ra, %zero, %s1
	jr	%ra
calc_dirvec_rows.3096:
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1
	add	%s5, %zero, %a0
	fsw	%f5, 0(%sp)
	fsw	%f4, 1(%sp)
	add	%s6, %zero, %ra
	blti	%s3, 0, bgti_else.33710
	itof	%f0, %s3
	flw	%f4, 467(%zero)
	fmul	%f0, %f0, %f4
	flw	%f5, 436(%zero)
	fsub	%f3, %f0, %f5
	addi	%s7, %zero, 4
	itof	%f0, %s7
	fmul	%f0, %f0, %f4
	fsub	%f2, %f0, %f5
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	calc_dirvec.3083
	addi	%sp, %sp, -2
	itof	%f0, %s7
	fmul	%f1, %f0, %f4
	flw	%f0, 439(%zero)
	fadd	%f2, %f1, %f0
	addi	%a0, %s5, 2
	addi	%v1, %s4, 0
	addi	%v0, %zero, 0
	fmov	%f1, %fzero
	fmov	%f0, %fzero
	addi	%sp, %sp, 2
	jal	calc_dirvec.3083
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3
	addi	%v1, %s4, 1
	blti	%v1, 5, bgti_else.33711
	addi	%v1, %v1, -5
	j	bgti_cont.33712
bgti_else.33711:
bgti_cont.33712:
	addi	%a0, %s5, 0
	fmov	%f0, %f3
	addi	%sp, %sp, 2
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -2
	addi	%t7, %s3, -1
	addi	%s3, %s4, 2
	blti	%s3, 5, bgti_else.33713
	addi	%s3, %s3, -5
	j	bgti_cont.33714
bgti_else.33713:
bgti_cont.33714:
	addi	%s4, %s5, 4
	blti	%t7, 0, bgti_else.33715
	itof	%f0, %t7
	fmul	%f0, %f0, %f4
	fsub	%f0, %f0, %f5
	addi	%a0, %s4, 0
	addi	%v1, %s3, 0
	addi	%v0, %s7, 0
	addi	%sp, %sp, 2
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -2
	addi	%v0, %t7, -1
	addi	%v1, %s3, 2
	blti	%v1, 5, bgti_else.33716
	addi	%v1, %v1, -5
	j	bgti_cont.33717
bgti_else.33716:
bgti_cont.33717:
	addi	%a0, %s4, 4
	flw	%f5, 0(%sp)
	flw	%f4, 1(%sp)
	add	%ra, %zero, %s6
	j	calc_dirvec_rows.3096
bgti_else.33715:
	flw	%f5, 0(%sp)
	flw	%f4, 1(%sp)
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.33710:
	add	%ra, %zero, %s6
	jr	%ra
create_dirvec_elements.3102:
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1
	add	%a3, %zero, %ra
	blti	%a2, 0, bgti_else.33756
	addi	%k0, %zero, 3
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%s0, %v0, 0
	lw	%s1, 0(%zero)
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%s0, 0(%a0)
	add	%at, %a1, %a2
	sw	%a0, 0(%at)
	addi	%s0, %a2, -1
	blti	%s0, 0, bgti_else.33757
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a2, 0(%a0)
	add	%at, %a1, %s0
	sw	%a0, 0(%at)
	addi	%s0, %s0, -1
	blti	%s0, 0, bgti_else.33758
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a2, 0(%a0)
	add	%at, %a1, %s0
	sw	%a0, 0(%at)
	addi	%s0, %s0, -1
	blti	%s0, 0, bgti_else.33759
	addi	%v0, %k0, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a2, %v0, 0
	addi	%v1, %a2, 0
	addi	%v0, %s1, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a2, 0(%a0)
	add	%at, %a1, %s0
	sw	%a0, 0(%at)
	addi	%v1, %s0, -1
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0
	j	create_dirvec_elements.3102
bgti_else.33759:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.33758:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.33757:
	add	%ra, %zero, %a3
	jr	%ra
bgti_else.33756:
	add	%ra, %zero, %a3
	jr	%ra
create_dirvecs.3105:
	add	%s2, %zero, %v0
	add	%s3, %zero, %ra
	blti	%s2, 0, bgti_else.33792
	addi	%s6, %zero, 120
	addi	%s4, %zero, 3
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	lw	%s5, 0(%zero)
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %s6, 0
	jal	min_caml_create_array
	sw	%v0, 179(%s2)
	lw	%a2, 179(%s2)
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 118(%a2)
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 117(%a2)
	addi	%s7, %zero, 116
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 116(%a2)
	addi	%v1, %zero, 115
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3102
	addi	%s2, %s2, -1
	blti	%s2, 0, bgti_else.33793
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %s6, 0
	jal	min_caml_create_array
	sw	%v0, 179(%s2)
	lw	%a2, 179(%s2)
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 118(%a2)
	addi	%v0, %s4, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0
	jal	min_caml_create_array
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%a0)
	sw	%a1, 0(%a0)
	sw	%a0, 117(%a2)
	addi	%v1, %s7, 0
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3102
	addi	%v0, %s2, -1
	add	%ra, %zero, %s3
	j	create_dirvecs.3105
bgti_else.33793:
	add	%ra, %zero, %s3
	jr	%ra
bgti_else.33792:
	add	%ra, %zero, %s3
	jr	%ra
init_dirvec_constants.3107:
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1
	add	%s6, %zero, %ra
	blti	%s5, 0, bgti_else.33847
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	lw	%a0, 0(%zero)
	addi	%s7, %a0, -1
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.33848
	add	%at, %s4, %s5
	lw	%s0, 0(%at)
	blti	%s7, 0, bgti_else.33849
	lw	%a0, 12(%s7)
	lw	%s1, 1(%s0)
	lw	%a1, 0(%s0)
	lw	%a2, 1(%a0)
	beqi	%a2, 1, bnei_else.33851
	beqi	%a2, 2, bnei_else.33853
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_second_table.2886
	add	%at, %s1, %s7
	sw	%v0, 0(%at)
	j	bnei_cont.33852
bnei_else.33853:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%a1)
	lw	%a2, 4(%a0)
	flw	%f0, 0(%a2)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a1)
	lw	%a2, 4(%a0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a1)
	lw	%a1, 4(%a0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.33855
	add	%a1, %zero, %zero
	j	fbgt_cont.33856
fbgt_else.33855:
	add	%a1, %zero, %k1
fbgt_cont.33856:
	beqi	%a1, 0, bnei_else.33857
	flw	%f0, 458(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 0(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 1(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a0)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.33858
bnei_else.33857:
	fsw	%fzero, 0(%v0)
bnei_cont.33858:
	add	%at, %s1, %s7
	sw	%v0, 0(%at)
bnei_cont.33854:
	j	bnei_cont.33852
bnei_else.33851:
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_rect_table.2880
	add	%at, %s1, %s7
	sw	%v0, 0(%at)
bnei_cont.33852:
	addi	%v1, %s7, -1
	addi	%v0, %s0, 0
	jal	iter_setup_dirvec_constants.2889
	j	bgti_cont.33850
bgti_else.33849:
bgti_cont.33850:
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.33859
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%s5, %s5, -1
	blti	%s5, 0, bgti_else.33860
	add	%at, %s4, %s5
	lw	%v0, 0(%at)
	jal	setup_dirvec_constants.2892
	addi	%v1, %s5, -1
	add	%ra, %zero, %s6
	addi	%v0, %s4, 0
	j	init_dirvec_constants.3107
bgti_else.33860:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.33859:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.33848:
	add	%ra, %zero, %s6
	jr	%ra
bgti_else.33847:
	add	%ra, %zero, %s6
	jr	%ra
init_vecset_constants.3110:
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra
	blti	%t7, 0, bgti_else.33950
	lw	%s4, 179(%t7)
	addi	%a0, %zero, 119
	lw	%s0, 119(%s4)
	lw	%a0, 0(%zero)
	addi	%t9, %a0, -1
	blti	%t9, 0, bgti_else.33951
	lw	%a0, 12(%t9)
	lw	%s1, 1(%s0)
	lw	%a1, 0(%s0)
	lw	%a2, 1(%a0)
	beqi	%a2, 1, bnei_else.33953
	beqi	%a2, 2, bnei_else.33955
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_second_table.2886
	add	%at, %s1, %t9
	sw	%v0, 0(%at)
	j	bnei_cont.33954
bnei_else.33955:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	flw	%f1, 0(%a1)
	lw	%a2, 4(%a0)
	flw	%f0, 0(%a2)
	fmul	%f16, %f1, %f0
	flw	%f1, 1(%a1)
	lw	%a2, 4(%a0)
	flw	%f0, 1(%a2)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 2(%a1)
	lw	%a1, 4(%a0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.33957
	add	%a1, %zero, %zero
	j	fbgt_cont.33958
fbgt_else.33957:
	add	%a1, %zero, %k1
fbgt_cont.33958:
	beqi	%a1, 0, bnei_else.33959
	flw	%f0, 458(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 0(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 1(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a0)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.33960
bnei_else.33959:
	fsw	%fzero, 0(%v0)
bnei_cont.33960:
	add	%at, %s1, %t9
	sw	%v0, 0(%at)
bnei_cont.33956:
	j	bnei_cont.33954
bnei_else.33953:
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0
	jal	setup_rect_table.2880
	add	%at, %s1, %t9
	sw	%v0, 0(%at)
bnei_cont.33954:
	addi	%v1, %t9, -1
	addi	%v0, %s0, 0
	jal	iter_setup_dirvec_constants.2889
	j	bgti_cont.33952
bgti_else.33951:
bgti_cont.33952:
	addi	%a0, %zero, 118
	lw	%v0, 118(%s4)
	addi	%v1, %t9, 0
	jal	iter_setup_dirvec_constants.2889
	addi	%a0, %zero, 117
	lw	%v0, 117(%s4)
	jal	setup_dirvec_constants.2892
	addi	%v1, %zero, 116
	addi	%v0, %s4, 0
	jal	init_dirvec_constants.3107
	addi	%t7, %t7, -1
	blti	%t7, 0, bgti_else.33961
	lw	%s4, 179(%t7)
	lw	%v0, 119(%s4)
	addi	%v1, %t9, 0
	jal	iter_setup_dirvec_constants.2889
	lw	%v0, 118(%s4)
	jal	setup_dirvec_constants.2892
	addi	%v1, %zero, 117
	addi	%v0, %s4, 0
	jal	init_dirvec_constants.3107
	addi	%t7, %t7, -1
	blti	%t7, 0, bgti_else.33962
	lw	%s4, 179(%t7)
	lw	%v0, 119(%s4)
	jal	setup_dirvec_constants.2892
	addi	%v1, %zero, 118
	addi	%v0, %s4, 0
	jal	init_dirvec_constants.3107
	addi	%t7, %t7, -1
	blti	%t7, 0, bgti_else.33963
	lw	%v0, 179(%t7)
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3107
	addi	%v0, %t7, -1
	add	%ra, %zero, %t8
	j	init_vecset_constants.3110
bgti_else.33963:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.33962:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.33961:
	add	%ra, %zero, %t8
	jr	%ra
bgti_else.33950:
	add	%ra, %zero, %t8
	jr	%ra
setup_reflections.3127:
	add	%s4, %zero, %ra
	blti	%v0, 0, bgti_else.34042
	lw	%a1, 12(%v0)
	lw	%a0, 2(%a1)
	beqi	%a0, 2, bnei_else.34043
	add	%ra, %zero, %s4
	jr	%ra
bnei_else.34043:
	lw	%a0, 7(%a1)
	flw	%f0, 0(%a0)
	fblt	%f0, %f30, fbgt_else.34045
	add	%a0, %zero, %zero
	j	fbgt_cont.34046
fbgt_else.34045:
	add	%a0, %zero, %k1
fbgt_cont.34046:
	beqi	%a0, 0, bnei_else.34047
	lw	%a0, 1(%a1)
	beqi	%a0, 1, bnei_else.34048
	beqi	%a0, 2, bnei_else.34049
	add	%ra, %zero, %s4
	jr	%ra
bnei_else.34049:
	sll	%a0, %v0, 2
	addi	%s5, %a0, 1
	lw	%s6, 434(%zero)
	lw	%a0, 7(%a1)
	flw	%f0, 0(%a0)
	fsub	%f23, %f30, %f0
	lw	%a0, 4(%a1)
	flw	%f17, 78(%zero)
	flw	%f0, 0(%a0)
	fmul	%f1, %f17, %f0
	flw	%f16, 79(%zero)
	flw	%f0, 1(%a0)
	fmul	%f0, %f16, %f0
	fadd	%f1, %f1, %f0
	flw	%f19, 80(%zero)
	flw	%f0, 2(%a0)
	fmul	%f0, %f19, %f0
	fadd	%f18, %f1, %f0
	flw	%f1, 496(%zero)
	lw	%a0, 4(%a1)
	flw	%f0, 0(%a0)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fsub	%f17, %f0, %f17
	lw	%a0, 4(%a1)
	flw	%f0, 1(%a0)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fsub	%f16, %f0, %f16
	lw	%a0, 4(%a1)
	flw	%f0, 2(%a0)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fsub	%f1, %f0, %f19
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_array
	addi	%a1, %v0, 0
	lw	%a2, 0(%zero)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	jal	min_caml_create_array
	add	%s7, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s7)
	sw	%a1, 0(%s7)
	fsw	%f17, 0(%a1)
	fsw	%f16, 1(%a1)
	fsw	%f1, 2(%a1)
	addi	%v1, %a2, -1
	addi	%v0, %s7, 0
	jal	iter_setup_dirvec_constants.2889
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f23, 2(%a0)
	sw	%s7, 1(%a0)
	sw	%s5, 0(%a0)
	sw	%a0, 254(%s6)
	addi	%a0, %s6, 1
	add	%ra, %zero, %s4
	sw	%a0, 434(%zero)
	jr	%ra
bnei_else.34048:
	sll	%s7, %v0, 2
	lw	%t7, 434(%zero)
	lw	%a0, 7(%a1)
	flw	%f0, 0(%a0)
	fsub	%f28, %f30, %f0
	flw	%f1, 78(%zero)
	fneg	%f27, %f1
	flw	%f26, 79(%zero)
	fneg	%f25, %f26
	flw	%f24, 80(%zero)
	fneg	%f23, %f24
	addi	%a0, %s7, 1
	sw	%a0, 0(%sp)
	addi	%s5, %zero, 3
	addi	%v0, %s5, 0
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	lw	%s6, 0(%zero)
	addi	%v1, %a1, 0
	addi	%v0, %s6, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	add	%t8, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t8)
	sw	%a1, 0(%t8)
	fsw	%f1, 0(%a1)
	fsw	%f25, 1(%a1)
	fsw	%f23, 2(%a1)
	addi	%t9, %s6, -1
	addi	%v1, %t9, 0
	addi	%v0, %t8, 0
	addi	%sp, %sp, 1
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -1
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f28, 2(%a0)
	sw	%t8, 1(%a0)
	lw	%a1, 0(%sp)
	sw	%a1, 0(%a0)
	sw	%a0, 254(%t7)
	addi	%a0, %t7, 1
	sw	%a0, 1(%sp)
	addi	%a0, %s7, 2
	sw	%a0, 2(%sp)
	addi	%v0, %s5, 0
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s6, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	add	%t8, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%t8)
	sw	%a1, 0(%t8)
	fsw	%f27, 0(%a1)
	fsw	%f26, 1(%a1)
	fsw	%f23, 2(%a1)
	addi	%v1, %t9, 0
	addi	%v0, %t8, 0
	addi	%sp, %sp, 3
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -3
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f28, 2(%a0)
	sw	%t8, 1(%a0)
	lw	%a1, 2(%sp)
	sw	%a1, 0(%a0)
	lw	%a1, 1(%sp)
	sw	%a0, 254(%a1)
	addi	%t8, %t7, 2
	addi	%s7, %s7, 3
	addi	%v0, %s5, 0
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	addi	%v1, %a1, 0
	addi	%v0, %s6, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	add	%s5, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%s5)
	sw	%a1, 0(%s5)
	fsw	%f27, 0(%a1)
	fsw	%f25, 1(%a1)
	fsw	%f24, 2(%a1)
	addi	%v1, %t9, 0
	addi	%v0, %s5, 0
	addi	%sp, %sp, 3
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -3
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3
	fsw	%f28, 2(%a0)
	sw	%s5, 1(%a0)
	sw	%s7, 0(%a0)
	sw	%a0, 254(%t8)
	addi	%a0, %t7, 3
	add	%ra, %zero, %s4
	sw	%a0, 434(%zero)
	jr	%ra
bnei_else.34047:
	add	%ra, %zero, %s4
	jr	%ra
bgti_else.34042:
	add	%ra, %zero, %s4
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%v1, %k1, 0
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a2, %zero, 60
	sw	%v0, 11(%zero)
	sw	%v0, 10(%zero)
	sw	%v0, 9(%zero)
	sw	%v0, 8(%zero)
	sw	%zero, 7(%zero)
	sw	%v0, 6(%zero)
	sw	%v0, 5(%zero)
	sw	%zero, 4(%zero)
	sw	%zero, 3(%zero)
	sw	%zero, 2(%zero)
	sw	%zero, 1(%zero)
	addi	%a0, %zero, 12
	addi	%v1, %k1, 0
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	addi	%v0, %zero, 3
	addi	%v1, %zero, 72
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 75
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 78
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	flw	%f0, 449(%zero)
	addi	%v1, %zero, 81
	addi	%v0, %k1, 0
	jal	min_caml_create_float_extarray
	addi	%a3, %zero, 50
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray
	lw	%v1, 83(%zero)
	addi	%a0, %zero, 133
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 135
	addi	%v0, %k1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 136
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	flw	%f0, 443(%zero)
	addi	%v1, %zero, 137
	addi	%v0, %k1, 0
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 138
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a0, %zero, 141
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 142
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 145
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 148
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 151
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v0, %zero, 2
	addi	%a0, %zero, 154
	addi	%v1, %zero, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 156
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	jal	min_caml_create_extarray
	addi	%v1, %zero, 158
	addi	%v0, %k1, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 159
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 162
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 165
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 168
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 171
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 174
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a3, %v0, 0
	addi	%a0, %zero, 177
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	sw	%v0, 178(%zero)
	sw	%a3, 177(%zero)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179
	jal	min_caml_create_extarray
	addi	%v1, %zero, 184
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%v1, %zero, 184
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a3, %v0, 0
	addi	%a0, %zero, 187
	addi	%v1, %zero, 184
	addi	%v0, %a2, 0
	jal	min_caml_create_extarray
	sw	%v0, 248(%zero)
	sw	%a3, 247(%zero)
	addi	%v1, %zero, 249
	addi	%v0, %zero, 0
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray
	addi	%a2, %v0, 0
	addi	%a0, %zero, 249
	addi	%v1, %zero, 249
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray
	addi	%a0, %zero, 249
	sw	%v0, 250(%zero)
	sw	%a2, 249(%zero)
	addi	%v0, %zero, 180
	fsw	%fzero, 253(%zero)
	sw	%a0, 252(%zero)
	sw	%zero, 251(%zero)
	addi	%a0, %zero, 254
	addi	%v1, %zero, 251
	jal	min_caml_create_extarray
	addi	%a0, %zero, 434
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray
	addi	%a1, %zero, 128
	sw	%a1, 154(%zero)
	sw	%a1, 155(%zero)
	addi	%a0, %zero, 64
	sw	%a0, 156(%zero)
	sw	%a0, 157(%zero)
	flw	%f1, 435(%zero)
	itof	%f0, %a1
	fdiv	%f0, %f1, %f0
	fsw	%f0, 158(%zero)
	lw	%a0, 154(%zero)
	sw	%a0, 0(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%a2)
	addi	%a0, %zero, 4
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%a2)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array
	addi	%sp, %sp, -1
	sw	%v0, 4(%a0)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v1)
	sw	%s2, 6(%v1)
	sw	%s1, 5(%v1)
	sw	%s0, 4(%v1)
	sw	%k0, 3(%v1)
	sw	%a3, 2(%v1)
	sw	%a2, 1(%v1)
	sw	%a1, 0(%v1)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_create_array
	addi	%sp, %sp, -1
	addi	%s6, %v0, 0
	lw	%a0, 0(%sp)
	addi	%a0, %a0, -2
	sw	%a0, 1(%sp)
	blti	%a0, 0, bgti_else.34269
	addi	%sp, %sp, 2
	jal	create_pixel.3071
	addi	%sp, %sp, -2
	lw	%a0, 1(%sp)
	add	%at, %s6, %a0
	sw	%v0, 0(%at)
	addi	%v1, %a0, -1
	addi	%v0, %s6, 0
	addi	%sp, %sp, 2
	jal	init_line_elements.3073
	addi	%sp, %sp, -2
	addi	%s6, %v0, 0
	j	bgti_cont.34270
bgti_else.34269:
bgti_cont.34270:
	sw	%s6, 2(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%a2)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array
	addi	%sp, %sp, -3
	sw	%v0, 4(%a0)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v1)
	sw	%s2, 6(%v1)
	sw	%s1, 5(%v1)
	sw	%s0, 4(%v1)
	sw	%k0, 3(%v1)
	sw	%a3, 2(%v1)
	sw	%a2, 1(%v1)
	sw	%a1, 0(%v1)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_array
	addi	%sp, %sp, -3
	addi	%s6, %v0, 0
	lw	%a0, 1(%sp)
	blti	%a0, 0, bgti_else.34271
	addi	%sp, %sp, 3
	jal	create_pixel.3071
	addi	%sp, %sp, -3
	lw	%a0, 1(%sp)
	add	%at, %s6, %a0
	sw	%v0, 0(%at)
	addi	%v1, %a0, -1
	addi	%v0, %s6, 0
	addi	%sp, %sp, 3
	jal	init_line_elements.3073
	addi	%sp, %sp, -3
	addi	%s6, %v0, 0
	j	bgti_cont.34272
bgti_else.34271:
bgti_cont.34272:
	sw	%s6, 3(%sp)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%a2)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%a2)
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%s0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%s1)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%s1)
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 1(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 2(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 3(%a0)
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 4
	jal	min_caml_create_float_array
	addi	%sp, %sp, -4
	sw	%v0, 4(%a0)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%a0, 7(%v1)
	sw	%s2, 6(%v1)
	sw	%s1, 5(%v1)
	sw	%s0, 4(%v1)
	sw	%k0, 3(%v1)
	sw	%a3, 2(%v1)
	sw	%a2, 1(%v1)
	sw	%a1, 0(%v1)
	lw	%v0, 0(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_array
	addi	%sp, %sp, -4
	addi	%s6, %v0, 0
	lw	%a0, 1(%sp)
	blti	%a0, 0, bgti_else.34273
	addi	%sp, %sp, 4
	jal	create_pixel.3071
	addi	%sp, %sp, -4
	lw	%a0, 1(%sp)
	add	%at, %s6, %a0
	sw	%v0, 0(%at)
	addi	%v1, %a0, -1
	addi	%v0, %s6, 0
	addi	%sp, %sp, 4
	jal	init_line_elements.3073
	addi	%sp, %sp, -4
	addi	%s6, %v0, 0
	j	bgti_cont.34274
bgti_else.34273:
bgti_cont.34274:
	sw	%s6, 4(%sp)
	addi	%sp, %sp, 5
	jal	read_screen_settings.2775
	addi	%sp, %sp, -5
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	flw	%f20, 461(%zero)
	fmul	%f19, %f0, %f20
	fmov	%f0, %f19
	addi	%sp, %sp, 5
	jal	sin.2637
	addi	%sp, %sp, -5
	fneg	%f0, %f0
	fsw	%f0, 79(%zero)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	fmul	%f20, %f0, %f20
	fmov	%f0, %f19
	addi	%sp, %sp, 5
	jal	cos.2635
	addi	%sp, %sp, -5
	fmov	%f19, %f0
	fmov	%f0, %f20
	addi	%sp, %sp, 5
	jal	sin.2637
	addi	%sp, %sp, -5
	fmul	%f0, %f19, %f0
	fsw	%f0, 78(%zero)
	fmov	%f0, %f20
	addi	%sp, %sp, 5
	jal	cos.2635
	addi	%sp, %sp, -5
	fmul	%f0, %f19, %f0
	fsw	%f0, 80(%zero)
	addi	%sp, %sp, 5
	jal	min_caml_read_float
	addi	%sp, %sp, -5
	fsw	%f0, 81(%zero)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	read_nth_object.2782
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.34275
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	read_nth_object.2782
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.34277
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5
	jal	read_nth_object.2782
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.34279
	addi	%v0, %zero, 3
	addi	%sp, %sp, 5
	jal	read_nth_object.2782
	addi	%sp, %sp, -5
	beqi	%v0, 0, bnei_else.34281
	addi	%v0, %zero, 4
	addi	%sp, %sp, 5
	jal	read_object.2784
	addi	%sp, %sp, -5
	j	bnei_cont.34276
bnei_else.34281:
	addi	%a0, %zero, 3
	sw	%a0, 0(%zero)
bnei_cont.34282:
	j	bnei_cont.34276
bnei_else.34279:
	addi	%a0, %zero, 2
	sw	%a0, 0(%zero)
bnei_cont.34280:
	j	bnei_cont.34276
bnei_else.34277:
	sw	%k1, 0(%zero)
bnei_cont.34278:
	j	bnei_cont.34276
bnei_else.34275:
	sw	%zero, 0(%zero)
bnei_cont.34276:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	read_net_item.2788
	addi	%sp, %sp, -5
	lw	%a0, 0(%v0)
	beqi	%a0, -1, bnei_else.34283
	sw	%v0, 83(%zero)
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	read_and_network.2792
	addi	%sp, %sp, -5
	j	bnei_cont.34284
bnei_else.34283:
bnei_cont.34284:
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5
	jal	read_net_item.2788
	addi	%sp, %sp, -5
	addi	%s1, %v0, 0
	lw	%a0, 0(%s1)
	beqi	%a0, -1, bnei_else.34285
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	read_or_network.2790
	addi	%sp, %sp, -5
	sw	%s1, 0(%v0)
	j	bnei_cont.34286
bnei_else.34285:
	addi	%v1, %s1, 0
	addi	%v0, %k1, 0
	addi	%sp, %sp, 5
	jal	min_caml_create_array
	addi	%sp, %sp, -5
bnei_cont.34286:
	sw	%v0, 134(%zero)
	addi	%sp, %sp, 5
	jal	write_ppm_header.3037
	addi	%sp, %sp, -5
	addi	%a2, %zero, 120
	addi	%v0, %zero, 3
	fmov	%f0, %fzero
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0
	lw	%v0, 0(%zero)
	sw	%v0, 5(%sp)
	addi	%v1, %a1, 0
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)
	sw	%a1, 0(%v1)
	addi	%v0, %a2, 0
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	sw	%v0, 183(%zero)
	lw	%t8, 183(%zero)
	addi	%v1, %zero, 118
	addi	%v0, %t8, 0
	addi	%sp, %sp, 6
	jal	create_dirvec_elements.3102
	addi	%sp, %sp, -6
	addi	%v0, %zero, 3
	addi	%sp, %sp, 6
	jal	create_dirvecs.3105
	addi	%sp, %sp, -6
	addi	%a0, %zero, 9
	itof	%f1, %a0
	flw	%f0, 467(%zero)
	fmul	%f1, %f1, %f0
	flw	%f0, 436(%zero)
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 4
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0
	addi	%sp, %sp, 6
	jal	calc_dirvecs.3091
	addi	%sp, %sp, -6
	addi	%v0, %zero, 8
	addi	%a0, %zero, 4
	addi	%v1, %zero, 2
	addi	%sp, %sp, 6
	jal	calc_dirvec_rows.3096
	addi	%sp, %sp, -6
	addi	%v1, %zero, 119
	addi	%v0, %t8, 0
	addi	%sp, %sp, 6
	jal	init_dirvec_constants.3107
	addi	%sp, %sp, -6
	addi	%v0, %zero, 3
	addi	%sp, %sp, 6
	jal	init_vecset_constants.3110
	addi	%sp, %sp, -6
	flw	%f0, 78(%zero)
	fsw	%f0, 184(%zero)
	flw	%f0, 79(%zero)
	fsw	%f0, 185(%zero)
	flw	%f0, 80(%zero)
	fsw	%f0, 186(%zero)
	lw	%a0, 5(%sp)
	addi	%s4, %a0, -1
	blti	%s4, 0, bgti_else.34287
	lw	%a0, 12(%s4)
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.34289
	beqi	%a1, 2, bnei_else.34291
	addi	%v0, %zero, 184
	addi	%v1, %a0, 0
	addi	%sp, %sp, 6
	jal	setup_second_table.2886
	addi	%sp, %sp, -6
	sw	%v0, 187(%s4)
	j	bnei_cont.34290
bnei_else.34291:
	addi	%v0, %zero, 4
	fmov	%f0, %fzero
	addi	%sp, %sp, 6
	jal	min_caml_create_float_array
	addi	%sp, %sp, -6
	flw	%f1, 184(%zero)
	lw	%a1, 4(%a0)
	flw	%f0, 0(%a1)
	fmul	%f16, %f1, %f0
	flw	%f1, 185(%zero)
	lw	%a1, 4(%a0)
	flw	%f0, 1(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f16, %f16, %f0
	flw	%f1, 186(%zero)
	lw	%a1, 4(%a0)
	flw	%f0, 2(%a1)
	fmul	%f0, %f1, %f0
	fadd	%f1, %f16, %f0
	fblt	%fzero, %f1, fbgt_else.34293
	add	%a1, %zero, %zero
	j	fbgt_cont.34294
fbgt_else.34293:
	add	%a1, %zero, %k1
fbgt_cont.34294:
	beqi	%a1, 0, bnei_else.34295
	flw	%f0, 458(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 0(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 0(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 1(%v0)
	lw	%a1, 4(%a0)
	flw	%f0, 1(%a1)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 2(%v0)
	lw	%a0, 4(%a0)
	flw	%f0, 2(%a0)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	fsw	%f0, 3(%v0)
	j	bnei_cont.34296
bnei_else.34295:
	fsw	%fzero, 0(%v0)
bnei_cont.34296:
	sw	%v0, 187(%s4)
bnei_cont.34292:
	j	bnei_cont.34290
bnei_else.34289:
	addi	%v0, %zero, 184
	addi	%v1, %a0, 0
	addi	%sp, %sp, 6
	jal	setup_rect_table.2880
	addi	%sp, %sp, -6
	sw	%v0, 187(%s4)
bnei_cont.34290:
	addi	%v1, %s4, -1
	addi	%v0, %zero, 247
	addi	%sp, %sp, 6
	jal	iter_setup_dirvec_constants.2889
	addi	%sp, %sp, -6
	j	bgti_cont.34288
bgti_else.34287:
bgti_cont.34288:
	addi	%v0, %s4, 0
	addi	%sp, %sp, 6
	jal	setup_reflections.3127
	addi	%sp, %sp, -6
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	sub	%a0, %zero, %a0
	itof	%f0, %a0
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
	lw	%a0, 0(%sp)
	addi	%v1, %a0, -1
	lw	%v0, 3(%sp)
	addi	%a0, %zero, 0
	addi	%sp, %sp, 6
	jal	pretrace_pixels.3046
	addi	%sp, %sp, -6
	addi	%a2, %zero, 2
	lw	%a1, 4(%sp)
	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6
	jal	scan_line.3063
	addi	%sp, %sp, -6
	add	%g0, %zero, %zero
	ret
