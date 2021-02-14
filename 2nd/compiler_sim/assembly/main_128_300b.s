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
	fblt	%f0, %f1, fbgt_else.33196
	flw	%f2, 495(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33197
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33198
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33199
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33200
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33201
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33202
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33203
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33204
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33205
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33206
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33207
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33208
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33209
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33210
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.33211
	fmul	%f1, %f2, %f1
	j	reduction_2pi_sub1.2614
fbgt_else.33211:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33210:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33209:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33208:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33207:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33206:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33205:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33204:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33203:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33202:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33201:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33200:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33199:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33198:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33197:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.33196:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2617:
	fblt	%f0, %f2, fbgt_else.33212
	fblt	%f0, %f1, fbgt_else.33213
	fsub	%f0, %f0, %f1
	flw	%f3, 495(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33214
	fblt	%f0, %f1, fbgt_else.33215
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33216
	fblt	%f0, %f1, fbgt_else.33217
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33218
	fblt	%f0, %f1, fbgt_else.33219
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33219:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33218:
	jr	%ra
fbgt_else.33217:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33220
	fblt	%f0, %f1, fbgt_else.33221
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33221:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33220:
	jr	%ra
fbgt_else.33216:
	jr	%ra
fbgt_else.33215:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33222
	fblt	%f0, %f1, fbgt_else.33223
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33224
	fblt	%f0, %f1, fbgt_else.33225
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33225:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33224:
	jr	%ra
fbgt_else.33223:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33226
	fblt	%f0, %f1, fbgt_else.33227
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33227:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33226:
	jr	%ra
fbgt_else.33222:
	jr	%ra
fbgt_else.33214:
	jr	%ra
fbgt_else.33213:
	flw	%f3, 495(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33228
	fblt	%f0, %f1, fbgt_else.33229
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33230
	fblt	%f0, %f1, fbgt_else.33231
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33232
	fblt	%f0, %f1, fbgt_else.33233
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33233:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33232:
	jr	%ra
fbgt_else.33231:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33234
	fblt	%f0, %f1, fbgt_else.33235
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33235:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33234:
	jr	%ra
fbgt_else.33230:
	jr	%ra
fbgt_else.33229:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33236
	fblt	%f0, %f1, fbgt_else.33237
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33238
	fblt	%f0, %f1, fbgt_else.33239
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33239:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33238:
	jr	%ra
fbgt_else.33237:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.33240
	fblt	%f0, %f1, fbgt_else.33241
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33241:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.33240:
	jr	%ra
fbgt_else.33236:
	jr	%ra
fbgt_else.33228:
	jr	%ra
fbgt_else.33212:
	jr	%ra
print_int_sub1.2629:
	blti	%v0, 10, bgti_else.33242
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.33243
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.33244
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.33245
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.33246
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.33247
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.33248
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.33249
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2629
bgti_else.33249:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33248:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33247:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33246:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33245:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33244:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33243:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.33242:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.33250
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33251
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33252
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33253
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33254
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33255
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33256
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33257
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33258
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33259
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33260
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33261
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33262
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33263
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33264
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.33265
	addi	%v0, %v0, -10
	j	print_int_sub2.2632
bgti_else.33265:
	jr	%ra
bgti_else.33264:
	jr	%ra
bgti_else.33263:
	jr	%ra
bgti_else.33262:
	jr	%ra
bgti_else.33261:
	jr	%ra
bgti_else.33260:
	jr	%ra
bgti_else.33259:
	jr	%ra
bgti_else.33258:
	jr	%ra
bgti_else.33257:
	jr	%ra
bgti_else.33256:
	jr	%ra
bgti_else.33255:
	jr	%ra
bgti_else.33254:
	jr	%ra
bgti_else.33253:
	jr	%ra
bgti_else.33252:
	jr	%ra
bgti_else.33251:
	jr	%ra
bgti_else.33250:
	jr	%ra
rotate_quadratic_matrix.2767:
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
	fblt	%f2, %f3, fbgt_else.34389
	flw	%f4, 492(%zero)
	fblt	%f2, %f4, fbgt_else.34391
	flw	%f4, 491(%zero)
	fblt	%f2, %f4, fbgt_else.34393
	flw	%f4, 490(%zero)
	fblt	%f2, %f4, fbgt_else.34395
	flw	%f4, 489(%zero)
	fblt	%f2, %f4, fbgt_else.34397
	flw	%f4, 488(%zero)
	fblt	%f2, %f4, fbgt_else.34399
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.34401
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.34403
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.34405
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.34407
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.34409
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.34411
	flw	%f4, 481(%zero)
	fblt	%f2, %f4, fbgt_else.34413
	flw	%f4, 480(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	fbgt_cont.34390
fbgt_else.34413:
	fmov	%f0, %f4
fbgt_cont.34414:
	j	fbgt_cont.34390
fbgt_else.34411:
	fmov	%f0, %f4
fbgt_cont.34412:
	j	fbgt_cont.34390
fbgt_else.34409:
	fmov	%f0, %f4
fbgt_cont.34410:
	j	fbgt_cont.34390
fbgt_else.34407:
	fmov	%f0, %f4
fbgt_cont.34408:
	j	fbgt_cont.34390
fbgt_else.34405:
	fmov	%f0, %f4
fbgt_cont.34406:
	j	fbgt_cont.34390
fbgt_else.34403:
	fmov	%f0, %f4
fbgt_cont.34404:
	j	fbgt_cont.34390
fbgt_else.34401:
	fmov	%f0, %f4
fbgt_cont.34402:
	j	fbgt_cont.34390
fbgt_else.34399:
	fmov	%f0, %f4
fbgt_cont.34400:
	j	fbgt_cont.34390
fbgt_else.34397:
	fmov	%f0, %f4
fbgt_cont.34398:
	j	fbgt_cont.34390
fbgt_else.34395:
	fmov	%f0, %f4
fbgt_cont.34396:
	j	fbgt_cont.34390
fbgt_else.34393:
	fmov	%f0, %f4
fbgt_cont.34394:
	j	fbgt_cont.34390
fbgt_else.34391:
	fmov	%f0, %f4
fbgt_cont.34392:
	j	fbgt_cont.34390
fbgt_else.34389:
	fmov	%f0, %f3
fbgt_cont.34390:
	flw	%f1, 4(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34415
	fblt	%f1, %f0, fbgt_else.34417
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
	j	fbgt_cont.34416
fbgt_else.34417:
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
fbgt_cont.34418:
	j	fbgt_cont.34416
fbgt_else.34415:
	fmov	%f0, %f1
fbgt_cont.34416:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34419
	addi	%v0, %zero, 0
	j	fbgt_cont.34420
fbgt_else.34419:
	addi	%v0, %zero, 1
fbgt_cont.34420:
	fblt	%f0, %f1, fbgt_else.34421
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34422
fbgt_else.34421:
fbgt_cont.34422:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.34423
	beqi	%v0, 0, bnei_else.34425
	addi	%v0, %zero, 0
	j	fbgt_cont.34424
bnei_else.34425:
	addi	%v0, %zero, 1
bnei_cont.34426:
	j	fbgt_cont.34424
fbgt_else.34423:
fbgt_cont.34424:
	fblt	%f0, %f2, fbgt_else.34427
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34428
fbgt_else.34427:
fbgt_cont.34428:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.34429
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
	j	fbgt_cont.34430
fbgt_else.34429:
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
fbgt_cont.34430:
	beqi	%v0, 0, bnei_else.34431
	j	bnei_cont.34432
bnei_else.34431:
	fneg	%f0, %f0
bnei_cont.34432:
	flw	%f4, 470(%zero)
	flw	%f5, 2(%sp)
	fblt	%f5, %f4, fbgt_else.34433
	addi	%v0, %zero, 1
	j	fbgt_cont.34434
fbgt_else.34433:
	addi	%v0, %zero, 0
fbgt_cont.34434:
	fabs	%f5, %f5
	flw	%f6, 5(%sp)
	fsw	%f0, 6(%sp)
	fsw	%f4, 7(%sp)
	fsw	%f3, 8(%sp)
	fsw	%f2, 9(%sp)
	sw	%v0, 10(%sp)
	fsw	%f5, 11(%sp)
	fblt	%f5, %f6, fbgt_else.34435
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.34437
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.34439
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.34441
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.34443
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.34445
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.34447
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.34449
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.34451
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.34453
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.34455
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.34457
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.34459
	flw	%f7, 480(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.34436
fbgt_else.34459:
	fmov	%f0, %f7
fbgt_cont.34460:
	j	fbgt_cont.34436
fbgt_else.34457:
	fmov	%f0, %f7
fbgt_cont.34458:
	j	fbgt_cont.34436
fbgt_else.34455:
	fmov	%f0, %f7
fbgt_cont.34456:
	j	fbgt_cont.34436
fbgt_else.34453:
	fmov	%f0, %f7
fbgt_cont.34454:
	j	fbgt_cont.34436
fbgt_else.34451:
	fmov	%f0, %f7
fbgt_cont.34452:
	j	fbgt_cont.34436
fbgt_else.34449:
	fmov	%f0, %f7
fbgt_cont.34450:
	j	fbgt_cont.34436
fbgt_else.34447:
	fmov	%f0, %f7
fbgt_cont.34448:
	j	fbgt_cont.34436
fbgt_else.34445:
	fmov	%f0, %f7
fbgt_cont.34446:
	j	fbgt_cont.34436
fbgt_else.34443:
	fmov	%f0, %f7
fbgt_cont.34444:
	j	fbgt_cont.34436
fbgt_else.34441:
	fmov	%f0, %f7
fbgt_cont.34442:
	j	fbgt_cont.34436
fbgt_else.34439:
	fmov	%f0, %f7
fbgt_cont.34440:
	j	fbgt_cont.34436
fbgt_else.34437:
	fmov	%f0, %f7
fbgt_cont.34438:
	j	fbgt_cont.34436
fbgt_else.34435:
	fmov	%f0, %f6
fbgt_cont.34436:
	flw	%f1, 11(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34461
	fblt	%f1, %f0, fbgt_else.34463
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
	j	fbgt_cont.34462
fbgt_else.34463:
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
fbgt_cont.34464:
	j	fbgt_cont.34462
fbgt_else.34461:
	fmov	%f0, %f1
fbgt_cont.34462:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34465
	lw	%v0, 10(%sp)
	beqi	%v0, 0, bnei_else.34467
	addi	%v0, %zero, 0
	j	fbgt_cont.34466
bnei_else.34467:
	addi	%v0, %zero, 1
bnei_cont.34468:
	j	fbgt_cont.34466
fbgt_else.34465:
	lw	%v0, 10(%sp)
fbgt_cont.34466:
	fblt	%f0, %f1, fbgt_else.34469
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34470
fbgt_else.34469:
fbgt_cont.34470:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34471
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34472
fbgt_else.34471:
fbgt_cont.34472:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.34473
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
	j	fbgt_cont.34474
fbgt_else.34473:
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
fbgt_cont.34474:
	beqi	%v0, 0, bnei_else.34475
	j	bnei_cont.34476
bnei_else.34475:
	fneg	%f0, %f0
bnei_cont.34476:
	lw	%v0, 1(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f4, 13(%sp)
	fsw	%f5, 14(%sp)
	fblt	%f5, %f6, fbgt_else.34477
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.34479
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.34481
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.34483
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.34485
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.34487
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.34489
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.34491
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.34493
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.34495
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.34497
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.34499
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.34501
	flw	%f7, 480(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.34478
fbgt_else.34501:
	fmov	%f0, %f7
fbgt_cont.34502:
	j	fbgt_cont.34478
fbgt_else.34499:
	fmov	%f0, %f7
fbgt_cont.34500:
	j	fbgt_cont.34478
fbgt_else.34497:
	fmov	%f0, %f7
fbgt_cont.34498:
	j	fbgt_cont.34478
fbgt_else.34495:
	fmov	%f0, %f7
fbgt_cont.34496:
	j	fbgt_cont.34478
fbgt_else.34493:
	fmov	%f0, %f7
fbgt_cont.34494:
	j	fbgt_cont.34478
fbgt_else.34491:
	fmov	%f0, %f7
fbgt_cont.34492:
	j	fbgt_cont.34478
fbgt_else.34489:
	fmov	%f0, %f7
fbgt_cont.34490:
	j	fbgt_cont.34478
fbgt_else.34487:
	fmov	%f0, %f7
fbgt_cont.34488:
	j	fbgt_cont.34478
fbgt_else.34485:
	fmov	%f0, %f7
fbgt_cont.34486:
	j	fbgt_cont.34478
fbgt_else.34483:
	fmov	%f0, %f7
fbgt_cont.34484:
	j	fbgt_cont.34478
fbgt_else.34481:
	fmov	%f0, %f7
fbgt_cont.34482:
	j	fbgt_cont.34478
fbgt_else.34479:
	fmov	%f0, %f7
fbgt_cont.34480:
	j	fbgt_cont.34478
fbgt_else.34477:
	fmov	%f0, %f6
fbgt_cont.34478:
	flw	%f1, 14(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34503
	fblt	%f1, %f0, fbgt_else.34505
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
	j	fbgt_cont.34504
fbgt_else.34505:
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
fbgt_cont.34506:
	j	fbgt_cont.34504
fbgt_else.34503:
	fmov	%f0, %f1
fbgt_cont.34504:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34507
	addi	%v0, %zero, 0
	j	fbgt_cont.34508
fbgt_else.34507:
	addi	%v0, %zero, 1
fbgt_cont.34508:
	fblt	%f0, %f1, fbgt_else.34509
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34510
fbgt_else.34509:
fbgt_cont.34510:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34511
	beqi	%v0, 0, bnei_else.34513
	addi	%v0, %zero, 0
	j	fbgt_cont.34512
bnei_else.34513:
	addi	%v0, %zero, 1
bnei_cont.34514:
	j	fbgt_cont.34512
fbgt_else.34511:
fbgt_cont.34512:
	fblt	%f0, %f2, fbgt_else.34515
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34516
fbgt_else.34515:
fbgt_cont.34516:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.34517
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
	j	fbgt_cont.34518
fbgt_else.34517:
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
fbgt_cont.34518:
	beqi	%v0, 0, bnei_else.34519
	j	bnei_cont.34520
bnei_else.34519:
	fneg	%f0, %f0
bnei_cont.34520:
	flw	%f4, 13(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.34521
	addi	%v0, %zero, 1
	j	fbgt_cont.34522
fbgt_else.34521:
	addi	%v0, %zero, 0
fbgt_cont.34522:
	fabs	%f4, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 15(%sp)
	sw	%v0, 16(%sp)
	fsw	%f4, 17(%sp)
	fblt	%f4, %f6, fbgt_else.34523
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.34525
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.34527
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.34529
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.34531
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.34533
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.34535
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.34537
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.34539
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.34541
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.34543
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.34545
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.34547
	flw	%f7, 480(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.34524
fbgt_else.34547:
	fmov	%f0, %f7
fbgt_cont.34548:
	j	fbgt_cont.34524
fbgt_else.34545:
	fmov	%f0, %f7
fbgt_cont.34546:
	j	fbgt_cont.34524
fbgt_else.34543:
	fmov	%f0, %f7
fbgt_cont.34544:
	j	fbgt_cont.34524
fbgt_else.34541:
	fmov	%f0, %f7
fbgt_cont.34542:
	j	fbgt_cont.34524
fbgt_else.34539:
	fmov	%f0, %f7
fbgt_cont.34540:
	j	fbgt_cont.34524
fbgt_else.34537:
	fmov	%f0, %f7
fbgt_cont.34538:
	j	fbgt_cont.34524
fbgt_else.34535:
	fmov	%f0, %f7
fbgt_cont.34536:
	j	fbgt_cont.34524
fbgt_else.34533:
	fmov	%f0, %f7
fbgt_cont.34534:
	j	fbgt_cont.34524
fbgt_else.34531:
	fmov	%f0, %f7
fbgt_cont.34532:
	j	fbgt_cont.34524
fbgt_else.34529:
	fmov	%f0, %f7
fbgt_cont.34530:
	j	fbgt_cont.34524
fbgt_else.34527:
	fmov	%f0, %f7
fbgt_cont.34528:
	j	fbgt_cont.34524
fbgt_else.34525:
	fmov	%f0, %f7
fbgt_cont.34526:
	j	fbgt_cont.34524
fbgt_else.34523:
	fmov	%f0, %f6
fbgt_cont.34524:
	flw	%f1, 17(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34549
	fblt	%f1, %f0, fbgt_else.34551
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
	j	fbgt_cont.34550
fbgt_else.34551:
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
fbgt_cont.34552:
	j	fbgt_cont.34550
fbgt_else.34549:
	fmov	%f0, %f1
fbgt_cont.34550:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34553
	lw	%v0, 16(%sp)
	beqi	%v0, 0, bnei_else.34555
	addi	%v0, %zero, 0
	j	fbgt_cont.34554
bnei_else.34555:
	addi	%v0, %zero, 1
bnei_cont.34556:
	j	fbgt_cont.34554
fbgt_else.34553:
	lw	%v0, 16(%sp)
fbgt_cont.34554:
	fblt	%f0, %f1, fbgt_else.34557
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34558
fbgt_else.34557:
fbgt_cont.34558:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34559
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34560
fbgt_else.34559:
fbgt_cont.34560:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.34561
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
	j	fbgt_cont.34562
fbgt_else.34561:
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
fbgt_cont.34562:
	beqi	%v0, 0, bnei_else.34563
	j	bnei_cont.34564
bnei_else.34563:
	fneg	%f0, %f0
bnei_cont.34564:
	lw	%v0, 1(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 5(%sp)
	fsw	%f0, 18(%sp)
	fsw	%f4, 19(%sp)
	fsw	%f5, 20(%sp)
	fblt	%f5, %f6, fbgt_else.34565
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.34567
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.34569
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.34571
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.34573
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.34575
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.34577
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.34579
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.34581
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.34583
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.34585
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.34587
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.34589
	flw	%f7, 480(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	fbgt_cont.34566
fbgt_else.34589:
	fmov	%f0, %f7
fbgt_cont.34590:
	j	fbgt_cont.34566
fbgt_else.34587:
	fmov	%f0, %f7
fbgt_cont.34588:
	j	fbgt_cont.34566
fbgt_else.34585:
	fmov	%f0, %f7
fbgt_cont.34586:
	j	fbgt_cont.34566
fbgt_else.34583:
	fmov	%f0, %f7
fbgt_cont.34584:
	j	fbgt_cont.34566
fbgt_else.34581:
	fmov	%f0, %f7
fbgt_cont.34582:
	j	fbgt_cont.34566
fbgt_else.34579:
	fmov	%f0, %f7
fbgt_cont.34580:
	j	fbgt_cont.34566
fbgt_else.34577:
	fmov	%f0, %f7
fbgt_cont.34578:
	j	fbgt_cont.34566
fbgt_else.34575:
	fmov	%f0, %f7
fbgt_cont.34576:
	j	fbgt_cont.34566
fbgt_else.34573:
	fmov	%f0, %f7
fbgt_cont.34574:
	j	fbgt_cont.34566
fbgt_else.34571:
	fmov	%f0, %f7
fbgt_cont.34572:
	j	fbgt_cont.34566
fbgt_else.34569:
	fmov	%f0, %f7
fbgt_cont.34570:
	j	fbgt_cont.34566
fbgt_else.34567:
	fmov	%f0, %f7
fbgt_cont.34568:
	j	fbgt_cont.34566
fbgt_else.34565:
	fmov	%f0, %f6
fbgt_cont.34566:
	flw	%f1, 20(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34591
	fblt	%f1, %f0, fbgt_else.34593
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
	j	fbgt_cont.34592
fbgt_else.34593:
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
fbgt_cont.34594:
	j	fbgt_cont.34592
fbgt_else.34591:
	fmov	%f0, %f1
fbgt_cont.34592:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34595
	addi	%v0, %zero, 0
	j	fbgt_cont.34596
fbgt_else.34595:
	addi	%v0, %zero, 1
fbgt_cont.34596:
	fblt	%f0, %f1, fbgt_else.34597
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34598
fbgt_else.34597:
fbgt_cont.34598:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34599
	beqi	%v0, 0, bnei_else.34601
	addi	%v0, %zero, 0
	j	fbgt_cont.34600
bnei_else.34601:
	addi	%v0, %zero, 1
bnei_cont.34602:
	j	fbgt_cont.34600
fbgt_else.34599:
fbgt_cont.34600:
	fblt	%f0, %f2, fbgt_else.34603
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34604
fbgt_else.34603:
fbgt_cont.34604:
	flw	%f3, 8(%sp)
	fblt	%f3, %f0, fbgt_else.34605
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
	j	fbgt_cont.34606
fbgt_else.34605:
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
fbgt_cont.34606:
	beqi	%v0, 0, bnei_else.34607
	j	bnei_cont.34608
bnei_else.34607:
	fneg	%f0, %f0
bnei_cont.34608:
	flw	%f4, 19(%sp)
	flw	%f5, 7(%sp)
	fblt	%f4, %f5, fbgt_else.34609
	addi	%v0, %zero, 1
	j	fbgt_cont.34610
fbgt_else.34609:
	addi	%v0, %zero, 0
fbgt_cont.34610:
	fabs	%f4, %f4
	flw	%f5, 5(%sp)
	fsw	%f0, 21(%sp)
	sw	%v0, 22(%sp)
	fsw	%f4, 23(%sp)
	fblt	%f4, %f5, fbgt_else.34611
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.34613
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.34615
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.34617
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.34619
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.34621
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.34623
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.34625
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.34627
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.34629
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.34631
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.34633
	flw	%f6, 481(%zero)
	fblt	%f4, %f6, fbgt_else.34635
	flw	%f6, 480(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	fbgt_cont.34612
fbgt_else.34635:
	fmov	%f0, %f6
fbgt_cont.34636:
	j	fbgt_cont.34612
fbgt_else.34633:
	fmov	%f0, %f6
fbgt_cont.34634:
	j	fbgt_cont.34612
fbgt_else.34631:
	fmov	%f0, %f6
fbgt_cont.34632:
	j	fbgt_cont.34612
fbgt_else.34629:
	fmov	%f0, %f6
fbgt_cont.34630:
	j	fbgt_cont.34612
fbgt_else.34627:
	fmov	%f0, %f6
fbgt_cont.34628:
	j	fbgt_cont.34612
fbgt_else.34625:
	fmov	%f0, %f6
fbgt_cont.34626:
	j	fbgt_cont.34612
fbgt_else.34623:
	fmov	%f0, %f6
fbgt_cont.34624:
	j	fbgt_cont.34612
fbgt_else.34621:
	fmov	%f0, %f6
fbgt_cont.34622:
	j	fbgt_cont.34612
fbgt_else.34619:
	fmov	%f0, %f6
fbgt_cont.34620:
	j	fbgt_cont.34612
fbgt_else.34617:
	fmov	%f0, %f6
fbgt_cont.34618:
	j	fbgt_cont.34612
fbgt_else.34615:
	fmov	%f0, %f6
fbgt_cont.34616:
	j	fbgt_cont.34612
fbgt_else.34613:
	fmov	%f0, %f6
fbgt_cont.34614:
	j	fbgt_cont.34612
fbgt_else.34611:
	fmov	%f0, %f5
fbgt_cont.34612:
	flw	%f1, 23(%sp)
	flw	%f2, 5(%sp)
	fblt	%f1, %f2, fbgt_else.34637
	fblt	%f1, %f0, fbgt_else.34639
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
	j	fbgt_cont.34638
fbgt_else.34639:
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
fbgt_cont.34640:
	j	fbgt_cont.34638
fbgt_else.34637:
	fmov	%f0, %f1
fbgt_cont.34638:
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.34641
	lw	%v0, 22(%sp)
	beqi	%v0, 0, bnei_else.34643
	addi	%v0, %zero, 0
	j	fbgt_cont.34642
bnei_else.34643:
	addi	%v0, %zero, 1
bnei_cont.34644:
	j	fbgt_cont.34642
fbgt_else.34641:
	lw	%v0, 22(%sp)
fbgt_cont.34642:
	fblt	%f0, %f1, fbgt_else.34645
	fsub	%f0, %f0, %f1
	j	fbgt_cont.34646
fbgt_else.34645:
fbgt_cont.34646:
	flw	%f2, 9(%sp)
	fblt	%f0, %f2, fbgt_else.34647
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34648
fbgt_else.34647:
fbgt_cont.34648:
	flw	%f1, 8(%sp)
	fblt	%f1, %f0, fbgt_else.34649
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
	j	fbgt_cont.34650
fbgt_else.34649:
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
fbgt_cont.34650:
	beqi	%v0, 0, bnei_else.34651
	j	bnei_cont.34652
bnei_else.34651:
	fneg	%f0, %f0
bnei_cont.34652:
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
	beqi	%v0, -1, bnei_else.35698
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
	fblt	%f0, %f1, fbgt_else.35699
	addi	%v0, %zero, 0
	j	fbgt_cont.35700
fbgt_else.35699:
	addi	%v0, %zero, 1
fbgt_cont.35700:
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
	beqi	%v1, 0, bnei_else.35701
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
	j	bnei_cont.35702
bnei_else.35701:
bnei_cont.35702:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.35703
	lw	%a0, 10(%sp)
	j	bnei_cont.35704
bnei_else.35703:
	addi	%a0, %zero, 1
bnei_cont.35704:
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
	beqi	%a2, 3, bnei_else.35705
	beqi	%a2, 2, bnei_else.35707
	j	bnei_cont.35706
bnei_else.35707:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.35709
	addi	%v1, %zero, 0
	j	bnei_cont.35710
bnei_else.35709:
	addi	%v1, %zero, 1
bnei_cont.35710:
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
	fbne	%f1, %f4, fbeq_else.35711
	addi	%a2, %zero, 1
	j	fbeq_cont.35712
fbeq_else.35711:
	addi	%a2, %zero, 0
fbeq_cont.35712:
	beqi	%a2, 0, bnei_else.35713
	flw	%f1, 474(%zero)
	j	bnei_cont.35714
bnei_else.35713:
	beqi	%v1, 0, bnei_else.35715
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.35716
bnei_else.35715:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.35716:
bnei_cont.35714:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.35708:
	j	bnei_cont.35706
bnei_else.35705:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.35717
	addi	%v1, %zero, 1
	j	fbeq_cont.35718
fbeq_else.35717:
	addi	%v1, %zero, 0
fbeq_cont.35718:
	beqi	%v1, 0, bnei_else.35719
	fmov	%f0, %f1
	j	bnei_cont.35720
bnei_else.35719:
	fbne	%f0, %f1, fbeq_else.35721
	addi	%v1, %zero, 1
	j	fbeq_cont.35722
fbeq_else.35721:
	addi	%v1, %zero, 0
fbeq_cont.35722:
	beqi	%v1, 0, bnei_else.35723
	fmov	%f2, %f1
	j	bnei_cont.35724
bnei_else.35723:
	fblt	%f1, %f0, fbgt_else.35725
	addi	%v1, %zero, 0
	j	fbgt_cont.35726
fbgt_else.35725:
	addi	%v1, %zero, 1
fbgt_cont.35726:
	beqi	%v1, 0, bnei_else.35727
	flw	%f2, 474(%zero)
	j	bnei_cont.35728
bnei_else.35727:
	flw	%f2, 468(%zero)
bnei_cont.35728:
bnei_cont.35724:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.35720:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.35729
	addi	%v1, %zero, 1
	j	fbeq_cont.35730
fbeq_else.35729:
	addi	%v1, %zero, 0
fbeq_cont.35730:
	beqi	%v1, 0, bnei_else.35731
	fmov	%f0, %f1
	j	bnei_cont.35732
bnei_else.35731:
	fbne	%f0, %f1, fbeq_else.35733
	addi	%v1, %zero, 1
	j	fbeq_cont.35734
fbeq_else.35733:
	addi	%v1, %zero, 0
fbeq_cont.35734:
	beqi	%v1, 0, bnei_else.35735
	fmov	%f2, %f1
	j	bnei_cont.35736
bnei_else.35735:
	fblt	%f1, %f0, fbgt_else.35737
	addi	%v1, %zero, 0
	j	fbgt_cont.35738
fbgt_else.35737:
	addi	%v1, %zero, 1
fbgt_cont.35738:
	beqi	%v1, 0, bnei_else.35739
	flw	%f2, 474(%zero)
	j	bnei_cont.35740
bnei_else.35739:
	flw	%f2, 468(%zero)
bnei_cont.35740:
bnei_cont.35736:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.35732:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.35741
	addi	%v1, %zero, 1
	j	fbeq_cont.35742
fbeq_else.35741:
	addi	%v1, %zero, 0
fbeq_cont.35742:
	beqi	%v1, 0, bnei_else.35743
	fmov	%f0, %f1
	j	bnei_cont.35744
bnei_else.35743:
	fbne	%f0, %f1, fbeq_else.35745
	addi	%v1, %zero, 1
	j	fbeq_cont.35746
fbeq_else.35745:
	addi	%v1, %zero, 0
fbeq_cont.35746:
	beqi	%v1, 0, bnei_else.35747
	fmov	%f2, %f1
	j	bnei_cont.35748
bnei_else.35747:
	fblt	%f1, %f0, fbgt_else.35749
	addi	%v1, %zero, 0
	j	fbgt_cont.35750
fbgt_else.35749:
	addi	%v1, %zero, 1
fbgt_cont.35750:
	beqi	%v1, 0, bnei_else.35751
	flw	%f2, 474(%zero)
	j	bnei_cont.35752
bnei_else.35751:
	flw	%f2, 468(%zero)
bnei_cont.35752:
bnei_cont.35748:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.35744:
	fsw	%f0, 2(%a0)
bnei_cont.35706:
	beqi	%a1, 0, bnei_else.35753
	flw	%f0, 0(%v0)
	flw	%f1, 494(%zero)
	fabs	%f2, %f0
	flw	%f3, 493(%zero)
	fsw	%f0, 16(%sp)
	fsw	%f1, 17(%sp)
	fsw	%f3, 18(%sp)
	fsw	%f2, 19(%sp)
	fblt	%f2, %f3, fbgt_else.35755
	flw	%f4, 492(%zero)
	fblt	%f2, %f4, fbgt_else.35757
	flw	%f4, 491(%zero)
	fblt	%f2, %f4, fbgt_else.35759
	flw	%f4, 490(%zero)
	fblt	%f2, %f4, fbgt_else.35761
	flw	%f4, 489(%zero)
	fblt	%f2, %f4, fbgt_else.35763
	flw	%f4, 488(%zero)
	fblt	%f2, %f4, fbgt_else.35765
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.35767
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.35769
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.35771
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.35773
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.35775
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.35777
	flw	%f4, 481(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35756
fbgt_else.35777:
	fmov	%f1, %f4
fbgt_cont.35778:
	j	fbgt_cont.35756
fbgt_else.35775:
	fmov	%f1, %f4
fbgt_cont.35776:
	j	fbgt_cont.35756
fbgt_else.35773:
	fmov	%f1, %f4
fbgt_cont.35774:
	j	fbgt_cont.35756
fbgt_else.35771:
	fmov	%f1, %f4
fbgt_cont.35772:
	j	fbgt_cont.35756
fbgt_else.35769:
	fmov	%f1, %f4
fbgt_cont.35770:
	j	fbgt_cont.35756
fbgt_else.35767:
	fmov	%f1, %f4
fbgt_cont.35768:
	j	fbgt_cont.35756
fbgt_else.35765:
	fmov	%f1, %f4
fbgt_cont.35766:
	j	fbgt_cont.35756
fbgt_else.35763:
	fmov	%f1, %f4
fbgt_cont.35764:
	j	fbgt_cont.35756
fbgt_else.35761:
	fmov	%f1, %f4
fbgt_cont.35762:
	j	fbgt_cont.35756
fbgt_else.35759:
	fmov	%f1, %f4
fbgt_cont.35760:
	j	fbgt_cont.35756
fbgt_else.35757:
	fmov	%f1, %f4
fbgt_cont.35758:
	j	fbgt_cont.35756
fbgt_else.35755:
	fmov	%f1, %f3
fbgt_cont.35756:
	flw	%f0, 19(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35779
	addi	%v0, %zero, 0
	j	fbgt_cont.35780
fbgt_else.35779:
	addi	%v0, %zero, 1
fbgt_cont.35780:
	fblt	%f0, %f1, fbgt_else.35781
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35782
fbgt_else.35781:
fbgt_cont.35782:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.35783
	beqi	%v0, 0, bnei_else.35785
	addi	%v0, %zero, 0
	j	fbgt_cont.35784
bnei_else.35785:
	addi	%v0, %zero, 1
bnei_cont.35786:
	j	fbgt_cont.35784
fbgt_else.35783:
fbgt_cont.35784:
	fblt	%f0, %f2, fbgt_else.35787
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35788
fbgt_else.35787:
fbgt_cont.35788:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.35789
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
	j	fbgt_cont.35790
fbgt_else.35789:
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
fbgt_cont.35790:
	beqi	%v0, 0, bnei_else.35791
	j	bnei_cont.35792
bnei_else.35791:
	fneg	%f0, %f0
bnei_cont.35792:
	flw	%f4, 16(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.35793
	addi	%v0, %zero, 1
	j	fbgt_cont.35794
fbgt_else.35793:
	addi	%v0, %zero, 0
fbgt_cont.35794:
	fabs	%f4, %f4
	flw	%f6, 18(%sp)
	fsw	%f0, 20(%sp)
	fsw	%f3, 21(%sp)
	fsw	%f2, 22(%sp)
	sw	%v0, 23(%sp)
	fsw	%f4, 24(%sp)
	fblt	%f4, %f6, fbgt_else.35795
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.35797
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.35799
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.35801
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.35803
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.35805
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.35807
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.35809
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.35811
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.35813
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.35815
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.35817
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35796
fbgt_else.35817:
	fmov	%f1, %f7
fbgt_cont.35818:
	j	fbgt_cont.35796
fbgt_else.35815:
	fmov	%f1, %f7
fbgt_cont.35816:
	j	fbgt_cont.35796
fbgt_else.35813:
	fmov	%f1, %f7
fbgt_cont.35814:
	j	fbgt_cont.35796
fbgt_else.35811:
	fmov	%f1, %f7
fbgt_cont.35812:
	j	fbgt_cont.35796
fbgt_else.35809:
	fmov	%f1, %f7
fbgt_cont.35810:
	j	fbgt_cont.35796
fbgt_else.35807:
	fmov	%f1, %f7
fbgt_cont.35808:
	j	fbgt_cont.35796
fbgt_else.35805:
	fmov	%f1, %f7
fbgt_cont.35806:
	j	fbgt_cont.35796
fbgt_else.35803:
	fmov	%f1, %f7
fbgt_cont.35804:
	j	fbgt_cont.35796
fbgt_else.35801:
	fmov	%f1, %f7
fbgt_cont.35802:
	j	fbgt_cont.35796
fbgt_else.35799:
	fmov	%f1, %f7
fbgt_cont.35800:
	j	fbgt_cont.35796
fbgt_else.35797:
	fmov	%f1, %f7
fbgt_cont.35798:
	j	fbgt_cont.35796
fbgt_else.35795:
	fmov	%f1, %f6
fbgt_cont.35796:
	flw	%f0, 24(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35819
	lw	%v0, 23(%sp)
	beqi	%v0, 0, bnei_else.35821
	addi	%v0, %zero, 0
	j	fbgt_cont.35820
bnei_else.35821:
	addi	%v0, %zero, 1
bnei_cont.35822:
	j	fbgt_cont.35820
fbgt_else.35819:
	lw	%v0, 23(%sp)
fbgt_cont.35820:
	fblt	%f0, %f1, fbgt_else.35823
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35824
fbgt_else.35823:
fbgt_cont.35824:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35825
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35826
fbgt_else.35825:
fbgt_cont.35826:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.35827
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
	j	fbgt_cont.35828
fbgt_else.35827:
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
fbgt_cont.35828:
	beqi	%v0, 0, bnei_else.35829
	j	bnei_cont.35830
bnei_else.35829:
	fneg	%f0, %f0
bnei_cont.35830:
	lw	%v0, 13(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 18(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f4, 26(%sp)
	fsw	%f5, 27(%sp)
	fblt	%f5, %f6, fbgt_else.35831
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.35833
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.35835
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.35837
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.35839
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.35841
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.35843
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.35845
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.35847
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.35849
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.35851
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.35853
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35832
fbgt_else.35853:
	fmov	%f1, %f7
fbgt_cont.35854:
	j	fbgt_cont.35832
fbgt_else.35851:
	fmov	%f1, %f7
fbgt_cont.35852:
	j	fbgt_cont.35832
fbgt_else.35849:
	fmov	%f1, %f7
fbgt_cont.35850:
	j	fbgt_cont.35832
fbgt_else.35847:
	fmov	%f1, %f7
fbgt_cont.35848:
	j	fbgt_cont.35832
fbgt_else.35845:
	fmov	%f1, %f7
fbgt_cont.35846:
	j	fbgt_cont.35832
fbgt_else.35843:
	fmov	%f1, %f7
fbgt_cont.35844:
	j	fbgt_cont.35832
fbgt_else.35841:
	fmov	%f1, %f7
fbgt_cont.35842:
	j	fbgt_cont.35832
fbgt_else.35839:
	fmov	%f1, %f7
fbgt_cont.35840:
	j	fbgt_cont.35832
fbgt_else.35837:
	fmov	%f1, %f7
fbgt_cont.35838:
	j	fbgt_cont.35832
fbgt_else.35835:
	fmov	%f1, %f7
fbgt_cont.35836:
	j	fbgt_cont.35832
fbgt_else.35833:
	fmov	%f1, %f7
fbgt_cont.35834:
	j	fbgt_cont.35832
fbgt_else.35831:
	fmov	%f1, %f6
fbgt_cont.35832:
	flw	%f0, 27(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35855
	addi	%v0, %zero, 0
	j	fbgt_cont.35856
fbgt_else.35855:
	addi	%v0, %zero, 1
fbgt_cont.35856:
	fblt	%f0, %f1, fbgt_else.35857
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35858
fbgt_else.35857:
fbgt_cont.35858:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35859
	beqi	%v0, 0, bnei_else.35861
	addi	%v0, %zero, 0
	j	fbgt_cont.35860
bnei_else.35861:
	addi	%v0, %zero, 1
bnei_cont.35862:
	j	fbgt_cont.35860
fbgt_else.35859:
fbgt_cont.35860:
	fblt	%f0, %f2, fbgt_else.35863
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35864
fbgt_else.35863:
fbgt_cont.35864:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.35865
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
	j	fbgt_cont.35866
fbgt_else.35865:
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
fbgt_cont.35866:
	beqi	%v0, 0, bnei_else.35867
	j	bnei_cont.35868
bnei_else.35867:
	fneg	%f0, %f0
bnei_cont.35868:
	flw	%f4, 26(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.35869
	addi	%v0, %zero, 1
	j	fbgt_cont.35870
fbgt_else.35869:
	addi	%v0, %zero, 0
fbgt_cont.35870:
	fabs	%f4, %f4
	flw	%f6, 18(%sp)
	fsw	%f0, 28(%sp)
	sw	%v0, 29(%sp)
	fsw	%f4, 30(%sp)
	fblt	%f4, %f6, fbgt_else.35871
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.35873
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.35875
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.35877
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.35879
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.35881
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.35883
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.35885
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.35887
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.35889
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.35891
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.35893
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35872
fbgt_else.35893:
	fmov	%f1, %f7
fbgt_cont.35894:
	j	fbgt_cont.35872
fbgt_else.35891:
	fmov	%f1, %f7
fbgt_cont.35892:
	j	fbgt_cont.35872
fbgt_else.35889:
	fmov	%f1, %f7
fbgt_cont.35890:
	j	fbgt_cont.35872
fbgt_else.35887:
	fmov	%f1, %f7
fbgt_cont.35888:
	j	fbgt_cont.35872
fbgt_else.35885:
	fmov	%f1, %f7
fbgt_cont.35886:
	j	fbgt_cont.35872
fbgt_else.35883:
	fmov	%f1, %f7
fbgt_cont.35884:
	j	fbgt_cont.35872
fbgt_else.35881:
	fmov	%f1, %f7
fbgt_cont.35882:
	j	fbgt_cont.35872
fbgt_else.35879:
	fmov	%f1, %f7
fbgt_cont.35880:
	j	fbgt_cont.35872
fbgt_else.35877:
	fmov	%f1, %f7
fbgt_cont.35878:
	j	fbgt_cont.35872
fbgt_else.35875:
	fmov	%f1, %f7
fbgt_cont.35876:
	j	fbgt_cont.35872
fbgt_else.35873:
	fmov	%f1, %f7
fbgt_cont.35874:
	j	fbgt_cont.35872
fbgt_else.35871:
	fmov	%f1, %f6
fbgt_cont.35872:
	flw	%f0, 30(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35895
	lw	%v0, 29(%sp)
	beqi	%v0, 0, bnei_else.35897
	addi	%v0, %zero, 0
	j	fbgt_cont.35896
bnei_else.35897:
	addi	%v0, %zero, 1
bnei_cont.35898:
	j	fbgt_cont.35896
fbgt_else.35895:
	lw	%v0, 29(%sp)
fbgt_cont.35896:
	fblt	%f0, %f1, fbgt_else.35899
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35900
fbgt_else.35899:
fbgt_cont.35900:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35901
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35902
fbgt_else.35901:
fbgt_cont.35902:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.35903
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
	j	fbgt_cont.35904
fbgt_else.35903:
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
fbgt_cont.35904:
	beqi	%v0, 0, bnei_else.35905
	j	bnei_cont.35906
bnei_else.35905:
	fneg	%f0, %f0
bnei_cont.35906:
	lw	%v0, 13(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 18(%sp)
	fsw	%f0, 31(%sp)
	fsw	%f4, 32(%sp)
	fsw	%f5, 33(%sp)
	fblt	%f5, %f6, fbgt_else.35907
	flw	%f7, 492(%zero)
	fblt	%f5, %f7, fbgt_else.35909
	flw	%f7, 491(%zero)
	fblt	%f5, %f7, fbgt_else.35911
	flw	%f7, 490(%zero)
	fblt	%f5, %f7, fbgt_else.35913
	flw	%f7, 489(%zero)
	fblt	%f5, %f7, fbgt_else.35915
	flw	%f7, 488(%zero)
	fblt	%f5, %f7, fbgt_else.35917
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.35919
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.35921
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.35923
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.35925
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.35927
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.35929
	flw	%f7, 481(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35908
fbgt_else.35929:
	fmov	%f1, %f7
fbgt_cont.35930:
	j	fbgt_cont.35908
fbgt_else.35927:
	fmov	%f1, %f7
fbgt_cont.35928:
	j	fbgt_cont.35908
fbgt_else.35925:
	fmov	%f1, %f7
fbgt_cont.35926:
	j	fbgt_cont.35908
fbgt_else.35923:
	fmov	%f1, %f7
fbgt_cont.35924:
	j	fbgt_cont.35908
fbgt_else.35921:
	fmov	%f1, %f7
fbgt_cont.35922:
	j	fbgt_cont.35908
fbgt_else.35919:
	fmov	%f1, %f7
fbgt_cont.35920:
	j	fbgt_cont.35908
fbgt_else.35917:
	fmov	%f1, %f7
fbgt_cont.35918:
	j	fbgt_cont.35908
fbgt_else.35915:
	fmov	%f1, %f7
fbgt_cont.35916:
	j	fbgt_cont.35908
fbgt_else.35913:
	fmov	%f1, %f7
fbgt_cont.35914:
	j	fbgt_cont.35908
fbgt_else.35911:
	fmov	%f1, %f7
fbgt_cont.35912:
	j	fbgt_cont.35908
fbgt_else.35909:
	fmov	%f1, %f7
fbgt_cont.35910:
	j	fbgt_cont.35908
fbgt_else.35907:
	fmov	%f1, %f6
fbgt_cont.35908:
	flw	%f0, 33(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35931
	addi	%v0, %zero, 0
	j	fbgt_cont.35932
fbgt_else.35931:
	addi	%v0, %zero, 1
fbgt_cont.35932:
	fblt	%f0, %f1, fbgt_else.35933
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35934
fbgt_else.35933:
fbgt_cont.35934:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35935
	beqi	%v0, 0, bnei_else.35937
	addi	%v0, %zero, 0
	j	fbgt_cont.35936
bnei_else.35937:
	addi	%v0, %zero, 1
bnei_cont.35938:
	j	fbgt_cont.35936
fbgt_else.35935:
fbgt_cont.35936:
	fblt	%f0, %f2, fbgt_else.35939
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35940
fbgt_else.35939:
fbgt_cont.35940:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.35941
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
	j	fbgt_cont.35942
fbgt_else.35941:
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
fbgt_cont.35942:
	beqi	%v0, 0, bnei_else.35943
	j	bnei_cont.35944
bnei_else.35943:
	fneg	%f0, %f0
bnei_cont.35944:
	flw	%f4, 32(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.35945
	addi	%v0, %zero, 1
	j	fbgt_cont.35946
fbgt_else.35945:
	addi	%v0, %zero, 0
fbgt_cont.35946:
	fabs	%f4, %f4
	flw	%f5, 18(%sp)
	fsw	%f0, 34(%sp)
	sw	%v0, 35(%sp)
	fsw	%f4, 36(%sp)
	fblt	%f4, %f5, fbgt_else.35947
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.35949
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.35951
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.35953
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.35955
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.35957
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.35959
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.35961
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.35963
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.35965
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.35967
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.35969
	flw	%f6, 481(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.35948
fbgt_else.35969:
	fmov	%f1, %f6
fbgt_cont.35970:
	j	fbgt_cont.35948
fbgt_else.35967:
	fmov	%f1, %f6
fbgt_cont.35968:
	j	fbgt_cont.35948
fbgt_else.35965:
	fmov	%f1, %f6
fbgt_cont.35966:
	j	fbgt_cont.35948
fbgt_else.35963:
	fmov	%f1, %f6
fbgt_cont.35964:
	j	fbgt_cont.35948
fbgt_else.35961:
	fmov	%f1, %f6
fbgt_cont.35962:
	j	fbgt_cont.35948
fbgt_else.35959:
	fmov	%f1, %f6
fbgt_cont.35960:
	j	fbgt_cont.35948
fbgt_else.35957:
	fmov	%f1, %f6
fbgt_cont.35958:
	j	fbgt_cont.35948
fbgt_else.35955:
	fmov	%f1, %f6
fbgt_cont.35956:
	j	fbgt_cont.35948
fbgt_else.35953:
	fmov	%f1, %f6
fbgt_cont.35954:
	j	fbgt_cont.35948
fbgt_else.35951:
	fmov	%f1, %f6
fbgt_cont.35952:
	j	fbgt_cont.35948
fbgt_else.35949:
	fmov	%f1, %f6
fbgt_cont.35950:
	j	fbgt_cont.35948
fbgt_else.35947:
	fmov	%f1, %f5
fbgt_cont.35948:
	flw	%f0, 36(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.35971
	lw	%v0, 35(%sp)
	beqi	%v0, 0, bnei_else.35973
	addi	%v0, %zero, 0
	j	fbgt_cont.35972
bnei_else.35973:
	addi	%v0, %zero, 1
bnei_cont.35974:
	j	fbgt_cont.35972
fbgt_else.35971:
	lw	%v0, 35(%sp)
fbgt_cont.35972:
	fblt	%f0, %f1, fbgt_else.35975
	fsub	%f0, %f0, %f1
	j	fbgt_cont.35976
fbgt_else.35975:
fbgt_cont.35976:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.35977
	fsub	%f0, %f1, %f0
	j	fbgt_cont.35978
fbgt_else.35977:
fbgt_cont.35978:
	flw	%f1, 21(%sp)
	fblt	%f1, %f0, fbgt_else.35979
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
	j	fbgt_cont.35980
fbgt_else.35979:
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
fbgt_cont.35980:
	beqi	%v0, 0, bnei_else.35981
	j	bnei_cont.35982
bnei_else.35981:
	fneg	%f0, %f0
bnei_cont.35982:
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
	j	bnei_cont.35754
bnei_else.35753:
bnei_cont.35754:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.35698:
	addi	%v0, %zero, 0
	jr	%ra
read_object.2772:
	blti	%v0, 60, bgti_else.36033
	jr	%ra
bgti_else.36033:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.36035
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
	fblt	%f0, %f1, fbgt_else.36037
	addi	%v0, %zero, 0
	j	fbgt_cont.36038
fbgt_else.36037:
	addi	%v0, %zero, 1
fbgt_cont.36038:
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
	beqi	%v1, 0, bnei_else.36039
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
	j	bnei_cont.36040
bnei_else.36039:
bnei_cont.36040:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.36041
	lw	%a0, 10(%sp)
	j	bnei_cont.36042
bnei_else.36041:
	addi	%a0, %zero, 1
bnei_cont.36042:
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
	beqi	%a2, 3, bnei_else.36043
	beqi	%a2, 2, bnei_else.36045
	j	bnei_cont.36044
bnei_else.36045:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.36047
	addi	%v1, %zero, 0
	j	bnei_cont.36048
bnei_else.36047:
	addi	%v1, %zero, 1
bnei_cont.36048:
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
	fbne	%f1, %f4, fbeq_else.36049
	addi	%a2, %zero, 1
	j	fbeq_cont.36050
fbeq_else.36049:
	addi	%a2, %zero, 0
fbeq_cont.36050:
	beqi	%a2, 0, bnei_else.36051
	flw	%f1, 474(%zero)
	j	bnei_cont.36052
bnei_else.36051:
	beqi	%v1, 0, bnei_else.36053
	flw	%f4, 468(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.36054
bnei_else.36053:
	flw	%f4, 474(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.36054:
bnei_cont.36052:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.36046:
	j	bnei_cont.36044
bnei_else.36043:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.36055
	addi	%v1, %zero, 1
	j	fbeq_cont.36056
fbeq_else.36055:
	addi	%v1, %zero, 0
fbeq_cont.36056:
	beqi	%v1, 0, bnei_else.36057
	fmov	%f0, %f1
	j	bnei_cont.36058
bnei_else.36057:
	fbne	%f0, %f1, fbeq_else.36059
	addi	%v1, %zero, 1
	j	fbeq_cont.36060
fbeq_else.36059:
	addi	%v1, %zero, 0
fbeq_cont.36060:
	beqi	%v1, 0, bnei_else.36061
	fmov	%f2, %f1
	j	bnei_cont.36062
bnei_else.36061:
	fblt	%f1, %f0, fbgt_else.36063
	addi	%v1, %zero, 0
	j	fbgt_cont.36064
fbgt_else.36063:
	addi	%v1, %zero, 1
fbgt_cont.36064:
	beqi	%v1, 0, bnei_else.36065
	flw	%f2, 474(%zero)
	j	bnei_cont.36066
bnei_else.36065:
	flw	%f2, 468(%zero)
bnei_cont.36066:
bnei_cont.36062:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.36058:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.36067
	addi	%v1, %zero, 1
	j	fbeq_cont.36068
fbeq_else.36067:
	addi	%v1, %zero, 0
fbeq_cont.36068:
	beqi	%v1, 0, bnei_else.36069
	fmov	%f0, %f1
	j	bnei_cont.36070
bnei_else.36069:
	fbne	%f0, %f1, fbeq_else.36071
	addi	%v1, %zero, 1
	j	fbeq_cont.36072
fbeq_else.36071:
	addi	%v1, %zero, 0
fbeq_cont.36072:
	beqi	%v1, 0, bnei_else.36073
	fmov	%f2, %f1
	j	bnei_cont.36074
bnei_else.36073:
	fblt	%f1, %f0, fbgt_else.36075
	addi	%v1, %zero, 0
	j	fbgt_cont.36076
fbgt_else.36075:
	addi	%v1, %zero, 1
fbgt_cont.36076:
	beqi	%v1, 0, bnei_else.36077
	flw	%f2, 474(%zero)
	j	bnei_cont.36078
bnei_else.36077:
	flw	%f2, 468(%zero)
bnei_cont.36078:
bnei_cont.36074:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.36070:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.36079
	addi	%v1, %zero, 1
	j	fbeq_cont.36080
fbeq_else.36079:
	addi	%v1, %zero, 0
fbeq_cont.36080:
	beqi	%v1, 0, bnei_else.36081
	fmov	%f0, %f1
	j	bnei_cont.36082
bnei_else.36081:
	fbne	%f0, %f1, fbeq_else.36083
	addi	%v1, %zero, 1
	j	fbeq_cont.36084
fbeq_else.36083:
	addi	%v1, %zero, 0
fbeq_cont.36084:
	beqi	%v1, 0, bnei_else.36085
	j	bnei_cont.36086
bnei_else.36085:
	fblt	%f1, %f0, fbgt_else.36087
	addi	%v1, %zero, 0
	j	fbgt_cont.36088
fbgt_else.36087:
	addi	%v1, %zero, 1
fbgt_cont.36088:
	beqi	%v1, 0, bnei_else.36089
	flw	%f1, 474(%zero)
	j	bnei_cont.36090
bnei_else.36089:
	flw	%f1, 468(%zero)
bnei_cont.36090:
bnei_cont.36086:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
bnei_cont.36082:
	fsw	%f0, 2(%a0)
bnei_cont.36044:
	beqi	%a1, 0, bnei_else.36091
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	rotate_quadratic_matrix.2767
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.36092
bnei_else.36091:
bnei_cont.36092:
	addi	%v0, %zero, 1
	j	bnei_cont.36036
bnei_else.36035:
	addi	%v0, %zero, 0
bnei_cont.36036:
	beqi	%v0, 0, bnei_else.36093
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.36094
	jr	%ra
bgti_else.36094:
	sw	%v0, 16(%sp)
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	read_nth_object.2770
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	beqi	%v0, 0, bnei_else.36096
	lw	%v0, 16(%sp)
	addi	%v0, %v0, 1
	j	read_object.2772
bnei_else.36096:
	lw	%v0, 16(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.36093:
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
	beqi	%v0, -1, bnei_else.36112
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
	beqi	%v0, -1, bnei_else.36113
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.36115
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.36117
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
	j	bnei_cont.36118
bnei_else.36117:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.36118:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.36116
bnei_else.36115:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.36116:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.36114
bnei_else.36113:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.36114:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.36112:
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
	beqi	%v0, -1, bnei_else.36136
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.36138
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.36140
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
	j	bnei_cont.36141
bnei_else.36140:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.36141:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.36139
bnei_else.36138:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.36139:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.36137
bnei_else.36136:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.36137:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.36142
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
	beqi	%v0, -1, bnei_else.36143
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.36145
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
	j	bnei_cont.36146
bnei_else.36145:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.36146:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.36144
bnei_else.36143:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.36144:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.36147
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
	j	bnei_cont.36148
bnei_else.36147:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.36148:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.36142:
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
	beqi	%v0, -1, bnei_else.36170
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.36172
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.36174
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
	j	bnei_cont.36175
bnei_else.36174:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.36175:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.36173
bnei_else.36172:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.36173:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.36171
bnei_else.36170:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.36171:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.36176
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
	beqi	%v0, -1, bnei_else.36177
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.36179
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
	j	bnei_cont.36180
bnei_else.36179:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.36180:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.36178
bnei_else.36177:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.36178:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.36181
	lw	%v1, 6(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, -1, bnei_else.36182
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
	j	bnei_cont.36183
bnei_else.36182:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.36183:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.36184
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
	beqi	%v1, -1, bnei_else.36185
	lw	%v1, 12(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	j	read_and_network.2780
bnei_else.36185:
	jr	%ra
bnei_else.36184:
	jr	%ra
bnei_else.36181:
	jr	%ra
bnei_else.36176:
	jr	%ra
iter_setup_dirvec_constants.2877:
	blti	%v1, 0, bgti_else.36231
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.36232
	beqi	%a3, 2, bnei_else.36234
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
	beqi	%a0, 0, bnei_else.36236
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
	j	bnei_cont.36237
bnei_else.36236:
bnei_cont.36237:
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
	beqi	%a0, 0, bnei_else.36238
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
	j	bnei_cont.36239
bnei_else.36238:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.36239:
	flw	%f0, 3(%sp)
	fbne	%f3, %f0, fbeq_else.36240
	addi	%v1, %zero, 1
	j	fbeq_cont.36241
fbeq_else.36240:
	addi	%v1, %zero, 0
fbeq_cont.36241:
	beqi	%v1, 0, bnei_else.36242
	j	bnei_cont.36243
bnei_else.36242:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.36243:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.36233
bnei_else.36234:
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
	fblt	%f2, %f0, fbgt_else.36244
	addi	%v1, %zero, 0
	j	fbgt_cont.36245
fbgt_else.36244:
	addi	%v1, %zero, 1
fbgt_cont.36245:
	beqi	%v1, 0, bnei_else.36246
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
	j	bnei_cont.36247
bnei_else.36246:
	fsw	%f2, 0(%v0)
bnei_cont.36247:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36235:
	j	bnei_cont.36233
bnei_else.36232:
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
	fbne	%f0, %f1, fbeq_else.36248
	addi	%a0, %zero, 1
	j	fbeq_cont.36249
fbeq_else.36248:
	addi	%a0, %zero, 0
fbeq_cont.36249:
	beqi	%a0, 0, bnei_else.36250
	fsw	%f1, 1(%v0)
	j	bnei_cont.36251
bnei_else.36250:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36252
	addi	%a2, %zero, 0
	j	fbgt_cont.36253
fbgt_else.36252:
	addi	%a2, %zero, 1
fbgt_cont.36253:
	beqi	%a1, 0, bnei_else.36254
	beqi	%a2, 0, bnei_else.36256
	addi	%a1, %zero, 0
	j	bnei_cont.36255
bnei_else.36256:
	addi	%a1, %zero, 1
bnei_cont.36257:
	j	bnei_cont.36255
bnei_else.36254:
	add	%a1, %zero, %a2
bnei_cont.36255:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.36258
	j	bnei_cont.36259
bnei_else.36258:
	fneg	%f2, %f2
bnei_cont.36259:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.36251:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.36260
	addi	%a0, %zero, 1
	j	fbeq_cont.36261
fbeq_else.36260:
	addi	%a0, %zero, 0
fbeq_cont.36261:
	beqi	%a0, 0, bnei_else.36262
	fsw	%f1, 3(%v0)
	j	bnei_cont.36263
bnei_else.36262:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36264
	addi	%a2, %zero, 0
	j	fbgt_cont.36265
fbgt_else.36264:
	addi	%a2, %zero, 1
fbgt_cont.36265:
	beqi	%a1, 0, bnei_else.36266
	beqi	%a2, 0, bnei_else.36268
	addi	%a1, %zero, 0
	j	bnei_cont.36267
bnei_else.36268:
	addi	%a1, %zero, 1
bnei_cont.36269:
	j	bnei_cont.36267
bnei_else.36266:
	add	%a1, %zero, %a2
bnei_cont.36267:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.36270
	j	bnei_cont.36271
bnei_else.36270:
	fneg	%f2, %f2
bnei_cont.36271:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.36263:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.36272
	addi	%v1, %zero, 1
	j	fbeq_cont.36273
fbeq_else.36272:
	addi	%v1, %zero, 0
fbeq_cont.36273:
	beqi	%v1, 0, bnei_else.36274
	fsw	%f1, 5(%v0)
	j	bnei_cont.36275
bnei_else.36274:
	lw	%v1, 4(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.36276
	addi	%a1, %zero, 0
	j	fbgt_cont.36277
fbgt_else.36276:
	addi	%a1, %zero, 1
fbgt_cont.36277:
	beqi	%a0, 0, bnei_else.36278
	beqi	%a1, 0, bnei_else.36280
	addi	%a0, %zero, 0
	j	bnei_cont.36279
bnei_else.36280:
	addi	%a0, %zero, 1
bnei_cont.36281:
	j	bnei_cont.36279
bnei_else.36278:
	add	%a0, %zero, %a1
bnei_cont.36279:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.36282
	j	bnei_cont.36283
bnei_else.36282:
	fneg	%f1, %f1
bnei_cont.36283:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.36275:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36233:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.36284
	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.36285
	beqi	%a3, 2, bnei_else.36287
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
	beqi	%a0, 0, bnei_else.36289
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
	j	bnei_cont.36290
bnei_else.36289:
bnei_cont.36290:
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
	beqi	%a0, 0, bnei_else.36291
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
	j	bnei_cont.36292
bnei_else.36291:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.36292:
	flw	%f0, 10(%sp)
	fbne	%f3, %f0, fbeq_else.36293
	addi	%v1, %zero, 1
	j	fbeq_cont.36294
fbeq_else.36293:
	addi	%v1, %zero, 0
fbeq_cont.36294:
	beqi	%v1, 0, bnei_else.36295
	j	bnei_cont.36296
bnei_else.36295:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.36296:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.36286
bnei_else.36287:
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
	fblt	%f1, %f0, fbgt_else.36297
	addi	%v1, %zero, 0
	j	fbgt_cont.36298
fbgt_else.36297:
	addi	%v1, %zero, 1
fbgt_cont.36298:
	beqi	%v1, 0, bnei_else.36299
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
	j	bnei_cont.36300
bnei_else.36299:
	fsw	%f1, 0(%v0)
bnei_cont.36300:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36288:
	j	bnei_cont.36286
bnei_else.36285:
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
	fbne	%f0, %f1, fbeq_else.36301
	addi	%a0, %zero, 1
	j	fbeq_cont.36302
fbeq_else.36301:
	addi	%a0, %zero, 0
fbeq_cont.36302:
	beqi	%a0, 0, bnei_else.36303
	fsw	%f1, 1(%v0)
	j	bnei_cont.36304
bnei_else.36303:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36305
	addi	%a2, %zero, 0
	j	fbgt_cont.36306
fbgt_else.36305:
	addi	%a2, %zero, 1
fbgt_cont.36306:
	beqi	%a1, 0, bnei_else.36307
	beqi	%a2, 0, bnei_else.36309
	addi	%a1, %zero, 0
	j	bnei_cont.36308
bnei_else.36309:
	addi	%a1, %zero, 1
bnei_cont.36310:
	j	bnei_cont.36308
bnei_else.36307:
	add	%a1, %zero, %a2
bnei_cont.36308:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.36311
	j	bnei_cont.36312
bnei_else.36311:
	fneg	%f2, %f2
bnei_cont.36312:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.36304:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.36313
	addi	%a0, %zero, 1
	j	fbeq_cont.36314
fbeq_else.36313:
	addi	%a0, %zero, 0
fbeq_cont.36314:
	beqi	%a0, 0, bnei_else.36315
	fsw	%f1, 3(%v0)
	j	bnei_cont.36316
bnei_else.36315:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36317
	addi	%a2, %zero, 0
	j	fbgt_cont.36318
fbgt_else.36317:
	addi	%a2, %zero, 1
fbgt_cont.36318:
	beqi	%a1, 0, bnei_else.36319
	beqi	%a2, 0, bnei_else.36321
	addi	%a1, %zero, 0
	j	bnei_cont.36320
bnei_else.36321:
	addi	%a1, %zero, 1
bnei_cont.36322:
	j	bnei_cont.36320
bnei_else.36319:
	add	%a1, %zero, %a2
bnei_cont.36320:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.36323
	j	bnei_cont.36324
bnei_else.36323:
	fneg	%f2, %f2
bnei_cont.36324:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.36316:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.36325
	addi	%v1, %zero, 1
	j	fbeq_cont.36326
fbeq_else.36325:
	addi	%v1, %zero, 0
fbeq_cont.36326:
	beqi	%v1, 0, bnei_else.36327
	fsw	%f1, 5(%v0)
	j	bnei_cont.36328
bnei_else.36327:
	lw	%v1, 11(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.36329
	addi	%a1, %zero, 0
	j	fbgt_cont.36330
fbgt_else.36329:
	addi	%a1, %zero, 1
fbgt_cont.36330:
	beqi	%a0, 0, bnei_else.36331
	beqi	%a1, 0, bnei_else.36333
	addi	%a0, %zero, 0
	j	bnei_cont.36332
bnei_else.36333:
	addi	%a0, %zero, 1
bnei_cont.36334:
	j	bnei_cont.36332
bnei_else.36331:
	add	%a0, %zero, %a1
bnei_cont.36332:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.36335
	j	bnei_cont.36336
bnei_else.36335:
	fneg	%f1, %f1
bnei_cont.36336:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.36328:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36286:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2877
bgti_else.36284:
	jr	%ra
bgti_else.36231:
	jr	%ra
setup_dirvec_constants.2880:
	lw	%v1, 0(%zero)
	addi	%v1, %v1, -1
	blti	%v1, 0, bgti_else.36360
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.36361
	beqi	%a3, 2, bnei_else.36363
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
	beqi	%a0, 0, bnei_else.36365
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
	j	bnei_cont.36366
bnei_else.36365:
bnei_cont.36366:
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
	beqi	%a0, 0, bnei_else.36367
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
	j	bnei_cont.36368
bnei_else.36367:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.36368:
	flw	%f0, 3(%sp)
	fbne	%f3, %f0, fbeq_else.36369
	addi	%v1, %zero, 1
	j	fbeq_cont.36370
fbeq_else.36369:
	addi	%v1, %zero, 0
fbeq_cont.36370:
	beqi	%v1, 0, bnei_else.36371
	j	bnei_cont.36372
bnei_else.36371:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.36372:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.36362
bnei_else.36363:
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
	fblt	%f1, %f0, fbgt_else.36373
	addi	%v1, %zero, 0
	j	fbgt_cont.36374
fbgt_else.36373:
	addi	%v1, %zero, 1
fbgt_cont.36374:
	beqi	%v1, 0, bnei_else.36375
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
	j	bnei_cont.36376
bnei_else.36375:
	fsw	%f1, 0(%v0)
bnei_cont.36376:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36364:
	j	bnei_cont.36362
bnei_else.36361:
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
	fbne	%f0, %f1, fbeq_else.36377
	addi	%a0, %zero, 1
	j	fbeq_cont.36378
fbeq_else.36377:
	addi	%a0, %zero, 0
fbeq_cont.36378:
	beqi	%a0, 0, bnei_else.36379
	fsw	%f1, 1(%v0)
	j	bnei_cont.36380
bnei_else.36379:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36381
	addi	%a2, %zero, 0
	j	fbgt_cont.36382
fbgt_else.36381:
	addi	%a2, %zero, 1
fbgt_cont.36382:
	beqi	%a1, 0, bnei_else.36383
	beqi	%a2, 0, bnei_else.36385
	addi	%a1, %zero, 0
	j	bnei_cont.36384
bnei_else.36385:
	addi	%a1, %zero, 1
bnei_cont.36386:
	j	bnei_cont.36384
bnei_else.36383:
	add	%a1, %zero, %a2
bnei_cont.36384:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.36387
	j	bnei_cont.36388
bnei_else.36387:
	fneg	%f2, %f2
bnei_cont.36388:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.36380:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.36389
	addi	%a0, %zero, 1
	j	fbeq_cont.36390
fbeq_else.36389:
	addi	%a0, %zero, 0
fbeq_cont.36390:
	beqi	%a0, 0, bnei_else.36391
	fsw	%f1, 3(%v0)
	j	bnei_cont.36392
bnei_else.36391:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.36393
	addi	%a2, %zero, 0
	j	fbgt_cont.36394
fbgt_else.36393:
	addi	%a2, %zero, 1
fbgt_cont.36394:
	beqi	%a1, 0, bnei_else.36395
	beqi	%a2, 0, bnei_else.36397
	addi	%a1, %zero, 0
	j	bnei_cont.36396
bnei_else.36397:
	addi	%a1, %zero, 1
bnei_cont.36398:
	j	bnei_cont.36396
bnei_else.36395:
	add	%a1, %zero, %a2
bnei_cont.36396:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.36399
	j	bnei_cont.36400
bnei_else.36399:
	fneg	%f2, %f2
bnei_cont.36400:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.36392:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.36401
	addi	%v1, %zero, 1
	j	fbeq_cont.36402
fbeq_else.36401:
	addi	%v1, %zero, 0
fbeq_cont.36402:
	beqi	%v1, 0, bnei_else.36403
	fsw	%f1, 5(%v0)
	j	bnei_cont.36404
bnei_else.36403:
	lw	%v1, 4(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.36405
	addi	%a1, %zero, 0
	j	fbgt_cont.36406
fbgt_else.36405:
	addi	%a1, %zero, 1
fbgt_cont.36406:
	beqi	%a0, 0, bnei_else.36407
	beqi	%a1, 0, bnei_else.36409
	addi	%a0, %zero, 0
	j	bnei_cont.36408
bnei_else.36409:
	addi	%a0, %zero, 1
bnei_cont.36410:
	j	bnei_cont.36408
bnei_else.36407:
	add	%a0, %zero, %a1
bnei_cont.36408:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.36411
	j	bnei_cont.36412
bnei_else.36411:
	fneg	%f1, %f1
bnei_cont.36412:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.36404:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.36362:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2877
bgti_else.36360:
	jr	%ra
setup_startp_constants.2882:
	blti	%v1, 0, bgti_else.36415
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
	beqi	%a2, 2, bnei_else.36416
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.36418
	j	bnei_cont.36417
bgt_else.36418:
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
	beqi	%a3, 0, bnei_else.36420
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
	j	bnei_cont.36421
bnei_else.36420:
	fmov	%f0, %f3
bnei_cont.36421:
	beqi	%a2, 3, bnei_else.36422
	j	bnei_cont.36423
bnei_else.36422:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.36423:
	fsw	%f0, 3(%a1)
bgt_cont.36419:
	j	bnei_cont.36417
bnei_else.36416:
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
bnei_cont.36417:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2882
bgti_else.36415:
	jr	%ra
check_all_inside.2907:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36425
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
	beqi	%a1, 1, bnei_else.36426
	beqi	%a1, 2, bnei_else.36428
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
	beqi	%a1, 0, bnei_else.36430
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
	j	bnei_cont.36431
bnei_else.36430:
	fmov	%f3, %f6
bnei_cont.36431:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.36432
	j	bnei_cont.36433
bnei_else.36432:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.36433:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36434
	addi	%a1, %zero, 0
	j	fbgt_cont.36435
fbgt_else.36434:
	addi	%a1, %zero, 1
fbgt_cont.36435:
	beqi	%a0, 0, bnei_else.36436
	beqi	%a1, 0, bnei_else.36438
	addi	%a0, %zero, 0
	j	bnei_cont.36437
bnei_else.36438:
	addi	%a0, %zero, 1
bnei_cont.36439:
	j	bnei_cont.36437
bnei_else.36436:
	add	%a0, %zero, %a1
bnei_cont.36437:
	beqi	%a0, 0, bnei_else.36440
	addi	%a0, %zero, 0
	j	bnei_cont.36427
bnei_else.36440:
	addi	%a0, %zero, 1
bnei_cont.36441:
	j	bnei_cont.36427
bnei_else.36428:
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
	fblt	%f3, %f4, fbgt_else.36442
	addi	%a1, %zero, 0
	j	fbgt_cont.36443
fbgt_else.36442:
	addi	%a1, %zero, 1
fbgt_cont.36443:
	beqi	%a0, 0, bnei_else.36444
	beqi	%a1, 0, bnei_else.36446
	addi	%a0, %zero, 0
	j	bnei_cont.36445
bnei_else.36446:
	addi	%a0, %zero, 1
bnei_cont.36447:
	j	bnei_cont.36445
bnei_else.36444:
	add	%a0, %zero, %a1
bnei_cont.36445:
	beqi	%a0, 0, bnei_else.36448
	addi	%a0, %zero, 0
	j	bnei_cont.36449
bnei_else.36448:
	addi	%a0, %zero, 1
bnei_cont.36449:
bnei_cont.36429:
	j	bnei_cont.36427
bnei_else.36426:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.36450
	addi	%a1, %zero, 0
	j	fbgt_cont.36451
fbgt_else.36450:
	addi	%a1, %zero, 1
fbgt_cont.36451:
	beqi	%a1, 0, bnei_else.36452
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.36454
	addi	%a1, %zero, 0
	j	fbgt_cont.36455
fbgt_else.36454:
	addi	%a1, %zero, 1
fbgt_cont.36455:
	beqi	%a1, 0, bnei_else.36456
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.36458
	addi	%a1, %zero, 0
	j	bnei_cont.36453
fbgt_else.36458:
	addi	%a1, %zero, 1
fbgt_cont.36459:
	j	bnei_cont.36453
bnei_else.36456:
	addi	%a1, %zero, 0
bnei_cont.36457:
	j	bnei_cont.36453
bnei_else.36452:
	addi	%a1, %zero, 0
bnei_cont.36453:
	beqi	%a1, 0, bnei_else.36460
	lw	%a0, 6(%a0)
	j	bnei_cont.36461
bnei_else.36460:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.36462
	addi	%a0, %zero, 0
	j	bnei_cont.36463
bnei_else.36462:
	addi	%a0, %zero, 1
bnei_cont.36463:
bnei_cont.36461:
bnei_cont.36427:
	beqi	%a0, 0, bnei_else.36464
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36464:
	addi	%v0, %v0, 1
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36465
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
	beqi	%a1, 1, bnei_else.36466
	beqi	%a1, 2, bnei_else.36468
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
	beqi	%a1, 0, bnei_else.36470
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
	j	bnei_cont.36471
bnei_else.36470:
	fmov	%f3, %f6
bnei_cont.36471:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.36472
	j	bnei_cont.36473
bnei_else.36472:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.36473:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36474
	addi	%a1, %zero, 0
	j	fbgt_cont.36475
fbgt_else.36474:
	addi	%a1, %zero, 1
fbgt_cont.36475:
	beqi	%a0, 0, bnei_else.36476
	beqi	%a1, 0, bnei_else.36478
	addi	%a0, %zero, 0
	j	bnei_cont.36477
bnei_else.36478:
	addi	%a0, %zero, 1
bnei_cont.36479:
	j	bnei_cont.36477
bnei_else.36476:
	add	%a0, %zero, %a1
bnei_cont.36477:
	beqi	%a0, 0, bnei_else.36480
	addi	%a0, %zero, 0
	j	bnei_cont.36467
bnei_else.36480:
	addi	%a0, %zero, 1
bnei_cont.36481:
	j	bnei_cont.36467
bnei_else.36468:
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
	fblt	%f3, %f4, fbgt_else.36482
	addi	%a1, %zero, 0
	j	fbgt_cont.36483
fbgt_else.36482:
	addi	%a1, %zero, 1
fbgt_cont.36483:
	beqi	%a0, 0, bnei_else.36484
	beqi	%a1, 0, bnei_else.36486
	addi	%a0, %zero, 0
	j	bnei_cont.36485
bnei_else.36486:
	addi	%a0, %zero, 1
bnei_cont.36487:
	j	bnei_cont.36485
bnei_else.36484:
	add	%a0, %zero, %a1
bnei_cont.36485:
	beqi	%a0, 0, bnei_else.36488
	addi	%a0, %zero, 0
	j	bnei_cont.36489
bnei_else.36488:
	addi	%a0, %zero, 1
bnei_cont.36489:
bnei_cont.36469:
	j	bnei_cont.36467
bnei_else.36466:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.36490
	addi	%a1, %zero, 0
	j	fbgt_cont.36491
fbgt_else.36490:
	addi	%a1, %zero, 1
fbgt_cont.36491:
	beqi	%a1, 0, bnei_else.36492
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.36494
	addi	%a1, %zero, 0
	j	fbgt_cont.36495
fbgt_else.36494:
	addi	%a1, %zero, 1
fbgt_cont.36495:
	beqi	%a1, 0, bnei_else.36496
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.36498
	addi	%a1, %zero, 0
	j	bnei_cont.36493
fbgt_else.36498:
	addi	%a1, %zero, 1
fbgt_cont.36499:
	j	bnei_cont.36493
bnei_else.36496:
	addi	%a1, %zero, 0
bnei_cont.36497:
	j	bnei_cont.36493
bnei_else.36492:
	addi	%a1, %zero, 0
bnei_cont.36493:
	beqi	%a1, 0, bnei_else.36500
	lw	%a0, 6(%a0)
	j	bnei_cont.36501
bnei_else.36500:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.36502
	addi	%a0, %zero, 0
	j	bnei_cont.36503
bnei_else.36502:
	addi	%a0, %zero, 1
bnei_cont.36503:
bnei_cont.36501:
bnei_cont.36467:
	beqi	%a0, 0, bnei_else.36504
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36504:
	addi	%v0, %v0, 1
	j	check_all_inside.2907
bnei_else.36465:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36425:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2913:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36511
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
	beqi	%a3, 1, bnei_else.36512
	beqi	%a3, 2, bnei_else.36514
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.36516
	addi	%a3, %zero, 1
	j	fbeq_cont.36517
fbeq_else.36516:
	addi	%a3, %zero, 0
fbeq_cont.36517:
	beqi	%a3, 0, bnei_else.36518
	addi	%a0, %zero, 0
	j	bnei_cont.36513
bnei_else.36518:
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
	beqi	%a3, 0, bnei_else.36520
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
	j	bnei_cont.36521
bnei_else.36520:
	fmov	%f1, %f9
bnei_cont.36521:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.36522
	j	bnei_cont.36523
bnei_else.36522:
	flw	%f3, 474(%zero)
	fsub	%f1, %f1, %f3
bnei_cont.36523:
	fmul	%f3, %f8, %f8
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	fblt	%f7, %f1, fbgt_else.36524
	addi	%a3, %zero, 0
	j	fbgt_cont.36525
fbgt_else.36524:
	addi	%a3, %zero, 1
fbgt_cont.36525:
	beqi	%a3, 0, bnei_else.36526
	lw	%a3, 6(%a1)
	beqi	%a3, 0, bnei_else.36528
	fsqrt	%f1, %f1
	fadd	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
	j	bnei_cont.36529
bnei_else.36528:
	fsqrt	%f1, %f1
	fsub	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
bnei_cont.36529:
	addi	%a0, %zero, 1
	j	bnei_cont.36527
bnei_else.36526:
	addi	%a0, %zero, 0
bnei_cont.36527:
bnei_cont.36519:
	j	bnei_cont.36513
bnei_else.36514:
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	fblt	%f6, %f7, fbgt_else.36530
	addi	%a3, %zero, 0
	j	fbgt_cont.36531
fbgt_else.36530:
	addi	%a3, %zero, 1
fbgt_cont.36531:
	beqi	%a3, 0, bnei_else.36532
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
	j	bnei_cont.36533
bnei_else.36532:
	addi	%a0, %zero, 0
bnei_cont.36533:
bnei_cont.36515:
	j	bnei_cont.36513
bnei_else.36512:
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
	fblt	%f9, %f10, fbgt_else.36534
	addi	%a3, %zero, 0
	j	fbgt_cont.36535
fbgt_else.36534:
	addi	%a3, %zero, 1
fbgt_cont.36535:
	beqi	%a3, 0, bnei_else.36536
	flw	%f9, 186(%zero)
	fmul	%f9, %f6, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	lw	%a3, 4(%a1)
	flw	%f10, 2(%a3)
	fblt	%f9, %f10, fbgt_else.36538
	addi	%a3, %zero, 0
	j	fbgt_cont.36539
fbgt_else.36538:
	addi	%a3, %zero, 1
fbgt_cont.36539:
	beqi	%a3, 0, bnei_else.36540
	flw	%f9, 470(%zero)
	fbne	%f7, %f9, fbeq_else.36542
	addi	%a3, %zero, 1
	j	fbeq_cont.36543
fbeq_else.36542:
	addi	%a3, %zero, 0
fbeq_cont.36543:
	beqi	%a3, 0, bnei_else.36544
	addi	%a3, %zero, 0
	j	bnei_cont.36537
bnei_else.36544:
	addi	%a3, %zero, 1
bnei_cont.36545:
	j	bnei_cont.36537
bnei_else.36540:
	addi	%a3, %zero, 0
bnei_cont.36541:
	j	bnei_cont.36537
bnei_else.36536:
	addi	%a3, %zero, 0
bnei_cont.36537:
	beqi	%a3, 0, bnei_else.36546
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.36547
bnei_else.36546:
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
	fblt	%f10, %f11, fbgt_else.36548
	addi	%a3, %zero, 0
	j	fbgt_cont.36549
fbgt_else.36548:
	addi	%a3, %zero, 1
fbgt_cont.36549:
	beqi	%a3, 0, bnei_else.36550
	flw	%f10, 186(%zero)
	fmul	%f10, %f6, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	lw	%a3, 4(%a1)
	flw	%f11, 2(%a3)
	fblt	%f10, %f11, fbgt_else.36552
	addi	%a3, %zero, 0
	j	fbgt_cont.36553
fbgt_else.36552:
	addi	%a3, %zero, 1
fbgt_cont.36553:
	beqi	%a3, 0, bnei_else.36554
	flw	%f10, 470(%zero)
	fbne	%f7, %f10, fbeq_else.36556
	addi	%a3, %zero, 1
	j	fbeq_cont.36557
fbeq_else.36556:
	addi	%a3, %zero, 0
fbeq_cont.36557:
	beqi	%a3, 0, bnei_else.36558
	addi	%a3, %zero, 0
	j	bnei_cont.36551
bnei_else.36558:
	addi	%a3, %zero, 1
bnei_cont.36559:
	j	bnei_cont.36551
bnei_else.36554:
	addi	%a3, %zero, 0
bnei_cont.36555:
	j	bnei_cont.36551
bnei_else.36550:
	addi	%a3, %zero, 0
bnei_cont.36551:
	beqi	%a3, 0, bnei_else.36560
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.36561
bnei_else.36560:
	flw	%f6, 4(%a0)
	fsub	%f5, %f6, %f5
	flw	%f6, 5(%a0)
	fmul	%f5, %f5, %f6
	fmul	%f7, %f5, %f9
	fadd	%f1, %f7, %f1
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f7, 0(%a0)
	fblt	%f1, %f7, fbgt_else.36562
	addi	%a0, %zero, 0
	j	fbgt_cont.36563
fbgt_else.36562:
	addi	%a0, %zero, 1
fbgt_cont.36563:
	beqi	%a0, 0, bnei_else.36564
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f3, 1(%a0)
	fblt	%f1, %f3, fbgt_else.36566
	addi	%a0, %zero, 0
	j	fbgt_cont.36567
fbgt_else.36566:
	addi	%a0, %zero, 1
fbgt_cont.36567:
	beqi	%a0, 0, bnei_else.36568
	flw	%f1, 470(%zero)
	fbne	%f6, %f1, fbeq_else.36570
	addi	%a0, %zero, 1
	j	fbeq_cont.36571
fbeq_else.36570:
	addi	%a0, %zero, 0
fbeq_cont.36571:
	beqi	%a0, 0, bnei_else.36572
	addi	%a0, %zero, 0
	j	bnei_cont.36565
bnei_else.36572:
	addi	%a0, %zero, 1
bnei_cont.36573:
	j	bnei_cont.36565
bnei_else.36568:
	addi	%a0, %zero, 0
bnei_cont.36569:
	j	bnei_cont.36565
bnei_else.36564:
	addi	%a0, %zero, 0
bnei_cont.36565:
	beqi	%a0, 0, bnei_else.36574
	fsw	%f5, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.36575
bnei_else.36574:
	addi	%a0, %zero, 0
bnei_cont.36575:
bnei_cont.36561:
bnei_cont.36547:
bnei_cont.36513:
	flw	%f1, 135(%zero)
	beqi	%a0, 0, bnei_else.36576
	flw	%f3, 467(%zero)
	fblt	%f1, %f3, fbgt_else.36578
	addi	%a0, %zero, 0
	j	bnei_cont.36577
fbgt_else.36578:
	addi	%a0, %zero, 1
fbgt_cont.36579:
	j	bnei_cont.36577
bnei_else.36576:
	addi	%a0, %zero, 0
bnei_cont.36577:
	beqi	%a0, 0, bnei_else.36580
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
	beqi	%a0, -1, bnei_else.36581
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
	beqi	%a1, 1, bnei_else.36583
	beqi	%a1, 2, bnei_else.36585
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
	beqi	%a1, 0, bnei_else.36587
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
	j	bnei_cont.36588
bnei_else.36587:
	fmov	%f3, %f6
bnei_cont.36588:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.36589
	j	bnei_cont.36590
bnei_else.36589:
	flw	%f4, 474(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.36590:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36591
	addi	%a1, %zero, 0
	j	fbgt_cont.36592
fbgt_else.36591:
	addi	%a1, %zero, 1
fbgt_cont.36592:
	beqi	%a0, 0, bnei_else.36593
	beqi	%a1, 0, bnei_else.36595
	addi	%a0, %zero, 0
	j	bnei_cont.36594
bnei_else.36595:
	addi	%a0, %zero, 1
bnei_cont.36596:
	j	bnei_cont.36594
bnei_else.36593:
	add	%a0, %zero, %a1
bnei_cont.36594:
	beqi	%a0, 0, bnei_else.36597
	addi	%a0, %zero, 0
	j	bnei_cont.36584
bnei_else.36597:
	addi	%a0, %zero, 1
bnei_cont.36598:
	j	bnei_cont.36584
bnei_else.36585:
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
	fblt	%f3, %f4, fbgt_else.36599
	addi	%a1, %zero, 0
	j	fbgt_cont.36600
fbgt_else.36599:
	addi	%a1, %zero, 1
fbgt_cont.36600:
	beqi	%a0, 0, bnei_else.36601
	beqi	%a1, 0, bnei_else.36603
	addi	%a0, %zero, 0
	j	bnei_cont.36602
bnei_else.36603:
	addi	%a0, %zero, 1
bnei_cont.36604:
	j	bnei_cont.36602
bnei_else.36601:
	add	%a0, %zero, %a1
bnei_cont.36602:
	beqi	%a0, 0, bnei_else.36605
	addi	%a0, %zero, 0
	j	bnei_cont.36606
bnei_else.36605:
	addi	%a0, %zero, 1
bnei_cont.36606:
bnei_cont.36586:
	j	bnei_cont.36584
bnei_else.36583:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.36607
	addi	%a1, %zero, 0
	j	fbgt_cont.36608
fbgt_else.36607:
	addi	%a1, %zero, 1
fbgt_cont.36608:
	beqi	%a1, 0, bnei_else.36609
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.36611
	addi	%a1, %zero, 0
	j	fbgt_cont.36612
fbgt_else.36611:
	addi	%a1, %zero, 1
fbgt_cont.36612:
	beqi	%a1, 0, bnei_else.36613
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.36615
	addi	%a1, %zero, 0
	j	bnei_cont.36610
fbgt_else.36615:
	addi	%a1, %zero, 1
fbgt_cont.36616:
	j	bnei_cont.36610
bnei_else.36613:
	addi	%a1, %zero, 0
bnei_cont.36614:
	j	bnei_cont.36610
bnei_else.36609:
	addi	%a1, %zero, 0
bnei_cont.36610:
	beqi	%a1, 0, bnei_else.36617
	lw	%a0, 6(%a0)
	j	bnei_cont.36618
bnei_else.36617:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.36619
	addi	%a0, %zero, 0
	j	bnei_cont.36620
bnei_else.36619:
	addi	%a0, %zero, 1
bnei_cont.36620:
bnei_cont.36618:
bnei_cont.36584:
	beqi	%a0, 0, bnei_else.36621
	addi	%v0, %zero, 0
	j	bnei_cont.36582
bnei_else.36621:
	addi	%v0, %a2, 0
	fmov	%f29, %f2
	fmov	%f2, %f1
	fmov	%f1, %f29
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	check_all_inside.2907
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
bnei_cont.36622:
	j	bnei_cont.36582
bnei_else.36581:
	addi	%v0, %zero, 1
bnei_cont.36582:
	beqi	%v0, 0, bnei_else.36623
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36623:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2913
bnei_else.36580:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.36624
	addi	%v0, %v0, 1
	j	shadow_check_and_group.2913
bnei_else.36624:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36511:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2916:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36636
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
	beqi	%v0, 0, bnei_else.36637
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36637:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36638
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
	beqi	%v0, 0, bnei_else.36639
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36639:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36640
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
	beqi	%v0, 0, bnei_else.36641
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36641:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.36642
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
	beqi	%v0, 0, bnei_else.36643
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36643:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2916
bnei_else.36642:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36640:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36638:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.36636:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.36676
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.36677
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
	beqi	%t0, 1, bnei_else.36679
	beqi	%t0, 2, bnei_else.36681
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.36683
	addi	%t0, %zero, 1
	j	fbeq_cont.36684
fbeq_else.36683:
	addi	%t0, %zero, 0
fbeq_cont.36684:
	beqi	%t0, 0, bnei_else.36685
	addi	%a2, %zero, 0
	j	bnei_cont.36680
bnei_else.36685:
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
	beqi	%t0, 0, bnei_else.36687
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
	j	bnei_cont.36688
bnei_else.36687:
	fmov	%f0, %f6
bnei_cont.36688:
	lw	%t0, 1(%a3)
	beqi	%t0, 3, bnei_else.36689
	j	bnei_cont.36690
bnei_else.36689:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.36690:
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0
	fsub	%f0, %f1, %f0
	fblt	%f4, %f0, fbgt_else.36691
	addi	%t0, %zero, 0
	j	fbgt_cont.36692
fbgt_else.36691:
	addi	%t0, %zero, 1
fbgt_cont.36692:
	beqi	%t0, 0, bnei_else.36693
	lw	%a3, 6(%a3)
	beqi	%a3, 0, bnei_else.36695
	fsqrt	%f0, %f0
	fadd	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.36696
bnei_else.36695:
	fsqrt	%f0, %f0
	fsub	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.36696:
	addi	%a2, %zero, 1
	j	bnei_cont.36694
bnei_else.36693:
	addi	%a2, %zero, 0
bnei_cont.36694:
bnei_cont.36686:
	j	bnei_cont.36680
bnei_else.36681:
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	fblt	%f3, %f4, fbgt_else.36697
	addi	%a3, %zero, 0
	j	fbgt_cont.36698
fbgt_else.36697:
	addi	%a3, %zero, 1
fbgt_cont.36698:
	beqi	%a3, 0, bnei_else.36699
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
	j	bnei_cont.36700
bnei_else.36699:
	addi	%a2, %zero, 0
bnei_cont.36700:
bnei_cont.36682:
	j	bnei_cont.36680
bnei_else.36679:
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
	fblt	%f6, %f7, fbgt_else.36701
	addi	%t0, %zero, 0
	j	fbgt_cont.36702
fbgt_else.36701:
	addi	%t0, %zero, 1
fbgt_cont.36702:
	beqi	%t0, 0, bnei_else.36703
	flw	%f6, 186(%zero)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t0, 4(%a3)
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.36705
	addi	%t0, %zero, 0
	j	fbgt_cont.36706
fbgt_else.36705:
	addi	%t0, %zero, 1
fbgt_cont.36706:
	beqi	%t0, 0, bnei_else.36707
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.36709
	addi	%t0, %zero, 1
	j	fbeq_cont.36710
fbeq_else.36709:
	addi	%t0, %zero, 0
fbeq_cont.36710:
	beqi	%t0, 0, bnei_else.36711
	addi	%t0, %zero, 0
	j	bnei_cont.36704
bnei_else.36711:
	addi	%t0, %zero, 1
bnei_cont.36712:
	j	bnei_cont.36704
bnei_else.36707:
	addi	%t0, %zero, 0
bnei_cont.36708:
	j	bnei_cont.36704
bnei_else.36703:
	addi	%t0, %zero, 0
bnei_cont.36704:
	beqi	%t0, 0, bnei_else.36713
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 1
	j	bnei_cont.36714
bnei_else.36713:
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
	fblt	%f7, %f8, fbgt_else.36715
	addi	%t0, %zero, 0
	j	fbgt_cont.36716
fbgt_else.36715:
	addi	%t0, %zero, 1
fbgt_cont.36716:
	beqi	%t0, 0, bnei_else.36717
	flw	%f7, 186(%zero)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.36719
	addi	%t0, %zero, 0
	j	fbgt_cont.36720
fbgt_else.36719:
	addi	%t0, %zero, 1
fbgt_cont.36720:
	beqi	%t0, 0, bnei_else.36721
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.36723
	addi	%t0, %zero, 1
	j	fbeq_cont.36724
fbeq_else.36723:
	addi	%t0, %zero, 0
fbeq_cont.36724:
	beqi	%t0, 0, bnei_else.36725
	addi	%t0, %zero, 0
	j	bnei_cont.36718
bnei_else.36725:
	addi	%t0, %zero, 1
bnei_cont.36726:
	j	bnei_cont.36718
bnei_else.36721:
	addi	%t0, %zero, 0
bnei_cont.36722:
	j	bnei_cont.36718
bnei_else.36717:
	addi	%t0, %zero, 0
bnei_cont.36718:
	beqi	%t0, 0, bnei_else.36727
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 2
	j	bnei_cont.36728
bnei_else.36727:
	flw	%f3, 4(%a2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f4, 0(%a2)
	fblt	%f0, %f4, fbgt_else.36729
	addi	%a2, %zero, 0
	j	fbgt_cont.36730
fbgt_else.36729:
	addi	%a2, %zero, 1
fbgt_cont.36730:
	beqi	%a2, 0, bnei_else.36731
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f1, 1(%a2)
	fblt	%f0, %f1, fbgt_else.36733
	addi	%a2, %zero, 0
	j	fbgt_cont.36734
fbgt_else.36733:
	addi	%a2, %zero, 1
fbgt_cont.36734:
	beqi	%a2, 0, bnei_else.36735
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.36737
	addi	%a2, %zero, 1
	j	fbeq_cont.36738
fbeq_else.36737:
	addi	%a2, %zero, 0
fbeq_cont.36738:
	beqi	%a2, 0, bnei_else.36739
	addi	%a2, %zero, 0
	j	bnei_cont.36732
bnei_else.36739:
	addi	%a2, %zero, 1
bnei_cont.36740:
	j	bnei_cont.36732
bnei_else.36735:
	addi	%a2, %zero, 0
bnei_cont.36736:
	j	bnei_cont.36732
bnei_else.36731:
	addi	%a2, %zero, 0
bnei_cont.36732:
	beqi	%a2, 0, bnei_else.36741
	fsw	%f2, 135(%zero)
	addi	%a2, %zero, 3
	j	bnei_cont.36742
bnei_else.36741:
	addi	%a2, %zero, 0
bnei_cont.36742:
bnei_cont.36728:
bnei_cont.36714:
bnei_cont.36680:
	beqi	%a2, 0, bnei_else.36743
	flw	%f0, 135(%zero)
	flw	%f1, 465(%zero)
	fblt	%f0, %f1, fbgt_else.36745
	addi	%a2, %zero, 0
	j	fbgt_cont.36746
fbgt_else.36745:
	addi	%a2, %zero, 1
fbgt_cont.36746:
	beqi	%a2, 0, bnei_else.36747
	lw	%a2, 1(%a0)
	beqi	%a2, -1, bnei_else.36749
	lw	%a2, 83(%a2)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36751
	addi	%v0, %zero, 1
	j	bnei_cont.36750
bnei_else.36751:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.36753
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36755
	addi	%v0, %zero, 1
	j	bnei_cont.36754
bnei_else.36755:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.36757
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36759
	addi	%v0, %zero, 1
	j	bnei_cont.36758
bnei_else.36759:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.36760:
	j	bnei_cont.36758
bnei_else.36757:
	addi	%v0, %zero, 0
bnei_cont.36758:
bnei_cont.36756:
	j	bnei_cont.36754
bnei_else.36753:
	addi	%v0, %zero, 0
bnei_cont.36754:
bnei_cont.36752:
	j	bnei_cont.36750
bnei_else.36749:
	addi	%v0, %zero, 0
bnei_cont.36750:
	beqi	%v0, 0, bnei_else.36761
	addi	%v0, %zero, 1
	j	bnei_cont.36678
bnei_else.36761:
	addi	%v0, %zero, 0
bnei_cont.36762:
	j	bnei_cont.36678
bnei_else.36747:
	addi	%v0, %zero, 0
bnei_cont.36748:
	j	bnei_cont.36678
bnei_else.36743:
	addi	%v0, %zero, 0
bnei_cont.36744:
	j	bnei_cont.36678
bnei_else.36677:
	addi	%v0, %zero, 1
bnei_cont.36678:
	beqi	%v0, 0, bnei_else.36763
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.36764
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36766
	addi	%v0, %zero, 1
	j	bnei_cont.36765
bnei_else.36766:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.36768
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36770
	addi	%v0, %zero, 1
	j	bnei_cont.36769
bnei_else.36770:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.36772
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.36774
	addi	%v0, %zero, 1
	j	bnei_cont.36773
bnei_else.36774:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.36775:
	j	bnei_cont.36773
bnei_else.36772:
	addi	%v0, %zero, 0
bnei_cont.36773:
bnei_cont.36771:
	j	bnei_cont.36769
bnei_else.36768:
	addi	%v0, %zero, 0
bnei_cont.36769:
bnei_cont.36767:
	j	bnei_cont.36765
bnei_else.36764:
	addi	%v0, %zero, 0
bnei_cont.36765:
	beqi	%v0, 0, bnei_else.36776
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.36776:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.36763:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.36676:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2922:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.36811
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
	beqi	%t0, 1, bnei_else.36812
	beqi	%t0, 2, bnei_else.36814
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
	beqi	%t0, 0, bnei_else.36816
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
	j	bnei_cont.36817
bnei_else.36816:
bnei_cont.36817:
	flw	%f11, 470(%zero)
	fbne	%f9, %f11, fbeq_else.36818
	addi	%t1, %zero, 1
	j	fbeq_cont.36819
fbeq_else.36818:
	addi	%t1, %zero, 0
fbeq_cont.36819:
	beqi	%t1, 0, bnei_else.36820
	addi	%t0, %zero, 0
	j	bnei_cont.36813
bnei_else.36820:
	fmul	%f14, %f6, %f1
	fmul	%f14, %f14, %f10
	fmul	%f15, %f7, %f3
	fmul	%f15, %f15, %f12
	fadd	%f14, %f14, %f15
	fmul	%f15, %f8, %f5
	fmul	%f15, %f15, %f13
	fadd	%f14, %f14, %f15
	beqi	%t0, 0, bnei_else.36822
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
	j	bnei_cont.36823
bnei_else.36822:
	fmov	%f6, %f14
bnei_cont.36823:
	fmul	%f7, %f1, %f1
	fmul	%f7, %f7, %f10
	fmul	%f8, %f3, %f3
	fmul	%f8, %f8, %f12
	fadd	%f7, %f7, %f8
	fmul	%f8, %f5, %f5
	fmul	%f8, %f8, %f13
	fadd	%f7, %f7, %f8
	beqi	%t0, 0, bnei_else.36824
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
	j	bnei_cont.36825
bnei_else.36824:
	fmov	%f1, %f7
bnei_cont.36825:
	lw	%t0, 1(%a2)
	beqi	%t0, 3, bnei_else.36826
	j	bnei_cont.36827
bnei_else.36826:
	flw	%f3, 474(%zero)
	fsub	%f1, %f1, %f3
bnei_cont.36827:
	fmul	%f3, %f6, %f6
	fmul	%f1, %f9, %f1
	fsub	%f1, %f3, %f1
	fblt	%f11, %f1, fbgt_else.36828
	addi	%t0, %zero, 0
	j	fbgt_cont.36829
fbgt_else.36828:
	addi	%t0, %zero, 1
fbgt_cont.36829:
	beqi	%t0, 0, bnei_else.36830
	fsqrt	%f1, %f1
	lw	%t0, 6(%a2)
	beqi	%t0, 0, bnei_else.36832
	j	bnei_cont.36833
bnei_else.36832:
	fneg	%f1, %f1
bnei_cont.36833:
	fsub	%f1, %f1, %f6
	fdiv	%f1, %f1, %f9
	fsw	%f1, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36831
bnei_else.36830:
	addi	%t0, %zero, 0
bnei_cont.36831:
bnei_cont.36821:
	j	bnei_cont.36813
bnei_else.36814:
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
	fblt	%f8, %f6, fbgt_else.36834
	addi	%t0, %zero, 0
	j	fbgt_cont.36835
fbgt_else.36834:
	addi	%t0, %zero, 1
fbgt_cont.36835:
	beqi	%t0, 0, bnei_else.36836
	fmul	%f1, %f7, %f1
	fmul	%f3, %f9, %f3
	fadd	%f1, %f1, %f3
	fmul	%f3, %f10, %f5
	fadd	%f1, %f1, %f3
	fneg	%f1, %f1
	fdiv	%f1, %f1, %f6
	fsw	%f1, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36837
bnei_else.36836:
	addi	%t0, %zero, 0
bnei_cont.36837:
bnei_cont.36815:
	j	bnei_cont.36813
bnei_else.36812:
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.36838
	addi	%t0, %zero, 1
	j	fbeq_cont.36839
fbeq_else.36838:
	addi	%t0, %zero, 0
fbeq_cont.36839:
	beqi	%t0, 0, bnei_else.36840
	addi	%t0, %zero, 0
	j	bnei_cont.36841
bnei_else.36840:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f6, %f7, fbgt_else.36842
	addi	%t2, %zero, 0
	j	fbgt_cont.36843
fbgt_else.36842:
	addi	%t2, %zero, 1
fbgt_cont.36843:
	beqi	%t1, 0, bnei_else.36844
	beqi	%t2, 0, bnei_else.36846
	addi	%t1, %zero, 0
	j	bnei_cont.36845
bnei_else.36846:
	addi	%t1, %zero, 1
bnei_cont.36847:
	j	bnei_cont.36845
bnei_else.36844:
	add	%t1, %zero, %t2
bnei_cont.36845:
	flw	%f8, 0(%t0)
	beqi	%t1, 0, bnei_else.36848
	j	bnei_cont.36849
bnei_else.36848:
	fneg	%f8, %f8
bnei_cont.36849:
	fsub	%f8, %f8, %f1
	fdiv	%f8, %f8, %f6
	flw	%f9, 1(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f3
	fabs	%f9, %f9
	flw	%f10, 1(%t0)
	fblt	%f9, %f10, fbgt_else.36850
	addi	%t1, %zero, 0
	j	fbgt_cont.36851
fbgt_else.36850:
	addi	%t1, %zero, 1
fbgt_cont.36851:
	beqi	%t1, 0, bnei_else.36852
	flw	%f9, 2(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	flw	%f10, 2(%t0)
	fblt	%f9, %f10, fbgt_else.36854
	addi	%t0, %zero, 0
	j	fbgt_cont.36855
fbgt_else.36854:
	addi	%t0, %zero, 1
fbgt_cont.36855:
	beqi	%t0, 0, bnei_else.36856
	fsw	%f8, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36853
bnei_else.36856:
	addi	%t0, %zero, 0
bnei_cont.36857:
	j	bnei_cont.36853
bnei_else.36852:
	addi	%t0, %zero, 0
bnei_cont.36853:
bnei_cont.36841:
	beqi	%t0, 0, bnei_else.36858
	addi	%t0, %zero, 1
	j	bnei_cont.36859
bnei_else.36858:
	flw	%f8, 1(%a0)
	fbne	%f8, %f7, fbeq_else.36860
	addi	%t0, %zero, 1
	j	fbeq_cont.36861
fbeq_else.36860:
	addi	%t0, %zero, 0
fbeq_cont.36861:
	beqi	%t0, 0, bnei_else.36862
	addi	%t0, %zero, 0
	j	bnei_cont.36863
bnei_else.36862:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f8, %f7, fbgt_else.36864
	addi	%t2, %zero, 0
	j	fbgt_cont.36865
fbgt_else.36864:
	addi	%t2, %zero, 1
fbgt_cont.36865:
	beqi	%t1, 0, bnei_else.36866
	beqi	%t2, 0, bnei_else.36868
	addi	%t1, %zero, 0
	j	bnei_cont.36867
bnei_else.36868:
	addi	%t1, %zero, 1
bnei_cont.36869:
	j	bnei_cont.36867
bnei_else.36866:
	add	%t1, %zero, %t2
bnei_cont.36867:
	flw	%f9, 1(%t0)
	beqi	%t1, 0, bnei_else.36870
	j	bnei_cont.36871
bnei_else.36870:
	fneg	%f9, %f9
bnei_cont.36871:
	fsub	%f9, %f9, %f3
	fdiv	%f9, %f9, %f8
	flw	%f10, 2(%a0)
	fmul	%f10, %f9, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	flw	%f11, 2(%t0)
	fblt	%f10, %f11, fbgt_else.36872
	addi	%t1, %zero, 0
	j	fbgt_cont.36873
fbgt_else.36872:
	addi	%t1, %zero, 1
fbgt_cont.36873:
	beqi	%t1, 0, bnei_else.36874
	fmul	%f10, %f9, %f6
	fadd	%f10, %f10, %f1
	fabs	%f10, %f10
	flw	%f11, 0(%t0)
	fblt	%f10, %f11, fbgt_else.36876
	addi	%t0, %zero, 0
	j	fbgt_cont.36877
fbgt_else.36876:
	addi	%t0, %zero, 1
fbgt_cont.36877:
	beqi	%t0, 0, bnei_else.36878
	fsw	%f9, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36875
bnei_else.36878:
	addi	%t0, %zero, 0
bnei_cont.36879:
	j	bnei_cont.36875
bnei_else.36874:
	addi	%t0, %zero, 0
bnei_cont.36875:
bnei_cont.36863:
	beqi	%t0, 0, bnei_else.36880
	addi	%t0, %zero, 2
	j	bnei_cont.36881
bnei_else.36880:
	flw	%f9, 2(%a0)
	fbne	%f9, %f7, fbeq_else.36882
	addi	%t0, %zero, 1
	j	fbeq_cont.36883
fbeq_else.36882:
	addi	%t0, %zero, 0
fbeq_cont.36883:
	beqi	%t0, 0, bnei_else.36884
	addi	%t0, %zero, 0
	j	bnei_cont.36885
bnei_else.36884:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f9, %f7, fbgt_else.36886
	addi	%t2, %zero, 0
	j	fbgt_cont.36887
fbgt_else.36886:
	addi	%t2, %zero, 1
fbgt_cont.36887:
	beqi	%t1, 0, bnei_else.36888
	beqi	%t2, 0, bnei_else.36890
	addi	%t1, %zero, 0
	j	bnei_cont.36889
bnei_else.36890:
	addi	%t1, %zero, 1
bnei_cont.36891:
	j	bnei_cont.36889
bnei_else.36888:
	add	%t1, %zero, %t2
bnei_cont.36889:
	flw	%f7, 2(%t0)
	beqi	%t1, 0, bnei_else.36892
	j	bnei_cont.36893
bnei_else.36892:
	fneg	%f7, %f7
bnei_cont.36893:
	fsub	%f5, %f7, %f5
	fdiv	%f5, %f5, %f9
	fmul	%f6, %f5, %f6
	fadd	%f1, %f6, %f1
	fabs	%f1, %f1
	flw	%f6, 0(%t0)
	fblt	%f1, %f6, fbgt_else.36894
	addi	%t1, %zero, 0
	j	fbgt_cont.36895
fbgt_else.36894:
	addi	%t1, %zero, 1
fbgt_cont.36895:
	beqi	%t1, 0, bnei_else.36896
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	flw	%f3, 1(%t0)
	fblt	%f1, %f3, fbgt_else.36898
	addi	%t0, %zero, 0
	j	fbgt_cont.36899
fbgt_else.36898:
	addi	%t0, %zero, 1
fbgt_cont.36899:
	beqi	%t0, 0, bnei_else.36900
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.36897
bnei_else.36900:
	addi	%t0, %zero, 0
bnei_cont.36901:
	j	bnei_cont.36897
bnei_else.36896:
	addi	%t0, %zero, 0
bnei_cont.36897:
bnei_cont.36885:
	beqi	%t0, 0, bnei_else.36902
	addi	%t0, %zero, 3
	j	bnei_cont.36903
bnei_else.36902:
	addi	%t0, %zero, 0
bnei_cont.36903:
bnei_cont.36881:
bnei_cont.36859:
bnei_cont.36813:
	beqi	%t0, 0, bnei_else.36904
	flw	%f1, 135(%zero)
	flw	%f3, 470(%zero)
	fblt	%f3, %f1, fbgt_else.36905
	addi	%a2, %zero, 0
	j	fbgt_cont.36906
fbgt_else.36905:
	addi	%a2, %zero, 1
fbgt_cont.36906:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 0, bnei_else.36907
	flw	%f5, 137(%zero)
	fblt	%f1, %f5, fbgt_else.36909
	addi	%a2, %zero, 0
	j	fbgt_cont.36910
fbgt_else.36909:
	addi	%a2, %zero, 1
fbgt_cont.36910:
	beqi	%a2, 0, bnei_else.36911
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
	beqi	%a2, -1, bnei_else.36913
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
	beqi	%t1, 1, bnei_else.36915
	beqi	%t1, 2, bnei_else.36917
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
	beqi	%t1, 0, bnei_else.36919
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
	j	bnei_cont.36920
bnei_else.36919:
	fmov	%f5, %f8
bnei_cont.36920:
	lw	%t1, 1(%a2)
	beqi	%t1, 3, bnei_else.36921
	j	bnei_cont.36922
bnei_else.36921:
	flw	%f6, 474(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.36922:
	lw	%a2, 6(%a2)
	fblt	%f5, %f3, fbgt_else.36923
	addi	%t1, %zero, 0
	j	fbgt_cont.36924
fbgt_else.36923:
	addi	%t1, %zero, 1
fbgt_cont.36924:
	beqi	%a2, 0, bnei_else.36925
	beqi	%t1, 0, bnei_else.36927
	addi	%a2, %zero, 0
	j	bnei_cont.36926
bnei_else.36927:
	addi	%a2, %zero, 1
bnei_cont.36928:
	j	bnei_cont.36926
bnei_else.36925:
	add	%a2, %zero, %t1
bnei_cont.36926:
	beqi	%a2, 0, bnei_else.36929
	addi	%a2, %zero, 0
	j	bnei_cont.36916
bnei_else.36929:
	addi	%a2, %zero, 1
bnei_cont.36930:
	j	bnei_cont.36916
bnei_else.36917:
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
	fblt	%f5, %f3, fbgt_else.36931
	addi	%t1, %zero, 0
	j	fbgt_cont.36932
fbgt_else.36931:
	addi	%t1, %zero, 1
fbgt_cont.36932:
	beqi	%a2, 0, bnei_else.36933
	beqi	%t1, 0, bnei_else.36935
	addi	%a2, %zero, 0
	j	bnei_cont.36934
bnei_else.36935:
	addi	%a2, %zero, 1
bnei_cont.36936:
	j	bnei_cont.36934
bnei_else.36933:
	add	%a2, %zero, %t1
bnei_cont.36934:
	beqi	%a2, 0, bnei_else.36937
	addi	%a2, %zero, 0
	j	bnei_cont.36938
bnei_else.36937:
	addi	%a2, %zero, 1
bnei_cont.36938:
bnei_cont.36918:
	j	bnei_cont.36916
bnei_else.36915:
	fabs	%f3, %f5
	lw	%t1, 4(%a2)
	flw	%f5, 0(%t1)
	fblt	%f3, %f5, fbgt_else.36939
	addi	%t1, %zero, 0
	j	fbgt_cont.36940
fbgt_else.36939:
	addi	%t1, %zero, 1
fbgt_cont.36940:
	beqi	%t1, 0, bnei_else.36941
	fabs	%f3, %f6
	lw	%t1, 4(%a2)
	flw	%f5, 1(%t1)
	fblt	%f3, %f5, fbgt_else.36943
	addi	%t1, %zero, 0
	j	fbgt_cont.36944
fbgt_else.36943:
	addi	%t1, %zero, 1
fbgt_cont.36944:
	beqi	%t1, 0, bnei_else.36945
	fabs	%f3, %f7
	lw	%t1, 4(%a2)
	flw	%f5, 2(%t1)
	fblt	%f3, %f5, fbgt_else.36947
	addi	%t1, %zero, 0
	j	bnei_cont.36942
fbgt_else.36947:
	addi	%t1, %zero, 1
fbgt_cont.36948:
	j	bnei_cont.36942
bnei_else.36945:
	addi	%t1, %zero, 0
bnei_cont.36946:
	j	bnei_cont.36942
bnei_else.36941:
	addi	%t1, %zero, 0
bnei_cont.36942:
	beqi	%t1, 0, bnei_else.36949
	lw	%a2, 6(%a2)
	j	bnei_cont.36950
bnei_else.36949:
	lw	%a2, 6(%a2)
	beqi	%a2, 0, bnei_else.36951
	addi	%a2, %zero, 0
	j	bnei_cont.36952
bnei_else.36951:
	addi	%a2, %zero, 1
bnei_cont.36952:
bnei_cont.36950:
bnei_cont.36916:
	beqi	%a2, 0, bnei_else.36953
	addi	%v0, %zero, 0
	j	bnei_cont.36914
bnei_else.36953:
	addi	%v0, %a3, 0
	fmov	%f1, %f2
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	check_all_inside.2907
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.36954:
	j	bnei_cont.36914
bnei_else.36913:
	addi	%v0, %zero, 1
bnei_cont.36914:
	beqi	%v0, 0, bnei_else.36955
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
	j	bnei_cont.36908
bnei_else.36955:
bnei_cont.36956:
	j	bnei_cont.36908
bnei_else.36911:
bnei_cont.36912:
	j	bnei_cont.36908
bnei_else.36907:
bnei_cont.36908:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2922
bnei_else.36904:
	lw	%a1, 6(%a2)
	beqi	%a1, 0, bnei_else.36957
	addi	%v0, %v0, 1
	j	solve_each_element.2922
bnei_else.36957:
	jr	%ra
bnei_else.36811:
	jr	%ra
solve_one_or_network.2926:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.36992
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
	beqi	%a0, -1, bnei_else.36993
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
	beqi	%a0, -1, bnei_else.36994
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
	beqi	%a0, -1, bnei_else.36995
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
	beqi	%a0, -1, bnei_else.36996
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
	beqi	%a0, -1, bnei_else.36997
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
	beqi	%a0, -1, bnei_else.36998
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
	beqi	%a0, -1, bnei_else.36999
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
bnei_else.36999:
	jr	%ra
bnei_else.36998:
	jr	%ra
bnei_else.36997:
	jr	%ra
bnei_else.36996:
	jr	%ra
bnei_else.36995:
	jr	%ra
bnei_else.36994:
	jr	%ra
bnei_else.36993:
	jr	%ra
bnei_else.36992:
	jr	%ra
trace_or_matrix.2930:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.37130
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.37131
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
	beqi	%t0, 1, bnei_else.37133
	beqi	%t0, 2, bnei_else.37135
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
	beqi	%t0, 0, bnei_else.37137
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
	j	bnei_cont.37138
bnei_else.37137:
bnei_cont.37138:
	flw	%f8, 470(%zero)
	fbne	%f6, %f8, fbeq_else.37139
	addi	%t1, %zero, 1
	j	fbeq_cont.37140
fbeq_else.37139:
	addi	%t1, %zero, 0
fbeq_cont.37140:
	beqi	%t1, 0, bnei_else.37141
	addi	%a3, %zero, 0
	j	bnei_cont.37134
bnei_else.37141:
	fmul	%f11, %f3, %f0
	fmul	%f11, %f11, %f7
	fmul	%f12, %f4, %f1
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	fmul	%f12, %f5, %f2
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	beqi	%t0, 0, bnei_else.37143
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
	j	bnei_cont.37144
bnei_else.37143:
	fmov	%f3, %f11
bnei_cont.37144:
	fmul	%f4, %f0, %f0
	fmul	%f4, %f4, %f7
	fmul	%f5, %f1, %f1
	fmul	%f5, %f5, %f9
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2
	fmul	%f5, %f5, %f10
	fadd	%f4, %f4, %f5
	beqi	%t0, 0, bnei_else.37145
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
	j	bnei_cont.37146
bnei_else.37145:
	fmov	%f0, %f4
bnei_cont.37146:
	lw	%t0, 1(%a3)
	beqi	%t0, 3, bnei_else.37147
	j	bnei_cont.37148
bnei_else.37147:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.37148:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f8, %f0, fbgt_else.37149
	addi	%t0, %zero, 0
	j	fbgt_cont.37150
fbgt_else.37149:
	addi	%t0, %zero, 1
fbgt_cont.37150:
	beqi	%t0, 0, bnei_else.37151
	fsqrt	%f0, %f0
	lw	%a3, 6(%a3)
	beqi	%a3, 0, bnei_else.37153
	j	bnei_cont.37154
bnei_else.37153:
	fneg	%f0, %f0
bnei_cont.37154:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37152
bnei_else.37151:
	addi	%a3, %zero, 0
bnei_cont.37152:
bnei_cont.37142:
	j	bnei_cont.37134
bnei_else.37135:
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
	fblt	%f5, %f3, fbgt_else.37155
	addi	%a3, %zero, 0
	j	fbgt_cont.37156
fbgt_else.37155:
	addi	%a3, %zero, 1
fbgt_cont.37156:
	beqi	%a3, 0, bnei_else.37157
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37158
bnei_else.37157:
	addi	%a3, %zero, 0
bnei_cont.37158:
bnei_cont.37136:
	j	bnei_cont.37134
bnei_else.37133:
	flw	%f3, 0(%a0)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37159
	addi	%t0, %zero, 1
	j	fbeq_cont.37160
fbeq_else.37159:
	addi	%t0, %zero, 0
fbeq_cont.37160:
	beqi	%t0, 0, bnei_else.37161
	addi	%t0, %zero, 0
	j	bnei_cont.37162
bnei_else.37161:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f3, %f4, fbgt_else.37163
	addi	%t2, %zero, 0
	j	fbgt_cont.37164
fbgt_else.37163:
	addi	%t2, %zero, 1
fbgt_cont.37164:
	beqi	%t1, 0, bnei_else.37165
	beqi	%t2, 0, bnei_else.37167
	addi	%t1, %zero, 0
	j	bnei_cont.37166
bnei_else.37167:
	addi	%t1, %zero, 1
bnei_cont.37168:
	j	bnei_cont.37166
bnei_else.37165:
	add	%t1, %zero, %t2
bnei_cont.37166:
	flw	%f5, 0(%t0)
	beqi	%t1, 0, bnei_else.37169
	j	bnei_cont.37170
bnei_else.37169:
	fneg	%f5, %f5
bnei_cont.37170:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%t0)
	fblt	%f6, %f7, fbgt_else.37171
	addi	%t1, %zero, 0
	j	fbgt_cont.37172
fbgt_else.37171:
	addi	%t1, %zero, 1
fbgt_cont.37172:
	beqi	%t1, 0, bnei_else.37173
	flw	%f6, 2(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.37175
	addi	%t0, %zero, 0
	j	fbgt_cont.37176
fbgt_else.37175:
	addi	%t0, %zero, 1
fbgt_cont.37176:
	beqi	%t0, 0, bnei_else.37177
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.37174
bnei_else.37177:
	addi	%t0, %zero, 0
bnei_cont.37178:
	j	bnei_cont.37174
bnei_else.37173:
	addi	%t0, %zero, 0
bnei_cont.37174:
bnei_cont.37162:
	beqi	%t0, 0, bnei_else.37179
	addi	%a3, %zero, 1
	j	bnei_cont.37180
bnei_else.37179:
	flw	%f5, 1(%a0)
	fbne	%f5, %f4, fbeq_else.37181
	addi	%t0, %zero, 1
	j	fbeq_cont.37182
fbeq_else.37181:
	addi	%t0, %zero, 0
fbeq_cont.37182:
	beqi	%t0, 0, bnei_else.37183
	addi	%t0, %zero, 0
	j	bnei_cont.37184
bnei_else.37183:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f5, %f4, fbgt_else.37185
	addi	%t2, %zero, 0
	j	fbgt_cont.37186
fbgt_else.37185:
	addi	%t2, %zero, 1
fbgt_cont.37186:
	beqi	%t1, 0, bnei_else.37187
	beqi	%t2, 0, bnei_else.37189
	addi	%t1, %zero, 0
	j	bnei_cont.37188
bnei_else.37189:
	addi	%t1, %zero, 1
bnei_cont.37190:
	j	bnei_cont.37188
bnei_else.37187:
	add	%t1, %zero, %t2
bnei_cont.37188:
	flw	%f6, 1(%t0)
	beqi	%t1, 0, bnei_else.37191
	j	bnei_cont.37192
bnei_else.37191:
	fneg	%f6, %f6
bnei_cont.37192:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a0)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.37193
	addi	%t1, %zero, 0
	j	fbgt_cont.37194
fbgt_else.37193:
	addi	%t1, %zero, 1
fbgt_cont.37194:
	beqi	%t1, 0, bnei_else.37195
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%t0)
	fblt	%f7, %f8, fbgt_else.37197
	addi	%t0, %zero, 0
	j	fbgt_cont.37198
fbgt_else.37197:
	addi	%t0, %zero, 1
fbgt_cont.37198:
	beqi	%t0, 0, bnei_else.37199
	fsw	%f6, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.37196
bnei_else.37199:
	addi	%t0, %zero, 0
bnei_cont.37200:
	j	bnei_cont.37196
bnei_else.37195:
	addi	%t0, %zero, 0
bnei_cont.37196:
bnei_cont.37184:
	beqi	%t0, 0, bnei_else.37201
	addi	%a3, %zero, 2
	j	bnei_cont.37202
bnei_else.37201:
	flw	%f6, 2(%a0)
	fbne	%f6, %f4, fbeq_else.37203
	addi	%t0, %zero, 1
	j	fbeq_cont.37204
fbeq_else.37203:
	addi	%t0, %zero, 0
fbeq_cont.37204:
	beqi	%t0, 0, bnei_else.37205
	addi	%a3, %zero, 0
	j	bnei_cont.37206
bnei_else.37205:
	lw	%t0, 4(%a3)
	lw	%a3, 6(%a3)
	fblt	%f6, %f4, fbgt_else.37207
	addi	%t1, %zero, 0
	j	fbgt_cont.37208
fbgt_else.37207:
	addi	%t1, %zero, 1
fbgt_cont.37208:
	beqi	%a3, 0, bnei_else.37209
	beqi	%t1, 0, bnei_else.37211
	addi	%a3, %zero, 0
	j	bnei_cont.37210
bnei_else.37211:
	addi	%a3, %zero, 1
bnei_cont.37212:
	j	bnei_cont.37210
bnei_else.37209:
	add	%a3, %zero, %t1
bnei_cont.37210:
	flw	%f4, 2(%t0)
	beqi	%a3, 0, bnei_else.37213
	j	bnei_cont.37214
bnei_else.37213:
	fneg	%f4, %f4
bnei_cont.37214:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%t0)
	fblt	%f0, %f3, fbgt_else.37215
	addi	%a3, %zero, 0
	j	fbgt_cont.37216
fbgt_else.37215:
	addi	%a3, %zero, 1
fbgt_cont.37216:
	beqi	%a3, 0, bnei_else.37217
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.37219
	addi	%a3, %zero, 0
	j	fbgt_cont.37220
fbgt_else.37219:
	addi	%a3, %zero, 1
fbgt_cont.37220:
	beqi	%a3, 0, bnei_else.37221
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37218
bnei_else.37221:
	addi	%a3, %zero, 0
bnei_cont.37222:
	j	bnei_cont.37218
bnei_else.37217:
	addi	%a3, %zero, 0
bnei_cont.37218:
bnei_cont.37206:
	beqi	%a3, 0, bnei_else.37223
	addi	%a3, %zero, 3
	j	bnei_cont.37224
bnei_else.37223:
	addi	%a3, %zero, 0
bnei_cont.37224:
bnei_cont.37202:
bnei_cont.37180:
bnei_cont.37134:
	beqi	%a3, 0, bnei_else.37225
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.37227
	addi	%a3, %zero, 0
	j	fbgt_cont.37228
fbgt_else.37227:
	addi	%a3, %zero, 1
fbgt_cont.37228:
	beqi	%a3, 0, bnei_else.37229
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.37231
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
	beqi	%v1, -1, bnei_else.37233
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
	beqi	%v1, -1, bnei_else.37235
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
	beqi	%v1, -1, bnei_else.37237
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
	beqi	%v1, -1, bnei_else.37239
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
	beqi	%v1, -1, bnei_else.37241
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
	beqi	%v1, -1, bnei_else.37243
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
	j	bnei_cont.37132
bnei_else.37243:
bnei_cont.37244:
	j	bnei_cont.37132
bnei_else.37241:
bnei_cont.37242:
	j	bnei_cont.37132
bnei_else.37239:
bnei_cont.37240:
	j	bnei_cont.37132
bnei_else.37237:
bnei_cont.37238:
	j	bnei_cont.37132
bnei_else.37235:
bnei_cont.37236:
	j	bnei_cont.37132
bnei_else.37233:
bnei_cont.37234:
	j	bnei_cont.37132
bnei_else.37231:
bnei_cont.37232:
	j	bnei_cont.37132
bnei_else.37229:
bnei_cont.37230:
	j	bnei_cont.37132
bnei_else.37225:
bnei_cont.37226:
	j	bnei_cont.37132
bnei_else.37131:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.37245
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
	beqi	%v1, -1, bnei_else.37247
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
	beqi	%v1, -1, bnei_else.37249
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
	beqi	%v1, -1, bnei_else.37251
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
	beqi	%v1, -1, bnei_else.37253
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
	beqi	%v1, -1, bnei_else.37255
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
	beqi	%v1, -1, bnei_else.37257
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
	j	bnei_cont.37246
bnei_else.37257:
bnei_cont.37258:
	j	bnei_cont.37246
bnei_else.37255:
bnei_cont.37256:
	j	bnei_cont.37246
bnei_else.37253:
bnei_cont.37254:
	j	bnei_cont.37246
bnei_else.37251:
bnei_cont.37252:
	j	bnei_cont.37246
bnei_else.37249:
bnei_cont.37250:
	j	bnei_cont.37246
bnei_else.37247:
bnei_cont.37248:
	j	bnei_cont.37246
bnei_else.37245:
bnei_cont.37246:
bnei_cont.37132:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.37259
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.37260
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
	beqi	%a2, 1, bnei_else.37262
	beqi	%a2, 2, bnei_else.37264
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
	beqi	%a3, 0, bnei_else.37266
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
	j	bnei_cont.37267
bnei_else.37266:
bnei_cont.37267:
	flw	%f7, 470(%zero)
	fbne	%f6, %f7, fbeq_else.37268
	addi	%a3, %zero, 1
	j	fbeq_cont.37269
fbeq_else.37268:
	addi	%a3, %zero, 0
fbeq_cont.37269:
	beqi	%a3, 0, bnei_else.37270
	addi	%a1, %zero, 0
	j	bnei_cont.37263
bnei_else.37270:
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
	beqi	%a3, 0, bnei_else.37272
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
	j	bnei_cont.37273
bnei_else.37272:
	fmov	%f3, %f8
bnei_cont.37273:
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
	beqi	%a3, 0, bnei_else.37274
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
	j	bnei_cont.37275
bnei_else.37274:
	fmov	%f0, %f4
bnei_cont.37275:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.37276
	j	bnei_cont.37277
bnei_else.37276:
	flw	%f1, 474(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.37277:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.37278
	addi	%a3, %zero, 0
	j	fbgt_cont.37279
fbgt_else.37278:
	addi	%a3, %zero, 1
fbgt_cont.37279:
	beqi	%a3, 0, bnei_else.37280
	fsqrt	%f0, %f0
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.37282
	j	bnei_cont.37283
bnei_else.37282:
	fneg	%f0, %f0
bnei_cont.37283:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37281
bnei_else.37280:
	addi	%a1, %zero, 0
bnei_cont.37281:
bnei_cont.37271:
	j	bnei_cont.37263
bnei_else.37264:
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
	fblt	%f5, %f3, fbgt_else.37284
	addi	%a1, %zero, 0
	j	fbgt_cont.37285
fbgt_else.37284:
	addi	%a1, %zero, 1
fbgt_cont.37285:
	beqi	%a1, 0, bnei_else.37286
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37287
bnei_else.37286:
	addi	%a1, %zero, 0
bnei_cont.37287:
bnei_cont.37265:
	j	bnei_cont.37263
bnei_else.37262:
	lw	%a2, 0(%sp)
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37288
	addi	%a3, %zero, 1
	j	fbeq_cont.37289
fbeq_else.37288:
	addi	%a3, %zero, 0
fbeq_cont.37289:
	beqi	%a3, 0, bnei_else.37290
	addi	%a3, %zero, 0
	j	bnei_cont.37291
bnei_else.37290:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f3, %f4, fbgt_else.37292
	addi	%t1, %zero, 0
	j	fbgt_cont.37293
fbgt_else.37292:
	addi	%t1, %zero, 1
fbgt_cont.37293:
	beqi	%t0, 0, bnei_else.37294
	beqi	%t1, 0, bnei_else.37296
	addi	%t0, %zero, 0
	j	bnei_cont.37295
bnei_else.37296:
	addi	%t0, %zero, 1
bnei_cont.37297:
	j	bnei_cont.37295
bnei_else.37294:
	add	%t0, %zero, %t1
bnei_cont.37295:
	flw	%f5, 0(%a3)
	beqi	%t0, 0, bnei_else.37298
	j	bnei_cont.37299
bnei_else.37298:
	fneg	%f5, %f5
bnei_cont.37299:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%a3)
	fblt	%f6, %f7, fbgt_else.37300
	addi	%t0, %zero, 0
	j	fbgt_cont.37301
fbgt_else.37300:
	addi	%t0, %zero, 1
fbgt_cont.37301:
	beqi	%t0, 0, bnei_else.37302
	flw	%f6, 2(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%a3)
	fblt	%f6, %f7, fbgt_else.37304
	addi	%a3, %zero, 0
	j	fbgt_cont.37305
fbgt_else.37304:
	addi	%a3, %zero, 1
fbgt_cont.37305:
	beqi	%a3, 0, bnei_else.37306
	fsw	%f5, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37303
bnei_else.37306:
	addi	%a3, %zero, 0
bnei_cont.37307:
	j	bnei_cont.37303
bnei_else.37302:
	addi	%a3, %zero, 0
bnei_cont.37303:
bnei_cont.37291:
	beqi	%a3, 0, bnei_else.37308
	addi	%a1, %zero, 1
	j	bnei_cont.37309
bnei_else.37308:
	flw	%f5, 1(%a2)
	fbne	%f5, %f4, fbeq_else.37310
	addi	%a3, %zero, 1
	j	fbeq_cont.37311
fbeq_else.37310:
	addi	%a3, %zero, 0
fbeq_cont.37311:
	beqi	%a3, 0, bnei_else.37312
	addi	%a3, %zero, 0
	j	bnei_cont.37313
bnei_else.37312:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f5, %f4, fbgt_else.37314
	addi	%t1, %zero, 0
	j	fbgt_cont.37315
fbgt_else.37314:
	addi	%t1, %zero, 1
fbgt_cont.37315:
	beqi	%t0, 0, bnei_else.37316
	beqi	%t1, 0, bnei_else.37318
	addi	%t0, %zero, 0
	j	bnei_cont.37317
bnei_else.37318:
	addi	%t0, %zero, 1
bnei_cont.37319:
	j	bnei_cont.37317
bnei_else.37316:
	add	%t0, %zero, %t1
bnei_cont.37317:
	flw	%f6, 1(%a3)
	beqi	%t0, 0, bnei_else.37320
	j	bnei_cont.37321
bnei_else.37320:
	fneg	%f6, %f6
bnei_cont.37321:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a2)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%a3)
	fblt	%f7, %f8, fbgt_else.37322
	addi	%t0, %zero, 0
	j	fbgt_cont.37323
fbgt_else.37322:
	addi	%t0, %zero, 1
fbgt_cont.37323:
	beqi	%t0, 0, bnei_else.37324
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%a3)
	fblt	%f7, %f8, fbgt_else.37326
	addi	%a3, %zero, 0
	j	fbgt_cont.37327
fbgt_else.37326:
	addi	%a3, %zero, 1
fbgt_cont.37327:
	beqi	%a3, 0, bnei_else.37328
	fsw	%f6, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37325
bnei_else.37328:
	addi	%a3, %zero, 0
bnei_cont.37329:
	j	bnei_cont.37325
bnei_else.37324:
	addi	%a3, %zero, 0
bnei_cont.37325:
bnei_cont.37313:
	beqi	%a3, 0, bnei_else.37330
	addi	%a1, %zero, 2
	j	bnei_cont.37331
bnei_else.37330:
	flw	%f6, 2(%a2)
	fbne	%f6, %f4, fbeq_else.37332
	addi	%a3, %zero, 1
	j	fbeq_cont.37333
fbeq_else.37332:
	addi	%a3, %zero, 0
fbeq_cont.37333:
	beqi	%a3, 0, bnei_else.37334
	addi	%a1, %zero, 0
	j	bnei_cont.37335
bnei_else.37334:
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f6, %f4, fbgt_else.37336
	addi	%t0, %zero, 0
	j	fbgt_cont.37337
fbgt_else.37336:
	addi	%t0, %zero, 1
fbgt_cont.37337:
	beqi	%a1, 0, bnei_else.37338
	beqi	%t0, 0, bnei_else.37340
	addi	%a1, %zero, 0
	j	bnei_cont.37339
bnei_else.37340:
	addi	%a1, %zero, 1
bnei_cont.37341:
	j	bnei_cont.37339
bnei_else.37338:
	add	%a1, %zero, %t0
bnei_cont.37339:
	flw	%f4, 2(%a3)
	beqi	%a1, 0, bnei_else.37342
	j	bnei_cont.37343
bnei_else.37342:
	fneg	%f4, %f4
bnei_cont.37343:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%a3)
	fblt	%f0, %f3, fbgt_else.37344
	addi	%a1, %zero, 0
	j	fbgt_cont.37345
fbgt_else.37344:
	addi	%a1, %zero, 1
fbgt_cont.37345:
	beqi	%a1, 0, bnei_else.37346
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.37348
	addi	%a1, %zero, 0
	j	fbgt_cont.37349
fbgt_else.37348:
	addi	%a1, %zero, 1
fbgt_cont.37349:
	beqi	%a1, 0, bnei_else.37350
	fsw	%f2, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37347
bnei_else.37350:
	addi	%a1, %zero, 0
bnei_cont.37351:
	j	bnei_cont.37347
bnei_else.37346:
	addi	%a1, %zero, 0
bnei_cont.37347:
bnei_cont.37335:
	beqi	%a1, 0, bnei_else.37352
	addi	%a1, %zero, 3
	j	bnei_cont.37353
bnei_else.37352:
	addi	%a1, %zero, 0
bnei_cont.37353:
bnei_cont.37331:
bnei_cont.37309:
bnei_cont.37263:
	beqi	%a1, 0, bnei_else.37354
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.37356
	addi	%a1, %zero, 0
	j	fbgt_cont.37357
fbgt_else.37356:
	addi	%a1, %zero, 1
fbgt_cont.37357:
	beqi	%a1, 0, bnei_else.37358
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.37360
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
	beqi	%v1, -1, bnei_else.37362
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
	beqi	%v1, -1, bnei_else.37364
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
	beqi	%v1, -1, bnei_else.37366
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
	beqi	%v1, -1, bnei_else.37368
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
	beqi	%v1, -1, bnei_else.37370
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
	j	bnei_cont.37261
bnei_else.37370:
bnei_cont.37371:
	j	bnei_cont.37261
bnei_else.37368:
bnei_cont.37369:
	j	bnei_cont.37261
bnei_else.37366:
bnei_cont.37367:
	j	bnei_cont.37261
bnei_else.37364:
bnei_cont.37365:
	j	bnei_cont.37261
bnei_else.37362:
bnei_cont.37363:
	j	bnei_cont.37261
bnei_else.37360:
bnei_cont.37361:
	j	bnei_cont.37261
bnei_else.37358:
bnei_cont.37359:
	j	bnei_cont.37261
bnei_else.37354:
bnei_cont.37355:
	j	bnei_cont.37261
bnei_else.37260:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.37372
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
	beqi	%v1, -1, bnei_else.37374
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
	beqi	%v1, -1, bnei_else.37376
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
	beqi	%v1, -1, bnei_else.37378
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
	beqi	%v1, -1, bnei_else.37380
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
	beqi	%v1, -1, bnei_else.37382
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
	j	bnei_cont.37373
bnei_else.37382:
bnei_cont.37383:
	j	bnei_cont.37373
bnei_else.37380:
bnei_cont.37381:
	j	bnei_cont.37373
bnei_else.37378:
bnei_cont.37379:
	j	bnei_cont.37373
bnei_else.37376:
bnei_cont.37377:
	j	bnei_cont.37373
bnei_else.37374:
bnei_cont.37375:
	j	bnei_cont.37373
bnei_else.37372:
bnei_cont.37373:
bnei_cont.37261:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2930
bnei_else.37259:
	jr	%ra
bnei_else.37130:
	jr	%ra
solve_each_element_fast.2936:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.37420
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
	beqi	%t3, 1, bnei_else.37421
	beqi	%t3, 2, bnei_else.37423
	flw	%f3, 0(%t2)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37425
	addi	%t3, %zero, 1
	j	fbeq_cont.37426
fbeq_else.37425:
	addi	%t3, %zero, 0
fbeq_cont.37426:
	beqi	%t3, 0, bnei_else.37427
	addi	%t0, %zero, 0
	j	bnei_cont.37422
bnei_else.37427:
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
	fblt	%f4, %f1, fbgt_else.37429
	addi	%t0, %zero, 0
	j	fbgt_cont.37430
fbgt_else.37429:
	addi	%t0, %zero, 1
fbgt_cont.37430:
	beqi	%t0, 0, bnei_else.37431
	lw	%t0, 6(%a3)
	beqi	%t0, 0, bnei_else.37433
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.37434
bnei_else.37433:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.37434:
	addi	%t0, %zero, 1
	j	bnei_cont.37432
bnei_else.37431:
	addi	%t0, %zero, 0
bnei_cont.37432:
bnei_cont.37428:
	j	bnei_cont.37422
bnei_else.37423:
	flw	%f0, 0(%t2)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.37435
	addi	%t2, %zero, 0
	j	fbgt_cont.37436
fbgt_else.37435:
	addi	%t2, %zero, 1
fbgt_cont.37436:
	beqi	%t2, 0, bnei_else.37437
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.37438
bnei_else.37437:
	addi	%t0, %zero, 0
bnei_cont.37438:
bnei_cont.37424:
	j	bnei_cont.37422
bnei_else.37421:
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
	fblt	%f6, %f7, fbgt_else.37439
	addi	%t3, %zero, 0
	j	fbgt_cont.37440
fbgt_else.37439:
	addi	%t3, %zero, 1
fbgt_cont.37440:
	beqi	%t3, 0, bnei_else.37441
	flw	%f6, 2(%t0)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t3, 4(%a3)
	flw	%f7, 2(%t3)
	fblt	%f6, %f7, fbgt_else.37443
	addi	%t3, %zero, 0
	j	fbgt_cont.37444
fbgt_else.37443:
	addi	%t3, %zero, 1
fbgt_cont.37444:
	beqi	%t3, 0, bnei_else.37445
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.37447
	addi	%t3, %zero, 1
	j	fbeq_cont.37448
fbeq_else.37447:
	addi	%t3, %zero, 0
fbeq_cont.37448:
	beqi	%t3, 0, bnei_else.37449
	addi	%t3, %zero, 0
	j	bnei_cont.37442
bnei_else.37449:
	addi	%t3, %zero, 1
bnei_cont.37450:
	j	bnei_cont.37442
bnei_else.37445:
	addi	%t3, %zero, 0
bnei_cont.37446:
	j	bnei_cont.37442
bnei_else.37441:
	addi	%t3, %zero, 0
bnei_cont.37442:
	beqi	%t3, 0, bnei_else.37451
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.37452
bnei_else.37451:
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
	fblt	%f7, %f8, fbgt_else.37453
	addi	%t3, %zero, 0
	j	fbgt_cont.37454
fbgt_else.37453:
	addi	%t3, %zero, 1
fbgt_cont.37454:
	beqi	%t3, 0, bnei_else.37455
	flw	%f7, 2(%t0)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.37457
	addi	%t0, %zero, 0
	j	fbgt_cont.37458
fbgt_else.37457:
	addi	%t0, %zero, 1
fbgt_cont.37458:
	beqi	%t0, 0, bnei_else.37459
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.37461
	addi	%t0, %zero, 1
	j	fbeq_cont.37462
fbeq_else.37461:
	addi	%t0, %zero, 0
fbeq_cont.37462:
	beqi	%t0, 0, bnei_else.37463
	addi	%t0, %zero, 0
	j	bnei_cont.37456
bnei_else.37463:
	addi	%t0, %zero, 1
bnei_cont.37464:
	j	bnei_cont.37456
bnei_else.37459:
	addi	%t0, %zero, 0
bnei_cont.37460:
	j	bnei_cont.37456
bnei_else.37455:
	addi	%t0, %zero, 0
bnei_cont.37456:
	beqi	%t0, 0, bnei_else.37465
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 2
	j	bnei_cont.37466
bnei_else.37465:
	flw	%f3, 4(%t2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%t2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f4, 0(%t0)
	fblt	%f0, %f4, fbgt_else.37467
	addi	%t0, %zero, 0
	j	fbgt_cont.37468
fbgt_else.37467:
	addi	%t0, %zero, 1
fbgt_cont.37468:
	beqi	%t0, 0, bnei_else.37469
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.37471
	addi	%t0, %zero, 0
	j	fbgt_cont.37472
fbgt_else.37471:
	addi	%t0, %zero, 1
fbgt_cont.37472:
	beqi	%t0, 0, bnei_else.37473
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.37475
	addi	%t0, %zero, 1
	j	fbeq_cont.37476
fbeq_else.37475:
	addi	%t0, %zero, 0
fbeq_cont.37476:
	beqi	%t0, 0, bnei_else.37477
	addi	%t0, %zero, 0
	j	bnei_cont.37470
bnei_else.37477:
	addi	%t0, %zero, 1
bnei_cont.37478:
	j	bnei_cont.37470
bnei_else.37473:
	addi	%t0, %zero, 0
bnei_cont.37474:
	j	bnei_cont.37470
bnei_else.37469:
	addi	%t0, %zero, 0
bnei_cont.37470:
	beqi	%t0, 0, bnei_else.37479
	fsw	%f2, 135(%zero)
	addi	%t0, %zero, 3
	j	bnei_cont.37480
bnei_else.37479:
	addi	%t0, %zero, 0
bnei_cont.37480:
bnei_cont.37466:
bnei_cont.37452:
bnei_cont.37422:
	beqi	%t0, 0, bnei_else.37481
	flw	%f0, 135(%zero)
	flw	%f1, 470(%zero)
	fblt	%f1, %f0, fbgt_else.37482
	addi	%a3, %zero, 0
	j	fbgt_cont.37483
fbgt_else.37482:
	addi	%a3, %zero, 1
fbgt_cont.37483:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a3, 0, bnei_else.37484
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.37486
	addi	%a3, %zero, 0
	j	fbgt_cont.37487
fbgt_else.37486:
	addi	%a3, %zero, 1
fbgt_cont.37487:
	beqi	%a3, 0, bnei_else.37488
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
	beqi	%a1, -1, bnei_else.37490
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
	beqi	%a3, 1, bnei_else.37492
	beqi	%a3, 2, bnei_else.37494
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
	beqi	%a3, 0, bnei_else.37496
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
	j	bnei_cont.37497
bnei_else.37496:
	fmov	%f5, %f8
bnei_cont.37497:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.37498
	j	bnei_cont.37499
bnei_else.37498:
	flw	%f6, 474(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.37499:
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.37500
	addi	%a3, %zero, 0
	j	fbgt_cont.37501
fbgt_else.37500:
	addi	%a3, %zero, 1
fbgt_cont.37501:
	beqi	%a1, 0, bnei_else.37502
	beqi	%a3, 0, bnei_else.37504
	addi	%a1, %zero, 0
	j	bnei_cont.37503
bnei_else.37504:
	addi	%a1, %zero, 1
bnei_cont.37505:
	j	bnei_cont.37503
bnei_else.37502:
	add	%a1, %zero, %a3
bnei_cont.37503:
	beqi	%a1, 0, bnei_else.37506
	addi	%a1, %zero, 0
	j	bnei_cont.37493
bnei_else.37506:
	addi	%a1, %zero, 1
bnei_cont.37507:
	j	bnei_cont.37493
bnei_else.37494:
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
	fblt	%f5, %f1, fbgt_else.37508
	addi	%a3, %zero, 0
	j	fbgt_cont.37509
fbgt_else.37508:
	addi	%a3, %zero, 1
fbgt_cont.37509:
	beqi	%a1, 0, bnei_else.37510
	beqi	%a3, 0, bnei_else.37512
	addi	%a1, %zero, 0
	j	bnei_cont.37511
bnei_else.37512:
	addi	%a1, %zero, 1
bnei_cont.37513:
	j	bnei_cont.37511
bnei_else.37510:
	add	%a1, %zero, %a3
bnei_cont.37511:
	beqi	%a1, 0, bnei_else.37514
	addi	%a1, %zero, 0
	j	bnei_cont.37515
bnei_else.37514:
	addi	%a1, %zero, 1
bnei_cont.37515:
bnei_cont.37495:
	j	bnei_cont.37493
bnei_else.37492:
	fabs	%f1, %f5
	lw	%a3, 4(%a1)
	flw	%f5, 0(%a3)
	fblt	%f1, %f5, fbgt_else.37516
	addi	%a3, %zero, 0
	j	fbgt_cont.37517
fbgt_else.37516:
	addi	%a3, %zero, 1
fbgt_cont.37517:
	beqi	%a3, 0, bnei_else.37518
	fabs	%f1, %f6
	lw	%a3, 4(%a1)
	flw	%f5, 1(%a3)
	fblt	%f1, %f5, fbgt_else.37520
	addi	%a3, %zero, 0
	j	fbgt_cont.37521
fbgt_else.37520:
	addi	%a3, %zero, 1
fbgt_cont.37521:
	beqi	%a3, 0, bnei_else.37522
	fabs	%f1, %f7
	lw	%a3, 4(%a1)
	flw	%f5, 2(%a3)
	fblt	%f1, %f5, fbgt_else.37524
	addi	%a3, %zero, 0
	j	bnei_cont.37519
fbgt_else.37524:
	addi	%a3, %zero, 1
fbgt_cont.37525:
	j	bnei_cont.37519
bnei_else.37522:
	addi	%a3, %zero, 0
bnei_cont.37523:
	j	bnei_cont.37519
bnei_else.37518:
	addi	%a3, %zero, 0
bnei_cont.37519:
	beqi	%a3, 0, bnei_else.37526
	lw	%a1, 6(%a1)
	j	bnei_cont.37527
bnei_else.37526:
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.37528
	addi	%a1, %zero, 0
	j	bnei_cont.37529
bnei_else.37528:
	addi	%a1, %zero, 1
bnei_cont.37529:
bnei_cont.37527:
bnei_cont.37493:
	beqi	%a1, 0, bnei_else.37530
	addi	%v0, %zero, 0
	j	bnei_cont.37491
bnei_else.37530:
	addi	%v0, %t1, 0
	fmov	%f1, %f3
	fmov	%f0, %f2
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	check_all_inside.2907
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.37531:
	j	bnei_cont.37491
bnei_else.37490:
	addi	%v0, %zero, 1
bnei_cont.37491:
	beqi	%v0, 0, bnei_else.37532
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
	j	bnei_cont.37485
bnei_else.37532:
bnei_cont.37533:
	j	bnei_cont.37485
bnei_else.37488:
bnei_cont.37489:
	j	bnei_cont.37485
bnei_else.37484:
bnei_cont.37485:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.2936
bnei_else.37481:
	lw	%a1, 6(%a3)
	beqi	%a1, 0, bnei_else.37534
	addi	%v0, %v0, 1
	j	solve_each_element_fast.2936
bnei_else.37534:
	jr	%ra
bnei_else.37420:
	jr	%ra
solve_one_or_network_fast.2940:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.37569
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
	beqi	%a0, -1, bnei_else.37570
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
	beqi	%a0, -1, bnei_else.37571
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
	beqi	%a0, -1, bnei_else.37572
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
	beqi	%a0, -1, bnei_else.37573
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
	beqi	%a0, -1, bnei_else.37574
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
	beqi	%a0, -1, bnei_else.37575
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
	beqi	%a0, -1, bnei_else.37576
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
bnei_else.37576:
	jr	%ra
bnei_else.37575:
	jr	%ra
bnei_else.37574:
	jr	%ra
bnei_else.37573:
	jr	%ra
bnei_else.37572:
	jr	%ra
bnei_else.37571:
	jr	%ra
bnei_else.37570:
	jr	%ra
bnei_else.37569:
	jr	%ra
trace_or_matrix_fast.2944:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.37707
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.37708
	lw	%t0, 12(%a3)
	lw	%t1, 10(%t0)
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a3
	lw	%a3, 0(%at)
	lw	%t2, 1(%t0)
	beqi	%t2, 1, bnei_else.37710
	beqi	%t2, 2, bnei_else.37712
	flw	%f3, 0(%a3)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37714
	addi	%t2, %zero, 1
	j	fbeq_cont.37715
fbeq_else.37714:
	addi	%t2, %zero, 0
fbeq_cont.37715:
	beqi	%t2, 0, bnei_else.37716
	addi	%a3, %zero, 0
	j	bnei_cont.37711
bnei_else.37716:
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
	fblt	%f4, %f1, fbgt_else.37718
	addi	%t1, %zero, 0
	j	fbgt_cont.37719
fbgt_else.37718:
	addi	%t1, %zero, 1
fbgt_cont.37719:
	beqi	%t1, 0, bnei_else.37720
	lw	%t0, 6(%t0)
	beqi	%t0, 0, bnei_else.37722
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.37723
bnei_else.37722:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.37723:
	addi	%a3, %zero, 1
	j	bnei_cont.37721
bnei_else.37720:
	addi	%a3, %zero, 0
bnei_cont.37721:
bnei_cont.37717:
	j	bnei_cont.37711
bnei_else.37712:
	flw	%f0, 0(%a3)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.37724
	addi	%a3, %zero, 0
	j	fbgt_cont.37725
fbgt_else.37724:
	addi	%a3, %zero, 1
fbgt_cont.37725:
	beqi	%a3, 0, bnei_else.37726
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37727
bnei_else.37726:
	addi	%a3, %zero, 0
bnei_cont.37727:
bnei_cont.37713:
	j	bnei_cont.37711
bnei_else.37710:
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
	fblt	%f6, %f7, fbgt_else.37728
	addi	%t2, %zero, 0
	j	fbgt_cont.37729
fbgt_else.37728:
	addi	%t2, %zero, 1
fbgt_cont.37729:
	beqi	%t2, 0, bnei_else.37730
	flw	%f6, 2(%t1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t2, 4(%t0)
	flw	%f7, 2(%t2)
	fblt	%f6, %f7, fbgt_else.37732
	addi	%t2, %zero, 0
	j	fbgt_cont.37733
fbgt_else.37732:
	addi	%t2, %zero, 1
fbgt_cont.37733:
	beqi	%t2, 0, bnei_else.37734
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.37736
	addi	%t2, %zero, 1
	j	fbeq_cont.37737
fbeq_else.37736:
	addi	%t2, %zero, 0
fbeq_cont.37737:
	beqi	%t2, 0, bnei_else.37738
	addi	%t2, %zero, 0
	j	bnei_cont.37731
bnei_else.37738:
	addi	%t2, %zero, 1
bnei_cont.37739:
	j	bnei_cont.37731
bnei_else.37734:
	addi	%t2, %zero, 0
bnei_cont.37735:
	j	bnei_cont.37731
bnei_else.37730:
	addi	%t2, %zero, 0
bnei_cont.37731:
	beqi	%t2, 0, bnei_else.37740
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.37741
bnei_else.37740:
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
	fblt	%f7, %f8, fbgt_else.37742
	addi	%t2, %zero, 0
	j	fbgt_cont.37743
fbgt_else.37742:
	addi	%t2, %zero, 1
fbgt_cont.37743:
	beqi	%t2, 0, bnei_else.37744
	flw	%f7, 2(%t1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t1, 4(%t0)
	flw	%f8, 2(%t1)
	fblt	%f7, %f8, fbgt_else.37746
	addi	%t1, %zero, 0
	j	fbgt_cont.37747
fbgt_else.37746:
	addi	%t1, %zero, 1
fbgt_cont.37747:
	beqi	%t1, 0, bnei_else.37748
	flw	%f7, 470(%zero)
	fbne	%f4, %f7, fbeq_else.37750
	addi	%t1, %zero, 1
	j	fbeq_cont.37751
fbeq_else.37750:
	addi	%t1, %zero, 0
fbeq_cont.37751:
	beqi	%t1, 0, bnei_else.37752
	addi	%t1, %zero, 0
	j	bnei_cont.37745
bnei_else.37752:
	addi	%t1, %zero, 1
bnei_cont.37753:
	j	bnei_cont.37745
bnei_else.37748:
	addi	%t1, %zero, 0
bnei_cont.37749:
	j	bnei_cont.37745
bnei_else.37744:
	addi	%t1, %zero, 0
bnei_cont.37745:
	beqi	%t1, 0, bnei_else.37754
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 2
	j	bnei_cont.37755
bnei_else.37754:
	flw	%f3, 4(%a3)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a3)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f4, 0(%a3)
	fblt	%f0, %f4, fbgt_else.37756
	addi	%a3, %zero, 0
	j	fbgt_cont.37757
fbgt_else.37756:
	addi	%a3, %zero, 1
fbgt_cont.37757:
	beqi	%a3, 0, bnei_else.37758
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.37760
	addi	%a3, %zero, 0
	j	fbgt_cont.37761
fbgt_else.37760:
	addi	%a3, %zero, 1
fbgt_cont.37761:
	beqi	%a3, 0, bnei_else.37762
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.37764
	addi	%a3, %zero, 1
	j	fbeq_cont.37765
fbeq_else.37764:
	addi	%a3, %zero, 0
fbeq_cont.37765:
	beqi	%a3, 0, bnei_else.37766
	addi	%a3, %zero, 0
	j	bnei_cont.37759
bnei_else.37766:
	addi	%a3, %zero, 1
bnei_cont.37767:
	j	bnei_cont.37759
bnei_else.37762:
	addi	%a3, %zero, 0
bnei_cont.37763:
	j	bnei_cont.37759
bnei_else.37758:
	addi	%a3, %zero, 0
bnei_cont.37759:
	beqi	%a3, 0, bnei_else.37768
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 3
	j	bnei_cont.37769
bnei_else.37768:
	addi	%a3, %zero, 0
bnei_cont.37769:
bnei_cont.37755:
bnei_cont.37741:
bnei_cont.37711:
	beqi	%a3, 0, bnei_else.37770
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.37772
	addi	%a3, %zero, 0
	j	fbgt_cont.37773
fbgt_else.37772:
	addi	%a3, %zero, 1
fbgt_cont.37773:
	beqi	%a3, 0, bnei_else.37774
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.37776
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
	beqi	%v1, -1, bnei_else.37778
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
	beqi	%v1, -1, bnei_else.37780
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
	beqi	%v1, -1, bnei_else.37782
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
	beqi	%v1, -1, bnei_else.37784
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
	beqi	%v1, -1, bnei_else.37786
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
	beqi	%v1, -1, bnei_else.37788
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
	j	bnei_cont.37709
bnei_else.37788:
bnei_cont.37789:
	j	bnei_cont.37709
bnei_else.37786:
bnei_cont.37787:
	j	bnei_cont.37709
bnei_else.37784:
bnei_cont.37785:
	j	bnei_cont.37709
bnei_else.37782:
bnei_cont.37783:
	j	bnei_cont.37709
bnei_else.37780:
bnei_cont.37781:
	j	bnei_cont.37709
bnei_else.37778:
bnei_cont.37779:
	j	bnei_cont.37709
bnei_else.37776:
bnei_cont.37777:
	j	bnei_cont.37709
bnei_else.37774:
bnei_cont.37775:
	j	bnei_cont.37709
bnei_else.37770:
bnei_cont.37771:
	j	bnei_cont.37709
bnei_else.37708:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.37790
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
	beqi	%v1, -1, bnei_else.37792
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
	beqi	%v1, -1, bnei_else.37794
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
	beqi	%v1, -1, bnei_else.37796
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
	beqi	%v1, -1, bnei_else.37798
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
	beqi	%v1, -1, bnei_else.37800
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
	beqi	%v1, -1, bnei_else.37802
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
	j	bnei_cont.37791
bnei_else.37802:
bnei_cont.37803:
	j	bnei_cont.37791
bnei_else.37800:
bnei_cont.37801:
	j	bnei_cont.37791
bnei_else.37798:
bnei_cont.37799:
	j	bnei_cont.37791
bnei_else.37796:
bnei_cont.37797:
	j	bnei_cont.37791
bnei_else.37794:
bnei_cont.37795:
	j	bnei_cont.37791
bnei_else.37792:
bnei_cont.37793:
	j	bnei_cont.37791
bnei_else.37790:
bnei_cont.37791:
bnei_cont.37709:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.37804
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.37805
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
	beqi	%t1, 1, bnei_else.37807
	beqi	%t1, 2, bnei_else.37809
	flw	%f3, 0(%a1)
	flw	%f4, 470(%zero)
	fbne	%f3, %f4, fbeq_else.37811
	addi	%t1, %zero, 1
	j	fbeq_cont.37812
fbeq_else.37811:
	addi	%t1, %zero, 0
fbeq_cont.37812:
	beqi	%t1, 0, bnei_else.37813
	addi	%a1, %zero, 0
	j	bnei_cont.37808
bnei_else.37813:
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
	fblt	%f4, %f1, fbgt_else.37815
	addi	%a3, %zero, 0
	j	fbgt_cont.37816
fbgt_else.37815:
	addi	%a3, %zero, 1
fbgt_cont.37816:
	beqi	%a3, 0, bnei_else.37817
	lw	%a2, 6(%a2)
	beqi	%a2, 0, bnei_else.37819
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.37820
bnei_else.37819:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.37820:
	addi	%a1, %zero, 1
	j	bnei_cont.37818
bnei_else.37817:
	addi	%a1, %zero, 0
bnei_cont.37818:
bnei_cont.37814:
	j	bnei_cont.37808
bnei_else.37809:
	flw	%f0, 0(%a1)
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.37821
	addi	%a1, %zero, 0
	j	fbgt_cont.37822
fbgt_else.37821:
	addi	%a1, %zero, 1
fbgt_cont.37822:
	beqi	%a1, 0, bnei_else.37823
	flw	%f1, 3(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37824
bnei_else.37823:
	addi	%a1, %zero, 0
bnei_cont.37824:
bnei_cont.37810:
	j	bnei_cont.37808
bnei_else.37807:
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
	fblt	%f6, %f7, fbgt_else.37825
	addi	%t1, %zero, 0
	j	fbgt_cont.37826
fbgt_else.37825:
	addi	%t1, %zero, 1
fbgt_cont.37826:
	beqi	%t1, 0, bnei_else.37827
	flw	%f6, 2(%a3)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t1, 4(%a2)
	flw	%f8, 2(%t1)
	fblt	%f6, %f8, fbgt_else.37829
	addi	%t1, %zero, 0
	j	fbgt_cont.37830
fbgt_else.37829:
	addi	%t1, %zero, 1
fbgt_cont.37830:
	beqi	%t1, 0, bnei_else.37831
	flw	%f6, 470(%zero)
	fbne	%f4, %f6, fbeq_else.37833
	addi	%t1, %zero, 1
	j	fbeq_cont.37834
fbeq_else.37833:
	addi	%t1, %zero, 0
fbeq_cont.37834:
	beqi	%t1, 0, bnei_else.37835
	addi	%t1, %zero, 0
	j	bnei_cont.37828
bnei_else.37835:
	addi	%t1, %zero, 1
bnei_cont.37836:
	j	bnei_cont.37828
bnei_else.37831:
	addi	%t1, %zero, 0
bnei_cont.37832:
	j	bnei_cont.37828
bnei_else.37827:
	addi	%t1, %zero, 0
bnei_cont.37828:
	beqi	%t1, 0, bnei_else.37837
	fsw	%f3, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.37838
bnei_else.37837:
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
	fblt	%f8, %f9, fbgt_else.37839
	addi	%t1, %zero, 0
	j	fbgt_cont.37840
fbgt_else.37839:
	addi	%t1, %zero, 1
fbgt_cont.37840:
	beqi	%t1, 0, bnei_else.37841
	flw	%f8, 2(%a3)
	fmul	%f8, %f3, %f8
	fadd	%f8, %f8, %f2
	fabs	%f8, %f8
	lw	%a2, 4(%a2)
	flw	%f10, 2(%a2)
	fblt	%f8, %f10, fbgt_else.37843
	addi	%a2, %zero, 0
	j	fbgt_cont.37844
fbgt_else.37843:
	addi	%a2, %zero, 1
fbgt_cont.37844:
	beqi	%a2, 0, bnei_else.37845
	flw	%f8, 470(%zero)
	fbne	%f4, %f8, fbeq_else.37847
	addi	%a2, %zero, 1
	j	fbeq_cont.37848
fbeq_else.37847:
	addi	%a2, %zero, 0
fbeq_cont.37848:
	beqi	%a2, 0, bnei_else.37849
	addi	%a2, %zero, 0
	j	bnei_cont.37842
bnei_else.37849:
	addi	%a2, %zero, 1
bnei_cont.37850:
	j	bnei_cont.37842
bnei_else.37845:
	addi	%a2, %zero, 0
bnei_cont.37846:
	j	bnei_cont.37842
bnei_else.37841:
	addi	%a2, %zero, 0
bnei_cont.37842:
	beqi	%a2, 0, bnei_else.37851
	fsw	%f3, 135(%zero)
	addi	%a1, %zero, 2
	j	bnei_cont.37852
bnei_else.37851:
	flw	%f3, 4(%a1)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a1)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	fblt	%f0, %f9, fbgt_else.37853
	addi	%a1, %zero, 0
	j	fbgt_cont.37854
fbgt_else.37853:
	addi	%a1, %zero, 1
fbgt_cont.37854:
	beqi	%a1, 0, bnei_else.37855
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fblt	%f0, %f7, fbgt_else.37857
	addi	%a1, %zero, 0
	j	fbgt_cont.37858
fbgt_else.37857:
	addi	%a1, %zero, 1
fbgt_cont.37858:
	beqi	%a1, 0, bnei_else.37859
	flw	%f0, 470(%zero)
	fbne	%f3, %f0, fbeq_else.37861
	addi	%a1, %zero, 1
	j	fbeq_cont.37862
fbeq_else.37861:
	addi	%a1, %zero, 0
fbeq_cont.37862:
	beqi	%a1, 0, bnei_else.37863
	addi	%a1, %zero, 0
	j	bnei_cont.37856
bnei_else.37863:
	addi	%a1, %zero, 1
bnei_cont.37864:
	j	bnei_cont.37856
bnei_else.37859:
	addi	%a1, %zero, 0
bnei_cont.37860:
	j	bnei_cont.37856
bnei_else.37855:
	addi	%a1, %zero, 0
bnei_cont.37856:
	beqi	%a1, 0, bnei_else.37865
	fsw	%f2, 135(%zero)
	addi	%a1, %zero, 3
	j	bnei_cont.37866
bnei_else.37865:
	addi	%a1, %zero, 0
bnei_cont.37866:
bnei_cont.37852:
bnei_cont.37838:
bnei_cont.37808:
	beqi	%a1, 0, bnei_else.37867
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.37869
	addi	%a1, %zero, 0
	j	fbgt_cont.37870
fbgt_else.37869:
	addi	%a1, %zero, 1
fbgt_cont.37870:
	beqi	%a1, 0, bnei_else.37871
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.37873
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	sw	%a0, 6(%sp)
	addi	%a0, %t0, 0
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.37875
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
	beqi	%v1, -1, bnei_else.37877
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
	beqi	%v1, -1, bnei_else.37879
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
	beqi	%v1, -1, bnei_else.37881
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
	beqi	%v1, -1, bnei_else.37883
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
	j	bnei_cont.37806
bnei_else.37883:
bnei_cont.37884:
	j	bnei_cont.37806
bnei_else.37881:
bnei_cont.37882:
	j	bnei_cont.37806
bnei_else.37879:
bnei_cont.37880:
	j	bnei_cont.37806
bnei_else.37877:
bnei_cont.37878:
	j	bnei_cont.37806
bnei_else.37875:
bnei_cont.37876:
	j	bnei_cont.37806
bnei_else.37873:
bnei_cont.37874:
	j	bnei_cont.37806
bnei_else.37871:
bnei_cont.37872:
	j	bnei_cont.37806
bnei_else.37867:
bnei_cont.37868:
	j	bnei_cont.37806
bnei_else.37805:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.37885
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
	beqi	%v1, -1, bnei_else.37887
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
	beqi	%v1, -1, bnei_else.37889
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
	beqi	%v1, -1, bnei_else.37891
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
	beqi	%v1, -1, bnei_else.37893
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
	beqi	%v1, -1, bnei_else.37895
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
	j	bnei_cont.37886
bnei_else.37895:
bnei_cont.37896:
	j	bnei_cont.37886
bnei_else.37893:
bnei_cont.37894:
	j	bnei_cont.37886
bnei_else.37891:
bnei_cont.37892:
	j	bnei_cont.37886
bnei_else.37889:
bnei_cont.37890:
	j	bnei_cont.37886
bnei_else.37887:
bnei_cont.37888:
	j	bnei_cont.37886
bnei_else.37885:
bnei_cont.37886:
bnei_cont.37806:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2944
bnei_else.37804:
	jr	%ra
bnei_else.37707:
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
	beqi	%a0, 1, bnei_else.37998
	beqi	%a0, 2, bnei_else.37999
	beqi	%a0, 3, bnei_else.38000
	beqi	%a0, 4, bnei_else.38001
	jr	%ra
bnei_else.38001:
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
	fblt	%f3, %f4, fbgt_else.38003
	addi	%a0, %zero, 0
	j	fbgt_cont.38004
fbgt_else.38003:
	addi	%a0, %zero, 1
fbgt_cont.38004:
	beqi	%a0, 0, bnei_else.38005
	flw	%f0, 463(%zero)
	j	bnei_cont.38006
bnei_else.38005:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.38007
	addi	%a0, %zero, 1
	j	fbgt_cont.38008
fbgt_else.38007:
	addi	%a0, %zero, 0
fbgt_cont.38008:
	fabs	%f1, %f0
	flw	%f3, 462(%zero)
	fblt	%f1, %f3, fbgt_else.38009
	flw	%f0, 455(%zero)
	fblt	%f1, %f0, fbgt_else.38011
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
	j	fbgt_cont.38012
fbgt_else.38011:
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
fbgt_cont.38012:
	beqi	%a0, 0, bnei_else.38013
	j	fbgt_cont.38010
bnei_else.38013:
	fneg	%f0, %f0
bnei_cont.38014:
	j	fbgt_cont.38010
fbgt_else.38009:
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
fbgt_cont.38010:
	flw	%f1, 454(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 453(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.38006:
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
	fblt	%f3, %f4, fbgt_else.38015
	addi	%v0, %zero, 0
	j	fbgt_cont.38016
fbgt_else.38015:
	addi	%v0, %zero, 1
fbgt_cont.38016:
	beqi	%v0, 0, bnei_else.38017
	flw	%f1, 463(%zero)
	j	bnei_cont.38018
bnei_else.38017:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 470(%zero)
	fblt	%f1, %f2, fbgt_else.38019
	addi	%v0, %zero, 1
	j	fbgt_cont.38020
fbgt_else.38019:
	addi	%v0, %zero, 0
fbgt_cont.38020:
	fabs	%f2, %f1
	flw	%f3, 462(%zero)
	fblt	%f2, %f3, fbgt_else.38021
	flw	%f1, 455(%zero)
	fblt	%f2, %f1, fbgt_else.38023
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
	j	fbgt_cont.38024
fbgt_else.38023:
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
fbgt_cont.38024:
	beqi	%v0, 0, bnei_else.38025
	j	fbgt_cont.38022
bnei_else.38025:
	fneg	%f1, %f1
bnei_cont.38026:
	j	fbgt_cont.38022
fbgt_else.38021:
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
fbgt_cont.38022:
	flw	%f2, 454(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 453(%zero)
	fdiv	%f1, %f1, %f2
bnei_cont.38018:
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
	fblt	%f0, %f1, fbgt_else.38027
	addi	%v0, %zero, 0
	j	fbgt_cont.38028
fbgt_else.38027:
	addi	%v0, %zero, 1
fbgt_cont.38028:
	beqi	%v0, 0, bnei_else.38029
	fmov	%f0, %f1
	j	bnei_cont.38030
bnei_else.38029:
bnei_cont.38030:
	flw	%f1, 451(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 450(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.38000:
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
	fblt	%f0, %f2, fbgt_else.38032
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.38034
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.38036
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.38038
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.38040
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.38042
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.38044
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.38046
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.38048
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.38050
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.38052
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.38054
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.38056
	flw	%f3, 480(%zero)
	fmov	%f1, %f3
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	j	fbgt_cont.38033
fbgt_else.38056:
	fmov	%f0, %f3
fbgt_cont.38057:
	j	fbgt_cont.38033
fbgt_else.38054:
	fmov	%f0, %f3
fbgt_cont.38055:
	j	fbgt_cont.38033
fbgt_else.38052:
	fmov	%f0, %f3
fbgt_cont.38053:
	j	fbgt_cont.38033
fbgt_else.38050:
	fmov	%f0, %f3
fbgt_cont.38051:
	j	fbgt_cont.38033
fbgt_else.38048:
	fmov	%f0, %f3
fbgt_cont.38049:
	j	fbgt_cont.38033
fbgt_else.38046:
	fmov	%f0, %f3
fbgt_cont.38047:
	j	fbgt_cont.38033
fbgt_else.38044:
	fmov	%f0, %f3
fbgt_cont.38045:
	j	fbgt_cont.38033
fbgt_else.38042:
	fmov	%f0, %f3
fbgt_cont.38043:
	j	fbgt_cont.38033
fbgt_else.38040:
	fmov	%f0, %f3
fbgt_cont.38041:
	j	fbgt_cont.38033
fbgt_else.38038:
	fmov	%f0, %f3
fbgt_cont.38039:
	j	fbgt_cont.38033
fbgt_else.38036:
	fmov	%f0, %f3
fbgt_cont.38037:
	j	fbgt_cont.38033
fbgt_else.38034:
	fmov	%f0, %f3
fbgt_cont.38035:
	j	fbgt_cont.38033
fbgt_else.38032:
	fmov	%f0, %f2
fbgt_cont.38033:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	fblt	%f1, %f2, fbgt_else.38058
	fblt	%f1, %f0, fbgt_else.38060
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
	j	fbgt_cont.38059
fbgt_else.38060:
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
fbgt_cont.38061:
	j	fbgt_cont.38059
fbgt_else.38058:
	fmov	%f0, %f1
fbgt_cont.38059:
	flw	%f1, 0(%sp)
	fblt	%f0, %f1, fbgt_else.38062
	addi	%v0, %zero, 0
	j	fbgt_cont.38063
fbgt_else.38062:
	addi	%v0, %zero, 1
fbgt_cont.38063:
	fblt	%f0, %f1, fbgt_else.38064
	fsub	%f0, %f0, %f1
	j	fbgt_cont.38065
fbgt_else.38064:
fbgt_cont.38065:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.38066
	beqi	%v0, 0, bnei_else.38068
	addi	%v0, %zero, 0
	j	fbgt_cont.38067
bnei_else.38068:
	addi	%v0, %zero, 1
bnei_cont.38069:
	j	fbgt_cont.38067
fbgt_else.38066:
fbgt_cont.38067:
	fblt	%f0, %f2, fbgt_else.38070
	fsub	%f0, %f1, %f0
	j	fbgt_cont.38071
fbgt_else.38070:
fbgt_cont.38071:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.38072
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
	j	fbgt_cont.38073
fbgt_else.38072:
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
fbgt_cont.38073:
	beqi	%v0, 0, bnei_else.38074
	j	bnei_cont.38075
bnei_else.38074:
	fneg	%f0, %f0
bnei_cont.38075:
	fmul	%f0, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 474(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
	jr	%ra
bnei_else.37999:
	flw	%f0, 1(%v1)
	flw	%f1, 448(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 494(%zero)
	flw	%f2, 470(%zero)
	fblt	%f0, %f2, fbgt_else.38077
	addi	%v0, %zero, 1
	j	fbgt_cont.38078
fbgt_else.38077:
	addi	%v0, %zero, 0
fbgt_cont.38078:
	fabs	%f0, %f0
	flw	%f2, 493(%zero)
	sw	%v0, 3(%sp)
	fsw	%f1, 4(%sp)
	fsw	%f0, 5(%sp)
	fsw	%f2, 6(%sp)
	fblt	%f0, %f2, fbgt_else.38079
	flw	%f3, 492(%zero)
	fblt	%f0, %f3, fbgt_else.38081
	flw	%f3, 491(%zero)
	fblt	%f0, %f3, fbgt_else.38083
	flw	%f3, 490(%zero)
	fblt	%f0, %f3, fbgt_else.38085
	flw	%f3, 489(%zero)
	fblt	%f0, %f3, fbgt_else.38087
	flw	%f3, 488(%zero)
	fblt	%f0, %f3, fbgt_else.38089
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.38091
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.38093
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.38095
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.38097
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.38099
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.38101
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.38103
	flw	%f3, 480(%zero)
	fmov	%f1, %f3
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	j	fbgt_cont.38080
fbgt_else.38103:
	fmov	%f0, %f3
fbgt_cont.38104:
	j	fbgt_cont.38080
fbgt_else.38101:
	fmov	%f0, %f3
fbgt_cont.38102:
	j	fbgt_cont.38080
fbgt_else.38099:
	fmov	%f0, %f3
fbgt_cont.38100:
	j	fbgt_cont.38080
fbgt_else.38097:
	fmov	%f0, %f3
fbgt_cont.38098:
	j	fbgt_cont.38080
fbgt_else.38095:
	fmov	%f0, %f3
fbgt_cont.38096:
	j	fbgt_cont.38080
fbgt_else.38093:
	fmov	%f0, %f3
fbgt_cont.38094:
	j	fbgt_cont.38080
fbgt_else.38091:
	fmov	%f0, %f3
fbgt_cont.38092:
	j	fbgt_cont.38080
fbgt_else.38089:
	fmov	%f0, %f3
fbgt_cont.38090:
	j	fbgt_cont.38080
fbgt_else.38087:
	fmov	%f0, %f3
fbgt_cont.38088:
	j	fbgt_cont.38080
fbgt_else.38085:
	fmov	%f0, %f3
fbgt_cont.38086:
	j	fbgt_cont.38080
fbgt_else.38083:
	fmov	%f0, %f3
fbgt_cont.38084:
	j	fbgt_cont.38080
fbgt_else.38081:
	fmov	%f0, %f3
fbgt_cont.38082:
	j	fbgt_cont.38080
fbgt_else.38079:
	fmov	%f0, %f2
fbgt_cont.38080:
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	fblt	%f1, %f2, fbgt_else.38105
	fblt	%f1, %f0, fbgt_else.38107
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
	j	fbgt_cont.38106
fbgt_else.38107:
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
fbgt_cont.38108:
	j	fbgt_cont.38106
fbgt_else.38105:
	fmov	%f0, %f1
fbgt_cont.38106:
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.38109
	lw	%v0, 3(%sp)
	beqi	%v0, 0, bnei_else.38111
	addi	%v0, %zero, 0
	j	fbgt_cont.38110
bnei_else.38111:
	addi	%v0, %zero, 1
bnei_cont.38112:
	j	fbgt_cont.38110
fbgt_else.38109:
	lw	%v0, 3(%sp)
fbgt_cont.38110:
	fblt	%f0, %f1, fbgt_else.38113
	fsub	%f0, %f0, %f1
	j	fbgt_cont.38114
fbgt_else.38113:
fbgt_cont.38114:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.38115
	fsub	%f0, %f1, %f0
	j	fbgt_cont.38116
fbgt_else.38115:
fbgt_cont.38116:
	flw	%f1, 478(%zero)
	fblt	%f1, %f0, fbgt_else.38117
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
	j	fbgt_cont.38118
fbgt_else.38117:
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
fbgt_cont.38118:
	beqi	%v0, 0, bnei_else.38119
	j	bnei_cont.38120
bnei_else.38119:
	fneg	%f0, %f0
bnei_cont.38120:
	fmul	%f0, %f0, %f0
	flw	%f1, 451(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 474(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
	jr	%ra
bnei_else.37998:
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
	fblt	%f0, %f2, fbgt_else.38122
	addi	%a0, %zero, 0
	j	fbgt_cont.38123
fbgt_else.38122:
	addi	%a0, %zero, 1
fbgt_cont.38123:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	flw	%f4, 2(%v0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.38124
	addi	%v0, %zero, 0
	j	fbgt_cont.38125
fbgt_else.38124:
	addi	%v0, %zero, 1
fbgt_cont.38125:
	beqi	%a0, 0, bnei_else.38126
	beqi	%v0, 0, bnei_else.38128
	flw	%f0, 451(%zero)
	j	bnei_cont.38127
bnei_else.38128:
	flw	%f0, 470(%zero)
bnei_cont.38129:
	j	bnei_cont.38127
bnei_else.38126:
	beqi	%v0, 0, bnei_else.38130
	flw	%f0, 470(%zero)
	j	bnei_cont.38131
bnei_else.38130:
	flw	%f0, 451(%zero)
bnei_cont.38131:
bnei_cont.38127:
	fsw	%f0, 146(%zero)
	jr	%ra
trace_reflections.2966:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.38143
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
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38144
	addi	%v0, %zero, 0
	j	fbgt_cont.38145
fbgt_else.38144:
	addi	%v0, %zero, 1
fbgt_cont.38145:
	beqi	%v0, 0, bnei_else.38146
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38148
	addi	%v0, %zero, 0
	j	bnei_cont.38147
fbgt_else.38148:
	addi	%v0, %zero, 1
fbgt_cont.38149:
	j	bnei_cont.38147
bnei_else.38146:
	addi	%v0, %zero, 0
bnei_cont.38147:
	beqi	%v0, 0, bnei_else.38150
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.38152
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.38154
	j	bnei_cont.38151
bnei_else.38154:
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
	fblt	%f3, %f0, fbgt_else.38156
	addi	%v0, %zero, 0
	j	fbgt_cont.38157
fbgt_else.38156:
	addi	%v0, %zero, 1
fbgt_cont.38157:
	beqi	%v0, 0, bnei_else.38158
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
	j	bnei_cont.38159
bnei_else.38158:
bnei_cont.38159:
	fblt	%f3, %f1, fbgt_else.38160
	addi	%v0, %zero, 0
	j	fbgt_cont.38161
fbgt_else.38160:
	addi	%v0, %zero, 1
fbgt_cont.38161:
	beqi	%v0, 0, bnei_else.38162
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
	j	bnei_cont.38163
bnei_else.38162:
bnei_cont.38163:
bnei_cont.38155:
	j	bnei_cont.38151
beq_else.38152:
beq_cont.38153:
	j	bnei_cont.38151
bnei_else.38150:
bnei_cont.38151:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2966
bgti_else.38143:
	jr	%ra
trace_ray.2971:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.38198
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
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38199
	addi	%v0, %zero, 0
	j	fbgt_cont.38200
fbgt_else.38199:
	addi	%v0, %zero, 1
fbgt_cont.38200:
	beqi	%v0, 0, bnei_else.38201
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38203
	addi	%v0, %zero, 0
	j	bnei_cont.38202
fbgt_else.38203:
	addi	%v0, %zero, 1
fbgt_cont.38204:
	j	bnei_cont.38202
bnei_else.38201:
	addi	%v0, %zero, 0
bnei_cont.38202:
	beqi	%v0, 0, bnei_else.38205
	lw	%v0, 141(%zero)
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	lw	%a1, 1(%v1)
	addi	%a2, %zero, 1
	beqi	%a1, 1, bnei_else.38206
	beqi	%a1, 2, bnei_else.38208
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
	beqi	%a1, 0, bnei_else.38210
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
	j	bnei_cont.38211
bnei_else.38210:
	fsw	%f6, 142(%zero)
	fsw	%f7, 143(%zero)
	fsw	%f8, 144(%zero)
bnei_cont.38211:
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
	fbne	%f4, %f7, fbeq_else.38212
	addi	%a3, %zero, 1
	j	fbeq_cont.38213
fbeq_else.38212:
	addi	%a3, %zero, 0
fbeq_cont.38213:
	beqi	%a3, 0, bnei_else.38214
	flw	%f4, 474(%zero)
	j	bnei_cont.38215
bnei_else.38214:
	beqi	%a1, 0, bnei_else.38216
	flw	%f7, 468(%zero)
	fdiv	%f4, %f7, %f4
	j	bnei_cont.38217
bnei_else.38216:
	flw	%f7, 474(%zero)
	fdiv	%f4, %f7, %f4
bnei_cont.38217:
bnei_cont.38215:
	fmul	%f3, %f3, %f4
	fsw	%f3, 142(%zero)
	fmul	%f3, %f5, %f4
	fsw	%f3, 143(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f3, 144(%zero)
	j	bnei_cont.38207
bnei_else.38208:
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
bnei_cont.38209:
	j	bnei_cont.38207
bnei_else.38206:
	lw	%a1, 136(%zero)
	flw	%f3, 470(%zero)
	fsw	%f3, 142(%zero)
	fsw	%f3, 143(%zero)
	fsw	%f3, 144(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.38218
	addi	%t0, %zero, 1
	j	fbeq_cont.38219
fbeq_else.38218:
	addi	%t0, %zero, 0
fbeq_cont.38219:
	beqi	%t0, 0, bnei_else.38220
	j	bnei_cont.38221
bnei_else.38220:
	fblt	%f3, %f4, fbgt_else.38222
	addi	%t0, %zero, 0
	j	fbgt_cont.38223
fbgt_else.38222:
	addi	%t0, %zero, 1
fbgt_cont.38223:
	beqi	%t0, 0, bnei_else.38224
	flw	%f3, 474(%zero)
	j	bnei_cont.38225
bnei_else.38224:
	flw	%f3, 468(%zero)
bnei_cont.38225:
bnei_cont.38221:
	fneg	%f3, %f3
	fsw	%f3, 142(%a1)
bnei_cont.38207:
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
	flw	%f4, 473(%zero)
	fblt	%f3, %f4, fbgt_else.38226
	addi	%a3, %zero, 0
	j	fbgt_cont.38227
fbgt_else.38226:
	addi	%a3, %zero, 1
fbgt_cont.38227:
	beqi	%a3, 0, bnei_else.38228
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.38229
bnei_else.38228:
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
bnei_cont.38229:
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
	beqi	%v0, 0, bnei_else.38230
	j	bnei_cont.38231
bnei_else.38230:
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
	fblt	%f2, %f1, fbgt_else.38232
	addi	%v1, %zero, 0
	j	fbgt_cont.38233
fbgt_else.38232:
	addi	%v1, %zero, 1
fbgt_cont.38233:
	beqi	%v1, 0, bnei_else.38234
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
	j	bnei_cont.38235
bnei_else.38234:
bnei_cont.38235:
	fblt	%f2, %f0, fbgt_else.38236
	addi	%v1, %zero, 0
	j	fbgt_cont.38237
fbgt_else.38236:
	addi	%v1, %zero, 1
fbgt_cont.38237:
	beqi	%v1, 0, bnei_else.38238
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
	j	bnei_cont.38239
bnei_else.38238:
bnei_cont.38239:
bnei_cont.38231:
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
	fblt	%f0, %f1, fbgt_else.38240
	addi	%v0, %zero, 0
	j	fbgt_cont.38241
fbgt_else.38240:
	addi	%v0, %zero, 1
fbgt_cont.38241:
	beqi	%v0, 0, bnei_else.38242
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.38243
	j	bgti_cont.38244
bgti_else.38243:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.38244:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.38245
	jr	%ra
bnei_else.38245:
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
	j	trace_ray.2971
bnei_else.38242:
	jr	%ra
bnei_else.38205:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.38248
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
	fblt	%f1, %f0, fbgt_else.38249
	addi	%v0, %zero, 0
	j	fbgt_cont.38250
fbgt_else.38249:
	addi	%v0, %zero, 1
fbgt_cont.38250:
	beqi	%v0, 0, bnei_else.38251
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
bnei_else.38251:
	jr	%ra
bnei_else.38248:
	jr	%ra
bgt_else.38198:
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
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38262
	addi	%v0, %zero, 0
	j	fbgt_cont.38263
fbgt_else.38262:
	addi	%v0, %zero, 1
fbgt_cont.38263:
	beqi	%v0, 0, bnei_else.38264
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38266
	addi	%v0, %zero, 0
	j	bnei_cont.38265
fbgt_else.38266:
	addi	%v0, %zero, 1
fbgt_cont.38267:
	j	bnei_cont.38265
bnei_else.38264:
	addi	%v0, %zero, 0
bnei_cont.38265:
	beqi	%v0, 0, bnei_else.38268
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38269
	beqi	%a0, 2, bnei_else.38271
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
	beqi	%v1, 0, bnei_else.38273
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
	j	bnei_cont.38274
bnei_else.38273:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38274:
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
	fbne	%f1, %f4, fbeq_else.38275
	addi	%a0, %zero, 1
	j	fbeq_cont.38276
fbeq_else.38275:
	addi	%a0, %zero, 0
fbeq_cont.38276:
	beqi	%a0, 0, bnei_else.38277
	flw	%f1, 474(%zero)
	j	bnei_cont.38278
bnei_else.38277:
	beqi	%v1, 0, bnei_else.38279
	flw	%f4, 468(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.38280
bnei_else.38279:
	flw	%f4, 474(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.38280:
bnei_cont.38278:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38270
bnei_else.38271:
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
bnei_cont.38272:
	j	bnei_cont.38270
bnei_else.38269:
	lw	%a0, 136(%zero)
	flw	%f0, 470(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38281
	addi	%v1, %zero, 1
	j	fbeq_cont.38282
fbeq_else.38281:
	addi	%v1, %zero, 0
fbeq_cont.38282:
	beqi	%v1, 0, bnei_else.38283
	j	bnei_cont.38284
bnei_else.38283:
	fblt	%f0, %f1, fbgt_else.38285
	addi	%v1, %zero, 0
	j	fbgt_cont.38286
fbgt_else.38285:
	addi	%v1, %zero, 1
fbgt_cont.38286:
	beqi	%v1, 0, bnei_else.38287
	flw	%f0, 474(%zero)
	j	bnei_cont.38288
bnei_else.38287:
	flw	%f0, 468(%zero)
bnei_cont.38288:
bnei_cont.38284:
	fneg	%f0, %f0
	fsw	%f0, 142(%a0)
bnei_cont.38270:
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
	beqi	%v0, 0, bnei_else.38289
	jr	%ra
bnei_else.38289:
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
	fblt	%f1, %f0, fbgt_else.38291
	addi	%v0, %zero, 0
	j	fbgt_cont.38292
fbgt_else.38291:
	addi	%v0, %zero, 1
fbgt_cont.38292:
	beqi	%v0, 0, bnei_else.38293
	j	bnei_cont.38294
bnei_else.38293:
	fmov	%f0, %f1
bnei_cont.38294:
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
bnei_else.38268:
	jr	%ra
iter_trace_diffuse_rays.2980:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.38583
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
	fblt	%f0, %f2, fbgt_else.38584
	addi	%t0, %zero, 0
	j	fbgt_cont.38585
fbgt_else.38584:
	addi	%t0, %zero, 1
fbgt_cont.38585:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a2, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f4, 4(%sp)
	fsw	%f3, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a1, 8(%sp)
	beqi	%t0, 0, bnei_else.38586
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
	beqi	%t3, -1, bnei_else.38588
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.38590
	lw	%t4, 12(%t3)
	lw	%t5, 10(%t4)
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)
	flw	%f7, 2(%t5)
	lw	%t6, 1(%a3)
	add	%at, %t6, %t3
	lw	%t3, 0(%at)
	lw	%t6, 1(%t4)
	beqi	%t6, 1, bnei_else.38592
	beqi	%t6, 2, bnei_else.38594
	flw	%f8, 0(%t3)
	fbne	%f8, %f2, fbeq_else.38596
	addi	%t6, %zero, 1
	j	fbeq_cont.38597
fbeq_else.38596:
	addi	%t6, %zero, 0
fbeq_cont.38597:
	beqi	%t6, 0, bnei_else.38598
	addi	%t3, %zero, 0
	j	bnei_cont.38593
bnei_else.38598:
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
	fblt	%f2, %f6, fbgt_else.38600
	addi	%t5, %zero, 0
	j	fbgt_cont.38601
fbgt_else.38600:
	addi	%t5, %zero, 1
fbgt_cont.38601:
	beqi	%t5, 0, bnei_else.38602
	lw	%t4, 6(%t4)
	beqi	%t4, 0, bnei_else.38604
	fsqrt	%f6, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	j	bnei_cont.38605
bnei_else.38604:
	fsqrt	%f6, %f6
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
bnei_cont.38605:
	addi	%t3, %zero, 1
	j	bnei_cont.38603
bnei_else.38602:
	addi	%t3, %zero, 0
bnei_cont.38603:
bnei_cont.38599:
	j	bnei_cont.38593
bnei_else.38594:
	flw	%f5, 0(%t3)
	fblt	%f5, %f2, fbgt_else.38606
	addi	%t3, %zero, 0
	j	fbgt_cont.38607
fbgt_else.38606:
	addi	%t3, %zero, 1
fbgt_cont.38607:
	beqi	%t3, 0, bnei_else.38608
	flw	%f6, 3(%t5)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.38609
bnei_else.38608:
	addi	%t3, %zero, 0
bnei_cont.38609:
bnei_cont.38595:
	j	bnei_cont.38593
bnei_else.38592:
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
	fblt	%f11, %f12, fbgt_else.38610
	addi	%t6, %zero, 0
	j	fbgt_cont.38611
fbgt_else.38610:
	addi	%t6, %zero, 1
fbgt_cont.38611:
	beqi	%t6, 0, bnei_else.38612
	flw	%f11, 2(%t5)
	fmul	%f11, %f8, %f11
	fadd	%f11, %f11, %f7
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f13, 2(%t6)
	fblt	%f11, %f13, fbgt_else.38614
	addi	%t6, %zero, 0
	j	fbgt_cont.38615
fbgt_else.38614:
	addi	%t6, %zero, 1
fbgt_cont.38615:
	beqi	%t6, 0, bnei_else.38616
	fbne	%f9, %f2, fbeq_else.38618
	addi	%t6, %zero, 1
	j	fbeq_cont.38619
fbeq_else.38618:
	addi	%t6, %zero, 0
fbeq_cont.38619:
	beqi	%t6, 0, bnei_else.38620
	addi	%t6, %zero, 0
	j	bnei_cont.38613
bnei_else.38620:
	addi	%t6, %zero, 1
bnei_cont.38621:
	j	bnei_cont.38613
bnei_else.38616:
	addi	%t6, %zero, 0
bnei_cont.38617:
	j	bnei_cont.38613
bnei_else.38612:
	addi	%t6, %zero, 0
bnei_cont.38613:
	beqi	%t6, 0, bnei_else.38622
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.38623
bnei_else.38622:
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
	fblt	%f13, %f14, fbgt_else.38624
	addi	%t6, %zero, 0
	j	fbgt_cont.38625
fbgt_else.38624:
	addi	%t6, %zero, 1
fbgt_cont.38625:
	beqi	%t6, 0, bnei_else.38626
	flw	%f13, 2(%t5)
	fmul	%f13, %f8, %f13
	fadd	%f13, %f13, %f7
	fabs	%f13, %f13
	lw	%t4, 4(%t4)
	flw	%f15, 2(%t4)
	fblt	%f13, %f15, fbgt_else.38628
	addi	%t4, %zero, 0
	j	fbgt_cont.38629
fbgt_else.38628:
	addi	%t4, %zero, 1
fbgt_cont.38629:
	beqi	%t4, 0, bnei_else.38630
	fbne	%f9, %f2, fbeq_else.38632
	addi	%t4, %zero, 1
	j	fbeq_cont.38633
fbeq_else.38632:
	addi	%t4, %zero, 0
fbeq_cont.38633:
	beqi	%t4, 0, bnei_else.38634
	addi	%t4, %zero, 0
	j	bnei_cont.38627
bnei_else.38634:
	addi	%t4, %zero, 1
bnei_cont.38635:
	j	bnei_cont.38627
bnei_else.38630:
	addi	%t4, %zero, 0
bnei_cont.38631:
	j	bnei_cont.38627
bnei_else.38626:
	addi	%t4, %zero, 0
bnei_cont.38627:
	beqi	%t4, 0, bnei_else.38636
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 2
	j	bnei_cont.38637
bnei_else.38636:
	flw	%f8, 4(%t3)
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)
	fmul	%f7, %f7, %f8
	fmul	%f9, %f7, %f11
	fadd	%f5, %f9, %f5
	fabs	%f5, %f5
	fblt	%f5, %f14, fbgt_else.38638
	addi	%t3, %zero, 0
	j	fbgt_cont.38639
fbgt_else.38638:
	addi	%t3, %zero, 1
fbgt_cont.38639:
	beqi	%t3, 0, bnei_else.38640
	fmul	%f5, %f7, %f10
	fadd	%f5, %f5, %f6
	fabs	%f5, %f5
	fblt	%f5, %f12, fbgt_else.38642
	addi	%t3, %zero, 0
	j	fbgt_cont.38643
fbgt_else.38642:
	addi	%t3, %zero, 1
fbgt_cont.38643:
	beqi	%t3, 0, bnei_else.38644
	fbne	%f8, %f2, fbeq_else.38646
	addi	%t3, %zero, 1
	j	fbeq_cont.38647
fbeq_else.38646:
	addi	%t3, %zero, 0
fbeq_cont.38647:
	beqi	%t3, 0, bnei_else.38648
	addi	%t3, %zero, 0
	j	bnei_cont.38641
bnei_else.38648:
	addi	%t3, %zero, 1
bnei_cont.38649:
	j	bnei_cont.38641
bnei_else.38644:
	addi	%t3, %zero, 0
bnei_cont.38645:
	j	bnei_cont.38641
bnei_else.38640:
	addi	%t3, %zero, 0
bnei_cont.38641:
	beqi	%t3, 0, bnei_else.38650
	fsw	%f7, 135(%zero)
	addi	%t3, %zero, 3
	j	bnei_cont.38651
bnei_else.38650:
	addi	%t3, %zero, 0
bnei_cont.38651:
bnei_cont.38637:
bnei_cont.38623:
bnei_cont.38593:
	beqi	%t3, 0, bnei_else.38652
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	fblt	%f5, %f6, fbgt_else.38654
	addi	%t3, %zero, 0
	j	fbgt_cont.38655
fbgt_else.38654:
	addi	%t3, %zero, 1
fbgt_cont.38655:
	beqi	%t3, 0, bnei_else.38656
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.38658
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
	beqi	%v1, -1, bnei_else.38660
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
	beqi	%v1, -1, bnei_else.38662
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
	beqi	%v1, -1, bnei_else.38664
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
	j	bnei_cont.38591
bnei_else.38664:
bnei_cont.38665:
	j	bnei_cont.38591
bnei_else.38662:
bnei_cont.38663:
	j	bnei_cont.38591
bnei_else.38660:
bnei_cont.38661:
	j	bnei_cont.38591
bnei_else.38658:
bnei_cont.38659:
	j	bnei_cont.38591
bnei_else.38656:
bnei_cont.38657:
	j	bnei_cont.38591
bnei_else.38652:
bnei_cont.38653:
	j	bnei_cont.38591
bnei_else.38590:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.38666
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
	beqi	%v1, -1, bnei_else.38668
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
	beqi	%v1, -1, bnei_else.38670
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
	beqi	%v1, -1, bnei_else.38672
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
	j	bnei_cont.38667
bnei_else.38672:
bnei_cont.38673:
	j	bnei_cont.38667
bnei_else.38670:
bnei_cont.38671:
	j	bnei_cont.38667
bnei_else.38668:
bnei_cont.38669:
	j	bnei_cont.38667
bnei_else.38666:
bnei_cont.38667:
bnei_cont.38591:
	lw	%v0, 12(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.38589
bnei_else.38588:
bnei_cont.38589:
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38674
	addi	%v0, %zero, 0
	j	fbgt_cont.38675
fbgt_else.38674:
	addi	%v0, %zero, 1
fbgt_cont.38675:
	beqi	%v0, 0, bnei_else.38676
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38678
	addi	%v0, %zero, 0
	j	bnei_cont.38677
fbgt_else.38678:
	addi	%v0, %zero, 1
fbgt_cont.38679:
	j	bnei_cont.38677
bnei_else.38676:
	addi	%v0, %zero, 0
bnei_cont.38677:
	beqi	%v0, 0, bnei_else.38680
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38682
	beqi	%a0, 2, bnei_else.38684
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
	beqi	%v1, 0, bnei_else.38686
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
	j	bnei_cont.38687
bnei_else.38686:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38687:
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
	fbne	%f1, %f4, fbeq_else.38688
	addi	%a0, %zero, 1
	j	fbeq_cont.38689
fbeq_else.38688:
	addi	%a0, %zero, 0
fbeq_cont.38689:
	beqi	%a0, 0, bnei_else.38690
	flw	%f1, 474(%zero)
	j	bnei_cont.38691
bnei_else.38690:
	beqi	%v1, 0, bnei_else.38692
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38693
bnei_else.38692:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38693:
bnei_cont.38691:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38683
bnei_else.38684:
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
bnei_cont.38685:
	j	bnei_cont.38683
bnei_else.38682:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38694
	addi	%v1, %zero, 1
	j	fbeq_cont.38695
fbeq_else.38694:
	addi	%v1, %zero, 0
fbeq_cont.38695:
	beqi	%v1, 0, bnei_else.38696
	fmov	%f1, %f0
	j	bnei_cont.38697
bnei_else.38696:
	fblt	%f0, %f1, fbgt_else.38698
	addi	%v1, %zero, 0
	j	fbgt_cont.38699
fbgt_else.38698:
	addi	%v1, %zero, 1
fbgt_cont.38699:
	beqi	%v1, 0, bnei_else.38700
	flw	%f1, 474(%zero)
	j	bnei_cont.38701
bnei_else.38700:
	flw	%f1, 468(%zero)
bnei_cont.38701:
bnei_cont.38697:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38683:
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
	beqi	%v0, 0, bnei_else.38702
	j	bnei_cont.38587
bnei_else.38702:
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
	fblt	%f1, %f0, fbgt_else.38704
	addi	%v0, %zero, 0
	j	fbgt_cont.38705
fbgt_else.38704:
	addi	%v0, %zero, 1
fbgt_cont.38705:
	beqi	%v0, 0, bnei_else.38706
	j	bnei_cont.38707
bnei_else.38706:
	fmov	%f0, %f1
bnei_cont.38707:
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
bnei_cont.38703:
	j	bnei_cont.38587
bnei_else.38680:
bnei_cont.38681:
	j	bnei_cont.38587
bnei_else.38586:
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
	beqi	%t3, -1, bnei_else.38708
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.38710
	lw	%t4, 12(%t3)
	lw	%t5, 10(%t4)
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)
	flw	%f7, 2(%t5)
	lw	%t6, 1(%a3)
	add	%at, %t6, %t3
	lw	%t3, 0(%at)
	lw	%t6, 1(%t4)
	beqi	%t6, 1, bnei_else.38712
	beqi	%t6, 2, bnei_else.38714
	flw	%f8, 0(%t3)
	fbne	%f8, %f2, fbeq_else.38716
	addi	%t6, %zero, 1
	j	fbeq_cont.38717
fbeq_else.38716:
	addi	%t6, %zero, 0
fbeq_cont.38717:
	beqi	%t6, 0, bnei_else.38718
	addi	%t3, %zero, 0
	j	bnei_cont.38713
bnei_else.38718:
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
	fblt	%f2, %f6, fbgt_else.38720
	addi	%t5, %zero, 0
	j	fbgt_cont.38721
fbgt_else.38720:
	addi	%t5, %zero, 1
fbgt_cont.38721:
	beqi	%t5, 0, bnei_else.38722
	lw	%t4, 6(%t4)
	beqi	%t4, 0, bnei_else.38724
	fsqrt	%f6, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	j	bnei_cont.38725
bnei_else.38724:
	fsqrt	%f6, %f6
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
bnei_cont.38725:
	addi	%t3, %zero, 1
	j	bnei_cont.38723
bnei_else.38722:
	addi	%t3, %zero, 0
bnei_cont.38723:
bnei_cont.38719:
	j	bnei_cont.38713
bnei_else.38714:
	flw	%f5, 0(%t3)
	fblt	%f5, %f2, fbgt_else.38726
	addi	%t3, %zero, 0
	j	fbgt_cont.38727
fbgt_else.38726:
	addi	%t3, %zero, 1
fbgt_cont.38727:
	beqi	%t3, 0, bnei_else.38728
	flw	%f6, 3(%t5)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.38729
bnei_else.38728:
	addi	%t3, %zero, 0
bnei_cont.38729:
bnei_cont.38715:
	j	bnei_cont.38713
bnei_else.38712:
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
	fblt	%f11, %f12, fbgt_else.38730
	addi	%t6, %zero, 0
	j	fbgt_cont.38731
fbgt_else.38730:
	addi	%t6, %zero, 1
fbgt_cont.38731:
	beqi	%t6, 0, bnei_else.38732
	flw	%f11, 2(%t5)
	fmul	%f11, %f8, %f11
	fadd	%f11, %f11, %f7
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f13, 2(%t6)
	fblt	%f11, %f13, fbgt_else.38734
	addi	%t6, %zero, 0
	j	fbgt_cont.38735
fbgt_else.38734:
	addi	%t6, %zero, 1
fbgt_cont.38735:
	beqi	%t6, 0, bnei_else.38736
	fbne	%f9, %f2, fbeq_else.38738
	addi	%t6, %zero, 1
	j	fbeq_cont.38739
fbeq_else.38738:
	addi	%t6, %zero, 0
fbeq_cont.38739:
	beqi	%t6, 0, bnei_else.38740
	addi	%t6, %zero, 0
	j	bnei_cont.38733
bnei_else.38740:
	addi	%t6, %zero, 1
bnei_cont.38741:
	j	bnei_cont.38733
bnei_else.38736:
	addi	%t6, %zero, 0
bnei_cont.38737:
	j	bnei_cont.38733
bnei_else.38732:
	addi	%t6, %zero, 0
bnei_cont.38733:
	beqi	%t6, 0, bnei_else.38742
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.38743
bnei_else.38742:
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
	fblt	%f13, %f14, fbgt_else.38744
	addi	%t6, %zero, 0
	j	fbgt_cont.38745
fbgt_else.38744:
	addi	%t6, %zero, 1
fbgt_cont.38745:
	beqi	%t6, 0, bnei_else.38746
	flw	%f13, 2(%t5)
	fmul	%f13, %f8, %f13
	fadd	%f13, %f13, %f7
	fabs	%f13, %f13
	lw	%t4, 4(%t4)
	flw	%f15, 2(%t4)
	fblt	%f13, %f15, fbgt_else.38748
	addi	%t4, %zero, 0
	j	fbgt_cont.38749
fbgt_else.38748:
	addi	%t4, %zero, 1
fbgt_cont.38749:
	beqi	%t4, 0, bnei_else.38750
	fbne	%f9, %f2, fbeq_else.38752
	addi	%t4, %zero, 1
	j	fbeq_cont.38753
fbeq_else.38752:
	addi	%t4, %zero, 0
fbeq_cont.38753:
	beqi	%t4, 0, bnei_else.38754
	addi	%t4, %zero, 0
	j	bnei_cont.38747
bnei_else.38754:
	addi	%t4, %zero, 1
bnei_cont.38755:
	j	bnei_cont.38747
bnei_else.38750:
	addi	%t4, %zero, 0
bnei_cont.38751:
	j	bnei_cont.38747
bnei_else.38746:
	addi	%t4, %zero, 0
bnei_cont.38747:
	beqi	%t4, 0, bnei_else.38756
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 2
	j	bnei_cont.38757
bnei_else.38756:
	flw	%f8, 4(%t3)
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)
	fmul	%f7, %f7, %f8
	fmul	%f9, %f7, %f11
	fadd	%f5, %f9, %f5
	fabs	%f5, %f5
	fblt	%f5, %f14, fbgt_else.38758
	addi	%t3, %zero, 0
	j	fbgt_cont.38759
fbgt_else.38758:
	addi	%t3, %zero, 1
fbgt_cont.38759:
	beqi	%t3, 0, bnei_else.38760
	fmul	%f5, %f7, %f10
	fadd	%f5, %f5, %f6
	fabs	%f5, %f5
	fblt	%f5, %f12, fbgt_else.38762
	addi	%t3, %zero, 0
	j	fbgt_cont.38763
fbgt_else.38762:
	addi	%t3, %zero, 1
fbgt_cont.38763:
	beqi	%t3, 0, bnei_else.38764
	fbne	%f8, %f2, fbeq_else.38766
	addi	%t3, %zero, 1
	j	fbeq_cont.38767
fbeq_else.38766:
	addi	%t3, %zero, 0
fbeq_cont.38767:
	beqi	%t3, 0, bnei_else.38768
	addi	%t3, %zero, 0
	j	bnei_cont.38761
bnei_else.38768:
	addi	%t3, %zero, 1
bnei_cont.38769:
	j	bnei_cont.38761
bnei_else.38764:
	addi	%t3, %zero, 0
bnei_cont.38765:
	j	bnei_cont.38761
bnei_else.38760:
	addi	%t3, %zero, 0
bnei_cont.38761:
	beqi	%t3, 0, bnei_else.38770
	fsw	%f7, 135(%zero)
	addi	%t3, %zero, 3
	j	bnei_cont.38771
bnei_else.38770:
	addi	%t3, %zero, 0
bnei_cont.38771:
bnei_cont.38757:
bnei_cont.38743:
bnei_cont.38713:
	beqi	%t3, 0, bnei_else.38772
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	fblt	%f5, %f6, fbgt_else.38774
	addi	%t3, %zero, 0
	j	fbgt_cont.38775
fbgt_else.38774:
	addi	%t3, %zero, 1
fbgt_cont.38775:
	beqi	%t3, 0, bnei_else.38776
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.38778
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
	beqi	%v1, -1, bnei_else.38780
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
	beqi	%v1, -1, bnei_else.38782
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
	beqi	%v1, -1, bnei_else.38784
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
	j	bnei_cont.38711
bnei_else.38784:
bnei_cont.38785:
	j	bnei_cont.38711
bnei_else.38782:
bnei_cont.38783:
	j	bnei_cont.38711
bnei_else.38780:
bnei_cont.38781:
	j	bnei_cont.38711
bnei_else.38778:
bnei_cont.38779:
	j	bnei_cont.38711
bnei_else.38776:
bnei_cont.38777:
	j	bnei_cont.38711
bnei_else.38772:
bnei_cont.38773:
	j	bnei_cont.38711
bnei_else.38710:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.38786
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
	beqi	%v1, -1, bnei_else.38788
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
	beqi	%v1, -1, bnei_else.38790
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
	beqi	%v1, -1, bnei_else.38792
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
	j	bnei_cont.38787
bnei_else.38792:
bnei_cont.38793:
	j	bnei_cont.38787
bnei_else.38790:
bnei_cont.38791:
	j	bnei_cont.38787
bnei_else.38788:
bnei_cont.38789:
	j	bnei_cont.38787
bnei_else.38786:
bnei_cont.38787:
bnei_cont.38711:
	lw	%v0, 12(%sp)
	lw	%v1, 16(%sp)
	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bnei_cont.38709
bnei_else.38708:
bnei_cont.38709:
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38794
	addi	%v0, %zero, 0
	j	fbgt_cont.38795
fbgt_else.38794:
	addi	%v0, %zero, 1
fbgt_cont.38795:
	beqi	%v0, 0, bnei_else.38796
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38798
	addi	%v0, %zero, 0
	j	bnei_cont.38797
fbgt_else.38798:
	addi	%v0, %zero, 1
fbgt_cont.38799:
	j	bnei_cont.38797
bnei_else.38796:
	addi	%v0, %zero, 0
bnei_cont.38797:
	beqi	%v0, 0, bnei_else.38800
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 17(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38802
	beqi	%a0, 2, bnei_else.38804
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
	beqi	%v1, 0, bnei_else.38806
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
	j	bnei_cont.38807
bnei_else.38806:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38807:
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
	fbne	%f1, %f4, fbeq_else.38808
	addi	%a0, %zero, 1
	j	fbeq_cont.38809
fbeq_else.38808:
	addi	%a0, %zero, 0
fbeq_cont.38809:
	beqi	%a0, 0, bnei_else.38810
	flw	%f1, 474(%zero)
	j	bnei_cont.38811
bnei_else.38810:
	beqi	%v1, 0, bnei_else.38812
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38813
bnei_else.38812:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38813:
bnei_cont.38811:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38803
bnei_else.38804:
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
bnei_cont.38805:
	j	bnei_cont.38803
bnei_else.38802:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38814
	addi	%v1, %zero, 1
	j	fbeq_cont.38815
fbeq_else.38814:
	addi	%v1, %zero, 0
fbeq_cont.38815:
	beqi	%v1, 0, bnei_else.38816
	fmov	%f1, %f0
	j	bnei_cont.38817
bnei_else.38816:
	fblt	%f0, %f1, fbgt_else.38818
	addi	%v1, %zero, 0
	j	fbgt_cont.38819
fbgt_else.38818:
	addi	%v1, %zero, 1
fbgt_cont.38819:
	beqi	%v1, 0, bnei_else.38820
	flw	%f1, 474(%zero)
	j	bnei_cont.38821
bnei_else.38820:
	flw	%f1, 468(%zero)
bnei_cont.38821:
bnei_cont.38817:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38803:
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
	beqi	%v0, 0, bnei_else.38822
	j	bnei_cont.38801
bnei_else.38822:
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
	fblt	%f1, %f0, fbgt_else.38824
	addi	%v0, %zero, 0
	j	fbgt_cont.38825
fbgt_else.38824:
	addi	%v0, %zero, 1
fbgt_cont.38825:
	beqi	%v0, 0, bnei_else.38826
	j	bnei_cont.38827
bnei_else.38826:
	fmov	%f0, %f1
bnei_cont.38827:
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
bnei_cont.38823:
	j	bnei_cont.38801
bnei_else.38800:
bnei_cont.38801:
bnei_cont.38587:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.38828
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
	fblt	%f0, %f1, fbgt_else.38829
	addi	%a1, %zero, 0
	j	fbgt_cont.38830
fbgt_else.38829:
	addi	%a1, %zero, 1
fbgt_cont.38830:
	sw	%v0, 20(%sp)
	beqi	%a1, 0, bnei_else.38831
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
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38833
	addi	%v0, %zero, 0
	j	fbgt_cont.38834
fbgt_else.38833:
	addi	%v0, %zero, 1
fbgt_cont.38834:
	beqi	%v0, 0, bnei_else.38835
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38837
	addi	%v0, %zero, 0
	j	bnei_cont.38836
fbgt_else.38837:
	addi	%v0, %zero, 1
fbgt_cont.38838:
	j	bnei_cont.38836
bnei_else.38835:
	addi	%v0, %zero, 0
bnei_cont.38836:
	beqi	%v0, 0, bnei_else.38839
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 23(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38841
	beqi	%a0, 2, bnei_else.38843
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
	beqi	%v1, 0, bnei_else.38845
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
	j	bnei_cont.38846
bnei_else.38845:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38846:
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
	fbne	%f1, %f4, fbeq_else.38847
	addi	%a0, %zero, 1
	j	fbeq_cont.38848
fbeq_else.38847:
	addi	%a0, %zero, 0
fbeq_cont.38848:
	beqi	%a0, 0, bnei_else.38849
	flw	%f1, 474(%zero)
	j	bnei_cont.38850
bnei_else.38849:
	beqi	%v1, 0, bnei_else.38851
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38852
bnei_else.38851:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38852:
bnei_cont.38850:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38842
bnei_else.38843:
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
bnei_cont.38844:
	j	bnei_cont.38842
bnei_else.38841:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38853
	addi	%v1, %zero, 1
	j	fbeq_cont.38854
fbeq_else.38853:
	addi	%v1, %zero, 0
fbeq_cont.38854:
	beqi	%v1, 0, bnei_else.38855
	fmov	%f1, %f0
	j	bnei_cont.38856
bnei_else.38855:
	fblt	%f0, %f1, fbgt_else.38857
	addi	%v1, %zero, 0
	j	fbgt_cont.38858
fbgt_else.38857:
	addi	%v1, %zero, 1
fbgt_cont.38858:
	beqi	%v1, 0, bnei_else.38859
	flw	%f1, 474(%zero)
	j	bnei_cont.38860
bnei_else.38859:
	flw	%f1, 468(%zero)
bnei_cont.38860:
bnei_cont.38856:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38842:
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
	beqi	%v0, 0, bnei_else.38861
	j	bnei_cont.38832
bnei_else.38861:
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
	fblt	%f1, %f0, fbgt_else.38863
	addi	%v0, %zero, 0
	j	fbgt_cont.38864
fbgt_else.38863:
	addi	%v0, %zero, 1
fbgt_cont.38864:
	beqi	%v0, 0, bnei_else.38865
	j	bnei_cont.38866
bnei_else.38865:
	fmov	%f0, %f1
bnei_cont.38866:
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
bnei_cont.38862:
	j	bnei_cont.38832
bnei_else.38839:
bnei_cont.38840:
	j	bnei_cont.38832
bnei_else.38831:
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
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38867
	addi	%v0, %zero, 0
	j	fbgt_cont.38868
fbgt_else.38867:
	addi	%v0, %zero, 1
fbgt_cont.38868:
	beqi	%v0, 0, bnei_else.38869
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38871
	addi	%v0, %zero, 0
	j	bnei_cont.38870
fbgt_else.38871:
	addi	%v0, %zero, 1
fbgt_cont.38872:
	j	bnei_cont.38870
bnei_else.38869:
	addi	%v0, %zero, 0
bnei_cont.38870:
	beqi	%v0, 0, bnei_else.38873
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 27(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38875
	beqi	%a0, 2, bnei_else.38877
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
	beqi	%v1, 0, bnei_else.38879
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
	j	bnei_cont.38880
bnei_else.38879:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38880:
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
	fbne	%f1, %f4, fbeq_else.38881
	addi	%a0, %zero, 1
	j	fbeq_cont.38882
fbeq_else.38881:
	addi	%a0, %zero, 0
fbeq_cont.38882:
	beqi	%a0, 0, bnei_else.38883
	flw	%f1, 474(%zero)
	j	bnei_cont.38884
bnei_else.38883:
	beqi	%v1, 0, bnei_else.38885
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38886
bnei_else.38885:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38886:
bnei_cont.38884:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38876
bnei_else.38877:
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
bnei_cont.38878:
	j	bnei_cont.38876
bnei_else.38875:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38887
	addi	%v1, %zero, 1
	j	fbeq_cont.38888
fbeq_else.38887:
	addi	%v1, %zero, 0
fbeq_cont.38888:
	beqi	%v1, 0, bnei_else.38889
	fmov	%f1, %f0
	j	bnei_cont.38890
bnei_else.38889:
	fblt	%f0, %f1, fbgt_else.38891
	addi	%v1, %zero, 0
	j	fbgt_cont.38892
fbgt_else.38891:
	addi	%v1, %zero, 1
fbgt_cont.38892:
	beqi	%v1, 0, bnei_else.38893
	flw	%f1, 474(%zero)
	j	bnei_cont.38894
bnei_else.38893:
	flw	%f1, 468(%zero)
bnei_cont.38894:
bnei_cont.38890:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38876:
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
	beqi	%v0, 0, bnei_else.38895
	j	bnei_cont.38874
bnei_else.38895:
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
	fblt	%f1, %f0, fbgt_else.38897
	addi	%v0, %zero, 0
	j	fbgt_cont.38898
fbgt_else.38897:
	addi	%v0, %zero, 1
fbgt_cont.38898:
	beqi	%v0, 0, bnei_else.38899
	j	bnei_cont.38900
bnei_else.38899:
	fmov	%f0, %f1
bnei_cont.38900:
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
bnei_cont.38896:
	j	bnei_cont.38874
bnei_else.38873:
bnei_cont.38874:
bnei_cont.38832:
	lw	%v0, 20(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.38828:
	jr	%ra
bgti_else.38583:
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
	flw	%f1, 470(%zero)
	fblt	%f0, %f1, fbgt_else.38926
	addi	%v1, %zero, 0
	j	fbgt_cont.38927
fbgt_else.38926:
	addi	%v1, %zero, 1
fbgt_cont.38927:
	beqi	%v1, 0, bnei_else.38928
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
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38930
	addi	%v0, %zero, 0
	j	fbgt_cont.38931
fbgt_else.38930:
	addi	%v0, %zero, 1
fbgt_cont.38931:
	beqi	%v0, 0, bnei_else.38932
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38934
	addi	%v0, %zero, 0
	j	bnei_cont.38933
fbgt_else.38934:
	addi	%v0, %zero, 1
fbgt_cont.38935:
	j	bnei_cont.38933
bnei_else.38932:
	addi	%v0, %zero, 0
bnei_cont.38933:
	beqi	%v0, 0, bnei_else.38936
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 7(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38938
	beqi	%a0, 2, bnei_else.38940
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
	beqi	%v1, 0, bnei_else.38942
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
	j	bnei_cont.38943
bnei_else.38942:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38943:
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
	fbne	%f1, %f4, fbeq_else.38944
	addi	%a0, %zero, 1
	j	fbeq_cont.38945
fbeq_else.38944:
	addi	%a0, %zero, 0
fbeq_cont.38945:
	beqi	%a0, 0, bnei_else.38946
	flw	%f1, 474(%zero)
	j	bnei_cont.38947
bnei_else.38946:
	beqi	%v1, 0, bnei_else.38948
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38949
bnei_else.38948:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38949:
bnei_cont.38947:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38939
bnei_else.38940:
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
bnei_cont.38941:
	j	bnei_cont.38939
bnei_else.38938:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38950
	addi	%v1, %zero, 1
	j	fbeq_cont.38951
fbeq_else.38950:
	addi	%v1, %zero, 0
fbeq_cont.38951:
	beqi	%v1, 0, bnei_else.38952
	fmov	%f1, %f0
	j	bnei_cont.38953
bnei_else.38952:
	fblt	%f0, %f1, fbgt_else.38954
	addi	%v1, %zero, 0
	j	fbgt_cont.38955
fbgt_else.38954:
	addi	%v1, %zero, 1
fbgt_cont.38955:
	beqi	%v1, 0, bnei_else.38956
	flw	%f1, 474(%zero)
	j	bnei_cont.38957
bnei_else.38956:
	flw	%f1, 468(%zero)
bnei_cont.38957:
bnei_cont.38953:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38939:
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
	beqi	%v0, 0, bnei_else.38958
	j	bnei_cont.38929
bnei_else.38958:
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
	fblt	%f1, %f0, fbgt_else.38960
	addi	%v0, %zero, 0
	j	fbgt_cont.38961
fbgt_else.38960:
	addi	%v0, %zero, 1
fbgt_cont.38961:
	beqi	%v0, 0, bnei_else.38962
	j	bnei_cont.38963
bnei_else.38962:
	fmov	%f0, %f1
bnei_cont.38963:
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
bnei_cont.38959:
	j	bnei_cont.38929
bnei_else.38936:
bnei_cont.38937:
	j	bnei_cont.38929
bnei_else.38928:
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
	flw	%f1, 465(%zero)
	fblt	%f1, %f0, fbgt_else.38964
	addi	%v0, %zero, 0
	j	fbgt_cont.38965
fbgt_else.38964:
	addi	%v0, %zero, 1
fbgt_cont.38965:
	beqi	%v0, 0, bnei_else.38966
	flw	%f1, 444(%zero)
	fblt	%f0, %f1, fbgt_else.38968
	addi	%v0, %zero, 0
	j	bnei_cont.38967
fbgt_else.38968:
	addi	%v0, %zero, 1
fbgt_cont.38969:
	j	bnei_cont.38967
bnei_else.38966:
	addi	%v0, %zero, 0
bnei_cont.38967:
	beqi	%v0, 0, bnei_else.38970
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.38972
	beqi	%a0, 2, bnei_else.38974
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
	beqi	%v1, 0, bnei_else.38976
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
	j	bnei_cont.38977
bnei_else.38976:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.38977:
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
	fbne	%f1, %f4, fbeq_else.38978
	addi	%a0, %zero, 1
	j	fbeq_cont.38979
fbeq_else.38978:
	addi	%a0, %zero, 0
fbeq_cont.38979:
	beqi	%a0, 0, bnei_else.38980
	flw	%f1, 474(%zero)
	j	bnei_cont.38981
bnei_else.38980:
	beqi	%v1, 0, bnei_else.38982
	flw	%f5, 468(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.38983
bnei_else.38982:
	flw	%f5, 474(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.38983:
bnei_cont.38981:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.38973
bnei_else.38974:
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
bnei_cont.38975:
	j	bnei_cont.38973
bnei_else.38972:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.38984
	addi	%v1, %zero, 1
	j	fbeq_cont.38985
fbeq_else.38984:
	addi	%v1, %zero, 0
fbeq_cont.38985:
	beqi	%v1, 0, bnei_else.38986
	fmov	%f1, %f0
	j	bnei_cont.38987
bnei_else.38986:
	fblt	%f0, %f1, fbgt_else.38988
	addi	%v1, %zero, 0
	j	fbgt_cont.38989
fbgt_else.38988:
	addi	%v1, %zero, 1
fbgt_cont.38989:
	beqi	%v1, 0, bnei_else.38990
	flw	%f1, 474(%zero)
	j	bnei_cont.38991
bnei_else.38990:
	flw	%f1, 468(%zero)
bnei_cont.38991:
bnei_cont.38987:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.38973:
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
	beqi	%v0, 0, bnei_else.38992
	j	bnei_cont.38971
bnei_else.38992:
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
	fblt	%f1, %f0, fbgt_else.38994
	addi	%v0, %zero, 0
	j	fbgt_cont.38995
fbgt_else.38994:
	addi	%v0, %zero, 1
fbgt_cont.38995:
	beqi	%v0, 0, bnei_else.38996
	j	bnei_cont.38997
bnei_else.38996:
	fmov	%f0, %f1
bnei_cont.38997:
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
bnei_cont.38993:
	j	bnei_cont.38971
bnei_else.38970:
bnei_cont.38971:
bnei_cont.38929:
	addi	%a1, %zero, 116
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
do_without_neighbors.3002:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.39081
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39082
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.39083
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
	beqi	%a0, 0, bnei_else.39085
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
	j	bnei_cont.39086
bnei_else.39085:
bnei_cont.39086:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.39087
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
	j	bnei_cont.39088
bnei_else.39087:
bnei_cont.39088:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.39089
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
	j	bnei_cont.39090
bnei_else.39089:
bnei_cont.39090:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.39091
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
	j	bnei_cont.39092
bnei_else.39091:
bnei_cont.39092:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.39093
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
	j	bnei_cont.39094
bnei_else.39093:
bnei_cont.39094:
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
	j	bnei_cont.39084
bnei_else.39083:
bnei_cont.39084:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.39095
	lw	%v1, 0(%sp)
	lw	%a0, 2(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39096
	lw	%a0, 3(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.39097
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
	beqi	%a0, 0, bnei_else.39099
	lw	%t0, 179(%zero)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0
	addi	%v0, %t0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.39100
bnei_else.39099:
bnei_cont.39100:
	lw	%v0, 15(%sp)
	beqi	%v0, 1, bnei_else.39101
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
	j	bnei_cont.39102
bnei_else.39101:
bnei_cont.39102:
	lw	%v0, 15(%sp)
	beqi	%v0, 2, bnei_else.39103
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
	j	bnei_cont.39104
bnei_else.39103:
bnei_cont.39104:
	lw	%v0, 15(%sp)
	beqi	%v0, 3, bnei_else.39105
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
	j	bnei_cont.39106
bnei_else.39105:
bnei_cont.39106:
	lw	%v0, 15(%sp)
	beqi	%v0, 4, bnei_else.39107
	lw	%v0, 183(%zero)
	lw	%v1, 14(%sp)
	lw	%a0, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.39108
bnei_else.39107:
bnei_cont.39108:
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
	j	bnei_cont.39098
bnei_else.39097:
bnei_cont.39098:
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.39096:
	jr	%ra
bgt_else.39095:
	jr	%ra
bgti_else.39082:
	jr	%ra
bgt_else.39081:
	jr	%ra
try_exploit_neighbors.3018:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.39146
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.39147
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39148
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39150
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39152
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39154
	addi	%t1, %zero, 1
	j	beq_cont.39149
beq_else.39154:
	addi	%t1, %zero, 0
beq_cont.39155:
	j	beq_cont.39149
beq_else.39152:
	addi	%t1, %zero, 0
beq_cont.39153:
	j	beq_cont.39149
beq_else.39150:
	addi	%t1, %zero, 0
beq_cont.39151:
	j	beq_cont.39149
beq_else.39148:
	addi	%t1, %zero, 0
beq_cont.39149:
	beqi	%t1, 0, bnei_else.39156
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.39157
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
	j	bnei_cont.39158
bnei_else.39157:
bnei_cont.39158:
	addi	%a3, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.39159
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.39160
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39161
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39163
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39165
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.39167
	addi	%t1, %zero, 1
	j	beq_cont.39162
beq_else.39167:
	addi	%t1, %zero, 0
beq_cont.39168:
	j	beq_cont.39162
beq_else.39165:
	addi	%t1, %zero, 0
beq_cont.39166:
	j	beq_cont.39162
beq_else.39163:
	addi	%t1, %zero, 0
beq_cont.39164:
	j	beq_cont.39162
beq_else.39161:
	addi	%t1, %zero, 0
beq_cont.39162:
	beqi	%t1, 0, bnei_else.39169
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.39170
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
	j	bnei_cont.39171
bnei_else.39170:
bnei_cont.39171:
	addi	%a3, %a3, 1
	j	try_exploit_neighbors.3018
bnei_else.39169:
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	j	do_without_neighbors.3002
bgti_else.39160:
	jr	%ra
bgt_else.39159:
	jr	%ra
bnei_else.39156:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.39174
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.39175
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 0(%sp)
	sw	%a3, 1(%sp)
	beqi	%v0, 0, bnei_else.39176
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
	beqi	%v0, 0, bnei_else.39178
	lw	%a2, 179(%zero)
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.39179
bnei_else.39178:
bnei_cont.39179:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.39180
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
	j	bnei_cont.39181
bnei_else.39180:
bnei_cont.39181:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.39182
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
	j	bnei_cont.39183
bnei_else.39182:
bnei_cont.39183:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.39184
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
	j	bnei_cont.39185
bnei_else.39184:
bnei_cont.39185:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.39186
	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.39187
bnei_else.39186:
bnei_cont.39187:
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
	j	bnei_cont.39177
bnei_else.39176:
bnei_cont.39177:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.39175:
	jr	%ra
bgt_else.39174:
	jr	%ra
bgti_else.39147:
	jr	%ra
bgt_else.39146:
	jr	%ra
pretrace_diffuse_rays.3031:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.39212
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39213
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.39214
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
	j	bnei_cont.39215
bnei_else.39214:
bnei_cont.39215:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.39216
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.39217
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.39218
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
	fblt	%f0, %f1, fbgt_else.39220
	addi	%a0, %zero, 0
	j	fbgt_cont.39221
fbgt_else.39220:
	addi	%a0, %zero, 1
fbgt_cont.39221:
	beqi	%a0, 0, bnei_else.39222
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.39223
bnei_else.39222:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.39223:
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
	j	bnei_cont.39219
bnei_else.39218:
bnei_cont.39219:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3031
bgti_else.39217:
	jr	%ra
bgt_else.39216:
	jr	%ra
bgti_else.39213:
	jr	%ra
bgt_else.39212:
	jr	%ra
pretrace_pixels.3034:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.39252
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
	fbne	%f4, %f7, fbeq_else.39253
	addi	%a3, %zero, 1
	j	fbeq_cont.39254
fbeq_else.39253:
	addi	%a3, %zero, 0
fbeq_cont.39254:
	beqi	%a3, 0, bnei_else.39255
	flw	%f4, 474(%zero)
	j	bnei_cont.39256
bnei_else.39255:
	flw	%f8, 474(%zero)
	fdiv	%f4, %f8, %f4
bnei_cont.39256:
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
	blti	%v1, 0, bgti_else.39257
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.39259
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
	fblt	%f0, %f1, fbgt_else.39261
	addi	%a0, %zero, 0
	j	fbgt_cont.39262
fbgt_else.39261:
	addi	%a0, %zero, 1
fbgt_cont.39262:
	beqi	%a0, 0, bnei_else.39263
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.39264
bnei_else.39263:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.39264:
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
	j	bnei_cont.39260
bnei_else.39259:
bnei_cont.39260:
	lw	%v1, 5(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.39258
bgti_else.39257:
bgti_cont.39258:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.39265
	addi	%a0, %v0, -5
	j	bgti_cont.39266
bgti_else.39265:
	add	%a0, %zero, %v0
bgti_cont.39266:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3034
bgti_else.39252:
	jr	%ra
scan_pixel.3045:
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.40952
	jr	%ra
bgt_else.40952:
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
	blt	%t4, %t2, bgt_else.40954
	addi	%t5, %zero, 0
	j	bgt_cont.40955
bgt_else.40954:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.40956
	addi	%t5, %zero, 0
	j	bgt_cont.40957
bgt_else.40956:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.40958
	addi	%t5, %zero, 0
	j	bgt_cont.40959
bgt_else.40958:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.40960
	addi	%t5, %zero, 0
	j	bgt_cont.40961
bgt_else.40960:
	addi	%t5, %zero, 1
bgt_cont.40961:
bgt_cont.40959:
bgt_cont.40957:
bgt_cont.40955:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%t4, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%v0, 8(%sp)
	beqi	%t5, 0, bnei_else.40962
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.40964
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t7, 2(%t6)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.40966
	add	%at, %a2, %v0
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.40968
	addi	%t7, %v0, -1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.40970
	addi	%t7, %v0, 1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.40972
	addi	%t5, %zero, 1
	j	beq_cont.40967
beq_else.40972:
	addi	%t5, %zero, 0
beq_cont.40973:
	j	beq_cont.40967
beq_else.40970:
	addi	%t5, %zero, 0
beq_cont.40971:
	j	beq_cont.40967
beq_else.40968:
	addi	%t5, %zero, 0
beq_cont.40969:
	j	beq_cont.40967
beq_else.40966:
	addi	%t5, %zero, 0
beq_cont.40967:
	beqi	%t5, 0, bnei_else.40974
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	beqi	%t5, 0, bnei_else.40976
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
	j	bnei_cont.40977
bnei_else.40976:
bnei_cont.40977:
	addi	%a3, %t3, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.40963
bnei_else.40974:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.40975:
	j	bnei_cont.40963
bgti_else.40964:
bgti_cont.40965:
	j	bnei_cont.40963
bnei_else.40962:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.40978
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.40980
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
	beqi	%t5, 0, bnei_else.40982
	lw	%s1, 179(%zero)
	addi	%a0, %t7, 0
	addi	%v1, %t6, 0
	addi	%v0, %s1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.40983
bnei_else.40982:
bnei_cont.40983:
	lw	%v0, 14(%sp)
	beqi	%v0, 1, bnei_else.40984
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
	j	bnei_cont.40985
bnei_else.40984:
bnei_cont.40985:
	lw	%v0, 14(%sp)
	beqi	%v0, 2, bnei_else.40986
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
	j	bnei_cont.40987
bnei_else.40986:
bnei_cont.40987:
	lw	%v0, 14(%sp)
	beqi	%v0, 3, bnei_else.40988
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
	j	bnei_cont.40989
bnei_else.40988:
bnei_cont.40989:
	lw	%v0, 14(%sp)
	beqi	%v0, 4, bnei_else.40990
	lw	%v0, 183(%zero)
	lw	%v1, 13(%sp)
	lw	%a0, 12(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.40991
bnei_else.40990:
bnei_cont.40991:
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
	j	bnei_cont.40981
bnei_else.40980:
bnei_cont.40981:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.40979
bgti_else.40978:
bgti_cont.40979:
bnei_cont.40963:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.40992
	blti	%v0, 0, bgti_else.40994
	j	bgt_cont.40993
bgti_else.40994:
	addi	%v0, %zero, 0
bgti_cont.40995:
	j	bgt_cont.40993
bgt_else.40992:
	addi	%v0, %zero, 255
bgt_cont.40993:
	addi	%v1, %zero, 10
	sw	%v1, 15(%sp)
	sw	%v0, 16(%sp)
	blti	%v0, 10, bgti_else.40996
	addi	%a0, %v0, -10
	blti	%a0, 10, bgti_else.40998
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41000
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41002
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	print_int_sub1.2629
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.40997
bgti_else.41002:
	addi	%v0, %zero, 3
bgti_cont.41003:
	j	bgti_cont.40997
bgti_else.41000:
	addi	%v0, %zero, 2
bgti_cont.41001:
	j	bgti_cont.40997
bgti_else.40998:
	addi	%v0, %zero, 1
bgti_cont.40999:
	j	bgti_cont.40997
bgti_else.40996:
	addi	%v0, %zero, 0
bgti_cont.40997:
	lw	%v1, 16(%sp)
	sw	%v0, 17(%sp)
	blti	%v1, 10, bgti_else.41004
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41006
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41008
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41010
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41012
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41014
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41016
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41018
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41020
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41022
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41024
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41026
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	print_int_sub2.2632
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.41005
bgti_else.41026:
	add	%v0, %zero, %v1
bgti_cont.41027:
	j	bgti_cont.41005
bgti_else.41024:
	add	%v0, %zero, %v1
bgti_cont.41025:
	j	bgti_cont.41005
bgti_else.41022:
	add	%v0, %zero, %v1
bgti_cont.41023:
	j	bgti_cont.41005
bgti_else.41020:
	add	%v0, %zero, %v1
bgti_cont.41021:
	j	bgti_cont.41005
bgti_else.41018:
	add	%v0, %zero, %v1
bgti_cont.41019:
	j	bgti_cont.41005
bgti_else.41016:
	add	%v0, %zero, %v1
bgti_cont.41017:
	j	bgti_cont.41005
bgti_else.41014:
	add	%v0, %zero, %v1
bgti_cont.41015:
	j	bgti_cont.41005
bgti_else.41012:
	add	%v0, %zero, %v1
bgti_cont.41013:
	j	bgti_cont.41005
bgti_else.41010:
	add	%v0, %zero, %v1
bgti_cont.41011:
	j	bgti_cont.41005
bgti_else.41008:
	add	%v0, %zero, %v1
bgti_cont.41009:
	j	bgti_cont.41005
bgti_else.41006:
	add	%v0, %zero, %v1
bgti_cont.41007:
	j	bgti_cont.41005
bgti_else.41004:
	add	%v0, %zero, %v1
bgti_cont.41005:
	lw	%v1, 17(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41028
	addi	%v0, %v0, 48
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_print_char
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgt_cont.41029
bgt_else.41028:
	sw	%v0, 18(%sp)
	blti	%v1, 10, bgti_else.41030
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.41032
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41034
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41036
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub1.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgti_cont.41031
bgti_else.41036:
	addi	%v0, %zero, 3
bgti_cont.41037:
	j	bgti_cont.41031
bgti_else.41034:
	addi	%v0, %zero, 2
bgti_cont.41035:
	j	bgti_cont.41031
bgti_else.41032:
	addi	%v0, %zero, 1
bgti_cont.41033:
	j	bgti_cont.41031
bgti_else.41030:
	addi	%v0, %zero, 0
bgti_cont.41031:
	lw	%v1, 17(%sp)
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.41038
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41040
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41042
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41044
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41046
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41048
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41050
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41052
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41054
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41056
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41058
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41060
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub2.2632
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.41039
bgti_else.41060:
	add	%v0, %zero, %v1
bgti_cont.41061:
	j	bgti_cont.41039
bgti_else.41058:
	add	%v0, %zero, %v1
bgti_cont.41059:
	j	bgti_cont.41039
bgti_else.41056:
	add	%v0, %zero, %v1
bgti_cont.41057:
	j	bgti_cont.41039
bgti_else.41054:
	add	%v0, %zero, %v1
bgti_cont.41055:
	j	bgti_cont.41039
bgti_else.41052:
	add	%v0, %zero, %v1
bgti_cont.41053:
	j	bgti_cont.41039
bgti_else.41050:
	add	%v0, %zero, %v1
bgti_cont.41051:
	j	bgti_cont.41039
bgti_else.41048:
	add	%v0, %zero, %v1
bgti_cont.41049:
	j	bgti_cont.41039
bgti_else.41046:
	add	%v0, %zero, %v1
bgti_cont.41047:
	j	bgti_cont.41039
bgti_else.41044:
	add	%v0, %zero, %v1
bgti_cont.41045:
	j	bgti_cont.41039
bgti_else.41042:
	add	%v0, %zero, %v1
bgti_cont.41043:
	j	bgti_cont.41039
bgti_else.41040:
	add	%v0, %zero, %v1
bgti_cont.41041:
	j	bgti_cont.41039
bgti_else.41038:
	add	%v0, %zero, %v1
bgti_cont.41039:
	lw	%v1, 19(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41062
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
	j	bgt_cont.41063
bgt_else.41062:
	sw	%v0, 20(%sp)
	blti	%v1, 10, bgti_else.41064
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41066
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41068
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41070
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41072
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41074
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41076
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41078
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41080
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41082
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41084
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41086
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	print_int_sub2.2632
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bgti_cont.41065
bgti_else.41086:
	add	%v0, %zero, %v1
bgti_cont.41087:
	j	bgti_cont.41065
bgti_else.41084:
	add	%v0, %zero, %v1
bgti_cont.41085:
	j	bgti_cont.41065
bgti_else.41082:
	add	%v0, %zero, %v1
bgti_cont.41083:
	j	bgti_cont.41065
bgti_else.41080:
	add	%v0, %zero, %v1
bgti_cont.41081:
	j	bgti_cont.41065
bgti_else.41078:
	add	%v0, %zero, %v1
bgti_cont.41079:
	j	bgti_cont.41065
bgti_else.41076:
	add	%v0, %zero, %v1
bgti_cont.41077:
	j	bgti_cont.41065
bgti_else.41074:
	add	%v0, %zero, %v1
bgti_cont.41075:
	j	bgti_cont.41065
bgti_else.41072:
	add	%v0, %zero, %v1
bgti_cont.41073:
	j	bgti_cont.41065
bgti_else.41070:
	add	%v0, %zero, %v1
bgti_cont.41071:
	j	bgti_cont.41065
bgti_else.41068:
	add	%v0, %zero, %v1
bgti_cont.41069:
	j	bgti_cont.41065
bgti_else.41066:
	add	%v0, %zero, %v1
bgti_cont.41067:
	j	bgti_cont.41065
bgti_else.41064:
	add	%v0, %zero, %v1
bgti_cont.41065:
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
bgt_cont.41063:
bgt_cont.41029:
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
	blt	%at, %v0, bgt_else.41088
	blti	%v0, 0, bgti_else.41090
	j	bgt_cont.41089
bgti_else.41090:
	addi	%v0, %zero, 0
bgti_cont.41091:
	j	bgt_cont.41089
bgt_else.41088:
	addi	%v0, %zero, 255
bgt_cont.41089:
	sw	%v0, 22(%sp)
	blti	%v0, 10, bgti_else.41092
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.41094
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41096
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41098
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub1.2629
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.41093
bgti_else.41098:
	addi	%v0, %zero, 3
bgti_cont.41099:
	j	bgti_cont.41093
bgti_else.41096:
	addi	%v0, %zero, 2
bgti_cont.41097:
	j	bgti_cont.41093
bgti_else.41094:
	addi	%v0, %zero, 1
bgti_cont.41095:
	j	bgti_cont.41093
bgti_else.41092:
	addi	%v0, %zero, 0
bgti_cont.41093:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	blti	%v1, 10, bgti_else.41100
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41102
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41104
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41106
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41108
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41110
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41112
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41114
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41116
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41118
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41120
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41122
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub2.2632
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgti_cont.41101
bgti_else.41122:
	add	%v0, %zero, %v1
bgti_cont.41123:
	j	bgti_cont.41101
bgti_else.41120:
	add	%v0, %zero, %v1
bgti_cont.41121:
	j	bgti_cont.41101
bgti_else.41118:
	add	%v0, %zero, %v1
bgti_cont.41119:
	j	bgti_cont.41101
bgti_else.41116:
	add	%v0, %zero, %v1
bgti_cont.41117:
	j	bgti_cont.41101
bgti_else.41114:
	add	%v0, %zero, %v1
bgti_cont.41115:
	j	bgti_cont.41101
bgti_else.41112:
	add	%v0, %zero, %v1
bgti_cont.41113:
	j	bgti_cont.41101
bgti_else.41110:
	add	%v0, %zero, %v1
bgti_cont.41111:
	j	bgti_cont.41101
bgti_else.41108:
	add	%v0, %zero, %v1
bgti_cont.41109:
	j	bgti_cont.41101
bgti_else.41106:
	add	%v0, %zero, %v1
bgti_cont.41107:
	j	bgti_cont.41101
bgti_else.41104:
	add	%v0, %zero, %v1
bgti_cont.41105:
	j	bgti_cont.41101
bgti_else.41102:
	add	%v0, %zero, %v1
bgti_cont.41103:
	j	bgti_cont.41101
bgti_else.41100:
	add	%v0, %zero, %v1
bgti_cont.41101:
	lw	%v1, 23(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41124
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_print_char
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgt_cont.41125
bgt_else.41124:
	sw	%v0, 24(%sp)
	blti	%v1, 10, bgti_else.41126
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.41128
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41130
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41132
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub1.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgti_cont.41127
bgti_else.41132:
	addi	%v0, %zero, 3
bgti_cont.41133:
	j	bgti_cont.41127
bgti_else.41130:
	addi	%v0, %zero, 2
bgti_cont.41131:
	j	bgti_cont.41127
bgti_else.41128:
	addi	%v0, %zero, 1
bgti_cont.41129:
	j	bgti_cont.41127
bgti_else.41126:
	addi	%v0, %zero, 0
bgti_cont.41127:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	blti	%v1, 10, bgti_else.41134
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41136
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41138
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41140
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41142
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41144
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41146
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41148
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41150
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41152
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41154
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41156
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	print_int_sub2.2632
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.41135
bgti_else.41156:
	add	%v0, %zero, %v1
bgti_cont.41157:
	j	bgti_cont.41135
bgti_else.41154:
	add	%v0, %zero, %v1
bgti_cont.41155:
	j	bgti_cont.41135
bgti_else.41152:
	add	%v0, %zero, %v1
bgti_cont.41153:
	j	bgti_cont.41135
bgti_else.41150:
	add	%v0, %zero, %v1
bgti_cont.41151:
	j	bgti_cont.41135
bgti_else.41148:
	add	%v0, %zero, %v1
bgti_cont.41149:
	j	bgti_cont.41135
bgti_else.41146:
	add	%v0, %zero, %v1
bgti_cont.41147:
	j	bgti_cont.41135
bgti_else.41144:
	add	%v0, %zero, %v1
bgti_cont.41145:
	j	bgti_cont.41135
bgti_else.41142:
	add	%v0, %zero, %v1
bgti_cont.41143:
	j	bgti_cont.41135
bgti_else.41140:
	add	%v0, %zero, %v1
bgti_cont.41141:
	j	bgti_cont.41135
bgti_else.41138:
	add	%v0, %zero, %v1
bgti_cont.41139:
	j	bgti_cont.41135
bgti_else.41136:
	add	%v0, %zero, %v1
bgti_cont.41137:
	j	bgti_cont.41135
bgti_else.41134:
	add	%v0, %zero, %v1
bgti_cont.41135:
	lw	%v1, 25(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41158
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
	j	bgt_cont.41159
bgt_else.41158:
	sw	%v0, 26(%sp)
	blti	%v1, 10, bgti_else.41160
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41162
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41164
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41166
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41168
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41170
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41172
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41174
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41176
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41178
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41180
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41182
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2632
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.41161
bgti_else.41182:
	add	%v0, %zero, %v1
bgti_cont.41183:
	j	bgti_cont.41161
bgti_else.41180:
	add	%v0, %zero, %v1
bgti_cont.41181:
	j	bgti_cont.41161
bgti_else.41178:
	add	%v0, %zero, %v1
bgti_cont.41179:
	j	bgti_cont.41161
bgti_else.41176:
	add	%v0, %zero, %v1
bgti_cont.41177:
	j	bgti_cont.41161
bgti_else.41174:
	add	%v0, %zero, %v1
bgti_cont.41175:
	j	bgti_cont.41161
bgti_else.41172:
	add	%v0, %zero, %v1
bgti_cont.41173:
	j	bgti_cont.41161
bgti_else.41170:
	add	%v0, %zero, %v1
bgti_cont.41171:
	j	bgti_cont.41161
bgti_else.41168:
	add	%v0, %zero, %v1
bgti_cont.41169:
	j	bgti_cont.41161
bgti_else.41166:
	add	%v0, %zero, %v1
bgti_cont.41167:
	j	bgti_cont.41161
bgti_else.41164:
	add	%v0, %zero, %v1
bgti_cont.41165:
	j	bgti_cont.41161
bgti_else.41162:
	add	%v0, %zero, %v1
bgti_cont.41163:
	j	bgti_cont.41161
bgti_else.41160:
	add	%v0, %zero, %v1
bgti_cont.41161:
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
bgt_cont.41159:
bgt_cont.41125:
	lw	%v0, 21(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.41184
	blti	%v0, 0, bgti_else.41186
	j	bgt_cont.41185
bgti_else.41186:
	addi	%v0, %zero, 0
bgti_cont.41187:
	j	bgt_cont.41185
bgt_else.41184:
	addi	%v0, %zero, 255
bgt_cont.41185:
	sw	%v0, 27(%sp)
	blti	%v0, 10, bgti_else.41188
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.41190
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41192
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41194
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	print_int_sub1.2629
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	bgti_cont.41189
bgti_else.41194:
	addi	%v0, %zero, 3
bgti_cont.41195:
	j	bgti_cont.41189
bgti_else.41192:
	addi	%v0, %zero, 2
bgti_cont.41193:
	j	bgti_cont.41189
bgti_else.41190:
	addi	%v0, %zero, 1
bgti_cont.41191:
	j	bgti_cont.41189
bgti_else.41188:
	addi	%v0, %zero, 0
bgti_cont.41189:
	lw	%v1, 27(%sp)
	sw	%v0, 28(%sp)
	blti	%v1, 10, bgti_else.41196
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41198
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41200
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41202
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41204
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41206
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41208
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41210
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41212
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41214
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41216
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41218
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int_sub2.2632
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bgti_cont.41197
bgti_else.41218:
	add	%v0, %zero, %v1
bgti_cont.41219:
	j	bgti_cont.41197
bgti_else.41216:
	add	%v0, %zero, %v1
bgti_cont.41217:
	j	bgti_cont.41197
bgti_else.41214:
	add	%v0, %zero, %v1
bgti_cont.41215:
	j	bgti_cont.41197
bgti_else.41212:
	add	%v0, %zero, %v1
bgti_cont.41213:
	j	bgti_cont.41197
bgti_else.41210:
	add	%v0, %zero, %v1
bgti_cont.41211:
	j	bgti_cont.41197
bgti_else.41208:
	add	%v0, %zero, %v1
bgti_cont.41209:
	j	bgti_cont.41197
bgti_else.41206:
	add	%v0, %zero, %v1
bgti_cont.41207:
	j	bgti_cont.41197
bgti_else.41204:
	add	%v0, %zero, %v1
bgti_cont.41205:
	j	bgti_cont.41197
bgti_else.41202:
	add	%v0, %zero, %v1
bgti_cont.41203:
	j	bgti_cont.41197
bgti_else.41200:
	add	%v0, %zero, %v1
bgti_cont.41201:
	j	bgti_cont.41197
bgti_else.41198:
	add	%v0, %zero, %v1
bgti_cont.41199:
	j	bgti_cont.41197
bgti_else.41196:
	add	%v0, %zero, %v1
bgti_cont.41197:
	lw	%v1, 28(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41220
	addi	%v0, %v0, 48
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bgt_cont.41221
bgt_else.41220:
	sw	%v0, 29(%sp)
	blti	%v1, 10, bgti_else.41222
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.41224
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41226
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41228
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	print_int_sub1.2629
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	bgti_cont.41223
bgti_else.41228:
	addi	%v0, %zero, 3
bgti_cont.41229:
	j	bgti_cont.41223
bgti_else.41226:
	addi	%v0, %zero, 2
bgti_cont.41227:
	j	bgti_cont.41223
bgti_else.41224:
	addi	%v0, %zero, 1
bgti_cont.41225:
	j	bgti_cont.41223
bgti_else.41222:
	addi	%v0, %zero, 0
bgti_cont.41223:
	lw	%v1, 28(%sp)
	sw	%v0, 30(%sp)
	blti	%v1, 10, bgti_else.41230
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41232
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41234
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41236
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41238
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41240
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41242
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41244
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41246
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41248
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41250
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41252
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	print_int_sub2.2632
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	bgti_cont.41231
bgti_else.41252:
	add	%v0, %zero, %v1
bgti_cont.41253:
	j	bgti_cont.41231
bgti_else.41250:
	add	%v0, %zero, %v1
bgti_cont.41251:
	j	bgti_cont.41231
bgti_else.41248:
	add	%v0, %zero, %v1
bgti_cont.41249:
	j	bgti_cont.41231
bgti_else.41246:
	add	%v0, %zero, %v1
bgti_cont.41247:
	j	bgti_cont.41231
bgti_else.41244:
	add	%v0, %zero, %v1
bgti_cont.41245:
	j	bgti_cont.41231
bgti_else.41242:
	add	%v0, %zero, %v1
bgti_cont.41243:
	j	bgti_cont.41231
bgti_else.41240:
	add	%v0, %zero, %v1
bgti_cont.41241:
	j	bgti_cont.41231
bgti_else.41238:
	add	%v0, %zero, %v1
bgti_cont.41239:
	j	bgti_cont.41231
bgti_else.41236:
	add	%v0, %zero, %v1
bgti_cont.41237:
	j	bgti_cont.41231
bgti_else.41234:
	add	%v0, %zero, %v1
bgti_cont.41235:
	j	bgti_cont.41231
bgti_else.41232:
	add	%v0, %zero, %v1
bgti_cont.41233:
	j	bgti_cont.41231
bgti_else.41230:
	add	%v0, %zero, %v1
bgti_cont.41231:
	lw	%v1, 30(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41254
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
	j	bgt_cont.41255
bgt_else.41254:
	sw	%v0, 31(%sp)
	blti	%v1, 10, bgti_else.41256
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41258
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41260
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41262
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41264
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41266
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41268
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41270
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41272
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41274
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41276
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41278
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	print_int_sub2.2632
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	j	bgti_cont.41257
bgti_else.41278:
	add	%v0, %zero, %v1
bgti_cont.41279:
	j	bgti_cont.41257
bgti_else.41276:
	add	%v0, %zero, %v1
bgti_cont.41277:
	j	bgti_cont.41257
bgti_else.41274:
	add	%v0, %zero, %v1
bgti_cont.41275:
	j	bgti_cont.41257
bgti_else.41272:
	add	%v0, %zero, %v1
bgti_cont.41273:
	j	bgti_cont.41257
bgti_else.41270:
	add	%v0, %zero, %v1
bgti_cont.41271:
	j	bgti_cont.41257
bgti_else.41268:
	add	%v0, %zero, %v1
bgti_cont.41269:
	j	bgti_cont.41257
bgti_else.41266:
	add	%v0, %zero, %v1
bgti_cont.41267:
	j	bgti_cont.41257
bgti_else.41264:
	add	%v0, %zero, %v1
bgti_cont.41265:
	j	bgti_cont.41257
bgti_else.41262:
	add	%v0, %zero, %v1
bgti_cont.41263:
	j	bgti_cont.41257
bgti_else.41260:
	add	%v0, %zero, %v1
bgti_cont.41261:
	j	bgti_cont.41257
bgti_else.41258:
	add	%v0, %zero, %v1
bgti_cont.41259:
	j	bgti_cont.41257
bgti_else.41256:
	add	%v0, %zero, %v1
bgti_cont.41257:
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
bgt_cont.41255:
bgt_cont.41221:
	lw	%v0, 15(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_print_char
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 7(%sp)
	blt	%v0, %v1, bgt_else.41280
	jr	%ra
bgt_else.41280:
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
	blt	%a2, %a3, bgt_else.41282
	addi	%v1, %zero, 0
	j	bgt_cont.41283
bgt_else.41282:
	lw	%a2, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.41284
	addi	%v1, %zero, 0
	j	bgt_cont.41285
bgt_else.41284:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.41286
	addi	%v1, %zero, 0
	j	bgt_cont.41287
bgt_else.41286:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.41288
	addi	%v1, %zero, 0
	j	bgt_cont.41289
bgt_else.41288:
	addi	%v1, %zero, 1
bgt_cont.41289:
bgt_cont.41287:
bgt_cont.41285:
bgt_cont.41283:
	sw	%v0, 32(%sp)
	beqi	%v1, 0, bnei_else.41290
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 2(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	j	bnei_cont.41291
bnei_else.41290:
	lw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
bnei_cont.41291:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.41292
	blti	%v0, 0, bgti_else.41294
	j	bgt_cont.41293
bgti_else.41294:
	addi	%v0, %zero, 0
bgti_cont.41295:
	j	bgt_cont.41293
bgt_else.41292:
	addi	%v0, %zero, 255
bgt_cont.41293:
	sw	%v0, 33(%sp)
	blti	%v0, 10, bgti_else.41296
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.41298
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41300
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	print_int_sub1.2629
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	bgti_cont.41297
bgti_else.41300:
	addi	%v0, %zero, 2
bgti_cont.41301:
	j	bgti_cont.41297
bgti_else.41298:
	addi	%v0, %zero, 1
bgti_cont.41299:
	j	bgti_cont.41297
bgti_else.41296:
	addi	%v0, %zero, 0
bgti_cont.41297:
	lw	%v1, 33(%sp)
	sw	%v0, 34(%sp)
	blti	%v1, 10, bgti_else.41302
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41304
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41306
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41308
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41310
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41312
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41314
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41316
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41318
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41320
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41322
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	print_int_sub2.2632
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	bgti_cont.41303
bgti_else.41322:
	add	%v0, %zero, %v1
bgti_cont.41323:
	j	bgti_cont.41303
bgti_else.41320:
	add	%v0, %zero, %v1
bgti_cont.41321:
	j	bgti_cont.41303
bgti_else.41318:
	add	%v0, %zero, %v1
bgti_cont.41319:
	j	bgti_cont.41303
bgti_else.41316:
	add	%v0, %zero, %v1
bgti_cont.41317:
	j	bgti_cont.41303
bgti_else.41314:
	add	%v0, %zero, %v1
bgti_cont.41315:
	j	bgti_cont.41303
bgti_else.41312:
	add	%v0, %zero, %v1
bgti_cont.41313:
	j	bgti_cont.41303
bgti_else.41310:
	add	%v0, %zero, %v1
bgti_cont.41311:
	j	bgti_cont.41303
bgti_else.41308:
	add	%v0, %zero, %v1
bgti_cont.41309:
	j	bgti_cont.41303
bgti_else.41306:
	add	%v0, %zero, %v1
bgti_cont.41307:
	j	bgti_cont.41303
bgti_else.41304:
	add	%v0, %zero, %v1
bgti_cont.41305:
	j	bgti_cont.41303
bgti_else.41302:
	add	%v0, %zero, %v1
bgti_cont.41303:
	lw	%v1, 34(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41324
	addi	%v0, %v0, 48
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	min_caml_print_char
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	bgt_cont.41325
bgt_else.41324:
	sw	%v0, 35(%sp)
	blti	%v1, 10, bgti_else.41326
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.41328
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41330
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	print_int_sub1.2629
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	j	bgti_cont.41327
bgti_else.41330:
	addi	%v0, %zero, 2
bgti_cont.41331:
	j	bgti_cont.41327
bgti_else.41328:
	addi	%v0, %zero, 1
bgti_cont.41329:
	j	bgti_cont.41327
bgti_else.41326:
	addi	%v0, %zero, 0
bgti_cont.41327:
	lw	%v1, 34(%sp)
	sw	%v0, 36(%sp)
	blti	%v1, 10, bgti_else.41332
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41334
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41336
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41338
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41340
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41342
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41344
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41346
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41348
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41350
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41352
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	print_int_sub2.2632
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	bgti_cont.41333
bgti_else.41352:
	add	%v0, %zero, %v1
bgti_cont.41353:
	j	bgti_cont.41333
bgti_else.41350:
	add	%v0, %zero, %v1
bgti_cont.41351:
	j	bgti_cont.41333
bgti_else.41348:
	add	%v0, %zero, %v1
bgti_cont.41349:
	j	bgti_cont.41333
bgti_else.41346:
	add	%v0, %zero, %v1
bgti_cont.41347:
	j	bgti_cont.41333
bgti_else.41344:
	add	%v0, %zero, %v1
bgti_cont.41345:
	j	bgti_cont.41333
bgti_else.41342:
	add	%v0, %zero, %v1
bgti_cont.41343:
	j	bgti_cont.41333
bgti_else.41340:
	add	%v0, %zero, %v1
bgti_cont.41341:
	j	bgti_cont.41333
bgti_else.41338:
	add	%v0, %zero, %v1
bgti_cont.41339:
	j	bgti_cont.41333
bgti_else.41336:
	add	%v0, %zero, %v1
bgti_cont.41337:
	j	bgti_cont.41333
bgti_else.41334:
	add	%v0, %zero, %v1
bgti_cont.41335:
	j	bgti_cont.41333
bgti_else.41332:
	add	%v0, %zero, %v1
bgti_cont.41333:
	lw	%v1, 36(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41354
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
	j	bgt_cont.41355
bgt_else.41354:
	sw	%v0, 37(%sp)
	blti	%v1, 10, bgti_else.41356
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41358
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41360
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41362
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41364
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41366
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41368
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41370
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41372
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41374
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41376
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	print_int_sub2.2632
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	j	bgti_cont.41357
bgti_else.41376:
	add	%v0, %zero, %v1
bgti_cont.41377:
	j	bgti_cont.41357
bgti_else.41374:
	add	%v0, %zero, %v1
bgti_cont.41375:
	j	bgti_cont.41357
bgti_else.41372:
	add	%v0, %zero, %v1
bgti_cont.41373:
	j	bgti_cont.41357
bgti_else.41370:
	add	%v0, %zero, %v1
bgti_cont.41371:
	j	bgti_cont.41357
bgti_else.41368:
	add	%v0, %zero, %v1
bgti_cont.41369:
	j	bgti_cont.41357
bgti_else.41366:
	add	%v0, %zero, %v1
bgti_cont.41367:
	j	bgti_cont.41357
bgti_else.41364:
	add	%v0, %zero, %v1
bgti_cont.41365:
	j	bgti_cont.41357
bgti_else.41362:
	add	%v0, %zero, %v1
bgti_cont.41363:
	j	bgti_cont.41357
bgti_else.41360:
	add	%v0, %zero, %v1
bgti_cont.41361:
	j	bgti_cont.41357
bgti_else.41358:
	add	%v0, %zero, %v1
bgti_cont.41359:
	j	bgti_cont.41357
bgti_else.41356:
	add	%v0, %zero, %v1
bgti_cont.41357:
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
bgt_cont.41355:
bgt_cont.41325:
	lw	%v0, 21(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_print_char
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.41378
	blti	%v0, 0, bgti_else.41380
	j	bgt_cont.41379
bgti_else.41380:
	addi	%v0, %zero, 0
bgti_cont.41381:
	j	bgt_cont.41379
bgt_else.41378:
	addi	%v0, %zero, 255
bgt_cont.41379:
	sw	%v0, 38(%sp)
	blti	%v0, 10, bgti_else.41382
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.41384
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41386
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	print_int_sub1.2629
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	j	bgti_cont.41383
bgti_else.41386:
	addi	%v0, %zero, 2
bgti_cont.41387:
	j	bgti_cont.41383
bgti_else.41384:
	addi	%v0, %zero, 1
bgti_cont.41385:
	j	bgti_cont.41383
bgti_else.41382:
	addi	%v0, %zero, 0
bgti_cont.41383:
	lw	%v1, 38(%sp)
	sw	%v0, 39(%sp)
	blti	%v1, 10, bgti_else.41388
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41390
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41392
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41394
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41396
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41398
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41400
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41402
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41404
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41406
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41408
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	print_int_sub2.2632
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	bgti_cont.41389
bgti_else.41408:
	add	%v0, %zero, %v1
bgti_cont.41409:
	j	bgti_cont.41389
bgti_else.41406:
	add	%v0, %zero, %v1
bgti_cont.41407:
	j	bgti_cont.41389
bgti_else.41404:
	add	%v0, %zero, %v1
bgti_cont.41405:
	j	bgti_cont.41389
bgti_else.41402:
	add	%v0, %zero, %v1
bgti_cont.41403:
	j	bgti_cont.41389
bgti_else.41400:
	add	%v0, %zero, %v1
bgti_cont.41401:
	j	bgti_cont.41389
bgti_else.41398:
	add	%v0, %zero, %v1
bgti_cont.41399:
	j	bgti_cont.41389
bgti_else.41396:
	add	%v0, %zero, %v1
bgti_cont.41397:
	j	bgti_cont.41389
bgti_else.41394:
	add	%v0, %zero, %v1
bgti_cont.41395:
	j	bgti_cont.41389
bgti_else.41392:
	add	%v0, %zero, %v1
bgti_cont.41393:
	j	bgti_cont.41389
bgti_else.41390:
	add	%v0, %zero, %v1
bgti_cont.41391:
	j	bgti_cont.41389
bgti_else.41388:
	add	%v0, %zero, %v1
bgti_cont.41389:
	lw	%v1, 39(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41410
	addi	%v0, %v0, 48
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_print_char
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	bgt_cont.41411
bgt_else.41410:
	sw	%v0, 40(%sp)
	blti	%v1, 10, bgti_else.41412
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.41414
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41416
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	print_int_sub1.2629
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	j	bgti_cont.41413
bgti_else.41416:
	addi	%v0, %zero, 2
bgti_cont.41417:
	j	bgti_cont.41413
bgti_else.41414:
	addi	%v0, %zero, 1
bgti_cont.41415:
	j	bgti_cont.41413
bgti_else.41412:
	addi	%v0, %zero, 0
bgti_cont.41413:
	lw	%v1, 39(%sp)
	sw	%v0, 41(%sp)
	blti	%v1, 10, bgti_else.41418
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41420
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41422
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41424
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41426
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41428
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41430
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41432
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41434
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41436
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41438
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	print_int_sub2.2632
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	bgti_cont.41419
bgti_else.41438:
	add	%v0, %zero, %v1
bgti_cont.41439:
	j	bgti_cont.41419
bgti_else.41436:
	add	%v0, %zero, %v1
bgti_cont.41437:
	j	bgti_cont.41419
bgti_else.41434:
	add	%v0, %zero, %v1
bgti_cont.41435:
	j	bgti_cont.41419
bgti_else.41432:
	add	%v0, %zero, %v1
bgti_cont.41433:
	j	bgti_cont.41419
bgti_else.41430:
	add	%v0, %zero, %v1
bgti_cont.41431:
	j	bgti_cont.41419
bgti_else.41428:
	add	%v0, %zero, %v1
bgti_cont.41429:
	j	bgti_cont.41419
bgti_else.41426:
	add	%v0, %zero, %v1
bgti_cont.41427:
	j	bgti_cont.41419
bgti_else.41424:
	add	%v0, %zero, %v1
bgti_cont.41425:
	j	bgti_cont.41419
bgti_else.41422:
	add	%v0, %zero, %v1
bgti_cont.41423:
	j	bgti_cont.41419
bgti_else.41420:
	add	%v0, %zero, %v1
bgti_cont.41421:
	j	bgti_cont.41419
bgti_else.41418:
	add	%v0, %zero, %v1
bgti_cont.41419:
	lw	%v1, 41(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41440
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
	j	bgt_cont.41441
bgt_else.41440:
	sw	%v0, 42(%sp)
	blti	%v1, 10, bgti_else.41442
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41444
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41446
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41448
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41450
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41452
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41454
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41456
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41458
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41460
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41462
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	print_int_sub2.2632
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	j	bgti_cont.41443
bgti_else.41462:
	add	%v0, %zero, %v1
bgti_cont.41463:
	j	bgti_cont.41443
bgti_else.41460:
	add	%v0, %zero, %v1
bgti_cont.41461:
	j	bgti_cont.41443
bgti_else.41458:
	add	%v0, %zero, %v1
bgti_cont.41459:
	j	bgti_cont.41443
bgti_else.41456:
	add	%v0, %zero, %v1
bgti_cont.41457:
	j	bgti_cont.41443
bgti_else.41454:
	add	%v0, %zero, %v1
bgti_cont.41455:
	j	bgti_cont.41443
bgti_else.41452:
	add	%v0, %zero, %v1
bgti_cont.41453:
	j	bgti_cont.41443
bgti_else.41450:
	add	%v0, %zero, %v1
bgti_cont.41451:
	j	bgti_cont.41443
bgti_else.41448:
	add	%v0, %zero, %v1
bgti_cont.41449:
	j	bgti_cont.41443
bgti_else.41446:
	add	%v0, %zero, %v1
bgti_cont.41447:
	j	bgti_cont.41443
bgti_else.41444:
	add	%v0, %zero, %v1
bgti_cont.41445:
	j	bgti_cont.41443
bgti_else.41442:
	add	%v0, %zero, %v1
bgti_cont.41443:
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
bgt_cont.41441:
bgt_cont.41411:
	lw	%v0, 21(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_print_char
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.41464
	blti	%v0, 0, bgti_else.41466
	j	bgt_cont.41465
bgti_else.41466:
	addi	%v0, %zero, 0
bgti_cont.41467:
	j	bgt_cont.41465
bgt_else.41464:
	addi	%v0, %zero, 255
bgt_cont.41465:
	sw	%v0, 43(%sp)
	blti	%v0, 10, bgti_else.41468
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.41470
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41472
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	print_int_sub1.2629
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	j	bgti_cont.41469
bgti_else.41472:
	addi	%v0, %zero, 2
bgti_cont.41473:
	j	bgti_cont.41469
bgti_else.41470:
	addi	%v0, %zero, 1
bgti_cont.41471:
	j	bgti_cont.41469
bgti_else.41468:
	addi	%v0, %zero, 0
bgti_cont.41469:
	lw	%v1, 43(%sp)
	sw	%v0, 44(%sp)
	blti	%v1, 10, bgti_else.41474
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41476
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41478
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41480
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41482
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41484
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41486
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41488
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41490
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41492
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41494
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	print_int_sub2.2632
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	j	bgti_cont.41475
bgti_else.41494:
	add	%v0, %zero, %v1
bgti_cont.41495:
	j	bgti_cont.41475
bgti_else.41492:
	add	%v0, %zero, %v1
bgti_cont.41493:
	j	bgti_cont.41475
bgti_else.41490:
	add	%v0, %zero, %v1
bgti_cont.41491:
	j	bgti_cont.41475
bgti_else.41488:
	add	%v0, %zero, %v1
bgti_cont.41489:
	j	bgti_cont.41475
bgti_else.41486:
	add	%v0, %zero, %v1
bgti_cont.41487:
	j	bgti_cont.41475
bgti_else.41484:
	add	%v0, %zero, %v1
bgti_cont.41485:
	j	bgti_cont.41475
bgti_else.41482:
	add	%v0, %zero, %v1
bgti_cont.41483:
	j	bgti_cont.41475
bgti_else.41480:
	add	%v0, %zero, %v1
bgti_cont.41481:
	j	bgti_cont.41475
bgti_else.41478:
	add	%v0, %zero, %v1
bgti_cont.41479:
	j	bgti_cont.41475
bgti_else.41476:
	add	%v0, %zero, %v1
bgti_cont.41477:
	j	bgti_cont.41475
bgti_else.41474:
	add	%v0, %zero, %v1
bgti_cont.41475:
	lw	%v1, 44(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41496
	addi	%v0, %v0, 48
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_print_char
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	j	bgt_cont.41497
bgt_else.41496:
	sw	%v0, 45(%sp)
	blti	%v1, 10, bgti_else.41498
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.41500
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.41502
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	print_int_sub1.2629
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	bgti_cont.41499
bgti_else.41502:
	addi	%v0, %zero, 2
bgti_cont.41503:
	j	bgti_cont.41499
bgti_else.41500:
	addi	%v0, %zero, 1
bgti_cont.41501:
	j	bgti_cont.41499
bgti_else.41498:
	addi	%v0, %zero, 0
bgti_cont.41499:
	lw	%v1, 44(%sp)
	sw	%v0, 46(%sp)
	blti	%v1, 10, bgti_else.41504
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41506
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41508
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41510
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41512
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41514
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41516
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41518
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41520
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41522
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41524
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	print_int_sub2.2632
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	j	bgti_cont.41505
bgti_else.41524:
	add	%v0, %zero, %v1
bgti_cont.41525:
	j	bgti_cont.41505
bgti_else.41522:
	add	%v0, %zero, %v1
bgti_cont.41523:
	j	bgti_cont.41505
bgti_else.41520:
	add	%v0, %zero, %v1
bgti_cont.41521:
	j	bgti_cont.41505
bgti_else.41518:
	add	%v0, %zero, %v1
bgti_cont.41519:
	j	bgti_cont.41505
bgti_else.41516:
	add	%v0, %zero, %v1
bgti_cont.41517:
	j	bgti_cont.41505
bgti_else.41514:
	add	%v0, %zero, %v1
bgti_cont.41515:
	j	bgti_cont.41505
bgti_else.41512:
	add	%v0, %zero, %v1
bgti_cont.41513:
	j	bgti_cont.41505
bgti_else.41510:
	add	%v0, %zero, %v1
bgti_cont.41511:
	j	bgti_cont.41505
bgti_else.41508:
	add	%v0, %zero, %v1
bgti_cont.41509:
	j	bgti_cont.41505
bgti_else.41506:
	add	%v0, %zero, %v1
bgti_cont.41507:
	j	bgti_cont.41505
bgti_else.41504:
	add	%v0, %zero, %v1
bgti_cont.41505:
	lw	%v1, 46(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.41526
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
	j	bgt_cont.41527
bgt_else.41526:
	sw	%v0, 47(%sp)
	blti	%v1, 10, bgti_else.41528
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41530
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41532
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41534
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41536
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41538
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41540
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41542
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41544
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41546
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.41548
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	print_int_sub2.2632
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	bgti_cont.41529
bgti_else.41548:
	add	%v0, %zero, %v1
bgti_cont.41549:
	j	bgti_cont.41529
bgti_else.41546:
	add	%v0, %zero, %v1
bgti_cont.41547:
	j	bgti_cont.41529
bgti_else.41544:
	add	%v0, %zero, %v1
bgti_cont.41545:
	j	bgti_cont.41529
bgti_else.41542:
	add	%v0, %zero, %v1
bgti_cont.41543:
	j	bgti_cont.41529
bgti_else.41540:
	add	%v0, %zero, %v1
bgti_cont.41541:
	j	bgti_cont.41529
bgti_else.41538:
	add	%v0, %zero, %v1
bgti_cont.41539:
	j	bgti_cont.41529
bgti_else.41536:
	add	%v0, %zero, %v1
bgti_cont.41537:
	j	bgti_cont.41529
bgti_else.41534:
	add	%v0, %zero, %v1
bgti_cont.41535:
	j	bgti_cont.41529
bgti_else.41532:
	add	%v0, %zero, %v1
bgti_cont.41533:
	j	bgti_cont.41529
bgti_else.41530:
	add	%v0, %zero, %v1
bgti_cont.41531:
	j	bgti_cont.41529
bgti_else.41528:
	add	%v0, %zero, %v1
bgti_cont.41529:
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
bgt_cont.41527:
bgt_cont.41497:
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
	blt	%v0, %t0, bgt_else.42114
	jr	%ra
bgt_else.42114:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.42116
	j	bgt_cont.42117
bgt_else.42116:
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
bgt_cont.42117:
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.42118
	j	bgt_cont.42119
bgt_else.42118:
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
	blt	%a3, %t0, bgt_else.42120
	addi	%a3, %zero, 0
	j	bgt_cont.42121
bgt_else.42120:
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.42122
	addi	%a3, %zero, 0
	j	bgt_cont.42123
bgt_else.42122:
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.42124
	addi	%a3, %zero, 0
	j	bgt_cont.42125
bgt_else.42124:
	addi	%a3, %zero, 0
bgt_cont.42125:
bgt_cont.42123:
bgt_cont.42121:
	beqi	%a3, 0, bnei_else.42126
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
	j	bnei_cont.42127
bnei_else.42126:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.42127:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.42128
	blti	%v0, 0, bgti_else.42130
	j	bgt_cont.42129
bgti_else.42130:
	addi	%v0, %zero, 0
bgti_cont.42131:
	j	bgt_cont.42129
bgt_else.42128:
	addi	%v0, %zero, 255
bgt_cont.42129:
	addi	%v1, %zero, 10
	sw	%v1, 10(%sp)
	sw	%v0, 11(%sp)
	blti	%v0, 10, bgti_else.42132
	addi	%a0, %v0, -10
	blti	%a0, 10, bgti_else.42134
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.42136
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	print_int_sub1.2629
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.42133
bgti_else.42136:
	addi	%v0, %zero, 2
bgti_cont.42137:
	j	bgti_cont.42133
bgti_else.42134:
	addi	%v0, %zero, 1
bgti_cont.42135:
	j	bgti_cont.42133
bgti_else.42132:
	addi	%v0, %zero, 0
bgti_cont.42133:
	lw	%v1, 11(%sp)
	sw	%v0, 12(%sp)
	blti	%v1, 10, bgti_else.42138
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42140
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42142
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42144
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42146
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42148
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42150
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42152
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42154
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42156
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42158
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.42139
bgti_else.42158:
	add	%v0, %zero, %v1
bgti_cont.42159:
	j	bgti_cont.42139
bgti_else.42156:
	add	%v0, %zero, %v1
bgti_cont.42157:
	j	bgti_cont.42139
bgti_else.42154:
	add	%v0, %zero, %v1
bgti_cont.42155:
	j	bgti_cont.42139
bgti_else.42152:
	add	%v0, %zero, %v1
bgti_cont.42153:
	j	bgti_cont.42139
bgti_else.42150:
	add	%v0, %zero, %v1
bgti_cont.42151:
	j	bgti_cont.42139
bgti_else.42148:
	add	%v0, %zero, %v1
bgti_cont.42149:
	j	bgti_cont.42139
bgti_else.42146:
	add	%v0, %zero, %v1
bgti_cont.42147:
	j	bgti_cont.42139
bgti_else.42144:
	add	%v0, %zero, %v1
bgti_cont.42145:
	j	bgti_cont.42139
bgti_else.42142:
	add	%v0, %zero, %v1
bgti_cont.42143:
	j	bgti_cont.42139
bgti_else.42140:
	add	%v0, %zero, %v1
bgti_cont.42141:
	j	bgti_cont.42139
bgti_else.42138:
	add	%v0, %zero, %v1
bgti_cont.42139:
	lw	%v1, 12(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.42160
	addi	%v0, %v0, 48
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgt_cont.42161
bgt_else.42160:
	sw	%v0, 13(%sp)
	blti	%v1, 10, bgti_else.42162
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.42164
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.42166
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	print_int_sub1.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.42163
bgti_else.42166:
	addi	%v0, %zero, 2
bgti_cont.42167:
	j	bgti_cont.42163
bgti_else.42164:
	addi	%v0, %zero, 1
bgti_cont.42165:
	j	bgti_cont.42163
bgti_else.42162:
	addi	%v0, %zero, 0
bgti_cont.42163:
	lw	%v1, 12(%sp)
	sw	%v0, 14(%sp)
	blti	%v1, 10, bgti_else.42168
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42170
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42172
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42174
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42176
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42178
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42180
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42182
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42184
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42186
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42188
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub2.2632
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.42169
bgti_else.42188:
	add	%v0, %zero, %v1
bgti_cont.42189:
	j	bgti_cont.42169
bgti_else.42186:
	add	%v0, %zero, %v1
bgti_cont.42187:
	j	bgti_cont.42169
bgti_else.42184:
	add	%v0, %zero, %v1
bgti_cont.42185:
	j	bgti_cont.42169
bgti_else.42182:
	add	%v0, %zero, %v1
bgti_cont.42183:
	j	bgti_cont.42169
bgti_else.42180:
	add	%v0, %zero, %v1
bgti_cont.42181:
	j	bgti_cont.42169
bgti_else.42178:
	add	%v0, %zero, %v1
bgti_cont.42179:
	j	bgti_cont.42169
bgti_else.42176:
	add	%v0, %zero, %v1
bgti_cont.42177:
	j	bgti_cont.42169
bgti_else.42174:
	add	%v0, %zero, %v1
bgti_cont.42175:
	j	bgti_cont.42169
bgti_else.42172:
	add	%v0, %zero, %v1
bgti_cont.42173:
	j	bgti_cont.42169
bgti_else.42170:
	add	%v0, %zero, %v1
bgti_cont.42171:
	j	bgti_cont.42169
bgti_else.42168:
	add	%v0, %zero, %v1
bgti_cont.42169:
	lw	%v1, 14(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.42190
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
	j	bgt_cont.42191
bgt_else.42190:
	sw	%v0, 15(%sp)
	blti	%v1, 10, bgti_else.42192
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42194
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42196
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42198
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42200
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42202
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42204
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42206
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42208
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42210
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42212
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	print_int_sub2.2632
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgti_cont.42193
bgti_else.42212:
	add	%v0, %zero, %v1
bgti_cont.42213:
	j	bgti_cont.42193
bgti_else.42210:
	add	%v0, %zero, %v1
bgti_cont.42211:
	j	bgti_cont.42193
bgti_else.42208:
	add	%v0, %zero, %v1
bgti_cont.42209:
	j	bgti_cont.42193
bgti_else.42206:
	add	%v0, %zero, %v1
bgti_cont.42207:
	j	bgti_cont.42193
bgti_else.42204:
	add	%v0, %zero, %v1
bgti_cont.42205:
	j	bgti_cont.42193
bgti_else.42202:
	add	%v0, %zero, %v1
bgti_cont.42203:
	j	bgti_cont.42193
bgti_else.42200:
	add	%v0, %zero, %v1
bgti_cont.42201:
	j	bgti_cont.42193
bgti_else.42198:
	add	%v0, %zero, %v1
bgti_cont.42199:
	j	bgti_cont.42193
bgti_else.42196:
	add	%v0, %zero, %v1
bgti_cont.42197:
	j	bgti_cont.42193
bgti_else.42194:
	add	%v0, %zero, %v1
bgti_cont.42195:
	j	bgti_cont.42193
bgti_else.42192:
	add	%v0, %zero, %v1
bgti_cont.42193:
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
bgt_cont.42191:
bgt_cont.42161:
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
	blt	%at, %v0, bgt_else.42214
	blti	%v0, 0, bgti_else.42216
	j	bgt_cont.42215
bgti_else.42216:
	addi	%v0, %zero, 0
bgti_cont.42217:
	j	bgt_cont.42215
bgt_else.42214:
	addi	%v0, %zero, 255
bgt_cont.42215:
	sw	%v0, 17(%sp)
	blti	%v0, 10, bgti_else.42218
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.42220
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42222
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	print_int_sub1.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.42219
bgti_else.42222:
	addi	%v0, %zero, 2
bgti_cont.42223:
	j	bgti_cont.42219
bgti_else.42220:
	addi	%v0, %zero, 1
bgti_cont.42221:
	j	bgti_cont.42219
bgti_else.42218:
	addi	%v0, %zero, 0
bgti_cont.42219:
	lw	%v1, 17(%sp)
	sw	%v0, 18(%sp)
	blti	%v1, 10, bgti_else.42224
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42226
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42228
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42230
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42232
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42234
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42236
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42238
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42240
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42242
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42244
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub2.2632
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgti_cont.42225
bgti_else.42244:
	add	%v0, %zero, %v1
bgti_cont.42245:
	j	bgti_cont.42225
bgti_else.42242:
	add	%v0, %zero, %v1
bgti_cont.42243:
	j	bgti_cont.42225
bgti_else.42240:
	add	%v0, %zero, %v1
bgti_cont.42241:
	j	bgti_cont.42225
bgti_else.42238:
	add	%v0, %zero, %v1
bgti_cont.42239:
	j	bgti_cont.42225
bgti_else.42236:
	add	%v0, %zero, %v1
bgti_cont.42237:
	j	bgti_cont.42225
bgti_else.42234:
	add	%v0, %zero, %v1
bgti_cont.42235:
	j	bgti_cont.42225
bgti_else.42232:
	add	%v0, %zero, %v1
bgti_cont.42233:
	j	bgti_cont.42225
bgti_else.42230:
	add	%v0, %zero, %v1
bgti_cont.42231:
	j	bgti_cont.42225
bgti_else.42228:
	add	%v0, %zero, %v1
bgti_cont.42229:
	j	bgti_cont.42225
bgti_else.42226:
	add	%v0, %zero, %v1
bgti_cont.42227:
	j	bgti_cont.42225
bgti_else.42224:
	add	%v0, %zero, %v1
bgti_cont.42225:
	lw	%v1, 18(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.42246
	addi	%v0, %v0, 48
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_print_char
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgt_cont.42247
bgt_else.42246:
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.42248
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.42250
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.42252
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub1.2629
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.42249
bgti_else.42252:
	addi	%v0, %zero, 2
bgti_cont.42253:
	j	bgti_cont.42249
bgti_else.42250:
	addi	%v0, %zero, 1
bgti_cont.42251:
	j	bgti_cont.42249
bgti_else.42248:
	addi	%v0, %zero, 0
bgti_cont.42249:
	lw	%v1, 18(%sp)
	sw	%v0, 20(%sp)
	blti	%v1, 10, bgti_else.42254
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42256
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42258
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42260
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42262
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42264
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42266
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42268
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42270
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42272
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42274
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	print_int_sub2.2632
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bgti_cont.42255
bgti_else.42274:
	add	%v0, %zero, %v1
bgti_cont.42275:
	j	bgti_cont.42255
bgti_else.42272:
	add	%v0, %zero, %v1
bgti_cont.42273:
	j	bgti_cont.42255
bgti_else.42270:
	add	%v0, %zero, %v1
bgti_cont.42271:
	j	bgti_cont.42255
bgti_else.42268:
	add	%v0, %zero, %v1
bgti_cont.42269:
	j	bgti_cont.42255
bgti_else.42266:
	add	%v0, %zero, %v1
bgti_cont.42267:
	j	bgti_cont.42255
bgti_else.42264:
	add	%v0, %zero, %v1
bgti_cont.42265:
	j	bgti_cont.42255
bgti_else.42262:
	add	%v0, %zero, %v1
bgti_cont.42263:
	j	bgti_cont.42255
bgti_else.42260:
	add	%v0, %zero, %v1
bgti_cont.42261:
	j	bgti_cont.42255
bgti_else.42258:
	add	%v0, %zero, %v1
bgti_cont.42259:
	j	bgti_cont.42255
bgti_else.42256:
	add	%v0, %zero, %v1
bgti_cont.42257:
	j	bgti_cont.42255
bgti_else.42254:
	add	%v0, %zero, %v1
bgti_cont.42255:
	lw	%v1, 20(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.42276
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
	j	bgt_cont.42277
bgt_else.42276:
	sw	%v0, 21(%sp)
	blti	%v1, 10, bgti_else.42278
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42280
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42282
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42284
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42286
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42288
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42290
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42292
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42294
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42296
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42298
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	print_int_sub2.2632
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.42279
bgti_else.42298:
	add	%v0, %zero, %v1
bgti_cont.42299:
	j	bgti_cont.42279
bgti_else.42296:
	add	%v0, %zero, %v1
bgti_cont.42297:
	j	bgti_cont.42279
bgti_else.42294:
	add	%v0, %zero, %v1
bgti_cont.42295:
	j	bgti_cont.42279
bgti_else.42292:
	add	%v0, %zero, %v1
bgti_cont.42293:
	j	bgti_cont.42279
bgti_else.42290:
	add	%v0, %zero, %v1
bgti_cont.42291:
	j	bgti_cont.42279
bgti_else.42288:
	add	%v0, %zero, %v1
bgti_cont.42289:
	j	bgti_cont.42279
bgti_else.42286:
	add	%v0, %zero, %v1
bgti_cont.42287:
	j	bgti_cont.42279
bgti_else.42284:
	add	%v0, %zero, %v1
bgti_cont.42285:
	j	bgti_cont.42279
bgti_else.42282:
	add	%v0, %zero, %v1
bgti_cont.42283:
	j	bgti_cont.42279
bgti_else.42280:
	add	%v0, %zero, %v1
bgti_cont.42281:
	j	bgti_cont.42279
bgti_else.42278:
	add	%v0, %zero, %v1
bgti_cont.42279:
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
bgt_cont.42277:
bgt_cont.42247:
	lw	%v0, 16(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.42300
	blti	%v0, 0, bgti_else.42302
	j	bgt_cont.42301
bgti_else.42302:
	addi	%v0, %zero, 0
bgti_cont.42303:
	j	bgt_cont.42301
bgt_else.42300:
	addi	%v0, %zero, 255
bgt_cont.42301:
	sw	%v0, 22(%sp)
	blti	%v0, 10, bgti_else.42304
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.42306
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42308
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub1.2629
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.42305
bgti_else.42308:
	addi	%v0, %zero, 2
bgti_cont.42309:
	j	bgti_cont.42305
bgti_else.42306:
	addi	%v0, %zero, 1
bgti_cont.42307:
	j	bgti_cont.42305
bgti_else.42304:
	addi	%v0, %zero, 0
bgti_cont.42305:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	blti	%v1, 10, bgti_else.42310
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42312
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42314
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42316
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42318
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42320
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42322
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42324
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42326
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42328
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42330
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub2.2632
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgti_cont.42311
bgti_else.42330:
	add	%v0, %zero, %v1
bgti_cont.42331:
	j	bgti_cont.42311
bgti_else.42328:
	add	%v0, %zero, %v1
bgti_cont.42329:
	j	bgti_cont.42311
bgti_else.42326:
	add	%v0, %zero, %v1
bgti_cont.42327:
	j	bgti_cont.42311
bgti_else.42324:
	add	%v0, %zero, %v1
bgti_cont.42325:
	j	bgti_cont.42311
bgti_else.42322:
	add	%v0, %zero, %v1
bgti_cont.42323:
	j	bgti_cont.42311
bgti_else.42320:
	add	%v0, %zero, %v1
bgti_cont.42321:
	j	bgti_cont.42311
bgti_else.42318:
	add	%v0, %zero, %v1
bgti_cont.42319:
	j	bgti_cont.42311
bgti_else.42316:
	add	%v0, %zero, %v1
bgti_cont.42317:
	j	bgti_cont.42311
bgti_else.42314:
	add	%v0, %zero, %v1
bgti_cont.42315:
	j	bgti_cont.42311
bgti_else.42312:
	add	%v0, %zero, %v1
bgti_cont.42313:
	j	bgti_cont.42311
bgti_else.42310:
	add	%v0, %zero, %v1
bgti_cont.42311:
	lw	%v1, 23(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.42332
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_print_char
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgt_cont.42333
bgt_else.42332:
	sw	%v0, 24(%sp)
	blti	%v1, 10, bgti_else.42334
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.42336
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.42338
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub1.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgti_cont.42335
bgti_else.42338:
	addi	%v0, %zero, 2
bgti_cont.42339:
	j	bgti_cont.42335
bgti_else.42336:
	addi	%v0, %zero, 1
bgti_cont.42337:
	j	bgti_cont.42335
bgti_else.42334:
	addi	%v0, %zero, 0
bgti_cont.42335:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	blti	%v1, 10, bgti_else.42340
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42342
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42344
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42346
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42348
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42350
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42352
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42354
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42356
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42358
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42360
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	print_int_sub2.2632
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.42341
bgti_else.42360:
	add	%v0, %zero, %v1
bgti_cont.42361:
	j	bgti_cont.42341
bgti_else.42358:
	add	%v0, %zero, %v1
bgti_cont.42359:
	j	bgti_cont.42341
bgti_else.42356:
	add	%v0, %zero, %v1
bgti_cont.42357:
	j	bgti_cont.42341
bgti_else.42354:
	add	%v0, %zero, %v1
bgti_cont.42355:
	j	bgti_cont.42341
bgti_else.42352:
	add	%v0, %zero, %v1
bgti_cont.42353:
	j	bgti_cont.42341
bgti_else.42350:
	add	%v0, %zero, %v1
bgti_cont.42351:
	j	bgti_cont.42341
bgti_else.42348:
	add	%v0, %zero, %v1
bgti_cont.42349:
	j	bgti_cont.42341
bgti_else.42346:
	add	%v0, %zero, %v1
bgti_cont.42347:
	j	bgti_cont.42341
bgti_else.42344:
	add	%v0, %zero, %v1
bgti_cont.42345:
	j	bgti_cont.42341
bgti_else.42342:
	add	%v0, %zero, %v1
bgti_cont.42343:
	j	bgti_cont.42341
bgti_else.42340:
	add	%v0, %zero, %v1
bgti_cont.42341:
	lw	%v1, 25(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.42362
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
	j	bgt_cont.42363
bgt_else.42362:
	sw	%v0, 26(%sp)
	blti	%v1, 10, bgti_else.42364
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42366
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42368
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42370
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42372
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42374
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42376
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42378
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42380
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42382
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.42384
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2632
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.42365
bgti_else.42384:
	add	%v0, %zero, %v1
bgti_cont.42385:
	j	bgti_cont.42365
bgti_else.42382:
	add	%v0, %zero, %v1
bgti_cont.42383:
	j	bgti_cont.42365
bgti_else.42380:
	add	%v0, %zero, %v1
bgti_cont.42381:
	j	bgti_cont.42365
bgti_else.42378:
	add	%v0, %zero, %v1
bgti_cont.42379:
	j	bgti_cont.42365
bgti_else.42376:
	add	%v0, %zero, %v1
bgti_cont.42377:
	j	bgti_cont.42365
bgti_else.42374:
	add	%v0, %zero, %v1
bgti_cont.42375:
	j	bgti_cont.42365
bgti_else.42372:
	add	%v0, %zero, %v1
bgti_cont.42373:
	j	bgti_cont.42365
bgti_else.42370:
	add	%v0, %zero, %v1
bgti_cont.42371:
	j	bgti_cont.42365
bgti_else.42368:
	add	%v0, %zero, %v1
bgti_cont.42369:
	j	bgti_cont.42365
bgti_else.42366:
	add	%v0, %zero, %v1
bgti_cont.42367:
	j	bgti_cont.42365
bgti_else.42364:
	add	%v0, %zero, %v1
bgti_cont.42365:
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
bgt_cont.42363:
bgt_cont.42333:
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
bgt_cont.42119:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.42386
	addi	%a0, %v0, -5
	j	bgti_cont.42387
bgti_else.42386:
	add	%a0, %zero, %v0
bgti_cont.42387:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.42388
	jr	%ra
bgt_else.42388:
	lw	%v0, 0(%sp)
	sw	%a0, 27(%sp)
	sw	%v1, 28(%sp)
	blt	%v1, %v0, bgt_else.42390
	j	bgt_cont.42391
bgt_else.42390:
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
bgt_cont.42391:
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
	blti	%v1, 5, bgti_else.42392
	addi	%a2, %v1, -5
	j	bgti_cont.42393
bgti_else.42392:
	add	%a2, %zero, %v1
bgti_cont.42393:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	j	scan_line.3051
init_line_elements.3061:
	addi	%a0, %zero, 0
	blti	%v1, 0, bgti_else.42699
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
	blti	%v0, 0, bgti_else.42700
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
	blti	%v0, 0, bgti_else.42701
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
	blti	%v0, 0, bgti_else.42702
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
bgti_else.42702:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.42701:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.42700:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.42699:
	jr	%ra
calc_dirvec.3071:
	blti	%v0, 5, bgti_else.43949
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
bgti_else.43949:
	fmul	%f0, %f1, %f1
	flw	%f1, 441(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 474(%zero)
	fdiv	%f5, %f4, %f0
	flw	%f6, 470(%zero)
	fblt	%f5, %f6, fbgt_else.43951
	addi	%a1, %zero, 1
	j	fbgt_cont.43952
fbgt_else.43951:
	addi	%a1, %zero, 0
fbgt_cont.43952:
	fabs	%f7, %f5
	flw	%f8, 462(%zero)
	fblt	%f7, %f8, fbgt_else.43953
	flw	%f5, 455(%zero)
	fblt	%f7, %f5, fbgt_else.43955
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
	j	fbgt_cont.43956
fbgt_else.43955:
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
fbgt_cont.43956:
	beqi	%a1, 0, bnei_else.43957
	j	fbgt_cont.43954
bnei_else.43957:
	fneg	%f5, %f5
bnei_cont.43958:
	j	fbgt_cont.43954
fbgt_else.43953:
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
fbgt_cont.43954:
	fmul	%f5, %f5, %f2
	flw	%f7, 494(%zero)
	fblt	%f5, %f6, fbgt_else.43959
	addi	%a1, %zero, 1
	j	fbgt_cont.43960
fbgt_else.43959:
	addi	%a1, %zero, 0
fbgt_cont.43960:
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
	fblt	%f9, %f10, fbgt_else.43961
	flw	%f11, 492(%zero)
	fblt	%f9, %f11, fbgt_else.43963
	flw	%f11, 491(%zero)
	fblt	%f9, %f11, fbgt_else.43965
	flw	%f11, 490(%zero)
	fblt	%f9, %f11, fbgt_else.43967
	flw	%f11, 489(%zero)
	fblt	%f9, %f11, fbgt_else.43969
	flw	%f11, 488(%zero)
	fblt	%f9, %f11, fbgt_else.43971
	flw	%f11, 487(%zero)
	fblt	%f9, %f11, fbgt_else.43973
	flw	%f11, 486(%zero)
	fblt	%f9, %f11, fbgt_else.43975
	flw	%f11, 485(%zero)
	fblt	%f9, %f11, fbgt_else.43977
	flw	%f11, 484(%zero)
	fblt	%f9, %f11, fbgt_else.43979
	flw	%f11, 483(%zero)
	fblt	%f9, %f11, fbgt_else.43981
	flw	%f11, 482(%zero)
	fmov	%f1, %f11
	fmov	%f0, %f9
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.43962
fbgt_else.43981:
	fmov	%f0, %f11
fbgt_cont.43982:
	j	fbgt_cont.43962
fbgt_else.43979:
	fmov	%f0, %f11
fbgt_cont.43980:
	j	fbgt_cont.43962
fbgt_else.43977:
	fmov	%f0, %f11
fbgt_cont.43978:
	j	fbgt_cont.43962
fbgt_else.43975:
	fmov	%f0, %f11
fbgt_cont.43976:
	j	fbgt_cont.43962
fbgt_else.43973:
	fmov	%f0, %f11
fbgt_cont.43974:
	j	fbgt_cont.43962
fbgt_else.43971:
	fmov	%f0, %f11
fbgt_cont.43972:
	j	fbgt_cont.43962
fbgt_else.43969:
	fmov	%f0, %f11
fbgt_cont.43970:
	j	fbgt_cont.43962
fbgt_else.43967:
	fmov	%f0, %f11
fbgt_cont.43968:
	j	fbgt_cont.43962
fbgt_else.43965:
	fmov	%f0, %f11
fbgt_cont.43966:
	j	fbgt_cont.43962
fbgt_else.43963:
	fmov	%f0, %f11
fbgt_cont.43964:
	j	fbgt_cont.43962
fbgt_else.43961:
	fmov	%f0, %f10
fbgt_cont.43962:
	flw	%f1, 13(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.43983
	fblt	%f1, %f0, fbgt_else.43985
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43987
	fblt	%f1, %f0, fbgt_else.43989
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43991
	fblt	%f1, %f0, fbgt_else.43993
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.43984
fbgt_else.43993:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.43994:
	j	fbgt_cont.43984
fbgt_else.43991:
	fmov	%f0, %f1
fbgt_cont.43992:
	j	fbgt_cont.43984
fbgt_else.43989:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43995
	fblt	%f1, %f0, fbgt_else.43997
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.43996
fbgt_else.43997:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.43998:
	j	fbgt_cont.43996
fbgt_else.43995:
	fmov	%f0, %f1
fbgt_cont.43996:
fbgt_cont.43990:
	j	fbgt_cont.43984
fbgt_else.43987:
	fmov	%f0, %f1
fbgt_cont.43988:
	j	fbgt_cont.43984
fbgt_else.43985:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.43999
	fblt	%f1, %f0, fbgt_else.44001
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44003
	fblt	%f1, %f0, fbgt_else.44005
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.44000
fbgt_else.44005:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.44006:
	j	fbgt_cont.44000
fbgt_else.44003:
	fmov	%f0, %f1
fbgt_cont.44004:
	j	fbgt_cont.44000
fbgt_else.44001:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44007
	fblt	%f1, %f0, fbgt_else.44009
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.44008
fbgt_else.44009:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.44010:
	j	fbgt_cont.44008
fbgt_else.44007:
	fmov	%f0, %f1
fbgt_cont.44008:
fbgt_cont.44002:
	j	fbgt_cont.44000
fbgt_else.43999:
	fmov	%f0, %f1
fbgt_cont.44000:
fbgt_cont.43986:
	j	fbgt_cont.43984
fbgt_else.43983:
	fmov	%f0, %f1
fbgt_cont.43984:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.44011
	lw	%v0, 11(%sp)
	beqi	%v0, 0, bnei_else.44013
	addi	%v0, %zero, 0
	j	fbgt_cont.44012
bnei_else.44013:
	addi	%v0, %zero, 1
bnei_cont.44014:
	j	fbgt_cont.44012
fbgt_else.44011:
	lw	%v0, 11(%sp)
fbgt_cont.44012:
	fblt	%f0, %f1, fbgt_else.44015
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44016
fbgt_else.44015:
fbgt_cont.44016:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.44017
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44018
fbgt_else.44017:
fbgt_cont.44018:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.44019
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
	j	fbgt_cont.44020
fbgt_else.44019:
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
fbgt_cont.44020:
	beqi	%v0, 0, bnei_else.44021
	j	bnei_cont.44022
bnei_else.44021:
	fneg	%f0, %f0
bnei_cont.44022:
	flw	%f4, 9(%sp)
	fabs	%f4, %f4
	flw	%f5, 14(%sp)
	fsw	%f0, 15(%sp)
	fsw	%f3, 16(%sp)
	fsw	%f2, 17(%sp)
	fsw	%f4, 18(%sp)
	fblt	%f4, %f5, fbgt_else.44023
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.44025
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.44027
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.44029
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.44031
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.44033
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.44035
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.44037
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.44039
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.44041
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.44043
	flw	%f6, 482(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.44024
fbgt_else.44043:
	fmov	%f0, %f6
fbgt_cont.44044:
	j	fbgt_cont.44024
fbgt_else.44041:
	fmov	%f0, %f6
fbgt_cont.44042:
	j	fbgt_cont.44024
fbgt_else.44039:
	fmov	%f0, %f6
fbgt_cont.44040:
	j	fbgt_cont.44024
fbgt_else.44037:
	fmov	%f0, %f6
fbgt_cont.44038:
	j	fbgt_cont.44024
fbgt_else.44035:
	fmov	%f0, %f6
fbgt_cont.44036:
	j	fbgt_cont.44024
fbgt_else.44033:
	fmov	%f0, %f6
fbgt_cont.44034:
	j	fbgt_cont.44024
fbgt_else.44031:
	fmov	%f0, %f6
fbgt_cont.44032:
	j	fbgt_cont.44024
fbgt_else.44029:
	fmov	%f0, %f6
fbgt_cont.44030:
	j	fbgt_cont.44024
fbgt_else.44027:
	fmov	%f0, %f6
fbgt_cont.44028:
	j	fbgt_cont.44024
fbgt_else.44025:
	fmov	%f0, %f6
fbgt_cont.44026:
	j	fbgt_cont.44024
fbgt_else.44023:
	fmov	%f0, %f5
fbgt_cont.44024:
	flw	%f1, 18(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.44045
	fblt	%f1, %f0, fbgt_else.44047
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44049
	fblt	%f1, %f0, fbgt_else.44051
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44053
	fblt	%f1, %f0, fbgt_else.44055
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.44046
fbgt_else.44055:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.44056:
	j	fbgt_cont.44046
fbgt_else.44053:
	fmov	%f0, %f1
fbgt_cont.44054:
	j	fbgt_cont.44046
fbgt_else.44051:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44057
	fblt	%f1, %f0, fbgt_else.44059
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.44058
fbgt_else.44059:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.44060:
	j	fbgt_cont.44058
fbgt_else.44057:
	fmov	%f0, %f1
fbgt_cont.44058:
fbgt_cont.44052:
	j	fbgt_cont.44046
fbgt_else.44049:
	fmov	%f0, %f1
fbgt_cont.44050:
	j	fbgt_cont.44046
fbgt_else.44047:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44061
	fblt	%f1, %f0, fbgt_else.44063
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44065
	fblt	%f1, %f0, fbgt_else.44067
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.44062
fbgt_else.44067:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.44068:
	j	fbgt_cont.44062
fbgt_else.44065:
	fmov	%f0, %f1
fbgt_cont.44066:
	j	fbgt_cont.44062
fbgt_else.44063:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44069
	fblt	%f1, %f0, fbgt_else.44071
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.44070
fbgt_else.44071:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.44072:
	j	fbgt_cont.44070
fbgt_else.44069:
	fmov	%f0, %f1
fbgt_cont.44070:
fbgt_cont.44064:
	j	fbgt_cont.44062
fbgt_else.44061:
	fmov	%f0, %f1
fbgt_cont.44062:
fbgt_cont.44048:
	j	fbgt_cont.44046
fbgt_else.44045:
	fmov	%f0, %f1
fbgt_cont.44046:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.44073
	addi	%v0, %zero, 0
	j	fbgt_cont.44074
fbgt_else.44073:
	addi	%v0, %zero, 1
fbgt_cont.44074:
	fblt	%f0, %f1, fbgt_else.44075
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44076
fbgt_else.44075:
fbgt_cont.44076:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.44077
	beqi	%v0, 0, bnei_else.44079
	addi	%v0, %zero, 0
	j	fbgt_cont.44078
bnei_else.44079:
	addi	%v0, %zero, 1
bnei_cont.44080:
	j	fbgt_cont.44078
fbgt_else.44077:
fbgt_cont.44078:
	fblt	%f0, %f2, fbgt_else.44081
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44082
fbgt_else.44081:
fbgt_cont.44082:
	flw	%f3, 16(%sp)
	fblt	%f3, %f0, fbgt_else.44083
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
	j	fbgt_cont.44084
fbgt_else.44083:
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
fbgt_cont.44084:
	beqi	%v0, 0, bnei_else.44085
	j	bnei_cont.44086
bnei_else.44085:
	fneg	%f0, %f0
bnei_cont.44086:
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
	fblt	%f6, %f7, fbgt_else.44087
	addi	%v1, %zero, 1
	j	fbgt_cont.44088
fbgt_else.44087:
	addi	%v1, %zero, 0
fbgt_cont.44088:
	fabs	%f8, %f6
	flw	%f9, 4(%sp)
	fblt	%f8, %f9, fbgt_else.44089
	flw	%f6, 455(%zero)
	fblt	%f8, %f6, fbgt_else.44091
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
	j	fbgt_cont.44092
fbgt_else.44091:
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
fbgt_cont.44092:
	beqi	%v1, 0, bnei_else.44093
	j	fbgt_cont.44090
bnei_else.44093:
	fneg	%f6, %f6
bnei_cont.44094:
	j	fbgt_cont.44090
fbgt_else.44089:
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
fbgt_cont.44090:
	flw	%f8, 3(%sp)
	fmul	%f6, %f6, %f8
	fblt	%f6, %f7, fbgt_else.44095
	addi	%v1, %zero, 1
	j	fbgt_cont.44096
fbgt_else.44095:
	addi	%v1, %zero, 0
fbgt_cont.44096:
	fabs	%f7, %f6
	flw	%f9, 14(%sp)
	fsw	%f0, 19(%sp)
	sw	%v0, 20(%sp)
	fsw	%f4, 21(%sp)
	fsw	%f6, 22(%sp)
	sw	%v1, 23(%sp)
	fsw	%f7, 24(%sp)
	fblt	%f7, %f9, fbgt_else.44097
	flw	%f10, 492(%zero)
	fblt	%f7, %f10, fbgt_else.44099
	flw	%f10, 491(%zero)
	fblt	%f7, %f10, fbgt_else.44101
	flw	%f10, 490(%zero)
	fblt	%f7, %f10, fbgt_else.44103
	flw	%f10, 489(%zero)
	fblt	%f7, %f10, fbgt_else.44105
	flw	%f10, 488(%zero)
	fblt	%f7, %f10, fbgt_else.44107
	flw	%f10, 487(%zero)
	fblt	%f7, %f10, fbgt_else.44109
	flw	%f10, 486(%zero)
	fblt	%f7, %f10, fbgt_else.44111
	flw	%f10, 485(%zero)
	fblt	%f7, %f10, fbgt_else.44113
	flw	%f10, 484(%zero)
	fblt	%f7, %f10, fbgt_else.44115
	flw	%f10, 483(%zero)
	fblt	%f7, %f10, fbgt_else.44117
	flw	%f10, 482(%zero)
	fmov	%f1, %f10
	fmov	%f0, %f7
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.44098
fbgt_else.44117:
	fmov	%f0, %f10
fbgt_cont.44118:
	j	fbgt_cont.44098
fbgt_else.44115:
	fmov	%f0, %f10
fbgt_cont.44116:
	j	fbgt_cont.44098
fbgt_else.44113:
	fmov	%f0, %f10
fbgt_cont.44114:
	j	fbgt_cont.44098
fbgt_else.44111:
	fmov	%f0, %f10
fbgt_cont.44112:
	j	fbgt_cont.44098
fbgt_else.44109:
	fmov	%f0, %f10
fbgt_cont.44110:
	j	fbgt_cont.44098
fbgt_else.44107:
	fmov	%f0, %f10
fbgt_cont.44108:
	j	fbgt_cont.44098
fbgt_else.44105:
	fmov	%f0, %f10
fbgt_cont.44106:
	j	fbgt_cont.44098
fbgt_else.44103:
	fmov	%f0, %f10
fbgt_cont.44104:
	j	fbgt_cont.44098
fbgt_else.44101:
	fmov	%f0, %f10
fbgt_cont.44102:
	j	fbgt_cont.44098
fbgt_else.44099:
	fmov	%f0, %f10
fbgt_cont.44100:
	j	fbgt_cont.44098
fbgt_else.44097:
	fmov	%f0, %f9
fbgt_cont.44098:
	flw	%f1, 24(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.44119
	fblt	%f1, %f0, fbgt_else.44121
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44123
	fblt	%f1, %f0, fbgt_else.44125
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44127
	fblt	%f1, %f0, fbgt_else.44129
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.44120
fbgt_else.44129:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.44130:
	j	fbgt_cont.44120
fbgt_else.44127:
	fmov	%f0, %f1
fbgt_cont.44128:
	j	fbgt_cont.44120
fbgt_else.44125:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44131
	fblt	%f1, %f0, fbgt_else.44133
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.44132
fbgt_else.44133:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.44134:
	j	fbgt_cont.44132
fbgt_else.44131:
	fmov	%f0, %f1
fbgt_cont.44132:
fbgt_cont.44126:
	j	fbgt_cont.44120
fbgt_else.44123:
	fmov	%f0, %f1
fbgt_cont.44124:
	j	fbgt_cont.44120
fbgt_else.44121:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44135
	fblt	%f1, %f0, fbgt_else.44137
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44139
	fblt	%f1, %f0, fbgt_else.44141
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.44136
fbgt_else.44141:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.44142:
	j	fbgt_cont.44136
fbgt_else.44139:
	fmov	%f0, %f1
fbgt_cont.44140:
	j	fbgt_cont.44136
fbgt_else.44137:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44143
	fblt	%f1, %f0, fbgt_else.44145
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.44144
fbgt_else.44145:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.44146:
	j	fbgt_cont.44144
fbgt_else.44143:
	fmov	%f0, %f1
fbgt_cont.44144:
fbgt_cont.44138:
	j	fbgt_cont.44136
fbgt_else.44135:
	fmov	%f0, %f1
fbgt_cont.44136:
fbgt_cont.44122:
	j	fbgt_cont.44120
fbgt_else.44119:
	fmov	%f0, %f1
fbgt_cont.44120:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.44147
	lw	%v0, 23(%sp)
	beqi	%v0, 0, bnei_else.44149
	addi	%v0, %zero, 0
	j	fbgt_cont.44148
bnei_else.44149:
	addi	%v0, %zero, 1
bnei_cont.44150:
	j	fbgt_cont.44148
fbgt_else.44147:
	lw	%v0, 23(%sp)
fbgt_cont.44148:
	fblt	%f0, %f1, fbgt_else.44151
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44152
fbgt_else.44151:
fbgt_cont.44152:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.44153
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44154
fbgt_else.44153:
fbgt_cont.44154:
	flw	%f3, 16(%sp)
	fblt	%f3, %f0, fbgt_else.44155
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
	j	fbgt_cont.44156
fbgt_else.44155:
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
fbgt_cont.44156:
	beqi	%v0, 0, bnei_else.44157
	j	bnei_cont.44158
bnei_else.44157:
	fneg	%f0, %f0
bnei_cont.44158:
	flw	%f4, 22(%sp)
	fabs	%f4, %f4
	flw	%f5, 14(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f4, 26(%sp)
	fblt	%f4, %f5, fbgt_else.44159
	flw	%f6, 492(%zero)
	fblt	%f4, %f6, fbgt_else.44161
	flw	%f6, 491(%zero)
	fblt	%f4, %f6, fbgt_else.44163
	flw	%f6, 490(%zero)
	fblt	%f4, %f6, fbgt_else.44165
	flw	%f6, 489(%zero)
	fblt	%f4, %f6, fbgt_else.44167
	flw	%f6, 488(%zero)
	fblt	%f4, %f6, fbgt_else.44169
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.44171
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.44173
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.44175
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.44177
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.44179
	flw	%f6, 482(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.44160
fbgt_else.44179:
	fmov	%f0, %f6
fbgt_cont.44180:
	j	fbgt_cont.44160
fbgt_else.44177:
	fmov	%f0, %f6
fbgt_cont.44178:
	j	fbgt_cont.44160
fbgt_else.44175:
	fmov	%f0, %f6
fbgt_cont.44176:
	j	fbgt_cont.44160
fbgt_else.44173:
	fmov	%f0, %f6
fbgt_cont.44174:
	j	fbgt_cont.44160
fbgt_else.44171:
	fmov	%f0, %f6
fbgt_cont.44172:
	j	fbgt_cont.44160
fbgt_else.44169:
	fmov	%f0, %f6
fbgt_cont.44170:
	j	fbgt_cont.44160
fbgt_else.44167:
	fmov	%f0, %f6
fbgt_cont.44168:
	j	fbgt_cont.44160
fbgt_else.44165:
	fmov	%f0, %f6
fbgt_cont.44166:
	j	fbgt_cont.44160
fbgt_else.44163:
	fmov	%f0, %f6
fbgt_cont.44164:
	j	fbgt_cont.44160
fbgt_else.44161:
	fmov	%f0, %f6
fbgt_cont.44162:
	j	fbgt_cont.44160
fbgt_else.44159:
	fmov	%f0, %f5
fbgt_cont.44160:
	flw	%f1, 26(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.44181
	fblt	%f1, %f0, fbgt_else.44183
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44185
	fblt	%f1, %f0, fbgt_else.44187
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44189
	fblt	%f1, %f0, fbgt_else.44191
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.44182
fbgt_else.44191:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.44192:
	j	fbgt_cont.44182
fbgt_else.44189:
	fmov	%f0, %f1
fbgt_cont.44190:
	j	fbgt_cont.44182
fbgt_else.44187:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44193
	fblt	%f1, %f0, fbgt_else.44195
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.44194
fbgt_else.44195:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.44196:
	j	fbgt_cont.44194
fbgt_else.44193:
	fmov	%f0, %f1
fbgt_cont.44194:
fbgt_cont.44188:
	j	fbgt_cont.44182
fbgt_else.44185:
	fmov	%f0, %f1
fbgt_cont.44186:
	j	fbgt_cont.44182
fbgt_else.44183:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44197
	fblt	%f1, %f0, fbgt_else.44199
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44201
	fblt	%f1, %f0, fbgt_else.44203
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.44198
fbgt_else.44203:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.44204:
	j	fbgt_cont.44198
fbgt_else.44201:
	fmov	%f0, %f1
fbgt_cont.44202:
	j	fbgt_cont.44198
fbgt_else.44199:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44205
	fblt	%f1, %f0, fbgt_else.44207
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.44206
fbgt_else.44207:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.44208:
	j	fbgt_cont.44206
fbgt_else.44205:
	fmov	%f0, %f1
fbgt_cont.44206:
fbgt_cont.44200:
	j	fbgt_cont.44198
fbgt_else.44197:
	fmov	%f0, %f1
fbgt_cont.44198:
fbgt_cont.44184:
	j	fbgt_cont.44182
fbgt_else.44181:
	fmov	%f0, %f1
fbgt_cont.44182:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.44209
	addi	%v0, %zero, 0
	j	fbgt_cont.44210
fbgt_else.44209:
	addi	%v0, %zero, 1
fbgt_cont.44210:
	fblt	%f0, %f1, fbgt_else.44211
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44212
fbgt_else.44211:
fbgt_cont.44212:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.44213
	beqi	%v0, 0, bnei_else.44215
	addi	%v0, %zero, 0
	j	fbgt_cont.44214
bnei_else.44215:
	addi	%v0, %zero, 1
bnei_cont.44216:
	j	fbgt_cont.44214
fbgt_else.44213:
fbgt_cont.44214:
	fblt	%f0, %f2, fbgt_else.44217
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44218
fbgt_else.44217:
fbgt_cont.44218:
	flw	%f1, 16(%sp)
	fblt	%f1, %f0, fbgt_else.44219
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
	j	fbgt_cont.44220
fbgt_else.44219:
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
fbgt_cont.44220:
	beqi	%v0, 0, bnei_else.44221
	j	bnei_cont.44222
bnei_else.44221:
	fneg	%f0, %f0
bnei_cont.44222:
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
	j	calc_dirvec.3071
calc_dirvecs.3079:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.44251
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
	blti	%v1, 5, bgti_else.44252
	addi	%v1, %v1, -5
	j	bgti_cont.44253
bgti_else.44252:
bgti_cont.44253:
	blti	%v0, 0, bgti_else.44254
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
	blti	%v1, 5, bgti_else.44255
	addi	%v1, %v1, -5
	j	bgti_cont.44256
bgti_else.44255:
bgti_cont.44256:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3079
bgti_else.44254:
	jr	%ra
bgti_else.44251:
	jr	%ra
calc_dirvec_rows.3084:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.44279
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
	blti	%a0, 5, bgti_else.44280
	addi	%a0, %a0, -5
	j	bgti_cont.44281
bgti_else.44280:
bgti_cont.44281:
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
	blti	%v1, 5, bgti_else.44282
	addi	%v1, %v1, -5
	j	bgti_cont.44283
bgti_else.44282:
bgti_cont.44283:
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.44284
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
	blti	%v1, 5, bgti_else.44285
	addi	%v1, %v1, -5
	j	bgti_cont.44286
bgti_else.44285:
bgti_cont.44286:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3084
bgti_else.44284:
	jr	%ra
bgti_else.44279:
	jr	%ra
create_dirvec_elements.3090:
	blti	%v1, 0, bgti_else.44311
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
	blti	%v0, 0, bgti_else.44312
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
	blti	%v0, 0, bgti_else.44313
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
	blti	%v0, 0, bgti_else.44314
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
bgti_else.44314:
	jr	%ra
bgti_else.44313:
	jr	%ra
bgti_else.44312:
	jr	%ra
bgti_else.44311:
	jr	%ra
create_dirvecs.3093:
	blti	%v0, 0, bgti_else.44357
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
	jal	create_dirvec_elements.3090
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.44358
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
bgti_else.44358:
	jr	%ra
bgti_else.44357:
	jr	%ra
init_dirvec_constants.3095:
	blti	%v1, 0, bgti_else.44434
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
	blti	%v0, 0, bgti_else.44435
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.44436
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.44438
	beqi	%t1, 2, bnei_else.44440
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
	beqi	%a0, 0, bnei_else.44442
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
	j	bnei_cont.44443
bnei_else.44442:
bnei_cont.44443:
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
	beqi	%a0, 0, bnei_else.44444
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
	j	bnei_cont.44445
bnei_else.44444:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.44445:
	flw	%f0, 6(%sp)
	fbne	%f3, %f0, fbeq_else.44446
	addi	%v1, %zero, 1
	j	fbeq_cont.44447
fbeq_else.44446:
	addi	%v1, %zero, 0
fbeq_cont.44447:
	beqi	%v1, 0, bnei_else.44448
	j	bnei_cont.44449
bnei_else.44448:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.44449:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.44439
bnei_else.44440:
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
	fblt	%f1, %f0, fbgt_else.44450
	addi	%v1, %zero, 0
	j	fbgt_cont.44451
fbgt_else.44450:
	addi	%v1, %zero, 1
fbgt_cont.44451:
	beqi	%v1, 0, bnei_else.44452
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
	j	bnei_cont.44453
bnei_else.44452:
	fsw	%f1, 0(%v0)
bnei_cont.44453:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.44441:
	j	bnei_cont.44439
bnei_else.44438:
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
	fbne	%f0, %f1, fbeq_else.44454
	addi	%a0, %zero, 1
	j	fbeq_cont.44455
fbeq_else.44454:
	addi	%a0, %zero, 0
fbeq_cont.44455:
	beqi	%a0, 0, bnei_else.44456
	fsw	%f1, 1(%v0)
	j	bnei_cont.44457
bnei_else.44456:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.44458
	addi	%a2, %zero, 0
	j	fbgt_cont.44459
fbgt_else.44458:
	addi	%a2, %zero, 1
fbgt_cont.44459:
	beqi	%a1, 0, bnei_else.44460
	beqi	%a2, 0, bnei_else.44462
	addi	%a1, %zero, 0
	j	bnei_cont.44461
bnei_else.44462:
	addi	%a1, %zero, 1
bnei_cont.44463:
	j	bnei_cont.44461
bnei_else.44460:
	add	%a1, %zero, %a2
bnei_cont.44461:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.44464
	j	bnei_cont.44465
bnei_else.44464:
	fneg	%f2, %f2
bnei_cont.44465:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.44457:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.44466
	addi	%a0, %zero, 1
	j	fbeq_cont.44467
fbeq_else.44466:
	addi	%a0, %zero, 0
fbeq_cont.44467:
	beqi	%a0, 0, bnei_else.44468
	fsw	%f1, 3(%v0)
	j	bnei_cont.44469
bnei_else.44468:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.44470
	addi	%a2, %zero, 0
	j	fbgt_cont.44471
fbgt_else.44470:
	addi	%a2, %zero, 1
fbgt_cont.44471:
	beqi	%a1, 0, bnei_else.44472
	beqi	%a2, 0, bnei_else.44474
	addi	%a1, %zero, 0
	j	bnei_cont.44473
bnei_else.44474:
	addi	%a1, %zero, 1
bnei_cont.44475:
	j	bnei_cont.44473
bnei_else.44472:
	add	%a1, %zero, %a2
bnei_cont.44473:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.44476
	j	bnei_cont.44477
bnei_else.44476:
	fneg	%f2, %f2
bnei_cont.44477:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.44469:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.44478
	addi	%v1, %zero, 1
	j	fbeq_cont.44479
fbeq_else.44478:
	addi	%v1, %zero, 0
fbeq_cont.44479:
	beqi	%v1, 0, bnei_else.44480
	fsw	%f1, 5(%v0)
	j	bnei_cont.44481
bnei_else.44480:
	lw	%v1, 7(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.44482
	addi	%a1, %zero, 0
	j	fbgt_cont.44483
fbgt_else.44482:
	addi	%a1, %zero, 1
fbgt_cont.44483:
	beqi	%a0, 0, bnei_else.44484
	beqi	%a1, 0, bnei_else.44486
	addi	%a0, %zero, 0
	j	bnei_cont.44485
bnei_else.44486:
	addi	%a0, %zero, 1
bnei_cont.44487:
	j	bnei_cont.44485
bnei_else.44484:
	add	%a0, %zero, %a1
bnei_cont.44485:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.44488
	j	bnei_cont.44489
bnei_else.44488:
	fneg	%f1, %f1
bnei_cont.44489:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.44481:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.44439:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.44437
bgti_else.44436:
bgti_cont.44437:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.44490
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
	blti	%v0, 0, bgti_else.44491
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
bgti_else.44491:
	jr	%ra
bgti_else.44490:
	jr	%ra
bgti_else.44435:
	jr	%ra
bgti_else.44434:
	jr	%ra
init_vecset_constants.3098:
	blti	%v0, 0, bgti_else.44548
	lw	%v1, 179(%v0)
	addi	%a0, %zero, 119
	lw	%a1, 119(%v1)
	lw	%a2, 0(%zero)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v1, 3(%sp)
	blti	%a2, 0, bgti_else.44549
	lw	%a3, 12(%a2)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.44551
	beqi	%t2, 2, bnei_else.44553
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
	beqi	%a0, 0, bnei_else.44555
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
	j	bnei_cont.44556
bnei_else.44555:
bnei_cont.44556:
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
	beqi	%a0, 0, bnei_else.44557
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
	j	bnei_cont.44558
bnei_else.44557:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.44558:
	flw	%f0, 6(%sp)
	fbne	%f3, %f0, fbeq_else.44559
	addi	%v1, %zero, 1
	j	fbeq_cont.44560
fbeq_else.44559:
	addi	%v1, %zero, 0
fbeq_cont.44560:
	beqi	%v1, 0, bnei_else.44561
	j	bnei_cont.44562
bnei_else.44561:
	flw	%f0, 474(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.44562:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.44552
bnei_else.44553:
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
	fblt	%f1, %f0, fbgt_else.44563
	addi	%v1, %zero, 0
	j	fbgt_cont.44564
fbgt_else.44563:
	addi	%v1, %zero, 1
fbgt_cont.44564:
	beqi	%v1, 0, bnei_else.44565
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
	j	bnei_cont.44566
bnei_else.44565:
	fsw	%f1, 0(%v0)
bnei_cont.44566:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.44554:
	j	bnei_cont.44552
bnei_else.44551:
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
	fbne	%f0, %f1, fbeq_else.44567
	addi	%a0, %zero, 1
	j	fbeq_cont.44568
fbeq_else.44567:
	addi	%a0, %zero, 0
fbeq_cont.44568:
	beqi	%a0, 0, bnei_else.44569
	fsw	%f1, 1(%v0)
	j	bnei_cont.44570
bnei_else.44569:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.44571
	addi	%a2, %zero, 0
	j	fbgt_cont.44572
fbgt_else.44571:
	addi	%a2, %zero, 1
fbgt_cont.44572:
	beqi	%a1, 0, bnei_else.44573
	beqi	%a2, 0, bnei_else.44575
	addi	%a1, %zero, 0
	j	bnei_cont.44574
bnei_else.44575:
	addi	%a1, %zero, 1
bnei_cont.44576:
	j	bnei_cont.44574
bnei_else.44573:
	add	%a1, %zero, %a2
bnei_cont.44574:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.44577
	j	bnei_cont.44578
bnei_else.44577:
	fneg	%f2, %f2
bnei_cont.44578:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.44570:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.44579
	addi	%a0, %zero, 1
	j	fbeq_cont.44580
fbeq_else.44579:
	addi	%a0, %zero, 0
fbeq_cont.44580:
	beqi	%a0, 0, bnei_else.44581
	fsw	%f1, 3(%v0)
	j	bnei_cont.44582
bnei_else.44581:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.44583
	addi	%a2, %zero, 0
	j	fbgt_cont.44584
fbgt_else.44583:
	addi	%a2, %zero, 1
fbgt_cont.44584:
	beqi	%a1, 0, bnei_else.44585
	beqi	%a2, 0, bnei_else.44587
	addi	%a1, %zero, 0
	j	bnei_cont.44586
bnei_else.44587:
	addi	%a1, %zero, 1
bnei_cont.44588:
	j	bnei_cont.44586
bnei_else.44585:
	add	%a1, %zero, %a2
bnei_cont.44586:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.44589
	j	bnei_cont.44590
bnei_else.44589:
	fneg	%f2, %f2
bnei_cont.44590:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.44582:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.44591
	addi	%v1, %zero, 1
	j	fbeq_cont.44592
fbeq_else.44591:
	addi	%v1, %zero, 0
fbeq_cont.44592:
	beqi	%v1, 0, bnei_else.44593
	fsw	%f1, 5(%v0)
	j	bnei_cont.44594
bnei_else.44593:
	lw	%v1, 7(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.44595
	addi	%a1, %zero, 0
	j	fbgt_cont.44596
fbgt_else.44595:
	addi	%a1, %zero, 1
fbgt_cont.44596:
	beqi	%a0, 0, bnei_else.44597
	beqi	%a1, 0, bnei_else.44599
	addi	%a0, %zero, 0
	j	bnei_cont.44598
bnei_else.44599:
	addi	%a0, %zero, 1
bnei_cont.44600:
	j	bnei_cont.44598
bnei_else.44597:
	add	%a0, %zero, %a1
bnei_cont.44598:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.44601
	j	bnei_cont.44602
bnei_else.44601:
	fneg	%f1, %f1
bnei_cont.44602:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.44594:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.44552:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.44550
bgti_else.44549:
bgti_cont.44550:
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
	blti	%v0, 0, bgti_else.44603
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
	blti	%v0, 0, bgti_else.44604
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
	blti	%v0, 0, bgti_else.44605
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
bgti_else.44605:
	jr	%ra
bgti_else.44604:
	jr	%ra
bgti_else.44603:
	jr	%ra
bgti_else.44548:
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
	blti	%a0, 0, bgti_else.47291
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
	j	bgti_cont.47292
bgti_else.47291:
bgti_cont.47292:
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
	blti	%v1, 0, bgti_else.47293
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
	j	bgti_cont.47294
bgti_else.47293:
bgti_cont.47294:
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
	blti	%v1, 0, bgti_else.47295
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
	j	bgti_cont.47296
bgti_else.47295:
bgti_cont.47296:
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
	fblt	%f3, %f4, fbgt_else.47297
	flw	%f5, 492(%zero)
	fblt	%f3, %f5, fbgt_else.47299
	flw	%f5, 491(%zero)
	fblt	%f3, %f5, fbgt_else.47301
	flw	%f5, 490(%zero)
	fblt	%f3, %f5, fbgt_else.47303
	flw	%f5, 489(%zero)
	fblt	%f3, %f5, fbgt_else.47305
	flw	%f5, 488(%zero)
	fblt	%f3, %f5, fbgt_else.47307
	flw	%f5, 487(%zero)
	fblt	%f3, %f5, fbgt_else.47309
	flw	%f5, 486(%zero)
	fblt	%f3, %f5, fbgt_else.47311
	flw	%f5, 485(%zero)
	fblt	%f3, %f5, fbgt_else.47313
	flw	%f5, 484(%zero)
	fblt	%f3, %f5, fbgt_else.47315
	flw	%f5, 483(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
	j	fbgt_cont.47298
fbgt_else.47315:
	fmov	%f0, %f5
fbgt_cont.47316:
	j	fbgt_cont.47298
fbgt_else.47313:
	fmov	%f0, %f5
fbgt_cont.47314:
	j	fbgt_cont.47298
fbgt_else.47311:
	fmov	%f0, %f5
fbgt_cont.47312:
	j	fbgt_cont.47298
fbgt_else.47309:
	fmov	%f0, %f5
fbgt_cont.47310:
	j	fbgt_cont.47298
fbgt_else.47307:
	fmov	%f0, %f5
fbgt_cont.47308:
	j	fbgt_cont.47298
fbgt_else.47305:
	fmov	%f0, %f5
fbgt_cont.47306:
	j	fbgt_cont.47298
fbgt_else.47303:
	fmov	%f0, %f5
fbgt_cont.47304:
	j	fbgt_cont.47298
fbgt_else.47301:
	fmov	%f0, %f5
fbgt_cont.47302:
	j	fbgt_cont.47298
fbgt_else.47299:
	fmov	%f0, %f5
fbgt_cont.47300:
	j	fbgt_cont.47298
fbgt_else.47297:
	fmov	%f0, %f4
fbgt_cont.47298:
	flw	%f1, 71(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.47317
	fblt	%f1, %f0, fbgt_else.47319
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47321
	fblt	%f1, %f0, fbgt_else.47323
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
	j	fbgt_cont.47318
fbgt_else.47323:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
fbgt_cont.47324:
	j	fbgt_cont.47318
fbgt_else.47321:
	fmov	%f0, %f1
fbgt_cont.47322:
	j	fbgt_cont.47318
fbgt_else.47319:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47325
	fblt	%f1, %f0, fbgt_else.47327
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
	j	fbgt_cont.47326
fbgt_else.47327:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
fbgt_cont.47328:
	j	fbgt_cont.47326
fbgt_else.47325:
	fmov	%f0, %f1
fbgt_cont.47326:
fbgt_cont.47320:
	j	fbgt_cont.47318
fbgt_else.47317:
	fmov	%f0, %f1
fbgt_cont.47318:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.47329
	addi	%v0, %zero, 0
	j	fbgt_cont.47330
fbgt_else.47329:
	addi	%v0, %zero, 1
fbgt_cont.47330:
	fblt	%f0, %f1, fbgt_else.47331
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47332
fbgt_else.47331:
fbgt_cont.47332:
	flw	%f2, 479(%zero)
	fblt	%f0, %f2, fbgt_else.47333
	beqi	%v0, 0, bnei_else.47335
	addi	%v0, %zero, 0
	j	fbgt_cont.47334
bnei_else.47335:
	addi	%v0, %zero, 1
bnei_cont.47336:
	j	fbgt_cont.47334
fbgt_else.47333:
fbgt_cont.47334:
	fblt	%f0, %f2, fbgt_else.47337
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47338
fbgt_else.47337:
fbgt_cont.47338:
	flw	%f3, 478(%zero)
	fblt	%f3, %f0, fbgt_else.47339
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
	j	fbgt_cont.47340
fbgt_else.47339:
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
fbgt_cont.47340:
	beqi	%v0, 0, bnei_else.47341
	j	bnei_cont.47342
bnei_else.47341:
	fneg	%f0, %f0
bnei_cont.47342:
	flw	%f4, 69(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.47343
	addi	%v0, %zero, 1
	j	fbgt_cont.47344
fbgt_else.47343:
	addi	%v0, %zero, 0
fbgt_cont.47344:
	fabs	%f4, %f4
	flw	%f6, 72(%sp)
	fsw	%f0, 73(%sp)
	fsw	%f3, 74(%sp)
	fsw	%f2, 75(%sp)
	sw	%v0, 76(%sp)
	fsw	%f4, 77(%sp)
	fblt	%f4, %f6, fbgt_else.47345
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.47347
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.47349
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.47351
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.47353
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.47355
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.47357
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.47359
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.47361
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.47363
	flw	%f7, 483(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.47346
fbgt_else.47363:
	fmov	%f0, %f7
fbgt_cont.47364:
	j	fbgt_cont.47346
fbgt_else.47361:
	fmov	%f0, %f7
fbgt_cont.47362:
	j	fbgt_cont.47346
fbgt_else.47359:
	fmov	%f0, %f7
fbgt_cont.47360:
	j	fbgt_cont.47346
fbgt_else.47357:
	fmov	%f0, %f7
fbgt_cont.47358:
	j	fbgt_cont.47346
fbgt_else.47355:
	fmov	%f0, %f7
fbgt_cont.47356:
	j	fbgt_cont.47346
fbgt_else.47353:
	fmov	%f0, %f7
fbgt_cont.47354:
	j	fbgt_cont.47346
fbgt_else.47351:
	fmov	%f0, %f7
fbgt_cont.47352:
	j	fbgt_cont.47346
fbgt_else.47349:
	fmov	%f0, %f7
fbgt_cont.47350:
	j	fbgt_cont.47346
fbgt_else.47347:
	fmov	%f0, %f7
fbgt_cont.47348:
	j	fbgt_cont.47346
fbgt_else.47345:
	fmov	%f0, %f6
fbgt_cont.47346:
	flw	%f1, 77(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.47365
	fblt	%f1, %f0, fbgt_else.47367
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47369
	fblt	%f1, %f0, fbgt_else.47371
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
	j	fbgt_cont.47366
fbgt_else.47371:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.47372:
	j	fbgt_cont.47366
fbgt_else.47369:
	fmov	%f0, %f1
fbgt_cont.47370:
	j	fbgt_cont.47366
fbgt_else.47367:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47373
	fblt	%f1, %f0, fbgt_else.47375
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
	j	fbgt_cont.47374
fbgt_else.47375:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.47376:
	j	fbgt_cont.47374
fbgt_else.47373:
	fmov	%f0, %f1
fbgt_cont.47374:
fbgt_cont.47368:
	j	fbgt_cont.47366
fbgt_else.47365:
	fmov	%f0, %f1
fbgt_cont.47366:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.47377
	lw	%v0, 76(%sp)
	beqi	%v0, 0, bnei_else.47379
	addi	%v0, %zero, 0
	j	fbgt_cont.47378
bnei_else.47379:
	addi	%v0, %zero, 1
bnei_cont.47380:
	j	fbgt_cont.47378
fbgt_else.47377:
	lw	%v0, 76(%sp)
fbgt_cont.47378:
	fblt	%f0, %f1, fbgt_else.47381
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47382
fbgt_else.47381:
fbgt_cont.47382:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.47383
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47384
fbgt_else.47383:
fbgt_cont.47384:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.47385
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
	j	fbgt_cont.47386
fbgt_else.47385:
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
fbgt_cont.47386:
	beqi	%v0, 0, bnei_else.47387
	j	bnei_cont.47388
bnei_else.47387:
	fneg	%f0, %f0
bnei_cont.47388:
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
	fblt	%f2, %f3, fbgt_else.47389
	flw	%f4, 492(%zero)
	fblt	%f2, %f4, fbgt_else.47391
	flw	%f4, 491(%zero)
	fblt	%f2, %f4, fbgt_else.47393
	flw	%f4, 490(%zero)
	fblt	%f2, %f4, fbgt_else.47395
	flw	%f4, 489(%zero)
	fblt	%f2, %f4, fbgt_else.47397
	flw	%f4, 488(%zero)
	fblt	%f2, %f4, fbgt_else.47399
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.47401
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.47403
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.47405
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.47407
	flw	%f4, 483(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
	j	fbgt_cont.47390
fbgt_else.47407:
	fmov	%f0, %f4
fbgt_cont.47408:
	j	fbgt_cont.47390
fbgt_else.47405:
	fmov	%f0, %f4
fbgt_cont.47406:
	j	fbgt_cont.47390
fbgt_else.47403:
	fmov	%f0, %f4
fbgt_cont.47404:
	j	fbgt_cont.47390
fbgt_else.47401:
	fmov	%f0, %f4
fbgt_cont.47402:
	j	fbgt_cont.47390
fbgt_else.47399:
	fmov	%f0, %f4
fbgt_cont.47400:
	j	fbgt_cont.47390
fbgt_else.47397:
	fmov	%f0, %f4
fbgt_cont.47398:
	j	fbgt_cont.47390
fbgt_else.47395:
	fmov	%f0, %f4
fbgt_cont.47396:
	j	fbgt_cont.47390
fbgt_else.47393:
	fmov	%f0, %f4
fbgt_cont.47394:
	j	fbgt_cont.47390
fbgt_else.47391:
	fmov	%f0, %f4
fbgt_cont.47392:
	j	fbgt_cont.47390
fbgt_else.47389:
	fmov	%f0, %f3
fbgt_cont.47390:
	flw	%f1, 80(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.47409
	fblt	%f1, %f0, fbgt_else.47411
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47413
	fblt	%f1, %f0, fbgt_else.47415
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
	j	fbgt_cont.47410
fbgt_else.47415:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
fbgt_cont.47416:
	j	fbgt_cont.47410
fbgt_else.47413:
	fmov	%f0, %f1
fbgt_cont.47414:
	j	fbgt_cont.47410
fbgt_else.47411:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47417
	fblt	%f1, %f0, fbgt_else.47419
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
	j	fbgt_cont.47418
fbgt_else.47419:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
fbgt_cont.47420:
	j	fbgt_cont.47418
fbgt_else.47417:
	fmov	%f0, %f1
fbgt_cont.47418:
fbgt_cont.47412:
	j	fbgt_cont.47410
fbgt_else.47409:
	fmov	%f0, %f1
fbgt_cont.47410:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.47421
	addi	%v0, %zero, 0
	j	fbgt_cont.47422
fbgt_else.47421:
	addi	%v0, %zero, 1
fbgt_cont.47422:
	fblt	%f0, %f1, fbgt_else.47423
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47424
fbgt_else.47423:
fbgt_cont.47424:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.47425
	beqi	%v0, 0, bnei_else.47427
	addi	%v0, %zero, 0
	j	fbgt_cont.47426
bnei_else.47427:
	addi	%v0, %zero, 1
bnei_cont.47428:
	j	fbgt_cont.47426
fbgt_else.47425:
fbgt_cont.47426:
	fblt	%f0, %f2, fbgt_else.47429
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47430
fbgt_else.47429:
fbgt_cont.47430:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.47431
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
	j	fbgt_cont.47432
fbgt_else.47431:
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
fbgt_cont.47432:
	beqi	%v0, 0, bnei_else.47433
	j	bnei_cont.47434
bnei_else.47433:
	fneg	%f0, %f0
bnei_cont.47434:
	flw	%f4, 79(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.47435
	addi	%v0, %zero, 1
	j	fbgt_cont.47436
fbgt_else.47435:
	addi	%v0, %zero, 0
fbgt_cont.47436:
	fabs	%f4, %f4
	flw	%f6, 72(%sp)
	fsw	%f0, 81(%sp)
	sw	%v0, 82(%sp)
	fsw	%f4, 83(%sp)
	fblt	%f4, %f6, fbgt_else.47437
	flw	%f7, 492(%zero)
	fblt	%f4, %f7, fbgt_else.47439
	flw	%f7, 491(%zero)
	fblt	%f4, %f7, fbgt_else.47441
	flw	%f7, 490(%zero)
	fblt	%f4, %f7, fbgt_else.47443
	flw	%f7, 489(%zero)
	fblt	%f4, %f7, fbgt_else.47445
	flw	%f7, 488(%zero)
	fblt	%f4, %f7, fbgt_else.47447
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.47449
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.47451
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.47453
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.47455
	flw	%f7, 483(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
	j	fbgt_cont.47438
fbgt_else.47455:
	fmov	%f0, %f7
fbgt_cont.47456:
	j	fbgt_cont.47438
fbgt_else.47453:
	fmov	%f0, %f7
fbgt_cont.47454:
	j	fbgt_cont.47438
fbgt_else.47451:
	fmov	%f0, %f7
fbgt_cont.47452:
	j	fbgt_cont.47438
fbgt_else.47449:
	fmov	%f0, %f7
fbgt_cont.47450:
	j	fbgt_cont.47438
fbgt_else.47447:
	fmov	%f0, %f7
fbgt_cont.47448:
	j	fbgt_cont.47438
fbgt_else.47445:
	fmov	%f0, %f7
fbgt_cont.47446:
	j	fbgt_cont.47438
fbgt_else.47443:
	fmov	%f0, %f7
fbgt_cont.47444:
	j	fbgt_cont.47438
fbgt_else.47441:
	fmov	%f0, %f7
fbgt_cont.47442:
	j	fbgt_cont.47438
fbgt_else.47439:
	fmov	%f0, %f7
fbgt_cont.47440:
	j	fbgt_cont.47438
fbgt_else.47437:
	fmov	%f0, %f6
fbgt_cont.47438:
	flw	%f1, 83(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.47457
	fblt	%f1, %f0, fbgt_else.47459
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47461
	fblt	%f1, %f0, fbgt_else.47463
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
	j	fbgt_cont.47458
fbgt_else.47463:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
fbgt_cont.47464:
	j	fbgt_cont.47458
fbgt_else.47461:
	fmov	%f0, %f1
fbgt_cont.47462:
	j	fbgt_cont.47458
fbgt_else.47459:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47465
	fblt	%f1, %f0, fbgt_else.47467
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
	j	fbgt_cont.47466
fbgt_else.47467:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
fbgt_cont.47468:
	j	fbgt_cont.47466
fbgt_else.47465:
	fmov	%f0, %f1
fbgt_cont.47466:
fbgt_cont.47460:
	j	fbgt_cont.47458
fbgt_else.47457:
	fmov	%f0, %f1
fbgt_cont.47458:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.47469
	lw	%v0, 82(%sp)
	beqi	%v0, 0, bnei_else.47471
	addi	%v0, %zero, 0
	j	fbgt_cont.47470
bnei_else.47471:
	addi	%v0, %zero, 1
bnei_cont.47472:
	j	fbgt_cont.47470
fbgt_else.47469:
	lw	%v0, 82(%sp)
fbgt_cont.47470:
	fblt	%f0, %f1, fbgt_else.47473
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47474
fbgt_else.47473:
fbgt_cont.47474:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.47475
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47476
fbgt_else.47475:
fbgt_cont.47476:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.47477
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
	j	fbgt_cont.47478
fbgt_else.47477:
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
fbgt_cont.47478:
	beqi	%v0, 0, bnei_else.47479
	j	bnei_cont.47480
bnei_else.47479:
	fneg	%f0, %f0
bnei_cont.47480:
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
	fblt	%f0, %f2, fbgt_else.47481
	addi	%v0, %zero, 1
	j	fbgt_cont.47482
fbgt_else.47481:
	addi	%v0, %zero, 0
fbgt_cont.47482:
	fabs	%f3, %f0
	flw	%f4, 72(%sp)
	fsw	%f0, 87(%sp)
	sw	%v0, 88(%sp)
	fsw	%f3, 89(%sp)
	fblt	%f3, %f4, fbgt_else.47483
	flw	%f5, 492(%zero)
	fblt	%f3, %f5, fbgt_else.47485
	flw	%f5, 491(%zero)
	fblt	%f3, %f5, fbgt_else.47487
	flw	%f5, 490(%zero)
	fblt	%f3, %f5, fbgt_else.47489
	flw	%f5, 489(%zero)
	fblt	%f3, %f5, fbgt_else.47491
	flw	%f5, 488(%zero)
	fblt	%f3, %f5, fbgt_else.47493
	flw	%f5, 487(%zero)
	fblt	%f3, %f5, fbgt_else.47495
	flw	%f5, 486(%zero)
	fblt	%f3, %f5, fbgt_else.47497
	flw	%f5, 485(%zero)
	fblt	%f3, %f5, fbgt_else.47499
	flw	%f5, 484(%zero)
	fblt	%f3, %f5, fbgt_else.47501
	flw	%f5, 483(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	j	fbgt_cont.47484
fbgt_else.47501:
	fmov	%f0, %f5
fbgt_cont.47502:
	j	fbgt_cont.47484
fbgt_else.47499:
	fmov	%f0, %f5
fbgt_cont.47500:
	j	fbgt_cont.47484
fbgt_else.47497:
	fmov	%f0, %f5
fbgt_cont.47498:
	j	fbgt_cont.47484
fbgt_else.47495:
	fmov	%f0, %f5
fbgt_cont.47496:
	j	fbgt_cont.47484
fbgt_else.47493:
	fmov	%f0, %f5
fbgt_cont.47494:
	j	fbgt_cont.47484
fbgt_else.47491:
	fmov	%f0, %f5
fbgt_cont.47492:
	j	fbgt_cont.47484
fbgt_else.47489:
	fmov	%f0, %f5
fbgt_cont.47490:
	j	fbgt_cont.47484
fbgt_else.47487:
	fmov	%f0, %f5
fbgt_cont.47488:
	j	fbgt_cont.47484
fbgt_else.47485:
	fmov	%f0, %f5
fbgt_cont.47486:
	j	fbgt_cont.47484
fbgt_else.47483:
	fmov	%f0, %f4
fbgt_cont.47484:
	flw	%f1, 89(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.47503
	fblt	%f1, %f0, fbgt_else.47505
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47507
	fblt	%f1, %f0, fbgt_else.47509
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
	j	fbgt_cont.47504
fbgt_else.47509:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
fbgt_cont.47510:
	j	fbgt_cont.47504
fbgt_else.47507:
	fmov	%f0, %f1
fbgt_cont.47508:
	j	fbgt_cont.47504
fbgt_else.47505:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47511
	fblt	%f1, %f0, fbgt_else.47513
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
	j	fbgt_cont.47512
fbgt_else.47513:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
fbgt_cont.47514:
	j	fbgt_cont.47512
fbgt_else.47511:
	fmov	%f0, %f1
fbgt_cont.47512:
fbgt_cont.47506:
	j	fbgt_cont.47504
fbgt_else.47503:
	fmov	%f0, %f1
fbgt_cont.47504:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.47515
	lw	%v0, 88(%sp)
	beqi	%v0, 0, bnei_else.47517
	addi	%v0, %zero, 0
	j	fbgt_cont.47516
bnei_else.47517:
	addi	%v0, %zero, 1
bnei_cont.47518:
	j	fbgt_cont.47516
fbgt_else.47515:
	lw	%v0, 88(%sp)
fbgt_cont.47516:
	fblt	%f0, %f1, fbgt_else.47519
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47520
fbgt_else.47519:
fbgt_cont.47520:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.47521
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47522
fbgt_else.47521:
fbgt_cont.47522:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.47523
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
	j	fbgt_cont.47524
fbgt_else.47523:
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
fbgt_cont.47524:
	beqi	%v0, 0, bnei_else.47525
	j	bnei_cont.47526
bnei_else.47525:
	fneg	%f0, %f0
bnei_cont.47526:
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
	fblt	%f1, %f2, fbgt_else.47527
	flw	%f3, 492(%zero)
	fblt	%f1, %f3, fbgt_else.47529
	flw	%f3, 491(%zero)
	fblt	%f1, %f3, fbgt_else.47531
	flw	%f3, 490(%zero)
	fblt	%f1, %f3, fbgt_else.47533
	flw	%f3, 489(%zero)
	fblt	%f1, %f3, fbgt_else.47535
	flw	%f3, 488(%zero)
	fblt	%f1, %f3, fbgt_else.47537
	flw	%f3, 487(%zero)
	fblt	%f1, %f3, fbgt_else.47539
	flw	%f3, 486(%zero)
	fblt	%f1, %f3, fbgt_else.47541
	flw	%f3, 485(%zero)
	fblt	%f1, %f3, fbgt_else.47543
	flw	%f3, 484(%zero)
	fblt	%f1, %f3, fbgt_else.47545
	flw	%f3, 483(%zero)
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.47528
fbgt_else.47545:
	fmov	%f0, %f3
fbgt_cont.47546:
	j	fbgt_cont.47528
fbgt_else.47543:
	fmov	%f0, %f3
fbgt_cont.47544:
	j	fbgt_cont.47528
fbgt_else.47541:
	fmov	%f0, %f3
fbgt_cont.47542:
	j	fbgt_cont.47528
fbgt_else.47539:
	fmov	%f0, %f3
fbgt_cont.47540:
	j	fbgt_cont.47528
fbgt_else.47537:
	fmov	%f0, %f3
fbgt_cont.47538:
	j	fbgt_cont.47528
fbgt_else.47535:
	fmov	%f0, %f3
fbgt_cont.47536:
	j	fbgt_cont.47528
fbgt_else.47533:
	fmov	%f0, %f3
fbgt_cont.47534:
	j	fbgt_cont.47528
fbgt_else.47531:
	fmov	%f0, %f3
fbgt_cont.47532:
	j	fbgt_cont.47528
fbgt_else.47529:
	fmov	%f0, %f3
fbgt_cont.47530:
	j	fbgt_cont.47528
fbgt_else.47527:
	fmov	%f0, %f2
fbgt_cont.47528:
	flw	%f1, 91(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.47547
	fblt	%f1, %f0, fbgt_else.47549
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47551
	fblt	%f1, %f0, fbgt_else.47553
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
	j	fbgt_cont.47548
fbgt_else.47553:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.47554:
	j	fbgt_cont.47548
fbgt_else.47551:
	fmov	%f0, %f1
fbgt_cont.47552:
	j	fbgt_cont.47548
fbgt_else.47549:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47555
	fblt	%f1, %f0, fbgt_else.47557
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
	j	fbgt_cont.47556
fbgt_else.47557:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.47558:
	j	fbgt_cont.47556
fbgt_else.47555:
	fmov	%f0, %f1
fbgt_cont.47556:
fbgt_cont.47550:
	j	fbgt_cont.47548
fbgt_else.47547:
	fmov	%f0, %f1
fbgt_cont.47548:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.47559
	addi	%v0, %zero, 0
	j	fbgt_cont.47560
fbgt_else.47559:
	addi	%v0, %zero, 1
fbgt_cont.47560:
	fblt	%f0, %f1, fbgt_else.47561
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47562
fbgt_else.47561:
fbgt_cont.47562:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.47563
	beqi	%v0, 0, bnei_else.47565
	addi	%v0, %zero, 0
	j	fbgt_cont.47564
bnei_else.47565:
	addi	%v0, %zero, 1
bnei_cont.47566:
	j	fbgt_cont.47564
fbgt_else.47563:
fbgt_cont.47564:
	fblt	%f0, %f2, fbgt_else.47567
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47568
fbgt_else.47567:
fbgt_cont.47568:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.47569
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
	j	fbgt_cont.47570
fbgt_else.47569:
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
fbgt_cont.47570:
	beqi	%v0, 0, bnei_else.47571
	j	bnei_cont.47572
bnei_else.47571:
	fneg	%f0, %f0
bnei_cont.47572:
	flw	%f4, 90(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.47573
	addi	%v0, %zero, 1
	j	fbgt_cont.47574
fbgt_else.47573:
	addi	%v0, %zero, 0
fbgt_cont.47574:
	fabs	%f6, %f4
	flw	%f7, 72(%sp)
	fsw	%f0, 92(%sp)
	sw	%v0, 93(%sp)
	fsw	%f6, 94(%sp)
	fblt	%f6, %f7, fbgt_else.47575
	flw	%f8, 492(%zero)
	fblt	%f6, %f8, fbgt_else.47577
	flw	%f8, 491(%zero)
	fblt	%f6, %f8, fbgt_else.47579
	flw	%f8, 490(%zero)
	fblt	%f6, %f8, fbgt_else.47581
	flw	%f8, 489(%zero)
	fblt	%f6, %f8, fbgt_else.47583
	flw	%f8, 488(%zero)
	fblt	%f6, %f8, fbgt_else.47585
	flw	%f8, 487(%zero)
	fblt	%f6, %f8, fbgt_else.47587
	flw	%f8, 486(%zero)
	fblt	%f6, %f8, fbgt_else.47589
	flw	%f8, 485(%zero)
	fblt	%f6, %f8, fbgt_else.47591
	flw	%f8, 484(%zero)
	fblt	%f6, %f8, fbgt_else.47593
	flw	%f8, 483(%zero)
	fmov	%f1, %f8
	fmov	%f0, %f6
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
	j	fbgt_cont.47576
fbgt_else.47593:
	fmov	%f0, %f8
fbgt_cont.47594:
	j	fbgt_cont.47576
fbgt_else.47591:
	fmov	%f0, %f8
fbgt_cont.47592:
	j	fbgt_cont.47576
fbgt_else.47589:
	fmov	%f0, %f8
fbgt_cont.47590:
	j	fbgt_cont.47576
fbgt_else.47587:
	fmov	%f0, %f8
fbgt_cont.47588:
	j	fbgt_cont.47576
fbgt_else.47585:
	fmov	%f0, %f8
fbgt_cont.47586:
	j	fbgt_cont.47576
fbgt_else.47583:
	fmov	%f0, %f8
fbgt_cont.47584:
	j	fbgt_cont.47576
fbgt_else.47581:
	fmov	%f0, %f8
fbgt_cont.47582:
	j	fbgt_cont.47576
fbgt_else.47579:
	fmov	%f0, %f8
fbgt_cont.47580:
	j	fbgt_cont.47576
fbgt_else.47577:
	fmov	%f0, %f8
fbgt_cont.47578:
	j	fbgt_cont.47576
fbgt_else.47575:
	fmov	%f0, %f7
fbgt_cont.47576:
	flw	%f1, 94(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.47595
	fblt	%f1, %f0, fbgt_else.47597
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47599
	fblt	%f1, %f0, fbgt_else.47601
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
	j	fbgt_cont.47596
fbgt_else.47601:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
fbgt_cont.47602:
	j	fbgt_cont.47596
fbgt_else.47599:
	fmov	%f0, %f1
fbgt_cont.47600:
	j	fbgt_cont.47596
fbgt_else.47597:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47603
	fblt	%f1, %f0, fbgt_else.47605
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
	j	fbgt_cont.47604
fbgt_else.47605:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
fbgt_cont.47606:
	j	fbgt_cont.47604
fbgt_else.47603:
	fmov	%f0, %f1
fbgt_cont.47604:
fbgt_cont.47598:
	j	fbgt_cont.47596
fbgt_else.47595:
	fmov	%f0, %f1
fbgt_cont.47596:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.47607
	lw	%v0, 93(%sp)
	beqi	%v0, 0, bnei_else.47609
	addi	%v0, %zero, 0
	j	fbgt_cont.47608
bnei_else.47609:
	addi	%v0, %zero, 1
bnei_cont.47610:
	j	fbgt_cont.47608
fbgt_else.47607:
	lw	%v0, 93(%sp)
fbgt_cont.47608:
	fblt	%f0, %f1, fbgt_else.47611
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47612
fbgt_else.47611:
fbgt_cont.47612:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.47613
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47614
fbgt_else.47613:
fbgt_cont.47614:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.47615
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
	j	fbgt_cont.47616
fbgt_else.47615:
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
fbgt_cont.47616:
	beqi	%v0, 0, bnei_else.47617
	j	bnei_cont.47618
bnei_else.47617:
	fneg	%f0, %f0
bnei_cont.47618:
	flw	%f4, 92(%sp)
	fmul	%f0, %f4, %f0
	fsw	%f0, 78(%zero)
	flw	%f0, 90(%sp)
	fabs	%f0, %f0
	flw	%f5, 72(%sp)
	fsw	%f0, 95(%sp)
	fblt	%f0, %f5, fbgt_else.47619
	flw	%f6, 492(%zero)
	fblt	%f0, %f6, fbgt_else.47621
	flw	%f6, 491(%zero)
	fblt	%f0, %f6, fbgt_else.47623
	flw	%f6, 490(%zero)
	fblt	%f0, %f6, fbgt_else.47625
	flw	%f6, 489(%zero)
	fblt	%f0, %f6, fbgt_else.47627
	flw	%f6, 488(%zero)
	fblt	%f0, %f6, fbgt_else.47629
	flw	%f6, 487(%zero)
	fblt	%f0, %f6, fbgt_else.47631
	flw	%f6, 486(%zero)
	fblt	%f0, %f6, fbgt_else.47633
	flw	%f6, 485(%zero)
	fblt	%f0, %f6, fbgt_else.47635
	flw	%f6, 484(%zero)
	fblt	%f0, %f6, fbgt_else.47637
	flw	%f6, 483(%zero)
	fmov	%f1, %f6
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.47620
fbgt_else.47637:
	fmov	%f0, %f6
fbgt_cont.47638:
	j	fbgt_cont.47620
fbgt_else.47635:
	fmov	%f0, %f6
fbgt_cont.47636:
	j	fbgt_cont.47620
fbgt_else.47633:
	fmov	%f0, %f6
fbgt_cont.47634:
	j	fbgt_cont.47620
fbgt_else.47631:
	fmov	%f0, %f6
fbgt_cont.47632:
	j	fbgt_cont.47620
fbgt_else.47629:
	fmov	%f0, %f6
fbgt_cont.47630:
	j	fbgt_cont.47620
fbgt_else.47627:
	fmov	%f0, %f6
fbgt_cont.47628:
	j	fbgt_cont.47620
fbgt_else.47625:
	fmov	%f0, %f6
fbgt_cont.47626:
	j	fbgt_cont.47620
fbgt_else.47623:
	fmov	%f0, %f6
fbgt_cont.47624:
	j	fbgt_cont.47620
fbgt_else.47621:
	fmov	%f0, %f6
fbgt_cont.47622:
	j	fbgt_cont.47620
fbgt_else.47619:
	fmov	%f0, %f5
fbgt_cont.47620:
	flw	%f1, 95(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.47639
	fblt	%f1, %f0, fbgt_else.47641
	fsub	%f1, %f1, %f0
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47643
	fblt	%f1, %f0, fbgt_else.47645
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
	j	fbgt_cont.47640
fbgt_else.47645:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.47646:
	j	fbgt_cont.47640
fbgt_else.47643:
	fmov	%f0, %f1
fbgt_cont.47644:
	j	fbgt_cont.47640
fbgt_else.47641:
	flw	%f3, 495(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.47647
	fblt	%f1, %f0, fbgt_else.47649
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
	j	fbgt_cont.47648
fbgt_else.47649:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.47650:
	j	fbgt_cont.47648
fbgt_else.47647:
	fmov	%f0, %f1
fbgt_cont.47648:
fbgt_cont.47642:
	j	fbgt_cont.47640
fbgt_else.47639:
	fmov	%f0, %f1
fbgt_cont.47640:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.47651
	addi	%v0, %zero, 0
	j	fbgt_cont.47652
fbgt_else.47651:
	addi	%v0, %zero, 1
fbgt_cont.47652:
	fblt	%f0, %f1, fbgt_else.47653
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47654
fbgt_else.47653:
fbgt_cont.47654:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.47655
	beqi	%v0, 0, bnei_else.47657
	addi	%v0, %zero, 0
	j	fbgt_cont.47656
bnei_else.47657:
	addi	%v0, %zero, 1
bnei_cont.47658:
	j	fbgt_cont.47656
fbgt_else.47655:
fbgt_cont.47656:
	fblt	%f0, %f2, fbgt_else.47659
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47660
fbgt_else.47659:
fbgt_cont.47660:
	flw	%f1, 74(%sp)
	fblt	%f1, %f0, fbgt_else.47661
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
	j	fbgt_cont.47662
fbgt_else.47661:
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
fbgt_cont.47662:
	beqi	%v0, 0, bnei_else.47663
	j	bnei_cont.47664
bnei_else.47663:
	fneg	%f0, %f0
bnei_cont.47664:
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
	jal	read_object.2772
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_net_item.2776
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.47665
	sw	%v0, 83(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_and_network.2780
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	bnei_cont.47666
bnei_else.47665:
bnei_cont.47666:
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_net_item.2776
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.47667
	lw	%v0, 0(%sp)
	sw	%v1, 96(%sp)
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	read_or_network.2778
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
	lw	%v1, 96(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.47668
bnei_else.47667:
	lw	%v0, 0(%sp)
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	min_caml_create_array
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
bnei_cont.47668:
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
	blti	%v0, 10, bgti_else.47669
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.47671
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47673
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47675
	addi	%v1, %v1, -10
	lw	%a0, 14(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	print_int_sub1.2629
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
	j	bgti_cont.47670
bgti_else.47675:
	addi	%v0, %zero, 3
bgti_cont.47676:
	j	bgti_cont.47670
bgti_else.47673:
	addi	%v0, %zero, 2
bgti_cont.47674:
	j	bgti_cont.47670
bgti_else.47671:
	addi	%v0, %zero, 1
bgti_cont.47672:
	j	bgti_cont.47670
bgti_else.47669:
	addi	%v0, %zero, 0
bgti_cont.47670:
	lw	%v1, 11(%sp)
	sw	%v0, 98(%sp)
	blti	%v1, 10, bgti_else.47677
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.47679
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47681
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47683
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47685
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47687
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47689
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47691
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47693
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47695
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47697
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47699
	addi	%a0, %a0, -10
	addi	%v0, %a0, 0
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	print_int_sub2.2632
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	bgti_cont.47678
bgti_else.47699:
	add	%v0, %zero, %a0
bgti_cont.47700:
	j	bgti_cont.47678
bgti_else.47697:
	add	%v0, %zero, %a0
bgti_cont.47698:
	j	bgti_cont.47678
bgti_else.47695:
	add	%v0, %zero, %a0
bgti_cont.47696:
	j	bgti_cont.47678
bgti_else.47693:
	add	%v0, %zero, %a0
bgti_cont.47694:
	j	bgti_cont.47678
bgti_else.47691:
	add	%v0, %zero, %a0
bgti_cont.47692:
	j	bgti_cont.47678
bgti_else.47689:
	add	%v0, %zero, %a0
bgti_cont.47690:
	j	bgti_cont.47678
bgti_else.47687:
	add	%v0, %zero, %a0
bgti_cont.47688:
	j	bgti_cont.47678
bgti_else.47685:
	add	%v0, %zero, %a0
bgti_cont.47686:
	j	bgti_cont.47678
bgti_else.47683:
	add	%v0, %zero, %a0
bgti_cont.47684:
	j	bgti_cont.47678
bgti_else.47681:
	add	%v0, %zero, %a0
bgti_cont.47682:
	j	bgti_cont.47678
bgti_else.47679:
	add	%v0, %zero, %a0
bgti_cont.47680:
	j	bgti_cont.47678
bgti_else.47677:
	add	%v0, %zero, %v1
bgti_cont.47678:
	lw	%v1, 98(%sp)
	blt	%zero, %v1, bgt_else.47701
	addi	%v0, %v0, 48
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	min_caml_print_char
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	bgt_cont.47702
bgt_else.47701:
	sw	%v0, 99(%sp)
	blti	%v1, 10, bgti_else.47703
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.47705
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47707
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47709
	addi	%a0, %a0, -10
	lw	%a1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 100(%sp)
	addi	%sp, %sp, 101
	jal	print_int_sub1.2629
	addi	%sp, %sp, -101
	lw	%ra, 100(%sp)
	j	bgti_cont.47704
bgti_else.47709:
	addi	%v0, %zero, 3
bgti_cont.47710:
	j	bgti_cont.47704
bgti_else.47707:
	addi	%v0, %zero, 2
bgti_cont.47708:
	j	bgti_cont.47704
bgti_else.47705:
	addi	%v0, %zero, 1
bgti_cont.47706:
	j	bgti_cont.47704
bgti_else.47703:
	addi	%v0, %zero, 0
bgti_cont.47704:
	lw	%v1, 98(%sp)
	sw	%v0, 100(%sp)
	blti	%v1, 10, bgti_else.47711
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47713
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47715
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47717
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47719
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47721
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47723
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47725
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47727
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47729
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47731
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47733
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 101(%sp)
	addi	%sp, %sp, 102
	jal	print_int_sub2.2632
	addi	%sp, %sp, -102
	lw	%ra, 101(%sp)
	j	bgti_cont.47712
bgti_else.47733:
	add	%v0, %zero, %v1
bgti_cont.47734:
	j	bgti_cont.47712
bgti_else.47731:
	add	%v0, %zero, %v1
bgti_cont.47732:
	j	bgti_cont.47712
bgti_else.47729:
	add	%v0, %zero, %v1
bgti_cont.47730:
	j	bgti_cont.47712
bgti_else.47727:
	add	%v0, %zero, %v1
bgti_cont.47728:
	j	bgti_cont.47712
bgti_else.47725:
	add	%v0, %zero, %v1
bgti_cont.47726:
	j	bgti_cont.47712
bgti_else.47723:
	add	%v0, %zero, %v1
bgti_cont.47724:
	j	bgti_cont.47712
bgti_else.47721:
	add	%v0, %zero, %v1
bgti_cont.47722:
	j	bgti_cont.47712
bgti_else.47719:
	add	%v0, %zero, %v1
bgti_cont.47720:
	j	bgti_cont.47712
bgti_else.47717:
	add	%v0, %zero, %v1
bgti_cont.47718:
	j	bgti_cont.47712
bgti_else.47715:
	add	%v0, %zero, %v1
bgti_cont.47716:
	j	bgti_cont.47712
bgti_else.47713:
	add	%v0, %zero, %v1
bgti_cont.47714:
	j	bgti_cont.47712
bgti_else.47711:
	add	%v0, %zero, %v1
bgti_cont.47712:
	lw	%v1, 100(%sp)
	blt	%zero, %v1, bgt_else.47735
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
	j	bgt_cont.47736
bgt_else.47735:
	sw	%v0, 101(%sp)
	blti	%v1, 10, bgti_else.47737
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47739
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47741
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47743
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47745
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47747
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47749
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47751
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47753
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47755
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47757
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47759
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	print_int_sub2.2632
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	j	bgti_cont.47738
bgti_else.47759:
	add	%v0, %zero, %v1
bgti_cont.47760:
	j	bgti_cont.47738
bgti_else.47757:
	add	%v0, %zero, %v1
bgti_cont.47758:
	j	bgti_cont.47738
bgti_else.47755:
	add	%v0, %zero, %v1
bgti_cont.47756:
	j	bgti_cont.47738
bgti_else.47753:
	add	%v0, %zero, %v1
bgti_cont.47754:
	j	bgti_cont.47738
bgti_else.47751:
	add	%v0, %zero, %v1
bgti_cont.47752:
	j	bgti_cont.47738
bgti_else.47749:
	add	%v0, %zero, %v1
bgti_cont.47750:
	j	bgti_cont.47738
bgti_else.47747:
	add	%v0, %zero, %v1
bgti_cont.47748:
	j	bgti_cont.47738
bgti_else.47745:
	add	%v0, %zero, %v1
bgti_cont.47746:
	j	bgti_cont.47738
bgti_else.47743:
	add	%v0, %zero, %v1
bgti_cont.47744:
	j	bgti_cont.47738
bgti_else.47741:
	add	%v0, %zero, %v1
bgti_cont.47742:
	j	bgti_cont.47738
bgti_else.47739:
	add	%v0, %zero, %v1
bgti_cont.47740:
	j	bgti_cont.47738
bgti_else.47737:
	add	%v0, %zero, %v1
bgti_cont.47738:
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
bgt_cont.47736:
bgt_cont.47702:
	addi	%v0, %zero, 32
	sw	%v0, 102(%sp)
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	min_caml_print_char
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
	lw	%v0, 155(%zero)
	sw	%v0, 103(%sp)
	blti	%v0, 10, bgti_else.47761
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.47763
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47765
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47767
	addi	%v1, %v1, -10
	lw	%a0, 14(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 104(%sp)
	addi	%sp, %sp, 105
	jal	print_int_sub1.2629
	addi	%sp, %sp, -105
	lw	%ra, 104(%sp)
	j	bgti_cont.47762
bgti_else.47767:
	addi	%v0, %zero, 3
bgti_cont.47768:
	j	bgti_cont.47762
bgti_else.47765:
	addi	%v0, %zero, 2
bgti_cont.47766:
	j	bgti_cont.47762
bgti_else.47763:
	addi	%v0, %zero, 1
bgti_cont.47764:
	j	bgti_cont.47762
bgti_else.47761:
	addi	%v0, %zero, 0
bgti_cont.47762:
	lw	%v1, 103(%sp)
	sw	%v0, 104(%sp)
	blti	%v1, 10, bgti_else.47769
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47771
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47773
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47775
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47777
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47779
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47781
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47783
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47785
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47787
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47789
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47791
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 105(%sp)
	addi	%sp, %sp, 106
	jal	print_int_sub2.2632
	addi	%sp, %sp, -106
	lw	%ra, 105(%sp)
	j	bgti_cont.47770
bgti_else.47791:
	add	%v0, %zero, %v1
bgti_cont.47792:
	j	bgti_cont.47770
bgti_else.47789:
	add	%v0, %zero, %v1
bgti_cont.47790:
	j	bgti_cont.47770
bgti_else.47787:
	add	%v0, %zero, %v1
bgti_cont.47788:
	j	bgti_cont.47770
bgti_else.47785:
	add	%v0, %zero, %v1
bgti_cont.47786:
	j	bgti_cont.47770
bgti_else.47783:
	add	%v0, %zero, %v1
bgti_cont.47784:
	j	bgti_cont.47770
bgti_else.47781:
	add	%v0, %zero, %v1
bgti_cont.47782:
	j	bgti_cont.47770
bgti_else.47779:
	add	%v0, %zero, %v1
bgti_cont.47780:
	j	bgti_cont.47770
bgti_else.47777:
	add	%v0, %zero, %v1
bgti_cont.47778:
	j	bgti_cont.47770
bgti_else.47775:
	add	%v0, %zero, %v1
bgti_cont.47776:
	j	bgti_cont.47770
bgti_else.47773:
	add	%v0, %zero, %v1
bgti_cont.47774:
	j	bgti_cont.47770
bgti_else.47771:
	add	%v0, %zero, %v1
bgti_cont.47772:
	j	bgti_cont.47770
bgti_else.47769:
	add	%v0, %zero, %v1
bgti_cont.47770:
	lw	%v1, 104(%sp)
	blt	%zero, %v1, bgt_else.47793
	addi	%v0, %v0, 48
	sw	%ra, 105(%sp)
	addi	%sp, %sp, 106
	jal	min_caml_print_char
	addi	%sp, %sp, -106
	lw	%ra, 105(%sp)
	j	bgt_cont.47794
bgt_else.47793:
	sw	%v0, 105(%sp)
	blti	%v1, 10, bgti_else.47795
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.47797
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47799
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47801
	addi	%a0, %a0, -10
	lw	%a1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 106(%sp)
	addi	%sp, %sp, 107
	jal	print_int_sub1.2629
	addi	%sp, %sp, -107
	lw	%ra, 106(%sp)
	j	bgti_cont.47796
bgti_else.47801:
	addi	%v0, %zero, 3
bgti_cont.47802:
	j	bgti_cont.47796
bgti_else.47799:
	addi	%v0, %zero, 2
bgti_cont.47800:
	j	bgti_cont.47796
bgti_else.47797:
	addi	%v0, %zero, 1
bgti_cont.47798:
	j	bgti_cont.47796
bgti_else.47795:
	addi	%v0, %zero, 0
bgti_cont.47796:
	lw	%v1, 104(%sp)
	sw	%v0, 106(%sp)
	blti	%v1, 10, bgti_else.47803
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47805
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47807
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47809
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47811
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47813
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47815
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47817
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47819
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47821
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47823
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47825
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 107(%sp)
	addi	%sp, %sp, 108
	jal	print_int_sub2.2632
	addi	%sp, %sp, -108
	lw	%ra, 107(%sp)
	j	bgti_cont.47804
bgti_else.47825:
	add	%v0, %zero, %v1
bgti_cont.47826:
	j	bgti_cont.47804
bgti_else.47823:
	add	%v0, %zero, %v1
bgti_cont.47824:
	j	bgti_cont.47804
bgti_else.47821:
	add	%v0, %zero, %v1
bgti_cont.47822:
	j	bgti_cont.47804
bgti_else.47819:
	add	%v0, %zero, %v1
bgti_cont.47820:
	j	bgti_cont.47804
bgti_else.47817:
	add	%v0, %zero, %v1
bgti_cont.47818:
	j	bgti_cont.47804
bgti_else.47815:
	add	%v0, %zero, %v1
bgti_cont.47816:
	j	bgti_cont.47804
bgti_else.47813:
	add	%v0, %zero, %v1
bgti_cont.47814:
	j	bgti_cont.47804
bgti_else.47811:
	add	%v0, %zero, %v1
bgti_cont.47812:
	j	bgti_cont.47804
bgti_else.47809:
	add	%v0, %zero, %v1
bgti_cont.47810:
	j	bgti_cont.47804
bgti_else.47807:
	add	%v0, %zero, %v1
bgti_cont.47808:
	j	bgti_cont.47804
bgti_else.47805:
	add	%v0, %zero, %v1
bgti_cont.47806:
	j	bgti_cont.47804
bgti_else.47803:
	add	%v0, %zero, %v1
bgti_cont.47804:
	lw	%v1, 106(%sp)
	blt	%zero, %v1, bgt_else.47827
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
	j	bgt_cont.47828
bgt_else.47827:
	sw	%v0, 107(%sp)
	blti	%v1, 10, bgti_else.47829
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47831
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47833
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47835
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47837
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47839
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47841
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47843
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47845
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47847
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47849
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47851
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	print_int_sub2.2632
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	j	bgti_cont.47830
bgti_else.47851:
	add	%v0, %zero, %v1
bgti_cont.47852:
	j	bgti_cont.47830
bgti_else.47849:
	add	%v0, %zero, %v1
bgti_cont.47850:
	j	bgti_cont.47830
bgti_else.47847:
	add	%v0, %zero, %v1
bgti_cont.47848:
	j	bgti_cont.47830
bgti_else.47845:
	add	%v0, %zero, %v1
bgti_cont.47846:
	j	bgti_cont.47830
bgti_else.47843:
	add	%v0, %zero, %v1
bgti_cont.47844:
	j	bgti_cont.47830
bgti_else.47841:
	add	%v0, %zero, %v1
bgti_cont.47842:
	j	bgti_cont.47830
bgti_else.47839:
	add	%v0, %zero, %v1
bgti_cont.47840:
	j	bgti_cont.47830
bgti_else.47837:
	add	%v0, %zero, %v1
bgti_cont.47838:
	j	bgti_cont.47830
bgti_else.47835:
	add	%v0, %zero, %v1
bgti_cont.47836:
	j	bgti_cont.47830
bgti_else.47833:
	add	%v0, %zero, %v1
bgti_cont.47834:
	j	bgti_cont.47830
bgti_else.47831:
	add	%v0, %zero, %v1
bgti_cont.47832:
	j	bgti_cont.47830
bgti_else.47829:
	add	%v0, %zero, %v1
bgti_cont.47830:
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
bgt_cont.47828:
bgt_cont.47794:
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
	blt	%zero, %v1, bgt_else.47853
	addi	%v0, %v0, 48
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	min_caml_print_char
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
	j	bgt_cont.47854
bgt_else.47853:
	sw	%v0, 109(%sp)
	blti	%v1, 10, bgti_else.47855
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.47857
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47859
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.47861
	addi	%a0, %a0, -10
	lw	%a1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 110(%sp)
	addi	%sp, %sp, 111
	jal	print_int_sub1.2629
	addi	%sp, %sp, -111
	lw	%ra, 110(%sp)
	j	bgti_cont.47856
bgti_else.47861:
	addi	%v0, %zero, 3
bgti_cont.47862:
	j	bgti_cont.47856
bgti_else.47859:
	addi	%v0, %zero, 2
bgti_cont.47860:
	j	bgti_cont.47856
bgti_else.47857:
	addi	%v0, %zero, 1
bgti_cont.47858:
	j	bgti_cont.47856
bgti_else.47855:
	addi	%v0, %zero, 0
bgti_cont.47856:
	lw	%v1, 108(%sp)
	sw	%v0, 110(%sp)
	blti	%v1, 10, bgti_else.47863
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47865
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47867
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47869
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47871
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47873
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47875
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47877
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47879
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47881
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47883
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47885
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 111(%sp)
	addi	%sp, %sp, 112
	jal	print_int_sub2.2632
	addi	%sp, %sp, -112
	lw	%ra, 111(%sp)
	j	bgti_cont.47864
bgti_else.47885:
	add	%v0, %zero, %v1
bgti_cont.47886:
	j	bgti_cont.47864
bgti_else.47883:
	add	%v0, %zero, %v1
bgti_cont.47884:
	j	bgti_cont.47864
bgti_else.47881:
	add	%v0, %zero, %v1
bgti_cont.47882:
	j	bgti_cont.47864
bgti_else.47879:
	add	%v0, %zero, %v1
bgti_cont.47880:
	j	bgti_cont.47864
bgti_else.47877:
	add	%v0, %zero, %v1
bgti_cont.47878:
	j	bgti_cont.47864
bgti_else.47875:
	add	%v0, %zero, %v1
bgti_cont.47876:
	j	bgti_cont.47864
bgti_else.47873:
	add	%v0, %zero, %v1
bgti_cont.47874:
	j	bgti_cont.47864
bgti_else.47871:
	add	%v0, %zero, %v1
bgti_cont.47872:
	j	bgti_cont.47864
bgti_else.47869:
	add	%v0, %zero, %v1
bgti_cont.47870:
	j	bgti_cont.47864
bgti_else.47867:
	add	%v0, %zero, %v1
bgti_cont.47868:
	j	bgti_cont.47864
bgti_else.47865:
	add	%v0, %zero, %v1
bgti_cont.47866:
	j	bgti_cont.47864
bgti_else.47863:
	add	%v0, %zero, %v1
bgti_cont.47864:
	lw	%v1, 110(%sp)
	blt	%zero, %v1, bgt_else.47887
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
	j	bgt_cont.47888
bgt_else.47887:
	sw	%v0, 111(%sp)
	blti	%v1, 10, bgti_else.47889
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47891
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47893
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47895
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47897
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47899
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47901
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47903
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47905
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47907
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47909
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.47911
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	print_int_sub2.2632
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	j	bgti_cont.47890
bgti_else.47911:
	add	%v0, %zero, %v1
bgti_cont.47912:
	j	bgti_cont.47890
bgti_else.47909:
	add	%v0, %zero, %v1
bgti_cont.47910:
	j	bgti_cont.47890
bgti_else.47907:
	add	%v0, %zero, %v1
bgti_cont.47908:
	j	bgti_cont.47890
bgti_else.47905:
	add	%v0, %zero, %v1
bgti_cont.47906:
	j	bgti_cont.47890
bgti_else.47903:
	add	%v0, %zero, %v1
bgti_cont.47904:
	j	bgti_cont.47890
bgti_else.47901:
	add	%v0, %zero, %v1
bgti_cont.47902:
	j	bgti_cont.47890
bgti_else.47899:
	add	%v0, %zero, %v1
bgti_cont.47900:
	j	bgti_cont.47890
bgti_else.47897:
	add	%v0, %zero, %v1
bgti_cont.47898:
	j	bgti_cont.47890
bgti_else.47895:
	add	%v0, %zero, %v1
bgti_cont.47896:
	j	bgti_cont.47890
bgti_else.47893:
	add	%v0, %zero, %v1
bgti_cont.47894:
	j	bgti_cont.47890
bgti_else.47891:
	add	%v0, %zero, %v1
bgti_cont.47892:
	j	bgti_cont.47890
bgti_else.47889:
	add	%v0, %zero, %v1
bgti_cont.47890:
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
bgt_cont.47888:
bgt_cont.47854:
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
	flw	%f1, 460(%zero)
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
	blti	%v1, 0, bgti_else.47913
	lw	%a0, 12(%v1)
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.47915
	beqi	%a1, 2, bnei_else.47917
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
	beqi	%a0, 0, bnei_else.47919
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
	j	bnei_cont.47920
bnei_else.47919:
bnei_cont.47920:
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
	beqi	%a0, 0, bnei_else.47921
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
	j	bnei_cont.47922
bnei_else.47921:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.47922:
	flw	%f0, 2(%sp)
	fbne	%f3, %f0, fbeq_else.47923
	addi	%v1, %zero, 1
	j	fbeq_cont.47924
fbeq_else.47923:
	addi	%v1, %zero, 0
fbeq_cont.47924:
	beqi	%v1, 0, bnei_else.47925
	j	bnei_cont.47926
bnei_else.47925:
	flw	%f1, 474(%zero)
	fdiv	%f1, %f1, %f3
	fsw	%f1, 4(%v0)
bnei_cont.47926:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
	j	bnei_cont.47916
bnei_else.47917:
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
	fblt	%f1, %f0, fbgt_else.47927
	addi	%a0, %zero, 0
	j	fbgt_cont.47928
fbgt_else.47927:
	addi	%a0, %zero, 1
fbgt_cont.47928:
	beqi	%a0, 0, bnei_else.47929
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
	j	bnei_cont.47930
bnei_else.47929:
	fsw	%f1, 0(%v0)
bnei_cont.47930:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
bnei_cont.47918:
	j	bnei_cont.47916
bnei_else.47915:
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
	fbne	%f0, %f1, fbeq_else.47931
	addi	%v1, %zero, 1
	j	fbeq_cont.47932
fbeq_else.47931:
	addi	%v1, %zero, 0
fbeq_cont.47932:
	beqi	%v1, 0, bnei_else.47933
	fsw	%f1, 1(%v0)
	j	bnei_cont.47934
bnei_else.47933:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.47935
	addi	%a1, %zero, 0
	j	fbgt_cont.47936
fbgt_else.47935:
	addi	%a1, %zero, 1
fbgt_cont.47936:
	beqi	%a0, 0, bnei_else.47937
	beqi	%a1, 0, bnei_else.47939
	addi	%a0, %zero, 0
	j	bnei_cont.47938
bnei_else.47939:
	addi	%a0, %zero, 1
bnei_cont.47940:
	j	bnei_cont.47938
bnei_else.47937:
	add	%a0, %zero, %a1
bnei_cont.47938:
	lw	%a1, 4(%v1)
	flw	%f2, 0(%a1)
	beqi	%a0, 0, bnei_else.47941
	j	bnei_cont.47942
bnei_else.47941:
	fneg	%f2, %f2
bnei_cont.47942:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.47934:
	flw	%f0, 185(%zero)
	fbne	%f0, %f1, fbeq_else.47943
	addi	%v1, %zero, 1
	j	fbeq_cont.47944
fbeq_else.47943:
	addi	%v1, %zero, 0
fbeq_cont.47944:
	beqi	%v1, 0, bnei_else.47945
	fsw	%f1, 3(%v0)
	j	bnei_cont.47946
bnei_else.47945:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.47947
	addi	%a1, %zero, 0
	j	fbgt_cont.47948
fbgt_else.47947:
	addi	%a1, %zero, 1
fbgt_cont.47948:
	beqi	%a0, 0, bnei_else.47949
	beqi	%a1, 0, bnei_else.47951
	addi	%a0, %zero, 0
	j	bnei_cont.47950
bnei_else.47951:
	addi	%a0, %zero, 1
bnei_cont.47952:
	j	bnei_cont.47950
bnei_else.47949:
	add	%a0, %zero, %a1
bnei_cont.47950:
	lw	%a1, 4(%v1)
	flw	%f2, 1(%a1)
	beqi	%a0, 0, bnei_else.47953
	j	bnei_cont.47954
bnei_else.47953:
	fneg	%f2, %f2
bnei_cont.47954:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.47946:
	flw	%f0, 186(%zero)
	fbne	%f0, %f1, fbeq_else.47955
	addi	%v1, %zero, 1
	j	fbeq_cont.47956
fbeq_else.47955:
	addi	%v1, %zero, 0
fbeq_cont.47956:
	beqi	%v1, 0, bnei_else.47957
	fsw	%f1, 5(%v0)
	j	bnei_cont.47958
bnei_else.47957:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.47959
	addi	%a1, %zero, 0
	j	fbgt_cont.47960
fbgt_else.47959:
	addi	%a1, %zero, 1
fbgt_cont.47960:
	beqi	%a0, 0, bnei_else.47961
	beqi	%a1, 0, bnei_else.47963
	addi	%a0, %zero, 0
	j	bnei_cont.47962
bnei_else.47963:
	addi	%a0, %zero, 1
bnei_cont.47964:
	j	bnei_cont.47962
bnei_else.47961:
	add	%a0, %zero, %a1
bnei_cont.47962:
	lw	%v1, 4(%v1)
	flw	%f2, 2(%v1)
	beqi	%a0, 0, bnei_else.47965
	j	bnei_cont.47966
bnei_else.47965:
	fneg	%f2, %f2
bnei_cont.47966:
	fsw	%f2, 4(%v0)
	flw	%f2, 474(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 5(%v0)
bnei_cont.47958:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
bnei_cont.47916:
	addi	%v0, %v1, -1
	addi	%a0, %zero, 247
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 121(%sp)
	addi	%sp, %sp, 122
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -122
	lw	%ra, 121(%sp)
	j	bgti_cont.47914
bgti_else.47913:
bgti_cont.47914:
	lw	%v0, 119(%sp)
	blti	%v0, 0, bgti_else.47967
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.47969
	j	bgti_cont.47968
bnei_else.47969:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 474(%zero)
	fblt	%f0, %f1, fbgt_else.47971
	addi	%a0, %zero, 0
	j	fbgt_cont.47972
fbgt_else.47971:
	addi	%a0, %zero, 1
fbgt_cont.47972:
	beqi	%a0, 0, bnei_else.47973
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.47975
	beqi	%a0, 2, bnei_else.47977
	j	bnei_cont.47974
bnei_else.47977:
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
bnei_cont.47978:
	j	bnei_cont.47974
bnei_else.47975:
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
bnei_cont.47976:
	j	bnei_cont.47974
bnei_else.47973:
bnei_cont.47974:
bnei_cont.47970:
	j	bgti_cont.47968
bgti_else.47967:
bgti_cont.47968:
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
