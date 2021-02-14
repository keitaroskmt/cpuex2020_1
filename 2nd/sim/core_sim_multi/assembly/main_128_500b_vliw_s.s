	nop
	nop
	lui	%sp, 1
	lui	%hp, 0

	nop
	nop
	ori	%sp, %sp, 64464
	ori	%hp, %hp, 495

	nop
	nop
	nop
	j	min_caml_start

min_caml_print_char:
	nop
	nop
	nop
	out	%v0

	nop
	nop
	nop
	jr	%ra

min_caml_read_int:
	nop
	nop
	addi	%v0, %zero, 0
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	nop
	sll	%v1, %v1, 8

	nop
	nop
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	nop
	sll	%v1, %v1, 16

	nop
	nop
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	nop
	sll	%v1, %v1, 24

	nop
	nop
	nop
	or	%v0, %v0, %v1

	nop
	nop
	nop
	jr	%ra

min_caml_read_float:
	nop
	nop
	addi	%v0, %zero, 0
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	nop
	sll	%v1, %v1, 8

	nop
	nop
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	nop
	sll	%v1, %v1, 16

	nop
	nop
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0

	nop
	nop
	nop
	in	%v1

	nop
	nop
	nop
	sll	%v1, %v1, 24

	nop
	nop
	nop
	or	%v0, %v0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%hp)

	nop
	nop
	nop
	flw	%f0, 0(%hp)

	nop
	nop
	nop
	jr	%ra

min_caml_create_array:
	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0

create_array_loop:
	nop
	nop
	nop
	bne	%a0, %zero, create_array_cont

	nop
	nop
	nop
	jr	%ra

create_array_cont:
	nop
	nop
	sw	%v1, 0(%hp)
	addi	%a0, %a0, -1

	nop
	nop
	nop
	addi	%hp, %hp, 1

	nop
	nop
	nop
	j	create_array_loop

min_caml_create_float_array:
	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %hp, 0

create_float_array_loop:
	nop
	nop
	nop
	bne	%v1, %zero, create_float_array_cont

	nop
	nop
	nop
	jr	%ra

create_float_array_cont:
	nop
	nop
	fsw	%f0, 0(%hp)
	addi	%v1, %v1, -1

	nop
	nop
	nop
	addi	%hp, %hp, 1

	nop
	nop
	nop
	j	create_float_array_loop

min_caml_create_extarray:
	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0

create_extarray_loop:
	nop
	nop
	nop
	bne	%a1, %zero, create_extarray_cont

	nop
	nop
	nop
	jr	%ra

create_extarray_cont:
	nop
	nop
	sw	%v1, 0(%a0)
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%a0, %a0, 1

	nop
	nop
	nop
	j	create_extarray_loop

min_caml_create_float_extarray:
	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0

create_float_extarray_loop:
	nop
	nop
	nop
	bne	%a0, %zero, create_float_extarray_cont

	nop
	nop
	nop
	jr	%ra

create_float_extarray_cont:
	nop
	nop
	fsw	%f0, 0(%v1)
	addi	%a0, %a0, -1

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	j	create_float_extarray_loop

reduction_2pi_sub1.2614:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41264

	nop
	nop
	nop
	flw	%f2, 494(%zero)

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41265

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41266

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41267

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41268

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41269

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41270

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41271

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41272

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41273

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41274

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41275

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41276

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41277

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41278

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41279

	nop
	nop
	nop
	fmul	%f1, %f2, %f1

	nop
	nop
	nop
	j	reduction_2pi_sub1.2614

fbgt_else.41279:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41278:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41277:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41276:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41275:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41274:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41273:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41272:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41271:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41270:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41269:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41268:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41267:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41266:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41265:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

fbgt_else.41264:
	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	jr	%ra

reduction_2pi_sub2.2617:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41280

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41281

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41282

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41283

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41284

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41285

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41286

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41287

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41287:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41286:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41285:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41288

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41289

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41289:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41288:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41284:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41283:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41290

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41291

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41292

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41293

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41293:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41292:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41291:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41294

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41295

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41295:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41294:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41290:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41282:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41281:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41296

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41297

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41298

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41299

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41300

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41301

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41301:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41300:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41299:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41302

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41303

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41303:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41302:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41298:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41297:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41304

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41305

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41306

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41307

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41307:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41306:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41305:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.41308

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41309

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41309:
	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.41308:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41304:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41296:
	nop
	nop
	nop
	jr	%ra

fbgt_else.41280:
	nop
	nop
	nop
	jr	%ra

print_int_sub1.2629:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41310

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41311

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41312

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41313

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41314

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41315

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41316

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41317

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	j	print_int_sub1.2629

bgti_else.41317:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.41316:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.41315:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.41314:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.41313:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.41312:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.41311:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

bgti_else.41310:
	nop
	nop
	nop
	add	%v0, %zero, %v1

	nop
	nop
	nop
	jr	%ra

print_int_sub2.2632:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41318

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41319

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41320

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41321

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41322

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41323

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41324

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41325

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41326

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41327

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41328

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41329

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41330

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41331

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41332

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41333

	nop
	nop
	nop
	addi	%v0, %v0, -10

	nop
	nop
	nop
	j	print_int_sub2.2632

bgti_else.41333:
	nop
	nop
	nop
	jr	%ra

bgti_else.41332:
	nop
	nop
	nop
	jr	%ra

bgti_else.41331:
	nop
	nop
	nop
	jr	%ra

bgti_else.41330:
	nop
	nop
	nop
	jr	%ra

bgti_else.41329:
	nop
	nop
	nop
	jr	%ra

bgti_else.41328:
	nop
	nop
	nop
	jr	%ra

bgti_else.41327:
	nop
	nop
	nop
	jr	%ra

bgti_else.41326:
	nop
	nop
	nop
	jr	%ra

bgti_else.41325:
	nop
	nop
	nop
	jr	%ra

bgti_else.41324:
	nop
	nop
	nop
	jr	%ra

bgti_else.41323:
	nop
	nop
	nop
	jr	%ra

bgti_else.41322:
	nop
	nop
	nop
	jr	%ra

bgti_else.41321:
	nop
	nop
	nop
	jr	%ra

bgti_else.41320:
	nop
	nop
	nop
	jr	%ra

bgti_else.41319:
	nop
	nop
	nop
	jr	%ra

bgti_else.41318:
	nop
	nop
	nop
	jr	%ra

read_object.2772:
	nop
	nop
	nop
	blti	%v0, 60, bgti_else.44361

	nop
	nop
	nop
	jr	%ra

bgti_else.44361:
	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 1(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -2

	nop
	nop
	nop
	lw	%ra, 1(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.44363

	nop
	nop
	nop
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 2(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -3

	nop
	nop
	lw	%ra, 2(%sp)
	sw	%v0, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 3(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	lw	%ra, 3(%sp)
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	addi	%sp, %sp, -5
	addi	%v1, %zero, 3
	flw	%f0, 493(%zero)

	nop
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	fsw	%f0, 5(%sp)

	nop
	nop
	nop
	sw	%v1, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	sw	%v0, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v1, %zero, 2

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	sw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	flw	%f0, 5(%sp)

	nop
	nop
	lw	%v1, 6(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	sw	%v0, 9(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	flw	%f1, 5(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44365

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44366

fbgt_else.44365:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.44366:
	nop
	lw	%v1, 8(%sp)
	sw	%v0, 10(%sp)
	fmov	%f0, %f1

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	sw	%v0, 11(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	flw	%f0, 5(%sp)

	nop
	nop
	lw	%v1, 6(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	sw	%v0, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	flw	%f0, 5(%sp)

	nop
	nop
	lw	%v1, 6(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44367

	nop
	nop
	nop
	sw	%v0, 13(%sp)

	nop
	nop
	nop
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -15
	flw	%f1, 492(%zero)

	nop
	lw	%ra, 14(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	fsw	%f1, 14(%sp)

	nop
	nop
	nop
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)

	nop
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)

	nop
	nop
	fmul	%f0, %f0, %f1
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	fsw	%f0, 2(%v0)

	nop
	nop
	nop
	j	bnei_cont.44368

bnei_else.44367:
bnei_cont.44368:
	nop
	nop
	nop
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.44369

	nop
	nop
	nop
	lw	%a0, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.44370

bnei_else.44369:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.44370:
	nop
	addi	%a1, %zero, 4
	flw	%f0, 5(%sp)
	sw	%a0, 15(%sp)

	nop
	nop
	sw	%v0, 13(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -17
	add	%v1, %zero, %hp

	nop
	lw	%ra, 16(%sp)
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)

	nop
	nop
	lw	%v0, 13(%sp)
	lw	%a0, 12(%sp)

	nop
	nop
	sw	%v0, 9(%v1)
	lw	%a1, 4(%sp)

	nop
	nop
	sw	%a0, 8(%v1)
	lw	%a0, 11(%sp)

	nop
	nop
	sw	%a0, 7(%v1)
	lw	%a0, 15(%sp)

	nop
	nop
	sw	%a0, 6(%v1)
	lw	%a0, 9(%sp)

	nop
	nop
	sw	%a0, 5(%v1)
	lw	%a0, 7(%sp)

	nop
	nop
	sw	%a0, 4(%v1)
	lw	%a2, 3(%sp)

	nop
	nop
	sw	%a1, 3(%v1)
	lw	%a3, 1(%sp)

	nop
	nop
	sw	%a2, 2(%v1)
	lw	%a2, 2(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%v1)

	nop
	nop
	sw	%a3, 0(%v1)
	lw	%a3, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 12(%a3)

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.44371

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.44373

	nop
	nop
	nop
	j	bnei_cont.44372

bnei_else.44373:
	nop
	nop
	nop
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44375

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.44376

bnei_else.44375:
	nop
	nop
	nop
	addi	%v1, %zero, 1

bnei_cont.44376:
	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a0)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%a0)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 5(%sp)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.44377

	nop
	nop
	nop
	addi	%a2, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44378

fbeq_else.44377:
	nop
	nop
	nop
	addi	%a2, %zero, 0

fbeq_cont.44378:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.44379

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.44380

bnei_else.44379:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44381

	nop
	nop
	nop
	flw	%f5, 490(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.44382

bnei_else.44381:
	nop
	nop
	nop
	flw	%f5, 491(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

bnei_cont.44382:
bnei_cont.44380:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 2(%a0)

bnei_cont.44374:
	nop
	nop
	nop
	j	bnei_cont.44372

bnei_else.44371:
	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44383

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44384

fbeq_else.44383:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44384:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44385

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.44386

bnei_else.44385:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44387

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44388

fbeq_else.44387:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44388:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44389

	nop
	nop
	nop
	fmov	%f2, %f1

	nop
	nop
	nop
	j	bnei_cont.44390

bnei_else.44389:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44391

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44392

fbgt_else.44391:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.44392:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44393

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.44394

bnei_else.44393:
	nop
	nop
	nop
	flw	%f2, 490(%zero)

bnei_cont.44394:
bnei_cont.44390:
	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

bnei_cont.44386:
	nop
	nop
	nop
	fsw	%f0, 0(%a0)

	nop
	nop
	nop
	flw	%f0, 1(%a0)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44395

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44396

fbeq_else.44395:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44396:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44397

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.44398

bnei_else.44397:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44399

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44400

fbeq_else.44399:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44400:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44401

	nop
	nop
	nop
	fmov	%f2, %f1

	nop
	nop
	nop
	j	bnei_cont.44402

bnei_else.44401:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44403

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44404

fbgt_else.44403:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.44404:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44405

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.44406

bnei_else.44405:
	nop
	nop
	nop
	flw	%f2, 490(%zero)

bnei_cont.44406:
bnei_cont.44402:
	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

bnei_cont.44398:
	nop
	nop
	nop
	fsw	%f0, 1(%a0)

	nop
	nop
	nop
	flw	%f0, 2(%a0)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44407

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44408

fbeq_else.44407:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44408:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44409

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.44410

bnei_else.44409:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44411

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44412

fbeq_else.44411:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44412:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44413

	nop
	nop
	nop
	fmov	%f2, %f1

	nop
	nop
	nop
	j	bnei_cont.44414

bnei_else.44413:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44415

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44416

fbgt_else.44415:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.44416:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44417

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.44418

bnei_else.44417:
	nop
	nop
	nop
	flw	%f2, 490(%zero)

bnei_cont.44418:
bnei_cont.44414:
	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

bnei_cont.44410:
	nop
	nop
	nop
	fsw	%f0, 2(%a0)

bnei_cont.44372:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44419

	nop
	nop
	flw	%f0, 0(%v0)
	flw	%f1, 489(%zero)

	nop
	fabs	%f2, %f0
	flw	%f3, 488(%zero)
	fsw	%f0, 16(%sp)

	nop
	nop
	nop
	fsw	%f1, 17(%sp)

	nop
	nop
	nop
	fsw	%f2, 18(%sp)

	nop
	nop
	nop
	fsw	%f3, 19(%sp)

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.44421

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44423

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44425

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44427

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44429

	nop
	nop
	nop
	flw	%f4, 483(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44431

	nop
	nop
	nop
	flw	%f4, 482(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44433

	nop
	nop
	nop
	flw	%f4, 481(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44435

	nop
	nop
	nop
	flw	%f4, 480(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44437

	nop
	nop
	nop
	flw	%f4, 479(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44439

	nop
	nop
	nop
	flw	%f4, 478(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44441

	nop
	flw	%f4, 477(%zero)
	fmov	%f0, %f2
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44441:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44442:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44439:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44440:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44437:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44438:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44435:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44436:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44433:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44434:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44431:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44432:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44429:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44430:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44427:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44428:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44425:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44426:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44423:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44424:
	nop
	nop
	nop
	j	fbgt_cont.44422

fbgt_else.44421:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.44422:
	nop
	nop
	flw	%f1, 18(%sp)
	flw	%f2, 19(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44443

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44445

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44447

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44449

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44451

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44453

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44444

fbgt_else.44453:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

fbgt_cont.44454:
	nop
	nop
	nop
	j	fbgt_cont.44444

fbgt_else.44451:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44452:
	nop
	nop
	nop
	j	fbgt_cont.44444

fbgt_else.44449:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44455

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44457

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44456

fbgt_else.44457:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

fbgt_cont.44458:
	nop
	nop
	nop
	j	fbgt_cont.44456

fbgt_else.44455:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44456:
fbgt_cont.44450:
	nop
	nop
	nop
	j	fbgt_cont.44444

fbgt_else.44447:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44448:
	nop
	nop
	nop
	j	fbgt_cont.44444

fbgt_else.44445:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44459

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44461

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44463

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44465

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44460

fbgt_else.44465:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

fbgt_cont.44466:
	nop
	nop
	nop
	j	fbgt_cont.44460

fbgt_else.44463:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44464:
	nop
	nop
	nop
	j	fbgt_cont.44460

fbgt_else.44461:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44467

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44469

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44468

fbgt_else.44469:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

fbgt_cont.44470:
	nop
	nop
	nop
	j	fbgt_cont.44468

fbgt_else.44467:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44468:
fbgt_cont.44462:
	nop
	nop
	nop
	j	fbgt_cont.44460

fbgt_else.44459:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44460:
fbgt_cont.44446:
	nop
	nop
	nop
	j	fbgt_cont.44444

fbgt_else.44443:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44444:
	nop
	nop
	nop
	flw	%f1, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44471

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44472

fbgt_else.44471:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.44472:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44473

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.44474

fbgt_else.44473:
fbgt_cont.44474:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44475

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44477

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44476

bnei_else.44477:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.44478:
	nop
	nop
	nop
	j	fbgt_cont.44476

fbgt_else.44475:
fbgt_cont.44476:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44479

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.44480

fbgt_else.44479:
fbgt_cont.44480:
	nop
	nop
	nop
	flw	%f3, 475(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44481

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.44482

fbgt_else.44481:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.44482:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44483

	nop
	nop
	nop
	j	bnei_cont.44484

bnei_else.44483:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.44484:
	nop
	nop
	flw	%f4, 16(%sp)
	flw	%f5, 5(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.44485

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.44486

fbgt_else.44485:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.44486:
	nop
	fabs	%f4, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 20(%sp)

	nop
	nop
	nop
	fsw	%f3, 21(%sp)

	nop
	nop
	nop
	fsw	%f2, 22(%sp)

	nop
	nop
	nop
	sw	%v0, 23(%sp)

	nop
	nop
	nop
	fsw	%f4, 24(%sp)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44487

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44489

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44491

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44493

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44495

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44497

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44499

	nop
	nop
	nop
	flw	%f7, 481(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44501

	nop
	nop
	nop
	flw	%f7, 480(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44503

	nop
	nop
	nop
	flw	%f7, 479(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44505

	nop
	nop
	nop
	flw	%f7, 478(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44507

	nop
	flw	%f7, 477(%zero)
	fmov	%f0, %f4
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44507:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44508:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44505:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44506:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44503:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44504:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44501:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44502:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44499:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44500:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44497:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44498:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44495:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44496:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44493:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44494:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44491:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44492:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44489:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44490:
	nop
	nop
	nop
	j	fbgt_cont.44488

fbgt_else.44487:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44488:
	nop
	nop
	flw	%f1, 24(%sp)
	flw	%f2, 19(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44509

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44511

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44513

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44515

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44517

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44519

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44510

fbgt_else.44519:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

fbgt_cont.44520:
	nop
	nop
	nop
	j	fbgt_cont.44510

fbgt_else.44517:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44518:
	nop
	nop
	nop
	j	fbgt_cont.44510

fbgt_else.44515:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44521

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44523

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44522

fbgt_else.44523:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

fbgt_cont.44524:
	nop
	nop
	nop
	j	fbgt_cont.44522

fbgt_else.44521:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44522:
fbgt_cont.44516:
	nop
	nop
	nop
	j	fbgt_cont.44510

fbgt_else.44513:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44514:
	nop
	nop
	nop
	j	fbgt_cont.44510

fbgt_else.44511:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44525

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44527

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44529

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44531

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44526

fbgt_else.44531:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

fbgt_cont.44532:
	nop
	nop
	nop
	j	fbgt_cont.44526

fbgt_else.44529:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44530:
	nop
	nop
	nop
	j	fbgt_cont.44526

fbgt_else.44527:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44533

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44535

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44534

fbgt_else.44535:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

fbgt_cont.44536:
	nop
	nop
	nop
	j	fbgt_cont.44534

fbgt_else.44533:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44534:
fbgt_cont.44528:
	nop
	nop
	nop
	j	fbgt_cont.44526

fbgt_else.44525:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44526:
fbgt_cont.44512:
	nop
	nop
	nop
	j	fbgt_cont.44510

fbgt_else.44509:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44510:
	nop
	nop
	nop
	flw	%f1, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44537

	nop
	nop
	nop
	lw	%v0, 23(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44539

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44538

bnei_else.44539:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.44540:
	nop
	nop
	nop
	j	fbgt_cont.44538

fbgt_else.44537:
	nop
	nop
	nop
	lw	%v0, 23(%sp)

fbgt_cont.44538:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44541

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.44542

fbgt_else.44541:
fbgt_cont.44542:
	nop
	nop
	nop
	flw	%f2, 22(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44543

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.44544

fbgt_else.44543:
fbgt_cont.44544:
	nop
	nop
	nop
	flw	%f3, 21(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44545

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.44546

fbgt_else.44545:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.44546:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44547

	nop
	nop
	nop
	j	bnei_cont.44548

bnei_else.44547:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.44548:
	nop
	nop
	lw	%v0, 13(%sp)
	flw	%f6, 19(%sp)

	nop
	nop
	flw	%f4, 1(%v0)
	fsw	%f0, 25(%sp)

	nop
	nop
	fabs	%f5, %f4
	fsw	%f4, 26(%sp)

	nop
	nop
	nop
	fsw	%f5, 27(%sp)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.44549

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44551

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44553

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44555

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44557

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44559

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44561

	nop
	nop
	nop
	flw	%f7, 481(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44563

	nop
	nop
	nop
	flw	%f7, 480(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44565

	nop
	nop
	nop
	flw	%f7, 479(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44567

	nop
	nop
	nop
	flw	%f7, 478(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44569

	nop
	flw	%f7, 477(%zero)
	fmov	%f0, %f5
	sw	%ra, 28(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44569:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44570:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44567:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44568:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44565:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44566:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44563:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44564:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44561:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44562:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44559:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44560:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44557:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44558:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44555:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44556:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44553:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44554:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44551:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44552:
	nop
	nop
	nop
	j	fbgt_cont.44550

fbgt_else.44549:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44550:
	nop
	nop
	flw	%f1, 27(%sp)
	flw	%f2, 19(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44571

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44573

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44575

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44577

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44579

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44581

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 28(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44572

fbgt_else.44581:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 28(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

fbgt_cont.44582:
	nop
	nop
	nop
	j	fbgt_cont.44572

fbgt_else.44579:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44580:
	nop
	nop
	nop
	j	fbgt_cont.44572

fbgt_else.44577:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44583

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44585

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 28(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44584

fbgt_else.44585:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 28(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

fbgt_cont.44586:
	nop
	nop
	nop
	j	fbgt_cont.44584

fbgt_else.44583:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44584:
fbgt_cont.44578:
	nop
	nop
	nop
	j	fbgt_cont.44572

fbgt_else.44575:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44576:
	nop
	nop
	nop
	j	fbgt_cont.44572

fbgt_else.44573:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44587

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44589

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44591

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44593

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 28(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44588

fbgt_else.44593:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 28(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

fbgt_cont.44594:
	nop
	nop
	nop
	j	fbgt_cont.44588

fbgt_else.44591:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44592:
	nop
	nop
	nop
	j	fbgt_cont.44588

fbgt_else.44589:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44595

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44597

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 28(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44596

fbgt_else.44597:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 28(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

fbgt_cont.44598:
	nop
	nop
	nop
	j	fbgt_cont.44596

fbgt_else.44595:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44596:
fbgt_cont.44590:
	nop
	nop
	nop
	j	fbgt_cont.44588

fbgt_else.44587:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44588:
fbgt_cont.44574:
	nop
	nop
	nop
	j	fbgt_cont.44572

fbgt_else.44571:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44572:
	nop
	nop
	nop
	flw	%f1, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44599

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44600

fbgt_else.44599:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.44600:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44601

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.44602

fbgt_else.44601:
fbgt_cont.44602:
	nop
	nop
	nop
	flw	%f2, 22(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44603

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44605

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44604

bnei_else.44605:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.44606:
	nop
	nop
	nop
	j	fbgt_cont.44604

fbgt_else.44603:
fbgt_cont.44604:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44607

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.44608

fbgt_else.44607:
fbgt_cont.44608:
	nop
	nop
	nop
	flw	%f3, 21(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44609

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.44610

fbgt_else.44609:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.44610:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44611

	nop
	nop
	nop
	j	bnei_cont.44612

bnei_else.44611:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.44612:
	nop
	nop
	flw	%f4, 26(%sp)
	flw	%f5, 5(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.44613

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.44614

fbgt_else.44613:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.44614:
	nop
	fabs	%f4, %f4
	flw	%f6, 19(%sp)
	fsw	%f0, 28(%sp)

	nop
	nop
	nop
	sw	%v0, 29(%sp)

	nop
	nop
	nop
	fsw	%f4, 30(%sp)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44615

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44617

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44619

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44621

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44623

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44625

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44627

	nop
	nop
	nop
	flw	%f7, 481(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44629

	nop
	nop
	nop
	flw	%f7, 480(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44631

	nop
	nop
	nop
	flw	%f7, 479(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44633

	nop
	nop
	nop
	flw	%f7, 478(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44635

	nop
	flw	%f7, 477(%zero)
	fmov	%f0, %f4
	sw	%ra, 31(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44635:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44636:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44633:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44634:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44631:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44632:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44629:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44630:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44627:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44628:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44625:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44626:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44623:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44624:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44621:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44622:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44619:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44620:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44617:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44618:
	nop
	nop
	nop
	j	fbgt_cont.44616

fbgt_else.44615:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44616:
	nop
	nop
	flw	%f1, 30(%sp)
	flw	%f2, 19(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44637

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44639

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44641

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44643

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44645

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44647

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 31(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44638

fbgt_else.44647:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 31(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

fbgt_cont.44648:
	nop
	nop
	nop
	j	fbgt_cont.44638

fbgt_else.44645:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44646:
	nop
	nop
	nop
	j	fbgt_cont.44638

fbgt_else.44643:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44649

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44651

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 31(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44650

fbgt_else.44651:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 31(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

fbgt_cont.44652:
	nop
	nop
	nop
	j	fbgt_cont.44650

fbgt_else.44649:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44650:
fbgt_cont.44644:
	nop
	nop
	nop
	j	fbgt_cont.44638

fbgt_else.44641:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44642:
	nop
	nop
	nop
	j	fbgt_cont.44638

fbgt_else.44639:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44653

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44655

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44657

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44659

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 31(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44654

fbgt_else.44659:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 31(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

fbgt_cont.44660:
	nop
	nop
	nop
	j	fbgt_cont.44654

fbgt_else.44657:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44658:
	nop
	nop
	nop
	j	fbgt_cont.44654

fbgt_else.44655:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44661

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44663

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 31(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44662

fbgt_else.44663:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 31(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

fbgt_cont.44664:
	nop
	nop
	nop
	j	fbgt_cont.44662

fbgt_else.44661:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44662:
fbgt_cont.44656:
	nop
	nop
	nop
	j	fbgt_cont.44654

fbgt_else.44653:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44654:
fbgt_cont.44640:
	nop
	nop
	nop
	j	fbgt_cont.44638

fbgt_else.44637:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44638:
	nop
	nop
	nop
	flw	%f1, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44665

	nop
	nop
	nop
	lw	%v0, 29(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44667

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44666

bnei_else.44667:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.44668:
	nop
	nop
	nop
	j	fbgt_cont.44666

fbgt_else.44665:
	nop
	nop
	nop
	lw	%v0, 29(%sp)

fbgt_cont.44666:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44669

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.44670

fbgt_else.44669:
fbgt_cont.44670:
	nop
	nop
	nop
	flw	%f2, 22(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44671

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.44672

fbgt_else.44671:
fbgt_cont.44672:
	nop
	nop
	nop
	flw	%f3, 21(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44673

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.44674

fbgt_else.44673:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.44674:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44675

	nop
	nop
	nop
	j	bnei_cont.44676

bnei_else.44675:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.44676:
	nop
	nop
	lw	%v0, 13(%sp)
	flw	%f6, 19(%sp)

	nop
	nop
	flw	%f4, 2(%v0)
	fsw	%f0, 31(%sp)

	nop
	nop
	fabs	%f5, %f4
	fsw	%f4, 32(%sp)

	nop
	nop
	nop
	fsw	%f5, 33(%sp)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.44677

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44679

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44681

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44683

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44685

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44687

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44689

	nop
	nop
	nop
	flw	%f7, 481(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44691

	nop
	nop
	nop
	flw	%f7, 480(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44693

	nop
	nop
	nop
	flw	%f7, 479(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44695

	nop
	nop
	nop
	flw	%f7, 478(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44697

	nop
	flw	%f7, 477(%zero)
	fmov	%f0, %f5
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44697:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44698:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44695:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44696:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44693:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44694:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44691:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44692:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44689:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44690:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44687:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44688:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44685:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44686:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44683:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44684:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44681:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44682:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44679:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44680:
	nop
	nop
	nop
	j	fbgt_cont.44678

fbgt_else.44677:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44678:
	nop
	nop
	flw	%f1, 33(%sp)
	flw	%f2, 19(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44699

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44701

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44703

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44705

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44707

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44709

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44700

fbgt_else.44709:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

fbgt_cont.44710:
	nop
	nop
	nop
	j	fbgt_cont.44700

fbgt_else.44707:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44708:
	nop
	nop
	nop
	j	fbgt_cont.44700

fbgt_else.44705:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44711

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44713

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44712

fbgt_else.44713:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

fbgt_cont.44714:
	nop
	nop
	nop
	j	fbgt_cont.44712

fbgt_else.44711:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44712:
fbgt_cont.44706:
	nop
	nop
	nop
	j	fbgt_cont.44700

fbgt_else.44703:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44704:
	nop
	nop
	nop
	j	fbgt_cont.44700

fbgt_else.44701:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44715

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44717

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44719

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44721

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44716

fbgt_else.44721:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

fbgt_cont.44722:
	nop
	nop
	nop
	j	fbgt_cont.44716

fbgt_else.44719:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44720:
	nop
	nop
	nop
	j	fbgt_cont.44716

fbgt_else.44717:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44723

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44725

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44724

fbgt_else.44725:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

fbgt_cont.44726:
	nop
	nop
	nop
	j	fbgt_cont.44724

fbgt_else.44723:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44724:
fbgt_cont.44718:
	nop
	nop
	nop
	j	fbgt_cont.44716

fbgt_else.44715:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44716:
fbgt_cont.44702:
	nop
	nop
	nop
	j	fbgt_cont.44700

fbgt_else.44699:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44700:
	nop
	nop
	nop
	flw	%f1, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44727

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44728

fbgt_else.44727:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.44728:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44729

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.44730

fbgt_else.44729:
fbgt_cont.44730:
	nop
	nop
	nop
	flw	%f2, 22(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44731

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44733

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44732

bnei_else.44733:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.44734:
	nop
	nop
	nop
	j	fbgt_cont.44732

fbgt_else.44731:
fbgt_cont.44732:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44735

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.44736

fbgt_else.44735:
fbgt_cont.44736:
	nop
	nop
	nop
	flw	%f3, 21(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44737

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.44738

fbgt_else.44737:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.44738:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44739

	nop
	nop
	nop
	j	bnei_cont.44740

bnei_else.44739:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.44740:
	nop
	nop
	flw	%f4, 32(%sp)
	flw	%f5, 5(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.44741

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.44742

fbgt_else.44741:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.44742:
	nop
	fabs	%f4, %f4
	flw	%f5, 19(%sp)
	fsw	%f0, 34(%sp)

	nop
	nop
	nop
	sw	%v0, 35(%sp)

	nop
	nop
	nop
	fsw	%f4, 36(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.44743

	nop
	nop
	nop
	flw	%f6, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44745

	nop
	nop
	nop
	flw	%f6, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44747

	nop
	nop
	nop
	flw	%f6, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44749

	nop
	nop
	nop
	flw	%f6, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44751

	nop
	nop
	nop
	flw	%f6, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44753

	nop
	nop
	nop
	flw	%f6, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44755

	nop
	nop
	nop
	flw	%f6, 481(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44757

	nop
	nop
	nop
	flw	%f6, 480(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44759

	nop
	nop
	nop
	flw	%f6, 479(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44761

	nop
	nop
	nop
	flw	%f6, 478(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44763

	nop
	flw	%f6, 477(%zero)
	fmov	%f0, %f4
	sw	%ra, 37(%sp)

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44763:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44764:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44761:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44762:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44759:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44760:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44757:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44758:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44755:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44756:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44753:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44754:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44751:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44752:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44749:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44750:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44747:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44748:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44745:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44746:
	nop
	nop
	nop
	j	fbgt_cont.44744

fbgt_else.44743:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.44744:
	nop
	nop
	flw	%f1, 36(%sp)
	flw	%f2, 19(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44765

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44767

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44769

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44771

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44773

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44775

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 37(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44766

fbgt_else.44775:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 37(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

fbgt_cont.44776:
	nop
	nop
	nop
	j	fbgt_cont.44766

fbgt_else.44773:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44774:
	nop
	nop
	nop
	j	fbgt_cont.44766

fbgt_else.44771:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44777

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44779

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 37(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44778

fbgt_else.44779:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 37(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

fbgt_cont.44780:
	nop
	nop
	nop
	j	fbgt_cont.44778

fbgt_else.44777:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44778:
fbgt_cont.44772:
	nop
	nop
	nop
	j	fbgt_cont.44766

fbgt_else.44769:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44770:
	nop
	nop
	nop
	j	fbgt_cont.44766

fbgt_else.44767:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44781

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44783

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44785

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44787

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 37(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44782

fbgt_else.44787:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 37(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

fbgt_cont.44788:
	nop
	nop
	nop
	j	fbgt_cont.44782

fbgt_else.44785:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44786:
	nop
	nop
	nop
	j	fbgt_cont.44782

fbgt_else.44783:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44789

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44791

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 37(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44790

fbgt_else.44791:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 37(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

fbgt_cont.44792:
	nop
	nop
	nop
	j	fbgt_cont.44790

fbgt_else.44789:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44790:
fbgt_cont.44784:
	nop
	nop
	nop
	j	fbgt_cont.44782

fbgt_else.44781:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44782:
fbgt_cont.44768:
	nop
	nop
	nop
	j	fbgt_cont.44766

fbgt_else.44765:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44766:
	nop
	nop
	nop
	flw	%f1, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44793

	nop
	nop
	nop
	lw	%v0, 35(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44795

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44794

bnei_else.44795:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.44796:
	nop
	nop
	nop
	j	fbgt_cont.44794

fbgt_else.44793:
	nop
	nop
	nop
	lw	%v0, 35(%sp)

fbgt_cont.44794:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44797

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.44798

fbgt_else.44797:
fbgt_cont.44798:
	nop
	nop
	nop
	flw	%f2, 22(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44799

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.44800

fbgt_else.44799:
fbgt_cont.44800:
	nop
	nop
	nop
	flw	%f1, 21(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44801

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.44802

fbgt_else.44801:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.44802:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44803

	nop
	nop
	nop
	j	bnei_cont.44804

bnei_else.44803:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.44804:
	nop
	nop
	flw	%f1, 34(%sp)
	flw	%f2, 28(%sp)

	nop
	fmul	%f3, %f2, %f1
	flw	%f4, 31(%sp)
	flw	%f5, 25(%sp)

	fmul	%f6, %f5, %f4
	flw	%f8, 20(%sp)
	fmul	%f11, %f5, %f0
	lw	%v0, 7(%sp)

	nop
	nop
	fmul	%f7, %f6, %f1
	fmul	%f9, %f8, %f0

	nop
	nop
	fsub	%f7, %f7, %f9
	fmul	%f9, %f8, %f4

	nop
	nop
	fmul	%f10, %f9, %f1
	fmul	%f6, %f6, %f0

	nop
	nop
	fadd	%f10, %f10, %f11
	fmul	%f11, %f2, %f0

	nop
	fmul	%f12, %f8, %f1
	fmul	%f0, %f9, %f0
	flw	%f9, 2(%v0)

	nop
	nop
	fadd	%f6, %f6, %f12
	fmul	%f1, %f5, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4

	fmul	%f4, %f5, %f2
	fmul	%f2, %f8, %f2
	flw	%f5, 0(%v0)
	flw	%f8, 1(%v0)

	nop
	nop
	fmul	%f12, %f3, %f3
	fmul	%f13, %f11, %f11

	nop
	nop
	fmul	%f12, %f5, %f12
	fmul	%f13, %f8, %f13

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f1, %f1

	nop
	nop
	fmul	%f13, %f9, %f13
	fmul	%f14, %f8, %f6

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f6, %f6

	nop
	fsw	%f12, 0(%v0)
	fmul	%f12, %f7, %f7
	fmul	%f13, %f8, %f13

	nop
	nop
	fmul	%f12, %f5, %f12
	fmul	%f14, %f14, %f0

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f4, %f4

	nop
	nop
	fmul	%f13, %f9, %f13
	fmul	%f3, %f5, %f3

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f0, %f0

	nop
	fsw	%f12, 1(%v0)
	fmul	%f12, %f10, %f10
	fmul	%f13, %f8, %f13

	nop
	nop
	fmul	%f12, %f5, %f12
	fmul	%f8, %f8, %f11

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f2, %f2

	nop
	nop
	fmul	%f13, %f9, %f13
	fmul	%f0, %f8, %f0

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f5, %f7

	fsw	%f12, 2(%v0)
	flw	%f12, 494(%zero)
	fmul	%f13, %f13, %f10
	fmul	%f5, %f3, %f10

	nop
	fadd	%f13, %f13, %f14
	fmul	%f14, %f9, %f4
	lw	%v0, 13(%sp)

	nop
	nop
	fmul	%f14, %f14, %f2
	fadd	%f0, %f5, %f0

	nop
	nop
	fadd	%f13, %f13, %f14
	fmul	%f1, %f9, %f1

	nop
	nop
	fmul	%f13, %f12, %f13
	fmul	%f2, %f1, %f2

	nop
	fsw	%f13, 0(%v0)
	fadd	%f0, %f0, %f2
	fmul	%f2, %f8, %f6

	nop
	nop
	fmul	%f0, %f12, %f0
	fmul	%f1, %f1, %f4

	nop
	nop
	fsw	%f0, 1(%v0)
	fmul	%f0, %f3, %f7

	nop
	nop
	nop
	fadd	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f12, %f0

	nop
	nop
	nop
	fsw	%f0, 2(%v0)

	nop
	nop
	nop
	j	bnei_cont.44420

bnei_else.44419:
bnei_cont.44420:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.44364

bnei_else.44363:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.44364:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44805

	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.44806

	nop
	nop
	nop
	jr	%ra

bgti_else.44806:
	nop
	nop
	nop
	sw	%v0, 37(%sp)

	nop
	nop
	nop
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	nop
	lw	%ra, 38(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.44808

	nop
	nop
	nop
	sw	%v0, 38(%sp)

	nop
	nop
	nop
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	sw	%v0, 39(%sp)

	nop
	nop
	nop
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	sw	%v0, 40(%sp)

	nop
	nop
	nop
	sw	%ra, 41(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 42

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	addi	%sp, %sp, -42
	addi	%v1, %zero, 3
	flw	%f0, 493(%zero)

	nop
	lw	%ra, 41(%sp)
	sw	%v0, 41(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	fsw	%f0, 42(%sp)

	nop
	nop
	nop
	sw	%v1, 43(%sp)

	nop
	nop
	nop
	sw	%ra, 44(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 45

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -45

	nop
	nop
	lw	%ra, 44(%sp)
	sw	%v0, 44(%sp)

	nop
	nop
	nop
	sw	%ra, 45(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 46

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -46

	nop
	nop
	lw	%ra, 45(%sp)
	lw	%v0, 44(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 45(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 46

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -46
	addi	%v1, %zero, 2

	nop
	nop
	lw	%ra, 45(%sp)
	lw	%v0, 44(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	sw	%v1, 45(%sp)

	nop
	nop
	nop
	sw	%ra, 46(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	lw	%ra, 46(%sp)
	lw	%v0, 44(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	flw	%f0, 42(%sp)

	nop
	nop
	lw	%v1, 43(%sp)
	sw	%ra, 46(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	lw	%ra, 46(%sp)
	sw	%v0, 46(%sp)

	nop
	nop
	nop
	sw	%ra, 47(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 48

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -48

	nop
	nop
	lw	%ra, 47(%sp)
	lw	%v0, 46(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 47(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 48

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -48

	nop
	nop
	lw	%ra, 47(%sp)
	lw	%v0, 46(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	sw	%ra, 47(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 48

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -48

	nop
	nop
	lw	%ra, 47(%sp)
	lw	%v0, 46(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	sw	%ra, 47(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 48

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -48

	nop
	nop
	lw	%ra, 47(%sp)
	flw	%f1, 42(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44810

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44811

fbgt_else.44810:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.44811:
	nop
	lw	%v1, 45(%sp)
	sw	%v0, 47(%sp)
	fmov	%f0, %f1

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	lw	%ra, 48(%sp)
	sw	%v0, 48(%sp)

	nop
	nop
	nop
	sw	%ra, 49(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 50

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -50

	nop
	nop
	lw	%ra, 49(%sp)
	lw	%v0, 48(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 49(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 50

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -50

	nop
	nop
	lw	%ra, 49(%sp)
	lw	%v0, 48(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	flw	%f0, 42(%sp)

	nop
	nop
	lw	%v1, 43(%sp)
	sw	%ra, 49(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 50

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -50

	nop
	nop
	lw	%ra, 49(%sp)
	sw	%v0, 49(%sp)

	nop
	nop
	nop
	sw	%ra, 50(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 51

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -51

	nop
	nop
	lw	%ra, 50(%sp)
	lw	%v0, 49(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	sw	%ra, 50(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 51

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -51

	nop
	nop
	lw	%ra, 50(%sp)
	lw	%v0, 49(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	sw	%ra, 50(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 51

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -51

	nop
	nop
	lw	%ra, 50(%sp)
	lw	%v0, 49(%sp)

	nop
	nop
	fsw	%f0, 2(%v0)
	flw	%f0, 42(%sp)

	nop
	nop
	lw	%v1, 43(%sp)
	sw	%ra, 50(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 51

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -51

	nop
	nop
	lw	%ra, 50(%sp)
	lw	%v1, 41(%sp)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44812

	nop
	nop
	nop
	sw	%v0, 50(%sp)

	nop
	nop
	nop
	sw	%ra, 51(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 52

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -52
	flw	%f1, 492(%zero)

	nop
	lw	%ra, 51(%sp)
	fmul	%f0, %f0, %f1
	lw	%v0, 50(%sp)

	nop
	nop
	fsw	%f0, 0(%v0)
	fsw	%f1, 51(%sp)

	nop
	nop
	nop
	sw	%ra, 52(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 53

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -53

	nop
	nop
	lw	%ra, 52(%sp)
	flw	%f1, 51(%sp)

	nop
	fmul	%f0, %f0, %f1
	lw	%v0, 50(%sp)
	sw	%ra, 52(%sp)

	nop
	nop
	fsw	%f0, 1(%v0)
	addi	%sp, %sp, 53

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	addi	%sp, %sp, -53

	nop
	nop
	lw	%ra, 52(%sp)
	flw	%f1, 51(%sp)

	nop
	nop
	fmul	%f0, %f0, %f1
	lw	%v0, 50(%sp)

	nop
	nop
	nop
	fsw	%f0, 2(%v0)

	nop
	nop
	nop
	j	bnei_cont.44813

bnei_else.44812:
bnei_cont.44813:
	nop
	nop
	nop
	lw	%v1, 39(%sp)

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.44814

	nop
	nop
	nop
	lw	%a0, 47(%sp)

	nop
	nop
	nop
	j	bnei_cont.44815

bnei_else.44814:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.44815:
	nop
	addi	%a1, %zero, 4
	flw	%f0, 42(%sp)
	sw	%a0, 52(%sp)

	nop
	nop
	sw	%v0, 50(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 53(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -54
	add	%v1, %zero, %hp

	nop
	lw	%ra, 53(%sp)
	addi	%hp, %hp, 11
	sw	%v0, 10(%v1)

	nop
	nop
	lw	%v0, 50(%sp)
	lw	%a0, 49(%sp)

	nop
	nop
	sw	%v0, 9(%v1)
	lw	%a1, 41(%sp)

	nop
	nop
	sw	%a0, 8(%v1)
	lw	%a0, 48(%sp)

	nop
	nop
	sw	%a0, 7(%v1)
	lw	%a0, 52(%sp)

	nop
	nop
	sw	%a0, 6(%v1)
	lw	%a0, 46(%sp)

	nop
	nop
	sw	%a0, 5(%v1)
	lw	%a0, 44(%sp)

	nop
	nop
	sw	%a0, 4(%v1)
	lw	%a2, 40(%sp)

	nop
	nop
	sw	%a1, 3(%v1)
	lw	%a3, 38(%sp)

	nop
	nop
	sw	%a2, 2(%v1)
	lw	%a2, 39(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%v1)

	nop
	nop
	sw	%a3, 0(%v1)
	lw	%a3, 37(%sp)

	nop
	nop
	nop
	sw	%v1, 12(%a3)

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.44816

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.44818

	nop
	nop
	nop
	j	bnei_cont.44817

bnei_else.44818:
	nop
	nop
	nop
	lw	%v1, 47(%sp)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44820

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.44821

bnei_else.44820:
	nop
	nop
	nop
	addi	%v1, %zero, 1

bnei_cont.44821:
	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a0)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 2(%a0)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 42(%sp)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.44822

	nop
	nop
	nop
	addi	%a2, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44823

fbeq_else.44822:
	nop
	nop
	nop
	addi	%a2, %zero, 0

fbeq_cont.44823:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.44824

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.44825

bnei_else.44824:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44826

	nop
	nop
	nop
	flw	%f5, 490(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.44827

bnei_else.44826:
	nop
	nop
	nop
	flw	%f5, 491(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

bnei_cont.44827:
bnei_cont.44825:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 0(%a0)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 1(%a0)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 2(%a0)

bnei_cont.44819:
	nop
	nop
	nop
	j	bnei_cont.44817

bnei_else.44816:
	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f1, 42(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44828

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44829

fbeq_else.44828:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44829:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44830

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.44831

bnei_else.44830:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44832

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44833

fbeq_else.44832:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44833:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44834

	nop
	nop
	nop
	fmov	%f2, %f1

	nop
	nop
	nop
	j	bnei_cont.44835

bnei_else.44834:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44836

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44837

fbgt_else.44836:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.44837:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44838

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.44839

bnei_else.44838:
	nop
	nop
	nop
	flw	%f2, 490(%zero)

bnei_cont.44839:
bnei_cont.44835:
	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

bnei_cont.44831:
	nop
	nop
	nop
	fsw	%f0, 0(%a0)

	nop
	nop
	nop
	flw	%f0, 1(%a0)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44840

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44841

fbeq_else.44840:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44841:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44842

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.44843

bnei_else.44842:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44844

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44845

fbeq_else.44844:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44845:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44846

	nop
	nop
	nop
	fmov	%f2, %f1

	nop
	nop
	nop
	j	bnei_cont.44847

bnei_else.44846:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44848

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44849

fbgt_else.44848:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.44849:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44850

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.44851

bnei_else.44850:
	nop
	nop
	nop
	flw	%f2, 490(%zero)

bnei_cont.44851:
bnei_cont.44847:
	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

bnei_cont.44843:
	nop
	nop
	nop
	fsw	%f0, 1(%a0)

	nop
	nop
	nop
	flw	%f0, 2(%a0)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44852

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44853

fbeq_else.44852:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44853:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44854

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.44855

bnei_else.44854:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44856

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.44857

fbeq_else.44856:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.44857:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44858

	nop
	nop
	nop
	fmov	%f2, %f1

	nop
	nop
	nop
	j	bnei_cont.44859

bnei_else.44858:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44860

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44861

fbgt_else.44860:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.44861:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44862

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.44863

bnei_else.44862:
	nop
	nop
	nop
	flw	%f2, 490(%zero)

bnei_cont.44863:
bnei_cont.44859:
	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

bnei_cont.44855:
	nop
	nop
	nop
	fsw	%f0, 2(%a0)

bnei_cont.44817:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44864

	nop
	nop
	flw	%f0, 0(%v0)
	flw	%f1, 489(%zero)

	nop
	fabs	%f2, %f0
	flw	%f3, 488(%zero)
	fsw	%f0, 53(%sp)

	nop
	nop
	nop
	fsw	%f1, 54(%sp)

	nop
	nop
	nop
	fsw	%f2, 55(%sp)

	nop
	nop
	nop
	fsw	%f3, 56(%sp)

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.44866

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44868

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44870

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44872

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44874

	nop
	nop
	nop
	flw	%f4, 483(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44876

	nop
	nop
	nop
	flw	%f4, 482(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44878

	nop
	nop
	nop
	flw	%f4, 481(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44880

	nop
	nop
	nop
	flw	%f4, 480(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44882

	nop
	nop
	nop
	flw	%f4, 479(%zero)

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.44884

	nop
	flw	%f4, 478(%zero)
	fmov	%f0, %f2
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44884:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44885:
	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44882:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44883:
	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44880:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44881:
	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44878:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44879:
	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44876:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44877:
	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44874:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44875:
	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44872:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44873:
	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44870:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44871:
	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44868:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.44869:
	nop
	nop
	nop
	j	fbgt_cont.44867

fbgt_else.44866:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.44867:
	nop
	nop
	flw	%f1, 55(%sp)
	flw	%f2, 56(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44886

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44888

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44890

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44892

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44887

fbgt_else.44892:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

fbgt_cont.44893:
	nop
	nop
	nop
	j	fbgt_cont.44887

fbgt_else.44890:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44891:
	nop
	nop
	nop
	j	fbgt_cont.44887

fbgt_else.44888:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44894

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44896

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44895

fbgt_else.44896:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

fbgt_cont.44897:
	nop
	nop
	nop
	j	fbgt_cont.44895

fbgt_else.44894:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44895:
fbgt_cont.44889:
	nop
	nop
	nop
	j	fbgt_cont.44887

fbgt_else.44886:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44887:
	nop
	nop
	nop
	flw	%f1, 54(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44898

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44899

fbgt_else.44898:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.44899:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44900

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.44901

fbgt_else.44900:
fbgt_cont.44901:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44902

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44904

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44903

bnei_else.44904:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.44905:
	nop
	nop
	nop
	j	fbgt_cont.44903

fbgt_else.44902:
fbgt_cont.44903:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44906

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.44907

fbgt_else.44906:
fbgt_cont.44907:
	nop
	nop
	nop
	flw	%f3, 475(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44908

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.44909

fbgt_else.44908:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.44909:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44910

	nop
	nop
	nop
	j	bnei_cont.44911

bnei_else.44910:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.44911:
	nop
	nop
	flw	%f4, 53(%sp)
	flw	%f5, 42(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.44912

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.44913

fbgt_else.44912:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.44913:
	nop
	fabs	%f4, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 57(%sp)

	nop
	nop
	nop
	fsw	%f3, 58(%sp)

	nop
	nop
	nop
	fsw	%f2, 59(%sp)

	nop
	nop
	nop
	sw	%v0, 60(%sp)

	nop
	nop
	nop
	fsw	%f4, 61(%sp)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44914

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44916

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44918

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44920

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44922

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44924

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44926

	nop
	nop
	nop
	flw	%f7, 481(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44928

	nop
	nop
	nop
	flw	%f7, 480(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44930

	nop
	nop
	nop
	flw	%f7, 479(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.44932

	nop
	flw	%f7, 478(%zero)
	fmov	%f0, %f4
	sw	%ra, 62(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 63

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -63

	nop
	nop
	nop
	lw	%ra, 62(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44932:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44933:
	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44930:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44931:
	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44928:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44929:
	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44926:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44927:
	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44924:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44925:
	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44922:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44923:
	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44920:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44921:
	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44918:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44919:
	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44916:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44917:
	nop
	nop
	nop
	j	fbgt_cont.44915

fbgt_else.44914:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44915:
	nop
	nop
	flw	%f1, 61(%sp)
	flw	%f2, 56(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44934

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44936

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44938

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44940

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 62(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 63

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -63

	nop
	nop
	nop
	lw	%ra, 62(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44935

fbgt_else.44940:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 62(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 63

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -63

	nop
	nop
	nop
	lw	%ra, 62(%sp)

fbgt_cont.44941:
	nop
	nop
	nop
	j	fbgt_cont.44935

fbgt_else.44938:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44939:
	nop
	nop
	nop
	j	fbgt_cont.44935

fbgt_else.44936:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44942

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44944

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 62(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 63

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -63

	nop
	nop
	nop
	lw	%ra, 62(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44943

fbgt_else.44944:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 62(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 63

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -63

	nop
	nop
	nop
	lw	%ra, 62(%sp)

fbgt_cont.44945:
	nop
	nop
	nop
	j	fbgt_cont.44943

fbgt_else.44942:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44943:
fbgt_cont.44937:
	nop
	nop
	nop
	j	fbgt_cont.44935

fbgt_else.44934:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44935:
	nop
	nop
	nop
	flw	%f1, 54(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44946

	nop
	nop
	nop
	lw	%v0, 60(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44948

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44947

bnei_else.44948:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.44949:
	nop
	nop
	nop
	j	fbgt_cont.44947

fbgt_else.44946:
	nop
	nop
	nop
	lw	%v0, 60(%sp)

fbgt_cont.44947:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44950

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.44951

fbgt_else.44950:
fbgt_cont.44951:
	nop
	nop
	nop
	flw	%f2, 59(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44952

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.44953

fbgt_else.44952:
fbgt_cont.44953:
	nop
	nop
	nop
	flw	%f3, 58(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44954

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.44955

fbgt_else.44954:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.44955:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44956

	nop
	nop
	nop
	j	bnei_cont.44957

bnei_else.44956:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.44957:
	nop
	nop
	lw	%v0, 50(%sp)
	flw	%f6, 56(%sp)

	nop
	nop
	flw	%f4, 1(%v0)
	fsw	%f0, 62(%sp)

	nop
	nop
	fabs	%f5, %f4
	fsw	%f4, 63(%sp)

	nop
	nop
	nop
	fsw	%f5, 64(%sp)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.44958

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44960

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44962

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44964

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44966

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44968

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44970

	nop
	nop
	nop
	flw	%f7, 481(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44972

	nop
	nop
	nop
	flw	%f7, 480(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44974

	nop
	nop
	nop
	flw	%f7, 479(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.44976

	nop
	flw	%f7, 478(%zero)
	fmov	%f0, %f5
	sw	%ra, 65(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 66

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -66

	nop
	nop
	nop
	lw	%ra, 65(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44976:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44977:
	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44974:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44975:
	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44972:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44973:
	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44970:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44971:
	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44968:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44969:
	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44966:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44967:
	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44964:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44965:
	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44962:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44963:
	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44960:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.44961:
	nop
	nop
	nop
	j	fbgt_cont.44959

fbgt_else.44958:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.44959:
	nop
	nop
	flw	%f1, 64(%sp)
	flw	%f2, 56(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44978

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44980

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44982

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44984

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 65(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 66

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -66

	nop
	nop
	nop
	lw	%ra, 65(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44979

fbgt_else.44984:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 65(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 66

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -66

	nop
	nop
	nop
	lw	%ra, 65(%sp)

fbgt_cont.44985:
	nop
	nop
	nop
	j	fbgt_cont.44979

fbgt_else.44982:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44983:
	nop
	nop
	nop
	j	fbgt_cont.44979

fbgt_else.44980:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44986

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44988

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 65(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 66

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -66

	nop
	nop
	nop
	lw	%ra, 65(%sp)

	nop
	nop
	nop
	j	fbgt_cont.44987

fbgt_else.44988:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 65(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 66

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -66

	nop
	nop
	nop
	lw	%ra, 65(%sp)

fbgt_cont.44989:
	nop
	nop
	nop
	j	fbgt_cont.44987

fbgt_else.44986:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44987:
fbgt_cont.44981:
	nop
	nop
	nop
	j	fbgt_cont.44979

fbgt_else.44978:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.44979:
	nop
	nop
	nop
	flw	%f1, 54(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44990

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44991

fbgt_else.44990:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.44991:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44992

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.44993

fbgt_else.44992:
fbgt_cont.44993:
	nop
	nop
	nop
	flw	%f2, 59(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44994

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44996

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.44995

bnei_else.44996:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.44997:
	nop
	nop
	nop
	j	fbgt_cont.44995

fbgt_else.44994:
fbgt_cont.44995:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44998

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.44999

fbgt_else.44998:
fbgt_cont.44999:
	nop
	nop
	nop
	flw	%f3, 58(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.45000

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.45001

fbgt_else.45000:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.45001:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45002

	nop
	nop
	nop
	j	bnei_cont.45003

bnei_else.45002:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.45003:
	nop
	nop
	flw	%f4, 63(%sp)
	flw	%f5, 42(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.45004

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.45005

fbgt_else.45004:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.45005:
	nop
	fabs	%f4, %f4
	flw	%f6, 56(%sp)
	fsw	%f0, 65(%sp)

	nop
	nop
	nop
	sw	%v0, 66(%sp)

	nop
	nop
	nop
	fsw	%f4, 67(%sp)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45006

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.45008

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.45010

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.45012

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.45014

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.45016

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.45018

	nop
	nop
	nop
	flw	%f7, 481(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.45020

	nop
	nop
	nop
	flw	%f7, 480(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.45022

	nop
	nop
	nop
	flw	%f7, 479(%zero)

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.45024

	nop
	flw	%f7, 478(%zero)
	fmov	%f0, %f4
	sw	%ra, 68(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 69

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -69

	nop
	nop
	nop
	lw	%ra, 68(%sp)

	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45024:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45025:
	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45022:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45023:
	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45020:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45021:
	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45018:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45019:
	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45016:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45017:
	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45014:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45015:
	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45012:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45013:
	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45010:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45011:
	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45008:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45009:
	nop
	nop
	nop
	j	fbgt_cont.45007

fbgt_else.45006:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45007:
	nop
	nop
	flw	%f1, 67(%sp)
	flw	%f2, 56(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.45026

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45028

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.45030

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45032

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 68(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 69

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -69

	nop
	nop
	nop
	lw	%ra, 68(%sp)

	nop
	nop
	nop
	j	fbgt_cont.45027

fbgt_else.45032:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 68(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 69

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -69

	nop
	nop
	nop
	lw	%ra, 68(%sp)

fbgt_cont.45033:
	nop
	nop
	nop
	j	fbgt_cont.45027

fbgt_else.45030:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.45031:
	nop
	nop
	nop
	j	fbgt_cont.45027

fbgt_else.45028:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.45034

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45036

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 68(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 69

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -69

	nop
	nop
	nop
	lw	%ra, 68(%sp)

	nop
	nop
	nop
	j	fbgt_cont.45035

fbgt_else.45036:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 68(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 69

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -69

	nop
	nop
	nop
	lw	%ra, 68(%sp)

fbgt_cont.45037:
	nop
	nop
	nop
	j	fbgt_cont.45035

fbgt_else.45034:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.45035:
fbgt_cont.45029:
	nop
	nop
	nop
	j	fbgt_cont.45027

fbgt_else.45026:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.45027:
	nop
	nop
	nop
	flw	%f1, 54(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45038

	nop
	nop
	nop
	lw	%v0, 66(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45040

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45039

bnei_else.45040:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.45041:
	nop
	nop
	nop
	j	fbgt_cont.45039

fbgt_else.45038:
	nop
	nop
	nop
	lw	%v0, 66(%sp)

fbgt_cont.45039:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45042

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.45043

fbgt_else.45042:
fbgt_cont.45043:
	nop
	nop
	nop
	flw	%f2, 59(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.45044

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.45045

fbgt_else.45044:
fbgt_cont.45045:
	nop
	nop
	nop
	flw	%f3, 58(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.45046

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.45047

fbgt_else.45046:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.45047:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45048

	nop
	nop
	nop
	j	bnei_cont.45049

bnei_else.45048:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.45049:
	nop
	nop
	lw	%v0, 50(%sp)
	flw	%f6, 56(%sp)

	nop
	nop
	flw	%f4, 2(%v0)
	fsw	%f0, 68(%sp)

	nop
	nop
	fabs	%f5, %f4
	fsw	%f4, 69(%sp)

	nop
	nop
	nop
	fsw	%f5, 70(%sp)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.45050

	nop
	nop
	nop
	flw	%f7, 487(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.45052

	nop
	nop
	nop
	flw	%f7, 486(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.45054

	nop
	nop
	nop
	flw	%f7, 485(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.45056

	nop
	nop
	nop
	flw	%f7, 484(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.45058

	nop
	nop
	nop
	flw	%f7, 483(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.45060

	nop
	nop
	nop
	flw	%f7, 482(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.45062

	nop
	nop
	nop
	flw	%f7, 481(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.45064

	nop
	nop
	nop
	flw	%f7, 480(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.45066

	nop
	nop
	nop
	flw	%f7, 479(%zero)

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.45068

	nop
	flw	%f7, 478(%zero)
	fmov	%f0, %f5
	sw	%ra, 71(%sp)

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 72

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -72

	nop
	nop
	nop
	lw	%ra, 71(%sp)

	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45068:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45069:
	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45066:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45067:
	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45064:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45065:
	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45062:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45063:
	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45060:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45061:
	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45058:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45059:
	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45056:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45057:
	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45054:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45055:
	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45052:
	nop
	nop
	nop
	fmov	%f0, %f7

fbgt_cont.45053:
	nop
	nop
	nop
	j	fbgt_cont.45051

fbgt_else.45050:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45051:
	nop
	nop
	flw	%f1, 70(%sp)
	flw	%f2, 56(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.45070

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45072

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.45074

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45076

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 71(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 72

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -72

	nop
	nop
	nop
	lw	%ra, 71(%sp)

	nop
	nop
	nop
	j	fbgt_cont.45071

fbgt_else.45076:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 71(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 72

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -72

	nop
	nop
	nop
	lw	%ra, 71(%sp)

fbgt_cont.45077:
	nop
	nop
	nop
	j	fbgt_cont.45071

fbgt_else.45074:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.45075:
	nop
	nop
	nop
	j	fbgt_cont.45071

fbgt_else.45072:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.45078

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45080

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 71(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 72

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -72

	nop
	nop
	nop
	lw	%ra, 71(%sp)

	nop
	nop
	nop
	j	fbgt_cont.45079

fbgt_else.45080:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 71(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 72

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -72

	nop
	nop
	nop
	lw	%ra, 71(%sp)

fbgt_cont.45081:
	nop
	nop
	nop
	j	fbgt_cont.45079

fbgt_else.45078:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.45079:
fbgt_cont.45073:
	nop
	nop
	nop
	j	fbgt_cont.45071

fbgt_else.45070:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.45071:
	nop
	nop
	nop
	flw	%f1, 54(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45082

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45083

fbgt_else.45082:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.45083:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45084

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.45085

fbgt_else.45084:
fbgt_cont.45085:
	nop
	nop
	nop
	flw	%f2, 59(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.45086

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45088

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45087

bnei_else.45088:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.45089:
	nop
	nop
	nop
	j	fbgt_cont.45087

fbgt_else.45086:
fbgt_cont.45087:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.45090

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.45091

fbgt_else.45090:
fbgt_cont.45091:
	nop
	nop
	nop
	flw	%f3, 58(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.45092

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 470(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.45093

fbgt_else.45092:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.45093:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45094

	nop
	nop
	nop
	j	bnei_cont.45095

bnei_else.45094:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.45095:
	nop
	nop
	flw	%f4, 69(%sp)
	flw	%f5, 42(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.45096

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.45097

fbgt_else.45096:
	nop
	nop
	nop
	addi	%v0, %zero, 0

fbgt_cont.45097:
	nop
	fabs	%f4, %f4
	flw	%f5, 56(%sp)
	fsw	%f0, 71(%sp)

	nop
	nop
	nop
	sw	%v0, 72(%sp)

	nop
	nop
	nop
	fsw	%f4, 73(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.45098

	nop
	nop
	nop
	flw	%f6, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45100

	nop
	nop
	nop
	flw	%f6, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45102

	nop
	nop
	nop
	flw	%f6, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45104

	nop
	nop
	nop
	flw	%f6, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45106

	nop
	nop
	nop
	flw	%f6, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45108

	nop
	nop
	nop
	flw	%f6, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45110

	nop
	nop
	nop
	flw	%f6, 481(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45112

	nop
	nop
	nop
	flw	%f6, 480(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45114

	nop
	nop
	nop
	flw	%f6, 479(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.45116

	nop
	flw	%f6, 478(%zero)
	fmov	%f0, %f4
	sw	%ra, 74(%sp)

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 75

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -75

	nop
	nop
	nop
	lw	%ra, 74(%sp)

	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45116:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45117:
	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45114:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45115:
	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45112:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45113:
	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45110:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45111:
	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45108:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45109:
	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45106:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45107:
	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45104:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45105:
	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45102:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45103:
	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45100:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.45101:
	nop
	nop
	nop
	j	fbgt_cont.45099

fbgt_else.45098:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.45099:
	nop
	nop
	flw	%f1, 73(%sp)
	flw	%f2, 56(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.45118

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45120

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.45122

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45124

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 74(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 75

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -75

	nop
	nop
	nop
	lw	%ra, 74(%sp)

	nop
	nop
	nop
	j	fbgt_cont.45119

fbgt_else.45124:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 74(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 75

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -75

	nop
	nop
	nop
	lw	%ra, 74(%sp)

fbgt_cont.45125:
	nop
	nop
	nop
	j	fbgt_cont.45119

fbgt_else.45122:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.45123:
	nop
	nop
	nop
	j	fbgt_cont.45119

fbgt_else.45120:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.45126

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45128

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 74(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 75

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -75

	nop
	nop
	nop
	lw	%ra, 74(%sp)

	nop
	nop
	nop
	j	fbgt_cont.45127

fbgt_else.45128:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 74(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 75

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -75

	nop
	nop
	nop
	lw	%ra, 74(%sp)

fbgt_cont.45129:
	nop
	nop
	nop
	j	fbgt_cont.45127

fbgt_else.45126:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.45127:
fbgt_cont.45121:
	nop
	nop
	nop
	j	fbgt_cont.45119

fbgt_else.45118:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.45119:
	nop
	nop
	nop
	flw	%f1, 54(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45130

	nop
	nop
	nop
	lw	%v0, 72(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45132

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45131

bnei_else.45132:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.45133:
	nop
	nop
	nop
	j	fbgt_cont.45131

fbgt_else.45130:
	nop
	nop
	nop
	lw	%v0, 72(%sp)

fbgt_cont.45131:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45134

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.45135

fbgt_else.45134:
fbgt_cont.45135:
	nop
	nop
	nop
	flw	%f2, 59(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.45136

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.45137

fbgt_else.45136:
fbgt_cont.45137:
	nop
	nop
	nop
	flw	%f1, 58(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45138

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.45139

fbgt_else.45138:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.45139:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45140

	nop
	nop
	nop
	j	bnei_cont.45141

bnei_else.45140:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.45141:
	nop
	nop
	flw	%f1, 71(%sp)
	flw	%f2, 65(%sp)

	nop
	fmul	%f3, %f2, %f1
	flw	%f4, 68(%sp)
	flw	%f5, 62(%sp)

	fmul	%f6, %f5, %f4
	flw	%f8, 57(%sp)
	fmul	%f11, %f5, %f0
	lw	%v0, 44(%sp)

	nop
	nop
	fmul	%f7, %f6, %f1
	fmul	%f9, %f8, %f0

	nop
	nop
	fsub	%f7, %f7, %f9
	fmul	%f9, %f8, %f4

	nop
	nop
	fmul	%f10, %f9, %f1
	fmul	%f6, %f6, %f0

	nop
	nop
	fadd	%f10, %f10, %f11
	fmul	%f11, %f2, %f0

	nop
	fmul	%f12, %f8, %f1
	fmul	%f0, %f9, %f0
	flw	%f9, 2(%v0)

	nop
	nop
	fadd	%f6, %f6, %f12
	fmul	%f1, %f5, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4

	fmul	%f4, %f5, %f2
	fmul	%f2, %f8, %f2
	flw	%f5, 0(%v0)
	flw	%f8, 1(%v0)

	nop
	nop
	fmul	%f12, %f3, %f3
	fmul	%f13, %f11, %f11

	nop
	nop
	fmul	%f12, %f5, %f12
	fmul	%f13, %f8, %f13

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f1, %f1

	nop
	nop
	fmul	%f13, %f9, %f13
	fmul	%f14, %f8, %f6

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f6, %f6

	nop
	fsw	%f12, 0(%v0)
	fmul	%f12, %f7, %f7
	fmul	%f13, %f8, %f13

	nop
	nop
	fmul	%f12, %f5, %f12
	fmul	%f14, %f14, %f0

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f4, %f4

	nop
	nop
	fmul	%f13, %f9, %f13
	fmul	%f3, %f5, %f3

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f0, %f0

	nop
	fsw	%f12, 1(%v0)
	fmul	%f12, %f10, %f10
	fmul	%f13, %f8, %f13

	nop
	nop
	fmul	%f12, %f5, %f12
	fmul	%f8, %f8, %f11

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f2, %f2

	nop
	nop
	fmul	%f13, %f9, %f13
	fmul	%f0, %f8, %f0

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f13, %f5, %f7

	fsw	%f12, 2(%v0)
	flw	%f12, 494(%zero)
	fmul	%f13, %f13, %f10
	fmul	%f5, %f3, %f10

	nop
	fadd	%f13, %f13, %f14
	fmul	%f14, %f9, %f4
	lw	%v0, 50(%sp)

	nop
	nop
	fmul	%f14, %f14, %f2
	fadd	%f0, %f5, %f0

	nop
	nop
	fadd	%f13, %f13, %f14
	fmul	%f1, %f9, %f1

	nop
	nop
	fmul	%f13, %f12, %f13
	fmul	%f2, %f1, %f2

	nop
	fsw	%f13, 0(%v0)
	fadd	%f0, %f0, %f2
	fmul	%f2, %f8, %f6

	nop
	nop
	fmul	%f0, %f12, %f0
	fmul	%f1, %f1, %f4

	nop
	nop
	fsw	%f0, 1(%v0)
	fmul	%f0, %f3, %f7

	nop
	nop
	nop
	fadd	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f12, %f0

	nop
	nop
	nop
	fsw	%f0, 2(%v0)

	nop
	nop
	nop
	j	bnei_cont.44865

bnei_else.44864:
bnei_cont.44865:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.44809

bnei_else.44808:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.44809:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45142

	nop
	nop
	nop
	lw	%v0, 37(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	read_object.2772

bnei_else.45142:
	nop
	nop
	nop
	lw	%v0, 37(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.44805:
	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%zero)

	nop
	nop
	nop
	jr	%ra

read_net_item.2776:
	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 1(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %zero, -1

	nop
	nop
	nop
	lw	%ra, 1(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45158

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%v0, 1(%sp)

	nop
	nop
	addi	%a1, %a0, 1
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%a1, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45159

	nop
	nop
	lw	%v1, 3(%sp)
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	addi	%a0, %v1, 1

	nop
	nop
	nop
	sw	%a0, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45161

	nop
	nop
	lw	%v1, 5(%sp)
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	addi	%a0, %v1, 1

	nop
	nop
	nop
	sw	%a0, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45163

	nop
	nop
	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)

	nop
	nop
	addi	%a0, %v1, 1
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)

	nop
	nop
	lw	%a0, 8(%sp)
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.45164

bnei_else.45163:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.45164:
	nop
	nop
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.45162

bnei_else.45161:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.45162:
	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.45160

bnei_else.45159:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.45160:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	jr	%ra

bnei_else.45158:
	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	min_caml_create_array

read_or_network.2778:
	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 1(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %zero, -1

	nop
	nop
	lw	%ra, 1(%sp)
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45182

	nop
	nop
	nop
	sw	%v0, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 3(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45184

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45186

	nop
	nop
	addi	%v1, %zero, 3
	sw	%v0, 4(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%v0)

	nop
	nop
	nop
	j	bnei_cont.45187

bnei_else.45186:
	nop
	addi	%v0, %zero, 3
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

bnei_cont.45187:
	nop
	nop
	nop
	lw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.45185

bnei_else.45184:
	nop
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

bnei_cont.45185:
	nop
	nop
	nop
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	add	%v1, %zero, %v0

	nop
	nop
	nop
	j	bnei_cont.45183

bnei_else.45182:
	nop
	nop
	addi	%v0, %zero, 1
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %v0, 0

	nop
	nop
	nop
	lw	%ra, 5(%sp)

bnei_cont.45183:
	nop
	nop
	nop
	lw	%v0, 0(%v1)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45188

	nop
	addi	%v0, %zero, 1
	lw	%a0, 0(%sp)
	sw	%v1, 5(%sp)

	nop
	nop
	nop
	addi	%a1, %a0, 1

	nop
	nop
	nop
	sw	%a1, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45189

	nop
	nop
	nop
	sw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45191

	nop
	nop
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.45192

bnei_else.45191:
	nop
	addi	%v0, %zero, 2
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.45192:
	nop
	nop
	nop
	lw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	add	%v1, %zero, %v0

	nop
	nop
	nop
	j	bnei_cont.45190

bnei_else.45189:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.45190:
	nop
	nop
	nop
	lw	%v0, 0(%v1)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45193

	nop
	nop
	lw	%v0, 6(%sp)
	sw	%v1, 10(%sp)

	nop
	nop
	addi	%a0, %v0, 1
	sw	%ra, 11(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	read_or_network.2778

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 10(%sp)
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.45194

bnei_else.45193:
	nop
	nop
	lw	%v0, 6(%sp)
	sw	%ra, 11(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

bnei_cont.45194:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

	nop
	nop
	nop
	jr	%ra

bnei_else.45188:
	nop
	nop
	nop
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	min_caml_create_array

read_and_network.2780:
	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	sw	%v1, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 2(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %zero, -1

	nop
	nop
	lw	%ra, 2(%sp)
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45216

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45218

	nop
	nop
	nop
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45220

	nop
	nop
	addi	%v1, %zero, 3
	sw	%v0, 5(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%v0)

	nop
	nop
	nop
	j	bnei_cont.45221

bnei_else.45220:
	nop
	addi	%v0, %zero, 3
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

bnei_cont.45221:
	nop
	nop
	nop
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.45219

bnei_else.45218:
	nop
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

bnei_cont.45219:
	nop
	nop
	nop
	lw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	j	bnei_cont.45217

bnei_else.45216:
	nop
	nop
	addi	%v0, %zero, 1
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

bnei_cont.45217:
	nop
	nop
	nop
	lw	%v1, 0(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.45222

	nop
	nop
	nop
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 83(%v1)
	addi	%v0, %zero, 1

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	sw	%v1, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45223

	nop
	nop
	nop
	sw	%v0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45225

	nop
	nop
	addi	%v1, %zero, 2
	sw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.45226

bnei_else.45225:
	nop
	addi	%v0, %zero, 2
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.45226:
	nop
	nop
	nop
	lw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	j	bnei_cont.45224

bnei_else.45223:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.45224:
	nop
	nop
	nop
	lw	%v1, 0(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.45227

	nop
	nop
	nop
	lw	%v1, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 83(%v1)

	nop
	nop
	nop
	addi	%v0, %v1, 1

	nop
	nop
	nop
	sw	%v0, 10(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.45228

	nop
	nop
	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	nop
	sw	%v1, 0(%v0)

	nop
	nop
	nop
	j	bnei_cont.45229

bnei_else.45228:
	nop
	nop
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

bnei_cont.45229:
	nop
	nop
	nop
	lw	%v1, 0(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.45230

	nop
	nop
	nop
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	sw	%v0, 83(%v1)

	nop
	nop
	addi	%v0, %v1, 1
	lw	%v1, 0(%sp)

	nop
	nop
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -14
	lw	%v1, 0(%v0)

	nop
	nop
	nop
	lw	%ra, 13(%sp)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.45231

	nop
	nop
	nop
	lw	%v1, 12(%sp)

	nop
	nop
	nop
	sw	%v0, 83(%v1)

	nop
	nop
	nop
	addi	%v0, %v1, 1

	nop
	nop
	nop
	j	read_and_network.2780

bnei_else.45231:
	nop
	nop
	nop
	jr	%ra

bnei_else.45230:
	nop
	nop
	nop
	jr	%ra

bnei_else.45227:
	nop
	nop
	nop
	jr	%ra

bnei_else.45222:
	nop
	nop
	nop
	jr	%ra

iter_setup_dirvec_constants.2877:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.45277

	nop
	nop
	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)

	nop
	nop
	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)

	nop
	nop
	nop
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.45278

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.45280

	nop
	addi	%a3, %zero, 5
	flw	%f0, 493(%zero)
	sw	%v1, 1(%sp)

	nop
	nop
	sw	%a1, 2(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	fsw	%f0, 3(%sp)

	nop
	nop
	nop
	sw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%a2, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)

	nop
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45282

	nop
	nop
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	j	bnei_cont.45283

bnei_else.45282:
bnei_cont.45283:
	nop
	nop
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f0, %f4
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	fneg	%f4, %f4
	fmul	%f5, %f1, %f5
	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	nop
	fneg	%f6, %f6

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45284

	nop
	nop
	nop
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f8, %f2, %f7
	flw	%f9, 2(%a0)
	lw	%v1, 9(%v1)

	nop
	nop
	nop
	fmul	%f10, %f1, %f9

	nop
	nop
	fadd	%f8, %f8, %f10
	flw	%f10, 471(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	fsub	%f4, %f4, %f8
	fmul	%f8, %f0, %f9

	nop
	fsw	%f4, 1(%v0)
	flw	%f4, 0(%v1)
	fmul	%f0, %f0, %f7

	nop
	nop
	fmul	%f2, %f2, %f4
	fmul	%f1, %f1, %f4

	nop
	nop
	fadd	%f2, %f2, %f8
	fadd	%f0, %f1, %f0

	nop
	nop
	fmul	%f2, %f2, %f10
	fmul	%f0, %f0, %f10

	nop
	nop
	fsub	%f2, %f5, %f2
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	fsw	%f2, 2(%v0)

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.45285

bnei_else.45284:
	nop
	nop
	nop
	fsw	%f4, 1(%v0)

	nop
	nop
	nop
	fsw	%f5, 2(%v0)

	nop
	nop
	nop
	fsw	%f6, 3(%v0)

bnei_cont.45285:
	nop
	nop
	nop
	flw	%f0, 3(%sp)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.45286

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45287

fbeq_else.45286:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.45287:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.45288

	nop
	nop
	nop
	j	bnei_cont.45289

bnei_else.45288:
	nop
	nop
	nop
	flw	%f0, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 4(%v0)

bnei_cont.45289:
	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.45279

bnei_else.45280:
	nop
	addi	%a3, %zero, 4
	flw	%f0, 493(%zero)
	sw	%v1, 1(%sp)

	nop
	nop
	sw	%a1, 2(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	fsw	%f0, 6(%sp)

	nop
	nop
	nop
	sw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%a2, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 4(%sp)

	nop
	nop
	lw	%a1, 4(%a0)
	flw	%f2, 1(%v1)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f3, 1(%a1)

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 2(%v1)

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 6(%sp)

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.45290

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45291

fbgt_else.45290:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.45291:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.45292

	nop
	nop
	flw	%f2, 490(%zero)
	fdiv	%f1, %f1, %f0

	nop
	nop
	fdiv	%f2, %f2, %f0
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f2, 0(%v0)

	nop
	fsw	%f1, 1(%v0)
	fdiv	%f1, %f3, %f0
	fdiv	%f0, %f4, %f0

	nop
	nop
	fneg	%f1, %f1
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f1, 2(%v0)

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.45293

bnei_else.45292:
	nop
	nop
	nop
	fsw	%f2, 0(%v0)

bnei_cont.45293:
	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.45281:
	nop
	nop
	nop
	j	bnei_cont.45279

bnei_else.45278:
	nop
	addi	%a3, %zero, 6
	flw	%f0, 493(%zero)
	sw	%v1, 1(%sp)

	nop
	nop
	sw	%a1, 2(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	sw	%a0, 4(%sp)

	nop
	nop
	nop
	fsw	%f0, 7(%sp)

	nop
	nop
	nop
	sw	%a2, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 7(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.45294

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45295

fbeq_else.45294:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.45295:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45296

	nop
	nop
	nop
	fsw	%f1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.45297

bnei_else.45296:
	nop
	nop
	nop
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45298

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45299

fbgt_else.45298:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.45299:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45300

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45302

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45301

bnei_else.45302:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.45303:
	nop
	nop
	nop
	j	bnei_cont.45301

bnei_else.45300:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.45301:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 0(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45304

	nop
	nop
	nop
	j	bnei_cont.45305

bnei_else.45304:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.45305:
	nop
	nop
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

bnei_cont.45297:
	nop
	nop
	nop
	flw	%f0, 1(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.45306

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45307

fbeq_else.45306:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.45307:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45308

	nop
	nop
	nop
	fsw	%f1, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.45309

bnei_else.45308:
	nop
	nop
	nop
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45310

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45311

fbgt_else.45310:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.45311:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45312

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45314

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45313

bnei_else.45314:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.45315:
	nop
	nop
	nop
	j	bnei_cont.45313

bnei_else.45312:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.45313:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 1(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45316

	nop
	nop
	nop
	j	bnei_cont.45317

bnei_else.45316:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.45317:
	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

bnei_cont.45309:
	nop
	nop
	nop
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.45318

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45319

fbeq_else.45318:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.45319:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.45320

	nop
	nop
	nop
	fsw	%f1, 5(%v0)

	nop
	nop
	nop
	j	bnei_cont.45321

bnei_else.45320:
	nop
	nop
	nop
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	lw	%a0, 6(%v1)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45322

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45323

fbgt_else.45322:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45323:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45324

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45326

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45325

bnei_else.45326:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45327:
	nop
	nop
	nop
	j	bnei_cont.45325

bnei_else.45324:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.45325:
	nop
	nop
	nop
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45328

	nop
	nop
	nop
	j	bnei_cont.45329

bnei_else.45328:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.45329:
	nop
	nop
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 5(%v0)

bnei_cont.45321:
	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.45279:
	nop
	nop
	nop
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.45330

	nop
	nop
	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)

	nop
	nop
	lw	%a1, 1(%a0)
	lw	%a2, 0(%a0)

	nop
	nop
	nop
	lw	%a3, 1(%v1)

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.45331

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.45333

	nop
	addi	%a3, %zero, 5
	flw	%f0, 493(%zero)
	sw	%v0, 8(%sp)

	nop
	nop
	sw	%a1, 9(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	fsw	%f0, 10(%sp)

	nop
	nop
	nop
	sw	%v1, 11(%sp)

	nop
	nop
	nop
	sw	%a2, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)

	nop
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 11(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45335

	nop
	nop
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	j	bnei_cont.45336

bnei_else.45335:
bnei_cont.45336:
	nop
	nop
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f0, %f4
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	fneg	%f4, %f4
	fmul	%f5, %f1, %f5
	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	nop
	fneg	%f6, %f6

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45337

	nop
	nop
	nop
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f7, %f2, %f7
	flw	%f8, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	nop
	fmul	%f8, %f1, %f8

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fsub	%f4, %f4, %f7

	nop
	nop
	fsw	%f4, 1(%v0)
	flw	%f4, 0(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f4, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fmul	%f4, %f0, %f4
	lw	%v1, 9(%v1)

	nop
	nop
	nop
	fadd	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f8

	nop
	nop
	nop
	fsub	%f2, %f5, %f2

	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 0(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%v1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f8

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.45338

bnei_else.45337:
	nop
	nop
	nop
	fsw	%f4, 1(%v0)

	nop
	nop
	nop
	fsw	%f5, 2(%v0)

	nop
	nop
	nop
	fsw	%f6, 3(%v0)

bnei_cont.45338:
	nop
	nop
	nop
	flw	%f0, 10(%sp)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.45339

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45340

fbeq_else.45339:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.45340:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.45341

	nop
	nop
	nop
	j	bnei_cont.45342

bnei_else.45341:
	nop
	nop
	nop
	flw	%f0, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 4(%v0)

bnei_cont.45342:
	nop
	nop
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.45332

bnei_else.45333:
	nop
	addi	%a3, %zero, 4
	flw	%f0, 493(%zero)
	sw	%v0, 8(%sp)

	nop
	nop
	sw	%a1, 9(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	fsw	%f0, 13(%sp)

	nop
	nop
	nop
	sw	%v1, 11(%sp)

	nop
	nop
	nop
	sw	%a2, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 11(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 13(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.45343

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45344

fbgt_else.45343:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.45344:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.45345

	nop
	nop
	flw	%f1, 490(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.45346

bnei_else.45345:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.45346:
	nop
	nop
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.45334:
	nop
	nop
	nop
	j	bnei_cont.45332

bnei_else.45331:
	nop
	addi	%a3, %zero, 6
	flw	%f0, 493(%zero)
	sw	%v0, 8(%sp)

	nop
	nop
	sw	%a1, 9(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	sw	%v1, 11(%sp)

	nop
	nop
	nop
	fsw	%f0, 14(%sp)

	nop
	nop
	nop
	sw	%a2, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 14(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.45347

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45348

fbeq_else.45347:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.45348:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45349

	nop
	nop
	nop
	fsw	%f1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.45350

bnei_else.45349:
	nop
	nop
	nop
	lw	%a0, 11(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45351

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45352

fbgt_else.45351:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.45352:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45353

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45355

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45354

bnei_else.45355:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.45356:
	nop
	nop
	nop
	j	bnei_cont.45354

bnei_else.45353:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.45354:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 0(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45357

	nop
	nop
	nop
	j	bnei_cont.45358

bnei_else.45357:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.45358:
	nop
	nop
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

bnei_cont.45350:
	nop
	nop
	nop
	flw	%f0, 1(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.45359

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45360

fbeq_else.45359:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.45360:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45361

	nop
	nop
	nop
	fsw	%f1, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.45362

bnei_else.45361:
	nop
	nop
	nop
	lw	%a0, 11(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45363

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45364

fbgt_else.45363:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.45364:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45365

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45367

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45366

bnei_else.45367:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.45368:
	nop
	nop
	nop
	j	bnei_cont.45366

bnei_else.45365:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.45366:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 1(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45369

	nop
	nop
	nop
	j	bnei_cont.45370

bnei_else.45369:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.45370:
	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

bnei_cont.45362:
	nop
	nop
	nop
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.45371

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45372

fbeq_else.45371:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.45372:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.45373

	nop
	nop
	nop
	fsw	%f1, 5(%v0)

	nop
	nop
	nop
	j	bnei_cont.45374

bnei_else.45373:
	nop
	nop
	nop
	lw	%v1, 11(%sp)

	nop
	nop
	nop
	lw	%a0, 6(%v1)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45375

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45376

fbgt_else.45375:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45376:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45377

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45379

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45378

bnei_else.45379:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45380:
	nop
	nop
	nop
	j	bnei_cont.45378

bnei_else.45377:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.45378:
	nop
	nop
	nop
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45381

	nop
	nop
	nop
	j	bnei_cont.45382

bnei_else.45381:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.45382:
	nop
	nop
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 5(%v0)

bnei_cont.45374:
	nop
	nop
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.45332:
	nop
	nop
	addi	%v1, %v1, -1
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	j	iter_setup_dirvec_constants.2877

bgti_else.45330:
	nop
	nop
	nop
	jr	%ra

bgti_else.45277:
	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2882:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.45386

	nop
	nop
	lw	%a0, 12(%v1)
	flw	%f0, 0(%v0)

	nop
	nop
	lw	%a1, 10(%a0)
	lw	%a2, 1(%a0)

	nop
	nop
	nop
	lw	%a3, 5(%a0)

	nop
	nop
	flw	%f1, 0(%a3)
	lw	%a3, 5(%a0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 1(%a3)
	lw	%a3, 5(%a0)

	nop
	nop
	fsw	%f0, 0(%a1)
	flw	%f0, 1(%v0)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 2(%a3)

	nop
	nop
	fsw	%f0, 1(%a1)
	flw	%f0, 2(%v0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 2(%a1)

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.45387

	nop
	nop
	nop
	addi	%at, %zero, 2

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.45389

	nop
	nop
	nop
	j	bnei_cont.45388

bgt_else.45389:
	nop
	nop
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)

	nop
	flw	%f2, 2(%a1)
	fmul	%f3, %f0, %f0
	lw	%a3, 4(%a0)

	nop
	nop
	flw	%f4, 0(%a3)
	lw	%a3, 4(%a0)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a3)
	lw	%a3, 4(%a0)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a3)
	lw	%a3, 3(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45391

	nop
	fmul	%f4, %f1, %f2
	lw	%a3, 9(%a0)
	fmul	%f2, %f2, %f0

	nop
	flw	%f5, 0(%a3)
	lw	%a3, 9(%a0)
	fmul	%f0, %f0, %f1

	nop
	nop
	fmul	%f4, %f4, %f5
	lw	%a0, 9(%a0)

	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 1(%a3)
	flw	%f1, 2(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	j	bnei_cont.45392

bnei_else.45391:
	nop
	nop
	nop
	fmov	%f0, %f3

bnei_cont.45392:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.45393

	nop
	nop
	nop
	j	bnei_cont.45394

bnei_else.45393:
	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

bnei_cont.45394:
	nop
	nop
	nop
	fsw	%f0, 3(%a1)

bgt_cont.45390:
	nop
	nop
	nop
	j	bnei_cont.45388

bnei_else.45387:
	nop
	nop
	lw	%a0, 4(%a0)
	flw	%f0, 0(%a1)

	nop
	nop
	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)

	nop
	nop
	nop
	flw	%f3, 0(%a0)

	nop
	nop
	fmul	%f0, %f3, %f0
	flw	%f3, 1(%a0)

	nop
	nop
	nop
	fmul	%f1, %f3, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 3(%a1)

bnei_cont.45388:
	nop
	nop
	nop
	addi	%v1, %v1, -1

	nop
	nop
	nop
	j	setup_startp_constants.2882

bgti_else.45386:
	nop
	nop
	nop
	jr	%ra

check_all_inside.2907:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45396

	nop
	nop
	nop
	lw	%a0, 12(%a0)

	nop
	nop
	nop
	lw	%a1, 5(%a0)

	nop
	nop
	flw	%f3, 0(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f3, %f0, %f3
	flw	%f4, 1(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f4, %f1, %f4
	flw	%f5, 2(%a1)
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	fsub	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.45397

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.45399

	nop
	nop
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f7, 0(%a1)
	lw	%a1, 4(%a0)

	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	flw	%f8, 1(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%a1)
	lw	%a1, 3(%a0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45401

	nop
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	fmul	%f5, %f5, %f3

	nop
	flw	%f8, 0(%a1)
	lw	%a1, 9(%a0)
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 1(%a1)
	lw	%a1, 9(%a0)

	nop
	nop
	fmul	%f5, %f5, %f7
	flw	%f4, 2(%a1)

	nop
	nop
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	j	bnei_cont.45402

bnei_else.45401:
	nop
	nop
	nop
	fmov	%f3, %f6

bnei_cont.45402:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.45403

	nop
	nop
	nop
	j	bnei_cont.45404

bnei_else.45403:
	nop
	nop
	nop
	flw	%f4, 491(%zero)

	nop
	nop
	nop
	fsub	%f3, %f3, %f4

bnei_cont.45404:
	nop
	nop
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45405

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45406

fbgt_else.45405:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45406:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45407

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45409

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45408

bnei_else.45409:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45410:
	nop
	nop
	nop
	j	bnei_cont.45408

bnei_else.45407:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.45408:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45411

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45398

bnei_else.45411:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45412:
	nop
	nop
	nop
	j	bnei_cont.45398

bnei_else.45399:
	nop
	nop
	lw	%a1, 4(%a0)
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a1)

	nop
	nop
	nop
	fmul	%f4, %f6, %f4

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45413

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45414

fbgt_else.45413:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45414:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45415

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45417

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45416

bnei_else.45417:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45418:
	nop
	nop
	nop
	j	bnei_cont.45416

bnei_else.45415:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.45416:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45419

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45420

bnei_else.45419:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45420:
bnei_cont.45400:
	nop
	nop
	nop
	j	bnei_cont.45398

bnei_else.45397:
	nop
	nop
	fabs	%f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	nop
	fblt	%f3, %f6, fbgt_else.45421

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45422

fbgt_else.45421:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45422:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45423

	nop
	nop
	fabs	%f3, %f4
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 1(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45425

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45426

fbgt_else.45425:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45426:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45427

	nop
	nop
	fabs	%f3, %f5
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45429

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45424

fbgt_else.45429:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45430:
	nop
	nop
	nop
	j	bnei_cont.45424

bnei_else.45427:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.45428:
	nop
	nop
	nop
	j	bnei_cont.45424

bnei_else.45423:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.45424:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45431

	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	j	bnei_cont.45432

bnei_else.45431:
	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45433

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45434

bnei_else.45433:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45434:
bnei_cont.45432:
bnei_cont.45398:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45435

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.45435:
	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45436

	nop
	nop
	nop
	lw	%a0, 12(%a0)

	nop
	nop
	nop
	lw	%a1, 5(%a0)

	nop
	nop
	flw	%f3, 0(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f3, %f0, %f3
	flw	%f4, 1(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f4, %f1, %f4
	flw	%f5, 2(%a1)
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	fsub	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.45437

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.45439

	nop
	nop
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f7, 0(%a1)
	lw	%a1, 4(%a0)

	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	flw	%f8, 1(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%a1)
	lw	%a1, 3(%a0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45441

	nop
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	fmul	%f5, %f5, %f3

	nop
	flw	%f8, 0(%a1)
	lw	%a1, 9(%a0)
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 1(%a1)
	lw	%a1, 9(%a0)

	nop
	nop
	fmul	%f5, %f5, %f7
	flw	%f4, 2(%a1)

	nop
	nop
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	j	bnei_cont.45442

bnei_else.45441:
	nop
	nop
	nop
	fmov	%f3, %f6

bnei_cont.45442:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.45443

	nop
	nop
	nop
	j	bnei_cont.45444

bnei_else.45443:
	nop
	nop
	nop
	flw	%f4, 491(%zero)

	nop
	nop
	nop
	fsub	%f3, %f3, %f4

bnei_cont.45444:
	nop
	nop
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45445

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45446

fbgt_else.45445:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45446:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45447

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45449

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45448

bnei_else.45449:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45450:
	nop
	nop
	nop
	j	bnei_cont.45448

bnei_else.45447:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.45448:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45451

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45438

bnei_else.45451:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45452:
	nop
	nop
	nop
	j	bnei_cont.45438

bnei_else.45439:
	nop
	nop
	lw	%a1, 4(%a0)
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a1)

	nop
	nop
	nop
	fmul	%f4, %f6, %f4

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45453

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45454

fbgt_else.45453:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45454:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45455

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45457

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45456

bnei_else.45457:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45458:
	nop
	nop
	nop
	j	bnei_cont.45456

bnei_else.45455:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.45456:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45459

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45460

bnei_else.45459:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45460:
bnei_cont.45440:
	nop
	nop
	nop
	j	bnei_cont.45438

bnei_else.45437:
	nop
	nop
	fabs	%f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	nop
	fblt	%f3, %f6, fbgt_else.45461

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45462

fbgt_else.45461:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45462:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45463

	nop
	nop
	fabs	%f3, %f4
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 1(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45465

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45466

fbgt_else.45465:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45466:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45467

	nop
	nop
	fabs	%f3, %f5
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45469

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45464

fbgt_else.45469:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45470:
	nop
	nop
	nop
	j	bnei_cont.45464

bnei_else.45467:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.45468:
	nop
	nop
	nop
	j	bnei_cont.45464

bnei_else.45463:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.45464:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45471

	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	j	bnei_cont.45472

bnei_else.45471:
	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45473

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45474

bnei_else.45473:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45474:
bnei_cont.45472:
bnei_cont.45438:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45475

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.45475:
	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	check_all_inside.2907

bnei_else.45436:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.45396:
	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

shadow_check_and_group.2913:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45482

	nop
	nop
	lw	%a1, 12(%a0)
	flw	%f0, 138(%zero)

	nop
	nop
	lw	%a2, 5(%a1)
	flw	%f2, 139(%zero)

	nop
	flw	%f1, 0(%a2)
	addi	%a2, %zero, 1
	lw	%a3, 5(%a1)

	nop
	fsub	%f1, %f0, %f1
	flw	%f3, 1(%a3)
	flw	%f4, 140(%zero)

	nop
	fsub	%f3, %f2, %f3
	lw	%a3, 5(%a1)
	lw	%a0, 187(%a0)

	nop
	nop
	flw	%f5, 2(%a3)
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	fsub	%f5, %f4, %f5

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.45483

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.45485

	nop
	nop
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.45487

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45488

fbeq_else.45487:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.45488:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45489

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45484

bnei_else.45489:
	nop
	nop
	flw	%f8, 1(%a0)
	flw	%f9, 2(%a0)

	nop
	fmul	%f8, %f8, %f1
	fmul	%f9, %f9, %f3
	lw	%a3, 4(%a1)

	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 3(%a0)
	flw	%f10, 0(%a3)

	nop
	nop
	fmul	%f9, %f9, %f5
	lw	%a3, 4(%a1)

	fadd	%f8, %f8, %f9
	fmul	%f9, %f1, %f1
	flw	%f11, 1(%a3)
	lw	%a3, 4(%a1)

	nop
	nop
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f3

	nop
	fmul	%f10, %f10, %f11
	flw	%f11, 2(%a3)
	lw	%a3, 3(%a1)

	nop
	nop
	fadd	%f9, %f9, %f10
	fmul	%f10, %f5, %f5

	nop
	nop
	nop
	fmul	%f10, %f10, %f11

	nop
	nop
	nop
	fadd	%f9, %f9, %f10

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45491

	nop
	fmul	%f10, %f3, %f5
	lw	%a3, 9(%a1)
	fmul	%f5, %f5, %f1

	nop
	flw	%f11, 0(%a3)
	lw	%a3, 9(%a1)
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fmul	%f10, %f10, %f11

	nop
	fadd	%f9, %f9, %f10
	flw	%f10, 1(%a3)
	lw	%a3, 9(%a1)

	nop
	nop
	fmul	%f5, %f5, %f10
	flw	%f3, 2(%a3)

	nop
	nop
	fadd	%f5, %f9, %f5
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fadd	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.45492

bnei_else.45491:
	nop
	nop
	nop
	fmov	%f1, %f9

bnei_cont.45492:
	nop
	nop
	nop
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.45493

	nop
	nop
	nop
	j	bnei_cont.45494

bnei_else.45493:
	nop
	nop
	nop
	flw	%f3, 491(%zero)

	nop
	nop
	nop
	fsub	%f1, %f1, %f3

bnei_cont.45494:
	nop
	nop
	fmul	%f3, %f8, %f8
	fmul	%f1, %f6, %f1

	nop
	nop
	nop
	fsub	%f1, %f3, %f1

	nop
	nop
	nop
	fblt	%f7, %f1, fbgt_else.45495

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45496

fbgt_else.45495:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.45496:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45497

	nop
	nop
	nop
	lw	%a3, 6(%a1)

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45499

	nop
	nop
	fsqrt	%f1, %f1
	flw	%f3, 4(%a0)

	nop
	nop
	nop
	fadd	%f1, %f8, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsw	%f1, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.45500

bnei_else.45499:
	nop
	nop
	fsqrt	%f1, %f1
	flw	%f3, 4(%a0)

	nop
	nop
	nop
	fsub	%f1, %f8, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsw	%f1, 135(%zero)

bnei_cont.45500:
	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45498

bnei_else.45497:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.45498:
bnei_cont.45490:
	nop
	nop
	nop
	j	bnei_cont.45484

bnei_else.45485:
	nop
	nop
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.45501

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45502

fbgt_else.45501:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.45502:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45503

	nop
	nop
	nop
	flw	%f6, 1(%a0)

	nop
	nop
	fmul	%f1, %f6, %f1
	flw	%f6, 2(%a0)

	nop
	nop
	nop
	fmul	%f3, %f6, %f3

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 3(%a0)

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

	nop
	nop
	nop
	fsw	%f1, 135(%zero)

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45504

bnei_else.45503:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.45504:
bnei_cont.45486:
	nop
	nop
	nop
	j	bnei_cont.45484

bnei_else.45483:
	nop
	nop
	flw	%f6, 0(%a0)
	flw	%f7, 1(%a0)

	nop
	fsub	%f6, %f6, %f1
	flw	%f8, 185(%zero)
	lw	%a3, 4(%a1)

	nop
	nop
	fmul	%f6, %f6, %f7
	flw	%f10, 1(%a3)

	nop
	nop
	nop
	fmul	%f9, %f6, %f8

	nop
	nop
	nop
	fadd	%f9, %f9, %f3

	nop
	nop
	nop
	fabs	%f9, %f9

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.45505

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45506

fbgt_else.45505:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.45506:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45507

	nop
	nop
	flw	%f9, 186(%zero)
	lw	%a3, 4(%a1)

	nop
	nop
	fmul	%f9, %f6, %f9
	flw	%f10, 2(%a3)

	nop
	nop
	nop
	fadd	%f9, %f9, %f5

	nop
	nop
	nop
	fabs	%f9, %f9

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.45509

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45510

fbgt_else.45509:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.45510:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45511

	nop
	nop
	nop
	flw	%f9, 493(%zero)

	nop
	nop
	nop
	fbne	%f7, %f9, fbeq_else.45513

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45514

fbeq_else.45513:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.45514:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45515

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45508

bnei_else.45515:
	nop
	nop
	nop
	addi	%a3, %zero, 1

bnei_cont.45516:
	nop
	nop
	nop
	j	bnei_cont.45508

bnei_else.45511:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.45512:
	nop
	nop
	nop
	j	bnei_cont.45508

bnei_else.45507:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.45508:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45517

	nop
	nop
	nop
	fsw	%f6, 135(%zero)

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45518

bnei_else.45517:
	nop
	nop
	flw	%f6, 2(%a0)
	flw	%f7, 3(%a0)

	nop
	fsub	%f6, %f6, %f3
	flw	%f9, 184(%zero)
	lw	%a3, 4(%a1)

	nop
	nop
	fmul	%f6, %f6, %f7
	flw	%f11, 0(%a3)

	nop
	nop
	nop
	fmul	%f10, %f6, %f9

	nop
	nop
	nop
	fadd	%f10, %f10, %f1

	nop
	nop
	nop
	fabs	%f10, %f10

	nop
	nop
	nop
	fblt	%f10, %f11, fbgt_else.45519

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45520

fbgt_else.45519:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.45520:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45521

	nop
	nop
	flw	%f10, 186(%zero)
	lw	%a3, 4(%a1)

	nop
	nop
	fmul	%f10, %f6, %f10
	flw	%f11, 2(%a3)

	nop
	nop
	nop
	fadd	%f10, %f10, %f5

	nop
	nop
	nop
	fabs	%f10, %f10

	nop
	nop
	nop
	fblt	%f10, %f11, fbgt_else.45523

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45524

fbgt_else.45523:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.45524:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45525

	nop
	nop
	nop
	flw	%f10, 493(%zero)

	nop
	nop
	nop
	fbne	%f7, %f10, fbeq_else.45527

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45528

fbeq_else.45527:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.45528:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45529

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45522

bnei_else.45529:
	nop
	nop
	nop
	addi	%a3, %zero, 1

bnei_cont.45530:
	nop
	nop
	nop
	j	bnei_cont.45522

bnei_else.45525:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.45526:
	nop
	nop
	nop
	j	bnei_cont.45522

bnei_else.45521:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.45522:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45531

	nop
	nop
	nop
	fsw	%f6, 135(%zero)

	nop
	nop
	nop
	addi	%a0, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.45532

bnei_else.45531:
	nop
	nop
	nop
	flw	%f6, 4(%a0)

	nop
	fsub	%f5, %f6, %f5
	flw	%f6, 5(%a0)
	lw	%a0, 4(%a1)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fmul	%f7, %f5, %f9

	nop
	nop
	fadd	%f1, %f7, %f1
	flw	%f7, 0(%a0)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f7, fbgt_else.45533

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45534

fbgt_else.45533:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.45534:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45535

	nop
	nop
	fmul	%f1, %f5, %f8
	lw	%a0, 4(%a1)

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 1(%a0)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.45537

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45538

fbgt_else.45537:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.45538:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45539

	nop
	nop
	nop
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fbne	%f6, %f1, fbeq_else.45541

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45542

fbeq_else.45541:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.45542:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45543

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45536

bnei_else.45543:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45544:
	nop
	nop
	nop
	j	bnei_cont.45536

bnei_else.45539:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.45540:
	nop
	nop
	nop
	j	bnei_cont.45536

bnei_else.45535:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.45536:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45545

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	addi	%a0, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.45546

bnei_else.45545:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.45546:
bnei_cont.45532:
bnei_cont.45518:
bnei_cont.45484:
	nop
	nop
	nop
	flw	%f1, 135(%zero)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45547

	nop
	nop
	nop
	flw	%f3, 468(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.45549

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45548

fbgt_else.45549:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.45550:
	nop
	nop
	nop
	j	bnei_cont.45548

bnei_else.45547:
	nop
	nop
	nop
	addi	%a0, %zero, 0

bnei_cont.45548:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45551

	nop
	nop
	flw	%f3, 467(%zero)
	lw	%a0, 0(%v1)

	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 78(%zero)
	sw	%v1, 0(%sp)

	nop
	nop
	fmul	%f3, %f3, %f1
	sw	%v0, 1(%sp)

	nop
	nop
	fadd	%f0, %f3, %f0
	flw	%f3, 79(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f3, %f2
	flw	%f3, 80(%zero)

	nop
	nop
	nop
	fmul	%f1, %f3, %f1

	nop
	nop
	nop
	fadd	%f1, %f1, %f4

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45552

	nop
	nop
	nop
	lw	%a0, 12(%a0)

	nop
	nop
	nop
	lw	%a1, 5(%a0)

	nop
	nop
	flw	%f3, 0(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f3, %f0, %f3
	flw	%f4, 1(%a1)
	lw	%a1, 5(%a0)

	nop
	fsub	%f4, %f2, %f4
	flw	%f5, 2(%a1)
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	fsub	%f5, %f1, %f5

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.45554

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.45556

	nop
	nop
	fmul	%f6, %f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f7, 0(%a1)
	lw	%a1, 4(%a0)

	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	flw	%f8, 1(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%a1)
	lw	%a1, 3(%a0)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45558

	nop
	fmul	%f7, %f4, %f5
	lw	%a1, 9(%a0)
	fmul	%f5, %f5, %f3

	nop
	flw	%f8, 0(%a1)
	lw	%a1, 9(%a0)
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 1(%a1)
	lw	%a1, 9(%a0)

	nop
	nop
	fmul	%f5, %f5, %f7
	flw	%f4, 2(%a1)

	nop
	nop
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	j	bnei_cont.45559

bnei_else.45558:
	nop
	nop
	nop
	fmov	%f3, %f6

bnei_cont.45559:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.45560

	nop
	nop
	nop
	j	bnei_cont.45561

bnei_else.45560:
	nop
	nop
	nop
	flw	%f4, 491(%zero)

	nop
	nop
	nop
	fsub	%f3, %f3, %f4

bnei_cont.45561:
	nop
	nop
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45562

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45563

fbgt_else.45562:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45563:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45564

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45566

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45565

bnei_else.45566:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45567:
	nop
	nop
	nop
	j	bnei_cont.45565

bnei_else.45564:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.45565:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45568

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45555

bnei_else.45568:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45569:
	nop
	nop
	nop
	j	bnei_cont.45555

bnei_else.45556:
	nop
	nop
	lw	%a1, 4(%a0)
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	fmul	%f3, %f6, %f3
	flw	%f6, 1(%a1)

	nop
	nop
	nop
	fmul	%f4, %f6, %f4

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45570

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45571

fbgt_else.45570:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45571:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45572

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45574

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45573

bnei_else.45574:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45575:
	nop
	nop
	nop
	j	bnei_cont.45573

bnei_else.45572:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.45573:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45576

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45577

bnei_else.45576:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45577:
bnei_cont.45557:
	nop
	nop
	nop
	j	bnei_cont.45555

bnei_else.45554:
	nop
	nop
	fabs	%f3, %f3
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f6, 0(%a1)

	nop
	nop
	nop
	fblt	%f3, %f6, fbgt_else.45578

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45579

fbgt_else.45578:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45579:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45580

	nop
	nop
	fabs	%f3, %f4
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 1(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45582

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45583

fbgt_else.45582:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45583:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45584

	nop
	nop
	fabs	%f3, %f5
	lw	%a1, 4(%a0)

	nop
	nop
	nop
	flw	%f4, 2(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45586

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45581

fbgt_else.45586:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.45587:
	nop
	nop
	nop
	j	bnei_cont.45581

bnei_else.45584:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.45585:
	nop
	nop
	nop
	j	bnei_cont.45581

bnei_else.45580:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.45581:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45588

	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	j	bnei_cont.45589

bnei_else.45588:
	nop
	nop
	nop
	lw	%a0, 6(%a0)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45590

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45591

bnei_else.45590:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.45591:
bnei_cont.45589:
bnei_cont.45555:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45592

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45553

bnei_else.45592:
	nop
	addi	%v0, %a2, 0
	fmov	%f29, %f2
	sw	%ra, 2(%sp)

	nop
	nop
	fmov	%f2, %f1
	fmov	%f1, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	check_all_inside.2907

	nop
	nop
	nop
	addi	%sp, %sp, -3

	nop
	nop
	nop
	lw	%ra, 2(%sp)

bnei_cont.45593:
	nop
	nop
	nop
	j	bnei_cont.45553

bnei_else.45552:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.45553:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45594

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.45594:
	nop
	nop
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.45551:
	nop
	nop
	nop
	lw	%a0, 6(%a1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.45595

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.45595:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.45482:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_group.2916:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45607

	nop
	nop
	lw	%a0, 83(%a0)
	addi	%a1, %zero, 0

	nop
	nop
	nop
	sw	%a1, 0(%sp)

	nop
	nop
	sw	%v1, 1(%sp)
	addi	%v1, %a0, 0

	nop
	nop
	sw	%v0, 2(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 3(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	nop
	lw	%ra, 3(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45608

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.45608:
	nop
	nop
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45609

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)

	nop
	sw	%v0, 3(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45610

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.45610:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45611

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)

	nop
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45612

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.45612:
	nop
	nop
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45613

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)

	nop
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45614

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.45614:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_one_or_group.2916

bnei_else.45613:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.45611:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.45609:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

bnei_else.45607:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_matrix.2919:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a1, %zero, 0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a2, 0(%a0)

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.45647

	nop
	nop
	nop
	sw	%a1, 0(%sp)

	nop
	nop
	nop
	sw	%a0, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	beqi	%a2, 99, bnei_else.45648

	nop
	nop
	lw	%a3, 12(%a2)
	flw	%f0, 138(%zero)

	nop
	nop
	lw	%t0, 5(%a3)
	lw	%a2, 187(%a2)

	nop
	nop
	flw	%f1, 0(%t0)
	lw	%t0, 5(%a3)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%t0)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%t0, 5(%a3)

	nop
	nop
	flw	%f3, 2(%t0)
	lw	%t0, 1(%a3)

	nop
	nop
	nop
	fsub	%f2, %f2, %f3

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.45650

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.45652

	nop
	nop
	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.45654

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45655

fbeq_else.45654:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.45655:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45656

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45651

bnei_else.45656:
	nop
	nop
	flw	%f5, 1(%a2)
	flw	%f6, 2(%a2)

	nop
	fmul	%f5, %f5, %f0
	fmul	%f6, %f6, %f1
	lw	%t0, 4(%a3)

	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%a2)
	flw	%f7, 0(%t0)

	nop
	nop
	fmul	%f6, %f6, %f2
	lw	%t0, 4(%a3)

	fadd	%f5, %f5, %f6
	fmul	%f6, %f0, %f0
	flw	%f8, 1(%t0)
	lw	%t0, 4(%a3)

	nop
	nop
	fmul	%f6, %f6, %f7
	fmul	%f7, %f1, %f1

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%t0)
	lw	%t0, 3(%a3)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f2, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45658

	nop
	fmul	%f7, %f1, %f2
	lw	%t0, 9(%a3)
	fmul	%f2, %f2, %f0

	nop
	flw	%f8, 0(%t0)
	lw	%t0, 9(%a3)
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 1(%t0)
	lw	%t0, 9(%a3)

	nop
	nop
	fmul	%f2, %f2, %f7
	flw	%f1, 2(%t0)

	nop
	nop
	fadd	%f2, %f6, %f2
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	j	bnei_cont.45659

bnei_else.45658:
	nop
	nop
	nop
	fmov	%f0, %f6

bnei_cont.45659:
	nop
	nop
	nop
	lw	%t0, 1(%a3)

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.45660

	nop
	nop
	nop
	j	bnei_cont.45661

bnei_else.45660:
	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

bnei_cont.45661:
	nop
	nop
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	fblt	%f4, %f0, fbgt_else.45662

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45663

fbgt_else.45662:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45663:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45664

	nop
	nop
	nop
	lw	%a3, 6(%a3)

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45666

	nop
	nop
	fsqrt	%f0, %f0
	flw	%f1, 4(%a2)

	nop
	nop
	nop
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.45667

bnei_else.45666:
	nop
	nop
	fsqrt	%f0, %f0
	flw	%f1, 4(%a2)

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

bnei_cont.45667:
	nop
	nop
	nop
	addi	%a2, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45665

bnei_else.45664:
	nop
	nop
	nop
	addi	%a2, %zero, 0

bnei_cont.45665:
bnei_cont.45657:
	nop
	nop
	nop
	j	bnei_cont.45651

bnei_else.45652:
	nop
	nop
	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.45668

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45669

fbgt_else.45668:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.45669:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.45670

	nop
	nop
	nop
	flw	%f3, 1(%a2)

	nop
	nop
	fmul	%f0, %f3, %f0
	flw	%f3, 2(%a2)

	nop
	nop
	nop
	fmul	%f1, %f3, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a2)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%a2, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45671

bnei_else.45670:
	nop
	nop
	nop
	addi	%a2, %zero, 0

bnei_cont.45671:
bnei_cont.45653:
	nop
	nop
	nop
	j	bnei_cont.45651

bnei_else.45650:
	nop
	nop
	flw	%f3, 0(%a2)
	flw	%f4, 1(%a2)

	nop
	fsub	%f3, %f3, %f0
	flw	%f5, 185(%zero)
	lw	%t0, 4(%a3)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f7, 1(%t0)

	nop
	nop
	nop
	fmul	%f6, %f3, %f5

	nop
	nop
	nop
	fadd	%f6, %f6, %f1

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.45672

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45673

fbgt_else.45672:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45673:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45674

	nop
	nop
	flw	%f6, 186(%zero)
	lw	%t0, 4(%a3)

	nop
	nop
	fmul	%f6, %f3, %f6
	flw	%f7, 2(%t0)

	nop
	nop
	nop
	fadd	%f6, %f6, %f2

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.45676

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45677

fbgt_else.45676:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45677:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45678

	nop
	nop
	nop
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.45680

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45681

fbeq_else.45680:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.45681:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45682

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45675

bnei_else.45682:
	nop
	nop
	nop
	addi	%t0, %zero, 1

bnei_cont.45683:
	nop
	nop
	nop
	j	bnei_cont.45675

bnei_else.45678:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45679:
	nop
	nop
	nop
	j	bnei_cont.45675

bnei_else.45674:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45675:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45684

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%a2, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45685

bnei_else.45684:
	nop
	nop
	flw	%f3, 2(%a2)
	flw	%f4, 3(%a2)

	nop
	fsub	%f3, %f3, %f1
	flw	%f6, 184(%zero)
	lw	%t0, 4(%a3)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f8, 0(%t0)

	nop
	nop
	nop
	fmul	%f7, %f3, %f6

	nop
	nop
	nop
	fadd	%f7, %f7, %f0

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.45686

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45687

fbgt_else.45686:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45687:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45688

	nop
	nop
	flw	%f7, 186(%zero)
	lw	%t0, 4(%a3)

	nop
	nop
	fmul	%f7, %f3, %f7
	flw	%f8, 2(%t0)

	nop
	nop
	nop
	fadd	%f7, %f7, %f2

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.45690

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45691

fbgt_else.45690:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45691:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45692

	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.45694

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45695

fbeq_else.45694:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.45695:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45696

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45689

bnei_else.45696:
	nop
	nop
	nop
	addi	%t0, %zero, 1

bnei_cont.45697:
	nop
	nop
	nop
	j	bnei_cont.45689

bnei_else.45692:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45693:
	nop
	nop
	nop
	j	bnei_cont.45689

bnei_else.45688:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45689:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45698

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%a2, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.45699

bnei_else.45698:
	nop
	nop
	nop
	flw	%f3, 4(%a2)

	nop
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a2)
	lw	%a2, 4(%a3)

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	nop
	fmul	%f4, %f2, %f6

	nop
	nop
	fadd	%f0, %f4, %f0
	flw	%f4, 0(%a2)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.45700

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45701

fbgt_else.45700:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.45701:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45702

	nop
	nop
	fmul	%f0, %f2, %f5
	lw	%a2, 4(%a3)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%a2)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45704

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45705

fbgt_else.45704:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.45705:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45706

	nop
	nop
	nop
	flw	%f0, 493(%zero)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.45708

	nop
	nop
	nop
	addi	%a2, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45709

fbeq_else.45708:
	nop
	nop
	nop
	addi	%a2, %zero, 0

fbeq_cont.45709:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45710

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45703

bnei_else.45710:
	nop
	nop
	nop
	addi	%a2, %zero, 1

bnei_cont.45711:
	nop
	nop
	nop
	j	bnei_cont.45703

bnei_else.45706:
	nop
	nop
	nop
	addi	%a2, %zero, 0

bnei_cont.45707:
	nop
	nop
	nop
	j	bnei_cont.45703

bnei_else.45702:
	nop
	nop
	nop
	addi	%a2, %zero, 0

bnei_cont.45703:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45712

	nop
	nop
	nop
	fsw	%f2, 135(%zero)

	nop
	nop
	nop
	addi	%a2, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.45713

bnei_else.45712:
	nop
	nop
	nop
	addi	%a2, %zero, 0

bnei_cont.45713:
bnei_cont.45699:
bnei_cont.45685:
bnei_cont.45651:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45714

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.45716

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45717

fbgt_else.45716:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.45717:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45718

	nop
	nop
	nop
	lw	%a2, 1(%a0)

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.45720

	nop
	lw	%a2, 83(%a2)
	addi	%v0, %a1, 0
	sw	%ra, 4(%sp)

	nop
	nop
	addi	%v1, %a2, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45722

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45721

bnei_else.45722:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.45724

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45726

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45725

bnei_else.45726:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.45728

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45730

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45729

bnei_else.45730:
	nop
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2916

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

bnei_cont.45731:
	nop
	nop
	nop
	j	bnei_cont.45729

bnei_else.45728:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.45729:
bnei_cont.45727:
	nop
	nop
	nop
	j	bnei_cont.45725

bnei_else.45724:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.45725:
bnei_cont.45723:
	nop
	nop
	nop
	j	bnei_cont.45721

bnei_else.45720:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.45721:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45732

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45649

bnei_else.45732:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.45733:
	nop
	nop
	nop
	j	bnei_cont.45649

bnei_else.45718:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.45719:
	nop
	nop
	nop
	j	bnei_cont.45649

bnei_else.45714:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.45715:
	nop
	nop
	nop
	j	bnei_cont.45649

bnei_else.45648:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.45649:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45734

	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 1(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.45735

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45737

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45736

bnei_else.45737:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.45739

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45741

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45740

bnei_else.45741:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.45743

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45745

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45744

bnei_else.45745:
	nop
	addi	%v0, %zero, 4
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2916

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	nop
	lw	%ra, 4(%sp)

bnei_cont.45746:
	nop
	nop
	nop
	j	bnei_cont.45744

bnei_else.45743:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.45744:
bnei_cont.45742:
	nop
	nop
	nop
	j	bnei_cont.45740

bnei_else.45739:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.45740:
bnei_cont.45738:
	nop
	nop
	nop
	j	bnei_cont.45736

bnei_else.45735:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.45736:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45747

	nop
	nop
	nop
	addi	%v0, %zero, 1

	nop
	nop
	nop
	jr	%ra

bnei_else.45747:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_one_or_matrix.2919

bnei_else.45734:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	shadow_check_one_or_matrix.2919

bnei_else.45647:
	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jr	%ra

solve_each_element.2922:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.45782

	nop
	nop
	lw	%a2, 12(%a1)
	flw	%f0, 159(%zero)

	nop
	nop
	lw	%a3, 5(%a2)
	flw	%f2, 160(%zero)

	nop
	flw	%f1, 0(%a3)
	addi	%a3, %zero, 1
	lw	%t0, 5(%a2)

	nop
	fsub	%f1, %f0, %f1
	flw	%f3, 1(%t0)
	flw	%f4, 161(%zero)

	nop
	nop
	fsub	%f3, %f2, %f3
	lw	%t0, 5(%a2)

	nop
	nop
	flw	%f5, 2(%t0)
	lw	%t0, 1(%a2)

	nop
	nop
	nop
	fsub	%f5, %f4, %f5

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.45783

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.45785

	nop
	nop
	flw	%f6, 0(%a0)
	flw	%f7, 1(%a0)

	flw	%f8, 2(%a0)
	fmul	%f9, %f6, %f6
	lw	%t0, 4(%a2)
	fmul	%f11, %f7, %f7

	nop
	nop
	flw	%f10, 0(%t0)
	lw	%t0, 4(%a2)

	nop
	fmul	%f9, %f9, %f10
	flw	%f12, 1(%t0)
	lw	%t0, 4(%a2)

	nop
	fmul	%f11, %f11, %f12
	flw	%f13, 2(%t0)
	lw	%t0, 3(%a2)

	nop
	nop
	fadd	%f9, %f9, %f11
	fmul	%f11, %f8, %f8

	nop
	nop
	nop
	fmul	%f11, %f11, %f13

	nop
	nop
	nop
	fadd	%f9, %f9, %f11

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45787

	nop
	nop
	fmul	%f11, %f7, %f8
	lw	%t1, 9(%a2)

	nop
	nop
	flw	%f14, 0(%t1)
	lw	%t1, 9(%a2)

	nop
	fmul	%f11, %f11, %f14
	flw	%f14, 1(%t1)
	lw	%t1, 9(%a2)

	nop
	nop
	fadd	%f9, %f9, %f11
	fmul	%f11, %f8, %f6

	nop
	nop
	fmul	%f11, %f11, %f14
	flw	%f14, 2(%t1)

	nop
	nop
	fadd	%f9, %f9, %f11
	fmul	%f11, %f6, %f7

	nop
	nop
	nop
	fmul	%f11, %f11, %f14

	nop
	nop
	nop
	fadd	%f9, %f9, %f11

	nop
	nop
	nop
	j	bnei_cont.45788

bnei_else.45787:
bnei_cont.45788:
	nop
	nop
	nop
	flw	%f11, 493(%zero)

	nop
	nop
	nop
	fbne	%f9, %f11, fbeq_else.45789

	nop
	nop
	nop
	addi	%t1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45790

fbeq_else.45789:
	nop
	nop
	nop
	addi	%t1, %zero, 0

fbeq_cont.45790:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45791

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45784

bnei_else.45791:
	nop
	nop
	fmul	%f14, %f6, %f1
	fmul	%f15, %f7, %f3

	nop
	nop
	fmul	%f14, %f14, %f10
	fmul	%f15, %f15, %f12

	nop
	nop
	fadd	%f14, %f14, %f15
	fmul	%f15, %f8, %f5

	nop
	nop
	nop
	fmul	%f15, %f15, %f13

	nop
	nop
	nop
	fadd	%f14, %f14, %f15

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45793

	nop
	fmul	%f15, %f8, %f3
	fmul	%f16, %f7, %f5
	lw	%t1, 9(%a2)

	fadd	%f15, %f15, %f16
	flw	%f16, 0(%t1)
	fmul	%f8, %f8, %f1
	lw	%t1, 9(%a2)

	nop
	nop
	fmul	%f15, %f15, %f16
	fmul	%f16, %f6, %f5

	fadd	%f8, %f16, %f8
	flw	%f16, 1(%t1)
	fmul	%f6, %f6, %f3
	lw	%t1, 9(%a2)

	nop
	nop
	fmul	%f8, %f8, %f16
	fmul	%f7, %f7, %f1

	nop
	fadd	%f8, %f15, %f8
	fadd	%f6, %f6, %f7
	flw	%f7, 2(%t1)

	nop
	nop
	fmul	%f6, %f6, %f7
	flw	%f7, 471(%zero)

	nop
	nop
	nop
	fadd	%f6, %f8, %f6

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f6, %f14, %f6

	nop
	nop
	nop
	j	bnei_cont.45794

bnei_else.45793:
	nop
	nop
	nop
	fmov	%f6, %f14

bnei_cont.45794:
	nop
	nop
	fmul	%f7, %f1, %f1
	fmul	%f8, %f3, %f3

	nop
	nop
	fmul	%f7, %f7, %f10
	fmul	%f8, %f8, %f12

	nop
	nop
	fadd	%f7, %f7, %f8
	fmul	%f8, %f5, %f5

	nop
	nop
	nop
	fmul	%f8, %f8, %f13

	nop
	nop
	nop
	fadd	%f7, %f7, %f8

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45795

	nop
	fmul	%f8, %f3, %f5
	lw	%t0, 9(%a2)
	fmul	%f5, %f5, %f1

	nop
	flw	%f10, 0(%t0)
	lw	%t0, 9(%a2)
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 1(%t0)
	lw	%t0, 9(%a2)

	nop
	nop
	fmul	%f5, %f5, %f8
	flw	%f3, 2(%t0)

	nop
	nop
	fadd	%f5, %f7, %f5
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fadd	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.45796

bnei_else.45795:
	nop
	nop
	nop
	fmov	%f1, %f7

bnei_cont.45796:
	nop
	nop
	nop
	lw	%t0, 1(%a2)

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.45797

	nop
	nop
	nop
	j	bnei_cont.45798

bnei_else.45797:
	nop
	nop
	nop
	flw	%f3, 491(%zero)

	nop
	nop
	nop
	fsub	%f1, %f1, %f3

bnei_cont.45798:
	nop
	nop
	fmul	%f3, %f6, %f6
	fmul	%f1, %f9, %f1

	nop
	nop
	nop
	fsub	%f1, %f3, %f1

	nop
	nop
	nop
	fblt	%f11, %f1, fbgt_else.45799

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45800

fbgt_else.45799:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45800:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45801

	nop
	nop
	fsqrt	%f1, %f1
	lw	%t0, 6(%a2)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45803

	nop
	nop
	nop
	j	bnei_cont.45804

bnei_else.45803:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.45804:
	nop
	nop
	nop
	fsub	%f1, %f1, %f6

	nop
	nop
	nop
	fdiv	%f1, %f1, %f9

	nop
	nop
	nop
	fsw	%f1, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45802

bnei_else.45801:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45802:
bnei_cont.45792:
	nop
	nop
	nop
	j	bnei_cont.45784

bnei_else.45785:
	nop
	nop
	lw	%t0, 4(%a2)
	flw	%f6, 0(%a0)

	nop
	nop
	flw	%f7, 0(%t0)
	flw	%f8, 1(%a0)

	nop
	fmul	%f6, %f6, %f7
	flw	%f9, 1(%t0)
	flw	%f10, 2(%t0)

	nop
	nop
	nop
	fmul	%f8, %f8, %f9

	nop
	nop
	fadd	%f6, %f6, %f8
	flw	%f8, 2(%a0)

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	fadd	%f6, %f6, %f8
	flw	%f8, 493(%zero)

	nop
	nop
	nop
	fblt	%f8, %f6, fbgt_else.45805

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45806

fbgt_else.45805:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45806:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45807

	nop
	nop
	fmul	%f1, %f7, %f1
	fmul	%f3, %f9, %f3

	nop
	nop
	fadd	%f1, %f1, %f3
	fmul	%f3, %f10, %f5

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fdiv	%f1, %f1, %f6

	nop
	nop
	nop
	fsw	%f1, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45808

bnei_else.45807:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45808:
bnei_cont.45786:
	nop
	nop
	nop
	j	bnei_cont.45784

bnei_else.45783:
	nop
	nop
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.45809

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45810

fbeq_else.45809:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.45810:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45811

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45812

bnei_else.45811:
	nop
	nop
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.45813

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45814

fbgt_else.45813:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.45814:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45815

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.45817

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45816

bnei_else.45817:
	nop
	nop
	nop
	addi	%t1, %zero, 1

bnei_cont.45818:
	nop
	nop
	nop
	j	bnei_cont.45816

bnei_else.45815:
	nop
	nop
	nop
	add	%t1, %zero, %t2

bnei_cont.45816:
	nop
	nop
	nop
	flw	%f8, 0(%t0)

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45819

	nop
	nop
	nop
	j	bnei_cont.45820

bnei_else.45819:
	nop
	nop
	nop
	fneg	%f8, %f8

bnei_cont.45820:
	nop
	fsub	%f8, %f8, %f1
	flw	%f9, 1(%a0)
	flw	%f10, 1(%t0)

	nop
	nop
	nop
	fdiv	%f8, %f8, %f6

	nop
	nop
	nop
	fmul	%f9, %f8, %f9

	nop
	nop
	nop
	fadd	%f9, %f9, %f3

	nop
	nop
	nop
	fabs	%f9, %f9

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.45821

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45822

fbgt_else.45821:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.45822:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45823

	nop
	nop
	flw	%f9, 2(%a0)
	flw	%f10, 2(%t0)

	nop
	nop
	nop
	fmul	%f9, %f8, %f9

	nop
	nop
	nop
	fadd	%f9, %f9, %f5

	nop
	nop
	nop
	fabs	%f9, %f9

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.45825

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45826

fbgt_else.45825:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45826:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45827

	nop
	nop
	nop
	fsw	%f8, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45824

bnei_else.45827:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45828:
	nop
	nop
	nop
	j	bnei_cont.45824

bnei_else.45823:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45824:
bnei_cont.45812:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45829

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45830

bnei_else.45829:
	nop
	nop
	nop
	flw	%f8, 1(%a0)

	nop
	nop
	nop
	fbne	%f8, %f7, fbeq_else.45831

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45832

fbeq_else.45831:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.45832:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45833

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45834

bnei_else.45833:
	nop
	nop
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)

	nop
	nop
	nop
	fblt	%f8, %f7, fbgt_else.45835

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45836

fbgt_else.45835:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.45836:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45837

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.45839

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45838

bnei_else.45839:
	nop
	nop
	nop
	addi	%t1, %zero, 1

bnei_cont.45840:
	nop
	nop
	nop
	j	bnei_cont.45838

bnei_else.45837:
	nop
	nop
	nop
	add	%t1, %zero, %t2

bnei_cont.45838:
	nop
	nop
	nop
	flw	%f9, 1(%t0)

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45841

	nop
	nop
	nop
	j	bnei_cont.45842

bnei_else.45841:
	nop
	nop
	nop
	fneg	%f9, %f9

bnei_cont.45842:
	nop
	fsub	%f9, %f9, %f3
	flw	%f10, 2(%a0)
	flw	%f11, 2(%t0)

	nop
	nop
	nop
	fdiv	%f9, %f9, %f8

	nop
	nop
	nop
	fmul	%f10, %f9, %f10

	nop
	nop
	nop
	fadd	%f10, %f10, %f5

	nop
	nop
	nop
	fabs	%f10, %f10

	nop
	nop
	nop
	fblt	%f10, %f11, fbgt_else.45843

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45844

fbgt_else.45843:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.45844:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45845

	nop
	nop
	fmul	%f10, %f9, %f6
	flw	%f11, 0(%t0)

	nop
	nop
	nop
	fadd	%f10, %f10, %f1

	nop
	nop
	nop
	fabs	%f10, %f10

	nop
	nop
	nop
	fblt	%f10, %f11, fbgt_else.45847

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45848

fbgt_else.45847:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45848:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45849

	nop
	nop
	nop
	fsw	%f9, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45846

bnei_else.45849:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45850:
	nop
	nop
	nop
	j	bnei_cont.45846

bnei_else.45845:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45846:
bnei_cont.45834:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45851

	nop
	nop
	nop
	addi	%t0, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.45852

bnei_else.45851:
	nop
	nop
	nop
	flw	%f9, 2(%a0)

	nop
	nop
	nop
	fbne	%f9, %f7, fbeq_else.45853

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.45854

fbeq_else.45853:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.45854:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45855

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45856

bnei_else.45855:
	nop
	nop
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)

	nop
	nop
	nop
	fblt	%f9, %f7, fbgt_else.45857

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45858

fbgt_else.45857:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.45858:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45859

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.45861

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45860

bnei_else.45861:
	nop
	nop
	nop
	addi	%t1, %zero, 1

bnei_cont.45862:
	nop
	nop
	nop
	j	bnei_cont.45860

bnei_else.45859:
	nop
	nop
	nop
	add	%t1, %zero, %t2

bnei_cont.45860:
	nop
	nop
	nop
	flw	%f7, 2(%t0)

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45863

	nop
	nop
	nop
	j	bnei_cont.45864

bnei_else.45863:
	nop
	nop
	nop
	fneg	%f7, %f7

bnei_cont.45864:
	nop
	nop
	nop
	fsub	%f5, %f7, %f5

	nop
	nop
	nop
	fdiv	%f5, %f5, %f9

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	fadd	%f1, %f6, %f1
	flw	%f6, 0(%t0)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f6, fbgt_else.45865

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45866

fbgt_else.45865:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.45866:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45867

	nop
	nop
	nop
	fmul	%f1, %f5, %f8

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 1(%t0)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.45869

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45870

fbgt_else.45869:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.45870:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45871

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.45868

bnei_else.45871:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45872:
	nop
	nop
	nop
	j	bnei_cont.45868

bnei_else.45867:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45868:
bnei_cont.45856:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45873

	nop
	nop
	nop
	addi	%t0, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.45874

bnei_else.45873:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.45874:
bnei_cont.45852:
bnei_cont.45830:
bnei_cont.45784:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.45875

	nop
	nop
	flw	%f1, 135(%zero)
	flw	%f3, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.45876

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45877

fbgt_else.45876:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.45877:
	nop
	nop
	nop
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%v0, 2(%sp)

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45878

	nop
	nop
	nop
	flw	%f5, 137(%zero)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.45880

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45881

fbgt_else.45880:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.45881:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45882

	nop
	nop
	flw	%f5, 467(%zero)
	lw	%a2, 0(%v1)

	nop
	fadd	%f1, %f1, %f5
	flw	%f5, 0(%a0)
	sw	%t0, 3(%sp)

	nop
	nop
	fmul	%f5, %f5, %f1
	sw	%a1, 4(%sp)

	nop
	nop
	fadd	%f0, %f5, %f0
	flw	%f5, 1(%a0)

	nop
	nop
	nop
	fmul	%f5, %f5, %f1

	nop
	nop
	fadd	%f2, %f5, %f2
	flw	%f5, 2(%a0)

	nop
	nop
	nop
	fmul	%f5, %f5, %f1

	nop
	nop
	nop
	fadd	%f4, %f5, %f4

	nop
	nop
	nop
	fsw	%f4, 5(%sp)

	nop
	nop
	nop
	fsw	%f2, 6(%sp)

	nop
	nop
	nop
	fsw	%f0, 7(%sp)

	nop
	nop
	nop
	fsw	%f1, 8(%sp)

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.45884

	nop
	nop
	nop
	lw	%a2, 12(%a2)

	nop
	nop
	nop
	lw	%t1, 5(%a2)

	nop
	nop
	flw	%f5, 0(%t1)
	lw	%t1, 5(%a2)

	nop
	fsub	%f5, %f0, %f5
	flw	%f6, 1(%t1)
	lw	%t1, 5(%a2)

	nop
	fsub	%f6, %f2, %f6
	flw	%f7, 2(%t1)
	lw	%t1, 1(%a2)

	nop
	nop
	nop
	fsub	%f7, %f4, %f7

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.45886

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.45888

	nop
	nop
	fmul	%f8, %f5, %f5
	lw	%t1, 4(%a2)

	nop
	nop
	flw	%f9, 0(%t1)
	lw	%t1, 4(%a2)

	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	flw	%f10, 1(%t1)
	lw	%t1, 4(%a2)

	nop
	fmul	%f9, %f9, %f10
	flw	%f10, 2(%t1)
	lw	%t1, 3(%a2)

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	nop
	nop
	fadd	%f8, %f8, %f9

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45890

	nop
	fmul	%f9, %f6, %f7
	lw	%t1, 9(%a2)
	fmul	%f7, %f7, %f5

	nop
	flw	%f10, 0(%t1)
	lw	%t1, 9(%a2)
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 1(%t1)
	lw	%t1, 9(%a2)

	nop
	nop
	fmul	%f7, %f7, %f9
	flw	%f6, 2(%t1)

	nop
	nop
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fadd	%f5, %f7, %f5

	nop
	nop
	nop
	j	bnei_cont.45891

bnei_else.45890:
	nop
	nop
	nop
	fmov	%f5, %f8

bnei_cont.45891:
	nop
	nop
	nop
	lw	%t1, 1(%a2)

	nop
	nop
	nop
	beqi	%t1, 3, bnei_else.45892

	nop
	nop
	nop
	j	bnei_cont.45893

bnei_else.45892:
	nop
	nop
	nop
	flw	%f6, 491(%zero)

	nop
	nop
	nop
	fsub	%f5, %f5, %f6

bnei_cont.45893:
	nop
	nop
	nop
	lw	%a2, 6(%a2)

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.45894

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45895

fbgt_else.45894:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.45895:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45896

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45898

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45897

bnei_else.45898:
	nop
	nop
	nop
	addi	%a2, %zero, 1

bnei_cont.45899:
	nop
	nop
	nop
	j	bnei_cont.45897

bnei_else.45896:
	nop
	nop
	nop
	add	%a2, %zero, %t1

bnei_cont.45897:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45900

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45887

bnei_else.45900:
	nop
	nop
	nop
	addi	%a2, %zero, 1

bnei_cont.45901:
	nop
	nop
	nop
	j	bnei_cont.45887

bnei_else.45888:
	nop
	nop
	lw	%t1, 4(%a2)
	lw	%a2, 6(%a2)

	nop
	nop
	nop
	flw	%f8, 0(%t1)

	nop
	nop
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%t1)

	nop
	nop
	nop
	fmul	%f6, %f8, %f6

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%t1)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f5, %f5, %f6

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.45902

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45903

fbgt_else.45902:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.45903:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45904

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45906

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45905

bnei_else.45906:
	nop
	nop
	nop
	addi	%a2, %zero, 1

bnei_cont.45907:
	nop
	nop
	nop
	j	bnei_cont.45905

bnei_else.45904:
	nop
	nop
	nop
	add	%a2, %zero, %t1

bnei_cont.45905:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45908

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45909

bnei_else.45908:
	nop
	nop
	nop
	addi	%a2, %zero, 1

bnei_cont.45909:
bnei_cont.45889:
	nop
	nop
	nop
	j	bnei_cont.45887

bnei_else.45886:
	nop
	nop
	fabs	%f3, %f5
	lw	%t1, 4(%a2)

	nop
	nop
	nop
	flw	%f5, 0(%t1)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.45910

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45911

fbgt_else.45910:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.45911:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45912

	nop
	nop
	fabs	%f3, %f6
	lw	%t1, 4(%a2)

	nop
	nop
	nop
	flw	%f5, 1(%t1)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.45914

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.45915

fbgt_else.45914:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.45915:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45916

	nop
	nop
	fabs	%f3, %f7
	lw	%t1, 4(%a2)

	nop
	nop
	nop
	flw	%f5, 2(%t1)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.45918

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45913

fbgt_else.45918:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.45919:
	nop
	nop
	nop
	j	bnei_cont.45913

bnei_else.45916:
	nop
	nop
	nop
	addi	%t1, %zero, 0

bnei_cont.45917:
	nop
	nop
	nop
	j	bnei_cont.45913

bnei_else.45912:
	nop
	nop
	nop
	addi	%t1, %zero, 0

bnei_cont.45913:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.45920

	nop
	nop
	nop
	lw	%a2, 6(%a2)

	nop
	nop
	nop
	j	bnei_cont.45921

bnei_else.45920:
	nop
	nop
	nop
	lw	%a2, 6(%a2)

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45922

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45923

bnei_else.45922:
	nop
	nop
	nop
	addi	%a2, %zero, 1

bnei_cont.45923:
bnei_cont.45921:
bnei_cont.45887:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.45924

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.45885

bnei_else.45924:
	nop
	addi	%v0, %a3, 0
	fmov	%f1, %f2
	sw	%ra, 9(%sp)

	nop
	nop
	fmov	%f2, %f4
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	check_all_inside.2907

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.45925:
	nop
	nop
	nop
	j	bnei_cont.45885

bnei_else.45884:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.45885:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.45926

	nop
	nop
	flw	%f0, 8(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	fsw	%f0, 137(%zero)
	flw	%f0, 7(%sp)

	nop
	nop
	fsw	%f0, 138(%zero)
	flw	%f0, 6(%sp)

	nop
	nop
	fsw	%f0, 139(%zero)
	flw	%f0, 5(%sp)

	nop
	nop
	nop
	fsw	%f0, 140(%zero)

	nop
	nop
	sw	%v0, 141(%zero)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 136(%zero)

	nop
	nop
	nop
	j	bnei_cont.45879

bnei_else.45926:
bnei_cont.45927:
	nop
	nop
	nop
	j	bnei_cont.45879

bnei_else.45882:
bnei_cont.45883:
	nop
	nop
	nop
	j	bnei_cont.45879

bnei_else.45878:
bnei_cont.45879:
	nop
	nop
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	solve_each_element.2922

bnei_else.45875:
	nop
	nop
	nop
	lw	%a1, 6(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.45928

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	solve_each_element.2922

bnei_else.45928:
	nop
	nop
	nop
	jr	%ra

bnei_else.45782:
	nop
	nop
	nop
	jr	%ra

solve_one_or_network.2926:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.45963

	nop
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	sw	%v1, 2(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	sw	%v0, 3(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45964

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45965

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45966

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45967

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45968

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45969

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.45970

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)

	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	solve_one_or_network.2926

bnei_else.45970:
	nop
	nop
	nop
	jr	%ra

bnei_else.45969:
	nop
	nop
	nop
	jr	%ra

bnei_else.45968:
	nop
	nop
	nop
	jr	%ra

bnei_else.45967:
	nop
	nop
	nop
	jr	%ra

bnei_else.45966:
	nop
	nop
	nop
	jr	%ra

bnei_else.45965:
	nop
	nop
	nop
	jr	%ra

bnei_else.45964:
	nop
	nop
	nop
	jr	%ra

bnei_else.45963:
	nop
	nop
	nop
	jr	%ra

trace_or_matrix.2930:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a2, %zero, 0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	lw	%a3, 0(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.46101

	nop
	nop
	nop
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	beqi	%a3, 99, bnei_else.46102

	nop
	nop
	lw	%a3, 12(%a3)
	flw	%f0, 159(%zero)

	nop
	nop
	nop
	lw	%t0, 5(%a3)

	nop
	nop
	flw	%f1, 0(%t0)
	lw	%t0, 5(%a3)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 160(%zero)
	flw	%f2, 1(%t0)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 161(%zero)
	lw	%t0, 5(%a3)

	nop
	nop
	flw	%f3, 2(%t0)
	lw	%t0, 1(%a3)

	nop
	nop
	nop
	fsub	%f2, %f2, %f3

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.46104

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.46106

	nop
	nop
	flw	%f3, 0(%a0)
	flw	%f4, 1(%a0)

	flw	%f5, 2(%a0)
	fmul	%f6, %f3, %f3
	lw	%t0, 4(%a3)
	fmul	%f8, %f4, %f4

	nop
	nop
	flw	%f7, 0(%t0)
	lw	%t0, 4(%a3)

	nop
	fmul	%f6, %f6, %f7
	flw	%f9, 1(%t0)
	lw	%t0, 4(%a3)

	nop
	fmul	%f8, %f8, %f9
	flw	%f10, 2(%t0)
	lw	%t0, 3(%a3)

	nop
	nop
	fadd	%f6, %f6, %f8
	fmul	%f8, %f5, %f5

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	nop
	fadd	%f6, %f6, %f8

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46108

	nop
	nop
	fmul	%f8, %f4, %f5
	lw	%t1, 9(%a3)

	nop
	nop
	flw	%f11, 0(%t1)
	lw	%t1, 9(%a3)

	nop
	fmul	%f8, %f8, %f11
	flw	%f11, 1(%t1)
	lw	%t1, 9(%a3)

	nop
	nop
	fadd	%f6, %f6, %f8
	fmul	%f8, %f5, %f3

	nop
	nop
	fmul	%f8, %f8, %f11
	flw	%f11, 2(%t1)

	nop
	nop
	fadd	%f6, %f6, %f8
	fmul	%f8, %f3, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f11

	nop
	nop
	nop
	fadd	%f6, %f6, %f8

	nop
	nop
	nop
	j	bnei_cont.46109

bnei_else.46108:
bnei_cont.46109:
	nop
	nop
	nop
	flw	%f8, 493(%zero)

	nop
	nop
	nop
	fbne	%f6, %f8, fbeq_else.46110

	nop
	nop
	nop
	addi	%t1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46111

fbeq_else.46110:
	nop
	nop
	nop
	addi	%t1, %zero, 0

fbeq_cont.46111:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46112

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46105

bnei_else.46112:
	nop
	nop
	fmul	%f11, %f3, %f0
	fmul	%f12, %f4, %f1

	nop
	nop
	fmul	%f11, %f11, %f7
	fmul	%f12, %f12, %f9

	nop
	nop
	fadd	%f11, %f11, %f12
	fmul	%f12, %f5, %f2

	nop
	nop
	nop
	fmul	%f12, %f12, %f10

	nop
	nop
	nop
	fadd	%f11, %f11, %f12

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46114

	nop
	fmul	%f12, %f5, %f1
	fmul	%f13, %f4, %f2
	lw	%t1, 9(%a3)

	fadd	%f12, %f12, %f13
	flw	%f13, 0(%t1)
	fmul	%f5, %f5, %f0
	lw	%t1, 9(%a3)

	nop
	nop
	fmul	%f12, %f12, %f13
	fmul	%f13, %f3, %f2

	fadd	%f5, %f13, %f5
	flw	%f13, 1(%t1)
	fmul	%f3, %f3, %f1
	lw	%t1, 9(%a3)

	nop
	nop
	fmul	%f5, %f5, %f13
	fmul	%f4, %f4, %f0

	nop
	fadd	%f5, %f12, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%t1)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f4, 471(%zero)

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f11, %f3

	nop
	nop
	nop
	j	bnei_cont.46115

bnei_else.46114:
	nop
	nop
	nop
	fmov	%f3, %f11

bnei_cont.46115:
	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f1, %f1

	nop
	nop
	fmul	%f4, %f4, %f7
	fmul	%f5, %f5, %f9

	nop
	nop
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2

	nop
	nop
	nop
	fmul	%f5, %f5, %f10

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46116

	nop
	fmul	%f5, %f1, %f2
	lw	%t0, 9(%a3)
	fmul	%f2, %f2, %f0

	nop
	flw	%f7, 0(%t0)
	lw	%t0, 9(%a3)
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	fadd	%f4, %f4, %f5
	flw	%f5, 1(%t0)
	lw	%t0, 9(%a3)

	nop
	nop
	fmul	%f2, %f2, %f5
	flw	%f1, 2(%t0)

	nop
	nop
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	j	bnei_cont.46117

bnei_else.46116:
	nop
	nop
	nop
	fmov	%f0, %f4

bnei_cont.46117:
	nop
	nop
	nop
	lw	%t0, 1(%a3)

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.46118

	nop
	nop
	nop
	j	bnei_cont.46119

bnei_else.46118:
	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

bnei_cont.46119:
	nop
	nop
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	fblt	%f8, %f0, fbgt_else.46120

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46121

fbgt_else.46120:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46121:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46122

	nop
	nop
	fsqrt	%f0, %f0
	lw	%a3, 6(%a3)

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46124

	nop
	nop
	nop
	j	bnei_cont.46125

bnei_else.46124:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.46125:
	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	fdiv	%f0, %f0, %f6

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46123

bnei_else.46122:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46123:
bnei_cont.46113:
	nop
	nop
	nop
	j	bnei_cont.46105

bnei_else.46106:
	nop
	nop
	lw	%a3, 4(%a3)
	flw	%f3, 0(%a0)

	nop
	nop
	flw	%f4, 0(%a3)
	flw	%f5, 1(%a0)

	nop
	fmul	%f3, %f3, %f4
	flw	%f6, 1(%a3)
	flw	%f7, 2(%a3)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fadd	%f3, %f3, %f5
	flw	%f5, 493(%zero)

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.46126

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46127

fbgt_else.46126:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46127:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46128

	nop
	nop
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46129

bnei_else.46128:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46129:
bnei_cont.46107:
	nop
	nop
	nop
	j	bnei_cont.46105

bnei_else.46104:
	nop
	nop
	flw	%f3, 0(%a0)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.46130

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46131

fbeq_else.46130:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.46131:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46132

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46133

bnei_else.46132:
	nop
	nop
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.46134

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46135

fbgt_else.46134:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.46135:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46136

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.46138

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46137

bnei_else.46138:
	nop
	nop
	nop
	addi	%t1, %zero, 1

bnei_cont.46139:
	nop
	nop
	nop
	j	bnei_cont.46137

bnei_else.46136:
	nop
	nop
	nop
	add	%t1, %zero, %t2

bnei_cont.46137:
	nop
	nop
	nop
	flw	%f5, 0(%t0)

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46140

	nop
	nop
	nop
	j	bnei_cont.46141

bnei_else.46140:
	nop
	nop
	nop
	fneg	%f5, %f5

bnei_cont.46141:
	nop
	fsub	%f5, %f5, %f0
	flw	%f6, 1(%a0)
	flw	%f7, 1(%t0)

	nop
	nop
	nop
	fdiv	%f5, %f5, %f3

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	nop
	fadd	%f6, %f6, %f1

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.46142

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46143

fbgt_else.46142:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46143:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46144

	nop
	nop
	flw	%f6, 2(%a0)
	flw	%f7, 2(%t0)

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	nop
	fadd	%f6, %f6, %f2

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.46146

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46147

fbgt_else.46146:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46147:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46148

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46145

bnei_else.46148:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46149:
	nop
	nop
	nop
	j	bnei_cont.46145

bnei_else.46144:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46145:
bnei_cont.46133:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46150

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46151

bnei_else.46150:
	nop
	nop
	nop
	flw	%f5, 1(%a0)

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.46152

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46153

fbeq_else.46152:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.46153:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46154

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46155

bnei_else.46154:
	nop
	nop
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.46156

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46157

fbgt_else.46156:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.46157:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46158

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.46160

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46159

bnei_else.46160:
	nop
	nop
	nop
	addi	%t1, %zero, 1

bnei_cont.46161:
	nop
	nop
	nop
	j	bnei_cont.46159

bnei_else.46158:
	nop
	nop
	nop
	add	%t1, %zero, %t2

bnei_cont.46159:
	nop
	nop
	nop
	flw	%f6, 1(%t0)

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46162

	nop
	nop
	nop
	j	bnei_cont.46163

bnei_else.46162:
	nop
	nop
	nop
	fneg	%f6, %f6

bnei_cont.46163:
	nop
	fsub	%f6, %f6, %f1
	flw	%f7, 2(%a0)
	flw	%f8, 2(%t0)

	nop
	nop
	nop
	fdiv	%f6, %f6, %f5

	nop
	nop
	nop
	fmul	%f7, %f6, %f7

	nop
	nop
	nop
	fadd	%f7, %f7, %f2

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.46164

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46165

fbgt_else.46164:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46165:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46166

	nop
	nop
	fmul	%f7, %f6, %f3
	flw	%f8, 0(%t0)

	nop
	nop
	nop
	fadd	%f7, %f7, %f0

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.46168

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46169

fbgt_else.46168:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46169:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46170

	nop
	nop
	nop
	fsw	%f6, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46167

bnei_else.46170:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46171:
	nop
	nop
	nop
	j	bnei_cont.46167

bnei_else.46166:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46167:
bnei_cont.46155:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46172

	nop
	nop
	nop
	addi	%a3, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.46173

bnei_else.46172:
	nop
	nop
	nop
	flw	%f6, 2(%a0)

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.46174

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46175

fbeq_else.46174:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.46175:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46176

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46177

bnei_else.46176:
	nop
	nop
	lw	%t0, 4(%a3)
	lw	%a3, 6(%a3)

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.46178

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46179

fbgt_else.46178:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46179:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46180

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46182

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46181

bnei_else.46182:
	nop
	nop
	nop
	addi	%a3, %zero, 1

bnei_cont.46183:
	nop
	nop
	nop
	j	bnei_cont.46181

bnei_else.46180:
	nop
	nop
	nop
	add	%a3, %zero, %t1

bnei_cont.46181:
	nop
	nop
	nop
	flw	%f4, 2(%t0)

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46184

	nop
	nop
	nop
	j	bnei_cont.46185

bnei_else.46184:
	nop
	nop
	nop
	fneg	%f4, %f4

bnei_cont.46185:
	nop
	nop
	nop
	fsub	%f2, %f4, %f2

	nop
	nop
	nop
	fdiv	%f2, %f2, %f6

	nop
	nop
	nop
	fmul	%f3, %f2, %f3

	nop
	nop
	fadd	%f0, %f3, %f0
	flw	%f3, 0(%t0)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.46186

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46187

fbgt_else.46186:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46187:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46188

	nop
	nop
	nop
	fmul	%f0, %f2, %f5

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t0)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46190

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46191

fbgt_else.46190:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46191:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46192

	nop
	nop
	nop
	fsw	%f2, 135(%zero)

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46189

bnei_else.46192:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46193:
	nop
	nop
	nop
	j	bnei_cont.46189

bnei_else.46188:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46189:
bnei_cont.46177:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46194

	nop
	nop
	nop
	addi	%a3, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.46195

bnei_else.46194:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46195:
bnei_cont.46173:
bnei_cont.46151:
bnei_cont.46105:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46196

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46198

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46199

fbgt_else.46198:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46199:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46200

	nop
	nop
	nop
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.46202

	nop
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %a3, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46204

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46206

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46208

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46210

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46212

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 7(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46214

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 8

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_one_or_network.2926

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46214:
bnei_cont.46215:
	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46212:
bnei_cont.46213:
	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46210:
bnei_cont.46211:
	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46208:
bnei_cont.46209:
	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46206:
bnei_cont.46207:
	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46204:
bnei_cont.46205:
	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46202:
bnei_cont.46203:
	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46200:
bnei_cont.46201:
	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46196:
bnei_cont.46197:
	nop
	nop
	nop
	j	bnei_cont.46103

bnei_else.46102:
	nop
	nop
	nop
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.46216

	nop
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %a3, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46218

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46220

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46222

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46224

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46226

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 7(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46228

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 8

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_one_or_network.2926

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.46217

bnei_else.46228:
bnei_cont.46229:
	nop
	nop
	nop
	j	bnei_cont.46217

bnei_else.46226:
bnei_cont.46227:
	nop
	nop
	nop
	j	bnei_cont.46217

bnei_else.46224:
bnei_cont.46225:
	nop
	nop
	nop
	j	bnei_cont.46217

bnei_else.46222:
bnei_cont.46223:
	nop
	nop
	nop
	j	bnei_cont.46217

bnei_else.46220:
bnei_cont.46221:
	nop
	nop
	nop
	j	bnei_cont.46217

bnei_else.46218:
bnei_cont.46219:
	nop
	nop
	nop
	j	bnei_cont.46217

bnei_else.46216:
bnei_cont.46217:
bnei_cont.46103:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a1, 0(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.46230

	nop
	nop
	nop
	sw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.46231

	nop
	nop
	lw	%a1, 12(%a1)
	flw	%f0, 159(%zero)

	nop
	nop
	nop
	lw	%a2, 5(%a1)

	nop
	nop
	flw	%f1, 0(%a2)
	lw	%a2, 5(%a1)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 160(%zero)
	flw	%f2, 1(%a2)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 161(%zero)
	lw	%a2, 5(%a1)

	nop
	nop
	flw	%f3, 2(%a2)
	lw	%a2, 1(%a1)

	nop
	nop
	nop
	fsub	%f2, %f2, %f3

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.46233

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.46235

	nop
	nop
	lw	%a2, 0(%sp)
	lw	%a3, 4(%a1)

	nop
	nop
	flw	%f3, 0(%a2)
	flw	%f4, 1(%a2)

	nop
	flw	%f5, 2(%a2)
	fmul	%f6, %f3, %f3
	flw	%f7, 0(%a3)

	nop
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4
	lw	%a3, 4(%a1)

	nop
	nop
	flw	%f8, 1(%a3)
	lw	%a3, 4(%a1)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%a3)
	lw	%a3, 3(%a1)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46237

	nop
	nop
	fmul	%f7, %f4, %f5
	lw	%a3, 9(%a1)

	nop
	nop
	flw	%f8, 0(%a3)
	lw	%a3, 9(%a1)

	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 1(%a3)
	lw	%a3, 9(%a1)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3

	nop
	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 2(%a3)

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f3, %f4

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

	nop
	nop
	nop
	j	bnei_cont.46238

bnei_else.46237:
bnei_cont.46238:
	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.46239

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46240

fbeq_else.46239:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.46240:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46241

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46234

bnei_else.46241:
	nop
	nop
	fmul	%f8, %f3, %f0
	lw	%a3, 4(%a1)

	nop
	nop
	flw	%f9, 0(%a3)
	lw	%a3, 4(%a1)

	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1
	flw	%f10, 1(%a3)
	lw	%a3, 4(%a1)

	nop
	fmul	%f9, %f9, %f10
	flw	%f10, 2(%a3)
	lw	%a3, 3(%a1)

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f5, %f2

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	nop
	nop
	fadd	%f8, %f8, %f9

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46243

	nop
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2
	lw	%a3, 9(%a1)

	fadd	%f9, %f9, %f10
	flw	%f10, 0(%a3)
	fmul	%f5, %f5, %f0
	lw	%a3, 9(%a1)

	nop
	nop
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2

	fadd	%f5, %f10, %f5
	flw	%f10, 1(%a3)
	fmul	%f3, %f3, %f1
	lw	%a3, 9(%a1)

	nop
	nop
	fmul	%f5, %f5, %f10
	fmul	%f4, %f4, %f0

	nop
	fadd	%f5, %f9, %f5
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a3)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f4, 471(%zero)

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f8, %f3

	nop
	nop
	nop
	j	bnei_cont.46244

bnei_else.46243:
	nop
	nop
	nop
	fmov	%f3, %f8

bnei_cont.46244:
	nop
	nop
	fmul	%f4, %f0, %f0
	lw	%a3, 4(%a1)

	nop
	nop
	flw	%f5, 0(%a3)
	lw	%a3, 4(%a1)

	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1
	flw	%f8, 1(%a3)
	lw	%a3, 4(%a1)

	nop
	fmul	%f5, %f5, %f8
	flw	%f8, 2(%a3)
	lw	%a3, 3(%a1)

	nop
	nop
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2

	nop
	nop
	nop
	fmul	%f5, %f5, %f8

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46245

	nop
	fmul	%f5, %f1, %f2
	lw	%a3, 9(%a1)
	fmul	%f2, %f2, %f0

	nop
	flw	%f8, 0(%a3)
	lw	%a3, 9(%a1)
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f5, %f5, %f8

	nop
	fadd	%f4, %f4, %f5
	flw	%f5, 1(%a3)
	lw	%a3, 9(%a1)

	nop
	nop
	fmul	%f2, %f2, %f5
	flw	%f1, 2(%a3)

	nop
	nop
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	j	bnei_cont.46246

bnei_else.46245:
	nop
	nop
	nop
	fmov	%f0, %f4

bnei_cont.46246:
	nop
	nop
	nop
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.46247

	nop
	nop
	nop
	j	bnei_cont.46248

bnei_else.46247:
	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

bnei_cont.46248:
	nop
	nop
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	fblt	%f7, %f0, fbgt_else.46249

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46250

fbgt_else.46249:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46250:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46251

	nop
	nop
	fsqrt	%f0, %f0
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46253

	nop
	nop
	nop
	j	bnei_cont.46254

bnei_else.46253:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.46254:
	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	fdiv	%f0, %f0, %f6

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46252

bnei_else.46251:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46252:
bnei_cont.46242:
	nop
	nop
	nop
	j	bnei_cont.46234

bnei_else.46235:
	nop
	nop
	lw	%a1, 4(%a1)
	lw	%a2, 0(%sp)

	nop
	nop
	flw	%f3, 0(%a2)
	flw	%f4, 0(%a1)

	nop
	fmul	%f3, %f3, %f4
	flw	%f5, 1(%a2)
	flw	%f6, 1(%a1)

	nop
	nop
	fmul	%f5, %f5, %f6
	flw	%f7, 2(%a1)

	nop
	nop
	fadd	%f3, %f3, %f5
	flw	%f5, 2(%a2)

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fadd	%f3, %f3, %f5
	flw	%f5, 493(%zero)

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.46255

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46256

fbgt_else.46255:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.46256:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46257

	nop
	nop
	fmul	%f0, %f4, %f0
	fmul	%f1, %f6, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	fmul	%f1, %f7, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46258

bnei_else.46257:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46258:
bnei_cont.46236:
	nop
	nop
	nop
	j	bnei_cont.46234

bnei_else.46233:
	nop
	nop
	lw	%a2, 0(%sp)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	flw	%f3, 0(%a2)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.46259

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46260

fbeq_else.46259:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.46260:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46261

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46262

bnei_else.46261:
	nop
	nop
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.46263

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46264

fbgt_else.46263:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46264:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46265

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46267

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46266

bnei_else.46267:
	nop
	nop
	nop
	addi	%t0, %zero, 1

bnei_cont.46268:
	nop
	nop
	nop
	j	bnei_cont.46266

bnei_else.46265:
	nop
	nop
	nop
	add	%t0, %zero, %t1

bnei_cont.46266:
	nop
	nop
	nop
	flw	%f5, 0(%a3)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46269

	nop
	nop
	nop
	j	bnei_cont.46270

bnei_else.46269:
	nop
	nop
	nop
	fneg	%f5, %f5

bnei_cont.46270:
	nop
	fsub	%f5, %f5, %f0
	flw	%f6, 1(%a2)
	flw	%f7, 1(%a3)

	nop
	nop
	nop
	fdiv	%f5, %f5, %f3

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	nop
	fadd	%f6, %f6, %f1

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.46271

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46272

fbgt_else.46271:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46272:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46273

	nop
	nop
	flw	%f6, 2(%a2)
	flw	%f7, 2(%a3)

	nop
	nop
	nop
	fmul	%f6, %f5, %f6

	nop
	nop
	nop
	fadd	%f6, %f6, %f2

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.46275

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46276

fbgt_else.46275:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46276:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46277

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46274

bnei_else.46277:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46278:
	nop
	nop
	nop
	j	bnei_cont.46274

bnei_else.46273:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46274:
bnei_cont.46262:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46279

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46280

bnei_else.46279:
	nop
	nop
	nop
	flw	%f5, 1(%a2)

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.46281

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46282

fbeq_else.46281:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.46282:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46283

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46284

bnei_else.46283:
	nop
	nop
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.46285

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46286

fbgt_else.46285:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46286:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46287

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46289

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46288

bnei_else.46289:
	nop
	nop
	nop
	addi	%t0, %zero, 1

bnei_cont.46290:
	nop
	nop
	nop
	j	bnei_cont.46288

bnei_else.46287:
	nop
	nop
	nop
	add	%t0, %zero, %t1

bnei_cont.46288:
	nop
	nop
	nop
	flw	%f6, 1(%a3)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46291

	nop
	nop
	nop
	j	bnei_cont.46292

bnei_else.46291:
	nop
	nop
	nop
	fneg	%f6, %f6

bnei_cont.46292:
	nop
	fsub	%f6, %f6, %f1
	flw	%f7, 2(%a2)
	flw	%f8, 2(%a3)

	nop
	nop
	nop
	fdiv	%f6, %f6, %f5

	nop
	nop
	nop
	fmul	%f7, %f6, %f7

	nop
	nop
	nop
	fadd	%f7, %f7, %f2

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.46293

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46294

fbgt_else.46293:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46294:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46295

	nop
	nop
	fmul	%f7, %f6, %f3
	flw	%f8, 0(%a3)

	nop
	nop
	nop
	fadd	%f7, %f7, %f0

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.46297

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46298

fbgt_else.46297:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46298:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46299

	nop
	nop
	nop
	fsw	%f6, 135(%zero)

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46296

bnei_else.46299:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46300:
	nop
	nop
	nop
	j	bnei_cont.46296

bnei_else.46295:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46296:
bnei_cont.46284:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46301

	nop
	nop
	nop
	addi	%a1, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.46302

bnei_else.46301:
	nop
	nop
	nop
	flw	%f6, 2(%a2)

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.46303

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46304

fbeq_else.46303:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.46304:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46305

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46306

bnei_else.46305:
	nop
	nop
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.46307

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46308

fbgt_else.46307:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46308:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46309

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46311

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46310

bnei_else.46311:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.46312:
	nop
	nop
	nop
	j	bnei_cont.46310

bnei_else.46309:
	nop
	nop
	nop
	add	%a1, %zero, %t0

bnei_cont.46310:
	nop
	nop
	nop
	flw	%f4, 2(%a3)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46313

	nop
	nop
	nop
	j	bnei_cont.46314

bnei_else.46313:
	nop
	nop
	nop
	fneg	%f4, %f4

bnei_cont.46314:
	nop
	nop
	nop
	fsub	%f2, %f4, %f2

	nop
	nop
	nop
	fdiv	%f2, %f2, %f6

	nop
	nop
	nop
	fmul	%f3, %f2, %f3

	nop
	nop
	fadd	%f0, %f3, %f0
	flw	%f3, 0(%a3)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.46315

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46316

fbgt_else.46315:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.46316:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46317

	nop
	nop
	nop
	fmul	%f0, %f2, %f5

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%a3)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46319

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46320

fbgt_else.46319:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.46320:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46321

	nop
	nop
	nop
	fsw	%f2, 135(%zero)

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46318

bnei_else.46321:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46322:
	nop
	nop
	nop
	j	bnei_cont.46318

bnei_else.46317:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46318:
bnei_cont.46306:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46323

	nop
	nop
	nop
	addi	%a1, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.46324

bnei_else.46323:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46324:
bnei_cont.46302:
bnei_cont.46280:
bnei_cont.46234:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46325

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46327

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46328

fbgt_else.46327:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.46328:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46329

	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.46331

	nop
	nop
	lw	%a1, 83(%a1)
	lw	%a3, 1(%sp)

	nop
	sw	%a0, 6(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0

	nop
	nop
	addi	%v0, %a3, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46333

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46335

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46337

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46339

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46341

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 7

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_one_or_network.2926

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.46232

bnei_else.46341:
bnei_cont.46342:
	nop
	nop
	nop
	j	bnei_cont.46232

bnei_else.46339:
bnei_cont.46340:
	nop
	nop
	nop
	j	bnei_cont.46232

bnei_else.46337:
bnei_cont.46338:
	nop
	nop
	nop
	j	bnei_cont.46232

bnei_else.46335:
bnei_cont.46336:
	nop
	nop
	nop
	j	bnei_cont.46232

bnei_else.46333:
bnei_cont.46334:
	nop
	nop
	nop
	j	bnei_cont.46232

bnei_else.46331:
bnei_cont.46332:
	nop
	nop
	nop
	j	bnei_cont.46232

bnei_else.46329:
bnei_cont.46330:
	nop
	nop
	nop
	j	bnei_cont.46232

bnei_else.46325:
bnei_cont.46326:
	nop
	nop
	nop
	j	bnei_cont.46232

bnei_else.46231:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.46343

	nop
	nop
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)

	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%a0, %a3, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46345

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46347

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46349

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46351

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46353

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 7

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_one_or_network.2926

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.46344

bnei_else.46353:
bnei_cont.46354:
	nop
	nop
	nop
	j	bnei_cont.46344

bnei_else.46351:
bnei_cont.46352:
	nop
	nop
	nop
	j	bnei_cont.46344

bnei_else.46349:
bnei_cont.46350:
	nop
	nop
	nop
	j	bnei_cont.46344

bnei_else.46347:
bnei_cont.46348:
	nop
	nop
	nop
	j	bnei_cont.46344

bnei_else.46345:
bnei_cont.46346:
	nop
	nop
	nop
	j	bnei_cont.46344

bnei_else.46343:
bnei_cont.46344:
bnei_cont.46232:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	trace_or_matrix.2930

bnei_else.46230:
	nop
	nop
	nop
	jr	%ra

bnei_else.46101:
	nop
	nop
	nop
	jr	%ra

solve_each_element_fast.2936:
	nop
	nop
	lw	%a1, 0(%a0)
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a2, 0(%at)

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.46391

	nop
	lw	%a3, 12(%a2)
	addi	%t1, %zero, 1
	lw	%t2, 1(%a0)

	nop
	lw	%t0, 10(%a3)
	add	%at, %t2, %a2
	lw	%t3, 1(%a3)

	nop
	nop
	flw	%f0, 0(%t0)
	flw	%f1, 1(%t0)

	nop
	nop
	flw	%f2, 2(%t0)
	lw	%t2, 0(%at)

	nop
	nop
	nop
	beqi	%t3, 1, bnei_else.46392

	nop
	nop
	nop
	beqi	%t3, 2, bnei_else.46394

	nop
	nop
	flw	%f3, 0(%t2)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.46396

	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46397

fbeq_else.46396:
	nop
	nop
	nop
	addi	%t3, %zero, 0

fbeq_cont.46397:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.46398

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46393

bnei_else.46398:
	nop
	nop
	nop
	flw	%f5, 1(%t2)

	nop
	nop
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%t2)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t2)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t0)

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1

	nop
	nop
	nop
	fsub	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.46400

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46401

fbgt_else.46400:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46401:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46402

	nop
	nop
	nop
	lw	%t0, 6(%a3)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46404

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%t2)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.46405

bnei_else.46404:
	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%t2)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

bnei_cont.46405:
	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46403

bnei_else.46402:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46403:
bnei_cont.46399:
	nop
	nop
	nop
	j	bnei_cont.46393

bnei_else.46394:
	nop
	nop
	flw	%f0, 0(%t2)
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46406

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46407

fbgt_else.46406:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.46407:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.46408

	nop
	nop
	nop
	flw	%f1, 3(%t0)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46409

bnei_else.46408:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46409:
bnei_cont.46395:
	nop
	nop
	nop
	j	bnei_cont.46393

bnei_else.46392:
	nop
	nop
	lw	%t0, 0(%a0)
	flw	%f3, 0(%t2)

	nop
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%t2)
	flw	%f5, 1(%t0)

	nop
	nop
	fmul	%f3, %f3, %f4
	lw	%t3, 4(%a3)

	nop
	nop
	fmul	%f6, %f3, %f5
	flw	%f7, 1(%t3)

	nop
	nop
	nop
	fadd	%f6, %f6, %f1

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.46410

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46411

fbgt_else.46410:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.46411:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.46412

	nop
	nop
	flw	%f6, 2(%t0)
	lw	%t3, 4(%a3)

	nop
	nop
	fmul	%f6, %f3, %f6
	flw	%f7, 2(%t3)

	nop
	nop
	nop
	fadd	%f6, %f6, %f2

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.46414

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46415

fbgt_else.46414:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.46415:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.46416

	nop
	nop
	nop
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.46418

	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46419

fbeq_else.46418:
	nop
	nop
	nop
	addi	%t3, %zero, 0

fbeq_cont.46419:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.46420

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46413

bnei_else.46420:
	nop
	nop
	nop
	addi	%t3, %zero, 1

bnei_cont.46421:
	nop
	nop
	nop
	j	bnei_cont.46413

bnei_else.46416:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.46417:
	nop
	nop
	nop
	j	bnei_cont.46413

bnei_else.46412:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.46413:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.46422

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46423

bnei_else.46422:
	nop
	nop
	flw	%f3, 2(%t2)
	flw	%f4, 3(%t2)

	nop
	fsub	%f3, %f3, %f1
	flw	%f6, 0(%t0)
	lw	%t3, 4(%a3)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f8, 0(%t3)

	nop
	nop
	nop
	fmul	%f7, %f3, %f6

	nop
	nop
	nop
	fadd	%f7, %f7, %f0

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.46424

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46425

fbgt_else.46424:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.46425:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.46426

	nop
	nop
	flw	%f7, 2(%t0)
	lw	%t0, 4(%a3)

	nop
	nop
	fmul	%f7, %f3, %f7
	flw	%f8, 2(%t0)

	nop
	nop
	nop
	fadd	%f7, %f7, %f2

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.46428

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46429

fbgt_else.46428:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46429:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46430

	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.46432

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46433

fbeq_else.46432:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.46433:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46434

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46427

bnei_else.46434:
	nop
	nop
	nop
	addi	%t0, %zero, 1

bnei_cont.46435:
	nop
	nop
	nop
	j	bnei_cont.46427

bnei_else.46430:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46431:
	nop
	nop
	nop
	j	bnei_cont.46427

bnei_else.46426:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46427:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46436

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.46437

bnei_else.46436:
	nop
	nop
	flw	%f3, 4(%t2)
	lw	%t0, 4(%a3)

	nop
	nop
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%t2)

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	nop
	fmul	%f4, %f2, %f6

	nop
	nop
	fadd	%f0, %f4, %f0
	flw	%f4, 0(%t0)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.46438

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46439

fbgt_else.46438:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46439:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46440

	nop
	nop
	fmul	%f0, %f2, %f5
	lw	%t0, 4(%a3)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t0)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46442

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46443

fbgt_else.46442:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.46443:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46444

	nop
	nop
	nop
	flw	%f0, 493(%zero)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.46446

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46447

fbeq_else.46446:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.46447:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46448

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46441

bnei_else.46448:
	nop
	nop
	nop
	addi	%t0, %zero, 1

bnei_cont.46449:
	nop
	nop
	nop
	j	bnei_cont.46441

bnei_else.46444:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46445:
	nop
	nop
	nop
	j	bnei_cont.46441

bnei_else.46440:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46441:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46450

	nop
	nop
	nop
	fsw	%f2, 135(%zero)

	nop
	nop
	nop
	addi	%t0, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.46451

bnei_else.46450:
	nop
	nop
	nop
	addi	%t0, %zero, 0

bnei_cont.46451:
bnei_cont.46437:
bnei_cont.46423:
bnei_cont.46393:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46452

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.46453

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46454

fbgt_else.46453:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46454:
	nop
	nop
	nop
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%v0, 2(%sp)

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46455

	nop
	nop
	nop
	flw	%f2, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.46457

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46458

fbgt_else.46457:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46458:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46459

	nop
	nop
	flw	%f2, 467(%zero)
	flw	%f3, 162(%zero)

	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 0(%a1)
	flw	%f4, 163(%zero)

	nop
	fmul	%f2, %f2, %f0
	flw	%f5, 164(%zero)
	sw	%t0, 3(%sp)

	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 1(%a1)
	sw	%a2, 4(%sp)

	nop
	nop
	nop
	fmul	%f3, %f3, %f0

	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%a1)
	lw	%a1, 0(%v1)

	nop
	nop
	nop
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	fsw	%f4, 5(%sp)

	nop
	nop
	nop
	fsw	%f3, 6(%sp)

	nop
	nop
	nop
	fsw	%f2, 7(%sp)

	nop
	nop
	nop
	fsw	%f0, 8(%sp)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.46461

	nop
	nop
	nop
	lw	%a1, 12(%a1)

	nop
	nop
	nop
	lw	%a3, 5(%a1)

	nop
	nop
	flw	%f5, 0(%a3)
	lw	%a3, 5(%a1)

	nop
	fsub	%f5, %f2, %f5
	flw	%f6, 1(%a3)
	lw	%a3, 5(%a1)

	nop
	fsub	%f6, %f3, %f6
	flw	%f7, 2(%a3)
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	fsub	%f7, %f4, %f7

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.46463

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.46465

	nop
	nop
	fmul	%f8, %f5, %f5
	lw	%a3, 4(%a1)

	nop
	nop
	flw	%f9, 0(%a3)
	lw	%a3, 4(%a1)

	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6
	flw	%f10, 1(%a3)
	lw	%a3, 4(%a1)

	nop
	fmul	%f9, %f9, %f10
	flw	%f10, 2(%a3)
	lw	%a3, 3(%a1)

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	nop
	nop
	fadd	%f8, %f8, %f9

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46467

	nop
	fmul	%f9, %f6, %f7
	lw	%a3, 9(%a1)
	fmul	%f7, %f7, %f5

	nop
	flw	%f10, 0(%a3)
	lw	%a3, 9(%a1)
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 1(%a3)
	lw	%a3, 9(%a1)

	nop
	nop
	fmul	%f7, %f7, %f9
	flw	%f6, 2(%a3)

	nop
	nop
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fadd	%f5, %f7, %f5

	nop
	nop
	nop
	j	bnei_cont.46468

bnei_else.46467:
	nop
	nop
	nop
	fmov	%f5, %f8

bnei_cont.46468:
	nop
	nop
	nop
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.46469

	nop
	nop
	nop
	j	bnei_cont.46470

bnei_else.46469:
	nop
	nop
	nop
	flw	%f6, 491(%zero)

	nop
	nop
	nop
	fsub	%f5, %f5, %f6

bnei_cont.46470:
	nop
	nop
	nop
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.46471

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46472

fbgt_else.46471:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46472:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46473

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46475

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46474

bnei_else.46475:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.46476:
	nop
	nop
	nop
	j	bnei_cont.46474

bnei_else.46473:
	nop
	nop
	nop
	add	%a1, %zero, %a3

bnei_cont.46474:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46477

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46464

bnei_else.46477:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.46478:
	nop
	nop
	nop
	j	bnei_cont.46464

bnei_else.46465:
	nop
	nop
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	flw	%f8, 0(%a3)

	nop
	nop
	fmul	%f5, %f8, %f5
	flw	%f8, 1(%a3)

	nop
	nop
	nop
	fmul	%f6, %f8, %f6

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 2(%a3)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f5, %f5, %f6

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.46479

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46480

fbgt_else.46479:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46480:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46481

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46483

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46482

bnei_else.46483:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.46484:
	nop
	nop
	nop
	j	bnei_cont.46482

bnei_else.46481:
	nop
	nop
	nop
	add	%a1, %zero, %a3

bnei_cont.46482:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46485

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46486

bnei_else.46485:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.46486:
bnei_cont.46466:
	nop
	nop
	nop
	j	bnei_cont.46464

bnei_else.46463:
	nop
	nop
	fabs	%f1, %f5
	lw	%a3, 4(%a1)

	nop
	nop
	nop
	flw	%f5, 0(%a3)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.46487

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46488

fbgt_else.46487:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46488:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46489

	nop
	nop
	fabs	%f1, %f6
	lw	%a3, 4(%a1)

	nop
	nop
	nop
	flw	%f5, 1(%a3)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.46491

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46492

fbgt_else.46491:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46492:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46493

	nop
	nop
	fabs	%f1, %f7
	lw	%a3, 4(%a1)

	nop
	nop
	nop
	flw	%f5, 2(%a3)

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.46495

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46490

fbgt_else.46495:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46496:
	nop
	nop
	nop
	j	bnei_cont.46490

bnei_else.46493:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46494:
	nop
	nop
	nop
	j	bnei_cont.46490

bnei_else.46489:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46490:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46497

	nop
	nop
	nop
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	j	bnei_cont.46498

bnei_else.46497:
	nop
	nop
	nop
	lw	%a1, 6(%a1)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46499

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46500

bnei_else.46499:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.46500:
bnei_cont.46498:
bnei_cont.46464:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46501

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46462

bnei_else.46501:
	nop
	addi	%v0, %t1, 0
	fmov	%f1, %f3
	sw	%ra, 9(%sp)

	nop
	nop
	fmov	%f0, %f2
	fmov	%f2, %f4

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	check_all_inside.2907

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.46502:
	nop
	nop
	nop
	j	bnei_cont.46462

bnei_else.46461:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.46462:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.46503

	nop
	nop
	flw	%f0, 8(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	fsw	%f0, 137(%zero)
	flw	%f0, 7(%sp)

	nop
	nop
	fsw	%f0, 138(%zero)
	flw	%f0, 6(%sp)

	nop
	nop
	fsw	%f0, 139(%zero)
	flw	%f0, 5(%sp)

	nop
	nop
	nop
	fsw	%f0, 140(%zero)

	nop
	nop
	sw	%v0, 141(%zero)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 136(%zero)

	nop
	nop
	nop
	j	bnei_cont.46456

bnei_else.46503:
bnei_cont.46504:
	nop
	nop
	nop
	j	bnei_cont.46456

bnei_else.46459:
bnei_cont.46460:
	nop
	nop
	nop
	j	bnei_cont.46456

bnei_else.46455:
bnei_cont.46456:
	nop
	nop
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	solve_each_element_fast.2936

bnei_else.46452:
	nop
	nop
	nop
	lw	%a1, 6(%a3)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46505

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	j	solve_each_element_fast.2936

bnei_else.46505:
	nop
	nop
	nop
	jr	%ra

bnei_else.46391:
	nop
	nop
	nop
	jr	%ra

solve_one_or_network_fast.2940:
	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.46540

	nop
	lw	%a1, 83(%a1)
	addi	%a2, %zero, 0
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	sw	%v1, 2(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	sw	%v0, 3(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.46541

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.46542

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.46543

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.46544

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.46545

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.46546

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.46547

	nop
	nop
	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)

	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)

	nop
	addi	%v0, %v0, 1
	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	solve_one_or_network_fast.2940

bnei_else.46547:
	nop
	nop
	nop
	jr	%ra

bnei_else.46546:
	nop
	nop
	nop
	jr	%ra

bnei_else.46545:
	nop
	nop
	nop
	jr	%ra

bnei_else.46544:
	nop
	nop
	nop
	jr	%ra

bnei_else.46543:
	nop
	nop
	nop
	jr	%ra

bnei_else.46542:
	nop
	nop
	nop
	jr	%ra

bnei_else.46541:
	nop
	nop
	nop
	jr	%ra

bnei_else.46540:
	nop
	nop
	nop
	jr	%ra

trace_or_matrix_fast.2944:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a2, %zero, 0

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	lw	%a3, 0(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.46678

	nop
	nop
	nop
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	beqi	%a3, 99, bnei_else.46679

	nop
	nop
	lw	%t0, 12(%a3)
	lw	%t2, 1(%a0)

	nop
	lw	%t1, 10(%t0)
	add	%at, %t2, %a3
	lw	%t2, 1(%t0)

	nop
	nop
	flw	%f0, 0(%t1)
	flw	%f1, 1(%t1)

	nop
	nop
	flw	%f2, 2(%t1)
	lw	%a3, 0(%at)

	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.46681

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.46683

	nop
	nop
	flw	%f3, 0(%a3)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.46685

	nop
	nop
	nop
	addi	%t2, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46686

fbeq_else.46685:
	nop
	nop
	nop
	addi	%t2, %zero, 0

fbeq_cont.46686:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.46687

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46682

bnei_else.46687:
	nop
	nop
	nop
	flw	%f5, 1(%a3)

	nop
	nop
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%a3)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a3)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%t1)

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1

	nop
	nop
	nop
	fsub	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.46689

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46690

fbgt_else.46689:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46690:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46691

	nop
	nop
	nop
	lw	%t0, 6(%t0)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.46693

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a3)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.46694

bnei_else.46693:
	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a3)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

bnei_cont.46694:
	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46692

bnei_else.46691:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46692:
bnei_cont.46688:
	nop
	nop
	nop
	j	bnei_cont.46682

bnei_else.46683:
	nop
	nop
	flw	%f0, 0(%a3)
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46695

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46696

fbgt_else.46695:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46696:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46697

	nop
	nop
	nop
	flw	%f1, 3(%t1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46698

bnei_else.46697:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46698:
bnei_cont.46684:
	nop
	nop
	nop
	j	bnei_cont.46682

bnei_else.46681:
	nop
	nop
	lw	%t1, 0(%a0)
	flw	%f3, 0(%a3)

	nop
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a3)
	flw	%f5, 1(%t1)

	nop
	nop
	fmul	%f3, %f3, %f4
	lw	%t2, 4(%t0)

	nop
	nop
	fmul	%f6, %f3, %f5
	flw	%f7, 1(%t2)

	nop
	nop
	nop
	fadd	%f6, %f6, %f1

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.46699

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46700

fbgt_else.46699:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.46700:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.46701

	nop
	nop
	flw	%f6, 2(%t1)
	lw	%t2, 4(%t0)

	nop
	nop
	fmul	%f6, %f3, %f6
	flw	%f7, 2(%t2)

	nop
	nop
	nop
	fadd	%f6, %f6, %f2

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.46703

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46704

fbgt_else.46703:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.46704:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.46705

	nop
	nop
	nop
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.46707

	nop
	nop
	nop
	addi	%t2, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46708

fbeq_else.46707:
	nop
	nop
	nop
	addi	%t2, %zero, 0

fbeq_cont.46708:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.46709

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46702

bnei_else.46709:
	nop
	nop
	nop
	addi	%t2, %zero, 1

bnei_cont.46710:
	nop
	nop
	nop
	j	bnei_cont.46702

bnei_else.46705:
	nop
	nop
	nop
	addi	%t2, %zero, 0

bnei_cont.46706:
	nop
	nop
	nop
	j	bnei_cont.46702

bnei_else.46701:
	nop
	nop
	nop
	addi	%t2, %zero, 0

bnei_cont.46702:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.46711

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46712

bnei_else.46711:
	nop
	nop
	flw	%f3, 2(%a3)
	flw	%f4, 3(%a3)

	nop
	fsub	%f3, %f3, %f1
	flw	%f6, 0(%t1)
	lw	%t2, 4(%t0)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f8, 0(%t2)

	nop
	nop
	nop
	fmul	%f7, %f3, %f6

	nop
	nop
	nop
	fadd	%f7, %f7, %f0

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.46713

	nop
	nop
	nop
	addi	%t2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46714

fbgt_else.46713:
	nop
	nop
	nop
	addi	%t2, %zero, 1

fbgt_cont.46714:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.46715

	nop
	nop
	flw	%f7, 2(%t1)
	lw	%t1, 4(%t0)

	nop
	nop
	fmul	%f7, %f3, %f7
	flw	%f8, 2(%t1)

	nop
	nop
	nop
	fadd	%f7, %f7, %f2

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.46717

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46718

fbgt_else.46717:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46718:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46719

	nop
	nop
	nop
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.46721

	nop
	nop
	nop
	addi	%t1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46722

fbeq_else.46721:
	nop
	nop
	nop
	addi	%t1, %zero, 0

fbeq_cont.46722:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46723

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46716

bnei_else.46723:
	nop
	nop
	nop
	addi	%t1, %zero, 1

bnei_cont.46724:
	nop
	nop
	nop
	j	bnei_cont.46716

bnei_else.46719:
	nop
	nop
	nop
	addi	%t1, %zero, 0

bnei_cont.46720:
	nop
	nop
	nop
	j	bnei_cont.46716

bnei_else.46715:
	nop
	nop
	nop
	addi	%t1, %zero, 0

bnei_cont.46716:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46725

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%a3, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.46726

bnei_else.46725:
	nop
	nop
	nop
	flw	%f3, 4(%a3)

	nop
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a3)
	lw	%a3, 4(%t0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	nop
	fmul	%f4, %f2, %f6

	nop
	nop
	fadd	%f0, %f4, %f0
	flw	%f4, 0(%a3)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.46727

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46728

fbgt_else.46727:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46728:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46729

	nop
	nop
	fmul	%f0, %f2, %f5
	lw	%a3, 4(%t0)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%a3)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46731

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46732

fbgt_else.46731:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46732:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46733

	nop
	nop
	nop
	flw	%f0, 493(%zero)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.46735

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46736

fbeq_else.46735:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.46736:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46737

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46730

bnei_else.46737:
	nop
	nop
	nop
	addi	%a3, %zero, 1

bnei_cont.46738:
	nop
	nop
	nop
	j	bnei_cont.46730

bnei_else.46733:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46734:
	nop
	nop
	nop
	j	bnei_cont.46730

bnei_else.46729:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46730:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46739

	nop
	nop
	nop
	fsw	%f2, 135(%zero)

	nop
	nop
	nop
	addi	%a3, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.46740

bnei_else.46739:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bnei_cont.46740:
bnei_cont.46726:
bnei_cont.46712:
bnei_cont.46682:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46741

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46743

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46744

fbgt_else.46743:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46744:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46745

	nop
	nop
	nop
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.46747

	nop
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %a3, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46749

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46751

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46753

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46755

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46757

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 7(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46759

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 8

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46759:
bnei_cont.46760:
	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46757:
bnei_cont.46758:
	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46755:
bnei_cont.46756:
	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46753:
bnei_cont.46754:
	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46751:
bnei_cont.46752:
	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46749:
bnei_cont.46750:
	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46747:
bnei_cont.46748:
	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46745:
bnei_cont.46746:
	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46741:
bnei_cont.46742:
	nop
	nop
	nop
	j	bnei_cont.46680

bnei_else.46679:
	nop
	nop
	nop
	lw	%a3, 1(%a1)

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.46761

	nop
	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %a3, 0
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46763

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46765

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46767

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46769

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46771

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	lw	%v1, 7(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46773

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 8

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	nop
	lw	%ra, 5(%sp)

	nop
	nop
	nop
	j	bnei_cont.46762

bnei_else.46773:
bnei_cont.46774:
	nop
	nop
	nop
	j	bnei_cont.46762

bnei_else.46771:
bnei_cont.46772:
	nop
	nop
	nop
	j	bnei_cont.46762

bnei_else.46769:
bnei_cont.46770:
	nop
	nop
	nop
	j	bnei_cont.46762

bnei_else.46767:
bnei_cont.46768:
	nop
	nop
	nop
	j	bnei_cont.46762

bnei_else.46765:
bnei_cont.46766:
	nop
	nop
	nop
	j	bnei_cont.46762

bnei_else.46763:
bnei_cont.46764:
	nop
	nop
	nop
	j	bnei_cont.46762

bnei_else.46761:
bnei_cont.46762:
bnei_cont.46680:
	nop
	nop
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	add	%at, %v1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a1, 0(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.46775

	nop
	nop
	nop
	sw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.46776

	nop
	nop
	lw	%a2, 12(%a1)
	lw	%t0, 0(%sp)

	nop
	nop
	lw	%a3, 10(%a2)
	lw	%t1, 1(%t0)

	nop
	flw	%f0, 0(%a3)
	flw	%f1, 1(%a3)
	add	%at, %t1, %a1

	nop
	nop
	flw	%f2, 2(%a3)
	lw	%a1, 0(%at)

	nop
	nop
	nop
	lw	%t1, 1(%a2)

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.46778

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.46780

	nop
	nop
	flw	%f3, 0(%a1)
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.46782

	nop
	nop
	nop
	addi	%t1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46783

fbeq_else.46782:
	nop
	nop
	nop
	addi	%t1, %zero, 0

fbeq_cont.46783:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46784

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46779

bnei_else.46784:
	nop
	nop
	nop
	flw	%f5, 1(%a1)

	nop
	nop
	fmul	%f0, %f5, %f0
	flw	%f5, 2(%a1)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%a3)

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1

	nop
	nop
	nop
	fsub	%f1, %f2, %f1

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.46786

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46787

fbgt_else.46786:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.46787:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.46788

	nop
	nop
	nop
	lw	%a2, 6(%a2)

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.46790

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 4(%a1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.46791

bnei_else.46790:
	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 4(%a1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

bnei_cont.46791:
	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46789

bnei_else.46788:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46789:
bnei_cont.46785:
	nop
	nop
	nop
	j	bnei_cont.46779

bnei_else.46780:
	nop
	nop
	flw	%f0, 0(%a1)
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46792

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46793

fbgt_else.46792:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.46793:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46794

	nop
	nop
	nop
	flw	%f1, 3(%a3)

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 135(%zero)

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46795

bnei_else.46794:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46795:
bnei_cont.46781:
	nop
	nop
	nop
	j	bnei_cont.46779

bnei_else.46778:
	nop
	nop
	lw	%a3, 0(%t0)
	flw	%f3, 0(%a1)

	nop
	fsub	%f3, %f3, %f0
	flw	%f4, 1(%a1)
	flw	%f5, 1(%a3)

	nop
	nop
	fmul	%f3, %f3, %f4
	lw	%t1, 4(%a2)

	nop
	nop
	fmul	%f6, %f3, %f5
	flw	%f7, 1(%t1)

	nop
	nop
	nop
	fadd	%f6, %f6, %f1

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.46796

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46797

fbgt_else.46796:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46797:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46798

	nop
	nop
	flw	%f6, 2(%a3)
	lw	%t1, 4(%a2)

	nop
	nop
	fmul	%f6, %f3, %f6
	flw	%f8, 2(%t1)

	nop
	nop
	nop
	fadd	%f6, %f6, %f2

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.46800

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46801

fbgt_else.46800:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46801:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46802

	nop
	nop
	nop
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.46804

	nop
	nop
	nop
	addi	%t1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46805

fbeq_else.46804:
	nop
	nop
	nop
	addi	%t1, %zero, 0

fbeq_cont.46805:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46806

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46799

bnei_else.46806:
	nop
	nop
	nop
	addi	%t1, %zero, 1

bnei_cont.46807:
	nop
	nop
	nop
	j	bnei_cont.46799

bnei_else.46802:
	nop
	nop
	nop
	addi	%t1, %zero, 0

bnei_cont.46803:
	nop
	nop
	nop
	j	bnei_cont.46799

bnei_else.46798:
	nop
	nop
	nop
	addi	%t1, %zero, 0

bnei_cont.46799:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46808

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.46809

bnei_else.46808:
	nop
	nop
	flw	%f3, 2(%a1)
	flw	%f4, 3(%a1)

	nop
	fsub	%f3, %f3, %f1
	flw	%f6, 0(%a3)
	lw	%t1, 4(%a2)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f9, 0(%t1)

	nop
	nop
	nop
	fmul	%f8, %f3, %f6

	nop
	nop
	nop
	fadd	%f8, %f8, %f0

	nop
	nop
	nop
	fabs	%f8, %f8

	nop
	nop
	nop
	fblt	%f8, %f9, fbgt_else.46810

	nop
	nop
	nop
	addi	%t1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46811

fbgt_else.46810:
	nop
	nop
	nop
	addi	%t1, %zero, 1

fbgt_cont.46811:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.46812

	nop
	nop
	flw	%f8, 2(%a3)
	lw	%a2, 4(%a2)

	nop
	nop
	fmul	%f8, %f3, %f8
	flw	%f10, 2(%a2)

	nop
	nop
	nop
	fadd	%f8, %f8, %f2

	nop
	nop
	nop
	fabs	%f8, %f8

	nop
	nop
	nop
	fblt	%f8, %f10, fbgt_else.46814

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46815

fbgt_else.46814:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.46815:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.46816

	nop
	nop
	nop
	flw	%f8, 493(%zero)

	nop
	nop
	nop
	fbne	%f4, %f8, fbeq_else.46818

	nop
	nop
	nop
	addi	%a2, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46819

fbeq_else.46818:
	nop
	nop
	nop
	addi	%a2, %zero, 0

fbeq_cont.46819:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.46820

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46813

bnei_else.46820:
	nop
	nop
	nop
	addi	%a2, %zero, 1

bnei_cont.46821:
	nop
	nop
	nop
	j	bnei_cont.46813

bnei_else.46816:
	nop
	nop
	nop
	addi	%a2, %zero, 0

bnei_cont.46817:
	nop
	nop
	nop
	j	bnei_cont.46813

bnei_else.46812:
	nop
	nop
	nop
	addi	%a2, %zero, 0

bnei_cont.46813:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.46822

	nop
	nop
	nop
	fsw	%f3, 135(%zero)

	nop
	nop
	nop
	addi	%a1, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.46823

bnei_else.46822:
	nop
	nop
	nop
	flw	%f3, 4(%a1)

	nop
	nop
	fsub	%f2, %f3, %f2
	flw	%f3, 5(%a1)

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	nop
	fmul	%f4, %f2, %f6

	nop
	nop
	nop
	fadd	%f0, %f4, %f0

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f9, fbgt_else.46824

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46825

fbgt_else.46824:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.46825:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46826

	nop
	nop
	nop
	fmul	%f0, %f2, %f5

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f7, fbgt_else.46828

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46829

fbgt_else.46828:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.46829:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46830

	nop
	nop
	nop
	flw	%f0, 493(%zero)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.46832

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.46833

fbeq_else.46832:
	nop
	nop
	nop
	addi	%a1, %zero, 0

fbeq_cont.46833:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46834

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46827

bnei_else.46834:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.46835:
	nop
	nop
	nop
	j	bnei_cont.46827

bnei_else.46830:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46831:
	nop
	nop
	nop
	j	bnei_cont.46827

bnei_else.46826:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46827:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46836

	nop
	nop
	nop
	fsw	%f2, 135(%zero)

	nop
	nop
	nop
	addi	%a1, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.46837

bnei_else.46836:
	nop
	nop
	nop
	addi	%a1, %zero, 0

bnei_cont.46837:
bnei_cont.46823:
bnei_cont.46809:
bnei_cont.46779:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46838

	nop
	nop
	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46840

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46841

fbgt_else.46840:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.46841:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.46842

	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.46844

	nop
	nop
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)

	nop
	sw	%a0, 6(%sp)
	addi	%a0, %t0, 0
	addi	%v1, %a1, 0

	nop
	nop
	addi	%v0, %a2, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46846

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46848

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46850

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46852

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46854

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 7

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.46777

bnei_else.46854:
bnei_cont.46855:
	nop
	nop
	nop
	j	bnei_cont.46777

bnei_else.46852:
bnei_cont.46853:
	nop
	nop
	nop
	j	bnei_cont.46777

bnei_else.46850:
bnei_cont.46851:
	nop
	nop
	nop
	j	bnei_cont.46777

bnei_else.46848:
bnei_cont.46849:
	nop
	nop
	nop
	j	bnei_cont.46777

bnei_else.46846:
bnei_cont.46847:
	nop
	nop
	nop
	j	bnei_cont.46777

bnei_else.46844:
bnei_cont.46845:
	nop
	nop
	nop
	j	bnei_cont.46777

bnei_else.46842:
bnei_cont.46843:
	nop
	nop
	nop
	j	bnei_cont.46777

bnei_else.46838:
bnei_cont.46839:
	nop
	nop
	nop
	j	bnei_cont.46777

bnei_else.46776:
	nop
	nop
	nop
	lw	%a1, 1(%a0)

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.46856

	nop
	nop
	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)

	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%a0, %a3, 0
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46858

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46860

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46862

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46864

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.46866

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)

	nop
	lw	%a1, 0(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 7

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)

	nop
	nop
	lw	%a0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.46857

bnei_else.46866:
bnei_cont.46867:
	nop
	nop
	nop
	j	bnei_cont.46857

bnei_else.46864:
bnei_cont.46865:
	nop
	nop
	nop
	j	bnei_cont.46857

bnei_else.46862:
bnei_cont.46863:
	nop
	nop
	nop
	j	bnei_cont.46857

bnei_else.46860:
bnei_cont.46861:
	nop
	nop
	nop
	j	bnei_cont.46857

bnei_else.46858:
bnei_cont.46859:
	nop
	nop
	nop
	j	bnei_cont.46857

bnei_else.46856:
bnei_cont.46857:
bnei_cont.46777:
	nop
	nop
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	trace_or_matrix_fast.2944

bnei_else.46775:
	nop
	nop
	nop
	jr	%ra

bnei_else.46678:
	nop
	nop
	nop
	jr	%ra

trace_reflections.2966:
	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.46880

	nop
	nop
	lw	%a1, 254(%v0)
	flw	%f2, 465(%zero)

	nop
	nop
	lw	%a2, 1(%a1)
	fsw	%f2, 137(%zero)

	nop
	lw	%a3, 134(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	fsw	%f1, 1(%sp)

	nop
	nop
	sw	%v1, 2(%sp)
	addi	%v1, %a3, 0

	nop
	nop
	nop
	fsw	%f0, 3(%sp)

	nop
	nop
	nop
	sw	%a2, 4(%sp)

	nop
	nop
	nop
	sw	%a3, 5(%sp)

	nop
	nop
	sw	%a0, 6(%sp)
	addi	%a0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	addi	%sp, %sp, -9
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.46881

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46882

fbgt_else.46881:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.46882:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.46883

	nop
	nop
	nop
	flw	%f1, 464(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.46885

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.46884

fbgt_else.46885:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.46886:
	nop
	nop
	nop
	j	bnei_cont.46884

bnei_else.46883:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.46884:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.46887

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 136(%zero)

	nop
	nop
	nop
	sll	%v0, %v0, 2

	nop
	nop
	add	%v0, %v0, %v1
	lw	%v1, 7(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%v1)

	nop
	nop
	nop
	bne	%v0, %a0, beq_else.46889

	nop
	nop
	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.46891

	nop
	nop
	nop
	j	bnei_cont.46888

bnei_else.46891:
	nop
	nop
	lw	%v0, 4(%sp)
	flw	%f0, 142(%zero)

	nop
	nop
	lw	%v1, 0(%v0)
	lw	%v0, 0(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	flw	%f2, 1(%v1)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f4, 0(%v0)

	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%v1)
	lw	%v1, 7(%sp)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)
	flw	%f5, 1(%v0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 3(%sp)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	fmul	%f3, %f1, %f2

	nop
	nop
	fmul	%f0, %f3, %f0
	flw	%f3, 0(%v1)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f4, 1(%v1)

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%v0)

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 2(%v1)

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	fmul	%f1, %f1, %f3
	flw	%f3, 493(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.46893

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46894

fbgt_else.46893:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.46894:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.46895

	nop
	nop
	flw	%f4, 151(%zero)
	flw	%f5, 145(%zero)

	nop
	nop
	nop
	fmul	%f5, %f0, %f5

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	fsw	%f4, 151(%zero)

	nop
	nop
	flw	%f4, 152(%zero)
	flw	%f5, 146(%zero)

	nop
	nop
	nop
	fmul	%f5, %f0, %f5

	nop
	nop
	nop
	fadd	%f4, %f4, %f5

	nop
	nop
	nop
	fsw	%f4, 152(%zero)

	nop
	nop
	flw	%f4, 153(%zero)
	flw	%f5, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fadd	%f0, %f4, %f0

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.46896

bnei_else.46895:
bnei_cont.46896:
	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.46897

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.46898

fbgt_else.46897:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.46898:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.46899

	nop
	fmul	%f0, %f1, %f1
	flw	%f1, 1(%sp)
	flw	%f3, 151(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f3, %f3, %f0

	nop
	nop
	nop
	fsw	%f3, 151(%zero)

	nop
	nop
	nop
	flw	%f3, 152(%zero)

	nop
	nop
	nop
	fadd	%f3, %f3, %f0

	nop
	nop
	nop
	fsw	%f3, 152(%zero)

	nop
	nop
	nop
	flw	%f3, 153(%zero)

	nop
	nop
	nop
	fadd	%f0, %f3, %f0

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.46900

bnei_else.46899:
bnei_cont.46900:
bnei_cont.46892:
	nop
	nop
	nop
	j	bnei_cont.46888

beq_else.46889:
beq_cont.46890:
	nop
	nop
	nop
	j	bnei_cont.46888

bnei_else.46887:
bnei_cont.46888:
	nop
	nop
	lw	%v0, 0(%sp)
	flw	%f0, 3(%sp)

	nop
	addi	%v0, %v0, -1
	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	j	trace_reflections.2966

bgti_else.46880:
	nop
	nop
	nop
	jr	%ra

trace_ray.2971:
	nop
	nop
	nop
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.47306

	nop
	lw	%a1, 2(%a0)
	addi	%a2, %zero, 0
	flw	%f2, 465(%zero)

	nop
	nop
	fsw	%f2, 137(%zero)
	fsw	%f1, 0(%sp)

	nop
	nop
	nop
	lw	%a3, 134(%zero)

	nop
	nop
	nop
	sw	%a3, 1(%sp)

	nop
	nop
	nop
	sw	%a2, 2(%sp)

	nop
	nop
	sw	%a0, 3(%sp)
	addi	%a0, %v1, 0

	nop
	nop
	nop
	fsw	%f0, 4(%sp)

	nop
	nop
	sw	%v1, 5(%sp)
	addi	%v1, %a3, 0

	nop
	nop
	sw	%v0, 6(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	nop
	sw	%a1, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	trace_or_matrix.2930

	nop
	addi	%sp, %sp, -9
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47307

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47308

fbgt_else.47307:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.47308:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47309

	nop
	nop
	nop
	flw	%f1, 464(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47311

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.47310

fbgt_else.47311:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.47312:
	nop
	nop
	nop
	j	bnei_cont.47310

bnei_else.47309:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.47310:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47313

	nop
	lw	%v0, 141(%zero)
	flw	%f2, 4(%sp)
	addi	%a2, %zero, 1

	nop
	nop
	nop
	lw	%v1, 12(%v0)

	nop
	nop
	lw	%a0, 2(%v1)
	lw	%a1, 7(%v1)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 1(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.47314

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.47316

	nop
	nop
	flw	%f3, 138(%zero)
	lw	%a1, 5(%v1)

	nop
	nop
	flw	%f4, 0(%a1)
	lw	%a1, 5(%v1)

	nop
	fsub	%f3, %f3, %f4
	flw	%f4, 139(%zero)
	flw	%f5, 1(%a1)

	nop
	fsub	%f4, %f4, %f5
	flw	%f5, 140(%zero)
	lw	%a1, 5(%v1)

	nop
	nop
	flw	%f6, 2(%a1)
	lw	%a1, 4(%v1)

	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 0(%a1)
	lw	%a1, 4(%v1)

	nop
	fmul	%f6, %f3, %f6
	flw	%f7, 1(%a1)
	lw	%a1, 4(%v1)

	nop
	fmul	%f7, %f4, %f7
	flw	%f8, 2(%a1)
	lw	%a1, 3(%v1)

	nop
	nop
	nop
	fmul	%f8, %f5, %f8

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47318

	nop
	nop
	nop
	lw	%a1, 9(%v1)

	nop
	nop
	flw	%f9, 2(%a1)
	lw	%a1, 9(%v1)

	nop
	fmul	%f9, %f4, %f9
	flw	%f10, 1(%a1)
	lw	%a1, 9(%v1)

	nop
	nop
	nop
	fmul	%f10, %f5, %f10

	nop
	nop
	fadd	%f9, %f9, %f10
	flw	%f10, 471(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f10

	nop
	nop
	nop
	fadd	%f6, %f6, %f9

	nop
	nop
	fsw	%f6, 142(%zero)
	flw	%f6, 2(%a1)

	nop
	nop
	fmul	%f6, %f3, %f6
	lw	%a1, 9(%v1)

	nop
	nop
	flw	%f9, 0(%a1)
	lw	%a1, 9(%v1)

	nop
	nop
	nop
	fmul	%f5, %f5, %f9

	nop
	nop
	nop
	fadd	%f5, %f6, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f10

	nop
	nop
	nop
	fadd	%f5, %f7, %f5

	nop
	nop
	fsw	%f5, 143(%zero)
	flw	%f5, 1(%a1)

	nop
	nop
	fmul	%f3, %f3, %f5
	lw	%a1, 9(%v1)

	nop
	nop
	nop
	flw	%f5, 0(%a1)

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	fmul	%f3, %f3, %f10

	nop
	nop
	nop
	fadd	%f3, %f8, %f3

	nop
	nop
	nop
	fsw	%f3, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.47319

bnei_else.47318:
	nop
	nop
	nop
	fsw	%f6, 142(%zero)

	nop
	nop
	nop
	fsw	%f7, 143(%zero)

	nop
	nop
	nop
	fsw	%f8, 144(%zero)

bnei_cont.47319:
	nop
	nop
	lw	%a1, 6(%v1)
	flw	%f3, 142(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	flw	%f5, 143(%zero)

	nop
	nop
	nop
	fmul	%f6, %f5, %f5

	nop
	nop
	fadd	%f4, %f4, %f6
	flw	%f6, 144(%zero)

	nop
	nop
	nop
	fmul	%f7, %f6, %f6

	nop
	nop
	fadd	%f4, %f4, %f7
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fsqrt	%f4, %f4

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.47320

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.47321

fbeq_else.47320:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.47321:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.47322

	nop
	nop
	nop
	flw	%f4, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.47323

bnei_else.47322:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47324

	nop
	nop
	nop
	flw	%f7, 490(%zero)

	nop
	nop
	nop
	fdiv	%f4, %f7, %f4

	nop
	nop
	nop
	j	bnei_cont.47325

bnei_else.47324:
	nop
	nop
	nop
	flw	%f7, 491(%zero)

	nop
	nop
	nop
	fdiv	%f4, %f7, %f4

bnei_cont.47325:
bnei_cont.47323:
	nop
	nop
	nop
	fmul	%f3, %f3, %f4

	nop
	nop
	fsw	%f3, 142(%zero)
	fmul	%f3, %f5, %f4

	nop
	nop
	fsw	%f3, 143(%zero)
	fmul	%f3, %f6, %f4

	nop
	nop
	nop
	fsw	%f3, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.47315

bnei_else.47316:
	nop
	nop
	nop
	lw	%a1, 4(%v1)

	nop
	nop
	flw	%f3, 0(%a1)
	lw	%a1, 4(%v1)

	nop
	nop
	nop
	fneg	%f3, %f3

	nop
	nop
	fsw	%f3, 142(%zero)
	flw	%f3, 1(%a1)

	nop
	nop
	fneg	%f3, %f3
	lw	%a1, 4(%v1)

	nop
	nop
	fsw	%f3, 143(%zero)
	flw	%f3, 2(%a1)

	nop
	nop
	nop
	fneg	%f3, %f3

	nop
	nop
	nop
	fsw	%f3, 144(%zero)

bnei_cont.47317:
	nop
	nop
	nop
	j	bnei_cont.47315

bnei_else.47314:
	nop
	nop
	lw	%a1, 136(%zero)
	flw	%f3, 493(%zero)

	nop
	fsw	%f3, 142(%zero)
	addi	%a1, %a1, -1
	lw	%a3, 5(%sp)

	nop
	nop
	fsw	%f3, 143(%zero)
	add	%at, %a3, %a1

	nop
	nop
	fsw	%f3, 144(%zero)
	flw	%f4, 0(%at)

	nop
	nop
	nop
	fbne	%f4, %f3, fbeq_else.47326

	nop
	nop
	nop
	addi	%t0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.47327

fbeq_else.47326:
	nop
	nop
	nop
	addi	%t0, %zero, 0

fbeq_cont.47327:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.47328

	nop
	nop
	nop
	j	bnei_cont.47329

bnei_else.47328:
	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.47330

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47331

fbgt_else.47330:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.47331:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.47332

	nop
	nop
	nop
	flw	%f3, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.47333

bnei_else.47332:
	nop
	nop
	nop
	flw	%f3, 490(%zero)

bnei_cont.47333:
bnei_cont.47329:
	nop
	nop
	nop
	fneg	%f3, %f3

	nop
	nop
	nop
	fsw	%f3, 142(%a1)

bnei_cont.47315:
	nop
	nop
	flw	%f3, 138(%zero)
	lw	%a1, 0(%v1)

	nop
	nop
	fsw	%f3, 159(%zero)
	lw	%a3, 8(%v1)

	nop
	nop
	flw	%f4, 139(%zero)
	flw	%f6, 0(%a3)

	nop
	nop
	fsw	%f4, 160(%zero)
	lw	%a3, 8(%v1)

	nop
	nop
	flw	%f5, 140(%zero)
	fsw	%f0, 8(%sp)

	nop
	nop
	fsw	%f5, 161(%zero)
	sw	%a0, 9(%sp)

	nop
	nop
	fsw	%f6, 145(%zero)
	flw	%f6, 1(%a3)

	nop
	nop
	fsw	%f6, 146(%zero)
	lw	%a3, 8(%v1)

	nop
	nop
	flw	%f6, 2(%a3)
	fsw	%f1, 10(%sp)

	nop
	nop
	fsw	%f6, 147(%zero)
	sw	%a2, 11(%sp)

	nop
	nop
	nop
	sw	%v1, 12(%sp)

	nop
	nop
	nop
	fsw	%f5, 13(%sp)

	nop
	nop
	nop
	fsw	%f4, 14(%sp)

	nop
	nop
	nop
	fsw	%f3, 15(%sp)

	nop
	nop
	nop
	sw	%v0, 16(%sp)

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.47334

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.47336

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.47338

	nop
	nop
	nop
	beqi	%a1, 4, bnei_else.47340

	nop
	nop
	nop
	j	bnei_cont.47335

bnei_else.47340:
	nop
	nop
	lw	%a1, 5(%v1)
	flw	%f10, 463(%zero)

	nop
	nop
	flw	%f6, 0(%a1)
	lw	%a1, 4(%v1)

	nop
	fsub	%f6, %f3, %f6
	flw	%f7, 0(%a1)
	lw	%a1, 5(%v1)

	nop
	nop
	nop
	fsqrt	%f7, %f7

	nop
	fmul	%f6, %f6, %f7
	flw	%f7, 2(%a1)
	lw	%a1, 4(%v1)

	nop
	nop
	fsub	%f7, %f5, %f7
	flw	%f8, 2(%a1)

	nop
	nop
	nop
	fsqrt	%f8, %f8

	nop
	nop
	fmul	%f7, %f7, %f8
	fmul	%f8, %f6, %f6

	nop
	nop
	nop
	fmul	%f9, %f7, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	fabs	%f9, %f6

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.47342

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47343

fbgt_else.47342:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.47343:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47344

	nop
	nop
	nop
	flw	%f6, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.47345

bnei_else.47344:
	nop
	nop
	fdiv	%f6, %f7, %f6
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fabs	%f6, %f6

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.47346

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.47347

fbgt_else.47346:
	nop
	nop
	nop
	addi	%a1, %zero, 0

fbgt_cont.47347:
	nop
	nop
	fabs	%f7, %f6
	flw	%f9, 461(%zero)

	nop
	nop
	nop
	fblt	%f7, %f9, fbgt_else.47348

	nop
	nop
	nop
	flw	%f6, 454(%zero)

	nop
	nop
	nop
	fblt	%f7, %f6, fbgt_else.47350

	nop
	nop
	flw	%f6, 476(%zero)
	flw	%f9, 491(%zero)

	nop
	fdiv	%f7, %f9, %f7
	flw	%f13, 460(%zero)
	flw	%f14, 459(%zero)

	nop
	nop
	fmul	%f9, %f7, %f7
	fmul	%f13, %f13, %f7

	nop
	nop
	fmul	%f11, %f9, %f9
	fmul	%f13, %f13, %f9

	nop
	nop
	fmul	%f12, %f11, %f11
	fsub	%f13, %f7, %f13

	nop
	nop
	nop
	fmul	%f14, %f14, %f7

	nop
	nop
	nop
	fmul	%f14, %f14, %f11

	nop
	nop
	fadd	%f13, %f13, %f14
	flw	%f14, 458(%zero)

	nop
	nop
	nop
	fmul	%f14, %f14, %f7

	nop
	nop
	nop
	fmul	%f14, %f14, %f9

	nop
	nop
	nop
	fmul	%f14, %f14, %f11

	nop
	nop
	fsub	%f13, %f13, %f14
	flw	%f14, 457(%zero)

	nop
	nop
	nop
	fmul	%f14, %f14, %f7

	nop
	nop
	nop
	fmul	%f14, %f14, %f12

	nop
	nop
	fadd	%f13, %f13, %f14
	flw	%f14, 456(%zero)

	nop
	nop
	nop
	fmul	%f14, %f14, %f7

	nop
	nop
	nop
	fmul	%f9, %f14, %f9

	nop
	nop
	nop
	fmul	%f9, %f9, %f12

	nop
	nop
	fsub	%f9, %f13, %f9
	flw	%f13, 455(%zero)

	nop
	nop
	nop
	fmul	%f7, %f13, %f7

	nop
	nop
	nop
	fmul	%f7, %f7, %f11

	nop
	nop
	nop
	fmul	%f7, %f7, %f12

	nop
	nop
	nop
	fadd	%f7, %f9, %f7

	nop
	nop
	nop
	fsub	%f6, %f6, %f7

	nop
	nop
	nop
	j	fbgt_cont.47351

fbgt_else.47350:
	nop
	nop
	flw	%f6, 475(%zero)
	flw	%f9, 491(%zero)

	fsub	%f11, %f7, %f9
	fadd	%f7, %f7, %f9
	flw	%f13, 460(%zero)
	flw	%f14, 459(%zero)

	nop
	nop
	nop
	fdiv	%f7, %f11, %f7

	nop
	nop
	fmul	%f9, %f7, %f7
	fmul	%f13, %f13, %f7

	nop
	nop
	fmul	%f11, %f9, %f9
	fmul	%f13, %f13, %f9

	nop
	nop
	fmul	%f12, %f11, %f11
	fsub	%f13, %f7, %f13

	nop
	nop
	nop
	fmul	%f14, %f14, %f7

	nop
	nop
	nop
	fmul	%f14, %f14, %f11

	nop
	nop
	fadd	%f13, %f13, %f14
	flw	%f14, 458(%zero)

	nop
	nop
	nop
	fmul	%f14, %f14, %f7

	nop
	nop
	nop
	fmul	%f14, %f14, %f9

	nop
	nop
	nop
	fmul	%f14, %f14, %f11

	nop
	nop
	fsub	%f13, %f13, %f14
	flw	%f14, 457(%zero)

	nop
	nop
	nop
	fmul	%f14, %f14, %f7

	nop
	nop
	nop
	fmul	%f14, %f14, %f12

	nop
	nop
	fadd	%f13, %f13, %f14
	flw	%f14, 456(%zero)

	nop
	nop
	nop
	fmul	%f14, %f14, %f7

	nop
	nop
	nop
	fmul	%f9, %f14, %f9

	nop
	nop
	nop
	fmul	%f9, %f9, %f12

	nop
	nop
	fsub	%f9, %f13, %f9
	flw	%f13, 455(%zero)

	nop
	nop
	nop
	fmul	%f7, %f13, %f7

	nop
	nop
	nop
	fmul	%f7, %f7, %f11

	nop
	nop
	nop
	fmul	%f7, %f7, %f12

	nop
	nop
	nop
	fadd	%f7, %f9, %f7

	nop
	nop
	nop
	fadd	%f6, %f6, %f7

fbgt_cont.47351:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47352

	nop
	nop
	nop
	j	fbgt_cont.47349

bnei_else.47352:
	nop
	nop
	nop
	fneg	%f6, %f6

bnei_cont.47353:
	nop
	nop
	nop
	j	fbgt_cont.47349

fbgt_else.47348:
	nop
	fmul	%f7, %f6, %f6
	flw	%f12, 460(%zero)
	flw	%f13, 459(%zero)

	nop
	nop
	fmul	%f9, %f7, %f7
	fmul	%f12, %f12, %f6

	nop
	nop
	fmul	%f11, %f9, %f9
	fmul	%f12, %f12, %f7

	nop
	nop
	fsub	%f12, %f6, %f12
	fmul	%f13, %f13, %f6

	nop
	nop
	nop
	fmul	%f13, %f13, %f9

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f6

	nop
	nop
	nop
	fmul	%f13, %f13, %f7

	nop
	nop
	nop
	fmul	%f13, %f13, %f9

	nop
	nop
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f6

	nop
	nop
	nop
	fmul	%f13, %f13, %f11

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f6

	nop
	nop
	nop
	fmul	%f7, %f13, %f7

	nop
	nop
	nop
	fmul	%f7, %f7, %f11

	nop
	nop
	fsub	%f7, %f12, %f7
	flw	%f12, 455(%zero)

	nop
	nop
	nop
	fmul	%f6, %f12, %f6

	nop
	nop
	nop
	fmul	%f6, %f6, %f9

	nop
	nop
	nop
	fmul	%f6, %f6, %f11

	nop
	nop
	nop
	fadd	%f6, %f7, %f6

fbgt_cont.47349:
	nop
	nop
	nop
	flw	%f7, 453(%zero)

	nop
	nop
	fmul	%f6, %f6, %f7
	flw	%f7, 452(%zero)

	nop
	nop
	nop
	fdiv	%f6, %f6, %f7

bnei_cont.47345:
	nop
	nop
	floor	%f7, %f6
	lw	%a1, 5(%v1)

	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 1(%a1)
	lw	%a1, 4(%v1)

	nop
	nop
	fsub	%f7, %f4, %f7
	flw	%f9, 1(%a1)

	nop
	nop
	nop
	fsqrt	%f9, %f9

	nop
	nop
	fmul	%f7, %f7, %f9
	fabs	%f9, %f8

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.47354

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47355

fbgt_else.47354:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.47355:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47356

	nop
	nop
	nop
	flw	%f7, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.47357

bnei_else.47356:
	nop
	nop
	fdiv	%f7, %f7, %f8
	flw	%f8, 493(%zero)

	nop
	nop
	nop
	fabs	%f7, %f7

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.47358

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.47359

fbgt_else.47358:
	nop
	nop
	nop
	addi	%a1, %zero, 0

fbgt_cont.47359:
	nop
	nop
	fabs	%f8, %f7
	flw	%f9, 461(%zero)

	nop
	nop
	nop
	fblt	%f8, %f9, fbgt_else.47360

	nop
	nop
	nop
	flw	%f7, 454(%zero)

	nop
	nop
	nop
	fblt	%f8, %f7, fbgt_else.47362

	nop
	nop
	flw	%f7, 476(%zero)
	flw	%f9, 491(%zero)

	nop
	fdiv	%f8, %f9, %f8
	flw	%f12, 460(%zero)
	flw	%f13, 459(%zero)

	nop
	nop
	fmul	%f9, %f8, %f8
	fmul	%f12, %f12, %f8

	nop
	nop
	fmul	%f10, %f9, %f9
	fmul	%f12, %f12, %f9

	nop
	nop
	fmul	%f11, %f10, %f10
	fsub	%f12, %f8, %f12

	nop
	nop
	nop
	fmul	%f13, %f13, %f8

	nop
	nop
	nop
	fmul	%f13, %f13, %f10

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f8

	nop
	nop
	nop
	fmul	%f13, %f13, %f9

	nop
	nop
	nop
	fmul	%f13, %f13, %f10

	nop
	nop
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f8

	nop
	nop
	nop
	fmul	%f13, %f13, %f11

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f8

	nop
	nop
	nop
	fmul	%f9, %f13, %f9

	nop
	nop
	nop
	fmul	%f9, %f9, %f11

	nop
	nop
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)

	nop
	nop
	nop
	fmul	%f8, %f12, %f8

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	nop
	fmul	%f8, %f8, %f11

	nop
	nop
	nop
	fadd	%f8, %f9, %f8

	nop
	nop
	nop
	fsub	%f7, %f7, %f8

	nop
	nop
	nop
	j	fbgt_cont.47363

fbgt_else.47362:
	nop
	nop
	flw	%f7, 475(%zero)
	flw	%f9, 491(%zero)

	fsub	%f10, %f8, %f9
	fadd	%f8, %f8, %f9
	flw	%f12, 460(%zero)
	flw	%f13, 459(%zero)

	nop
	nop
	nop
	fdiv	%f8, %f10, %f8

	nop
	nop
	fmul	%f9, %f8, %f8
	fmul	%f12, %f12, %f8

	nop
	nop
	fmul	%f10, %f9, %f9
	fmul	%f12, %f12, %f9

	nop
	nop
	fmul	%f11, %f10, %f10
	fsub	%f12, %f8, %f12

	nop
	nop
	nop
	fmul	%f13, %f13, %f8

	nop
	nop
	nop
	fmul	%f13, %f13, %f10

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f8

	nop
	nop
	nop
	fmul	%f13, %f13, %f9

	nop
	nop
	nop
	fmul	%f13, %f13, %f10

	nop
	nop
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f8

	nop
	nop
	nop
	fmul	%f13, %f13, %f11

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f8

	nop
	nop
	nop
	fmul	%f9, %f13, %f9

	nop
	nop
	nop
	fmul	%f9, %f9, %f11

	nop
	nop
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)

	nop
	nop
	nop
	fmul	%f8, %f12, %f8

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	nop
	fmul	%f8, %f8, %f11

	nop
	nop
	nop
	fadd	%f8, %f9, %f8

	nop
	nop
	nop
	fadd	%f7, %f7, %f8

fbgt_cont.47363:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47364

	nop
	nop
	nop
	j	fbgt_cont.47361

bnei_else.47364:
	nop
	nop
	nop
	fneg	%f7, %f7

bnei_cont.47365:
	nop
	nop
	nop
	j	fbgt_cont.47361

fbgt_else.47360:
	nop
	fmul	%f8, %f7, %f7
	flw	%f11, 460(%zero)
	flw	%f12, 459(%zero)

	nop
	nop
	fmul	%f9, %f8, %f8
	fmul	%f11, %f11, %f7

	nop
	nop
	fmul	%f10, %f9, %f9
	fmul	%f11, %f11, %f8

	nop
	nop
	fsub	%f11, %f7, %f11
	fmul	%f12, %f12, %f7

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f7

	nop
	nop
	nop
	fmul	%f12, %f12, %f8

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f7

	nop
	nop
	nop
	fmul	%f12, %f12, %f10

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f7

	nop
	nop
	nop
	fmul	%f8, %f12, %f8

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	fsub	%f8, %f11, %f8
	flw	%f11, 455(%zero)

	nop
	nop
	nop
	fmul	%f7, %f11, %f7

	nop
	nop
	nop
	fmul	%f7, %f7, %f9

	nop
	nop
	nop
	fmul	%f7, %f7, %f10

	nop
	nop
	nop
	fadd	%f7, %f8, %f7

fbgt_cont.47361:
	nop
	nop
	nop
	flw	%f8, 453(%zero)

	nop
	nop
	fmul	%f7, %f7, %f8
	flw	%f8, 452(%zero)

	nop
	nop
	nop
	fdiv	%f7, %f7, %f8

bnei_cont.47357:
	nop
	nop
	floor	%f8, %f7
	flw	%f9, 471(%zero)

	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 451(%zero)
	fsub	%f6, %f9, %f6

	nop
	nop
	fmul	%f6, %f6, %f6
	fsub	%f7, %f9, %f7

	nop
	nop
	fsub	%f6, %f8, %f6
	fmul	%f7, %f7, %f7

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.47366

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47367

fbgt_else.47366:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.47367:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47368

	nop
	nop
	nop
	fmov	%f6, %f7

	nop
	nop
	nop
	j	bnei_cont.47369

bnei_else.47368:
bnei_cont.47369:
	nop
	nop
	nop
	flw	%f7, 450(%zero)

	nop
	nop
	fmul	%f6, %f7, %f6
	flw	%f7, 449(%zero)

	nop
	nop
	nop
	fdiv	%f6, %f6, %f7

	nop
	nop
	nop
	fsw	%f6, 147(%zero)

bnei_cont.47341:
	nop
	nop
	nop
	j	bnei_cont.47335

bnei_else.47338:
	nop
	nop
	lw	%a1, 5(%v1)
	flw	%f8, 488(%zero)

	nop
	nop
	flw	%f6, 0(%a1)
	lw	%a1, 5(%v1)

	nop
	nop
	fsub	%f6, %f3, %f6
	flw	%f7, 2(%a1)

	nop
	nop
	fsub	%f7, %f5, %f7
	fmul	%f6, %f6, %f6

	nop
	nop
	nop
	fmul	%f7, %f7, %f7

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 448(%zero)

	nop
	nop
	nop
	fsqrt	%f6, %f6

	nop
	nop
	nop
	fdiv	%f6, %f6, %f7

	nop
	nop
	nop
	floor	%f7, %f6

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 452(%zero)

	nop
	nop
	fmul	%f6, %f6, %f7
	flw	%f7, 489(%zero)

	nop
	nop
	fabs	%f6, %f6
	fsw	%f7, 17(%sp)

	nop
	nop
	nop
	fsw	%f8, 18(%sp)

	nop
	nop
	nop
	fsw	%f6, 19(%sp)

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47370

	nop
	nop
	nop
	flw	%f9, 487(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47372

	nop
	nop
	nop
	flw	%f9, 486(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47374

	nop
	nop
	nop
	flw	%f9, 485(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47376

	nop
	nop
	nop
	flw	%f9, 484(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47378

	nop
	nop
	nop
	flw	%f9, 483(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47380

	nop
	nop
	nop
	flw	%f9, 482(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47382

	nop
	nop
	nop
	flw	%f9, 481(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47384

	nop
	nop
	nop
	flw	%f9, 480(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47386

	nop
	nop
	nop
	flw	%f9, 479(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47388

	nop
	nop
	nop
	flw	%f9, 478(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47390

	nop
	nop
	nop
	flw	%f9, 477(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47392

	nop
	flw	%f9, 447(%zero)
	fmov	%f0, %f6
	sw	%ra, 20(%sp)

	nop
	nop
	fmov	%f1, %f9
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -21
	fmov	%f1, %f0

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47392:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47393:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47390:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47391:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47388:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47389:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47386:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47387:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47384:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47385:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47382:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47383:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47380:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47381:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47378:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47379:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47376:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47377:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47374:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47375:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47372:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47373:
	nop
	nop
	nop
	j	fbgt_cont.47371

fbgt_else.47370:
	nop
	nop
	nop
	fmov	%f1, %f8

fbgt_cont.47371:
	nop
	nop
	flw	%f0, 19(%sp)
	flw	%f2, 18(%sp)

	nop
	nop
	nop
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	lw	%ra, 20(%sp)
	flw	%f1, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47394

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47395

fbgt_else.47394:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.47395:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47396

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.47397

fbgt_else.47396:
fbgt_cont.47397:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47398

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47400

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47399

bnei_else.47400:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.47401:
	nop
	nop
	nop
	j	fbgt_cont.47399

fbgt_else.47398:
fbgt_cont.47399:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47402

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.47403

fbgt_else.47402:
fbgt_cont.47403:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47404

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.47405

fbgt_else.47404:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.47405:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47406

	nop
	nop
	nop
	j	bnei_cont.47407

bnei_else.47406:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.47407:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	fsw	%f2, 146(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.47339:
	nop
	nop
	nop
	j	bnei_cont.47335

bnei_else.47336:
	nop
	nop
	flw	%f6, 446(%zero)
	flw	%f7, 489(%zero)

	nop
	nop
	fmul	%f6, %f4, %f6
	flw	%f8, 493(%zero)

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47408

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.47409

fbgt_else.47408:
	nop
	nop
	nop
	addi	%a1, %zero, 0

fbgt_cont.47409:
	nop
	fabs	%f6, %f6
	flw	%f8, 488(%zero)
	sw	%a1, 20(%sp)

	nop
	nop
	nop
	fsw	%f7, 21(%sp)

	nop
	nop
	nop
	fsw	%f8, 22(%sp)

	nop
	nop
	nop
	fsw	%f6, 23(%sp)

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47410

	nop
	nop
	nop
	flw	%f9, 487(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47412

	nop
	nop
	nop
	flw	%f9, 486(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47414

	nop
	nop
	nop
	flw	%f9, 485(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47416

	nop
	nop
	nop
	flw	%f9, 484(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47418

	nop
	nop
	nop
	flw	%f9, 483(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47420

	nop
	nop
	nop
	flw	%f9, 482(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47422

	nop
	nop
	nop
	flw	%f9, 481(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47424

	nop
	nop
	nop
	flw	%f9, 480(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47426

	nop
	nop
	nop
	flw	%f9, 479(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47428

	nop
	nop
	nop
	flw	%f9, 478(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47430

	nop
	nop
	nop
	flw	%f9, 477(%zero)

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.47432

	nop
	flw	%f9, 447(%zero)
	fmov	%f0, %f6
	sw	%ra, 24(%sp)

	nop
	nop
	fmov	%f1, %f9
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -25
	fmov	%f1, %f0

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47432:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47433:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47430:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47431:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47428:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47429:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47426:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47427:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47424:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47425:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47422:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47423:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47420:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47421:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47418:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47419:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47416:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47417:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47414:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47415:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47412:
	nop
	nop
	nop
	fmov	%f1, %f9

fbgt_cont.47413:
	nop
	nop
	nop
	j	fbgt_cont.47411

fbgt_else.47410:
	nop
	nop
	nop
	fmov	%f1, %f8

fbgt_cont.47411:
	nop
	nop
	flw	%f0, 23(%sp)
	flw	%f2, 22(%sp)

	nop
	nop
	nop
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	lw	%ra, 24(%sp)
	flw	%f1, 21(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47434

	nop
	nop
	nop
	lw	%v0, 20(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47436

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47435

bnei_else.47436:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.47437:
	nop
	nop
	nop
	j	fbgt_cont.47435

fbgt_else.47434:
	nop
	nop
	nop
	lw	%v0, 20(%sp)

fbgt_cont.47435:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47438

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.47439

fbgt_else.47438:
fbgt_cont.47439:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47440

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.47441

fbgt_else.47440:
fbgt_cont.47441:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47442

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.47443

fbgt_else.47442:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.47443:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47444

	nop
	nop
	nop
	j	bnei_cont.47445

bnei_else.47444:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.47445:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f1, %f0

	nop
	nop
	nop
	fsw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.47337:
	nop
	nop
	nop
	j	bnei_cont.47335

bnei_else.47334:
	nop
	nop
	lw	%a1, 5(%v1)
	flw	%f7, 445(%zero)

	nop
	nop
	flw	%f6, 0(%a1)
	flw	%f9, 444(%zero)

	nop
	nop
	nop
	fsub	%f6, %f3, %f6

	nop
	nop
	nop
	fmul	%f8, %f6, %f7

	nop
	nop
	nop
	floor	%f8, %f8

	nop
	nop
	nop
	fmul	%f8, %f8, %f9

	nop
	nop
	fsub	%f6, %f6, %f8
	flw	%f8, 448(%zero)

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47446

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47447

fbgt_else.47446:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.47447:
	nop
	nop
	nop
	lw	%a3, 5(%v1)

	nop
	nop
	nop
	flw	%f6, 2(%a3)

	nop
	nop
	nop
	fsub	%f6, %f5, %f6

	nop
	nop
	nop
	fmul	%f7, %f6, %f7

	nop
	nop
	nop
	floor	%f7, %f7

	nop
	nop
	nop
	fmul	%f7, %f7, %f9

	nop
	nop
	nop
	fsub	%f6, %f6, %f7

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47448

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47449

fbgt_else.47448:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.47449:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47450

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.47452

	nop
	nop
	nop
	flw	%f6, 450(%zero)

	nop
	nop
	nop
	j	bnei_cont.47451

bnei_else.47452:
	nop
	nop
	nop
	flw	%f6, 493(%zero)

bnei_cont.47453:
	nop
	nop
	nop
	j	bnei_cont.47451

bnei_else.47450:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.47454

	nop
	nop
	nop
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	j	bnei_cont.47455

bnei_else.47454:
	nop
	nop
	nop
	flw	%f6, 450(%zero)

bnei_cont.47455:
bnei_cont.47451:
	nop
	nop
	nop
	fsw	%f6, 146(%zero)

bnei_cont.47335:
	nop
	nop
	lw	%v0, 16(%sp)
	lw	%v1, 136(%zero)

	nop
	sll	%v0, %v0, 2
	lw	%a0, 7(%sp)
	flw	%f0, 15(%sp)

	nop
	add	%v0, %v0, %v1
	lw	%v1, 6(%sp)
	flw	%f1, 14(%sp)

	nop
	add	%at, %a0, %v1
	flw	%f2, 13(%sp)
	lw	%a2, 12(%sp)

	nop
	nop
	sw	%v0, 0(%at)
	lw	%v0, 3(%sp)

	nop
	nop
	lw	%a1, 1(%v0)
	lw	%a3, 7(%a2)

	nop
	add	%at, %a1, %v1
	flw	%f3, 0(%a3)
	flw	%f4, 471(%zero)

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	nop
	fsw	%f0, 0(%a1)

	nop
	nop
	nop
	fsw	%f1, 1(%a1)

	nop
	nop
	nop
	fsw	%f2, 2(%a1)

	nop
	nop
	nop
	lw	%a1, 3(%v0)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.47456

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47457

fbgt_else.47456:
	nop
	nop
	nop
	addi	%a3, %zero, 1

fbgt_cont.47457:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.47458

	nop
	nop
	lw	%a3, 2(%sp)
	add	%at, %a1, %v1

	nop
	nop
	nop
	sw	%a3, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.47459

bnei_else.47458:
	nop
	lw	%a3, 11(%sp)
	add	%at, %a1, %v1
	lw	%a1, 4(%v0)

	nop
	nop
	sw	%a3, 0(%at)
	flw	%f3, 145(%zero)

	nop
	nop
	add	%at, %a1, %v1
	flw	%f4, 10(%sp)

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	fsw	%f3, 0(%a1)
	flw	%f3, 146(%zero)

	nop
	nop
	fsw	%f3, 1(%a1)
	flw	%f3, 147(%zero)

	nop
	nop
	fsw	%f3, 2(%a1)
	flw	%f3, 443(%zero)

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f5, 0(%a1)

	nop
	nop
	nop
	fmul	%f5, %f5, %f3

	nop
	nop
	nop
	fsw	%f5, 0(%a1)

	nop
	nop
	nop
	flw	%f5, 1(%a1)

	nop
	nop
	nop
	fmul	%f5, %f5, %f3

	nop
	nop
	nop
	fsw	%f5, 1(%a1)

	nop
	nop
	nop
	flw	%f5, 2(%a1)

	nop
	nop
	nop
	fmul	%f3, %f5, %f3

	nop
	nop
	fsw	%f3, 2(%a1)
	flw	%f3, 142(%zero)

	nop
	nop
	nop
	lw	%a1, 7(%v0)

	nop
	nop
	nop
	add	%at, %a1, %v1

	nop
	nop
	nop
	lw	%a1, 0(%at)

	nop
	nop
	fsw	%f3, 0(%a1)
	flw	%f3, 143(%zero)

	nop
	nop
	fsw	%f3, 1(%a1)
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fsw	%f3, 2(%a1)

bnei_cont.47459:
	nop
	nop
	flw	%f3, 442(%zero)
	lw	%a1, 5(%sp)

	nop
	nop
	flw	%f4, 0(%a1)
	flw	%f5, 142(%zero)

	nop
	fmul	%f6, %f4, %f5
	flw	%f7, 1(%a1)
	flw	%f8, 143(%zero)

	nop
	fmul	%f9, %f7, %f8
	flw	%f10, 144(%zero)
	lw	%a3, 7(%a2)

	nop
	fadd	%f6, %f6, %f9
	flw	%f9, 2(%a1)
	lw	%t0, 1(%sp)

	nop
	nop
	fmul	%f11, %f9, %f10
	addi	%v1, %t0, 0

	nop
	nop
	nop
	fadd	%f6, %f6, %f11

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f6, %f3, %f5

	nop
	nop
	nop
	fadd	%f4, %f4, %f6

	nop
	fsw	%f4, 0(%a1)
	fmul	%f4, %f3, %f8
	fmul	%f3, %f3, %f10

	nop
	nop
	fadd	%f4, %f7, %f4
	fadd	%f3, %f9, %f3

	nop
	nop
	fsw	%f4, 1(%a1)
	flw	%f4, 4(%sp)

	nop
	nop
	fsw	%f3, 2(%a1)
	flw	%f3, 1(%a3)

	nop
	nop
	fmul	%f3, %f4, %f3
	lw	%a3, 2(%sp)

	nop
	nop
	fsw	%f3, 24(%sp)
	addi	%v0, %a3, 0

	nop
	nop
	nop
	fsw	%f10, 25(%sp)

	nop
	nop
	nop
	fsw	%f8, 26(%sp)

	nop
	nop
	nop
	fsw	%f5, 27(%sp)

	nop
	nop
	nop
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47460

	nop
	nop
	nop
	j	bnei_cont.47461

bnei_else.47460:
	nop
	nop
	flw	%f0, 78(%zero)
	flw	%f1, 27(%sp)

	nop
	fmul	%f1, %f1, %f0
	flw	%f2, 79(%zero)
	flw	%f3, 26(%sp)

	nop
	fmul	%f3, %f3, %f2
	flw	%f4, 25(%sp)
	lw	%v0, 5(%sp)

	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 80(%zero)
	flw	%f5, 0(%v0)

	nop
	fmul	%f4, %f4, %f3
	fmul	%f0, %f5, %f0
	flw	%f5, 1(%v0)

	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 10(%sp)
	fmul	%f2, %f5, %f2

	nop
	fneg	%f1, %f1
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%v0)

	nop
	nop
	fmul	%f1, %f1, %f4
	fmul	%f2, %f2, %f3

	nop
	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 493(%zero)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.47462

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47463

fbgt_else.47462:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.47463:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47464

	nop
	nop
	flw	%f3, 151(%zero)
	flw	%f5, 145(%zero)

	nop
	nop
	nop
	fmul	%f5, %f1, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f5

	nop
	nop
	nop
	fsw	%f3, 151(%zero)

	nop
	nop
	flw	%f3, 152(%zero)
	flw	%f5, 146(%zero)

	nop
	nop
	nop
	fmul	%f5, %f1, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f5

	nop
	nop
	nop
	fsw	%f3, 152(%zero)

	nop
	nop
	flw	%f3, 153(%zero)
	flw	%f5, 147(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

	nop
	nop
	nop
	fsw	%f1, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.47465

bnei_else.47464:
bnei_cont.47465:
	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.47466

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47467

fbgt_else.47466:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.47467:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47468

	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 24(%sp)
	flw	%f2, 151(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fadd	%f2, %f2, %f0

	nop
	nop
	nop
	fsw	%f2, 151(%zero)

	nop
	nop
	nop
	flw	%f2, 152(%zero)

	nop
	nop
	nop
	fadd	%f2, %f2, %f0

	nop
	nop
	nop
	fsw	%f2, 152(%zero)

	nop
	nop
	nop
	flw	%f2, 153(%zero)

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.47469

bnei_else.47468:
bnei_cont.47469:
bnei_cont.47461:
	nop
	nop
	nop
	flw	%f0, 15(%sp)

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 14(%sp)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 13(%sp)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 28(%sp)

	nop
	nop
	lw	%v0, 0(%zero)
	addi	%sp, %sp, 29

	nop
	nop
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -29
	lw	%v0, 434(%zero)

	nop
	lw	%ra, 28(%sp)
	addi	%v0, %v0, -1
	flw	%f0, 10(%sp)

	nop
	nop
	flw	%f1, 24(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	trace_reflections.2966

	nop
	nop
	addi	%sp, %sp, -29
	flw	%f0, 441(%zero)

	nop
	nop
	lw	%ra, 28(%sp)
	flw	%f1, 4(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47470

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47471

fbgt_else.47470:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.47471:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47472

	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	blti	%v0, 4, bgti_else.47473

	nop
	nop
	nop
	j	bgti_cont.47474

bgti_else.47473:
	nop
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1
	lw	%a1, 7(%sp)

	nop
	nop
	nop
	add	%at, %a1, %v1

	nop
	nop
	nop
	sw	%a0, 0(%at)

bgti_cont.47474:
	nop
	nop
	nop
	lw	%v1, 9(%sp)

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.47475

	nop
	nop
	nop
	jr	%ra

bnei_else.47475:
	nop
	flw	%f0, 491(%zero)
	lw	%v1, 12(%sp)
	addi	%v0, %v0, 1

	nop
	nop
	lw	%v1, 7(%v1)
	lw	%a0, 3(%sp)

	nop
	nop
	flw	%f2, 0(%v1)
	lw	%v1, 5(%sp)

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 0(%sp)

	nop
	nop
	fmul	%f0, %f1, %f0
	flw	%f1, 8(%sp)

	nop
	nop
	nop
	fadd	%f1, %f2, %f1

	nop
	nop
	nop
	j	trace_ray.2971

bnei_else.47472:
	nop
	nop
	nop
	jr	%ra

bnei_else.47313:
	nop
	addi	%v0, %zero, -1
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47478

	nop
	nop
	lw	%v0, 5(%sp)
	flw	%f1, 78(%zero)

	nop
	nop
	flw	%f0, 0(%v0)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47479

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47480

fbgt_else.47479:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.47480:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47481

	nop
	nop
	nop
	fmul	%f1, %f0, %f0

	nop
	nop
	fmul	%f0, %f1, %f0
	flw	%f1, 4(%sp)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 81(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 151(%zero)

	nop
	nop
	nop
	fadd	%f1, %f1, %f0

	nop
	nop
	nop
	fsw	%f1, 151(%zero)

	nop
	nop
	nop
	flw	%f1, 152(%zero)

	nop
	nop
	nop
	fadd	%f1, %f1, %f0

	nop
	nop
	nop
	fsw	%f1, 152(%zero)

	nop
	nop
	nop
	flw	%f1, 153(%zero)

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.47481:
	nop
	nop
	nop
	jr	%ra

bnei_else.47478:
	nop
	nop
	nop
	jr	%ra

bgt_else.47306:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_ray.2977:
	nop
	addi	%v1, %zero, 0
	flw	%f1, 465(%zero)
	fsw	%f0, 0(%sp)

	nop
	nop
	nop
	fsw	%f1, 137(%zero)

	nop
	nop
	nop
	lw	%a0, 134(%zero)

	nop
	sw	%a0, 1(%sp)
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	sw	%v0, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	addi	%sp, %sp, -5
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	lw	%ra, 4(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47611

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47612

fbgt_else.47611:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.47612:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47613

	nop
	nop
	nop
	flw	%f1, 464(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47615

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.47614

fbgt_else.47615:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.47616:
	nop
	nop
	nop
	j	bnei_cont.47614

bnei_else.47613:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.47614:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47617

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 3(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.47618

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.47620

	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f3, %f0, %f3
	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f4, %f1, %f4
	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	fmul	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47622

	nop
	nop
	nop
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f6, %f1, %f6
	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f7, %f2, %f7

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f3, %f3, %f6

	nop
	nop
	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)

	nop
	nop
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f6

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f7

	nop
	nop
	nop
	fadd	%f2, %f4, %f2

	nop
	nop
	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)

	nop
	nop
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	flw	%f2, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f7

	nop
	nop
	nop
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.47623

bnei_else.47622:
	nop
	nop
	nop
	fsw	%f3, 142(%zero)

	nop
	nop
	nop
	fsw	%f4, 143(%zero)

	nop
	nop
	nop
	fsw	%f5, 144(%zero)

bnei_cont.47623:
	nop
	nop
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)

	nop
	nop
	nop
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 493(%zero)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.47624

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.47625

fbeq_else.47624:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.47625:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47626

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.47627

bnei_else.47626:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47628

	nop
	nop
	nop
	flw	%f4, 490(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f4, %f1

	nop
	nop
	nop
	j	bnei_cont.47629

bnei_else.47628:
	nop
	nop
	nop
	flw	%f4, 491(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f4, %f1

bnei_cont.47629:
bnei_cont.47627:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.47619

bnei_else.47620:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.47621:
	nop
	nop
	nop
	j	bnei_cont.47619

bnei_else.47618:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 493(%zero)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.47630

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.47631

fbeq_else.47630:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.47631:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47632

	nop
	nop
	nop
	j	bnei_cont.47633

bnei_else.47632:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47634

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47635

fbgt_else.47634:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.47635:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47636

	nop
	nop
	nop
	flw	%f0, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.47637

bnei_else.47636:
	nop
	nop
	nop
	flw	%f0, 490(%zero)

bnei_cont.47637:
bnei_cont.47633:
	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 142(%a0)

bnei_cont.47619:
	nop
	nop
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 0(%a0)
	lw	%a0, 8(%v0)

	nop
	nop
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 2(%a0)
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.47638

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.47640

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.47642

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.47644

	nop
	nop
	nop
	j	bnei_cont.47639

bnei_else.47644:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsqrt	%f1, %f1
	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)

	nop
	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fsqrt	%f2, %f2

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	nop
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.47646

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47647

fbgt_else.47646:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.47647:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47648

	nop
	nop
	nop
	flw	%f0, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.47649

bnei_else.47648:
	nop
	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47650

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.47651

fbgt_else.47650:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.47651:
	nop
	nop
	fabs	%f1, %f0
	flw	%f3, 461(%zero)

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47652

	nop
	nop
	nop
	flw	%f0, 454(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47654

	nop
	nop
	flw	%f0, 476(%zero)
	flw	%f3, 491(%zero)

	nop
	fdiv	%f1, %f3, %f1
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f3, %f1, %f1
	fmul	%f7, %f7, %f1

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f1, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f1, %f7, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fmul	%f1, %f1, %f6

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.47655

fbgt_else.47654:
	nop
	nop
	flw	%f0, 475(%zero)
	flw	%f3, 491(%zero)

	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	fmul	%f3, %f1, %f1
	fmul	%f7, %f7, %f1

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f1, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f1

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f1, %f7, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fmul	%f1, %f1, %f6

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

fbgt_cont.47655:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47656

	nop
	nop
	nop
	j	fbgt_cont.47653

bnei_else.47656:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.47657:
	nop
	nop
	nop
	j	fbgt_cont.47653

fbgt_else.47652:
	nop
	fmul	%f1, %f0, %f0
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)

	nop
	nop
	fmul	%f3, %f1, %f1
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f6, %f6, %f1

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f1, %f7, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	fsub	%f1, %f6, %f1
	flw	%f6, 455(%zero)

	nop
	nop
	nop
	fmul	%f0, %f6, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f3

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

fbgt_cont.47653:
	nop
	nop
	nop
	flw	%f1, 453(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 452(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

bnei_cont.47649:
	nop
	nop
	floor	%f1, %f0
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)

	nop
	nop
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	flw	%f3, 1(%v1)

	nop
	nop
	nop
	fsqrt	%f3, %f3

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.47658

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47659

fbgt_else.47658:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.47659:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47660

	nop
	nop
	nop
	flw	%f1, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.47661

bnei_else.47660:
	nop
	nop
	fdiv	%f1, %f1, %f2
	flw	%f2, 493(%zero)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47662

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.47663

fbgt_else.47662:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.47663:
	nop
	nop
	fabs	%f2, %f1
	flw	%f3, 461(%zero)

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.47664

	nop
	nop
	nop
	flw	%f1, 454(%zero)

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.47666

	nop
	nop
	flw	%f1, 476(%zero)
	flw	%f3, 491(%zero)

	nop
	fdiv	%f2, %f3, %f2
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f6, %f6, %f2

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fsub	%f6, %f2, %f6

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)

	nop
	nop
	nop
	fmul	%f2, %f6, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f5

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fsub	%f1, %f1, %f2

	nop
	nop
	nop
	j	fbgt_cont.47667

fbgt_else.47666:
	nop
	nop
	flw	%f1, 475(%zero)
	flw	%f3, 491(%zero)

	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)

	nop
	nop
	nop
	fdiv	%f2, %f4, %f2

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f6, %f6, %f2

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fsub	%f6, %f2, %f6

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f2

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)

	nop
	nop
	nop
	fmul	%f2, %f6, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f5

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

fbgt_cont.47667:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47668

	nop
	nop
	nop
	j	fbgt_cont.47665

bnei_else.47668:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.47669:
	nop
	nop
	nop
	j	fbgt_cont.47665

fbgt_else.47664:
	nop
	fmul	%f2, %f1, %f1
	flw	%f5, 460(%zero)
	flw	%f6, 459(%zero)

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f5, %f5, %f1

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f5, %f5, %f2

	nop
	nop
	fsub	%f5, %f1, %f5
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f3

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 458(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f2

	nop
	nop
	nop
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 457(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f6, %f6, %f4

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 456(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f1

	nop
	nop
	nop
	fmul	%f2, %f6, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	fsub	%f2, %f5, %f2
	flw	%f5, 455(%zero)

	nop
	nop
	nop
	fmul	%f1, %f5, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fadd	%f1, %f2, %f1

fbgt_cont.47665:
	nop
	nop
	nop
	flw	%f2, 453(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 452(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f2

bnei_cont.47661:
	nop
	nop
	floor	%f2, %f1
	flw	%f3, 471(%zero)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47670

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47671

fbgt_else.47670:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.47671:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47672

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.47673

bnei_else.47672:
bnei_cont.47673:
	nop
	nop
	nop
	flw	%f1, 450(%zero)

	nop
	nop
	fmul	%f0, %f1, %f0
	flw	%f1, 449(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.47645:
	nop
	nop
	nop
	j	bnei_cont.47639

bnei_else.47642:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)

	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 488(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 448(%zero)

	nop
	nop
	nop
	fsqrt	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f0

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)

	nop
	nop
	fabs	%f0, %f0
	fsw	%f1, 5(%sp)

	nop
	nop
	nop
	fsw	%f2, 6(%sp)

	nop
	nop
	nop
	fsw	%f0, 7(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47674

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47676

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47678

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47680

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47682

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47684

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47686

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47688

	nop
	nop
	nop
	flw	%f3, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47690

	nop
	nop
	nop
	flw	%f3, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47692

	nop
	nop
	nop
	flw	%f3, 478(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47694

	nop
	nop
	nop
	flw	%f3, 477(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47696

	nop
	nop
	flw	%f3, 447(%zero)
	sw	%ra, 8(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -9
	fmov	%f1, %f0

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47696:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47697:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47694:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47695:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47692:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47693:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47690:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47691:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47688:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47689:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47686:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47687:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47684:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47685:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47682:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47683:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47680:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47681:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47678:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47679:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47676:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47677:
	nop
	nop
	nop
	j	fbgt_cont.47675

fbgt_else.47674:
	nop
	nop
	nop
	fmov	%f1, %f2

fbgt_cont.47675:
	nop
	nop
	flw	%f0, 7(%sp)
	flw	%f2, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	lw	%ra, 8(%sp)
	flw	%f1, 5(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47698

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47699

fbgt_else.47698:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.47699:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47700

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.47701

fbgt_else.47700:
fbgt_cont.47701:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47702

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47704

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47703

bnei_else.47704:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.47705:
	nop
	nop
	nop
	j	fbgt_cont.47703

fbgt_else.47702:
fbgt_cont.47703:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47706

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.47707

fbgt_else.47706:
fbgt_cont.47707:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47708

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.47709

fbgt_else.47708:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.47709:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47710

	nop
	nop
	nop
	j	bnei_cont.47711

bnei_else.47710:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.47711:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	fsw	%f2, 146(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.47643:
	nop
	nop
	nop
	j	bnei_cont.47639

bnei_else.47640:
	nop
	nop
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47712

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.47713

fbgt_else.47712:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.47713:
	nop
	fabs	%f0, %f0
	flw	%f2, 488(%zero)
	sw	%v1, 8(%sp)

	nop
	nop
	nop
	fsw	%f1, 9(%sp)

	nop
	nop
	nop
	fsw	%f2, 10(%sp)

	nop
	nop
	nop
	fsw	%f0, 11(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47714

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47716

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47718

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47720

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47722

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47724

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47726

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47728

	nop
	nop
	nop
	flw	%f3, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47730

	nop
	nop
	nop
	flw	%f3, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47732

	nop
	nop
	nop
	flw	%f3, 478(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47734

	nop
	nop
	nop
	flw	%f3, 477(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.47736

	nop
	nop
	flw	%f3, 447(%zero)
	sw	%ra, 12(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -13
	fmov	%f1, %f0

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47736:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47737:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47734:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47735:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47732:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47733:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47730:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47731:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47728:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47729:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47726:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47727:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47724:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47725:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47722:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47723:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47720:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47721:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47718:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47719:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47716:
	nop
	nop
	nop
	fmov	%f1, %f3

fbgt_cont.47717:
	nop
	nop
	nop
	j	fbgt_cont.47715

fbgt_else.47714:
	nop
	nop
	nop
	fmov	%f1, %f2

fbgt_cont.47715:
	nop
	nop
	flw	%f0, 11(%sp)
	flw	%f2, 10(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	flw	%f1, 9(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47738

	nop
	nop
	nop
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47740

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47739

bnei_else.47740:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.47741:
	nop
	nop
	nop
	j	fbgt_cont.47739

fbgt_else.47738:
	nop
	nop
	nop
	lw	%v0, 8(%sp)

fbgt_cont.47739:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47742

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.47743

fbgt_else.47742:
fbgt_cont.47743:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47744

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.47745

fbgt_else.47744:
fbgt_cont.47745:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47746

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.47747

fbgt_else.47746:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.47747:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47748

	nop
	nop
	nop
	j	bnei_cont.47749

bnei_else.47748:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.47749:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f1, %f0

	nop
	nop
	nop
	fsw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.47641:
	nop
	nop
	nop
	j	bnei_cont.47639

bnei_else.47638:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	floor	%f2, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47750

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47751

fbgt_else.47750:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.47751:
	nop
	nop
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)

	nop
	nop
	nop
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f1, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47752

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47753

fbgt_else.47752:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.47753:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47754

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47756

	nop
	nop
	nop
	flw	%f0, 450(%zero)

	nop
	nop
	nop
	j	bnei_cont.47755

bnei_else.47756:
	nop
	nop
	nop
	flw	%f0, 493(%zero)

bnei_cont.47757:
	nop
	nop
	nop
	j	bnei_cont.47755

bnei_else.47754:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47758

	nop
	nop
	nop
	flw	%f0, 493(%zero)

	nop
	nop
	nop
	j	bnei_cont.47759

bnei_else.47758:
	nop
	nop
	nop
	flw	%f0, 450(%zero)

bnei_cont.47759:
bnei_cont.47755:
	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.47639:
	nop
	nop
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47760

	nop
	nop
	nop
	jr	%ra

bnei_else.47760:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47762

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.47763

fbgt_else.47762:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.47763:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47764

	nop
	nop
	nop
	j	bnei_cont.47765

bnei_else.47764:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.47765:
	nop
	nop
	flw	%f1, 0(%sp)
	lw	%v0, 4(%sp)

	nop
	fmul	%f0, %f1, %f0
	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f1, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 148(%zero)

	nop
	nop
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 149(%zero)

	nop
	nop
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	jr	%ra

bnei_else.47617:
	nop
	nop
	nop
	jr	%ra

iter_trace_diffuse_rays.2980:
	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.48522

	add	%at, %v0, %a1
	flw	%f1, 0(%v1)
	addi	%t1, %zero, 1
	flw	%f3, 1(%v1)

	nop
	nop
	lw	%a3, 0(%at)
	flw	%f4, 2(%v1)

	nop
	nop
	nop
	lw	%t0, 0(%a3)

	nop
	nop
	flw	%f0, 0(%t0)
	flw	%f2, 1(%t0)

	nop
	nop
	fmul	%f0, %f0, %f1
	fmul	%f2, %f2, %f3

	nop
	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 2(%t0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f4

	nop
	nop
	fadd	%f0, %f0, %f2
	flw	%f2, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.48523

	nop
	nop
	nop
	addi	%t0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48524

fbgt_else.48523:
	nop
	nop
	nop
	addi	%t0, %zero, 1

fbgt_cont.48524:
	nop
	nop
	nop
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%a2, 2(%sp)

	nop
	nop
	nop
	fsw	%f2, 3(%sp)

	nop
	nop
	nop
	fsw	%f4, 4(%sp)

	nop
	nop
	nop
	fsw	%f3, 5(%sp)

	nop
	nop
	nop
	fsw	%f1, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 7(%sp)

	nop
	nop
	nop
	sw	%a1, 8(%sp)

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.48525

	nop
	nop
	addi	%a3, %a1, 1
	flw	%f5, 440(%zero)

	nop
	add	%at, %v0, %a3
	fdiv	%f0, %f0, %f5
	flw	%f5, 465(%zero)

	nop
	nop
	lw	%a3, 0(%at)
	fsw	%f5, 137(%zero)

	nop
	nop
	lw	%t0, 134(%zero)
	fsw	%f0, 9(%sp)

	nop
	nop
	lw	%t2, 0(%t0)
	sw	%t0, 10(%sp)

	nop
	nop
	lw	%t3, 0(%t2)
	sw	%a3, 11(%sp)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.48527

	nop
	nop
	nop
	sw	%t1, 12(%sp)

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.48529

	nop
	nop
	lw	%t4, 12(%t3)
	lw	%t6, 1(%a3)

	nop
	lw	%t5, 10(%t4)
	add	%at, %t6, %t3
	lw	%t6, 1(%t4)

	nop
	nop
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)

	nop
	nop
	flw	%f7, 2(%t5)
	lw	%t3, 0(%at)

	nop
	nop
	nop
	beqi	%t6, 1, bnei_else.48531

	nop
	nop
	nop
	beqi	%t6, 2, bnei_else.48533

	nop
	nop
	nop
	flw	%f8, 0(%t3)

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.48535

	nop
	nop
	nop
	addi	%t6, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48536

fbeq_else.48535:
	nop
	nop
	nop
	addi	%t6, %zero, 0

fbeq_cont.48536:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48537

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48532

bnei_else.48537:
	nop
	nop
	nop
	flw	%f9, 1(%t3)

	nop
	nop
	fmul	%f5, %f9, %f5
	flw	%f9, 2(%t3)

	nop
	nop
	nop
	fmul	%f6, %f9, %f6

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t3)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t5)

	nop
	nop
	fmul	%f7, %f5, %f5
	fmul	%f6, %f8, %f6

	nop
	nop
	nop
	fsub	%f6, %f7, %f6

	nop
	nop
	nop
	fblt	%f2, %f6, fbgt_else.48539

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48540

fbgt_else.48539:
	nop
	nop
	nop
	addi	%t5, %zero, 1

fbgt_cont.48540:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.48541

	nop
	nop
	nop
	lw	%t4, 6(%t4)

	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.48543

	nop
	nop
	nop
	fsqrt	%f6, %f6

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.48544

bnei_else.48543:
	nop
	nop
	nop
	fsqrt	%f6, %f6

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

bnei_cont.48544:
	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.48542

bnei_else.48541:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48542:
bnei_cont.48538:
	nop
	nop
	nop
	j	bnei_cont.48532

bnei_else.48533:
	nop
	nop
	nop
	flw	%f5, 0(%t3)

	nop
	nop
	nop
	fblt	%f5, %f2, fbgt_else.48545

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48546

fbgt_else.48545:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.48546:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48547

	nop
	nop
	nop
	flw	%f6, 3(%t5)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.48548

bnei_else.48547:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48548:
bnei_cont.48534:
	nop
	nop
	nop
	j	bnei_cont.48532

bnei_else.48531:
	nop
	nop
	lw	%t5, 0(%a3)
	flw	%f8, 0(%t3)

	nop
	fsub	%f8, %f8, %f5
	flw	%f9, 1(%t3)
	flw	%f10, 1(%t5)

	nop
	nop
	fmul	%f8, %f8, %f9
	lw	%t6, 4(%t4)

	nop
	nop
	fmul	%f11, %f8, %f10
	flw	%f12, 1(%t6)

	nop
	nop
	nop
	fadd	%f11, %f11, %f6

	nop
	nop
	nop
	fabs	%f11, %f11

	nop
	nop
	nop
	fblt	%f11, %f12, fbgt_else.48549

	nop
	nop
	nop
	addi	%t6, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48550

fbgt_else.48549:
	nop
	nop
	nop
	addi	%t6, %zero, 1

fbgt_cont.48550:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48551

	nop
	nop
	flw	%f11, 2(%t5)
	lw	%t6, 4(%t4)

	nop
	nop
	fmul	%f11, %f8, %f11
	flw	%f13, 2(%t6)

	nop
	nop
	nop
	fadd	%f11, %f11, %f7

	nop
	nop
	nop
	fabs	%f11, %f11

	nop
	nop
	nop
	fblt	%f11, %f13, fbgt_else.48553

	nop
	nop
	nop
	addi	%t6, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48554

fbgt_else.48553:
	nop
	nop
	nop
	addi	%t6, %zero, 1

fbgt_cont.48554:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48555

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.48557

	nop
	nop
	nop
	addi	%t6, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48558

fbeq_else.48557:
	nop
	nop
	nop
	addi	%t6, %zero, 0

fbeq_cont.48558:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48559

	nop
	nop
	nop
	addi	%t6, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48552

bnei_else.48559:
	nop
	nop
	nop
	addi	%t6, %zero, 1

bnei_cont.48560:
	nop
	nop
	nop
	j	bnei_cont.48552

bnei_else.48555:
	nop
	nop
	nop
	addi	%t6, %zero, 0

bnei_cont.48556:
	nop
	nop
	nop
	j	bnei_cont.48552

bnei_else.48551:
	nop
	nop
	nop
	addi	%t6, %zero, 0

bnei_cont.48552:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48561

	nop
	nop
	nop
	fsw	%f8, 135(%zero)

	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.48562

bnei_else.48561:
	nop
	nop
	flw	%f8, 2(%t3)
	flw	%f9, 3(%t3)

	nop
	fsub	%f8, %f8, %f6
	flw	%f11, 0(%t5)
	lw	%t6, 4(%t4)

	nop
	nop
	fmul	%f8, %f8, %f9
	flw	%f14, 0(%t6)

	nop
	nop
	nop
	fmul	%f13, %f8, %f11

	nop
	nop
	nop
	fadd	%f13, %f13, %f5

	nop
	nop
	nop
	fabs	%f13, %f13

	nop
	nop
	nop
	fblt	%f13, %f14, fbgt_else.48563

	nop
	nop
	nop
	addi	%t6, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48564

fbgt_else.48563:
	nop
	nop
	nop
	addi	%t6, %zero, 1

fbgt_cont.48564:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48565

	nop
	nop
	flw	%f13, 2(%t5)
	lw	%t4, 4(%t4)

	nop
	nop
	fmul	%f13, %f8, %f13
	flw	%f15, 2(%t4)

	nop
	nop
	nop
	fadd	%f13, %f13, %f7

	nop
	nop
	nop
	fabs	%f13, %f13

	nop
	nop
	nop
	fblt	%f13, %f15, fbgt_else.48567

	nop
	nop
	nop
	addi	%t4, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48568

fbgt_else.48567:
	nop
	nop
	nop
	addi	%t4, %zero, 1

fbgt_cont.48568:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.48569

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.48571

	nop
	nop
	nop
	addi	%t4, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48572

fbeq_else.48571:
	nop
	nop
	nop
	addi	%t4, %zero, 0

fbeq_cont.48572:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.48573

	nop
	nop
	nop
	addi	%t4, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48566

bnei_else.48573:
	nop
	nop
	nop
	addi	%t4, %zero, 1

bnei_cont.48574:
	nop
	nop
	nop
	j	bnei_cont.48566

bnei_else.48569:
	nop
	nop
	nop
	addi	%t4, %zero, 0

bnei_cont.48570:
	nop
	nop
	nop
	j	bnei_cont.48566

bnei_else.48565:
	nop
	nop
	nop
	addi	%t4, %zero, 0

bnei_cont.48566:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.48575

	nop
	nop
	nop
	fsw	%f8, 135(%zero)

	nop
	nop
	nop
	addi	%t3, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.48576

bnei_else.48575:
	nop
	nop
	nop
	flw	%f8, 4(%t3)

	nop
	nop
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fmul	%f9, %f7, %f11

	nop
	nop
	nop
	fadd	%f5, %f9, %f5

	nop
	nop
	nop
	fabs	%f5, %f5

	nop
	nop
	nop
	fblt	%f5, %f14, fbgt_else.48577

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48578

fbgt_else.48577:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.48578:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48579

	nop
	nop
	nop
	fmul	%f5, %f7, %f10

	nop
	nop
	nop
	fadd	%f5, %f5, %f6

	nop
	nop
	nop
	fabs	%f5, %f5

	nop
	nop
	nop
	fblt	%f5, %f12, fbgt_else.48581

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48582

fbgt_else.48581:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.48582:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48583

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.48585

	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48586

fbeq_else.48585:
	nop
	nop
	nop
	addi	%t3, %zero, 0

fbeq_cont.48586:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48587

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48580

bnei_else.48587:
	nop
	nop
	nop
	addi	%t3, %zero, 1

bnei_cont.48588:
	nop
	nop
	nop
	j	bnei_cont.48580

bnei_else.48583:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48584:
	nop
	nop
	nop
	j	bnei_cont.48580

bnei_else.48579:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48580:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48589

	nop
	nop
	nop
	fsw	%f7, 135(%zero)

	nop
	nop
	nop
	addi	%t3, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.48590

bnei_else.48589:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48590:
bnei_cont.48576:
bnei_cont.48562:
bnei_cont.48532:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48591

	nop
	nop
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.48593

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48594

fbgt_else.48593:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.48594:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48595

	nop
	nop
	nop
	lw	%t3, 1(%t2)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.48597

	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %t3, 0
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48599

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48601

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48603

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -15
	addi	%v0, %zero, 5

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)

	nop
	nop
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bnei_cont.48530

bnei_else.48603:
bnei_cont.48604:
	nop
	nop
	nop
	j	bnei_cont.48530

bnei_else.48601:
bnei_cont.48602:
	nop
	nop
	nop
	j	bnei_cont.48530

bnei_else.48599:
bnei_cont.48600:
	nop
	nop
	nop
	j	bnei_cont.48530

bnei_else.48597:
bnei_cont.48598:
	nop
	nop
	nop
	j	bnei_cont.48530

bnei_else.48595:
bnei_cont.48596:
	nop
	nop
	nop
	j	bnei_cont.48530

bnei_else.48591:
bnei_cont.48592:
	nop
	nop
	nop
	j	bnei_cont.48530

bnei_else.48529:
	nop
	nop
	nop
	lw	%t3, 1(%t2)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.48605

	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %t3, 0
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48607

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48609

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48611

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 11(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -15
	addi	%v0, %zero, 5

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)

	nop
	nop
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bnei_cont.48606

bnei_else.48611:
bnei_cont.48612:
	nop
	nop
	nop
	j	bnei_cont.48606

bnei_else.48609:
bnei_cont.48610:
	nop
	nop
	nop
	j	bnei_cont.48606

bnei_else.48607:
bnei_cont.48608:
	nop
	nop
	nop
	j	bnei_cont.48606

bnei_else.48605:
bnei_cont.48606:
bnei_cont.48530:
	nop
	nop
	lw	%v0, 12(%sp)
	lw	%v1, 10(%sp)

	nop
	nop
	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bnei_cont.48528

bnei_else.48527:
bnei_cont.48528:
	nop
	nop
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48613

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48614

fbgt_else.48613:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.48614:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48615

	nop
	nop
	nop
	flw	%f1, 464(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48617

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48616

fbgt_else.48617:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.48618:
	nop
	nop
	nop
	j	bnei_cont.48616

bnei_else.48615:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.48616:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48619

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 11(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.48621

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.48623

	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f3, %f0, %f3
	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f4, %f1, %f4
	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	fmul	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48625

	nop
	nop
	nop
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f7, %f1, %f6
	flw	%f8, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f9, %f2, %f8

	nop
	nop
	fadd	%f7, %f7, %f9
	flw	%f9, 471(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f9

	nop
	nop
	nop
	fadd	%f3, %f3, %f7

	fsw	%f3, 142(%zero)
	fmul	%f3, %f0, %f6
	flw	%f6, 0(%v1)
	fmul	%f0, %f0, %f8

	nop
	nop
	fmul	%f2, %f2, %f6
	fmul	%f1, %f1, %f6

	nop
	nop
	fadd	%f2, %f3, %f2
	fadd	%f0, %f0, %f1

	nop
	nop
	fmul	%f2, %f2, %f9
	fmul	%f0, %f0, %f9

	nop
	nop
	fadd	%f2, %f4, %f2
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fsw	%f2, 143(%zero)

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.48626

bnei_else.48625:
	nop
	nop
	nop
	fsw	%f3, 142(%zero)

	nop
	nop
	nop
	fsw	%f4, 143(%zero)

	nop
	nop
	nop
	fsw	%f5, 144(%zero)

bnei_cont.48626:
	nop
	nop
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)

	nop
	nop
	nop
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 3(%sp)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.48627

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48628

fbeq_else.48627:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.48628:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48629

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.48630

bnei_else.48629:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48631

	nop
	nop
	nop
	flw	%f5, 490(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.48632

bnei_else.48631:
	nop
	nop
	nop
	flw	%f5, 491(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

bnei_cont.48632:
bnei_cont.48630:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.48622

bnei_else.48623:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.48624:
	nop
	nop
	nop
	j	bnei_cont.48622

bnei_else.48621:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.48633

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48634

fbeq_else.48633:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.48634:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48635

	nop
	nop
	nop
	fmov	%f1, %f0

	nop
	nop
	nop
	j	bnei_cont.48636

bnei_else.48635:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48637

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48638

fbgt_else.48637:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.48638:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48639

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.48640

bnei_else.48639:
	nop
	nop
	nop
	flw	%f1, 490(%zero)

bnei_cont.48640:
bnei_cont.48636:
	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f1, 142(%a0)

bnei_cont.48622:
	nop
	nop
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 0(%a0)
	lw	%a0, 8(%v0)

	nop
	nop
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 2(%a0)
	sw	%v0, 14(%sp)

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.48641

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.48643

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.48645

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.48647

	nop
	nop
	nop
	j	bnei_cont.48642

bnei_else.48647:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsqrt	%f1, %f1
	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)

	nop
	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fsqrt	%f2, %f2

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	nop
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.48649

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48650

fbgt_else.48649:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.48650:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48651

	nop
	nop
	nop
	flw	%f0, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.48652

bnei_else.48651:
	nop
	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48653

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.48654

fbgt_else.48653:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.48654:
	nop
	nop
	fabs	%f3, %f0
	flw	%f5, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.48655

	nop
	nop
	nop
	flw	%f0, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.48657

	nop
	nop
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)

	nop
	fdiv	%f3, %f5, %f3
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	j	fbgt_cont.48658

fbgt_else.48657:
	nop
	nop
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)

	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f6, %f3

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

fbgt_cont.48658:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48659

	nop
	nop
	nop
	j	fbgt_cont.48656

bnei_else.48659:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.48660:
	nop
	nop
	nop
	j	fbgt_cont.48656

fbgt_else.48655:
	nop
	fmul	%f3, %f0, %f0
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f0

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f7, %f7, %f3

	nop
	nop
	fsub	%f7, %f0, %f7
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fmul	%f0, %f0, %f6

	nop
	nop
	nop
	fadd	%f0, %f3, %f0

fbgt_cont.48656:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

bnei_cont.48652:
	nop
	nop
	floor	%f1, %f0
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)

	nop
	nop
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	flw	%f3, 1(%v1)

	nop
	nop
	nop
	fsqrt	%f3, %f3

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.48661

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48662

fbgt_else.48661:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.48662:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48663

	nop
	nop
	nop
	flw	%f1, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.48664

bnei_else.48663:
	nop
	nop
	fdiv	%f1, %f1, %f2
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48665

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.48666

fbgt_else.48665:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.48666:
	nop
	nop
	fabs	%f3, %f1
	flw	%f4, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.48667

	nop
	nop
	nop
	flw	%f1, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.48669

	nop
	nop
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)

	nop
	fdiv	%f3, %f4, %f3
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fsub	%f1, %f1, %f3

	nop
	nop
	nop
	j	fbgt_cont.48670

fbgt_else.48669:
	nop
	nop
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)

	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f5, %f3

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

fbgt_cont.48670:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48671

	nop
	nop
	nop
	j	fbgt_cont.48668

bnei_else.48671:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.48672:
	nop
	nop
	nop
	j	fbgt_cont.48668

fbgt_else.48667:
	nop
	fmul	%f3, %f1, %f1
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f1

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f6, %f1, %f6
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)

	nop
	nop
	nop
	fmul	%f1, %f6, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

fbgt_cont.48668:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

bnei_cont.48664:
	nop
	nop
	floor	%f2, %f1
	flw	%f3, 471(%zero)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48673

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48674

fbgt_else.48673:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.48674:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48675

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.48676

bnei_else.48675:
bnei_cont.48676:
	nop
	nop
	nop
	flw	%f2, 450(%zero)

	nop
	nop
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f2

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.48648:
	nop
	nop
	nop
	j	bnei_cont.48642

bnei_else.48645:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)

	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 488(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 448(%zero)

	nop
	nop
	nop
	fsqrt	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f0

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)

	nop
	nop
	fabs	%f0, %f0
	fsw	%f1, 15(%sp)

	nop
	nop
	nop
	fsw	%f0, 16(%sp)

	nop
	nop
	nop
	fsw	%f2, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.48677

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48679

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48681

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48683

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48685

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48687

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48689

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48691

	nop
	nop
	nop
	flw	%f3, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48693

	nop
	nop
	nop
	flw	%f3, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48695

	nop
	nop
	nop
	flw	%f3, 478(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48697

	nop
	nop
	flw	%f3, 477(%zero)
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48697:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48698:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48695:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48696:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48693:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48694:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48691:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48692:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48689:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48690:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48687:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48688:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48685:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48686:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48683:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48684:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48681:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48682:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48679:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48680:
	nop
	nop
	nop
	j	fbgt_cont.48678

fbgt_else.48677:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.48678:
	nop
	nop
	flw	%f1, 16(%sp)
	flw	%f2, 17(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48699

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48701

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48703

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48705

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48707

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48709

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48700

fbgt_else.48709:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

fbgt_cont.48710:
	nop
	nop
	nop
	j	fbgt_cont.48700

fbgt_else.48707:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48708:
	nop
	nop
	nop
	j	fbgt_cont.48700

fbgt_else.48705:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48711

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48713

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48712

fbgt_else.48713:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

fbgt_cont.48714:
	nop
	nop
	nop
	j	fbgt_cont.48712

fbgt_else.48711:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48712:
fbgt_cont.48706:
	nop
	nop
	nop
	j	fbgt_cont.48700

fbgt_else.48703:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48704:
	nop
	nop
	nop
	j	fbgt_cont.48700

fbgt_else.48701:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48715

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48717

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48719

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48721

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48716

fbgt_else.48721:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

fbgt_cont.48722:
	nop
	nop
	nop
	j	fbgt_cont.48716

fbgt_else.48719:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48720:
	nop
	nop
	nop
	j	fbgt_cont.48716

fbgt_else.48717:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48723

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48725

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48724

fbgt_else.48725:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 18(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

fbgt_cont.48726:
	nop
	nop
	nop
	j	fbgt_cont.48724

fbgt_else.48723:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48724:
fbgt_cont.48718:
	nop
	nop
	nop
	j	fbgt_cont.48716

fbgt_else.48715:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48716:
fbgt_cont.48702:
	nop
	nop
	nop
	j	fbgt_cont.48700

fbgt_else.48699:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48700:
	nop
	nop
	nop
	flw	%f1, 15(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48727

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48728

fbgt_else.48727:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.48728:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48729

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.48730

fbgt_else.48729:
fbgt_cont.48730:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.48731

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48733

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48732

bnei_else.48733:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.48734:
	nop
	nop
	nop
	j	fbgt_cont.48732

fbgt_else.48731:
fbgt_cont.48732:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.48735

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.48736

fbgt_else.48735:
fbgt_cont.48736:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48737

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.48738

fbgt_else.48737:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.48738:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48739

	nop
	nop
	nop
	j	bnei_cont.48740

bnei_else.48739:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.48740:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	fsw	%f2, 146(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.48646:
	nop
	nop
	nop
	j	bnei_cont.48642

bnei_else.48643:
	nop
	nop
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.48741

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.48742

fbgt_else.48741:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.48742:
	nop
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 18(%sp)

	nop
	nop
	nop
	fsw	%f1, 19(%sp)

	nop
	nop
	nop
	fsw	%f0, 20(%sp)

	nop
	nop
	nop
	fsw	%f3, 21(%sp)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48743

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48745

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48747

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48749

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48751

	nop
	nop
	nop
	flw	%f4, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48753

	nop
	nop
	nop
	flw	%f4, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48755

	nop
	nop
	nop
	flw	%f4, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48757

	nop
	nop
	nop
	flw	%f4, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48759

	nop
	nop
	nop
	flw	%f4, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48761

	nop
	nop
	nop
	flw	%f4, 478(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.48763

	nop
	nop
	flw	%f4, 477(%zero)
	sw	%ra, 22(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48763:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48764:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48761:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48762:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48759:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48760:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48757:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48758:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48755:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48756:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48753:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48754:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48751:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48752:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48749:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48750:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48747:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48748:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48745:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.48746:
	nop
	nop
	nop
	j	fbgt_cont.48744

fbgt_else.48743:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48744:
	nop
	nop
	flw	%f1, 20(%sp)
	flw	%f2, 21(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48765

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48767

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48769

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48771

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48773

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48775

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 22(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48766

fbgt_else.48775:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 22(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

fbgt_cont.48776:
	nop
	nop
	nop
	j	fbgt_cont.48766

fbgt_else.48773:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48774:
	nop
	nop
	nop
	j	fbgt_cont.48766

fbgt_else.48771:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48777

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48779

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 22(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48778

fbgt_else.48779:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 22(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

fbgt_cont.48780:
	nop
	nop
	nop
	j	fbgt_cont.48778

fbgt_else.48777:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48778:
fbgt_cont.48772:
	nop
	nop
	nop
	j	fbgt_cont.48766

fbgt_else.48769:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48770:
	nop
	nop
	nop
	j	fbgt_cont.48766

fbgt_else.48767:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48781

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48783

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48785

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48787

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 22(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48782

fbgt_else.48787:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 22(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

fbgt_cont.48788:
	nop
	nop
	nop
	j	fbgt_cont.48782

fbgt_else.48785:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48786:
	nop
	nop
	nop
	j	fbgt_cont.48782

fbgt_else.48783:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48789

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48791

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 22(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48790

fbgt_else.48791:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 22(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

fbgt_cont.48792:
	nop
	nop
	nop
	j	fbgt_cont.48790

fbgt_else.48789:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48790:
fbgt_cont.48784:
	nop
	nop
	nop
	j	fbgt_cont.48782

fbgt_else.48781:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48782:
fbgt_cont.48768:
	nop
	nop
	nop
	j	fbgt_cont.48766

fbgt_else.48765:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48766:
	nop
	nop
	nop
	flw	%f1, 19(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48793

	nop
	nop
	nop
	lw	%v0, 18(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48795

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48794

bnei_else.48795:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.48796:
	nop
	nop
	nop
	j	fbgt_cont.48794

fbgt_else.48793:
	nop
	nop
	nop
	lw	%v0, 18(%sp)

fbgt_cont.48794:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48797

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.48798

fbgt_else.48797:
fbgt_cont.48798:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.48799

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.48800

fbgt_else.48799:
fbgt_cont.48800:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48801

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.48802

fbgt_else.48801:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.48802:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48803

	nop
	nop
	nop
	j	bnei_cont.48804

bnei_else.48803:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.48804:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f1, %f0

	nop
	nop
	nop
	fsw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.48644:
	nop
	nop
	nop
	j	bnei_cont.48642

bnei_else.48641:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	floor	%f2, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.48805

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48806

fbgt_else.48805:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.48806:
	nop
	nop
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)

	nop
	nop
	nop
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f1, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.48807

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48808

fbgt_else.48807:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.48808:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48809

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48811

	nop
	nop
	nop
	flw	%f0, 450(%zero)

	nop
	nop
	nop
	j	bnei_cont.48810

bnei_else.48811:
	nop
	nop
	nop
	flw	%f0, 3(%sp)

bnei_cont.48812:
	nop
	nop
	nop
	j	bnei_cont.48810

bnei_else.48809:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48813

	nop
	nop
	nop
	flw	%f0, 3(%sp)

	nop
	nop
	nop
	j	bnei_cont.48814

bnei_else.48813:
	nop
	nop
	nop
	flw	%f0, 450(%zero)

bnei_cont.48814:
bnei_cont.48810:
	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.48642:
	nop
	nop
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48815

	nop
	nop
	nop
	j	bnei_cont.48526

bnei_else.48815:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48817

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48818

fbgt_else.48817:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.48818:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48819

	nop
	nop
	nop
	j	bnei_cont.48820

bnei_else.48819:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.48820:
	nop
	nop
	flw	%f2, 9(%sp)
	lw	%v0, 14(%sp)

	nop
	fmul	%f0, %f2, %f0
	lw	%v0, 7(%v0)
	flw	%f3, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	fmul	%f3, %f0, %f3

	nop
	nop
	nop
	fadd	%f2, %f2, %f3

	nop
	nop
	nop
	fsw	%f2, 148(%zero)

	nop
	nop
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)

	nop
	nop
	nop
	fmul	%f3, %f0, %f3

	nop
	nop
	nop
	fadd	%f2, %f2, %f3

	nop
	nop
	nop
	fsw	%f2, 149(%zero)

	nop
	nop
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f3

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

bnei_cont.48816:
	nop
	nop
	nop
	j	bnei_cont.48526

bnei_else.48619:
bnei_cont.48620:
	nop
	nop
	nop
	j	bnei_cont.48526

bnei_else.48525:
	nop
	nop
	nop
	flw	%f5, 439(%zero)

	nop
	nop
	fdiv	%f0, %f0, %f5
	flw	%f5, 465(%zero)

	nop
	nop
	fsw	%f5, 137(%zero)
	fsw	%f0, 22(%sp)

	nop
	nop
	nop
	lw	%t0, 134(%zero)

	nop
	nop
	lw	%t2, 0(%t0)
	sw	%t0, 23(%sp)

	nop
	nop
	lw	%t3, 0(%t2)
	sw	%a3, 24(%sp)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.48821

	nop
	nop
	nop
	sw	%t1, 12(%sp)

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.48823

	nop
	nop
	lw	%t4, 12(%t3)
	lw	%t6, 1(%a3)

	nop
	lw	%t5, 10(%t4)
	add	%at, %t6, %t3
	lw	%t6, 1(%t4)

	nop
	nop
	flw	%f5, 0(%t5)
	flw	%f6, 1(%t5)

	nop
	nop
	flw	%f7, 2(%t5)
	lw	%t3, 0(%at)

	nop
	nop
	nop
	beqi	%t6, 1, bnei_else.48825

	nop
	nop
	nop
	beqi	%t6, 2, bnei_else.48827

	nop
	nop
	nop
	flw	%f8, 0(%t3)

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.48829

	nop
	nop
	nop
	addi	%t6, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48830

fbeq_else.48829:
	nop
	nop
	nop
	addi	%t6, %zero, 0

fbeq_cont.48830:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48831

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48826

bnei_else.48831:
	nop
	nop
	nop
	flw	%f9, 1(%t3)

	nop
	nop
	fmul	%f5, %f9, %f5
	flw	%f9, 2(%t3)

	nop
	nop
	nop
	fmul	%f6, %f9, %f6

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t3)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 3(%t5)

	nop
	nop
	fmul	%f7, %f5, %f5
	fmul	%f6, %f8, %f6

	nop
	nop
	nop
	fsub	%f6, %f7, %f6

	nop
	nop
	nop
	fblt	%f2, %f6, fbgt_else.48833

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48834

fbgt_else.48833:
	nop
	nop
	nop
	addi	%t5, %zero, 1

fbgt_cont.48834:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.48835

	nop
	nop
	nop
	lw	%t4, 6(%t4)

	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.48837

	nop
	nop
	nop
	fsqrt	%f6, %f6

	nop
	nop
	fadd	%f5, %f5, %f6
	flw	%f6, 4(%t3)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	j	bnei_cont.48838

bnei_else.48837:
	nop
	nop
	nop
	fsqrt	%f6, %f6

	nop
	nop
	fsub	%f5, %f5, %f6
	flw	%f6, 4(%t3)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

bnei_cont.48838:
	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.48836

bnei_else.48835:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48836:
bnei_cont.48832:
	nop
	nop
	nop
	j	bnei_cont.48826

bnei_else.48827:
	nop
	nop
	nop
	flw	%f5, 0(%t3)

	nop
	nop
	nop
	fblt	%f5, %f2, fbgt_else.48839

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48840

fbgt_else.48839:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.48840:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48841

	nop
	nop
	nop
	flw	%f6, 3(%t5)

	nop
	nop
	nop
	fmul	%f5, %f5, %f6

	nop
	nop
	nop
	fsw	%f5, 135(%zero)

	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.48842

bnei_else.48841:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48842:
bnei_cont.48828:
	nop
	nop
	nop
	j	bnei_cont.48826

bnei_else.48825:
	nop
	nop
	lw	%t5, 0(%a3)
	flw	%f8, 0(%t3)

	nop
	fsub	%f8, %f8, %f5
	flw	%f9, 1(%t3)
	flw	%f10, 1(%t5)

	nop
	nop
	fmul	%f8, %f8, %f9
	lw	%t6, 4(%t4)

	nop
	nop
	fmul	%f11, %f8, %f10
	flw	%f12, 1(%t6)

	nop
	nop
	nop
	fadd	%f11, %f11, %f6

	nop
	nop
	nop
	fabs	%f11, %f11

	nop
	nop
	nop
	fblt	%f11, %f12, fbgt_else.48843

	nop
	nop
	nop
	addi	%t6, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48844

fbgt_else.48843:
	nop
	nop
	nop
	addi	%t6, %zero, 1

fbgt_cont.48844:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48845

	nop
	nop
	flw	%f11, 2(%t5)
	lw	%t6, 4(%t4)

	nop
	nop
	fmul	%f11, %f8, %f11
	flw	%f13, 2(%t6)

	nop
	nop
	nop
	fadd	%f11, %f11, %f7

	nop
	nop
	nop
	fabs	%f11, %f11

	nop
	nop
	nop
	fblt	%f11, %f13, fbgt_else.48847

	nop
	nop
	nop
	addi	%t6, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48848

fbgt_else.48847:
	nop
	nop
	nop
	addi	%t6, %zero, 1

fbgt_cont.48848:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48849

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.48851

	nop
	nop
	nop
	addi	%t6, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48852

fbeq_else.48851:
	nop
	nop
	nop
	addi	%t6, %zero, 0

fbeq_cont.48852:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48853

	nop
	nop
	nop
	addi	%t6, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48846

bnei_else.48853:
	nop
	nop
	nop
	addi	%t6, %zero, 1

bnei_cont.48854:
	nop
	nop
	nop
	j	bnei_cont.48846

bnei_else.48849:
	nop
	nop
	nop
	addi	%t6, %zero, 0

bnei_cont.48850:
	nop
	nop
	nop
	j	bnei_cont.48846

bnei_else.48845:
	nop
	nop
	nop
	addi	%t6, %zero, 0

bnei_cont.48846:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48855

	nop
	nop
	nop
	fsw	%f8, 135(%zero)

	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	bnei_cont.48856

bnei_else.48855:
	nop
	nop
	flw	%f8, 2(%t3)
	flw	%f9, 3(%t3)

	nop
	fsub	%f8, %f8, %f6
	flw	%f11, 0(%t5)
	lw	%t6, 4(%t4)

	nop
	nop
	fmul	%f8, %f8, %f9
	flw	%f14, 0(%t6)

	nop
	nop
	nop
	fmul	%f13, %f8, %f11

	nop
	nop
	nop
	fadd	%f13, %f13, %f5

	nop
	nop
	nop
	fabs	%f13, %f13

	nop
	nop
	nop
	fblt	%f13, %f14, fbgt_else.48857

	nop
	nop
	nop
	addi	%t6, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48858

fbgt_else.48857:
	nop
	nop
	nop
	addi	%t6, %zero, 1

fbgt_cont.48858:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.48859

	nop
	nop
	flw	%f13, 2(%t5)
	lw	%t4, 4(%t4)

	nop
	nop
	fmul	%f13, %f8, %f13
	flw	%f15, 2(%t4)

	nop
	nop
	nop
	fadd	%f13, %f13, %f7

	nop
	nop
	nop
	fabs	%f13, %f13

	nop
	nop
	nop
	fblt	%f13, %f15, fbgt_else.48861

	nop
	nop
	nop
	addi	%t4, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48862

fbgt_else.48861:
	nop
	nop
	nop
	addi	%t4, %zero, 1

fbgt_cont.48862:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.48863

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.48865

	nop
	nop
	nop
	addi	%t4, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48866

fbeq_else.48865:
	nop
	nop
	nop
	addi	%t4, %zero, 0

fbeq_cont.48866:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.48867

	nop
	nop
	nop
	addi	%t4, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48860

bnei_else.48867:
	nop
	nop
	nop
	addi	%t4, %zero, 1

bnei_cont.48868:
	nop
	nop
	nop
	j	bnei_cont.48860

bnei_else.48863:
	nop
	nop
	nop
	addi	%t4, %zero, 0

bnei_cont.48864:
	nop
	nop
	nop
	j	bnei_cont.48860

bnei_else.48859:
	nop
	nop
	nop
	addi	%t4, %zero, 0

bnei_cont.48860:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.48869

	nop
	nop
	nop
	fsw	%f8, 135(%zero)

	nop
	nop
	nop
	addi	%t3, %zero, 2

	nop
	nop
	nop
	j	bnei_cont.48870

bnei_else.48869:
	nop
	nop
	nop
	flw	%f8, 4(%t3)

	nop
	nop
	fsub	%f7, %f8, %f7
	flw	%f8, 5(%t3)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fmul	%f9, %f7, %f11

	nop
	nop
	nop
	fadd	%f5, %f9, %f5

	nop
	nop
	nop
	fabs	%f5, %f5

	nop
	nop
	nop
	fblt	%f5, %f14, fbgt_else.48871

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48872

fbgt_else.48871:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.48872:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48873

	nop
	nop
	nop
	fmul	%f5, %f7, %f10

	nop
	nop
	nop
	fadd	%f5, %f5, %f6

	nop
	nop
	nop
	fabs	%f5, %f5

	nop
	nop
	nop
	fblt	%f5, %f12, fbgt_else.48875

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48876

fbgt_else.48875:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.48876:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48877

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.48879

	nop
	nop
	nop
	addi	%t3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48880

fbeq_else.48879:
	nop
	nop
	nop
	addi	%t3, %zero, 0

fbeq_cont.48880:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48881

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48874

bnei_else.48881:
	nop
	nop
	nop
	addi	%t3, %zero, 1

bnei_cont.48882:
	nop
	nop
	nop
	j	bnei_cont.48874

bnei_else.48877:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48878:
	nop
	nop
	nop
	j	bnei_cont.48874

bnei_else.48873:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48874:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48883

	nop
	nop
	nop
	fsw	%f7, 135(%zero)

	nop
	nop
	nop
	addi	%t3, %zero, 3

	nop
	nop
	nop
	j	bnei_cont.48884

bnei_else.48883:
	nop
	nop
	nop
	addi	%t3, %zero, 0

bnei_cont.48884:
bnei_cont.48870:
bnei_cont.48856:
bnei_cont.48826:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48885

	nop
	nop
	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.48887

	nop
	nop
	nop
	addi	%t3, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48888

fbgt_else.48887:
	nop
	nop
	nop
	addi	%t3, %zero, 1

fbgt_cont.48888:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.48889

	nop
	nop
	nop
	lw	%t3, 1(%t2)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.48891

	lw	%t3, 83(%t3)
	sw	%t2, 25(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %t3, 0
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48893

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 26(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48895

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 26(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48897

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 26(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -27
	addi	%v0, %zero, 5

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)

	nop
	nop
	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	bnei_cont.48824

bnei_else.48897:
bnei_cont.48898:
	nop
	nop
	nop
	j	bnei_cont.48824

bnei_else.48895:
bnei_cont.48896:
	nop
	nop
	nop
	j	bnei_cont.48824

bnei_else.48893:
bnei_cont.48894:
	nop
	nop
	nop
	j	bnei_cont.48824

bnei_else.48891:
bnei_cont.48892:
	nop
	nop
	nop
	j	bnei_cont.48824

bnei_else.48889:
bnei_cont.48890:
	nop
	nop
	nop
	j	bnei_cont.48824

bnei_else.48885:
bnei_cont.48886:
	nop
	nop
	nop
	j	bnei_cont.48824

bnei_else.48823:
	nop
	nop
	nop
	lw	%t3, 1(%t2)

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.48899

	lw	%t3, 83(%t3)
	sw	%t2, 25(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%v1, %t3, 0
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48901

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 26(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48903

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 26(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)

	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.48905

	nop
	nop
	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)

	nop
	lw	%a1, 24(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 26(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -27
	addi	%v0, %zero, 5

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)

	nop
	nop
	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	bnei_cont.48900

bnei_else.48905:
bnei_cont.48906:
	nop
	nop
	nop
	j	bnei_cont.48900

bnei_else.48903:
bnei_cont.48904:
	nop
	nop
	nop
	j	bnei_cont.48900

bnei_else.48901:
bnei_cont.48902:
	nop
	nop
	nop
	j	bnei_cont.48900

bnei_else.48899:
bnei_cont.48900:
bnei_cont.48824:
	nop
	nop
	lw	%v0, 12(%sp)
	lw	%v1, 23(%sp)

	nop
	nop
	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	bnei_cont.48822

bnei_else.48821:
bnei_cont.48822:
	nop
	nop
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48907

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48908

fbgt_else.48907:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.48908:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48909

	nop
	nop
	nop
	flw	%f1, 464(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48911

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.48910

fbgt_else.48911:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.48912:
	nop
	nop
	nop
	j	bnei_cont.48910

bnei_else.48909:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.48910:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.48913

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 24(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.48915

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.48917

	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f3, %f0, %f3
	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f4, %f1, %f4
	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	fmul	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48919

	nop
	nop
	nop
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f7, %f1, %f6
	flw	%f8, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f9, %f2, %f8

	nop
	nop
	fadd	%f7, %f7, %f9
	flw	%f9, 471(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f9

	nop
	nop
	nop
	fadd	%f3, %f3, %f7

	fsw	%f3, 142(%zero)
	fmul	%f3, %f0, %f6
	flw	%f6, 0(%v1)
	fmul	%f0, %f0, %f8

	nop
	nop
	fmul	%f2, %f2, %f6
	fmul	%f1, %f1, %f6

	nop
	nop
	fadd	%f2, %f3, %f2
	fadd	%f0, %f0, %f1

	nop
	nop
	fmul	%f2, %f2, %f9
	fmul	%f0, %f0, %f9

	nop
	nop
	fadd	%f2, %f4, %f2
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fsw	%f2, 143(%zero)

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.48920

bnei_else.48919:
	nop
	nop
	nop
	fsw	%f3, 142(%zero)

	nop
	nop
	nop
	fsw	%f4, 143(%zero)

	nop
	nop
	nop
	fsw	%f5, 144(%zero)

bnei_cont.48920:
	nop
	nop
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)

	nop
	nop
	nop
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 3(%sp)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.48921

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48922

fbeq_else.48921:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.48922:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48923

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.48924

bnei_else.48923:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48925

	nop
	nop
	nop
	flw	%f5, 490(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.48926

bnei_else.48925:
	nop
	nop
	nop
	flw	%f5, 491(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

bnei_cont.48926:
bnei_cont.48924:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.48916

bnei_else.48917:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.48918:
	nop
	nop
	nop
	j	bnei_cont.48916

bnei_else.48915:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.48927

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.48928

fbeq_else.48927:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.48928:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48929

	nop
	nop
	nop
	fmov	%f1, %f0

	nop
	nop
	nop
	j	bnei_cont.48930

bnei_else.48929:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48931

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48932

fbgt_else.48931:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.48932:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48933

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.48934

bnei_else.48933:
	nop
	nop
	nop
	flw	%f1, 490(%zero)

bnei_cont.48934:
bnei_cont.48930:
	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f1, 142(%a0)

bnei_cont.48916:
	nop
	nop
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 0(%a0)
	lw	%a0, 8(%v0)

	nop
	nop
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 2(%a0)
	sw	%v0, 26(%sp)

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.48935

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.48937

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.48939

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.48941

	nop
	nop
	nop
	j	bnei_cont.48936

bnei_else.48941:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsqrt	%f1, %f1
	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)

	nop
	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fsqrt	%f2, %f2

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	nop
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.48943

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48944

fbgt_else.48943:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.48944:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48945

	nop
	nop
	nop
	flw	%f0, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.48946

bnei_else.48945:
	nop
	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48947

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.48948

fbgt_else.48947:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.48948:
	nop
	nop
	fabs	%f3, %f0
	flw	%f5, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.48949

	nop
	nop
	nop
	flw	%f0, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.48951

	nop
	nop
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)

	nop
	fdiv	%f3, %f5, %f3
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	j	fbgt_cont.48952

fbgt_else.48951:
	nop
	nop
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)

	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f6, %f3

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

fbgt_cont.48952:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48953

	nop
	nop
	nop
	j	fbgt_cont.48950

bnei_else.48953:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.48954:
	nop
	nop
	nop
	j	fbgt_cont.48950

fbgt_else.48949:
	nop
	fmul	%f3, %f0, %f0
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f0

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f7, %f7, %f3

	nop
	nop
	fsub	%f7, %f0, %f7
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fmul	%f0, %f0, %f6

	nop
	nop
	nop
	fadd	%f0, %f3, %f0

fbgt_cont.48950:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

bnei_cont.48946:
	nop
	nop
	floor	%f1, %f0
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)

	nop
	nop
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	flw	%f3, 1(%v1)

	nop
	nop
	nop
	fsqrt	%f3, %f3

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.48955

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48956

fbgt_else.48955:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.48956:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48957

	nop
	nop
	nop
	flw	%f1, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.48958

bnei_else.48957:
	nop
	nop
	fdiv	%f1, %f1, %f2
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48959

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.48960

fbgt_else.48959:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.48960:
	nop
	nop
	fabs	%f3, %f1
	flw	%f4, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.48961

	nop
	nop
	nop
	flw	%f1, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.48963

	nop
	nop
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)

	nop
	fdiv	%f3, %f4, %f3
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fsub	%f1, %f1, %f3

	nop
	nop
	nop
	j	fbgt_cont.48964

fbgt_else.48963:
	nop
	nop
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)

	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f5, %f3

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

fbgt_cont.48964:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48965

	nop
	nop
	nop
	j	fbgt_cont.48962

bnei_else.48965:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.48966:
	nop
	nop
	nop
	j	fbgt_cont.48962

fbgt_else.48961:
	nop
	fmul	%f3, %f1, %f1
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f1

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f6, %f1, %f6
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)

	nop
	nop
	nop
	fmul	%f1, %f6, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

fbgt_cont.48962:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

bnei_cont.48958:
	nop
	nop
	floor	%f2, %f1
	flw	%f3, 471(%zero)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.48967

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.48968

fbgt_else.48967:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.48968:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.48969

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.48970

bnei_else.48969:
bnei_cont.48970:
	nop
	nop
	nop
	flw	%f2, 450(%zero)

	nop
	nop
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f2

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.48942:
	nop
	nop
	nop
	j	bnei_cont.48936

bnei_else.48939:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)

	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 488(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 448(%zero)

	nop
	nop
	nop
	fsqrt	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f0

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)

	nop
	nop
	fabs	%f0, %f0
	fsw	%f1, 27(%sp)

	nop
	nop
	nop
	fsw	%f0, 28(%sp)

	nop
	nop
	nop
	fsw	%f2, 29(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.48971

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48973

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48975

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48977

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48979

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48981

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48983

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48985

	nop
	nop
	nop
	flw	%f3, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48987

	nop
	nop
	nop
	flw	%f3, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48989

	nop
	nop
	nop
	flw	%f3, 478(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.48991

	nop
	nop
	flw	%f3, 477(%zero)
	sw	%ra, 30(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48991:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48992:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48989:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48990:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48987:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48988:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48985:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48986:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48983:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48984:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48981:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48982:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48979:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48980:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48977:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48978:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48975:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48976:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48973:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.48974:
	nop
	nop
	nop
	j	fbgt_cont.48972

fbgt_else.48971:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.48972:
	nop
	nop
	flw	%f1, 28(%sp)
	flw	%f2, 29(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48993

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48995

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.48997

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.48999

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49001

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49003

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 30(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

	nop
	nop
	nop
	j	fbgt_cont.48994

fbgt_else.49003:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 30(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

fbgt_cont.49004:
	nop
	nop
	nop
	j	fbgt_cont.48994

fbgt_else.49001:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49002:
	nop
	nop
	nop
	j	fbgt_cont.48994

fbgt_else.48999:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49005

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49007

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 30(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49006

fbgt_else.49007:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 30(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

fbgt_cont.49008:
	nop
	nop
	nop
	j	fbgt_cont.49006

fbgt_else.49005:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49006:
fbgt_cont.49000:
	nop
	nop
	nop
	j	fbgt_cont.48994

fbgt_else.48997:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48998:
	nop
	nop
	nop
	j	fbgt_cont.48994

fbgt_else.48995:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49009

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49011

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49013

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49015

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 30(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49010

fbgt_else.49015:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 30(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

fbgt_cont.49016:
	nop
	nop
	nop
	j	fbgt_cont.49010

fbgt_else.49013:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49014:
	nop
	nop
	nop
	j	fbgt_cont.49010

fbgt_else.49011:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49017

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49019

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 30(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49018

fbgt_else.49019:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 30(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

fbgt_cont.49020:
	nop
	nop
	nop
	j	fbgt_cont.49018

fbgt_else.49017:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49018:
fbgt_cont.49012:
	nop
	nop
	nop
	j	fbgt_cont.49010

fbgt_else.49009:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49010:
fbgt_cont.48996:
	nop
	nop
	nop
	j	fbgt_cont.48994

fbgt_else.48993:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.48994:
	nop
	nop
	nop
	flw	%f1, 27(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49021

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49022

fbgt_else.49021:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49022:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49023

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.49024

fbgt_else.49023:
fbgt_cont.49024:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49025

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49027

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49026

bnei_else.49027:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.49028:
	nop
	nop
	nop
	j	fbgt_cont.49026

fbgt_else.49025:
fbgt_cont.49026:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49029

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.49030

fbgt_else.49029:
fbgt_cont.49030:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49031

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.49032

fbgt_else.49031:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.49032:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49033

	nop
	nop
	nop
	j	bnei_cont.49034

bnei_else.49033:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49034:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	fsw	%f2, 146(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.48940:
	nop
	nop
	nop
	j	bnei_cont.48936

bnei_else.48937:
	nop
	nop
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49035

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49036

fbgt_else.49035:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49036:
	nop
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 30(%sp)

	nop
	nop
	nop
	fsw	%f1, 31(%sp)

	nop
	nop
	nop
	fsw	%f0, 32(%sp)

	nop
	nop
	nop
	fsw	%f3, 33(%sp)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49037

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49039

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49041

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49043

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49045

	nop
	nop
	nop
	flw	%f4, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49047

	nop
	nop
	nop
	flw	%f4, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49049

	nop
	nop
	nop
	flw	%f4, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49051

	nop
	nop
	nop
	flw	%f4, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49053

	nop
	nop
	nop
	flw	%f4, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49055

	nop
	nop
	nop
	flw	%f4, 478(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49057

	nop
	nop
	flw	%f4, 477(%zero)
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49057:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49058:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49055:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49056:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49053:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49054:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49051:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49052:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49049:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49050:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49047:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49048:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49045:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49046:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49043:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49044:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49041:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49042:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49039:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49040:
	nop
	nop
	nop
	j	fbgt_cont.49038

fbgt_else.49037:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49038:
	nop
	nop
	flw	%f1, 32(%sp)
	flw	%f2, 33(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49059

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49061

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49063

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49065

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49067

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49069

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49060

fbgt_else.49069:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

fbgt_cont.49070:
	nop
	nop
	nop
	j	fbgt_cont.49060

fbgt_else.49067:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49068:
	nop
	nop
	nop
	j	fbgt_cont.49060

fbgt_else.49065:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49071

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49073

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49072

fbgt_else.49073:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

fbgt_cont.49074:
	nop
	nop
	nop
	j	fbgt_cont.49072

fbgt_else.49071:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49072:
fbgt_cont.49066:
	nop
	nop
	nop
	j	fbgt_cont.49060

fbgt_else.49063:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49064:
	nop
	nop
	nop
	j	fbgt_cont.49060

fbgt_else.49061:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49075

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49077

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49079

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49081

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49076

fbgt_else.49081:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

fbgt_cont.49082:
	nop
	nop
	nop
	j	fbgt_cont.49076

fbgt_else.49079:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49080:
	nop
	nop
	nop
	j	fbgt_cont.49076

fbgt_else.49077:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49083

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49085

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49084

fbgt_else.49085:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 34(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

fbgt_cont.49086:
	nop
	nop
	nop
	j	fbgt_cont.49084

fbgt_else.49083:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49084:
fbgt_cont.49078:
	nop
	nop
	nop
	j	fbgt_cont.49076

fbgt_else.49075:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49076:
fbgt_cont.49062:
	nop
	nop
	nop
	j	fbgt_cont.49060

fbgt_else.49059:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49060:
	nop
	nop
	nop
	flw	%f1, 31(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49087

	nop
	nop
	nop
	lw	%v0, 30(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49089

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49088

bnei_else.49089:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.49090:
	nop
	nop
	nop
	j	fbgt_cont.49088

fbgt_else.49087:
	nop
	nop
	nop
	lw	%v0, 30(%sp)

fbgt_cont.49088:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49091

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.49092

fbgt_else.49091:
fbgt_cont.49092:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49093

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.49094

fbgt_else.49093:
fbgt_cont.49094:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49095

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.49096

fbgt_else.49095:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.49096:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49097

	nop
	nop
	nop
	j	bnei_cont.49098

bnei_else.49097:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49098:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f1, %f0

	nop
	nop
	nop
	fsw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.48938:
	nop
	nop
	nop
	j	bnei_cont.48936

bnei_else.48935:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	floor	%f2, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49099

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49100

fbgt_else.49099:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49100:
	nop
	nop
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)

	nop
	nop
	nop
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f1, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49101

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49102

fbgt_else.49101:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.49102:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49103

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49105

	nop
	nop
	nop
	flw	%f0, 450(%zero)

	nop
	nop
	nop
	j	bnei_cont.49104

bnei_else.49105:
	nop
	nop
	nop
	flw	%f0, 3(%sp)

bnei_cont.49106:
	nop
	nop
	nop
	j	bnei_cont.49104

bnei_else.49103:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49107

	nop
	nop
	nop
	flw	%f0, 3(%sp)

	nop
	nop
	nop
	j	bnei_cont.49108

bnei_else.49107:
	nop
	nop
	nop
	flw	%f0, 450(%zero)

bnei_cont.49108:
bnei_cont.49104:
	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.48936:
	nop
	nop
	lw	%v0, 2(%sp)
	lw	%v1, 23(%sp)

	nop
	nop
	nop
	sw	%ra, 34(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49109

	nop
	nop
	nop
	j	bnei_cont.48914

bnei_else.49109:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49111

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49112

fbgt_else.49111:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49112:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49113

	nop
	nop
	nop
	j	bnei_cont.49114

bnei_else.49113:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.49114:
	nop
	nop
	flw	%f2, 22(%sp)
	lw	%v0, 26(%sp)

	nop
	fmul	%f0, %f2, %f0
	lw	%v0, 7(%v0)
	flw	%f3, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f2
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	fmul	%f3, %f0, %f3

	nop
	nop
	nop
	fadd	%f2, %f2, %f3

	nop
	nop
	nop
	fsw	%f2, 148(%zero)

	nop
	nop
	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)

	nop
	nop
	nop
	fmul	%f3, %f0, %f3

	nop
	nop
	nop
	fadd	%f2, %f2, %f3

	nop
	nop
	nop
	fsw	%f2, 149(%zero)

	nop
	nop
	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f3

	nop
	nop
	nop
	fadd	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

bnei_cont.49110:
	nop
	nop
	nop
	j	bnei_cont.48914

bnei_else.48913:
bnei_cont.48914:
bnei_cont.48526:
	nop
	nop
	nop
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -2

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.49115

	nop
	nop
	lw	%v1, 7(%sp)
	flw	%f1, 6(%sp)

	nop
	nop
	add	%at, %v1, %v0
	flw	%f2, 5(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a1, 0(%a0)

	nop
	nop
	nop
	flw	%f0, 0(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a1)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 4(%sp)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49116

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49117

fbgt_else.49116:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.49117:
	nop
	nop
	nop
	sw	%v0, 34(%sp)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.49118

	nop
	addi	%a0, %v0, 1
	flw	%f2, 440(%zero)
	lw	%a2, 2(%sp)

	nop
	add	%at, %v1, %a0
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)

	nop
	lw	%a0, 0(%at)
	fsw	%f2, 137(%zero)
	addi	%v0, %a2, 0

	nop
	nop
	lw	%a1, 134(%zero)
	fsw	%f0, 35(%sp)

	nop
	nop
	sw	%a1, 36(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	nop
	sw	%a0, 37(%sp)

	nop
	nop
	nop
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	addi	%sp, %sp, -39
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	lw	%ra, 38(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49120

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49121

fbgt_else.49120:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49121:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49122

	nop
	nop
	nop
	flw	%f1, 464(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49124

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.49123

fbgt_else.49124:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49125:
	nop
	nop
	nop
	j	bnei_cont.49123

bnei_else.49122:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.49123:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49126

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 37(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.49128

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.49130

	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f3, %f0, %f3
	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f4, %f1, %f4
	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	fmul	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49132

	nop
	nop
	nop
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f6, %f1, %f6
	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f7, %f2, %f7

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f3, %f3, %f6

	nop
	nop
	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)

	nop
	nop
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f6

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f7

	nop
	nop
	nop
	fadd	%f2, %f4, %f2

	nop
	nop
	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)

	nop
	nop
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	flw	%f2, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f7

	nop
	nop
	nop
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.49133

bnei_else.49132:
	nop
	nop
	nop
	fsw	%f3, 142(%zero)

	nop
	nop
	nop
	fsw	%f4, 143(%zero)

	nop
	nop
	nop
	fsw	%f5, 144(%zero)

bnei_cont.49133:
	nop
	nop
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)

	nop
	nop
	nop
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 3(%sp)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.49134

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.49135

fbeq_else.49134:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.49135:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49136

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.49137

bnei_else.49136:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49138

	nop
	nop
	nop
	flw	%f5, 490(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.49139

bnei_else.49138:
	nop
	nop
	nop
	flw	%f5, 491(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

bnei_cont.49139:
bnei_cont.49137:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.49129

bnei_else.49130:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.49131:
	nop
	nop
	nop
	j	bnei_cont.49129

bnei_else.49128:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.49140

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.49141

fbeq_else.49140:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.49141:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49142

	nop
	nop
	nop
	fmov	%f1, %f0

	nop
	nop
	nop
	j	bnei_cont.49143

bnei_else.49142:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49144

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49145

fbgt_else.49144:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49145:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49146

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.49147

bnei_else.49146:
	nop
	nop
	nop
	flw	%f1, 490(%zero)

bnei_cont.49147:
bnei_cont.49143:
	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f1, 142(%a0)

bnei_cont.49129:
	nop
	nop
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 0(%a0)
	lw	%a0, 8(%v0)

	nop
	nop
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 2(%a0)
	sw	%v0, 38(%sp)

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.49148

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.49150

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.49152

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.49154

	nop
	nop
	nop
	j	bnei_cont.49149

bnei_else.49154:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsqrt	%f1, %f1
	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)

	nop
	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fsqrt	%f2, %f2

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	nop
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49156

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49157

fbgt_else.49156:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49157:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49158

	nop
	nop
	nop
	flw	%f0, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.49159

bnei_else.49158:
	nop
	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49160

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49161

fbgt_else.49160:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49161:
	nop
	nop
	fabs	%f3, %f0
	flw	%f5, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.49162

	nop
	nop
	nop
	flw	%f0, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.49164

	nop
	nop
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)

	nop
	fdiv	%f3, %f5, %f3
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	j	fbgt_cont.49165

fbgt_else.49164:
	nop
	nop
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)

	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f6, %f3

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

fbgt_cont.49165:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49166

	nop
	nop
	nop
	j	fbgt_cont.49163

bnei_else.49166:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49167:
	nop
	nop
	nop
	j	fbgt_cont.49163

fbgt_else.49162:
	nop
	fmul	%f3, %f0, %f0
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f0

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f7, %f7, %f3

	nop
	nop
	fsub	%f7, %f0, %f7
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fmul	%f0, %f0, %f6

	nop
	nop
	nop
	fadd	%f0, %f3, %f0

fbgt_cont.49163:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

bnei_cont.49159:
	nop
	nop
	floor	%f1, %f0
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)

	nop
	nop
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	flw	%f3, 1(%v1)

	nop
	nop
	nop
	fsqrt	%f3, %f3

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49168

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49169

fbgt_else.49168:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49169:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49170

	nop
	nop
	nop
	flw	%f1, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.49171

bnei_else.49170:
	nop
	nop
	fdiv	%f1, %f1, %f2
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49172

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49173

fbgt_else.49172:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49173:
	nop
	nop
	fabs	%f3, %f1
	flw	%f4, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49174

	nop
	nop
	nop
	flw	%f1, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.49176

	nop
	nop
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)

	nop
	fdiv	%f3, %f4, %f3
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fsub	%f1, %f1, %f3

	nop
	nop
	nop
	j	fbgt_cont.49177

fbgt_else.49176:
	nop
	nop
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)

	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f5, %f3

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

fbgt_cont.49177:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49178

	nop
	nop
	nop
	j	fbgt_cont.49175

bnei_else.49178:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.49179:
	nop
	nop
	nop
	j	fbgt_cont.49175

fbgt_else.49174:
	nop
	fmul	%f3, %f1, %f1
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f1

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f6, %f1, %f6
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)

	nop
	nop
	nop
	fmul	%f1, %f6, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

fbgt_cont.49175:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

bnei_cont.49171:
	nop
	nop
	floor	%f2, %f1
	flw	%f3, 471(%zero)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49180

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49181

fbgt_else.49180:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49181:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49182

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.49183

bnei_else.49182:
bnei_cont.49183:
	nop
	nop
	nop
	flw	%f2, 450(%zero)

	nop
	nop
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f2

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.49155:
	nop
	nop
	nop
	j	bnei_cont.49149

bnei_else.49152:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)

	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 488(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 448(%zero)

	nop
	nop
	nop
	fsqrt	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f0

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)

	nop
	nop
	fabs	%f0, %f0
	fsw	%f1, 39(%sp)

	nop
	nop
	nop
	fsw	%f0, 40(%sp)

	nop
	nop
	nop
	fsw	%f2, 41(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49184

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49186

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49188

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49190

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49192

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49194

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49196

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49198

	nop
	nop
	nop
	flw	%f3, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49200

	nop
	nop
	nop
	flw	%f3, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49202

	nop
	nop
	flw	%f3, 478(%zero)
	sw	%ra, 42(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	nop
	lw	%ra, 42(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49202:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49203:
	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49200:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49201:
	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49198:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49199:
	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49196:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49197:
	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49194:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49195:
	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49192:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49193:
	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49190:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49191:
	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49188:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49189:
	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49186:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49187:
	nop
	nop
	nop
	j	fbgt_cont.49185

fbgt_else.49184:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.49185:
	nop
	nop
	flw	%f1, 40(%sp)
	flw	%f2, 41(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49204

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49206

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49208

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49210

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 42(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	nop
	lw	%ra, 42(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49205

fbgt_else.49210:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 42(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	nop
	lw	%ra, 42(%sp)

fbgt_cont.49211:
	nop
	nop
	nop
	j	fbgt_cont.49205

fbgt_else.49208:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49209:
	nop
	nop
	nop
	j	fbgt_cont.49205

fbgt_else.49206:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49212

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49214

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 42(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	nop
	lw	%ra, 42(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49213

fbgt_else.49214:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 42(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	nop
	lw	%ra, 42(%sp)

fbgt_cont.49215:
	nop
	nop
	nop
	j	fbgt_cont.49213

fbgt_else.49212:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49213:
fbgt_cont.49207:
	nop
	nop
	nop
	j	fbgt_cont.49205

fbgt_else.49204:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49205:
	nop
	nop
	nop
	flw	%f1, 39(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49216

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49217

fbgt_else.49216:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49217:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49218

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.49219

fbgt_else.49218:
fbgt_cont.49219:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49220

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49222

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49221

bnei_else.49222:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.49223:
	nop
	nop
	nop
	j	fbgt_cont.49221

fbgt_else.49220:
fbgt_cont.49221:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49224

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.49225

fbgt_else.49224:
fbgt_cont.49225:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49226

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.49227

fbgt_else.49226:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.49227:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49228

	nop
	nop
	nop
	j	bnei_cont.49229

bnei_else.49228:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49229:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	fsw	%f2, 146(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.49153:
	nop
	nop
	nop
	j	bnei_cont.49149

bnei_else.49150:
	nop
	nop
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49230

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49231

fbgt_else.49230:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49231:
	nop
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 42(%sp)

	nop
	nop
	nop
	fsw	%f1, 43(%sp)

	nop
	nop
	nop
	fsw	%f0, 44(%sp)

	nop
	nop
	nop
	fsw	%f3, 45(%sp)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49232

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49234

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49236

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49238

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49240

	nop
	nop
	nop
	flw	%f4, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49242

	nop
	nop
	nop
	flw	%f4, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49244

	nop
	nop
	nop
	flw	%f4, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49246

	nop
	nop
	nop
	flw	%f4, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49248

	nop
	nop
	nop
	flw	%f4, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49250

	nop
	nop
	flw	%f4, 478(%zero)
	sw	%ra, 46(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	nop
	lw	%ra, 46(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49250:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49251:
	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49248:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49249:
	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49246:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49247:
	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49244:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49245:
	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49242:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49243:
	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49240:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49241:
	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49238:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49239:
	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49236:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49237:
	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49234:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49235:
	nop
	nop
	nop
	j	fbgt_cont.49233

fbgt_else.49232:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49233:
	nop
	nop
	flw	%f1, 44(%sp)
	flw	%f2, 45(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49252

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49254

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49256

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49258

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 46(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	nop
	lw	%ra, 46(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49253

fbgt_else.49258:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 46(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	nop
	lw	%ra, 46(%sp)

fbgt_cont.49259:
	nop
	nop
	nop
	j	fbgt_cont.49253

fbgt_else.49256:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49257:
	nop
	nop
	nop
	j	fbgt_cont.49253

fbgt_else.49254:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49260

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49262

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 46(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	nop
	lw	%ra, 46(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49261

fbgt_else.49262:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 46(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	nop
	lw	%ra, 46(%sp)

fbgt_cont.49263:
	nop
	nop
	nop
	j	fbgt_cont.49261

fbgt_else.49260:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49261:
fbgt_cont.49255:
	nop
	nop
	nop
	j	fbgt_cont.49253

fbgt_else.49252:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49253:
	nop
	nop
	nop
	flw	%f1, 43(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49264

	nop
	nop
	nop
	lw	%v0, 42(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49266

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49265

bnei_else.49266:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.49267:
	nop
	nop
	nop
	j	fbgt_cont.49265

fbgt_else.49264:
	nop
	nop
	nop
	lw	%v0, 42(%sp)

fbgt_cont.49265:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49268

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.49269

fbgt_else.49268:
fbgt_cont.49269:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49270

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.49271

fbgt_else.49270:
fbgt_cont.49271:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49272

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.49273

fbgt_else.49272:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.49273:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49274

	nop
	nop
	nop
	j	bnei_cont.49275

bnei_else.49274:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49275:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f1, %f0

	nop
	nop
	nop
	fsw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.49151:
	nop
	nop
	nop
	j	bnei_cont.49149

bnei_else.49148:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	floor	%f2, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49276

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49277

fbgt_else.49276:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49277:
	nop
	nop
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)

	nop
	nop
	nop
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f1, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49278

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49279

fbgt_else.49278:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.49279:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49280

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49282

	nop
	nop
	nop
	flw	%f0, 450(%zero)

	nop
	nop
	nop
	j	bnei_cont.49281

bnei_else.49282:
	nop
	nop
	nop
	flw	%f0, 3(%sp)

bnei_cont.49283:
	nop
	nop
	nop
	j	bnei_cont.49281

bnei_else.49280:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49284

	nop
	nop
	nop
	flw	%f0, 3(%sp)

	nop
	nop
	nop
	j	bnei_cont.49285

bnei_else.49284:
	nop
	nop
	nop
	flw	%f0, 450(%zero)

bnei_cont.49285:
bnei_cont.49281:
	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.49149:
	nop
	nop
	lw	%v0, 2(%sp)
	lw	%v1, 36(%sp)

	nop
	nop
	nop
	sw	%ra, 46(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	nop
	lw	%ra, 46(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49286

	nop
	nop
	nop
	j	bnei_cont.49119

bnei_else.49286:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49288

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49289

fbgt_else.49288:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49289:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49290

	nop
	nop
	nop
	j	bnei_cont.49291

bnei_else.49290:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.49291:
	nop
	nop
	flw	%f1, 35(%sp)
	lw	%v0, 38(%sp)

	nop
	fmul	%f0, %f1, %f0
	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f1, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 148(%zero)

	nop
	nop
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 149(%zero)

	nop
	nop
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

bnei_cont.49287:
	nop
	nop
	nop
	j	bnei_cont.49119

bnei_else.49126:
bnei_cont.49127:
	nop
	nop
	nop
	j	bnei_cont.49119

bnei_else.49118:
	nop
	nop
	flw	%f2, 439(%zero)
	lw	%a2, 2(%sp)

	nop
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f2, 137(%zero)
	fsw	%f0, 46(%sp)

	nop
	nop
	nop
	lw	%a1, 134(%zero)

	nop
	nop
	sw	%a1, 47(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	nop
	sw	%a0, 48(%sp)

	nop
	nop
	nop
	sw	%ra, 49(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 50

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	addi	%sp, %sp, -50
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	lw	%ra, 49(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49292

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49293

fbgt_else.49292:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49293:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49294

	nop
	nop
	nop
	flw	%f1, 464(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49296

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.49295

fbgt_else.49296:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49297:
	nop
	nop
	nop
	j	bnei_cont.49295

bnei_else.49294:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.49295:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49298

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 48(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.49300

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.49302

	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f3, %f0, %f3
	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f4, %f1, %f4
	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	fmul	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49304

	nop
	nop
	nop
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f6, %f1, %f6
	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f7, %f2, %f7

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f3, %f3, %f6

	nop
	nop
	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)

	nop
	nop
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f6

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f7

	nop
	nop
	nop
	fadd	%f2, %f4, %f2

	nop
	nop
	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)

	nop
	nop
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	flw	%f2, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f7

	nop
	nop
	nop
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.49305

bnei_else.49304:
	nop
	nop
	nop
	fsw	%f3, 142(%zero)

	nop
	nop
	nop
	fsw	%f4, 143(%zero)

	nop
	nop
	nop
	fsw	%f5, 144(%zero)

bnei_cont.49305:
	nop
	nop
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)

	nop
	nop
	nop
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 3(%sp)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.49306

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.49307

fbeq_else.49306:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.49307:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49308

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.49309

bnei_else.49308:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49310

	nop
	nop
	nop
	flw	%f5, 490(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.49311

bnei_else.49310:
	nop
	nop
	nop
	flw	%f5, 491(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

bnei_cont.49311:
bnei_cont.49309:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.49301

bnei_else.49302:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.49303:
	nop
	nop
	nop
	j	bnei_cont.49301

bnei_else.49300:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.49312

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.49313

fbeq_else.49312:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.49313:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49314

	nop
	nop
	nop
	fmov	%f1, %f0

	nop
	nop
	nop
	j	bnei_cont.49315

bnei_else.49314:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49316

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49317

fbgt_else.49316:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49317:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49318

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.49319

bnei_else.49318:
	nop
	nop
	nop
	flw	%f1, 490(%zero)

bnei_cont.49319:
bnei_cont.49315:
	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f1, 142(%a0)

bnei_cont.49301:
	nop
	nop
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 0(%a0)
	lw	%a0, 8(%v0)

	nop
	nop
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 2(%a0)
	sw	%v0, 49(%sp)

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.49320

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.49322

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.49324

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.49326

	nop
	nop
	nop
	j	bnei_cont.49321

bnei_else.49326:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsqrt	%f1, %f1
	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)

	nop
	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fsqrt	%f2, %f2

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	nop
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49328

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49329

fbgt_else.49328:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49329:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49330

	nop
	nop
	nop
	flw	%f0, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.49331

bnei_else.49330:
	nop
	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49332

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49333

fbgt_else.49332:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49333:
	nop
	nop
	fabs	%f3, %f0
	flw	%f5, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.49334

	nop
	nop
	nop
	flw	%f0, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.49336

	nop
	nop
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)

	nop
	fdiv	%f3, %f5, %f3
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	j	fbgt_cont.49337

fbgt_else.49336:
	nop
	nop
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)

	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f6, %f3

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

fbgt_cont.49337:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49338

	nop
	nop
	nop
	j	fbgt_cont.49335

bnei_else.49338:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49339:
	nop
	nop
	nop
	j	fbgt_cont.49335

fbgt_else.49334:
	nop
	fmul	%f3, %f0, %f0
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f0

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f7, %f7, %f3

	nop
	nop
	fsub	%f7, %f0, %f7
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fmul	%f0, %f0, %f6

	nop
	nop
	nop
	fadd	%f0, %f3, %f0

fbgt_cont.49335:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

bnei_cont.49331:
	nop
	nop
	floor	%f1, %f0
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)

	nop
	nop
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	flw	%f3, 1(%v1)

	nop
	nop
	nop
	fsqrt	%f3, %f3

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49340

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49341

fbgt_else.49340:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49341:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49342

	nop
	nop
	nop
	flw	%f1, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.49343

bnei_else.49342:
	nop
	nop
	fdiv	%f1, %f1, %f2
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49344

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49345

fbgt_else.49344:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49345:
	nop
	nop
	fabs	%f3, %f1
	flw	%f4, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49346

	nop
	nop
	nop
	flw	%f1, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.49348

	nop
	nop
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)

	nop
	fdiv	%f3, %f4, %f3
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fsub	%f1, %f1, %f3

	nop
	nop
	nop
	j	fbgt_cont.49349

fbgt_else.49348:
	nop
	nop
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)

	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f5, %f3

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

fbgt_cont.49349:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49350

	nop
	nop
	nop
	j	fbgt_cont.49347

bnei_else.49350:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.49351:
	nop
	nop
	nop
	j	fbgt_cont.49347

fbgt_else.49346:
	nop
	fmul	%f3, %f1, %f1
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f1

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f6, %f1, %f6
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)

	nop
	nop
	nop
	fmul	%f1, %f6, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

fbgt_cont.49347:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

bnei_cont.49343:
	nop
	nop
	floor	%f2, %f1
	flw	%f3, 471(%zero)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49352

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49353

fbgt_else.49352:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49353:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49354

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.49355

bnei_else.49354:
bnei_cont.49355:
	nop
	nop
	nop
	flw	%f2, 450(%zero)

	nop
	nop
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f2

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.49327:
	nop
	nop
	nop
	j	bnei_cont.49321

bnei_else.49324:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)

	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 488(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 448(%zero)

	nop
	nop
	nop
	fsqrt	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f0

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)

	nop
	nop
	fabs	%f0, %f0
	fsw	%f1, 50(%sp)

	nop
	nop
	nop
	fsw	%f0, 51(%sp)

	nop
	nop
	nop
	fsw	%f2, 52(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49356

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49358

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49360

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49362

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49364

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49366

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49368

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49370

	nop
	nop
	nop
	flw	%f3, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49372

	nop
	nop
	nop
	flw	%f3, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49374

	nop
	nop
	flw	%f3, 478(%zero)
	sw	%ra, 53(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -54

	nop
	nop
	nop
	lw	%ra, 53(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49374:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49375:
	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49372:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49373:
	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49370:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49371:
	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49368:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49369:
	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49366:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49367:
	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49364:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49365:
	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49362:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49363:
	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49360:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49361:
	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49358:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49359:
	nop
	nop
	nop
	j	fbgt_cont.49357

fbgt_else.49356:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.49357:
	nop
	nop
	flw	%f1, 51(%sp)
	flw	%f2, 52(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49376

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49378

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49380

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49382

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 53(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -54

	nop
	nop
	nop
	lw	%ra, 53(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49377

fbgt_else.49382:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 53(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -54

	nop
	nop
	nop
	lw	%ra, 53(%sp)

fbgt_cont.49383:
	nop
	nop
	nop
	j	fbgt_cont.49377

fbgt_else.49380:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49381:
	nop
	nop
	nop
	j	fbgt_cont.49377

fbgt_else.49378:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49384

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49386

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 53(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -54

	nop
	nop
	nop
	lw	%ra, 53(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49385

fbgt_else.49386:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 53(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 54

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -54

	nop
	nop
	nop
	lw	%ra, 53(%sp)

fbgt_cont.49387:
	nop
	nop
	nop
	j	fbgt_cont.49385

fbgt_else.49384:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49385:
fbgt_cont.49379:
	nop
	nop
	nop
	j	fbgt_cont.49377

fbgt_else.49376:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49377:
	nop
	nop
	nop
	flw	%f1, 50(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49388

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49389

fbgt_else.49388:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49389:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49390

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.49391

fbgt_else.49390:
fbgt_cont.49391:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49392

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49394

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49393

bnei_else.49394:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.49395:
	nop
	nop
	nop
	j	fbgt_cont.49393

fbgt_else.49392:
fbgt_cont.49393:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49396

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.49397

fbgt_else.49396:
fbgt_cont.49397:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49398

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.49399

fbgt_else.49398:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.49399:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49400

	nop
	nop
	nop
	j	bnei_cont.49401

bnei_else.49400:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49401:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	fsw	%f2, 146(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.49325:
	nop
	nop
	nop
	j	bnei_cont.49321

bnei_else.49322:
	nop
	nop
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49402

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49403

fbgt_else.49402:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49403:
	nop
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 53(%sp)

	nop
	nop
	nop
	fsw	%f1, 54(%sp)

	nop
	nop
	nop
	fsw	%f0, 55(%sp)

	nop
	nop
	nop
	fsw	%f3, 56(%sp)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49404

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49406

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49408

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49410

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49412

	nop
	nop
	nop
	flw	%f4, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49414

	nop
	nop
	nop
	flw	%f4, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49416

	nop
	nop
	nop
	flw	%f4, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49418

	nop
	nop
	nop
	flw	%f4, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49420

	nop
	nop
	nop
	flw	%f4, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49422

	nop
	nop
	flw	%f4, 478(%zero)
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49422:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49423:
	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49420:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49421:
	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49418:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49419:
	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49416:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49417:
	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49414:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49415:
	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49412:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49413:
	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49410:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49411:
	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49408:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49409:
	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49406:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49407:
	nop
	nop
	nop
	j	fbgt_cont.49405

fbgt_else.49404:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49405:
	nop
	nop
	flw	%f1, 55(%sp)
	flw	%f2, 56(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49424

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49426

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49428

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49430

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49425

fbgt_else.49430:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

fbgt_cont.49431:
	nop
	nop
	nop
	j	fbgt_cont.49425

fbgt_else.49428:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49429:
	nop
	nop
	nop
	j	fbgt_cont.49425

fbgt_else.49426:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49432

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49434

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49433

fbgt_else.49434:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 57(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

fbgt_cont.49435:
	nop
	nop
	nop
	j	fbgt_cont.49433

fbgt_else.49432:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49433:
fbgt_cont.49427:
	nop
	nop
	nop
	j	fbgt_cont.49425

fbgt_else.49424:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49425:
	nop
	nop
	nop
	flw	%f1, 54(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49436

	nop
	nop
	nop
	lw	%v0, 53(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49438

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49437

bnei_else.49438:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.49439:
	nop
	nop
	nop
	j	fbgt_cont.49437

fbgt_else.49436:
	nop
	nop
	nop
	lw	%v0, 53(%sp)

fbgt_cont.49437:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49440

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.49441

fbgt_else.49440:
fbgt_cont.49441:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49442

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.49443

fbgt_else.49442:
fbgt_cont.49443:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49444

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.49445

fbgt_else.49444:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.49445:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49446

	nop
	nop
	nop
	j	bnei_cont.49447

bnei_else.49446:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49447:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f1, %f0

	nop
	nop
	nop
	fsw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.49323:
	nop
	nop
	nop
	j	bnei_cont.49321

bnei_else.49320:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	floor	%f2, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49448

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49449

fbgt_else.49448:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49449:
	nop
	nop
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)

	nop
	nop
	nop
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f1, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49450

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49451

fbgt_else.49450:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.49451:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49452

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49454

	nop
	nop
	nop
	flw	%f0, 450(%zero)

	nop
	nop
	nop
	j	bnei_cont.49453

bnei_else.49454:
	nop
	nop
	nop
	flw	%f0, 3(%sp)

bnei_cont.49455:
	nop
	nop
	nop
	j	bnei_cont.49453

bnei_else.49452:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49456

	nop
	nop
	nop
	flw	%f0, 3(%sp)

	nop
	nop
	nop
	j	bnei_cont.49457

bnei_else.49456:
	nop
	nop
	nop
	flw	%f0, 450(%zero)

bnei_cont.49457:
bnei_cont.49453:
	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.49321:
	nop
	nop
	lw	%v0, 2(%sp)
	lw	%v1, 47(%sp)

	nop
	nop
	nop
	sw	%ra, 57(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 58

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	nop
	addi	%sp, %sp, -58

	nop
	nop
	nop
	lw	%ra, 57(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49458

	nop
	nop
	nop
	j	bnei_cont.49299

bnei_else.49458:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 3(%sp)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49460

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49461

fbgt_else.49460:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49461:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49462

	nop
	nop
	nop
	j	bnei_cont.49463

bnei_else.49462:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.49463:
	nop
	nop
	flw	%f1, 46(%sp)
	lw	%v0, 49(%sp)

	nop
	fmul	%f0, %f1, %f0
	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f1, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 148(%zero)

	nop
	nop
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 149(%zero)

	nop
	nop
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

bnei_cont.49459:
	nop
	nop
	nop
	j	bnei_cont.49299

bnei_else.49298:
bnei_cont.49299:
bnei_cont.49119:
	nop
	nop
	lw	%v0, 34(%sp)
	lw	%v1, 1(%sp)

	nop
	addi	%a1, %v0, -2
	lw	%v0, 7(%sp)
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	iter_trace_diffuse_rays.2980

bgti_else.49115:
	nop
	nop
	nop
	jr	%ra

bgti_else.48522:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_rays.2985:
	nop
	addi	%a1, %zero, 0
	flw	%f0, 0(%a0)
	sw	%a0, 0(%sp)

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%a1, 1(%sp)

	nop
	nop
	lw	%a2, 0(%zero)
	sw	%v1, 2(%sp)

	nop
	addi	%a2, %a2, -1
	sw	%v0, 3(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	addi	%v1, %a2, 0
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	nop
	addi	%sp, %sp, -5

	nop
	nop
	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	lw	%a0, 118(%v0)
	lw	%a1, 2(%sp)

	nop
	nop
	lw	%v1, 0(%a0)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 493(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49713

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49714

fbgt_else.49713:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49714:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49715

	nop
	nop
	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)

	nop
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	lw	%a2, 1(%sp)

	nop
	fsw	%f2, 137(%zero)
	fsw	%f0, 4(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	nop
	lw	%v1, 134(%zero)

	nop
	nop
	nop
	sw	%v1, 5(%sp)

	nop
	nop
	nop
	fsw	%f1, 6(%sp)

	nop
	nop
	nop
	sw	%a0, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	addi	%sp, %sp, -9
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49717

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49718

fbgt_else.49717:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49718:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49719

	nop
	nop
	nop
	flw	%f1, 464(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49721

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.49720

fbgt_else.49721:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49722:
	nop
	nop
	nop
	j	bnei_cont.49720

bnei_else.49719:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.49720:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49723

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 7(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.49725

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.49727

	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f3, %f0, %f3
	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f4, %f1, %f4
	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	fmul	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49729

	nop
	nop
	nop
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f6, %f1, %f6
	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f7, %f2, %f7

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f3, %f3, %f6

	nop
	nop
	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)

	nop
	nop
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f6

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f7

	nop
	nop
	nop
	fadd	%f2, %f4, %f2

	nop
	nop
	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)

	nop
	nop
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	flw	%f2, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f7

	nop
	nop
	nop
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.49730

bnei_else.49729:
	nop
	nop
	nop
	fsw	%f3, 142(%zero)

	nop
	nop
	nop
	fsw	%f4, 143(%zero)

	nop
	nop
	nop
	fsw	%f5, 144(%zero)

bnei_cont.49730:
	nop
	nop
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)

	nop
	nop
	nop
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 6(%sp)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.49731

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.49732

fbeq_else.49731:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.49732:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49733

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.49734

bnei_else.49733:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49735

	nop
	nop
	nop
	flw	%f5, 490(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.49736

bnei_else.49735:
	nop
	nop
	nop
	flw	%f5, 491(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

bnei_cont.49736:
bnei_cont.49734:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.49726

bnei_else.49727:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.49728:
	nop
	nop
	nop
	j	bnei_cont.49726

bnei_else.49725:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.49737

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.49738

fbeq_else.49737:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.49738:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49739

	nop
	nop
	nop
	fmov	%f1, %f0

	nop
	nop
	nop
	j	bnei_cont.49740

bnei_else.49739:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49741

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49742

fbgt_else.49741:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49742:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49743

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.49744

bnei_else.49743:
	nop
	nop
	nop
	flw	%f1, 490(%zero)

bnei_cont.49744:
bnei_cont.49740:
	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f1, 142(%a0)

bnei_cont.49726:
	nop
	nop
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 0(%a0)
	lw	%a0, 8(%v0)

	nop
	nop
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 2(%a0)
	sw	%v0, 8(%sp)

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.49745

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.49747

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.49749

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.49751

	nop
	nop
	nop
	j	bnei_cont.49746

bnei_else.49751:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsqrt	%f1, %f1
	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)

	nop
	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fsqrt	%f2, %f2

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	nop
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49753

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49754

fbgt_else.49753:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49754:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49755

	nop
	nop
	nop
	flw	%f0, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.49756

bnei_else.49755:
	nop
	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49757

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49758

fbgt_else.49757:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49758:
	nop
	nop
	fabs	%f3, %f0
	flw	%f5, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.49759

	nop
	nop
	nop
	flw	%f0, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.49761

	nop
	nop
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)

	nop
	fdiv	%f3, %f5, %f3
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	j	fbgt_cont.49762

fbgt_else.49761:
	nop
	nop
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)

	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f6, %f3

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

fbgt_cont.49762:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49763

	nop
	nop
	nop
	j	fbgt_cont.49760

bnei_else.49763:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49764:
	nop
	nop
	nop
	j	fbgt_cont.49760

fbgt_else.49759:
	nop
	fmul	%f3, %f0, %f0
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f0

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f7, %f7, %f3

	nop
	nop
	fsub	%f7, %f0, %f7
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fmul	%f0, %f0, %f6

	nop
	nop
	nop
	fadd	%f0, %f3, %f0

fbgt_cont.49760:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

bnei_cont.49756:
	nop
	nop
	floor	%f1, %f0
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)

	nop
	nop
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	flw	%f3, 1(%v1)

	nop
	nop
	nop
	fsqrt	%f3, %f3

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49765

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49766

fbgt_else.49765:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49766:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49767

	nop
	nop
	nop
	flw	%f1, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.49768

bnei_else.49767:
	nop
	nop
	fdiv	%f1, %f1, %f2
	flw	%f2, 6(%sp)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49769

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49770

fbgt_else.49769:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49770:
	nop
	nop
	fabs	%f3, %f1
	flw	%f4, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49771

	nop
	nop
	nop
	flw	%f1, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.49773

	nop
	nop
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)

	nop
	fdiv	%f3, %f4, %f3
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fsub	%f1, %f1, %f3

	nop
	nop
	nop
	j	fbgt_cont.49774

fbgt_else.49773:
	nop
	nop
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)

	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f5, %f3

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

fbgt_cont.49774:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49775

	nop
	nop
	nop
	j	fbgt_cont.49772

bnei_else.49775:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.49776:
	nop
	nop
	nop
	j	fbgt_cont.49772

fbgt_else.49771:
	nop
	fmul	%f3, %f1, %f1
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f1

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f6, %f1, %f6
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)

	nop
	nop
	nop
	fmul	%f1, %f6, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

fbgt_cont.49772:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

bnei_cont.49768:
	nop
	nop
	floor	%f2, %f1
	flw	%f3, 471(%zero)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49777

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49778

fbgt_else.49777:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49778:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49779

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.49780

bnei_else.49779:
bnei_cont.49780:
	nop
	nop
	nop
	flw	%f2, 450(%zero)

	nop
	nop
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f2

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.49752:
	nop
	nop
	nop
	j	bnei_cont.49746

bnei_else.49749:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)

	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 488(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 448(%zero)

	nop
	nop
	nop
	fsqrt	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f0

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)

	nop
	nop
	fabs	%f0, %f0
	fsw	%f1, 9(%sp)

	nop
	nop
	nop
	fsw	%f0, 10(%sp)

	nop
	nop
	nop
	fsw	%f2, 11(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49781

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49783

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49785

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49787

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49789

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49791

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49793

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49795

	nop
	nop
	nop
	flw	%f3, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49797

	nop
	nop
	nop
	flw	%f3, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49799

	nop
	nop
	flw	%f3, 478(%zero)
	sw	%ra, 12(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49799:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49800:
	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49797:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49798:
	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49795:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49796:
	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49793:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49794:
	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49791:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49792:
	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49789:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49790:
	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49787:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49788:
	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49785:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49786:
	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49783:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49784:
	nop
	nop
	nop
	j	fbgt_cont.49782

fbgt_else.49781:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.49782:
	nop
	nop
	flw	%f1, 10(%sp)
	flw	%f2, 11(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49801

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49803

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49805

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49807

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 12(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49802

fbgt_else.49807:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 12(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

fbgt_cont.49808:
	nop
	nop
	nop
	j	fbgt_cont.49802

fbgt_else.49805:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49806:
	nop
	nop
	nop
	j	fbgt_cont.49802

fbgt_else.49803:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49809

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49811

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 12(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49810

fbgt_else.49811:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 12(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

fbgt_cont.49812:
	nop
	nop
	nop
	j	fbgt_cont.49810

fbgt_else.49809:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49810:
fbgt_cont.49804:
	nop
	nop
	nop
	j	fbgt_cont.49802

fbgt_else.49801:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49802:
	nop
	nop
	nop
	flw	%f1, 9(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49813

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49814

fbgt_else.49813:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49814:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49815

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.49816

fbgt_else.49815:
fbgt_cont.49816:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49817

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49819

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49818

bnei_else.49819:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.49820:
	nop
	nop
	nop
	j	fbgt_cont.49818

fbgt_else.49817:
fbgt_cont.49818:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49821

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.49822

fbgt_else.49821:
fbgt_cont.49822:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49823

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.49824

fbgt_else.49823:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.49824:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49825

	nop
	nop
	nop
	j	bnei_cont.49826

bnei_else.49825:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49826:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	fsw	%f2, 146(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.49750:
	nop
	nop
	nop
	j	bnei_cont.49746

bnei_else.49747:
	nop
	nop
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 6(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49827

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49828

fbgt_else.49827:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49828:
	nop
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 12(%sp)

	nop
	nop
	nop
	fsw	%f1, 13(%sp)

	nop
	nop
	nop
	fsw	%f0, 14(%sp)

	nop
	nop
	nop
	fsw	%f3, 15(%sp)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49829

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49831

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49833

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49835

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49837

	nop
	nop
	nop
	flw	%f4, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49839

	nop
	nop
	nop
	flw	%f4, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49841

	nop
	nop
	nop
	flw	%f4, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49843

	nop
	nop
	nop
	flw	%f4, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49845

	nop
	nop
	nop
	flw	%f4, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.49847

	nop
	nop
	flw	%f4, 478(%zero)
	sw	%ra, 16(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49847:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49848:
	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49845:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49846:
	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49843:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49844:
	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49841:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49842:
	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49839:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49840:
	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49837:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49838:
	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49835:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49836:
	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49833:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49834:
	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49831:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.49832:
	nop
	nop
	nop
	j	fbgt_cont.49830

fbgt_else.49829:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49830:
	nop
	nop
	flw	%f1, 14(%sp)
	flw	%f2, 15(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49849

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49851

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49853

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49855

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 16(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49850

fbgt_else.49855:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 16(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

fbgt_cont.49856:
	nop
	nop
	nop
	j	fbgt_cont.49850

fbgt_else.49853:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49854:
	nop
	nop
	nop
	j	fbgt_cont.49850

fbgt_else.49851:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49857

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49859

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 16(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49858

fbgt_else.49859:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 16(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

fbgt_cont.49860:
	nop
	nop
	nop
	j	fbgt_cont.49858

fbgt_else.49857:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49858:
fbgt_cont.49852:
	nop
	nop
	nop
	j	fbgt_cont.49850

fbgt_else.49849:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49850:
	nop
	nop
	nop
	flw	%f1, 13(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49861

	nop
	nop
	nop
	lw	%v0, 12(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49863

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49862

bnei_else.49863:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.49864:
	nop
	nop
	nop
	j	fbgt_cont.49862

fbgt_else.49861:
	nop
	nop
	nop
	lw	%v0, 12(%sp)

fbgt_cont.49862:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49865

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.49866

fbgt_else.49865:
fbgt_cont.49866:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49867

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.49868

fbgt_else.49867:
fbgt_cont.49868:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49869

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.49870

fbgt_else.49869:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.49870:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49871

	nop
	nop
	nop
	j	bnei_cont.49872

bnei_else.49871:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49872:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f1, %f0

	nop
	nop
	nop
	fsw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.49748:
	nop
	nop
	nop
	j	bnei_cont.49746

bnei_else.49745:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	floor	%f2, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49873

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49874

fbgt_else.49873:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49874:
	nop
	nop
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)

	nop
	nop
	nop
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f1, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49875

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49876

fbgt_else.49875:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.49876:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49877

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49879

	nop
	nop
	nop
	flw	%f0, 450(%zero)

	nop
	nop
	nop
	j	bnei_cont.49878

bnei_else.49879:
	nop
	nop
	nop
	flw	%f0, 6(%sp)

bnei_cont.49880:
	nop
	nop
	nop
	j	bnei_cont.49878

bnei_else.49877:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49881

	nop
	nop
	nop
	flw	%f0, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.49882

bnei_else.49881:
	nop
	nop
	nop
	flw	%f0, 450(%zero)

bnei_cont.49882:
bnei_cont.49878:
	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.49746:
	nop
	nop
	lw	%v0, 1(%sp)
	lw	%v1, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49883

	nop
	nop
	nop
	j	bnei_cont.49716

bnei_else.49883:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49885

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49886

fbgt_else.49885:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49886:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49887

	nop
	nop
	nop
	j	bnei_cont.49888

bnei_else.49887:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.49888:
	nop
	nop
	flw	%f1, 4(%sp)
	lw	%v0, 8(%sp)

	nop
	fmul	%f0, %f1, %f0
	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f1, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 148(%zero)

	nop
	nop
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 149(%zero)

	nop
	nop
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

bnei_cont.49884:
	nop
	nop
	nop
	j	bnei_cont.49716

bnei_else.49723:
bnei_cont.49724:
	nop
	nop
	nop
	j	bnei_cont.49716

bnei_else.49715:
	nop
	nop
	flw	%f2, 439(%zero)
	lw	%a2, 1(%sp)

	nop
	fdiv	%f0, %f0, %f2
	flw	%f2, 465(%zero)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f2, 137(%zero)
	fsw	%f0, 16(%sp)

	nop
	nop
	nop
	lw	%v1, 134(%zero)

	nop
	nop
	nop
	sw	%v1, 17(%sp)

	nop
	nop
	nop
	fsw	%f1, 6(%sp)

	nop
	nop
	nop
	sw	%a0, 18(%sp)

	nop
	nop
	nop
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	addi	%sp, %sp, -20
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49889

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49890

fbgt_else.49889:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49890:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49891

	nop
	nop
	nop
	flw	%f1, 464(%zero)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49893

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.49892

fbgt_else.49893:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49894:
	nop
	nop
	nop
	j	bnei_cont.49892

bnei_else.49891:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bnei_cont.49892:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49895

	nop
	nop
	lw	%v0, 141(%zero)
	lw	%v1, 18(%sp)

	nop
	nop
	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	lw	%a0, 1(%v0)

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.49897

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.49899

	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f3, %f0, %f3
	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f4, %f1, %f4
	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	fmul	%f5, %f2, %f5

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49901

	nop
	nop
	nop
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)

	nop
	fmul	%f6, %f1, %f6
	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f7, %f2, %f7

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 471(%zero)

	nop
	nop
	nop
	fmul	%f6, %f6, %f7

	nop
	nop
	nop
	fadd	%f3, %f3, %f6

	nop
	nop
	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)

	nop
	nop
	fmul	%f3, %f0, %f3
	lw	%v1, 9(%v0)

	nop
	nop
	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	fmul	%f2, %f2, %f6

	nop
	nop
	nop
	fadd	%f2, %f3, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f7

	nop
	nop
	nop
	fadd	%f2, %f4, %f2

	nop
	nop
	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)

	nop
	nop
	fmul	%f0, %f0, %f2
	lw	%v1, 9(%v0)

	nop
	nop
	nop
	flw	%f2, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f7

	nop
	nop
	nop
	fadd	%f0, %f5, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.49902

bnei_else.49901:
	nop
	nop
	nop
	fsw	%f3, 142(%zero)

	nop
	nop
	nop
	fsw	%f4, 143(%zero)

	nop
	nop
	nop
	fsw	%f5, 144(%zero)

bnei_cont.49902:
	nop
	nop
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	flw	%f2, 143(%zero)

	nop
	nop
	nop
	fmul	%f3, %f2, %f2

	nop
	nop
	fadd	%f1, %f1, %f3
	flw	%f3, 144(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f3

	nop
	nop
	fadd	%f1, %f1, %f4
	flw	%f4, 6(%sp)

	nop
	nop
	nop
	fsqrt	%f1, %f1

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.49903

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.49904

fbeq_else.49903:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.49904:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.49905

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.49906

bnei_else.49905:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49907

	nop
	nop
	nop
	flw	%f5, 490(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

	nop
	nop
	nop
	j	bnei_cont.49908

bnei_else.49907:
	nop
	nop
	nop
	flw	%f5, 491(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f5, %f1

bnei_cont.49908:
bnei_cont.49906:
	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	fsw	%f0, 142(%zero)
	fmul	%f0, %f2, %f1

	nop
	nop
	fsw	%f0, 143(%zero)
	fmul	%f0, %f3, %f1

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

	nop
	nop
	nop
	j	bnei_cont.49898

bnei_else.49899:
	nop
	nop
	nop
	lw	%v1, 4(%v0)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fneg	%f0, %f0
	lw	%v1, 4(%v0)

	nop
	nop
	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 144(%zero)

bnei_cont.49900:
	nop
	nop
	nop
	j	bnei_cont.49898

bnei_else.49897:
	nop
	nop
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)

	nop
	nop
	fsw	%f0, 142(%zero)
	addi	%a0, %a0, -1

	nop
	nop
	fsw	%f0, 143(%zero)
	add	%at, %v1, %a0

	nop
	nop
	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.49909

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.49910

fbeq_else.49909:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.49910:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49911

	nop
	nop
	nop
	fmov	%f1, %f0

	nop
	nop
	nop
	j	bnei_cont.49912

bnei_else.49911:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49913

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49914

fbgt_else.49913:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49914:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49915

	nop
	nop
	nop
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.49916

bnei_else.49915:
	nop
	nop
	nop
	flw	%f1, 490(%zero)

bnei_cont.49916:
bnei_cont.49912:
	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	nop
	fsw	%f1, 142(%a0)

bnei_cont.49898:
	nop
	nop
	lw	%v1, 0(%v0)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 0(%a0)
	lw	%a0, 8(%v0)

	nop
	nop
	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 146(%zero)
	lw	%a0, 8(%v0)

	nop
	nop
	flw	%f0, 2(%a0)
	sw	%v0, 19(%sp)

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.49917

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.49919

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.49921

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.49923

	nop
	nop
	nop
	j	bnei_cont.49918

bnei_else.49923:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsqrt	%f1, %f1
	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)

	nop
	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fsqrt	%f2, %f2

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	nop
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49925

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49926

fbgt_else.49925:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49926:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49927

	nop
	nop
	nop
	flw	%f0, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.49928

bnei_else.49927:
	nop
	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fabs	%f0, %f0

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49929

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49930

fbgt_else.49929:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49930:
	nop
	nop
	fabs	%f3, %f0
	flw	%f5, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.49931

	nop
	nop
	nop
	flw	%f0, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.49933

	nop
	nop
	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)

	nop
	fdiv	%f3, %f5, %f3
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f3

	nop
	nop
	nop
	j	fbgt_cont.49934

fbgt_else.49933:
	nop
	nop
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)

	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5
	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f6, %f3

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f8, %f8, %f3

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f8, %f8, %f5

	nop
	nop
	fmul	%f7, %f6, %f6
	fsub	%f8, %f3, %f8

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 458(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f5

	nop
	nop
	nop
	fmul	%f9, %f9, %f6

	nop
	nop
	fsub	%f8, %f8, %f9
	flw	%f9, 457(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f9, %f9, %f7

	nop
	nop
	fadd	%f8, %f8, %f9
	flw	%f9, 456(%zero)

	nop
	nop
	nop
	fmul	%f9, %f9, %f3

	nop
	nop
	nop
	fmul	%f5, %f9, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f7

	nop
	nop
	fsub	%f5, %f8, %f5
	flw	%f8, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fmul	%f3, %f3, %f7

	nop
	nop
	nop
	fadd	%f3, %f5, %f3

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

fbgt_cont.49934:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49935

	nop
	nop
	nop
	j	fbgt_cont.49932

bnei_else.49935:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49936:
	nop
	nop
	nop
	j	fbgt_cont.49932

fbgt_else.49931:
	nop
	fmul	%f3, %f0, %f0
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f5, %f3, %f3
	fmul	%f7, %f7, %f0

	nop
	nop
	fmul	%f6, %f5, %f5
	fmul	%f7, %f7, %f3

	nop
	nop
	fsub	%f7, %f0, %f7
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f0

	nop
	nop
	nop
	fmul	%f3, %f8, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	fsub	%f3, %f7, %f3
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fmul	%f0, %f0, %f6

	nop
	nop
	nop
	fadd	%f0, %f3, %f0

fbgt_cont.49932:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

bnei_cont.49928:
	nop
	nop
	floor	%f1, %f0
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)

	nop
	nop
	fsub	%f1, %f1, %f3
	lw	%v1, 4(%v0)

	nop
	nop
	nop
	flw	%f3, 1(%v1)

	nop
	nop
	nop
	fsqrt	%f3, %f3

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49937

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49938

fbgt_else.49937:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49938:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49939

	nop
	nop
	nop
	flw	%f1, 462(%zero)

	nop
	nop
	nop
	j	bnei_cont.49940

bnei_else.49939:
	nop
	nop
	fdiv	%f1, %f1, %f2
	flw	%f2, 6(%sp)

	nop
	nop
	nop
	fabs	%f1, %f1

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49941

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.49942

fbgt_else.49941:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.49942:
	nop
	nop
	fabs	%f3, %f1
	flw	%f4, 461(%zero)

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.49943

	nop
	nop
	nop
	flw	%f1, 454(%zero)

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.49945

	nop
	nop
	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)

	nop
	fdiv	%f3, %f4, %f3
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fsub	%f1, %f1, %f3

	nop
	nop
	nop
	j	fbgt_cont.49946

fbgt_else.49945:
	nop
	nop
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)

	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)

	nop
	nop
	nop
	fdiv	%f3, %f5, %f3

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f7, %f7, %f3

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f7, %f7, %f4

	nop
	nop
	fmul	%f6, %f5, %f5
	fsub	%f7, %f3, %f7

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 458(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f4

	nop
	nop
	nop
	fmul	%f8, %f8, %f5

	nop
	nop
	fsub	%f7, %f7, %f8
	flw	%f8, 457(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f8, %f8, %f6

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 456(%zero)

	nop
	nop
	nop
	fmul	%f8, %f8, %f3

	nop
	nop
	nop
	fmul	%f4, %f8, %f4

	nop
	nop
	nop
	fmul	%f4, %f4, %f6

	nop
	nop
	fsub	%f4, %f7, %f4
	flw	%f7, 455(%zero)

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	nop
	fmul	%f3, %f3, %f6

	nop
	nop
	nop
	fadd	%f3, %f4, %f3

	nop
	nop
	nop
	fadd	%f1, %f1, %f3

fbgt_cont.49946:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49947

	nop
	nop
	nop
	j	fbgt_cont.49944

bnei_else.49947:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.49948:
	nop
	nop
	nop
	j	fbgt_cont.49944

fbgt_else.49943:
	nop
	fmul	%f3, %f1, %f1
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f6, %f1

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f3

	nop
	nop
	fsub	%f6, %f1, %f6
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 458(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f3

	nop
	nop
	nop
	fmul	%f7, %f7, %f4

	nop
	nop
	fsub	%f6, %f6, %f7
	flw	%f7, 457(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 456(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f1

	nop
	nop
	nop
	fmul	%f3, %f7, %f3

	nop
	nop
	nop
	fmul	%f3, %f3, %f5

	nop
	nop
	fsub	%f3, %f6, %f3
	flw	%f6, 455(%zero)

	nop
	nop
	nop
	fmul	%f1, %f6, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f4

	nop
	nop
	nop
	fmul	%f1, %f1, %f5

	nop
	nop
	nop
	fadd	%f1, %f3, %f1

fbgt_cont.49944:
	nop
	nop
	nop
	flw	%f3, 453(%zero)

	nop
	nop
	fmul	%f1, %f1, %f3
	flw	%f3, 452(%zero)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f3

bnei_cont.49940:
	nop
	nop
	floor	%f2, %f1
	flw	%f3, 471(%zero)

	nop
	fsub	%f1, %f1, %f2
	flw	%f2, 451(%zero)
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49949

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49950

fbgt_else.49949:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.49950:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.49951

	nop
	nop
	nop
	fmov	%f0, %f1

	nop
	nop
	nop
	j	bnei_cont.49952

bnei_else.49951:
bnei_cont.49952:
	nop
	nop
	nop
	flw	%f2, 450(%zero)

	nop
	nop
	fmul	%f0, %f2, %f0
	flw	%f2, 449(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f2

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.49924:
	nop
	nop
	nop
	j	bnei_cont.49918

bnei_else.49921:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)

	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)

	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0
	flw	%f2, 488(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f1

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 448(%zero)

	nop
	nop
	nop
	fsqrt	%f0, %f0

	nop
	nop
	nop
	fdiv	%f0, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f0

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 452(%zero)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)

	nop
	nop
	fabs	%f0, %f0
	fsw	%f1, 20(%sp)

	nop
	nop
	nop
	fsw	%f0, 21(%sp)

	nop
	nop
	nop
	fsw	%f2, 22(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49953

	nop
	nop
	nop
	flw	%f3, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49955

	nop
	nop
	nop
	flw	%f3, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49957

	nop
	nop
	nop
	flw	%f3, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49959

	nop
	nop
	nop
	flw	%f3, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49961

	nop
	nop
	nop
	flw	%f3, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49963

	nop
	nop
	nop
	flw	%f3, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49965

	nop
	nop
	nop
	flw	%f3, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49967

	nop
	nop
	nop
	flw	%f3, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49969

	nop
	nop
	nop
	flw	%f3, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.49971

	nop
	nop
	flw	%f3, 478(%zero)
	sw	%ra, 23(%sp)

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49971:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49972:
	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49969:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49970:
	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49967:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49968:
	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49965:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49966:
	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49963:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49964:
	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49961:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49962:
	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49959:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49960:
	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49957:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49958:
	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49955:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.49956:
	nop
	nop
	nop
	j	fbgt_cont.49954

fbgt_else.49953:
	nop
	nop
	nop
	fmov	%f0, %f2

fbgt_cont.49954:
	nop
	nop
	flw	%f1, 21(%sp)
	flw	%f2, 22(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49973

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49975

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49977

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49979

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 23(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49974

fbgt_else.49979:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 23(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

fbgt_cont.49980:
	nop
	nop
	nop
	j	fbgt_cont.49974

fbgt_else.49977:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49978:
	nop
	nop
	nop
	j	fbgt_cont.49974

fbgt_else.49975:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.49981

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49983

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 23(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

	nop
	nop
	nop
	j	fbgt_cont.49982

fbgt_else.49983:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 23(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

fbgt_cont.49984:
	nop
	nop
	nop
	j	fbgt_cont.49982

fbgt_else.49981:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49982:
fbgt_cont.49976:
	nop
	nop
	nop
	j	fbgt_cont.49974

fbgt_else.49973:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.49974:
	nop
	nop
	nop
	flw	%f1, 20(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49985

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49986

fbgt_else.49985:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.49986:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.49987

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.49988

fbgt_else.49987:
fbgt_cont.49988:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49989

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49991

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.49990

bnei_else.49991:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.49992:
	nop
	nop
	nop
	j	fbgt_cont.49990

fbgt_else.49989:
fbgt_cont.49990:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49993

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.49994

fbgt_else.49993:
fbgt_cont.49994:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.49995

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.49996

fbgt_else.49995:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.49996:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.49997

	nop
	nop
	nop
	j	bnei_cont.49998

bnei_else.49997:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.49998:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	fsw	%f2, 146(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 147(%zero)

bnei_cont.49922:
	nop
	nop
	nop
	j	bnei_cont.49918

bnei_else.49919:
	nop
	nop
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 489(%zero)
	flw	%f2, 6(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.49999

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.50000

fbgt_else.49999:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.50000:
	nop
	fabs	%f0, %f0
	flw	%f3, 488(%zero)
	sw	%v1, 23(%sp)

	nop
	nop
	nop
	fsw	%f1, 24(%sp)

	nop
	nop
	nop
	fsw	%f0, 25(%sp)

	nop
	nop
	nop
	fsw	%f3, 26(%sp)

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.50001

	nop
	nop
	nop
	flw	%f4, 487(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.50003

	nop
	nop
	nop
	flw	%f4, 486(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.50005

	nop
	nop
	nop
	flw	%f4, 485(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.50007

	nop
	nop
	nop
	flw	%f4, 484(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.50009

	nop
	nop
	nop
	flw	%f4, 483(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.50011

	nop
	nop
	nop
	flw	%f4, 482(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.50013

	nop
	nop
	nop
	flw	%f4, 481(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.50015

	nop
	nop
	nop
	flw	%f4, 480(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.50017

	nop
	nop
	nop
	flw	%f4, 479(%zero)

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.50019

	nop
	nop
	flw	%f4, 478(%zero)
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50019:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.50020:
	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50017:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.50018:
	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50015:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.50016:
	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50013:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.50014:
	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50011:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.50012:
	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50009:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.50010:
	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50007:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.50008:
	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50005:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.50006:
	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50003:
	nop
	nop
	nop
	fmov	%f0, %f4

fbgt_cont.50004:
	nop
	nop
	nop
	j	fbgt_cont.50002

fbgt_else.50001:
	nop
	nop
	nop
	fmov	%f0, %f3

fbgt_cont.50002:
	nop
	nop
	flw	%f1, 25(%sp)
	flw	%f2, 26(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.50021

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.50023

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.50025

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.50027

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	fbgt_cont.50022

fbgt_else.50027:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

fbgt_cont.50028:
	nop
	nop
	nop
	j	fbgt_cont.50022

fbgt_else.50025:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.50026:
	nop
	nop
	nop
	j	fbgt_cont.50022

fbgt_else.50023:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.50029

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.50031

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	fbgt_cont.50030

fbgt_else.50031:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

fbgt_cont.50032:
	nop
	nop
	nop
	j	fbgt_cont.50030

fbgt_else.50029:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.50030:
fbgt_cont.50024:
	nop
	nop
	nop
	j	fbgt_cont.50022

fbgt_else.50021:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.50022:
	nop
	nop
	nop
	flw	%f1, 24(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.50033

	nop
	nop
	nop
	lw	%v0, 23(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.50035

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.50034

bnei_else.50035:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.50036:
	nop
	nop
	nop
	j	fbgt_cont.50034

fbgt_else.50033:
	nop
	nop
	nop
	lw	%v0, 23(%sp)

fbgt_cont.50034:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.50037

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.50038

fbgt_else.50037:
fbgt_cont.50038:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.50039

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.50040

fbgt_else.50039:
fbgt_cont.50040:
	nop
	nop
	nop
	flw	%f1, 475(%zero)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.50041

	nop
	fmul	%f1, %f0, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f3, %f3, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

	nop
	nop
	nop
	j	fbgt_cont.50042

fbgt_else.50041:
	nop
	fsub	%f0, %f2, %f0
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fsub	%f2, %f2, %f3
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

fbgt_cont.50042:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.50043

	nop
	nop
	nop
	j	bnei_cont.50044

bnei_else.50043:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.50044:
	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f1, 450(%zero)

	nop
	nop
	nop
	fmul	%f2, %f1, %f0

	nop
	nop
	nop
	fsw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	fmul	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.49920:
	nop
	nop
	nop
	j	bnei_cont.49918

bnei_else.49917:
	nop
	nop
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)

	nop
	nop
	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)

	nop
	nop
	fsub	%f0, %f0, %f1
	flw	%f1, 445(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f1

	nop
	nop
	nop
	floor	%f2, %f2

	nop
	nop
	nop
	fmul	%f2, %f2, %f3

	nop
	nop
	fsub	%f0, %f0, %f2
	flw	%f2, 448(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.50045

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.50046

fbgt_else.50045:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.50046:
	nop
	nop
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)

	nop
	nop
	nop
	flw	%f4, 2(%a0)

	nop
	nop
	nop
	fsub	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f1, %f0, %f1

	nop
	nop
	nop
	floor	%f1, %f1

	nop
	nop
	nop
	fmul	%f1, %f1, %f3

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.50047

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.50048

fbgt_else.50047:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.50048:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.50049

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50051

	nop
	nop
	nop
	flw	%f0, 450(%zero)

	nop
	nop
	nop
	j	bnei_cont.50050

bnei_else.50051:
	nop
	nop
	nop
	flw	%f0, 6(%sp)

bnei_cont.50052:
	nop
	nop
	nop
	j	bnei_cont.50050

bnei_else.50049:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50053

	nop
	nop
	nop
	flw	%f0, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.50054

bnei_else.50053:
	nop
	nop
	nop
	flw	%f0, 450(%zero)

bnei_cont.50054:
bnei_cont.50050:
	nop
	nop
	nop
	fsw	%f0, 146(%zero)

bnei_cont.49918:
	nop
	nop
	lw	%v0, 1(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.50055

	nop
	nop
	nop
	j	bnei_cont.49896

bnei_else.50055:
	nop
	nop
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 80(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 144(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.50057

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.50058

fbgt_else.50057:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.50058:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.50059

	nop
	nop
	nop
	j	bnei_cont.50060

bnei_else.50059:
	nop
	nop
	nop
	fmov	%f0, %f1

bnei_cont.50060:
	nop
	nop
	flw	%f1, 16(%sp)
	lw	%v0, 19(%sp)

	nop
	fmul	%f0, %f1, %f0
	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)

	nop
	nop
	nop
	flw	%f1, 0(%v0)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 148(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 148(%zero)

	nop
	nop
	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	nop
	fadd	%f1, %f1, %f2

	nop
	nop
	nop
	fsw	%f1, 149(%zero)

	nop
	nop
	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

bnei_cont.50056:
	nop
	nop
	nop
	j	bnei_cont.49896

bnei_else.49895:
bnei_cont.49896:
bnei_cont.49716:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	j	iter_trace_diffuse_rays.2980

do_without_neighbors.3002:
	nop
	nop
	nop
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.50144

	nop
	nop
	nop
	lw	%a0, 2(%v0)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.50145

	nop
	nop
	lw	%a0, 3(%v0)
	sw	%v0, 0(%sp)

	nop
	nop
	add	%at, %a0, %v1
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50146

	nop
	nop
	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)

	nop
	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1

	nop
	lw	%a0, 0(%at)
	add	%at, %a1, %v1
	sw	%a3, 2(%sp)

	nop
	flw	%f0, 0(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v1

	nop
	nop
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%v0)

	nop
	nop
	lw	%a0, 0(%a0)
	lw	%a2, 0(%at)

	nop
	nop
	nop
	sw	%a1, 3(%sp)

	nop
	nop
	nop
	sw	%a2, 4(%sp)

	nop
	nop
	nop
	sw	%a0, 5(%sp)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50148

	nop
	lw	%t0, 179(%zero)
	flw	%f0, 0(%a2)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%t0, 6(%sp)

	nop
	nop
	lw	%t1, 0(%zero)
	sw	%ra, 7(%sp)

	nop
	nop
	addi	%t1, %t1, -1
	addi	%sp, %sp, 8

	nop
	nop
	nop
	addi	%v1, %t1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	nop
	addi	%sp, %sp, -8

	nop
	nop
	nop
	lw	%ra, 7(%sp)

	nop
	nop
	nop
	j	bnei_cont.50149

bnei_else.50148:
bnei_cont.50149:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.50150

	nop
	nop
	lw	%v1, 180(%zero)
	lw	%a0, 4(%sp)

	nop
	flw	%f0, 0(%a0)
	sw	%v1, 7(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 8(%sp)

	nop
	nop
	lw	%a1, 0(%zero)
	addi	%sp, %sp, 9

	nop
	nop
	nop
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -9
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

	nop
	nop
	nop
	j	bnei_cont.50151

bnei_else.50150:
bnei_cont.50151:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.50152

	nop
	nop
	lw	%v1, 181(%zero)
	lw	%a0, 4(%sp)

	nop
	flw	%f0, 0(%a0)
	sw	%v1, 8(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 9(%sp)

	nop
	nop
	lw	%a1, 0(%zero)
	addi	%sp, %sp, 10

	nop
	nop
	nop
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -10
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bnei_cont.50153

bnei_else.50152:
bnei_cont.50153:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.50154

	nop
	nop
	lw	%v1, 182(%zero)
	lw	%a0, 4(%sp)

	nop
	flw	%f0, 0(%a0)
	sw	%v1, 9(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 10(%sp)

	nop
	nop
	lw	%a1, 0(%zero)
	addi	%sp, %sp, 11

	nop
	nop
	nop
	addi	%a1, %a1, -1

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.50155

bnei_else.50154:
bnei_cont.50155:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.50156

	nop
	nop
	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)

	nop
	flw	%f0, 0(%v1)
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v1)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v1)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%ra, 11(%sp)

	nop
	nop
	lw	%a0, 0(%zero)
	addi	%sp, %sp, 12

	nop
	nop
	nop
	addi	%a0, %a0, -1

	nop
	nop
	nop
	addi	%v1, %a0, 0

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -12
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	bnei_cont.50157

bnei_else.50156:
bnei_cont.50157:
	nop
	nop
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)

	nop
	add	%at, %v1, %v0
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	flw	%f1, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.50147

bnei_else.50146:
bnei_cont.50147:
	nop
	nop
	lw	%v0, 1(%sp)
	addi	%at, %zero, 4

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.50158

	nop
	nop
	nop
	lw	%v1, 0(%sp)

	nop
	nop
	nop
	lw	%a0, 2(%v1)

	nop
	nop
	nop
	add	%at, %a0, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.50159

	nop
	nop
	nop
	lw	%a0, 3(%v1)

	nop
	nop
	nop
	add	%at, %a0, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50160

	nop
	nop
	lw	%a0, 5(%v1)
	lw	%a1, 7(%v1)

	nop
	lw	%a2, 1(%v1)
	lw	%a3, 4(%v1)
	add	%at, %a0, %v0

	nop
	lw	%a0, 0(%at)
	add	%at, %a1, %v0
	sw	%v0, 11(%sp)

	nop
	flw	%f0, 0(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v0

	nop
	nop
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)

	nop
	nop
	fsw	%f0, 150(%zero)
	lw	%a0, 6(%v1)

	nop
	nop
	lw	%a0, 0(%a0)
	lw	%a2, 0(%at)

	nop
	nop
	nop
	sw	%a3, 12(%sp)

	nop
	nop
	nop
	sw	%a2, 13(%sp)

	nop
	nop
	nop
	sw	%a1, 14(%sp)

	nop
	nop
	nop
	sw	%a0, 15(%sp)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50162

	lw	%t0, 179(%zero)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0
	sw	%ra, 16(%sp)

	nop
	nop
	addi	%v0, %t0, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bnei_cont.50163

bnei_else.50162:
bnei_cont.50163:
	nop
	nop
	nop
	lw	%v0, 15(%sp)

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.50164

	nop
	nop
	lw	%v1, 180(%zero)
	lw	%a0, 14(%sp)

	lw	%a1, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bnei_cont.50165

bnei_else.50164:
bnei_cont.50165:
	nop
	nop
	nop
	lw	%v0, 15(%sp)

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.50166

	nop
	nop
	lw	%v1, 181(%zero)
	lw	%a0, 14(%sp)

	lw	%a1, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bnei_cont.50167

bnei_else.50166:
bnei_cont.50167:
	nop
	nop
	nop
	lw	%v0, 15(%sp)

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.50168

	nop
	nop
	lw	%v1, 182(%zero)
	lw	%a0, 14(%sp)

	lw	%a1, 13(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 16(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bnei_cont.50169

bnei_else.50168:
bnei_cont.50169:
	nop
	nop
	nop
	lw	%v0, 15(%sp)

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.50170

	nop
	nop
	lw	%v0, 183(%zero)
	lw	%v1, 14(%sp)

	nop
	nop
	lw	%a0, 13(%sp)
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bnei_cont.50171

bnei_else.50170:
bnei_cont.50171:
	nop
	nop
	lw	%v0, 11(%sp)
	lw	%v1, 12(%sp)

	nop
	add	%at, %v1, %v0
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	flw	%f1, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.50161

bnei_else.50160:
bnei_cont.50161:
	nop
	nop
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.50159:
	nop
	nop
	nop
	jr	%ra

bgt_else.50158:
	nop
	nop
	nop
	jr	%ra

bgti_else.50145:
	nop
	nop
	nop
	jr	%ra

bgt_else.50144:
	nop
	nop
	nop
	jr	%ra

try_exploit_neighbors.3018:
	nop
	nop
	nop
	add	%at, %a1, %v0

	nop
	nop
	lw	%t0, 0(%at)
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.50209

	nop
	nop
	nop
	lw	%t1, 2(%t0)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	nop
	lw	%t1, 0(%at)

	nop
	nop
	nop
	blti	%t1, 0, bgti_else.50210

	nop
	nop
	nop
	lw	%t1, 2(%t0)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	lw	%t1, 0(%at)
	add	%at, %a0, %v0

	nop
	nop
	nop
	lw	%t2, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t2)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.50211

	nop
	nop
	nop
	add	%at, %a2, %v0

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t3)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.50213

	nop
	nop
	nop
	addi	%t3, %v0, -1

	nop
	nop
	nop
	add	%at, %a1, %t3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t3)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.50215

	nop
	nop
	nop
	addi	%t3, %v0, 1

	nop
	nop
	nop
	add	%at, %a1, %t3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t3)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.50217

	nop
	nop
	nop
	addi	%t1, %zero, 1

	nop
	nop
	nop
	j	beq_cont.50212

beq_else.50217:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.50218:
	nop
	nop
	nop
	j	beq_cont.50212

beq_else.50215:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.50216:
	nop
	nop
	nop
	j	beq_cont.50212

beq_else.50213:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.50214:
	nop
	nop
	nop
	j	beq_cont.50212

beq_else.50211:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.50212:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.50219

	nop
	nop
	nop
	lw	%t1, 3(%t0)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	nop
	lw	%t1, 0(%at)

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.50220

	lw	%t1, 5(%t2)
	addi	%t3, %v0, -1
	lw	%t4, 5(%t0)
	addi	%t5, %v0, 1

	nop
	nop
	nop
	add	%at, %a1, %t3

	nop
	nop
	lw	%t3, 0(%at)
	add	%at, %a1, %t5

	nop
	lw	%t3, 5(%t3)
	lw	%t5, 0(%at)
	add	%at, %a2, %v0

	nop
	lw	%t5, 5(%t5)
	lw	%t6, 0(%at)
	add	%at, %t1, %a3

	nop
	lw	%t6, 5(%t6)
	lw	%t1, 0(%at)
	add	%at, %t3, %a3

	nop
	nop
	nop
	flw	%f0, 0(%t1)

	nop
	nop
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)

	nop
	fsw	%f0, 150(%zero)
	lw	%t1, 0(%at)
	add	%at, %t4, %a3

	nop
	nop
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	add	%at, %t5, %a3

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	add	%at, %t6, %a3

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 4(%t0)

	nop
	nop
	fsw	%f0, 149(%zero)
	add	%at, %t1, %a3

	nop
	nop
	flw	%f0, 150(%zero)
	lw	%t1, 0(%at)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.50221

bnei_else.50220:
bnei_cont.50221:
	nop
	nop
	addi	%a3, %a3, 1
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.50222

	nop
	nop
	nop
	lw	%t1, 2(%t0)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	nop
	lw	%t1, 0(%at)

	nop
	nop
	nop
	blti	%t1, 0, bgti_else.50223

	nop
	nop
	lw	%t1, 2(%t0)
	lw	%t3, 2(%t2)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	lw	%t1, 0(%at)
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.50224

	nop
	nop
	nop
	add	%at, %a2, %v0

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t3)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.50226

	nop
	nop
	nop
	addi	%t3, %v0, -1

	nop
	nop
	nop
	add	%at, %a1, %t3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t3)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.50228

	nop
	nop
	nop
	addi	%t3, %v0, 1

	nop
	nop
	nop
	add	%at, %a1, %t3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	lw	%t3, 2(%t3)

	nop
	nop
	nop
	add	%at, %t3, %a3

	nop
	nop
	nop
	lw	%t3, 0(%at)

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.50230

	nop
	nop
	nop
	addi	%t1, %zero, 1

	nop
	nop
	nop
	j	beq_cont.50225

beq_else.50230:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.50231:
	nop
	nop
	nop
	j	beq_cont.50225

beq_else.50228:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.50229:
	nop
	nop
	nop
	j	beq_cont.50225

beq_else.50226:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.50227:
	nop
	nop
	nop
	j	beq_cont.50225

beq_else.50224:
	nop
	nop
	nop
	addi	%t1, %zero, 0

beq_cont.50225:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.50232

	nop
	nop
	nop
	lw	%t1, 3(%t0)

	nop
	nop
	nop
	add	%at, %t1, %a3

	nop
	nop
	nop
	lw	%t1, 0(%at)

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.50233

	lw	%t1, 5(%t2)
	addi	%t2, %v0, -1
	lw	%t3, 5(%t0)
	addi	%t4, %v0, 1

	nop
	nop
	add	%at, %a1, %t2
	lw	%t0, 4(%t0)

	nop
	nop
	lw	%t2, 0(%at)
	add	%at, %a1, %t4

	nop
	lw	%t2, 5(%t2)
	lw	%t4, 0(%at)
	add	%at, %a2, %v0

	nop
	lw	%t4, 5(%t4)
	lw	%t5, 0(%at)
	add	%at, %t1, %a3

	nop
	lw	%t5, 5(%t5)
	lw	%t1, 0(%at)
	add	%at, %t2, %a3

	nop
	nop
	nop
	flw	%f0, 0(%t1)

	nop
	nop
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)

	nop
	fsw	%f0, 150(%zero)
	lw	%t1, 0(%at)
	add	%at, %t3, %a3

	nop
	nop
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	add	%at, %t4, %a3

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	add	%at, %t5, %a3

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	add	%at, %t0, %a3

	nop
	nop
	fsw	%f0, 149(%zero)
	lw	%t0, 0(%at)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t0)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t0)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t0)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.50234

bnei_else.50233:
bnei_cont.50234:
	nop
	nop
	nop
	addi	%a3, %a3, 1

	nop
	nop
	nop
	j	try_exploit_neighbors.3018

bnei_else.50232:
	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.50223:
	nop
	nop
	nop
	jr	%ra

bgt_else.50222:
	nop
	nop
	nop
	jr	%ra

bnei_else.50219:
	nop
	nop
	nop
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.50237

	nop
	nop
	nop
	lw	%v0, 2(%t0)

	nop
	nop
	nop
	add	%at, %v0, %a3

	nop
	nop
	nop
	lw	%v0, 0(%at)

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.50238

	nop
	nop
	lw	%v0, 3(%t0)
	sw	%t0, 0(%sp)

	nop
	nop
	add	%at, %v0, %a3
	sw	%a3, 1(%sp)

	nop
	nop
	nop
	lw	%v0, 0(%at)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.50239

	nop
	nop
	lw	%v0, 5(%t0)
	lw	%v1, 7(%t0)

	nop
	lw	%a0, 1(%t0)
	lw	%a1, 4(%t0)
	add	%at, %v0, %a3

	nop
	lw	%v0, 0(%at)
	add	%at, %v1, %a3
	sw	%a1, 2(%sp)

	nop
	flw	%f0, 0(%v0)
	lw	%v1, 0(%at)
	add	%at, %a0, %a3

	nop
	nop
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%v0)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%v0)

	nop
	nop
	fsw	%f0, 150(%zero)
	lw	%v0, 6(%t0)

	nop
	nop
	lw	%v0, 0(%v0)
	lw	%a0, 0(%at)

	nop
	nop
	nop
	sw	%a0, 3(%sp)

	nop
	nop
	nop
	sw	%v1, 4(%sp)

	nop
	nop
	nop
	sw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.50241

	nop
	nop
	lw	%a2, 179(%zero)
	sw	%ra, 6(%sp)

	nop
	nop
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.50242

bnei_else.50241:
bnei_cont.50242:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.50243

	nop
	nop
	lw	%v1, 180(%zero)
	lw	%a0, 4(%sp)

	lw	%a1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.50244

bnei_else.50243:
bnei_cont.50244:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.50245

	nop
	nop
	lw	%v1, 181(%zero)
	lw	%a0, 4(%sp)

	lw	%a1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.50246

bnei_else.50245:
bnei_cont.50246:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.50247

	nop
	nop
	lw	%v1, 182(%zero)
	lw	%a0, 4(%sp)

	lw	%a1, 3(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 6(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.50248

bnei_else.50247:
bnei_cont.50248:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.50249

	nop
	nop
	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)

	nop
	nop
	lw	%a0, 3(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	nop
	lw	%ra, 6(%sp)

	nop
	nop
	nop
	j	bnei_cont.50250

bnei_else.50249:
bnei_cont.50250:
	nop
	nop
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)

	nop
	add	%at, %v1, %v0
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	flw	%f1, 0(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v1)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.50240

bnei_else.50239:
bnei_cont.50240:
	nop
	nop
	nop
	lw	%v0, 1(%sp)

	nop
	nop
	addi	%v1, %v0, 1
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.50238:
	nop
	nop
	nop
	jr	%ra

bgt_else.50237:
	nop
	nop
	nop
	jr	%ra

bgti_else.50210:
	nop
	nop
	nop
	jr	%ra

bgt_else.50209:
	nop
	nop
	nop
	jr	%ra

pretrace_diffuse_rays.3031:
	nop
	nop
	nop
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.50275

	nop
	nop
	nop
	lw	%a0, 2(%v0)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.50276

	nop
	nop
	lw	%a0, 3(%v0)
	sw	%v1, 0(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50277

	nop
	nop
	lw	%a0, 6(%v0)
	flw	%f0, 493(%zero)

	nop
	nop
	lw	%a0, 0(%a0)
	fsw	%f0, 148(%zero)

	nop
	nop
	fsw	%f0, 149(%zero)
	lw	%a1, 7(%v0)

	nop
	fsw	%f0, 150(%zero)
	lw	%a2, 1(%v0)
	add	%at, %a1, %v1

	nop
	lw	%a0, 179(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v1

	nop
	nop
	lw	%a2, 0(%at)
	sw	%v0, 1(%sp)

	nop
	flw	%f0, 0(%a2)
	sw	%a2, 2(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a2)

	nop
	nop
	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a2)

	nop
	nop
	fsw	%f0, 164(%zero)
	sw	%a1, 3(%sp)

	nop
	nop
	lw	%a3, 0(%zero)
	sw	%a0, 4(%sp)

	nop
	nop
	addi	%a3, %a3, -1
	sw	%ra, 5(%sp)

	nop
	nop
	addi	%v1, %a3, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -6
	addi	%a1, %zero, 118

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -6
	flw	%f0, 148(%zero)

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	lw	%v1, 5(%v0)
	lw	%a0, 0(%sp)

	nop
	nop
	nop
	add	%at, %v1, %a0

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)

	nop
	nop
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)

	nop
	nop
	nop
	fsw	%f0, 2(%v1)

	nop
	nop
	nop
	j	bnei_cont.50278

bnei_else.50277:
bnei_cont.50278:
	nop
	nop
	lw	%v1, 0(%sp)
	addi	%at, %zero, 4

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.50279

	nop
	nop
	nop
	lw	%a0, 2(%v0)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.50280

	nop
	nop
	lw	%a0, 3(%v0)
	sw	%v1, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50281

	nop
	nop
	lw	%a0, 6(%v0)
	flw	%f0, 493(%zero)

	nop
	nop
	lw	%a0, 0(%a0)
	fsw	%f0, 148(%zero)

	nop
	nop
	fsw	%f0, 149(%zero)
	lw	%a1, 7(%v0)

	nop
	fsw	%f0, 150(%zero)
	lw	%a2, 1(%v0)
	add	%at, %a1, %v1

	nop
	lw	%a0, 179(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v1

	nop
	nop
	lw	%a2, 0(%at)
	sw	%v0, 1(%sp)

	nop
	flw	%f1, 0(%a2)
	sw	%a2, 6(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)

	nop
	nop
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)

	nop
	nop
	fsw	%f1, 164(%zero)
	fsw	%f0, 7(%sp)

	nop
	nop
	lw	%a3, 0(%zero)
	sw	%a1, 8(%sp)

	nop
	nop
	addi	%a3, %a3, -1
	sw	%a0, 9(%sp)

	nop
	nop
	addi	%v1, %a3, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a1, 8(%sp)

	nop
	nop
	lw	%a0, 0(%v1)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 7(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.50283

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.50284

fbgt_else.50283:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.50284:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50285

	nop
	nop
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)

	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	trace_diffuse_ray.2977

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.50286

bnei_else.50285:
	nop
	flw	%f1, 439(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	trace_diffuse_ray.2977

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.50286:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	lw	%a0, 6(%sp)
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -11
	flw	%f0, 148(%zero)

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	lw	%v1, 5(%v0)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %v1, %a0

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)

	nop
	nop
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)

	nop
	nop
	nop
	fsw	%f0, 2(%v1)

	nop
	nop
	nop
	j	bnei_cont.50282

bnei_else.50281:
bnei_cont.50282:
	nop
	nop
	nop
	lw	%v1, 5(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	j	pretrace_diffuse_rays.3031

bgti_else.50280:
	nop
	nop
	nop
	jr	%ra

bgt_else.50279:
	nop
	nop
	nop
	jr	%ra

bgti_else.50276:
	nop
	nop
	nop
	jr	%ra

bgt_else.50275:
	nop
	nop
	nop
	jr	%ra

pretrace_pixels.3034:
	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.50315

	nop
	nop
	flw	%f3, 158(%zero)
	lw	%a2, 156(%zero)

	nop
	nop
	nop
	sub	%a2, %v1, %a2

	nop
	nop
	nop
	itof	%f4, %a2

	nop
	nop
	fmul	%f3, %f3, %f4
	flw	%f4, 165(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f4

	nop
	nop
	nop
	fadd	%f4, %f4, %f0

	nop
	nop
	nop
	fsw	%f4, 174(%zero)

	nop
	nop
	addi	%a2, %zero, 1
	flw	%f4, 166(%zero)

	nop
	nop
	nop
	fmul	%f4, %f3, %f4

	nop
	nop
	nop
	fadd	%f4, %f4, %f1

	nop
	nop
	nop
	fsw	%f4, 175(%zero)

	nop
	nop
	nop
	flw	%f4, 167(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f4

	nop
	nop
	nop
	fadd	%f3, %f3, %f2

	nop
	nop
	nop
	fsw	%f3, 176(%zero)

	nop
	nop
	flw	%f3, 174(%zero)
	flw	%f5, 175(%zero)

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f5, %f5

	nop
	nop
	fadd	%f4, %f4, %f6
	flw	%f6, 176(%zero)

	nop
	nop
	nop
	fmul	%f7, %f6, %f6

	nop
	nop
	fadd	%f4, %f4, %f7
	flw	%f7, 493(%zero)

	nop
	nop
	nop
	fsqrt	%f4, %f4

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.50316

	nop
	nop
	nop
	addi	%a3, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.50317

fbeq_else.50316:
	nop
	nop
	nop
	addi	%a3, %zero, 0

fbeq_cont.50317:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.50318

	nop
	nop
	nop
	flw	%f4, 491(%zero)

	nop
	nop
	nop
	j	bnei_cont.50319

bnei_else.50318:
	nop
	nop
	nop
	flw	%f8, 491(%zero)

	nop
	nop
	nop
	fdiv	%f4, %f8, %f4

bnei_cont.50319:
	nop
	fmul	%f3, %f3, %f4
	add	%at, %v0, %v1
	fsw	%f2, 0(%sp)

	nop
	fsw	%f3, 174(%zero)
	fmul	%f3, %f5, %f4
	lw	%a3, 0(%at)

	fsw	%f3, 175(%zero)
	fmul	%f3, %f6, %f4
	fsw	%f1, 1(%sp)
	fmov	%f1, %f7

	nop
	nop
	fsw	%f3, 176(%zero)
	fsw	%f0, 2(%sp)

	nop
	fsw	%f7, 151(%zero)
	sw	%v0, 3(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	fsw	%f7, 152(%zero)
	sw	%v1, 4(%sp)

	nop
	nop
	fsw	%f7, 153(%zero)
	sw	%a2, 5(%sp)

	nop
	nop
	flw	%f3, 75(%zero)
	fsw	%f7, 6(%sp)

	nop
	fsw	%f3, 159(%zero)
	sw	%a0, 7(%sp)
	addi	%a0, %a3, 0

	nop
	nop
	flw	%f3, 76(%zero)
	sw	%a3, 8(%sp)

	nop
	nop
	fsw	%f3, 160(%zero)
	sw	%ra, 9(%sp)

	nop
	nop
	flw	%f3, 77(%zero)
	addi	%sp, %sp, 10

	nop
	nop
	nop
	fsw	%f3, 161(%zero)

	nop
	nop
	flw	%f3, 491(%zero)
	addi	%t0, %zero, 174

	nop
	nop
	addi	%v1, %t0, 0
	fmov	%f0, %f3

	nop
	nop
	nop
	jal	trace_ray.2971

	nop
	nop
	addi	%sp, %sp, -10
	flw	%f0, 151(%zero)

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	lw	%v1, 0(%v0)
	lw	%a0, 7(%sp)

	nop
	nop
	fsw	%f0, 0(%v1)
	flw	%f0, 152(%zero)

	nop
	nop
	fsw	%f0, 1(%v1)
	flw	%f0, 153(%zero)

	nop
	nop
	nop
	fsw	%f0, 2(%v1)

	nop
	nop
	nop
	lw	%v1, 6(%v0)

	nop
	nop
	nop
	sw	%a0, 0(%v1)

	nop
	nop
	nop
	lw	%v1, 2(%v0)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.50320

	nop
	nop
	nop
	lw	%v1, 3(%v0)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.50322

	nop
	nop
	lw	%v1, 6(%v0)
	flw	%f0, 6(%sp)

	nop
	nop
	lw	%v1, 0(%v1)
	fsw	%f0, 148(%zero)

	nop
	nop
	fsw	%f0, 149(%zero)
	lw	%a1, 7(%v0)

	nop
	nop
	fsw	%f0, 150(%zero)
	lw	%a2, 1(%v0)

	nop
	nop
	lw	%v1, 179(%v1)
	lw	%a1, 0(%a1)

	nop
	nop
	nop
	lw	%a2, 0(%a2)

	nop
	flw	%f1, 0(%a2)
	sw	%a2, 9(%sp)
	addi	%v0, %a2, 0

	nop
	nop
	fsw	%f1, 162(%zero)
	flw	%f1, 1(%a2)

	nop
	nop
	fsw	%f1, 163(%zero)
	flw	%f1, 2(%a2)

	nop
	nop
	fsw	%f1, 164(%zero)
	sw	%a1, 10(%sp)

	nop
	nop
	lw	%a3, 0(%zero)
	sw	%v1, 11(%sp)

	nop
	nop
	addi	%a3, %a3, -1
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%v1, %a3, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a1, 10(%sp)

	nop
	nop
	lw	%a0, 0(%v1)
	flw	%f1, 0(%a1)

	nop
	nop
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a1)

	nop
	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 2(%a1)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%a0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 6(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.50324

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.50325

fbgt_else.50324:
	nop
	nop
	nop
	addi	%a0, %zero, 1

fbgt_cont.50325:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50326

	nop
	nop
	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)

	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	trace_diffuse_ray.2977

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	bnei_cont.50327

bnei_else.50326:
	nop
	flw	%f1, 439(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)

	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	trace_diffuse_ray.2977

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

bnei_cont.50327:
	nop
	addi	%a1, %zero, 116
	lw	%v0, 11(%sp)
	lw	%v1, 10(%sp)

	nop
	nop
	lw	%a0, 9(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	flw	%f0, 148(%zero)

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	nop
	lw	%v1, 5(%v0)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	fsw	%f0, 0(%v1)
	flw	%f0, 149(%zero)

	nop
	nop
	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)

	nop
	nop
	nop
	fsw	%f0, 2(%v1)

	nop
	nop
	nop
	j	bnei_cont.50323

bnei_else.50322:
bnei_cont.50323:
	nop
	nop
	lw	%v1, 5(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	pretrace_diffuse_rays.3031

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	bgti_cont.50321

bgti_else.50320:
bgti_cont.50321:
	nop
	nop
	nop
	lw	%v0, 4(%sp)

	nop
	nop
	addi	%v1, %v0, -1
	lw	%v0, 7(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 1

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.50328

	nop
	nop
	nop
	addi	%a0, %v0, -5

	nop
	nop
	nop
	j	bgti_cont.50329

bgti_else.50328:
	nop
	nop
	nop
	add	%a0, %zero, %v0

bgti_cont.50329:
	nop
	nop
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)

	nop
	nop
	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	j	pretrace_pixels.3034

bgti_else.50315:
	nop
	nop
	nop
	jr	%ra

scan_pixel.3045:
	nop
	nop
	addi	%a3, %zero, 0
	lw	%t0, 154(%zero)

	nop
	nop
	nop
	blt	%v0, %t0, bgt_else.52015

	nop
	nop
	nop
	jr	%ra

bgt_else.52015:
	nop
	nop
	add	%at, %a1, %v0
	addi	%t4, %v1, 1

	nop
	nop
	nop
	lw	%t1, 0(%at)

	nop
	nop
	nop
	lw	%t2, 0(%t1)

	nop
	nop
	nop
	flw	%f0, 0(%t2)

	nop
	nop
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%t2)

	nop
	addi	%t3, %zero, 1
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%t2)

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	lw	%t2, 155(%zero)

	nop
	nop
	nop
	blt	%t4, %t2, bgt_else.52017

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.52018

bgt_else.52017:
	nop
	nop
	nop
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52019

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.52020

bgt_else.52019:
	nop
	nop
	nop
	addi	%t5, %v0, 1

	nop
	nop
	nop
	blt	%t5, %t0, bgt_else.52021

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.52022

bgt_else.52021:
	nop
	nop
	nop
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.52023

	nop
	nop
	nop
	addi	%t5, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.52024

bgt_else.52023:
	nop
	nop
	nop
	addi	%t5, %zero, 1

bgt_cont.52024:
bgt_cont.52022:
bgt_cont.52020:
bgt_cont.52018:
	nop
	nop
	nop
	sw	%a2, 0(%sp)

	nop
	nop
	nop
	sw	%a0, 1(%sp)

	nop
	nop
	nop
	sw	%a3, 2(%sp)

	nop
	nop
	nop
	sw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%t4, 4(%sp)

	nop
	nop
	nop
	sw	%t2, 5(%sp)

	nop
	nop
	nop
	sw	%a1, 6(%sp)

	nop
	nop
	nop
	sw	%t0, 7(%sp)

	nop
	nop
	nop
	sw	%v0, 8(%sp)

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.52025

	nop
	nop
	nop
	lw	%t5, 2(%t1)

	nop
	nop
	nop
	lw	%t5, 0(%t5)

	nop
	nop
	nop
	blti	%t5, 0, bgti_else.52027

	nop
	nop
	lw	%t5, 2(%t1)
	add	%at, %a0, %v0

	nop
	nop
	lw	%t5, 0(%t5)
	lw	%t6, 0(%at)

	nop
	nop
	nop
	lw	%t7, 2(%t6)

	nop
	nop
	nop
	lw	%t7, 0(%t7)

	nop
	nop
	nop
	bne	%t7, %t5, beq_else.52029

	nop
	nop
	nop
	add	%at, %a2, %v0

	nop
	nop
	nop
	lw	%t7, 0(%at)

	nop
	nop
	nop
	lw	%t7, 2(%t7)

	nop
	nop
	nop
	lw	%t7, 0(%t7)

	nop
	nop
	nop
	bne	%t7, %t5, beq_else.52031

	nop
	nop
	nop
	addi	%t7, %v0, -1

	nop
	nop
	nop
	add	%at, %a1, %t7

	nop
	nop
	nop
	lw	%t7, 0(%at)

	nop
	nop
	nop
	lw	%t7, 2(%t7)

	nop
	nop
	nop
	lw	%t7, 0(%t7)

	nop
	nop
	nop
	bne	%t7, %t5, beq_else.52033

	nop
	nop
	nop
	addi	%t7, %v0, 1

	nop
	nop
	nop
	add	%at, %a1, %t7

	nop
	nop
	nop
	lw	%t7, 0(%at)

	nop
	nop
	nop
	lw	%t7, 2(%t7)

	nop
	nop
	nop
	lw	%t7, 0(%t7)

	nop
	nop
	nop
	bne	%t7, %t5, beq_else.52035

	nop
	nop
	nop
	addi	%t5, %zero, 1

	nop
	nop
	nop
	j	beq_cont.52030

beq_else.52035:
	nop
	nop
	nop
	addi	%t5, %zero, 0

beq_cont.52036:
	nop
	nop
	nop
	j	beq_cont.52030

beq_else.52033:
	nop
	nop
	nop
	addi	%t5, %zero, 0

beq_cont.52034:
	nop
	nop
	nop
	j	beq_cont.52030

beq_else.52031:
	nop
	nop
	nop
	addi	%t5, %zero, 0

beq_cont.52032:
	nop
	nop
	nop
	j	beq_cont.52030

beq_else.52029:
	nop
	nop
	nop
	addi	%t5, %zero, 0

beq_cont.52030:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.52037

	nop
	nop
	nop
	lw	%t5, 3(%t1)

	nop
	nop
	nop
	lw	%t5, 0(%t5)

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.52039

	lw	%t5, 5(%t6)
	addi	%t6, %v0, -1
	lw	%t7, 5(%t1)
	addi	%s0, %v0, 1

	nop
	add	%at, %a1, %t6
	lw	%t5, 0(%t5)
	lw	%t1, 4(%t1)

	nop
	lw	%t6, 0(%at)
	add	%at, %a1, %s0
	flw	%f0, 0(%t5)

	nop
	lw	%t6, 5(%t6)
	lw	%s0, 0(%at)
	add	%at, %a2, %v0

	nop
	nop
	lw	%s0, 5(%s0)
	lw	%s1, 0(%at)

	nop
	nop
	lw	%s1, 5(%s1)
	fsw	%f0, 148(%zero)

	nop
	nop
	flw	%f0, 1(%t5)
	lw	%t1, 0(%t1)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t5)

	nop
	nop
	fsw	%f0, 150(%zero)
	lw	%t5, 0(%t6)

	nop
	nop
	flw	%f0, 148(%zero)
	flw	%f1, 0(%t5)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t5)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t5)
	lw	%t5, 0(%t7)

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t5)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t5)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t5)
	lw	%t5, 0(%s0)

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t5)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t5)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t5)
	lw	%t5, 0(%s1)

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t5)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	nop
	flw	%f0, 148(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t5)

	nop
	nop
	nop
	fsw	%f0, 148(%zero)

	nop
	nop
	nop
	flw	%f0, 149(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t5)

	nop
	nop
	nop
	fsw	%f0, 149(%zero)

	nop
	nop
	nop
	flw	%f0, 150(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 0(%t1)

	nop
	nop
	nop
	fsw	%f0, 150(%zero)

	nop
	nop
	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%t1)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%t1)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.52040

bnei_else.52039:
bnei_cont.52040:
	nop
	nop
	addi	%a3, %t3, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	try_exploit_neighbors.3018

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

	nop
	nop
	nop
	j	bnei_cont.52026

bnei_else.52037:
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	nop
	lw	%ra, 9(%sp)

bnei_cont.52038:
	nop
	nop
	nop
	j	bnei_cont.52026

bgti_else.52027:
bgti_cont.52028:
	nop
	nop
	nop
	j	bnei_cont.52026

bnei_else.52025:
	nop
	nop
	nop
	lw	%t5, 2(%t1)

	nop
	nop
	nop
	lw	%t5, 0(%t5)

	nop
	nop
	nop
	blti	%t5, 0, bgti_else.52041

	nop
	nop
	lw	%t5, 3(%t1)
	sw	%t3, 9(%sp)

	nop
	nop
	lw	%t5, 0(%t5)
	sw	%t1, 10(%sp)

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.52043

	nop
	nop
	lw	%t5, 5(%t1)
	lw	%t6, 7(%t1)

	nop
	nop
	lw	%t7, 1(%t1)
	lw	%s0, 4(%t1)

	nop
	nop
	lw	%t5, 0(%t5)
	lw	%t6, 0(%t6)

	nop
	nop
	flw	%f0, 0(%t5)
	lw	%t7, 0(%t7)

	nop
	nop
	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t5)

	nop
	nop
	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t5)

	nop
	nop
	fsw	%f0, 150(%zero)
	lw	%t5, 6(%t1)

	nop
	nop
	lw	%t5, 0(%t5)
	sw	%s0, 11(%sp)

	nop
	nop
	nop
	sw	%t7, 12(%sp)

	nop
	nop
	nop
	sw	%t6, 13(%sp)

	nop
	nop
	nop
	sw	%t5, 14(%sp)

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.52045

	lw	%s1, 179(%zero)
	addi	%a0, %t7, 0
	addi	%v1, %t6, 0
	sw	%ra, 15(%sp)

	nop
	nop
	addi	%v0, %s1, 0
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bnei_cont.52046

bnei_else.52045:
bnei_cont.52046:
	nop
	nop
	nop
	lw	%v0, 14(%sp)

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.52047

	nop
	nop
	lw	%v1, 180(%zero)
	lw	%a0, 13(%sp)

	lw	%a1, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 15(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bnei_cont.52048

bnei_else.52047:
bnei_cont.52048:
	nop
	nop
	nop
	lw	%v0, 14(%sp)

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.52049

	nop
	nop
	lw	%v1, 181(%zero)
	lw	%a0, 13(%sp)

	lw	%a1, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 15(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bnei_cont.52050

bnei_else.52049:
bnei_cont.52050:
	nop
	nop
	nop
	lw	%v0, 14(%sp)

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.52051

	nop
	nop
	lw	%v1, 182(%zero)
	lw	%a0, 13(%sp)

	lw	%a1, 12(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 15(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bnei_cont.52052

bnei_else.52051:
bnei_cont.52052:
	nop
	nop
	nop
	lw	%v0, 14(%sp)

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.52053

	nop
	nop
	lw	%v0, 183(%zero)
	lw	%v1, 13(%sp)

	nop
	nop
	lw	%a0, 12(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bnei_cont.52054

bnei_else.52053:
bnei_cont.52054:
	nop
	nop
	lw	%v0, 11(%sp)
	flw	%f0, 151(%zero)

	nop
	nop
	lw	%v0, 0(%v0)
	flw	%f2, 148(%zero)

	nop
	nop
	nop
	flw	%f1, 0(%v0)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 1(%v0)

	nop
	nop
	nop
	fsw	%f0, 151(%zero)

	nop
	nop
	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v0)

	nop
	nop
	nop
	fsw	%f0, 152(%zero)

	nop
	nop
	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f1

	nop
	nop
	nop
	fsw	%f0, 153(%zero)

	nop
	nop
	nop
	j	bnei_cont.52044

bnei_else.52043:
bnei_cont.52044:
	nop
	nop
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)

	nop
	nop
	nop
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bgti_cont.52042

bgti_else.52041:
bgti_cont.52042:
bnei_cont.52026:
	nop
	nop
	flw	%f0, 151(%zero)
	addi	%at, %zero, 255

	nop
	nop
	nop
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.52055

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.52057

	nop
	nop
	nop
	j	bgt_cont.52056

bgti_else.52057:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52058:
	nop
	nop
	nop
	j	bgt_cont.52056

bgt_else.52055:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.52056:
	nop
	nop
	nop
	addi	%v1, %zero, 10

	nop
	nop
	nop
	sw	%v1, 15(%sp)

	nop
	nop
	nop
	sw	%v0, 16(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.52059

	nop
	nop
	nop
	addi	%a0, %v0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52061

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52063

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52065

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	sw	%ra, 17(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	nop
	lw	%ra, 17(%sp)

	nop
	nop
	nop
	j	bgti_cont.52060

bgti_else.52065:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.52066:
	nop
	nop
	nop
	j	bgti_cont.52060

bgti_else.52063:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52064:
	nop
	nop
	nop
	j	bgti_cont.52060

bgti_else.52061:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52062:
	nop
	nop
	nop
	j	bgti_cont.52060

bgti_else.52059:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52060:
	nop
	nop
	lw	%v1, 16(%sp)
	sw	%v0, 17(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52067

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52069

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52071

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52073

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52075

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52077

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52079

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52081

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52083

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52085

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52087

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52089

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 18(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52089:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52090:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52087:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52088:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52085:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52086:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52083:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52084:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52081:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52082:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52079:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52080:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52077:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52078:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52075:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52076:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52073:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52074:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52071:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52072:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52069:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52070:
	nop
	nop
	nop
	j	bgti_cont.52068

bgti_else.52067:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52068:
	nop
	nop
	lw	%v1, 17(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52091

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	bgt_cont.52092

bgt_else.52091:
	nop
	nop
	nop
	sw	%v0, 18(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52093

	nop
	nop
	nop
	addi	%a0, %v1, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52095

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52097

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52099

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	bgti_cont.52094

bgti_else.52099:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.52100:
	nop
	nop
	nop
	j	bgti_cont.52094

bgti_else.52097:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52098:
	nop
	nop
	nop
	j	bgti_cont.52094

bgti_else.52095:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52096:
	nop
	nop
	nop
	j	bgti_cont.52094

bgti_else.52093:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52094:
	nop
	nop
	lw	%v1, 17(%sp)
	sw	%v0, 19(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52101

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52103

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52105

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52107

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52109

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52111

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52113

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52115

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52117

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52119

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52121

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52123

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 20(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52123:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52124:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52121:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52122:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52119:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52120:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52117:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52118:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52115:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52116:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52113:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52114:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52111:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52112:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52109:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52110:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52107:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52108:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52105:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52106:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52103:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52104:
	nop
	nop
	nop
	j	bgti_cont.52102

bgti_else.52101:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52102:
	nop
	nop
	lw	%v1, 19(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52125

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	lw	%ra, 20(%sp)
	lw	%v0, 18(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	bgt_cont.52126

bgt_else.52125:
	nop
	nop
	nop
	sw	%v0, 20(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52127

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52129

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52131

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52133

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52135

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52137

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52139

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52141

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52143

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52145

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52147

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52149

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 21(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52149:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52150:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52147:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52148:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52145:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52146:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52143:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52144:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52141:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52142:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52139:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52140:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52137:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52138:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52135:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52136:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52133:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52134:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52131:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52132:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52129:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52130:
	nop
	nop
	nop
	j	bgti_cont.52128

bgti_else.52127:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52128:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v0, 20(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v0, 18(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

bgt_cont.52126:
bgt_cont.52092:
	nop
	nop
	nop
	addi	%v0, %zero, 32

	nop
	nop
	nop
	sw	%v0, 21(%sp)

	nop
	nop
	nop
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -23
	flw	%f0, 152(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 22(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.52151

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.52153

	nop
	nop
	nop
	j	bgt_cont.52152

bgti_else.52153:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52154:
	nop
	nop
	nop
	j	bgt_cont.52152

bgt_else.52151:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.52152:
	nop
	nop
	nop
	sw	%v0, 22(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.52155

	nop
	nop
	nop
	addi	%v1, %v0, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52157

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52159

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52161

	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4
	sw	%ra, 23(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

	nop
	nop
	nop
	j	bgti_cont.52156

bgti_else.52161:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.52162:
	nop
	nop
	nop
	j	bgti_cont.52156

bgti_else.52159:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52160:
	nop
	nop
	nop
	j	bgti_cont.52156

bgti_else.52157:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52158:
	nop
	nop
	nop
	j	bgti_cont.52156

bgti_else.52155:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52156:
	nop
	nop
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52163

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52165

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52167

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52169

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52171

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52173

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52175

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52177

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52179

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52181

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52183

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52185

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 24(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52185:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52186:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52183:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52184:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52181:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52182:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52179:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52180:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52177:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52178:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52175:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52176:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52173:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52174:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52171:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52172:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52169:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52170:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52167:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52168:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52165:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52166:
	nop
	nop
	nop
	j	bgti_cont.52164

bgti_else.52163:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52164:
	nop
	nop
	lw	%v1, 23(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52187

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	bgt_cont.52188

bgt_else.52187:
	nop
	nop
	nop
	sw	%v0, 24(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52189

	nop
	nop
	nop
	addi	%a0, %v1, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52191

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52193

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52195

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	sw	%ra, 25(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	bgti_cont.52190

bgti_else.52195:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.52196:
	nop
	nop
	nop
	j	bgti_cont.52190

bgti_else.52193:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52194:
	nop
	nop
	nop
	j	bgti_cont.52190

bgti_else.52191:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52192:
	nop
	nop
	nop
	j	bgti_cont.52190

bgti_else.52189:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52190:
	nop
	nop
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52197

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52199

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52201

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52203

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52205

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52207

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52209

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52211

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52213

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52215

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52217

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52219

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 26(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52219:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52220:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52217:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52218:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52215:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52216:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52213:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52214:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52211:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52212:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52209:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52210:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52207:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52208:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52205:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52206:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52203:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52204:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52201:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52202:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52199:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52200:
	nop
	nop
	nop
	j	bgti_cont.52198

bgti_else.52197:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52198:
	nop
	nop
	lw	%v1, 25(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52221

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v0, 24(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	bgt_cont.52222

bgt_else.52221:
	nop
	nop
	nop
	sw	%v0, 26(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52223

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52225

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52227

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52229

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52231

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52233

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52235

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52237

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52239

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52241

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52243

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52245

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 27(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52245:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52246:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52243:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52244:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52241:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52242:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52239:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52240:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52237:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52238:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52235:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52236:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52233:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52234:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52231:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52232:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52229:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52230:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52227:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52228:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52225:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52226:
	nop
	nop
	nop
	j	bgti_cont.52224

bgti_else.52223:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52224:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v0, 26(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v0, 24(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

bgt_cont.52222:
bgt_cont.52188:
	nop
	nop
	lw	%v0, 21(%sp)
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -28
	flw	%f0, 153(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 27(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.52247

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.52249

	nop
	nop
	nop
	j	bgt_cont.52248

bgti_else.52249:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52250:
	nop
	nop
	nop
	j	bgt_cont.52248

bgt_else.52247:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.52248:
	nop
	nop
	nop
	sw	%v0, 27(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.52251

	nop
	nop
	nop
	addi	%v1, %v0, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52253

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52255

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52257

	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4
	sw	%ra, 28(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	nop
	lw	%ra, 28(%sp)

	nop
	nop
	nop
	j	bgti_cont.52252

bgti_else.52257:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.52258:
	nop
	nop
	nop
	j	bgti_cont.52252

bgti_else.52255:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52256:
	nop
	nop
	nop
	j	bgti_cont.52252

bgti_else.52253:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52254:
	nop
	nop
	nop
	j	bgti_cont.52252

bgti_else.52251:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52252:
	nop
	nop
	lw	%v1, 27(%sp)
	sw	%v0, 28(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52259

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52261

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52263

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52265

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52267

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52269

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52271

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52273

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52275

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52277

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52279

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52281

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 29(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	nop
	lw	%ra, 29(%sp)

	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52281:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52282:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52279:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52280:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52277:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52278:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52275:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52276:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52273:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52274:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52271:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52272:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52269:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52270:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52267:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52268:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52265:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52266:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52263:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52264:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52261:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52262:
	nop
	nop
	nop
	j	bgti_cont.52260

bgti_else.52259:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52260:
	nop
	nop
	lw	%v1, 28(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52283

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	nop
	lw	%ra, 29(%sp)

	nop
	nop
	nop
	j	bgt_cont.52284

bgt_else.52283:
	nop
	nop
	nop
	sw	%v0, 29(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52285

	nop
	nop
	nop
	addi	%a0, %v1, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52287

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52289

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52291

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4
	sw	%ra, 30(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	nop
	lw	%ra, 30(%sp)

	nop
	nop
	nop
	j	bgti_cont.52286

bgti_else.52291:
	nop
	nop
	nop
	addi	%v0, %zero, 3

bgti_cont.52292:
	nop
	nop
	nop
	j	bgti_cont.52286

bgti_else.52289:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52290:
	nop
	nop
	nop
	j	bgti_cont.52286

bgti_else.52287:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52288:
	nop
	nop
	nop
	j	bgti_cont.52286

bgti_else.52285:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52286:
	nop
	nop
	lw	%v1, 28(%sp)
	sw	%v0, 30(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52293

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52295

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52297

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52299

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52301

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52303

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52305

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52307

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52309

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52311

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52313

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52315

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 31(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52315:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52316:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52313:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52314:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52311:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52312:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52309:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52310:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52307:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52308:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52305:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52306:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52303:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52304:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52301:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52302:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52299:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52300:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52297:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52298:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52295:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52296:
	nop
	nop
	nop
	j	bgti_cont.52294

bgti_else.52293:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52294:
	nop
	nop
	lw	%v1, 30(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52317

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 31(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	lw	%ra, 31(%sp)
	lw	%v0, 29(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 31(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	nop
	lw	%ra, 31(%sp)

	nop
	nop
	nop
	j	bgt_cont.52318

bgt_else.52317:
	nop
	nop
	nop
	sw	%v0, 31(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52319

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52321

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52323

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52325

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52327

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52329

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52331

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52333

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52335

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52337

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52339

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52341

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 32(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	nop
	lw	%ra, 32(%sp)

	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52341:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52342:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52339:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52340:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52337:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52338:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52335:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52336:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52333:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52334:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52331:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52332:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52329:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52330:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52327:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52328:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52325:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52326:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52323:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52324:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52321:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52322:
	nop
	nop
	nop
	j	bgti_cont.52320

bgti_else.52319:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52320:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	lw	%ra, 32(%sp)
	lw	%v0, 31(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	lw	%ra, 32(%sp)
	lw	%v0, 29(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	nop
	lw	%ra, 32(%sp)

bgt_cont.52318:
bgt_cont.52284:
	nop
	nop
	lw	%v0, 15(%sp)
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	lw	%ra, 32(%sp)
	lw	%v0, 8(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 7(%sp)

	nop
	nop
	nop
	blt	%v0, %v1, bgt_else.52343

	nop
	nop
	nop
	jr	%ra

bgt_else.52343:
	nop
	nop
	lw	%a1, 6(%sp)
	lw	%a3, 5(%sp)

	nop
	nop
	nop
	add	%at, %a1, %v0

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	lw	%a2, 0(%a0)

	nop
	nop
	nop
	flw	%f0, 0(%a2)

	nop
	nop
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)

	nop
	nop
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)

	nop
	nop
	fsw	%f0, 153(%zero)
	lw	%a2, 4(%sp)

	nop
	nop
	nop
	blt	%a2, %a3, bgt_else.52345

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.52346

bgt_else.52345:
	nop
	nop
	lw	%a2, 3(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.52347

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.52348

bgt_else.52347:
	nop
	nop
	nop
	addi	%a3, %v0, 1

	nop
	nop
	nop
	blt	%a3, %v1, bgt_else.52349

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.52350

bgt_else.52349:
	nop
	nop
	nop
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.52351

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.52352

bgt_else.52351:
	nop
	nop
	nop
	addi	%v1, %zero, 1

bgt_cont.52352:
bgt_cont.52350:
bgt_cont.52348:
bgt_cont.52346:
	nop
	nop
	nop
	sw	%v0, 32(%sp)

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.52353

	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)

	nop
	nop
	lw	%a2, 0(%sp)
	lw	%a3, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 33(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 34

	nop
	nop
	nop
	jal	try_exploit_neighbors.3018

	nop
	nop
	nop
	addi	%sp, %sp, -34

	nop
	nop
	nop
	lw	%ra, 33(%sp)

	nop
	nop
	nop
	j	bnei_cont.52354

bnei_else.52353:
	nop
	lw	%v1, 2(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 33(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 34

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	nop
	addi	%sp, %sp, -34

	nop
	nop
	nop
	lw	%ra, 33(%sp)

bnei_cont.52354:
	nop
	nop
	flw	%f0, 151(%zero)
	addi	%at, %zero, 255

	nop
	nop
	nop
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.52355

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.52357

	nop
	nop
	nop
	j	bgt_cont.52356

bgti_else.52357:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52358:
	nop
	nop
	nop
	j	bgt_cont.52356

bgt_else.52355:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.52356:
	nop
	nop
	nop
	sw	%v0, 33(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.52359

	nop
	nop
	nop
	addi	%v1, %v0, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52361

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52363

	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	sw	%ra, 34(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	nop
	lw	%ra, 34(%sp)

	nop
	nop
	nop
	j	bgti_cont.52360

bgti_else.52363:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52364:
	nop
	nop
	nop
	j	bgti_cont.52360

bgti_else.52361:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52362:
	nop
	nop
	nop
	j	bgti_cont.52360

bgti_else.52359:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52360:
	nop
	nop
	lw	%v1, 33(%sp)
	sw	%v0, 34(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52365

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52367

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52369

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52371

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52373

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52375

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52377

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52379

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52381

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52383

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52385

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 35(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 36

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -36

	nop
	nop
	nop
	lw	%ra, 35(%sp)

	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52385:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52386:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52383:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52384:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52381:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52382:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52379:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52380:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52377:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52378:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52375:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52376:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52373:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52374:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52371:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52372:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52369:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52370:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52367:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52368:
	nop
	nop
	nop
	j	bgti_cont.52366

bgti_else.52365:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52366:
	nop
	nop
	lw	%v1, 34(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52387

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 35(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 36

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -36

	nop
	nop
	nop
	lw	%ra, 35(%sp)

	nop
	nop
	nop
	j	bgt_cont.52388

bgt_else.52387:
	nop
	nop
	nop
	sw	%v0, 35(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52389

	nop
	nop
	nop
	addi	%a0, %v1, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52391

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52393

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	sw	%ra, 36(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	nop
	lw	%ra, 36(%sp)

	nop
	nop
	nop
	j	bgti_cont.52390

bgti_else.52393:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52394:
	nop
	nop
	nop
	j	bgti_cont.52390

bgti_else.52391:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52392:
	nop
	nop
	nop
	j	bgti_cont.52390

bgti_else.52389:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52390:
	nop
	nop
	lw	%v1, 34(%sp)
	sw	%v0, 36(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52395

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52397

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52399

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52401

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52403

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52405

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52407

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52409

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52411

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52413

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52415

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 37(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52415:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52416:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52413:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52414:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52411:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52412:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52409:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52410:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52407:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52408:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52405:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52406:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52403:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52404:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52401:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52402:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52399:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52400:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52397:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52398:
	nop
	nop
	nop
	j	bgti_cont.52396

bgti_else.52395:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52396:
	nop
	nop
	lw	%v1, 36(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52417

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 37(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	lw	%ra, 37(%sp)
	lw	%v0, 35(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 37(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	nop
	lw	%ra, 37(%sp)

	nop
	nop
	nop
	j	bgt_cont.52418

bgt_else.52417:
	nop
	nop
	nop
	sw	%v0, 37(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52419

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52421

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52423

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52425

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52427

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52429

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52431

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52433

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52435

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52437

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52439

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 38(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	nop
	lw	%ra, 38(%sp)

	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52439:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52440:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52437:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52438:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52435:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52436:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52433:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52434:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52431:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52432:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52429:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52430:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52427:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52428:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52425:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52426:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52423:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52424:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52421:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52422:
	nop
	nop
	nop
	j	bgti_cont.52420

bgti_else.52419:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52420:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	lw	%ra, 38(%sp)
	lw	%v0, 37(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	lw	%ra, 38(%sp)
	lw	%v0, 35(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	nop
	lw	%ra, 38(%sp)

bgt_cont.52418:
bgt_cont.52388:
	nop
	nop
	lw	%v0, 21(%sp)
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -39
	flw	%f0, 152(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 38(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.52441

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.52443

	nop
	nop
	nop
	j	bgt_cont.52442

bgti_else.52443:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52444:
	nop
	nop
	nop
	j	bgt_cont.52442

bgt_else.52441:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.52442:
	nop
	nop
	nop
	sw	%v0, 38(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.52445

	nop
	nop
	nop
	addi	%v1, %v0, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52447

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52449

	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	sw	%ra, 39(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	nop
	lw	%ra, 39(%sp)

	nop
	nop
	nop
	j	bgti_cont.52446

bgti_else.52449:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52450:
	nop
	nop
	nop
	j	bgti_cont.52446

bgti_else.52447:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52448:
	nop
	nop
	nop
	j	bgti_cont.52446

bgti_else.52445:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52446:
	nop
	nop
	lw	%v1, 38(%sp)
	sw	%v0, 39(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52451

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52453

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52455

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52457

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52459

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52461

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52463

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52465

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52467

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52469

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52471

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 40(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	nop
	lw	%ra, 40(%sp)

	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52471:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52472:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52469:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52470:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52467:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52468:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52465:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52466:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52463:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52464:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52461:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52462:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52459:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52460:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52457:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52458:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52455:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52456:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52453:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52454:
	nop
	nop
	nop
	j	bgti_cont.52452

bgti_else.52451:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52452:
	nop
	nop
	lw	%v1, 39(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52473

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	nop
	lw	%ra, 40(%sp)

	nop
	nop
	nop
	j	bgt_cont.52474

bgt_else.52473:
	nop
	nop
	nop
	sw	%v0, 40(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52475

	nop
	nop
	nop
	addi	%a0, %v1, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52477

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52479

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	sw	%ra, 41(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 42

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -42

	nop
	nop
	nop
	lw	%ra, 41(%sp)

	nop
	nop
	nop
	j	bgti_cont.52476

bgti_else.52479:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52480:
	nop
	nop
	nop
	j	bgti_cont.52476

bgti_else.52477:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52478:
	nop
	nop
	nop
	j	bgti_cont.52476

bgti_else.52475:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52476:
	nop
	nop
	lw	%v1, 39(%sp)
	sw	%v0, 41(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52481

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52483

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52485

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52487

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52489

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52491

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52493

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52495

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52497

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52499

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52501

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 42(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	nop
	lw	%ra, 42(%sp)

	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52501:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52502:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52499:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52500:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52497:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52498:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52495:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52496:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52493:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52494:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52491:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52492:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52489:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52490:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52487:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52488:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52485:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52486:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52483:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52484:
	nop
	nop
	nop
	j	bgti_cont.52482

bgti_else.52481:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52482:
	nop
	nop
	lw	%v1, 41(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52503

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v0, 40(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	nop
	lw	%ra, 42(%sp)

	nop
	nop
	nop
	j	bgt_cont.52504

bgt_else.52503:
	nop
	nop
	nop
	sw	%v0, 42(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52505

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52507

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52509

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52511

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52513

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52515

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52517

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52519

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52521

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52523

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52525

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 43(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 44

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -44

	nop
	nop
	nop
	lw	%ra, 43(%sp)

	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52525:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52526:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52523:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52524:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52521:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52522:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52519:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52520:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52517:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52518:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52515:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52516:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52513:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52514:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52511:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52512:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52509:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52510:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52507:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52508:
	nop
	nop
	nop
	j	bgti_cont.52506

bgti_else.52505:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52506:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 43(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 44

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -44

	nop
	nop
	lw	%ra, 43(%sp)
	lw	%v0, 42(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 43(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 44

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -44

	nop
	nop
	lw	%ra, 43(%sp)
	lw	%v0, 40(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 43(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 44

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -44

	nop
	nop
	nop
	lw	%ra, 43(%sp)

bgt_cont.52504:
bgt_cont.52474:
	nop
	nop
	lw	%v0, 21(%sp)
	sw	%ra, 43(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 44

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -44
	flw	%f0, 153(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 43(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.52527

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.52529

	nop
	nop
	nop
	j	bgt_cont.52528

bgti_else.52529:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52530:
	nop
	nop
	nop
	j	bgt_cont.52528

bgt_else.52527:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.52528:
	nop
	nop
	nop
	sw	%v0, 43(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.52531

	nop
	nop
	nop
	addi	%v1, %v0, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52533

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52535

	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	sw	%ra, 44(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 45

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -45

	nop
	nop
	nop
	lw	%ra, 44(%sp)

	nop
	nop
	nop
	j	bgti_cont.52532

bgti_else.52535:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52536:
	nop
	nop
	nop
	j	bgti_cont.52532

bgti_else.52533:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52534:
	nop
	nop
	nop
	j	bgti_cont.52532

bgti_else.52531:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52532:
	nop
	nop
	lw	%v1, 43(%sp)
	sw	%v0, 44(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52537

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52539

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52541

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52543

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52545

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52547

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52549

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52551

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52553

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52555

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52557

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 45(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 46

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -46

	nop
	nop
	nop
	lw	%ra, 45(%sp)

	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52557:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52558:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52555:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52556:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52553:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52554:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52551:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52552:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52549:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52550:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52547:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52548:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52545:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52546:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52543:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52544:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52541:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52542:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52539:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52540:
	nop
	nop
	nop
	j	bgti_cont.52538

bgti_else.52537:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52538:
	nop
	nop
	lw	%v1, 44(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52559

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 45(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 46

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -46

	nop
	nop
	nop
	lw	%ra, 45(%sp)

	nop
	nop
	nop
	j	bgt_cont.52560

bgt_else.52559:
	nop
	nop
	nop
	sw	%v0, 45(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52561

	nop
	nop
	nop
	addi	%a0, %v1, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52563

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.52565

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	sw	%ra, 46(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 47

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -47

	nop
	nop
	nop
	lw	%ra, 46(%sp)

	nop
	nop
	nop
	j	bgti_cont.52562

bgti_else.52565:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.52566:
	nop
	nop
	nop
	j	bgti_cont.52562

bgti_else.52563:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.52564:
	nop
	nop
	nop
	j	bgti_cont.52562

bgti_else.52561:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.52562:
	nop
	nop
	lw	%v1, 44(%sp)
	sw	%v0, 46(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52567

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52569

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52571

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52573

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52575

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52577

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52579

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52581

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52583

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52585

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52587

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 47(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 48

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -48

	nop
	nop
	nop
	lw	%ra, 47(%sp)

	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52587:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52588:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52585:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52586:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52583:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52584:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52581:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52582:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52579:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52580:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52577:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52578:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52575:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52576:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52573:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52574:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52571:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52572:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52569:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52570:
	nop
	nop
	nop
	j	bgti_cont.52568

bgti_else.52567:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52568:
	nop
	nop
	lw	%v1, 46(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.52589

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 47(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 48

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -48

	nop
	nop
	lw	%ra, 47(%sp)
	lw	%v0, 45(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 47(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 48

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -48

	nop
	nop
	nop
	lw	%ra, 47(%sp)

	nop
	nop
	nop
	j	bgt_cont.52590

bgt_else.52589:
	nop
	nop
	nop
	sw	%v0, 47(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52591

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52593

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52595

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52597

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52599

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52601

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52603

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52605

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52607

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52609

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.52611

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 48(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	nop
	lw	%ra, 48(%sp)

	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52611:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52612:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52609:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52610:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52607:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52608:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52605:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52606:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52603:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52604:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52601:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52602:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52599:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52600:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52597:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52598:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52595:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52596:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52593:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52594:
	nop
	nop
	nop
	j	bgti_cont.52592

bgti_else.52591:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.52592:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	lw	%ra, 48(%sp)
	lw	%v0, 47(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	lw	%ra, 48(%sp)
	lw	%v0, 45(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	nop
	lw	%ra, 48(%sp)

bgt_cont.52590:
bgt_cont.52560:
	nop
	nop
	lw	%v0, 15(%sp)
	sw	%ra, 48(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 49

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -49

	nop
	nop
	lw	%ra, 48(%sp)
	lw	%v0, 32(%sp)

	nop
	addi	%v0, %v0, 1
	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)

	nop
	nop
	lw	%a1, 6(%sp)
	lw	%a2, 0(%sp)

	nop
	nop
	nop
	j	scan_pixel.3045

scan_line.3051:
	nop
	nop
	addi	%a3, %zero, 1
	lw	%t0, 155(%zero)

	nop
	nop
	nop
	blt	%v0, %t0, bgt_else.53177

	nop
	nop
	nop
	jr	%ra

bgt_else.53177:
	nop
	nop
	nop
	addi	%t1, %t0, -1

	nop
	nop
	nop
	sw	%t1, 0(%sp)

	nop
	nop
	nop
	sw	%a2, 1(%sp)

	nop
	nop
	nop
	sw	%a3, 2(%sp)

	nop
	nop
	nop
	sw	%a1, 3(%sp)

	nop
	nop
	nop
	sw	%v1, 4(%sp)

	nop
	nop
	nop
	sw	%t0, 5(%sp)

	nop
	nop
	nop
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%a0, 7(%sp)

	nop
	nop
	nop
	blt	%v0, %t1, bgt_else.53179

	nop
	nop
	nop
	j	bgt_cont.53180

bgt_else.53179:
	addi	%t2, %v0, 1
	flw	%f0, 158(%zero)
	lw	%t3, 157(%zero)
	addi	%a0, %a2, 0

	sub	%t2, %t2, %t3
	flw	%f2, 171(%zero)
	flw	%f3, 172(%zero)
	addi	%v0, %a1, 0

	nop
	itof	%f1, %t2
	lw	%t2, 154(%zero)
	sw	%ra, 8(%sp)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	addi	%t2, %t2, -1

	nop
	nop
	fmul	%f1, %f0, %f1
	addi	%v1, %t2, 0

	nop
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	addi	%sp, %sp, 9

	nop
	nop
	nop
	fmul	%f2, %f0, %f2

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)

	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 173(%zero)
	fmov	%f29, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

	nop
	nop
	fmov	%f2, %f0
	fmov	%f0, %f1

	nop
	nop
	nop
	fmov	%f1, %f29

	nop
	nop
	nop
	jal	pretrace_pixels.3034

	nop
	nop
	nop
	addi	%sp, %sp, -9

	nop
	nop
	nop
	lw	%ra, 8(%sp)

bgt_cont.53180:
	nop
	addi	%v1, %zero, 0
	lw	%v0, 154(%zero)
	addi	%at, %zero, 0

	nop
	nop
	nop
	sw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%v0, 9(%sp)

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.53181

	nop
	nop
	nop
	j	bgt_cont.53182

bgt_else.53181:
	nop
	nop
	lw	%a1, 7(%sp)
	lw	%t0, 5(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%a1)

	nop
	nop
	nop
	lw	%a2, 0(%a0)

	nop
	nop
	nop
	flw	%f0, 0(%a2)

	nop
	nop
	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a2)

	nop
	nop
	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a2)

	nop
	nop
	fsw	%f0, 153(%zero)
	lw	%a2, 6(%sp)

	nop
	nop
	nop
	addi	%a3, %a2, 1

	nop
	nop
	nop
	blt	%a3, %t0, bgt_else.53183

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.53184

bgt_else.53183:
	nop
	nop
	nop
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.53185

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.53186

bgt_else.53185:
	nop
	nop
	nop
	addi	%at, %zero, 1

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.53187

	nop
	nop
	nop
	addi	%a3, %zero, 0

	nop
	nop
	nop
	j	bgt_cont.53188

bgt_else.53187:
	nop
	nop
	nop
	addi	%a3, %zero, 0

bgt_cont.53188:
bgt_cont.53186:
bgt_cont.53184:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.53189

	nop
	lw	%a0, 4(%sp)
	lw	%a3, 3(%sp)
	addi	%v0, %v1, 0

	nop
	addi	%k0, %a3, 0
	addi	%a3, %v1, 0
	sw	%ra, 10(%sp)

	nop
	nop
	addi	%v1, %a2, 0
	addi	%a2, %k0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	try_exploit_neighbors.3018

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

	nop
	nop
	nop
	j	bnei_cont.53190

bnei_else.53189:
	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	nop
	lw	%ra, 10(%sp)

bnei_cont.53190:
	nop
	nop
	flw	%f0, 151(%zero)
	addi	%at, %zero, 255

	nop
	nop
	nop
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.53191

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.53193

	nop
	nop
	nop
	j	bgt_cont.53192

bgti_else.53193:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.53194:
	nop
	nop
	nop
	j	bgt_cont.53192

bgt_else.53191:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.53192:
	nop
	nop
	nop
	addi	%v1, %zero, 10

	nop
	nop
	nop
	sw	%v1, 10(%sp)

	nop
	nop
	nop
	sw	%v0, 11(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.53195

	nop
	nop
	nop
	addi	%a0, %v0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.53197

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.53199

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	nop
	lw	%ra, 12(%sp)

	nop
	nop
	nop
	j	bgti_cont.53196

bgti_else.53199:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.53200:
	nop
	nop
	nop
	j	bgti_cont.53196

bgti_else.53197:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.53198:
	nop
	nop
	nop
	j	bgti_cont.53196

bgti_else.53195:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.53196:
	nop
	nop
	lw	%v1, 11(%sp)
	sw	%v0, 12(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53201

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53203

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53205

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53207

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53209

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53211

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53213

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53215

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53217

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53219

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53221

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 13(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	nop
	lw	%ra, 13(%sp)

	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53221:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53222:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53219:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53220:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53217:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53218:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53215:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53216:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53213:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53214:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53211:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53212:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53209:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53210:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53207:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53208:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53205:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53206:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53203:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53204:
	nop
	nop
	nop
	j	bgti_cont.53202

bgti_else.53201:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53202:
	nop
	nop
	lw	%v1, 12(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.53223

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	nop
	lw	%ra, 13(%sp)

	nop
	nop
	nop
	j	bgt_cont.53224

bgt_else.53223:
	nop
	nop
	nop
	sw	%v0, 13(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53225

	nop
	nop
	nop
	addi	%a0, %v1, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.53227

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.53229

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	sw	%ra, 14(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	nop
	lw	%ra, 14(%sp)

	nop
	nop
	nop
	j	bgti_cont.53226

bgti_else.53229:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.53230:
	nop
	nop
	nop
	j	bgti_cont.53226

bgti_else.53227:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.53228:
	nop
	nop
	nop
	j	bgti_cont.53226

bgti_else.53225:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.53226:
	nop
	nop
	lw	%v1, 12(%sp)
	sw	%v0, 14(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53231

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53233

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53235

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53237

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53239

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53241

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53243

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53245

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53247

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53249

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53251

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 15(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53251:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53252:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53249:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53250:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53247:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53248:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53245:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53246:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53243:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53244:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53241:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53242:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53239:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53240:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53237:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53238:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53235:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53236:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53233:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53234:
	nop
	nop
	nop
	j	bgti_cont.53232

bgti_else.53231:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53232:
	nop
	nop
	lw	%v1, 14(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.53253

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	bgt_cont.53254

bgt_else.53253:
	nop
	nop
	nop
	sw	%v0, 15(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53255

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53257

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53259

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53261

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53263

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53265

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53267

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53269

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53271

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53273

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53275

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 16(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53275:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53276:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53273:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53274:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53271:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53272:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53269:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53270:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53267:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53268:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53265:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53266:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53263:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53264:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53261:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53262:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53259:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53260:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53257:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53258:
	nop
	nop
	nop
	j	bgti_cont.53256

bgti_else.53255:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53256:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	lw	%v0, 15(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	lw	%v0, 13(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	nop
	lw	%ra, 16(%sp)

bgt_cont.53254:
bgt_cont.53224:
	nop
	nop
	nop
	addi	%v0, %zero, 32

	nop
	nop
	nop
	sw	%v0, 16(%sp)

	nop
	nop
	nop
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -18
	flw	%f0, 152(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 17(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.53277

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.53279

	nop
	nop
	nop
	j	bgt_cont.53278

bgti_else.53279:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.53280:
	nop
	nop
	nop
	j	bgt_cont.53278

bgt_else.53277:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.53278:
	nop
	nop
	nop
	sw	%v0, 17(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.53281

	nop
	nop
	nop
	addi	%v1, %v0, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53283

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53285

	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	sw	%ra, 18(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	nop
	lw	%ra, 18(%sp)

	nop
	nop
	nop
	j	bgti_cont.53282

bgti_else.53285:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.53286:
	nop
	nop
	nop
	j	bgti_cont.53282

bgti_else.53283:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.53284:
	nop
	nop
	nop
	j	bgti_cont.53282

bgti_else.53281:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.53282:
	nop
	nop
	lw	%v1, 17(%sp)
	sw	%v0, 18(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53287

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53289

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53291

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53293

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53295

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53297

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53299

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53301

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53303

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53305

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53307

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 19(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53307:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53308:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53305:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53306:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53303:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53304:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53301:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53302:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53299:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53300:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53297:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53298:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53295:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53296:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53293:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53294:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53291:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53292:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53289:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53290:
	nop
	nop
	nop
	j	bgti_cont.53288

bgti_else.53287:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53288:
	nop
	nop
	lw	%v1, 18(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.53309

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	bgt_cont.53310

bgt_else.53309:
	nop
	nop
	nop
	sw	%v0, 19(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53311

	nop
	nop
	nop
	addi	%a0, %v1, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.53313

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.53315

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	sw	%ra, 20(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	bgti_cont.53312

bgti_else.53315:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.53316:
	nop
	nop
	nop
	j	bgti_cont.53312

bgti_else.53313:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.53314:
	nop
	nop
	nop
	j	bgti_cont.53312

bgti_else.53311:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.53312:
	nop
	nop
	lw	%v1, 18(%sp)
	sw	%v0, 20(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53317

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53319

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53321

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53323

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53325

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53327

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53329

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53331

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53333

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53335

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53337

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 21(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53337:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53338:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53335:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53336:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53333:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53334:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53331:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53332:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53329:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53330:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53327:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53328:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53325:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53326:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53323:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53324:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53321:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53322:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53319:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53320:
	nop
	nop
	nop
	j	bgti_cont.53318

bgti_else.53317:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53318:
	nop
	nop
	lw	%v1, 20(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.53339

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v0, 19(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	nop
	lw	%ra, 21(%sp)

	nop
	nop
	nop
	j	bgt_cont.53340

bgt_else.53339:
	nop
	nop
	nop
	sw	%v0, 21(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53341

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53343

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53345

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53347

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53349

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53351

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53353

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53355

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53357

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53359

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53361

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 22(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53361:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53362:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53359:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53360:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53357:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53358:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53355:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53356:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53353:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53354:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53351:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53352:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53349:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53350:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53347:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53348:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53345:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53346:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53343:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53344:
	nop
	nop
	nop
	j	bgti_cont.53342

bgti_else.53341:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53342:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v0, 21(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v0, 19(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	nop
	lw	%ra, 22(%sp)

bgt_cont.53340:
bgt_cont.53310:
	nop
	nop
	lw	%v0, 16(%sp)
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	addi	%sp, %sp, -23
	flw	%f0, 153(%zero)
	addi	%at, %zero, 255

	nop
	nop
	lw	%ra, 22(%sp)
	ftoi	%v0, %f0

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.53363

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.53365

	nop
	nop
	nop
	j	bgt_cont.53364

bgti_else.53365:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.53366:
	nop
	nop
	nop
	j	bgt_cont.53364

bgt_else.53363:
	nop
	nop
	nop
	addi	%v0, %zero, 255

bgt_cont.53364:
	nop
	nop
	nop
	sw	%v0, 22(%sp)

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.53367

	nop
	nop
	nop
	addi	%v1, %v0, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53369

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53371

	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3
	sw	%ra, 23(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	nop
	lw	%ra, 23(%sp)

	nop
	nop
	nop
	j	bgti_cont.53368

bgti_else.53371:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.53372:
	nop
	nop
	nop
	j	bgti_cont.53368

bgti_else.53369:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.53370:
	nop
	nop
	nop
	j	bgti_cont.53368

bgti_else.53367:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.53368:
	nop
	nop
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53373

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53375

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53377

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53379

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53381

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53383

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53385

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53387

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53389

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53391

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53393

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 24(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53393:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53394:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53391:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53392:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53389:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53390:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53387:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53388:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53385:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53386:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53383:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53384:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53381:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53382:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53379:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53380:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53377:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53378:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53375:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53376:
	nop
	nop
	nop
	j	bgti_cont.53374

bgti_else.53373:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53374:
	nop
	nop
	lw	%v1, 23(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.53395

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	nop
	lw	%ra, 24(%sp)

	nop
	nop
	nop
	j	bgt_cont.53396

bgt_else.53395:
	nop
	nop
	nop
	sw	%v0, 24(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53397

	nop
	nop
	nop
	addi	%a0, %v1, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.53399

	nop
	nop
	nop
	addi	%a0, %a0, -10

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.53401

	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3
	sw	%ra, 25(%sp)

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	bgti_cont.53398

bgti_else.53401:
	nop
	nop
	nop
	addi	%v0, %zero, 2

bgti_cont.53402:
	nop
	nop
	nop
	j	bgti_cont.53398

bgti_else.53399:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bgti_cont.53400:
	nop
	nop
	nop
	j	bgti_cont.53398

bgti_else.53397:
	nop
	nop
	nop
	addi	%v0, %zero, 0

bgti_cont.53398:
	nop
	nop
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53403

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53405

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53407

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53409

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53411

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53413

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53415

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53417

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53419

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53421

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53423

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 26(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53423:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53424:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53421:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53422:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53419:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53420:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53417:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53418:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53415:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53416:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53413:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53414:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53411:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53412:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53409:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53410:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53407:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53408:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53405:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53406:
	nop
	nop
	nop
	j	bgti_cont.53404

bgti_else.53403:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53404:
	nop
	nop
	lw	%v1, 25(%sp)
	addi	%at, %zero, 0

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.53425

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v0, 24(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	nop
	lw	%ra, 26(%sp)

	nop
	nop
	nop
	j	bgt_cont.53426

bgt_else.53425:
	nop
	nop
	nop
	sw	%v0, 26(%sp)

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53427

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53429

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53431

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53433

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53435

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53437

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53439

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53441

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53443

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53445

	nop
	nop
	nop
	addi	%v1, %v1, -10

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.53447

	nop
	nop
	addi	%v1, %v1, -10
	sw	%ra, 27(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53447:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53448:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53445:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53446:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53443:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53444:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53441:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53442:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53439:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53440:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53437:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53438:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53435:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53436:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53433:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53434:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53431:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53432:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53429:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53430:
	nop
	nop
	nop
	j	bgti_cont.53428

bgti_else.53427:
	nop
	nop
	nop
	add	%v0, %zero, %v1

bgti_cont.53428:
	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v0, 26(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v0, 24(%sp)

	nop
	nop
	addi	%v0, %v0, 48
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

bgt_cont.53426:
bgt_cont.53396:
	nop
	nop
	lw	%v0, 10(%sp)
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v0, 2(%sp)

	nop
	nop
	lw	%v1, 6(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	lw	%a1, 7(%sp)
	lw	%a2, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	scan_pixel.3045

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

bgt_cont.53182:
	nop
	nop
	nop
	lw	%v0, 6(%sp)

	nop
	nop
	addi	%v1, %v0, 1
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, 2

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.53449

	nop
	nop
	nop
	addi	%a0, %v0, -5

	nop
	nop
	nop
	j	bgti_cont.53450

bgti_else.53449:
	nop
	nop
	nop
	add	%a0, %zero, %v0

bgti_cont.53450:
	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	blt	%v1, %v0, bgt_else.53451

	nop
	nop
	nop
	jr	%ra

bgt_else.53451:
	nop
	nop
	lw	%v0, 0(%sp)
	sw	%a0, 27(%sp)

	nop
	nop
	nop
	sw	%v1, 28(%sp)

	nop
	nop
	nop
	blt	%v1, %v0, bgt_else.53453

	nop
	nop
	nop
	j	bgt_cont.53454

bgt_else.53453:
	nop
	addi	%v0, %v1, 1
	flw	%f0, 158(%zero)
	lw	%a1, 157(%zero)

	nop
	sub	%v0, %v0, %a1
	flw	%f2, 171(%zero)
	flw	%f3, 172(%zero)

	nop
	itof	%f1, %v0
	lw	%v0, 9(%sp)
	lw	%a1, 4(%sp)

	fmul	%f0, %f0, %f1
	flw	%f1, 168(%zero)
	addi	%v0, %v0, -1
	sw	%ra, 29(%sp)

	nop
	nop
	fmul	%f1, %f0, %f1
	addi	%v1, %v0, 0

	nop
	fadd	%f1, %f1, %f2
	flw	%f2, 169(%zero)
	addi	%v0, %a1, 0

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%sp, %sp, 30

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 170(%zero)

	nop
	fmul	%f0, %f0, %f3
	flw	%f3, 173(%zero)
	fmov	%f29, %f2

	nop
	nop
	nop
	fadd	%f0, %f0, %f3

	nop
	nop
	fmov	%f2, %f0
	fmov	%f0, %f1

	nop
	nop
	nop
	fmov	%f1, %f29

	nop
	nop
	nop
	jal	pretrace_pixels.3034

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	nop
	lw	%ra, 29(%sp)

bgt_cont.53454:
	nop
	nop
	lw	%v0, 8(%sp)
	lw	%v1, 28(%sp)

	nop
	nop
	lw	%a0, 7(%sp)
	lw	%a1, 3(%sp)

	nop
	nop
	lw	%a2, 4(%sp)
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	scan_pixel.3045

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v0, 28(%sp)

	nop
	nop
	addi	%v0, %v0, 1
	lw	%v1, 27(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 2

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.53455

	nop
	nop
	nop
	addi	%a2, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.53456

bgti_else.53455:
	nop
	nop
	nop
	add	%a2, %zero, %v1

bgti_cont.53456:
	nop
	nop
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)

	nop
	nop
	nop
	lw	%a1, 7(%sp)

	nop
	nop
	nop
	j	scan_line.3051

init_line_elements.3061:
	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.53762

	nop
	addi	%a1, %zero, 3
	flw	%f0, 493(%zero)
	sw	%v1, 0(%sp)

	nop
	nop
	sw	%v0, 1(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%a0, 2(%sp)

	nop
	nop
	nop
	fsw	%f0, 3(%sp)

	nop
	nop
	nop
	sw	%a1, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -6

	nop
	nop
	lw	%ra, 5(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 5(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 6(%sp)
	addi	%v0, %zero, 5

	nop
	nop
	nop
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 1

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%a0, 4(%sp)
	sw	%v1, 7(%sp)

	nop
	nop
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 9(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 6(%sp)

	nop
	lw	%a0, 2(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 10(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 12(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 13(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 13(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -15
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -15

	nop
	nop
	lw	%ra, 14(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 14(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v1, 14(%sp)

	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 12(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 10(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 9(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 8(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 5(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 0(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.53763

	nop
	nop
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 16(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -18
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 17(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 17(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -18

	nop
	nop
	lw	%ra, 17(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 17(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 18(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 6(%sp)

	nop
	lw	%a0, 2(%sp)
	sw	%v0, 18(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 19(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -21
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 20(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	lw	%ra, 20(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 20(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 21(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 21(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -22

	nop
	nop
	lw	%ra, 21(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 21(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 22(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 22(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -24
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 23(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 23(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -24

	nop
	nop
	lw	%ra, 23(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 23(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 24(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -25

	nop
	nop
	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)

	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 22(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 21(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 20(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 19(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 18(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 17(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 16(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 15(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.53764

	nop
	nop
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	sw	%v0, 24(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 25(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	lw	%ra, 25(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 25(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -27
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 26(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 26(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -27

	nop
	nop
	lw	%ra, 26(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 26(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 27(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v1, 6(%sp)

	nop
	lw	%a0, 2(%sp)
	sw	%v0, 27(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	lw	%ra, 28(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 28(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 29(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -31
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 30(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 30(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -31

	nop
	nop
	lw	%ra, 30(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 30(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 31(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 31(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 32

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -32

	nop
	nop
	lw	%ra, 31(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 31(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -33
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 32(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 32(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 33

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -33

	nop
	nop
	lw	%ra, 32(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 32(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 33(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 34

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -34

	nop
	nop
	lw	%ra, 33(%sp)
	lw	%v1, 32(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 33(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 34

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -34

	nop
	nop
	lw	%ra, 33(%sp)
	lw	%v1, 32(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 33(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 34

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -34

	nop
	nop
	lw	%ra, 33(%sp)
	lw	%v1, 32(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 33(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 34

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -34

	nop
	nop
	lw	%ra, 33(%sp)
	lw	%v1, 32(%sp)

	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 31(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 30(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 29(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 28(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 27(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 26(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 25(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 24(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.53765

	nop
	nop
	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	sw	%v0, 33(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 34(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -35

	nop
	nop
	lw	%ra, 34(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 34(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 35(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 36

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -36
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 35(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 35(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 36

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -36

	nop
	nop
	lw	%ra, 35(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 35(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 36(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 36(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 6(%sp)

	nop
	lw	%a0, 2(%sp)
	sw	%v0, 36(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	sw	%ra, 37(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	lw	%ra, 37(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 37(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -39
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 38(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	lw	%ra, 38(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 38(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -40
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 39(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v0, 4(%v1)
	lw	%v0, 7(%sp)

	nop
	nop
	lw	%a0, 2(%sp)
	sw	%ra, 40(%sp)

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 41

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -41

	nop
	nop
	lw	%ra, 40(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 40(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 41(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 42

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -42
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 41(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 41(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 42

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -42

	nop
	nop
	lw	%ra, 41(%sp)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v1, 4(%sp)
	sw	%v0, 41(%sp)

	nop
	nop
	addi	%v0, %v1, 0
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)

	nop
	nop
	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)

	nop
	nop
	sw	%v0, 2(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)

	nop
	nop
	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 42(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 43

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -43

	nop
	nop
	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)

	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v1, 7(%v0)
	lw	%v1, 40(%sp)

	nop
	nop
	sw	%v1, 6(%v0)
	lw	%v1, 39(%sp)

	nop
	nop
	sw	%v1, 5(%v0)
	lw	%v1, 38(%sp)

	nop
	nop
	sw	%v1, 4(%v0)
	lw	%v1, 37(%sp)

	nop
	nop
	sw	%v1, 3(%v0)
	lw	%v1, 36(%sp)

	nop
	nop
	sw	%v1, 2(%v0)
	lw	%v1, 35(%sp)

	nop
	nop
	sw	%v1, 1(%v0)
	lw	%v1, 34(%sp)

	nop
	nop
	sw	%v1, 0(%v0)
	lw	%v1, 33(%sp)

	nop
	nop
	add	%at, %a0, %v1
	addi	%v1, %v1, -1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	j	init_line_elements.3061

bgti_else.53765:
	nop
	nop
	nop
	add	%v0, %zero, %a0

	nop
	nop
	nop
	jr	%ra

bgti_else.53764:
	nop
	nop
	nop
	add	%v0, %zero, %a0

	nop
	nop
	nop
	jr	%ra

bgti_else.53763:
	nop
	nop
	nop
	add	%v0, %zero, %a0

	nop
	nop
	nop
	jr	%ra

bgti_else.53762:
	nop
	nop
	nop
	jr	%ra

calc_dirvec.3071:
	nop
	nop
	nop
	blti	%v0, 5, bgti_else.55012

	nop
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	lw	%v0, 179(%v1)

	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 491(%zero)
	add	%at, %v0, %a0

	nop
	nop
	fadd	%f2, %f2, %f3
	lw	%v1, 0(%at)

	nop
	nop
	fsqrt	%f2, %f2
	lw	%v1, 0(%v1)

	nop
	nop
	fdiv	%f0, %f0, %f2
	fdiv	%f1, %f1, %f2

	nop
	fdiv	%f2, %f3, %f2
	fsw	%f0, 0(%v1)
	fneg	%f3, %f1

	nop
	fsw	%f1, 1(%v1)
	fneg	%f4, %f1
	fneg	%f5, %f2

	nop
	nop
	nop
	fsw	%f2, 2(%v1)

	nop
	nop
	nop
	addi	%v1, %a0, 40

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	fsw	%f0, 0(%v1)

	nop
	nop
	nop
	fsw	%f2, 1(%v1)

	nop
	nop
	fsw	%f3, 2(%v1)
	fneg	%f3, %f0

	nop
	nop
	nop
	addi	%v1, %a0, 80

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	fsw	%f2, 0(%v1)

	nop
	nop
	fsw	%f3, 1(%v1)
	fneg	%f3, %f0

	nop
	nop
	fsw	%f4, 2(%v1)
	fneg	%f4, %f1

	nop
	nop
	nop
	addi	%v1, %a0, 1

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	fsw	%f3, 0(%v1)
	fneg	%f3, %f0

	nop
	fsw	%f4, 1(%v1)
	fneg	%f4, %f2
	fneg	%f2, %f2

	nop
	nop
	nop
	fsw	%f5, 2(%v1)

	nop
	nop
	nop
	addi	%v1, %a0, 41

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v1, 0(%at)

	nop
	nop
	nop
	lw	%v1, 0(%v1)

	nop
	nop
	nop
	fsw	%f3, 0(%v1)

	nop
	nop
	nop
	fsw	%f4, 1(%v1)

	nop
	nop
	nop
	fsw	%f1, 2(%v1)

	nop
	nop
	nop
	addi	%v1, %a0, 81

	nop
	nop
	nop
	add	%at, %v0, %v1

	nop
	nop
	nop
	lw	%v0, 0(%at)

	nop
	nop
	nop
	lw	%v0, 0(%v0)

	nop
	nop
	nop
	fsw	%f2, 0(%v0)

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

	nop
	nop
	nop
	fsw	%f1, 2(%v0)

	nop
	nop
	nop
	jr	%ra

bgti_else.55012:
	nop
	fmul	%f0, %f1, %f1
	flw	%f1, 441(%zero)
	flw	%f4, 491(%zero)

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f6, 493(%zero)

	nop
	nop
	nop
	fsqrt	%f0, %f0

	nop
	nop
	nop
	fdiv	%f5, %f4, %f0

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.55014

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.55015

fbgt_else.55014:
	nop
	nop
	nop
	addi	%a1, %zero, 0

fbgt_cont.55015:
	nop
	nop
	fabs	%f7, %f5
	flw	%f8, 461(%zero)

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.55016

	nop
	nop
	nop
	flw	%f5, 454(%zero)

	nop
	nop
	nop
	fblt	%f7, %f5, fbgt_else.55018

	nop
	flw	%f5, 476(%zero)
	fdiv	%f7, %f4, %f7
	flw	%f12, 460(%zero)

	nop
	fmul	%f9, %f7, %f7
	fmul	%f12, %f12, %f7
	flw	%f13, 459(%zero)

	nop
	nop
	fmul	%f10, %f9, %f9
	fmul	%f12, %f12, %f9

	nop
	nop
	fmul	%f11, %f10, %f10
	fsub	%f12, %f7, %f12

	nop
	nop
	nop
	fmul	%f13, %f13, %f7

	nop
	nop
	nop
	fmul	%f13, %f13, %f10

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f7

	nop
	nop
	nop
	fmul	%f13, %f13, %f9

	nop
	nop
	nop
	fmul	%f13, %f13, %f10

	nop
	nop
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f7

	nop
	nop
	nop
	fmul	%f13, %f13, %f11

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f7

	nop
	nop
	nop
	fmul	%f9, %f13, %f9

	nop
	nop
	nop
	fmul	%f9, %f9, %f11

	nop
	nop
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)

	nop
	nop
	nop
	fmul	%f7, %f12, %f7

	nop
	nop
	nop
	fmul	%f7, %f7, %f10

	nop
	nop
	nop
	fmul	%f7, %f7, %f11

	nop
	nop
	nop
	fadd	%f7, %f9, %f7

	nop
	nop
	nop
	fsub	%f5, %f5, %f7

	nop
	nop
	nop
	j	fbgt_cont.55019

fbgt_else.55018:
	flw	%f5, 475(%zero)
	fsub	%f9, %f7, %f4
	fadd	%f7, %f7, %f4
	flw	%f12, 460(%zero)

	nop
	nop
	fdiv	%f7, %f9, %f7
	flw	%f13, 459(%zero)

	nop
	nop
	fmul	%f9, %f7, %f7
	fmul	%f12, %f12, %f7

	nop
	nop
	fmul	%f10, %f9, %f9
	fmul	%f12, %f12, %f9

	nop
	nop
	fmul	%f11, %f10, %f10
	fsub	%f12, %f7, %f12

	nop
	nop
	nop
	fmul	%f13, %f13, %f7

	nop
	nop
	nop
	fmul	%f13, %f13, %f10

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 458(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f7

	nop
	nop
	nop
	fmul	%f13, %f13, %f9

	nop
	nop
	nop
	fmul	%f13, %f13, %f10

	nop
	nop
	fsub	%f12, %f12, %f13
	flw	%f13, 457(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f7

	nop
	nop
	nop
	fmul	%f13, %f13, %f11

	nop
	nop
	fadd	%f12, %f12, %f13
	flw	%f13, 456(%zero)

	nop
	nop
	nop
	fmul	%f13, %f13, %f7

	nop
	nop
	nop
	fmul	%f9, %f13, %f9

	nop
	nop
	nop
	fmul	%f9, %f9, %f11

	nop
	nop
	fsub	%f9, %f12, %f9
	flw	%f12, 455(%zero)

	nop
	nop
	nop
	fmul	%f7, %f12, %f7

	nop
	nop
	nop
	fmul	%f7, %f7, %f10

	nop
	nop
	nop
	fmul	%f7, %f7, %f11

	nop
	nop
	nop
	fadd	%f7, %f9, %f7

	nop
	nop
	nop
	fadd	%f5, %f5, %f7

fbgt_cont.55019:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55020

	nop
	nop
	nop
	j	fbgt_cont.55017

bnei_else.55020:
	nop
	nop
	nop
	fneg	%f5, %f5

bnei_cont.55021:
	nop
	nop
	nop
	j	fbgt_cont.55017

fbgt_else.55016:
	nop
	fmul	%f7, %f5, %f5
	flw	%f11, 460(%zero)
	flw	%f12, 459(%zero)

	nop
	nop
	fmul	%f9, %f7, %f7
	fmul	%f11, %f11, %f5

	nop
	nop
	fmul	%f10, %f9, %f9
	fmul	%f11, %f11, %f7

	nop
	nop
	fsub	%f11, %f5, %f11
	fmul	%f12, %f12, %f5

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f5

	nop
	nop
	nop
	fmul	%f12, %f12, %f7

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f5

	nop
	nop
	nop
	fmul	%f12, %f12, %f10

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f5

	nop
	nop
	nop
	fmul	%f7, %f12, %f7

	nop
	nop
	nop
	fmul	%f7, %f7, %f10

	nop
	nop
	fsub	%f7, %f11, %f7
	flw	%f11, 455(%zero)

	nop
	nop
	nop
	fmul	%f5, %f11, %f5

	nop
	nop
	nop
	fmul	%f5, %f5, %f9

	nop
	nop
	nop
	fmul	%f5, %f5, %f10

	nop
	nop
	nop
	fadd	%f5, %f7, %f5

fbgt_cont.55017:
	nop
	nop
	fmul	%f5, %f5, %f2
	flw	%f7, 489(%zero)

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.55022

	nop
	nop
	nop
	addi	%a1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.55023

fbgt_else.55022:
	nop
	nop
	nop
	addi	%a1, %zero, 0

fbgt_cont.55023:
	nop
	fabs	%f9, %f5
	flw	%f10, 488(%zero)
	fsw	%f2, 0(%sp)

	nop
	nop
	nop
	sw	%a0, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	nop
	fsw	%f3, 3(%sp)

	nop
	nop
	nop
	fsw	%f8, 4(%sp)

	nop
	nop
	nop
	fsw	%f6, 5(%sp)

	nop
	nop
	nop
	fsw	%f1, 6(%sp)

	nop
	nop
	nop
	sw	%v0, 7(%sp)

	nop
	nop
	nop
	fsw	%f0, 8(%sp)

	nop
	nop
	nop
	fsw	%f5, 9(%sp)

	nop
	nop
	nop
	fsw	%f4, 10(%sp)

	nop
	nop
	nop
	sw	%a1, 11(%sp)

	nop
	nop
	nop
	fsw	%f7, 12(%sp)

	nop
	nop
	nop
	fsw	%f9, 13(%sp)

	nop
	nop
	nop
	fsw	%f10, 14(%sp)

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.55024

	nop
	nop
	nop
	flw	%f11, 487(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55026

	nop
	nop
	nop
	flw	%f11, 486(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55028

	nop
	nop
	nop
	flw	%f11, 485(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55030

	nop
	nop
	nop
	flw	%f11, 484(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55032

	nop
	nop
	nop
	flw	%f11, 483(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55034

	nop
	nop
	nop
	flw	%f11, 482(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55036

	nop
	nop
	nop
	flw	%f11, 481(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55038

	nop
	nop
	nop
	flw	%f11, 480(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55040

	nop
	nop
	nop
	flw	%f11, 479(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55042

	nop
	nop
	nop
	flw	%f11, 478(%zero)

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.55044

	nop
	flw	%f11, 477(%zero)
	fmov	%f0, %f9
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f1, %f11
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55044:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55045:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55042:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55043:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55040:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55041:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55038:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55039:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55036:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55037:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55034:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55035:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55032:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55033:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55030:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55031:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55028:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55029:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55026:
	nop
	nop
	nop
	fmov	%f0, %f11

fbgt_cont.55027:
	nop
	nop
	nop
	j	fbgt_cont.55025

fbgt_else.55024:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55025:
	nop
	nop
	flw	%f1, 13(%sp)
	flw	%f2, 14(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55046

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55048

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55050

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55052

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55054

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55056

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55047

fbgt_else.55056:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

fbgt_cont.55057:
	nop
	nop
	nop
	j	fbgt_cont.55047

fbgt_else.55054:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55055:
	nop
	nop
	nop
	j	fbgt_cont.55047

fbgt_else.55052:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55058

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55060

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55059

fbgt_else.55060:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

fbgt_cont.55061:
	nop
	nop
	nop
	j	fbgt_cont.55059

fbgt_else.55058:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55059:
fbgt_cont.55053:
	nop
	nop
	nop
	j	fbgt_cont.55047

fbgt_else.55050:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55051:
	nop
	nop
	nop
	j	fbgt_cont.55047

fbgt_else.55048:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55062

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55064

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55066

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55068

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55063

fbgt_else.55068:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

fbgt_cont.55069:
	nop
	nop
	nop
	j	fbgt_cont.55063

fbgt_else.55066:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55067:
	nop
	nop
	nop
	j	fbgt_cont.55063

fbgt_else.55064:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55070

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55072

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55071

fbgt_else.55072:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 15(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -16

	nop
	nop
	nop
	lw	%ra, 15(%sp)

fbgt_cont.55073:
	nop
	nop
	nop
	j	fbgt_cont.55071

fbgt_else.55070:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55071:
fbgt_cont.55065:
	nop
	nop
	nop
	j	fbgt_cont.55063

fbgt_else.55062:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55063:
fbgt_cont.55049:
	nop
	nop
	nop
	j	fbgt_cont.55047

fbgt_else.55046:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55047:
	nop
	nop
	nop
	flw	%f1, 12(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55074

	nop
	nop
	nop
	lw	%v0, 11(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.55076

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55075

bnei_else.55076:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.55077:
	nop
	nop
	nop
	j	fbgt_cont.55075

fbgt_else.55074:
	nop
	nop
	nop
	lw	%v0, 11(%sp)

fbgt_cont.55075:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55078

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.55079

fbgt_else.55078:
fbgt_cont.55079:
	nop
	nop
	nop
	flw	%f2, 476(%zero)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.55080

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.55081

fbgt_else.55080:
fbgt_cont.55081:
	nop
	nop
	nop
	flw	%f3, 475(%zero)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.55082

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.55083

fbgt_else.55082:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 471(%zero)
	flw	%f6, 10(%sp)

	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f7, 470(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f5, %f5, %f7
	flw	%f7, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.55083:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.55084

	nop
	nop
	nop
	j	bnei_cont.55085

bnei_else.55084:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.55085:
	nop
	nop
	flw	%f4, 9(%sp)
	flw	%f5, 14(%sp)

	nop
	nop
	fabs	%f4, %f4
	fsw	%f0, 15(%sp)

	nop
	nop
	nop
	fsw	%f3, 16(%sp)

	nop
	nop
	nop
	fsw	%f2, 17(%sp)

	nop
	nop
	nop
	fsw	%f4, 18(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.55086

	nop
	nop
	nop
	flw	%f6, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55088

	nop
	nop
	nop
	flw	%f6, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55090

	nop
	nop
	nop
	flw	%f6, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55092

	nop
	nop
	nop
	flw	%f6, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55094

	nop
	nop
	nop
	flw	%f6, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55096

	nop
	nop
	nop
	flw	%f6, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55098

	nop
	nop
	nop
	flw	%f6, 481(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55100

	nop
	nop
	nop
	flw	%f6, 480(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55102

	nop
	nop
	nop
	flw	%f6, 479(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55104

	nop
	nop
	nop
	flw	%f6, 478(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55106

	nop
	flw	%f6, 477(%zero)
	fmov	%f0, %f4
	sw	%ra, 19(%sp)

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55106:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55107:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55104:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55105:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55102:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55103:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55100:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55101:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55098:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55099:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55096:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55097:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55094:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55095:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55092:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55093:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55090:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55091:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55088:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55089:
	nop
	nop
	nop
	j	fbgt_cont.55087

fbgt_else.55086:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.55087:
	nop
	nop
	flw	%f1, 18(%sp)
	flw	%f2, 14(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55108

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55110

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55112

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55114

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55116

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55118

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 19(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55109

fbgt_else.55118:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 19(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

fbgt_cont.55119:
	nop
	nop
	nop
	j	fbgt_cont.55109

fbgt_else.55116:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55117:
	nop
	nop
	nop
	j	fbgt_cont.55109

fbgt_else.55114:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55120

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55122

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 19(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55121

fbgt_else.55122:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 19(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

fbgt_cont.55123:
	nop
	nop
	nop
	j	fbgt_cont.55121

fbgt_else.55120:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55121:
fbgt_cont.55115:
	nop
	nop
	nop
	j	fbgt_cont.55109

fbgt_else.55112:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55113:
	nop
	nop
	nop
	j	fbgt_cont.55109

fbgt_else.55110:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55124

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55126

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55128

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55130

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 19(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55125

fbgt_else.55130:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 19(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

fbgt_cont.55131:
	nop
	nop
	nop
	j	fbgt_cont.55125

fbgt_else.55128:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55129:
	nop
	nop
	nop
	j	fbgt_cont.55125

fbgt_else.55126:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55132

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55134

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 19(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55133

fbgt_else.55134:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 19(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	nop
	lw	%ra, 19(%sp)

fbgt_cont.55135:
	nop
	nop
	nop
	j	fbgt_cont.55133

fbgt_else.55132:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55133:
fbgt_cont.55127:
	nop
	nop
	nop
	j	fbgt_cont.55125

fbgt_else.55124:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55125:
fbgt_cont.55111:
	nop
	nop
	nop
	j	fbgt_cont.55109

fbgt_else.55108:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55109:
	nop
	nop
	nop
	flw	%f1, 12(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55136

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55137

fbgt_else.55136:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.55137:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55138

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.55139

fbgt_else.55138:
fbgt_cont.55139:
	nop
	nop
	nop
	flw	%f2, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.55140

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.55142

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55141

bnei_else.55142:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.55143:
	nop
	nop
	nop
	j	fbgt_cont.55141

fbgt_else.55140:
fbgt_cont.55141:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.55144

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.55145

fbgt_else.55144:
fbgt_cont.55145:
	nop
	nop
	nop
	flw	%f3, 16(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.55146

	nop
	fmul	%f0, %f0, %f0
	flw	%f5, 471(%zero)
	flw	%f6, 10(%sp)

	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0
	flw	%f7, 470(%zero)

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f5, %f5, %f7
	flw	%f7, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

	nop
	nop
	nop
	j	fbgt_cont.55147

fbgt_else.55146:
	nop
	fsub	%f0, %f2, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f4

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f0

	nop
	nop
	nop
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

fbgt_cont.55147:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.55148

	nop
	nop
	nop
	j	bnei_cont.55149

bnei_else.55148:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.55149:
	nop
	nop
	flw	%f4, 15(%sp)
	lw	%v0, 7(%sp)

	fdiv	%f0, %f4, %f0
	flw	%f4, 8(%sp)
	addi	%v0, %v0, 1
	flw	%f5, 6(%sp)

	nop
	nop
	fmul	%f0, %f0, %f4
	flw	%f7, 5(%sp)

	nop
	nop
	nop
	fmul	%f4, %f0, %f0

	nop
	nop
	fadd	%f4, %f4, %f5
	flw	%f5, 10(%sp)

	nop
	nop
	nop
	fsqrt	%f4, %f4

	nop
	nop
	nop
	fdiv	%f6, %f5, %f4

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.55150

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.55151

fbgt_else.55150:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.55151:
	nop
	nop
	fabs	%f8, %f6
	flw	%f9, 4(%sp)

	nop
	nop
	nop
	fblt	%f8, %f9, fbgt_else.55152

	nop
	nop
	nop
	flw	%f6, 454(%zero)

	nop
	nop
	nop
	fblt	%f8, %f6, fbgt_else.55154

	nop
	fdiv	%f6, %f5, %f8
	flw	%f11, 460(%zero)
	flw	%f12, 459(%zero)

	nop
	nop
	fmul	%f8, %f6, %f6
	fmul	%f11, %f11, %f6

	nop
	nop
	fmul	%f9, %f8, %f8
	fmul	%f11, %f11, %f8

	nop
	nop
	fmul	%f10, %f9, %f9
	fsub	%f11, %f6, %f11

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f12, %f12, %f8

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f12, %f12, %f10

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f8, %f12, %f8

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	fsub	%f8, %f11, %f8
	flw	%f11, 455(%zero)

	nop
	nop
	nop
	fmul	%f6, %f11, %f6

	nop
	nop
	nop
	fmul	%f6, %f6, %f9

	nop
	nop
	nop
	fmul	%f6, %f6, %f10

	nop
	nop
	nop
	fadd	%f6, %f8, %f6

	nop
	nop
	nop
	fsub	%f6, %f2, %f6

	nop
	nop
	nop
	j	fbgt_cont.55155

fbgt_else.55154:
	fsub	%f6, %f8, %f5
	fadd	%f8, %f8, %f5
	flw	%f11, 460(%zero)
	flw	%f12, 459(%zero)

	nop
	nop
	nop
	fdiv	%f6, %f6, %f8

	nop
	nop
	fmul	%f8, %f6, %f6
	fmul	%f11, %f11, %f6

	nop
	nop
	fmul	%f9, %f8, %f8
	fmul	%f11, %f11, %f8

	nop
	nop
	fmul	%f10, %f9, %f9
	fsub	%f11, %f6, %f11

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f12, %f12, %f8

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f12, %f12, %f10

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f8, %f12, %f8

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	fsub	%f8, %f11, %f8
	flw	%f11, 455(%zero)

	nop
	nop
	nop
	fmul	%f6, %f11, %f6

	nop
	nop
	nop
	fmul	%f6, %f6, %f9

	nop
	nop
	nop
	fmul	%f6, %f6, %f10

	nop
	nop
	nop
	fadd	%f6, %f8, %f6

	nop
	nop
	nop
	fadd	%f6, %f3, %f6

fbgt_cont.55155:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55156

	nop
	nop
	nop
	j	fbgt_cont.55153

bnei_else.55156:
	nop
	nop
	nop
	fneg	%f6, %f6

bnei_cont.55157:
	nop
	nop
	nop
	j	fbgt_cont.55153

fbgt_else.55152:
	nop
	fmul	%f8, %f6, %f6
	flw	%f11, 460(%zero)
	flw	%f12, 459(%zero)

	nop
	nop
	fmul	%f9, %f8, %f8
	fmul	%f11, %f11, %f6

	nop
	nop
	fmul	%f10, %f9, %f9
	fmul	%f11, %f11, %f8

	nop
	nop
	fsub	%f11, %f6, %f11
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 458(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f12, %f12, %f8

	nop
	nop
	nop
	fmul	%f12, %f12, %f9

	nop
	nop
	fsub	%f11, %f11, %f12
	flw	%f12, 457(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f12, %f12, %f10

	nop
	nop
	fadd	%f11, %f11, %f12
	flw	%f12, 456(%zero)

	nop
	nop
	nop
	fmul	%f12, %f12, %f6

	nop
	nop
	nop
	fmul	%f8, %f12, %f8

	nop
	nop
	nop
	fmul	%f8, %f8, %f10

	nop
	nop
	fsub	%f8, %f11, %f8
	flw	%f11, 455(%zero)

	nop
	nop
	nop
	fmul	%f6, %f11, %f6

	nop
	nop
	nop
	fmul	%f6, %f6, %f9

	nop
	nop
	nop
	fmul	%f6, %f6, %f10

	nop
	nop
	nop
	fadd	%f6, %f8, %f6

fbgt_cont.55153:
	nop
	nop
	nop
	flw	%f8, 3(%sp)

	nop
	nop
	nop
	fmul	%f6, %f6, %f8

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.55158

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbgt_cont.55159

fbgt_else.55158:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbgt_cont.55159:
	nop
	fabs	%f7, %f6
	flw	%f9, 14(%sp)
	fsw	%f0, 19(%sp)

	nop
	nop
	nop
	sw	%v0, 20(%sp)

	nop
	nop
	nop
	fsw	%f4, 21(%sp)

	nop
	nop
	nop
	fsw	%f6, 22(%sp)

	nop
	nop
	nop
	sw	%v1, 23(%sp)

	nop
	nop
	nop
	fsw	%f7, 24(%sp)

	nop
	nop
	nop
	fblt	%f7, %f9, fbgt_else.55160

	nop
	nop
	nop
	flw	%f10, 487(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55162

	nop
	nop
	nop
	flw	%f10, 486(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55164

	nop
	nop
	nop
	flw	%f10, 485(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55166

	nop
	nop
	nop
	flw	%f10, 484(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55168

	nop
	nop
	nop
	flw	%f10, 483(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55170

	nop
	nop
	nop
	flw	%f10, 482(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55172

	nop
	nop
	nop
	flw	%f10, 481(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55174

	nop
	nop
	nop
	flw	%f10, 480(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55176

	nop
	nop
	nop
	flw	%f10, 479(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55178

	nop
	nop
	nop
	flw	%f10, 478(%zero)

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.55180

	nop
	flw	%f10, 477(%zero)
	fmov	%f0, %f7
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f10
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55180:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55181:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55178:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55179:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55176:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55177:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55174:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55175:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55172:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55173:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55170:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55171:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55168:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55169:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55166:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55167:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55164:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55165:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55162:
	nop
	nop
	nop
	fmov	%f0, %f10

fbgt_cont.55163:
	nop
	nop
	nop
	j	fbgt_cont.55161

fbgt_else.55160:
	nop
	nop
	nop
	fmov	%f0, %f9

fbgt_cont.55161:
	nop
	nop
	flw	%f1, 24(%sp)
	flw	%f2, 14(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55182

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55184

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55186

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55188

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55190

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55192

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55183

fbgt_else.55192:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

fbgt_cont.55193:
	nop
	nop
	nop
	j	fbgt_cont.55183

fbgt_else.55190:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55191:
	nop
	nop
	nop
	j	fbgt_cont.55183

fbgt_else.55188:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55194

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55196

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55195

fbgt_else.55196:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

fbgt_cont.55197:
	nop
	nop
	nop
	j	fbgt_cont.55195

fbgt_else.55194:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55195:
fbgt_cont.55189:
	nop
	nop
	nop
	j	fbgt_cont.55183

fbgt_else.55186:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55187:
	nop
	nop
	nop
	j	fbgt_cont.55183

fbgt_else.55184:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55198

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55200

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55202

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55204

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55199

fbgt_else.55204:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

fbgt_cont.55205:
	nop
	nop
	nop
	j	fbgt_cont.55199

fbgt_else.55202:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55203:
	nop
	nop
	nop
	j	fbgt_cont.55199

fbgt_else.55200:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55206

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55208

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55207

fbgt_else.55208:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 25(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -26

	nop
	nop
	nop
	lw	%ra, 25(%sp)

fbgt_cont.55209:
	nop
	nop
	nop
	j	fbgt_cont.55207

fbgt_else.55206:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55207:
fbgt_cont.55201:
	nop
	nop
	nop
	j	fbgt_cont.55199

fbgt_else.55198:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55199:
fbgt_cont.55185:
	nop
	nop
	nop
	j	fbgt_cont.55183

fbgt_else.55182:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55183:
	nop
	nop
	nop
	flw	%f1, 12(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55210

	nop
	nop
	nop
	lw	%v0, 23(%sp)

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.55212

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55211

bnei_else.55212:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.55213:
	nop
	nop
	nop
	j	fbgt_cont.55211

fbgt_else.55210:
	nop
	nop
	nop
	lw	%v0, 23(%sp)

fbgt_cont.55211:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55214

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.55215

fbgt_else.55214:
fbgt_cont.55215:
	nop
	nop
	nop
	flw	%f2, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.55216

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.55217

fbgt_else.55216:
fbgt_cont.55217:
	nop
	nop
	nop
	flw	%f3, 16(%sp)

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.55218

	nop
	fmul	%f4, %f0, %f0
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)

	nop
	nop
	fmul	%f5, %f4, %f4
	fmul	%f6, %f6, %f0

	nop
	nop
	fmul	%f6, %f6, %f4
	fmul	%f7, %f7, %f0

	nop
	nop
	fsub	%f6, %f0, %f6
	fmul	%f7, %f7, %f5

	nop
	nop
	fadd	%f6, %f6, %f7
	flw	%f7, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fmul	%f0, %f0, %f5

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	j	fbgt_cont.55219

fbgt_else.55218:
	nop
	fsub	%f0, %f2, %f0
	flw	%f5, 471(%zero)
	flw	%f6, 10(%sp)

	nop
	nop
	fmul	%f0, %f0, %f0
	flw	%f7, 470(%zero)

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	nop
	nop
	fadd	%f5, %f5, %f7
	flw	%f7, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f7, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f4

	nop
	nop
	nop
	fsub	%f0, %f5, %f0

fbgt_cont.55219:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.55220

	nop
	nop
	nop
	j	bnei_cont.55221

bnei_else.55220:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.55221:
	nop
	nop
	flw	%f4, 22(%sp)
	flw	%f5, 14(%sp)

	nop
	nop
	fabs	%f4, %f4
	fsw	%f0, 25(%sp)

	nop
	nop
	nop
	fsw	%f4, 26(%sp)

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.55222

	nop
	nop
	nop
	flw	%f6, 487(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55224

	nop
	nop
	nop
	flw	%f6, 486(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55226

	nop
	nop
	nop
	flw	%f6, 485(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55228

	nop
	nop
	nop
	flw	%f6, 484(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55230

	nop
	nop
	nop
	flw	%f6, 483(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55232

	nop
	nop
	nop
	flw	%f6, 482(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55234

	nop
	nop
	nop
	flw	%f6, 481(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55236

	nop
	nop
	nop
	flw	%f6, 480(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55238

	nop
	nop
	nop
	flw	%f6, 479(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55240

	nop
	nop
	nop
	flw	%f6, 478(%zero)

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.55242

	nop
	flw	%f6, 477(%zero)
	fmov	%f0, %f4
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55242:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55243:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55240:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55241:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55238:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55239:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55236:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55237:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55234:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55235:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55232:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55233:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55230:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55231:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55228:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55229:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55226:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55227:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55224:
	nop
	nop
	nop
	fmov	%f0, %f6

fbgt_cont.55225:
	nop
	nop
	nop
	j	fbgt_cont.55223

fbgt_else.55222:
	nop
	nop
	nop
	fmov	%f0, %f5

fbgt_cont.55223:
	nop
	nop
	flw	%f1, 26(%sp)
	flw	%f2, 14(%sp)

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55244

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55246

	nop
	nop
	fsub	%f1, %f1, %f0
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55248

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55250

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55252

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55254

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55245

fbgt_else.55254:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

fbgt_cont.55255:
	nop
	nop
	nop
	j	fbgt_cont.55245

fbgt_else.55252:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55253:
	nop
	nop
	nop
	j	fbgt_cont.55245

fbgt_else.55250:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55256

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55258

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55257

fbgt_else.55258:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

fbgt_cont.55259:
	nop
	nop
	nop
	j	fbgt_cont.55257

fbgt_else.55256:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55257:
fbgt_cont.55251:
	nop
	nop
	nop
	j	fbgt_cont.55245

fbgt_else.55248:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55249:
	nop
	nop
	nop
	j	fbgt_cont.55245

fbgt_else.55246:
	nop
	nop
	nop
	flw	%f3, 494(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55260

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55262

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55264

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55266

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55261

fbgt_else.55266:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

fbgt_cont.55267:
	nop
	nop
	nop
	j	fbgt_cont.55261

fbgt_else.55264:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55265:
	nop
	nop
	nop
	j	fbgt_cont.55261

fbgt_else.55262:
	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.55268

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55270

	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

	nop
	nop
	nop
	j	fbgt_cont.55269

fbgt_else.55270:
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	sw	%ra, 27(%sp)

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	nop
	lw	%ra, 27(%sp)

fbgt_cont.55271:
	nop
	nop
	nop
	j	fbgt_cont.55269

fbgt_else.55268:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55269:
fbgt_cont.55263:
	nop
	nop
	nop
	j	fbgt_cont.55261

fbgt_else.55260:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55261:
fbgt_cont.55247:
	nop
	nop
	nop
	j	fbgt_cont.55245

fbgt_else.55244:
	nop
	nop
	nop
	fmov	%f0, %f1

fbgt_cont.55245:
	nop
	nop
	nop
	flw	%f1, 12(%sp)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55272

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55273

fbgt_else.55272:
	nop
	nop
	nop
	addi	%v0, %zero, 1

fbgt_cont.55273:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55274

	nop
	nop
	nop
	fsub	%f0, %f0, %f1

	nop
	nop
	nop
	j	fbgt_cont.55275

fbgt_else.55274:
fbgt_cont.55275:
	nop
	nop
	nop
	flw	%f2, 17(%sp)

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.55276

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.55278

	nop
	nop
	nop
	addi	%v0, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55277

bnei_else.55278:
	nop
	nop
	nop
	addi	%v0, %zero, 1

bnei_cont.55279:
	nop
	nop
	nop
	j	fbgt_cont.55277

fbgt_else.55276:
fbgt_cont.55277:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.55280

	nop
	nop
	nop
	fsub	%f0, %f1, %f0

	nop
	nop
	nop
	j	fbgt_cont.55281

fbgt_else.55280:
fbgt_cont.55281:
	nop
	nop
	nop
	flw	%f1, 16(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55282

	nop
	fmul	%f0, %f0, %f0
	flw	%f2, 471(%zero)
	flw	%f3, 10(%sp)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f2, %f2, %f0

	nop
	nop
	fsub	%f2, %f3, %f2
	flw	%f3, 470(%zero)

	nop
	nop
	nop
	fmul	%f3, %f3, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	flw	%f3, 469(%zero)

	nop
	nop
	nop
	fmul	%f0, %f3, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fsub	%f0, %f2, %f0

	nop
	nop
	nop
	j	fbgt_cont.55283

fbgt_else.55282:
	nop
	fsub	%f0, %f2, %f0
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f3, %f3, %f1

	nop
	nop
	fsub	%f3, %f0, %f3
	fmul	%f4, %f4, %f0

	nop
	nop
	nop
	fmul	%f4, %f4, %f2

	nop
	nop
	fadd	%f3, %f3, %f4
	flw	%f4, 472(%zero)

	nop
	nop
	nop
	fmul	%f0, %f4, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f1

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fsub	%f0, %f3, %f0

fbgt_cont.55283:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.55284

	nop
	nop
	nop
	j	bnei_cont.55285

bnei_else.55284:
	nop
	nop
	nop
	fneg	%f0, %f0

bnei_cont.55285:
	nop
	nop
	flw	%f1, 25(%sp)
	flw	%f2, 0(%sp)

	nop
	fdiv	%f0, %f1, %f0
	flw	%f1, 21(%sp)
	flw	%f3, 3(%sp)

	nop
	fmul	%f1, %f0, %f1
	flw	%f0, 19(%sp)
	lw	%v0, 20(%sp)

	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)

	nop
	nop
	nop
	j	calc_dirvec.3071

calc_dirvecs.3079:
	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55314

	nop
	itof	%f1, %v0
	flw	%f2, 459(%zero)
	flw	%f3, 438(%zero)

	nop
	fmul	%f1, %f1, %f2
	flw	%f4, 493(%zero)
	fsw	%f3, 0(%sp)

	nop
	fsub	%f1, %f1, %f3
	fsw	%f0, 1(%sp)
	fmov	%f3, %f0

	nop
	nop
	fsw	%f4, 2(%sp)
	fmov	%f0, %f4

	nop
	nop
	nop
	sw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%a1, 4(%sp)

	nop
	nop
	nop
	sw	%a0, 5(%sp)

	nop
	fsw	%f2, 6(%sp)
	fmov	%f2, %f1
	fmov	%f1, %f4

	nop
	nop
	sw	%v0, 7(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	addi	%sp, %sp, -9
	flw	%f2, 441(%zero)

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)

	nop
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	lw	%v1, 5(%sp)

	fmul	%f0, %f0, %f1
	addi	%a0, %v1, 2
	flw	%f3, 2(%sp)
	flw	%f4, 1(%sp)

	fadd	%f0, %f0, %f2
	lw	%a1, 4(%sp)
	lw	%a2, 3(%sp)
	fmov	%f1, %f3

	nop
	sw	%a0, 8(%sp)
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0

	nop
	fsw	%f2, 9(%sp)
	fmov	%f2, %f0
	fmov	%f0, %f3

	nop
	nop
	fmov	%f3, %f4
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)

	nop
	nop
	addi	%v0, %v0, -1
	lw	%v1, 3(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.55315

	nop
	nop
	nop
	addi	%v1, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.55316

bgti_else.55315:
bgti_cont.55316:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55317

	nop
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	flw	%f2, 0(%sp)

	nop
	fmul	%f0, %f0, %f1
	flw	%f3, 1(%sp)
	lw	%a0, 4(%sp)

	nop
	fsub	%f2, %f0, %f2
	flw	%f0, 2(%sp)
	lw	%a1, 5(%sp)

	nop
	nop
	sw	%v1, 10(%sp)
	fmov	%f1, %f0

	nop
	sw	%v0, 11(%sp)
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	itof	%f0, %v0
	flw	%f1, 6(%sp)
	flw	%f3, 1(%sp)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 9(%sp)
	lw	%v1, 4(%sp)

	fadd	%f2, %f0, %f1
	flw	%f0, 2(%sp)
	lw	%a0, 10(%sp)
	addi	%v0, %v1, 0

	lw	%a1, 8(%sp)
	addi	%v1, %a0, 0
	fmov	%f1, %f0
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.55318

	nop
	nop
	nop
	addi	%v1, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.55319

bgti_else.55318:
bgti_cont.55319:
	nop
	nop
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	j	calc_dirvecs.3079

bgti_else.55317:
	nop
	nop
	nop
	jr	%ra

bgti_else.55314:
	nop
	nop
	nop
	jr	%ra

calc_dirvec_rows.3084:
	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55342

	itof	%f0, %v0
	flw	%f1, 459(%zero)
	flw	%f2, 438(%zero)
	addi	%a2, %zero, 4

	nop
	fmul	%f0, %f0, %f1
	flw	%f4, 493(%zero)
	fsw	%f2, 0(%sp)

	nop
	fsub	%f3, %f0, %f2
	itof	%f0, %a2
	sw	%v0, 1(%sp)

	nop
	fmul	%f0, %f0, %f1
	fsw	%f3, 2(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	fsub	%f0, %f0, %f2
	fsw	%f4, 3(%sp)

	nop
	sw	%v1, 4(%sp)
	fmov	%f2, %f0
	fmov	%f0, %f4

	nop
	nop
	nop
	sw	%a1, 5(%sp)

	nop
	nop
	nop
	sw	%a0, 6(%sp)

	nop
	nop
	fsw	%f1, 7(%sp)
	fmov	%f1, %f4

	nop
	nop
	nop
	sw	%a2, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	addi	%sp, %sp, -10
	flw	%f2, 441(%zero)

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)

	nop
	itof	%f0, %v0
	flw	%f1, 7(%sp)
	lw	%v1, 6(%sp)

	fmul	%f0, %f0, %f1
	addi	%a0, %v1, 2
	flw	%f3, 2(%sp)
	lw	%a1, 5(%sp)

	fadd	%f2, %f0, %f2
	flw	%f0, 3(%sp)
	lw	%a2, 4(%sp)
	addi	%v0, %a1, 0

	nop
	addi	%v1, %a2, 0
	fmov	%f1, %f0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v0, %zero, 3

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	addi	%a0, %v1, 1

	nop
	nop
	nop
	blti	%a0, 5, bgti_else.55343

	nop
	nop
	nop
	addi	%a0, %a0, -5

	nop
	nop
	nop
	j	bgti_cont.55344

bgti_else.55343:
bgti_cont.55344:
	nop
	flw	%f0, 2(%sp)
	lw	%a1, 6(%sp)
	addi	%v1, %a0, 0

	nop
	nop
	addi	%a0, %a1, 0
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	calc_dirvecs.3079

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	addi	%v0, %v0, -1
	lw	%v1, 4(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 2

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.55345

	nop
	nop
	nop
	addi	%v1, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.55346

bgti_else.55345:
bgti_cont.55346:
	nop
	nop
	nop
	lw	%a0, 6(%sp)

	nop
	nop
	nop
	addi	%a0, %a0, 4

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55347

	nop
	itof	%f0, %v0
	flw	%f1, 7(%sp)
	lw	%a1, 8(%sp)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 0(%sp)
	sw	%a0, 9(%sp)

	nop
	nop
	fsub	%f0, %f0, %f1
	sw	%v1, 10(%sp)

	nop
	nop
	sw	%v0, 11(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	calc_dirvecs.3079

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	addi	%v0, %v0, -1
	lw	%v1, 10(%sp)

	nop
	nop
	nop
	addi	%v1, %v1, 2

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.55348

	nop
	nop
	nop
	addi	%v1, %v1, -5

	nop
	nop
	nop
	j	bgti_cont.55349

bgti_else.55348:
bgti_cont.55349:
	nop
	nop
	nop
	lw	%a0, 9(%sp)

	nop
	nop
	nop
	addi	%a0, %a0, 4

	nop
	nop
	nop
	j	calc_dirvec_rows.3084

bgti_else.55347:
	nop
	nop
	nop
	jr	%ra

bgti_else.55342:
	nop
	nop
	nop
	jr	%ra

create_dirvec_elements.3090:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.55374

	nop
	nop
	addi	%a0, %zero, 3
	flw	%f0, 493(%zero)

	nop
	nop
	nop
	fsw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%a0, 1(%sp)

	nop
	nop
	nop
	sw	%v1, 2(%sp)

	nop
	nop
	sw	%v0, 3(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)

	nop
	nop
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -7
	add	%v1, %zero, %hp

	nop
	lw	%ra, 6(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 5(%sp)
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 2(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55375

	nop
	nop
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 6(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	add	%v1, %zero, %hp

	nop
	lw	%ra, 8(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 7(%sp)
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55376

	nop
	nop
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 9(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -11
	add	%v1, %zero, %hp

	nop
	lw	%ra, 10(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 9(%sp)
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 8(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %v1, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55377

	nop
	nop
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 10(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 11(%sp)

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -13
	add	%v1, %zero, %hp

	nop
	lw	%ra, 12(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 11(%sp)
	lw	%a0, 3(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 10(%sp)

	nop
	nop
	add	%at, %a0, %v1
	addi	%v1, %v1, -1

	nop
	nop
	sw	%v0, 0(%at)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	j	create_dirvec_elements.3090

bgti_else.55377:
	nop
	nop
	nop
	jr	%ra

bgti_else.55376:
	nop
	nop
	nop
	jr	%ra

bgti_else.55375:
	nop
	nop
	nop
	jr	%ra

bgti_else.55374:
	nop
	nop
	nop
	jr	%ra

create_dirvecs.3093:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55420

	nop
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3
	flw	%f0, 493(%zero)

	nop
	nop
	nop
	fsw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%a0, 1(%sp)

	nop
	nop
	sw	%v0, 2(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%v1, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 4(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0
	lw	%v0, 0(%zero)

	nop
	nop
	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -7
	add	%v1, %zero, %hp

	nop
	lw	%ra, 6(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	nop
	lw	%v0, 5(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -7

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v1, 2(%sp)

	nop
	nop
	sw	%v0, 179(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 179(%v1)
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v0, 6(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 7(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	add	%v1, %zero, %hp

	nop
	lw	%ra, 8(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 7(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)

	nop
	nop
	sw	%v0, 118(%v1)
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 8(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 8(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -10
	add	%v1, %zero, %hp

	nop
	lw	%ra, 9(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 8(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	lw	%a0, 1(%sp)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)

	nop
	nop
	sw	%v0, 117(%v1)
	addi	%v0, %zero, 116

	nop
	nop
	sw	%v0, 9(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 10(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -12
	add	%v1, %zero, %hp

	nop
	lw	%ra, 11(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	nop
	lw	%v0, 10(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	add	%v0, %zero, %v1
	lw	%v1, 6(%sp)
	sw	%ra, 11(%sp)

	nop
	sw	%v0, 116(%v1)
	addi	%v0, %zero, 115
	addi	%sp, %sp, 12

	nop
	nop
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0

	nop
	nop
	nop
	addi	%v0, %k0, 0

	nop
	nop
	nop
	jal	create_dirvec_elements.3090

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55421

	nop
	nop
	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)

	nop
	nop
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0

	nop
	nop
	nop
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -14
	add	%v1, %zero, %hp

	nop
	lw	%ra, 13(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	nop
	lw	%v0, 12(%sp)

	nop
	nop
	sw	%v0, 0(%v1)
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	sw	%ra, 13(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	nop
	addi	%sp, %sp, -14

	nop
	nop
	lw	%ra, 13(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	sw	%v0, 179(%v1)
	flw	%f0, 0(%sp)

	nop
	nop
	lw	%v0, 179(%v1)
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v0, 13(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 14(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -15
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 14(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 14(%sp)

	nop
	nop
	nop
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -16
	add	%v1, %zero, %hp

	nop
	lw	%ra, 15(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	lw	%v0, 14(%sp)
	flw	%f0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v0, 118(%v1)
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 15(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -16
	addi	%v1, %v0, 0

	nop
	nop
	lw	%ra, 15(%sp)
	lw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%v1, 15(%sp)

	nop
	nop
	nop
	sw	%ra, 16(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -17
	add	%v1, %zero, %hp

	nop
	lw	%ra, 16(%sp)
	addi	%hp, %hp, 2
	sw	%v0, 1(%v1)

	nop
	nop
	nop
	lw	%v0, 15(%sp)

	nop
	nop
	nop
	sw	%v0, 0(%v1)

	nop
	nop
	add	%v0, %zero, %v1
	lw	%v1, 13(%sp)

	nop
	nop
	sw	%v0, 117(%v1)
	lw	%v0, 9(%sp)

	nop
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	sw	%ra, 16(%sp)

	nop
	nop
	addi	%v0, %k0, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	create_dirvec_elements.3090

	nop
	nop
	nop
	addi	%sp, %sp, -17

	nop
	nop
	lw	%ra, 16(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	j	create_dirvecs.3093

bgti_else.55421:
	nop
	nop
	nop
	jr	%ra

bgti_else.55420:
	nop
	nop
	nop
	jr	%ra

init_dirvec_constants.3095:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.55558

	nop
	nop
	add	%at, %v0, %v1
	lw	%a1, 0(%zero)

	nop
	nop
	lw	%a0, 0(%at)
	addi	%a1, %a1, -1

	nop
	nop
	nop
	sw	%a1, 0(%sp)

	nop
	nop
	sw	%v0, 1(%sp)
	addi	%v0, %a0, 0

	nop
	nop
	sw	%v1, 2(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	nop
	sw	%ra, 3(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	addi	%sp, %sp, -4

	nop
	nop
	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55559

	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a1, 0(%sp)

	nop
	nop
	add	%at, %v1, %v0
	sw	%v0, 3(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.55560

	nop
	nop
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)

	nop
	nop
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)

	nop
	nop
	nop
	sw	%a0, 4(%sp)

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.55562

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.55564

	nop
	addi	%t1, %zero, 5
	flw	%f0, 493(%zero)
	sw	%a3, 5(%sp)

	nop
	nop
	fsw	%f0, 6(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%a2, 7(%sp)

	nop
	nop
	nop
	sw	%t0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)

	nop
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 7(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55566

	nop
	nop
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	j	bnei_cont.55567

bnei_else.55566:
bnei_cont.55567:
	nop
	nop
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f0, %f4
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	fneg	%f4, %f4
	fmul	%f5, %f1, %f5
	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	nop
	fneg	%f6, %f6

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55568

	nop
	nop
	nop
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f7, %f2, %f7
	flw	%f8, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	nop
	fmul	%f8, %f1, %f8

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fsub	%f4, %f4, %f7

	nop
	nop
	fsw	%f4, 1(%v0)
	flw	%f4, 0(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f4, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fmul	%f4, %f0, %f4
	lw	%v1, 9(%v1)

	nop
	nop
	nop
	fadd	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f8

	nop
	nop
	nop
	fsub	%f2, %f5, %f2

	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 0(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%v1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f8

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55569

bnei_else.55568:
	nop
	nop
	nop
	fsw	%f4, 1(%v0)

	nop
	nop
	nop
	fsw	%f5, 2(%v0)

	nop
	nop
	nop
	fsw	%f6, 3(%v0)

bnei_cont.55569:
	nop
	nop
	nop
	flw	%f0, 6(%sp)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.55570

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55571

fbeq_else.55570:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.55571:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55572

	nop
	nop
	nop
	j	bnei_cont.55573

bnei_else.55572:
	nop
	nop
	nop
	flw	%f0, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 4(%v0)

bnei_cont.55573:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.55563

bnei_else.55564:
	nop
	addi	%t1, %zero, 4
	flw	%f0, 493(%zero)
	sw	%a3, 5(%sp)

	nop
	nop
	fsw	%f0, 9(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%a2, 7(%sp)

	nop
	nop
	nop
	sw	%t0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 9(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55574

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55575

fbgt_else.55574:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.55575:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55576

	nop
	nop
	flw	%f1, 490(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55577

bnei_else.55576:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.55577:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.55565:
	nop
	nop
	nop
	j	bnei_cont.55563

bnei_else.55562:
	nop
	addi	%t1, %zero, 6
	flw	%f0, 493(%zero)
	sw	%a3, 5(%sp)

	nop
	nop
	sw	%a2, 7(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	fsw	%f0, 10(%sp)

	nop
	nop
	nop
	sw	%t0, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 10(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55578

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55579

fbeq_else.55578:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.55579:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55580

	nop
	nop
	nop
	fsw	%f1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.55581

bnei_else.55580:
	nop
	nop
	nop
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55582

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55583

fbgt_else.55582:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.55583:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55584

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.55586

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55585

bnei_else.55586:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.55587:
	nop
	nop
	nop
	j	bnei_cont.55585

bnei_else.55584:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.55585:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 0(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55588

	nop
	nop
	nop
	j	bnei_cont.55589

bnei_else.55588:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.55589:
	nop
	nop
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

bnei_cont.55581:
	nop
	nop
	nop
	flw	%f0, 1(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55590

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55591

fbeq_else.55590:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.55591:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55592

	nop
	nop
	nop
	fsw	%f1, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55593

bnei_else.55592:
	nop
	nop
	nop
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55594

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55595

fbgt_else.55594:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.55595:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55596

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.55598

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55597

bnei_else.55598:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.55599:
	nop
	nop
	nop
	j	bnei_cont.55597

bnei_else.55596:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.55597:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 1(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55600

	nop
	nop
	nop
	j	bnei_cont.55601

bnei_else.55600:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.55601:
	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

bnei_cont.55593:
	nop
	nop
	nop
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55602

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55603

fbeq_else.55602:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.55603:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55604

	nop
	nop
	nop
	fsw	%f1, 5(%v0)

	nop
	nop
	nop
	j	bnei_cont.55605

bnei_else.55604:
	nop
	nop
	nop
	lw	%v1, 7(%sp)

	nop
	nop
	nop
	lw	%a0, 6(%v1)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55606

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55607

fbgt_else.55606:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.55607:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55608

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55610

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55609

bnei_else.55610:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.55611:
	nop
	nop
	nop
	j	bnei_cont.55609

bnei_else.55608:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.55609:
	nop
	nop
	nop
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55612

	nop
	nop
	nop
	j	bnei_cont.55613

bnei_else.55612:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.55613:
	nop
	nop
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 5(%v0)

bnei_cont.55605:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.55563:
	nop
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	sw	%ra, 11(%sp)

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	bgti_cont.55561

bgti_else.55560:
bgti_cont.55561:
	nop
	nop
	nop
	lw	%v0, 3(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55614

	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a1, 0(%sp)

	nop
	add	%at, %v1, %v0
	sw	%v0, 11(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	lw	%a0, 0(%at)
	sw	%ra, 12(%sp)

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	addi	%sp, %sp, -13

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55615

	nop
	nop
	lw	%v1, 1(%sp)
	lw	%a1, 0(%sp)

	nop
	nop
	add	%at, %v1, %v0
	sw	%v0, 12(%sp)

	nop
	nop
	nop
	lw	%a0, 0(%at)

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.55616

	nop
	nop
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)

	nop
	nop
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)

	nop
	nop
	nop
	sw	%a0, 13(%sp)

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.55618

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.55620

	nop
	addi	%t1, %zero, 5
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)

	nop
	nop
	fsw	%f0, 15(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%a2, 16(%sp)

	nop
	nop
	nop
	sw	%t0, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)

	nop
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 16(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55622

	nop
	nop
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	j	bnei_cont.55623

bnei_else.55622:
bnei_cont.55623:
	nop
	nop
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f0, %f4
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	fneg	%f4, %f4
	fmul	%f5, %f1, %f5
	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	nop
	fneg	%f6, %f6

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55624

	nop
	nop
	nop
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f7, %f2, %f7
	flw	%f8, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	nop
	fmul	%f8, %f1, %f8

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fsub	%f4, %f4, %f7

	nop
	nop
	fsw	%f4, 1(%v0)
	flw	%f4, 0(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f4, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fmul	%f4, %f0, %f4
	lw	%v1, 9(%v1)

	nop
	nop
	nop
	fadd	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f8

	nop
	nop
	nop
	fsub	%f2, %f5, %f2

	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 0(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%v1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f8

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55625

bnei_else.55624:
	nop
	nop
	nop
	fsw	%f4, 1(%v0)

	nop
	nop
	nop
	fsw	%f5, 2(%v0)

	nop
	nop
	nop
	fsw	%f6, 3(%v0)

bnei_cont.55625:
	nop
	nop
	nop
	flw	%f0, 15(%sp)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.55626

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55627

fbeq_else.55626:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.55627:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55628

	nop
	nop
	nop
	j	bnei_cont.55629

bnei_else.55628:
	nop
	nop
	nop
	flw	%f0, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 4(%v0)

bnei_cont.55629:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 14(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.55619

bnei_else.55620:
	nop
	addi	%t1, %zero, 4
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)

	nop
	nop
	fsw	%f0, 18(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%a2, 16(%sp)

	nop
	nop
	nop
	sw	%t0, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 16(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 18(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55630

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55631

fbgt_else.55630:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.55631:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55632

	nop
	nop
	flw	%f1, 490(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55633

bnei_else.55632:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.55633:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 14(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.55621:
	nop
	nop
	nop
	j	bnei_cont.55619

bnei_else.55618:
	nop
	addi	%t1, %zero, 6
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)

	nop
	nop
	sw	%a2, 16(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	fsw	%f0, 19(%sp)

	nop
	nop
	nop
	sw	%t0, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	lw	%ra, 20(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 19(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55634

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55635

fbeq_else.55634:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.55635:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55636

	nop
	nop
	nop
	fsw	%f1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.55637

bnei_else.55636:
	nop
	nop
	nop
	lw	%a0, 16(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55638

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55639

fbgt_else.55638:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.55639:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55640

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.55642

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55641

bnei_else.55642:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.55643:
	nop
	nop
	nop
	j	bnei_cont.55641

bnei_else.55640:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.55641:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 0(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55644

	nop
	nop
	nop
	j	bnei_cont.55645

bnei_else.55644:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.55645:
	nop
	nop
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

bnei_cont.55637:
	nop
	nop
	nop
	flw	%f0, 1(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55646

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55647

fbeq_else.55646:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.55647:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55648

	nop
	nop
	nop
	fsw	%f1, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55649

bnei_else.55648:
	nop
	nop
	nop
	lw	%a0, 16(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55650

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55651

fbgt_else.55650:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.55651:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55652

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.55654

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55653

bnei_else.55654:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.55655:
	nop
	nop
	nop
	j	bnei_cont.55653

bnei_else.55652:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.55653:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 1(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55656

	nop
	nop
	nop
	j	bnei_cont.55657

bnei_else.55656:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.55657:
	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

bnei_cont.55649:
	nop
	nop
	nop
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55658

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55659

fbeq_else.55658:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.55659:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55660

	nop
	nop
	nop
	fsw	%f1, 5(%v0)

	nop
	nop
	nop
	j	bnei_cont.55661

bnei_else.55660:
	nop
	nop
	nop
	lw	%v1, 16(%sp)

	nop
	nop
	nop
	lw	%a0, 6(%v1)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55662

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55663

fbgt_else.55662:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.55663:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55664

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55666

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55665

bnei_else.55666:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.55667:
	nop
	nop
	nop
	j	bnei_cont.55665

bnei_else.55664:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.55665:
	nop
	nop
	nop
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55668

	nop
	nop
	nop
	j	bnei_cont.55669

bnei_else.55668:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.55669:
	nop
	nop
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 5(%v0)

bnei_cont.55661:
	nop
	nop
	lw	%v1, 0(%sp)
	lw	%a0, 14(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.55619:
	nop
	addi	%v1, %v1, -1
	lw	%v0, 13(%sp)
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	bgti_cont.55617

bgti_else.55616:
bgti_cont.55617:
	nop
	nop
	nop
	lw	%v0, 12(%sp)

	nop
	nop
	addi	%v1, %v0, -1
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	j	init_dirvec_constants.3095

bgti_else.55615:
	nop
	nop
	nop
	jr	%ra

bgti_else.55614:
	nop
	nop
	nop
	jr	%ra

bgti_else.55559:
	nop
	nop
	nop
	jr	%ra

bgti_else.55558:
	nop
	nop
	nop
	jr	%ra

init_vecset_constants.3098:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.55903

	nop
	lw	%v1, 179(%v0)
	addi	%a0, %zero, 119
	lw	%a2, 0(%zero)

	nop
	lw	%a1, 119(%v1)
	addi	%a2, %a2, -1
	sw	%a0, 0(%sp)

	nop
	nop
	nop
	sw	%v0, 1(%sp)

	nop
	nop
	nop
	sw	%a2, 2(%sp)

	nop
	nop
	nop
	sw	%v1, 3(%sp)

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.55904

	nop
	nop
	lw	%a3, 12(%a2)
	lw	%t0, 1(%a1)

	nop
	nop
	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)

	nop
	nop
	nop
	sw	%a1, 4(%sp)

	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.55906

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.55908

	nop
	addi	%t2, %zero, 5
	flw	%f0, 493(%zero)
	sw	%t0, 5(%sp)

	nop
	nop
	fsw	%f0, 6(%sp)
	addi	%v0, %t2, 0

	nop
	nop
	nop
	sw	%a3, 7(%sp)

	nop
	nop
	nop
	sw	%t1, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 9(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -10

	nop
	nop
	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)

	nop
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 7(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55910

	nop
	nop
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	j	bnei_cont.55911

bnei_else.55910:
bnei_cont.55911:
	nop
	nop
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f0, %f4
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	fneg	%f4, %f4
	fmul	%f5, %f1, %f5
	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	nop
	fneg	%f6, %f6

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55912

	nop
	nop
	nop
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f7, %f2, %f7
	flw	%f8, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	nop
	fmul	%f8, %f1, %f8

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fsub	%f4, %f4, %f7

	nop
	nop
	fsw	%f4, 1(%v0)
	flw	%f4, 0(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f4, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fmul	%f4, %f0, %f4
	lw	%v1, 9(%v1)

	nop
	nop
	nop
	fadd	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f8

	nop
	nop
	nop
	fsub	%f2, %f5, %f2

	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 0(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%v1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f8

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55913

bnei_else.55912:
	nop
	nop
	nop
	fsw	%f4, 1(%v0)

	nop
	nop
	nop
	fsw	%f5, 2(%v0)

	nop
	nop
	nop
	fsw	%f6, 3(%v0)

bnei_cont.55913:
	nop
	nop
	nop
	flw	%f0, 6(%sp)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.55914

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55915

fbeq_else.55914:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.55915:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55916

	nop
	nop
	nop
	j	bnei_cont.55917

bnei_else.55916:
	nop
	nop
	nop
	flw	%f0, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 4(%v0)

bnei_cont.55917:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.55907

bnei_else.55908:
	nop
	addi	%t2, %zero, 4
	flw	%f0, 493(%zero)
	sw	%t0, 5(%sp)

	nop
	nop
	fsw	%f0, 9(%sp)
	addi	%v0, %t2, 0

	nop
	nop
	nop
	sw	%a3, 7(%sp)

	nop
	nop
	nop
	sw	%t1, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 10(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -11

	nop
	nop
	lw	%ra, 10(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 9(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55918

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55919

fbgt_else.55918:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.55919:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55920

	nop
	nop
	flw	%f1, 490(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55921

bnei_else.55920:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.55921:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.55909:
	nop
	nop
	nop
	j	bnei_cont.55907

bnei_else.55906:
	nop
	addi	%t2, %zero, 6
	flw	%f0, 493(%zero)
	sw	%t0, 5(%sp)

	nop
	nop
	sw	%a3, 7(%sp)
	addi	%v0, %t2, 0

	nop
	nop
	nop
	fsw	%f0, 10(%sp)

	nop
	nop
	nop
	sw	%t1, 8(%sp)

	nop
	nop
	nop
	sw	%ra, 11(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	lw	%ra, 11(%sp)
	lw	%v1, 8(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 10(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55922

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55923

fbeq_else.55922:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.55923:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55924

	nop
	nop
	nop
	fsw	%f1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.55925

bnei_else.55924:
	nop
	nop
	nop
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55926

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55927

fbgt_else.55926:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.55927:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55928

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.55930

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55929

bnei_else.55930:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.55931:
	nop
	nop
	nop
	j	bnei_cont.55929

bnei_else.55928:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.55929:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 0(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55932

	nop
	nop
	nop
	j	bnei_cont.55933

bnei_else.55932:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.55933:
	nop
	nop
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

bnei_cont.55925:
	nop
	nop
	nop
	flw	%f0, 1(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55934

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55935

fbeq_else.55934:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.55935:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55936

	nop
	nop
	nop
	fsw	%f1, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55937

bnei_else.55936:
	nop
	nop
	nop
	lw	%a0, 7(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55938

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55939

fbgt_else.55938:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.55939:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55940

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.55942

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55941

bnei_else.55942:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.55943:
	nop
	nop
	nop
	j	bnei_cont.55941

bnei_else.55940:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.55941:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 1(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55944

	nop
	nop
	nop
	j	bnei_cont.55945

bnei_else.55944:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.55945:
	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

bnei_cont.55937:
	nop
	nop
	nop
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55946

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55947

fbeq_else.55946:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.55947:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55948

	nop
	nop
	nop
	fsw	%f1, 5(%v0)

	nop
	nop
	nop
	j	bnei_cont.55949

bnei_else.55948:
	nop
	nop
	nop
	lw	%v1, 7(%sp)

	nop
	nop
	nop
	lw	%a0, 6(%v1)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55950

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55951

fbgt_else.55950:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.55951:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55952

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55954

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55953

bnei_else.55954:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.55955:
	nop
	nop
	nop
	j	bnei_cont.55953

bnei_else.55952:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.55953:
	nop
	nop
	nop
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55956

	nop
	nop
	nop
	j	bnei_cont.55957

bnei_else.55956:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.55957:
	nop
	nop
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 5(%v0)

bnei_cont.55949:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.55907:
	nop
	addi	%v0, %v1, -1
	lw	%a0, 4(%sp)
	sw	%ra, 11(%sp)

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	addi	%sp, %sp, -12

	nop
	nop
	nop
	lw	%ra, 11(%sp)

	nop
	nop
	nop
	j	bgti_cont.55905

bgti_else.55904:
bgti_cont.55905:
	nop
	addi	%v0, %zero, 118
	lw	%v1, 3(%sp)
	lw	%a1, 2(%sp)

	nop
	lw	%a0, 118(%v1)
	sw	%v0, 11(%sp)
	addi	%v1, %a1, 0

	nop
	nop
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v0, %zero, 117

	nop
	nop
	lw	%ra, 12(%sp)
	lw	%v1, 3(%sp)

	nop
	nop
	lw	%a0, 117(%v1)
	lw	%a1, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 12(%sp)

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.55958

	nop
	nop
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)

	nop
	nop
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)

	nop
	nop
	nop
	sw	%a0, 13(%sp)

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.55960

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.55962

	nop
	addi	%t1, %zero, 5
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)

	nop
	nop
	fsw	%f0, 15(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%a2, 16(%sp)

	nop
	nop
	nop
	sw	%t0, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 18(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 19

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -19

	nop
	nop
	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)

	nop
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 16(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55964

	nop
	nop
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	j	bnei_cont.55965

bnei_else.55964:
bnei_cont.55965:
	nop
	nop
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f0, %f4
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	fneg	%f4, %f4
	fmul	%f5, %f1, %f5
	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	nop
	fneg	%f6, %f6

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55966

	nop
	nop
	nop
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f7, %f2, %f7
	flw	%f8, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	nop
	fmul	%f8, %f1, %f8

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fsub	%f4, %f4, %f7

	nop
	nop
	fsw	%f4, 1(%v0)
	flw	%f4, 0(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f4, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fmul	%f4, %f0, %f4
	lw	%v1, 9(%v1)

	nop
	nop
	nop
	fadd	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f8

	nop
	nop
	nop
	fsub	%f2, %f5, %f2

	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 0(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%v1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f8

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55967

bnei_else.55966:
	nop
	nop
	nop
	fsw	%f4, 1(%v0)

	nop
	nop
	nop
	fsw	%f5, 2(%v0)

	nop
	nop
	nop
	fsw	%f6, 3(%v0)

bnei_cont.55967:
	nop
	nop
	nop
	flw	%f0, 15(%sp)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.55968

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55969

fbeq_else.55968:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.55969:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55970

	nop
	nop
	nop
	j	bnei_cont.55971

bnei_else.55970:
	nop
	nop
	nop
	flw	%f0, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 4(%v0)

bnei_cont.55971:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 14(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.55961

bnei_else.55962:
	nop
	addi	%t1, %zero, 4
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)

	nop
	nop
	fsw	%f0, 18(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%a2, 16(%sp)

	nop
	nop
	nop
	sw	%t0, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 19(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -20

	nop
	nop
	lw	%ra, 19(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 16(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 18(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.55972

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55973

fbgt_else.55972:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.55973:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.55974

	nop
	nop
	flw	%f1, 490(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55975

bnei_else.55974:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.55975:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 14(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.55963:
	nop
	nop
	nop
	j	bnei_cont.55961

bnei_else.55960:
	nop
	addi	%t1, %zero, 6
	flw	%f0, 493(%zero)
	sw	%a3, 14(%sp)

	nop
	nop
	sw	%a2, 16(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	fsw	%f0, 19(%sp)

	nop
	nop
	nop
	sw	%t0, 17(%sp)

	nop
	nop
	nop
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	lw	%ra, 20(%sp)
	lw	%v1, 17(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 19(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55976

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55977

fbeq_else.55976:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.55977:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55978

	nop
	nop
	nop
	fsw	%f1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.55979

bnei_else.55978:
	nop
	nop
	nop
	lw	%a0, 16(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55980

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55981

fbgt_else.55980:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.55981:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55982

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.55984

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55983

bnei_else.55984:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.55985:
	nop
	nop
	nop
	j	bnei_cont.55983

bnei_else.55982:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.55983:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 0(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55986

	nop
	nop
	nop
	j	bnei_cont.55987

bnei_else.55986:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.55987:
	nop
	nop
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

bnei_cont.55979:
	nop
	nop
	nop
	flw	%f0, 1(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.55988

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.55989

fbeq_else.55988:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.55989:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.55990

	nop
	nop
	nop
	fsw	%f1, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.55991

bnei_else.55990:
	nop
	nop
	nop
	lw	%a0, 16(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.55992

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.55993

fbgt_else.55992:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.55993:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55994

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.55996

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.55995

bnei_else.55996:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.55997:
	nop
	nop
	nop
	j	bnei_cont.55995

bnei_else.55994:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.55995:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 1(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.55998

	nop
	nop
	nop
	j	bnei_cont.55999

bnei_else.55998:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.55999:
	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

bnei_cont.55991:
	nop
	nop
	nop
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.56000

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.56001

fbeq_else.56000:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.56001:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.56002

	nop
	nop
	nop
	fsw	%f1, 5(%v0)

	nop
	nop
	nop
	j	bnei_cont.56003

bnei_else.56002:
	nop
	nop
	nop
	lw	%v1, 16(%sp)

	nop
	nop
	nop
	lw	%a0, 6(%v1)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.56004

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.56005

fbgt_else.56004:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.56005:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56006

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56008

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.56007

bnei_else.56008:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.56009:
	nop
	nop
	nop
	j	bnei_cont.56007

bnei_else.56006:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.56007:
	nop
	nop
	nop
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56010

	nop
	nop
	nop
	j	bnei_cont.56011

bnei_else.56010:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.56011:
	nop
	nop
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 5(%v0)

bnei_cont.56003:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 14(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.55961:
	nop
	addi	%v0, %v1, -1
	lw	%a0, 13(%sp)
	sw	%ra, 20(%sp)

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	nop
	lw	%ra, 20(%sp)

	nop
	nop
	nop
	j	bgti_cont.55959

bgti_else.55958:
bgti_cont.55959:
	nop
	addi	%v1, %zero, 116
	lw	%v0, 3(%sp)
	sw	%ra, 20(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 21

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	nop
	addi	%sp, %sp, -21

	nop
	nop
	lw	%ra, 20(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.56012

	nop
	nop
	lw	%v1, 179(%v0)
	lw	%a1, 2(%sp)

	nop
	nop
	lw	%a0, 119(%v1)
	sw	%v0, 20(%sp)

	nop
	sw	%v1, 21(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	sw	%ra, 22(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	addi	%sp, %sp, -23

	nop
	nop
	lw	%ra, 22(%sp)
	lw	%v0, 21(%sp)

	nop
	nop
	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.56013

	nop
	nop
	lw	%a1, 12(%a0)
	lw	%a2, 1(%v1)

	nop
	nop
	lw	%a3, 0(%v1)
	lw	%t0, 1(%a1)

	nop
	nop
	nop
	sw	%v1, 22(%sp)

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.56015

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.56017

	nop
	addi	%t0, %zero, 5
	flw	%f0, 493(%zero)
	sw	%a2, 23(%sp)

	nop
	nop
	fsw	%f0, 24(%sp)
	addi	%v0, %t0, 0

	nop
	nop
	nop
	sw	%a1, 25(%sp)

	nop
	nop
	nop
	sw	%a3, 26(%sp)

	nop
	nop
	nop
	sw	%ra, 27(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -28

	nop
	nop
	lw	%ra, 27(%sp)
	lw	%v1, 26(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)

	nop
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 25(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56019

	nop
	nop
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	j	bnei_cont.56020

bnei_else.56019:
bnei_cont.56020:
	nop
	nop
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f0, %f4
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	fneg	%f4, %f4
	fmul	%f5, %f1, %f5
	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	nop
	fneg	%f6, %f6

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56021

	nop
	nop
	nop
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f7, %f2, %f7
	flw	%f8, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	nop
	fmul	%f8, %f1, %f8

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fsub	%f4, %f4, %f7

	nop
	nop
	fsw	%f4, 1(%v0)
	flw	%f4, 0(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f4, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fmul	%f4, %f0, %f4
	lw	%v1, 9(%v1)

	nop
	nop
	nop
	fadd	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f8

	nop
	nop
	nop
	fsub	%f2, %f5, %f2

	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 0(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%v1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f8

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.56022

bnei_else.56021:
	nop
	nop
	nop
	fsw	%f4, 1(%v0)

	nop
	nop
	nop
	fsw	%f5, 2(%v0)

	nop
	nop
	nop
	fsw	%f6, 3(%v0)

bnei_cont.56022:
	nop
	nop
	nop
	flw	%f0, 24(%sp)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.56023

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.56024

fbeq_else.56023:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.56024:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.56025

	nop
	nop
	nop
	j	bnei_cont.56026

bnei_else.56025:
	nop
	nop
	nop
	flw	%f0, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 4(%v0)

bnei_cont.56026:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 23(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.56016

bnei_else.56017:
	nop
	addi	%t0, %zero, 4
	flw	%f0, 493(%zero)
	sw	%a2, 23(%sp)

	nop
	nop
	fsw	%f0, 27(%sp)
	addi	%v0, %t0, 0

	nop
	nop
	nop
	sw	%a1, 25(%sp)

	nop
	nop
	nop
	sw	%a3, 26(%sp)

	nop
	nop
	nop
	sw	%ra, 28(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 29

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -29

	nop
	nop
	lw	%ra, 28(%sp)
	lw	%v1, 26(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 25(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 27(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.56027

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.56028

fbgt_else.56027:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.56028:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.56029

	nop
	nop
	flw	%f1, 490(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.56030

bnei_else.56029:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.56030:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 23(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.56018:
	nop
	nop
	nop
	j	bnei_cont.56016

bnei_else.56015:
	nop
	addi	%t0, %zero, 6
	flw	%f0, 493(%zero)
	sw	%a2, 23(%sp)

	nop
	nop
	sw	%a1, 25(%sp)
	addi	%v0, %t0, 0

	nop
	nop
	nop
	fsw	%f0, 28(%sp)

	nop
	nop
	nop
	sw	%a3, 26(%sp)

	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v1, 26(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 28(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.56031

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.56032

fbeq_else.56031:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.56032:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56033

	nop
	nop
	nop
	fsw	%f1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.56034

bnei_else.56033:
	nop
	nop
	nop
	lw	%a0, 25(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.56035

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.56036

fbgt_else.56035:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.56036:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56037

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.56039

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.56038

bnei_else.56039:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.56040:
	nop
	nop
	nop
	j	bnei_cont.56038

bnei_else.56037:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.56038:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 0(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56041

	nop
	nop
	nop
	j	bnei_cont.56042

bnei_else.56041:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.56042:
	nop
	nop
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

bnei_cont.56034:
	nop
	nop
	nop
	flw	%f0, 1(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.56043

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.56044

fbeq_else.56043:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.56044:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56045

	nop
	nop
	nop
	fsw	%f1, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.56046

bnei_else.56045:
	nop
	nop
	nop
	lw	%a0, 25(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.56047

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.56048

fbgt_else.56047:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.56048:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56049

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.56051

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.56050

bnei_else.56051:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.56052:
	nop
	nop
	nop
	j	bnei_cont.56050

bnei_else.56049:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.56050:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 1(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56053

	nop
	nop
	nop
	j	bnei_cont.56054

bnei_else.56053:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.56054:
	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

bnei_cont.56046:
	nop
	nop
	nop
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.56055

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.56056

fbeq_else.56055:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.56056:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.56057

	nop
	nop
	nop
	fsw	%f1, 5(%v0)

	nop
	nop
	nop
	j	bnei_cont.56058

bnei_else.56057:
	nop
	nop
	nop
	lw	%v1, 25(%sp)

	nop
	nop
	nop
	lw	%a0, 6(%v1)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.56059

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.56060

fbgt_else.56059:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.56060:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56061

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56063

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.56062

bnei_else.56063:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.56064:
	nop
	nop
	nop
	j	bnei_cont.56062

bnei_else.56061:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.56062:
	nop
	nop
	nop
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56065

	nop
	nop
	nop
	j	bnei_cont.56066

bnei_else.56065:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.56066:
	nop
	nop
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 5(%v0)

bnei_cont.56058:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 23(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.56016:
	nop
	addi	%v0, %v1, -1
	lw	%a0, 22(%sp)
	sw	%ra, 29(%sp)

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	nop
	lw	%ra, 29(%sp)

	nop
	nop
	nop
	j	bgti_cont.56014

bgti_else.56013:
bgti_cont.56014:
	nop
	nop
	lw	%v0, 21(%sp)
	lw	%v1, 12(%sp)

	nop
	nop
	nop
	sw	%ra, 29(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	nop
	addi	%sp, %sp, -30

	nop
	nop
	lw	%ra, 29(%sp)
	lw	%v0, 20(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.56067

	nop
	nop
	lw	%v1, 179(%v0)
	lw	%a1, 2(%sp)

	nop
	nop
	lw	%a0, 119(%v1)
	sw	%v0, 29(%sp)

	nop
	nop
	nop
	sw	%v1, 30(%sp)

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.56068

	nop
	nop
	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)

	nop
	nop
	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)

	nop
	nop
	nop
	sw	%a0, 31(%sp)

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.56070

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.56072

	nop
	addi	%t1, %zero, 5
	flw	%f0, 493(%zero)
	sw	%a3, 32(%sp)

	nop
	nop
	fsw	%f0, 33(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%a2, 34(%sp)

	nop
	nop
	nop
	sw	%t0, 35(%sp)

	nop
	nop
	nop
	sw	%ra, 36(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 37

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -37

	nop
	nop
	lw	%ra, 36(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)

	nop
	flw	%f2, 2(%v1)
	fmul	%f3, %f0, %f0
	lw	%v1, 34(%sp)

	nop
	nop
	nop
	lw	%a0, 4(%v1)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56074

	nop
	nop
	fmul	%f4, %f1, %f2
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	nop
	nop
	fmul	%f4, %f4, %f5
	flw	%f5, 2(%a0)

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

	nop
	nop
	nop
	fmul	%f4, %f4, %f5

	nop
	nop
	nop
	fadd	%f3, %f3, %f4

	nop
	nop
	nop
	j	bnei_cont.56075

bnei_else.56074:
bnei_cont.56075:
	nop
	nop
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)

	nop
	nop
	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)

	nop
	fmul	%f4, %f0, %f4
	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)

	fneg	%f4, %f4
	fmul	%f5, %f1, %f5
	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	nop
	fneg	%f6, %f6

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56076

	nop
	nop
	nop
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)

	nop
	fmul	%f7, %f2, %f7
	flw	%f8, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	nop
	fmul	%f8, %f1, %f8

	nop
	nop
	fadd	%f7, %f7, %f8
	flw	%f8, 471(%zero)

	nop
	nop
	nop
	fmul	%f7, %f7, %f8

	nop
	nop
	nop
	fsub	%f4, %f4, %f7

	nop
	nop
	fsw	%f4, 1(%v0)
	flw	%f4, 0(%a0)

	nop
	nop
	fmul	%f2, %f2, %f4
	lw	%a0, 9(%v1)

	nop
	nop
	flw	%f4, 2(%a0)
	lw	%a0, 9(%v1)

	nop
	nop
	fmul	%f4, %f0, %f4
	lw	%v1, 9(%v1)

	nop
	nop
	nop
	fadd	%f2, %f2, %f4

	nop
	nop
	nop
	fmul	%f2, %f2, %f8

	nop
	nop
	nop
	fsub	%f2, %f5, %f2

	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 0(%a0)

	nop
	nop
	fmul	%f1, %f1, %f2
	flw	%f2, 1(%v1)

	nop
	nop
	nop
	fmul	%f0, %f0, %f2

	nop
	nop
	nop
	fadd	%f0, %f1, %f0

	nop
	nop
	nop
	fmul	%f0, %f0, %f8

	nop
	nop
	nop
	fsub	%f0, %f6, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.56077

bnei_else.56076:
	nop
	nop
	nop
	fsw	%f4, 1(%v0)

	nop
	nop
	nop
	fsw	%f5, 2(%v0)

	nop
	nop
	nop
	fsw	%f6, 3(%v0)

bnei_cont.56077:
	nop
	nop
	nop
	flw	%f0, 33(%sp)

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.56078

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.56079

fbeq_else.56078:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.56079:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.56080

	nop
	nop
	nop
	j	bnei_cont.56081

bnei_else.56080:
	nop
	nop
	nop
	flw	%f0, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fsw	%f0, 4(%v0)

bnei_cont.56081:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 32(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

	nop
	nop
	nop
	j	bnei_cont.56071

bnei_else.56072:
	nop
	addi	%t1, %zero, 4
	flw	%f0, 493(%zero)
	sw	%a3, 32(%sp)

	nop
	nop
	fsw	%f0, 36(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	sw	%a2, 34(%sp)

	nop
	nop
	nop
	sw	%t0, 35(%sp)

	nop
	nop
	nop
	sw	%ra, 37(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -38

	nop
	nop
	lw	%ra, 37(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	lw	%a0, 34(%sp)

	nop
	nop
	nop
	lw	%a1, 4(%a0)

	nop
	nop
	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)

	nop
	fmul	%f0, %f0, %f1
	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 2(%v1)

	nop
	nop
	nop
	fmul	%f1, %f1, %f2

	nop
	nop
	fadd	%f0, %f0, %f1
	flw	%f1, 36(%sp)

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.56082

	nop
	nop
	nop
	addi	%v1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.56083

fbgt_else.56082:
	nop
	nop
	nop
	addi	%v1, %zero, 1

fbgt_cont.56083:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.56084

	nop
	nop
	flw	%f1, 490(%zero)
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fdiv	%f1, %f1, %f0

	nop
	nop
	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 1(%v0)
	flw	%f1, 1(%v1)

	nop
	nop
	fdiv	%f1, %f1, %f0
	lw	%v1, 4(%a0)

	nop
	nop
	nop
	fneg	%f1, %f1

	nop
	nop
	fsw	%f1, 2(%v0)
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fneg	%f0, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.56085

bnei_else.56084:
	nop
	nop
	nop
	fsw	%f1, 0(%v0)

bnei_cont.56085:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 32(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.56073:
	nop
	nop
	nop
	j	bnei_cont.56071

bnei_else.56070:
	nop
	addi	%t1, %zero, 6
	flw	%f0, 493(%zero)
	sw	%a3, 32(%sp)

	nop
	nop
	sw	%a2, 34(%sp)
	addi	%v0, %t1, 0

	nop
	nop
	nop
	fsw	%f0, 37(%sp)

	nop
	nop
	nop
	sw	%t0, 35(%sp)

	nop
	nop
	nop
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	lw	%ra, 38(%sp)
	lw	%v1, 35(%sp)

	nop
	nop
	flw	%f0, 0(%v1)
	flw	%f1, 37(%sp)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.56086

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.56087

fbeq_else.56086:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.56087:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56088

	nop
	nop
	nop
	fsw	%f1, 1(%v0)

	nop
	nop
	nop
	j	bnei_cont.56089

bnei_else.56088:
	nop
	nop
	nop
	lw	%a0, 34(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.56090

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.56091

fbgt_else.56090:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.56091:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56092

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.56094

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.56093

bnei_else.56094:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.56095:
	nop
	nop
	nop
	j	bnei_cont.56093

bnei_else.56092:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.56093:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 0(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56096

	nop
	nop
	nop
	j	bnei_cont.56097

bnei_else.56096:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.56097:
	nop
	nop
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 1(%v0)

bnei_cont.56089:
	nop
	nop
	nop
	flw	%f0, 1(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.56098

	nop
	nop
	nop
	addi	%a0, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.56099

fbeq_else.56098:
	nop
	nop
	nop
	addi	%a0, %zero, 0

fbeq_cont.56099:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56100

	nop
	nop
	nop
	fsw	%f1, 3(%v0)

	nop
	nop
	nop
	j	bnei_cont.56101

bnei_else.56100:
	nop
	nop
	nop
	lw	%a0, 34(%sp)

	nop
	nop
	nop
	lw	%a1, 6(%a0)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.56102

	nop
	nop
	nop
	addi	%a2, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.56103

fbgt_else.56102:
	nop
	nop
	nop
	addi	%a2, %zero, 1

fbgt_cont.56103:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56104

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.56106

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.56105

bnei_else.56106:
	nop
	nop
	nop
	addi	%a1, %zero, 1

bnei_cont.56107:
	nop
	nop
	nop
	j	bnei_cont.56105

bnei_else.56104:
	nop
	nop
	nop
	add	%a1, %zero, %a2

bnei_cont.56105:
	nop
	nop
	nop
	lw	%a2, 4(%a0)

	nop
	nop
	nop
	flw	%f2, 1(%a2)

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56108

	nop
	nop
	nop
	j	bnei_cont.56109

bnei_else.56108:
	nop
	nop
	nop
	fneg	%f2, %f2

bnei_cont.56109:
	nop
	nop
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f2, %f0

	nop
	nop
	nop
	fsw	%f0, 3(%v0)

bnei_cont.56101:
	nop
	nop
	nop
	flw	%f0, 2(%v1)

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.56110

	nop
	nop
	nop
	addi	%v1, %zero, 1

	nop
	nop
	nop
	j	fbeq_cont.56111

fbeq_else.56110:
	nop
	nop
	nop
	addi	%v1, %zero, 0

fbeq_cont.56111:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.56112

	nop
	nop
	nop
	fsw	%f1, 5(%v0)

	nop
	nop
	nop
	j	bnei_cont.56113

bnei_else.56112:
	nop
	nop
	nop
	lw	%v1, 34(%sp)

	nop
	nop
	nop
	lw	%a0, 6(%v1)

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.56114

	nop
	nop
	nop
	addi	%a1, %zero, 0

	nop
	nop
	nop
	j	fbgt_cont.56115

fbgt_else.56114:
	nop
	nop
	nop
	addi	%a1, %zero, 1

fbgt_cont.56115:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56116

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.56118

	nop
	nop
	nop
	addi	%a0, %zero, 0

	nop
	nop
	nop
	j	bnei_cont.56117

bnei_else.56118:
	nop
	nop
	nop
	addi	%a0, %zero, 1

bnei_cont.56119:
	nop
	nop
	nop
	j	bnei_cont.56117

bnei_else.56116:
	nop
	nop
	nop
	add	%a0, %zero, %a1

bnei_cont.56117:
	nop
	nop
	nop
	lw	%v1, 4(%v1)

	nop
	nop
	nop
	flw	%f1, 2(%v1)

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.56120

	nop
	nop
	nop
	j	bnei_cont.56121

bnei_else.56120:
	nop
	nop
	nop
	fneg	%f1, %f1

bnei_cont.56121:
	nop
	nop
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)

	nop
	nop
	nop
	fdiv	%f0, %f1, %f0

	nop
	nop
	nop
	fsw	%f0, 5(%v0)

bnei_cont.56113:
	nop
	nop
	lw	%v1, 2(%sp)
	lw	%a0, 32(%sp)

	nop
	nop
	nop
	add	%at, %a0, %v1

	nop
	nop
	nop
	sw	%v0, 0(%at)

bnei_cont.56071:
	nop
	addi	%v1, %v1, -1
	lw	%v0, 31(%sp)
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	nop
	lw	%ra, 38(%sp)

	nop
	nop
	nop
	j	bgti_cont.56069

bgti_else.56068:
bgti_cont.56069:
	nop
	nop
	lw	%v0, 30(%sp)
	lw	%v1, 11(%sp)

	nop
	nop
	nop
	sw	%ra, 38(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	nop
	addi	%sp, %sp, -39

	nop
	nop
	lw	%ra, 38(%sp)
	lw	%v0, 29(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.56122

	nop
	nop
	lw	%v1, 179(%v0)
	lw	%a0, 0(%sp)

	nop
	sw	%v0, 38(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	nop
	sw	%ra, 39(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 40

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	nop
	addi	%sp, %sp, -40

	nop
	nop
	lw	%ra, 39(%sp)
	lw	%v0, 38(%sp)

	nop
	nop
	nop
	addi	%v0, %v0, -1

	nop
	nop
	nop
	j	init_vecset_constants.3098

bgti_else.56122:
	nop
	nop
	nop
	jr	%ra

bgti_else.56067:
	nop
	nop
	nop
	jr	%ra

bgti_else.56012:
	nop
	nop
	nop
	jr	%ra

bgti_else.55903:
	nop
	nop
	nop
	jr	%ra

min_caml_start:
	nop
	nop
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0

	nop
	nop
	addi	%a0, %zero, 0
	sw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%ra, 2(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	addi	%sp, %sp, -3
	flw	%f0, 493(%zero)
	addi	%v1, %zero, 1

	nop
	nop
	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)

	nop
	nop
	nop
	fsw	%f0, 2(%sp)

	nop
	nop
	nop
	sw	%ra, 3(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 60
	sw	%v0, 11(%zero)

	nop
	nop
	lw	%ra, 3(%sp)
	sw	%v0, 10(%zero)

	nop
	nop
	sw	%v0, 9(%zero)
	lw	%a0, 1(%sp)

	nop
	nop
	sw	%v0, 8(%zero)
	sw	%v1, 3(%sp)

	nop
	nop
	sw	%a0, 7(%zero)
	sw	%ra, 4(%sp)

	nop
	nop
	sw	%v0, 6(%zero)
	addi	%sp, %sp, 5

	nop
	nop
	nop
	sw	%v0, 5(%zero)

	nop
	nop
	nop
	sw	%a0, 4(%zero)

	nop
	nop
	nop
	sw	%a0, 3(%zero)

	nop
	nop
	nop
	sw	%a0, 2(%zero)

	nop
	nop
	nop
	sw	%a0, 1(%zero)

	nop
	nop
	addi	%v0, %zero, 12
	addi	%a1, %zero, 1

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0

	nop
	nop
	nop
	addi	%v1, %a1, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v0, %zero, 3

	nop
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 72
	flw	%f0, 2(%sp)

	nop
	nop
	nop
	sw	%v0, 4(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %zero, 75

	nop
	nop
	lw	%ra, 5(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %zero, 78

	nop
	nop
	lw	%ra, 5(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	addi	%sp, %sp, -6
	flw	%f0, 450(%zero)
	addi	%v1, %zero, 81

	nop
	nop
	lw	%ra, 5(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 5(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 50

	lw	%ra, 5(%sp)
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82
	lw	%a1, 0(%sp)

	nop
	nop
	sw	%v0, 5(%sp)
	addi	%v0, %a1, 0

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 83

	nop
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 82
	lw	%v0, 5(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	addi	%sp, %sp, -7
	lw	%v1, 83(%zero)
	addi	%a0, %zero, 133

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 134

	nop
	lw	%ra, 6(%sp)
	addi	%v1, %zero, 133
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 135

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 0(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 136

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	addi	%sp, %sp, -7
	flw	%f0, 465(%zero)
	addi	%v1, %zero, 137

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	nop
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 138

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 141

	nop
	nop
	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 142

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 145

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 148

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 151

	nop
	nop
	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 6(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 2

	nop
	lw	%ra, 6(%sp)
	addi	%a0, %zero, 154
	lw	%v1, 1(%sp)

	nop
	nop
	nop
	sw	%v0, 6(%sp)

	nop
	nop
	nop
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a0, %zero, 156

	nop
	nop
	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)

	nop
	nop
	lw	%v1, 1(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 158

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 0(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 159

	nop
	nop
	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)

	nop
	nop
	lw	%v0, 4(%sp)
	sw	%ra, 7(%sp)

	nop
	nop
	nop
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop


