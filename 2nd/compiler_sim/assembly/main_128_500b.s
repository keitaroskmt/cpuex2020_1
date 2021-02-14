.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 495
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
	fblt	%f0, %f1, fbgt_else.41264
	flw	%f2, 494(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41265
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41266
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41267
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41268
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41269
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41270
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41271
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41272
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41273
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41274
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41275
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41276
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41277
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41278
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.41279
	fmul	%f1, %f2, %f1
	j	reduction_2pi_sub1.2614
fbgt_else.41279:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41278:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41277:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41276:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41275:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41274:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41273:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41272:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41271:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41270:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41269:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41268:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41267:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41266:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41265:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.41264:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.2617:
	fblt	%f0, %f2, fbgt_else.41280
	fblt	%f0, %f1, fbgt_else.41281
	fsub	%f0, %f0, %f1
	flw	%f3, 494(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41282
	fblt	%f0, %f1, fbgt_else.41283
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41284
	fblt	%f0, %f1, fbgt_else.41285
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41286
	fblt	%f0, %f1, fbgt_else.41287
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41287:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41286:
	jr	%ra
fbgt_else.41285:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41288
	fblt	%f0, %f1, fbgt_else.41289
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41289:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41288:
	jr	%ra
fbgt_else.41284:
	jr	%ra
fbgt_else.41283:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41290
	fblt	%f0, %f1, fbgt_else.41291
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41292
	fblt	%f0, %f1, fbgt_else.41293
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41293:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41292:
	jr	%ra
fbgt_else.41291:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41294
	fblt	%f0, %f1, fbgt_else.41295
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41295:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41294:
	jr	%ra
fbgt_else.41290:
	jr	%ra
fbgt_else.41282:
	jr	%ra
fbgt_else.41281:
	flw	%f3, 494(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41296
	fblt	%f0, %f1, fbgt_else.41297
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41298
	fblt	%f0, %f1, fbgt_else.41299
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41300
	fblt	%f0, %f1, fbgt_else.41301
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41301:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41300:
	jr	%ra
fbgt_else.41299:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41302
	fblt	%f0, %f1, fbgt_else.41303
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41303:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41302:
	jr	%ra
fbgt_else.41298:
	jr	%ra
fbgt_else.41297:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41304
	fblt	%f0, %f1, fbgt_else.41305
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41306
	fblt	%f0, %f1, fbgt_else.41307
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41307:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41306:
	jr	%ra
fbgt_else.41305:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.41308
	fblt	%f0, %f1, fbgt_else.41309
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41309:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.2617
fbgt_else.41308:
	jr	%ra
fbgt_else.41304:
	jr	%ra
fbgt_else.41296:
	jr	%ra
fbgt_else.41280:
	jr	%ra
print_int_sub1.2629:
	blti	%v0, 10, bgti_else.41310
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.41311
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.41312
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.41313
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.41314
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.41315
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.41316
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	blti	%v0, 10, bgti_else.41317
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2629
bgti_else.41317:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.41316:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.41315:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.41314:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.41313:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.41312:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.41311:
	add	%v0, %zero, %v1
	jr	%ra
bgti_else.41310:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2632:
	blti	%v0, 10, bgti_else.41318
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41319
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41320
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41321
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41322
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41323
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41324
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41325
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41326
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41327
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41328
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41329
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41330
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41331
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41332
	addi	%v0, %v0, -10
	blti	%v0, 10, bgti_else.41333
	addi	%v0, %v0, -10
	j	print_int_sub2.2632
bgti_else.41333:
	jr	%ra
bgti_else.41332:
	jr	%ra
bgti_else.41331:
	jr	%ra
bgti_else.41330:
	jr	%ra
bgti_else.41329:
	jr	%ra
bgti_else.41328:
	jr	%ra
bgti_else.41327:
	jr	%ra
bgti_else.41326:
	jr	%ra
bgti_else.41325:
	jr	%ra
bgti_else.41324:
	jr	%ra
bgti_else.41323:
	jr	%ra
bgti_else.41322:
	jr	%ra
bgti_else.41321:
	jr	%ra
bgti_else.41320:
	jr	%ra
bgti_else.41319:
	jr	%ra
bgti_else.41318:
	jr	%ra
read_object.2772:
	blti	%v0, 60, bgti_else.44361
	jr	%ra
bgti_else.44361:
	sw	%v0, 0(%sp)
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	min_caml_read_int
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	beqi	%v0, -1, bnei_else.44363
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
	flw	%f0, 493(%zero)
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
	fblt	%f0, %f1, fbgt_else.44365
	addi	%v0, %zero, 0
	j	fbgt_cont.44366
fbgt_else.44365:
	addi	%v0, %zero, 1
fbgt_cont.44366:
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
	beqi	%v1, 0, bnei_else.44367
	sw	%v0, 13(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	min_caml_read_float
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 492(%zero)
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
	j	bnei_cont.44368
bnei_else.44367:
bnei_cont.44368:
	lw	%v1, 2(%sp)
	beqi	%v1, 2, bnei_else.44369
	lw	%a0, 10(%sp)
	j	bnei_cont.44370
bnei_else.44369:
	addi	%a0, %zero, 1
bnei_cont.44370:
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
	beqi	%a2, 3, bnei_else.44371
	beqi	%a2, 2, bnei_else.44373
	j	bnei_cont.44372
bnei_else.44373:
	lw	%v1, 10(%sp)
	beqi	%v1, 0, bnei_else.44375
	addi	%v1, %zero, 0
	j	bnei_cont.44376
bnei_else.44375:
	addi	%v1, %zero, 1
bnei_cont.44376:
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
	fbne	%f1, %f4, fbeq_else.44377
	addi	%a2, %zero, 1
	j	fbeq_cont.44378
fbeq_else.44377:
	addi	%a2, %zero, 0
fbeq_cont.44378:
	beqi	%a2, 0, bnei_else.44379
	flw	%f1, 491(%zero)
	j	bnei_cont.44380
bnei_else.44379:
	beqi	%v1, 0, bnei_else.44381
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.44382
bnei_else.44381:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.44382:
bnei_cont.44380:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.44374:
	j	bnei_cont.44372
bnei_else.44371:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	fbne	%f0, %f1, fbeq_else.44383
	addi	%v1, %zero, 1
	j	fbeq_cont.44384
fbeq_else.44383:
	addi	%v1, %zero, 0
fbeq_cont.44384:
	beqi	%v1, 0, bnei_else.44385
	fmov	%f0, %f1
	j	bnei_cont.44386
bnei_else.44385:
	fbne	%f0, %f1, fbeq_else.44387
	addi	%v1, %zero, 1
	j	fbeq_cont.44388
fbeq_else.44387:
	addi	%v1, %zero, 0
fbeq_cont.44388:
	beqi	%v1, 0, bnei_else.44389
	fmov	%f2, %f1
	j	bnei_cont.44390
bnei_else.44389:
	fblt	%f1, %f0, fbgt_else.44391
	addi	%v1, %zero, 0
	j	fbgt_cont.44392
fbgt_else.44391:
	addi	%v1, %zero, 1
fbgt_cont.44392:
	beqi	%v1, 0, bnei_else.44393
	flw	%f2, 491(%zero)
	j	bnei_cont.44394
bnei_else.44393:
	flw	%f2, 490(%zero)
bnei_cont.44394:
bnei_cont.44390:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.44386:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.44395
	addi	%v1, %zero, 1
	j	fbeq_cont.44396
fbeq_else.44395:
	addi	%v1, %zero, 0
fbeq_cont.44396:
	beqi	%v1, 0, bnei_else.44397
	fmov	%f0, %f1
	j	bnei_cont.44398
bnei_else.44397:
	fbne	%f0, %f1, fbeq_else.44399
	addi	%v1, %zero, 1
	j	fbeq_cont.44400
fbeq_else.44399:
	addi	%v1, %zero, 0
fbeq_cont.44400:
	beqi	%v1, 0, bnei_else.44401
	fmov	%f2, %f1
	j	bnei_cont.44402
bnei_else.44401:
	fblt	%f1, %f0, fbgt_else.44403
	addi	%v1, %zero, 0
	j	fbgt_cont.44404
fbgt_else.44403:
	addi	%v1, %zero, 1
fbgt_cont.44404:
	beqi	%v1, 0, bnei_else.44405
	flw	%f2, 491(%zero)
	j	bnei_cont.44406
bnei_else.44405:
	flw	%f2, 490(%zero)
bnei_cont.44406:
bnei_cont.44402:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.44398:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.44407
	addi	%v1, %zero, 1
	j	fbeq_cont.44408
fbeq_else.44407:
	addi	%v1, %zero, 0
fbeq_cont.44408:
	beqi	%v1, 0, bnei_else.44409
	fmov	%f0, %f1
	j	bnei_cont.44410
bnei_else.44409:
	fbne	%f0, %f1, fbeq_else.44411
	addi	%v1, %zero, 1
	j	fbeq_cont.44412
fbeq_else.44411:
	addi	%v1, %zero, 0
fbeq_cont.44412:
	beqi	%v1, 0, bnei_else.44413
	fmov	%f2, %f1
	j	bnei_cont.44414
bnei_else.44413:
	fblt	%f1, %f0, fbgt_else.44415
	addi	%v1, %zero, 0
	j	fbgt_cont.44416
fbgt_else.44415:
	addi	%v1, %zero, 1
fbgt_cont.44416:
	beqi	%v1, 0, bnei_else.44417
	flw	%f2, 491(%zero)
	j	bnei_cont.44418
bnei_else.44417:
	flw	%f2, 490(%zero)
bnei_cont.44418:
bnei_cont.44414:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.44410:
	fsw	%f0, 2(%a0)
bnei_cont.44372:
	beqi	%a1, 0, bnei_else.44419
	flw	%f0, 0(%v0)
	flw	%f1, 489(%zero)
	fabs	%f2, %f0
	flw	%f3, 488(%zero)
	fsw	%f0, 16(%sp)
	fsw	%f1, 17(%sp)
	fsw	%f2, 18(%sp)
	fsw	%f3, 19(%sp)
	fblt	%f2, %f3, fbgt_else.44421
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.44423
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.44425
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.44427
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.44429
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.44431
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.44433
	flw	%f4, 481(%zero)
	fblt	%f2, %f4, fbgt_else.44435
	flw	%f4, 480(%zero)
	fblt	%f2, %f4, fbgt_else.44437
	flw	%f4, 479(%zero)
	fblt	%f2, %f4, fbgt_else.44439
	flw	%f4, 478(%zero)
	fblt	%f2, %f4, fbgt_else.44441
	flw	%f4, 477(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.44422
fbgt_else.44441:
	fmov	%f0, %f4
fbgt_cont.44442:
	j	fbgt_cont.44422
fbgt_else.44439:
	fmov	%f0, %f4
fbgt_cont.44440:
	j	fbgt_cont.44422
fbgt_else.44437:
	fmov	%f0, %f4
fbgt_cont.44438:
	j	fbgt_cont.44422
fbgt_else.44435:
	fmov	%f0, %f4
fbgt_cont.44436:
	j	fbgt_cont.44422
fbgt_else.44433:
	fmov	%f0, %f4
fbgt_cont.44434:
	j	fbgt_cont.44422
fbgt_else.44431:
	fmov	%f0, %f4
fbgt_cont.44432:
	j	fbgt_cont.44422
fbgt_else.44429:
	fmov	%f0, %f4
fbgt_cont.44430:
	j	fbgt_cont.44422
fbgt_else.44427:
	fmov	%f0, %f4
fbgt_cont.44428:
	j	fbgt_cont.44422
fbgt_else.44425:
	fmov	%f0, %f4
fbgt_cont.44426:
	j	fbgt_cont.44422
fbgt_else.44423:
	fmov	%f0, %f4
fbgt_cont.44424:
	j	fbgt_cont.44422
fbgt_else.44421:
	fmov	%f0, %f3
fbgt_cont.44422:
	flw	%f1, 18(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.44443
	fblt	%f1, %f0, fbgt_else.44445
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44447
	fblt	%f1, %f0, fbgt_else.44449
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44451
	fblt	%f1, %f0, fbgt_else.44453
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.44444
fbgt_else.44453:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.44454:
	j	fbgt_cont.44444
fbgt_else.44451:
	fmov	%f0, %f1
fbgt_cont.44452:
	j	fbgt_cont.44444
fbgt_else.44449:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44455
	fblt	%f1, %f0, fbgt_else.44457
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.44456
fbgt_else.44457:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.44458:
	j	fbgt_cont.44456
fbgt_else.44455:
	fmov	%f0, %f1
fbgt_cont.44456:
fbgt_cont.44450:
	j	fbgt_cont.44444
fbgt_else.44447:
	fmov	%f0, %f1
fbgt_cont.44448:
	j	fbgt_cont.44444
fbgt_else.44445:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44459
	fblt	%f1, %f0, fbgt_else.44461
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44463
	fblt	%f1, %f0, fbgt_else.44465
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.44460
fbgt_else.44465:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.44466:
	j	fbgt_cont.44460
fbgt_else.44463:
	fmov	%f0, %f1
fbgt_cont.44464:
	j	fbgt_cont.44460
fbgt_else.44461:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44467
	fblt	%f1, %f0, fbgt_else.44469
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	fbgt_cont.44468
fbgt_else.44469:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
fbgt_cont.44470:
	j	fbgt_cont.44468
fbgt_else.44467:
	fmov	%f0, %f1
fbgt_cont.44468:
fbgt_cont.44462:
	j	fbgt_cont.44460
fbgt_else.44459:
	fmov	%f0, %f1
fbgt_cont.44460:
fbgt_cont.44446:
	j	fbgt_cont.44444
fbgt_else.44443:
	fmov	%f0, %f1
fbgt_cont.44444:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.44471
	addi	%v0, %zero, 0
	j	fbgt_cont.44472
fbgt_else.44471:
	addi	%v0, %zero, 1
fbgt_cont.44472:
	fblt	%f0, %f1, fbgt_else.44473
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44474
fbgt_else.44473:
fbgt_cont.44474:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.44475
	beqi	%v0, 0, bnei_else.44477
	addi	%v0, %zero, 0
	j	fbgt_cont.44476
bnei_else.44477:
	addi	%v0, %zero, 1
bnei_cont.44478:
	j	fbgt_cont.44476
fbgt_else.44475:
fbgt_cont.44476:
	fblt	%f0, %f2, fbgt_else.44479
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44480
fbgt_else.44479:
fbgt_cont.44480:
	flw	%f3, 475(%zero)
	fblt	%f3, %f0, fbgt_else.44481
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.44482
fbgt_else.44481:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.44482:
	beqi	%v0, 0, bnei_else.44483
	j	bnei_cont.44484
bnei_else.44483:
	fneg	%f0, %f0
bnei_cont.44484:
	flw	%f4, 16(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.44485
	addi	%v0, %zero, 1
	j	fbgt_cont.44486
fbgt_else.44485:
	addi	%v0, %zero, 0
fbgt_cont.44486:
	fabs	%f4, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 20(%sp)
	fsw	%f3, 21(%sp)
	fsw	%f2, 22(%sp)
	sw	%v0, 23(%sp)
	fsw	%f4, 24(%sp)
	fblt	%f4, %f6, fbgt_else.44487
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.44489
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.44491
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.44493
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.44495
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.44497
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.44499
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.44501
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.44503
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.44505
	flw	%f7, 478(%zero)
	fblt	%f4, %f7, fbgt_else.44507
	flw	%f7, 477(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.44488
fbgt_else.44507:
	fmov	%f0, %f7
fbgt_cont.44508:
	j	fbgt_cont.44488
fbgt_else.44505:
	fmov	%f0, %f7
fbgt_cont.44506:
	j	fbgt_cont.44488
fbgt_else.44503:
	fmov	%f0, %f7
fbgt_cont.44504:
	j	fbgt_cont.44488
fbgt_else.44501:
	fmov	%f0, %f7
fbgt_cont.44502:
	j	fbgt_cont.44488
fbgt_else.44499:
	fmov	%f0, %f7
fbgt_cont.44500:
	j	fbgt_cont.44488
fbgt_else.44497:
	fmov	%f0, %f7
fbgt_cont.44498:
	j	fbgt_cont.44488
fbgt_else.44495:
	fmov	%f0, %f7
fbgt_cont.44496:
	j	fbgt_cont.44488
fbgt_else.44493:
	fmov	%f0, %f7
fbgt_cont.44494:
	j	fbgt_cont.44488
fbgt_else.44491:
	fmov	%f0, %f7
fbgt_cont.44492:
	j	fbgt_cont.44488
fbgt_else.44489:
	fmov	%f0, %f7
fbgt_cont.44490:
	j	fbgt_cont.44488
fbgt_else.44487:
	fmov	%f0, %f6
fbgt_cont.44488:
	flw	%f1, 24(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.44509
	fblt	%f1, %f0, fbgt_else.44511
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44513
	fblt	%f1, %f0, fbgt_else.44515
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44517
	fblt	%f1, %f0, fbgt_else.44519
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
	j	fbgt_cont.44510
fbgt_else.44519:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.44520:
	j	fbgt_cont.44510
fbgt_else.44517:
	fmov	%f0, %f1
fbgt_cont.44518:
	j	fbgt_cont.44510
fbgt_else.44515:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44521
	fblt	%f1, %f0, fbgt_else.44523
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
	j	fbgt_cont.44522
fbgt_else.44523:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.44524:
	j	fbgt_cont.44522
fbgt_else.44521:
	fmov	%f0, %f1
fbgt_cont.44522:
fbgt_cont.44516:
	j	fbgt_cont.44510
fbgt_else.44513:
	fmov	%f0, %f1
fbgt_cont.44514:
	j	fbgt_cont.44510
fbgt_else.44511:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44525
	fblt	%f1, %f0, fbgt_else.44527
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44529
	fblt	%f1, %f0, fbgt_else.44531
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
	j	fbgt_cont.44526
fbgt_else.44531:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.44532:
	j	fbgt_cont.44526
fbgt_else.44529:
	fmov	%f0, %f1
fbgt_cont.44530:
	j	fbgt_cont.44526
fbgt_else.44527:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44533
	fblt	%f1, %f0, fbgt_else.44535
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
	j	fbgt_cont.44534
fbgt_else.44535:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.44536:
	j	fbgt_cont.44534
fbgt_else.44533:
	fmov	%f0, %f1
fbgt_cont.44534:
fbgt_cont.44528:
	j	fbgt_cont.44526
fbgt_else.44525:
	fmov	%f0, %f1
fbgt_cont.44526:
fbgt_cont.44512:
	j	fbgt_cont.44510
fbgt_else.44509:
	fmov	%f0, %f1
fbgt_cont.44510:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.44537
	lw	%v0, 23(%sp)
	beqi	%v0, 0, bnei_else.44539
	addi	%v0, %zero, 0
	j	fbgt_cont.44538
bnei_else.44539:
	addi	%v0, %zero, 1
bnei_cont.44540:
	j	fbgt_cont.44538
fbgt_else.44537:
	lw	%v0, 23(%sp)
fbgt_cont.44538:
	fblt	%f0, %f1, fbgt_else.44541
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44542
fbgt_else.44541:
fbgt_cont.44542:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.44543
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44544
fbgt_else.44543:
fbgt_cont.44544:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.44545
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.44546
fbgt_else.44545:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.44546:
	beqi	%v0, 0, bnei_else.44547
	j	bnei_cont.44548
bnei_else.44547:
	fneg	%f0, %f0
bnei_cont.44548:
	lw	%v0, 13(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f4, 26(%sp)
	fsw	%f5, 27(%sp)
	fblt	%f5, %f6, fbgt_else.44549
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.44551
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.44553
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.44555
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.44557
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.44559
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.44561
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.44563
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.44565
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.44567
	flw	%f7, 478(%zero)
	fblt	%f5, %f7, fbgt_else.44569
	flw	%f7, 477(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.44550
fbgt_else.44569:
	fmov	%f0, %f7
fbgt_cont.44570:
	j	fbgt_cont.44550
fbgt_else.44567:
	fmov	%f0, %f7
fbgt_cont.44568:
	j	fbgt_cont.44550
fbgt_else.44565:
	fmov	%f0, %f7
fbgt_cont.44566:
	j	fbgt_cont.44550
fbgt_else.44563:
	fmov	%f0, %f7
fbgt_cont.44564:
	j	fbgt_cont.44550
fbgt_else.44561:
	fmov	%f0, %f7
fbgt_cont.44562:
	j	fbgt_cont.44550
fbgt_else.44559:
	fmov	%f0, %f7
fbgt_cont.44560:
	j	fbgt_cont.44550
fbgt_else.44557:
	fmov	%f0, %f7
fbgt_cont.44558:
	j	fbgt_cont.44550
fbgt_else.44555:
	fmov	%f0, %f7
fbgt_cont.44556:
	j	fbgt_cont.44550
fbgt_else.44553:
	fmov	%f0, %f7
fbgt_cont.44554:
	j	fbgt_cont.44550
fbgt_else.44551:
	fmov	%f0, %f7
fbgt_cont.44552:
	j	fbgt_cont.44550
fbgt_else.44549:
	fmov	%f0, %f6
fbgt_cont.44550:
	flw	%f1, 27(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.44571
	fblt	%f1, %f0, fbgt_else.44573
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44575
	fblt	%f1, %f0, fbgt_else.44577
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44579
	fblt	%f1, %f0, fbgt_else.44581
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.44572
fbgt_else.44581:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.44582:
	j	fbgt_cont.44572
fbgt_else.44579:
	fmov	%f0, %f1
fbgt_cont.44580:
	j	fbgt_cont.44572
fbgt_else.44577:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44583
	fblt	%f1, %f0, fbgt_else.44585
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.44584
fbgt_else.44585:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.44586:
	j	fbgt_cont.44584
fbgt_else.44583:
	fmov	%f0, %f1
fbgt_cont.44584:
fbgt_cont.44578:
	j	fbgt_cont.44572
fbgt_else.44575:
	fmov	%f0, %f1
fbgt_cont.44576:
	j	fbgt_cont.44572
fbgt_else.44573:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44587
	fblt	%f1, %f0, fbgt_else.44589
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44591
	fblt	%f1, %f0, fbgt_else.44593
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.44588
fbgt_else.44593:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.44594:
	j	fbgt_cont.44588
fbgt_else.44591:
	fmov	%f0, %f1
fbgt_cont.44592:
	j	fbgt_cont.44588
fbgt_else.44589:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44595
	fblt	%f1, %f0, fbgt_else.44597
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	fbgt_cont.44596
fbgt_else.44597:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
fbgt_cont.44598:
	j	fbgt_cont.44596
fbgt_else.44595:
	fmov	%f0, %f1
fbgt_cont.44596:
fbgt_cont.44590:
	j	fbgt_cont.44588
fbgt_else.44587:
	fmov	%f0, %f1
fbgt_cont.44588:
fbgt_cont.44574:
	j	fbgt_cont.44572
fbgt_else.44571:
	fmov	%f0, %f1
fbgt_cont.44572:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.44599
	addi	%v0, %zero, 0
	j	fbgt_cont.44600
fbgt_else.44599:
	addi	%v0, %zero, 1
fbgt_cont.44600:
	fblt	%f0, %f1, fbgt_else.44601
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44602
fbgt_else.44601:
fbgt_cont.44602:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.44603
	beqi	%v0, 0, bnei_else.44605
	addi	%v0, %zero, 0
	j	fbgt_cont.44604
bnei_else.44605:
	addi	%v0, %zero, 1
bnei_cont.44606:
	j	fbgt_cont.44604
fbgt_else.44603:
fbgt_cont.44604:
	fblt	%f0, %f2, fbgt_else.44607
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44608
fbgt_else.44607:
fbgt_cont.44608:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.44609
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.44610
fbgt_else.44609:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.44610:
	beqi	%v0, 0, bnei_else.44611
	j	bnei_cont.44612
bnei_else.44611:
	fneg	%f0, %f0
bnei_cont.44612:
	flw	%f4, 26(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.44613
	addi	%v0, %zero, 1
	j	fbgt_cont.44614
fbgt_else.44613:
	addi	%v0, %zero, 0
fbgt_cont.44614:
	fabs	%f4, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 28(%sp)
	sw	%v0, 29(%sp)
	fsw	%f4, 30(%sp)
	fblt	%f4, %f6, fbgt_else.44615
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.44617
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.44619
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.44621
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.44623
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.44625
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.44627
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.44629
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.44631
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.44633
	flw	%f7, 478(%zero)
	fblt	%f4, %f7, fbgt_else.44635
	flw	%f7, 477(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.44616
fbgt_else.44635:
	fmov	%f0, %f7
fbgt_cont.44636:
	j	fbgt_cont.44616
fbgt_else.44633:
	fmov	%f0, %f7
fbgt_cont.44634:
	j	fbgt_cont.44616
fbgt_else.44631:
	fmov	%f0, %f7
fbgt_cont.44632:
	j	fbgt_cont.44616
fbgt_else.44629:
	fmov	%f0, %f7
fbgt_cont.44630:
	j	fbgt_cont.44616
fbgt_else.44627:
	fmov	%f0, %f7
fbgt_cont.44628:
	j	fbgt_cont.44616
fbgt_else.44625:
	fmov	%f0, %f7
fbgt_cont.44626:
	j	fbgt_cont.44616
fbgt_else.44623:
	fmov	%f0, %f7
fbgt_cont.44624:
	j	fbgt_cont.44616
fbgt_else.44621:
	fmov	%f0, %f7
fbgt_cont.44622:
	j	fbgt_cont.44616
fbgt_else.44619:
	fmov	%f0, %f7
fbgt_cont.44620:
	j	fbgt_cont.44616
fbgt_else.44617:
	fmov	%f0, %f7
fbgt_cont.44618:
	j	fbgt_cont.44616
fbgt_else.44615:
	fmov	%f0, %f6
fbgt_cont.44616:
	flw	%f1, 30(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.44637
	fblt	%f1, %f0, fbgt_else.44639
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44641
	fblt	%f1, %f0, fbgt_else.44643
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44645
	fblt	%f1, %f0, fbgt_else.44647
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.44638
fbgt_else.44647:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.44648:
	j	fbgt_cont.44638
fbgt_else.44645:
	fmov	%f0, %f1
fbgt_cont.44646:
	j	fbgt_cont.44638
fbgt_else.44643:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44649
	fblt	%f1, %f0, fbgt_else.44651
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.44650
fbgt_else.44651:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.44652:
	j	fbgt_cont.44650
fbgt_else.44649:
	fmov	%f0, %f1
fbgt_cont.44650:
fbgt_cont.44644:
	j	fbgt_cont.44638
fbgt_else.44641:
	fmov	%f0, %f1
fbgt_cont.44642:
	j	fbgt_cont.44638
fbgt_else.44639:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44653
	fblt	%f1, %f0, fbgt_else.44655
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44657
	fblt	%f1, %f0, fbgt_else.44659
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.44654
fbgt_else.44659:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.44660:
	j	fbgt_cont.44654
fbgt_else.44657:
	fmov	%f0, %f1
fbgt_cont.44658:
	j	fbgt_cont.44654
fbgt_else.44655:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44661
	fblt	%f1, %f0, fbgt_else.44663
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	fbgt_cont.44662
fbgt_else.44663:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
fbgt_cont.44664:
	j	fbgt_cont.44662
fbgt_else.44661:
	fmov	%f0, %f1
fbgt_cont.44662:
fbgt_cont.44656:
	j	fbgt_cont.44654
fbgt_else.44653:
	fmov	%f0, %f1
fbgt_cont.44654:
fbgt_cont.44640:
	j	fbgt_cont.44638
fbgt_else.44637:
	fmov	%f0, %f1
fbgt_cont.44638:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.44665
	lw	%v0, 29(%sp)
	beqi	%v0, 0, bnei_else.44667
	addi	%v0, %zero, 0
	j	fbgt_cont.44666
bnei_else.44667:
	addi	%v0, %zero, 1
bnei_cont.44668:
	j	fbgt_cont.44666
fbgt_else.44665:
	lw	%v0, 29(%sp)
fbgt_cont.44666:
	fblt	%f0, %f1, fbgt_else.44669
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44670
fbgt_else.44669:
fbgt_cont.44670:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.44671
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44672
fbgt_else.44671:
fbgt_cont.44672:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.44673
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.44674
fbgt_else.44673:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.44674:
	beqi	%v0, 0, bnei_else.44675
	j	bnei_cont.44676
bnei_else.44675:
	fneg	%f0, %f0
bnei_cont.44676:
	lw	%v0, 13(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 31(%sp)
	fsw	%f4, 32(%sp)
	fsw	%f5, 33(%sp)
	fblt	%f5, %f6, fbgt_else.44677
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.44679
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.44681
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.44683
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.44685
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.44687
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.44689
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.44691
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.44693
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.44695
	flw	%f7, 478(%zero)
	fblt	%f5, %f7, fbgt_else.44697
	flw	%f7, 477(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.44678
fbgt_else.44697:
	fmov	%f0, %f7
fbgt_cont.44698:
	j	fbgt_cont.44678
fbgt_else.44695:
	fmov	%f0, %f7
fbgt_cont.44696:
	j	fbgt_cont.44678
fbgt_else.44693:
	fmov	%f0, %f7
fbgt_cont.44694:
	j	fbgt_cont.44678
fbgt_else.44691:
	fmov	%f0, %f7
fbgt_cont.44692:
	j	fbgt_cont.44678
fbgt_else.44689:
	fmov	%f0, %f7
fbgt_cont.44690:
	j	fbgt_cont.44678
fbgt_else.44687:
	fmov	%f0, %f7
fbgt_cont.44688:
	j	fbgt_cont.44678
fbgt_else.44685:
	fmov	%f0, %f7
fbgt_cont.44686:
	j	fbgt_cont.44678
fbgt_else.44683:
	fmov	%f0, %f7
fbgt_cont.44684:
	j	fbgt_cont.44678
fbgt_else.44681:
	fmov	%f0, %f7
fbgt_cont.44682:
	j	fbgt_cont.44678
fbgt_else.44679:
	fmov	%f0, %f7
fbgt_cont.44680:
	j	fbgt_cont.44678
fbgt_else.44677:
	fmov	%f0, %f6
fbgt_cont.44678:
	flw	%f1, 33(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.44699
	fblt	%f1, %f0, fbgt_else.44701
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44703
	fblt	%f1, %f0, fbgt_else.44705
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44707
	fblt	%f1, %f0, fbgt_else.44709
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.44700
fbgt_else.44709:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.44710:
	j	fbgt_cont.44700
fbgt_else.44707:
	fmov	%f0, %f1
fbgt_cont.44708:
	j	fbgt_cont.44700
fbgt_else.44705:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44711
	fblt	%f1, %f0, fbgt_else.44713
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.44712
fbgt_else.44713:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.44714:
	j	fbgt_cont.44712
fbgt_else.44711:
	fmov	%f0, %f1
fbgt_cont.44712:
fbgt_cont.44706:
	j	fbgt_cont.44700
fbgt_else.44703:
	fmov	%f0, %f1
fbgt_cont.44704:
	j	fbgt_cont.44700
fbgt_else.44701:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44715
	fblt	%f1, %f0, fbgt_else.44717
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44719
	fblt	%f1, %f0, fbgt_else.44721
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.44716
fbgt_else.44721:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.44722:
	j	fbgt_cont.44716
fbgt_else.44719:
	fmov	%f0, %f1
fbgt_cont.44720:
	j	fbgt_cont.44716
fbgt_else.44717:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44723
	fblt	%f1, %f0, fbgt_else.44725
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.44724
fbgt_else.44725:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.44726:
	j	fbgt_cont.44724
fbgt_else.44723:
	fmov	%f0, %f1
fbgt_cont.44724:
fbgt_cont.44718:
	j	fbgt_cont.44716
fbgt_else.44715:
	fmov	%f0, %f1
fbgt_cont.44716:
fbgt_cont.44702:
	j	fbgt_cont.44700
fbgt_else.44699:
	fmov	%f0, %f1
fbgt_cont.44700:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.44727
	addi	%v0, %zero, 0
	j	fbgt_cont.44728
fbgt_else.44727:
	addi	%v0, %zero, 1
fbgt_cont.44728:
	fblt	%f0, %f1, fbgt_else.44729
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44730
fbgt_else.44729:
fbgt_cont.44730:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.44731
	beqi	%v0, 0, bnei_else.44733
	addi	%v0, %zero, 0
	j	fbgt_cont.44732
bnei_else.44733:
	addi	%v0, %zero, 1
bnei_cont.44734:
	j	fbgt_cont.44732
fbgt_else.44731:
fbgt_cont.44732:
	fblt	%f0, %f2, fbgt_else.44735
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44736
fbgt_else.44735:
fbgt_cont.44736:
	flw	%f3, 21(%sp)
	fblt	%f3, %f0, fbgt_else.44737
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.44738
fbgt_else.44737:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.44738:
	beqi	%v0, 0, bnei_else.44739
	j	bnei_cont.44740
bnei_else.44739:
	fneg	%f0, %f0
bnei_cont.44740:
	flw	%f4, 32(%sp)
	flw	%f5, 5(%sp)
	fblt	%f4, %f5, fbgt_else.44741
	addi	%v0, %zero, 1
	j	fbgt_cont.44742
fbgt_else.44741:
	addi	%v0, %zero, 0
fbgt_cont.44742:
	fabs	%f4, %f4
	flw	%f5, 19(%sp)
	fsw	%f0, 34(%sp)
	sw	%v0, 35(%sp)
	fsw	%f4, 36(%sp)
	fblt	%f4, %f5, fbgt_else.44743
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.44745
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.44747
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.44749
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.44751
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.44753
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.44755
	flw	%f6, 481(%zero)
	fblt	%f4, %f6, fbgt_else.44757
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.44759
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.44761
	flw	%f6, 478(%zero)
	fblt	%f4, %f6, fbgt_else.44763
	flw	%f6, 477(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.44744
fbgt_else.44763:
	fmov	%f0, %f6
fbgt_cont.44764:
	j	fbgt_cont.44744
fbgt_else.44761:
	fmov	%f0, %f6
fbgt_cont.44762:
	j	fbgt_cont.44744
fbgt_else.44759:
	fmov	%f0, %f6
fbgt_cont.44760:
	j	fbgt_cont.44744
fbgt_else.44757:
	fmov	%f0, %f6
fbgt_cont.44758:
	j	fbgt_cont.44744
fbgt_else.44755:
	fmov	%f0, %f6
fbgt_cont.44756:
	j	fbgt_cont.44744
fbgt_else.44753:
	fmov	%f0, %f6
fbgt_cont.44754:
	j	fbgt_cont.44744
fbgt_else.44751:
	fmov	%f0, %f6
fbgt_cont.44752:
	j	fbgt_cont.44744
fbgt_else.44749:
	fmov	%f0, %f6
fbgt_cont.44750:
	j	fbgt_cont.44744
fbgt_else.44747:
	fmov	%f0, %f6
fbgt_cont.44748:
	j	fbgt_cont.44744
fbgt_else.44745:
	fmov	%f0, %f6
fbgt_cont.44746:
	j	fbgt_cont.44744
fbgt_else.44743:
	fmov	%f0, %f5
fbgt_cont.44744:
	flw	%f1, 36(%sp)
	flw	%f2, 19(%sp)
	fblt	%f1, %f2, fbgt_else.44765
	fblt	%f1, %f0, fbgt_else.44767
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44769
	fblt	%f1, %f0, fbgt_else.44771
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44773
	fblt	%f1, %f0, fbgt_else.44775
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.44766
fbgt_else.44775:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.44776:
	j	fbgt_cont.44766
fbgt_else.44773:
	fmov	%f0, %f1
fbgt_cont.44774:
	j	fbgt_cont.44766
fbgt_else.44771:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44777
	fblt	%f1, %f0, fbgt_else.44779
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.44778
fbgt_else.44779:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.44780:
	j	fbgt_cont.44778
fbgt_else.44777:
	fmov	%f0, %f1
fbgt_cont.44778:
fbgt_cont.44772:
	j	fbgt_cont.44766
fbgt_else.44769:
	fmov	%f0, %f1
fbgt_cont.44770:
	j	fbgt_cont.44766
fbgt_else.44767:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44781
	fblt	%f1, %f0, fbgt_else.44783
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44785
	fblt	%f1, %f0, fbgt_else.44787
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.44782
fbgt_else.44787:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.44788:
	j	fbgt_cont.44782
fbgt_else.44785:
	fmov	%f0, %f1
fbgt_cont.44786:
	j	fbgt_cont.44782
fbgt_else.44783:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44789
	fblt	%f1, %f0, fbgt_else.44791
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	fbgt_cont.44790
fbgt_else.44791:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
fbgt_cont.44792:
	j	fbgt_cont.44790
fbgt_else.44789:
	fmov	%f0, %f1
fbgt_cont.44790:
fbgt_cont.44784:
	j	fbgt_cont.44782
fbgt_else.44781:
	fmov	%f0, %f1
fbgt_cont.44782:
fbgt_cont.44768:
	j	fbgt_cont.44766
fbgt_else.44765:
	fmov	%f0, %f1
fbgt_cont.44766:
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.44793
	lw	%v0, 35(%sp)
	beqi	%v0, 0, bnei_else.44795
	addi	%v0, %zero, 0
	j	fbgt_cont.44794
bnei_else.44795:
	addi	%v0, %zero, 1
bnei_cont.44796:
	j	fbgt_cont.44794
fbgt_else.44793:
	lw	%v0, 35(%sp)
fbgt_cont.44794:
	fblt	%f0, %f1, fbgt_else.44797
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44798
fbgt_else.44797:
fbgt_cont.44798:
	flw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.44799
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44800
fbgt_else.44799:
fbgt_cont.44800:
	flw	%f1, 21(%sp)
	fblt	%f1, %f0, fbgt_else.44801
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.44802
fbgt_else.44801:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.44802:
	beqi	%v0, 0, bnei_else.44803
	j	bnei_cont.44804
bnei_else.44803:
	fneg	%f0, %f0
bnei_cont.44804:
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
	flw	%f12, 494(%zero)
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
	j	bnei_cont.44420
bnei_else.44419:
bnei_cont.44420:
	addi	%v0, %zero, 1
	j	bnei_cont.44364
bnei_else.44363:
	addi	%v0, %zero, 0
bnei_cont.44364:
	beqi	%v0, 0, bnei_else.44805
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 60, bgti_else.44806
	jr	%ra
bgti_else.44806:
	sw	%v0, 37(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_read_int
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	beqi	%v0, -1, bnei_else.44808
	sw	%v0, 38(%sp)
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_int
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	sw	%v0, 39(%sp)
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_read_int
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	sw	%v0, 40(%sp)
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	min_caml_read_int
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 493(%zero)
	sw	%v0, 41(%sp)
	fsw	%f0, 42(%sp)
	sw	%v1, 43(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	min_caml_create_float_array
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	sw	%v0, 44(%sp)
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_read_float
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_read_float
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 1(%v0)
	addi	%v1, %zero, 2
	sw	%v1, 45(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_read_float
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 42(%sp)
	lw	%v1, 43(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	min_caml_create_float_array
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	sw	%v0, 46(%sp)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v0, 46(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v0, 46(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	lw	%v0, 46(%sp)
	fsw	%f0, 2(%v0)
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	flw	%f1, 42(%sp)
	fblt	%f0, %f1, fbgt_else.44810
	addi	%v0, %zero, 0
	j	fbgt_cont.44811
fbgt_else.44810:
	addi	%v0, %zero, 1
fbgt_cont.44811:
	lw	%v1, 45(%sp)
	sw	%v0, 47(%sp)
	addi	%v0, %v1, 0
	fmov	%f0, %f1
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	min_caml_create_float_array
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	sw	%v0, 48(%sp)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_read_float
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v0, 48(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_read_float
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	lw	%v0, 48(%sp)
	fsw	%f0, 1(%v0)
	flw	%f0, 42(%sp)
	lw	%v1, 43(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	min_caml_create_float_array
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	sw	%v0, 49(%sp)
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_read_float
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	lw	%v0, 49(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_read_float
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	lw	%v0, 49(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_read_float
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	lw	%v0, 49(%sp)
	fsw	%f0, 2(%v0)
	flw	%f0, 42(%sp)
	lw	%v1, 43(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 50(%sp)
	addi	%sp, %sp, 51
	jal	min_caml_create_float_array
	addi	%sp, %sp, -51
	lw	%ra, 50(%sp)
	lw	%v1, 41(%sp)
	beqi	%v1, 0, bnei_else.44812
	sw	%v0, 50(%sp)
	sw	%ra, 51(%sp)
	addi	%sp, %sp, 52
	jal	min_caml_read_float
	addi	%sp, %sp, -52
	lw	%ra, 51(%sp)
	flw	%f1, 492(%zero)
	fmul	%f0, %f0, %f1
	lw	%v0, 50(%sp)
	fsw	%f0, 0(%v0)
	fsw	%f1, 51(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_read_float
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	flw	%f1, 51(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 50(%sp)
	fsw	%f0, 1(%v0)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 53
	jal	min_caml_read_float
	addi	%sp, %sp, -53
	lw	%ra, 52(%sp)
	flw	%f1, 51(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 50(%sp)
	fsw	%f0, 2(%v0)
	j	bnei_cont.44813
bnei_else.44812:
bnei_cont.44813:
	lw	%v1, 39(%sp)
	beqi	%v1, 2, bnei_else.44814
	lw	%a0, 47(%sp)
	j	bnei_cont.44815
bnei_else.44814:
	addi	%a0, %zero, 1
bnei_cont.44815:
	addi	%a1, %zero, 4
	flw	%f0, 42(%sp)
	sw	%a0, 52(%sp)
	sw	%v0, 50(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	min_caml_create_float_array
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)
	lw	%v0, 50(%sp)
	sw	%v0, 9(%v1)
	lw	%a0, 49(%sp)
	sw	%a0, 8(%v1)
	lw	%a0, 48(%sp)
	sw	%a0, 7(%v1)
	lw	%a0, 52(%sp)
	sw	%a0, 6(%v1)
	lw	%a0, 46(%sp)
	sw	%a0, 5(%v1)
	lw	%a0, 44(%sp)
	sw	%a0, 4(%v1)
	lw	%a1, 41(%sp)
	sw	%a1, 3(%v1)
	lw	%a2, 40(%sp)
	sw	%a2, 2(%v1)
	lw	%a2, 39(%sp)
	sw	%a2, 1(%v1)
	lw	%a3, 38(%sp)
	sw	%a3, 0(%v1)
	lw	%a3, 37(%sp)
	sw	%v1, 12(%a3)
	beqi	%a2, 3, bnei_else.44816
	beqi	%a2, 2, bnei_else.44818
	j	bnei_cont.44817
bnei_else.44818:
	lw	%v1, 47(%sp)
	beqi	%v1, 0, bnei_else.44820
	addi	%v1, %zero, 0
	j	bnei_cont.44821
bnei_else.44820:
	addi	%v1, %zero, 1
bnei_cont.44821:
	flw	%f0, 0(%a0)
	fmul	%f1, %f0, %f0
	flw	%f2, 1(%a0)
	fmul	%f3, %f2, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%a0)
	fmul	%f4, %f3, %f3
	fadd	%f1, %f1, %f4
	fsqrt	%f1, %f1
	flw	%f4, 42(%sp)
	fbne	%f1, %f4, fbeq_else.44822
	addi	%a2, %zero, 1
	j	fbeq_cont.44823
fbeq_else.44822:
	addi	%a2, %zero, 0
fbeq_cont.44823:
	beqi	%a2, 0, bnei_else.44824
	flw	%f1, 491(%zero)
	j	bnei_cont.44825
bnei_else.44824:
	beqi	%v1, 0, bnei_else.44826
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.44827
bnei_else.44826:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.44827:
bnei_cont.44825:
	fmul	%f0, %f0, %f1
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1
	fsw	%f0, 2(%a0)
bnei_cont.44819:
	j	bnei_cont.44817
bnei_else.44816:
	flw	%f0, 0(%a0)
	flw	%f1, 42(%sp)
	fbne	%f0, %f1, fbeq_else.44828
	addi	%v1, %zero, 1
	j	fbeq_cont.44829
fbeq_else.44828:
	addi	%v1, %zero, 0
fbeq_cont.44829:
	beqi	%v1, 0, bnei_else.44830
	fmov	%f0, %f1
	j	bnei_cont.44831
bnei_else.44830:
	fbne	%f0, %f1, fbeq_else.44832
	addi	%v1, %zero, 1
	j	fbeq_cont.44833
fbeq_else.44832:
	addi	%v1, %zero, 0
fbeq_cont.44833:
	beqi	%v1, 0, bnei_else.44834
	fmov	%f2, %f1
	j	bnei_cont.44835
bnei_else.44834:
	fblt	%f1, %f0, fbgt_else.44836
	addi	%v1, %zero, 0
	j	fbgt_cont.44837
fbgt_else.44836:
	addi	%v1, %zero, 1
fbgt_cont.44837:
	beqi	%v1, 0, bnei_else.44838
	flw	%f2, 491(%zero)
	j	bnei_cont.44839
bnei_else.44838:
	flw	%f2, 490(%zero)
bnei_cont.44839:
bnei_cont.44835:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.44831:
	fsw	%f0, 0(%a0)
	flw	%f0, 1(%a0)
	fbne	%f0, %f1, fbeq_else.44840
	addi	%v1, %zero, 1
	j	fbeq_cont.44841
fbeq_else.44840:
	addi	%v1, %zero, 0
fbeq_cont.44841:
	beqi	%v1, 0, bnei_else.44842
	fmov	%f0, %f1
	j	bnei_cont.44843
bnei_else.44842:
	fbne	%f0, %f1, fbeq_else.44844
	addi	%v1, %zero, 1
	j	fbeq_cont.44845
fbeq_else.44844:
	addi	%v1, %zero, 0
fbeq_cont.44845:
	beqi	%v1, 0, bnei_else.44846
	fmov	%f2, %f1
	j	bnei_cont.44847
bnei_else.44846:
	fblt	%f1, %f0, fbgt_else.44848
	addi	%v1, %zero, 0
	j	fbgt_cont.44849
fbgt_else.44848:
	addi	%v1, %zero, 1
fbgt_cont.44849:
	beqi	%v1, 0, bnei_else.44850
	flw	%f2, 491(%zero)
	j	bnei_cont.44851
bnei_else.44850:
	flw	%f2, 490(%zero)
bnei_cont.44851:
bnei_cont.44847:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.44843:
	fsw	%f0, 1(%a0)
	flw	%f0, 2(%a0)
	fbne	%f0, %f1, fbeq_else.44852
	addi	%v1, %zero, 1
	j	fbeq_cont.44853
fbeq_else.44852:
	addi	%v1, %zero, 0
fbeq_cont.44853:
	beqi	%v1, 0, bnei_else.44854
	fmov	%f0, %f1
	j	bnei_cont.44855
bnei_else.44854:
	fbne	%f0, %f1, fbeq_else.44856
	addi	%v1, %zero, 1
	j	fbeq_cont.44857
fbeq_else.44856:
	addi	%v1, %zero, 0
fbeq_cont.44857:
	beqi	%v1, 0, bnei_else.44858
	fmov	%f2, %f1
	j	bnei_cont.44859
bnei_else.44858:
	fblt	%f1, %f0, fbgt_else.44860
	addi	%v1, %zero, 0
	j	fbgt_cont.44861
fbgt_else.44860:
	addi	%v1, %zero, 1
fbgt_cont.44861:
	beqi	%v1, 0, bnei_else.44862
	flw	%f2, 491(%zero)
	j	bnei_cont.44863
bnei_else.44862:
	flw	%f2, 490(%zero)
bnei_cont.44863:
bnei_cont.44859:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f2, %f0
bnei_cont.44855:
	fsw	%f0, 2(%a0)
bnei_cont.44817:
	beqi	%a1, 0, bnei_else.44864
	flw	%f0, 0(%v0)
	flw	%f1, 489(%zero)
	fabs	%f2, %f0
	flw	%f3, 488(%zero)
	fsw	%f0, 53(%sp)
	fsw	%f1, 54(%sp)
	fsw	%f2, 55(%sp)
	fsw	%f3, 56(%sp)
	fblt	%f2, %f3, fbgt_else.44866
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.44868
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.44870
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.44872
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.44874
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.44876
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.44878
	flw	%f4, 481(%zero)
	fblt	%f2, %f4, fbgt_else.44880
	flw	%f4, 480(%zero)
	fblt	%f2, %f4, fbgt_else.44882
	flw	%f4, 479(%zero)
	fblt	%f2, %f4, fbgt_else.44884
	flw	%f4, 478(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.44867
fbgt_else.44884:
	fmov	%f0, %f4
fbgt_cont.44885:
	j	fbgt_cont.44867
fbgt_else.44882:
	fmov	%f0, %f4
fbgt_cont.44883:
	j	fbgt_cont.44867
fbgt_else.44880:
	fmov	%f0, %f4
fbgt_cont.44881:
	j	fbgt_cont.44867
fbgt_else.44878:
	fmov	%f0, %f4
fbgt_cont.44879:
	j	fbgt_cont.44867
fbgt_else.44876:
	fmov	%f0, %f4
fbgt_cont.44877:
	j	fbgt_cont.44867
fbgt_else.44874:
	fmov	%f0, %f4
fbgt_cont.44875:
	j	fbgt_cont.44867
fbgt_else.44872:
	fmov	%f0, %f4
fbgt_cont.44873:
	j	fbgt_cont.44867
fbgt_else.44870:
	fmov	%f0, %f4
fbgt_cont.44871:
	j	fbgt_cont.44867
fbgt_else.44868:
	fmov	%f0, %f4
fbgt_cont.44869:
	j	fbgt_cont.44867
fbgt_else.44866:
	fmov	%f0, %f3
fbgt_cont.44867:
	flw	%f1, 55(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.44886
	fblt	%f1, %f0, fbgt_else.44888
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44890
	fblt	%f1, %f0, fbgt_else.44892
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.44887
fbgt_else.44892:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
fbgt_cont.44893:
	j	fbgt_cont.44887
fbgt_else.44890:
	fmov	%f0, %f1
fbgt_cont.44891:
	j	fbgt_cont.44887
fbgt_else.44888:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44894
	fblt	%f1, %f0, fbgt_else.44896
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.44895
fbgt_else.44896:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
fbgt_cont.44897:
	j	fbgt_cont.44895
fbgt_else.44894:
	fmov	%f0, %f1
fbgt_cont.44895:
fbgt_cont.44889:
	j	fbgt_cont.44887
fbgt_else.44886:
	fmov	%f0, %f1
fbgt_cont.44887:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.44898
	addi	%v0, %zero, 0
	j	fbgt_cont.44899
fbgt_else.44898:
	addi	%v0, %zero, 1
fbgt_cont.44899:
	fblt	%f0, %f1, fbgt_else.44900
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44901
fbgt_else.44900:
fbgt_cont.44901:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.44902
	beqi	%v0, 0, bnei_else.44904
	addi	%v0, %zero, 0
	j	fbgt_cont.44903
bnei_else.44904:
	addi	%v0, %zero, 1
bnei_cont.44905:
	j	fbgt_cont.44903
fbgt_else.44902:
fbgt_cont.44903:
	fblt	%f0, %f2, fbgt_else.44906
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44907
fbgt_else.44906:
fbgt_cont.44907:
	flw	%f3, 475(%zero)
	fblt	%f3, %f0, fbgt_else.44908
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.44909
fbgt_else.44908:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.44909:
	beqi	%v0, 0, bnei_else.44910
	j	bnei_cont.44911
bnei_else.44910:
	fneg	%f0, %f0
bnei_cont.44911:
	flw	%f4, 53(%sp)
	flw	%f5, 42(%sp)
	fblt	%f4, %f5, fbgt_else.44912
	addi	%v0, %zero, 1
	j	fbgt_cont.44913
fbgt_else.44912:
	addi	%v0, %zero, 0
fbgt_cont.44913:
	fabs	%f4, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 57(%sp)
	fsw	%f3, 58(%sp)
	fsw	%f2, 59(%sp)
	sw	%v0, 60(%sp)
	fsw	%f4, 61(%sp)
	fblt	%f4, %f6, fbgt_else.44914
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.44916
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.44918
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.44920
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.44922
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.44924
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.44926
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.44928
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.44930
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.44932
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
	j	fbgt_cont.44915
fbgt_else.44932:
	fmov	%f0, %f7
fbgt_cont.44933:
	j	fbgt_cont.44915
fbgt_else.44930:
	fmov	%f0, %f7
fbgt_cont.44931:
	j	fbgt_cont.44915
fbgt_else.44928:
	fmov	%f0, %f7
fbgt_cont.44929:
	j	fbgt_cont.44915
fbgt_else.44926:
	fmov	%f0, %f7
fbgt_cont.44927:
	j	fbgt_cont.44915
fbgt_else.44924:
	fmov	%f0, %f7
fbgt_cont.44925:
	j	fbgt_cont.44915
fbgt_else.44922:
	fmov	%f0, %f7
fbgt_cont.44923:
	j	fbgt_cont.44915
fbgt_else.44920:
	fmov	%f0, %f7
fbgt_cont.44921:
	j	fbgt_cont.44915
fbgt_else.44918:
	fmov	%f0, %f7
fbgt_cont.44919:
	j	fbgt_cont.44915
fbgt_else.44916:
	fmov	%f0, %f7
fbgt_cont.44917:
	j	fbgt_cont.44915
fbgt_else.44914:
	fmov	%f0, %f6
fbgt_cont.44915:
	flw	%f1, 61(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.44934
	fblt	%f1, %f0, fbgt_else.44936
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44938
	fblt	%f1, %f0, fbgt_else.44940
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
	j	fbgt_cont.44935
fbgt_else.44940:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
fbgt_cont.44941:
	j	fbgt_cont.44935
fbgt_else.44938:
	fmov	%f0, %f1
fbgt_cont.44939:
	j	fbgt_cont.44935
fbgt_else.44936:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44942
	fblt	%f1, %f0, fbgt_else.44944
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
	j	fbgt_cont.44943
fbgt_else.44944:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 62(%sp)
	addi	%sp, %sp, 63
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -63
	lw	%ra, 62(%sp)
fbgt_cont.44945:
	j	fbgt_cont.44943
fbgt_else.44942:
	fmov	%f0, %f1
fbgt_cont.44943:
fbgt_cont.44937:
	j	fbgt_cont.44935
fbgt_else.44934:
	fmov	%f0, %f1
fbgt_cont.44935:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.44946
	lw	%v0, 60(%sp)
	beqi	%v0, 0, bnei_else.44948
	addi	%v0, %zero, 0
	j	fbgt_cont.44947
bnei_else.44948:
	addi	%v0, %zero, 1
bnei_cont.44949:
	j	fbgt_cont.44947
fbgt_else.44946:
	lw	%v0, 60(%sp)
fbgt_cont.44947:
	fblt	%f0, %f1, fbgt_else.44950
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44951
fbgt_else.44950:
fbgt_cont.44951:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.44952
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44953
fbgt_else.44952:
fbgt_cont.44953:
	flw	%f3, 58(%sp)
	fblt	%f3, %f0, fbgt_else.44954
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.44955
fbgt_else.44954:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.44955:
	beqi	%v0, 0, bnei_else.44956
	j	bnei_cont.44957
bnei_else.44956:
	fneg	%f0, %f0
bnei_cont.44957:
	lw	%v0, 50(%sp)
	flw	%f4, 1(%v0)
	fabs	%f5, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 62(%sp)
	fsw	%f4, 63(%sp)
	fsw	%f5, 64(%sp)
	fblt	%f5, %f6, fbgt_else.44958
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.44960
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.44962
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.44964
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.44966
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.44968
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.44970
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.44972
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.44974
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.44976
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	fbgt_cont.44959
fbgt_else.44976:
	fmov	%f0, %f7
fbgt_cont.44977:
	j	fbgt_cont.44959
fbgt_else.44974:
	fmov	%f0, %f7
fbgt_cont.44975:
	j	fbgt_cont.44959
fbgt_else.44972:
	fmov	%f0, %f7
fbgt_cont.44973:
	j	fbgt_cont.44959
fbgt_else.44970:
	fmov	%f0, %f7
fbgt_cont.44971:
	j	fbgt_cont.44959
fbgt_else.44968:
	fmov	%f0, %f7
fbgt_cont.44969:
	j	fbgt_cont.44959
fbgt_else.44966:
	fmov	%f0, %f7
fbgt_cont.44967:
	j	fbgt_cont.44959
fbgt_else.44964:
	fmov	%f0, %f7
fbgt_cont.44965:
	j	fbgt_cont.44959
fbgt_else.44962:
	fmov	%f0, %f7
fbgt_cont.44963:
	j	fbgt_cont.44959
fbgt_else.44960:
	fmov	%f0, %f7
fbgt_cont.44961:
	j	fbgt_cont.44959
fbgt_else.44958:
	fmov	%f0, %f6
fbgt_cont.44959:
	flw	%f1, 64(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.44978
	fblt	%f1, %f0, fbgt_else.44980
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44982
	fblt	%f1, %f0, fbgt_else.44984
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	fbgt_cont.44979
fbgt_else.44984:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
fbgt_cont.44985:
	j	fbgt_cont.44979
fbgt_else.44982:
	fmov	%f0, %f1
fbgt_cont.44983:
	j	fbgt_cont.44979
fbgt_else.44980:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.44986
	fblt	%f1, %f0, fbgt_else.44988
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
	j	fbgt_cont.44987
fbgt_else.44988:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 65(%sp)
	addi	%sp, %sp, 66
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -66
	lw	%ra, 65(%sp)
fbgt_cont.44989:
	j	fbgt_cont.44987
fbgt_else.44986:
	fmov	%f0, %f1
fbgt_cont.44987:
fbgt_cont.44981:
	j	fbgt_cont.44979
fbgt_else.44978:
	fmov	%f0, %f1
fbgt_cont.44979:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.44990
	addi	%v0, %zero, 0
	j	fbgt_cont.44991
fbgt_else.44990:
	addi	%v0, %zero, 1
fbgt_cont.44991:
	fblt	%f0, %f1, fbgt_else.44992
	fsub	%f0, %f0, %f1
	j	fbgt_cont.44993
fbgt_else.44992:
fbgt_cont.44993:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.44994
	beqi	%v0, 0, bnei_else.44996
	addi	%v0, %zero, 0
	j	fbgt_cont.44995
bnei_else.44996:
	addi	%v0, %zero, 1
bnei_cont.44997:
	j	fbgt_cont.44995
fbgt_else.44994:
fbgt_cont.44995:
	fblt	%f0, %f2, fbgt_else.44998
	fsub	%f0, %f1, %f0
	j	fbgt_cont.44999
fbgt_else.44998:
fbgt_cont.44999:
	flw	%f3, 58(%sp)
	fblt	%f3, %f0, fbgt_else.45000
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.45001
fbgt_else.45000:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.45001:
	beqi	%v0, 0, bnei_else.45002
	j	bnei_cont.45003
bnei_else.45002:
	fneg	%f0, %f0
bnei_cont.45003:
	flw	%f4, 63(%sp)
	flw	%f5, 42(%sp)
	fblt	%f4, %f5, fbgt_else.45004
	addi	%v0, %zero, 1
	j	fbgt_cont.45005
fbgt_else.45004:
	addi	%v0, %zero, 0
fbgt_cont.45005:
	fabs	%f4, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 65(%sp)
	sw	%v0, 66(%sp)
	fsw	%f4, 67(%sp)
	fblt	%f4, %f6, fbgt_else.45006
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.45008
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.45010
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.45012
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.45014
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.45016
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.45018
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.45020
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.45022
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.45024
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	j	fbgt_cont.45007
fbgt_else.45024:
	fmov	%f0, %f7
fbgt_cont.45025:
	j	fbgt_cont.45007
fbgt_else.45022:
	fmov	%f0, %f7
fbgt_cont.45023:
	j	fbgt_cont.45007
fbgt_else.45020:
	fmov	%f0, %f7
fbgt_cont.45021:
	j	fbgt_cont.45007
fbgt_else.45018:
	fmov	%f0, %f7
fbgt_cont.45019:
	j	fbgt_cont.45007
fbgt_else.45016:
	fmov	%f0, %f7
fbgt_cont.45017:
	j	fbgt_cont.45007
fbgt_else.45014:
	fmov	%f0, %f7
fbgt_cont.45015:
	j	fbgt_cont.45007
fbgt_else.45012:
	fmov	%f0, %f7
fbgt_cont.45013:
	j	fbgt_cont.45007
fbgt_else.45010:
	fmov	%f0, %f7
fbgt_cont.45011:
	j	fbgt_cont.45007
fbgt_else.45008:
	fmov	%f0, %f7
fbgt_cont.45009:
	j	fbgt_cont.45007
fbgt_else.45006:
	fmov	%f0, %f6
fbgt_cont.45007:
	flw	%f1, 67(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.45026
	fblt	%f1, %f0, fbgt_else.45028
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.45030
	fblt	%f1, %f0, fbgt_else.45032
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	j	fbgt_cont.45027
fbgt_else.45032:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
fbgt_cont.45033:
	j	fbgt_cont.45027
fbgt_else.45030:
	fmov	%f0, %f1
fbgt_cont.45031:
	j	fbgt_cont.45027
fbgt_else.45028:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.45034
	fblt	%f1, %f0, fbgt_else.45036
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
	j	fbgt_cont.45035
fbgt_else.45036:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 69
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -69
	lw	%ra, 68(%sp)
fbgt_cont.45037:
	j	fbgt_cont.45035
fbgt_else.45034:
	fmov	%f0, %f1
fbgt_cont.45035:
fbgt_cont.45029:
	j	fbgt_cont.45027
fbgt_else.45026:
	fmov	%f0, %f1
fbgt_cont.45027:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.45038
	lw	%v0, 66(%sp)
	beqi	%v0, 0, bnei_else.45040
	addi	%v0, %zero, 0
	j	fbgt_cont.45039
bnei_else.45040:
	addi	%v0, %zero, 1
bnei_cont.45041:
	j	fbgt_cont.45039
fbgt_else.45038:
	lw	%v0, 66(%sp)
fbgt_cont.45039:
	fblt	%f0, %f1, fbgt_else.45042
	fsub	%f0, %f0, %f1
	j	fbgt_cont.45043
fbgt_else.45042:
fbgt_cont.45043:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.45044
	fsub	%f0, %f1, %f0
	j	fbgt_cont.45045
fbgt_else.45044:
fbgt_cont.45045:
	flw	%f3, 58(%sp)
	fblt	%f3, %f0, fbgt_else.45046
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.45047
fbgt_else.45046:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.45047:
	beqi	%v0, 0, bnei_else.45048
	j	bnei_cont.45049
bnei_else.45048:
	fneg	%f0, %f0
bnei_cont.45049:
	lw	%v0, 50(%sp)
	flw	%f4, 2(%v0)
	fabs	%f5, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 68(%sp)
	fsw	%f4, 69(%sp)
	fsw	%f5, 70(%sp)
	fblt	%f5, %f6, fbgt_else.45050
	flw	%f7, 487(%zero)
	fblt	%f5, %f7, fbgt_else.45052
	flw	%f7, 486(%zero)
	fblt	%f5, %f7, fbgt_else.45054
	flw	%f7, 485(%zero)
	fblt	%f5, %f7, fbgt_else.45056
	flw	%f7, 484(%zero)
	fblt	%f5, %f7, fbgt_else.45058
	flw	%f7, 483(%zero)
	fblt	%f5, %f7, fbgt_else.45060
	flw	%f7, 482(%zero)
	fblt	%f5, %f7, fbgt_else.45062
	flw	%f7, 481(%zero)
	fblt	%f5, %f7, fbgt_else.45064
	flw	%f7, 480(%zero)
	fblt	%f5, %f7, fbgt_else.45066
	flw	%f7, 479(%zero)
	fblt	%f5, %f7, fbgt_else.45068
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f5
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
	j	fbgt_cont.45051
fbgt_else.45068:
	fmov	%f0, %f7
fbgt_cont.45069:
	j	fbgt_cont.45051
fbgt_else.45066:
	fmov	%f0, %f7
fbgt_cont.45067:
	j	fbgt_cont.45051
fbgt_else.45064:
	fmov	%f0, %f7
fbgt_cont.45065:
	j	fbgt_cont.45051
fbgt_else.45062:
	fmov	%f0, %f7
fbgt_cont.45063:
	j	fbgt_cont.45051
fbgt_else.45060:
	fmov	%f0, %f7
fbgt_cont.45061:
	j	fbgt_cont.45051
fbgt_else.45058:
	fmov	%f0, %f7
fbgt_cont.45059:
	j	fbgt_cont.45051
fbgt_else.45056:
	fmov	%f0, %f7
fbgt_cont.45057:
	j	fbgt_cont.45051
fbgt_else.45054:
	fmov	%f0, %f7
fbgt_cont.45055:
	j	fbgt_cont.45051
fbgt_else.45052:
	fmov	%f0, %f7
fbgt_cont.45053:
	j	fbgt_cont.45051
fbgt_else.45050:
	fmov	%f0, %f6
fbgt_cont.45051:
	flw	%f1, 70(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.45070
	fblt	%f1, %f0, fbgt_else.45072
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.45074
	fblt	%f1, %f0, fbgt_else.45076
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
	j	fbgt_cont.45071
fbgt_else.45076:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
fbgt_cont.45077:
	j	fbgt_cont.45071
fbgt_else.45074:
	fmov	%f0, %f1
fbgt_cont.45075:
	j	fbgt_cont.45071
fbgt_else.45072:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.45078
	fblt	%f1, %f0, fbgt_else.45080
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
	j	fbgt_cont.45079
fbgt_else.45080:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 71(%sp)
	addi	%sp, %sp, 72
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -72
	lw	%ra, 71(%sp)
fbgt_cont.45081:
	j	fbgt_cont.45079
fbgt_else.45078:
	fmov	%f0, %f1
fbgt_cont.45079:
fbgt_cont.45073:
	j	fbgt_cont.45071
fbgt_else.45070:
	fmov	%f0, %f1
fbgt_cont.45071:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.45082
	addi	%v0, %zero, 0
	j	fbgt_cont.45083
fbgt_else.45082:
	addi	%v0, %zero, 1
fbgt_cont.45083:
	fblt	%f0, %f1, fbgt_else.45084
	fsub	%f0, %f0, %f1
	j	fbgt_cont.45085
fbgt_else.45084:
fbgt_cont.45085:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.45086
	beqi	%v0, 0, bnei_else.45088
	addi	%v0, %zero, 0
	j	fbgt_cont.45087
bnei_else.45088:
	addi	%v0, %zero, 1
bnei_cont.45089:
	j	fbgt_cont.45087
fbgt_else.45086:
fbgt_cont.45087:
	fblt	%f0, %f2, fbgt_else.45090
	fsub	%f0, %f1, %f0
	j	fbgt_cont.45091
fbgt_else.45090:
fbgt_cont.45091:
	flw	%f3, 58(%sp)
	fblt	%f3, %f0, fbgt_else.45092
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.45093
fbgt_else.45092:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.45093:
	beqi	%v0, 0, bnei_else.45094
	j	bnei_cont.45095
bnei_else.45094:
	fneg	%f0, %f0
bnei_cont.45095:
	flw	%f4, 69(%sp)
	flw	%f5, 42(%sp)
	fblt	%f4, %f5, fbgt_else.45096
	addi	%v0, %zero, 1
	j	fbgt_cont.45097
fbgt_else.45096:
	addi	%v0, %zero, 0
fbgt_cont.45097:
	fabs	%f4, %f4
	flw	%f5, 56(%sp)
	fsw	%f0, 71(%sp)
	sw	%v0, 72(%sp)
	fsw	%f4, 73(%sp)
	fblt	%f4, %f5, fbgt_else.45098
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.45100
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.45102
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.45104
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.45106
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.45108
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.45110
	flw	%f6, 481(%zero)
	fblt	%f4, %f6, fbgt_else.45112
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.45114
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.45116
	flw	%f6, 478(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
	j	fbgt_cont.45099
fbgt_else.45116:
	fmov	%f0, %f6
fbgt_cont.45117:
	j	fbgt_cont.45099
fbgt_else.45114:
	fmov	%f0, %f6
fbgt_cont.45115:
	j	fbgt_cont.45099
fbgt_else.45112:
	fmov	%f0, %f6
fbgt_cont.45113:
	j	fbgt_cont.45099
fbgt_else.45110:
	fmov	%f0, %f6
fbgt_cont.45111:
	j	fbgt_cont.45099
fbgt_else.45108:
	fmov	%f0, %f6
fbgt_cont.45109:
	j	fbgt_cont.45099
fbgt_else.45106:
	fmov	%f0, %f6
fbgt_cont.45107:
	j	fbgt_cont.45099
fbgt_else.45104:
	fmov	%f0, %f6
fbgt_cont.45105:
	j	fbgt_cont.45099
fbgt_else.45102:
	fmov	%f0, %f6
fbgt_cont.45103:
	j	fbgt_cont.45099
fbgt_else.45100:
	fmov	%f0, %f6
fbgt_cont.45101:
	j	fbgt_cont.45099
fbgt_else.45098:
	fmov	%f0, %f5
fbgt_cont.45099:
	flw	%f1, 73(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.45118
	fblt	%f1, %f0, fbgt_else.45120
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.45122
	fblt	%f1, %f0, fbgt_else.45124
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
	j	fbgt_cont.45119
fbgt_else.45124:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
fbgt_cont.45125:
	j	fbgt_cont.45119
fbgt_else.45122:
	fmov	%f0, %f1
fbgt_cont.45123:
	j	fbgt_cont.45119
fbgt_else.45120:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.45126
	fblt	%f1, %f0, fbgt_else.45128
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
	j	fbgt_cont.45127
fbgt_else.45128:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 74(%sp)
	addi	%sp, %sp, 75
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -75
	lw	%ra, 74(%sp)
fbgt_cont.45129:
	j	fbgt_cont.45127
fbgt_else.45126:
	fmov	%f0, %f1
fbgt_cont.45127:
fbgt_cont.45121:
	j	fbgt_cont.45119
fbgt_else.45118:
	fmov	%f0, %f1
fbgt_cont.45119:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.45130
	lw	%v0, 72(%sp)
	beqi	%v0, 0, bnei_else.45132
	addi	%v0, %zero, 0
	j	fbgt_cont.45131
bnei_else.45132:
	addi	%v0, %zero, 1
bnei_cont.45133:
	j	fbgt_cont.45131
fbgt_else.45130:
	lw	%v0, 72(%sp)
fbgt_cont.45131:
	fblt	%f0, %f1, fbgt_else.45134
	fsub	%f0, %f0, %f1
	j	fbgt_cont.45135
fbgt_else.45134:
fbgt_cont.45135:
	flw	%f2, 59(%sp)
	fblt	%f0, %f2, fbgt_else.45136
	fsub	%f0, %f1, %f0
	j	fbgt_cont.45137
fbgt_else.45136:
fbgt_cont.45137:
	flw	%f1, 58(%sp)
	fblt	%f1, %f0, fbgt_else.45138
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.45139
fbgt_else.45138:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.45139:
	beqi	%v0, 0, bnei_else.45140
	j	bnei_cont.45141
bnei_else.45140:
	fneg	%f0, %f0
bnei_cont.45141:
	flw	%f1, 71(%sp)
	flw	%f2, 65(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 68(%sp)
	flw	%f5, 62(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f7, %f6, %f1
	flw	%f8, 57(%sp)
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
	lw	%v0, 44(%sp)
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
	flw	%f12, 494(%zero)
	fmul	%f13, %f5, %f7
	fmul	%f13, %f13, %f10
	fmul	%f14, %f8, %f6
	fmul	%f14, %f14, %f0
	fadd	%f13, %f13, %f14
	fmul	%f14, %f9, %f4
	fmul	%f14, %f14, %f2
	fadd	%f13, %f13, %f14
	fmul	%f13, %f12, %f13
	lw	%v0, 50(%sp)
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
	j	bnei_cont.44865
bnei_else.44864:
bnei_cont.44865:
	addi	%v0, %zero, 1
	j	bnei_cont.44809
bnei_else.44808:
	addi	%v0, %zero, 0
bnei_cont.44809:
	beqi	%v0, 0, bnei_else.45142
	lw	%v0, 37(%sp)
	addi	%v0, %v0, 1
	j	read_object.2772
bnei_else.45142:
	lw	%v0, 37(%sp)
	sw	%v0, 0(%zero)
	jr	%ra
bnei_else.44805:
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
	beqi	%v0, -1, bnei_else.45158
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
	beqi	%v0, -1, bnei_else.45159
	lw	%v1, 3(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	sw	%a0, 5(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_read_int
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	beqi	%v0, -1, bnei_else.45161
	lw	%v1, 5(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	min_caml_read_int
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, -1, bnei_else.45163
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
	j	bnei_cont.45164
bnei_else.45163:
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.45164:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.45162
bnei_else.45161:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.45162:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	j	bnei_cont.45160
bnei_else.45159:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_create_array
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.45160:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.45158:
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
	beqi	%v0, -1, bnei_else.45182
	sw	%v0, 2(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_read_int
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	beqi	%v0, -1, bnei_else.45184
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.45186
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
	j	bnei_cont.45187
bnei_else.45186:
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.45187:
	lw	%v1, 3(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.45185
bnei_else.45184:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
bnei_cont.45185:
	lw	%v1, 2(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.45183
bnei_else.45182:
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_create_array
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	addi	%v1, %v0, 0
bnei_cont.45183:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.45188
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
	beqi	%v0, -1, bnei_else.45189
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.45191
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
	j	bnei_cont.45192
bnei_else.45191:
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.45192:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	add	%v1, %zero, %v0
	j	bnei_cont.45190
bnei_else.45189:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	addi	%v1, %v0, 0
bnei_cont.45190:
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.45193
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
	j	bnei_cont.45194
bnei_else.45193:
	lw	%v0, 6(%sp)
	addi	%v0, %v0, 1
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_create_array
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
bnei_cont.45194:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
bnei_else.45188:
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
	beqi	%v0, -1, bnei_else.45216
	sw	%v0, 3(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	min_caml_read_int
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, -1, bnei_else.45218
	sw	%v0, 4(%sp)
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	min_caml_read_int
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	beqi	%v0, -1, bnei_else.45220
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
	j	bnei_cont.45221
bnei_else.45220:
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.45221:
	lw	%v1, 4(%sp)
	sw	%v1, 1(%v0)
	j	bnei_cont.45219
bnei_else.45218:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.45219:
	lw	%v1, 3(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.45217
bnei_else.45216:
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	min_caml_create_array
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
bnei_cont.45217:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.45222
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
	beqi	%v0, -1, bnei_else.45223
	sw	%v0, 8(%sp)
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	min_caml_read_int
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	beqi	%v0, -1, bnei_else.45225
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
	j	bnei_cont.45226
bnei_else.45225:
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.45226:
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.45224
bnei_else.45223:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	min_caml_create_array
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.45224:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.45227
	lw	%v1, 6(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	sw	%v0, 10(%sp)
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	min_caml_read_int
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	beqi	%v0, -1, bnei_else.45228
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
	j	bnei_cont.45229
bnei_else.45228:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	min_caml_create_array
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.45229:
	lw	%v1, 0(%v0)
	beqi	%v1, -1, bnei_else.45230
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
	beqi	%v1, -1, bnei_else.45231
	lw	%v1, 12(%sp)
	sw	%v0, 83(%v1)
	addi	%v0, %v1, 1
	j	read_and_network.2780
bnei_else.45231:
	jr	%ra
bnei_else.45230:
	jr	%ra
bnei_else.45227:
	jr	%ra
bnei_else.45222:
	jr	%ra
iter_setup_dirvec_constants.2877:
	blti	%v1, 0, bgti_else.45277
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	sw	%v0, 0(%sp)
	beqi	%a3, 1, bnei_else.45278
	beqi	%a3, 2, bnei_else.45280
	addi	%a3, %zero, 5
	flw	%f0, 493(%zero)
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
	beqi	%a0, 0, bnei_else.45282
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
	j	bnei_cont.45283
bnei_else.45282:
bnei_cont.45283:
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
	beqi	%a0, 0, bnei_else.45284
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f8, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f9, 2(%a0)
	fmul	%f10, %f1, %f9
	fadd	%f8, %f8, %f10
	flw	%f10, 471(%zero)
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
	j	bnei_cont.45285
bnei_else.45284:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.45285:
	flw	%f0, 3(%sp)
	fbne	%f3, %f0, fbeq_else.45286
	addi	%v1, %zero, 1
	j	fbeq_cont.45287
fbeq_else.45286:
	addi	%v1, %zero, 0
fbeq_cont.45287:
	beqi	%v1, 0, bnei_else.45288
	j	bnei_cont.45289
bnei_else.45288:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.45289:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.45279
bnei_else.45280:
	addi	%a3, %zero, 4
	flw	%f0, 493(%zero)
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
	fblt	%f2, %f0, fbgt_else.45290
	addi	%v1, %zero, 0
	j	fbgt_cont.45291
fbgt_else.45290:
	addi	%v1, %zero, 1
fbgt_cont.45291:
	beqi	%v1, 0, bnei_else.45292
	flw	%f2, 490(%zero)
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
	j	bnei_cont.45293
bnei_else.45292:
	fsw	%f2, 0(%v0)
bnei_cont.45293:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.45281:
	j	bnei_cont.45279
bnei_else.45278:
	addi	%a3, %zero, 6
	flw	%f0, 493(%zero)
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
	fbne	%f0, %f1, fbeq_else.45294
	addi	%a0, %zero, 1
	j	fbeq_cont.45295
fbeq_else.45294:
	addi	%a0, %zero, 0
fbeq_cont.45295:
	beqi	%a0, 0, bnei_else.45296
	fsw	%f1, 1(%v0)
	j	bnei_cont.45297
bnei_else.45296:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.45298
	addi	%a2, %zero, 0
	j	fbgt_cont.45299
fbgt_else.45298:
	addi	%a2, %zero, 1
fbgt_cont.45299:
	beqi	%a1, 0, bnei_else.45300
	beqi	%a2, 0, bnei_else.45302
	addi	%a1, %zero, 0
	j	bnei_cont.45301
bnei_else.45302:
	addi	%a1, %zero, 1
bnei_cont.45303:
	j	bnei_cont.45301
bnei_else.45300:
	add	%a1, %zero, %a2
bnei_cont.45301:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.45304
	j	bnei_cont.45305
bnei_else.45304:
	fneg	%f2, %f2
bnei_cont.45305:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.45297:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.45306
	addi	%a0, %zero, 1
	j	fbeq_cont.45307
fbeq_else.45306:
	addi	%a0, %zero, 0
fbeq_cont.45307:
	beqi	%a0, 0, bnei_else.45308
	fsw	%f1, 3(%v0)
	j	bnei_cont.45309
bnei_else.45308:
	lw	%a0, 4(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.45310
	addi	%a2, %zero, 0
	j	fbgt_cont.45311
fbgt_else.45310:
	addi	%a2, %zero, 1
fbgt_cont.45311:
	beqi	%a1, 0, bnei_else.45312
	beqi	%a2, 0, bnei_else.45314
	addi	%a1, %zero, 0
	j	bnei_cont.45313
bnei_else.45314:
	addi	%a1, %zero, 1
bnei_cont.45315:
	j	bnei_cont.45313
bnei_else.45312:
	add	%a1, %zero, %a2
bnei_cont.45313:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.45316
	j	bnei_cont.45317
bnei_else.45316:
	fneg	%f2, %f2
bnei_cont.45317:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.45309:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.45318
	addi	%v1, %zero, 1
	j	fbeq_cont.45319
fbeq_else.45318:
	addi	%v1, %zero, 0
fbeq_cont.45319:
	beqi	%v1, 0, bnei_else.45320
	fsw	%f1, 5(%v0)
	j	bnei_cont.45321
bnei_else.45320:
	lw	%v1, 4(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.45322
	addi	%a1, %zero, 0
	j	fbgt_cont.45323
fbgt_else.45322:
	addi	%a1, %zero, 1
fbgt_cont.45323:
	beqi	%a0, 0, bnei_else.45324
	beqi	%a1, 0, bnei_else.45326
	addi	%a0, %zero, 0
	j	bnei_cont.45325
bnei_else.45326:
	addi	%a0, %zero, 1
bnei_cont.45327:
	j	bnei_cont.45325
bnei_else.45324:
	add	%a0, %zero, %a1
bnei_cont.45325:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.45328
	j	bnei_cont.45329
bnei_else.45328:
	fneg	%f1, %f1
bnei_cont.45329:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.45321:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.45279:
	addi	%v0, %v1, -1
	blti	%v0, 0, bgti_else.45330
	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)
	lw	%a3, 1(%v1)
	beqi	%a3, 1, bnei_else.45331
	beqi	%a3, 2, bnei_else.45333
	addi	%a3, %zero, 5
	flw	%f0, 493(%zero)
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
	beqi	%a0, 0, bnei_else.45335
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
	j	bnei_cont.45336
bnei_else.45335:
bnei_cont.45336:
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
	beqi	%a0, 0, bnei_else.45337
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)
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
	j	bnei_cont.45338
bnei_else.45337:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.45338:
	flw	%f0, 10(%sp)
	fbne	%f3, %f0, fbeq_else.45339
	addi	%v1, %zero, 1
	j	fbeq_cont.45340
fbeq_else.45339:
	addi	%v1, %zero, 0
fbeq_cont.45340:
	beqi	%v1, 0, bnei_else.45341
	j	bnei_cont.45342
bnei_else.45341:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.45342:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.45332
bnei_else.45333:
	addi	%a3, %zero, 4
	flw	%f0, 493(%zero)
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
	fblt	%f1, %f0, fbgt_else.45343
	addi	%v1, %zero, 0
	j	fbgt_cont.45344
fbgt_else.45343:
	addi	%v1, %zero, 1
fbgt_cont.45344:
	beqi	%v1, 0, bnei_else.45345
	flw	%f1, 490(%zero)
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
	j	bnei_cont.45346
bnei_else.45345:
	fsw	%f1, 0(%v0)
bnei_cont.45346:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.45334:
	j	bnei_cont.45332
bnei_else.45331:
	addi	%a3, %zero, 6
	flw	%f0, 493(%zero)
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
	fbne	%f0, %f1, fbeq_else.45347
	addi	%a0, %zero, 1
	j	fbeq_cont.45348
fbeq_else.45347:
	addi	%a0, %zero, 0
fbeq_cont.45348:
	beqi	%a0, 0, bnei_else.45349
	fsw	%f1, 1(%v0)
	j	bnei_cont.45350
bnei_else.45349:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.45351
	addi	%a2, %zero, 0
	j	fbgt_cont.45352
fbgt_else.45351:
	addi	%a2, %zero, 1
fbgt_cont.45352:
	beqi	%a1, 0, bnei_else.45353
	beqi	%a2, 0, bnei_else.45355
	addi	%a1, %zero, 0
	j	bnei_cont.45354
bnei_else.45355:
	addi	%a1, %zero, 1
bnei_cont.45356:
	j	bnei_cont.45354
bnei_else.45353:
	add	%a1, %zero, %a2
bnei_cont.45354:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.45357
	j	bnei_cont.45358
bnei_else.45357:
	fneg	%f2, %f2
bnei_cont.45358:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.45350:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.45359
	addi	%a0, %zero, 1
	j	fbeq_cont.45360
fbeq_else.45359:
	addi	%a0, %zero, 0
fbeq_cont.45360:
	beqi	%a0, 0, bnei_else.45361
	fsw	%f1, 3(%v0)
	j	bnei_cont.45362
bnei_else.45361:
	lw	%a0, 11(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.45363
	addi	%a2, %zero, 0
	j	fbgt_cont.45364
fbgt_else.45363:
	addi	%a2, %zero, 1
fbgt_cont.45364:
	beqi	%a1, 0, bnei_else.45365
	beqi	%a2, 0, bnei_else.45367
	addi	%a1, %zero, 0
	j	bnei_cont.45366
bnei_else.45367:
	addi	%a1, %zero, 1
bnei_cont.45368:
	j	bnei_cont.45366
bnei_else.45365:
	add	%a1, %zero, %a2
bnei_cont.45366:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.45369
	j	bnei_cont.45370
bnei_else.45369:
	fneg	%f2, %f2
bnei_cont.45370:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.45362:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.45371
	addi	%v1, %zero, 1
	j	fbeq_cont.45372
fbeq_else.45371:
	addi	%v1, %zero, 0
fbeq_cont.45372:
	beqi	%v1, 0, bnei_else.45373
	fsw	%f1, 5(%v0)
	j	bnei_cont.45374
bnei_else.45373:
	lw	%v1, 11(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.45375
	addi	%a1, %zero, 0
	j	fbgt_cont.45376
fbgt_else.45375:
	addi	%a1, %zero, 1
fbgt_cont.45376:
	beqi	%a0, 0, bnei_else.45377
	beqi	%a1, 0, bnei_else.45379
	addi	%a0, %zero, 0
	j	bnei_cont.45378
bnei_else.45379:
	addi	%a0, %zero, 1
bnei_cont.45380:
	j	bnei_cont.45378
bnei_else.45377:
	add	%a0, %zero, %a1
bnei_cont.45378:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.45381
	j	bnei_cont.45382
bnei_else.45381:
	fneg	%f1, %f1
bnei_cont.45382:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.45374:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.45332:
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)
	j	iter_setup_dirvec_constants.2877
bgti_else.45330:
	jr	%ra
bgti_else.45277:
	jr	%ra
setup_startp_constants.2882:
	blti	%v1, 0, bgti_else.45386
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
	beqi	%a2, 2, bnei_else.45387
	addi	%at, %zero, 2
	blt	%at, %a2, bgt_else.45389
	j	bnei_cont.45388
bgt_else.45389:
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
	beqi	%a3, 0, bnei_else.45391
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
	j	bnei_cont.45392
bnei_else.45391:
	fmov	%f0, %f3
bnei_cont.45392:
	beqi	%a2, 3, bnei_else.45393
	j	bnei_cont.45394
bnei_else.45393:
	flw	%f1, 491(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.45394:
	fsw	%f0, 3(%a1)
bgt_cont.45390:
	j	bnei_cont.45388
bnei_else.45387:
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
bnei_cont.45388:
	addi	%v1, %v1, -1
	j	setup_startp_constants.2882
bgti_else.45386:
	jr	%ra
check_all_inside.2907:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.45396
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
	beqi	%a1, 1, bnei_else.45397
	beqi	%a1, 2, bnei_else.45399
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
	beqi	%a1, 0, bnei_else.45401
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
	j	bnei_cont.45402
bnei_else.45401:
	fmov	%f3, %f6
bnei_cont.45402:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.45403
	j	bnei_cont.45404
bnei_else.45403:
	flw	%f4, 491(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.45404:
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.45405
	addi	%a1, %zero, 0
	j	fbgt_cont.45406
fbgt_else.45405:
	addi	%a1, %zero, 1
fbgt_cont.45406:
	beqi	%a0, 0, bnei_else.45407
	beqi	%a1, 0, bnei_else.45409
	addi	%a0, %zero, 0
	j	bnei_cont.45408
bnei_else.45409:
	addi	%a0, %zero, 1
bnei_cont.45410:
	j	bnei_cont.45408
bnei_else.45407:
	add	%a0, %zero, %a1
bnei_cont.45408:
	beqi	%a0, 0, bnei_else.45411
	addi	%a0, %zero, 0
	j	bnei_cont.45398
bnei_else.45411:
	addi	%a0, %zero, 1
bnei_cont.45412:
	j	bnei_cont.45398
bnei_else.45399:
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
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.45413
	addi	%a1, %zero, 0
	j	fbgt_cont.45414
fbgt_else.45413:
	addi	%a1, %zero, 1
fbgt_cont.45414:
	beqi	%a0, 0, bnei_else.45415
	beqi	%a1, 0, bnei_else.45417
	addi	%a0, %zero, 0
	j	bnei_cont.45416
bnei_else.45417:
	addi	%a0, %zero, 1
bnei_cont.45418:
	j	bnei_cont.45416
bnei_else.45415:
	add	%a0, %zero, %a1
bnei_cont.45416:
	beqi	%a0, 0, bnei_else.45419
	addi	%a0, %zero, 0
	j	bnei_cont.45420
bnei_else.45419:
	addi	%a0, %zero, 1
bnei_cont.45420:
bnei_cont.45400:
	j	bnei_cont.45398
bnei_else.45397:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.45421
	addi	%a1, %zero, 0
	j	fbgt_cont.45422
fbgt_else.45421:
	addi	%a1, %zero, 1
fbgt_cont.45422:
	beqi	%a1, 0, bnei_else.45423
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.45425
	addi	%a1, %zero, 0
	j	fbgt_cont.45426
fbgt_else.45425:
	addi	%a1, %zero, 1
fbgt_cont.45426:
	beqi	%a1, 0, bnei_else.45427
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.45429
	addi	%a1, %zero, 0
	j	bnei_cont.45424
fbgt_else.45429:
	addi	%a1, %zero, 1
fbgt_cont.45430:
	j	bnei_cont.45424
bnei_else.45427:
	addi	%a1, %zero, 0
bnei_cont.45428:
	j	bnei_cont.45424
bnei_else.45423:
	addi	%a1, %zero, 0
bnei_cont.45424:
	beqi	%a1, 0, bnei_else.45431
	lw	%a0, 6(%a0)
	j	bnei_cont.45432
bnei_else.45431:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.45433
	addi	%a0, %zero, 0
	j	bnei_cont.45434
bnei_else.45433:
	addi	%a0, %zero, 1
bnei_cont.45434:
bnei_cont.45432:
bnei_cont.45398:
	beqi	%a0, 0, bnei_else.45435
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.45435:
	addi	%v0, %v0, 1
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.45436
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
	beqi	%a1, 1, bnei_else.45437
	beqi	%a1, 2, bnei_else.45439
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
	beqi	%a1, 0, bnei_else.45441
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
	j	bnei_cont.45442
bnei_else.45441:
	fmov	%f3, %f6
bnei_cont.45442:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.45443
	j	bnei_cont.45444
bnei_else.45443:
	flw	%f4, 491(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.45444:
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.45445
	addi	%a1, %zero, 0
	j	fbgt_cont.45446
fbgt_else.45445:
	addi	%a1, %zero, 1
fbgt_cont.45446:
	beqi	%a0, 0, bnei_else.45447
	beqi	%a1, 0, bnei_else.45449
	addi	%a0, %zero, 0
	j	bnei_cont.45448
bnei_else.45449:
	addi	%a0, %zero, 1
bnei_cont.45450:
	j	bnei_cont.45448
bnei_else.45447:
	add	%a0, %zero, %a1
bnei_cont.45448:
	beqi	%a0, 0, bnei_else.45451
	addi	%a0, %zero, 0
	j	bnei_cont.45438
bnei_else.45451:
	addi	%a0, %zero, 1
bnei_cont.45452:
	j	bnei_cont.45438
bnei_else.45439:
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
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.45453
	addi	%a1, %zero, 0
	j	fbgt_cont.45454
fbgt_else.45453:
	addi	%a1, %zero, 1
fbgt_cont.45454:
	beqi	%a0, 0, bnei_else.45455
	beqi	%a1, 0, bnei_else.45457
	addi	%a0, %zero, 0
	j	bnei_cont.45456
bnei_else.45457:
	addi	%a0, %zero, 1
bnei_cont.45458:
	j	bnei_cont.45456
bnei_else.45455:
	add	%a0, %zero, %a1
bnei_cont.45456:
	beqi	%a0, 0, bnei_else.45459
	addi	%a0, %zero, 0
	j	bnei_cont.45460
bnei_else.45459:
	addi	%a0, %zero, 1
bnei_cont.45460:
bnei_cont.45440:
	j	bnei_cont.45438
bnei_else.45437:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.45461
	addi	%a1, %zero, 0
	j	fbgt_cont.45462
fbgt_else.45461:
	addi	%a1, %zero, 1
fbgt_cont.45462:
	beqi	%a1, 0, bnei_else.45463
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.45465
	addi	%a1, %zero, 0
	j	fbgt_cont.45466
fbgt_else.45465:
	addi	%a1, %zero, 1
fbgt_cont.45466:
	beqi	%a1, 0, bnei_else.45467
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.45469
	addi	%a1, %zero, 0
	j	bnei_cont.45464
fbgt_else.45469:
	addi	%a1, %zero, 1
fbgt_cont.45470:
	j	bnei_cont.45464
bnei_else.45467:
	addi	%a1, %zero, 0
bnei_cont.45468:
	j	bnei_cont.45464
bnei_else.45463:
	addi	%a1, %zero, 0
bnei_cont.45464:
	beqi	%a1, 0, bnei_else.45471
	lw	%a0, 6(%a0)
	j	bnei_cont.45472
bnei_else.45471:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.45473
	addi	%a0, %zero, 0
	j	bnei_cont.45474
bnei_else.45473:
	addi	%a0, %zero, 1
bnei_cont.45474:
bnei_cont.45472:
bnei_cont.45438:
	beqi	%a0, 0, bnei_else.45475
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.45475:
	addi	%v0, %v0, 1
	j	check_all_inside.2907
bnei_else.45436:
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.45396:
	addi	%v0, %zero, 1
	jr	%ra
shadow_check_and_group.2913:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.45482
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
	beqi	%a3, 1, bnei_else.45483
	beqi	%a3, 2, bnei_else.45485
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)
	fbne	%f6, %f7, fbeq_else.45487
	addi	%a3, %zero, 1
	j	fbeq_cont.45488
fbeq_else.45487:
	addi	%a3, %zero, 0
fbeq_cont.45488:
	beqi	%a3, 0, bnei_else.45489
	addi	%a0, %zero, 0
	j	bnei_cont.45484
bnei_else.45489:
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
	beqi	%a3, 0, bnei_else.45491
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
	j	bnei_cont.45492
bnei_else.45491:
	fmov	%f1, %f9
bnei_cont.45492:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.45493
	j	bnei_cont.45494
bnei_else.45493:
	flw	%f3, 491(%zero)
	fsub	%f1, %f1, %f3
bnei_cont.45494:
	fmul	%f3, %f8, %f8
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	fblt	%f7, %f1, fbgt_else.45495
	addi	%a3, %zero, 0
	j	fbgt_cont.45496
fbgt_else.45495:
	addi	%a3, %zero, 1
fbgt_cont.45496:
	beqi	%a3, 0, bnei_else.45497
	lw	%a3, 6(%a1)
	beqi	%a3, 0, bnei_else.45499
	fsqrt	%f1, %f1
	fadd	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
	j	bnei_cont.45500
bnei_else.45499:
	fsqrt	%f1, %f1
	fsub	%f1, %f8, %f1
	flw	%f3, 4(%a0)
	fmul	%f1, %f1, %f3
	fsw	%f1, 135(%zero)
bnei_cont.45500:
	addi	%a0, %zero, 1
	j	bnei_cont.45498
bnei_else.45497:
	addi	%a0, %zero, 0
bnei_cont.45498:
bnei_cont.45490:
	j	bnei_cont.45484
bnei_else.45485:
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)
	fblt	%f6, %f7, fbgt_else.45501
	addi	%a3, %zero, 0
	j	fbgt_cont.45502
fbgt_else.45501:
	addi	%a3, %zero, 1
fbgt_cont.45502:
	beqi	%a3, 0, bnei_else.45503
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
	j	bnei_cont.45504
bnei_else.45503:
	addi	%a0, %zero, 0
bnei_cont.45504:
bnei_cont.45486:
	j	bnei_cont.45484
bnei_else.45483:
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
	fblt	%f9, %f10, fbgt_else.45505
	addi	%a3, %zero, 0
	j	fbgt_cont.45506
fbgt_else.45505:
	addi	%a3, %zero, 1
fbgt_cont.45506:
	beqi	%a3, 0, bnei_else.45507
	flw	%f9, 186(%zero)
	fmul	%f9, %f6, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	lw	%a3, 4(%a1)
	flw	%f10, 2(%a3)
	fblt	%f9, %f10, fbgt_else.45509
	addi	%a3, %zero, 0
	j	fbgt_cont.45510
fbgt_else.45509:
	addi	%a3, %zero, 1
fbgt_cont.45510:
	beqi	%a3, 0, bnei_else.45511
	flw	%f9, 493(%zero)
	fbne	%f7, %f9, fbeq_else.45513
	addi	%a3, %zero, 1
	j	fbeq_cont.45514
fbeq_else.45513:
	addi	%a3, %zero, 0
fbeq_cont.45514:
	beqi	%a3, 0, bnei_else.45515
	addi	%a3, %zero, 0
	j	bnei_cont.45508
bnei_else.45515:
	addi	%a3, %zero, 1
bnei_cont.45516:
	j	bnei_cont.45508
bnei_else.45511:
	addi	%a3, %zero, 0
bnei_cont.45512:
	j	bnei_cont.45508
bnei_else.45507:
	addi	%a3, %zero, 0
bnei_cont.45508:
	beqi	%a3, 0, bnei_else.45517
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 1
	j	bnei_cont.45518
bnei_else.45517:
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
	fblt	%f10, %f11, fbgt_else.45519
	addi	%a3, %zero, 0
	j	fbgt_cont.45520
fbgt_else.45519:
	addi	%a3, %zero, 1
fbgt_cont.45520:
	beqi	%a3, 0, bnei_else.45521
	flw	%f10, 186(%zero)
	fmul	%f10, %f6, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	lw	%a3, 4(%a1)
	flw	%f11, 2(%a3)
	fblt	%f10, %f11, fbgt_else.45523
	addi	%a3, %zero, 0
	j	fbgt_cont.45524
fbgt_else.45523:
	addi	%a3, %zero, 1
fbgt_cont.45524:
	beqi	%a3, 0, bnei_else.45525
	flw	%f10, 493(%zero)
	fbne	%f7, %f10, fbeq_else.45527
	addi	%a3, %zero, 1
	j	fbeq_cont.45528
fbeq_else.45527:
	addi	%a3, %zero, 0
fbeq_cont.45528:
	beqi	%a3, 0, bnei_else.45529
	addi	%a3, %zero, 0
	j	bnei_cont.45522
bnei_else.45529:
	addi	%a3, %zero, 1
bnei_cont.45530:
	j	bnei_cont.45522
bnei_else.45525:
	addi	%a3, %zero, 0
bnei_cont.45526:
	j	bnei_cont.45522
bnei_else.45521:
	addi	%a3, %zero, 0
bnei_cont.45522:
	beqi	%a3, 0, bnei_else.45531
	fsw	%f6, 135(%zero)
	addi	%a0, %zero, 2
	j	bnei_cont.45532
bnei_else.45531:
	flw	%f6, 4(%a0)
	fsub	%f5, %f6, %f5
	flw	%f6, 5(%a0)
	fmul	%f5, %f5, %f6
	fmul	%f7, %f5, %f9
	fadd	%f1, %f7, %f1
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f7, 0(%a0)
	fblt	%f1, %f7, fbgt_else.45533
	addi	%a0, %zero, 0
	j	fbgt_cont.45534
fbgt_else.45533:
	addi	%a0, %zero, 1
fbgt_cont.45534:
	beqi	%a0, 0, bnei_else.45535
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	lw	%a0, 4(%a1)
	flw	%f3, 1(%a0)
	fblt	%f1, %f3, fbgt_else.45537
	addi	%a0, %zero, 0
	j	fbgt_cont.45538
fbgt_else.45537:
	addi	%a0, %zero, 1
fbgt_cont.45538:
	beqi	%a0, 0, bnei_else.45539
	flw	%f1, 493(%zero)
	fbne	%f6, %f1, fbeq_else.45541
	addi	%a0, %zero, 1
	j	fbeq_cont.45542
fbeq_else.45541:
	addi	%a0, %zero, 0
fbeq_cont.45542:
	beqi	%a0, 0, bnei_else.45543
	addi	%a0, %zero, 0
	j	bnei_cont.45536
bnei_else.45543:
	addi	%a0, %zero, 1
bnei_cont.45544:
	j	bnei_cont.45536
bnei_else.45539:
	addi	%a0, %zero, 0
bnei_cont.45540:
	j	bnei_cont.45536
bnei_else.45535:
	addi	%a0, %zero, 0
bnei_cont.45536:
	beqi	%a0, 0, bnei_else.45545
	fsw	%f5, 135(%zero)
	addi	%a0, %zero, 3
	j	bnei_cont.45546
bnei_else.45545:
	addi	%a0, %zero, 0
bnei_cont.45546:
bnei_cont.45532:
bnei_cont.45518:
bnei_cont.45484:
	flw	%f1, 135(%zero)
	beqi	%a0, 0, bnei_else.45547
	flw	%f3, 468(%zero)
	fblt	%f1, %f3, fbgt_else.45549
	addi	%a0, %zero, 0
	j	bnei_cont.45548
fbgt_else.45549:
	addi	%a0, %zero, 1
fbgt_cont.45550:
	j	bnei_cont.45548
bnei_else.45547:
	addi	%a0, %zero, 0
bnei_cont.45548:
	beqi	%a0, 0, bnei_else.45551
	flw	%f3, 467(%zero)
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
	beqi	%a0, -1, bnei_else.45552
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
	beqi	%a1, 1, bnei_else.45554
	beqi	%a1, 2, bnei_else.45556
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
	beqi	%a1, 0, bnei_else.45558
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
	j	bnei_cont.45559
bnei_else.45558:
	fmov	%f3, %f6
bnei_cont.45559:
	lw	%a1, 1(%a0)
	beqi	%a1, 3, bnei_else.45560
	j	bnei_cont.45561
bnei_else.45560:
	flw	%f4, 491(%zero)
	fsub	%f3, %f3, %f4
bnei_cont.45561:
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.45562
	addi	%a1, %zero, 0
	j	fbgt_cont.45563
fbgt_else.45562:
	addi	%a1, %zero, 1
fbgt_cont.45563:
	beqi	%a0, 0, bnei_else.45564
	beqi	%a1, 0, bnei_else.45566
	addi	%a0, %zero, 0
	j	bnei_cont.45565
bnei_else.45566:
	addi	%a0, %zero, 1
bnei_cont.45567:
	j	bnei_cont.45565
bnei_else.45564:
	add	%a0, %zero, %a1
bnei_cont.45565:
	beqi	%a0, 0, bnei_else.45568
	addi	%a0, %zero, 0
	j	bnei_cont.45555
bnei_else.45568:
	addi	%a0, %zero, 1
bnei_cont.45569:
	j	bnei_cont.45555
bnei_else.45556:
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
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.45570
	addi	%a1, %zero, 0
	j	fbgt_cont.45571
fbgt_else.45570:
	addi	%a1, %zero, 1
fbgt_cont.45571:
	beqi	%a0, 0, bnei_else.45572
	beqi	%a1, 0, bnei_else.45574
	addi	%a0, %zero, 0
	j	bnei_cont.45573
bnei_else.45574:
	addi	%a0, %zero, 1
bnei_cont.45575:
	j	bnei_cont.45573
bnei_else.45572:
	add	%a0, %zero, %a1
bnei_cont.45573:
	beqi	%a0, 0, bnei_else.45576
	addi	%a0, %zero, 0
	j	bnei_cont.45577
bnei_else.45576:
	addi	%a0, %zero, 1
bnei_cont.45577:
bnei_cont.45557:
	j	bnei_cont.45555
bnei_else.45554:
	fabs	%f3, %f3
	lw	%a1, 4(%a0)
	flw	%f6, 0(%a1)
	fblt	%f3, %f6, fbgt_else.45578
	addi	%a1, %zero, 0
	j	fbgt_cont.45579
fbgt_else.45578:
	addi	%a1, %zero, 1
fbgt_cont.45579:
	beqi	%a1, 0, bnei_else.45580
	fabs	%f3, %f4
	lw	%a1, 4(%a0)
	flw	%f4, 1(%a1)
	fblt	%f3, %f4, fbgt_else.45582
	addi	%a1, %zero, 0
	j	fbgt_cont.45583
fbgt_else.45582:
	addi	%a1, %zero, 1
fbgt_cont.45583:
	beqi	%a1, 0, bnei_else.45584
	fabs	%f3, %f5
	lw	%a1, 4(%a0)
	flw	%f4, 2(%a1)
	fblt	%f3, %f4, fbgt_else.45586
	addi	%a1, %zero, 0
	j	bnei_cont.45581
fbgt_else.45586:
	addi	%a1, %zero, 1
fbgt_cont.45587:
	j	bnei_cont.45581
bnei_else.45584:
	addi	%a1, %zero, 0
bnei_cont.45585:
	j	bnei_cont.45581
bnei_else.45580:
	addi	%a1, %zero, 0
bnei_cont.45581:
	beqi	%a1, 0, bnei_else.45588
	lw	%a0, 6(%a0)
	j	bnei_cont.45589
bnei_else.45588:
	lw	%a0, 6(%a0)
	beqi	%a0, 0, bnei_else.45590
	addi	%a0, %zero, 0
	j	bnei_cont.45591
bnei_else.45590:
	addi	%a0, %zero, 1
bnei_cont.45591:
bnei_cont.45589:
bnei_cont.45555:
	beqi	%a0, 0, bnei_else.45592
	addi	%v0, %zero, 0
	j	bnei_cont.45553
bnei_else.45592:
	addi	%v0, %a2, 0
	fmov	%f29, %f2
	fmov	%f2, %f1
	fmov	%f1, %f29
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	check_all_inside.2907
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
bnei_cont.45593:
	j	bnei_cont.45553
bnei_else.45552:
	addi	%v0, %zero, 1
bnei_cont.45553:
	beqi	%v0, 0, bnei_else.45594
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.45594:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 0(%sp)
	j	shadow_check_and_group.2913
bnei_else.45551:
	lw	%a0, 6(%a1)
	beqi	%a0, 0, bnei_else.45595
	addi	%v0, %v0, 1
	j	shadow_check_and_group.2913
bnei_else.45595:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.45482:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_group.2916:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.45607
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
	beqi	%v0, 0, bnei_else.45608
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.45608:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.45609
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
	beqi	%v0, 0, bnei_else.45610
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.45610:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.45611
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
	beqi	%v0, 0, bnei_else.45612
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.45612:
	lw	%v0, 4(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	beqi	%a0, -1, bnei_else.45613
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
	beqi	%v0, 0, bnei_else.45614
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.45614:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	j	shadow_check_one_or_group.2916
bnei_else.45613:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.45611:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.45609:
	addi	%v0, %zero, 0
	jr	%ra
bnei_else.45607:
	addi	%v0, %zero, 0
	jr	%ra
shadow_check_one_or_matrix.2919:
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	addi	%a1, %zero, 0
	lw	%a2, 0(%a0)
	beqi	%a2, -1, bnei_else.45647
	sw	%a1, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a2, 99, bnei_else.45648
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
	beqi	%t0, 1, bnei_else.45650
	beqi	%t0, 2, bnei_else.45652
	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.45654
	addi	%t0, %zero, 1
	j	fbeq_cont.45655
fbeq_else.45654:
	addi	%t0, %zero, 0
fbeq_cont.45655:
	beqi	%t0, 0, bnei_else.45656
	addi	%a2, %zero, 0
	j	bnei_cont.45651
bnei_else.45656:
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
	beqi	%t0, 0, bnei_else.45658
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
	j	bnei_cont.45659
bnei_else.45658:
	fmov	%f0, %f6
bnei_cont.45659:
	lw	%t0, 1(%a3)
	beqi	%t0, 3, bnei_else.45660
	j	bnei_cont.45661
bnei_else.45660:
	flw	%f1, 491(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.45661:
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0
	fsub	%f0, %f1, %f0
	fblt	%f4, %f0, fbgt_else.45662
	addi	%t0, %zero, 0
	j	fbgt_cont.45663
fbgt_else.45662:
	addi	%t0, %zero, 1
fbgt_cont.45663:
	beqi	%t0, 0, bnei_else.45664
	lw	%a3, 6(%a3)
	beqi	%a3, 0, bnei_else.45666
	fsqrt	%f0, %f0
	fadd	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.45667
bnei_else.45666:
	fsqrt	%f0, %f0
	fsub	%f0, %f5, %f0
	flw	%f1, 4(%a2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.45667:
	addi	%a2, %zero, 1
	j	bnei_cont.45665
bnei_else.45664:
	addi	%a2, %zero, 0
bnei_cont.45665:
bnei_cont.45657:
	j	bnei_cont.45651
bnei_else.45652:
	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)
	fblt	%f3, %f4, fbgt_else.45668
	addi	%a3, %zero, 0
	j	fbgt_cont.45669
fbgt_else.45668:
	addi	%a3, %zero, 1
fbgt_cont.45669:
	beqi	%a3, 0, bnei_else.45670
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
	j	bnei_cont.45671
bnei_else.45670:
	addi	%a2, %zero, 0
bnei_cont.45671:
bnei_cont.45653:
	j	bnei_cont.45651
bnei_else.45650:
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
	fblt	%f6, %f7, fbgt_else.45672
	addi	%t0, %zero, 0
	j	fbgt_cont.45673
fbgt_else.45672:
	addi	%t0, %zero, 1
fbgt_cont.45673:
	beqi	%t0, 0, bnei_else.45674
	flw	%f6, 186(%zero)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t0, 4(%a3)
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.45676
	addi	%t0, %zero, 0
	j	fbgt_cont.45677
fbgt_else.45676:
	addi	%t0, %zero, 1
fbgt_cont.45677:
	beqi	%t0, 0, bnei_else.45678
	flw	%f6, 493(%zero)
	fbne	%f4, %f6, fbeq_else.45680
	addi	%t0, %zero, 1
	j	fbeq_cont.45681
fbeq_else.45680:
	addi	%t0, %zero, 0
fbeq_cont.45681:
	beqi	%t0, 0, bnei_else.45682
	addi	%t0, %zero, 0
	j	bnei_cont.45675
bnei_else.45682:
	addi	%t0, %zero, 1
bnei_cont.45683:
	j	bnei_cont.45675
bnei_else.45678:
	addi	%t0, %zero, 0
bnei_cont.45679:
	j	bnei_cont.45675
bnei_else.45674:
	addi	%t0, %zero, 0
bnei_cont.45675:
	beqi	%t0, 0, bnei_else.45684
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 1
	j	bnei_cont.45685
bnei_else.45684:
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
	fblt	%f7, %f8, fbgt_else.45686
	addi	%t0, %zero, 0
	j	fbgt_cont.45687
fbgt_else.45686:
	addi	%t0, %zero, 1
fbgt_cont.45687:
	beqi	%t0, 0, bnei_else.45688
	flw	%f7, 186(%zero)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.45690
	addi	%t0, %zero, 0
	j	fbgt_cont.45691
fbgt_else.45690:
	addi	%t0, %zero, 1
fbgt_cont.45691:
	beqi	%t0, 0, bnei_else.45692
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.45694
	addi	%t0, %zero, 1
	j	fbeq_cont.45695
fbeq_else.45694:
	addi	%t0, %zero, 0
fbeq_cont.45695:
	beqi	%t0, 0, bnei_else.45696
	addi	%t0, %zero, 0
	j	bnei_cont.45689
bnei_else.45696:
	addi	%t0, %zero, 1
bnei_cont.45697:
	j	bnei_cont.45689
bnei_else.45692:
	addi	%t0, %zero, 0
bnei_cont.45693:
	j	bnei_cont.45689
bnei_else.45688:
	addi	%t0, %zero, 0
bnei_cont.45689:
	beqi	%t0, 0, bnei_else.45698
	fsw	%f3, 135(%zero)
	addi	%a2, %zero, 2
	j	bnei_cont.45699
bnei_else.45698:
	flw	%f3, 4(%a2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f4, 0(%a2)
	fblt	%f0, %f4, fbgt_else.45700
	addi	%a2, %zero, 0
	j	fbgt_cont.45701
fbgt_else.45700:
	addi	%a2, %zero, 1
fbgt_cont.45701:
	beqi	%a2, 0, bnei_else.45702
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a2, 4(%a3)
	flw	%f1, 1(%a2)
	fblt	%f0, %f1, fbgt_else.45704
	addi	%a2, %zero, 0
	j	fbgt_cont.45705
fbgt_else.45704:
	addi	%a2, %zero, 1
fbgt_cont.45705:
	beqi	%a2, 0, bnei_else.45706
	flw	%f0, 493(%zero)
	fbne	%f3, %f0, fbeq_else.45708
	addi	%a2, %zero, 1
	j	fbeq_cont.45709
fbeq_else.45708:
	addi	%a2, %zero, 0
fbeq_cont.45709:
	beqi	%a2, 0, bnei_else.45710
	addi	%a2, %zero, 0
	j	bnei_cont.45703
bnei_else.45710:
	addi	%a2, %zero, 1
bnei_cont.45711:
	j	bnei_cont.45703
bnei_else.45706:
	addi	%a2, %zero, 0
bnei_cont.45707:
	j	bnei_cont.45703
bnei_else.45702:
	addi	%a2, %zero, 0
bnei_cont.45703:
	beqi	%a2, 0, bnei_else.45712
	fsw	%f2, 135(%zero)
	addi	%a2, %zero, 3
	j	bnei_cont.45713
bnei_else.45712:
	addi	%a2, %zero, 0
bnei_cont.45713:
bnei_cont.45699:
bnei_cont.45685:
bnei_cont.45651:
	beqi	%a2, 0, bnei_else.45714
	flw	%f0, 135(%zero)
	flw	%f1, 466(%zero)
	fblt	%f0, %f1, fbgt_else.45716
	addi	%a2, %zero, 0
	j	fbgt_cont.45717
fbgt_else.45716:
	addi	%a2, %zero, 1
fbgt_cont.45717:
	beqi	%a2, 0, bnei_else.45718
	lw	%a2, 1(%a0)
	beqi	%a2, -1, bnei_else.45720
	lw	%a2, 83(%a2)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.45722
	addi	%v0, %zero, 1
	j	bnei_cont.45721
bnei_else.45722:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.45724
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.45726
	addi	%v0, %zero, 1
	j	bnei_cont.45725
bnei_else.45726:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.45728
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.45730
	addi	%v0, %zero, 1
	j	bnei_cont.45729
bnei_else.45730:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.45731:
	j	bnei_cont.45729
bnei_else.45728:
	addi	%v0, %zero, 0
bnei_cont.45729:
bnei_cont.45727:
	j	bnei_cont.45725
bnei_else.45724:
	addi	%v0, %zero, 0
bnei_cont.45725:
bnei_cont.45723:
	j	bnei_cont.45721
bnei_else.45720:
	addi	%v0, %zero, 0
bnei_cont.45721:
	beqi	%v0, 0, bnei_else.45732
	addi	%v0, %zero, 1
	j	bnei_cont.45649
bnei_else.45732:
	addi	%v0, %zero, 0
bnei_cont.45733:
	j	bnei_cont.45649
bnei_else.45718:
	addi	%v0, %zero, 0
bnei_cont.45719:
	j	bnei_cont.45649
bnei_else.45714:
	addi	%v0, %zero, 0
bnei_cont.45715:
	j	bnei_cont.45649
bnei_else.45648:
	addi	%v0, %zero, 1
bnei_cont.45649:
	beqi	%v0, 0, bnei_else.45734
	lw	%v0, 1(%sp)
	lw	%v1, 1(%v0)
	beqi	%v1, -1, bnei_else.45735
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.45737
	addi	%v0, %zero, 1
	j	bnei_cont.45736
bnei_else.45737:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.45739
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.45741
	addi	%v0, %zero, 1
	j	bnei_cont.45740
bnei_else.45741:
	lw	%v0, 1(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.45743
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_and_group.2913
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	beqi	%v0, 0, bnei_else.45745
	addi	%v0, %zero, 1
	j	bnei_cont.45744
bnei_else.45745:
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	shadow_check_one_or_group.2916
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
bnei_cont.45746:
	j	bnei_cont.45744
bnei_else.45743:
	addi	%v0, %zero, 0
bnei_cont.45744:
bnei_cont.45742:
	j	bnei_cont.45740
bnei_else.45739:
	addi	%v0, %zero, 0
bnei_cont.45740:
bnei_cont.45738:
	j	bnei_cont.45736
bnei_else.45735:
	addi	%v0, %zero, 0
bnei_cont.45736:
	beqi	%v0, 0, bnei_else.45747
	addi	%v0, %zero, 1
	jr	%ra
bnei_else.45747:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.45734:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	j	shadow_check_one_or_matrix.2919
bnei_else.45647:
	addi	%v0, %zero, 0
	jr	%ra
solve_each_element.2922:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.45782
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
	beqi	%t0, 1, bnei_else.45783
	beqi	%t0, 2, bnei_else.45785
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
	beqi	%t0, 0, bnei_else.45787
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
	j	bnei_cont.45788
bnei_else.45787:
bnei_cont.45788:
	flw	%f11, 493(%zero)
	fbne	%f9, %f11, fbeq_else.45789
	addi	%t1, %zero, 1
	j	fbeq_cont.45790
fbeq_else.45789:
	addi	%t1, %zero, 0
fbeq_cont.45790:
	beqi	%t1, 0, bnei_else.45791
	addi	%t0, %zero, 0
	j	bnei_cont.45784
bnei_else.45791:
	fmul	%f14, %f6, %f1
	fmul	%f14, %f14, %f10
	fmul	%f15, %f7, %f3
	fmul	%f15, %f15, %f12
	fadd	%f14, %f14, %f15
	fmul	%f15, %f8, %f5
	fmul	%f15, %f15, %f13
	fadd	%f14, %f14, %f15
	beqi	%t0, 0, bnei_else.45793
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
	flw	%f7, 471(%zero)
	fmul	%f6, %f6, %f7
	fadd	%f6, %f14, %f6
	j	bnei_cont.45794
bnei_else.45793:
	fmov	%f6, %f14
bnei_cont.45794:
	fmul	%f7, %f1, %f1
	fmul	%f7, %f7, %f10
	fmul	%f8, %f3, %f3
	fmul	%f8, %f8, %f12
	fadd	%f7, %f7, %f8
	fmul	%f8, %f5, %f5
	fmul	%f8, %f8, %f13
	fadd	%f7, %f7, %f8
	beqi	%t0, 0, bnei_else.45795
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
	j	bnei_cont.45796
bnei_else.45795:
	fmov	%f1, %f7
bnei_cont.45796:
	lw	%t0, 1(%a2)
	beqi	%t0, 3, bnei_else.45797
	j	bnei_cont.45798
bnei_else.45797:
	flw	%f3, 491(%zero)
	fsub	%f1, %f1, %f3
bnei_cont.45798:
	fmul	%f3, %f6, %f6
	fmul	%f1, %f9, %f1
	fsub	%f1, %f3, %f1
	fblt	%f11, %f1, fbgt_else.45799
	addi	%t0, %zero, 0
	j	fbgt_cont.45800
fbgt_else.45799:
	addi	%t0, %zero, 1
fbgt_cont.45800:
	beqi	%t0, 0, bnei_else.45801
	fsqrt	%f1, %f1
	lw	%t0, 6(%a2)
	beqi	%t0, 0, bnei_else.45803
	j	bnei_cont.45804
bnei_else.45803:
	fneg	%f1, %f1
bnei_cont.45804:
	fsub	%f1, %f1, %f6
	fdiv	%f1, %f1, %f9
	fsw	%f1, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.45802
bnei_else.45801:
	addi	%t0, %zero, 0
bnei_cont.45802:
bnei_cont.45792:
	j	bnei_cont.45784
bnei_else.45785:
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
	flw	%f8, 493(%zero)
	fblt	%f8, %f6, fbgt_else.45805
	addi	%t0, %zero, 0
	j	fbgt_cont.45806
fbgt_else.45805:
	addi	%t0, %zero, 1
fbgt_cont.45806:
	beqi	%t0, 0, bnei_else.45807
	fmul	%f1, %f7, %f1
	fmul	%f3, %f9, %f3
	fadd	%f1, %f1, %f3
	fmul	%f3, %f10, %f5
	fadd	%f1, %f1, %f3
	fneg	%f1, %f1
	fdiv	%f1, %f1, %f6
	fsw	%f1, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.45808
bnei_else.45807:
	addi	%t0, %zero, 0
bnei_cont.45808:
bnei_cont.45786:
	j	bnei_cont.45784
bnei_else.45783:
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)
	fbne	%f6, %f7, fbeq_else.45809
	addi	%t0, %zero, 1
	j	fbeq_cont.45810
fbeq_else.45809:
	addi	%t0, %zero, 0
fbeq_cont.45810:
	beqi	%t0, 0, bnei_else.45811
	addi	%t0, %zero, 0
	j	bnei_cont.45812
bnei_else.45811:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f6, %f7, fbgt_else.45813
	addi	%t2, %zero, 0
	j	fbgt_cont.45814
fbgt_else.45813:
	addi	%t2, %zero, 1
fbgt_cont.45814:
	beqi	%t1, 0, bnei_else.45815
	beqi	%t2, 0, bnei_else.45817
	addi	%t1, %zero, 0
	j	bnei_cont.45816
bnei_else.45817:
	addi	%t1, %zero, 1
bnei_cont.45818:
	j	bnei_cont.45816
bnei_else.45815:
	add	%t1, %zero, %t2
bnei_cont.45816:
	flw	%f8, 0(%t0)
	beqi	%t1, 0, bnei_else.45819
	j	bnei_cont.45820
bnei_else.45819:
	fneg	%f8, %f8
bnei_cont.45820:
	fsub	%f8, %f8, %f1
	fdiv	%f8, %f8, %f6
	flw	%f9, 1(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f3
	fabs	%f9, %f9
	flw	%f10, 1(%t0)
	fblt	%f9, %f10, fbgt_else.45821
	addi	%t1, %zero, 0
	j	fbgt_cont.45822
fbgt_else.45821:
	addi	%t1, %zero, 1
fbgt_cont.45822:
	beqi	%t1, 0, bnei_else.45823
	flw	%f9, 2(%a0)
	fmul	%f9, %f8, %f9
	fadd	%f9, %f9, %f5
	fabs	%f9, %f9
	flw	%f10, 2(%t0)
	fblt	%f9, %f10, fbgt_else.45825
	addi	%t0, %zero, 0
	j	fbgt_cont.45826
fbgt_else.45825:
	addi	%t0, %zero, 1
fbgt_cont.45826:
	beqi	%t0, 0, bnei_else.45827
	fsw	%f8, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.45824
bnei_else.45827:
	addi	%t0, %zero, 0
bnei_cont.45828:
	j	bnei_cont.45824
bnei_else.45823:
	addi	%t0, %zero, 0
bnei_cont.45824:
bnei_cont.45812:
	beqi	%t0, 0, bnei_else.45829
	addi	%t0, %zero, 1
	j	bnei_cont.45830
bnei_else.45829:
	flw	%f8, 1(%a0)
	fbne	%f8, %f7, fbeq_else.45831
	addi	%t0, %zero, 1
	j	fbeq_cont.45832
fbeq_else.45831:
	addi	%t0, %zero, 0
fbeq_cont.45832:
	beqi	%t0, 0, bnei_else.45833
	addi	%t0, %zero, 0
	j	bnei_cont.45834
bnei_else.45833:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f8, %f7, fbgt_else.45835
	addi	%t2, %zero, 0
	j	fbgt_cont.45836
fbgt_else.45835:
	addi	%t2, %zero, 1
fbgt_cont.45836:
	beqi	%t1, 0, bnei_else.45837
	beqi	%t2, 0, bnei_else.45839
	addi	%t1, %zero, 0
	j	bnei_cont.45838
bnei_else.45839:
	addi	%t1, %zero, 1
bnei_cont.45840:
	j	bnei_cont.45838
bnei_else.45837:
	add	%t1, %zero, %t2
bnei_cont.45838:
	flw	%f9, 1(%t0)
	beqi	%t1, 0, bnei_else.45841
	j	bnei_cont.45842
bnei_else.45841:
	fneg	%f9, %f9
bnei_cont.45842:
	fsub	%f9, %f9, %f3
	fdiv	%f9, %f9, %f8
	flw	%f10, 2(%a0)
	fmul	%f10, %f9, %f10
	fadd	%f10, %f10, %f5
	fabs	%f10, %f10
	flw	%f11, 2(%t0)
	fblt	%f10, %f11, fbgt_else.45843
	addi	%t1, %zero, 0
	j	fbgt_cont.45844
fbgt_else.45843:
	addi	%t1, %zero, 1
fbgt_cont.45844:
	beqi	%t1, 0, bnei_else.45845
	fmul	%f10, %f9, %f6
	fadd	%f10, %f10, %f1
	fabs	%f10, %f10
	flw	%f11, 0(%t0)
	fblt	%f10, %f11, fbgt_else.45847
	addi	%t0, %zero, 0
	j	fbgt_cont.45848
fbgt_else.45847:
	addi	%t0, %zero, 1
fbgt_cont.45848:
	beqi	%t0, 0, bnei_else.45849
	fsw	%f9, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.45846
bnei_else.45849:
	addi	%t0, %zero, 0
bnei_cont.45850:
	j	bnei_cont.45846
bnei_else.45845:
	addi	%t0, %zero, 0
bnei_cont.45846:
bnei_cont.45834:
	beqi	%t0, 0, bnei_else.45851
	addi	%t0, %zero, 2
	j	bnei_cont.45852
bnei_else.45851:
	flw	%f9, 2(%a0)
	fbne	%f9, %f7, fbeq_else.45853
	addi	%t0, %zero, 1
	j	fbeq_cont.45854
fbeq_else.45853:
	addi	%t0, %zero, 0
fbeq_cont.45854:
	beqi	%t0, 0, bnei_else.45855
	addi	%t0, %zero, 0
	j	bnei_cont.45856
bnei_else.45855:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	fblt	%f9, %f7, fbgt_else.45857
	addi	%t2, %zero, 0
	j	fbgt_cont.45858
fbgt_else.45857:
	addi	%t2, %zero, 1
fbgt_cont.45858:
	beqi	%t1, 0, bnei_else.45859
	beqi	%t2, 0, bnei_else.45861
	addi	%t1, %zero, 0
	j	bnei_cont.45860
bnei_else.45861:
	addi	%t1, %zero, 1
bnei_cont.45862:
	j	bnei_cont.45860
bnei_else.45859:
	add	%t1, %zero, %t2
bnei_cont.45860:
	flw	%f7, 2(%t0)
	beqi	%t1, 0, bnei_else.45863
	j	bnei_cont.45864
bnei_else.45863:
	fneg	%f7, %f7
bnei_cont.45864:
	fsub	%f5, %f7, %f5
	fdiv	%f5, %f5, %f9
	fmul	%f6, %f5, %f6
	fadd	%f1, %f6, %f1
	fabs	%f1, %f1
	flw	%f6, 0(%t0)
	fblt	%f1, %f6, fbgt_else.45865
	addi	%t1, %zero, 0
	j	fbgt_cont.45866
fbgt_else.45865:
	addi	%t1, %zero, 1
fbgt_cont.45866:
	beqi	%t1, 0, bnei_else.45867
	fmul	%f1, %f5, %f8
	fadd	%f1, %f1, %f3
	fabs	%f1, %f1
	flw	%f3, 1(%t0)
	fblt	%f1, %f3, fbgt_else.45869
	addi	%t0, %zero, 0
	j	fbgt_cont.45870
fbgt_else.45869:
	addi	%t0, %zero, 1
fbgt_cont.45870:
	beqi	%t0, 0, bnei_else.45871
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.45868
bnei_else.45871:
	addi	%t0, %zero, 0
bnei_cont.45872:
	j	bnei_cont.45868
bnei_else.45867:
	addi	%t0, %zero, 0
bnei_cont.45868:
bnei_cont.45856:
	beqi	%t0, 0, bnei_else.45873
	addi	%t0, %zero, 3
	j	bnei_cont.45874
bnei_else.45873:
	addi	%t0, %zero, 0
bnei_cont.45874:
bnei_cont.45852:
bnei_cont.45830:
bnei_cont.45784:
	beqi	%t0, 0, bnei_else.45875
	flw	%f1, 135(%zero)
	flw	%f3, 493(%zero)
	fblt	%f3, %f1, fbgt_else.45876
	addi	%a2, %zero, 0
	j	fbgt_cont.45877
fbgt_else.45876:
	addi	%a2, %zero, 1
fbgt_cont.45877:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a2, 0, bnei_else.45878
	flw	%f5, 137(%zero)
	fblt	%f1, %f5, fbgt_else.45880
	addi	%a2, %zero, 0
	j	fbgt_cont.45881
fbgt_else.45880:
	addi	%a2, %zero, 1
fbgt_cont.45881:
	beqi	%a2, 0, bnei_else.45882
	flw	%f5, 467(%zero)
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
	beqi	%a2, -1, bnei_else.45884
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
	beqi	%t1, 1, bnei_else.45886
	beqi	%t1, 2, bnei_else.45888
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
	beqi	%t1, 0, bnei_else.45890
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
	j	bnei_cont.45891
bnei_else.45890:
	fmov	%f5, %f8
bnei_cont.45891:
	lw	%t1, 1(%a2)
	beqi	%t1, 3, bnei_else.45892
	j	bnei_cont.45893
bnei_else.45892:
	flw	%f6, 491(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.45893:
	lw	%a2, 6(%a2)
	fblt	%f5, %f3, fbgt_else.45894
	addi	%t1, %zero, 0
	j	fbgt_cont.45895
fbgt_else.45894:
	addi	%t1, %zero, 1
fbgt_cont.45895:
	beqi	%a2, 0, bnei_else.45896
	beqi	%t1, 0, bnei_else.45898
	addi	%a2, %zero, 0
	j	bnei_cont.45897
bnei_else.45898:
	addi	%a2, %zero, 1
bnei_cont.45899:
	j	bnei_cont.45897
bnei_else.45896:
	add	%a2, %zero, %t1
bnei_cont.45897:
	beqi	%a2, 0, bnei_else.45900
	addi	%a2, %zero, 0
	j	bnei_cont.45887
bnei_else.45900:
	addi	%a2, %zero, 1
bnei_cont.45901:
	j	bnei_cont.45887
bnei_else.45888:
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
	fblt	%f5, %f3, fbgt_else.45902
	addi	%t1, %zero, 0
	j	fbgt_cont.45903
fbgt_else.45902:
	addi	%t1, %zero, 1
fbgt_cont.45903:
	beqi	%a2, 0, bnei_else.45904
	beqi	%t1, 0, bnei_else.45906
	addi	%a2, %zero, 0
	j	bnei_cont.45905
bnei_else.45906:
	addi	%a2, %zero, 1
bnei_cont.45907:
	j	bnei_cont.45905
bnei_else.45904:
	add	%a2, %zero, %t1
bnei_cont.45905:
	beqi	%a2, 0, bnei_else.45908
	addi	%a2, %zero, 0
	j	bnei_cont.45909
bnei_else.45908:
	addi	%a2, %zero, 1
bnei_cont.45909:
bnei_cont.45889:
	j	bnei_cont.45887
bnei_else.45886:
	fabs	%f3, %f5
	lw	%t1, 4(%a2)
	flw	%f5, 0(%t1)
	fblt	%f3, %f5, fbgt_else.45910
	addi	%t1, %zero, 0
	j	fbgt_cont.45911
fbgt_else.45910:
	addi	%t1, %zero, 1
fbgt_cont.45911:
	beqi	%t1, 0, bnei_else.45912
	fabs	%f3, %f6
	lw	%t1, 4(%a2)
	flw	%f5, 1(%t1)
	fblt	%f3, %f5, fbgt_else.45914
	addi	%t1, %zero, 0
	j	fbgt_cont.45915
fbgt_else.45914:
	addi	%t1, %zero, 1
fbgt_cont.45915:
	beqi	%t1, 0, bnei_else.45916
	fabs	%f3, %f7
	lw	%t1, 4(%a2)
	flw	%f5, 2(%t1)
	fblt	%f3, %f5, fbgt_else.45918
	addi	%t1, %zero, 0
	j	bnei_cont.45913
fbgt_else.45918:
	addi	%t1, %zero, 1
fbgt_cont.45919:
	j	bnei_cont.45913
bnei_else.45916:
	addi	%t1, %zero, 0
bnei_cont.45917:
	j	bnei_cont.45913
bnei_else.45912:
	addi	%t1, %zero, 0
bnei_cont.45913:
	beqi	%t1, 0, bnei_else.45920
	lw	%a2, 6(%a2)
	j	bnei_cont.45921
bnei_else.45920:
	lw	%a2, 6(%a2)
	beqi	%a2, 0, bnei_else.45922
	addi	%a2, %zero, 0
	j	bnei_cont.45923
bnei_else.45922:
	addi	%a2, %zero, 1
bnei_cont.45923:
bnei_cont.45921:
bnei_cont.45887:
	beqi	%a2, 0, bnei_else.45924
	addi	%v0, %zero, 0
	j	bnei_cont.45885
bnei_else.45924:
	addi	%v0, %a3, 0
	fmov	%f1, %f2
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	check_all_inside.2907
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.45925:
	j	bnei_cont.45885
bnei_else.45884:
	addi	%v0, %zero, 1
bnei_cont.45885:
	beqi	%v0, 0, bnei_else.45926
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
	j	bnei_cont.45879
bnei_else.45926:
bnei_cont.45927:
	j	bnei_cont.45879
bnei_else.45882:
bnei_cont.45883:
	j	bnei_cont.45879
bnei_else.45878:
bnei_cont.45879:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element.2922
bnei_else.45875:
	lw	%a1, 6(%a2)
	beqi	%a1, 0, bnei_else.45928
	addi	%v0, %v0, 1
	j	solve_each_element.2922
bnei_else.45928:
	jr	%ra
bnei_else.45782:
	jr	%ra
solve_one_or_network.2926:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.45963
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
	beqi	%a0, -1, bnei_else.45964
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
	beqi	%a0, -1, bnei_else.45965
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
	beqi	%a0, -1, bnei_else.45966
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
	beqi	%a0, -1, bnei_else.45967
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
	beqi	%a0, -1, bnei_else.45968
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
	beqi	%a0, -1, bnei_else.45969
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
	beqi	%a0, -1, bnei_else.45970
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
bnei_else.45970:
	jr	%ra
bnei_else.45969:
	jr	%ra
bnei_else.45968:
	jr	%ra
bnei_else.45967:
	jr	%ra
bnei_else.45966:
	jr	%ra
bnei_else.45965:
	jr	%ra
bnei_else.45964:
	jr	%ra
bnei_else.45963:
	jr	%ra
trace_or_matrix.2930:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.46101
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.46102
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
	beqi	%t0, 1, bnei_else.46104
	beqi	%t0, 2, bnei_else.46106
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
	beqi	%t0, 0, bnei_else.46108
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
	j	bnei_cont.46109
bnei_else.46108:
bnei_cont.46109:
	flw	%f8, 493(%zero)
	fbne	%f6, %f8, fbeq_else.46110
	addi	%t1, %zero, 1
	j	fbeq_cont.46111
fbeq_else.46110:
	addi	%t1, %zero, 0
fbeq_cont.46111:
	beqi	%t1, 0, bnei_else.46112
	addi	%a3, %zero, 0
	j	bnei_cont.46105
bnei_else.46112:
	fmul	%f11, %f3, %f0
	fmul	%f11, %f11, %f7
	fmul	%f12, %f4, %f1
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	fmul	%f12, %f5, %f2
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	beqi	%t0, 0, bnei_else.46114
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
	flw	%f4, 471(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f11, %f3
	j	bnei_cont.46115
bnei_else.46114:
	fmov	%f3, %f11
bnei_cont.46115:
	fmul	%f4, %f0, %f0
	fmul	%f4, %f4, %f7
	fmul	%f5, %f1, %f1
	fmul	%f5, %f5, %f9
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2
	fmul	%f5, %f5, %f10
	fadd	%f4, %f4, %f5
	beqi	%t0, 0, bnei_else.46116
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
	j	bnei_cont.46117
bnei_else.46116:
	fmov	%f0, %f4
bnei_cont.46117:
	lw	%t0, 1(%a3)
	beqi	%t0, 3, bnei_else.46118
	j	bnei_cont.46119
bnei_else.46118:
	flw	%f1, 491(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.46119:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f8, %f0, fbgt_else.46120
	addi	%t0, %zero, 0
	j	fbgt_cont.46121
fbgt_else.46120:
	addi	%t0, %zero, 1
fbgt_cont.46121:
	beqi	%t0, 0, bnei_else.46122
	fsqrt	%f0, %f0
	lw	%a3, 6(%a3)
	beqi	%a3, 0, bnei_else.46124
	j	bnei_cont.46125
bnei_else.46124:
	fneg	%f0, %f0
bnei_cont.46125:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.46123
bnei_else.46122:
	addi	%a3, %zero, 0
bnei_cont.46123:
bnei_cont.46113:
	j	bnei_cont.46105
bnei_else.46106:
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
	flw	%f5, 493(%zero)
	fblt	%f5, %f3, fbgt_else.46126
	addi	%a3, %zero, 0
	j	fbgt_cont.46127
fbgt_else.46126:
	addi	%a3, %zero, 1
fbgt_cont.46127:
	beqi	%a3, 0, bnei_else.46128
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.46129
bnei_else.46128:
	addi	%a3, %zero, 0
bnei_cont.46129:
bnei_cont.46107:
	j	bnei_cont.46105
bnei_else.46104:
	flw	%f3, 0(%a0)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.46130
	addi	%t0, %zero, 1
	j	fbeq_cont.46131
fbeq_else.46130:
	addi	%t0, %zero, 0
fbeq_cont.46131:
	beqi	%t0, 0, bnei_else.46132
	addi	%t0, %zero, 0
	j	bnei_cont.46133
bnei_else.46132:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f3, %f4, fbgt_else.46134
	addi	%t2, %zero, 0
	j	fbgt_cont.46135
fbgt_else.46134:
	addi	%t2, %zero, 1
fbgt_cont.46135:
	beqi	%t1, 0, bnei_else.46136
	beqi	%t2, 0, bnei_else.46138
	addi	%t1, %zero, 0
	j	bnei_cont.46137
bnei_else.46138:
	addi	%t1, %zero, 1
bnei_cont.46139:
	j	bnei_cont.46137
bnei_else.46136:
	add	%t1, %zero, %t2
bnei_cont.46137:
	flw	%f5, 0(%t0)
	beqi	%t1, 0, bnei_else.46140
	j	bnei_cont.46141
bnei_else.46140:
	fneg	%f5, %f5
bnei_cont.46141:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%t0)
	fblt	%f6, %f7, fbgt_else.46142
	addi	%t1, %zero, 0
	j	fbgt_cont.46143
fbgt_else.46142:
	addi	%t1, %zero, 1
fbgt_cont.46143:
	beqi	%t1, 0, bnei_else.46144
	flw	%f6, 2(%a0)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%t0)
	fblt	%f6, %f7, fbgt_else.46146
	addi	%t0, %zero, 0
	j	fbgt_cont.46147
fbgt_else.46146:
	addi	%t0, %zero, 1
fbgt_cont.46147:
	beqi	%t0, 0, bnei_else.46148
	fsw	%f5, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.46145
bnei_else.46148:
	addi	%t0, %zero, 0
bnei_cont.46149:
	j	bnei_cont.46145
bnei_else.46144:
	addi	%t0, %zero, 0
bnei_cont.46145:
bnei_cont.46133:
	beqi	%t0, 0, bnei_else.46150
	addi	%a3, %zero, 1
	j	bnei_cont.46151
bnei_else.46150:
	flw	%f5, 1(%a0)
	fbne	%f5, %f4, fbeq_else.46152
	addi	%t0, %zero, 1
	j	fbeq_cont.46153
fbeq_else.46152:
	addi	%t0, %zero, 0
fbeq_cont.46153:
	beqi	%t0, 0, bnei_else.46154
	addi	%t0, %zero, 0
	j	bnei_cont.46155
bnei_else.46154:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	fblt	%f5, %f4, fbgt_else.46156
	addi	%t2, %zero, 0
	j	fbgt_cont.46157
fbgt_else.46156:
	addi	%t2, %zero, 1
fbgt_cont.46157:
	beqi	%t1, 0, bnei_else.46158
	beqi	%t2, 0, bnei_else.46160
	addi	%t1, %zero, 0
	j	bnei_cont.46159
bnei_else.46160:
	addi	%t1, %zero, 1
bnei_cont.46161:
	j	bnei_cont.46159
bnei_else.46158:
	add	%t1, %zero, %t2
bnei_cont.46159:
	flw	%f6, 1(%t0)
	beqi	%t1, 0, bnei_else.46162
	j	bnei_cont.46163
bnei_else.46162:
	fneg	%f6, %f6
bnei_cont.46163:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a0)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.46164
	addi	%t1, %zero, 0
	j	fbgt_cont.46165
fbgt_else.46164:
	addi	%t1, %zero, 1
fbgt_cont.46165:
	beqi	%t1, 0, bnei_else.46166
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%t0)
	fblt	%f7, %f8, fbgt_else.46168
	addi	%t0, %zero, 0
	j	fbgt_cont.46169
fbgt_else.46168:
	addi	%t0, %zero, 1
fbgt_cont.46169:
	beqi	%t0, 0, bnei_else.46170
	fsw	%f6, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.46167
bnei_else.46170:
	addi	%t0, %zero, 0
bnei_cont.46171:
	j	bnei_cont.46167
bnei_else.46166:
	addi	%t0, %zero, 0
bnei_cont.46167:
bnei_cont.46155:
	beqi	%t0, 0, bnei_else.46172
	addi	%a3, %zero, 2
	j	bnei_cont.46173
bnei_else.46172:
	flw	%f6, 2(%a0)
	fbne	%f6, %f4, fbeq_else.46174
	addi	%t0, %zero, 1
	j	fbeq_cont.46175
fbeq_else.46174:
	addi	%t0, %zero, 0
fbeq_cont.46175:
	beqi	%t0, 0, bnei_else.46176
	addi	%a3, %zero, 0
	j	bnei_cont.46177
bnei_else.46176:
	lw	%t0, 4(%a3)
	lw	%a3, 6(%a3)
	fblt	%f6, %f4, fbgt_else.46178
	addi	%t1, %zero, 0
	j	fbgt_cont.46179
fbgt_else.46178:
	addi	%t1, %zero, 1
fbgt_cont.46179:
	beqi	%a3, 0, bnei_else.46180
	beqi	%t1, 0, bnei_else.46182
	addi	%a3, %zero, 0
	j	bnei_cont.46181
bnei_else.46182:
	addi	%a3, %zero, 1
bnei_cont.46183:
	j	bnei_cont.46181
bnei_else.46180:
	add	%a3, %zero, %t1
bnei_cont.46181:
	flw	%f4, 2(%t0)
	beqi	%a3, 0, bnei_else.46184
	j	bnei_cont.46185
bnei_else.46184:
	fneg	%f4, %f4
bnei_cont.46185:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%t0)
	fblt	%f0, %f3, fbgt_else.46186
	addi	%a3, %zero, 0
	j	fbgt_cont.46187
fbgt_else.46186:
	addi	%a3, %zero, 1
fbgt_cont.46187:
	beqi	%a3, 0, bnei_else.46188
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.46190
	addi	%a3, %zero, 0
	j	fbgt_cont.46191
fbgt_else.46190:
	addi	%a3, %zero, 1
fbgt_cont.46191:
	beqi	%a3, 0, bnei_else.46192
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.46189
bnei_else.46192:
	addi	%a3, %zero, 0
bnei_cont.46193:
	j	bnei_cont.46189
bnei_else.46188:
	addi	%a3, %zero, 0
bnei_cont.46189:
bnei_cont.46177:
	beqi	%a3, 0, bnei_else.46194
	addi	%a3, %zero, 3
	j	bnei_cont.46195
bnei_else.46194:
	addi	%a3, %zero, 0
bnei_cont.46195:
bnei_cont.46173:
bnei_cont.46151:
bnei_cont.46105:
	beqi	%a3, 0, bnei_else.46196
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.46198
	addi	%a3, %zero, 0
	j	fbgt_cont.46199
fbgt_else.46198:
	addi	%a3, %zero, 1
fbgt_cont.46199:
	beqi	%a3, 0, bnei_else.46200
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.46202
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
	beqi	%v1, -1, bnei_else.46204
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
	beqi	%v1, -1, bnei_else.46206
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
	beqi	%v1, -1, bnei_else.46208
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
	beqi	%v1, -1, bnei_else.46210
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
	beqi	%v1, -1, bnei_else.46212
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
	beqi	%v1, -1, bnei_else.46214
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
	j	bnei_cont.46103
bnei_else.46214:
bnei_cont.46215:
	j	bnei_cont.46103
bnei_else.46212:
bnei_cont.46213:
	j	bnei_cont.46103
bnei_else.46210:
bnei_cont.46211:
	j	bnei_cont.46103
bnei_else.46208:
bnei_cont.46209:
	j	bnei_cont.46103
bnei_else.46206:
bnei_cont.46207:
	j	bnei_cont.46103
bnei_else.46204:
bnei_cont.46205:
	j	bnei_cont.46103
bnei_else.46202:
bnei_cont.46203:
	j	bnei_cont.46103
bnei_else.46200:
bnei_cont.46201:
	j	bnei_cont.46103
bnei_else.46196:
bnei_cont.46197:
	j	bnei_cont.46103
bnei_else.46102:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.46216
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
	beqi	%v1, -1, bnei_else.46218
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
	beqi	%v1, -1, bnei_else.46220
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
	beqi	%v1, -1, bnei_else.46222
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
	beqi	%v1, -1, bnei_else.46224
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
	beqi	%v1, -1, bnei_else.46226
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
	beqi	%v1, -1, bnei_else.46228
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
	j	bnei_cont.46217
bnei_else.46228:
bnei_cont.46229:
	j	bnei_cont.46217
bnei_else.46226:
bnei_cont.46227:
	j	bnei_cont.46217
bnei_else.46224:
bnei_cont.46225:
	j	bnei_cont.46217
bnei_else.46222:
bnei_cont.46223:
	j	bnei_cont.46217
bnei_else.46220:
bnei_cont.46221:
	j	bnei_cont.46217
bnei_else.46218:
bnei_cont.46219:
	j	bnei_cont.46217
bnei_else.46216:
bnei_cont.46217:
bnei_cont.46103:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.46230
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.46231
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
	beqi	%a2, 1, bnei_else.46233
	beqi	%a2, 2, bnei_else.46235
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
	beqi	%a3, 0, bnei_else.46237
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
	j	bnei_cont.46238
bnei_else.46237:
bnei_cont.46238:
	flw	%f7, 493(%zero)
	fbne	%f6, %f7, fbeq_else.46239
	addi	%a3, %zero, 1
	j	fbeq_cont.46240
fbeq_else.46239:
	addi	%a3, %zero, 0
fbeq_cont.46240:
	beqi	%a3, 0, bnei_else.46241
	addi	%a1, %zero, 0
	j	bnei_cont.46234
bnei_else.46241:
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
	beqi	%a3, 0, bnei_else.46243
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
	flw	%f4, 471(%zero)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f8, %f3
	j	bnei_cont.46244
bnei_else.46243:
	fmov	%f3, %f8
bnei_cont.46244:
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
	beqi	%a3, 0, bnei_else.46245
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
	j	bnei_cont.46246
bnei_else.46245:
	fmov	%f0, %f4
bnei_cont.46246:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.46247
	j	bnei_cont.46248
bnei_else.46247:
	flw	%f1, 491(%zero)
	fsub	%f0, %f0, %f1
bnei_cont.46248:
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0
	fsub	%f0, %f1, %f0
	fblt	%f7, %f0, fbgt_else.46249
	addi	%a3, %zero, 0
	j	fbgt_cont.46250
fbgt_else.46249:
	addi	%a3, %zero, 1
fbgt_cont.46250:
	beqi	%a3, 0, bnei_else.46251
	fsqrt	%f0, %f0
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.46253
	j	bnei_cont.46254
bnei_else.46253:
	fneg	%f0, %f0
bnei_cont.46254:
	fsub	%f0, %f0, %f3
	fdiv	%f0, %f0, %f6
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.46252
bnei_else.46251:
	addi	%a1, %zero, 0
bnei_cont.46252:
bnei_cont.46242:
	j	bnei_cont.46234
bnei_else.46235:
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
	flw	%f5, 493(%zero)
	fblt	%f5, %f3, fbgt_else.46255
	addi	%a1, %zero, 0
	j	fbgt_cont.46256
fbgt_else.46255:
	addi	%a1, %zero, 1
fbgt_cont.46256:
	beqi	%a1, 0, bnei_else.46257
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.46258
bnei_else.46257:
	addi	%a1, %zero, 0
bnei_cont.46258:
bnei_cont.46236:
	j	bnei_cont.46234
bnei_else.46233:
	lw	%a2, 0(%sp)
	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.46259
	addi	%a3, %zero, 1
	j	fbeq_cont.46260
fbeq_else.46259:
	addi	%a3, %zero, 0
fbeq_cont.46260:
	beqi	%a3, 0, bnei_else.46261
	addi	%a3, %zero, 0
	j	bnei_cont.46262
bnei_else.46261:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f3, %f4, fbgt_else.46263
	addi	%t1, %zero, 0
	j	fbgt_cont.46264
fbgt_else.46263:
	addi	%t1, %zero, 1
fbgt_cont.46264:
	beqi	%t0, 0, bnei_else.46265
	beqi	%t1, 0, bnei_else.46267
	addi	%t0, %zero, 0
	j	bnei_cont.46266
bnei_else.46267:
	addi	%t0, %zero, 1
bnei_cont.46268:
	j	bnei_cont.46266
bnei_else.46265:
	add	%t0, %zero, %t1
bnei_cont.46266:
	flw	%f5, 0(%a3)
	beqi	%t0, 0, bnei_else.46269
	j	bnei_cont.46270
bnei_else.46269:
	fneg	%f5, %f5
bnei_cont.46270:
	fsub	%f5, %f5, %f0
	fdiv	%f5, %f5, %f3
	flw	%f6, 1(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f1
	fabs	%f6, %f6
	flw	%f7, 1(%a3)
	fblt	%f6, %f7, fbgt_else.46271
	addi	%t0, %zero, 0
	j	fbgt_cont.46272
fbgt_else.46271:
	addi	%t0, %zero, 1
fbgt_cont.46272:
	beqi	%t0, 0, bnei_else.46273
	flw	%f6, 2(%a2)
	fmul	%f6, %f5, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	flw	%f7, 2(%a3)
	fblt	%f6, %f7, fbgt_else.46275
	addi	%a3, %zero, 0
	j	fbgt_cont.46276
fbgt_else.46275:
	addi	%a3, %zero, 1
fbgt_cont.46276:
	beqi	%a3, 0, bnei_else.46277
	fsw	%f5, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.46274
bnei_else.46277:
	addi	%a3, %zero, 0
bnei_cont.46278:
	j	bnei_cont.46274
bnei_else.46273:
	addi	%a3, %zero, 0
bnei_cont.46274:
bnei_cont.46262:
	beqi	%a3, 0, bnei_else.46279
	addi	%a1, %zero, 1
	j	bnei_cont.46280
bnei_else.46279:
	flw	%f5, 1(%a2)
	fbne	%f5, %f4, fbeq_else.46281
	addi	%a3, %zero, 1
	j	fbeq_cont.46282
fbeq_else.46281:
	addi	%a3, %zero, 0
fbeq_cont.46282:
	beqi	%a3, 0, bnei_else.46283
	addi	%a3, %zero, 0
	j	bnei_cont.46284
bnei_else.46283:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	fblt	%f5, %f4, fbgt_else.46285
	addi	%t1, %zero, 0
	j	fbgt_cont.46286
fbgt_else.46285:
	addi	%t1, %zero, 1
fbgt_cont.46286:
	beqi	%t0, 0, bnei_else.46287
	beqi	%t1, 0, bnei_else.46289
	addi	%t0, %zero, 0
	j	bnei_cont.46288
bnei_else.46289:
	addi	%t0, %zero, 1
bnei_cont.46290:
	j	bnei_cont.46288
bnei_else.46287:
	add	%t0, %zero, %t1
bnei_cont.46288:
	flw	%f6, 1(%a3)
	beqi	%t0, 0, bnei_else.46291
	j	bnei_cont.46292
bnei_else.46291:
	fneg	%f6, %f6
bnei_cont.46292:
	fsub	%f6, %f6, %f1
	fdiv	%f6, %f6, %f5
	flw	%f7, 2(%a2)
	fmul	%f7, %f6, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	flw	%f8, 2(%a3)
	fblt	%f7, %f8, fbgt_else.46293
	addi	%t0, %zero, 0
	j	fbgt_cont.46294
fbgt_else.46293:
	addi	%t0, %zero, 1
fbgt_cont.46294:
	beqi	%t0, 0, bnei_else.46295
	fmul	%f7, %f6, %f3
	fadd	%f7, %f7, %f0
	fabs	%f7, %f7
	flw	%f8, 0(%a3)
	fblt	%f7, %f8, fbgt_else.46297
	addi	%a3, %zero, 0
	j	fbgt_cont.46298
fbgt_else.46297:
	addi	%a3, %zero, 1
fbgt_cont.46298:
	beqi	%a3, 0, bnei_else.46299
	fsw	%f6, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.46296
bnei_else.46299:
	addi	%a3, %zero, 0
bnei_cont.46300:
	j	bnei_cont.46296
bnei_else.46295:
	addi	%a3, %zero, 0
bnei_cont.46296:
bnei_cont.46284:
	beqi	%a3, 0, bnei_else.46301
	addi	%a1, %zero, 2
	j	bnei_cont.46302
bnei_else.46301:
	flw	%f6, 2(%a2)
	fbne	%f6, %f4, fbeq_else.46303
	addi	%a3, %zero, 1
	j	fbeq_cont.46304
fbeq_else.46303:
	addi	%a3, %zero, 0
fbeq_cont.46304:
	beqi	%a3, 0, bnei_else.46305
	addi	%a1, %zero, 0
	j	bnei_cont.46306
bnei_else.46305:
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)
	fblt	%f6, %f4, fbgt_else.46307
	addi	%t0, %zero, 0
	j	fbgt_cont.46308
fbgt_else.46307:
	addi	%t0, %zero, 1
fbgt_cont.46308:
	beqi	%a1, 0, bnei_else.46309
	beqi	%t0, 0, bnei_else.46311
	addi	%a1, %zero, 0
	j	bnei_cont.46310
bnei_else.46311:
	addi	%a1, %zero, 1
bnei_cont.46312:
	j	bnei_cont.46310
bnei_else.46309:
	add	%a1, %zero, %t0
bnei_cont.46310:
	flw	%f4, 2(%a3)
	beqi	%a1, 0, bnei_else.46313
	j	bnei_cont.46314
bnei_else.46313:
	fneg	%f4, %f4
bnei_cont.46314:
	fsub	%f2, %f4, %f2
	fdiv	%f2, %f2, %f6
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	fabs	%f0, %f0
	flw	%f3, 0(%a3)
	fblt	%f0, %f3, fbgt_else.46315
	addi	%a1, %zero, 0
	j	fbgt_cont.46316
fbgt_else.46315:
	addi	%a1, %zero, 1
fbgt_cont.46316:
	beqi	%a1, 0, bnei_else.46317
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.46319
	addi	%a1, %zero, 0
	j	fbgt_cont.46320
fbgt_else.46319:
	addi	%a1, %zero, 1
fbgt_cont.46320:
	beqi	%a1, 0, bnei_else.46321
	fsw	%f2, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.46318
bnei_else.46321:
	addi	%a1, %zero, 0
bnei_cont.46322:
	j	bnei_cont.46318
bnei_else.46317:
	addi	%a1, %zero, 0
bnei_cont.46318:
bnei_cont.46306:
	beqi	%a1, 0, bnei_else.46323
	addi	%a1, %zero, 3
	j	bnei_cont.46324
bnei_else.46323:
	addi	%a1, %zero, 0
bnei_cont.46324:
bnei_cont.46302:
bnei_cont.46280:
bnei_cont.46234:
	beqi	%a1, 0, bnei_else.46325
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.46327
	addi	%a1, %zero, 0
	j	fbgt_cont.46328
fbgt_else.46327:
	addi	%a1, %zero, 1
fbgt_cont.46328:
	beqi	%a1, 0, bnei_else.46329
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.46331
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
	beqi	%v1, -1, bnei_else.46333
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
	beqi	%v1, -1, bnei_else.46335
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
	beqi	%v1, -1, bnei_else.46337
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
	beqi	%v1, -1, bnei_else.46339
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
	beqi	%v1, -1, bnei_else.46341
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
	j	bnei_cont.46232
bnei_else.46341:
bnei_cont.46342:
	j	bnei_cont.46232
bnei_else.46339:
bnei_cont.46340:
	j	bnei_cont.46232
bnei_else.46337:
bnei_cont.46338:
	j	bnei_cont.46232
bnei_else.46335:
bnei_cont.46336:
	j	bnei_cont.46232
bnei_else.46333:
bnei_cont.46334:
	j	bnei_cont.46232
bnei_else.46331:
bnei_cont.46332:
	j	bnei_cont.46232
bnei_else.46329:
bnei_cont.46330:
	j	bnei_cont.46232
bnei_else.46325:
bnei_cont.46326:
	j	bnei_cont.46232
bnei_else.46231:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.46343
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
	beqi	%v1, -1, bnei_else.46345
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
	beqi	%v1, -1, bnei_else.46347
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
	beqi	%v1, -1, bnei_else.46349
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
	beqi	%v1, -1, bnei_else.46351
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
	beqi	%v1, -1, bnei_else.46353
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
	j	bnei_cont.46344
bnei_else.46353:
bnei_cont.46354:
	j	bnei_cont.46344
bnei_else.46351:
bnei_cont.46352:
	j	bnei_cont.46344
bnei_else.46349:
bnei_cont.46350:
	j	bnei_cont.46344
bnei_else.46347:
bnei_cont.46348:
	j	bnei_cont.46344
bnei_else.46345:
bnei_cont.46346:
	j	bnei_cont.46344
bnei_else.46343:
bnei_cont.46344:
bnei_cont.46232:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix.2930
bnei_else.46230:
	jr	%ra
bnei_else.46101:
	jr	%ra
solve_each_element_fast.2936:
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0
	lw	%a2, 0(%at)
	beqi	%a2, -1, bnei_else.46391
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
	beqi	%t3, 1, bnei_else.46392
	beqi	%t3, 2, bnei_else.46394
	flw	%f3, 0(%t2)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.46396
	addi	%t3, %zero, 1
	j	fbeq_cont.46397
fbeq_else.46396:
	addi	%t3, %zero, 0
fbeq_cont.46397:
	beqi	%t3, 0, bnei_else.46398
	addi	%t0, %zero, 0
	j	bnei_cont.46393
bnei_else.46398:
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
	fblt	%f4, %f1, fbgt_else.46400
	addi	%t0, %zero, 0
	j	fbgt_cont.46401
fbgt_else.46400:
	addi	%t0, %zero, 1
fbgt_cont.46401:
	beqi	%t0, 0, bnei_else.46402
	lw	%t0, 6(%a3)
	beqi	%t0, 0, bnei_else.46404
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.46405
bnei_else.46404:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%t2)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.46405:
	addi	%t0, %zero, 1
	j	bnei_cont.46403
bnei_else.46402:
	addi	%t0, %zero, 0
bnei_cont.46403:
bnei_cont.46399:
	j	bnei_cont.46393
bnei_else.46394:
	flw	%f0, 0(%t2)
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.46406
	addi	%t2, %zero, 0
	j	fbgt_cont.46407
fbgt_else.46406:
	addi	%t2, %zero, 1
fbgt_cont.46407:
	beqi	%t2, 0, bnei_else.46408
	flw	%f1, 3(%t0)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.46409
bnei_else.46408:
	addi	%t0, %zero, 0
bnei_cont.46409:
bnei_cont.46395:
	j	bnei_cont.46393
bnei_else.46392:
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
	fblt	%f6, %f7, fbgt_else.46410
	addi	%t3, %zero, 0
	j	fbgt_cont.46411
fbgt_else.46410:
	addi	%t3, %zero, 1
fbgt_cont.46411:
	beqi	%t3, 0, bnei_else.46412
	flw	%f6, 2(%t0)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t3, 4(%a3)
	flw	%f7, 2(%t3)
	fblt	%f6, %f7, fbgt_else.46414
	addi	%t3, %zero, 0
	j	fbgt_cont.46415
fbgt_else.46414:
	addi	%t3, %zero, 1
fbgt_cont.46415:
	beqi	%t3, 0, bnei_else.46416
	flw	%f6, 493(%zero)
	fbne	%f4, %f6, fbeq_else.46418
	addi	%t3, %zero, 1
	j	fbeq_cont.46419
fbeq_else.46418:
	addi	%t3, %zero, 0
fbeq_cont.46419:
	beqi	%t3, 0, bnei_else.46420
	addi	%t3, %zero, 0
	j	bnei_cont.46413
bnei_else.46420:
	addi	%t3, %zero, 1
bnei_cont.46421:
	j	bnei_cont.46413
bnei_else.46416:
	addi	%t3, %zero, 0
bnei_cont.46417:
	j	bnei_cont.46413
bnei_else.46412:
	addi	%t3, %zero, 0
bnei_cont.46413:
	beqi	%t3, 0, bnei_else.46422
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 1
	j	bnei_cont.46423
bnei_else.46422:
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
	fblt	%f7, %f8, fbgt_else.46424
	addi	%t3, %zero, 0
	j	fbgt_cont.46425
fbgt_else.46424:
	addi	%t3, %zero, 1
fbgt_cont.46425:
	beqi	%t3, 0, bnei_else.46426
	flw	%f7, 2(%t0)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t0, 4(%a3)
	flw	%f8, 2(%t0)
	fblt	%f7, %f8, fbgt_else.46428
	addi	%t0, %zero, 0
	j	fbgt_cont.46429
fbgt_else.46428:
	addi	%t0, %zero, 1
fbgt_cont.46429:
	beqi	%t0, 0, bnei_else.46430
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.46432
	addi	%t0, %zero, 1
	j	fbeq_cont.46433
fbeq_else.46432:
	addi	%t0, %zero, 0
fbeq_cont.46433:
	beqi	%t0, 0, bnei_else.46434
	addi	%t0, %zero, 0
	j	bnei_cont.46427
bnei_else.46434:
	addi	%t0, %zero, 1
bnei_cont.46435:
	j	bnei_cont.46427
bnei_else.46430:
	addi	%t0, %zero, 0
bnei_cont.46431:
	j	bnei_cont.46427
bnei_else.46426:
	addi	%t0, %zero, 0
bnei_cont.46427:
	beqi	%t0, 0, bnei_else.46436
	fsw	%f3, 135(%zero)
	addi	%t0, %zero, 2
	j	bnei_cont.46437
bnei_else.46436:
	flw	%f3, 4(%t2)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%t2)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f4, 0(%t0)
	fblt	%f0, %f4, fbgt_else.46438
	addi	%t0, %zero, 0
	j	fbgt_cont.46439
fbgt_else.46438:
	addi	%t0, %zero, 1
fbgt_cont.46439:
	beqi	%t0, 0, bnei_else.46440
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%t0, 4(%a3)
	flw	%f1, 1(%t0)
	fblt	%f0, %f1, fbgt_else.46442
	addi	%t0, %zero, 0
	j	fbgt_cont.46443
fbgt_else.46442:
	addi	%t0, %zero, 1
fbgt_cont.46443:
	beqi	%t0, 0, bnei_else.46444
	flw	%f0, 493(%zero)
	fbne	%f3, %f0, fbeq_else.46446
	addi	%t0, %zero, 1
	j	fbeq_cont.46447
fbeq_else.46446:
	addi	%t0, %zero, 0
fbeq_cont.46447:
	beqi	%t0, 0, bnei_else.46448
	addi	%t0, %zero, 0
	j	bnei_cont.46441
bnei_else.46448:
	addi	%t0, %zero, 1
bnei_cont.46449:
	j	bnei_cont.46441
bnei_else.46444:
	addi	%t0, %zero, 0
bnei_cont.46445:
	j	bnei_cont.46441
bnei_else.46440:
	addi	%t0, %zero, 0
bnei_cont.46441:
	beqi	%t0, 0, bnei_else.46450
	fsw	%f2, 135(%zero)
	addi	%t0, %zero, 3
	j	bnei_cont.46451
bnei_else.46450:
	addi	%t0, %zero, 0
bnei_cont.46451:
bnei_cont.46437:
bnei_cont.46423:
bnei_cont.46393:
	beqi	%t0, 0, bnei_else.46452
	flw	%f0, 135(%zero)
	flw	%f1, 493(%zero)
	fblt	%f1, %f0, fbgt_else.46453
	addi	%a3, %zero, 0
	j	fbgt_cont.46454
fbgt_else.46453:
	addi	%a3, %zero, 1
fbgt_cont.46454:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%v0, 2(%sp)
	beqi	%a3, 0, bnei_else.46455
	flw	%f2, 137(%zero)
	fblt	%f0, %f2, fbgt_else.46457
	addi	%a3, %zero, 0
	j	fbgt_cont.46458
fbgt_else.46457:
	addi	%a3, %zero, 1
fbgt_cont.46458:
	beqi	%a3, 0, bnei_else.46459
	flw	%f2, 467(%zero)
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
	beqi	%a1, -1, bnei_else.46461
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
	beqi	%a3, 1, bnei_else.46463
	beqi	%a3, 2, bnei_else.46465
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
	beqi	%a3, 0, bnei_else.46467
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
	j	bnei_cont.46468
bnei_else.46467:
	fmov	%f5, %f8
bnei_cont.46468:
	lw	%a3, 1(%a1)
	beqi	%a3, 3, bnei_else.46469
	j	bnei_cont.46470
bnei_else.46469:
	flw	%f6, 491(%zero)
	fsub	%f5, %f5, %f6
bnei_cont.46470:
	lw	%a1, 6(%a1)
	fblt	%f5, %f1, fbgt_else.46471
	addi	%a3, %zero, 0
	j	fbgt_cont.46472
fbgt_else.46471:
	addi	%a3, %zero, 1
fbgt_cont.46472:
	beqi	%a1, 0, bnei_else.46473
	beqi	%a3, 0, bnei_else.46475
	addi	%a1, %zero, 0
	j	bnei_cont.46474
bnei_else.46475:
	addi	%a1, %zero, 1
bnei_cont.46476:
	j	bnei_cont.46474
bnei_else.46473:
	add	%a1, %zero, %a3
bnei_cont.46474:
	beqi	%a1, 0, bnei_else.46477
	addi	%a1, %zero, 0
	j	bnei_cont.46464
bnei_else.46477:
	addi	%a1, %zero, 1
bnei_cont.46478:
	j	bnei_cont.46464
bnei_else.46465:
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
	fblt	%f5, %f1, fbgt_else.46479
	addi	%a3, %zero, 0
	j	fbgt_cont.46480
fbgt_else.46479:
	addi	%a3, %zero, 1
fbgt_cont.46480:
	beqi	%a1, 0, bnei_else.46481
	beqi	%a3, 0, bnei_else.46483
	addi	%a1, %zero, 0
	j	bnei_cont.46482
bnei_else.46483:
	addi	%a1, %zero, 1
bnei_cont.46484:
	j	bnei_cont.46482
bnei_else.46481:
	add	%a1, %zero, %a3
bnei_cont.46482:
	beqi	%a1, 0, bnei_else.46485
	addi	%a1, %zero, 0
	j	bnei_cont.46486
bnei_else.46485:
	addi	%a1, %zero, 1
bnei_cont.46486:
bnei_cont.46466:
	j	bnei_cont.46464
bnei_else.46463:
	fabs	%f1, %f5
	lw	%a3, 4(%a1)
	flw	%f5, 0(%a3)
	fblt	%f1, %f5, fbgt_else.46487
	addi	%a3, %zero, 0
	j	fbgt_cont.46488
fbgt_else.46487:
	addi	%a3, %zero, 1
fbgt_cont.46488:
	beqi	%a3, 0, bnei_else.46489
	fabs	%f1, %f6
	lw	%a3, 4(%a1)
	flw	%f5, 1(%a3)
	fblt	%f1, %f5, fbgt_else.46491
	addi	%a3, %zero, 0
	j	fbgt_cont.46492
fbgt_else.46491:
	addi	%a3, %zero, 1
fbgt_cont.46492:
	beqi	%a3, 0, bnei_else.46493
	fabs	%f1, %f7
	lw	%a3, 4(%a1)
	flw	%f5, 2(%a3)
	fblt	%f1, %f5, fbgt_else.46495
	addi	%a3, %zero, 0
	j	bnei_cont.46490
fbgt_else.46495:
	addi	%a3, %zero, 1
fbgt_cont.46496:
	j	bnei_cont.46490
bnei_else.46493:
	addi	%a3, %zero, 0
bnei_cont.46494:
	j	bnei_cont.46490
bnei_else.46489:
	addi	%a3, %zero, 0
bnei_cont.46490:
	beqi	%a3, 0, bnei_else.46497
	lw	%a1, 6(%a1)
	j	bnei_cont.46498
bnei_else.46497:
	lw	%a1, 6(%a1)
	beqi	%a1, 0, bnei_else.46499
	addi	%a1, %zero, 0
	j	bnei_cont.46500
bnei_else.46499:
	addi	%a1, %zero, 1
bnei_cont.46500:
bnei_cont.46498:
bnei_cont.46464:
	beqi	%a1, 0, bnei_else.46501
	addi	%v0, %zero, 0
	j	bnei_cont.46462
bnei_else.46501:
	addi	%v0, %t1, 0
	fmov	%f1, %f3
	fmov	%f0, %f2
	fmov	%f2, %f4
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	check_all_inside.2907
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.46502:
	j	bnei_cont.46462
bnei_else.46461:
	addi	%v0, %zero, 1
bnei_cont.46462:
	beqi	%v0, 0, bnei_else.46503
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
	j	bnei_cont.46456
bnei_else.46503:
bnei_cont.46504:
	j	bnei_cont.46456
bnei_else.46459:
bnei_cont.46460:
	j	bnei_cont.46456
bnei_else.46455:
bnei_cont.46456:
	lw	%v0, 2(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	solve_each_element_fast.2936
bnei_else.46452:
	lw	%a1, 6(%a3)
	beqi	%a1, 0, bnei_else.46505
	addi	%v0, %v0, 1
	j	solve_each_element_fast.2936
bnei_else.46505:
	jr	%ra
bnei_else.46391:
	jr	%ra
solve_one_or_network_fast.2940:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	beqi	%a1, -1, bnei_else.46540
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
	beqi	%a0, -1, bnei_else.46541
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
	beqi	%a0, -1, bnei_else.46542
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
	beqi	%a0, -1, bnei_else.46543
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
	beqi	%a0, -1, bnei_else.46544
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
	beqi	%a0, -1, bnei_else.46545
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
	beqi	%a0, -1, bnei_else.46546
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
	beqi	%a0, -1, bnei_else.46547
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
bnei_else.46547:
	jr	%ra
bnei_else.46546:
	jr	%ra
bnei_else.46545:
	jr	%ra
bnei_else.46544:
	jr	%ra
bnei_else.46543:
	jr	%ra
bnei_else.46542:
	jr	%ra
bnei_else.46541:
	jr	%ra
bnei_else.46540:
	jr	%ra
trace_or_matrix_fast.2944:
	add	%at, %v1, %v0
	lw	%a1, 0(%at)
	addi	%a2, %zero, 0
	lw	%a3, 0(%a1)
	beqi	%a3, -1, bnei_else.46678
	sw	%a0, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%v1, 2(%sp)
	sw	%v0, 3(%sp)
	beqi	%a3, 99, bnei_else.46679
	lw	%t0, 12(%a3)
	lw	%t1, 10(%t0)
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)
	flw	%f2, 2(%t1)
	lw	%t2, 1(%a0)
	add	%at, %t2, %a3
	lw	%a3, 0(%at)
	lw	%t2, 1(%t0)
	beqi	%t2, 1, bnei_else.46681
	beqi	%t2, 2, bnei_else.46683
	flw	%f3, 0(%a3)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.46685
	addi	%t2, %zero, 1
	j	fbeq_cont.46686
fbeq_else.46685:
	addi	%t2, %zero, 0
fbeq_cont.46686:
	beqi	%t2, 0, bnei_else.46687
	addi	%a3, %zero, 0
	j	bnei_cont.46682
bnei_else.46687:
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
	fblt	%f4, %f1, fbgt_else.46689
	addi	%t1, %zero, 0
	j	fbgt_cont.46690
fbgt_else.46689:
	addi	%t1, %zero, 1
fbgt_cont.46690:
	beqi	%t1, 0, bnei_else.46691
	lw	%t0, 6(%t0)
	beqi	%t0, 0, bnei_else.46693
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.46694
bnei_else.46693:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.46694:
	addi	%a3, %zero, 1
	j	bnei_cont.46692
bnei_else.46691:
	addi	%a3, %zero, 0
bnei_cont.46692:
bnei_cont.46688:
	j	bnei_cont.46682
bnei_else.46683:
	flw	%f0, 0(%a3)
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.46695
	addi	%a3, %zero, 0
	j	fbgt_cont.46696
fbgt_else.46695:
	addi	%a3, %zero, 1
fbgt_cont.46696:
	beqi	%a3, 0, bnei_else.46697
	flw	%f1, 3(%t1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.46698
bnei_else.46697:
	addi	%a3, %zero, 0
bnei_cont.46698:
bnei_cont.46684:
	j	bnei_cont.46682
bnei_else.46681:
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
	fblt	%f6, %f7, fbgt_else.46699
	addi	%t2, %zero, 0
	j	fbgt_cont.46700
fbgt_else.46699:
	addi	%t2, %zero, 1
fbgt_cont.46700:
	beqi	%t2, 0, bnei_else.46701
	flw	%f6, 2(%t1)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t2, 4(%t0)
	flw	%f7, 2(%t2)
	fblt	%f6, %f7, fbgt_else.46703
	addi	%t2, %zero, 0
	j	fbgt_cont.46704
fbgt_else.46703:
	addi	%t2, %zero, 1
fbgt_cont.46704:
	beqi	%t2, 0, bnei_else.46705
	flw	%f6, 493(%zero)
	fbne	%f4, %f6, fbeq_else.46707
	addi	%t2, %zero, 1
	j	fbeq_cont.46708
fbeq_else.46707:
	addi	%t2, %zero, 0
fbeq_cont.46708:
	beqi	%t2, 0, bnei_else.46709
	addi	%t2, %zero, 0
	j	bnei_cont.46702
bnei_else.46709:
	addi	%t2, %zero, 1
bnei_cont.46710:
	j	bnei_cont.46702
bnei_else.46705:
	addi	%t2, %zero, 0
bnei_cont.46706:
	j	bnei_cont.46702
bnei_else.46701:
	addi	%t2, %zero, 0
bnei_cont.46702:
	beqi	%t2, 0, bnei_else.46711
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 1
	j	bnei_cont.46712
bnei_else.46711:
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
	fblt	%f7, %f8, fbgt_else.46713
	addi	%t2, %zero, 0
	j	fbgt_cont.46714
fbgt_else.46713:
	addi	%t2, %zero, 1
fbgt_cont.46714:
	beqi	%t2, 0, bnei_else.46715
	flw	%f7, 2(%t1)
	fmul	%f7, %f3, %f7
	fadd	%f7, %f7, %f2
	fabs	%f7, %f7
	lw	%t1, 4(%t0)
	flw	%f8, 2(%t1)
	fblt	%f7, %f8, fbgt_else.46717
	addi	%t1, %zero, 0
	j	fbgt_cont.46718
fbgt_else.46717:
	addi	%t1, %zero, 1
fbgt_cont.46718:
	beqi	%t1, 0, bnei_else.46719
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.46721
	addi	%t1, %zero, 1
	j	fbeq_cont.46722
fbeq_else.46721:
	addi	%t1, %zero, 0
fbeq_cont.46722:
	beqi	%t1, 0, bnei_else.46723
	addi	%t1, %zero, 0
	j	bnei_cont.46716
bnei_else.46723:
	addi	%t1, %zero, 1
bnei_cont.46724:
	j	bnei_cont.46716
bnei_else.46719:
	addi	%t1, %zero, 0
bnei_cont.46720:
	j	bnei_cont.46716
bnei_else.46715:
	addi	%t1, %zero, 0
bnei_cont.46716:
	beqi	%t1, 0, bnei_else.46725
	fsw	%f3, 135(%zero)
	addi	%a3, %zero, 2
	j	bnei_cont.46726
bnei_else.46725:
	flw	%f3, 4(%a3)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a3)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f4, 0(%a3)
	fblt	%f0, %f4, fbgt_else.46727
	addi	%a3, %zero, 0
	j	fbgt_cont.46728
fbgt_else.46727:
	addi	%a3, %zero, 1
fbgt_cont.46728:
	beqi	%a3, 0, bnei_else.46729
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	lw	%a3, 4(%t0)
	flw	%f1, 1(%a3)
	fblt	%f0, %f1, fbgt_else.46731
	addi	%a3, %zero, 0
	j	fbgt_cont.46732
fbgt_else.46731:
	addi	%a3, %zero, 1
fbgt_cont.46732:
	beqi	%a3, 0, bnei_else.46733
	flw	%f0, 493(%zero)
	fbne	%f3, %f0, fbeq_else.46735
	addi	%a3, %zero, 1
	j	fbeq_cont.46736
fbeq_else.46735:
	addi	%a3, %zero, 0
fbeq_cont.46736:
	beqi	%a3, 0, bnei_else.46737
	addi	%a3, %zero, 0
	j	bnei_cont.46730
bnei_else.46737:
	addi	%a3, %zero, 1
bnei_cont.46738:
	j	bnei_cont.46730
bnei_else.46733:
	addi	%a3, %zero, 0
bnei_cont.46734:
	j	bnei_cont.46730
bnei_else.46729:
	addi	%a3, %zero, 0
bnei_cont.46730:
	beqi	%a3, 0, bnei_else.46739
	fsw	%f2, 135(%zero)
	addi	%a3, %zero, 3
	j	bnei_cont.46740
bnei_else.46739:
	addi	%a3, %zero, 0
bnei_cont.46740:
bnei_cont.46726:
bnei_cont.46712:
bnei_cont.46682:
	beqi	%a3, 0, bnei_else.46741
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.46743
	addi	%a3, %zero, 0
	j	fbgt_cont.46744
fbgt_else.46743:
	addi	%a3, %zero, 1
fbgt_cont.46744:
	beqi	%a3, 0, bnei_else.46745
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.46747
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
	beqi	%v1, -1, bnei_else.46749
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
	beqi	%v1, -1, bnei_else.46751
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
	beqi	%v1, -1, bnei_else.46753
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
	beqi	%v1, -1, bnei_else.46755
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
	beqi	%v1, -1, bnei_else.46757
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
	beqi	%v1, -1, bnei_else.46759
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
	j	bnei_cont.46680
bnei_else.46759:
bnei_cont.46760:
	j	bnei_cont.46680
bnei_else.46757:
bnei_cont.46758:
	j	bnei_cont.46680
bnei_else.46755:
bnei_cont.46756:
	j	bnei_cont.46680
bnei_else.46753:
bnei_cont.46754:
	j	bnei_cont.46680
bnei_else.46751:
bnei_cont.46752:
	j	bnei_cont.46680
bnei_else.46749:
bnei_cont.46750:
	j	bnei_cont.46680
bnei_else.46747:
bnei_cont.46748:
	j	bnei_cont.46680
bnei_else.46745:
bnei_cont.46746:
	j	bnei_cont.46680
bnei_else.46741:
bnei_cont.46742:
	j	bnei_cont.46680
bnei_else.46679:
	lw	%a3, 1(%a1)
	beqi	%a3, -1, bnei_else.46761
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
	beqi	%v1, -1, bnei_else.46763
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
	beqi	%v1, -1, bnei_else.46765
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
	beqi	%v1, -1, bnei_else.46767
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
	beqi	%v1, -1, bnei_else.46769
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
	beqi	%v1, -1, bnei_else.46771
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
	beqi	%v1, -1, bnei_else.46773
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
	j	bnei_cont.46762
bnei_else.46773:
bnei_cont.46774:
	j	bnei_cont.46762
bnei_else.46771:
bnei_cont.46772:
	j	bnei_cont.46762
bnei_else.46769:
bnei_cont.46770:
	j	bnei_cont.46762
bnei_else.46767:
bnei_cont.46768:
	j	bnei_cont.46762
bnei_else.46765:
bnei_cont.46766:
	j	bnei_cont.46762
bnei_else.46763:
bnei_cont.46764:
	j	bnei_cont.46762
bnei_else.46761:
bnei_cont.46762:
bnei_cont.46680:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%a0)
	beqi	%a1, -1, bnei_else.46775
	sw	%v0, 5(%sp)
	beqi	%a1, 99, bnei_else.46776
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
	beqi	%t1, 1, bnei_else.46778
	beqi	%t1, 2, bnei_else.46780
	flw	%f3, 0(%a1)
	flw	%f4, 493(%zero)
	fbne	%f3, %f4, fbeq_else.46782
	addi	%t1, %zero, 1
	j	fbeq_cont.46783
fbeq_else.46782:
	addi	%t1, %zero, 0
fbeq_cont.46783:
	beqi	%t1, 0, bnei_else.46784
	addi	%a1, %zero, 0
	j	bnei_cont.46779
bnei_else.46784:
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
	fblt	%f4, %f1, fbgt_else.46786
	addi	%a3, %zero, 0
	j	fbgt_cont.46787
fbgt_else.46786:
	addi	%a3, %zero, 1
fbgt_cont.46787:
	beqi	%a3, 0, bnei_else.46788
	lw	%a2, 6(%a2)
	beqi	%a2, 0, bnei_else.46790
	fsqrt	%f1, %f1
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	j	bnei_cont.46791
bnei_else.46790:
	fsqrt	%f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a1)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
bnei_cont.46791:
	addi	%a1, %zero, 1
	j	bnei_cont.46789
bnei_else.46788:
	addi	%a1, %zero, 0
bnei_cont.46789:
bnei_cont.46785:
	j	bnei_cont.46779
bnei_else.46780:
	flw	%f0, 0(%a1)
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.46792
	addi	%a1, %zero, 0
	j	fbgt_cont.46793
fbgt_else.46792:
	addi	%a1, %zero, 1
fbgt_cont.46793:
	beqi	%a1, 0, bnei_else.46794
	flw	%f1, 3(%a3)
	fmul	%f0, %f0, %f1
	fsw	%f0, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.46795
bnei_else.46794:
	addi	%a1, %zero, 0
bnei_cont.46795:
bnei_cont.46781:
	j	bnei_cont.46779
bnei_else.46778:
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
	fblt	%f6, %f7, fbgt_else.46796
	addi	%t1, %zero, 0
	j	fbgt_cont.46797
fbgt_else.46796:
	addi	%t1, %zero, 1
fbgt_cont.46797:
	beqi	%t1, 0, bnei_else.46798
	flw	%f6, 2(%a3)
	fmul	%f6, %f3, %f6
	fadd	%f6, %f6, %f2
	fabs	%f6, %f6
	lw	%t1, 4(%a2)
	flw	%f8, 2(%t1)
	fblt	%f6, %f8, fbgt_else.46800
	addi	%t1, %zero, 0
	j	fbgt_cont.46801
fbgt_else.46800:
	addi	%t1, %zero, 1
fbgt_cont.46801:
	beqi	%t1, 0, bnei_else.46802
	flw	%f6, 493(%zero)
	fbne	%f4, %f6, fbeq_else.46804
	addi	%t1, %zero, 1
	j	fbeq_cont.46805
fbeq_else.46804:
	addi	%t1, %zero, 0
fbeq_cont.46805:
	beqi	%t1, 0, bnei_else.46806
	addi	%t1, %zero, 0
	j	bnei_cont.46799
bnei_else.46806:
	addi	%t1, %zero, 1
bnei_cont.46807:
	j	bnei_cont.46799
bnei_else.46802:
	addi	%t1, %zero, 0
bnei_cont.46803:
	j	bnei_cont.46799
bnei_else.46798:
	addi	%t1, %zero, 0
bnei_cont.46799:
	beqi	%t1, 0, bnei_else.46808
	fsw	%f3, 135(%zero)
	addi	%a1, %zero, 1
	j	bnei_cont.46809
bnei_else.46808:
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
	fblt	%f8, %f9, fbgt_else.46810
	addi	%t1, %zero, 0
	j	fbgt_cont.46811
fbgt_else.46810:
	addi	%t1, %zero, 1
fbgt_cont.46811:
	beqi	%t1, 0, bnei_else.46812
	flw	%f8, 2(%a3)
	fmul	%f8, %f3, %f8
	fadd	%f8, %f8, %f2
	fabs	%f8, %f8
	lw	%a2, 4(%a2)
	flw	%f10, 2(%a2)
	fblt	%f8, %f10, fbgt_else.46814
	addi	%a2, %zero, 0
	j	fbgt_cont.46815
fbgt_else.46814:
	addi	%a2, %zero, 1
fbgt_cont.46815:
	beqi	%a2, 0, bnei_else.46816
	flw	%f8, 493(%zero)
	fbne	%f4, %f8, fbeq_else.46818
	addi	%a2, %zero, 1
	j	fbeq_cont.46819
fbeq_else.46818:
	addi	%a2, %zero, 0
fbeq_cont.46819:
	beqi	%a2, 0, bnei_else.46820
	addi	%a2, %zero, 0
	j	bnei_cont.46813
bnei_else.46820:
	addi	%a2, %zero, 1
bnei_cont.46821:
	j	bnei_cont.46813
bnei_else.46816:
	addi	%a2, %zero, 0
bnei_cont.46817:
	j	bnei_cont.46813
bnei_else.46812:
	addi	%a2, %zero, 0
bnei_cont.46813:
	beqi	%a2, 0, bnei_else.46822
	fsw	%f3, 135(%zero)
	addi	%a1, %zero, 2
	j	bnei_cont.46823
bnei_else.46822:
	flw	%f3, 4(%a1)
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a1)
	fmul	%f2, %f2, %f3
	fmul	%f4, %f2, %f6
	fadd	%f0, %f4, %f0
	fabs	%f0, %f0
	fblt	%f0, %f9, fbgt_else.46824
	addi	%a1, %zero, 0
	j	fbgt_cont.46825
fbgt_else.46824:
	addi	%a1, %zero, 1
fbgt_cont.46825:
	beqi	%a1, 0, bnei_else.46826
	fmul	%f0, %f2, %f5
	fadd	%f0, %f0, %f1
	fabs	%f0, %f0
	fblt	%f0, %f7, fbgt_else.46828
	addi	%a1, %zero, 0
	j	fbgt_cont.46829
fbgt_else.46828:
	addi	%a1, %zero, 1
fbgt_cont.46829:
	beqi	%a1, 0, bnei_else.46830
	flw	%f0, 493(%zero)
	fbne	%f3, %f0, fbeq_else.46832
	addi	%a1, %zero, 1
	j	fbeq_cont.46833
fbeq_else.46832:
	addi	%a1, %zero, 0
fbeq_cont.46833:
	beqi	%a1, 0, bnei_else.46834
	addi	%a1, %zero, 0
	j	bnei_cont.46827
bnei_else.46834:
	addi	%a1, %zero, 1
bnei_cont.46835:
	j	bnei_cont.46827
bnei_else.46830:
	addi	%a1, %zero, 0
bnei_cont.46831:
	j	bnei_cont.46827
bnei_else.46826:
	addi	%a1, %zero, 0
bnei_cont.46827:
	beqi	%a1, 0, bnei_else.46836
	fsw	%f2, 135(%zero)
	addi	%a1, %zero, 3
	j	bnei_cont.46837
bnei_else.46836:
	addi	%a1, %zero, 0
bnei_cont.46837:
bnei_cont.46823:
bnei_cont.46809:
bnei_cont.46779:
	beqi	%a1, 0, bnei_else.46838
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	fblt	%f0, %f1, fbgt_else.46840
	addi	%a1, %zero, 0
	j	fbgt_cont.46841
fbgt_else.46840:
	addi	%a1, %zero, 1
fbgt_cont.46841:
	beqi	%a1, 0, bnei_else.46842
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.46844
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
	beqi	%v1, -1, bnei_else.46846
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
	beqi	%v1, -1, bnei_else.46848
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
	beqi	%v1, -1, bnei_else.46850
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
	beqi	%v1, -1, bnei_else.46852
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
	beqi	%v1, -1, bnei_else.46854
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
	j	bnei_cont.46777
bnei_else.46854:
bnei_cont.46855:
	j	bnei_cont.46777
bnei_else.46852:
bnei_cont.46853:
	j	bnei_cont.46777
bnei_else.46850:
bnei_cont.46851:
	j	bnei_cont.46777
bnei_else.46848:
bnei_cont.46849:
	j	bnei_cont.46777
bnei_else.46846:
bnei_cont.46847:
	j	bnei_cont.46777
bnei_else.46844:
bnei_cont.46845:
	j	bnei_cont.46777
bnei_else.46842:
bnei_cont.46843:
	j	bnei_cont.46777
bnei_else.46838:
bnei_cont.46839:
	j	bnei_cont.46777
bnei_else.46776:
	lw	%a1, 1(%a0)
	beqi	%a1, -1, bnei_else.46856
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
	beqi	%v1, -1, bnei_else.46858
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
	beqi	%v1, -1, bnei_else.46860
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
	beqi	%v1, -1, bnei_else.46862
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
	beqi	%v1, -1, bnei_else.46864
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
	beqi	%v1, -1, bnei_else.46866
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
	j	bnei_cont.46857
bnei_else.46866:
bnei_cont.46867:
	j	bnei_cont.46857
bnei_else.46864:
bnei_cont.46865:
	j	bnei_cont.46857
bnei_else.46862:
bnei_cont.46863:
	j	bnei_cont.46857
bnei_else.46860:
bnei_cont.46861:
	j	bnei_cont.46857
bnei_else.46858:
bnei_cont.46859:
	j	bnei_cont.46857
bnei_else.46856:
bnei_cont.46857:
bnei_cont.46777:
	lw	%v0, 5(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	trace_or_matrix_fast.2944
bnei_else.46775:
	jr	%ra
bnei_else.46678:
	jr	%ra
trace_reflections.2966:
	addi	%a0, %zero, 0
	blti	%v0, 0, bgti_else.46880
	lw	%a1, 254(%v0)
	lw	%a2, 1(%a1)
	flw	%f2, 465(%zero)
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
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.46881
	addi	%v0, %zero, 0
	j	fbgt_cont.46882
fbgt_else.46881:
	addi	%v0, %zero, 1
fbgt_cont.46882:
	beqi	%v0, 0, bnei_else.46883
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.46885
	addi	%v0, %zero, 0
	j	bnei_cont.46884
fbgt_else.46885:
	addi	%v0, %zero, 1
fbgt_cont.46886:
	j	bnei_cont.46884
bnei_else.46883:
	addi	%v0, %zero, 0
bnei_cont.46884:
	beqi	%v0, 0, bnei_else.46887
	lw	%v0, 141(%zero)
	sll	%v0, %v0, 2
	lw	%v1, 136(%zero)
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)
	lw	%a0, 0(%v1)
	bne	%v0, %a0, beq_else.46889
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	beqi	%v0, 0, bnei_else.46891
	j	bnei_cont.46888
bnei_else.46891:
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
	flw	%f3, 493(%zero)
	fblt	%f3, %f0, fbgt_else.46893
	addi	%v0, %zero, 0
	j	fbgt_cont.46894
fbgt_else.46893:
	addi	%v0, %zero, 1
fbgt_cont.46894:
	beqi	%v0, 0, bnei_else.46895
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
	j	bnei_cont.46896
bnei_else.46895:
bnei_cont.46896:
	fblt	%f3, %f1, fbgt_else.46897
	addi	%v0, %zero, 0
	j	fbgt_cont.46898
fbgt_else.46897:
	addi	%v0, %zero, 1
fbgt_cont.46898:
	beqi	%v0, 0, bnei_else.46899
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
	j	bnei_cont.46900
bnei_else.46899:
bnei_cont.46900:
bnei_cont.46892:
	j	bnei_cont.46888
beq_else.46889:
beq_cont.46890:
	j	bnei_cont.46888
bnei_else.46887:
bnei_cont.46888:
	lw	%v0, 0(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 3(%sp)
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	j	trace_reflections.2966
bgti_else.46880:
	jr	%ra
trace_ray.2971:
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.47306
	lw	%a1, 2(%a0)
	addi	%a2, %zero, 0
	flw	%f2, 465(%zero)
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
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.47307
	addi	%v0, %zero, 0
	j	fbgt_cont.47308
fbgt_else.47307:
	addi	%v0, %zero, 1
fbgt_cont.47308:
	beqi	%v0, 0, bnei_else.47309
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.47311
	addi	%v0, %zero, 0
	j	bnei_cont.47310
fbgt_else.47311:
	addi	%v0, %zero, 1
fbgt_cont.47312:
	j	bnei_cont.47310
bnei_else.47309:
	addi	%v0, %zero, 0
bnei_cont.47310:
	beqi	%v0, 0, bnei_else.47313
	lw	%v0, 141(%zero)
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	lw	%a1, 7(%v1)
	flw	%f1, 0(%a1)
	flw	%f2, 4(%sp)
	fmul	%f1, %f1, %f2
	lw	%a1, 1(%v1)
	addi	%a2, %zero, 1
	beqi	%a1, 1, bnei_else.47314
	beqi	%a1, 2, bnei_else.47316
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
	beqi	%a1, 0, bnei_else.47318
	lw	%a1, 9(%v1)
	flw	%f9, 2(%a1)
	fmul	%f9, %f4, %f9
	lw	%a1, 9(%v1)
	flw	%f10, 1(%a1)
	fmul	%f10, %f5, %f10
	fadd	%f9, %f9, %f10
	flw	%f10, 471(%zero)
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
	j	bnei_cont.47319
bnei_else.47318:
	fsw	%f6, 142(%zero)
	fsw	%f7, 143(%zero)
	fsw	%f8, 144(%zero)
bnei_cont.47319:
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
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.47320
	addi	%a3, %zero, 1
	j	fbeq_cont.47321
fbeq_else.47320:
	addi	%a3, %zero, 0
fbeq_cont.47321:
	beqi	%a3, 0, bnei_else.47322
	flw	%f4, 491(%zero)
	j	bnei_cont.47323
bnei_else.47322:
	beqi	%a1, 0, bnei_else.47324
	flw	%f7, 490(%zero)
	fdiv	%f4, %f7, %f4
	j	bnei_cont.47325
bnei_else.47324:
	flw	%f7, 491(%zero)
	fdiv	%f4, %f7, %f4
bnei_cont.47325:
bnei_cont.47323:
	fmul	%f3, %f3, %f4
	fsw	%f3, 142(%zero)
	fmul	%f3, %f5, %f4
	fsw	%f3, 143(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f3, 144(%zero)
	j	bnei_cont.47315
bnei_else.47316:
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
bnei_cont.47317:
	j	bnei_cont.47315
bnei_else.47314:
	lw	%a1, 136(%zero)
	flw	%f3, 493(%zero)
	fsw	%f3, 142(%zero)
	fsw	%f3, 143(%zero)
	fsw	%f3, 144(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)
	add	%at, %a3, %a1
	flw	%f4, 0(%at)
	fbne	%f4, %f3, fbeq_else.47326
	addi	%t0, %zero, 1
	j	fbeq_cont.47327
fbeq_else.47326:
	addi	%t0, %zero, 0
fbeq_cont.47327:
	beqi	%t0, 0, bnei_else.47328
	j	bnei_cont.47329
bnei_else.47328:
	fblt	%f3, %f4, fbgt_else.47330
	addi	%t0, %zero, 0
	j	fbgt_cont.47331
fbgt_else.47330:
	addi	%t0, %zero, 1
fbgt_cont.47331:
	beqi	%t0, 0, bnei_else.47332
	flw	%f3, 491(%zero)
	j	bnei_cont.47333
bnei_else.47332:
	flw	%f3, 490(%zero)
bnei_cont.47333:
bnei_cont.47329:
	fneg	%f3, %f3
	fsw	%f3, 142(%a1)
bnei_cont.47315:
	flw	%f3, 138(%zero)
	fsw	%f3, 159(%zero)
	flw	%f4, 139(%zero)
	fsw	%f4, 160(%zero)
	flw	%f5, 140(%zero)
	fsw	%f5, 161(%zero)
	lw	%a1, 0(%v1)
	lw	%a3, 8(%v1)
	flw	%f6, 0(%a3)
	fsw	%f6, 145(%zero)
	lw	%a3, 8(%v1)
	flw	%f6, 1(%a3)
	fsw	%f6, 146(%zero)
	lw	%a3, 8(%v1)
	flw	%f6, 2(%a3)
	fsw	%f6, 147(%zero)
	fsw	%f0, 8(%sp)
	sw	%a0, 9(%sp)
	fsw	%f1, 10(%sp)
	sw	%a2, 11(%sp)
	sw	%v1, 12(%sp)
	fsw	%f5, 13(%sp)
	fsw	%f4, 14(%sp)
	fsw	%f3, 15(%sp)
	sw	%v0, 16(%sp)
	beqi	%a1, 1, bnei_else.47334
	beqi	%a1, 2, bnei_else.47336
	beqi	%a1, 3, bnei_else.47338
	beqi	%a1, 4, bnei_else.47340
	j	bnei_cont.47335
bnei_else.47340:
	lw	%a1, 5(%v1)
	flw	%f6, 0(%a1)
	fsub	%f6, %f3, %f6
	lw	%a1, 4(%v1)
	flw	%f7, 0(%a1)
	fsqrt	%f7, %f7
	fmul	%f6, %f6, %f7
	lw	%a1, 5(%v1)
	flw	%f7, 2(%a1)
	fsub	%f7, %f5, %f7
	lw	%a1, 4(%v1)
	flw	%f8, 2(%a1)
	fsqrt	%f8, %f8
	fmul	%f7, %f7, %f8
	fmul	%f8, %f6, %f6
	fmul	%f9, %f7, %f7
	fadd	%f8, %f8, %f9
	fabs	%f9, %f6
	flw	%f10, 463(%zero)
	fblt	%f9, %f10, fbgt_else.47342
	addi	%a1, %zero, 0
	j	fbgt_cont.47343
fbgt_else.47342:
	addi	%a1, %zero, 1
fbgt_cont.47343:
	beqi	%a1, 0, bnei_else.47344
	flw	%f6, 462(%zero)
	j	bnei_cont.47345
bnei_else.47344:
	fdiv	%f6, %f7, %f6
	fabs	%f6, %f6
	flw	%f7, 493(%zero)
	fblt	%f6, %f7, fbgt_else.47346
	addi	%a1, %zero, 1
	j	fbgt_cont.47347
fbgt_else.47346:
	addi	%a1, %zero, 0
fbgt_cont.47347:
	fabs	%f7, %f6
	flw	%f9, 461(%zero)
	fblt	%f7, %f9, fbgt_else.47348
	flw	%f6, 454(%zero)
	fblt	%f7, %f6, fbgt_else.47350
	flw	%f6, 476(%zero)
	flw	%f9, 491(%zero)
	fdiv	%f7, %f9, %f7
	fmul	%f9, %f7, %f7
	fmul	%f11, %f9, %f9
	fmul	%f12, %f11, %f11
	flw	%f13, 460(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fsub	%f13, %f7, %f13
	flw	%f14, 459(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f11
	fadd	%f13, %f13, %f14
	flw	%f14, 458(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f9
	fmul	%f14, %f14, %f11
	fsub	%f13, %f13, %f14
	flw	%f14, 457(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f12
	fadd	%f13, %f13, %f14
	flw	%f14, 456(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f9, %f14, %f9
	fmul	%f9, %f9, %f12
	fsub	%f9, %f13, %f9
	flw	%f13, 455(%zero)
	fmul	%f7, %f13, %f7
	fmul	%f7, %f7, %f11
	fmul	%f7, %f7, %f12
	fadd	%f7, %f9, %f7
	fsub	%f6, %f6, %f7
	j	fbgt_cont.47351
fbgt_else.47350:
	flw	%f6, 475(%zero)
	flw	%f9, 491(%zero)
	fsub	%f11, %f7, %f9
	fadd	%f7, %f7, %f9
	fdiv	%f7, %f11, %f7
	fmul	%f9, %f7, %f7
	fmul	%f11, %f9, %f9
	fmul	%f12, %f11, %f11
	flw	%f13, 460(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fsub	%f13, %f7, %f13
	flw	%f14, 459(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f11
	fadd	%f13, %f13, %f14
	flw	%f14, 458(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f9
	fmul	%f14, %f14, %f11
	fsub	%f13, %f13, %f14
	flw	%f14, 457(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f14, %f14, %f12
	fadd	%f13, %f13, %f14
	flw	%f14, 456(%zero)
	fmul	%f14, %f14, %f7
	fmul	%f9, %f14, %f9
	fmul	%f9, %f9, %f12
	fsub	%f9, %f13, %f9
	flw	%f13, 455(%zero)
	fmul	%f7, %f13, %f7
	fmul	%f7, %f7, %f11
	fmul	%f7, %f7, %f12
	fadd	%f7, %f9, %f7
	fadd	%f6, %f6, %f7
fbgt_cont.47351:
	beqi	%a1, 0, bnei_else.47352
	j	fbgt_cont.47349
bnei_else.47352:
	fneg	%f6, %f6
bnei_cont.47353:
	j	fbgt_cont.47349
fbgt_else.47348:
	fmul	%f7, %f6, %f6
	fmul	%f9, %f7, %f7
	fmul	%f11, %f9, %f9
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f7
	fsub	%f12, %f6, %f12
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f6
	fmul	%f13, %f13, %f9
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f6
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f6
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)
	fmul	%f13, %f13, %f6
	fmul	%f7, %f13, %f7
	fmul	%f7, %f7, %f11
	fsub	%f7, %f12, %f7
	flw	%f12, 455(%zero)
	fmul	%f6, %f12, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f11
	fadd	%f6, %f7, %f6
fbgt_cont.47349:
	flw	%f7, 453(%zero)
	fmul	%f6, %f6, %f7
	flw	%f7, 452(%zero)
	fdiv	%f6, %f6, %f7
bnei_cont.47345:
	floor	%f7, %f6
	fsub	%f6, %f6, %f7
	lw	%a1, 5(%v1)
	flw	%f7, 1(%a1)
	fsub	%f7, %f4, %f7
	lw	%a1, 4(%v1)
	flw	%f9, 1(%a1)
	fsqrt	%f9, %f9
	fmul	%f7, %f7, %f9
	fabs	%f9, %f8
	fblt	%f9, %f10, fbgt_else.47354
	addi	%a1, %zero, 0
	j	fbgt_cont.47355
fbgt_else.47354:
	addi	%a1, %zero, 1
fbgt_cont.47355:
	beqi	%a1, 0, bnei_else.47356
	flw	%f7, 462(%zero)
	j	bnei_cont.47357
bnei_else.47356:
	fdiv	%f7, %f7, %f8
	fabs	%f7, %f7
	flw	%f8, 493(%zero)
	fblt	%f7, %f8, fbgt_else.47358
	addi	%a1, %zero, 1
	j	fbgt_cont.47359
fbgt_else.47358:
	addi	%a1, %zero, 0
fbgt_cont.47359:
	fabs	%f8, %f7
	flw	%f9, 461(%zero)
	fblt	%f8, %f9, fbgt_else.47360
	flw	%f7, 454(%zero)
	fblt	%f8, %f7, fbgt_else.47362
	flw	%f7, 476(%zero)
	flw	%f9, 491(%zero)
	fdiv	%f8, %f9, %f8
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f12, %f8, %f12
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fmul	%f8, %f8, %f11
	fadd	%f8, %f9, %f8
	fsub	%f7, %f7, %f8
	j	fbgt_cont.47363
fbgt_else.47362:
	flw	%f7, 475(%zero)
	flw	%f9, 491(%zero)
	fsub	%f10, %f8, %f9
	fadd	%f8, %f8, %f9
	fdiv	%f8, %f10, %f8
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f12, %f8, %f12
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)
	fmul	%f13, %f13, %f8
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fmul	%f8, %f8, %f11
	fadd	%f8, %f9, %f8
	fadd	%f7, %f7, %f8
fbgt_cont.47363:
	beqi	%a1, 0, bnei_else.47364
	j	fbgt_cont.47361
bnei_else.47364:
	fneg	%f7, %f7
bnei_cont.47365:
	j	fbgt_cont.47361
fbgt_else.47360:
	fmul	%f8, %f7, %f7
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 460(%zero)
	fmul	%f11, %f11, %f7
	fmul	%f11, %f11, %f8
	fsub	%f11, %f7, %f11
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 455(%zero)
	fmul	%f7, %f11, %f7
	fmul	%f7, %f7, %f9
	fmul	%f7, %f7, %f10
	fadd	%f7, %f8, %f7
fbgt_cont.47361:
	flw	%f8, 453(%zero)
	fmul	%f7, %f7, %f8
	flw	%f8, 452(%zero)
	fdiv	%f7, %f7, %f8
bnei_cont.47357:
	floor	%f8, %f7
	fsub	%f7, %f7, %f8
	flw	%f8, 451(%zero)
	flw	%f9, 471(%zero)
	fsub	%f6, %f9, %f6
	fmul	%f6, %f6, %f6
	fsub	%f6, %f8, %f6
	fsub	%f7, %f9, %f7
	fmul	%f7, %f7, %f7
	fsub	%f6, %f6, %f7
	flw	%f7, 493(%zero)
	fblt	%f6, %f7, fbgt_else.47366
	addi	%a1, %zero, 0
	j	fbgt_cont.47367
fbgt_else.47366:
	addi	%a1, %zero, 1
fbgt_cont.47367:
	beqi	%a1, 0, bnei_else.47368
	fmov	%f6, %f7
	j	bnei_cont.47369
bnei_else.47368:
bnei_cont.47369:
	flw	%f7, 450(%zero)
	fmul	%f6, %f7, %f6
	flw	%f7, 449(%zero)
	fdiv	%f6, %f6, %f7
	fsw	%f6, 147(%zero)
bnei_cont.47341:
	j	bnei_cont.47335
bnei_else.47338:
	lw	%a1, 5(%v1)
	flw	%f6, 0(%a1)
	fsub	%f6, %f3, %f6
	lw	%a1, 5(%v1)
	flw	%f7, 2(%a1)
	fsub	%f7, %f5, %f7
	fmul	%f6, %f6, %f6
	fmul	%f7, %f7, %f7
	fadd	%f6, %f6, %f7
	fsqrt	%f6, %f6
	flw	%f7, 448(%zero)
	fdiv	%f6, %f6, %f7
	floor	%f7, %f6
	fsub	%f6, %f6, %f7
	flw	%f7, 452(%zero)
	fmul	%f6, %f6, %f7
	flw	%f7, 489(%zero)
	fabs	%f6, %f6
	flw	%f8, 488(%zero)
	fsw	%f7, 17(%sp)
	fsw	%f8, 18(%sp)
	fsw	%f6, 19(%sp)
	fblt	%f6, %f8, fbgt_else.47370
	flw	%f9, 487(%zero)
	fblt	%f6, %f9, fbgt_else.47372
	flw	%f9, 486(%zero)
	fblt	%f6, %f9, fbgt_else.47374
	flw	%f9, 485(%zero)
	fblt	%f6, %f9, fbgt_else.47376
	flw	%f9, 484(%zero)
	fblt	%f6, %f9, fbgt_else.47378
	flw	%f9, 483(%zero)
	fblt	%f6, %f9, fbgt_else.47380
	flw	%f9, 482(%zero)
	fblt	%f6, %f9, fbgt_else.47382
	flw	%f9, 481(%zero)
	fblt	%f6, %f9, fbgt_else.47384
	flw	%f9, 480(%zero)
	fblt	%f6, %f9, fbgt_else.47386
	flw	%f9, 479(%zero)
	fblt	%f6, %f9, fbgt_else.47388
	flw	%f9, 478(%zero)
	fblt	%f6, %f9, fbgt_else.47390
	flw	%f9, 477(%zero)
	fblt	%f6, %f9, fbgt_else.47392
	flw	%f9, 447(%zero)
	fmov	%f1, %f9
	fmov	%f0, %f6
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.47371
fbgt_else.47392:
	fmov	%f1, %f9
fbgt_cont.47393:
	j	fbgt_cont.47371
fbgt_else.47390:
	fmov	%f1, %f9
fbgt_cont.47391:
	j	fbgt_cont.47371
fbgt_else.47388:
	fmov	%f1, %f9
fbgt_cont.47389:
	j	fbgt_cont.47371
fbgt_else.47386:
	fmov	%f1, %f9
fbgt_cont.47387:
	j	fbgt_cont.47371
fbgt_else.47384:
	fmov	%f1, %f9
fbgt_cont.47385:
	j	fbgt_cont.47371
fbgt_else.47382:
	fmov	%f1, %f9
fbgt_cont.47383:
	j	fbgt_cont.47371
fbgt_else.47380:
	fmov	%f1, %f9
fbgt_cont.47381:
	j	fbgt_cont.47371
fbgt_else.47378:
	fmov	%f1, %f9
fbgt_cont.47379:
	j	fbgt_cont.47371
fbgt_else.47376:
	fmov	%f1, %f9
fbgt_cont.47377:
	j	fbgt_cont.47371
fbgt_else.47374:
	fmov	%f1, %f9
fbgt_cont.47375:
	j	fbgt_cont.47371
fbgt_else.47372:
	fmov	%f1, %f9
fbgt_cont.47373:
	j	fbgt_cont.47371
fbgt_else.47370:
	fmov	%f1, %f8
fbgt_cont.47371:
	flw	%f0, 19(%sp)
	flw	%f2, 18(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 17(%sp)
	fblt	%f0, %f1, fbgt_else.47394
	addi	%v0, %zero, 0
	j	fbgt_cont.47395
fbgt_else.47394:
	addi	%v0, %zero, 1
fbgt_cont.47395:
	fblt	%f0, %f1, fbgt_else.47396
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47397
fbgt_else.47396:
fbgt_cont.47397:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.47398
	beqi	%v0, 0, bnei_else.47400
	addi	%v0, %zero, 0
	j	fbgt_cont.47399
bnei_else.47400:
	addi	%v0, %zero, 1
bnei_cont.47401:
	j	fbgt_cont.47399
fbgt_else.47398:
fbgt_cont.47399:
	fblt	%f0, %f2, fbgt_else.47402
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47403
fbgt_else.47402:
fbgt_cont.47403:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.47404
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.47405
fbgt_else.47404:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.47405:
	beqi	%v0, 0, bnei_else.47406
	j	bnei_cont.47407
bnei_else.47406:
	fneg	%f0, %f0
bnei_cont.47407:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.47339:
	j	bnei_cont.47335
bnei_else.47336:
	flw	%f6, 446(%zero)
	fmul	%f6, %f4, %f6
	flw	%f7, 489(%zero)
	flw	%f8, 493(%zero)
	fblt	%f6, %f8, fbgt_else.47408
	addi	%a1, %zero, 1
	j	fbgt_cont.47409
fbgt_else.47408:
	addi	%a1, %zero, 0
fbgt_cont.47409:
	fabs	%f6, %f6
	flw	%f8, 488(%zero)
	sw	%a1, 20(%sp)
	fsw	%f7, 21(%sp)
	fsw	%f8, 22(%sp)
	fsw	%f6, 23(%sp)
	fblt	%f6, %f8, fbgt_else.47410
	flw	%f9, 487(%zero)
	fblt	%f6, %f9, fbgt_else.47412
	flw	%f9, 486(%zero)
	fblt	%f6, %f9, fbgt_else.47414
	flw	%f9, 485(%zero)
	fblt	%f6, %f9, fbgt_else.47416
	flw	%f9, 484(%zero)
	fblt	%f6, %f9, fbgt_else.47418
	flw	%f9, 483(%zero)
	fblt	%f6, %f9, fbgt_else.47420
	flw	%f9, 482(%zero)
	fblt	%f6, %f9, fbgt_else.47422
	flw	%f9, 481(%zero)
	fblt	%f6, %f9, fbgt_else.47424
	flw	%f9, 480(%zero)
	fblt	%f6, %f9, fbgt_else.47426
	flw	%f9, 479(%zero)
	fblt	%f6, %f9, fbgt_else.47428
	flw	%f9, 478(%zero)
	fblt	%f6, %f9, fbgt_else.47430
	flw	%f9, 477(%zero)
	fblt	%f6, %f9, fbgt_else.47432
	flw	%f9, 447(%zero)
	fmov	%f1, %f9
	fmov	%f0, %f6
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.47411
fbgt_else.47432:
	fmov	%f1, %f9
fbgt_cont.47433:
	j	fbgt_cont.47411
fbgt_else.47430:
	fmov	%f1, %f9
fbgt_cont.47431:
	j	fbgt_cont.47411
fbgt_else.47428:
	fmov	%f1, %f9
fbgt_cont.47429:
	j	fbgt_cont.47411
fbgt_else.47426:
	fmov	%f1, %f9
fbgt_cont.47427:
	j	fbgt_cont.47411
fbgt_else.47424:
	fmov	%f1, %f9
fbgt_cont.47425:
	j	fbgt_cont.47411
fbgt_else.47422:
	fmov	%f1, %f9
fbgt_cont.47423:
	j	fbgt_cont.47411
fbgt_else.47420:
	fmov	%f1, %f9
fbgt_cont.47421:
	j	fbgt_cont.47411
fbgt_else.47418:
	fmov	%f1, %f9
fbgt_cont.47419:
	j	fbgt_cont.47411
fbgt_else.47416:
	fmov	%f1, %f9
fbgt_cont.47417:
	j	fbgt_cont.47411
fbgt_else.47414:
	fmov	%f1, %f9
fbgt_cont.47415:
	j	fbgt_cont.47411
fbgt_else.47412:
	fmov	%f1, %f9
fbgt_cont.47413:
	j	fbgt_cont.47411
fbgt_else.47410:
	fmov	%f1, %f8
fbgt_cont.47411:
	flw	%f0, 23(%sp)
	flw	%f2, 22(%sp)
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	flw	%f1, 21(%sp)
	fblt	%f0, %f1, fbgt_else.47434
	lw	%v0, 20(%sp)
	beqi	%v0, 0, bnei_else.47436
	addi	%v0, %zero, 0
	j	fbgt_cont.47435
bnei_else.47436:
	addi	%v0, %zero, 1
bnei_cont.47437:
	j	fbgt_cont.47435
fbgt_else.47434:
	lw	%v0, 20(%sp)
fbgt_cont.47435:
	fblt	%f0, %f1, fbgt_else.47438
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47439
fbgt_else.47438:
fbgt_cont.47439:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.47440
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47441
fbgt_else.47440:
fbgt_cont.47441:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.47442
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.47443
fbgt_else.47442:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.47443:
	beqi	%v0, 0, bnei_else.47444
	j	bnei_cont.47445
bnei_else.47444:
	fneg	%f0, %f0
bnei_cont.47445:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.47337:
	j	bnei_cont.47335
bnei_else.47334:
	lw	%a1, 5(%v1)
	flw	%f6, 0(%a1)
	fsub	%f6, %f3, %f6
	flw	%f7, 445(%zero)
	fmul	%f8, %f6, %f7
	floor	%f8, %f8
	flw	%f9, 444(%zero)
	fmul	%f8, %f8, %f9
	fsub	%f6, %f6, %f8
	flw	%f8, 448(%zero)
	fblt	%f6, %f8, fbgt_else.47446
	addi	%a1, %zero, 0
	j	fbgt_cont.47447
fbgt_else.47446:
	addi	%a1, %zero, 1
fbgt_cont.47447:
	lw	%a3, 5(%v1)
	flw	%f6, 2(%a3)
	fsub	%f6, %f5, %f6
	fmul	%f7, %f6, %f7
	floor	%f7, %f7
	fmul	%f7, %f7, %f9
	fsub	%f6, %f6, %f7
	fblt	%f6, %f8, fbgt_else.47448
	addi	%a3, %zero, 0
	j	fbgt_cont.47449
fbgt_else.47448:
	addi	%a3, %zero, 1
fbgt_cont.47449:
	beqi	%a1, 0, bnei_else.47450
	beqi	%a3, 0, bnei_else.47452
	flw	%f6, 450(%zero)
	j	bnei_cont.47451
bnei_else.47452:
	flw	%f6, 493(%zero)
bnei_cont.47453:
	j	bnei_cont.47451
bnei_else.47450:
	beqi	%a3, 0, bnei_else.47454
	flw	%f6, 493(%zero)
	j	bnei_cont.47455
bnei_else.47454:
	flw	%f6, 450(%zero)
bnei_cont.47455:
bnei_cont.47451:
	fsw	%f6, 146(%zero)
bnei_cont.47335:
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
	flw	%f4, 471(%zero)
	fblt	%f3, %f4, fbgt_else.47456
	addi	%a3, %zero, 0
	j	fbgt_cont.47457
fbgt_else.47456:
	addi	%a3, %zero, 1
fbgt_cont.47457:
	beqi	%a3, 0, bnei_else.47458
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1
	sw	%a3, 0(%at)
	j	bnei_cont.47459
bnei_else.47458:
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
bnei_cont.47459:
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
	fsw	%f3, 24(%sp)
	fsw	%f10, 25(%sp)
	fsw	%f8, 26(%sp)
	fsw	%f5, 27(%sp)
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	beqi	%v0, 0, bnei_else.47460
	j	bnei_cont.47461
bnei_else.47460:
	flw	%f0, 78(%zero)
	flw	%f1, 27(%sp)
	fmul	%f1, %f1, %f0
	flw	%f2, 79(%zero)
	flw	%f3, 26(%sp)
	fmul	%f3, %f3, %f2
	fadd	%f1, %f1, %f3
	flw	%f3, 80(%zero)
	flw	%f4, 25(%sp)
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
	flw	%f2, 493(%zero)
	fblt	%f2, %f1, fbgt_else.47462
	addi	%v1, %zero, 0
	j	fbgt_cont.47463
fbgt_else.47462:
	addi	%v1, %zero, 1
fbgt_cont.47463:
	beqi	%v1, 0, bnei_else.47464
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
	j	bnei_cont.47465
bnei_else.47464:
bnei_cont.47465:
	fblt	%f2, %f0, fbgt_else.47466
	addi	%v1, %zero, 0
	j	fbgt_cont.47467
fbgt_else.47466:
	addi	%v1, %zero, 1
fbgt_cont.47467:
	beqi	%v1, 0, bnei_else.47468
	fmul	%f0, %f0, %f0
	fmul	%f0, %f0, %f0
	flw	%f1, 24(%sp)
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
	j	bnei_cont.47469
bnei_else.47468:
bnei_cont.47469:
bnei_cont.47461:
	flw	%f0, 15(%sp)
	fsw	%f0, 162(%zero)
	flw	%f0, 14(%sp)
	fsw	%f0, 163(%zero)
	flw	%f0, 13(%sp)
	fsw	%f0, 164(%zero)
	lw	%v0, 0(%zero)
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	setup_startp_constants.2882
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v0, 434(%zero)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)
	flw	%f1, 24(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	trace_reflections.2966
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	flw	%f0, 441(%zero)
	flw	%f1, 4(%sp)
	fblt	%f0, %f1, fbgt_else.47470
	addi	%v0, %zero, 0
	j	fbgt_cont.47471
fbgt_else.47470:
	addi	%v0, %zero, 1
fbgt_cont.47471:
	beqi	%v0, 0, bnei_else.47472
	lw	%v0, 6(%sp)
	blti	%v0, 4, bgti_else.47473
	j	bgti_cont.47474
bgti_else.47473:
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)
	add	%at, %a1, %v1
	sw	%a0, 0(%at)
bgti_cont.47474:
	lw	%v1, 9(%sp)
	beqi	%v1, 2, bnei_else.47475
	jr	%ra
bnei_else.47475:
	flw	%f0, 491(%zero)
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
bnei_else.47472:
	jr	%ra
bnei_else.47313:
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	beqi	%v1, 0, bnei_else.47478
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
	flw	%f1, 493(%zero)
	fblt	%f1, %f0, fbgt_else.47479
	addi	%v0, %zero, 0
	j	fbgt_cont.47480
fbgt_else.47479:
	addi	%v0, %zero, 1
fbgt_cont.47480:
	beqi	%v0, 0, bnei_else.47481
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
bnei_else.47481:
	jr	%ra
bnei_else.47478:
	jr	%ra
bgt_else.47306:
	jr	%ra
trace_diffuse_ray.2977:
	addi	%v1, %zero, 0
	flw	%f1, 465(%zero)
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
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.47611
	addi	%v0, %zero, 0
	j	fbgt_cont.47612
fbgt_else.47611:
	addi	%v0, %zero, 1
fbgt_cont.47612:
	beqi	%v0, 0, bnei_else.47613
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.47615
	addi	%v0, %zero, 0
	j	bnei_cont.47614
fbgt_else.47615:
	addi	%v0, %zero, 1
fbgt_cont.47616:
	j	bnei_cont.47614
bnei_else.47613:
	addi	%v0, %zero, 0
bnei_cont.47614:
	beqi	%v0, 0, bnei_else.47617
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 3(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.47618
	beqi	%a0, 2, bnei_else.47620
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
	beqi	%v1, 0, bnei_else.47622
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
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
	j	bnei_cont.47623
bnei_else.47622:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.47623:
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
	flw	%f4, 493(%zero)
	fbne	%f1, %f4, fbeq_else.47624
	addi	%a0, %zero, 1
	j	fbeq_cont.47625
fbeq_else.47624:
	addi	%a0, %zero, 0
fbeq_cont.47625:
	beqi	%a0, 0, bnei_else.47626
	flw	%f1, 491(%zero)
	j	bnei_cont.47627
bnei_else.47626:
	beqi	%v1, 0, bnei_else.47628
	flw	%f4, 490(%zero)
	fdiv	%f1, %f4, %f1
	j	bnei_cont.47629
bnei_else.47628:
	flw	%f4, 491(%zero)
	fdiv	%f1, %f4, %f1
bnei_cont.47629:
bnei_cont.47627:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.47619
bnei_else.47620:
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
bnei_cont.47621:
	j	bnei_cont.47619
bnei_else.47618:
	lw	%a0, 136(%zero)
	flw	%f0, 493(%zero)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.47630
	addi	%v1, %zero, 1
	j	fbeq_cont.47631
fbeq_else.47630:
	addi	%v1, %zero, 0
fbeq_cont.47631:
	beqi	%v1, 0, bnei_else.47632
	j	bnei_cont.47633
bnei_else.47632:
	fblt	%f0, %f1, fbgt_else.47634
	addi	%v1, %zero, 0
	j	fbgt_cont.47635
fbgt_else.47634:
	addi	%v1, %zero, 1
fbgt_cont.47635:
	beqi	%v1, 0, bnei_else.47636
	flw	%f0, 491(%zero)
	j	bnei_cont.47637
bnei_else.47636:
	flw	%f0, 490(%zero)
bnei_cont.47637:
bnei_cont.47633:
	fneg	%f0, %f0
	fsw	%f0, 142(%a0)
bnei_cont.47619:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 4(%sp)
	beqi	%v1, 1, bnei_else.47638
	beqi	%v1, 2, bnei_else.47640
	beqi	%v1, 3, bnei_else.47642
	beqi	%v1, 4, bnei_else.47644
	j	bnei_cont.47639
bnei_else.47644:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.47646
	addi	%v1, %zero, 0
	j	fbgt_cont.47647
fbgt_else.47646:
	addi	%v1, %zero, 1
fbgt_cont.47647:
	beqi	%v1, 0, bnei_else.47648
	flw	%f0, 462(%zero)
	j	bnei_cont.47649
bnei_else.47648:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.47650
	addi	%v1, %zero, 1
	j	fbgt_cont.47651
fbgt_else.47650:
	addi	%v1, %zero, 0
fbgt_cont.47651:
	fabs	%f1, %f0
	flw	%f3, 461(%zero)
	fblt	%f1, %f3, fbgt_else.47652
	flw	%f0, 454(%zero)
	fblt	%f1, %f0, fbgt_else.47654
	flw	%f0, 476(%zero)
	flw	%f3, 491(%zero)
	fdiv	%f1, %f3, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47655
fbgt_else.47654:
	flw	%f0, 475(%zero)
	flw	%f3, 491(%zero)
	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f5, %f1
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f7, %f1, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f1
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmul	%f1, %f1, %f6
	fadd	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
fbgt_cont.47655:
	beqi	%v1, 0, bnei_else.47656
	j	fbgt_cont.47653
bnei_else.47656:
	fneg	%f0, %f0
bnei_cont.47657:
	j	fbgt_cont.47653
fbgt_else.47652:
	fmul	%f1, %f0, %f0
	fmul	%f3, %f1, %f1
	fmul	%f5, %f3, %f3
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f1
	fsub	%f6, %f0, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fsub	%f1, %f6, %f1
	flw	%f6, 455(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f3
	fmul	%f0, %f0, %f5
	fadd	%f0, %f1, %f0
fbgt_cont.47653:
	flw	%f1, 453(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fdiv	%f0, %f0, %f1
bnei_cont.47649:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.47658
	addi	%v1, %zero, 0
	j	fbgt_cont.47659
fbgt_else.47658:
	addi	%v1, %zero, 1
fbgt_cont.47659:
	beqi	%v1, 0, bnei_else.47660
	flw	%f1, 462(%zero)
	j	bnei_cont.47661
bnei_else.47660:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 493(%zero)
	fblt	%f1, %f2, fbgt_else.47662
	addi	%v1, %zero, 1
	j	fbgt_cont.47663
fbgt_else.47662:
	addi	%v1, %zero, 0
fbgt_cont.47663:
	fabs	%f2, %f1
	flw	%f3, 461(%zero)
	fblt	%f2, %f3, fbgt_else.47664
	flw	%f1, 454(%zero)
	fblt	%f2, %f1, fbgt_else.47666
	flw	%f1, 476(%zero)
	flw	%f3, 491(%zero)
	fdiv	%f2, %f3, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fsub	%f1, %f1, %f2
	j	fbgt_cont.47667
fbgt_else.47666:
	flw	%f1, 475(%zero)
	flw	%f3, 491(%zero)
	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3
	fdiv	%f2, %f4, %f2
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f6, %f2, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f2
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fmul	%f2, %f2, %f5
	fadd	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
fbgt_cont.47667:
	beqi	%v1, 0, bnei_else.47668
	j	fbgt_cont.47665
bnei_else.47668:
	fneg	%f1, %f1
bnei_cont.47669:
	j	fbgt_cont.47665
fbgt_else.47664:
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	fmul	%f4, %f3, %f3
	flw	%f5, 460(%zero)
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f5, %f1, %f5
	flw	%f6, 459(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fadd	%f5, %f5, %f6
	flw	%f6, 458(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f2
	fmul	%f6, %f6, %f3
	fsub	%f5, %f5, %f6
	flw	%f6, 457(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 456(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f2, %f6, %f2
	fmul	%f2, %f2, %f4
	fsub	%f2, %f5, %f2
	flw	%f5, 455(%zero)
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
fbgt_cont.47665:
	flw	%f2, 453(%zero)
	fmul	%f1, %f1, %f2
	flw	%f2, 452(%zero)
	fdiv	%f1, %f1, %f2
bnei_cont.47661:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.47670
	addi	%v1, %zero, 0
	j	fbgt_cont.47671
fbgt_else.47670:
	addi	%v1, %zero, 1
fbgt_cont.47671:
	beqi	%v1, 0, bnei_else.47672
	fmov	%f0, %f1
	j	bnei_cont.47673
bnei_else.47672:
bnei_cont.47673:
	flw	%f1, 450(%zero)
	fmul	%f0, %f1, %f0
	flw	%f1, 449(%zero)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.47645:
	j	bnei_cont.47639
bnei_else.47642:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 5(%sp)
	fsw	%f2, 6(%sp)
	fsw	%f0, 7(%sp)
	fblt	%f0, %f2, fbgt_else.47674
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.47676
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.47678
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.47680
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.47682
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.47684
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.47686
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.47688
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.47690
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.47692
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.47694
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.47696
	flw	%f3, 447(%zero)
	fmov	%f1, %f3
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.47675
fbgt_else.47696:
	fmov	%f1, %f3
fbgt_cont.47697:
	j	fbgt_cont.47675
fbgt_else.47694:
	fmov	%f1, %f3
fbgt_cont.47695:
	j	fbgt_cont.47675
fbgt_else.47692:
	fmov	%f1, %f3
fbgt_cont.47693:
	j	fbgt_cont.47675
fbgt_else.47690:
	fmov	%f1, %f3
fbgt_cont.47691:
	j	fbgt_cont.47675
fbgt_else.47688:
	fmov	%f1, %f3
fbgt_cont.47689:
	j	fbgt_cont.47675
fbgt_else.47686:
	fmov	%f1, %f3
fbgt_cont.47687:
	j	fbgt_cont.47675
fbgt_else.47684:
	fmov	%f1, %f3
fbgt_cont.47685:
	j	fbgt_cont.47675
fbgt_else.47682:
	fmov	%f1, %f3
fbgt_cont.47683:
	j	fbgt_cont.47675
fbgt_else.47680:
	fmov	%f1, %f3
fbgt_cont.47681:
	j	fbgt_cont.47675
fbgt_else.47678:
	fmov	%f1, %f3
fbgt_cont.47679:
	j	fbgt_cont.47675
fbgt_else.47676:
	fmov	%f1, %f3
fbgt_cont.47677:
	j	fbgt_cont.47675
fbgt_else.47674:
	fmov	%f1, %f2
fbgt_cont.47675:
	flw	%f0, 7(%sp)
	flw	%f2, 6(%sp)
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 5(%sp)
	fblt	%f0, %f1, fbgt_else.47698
	addi	%v0, %zero, 0
	j	fbgt_cont.47699
fbgt_else.47698:
	addi	%v0, %zero, 1
fbgt_cont.47699:
	fblt	%f0, %f1, fbgt_else.47700
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47701
fbgt_else.47700:
fbgt_cont.47701:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.47702
	beqi	%v0, 0, bnei_else.47704
	addi	%v0, %zero, 0
	j	fbgt_cont.47703
bnei_else.47704:
	addi	%v0, %zero, 1
bnei_cont.47705:
	j	fbgt_cont.47703
fbgt_else.47702:
fbgt_cont.47703:
	fblt	%f0, %f2, fbgt_else.47706
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47707
fbgt_else.47706:
fbgt_cont.47707:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.47708
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.47709
fbgt_else.47708:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.47709:
	beqi	%v0, 0, bnei_else.47710
	j	bnei_cont.47711
bnei_else.47710:
	fneg	%f0, %f0
bnei_cont.47711:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.47643:
	j	bnei_cont.47639
bnei_else.47640:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 493(%zero)
	fblt	%f0, %f2, fbgt_else.47712
	addi	%v1, %zero, 1
	j	fbgt_cont.47713
fbgt_else.47712:
	addi	%v1, %zero, 0
fbgt_cont.47713:
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	sw	%v1, 8(%sp)
	fsw	%f1, 9(%sp)
	fsw	%f2, 10(%sp)
	fsw	%f0, 11(%sp)
	fblt	%f0, %f2, fbgt_else.47714
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.47716
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.47718
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.47720
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.47722
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.47724
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.47726
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.47728
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.47730
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.47732
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.47734
	flw	%f3, 477(%zero)
	fblt	%f0, %f3, fbgt_else.47736
	flw	%f3, 447(%zero)
	fmov	%f1, %f3
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	fmov	%f1, %f0
	j	fbgt_cont.47715
fbgt_else.47736:
	fmov	%f1, %f3
fbgt_cont.47737:
	j	fbgt_cont.47715
fbgt_else.47734:
	fmov	%f1, %f3
fbgt_cont.47735:
	j	fbgt_cont.47715
fbgt_else.47732:
	fmov	%f1, %f3
fbgt_cont.47733:
	j	fbgt_cont.47715
fbgt_else.47730:
	fmov	%f1, %f3
fbgt_cont.47731:
	j	fbgt_cont.47715
fbgt_else.47728:
	fmov	%f1, %f3
fbgt_cont.47729:
	j	fbgt_cont.47715
fbgt_else.47726:
	fmov	%f1, %f3
fbgt_cont.47727:
	j	fbgt_cont.47715
fbgt_else.47724:
	fmov	%f1, %f3
fbgt_cont.47725:
	j	fbgt_cont.47715
fbgt_else.47722:
	fmov	%f1, %f3
fbgt_cont.47723:
	j	fbgt_cont.47715
fbgt_else.47720:
	fmov	%f1, %f3
fbgt_cont.47721:
	j	fbgt_cont.47715
fbgt_else.47718:
	fmov	%f1, %f3
fbgt_cont.47719:
	j	fbgt_cont.47715
fbgt_else.47716:
	fmov	%f1, %f3
fbgt_cont.47717:
	j	fbgt_cont.47715
fbgt_else.47714:
	fmov	%f1, %f2
fbgt_cont.47715:
	flw	%f0, 11(%sp)
	flw	%f2, 10(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 9(%sp)
	fblt	%f0, %f1, fbgt_else.47738
	lw	%v0, 8(%sp)
	beqi	%v0, 0, bnei_else.47740
	addi	%v0, %zero, 0
	j	fbgt_cont.47739
bnei_else.47740:
	addi	%v0, %zero, 1
bnei_cont.47741:
	j	fbgt_cont.47739
fbgt_else.47738:
	lw	%v0, 8(%sp)
fbgt_cont.47739:
	fblt	%f0, %f1, fbgt_else.47742
	fsub	%f0, %f0, %f1
	j	fbgt_cont.47743
fbgt_else.47742:
fbgt_cont.47743:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.47744
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47745
fbgt_else.47744:
fbgt_cont.47745:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.47746
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.47747
fbgt_else.47746:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.47747:
	beqi	%v0, 0, bnei_else.47748
	j	bnei_cont.47749
bnei_else.47748:
	fneg	%f0, %f0
bnei_cont.47749:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.47641:
	j	bnei_cont.47639
bnei_else.47638:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.47750
	addi	%v1, %zero, 0
	j	fbgt_cont.47751
fbgt_else.47750:
	addi	%v1, %zero, 1
fbgt_cont.47751:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.47752
	addi	%a0, %zero, 0
	j	fbgt_cont.47753
fbgt_else.47752:
	addi	%a0, %zero, 1
fbgt_cont.47753:
	beqi	%v1, 0, bnei_else.47754
	beqi	%a0, 0, bnei_else.47756
	flw	%f0, 450(%zero)
	j	bnei_cont.47755
bnei_else.47756:
	flw	%f0, 493(%zero)
bnei_cont.47757:
	j	bnei_cont.47755
bnei_else.47754:
	beqi	%a0, 0, bnei_else.47758
	flw	%f0, 493(%zero)
	j	bnei_cont.47759
bnei_else.47758:
	flw	%f0, 450(%zero)
bnei_cont.47759:
bnei_cont.47755:
	fsw	%f0, 146(%zero)
bnei_cont.47639:
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	beqi	%v0, 0, bnei_else.47760
	jr	%ra
bnei_else.47760:
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
	flw	%f1, 493(%zero)
	fblt	%f1, %f0, fbgt_else.47762
	addi	%v0, %zero, 0
	j	fbgt_cont.47763
fbgt_else.47762:
	addi	%v0, %zero, 1
fbgt_cont.47763:
	beqi	%v0, 0, bnei_else.47764
	j	bnei_cont.47765
bnei_else.47764:
	fmov	%f0, %f1
bnei_cont.47765:
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
bnei_else.47617:
	jr	%ra
iter_trace_diffuse_rays.2980:
	addi	%a2, %zero, 0
	blti	%a1, 0, bgti_else.48522
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
	flw	%f2, 493(%zero)
	fblt	%f0, %f2, fbgt_else.48523
	addi	%t0, %zero, 0
	j	fbgt_cont.48524
fbgt_else.48523:
	addi	%t0, %zero, 1
fbgt_cont.48524:
	sw	%a0, 0(%sp)
	sw	%v1, 1(%sp)
	sw	%a2, 2(%sp)
	fsw	%f2, 3(%sp)
	fsw	%f4, 4(%sp)
	fsw	%f3, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%v0, 7(%sp)
	sw	%a1, 8(%sp)
	beqi	%t0, 0, bnei_else.48525
	addi	%a3, %a1, 1
	add	%at, %v0, %a3
	lw	%a3, 0(%at)
	flw	%f5, 440(%zero)
	fdiv	%f0, %f0, %f5
	flw	%f5, 465(%zero)
	fsw	%f5, 137(%zero)
	lw	%t0, 134(%zero)
	lw	%t2, 0(%t0)
	lw	%t3, 0(%t2)
	fsw	%f0, 9(%sp)
	sw	%t0, 10(%sp)
	sw	%a3, 11(%sp)
	beqi	%t3, -1, bnei_else.48527
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.48529
	lw	%t4, 12(%t3)
	lw	%t5, 10(%t4)
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)
	flw	%f7, 2(%t5)
	lw	%t6, 1(%a3)
	add	%at, %t6, %t3
	lw	%t3, 0(%at)
	lw	%t6, 1(%t4)
	beqi	%t6, 1, bnei_else.48531
	beqi	%t6, 2, bnei_else.48533
	flw	%f8, 0(%t3)
	fbne	%f8, %f2, fbeq_else.48535
	addi	%t6, %zero, 1
	j	fbeq_cont.48536
fbeq_else.48535:
	addi	%t6, %zero, 0
fbeq_cont.48536:
	beqi	%t6, 0, bnei_else.48537
	addi	%t3, %zero, 0
	j	bnei_cont.48532
bnei_else.48537:
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
	fblt	%f2, %f6, fbgt_else.48539
	addi	%t5, %zero, 0
	j	fbgt_cont.48540
fbgt_else.48539:
	addi	%t5, %zero, 1
fbgt_cont.48540:
	beqi	%t5, 0, bnei_else.48541
	lw	%t4, 6(%t4)
	beqi	%t4, 0, bnei_else.48543
	fsqrt	%f6, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	j	bnei_cont.48544
bnei_else.48543:
	fsqrt	%f6, %f6
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
bnei_cont.48544:
	addi	%t3, %zero, 1
	j	bnei_cont.48542
bnei_else.48541:
	addi	%t3, %zero, 0
bnei_cont.48542:
bnei_cont.48538:
	j	bnei_cont.48532
bnei_else.48533:
	flw	%f5, 0(%t3)
	fblt	%f5, %f2, fbgt_else.48545
	addi	%t3, %zero, 0
	j	fbgt_cont.48546
fbgt_else.48545:
	addi	%t3, %zero, 1
fbgt_cont.48546:
	beqi	%t3, 0, bnei_else.48547
	flw	%f6, 3(%t5)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.48548
bnei_else.48547:
	addi	%t3, %zero, 0
bnei_cont.48548:
bnei_cont.48534:
	j	bnei_cont.48532
bnei_else.48531:
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
	fblt	%f11, %f12, fbgt_else.48549
	addi	%t6, %zero, 0
	j	fbgt_cont.48550
fbgt_else.48549:
	addi	%t6, %zero, 1
fbgt_cont.48550:
	beqi	%t6, 0, bnei_else.48551
	flw	%f11, 2(%t5)
	fmul	%f11, %f8, %f11
	fadd	%f11, %f11, %f7
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f13, 2(%t6)
	fblt	%f11, %f13, fbgt_else.48553
	addi	%t6, %zero, 0
	j	fbgt_cont.48554
fbgt_else.48553:
	addi	%t6, %zero, 1
fbgt_cont.48554:
	beqi	%t6, 0, bnei_else.48555
	fbne	%f9, %f2, fbeq_else.48557
	addi	%t6, %zero, 1
	j	fbeq_cont.48558
fbeq_else.48557:
	addi	%t6, %zero, 0
fbeq_cont.48558:
	beqi	%t6, 0, bnei_else.48559
	addi	%t6, %zero, 0
	j	bnei_cont.48552
bnei_else.48559:
	addi	%t6, %zero, 1
bnei_cont.48560:
	j	bnei_cont.48552
bnei_else.48555:
	addi	%t6, %zero, 0
bnei_cont.48556:
	j	bnei_cont.48552
bnei_else.48551:
	addi	%t6, %zero, 0
bnei_cont.48552:
	beqi	%t6, 0, bnei_else.48561
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.48562
bnei_else.48561:
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
	fblt	%f13, %f14, fbgt_else.48563
	addi	%t6, %zero, 0
	j	fbgt_cont.48564
fbgt_else.48563:
	addi	%t6, %zero, 1
fbgt_cont.48564:
	beqi	%t6, 0, bnei_else.48565
	flw	%f13, 2(%t5)
	fmul	%f13, %f8, %f13
	fadd	%f13, %f13, %f7
	fabs	%f13, %f13
	lw	%t4, 4(%t4)
	flw	%f15, 2(%t4)
	fblt	%f13, %f15, fbgt_else.48567
	addi	%t4, %zero, 0
	j	fbgt_cont.48568
fbgt_else.48567:
	addi	%t4, %zero, 1
fbgt_cont.48568:
	beqi	%t4, 0, bnei_else.48569
	fbne	%f9, %f2, fbeq_else.48571
	addi	%t4, %zero, 1
	j	fbeq_cont.48572
fbeq_else.48571:
	addi	%t4, %zero, 0
fbeq_cont.48572:
	beqi	%t4, 0, bnei_else.48573
	addi	%t4, %zero, 0
	j	bnei_cont.48566
bnei_else.48573:
	addi	%t4, %zero, 1
bnei_cont.48574:
	j	bnei_cont.48566
bnei_else.48569:
	addi	%t4, %zero, 0
bnei_cont.48570:
	j	bnei_cont.48566
bnei_else.48565:
	addi	%t4, %zero, 0
bnei_cont.48566:
	beqi	%t4, 0, bnei_else.48575
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 2
	j	bnei_cont.48576
bnei_else.48575:
	flw	%f8, 4(%t3)
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)
	fmul	%f7, %f7, %f8
	fmul	%f9, %f7, %f11
	fadd	%f5, %f9, %f5
	fabs	%f5, %f5
	fblt	%f5, %f14, fbgt_else.48577
	addi	%t3, %zero, 0
	j	fbgt_cont.48578
fbgt_else.48577:
	addi	%t3, %zero, 1
fbgt_cont.48578:
	beqi	%t3, 0, bnei_else.48579
	fmul	%f5, %f7, %f10
	fadd	%f5, %f5, %f6
	fabs	%f5, %f5
	fblt	%f5, %f12, fbgt_else.48581
	addi	%t3, %zero, 0
	j	fbgt_cont.48582
fbgt_else.48581:
	addi	%t3, %zero, 1
fbgt_cont.48582:
	beqi	%t3, 0, bnei_else.48583
	fbne	%f8, %f2, fbeq_else.48585
	addi	%t3, %zero, 1
	j	fbeq_cont.48586
fbeq_else.48585:
	addi	%t3, %zero, 0
fbeq_cont.48586:
	beqi	%t3, 0, bnei_else.48587
	addi	%t3, %zero, 0
	j	bnei_cont.48580
bnei_else.48587:
	addi	%t3, %zero, 1
bnei_cont.48588:
	j	bnei_cont.48580
bnei_else.48583:
	addi	%t3, %zero, 0
bnei_cont.48584:
	j	bnei_cont.48580
bnei_else.48579:
	addi	%t3, %zero, 0
bnei_cont.48580:
	beqi	%t3, 0, bnei_else.48589
	fsw	%f7, 135(%zero)
	addi	%t3, %zero, 3
	j	bnei_cont.48590
bnei_else.48589:
	addi	%t3, %zero, 0
bnei_cont.48590:
bnei_cont.48576:
bnei_cont.48562:
bnei_cont.48532:
	beqi	%t3, 0, bnei_else.48591
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	fblt	%f5, %f6, fbgt_else.48593
	addi	%t3, %zero, 0
	j	fbgt_cont.48594
fbgt_else.48593:
	addi	%t3, %zero, 1
fbgt_cont.48594:
	beqi	%t3, 0, bnei_else.48595
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.48597
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
	beqi	%v1, -1, bnei_else.48599
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
	beqi	%v1, -1, bnei_else.48601
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
	beqi	%v1, -1, bnei_else.48603
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
	j	bnei_cont.48530
bnei_else.48603:
bnei_cont.48604:
	j	bnei_cont.48530
bnei_else.48601:
bnei_cont.48602:
	j	bnei_cont.48530
bnei_else.48599:
bnei_cont.48600:
	j	bnei_cont.48530
bnei_else.48597:
bnei_cont.48598:
	j	bnei_cont.48530
bnei_else.48595:
bnei_cont.48596:
	j	bnei_cont.48530
bnei_else.48591:
bnei_cont.48592:
	j	bnei_cont.48530
bnei_else.48529:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.48605
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
	beqi	%v1, -1, bnei_else.48607
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
	beqi	%v1, -1, bnei_else.48609
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
	beqi	%v1, -1, bnei_else.48611
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
	j	bnei_cont.48606
bnei_else.48611:
bnei_cont.48612:
	j	bnei_cont.48606
bnei_else.48609:
bnei_cont.48610:
	j	bnei_cont.48606
bnei_else.48607:
bnei_cont.48608:
	j	bnei_cont.48606
bnei_else.48605:
bnei_cont.48606:
bnei_cont.48530:
	lw	%v0, 12(%sp)
	lw	%v1, 10(%sp)
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bnei_cont.48528
bnei_else.48527:
bnei_cont.48528:
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.48613
	addi	%v0, %zero, 0
	j	fbgt_cont.48614
fbgt_else.48613:
	addi	%v0, %zero, 1
fbgt_cont.48614:
	beqi	%v0, 0, bnei_else.48615
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.48617
	addi	%v0, %zero, 0
	j	bnei_cont.48616
fbgt_else.48617:
	addi	%v0, %zero, 1
fbgt_cont.48618:
	j	bnei_cont.48616
bnei_else.48615:
	addi	%v0, %zero, 0
bnei_cont.48616:
	beqi	%v0, 0, bnei_else.48619
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 11(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.48621
	beqi	%a0, 2, bnei_else.48623
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
	beqi	%v1, 0, bnei_else.48625
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f7, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f9, %f2, %f8
	fadd	%f7, %f7, %f9
	flw	%f9, 471(%zero)
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
	j	bnei_cont.48626
bnei_else.48625:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.48626:
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
	fbne	%f1, %f4, fbeq_else.48627
	addi	%a0, %zero, 1
	j	fbeq_cont.48628
fbeq_else.48627:
	addi	%a0, %zero, 0
fbeq_cont.48628:
	beqi	%a0, 0, bnei_else.48629
	flw	%f1, 491(%zero)
	j	bnei_cont.48630
bnei_else.48629:
	beqi	%v1, 0, bnei_else.48631
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.48632
bnei_else.48631:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.48632:
bnei_cont.48630:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.48622
bnei_else.48623:
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
bnei_cont.48624:
	j	bnei_cont.48622
bnei_else.48621:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.48633
	addi	%v1, %zero, 1
	j	fbeq_cont.48634
fbeq_else.48633:
	addi	%v1, %zero, 0
fbeq_cont.48634:
	beqi	%v1, 0, bnei_else.48635
	fmov	%f1, %f0
	j	bnei_cont.48636
bnei_else.48635:
	fblt	%f0, %f1, fbgt_else.48637
	addi	%v1, %zero, 0
	j	fbgt_cont.48638
fbgt_else.48637:
	addi	%v1, %zero, 1
fbgt_cont.48638:
	beqi	%v1, 0, bnei_else.48639
	flw	%f1, 491(%zero)
	j	bnei_cont.48640
bnei_else.48639:
	flw	%f1, 490(%zero)
bnei_cont.48640:
bnei_cont.48636:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.48622:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 14(%sp)
	beqi	%v1, 1, bnei_else.48641
	beqi	%v1, 2, bnei_else.48643
	beqi	%v1, 3, bnei_else.48645
	beqi	%v1, 4, bnei_else.48647
	j	bnei_cont.48642
bnei_else.48647:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.48649
	addi	%v1, %zero, 0
	j	fbgt_cont.48650
fbgt_else.48649:
	addi	%v1, %zero, 1
fbgt_cont.48650:
	beqi	%v1, 0, bnei_else.48651
	flw	%f0, 462(%zero)
	j	bnei_cont.48652
bnei_else.48651:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.48653
	addi	%v1, %zero, 1
	j	fbgt_cont.48654
fbgt_else.48653:
	addi	%v1, %zero, 0
fbgt_cont.48654:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.48655
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.48657
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.48658
fbgt_else.48657:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.48658:
	beqi	%v1, 0, bnei_else.48659
	j	fbgt_cont.48656
bnei_else.48659:
	fneg	%f0, %f0
bnei_cont.48660:
	j	fbgt_cont.48656
fbgt_else.48655:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.48656:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.48652:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.48661
	addi	%v1, %zero, 0
	j	fbgt_cont.48662
fbgt_else.48661:
	addi	%v1, %zero, 1
fbgt_cont.48662:
	beqi	%v1, 0, bnei_else.48663
	flw	%f1, 462(%zero)
	j	bnei_cont.48664
bnei_else.48663:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.48665
	addi	%v1, %zero, 1
	j	fbgt_cont.48666
fbgt_else.48665:
	addi	%v1, %zero, 0
fbgt_cont.48666:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.48667
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.48669
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.48670
fbgt_else.48669:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.48670:
	beqi	%v1, 0, bnei_else.48671
	j	fbgt_cont.48668
bnei_else.48671:
	fneg	%f1, %f1
bnei_cont.48672:
	j	fbgt_cont.48668
fbgt_else.48667:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.48668:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.48664:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.48673
	addi	%v1, %zero, 0
	j	fbgt_cont.48674
fbgt_else.48673:
	addi	%v1, %zero, 1
fbgt_cont.48674:
	beqi	%v1, 0, bnei_else.48675
	fmov	%f0, %f1
	j	bnei_cont.48676
bnei_else.48675:
bnei_cont.48676:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.48648:
	j	bnei_cont.48642
bnei_else.48645:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 15(%sp)
	fsw	%f0, 16(%sp)
	fsw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.48677
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.48679
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.48681
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.48683
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.48685
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.48687
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.48689
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.48691
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.48693
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.48695
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.48697
	flw	%f3, 477(%zero)
	fmov	%f1, %f3
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	fbgt_cont.48678
fbgt_else.48697:
	fmov	%f0, %f3
fbgt_cont.48698:
	j	fbgt_cont.48678
fbgt_else.48695:
	fmov	%f0, %f3
fbgt_cont.48696:
	j	fbgt_cont.48678
fbgt_else.48693:
	fmov	%f0, %f3
fbgt_cont.48694:
	j	fbgt_cont.48678
fbgt_else.48691:
	fmov	%f0, %f3
fbgt_cont.48692:
	j	fbgt_cont.48678
fbgt_else.48689:
	fmov	%f0, %f3
fbgt_cont.48690:
	j	fbgt_cont.48678
fbgt_else.48687:
	fmov	%f0, %f3
fbgt_cont.48688:
	j	fbgt_cont.48678
fbgt_else.48685:
	fmov	%f0, %f3
fbgt_cont.48686:
	j	fbgt_cont.48678
fbgt_else.48683:
	fmov	%f0, %f3
fbgt_cont.48684:
	j	fbgt_cont.48678
fbgt_else.48681:
	fmov	%f0, %f3
fbgt_cont.48682:
	j	fbgt_cont.48678
fbgt_else.48679:
	fmov	%f0, %f3
fbgt_cont.48680:
	j	fbgt_cont.48678
fbgt_else.48677:
	fmov	%f0, %f2
fbgt_cont.48678:
	flw	%f1, 16(%sp)
	flw	%f2, 17(%sp)
	fblt	%f1, %f2, fbgt_else.48699
	fblt	%f1, %f0, fbgt_else.48701
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48703
	fblt	%f1, %f0, fbgt_else.48705
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48707
	fblt	%f1, %f0, fbgt_else.48709
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
	j	fbgt_cont.48700
fbgt_else.48709:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.48710:
	j	fbgt_cont.48700
fbgt_else.48707:
	fmov	%f0, %f1
fbgt_cont.48708:
	j	fbgt_cont.48700
fbgt_else.48705:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48711
	fblt	%f1, %f0, fbgt_else.48713
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
	j	fbgt_cont.48712
fbgt_else.48713:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.48714:
	j	fbgt_cont.48712
fbgt_else.48711:
	fmov	%f0, %f1
fbgt_cont.48712:
fbgt_cont.48706:
	j	fbgt_cont.48700
fbgt_else.48703:
	fmov	%f0, %f1
fbgt_cont.48704:
	j	fbgt_cont.48700
fbgt_else.48701:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48715
	fblt	%f1, %f0, fbgt_else.48717
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48719
	fblt	%f1, %f0, fbgt_else.48721
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
	j	fbgt_cont.48716
fbgt_else.48721:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.48722:
	j	fbgt_cont.48716
fbgt_else.48719:
	fmov	%f0, %f1
fbgt_cont.48720:
	j	fbgt_cont.48716
fbgt_else.48717:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48723
	fblt	%f1, %f0, fbgt_else.48725
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
	j	fbgt_cont.48724
fbgt_else.48725:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
fbgt_cont.48726:
	j	fbgt_cont.48724
fbgt_else.48723:
	fmov	%f0, %f1
fbgt_cont.48724:
fbgt_cont.48718:
	j	fbgt_cont.48716
fbgt_else.48715:
	fmov	%f0, %f1
fbgt_cont.48716:
fbgt_cont.48702:
	j	fbgt_cont.48700
fbgt_else.48699:
	fmov	%f0, %f1
fbgt_cont.48700:
	flw	%f1, 15(%sp)
	fblt	%f0, %f1, fbgt_else.48727
	addi	%v0, %zero, 0
	j	fbgt_cont.48728
fbgt_else.48727:
	addi	%v0, %zero, 1
fbgt_cont.48728:
	fblt	%f0, %f1, fbgt_else.48729
	fsub	%f0, %f0, %f1
	j	fbgt_cont.48730
fbgt_else.48729:
fbgt_cont.48730:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.48731
	beqi	%v0, 0, bnei_else.48733
	addi	%v0, %zero, 0
	j	fbgt_cont.48732
bnei_else.48733:
	addi	%v0, %zero, 1
bnei_cont.48734:
	j	fbgt_cont.48732
fbgt_else.48731:
fbgt_cont.48732:
	fblt	%f0, %f2, fbgt_else.48735
	fsub	%f0, %f1, %f0
	j	fbgt_cont.48736
fbgt_else.48735:
fbgt_cont.48736:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.48737
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.48738
fbgt_else.48737:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.48738:
	beqi	%v0, 0, bnei_else.48739
	j	bnei_cont.48740
bnei_else.48739:
	fneg	%f0, %f0
bnei_cont.48740:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.48646:
	j	bnei_cont.48642
bnei_else.48643:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.48741
	addi	%v1, %zero, 1
	j	fbgt_cont.48742
fbgt_else.48741:
	addi	%v1, %zero, 0
fbgt_cont.48742:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 18(%sp)
	fsw	%f1, 19(%sp)
	fsw	%f0, 20(%sp)
	fsw	%f3, 21(%sp)
	fblt	%f0, %f3, fbgt_else.48743
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.48745
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.48747
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.48749
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.48751
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.48753
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.48755
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.48757
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.48759
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.48761
	flw	%f4, 478(%zero)
	fblt	%f0, %f4, fbgt_else.48763
	flw	%f4, 477(%zero)
	fmov	%f1, %f4
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.48744
fbgt_else.48763:
	fmov	%f0, %f4
fbgt_cont.48764:
	j	fbgt_cont.48744
fbgt_else.48761:
	fmov	%f0, %f4
fbgt_cont.48762:
	j	fbgt_cont.48744
fbgt_else.48759:
	fmov	%f0, %f4
fbgt_cont.48760:
	j	fbgt_cont.48744
fbgt_else.48757:
	fmov	%f0, %f4
fbgt_cont.48758:
	j	fbgt_cont.48744
fbgt_else.48755:
	fmov	%f0, %f4
fbgt_cont.48756:
	j	fbgt_cont.48744
fbgt_else.48753:
	fmov	%f0, %f4
fbgt_cont.48754:
	j	fbgt_cont.48744
fbgt_else.48751:
	fmov	%f0, %f4
fbgt_cont.48752:
	j	fbgt_cont.48744
fbgt_else.48749:
	fmov	%f0, %f4
fbgt_cont.48750:
	j	fbgt_cont.48744
fbgt_else.48747:
	fmov	%f0, %f4
fbgt_cont.48748:
	j	fbgt_cont.48744
fbgt_else.48745:
	fmov	%f0, %f4
fbgt_cont.48746:
	j	fbgt_cont.48744
fbgt_else.48743:
	fmov	%f0, %f3
fbgt_cont.48744:
	flw	%f1, 20(%sp)
	flw	%f2, 21(%sp)
	fblt	%f1, %f2, fbgt_else.48765
	fblt	%f1, %f0, fbgt_else.48767
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48769
	fblt	%f1, %f0, fbgt_else.48771
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48773
	fblt	%f1, %f0, fbgt_else.48775
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.48766
fbgt_else.48775:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
fbgt_cont.48776:
	j	fbgt_cont.48766
fbgt_else.48773:
	fmov	%f0, %f1
fbgt_cont.48774:
	j	fbgt_cont.48766
fbgt_else.48771:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48777
	fblt	%f1, %f0, fbgt_else.48779
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.48778
fbgt_else.48779:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
fbgt_cont.48780:
	j	fbgt_cont.48778
fbgt_else.48777:
	fmov	%f0, %f1
fbgt_cont.48778:
fbgt_cont.48772:
	j	fbgt_cont.48766
fbgt_else.48769:
	fmov	%f0, %f1
fbgt_cont.48770:
	j	fbgt_cont.48766
fbgt_else.48767:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48781
	fblt	%f1, %f0, fbgt_else.48783
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48785
	fblt	%f1, %f0, fbgt_else.48787
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.48782
fbgt_else.48787:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
fbgt_cont.48788:
	j	fbgt_cont.48782
fbgt_else.48785:
	fmov	%f0, %f1
fbgt_cont.48786:
	j	fbgt_cont.48782
fbgt_else.48783:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48789
	fblt	%f1, %f0, fbgt_else.48791
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	fbgt_cont.48790
fbgt_else.48791:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
fbgt_cont.48792:
	j	fbgt_cont.48790
fbgt_else.48789:
	fmov	%f0, %f1
fbgt_cont.48790:
fbgt_cont.48784:
	j	fbgt_cont.48782
fbgt_else.48781:
	fmov	%f0, %f1
fbgt_cont.48782:
fbgt_cont.48768:
	j	fbgt_cont.48766
fbgt_else.48765:
	fmov	%f0, %f1
fbgt_cont.48766:
	flw	%f1, 19(%sp)
	fblt	%f0, %f1, fbgt_else.48793
	lw	%v0, 18(%sp)
	beqi	%v0, 0, bnei_else.48795
	addi	%v0, %zero, 0
	j	fbgt_cont.48794
bnei_else.48795:
	addi	%v0, %zero, 1
bnei_cont.48796:
	j	fbgt_cont.48794
fbgt_else.48793:
	lw	%v0, 18(%sp)
fbgt_cont.48794:
	fblt	%f0, %f1, fbgt_else.48797
	fsub	%f0, %f0, %f1
	j	fbgt_cont.48798
fbgt_else.48797:
fbgt_cont.48798:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.48799
	fsub	%f0, %f1, %f0
	j	fbgt_cont.48800
fbgt_else.48799:
fbgt_cont.48800:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.48801
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.48802
fbgt_else.48801:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.48802:
	beqi	%v0, 0, bnei_else.48803
	j	bnei_cont.48804
bnei_else.48803:
	fneg	%f0, %f0
bnei_cont.48804:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.48644:
	j	bnei_cont.48642
bnei_else.48641:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.48805
	addi	%v1, %zero, 0
	j	fbgt_cont.48806
fbgt_else.48805:
	addi	%v1, %zero, 1
fbgt_cont.48806:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.48807
	addi	%a0, %zero, 0
	j	fbgt_cont.48808
fbgt_else.48807:
	addi	%a0, %zero, 1
fbgt_cont.48808:
	beqi	%v1, 0, bnei_else.48809
	beqi	%a0, 0, bnei_else.48811
	flw	%f0, 450(%zero)
	j	bnei_cont.48810
bnei_else.48811:
	flw	%f0, 3(%sp)
bnei_cont.48812:
	j	bnei_cont.48810
bnei_else.48809:
	beqi	%a0, 0, bnei_else.48813
	flw	%f0, 3(%sp)
	j	bnei_cont.48814
bnei_else.48813:
	flw	%f0, 450(%zero)
bnei_cont.48814:
bnei_cont.48810:
	fsw	%f0, 146(%zero)
bnei_cont.48642:
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	beqi	%v0, 0, bnei_else.48815
	j	bnei_cont.48526
bnei_else.48815:
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
	fblt	%f1, %f0, fbgt_else.48817
	addi	%v0, %zero, 0
	j	fbgt_cont.48818
fbgt_else.48817:
	addi	%v0, %zero, 1
fbgt_cont.48818:
	beqi	%v0, 0, bnei_else.48819
	j	bnei_cont.48820
bnei_else.48819:
	fmov	%f0, %f1
bnei_cont.48820:
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
bnei_cont.48816:
	j	bnei_cont.48526
bnei_else.48619:
bnei_cont.48620:
	j	bnei_cont.48526
bnei_else.48525:
	flw	%f5, 439(%zero)
	fdiv	%f0, %f0, %f5
	flw	%f5, 465(%zero)
	fsw	%f5, 137(%zero)
	lw	%t0, 134(%zero)
	lw	%t2, 0(%t0)
	lw	%t3, 0(%t2)
	fsw	%f0, 22(%sp)
	sw	%t0, 23(%sp)
	sw	%a3, 24(%sp)
	beqi	%t3, -1, bnei_else.48821
	sw	%t1, 12(%sp)
	beqi	%t3, 99, bnei_else.48823
	lw	%t4, 12(%t3)
	lw	%t5, 10(%t4)
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)
	flw	%f7, 2(%t5)
	lw	%t6, 1(%a3)
	add	%at, %t6, %t3
	lw	%t3, 0(%at)
	lw	%t6, 1(%t4)
	beqi	%t6, 1, bnei_else.48825
	beqi	%t6, 2, bnei_else.48827
	flw	%f8, 0(%t3)
	fbne	%f8, %f2, fbeq_else.48829
	addi	%t6, %zero, 1
	j	fbeq_cont.48830
fbeq_else.48829:
	addi	%t6, %zero, 0
fbeq_cont.48830:
	beqi	%t6, 0, bnei_else.48831
	addi	%t3, %zero, 0
	j	bnei_cont.48826
bnei_else.48831:
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
	fblt	%f2, %f6, fbgt_else.48833
	addi	%t5, %zero, 0
	j	fbgt_cont.48834
fbgt_else.48833:
	addi	%t5, %zero, 1
fbgt_cont.48834:
	beqi	%t5, 0, bnei_else.48835
	lw	%t4, 6(%t4)
	beqi	%t4, 0, bnei_else.48837
	fsqrt	%f6, %f6
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	j	bnei_cont.48838
bnei_else.48837:
	fsqrt	%f6, %f6
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
bnei_cont.48838:
	addi	%t3, %zero, 1
	j	bnei_cont.48836
bnei_else.48835:
	addi	%t3, %zero, 0
bnei_cont.48836:
bnei_cont.48832:
	j	bnei_cont.48826
bnei_else.48827:
	flw	%f5, 0(%t3)
	fblt	%f5, %f2, fbgt_else.48839
	addi	%t3, %zero, 0
	j	fbgt_cont.48840
fbgt_else.48839:
	addi	%t3, %zero, 1
fbgt_cont.48840:
	beqi	%t3, 0, bnei_else.48841
	flw	%f6, 3(%t5)
	fmul	%f5, %f5, %f6
	fsw	%f5, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.48842
bnei_else.48841:
	addi	%t3, %zero, 0
bnei_cont.48842:
bnei_cont.48828:
	j	bnei_cont.48826
bnei_else.48825:
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
	fblt	%f11, %f12, fbgt_else.48843
	addi	%t6, %zero, 0
	j	fbgt_cont.48844
fbgt_else.48843:
	addi	%t6, %zero, 1
fbgt_cont.48844:
	beqi	%t6, 0, bnei_else.48845
	flw	%f11, 2(%t5)
	fmul	%f11, %f8, %f11
	fadd	%f11, %f11, %f7
	fabs	%f11, %f11
	lw	%t6, 4(%t4)
	flw	%f13, 2(%t6)
	fblt	%f11, %f13, fbgt_else.48847
	addi	%t6, %zero, 0
	j	fbgt_cont.48848
fbgt_else.48847:
	addi	%t6, %zero, 1
fbgt_cont.48848:
	beqi	%t6, 0, bnei_else.48849
	fbne	%f9, %f2, fbeq_else.48851
	addi	%t6, %zero, 1
	j	fbeq_cont.48852
fbeq_else.48851:
	addi	%t6, %zero, 0
fbeq_cont.48852:
	beqi	%t6, 0, bnei_else.48853
	addi	%t6, %zero, 0
	j	bnei_cont.48846
bnei_else.48853:
	addi	%t6, %zero, 1
bnei_cont.48854:
	j	bnei_cont.48846
bnei_else.48849:
	addi	%t6, %zero, 0
bnei_cont.48850:
	j	bnei_cont.48846
bnei_else.48845:
	addi	%t6, %zero, 0
bnei_cont.48846:
	beqi	%t6, 0, bnei_else.48855
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 1
	j	bnei_cont.48856
bnei_else.48855:
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
	fblt	%f13, %f14, fbgt_else.48857
	addi	%t6, %zero, 0
	j	fbgt_cont.48858
fbgt_else.48857:
	addi	%t6, %zero, 1
fbgt_cont.48858:
	beqi	%t6, 0, bnei_else.48859
	flw	%f13, 2(%t5)
	fmul	%f13, %f8, %f13
	fadd	%f13, %f13, %f7
	fabs	%f13, %f13
	lw	%t4, 4(%t4)
	flw	%f15, 2(%t4)
	fblt	%f13, %f15, fbgt_else.48861
	addi	%t4, %zero, 0
	j	fbgt_cont.48862
fbgt_else.48861:
	addi	%t4, %zero, 1
fbgt_cont.48862:
	beqi	%t4, 0, bnei_else.48863
	fbne	%f9, %f2, fbeq_else.48865
	addi	%t4, %zero, 1
	j	fbeq_cont.48866
fbeq_else.48865:
	addi	%t4, %zero, 0
fbeq_cont.48866:
	beqi	%t4, 0, bnei_else.48867
	addi	%t4, %zero, 0
	j	bnei_cont.48860
bnei_else.48867:
	addi	%t4, %zero, 1
bnei_cont.48868:
	j	bnei_cont.48860
bnei_else.48863:
	addi	%t4, %zero, 0
bnei_cont.48864:
	j	bnei_cont.48860
bnei_else.48859:
	addi	%t4, %zero, 0
bnei_cont.48860:
	beqi	%t4, 0, bnei_else.48869
	fsw	%f8, 135(%zero)
	addi	%t3, %zero, 2
	j	bnei_cont.48870
bnei_else.48869:
	flw	%f8, 4(%t3)
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)
	fmul	%f7, %f7, %f8
	fmul	%f9, %f7, %f11
	fadd	%f5, %f9, %f5
	fabs	%f5, %f5
	fblt	%f5, %f14, fbgt_else.48871
	addi	%t3, %zero, 0
	j	fbgt_cont.48872
fbgt_else.48871:
	addi	%t3, %zero, 1
fbgt_cont.48872:
	beqi	%t3, 0, bnei_else.48873
	fmul	%f5, %f7, %f10
	fadd	%f5, %f5, %f6
	fabs	%f5, %f5
	fblt	%f5, %f12, fbgt_else.48875
	addi	%t3, %zero, 0
	j	fbgt_cont.48876
fbgt_else.48875:
	addi	%t3, %zero, 1
fbgt_cont.48876:
	beqi	%t3, 0, bnei_else.48877
	fbne	%f8, %f2, fbeq_else.48879
	addi	%t3, %zero, 1
	j	fbeq_cont.48880
fbeq_else.48879:
	addi	%t3, %zero, 0
fbeq_cont.48880:
	beqi	%t3, 0, bnei_else.48881
	addi	%t3, %zero, 0
	j	bnei_cont.48874
bnei_else.48881:
	addi	%t3, %zero, 1
bnei_cont.48882:
	j	bnei_cont.48874
bnei_else.48877:
	addi	%t3, %zero, 0
bnei_cont.48878:
	j	bnei_cont.48874
bnei_else.48873:
	addi	%t3, %zero, 0
bnei_cont.48874:
	beqi	%t3, 0, bnei_else.48883
	fsw	%f7, 135(%zero)
	addi	%t3, %zero, 3
	j	bnei_cont.48884
bnei_else.48883:
	addi	%t3, %zero, 0
bnei_cont.48884:
bnei_cont.48870:
bnei_cont.48856:
bnei_cont.48826:
	beqi	%t3, 0, bnei_else.48885
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	fblt	%f5, %f6, fbgt_else.48887
	addi	%t3, %zero, 0
	j	fbgt_cont.48888
fbgt_else.48887:
	addi	%t3, %zero, 1
fbgt_cont.48888:
	beqi	%t3, 0, bnei_else.48889
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.48891
	lw	%t3, 83(%t3)
	sw	%t2, 25(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.48893
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.48895
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.48897
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 25(%sp)
	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bnei_cont.48824
bnei_else.48897:
bnei_cont.48898:
	j	bnei_cont.48824
bnei_else.48895:
bnei_cont.48896:
	j	bnei_cont.48824
bnei_else.48893:
bnei_cont.48894:
	j	bnei_cont.48824
bnei_else.48891:
bnei_cont.48892:
	j	bnei_cont.48824
bnei_else.48889:
bnei_cont.48890:
	j	bnei_cont.48824
bnei_else.48885:
bnei_cont.48886:
	j	bnei_cont.48824
bnei_else.48823:
	lw	%t3, 1(%t2)
	beqi	%t3, -1, bnei_else.48899
	lw	%t3, 83(%t3)
	sw	%t2, 25(%sp)
	addi	%a0, %a3, 0
	addi	%v1, %t3, 0
	addi	%v0, %a2, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 2(%v0)
	beqi	%v1, -1, bnei_else.48901
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 3(%v0)
	beqi	%v1, -1, bnei_else.48903
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	lw	%v1, 4(%v0)
	beqi	%v1, -1, bnei_else.48905
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_each_element_fast.2936
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	addi	%v0, %zero, 5
	lw	%v1, 25(%sp)
	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	solve_one_or_network_fast.2940
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bnei_cont.48900
bnei_else.48905:
bnei_cont.48906:
	j	bnei_cont.48900
bnei_else.48903:
bnei_cont.48904:
	j	bnei_cont.48900
bnei_else.48901:
bnei_cont.48902:
	j	bnei_cont.48900
bnei_else.48899:
bnei_cont.48900:
bnei_cont.48824:
	lw	%v0, 12(%sp)
	lw	%v1, 23(%sp)
	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bnei_cont.48822
bnei_else.48821:
bnei_cont.48822:
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.48907
	addi	%v0, %zero, 0
	j	fbgt_cont.48908
fbgt_else.48907:
	addi	%v0, %zero, 1
fbgt_cont.48908:
	beqi	%v0, 0, bnei_else.48909
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.48911
	addi	%v0, %zero, 0
	j	bnei_cont.48910
fbgt_else.48911:
	addi	%v0, %zero, 1
fbgt_cont.48912:
	j	bnei_cont.48910
bnei_else.48909:
	addi	%v0, %zero, 0
bnei_cont.48910:
	beqi	%v0, 0, bnei_else.48913
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 24(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.48915
	beqi	%a0, 2, bnei_else.48917
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
	beqi	%v1, 0, bnei_else.48919
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f7, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f8, 1(%v1)
	fmul	%f9, %f2, %f8
	fadd	%f7, %f7, %f9
	flw	%f9, 471(%zero)
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
	j	bnei_cont.48920
bnei_else.48919:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.48920:
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
	fbne	%f1, %f4, fbeq_else.48921
	addi	%a0, %zero, 1
	j	fbeq_cont.48922
fbeq_else.48921:
	addi	%a0, %zero, 0
fbeq_cont.48922:
	beqi	%a0, 0, bnei_else.48923
	flw	%f1, 491(%zero)
	j	bnei_cont.48924
bnei_else.48923:
	beqi	%v1, 0, bnei_else.48925
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.48926
bnei_else.48925:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.48926:
bnei_cont.48924:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.48916
bnei_else.48917:
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
bnei_cont.48918:
	j	bnei_cont.48916
bnei_else.48915:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.48927
	addi	%v1, %zero, 1
	j	fbeq_cont.48928
fbeq_else.48927:
	addi	%v1, %zero, 0
fbeq_cont.48928:
	beqi	%v1, 0, bnei_else.48929
	fmov	%f1, %f0
	j	bnei_cont.48930
bnei_else.48929:
	fblt	%f0, %f1, fbgt_else.48931
	addi	%v1, %zero, 0
	j	fbgt_cont.48932
fbgt_else.48931:
	addi	%v1, %zero, 1
fbgt_cont.48932:
	beqi	%v1, 0, bnei_else.48933
	flw	%f1, 491(%zero)
	j	bnei_cont.48934
bnei_else.48933:
	flw	%f1, 490(%zero)
bnei_cont.48934:
bnei_cont.48930:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.48916:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 26(%sp)
	beqi	%v1, 1, bnei_else.48935
	beqi	%v1, 2, bnei_else.48937
	beqi	%v1, 3, bnei_else.48939
	beqi	%v1, 4, bnei_else.48941
	j	bnei_cont.48936
bnei_else.48941:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.48943
	addi	%v1, %zero, 0
	j	fbgt_cont.48944
fbgt_else.48943:
	addi	%v1, %zero, 1
fbgt_cont.48944:
	beqi	%v1, 0, bnei_else.48945
	flw	%f0, 462(%zero)
	j	bnei_cont.48946
bnei_else.48945:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.48947
	addi	%v1, %zero, 1
	j	fbgt_cont.48948
fbgt_else.48947:
	addi	%v1, %zero, 0
fbgt_cont.48948:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.48949
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.48951
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.48952
fbgt_else.48951:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.48952:
	beqi	%v1, 0, bnei_else.48953
	j	fbgt_cont.48950
bnei_else.48953:
	fneg	%f0, %f0
bnei_cont.48954:
	j	fbgt_cont.48950
fbgt_else.48949:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.48950:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.48946:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.48955
	addi	%v1, %zero, 0
	j	fbgt_cont.48956
fbgt_else.48955:
	addi	%v1, %zero, 1
fbgt_cont.48956:
	beqi	%v1, 0, bnei_else.48957
	flw	%f1, 462(%zero)
	j	bnei_cont.48958
bnei_else.48957:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.48959
	addi	%v1, %zero, 1
	j	fbgt_cont.48960
fbgt_else.48959:
	addi	%v1, %zero, 0
fbgt_cont.48960:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.48961
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.48963
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.48964
fbgt_else.48963:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.48964:
	beqi	%v1, 0, bnei_else.48965
	j	fbgt_cont.48962
bnei_else.48965:
	fneg	%f1, %f1
bnei_cont.48966:
	j	fbgt_cont.48962
fbgt_else.48961:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.48962:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.48958:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.48967
	addi	%v1, %zero, 0
	j	fbgt_cont.48968
fbgt_else.48967:
	addi	%v1, %zero, 1
fbgt_cont.48968:
	beqi	%v1, 0, bnei_else.48969
	fmov	%f0, %f1
	j	bnei_cont.48970
bnei_else.48969:
bnei_cont.48970:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.48942:
	j	bnei_cont.48936
bnei_else.48939:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 27(%sp)
	fsw	%f0, 28(%sp)
	fsw	%f2, 29(%sp)
	fblt	%f0, %f2, fbgt_else.48971
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.48973
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.48975
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.48977
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.48979
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.48981
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.48983
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.48985
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.48987
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.48989
	flw	%f3, 478(%zero)
	fblt	%f0, %f3, fbgt_else.48991
	flw	%f3, 477(%zero)
	fmov	%f1, %f3
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.48972
fbgt_else.48991:
	fmov	%f0, %f3
fbgt_cont.48992:
	j	fbgt_cont.48972
fbgt_else.48989:
	fmov	%f0, %f3
fbgt_cont.48990:
	j	fbgt_cont.48972
fbgt_else.48987:
	fmov	%f0, %f3
fbgt_cont.48988:
	j	fbgt_cont.48972
fbgt_else.48985:
	fmov	%f0, %f3
fbgt_cont.48986:
	j	fbgt_cont.48972
fbgt_else.48983:
	fmov	%f0, %f3
fbgt_cont.48984:
	j	fbgt_cont.48972
fbgt_else.48981:
	fmov	%f0, %f3
fbgt_cont.48982:
	j	fbgt_cont.48972
fbgt_else.48979:
	fmov	%f0, %f3
fbgt_cont.48980:
	j	fbgt_cont.48972
fbgt_else.48977:
	fmov	%f0, %f3
fbgt_cont.48978:
	j	fbgt_cont.48972
fbgt_else.48975:
	fmov	%f0, %f3
fbgt_cont.48976:
	j	fbgt_cont.48972
fbgt_else.48973:
	fmov	%f0, %f3
fbgt_cont.48974:
	j	fbgt_cont.48972
fbgt_else.48971:
	fmov	%f0, %f2
fbgt_cont.48972:
	flw	%f1, 28(%sp)
	flw	%f2, 29(%sp)
	fblt	%f1, %f2, fbgt_else.48993
	fblt	%f1, %f0, fbgt_else.48995
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.48997
	fblt	%f1, %f0, fbgt_else.48999
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49001
	fblt	%f1, %f0, fbgt_else.49003
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.48994
fbgt_else.49003:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.49004:
	j	fbgt_cont.48994
fbgt_else.49001:
	fmov	%f0, %f1
fbgt_cont.49002:
	j	fbgt_cont.48994
fbgt_else.48999:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49005
	fblt	%f1, %f0, fbgt_else.49007
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.49006
fbgt_else.49007:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.49008:
	j	fbgt_cont.49006
fbgt_else.49005:
	fmov	%f0, %f1
fbgt_cont.49006:
fbgt_cont.49000:
	j	fbgt_cont.48994
fbgt_else.48997:
	fmov	%f0, %f1
fbgt_cont.48998:
	j	fbgt_cont.48994
fbgt_else.48995:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49009
	fblt	%f1, %f0, fbgt_else.49011
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49013
	fblt	%f1, %f0, fbgt_else.49015
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.49010
fbgt_else.49015:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.49016:
	j	fbgt_cont.49010
fbgt_else.49013:
	fmov	%f0, %f1
fbgt_cont.49014:
	j	fbgt_cont.49010
fbgt_else.49011:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49017
	fblt	%f1, %f0, fbgt_else.49019
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	fbgt_cont.49018
fbgt_else.49019:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
fbgt_cont.49020:
	j	fbgt_cont.49018
fbgt_else.49017:
	fmov	%f0, %f1
fbgt_cont.49018:
fbgt_cont.49012:
	j	fbgt_cont.49010
fbgt_else.49009:
	fmov	%f0, %f1
fbgt_cont.49010:
fbgt_cont.48996:
	j	fbgt_cont.48994
fbgt_else.48993:
	fmov	%f0, %f1
fbgt_cont.48994:
	flw	%f1, 27(%sp)
	fblt	%f0, %f1, fbgt_else.49021
	addi	%v0, %zero, 0
	j	fbgt_cont.49022
fbgt_else.49021:
	addi	%v0, %zero, 1
fbgt_cont.49022:
	fblt	%f0, %f1, fbgt_else.49023
	fsub	%f0, %f0, %f1
	j	fbgt_cont.49024
fbgt_else.49023:
fbgt_cont.49024:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.49025
	beqi	%v0, 0, bnei_else.49027
	addi	%v0, %zero, 0
	j	fbgt_cont.49026
bnei_else.49027:
	addi	%v0, %zero, 1
bnei_cont.49028:
	j	fbgt_cont.49026
fbgt_else.49025:
fbgt_cont.49026:
	fblt	%f0, %f2, fbgt_else.49029
	fsub	%f0, %f1, %f0
	j	fbgt_cont.49030
fbgt_else.49029:
fbgt_cont.49030:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.49031
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.49032
fbgt_else.49031:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.49032:
	beqi	%v0, 0, bnei_else.49033
	j	bnei_cont.49034
bnei_else.49033:
	fneg	%f0, %f0
bnei_cont.49034:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.48940:
	j	bnei_cont.48936
bnei_else.48937:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.49035
	addi	%v1, %zero, 1
	j	fbgt_cont.49036
fbgt_else.49035:
	addi	%v1, %zero, 0
fbgt_cont.49036:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 30(%sp)
	fsw	%f1, 31(%sp)
	fsw	%f0, 32(%sp)
	fsw	%f3, 33(%sp)
	fblt	%f0, %f3, fbgt_else.49037
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.49039
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.49041
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.49043
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.49045
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.49047
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.49049
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.49051
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.49053
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.49055
	flw	%f4, 478(%zero)
	fblt	%f0, %f4, fbgt_else.49057
	flw	%f4, 477(%zero)
	fmov	%f1, %f4
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.49038
fbgt_else.49057:
	fmov	%f0, %f4
fbgt_cont.49058:
	j	fbgt_cont.49038
fbgt_else.49055:
	fmov	%f0, %f4
fbgt_cont.49056:
	j	fbgt_cont.49038
fbgt_else.49053:
	fmov	%f0, %f4
fbgt_cont.49054:
	j	fbgt_cont.49038
fbgt_else.49051:
	fmov	%f0, %f4
fbgt_cont.49052:
	j	fbgt_cont.49038
fbgt_else.49049:
	fmov	%f0, %f4
fbgt_cont.49050:
	j	fbgt_cont.49038
fbgt_else.49047:
	fmov	%f0, %f4
fbgt_cont.49048:
	j	fbgt_cont.49038
fbgt_else.49045:
	fmov	%f0, %f4
fbgt_cont.49046:
	j	fbgt_cont.49038
fbgt_else.49043:
	fmov	%f0, %f4
fbgt_cont.49044:
	j	fbgt_cont.49038
fbgt_else.49041:
	fmov	%f0, %f4
fbgt_cont.49042:
	j	fbgt_cont.49038
fbgt_else.49039:
	fmov	%f0, %f4
fbgt_cont.49040:
	j	fbgt_cont.49038
fbgt_else.49037:
	fmov	%f0, %f3
fbgt_cont.49038:
	flw	%f1, 32(%sp)
	flw	%f2, 33(%sp)
	fblt	%f1, %f2, fbgt_else.49059
	fblt	%f1, %f0, fbgt_else.49061
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49063
	fblt	%f1, %f0, fbgt_else.49065
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49067
	fblt	%f1, %f0, fbgt_else.49069
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.49060
fbgt_else.49069:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.49070:
	j	fbgt_cont.49060
fbgt_else.49067:
	fmov	%f0, %f1
fbgt_cont.49068:
	j	fbgt_cont.49060
fbgt_else.49065:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49071
	fblt	%f1, %f0, fbgt_else.49073
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.49072
fbgt_else.49073:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.49074:
	j	fbgt_cont.49072
fbgt_else.49071:
	fmov	%f0, %f1
fbgt_cont.49072:
fbgt_cont.49066:
	j	fbgt_cont.49060
fbgt_else.49063:
	fmov	%f0, %f1
fbgt_cont.49064:
	j	fbgt_cont.49060
fbgt_else.49061:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49075
	fblt	%f1, %f0, fbgt_else.49077
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49079
	fblt	%f1, %f0, fbgt_else.49081
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.49076
fbgt_else.49081:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.49082:
	j	fbgt_cont.49076
fbgt_else.49079:
	fmov	%f0, %f1
fbgt_cont.49080:
	j	fbgt_cont.49076
fbgt_else.49077:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49083
	fblt	%f1, %f0, fbgt_else.49085
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	fbgt_cont.49084
fbgt_else.49085:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
fbgt_cont.49086:
	j	fbgt_cont.49084
fbgt_else.49083:
	fmov	%f0, %f1
fbgt_cont.49084:
fbgt_cont.49078:
	j	fbgt_cont.49076
fbgt_else.49075:
	fmov	%f0, %f1
fbgt_cont.49076:
fbgt_cont.49062:
	j	fbgt_cont.49060
fbgt_else.49059:
	fmov	%f0, %f1
fbgt_cont.49060:
	flw	%f1, 31(%sp)
	fblt	%f0, %f1, fbgt_else.49087
	lw	%v0, 30(%sp)
	beqi	%v0, 0, bnei_else.49089
	addi	%v0, %zero, 0
	j	fbgt_cont.49088
bnei_else.49089:
	addi	%v0, %zero, 1
bnei_cont.49090:
	j	fbgt_cont.49088
fbgt_else.49087:
	lw	%v0, 30(%sp)
fbgt_cont.49088:
	fblt	%f0, %f1, fbgt_else.49091
	fsub	%f0, %f0, %f1
	j	fbgt_cont.49092
fbgt_else.49091:
fbgt_cont.49092:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.49093
	fsub	%f0, %f1, %f0
	j	fbgt_cont.49094
fbgt_else.49093:
fbgt_cont.49094:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.49095
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.49096
fbgt_else.49095:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.49096:
	beqi	%v0, 0, bnei_else.49097
	j	bnei_cont.49098
bnei_else.49097:
	fneg	%f0, %f0
bnei_cont.49098:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.48938:
	j	bnei_cont.48936
bnei_else.48935:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.49099
	addi	%v1, %zero, 0
	j	fbgt_cont.49100
fbgt_else.49099:
	addi	%v1, %zero, 1
fbgt_cont.49100:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.49101
	addi	%a0, %zero, 0
	j	fbgt_cont.49102
fbgt_else.49101:
	addi	%a0, %zero, 1
fbgt_cont.49102:
	beqi	%v1, 0, bnei_else.49103
	beqi	%a0, 0, bnei_else.49105
	flw	%f0, 450(%zero)
	j	bnei_cont.49104
bnei_else.49105:
	flw	%f0, 3(%sp)
bnei_cont.49106:
	j	bnei_cont.49104
bnei_else.49103:
	beqi	%a0, 0, bnei_else.49107
	flw	%f0, 3(%sp)
	j	bnei_cont.49108
bnei_else.49107:
	flw	%f0, 450(%zero)
bnei_cont.49108:
bnei_cont.49104:
	fsw	%f0, 146(%zero)
bnei_cont.48936:
	lw	%v0, 2(%sp)
	lw	%v1, 23(%sp)
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	beqi	%v0, 0, bnei_else.49109
	j	bnei_cont.48914
bnei_else.49109:
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
	fblt	%f1, %f0, fbgt_else.49111
	addi	%v0, %zero, 0
	j	fbgt_cont.49112
fbgt_else.49111:
	addi	%v0, %zero, 1
fbgt_cont.49112:
	beqi	%v0, 0, bnei_else.49113
	j	bnei_cont.49114
bnei_else.49113:
	fmov	%f0, %f1
bnei_cont.49114:
	flw	%f2, 22(%sp)
	fmul	%f0, %f2, %f0
	lw	%v0, 26(%sp)
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
bnei_cont.49110:
	j	bnei_cont.48914
bnei_else.48913:
bnei_cont.48914:
bnei_cont.48526:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, -2
	blti	%v0, 0, bgti_else.49115
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
	fblt	%f0, %f1, fbgt_else.49116
	addi	%a1, %zero, 0
	j	fbgt_cont.49117
fbgt_else.49116:
	addi	%a1, %zero, 1
fbgt_cont.49117:
	sw	%v0, 34(%sp)
	beqi	%a1, 0, bnei_else.49118
	addi	%a0, %v0, 1
	add	%at, %v1, %a0
	lw	%a0, 0(%at)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%a1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 35(%sp)
	sw	%a1, 36(%sp)
	sw	%a0, 37(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.49120
	addi	%v0, %zero, 0
	j	fbgt_cont.49121
fbgt_else.49120:
	addi	%v0, %zero, 1
fbgt_cont.49121:
	beqi	%v0, 0, bnei_else.49122
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.49124
	addi	%v0, %zero, 0
	j	bnei_cont.49123
fbgt_else.49124:
	addi	%v0, %zero, 1
fbgt_cont.49125:
	j	bnei_cont.49123
bnei_else.49122:
	addi	%v0, %zero, 0
bnei_cont.49123:
	beqi	%v0, 0, bnei_else.49126
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 37(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.49128
	beqi	%a0, 2, bnei_else.49130
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
	beqi	%v1, 0, bnei_else.49132
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
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
	j	bnei_cont.49133
bnei_else.49132:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.49133:
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
	fbne	%f1, %f4, fbeq_else.49134
	addi	%a0, %zero, 1
	j	fbeq_cont.49135
fbeq_else.49134:
	addi	%a0, %zero, 0
fbeq_cont.49135:
	beqi	%a0, 0, bnei_else.49136
	flw	%f1, 491(%zero)
	j	bnei_cont.49137
bnei_else.49136:
	beqi	%v1, 0, bnei_else.49138
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.49139
bnei_else.49138:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.49139:
bnei_cont.49137:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.49129
bnei_else.49130:
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
bnei_cont.49131:
	j	bnei_cont.49129
bnei_else.49128:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.49140
	addi	%v1, %zero, 1
	j	fbeq_cont.49141
fbeq_else.49140:
	addi	%v1, %zero, 0
fbeq_cont.49141:
	beqi	%v1, 0, bnei_else.49142
	fmov	%f1, %f0
	j	bnei_cont.49143
bnei_else.49142:
	fblt	%f0, %f1, fbgt_else.49144
	addi	%v1, %zero, 0
	j	fbgt_cont.49145
fbgt_else.49144:
	addi	%v1, %zero, 1
fbgt_cont.49145:
	beqi	%v1, 0, bnei_else.49146
	flw	%f1, 491(%zero)
	j	bnei_cont.49147
bnei_else.49146:
	flw	%f1, 490(%zero)
bnei_cont.49147:
bnei_cont.49143:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.49129:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 38(%sp)
	beqi	%v1, 1, bnei_else.49148
	beqi	%v1, 2, bnei_else.49150
	beqi	%v1, 3, bnei_else.49152
	beqi	%v1, 4, bnei_else.49154
	j	bnei_cont.49149
bnei_else.49154:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.49156
	addi	%v1, %zero, 0
	j	fbgt_cont.49157
fbgt_else.49156:
	addi	%v1, %zero, 1
fbgt_cont.49157:
	beqi	%v1, 0, bnei_else.49158
	flw	%f0, 462(%zero)
	j	bnei_cont.49159
bnei_else.49158:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.49160
	addi	%v1, %zero, 1
	j	fbgt_cont.49161
fbgt_else.49160:
	addi	%v1, %zero, 0
fbgt_cont.49161:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.49162
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.49164
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.49165
fbgt_else.49164:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.49165:
	beqi	%v1, 0, bnei_else.49166
	j	fbgt_cont.49163
bnei_else.49166:
	fneg	%f0, %f0
bnei_cont.49167:
	j	fbgt_cont.49163
fbgt_else.49162:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.49163:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.49159:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.49168
	addi	%v1, %zero, 0
	j	fbgt_cont.49169
fbgt_else.49168:
	addi	%v1, %zero, 1
fbgt_cont.49169:
	beqi	%v1, 0, bnei_else.49170
	flw	%f1, 462(%zero)
	j	bnei_cont.49171
bnei_else.49170:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.49172
	addi	%v1, %zero, 1
	j	fbgt_cont.49173
fbgt_else.49172:
	addi	%v1, %zero, 0
fbgt_cont.49173:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.49174
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.49176
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.49177
fbgt_else.49176:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.49177:
	beqi	%v1, 0, bnei_else.49178
	j	fbgt_cont.49175
bnei_else.49178:
	fneg	%f1, %f1
bnei_cont.49179:
	j	fbgt_cont.49175
fbgt_else.49174:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.49175:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.49171:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.49180
	addi	%v1, %zero, 0
	j	fbgt_cont.49181
fbgt_else.49180:
	addi	%v1, %zero, 1
fbgt_cont.49181:
	beqi	%v1, 0, bnei_else.49182
	fmov	%f0, %f1
	j	bnei_cont.49183
bnei_else.49182:
bnei_cont.49183:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.49155:
	j	bnei_cont.49149
bnei_else.49152:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 39(%sp)
	fsw	%f0, 40(%sp)
	fsw	%f2, 41(%sp)
	fblt	%f0, %f2, fbgt_else.49184
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.49186
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.49188
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.49190
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.49192
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.49194
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.49196
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.49198
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.49200
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.49202
	flw	%f3, 478(%zero)
	fmov	%f1, %f3
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	fbgt_cont.49185
fbgt_else.49202:
	fmov	%f0, %f3
fbgt_cont.49203:
	j	fbgt_cont.49185
fbgt_else.49200:
	fmov	%f0, %f3
fbgt_cont.49201:
	j	fbgt_cont.49185
fbgt_else.49198:
	fmov	%f0, %f3
fbgt_cont.49199:
	j	fbgt_cont.49185
fbgt_else.49196:
	fmov	%f0, %f3
fbgt_cont.49197:
	j	fbgt_cont.49185
fbgt_else.49194:
	fmov	%f0, %f3
fbgt_cont.49195:
	j	fbgt_cont.49185
fbgt_else.49192:
	fmov	%f0, %f3
fbgt_cont.49193:
	j	fbgt_cont.49185
fbgt_else.49190:
	fmov	%f0, %f3
fbgt_cont.49191:
	j	fbgt_cont.49185
fbgt_else.49188:
	fmov	%f0, %f3
fbgt_cont.49189:
	j	fbgt_cont.49185
fbgt_else.49186:
	fmov	%f0, %f3
fbgt_cont.49187:
	j	fbgt_cont.49185
fbgt_else.49184:
	fmov	%f0, %f2
fbgt_cont.49185:
	flw	%f1, 40(%sp)
	flw	%f2, 41(%sp)
	fblt	%f1, %f2, fbgt_else.49204
	fblt	%f1, %f0, fbgt_else.49206
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49208
	fblt	%f1, %f0, fbgt_else.49210
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	fbgt_cont.49205
fbgt_else.49210:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
fbgt_cont.49211:
	j	fbgt_cont.49205
fbgt_else.49208:
	fmov	%f0, %f1
fbgt_cont.49209:
	j	fbgt_cont.49205
fbgt_else.49206:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49212
	fblt	%f1, %f0, fbgt_else.49214
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	fbgt_cont.49213
fbgt_else.49214:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
fbgt_cont.49215:
	j	fbgt_cont.49213
fbgt_else.49212:
	fmov	%f0, %f1
fbgt_cont.49213:
fbgt_cont.49207:
	j	fbgt_cont.49205
fbgt_else.49204:
	fmov	%f0, %f1
fbgt_cont.49205:
	flw	%f1, 39(%sp)
	fblt	%f0, %f1, fbgt_else.49216
	addi	%v0, %zero, 0
	j	fbgt_cont.49217
fbgt_else.49216:
	addi	%v0, %zero, 1
fbgt_cont.49217:
	fblt	%f0, %f1, fbgt_else.49218
	fsub	%f0, %f0, %f1
	j	fbgt_cont.49219
fbgt_else.49218:
fbgt_cont.49219:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.49220
	beqi	%v0, 0, bnei_else.49222
	addi	%v0, %zero, 0
	j	fbgt_cont.49221
bnei_else.49222:
	addi	%v0, %zero, 1
bnei_cont.49223:
	j	fbgt_cont.49221
fbgt_else.49220:
fbgt_cont.49221:
	fblt	%f0, %f2, fbgt_else.49224
	fsub	%f0, %f1, %f0
	j	fbgt_cont.49225
fbgt_else.49224:
fbgt_cont.49225:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.49226
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.49227
fbgt_else.49226:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.49227:
	beqi	%v0, 0, bnei_else.49228
	j	bnei_cont.49229
bnei_else.49228:
	fneg	%f0, %f0
bnei_cont.49229:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.49153:
	j	bnei_cont.49149
bnei_else.49150:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.49230
	addi	%v1, %zero, 1
	j	fbgt_cont.49231
fbgt_else.49230:
	addi	%v1, %zero, 0
fbgt_cont.49231:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 42(%sp)
	fsw	%f1, 43(%sp)
	fsw	%f0, 44(%sp)
	fsw	%f3, 45(%sp)
	fblt	%f0, %f3, fbgt_else.49232
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.49234
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.49236
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.49238
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.49240
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.49242
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.49244
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.49246
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.49248
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.49250
	flw	%f4, 478(%zero)
	fmov	%f1, %f4
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	fbgt_cont.49233
fbgt_else.49250:
	fmov	%f0, %f4
fbgt_cont.49251:
	j	fbgt_cont.49233
fbgt_else.49248:
	fmov	%f0, %f4
fbgt_cont.49249:
	j	fbgt_cont.49233
fbgt_else.49246:
	fmov	%f0, %f4
fbgt_cont.49247:
	j	fbgt_cont.49233
fbgt_else.49244:
	fmov	%f0, %f4
fbgt_cont.49245:
	j	fbgt_cont.49233
fbgt_else.49242:
	fmov	%f0, %f4
fbgt_cont.49243:
	j	fbgt_cont.49233
fbgt_else.49240:
	fmov	%f0, %f4
fbgt_cont.49241:
	j	fbgt_cont.49233
fbgt_else.49238:
	fmov	%f0, %f4
fbgt_cont.49239:
	j	fbgt_cont.49233
fbgt_else.49236:
	fmov	%f0, %f4
fbgt_cont.49237:
	j	fbgt_cont.49233
fbgt_else.49234:
	fmov	%f0, %f4
fbgt_cont.49235:
	j	fbgt_cont.49233
fbgt_else.49232:
	fmov	%f0, %f3
fbgt_cont.49233:
	flw	%f1, 44(%sp)
	flw	%f2, 45(%sp)
	fblt	%f1, %f2, fbgt_else.49252
	fblt	%f1, %f0, fbgt_else.49254
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49256
	fblt	%f1, %f0, fbgt_else.49258
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	fbgt_cont.49253
fbgt_else.49258:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
fbgt_cont.49259:
	j	fbgt_cont.49253
fbgt_else.49256:
	fmov	%f0, %f1
fbgt_cont.49257:
	j	fbgt_cont.49253
fbgt_else.49254:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49260
	fblt	%f1, %f0, fbgt_else.49262
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	fbgt_cont.49261
fbgt_else.49262:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
fbgt_cont.49263:
	j	fbgt_cont.49261
fbgt_else.49260:
	fmov	%f0, %f1
fbgt_cont.49261:
fbgt_cont.49255:
	j	fbgt_cont.49253
fbgt_else.49252:
	fmov	%f0, %f1
fbgt_cont.49253:
	flw	%f1, 43(%sp)
	fblt	%f0, %f1, fbgt_else.49264
	lw	%v0, 42(%sp)
	beqi	%v0, 0, bnei_else.49266
	addi	%v0, %zero, 0
	j	fbgt_cont.49265
bnei_else.49266:
	addi	%v0, %zero, 1
bnei_cont.49267:
	j	fbgt_cont.49265
fbgt_else.49264:
	lw	%v0, 42(%sp)
fbgt_cont.49265:
	fblt	%f0, %f1, fbgt_else.49268
	fsub	%f0, %f0, %f1
	j	fbgt_cont.49269
fbgt_else.49268:
fbgt_cont.49269:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.49270
	fsub	%f0, %f1, %f0
	j	fbgt_cont.49271
fbgt_else.49270:
fbgt_cont.49271:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.49272
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.49273
fbgt_else.49272:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.49273:
	beqi	%v0, 0, bnei_else.49274
	j	bnei_cont.49275
bnei_else.49274:
	fneg	%f0, %f0
bnei_cont.49275:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.49151:
	j	bnei_cont.49149
bnei_else.49148:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.49276
	addi	%v1, %zero, 0
	j	fbgt_cont.49277
fbgt_else.49276:
	addi	%v1, %zero, 1
fbgt_cont.49277:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.49278
	addi	%a0, %zero, 0
	j	fbgt_cont.49279
fbgt_else.49278:
	addi	%a0, %zero, 1
fbgt_cont.49279:
	beqi	%v1, 0, bnei_else.49280
	beqi	%a0, 0, bnei_else.49282
	flw	%f0, 450(%zero)
	j	bnei_cont.49281
bnei_else.49282:
	flw	%f0, 3(%sp)
bnei_cont.49283:
	j	bnei_cont.49281
bnei_else.49280:
	beqi	%a0, 0, bnei_else.49284
	flw	%f0, 3(%sp)
	j	bnei_cont.49285
bnei_else.49284:
	flw	%f0, 450(%zero)
bnei_cont.49285:
bnei_cont.49281:
	fsw	%f0, 146(%zero)
bnei_cont.49149:
	lw	%v0, 2(%sp)
	lw	%v1, 36(%sp)
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	beqi	%v0, 0, bnei_else.49286
	j	bnei_cont.49119
bnei_else.49286:
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
	fblt	%f1, %f0, fbgt_else.49288
	addi	%v0, %zero, 0
	j	fbgt_cont.49289
fbgt_else.49288:
	addi	%v0, %zero, 1
fbgt_cont.49289:
	beqi	%v0, 0, bnei_else.49290
	j	bnei_cont.49291
bnei_else.49290:
	fmov	%f0, %f1
bnei_cont.49291:
	flw	%f1, 35(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 38(%sp)
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
bnei_cont.49287:
	j	bnei_cont.49119
bnei_else.49126:
bnei_cont.49127:
	j	bnei_cont.49119
bnei_else.49118:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%a1, 134(%zero)
	lw	%a2, 2(%sp)
	fsw	%f0, 46(%sp)
	sw	%a1, 47(%sp)
	sw	%a0, 48(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0
	sw	%ra, 49(%sp)
	addi	%sp, %sp, 50
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -50
	lw	%ra, 49(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.49292
	addi	%v0, %zero, 0
	j	fbgt_cont.49293
fbgt_else.49292:
	addi	%v0, %zero, 1
fbgt_cont.49293:
	beqi	%v0, 0, bnei_else.49294
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.49296
	addi	%v0, %zero, 0
	j	bnei_cont.49295
fbgt_else.49296:
	addi	%v0, %zero, 1
fbgt_cont.49297:
	j	bnei_cont.49295
bnei_else.49294:
	addi	%v0, %zero, 0
bnei_cont.49295:
	beqi	%v0, 0, bnei_else.49298
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 48(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.49300
	beqi	%a0, 2, bnei_else.49302
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
	beqi	%v1, 0, bnei_else.49304
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
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
	j	bnei_cont.49305
bnei_else.49304:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.49305:
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
	fbne	%f1, %f4, fbeq_else.49306
	addi	%a0, %zero, 1
	j	fbeq_cont.49307
fbeq_else.49306:
	addi	%a0, %zero, 0
fbeq_cont.49307:
	beqi	%a0, 0, bnei_else.49308
	flw	%f1, 491(%zero)
	j	bnei_cont.49309
bnei_else.49308:
	beqi	%v1, 0, bnei_else.49310
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.49311
bnei_else.49310:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.49311:
bnei_cont.49309:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.49301
bnei_else.49302:
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
bnei_cont.49303:
	j	bnei_cont.49301
bnei_else.49300:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.49312
	addi	%v1, %zero, 1
	j	fbeq_cont.49313
fbeq_else.49312:
	addi	%v1, %zero, 0
fbeq_cont.49313:
	beqi	%v1, 0, bnei_else.49314
	fmov	%f1, %f0
	j	bnei_cont.49315
bnei_else.49314:
	fblt	%f0, %f1, fbgt_else.49316
	addi	%v1, %zero, 0
	j	fbgt_cont.49317
fbgt_else.49316:
	addi	%v1, %zero, 1
fbgt_cont.49317:
	beqi	%v1, 0, bnei_else.49318
	flw	%f1, 491(%zero)
	j	bnei_cont.49319
bnei_else.49318:
	flw	%f1, 490(%zero)
bnei_cont.49319:
bnei_cont.49315:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.49301:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 49(%sp)
	beqi	%v1, 1, bnei_else.49320
	beqi	%v1, 2, bnei_else.49322
	beqi	%v1, 3, bnei_else.49324
	beqi	%v1, 4, bnei_else.49326
	j	bnei_cont.49321
bnei_else.49326:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.49328
	addi	%v1, %zero, 0
	j	fbgt_cont.49329
fbgt_else.49328:
	addi	%v1, %zero, 1
fbgt_cont.49329:
	beqi	%v1, 0, bnei_else.49330
	flw	%f0, 462(%zero)
	j	bnei_cont.49331
bnei_else.49330:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.49332
	addi	%v1, %zero, 1
	j	fbgt_cont.49333
fbgt_else.49332:
	addi	%v1, %zero, 0
fbgt_cont.49333:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.49334
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.49336
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.49337
fbgt_else.49336:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.49337:
	beqi	%v1, 0, bnei_else.49338
	j	fbgt_cont.49335
bnei_else.49338:
	fneg	%f0, %f0
bnei_cont.49339:
	j	fbgt_cont.49335
fbgt_else.49334:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.49335:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.49331:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.49340
	addi	%v1, %zero, 0
	j	fbgt_cont.49341
fbgt_else.49340:
	addi	%v1, %zero, 1
fbgt_cont.49341:
	beqi	%v1, 0, bnei_else.49342
	flw	%f1, 462(%zero)
	j	bnei_cont.49343
bnei_else.49342:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 3(%sp)
	fblt	%f1, %f2, fbgt_else.49344
	addi	%v1, %zero, 1
	j	fbgt_cont.49345
fbgt_else.49344:
	addi	%v1, %zero, 0
fbgt_cont.49345:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.49346
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.49348
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.49349
fbgt_else.49348:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.49349:
	beqi	%v1, 0, bnei_else.49350
	j	fbgt_cont.49347
bnei_else.49350:
	fneg	%f1, %f1
bnei_cont.49351:
	j	fbgt_cont.49347
fbgt_else.49346:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.49347:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.49343:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)
	fblt	%f0, %f1, fbgt_else.49352
	addi	%v1, %zero, 0
	j	fbgt_cont.49353
fbgt_else.49352:
	addi	%v1, %zero, 1
fbgt_cont.49353:
	beqi	%v1, 0, bnei_else.49354
	fmov	%f0, %f1
	j	bnei_cont.49355
bnei_else.49354:
bnei_cont.49355:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.49327:
	j	bnei_cont.49321
bnei_else.49324:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 50(%sp)
	fsw	%f0, 51(%sp)
	fsw	%f2, 52(%sp)
	fblt	%f0, %f2, fbgt_else.49356
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.49358
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.49360
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.49362
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.49364
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.49366
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.49368
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.49370
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.49372
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.49374
	flw	%f3, 478(%zero)
	fmov	%f1, %f3
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	fbgt_cont.49357
fbgt_else.49374:
	fmov	%f0, %f3
fbgt_cont.49375:
	j	fbgt_cont.49357
fbgt_else.49372:
	fmov	%f0, %f3
fbgt_cont.49373:
	j	fbgt_cont.49357
fbgt_else.49370:
	fmov	%f0, %f3
fbgt_cont.49371:
	j	fbgt_cont.49357
fbgt_else.49368:
	fmov	%f0, %f3
fbgt_cont.49369:
	j	fbgt_cont.49357
fbgt_else.49366:
	fmov	%f0, %f3
fbgt_cont.49367:
	j	fbgt_cont.49357
fbgt_else.49364:
	fmov	%f0, %f3
fbgt_cont.49365:
	j	fbgt_cont.49357
fbgt_else.49362:
	fmov	%f0, %f3
fbgt_cont.49363:
	j	fbgt_cont.49357
fbgt_else.49360:
	fmov	%f0, %f3
fbgt_cont.49361:
	j	fbgt_cont.49357
fbgt_else.49358:
	fmov	%f0, %f3
fbgt_cont.49359:
	j	fbgt_cont.49357
fbgt_else.49356:
	fmov	%f0, %f2
fbgt_cont.49357:
	flw	%f1, 51(%sp)
	flw	%f2, 52(%sp)
	fblt	%f1, %f2, fbgt_else.49376
	fblt	%f1, %f0, fbgt_else.49378
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49380
	fblt	%f1, %f0, fbgt_else.49382
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	fbgt_cont.49377
fbgt_else.49382:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
fbgt_cont.49383:
	j	fbgt_cont.49377
fbgt_else.49380:
	fmov	%f0, %f1
fbgt_cont.49381:
	j	fbgt_cont.49377
fbgt_else.49378:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49384
	fblt	%f1, %f0, fbgt_else.49386
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
	j	fbgt_cont.49385
fbgt_else.49386:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 53(%sp)
	addi	%sp, %sp, 54
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -54
	lw	%ra, 53(%sp)
fbgt_cont.49387:
	j	fbgt_cont.49385
fbgt_else.49384:
	fmov	%f0, %f1
fbgt_cont.49385:
fbgt_cont.49379:
	j	fbgt_cont.49377
fbgt_else.49376:
	fmov	%f0, %f1
fbgt_cont.49377:
	flw	%f1, 50(%sp)
	fblt	%f0, %f1, fbgt_else.49388
	addi	%v0, %zero, 0
	j	fbgt_cont.49389
fbgt_else.49388:
	addi	%v0, %zero, 1
fbgt_cont.49389:
	fblt	%f0, %f1, fbgt_else.49390
	fsub	%f0, %f0, %f1
	j	fbgt_cont.49391
fbgt_else.49390:
fbgt_cont.49391:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.49392
	beqi	%v0, 0, bnei_else.49394
	addi	%v0, %zero, 0
	j	fbgt_cont.49393
bnei_else.49394:
	addi	%v0, %zero, 1
bnei_cont.49395:
	j	fbgt_cont.49393
fbgt_else.49392:
fbgt_cont.49393:
	fblt	%f0, %f2, fbgt_else.49396
	fsub	%f0, %f1, %f0
	j	fbgt_cont.49397
fbgt_else.49396:
fbgt_cont.49397:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.49398
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.49399
fbgt_else.49398:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.49399:
	beqi	%v0, 0, bnei_else.49400
	j	bnei_cont.49401
bnei_else.49400:
	fneg	%f0, %f0
bnei_cont.49401:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.49325:
	j	bnei_cont.49321
bnei_else.49322:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fblt	%f0, %f2, fbgt_else.49402
	addi	%v1, %zero, 1
	j	fbgt_cont.49403
fbgt_else.49402:
	addi	%v1, %zero, 0
fbgt_cont.49403:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 53(%sp)
	fsw	%f1, 54(%sp)
	fsw	%f0, 55(%sp)
	fsw	%f3, 56(%sp)
	fblt	%f0, %f3, fbgt_else.49404
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.49406
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.49408
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.49410
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.49412
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.49414
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.49416
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.49418
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.49420
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.49422
	flw	%f4, 478(%zero)
	fmov	%f1, %f4
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.49405
fbgt_else.49422:
	fmov	%f0, %f4
fbgt_cont.49423:
	j	fbgt_cont.49405
fbgt_else.49420:
	fmov	%f0, %f4
fbgt_cont.49421:
	j	fbgt_cont.49405
fbgt_else.49418:
	fmov	%f0, %f4
fbgt_cont.49419:
	j	fbgt_cont.49405
fbgt_else.49416:
	fmov	%f0, %f4
fbgt_cont.49417:
	j	fbgt_cont.49405
fbgt_else.49414:
	fmov	%f0, %f4
fbgt_cont.49415:
	j	fbgt_cont.49405
fbgt_else.49412:
	fmov	%f0, %f4
fbgt_cont.49413:
	j	fbgt_cont.49405
fbgt_else.49410:
	fmov	%f0, %f4
fbgt_cont.49411:
	j	fbgt_cont.49405
fbgt_else.49408:
	fmov	%f0, %f4
fbgt_cont.49409:
	j	fbgt_cont.49405
fbgt_else.49406:
	fmov	%f0, %f4
fbgt_cont.49407:
	j	fbgt_cont.49405
fbgt_else.49404:
	fmov	%f0, %f3
fbgt_cont.49405:
	flw	%f1, 55(%sp)
	flw	%f2, 56(%sp)
	fblt	%f1, %f2, fbgt_else.49424
	fblt	%f1, %f0, fbgt_else.49426
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49428
	fblt	%f1, %f0, fbgt_else.49430
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.49425
fbgt_else.49430:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
fbgt_cont.49431:
	j	fbgt_cont.49425
fbgt_else.49428:
	fmov	%f0, %f1
fbgt_cont.49429:
	j	fbgt_cont.49425
fbgt_else.49426:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49432
	fblt	%f1, %f0, fbgt_else.49434
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	j	fbgt_cont.49433
fbgt_else.49434:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
fbgt_cont.49435:
	j	fbgt_cont.49433
fbgt_else.49432:
	fmov	%f0, %f1
fbgt_cont.49433:
fbgt_cont.49427:
	j	fbgt_cont.49425
fbgt_else.49424:
	fmov	%f0, %f1
fbgt_cont.49425:
	flw	%f1, 54(%sp)
	fblt	%f0, %f1, fbgt_else.49436
	lw	%v0, 53(%sp)
	beqi	%v0, 0, bnei_else.49438
	addi	%v0, %zero, 0
	j	fbgt_cont.49437
bnei_else.49438:
	addi	%v0, %zero, 1
bnei_cont.49439:
	j	fbgt_cont.49437
fbgt_else.49436:
	lw	%v0, 53(%sp)
fbgt_cont.49437:
	fblt	%f0, %f1, fbgt_else.49440
	fsub	%f0, %f0, %f1
	j	fbgt_cont.49441
fbgt_else.49440:
fbgt_cont.49441:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.49442
	fsub	%f0, %f1, %f0
	j	fbgt_cont.49443
fbgt_else.49442:
fbgt_cont.49443:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.49444
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.49445
fbgt_else.49444:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.49445:
	beqi	%v0, 0, bnei_else.49446
	j	bnei_cont.49447
bnei_else.49446:
	fneg	%f0, %f0
bnei_cont.49447:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.49323:
	j	bnei_cont.49321
bnei_else.49320:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.49448
	addi	%v1, %zero, 0
	j	fbgt_cont.49449
fbgt_else.49448:
	addi	%v1, %zero, 1
fbgt_cont.49449:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.49450
	addi	%a0, %zero, 0
	j	fbgt_cont.49451
fbgt_else.49450:
	addi	%a0, %zero, 1
fbgt_cont.49451:
	beqi	%v1, 0, bnei_else.49452
	beqi	%a0, 0, bnei_else.49454
	flw	%f0, 450(%zero)
	j	bnei_cont.49453
bnei_else.49454:
	flw	%f0, 3(%sp)
bnei_cont.49455:
	j	bnei_cont.49453
bnei_else.49452:
	beqi	%a0, 0, bnei_else.49456
	flw	%f0, 3(%sp)
	j	bnei_cont.49457
bnei_else.49456:
	flw	%f0, 450(%zero)
bnei_cont.49457:
bnei_cont.49453:
	fsw	%f0, 146(%zero)
bnei_cont.49321:
	lw	%v0, 2(%sp)
	lw	%v1, 47(%sp)
	sw	%ra, 57(%sp)
	addi	%sp, %sp, 58
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -58
	lw	%ra, 57(%sp)
	beqi	%v0, 0, bnei_else.49458
	j	bnei_cont.49299
bnei_else.49458:
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
	fblt	%f1, %f0, fbgt_else.49460
	addi	%v0, %zero, 0
	j	fbgt_cont.49461
fbgt_else.49460:
	addi	%v0, %zero, 1
fbgt_cont.49461:
	beqi	%v0, 0, bnei_else.49462
	j	bnei_cont.49463
bnei_else.49462:
	fmov	%f0, %f1
bnei_cont.49463:
	flw	%f1, 46(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 49(%sp)
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
bnei_cont.49459:
	j	bnei_cont.49299
bnei_else.49298:
bnei_cont.49299:
bnei_cont.49119:
	lw	%v0, 34(%sp)
	addi	%a1, %v0, -2
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
bgti_else.49115:
	jr	%ra
bgti_else.48522:
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
	flw	%f1, 493(%zero)
	fblt	%f0, %f1, fbgt_else.49713
	addi	%v1, %zero, 0
	j	fbgt_cont.49714
fbgt_else.49713:
	addi	%v1, %zero, 1
fbgt_cont.49714:
	beqi	%v1, 0, bnei_else.49715
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
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
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.49717
	addi	%v0, %zero, 0
	j	fbgt_cont.49718
fbgt_else.49717:
	addi	%v0, %zero, 1
fbgt_cont.49718:
	beqi	%v0, 0, bnei_else.49719
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.49721
	addi	%v0, %zero, 0
	j	bnei_cont.49720
fbgt_else.49721:
	addi	%v0, %zero, 1
fbgt_cont.49722:
	j	bnei_cont.49720
bnei_else.49719:
	addi	%v0, %zero, 0
bnei_cont.49720:
	beqi	%v0, 0, bnei_else.49723
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 7(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.49725
	beqi	%a0, 2, bnei_else.49727
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
	beqi	%v1, 0, bnei_else.49729
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
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
	j	bnei_cont.49730
bnei_else.49729:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.49730:
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
	fbne	%f1, %f4, fbeq_else.49731
	addi	%a0, %zero, 1
	j	fbeq_cont.49732
fbeq_else.49731:
	addi	%a0, %zero, 0
fbeq_cont.49732:
	beqi	%a0, 0, bnei_else.49733
	flw	%f1, 491(%zero)
	j	bnei_cont.49734
bnei_else.49733:
	beqi	%v1, 0, bnei_else.49735
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.49736
bnei_else.49735:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.49736:
bnei_cont.49734:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.49726
bnei_else.49727:
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
bnei_cont.49728:
	j	bnei_cont.49726
bnei_else.49725:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.49737
	addi	%v1, %zero, 1
	j	fbeq_cont.49738
fbeq_else.49737:
	addi	%v1, %zero, 0
fbeq_cont.49738:
	beqi	%v1, 0, bnei_else.49739
	fmov	%f1, %f0
	j	bnei_cont.49740
bnei_else.49739:
	fblt	%f0, %f1, fbgt_else.49741
	addi	%v1, %zero, 0
	j	fbgt_cont.49742
fbgt_else.49741:
	addi	%v1, %zero, 1
fbgt_cont.49742:
	beqi	%v1, 0, bnei_else.49743
	flw	%f1, 491(%zero)
	j	bnei_cont.49744
bnei_else.49743:
	flw	%f1, 490(%zero)
bnei_cont.49744:
bnei_cont.49740:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.49726:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 8(%sp)
	beqi	%v1, 1, bnei_else.49745
	beqi	%v1, 2, bnei_else.49747
	beqi	%v1, 3, bnei_else.49749
	beqi	%v1, 4, bnei_else.49751
	j	bnei_cont.49746
bnei_else.49751:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.49753
	addi	%v1, %zero, 0
	j	fbgt_cont.49754
fbgt_else.49753:
	addi	%v1, %zero, 1
fbgt_cont.49754:
	beqi	%v1, 0, bnei_else.49755
	flw	%f0, 462(%zero)
	j	bnei_cont.49756
bnei_else.49755:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 6(%sp)
	fblt	%f0, %f1, fbgt_else.49757
	addi	%v1, %zero, 1
	j	fbgt_cont.49758
fbgt_else.49757:
	addi	%v1, %zero, 0
fbgt_cont.49758:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.49759
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.49761
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.49762
fbgt_else.49761:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.49762:
	beqi	%v1, 0, bnei_else.49763
	j	fbgt_cont.49760
bnei_else.49763:
	fneg	%f0, %f0
bnei_cont.49764:
	j	fbgt_cont.49760
fbgt_else.49759:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.49760:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.49756:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.49765
	addi	%v1, %zero, 0
	j	fbgt_cont.49766
fbgt_else.49765:
	addi	%v1, %zero, 1
fbgt_cont.49766:
	beqi	%v1, 0, bnei_else.49767
	flw	%f1, 462(%zero)
	j	bnei_cont.49768
bnei_else.49767:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 6(%sp)
	fblt	%f1, %f2, fbgt_else.49769
	addi	%v1, %zero, 1
	j	fbgt_cont.49770
fbgt_else.49769:
	addi	%v1, %zero, 0
fbgt_cont.49770:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.49771
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.49773
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.49774
fbgt_else.49773:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.49774:
	beqi	%v1, 0, bnei_else.49775
	j	fbgt_cont.49772
bnei_else.49775:
	fneg	%f1, %f1
bnei_cont.49776:
	j	fbgt_cont.49772
fbgt_else.49771:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.49772:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.49768:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 6(%sp)
	fblt	%f0, %f1, fbgt_else.49777
	addi	%v1, %zero, 0
	j	fbgt_cont.49778
fbgt_else.49777:
	addi	%v1, %zero, 1
fbgt_cont.49778:
	beqi	%v1, 0, bnei_else.49779
	fmov	%f0, %f1
	j	bnei_cont.49780
bnei_else.49779:
bnei_cont.49780:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.49752:
	j	bnei_cont.49746
bnei_else.49749:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 9(%sp)
	fsw	%f0, 10(%sp)
	fsw	%f2, 11(%sp)
	fblt	%f0, %f2, fbgt_else.49781
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.49783
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.49785
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.49787
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.49789
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.49791
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.49793
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.49795
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.49797
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.49799
	flw	%f3, 478(%zero)
	fmov	%f1, %f3
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.49782
fbgt_else.49799:
	fmov	%f0, %f3
fbgt_cont.49800:
	j	fbgt_cont.49782
fbgt_else.49797:
	fmov	%f0, %f3
fbgt_cont.49798:
	j	fbgt_cont.49782
fbgt_else.49795:
	fmov	%f0, %f3
fbgt_cont.49796:
	j	fbgt_cont.49782
fbgt_else.49793:
	fmov	%f0, %f3
fbgt_cont.49794:
	j	fbgt_cont.49782
fbgt_else.49791:
	fmov	%f0, %f3
fbgt_cont.49792:
	j	fbgt_cont.49782
fbgt_else.49789:
	fmov	%f0, %f3
fbgt_cont.49790:
	j	fbgt_cont.49782
fbgt_else.49787:
	fmov	%f0, %f3
fbgt_cont.49788:
	j	fbgt_cont.49782
fbgt_else.49785:
	fmov	%f0, %f3
fbgt_cont.49786:
	j	fbgt_cont.49782
fbgt_else.49783:
	fmov	%f0, %f3
fbgt_cont.49784:
	j	fbgt_cont.49782
fbgt_else.49781:
	fmov	%f0, %f2
fbgt_cont.49782:
	flw	%f1, 10(%sp)
	flw	%f2, 11(%sp)
	fblt	%f1, %f2, fbgt_else.49801
	fblt	%f1, %f0, fbgt_else.49803
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49805
	fblt	%f1, %f0, fbgt_else.49807
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.49802
fbgt_else.49807:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
fbgt_cont.49808:
	j	fbgt_cont.49802
fbgt_else.49805:
	fmov	%f0, %f1
fbgt_cont.49806:
	j	fbgt_cont.49802
fbgt_else.49803:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49809
	fblt	%f1, %f0, fbgt_else.49811
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	fbgt_cont.49810
fbgt_else.49811:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
fbgt_cont.49812:
	j	fbgt_cont.49810
fbgt_else.49809:
	fmov	%f0, %f1
fbgt_cont.49810:
fbgt_cont.49804:
	j	fbgt_cont.49802
fbgt_else.49801:
	fmov	%f0, %f1
fbgt_cont.49802:
	flw	%f1, 9(%sp)
	fblt	%f0, %f1, fbgt_else.49813
	addi	%v0, %zero, 0
	j	fbgt_cont.49814
fbgt_else.49813:
	addi	%v0, %zero, 1
fbgt_cont.49814:
	fblt	%f0, %f1, fbgt_else.49815
	fsub	%f0, %f0, %f1
	j	fbgt_cont.49816
fbgt_else.49815:
fbgt_cont.49816:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.49817
	beqi	%v0, 0, bnei_else.49819
	addi	%v0, %zero, 0
	j	fbgt_cont.49818
bnei_else.49819:
	addi	%v0, %zero, 1
bnei_cont.49820:
	j	fbgt_cont.49818
fbgt_else.49817:
fbgt_cont.49818:
	fblt	%f0, %f2, fbgt_else.49821
	fsub	%f0, %f1, %f0
	j	fbgt_cont.49822
fbgt_else.49821:
fbgt_cont.49822:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.49823
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.49824
fbgt_else.49823:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.49824:
	beqi	%v0, 0, bnei_else.49825
	j	bnei_cont.49826
bnei_else.49825:
	fneg	%f0, %f0
bnei_cont.49826:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.49750:
	j	bnei_cont.49746
bnei_else.49747:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 6(%sp)
	fblt	%f0, %f2, fbgt_else.49827
	addi	%v1, %zero, 1
	j	fbgt_cont.49828
fbgt_else.49827:
	addi	%v1, %zero, 0
fbgt_cont.49828:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 12(%sp)
	fsw	%f1, 13(%sp)
	fsw	%f0, 14(%sp)
	fsw	%f3, 15(%sp)
	fblt	%f0, %f3, fbgt_else.49829
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.49831
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.49833
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.49835
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.49837
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.49839
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.49841
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.49843
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.49845
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.49847
	flw	%f4, 478(%zero)
	fmov	%f1, %f4
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	fbgt_cont.49830
fbgt_else.49847:
	fmov	%f0, %f4
fbgt_cont.49848:
	j	fbgt_cont.49830
fbgt_else.49845:
	fmov	%f0, %f4
fbgt_cont.49846:
	j	fbgt_cont.49830
fbgt_else.49843:
	fmov	%f0, %f4
fbgt_cont.49844:
	j	fbgt_cont.49830
fbgt_else.49841:
	fmov	%f0, %f4
fbgt_cont.49842:
	j	fbgt_cont.49830
fbgt_else.49839:
	fmov	%f0, %f4
fbgt_cont.49840:
	j	fbgt_cont.49830
fbgt_else.49837:
	fmov	%f0, %f4
fbgt_cont.49838:
	j	fbgt_cont.49830
fbgt_else.49835:
	fmov	%f0, %f4
fbgt_cont.49836:
	j	fbgt_cont.49830
fbgt_else.49833:
	fmov	%f0, %f4
fbgt_cont.49834:
	j	fbgt_cont.49830
fbgt_else.49831:
	fmov	%f0, %f4
fbgt_cont.49832:
	j	fbgt_cont.49830
fbgt_else.49829:
	fmov	%f0, %f3
fbgt_cont.49830:
	flw	%f1, 14(%sp)
	flw	%f2, 15(%sp)
	fblt	%f1, %f2, fbgt_else.49849
	fblt	%f1, %f0, fbgt_else.49851
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49853
	fblt	%f1, %f0, fbgt_else.49855
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	fbgt_cont.49850
fbgt_else.49855:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
fbgt_cont.49856:
	j	fbgt_cont.49850
fbgt_else.49853:
	fmov	%f0, %f1
fbgt_cont.49854:
	j	fbgt_cont.49850
fbgt_else.49851:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49857
	fblt	%f1, %f0, fbgt_else.49859
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	fbgt_cont.49858
fbgt_else.49859:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
fbgt_cont.49860:
	j	fbgt_cont.49858
fbgt_else.49857:
	fmov	%f0, %f1
fbgt_cont.49858:
fbgt_cont.49852:
	j	fbgt_cont.49850
fbgt_else.49849:
	fmov	%f0, %f1
fbgt_cont.49850:
	flw	%f1, 13(%sp)
	fblt	%f0, %f1, fbgt_else.49861
	lw	%v0, 12(%sp)
	beqi	%v0, 0, bnei_else.49863
	addi	%v0, %zero, 0
	j	fbgt_cont.49862
bnei_else.49863:
	addi	%v0, %zero, 1
bnei_cont.49864:
	j	fbgt_cont.49862
fbgt_else.49861:
	lw	%v0, 12(%sp)
fbgt_cont.49862:
	fblt	%f0, %f1, fbgt_else.49865
	fsub	%f0, %f0, %f1
	j	fbgt_cont.49866
fbgt_else.49865:
fbgt_cont.49866:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.49867
	fsub	%f0, %f1, %f0
	j	fbgt_cont.49868
fbgt_else.49867:
fbgt_cont.49868:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.49869
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.49870
fbgt_else.49869:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.49870:
	beqi	%v0, 0, bnei_else.49871
	j	bnei_cont.49872
bnei_else.49871:
	fneg	%f0, %f0
bnei_cont.49872:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.49748:
	j	bnei_cont.49746
bnei_else.49745:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.49873
	addi	%v1, %zero, 0
	j	fbgt_cont.49874
fbgt_else.49873:
	addi	%v1, %zero, 1
fbgt_cont.49874:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.49875
	addi	%a0, %zero, 0
	j	fbgt_cont.49876
fbgt_else.49875:
	addi	%a0, %zero, 1
fbgt_cont.49876:
	beqi	%v1, 0, bnei_else.49877
	beqi	%a0, 0, bnei_else.49879
	flw	%f0, 450(%zero)
	j	bnei_cont.49878
bnei_else.49879:
	flw	%f0, 6(%sp)
bnei_cont.49880:
	j	bnei_cont.49878
bnei_else.49877:
	beqi	%a0, 0, bnei_else.49881
	flw	%f0, 6(%sp)
	j	bnei_cont.49882
bnei_else.49881:
	flw	%f0, 450(%zero)
bnei_cont.49882:
bnei_cont.49878:
	fsw	%f0, 146(%zero)
bnei_cont.49746:
	lw	%v0, 1(%sp)
	lw	%v1, 5(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	beqi	%v0, 0, bnei_else.49883
	j	bnei_cont.49716
bnei_else.49883:
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
	fblt	%f1, %f0, fbgt_else.49885
	addi	%v0, %zero, 0
	j	fbgt_cont.49886
fbgt_else.49885:
	addi	%v0, %zero, 1
fbgt_cont.49886:
	beqi	%v0, 0, bnei_else.49887
	j	bnei_cont.49888
bnei_else.49887:
	fmov	%f0, %f1
bnei_cont.49888:
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
bnei_cont.49884:
	j	bnei_cont.49716
bnei_else.49723:
bnei_cont.49724:
	j	bnei_cont.49716
bnei_else.49715:
	flw	%f2, 439(%zero)
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	fsw	%f2, 137(%zero)
	lw	%v1, 134(%zero)
	lw	%a2, 1(%sp)
	fsw	%f0, 16(%sp)
	sw	%v1, 17(%sp)
	fsw	%f1, 6(%sp)
	sw	%a0, 18(%sp)
	addi	%v0, %a2, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	trace_or_matrix_fast.2944
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	fblt	%f1, %f0, fbgt_else.49889
	addi	%v0, %zero, 0
	j	fbgt_cont.49890
fbgt_else.49889:
	addi	%v0, %zero, 1
fbgt_cont.49890:
	beqi	%v0, 0, bnei_else.49891
	flw	%f1, 464(%zero)
	fblt	%f0, %f1, fbgt_else.49893
	addi	%v0, %zero, 0
	j	bnei_cont.49892
fbgt_else.49893:
	addi	%v0, %zero, 1
fbgt_cont.49894:
	j	bnei_cont.49892
bnei_else.49891:
	addi	%v0, %zero, 0
bnei_cont.49892:
	beqi	%v0, 0, bnei_else.49895
	lw	%v0, 141(%zero)
	lw	%v0, 12(%v0)
	lw	%v1, 18(%sp)
	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	beqi	%a0, 1, bnei_else.49897
	beqi	%a0, 2, bnei_else.49899
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
	beqi	%v1, 0, bnei_else.49901
	lw	%v1, 9(%v0)
	flw	%f6, 2(%v1)
	fmul	%f6, %f1, %f6
	lw	%v1, 9(%v0)
	flw	%f7, 1(%v1)
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)
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
	j	bnei_cont.49902
bnei_else.49901:
	fsw	%f3, 142(%zero)
	fsw	%f4, 143(%zero)
	fsw	%f5, 144(%zero)
bnei_cont.49902:
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
	fbne	%f1, %f4, fbeq_else.49903
	addi	%a0, %zero, 1
	j	fbeq_cont.49904
fbeq_else.49903:
	addi	%a0, %zero, 0
fbeq_cont.49904:
	beqi	%a0, 0, bnei_else.49905
	flw	%f1, 491(%zero)
	j	bnei_cont.49906
bnei_else.49905:
	beqi	%v1, 0, bnei_else.49907
	flw	%f5, 490(%zero)
	fdiv	%f1, %f5, %f1
	j	bnei_cont.49908
bnei_else.49907:
	flw	%f5, 491(%zero)
	fdiv	%f1, %f5, %f1
bnei_cont.49908:
bnei_cont.49906:
	fmul	%f0, %f0, %f1
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1
	fsw	%f0, 144(%zero)
	j	bnei_cont.49898
bnei_else.49899:
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
bnei_cont.49900:
	j	bnei_cont.49898
bnei_else.49897:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
	fsw	%f0, 142(%zero)
	fsw	%f0, 143(%zero)
	fsw	%f0, 144(%zero)
	addi	%a0, %a0, -1
	add	%at, %v1, %a0
	flw	%f1, 0(%at)
	fbne	%f1, %f0, fbeq_else.49909
	addi	%v1, %zero, 1
	j	fbeq_cont.49910
fbeq_else.49909:
	addi	%v1, %zero, 0
fbeq_cont.49910:
	beqi	%v1, 0, bnei_else.49911
	fmov	%f1, %f0
	j	bnei_cont.49912
bnei_else.49911:
	fblt	%f0, %f1, fbgt_else.49913
	addi	%v1, %zero, 0
	j	fbgt_cont.49914
fbgt_else.49913:
	addi	%v1, %zero, 1
fbgt_cont.49914:
	beqi	%v1, 0, bnei_else.49915
	flw	%f1, 491(%zero)
	j	bnei_cont.49916
bnei_else.49915:
	flw	%f1, 490(%zero)
bnei_cont.49916:
bnei_cont.49912:
	fneg	%f1, %f1
	fsw	%f1, 142(%a0)
bnei_cont.49898:
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)
	flw	%f0, 0(%a0)
	fsw	%f0, 145(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 1(%a0)
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)
	flw	%f0, 2(%a0)
	fsw	%f0, 147(%zero)
	sw	%v0, 19(%sp)
	beqi	%v1, 1, bnei_else.49917
	beqi	%v1, 2, bnei_else.49919
	beqi	%v1, 3, bnei_else.49921
	beqi	%v1, 4, bnei_else.49923
	j	bnei_cont.49918
bnei_else.49923:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	lw	%v1, 4(%v0)
	flw	%f1, 0(%v1)
	fsqrt	%f1, %f1
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	lw	%v1, 4(%v0)
	flw	%f2, 2(%v1)
	fsqrt	%f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0
	flw	%f4, 463(%zero)
	fblt	%f3, %f4, fbgt_else.49925
	addi	%v1, %zero, 0
	j	fbgt_cont.49926
fbgt_else.49925:
	addi	%v1, %zero, 1
fbgt_cont.49926:
	beqi	%v1, 0, bnei_else.49927
	flw	%f0, 462(%zero)
	j	bnei_cont.49928
bnei_else.49927:
	fdiv	%f0, %f1, %f0
	fabs	%f0, %f0
	flw	%f1, 6(%sp)
	fblt	%f0, %f1, fbgt_else.49929
	addi	%v1, %zero, 1
	j	fbgt_cont.49930
fbgt_else.49929:
	addi	%v1, %zero, 0
fbgt_cont.49930:
	fabs	%f3, %f0
	flw	%f5, 461(%zero)
	fblt	%f3, %f5, fbgt_else.49931
	flw	%f0, 454(%zero)
	fblt	%f3, %f0, fbgt_else.49933
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	fdiv	%f3, %f5, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	j	fbgt_cont.49934
fbgt_else.49933:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	fdiv	%f3, %f6, %f3
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	fmul	%f7, %f6, %f6
	flw	%f8, 460(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f8, %f3, %f8
	flw	%f9, 459(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f6
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f5
	fmul	%f9, %f9, %f6
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f9, %f9, %f7
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)
	fmul	%f9, %f9, %f3
	fmul	%f5, %f9, %f5
	fmul	%f5, %f5, %f7
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fmul	%f3, %f3, %f7
	fadd	%f3, %f5, %f3
	fadd	%f0, %f0, %f3
fbgt_cont.49934:
	beqi	%v1, 0, bnei_else.49935
	j	fbgt_cont.49932
bnei_else.49935:
	fneg	%f0, %f0
bnei_cont.49936:
	j	fbgt_cont.49932
fbgt_else.49931:
	fmul	%f3, %f0, %f0
	fmul	%f5, %f3, %f3
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f3
	fsub	%f7, %f0, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f0
	fmul	%f3, %f8, %f3
	fmul	%f3, %f3, %f6
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f5
	fmul	%f0, %f0, %f6
	fadd	%f0, %f3, %f0
fbgt_cont.49932:
	flw	%f3, 453(%zero)
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)
	fdiv	%f0, %f0, %f3
bnei_cont.49928:
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	lw	%v1, 5(%v0)
	flw	%f3, 1(%v1)
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)
	flw	%f3, 1(%v1)
	fsqrt	%f3, %f3
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2
	fblt	%f3, %f4, fbgt_else.49937
	addi	%v1, %zero, 0
	j	fbgt_cont.49938
fbgt_else.49937:
	addi	%v1, %zero, 1
fbgt_cont.49938:
	beqi	%v1, 0, bnei_else.49939
	flw	%f1, 462(%zero)
	j	bnei_cont.49940
bnei_else.49939:
	fdiv	%f1, %f1, %f2
	fabs	%f1, %f1
	flw	%f2, 6(%sp)
	fblt	%f1, %f2, fbgt_else.49941
	addi	%v1, %zero, 1
	j	fbgt_cont.49942
fbgt_else.49941:
	addi	%v1, %zero, 0
fbgt_cont.49942:
	fabs	%f3, %f1
	flw	%f4, 461(%zero)
	fblt	%f3, %f4, fbgt_else.49943
	flw	%f1, 454(%zero)
	fblt	%f3, %f1, fbgt_else.49945
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	fdiv	%f3, %f4, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	j	fbgt_cont.49946
fbgt_else.49945:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	fdiv	%f3, %f5, %f3
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	fmul	%f6, %f5, %f5
	flw	%f7, 460(%zero)
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f7, %f3, %f7
	flw	%f8, 459(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f5
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f4
	fmul	%f8, %f8, %f5
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f8, %f8, %f6
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)
	fmul	%f8, %f8, %f3
	fmul	%f4, %f8, %f4
	fmul	%f4, %f4, %f6
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fmul	%f3, %f3, %f6
	fadd	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
fbgt_cont.49946:
	beqi	%v1, 0, bnei_else.49947
	j	fbgt_cont.49944
bnei_else.49947:
	fneg	%f1, %f1
bnei_cont.49948:
	j	fbgt_cont.49944
fbgt_else.49943:
	fmul	%f3, %f1, %f1
	fmul	%f4, %f3, %f3
	fmul	%f5, %f4, %f4
	flw	%f6, 460(%zero)
	fmul	%f6, %f6, %f1
	fmul	%f6, %f6, %f3
	fsub	%f6, %f1, %f6
	flw	%f7, 459(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f4
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f3
	fmul	%f7, %f7, %f4
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)
	fmul	%f7, %f7, %f1
	fmul	%f3, %f7, %f3
	fmul	%f3, %f3, %f5
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f4
	fmul	%f1, %f1, %f5
	fadd	%f1, %f3, %f1
fbgt_cont.49944:
	flw	%f3, 453(%zero)
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)
	fdiv	%f1, %f1, %f3
bnei_cont.49940:
	floor	%f2, %f1
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f3, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f2, %f0
	fsub	%f1, %f3, %f1
	fmul	%f1, %f1, %f1
	fsub	%f0, %f0, %f1
	flw	%f1, 6(%sp)
	fblt	%f0, %f1, fbgt_else.49949
	addi	%v1, %zero, 0
	j	fbgt_cont.49950
fbgt_else.49949:
	addi	%v1, %zero, 1
fbgt_cont.49950:
	beqi	%v1, 0, bnei_else.49951
	fmov	%f0, %f1
	j	bnei_cont.49952
bnei_else.49951:
bnei_cont.49952:
	flw	%f2, 450(%zero)
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)
	fdiv	%f0, %f0, %f2
	fsw	%f0, 147(%zero)
bnei_cont.49924:
	j	bnei_cont.49918
bnei_else.49921:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	lw	%v1, 5(%v0)
	flw	%f2, 2(%v1)
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	fmul	%f1, %f1, %f1
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 448(%zero)
	fdiv	%f0, %f0, %f1
	floor	%f1, %f0
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	fsw	%f1, 20(%sp)
	fsw	%f0, 21(%sp)
	fsw	%f2, 22(%sp)
	fblt	%f0, %f2, fbgt_else.49953
	flw	%f3, 487(%zero)
	fblt	%f0, %f3, fbgt_else.49955
	flw	%f3, 486(%zero)
	fblt	%f0, %f3, fbgt_else.49957
	flw	%f3, 485(%zero)
	fblt	%f0, %f3, fbgt_else.49959
	flw	%f3, 484(%zero)
	fblt	%f0, %f3, fbgt_else.49961
	flw	%f3, 483(%zero)
	fblt	%f0, %f3, fbgt_else.49963
	flw	%f3, 482(%zero)
	fblt	%f0, %f3, fbgt_else.49965
	flw	%f3, 481(%zero)
	fblt	%f0, %f3, fbgt_else.49967
	flw	%f3, 480(%zero)
	fblt	%f0, %f3, fbgt_else.49969
	flw	%f3, 479(%zero)
	fblt	%f0, %f3, fbgt_else.49971
	flw	%f3, 478(%zero)
	fmov	%f1, %f3
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	fbgt_cont.49954
fbgt_else.49971:
	fmov	%f0, %f3
fbgt_cont.49972:
	j	fbgt_cont.49954
fbgt_else.49969:
	fmov	%f0, %f3
fbgt_cont.49970:
	j	fbgt_cont.49954
fbgt_else.49967:
	fmov	%f0, %f3
fbgt_cont.49968:
	j	fbgt_cont.49954
fbgt_else.49965:
	fmov	%f0, %f3
fbgt_cont.49966:
	j	fbgt_cont.49954
fbgt_else.49963:
	fmov	%f0, %f3
fbgt_cont.49964:
	j	fbgt_cont.49954
fbgt_else.49961:
	fmov	%f0, %f3
fbgt_cont.49962:
	j	fbgt_cont.49954
fbgt_else.49959:
	fmov	%f0, %f3
fbgt_cont.49960:
	j	fbgt_cont.49954
fbgt_else.49957:
	fmov	%f0, %f3
fbgt_cont.49958:
	j	fbgt_cont.49954
fbgt_else.49955:
	fmov	%f0, %f3
fbgt_cont.49956:
	j	fbgt_cont.49954
fbgt_else.49953:
	fmov	%f0, %f2
fbgt_cont.49954:
	flw	%f1, 21(%sp)
	flw	%f2, 22(%sp)
	fblt	%f1, %f2, fbgt_else.49973
	fblt	%f1, %f0, fbgt_else.49975
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49977
	fblt	%f1, %f0, fbgt_else.49979
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	fbgt_cont.49974
fbgt_else.49979:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
fbgt_cont.49980:
	j	fbgt_cont.49974
fbgt_else.49977:
	fmov	%f0, %f1
fbgt_cont.49978:
	j	fbgt_cont.49974
fbgt_else.49975:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.49981
	fblt	%f1, %f0, fbgt_else.49983
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	fbgt_cont.49982
fbgt_else.49983:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
fbgt_cont.49984:
	j	fbgt_cont.49982
fbgt_else.49981:
	fmov	%f0, %f1
fbgt_cont.49982:
fbgt_cont.49976:
	j	fbgt_cont.49974
fbgt_else.49973:
	fmov	%f0, %f1
fbgt_cont.49974:
	flw	%f1, 20(%sp)
	fblt	%f0, %f1, fbgt_else.49985
	addi	%v0, %zero, 0
	j	fbgt_cont.49986
fbgt_else.49985:
	addi	%v0, %zero, 1
fbgt_cont.49986:
	fblt	%f0, %f1, fbgt_else.49987
	fsub	%f0, %f0, %f1
	j	fbgt_cont.49988
fbgt_else.49987:
fbgt_cont.49988:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.49989
	beqi	%v0, 0, bnei_else.49991
	addi	%v0, %zero, 0
	j	fbgt_cont.49990
bnei_else.49991:
	addi	%v0, %zero, 1
bnei_cont.49992:
	j	fbgt_cont.49990
fbgt_else.49989:
fbgt_cont.49990:
	fblt	%f0, %f2, fbgt_else.49993
	fsub	%f0, %f1, %f0
	j	fbgt_cont.49994
fbgt_else.49993:
fbgt_cont.49994:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.49995
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.49996
fbgt_else.49995:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.49996:
	beqi	%v0, 0, bnei_else.49997
	j	bnei_cont.49998
bnei_else.49997:
	fneg	%f0, %f0
bnei_cont.49998:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f0, %f1
	fsw	%f2, 146(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f1
	fsw	%f0, 147(%zero)
bnei_cont.49922:
	j	bnei_cont.49918
bnei_else.49919:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 6(%sp)
	fblt	%f0, %f2, fbgt_else.49999
	addi	%v1, %zero, 1
	j	fbgt_cont.50000
fbgt_else.49999:
	addi	%v1, %zero, 0
fbgt_cont.50000:
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 23(%sp)
	fsw	%f1, 24(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f3, 26(%sp)
	fblt	%f0, %f3, fbgt_else.50001
	flw	%f4, 487(%zero)
	fblt	%f0, %f4, fbgt_else.50003
	flw	%f4, 486(%zero)
	fblt	%f0, %f4, fbgt_else.50005
	flw	%f4, 485(%zero)
	fblt	%f0, %f4, fbgt_else.50007
	flw	%f4, 484(%zero)
	fblt	%f0, %f4, fbgt_else.50009
	flw	%f4, 483(%zero)
	fblt	%f0, %f4, fbgt_else.50011
	flw	%f4, 482(%zero)
	fblt	%f0, %f4, fbgt_else.50013
	flw	%f4, 481(%zero)
	fblt	%f0, %f4, fbgt_else.50015
	flw	%f4, 480(%zero)
	fblt	%f0, %f4, fbgt_else.50017
	flw	%f4, 479(%zero)
	fblt	%f0, %f4, fbgt_else.50019
	flw	%f4, 478(%zero)
	fmov	%f1, %f4
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.50002
fbgt_else.50019:
	fmov	%f0, %f4
fbgt_cont.50020:
	j	fbgt_cont.50002
fbgt_else.50017:
	fmov	%f0, %f4
fbgt_cont.50018:
	j	fbgt_cont.50002
fbgt_else.50015:
	fmov	%f0, %f4
fbgt_cont.50016:
	j	fbgt_cont.50002
fbgt_else.50013:
	fmov	%f0, %f4
fbgt_cont.50014:
	j	fbgt_cont.50002
fbgt_else.50011:
	fmov	%f0, %f4
fbgt_cont.50012:
	j	fbgt_cont.50002
fbgt_else.50009:
	fmov	%f0, %f4
fbgt_cont.50010:
	j	fbgt_cont.50002
fbgt_else.50007:
	fmov	%f0, %f4
fbgt_cont.50008:
	j	fbgt_cont.50002
fbgt_else.50005:
	fmov	%f0, %f4
fbgt_cont.50006:
	j	fbgt_cont.50002
fbgt_else.50003:
	fmov	%f0, %f4
fbgt_cont.50004:
	j	fbgt_cont.50002
fbgt_else.50001:
	fmov	%f0, %f3
fbgt_cont.50002:
	flw	%f1, 25(%sp)
	flw	%f2, 26(%sp)
	fblt	%f1, %f2, fbgt_else.50021
	fblt	%f1, %f0, fbgt_else.50023
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.50025
	fblt	%f1, %f0, fbgt_else.50027
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
	j	fbgt_cont.50022
fbgt_else.50027:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.50028:
	j	fbgt_cont.50022
fbgt_else.50025:
	fmov	%f0, %f1
fbgt_cont.50026:
	j	fbgt_cont.50022
fbgt_else.50023:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.50029
	fblt	%f1, %f0, fbgt_else.50031
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
	j	fbgt_cont.50030
fbgt_else.50031:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.50032:
	j	fbgt_cont.50030
fbgt_else.50029:
	fmov	%f0, %f1
fbgt_cont.50030:
fbgt_cont.50024:
	j	fbgt_cont.50022
fbgt_else.50021:
	fmov	%f0, %f1
fbgt_cont.50022:
	flw	%f1, 24(%sp)
	fblt	%f0, %f1, fbgt_else.50033
	lw	%v0, 23(%sp)
	beqi	%v0, 0, bnei_else.50035
	addi	%v0, %zero, 0
	j	fbgt_cont.50034
bnei_else.50035:
	addi	%v0, %zero, 1
bnei_cont.50036:
	j	fbgt_cont.50034
fbgt_else.50033:
	lw	%v0, 23(%sp)
fbgt_cont.50034:
	fblt	%f0, %f1, fbgt_else.50037
	fsub	%f0, %f0, %f1
	j	fbgt_cont.50038
fbgt_else.50037:
fbgt_cont.50038:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.50039
	fsub	%f0, %f1, %f0
	j	fbgt_cont.50040
fbgt_else.50039:
fbgt_cont.50040:
	flw	%f1, 475(%zero)
	fblt	%f1, %f0, fbgt_else.50041
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	j	fbgt_cont.50042
fbgt_else.50041:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
fbgt_cont.50042:
	beqi	%v0, 0, bnei_else.50043
	j	bnei_cont.50044
bnei_else.50043:
	fneg	%f0, %f0
bnei_cont.50044:
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)
	fmul	%f2, %f1, %f0
	fsw	%f2, 145(%zero)
	flw	%f2, 491(%zero)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	fsw	%f0, 146(%zero)
bnei_cont.49920:
	j	bnei_cont.49918
bnei_else.49917:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	flw	%f1, 0(%v1)
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)
	fmul	%f2, %f0, %f1
	floor	%f2, %f2
	flw	%f3, 444(%zero)
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)
	fblt	%f0, %f2, fbgt_else.50045
	addi	%v1, %zero, 0
	j	fbgt_cont.50046
fbgt_else.50045:
	addi	%v1, %zero, 1
fbgt_cont.50046:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	flw	%f4, 2(%a0)
	fsub	%f0, %f0, %f4
	fmul	%f1, %f0, %f1
	floor	%f1, %f1
	fmul	%f1, %f1, %f3
	fsub	%f0, %f0, %f1
	fblt	%f0, %f2, fbgt_else.50047
	addi	%a0, %zero, 0
	j	fbgt_cont.50048
fbgt_else.50047:
	addi	%a0, %zero, 1
fbgt_cont.50048:
	beqi	%v1, 0, bnei_else.50049
	beqi	%a0, 0, bnei_else.50051
	flw	%f0, 450(%zero)
	j	bnei_cont.50050
bnei_else.50051:
	flw	%f0, 6(%sp)
bnei_cont.50052:
	j	bnei_cont.50050
bnei_else.50049:
	beqi	%a0, 0, bnei_else.50053
	flw	%f0, 6(%sp)
	j	bnei_cont.50054
bnei_else.50053:
	flw	%f0, 450(%zero)
bnei_cont.50054:
bnei_cont.50050:
	fsw	%f0, 146(%zero)
bnei_cont.49918:
	lw	%v0, 1(%sp)
	lw	%v1, 17(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	shadow_check_one_or_matrix.2919
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	beqi	%v0, 0, bnei_else.50055
	j	bnei_cont.49896
bnei_else.50055:
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
	fblt	%f1, %f0, fbgt_else.50057
	addi	%v0, %zero, 0
	j	fbgt_cont.50058
fbgt_else.50057:
	addi	%v0, %zero, 1
fbgt_cont.50058:
	beqi	%v0, 0, bnei_else.50059
	j	bnei_cont.50060
bnei_else.50059:
	fmov	%f0, %f1
bnei_cont.50060:
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 19(%sp)
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
bnei_cont.50056:
	j	bnei_cont.49896
bnei_else.49895:
bnei_cont.49896:
bnei_cont.49716:
	addi	%a1, %zero, 116
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	j	iter_trace_diffuse_rays.2980
do_without_neighbors.3002:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.50144
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.50145
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	sw	%v1, 1(%sp)
	beqi	%a0, 0, bnei_else.50146
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
	beqi	%a0, 0, bnei_else.50148
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
	j	bnei_cont.50149
bnei_else.50148:
bnei_cont.50149:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.50150
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
	j	bnei_cont.50151
bnei_else.50150:
bnei_cont.50151:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.50152
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
	j	bnei_cont.50153
bnei_else.50152:
bnei_cont.50153:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.50154
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
	j	bnei_cont.50155
bnei_else.50154:
bnei_cont.50155:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.50156
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
	j	bnei_cont.50157
bnei_else.50156:
bnei_cont.50157:
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
	j	bnei_cont.50147
bnei_else.50146:
bnei_cont.50147:
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 1
	addi	%at, %zero, 4
	blt	%at, %v0, bgt_else.50158
	lw	%v1, 0(%sp)
	lw	%a0, 2(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.50159
	lw	%a0, 3(%v1)
	add	%at, %a0, %v0
	lw	%a0, 0(%at)
	beqi	%a0, 0, bnei_else.50160
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
	beqi	%a0, 0, bnei_else.50162
	lw	%t0, 179(%zero)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0
	addi	%v0, %t0, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.50163
bnei_else.50162:
bnei_cont.50163:
	lw	%v0, 15(%sp)
	beqi	%v0, 1, bnei_else.50164
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
	j	bnei_cont.50165
bnei_else.50164:
bnei_cont.50165:
	lw	%v0, 15(%sp)
	beqi	%v0, 2, bnei_else.50166
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
	j	bnei_cont.50167
bnei_else.50166:
bnei_cont.50167:
	lw	%v0, 15(%sp)
	beqi	%v0, 3, bnei_else.50168
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
	j	bnei_cont.50169
bnei_else.50168:
bnei_cont.50169:
	lw	%v0, 15(%sp)
	beqi	%v0, 4, bnei_else.50170
	lw	%v0, 183(%zero)
	lw	%v1, 14(%sp)
	lw	%a0, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bnei_cont.50171
bnei_else.50170:
bnei_cont.50171:
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
	j	bnei_cont.50161
bnei_else.50160:
bnei_cont.50161:
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.50159:
	jr	%ra
bgt_else.50158:
	jr	%ra
bgti_else.50145:
	jr	%ra
bgt_else.50144:
	jr	%ra
try_exploit_neighbors.3018:
	add	%at, %a1, %v0
	lw	%t0, 0(%at)
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.50209
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.50210
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	add	%at, %a0, %v0
	lw	%t2, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.50211
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.50213
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.50215
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.50217
	addi	%t1, %zero, 1
	j	beq_cont.50212
beq_else.50217:
	addi	%t1, %zero, 0
beq_cont.50218:
	j	beq_cont.50212
beq_else.50215:
	addi	%t1, %zero, 0
beq_cont.50216:
	j	beq_cont.50212
beq_else.50213:
	addi	%t1, %zero, 0
beq_cont.50214:
	j	beq_cont.50212
beq_else.50211:
	addi	%t1, %zero, 0
beq_cont.50212:
	beqi	%t1, 0, bnei_else.50219
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.50220
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
	j	bnei_cont.50221
bnei_else.50220:
bnei_cont.50221:
	addi	%a3, %a3, 1
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.50222
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	blti	%t1, 0, bgti_else.50223
	lw	%t1, 2(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	lw	%t3, 2(%t2)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.50224
	add	%at, %a2, %v0
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.50226
	addi	%t3, %v0, -1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.50228
	addi	%t3, %v0, 1
	add	%at, %a1, %t3
	lw	%t3, 0(%at)
	lw	%t3, 2(%t3)
	add	%at, %t3, %a3
	lw	%t3, 0(%at)
	bne	%t3, %t1, beq_else.50230
	addi	%t1, %zero, 1
	j	beq_cont.50225
beq_else.50230:
	addi	%t1, %zero, 0
beq_cont.50231:
	j	beq_cont.50225
beq_else.50228:
	addi	%t1, %zero, 0
beq_cont.50229:
	j	beq_cont.50225
beq_else.50226:
	addi	%t1, %zero, 0
beq_cont.50227:
	j	beq_cont.50225
beq_else.50224:
	addi	%t1, %zero, 0
beq_cont.50225:
	beqi	%t1, 0, bnei_else.50232
	lw	%t1, 3(%t0)
	add	%at, %t1, %a3
	lw	%t1, 0(%at)
	beqi	%t1, 0, bnei_else.50233
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
	j	bnei_cont.50234
bnei_else.50233:
bnei_cont.50234:
	addi	%a3, %a3, 1
	j	try_exploit_neighbors.3018
bnei_else.50232:
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0
	j	do_without_neighbors.3002
bgti_else.50223:
	jr	%ra
bgt_else.50222:
	jr	%ra
bnei_else.50219:
	addi	%at, %zero, 4
	blt	%at, %a3, bgt_else.50237
	lw	%v0, 2(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	blti	%v0, 0, bgti_else.50238
	lw	%v0, 3(%t0)
	add	%at, %v0, %a3
	lw	%v0, 0(%at)
	sw	%t0, 0(%sp)
	sw	%a3, 1(%sp)
	beqi	%v0, 0, bnei_else.50239
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
	beqi	%v0, 0, bnei_else.50241
	lw	%a2, 179(%zero)
	addi	%v0, %a2, 0
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.50242
bnei_else.50241:
bnei_cont.50242:
	lw	%v0, 5(%sp)
	beqi	%v0, 1, bnei_else.50243
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
	j	bnei_cont.50244
bnei_else.50243:
bnei_cont.50244:
	lw	%v0, 5(%sp)
	beqi	%v0, 2, bnei_else.50245
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
	j	bnei_cont.50246
bnei_else.50245:
bnei_cont.50246:
	lw	%v0, 5(%sp)
	beqi	%v0, 3, bnei_else.50247
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
	j	bnei_cont.50248
bnei_else.50247:
bnei_cont.50248:
	lw	%v0, 5(%sp)
	beqi	%v0, 4, bnei_else.50249
	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	j	bnei_cont.50250
bnei_else.50249:
bnei_cont.50250:
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
	j	bnei_cont.50240
bnei_else.50239:
bnei_cont.50240:
	lw	%v0, 1(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)
	j	do_without_neighbors.3002
bgti_else.50238:
	jr	%ra
bgt_else.50237:
	jr	%ra
bgti_else.50210:
	jr	%ra
bgt_else.50209:
	jr	%ra
pretrace_diffuse_rays.3031:
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.50275
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.50276
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	beqi	%a0, 0, bnei_else.50277
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 493(%zero)
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
	j	bnei_cont.50278
bnei_else.50277:
bnei_cont.50278:
	lw	%v1, 0(%sp)
	addi	%v1, %v1, 1
	addi	%at, %zero, 4
	blt	%at, %v1, bgt_else.50279
	lw	%a0, 2(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	blti	%a0, 0, bgti_else.50280
	lw	%a0, 3(%v0)
	add	%at, %a0, %v1
	lw	%a0, 0(%at)
	sw	%v1, 5(%sp)
	beqi	%a0, 0, bnei_else.50281
	lw	%a0, 6(%v0)
	lw	%a0, 0(%a0)
	flw	%f0, 493(%zero)
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
	fblt	%f0, %f1, fbgt_else.50283
	addi	%a0, %zero, 0
	j	fbgt_cont.50284
fbgt_else.50283:
	addi	%a0, %zero, 1
fbgt_cont.50284:
	beqi	%a0, 0, bnei_else.50285
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
	j	bnei_cont.50286
bnei_else.50285:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.50286:
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
	j	bnei_cont.50282
bnei_else.50281:
bnei_cont.50282:
	lw	%v1, 5(%sp)
	addi	%v1, %v1, 1
	j	pretrace_diffuse_rays.3031
bgti_else.50280:
	jr	%ra
bgt_else.50279:
	jr	%ra
bgti_else.50276:
	jr	%ra
bgt_else.50275:
	jr	%ra
pretrace_pixels.3034:
	addi	%a1, %zero, 0
	blti	%v1, 0, bgti_else.50315
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
	flw	%f7, 493(%zero)
	fbne	%f4, %f7, fbeq_else.50316
	addi	%a3, %zero, 1
	j	fbeq_cont.50317
fbeq_else.50316:
	addi	%a3, %zero, 0
fbeq_cont.50317:
	beqi	%a3, 0, bnei_else.50318
	flw	%f4, 491(%zero)
	j	bnei_cont.50319
bnei_else.50318:
	flw	%f8, 491(%zero)
	fdiv	%f4, %f8, %f4
bnei_cont.50319:
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
	flw	%f3, 491(%zero)
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
	blti	%v1, 0, bgti_else.50320
	lw	%v1, 3(%v0)
	lw	%v1, 0(%v1)
	beqi	%v1, 0, bnei_else.50322
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
	fblt	%f0, %f1, fbgt_else.50324
	addi	%a0, %zero, 0
	j	fbgt_cont.50325
fbgt_else.50324:
	addi	%a0, %zero, 1
fbgt_cont.50325:
	beqi	%a0, 0, bnei_else.50326
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bnei_cont.50327
bnei_else.50326:
	flw	%f1, 439(%zero)
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	trace_diffuse_ray.2977
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
bnei_cont.50327:
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
	j	bnei_cont.50323
bnei_else.50322:
bnei_cont.50323:
	lw	%v1, 5(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	pretrace_diffuse_rays.3031
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.50321
bgti_else.50320:
bgti_cont.50321:
	lw	%v0, 4(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	blti	%v0, 5, bgti_else.50328
	addi	%a0, %v0, -5
	j	bgti_cont.50329
bgti_else.50328:
	add	%a0, %zero, %v0
bgti_cont.50329:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)
	j	pretrace_pixels.3034
bgti_else.50315:
	jr	%ra
scan_pixel.3045:
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)
	blt	%v0, %t0, bgt_else.52015
	jr	%ra
bgt_else.52015:
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
	blt	%t4, %t2, bgt_else.52017
	addi	%t5, %zero, 0
	j	bgt_cont.52018
bgt_else.52017:
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52019
	addi	%t5, %zero, 0
	j	bgt_cont.52020
bgt_else.52019:
	addi	%t5, %v0, 1
	blt	%t5, %t0, bgt_else.52021
	addi	%t5, %zero, 0
	j	bgt_cont.52022
bgt_else.52021:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.52023
	addi	%t5, %zero, 0
	j	bgt_cont.52024
bgt_else.52023:
	addi	%t5, %zero, 1
bgt_cont.52024:
bgt_cont.52022:
bgt_cont.52020:
bgt_cont.52018:
	sw	%a2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%v1, 3(%sp)
	sw	%t4, 4(%sp)
	sw	%t2, 5(%sp)
	sw	%a1, 6(%sp)
	sw	%t0, 7(%sp)
	sw	%v0, 8(%sp)
	beqi	%t5, 0, bnei_else.52025
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.52027
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	add	%at, %a0, %v0
	lw	%t6, 0(%at)
	lw	%t7, 2(%t6)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.52029
	add	%at, %a2, %v0
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.52031
	addi	%t7, %v0, -1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.52033
	addi	%t7, %v0, 1
	add	%at, %a1, %t7
	lw	%t7, 0(%at)
	lw	%t7, 2(%t7)
	lw	%t7, 0(%t7)
	bne	%t7, %t5, beq_else.52035
	addi	%t5, %zero, 1
	j	beq_cont.52030
beq_else.52035:
	addi	%t5, %zero, 0
beq_cont.52036:
	j	beq_cont.52030
beq_else.52033:
	addi	%t5, %zero, 0
beq_cont.52034:
	j	beq_cont.52030
beq_else.52031:
	addi	%t5, %zero, 0
beq_cont.52032:
	j	beq_cont.52030
beq_else.52029:
	addi	%t5, %zero, 0
beq_cont.52030:
	beqi	%t5, 0, bnei_else.52037
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	beqi	%t5, 0, bnei_else.52039
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
	j	bnei_cont.52040
bnei_else.52039:
bnei_cont.52040:
	addi	%a3, %t3, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
	j	bnei_cont.52026
bnei_else.52037:
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)
	addi	%sp, %sp, 10
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -10
	lw	%ra, 9(%sp)
bnei_cont.52038:
	j	bnei_cont.52026
bgti_else.52027:
bgti_cont.52028:
	j	bnei_cont.52026
bnei_else.52025:
	lw	%t5, 2(%t1)
	lw	%t5, 0(%t5)
	blti	%t5, 0, bgti_else.52041
	lw	%t5, 3(%t1)
	lw	%t5, 0(%t5)
	sw	%t3, 9(%sp)
	sw	%t1, 10(%sp)
	beqi	%t5, 0, bnei_else.52043
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
	beqi	%t5, 0, bnei_else.52045
	lw	%s1, 179(%zero)
	addi	%a0, %t7, 0
	addi	%v1, %t6, 0
	addi	%v0, %s1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.52046
bnei_else.52045:
bnei_cont.52046:
	lw	%v0, 14(%sp)
	beqi	%v0, 1, bnei_else.52047
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
	j	bnei_cont.52048
bnei_else.52047:
bnei_cont.52048:
	lw	%v0, 14(%sp)
	beqi	%v0, 2, bnei_else.52049
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
	j	bnei_cont.52050
bnei_else.52049:
bnei_cont.52050:
	lw	%v0, 14(%sp)
	beqi	%v0, 3, bnei_else.52051
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
	j	bnei_cont.52052
bnei_else.52051:
bnei_cont.52052:
	lw	%v0, 14(%sp)
	beqi	%v0, 4, bnei_else.52053
	lw	%v0, 183(%zero)
	lw	%v1, 13(%sp)
	lw	%a0, 12(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	trace_diffuse_rays.2985
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bnei_cont.52054
bnei_else.52053:
bnei_cont.52054:
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
	j	bnei_cont.52044
bnei_else.52043:
bnei_cont.52044:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.52042
bgti_else.52041:
bgti_cont.52042:
bnei_cont.52026:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.52055
	blti	%v0, 0, bgti_else.52057
	j	bgt_cont.52056
bgti_else.52057:
	addi	%v0, %zero, 0
bgti_cont.52058:
	j	bgt_cont.52056
bgt_else.52055:
	addi	%v0, %zero, 255
bgt_cont.52056:
	addi	%v1, %zero, 10
	sw	%v1, 15(%sp)
	sw	%v0, 16(%sp)
	blti	%v0, 10, bgti_else.52059
	addi	%a0, %v0, -10
	blti	%a0, 10, bgti_else.52061
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52063
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52065
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 17(%sp)
	addi	%sp, %sp, 18
	jal	print_int_sub1.2629
	addi	%sp, %sp, -18
	lw	%ra, 17(%sp)
	j	bgti_cont.52060
bgti_else.52065:
	addi	%v0, %zero, 3
bgti_cont.52066:
	j	bgti_cont.52060
bgti_else.52063:
	addi	%v0, %zero, 2
bgti_cont.52064:
	j	bgti_cont.52060
bgti_else.52061:
	addi	%v0, %zero, 1
bgti_cont.52062:
	j	bgti_cont.52060
bgti_else.52059:
	addi	%v0, %zero, 0
bgti_cont.52060:
	lw	%v1, 16(%sp)
	sw	%v0, 17(%sp)
	blti	%v1, 10, bgti_else.52067
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52069
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52071
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52073
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52075
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52077
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52079
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52081
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52083
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52085
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52087
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52089
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	print_int_sub2.2632
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.52068
bgti_else.52089:
	add	%v0, %zero, %v1
bgti_cont.52090:
	j	bgti_cont.52068
bgti_else.52087:
	add	%v0, %zero, %v1
bgti_cont.52088:
	j	bgti_cont.52068
bgti_else.52085:
	add	%v0, %zero, %v1
bgti_cont.52086:
	j	bgti_cont.52068
bgti_else.52083:
	add	%v0, %zero, %v1
bgti_cont.52084:
	j	bgti_cont.52068
bgti_else.52081:
	add	%v0, %zero, %v1
bgti_cont.52082:
	j	bgti_cont.52068
bgti_else.52079:
	add	%v0, %zero, %v1
bgti_cont.52080:
	j	bgti_cont.52068
bgti_else.52077:
	add	%v0, %zero, %v1
bgti_cont.52078:
	j	bgti_cont.52068
bgti_else.52075:
	add	%v0, %zero, %v1
bgti_cont.52076:
	j	bgti_cont.52068
bgti_else.52073:
	add	%v0, %zero, %v1
bgti_cont.52074:
	j	bgti_cont.52068
bgti_else.52071:
	add	%v0, %zero, %v1
bgti_cont.52072:
	j	bgti_cont.52068
bgti_else.52069:
	add	%v0, %zero, %v1
bgti_cont.52070:
	j	bgti_cont.52068
bgti_else.52067:
	add	%v0, %zero, %v1
bgti_cont.52068:
	lw	%v1, 17(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52091
	addi	%v0, %v0, 48
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_print_char
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgt_cont.52092
bgt_else.52091:
	sw	%v0, 18(%sp)
	blti	%v1, 10, bgti_else.52093
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.52095
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52097
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52099
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub1.2629
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgti_cont.52094
bgti_else.52099:
	addi	%v0, %zero, 3
bgti_cont.52100:
	j	bgti_cont.52094
bgti_else.52097:
	addi	%v0, %zero, 2
bgti_cont.52098:
	j	bgti_cont.52094
bgti_else.52095:
	addi	%v0, %zero, 1
bgti_cont.52096:
	j	bgti_cont.52094
bgti_else.52093:
	addi	%v0, %zero, 0
bgti_cont.52094:
	lw	%v1, 17(%sp)
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.52101
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52103
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52105
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52107
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52109
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52111
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52113
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52115
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52117
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52119
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52121
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52123
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub2.2632
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.52102
bgti_else.52123:
	add	%v0, %zero, %v1
bgti_cont.52124:
	j	bgti_cont.52102
bgti_else.52121:
	add	%v0, %zero, %v1
bgti_cont.52122:
	j	bgti_cont.52102
bgti_else.52119:
	add	%v0, %zero, %v1
bgti_cont.52120:
	j	bgti_cont.52102
bgti_else.52117:
	add	%v0, %zero, %v1
bgti_cont.52118:
	j	bgti_cont.52102
bgti_else.52115:
	add	%v0, %zero, %v1
bgti_cont.52116:
	j	bgti_cont.52102
bgti_else.52113:
	add	%v0, %zero, %v1
bgti_cont.52114:
	j	bgti_cont.52102
bgti_else.52111:
	add	%v0, %zero, %v1
bgti_cont.52112:
	j	bgti_cont.52102
bgti_else.52109:
	add	%v0, %zero, %v1
bgti_cont.52110:
	j	bgti_cont.52102
bgti_else.52107:
	add	%v0, %zero, %v1
bgti_cont.52108:
	j	bgti_cont.52102
bgti_else.52105:
	add	%v0, %zero, %v1
bgti_cont.52106:
	j	bgti_cont.52102
bgti_else.52103:
	add	%v0, %zero, %v1
bgti_cont.52104:
	j	bgti_cont.52102
bgti_else.52101:
	add	%v0, %zero, %v1
bgti_cont.52102:
	lw	%v1, 19(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52125
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
	j	bgt_cont.52126
bgt_else.52125:
	sw	%v0, 20(%sp)
	blti	%v1, 10, bgti_else.52127
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52129
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52131
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52133
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52135
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52137
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52139
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52141
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52143
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52145
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52147
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52149
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	print_int_sub2.2632
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bgti_cont.52128
bgti_else.52149:
	add	%v0, %zero, %v1
bgti_cont.52150:
	j	bgti_cont.52128
bgti_else.52147:
	add	%v0, %zero, %v1
bgti_cont.52148:
	j	bgti_cont.52128
bgti_else.52145:
	add	%v0, %zero, %v1
bgti_cont.52146:
	j	bgti_cont.52128
bgti_else.52143:
	add	%v0, %zero, %v1
bgti_cont.52144:
	j	bgti_cont.52128
bgti_else.52141:
	add	%v0, %zero, %v1
bgti_cont.52142:
	j	bgti_cont.52128
bgti_else.52139:
	add	%v0, %zero, %v1
bgti_cont.52140:
	j	bgti_cont.52128
bgti_else.52137:
	add	%v0, %zero, %v1
bgti_cont.52138:
	j	bgti_cont.52128
bgti_else.52135:
	add	%v0, %zero, %v1
bgti_cont.52136:
	j	bgti_cont.52128
bgti_else.52133:
	add	%v0, %zero, %v1
bgti_cont.52134:
	j	bgti_cont.52128
bgti_else.52131:
	add	%v0, %zero, %v1
bgti_cont.52132:
	j	bgti_cont.52128
bgti_else.52129:
	add	%v0, %zero, %v1
bgti_cont.52130:
	j	bgti_cont.52128
bgti_else.52127:
	add	%v0, %zero, %v1
bgti_cont.52128:
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
bgt_cont.52126:
bgt_cont.52092:
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
	blt	%at, %v0, bgt_else.52151
	blti	%v0, 0, bgti_else.52153
	j	bgt_cont.52152
bgti_else.52153:
	addi	%v0, %zero, 0
bgti_cont.52154:
	j	bgt_cont.52152
bgt_else.52151:
	addi	%v0, %zero, 255
bgt_cont.52152:
	sw	%v0, 22(%sp)
	blti	%v0, 10, bgti_else.52155
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.52157
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52159
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52161
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub1.2629
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.52156
bgti_else.52161:
	addi	%v0, %zero, 3
bgti_cont.52162:
	j	bgti_cont.52156
bgti_else.52159:
	addi	%v0, %zero, 2
bgti_cont.52160:
	j	bgti_cont.52156
bgti_else.52157:
	addi	%v0, %zero, 1
bgti_cont.52158:
	j	bgti_cont.52156
bgti_else.52155:
	addi	%v0, %zero, 0
bgti_cont.52156:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	blti	%v1, 10, bgti_else.52163
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52165
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52167
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52169
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52171
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52173
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52175
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52177
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52179
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52181
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52183
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52185
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub2.2632
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgti_cont.52164
bgti_else.52185:
	add	%v0, %zero, %v1
bgti_cont.52186:
	j	bgti_cont.52164
bgti_else.52183:
	add	%v0, %zero, %v1
bgti_cont.52184:
	j	bgti_cont.52164
bgti_else.52181:
	add	%v0, %zero, %v1
bgti_cont.52182:
	j	bgti_cont.52164
bgti_else.52179:
	add	%v0, %zero, %v1
bgti_cont.52180:
	j	bgti_cont.52164
bgti_else.52177:
	add	%v0, %zero, %v1
bgti_cont.52178:
	j	bgti_cont.52164
bgti_else.52175:
	add	%v0, %zero, %v1
bgti_cont.52176:
	j	bgti_cont.52164
bgti_else.52173:
	add	%v0, %zero, %v1
bgti_cont.52174:
	j	bgti_cont.52164
bgti_else.52171:
	add	%v0, %zero, %v1
bgti_cont.52172:
	j	bgti_cont.52164
bgti_else.52169:
	add	%v0, %zero, %v1
bgti_cont.52170:
	j	bgti_cont.52164
bgti_else.52167:
	add	%v0, %zero, %v1
bgti_cont.52168:
	j	bgti_cont.52164
bgti_else.52165:
	add	%v0, %zero, %v1
bgti_cont.52166:
	j	bgti_cont.52164
bgti_else.52163:
	add	%v0, %zero, %v1
bgti_cont.52164:
	lw	%v1, 23(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52187
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_print_char
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgt_cont.52188
bgt_else.52187:
	sw	%v0, 24(%sp)
	blti	%v1, 10, bgti_else.52189
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.52191
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52193
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52195
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub1.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgti_cont.52190
bgti_else.52195:
	addi	%v0, %zero, 3
bgti_cont.52196:
	j	bgti_cont.52190
bgti_else.52193:
	addi	%v0, %zero, 2
bgti_cont.52194:
	j	bgti_cont.52190
bgti_else.52191:
	addi	%v0, %zero, 1
bgti_cont.52192:
	j	bgti_cont.52190
bgti_else.52189:
	addi	%v0, %zero, 0
bgti_cont.52190:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	blti	%v1, 10, bgti_else.52197
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52199
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52201
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52203
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52205
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52207
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52209
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52211
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52213
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52215
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52217
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52219
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	print_int_sub2.2632
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.52198
bgti_else.52219:
	add	%v0, %zero, %v1
bgti_cont.52220:
	j	bgti_cont.52198
bgti_else.52217:
	add	%v0, %zero, %v1
bgti_cont.52218:
	j	bgti_cont.52198
bgti_else.52215:
	add	%v0, %zero, %v1
bgti_cont.52216:
	j	bgti_cont.52198
bgti_else.52213:
	add	%v0, %zero, %v1
bgti_cont.52214:
	j	bgti_cont.52198
bgti_else.52211:
	add	%v0, %zero, %v1
bgti_cont.52212:
	j	bgti_cont.52198
bgti_else.52209:
	add	%v0, %zero, %v1
bgti_cont.52210:
	j	bgti_cont.52198
bgti_else.52207:
	add	%v0, %zero, %v1
bgti_cont.52208:
	j	bgti_cont.52198
bgti_else.52205:
	add	%v0, %zero, %v1
bgti_cont.52206:
	j	bgti_cont.52198
bgti_else.52203:
	add	%v0, %zero, %v1
bgti_cont.52204:
	j	bgti_cont.52198
bgti_else.52201:
	add	%v0, %zero, %v1
bgti_cont.52202:
	j	bgti_cont.52198
bgti_else.52199:
	add	%v0, %zero, %v1
bgti_cont.52200:
	j	bgti_cont.52198
bgti_else.52197:
	add	%v0, %zero, %v1
bgti_cont.52198:
	lw	%v1, 25(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52221
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
	j	bgt_cont.52222
bgt_else.52221:
	sw	%v0, 26(%sp)
	blti	%v1, 10, bgti_else.52223
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52225
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52227
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52229
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52231
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52233
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52235
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52237
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52239
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52241
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52243
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52245
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2632
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.52224
bgti_else.52245:
	add	%v0, %zero, %v1
bgti_cont.52246:
	j	bgti_cont.52224
bgti_else.52243:
	add	%v0, %zero, %v1
bgti_cont.52244:
	j	bgti_cont.52224
bgti_else.52241:
	add	%v0, %zero, %v1
bgti_cont.52242:
	j	bgti_cont.52224
bgti_else.52239:
	add	%v0, %zero, %v1
bgti_cont.52240:
	j	bgti_cont.52224
bgti_else.52237:
	add	%v0, %zero, %v1
bgti_cont.52238:
	j	bgti_cont.52224
bgti_else.52235:
	add	%v0, %zero, %v1
bgti_cont.52236:
	j	bgti_cont.52224
bgti_else.52233:
	add	%v0, %zero, %v1
bgti_cont.52234:
	j	bgti_cont.52224
bgti_else.52231:
	add	%v0, %zero, %v1
bgti_cont.52232:
	j	bgti_cont.52224
bgti_else.52229:
	add	%v0, %zero, %v1
bgti_cont.52230:
	j	bgti_cont.52224
bgti_else.52227:
	add	%v0, %zero, %v1
bgti_cont.52228:
	j	bgti_cont.52224
bgti_else.52225:
	add	%v0, %zero, %v1
bgti_cont.52226:
	j	bgti_cont.52224
bgti_else.52223:
	add	%v0, %zero, %v1
bgti_cont.52224:
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
bgt_cont.52222:
bgt_cont.52188:
	lw	%v0, 21(%sp)
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_print_char
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.52247
	blti	%v0, 0, bgti_else.52249
	j	bgt_cont.52248
bgti_else.52249:
	addi	%v0, %zero, 0
bgti_cont.52250:
	j	bgt_cont.52248
bgt_else.52247:
	addi	%v0, %zero, 255
bgt_cont.52248:
	sw	%v0, 27(%sp)
	blti	%v0, 10, bgti_else.52251
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.52253
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52255
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52257
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	print_int_sub1.2629
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	j	bgti_cont.52252
bgti_else.52257:
	addi	%v0, %zero, 3
bgti_cont.52258:
	j	bgti_cont.52252
bgti_else.52255:
	addi	%v0, %zero, 2
bgti_cont.52256:
	j	bgti_cont.52252
bgti_else.52253:
	addi	%v0, %zero, 1
bgti_cont.52254:
	j	bgti_cont.52252
bgti_else.52251:
	addi	%v0, %zero, 0
bgti_cont.52252:
	lw	%v1, 27(%sp)
	sw	%v0, 28(%sp)
	blti	%v1, 10, bgti_else.52259
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52261
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52263
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52265
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52267
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52269
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52271
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52273
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52275
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52277
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52279
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52281
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	print_int_sub2.2632
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bgti_cont.52260
bgti_else.52281:
	add	%v0, %zero, %v1
bgti_cont.52282:
	j	bgti_cont.52260
bgti_else.52279:
	add	%v0, %zero, %v1
bgti_cont.52280:
	j	bgti_cont.52260
bgti_else.52277:
	add	%v0, %zero, %v1
bgti_cont.52278:
	j	bgti_cont.52260
bgti_else.52275:
	add	%v0, %zero, %v1
bgti_cont.52276:
	j	bgti_cont.52260
bgti_else.52273:
	add	%v0, %zero, %v1
bgti_cont.52274:
	j	bgti_cont.52260
bgti_else.52271:
	add	%v0, %zero, %v1
bgti_cont.52272:
	j	bgti_cont.52260
bgti_else.52269:
	add	%v0, %zero, %v1
bgti_cont.52270:
	j	bgti_cont.52260
bgti_else.52267:
	add	%v0, %zero, %v1
bgti_cont.52268:
	j	bgti_cont.52260
bgti_else.52265:
	add	%v0, %zero, %v1
bgti_cont.52266:
	j	bgti_cont.52260
bgti_else.52263:
	add	%v0, %zero, %v1
bgti_cont.52264:
	j	bgti_cont.52260
bgti_else.52261:
	add	%v0, %zero, %v1
bgti_cont.52262:
	j	bgti_cont.52260
bgti_else.52259:
	add	%v0, %zero, %v1
bgti_cont.52260:
	lw	%v1, 28(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52283
	addi	%v0, %v0, 48
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_print_char
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bgt_cont.52284
bgt_else.52283:
	sw	%v0, 29(%sp)
	blti	%v1, 10, bgti_else.52285
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.52287
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52289
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52291
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	print_int_sub1.2629
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	j	bgti_cont.52286
bgti_else.52291:
	addi	%v0, %zero, 3
bgti_cont.52292:
	j	bgti_cont.52286
bgti_else.52289:
	addi	%v0, %zero, 2
bgti_cont.52290:
	j	bgti_cont.52286
bgti_else.52287:
	addi	%v0, %zero, 1
bgti_cont.52288:
	j	bgti_cont.52286
bgti_else.52285:
	addi	%v0, %zero, 0
bgti_cont.52286:
	lw	%v1, 28(%sp)
	sw	%v0, 30(%sp)
	blti	%v1, 10, bgti_else.52293
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52295
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52297
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52299
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52301
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52303
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52305
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52307
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52309
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52311
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52313
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52315
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)
	addi	%sp, %sp, 32
	jal	print_int_sub2.2632
	addi	%sp, %sp, -32
	lw	%ra, 31(%sp)
	j	bgti_cont.52294
bgti_else.52315:
	add	%v0, %zero, %v1
bgti_cont.52316:
	j	bgti_cont.52294
bgti_else.52313:
	add	%v0, %zero, %v1
bgti_cont.52314:
	j	bgti_cont.52294
bgti_else.52311:
	add	%v0, %zero, %v1
bgti_cont.52312:
	j	bgti_cont.52294
bgti_else.52309:
	add	%v0, %zero, %v1
bgti_cont.52310:
	j	bgti_cont.52294
bgti_else.52307:
	add	%v0, %zero, %v1
bgti_cont.52308:
	j	bgti_cont.52294
bgti_else.52305:
	add	%v0, %zero, %v1
bgti_cont.52306:
	j	bgti_cont.52294
bgti_else.52303:
	add	%v0, %zero, %v1
bgti_cont.52304:
	j	bgti_cont.52294
bgti_else.52301:
	add	%v0, %zero, %v1
bgti_cont.52302:
	j	bgti_cont.52294
bgti_else.52299:
	add	%v0, %zero, %v1
bgti_cont.52300:
	j	bgti_cont.52294
bgti_else.52297:
	add	%v0, %zero, %v1
bgti_cont.52298:
	j	bgti_cont.52294
bgti_else.52295:
	add	%v0, %zero, %v1
bgti_cont.52296:
	j	bgti_cont.52294
bgti_else.52293:
	add	%v0, %zero, %v1
bgti_cont.52294:
	lw	%v1, 30(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52317
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
	j	bgt_cont.52318
bgt_else.52317:
	sw	%v0, 31(%sp)
	blti	%v1, 10, bgti_else.52319
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52321
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52323
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52325
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52327
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52329
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52331
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52333
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52335
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52337
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52339
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52341
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	print_int_sub2.2632
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	j	bgti_cont.52320
bgti_else.52341:
	add	%v0, %zero, %v1
bgti_cont.52342:
	j	bgti_cont.52320
bgti_else.52339:
	add	%v0, %zero, %v1
bgti_cont.52340:
	j	bgti_cont.52320
bgti_else.52337:
	add	%v0, %zero, %v1
bgti_cont.52338:
	j	bgti_cont.52320
bgti_else.52335:
	add	%v0, %zero, %v1
bgti_cont.52336:
	j	bgti_cont.52320
bgti_else.52333:
	add	%v0, %zero, %v1
bgti_cont.52334:
	j	bgti_cont.52320
bgti_else.52331:
	add	%v0, %zero, %v1
bgti_cont.52332:
	j	bgti_cont.52320
bgti_else.52329:
	add	%v0, %zero, %v1
bgti_cont.52330:
	j	bgti_cont.52320
bgti_else.52327:
	add	%v0, %zero, %v1
bgti_cont.52328:
	j	bgti_cont.52320
bgti_else.52325:
	add	%v0, %zero, %v1
bgti_cont.52326:
	j	bgti_cont.52320
bgti_else.52323:
	add	%v0, %zero, %v1
bgti_cont.52324:
	j	bgti_cont.52320
bgti_else.52321:
	add	%v0, %zero, %v1
bgti_cont.52322:
	j	bgti_cont.52320
bgti_else.52319:
	add	%v0, %zero, %v1
bgti_cont.52320:
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
bgt_cont.52318:
bgt_cont.52284:
	lw	%v0, 15(%sp)
	sw	%ra, 32(%sp)
	addi	%sp, %sp, 33
	jal	min_caml_print_char
	addi	%sp, %sp, -33
	lw	%ra, 32(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%v1, 7(%sp)
	blt	%v0, %v1, bgt_else.52343
	jr	%ra
bgt_else.52343:
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
	blt	%a2, %a3, bgt_else.52345
	addi	%v1, %zero, 0
	j	bgt_cont.52346
bgt_else.52345:
	lw	%a2, 3(%sp)
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.52347
	addi	%v1, %zero, 0
	j	bgt_cont.52348
bgt_else.52347:
	addi	%a3, %v0, 1
	blt	%a3, %v1, bgt_else.52349
	addi	%v1, %zero, 0
	j	bgt_cont.52350
bgt_else.52349:
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.52351
	addi	%v1, %zero, 0
	j	bgt_cont.52352
bgt_else.52351:
	addi	%v1, %zero, 1
bgt_cont.52352:
bgt_cont.52350:
bgt_cont.52348:
bgt_cont.52346:
	sw	%v0, 32(%sp)
	beqi	%v1, 0, bnei_else.52353
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	lw	%a2, 0(%sp)
	lw	%a3, 2(%sp)
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	try_exploit_neighbors.3018
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
	j	bnei_cont.52354
bnei_else.52353:
	lw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 33(%sp)
	addi	%sp, %sp, 34
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -34
	lw	%ra, 33(%sp)
bnei_cont.52354:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.52355
	blti	%v0, 0, bgti_else.52357
	j	bgt_cont.52356
bgti_else.52357:
	addi	%v0, %zero, 0
bgti_cont.52358:
	j	bgt_cont.52356
bgt_else.52355:
	addi	%v0, %zero, 255
bgt_cont.52356:
	sw	%v0, 33(%sp)
	blti	%v0, 10, bgti_else.52359
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.52361
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52363
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 34(%sp)
	addi	%sp, %sp, 35
	jal	print_int_sub1.2629
	addi	%sp, %sp, -35
	lw	%ra, 34(%sp)
	j	bgti_cont.52360
bgti_else.52363:
	addi	%v0, %zero, 2
bgti_cont.52364:
	j	bgti_cont.52360
bgti_else.52361:
	addi	%v0, %zero, 1
bgti_cont.52362:
	j	bgti_cont.52360
bgti_else.52359:
	addi	%v0, %zero, 0
bgti_cont.52360:
	lw	%v1, 33(%sp)
	sw	%v0, 34(%sp)
	blti	%v1, 10, bgti_else.52365
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52367
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52369
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52371
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52373
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52375
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52377
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52379
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52381
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52383
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52385
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	print_int_sub2.2632
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	bgti_cont.52366
bgti_else.52385:
	add	%v0, %zero, %v1
bgti_cont.52386:
	j	bgti_cont.52366
bgti_else.52383:
	add	%v0, %zero, %v1
bgti_cont.52384:
	j	bgti_cont.52366
bgti_else.52381:
	add	%v0, %zero, %v1
bgti_cont.52382:
	j	bgti_cont.52366
bgti_else.52379:
	add	%v0, %zero, %v1
bgti_cont.52380:
	j	bgti_cont.52366
bgti_else.52377:
	add	%v0, %zero, %v1
bgti_cont.52378:
	j	bgti_cont.52366
bgti_else.52375:
	add	%v0, %zero, %v1
bgti_cont.52376:
	j	bgti_cont.52366
bgti_else.52373:
	add	%v0, %zero, %v1
bgti_cont.52374:
	j	bgti_cont.52366
bgti_else.52371:
	add	%v0, %zero, %v1
bgti_cont.52372:
	j	bgti_cont.52366
bgti_else.52369:
	add	%v0, %zero, %v1
bgti_cont.52370:
	j	bgti_cont.52366
bgti_else.52367:
	add	%v0, %zero, %v1
bgti_cont.52368:
	j	bgti_cont.52366
bgti_else.52365:
	add	%v0, %zero, %v1
bgti_cont.52366:
	lw	%v1, 34(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52387
	addi	%v0, %v0, 48
	sw	%ra, 35(%sp)
	addi	%sp, %sp, 36
	jal	min_caml_print_char
	addi	%sp, %sp, -36
	lw	%ra, 35(%sp)
	j	bgt_cont.52388
bgt_else.52387:
	sw	%v0, 35(%sp)
	blti	%v1, 10, bgti_else.52389
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.52391
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52393
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	print_int_sub1.2629
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	j	bgti_cont.52390
bgti_else.52393:
	addi	%v0, %zero, 2
bgti_cont.52394:
	j	bgti_cont.52390
bgti_else.52391:
	addi	%v0, %zero, 1
bgti_cont.52392:
	j	bgti_cont.52390
bgti_else.52389:
	addi	%v0, %zero, 0
bgti_cont.52390:
	lw	%v1, 34(%sp)
	sw	%v0, 36(%sp)
	blti	%v1, 10, bgti_else.52395
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52397
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52399
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52401
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52403
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52405
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52407
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52409
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52411
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52413
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52415
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	print_int_sub2.2632
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	j	bgti_cont.52396
bgti_else.52415:
	add	%v0, %zero, %v1
bgti_cont.52416:
	j	bgti_cont.52396
bgti_else.52413:
	add	%v0, %zero, %v1
bgti_cont.52414:
	j	bgti_cont.52396
bgti_else.52411:
	add	%v0, %zero, %v1
bgti_cont.52412:
	j	bgti_cont.52396
bgti_else.52409:
	add	%v0, %zero, %v1
bgti_cont.52410:
	j	bgti_cont.52396
bgti_else.52407:
	add	%v0, %zero, %v1
bgti_cont.52408:
	j	bgti_cont.52396
bgti_else.52405:
	add	%v0, %zero, %v1
bgti_cont.52406:
	j	bgti_cont.52396
bgti_else.52403:
	add	%v0, %zero, %v1
bgti_cont.52404:
	j	bgti_cont.52396
bgti_else.52401:
	add	%v0, %zero, %v1
bgti_cont.52402:
	j	bgti_cont.52396
bgti_else.52399:
	add	%v0, %zero, %v1
bgti_cont.52400:
	j	bgti_cont.52396
bgti_else.52397:
	add	%v0, %zero, %v1
bgti_cont.52398:
	j	bgti_cont.52396
bgti_else.52395:
	add	%v0, %zero, %v1
bgti_cont.52396:
	lw	%v1, 36(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52417
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
	j	bgt_cont.52418
bgt_else.52417:
	sw	%v0, 37(%sp)
	blti	%v1, 10, bgti_else.52419
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52421
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52423
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52425
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52427
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52429
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52431
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52433
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52435
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52437
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52439
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	print_int_sub2.2632
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	j	bgti_cont.52420
bgti_else.52439:
	add	%v0, %zero, %v1
bgti_cont.52440:
	j	bgti_cont.52420
bgti_else.52437:
	add	%v0, %zero, %v1
bgti_cont.52438:
	j	bgti_cont.52420
bgti_else.52435:
	add	%v0, %zero, %v1
bgti_cont.52436:
	j	bgti_cont.52420
bgti_else.52433:
	add	%v0, %zero, %v1
bgti_cont.52434:
	j	bgti_cont.52420
bgti_else.52431:
	add	%v0, %zero, %v1
bgti_cont.52432:
	j	bgti_cont.52420
bgti_else.52429:
	add	%v0, %zero, %v1
bgti_cont.52430:
	j	bgti_cont.52420
bgti_else.52427:
	add	%v0, %zero, %v1
bgti_cont.52428:
	j	bgti_cont.52420
bgti_else.52425:
	add	%v0, %zero, %v1
bgti_cont.52426:
	j	bgti_cont.52420
bgti_else.52423:
	add	%v0, %zero, %v1
bgti_cont.52424:
	j	bgti_cont.52420
bgti_else.52421:
	add	%v0, %zero, %v1
bgti_cont.52422:
	j	bgti_cont.52420
bgti_else.52419:
	add	%v0, %zero, %v1
bgti_cont.52420:
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
bgt_cont.52418:
bgt_cont.52388:
	lw	%v0, 21(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_print_char
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	flw	%f0, 152(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.52441
	blti	%v0, 0, bgti_else.52443
	j	bgt_cont.52442
bgti_else.52443:
	addi	%v0, %zero, 0
bgti_cont.52444:
	j	bgt_cont.52442
bgt_else.52441:
	addi	%v0, %zero, 255
bgt_cont.52442:
	sw	%v0, 38(%sp)
	blti	%v0, 10, bgti_else.52445
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.52447
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52449
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	print_int_sub1.2629
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	j	bgti_cont.52446
bgti_else.52449:
	addi	%v0, %zero, 2
bgti_cont.52450:
	j	bgti_cont.52446
bgti_else.52447:
	addi	%v0, %zero, 1
bgti_cont.52448:
	j	bgti_cont.52446
bgti_else.52445:
	addi	%v0, %zero, 0
bgti_cont.52446:
	lw	%v1, 38(%sp)
	sw	%v0, 39(%sp)
	blti	%v1, 10, bgti_else.52451
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52453
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52455
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52457
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52459
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52461
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52463
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52465
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52467
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52469
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52471
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	print_int_sub2.2632
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	bgti_cont.52452
bgti_else.52471:
	add	%v0, %zero, %v1
bgti_cont.52472:
	j	bgti_cont.52452
bgti_else.52469:
	add	%v0, %zero, %v1
bgti_cont.52470:
	j	bgti_cont.52452
bgti_else.52467:
	add	%v0, %zero, %v1
bgti_cont.52468:
	j	bgti_cont.52452
bgti_else.52465:
	add	%v0, %zero, %v1
bgti_cont.52466:
	j	bgti_cont.52452
bgti_else.52463:
	add	%v0, %zero, %v1
bgti_cont.52464:
	j	bgti_cont.52452
bgti_else.52461:
	add	%v0, %zero, %v1
bgti_cont.52462:
	j	bgti_cont.52452
bgti_else.52459:
	add	%v0, %zero, %v1
bgti_cont.52460:
	j	bgti_cont.52452
bgti_else.52457:
	add	%v0, %zero, %v1
bgti_cont.52458:
	j	bgti_cont.52452
bgti_else.52455:
	add	%v0, %zero, %v1
bgti_cont.52456:
	j	bgti_cont.52452
bgti_else.52453:
	add	%v0, %zero, %v1
bgti_cont.52454:
	j	bgti_cont.52452
bgti_else.52451:
	add	%v0, %zero, %v1
bgti_cont.52452:
	lw	%v1, 39(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52473
	addi	%v0, %v0, 48
	sw	%ra, 40(%sp)
	addi	%sp, %sp, 41
	jal	min_caml_print_char
	addi	%sp, %sp, -41
	lw	%ra, 40(%sp)
	j	bgt_cont.52474
bgt_else.52473:
	sw	%v0, 40(%sp)
	blti	%v1, 10, bgti_else.52475
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.52477
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52479
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 41(%sp)
	addi	%sp, %sp, 42
	jal	print_int_sub1.2629
	addi	%sp, %sp, -42
	lw	%ra, 41(%sp)
	j	bgti_cont.52476
bgti_else.52479:
	addi	%v0, %zero, 2
bgti_cont.52480:
	j	bgti_cont.52476
bgti_else.52477:
	addi	%v0, %zero, 1
bgti_cont.52478:
	j	bgti_cont.52476
bgti_else.52475:
	addi	%v0, %zero, 0
bgti_cont.52476:
	lw	%v1, 39(%sp)
	sw	%v0, 41(%sp)
	blti	%v1, 10, bgti_else.52481
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52483
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52485
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52487
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52489
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52491
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52493
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52495
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52497
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52499
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52501
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)
	addi	%sp, %sp, 43
	jal	print_int_sub2.2632
	addi	%sp, %sp, -43
	lw	%ra, 42(%sp)
	j	bgti_cont.52482
bgti_else.52501:
	add	%v0, %zero, %v1
bgti_cont.52502:
	j	bgti_cont.52482
bgti_else.52499:
	add	%v0, %zero, %v1
bgti_cont.52500:
	j	bgti_cont.52482
bgti_else.52497:
	add	%v0, %zero, %v1
bgti_cont.52498:
	j	bgti_cont.52482
bgti_else.52495:
	add	%v0, %zero, %v1
bgti_cont.52496:
	j	bgti_cont.52482
bgti_else.52493:
	add	%v0, %zero, %v1
bgti_cont.52494:
	j	bgti_cont.52482
bgti_else.52491:
	add	%v0, %zero, %v1
bgti_cont.52492:
	j	bgti_cont.52482
bgti_else.52489:
	add	%v0, %zero, %v1
bgti_cont.52490:
	j	bgti_cont.52482
bgti_else.52487:
	add	%v0, %zero, %v1
bgti_cont.52488:
	j	bgti_cont.52482
bgti_else.52485:
	add	%v0, %zero, %v1
bgti_cont.52486:
	j	bgti_cont.52482
bgti_else.52483:
	add	%v0, %zero, %v1
bgti_cont.52484:
	j	bgti_cont.52482
bgti_else.52481:
	add	%v0, %zero, %v1
bgti_cont.52482:
	lw	%v1, 41(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52503
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
	j	bgt_cont.52504
bgt_else.52503:
	sw	%v0, 42(%sp)
	blti	%v1, 10, bgti_else.52505
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52507
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52509
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52511
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52513
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52515
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52517
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52519
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52521
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52523
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52525
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	print_int_sub2.2632
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	j	bgti_cont.52506
bgti_else.52525:
	add	%v0, %zero, %v1
bgti_cont.52526:
	j	bgti_cont.52506
bgti_else.52523:
	add	%v0, %zero, %v1
bgti_cont.52524:
	j	bgti_cont.52506
bgti_else.52521:
	add	%v0, %zero, %v1
bgti_cont.52522:
	j	bgti_cont.52506
bgti_else.52519:
	add	%v0, %zero, %v1
bgti_cont.52520:
	j	bgti_cont.52506
bgti_else.52517:
	add	%v0, %zero, %v1
bgti_cont.52518:
	j	bgti_cont.52506
bgti_else.52515:
	add	%v0, %zero, %v1
bgti_cont.52516:
	j	bgti_cont.52506
bgti_else.52513:
	add	%v0, %zero, %v1
bgti_cont.52514:
	j	bgti_cont.52506
bgti_else.52511:
	add	%v0, %zero, %v1
bgti_cont.52512:
	j	bgti_cont.52506
bgti_else.52509:
	add	%v0, %zero, %v1
bgti_cont.52510:
	j	bgti_cont.52506
bgti_else.52507:
	add	%v0, %zero, %v1
bgti_cont.52508:
	j	bgti_cont.52506
bgti_else.52505:
	add	%v0, %zero, %v1
bgti_cont.52506:
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
bgt_cont.52504:
bgt_cont.52474:
	lw	%v0, 21(%sp)
	sw	%ra, 43(%sp)
	addi	%sp, %sp, 44
	jal	min_caml_print_char
	addi	%sp, %sp, -44
	lw	%ra, 43(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.52527
	blti	%v0, 0, bgti_else.52529
	j	bgt_cont.52528
bgti_else.52529:
	addi	%v0, %zero, 0
bgti_cont.52530:
	j	bgt_cont.52528
bgt_else.52527:
	addi	%v0, %zero, 255
bgt_cont.52528:
	sw	%v0, 43(%sp)
	blti	%v0, 10, bgti_else.52531
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.52533
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52535
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 45
	jal	print_int_sub1.2629
	addi	%sp, %sp, -45
	lw	%ra, 44(%sp)
	j	bgti_cont.52532
bgti_else.52535:
	addi	%v0, %zero, 2
bgti_cont.52536:
	j	bgti_cont.52532
bgti_else.52533:
	addi	%v0, %zero, 1
bgti_cont.52534:
	j	bgti_cont.52532
bgti_else.52531:
	addi	%v0, %zero, 0
bgti_cont.52532:
	lw	%v1, 43(%sp)
	sw	%v0, 44(%sp)
	blti	%v1, 10, bgti_else.52537
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52539
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52541
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52543
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52545
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52547
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52549
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52551
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52553
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52555
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52557
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	print_int_sub2.2632
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	j	bgti_cont.52538
bgti_else.52557:
	add	%v0, %zero, %v1
bgti_cont.52558:
	j	bgti_cont.52538
bgti_else.52555:
	add	%v0, %zero, %v1
bgti_cont.52556:
	j	bgti_cont.52538
bgti_else.52553:
	add	%v0, %zero, %v1
bgti_cont.52554:
	j	bgti_cont.52538
bgti_else.52551:
	add	%v0, %zero, %v1
bgti_cont.52552:
	j	bgti_cont.52538
bgti_else.52549:
	add	%v0, %zero, %v1
bgti_cont.52550:
	j	bgti_cont.52538
bgti_else.52547:
	add	%v0, %zero, %v1
bgti_cont.52548:
	j	bgti_cont.52538
bgti_else.52545:
	add	%v0, %zero, %v1
bgti_cont.52546:
	j	bgti_cont.52538
bgti_else.52543:
	add	%v0, %zero, %v1
bgti_cont.52544:
	j	bgti_cont.52538
bgti_else.52541:
	add	%v0, %zero, %v1
bgti_cont.52542:
	j	bgti_cont.52538
bgti_else.52539:
	add	%v0, %zero, %v1
bgti_cont.52540:
	j	bgti_cont.52538
bgti_else.52537:
	add	%v0, %zero, %v1
bgti_cont.52538:
	lw	%v1, 44(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52559
	addi	%v0, %v0, 48
	sw	%ra, 45(%sp)
	addi	%sp, %sp, 46
	jal	min_caml_print_char
	addi	%sp, %sp, -46
	lw	%ra, 45(%sp)
	j	bgt_cont.52560
bgt_else.52559:
	sw	%v0, 45(%sp)
	blti	%v1, 10, bgti_else.52561
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.52563
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.52565
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 46(%sp)
	addi	%sp, %sp, 47
	jal	print_int_sub1.2629
	addi	%sp, %sp, -47
	lw	%ra, 46(%sp)
	j	bgti_cont.52562
bgti_else.52565:
	addi	%v0, %zero, 2
bgti_cont.52566:
	j	bgti_cont.52562
bgti_else.52563:
	addi	%v0, %zero, 1
bgti_cont.52564:
	j	bgti_cont.52562
bgti_else.52561:
	addi	%v0, %zero, 0
bgti_cont.52562:
	lw	%v1, 44(%sp)
	sw	%v0, 46(%sp)
	blti	%v1, 10, bgti_else.52567
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52569
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52571
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52573
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52575
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52577
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52579
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52581
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52583
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52585
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52587
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 47(%sp)
	addi	%sp, %sp, 48
	jal	print_int_sub2.2632
	addi	%sp, %sp, -48
	lw	%ra, 47(%sp)
	j	bgti_cont.52568
bgti_else.52587:
	add	%v0, %zero, %v1
bgti_cont.52588:
	j	bgti_cont.52568
bgti_else.52585:
	add	%v0, %zero, %v1
bgti_cont.52586:
	j	bgti_cont.52568
bgti_else.52583:
	add	%v0, %zero, %v1
bgti_cont.52584:
	j	bgti_cont.52568
bgti_else.52581:
	add	%v0, %zero, %v1
bgti_cont.52582:
	j	bgti_cont.52568
bgti_else.52579:
	add	%v0, %zero, %v1
bgti_cont.52580:
	j	bgti_cont.52568
bgti_else.52577:
	add	%v0, %zero, %v1
bgti_cont.52578:
	j	bgti_cont.52568
bgti_else.52575:
	add	%v0, %zero, %v1
bgti_cont.52576:
	j	bgti_cont.52568
bgti_else.52573:
	add	%v0, %zero, %v1
bgti_cont.52574:
	j	bgti_cont.52568
bgti_else.52571:
	add	%v0, %zero, %v1
bgti_cont.52572:
	j	bgti_cont.52568
bgti_else.52569:
	add	%v0, %zero, %v1
bgti_cont.52570:
	j	bgti_cont.52568
bgti_else.52567:
	add	%v0, %zero, %v1
bgti_cont.52568:
	lw	%v1, 46(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.52589
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
	j	bgt_cont.52590
bgt_else.52589:
	sw	%v0, 47(%sp)
	blti	%v1, 10, bgti_else.52591
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52593
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52595
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52597
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52599
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52601
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52603
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52605
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52607
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52609
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.52611
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 48(%sp)
	addi	%sp, %sp, 49
	jal	print_int_sub2.2632
	addi	%sp, %sp, -49
	lw	%ra, 48(%sp)
	j	bgti_cont.52592
bgti_else.52611:
	add	%v0, %zero, %v1
bgti_cont.52612:
	j	bgti_cont.52592
bgti_else.52609:
	add	%v0, %zero, %v1
bgti_cont.52610:
	j	bgti_cont.52592
bgti_else.52607:
	add	%v0, %zero, %v1
bgti_cont.52608:
	j	bgti_cont.52592
bgti_else.52605:
	add	%v0, %zero, %v1
bgti_cont.52606:
	j	bgti_cont.52592
bgti_else.52603:
	add	%v0, %zero, %v1
bgti_cont.52604:
	j	bgti_cont.52592
bgti_else.52601:
	add	%v0, %zero, %v1
bgti_cont.52602:
	j	bgti_cont.52592
bgti_else.52599:
	add	%v0, %zero, %v1
bgti_cont.52600:
	j	bgti_cont.52592
bgti_else.52597:
	add	%v0, %zero, %v1
bgti_cont.52598:
	j	bgti_cont.52592
bgti_else.52595:
	add	%v0, %zero, %v1
bgti_cont.52596:
	j	bgti_cont.52592
bgti_else.52593:
	add	%v0, %zero, %v1
bgti_cont.52594:
	j	bgti_cont.52592
bgti_else.52591:
	add	%v0, %zero, %v1
bgti_cont.52592:
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
bgt_cont.52590:
bgt_cont.52560:
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
	blt	%v0, %t0, bgt_else.53177
	jr	%ra
bgt_else.53177:
	addi	%t1, %t0, -1
	sw	%t1, 0(%sp)
	sw	%a2, 1(%sp)
	sw	%a3, 2(%sp)
	sw	%a1, 3(%sp)
	sw	%v1, 4(%sp)
	sw	%t0, 5(%sp)
	sw	%v0, 6(%sp)
	sw	%a0, 7(%sp)
	blt	%v0, %t1, bgt_else.53179
	j	bgt_cont.53180
bgt_else.53179:
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
bgt_cont.53180:
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	sw	%v1, 8(%sp)
	sw	%v0, 9(%sp)
	addi	%at, %zero, 0
	blt	%at, %v0, bgt_else.53181
	j	bgt_cont.53182
bgt_else.53181:
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
	blt	%a3, %t0, bgt_else.53183
	addi	%a3, %zero, 0
	j	bgt_cont.53184
bgt_else.53183:
	addi	%at, %zero, 0
	blt	%at, %a2, bgt_else.53185
	addi	%a3, %zero, 0
	j	bgt_cont.53186
bgt_else.53185:
	addi	%at, %zero, 1
	blt	%at, %v0, bgt_else.53187
	addi	%a3, %zero, 0
	j	bgt_cont.53188
bgt_else.53187:
	addi	%a3, %zero, 0
bgt_cont.53188:
bgt_cont.53186:
bgt_cont.53184:
	beqi	%a3, 0, bnei_else.53189
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
	j	bnei_cont.53190
bnei_else.53189:
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)
	addi	%sp, %sp, 11
	jal	do_without_neighbors.3002
	addi	%sp, %sp, -11
	lw	%ra, 10(%sp)
bnei_cont.53190:
	flw	%f0, 151(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.53191
	blti	%v0, 0, bgti_else.53193
	j	bgt_cont.53192
bgti_else.53193:
	addi	%v0, %zero, 0
bgti_cont.53194:
	j	bgt_cont.53192
bgt_else.53191:
	addi	%v0, %zero, 255
bgt_cont.53192:
	addi	%v1, %zero, 10
	sw	%v1, 10(%sp)
	sw	%v0, 11(%sp)
	blti	%v0, 10, bgti_else.53195
	addi	%a0, %v0, -10
	blti	%a0, 10, bgti_else.53197
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.53199
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	print_int_sub1.2629
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	j	bgti_cont.53196
bgti_else.53199:
	addi	%v0, %zero, 2
bgti_cont.53200:
	j	bgti_cont.53196
bgti_else.53197:
	addi	%v0, %zero, 1
bgti_cont.53198:
	j	bgti_cont.53196
bgti_else.53195:
	addi	%v0, %zero, 0
bgti_cont.53196:
	lw	%v1, 11(%sp)
	sw	%v0, 12(%sp)
	blti	%v1, 10, bgti_else.53201
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53203
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53205
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53207
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53209
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53211
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53213
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53215
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53217
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53219
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53221
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	print_int_sub2.2632
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgti_cont.53202
bgti_else.53221:
	add	%v0, %zero, %v1
bgti_cont.53222:
	j	bgti_cont.53202
bgti_else.53219:
	add	%v0, %zero, %v1
bgti_cont.53220:
	j	bgti_cont.53202
bgti_else.53217:
	add	%v0, %zero, %v1
bgti_cont.53218:
	j	bgti_cont.53202
bgti_else.53215:
	add	%v0, %zero, %v1
bgti_cont.53216:
	j	bgti_cont.53202
bgti_else.53213:
	add	%v0, %zero, %v1
bgti_cont.53214:
	j	bgti_cont.53202
bgti_else.53211:
	add	%v0, %zero, %v1
bgti_cont.53212:
	j	bgti_cont.53202
bgti_else.53209:
	add	%v0, %zero, %v1
bgti_cont.53210:
	j	bgti_cont.53202
bgti_else.53207:
	add	%v0, %zero, %v1
bgti_cont.53208:
	j	bgti_cont.53202
bgti_else.53205:
	add	%v0, %zero, %v1
bgti_cont.53206:
	j	bgti_cont.53202
bgti_else.53203:
	add	%v0, %zero, %v1
bgti_cont.53204:
	j	bgti_cont.53202
bgti_else.53201:
	add	%v0, %zero, %v1
bgti_cont.53202:
	lw	%v1, 12(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.53223
	addi	%v0, %v0, 48
	sw	%ra, 13(%sp)
	addi	%sp, %sp, 14
	jal	min_caml_print_char
	addi	%sp, %sp, -14
	lw	%ra, 13(%sp)
	j	bgt_cont.53224
bgt_else.53223:
	sw	%v0, 13(%sp)
	blti	%v1, 10, bgti_else.53225
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.53227
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.53229
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	print_int_sub1.2629
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	j	bgti_cont.53226
bgti_else.53229:
	addi	%v0, %zero, 2
bgti_cont.53230:
	j	bgti_cont.53226
bgti_else.53227:
	addi	%v0, %zero, 1
bgti_cont.53228:
	j	bgti_cont.53226
bgti_else.53225:
	addi	%v0, %zero, 0
bgti_cont.53226:
	lw	%v1, 12(%sp)
	sw	%v0, 14(%sp)
	blti	%v1, 10, bgti_else.53231
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53233
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53235
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53237
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53239
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53241
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53243
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53245
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53247
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53249
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53251
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub2.2632
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	bgti_cont.53232
bgti_else.53251:
	add	%v0, %zero, %v1
bgti_cont.53252:
	j	bgti_cont.53232
bgti_else.53249:
	add	%v0, %zero, %v1
bgti_cont.53250:
	j	bgti_cont.53232
bgti_else.53247:
	add	%v0, %zero, %v1
bgti_cont.53248:
	j	bgti_cont.53232
bgti_else.53245:
	add	%v0, %zero, %v1
bgti_cont.53246:
	j	bgti_cont.53232
bgti_else.53243:
	add	%v0, %zero, %v1
bgti_cont.53244:
	j	bgti_cont.53232
bgti_else.53241:
	add	%v0, %zero, %v1
bgti_cont.53242:
	j	bgti_cont.53232
bgti_else.53239:
	add	%v0, %zero, %v1
bgti_cont.53240:
	j	bgti_cont.53232
bgti_else.53237:
	add	%v0, %zero, %v1
bgti_cont.53238:
	j	bgti_cont.53232
bgti_else.53235:
	add	%v0, %zero, %v1
bgti_cont.53236:
	j	bgti_cont.53232
bgti_else.53233:
	add	%v0, %zero, %v1
bgti_cont.53234:
	j	bgti_cont.53232
bgti_else.53231:
	add	%v0, %zero, %v1
bgti_cont.53232:
	lw	%v1, 14(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.53253
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
	j	bgt_cont.53254
bgt_else.53253:
	sw	%v0, 15(%sp)
	blti	%v1, 10, bgti_else.53255
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53257
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53259
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53261
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53263
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53265
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53267
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53269
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53271
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53273
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53275
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 16(%sp)
	addi	%sp, %sp, 17
	jal	print_int_sub2.2632
	addi	%sp, %sp, -17
	lw	%ra, 16(%sp)
	j	bgti_cont.53256
bgti_else.53275:
	add	%v0, %zero, %v1
bgti_cont.53276:
	j	bgti_cont.53256
bgti_else.53273:
	add	%v0, %zero, %v1
bgti_cont.53274:
	j	bgti_cont.53256
bgti_else.53271:
	add	%v0, %zero, %v1
bgti_cont.53272:
	j	bgti_cont.53256
bgti_else.53269:
	add	%v0, %zero, %v1
bgti_cont.53270:
	j	bgti_cont.53256
bgti_else.53267:
	add	%v0, %zero, %v1
bgti_cont.53268:
	j	bgti_cont.53256
bgti_else.53265:
	add	%v0, %zero, %v1
bgti_cont.53266:
	j	bgti_cont.53256
bgti_else.53263:
	add	%v0, %zero, %v1
bgti_cont.53264:
	j	bgti_cont.53256
bgti_else.53261:
	add	%v0, %zero, %v1
bgti_cont.53262:
	j	bgti_cont.53256
bgti_else.53259:
	add	%v0, %zero, %v1
bgti_cont.53260:
	j	bgti_cont.53256
bgti_else.53257:
	add	%v0, %zero, %v1
bgti_cont.53258:
	j	bgti_cont.53256
bgti_else.53255:
	add	%v0, %zero, %v1
bgti_cont.53256:
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
bgt_cont.53254:
bgt_cont.53224:
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
	blt	%at, %v0, bgt_else.53277
	blti	%v0, 0, bgti_else.53279
	j	bgt_cont.53278
bgti_else.53279:
	addi	%v0, %zero, 0
bgti_cont.53280:
	j	bgt_cont.53278
bgt_else.53277:
	addi	%v0, %zero, 255
bgt_cont.53278:
	sw	%v0, 17(%sp)
	blti	%v0, 10, bgti_else.53281
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.53283
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53285
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	print_int_sub1.2629
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	j	bgti_cont.53282
bgti_else.53285:
	addi	%v0, %zero, 2
bgti_cont.53286:
	j	bgti_cont.53282
bgti_else.53283:
	addi	%v0, %zero, 1
bgti_cont.53284:
	j	bgti_cont.53282
bgti_else.53281:
	addi	%v0, %zero, 0
bgti_cont.53282:
	lw	%v1, 17(%sp)
	sw	%v0, 18(%sp)
	blti	%v1, 10, bgti_else.53287
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53289
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53291
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53293
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53295
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53297
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53299
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53301
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53303
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53305
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53307
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	print_int_sub2.2632
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgti_cont.53288
bgti_else.53307:
	add	%v0, %zero, %v1
bgti_cont.53308:
	j	bgti_cont.53288
bgti_else.53305:
	add	%v0, %zero, %v1
bgti_cont.53306:
	j	bgti_cont.53288
bgti_else.53303:
	add	%v0, %zero, %v1
bgti_cont.53304:
	j	bgti_cont.53288
bgti_else.53301:
	add	%v0, %zero, %v1
bgti_cont.53302:
	j	bgti_cont.53288
bgti_else.53299:
	add	%v0, %zero, %v1
bgti_cont.53300:
	j	bgti_cont.53288
bgti_else.53297:
	add	%v0, %zero, %v1
bgti_cont.53298:
	j	bgti_cont.53288
bgti_else.53295:
	add	%v0, %zero, %v1
bgti_cont.53296:
	j	bgti_cont.53288
bgti_else.53293:
	add	%v0, %zero, %v1
bgti_cont.53294:
	j	bgti_cont.53288
bgti_else.53291:
	add	%v0, %zero, %v1
bgti_cont.53292:
	j	bgti_cont.53288
bgti_else.53289:
	add	%v0, %zero, %v1
bgti_cont.53290:
	j	bgti_cont.53288
bgti_else.53287:
	add	%v0, %zero, %v1
bgti_cont.53288:
	lw	%v1, 18(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.53309
	addi	%v0, %v0, 48
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_print_char
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	bgt_cont.53310
bgt_else.53309:
	sw	%v0, 19(%sp)
	blti	%v1, 10, bgti_else.53311
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.53313
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.53315
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	print_int_sub1.2629
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.53312
bgti_else.53315:
	addi	%v0, %zero, 2
bgti_cont.53316:
	j	bgti_cont.53312
bgti_else.53313:
	addi	%v0, %zero, 1
bgti_cont.53314:
	j	bgti_cont.53312
bgti_else.53311:
	addi	%v0, %zero, 0
bgti_cont.53312:
	lw	%v1, 18(%sp)
	sw	%v0, 20(%sp)
	blti	%v1, 10, bgti_else.53317
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53319
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53321
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53323
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53325
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53327
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53329
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53331
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53333
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53335
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53337
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)
	addi	%sp, %sp, 22
	jal	print_int_sub2.2632
	addi	%sp, %sp, -22
	lw	%ra, 21(%sp)
	j	bgti_cont.53318
bgti_else.53337:
	add	%v0, %zero, %v1
bgti_cont.53338:
	j	bgti_cont.53318
bgti_else.53335:
	add	%v0, %zero, %v1
bgti_cont.53336:
	j	bgti_cont.53318
bgti_else.53333:
	add	%v0, %zero, %v1
bgti_cont.53334:
	j	bgti_cont.53318
bgti_else.53331:
	add	%v0, %zero, %v1
bgti_cont.53332:
	j	bgti_cont.53318
bgti_else.53329:
	add	%v0, %zero, %v1
bgti_cont.53330:
	j	bgti_cont.53318
bgti_else.53327:
	add	%v0, %zero, %v1
bgti_cont.53328:
	j	bgti_cont.53318
bgti_else.53325:
	add	%v0, %zero, %v1
bgti_cont.53326:
	j	bgti_cont.53318
bgti_else.53323:
	add	%v0, %zero, %v1
bgti_cont.53324:
	j	bgti_cont.53318
bgti_else.53321:
	add	%v0, %zero, %v1
bgti_cont.53322:
	j	bgti_cont.53318
bgti_else.53319:
	add	%v0, %zero, %v1
bgti_cont.53320:
	j	bgti_cont.53318
bgti_else.53317:
	add	%v0, %zero, %v1
bgti_cont.53318:
	lw	%v1, 20(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.53339
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
	j	bgt_cont.53340
bgt_else.53339:
	sw	%v0, 21(%sp)
	blti	%v1, 10, bgti_else.53341
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53343
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53345
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53347
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53349
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53351
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53353
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53355
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53357
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53359
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53361
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	print_int_sub2.2632
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	j	bgti_cont.53342
bgti_else.53361:
	add	%v0, %zero, %v1
bgti_cont.53362:
	j	bgti_cont.53342
bgti_else.53359:
	add	%v0, %zero, %v1
bgti_cont.53360:
	j	bgti_cont.53342
bgti_else.53357:
	add	%v0, %zero, %v1
bgti_cont.53358:
	j	bgti_cont.53342
bgti_else.53355:
	add	%v0, %zero, %v1
bgti_cont.53356:
	j	bgti_cont.53342
bgti_else.53353:
	add	%v0, %zero, %v1
bgti_cont.53354:
	j	bgti_cont.53342
bgti_else.53351:
	add	%v0, %zero, %v1
bgti_cont.53352:
	j	bgti_cont.53342
bgti_else.53349:
	add	%v0, %zero, %v1
bgti_cont.53350:
	j	bgti_cont.53342
bgti_else.53347:
	add	%v0, %zero, %v1
bgti_cont.53348:
	j	bgti_cont.53342
bgti_else.53345:
	add	%v0, %zero, %v1
bgti_cont.53346:
	j	bgti_cont.53342
bgti_else.53343:
	add	%v0, %zero, %v1
bgti_cont.53344:
	j	bgti_cont.53342
bgti_else.53341:
	add	%v0, %zero, %v1
bgti_cont.53342:
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
bgt_cont.53340:
bgt_cont.53310:
	lw	%v0, 16(%sp)
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	min_caml_print_char
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f0, 153(%zero)
	ftoi	%v0, %f0
	addi	%at, %zero, 255
	blt	%at, %v0, bgt_else.53363
	blti	%v0, 0, bgti_else.53365
	j	bgt_cont.53364
bgti_else.53365:
	addi	%v0, %zero, 0
bgti_cont.53366:
	j	bgt_cont.53364
bgt_else.53363:
	addi	%v0, %zero, 255
bgt_cont.53364:
	sw	%v0, 22(%sp)
	blti	%v0, 10, bgti_else.53367
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.53369
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53371
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub1.2629
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	j	bgti_cont.53368
bgti_else.53371:
	addi	%v0, %zero, 2
bgti_cont.53372:
	j	bgti_cont.53368
bgti_else.53369:
	addi	%v0, %zero, 1
bgti_cont.53370:
	j	bgti_cont.53368
bgti_else.53367:
	addi	%v0, %zero, 0
bgti_cont.53368:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	blti	%v1, 10, bgti_else.53373
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53375
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53377
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53379
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53381
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53383
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53385
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53387
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53389
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53391
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53393
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	print_int_sub2.2632
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgti_cont.53374
bgti_else.53393:
	add	%v0, %zero, %v1
bgti_cont.53394:
	j	bgti_cont.53374
bgti_else.53391:
	add	%v0, %zero, %v1
bgti_cont.53392:
	j	bgti_cont.53374
bgti_else.53389:
	add	%v0, %zero, %v1
bgti_cont.53390:
	j	bgti_cont.53374
bgti_else.53387:
	add	%v0, %zero, %v1
bgti_cont.53388:
	j	bgti_cont.53374
bgti_else.53385:
	add	%v0, %zero, %v1
bgti_cont.53386:
	j	bgti_cont.53374
bgti_else.53383:
	add	%v0, %zero, %v1
bgti_cont.53384:
	j	bgti_cont.53374
bgti_else.53381:
	add	%v0, %zero, %v1
bgti_cont.53382:
	j	bgti_cont.53374
bgti_else.53379:
	add	%v0, %zero, %v1
bgti_cont.53380:
	j	bgti_cont.53374
bgti_else.53377:
	add	%v0, %zero, %v1
bgti_cont.53378:
	j	bgti_cont.53374
bgti_else.53375:
	add	%v0, %zero, %v1
bgti_cont.53376:
	j	bgti_cont.53374
bgti_else.53373:
	add	%v0, %zero, %v1
bgti_cont.53374:
	lw	%v1, 23(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.53395
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)
	addi	%sp, %sp, 25
	jal	min_caml_print_char
	addi	%sp, %sp, -25
	lw	%ra, 24(%sp)
	j	bgt_cont.53396
bgt_else.53395:
	sw	%v0, 24(%sp)
	blti	%v1, 10, bgti_else.53397
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.53399
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.53401
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	print_int_sub1.2629
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	bgti_cont.53398
bgti_else.53401:
	addi	%v0, %zero, 2
bgti_cont.53402:
	j	bgti_cont.53398
bgti_else.53399:
	addi	%v0, %zero, 1
bgti_cont.53400:
	j	bgti_cont.53398
bgti_else.53397:
	addi	%v0, %zero, 0
bgti_cont.53398:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	blti	%v1, 10, bgti_else.53403
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53405
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53407
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53409
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53411
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53413
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53415
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53417
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53419
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53421
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53423
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	print_int_sub2.2632
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	j	bgti_cont.53404
bgti_else.53423:
	add	%v0, %zero, %v1
bgti_cont.53424:
	j	bgti_cont.53404
bgti_else.53421:
	add	%v0, %zero, %v1
bgti_cont.53422:
	j	bgti_cont.53404
bgti_else.53419:
	add	%v0, %zero, %v1
bgti_cont.53420:
	j	bgti_cont.53404
bgti_else.53417:
	add	%v0, %zero, %v1
bgti_cont.53418:
	j	bgti_cont.53404
bgti_else.53415:
	add	%v0, %zero, %v1
bgti_cont.53416:
	j	bgti_cont.53404
bgti_else.53413:
	add	%v0, %zero, %v1
bgti_cont.53414:
	j	bgti_cont.53404
bgti_else.53411:
	add	%v0, %zero, %v1
bgti_cont.53412:
	j	bgti_cont.53404
bgti_else.53409:
	add	%v0, %zero, %v1
bgti_cont.53410:
	j	bgti_cont.53404
bgti_else.53407:
	add	%v0, %zero, %v1
bgti_cont.53408:
	j	bgti_cont.53404
bgti_else.53405:
	add	%v0, %zero, %v1
bgti_cont.53406:
	j	bgti_cont.53404
bgti_else.53403:
	add	%v0, %zero, %v1
bgti_cont.53404:
	lw	%v1, 25(%sp)
	addi	%at, %zero, 0
	blt	%at, %v1, bgt_else.53425
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
	j	bgt_cont.53426
bgt_else.53425:
	sw	%v0, 26(%sp)
	blti	%v1, 10, bgti_else.53427
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53429
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53431
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53433
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53435
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53437
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53439
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53441
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53443
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53445
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.53447
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	print_int_sub2.2632
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	bgti_cont.53428
bgti_else.53447:
	add	%v0, %zero, %v1
bgti_cont.53448:
	j	bgti_cont.53428
bgti_else.53445:
	add	%v0, %zero, %v1
bgti_cont.53446:
	j	bgti_cont.53428
bgti_else.53443:
	add	%v0, %zero, %v1
bgti_cont.53444:
	j	bgti_cont.53428
bgti_else.53441:
	add	%v0, %zero, %v1
bgti_cont.53442:
	j	bgti_cont.53428
bgti_else.53439:
	add	%v0, %zero, %v1
bgti_cont.53440:
	j	bgti_cont.53428
bgti_else.53437:
	add	%v0, %zero, %v1
bgti_cont.53438:
	j	bgti_cont.53428
bgti_else.53435:
	add	%v0, %zero, %v1
bgti_cont.53436:
	j	bgti_cont.53428
bgti_else.53433:
	add	%v0, %zero, %v1
bgti_cont.53434:
	j	bgti_cont.53428
bgti_else.53431:
	add	%v0, %zero, %v1
bgti_cont.53432:
	j	bgti_cont.53428
bgti_else.53429:
	add	%v0, %zero, %v1
bgti_cont.53430:
	j	bgti_cont.53428
bgti_else.53427:
	add	%v0, %zero, %v1
bgti_cont.53428:
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
bgt_cont.53426:
bgt_cont.53396:
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
bgt_cont.53182:
	lw	%v0, 6(%sp)
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)
	addi	%v0, %v0, 2
	blti	%v0, 5, bgti_else.53449
	addi	%a0, %v0, -5
	j	bgti_cont.53450
bgti_else.53449:
	add	%a0, %zero, %v0
bgti_cont.53450:
	lw	%v0, 5(%sp)
	blt	%v1, %v0, bgt_else.53451
	jr	%ra
bgt_else.53451:
	lw	%v0, 0(%sp)
	sw	%a0, 27(%sp)
	sw	%v1, 28(%sp)
	blt	%v1, %v0, bgt_else.53453
	j	bgt_cont.53454
bgt_else.53453:
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
bgt_cont.53454:
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
	blti	%v1, 5, bgti_else.53455
	addi	%a2, %v1, -5
	j	bgti_cont.53456
bgti_else.53455:
	add	%a2, %zero, %v1
bgti_cont.53456:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	lw	%a1, 7(%sp)
	j	scan_line.3051
init_line_elements.3061:
	addi	%a0, %zero, 0
	blti	%v1, 0, bgti_else.53762
	addi	%a1, %zero, 3
	flw	%f0, 493(%zero)
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
	blti	%v0, 0, bgti_else.53763
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
	blti	%v0, 0, bgti_else.53764
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
	blti	%v0, 0, bgti_else.53765
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
bgti_else.53765:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.53764:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.53763:
	add	%v0, %zero, %a0
	jr	%ra
bgti_else.53762:
	jr	%ra
calc_dirvec.3071:
	blti	%v0, 5, bgti_else.55012
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 491(%zero)
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
bgti_else.55012:
	fmul	%f0, %f1, %f1
	flw	%f1, 441(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 491(%zero)
	fdiv	%f5, %f4, %f0
	flw	%f6, 493(%zero)
	fblt	%f5, %f6, fbgt_else.55014
	addi	%a1, %zero, 1
	j	fbgt_cont.55015
fbgt_else.55014:
	addi	%a1, %zero, 0
fbgt_cont.55015:
	fabs	%f7, %f5
	flw	%f8, 461(%zero)
	fblt	%f7, %f8, fbgt_else.55016
	flw	%f5, 454(%zero)
	fblt	%f7, %f5, fbgt_else.55018
	flw	%f5, 476(%zero)
	fdiv	%f7, %f4, %f7
	fmul	%f9, %f7, %f7
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fsub	%f12, %f7, %f12
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)
	fmul	%f7, %f12, %f7
	fmul	%f7, %f7, %f10
	fmul	%f7, %f7, %f11
	fadd	%f7, %f9, %f7
	fsub	%f5, %f5, %f7
	j	fbgt_cont.55019
fbgt_else.55018:
	flw	%f5, 475(%zero)
	fsub	%f9, %f7, %f4
	fadd	%f7, %f7, %f4
	fdiv	%f7, %f9, %f7
	fmul	%f9, %f7, %f7
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 460(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fsub	%f12, %f7, %f12
	flw	%f13, 459(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)
	fmul	%f7, %f12, %f7
	fmul	%f7, %f7, %f10
	fmul	%f7, %f7, %f11
	fadd	%f7, %f9, %f7
	fadd	%f5, %f5, %f7
fbgt_cont.55019:
	beqi	%a1, 0, bnei_else.55020
	j	fbgt_cont.55017
bnei_else.55020:
	fneg	%f5, %f5
bnei_cont.55021:
	j	fbgt_cont.55017
fbgt_else.55016:
	fmul	%f7, %f5, %f5
	fmul	%f9, %f7, %f7
	fmul	%f10, %f9, %f9
	flw	%f11, 460(%zero)
	fmul	%f11, %f11, %f5
	fmul	%f11, %f11, %f7
	fsub	%f11, %f5, %f11
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f7, %f12, %f7
	fmul	%f7, %f7, %f10
	fsub	%f7, %f11, %f7
	flw	%f11, 455(%zero)
	fmul	%f5, %f11, %f5
	fmul	%f5, %f5, %f9
	fmul	%f5, %f5, %f10
	fadd	%f5, %f7, %f5
fbgt_cont.55017:
	fmul	%f5, %f5, %f2
	flw	%f7, 489(%zero)
	fblt	%f5, %f6, fbgt_else.55022
	addi	%a1, %zero, 1
	j	fbgt_cont.55023
fbgt_else.55022:
	addi	%a1, %zero, 0
fbgt_cont.55023:
	fabs	%f9, %f5
	flw	%f10, 488(%zero)
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
	fblt	%f9, %f10, fbgt_else.55024
	flw	%f11, 487(%zero)
	fblt	%f9, %f11, fbgt_else.55026
	flw	%f11, 486(%zero)
	fblt	%f9, %f11, fbgt_else.55028
	flw	%f11, 485(%zero)
	fblt	%f9, %f11, fbgt_else.55030
	flw	%f11, 484(%zero)
	fblt	%f9, %f11, fbgt_else.55032
	flw	%f11, 483(%zero)
	fblt	%f9, %f11, fbgt_else.55034
	flw	%f11, 482(%zero)
	fblt	%f9, %f11, fbgt_else.55036
	flw	%f11, 481(%zero)
	fblt	%f9, %f11, fbgt_else.55038
	flw	%f11, 480(%zero)
	fblt	%f9, %f11, fbgt_else.55040
	flw	%f11, 479(%zero)
	fblt	%f9, %f11, fbgt_else.55042
	flw	%f11, 478(%zero)
	fblt	%f9, %f11, fbgt_else.55044
	flw	%f11, 477(%zero)
	fmov	%f1, %f11
	fmov	%f0, %f9
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.55025
fbgt_else.55044:
	fmov	%f0, %f11
fbgt_cont.55045:
	j	fbgt_cont.55025
fbgt_else.55042:
	fmov	%f0, %f11
fbgt_cont.55043:
	j	fbgt_cont.55025
fbgt_else.55040:
	fmov	%f0, %f11
fbgt_cont.55041:
	j	fbgt_cont.55025
fbgt_else.55038:
	fmov	%f0, %f11
fbgt_cont.55039:
	j	fbgt_cont.55025
fbgt_else.55036:
	fmov	%f0, %f11
fbgt_cont.55037:
	j	fbgt_cont.55025
fbgt_else.55034:
	fmov	%f0, %f11
fbgt_cont.55035:
	j	fbgt_cont.55025
fbgt_else.55032:
	fmov	%f0, %f11
fbgt_cont.55033:
	j	fbgt_cont.55025
fbgt_else.55030:
	fmov	%f0, %f11
fbgt_cont.55031:
	j	fbgt_cont.55025
fbgt_else.55028:
	fmov	%f0, %f11
fbgt_cont.55029:
	j	fbgt_cont.55025
fbgt_else.55026:
	fmov	%f0, %f11
fbgt_cont.55027:
	j	fbgt_cont.55025
fbgt_else.55024:
	fmov	%f0, %f10
fbgt_cont.55025:
	flw	%f1, 13(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.55046
	fblt	%f1, %f0, fbgt_else.55048
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55050
	fblt	%f1, %f0, fbgt_else.55052
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55054
	fblt	%f1, %f0, fbgt_else.55056
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
	j	fbgt_cont.55047
fbgt_else.55056:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.55057:
	j	fbgt_cont.55047
fbgt_else.55054:
	fmov	%f0, %f1
fbgt_cont.55055:
	j	fbgt_cont.55047
fbgt_else.55052:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55058
	fblt	%f1, %f0, fbgt_else.55060
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
	j	fbgt_cont.55059
fbgt_else.55060:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.55061:
	j	fbgt_cont.55059
fbgt_else.55058:
	fmov	%f0, %f1
fbgt_cont.55059:
fbgt_cont.55053:
	j	fbgt_cont.55047
fbgt_else.55050:
	fmov	%f0, %f1
fbgt_cont.55051:
	j	fbgt_cont.55047
fbgt_else.55048:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55062
	fblt	%f1, %f0, fbgt_else.55064
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55066
	fblt	%f1, %f0, fbgt_else.55068
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
	j	fbgt_cont.55063
fbgt_else.55068:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.55069:
	j	fbgt_cont.55063
fbgt_else.55066:
	fmov	%f0, %f1
fbgt_cont.55067:
	j	fbgt_cont.55063
fbgt_else.55064:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55070
	fblt	%f1, %f0, fbgt_else.55072
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
	j	fbgt_cont.55071
fbgt_else.55072:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.55073:
	j	fbgt_cont.55071
fbgt_else.55070:
	fmov	%f0, %f1
fbgt_cont.55071:
fbgt_cont.55065:
	j	fbgt_cont.55063
fbgt_else.55062:
	fmov	%f0, %f1
fbgt_cont.55063:
fbgt_cont.55049:
	j	fbgt_cont.55047
fbgt_else.55046:
	fmov	%f0, %f1
fbgt_cont.55047:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.55074
	lw	%v0, 11(%sp)
	beqi	%v0, 0, bnei_else.55076
	addi	%v0, %zero, 0
	j	fbgt_cont.55075
bnei_else.55076:
	addi	%v0, %zero, 1
bnei_cont.55077:
	j	fbgt_cont.55075
fbgt_else.55074:
	lw	%v0, 11(%sp)
fbgt_cont.55075:
	fblt	%f0, %f1, fbgt_else.55078
	fsub	%f0, %f0, %f1
	j	fbgt_cont.55079
fbgt_else.55078:
fbgt_cont.55079:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.55080
	fsub	%f0, %f1, %f0
	j	fbgt_cont.55081
fbgt_else.55080:
fbgt_cont.55081:
	flw	%f3, 475(%zero)
	fblt	%f3, %f0, fbgt_else.55082
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.55083
fbgt_else.55082:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 471(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 10(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 470(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 469(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.55083:
	beqi	%v0, 0, bnei_else.55084
	j	bnei_cont.55085
bnei_else.55084:
	fneg	%f0, %f0
bnei_cont.55085:
	flw	%f4, 9(%sp)
	fabs	%f4, %f4
	flw	%f5, 14(%sp)
	fsw	%f0, 15(%sp)
	fsw	%f3, 16(%sp)
	fsw	%f2, 17(%sp)
	fsw	%f4, 18(%sp)
	fblt	%f4, %f5, fbgt_else.55086
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.55088
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.55090
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.55092
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.55094
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.55096
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.55098
	flw	%f6, 481(%zero)
	fblt	%f4, %f6, fbgt_else.55100
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.55102
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.55104
	flw	%f6, 478(%zero)
	fblt	%f4, %f6, fbgt_else.55106
	flw	%f6, 477(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.55087
fbgt_else.55106:
	fmov	%f0, %f6
fbgt_cont.55107:
	j	fbgt_cont.55087
fbgt_else.55104:
	fmov	%f0, %f6
fbgt_cont.55105:
	j	fbgt_cont.55087
fbgt_else.55102:
	fmov	%f0, %f6
fbgt_cont.55103:
	j	fbgt_cont.55087
fbgt_else.55100:
	fmov	%f0, %f6
fbgt_cont.55101:
	j	fbgt_cont.55087
fbgt_else.55098:
	fmov	%f0, %f6
fbgt_cont.55099:
	j	fbgt_cont.55087
fbgt_else.55096:
	fmov	%f0, %f6
fbgt_cont.55097:
	j	fbgt_cont.55087
fbgt_else.55094:
	fmov	%f0, %f6
fbgt_cont.55095:
	j	fbgt_cont.55087
fbgt_else.55092:
	fmov	%f0, %f6
fbgt_cont.55093:
	j	fbgt_cont.55087
fbgt_else.55090:
	fmov	%f0, %f6
fbgt_cont.55091:
	j	fbgt_cont.55087
fbgt_else.55088:
	fmov	%f0, %f6
fbgt_cont.55089:
	j	fbgt_cont.55087
fbgt_else.55086:
	fmov	%f0, %f5
fbgt_cont.55087:
	flw	%f1, 18(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.55108
	fblt	%f1, %f0, fbgt_else.55110
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55112
	fblt	%f1, %f0, fbgt_else.55114
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55116
	fblt	%f1, %f0, fbgt_else.55118
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
	j	fbgt_cont.55109
fbgt_else.55118:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.55119:
	j	fbgt_cont.55109
fbgt_else.55116:
	fmov	%f0, %f1
fbgt_cont.55117:
	j	fbgt_cont.55109
fbgt_else.55114:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55120
	fblt	%f1, %f0, fbgt_else.55122
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
	j	fbgt_cont.55121
fbgt_else.55122:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.55123:
	j	fbgt_cont.55121
fbgt_else.55120:
	fmov	%f0, %f1
fbgt_cont.55121:
fbgt_cont.55115:
	j	fbgt_cont.55109
fbgt_else.55112:
	fmov	%f0, %f1
fbgt_cont.55113:
	j	fbgt_cont.55109
fbgt_else.55110:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55124
	fblt	%f1, %f0, fbgt_else.55126
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55128
	fblt	%f1, %f0, fbgt_else.55130
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
	j	fbgt_cont.55125
fbgt_else.55130:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.55131:
	j	fbgt_cont.55125
fbgt_else.55128:
	fmov	%f0, %f1
fbgt_cont.55129:
	j	fbgt_cont.55125
fbgt_else.55126:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55132
	fblt	%f1, %f0, fbgt_else.55134
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
	j	fbgt_cont.55133
fbgt_else.55134:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.55135:
	j	fbgt_cont.55133
fbgt_else.55132:
	fmov	%f0, %f1
fbgt_cont.55133:
fbgt_cont.55127:
	j	fbgt_cont.55125
fbgt_else.55124:
	fmov	%f0, %f1
fbgt_cont.55125:
fbgt_cont.55111:
	j	fbgt_cont.55109
fbgt_else.55108:
	fmov	%f0, %f1
fbgt_cont.55109:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.55136
	addi	%v0, %zero, 0
	j	fbgt_cont.55137
fbgt_else.55136:
	addi	%v0, %zero, 1
fbgt_cont.55137:
	fblt	%f0, %f1, fbgt_else.55138
	fsub	%f0, %f0, %f1
	j	fbgt_cont.55139
fbgt_else.55138:
fbgt_cont.55139:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.55140
	beqi	%v0, 0, bnei_else.55142
	addi	%v0, %zero, 0
	j	fbgt_cont.55141
bnei_else.55142:
	addi	%v0, %zero, 1
bnei_cont.55143:
	j	fbgt_cont.55141
fbgt_else.55140:
fbgt_cont.55141:
	fblt	%f0, %f2, fbgt_else.55144
	fsub	%f0, %f1, %f0
	j	fbgt_cont.55145
fbgt_else.55144:
fbgt_cont.55145:
	flw	%f3, 16(%sp)
	fblt	%f3, %f0, fbgt_else.55146
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 471(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 10(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 470(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 469(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.55147
fbgt_else.55146:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.55147:
	beqi	%v0, 0, bnei_else.55148
	j	bnei_cont.55149
bnei_else.55148:
	fneg	%f0, %f0
bnei_cont.55149:
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
	fblt	%f6, %f7, fbgt_else.55150
	addi	%v1, %zero, 1
	j	fbgt_cont.55151
fbgt_else.55150:
	addi	%v1, %zero, 0
fbgt_cont.55151:
	fabs	%f8, %f6
	flw	%f9, 4(%sp)
	fblt	%f8, %f9, fbgt_else.55152
	flw	%f6, 454(%zero)
	fblt	%f8, %f6, fbgt_else.55154
	fdiv	%f6, %f5, %f8
	fmul	%f8, %f6, %f6
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 460(%zero)
	fmul	%f11, %f11, %f6
	fmul	%f11, %f11, %f8
	fsub	%f11, %f6, %f11
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 455(%zero)
	fmul	%f6, %f11, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f10
	fadd	%f6, %f8, %f6
	fsub	%f6, %f2, %f6
	j	fbgt_cont.55155
fbgt_else.55154:
	fsub	%f6, %f8, %f5
	fadd	%f8, %f8, %f5
	fdiv	%f6, %f6, %f8
	fmul	%f8, %f6, %f6
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 460(%zero)
	fmul	%f11, %f11, %f6
	fmul	%f11, %f11, %f8
	fsub	%f11, %f6, %f11
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 455(%zero)
	fmul	%f6, %f11, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f10
	fadd	%f6, %f8, %f6
	fadd	%f6, %f3, %f6
fbgt_cont.55155:
	beqi	%v1, 0, bnei_else.55156
	j	fbgt_cont.55153
bnei_else.55156:
	fneg	%f6, %f6
bnei_cont.55157:
	j	fbgt_cont.55153
fbgt_else.55152:
	fmul	%f8, %f6, %f6
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 460(%zero)
	fmul	%f11, %f11, %f6
	fmul	%f11, %f11, %f8
	fsub	%f11, %f6, %f11
	flw	%f12, 459(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 455(%zero)
	fmul	%f6, %f11, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f10
	fadd	%f6, %f8, %f6
fbgt_cont.55153:
	flw	%f8, 3(%sp)
	fmul	%f6, %f6, %f8
	fblt	%f6, %f7, fbgt_else.55158
	addi	%v1, %zero, 1
	j	fbgt_cont.55159
fbgt_else.55158:
	addi	%v1, %zero, 0
fbgt_cont.55159:
	fabs	%f7, %f6
	flw	%f9, 14(%sp)
	fsw	%f0, 19(%sp)
	sw	%v0, 20(%sp)
	fsw	%f4, 21(%sp)
	fsw	%f6, 22(%sp)
	sw	%v1, 23(%sp)
	fsw	%f7, 24(%sp)
	fblt	%f7, %f9, fbgt_else.55160
	flw	%f10, 487(%zero)
	fblt	%f7, %f10, fbgt_else.55162
	flw	%f10, 486(%zero)
	fblt	%f7, %f10, fbgt_else.55164
	flw	%f10, 485(%zero)
	fblt	%f7, %f10, fbgt_else.55166
	flw	%f10, 484(%zero)
	fblt	%f7, %f10, fbgt_else.55168
	flw	%f10, 483(%zero)
	fblt	%f7, %f10, fbgt_else.55170
	flw	%f10, 482(%zero)
	fblt	%f7, %f10, fbgt_else.55172
	flw	%f10, 481(%zero)
	fblt	%f7, %f10, fbgt_else.55174
	flw	%f10, 480(%zero)
	fblt	%f7, %f10, fbgt_else.55176
	flw	%f10, 479(%zero)
	fblt	%f7, %f10, fbgt_else.55178
	flw	%f10, 478(%zero)
	fblt	%f7, %f10, fbgt_else.55180
	flw	%f10, 477(%zero)
	fmov	%f1, %f10
	fmov	%f0, %f7
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.55161
fbgt_else.55180:
	fmov	%f0, %f10
fbgt_cont.55181:
	j	fbgt_cont.55161
fbgt_else.55178:
	fmov	%f0, %f10
fbgt_cont.55179:
	j	fbgt_cont.55161
fbgt_else.55176:
	fmov	%f0, %f10
fbgt_cont.55177:
	j	fbgt_cont.55161
fbgt_else.55174:
	fmov	%f0, %f10
fbgt_cont.55175:
	j	fbgt_cont.55161
fbgt_else.55172:
	fmov	%f0, %f10
fbgt_cont.55173:
	j	fbgt_cont.55161
fbgt_else.55170:
	fmov	%f0, %f10
fbgt_cont.55171:
	j	fbgt_cont.55161
fbgt_else.55168:
	fmov	%f0, %f10
fbgt_cont.55169:
	j	fbgt_cont.55161
fbgt_else.55166:
	fmov	%f0, %f10
fbgt_cont.55167:
	j	fbgt_cont.55161
fbgt_else.55164:
	fmov	%f0, %f10
fbgt_cont.55165:
	j	fbgt_cont.55161
fbgt_else.55162:
	fmov	%f0, %f10
fbgt_cont.55163:
	j	fbgt_cont.55161
fbgt_else.55160:
	fmov	%f0, %f9
fbgt_cont.55161:
	flw	%f1, 24(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.55182
	fblt	%f1, %f0, fbgt_else.55184
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55186
	fblt	%f1, %f0, fbgt_else.55188
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55190
	fblt	%f1, %f0, fbgt_else.55192
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
	j	fbgt_cont.55183
fbgt_else.55192:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.55193:
	j	fbgt_cont.55183
fbgt_else.55190:
	fmov	%f0, %f1
fbgt_cont.55191:
	j	fbgt_cont.55183
fbgt_else.55188:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55194
	fblt	%f1, %f0, fbgt_else.55196
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
	j	fbgt_cont.55195
fbgt_else.55196:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.55197:
	j	fbgt_cont.55195
fbgt_else.55194:
	fmov	%f0, %f1
fbgt_cont.55195:
fbgt_cont.55189:
	j	fbgt_cont.55183
fbgt_else.55186:
	fmov	%f0, %f1
fbgt_cont.55187:
	j	fbgt_cont.55183
fbgt_else.55184:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55198
	fblt	%f1, %f0, fbgt_else.55200
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55202
	fblt	%f1, %f0, fbgt_else.55204
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
	j	fbgt_cont.55199
fbgt_else.55204:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.55205:
	j	fbgt_cont.55199
fbgt_else.55202:
	fmov	%f0, %f1
fbgt_cont.55203:
	j	fbgt_cont.55199
fbgt_else.55200:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55206
	fblt	%f1, %f0, fbgt_else.55208
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
	j	fbgt_cont.55207
fbgt_else.55208:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.55209:
	j	fbgt_cont.55207
fbgt_else.55206:
	fmov	%f0, %f1
fbgt_cont.55207:
fbgt_cont.55201:
	j	fbgt_cont.55199
fbgt_else.55198:
	fmov	%f0, %f1
fbgt_cont.55199:
fbgt_cont.55185:
	j	fbgt_cont.55183
fbgt_else.55182:
	fmov	%f0, %f1
fbgt_cont.55183:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.55210
	lw	%v0, 23(%sp)
	beqi	%v0, 0, bnei_else.55212
	addi	%v0, %zero, 0
	j	fbgt_cont.55211
bnei_else.55212:
	addi	%v0, %zero, 1
bnei_cont.55213:
	j	fbgt_cont.55211
fbgt_else.55210:
	lw	%v0, 23(%sp)
fbgt_cont.55211:
	fblt	%f0, %f1, fbgt_else.55214
	fsub	%f0, %f0, %f1
	j	fbgt_cont.55215
fbgt_else.55214:
fbgt_cont.55215:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.55216
	fsub	%f0, %f1, %f0
	j	fbgt_cont.55217
fbgt_else.55216:
fbgt_cont.55217:
	flw	%f3, 16(%sp)
	fblt	%f3, %f0, fbgt_else.55218
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.55219
fbgt_else.55218:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 471(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 10(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 470(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 469(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.55219:
	beqi	%v0, 0, bnei_else.55220
	j	bnei_cont.55221
bnei_else.55220:
	fneg	%f0, %f0
bnei_cont.55221:
	flw	%f4, 22(%sp)
	fabs	%f4, %f4
	flw	%f5, 14(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f4, 26(%sp)
	fblt	%f4, %f5, fbgt_else.55222
	flw	%f6, 487(%zero)
	fblt	%f4, %f6, fbgt_else.55224
	flw	%f6, 486(%zero)
	fblt	%f4, %f6, fbgt_else.55226
	flw	%f6, 485(%zero)
	fblt	%f4, %f6, fbgt_else.55228
	flw	%f6, 484(%zero)
	fblt	%f4, %f6, fbgt_else.55230
	flw	%f6, 483(%zero)
	fblt	%f4, %f6, fbgt_else.55232
	flw	%f6, 482(%zero)
	fblt	%f4, %f6, fbgt_else.55234
	flw	%f6, 481(%zero)
	fblt	%f4, %f6, fbgt_else.55236
	flw	%f6, 480(%zero)
	fblt	%f4, %f6, fbgt_else.55238
	flw	%f6, 479(%zero)
	fblt	%f4, %f6, fbgt_else.55240
	flw	%f6, 478(%zero)
	fblt	%f4, %f6, fbgt_else.55242
	flw	%f6, 477(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.55223
fbgt_else.55242:
	fmov	%f0, %f6
fbgt_cont.55243:
	j	fbgt_cont.55223
fbgt_else.55240:
	fmov	%f0, %f6
fbgt_cont.55241:
	j	fbgt_cont.55223
fbgt_else.55238:
	fmov	%f0, %f6
fbgt_cont.55239:
	j	fbgt_cont.55223
fbgt_else.55236:
	fmov	%f0, %f6
fbgt_cont.55237:
	j	fbgt_cont.55223
fbgt_else.55234:
	fmov	%f0, %f6
fbgt_cont.55235:
	j	fbgt_cont.55223
fbgt_else.55232:
	fmov	%f0, %f6
fbgt_cont.55233:
	j	fbgt_cont.55223
fbgt_else.55230:
	fmov	%f0, %f6
fbgt_cont.55231:
	j	fbgt_cont.55223
fbgt_else.55228:
	fmov	%f0, %f6
fbgt_cont.55229:
	j	fbgt_cont.55223
fbgt_else.55226:
	fmov	%f0, %f6
fbgt_cont.55227:
	j	fbgt_cont.55223
fbgt_else.55224:
	fmov	%f0, %f6
fbgt_cont.55225:
	j	fbgt_cont.55223
fbgt_else.55222:
	fmov	%f0, %f5
fbgt_cont.55223:
	flw	%f1, 26(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.55244
	fblt	%f1, %f0, fbgt_else.55246
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55248
	fblt	%f1, %f0, fbgt_else.55250
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55252
	fblt	%f1, %f0, fbgt_else.55254
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
	j	fbgt_cont.55245
fbgt_else.55254:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.55255:
	j	fbgt_cont.55245
fbgt_else.55252:
	fmov	%f0, %f1
fbgt_cont.55253:
	j	fbgt_cont.55245
fbgt_else.55250:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55256
	fblt	%f1, %f0, fbgt_else.55258
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
	j	fbgt_cont.55257
fbgt_else.55258:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.55259:
	j	fbgt_cont.55257
fbgt_else.55256:
	fmov	%f0, %f1
fbgt_cont.55257:
fbgt_cont.55251:
	j	fbgt_cont.55245
fbgt_else.55248:
	fmov	%f0, %f1
fbgt_cont.55249:
	j	fbgt_cont.55245
fbgt_else.55246:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55260
	fblt	%f1, %f0, fbgt_else.55262
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55264
	fblt	%f1, %f0, fbgt_else.55266
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
	j	fbgt_cont.55261
fbgt_else.55266:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.55267:
	j	fbgt_cont.55261
fbgt_else.55264:
	fmov	%f0, %f1
fbgt_cont.55265:
	j	fbgt_cont.55261
fbgt_else.55262:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.55268
	fblt	%f1, %f0, fbgt_else.55270
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
	j	fbgt_cont.55269
fbgt_else.55270:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.55271:
	j	fbgt_cont.55269
fbgt_else.55268:
	fmov	%f0, %f1
fbgt_cont.55269:
fbgt_cont.55263:
	j	fbgt_cont.55261
fbgt_else.55260:
	fmov	%f0, %f1
fbgt_cont.55261:
fbgt_cont.55247:
	j	fbgt_cont.55245
fbgt_else.55244:
	fmov	%f0, %f1
fbgt_cont.55245:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.55272
	addi	%v0, %zero, 0
	j	fbgt_cont.55273
fbgt_else.55272:
	addi	%v0, %zero, 1
fbgt_cont.55273:
	fblt	%f0, %f1, fbgt_else.55274
	fsub	%f0, %f0, %f1
	j	fbgt_cont.55275
fbgt_else.55274:
fbgt_cont.55275:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.55276
	beqi	%v0, 0, bnei_else.55278
	addi	%v0, %zero, 0
	j	fbgt_cont.55277
bnei_else.55278:
	addi	%v0, %zero, 1
bnei_cont.55279:
	j	fbgt_cont.55277
fbgt_else.55276:
fbgt_cont.55277:
	fblt	%f0, %f2, fbgt_else.55280
	fsub	%f0, %f1, %f0
	j	fbgt_cont.55281
fbgt_else.55280:
fbgt_cont.55281:
	flw	%f1, 16(%sp)
	fblt	%f1, %f0, fbgt_else.55282
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 471(%zero)
	fmul	%f2, %f2, %f0
	flw	%f3, 10(%sp)
	fsub	%f2, %f3, %f2
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.55283
fbgt_else.55282:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.55283:
	beqi	%v0, 0, bnei_else.55284
	j	bnei_cont.55285
bnei_else.55284:
	fneg	%f0, %f0
bnei_cont.55285:
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
	blti	%v0, 0, bgti_else.55314
	itof	%f1, %v0
	flw	%f2, 459(%zero)
	fmul	%f1, %f1, %f2
	flw	%f3, 438(%zero)
	fsub	%f1, %f1, %f3
	flw	%f4, 493(%zero)
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
	blti	%v1, 5, bgti_else.55315
	addi	%v1, %v1, -5
	j	bgti_cont.55316
bgti_else.55315:
bgti_cont.55316:
	blti	%v0, 0, bgti_else.55317
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
	blti	%v1, 5, bgti_else.55318
	addi	%v1, %v1, -5
	j	bgti_cont.55319
bgti_else.55318:
bgti_cont.55319:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	j	calc_dirvecs.3079
bgti_else.55317:
	jr	%ra
bgti_else.55314:
	jr	%ra
calc_dirvec_rows.3084:
	addi	%a1, %zero, 0
	blti	%v0, 0, bgti_else.55342
	itof	%f0, %v0
	flw	%f1, 459(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 438(%zero)
	fsub	%f3, %f0, %f2
	addi	%a2, %zero, 4
	itof	%f0, %a2
	fmul	%f0, %f0, %f1
	fsub	%f0, %f0, %f2
	flw	%f4, 493(%zero)
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
	blti	%a0, 5, bgti_else.55343
	addi	%a0, %a0, -5
	j	bgti_cont.55344
bgti_else.55343:
bgti_cont.55344:
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
	blti	%v1, 5, bgti_else.55345
	addi	%v1, %v1, -5
	j	bgti_cont.55346
bgti_else.55345:
bgti_cont.55346:
	lw	%a0, 6(%sp)
	addi	%a0, %a0, 4
	blti	%v0, 0, bgti_else.55347
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
	blti	%v1, 5, bgti_else.55348
	addi	%v1, %v1, -5
	j	bgti_cont.55349
bgti_else.55348:
bgti_cont.55349:
	lw	%a0, 9(%sp)
	addi	%a0, %a0, 4
	j	calc_dirvec_rows.3084
bgti_else.55347:
	jr	%ra
bgti_else.55342:
	jr	%ra
create_dirvec_elements.3090:
	blti	%v1, 0, bgti_else.55374
	addi	%a0, %zero, 3
	flw	%f0, 493(%zero)
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
	blti	%v0, 0, bgti_else.55375
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
	blti	%v0, 0, bgti_else.55376
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
	blti	%v0, 0, bgti_else.55377
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
bgti_else.55377:
	jr	%ra
bgti_else.55376:
	jr	%ra
bgti_else.55375:
	jr	%ra
bgti_else.55374:
	jr	%ra
create_dirvecs.3093:
	blti	%v0, 0, bgti_else.55420
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 493(%zero)
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
	blti	%v0, 0, bgti_else.55421
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
bgti_else.55421:
	jr	%ra
bgti_else.55420:
	jr	%ra
init_dirvec_constants.3095:
	blti	%v1, 0, bgti_else.55558
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
	blti	%v0, 0, bgti_else.55559
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 3(%sp)
	blti	%a1, 0, bgti_else.55560
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 4(%sp)
	beqi	%t1, 1, bnei_else.55562
	beqi	%t1, 2, bnei_else.55564
	addi	%t1, %zero, 5
	flw	%f0, 493(%zero)
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
	beqi	%a0, 0, bnei_else.55566
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
	j	bnei_cont.55567
bnei_else.55566:
bnei_cont.55567:
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
	beqi	%a0, 0, bnei_else.55568
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)
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
	j	bnei_cont.55569
bnei_else.55568:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.55569:
	flw	%f0, 6(%sp)
	fbne	%f3, %f0, fbeq_else.55570
	addi	%v1, %zero, 1
	j	fbeq_cont.55571
fbeq_else.55570:
	addi	%v1, %zero, 0
fbeq_cont.55571:
	beqi	%v1, 0, bnei_else.55572
	j	bnei_cont.55573
bnei_else.55572:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.55573:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.55563
bnei_else.55564:
	addi	%t1, %zero, 4
	flw	%f0, 493(%zero)
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
	fblt	%f1, %f0, fbgt_else.55574
	addi	%v1, %zero, 0
	j	fbgt_cont.55575
fbgt_else.55574:
	addi	%v1, %zero, 1
fbgt_cont.55575:
	beqi	%v1, 0, bnei_else.55576
	flw	%f1, 490(%zero)
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
	j	bnei_cont.55577
bnei_else.55576:
	fsw	%f1, 0(%v0)
bnei_cont.55577:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.55565:
	j	bnei_cont.55563
bnei_else.55562:
	addi	%t1, %zero, 6
	flw	%f0, 493(%zero)
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
	fbne	%f0, %f1, fbeq_else.55578
	addi	%a0, %zero, 1
	j	fbeq_cont.55579
fbeq_else.55578:
	addi	%a0, %zero, 0
fbeq_cont.55579:
	beqi	%a0, 0, bnei_else.55580
	fsw	%f1, 1(%v0)
	j	bnei_cont.55581
bnei_else.55580:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.55582
	addi	%a2, %zero, 0
	j	fbgt_cont.55583
fbgt_else.55582:
	addi	%a2, %zero, 1
fbgt_cont.55583:
	beqi	%a1, 0, bnei_else.55584
	beqi	%a2, 0, bnei_else.55586
	addi	%a1, %zero, 0
	j	bnei_cont.55585
bnei_else.55586:
	addi	%a1, %zero, 1
bnei_cont.55587:
	j	bnei_cont.55585
bnei_else.55584:
	add	%a1, %zero, %a2
bnei_cont.55585:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.55588
	j	bnei_cont.55589
bnei_else.55588:
	fneg	%f2, %f2
bnei_cont.55589:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.55581:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.55590
	addi	%a0, %zero, 1
	j	fbeq_cont.55591
fbeq_else.55590:
	addi	%a0, %zero, 0
fbeq_cont.55591:
	beqi	%a0, 0, bnei_else.55592
	fsw	%f1, 3(%v0)
	j	bnei_cont.55593
bnei_else.55592:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.55594
	addi	%a2, %zero, 0
	j	fbgt_cont.55595
fbgt_else.55594:
	addi	%a2, %zero, 1
fbgt_cont.55595:
	beqi	%a1, 0, bnei_else.55596
	beqi	%a2, 0, bnei_else.55598
	addi	%a1, %zero, 0
	j	bnei_cont.55597
bnei_else.55598:
	addi	%a1, %zero, 1
bnei_cont.55599:
	j	bnei_cont.55597
bnei_else.55596:
	add	%a1, %zero, %a2
bnei_cont.55597:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.55600
	j	bnei_cont.55601
bnei_else.55600:
	fneg	%f2, %f2
bnei_cont.55601:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.55593:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.55602
	addi	%v1, %zero, 1
	j	fbeq_cont.55603
fbeq_else.55602:
	addi	%v1, %zero, 0
fbeq_cont.55603:
	beqi	%v1, 0, bnei_else.55604
	fsw	%f1, 5(%v0)
	j	bnei_cont.55605
bnei_else.55604:
	lw	%v1, 7(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.55606
	addi	%a1, %zero, 0
	j	fbgt_cont.55607
fbgt_else.55606:
	addi	%a1, %zero, 1
fbgt_cont.55607:
	beqi	%a0, 0, bnei_else.55608
	beqi	%a1, 0, bnei_else.55610
	addi	%a0, %zero, 0
	j	bnei_cont.55609
bnei_else.55610:
	addi	%a0, %zero, 1
bnei_cont.55611:
	j	bnei_cont.55609
bnei_else.55608:
	add	%a0, %zero, %a1
bnei_cont.55609:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.55612
	j	bnei_cont.55613
bnei_else.55612:
	fneg	%f1, %f1
bnei_cont.55613:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.55605:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.55563:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.55561
bgti_else.55560:
bgti_cont.55561:
	lw	%v0, 3(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.55614
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
	blti	%v0, 0, bgti_else.55615
	lw	%v1, 1(%sp)
	add	%at, %v1, %v0
	lw	%a0, 0(%at)
	lw	%a1, 0(%sp)
	sw	%v0, 12(%sp)
	blti	%a1, 0, bgti_else.55616
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 13(%sp)
	beqi	%t1, 1, bnei_else.55618
	beqi	%t1, 2, bnei_else.55620
	addi	%t1, %zero, 5
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)
	fsw	%f0, 15(%sp)
	sw	%a2, 16(%sp)
	sw	%t0, 17(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 16(%sp)
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
	beqi	%a0, 0, bnei_else.55622
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
	j	bnei_cont.55623
bnei_else.55622:
bnei_cont.55623:
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
	beqi	%a0, 0, bnei_else.55624
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)
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
	j	bnei_cont.55625
bnei_else.55624:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.55625:
	flw	%f0, 15(%sp)
	fbne	%f3, %f0, fbeq_else.55626
	addi	%v1, %zero, 1
	j	fbeq_cont.55627
fbeq_else.55626:
	addi	%v1, %zero, 0
fbeq_cont.55627:
	beqi	%v1, 0, bnei_else.55628
	j	bnei_cont.55629
bnei_else.55628:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.55629:
	lw	%v1, 0(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.55619
bnei_else.55620:
	addi	%t1, %zero, 4
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)
	fsw	%f0, 18(%sp)
	sw	%a2, 16(%sp)
	sw	%t0, 17(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 17(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 16(%sp)
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
	flw	%f1, 18(%sp)
	fblt	%f1, %f0, fbgt_else.55630
	addi	%v1, %zero, 0
	j	fbgt_cont.55631
fbgt_else.55630:
	addi	%v1, %zero, 1
fbgt_cont.55631:
	beqi	%v1, 0, bnei_else.55632
	flw	%f1, 490(%zero)
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
	j	bnei_cont.55633
bnei_else.55632:
	fsw	%f1, 0(%v0)
bnei_cont.55633:
	lw	%v1, 0(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.55621:
	j	bnei_cont.55619
bnei_else.55618:
	addi	%t1, %zero, 6
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)
	sw	%a2, 16(%sp)
	fsw	%f0, 19(%sp)
	sw	%t0, 17(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_float_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	lw	%v1, 17(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 19(%sp)
	fbne	%f0, %f1, fbeq_else.55634
	addi	%a0, %zero, 1
	j	fbeq_cont.55635
fbeq_else.55634:
	addi	%a0, %zero, 0
fbeq_cont.55635:
	beqi	%a0, 0, bnei_else.55636
	fsw	%f1, 1(%v0)
	j	bnei_cont.55637
bnei_else.55636:
	lw	%a0, 16(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.55638
	addi	%a2, %zero, 0
	j	fbgt_cont.55639
fbgt_else.55638:
	addi	%a2, %zero, 1
fbgt_cont.55639:
	beqi	%a1, 0, bnei_else.55640
	beqi	%a2, 0, bnei_else.55642
	addi	%a1, %zero, 0
	j	bnei_cont.55641
bnei_else.55642:
	addi	%a1, %zero, 1
bnei_cont.55643:
	j	bnei_cont.55641
bnei_else.55640:
	add	%a1, %zero, %a2
bnei_cont.55641:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.55644
	j	bnei_cont.55645
bnei_else.55644:
	fneg	%f2, %f2
bnei_cont.55645:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.55637:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.55646
	addi	%a0, %zero, 1
	j	fbeq_cont.55647
fbeq_else.55646:
	addi	%a0, %zero, 0
fbeq_cont.55647:
	beqi	%a0, 0, bnei_else.55648
	fsw	%f1, 3(%v0)
	j	bnei_cont.55649
bnei_else.55648:
	lw	%a0, 16(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.55650
	addi	%a2, %zero, 0
	j	fbgt_cont.55651
fbgt_else.55650:
	addi	%a2, %zero, 1
fbgt_cont.55651:
	beqi	%a1, 0, bnei_else.55652
	beqi	%a2, 0, bnei_else.55654
	addi	%a1, %zero, 0
	j	bnei_cont.55653
bnei_else.55654:
	addi	%a1, %zero, 1
bnei_cont.55655:
	j	bnei_cont.55653
bnei_else.55652:
	add	%a1, %zero, %a2
bnei_cont.55653:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.55656
	j	bnei_cont.55657
bnei_else.55656:
	fneg	%f2, %f2
bnei_cont.55657:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.55649:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.55658
	addi	%v1, %zero, 1
	j	fbeq_cont.55659
fbeq_else.55658:
	addi	%v1, %zero, 0
fbeq_cont.55659:
	beqi	%v1, 0, bnei_else.55660
	fsw	%f1, 5(%v0)
	j	bnei_cont.55661
bnei_else.55660:
	lw	%v1, 16(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.55662
	addi	%a1, %zero, 0
	j	fbgt_cont.55663
fbgt_else.55662:
	addi	%a1, %zero, 1
fbgt_cont.55663:
	beqi	%a0, 0, bnei_else.55664
	beqi	%a1, 0, bnei_else.55666
	addi	%a0, %zero, 0
	j	bnei_cont.55665
bnei_else.55666:
	addi	%a0, %zero, 1
bnei_cont.55667:
	j	bnei_cont.55665
bnei_else.55664:
	add	%a0, %zero, %a1
bnei_cont.55665:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.55668
	j	bnei_cont.55669
bnei_else.55668:
	fneg	%f1, %f1
bnei_cont.55669:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.55661:
	lw	%v1, 0(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.55619:
	addi	%v1, %v1, -1
	lw	%v0, 13(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.55617
bgti_else.55616:
bgti_cont.55617:
	lw	%v0, 12(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)
	j	init_dirvec_constants.3095
bgti_else.55615:
	jr	%ra
bgti_else.55614:
	jr	%ra
bgti_else.55559:
	jr	%ra
bgti_else.55558:
	jr	%ra
init_vecset_constants.3098:
	blti	%v0, 0, bgti_else.55903
	lw	%v1, 179(%v0)
	addi	%a0, %zero, 119
	lw	%a1, 119(%v1)
	lw	%a2, 0(%zero)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%a2, 2(%sp)
	sw	%v1, 3(%sp)
	blti	%a2, 0, bgti_else.55904
	lw	%a3, 12(%a2)
	lw	%t0, 1(%a1)
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	sw	%a1, 4(%sp)
	beqi	%t2, 1, bnei_else.55906
	beqi	%t2, 2, bnei_else.55908
	addi	%t2, %zero, 5
	flw	%f0, 493(%zero)
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
	beqi	%a0, 0, bnei_else.55910
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
	j	bnei_cont.55911
bnei_else.55910:
bnei_cont.55911:
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
	beqi	%a0, 0, bnei_else.55912
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)
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
	j	bnei_cont.55913
bnei_else.55912:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.55913:
	flw	%f0, 6(%sp)
	fbne	%f3, %f0, fbeq_else.55914
	addi	%v1, %zero, 1
	j	fbeq_cont.55915
fbeq_else.55914:
	addi	%v1, %zero, 0
fbeq_cont.55915:
	beqi	%v1, 0, bnei_else.55916
	j	bnei_cont.55917
bnei_else.55916:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.55917:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.55907
bnei_else.55908:
	addi	%t2, %zero, 4
	flw	%f0, 493(%zero)
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
	fblt	%f1, %f0, fbgt_else.55918
	addi	%v1, %zero, 0
	j	fbgt_cont.55919
fbgt_else.55918:
	addi	%v1, %zero, 1
fbgt_cont.55919:
	beqi	%v1, 0, bnei_else.55920
	flw	%f1, 490(%zero)
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
	j	bnei_cont.55921
bnei_else.55920:
	fsw	%f1, 0(%v0)
bnei_cont.55921:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.55909:
	j	bnei_cont.55907
bnei_else.55906:
	addi	%t2, %zero, 6
	flw	%f0, 493(%zero)
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
	fbne	%f0, %f1, fbeq_else.55922
	addi	%a0, %zero, 1
	j	fbeq_cont.55923
fbeq_else.55922:
	addi	%a0, %zero, 0
fbeq_cont.55923:
	beqi	%a0, 0, bnei_else.55924
	fsw	%f1, 1(%v0)
	j	bnei_cont.55925
bnei_else.55924:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.55926
	addi	%a2, %zero, 0
	j	fbgt_cont.55927
fbgt_else.55926:
	addi	%a2, %zero, 1
fbgt_cont.55927:
	beqi	%a1, 0, bnei_else.55928
	beqi	%a2, 0, bnei_else.55930
	addi	%a1, %zero, 0
	j	bnei_cont.55929
bnei_else.55930:
	addi	%a1, %zero, 1
bnei_cont.55931:
	j	bnei_cont.55929
bnei_else.55928:
	add	%a1, %zero, %a2
bnei_cont.55929:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.55932
	j	bnei_cont.55933
bnei_else.55932:
	fneg	%f2, %f2
bnei_cont.55933:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.55925:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.55934
	addi	%a0, %zero, 1
	j	fbeq_cont.55935
fbeq_else.55934:
	addi	%a0, %zero, 0
fbeq_cont.55935:
	beqi	%a0, 0, bnei_else.55936
	fsw	%f1, 3(%v0)
	j	bnei_cont.55937
bnei_else.55936:
	lw	%a0, 7(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.55938
	addi	%a2, %zero, 0
	j	fbgt_cont.55939
fbgt_else.55938:
	addi	%a2, %zero, 1
fbgt_cont.55939:
	beqi	%a1, 0, bnei_else.55940
	beqi	%a2, 0, bnei_else.55942
	addi	%a1, %zero, 0
	j	bnei_cont.55941
bnei_else.55942:
	addi	%a1, %zero, 1
bnei_cont.55943:
	j	bnei_cont.55941
bnei_else.55940:
	add	%a1, %zero, %a2
bnei_cont.55941:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.55944
	j	bnei_cont.55945
bnei_else.55944:
	fneg	%f2, %f2
bnei_cont.55945:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.55937:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.55946
	addi	%v1, %zero, 1
	j	fbeq_cont.55947
fbeq_else.55946:
	addi	%v1, %zero, 0
fbeq_cont.55947:
	beqi	%v1, 0, bnei_else.55948
	fsw	%f1, 5(%v0)
	j	bnei_cont.55949
bnei_else.55948:
	lw	%v1, 7(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.55950
	addi	%a1, %zero, 0
	j	fbgt_cont.55951
fbgt_else.55950:
	addi	%a1, %zero, 1
fbgt_cont.55951:
	beqi	%a0, 0, bnei_else.55952
	beqi	%a1, 0, bnei_else.55954
	addi	%a0, %zero, 0
	j	bnei_cont.55953
bnei_else.55954:
	addi	%a0, %zero, 1
bnei_cont.55955:
	j	bnei_cont.55953
bnei_else.55952:
	add	%a0, %zero, %a1
bnei_cont.55953:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.55956
	j	bnei_cont.55957
bnei_else.55956:
	fneg	%f1, %f1
bnei_cont.55957:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.55949:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.55907:
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	j	bgti_cont.55905
bgti_else.55904:
bgti_cont.55905:
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
	lw	%a1, 2(%sp)
	sw	%v0, 12(%sp)
	blti	%a1, 0, bgti_else.55958
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 13(%sp)
	beqi	%t1, 1, bnei_else.55960
	beqi	%t1, 2, bnei_else.55962
	addi	%t1, %zero, 5
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)
	fsw	%f0, 15(%sp)
	sw	%a2, 16(%sp)
	sw	%t0, 17(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 18(%sp)
	addi	%sp, %sp, 19
	jal	min_caml_create_float_array
	addi	%sp, %sp, -19
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 16(%sp)
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
	beqi	%a0, 0, bnei_else.55964
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
	j	bnei_cont.55965
bnei_else.55964:
bnei_cont.55965:
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
	beqi	%a0, 0, bnei_else.55966
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)
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
	j	bnei_cont.55967
bnei_else.55966:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.55967:
	flw	%f0, 15(%sp)
	fbne	%f3, %f0, fbeq_else.55968
	addi	%v1, %zero, 1
	j	fbeq_cont.55969
fbeq_else.55968:
	addi	%v1, %zero, 0
fbeq_cont.55969:
	beqi	%v1, 0, bnei_else.55970
	j	bnei_cont.55971
bnei_else.55970:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.55971:
	lw	%v1, 2(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.55961
bnei_else.55962:
	addi	%t1, %zero, 4
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)
	fsw	%f0, 18(%sp)
	sw	%a2, 16(%sp)
	sw	%t0, 17(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	min_caml_create_float_array
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	lw	%v1, 17(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 16(%sp)
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
	flw	%f1, 18(%sp)
	fblt	%f1, %f0, fbgt_else.55972
	addi	%v1, %zero, 0
	j	fbgt_cont.55973
fbgt_else.55972:
	addi	%v1, %zero, 1
fbgt_cont.55973:
	beqi	%v1, 0, bnei_else.55974
	flw	%f1, 490(%zero)
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
	j	bnei_cont.55975
bnei_else.55974:
	fsw	%f1, 0(%v0)
bnei_cont.55975:
	lw	%v1, 2(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.55963:
	j	bnei_cont.55961
bnei_else.55960:
	addi	%t1, %zero, 6
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)
	sw	%a2, 16(%sp)
	fsw	%f0, 19(%sp)
	sw	%t0, 17(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	min_caml_create_float_array
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	lw	%v1, 17(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 19(%sp)
	fbne	%f0, %f1, fbeq_else.55976
	addi	%a0, %zero, 1
	j	fbeq_cont.55977
fbeq_else.55976:
	addi	%a0, %zero, 0
fbeq_cont.55977:
	beqi	%a0, 0, bnei_else.55978
	fsw	%f1, 1(%v0)
	j	bnei_cont.55979
bnei_else.55978:
	lw	%a0, 16(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.55980
	addi	%a2, %zero, 0
	j	fbgt_cont.55981
fbgt_else.55980:
	addi	%a2, %zero, 1
fbgt_cont.55981:
	beqi	%a1, 0, bnei_else.55982
	beqi	%a2, 0, bnei_else.55984
	addi	%a1, %zero, 0
	j	bnei_cont.55983
bnei_else.55984:
	addi	%a1, %zero, 1
bnei_cont.55985:
	j	bnei_cont.55983
bnei_else.55982:
	add	%a1, %zero, %a2
bnei_cont.55983:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.55986
	j	bnei_cont.55987
bnei_else.55986:
	fneg	%f2, %f2
bnei_cont.55987:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.55979:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.55988
	addi	%a0, %zero, 1
	j	fbeq_cont.55989
fbeq_else.55988:
	addi	%a0, %zero, 0
fbeq_cont.55989:
	beqi	%a0, 0, bnei_else.55990
	fsw	%f1, 3(%v0)
	j	bnei_cont.55991
bnei_else.55990:
	lw	%a0, 16(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.55992
	addi	%a2, %zero, 0
	j	fbgt_cont.55993
fbgt_else.55992:
	addi	%a2, %zero, 1
fbgt_cont.55993:
	beqi	%a1, 0, bnei_else.55994
	beqi	%a2, 0, bnei_else.55996
	addi	%a1, %zero, 0
	j	bnei_cont.55995
bnei_else.55996:
	addi	%a1, %zero, 1
bnei_cont.55997:
	j	bnei_cont.55995
bnei_else.55994:
	add	%a1, %zero, %a2
bnei_cont.55995:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.55998
	j	bnei_cont.55999
bnei_else.55998:
	fneg	%f2, %f2
bnei_cont.55999:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.55991:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.56000
	addi	%v1, %zero, 1
	j	fbeq_cont.56001
fbeq_else.56000:
	addi	%v1, %zero, 0
fbeq_cont.56001:
	beqi	%v1, 0, bnei_else.56002
	fsw	%f1, 5(%v0)
	j	bnei_cont.56003
bnei_else.56002:
	lw	%v1, 16(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.56004
	addi	%a1, %zero, 0
	j	fbgt_cont.56005
fbgt_else.56004:
	addi	%a1, %zero, 1
fbgt_cont.56005:
	beqi	%a0, 0, bnei_else.56006
	beqi	%a1, 0, bnei_else.56008
	addi	%a0, %zero, 0
	j	bnei_cont.56007
bnei_else.56008:
	addi	%a0, %zero, 1
bnei_cont.56009:
	j	bnei_cont.56007
bnei_else.56006:
	add	%a0, %zero, %a1
bnei_cont.56007:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.56010
	j	bnei_cont.56011
bnei_else.56010:
	fneg	%f1, %f1
bnei_cont.56011:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.56003:
	lw	%v1, 2(%sp)
	lw	%a0, 14(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.55961:
	addi	%v0, %v1, -1
	lw	%a0, 13(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	j	bgti_cont.55959
bgti_else.55958:
bgti_cont.55959:
	addi	%v1, %zero, 116
	lw	%v0, 3(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	lw	%v0, 1(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.56012
	lw	%v1, 179(%v0)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 20(%sp)
	sw	%v1, 21(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	lw	%v0, 21(%sp)
	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)
	blti	%a0, 0, bgti_else.56013
	lw	%a1, 12(%a0)
	lw	%a2, 1(%v1)
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)
	sw	%v1, 22(%sp)
	beqi	%t0, 1, bnei_else.56015
	beqi	%t0, 2, bnei_else.56017
	addi	%t0, %zero, 5
	flw	%f0, 493(%zero)
	sw	%a2, 23(%sp)
	fsw	%f0, 24(%sp)
	sw	%a1, 25(%sp)
	sw	%a3, 26(%sp)
	addi	%v0, %t0, 0
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	min_caml_create_float_array
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 25(%sp)
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
	beqi	%a0, 0, bnei_else.56019
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
	j	bnei_cont.56020
bnei_else.56019:
bnei_cont.56020:
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
	beqi	%a0, 0, bnei_else.56021
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)
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
	j	bnei_cont.56022
bnei_else.56021:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.56022:
	flw	%f0, 24(%sp)
	fbne	%f3, %f0, fbeq_else.56023
	addi	%v1, %zero, 1
	j	fbeq_cont.56024
fbeq_else.56023:
	addi	%v1, %zero, 0
fbeq_cont.56024:
	beqi	%v1, 0, bnei_else.56025
	j	bnei_cont.56026
bnei_else.56025:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.56026:
	lw	%v1, 2(%sp)
	lw	%a0, 23(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.56016
bnei_else.56017:
	addi	%t0, %zero, 4
	flw	%f0, 493(%zero)
	sw	%a2, 23(%sp)
	fsw	%f0, 27(%sp)
	sw	%a1, 25(%sp)
	sw	%a3, 26(%sp)
	addi	%v0, %t0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 29
	jal	min_caml_create_float_array
	addi	%sp, %sp, -29
	lw	%ra, 28(%sp)
	lw	%v1, 26(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 25(%sp)
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
	flw	%f1, 27(%sp)
	fblt	%f1, %f0, fbgt_else.56027
	addi	%v1, %zero, 0
	j	fbgt_cont.56028
fbgt_else.56027:
	addi	%v1, %zero, 1
fbgt_cont.56028:
	beqi	%v1, 0, bnei_else.56029
	flw	%f1, 490(%zero)
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
	j	bnei_cont.56030
bnei_else.56029:
	fsw	%f1, 0(%v0)
bnei_cont.56030:
	lw	%v1, 2(%sp)
	lw	%a0, 23(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.56018:
	j	bnei_cont.56016
bnei_else.56015:
	addi	%t0, %zero, 6
	flw	%f0, 493(%zero)
	sw	%a2, 23(%sp)
	sw	%a1, 25(%sp)
	fsw	%f0, 28(%sp)
	sw	%a3, 26(%sp)
	addi	%v0, %t0, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	min_caml_create_float_array
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v1, 26(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 28(%sp)
	fbne	%f0, %f1, fbeq_else.56031
	addi	%a0, %zero, 1
	j	fbeq_cont.56032
fbeq_else.56031:
	addi	%a0, %zero, 0
fbeq_cont.56032:
	beqi	%a0, 0, bnei_else.56033
	fsw	%f1, 1(%v0)
	j	bnei_cont.56034
bnei_else.56033:
	lw	%a0, 25(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.56035
	addi	%a2, %zero, 0
	j	fbgt_cont.56036
fbgt_else.56035:
	addi	%a2, %zero, 1
fbgt_cont.56036:
	beqi	%a1, 0, bnei_else.56037
	beqi	%a2, 0, bnei_else.56039
	addi	%a1, %zero, 0
	j	bnei_cont.56038
bnei_else.56039:
	addi	%a1, %zero, 1
bnei_cont.56040:
	j	bnei_cont.56038
bnei_else.56037:
	add	%a1, %zero, %a2
bnei_cont.56038:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.56041
	j	bnei_cont.56042
bnei_else.56041:
	fneg	%f2, %f2
bnei_cont.56042:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.56034:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.56043
	addi	%a0, %zero, 1
	j	fbeq_cont.56044
fbeq_else.56043:
	addi	%a0, %zero, 0
fbeq_cont.56044:
	beqi	%a0, 0, bnei_else.56045
	fsw	%f1, 3(%v0)
	j	bnei_cont.56046
bnei_else.56045:
	lw	%a0, 25(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.56047
	addi	%a2, %zero, 0
	j	fbgt_cont.56048
fbgt_else.56047:
	addi	%a2, %zero, 1
fbgt_cont.56048:
	beqi	%a1, 0, bnei_else.56049
	beqi	%a2, 0, bnei_else.56051
	addi	%a1, %zero, 0
	j	bnei_cont.56050
bnei_else.56051:
	addi	%a1, %zero, 1
bnei_cont.56052:
	j	bnei_cont.56050
bnei_else.56049:
	add	%a1, %zero, %a2
bnei_cont.56050:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.56053
	j	bnei_cont.56054
bnei_else.56053:
	fneg	%f2, %f2
bnei_cont.56054:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.56046:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.56055
	addi	%v1, %zero, 1
	j	fbeq_cont.56056
fbeq_else.56055:
	addi	%v1, %zero, 0
fbeq_cont.56056:
	beqi	%v1, 0, bnei_else.56057
	fsw	%f1, 5(%v0)
	j	bnei_cont.56058
bnei_else.56057:
	lw	%v1, 25(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.56059
	addi	%a1, %zero, 0
	j	fbgt_cont.56060
fbgt_else.56059:
	addi	%a1, %zero, 1
fbgt_cont.56060:
	beqi	%a0, 0, bnei_else.56061
	beqi	%a1, 0, bnei_else.56063
	addi	%a0, %zero, 0
	j	bnei_cont.56062
bnei_else.56063:
	addi	%a0, %zero, 1
bnei_cont.56064:
	j	bnei_cont.56062
bnei_else.56061:
	add	%a0, %zero, %a1
bnei_cont.56062:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.56065
	j	bnei_cont.56066
bnei_else.56065:
	fneg	%f1, %f1
bnei_cont.56066:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.56058:
	lw	%v1, 2(%sp)
	lw	%a0, 23(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.56016:
	addi	%v0, %v1, -1
	lw	%a0, 22(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	j	bgti_cont.56014
bgti_else.56013:
bgti_cont.56014:
	lw	%v0, 21(%sp)
	lw	%v1, 12(%sp)
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	lw	%v0, 20(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.56067
	lw	%v1, 179(%v0)
	lw	%a0, 119(%v1)
	lw	%a1, 2(%sp)
	sw	%v0, 29(%sp)
	sw	%v1, 30(%sp)
	blti	%a1, 0, bgti_else.56068
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	sw	%a0, 31(%sp)
	beqi	%t1, 1, bnei_else.56070
	beqi	%t1, 2, bnei_else.56072
	addi	%t1, %zero, 5
	flw	%f0, 493(%zero)
	sw	%a3, 32(%sp)
	fsw	%f0, 33(%sp)
	sw	%a2, 34(%sp)
	sw	%t0, 35(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 37
	jal	min_caml_create_float_array
	addi	%sp, %sp, -37
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 34(%sp)
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
	beqi	%a0, 0, bnei_else.56074
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
	j	bnei_cont.56075
bnei_else.56074:
bnei_cont.56075:
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
	beqi	%a0, 0, bnei_else.56076
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)
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
	j	bnei_cont.56077
bnei_else.56076:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.56077:
	flw	%f0, 33(%sp)
	fbne	%f3, %f0, fbeq_else.56078
	addi	%v1, %zero, 1
	j	fbeq_cont.56079
fbeq_else.56078:
	addi	%v1, %zero, 0
fbeq_cont.56079:
	beqi	%v1, 0, bnei_else.56080
	j	bnei_cont.56081
bnei_else.56080:
	flw	%f0, 491(%zero)
	fdiv	%f0, %f0, %f3
	fsw	%f0, 4(%v0)
bnei_cont.56081:
	lw	%v1, 2(%sp)
	lw	%a0, 32(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
	j	bnei_cont.56071
bnei_else.56072:
	addi	%t1, %zero, 4
	flw	%f0, 493(%zero)
	sw	%a3, 32(%sp)
	fsw	%f0, 36(%sp)
	sw	%a2, 34(%sp)
	sw	%t0, 35(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 37(%sp)
	addi	%sp, %sp, 38
	jal	min_caml_create_float_array
	addi	%sp, %sp, -38
	lw	%ra, 37(%sp)
	lw	%v1, 35(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 34(%sp)
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
	flw	%f1, 36(%sp)
	fblt	%f1, %f0, fbgt_else.56082
	addi	%v1, %zero, 0
	j	fbgt_cont.56083
fbgt_else.56082:
	addi	%v1, %zero, 1
fbgt_cont.56083:
	beqi	%v1, 0, bnei_else.56084
	flw	%f1, 490(%zero)
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
	j	bnei_cont.56085
bnei_else.56084:
	fsw	%f1, 0(%v0)
bnei_cont.56085:
	lw	%v1, 2(%sp)
	lw	%a0, 32(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.56073:
	j	bnei_cont.56071
bnei_else.56070:
	addi	%t1, %zero, 6
	flw	%f0, 493(%zero)
	sw	%a3, 32(%sp)
	sw	%a2, 34(%sp)
	fsw	%f0, 37(%sp)
	sw	%t0, 35(%sp)
	addi	%v0, %t1, 0
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	min_caml_create_float_array
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	lw	%v1, 35(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 37(%sp)
	fbne	%f0, %f1, fbeq_else.56086
	addi	%a0, %zero, 1
	j	fbeq_cont.56087
fbeq_else.56086:
	addi	%a0, %zero, 0
fbeq_cont.56087:
	beqi	%a0, 0, bnei_else.56088
	fsw	%f1, 1(%v0)
	j	bnei_cont.56089
bnei_else.56088:
	lw	%a0, 34(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.56090
	addi	%a2, %zero, 0
	j	fbgt_cont.56091
fbgt_else.56090:
	addi	%a2, %zero, 1
fbgt_cont.56091:
	beqi	%a1, 0, bnei_else.56092
	beqi	%a2, 0, bnei_else.56094
	addi	%a1, %zero, 0
	j	bnei_cont.56093
bnei_else.56094:
	addi	%a1, %zero, 1
bnei_cont.56095:
	j	bnei_cont.56093
bnei_else.56092:
	add	%a1, %zero, %a2
bnei_cont.56093:
	lw	%a2, 4(%a0)
	flw	%f2, 0(%a2)
	beqi	%a1, 0, bnei_else.56096
	j	bnei_cont.56097
bnei_else.56096:
	fneg	%f2, %f2
bnei_cont.56097:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.56089:
	flw	%f0, 1(%v1)
	fbne	%f0, %f1, fbeq_else.56098
	addi	%a0, %zero, 1
	j	fbeq_cont.56099
fbeq_else.56098:
	addi	%a0, %zero, 0
fbeq_cont.56099:
	beqi	%a0, 0, bnei_else.56100
	fsw	%f1, 3(%v0)
	j	bnei_cont.56101
bnei_else.56100:
	lw	%a0, 34(%sp)
	lw	%a1, 6(%a0)
	fblt	%f0, %f1, fbgt_else.56102
	addi	%a2, %zero, 0
	j	fbgt_cont.56103
fbgt_else.56102:
	addi	%a2, %zero, 1
fbgt_cont.56103:
	beqi	%a1, 0, bnei_else.56104
	beqi	%a2, 0, bnei_else.56106
	addi	%a1, %zero, 0
	j	bnei_cont.56105
bnei_else.56106:
	addi	%a1, %zero, 1
bnei_cont.56107:
	j	bnei_cont.56105
bnei_else.56104:
	add	%a1, %zero, %a2
bnei_cont.56105:
	lw	%a2, 4(%a0)
	flw	%f2, 1(%a2)
	beqi	%a1, 0, bnei_else.56108
	j	bnei_cont.56109
bnei_else.56108:
	fneg	%f2, %f2
bnei_cont.56109:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.56101:
	flw	%f0, 2(%v1)
	fbne	%f0, %f1, fbeq_else.56110
	addi	%v1, %zero, 1
	j	fbeq_cont.56111
fbeq_else.56110:
	addi	%v1, %zero, 0
fbeq_cont.56111:
	beqi	%v1, 0, bnei_else.56112
	fsw	%f1, 5(%v0)
	j	bnei_cont.56113
bnei_else.56112:
	lw	%v1, 34(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.56114
	addi	%a1, %zero, 0
	j	fbgt_cont.56115
fbgt_else.56114:
	addi	%a1, %zero, 1
fbgt_cont.56115:
	beqi	%a0, 0, bnei_else.56116
	beqi	%a1, 0, bnei_else.56118
	addi	%a0, %zero, 0
	j	bnei_cont.56117
bnei_else.56118:
	addi	%a0, %zero, 1
bnei_cont.56119:
	j	bnei_cont.56117
bnei_else.56116:
	add	%a0, %zero, %a1
bnei_cont.56117:
	lw	%v1, 4(%v1)
	flw	%f1, 2(%v1)
	beqi	%a0, 0, bnei_else.56120
	j	bnei_cont.56121
bnei_else.56120:
	fneg	%f1, %f1
bnei_cont.56121:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	fdiv	%f0, %f1, %f0
	fsw	%f0, 5(%v0)
bnei_cont.56113:
	lw	%v1, 2(%sp)
	lw	%a0, 32(%sp)
	add	%at, %a0, %v1
	sw	%v0, 0(%at)
bnei_cont.56071:
	addi	%v1, %v1, -1
	lw	%v0, 31(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	j	bgti_cont.56069
bgti_else.56068:
bgti_cont.56069:
	lw	%v0, 30(%sp)
	lw	%v1, 11(%sp)
	sw	%ra, 38(%sp)
	addi	%sp, %sp, 39
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -39
	lw	%ra, 38(%sp)
	lw	%v0, 29(%sp)
	addi	%v0, %v0, -1
	blti	%v0, 0, bgti_else.56122
	lw	%v1, 179(%v0)
	lw	%a0, 0(%sp)
	sw	%v0, 38(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 39(%sp)
	addi	%sp, %sp, 40
	jal	init_dirvec_constants.3095
	addi	%sp, %sp, -40
	lw	%ra, 39(%sp)
	lw	%v0, 38(%sp)
	addi	%v0, %v0, -1
	j	init_vecset_constants.3098
bgti_else.56122:
	jr	%ra
bgti_else.56067:
	jr	%ra
bgti_else.56012:
	jr	%ra
bgti_else.55903:
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
	flw	%f0, 493(%zero)
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
	flw	%f0, 450(%zero)
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
	flw	%f0, 465(%zero)
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
	blti	%a0, 0, bgti_else.58808
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
	j	bgti_cont.58809
bgti_else.58808:
bgti_cont.58809:
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
	blti	%v1, 0, bgti_else.58810
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
	j	bgti_cont.58811
bgti_else.58810:
bgti_cont.58811:
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
	blti	%v1, 0, bgti_else.58812
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
	j	bgti_cont.58813
bgti_else.58812:
bgti_cont.58813:
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
	flw	%f1, 492(%zero)
	fmul	%f0, %f0, %f1
	flw	%f2, 489(%zero)
	fabs	%f3, %f0
	flw	%f4, 488(%zero)
	fsw	%f1, 68(%sp)
	fsw	%f0, 69(%sp)
	fsw	%f2, 70(%sp)
	fsw	%f3, 71(%sp)
	fsw	%f4, 72(%sp)
	fblt	%f3, %f4, fbgt_else.58814
	flw	%f5, 487(%zero)
	fblt	%f3, %f5, fbgt_else.58816
	flw	%f5, 486(%zero)
	fblt	%f3, %f5, fbgt_else.58818
	flw	%f5, 485(%zero)
	fblt	%f3, %f5, fbgt_else.58820
	flw	%f5, 484(%zero)
	fblt	%f3, %f5, fbgt_else.58822
	flw	%f5, 483(%zero)
	fblt	%f3, %f5, fbgt_else.58824
	flw	%f5, 482(%zero)
	fblt	%f3, %f5, fbgt_else.58826
	flw	%f5, 481(%zero)
	fblt	%f3, %f5, fbgt_else.58828
	flw	%f5, 480(%zero)
	fblt	%f3, %f5, fbgt_else.58830
	flw	%f5, 479(%zero)
	fblt	%f3, %f5, fbgt_else.58832
	flw	%f5, 478(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
	j	fbgt_cont.58815
fbgt_else.58832:
	fmov	%f0, %f5
fbgt_cont.58833:
	j	fbgt_cont.58815
fbgt_else.58830:
	fmov	%f0, %f5
fbgt_cont.58831:
	j	fbgt_cont.58815
fbgt_else.58828:
	fmov	%f0, %f5
fbgt_cont.58829:
	j	fbgt_cont.58815
fbgt_else.58826:
	fmov	%f0, %f5
fbgt_cont.58827:
	j	fbgt_cont.58815
fbgt_else.58824:
	fmov	%f0, %f5
fbgt_cont.58825:
	j	fbgt_cont.58815
fbgt_else.58822:
	fmov	%f0, %f5
fbgt_cont.58823:
	j	fbgt_cont.58815
fbgt_else.58820:
	fmov	%f0, %f5
fbgt_cont.58821:
	j	fbgt_cont.58815
fbgt_else.58818:
	fmov	%f0, %f5
fbgt_cont.58819:
	j	fbgt_cont.58815
fbgt_else.58816:
	fmov	%f0, %f5
fbgt_cont.58817:
	j	fbgt_cont.58815
fbgt_else.58814:
	fmov	%f0, %f4
fbgt_cont.58815:
	flw	%f1, 71(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.58834
	fblt	%f1, %f0, fbgt_else.58836
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.58838
	fblt	%f1, %f0, fbgt_else.58840
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
	j	fbgt_cont.58835
fbgt_else.58840:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
fbgt_cont.58841:
	j	fbgt_cont.58835
fbgt_else.58838:
	fmov	%f0, %f1
fbgt_cont.58839:
	j	fbgt_cont.58835
fbgt_else.58836:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.58842
	fblt	%f1, %f0, fbgt_else.58844
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
	j	fbgt_cont.58843
fbgt_else.58844:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 73(%sp)
	addi	%sp, %sp, 74
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -74
	lw	%ra, 73(%sp)
fbgt_cont.58845:
	j	fbgt_cont.58843
fbgt_else.58842:
	fmov	%f0, %f1
fbgt_cont.58843:
fbgt_cont.58837:
	j	fbgt_cont.58835
fbgt_else.58834:
	fmov	%f0, %f1
fbgt_cont.58835:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.58846
	addi	%v0, %zero, 0
	j	fbgt_cont.58847
fbgt_else.58846:
	addi	%v0, %zero, 1
fbgt_cont.58847:
	fblt	%f0, %f1, fbgt_else.58848
	fsub	%f0, %f0, %f1
	j	fbgt_cont.58849
fbgt_else.58848:
fbgt_cont.58849:
	flw	%f2, 476(%zero)
	fblt	%f0, %f2, fbgt_else.58850
	beqi	%v0, 0, bnei_else.58852
	addi	%v0, %zero, 0
	j	fbgt_cont.58851
bnei_else.58852:
	addi	%v0, %zero, 1
bnei_cont.58853:
	j	fbgt_cont.58851
fbgt_else.58850:
fbgt_cont.58851:
	fblt	%f0, %f2, fbgt_else.58854
	fsub	%f0, %f1, %f0
	j	fbgt_cont.58855
fbgt_else.58854:
fbgt_cont.58855:
	flw	%f3, 475(%zero)
	fblt	%f3, %f0, fbgt_else.58856
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.58857
fbgt_else.58856:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.58857:
	beqi	%v0, 0, bnei_else.58858
	j	bnei_cont.58859
bnei_else.58858:
	fneg	%f0, %f0
bnei_cont.58859:
	flw	%f4, 69(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.58860
	addi	%v0, %zero, 1
	j	fbgt_cont.58861
fbgt_else.58860:
	addi	%v0, %zero, 0
fbgt_cont.58861:
	fabs	%f4, %f4
	flw	%f6, 72(%sp)
	fsw	%f0, 73(%sp)
	fsw	%f3, 74(%sp)
	fsw	%f2, 75(%sp)
	sw	%v0, 76(%sp)
	fsw	%f4, 77(%sp)
	fblt	%f4, %f6, fbgt_else.58862
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.58864
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.58866
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.58868
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.58870
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.58872
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.58874
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.58876
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.58878
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.58880
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
	j	fbgt_cont.58863
fbgt_else.58880:
	fmov	%f0, %f7
fbgt_cont.58881:
	j	fbgt_cont.58863
fbgt_else.58878:
	fmov	%f0, %f7
fbgt_cont.58879:
	j	fbgt_cont.58863
fbgt_else.58876:
	fmov	%f0, %f7
fbgt_cont.58877:
	j	fbgt_cont.58863
fbgt_else.58874:
	fmov	%f0, %f7
fbgt_cont.58875:
	j	fbgt_cont.58863
fbgt_else.58872:
	fmov	%f0, %f7
fbgt_cont.58873:
	j	fbgt_cont.58863
fbgt_else.58870:
	fmov	%f0, %f7
fbgt_cont.58871:
	j	fbgt_cont.58863
fbgt_else.58868:
	fmov	%f0, %f7
fbgt_cont.58869:
	j	fbgt_cont.58863
fbgt_else.58866:
	fmov	%f0, %f7
fbgt_cont.58867:
	j	fbgt_cont.58863
fbgt_else.58864:
	fmov	%f0, %f7
fbgt_cont.58865:
	j	fbgt_cont.58863
fbgt_else.58862:
	fmov	%f0, %f6
fbgt_cont.58863:
	flw	%f1, 77(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.58882
	fblt	%f1, %f0, fbgt_else.58884
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.58886
	fblt	%f1, %f0, fbgt_else.58888
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
	j	fbgt_cont.58883
fbgt_else.58888:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.58889:
	j	fbgt_cont.58883
fbgt_else.58886:
	fmov	%f0, %f1
fbgt_cont.58887:
	j	fbgt_cont.58883
fbgt_else.58884:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.58890
	fblt	%f1, %f0, fbgt_else.58892
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
	j	fbgt_cont.58891
fbgt_else.58892:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 78(%sp)
	addi	%sp, %sp, 79
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -79
	lw	%ra, 78(%sp)
fbgt_cont.58893:
	j	fbgt_cont.58891
fbgt_else.58890:
	fmov	%f0, %f1
fbgt_cont.58891:
fbgt_cont.58885:
	j	fbgt_cont.58883
fbgt_else.58882:
	fmov	%f0, %f1
fbgt_cont.58883:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.58894
	lw	%v0, 76(%sp)
	beqi	%v0, 0, bnei_else.58896
	addi	%v0, %zero, 0
	j	fbgt_cont.58895
bnei_else.58896:
	addi	%v0, %zero, 1
bnei_cont.58897:
	j	fbgt_cont.58895
fbgt_else.58894:
	lw	%v0, 76(%sp)
fbgt_cont.58895:
	fblt	%f0, %f1, fbgt_else.58898
	fsub	%f0, %f0, %f1
	j	fbgt_cont.58899
fbgt_else.58898:
fbgt_cont.58899:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.58900
	fsub	%f0, %f1, %f0
	j	fbgt_cont.58901
fbgt_else.58900:
fbgt_cont.58901:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.58902
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.58903
fbgt_else.58902:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.58903:
	beqi	%v0, 0, bnei_else.58904
	j	bnei_cont.58905
bnei_else.58904:
	fneg	%f0, %f0
bnei_cont.58905:
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
	fblt	%f2, %f3, fbgt_else.58906
	flw	%f4, 487(%zero)
	fblt	%f2, %f4, fbgt_else.58908
	flw	%f4, 486(%zero)
	fblt	%f2, %f4, fbgt_else.58910
	flw	%f4, 485(%zero)
	fblt	%f2, %f4, fbgt_else.58912
	flw	%f4, 484(%zero)
	fblt	%f2, %f4, fbgt_else.58914
	flw	%f4, 483(%zero)
	fblt	%f2, %f4, fbgt_else.58916
	flw	%f4, 482(%zero)
	fblt	%f2, %f4, fbgt_else.58918
	flw	%f4, 481(%zero)
	fblt	%f2, %f4, fbgt_else.58920
	flw	%f4, 480(%zero)
	fblt	%f2, %f4, fbgt_else.58922
	flw	%f4, 479(%zero)
	fblt	%f2, %f4, fbgt_else.58924
	flw	%f4, 478(%zero)
	fmov	%f1, %f4
	fmov	%f0, %f2
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
	j	fbgt_cont.58907
fbgt_else.58924:
	fmov	%f0, %f4
fbgt_cont.58925:
	j	fbgt_cont.58907
fbgt_else.58922:
	fmov	%f0, %f4
fbgt_cont.58923:
	j	fbgt_cont.58907
fbgt_else.58920:
	fmov	%f0, %f4
fbgt_cont.58921:
	j	fbgt_cont.58907
fbgt_else.58918:
	fmov	%f0, %f4
fbgt_cont.58919:
	j	fbgt_cont.58907
fbgt_else.58916:
	fmov	%f0, %f4
fbgt_cont.58917:
	j	fbgt_cont.58907
fbgt_else.58914:
	fmov	%f0, %f4
fbgt_cont.58915:
	j	fbgt_cont.58907
fbgt_else.58912:
	fmov	%f0, %f4
fbgt_cont.58913:
	j	fbgt_cont.58907
fbgt_else.58910:
	fmov	%f0, %f4
fbgt_cont.58911:
	j	fbgt_cont.58907
fbgt_else.58908:
	fmov	%f0, %f4
fbgt_cont.58909:
	j	fbgt_cont.58907
fbgt_else.58906:
	fmov	%f0, %f3
fbgt_cont.58907:
	flw	%f1, 80(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.58926
	fblt	%f1, %f0, fbgt_else.58928
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.58930
	fblt	%f1, %f0, fbgt_else.58932
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
	j	fbgt_cont.58927
fbgt_else.58932:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
fbgt_cont.58933:
	j	fbgt_cont.58927
fbgt_else.58930:
	fmov	%f0, %f1
fbgt_cont.58931:
	j	fbgt_cont.58927
fbgt_else.58928:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.58934
	fblt	%f1, %f0, fbgt_else.58936
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
	j	fbgt_cont.58935
fbgt_else.58936:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 81(%sp)
	addi	%sp, %sp, 82
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -82
	lw	%ra, 81(%sp)
fbgt_cont.58937:
	j	fbgt_cont.58935
fbgt_else.58934:
	fmov	%f0, %f1
fbgt_cont.58935:
fbgt_cont.58929:
	j	fbgt_cont.58927
fbgt_else.58926:
	fmov	%f0, %f1
fbgt_cont.58927:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.58938
	addi	%v0, %zero, 0
	j	fbgt_cont.58939
fbgt_else.58938:
	addi	%v0, %zero, 1
fbgt_cont.58939:
	fblt	%f0, %f1, fbgt_else.58940
	fsub	%f0, %f0, %f1
	j	fbgt_cont.58941
fbgt_else.58940:
fbgt_cont.58941:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.58942
	beqi	%v0, 0, bnei_else.58944
	addi	%v0, %zero, 0
	j	fbgt_cont.58943
bnei_else.58944:
	addi	%v0, %zero, 1
bnei_cont.58945:
	j	fbgt_cont.58943
fbgt_else.58942:
fbgt_cont.58943:
	fblt	%f0, %f2, fbgt_else.58946
	fsub	%f0, %f1, %f0
	j	fbgt_cont.58947
fbgt_else.58946:
fbgt_cont.58947:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.58948
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.58949
fbgt_else.58948:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.58949:
	beqi	%v0, 0, bnei_else.58950
	j	bnei_cont.58951
bnei_else.58950:
	fneg	%f0, %f0
bnei_cont.58951:
	flw	%f4, 79(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.58952
	addi	%v0, %zero, 1
	j	fbgt_cont.58953
fbgt_else.58952:
	addi	%v0, %zero, 0
fbgt_cont.58953:
	fabs	%f4, %f4
	flw	%f6, 72(%sp)
	fsw	%f0, 81(%sp)
	sw	%v0, 82(%sp)
	fsw	%f4, 83(%sp)
	fblt	%f4, %f6, fbgt_else.58954
	flw	%f7, 487(%zero)
	fblt	%f4, %f7, fbgt_else.58956
	flw	%f7, 486(%zero)
	fblt	%f4, %f7, fbgt_else.58958
	flw	%f7, 485(%zero)
	fblt	%f4, %f7, fbgt_else.58960
	flw	%f7, 484(%zero)
	fblt	%f4, %f7, fbgt_else.58962
	flw	%f7, 483(%zero)
	fblt	%f4, %f7, fbgt_else.58964
	flw	%f7, 482(%zero)
	fblt	%f4, %f7, fbgt_else.58966
	flw	%f7, 481(%zero)
	fblt	%f4, %f7, fbgt_else.58968
	flw	%f7, 480(%zero)
	fblt	%f4, %f7, fbgt_else.58970
	flw	%f7, 479(%zero)
	fblt	%f4, %f7, fbgt_else.58972
	flw	%f7, 478(%zero)
	fmov	%f1, %f7
	fmov	%f0, %f4
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
	j	fbgt_cont.58955
fbgt_else.58972:
	fmov	%f0, %f7
fbgt_cont.58973:
	j	fbgt_cont.58955
fbgt_else.58970:
	fmov	%f0, %f7
fbgt_cont.58971:
	j	fbgt_cont.58955
fbgt_else.58968:
	fmov	%f0, %f7
fbgt_cont.58969:
	j	fbgt_cont.58955
fbgt_else.58966:
	fmov	%f0, %f7
fbgt_cont.58967:
	j	fbgt_cont.58955
fbgt_else.58964:
	fmov	%f0, %f7
fbgt_cont.58965:
	j	fbgt_cont.58955
fbgt_else.58962:
	fmov	%f0, %f7
fbgt_cont.58963:
	j	fbgt_cont.58955
fbgt_else.58960:
	fmov	%f0, %f7
fbgt_cont.58961:
	j	fbgt_cont.58955
fbgt_else.58958:
	fmov	%f0, %f7
fbgt_cont.58959:
	j	fbgt_cont.58955
fbgt_else.58956:
	fmov	%f0, %f7
fbgt_cont.58957:
	j	fbgt_cont.58955
fbgt_else.58954:
	fmov	%f0, %f6
fbgt_cont.58955:
	flw	%f1, 83(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.58974
	fblt	%f1, %f0, fbgt_else.58976
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.58978
	fblt	%f1, %f0, fbgt_else.58980
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
	j	fbgt_cont.58975
fbgt_else.58980:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
fbgt_cont.58981:
	j	fbgt_cont.58975
fbgt_else.58978:
	fmov	%f0, %f1
fbgt_cont.58979:
	j	fbgt_cont.58975
fbgt_else.58976:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.58982
	fblt	%f1, %f0, fbgt_else.58984
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
	j	fbgt_cont.58983
fbgt_else.58984:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 85
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -85
	lw	%ra, 84(%sp)
fbgt_cont.58985:
	j	fbgt_cont.58983
fbgt_else.58982:
	fmov	%f0, %f1
fbgt_cont.58983:
fbgt_cont.58977:
	j	fbgt_cont.58975
fbgt_else.58974:
	fmov	%f0, %f1
fbgt_cont.58975:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.58986
	lw	%v0, 82(%sp)
	beqi	%v0, 0, bnei_else.58988
	addi	%v0, %zero, 0
	j	fbgt_cont.58987
bnei_else.58988:
	addi	%v0, %zero, 1
bnei_cont.58989:
	j	fbgt_cont.58987
fbgt_else.58986:
	lw	%v0, 82(%sp)
fbgt_cont.58987:
	fblt	%f0, %f1, fbgt_else.58990
	fsub	%f0, %f0, %f1
	j	fbgt_cont.58991
fbgt_else.58990:
fbgt_cont.58991:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.58992
	fsub	%f0, %f1, %f0
	j	fbgt_cont.58993
fbgt_else.58992:
fbgt_cont.58993:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.58994
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.58995
fbgt_else.58994:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.58995:
	beqi	%v0, 0, bnei_else.58996
	j	bnei_cont.58997
bnei_else.58996:
	fneg	%f0, %f0
bnei_cont.58997:
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
	fblt	%f0, %f2, fbgt_else.58998
	addi	%v0, %zero, 1
	j	fbgt_cont.58999
fbgt_else.58998:
	addi	%v0, %zero, 0
fbgt_cont.58999:
	fabs	%f3, %f0
	flw	%f4, 72(%sp)
	fsw	%f0, 87(%sp)
	sw	%v0, 88(%sp)
	fsw	%f3, 89(%sp)
	fblt	%f3, %f4, fbgt_else.59000
	flw	%f5, 487(%zero)
	fblt	%f3, %f5, fbgt_else.59002
	flw	%f5, 486(%zero)
	fblt	%f3, %f5, fbgt_else.59004
	flw	%f5, 485(%zero)
	fblt	%f3, %f5, fbgt_else.59006
	flw	%f5, 484(%zero)
	fblt	%f3, %f5, fbgt_else.59008
	flw	%f5, 483(%zero)
	fblt	%f3, %f5, fbgt_else.59010
	flw	%f5, 482(%zero)
	fblt	%f3, %f5, fbgt_else.59012
	flw	%f5, 481(%zero)
	fblt	%f3, %f5, fbgt_else.59014
	flw	%f5, 480(%zero)
	fblt	%f3, %f5, fbgt_else.59016
	flw	%f5, 479(%zero)
	fblt	%f3, %f5, fbgt_else.59018
	flw	%f5, 478(%zero)
	fmov	%f1, %f5
	fmov	%f0, %f3
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
	j	fbgt_cont.59001
fbgt_else.59018:
	fmov	%f0, %f5
fbgt_cont.59019:
	j	fbgt_cont.59001
fbgt_else.59016:
	fmov	%f0, %f5
fbgt_cont.59017:
	j	fbgt_cont.59001
fbgt_else.59014:
	fmov	%f0, %f5
fbgt_cont.59015:
	j	fbgt_cont.59001
fbgt_else.59012:
	fmov	%f0, %f5
fbgt_cont.59013:
	j	fbgt_cont.59001
fbgt_else.59010:
	fmov	%f0, %f5
fbgt_cont.59011:
	j	fbgt_cont.59001
fbgt_else.59008:
	fmov	%f0, %f5
fbgt_cont.59009:
	j	fbgt_cont.59001
fbgt_else.59006:
	fmov	%f0, %f5
fbgt_cont.59007:
	j	fbgt_cont.59001
fbgt_else.59004:
	fmov	%f0, %f5
fbgt_cont.59005:
	j	fbgt_cont.59001
fbgt_else.59002:
	fmov	%f0, %f5
fbgt_cont.59003:
	j	fbgt_cont.59001
fbgt_else.59000:
	fmov	%f0, %f4
fbgt_cont.59001:
	flw	%f1, 89(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.59020
	fblt	%f1, %f0, fbgt_else.59022
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.59024
	fblt	%f1, %f0, fbgt_else.59026
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
	j	fbgt_cont.59021
fbgt_else.59026:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
fbgt_cont.59027:
	j	fbgt_cont.59021
fbgt_else.59024:
	fmov	%f0, %f1
fbgt_cont.59025:
	j	fbgt_cont.59021
fbgt_else.59022:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.59028
	fblt	%f1, %f0, fbgt_else.59030
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
	j	fbgt_cont.59029
fbgt_else.59030:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 90(%sp)
	addi	%sp, %sp, 91
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -91
	lw	%ra, 90(%sp)
fbgt_cont.59031:
	j	fbgt_cont.59029
fbgt_else.59028:
	fmov	%f0, %f1
fbgt_cont.59029:
fbgt_cont.59023:
	j	fbgt_cont.59021
fbgt_else.59020:
	fmov	%f0, %f1
fbgt_cont.59021:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.59032
	lw	%v0, 88(%sp)
	beqi	%v0, 0, bnei_else.59034
	addi	%v0, %zero, 0
	j	fbgt_cont.59033
bnei_else.59034:
	addi	%v0, %zero, 1
bnei_cont.59035:
	j	fbgt_cont.59033
fbgt_else.59032:
	lw	%v0, 88(%sp)
fbgt_cont.59033:
	fblt	%f0, %f1, fbgt_else.59036
	fsub	%f0, %f0, %f1
	j	fbgt_cont.59037
fbgt_else.59036:
fbgt_cont.59037:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.59038
	fsub	%f0, %f1, %f0
	j	fbgt_cont.59039
fbgt_else.59038:
fbgt_cont.59039:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.59040
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.59041
fbgt_else.59040:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.59041:
	beqi	%v0, 0, bnei_else.59042
	j	bnei_cont.59043
bnei_else.59042:
	fneg	%f0, %f0
bnei_cont.59043:
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
	fblt	%f1, %f2, fbgt_else.59044
	flw	%f3, 487(%zero)
	fblt	%f1, %f3, fbgt_else.59046
	flw	%f3, 486(%zero)
	fblt	%f1, %f3, fbgt_else.59048
	flw	%f3, 485(%zero)
	fblt	%f1, %f3, fbgt_else.59050
	flw	%f3, 484(%zero)
	fblt	%f1, %f3, fbgt_else.59052
	flw	%f3, 483(%zero)
	fblt	%f1, %f3, fbgt_else.59054
	flw	%f3, 482(%zero)
	fblt	%f1, %f3, fbgt_else.59056
	flw	%f3, 481(%zero)
	fblt	%f1, %f3, fbgt_else.59058
	flw	%f3, 480(%zero)
	fblt	%f1, %f3, fbgt_else.59060
	flw	%f3, 479(%zero)
	fblt	%f1, %f3, fbgt_else.59062
	flw	%f3, 478(%zero)
	fmov	%f0, %f1
	fmov	%f1, %f3
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
	j	fbgt_cont.59045
fbgt_else.59062:
	fmov	%f0, %f3
fbgt_cont.59063:
	j	fbgt_cont.59045
fbgt_else.59060:
	fmov	%f0, %f3
fbgt_cont.59061:
	j	fbgt_cont.59045
fbgt_else.59058:
	fmov	%f0, %f3
fbgt_cont.59059:
	j	fbgt_cont.59045
fbgt_else.59056:
	fmov	%f0, %f3
fbgt_cont.59057:
	j	fbgt_cont.59045
fbgt_else.59054:
	fmov	%f0, %f3
fbgt_cont.59055:
	j	fbgt_cont.59045
fbgt_else.59052:
	fmov	%f0, %f3
fbgt_cont.59053:
	j	fbgt_cont.59045
fbgt_else.59050:
	fmov	%f0, %f3
fbgt_cont.59051:
	j	fbgt_cont.59045
fbgt_else.59048:
	fmov	%f0, %f3
fbgt_cont.59049:
	j	fbgt_cont.59045
fbgt_else.59046:
	fmov	%f0, %f3
fbgt_cont.59047:
	j	fbgt_cont.59045
fbgt_else.59044:
	fmov	%f0, %f2
fbgt_cont.59045:
	flw	%f1, 91(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.59064
	fblt	%f1, %f0, fbgt_else.59066
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.59068
	fblt	%f1, %f0, fbgt_else.59070
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
	j	fbgt_cont.59065
fbgt_else.59070:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.59071:
	j	fbgt_cont.59065
fbgt_else.59068:
	fmov	%f0, %f1
fbgt_cont.59069:
	j	fbgt_cont.59065
fbgt_else.59066:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.59072
	fblt	%f1, %f0, fbgt_else.59074
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
	j	fbgt_cont.59073
fbgt_else.59074:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 93
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -93
	lw	%ra, 92(%sp)
fbgt_cont.59075:
	j	fbgt_cont.59073
fbgt_else.59072:
	fmov	%f0, %f1
fbgt_cont.59073:
fbgt_cont.59067:
	j	fbgt_cont.59065
fbgt_else.59064:
	fmov	%f0, %f1
fbgt_cont.59065:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.59076
	addi	%v0, %zero, 0
	j	fbgt_cont.59077
fbgt_else.59076:
	addi	%v0, %zero, 1
fbgt_cont.59077:
	fblt	%f0, %f1, fbgt_else.59078
	fsub	%f0, %f0, %f1
	j	fbgt_cont.59079
fbgt_else.59078:
fbgt_cont.59079:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.59080
	beqi	%v0, 0, bnei_else.59082
	addi	%v0, %zero, 0
	j	fbgt_cont.59081
bnei_else.59082:
	addi	%v0, %zero, 1
bnei_cont.59083:
	j	fbgt_cont.59081
fbgt_else.59080:
fbgt_cont.59081:
	fblt	%f0, %f2, fbgt_else.59084
	fsub	%f0, %f1, %f0
	j	fbgt_cont.59085
fbgt_else.59084:
fbgt_cont.59085:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.59086
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.59087
fbgt_else.59086:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.59087:
	beqi	%v0, 0, bnei_else.59088
	j	bnei_cont.59089
bnei_else.59088:
	fneg	%f0, %f0
bnei_cont.59089:
	flw	%f4, 90(%sp)
	flw	%f5, 2(%sp)
	fblt	%f4, %f5, fbgt_else.59090
	addi	%v0, %zero, 1
	j	fbgt_cont.59091
fbgt_else.59090:
	addi	%v0, %zero, 0
fbgt_cont.59091:
	fabs	%f6, %f4
	flw	%f7, 72(%sp)
	fsw	%f0, 92(%sp)
	sw	%v0, 93(%sp)
	fsw	%f6, 94(%sp)
	fblt	%f6, %f7, fbgt_else.59092
	flw	%f8, 487(%zero)
	fblt	%f6, %f8, fbgt_else.59094
	flw	%f8, 486(%zero)
	fblt	%f6, %f8, fbgt_else.59096
	flw	%f8, 485(%zero)
	fblt	%f6, %f8, fbgt_else.59098
	flw	%f8, 484(%zero)
	fblt	%f6, %f8, fbgt_else.59100
	flw	%f8, 483(%zero)
	fblt	%f6, %f8, fbgt_else.59102
	flw	%f8, 482(%zero)
	fblt	%f6, %f8, fbgt_else.59104
	flw	%f8, 481(%zero)
	fblt	%f6, %f8, fbgt_else.59106
	flw	%f8, 480(%zero)
	fblt	%f6, %f8, fbgt_else.59108
	flw	%f8, 479(%zero)
	fblt	%f6, %f8, fbgt_else.59110
	flw	%f8, 478(%zero)
	fmov	%f1, %f8
	fmov	%f0, %f6
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
	j	fbgt_cont.59093
fbgt_else.59110:
	fmov	%f0, %f8
fbgt_cont.59111:
	j	fbgt_cont.59093
fbgt_else.59108:
	fmov	%f0, %f8
fbgt_cont.59109:
	j	fbgt_cont.59093
fbgt_else.59106:
	fmov	%f0, %f8
fbgt_cont.59107:
	j	fbgt_cont.59093
fbgt_else.59104:
	fmov	%f0, %f8
fbgt_cont.59105:
	j	fbgt_cont.59093
fbgt_else.59102:
	fmov	%f0, %f8
fbgt_cont.59103:
	j	fbgt_cont.59093
fbgt_else.59100:
	fmov	%f0, %f8
fbgt_cont.59101:
	j	fbgt_cont.59093
fbgt_else.59098:
	fmov	%f0, %f8
fbgt_cont.59099:
	j	fbgt_cont.59093
fbgt_else.59096:
	fmov	%f0, %f8
fbgt_cont.59097:
	j	fbgt_cont.59093
fbgt_else.59094:
	fmov	%f0, %f8
fbgt_cont.59095:
	j	fbgt_cont.59093
fbgt_else.59092:
	fmov	%f0, %f7
fbgt_cont.59093:
	flw	%f1, 94(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.59112
	fblt	%f1, %f0, fbgt_else.59114
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.59116
	fblt	%f1, %f0, fbgt_else.59118
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
	j	fbgt_cont.59113
fbgt_else.59118:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
fbgt_cont.59119:
	j	fbgt_cont.59113
fbgt_else.59116:
	fmov	%f0, %f1
fbgt_cont.59117:
	j	fbgt_cont.59113
fbgt_else.59114:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.59120
	fblt	%f1, %f0, fbgt_else.59122
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
	j	fbgt_cont.59121
fbgt_else.59122:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 95(%sp)
	addi	%sp, %sp, 96
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -96
	lw	%ra, 95(%sp)
fbgt_cont.59123:
	j	fbgt_cont.59121
fbgt_else.59120:
	fmov	%f0, %f1
fbgt_cont.59121:
fbgt_cont.59115:
	j	fbgt_cont.59113
fbgt_else.59112:
	fmov	%f0, %f1
fbgt_cont.59113:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.59124
	lw	%v0, 93(%sp)
	beqi	%v0, 0, bnei_else.59126
	addi	%v0, %zero, 0
	j	fbgt_cont.59125
bnei_else.59126:
	addi	%v0, %zero, 1
bnei_cont.59127:
	j	fbgt_cont.59125
fbgt_else.59124:
	lw	%v0, 93(%sp)
fbgt_cont.59125:
	fblt	%f0, %f1, fbgt_else.59128
	fsub	%f0, %f0, %f1
	j	fbgt_cont.59129
fbgt_else.59128:
fbgt_cont.59129:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.59130
	fsub	%f0, %f1, %f0
	j	fbgt_cont.59131
fbgt_else.59130:
fbgt_cont.59131:
	flw	%f3, 74(%sp)
	fblt	%f3, %f0, fbgt_else.59132
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 474(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 473(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.59133
fbgt_else.59132:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f6, %f6, %f0
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)
	fmul	%f6, %f6, %f4
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)
	fmul	%f0, %f6, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.59133:
	beqi	%v0, 0, bnei_else.59134
	j	bnei_cont.59135
bnei_else.59134:
	fneg	%f0, %f0
bnei_cont.59135:
	flw	%f4, 92(%sp)
	fmul	%f0, %f4, %f0
	fsw	%f0, 78(%zero)
	flw	%f0, 90(%sp)
	fabs	%f0, %f0
	flw	%f5, 72(%sp)
	fsw	%f0, 95(%sp)
	fblt	%f0, %f5, fbgt_else.59136
	flw	%f6, 487(%zero)
	fblt	%f0, %f6, fbgt_else.59138
	flw	%f6, 486(%zero)
	fblt	%f0, %f6, fbgt_else.59140
	flw	%f6, 485(%zero)
	fblt	%f0, %f6, fbgt_else.59142
	flw	%f6, 484(%zero)
	fblt	%f0, %f6, fbgt_else.59144
	flw	%f6, 483(%zero)
	fblt	%f0, %f6, fbgt_else.59146
	flw	%f6, 482(%zero)
	fblt	%f0, %f6, fbgt_else.59148
	flw	%f6, 481(%zero)
	fblt	%f0, %f6, fbgt_else.59150
	flw	%f6, 480(%zero)
	fblt	%f0, %f6, fbgt_else.59152
	flw	%f6, 479(%zero)
	fblt	%f0, %f6, fbgt_else.59154
	flw	%f6, 478(%zero)
	fmov	%f1, %f6
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub1.2614
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	fbgt_cont.59137
fbgt_else.59154:
	fmov	%f0, %f6
fbgt_cont.59155:
	j	fbgt_cont.59137
fbgt_else.59152:
	fmov	%f0, %f6
fbgt_cont.59153:
	j	fbgt_cont.59137
fbgt_else.59150:
	fmov	%f0, %f6
fbgt_cont.59151:
	j	fbgt_cont.59137
fbgt_else.59148:
	fmov	%f0, %f6
fbgt_cont.59149:
	j	fbgt_cont.59137
fbgt_else.59146:
	fmov	%f0, %f6
fbgt_cont.59147:
	j	fbgt_cont.59137
fbgt_else.59144:
	fmov	%f0, %f6
fbgt_cont.59145:
	j	fbgt_cont.59137
fbgt_else.59142:
	fmov	%f0, %f6
fbgt_cont.59143:
	j	fbgt_cont.59137
fbgt_else.59140:
	fmov	%f0, %f6
fbgt_cont.59141:
	j	fbgt_cont.59137
fbgt_else.59138:
	fmov	%f0, %f6
fbgt_cont.59139:
	j	fbgt_cont.59137
fbgt_else.59136:
	fmov	%f0, %f5
fbgt_cont.59137:
	flw	%f1, 95(%sp)
	flw	%f2, 72(%sp)
	fblt	%f1, %f2, fbgt_else.59156
	fblt	%f1, %f0, fbgt_else.59158
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.59160
	fblt	%f1, %f0, fbgt_else.59162
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
	j	fbgt_cont.59157
fbgt_else.59162:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.59163:
	j	fbgt_cont.59157
fbgt_else.59160:
	fmov	%f0, %f1
fbgt_cont.59161:
	j	fbgt_cont.59157
fbgt_else.59158:
	flw	%f3, 494(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.59164
	fblt	%f1, %f0, fbgt_else.59166
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
	j	fbgt_cont.59165
fbgt_else.59166:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	reduction_2pi_sub2.2617
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
fbgt_cont.59167:
	j	fbgt_cont.59165
fbgt_else.59164:
	fmov	%f0, %f1
fbgt_cont.59165:
fbgt_cont.59159:
	j	fbgt_cont.59157
fbgt_else.59156:
	fmov	%f0, %f1
fbgt_cont.59157:
	flw	%f1, 70(%sp)
	fblt	%f0, %f1, fbgt_else.59168
	addi	%v0, %zero, 0
	j	fbgt_cont.59169
fbgt_else.59168:
	addi	%v0, %zero, 1
fbgt_cont.59169:
	fblt	%f0, %f1, fbgt_else.59170
	fsub	%f0, %f0, %f1
	j	fbgt_cont.59171
fbgt_else.59170:
fbgt_cont.59171:
	flw	%f2, 75(%sp)
	fblt	%f0, %f2, fbgt_else.59172
	beqi	%v0, 0, bnei_else.59174
	addi	%v0, %zero, 0
	j	fbgt_cont.59173
bnei_else.59174:
	addi	%v0, %zero, 1
bnei_cont.59175:
	j	fbgt_cont.59173
fbgt_else.59172:
fbgt_cont.59173:
	fblt	%f0, %f2, fbgt_else.59176
	fsub	%f0, %f1, %f0
	j	fbgt_cont.59177
fbgt_else.59176:
fbgt_cont.59177:
	flw	%f1, 74(%sp)
	fblt	%f1, %f0, fbgt_else.59178
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.59179
fbgt_else.59178:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 474(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 473(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.59179:
	beqi	%v0, 0, bnei_else.59180
	j	bnei_cont.59181
bnei_else.59180:
	fneg	%f0, %f0
bnei_cont.59181:
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
	beqi	%v1, -1, bnei_else.59182
	sw	%v0, 83(%zero)
	lw	%v0, 0(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_and_network.2780
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	j	bnei_cont.59183
bnei_else.59182:
bnei_cont.59183:
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	addi	%sp, %sp, 97
	jal	read_net_item.2776
	addi	%sp, %sp, -97
	lw	%ra, 96(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	beqi	%v0, -1, bnei_else.59184
	lw	%v0, 0(%sp)
	sw	%v1, 96(%sp)
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	read_or_network.2778
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
	lw	%v1, 96(%sp)
	sw	%v1, 0(%v0)
	j	bnei_cont.59185
bnei_else.59184:
	lw	%v0, 0(%sp)
	sw	%ra, 97(%sp)
	addi	%sp, %sp, 98
	jal	min_caml_create_array
	addi	%sp, %sp, -98
	lw	%ra, 97(%sp)
bnei_cont.59185:
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
	blti	%v0, 10, bgti_else.59186
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.59188
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59190
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59192
	addi	%v1, %v1, -10
	lw	%a0, 14(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 98(%sp)
	addi	%sp, %sp, 99
	jal	print_int_sub1.2629
	addi	%sp, %sp, -99
	lw	%ra, 98(%sp)
	j	bgti_cont.59187
bgti_else.59192:
	addi	%v0, %zero, 3
bgti_cont.59193:
	j	bgti_cont.59187
bgti_else.59190:
	addi	%v0, %zero, 2
bgti_cont.59191:
	j	bgti_cont.59187
bgti_else.59188:
	addi	%v0, %zero, 1
bgti_cont.59189:
	j	bgti_cont.59187
bgti_else.59186:
	addi	%v0, %zero, 0
bgti_cont.59187:
	lw	%v1, 11(%sp)
	sw	%v0, 98(%sp)
	blti	%v1, 10, bgti_else.59194
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.59196
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59198
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59200
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59202
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59204
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59206
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59208
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59210
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59212
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59214
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59216
	addi	%a0, %a0, -10
	addi	%v0, %a0, 0
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	print_int_sub2.2632
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	bgti_cont.59195
bgti_else.59216:
	add	%v0, %zero, %a0
bgti_cont.59217:
	j	bgti_cont.59195
bgti_else.59214:
	add	%v0, %zero, %a0
bgti_cont.59215:
	j	bgti_cont.59195
bgti_else.59212:
	add	%v0, %zero, %a0
bgti_cont.59213:
	j	bgti_cont.59195
bgti_else.59210:
	add	%v0, %zero, %a0
bgti_cont.59211:
	j	bgti_cont.59195
bgti_else.59208:
	add	%v0, %zero, %a0
bgti_cont.59209:
	j	bgti_cont.59195
bgti_else.59206:
	add	%v0, %zero, %a0
bgti_cont.59207:
	j	bgti_cont.59195
bgti_else.59204:
	add	%v0, %zero, %a0
bgti_cont.59205:
	j	bgti_cont.59195
bgti_else.59202:
	add	%v0, %zero, %a0
bgti_cont.59203:
	j	bgti_cont.59195
bgti_else.59200:
	add	%v0, %zero, %a0
bgti_cont.59201:
	j	bgti_cont.59195
bgti_else.59198:
	add	%v0, %zero, %a0
bgti_cont.59199:
	j	bgti_cont.59195
bgti_else.59196:
	add	%v0, %zero, %a0
bgti_cont.59197:
	j	bgti_cont.59195
bgti_else.59194:
	add	%v0, %zero, %v1
bgti_cont.59195:
	lw	%v1, 98(%sp)
	blt	%zero, %v1, bgt_else.59218
	addi	%v0, %v0, 48
	sw	%ra, 99(%sp)
	addi	%sp, %sp, 100
	jal	min_caml_print_char
	addi	%sp, %sp, -100
	lw	%ra, 99(%sp)
	j	bgt_cont.59219
bgt_else.59218:
	sw	%v0, 99(%sp)
	blti	%v1, 10, bgti_else.59220
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.59222
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59224
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59226
	addi	%a0, %a0, -10
	lw	%a1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 100(%sp)
	addi	%sp, %sp, 101
	jal	print_int_sub1.2629
	addi	%sp, %sp, -101
	lw	%ra, 100(%sp)
	j	bgti_cont.59221
bgti_else.59226:
	addi	%v0, %zero, 3
bgti_cont.59227:
	j	bgti_cont.59221
bgti_else.59224:
	addi	%v0, %zero, 2
bgti_cont.59225:
	j	bgti_cont.59221
bgti_else.59222:
	addi	%v0, %zero, 1
bgti_cont.59223:
	j	bgti_cont.59221
bgti_else.59220:
	addi	%v0, %zero, 0
bgti_cont.59221:
	lw	%v1, 98(%sp)
	sw	%v0, 100(%sp)
	blti	%v1, 10, bgti_else.59228
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59230
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59232
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59234
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59236
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59238
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59240
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59242
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59244
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59246
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59248
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59250
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 101(%sp)
	addi	%sp, %sp, 102
	jal	print_int_sub2.2632
	addi	%sp, %sp, -102
	lw	%ra, 101(%sp)
	j	bgti_cont.59229
bgti_else.59250:
	add	%v0, %zero, %v1
bgti_cont.59251:
	j	bgti_cont.59229
bgti_else.59248:
	add	%v0, %zero, %v1
bgti_cont.59249:
	j	bgti_cont.59229
bgti_else.59246:
	add	%v0, %zero, %v1
bgti_cont.59247:
	j	bgti_cont.59229
bgti_else.59244:
	add	%v0, %zero, %v1
bgti_cont.59245:
	j	bgti_cont.59229
bgti_else.59242:
	add	%v0, %zero, %v1
bgti_cont.59243:
	j	bgti_cont.59229
bgti_else.59240:
	add	%v0, %zero, %v1
bgti_cont.59241:
	j	bgti_cont.59229
bgti_else.59238:
	add	%v0, %zero, %v1
bgti_cont.59239:
	j	bgti_cont.59229
bgti_else.59236:
	add	%v0, %zero, %v1
bgti_cont.59237:
	j	bgti_cont.59229
bgti_else.59234:
	add	%v0, %zero, %v1
bgti_cont.59235:
	j	bgti_cont.59229
bgti_else.59232:
	add	%v0, %zero, %v1
bgti_cont.59233:
	j	bgti_cont.59229
bgti_else.59230:
	add	%v0, %zero, %v1
bgti_cont.59231:
	j	bgti_cont.59229
bgti_else.59228:
	add	%v0, %zero, %v1
bgti_cont.59229:
	lw	%v1, 100(%sp)
	blt	%zero, %v1, bgt_else.59252
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
	j	bgt_cont.59253
bgt_else.59252:
	sw	%v0, 101(%sp)
	blti	%v1, 10, bgti_else.59254
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59256
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59258
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59260
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59262
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59264
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59266
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59268
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59270
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59272
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59274
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59276
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 102(%sp)
	addi	%sp, %sp, 103
	jal	print_int_sub2.2632
	addi	%sp, %sp, -103
	lw	%ra, 102(%sp)
	j	bgti_cont.59255
bgti_else.59276:
	add	%v0, %zero, %v1
bgti_cont.59277:
	j	bgti_cont.59255
bgti_else.59274:
	add	%v0, %zero, %v1
bgti_cont.59275:
	j	bgti_cont.59255
bgti_else.59272:
	add	%v0, %zero, %v1
bgti_cont.59273:
	j	bgti_cont.59255
bgti_else.59270:
	add	%v0, %zero, %v1
bgti_cont.59271:
	j	bgti_cont.59255
bgti_else.59268:
	add	%v0, %zero, %v1
bgti_cont.59269:
	j	bgti_cont.59255
bgti_else.59266:
	add	%v0, %zero, %v1
bgti_cont.59267:
	j	bgti_cont.59255
bgti_else.59264:
	add	%v0, %zero, %v1
bgti_cont.59265:
	j	bgti_cont.59255
bgti_else.59262:
	add	%v0, %zero, %v1
bgti_cont.59263:
	j	bgti_cont.59255
bgti_else.59260:
	add	%v0, %zero, %v1
bgti_cont.59261:
	j	bgti_cont.59255
bgti_else.59258:
	add	%v0, %zero, %v1
bgti_cont.59259:
	j	bgti_cont.59255
bgti_else.59256:
	add	%v0, %zero, %v1
bgti_cont.59257:
	j	bgti_cont.59255
bgti_else.59254:
	add	%v0, %zero, %v1
bgti_cont.59255:
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
bgt_cont.59253:
bgt_cont.59219:
	addi	%v0, %zero, 32
	sw	%v0, 102(%sp)
	sw	%ra, 103(%sp)
	addi	%sp, %sp, 104
	jal	min_caml_print_char
	addi	%sp, %sp, -104
	lw	%ra, 103(%sp)
	lw	%v0, 155(%zero)
	sw	%v0, 103(%sp)
	blti	%v0, 10, bgti_else.59278
	addi	%v1, %v0, -10
	blti	%v1, 10, bgti_else.59280
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59282
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59284
	addi	%v1, %v1, -10
	lw	%a0, 14(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 104(%sp)
	addi	%sp, %sp, 105
	jal	print_int_sub1.2629
	addi	%sp, %sp, -105
	lw	%ra, 104(%sp)
	j	bgti_cont.59279
bgti_else.59284:
	addi	%v0, %zero, 3
bgti_cont.59285:
	j	bgti_cont.59279
bgti_else.59282:
	addi	%v0, %zero, 2
bgti_cont.59283:
	j	bgti_cont.59279
bgti_else.59280:
	addi	%v0, %zero, 1
bgti_cont.59281:
	j	bgti_cont.59279
bgti_else.59278:
	addi	%v0, %zero, 0
bgti_cont.59279:
	lw	%v1, 103(%sp)
	sw	%v0, 104(%sp)
	blti	%v1, 10, bgti_else.59286
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59288
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59290
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59292
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59294
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59296
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59298
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59300
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59302
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59304
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59306
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59308
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 105(%sp)
	addi	%sp, %sp, 106
	jal	print_int_sub2.2632
	addi	%sp, %sp, -106
	lw	%ra, 105(%sp)
	j	bgti_cont.59287
bgti_else.59308:
	add	%v0, %zero, %v1
bgti_cont.59309:
	j	bgti_cont.59287
bgti_else.59306:
	add	%v0, %zero, %v1
bgti_cont.59307:
	j	bgti_cont.59287
bgti_else.59304:
	add	%v0, %zero, %v1
bgti_cont.59305:
	j	bgti_cont.59287
bgti_else.59302:
	add	%v0, %zero, %v1
bgti_cont.59303:
	j	bgti_cont.59287
bgti_else.59300:
	add	%v0, %zero, %v1
bgti_cont.59301:
	j	bgti_cont.59287
bgti_else.59298:
	add	%v0, %zero, %v1
bgti_cont.59299:
	j	bgti_cont.59287
bgti_else.59296:
	add	%v0, %zero, %v1
bgti_cont.59297:
	j	bgti_cont.59287
bgti_else.59294:
	add	%v0, %zero, %v1
bgti_cont.59295:
	j	bgti_cont.59287
bgti_else.59292:
	add	%v0, %zero, %v1
bgti_cont.59293:
	j	bgti_cont.59287
bgti_else.59290:
	add	%v0, %zero, %v1
bgti_cont.59291:
	j	bgti_cont.59287
bgti_else.59288:
	add	%v0, %zero, %v1
bgti_cont.59289:
	j	bgti_cont.59287
bgti_else.59286:
	add	%v0, %zero, %v1
bgti_cont.59287:
	lw	%v1, 104(%sp)
	blt	%zero, %v1, bgt_else.59310
	addi	%v0, %v0, 48
	sw	%ra, 105(%sp)
	addi	%sp, %sp, 106
	jal	min_caml_print_char
	addi	%sp, %sp, -106
	lw	%ra, 105(%sp)
	j	bgt_cont.59311
bgt_else.59310:
	sw	%v0, 105(%sp)
	blti	%v1, 10, bgti_else.59312
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.59314
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59316
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59318
	addi	%a0, %a0, -10
	lw	%a1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 106(%sp)
	addi	%sp, %sp, 107
	jal	print_int_sub1.2629
	addi	%sp, %sp, -107
	lw	%ra, 106(%sp)
	j	bgti_cont.59313
bgti_else.59318:
	addi	%v0, %zero, 3
bgti_cont.59319:
	j	bgti_cont.59313
bgti_else.59316:
	addi	%v0, %zero, 2
bgti_cont.59317:
	j	bgti_cont.59313
bgti_else.59314:
	addi	%v0, %zero, 1
bgti_cont.59315:
	j	bgti_cont.59313
bgti_else.59312:
	addi	%v0, %zero, 0
bgti_cont.59313:
	lw	%v1, 104(%sp)
	sw	%v0, 106(%sp)
	blti	%v1, 10, bgti_else.59320
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59322
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59324
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59326
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59328
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59330
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59332
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59334
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59336
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59338
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59340
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59342
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 107(%sp)
	addi	%sp, %sp, 108
	jal	print_int_sub2.2632
	addi	%sp, %sp, -108
	lw	%ra, 107(%sp)
	j	bgti_cont.59321
bgti_else.59342:
	add	%v0, %zero, %v1
bgti_cont.59343:
	j	bgti_cont.59321
bgti_else.59340:
	add	%v0, %zero, %v1
bgti_cont.59341:
	j	bgti_cont.59321
bgti_else.59338:
	add	%v0, %zero, %v1
bgti_cont.59339:
	j	bgti_cont.59321
bgti_else.59336:
	add	%v0, %zero, %v1
bgti_cont.59337:
	j	bgti_cont.59321
bgti_else.59334:
	add	%v0, %zero, %v1
bgti_cont.59335:
	j	bgti_cont.59321
bgti_else.59332:
	add	%v0, %zero, %v1
bgti_cont.59333:
	j	bgti_cont.59321
bgti_else.59330:
	add	%v0, %zero, %v1
bgti_cont.59331:
	j	bgti_cont.59321
bgti_else.59328:
	add	%v0, %zero, %v1
bgti_cont.59329:
	j	bgti_cont.59321
bgti_else.59326:
	add	%v0, %zero, %v1
bgti_cont.59327:
	j	bgti_cont.59321
bgti_else.59324:
	add	%v0, %zero, %v1
bgti_cont.59325:
	j	bgti_cont.59321
bgti_else.59322:
	add	%v0, %zero, %v1
bgti_cont.59323:
	j	bgti_cont.59321
bgti_else.59320:
	add	%v0, %zero, %v1
bgti_cont.59321:
	lw	%v1, 106(%sp)
	blt	%zero, %v1, bgt_else.59344
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
	j	bgt_cont.59345
bgt_else.59344:
	sw	%v0, 107(%sp)
	blti	%v1, 10, bgti_else.59346
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59348
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59350
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59352
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59354
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59356
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59358
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59360
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59362
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59364
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59366
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59368
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 108(%sp)
	addi	%sp, %sp, 109
	jal	print_int_sub2.2632
	addi	%sp, %sp, -109
	lw	%ra, 108(%sp)
	j	bgti_cont.59347
bgti_else.59368:
	add	%v0, %zero, %v1
bgti_cont.59369:
	j	bgti_cont.59347
bgti_else.59366:
	add	%v0, %zero, %v1
bgti_cont.59367:
	j	bgti_cont.59347
bgti_else.59364:
	add	%v0, %zero, %v1
bgti_cont.59365:
	j	bgti_cont.59347
bgti_else.59362:
	add	%v0, %zero, %v1
bgti_cont.59363:
	j	bgti_cont.59347
bgti_else.59360:
	add	%v0, %zero, %v1
bgti_cont.59361:
	j	bgti_cont.59347
bgti_else.59358:
	add	%v0, %zero, %v1
bgti_cont.59359:
	j	bgti_cont.59347
bgti_else.59356:
	add	%v0, %zero, %v1
bgti_cont.59357:
	j	bgti_cont.59347
bgti_else.59354:
	add	%v0, %zero, %v1
bgti_cont.59355:
	j	bgti_cont.59347
bgti_else.59352:
	add	%v0, %zero, %v1
bgti_cont.59353:
	j	bgti_cont.59347
bgti_else.59350:
	add	%v0, %zero, %v1
bgti_cont.59351:
	j	bgti_cont.59347
bgti_else.59348:
	add	%v0, %zero, %v1
bgti_cont.59349:
	j	bgti_cont.59347
bgti_else.59346:
	add	%v0, %zero, %v1
bgti_cont.59347:
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
bgt_cont.59345:
bgt_cont.59311:
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
	blt	%zero, %v1, bgt_else.59370
	addi	%v0, %v0, 48
	sw	%ra, 109(%sp)
	addi	%sp, %sp, 110
	jal	min_caml_print_char
	addi	%sp, %sp, -110
	lw	%ra, 109(%sp)
	j	bgt_cont.59371
bgt_else.59370:
	sw	%v0, 109(%sp)
	blti	%v1, 10, bgti_else.59372
	addi	%a0, %v1, -10
	blti	%a0, 10, bgti_else.59374
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59376
	addi	%a0, %a0, -10
	blti	%a0, 10, bgti_else.59378
	addi	%a0, %a0, -10
	lw	%a1, 14(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 110(%sp)
	addi	%sp, %sp, 111
	jal	print_int_sub1.2629
	addi	%sp, %sp, -111
	lw	%ra, 110(%sp)
	j	bgti_cont.59373
bgti_else.59378:
	addi	%v0, %zero, 3
bgti_cont.59379:
	j	bgti_cont.59373
bgti_else.59376:
	addi	%v0, %zero, 2
bgti_cont.59377:
	j	bgti_cont.59373
bgti_else.59374:
	addi	%v0, %zero, 1
bgti_cont.59375:
	j	bgti_cont.59373
bgti_else.59372:
	addi	%v0, %zero, 0
bgti_cont.59373:
	lw	%v1, 108(%sp)
	sw	%v0, 110(%sp)
	blti	%v1, 10, bgti_else.59380
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59382
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59384
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59386
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59388
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59390
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59392
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59394
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59396
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59398
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59400
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59402
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 111(%sp)
	addi	%sp, %sp, 112
	jal	print_int_sub2.2632
	addi	%sp, %sp, -112
	lw	%ra, 111(%sp)
	j	bgti_cont.59381
bgti_else.59402:
	add	%v0, %zero, %v1
bgti_cont.59403:
	j	bgti_cont.59381
bgti_else.59400:
	add	%v0, %zero, %v1
bgti_cont.59401:
	j	bgti_cont.59381
bgti_else.59398:
	add	%v0, %zero, %v1
bgti_cont.59399:
	j	bgti_cont.59381
bgti_else.59396:
	add	%v0, %zero, %v1
bgti_cont.59397:
	j	bgti_cont.59381
bgti_else.59394:
	add	%v0, %zero, %v1
bgti_cont.59395:
	j	bgti_cont.59381
bgti_else.59392:
	add	%v0, %zero, %v1
bgti_cont.59393:
	j	bgti_cont.59381
bgti_else.59390:
	add	%v0, %zero, %v1
bgti_cont.59391:
	j	bgti_cont.59381
bgti_else.59388:
	add	%v0, %zero, %v1
bgti_cont.59389:
	j	bgti_cont.59381
bgti_else.59386:
	add	%v0, %zero, %v1
bgti_cont.59387:
	j	bgti_cont.59381
bgti_else.59384:
	add	%v0, %zero, %v1
bgti_cont.59385:
	j	bgti_cont.59381
bgti_else.59382:
	add	%v0, %zero, %v1
bgti_cont.59383:
	j	bgti_cont.59381
bgti_else.59380:
	add	%v0, %zero, %v1
bgti_cont.59381:
	lw	%v1, 110(%sp)
	blt	%zero, %v1, bgt_else.59404
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
	j	bgt_cont.59405
bgt_else.59404:
	sw	%v0, 111(%sp)
	blti	%v1, 10, bgti_else.59406
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59408
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59410
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59412
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59414
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59416
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59418
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59420
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59422
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59424
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59426
	addi	%v1, %v1, -10
	blti	%v1, 10, bgti_else.59428
	addi	%v1, %v1, -10
	addi	%v0, %v1, 0
	sw	%ra, 112(%sp)
	addi	%sp, %sp, 113
	jal	print_int_sub2.2632
	addi	%sp, %sp, -113
	lw	%ra, 112(%sp)
	j	bgti_cont.59407
bgti_else.59428:
	add	%v0, %zero, %v1
bgti_cont.59429:
	j	bgti_cont.59407
bgti_else.59426:
	add	%v0, %zero, %v1
bgti_cont.59427:
	j	bgti_cont.59407
bgti_else.59424:
	add	%v0, %zero, %v1
bgti_cont.59425:
	j	bgti_cont.59407
bgti_else.59422:
	add	%v0, %zero, %v1
bgti_cont.59423:
	j	bgti_cont.59407
bgti_else.59420:
	add	%v0, %zero, %v1
bgti_cont.59421:
	j	bgti_cont.59407
bgti_else.59418:
	add	%v0, %zero, %v1
bgti_cont.59419:
	j	bgti_cont.59407
bgti_else.59416:
	add	%v0, %zero, %v1
bgti_cont.59417:
	j	bgti_cont.59407
bgti_else.59414:
	add	%v0, %zero, %v1
bgti_cont.59415:
	j	bgti_cont.59407
bgti_else.59412:
	add	%v0, %zero, %v1
bgti_cont.59413:
	j	bgti_cont.59407
bgti_else.59410:
	add	%v0, %zero, %v1
bgti_cont.59411:
	j	bgti_cont.59407
bgti_else.59408:
	add	%v0, %zero, %v1
bgti_cont.59409:
	j	bgti_cont.59407
bgti_else.59406:
	add	%v0, %zero, %v1
bgti_cont.59407:
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
bgt_cont.59405:
bgt_cont.59371:
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
	flw	%f1, 459(%zero)
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
	blti	%v1, 0, bgti_else.59430
	lw	%a0, 12(%v1)
	lw	%a1, 1(%a0)
	beqi	%a1, 1, bnei_else.59432
	beqi	%a1, 2, bnei_else.59434
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
	beqi	%a0, 0, bnei_else.59436
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
	j	bnei_cont.59437
bnei_else.59436:
bnei_cont.59437:
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
	beqi	%a0, 0, bnei_else.59438
	lw	%a0, 9(%v1)
	flw	%f7, 1(%a0)
	fmul	%f7, %f2, %f7
	lw	%a0, 9(%v1)
	flw	%f8, 2(%a0)
	fmul	%f8, %f1, %f8
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)
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
	j	bnei_cont.59439
bnei_else.59438:
	fsw	%f4, 1(%v0)
	fsw	%f5, 2(%v0)
	fsw	%f6, 3(%v0)
bnei_cont.59439:
	flw	%f0, 2(%sp)
	fbne	%f3, %f0, fbeq_else.59440
	addi	%v1, %zero, 1
	j	fbeq_cont.59441
fbeq_else.59440:
	addi	%v1, %zero, 0
fbeq_cont.59441:
	beqi	%v1, 0, bnei_else.59442
	j	bnei_cont.59443
bnei_else.59442:
	flw	%f1, 491(%zero)
	fdiv	%f1, %f1, %f3
	fsw	%f1, 4(%v0)
bnei_cont.59443:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
	j	bnei_cont.59433
bnei_else.59434:
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
	fblt	%f1, %f0, fbgt_else.59444
	addi	%a0, %zero, 0
	j	fbgt_cont.59445
fbgt_else.59444:
	addi	%a0, %zero, 1
fbgt_cont.59445:
	beqi	%a0, 0, bnei_else.59446
	flw	%f2, 490(%zero)
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
	j	bnei_cont.59447
bnei_else.59446:
	fsw	%f1, 0(%v0)
bnei_cont.59447:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
bnei_cont.59435:
	j	bnei_cont.59433
bnei_else.59432:
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
	fbne	%f0, %f1, fbeq_else.59448
	addi	%v1, %zero, 1
	j	fbeq_cont.59449
fbeq_else.59448:
	addi	%v1, %zero, 0
fbeq_cont.59449:
	beqi	%v1, 0, bnei_else.59450
	fsw	%f1, 1(%v0)
	j	bnei_cont.59451
bnei_else.59450:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.59452
	addi	%a1, %zero, 0
	j	fbgt_cont.59453
fbgt_else.59452:
	addi	%a1, %zero, 1
fbgt_cont.59453:
	beqi	%a0, 0, bnei_else.59454
	beqi	%a1, 0, bnei_else.59456
	addi	%a0, %zero, 0
	j	bnei_cont.59455
bnei_else.59456:
	addi	%a0, %zero, 1
bnei_cont.59457:
	j	bnei_cont.59455
bnei_else.59454:
	add	%a0, %zero, %a1
bnei_cont.59455:
	lw	%a1, 4(%v1)
	flw	%f2, 0(%a1)
	beqi	%a0, 0, bnei_else.59458
	j	bnei_cont.59459
bnei_else.59458:
	fneg	%f2, %f2
bnei_cont.59459:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 1(%v0)
bnei_cont.59451:
	flw	%f0, 185(%zero)
	fbne	%f0, %f1, fbeq_else.59460
	addi	%v1, %zero, 1
	j	fbeq_cont.59461
fbeq_else.59460:
	addi	%v1, %zero, 0
fbeq_cont.59461:
	beqi	%v1, 0, bnei_else.59462
	fsw	%f1, 3(%v0)
	j	bnei_cont.59463
bnei_else.59462:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.59464
	addi	%a1, %zero, 0
	j	fbgt_cont.59465
fbgt_else.59464:
	addi	%a1, %zero, 1
fbgt_cont.59465:
	beqi	%a0, 0, bnei_else.59466
	beqi	%a1, 0, bnei_else.59468
	addi	%a0, %zero, 0
	j	bnei_cont.59467
bnei_else.59468:
	addi	%a0, %zero, 1
bnei_cont.59469:
	j	bnei_cont.59467
bnei_else.59466:
	add	%a0, %zero, %a1
bnei_cont.59467:
	lw	%a1, 4(%v1)
	flw	%f2, 1(%a1)
	beqi	%a0, 0, bnei_else.59470
	j	bnei_cont.59471
bnei_else.59470:
	fneg	%f2, %f2
bnei_cont.59471:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 3(%v0)
bnei_cont.59463:
	flw	%f0, 186(%zero)
	fbne	%f0, %f1, fbeq_else.59472
	addi	%v1, %zero, 1
	j	fbeq_cont.59473
fbeq_else.59472:
	addi	%v1, %zero, 0
fbeq_cont.59473:
	beqi	%v1, 0, bnei_else.59474
	fsw	%f1, 5(%v0)
	j	bnei_cont.59475
bnei_else.59474:
	lw	%v1, 120(%sp)
	lw	%a0, 6(%v1)
	fblt	%f0, %f1, fbgt_else.59476
	addi	%a1, %zero, 0
	j	fbgt_cont.59477
fbgt_else.59476:
	addi	%a1, %zero, 1
fbgt_cont.59477:
	beqi	%a0, 0, bnei_else.59478
	beqi	%a1, 0, bnei_else.59480
	addi	%a0, %zero, 0
	j	bnei_cont.59479
bnei_else.59480:
	addi	%a0, %zero, 1
bnei_cont.59481:
	j	bnei_cont.59479
bnei_else.59478:
	add	%a0, %zero, %a1
bnei_cont.59479:
	lw	%v1, 4(%v1)
	flw	%f2, 2(%v1)
	beqi	%a0, 0, bnei_else.59482
	j	bnei_cont.59483
bnei_else.59482:
	fneg	%f2, %f2
bnei_cont.59483:
	fsw	%f2, 4(%v0)
	flw	%f2, 491(%zero)
	fdiv	%f0, %f2, %f0
	fsw	%f0, 5(%v0)
bnei_cont.59475:
	lw	%v1, 119(%sp)
	sw	%v0, 187(%v1)
bnei_cont.59433:
	addi	%v0, %v1, -1
	addi	%a0, %zero, 247
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0
	sw	%ra, 121(%sp)
	addi	%sp, %sp, 122
	jal	iter_setup_dirvec_constants.2877
	addi	%sp, %sp, -122
	lw	%ra, 121(%sp)
	j	bgti_cont.59431
bgti_else.59430:
bgti_cont.59431:
	lw	%v0, 119(%sp)
	blti	%v0, 0, bgti_else.59484
	lw	%v1, 12(%v0)
	lw	%a0, 2(%v1)
	beqi	%a0, 2, bnei_else.59486
	j	bgti_cont.59485
bnei_else.59486:
	lw	%a0, 7(%v1)
	flw	%f0, 0(%a0)
	flw	%f1, 491(%zero)
	fblt	%f0, %f1, fbgt_else.59488
	addi	%a0, %zero, 0
	j	fbgt_cont.59489
fbgt_else.59488:
	addi	%a0, %zero, 1
fbgt_cont.59489:
	beqi	%a0, 0, bnei_else.59490
	lw	%a0, 1(%v1)
	beqi	%a0, 1, bnei_else.59492
	beqi	%a0, 2, bnei_else.59494
	j	bnei_cont.59491
bnei_else.59494:
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
	flw	%f3, 494(%zero)
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
bnei_cont.59495:
	j	bnei_cont.59491
bnei_else.59492:
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
bnei_cont.59493:
	j	bnei_cont.59491
bnei_else.59490:
bnei_cont.59491:
bnei_cont.59487:
	j	bgti_cont.59485
bgti_else.59484:
bgti_cont.59485:
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
