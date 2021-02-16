	nop
	nop
	lui	%sp, 1
	lui	%hp, 0

	nop
	nop
	ori	%sp, %sp, 44464
	ori	%hp, %hp, 496

	nop
	nop
	lui	%k1, 0
	lui	%at, 16256

	nop
	nop
	ori	%k1, %k1, 1
	ori	%at, %at, 0

	sw	%at, 0(%hp)
	nop
	nop
	nop

	flw	%f30, 0(%hp)
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
	sll	%v1, %v1, 8
	nop

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
	sll	%v1, %v1, 16
	nop

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
	sll	%v1, %v1, 24
	nop

	nop
	nop
	or	%v0, %v0, %v1
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
	sll	%v1, %v1, 8
	nop

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
	sll	%v1, %v1, 16
	nop

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
	sll	%v1, %v1, 24
	nop

	nop
	nop
	or	%v0, %v0, %v1
	nop

	sw	%v0, 0(%hp)
	nop
	nop
	nop

	flw	%f0, 0(%hp)
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
	sw	%v1, 0(%hp)
	nop
	addi	%a0, %a0, -1
	nop

	nop
	nop
	addi	%hp, %hp, 1
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
	fsw	%f0, 0(%hp)
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	addi	%hp, %hp, 1
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
	sw	%v1, 0(%a0)
	nop
	addi	%a1, %a1, -1
	nop

	nop
	nop
	addi	%a0, %a0, 1
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
	fsw	%f0, 0(%v1)
	nop
	addi	%a0, %a0, -1
	nop

	nop
	nop
	addi	%v1, %v1, 1
	j	create_float_extarray_loop

reduction_2pi_sub1.2626:

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33181

	flw	%f1, 495(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33182

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33183

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33184

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33185

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33186

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33187

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33188

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33189

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33190

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33191

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33192

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33193

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33194

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33195

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.33196

	nop
	nop
	fmul	%f1, %f1, %f0
	fmov	%f0, %f16

	nop
	nop
	nop
	j	reduction_2pi_sub1.2626

fbgt_else.33196:

fbgt_else.33195:

fbgt_else.33194:

fbgt_else.33193:

fbgt_else.33192:

fbgt_else.33191:

fbgt_else.33190:

fbgt_else.33189:

fbgt_else.33188:

fbgt_else.33187:

fbgt_else.33186:

fbgt_else.33185:

fbgt_else.33184:

fbgt_else.33183:

fbgt_else.33182:

fbgt_else.33181:

reduction_2pi_sub2.2629:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33305

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33306

	flw	%f16, 495(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f16
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33307

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33308

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33309

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33310

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33311

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33312

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.33312:

fbgt_else.33311:

fbgt_else.33310:

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33313

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33314

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.33314:

fbgt_else.33313:

fbgt_else.33309:

fbgt_else.33308:

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33315

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33316

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33317

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33318

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.33318:

fbgt_else.33317:

fbgt_else.33316:

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33319

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33320

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.33320:

fbgt_else.33319:

fbgt_else.33315:

fbgt_else.33307:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33306:

	nop
	nop
	fdiv	%f1, %f1, %f16
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33321

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33322

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33323

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33324

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33325

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33326

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.33326:

fbgt_else.33325:

fbgt_else.33324:

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33327

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33328

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.33328:

fbgt_else.33327:

fbgt_else.33323:

fbgt_else.33322:

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33329

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33330

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33331

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33332

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.33332:

fbgt_else.33331:

fbgt_else.33330:

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33333

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33334

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	j	reduction_2pi_sub2.2629

fbgt_else.33334:

fbgt_else.33333:

fbgt_else.33329:

fbgt_else.33321:

fbgt_else.33305:

print_int_sub1.2641:
	nop
	nop
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.33401

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.33402

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.33403

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.33404

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.33405

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.33406

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.33407

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.33408

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.33409

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.33410

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.33411

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.33412

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.33413

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.33414

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.33415

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.33416

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v1, %v0, 4

	nop
	nop
	addi	%v0, %a0, 0
	j	print_int_sub1.2641

bgti_else.33416:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.33415:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.33414:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.33413:
	nop
	nop
	nop
	jr	%ra

bgti_else.33412:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.33411:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.33410:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.33409:
	nop
	nop
	nop
	jr	%ra

bgti_else.33408:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.33407:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.33406:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.33405:
	nop
	nop
	nop
	jr	%ra

bgti_else.33404:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.33403:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.33402:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.33401:
	nop
	nop
	nop
	jr	%ra

print_int_sub2.2644:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33531

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.33532

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.33533

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.33534

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33535

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.33536

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.33537

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.33538

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33539

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.33540

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.33541

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.33542

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33543

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.33544

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.33545

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.33546

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33547

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.33548

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.33549

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.33550

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33551

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.33552

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.33553

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.33554

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33555

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.33556

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.33557

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.33558

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33559

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.33560

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.33561

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.33562

	nop
	nop
	addi	%v0, %v0, -40
	j	print_int_sub2.2644

bgti_else.33562:

bgti_else.33561:

bgti_else.33560:

bgti_else.33559:

bgti_else.33558:

bgti_else.33557:

bgti_else.33556:

bgti_else.33555:

bgti_else.33554:

bgti_else.33553:

bgti_else.33552:

bgti_else.33551:

bgti_else.33550:

bgti_else.33549:

bgti_else.33548:

bgti_else.33547:

bgti_else.33546:

bgti_else.33545:

bgti_else.33544:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.33543:
	nop
	nop
	nop
	jr	%ra

bgti_else.33542:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.33541:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.33540:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.33539:
	nop
	nop
	nop
	jr	%ra

bgti_else.33538:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.33537:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.33536:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.33535:
	nop
	nop
	nop
	jr	%ra

bgti_else.33534:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.33533:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.33532:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.33531:
	nop
	nop
	nop
	jr	%ra

rotate_quadratic_matrix.2779:

	flw	%f2, 493(%zero)
	nop
	fabs	%f17, %f18
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.33978

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.33979

	flw	%f1, 480(%zero)
	nop
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.33979

fbgt_else.34002:
fbgt_cont.34003:

fbgt_else.34000:
fbgt_cont.34001:

fbgt_else.33998:
fbgt_cont.33999:

fbgt_else.33996:
fbgt_cont.33997:

fbgt_else.33994:
fbgt_cont.33995:

fbgt_else.33992:
fbgt_cont.33993:

fbgt_else.33990:
fbgt_cont.33991:

fbgt_else.33988:
fbgt_cont.33989:

fbgt_else.33986:
fbgt_cont.33987:

fbgt_else.33984:
fbgt_cont.33985:

fbgt_else.33982:
fbgt_cont.33983:

fbgt_else.33980:
fbgt_cont.33981:

fbgt_else.33978:

fbgt_cont.33979:

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.34006

	flw	%f16, 495(%zero)
	nop
	fsub	%f0, %f17, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f17, %f0
	j	fbgt_cont.34005

fbgt_else.34006:

	nop
	nop
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f17, %f0
	nop

fbgt_cont.34007:

fbgt_else.34004:
fbgt_cont.34005:

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.34009

fbgt_else.34008:

fbgt_cont.34009:

	nop
	nop
	fsub	%f17, %f17, %f19
	j	fbgt_cont.34011

fbgt_else.34010:
fbgt_cont.34011:

	nop
	nop
	nop
	fblt	%f17, %f20, fbgt_else.34012

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34014

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.34013

bnei_else.34014:

bnei_cont.34015:

fbgt_else.34012:
fbgt_cont.34013:

	nop
	nop
	fsub	%f17, %f19, %f17
	j	fbgt_cont.34017

fbgt_else.34016:
fbgt_cont.34017:

	nop
	nop
	nop
	fblt	%f21, %f17, fbgt_else.34018

	flw	%f0, 473(%zero)
	nop
	fmul	%f17, %f17, %f17
	nop

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f17, %f1, %f0
	j	fbgt_cont.34019

fbgt_else.34018:

	nop
	nop
	fmul	%f17, %f22, %f22
	fmul	%f0, %f0, %f22

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f22, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f17, %f1, %f0
	nop

fbgt_cont.34019:

	nop
	nop
	nop
	j	bnei_cont.34021

bnei_else.34020:

bnei_cont.34021:

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.34023

fbgt_else.34022:

fbgt_cont.34023:

	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_else.34024

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34025

	flw	%f1, 480(%zero)
	nop
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34025

fbgt_else.34048:
fbgt_cont.34049:

fbgt_else.34046:
fbgt_cont.34047:

fbgt_else.34044:
fbgt_cont.34045:

fbgt_else.34042:
fbgt_cont.34043:

fbgt_else.34040:
fbgt_cont.34041:

fbgt_else.34038:
fbgt_cont.34039:

fbgt_else.34036:
fbgt_cont.34037:

fbgt_else.34034:
fbgt_cont.34035:

fbgt_else.34032:
fbgt_cont.34033:

fbgt_else.34030:
fbgt_cont.34031:

fbgt_else.34028:
fbgt_cont.34029:

fbgt_else.34026:
fbgt_cont.34027:

fbgt_else.34024:

fbgt_cont.34025:

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_else.34052

	flw	%f16, 495(%zero)
	nop
	fsub	%f0, %f18, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	j	fbgt_cont.34051

fbgt_else.34052:

	nop
	nop
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f18

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	nop

fbgt_cont.34053:

fbgt_else.34050:
fbgt_cont.34051:

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34056

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.34055

bnei_else.34056:

bnei_cont.34057:

fbgt_else.34054:
fbgt_cont.34055:

	nop
	nop
	fsub	%f18, %f18, %f19
	j	fbgt_cont.34059

fbgt_else.34058:
fbgt_cont.34059:

	nop
	nop
	fsub	%f18, %f19, %f18
	j	fbgt_cont.34061

fbgt_else.34060:
fbgt_cont.34061:

	flw	%f0, 477(%zero)
	nop
	fmul	%f22, %f18, %f18
	nop

	nop
	nop
	fmul	%f16, %f22, %f22
	fmul	%f0, %f0, %f18

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f18, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f18, %f1, %f0
	j	fbgt_cont.34063

fbgt_else.34062:

	flw	%f0, 473(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f18, %f1, %f0
	nop

fbgt_cont.34063:

	nop
	nop
	nop
	j	bnei_cont.34065

bnei_else.34064:

bnei_cont.34065:

	nop
	nop
	fabs	%f22, %f23
	nop

	nop
	nop
	nop
	fblt	%f22, %f2, fbgt_else.34066

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34067

	flw	%f1, 480(%zero)
	nop
	fmov	%f0, %f22
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34067

fbgt_else.34090:
fbgt_cont.34091:

fbgt_else.34088:
fbgt_cont.34089:

fbgt_else.34086:
fbgt_cont.34087:

fbgt_else.34084:
fbgt_cont.34085:

fbgt_else.34082:
fbgt_cont.34083:

fbgt_else.34080:
fbgt_cont.34081:

fbgt_else.34078:
fbgt_cont.34079:

fbgt_else.34076:
fbgt_cont.34077:

fbgt_else.34074:
fbgt_cont.34075:

fbgt_else.34072:
fbgt_cont.34073:

fbgt_else.34070:
fbgt_cont.34071:

fbgt_else.34068:
fbgt_cont.34069:

fbgt_else.34066:

fbgt_cont.34067:

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_else.34094

	flw	%f16, 495(%zero)
	nop
	fsub	%f0, %f22, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f22, %f0
	j	fbgt_cont.34093

fbgt_else.34094:

	nop
	nop
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f22

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f22, %f0
	nop

fbgt_cont.34095:

fbgt_else.34092:
fbgt_cont.34093:

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.34097

fbgt_else.34096:

fbgt_cont.34097:

	nop
	nop
	fsub	%f22, %f22, %f19
	j	fbgt_cont.34099

fbgt_else.34098:
fbgt_cont.34099:

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34102

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.34101

bnei_else.34102:

bnei_cont.34103:

fbgt_else.34100:
fbgt_cont.34101:

	nop
	nop
	fsub	%f22, %f19, %f22
	j	fbgt_cont.34105

fbgt_else.34104:
fbgt_cont.34105:

	flw	%f0, 473(%zero)
	nop
	fmul	%f22, %f22, %f22
	nop

	nop
	nop
	fmul	%f16, %f22, %f22
	fmul	%f0, %f0, %f22

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f22, %f1, %f0
	j	fbgt_cont.34107

fbgt_else.34106:

	nop
	nop
	fmul	%f16, %f24, %f24
	fmul	%f0, %f0, %f24

	nop
	nop
	fmul	%f22, %f16, %f16
	fmul	%f0, %f0, %f16

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f24, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fsub	%f22, %f1, %f0
	nop

fbgt_cont.34107:

	nop
	nop
	nop
	j	bnei_cont.34109

bnei_else.34108:

bnei_cont.34109:

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.34111

fbgt_else.34110:

fbgt_cont.34111:

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_else.34112

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34113

	flw	%f1, 480(%zero)
	nop
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34113

fbgt_else.34136:
fbgt_cont.34137:

fbgt_else.34134:
fbgt_cont.34135:

fbgt_else.34132:
fbgt_cont.34133:

fbgt_else.34130:
fbgt_cont.34131:

fbgt_else.34128:
fbgt_cont.34129:

fbgt_else.34126:
fbgt_cont.34127:

fbgt_else.34124:
fbgt_cont.34125:

fbgt_else.34122:
fbgt_cont.34123:

fbgt_else.34120:
fbgt_cont.34121:

fbgt_else.34118:
fbgt_cont.34119:

fbgt_else.34116:
fbgt_cont.34117:

fbgt_else.34114:
fbgt_cont.34115:

fbgt_else.34112:

fbgt_cont.34113:

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_else.34140

	flw	%f16, 495(%zero)
	nop
	fsub	%f0, %f23, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	j	fbgt_cont.34139

fbgt_else.34140:

	nop
	nop
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f23

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	nop

fbgt_cont.34141:

fbgt_else.34138:
fbgt_cont.34139:

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34144

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.34143

bnei_else.34144:

bnei_cont.34145:

fbgt_else.34142:
fbgt_cont.34143:

	nop
	nop
	fsub	%f23, %f23, %f19
	j	fbgt_cont.34147

fbgt_else.34146:
fbgt_cont.34147:

	nop
	nop
	fsub	%f23, %f19, %f23
	j	fbgt_cont.34149

fbgt_else.34148:
fbgt_cont.34149:

	flw	%f0, 477(%zero)
	nop
	fmul	%f24, %f23, %f23
	nop

	nop
	nop
	fmul	%f16, %f24, %f24
	fmul	%f0, %f0, %f23

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f23, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f23, %f1, %f0
	j	fbgt_cont.34151

fbgt_else.34150:

	flw	%f0, 473(%zero)
	nop
	fmul	%f23, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f23, %f1, %f0
	nop

fbgt_cont.34151:

	nop
	nop
	nop
	j	bnei_cont.34153

bnei_else.34152:

bnei_cont.34153:

	nop
	nop
	fabs	%f24, %f25
	nop

	nop
	nop
	nop
	fblt	%f24, %f2, fbgt_else.34154

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34155

	flw	%f1, 480(%zero)
	nop
	fmov	%f0, %f24
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34155

fbgt_else.34178:
fbgt_cont.34179:

fbgt_else.34176:
fbgt_cont.34177:

fbgt_else.34174:
fbgt_cont.34175:

fbgt_else.34172:
fbgt_cont.34173:

fbgt_else.34170:
fbgt_cont.34171:

fbgt_else.34168:
fbgt_cont.34169:

fbgt_else.34166:
fbgt_cont.34167:

fbgt_else.34164:
fbgt_cont.34165:

fbgt_else.34162:
fbgt_cont.34163:

fbgt_else.34160:
fbgt_cont.34161:

fbgt_else.34158:
fbgt_cont.34159:

fbgt_else.34156:
fbgt_cont.34157:

fbgt_else.34154:

fbgt_cont.34155:

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_else.34182

	flw	%f16, 495(%zero)
	nop
	fsub	%f0, %f24, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f24, %f0
	j	fbgt_cont.34181

fbgt_else.34182:

	nop
	nop
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f24

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f24, %f0
	nop

fbgt_cont.34183:

fbgt_else.34180:
fbgt_cont.34181:

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.34185

fbgt_else.34184:

fbgt_cont.34185:

	nop
	nop
	fsub	%f24, %f24, %f19
	j	fbgt_cont.34187

fbgt_else.34186:
fbgt_cont.34187:

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34190

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.34189

bnei_else.34190:

bnei_cont.34191:

fbgt_else.34188:
fbgt_cont.34189:

	nop
	nop
	fsub	%f24, %f19, %f24
	j	fbgt_cont.34193

fbgt_else.34192:
fbgt_cont.34193:

	flw	%f0, 473(%zero)
	nop
	fmul	%f24, %f24, %f24
	nop

	nop
	nop
	fmul	%f16, %f24, %f24
	fmul	%f0, %f0, %f24

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f24, %f1, %f0
	j	fbgt_cont.34195

fbgt_else.34194:

	nop
	nop
	fmul	%f24, %f26, %f26
	fmul	%f0, %f0, %f26

	nop
	nop
	fmul	%f16, %f24, %f24
	fmul	%f0, %f0, %f24

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f26, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f24, %f1, %f0
	nop

fbgt_cont.34195:

	nop
	nop
	nop
	j	bnei_cont.34197

bnei_else.34196:

bnei_cont.34197:

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.34199

fbgt_else.34198:

fbgt_cont.34199:

	nop
	nop
	nop
	fblt	%f25, %f2, fbgt_else.34200

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34201

	flw	%f1, 480(%zero)
	nop
	fmov	%f0, %f25
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34201

fbgt_else.34224:
fbgt_cont.34225:

fbgt_else.34222:
fbgt_cont.34223:

fbgt_else.34220:
fbgt_cont.34221:

fbgt_else.34218:
fbgt_cont.34219:

fbgt_else.34216:
fbgt_cont.34217:

fbgt_else.34214:
fbgt_cont.34215:

fbgt_else.34212:
fbgt_cont.34213:

fbgt_else.34210:
fbgt_cont.34211:

fbgt_else.34208:
fbgt_cont.34209:

fbgt_else.34206:
fbgt_cont.34207:

fbgt_else.34204:
fbgt_cont.34205:

fbgt_else.34202:
fbgt_cont.34203:

fbgt_else.34200:

fbgt_cont.34201:

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_else.34228

	flw	%f16, 495(%zero)
	nop
	fsub	%f0, %f25, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f25, %f0
	j	fbgt_cont.34227

fbgt_else.34228:

	nop
	nop
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f25, %f0
	nop

fbgt_cont.34229:

fbgt_else.34226:
fbgt_cont.34227:

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34232

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.34231

bnei_else.34232:

bnei_cont.34233:

fbgt_else.34230:
fbgt_cont.34231:

	nop
	nop
	fsub	%f25, %f25, %f19
	j	fbgt_cont.34235

fbgt_else.34234:
fbgt_cont.34235:

	nop
	nop
	fsub	%f25, %f19, %f25
	j	fbgt_cont.34237

fbgt_else.34236:
fbgt_cont.34237:

	flw	%f0, 477(%zero)
	nop
	fmul	%f19, %f25, %f25
	nop

	nop
	nop
	fmul	%f16, %f19, %f19
	fmul	%f0, %f0, %f25

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f25, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.34239

fbgt_else.34238:

	flw	%f0, 473(%zero)
	nop
	fmul	%f19, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f19, %f19
	fmul	%f0, %f0, %f19

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.34239:

	nop
	nop
	nop
	j	bnei_cont.34241

bnei_else.34240:

bnei_cont.34241:

	nop
	nop
	fmul	%f19, %f2, %f24
	fmul	%f16, %f17, %f0

	nop
	nop
	fsub	%f20, %f19, %f16
	fmul	%f21, %f17, %f23

	nop
	nop
	fmul	%f19, %f21, %f24
	fmul	%f16, %f18, %f0

	nop
	nop
	fadd	%f16, %f19, %f16
	fmul	%f25, %f22, %f0

	nop
	nop
	fmul	%f2, %f2, %f0
	fmul	%f19, %f17, %f24

	flw	%f21, 495(%zero)
	nop
	fadd	%f2, %f2, %f19
	fmul	%f19, %f21, %f0

	nop
	nop
	fmul	%f0, %f18, %f24
	fneg	%f23, %f23

	flw	%f18, 0(%v0)
	nop
	fsub	%f24, %f19, %f0
	fmul	%f19, %f18, %f22

	nop
	nop
	fmul	%f22, %f17, %f22
	fmul	%f0, %f1, %f1

	nop
	nop
	fmul	%f17, %f18, %f0
	fmul	%f0, %f25, %f25

	nop
	nop
	fmul	%f0, %f27, %f0
	add	%ra, %zero, %a0

	nop
	nop
	fadd	%f17, %f17, %f0
	fmul	%f0, %f23, %f23

	nop
	nop
	fmul	%f0, %f26, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 0(%v0)
	nop
	fmul	%f0, %f20, %f20
	nop

	nop
	nop
	fmul	%f17, %f18, %f0
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f27, %f0
	nop

	nop
	nop
	fadd	%f17, %f17, %f0
	fmul	%f0, %f19, %f19

	nop
	nop
	fmul	%f0, %f26, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fmul	%f0, %f16, %f16
	nop

	nop
	nop
	fmul	%f17, %f18, %f0
	fmul	%f0, %f24, %f24

	nop
	nop
	fmul	%f0, %f27, %f0
	nop

	nop
	nop
	fadd	%f17, %f17, %f0
	fmul	%f0, %f22, %f22

	nop
	nop
	fmul	%f0, %f26, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fmul	%f0, %f18, %f20
	fmul	%f18, %f18, %f1

	nop
	nop
	fmul	%f17, %f0, %f16
	fmul	%f0, %f27, %f2

	nop
	nop
	fmul	%f0, %f0, %f24
	fmul	%f1, %f18, %f16

	nop
	nop
	fadd	%f17, %f17, %f0
	fmul	%f0, %f26, %f19

	nop
	nop
	fmul	%f0, %f0, %f22
	fmul	%f16, %f26, %f23

	nop
	nop
	fadd	%f0, %f17, %f0
	fmul	%f17, %f27, %f25

	nop
	nop
	fmul	%f0, %f21, %f0
	nop

	fsw	%f0, 0(%v1)
	nop
	fmul	%f0, %f17, %f24
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f22

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f21, %f0
	nop

	fsw	%f0, 1(%v1)
	nop
	fmul	%f0, %f17, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f19

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f21, %f0
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	jr	%ra

read_nth_object.2782:
	nop
	nop
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%a2, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.34690

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%a3, %v0, 0
	jal	min_caml_read_int

	nop
	nop
	addi	%k0, %v0, 0
	jal	min_caml_read_int

	nop
	nop
	addi	%s0, %v0, 0
	addi	%s1, %zero, 3

	nop
	nop
	addi	%v0, %s1, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s2, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s2)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s2)
	nop
	addi	%s5, %zero, 2
	jal	min_caml_read_float

	fsw	%f0, 2(%s2)
	nop
	addi	%v0, %s1, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s3, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s3)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s3)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s3)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.34691

	nop
	nop
	add	%s4, %zero, %zero
	j	fbgt_cont.34692

fbgt_else.34691:
	nop
	nop
	add	%s4, %zero, %k1
	nop

fbgt_cont.34692:
	nop
	nop
	addi	%v0, %s5, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s5, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s5)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s5)
	nop
	addi	%v0, %s1, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s6, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s6)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s6)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s6)
	nop
	addi	%v0, %s1, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s1, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%s0, 0, bnei_else.34693

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%s1)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%s1)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%s1)
	nop
	nop
	j	bnei_cont.34694

bnei_else.34693:
bnei_cont.34694:
	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.34695

	nop
	nop
	add	%s7, %zero, %s4
	j	bnei_cont.34696

bnei_else.34695:

bnei_cont.34696:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11

	sw	%v0, 10(%ra)
	nop
	nop
	nop

	sw	%s1, 9(%ra)
	nop
	nop
	nop

	sw	%s6, 8(%ra)
	nop
	nop
	nop

	sw	%s5, 7(%ra)
	nop
	nop
	nop

	sw	%s7, 6(%ra)
	nop
	nop
	nop

	sw	%s3, 5(%ra)
	nop
	nop
	nop

	sw	%s2, 4(%ra)
	nop
	nop
	nop

	sw	%s0, 3(%ra)
	nop
	nop
	nop

	sw	%k0, 2(%ra)
	nop
	nop
	nop

	sw	%a3, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 12(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.34697

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.34699

	nop
	nop
	nop
	j	bnei_cont.34698

bnei_else.34699:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34702

bnei_else.34701:

bnei_cont.34702:

	flw	%f16, 2(%s2)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.34703

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.34704

fbeq_else.34703:

fbeq_cont.34704:

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.34706

bnei_else.34705:

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.34708

bnei_else.34707:

bnei_cont.34708:
bnei_cont.34706:

	fsw	%f1, 0(%s2)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 1(%s2)
	nop
	nop
	nop

	fsw	%f0, 2(%s2)
	nop
	nop
	nop

bnei_cont.34700:

bnei_else.34697:
	flw	%f1, 0(%s2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.34709

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34710

fbeq_else.34709:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34710:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34711

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.34712

bnei_else.34711:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.34713

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34714

fbeq_else.34713:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34714:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34715

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.34716

bnei_else.34715:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.34717

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34718

fbgt_else.34717:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34718:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34719

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.34720

bnei_else.34719:

bnei_cont.34720:
bnei_cont.34716:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.34712:
	fsw	%f0, 0(%s2)
	nop
	nop
	nop

	flw	%f1, 1(%s2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.34721

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34722

fbeq_else.34721:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34722:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34723

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.34724

bnei_else.34723:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.34725

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34726

fbeq_else.34725:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34726:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34727

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.34728

bnei_else.34727:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.34729

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34730

fbgt_else.34729:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34730:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34731

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.34732

bnei_else.34731:

bnei_cont.34732:
bnei_cont.34728:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.34724:
	fsw	%f0, 1(%s2)
	nop
	nop
	nop

	flw	%f1, 2(%s2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.34733

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34734

fbeq_else.34733:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34734:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34735

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.34736

bnei_else.34735:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.34737

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34738

fbeq_else.34737:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34738:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34739

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.34740

bnei_else.34739:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.34741

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34742

fbgt_else.34741:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34742:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34743

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.34744

bnei_else.34743:

bnei_cont.34744:
bnei_cont.34740:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.34736:
	fsw	%f0, 2(%s2)
	nop
	nop
	nop

bnei_cont.34698:
	nop
	nop
	nop
	beqi	%s0, 0, bnei_else.34745

	flw	%f18, 0(%s1)
	flw	%f19, 494(%zero)
	nop
	nop

	flw	%f2, 493(%zero)
	nop
	fabs	%f17, %f18
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.34747

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.34748

	flw	%f1, 481(%zero)
	nop
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34748

fbgt_else.34769:
fbgt_cont.34770:

fbgt_else.34767:
fbgt_cont.34768:

fbgt_else.34765:
fbgt_cont.34766:

fbgt_else.34763:
fbgt_cont.34764:

fbgt_else.34761:
fbgt_cont.34762:

fbgt_else.34759:
fbgt_cont.34760:

fbgt_else.34757:
fbgt_cont.34758:

fbgt_else.34755:
fbgt_cont.34756:

fbgt_else.34753:
fbgt_cont.34754:

fbgt_else.34751:
fbgt_cont.34752:

fbgt_else.34749:
fbgt_cont.34750:

fbgt_else.34747:

fbgt_cont.34748:

	nop
	nop
	nop
	fblt	%f0, %f19, fbgt_else.34771

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34772

fbgt_else.34771:

fbgt_cont.34772:

	nop
	nop
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34774

fbgt_else.34773:
fbgt_cont.34774:

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.34775

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34777

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34776

bnei_else.34777:

bnei_cont.34778:

fbgt_else.34775:
fbgt_cont.34776:

	nop
	nop
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34780

fbgt_else.34779:
fbgt_cont.34780:

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_else.34781

	flw	%f0, 473(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f17, %f1, %f0
	j	fbgt_cont.34782

fbgt_else.34781:

	nop
	nop
	fmul	%f17, %f22, %f22
	fmul	%f0, %f0, %f22

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f22, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f17, %f1, %f0
	nop

fbgt_cont.34782:

	nop
	nop
	nop
	j	bnei_cont.34784

bnei_else.34783:

bnei_cont.34784:

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.34786

fbgt_else.34785:

fbgt_cont.34786:

	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_else.34787

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_cont.34788

	flw	%f1, 481(%zero)
	nop
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34788

fbgt_else.34809:
fbgt_cont.34810:

fbgt_else.34807:
fbgt_cont.34808:

fbgt_else.34805:
fbgt_cont.34806:

fbgt_else.34803:
fbgt_cont.34804:

fbgt_else.34801:
fbgt_cont.34802:

fbgt_else.34799:
fbgt_cont.34800:

fbgt_else.34797:
fbgt_cont.34798:

fbgt_else.34795:
fbgt_cont.34796:

fbgt_else.34793:
fbgt_cont.34794:

fbgt_else.34791:
fbgt_cont.34792:

fbgt_else.34789:
fbgt_cont.34790:

fbgt_else.34787:

fbgt_cont.34788:

	nop
	nop
	nop
	fblt	%f0, %f19, fbgt_else.34811

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34813

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34812

bnei_else.34813:

bnei_cont.34814:

fbgt_else.34811:
fbgt_cont.34812:

	nop
	nop
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34816

fbgt_else.34815:
fbgt_cont.34816:

	nop
	nop
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34818

fbgt_else.34817:
fbgt_cont.34818:

	flw	%f1, 477(%zero)
	nop
	fmul	%f22, %f0, %f0
	nop

	nop
	nop
	fmul	%f18, %f22, %f22
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f22
	nop

	flw	%f1, 476(%zero)
	nop
	fsub	%f16, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 475(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fsub	%f18, %f16, %f0
	j	fbgt_cont.34820

fbgt_else.34819:

	flw	%f0, 473(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f18, %f1, %f0
	nop

fbgt_cont.34820:

	nop
	nop
	nop
	j	bnei_cont.34822

bnei_else.34821:

bnei_cont.34822:

	nop
	nop
	fabs	%f22, %f23
	nop

	nop
	nop
	nop
	fblt	%f22, %f2, fbgt_else.34823

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f1, fbgt_cont.34824

	flw	%f1, 481(%zero)
	nop
	fmov	%f0, %f22
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34824

fbgt_else.34845:
fbgt_cont.34846:

fbgt_else.34843:
fbgt_cont.34844:

fbgt_else.34841:
fbgt_cont.34842:

fbgt_else.34839:
fbgt_cont.34840:

fbgt_else.34837:
fbgt_cont.34838:

fbgt_else.34835:
fbgt_cont.34836:

fbgt_else.34833:
fbgt_cont.34834:

fbgt_else.34831:
fbgt_cont.34832:

fbgt_else.34829:
fbgt_cont.34830:

fbgt_else.34827:
fbgt_cont.34828:

fbgt_else.34825:
fbgt_cont.34826:

fbgt_else.34823:

fbgt_cont.34824:

	nop
	nop
	nop
	fblt	%f0, %f19, fbgt_else.34847

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34848

fbgt_else.34847:

fbgt_cont.34848:

	nop
	nop
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34850

fbgt_else.34849:
fbgt_cont.34850:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34853

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34852

bnei_else.34853:

bnei_cont.34854:

fbgt_else.34851:
fbgt_cont.34852:

	nop
	nop
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34856

fbgt_else.34855:
fbgt_cont.34856:

	flw	%f0, 473(%zero)
	nop
	fmul	%f22, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f22, %f22
	fmul	%f0, %f0, %f22

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f22, %f1, %f0
	j	fbgt_cont.34858

fbgt_else.34857:

	nop
	nop
	fmul	%f16, %f24, %f24
	fmul	%f0, %f0, %f24

	nop
	nop
	fmul	%f22, %f16, %f16
	fmul	%f0, %f0, %f16

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f24, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fsub	%f22, %f1, %f0
	nop

fbgt_cont.34858:

	nop
	nop
	nop
	j	bnei_cont.34860

bnei_else.34859:

bnei_cont.34860:

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.34862

fbgt_else.34861:

fbgt_cont.34862:

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_else.34863

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_cont.34864

	flw	%f1, 481(%zero)
	nop
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34864

fbgt_else.34885:
fbgt_cont.34886:

fbgt_else.34883:
fbgt_cont.34884:

fbgt_else.34881:
fbgt_cont.34882:

fbgt_else.34879:
fbgt_cont.34880:

fbgt_else.34877:
fbgt_cont.34878:

fbgt_else.34875:
fbgt_cont.34876:

fbgt_else.34873:
fbgt_cont.34874:

fbgt_else.34871:
fbgt_cont.34872:

fbgt_else.34869:
fbgt_cont.34870:

fbgt_else.34867:
fbgt_cont.34868:

fbgt_else.34865:
fbgt_cont.34866:

fbgt_else.34863:

fbgt_cont.34864:

	nop
	nop
	nop
	fblt	%f0, %f19, fbgt_else.34887

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34889

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34888

bnei_else.34889:

bnei_cont.34890:

fbgt_else.34887:
fbgt_cont.34888:

	nop
	nop
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34892

fbgt_else.34891:
fbgt_cont.34892:

	nop
	nop
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34894

fbgt_else.34893:
fbgt_cont.34894:

	flw	%f1, 477(%zero)
	nop
	fmul	%f24, %f0, %f0
	nop

	nop
	nop
	fmul	%f23, %f24, %f24
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	flw	%f1, 476(%zero)
	nop
	fsub	%f16, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	flw	%f1, 475(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fsub	%f23, %f16, %f0
	j	fbgt_cont.34896

fbgt_else.34895:

	flw	%f0, 473(%zero)
	nop
	fmul	%f23, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f23, %f1, %f0
	nop

fbgt_cont.34896:

	nop
	nop
	nop
	j	bnei_cont.34898

bnei_else.34897:

bnei_cont.34898:

	nop
	nop
	fabs	%f24, %f25
	nop

	nop
	nop
	nop
	fblt	%f24, %f2, fbgt_else.34899

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_cont.34900

	flw	%f1, 481(%zero)
	nop
	fmov	%f0, %f24
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34900

fbgt_else.34921:
fbgt_cont.34922:

fbgt_else.34919:
fbgt_cont.34920:

fbgt_else.34917:
fbgt_cont.34918:

fbgt_else.34915:
fbgt_cont.34916:

fbgt_else.34913:
fbgt_cont.34914:

fbgt_else.34911:
fbgt_cont.34912:

fbgt_else.34909:
fbgt_cont.34910:

fbgt_else.34907:
fbgt_cont.34908:

fbgt_else.34905:
fbgt_cont.34906:

fbgt_else.34903:
fbgt_cont.34904:

fbgt_else.34901:
fbgt_cont.34902:

fbgt_else.34899:

fbgt_cont.34900:

	nop
	nop
	nop
	fblt	%f0, %f19, fbgt_else.34923

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34924

fbgt_else.34923:

fbgt_cont.34924:

	nop
	nop
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34926

fbgt_else.34925:
fbgt_cont.34926:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34929

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34928

bnei_else.34929:

bnei_cont.34930:

fbgt_else.34927:
fbgt_cont.34928:

	nop
	nop
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34932

fbgt_else.34931:
fbgt_cont.34932:

	flw	%f0, 473(%zero)
	nop
	fmul	%f24, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f24, %f24
	fmul	%f0, %f0, %f24

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f24, %f1, %f0
	j	fbgt_cont.34934

fbgt_else.34933:

	nop
	nop
	fmul	%f24, %f26, %f26
	fmul	%f0, %f0, %f26

	nop
	nop
	fmul	%f16, %f24, %f24
	fmul	%f0, %f0, %f24

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f26, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f24, %f1, %f0
	nop

fbgt_cont.34934:

	nop
	nop
	nop
	j	bnei_cont.34936

bnei_else.34935:

bnei_cont.34936:

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.34938

fbgt_else.34937:

fbgt_cont.34938:

	nop
	nop
	nop
	fblt	%f25, %f2, fbgt_else.34939

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f1, fbgt_cont.34940

	flw	%f1, 481(%zero)
	nop
	fmov	%f0, %f25
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.34940

fbgt_else.34961:
fbgt_cont.34962:

fbgt_else.34959:
fbgt_cont.34960:

fbgt_else.34957:
fbgt_cont.34958:

fbgt_else.34955:
fbgt_cont.34956:

fbgt_else.34953:
fbgt_cont.34954:

fbgt_else.34951:
fbgt_cont.34952:

fbgt_else.34949:
fbgt_cont.34950:

fbgt_else.34947:
fbgt_cont.34948:

fbgt_else.34945:
fbgt_cont.34946:

fbgt_else.34943:
fbgt_cont.34944:

fbgt_else.34941:
fbgt_cont.34942:

fbgt_else.34939:

fbgt_cont.34940:

	nop
	nop
	nop
	fblt	%f0, %f19, fbgt_else.34963

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34965

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34964

bnei_else.34965:

bnei_cont.34966:

fbgt_else.34963:
fbgt_cont.34964:

	nop
	nop
	fsub	%f0, %f0, %f19
	j	fbgt_cont.34968

fbgt_else.34967:
fbgt_cont.34968:

	nop
	nop
	fsub	%f0, %f19, %f0
	j	fbgt_cont.34970

fbgt_else.34969:
fbgt_cont.34970:

	flw	%f1, 477(%zero)
	nop
	fmul	%f2, %f0, %f0
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 476(%zero)
	nop
	fsub	%f16, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	flw	%f1, 475(%zero)
	nop
	fadd	%f16, %f16, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f16, %f0
	j	fbgt_cont.34972

fbgt_else.34971:

	flw	%f0, 473(%zero)
	nop
	fmul	%f19, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f19, %f19
	fmul	%f0, %f0, %f19

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.34972:

	nop
	nop
	nop
	j	bnei_cont.34974

bnei_else.34973:

bnei_cont.34974:

	nop
	nop
	fmul	%f19, %f2, %f24
	fmul	%f16, %f17, %f0

	nop
	nop
	fsub	%f20, %f19, %f16
	fmul	%f21, %f17, %f23

	nop
	nop
	fmul	%f19, %f21, %f24
	fmul	%f16, %f18, %f0

	nop
	nop
	fadd	%f16, %f19, %f16
	fmul	%f25, %f22, %f0

	nop
	nop
	fmul	%f2, %f2, %f0
	fmul	%f19, %f17, %f24

	flw	%f21, 495(%zero)
	nop
	fadd	%f2, %f2, %f19
	fmul	%f19, %f21, %f0

	nop
	nop
	fmul	%f0, %f18, %f24
	fneg	%f23, %f23

	flw	%f18, 0(%s2)
	nop
	fsub	%f24, %f19, %f0
	fmul	%f19, %f18, %f22

	nop
	nop
	fmul	%f22, %f17, %f22
	fmul	%f0, %f1, %f1

	nop
	nop
	fmul	%f17, %f18, %f0
	fmul	%f0, %f25, %f25

	nop
	nop
	fmul	%f0, %f27, %f0
	nop

	nop
	nop
	fadd	%f17, %f17, %f0
	fmul	%f0, %f23, %f23

	nop
	nop
	fmul	%f0, %f26, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 0(%s2)
	nop
	fmul	%f0, %f20, %f20
	nop

	nop
	nop
	fmul	%f17, %f18, %f0
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f27, %f0
	nop

	nop
	nop
	fadd	%f17, %f17, %f0
	fmul	%f0, %f19, %f19

	nop
	nop
	fmul	%f0, %f26, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 1(%s2)
	nop
	fmul	%f0, %f16, %f16
	nop

	nop
	nop
	fmul	%f17, %f18, %f0
	fmul	%f0, %f24, %f24

	nop
	nop
	fmul	%f0, %f27, %f0
	nop

	nop
	nop
	fadd	%f17, %f17, %f0
	fmul	%f0, %f22, %f22

	nop
	nop
	fmul	%f0, %f26, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 2(%s2)
	nop
	fmul	%f0, %f18, %f20
	fmul	%f18, %f18, %f1

	nop
	nop
	fmul	%f17, %f0, %f16
	fmul	%f0, %f27, %f2

	nop
	nop
	fmul	%f0, %f0, %f24
	fmul	%f1, %f18, %f16

	nop
	nop
	fadd	%f17, %f17, %f0
	fmul	%f0, %f26, %f19

	nop
	nop
	fmul	%f0, %f0, %f22
	fmul	%f16, %f26, %f23

	nop
	nop
	fadd	%f0, %f17, %f0
	fmul	%f17, %f27, %f25

	nop
	nop
	fmul	%f0, %f21, %f0
	nop

	fsw	%f0, 0(%s1)
	nop
	fmul	%f0, %f17, %f24
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f22

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f21, %f0
	nop

	fsw	%f0, 1(%s1)
	nop
	fmul	%f0, %f17, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f19

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f21, %f0
	nop

	fsw	%f0, 2(%s1)
	nop
	nop
	j	bnei_cont.34746

bnei_else.34745:
bnei_cont.34746:
	nop
	nop
	add	%ra, %zero, %a1
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.34690:
	nop
	nop
	add	%ra, %zero, %a1
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

read_object.2784:
	nop
	nop
	add	%a2, %zero, %v0
	add	%t7, %zero, %ra

	nop
	nop
	nop
	blti	%a2, 60, bgti_else.35096

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.35096:
	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%a0, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35098

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%a1, %v0, 0
	jal	min_caml_read_int

	nop
	nop
	addi	%a3, %v0, 0
	jal	min_caml_read_int

	nop
	nop
	addi	%k0, %v0, 0
	addi	%s0, %zero, 3

	nop
	nop
	addi	%v0, %s0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s1, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s1)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s1)
	nop
	addi	%s4, %zero, 2
	jal	min_caml_read_float

	fsw	%f0, 2(%s1)
	nop
	addi	%v0, %s0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s2, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s2)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s2)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s2)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.35100

	nop
	nop
	add	%s3, %zero, %zero
	j	fbgt_cont.35101

fbgt_else.35100:
	nop
	nop
	add	%s3, %zero, %k1
	nop

fbgt_cont.35101:
	nop
	nop
	addi	%v0, %s4, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s4, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s4)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s4)
	nop
	addi	%v0, %s0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s5, %v0, 0
	jal	min_caml_read_float

	fsw	%f0, 0(%s5)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 1(%s5)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 2(%s5)
	nop
	addi	%v0, %s0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s0, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35102

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%s0)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%s0)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%s0)
	nop
	nop
	j	bnei_cont.35103

bnei_else.35102:
bnei_cont.35103:
	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.35104

	nop
	nop
	add	%s6, %zero, %s3
	j	bnei_cont.35105

bnei_else.35104:
	nop
	nop
	add	%s6, %zero, %k1
	nop

bnei_cont.35105:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 11

	sw	%v0, 10(%ra)
	nop
	nop
	nop

	sw	%s0, 9(%ra)
	nop
	nop
	nop

	sw	%s5, 8(%ra)
	nop
	nop
	nop

	sw	%s4, 7(%ra)
	nop
	nop
	nop

	sw	%s6, 6(%ra)
	nop
	nop
	nop

	sw	%s2, 5(%ra)
	nop
	nop
	nop

	sw	%s1, 4(%ra)
	nop
	nop
	nop

	sw	%k0, 3(%ra)
	nop
	nop
	nop

	sw	%a3, 2(%ra)
	nop
	nop
	nop

	sw	%a1, 1(%ra)
	nop
	nop
	nop

	sw	%a0, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 12(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.35106

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.35108

	nop
	nop
	nop
	j	bnei_cont.35107

bnei_else.35108:
	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.35110

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35111

bnei_else.35110:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.35111:
	flw	%f18, 0(%s1)
	flw	%f17, 1(%s1)
	nop
	nop

	flw	%f16, 2(%s1)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35112

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.35113

fbeq_else.35112:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.35113:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35114

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35115

bnei_else.35114:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35116

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35117

bnei_else.35116:

bnei_cont.35117:
bnei_cont.35115:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 0(%s1)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 1(%s1)
	nop
	nop
	nop

	fsw	%f0, 2(%s1)
	nop
	nop
	nop

bnei_cont.35109:
	nop
	nop
	nop
	j	bnei_cont.35107

bnei_else.35106:
	flw	%f1, 0(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35118

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35119

fbeq_else.35118:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35119:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35120

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35121

bnei_else.35120:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35122

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35123

fbeq_else.35122:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35123:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35124

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35125

bnei_else.35124:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.35126

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35127

fbgt_else.35126:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35127:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35128

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35129

bnei_else.35128:

bnei_cont.35129:
bnei_cont.35125:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.35121:
	fsw	%f0, 0(%s1)
	nop
	nop
	nop

	flw	%f1, 1(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35130

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35131

fbeq_else.35130:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35131:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35132

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35133

bnei_else.35132:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35134

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35135

fbeq_else.35134:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35135:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35136

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35137

bnei_else.35136:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.35138

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35139

fbgt_else.35138:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35139:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35140

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35141

bnei_else.35140:

bnei_cont.35141:
bnei_cont.35137:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.35133:
	fsw	%f0, 1(%s1)
	nop
	nop
	nop

	flw	%f1, 2(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35142

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35143

fbeq_else.35142:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35143:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35144

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35145

bnei_else.35144:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35146

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35147

fbeq_else.35146:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35147:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35148

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35149

bnei_else.35148:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.35150

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35151

fbgt_else.35150:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35151:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35152

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35153

bnei_else.35152:

bnei_cont.35153:
bnei_cont.35149:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.35145:
	fsw	%f0, 2(%s1)
	nop
	nop
	nop

bnei_cont.35107:
	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.35154

	nop
	nop
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	rotate_quadratic_matrix.2779

	nop
	nop
	nop
	j	bnei_cont.35155

bnei_else.35154:
bnei_cont.35155:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.35099

bnei_else.35098:

bnei_cont.35099:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35156

	nop
	nop
	addi	%t8, %a2, 1
	nop

	nop
	nop
	nop
	blti	%t8, 60, bgti_else.35157

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.35157:
	nop
	nop
	addi	%v0, %t8, 0
	jal	read_nth_object.2782

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35159

	nop
	nop
	addi	%v0, %t8, 1
	add	%ra, %zero, %t7

	nop
	nop
	nop
	j	read_object.2784

bnei_else.35159:
	sw	%t8, 0(%zero)
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35156:

	nop
	nop
	nop
	jr	%ra

read_net_item.2788:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%t6, 1(%sp)
	nop
	nop
	nop

	sw	%t5, 2(%sp)
	nop
	nop
	nop

	sw	%t4, 3(%sp)
	nop
	nop
	nop

	sw	%t3, 4(%sp)
	nop
	nop
	nop

	sw	%t2, 5(%sp)
	nop
	nop
	nop

	sw	%t1, 6(%sp)
	nop
	nop
	nop

	sw	%t0, 7(%sp)
	nop
	nop
	nop

	sw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 9
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -9
	addi	%t0, %v0, 0

	nop
	nop
	addi	%a0, %zero, -1
	nop

	nop
	nop
	nop
	beqi	%t0, -1, bnei_else.35232

	lw	%a1, 0(%sp)
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	addi	%t1, %a1, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -9
	addi	%t2, %v0, 0

	nop
	nop
	nop
	beqi	%t2, -1, bnei_else.35233

	nop
	nop
	addi	%t3, %t1, 1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -9
	addi	%t4, %v0, 0

	nop
	nop
	nop
	beqi	%t4, -1, bnei_else.35235

	nop
	nop
	addi	%t5, %t3, 1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -9
	addi	%t6, %v0, 0

	nop
	nop
	nop
	beqi	%t6, -1, bnei_else.35237

	nop
	nop
	addi	%v0, %t5, 1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	addi	%sp, %sp, -9
	add	%at, %v0, %t5

	sw	%t6, 0(%at)
	nop
	nop
	j	bnei_cont.35238

bnei_else.35237:
	nop
	nop
	addi	%v0, %t5, 1
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 9
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

bnei_cont.35238:
	nop
	nop
	add	%at, %v0, %t3
	nop

	sw	%t4, 0(%at)
	nop
	nop
	j	bnei_cont.35236

bnei_else.35235:
	nop
	nop
	addi	%v0, %t3, 1
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 9
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

bnei_cont.35236:
	nop
	nop
	add	%at, %v0, %t1
	nop

	sw	%t2, 0(%at)
	nop
	nop
	j	bnei_cont.35234

bnei_else.35233:
	nop
	nop
	addi	%v0, %t1, 1
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 9
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

bnei_cont.35234:
	lw	%a0, 0(%sp)
	lw	%t6, 1(%sp)
	nop
	nop

	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	add	%at, %v0, %a0
	nop

	sw	%t0, 0(%at)
	lw	%t3, 4(%sp)
	nop
	nop

	lw	%t2, 5(%sp)
	lw	%t1, 6(%sp)
	nop
	nop

	lw	%t0, 7(%sp)
	lw	%ra, 8(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35232:
	lw	%a1, 0(%sp)
	lw	%t6, 1(%sp)
	addi	%v1, %a0, 0
	nop

	lw	%t5, 2(%sp)
	lw	%t4, 3(%sp)
	addi	%v0, %a1, 1
	nop

	lw	%t3, 4(%sp)
	lw	%t2, 5(%sp)
	nop
	nop

	lw	%t1, 6(%sp)
	lw	%t0, 7(%sp)
	nop
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	j	min_caml_create_array

read_or_network.2790:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%t1, 1(%sp)
	nop
	nop
	nop

	sw	%t0, 2(%sp)
	nop
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0

	nop
	nop
	addi	%a3, %zero, -1
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.35314

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	addi	%k0, %v0, 0

	nop
	nop
	nop
	beqi	%k0, -1, bnei_else.35316

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0

	nop
	nop
	nop
	beqi	%s0, -1, bnei_else.35318

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

	sw	%s0, 2(%v1)
	nop
	nop
	j	bnei_cont.35319

bnei_else.35318:

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

bnei_cont.35319:
	sw	%k0, 1(%v1)
	nop
	nop
	j	bnei_cont.35317

bnei_else.35316:

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

bnei_cont.35317:
	sw	%a2, 0(%v1)
	nop
	nop
	j	bnei_cont.35315

bnei_else.35314:

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

bnei_cont.35315:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35320

	lw	%a0, 0(%sp)
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	addi	%t0, %a0, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a2, %v0, 0

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.35321

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -5
	addi	%k0, %v0, 0

	nop
	nop
	nop
	beqi	%k0, -1, bnei_else.35323

	nop
	nop
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0

	sw	%k0, 1(%t1)
	nop
	nop
	j	bnei_cont.35324

bnei_else.35323:

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0

bnei_cont.35324:

bnei_else.35321:
	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0

bnei_cont.35322:
	lw	%a0, 0(%t1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35325

	nop
	nop
	addi	%v0, %t0, 1
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	read_or_network.2790

	nop
	nop
	addi	%sp, %sp, -5
	add	%at, %v0, %t0

	sw	%t1, 0(%at)
	nop
	nop
	j	bnei_cont.35326

bnei_else.35325:
	nop
	nop
	addi	%v0, %t0, 1
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	nop

bnei_cont.35326:
	lw	%a1, 4(%sp)
	lw	%a0, 0(%sp)
	nop
	nop

	lw	%t1, 1(%sp)
	lw	%t0, 2(%sp)
	add	%at, %v0, %a0
	nop

	sw	%a1, 0(%at)
	lw	%ra, 3(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35320:

	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	addi	%v0, %a0, 1
	j	min_caml_create_array

read_and_network.2792:
	nop
	nop
	add	%a2, %zero, %v0
	add	%a3, %zero, %ra

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%k0, %v0, 0
	addi	%s0, %zero, -1

	nop
	nop
	nop
	beqi	%k0, -1, bnei_else.35379

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%s1, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%s1, -1, bnei_else.35381

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%s2, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%s2, -1, bnei_else.35383

	nop
	nop
	addi	%v0, %zero, 3
	jal	read_net_item.2788

	sw	%s2, 2(%v0)
	nop
	nop
	j	bnei_cont.35384

bnei_else.35383:

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.35384:
	sw	%s1, 1(%v0)
	nop
	nop
	j	bnei_cont.35382

bnei_else.35381:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.35382:
	sw	%k0, 0(%v0)
	nop
	nop
	j	bnei_cont.35380

bnei_else.35379:

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.35380:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35385

	sw	%v0, 83(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%s1, %a2, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%a2, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.35386

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%k0, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%k0, -1, bnei_else.35388

	nop
	nop
	addi	%v0, %zero, 2
	jal	read_net_item.2788

	sw	%k0, 1(%v0)
	nop
	nop
	j	bnei_cont.35389

bnei_else.35388:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.35389:
	sw	%a2, 0(%v0)
	nop
	nop
	j	bnei_cont.35387

bnei_else.35386:
	nop
	nop
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.35387:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35390

	sw	%v0, 83(%s1)
	nop
	nop
	nop

	nop
	nop
	addi	%k0, %s1, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%a2, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.35391

	nop
	nop
	addi	%v0, %k1, 0
	jal	read_net_item.2788

	sw	%a2, 0(%v0)
	nop
	nop
	j	bnei_cont.35392

bnei_else.35391:

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.35392:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35393

	sw	%v0, 83(%k0)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%a2, %k0, 1
	jal	read_net_item.2788

	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35394

	sw	%v0, 83(%a2)
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	addi	%v0, %a2, 1
	j	read_and_network.2792

bnei_else.35394:

	nop
	nop
	nop
	jr	%ra

bnei_else.35393:

	nop
	nop
	nop
	jr	%ra

bnei_else.35390:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35385:

	nop
	nop
	nop
	jr	%ra

iter_setup_dirvec_constants.2889:
	nop
	nop
	add	%a0, %zero, %v0
	add	%a1, %zero, %v1

	nop
	nop
	add	%a2, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.35581

	lw	%k0, 12(%a1)
	lw	%s0, 1(%a0)
	nop
	nop

	lw	%s1, 0(%a0)
	lw	%a3, 1(%k0)
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.35582

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.35584

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f19, 0(%s1)
	flw	%f2, 1(%s1)
	nop
	nop

	flw	%f24, 2(%s1)
	lw	%a3, 4(%k0)
	fmul	%f1, %f19, %f19
	nop

	flw	%f0, 0(%a3)
	lw	%a3, 4(%k0)
	nop
	nop

	flw	%f0, 1(%a3)
	lw	%a3, 4(%k0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f24, %f24

	flw	%f0, 2(%a3)
	lw	%a3, 3(%k0)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35586

	lw	%a3, 9(%k0)
	nop
	fmul	%f16, %f2, %f24
	nop

	flw	%f1, 0(%a3)
	lw	%a3, 9(%k0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a3)
	lw	%a3, 9(%k0)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f24, %f19

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f19, %f2

	flw	%f0, 2(%a3)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.35587

bnei_else.35586:
bnei_cont.35587:
	lw	%a3, 4(%k0)
	fsw	%f0, 0(%v0)
	nop
	nop

	flw	%f1, 0(%a3)
	lw	%a3, 4(%k0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	flw	%f1, 1(%a3)
	lw	%a3, 4(%k0)
	fneg	%f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	flw	%f1, 2(%a3)
	lw	%a3, 3(%k0)
	fneg	%f21, %f1
	nop

	nop
	nop
	fmul	%f1, %f24, %f1
	nop

	nop
	nop
	fneg	%f20, %f1
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35588

	lw	%a3, 9(%k0)
	flw	%f23, 473(%zero)
	nop
	nop

	flw	%f22, 1(%a3)
	lw	%a3, 9(%k0)
	nop
	nop

	flw	%f18, 2(%a3)
	lw	%a3, 9(%k0)
	fmul	%f16, %f24, %f22
	nop

	nop
	nop
	fmul	%f1, %f2, %f18
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	flw	%f17, 0(%a3)
	nop
	fsub	%f1, %f17, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f16, %f24, %f17
	fmul	%f1, %f19, %f18

	nop
	nop
	fadd	%f1, %f16, %f1
	fmul	%f16, %f2, %f17

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fsub	%f1, %f21, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f19, %f22
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f23
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.35589

bnei_else.35588:
	fsw	%f17, 1(%v0)
	nop
	nop
	nop

	fsw	%f21, 2(%v0)
	nop
	nop
	nop

	fsw	%f20, 3(%v0)
	nop
	nop
	nop

bnei_cont.35589:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35590

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.35591

fbeq_else.35590:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.35591:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35592

	nop
	nop
	nop
	j	bnei_cont.35593

bnei_else.35592:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.35593:
	nop
	nop
	add	%at, %s0, %a1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.35583

bnei_else.35584:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%s1)
	lw	%a3, 4(%k0)
	nop
	nop

	flw	%f18, 0(%a3)
	lw	%a3, 4(%k0)
	nop
	nop

	flw	%f0, 1(%s1)
	flw	%f17, 1(%a3)
	fmul	%f1, %f0, %f18
	nop

	lw	%a3, 4(%k0)
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 2(%s1)
	flw	%f16, 2(%a3)
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.35594

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.35595

fbgt_else.35594:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.35595:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35596

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f18, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f17, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f16, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.35597

bnei_else.35596:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.35597:
	nop
	nop
	add	%at, %s0, %a1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.35585:
	nop
	nop
	nop
	j	bnei_cont.35583

bnei_else.35582:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35598

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.35599

fbeq_else.35598:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.35599:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35600

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.35601

bnei_else.35600:
	lw	%ra, 6(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35602

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.35603

fbgt_else.35602:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.35603:
	nop
	nop
	nop
	beqi	%ra, 0, bnei_else.35604

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35606

	nop
	nop
	add	%a3, %zero, %zero
	j	bnei_cont.35605

bnei_else.35606:

bnei_cont.35607:

bnei_else.35604:
bnei_cont.35605:
	lw	%ra, 4(%k0)
	nop
	nop
	nop

	flw	%f0, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35608

	nop
	nop
	nop
	j	bnei_cont.35609

bnei_else.35608:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35609:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.35601:
	flw	%f1, 1(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35610

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.35611

fbeq_else.35610:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.35611:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35612

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.35613

bnei_else.35612:
	lw	%ra, 6(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35614

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.35615

fbgt_else.35614:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.35615:
	nop
	nop
	nop
	beqi	%ra, 0, bnei_else.35616

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35618

	nop
	nop
	add	%a3, %zero, %zero
	j	bnei_cont.35617

bnei_else.35618:

bnei_cont.35619:

bnei_else.35616:
bnei_cont.35617:
	lw	%ra, 4(%k0)
	nop
	nop
	nop

	flw	%f0, 1(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35620

	nop
	nop
	nop
	j	bnei_cont.35621

bnei_else.35620:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35621:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.35613:
	flw	%f1, 2(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35622

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.35623

fbeq_else.35622:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.35623:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35624

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.35625

bnei_else.35624:
	lw	%ra, 6(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35626

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.35627

fbgt_else.35626:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.35627:
	nop
	nop
	nop
	beqi	%ra, 0, bnei_else.35628

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35630

	nop
	nop
	add	%a3, %zero, %zero
	j	bnei_cont.35629

bnei_else.35630:

bnei_cont.35631:

bnei_else.35628:
bnei_cont.35629:
	lw	%k0, 4(%k0)
	nop
	nop
	nop

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35632

	nop
	nop
	nop
	j	bnei_cont.35633

bnei_else.35632:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35633:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.35625:
	nop
	nop
	add	%at, %s0, %a1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.35583:
	nop
	nop
	addi	%a3, %a1, -1
	nop

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.35634

	lw	%k0, 12(%a3)
	lw	%s0, 1(%a0)
	nop
	nop

	lw	%s1, 0(%a0)
	lw	%a1, 1(%k0)
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.35635

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.35637

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f18, 0(%s1)
	flw	%f19, 1(%s1)
	nop
	nop

	flw	%f21, 2(%s1)
	lw	%a1, 4(%k0)
	fmul	%f1, %f18, %f18
	nop

	flw	%f0, 0(%a1)
	lw	%a1, 4(%k0)
	nop
	nop

	flw	%f0, 1(%a1)
	lw	%a1, 4(%k0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f19, %f19

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f21, %f21

	flw	%f0, 2(%a1)
	lw	%a1, 3(%k0)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35639

	lw	%a1, 9(%k0)
	nop
	fmul	%f16, %f19, %f21
	nop

	flw	%f1, 0(%a1)
	lw	%a1, 9(%k0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a1)
	lw	%a1, 9(%k0)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f18

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f18, %f19

	flw	%f0, 2(%a1)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.35640

bnei_else.35639:
bnei_cont.35640:
	lw	%a1, 4(%k0)
	fsw	%f0, 0(%v0)
	nop
	nop

	flw	%f1, 0(%a1)
	lw	%a1, 4(%k0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	flw	%f1, 1(%a1)
	lw	%a1, 4(%k0)
	fneg	%f22, %f1
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	flw	%f1, 2(%a1)
	lw	%a1, 3(%k0)
	fneg	%f20, %f1
	nop

	nop
	nop
	fmul	%f1, %f21, %f1
	nop

	nop
	nop
	fneg	%f17, %f1
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35641

	lw	%a1, 9(%k0)
	flw	%f2, 473(%zero)
	nop
	nop

	flw	%f1, 1(%a1)
	lw	%a1, 9(%k0)
	nop
	nop

	flw	%f1, 2(%a1)
	lw	%a1, 9(%k0)
	fmul	%f16, %f21, %f1
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f22, %f1
	nop

	fsw	%f1, 1(%v0)
	flw	%f1, 0(%a1)
	nop
	nop

	lw	%a1, 9(%k0)
	nop
	fmul	%f16, %f21, %f1
	nop

	flw	%f1, 2(%a1)
	lw	%a1, 9(%k0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 2(%v0)
	flw	%f1, 0(%a1)
	nop
	nop

	lw	%a1, 9(%k0)
	nop
	fmul	%f16, %f19, %f1
	nop

	flw	%f1, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f17, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.35642

bnei_else.35641:
	fsw	%f22, 1(%v0)
	nop
	nop
	nop

	fsw	%f20, 2(%v0)
	nop
	nop
	nop

	fsw	%f17, 3(%v0)
	nop
	nop
	nop

bnei_cont.35642:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35643

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.35644

fbeq_else.35643:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.35644:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35645

	nop
	nop
	nop
	j	bnei_cont.35646

bnei_else.35645:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.35646:
	nop
	nop
	add	%at, %s0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.35636

bnei_else.35637:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%s1)
	lw	%a1, 4(%k0)
	nop
	nop

	flw	%f0, 0(%a1)
	lw	%a1, 4(%k0)
	nop
	nop

	flw	%f1, 1(%s1)
	flw	%f0, 1(%a1)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%s1)
	lw	%a1, 4(%k0)
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.35647

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.35648

fbgt_else.35647:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.35648:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35649

	flw	%f0, 468(%zero)
	lw	%a1, 4(%k0)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	flw	%f0, 0(%a1)
	nop
	nop

	lw	%a1, 4(%k0)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	flw	%f0, 1(%a1)
	nop
	nop

	lw	%a1, 4(%k0)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	flw	%f0, 2(%a1)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.35650

bnei_else.35649:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.35650:
	nop
	nop
	add	%at, %s0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.35638:
	nop
	nop
	nop
	j	bnei_cont.35636

bnei_else.35635:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35651

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.35652

fbeq_else.35651:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.35652:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35653

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.35654

bnei_else.35653:
	lw	%ra, 6(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35655

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.35656

fbgt_else.35655:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.35656:
	nop
	nop
	nop
	beqi	%ra, 0, bnei_else.35657

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35659

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.35658

bnei_else.35659:

bnei_cont.35660:

bnei_else.35657:
bnei_cont.35658:
	lw	%ra, 4(%k0)
	nop
	nop
	nop

	flw	%f0, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35661

	nop
	nop
	nop
	j	bnei_cont.35662

bnei_else.35661:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35662:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.35654:
	flw	%f1, 1(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35663

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.35664

fbeq_else.35663:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.35664:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35665

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.35666

bnei_else.35665:
	lw	%ra, 6(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35667

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.35668

fbgt_else.35667:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.35668:
	nop
	nop
	nop
	beqi	%ra, 0, bnei_else.35669

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35671

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.35670

bnei_else.35671:

bnei_cont.35672:

bnei_else.35669:
bnei_cont.35670:
	lw	%ra, 4(%k0)
	nop
	nop
	nop

	flw	%f0, 1(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35673

	nop
	nop
	nop
	j	bnei_cont.35674

bnei_else.35673:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35674:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.35666:
	flw	%f1, 2(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35675

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.35676

fbeq_else.35675:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.35676:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35677

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.35678

bnei_else.35677:
	lw	%ra, 6(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35679

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.35680

fbgt_else.35679:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.35680:
	nop
	nop
	nop
	beqi	%ra, 0, bnei_else.35681

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35683

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.35682

bnei_else.35683:

bnei_cont.35684:

bnei_else.35681:
bnei_cont.35682:
	lw	%k0, 4(%k0)
	nop
	nop
	nop

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35685

	nop
	nop
	nop
	j	bnei_cont.35686

bnei_else.35685:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35686:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.35678:
	nop
	nop
	add	%at, %s0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.35636:
	nop
	nop
	addi	%v1, %a3, -1
	add	%ra, %zero, %a2

	nop
	nop
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2889

bgti_else.35634:
	nop
	nop
	add	%ra, %zero, %a2
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.35581:
	nop
	nop
	add	%ra, %zero, %a2
	nop

	nop
	nop
	nop
	jr	%ra

setup_dirvec_constants.2892:
	lw	%a2, 0(%zero)
	nop
	add	%a0, %zero, %v0
	add	%a1, %zero, %ra

	nop
	nop
	addi	%a3, %a2, -1
	nop

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.35789

	lw	%k0, 12(%a3)
	lw	%s0, 1(%a0)
	nop
	nop

	lw	%s1, 0(%a0)
	lw	%a2, 1(%k0)
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.35790

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.35792

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f18, 0(%s1)
	flw	%f19, 1(%s1)
	nop
	nop

	flw	%f21, 2(%s1)
	lw	%a2, 4(%k0)
	fmul	%f1, %f18, %f18
	nop

	flw	%f0, 0(%a2)
	lw	%a2, 4(%k0)
	nop
	nop

	flw	%f0, 1(%a2)
	lw	%a2, 4(%k0)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f19, %f19

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f21, %f21

	flw	%f0, 2(%a2)
	lw	%a2, 3(%k0)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35794

	lw	%a2, 9(%k0)
	nop
	fmul	%f16, %f19, %f21
	nop

	flw	%f1, 0(%a2)
	lw	%a2, 9(%k0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a2)
	lw	%a2, 9(%k0)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f18

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f18, %f19

	flw	%f0, 2(%a2)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.35795

bnei_else.35794:
bnei_cont.35795:

	flw	%f1, 0(%a2)
	lw	%a2, 4(%k0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	flw	%f1, 1(%a2)
	lw	%a2, 4(%k0)
	fneg	%f22, %f1
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	flw	%f1, 2(%a2)
	lw	%a2, 3(%k0)
	fneg	%f20, %f1
	nop

	nop
	nop
	fmul	%f1, %f21, %f1
	nop

	nop
	nop
	fneg	%f17, %f1
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35796

	lw	%a2, 9(%k0)
	flw	%f2, 473(%zero)
	nop
	nop

	flw	%f1, 1(%a2)
	lw	%a2, 9(%k0)
	nop
	nop

	flw	%f1, 2(%a2)
	lw	%a2, 9(%k0)
	fmul	%f16, %f21, %f1
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f22, %f1
	nop

	fsw	%f1, 1(%v0)
	flw	%f1, 0(%a2)
	nop
	nop

	lw	%a2, 9(%k0)
	nop
	fmul	%f16, %f21, %f1
	nop

	flw	%f1, 2(%a2)
	lw	%a2, 9(%k0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 2(%v0)
	flw	%f1, 0(%a2)
	nop
	nop

	lw	%a2, 9(%k0)
	nop
	fmul	%f16, %f19, %f1
	nop

	flw	%f1, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f17, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.35797

bnei_else.35796:

	fsw	%f20, 2(%v0)
	nop
	nop
	nop

	fsw	%f17, 3(%v0)
	nop
	nop
	nop

bnei_cont.35797:

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.35799

fbeq_else.35798:

fbeq_cont.35799:

	nop
	nop
	nop
	j	bnei_cont.35801

bnei_else.35800:

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.35801:

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.35791

bnei_else.35792:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%s1)
	lw	%a2, 4(%k0)
	nop
	nop

	flw	%f0, 0(%a2)
	lw	%a2, 4(%k0)
	nop
	nop

	flw	%f1, 1(%s1)
	flw	%f0, 1(%a2)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%s1)
	lw	%a2, 4(%k0)
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a2)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.35802

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.35803

fbgt_else.35802:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.35803:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35804

	flw	%f0, 468(%zero)
	lw	%a2, 4(%k0)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	flw	%f0, 0(%a2)
	nop
	nop

	lw	%a2, 4(%k0)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	flw	%f0, 1(%a2)
	nop
	nop

	lw	%a2, 4(%k0)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	flw	%f0, 2(%a2)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.35805

bnei_else.35804:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.35805:
	nop
	nop
	add	%at, %s0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.35793:
	nop
	nop
	nop
	j	bnei_cont.35791

bnei_else.35790:

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35806

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.35807

fbeq_else.35806:

fbeq_cont.35807:

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.35809

bnei_else.35808:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35810

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.35811

fbgt_else.35810:

fbgt_cont.35811:

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35814

	nop
	nop
	add	%a2, %zero, %zero
	j	bnei_cont.35813

bnei_else.35814:

bnei_cont.35815:

bnei_else.35812:
bnei_cont.35813:

	flw	%f0, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35816

	nop
	nop
	nop
	j	bnei_cont.35817

bnei_else.35816:

bnei_cont.35817:

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.35809:

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35818

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.35819

fbeq_else.35818:

fbeq_cont.35819:

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.35821

bnei_else.35820:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35822

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.35823

fbgt_else.35822:

fbgt_cont.35823:

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35826

	nop
	nop
	add	%a2, %zero, %zero
	j	bnei_cont.35825

bnei_else.35826:

bnei_cont.35827:

bnei_else.35824:
bnei_cont.35825:

	flw	%f0, 1(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35828

	nop
	nop
	nop
	j	bnei_cont.35829

bnei_else.35828:

bnei_cont.35829:

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.35821:

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.35830

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.35831

fbeq_else.35830:

fbeq_cont.35831:

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.35833

bnei_else.35832:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35834

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.35835

fbgt_else.35834:

fbgt_cont.35835:

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35838

	nop
	nop
	add	%a2, %zero, %zero
	j	bnei_cont.35837

bnei_else.35838:

bnei_cont.35839:

bnei_else.35836:
bnei_cont.35837:

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35840

	nop
	nop
	nop
	j	bnei_cont.35841

bnei_else.35840:

bnei_cont.35841:

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.35833:

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.35791:
	nop
	nop
	addi	%v1, %a3, -1
	add	%ra, %zero, %a1

	nop
	nop
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2889

bgti_else.35789:

	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2894:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.35877

	lw	%a2, 12(%v1)
	flw	%f1, 0(%v0)
	nop
	nop

	lw	%a3, 10(%a2)
	lw	%a1, 1(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%a2)
	nop
	nop

	flw	%f1, 1(%v0)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 0(%a3)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 2(%v0)
	lw	%a0, 5(%a2)
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 1(%a3)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.35878

	nop
	nop
	addi	%at, %zero, 2
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.35880

	nop
	nop
	nop
	j	bnei_cont.35879

bgt_else.35880:
	flw	%f17, 0(%a3)
	flw	%f18, 1(%a3)
	nop
	nop

	flw	%f19, 2(%a3)
	lw	%a0, 4(%a2)
	fmul	%f1, %f17, %f17
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a2)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%a2)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f18, %f18

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f19, %f19

	flw	%f0, 2(%a0)
	lw	%a0, 3(%a2)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35882

	lw	%a0, 9(%a2)
	nop
	fmul	%f16, %f18, %f19
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 9(%a2)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%a2)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f19, %f17

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f17, %f18

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.35883

bnei_else.35882:
bnei_cont.35883:
	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.35884

	nop
	nop
	nop
	j	bnei_cont.35885

bnei_else.35884:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.35885:
	fsw	%f0, 3(%a3)
	nop
	nop
	nop

bgt_cont.35881:
	nop
	nop
	nop
	j	bnei_cont.35879

bnei_else.35878:
	lw	%a0, 4(%a2)
	flw	%f1, 0(%a3)
	nop
	nop

	flw	%f17, 1(%a3)
	flw	%f16, 2(%a3)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 3(%a3)
	nop
	nop
	nop

bnei_cont.35879:
	nop
	nop
	addi	%v1, %v1, -1
	j	setup_startp_constants.2894

bgti_else.35877:
	nop
	nop
	nop
	jr	%ra

check_all_inside.2919:
	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36031

	lw	%a1, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 5(%a1)
	nop
	nop
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 5(%a1)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 5(%a1)
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	lw	%a0, 1(%a1)
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.36032

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.36034

	lw	%a0, 4(%a1)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%a0)
	lw	%a0, 3(%a1)
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36036

	lw	%a0, 9(%a1)
	nop
	fmul	%f18, %f20, %f21
	nop

	flw	%f17, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.36037

bnei_else.36036:
bnei_cont.36037:
	lw	%a0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.36038

	nop
	nop
	nop
	j	bnei_cont.36039

bnei_else.36038:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.36039:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.36040

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36041

fbgt_else.36040:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36041:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36042

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36044

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36043

bnei_else.36044:

bnei_cont.36045:

bnei_else.36042:
bnei_cont.36043:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36046

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36033

bnei_else.36046:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36047:
	nop
	nop
	nop
	j	bnei_cont.36033

bnei_else.36034:

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%a0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.36048

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36049

fbgt_else.36048:

fbgt_cont.36049:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36052

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36051

bnei_else.36052:

bnei_cont.36053:

bnei_else.36050:
bnei_cont.36051:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36033

bnei_else.36054:

bnei_cont.36055:
bnei_cont.36035:

bnei_else.36032:

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.36056

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36057

fbgt_else.36056:

fbgt_cont.36057:

	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f20
	nop

	flw	%f16, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.36060

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36061

fbgt_else.36060:

fbgt_cont.36061:

	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f21
	nop

	flw	%f16, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.36064

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36059

fbgt_else.36064:

fbgt_cont.36065:

bnei_else.36062:

bnei_cont.36063:

bnei_else.36058:

bnei_cont.36059:

	lw	%a0, 6(%a1)
	nop
	nop
	j	bnei_cont.36067

bnei_else.36066:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36068

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36069

bnei_else.36068:

bnei_cont.36069:
bnei_cont.36067:
bnei_cont.36033:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36070

	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.36070:
	nop
	nop
	addi	%a1, %v0, 1
	nop

	nop
	nop
	add	%at, %v1, %a1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36071

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 5(%a2)
	nop
	nop
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 5(%a2)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 5(%a2)
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	lw	%a0, 1(%a2)
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.36072

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.36074

	lw	%a0, 4(%a2)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 4(%a2)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 4(%a2)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%a0)
	lw	%a0, 3(%a2)
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36076

	lw	%a0, 9(%a2)
	nop
	fmul	%f18, %f20, %f21
	nop

	flw	%f17, 0(%a0)
	lw	%a0, 9(%a2)
	nop
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a2)
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.36077

bnei_else.36076:
bnei_cont.36077:
	lw	%a0, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.36078

	nop
	nop
	nop
	j	bnei_cont.36079

bnei_else.36078:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.36079:
	lw	%a2, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.36080

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36081

fbgt_else.36080:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36081:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36082

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36084

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36083

bnei_else.36084:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36085:
	nop
	nop
	nop
	j	bnei_cont.36083

bnei_else.36082:
bnei_cont.36083:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36086

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36073

bnei_else.36086:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36087:
	nop
	nop
	nop
	j	bnei_cont.36073

bnei_else.36074:
	lw	%a0, 4(%a2)
	lw	%a2, 6(%a2)
	nop
	nop

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%a0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.36088

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36089

fbgt_else.36088:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36089:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36090

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36092

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36091

bnei_else.36092:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36093:
	nop
	nop
	nop
	j	bnei_cont.36091

bnei_else.36090:
bnei_cont.36091:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36094

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36073

bnei_else.36094:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36095:
bnei_cont.36075:
	nop
	nop
	nop
	j	bnei_cont.36073

bnei_else.36072:

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.36096

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36097

fbgt_else.36096:

fbgt_cont.36097:

	lw	%a0, 4(%a2)
	nop
	fabs	%f17, %f20
	nop

	flw	%f16, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.36100

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36101

fbgt_else.36100:

fbgt_cont.36101:

	lw	%a0, 4(%a2)
	nop
	fabs	%f17, %f21
	nop

	flw	%f16, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.36104

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36099

fbgt_else.36104:

fbgt_cont.36105:

bnei_else.36102:

bnei_cont.36103:

bnei_else.36098:

bnei_cont.36099:

	lw	%a0, 6(%a2)
	nop
	nop
	j	bnei_cont.36107

bnei_else.36106:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36108

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36109

bnei_else.36108:

bnei_cont.36109:
bnei_cont.36107:
bnei_cont.36073:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36110

	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.36110:
	nop
	nop
	addi	%a0, %a1, 1
	nop

	nop
	nop
	addi	%v0, %a0, 0
	j	check_all_inside.2919

bnei_else.36071:
	nop
	nop
	add	%v0, %zero, %k1
	jr	%ra

bnei_else.36031:
	nop
	nop
	add	%v0, %zero, %k1
	jr	%ra

shadow_check_and_group.2925:
	nop
	nop
	add	%a3, %zero, %v0
	add	%k0, %zero, %ra

	nop
	nop
	add	%at, %v1, %a3
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.36306

	lw	%a1, 12(%a2)
	flw	%f19, 138(%zero)
	nop
	nop

	lw	%a0, 5(%a1)
	flw	%f16, 139(%zero)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%a1)
	nop
	nop

	flw	%f0, 1(%a0)
	flw	%f18, 140(%zero)
	fsub	%f21, %f19, %f0
	nop

	lw	%a0, 5(%a1)
	lw	%a2, 187(%a2)
	fsub	%f22, %f16, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 1(%a1)
	nop
	nop

	nop
	nop
	fsub	%f23, %f18, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.36307

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.36309

	flw	%f20, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f20, %fzero, fbeq_else.36311

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36312

fbeq_else.36311:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36312:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36313

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36308

bnei_else.36313:
	flw	%f0, 1(%a2)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f0, 2(%a2)
	nop
	fmul	%f1, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	flw	%f0, 3(%a2)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a1)
	fadd	%f2, %f1, %f0
	fmul	%f1, %f21, %f21

	flw	%f0, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f17, %f1, %f0
	fmul	%f1, %f22, %f22

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f23, %f23

	flw	%f0, 2(%a0)
	lw	%a0, 3(%a1)
	fadd	%f17, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36315

	lw	%a0, 9(%a1)
	nop
	fmul	%f17, %f22, %f23
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f17, %f1
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f17, %f0, %f1
	fmul	%f1, %f23, %f21

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f21, %f22

	flw	%f0, 2(%a0)
	nop
	fadd	%f17, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	j	bnei_cont.36316

bnei_else.36315:
bnei_cont.36316:
	lw	%a0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.36317

	nop
	nop
	nop
	j	bnei_cont.36318

bnei_else.36317:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.36318:
	nop
	nop
	fmul	%f1, %f2, %f2
	fmul	%f0, %f20, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.36319

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36320

fbgt_else.36319:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36320:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36321

	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36323

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%a2)
	nop
	fadd	%f1, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.36324

bnei_else.36323:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%a2)
	nop
	fsub	%f1, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.36324:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36308

bnei_else.36321:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36322:
bnei_cont.36314:
	nop
	nop
	nop
	j	bnei_cont.36308

bnei_else.36309:
	flw	%f0, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.36325

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36326

fbgt_else.36325:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36326:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36327

	flw	%f0, 1(%a2)
	nop
	nop
	nop

	flw	%f0, 2(%a2)
	nop
	fmul	%f1, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	flw	%f0, 3(%a2)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36308

bnei_else.36327:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36328:
bnei_cont.36310:
	nop
	nop
	nop
	j	bnei_cont.36308

bnei_else.36307:
	flw	%f0, 0(%a2)
	flw	%f20, 1(%a2)
	nop
	nop

	flw	%f17, 185(%zero)
	lw	%a0, 4(%a1)
	fsub	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f2, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f2, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f22
	nop

	flw	%f0, 1(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36329

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36330

fbgt_else.36329:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36330:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36331

	flw	%f0, 186(%zero)
	lw	%a0, 4(%a1)
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f23
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36333

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36334

fbgt_else.36333:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36334:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36335

	nop
	nop
	nop
	fbne	%f20, %fzero, fbeq_else.36337

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36338

fbeq_else.36337:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36338:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36339

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36332

bnei_else.36339:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36340:
	nop
	nop
	nop
	j	bnei_cont.36332

bnei_else.36335:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36336:
	nop
	nop
	nop
	j	bnei_cont.36332

bnei_else.36331:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36332:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36341

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36342

bnei_else.36341:
	flw	%f0, 2(%a2)
	flw	%f24, 3(%a2)
	nop
	nop

	flw	%f20, 184(%zero)
	lw	%a0, 4(%a1)
	fsub	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f2, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f2, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f21
	nop

	flw	%f0, 0(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36343

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36344

fbgt_else.36343:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36344:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36345

	flw	%f0, 186(%zero)
	lw	%a0, 4(%a1)
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f23
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36347

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36348

fbgt_else.36347:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36348:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36349

	nop
	nop
	nop
	fbne	%f24, %fzero, fbeq_else.36351

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36352

fbeq_else.36351:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36352:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36353

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36346

bnei_else.36353:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36354:
	nop
	nop
	nop
	j	bnei_cont.36346

bnei_else.36349:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36350:
	nop
	nop
	nop
	j	bnei_cont.36346

bnei_else.36345:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36346:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36355

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.36356

bnei_else.36355:
	flw	%f0, 4(%a2)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f23, 5(%a2)
	nop
	fsub	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f2, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f2, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f21
	nop

	flw	%f0, 0(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36357

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36358

fbgt_else.36357:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36358:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36359

	lw	%a0, 4(%a1)
	nop
	fmul	%f0, %f2, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f22
	nop

	flw	%f0, 1(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36361

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36362

fbgt_else.36361:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36362:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36363

	nop
	nop
	nop
	fbne	%f23, %fzero, fbeq_else.36365

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36366

fbeq_else.36365:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36366:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36367

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36360

bnei_else.36367:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36368:
	nop
	nop
	nop
	j	bnei_cont.36360

bnei_else.36363:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36364:
	nop
	nop
	nop
	j	bnei_cont.36360

bnei_else.36359:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36360:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36369

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.36370

bnei_else.36369:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36370:
bnei_cont.36356:
bnei_cont.36342:
bnei_cont.36308:
	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36371

	flw	%f0, 467(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36373

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36372

fbgt_else.36373:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36374:
	nop
	nop
	nop
	j	bnei_cont.36372

bnei_else.36371:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36372:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36375

	flw	%f0, 466(%zero)
	lw	%a0, 0(%v1)
	nop
	nop

	flw	%f0, 78(%zero)
	flw	%f1, 79(%zero)
	fadd	%f17, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	fmul	%f1, %f1, %f17

	flw	%f16, 80(%zero)
	nop
	fadd	%f0, %f0, %f19
	fadd	%f1, %f1, %f16

	nop
	nop
	fmul	%f16, %f16, %f17
	nop

	nop
	nop
	fadd	%f2, %f16, %f18
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36376

	lw	%a1, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 5(%a1)
	nop
	nop
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 5(%a1)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 5(%a1)
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	lw	%a0, 1(%a1)
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.36378

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.36380

	lw	%a0, 4(%a1)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%a0)
	lw	%a0, 3(%a1)
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36382

	lw	%a0, 9(%a1)
	nop
	fmul	%f18, %f20, %f21
	nop

	flw	%f17, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.36383

bnei_else.36382:
bnei_cont.36383:
	lw	%a0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.36384

	nop
	nop
	nop
	j	bnei_cont.36385

bnei_else.36384:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.36385:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.36386

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36387

fbgt_else.36386:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36387:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36388

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36390

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36389

bnei_else.36390:

bnei_cont.36391:

bnei_else.36388:
bnei_cont.36389:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36392

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36379

bnei_else.36392:

bnei_cont.36393:

bnei_else.36380:

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%a0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.36394

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36395

fbgt_else.36394:

fbgt_cont.36395:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36398

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36397

bnei_else.36398:

bnei_cont.36399:

bnei_else.36396:
bnei_cont.36397:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36379

bnei_else.36400:

bnei_cont.36401:
bnei_cont.36381:

bnei_else.36378:
	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f19
	nop

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.36402

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36403

fbgt_else.36402:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36403:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36404

	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f20
	nop

	flw	%f16, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.36406

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36407

fbgt_else.36406:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36407:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36408

	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f21
	nop

	flw	%f16, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.36410

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36405

fbgt_else.36410:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36411:
	nop
	nop
	nop
	j	bnei_cont.36405

bnei_else.36408:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36409:
	nop
	nop
	nop
	j	bnei_cont.36405

bnei_else.36404:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36405:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36412

	lw	%a0, 6(%a1)
	nop
	nop
	j	bnei_cont.36413

bnei_else.36412:
	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36414

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36415

bnei_else.36414:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36415:
bnei_cont.36413:
bnei_cont.36379:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36416

	nop
	nop
	add	%v0, %zero, %zero
	j	bnei_cont.36377

bnei_else.36416:
	nop
	nop
	addi	%v0, %k1, 0
	jal	check_all_inside.2919

bnei_cont.36417:
	nop
	nop
	nop
	j	bnei_cont.36377

bnei_else.36376:

bnei_cont.36377:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36418

	nop
	nop
	add	%ra, %zero, %k0
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.36418:
	nop
	nop
	addi	%v0, %a3, 1
	add	%ra, %zero, %k0

	nop
	nop
	nop
	j	shadow_check_and_group.2925

bnei_else.36375:
	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36419

	nop
	nop
	addi	%v0, %a3, 1
	add	%ra, %zero, %k0

	nop
	nop
	nop
	j	shadow_check_and_group.2925

bnei_else.36419:
	nop
	nop
	add	%ra, %zero, %k0
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.36306:
	nop
	nop
	add	%ra, %zero, %k0
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_group.2928:
	nop
	nop
	add	%s0, %zero, %v0
	add	%s1, %zero, %v1

	nop
	nop
	add	%s2, %zero, %ra
	add	%at, %s1, %s0

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36462

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36463

	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.36463:
	nop
	nop
	addi	%s0, %s0, 1
	nop

	nop
	nop
	add	%at, %s1, %s0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36464

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36465

	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.36465:
	nop
	nop
	addi	%s0, %s0, 1
	nop

	nop
	nop
	add	%at, %s1, %s0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36466

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36467

	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.36467:
	nop
	nop
	addi	%s0, %s0, 1
	nop

	nop
	nop
	add	%at, %s1, %s0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36468

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36469

	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.36469:

	nop
	nop
	addi	%v1, %s1, 0
	j	shadow_check_one_or_group.2928

bnei_else.36468:
	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.36466:

	nop
	nop
	nop
	jr	%ra

bnei_else.36464:
	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.36462:

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_matrix.2931:
	nop
	nop
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1

	nop
	nop
	add	%s5, %zero, %ra
	add	%at, %s4, %s3

	lw	%s6, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.36644

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.36645

	lw	%a2, 12(%a1)
	flw	%f1, 138(%zero)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%a1, 187(%a1)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%a2)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	lw	%a0, 5(%a2)
	fsub	%f2, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 1(%a2)
	nop
	nop

	nop
	nop
	fsub	%f20, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.36647

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.36649

	flw	%f18, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.36651

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36652

fbeq_else.36651:

fbeq_cont.36652:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36648

bnei_else.36653:

	flw	%f0, 2(%a1)
	nop
	fmul	%f1, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 3(%a1)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a2)
	fadd	%f17, %f1, %f0
	fmul	%f1, %f19, %f19

	flw	%f0, 1(%a0)
	lw	%a0, 4(%a2)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f20

	flw	%f0, 2(%a0)
	lw	%a0, 3(%a2)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36655

	lw	%a0, 9(%a2)
	nop
	fmul	%f16, %f2, %f20
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 9(%a2)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%a2)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f20, %f19

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f19, %f2

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.36656

bnei_else.36655:
bnei_cont.36656:

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.36657

	nop
	nop
	nop
	j	bnei_cont.36658

bnei_else.36657:

bnei_cont.36658:

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.36659

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36660

fbgt_else.36659:

fbgt_cont.36660:

	lw	%a0, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36663

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%a1)
	nop
	fadd	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.36664

bnei_else.36663:

	flw	%f0, 4(%a1)
	nop
	fsub	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.36664:

bnei_else.36661:

bnei_cont.36662:
bnei_cont.36654:

bnei_else.36649:

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.36665

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36666

fbgt_else.36665:

fbgt_cont.36666:

	flw	%f0, 1(%a1)
	nop
	nop
	nop

	flw	%f0, 2(%a1)
	nop
	fmul	%f1, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 3(%a1)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36648

bnei_else.36667:

bnei_cont.36668:
bnei_cont.36650:

bnei_else.36647:
	flw	%f0, 0(%a1)
	flw	%f18, 1(%a1)
	nop
	nop

	flw	%f16, 185(%zero)
	lw	%a0, 4(%a2)
	fsub	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f17, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36669

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36670

fbgt_else.36669:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36670:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36671

	flw	%f0, 186(%zero)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36673

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36674

fbgt_else.36673:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36674:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36675

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.36677

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36678

fbeq_else.36677:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36678:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36679

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36672

bnei_else.36679:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36680:
	nop
	nop
	nop
	j	bnei_cont.36672

bnei_else.36675:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36676:
	nop
	nop
	nop
	j	bnei_cont.36672

bnei_else.36671:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36672:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36681

	fsw	%f17, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36682

bnei_else.36681:
	flw	%f0, 2(%a1)
	flw	%f18, 3(%a1)
	nop
	nop

	flw	%f21, 184(%zero)
	lw	%a0, 4(%a2)
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f17, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36683

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36684

fbgt_else.36683:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36684:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36685

	flw	%f0, 186(%zero)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36687

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36688

fbgt_else.36687:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36688:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36689

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.36691

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36692

fbeq_else.36691:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36692:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36693

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36686

bnei_else.36693:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36694:
	nop
	nop
	nop
	j	bnei_cont.36686

bnei_else.36689:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36690:
	nop
	nop
	nop
	j	bnei_cont.36686

bnei_else.36685:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36686:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36695

	fsw	%f17, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.36696

bnei_else.36695:
	flw	%f0, 4(%a1)
	flw	%f18, 5(%a1)
	nop
	nop

	lw	%a0, 4(%a2)
	nop
	fsub	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f17, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36697

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36698

fbgt_else.36697:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36698:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36699

	lw	%a0, 4(%a2)
	nop
	fmul	%f0, %f17, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36701

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36702

fbgt_else.36701:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36702:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36703

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.36705

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36706

fbeq_else.36705:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36706:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36707

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.36700

bnei_else.36707:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36708:
	nop
	nop
	nop
	j	bnei_cont.36700

bnei_else.36703:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36704:
	nop
	nop
	nop
	j	bnei_cont.36700

bnei_else.36699:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36700:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36709

	fsw	%f17, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.36710

bnei_else.36709:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36710:
bnei_cont.36696:
bnei_cont.36682:
bnei_cont.36648:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36711

	flw	%f1, 135(%zero)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36713

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36714

fbgt_else.36713:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36714:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36715

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36717

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36719

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.36718

bnei_else.36719:
	lw	%a0, 2(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36721

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36723

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.36718

bnei_else.36723:
	lw	%a0, 3(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36725

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36727

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.36718

bnei_else.36727:
	nop
	nop
	addi	%v0, %zero, 4
	addi	%v1, %s6, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2928

bnei_cont.36728:
	nop
	nop
	nop
	j	bnei_cont.36718

bnei_else.36725:

bnei_cont.36726:
bnei_cont.36724:

bnei_else.36721:

bnei_cont.36722:
bnei_cont.36720:

bnei_else.36717:

bnei_cont.36718:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36729

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.36646

bnei_else.36729:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36730:
	nop
	nop
	nop
	j	bnei_cont.36646

bnei_else.36715:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36716:
	nop
	nop
	nop
	j	bnei_cont.36646

bnei_else.36711:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.36712:
	nop
	nop
	nop
	j	bnei_cont.36646

bnei_else.36645:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.36646:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36731

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36732

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36734

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.36733

bnei_else.36734:
	lw	%a0, 2(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36736

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36738

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.36733

bnei_else.36738:
	lw	%a0, 3(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.36740

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2925

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36742

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.36733

bnei_else.36742:
	nop
	nop
	addi	%v0, %zero, 4
	addi	%v1, %s6, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2928

bnei_cont.36743:
	nop
	nop
	nop
	j	bnei_cont.36733

bnei_else.36740:

bnei_cont.36741:
bnei_cont.36739:

bnei_else.36736:

bnei_cont.36737:
bnei_cont.36735:

bnei_else.36732:

bnei_cont.36733:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36744

	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.36744:
	nop
	nop
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5

	nop
	nop
	addi	%v1, %s4, 0
	j	shadow_check_one_or_matrix.2931

bnei_else.36731:
	nop
	nop
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5

	nop
	nop
	addi	%v1, %s4, 0
	j	shadow_check_one_or_matrix.2931

bnei_else.36644:
	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

solve_each_element.2934:
	nop
	nop
	add	%a3, %zero, %v0
	add	%k0, %zero, %a0

	nop
	nop
	add	%s0, %zero, %ra
	add	%at, %v1, %a3

	lw	%s1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s1, -1, bnei_else.36990

	lw	%a1, 12(%s1)
	flw	%f19, 159(%zero)
	nop
	nop

	lw	%a0, 5(%a1)
	flw	%f18, 160(%zero)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%a1)
	nop
	nop

	flw	%f0, 1(%a0)
	flw	%f17, 161(%zero)
	fsub	%f21, %f19, %f0
	nop

	lw	%a0, 5(%a1)
	nop
	fsub	%f22, %f18, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 1(%a1)
	nop
	nop

	nop
	nop
	fsub	%f23, %f17, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.36991

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.36993

	flw	%f28, 0(%k0)
	flw	%f27, 1(%k0)
	nop
	nop

	flw	%f29, 2(%k0)
	lw	%a0, 4(%a1)
	fmul	%f0, %f28, %f28
	nop

	flw	%f25, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f24, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f1, %f0, %f25
	fmul	%f0, %f27, %f27

	flw	%f20, 2(%a0)
	lw	%a2, 3(%a1)
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f29, %f29

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36995

	lw	%a0, 9(%a1)
	nop
	fmul	%f16, %f27, %f29
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f29, %f28

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f28, %f27

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.36996

bnei_else.36995:
bnei_cont.36996:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.36997

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.36998

fbeq_else.36997:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.36998:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36999

	nop
	nop
	add	%s2, %zero, %zero
	j	bnei_cont.36992

bnei_else.36999:
	nop
	nop
	fmul	%f1, %f28, %f21
	nop

	nop
	nop
	fmul	%f16, %f1, %f25
	fmul	%f1, %f27, %f22

	nop
	nop
	fmul	%f1, %f1, %f24
	nop

	nop
	nop
	fadd	%f16, %f16, %f1
	fmul	%f1, %f29, %f23

	nop
	nop
	fmul	%f1, %f1, %f20
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37001

	lw	%a0, 9(%a1)
	nop
	fmul	%f2, %f29, %f22
	fmul	%f16, %f27, %f23

	flw	%f16, 0(%a0)
	lw	%a0, 9(%a1)
	fadd	%f2, %f2, %f16
	nop

	nop
	nop
	fmul	%f26, %f2, %f16
	fmul	%f2, %f28, %f23

	nop
	nop
	fmul	%f16, %f29, %f21
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f2, %f2, %f16
	nop

	nop
	nop
	fmul	%f16, %f2, %f16
	fmul	%f2, %f28, %f22

	nop
	nop
	fadd	%f26, %f26, %f16
	fmul	%f16, %f27, %f21

	flw	%f16, 2(%a0)
	nop
	fadd	%f2, %f2, %f16
	nop

	nop
	nop
	fmul	%f16, %f2, %f16
	nop

	flw	%f16, 473(%zero)
	nop
	fadd	%f2, %f26, %f16
	nop

	nop
	nop
	fmul	%f16, %f2, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f16
	j	bnei_cont.37002

bnei_else.37001:
bnei_cont.37002:
	nop
	nop
	fmul	%f16, %f21, %f21
	nop

	nop
	nop
	fmul	%f2, %f16, %f25
	fmul	%f16, %f22, %f22

	nop
	nop
	fmul	%f16, %f16, %f24
	nop

	nop
	nop
	fadd	%f2, %f2, %f16
	fmul	%f16, %f23, %f23

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	nop
	nop
	fadd	%f16, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37003

	lw	%a0, 9(%a1)
	nop
	fmul	%f20, %f22, %f23
	nop

	flw	%f2, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f2, %f20, %f2
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f20, %f16, %f2
	fmul	%f2, %f23, %f21

	nop
	nop
	fmul	%f16, %f2, %f16
	fmul	%f2, %f21, %f22

	flw	%f16, 2(%a0)
	nop
	fadd	%f20, %f20, %f16
	nop

	nop
	nop
	fmul	%f16, %f2, %f16
	nop

	nop
	nop
	fadd	%f16, %f20, %f16
	j	bnei_cont.37004

bnei_else.37003:
bnei_cont.37004:
	lw	%a0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.37005

	nop
	nop
	nop
	j	bnei_cont.37006

bnei_else.37005:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.37006:
	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f16, %f0, %f16

	nop
	nop
	fsub	%f16, %f2, %f16
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.37007

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37008

fbgt_else.37007:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37008:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37009

	lw	%a0, 6(%a1)
	nop
	fsqrt	%f16, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37011

	nop
	nop
	nop
	j	bnei_cont.37012

bnei_else.37011:
	nop
	nop
	fneg	%f16, %f16
	nop

bnei_cont.37012:
	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s2, %zero, %k1
	j	bnei_cont.36992

bnei_else.37009:
	nop
	nop
	add	%s2, %zero, %zero
	nop

bnei_cont.37010:
bnei_cont.37000:
	nop
	nop
	nop
	j	bnei_cont.36992

bnei_else.36993:
	lw	%a0, 4(%a1)
	flw	%f0, 0(%k0)
	nop
	nop

	flw	%f24, 0(%a0)
	flw	%f20, 1(%a0)
	nop
	nop

	flw	%f0, 1(%k0)
	flw	%f2, 2(%a0)
	fmul	%f1, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	flw	%f0, 2(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.37013

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37014

fbgt_else.37013:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37014:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37015

	nop
	nop
	fmul	%f1, %f24, %f21
	fmul	%f0, %f20, %f22

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f2, %f23

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s2, %zero, %k1
	j	bnei_cont.36992

bnei_else.37015:
	nop
	nop
	add	%s2, %zero, %zero
	nop

bnei_cont.37016:
bnei_cont.36994:
	nop
	nop
	nop
	j	bnei_cont.36992

bnei_else.36991:
	flw	%f2, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f2, %fzero, fbeq_else.37017

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37018

fbeq_else.37017:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.37018:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37019

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37020

bnei_else.37019:
	lw	%ra, 4(%a1)
	lw	%a2, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %fzero, fbgt_else.37021

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37022

fbgt_else.37021:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37022:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37023

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37025

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37024

bnei_else.37025:

bnei_cont.37026:

bnei_else.37023:
bnei_cont.37024:
	flw	%f0, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37027

	nop
	nop
	nop
	j	bnei_cont.37028

bnei_else.37027:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.37028:
	nop
	nop
	fsub	%f0, %f0, %f21
	nop

	flw	%f0, 1(%k0)
	nop
	fdiv	%f16, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f22
	nop

	flw	%f0, 1(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37029

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37030

fbgt_else.37029:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37030:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37031

	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f23
	nop

	flw	%f0, 2(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37033

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37034

fbgt_else.37033:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37034:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37035

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37032

bnei_else.37035:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37036:
	nop
	nop
	nop
	j	bnei_cont.37032

bnei_else.37031:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37032:
bnei_cont.37020:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37037

	nop
	nop
	add	%s2, %zero, %k1
	j	bnei_cont.37038

bnei_else.37037:
	flw	%f16, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.37039

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37040

fbeq_else.37039:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.37040:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37041

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37042

bnei_else.37041:
	lw	%ra, 4(%a1)
	lw	%a2, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.37043

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37044

fbgt_else.37043:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37044:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37045

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37047

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37046

bnei_else.37047:

bnei_cont.37048:

bnei_else.37045:
bnei_cont.37046:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37049

	nop
	nop
	nop
	j	bnei_cont.37050

bnei_else.37049:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.37050:
	nop
	nop
	fsub	%f0, %f0, %f22
	nop

	flw	%f0, 2(%k0)
	nop
	fdiv	%f20, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f23
	nop

	flw	%f0, 2(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37051

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37052

fbgt_else.37051:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37052:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37053

	nop
	nop
	fmul	%f0, %f20, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f21
	nop

	flw	%f0, 0(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37055

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37056

fbgt_else.37055:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37056:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37057

	fsw	%f20, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37054

bnei_else.37057:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37058:
	nop
	nop
	nop
	j	bnei_cont.37054

bnei_else.37053:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37054:
bnei_cont.37042:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37059

	nop
	nop
	addi	%s2, %zero, 2
	j	bnei_cont.37060

bnei_else.37059:
	flw	%f1, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.37061

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37062

fbeq_else.37061:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.37062:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37063

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37064

bnei_else.37063:
	lw	%ra, 4(%a1)
	lw	%a2, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.37065

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37066

fbgt_else.37065:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37066:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37067

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37069

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37068

bnei_else.37069:

bnei_cont.37070:

bnei_else.37067:
bnei_cont.37068:
	flw	%f0, 2(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37071

	nop
	nop
	nop
	j	bnei_cont.37072

bnei_else.37071:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.37072:
	nop
	nop
	fsub	%f0, %f0, %f23
	nop

	nop
	nop
	fdiv	%f20, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f20, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f21
	nop

	flw	%f0, 0(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37073

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37074

fbgt_else.37073:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37074:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37075

	nop
	nop
	fmul	%f0, %f20, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f22
	nop

	flw	%f0, 1(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37077

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37078

fbgt_else.37077:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37078:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37079

	fsw	%f20, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37076

bnei_else.37079:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37080:
	nop
	nop
	nop
	j	bnei_cont.37076

bnei_else.37075:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37076:
bnei_cont.37064:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37081

	nop
	nop
	addi	%s2, %zero, 3
	j	bnei_cont.37082

bnei_else.37081:
	nop
	nop
	add	%s2, %zero, %zero
	nop

bnei_cont.37082:
bnei_cont.37060:
bnei_cont.37038:
bnei_cont.36992:
	nop
	nop
	nop
	beqi	%s2, 0, bnei_else.37083

	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.37084

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37085

fbgt_else.37084:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37085:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37086

	flw	%f0, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37088

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37089

fbgt_else.37088:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37089:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.37087

	flw	%f0, 466(%zero)
	flw	%f16, 2(%k0)
	nop
	nop

	flw	%f0, 0(%k0)
	flw	%f1, 1(%k0)
	fadd	%f22, %f1, %f0
	nop

	lw	%a0, 0(%v1)
	nop
	fmul	%f0, %f0, %f22
	fmul	%f1, %f1, %f22

	nop
	nop
	fadd	%f0, %f0, %f19
	fadd	%f1, %f1, %f18

	nop
	nop
	fmul	%f16, %f16, %f22
	nop

	nop
	nop
	fadd	%f2, %f16, %f17
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37092

	lw	%a1, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 5(%a1)
	nop
	nop
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 5(%a1)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 5(%a1)
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	lw	%a0, 1(%a1)
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.37094

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.37096

	lw	%a0, 4(%a1)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%a0)
	lw	%a0, 3(%a1)
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37098

	lw	%a0, 9(%a1)
	nop
	fmul	%f18, %f20, %f21
	nop

	flw	%f17, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.37099

bnei_else.37098:
bnei_cont.37099:
	lw	%a0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.37100

	nop
	nop
	nop
	j	bnei_cont.37101

bnei_else.37100:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.37101:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.37102

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37103

fbgt_else.37102:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37103:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37104

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37106

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37105

bnei_else.37106:

bnei_cont.37107:

bnei_else.37104:
bnei_cont.37105:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37108

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37095

bnei_else.37108:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.37109:
	nop
	nop
	nop
	j	bnei_cont.37095

bnei_else.37096:
	lw	%a0, 4(%a1)
	lw	%a1, 6(%a1)
	nop
	nop

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%a0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.37110

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37111

fbgt_else.37110:

fbgt_cont.37111:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37112

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37114

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37113

bnei_else.37114:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.37115:
	nop
	nop
	nop
	j	bnei_cont.37113

bnei_else.37112:
bnei_cont.37113:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37116

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37095

bnei_else.37116:

bnei_cont.37117:
bnei_cont.37097:

bnei_else.37094:
	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f19
	nop

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.37118

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37119

fbgt_else.37118:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37119:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37120

	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f20
	nop

	flw	%f16, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.37122

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37123

fbgt_else.37122:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37123:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37124

	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f21
	nop

	flw	%f16, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.37126

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37121

fbgt_else.37126:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37127:
	nop
	nop
	nop
	j	bnei_cont.37121

bnei_else.37124:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37125:
	nop
	nop
	nop
	j	bnei_cont.37121

bnei_else.37120:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37121:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37128

	lw	%a0, 6(%a1)
	nop
	nop
	j	bnei_cont.37129

bnei_else.37128:
	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37130

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37131

bnei_else.37130:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.37131:
bnei_cont.37129:
bnei_cont.37095:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37132

	nop
	nop
	add	%v0, %zero, %zero
	j	bnei_cont.37093

bnei_else.37132:
	nop
	nop
	addi	%v0, %k1, 0
	jal	check_all_inside.2919

bnei_cont.37133:
	nop
	nop
	nop
	j	bnei_cont.37093

bnei_else.37092:

bnei_cont.37093:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.37087

	fsw	%f22, 137(%zero)
	nop
	nop
	nop

	fsw	%f0, 138(%zero)
	nop
	nop
	nop

	fsw	%f1, 139(%zero)
	nop
	nop
	nop

	fsw	%f2, 140(%zero)
	nop
	nop
	nop

	sw	%s1, 141(%zero)
	nop
	nop
	nop

	sw	%s2, 136(%zero)
	nop
	nop
	j	bnei_cont.37087

bnei_else.37134:
bnei_cont.37135:

bnei_else.37090:
bnei_cont.37091:

bnei_else.37086:
bnei_cont.37087:
	nop
	nop
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0

	nop
	nop
	addi	%a0, %k0, 0
	j	solve_each_element.2934

bnei_else.37083:
	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37136

	nop
	nop
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0

	nop
	nop
	addi	%a0, %k0, 0
	j	solve_each_element.2934

bnei_else.37136:
	nop
	nop
	add	%ra, %zero, %s0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36990:
	nop
	nop
	add	%ra, %zero, %s0
	nop

	nop
	nop
	nop
	jr	%ra

solve_one_or_network.2938:

	nop
	nop
	add	%s5, %zero, %a0
	add	%s6, %zero, %ra

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37189

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37190

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37191

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37192

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37193

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37194

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37195

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37196

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%v0, %s3, 1
	add	%ra, %zero, %s6

	nop
	nop
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0

	nop
	nop
	nop
	j	solve_one_or_network.2938

bnei_else.37196:

	nop
	nop
	nop
	jr	%ra

bnei_else.37195:

	nop
	nop
	nop
	jr	%ra

bnei_else.37194:

	nop
	nop
	nop
	jr	%ra

bnei_else.37193:

	nop
	nop
	nop
	jr	%ra

bnei_else.37192:

	nop
	nop
	nop
	jr	%ra

bnei_else.37191:

	nop
	nop
	nop
	jr	%ra

bnei_else.37190:

	nop
	nop
	nop
	jr	%ra

bnei_else.37189:

	nop
	nop
	nop
	jr	%ra

trace_or_matrix.2942:
	nop
	nop
	add	%s7, %zero, %v0
	add	%t7, %zero, %v1

	nop
	nop
	add	%t8, %zero, %a0
	add	%t9, %zero, %ra

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%s3, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37609

	nop
	nop
	nop
	beqi	%a0, 99, bnei_else.37610

	lw	%a1, 12(%a0)
	flw	%f1, 159(%zero)
	nop
	nop

	lw	%a0, 5(%a1)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%a1)
	nop
	nop

	flw	%f1, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f1, 161(%zero)
	lw	%a0, 5(%a1)
	fsub	%f2, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 1(%a1)
	nop
	nop

	nop
	nop
	fsub	%f20, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.37612

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.37614

	flw	%f25, 0(%t8)
	flw	%f24, 1(%t8)
	nop
	nop

	flw	%f26, 2(%t8)
	lw	%a0, 4(%a1)
	fmul	%f0, %f25, %f25
	nop

	flw	%f23, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f21, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f1, %f0, %f23
	fmul	%f0, %f24, %f24

	flw	%f18, 2(%a0)
	lw	%a2, 3(%a1)
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f26, %f26

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37616

	lw	%a0, 9(%a1)
	nop
	fmul	%f16, %f24, %f26
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f26, %f25

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f25, %f24

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.37617

bnei_else.37616:
bnei_cont.37617:

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37619

fbeq_else.37618:

fbeq_cont.37619:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37613

bnei_else.37620:

	nop
	nop
	fmul	%f16, %f1, %f23
	fmul	%f1, %f24, %f2

	nop
	nop
	fmul	%f1, %f1, %f21
	nop

	nop
	nop
	fadd	%f16, %f16, %f1
	fmul	%f1, %f26, %f20

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37622

	lw	%a0, 9(%a1)
	nop
	fmul	%f17, %f26, %f2
	fmul	%f16, %f24, %f20

	flw	%f16, 0(%a0)
	lw	%a0, 9(%a1)
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f22, %f17, %f16
	fmul	%f17, %f25, %f20

	nop
	nop
	fmul	%f16, %f26, %f19
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f25, %f2

	nop
	nop
	fadd	%f22, %f22, %f16
	fmul	%f16, %f24, %f19

	flw	%f16, 2(%a0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	flw	%f16, 473(%zero)
	nop
	fadd	%f17, %f22, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f16
	j	bnei_cont.37623

bnei_else.37622:
bnei_cont.37623:

	nop
	nop
	fmul	%f17, %f16, %f23
	fmul	%f16, %f2, %f2

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f17, %f17, %f16
	fmul	%f16, %f20, %f20

	nop
	nop
	fmul	%f16, %f16, %f18
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37624

	lw	%a0, 9(%a1)
	nop
	fmul	%f18, %f2, %f20
	nop

	flw	%f17, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f2

	flw	%f16, 2(%a0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.37625

bnei_else.37624:
bnei_cont.37625:

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.37626

	nop
	nop
	nop
	j	bnei_cont.37627

bnei_else.37626:

bnei_cont.37627:

	nop
	nop
	fsub	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.37628

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37629

fbgt_else.37628:

fbgt_cont.37629:

	lw	%a0, 6(%a1)
	nop
	fsqrt	%f16, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37632

	nop
	nop
	nop
	j	bnei_cont.37633

bnei_else.37632:

bnei_cont.37633:

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37613

bnei_else.37630:

bnei_cont.37631:
bnei_cont.37621:

bnei_else.37614:

	flw	%f21, 0(%a0)
	flw	%f18, 1(%a0)
	nop
	nop

	flw	%f0, 1(%t8)
	flw	%f17, 2(%a0)
	fmul	%f1, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 2(%t8)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.37634

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37635

fbgt_else.37634:

fbgt_cont.37635:

	nop
	nop
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37613

bnei_else.37636:

bnei_cont.37637:
bnei_cont.37615:

bnei_else.37612:
	flw	%f17, 0(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.37638

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37639

fbeq_else.37638:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.37639:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37640

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37641

bnei_else.37640:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %fzero, fbgt_else.37642

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37643

fbgt_else.37642:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37643:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37644

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37646

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37645

bnei_else.37646:

bnei_cont.37647:

bnei_else.37644:
bnei_cont.37645:
	flw	%f0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37648

	nop
	nop
	nop
	j	bnei_cont.37649

bnei_else.37648:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.37649:
	nop
	nop
	fsub	%f0, %f0, %f19
	nop

	flw	%f0, 1(%t8)
	nop
	fdiv	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37650

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37651

fbgt_else.37650:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37651:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37652

	flw	%f0, 2(%t8)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37654

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37655

fbgt_else.37654:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37655:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37656

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37653

bnei_else.37656:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37657:
	nop
	nop
	nop
	j	bnei_cont.37653

bnei_else.37652:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37653:
bnei_cont.37641:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37658

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37659

bnei_else.37658:
	flw	%f16, 1(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.37660

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37661

fbeq_else.37660:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.37661:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37662

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37663

bnei_else.37662:
	lw	%a3, 4(%a1)
	lw	%a2, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.37664

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37665

fbgt_else.37664:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37665:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37666

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37668

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37667

bnei_else.37668:

bnei_cont.37669:

bnei_else.37666:
bnei_cont.37667:
	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37670

	nop
	nop
	nop
	j	bnei_cont.37671

bnei_else.37670:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.37671:
	nop
	nop
	fsub	%f0, %f0, %f2
	nop

	flw	%f0, 2(%t8)
	nop
	fdiv	%f18, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f18, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37672

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37673

fbgt_else.37672:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37673:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37674

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37676

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37677

fbgt_else.37676:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37677:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37678

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37675

bnei_else.37678:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37679:
	nop
	nop
	nop
	j	bnei_cont.37675

bnei_else.37674:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37675:
bnei_cont.37663:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37680

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.37681

bnei_else.37680:
	flw	%f1, 2(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.37682

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37683

fbeq_else.37682:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.37683:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37684

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37685

bnei_else.37684:
	lw	%a2, 4(%a1)
	lw	%a1, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.37686

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37687

fbgt_else.37686:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37687:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37688

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37690

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37689

bnei_else.37690:

bnei_cont.37691:

bnei_else.37688:
bnei_cont.37689:
	flw	%f0, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37692

	nop
	nop
	nop
	j	bnei_cont.37693

bnei_else.37692:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.37693:
	nop
	nop
	fsub	%f0, %f0, %f20
	nop

	nop
	nop
	fdiv	%f18, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a2)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37694

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37695

fbgt_else.37694:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37695:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37696

	nop
	nop
	fmul	%f0, %f18, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a2)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37698

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37699

fbgt_else.37698:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37699:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37700

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37697

bnei_else.37700:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37701:
	nop
	nop
	nop
	j	bnei_cont.37697

bnei_else.37696:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37697:
bnei_cont.37685:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37702

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.37703

bnei_else.37702:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.37703:
bnei_cont.37681:
bnei_cont.37659:
bnei_cont.37613:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.37611

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37706

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37707

fbgt_else.37706:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.37707:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.37611

	lw	%a0, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37611

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37611

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37611

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 4(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37611

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 5(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37611

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 6(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37611

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 7(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37611

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0

	nop
	nop
	addi	%v1, %s3, 0
	jal	solve_one_or_network.2938

	nop
	nop
	nop
	j	bnei_cont.37611

bnei_else.37722:
bnei_cont.37723:

bnei_else.37720:
bnei_cont.37721:

bnei_else.37718:
bnei_cont.37719:

bnei_else.37716:
bnei_cont.37717:

bnei_else.37714:
bnei_cont.37715:

bnei_else.37712:
bnei_cont.37713:

bnei_else.37710:
bnei_cont.37711:

bnei_else.37708:
bnei_cont.37709:

bnei_else.37704:
bnei_cont.37705:

bnei_else.37610:

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37724

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37725

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37725

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 4(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37725

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 5(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37725

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 6(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37725

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 7(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37725

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0

	nop
	nop
	addi	%v1, %s3, 0
	jal	solve_one_or_network.2938

	nop
	nop
	nop
	j	bnei_cont.37725

bnei_else.37736:
bnei_cont.37737:

bnei_else.37734:
bnei_cont.37735:

bnei_else.37732:
bnei_cont.37733:

bnei_else.37730:
bnei_cont.37731:

bnei_else.37728:
bnei_cont.37729:

bnei_else.37726:
bnei_cont.37727:

bnei_else.37724:
bnei_cont.37725:
bnei_cont.37611:
	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%s3, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37738

	nop
	nop
	nop
	beqi	%a0, 99, bnei_else.37739

	lw	%a1, 12(%a0)
	flw	%f1, 159(%zero)
	nop
	nop

	lw	%a0, 5(%a1)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%a1)
	nop
	nop

	flw	%f1, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f1, 161(%zero)
	lw	%a0, 5(%a1)
	fsub	%f2, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 1(%a1)
	nop
	nop

	nop
	nop
	fsub	%f20, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.37741

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.37743

	flw	%f22, 0(%t8)
	flw	%f21, 1(%t8)
	nop
	nop

	flw	%f23, 2(%t8)
	lw	%a0, 4(%a1)
	fmul	%f1, %f22, %f22
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f21, %f21

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f23, %f23

	flw	%f0, 2(%a0)
	lw	%a0, 3(%a1)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37745

	lw	%a0, 9(%a1)
	nop
	fmul	%f16, %f21, %f23
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f23, %f22

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f22, %f21

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.37746

bnei_else.37745:
bnei_cont.37746:

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37748

fbeq_else.37747:

fbeq_cont.37748:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37742

bnei_else.37749:

	flw	%f1, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f1, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f17, %f16, %f1
	fmul	%f16, %f21, %f2

	nop
	nop
	fmul	%f1, %f16, %f1
	fmul	%f16, %f23, %f20

	flw	%f1, 2(%a0)
	lw	%a0, 3(%a1)
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	nop
	nop
	fadd	%f1, %f17, %f1
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37751

	lw	%a0, 9(%a1)
	nop
	fmul	%f17, %f23, %f2
	fmul	%f16, %f21, %f20

	flw	%f16, 0(%a0)
	lw	%a0, 9(%a1)
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f18, %f17, %f16
	fmul	%f17, %f22, %f20

	nop
	nop
	fmul	%f16, %f23, %f19
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f22, %f2

	nop
	nop
	fadd	%f18, %f18, %f16
	fmul	%f16, %f21, %f19

	flw	%f16, 2(%a0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	flw	%f16, 473(%zero)
	nop
	fadd	%f17, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f1, %f1, %f16
	j	bnei_cont.37752

bnei_else.37751:
bnei_cont.37752:

	flw	%f16, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f2, %f2

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f20, %f20

	flw	%f16, 2(%a0)
	lw	%a0, 3(%a1)
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37753

	lw	%a0, 9(%a1)
	nop
	fmul	%f18, %f2, %f20
	nop

	flw	%f17, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f18, %f16, %f17
	fmul	%f17, %f20, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f2

	flw	%f16, 2(%a0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.37754

bnei_else.37753:
bnei_cont.37754:

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.37755

	nop
	nop
	nop
	j	bnei_cont.37756

bnei_else.37755:

bnei_cont.37756:

	nop
	nop
	fsub	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.37757

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37758

fbgt_else.37757:

fbgt_cont.37758:

	lw	%a0, 6(%a1)
	nop
	fsqrt	%f16, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37761

	nop
	nop
	nop
	j	bnei_cont.37762

bnei_else.37761:

bnei_cont.37762:

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37742

bnei_else.37759:

bnei_cont.37760:
bnei_cont.37750:

bnei_else.37743:

	flw	%f21, 0(%a0)
	flw	%f18, 1(%a0)
	nop
	nop

	flw	%f0, 1(%t8)
	flw	%f17, 2(%a0)
	fmul	%f1, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 2(%t8)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.37763

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37764

fbgt_else.37763:

fbgt_cont.37764:

	nop
	nop
	fmul	%f1, %f21, %f19
	fmul	%f0, %f18, %f2

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f17, %f20

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37742

bnei_else.37765:

bnei_cont.37766:
bnei_cont.37744:

bnei_else.37741:

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.37767

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37768

fbeq_else.37767:

fbeq_cont.37768:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37770

bnei_else.37769:

	nop
	nop
	nop
	fblt	%f17, %fzero, fbgt_else.37771

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37772

fbgt_else.37771:

fbgt_cont.37772:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37775

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37774

bnei_else.37775:

bnei_cont.37776:

bnei_else.37773:
bnei_cont.37774:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37777

	nop
	nop
	nop
	j	bnei_cont.37778

bnei_else.37777:

bnei_cont.37778:

	flw	%f0, 1(%t8)
	nop
	fdiv	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37779

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37780

fbgt_else.37779:

fbgt_cont.37780:

	flw	%f0, 2(%t8)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37783

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37784

fbgt_else.37783:

fbgt_cont.37784:

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37782

bnei_else.37785:

bnei_cont.37786:

bnei_else.37781:

bnei_cont.37782:
bnei_cont.37770:

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37788

bnei_else.37787:

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.37789

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37790

fbeq_else.37789:

fbeq_cont.37790:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37792

bnei_else.37791:

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.37793

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37794

fbgt_else.37793:

fbgt_cont.37794:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37797

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37796

bnei_else.37797:

bnei_cont.37798:

bnei_else.37795:
bnei_cont.37796:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37799

	nop
	nop
	nop
	j	bnei_cont.37800

bnei_else.37799:

bnei_cont.37800:

	flw	%f0, 2(%t8)
	nop
	fdiv	%f18, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f18, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	flw	%f0, 2(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37801

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37802

fbgt_else.37801:

fbgt_cont.37802:

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a3)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37805

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37806

fbgt_else.37805:

fbgt_cont.37806:

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37804

bnei_else.37807:

bnei_cont.37808:

bnei_else.37803:

bnei_cont.37804:
bnei_cont.37792:

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.37810

bnei_else.37809:

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.37811

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.37812

fbeq_else.37811:

fbeq_cont.37812:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37814

bnei_else.37813:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.37815

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37816

fbgt_else.37815:

fbgt_cont.37816:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37819

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.37818

bnei_else.37819:

bnei_cont.37820:

bnei_else.37817:
bnei_cont.37818:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37821

	nop
	nop
	nop
	j	bnei_cont.37822

bnei_else.37821:

bnei_cont.37822:

	nop
	nop
	fdiv	%f18, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f18, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a2)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37823

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37824

fbgt_else.37823:

fbgt_cont.37824:

	nop
	nop
	fmul	%f0, %f18, %f16
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	flw	%f0, 1(%a2)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37827

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37828

fbgt_else.37827:

fbgt_cont.37828:

	fsw	%f18, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.37826

bnei_else.37829:

bnei_cont.37830:

bnei_else.37825:

bnei_cont.37826:
bnei_cont.37814:

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.37832

bnei_else.37831:

bnei_cont.37832:
bnei_cont.37810:
bnei_cont.37788:
bnei_cont.37742:

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37835

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.37836

fbgt_else.37835:

fbgt_cont.37836:

	lw	%a0, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37740

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37740

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37740

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 4(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37740

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 5(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37740

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 6(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37740

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0

	nop
	nop
	addi	%v1, %s3, 0
	jal	solve_one_or_network.2938

	nop
	nop
	nop
	j	bnei_cont.37740

bnei_else.37849:
bnei_cont.37850:

bnei_else.37847:
bnei_cont.37848:

bnei_else.37845:
bnei_cont.37846:

bnei_else.37843:
bnei_cont.37844:

bnei_else.37841:
bnei_cont.37842:

bnei_else.37839:
bnei_cont.37840:

bnei_else.37837:
bnei_cont.37838:

bnei_else.37833:
bnei_cont.37834:

bnei_else.37739:
	lw	%a0, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.37851

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37852

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37852

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 4(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37852

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 5(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37852

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	lw	%a0, 6(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.37852

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2934

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0

	nop
	nop
	addi	%v1, %s3, 0
	jal	solve_one_or_network.2938

	nop
	nop
	nop
	j	bnei_cont.37852

bnei_else.37861:
bnei_cont.37862:

bnei_else.37859:
bnei_cont.37860:

bnei_else.37857:
bnei_cont.37858:

bnei_else.37855:
bnei_cont.37856:

bnei_else.37853:
bnei_cont.37854:

bnei_else.37851:
bnei_cont.37852:
bnei_cont.37740:
	nop
	nop
	addi	%v0, %s7, 1
	add	%ra, %zero, %t9

	nop
	nop
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0

	nop
	nop
	nop
	j	trace_or_matrix.2942

bnei_else.37738:

	nop
	nop
	nop
	jr	%ra

bnei_else.37609:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

solve_each_element_fast.2948:
	nop
	nop
	add	%a3, %zero, %v0
	add	%k0, %zero, %a0

	lw	%a1, 0(%k0)
	nop
	add	%s0, %zero, %ra
	add	%at, %v1, %a3

	lw	%s1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s1, -1, bnei_else.38062

	lw	%a2, 12(%s1)
	lw	%a0, 1(%k0)
	nop
	nop

	lw	%s2, 10(%a2)
	lw	%a0, 1(%a2)
	add	%at, %a0, %s1
	nop

	flw	%f19, 0(%s2)
	flw	%f16, 1(%s2)
	nop
	nop

	flw	%f17, 2(%s2)
	lw	%ra, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.38063

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38065

	flw	%f18, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.38067

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38068

fbeq_else.38067:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38068:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38069

	nop
	nop
	add	%s2, %zero, %zero
	j	bnei_cont.38064

bnei_else.38069:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 3(%s2)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f18, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38071

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38072

fbgt_else.38071:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38072:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38073

	lw	%a0, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38075

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.38076

bnei_else.38075:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.38076:
	nop
	nop
	add	%s2, %zero, %k1
	j	bnei_cont.38064

bnei_else.38073:
	nop
	nop
	add	%s2, %zero, %zero
	nop

bnei_cont.38074:
bnei_cont.38070:
	nop
	nop
	nop
	j	bnei_cont.38064

bnei_else.38065:
	flw	%f1, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38077

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38078

fbgt_else.38077:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38078:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38079

	flw	%f0, 3(%s2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s2, %zero, %k1
	j	bnei_cont.38064

bnei_else.38079:
	nop
	nop
	add	%s2, %zero, %zero
	nop

bnei_cont.38080:
bnei_cont.38066:
	nop
	nop
	nop
	j	bnei_cont.38064

bnei_else.38063:
	lw	%s2, 0(%k0)
	flw	%f0, 0(%ra)
	nop
	nop

	flw	%f20, 1(%ra)
	flw	%f18, 1(%s2)
	fsub	%f0, %f0, %f19
	nop

	lw	%a0, 4(%a2)
	nop
	fmul	%f2, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f2, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 1(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38081

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38082

fbgt_else.38081:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38082:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38083

	flw	%f0, 2(%s2)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38085

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38086

fbgt_else.38085:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38086:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38087

	nop
	nop
	nop
	fbne	%f20, %fzero, fbeq_else.38089

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38090

fbeq_else.38089:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38090:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38091

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38084

bnei_else.38091:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38092:
	nop
	nop
	nop
	j	bnei_cont.38084

bnei_else.38087:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38088:
	nop
	nop
	nop
	j	bnei_cont.38084

bnei_else.38083:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38084:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38093

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s2, %zero, %k1
	j	bnei_cont.38094

bnei_else.38093:
	flw	%f0, 2(%ra)
	flw	%f21, 3(%ra)
	nop
	nop

	flw	%f20, 0(%s2)
	lw	%a0, 4(%a2)
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f2, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f2, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38095

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38096

fbgt_else.38095:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38096:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38097

	flw	%f0, 2(%s2)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38099

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38100

fbgt_else.38099:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38100:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38101

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.38103

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38104

fbeq_else.38103:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38104:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38105

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38098

bnei_else.38105:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38106:
	nop
	nop
	nop
	j	bnei_cont.38098

bnei_else.38101:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38102:
	nop
	nop
	nop
	j	bnei_cont.38098

bnei_else.38097:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38098:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38107

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%s2, %zero, 2
	j	bnei_cont.38108

bnei_else.38107:
	flw	%f0, 4(%ra)
	flw	%f2, 5(%ra)
	nop
	nop

	lw	%a0, 4(%a2)
	nop
	fsub	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f17, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f17, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38109

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38110

fbgt_else.38109:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38110:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38111

	lw	%a0, 4(%a2)
	nop
	fmul	%f0, %f17, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 1(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38113

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38114

fbgt_else.38113:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38114:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38115

	nop
	nop
	nop
	fbne	%f2, %fzero, fbeq_else.38117

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38118

fbeq_else.38117:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38118:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38119

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38112

bnei_else.38119:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38120:
	nop
	nop
	nop
	j	bnei_cont.38112

bnei_else.38115:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38116:
	nop
	nop
	nop
	j	bnei_cont.38112

bnei_else.38111:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38112:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38121

	fsw	%f17, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%s2, %zero, 3
	j	bnei_cont.38122

bnei_else.38121:
	nop
	nop
	add	%s2, %zero, %zero
	nop

bnei_cont.38122:
bnei_cont.38108:
bnei_cont.38094:
bnei_cont.38064:
	nop
	nop
	nop
	beqi	%s2, 0, bnei_else.38123

	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.38124

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38125

fbgt_else.38124:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38125:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38126

	flw	%f0, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38128

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38129

fbgt_else.38128:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38129:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38127

	flw	%f0, 466(%zero)
	lw	%a0, 0(%v1)
	nop
	nop

	flw	%f0, 0(%a1)
	nop
	fadd	%f22, %f1, %f0
	nop

	flw	%f0, 162(%zero)
	nop
	fmul	%f1, %f0, %f22
	nop

	flw	%f1, 1(%a1)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 163(%zero)
	nop
	fmul	%f16, %f1, %f22
	nop

	flw	%f16, 2(%a1)
	nop
	fadd	%f1, %f16, %f1
	nop

	flw	%f16, 164(%zero)
	nop
	fmul	%f17, %f16, %f22
	nop

	nop
	nop
	fadd	%f2, %f17, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38132

	lw	%a1, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 5(%a1)
	nop
	nop
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 5(%a1)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 5(%a1)
	fsub	%f19, %f0, %f16
	nop

	flw	%f16, 2(%a0)
	lw	%a0, 1(%a1)
	fsub	%f20, %f1, %f16
	nop

	nop
	nop
	fsub	%f21, %f2, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.38134

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38136

	lw	%a0, 4(%a1)
	nop
	fmul	%f17, %f19, %f19
	nop

	flw	%f16, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f18, %f17, %f16
	fmul	%f17, %f20, %f20

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f21, %f21

	flw	%f16, 2(%a0)
	lw	%a0, 3(%a1)
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38138

	lw	%a0, 9(%a1)
	nop
	fmul	%f18, %f20, %f21
	nop

	flw	%f17, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	flw	%f16, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f18, %f16, %f17
	fmul	%f17, %f21, %f19

	nop
	nop
	fmul	%f16, %f17, %f16
	fmul	%f17, %f19, %f20

	flw	%f16, 2(%a0)
	nop
	fadd	%f18, %f18, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f16, %f18, %f16
	j	bnei_cont.38139

bnei_else.38138:
bnei_cont.38139:
	lw	%a0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.38140

	nop
	nop
	nop
	j	bnei_cont.38141

bnei_else.38140:
	nop
	nop
	fsub	%f16, %f16, %f30
	nop

bnei_cont.38141:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.38142

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38143

fbgt_else.38142:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38143:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.38144

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38146

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38145

bnei_else.38146:

bnei_cont.38147:

bnei_else.38144:
bnei_cont.38145:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38148

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38135

bnei_else.38148:

bnei_cont.38149:

bnei_else.38136:
	lw	%a0, 4(%a1)
	lw	%a1, 6(%a1)
	nop
	nop

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	flw	%f16, 1(%a0)
	nop
	fmul	%f17, %f16, %f19
	nop

	nop
	nop
	fmul	%f16, %f16, %f20
	nop

	flw	%f16, 2(%a0)
	nop
	fadd	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f16, %f21
	nop

	nop
	nop
	fadd	%f16, %f17, %f16
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.38150

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38151

fbgt_else.38150:

fbgt_cont.38151:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.38152

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38154

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38153

bnei_else.38154:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38155:
	nop
	nop
	nop
	j	bnei_cont.38153

bnei_else.38152:
bnei_cont.38153:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38156

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38135

bnei_else.38156:

bnei_cont.38157:
bnei_cont.38137:

bnei_else.38134:
	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f19
	nop

	flw	%f16, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.38158

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38159

fbgt_else.38158:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38159:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38160

	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f20
	nop

	flw	%f16, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.38162

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38163

fbgt_else.38162:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38163:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38164

	lw	%a0, 4(%a1)
	nop
	fabs	%f17, %f21
	nop

	flw	%f16, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.38166

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38161

fbgt_else.38166:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38167:
	nop
	nop
	nop
	j	bnei_cont.38161

bnei_else.38164:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38165:
	nop
	nop
	nop
	j	bnei_cont.38161

bnei_else.38160:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38161:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38168

	lw	%a0, 6(%a1)
	nop
	nop
	j	bnei_cont.38169

bnei_else.38168:
	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38170

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38171

bnei_else.38170:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38171:
bnei_cont.38169:
bnei_cont.38135:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38172

	nop
	nop
	add	%v0, %zero, %zero
	j	bnei_cont.38133

bnei_else.38172:
	nop
	nop
	addi	%v0, %k1, 0
	jal	check_all_inside.2919

bnei_cont.38173:
	nop
	nop
	nop
	j	bnei_cont.38133

bnei_else.38132:

bnei_cont.38133:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.38127

	fsw	%f22, 137(%zero)
	nop
	nop
	nop

	fsw	%f0, 138(%zero)
	nop
	nop
	nop

	fsw	%f1, 139(%zero)
	nop
	nop
	nop

	fsw	%f2, 140(%zero)
	nop
	nop
	nop

	sw	%s1, 141(%zero)
	nop
	nop
	nop

	sw	%s2, 136(%zero)
	nop
	nop
	j	bnei_cont.38127

bnei_else.38174:
bnei_cont.38175:

bnei_else.38130:
bnei_cont.38131:

bnei_else.38126:
bnei_cont.38127:
	nop
	nop
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0

	nop
	nop
	addi	%a0, %k0, 0
	j	solve_each_element_fast.2948

bnei_else.38123:
	lw	%a0, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38176

	nop
	nop
	addi	%v0, %a3, 1
	add	%ra, %zero, %s0

	nop
	nop
	addi	%a0, %k0, 0
	j	solve_each_element_fast.2948

bnei_else.38176:
	nop
	nop
	add	%ra, %zero, %s0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.38062:
	nop
	nop
	add	%ra, %zero, %s0
	nop

	nop
	nop
	nop
	jr	%ra

solve_one_or_network_fast.2952:
	nop
	nop
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1

	nop
	nop
	add	%s5, %zero, %a0
	add	%s6, %zero, %ra

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38229

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38230

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38231

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38232

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38233

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38234

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38235

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%s3, %s3, 1
	nop

	nop
	nop
	add	%at, %s4, %s3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38236

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %s5, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%v0, %s3, 1
	add	%ra, %zero, %s6

	nop
	nop
	addi	%a0, %s5, 0
	addi	%v1, %s4, 0

	nop
	nop
	nop
	j	solve_one_or_network_fast.2952

bnei_else.38236:

	nop
	nop
	nop
	jr	%ra

bnei_else.38235:

	nop
	nop
	nop
	jr	%ra

bnei_else.38234:

	nop
	nop
	nop
	jr	%ra

bnei_else.38233:

	nop
	nop
	nop
	jr	%ra

bnei_else.38232:

	nop
	nop
	nop
	jr	%ra

bnei_else.38231:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.38230:

	nop
	nop
	nop
	jr	%ra

bnei_else.38229:

	nop
	nop
	nop
	jr	%ra

trace_or_matrix_fast.2956:
	nop
	nop
	add	%s7, %zero, %v0
	add	%t7, %zero, %v1

	nop
	nop
	add	%t8, %zero, %a0
	add	%t9, %zero, %ra

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%s3, 0(%at)
	nop
	nop
	nop

	lw	%a2, 0(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.38553

	nop
	nop
	nop
	beqi	%a2, 99, bnei_else.38554

	lw	%a1, 12(%a2)
	lw	%a0, 1(%t8)
	nop
	nop

	lw	%a3, 10(%a1)
	lw	%a0, 1(%a1)
	add	%at, %a0, %a2
	nop

	flw	%f19, 0(%a3)
	flw	%f16, 1(%a3)
	nop
	nop

	flw	%f17, 2(%a3)
	lw	%a2, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.38556

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38558

	flw	%f18, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.38560

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38561

fbeq_else.38560:

fbeq_cont.38561:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38557

bnei_else.38562:

	flw	%f0, 2(%a2)
	nop
	fmul	%f1, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%a2)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f18, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38564

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38565

fbgt_else.38564:

fbgt_cont.38565:

	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38568

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%a2)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.38569

bnei_else.38568:

	flw	%f0, 4(%a2)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.38569:

bnei_else.38566:

bnei_cont.38567:
bnei_cont.38563:

bnei_else.38558:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38570

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38571

fbgt_else.38570:

fbgt_cont.38571:

	flw	%f0, 3(%a3)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38557

bnei_else.38572:

bnei_cont.38573:
bnei_cont.38559:

bnei_else.38556:
	lw	%a3, 0(%t8)
	flw	%f0, 0(%a2)
	nop
	nop

	flw	%f20, 1(%a2)
	flw	%f18, 1(%a3)
	fsub	%f0, %f0, %f19
	nop

	lw	%a0, 4(%a1)
	nop
	fmul	%f2, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f2, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 1(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38574

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38575

fbgt_else.38574:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38575:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38576

	flw	%f0, 2(%a3)
	lw	%a0, 4(%a1)
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38578

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38579

fbgt_else.38578:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38579:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38580

	nop
	nop
	nop
	fbne	%f20, %fzero, fbeq_else.38582

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38583

fbeq_else.38582:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38583:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38584

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38577

bnei_else.38584:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38585:
	nop
	nop
	nop
	j	bnei_cont.38577

bnei_else.38580:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38581:
	nop
	nop
	nop
	j	bnei_cont.38577

bnei_else.38576:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38577:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38586

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38587

bnei_else.38586:
	flw	%f0, 2(%a2)
	flw	%f21, 3(%a2)
	nop
	nop

	flw	%f20, 0(%a3)
	lw	%a0, 4(%a1)
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f2, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f2, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38588

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38589

fbgt_else.38588:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38589:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38590

	flw	%f0, 2(%a3)
	lw	%a0, 4(%a1)
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38592

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38593

fbgt_else.38592:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38593:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38594

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.38596

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38597

fbeq_else.38596:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38597:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38598

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38591

bnei_else.38598:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38599:
	nop
	nop
	nop
	j	bnei_cont.38591

bnei_else.38594:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38595:
	nop
	nop
	nop
	j	bnei_cont.38591

bnei_else.38590:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38591:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38600

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.38601

bnei_else.38600:
	flw	%f0, 4(%a2)
	flw	%f2, 5(%a2)
	nop
	nop

	lw	%a0, 4(%a1)
	nop
	fsub	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f17, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f17, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 0(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38602

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38603

fbgt_else.38602:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38603:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38604

	lw	%a0, 4(%a1)
	nop
	fmul	%f0, %f17, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 1(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38606

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38607

fbgt_else.38606:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38607:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38608

	nop
	nop
	nop
	fbne	%f2, %fzero, fbeq_else.38610

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38611

fbeq_else.38610:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38611:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38612

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38605

bnei_else.38612:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38613:
	nop
	nop
	nop
	j	bnei_cont.38605

bnei_else.38608:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38609:
	nop
	nop
	nop
	j	bnei_cont.38605

bnei_else.38604:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38605:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38614

	fsw	%f17, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.38615

bnei_else.38614:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.38615:
bnei_cont.38601:
bnei_cont.38587:
bnei_cont.38557:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38555

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38618

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38619

fbgt_else.38618:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38619:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.38555

	lw	%a0, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38555

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38555

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38555

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 4(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38555

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 5(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38555

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 6(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38555

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 7(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38555

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0

	nop
	nop
	addi	%v1, %s3, 0
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	j	bnei_cont.38555

bnei_else.38634:
bnei_cont.38635:

bnei_else.38632:
bnei_cont.38633:

bnei_else.38630:
bnei_cont.38631:

bnei_else.38628:
bnei_cont.38629:

bnei_else.38626:
bnei_cont.38627:

bnei_else.38624:
bnei_cont.38625:

bnei_else.38622:
bnei_cont.38623:

bnei_else.38620:
bnei_cont.38621:

bnei_else.38616:
bnei_cont.38617:

bnei_else.38554:
	lw	%a0, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38636

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38637

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38637

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 4(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38637

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 5(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38637

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 6(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38637

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 7(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38637

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t8, 0

	nop
	nop
	addi	%v1, %s3, 0
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	j	bnei_cont.38637

bnei_else.38648:
bnei_cont.38649:

bnei_else.38646:
bnei_cont.38647:

bnei_else.38644:
bnei_cont.38645:

bnei_else.38642:
bnei_cont.38643:

bnei_else.38640:
bnei_cont.38641:

bnei_else.38638:
bnei_cont.38639:

bnei_else.38636:
bnei_cont.38637:
bnei_cont.38555:
	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%s3, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.38650

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.38651

	lw	%a2, 12(%a1)
	lw	%a0, 1(%t8)
	nop
	nop

	lw	%a3, 10(%a2)
	lw	%a0, 1(%a2)
	add	%at, %a0, %a1
	nop

	flw	%f2, 0(%a3)
	flw	%f16, 1(%a3)
	nop
	nop

	flw	%f18, 2(%a3)
	lw	%a1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.38653

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38655

	flw	%f17, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.38657

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38658

fbeq_else.38657:

fbeq_cont.38658:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38654

bnei_else.38659:

	flw	%f0, 2(%a1)
	nop
	fmul	%f1, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%a1)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.38661

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38662

fbgt_else.38661:

fbgt_cont.38662:

	lw	%a0, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38665

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%a1)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.38666

bnei_else.38665:

	flw	%f0, 4(%a1)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.38666:

bnei_else.38663:

bnei_cont.38664:
bnei_cont.38660:

bnei_else.38655:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38667

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38668

fbgt_else.38667:

fbgt_cont.38668:

	flw	%f0, 3(%a3)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38654

bnei_else.38669:

bnei_cont.38670:
bnei_cont.38656:

bnei_else.38653:

	flw	%f21, 1(%a1)
	flw	%f19, 1(%a3)
	fsub	%f0, %f0, %f2
	nop

	lw	%a0, 4(%a2)
	nop
	fmul	%f20, %f0, %f21
	nop

	flw	%f17, 1(%a0)
	nop
	fmul	%f0, %f20, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.38671

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38672

fbgt_else.38671:

fbgt_cont.38672:

	flw	%f0, 2(%a3)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38675

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38676

fbgt_else.38675:

fbgt_cont.38676:

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.38679

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38680

fbeq_else.38679:

fbeq_cont.38680:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38674

bnei_else.38681:

bnei_cont.38682:

bnei_else.38677:

bnei_cont.38678:

bnei_else.38673:

bnei_cont.38674:

	fsw	%f20, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.38684

bnei_else.38683:

	flw	%f22, 0(%a3)
	lw	%a0, 4(%a2)
	fsub	%f0, %f0, %f16
	nop

	flw	%f21, 0(%a0)
	nop
	fmul	%f20, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f20, %f22
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f21, fbgt_else.38685

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38686

fbgt_else.38685:

fbgt_cont.38686:

	flw	%f0, 2(%a3)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38689

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38690

fbgt_else.38689:

fbgt_cont.38690:

	nop
	nop
	nop
	fbne	%f23, %fzero, fbeq_else.38693

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38694

fbeq_else.38693:

fbeq_cont.38694:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38688

bnei_else.38695:

bnei_cont.38696:

bnei_else.38691:

bnei_cont.38692:

bnei_else.38687:

bnei_cont.38688:

	fsw	%f20, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.38698

bnei_else.38697:

	flw	%f18, 5(%a1)
	nop
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f1, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f1, %f22
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f21, fbgt_else.38699

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38700

fbgt_else.38699:

fbgt_cont.38700:

	nop
	nop
	fmul	%f0, %f1, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.38703

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38704

fbgt_else.38703:

fbgt_cont.38704:

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.38707

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38708

fbeq_else.38707:

fbeq_cont.38708:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38702

bnei_else.38709:

bnei_cont.38710:

bnei_else.38705:

bnei_cont.38706:

bnei_else.38701:

bnei_cont.38702:

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.38712

bnei_else.38711:

bnei_cont.38712:
bnei_cont.38698:
bnei_cont.38684:
bnei_cont.38654:

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38715

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38716

fbgt_else.38715:

fbgt_cont.38716:

	lw	%a0, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38652

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38652

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38652

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 4(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38652

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 5(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38652

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 6(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38652

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0

	nop
	nop
	addi	%v1, %s3, 0
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	j	bnei_cont.38652

bnei_else.38729:
bnei_cont.38730:

bnei_else.38727:
bnei_cont.38728:

bnei_else.38725:
bnei_cont.38726:

bnei_else.38723:
bnei_cont.38724:

bnei_else.38721:
bnei_cont.38722:

bnei_else.38719:
bnei_cont.38720:

bnei_else.38717:
bnei_cont.38718:

bnei_else.38713:
bnei_cont.38714:

bnei_else.38651:
	lw	%a0, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.38731

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38732

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38732

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 4(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38732

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 5(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38732

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	lw	%a0, 6(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.38732

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t8, 0

	nop
	nop
	addi	%v1, %s3, 0
	jal	solve_one_or_network_fast.2952

	nop
	nop
	nop
	j	bnei_cont.38732

bnei_else.38741:
bnei_cont.38742:

bnei_else.38739:
bnei_cont.38740:

bnei_else.38737:
bnei_cont.38738:

bnei_else.38735:
bnei_cont.38736:

bnei_else.38733:
bnei_cont.38734:

bnei_else.38731:
bnei_cont.38732:
bnei_cont.38652:
	nop
	nop
	addi	%v0, %s7, 1
	add	%ra, %zero, %t9

	nop
	nop
	addi	%a0, %t8, 0
	addi	%v1, %t7, 0

	nop
	nop
	nop
	j	trace_or_matrix_fast.2956

bnei_else.38650:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.38553:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

utexture.2971:
	lw	%a2, 0(%v0)
	lw	%a1, 8(%v0)
	add	%a0, %zero, %ra
	nop

	flw	%f0, 0(%a1)
	lw	%a1, 8(%v0)
	nop
	nop

	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a1)
	nop
	nop

	fsw	%f0, 146(%zero)
	lw	%a1, 8(%v0)
	nop
	nop

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.38969

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.38970

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.38971

	nop
	nop
	nop
	beqi	%a2, 4, bnei_else.38972

	nop
	nop
	add	%ra, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.38972:

	flw	%f0, 0(%a1)
	lw	%a1, 4(%v0)
	nop
	nop

	flw	%f0, 0(%a1)
	lw	%a1, 5(%v0)
	fsub	%f1, %f1, %f0
	nop

	flw	%f16, 464(%zero)
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f1, 2(%v1)
	flw	%f0, 2(%a1)
	fmul	%f19, %f1, %f0
	nop

	lw	%a1, 4(%v0)
	nop
	fsub	%f1, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fmul	%f18, %f1, %f0
	fmul	%f1, %f19, %f19

	nop
	nop
	fmul	%f0, %f18, %f18
	nop

	nop
	nop
	fadd	%f17, %f1, %f0
	fabs	%f0, %f19

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.38974

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.38975

fbgt_else.38974:

fbgt_cont.38975:

	flw	%f1, 463(%zero)
	nop
	nop
	j	bnei_cont.38977

bnei_else.38976:

	nop
	nop
	fabs	%f2, %f0
	nop

	nop
	nop
	nop
	fblt	%f2, %fzero, fbgt_else.38978

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.38979

fbgt_else.38978:

fbgt_cont.38979:

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_else.38980

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_else.38982

	flw	%f18, 479(%zero)
	flw	%f0, 461(%zero)
	fdiv	%f20, %f30, %f19
	nop

	nop
	nop
	fmul	%f21, %f20, %f20
	fmul	%f0, %f0, %f20

	nop
	nop
	fmul	%f2, %f21, %f21
	fmul	%f0, %f0, %f21

	flw	%f0, 460(%zero)
	nop
	fmul	%f19, %f2, %f2
	fsub	%f1, %f20, %f0

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f18, %f0
	j	fbgt_cont.38983

fbgt_else.38982:

	flw	%f0, 461(%zero)
	nop
	fdiv	%f20, %f1, %f0
	nop

	nop
	nop
	fmul	%f21, %f20, %f20
	fmul	%f0, %f0, %f20

	nop
	nop
	fmul	%f2, %f21, %f21
	fmul	%f0, %f0, %f21

	flw	%f0, 460(%zero)
	nop
	fmul	%f19, %f2, %f2
	fsub	%f1, %f20, %f0

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

fbgt_cont.38983:

	nop
	nop
	nop
	j	fbgt_cont.38981

bnei_else.38984:

bnei_cont.38985:

fbgt_else.38980:

	nop
	nop
	fmul	%f19, %f20, %f20
	fmul	%f0, %f0, %f2

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f0, %f0, %f20

	flw	%f0, 460(%zero)
	nop
	fsub	%f1, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.38981:

	flw	%f0, 453(%zero)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

bnei_cont.38977:

	flw	%f1, 1(%v1)
	flw	%f0, 1(%a1)
	fsub	%f18, %f1, %f0
	nop

	lw	%a1, 4(%v0)
	nop
	fsub	%f1, %f1, %f0
	nop

	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	fabs	%f0, %f17

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.38986

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.38987

fbgt_else.38986:

fbgt_cont.38987:

	flw	%f1, 463(%zero)
	nop
	nop
	j	bnei_cont.38989

bnei_else.38988:

	nop
	nop
	fabs	%f19, %f0
	nop

	nop
	nop
	nop
	fblt	%f19, %fzero, fbgt_else.38990

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.38991

fbgt_else.38990:

fbgt_cont.38991:

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_else.38992

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_else.38994

	flw	%f16, 479(%zero)
	flw	%f0, 461(%zero)
	fdiv	%f2, %f30, %f17
	nop

	nop
	nop
	fmul	%f20, %f2, %f2
	fmul	%f0, %f0, %f2

	nop
	nop
	fmul	%f19, %f20, %f20
	fmul	%f0, %f0, %f20

	flw	%f0, 460(%zero)
	nop
	fmul	%f17, %f19, %f19
	fsub	%f1, %f2, %f0

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f16, %f0
	j	fbgt_cont.38995

fbgt_else.38994:

	flw	%f0, 461(%zero)
	nop
	fdiv	%f2, %f1, %f0
	nop

	nop
	nop
	fmul	%f20, %f2, %f2
	fmul	%f0, %f0, %f2

	nop
	nop
	fmul	%f19, %f20, %f20
	fmul	%f0, %f0, %f20

	flw	%f0, 460(%zero)
	nop
	fmul	%f17, %f19, %f19
	fsub	%f1, %f2, %f0

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

fbgt_cont.38995:

	nop
	nop
	nop
	j	fbgt_cont.38993

bnei_else.38996:

bnei_cont.38997:

fbgt_else.38992:

	nop
	nop
	fmul	%f17, %f2, %f2
	fmul	%f0, %f0, %f19

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f2

	flw	%f0, 460(%zero)
	nop
	fsub	%f1, %f19, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.38993:

	flw	%f0, 453(%zero)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

bnei_cont.38989:

	flw	%f1, 452(%zero)
	nop
	fsub	%f17, %f1, %f0
	fsub	%f0, %f16, %f18

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	fsub	%f0, %f16, %f17

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.38998

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.38999

fbgt_else.38998:

fbgt_cont.38999:

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39001

bnei_else.39000:
bnei_cont.39001:

	flw	%f0, 450(%zero)
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	jr	%ra

bnei_else.38971:

	flw	%f0, 0(%a1)
	lw	%a1, 5(%v0)
	nop
	nop

	flw	%f1, 2(%v1)
	flw	%f0, 2(%a1)
	fsub	%f16, %f1, %f0
	nop

	flw	%f18, 494(%zero)
	flw	%f2, 493(%zero)
	fsub	%f0, %f1, %f0
	fmul	%f1, %f16, %f16

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f0, 449(%zero)
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

	nop
	nop
	floor	%f0, %f1
	nop

	flw	%f0, 453(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f17, %f0
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.39003

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39004

	flw	%f1, 480(%zero)
	nop
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.39004

fbgt_else.39027:
fbgt_cont.39028:

fbgt_else.39025:
fbgt_cont.39026:

fbgt_else.39023:
fbgt_cont.39024:

fbgt_else.39021:
fbgt_cont.39022:

fbgt_else.39019:
fbgt_cont.39020:

fbgt_else.39017:
fbgt_cont.39018:

fbgt_else.39015:
fbgt_cont.39016:

fbgt_else.39013:
fbgt_cont.39014:

fbgt_else.39011:
fbgt_cont.39012:

fbgt_else.39009:
fbgt_cont.39010:

fbgt_else.39007:
fbgt_cont.39008:

fbgt_else.39005:
fbgt_cont.39006:

fbgt_else.39003:

fbgt_cont.39004:

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.39031

	flw	%f16, 495(%zero)
	nop
	fsub	%f0, %f17, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f17, %f0
	j	fbgt_cont.39030

fbgt_else.39031:

	nop
	nop
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f17, %f0
	nop

fbgt_cont.39032:

fbgt_else.39029:
fbgt_cont.39030:

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.39034

fbgt_else.39033:

fbgt_cont.39034:

	nop
	nop
	fsub	%f17, %f17, %f18
	j	fbgt_cont.39036

fbgt_else.39035:
fbgt_cont.39036:

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.39037

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39039

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.39038

bnei_else.39039:

bnei_cont.39040:

fbgt_else.39037:
fbgt_cont.39038:

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.39042

fbgt_else.39041:
fbgt_cont.39042:

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.39043

	flw	%f0, 473(%zero)
	nop
	fmul	%f17, %f17, %f17
	nop

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.39044

fbgt_else.39043:

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f18, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.39044:

	nop
	nop
	nop
	j	bnei_cont.39046

bnei_else.39045:

bnei_cont.39046:

	nop
	nop
	fmul	%f0, %f16, %f1
	nop

	fsw	%f0, 146(%zero)
	nop
	fsub	%f0, %f30, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	add	%ra, %zero, %a0

	fsw	%f0, 147(%zero)
	nop
	nop
	jr	%ra

bnei_else.38970:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	nop
	nop

	flw	%f18, 494(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.39048

	nop
	nop
	add	%a1, %zero, %k1
	j	fbgt_cont.39049

fbgt_else.39048:

fbgt_cont.39049:
	flw	%f2, 493(%zero)
	nop
	fabs	%f17, %f0
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.39050

	flw	%f1, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_cont.39051

	flw	%f1, 480(%zero)
	nop
	fmov	%f0, %f17
	jal	reduction_2pi_sub1.2626

	nop
	nop
	fmov	%f1, %f0
	j	fbgt_cont.39051

fbgt_else.39074:
fbgt_cont.39075:

fbgt_else.39072:
fbgt_cont.39073:

fbgt_else.39070:
fbgt_cont.39071:

fbgt_else.39068:
fbgt_cont.39069:

fbgt_else.39066:
fbgt_cont.39067:

fbgt_else.39064:
fbgt_cont.39065:

fbgt_else.39062:
fbgt_cont.39063:

fbgt_else.39060:
fbgt_cont.39061:

fbgt_else.39058:
fbgt_cont.39059:

fbgt_else.39056:
fbgt_cont.39057:

fbgt_else.39054:
fbgt_cont.39055:

fbgt_else.39052:
fbgt_cont.39053:

fbgt_else.39050:
	nop
	nop
	fmov	%f1, %f2
	nop

fbgt_cont.39051:
	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.39076

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.39078

	flw	%f16, 495(%zero)
	nop
	fsub	%f0, %f17, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f16
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f17, %f0
	j	fbgt_cont.39077

fbgt_else.39078:
	flw	%f0, 495(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	fmov	%f0, %f17

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f17, %f0
	nop

fbgt_cont.39079:
	nop
	nop
	nop
	j	fbgt_cont.39077

fbgt_else.39076:
fbgt_cont.39077:
	nop
	nop
	nop
	fblt	%f17, %f18, fbgt_else.39080

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39082

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.39081

bnei_else.39082:

bnei_cont.39083:

fbgt_else.39080:
fbgt_cont.39081:
	nop
	nop
	nop
	fblt	%f17, %f18, fbgt_else.39084

	nop
	nop
	fsub	%f17, %f17, %f18
	j	fbgt_cont.39085

fbgt_else.39084:
fbgt_cont.39085:
	flw	%f1, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.39086

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.39087

fbgt_else.39086:
fbgt_cont.39087:
	flw	%f0, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.39088

	flw	%f0, 477(%zero)
	nop
	fmul	%f18, %f17, %f17
	nop

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f0, %f0, %f17

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.39089

fbgt_else.39088:
	nop
	nop
	fsub	%f0, %f1, %f17
	nop

	flw	%f0, 473(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.39089:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39090

	nop
	nop
	nop
	j	bnei_cont.39091

bnei_else.39090:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.39091:
	flw	%f1, 451(%zero)
	nop
	fmul	%f16, %f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f16
	nop

	fsw	%f0, 145(%zero)
	nop
	fsub	%f0, %f30, %f16
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	add	%ra, %zero, %a0

	fsw	%f0, 146(%zero)
	nop
	nop
	jr	%ra

bnei_else.38969:
	flw	%f1, 0(%v1)
	lw	%a1, 5(%v0)
	nop
	nop

	flw	%f0, 0(%a1)
	flw	%f18, 447(%zero)
	nop
	nop

	flw	%f17, 446(%zero)
	flw	%f16, 449(%zero)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.39093

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.39094

fbgt_else.39093:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.39094:
	flw	%f1, 2(%v1)
	lw	%a2, 5(%v0)
	nop
	nop

	flw	%f0, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.39095

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.39096

fbgt_else.39095:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.39096:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39097

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.39099

	flw	%f0, 451(%zero)
	nop
	nop
	j	bnei_cont.39098

bnei_else.39099:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.39100:
	nop
	nop
	nop
	j	bnei_cont.39098

bnei_else.39097:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.39101

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39102

bnei_else.39101:
	flw	%f0, 451(%zero)
	nop
	nop
	nop

bnei_cont.39102:
bnei_cont.39098:
	fsw	%f0, 146(%zero)
	nop
	add	%ra, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

trace_reflections.2978:
	sw	%v0, 0(%sp)
	nop
	fmov	%f25, %f0
	fmov	%f26, %f1

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%t2, 2(%sp)
	nop
	nop
	nop

	sw	%t1, 3(%sp)
	nop
	nop
	nop

	sw	%t0, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.39203

	lw	%t2, 254(%v0)
	flw	%f0, 445(%zero)
	addi	%sp, %sp, 6
	nop

	lw	%t0, 1(%t2)
	fsw	%f0, 137(%zero)
	nop
	nop

	lw	%t1, 134(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%v1, %t1, 0
	jal	trace_or_matrix_fast.2956

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39204

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39205

fbgt_else.39204:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39205:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39206

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.39208

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.39207

fbgt_else.39208:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39209:
	nop
	nop
	nop
	j	bnei_cont.39207

bnei_else.39206:

bnei_cont.39207:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39210

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%a0, 136(%zero)
	nop
	sll	%a1, %a0, 2
	nop

	lw	%a0, 0(%t2)
	nop
	add	%a1, %a1, %a0
	nop

	nop
	nop
	nop
	bne	%a1, %a0, bnei_cont.39211

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.39214

	nop
	nop
	nop
	j	bnei_cont.39211

bnei_else.39214:
	lw	%a0, 0(%t0)
	flw	%f1, 142(%zero)
	nop
	nop

	flw	%f0, 0(%a0)
	flw	%f18, 2(%t2)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 1(%a0)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	lw	%a1, 0(%t0)
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 1(%sp)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	fmul	%f0, %f18, %f25

	flw	%f1, 0(%a0)
	flw	%f0, 0(%a1)
	fmul	%f17, %f0, %f1
	nop

	flw	%f1, 1(%a0)
	flw	%f0, 1(%a1)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fmul	%f16, %f18, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f17, fbgt_else.39216

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39217

fbgt_else.39216:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39217:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39218

	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39219

bnei_else.39218:
bnei_cont.39219:
	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.39220

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39221

fbgt_else.39220:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39221:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.39211

	nop
	nop
	fmul	%f0, %f16, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	flw	%f0, 151(%zero)
	nop
	fmul	%f1, %f0, %f26
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39211

bnei_else.39222:
bnei_cont.39223:
bnei_cont.39215:

beq_else.39212:
beq_cont.39213:

bnei_else.39210:
bnei_cont.39211:
	lw	%a0, 0(%sp)
	lw	%t2, 2(%sp)
	fmov	%f1, %f26
	fmov	%f0, %f25

	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	addi	%v0, %a0, -1
	nop

	lw	%ra, 5(%sp)
	lw	%v1, 1(%sp)
	nop
	j	trace_reflections.2978

bgti_else.39203:
	nop
	nop
	nop
	jr	%ra

trace_ray.2983:
	fsw	%f1, 0(%sp)
	nop
	fmov	%f3, %f0
	add	%a1, %zero, %v1

	sw	%v0, 1(%sp)
	nop
	addi	%at, %zero, 4
	nop

	sw	%a1, 2(%sp)
	nop
	nop
	nop

	sw	%a0, 3(%sp)
	nop
	nop
	nop

	sw	%t0, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.39477

	lw	%a0, 2(%a0)
	flw	%f0, 445(%zero)
	nop
	nop

	sw	%a0, 6(%sp)
	fsw	%f0, 137(%zero)
	addi	%a0, %a1, 0
	nop

	lw	%v1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	jal	trace_or_matrix.2942

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -8
	nop

	fsw	%f1, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39478

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39479

fbgt_else.39478:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39479:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39480

	flw	%f1, 444(%zero)
	flw	%f0, 8(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39482

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.39481

fbgt_else.39482:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39483:
	nop
	nop
	nop
	j	bnei_cont.39481

bnei_else.39480:

bnei_cont.39481:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39484

	lw	%a3, 141(%zero)
	nop
	nop
	nop

	lw	%t0, 12(%a3)
	nop
	nop
	nop

	lw	%a0, 2(%t0)
	nop
	nop
	nop

	sw	%a0, 9(%sp)
	lw	%a0, 7(%t0)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 1(%t0)
	nop
	nop

	nop
	nop
	fmul	%f25, %f0, %f3
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.39485

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.39487

	flw	%f1, 138(%zero)
	lw	%a0, 5(%t0)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%t0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f19, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	lw	%a0, 5(%t0)
	fsub	%f17, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 4(%t0)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%t0)
	fsub	%f20, %f1, %f0
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%t0)
	fmul	%f21, %f19, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 3(%t0)
	fmul	%f2, %f17, %f0
	nop

	nop
	nop
	fmul	%f16, %f20, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39489

	lw	%a0, 9(%t0)
	flw	%f18, 473(%zero)
	nop
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 9(%t0)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%t0)
	fmul	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	lw	%a0, 9(%t0)
	nop
	fmul	%f1, %f19, %f0
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 9(%t0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 9(%t0)
	nop
	fmul	%f1, %f19, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39490

bnei_else.39489:
	fsw	%f21, 142(%zero)
	nop
	nop
	nop

	fsw	%f2, 143(%zero)
	nop
	nop
	nop

	fsw	%f16, 144(%zero)
	nop
	nop
	nop

bnei_cont.39490:
	lw	%a1, 6(%t0)
	flw	%f18, 142(%zero)
	nop
	nop

	flw	%f17, 143(%zero)
	flw	%f16, 144(%zero)
	fmul	%f1, %f18, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.39491

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.39492

fbeq_else.39491:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.39492:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39493

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39494

bnei_else.39493:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39495

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39496

bnei_else.39495:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.39496:
bnei_cont.39494:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39486

bnei_else.39487:
	lw	%a0, 4(%t0)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%t0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%t0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.39488:
	nop
	nop
	nop
	j	bnei_cont.39486

bnei_else.39485:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	lw	%a0, 2(%sp)
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a0, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.39497

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.39498

fbeq_else.39497:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.39498:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39499

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39500

bnei_else.39499:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39501

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39502

fbgt_else.39501:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39502:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39503

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39504

bnei_else.39503:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.39504:
bnei_cont.39500:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.39486:
	flw	%f26, 138(%zero)
	nop
	addi	%v0, %t0, 0
	addi	%sp, %sp, 10

	fsw	%f26, 159(%zero)
	nop
	nop
	nop

	flw	%f27, 139(%zero)
	nop
	nop
	nop

	fsw	%f27, 160(%zero)
	nop
	nop
	nop

	flw	%f28, 140(%zero)
	nop
	nop
	nop

	fsw	%f28, 161(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 138
	jal	utexture.2971

	lw	%a0, 136(%zero)
	flw	%f0, 473(%zero)
	addi	%sp, %sp, -10
	sll	%a1, %a3, 2

	lw	%a0, 6(%sp)
	lw	%a2, 1(%sp)
	add	%a1, %a1, %a0
	nop

	nop
	nop
	add	%at, %a0, %a2
	nop

	sw	%a1, 0(%at)
	lw	%a1, 3(%sp)
	nop
	nop

	lw	%a0, 1(%a1)
	lw	%a1, 3(%a1)
	nop
	nop

	nop
	nop
	add	%at, %a0, %a2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f26, 0(%a0)
	nop
	nop
	nop

	fsw	%f27, 1(%a0)
	nop
	nop
	nop

	fsw	%f28, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 7(%t0)
	nop
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.39505

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39506

fbgt_else.39505:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39506:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39507

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	sw	%zero, 0(%at)
	nop
	nop
	j	bnei_cont.39508

bnei_else.39507:
	lw	%a2, 1(%sp)
	flw	%f0, 145(%zero)
	nop
	nop

	lw	%a1, 3(%sp)
	nop
	add	%at, %a1, %a2
	nop

	sw	%k1, 0(%at)
	lw	%a0, 4(%a1)
	nop
	nop

	nop
	nop
	add	%at, %a0, %a2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 146(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 147(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	flw	%f0, 443(%zero)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	fmul	%f1, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%a0)
	nop
	nop
	nop

	flw	%f0, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%a0)
	flw	%f0, 142(%zero)
	nop
	nop

	lw	%a0, 7(%a1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 143(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 144(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.39508:
	flw	%f19, 442(%zero)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	nop

	flw	%f16, 0(%a0)
	flw	%f5, 142(%zero)
	nop
	nop

	flw	%f17, 1(%a0)
	flw	%f4, 143(%zero)
	fmul	%f1, %f16, %f5
	nop

	flw	%f18, 2(%a0)
	flw	%f29, 144(%zero)
	fmul	%f0, %f17, %f4
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f29

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f19, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f5
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 0(%a0)
	nop
	fmul	%f0, %f1, %f4
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 1(%a0)
	nop
	fmul	%f0, %f1, %f29
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 7(%t0)
	nop
	nop
	nop

	flw	%f0, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f3, %f0
	nop

	fsw	%f0, 10(%sp)
	nop
	nop
	nop

	lw	%v1, 7(%sp)
	nop
	addi	%sp, %sp, 11
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	addi	%sp, %sp, -11
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.39509

	nop
	nop
	nop
	j	bnei_cont.39510

bnei_else.39509:
	flw	%f19, 78(%zero)
	flw	%f18, 79(%zero)
	nop
	nop

	flw	%f17, 80(%zero)
	lw	%a0, 2(%sp)
	fmul	%f1, %f5, %f19
	fmul	%f0, %f4, %f18

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f29, %f17

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	fmul	%f16, %f0, %f25
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f17, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f16, fbgt_else.39511

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39512

fbgt_else.39511:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39512:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39513

	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f1, 152(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f1, 153(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39514

bnei_else.39513:
bnei_cont.39514:
	nop
	nop
	nop
	fblt	%fzero, %f17, fbgt_else.39515

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39516

fbgt_else.39515:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39516:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39517

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	flw	%f0, 10(%sp)
	nop
	fmul	%f1, %f0, %f0
	nop

	flw	%f0, 151(%zero)
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.39518

bnei_else.39517:
bnei_cont.39518:
bnei_cont.39510:
	fsw	%f26, 162(%zero)
	nop
	addi	%sp, %sp, 11
	nop

	fsw	%f27, 163(%zero)
	nop
	nop
	nop

	fsw	%f28, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	addi	%v0, %zero, 138
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	lw	%a0, 434(%zero)
	nop
	addi	%sp, %sp, -11
	fmov	%f0, %f25

	flw	%f1, 10(%sp)
	lw	%v1, 2(%sp)
	addi	%v0, %a0, -1
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	trace_reflections.2978

	flw	%f0, 441(%zero)
	nop
	addi	%sp, %sp, -11
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.39519

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39520

fbgt_else.39519:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39520:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39521

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 4, bgti_else.39522

	nop
	nop
	nop
	j	bgti_cont.39523

bgti_else.39522:
	lw	%a0, 6(%sp)
	nop
	addi	%a2, %a0, 1
	addi	%a1, %zero, -1

	nop
	nop
	add	%at, %a0, %a2
	nop

	sw	%a1, 0(%at)
	nop
	nop
	nop

bgti_cont.39523:
	lw	%a0, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.39524

	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.39524:
	lw	%a0, 7(%t0)
	flw	%f16, 0(%sp)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 1(%sp)
	nop
	nop

	flw	%f1, 8(%sp)
	lw	%t0, 4(%sp)
	fsub	%f0, %f30, %f0
	addi	%v0, %a0, 1

	lw	%ra, 5(%sp)
	lw	%a0, 3(%sp)
	fmul	%f0, %f3, %f0
	fadd	%f1, %f16, %f1

	lw	%v1, 2(%sp)
	nop
	nop
	j	trace_ray.2983

bnei_else.39521:

	nop
	nop
	nop
	jr	%ra

bnei_else.39484:
	lw	%a1, 6(%sp)
	lw	%a0, 1(%sp)
	addi	%a2, %zero, -1
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	sw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39527

	lw	%a0, 2(%sp)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.39528

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39529

fbgt_else.39528:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39529:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39530

	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	fmul	%f0, %f1, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f0, 81(%zero)
	nop
	fmul	%f1, %f0, %f3
	nop

	flw	%f0, 151(%zero)
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	jr	%ra

bnei_else.39530:
	lw	%t0, 4(%sp)
	lw	%ra, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.39527:

	nop
	nop
	nop
	jr	%ra

bgt_else.39477:

trace_diffuse_ray.2989:
	flw	%f0, 445(%zero)
	nop
	fmov	%f25, %f0
	add	%a0, %zero, %v0

	sw	%a0, 0(%sp)
	fsw	%f0, 137(%zero)
	nop
	nop

	sw	%ra, 1(%sp)
	lw	%v1, 134(%zero)
	addi	%v0, %zero, 0
	nop

	sw	%v1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 3
	jal	trace_or_matrix_fast.2956

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.39669

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39670

fbgt_else.39669:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39670:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39671

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.39673

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.39672

fbgt_else.39673:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39674:
	nop
	nop
	nop
	j	bnei_cont.39672

bnei_else.39671:

bnei_cont.39672:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39675

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%s7, 12(%a0)
	lw	%a0, 0(%sp)
	nop
	nop

	lw	%a2, 0(%a0)
	lw	%a0, 1(%s7)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.39676

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.39678

	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	fsub	%f17, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	fsub	%f20, %f1, %f0
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%s7)
	fmul	%f21, %f18, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 3(%s7)
	fmul	%f2, %f17, %f0
	nop

	nop
	nop
	fmul	%f16, %f20, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39680

	lw	%a0, 9(%s7)
	flw	%f19, 473(%zero)
	nop
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%s7)
	fmul	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39681

bnei_else.39680:
	fsw	%f21, 142(%zero)
	nop
	nop
	nop

	fsw	%f2, 143(%zero)
	nop
	nop
	nop

	fsw	%f16, 144(%zero)
	nop
	nop
	nop

bnei_cont.39681:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	nop
	nop

	flw	%f17, 143(%zero)
	flw	%f16, 144(%zero)
	fmul	%f1, %f18, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.39682

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.39683

fbeq_else.39682:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.39683:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39684

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39685

bnei_else.39684:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.39686

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.39687

bnei_else.39686:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.39687:
bnei_cont.39685:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.39677

bnei_else.39678:
	lw	%a0, 4(%s7)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%s7)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.39679:
	nop
	nop
	nop
	j	bnei_cont.39677

bnei_else.39676:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a2, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.39688

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.39689

fbeq_else.39688:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.39689:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39690

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.39691

bnei_else.39690:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39692

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39693

fbgt_else.39692:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39693:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39694

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.39695

bnei_else.39694:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.39695:
bnei_cont.39691:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.39677:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	utexture.2971

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 0

	lw	%v1, 2(%sp)
	nop
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.39696

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.39696:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.39698

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.39699

fbgt_else.39698:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.39699:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39700

	nop
	nop
	nop
	j	bnei_cont.39701

bnei_else.39700:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.39701:
	lw	%a0, 7(%s7)
	lw	%ra, 1(%sp)
	fmul	%f1, %f25, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	jr	%ra

bnei_else.39675:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

iter_trace_diffuse_rays.2992:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%a0, 2(%sp)
	nop
	nop
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	sw	%t1, 4(%sp)
	nop
	nop
	nop

	sw	%t0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.40711

	flw	%f25, 0(%v1)
	flw	%f26, 1(%v1)
	add	%at, %v0, %a1
	nop

	lw	%t0, 0(%at)
	flw	%f27, 2(%v1)
	nop
	nop

	lw	%a0, 0(%t0)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f27
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.40712

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40713

fbgt_else.40712:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40713:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40714

	lw	%a0, 3(%sp)
	flw	%f0, 440(%zero)
	nop
	nop

	lw	%a0, 0(%sp)
	flw	%f0, 445(%zero)
	addi	%a1, %a0, 1
	fdiv	%f28, %f1, %f0

	fsw	%f0, 137(%zero)
	nop
	add	%at, %a0, %a1
	nop

	lw	%t0, 0(%at)
	lw	%t1, 134(%zero)
	nop
	nop

	lw	%s3, 0(%t1)
	nop
	nop
	nop

	lw	%a2, 0(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.40716

	nop
	nop
	nop
	beqi	%a2, 99, bnei_else.40718

	lw	%a3, 12(%a2)
	lw	%a0, 1(%t0)
	nop
	nop

	lw	%a1, 10(%a3)
	lw	%a0, 1(%a3)
	add	%at, %a0, %a2
	nop

	flw	%f20, 0(%a1)
	flw	%f16, 1(%a1)
	nop
	nop

	flw	%f18, 2(%a1)
	lw	%a2, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.40720

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.40722

	flw	%f17, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.40724

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40725

fbeq_else.40724:

fbeq_cont.40725:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40721

bnei_else.40726:

	flw	%f0, 2(%a2)
	nop
	fmul	%f1, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%a2)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%a1)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40728

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40729

fbgt_else.40728:

fbgt_cont.40729:

	lw	%a0, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40732

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%a2)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.40733

bnei_else.40732:

	flw	%f0, 4(%a2)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.40733:

bnei_else.40730:

bnei_cont.40731:
bnei_cont.40727:

bnei_else.40722:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.40734

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40735

fbgt_else.40734:

fbgt_cont.40735:

	flw	%f0, 3(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.40721

bnei_else.40736:

bnei_cont.40737:
bnei_cont.40723:

bnei_else.40720:
	lw	%a1, 0(%t0)
	flw	%f0, 0(%a2)
	nop
	nop

	flw	%f21, 1(%a2)
	flw	%f19, 1(%a1)
	fsub	%f0, %f0, %f20
	nop

	lw	%a0, 4(%a3)
	nop
	fmul	%f2, %f0, %f21
	nop

	flw	%f17, 1(%a0)
	nop
	fmul	%f0, %f2, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.40738

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40739

fbgt_else.40738:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40739:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40740

	flw	%f0, 2(%a1)
	lw	%a0, 4(%a3)
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40742

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40743

fbgt_else.40742:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40743:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40744

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.40746

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40747

fbeq_else.40746:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40747:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40748

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40741

bnei_else.40748:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40749:
	nop
	nop
	nop
	j	bnei_cont.40741

bnei_else.40744:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40745:
	nop
	nop
	nop
	j	bnei_cont.40741

bnei_else.40740:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40741:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40750

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.40751

bnei_else.40750:
	flw	%f0, 2(%a2)
	flw	%f22, 3(%a2)
	nop
	nop

	flw	%f21, 0(%a1)
	lw	%a0, 4(%a3)
	fsub	%f0, %f0, %f16
	nop

	flw	%f2, 0(%a0)
	nop
	fmul	%f23, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f23, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40752

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40753

fbgt_else.40752:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40753:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40754

	flw	%f0, 2(%a1)
	lw	%a0, 4(%a3)
	nop
	nop

	nop
	nop
	fmul	%f0, %f23, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40756

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40757

fbgt_else.40756:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40757:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40758

	nop
	nop
	nop
	fbne	%f22, %fzero, fbeq_else.40760

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40761

fbeq_else.40760:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40761:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40762

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40755

bnei_else.40762:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40763:
	nop
	nop
	nop
	j	bnei_cont.40755

bnei_else.40758:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40759:
	nop
	nop
	nop
	j	bnei_cont.40755

bnei_else.40754:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40755:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40764

	fsw	%f23, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.40765

bnei_else.40764:
	flw	%f0, 4(%a2)
	nop
	nop
	nop

	flw	%f18, 5(%a2)
	nop
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f1, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f1, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40766

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40767

fbgt_else.40766:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40767:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40768

	nop
	nop
	fmul	%f0, %f1, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.40770

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40771

fbgt_else.40770:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40771:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40772

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.40774

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40775

fbeq_else.40774:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40775:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40776

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40769

bnei_else.40776:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40777:
	nop
	nop
	nop
	j	bnei_cont.40769

bnei_else.40772:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40773:
	nop
	nop
	nop
	j	bnei_cont.40769

bnei_else.40768:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40769:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40778

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.40779

bnei_else.40778:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40779:
bnei_cont.40765:
bnei_cont.40751:
bnei_cont.40721:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.40719

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40782

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40783

fbgt_else.40782:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40783:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.40719

	lw	%a0, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40719

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 2(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40719

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 3(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40719

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 4(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40719

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 5

	nop
	nop
	addi	%a0, %t0, 0
	addi	%v1, %s3, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2952

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.40719

bnei_else.40792:
bnei_cont.40793:

bnei_else.40790:
bnei_cont.40791:

bnei_else.40788:
bnei_cont.40789:

bnei_else.40786:
bnei_cont.40787:

bnei_else.40784:
bnei_cont.40785:

bnei_else.40780:
bnei_cont.40781:

bnei_else.40718:

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.40794

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 2(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40795

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 3(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40795

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 4(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40795

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 5

	nop
	nop
	addi	%a0, %t0, 0
	addi	%v1, %s3, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2952

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.40795

bnei_else.40800:
bnei_cont.40801:

bnei_else.40798:
bnei_cont.40799:

bnei_else.40796:
bnei_cont.40797:

bnei_else.40794:
bnei_cont.40795:
bnei_cont.40719:
	nop
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2956

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.40717

bnei_else.40716:
bnei_cont.40717:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40802

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40803

fbgt_else.40802:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40803:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40804

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40806

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40805

fbgt_else.40806:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40807:
	nop
	nop
	nop
	j	bnei_cont.40805

bnei_else.40804:

bnei_cont.40805:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.40715

	lw	%a0, 141(%zero)
	lw	%a2, 0(%t0)
	nop
	nop

	lw	%s7, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.40810

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.40812

	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%s7)
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 3(%s7)
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40814

	lw	%a0, 9(%s7)
	flw	%f2, 473(%zero)
	nop
	nop

	flw	%f16, 2(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	flw	%f20, 1(%a0)
	lw	%a0, 9(%s7)
	fmul	%f1, %f19, %f16
	nop

	nop
	nop
	fmul	%f0, %f22, %f20
	nop

	flw	%f16, 0(%a0)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40815

bnei_else.40814:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.40815:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	nop
	nop

	flw	%f17, 143(%zero)
	flw	%f16, 144(%zero)
	fmul	%f1, %f18, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.40816

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40817

fbeq_else.40816:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40817:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40818

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40819

bnei_else.40818:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40820

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40821

bnei_else.40820:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.40821:
bnei_cont.40819:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40811

bnei_else.40812:
	lw	%a0, 4(%s7)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%s7)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.40813:
	nop
	nop
	nop
	j	bnei_cont.40811

bnei_else.40810:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a2, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.40822

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40823

fbeq_else.40822:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40823:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40824

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.40825

bnei_else.40824:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40826

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40827

fbgt_else.40826:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40827:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40828

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40829

bnei_else.40828:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.40829:
bnei_cont.40825:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.40811:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	utexture.2971

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %t1, 0

	nop
	nop
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40830

	nop
	nop
	nop
	j	bnei_cont.40715

bnei_else.40830:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40832

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40833

fbgt_else.40832:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40833:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40834

	nop
	nop
	nop
	j	bnei_cont.40835

bnei_else.40834:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.40835:
	lw	%a0, 7(%s7)
	nop
	fmul	%f1, %f28, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.40831:
	nop
	nop
	nop
	j	bnei_cont.40715

bnei_else.40808:
bnei_cont.40809:

bnei_else.40714:
	flw	%f0, 439(%zero)
	nop
	nop
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f28, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t1, 134(%zero)
	nop
	nop
	nop

	lw	%s3, 0(%t1)
	nop
	nop
	nop

	lw	%a2, 0(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.40836

	nop
	nop
	nop
	beqi	%a2, 99, bnei_else.40838

	lw	%a3, 12(%a2)
	lw	%a0, 1(%t0)
	nop
	nop

	lw	%a1, 10(%a3)
	lw	%a0, 1(%a3)
	add	%at, %a0, %a2
	nop

	flw	%f20, 0(%a1)
	flw	%f16, 1(%a1)
	nop
	nop

	flw	%f18, 2(%a1)
	lw	%a2, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.40840

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.40842

	flw	%f17, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.40844

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40845

fbeq_else.40844:

fbeq_cont.40845:

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40841

bnei_else.40846:

	flw	%f0, 2(%a2)
	nop
	fmul	%f1, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 3(%a2)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%a1)
	nop
	fadd	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f16, %f16
	fmul	%f0, %f17, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40848

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40849

fbgt_else.40848:

fbgt_cont.40849:

	lw	%a0, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40852

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%a2)
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.40853

bnei_else.40852:

	flw	%f0, 4(%a2)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.40853:

bnei_else.40850:

bnei_cont.40851:
bnei_cont.40847:

bnei_else.40842:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.40854

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40855

fbgt_else.40854:

fbgt_cont.40855:

	flw	%f0, 3(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.40841

bnei_else.40856:

bnei_cont.40857:
bnei_cont.40843:

bnei_else.40840:
	lw	%a1, 0(%t0)
	flw	%f0, 0(%a2)
	nop
	nop

	flw	%f21, 1(%a2)
	flw	%f19, 1(%a1)
	fsub	%f0, %f0, %f20
	nop

	lw	%a0, 4(%a3)
	nop
	fmul	%f2, %f0, %f21
	nop

	flw	%f17, 1(%a0)
	nop
	fmul	%f0, %f2, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.40858

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40859

fbgt_else.40858:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40859:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40860

	flw	%f0, 2(%a1)
	lw	%a0, 4(%a3)
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40862

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40863

fbgt_else.40862:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40863:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40864

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.40866

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40867

fbeq_else.40866:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40867:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40868

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40861

bnei_else.40868:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40869:
	nop
	nop
	nop
	j	bnei_cont.40861

bnei_else.40864:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40865:
	nop
	nop
	nop
	j	bnei_cont.40861

bnei_else.40860:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40861:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40870

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.40871

bnei_else.40870:
	flw	%f0, 2(%a2)
	flw	%f22, 3(%a2)
	nop
	nop

	flw	%f21, 0(%a1)
	lw	%a0, 4(%a3)
	fsub	%f0, %f0, %f16
	nop

	flw	%f2, 0(%a0)
	nop
	fmul	%f23, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f23, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40872

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40873

fbgt_else.40872:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40873:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40874

	flw	%f0, 2(%a1)
	lw	%a0, 4(%a3)
	nop
	nop

	nop
	nop
	fmul	%f0, %f23, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40876

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40877

fbgt_else.40876:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40877:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40878

	nop
	nop
	nop
	fbne	%f22, %fzero, fbeq_else.40880

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40881

fbeq_else.40880:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40881:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40882

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40875

bnei_else.40882:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40883:
	nop
	nop
	nop
	j	bnei_cont.40875

bnei_else.40878:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40879:
	nop
	nop
	nop
	j	bnei_cont.40875

bnei_else.40874:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40875:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40884

	fsw	%f23, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.40885

bnei_else.40884:
	flw	%f0, 4(%a2)
	nop
	nop
	nop

	flw	%f18, 5(%a2)
	nop
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f1, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f1, %f21
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40886

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40887

fbgt_else.40886:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40887:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40888

	nop
	nop
	fmul	%f0, %f1, %f19
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.40890

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40891

fbgt_else.40890:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40891:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40892

	nop
	nop
	nop
	fbne	%f18, %fzero, fbeq_else.40894

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40895

fbeq_else.40894:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40895:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40896

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40889

bnei_else.40896:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40897:
	nop
	nop
	nop
	j	bnei_cont.40889

bnei_else.40892:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40893:
	nop
	nop
	nop
	j	bnei_cont.40889

bnei_else.40888:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40889:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40898

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.40899

bnei_else.40898:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.40899:
bnei_cont.40885:
bnei_cont.40871:
bnei_cont.40841:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.40839

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40902

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40903

fbgt_else.40902:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40903:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.40839

	lw	%a0, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40839

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 2(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40839

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 3(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40839

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 4(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40839

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 5

	nop
	nop
	addi	%a0, %t0, 0
	addi	%v1, %s3, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2952

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.40839

bnei_else.40912:
bnei_cont.40913:

bnei_else.40910:
bnei_cont.40911:

bnei_else.40908:
bnei_cont.40909:

bnei_else.40906:
bnei_cont.40907:

bnei_else.40904:
bnei_cont.40905:

bnei_else.40900:
bnei_cont.40901:

bnei_else.40838:

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.40914

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 2(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40915

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 3(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40915

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	lw	%a0, 4(%s3)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.40915

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_each_element_fast.2948

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 5

	nop
	nop
	addi	%a0, %t0, 0
	addi	%v1, %s3, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	solve_one_or_network_fast.2952

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.40915

bnei_else.40920:
bnei_cont.40921:

bnei_else.40918:
bnei_cont.40919:

bnei_else.40916:
bnei_cont.40917:

bnei_else.40914:
bnei_cont.40915:
bnei_cont.40839:
	nop
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2956

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.40837

bnei_else.40836:
bnei_cont.40837:
	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40922

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40923

fbgt_else.40922:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40923:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40924

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40926

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40925

fbgt_else.40926:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40927:
	nop
	nop
	nop
	j	bnei_cont.40925

bnei_else.40924:

bnei_cont.40925:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40928

	lw	%a0, 141(%zero)
	lw	%a2, 0(%t0)
	nop
	nop

	lw	%s7, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.40930

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.40932

	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	fsub	%f19, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	fsub	%f22, %f1, %f0
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%s7)
	fmul	%f23, %f18, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 3(%s7)
	fmul	%f21, %f19, %f0
	nop

	nop
	nop
	fmul	%f17, %f22, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40934

	lw	%a0, 9(%s7)
	flw	%f2, 473(%zero)
	nop
	nop

	flw	%f16, 2(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	flw	%f20, 1(%a0)
	lw	%a0, 9(%s7)
	fmul	%f1, %f19, %f16
	nop

	nop
	nop
	fmul	%f0, %f22, %f20
	nop

	flw	%f16, 0(%a0)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f23, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f22, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f18, %f20

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f19, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40935

bnei_else.40934:
	fsw	%f23, 142(%zero)
	nop
	nop
	nop

	fsw	%f21, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.40935:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	nop
	nop

	flw	%f17, 143(%zero)
	flw	%f16, 144(%zero)
	fmul	%f1, %f18, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.40936

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40937

fbeq_else.40936:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40937:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40938

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40939

bnei_else.40938:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40940

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40941

bnei_else.40940:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.40941:
bnei_cont.40939:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40931

bnei_else.40932:
	lw	%a0, 4(%s7)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%s7)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.40933:
	nop
	nop
	nop
	j	bnei_cont.40931

bnei_else.40930:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a2, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.40942

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40943

fbeq_else.40942:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40943:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40944

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.40945

bnei_else.40944:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40946

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40947

fbgt_else.40946:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40947:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40948

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40949

bnei_else.40948:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.40949:
bnei_cont.40945:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.40931:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	utexture.2971

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %t1, 0

	nop
	nop
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40950

	nop
	nop
	nop
	j	bnei_cont.40929

bnei_else.40950:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40952

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40953

fbgt_else.40952:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40953:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40954

	nop
	nop
	nop
	j	bnei_cont.40955

bnei_else.40954:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.40955:
	lw	%a0, 7(%s7)
	nop
	fmul	%f1, %f28, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.40951:
	nop
	nop
	nop
	j	bnei_cont.40929

bnei_else.40928:
bnei_cont.40929:
bnei_cont.40715:
	lw	%a0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %a0, -2
	nop

	nop
	nop
	nop
	blti	%t0, 0, bgti_else.40956

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t0
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%t1)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f27
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.40957

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40958

fbgt_else.40957:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40958:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40959

	lw	%a0, 0(%sp)
	flw	%f0, 440(%zero)
	addi	%a1, %t0, 1
	nop

	flw	%f0, 445(%zero)
	nop
	add	%at, %a0, %a1
	fdiv	%f25, %f1, %f0

	lw	%t1, 0(%at)
	fsw	%f0, 137(%zero)
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	sw	%v1, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	jal	trace_or_matrix_fast.2956

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40961

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40962

fbgt_else.40961:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40962:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40963

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40965

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40964

fbgt_else.40965:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40966:
	nop
	nop
	nop
	j	bnei_cont.40964

bnei_else.40963:

bnei_cont.40964:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.40960

	lw	%a0, 141(%zero)
	lw	%a2, 0(%t1)
	nop
	nop

	lw	%s7, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.40969

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.40971

	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	fsub	%f17, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	fsub	%f20, %f1, %f0
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%s7)
	fmul	%f21, %f18, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 3(%s7)
	fmul	%f2, %f17, %f0
	nop

	nop
	nop
	fmul	%f16, %f20, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40973

	lw	%a0, 9(%s7)
	flw	%f19, 473(%zero)
	nop
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%s7)
	fmul	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40974

bnei_else.40973:
	fsw	%f21, 142(%zero)
	nop
	nop
	nop

	fsw	%f2, 143(%zero)
	nop
	nop
	nop

	fsw	%f16, 144(%zero)
	nop
	nop
	nop

bnei_cont.40974:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	nop
	nop

	flw	%f17, 143(%zero)
	flw	%f16, 144(%zero)
	fmul	%f1, %f18, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.40975

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40976

fbeq_else.40975:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40976:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40977

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40978

bnei_else.40977:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40979

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.40980

bnei_else.40979:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.40980:
bnei_cont.40978:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.40970

bnei_else.40971:
	lw	%a0, 4(%s7)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%s7)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.40972:
	nop
	nop
	nop
	j	bnei_cont.40970

bnei_else.40969:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a2, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.40981

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40982

fbeq_else.40981:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40982:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40983

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.40984

bnei_else.40983:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40985

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40986

fbgt_else.40985:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40986:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40987

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.40988

bnei_else.40987:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.40988:
bnei_cont.40984:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.40970:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	utexture.2971

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 0

	lw	%v1, 7(%sp)
	nop
	addi	%sp, %sp, 8
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40989

	nop
	nop
	nop
	j	bnei_cont.40960

bnei_else.40989:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.40991

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40992

fbgt_else.40991:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40992:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40993

	nop
	nop
	nop
	j	bnei_cont.40994

bnei_else.40993:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.40994:
	lw	%a0, 7(%s7)
	nop
	fmul	%f1, %f25, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.40990:
	nop
	nop
	nop
	j	bnei_cont.40960

bnei_else.40967:
bnei_cont.40968:

bnei_else.40959:
	flw	%f0, 439(%zero)
	nop
	addi	%a0, %t1, 0
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f25, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 9
	jal	trace_or_matrix_fast.2956

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -9
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40995

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40996

fbgt_else.40995:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40996:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40997

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40999

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40998

fbgt_else.40999:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41000:
	nop
	nop
	nop
	j	bnei_cont.40998

bnei_else.40997:

bnei_cont.40998:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41001

	lw	%a0, 141(%zero)
	lw	%a2, 0(%t1)
	nop
	nop

	lw	%s7, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.41003

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.41005

	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	fsub	%f17, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	fsub	%f20, %f1, %f0
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%s7)
	fmul	%f21, %f18, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 3(%s7)
	fmul	%f2, %f17, %f0
	nop

	nop
	nop
	fmul	%f16, %f20, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41007

	lw	%a0, 9(%s7)
	flw	%f19, 473(%zero)
	nop
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%s7)
	fmul	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.41008

bnei_else.41007:
	fsw	%f21, 142(%zero)
	nop
	nop
	nop

	fsw	%f2, 143(%zero)
	nop
	nop
	nop

	fsw	%f16, 144(%zero)
	nop
	nop
	nop

bnei_cont.41008:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	nop
	nop

	flw	%f17, 143(%zero)
	flw	%f16, 144(%zero)
	fmul	%f1, %f18, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.41009

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.41010

fbeq_else.41009:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.41010:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41011

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.41012

bnei_else.41011:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.41013

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.41014

bnei_else.41013:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.41014:
bnei_cont.41012:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.41004

bnei_else.41005:
	lw	%a0, 4(%s7)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%s7)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.41006:
	nop
	nop
	nop
	j	bnei_cont.41004

bnei_else.41003:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a2, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.41015

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.41016

fbeq_else.41015:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.41016:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41017

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.41018

bnei_else.41017:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.41019

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41020

fbgt_else.41019:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41020:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41021

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.41022

bnei_else.41021:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.41022:
bnei_cont.41018:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.41004:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0

	nop
	nop
	addi	%sp, %sp, 9
	jal	utexture.2971

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v0, %zero, 0

	lw	%v1, 8(%sp)
	nop
	addi	%sp, %sp, 9
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	addi	%sp, %sp, -9
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.41023

	nop
	nop
	nop
	j	bnei_cont.41002

bnei_else.41023:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.41025

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41026

fbgt_else.41025:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41026:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41027

	nop
	nop
	nop
	j	bnei_cont.41028

bnei_else.41027:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.41028:
	lw	%a0, 7(%s7)
	nop
	fmul	%f1, %f25, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.41024:
	nop
	nop
	nop
	j	bnei_cont.41002

bnei_else.41001:
bnei_cont.41002:
bnei_cont.40960:
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	addi	%a1, %t0, -2
	nop

	lw	%ra, 6(%sp)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	nop
	j	iter_trace_diffuse_rays.2992

bgti_else.40956:
	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	nop
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.40711:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_rays.2997:
	sw	%v0, 0(%sp)
	nop
	add	%v0, %zero, %a0
	nop

	sw	%v1, 1(%sp)
	flw	%f0, 0(%v0)
	nop
	nop

	sw	%v0, 2(%sp)
	fsw	%f0, 162(%zero)
	nop
	nop

	sw	%t1, 3(%sp)
	flw	%f0, 1(%v0)
	nop
	nop

	sw	%t0, 4(%sp)
	fsw	%f0, 163(%zero)
	nop
	nop

	sw	%ra, 5(%sp)
	flw	%f0, 2(%v0)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	addi	%sp, %sp, 6
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	lw	%t0, 118(%a0)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%t0)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 0(%a1)
	nop
	nop
	nop

	flw	%f1, 1(%a1)
	flw	%f0, 1(%a0)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%a1)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.41280

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41281

fbgt_else.41280:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41281:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41282

	lw	%a0, 0(%sp)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 6
	nop

	lw	%t0, 119(%a0)
	flw	%f0, 445(%zero)
	fdiv	%f25, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	addi	%a0, %t0, 0
	nop

	lw	%t1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %t1, 0
	jal	trace_or_matrix_fast.2956

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41284

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41285

fbgt_else.41284:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41285:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41286

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.41288

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.41287

fbgt_else.41288:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41289:
	nop
	nop
	nop
	j	bnei_cont.41287

bnei_else.41286:

bnei_cont.41287:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.41283

	lw	%a0, 141(%zero)
	lw	%a2, 0(%t0)
	nop
	nop

	lw	%s7, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.41292

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.41294

	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	fsub	%f17, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	fsub	%f20, %f1, %f0
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%s7)
	fmul	%f21, %f18, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 3(%s7)
	fmul	%f2, %f17, %f0
	nop

	nop
	nop
	fmul	%f16, %f20, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41296

	lw	%a0, 9(%s7)
	flw	%f19, 473(%zero)
	nop
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%s7)
	fmul	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.41297

bnei_else.41296:
	fsw	%f21, 142(%zero)
	nop
	nop
	nop

	fsw	%f2, 143(%zero)
	nop
	nop
	nop

	fsw	%f16, 144(%zero)
	nop
	nop
	nop

bnei_cont.41297:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	nop
	nop

	flw	%f17, 143(%zero)
	flw	%f16, 144(%zero)
	fmul	%f1, %f18, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.41298

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.41299

fbeq_else.41298:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.41299:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41300

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.41301

bnei_else.41300:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.41302

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.41303

bnei_else.41302:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.41303:
bnei_cont.41301:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.41293

bnei_else.41294:
	lw	%a0, 4(%s7)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%s7)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.41295:
	nop
	nop
	nop
	j	bnei_cont.41293

bnei_else.41292:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a2, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.41304

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.41305

fbeq_else.41304:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.41305:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41306

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.41307

bnei_else.41306:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.41308

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41309

fbgt_else.41308:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41309:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41310

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.41311

bnei_else.41310:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.41311:
bnei_cont.41307:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.41293:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0

	nop
	nop
	addi	%sp, %sp, 6
	jal	utexture.2971

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %t1, 0

	nop
	nop
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.41312

	nop
	nop
	nop
	j	bnei_cont.41283

bnei_else.41312:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.41314

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41315

fbgt_else.41314:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41315:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41316

	nop
	nop
	nop
	j	bnei_cont.41317

bnei_else.41316:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.41317:
	lw	%a0, 7(%s7)
	nop
	fmul	%f1, %f25, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.41313:
	nop
	nop
	nop
	j	bnei_cont.41283

bnei_else.41290:
bnei_cont.41291:

bnei_else.41282:
	flw	%f0, 439(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%sp, %sp, 6

	flw	%f0, 445(%zero)
	nop
	fdiv	%f25, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %t1, 0
	jal	trace_or_matrix_fast.2956

	flw	%f1, 137(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.41318

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41319

fbgt_else.41318:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41319:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41320

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.41322

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.41321

fbgt_else.41322:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41323:
	nop
	nop
	nop
	j	bnei_cont.41321

bnei_else.41320:

bnei_cont.41321:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41324

	lw	%a0, 141(%zero)
	lw	%a2, 0(%t0)
	nop
	nop

	lw	%s7, 12(%a0)
	nop
	nop
	nop

	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.41326

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.41328

	flw	%f1, 138(%zero)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 5(%s7)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f18, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	lw	%a0, 5(%s7)
	fsub	%f17, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	fsub	%f20, %f1, %f0
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%s7)
	fmul	%f21, %f18, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 3(%s7)
	fmul	%f2, %f17, %f0
	nop

	nop
	nop
	fmul	%f16, %f20, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41330

	lw	%a0, 9(%s7)
	flw	%f19, 473(%zero)
	nop
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%s7)
	fmul	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f21, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 9(%s7)
	nop
	nop

	nop
	nop
	fmul	%f0, %f20, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 9(%s7)
	nop
	fmul	%f1, %f18, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.41331

bnei_else.41330:
	fsw	%f21, 142(%zero)
	nop
	nop
	nop

	fsw	%f2, 143(%zero)
	nop
	nop
	nop

	fsw	%f16, 144(%zero)
	nop
	nop
	nop

bnei_cont.41331:
	lw	%a1, 6(%s7)
	flw	%f18, 142(%zero)
	nop
	nop

	flw	%f17, 143(%zero)
	flw	%f16, 144(%zero)
	fmul	%f1, %f18, %f18
	nop

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f1, %f0
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.41332

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.41333

fbeq_else.41332:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.41333:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41334

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.41335

bnei_else.41334:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.41336

	flw	%f0, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.41337

bnei_else.41336:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.41337:
bnei_cont.41335:
	nop
	nop
	fmul	%f1, %f18, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.41327

bnei_else.41328:
	lw	%a0, 4(%s7)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%s7)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%s7)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

bnei_cont.41329:
	nop
	nop
	nop
	j	bnei_cont.41327

bnei_else.41326:
	lw	%a0, 136(%zero)
	fsw	%fzero, 142(%zero)
	nop
	nop

	fsw	%fzero, 143(%zero)
	nop
	addi	%a1, %a0, -1
	nop

	fsw	%fzero, 144(%zero)
	nop
	add	%at, %a2, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.41338

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.41339

fbeq_else.41338:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.41339:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41340

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.41341

bnei_else.41340:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.41342

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41343

fbgt_else.41342:

fbgt_cont.41343:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41344

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.41345

bnei_else.41344:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.41345:
bnei_cont.41341:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.41327:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%v0, %s7, 0

	nop
	nop
	addi	%sp, %sp, 6
	jal	utexture.2971

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %t1, 0

	nop
	nop
	addi	%v0, %zero, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2931

	nop
	nop
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.41346

	nop
	nop
	nop
	j	bnei_cont.41325

bnei_else.41346:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.41348

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41349

fbgt_else.41348:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41349:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41350

	nop
	nop
	nop
	j	bnei_cont.41351

bnei_else.41350:

bnei_cont.41351:
	lw	%a0, 7(%s7)
	nop
	fmul	%f1, %f25, %f0
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f0, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f0, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.41347:
	nop
	nop
	nop
	j	bnei_cont.41325

bnei_else.41324:
bnei_cont.41325:
bnei_cont.41283:
	lw	%t1, 3(%sp)
	lw	%t0, 4(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%ra, 5(%sp)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
	lw	%v0, 0(%sp)
	nop
	j	iter_trace_diffuse_rays.2992

do_without_neighbors.3014:
	sw	%v0, 0(%sp)
	nop
	addi	%at, %zero, 4
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%t3, 2(%sp)
	nop
	nop
	nop

	sw	%t2, 3(%sp)
	nop
	nop
	nop

	sw	%t1, 4(%sp)
	nop
	nop
	nop

	sw	%t0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41502

	lw	%a0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.41503

	lw	%a0, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41504

	lw	%a0, 5(%v0)
	lw	%a2, 7(%v0)
	nop
	nop

	lw	%a1, 1(%v0)
	lw	%t1, 4(%v0)
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	add	%at, %a2, %v1
	nop

	flw	%f0, 0(%a0)
	lw	%t0, 0(%at)
	add	%at, %a1, %v1
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

	lw	%t2, 0(%a0)
	lw	%t3, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.41506

	lw	%k0, 179(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118

	nop
	nop
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0

	nop
	nop
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41507

bnei_else.41506:
bnei_cont.41507:
	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.41508

	lw	%k0, 180(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118

	nop
	nop
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0

	nop
	nop
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41509

bnei_else.41508:
bnei_cont.41509:
	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.41510

	lw	%k0, 181(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118

	nop
	nop
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0

	nop
	nop
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41511

bnei_else.41510:
bnei_cont.41511:
	nop
	nop
	nop
	beqi	%t2, 3, bnei_else.41512

	lw	%k0, 182(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118

	nop
	nop
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0

	nop
	nop
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41513

bnei_else.41512:
bnei_cont.41513:
	nop
	nop
	nop
	beqi	%t2, 4, bnei_else.41514

	lw	%k0, 183(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 7

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118

	nop
	nop
	addi	%a0, %t3, 0
	addi	%v1, %t0, 0

	nop
	nop
	addi	%v0, %k0, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41515

bnei_else.41514:
bnei_cont.41515:
	lw	%a0, 1(%sp)
	flw	%f16, 151(%zero)
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	add	%at, %t1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.41505

bnei_else.41504:
bnei_cont.41505:
	lw	%a0, 1(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%t2, %a0, 1
	nop

	nop
	nop
	nop
	blt	%at, %t2, bgt_else.41516

	lw	%k0, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.41517

	lw	%a0, 3(%k0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41518

	lw	%a3, 5(%k0)
	lw	%a2, 7(%k0)
	nop
	nop

	lw	%a1, 1(%k0)
	lw	%a0, 4(%k0)
	add	%at, %a3, %t2
	nop

	sw	%a0, 7(%sp)
	lw	%a0, 0(%at)
	add	%at, %a2, %t2
	nop

	flw	%f0, 0(%a0)
	lw	%t1, 0(%at)
	add	%at, %a1, %t2
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
	lw	%a0, 6(%k0)
	nop
	nop

	lw	%t3, 0(%a0)
	lw	%t0, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.41520

	lw	%v0, 179(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.41521

bnei_else.41520:
bnei_cont.41521:
	nop
	nop
	nop
	beqi	%t3, 1, bnei_else.41522

	lw	%v0, 180(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.41523

bnei_else.41522:
bnei_cont.41523:
	nop
	nop
	nop
	beqi	%t3, 2, bnei_else.41524

	lw	%v0, 181(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.41525

bnei_else.41524:
bnei_cont.41525:
	nop
	nop
	nop
	beqi	%t3, 3, bnei_else.41526

	lw	%v0, 182(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.41527

bnei_else.41526:
bnei_cont.41527:
	nop
	nop
	nop
	beqi	%t3, 4, bnei_else.41528

	lw	%v0, 183(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.41529

bnei_else.41528:
bnei_cont.41529:
	lw	%a0, 7(%sp)
	flw	%f16, 151(%zero)
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	add	%at, %a0, %t2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.41519

bnei_else.41518:
bnei_cont.41519:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	addi	%v1, %t2, 1
	nop

	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	nop
	nop

	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	nop
	j	do_without_neighbors.3014

bgti_else.41517:
	lw	%t3, 2(%sp)
	lw	%t2, 3(%sp)
	nop
	nop

	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	nop
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.41516:

	lw	%t1, 4(%sp)
	lw	%t0, 5(%sp)
	nop
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.41503:
	nop
	nop
	nop
	jr	%ra

bgt_else.41502:

try_exploit_neighbors.3030:
	sw	%a3, 0(%sp)
	nop
	add	%at, %a1, %v0
	nop

	sw	%ra, 1(%sp)
	lw	%s0, 0(%at)
	addi	%at, %zero, 4
	nop

	sw	%s0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.41746

	lw	%k0, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %k0, %a3
	nop

	lw	%k0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%k0, 0, bgti_else.41747

	lw	%k0, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %k0, %a3
	nop

	lw	%s0, 0(%at)
	nop
	add	%at, %a0, %v0
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	lw	%k0, 2(%ra)
	nop
	nop
	nop

	nop
	nop
	add	%at, %k0, %a3
	nop

	lw	%k0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%k0, %s0, beq_else.41748

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%k0, 0(%at)
	nop
	nop
	nop

	lw	%k0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %k0, %a3
	nop

	lw	%k0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%k0, %s0, beq_else.41750

	nop
	nop
	addi	%k0, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %k0
	nop

	lw	%k0, 0(%at)
	nop
	nop
	nop

	lw	%k0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %k0, %a3
	nop

	lw	%k0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%k0, %s0, beq_else.41752

	nop
	nop
	addi	%k0, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %k0
	nop

	lw	%k0, 0(%at)
	nop
	nop
	nop

	lw	%k0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %k0, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %s0, beq_else.41754

	nop
	nop
	add	%a3, %zero, %k1
	j	beq_cont.41749

beq_else.41754:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.41755:
	nop
	nop
	nop
	j	beq_cont.41749

beq_else.41752:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.41753:
	nop
	nop
	nop
	j	beq_cont.41749

beq_else.41750:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.41751:
	nop
	nop
	nop
	j	beq_cont.41749

beq_else.41748:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.41749:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.41756

	lw	%s3, 2(%sp)
	lw	%s2, 0(%sp)
	nop
	nop

	lw	%a3, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %s2
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.41757

	lw	%s5, 5(%ra)
	lw	%s1, 5(%s3)
	addi	%a3, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%s4, 5(%a3)
	nop
	addi	%a3, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	add	%at, %a2, %v0
	nop

	lw	%s0, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s5, %s2
	nop

	lw	%k0, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s4, %s2
	nop

	flw	%f0, 0(%a3)
	nop
	nop
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %s1, %s2
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %s0, %s2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %k0, %s2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 4(%s3)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	add	%at, %a3, %s2

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	flw	%f16, 151(%zero)
	flw	%f1, 0(%a3)
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.41758

bnei_else.41757:
bnei_cont.41758:
	lw	%a3, 0(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%k0, %a3, 1
	nop

	nop
	nop
	nop
	blt	%at, %k0, bgt_else.41759

	lw	%s0, 2(%sp)
	nop
	nop
	nop

	lw	%a3, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %k0
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.41760

	lw	%a3, 2(%s0)
	nop
	nop
	nop

	lw	%a3, 2(%ra)
	nop
	add	%at, %a3, %k0
	nop

	lw	%s0, 0(%at)
	nop
	add	%at, %a3, %k0
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %s0, beq_else.41761

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %k0
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %s0, beq_else.41763

	nop
	nop
	addi	%a3, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %k0
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %s0, beq_else.41765

	nop
	nop
	addi	%a3, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %k0
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %s0, beq_else.41767

	nop
	nop
	add	%a3, %zero, %k1
	j	beq_cont.41762

beq_else.41767:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.41768:
	nop
	nop
	nop
	j	beq_cont.41762

beq_else.41765:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.41766:
	nop
	nop
	nop
	j	beq_cont.41762

beq_else.41763:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.41764:
	nop
	nop
	nop
	j	beq_cont.41762

beq_else.41761:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.41762:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.41769

	lw	%s3, 2(%sp)
	nop
	nop
	nop

	lw	%a3, 3(%s3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %k0
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.41770

	lw	%s4, 5(%ra)
	lw	%s1, 5(%s3)
	addi	%a3, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%s2, 5(%a3)
	nop
	addi	%a3, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %a3
	nop

	lw	%a3, 0(%at)
	nop
	add	%at, %a2, %v0
	nop

	lw	%s0, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s4, %k0
	nop

	lw	%ra, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s2, %k0
	nop

	flw	%f0, 0(%a3)
	nop
	nop
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %s1, %k0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %s0, %k0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	add	%at, %ra, %k0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a3, 4(%s3)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	add	%at, %a3, %k0

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	flw	%f16, 151(%zero)
	flw	%f1, 0(%a3)
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.41771

bnei_else.41770:
bnei_cont.41771:
	lw	%ra, 1(%sp)
	nop
	addi	%a3, %k0, 1
	j	try_exploit_neighbors.3030

bnei_else.41769:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %k0, 0
	j	do_without_neighbors.3014

bgti_else.41760:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.41759:

	nop
	nop
	nop
	jr	%ra

bnei_else.41756:
	lw	%ra, 0(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %ra, bgt_else.41774

	lw	%k0, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %ra
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.41775

	lw	%a0, 3(%k0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %ra
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41776

	lw	%a1, 5(%k0)
	lw	%a3, 7(%k0)
	nop
	nop

	lw	%a2, 1(%k0)
	lw	%a0, 4(%k0)
	add	%at, %a1, %ra
	nop

	sw	%a0, 3(%sp)
	lw	%a0, 0(%at)
	add	%at, %a3, %ra
	nop

	flw	%f0, 0(%a0)
	lw	%v1, 0(%at)
	add	%at, %a2, %ra
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
	lw	%a0, 6(%k0)
	nop
	nop

	lw	%a1, 0(%a0)
	lw	%a0, 0(%at)
	nop
	nop

	sw	%a1, 4(%sp)
	nop
	nop
	nop

	sw	%v1, 5(%sp)
	nop
	nop
	nop

	sw	%a0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.41778

	lw	%v0, 179(%zero)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41779

bnei_else.41778:
bnei_cont.41779:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.41780

	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41781

bnei_else.41780:
bnei_cont.41781:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.41782

	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41783

bnei_else.41782:
bnei_cont.41783:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.41784

	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41785

bnei_else.41784:
bnei_cont.41785:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 4, bnei_else.41786

	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41787

bnei_else.41786:
bnei_cont.41787:
	lw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	nop
	nop

	flw	%f16, 151(%zero)
	flw	%f0, 148(%zero)
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.41777

bnei_else.41776:
bnei_cont.41777:
	lw	%a0, 0(%sp)
	lw	%ra, 1(%sp)
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	addi	%v1, %a0, 1
	j	do_without_neighbors.3014

bgti_else.41775:

	nop
	nop
	nop
	jr	%ra

bgt_else.41774:

	nop
	nop
	nop
	jr	%ra

bgti_else.41747:
	nop
	nop
	nop
	jr	%ra

bgt_else.41746:

pretrace_diffuse_rays.3043:
	sw	%v0, 0(%sp)
	nop
	addi	%at, %zero, 4
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%t1, 2(%sp)
	nop
	nop
	nop

	sw	%t0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41893

	lw	%a0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.41894

	lw	%a0, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41895

	lw	%a0, 6(%v0)
	fsw	%fzero, 148(%zero)
	addi	%sp, %sp, 5
	nop

	lw	%a2, 0(%a0)
	fsw	%fzero, 149(%zero)
	nop
	nop

	fsw	%fzero, 150(%zero)
	lw	%a1, 7(%v0)
	nop
	nop

	lw	%a0, 1(%v0)
	lw	%s0, 179(%a2)
	add	%at, %a1, %v1
	nop

	lw	%k0, 0(%at)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%v0)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%v0)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %zero, 118

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v1, %k0, 0

	nop
	nop
	addi	%v0, %s0, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2992

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -5
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	lw	%a1, 5(%a0)
	lw	%a0, 1(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	j	bnei_cont.41896

bnei_else.41895:
bnei_cont.41896:
	lw	%a0, 1(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%t0, %a0, 1
	nop

	nop
	nop
	nop
	blt	%at, %t0, bgt_else.41897

	lw	%a1, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.41898

	lw	%a0, 3(%a1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41899

	lw	%a0, 6(%a1)
	fsw	%fzero, 148(%zero)
	nop
	nop

	lw	%a0, 0(%a0)
	fsw	%fzero, 149(%zero)
	nop
	nop

	fsw	%fzero, 150(%zero)
	lw	%a2, 7(%a1)
	nop
	nop

	lw	%a1, 1(%a1)
	lw	%a0, 179(%a0)
	add	%at, %a2, %t0
	nop

	sw	%a0, 5(%sp)
	lw	%a0, 0(%at)
	add	%at, %a1, %t0
	nop

	sw	%a0, 6(%sp)
	lw	%t1, 0(%at)
	nop
	nop

	flw	%f0, 0(%t1)
	nop
	addi	%v0, %t1, 0
	addi	%sp, %sp, 7

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t1)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t1)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	lw	%v0, 118(%a0)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%a1, 0(%v0)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 0(%a1)
	nop
	nop
	nop

	flw	%f1, 1(%a1)
	flw	%f0, 1(%a0)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%a1)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.41901

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.41902

fbgt_else.41901:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.41902:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.41903

	lw	%a0, 5(%sp)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 7
	nop

	lw	%v0, 119(%a0)
	nop
	fdiv	%f0, %f1, %f0
	jal	trace_diffuse_ray.2989

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.41904

bnei_else.41903:

	nop
	nop
	fdiv	%f0, %f1, %f0
	jal	trace_diffuse_ray.2989

	nop
	nop
	addi	%sp, %sp, -7
	nop

bnei_cont.41904:
	lw	%v1, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%a1, %zero, 116
	addi	%a0, %t1, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	iter_trace_diffuse_rays.2992

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -7
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 5(%a0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	j	bnei_cont.41900

bnei_else.41899:
bnei_cont.41900:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	addi	%v1, %t0, 1
	nop

	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	nop
	j	pretrace_diffuse_rays.3043

bgti_else.41898:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	nop
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.41897:

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.41894:
	nop
	nop
	nop
	jr	%ra

bgt_else.41893:

pretrace_pixels.3046:
	fsw	%f0, 0(%sp)
	nop
	nop
	nop

	fsw	%f1, 1(%sp)
	nop
	nop
	nop

	fsw	%f2, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%v1, 4(%sp)
	nop
	nop
	nop

	sw	%a0, 5(%sp)
	nop
	nop
	nop

	sw	%t3, 6(%sp)
	nop
	nop
	nop

	sw	%t2, 7(%sp)
	nop
	nop
	nop

	sw	%t1, 8(%sp)
	nop
	nop
	nop

	sw	%t0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.42002

	flw	%f17, 158(%zero)
	lw	%a0, 156(%zero)
	nop
	nop

	nop
	nop
	sub	%a0, %v1, %a0
	nop

	nop
	nop
	itof	%f16, %a0
	nop

	flw	%f16, 165(%zero)
	nop
	fmul	%f17, %f17, %f16
	nop

	nop
	nop
	fmul	%f16, %f17, %f16
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 174(%zero)
	nop
	nop
	nop

	flw	%f0, 166(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 175(%zero)
	nop
	nop
	nop

	flw	%f0, 167(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	fsw	%f0, 176(%zero)
	nop
	nop
	nop

	flw	%f18, 174(%zero)
	flw	%f17, 175(%zero)
	nop
	nop

	flw	%f16, 176(%zero)
	nop
	fmul	%f1, %f18, %f18
	fmul	%f0, %f17, %f17

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f16, %f16

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.42003

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.42004

fbeq_else.42003:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.42004:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42005

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.42006

bnei_else.42005:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

bnei_cont.42006:
	lw	%a1, 3(%sp)
	lw	%a0, 4(%sp)
	fmul	%f1, %f18, %f0
	addi	%sp, %sp, 11

	fsw	%f1, 174(%zero)
	nop
	fmul	%f1, %f17, %f0
	fmul	%f0, %f16, %f0

	fsw	%f1, 175(%zero)
	nop
	add	%at, %a1, %a0
	fmov	%f1, %fzero

	fsw	%f0, 176(%zero)
	lw	%t0, 0(%at)
	nop
	nop

	fsw	%fzero, 151(%zero)
	nop
	addi	%a0, %t0, 0
	nop

	fsw	%fzero, 152(%zero)
	nop
	nop
	nop

	fsw	%fzero, 153(%zero)
	nop
	nop
	nop

	flw	%f0, 75(%zero)
	nop
	nop
	nop

	fsw	%f0, 159(%zero)
	nop
	nop
	nop

	flw	%f0, 76(%zero)
	nop
	nop
	nop

	fsw	%f0, 160(%zero)
	nop
	nop
	nop

	flw	%f0, 77(%zero)
	nop
	nop
	nop

	fsw	%f0, 161(%zero)
	nop
	fmov	%f0, %f30
	nop

	nop
	nop
	addi	%v1, %zero, 174
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	trace_ray.2983

	lw	%a0, 0(%t0)
	flw	%f0, 151(%zero)
	addi	%sp, %sp, -11
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 152(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 153(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	lw	%a1, 6(%t0)
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	sw	%a0, 0(%a1)
	lw	%a0, 2(%t0)
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.42007

	lw	%a0, 3(%t0)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42009

	lw	%a0, 6(%t0)
	fsw	%fzero, 148(%zero)
	addi	%sp, %sp, 11
	nop

	lw	%a2, 0(%a0)
	fsw	%fzero, 149(%zero)
	nop
	nop

	fsw	%fzero, 150(%zero)
	lw	%a1, 7(%t0)
	nop
	nop

	lw	%a0, 1(%t0)
	lw	%t1, 179(%a2)
	nop
	nop

	lw	%t2, 0(%a1)
	lw	%t3, 0(%a0)
	nop
	nop

	flw	%f0, 0(%t3)
	nop
	addi	%v0, %t3, 0
	nop

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t3)
	nop
	nop

	fsw	%f0, 164(%zero)
	nop
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2894

	lw	%v0, 118(%t1)
	flw	%f0, 0(%t2)
	addi	%sp, %sp, -11
	nop

	lw	%a0, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	flw	%f0, 1(%t2)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%t2)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.42011

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.42012

fbgt_else.42011:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.42012:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.42013

	lw	%v0, 119(%t1)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	jal	trace_diffuse_ray.2989

	nop
	nop
	addi	%sp, %sp, -11
	j	bnei_cont.42014

bnei_else.42013:
	flw	%f0, 439(%zero)
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	jal	trace_diffuse_ray.2989

	nop
	nop
	addi	%sp, %sp, -11
	nop

bnei_cont.42014:
	nop
	nop
	addi	%a1, %zero, 116
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t2, 0
	addi	%v0, %t1, 0

	nop
	nop
	addi	%sp, %sp, 11
	jal	iter_trace_diffuse_rays.2992

	lw	%a0, 5(%t0)
	flw	%f0, 148(%zero)
	addi	%sp, %sp, -11
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	flw	%f0, 149(%zero)
	nop
	nop

	fsw	%f0, 1(%a0)
	flw	%f0, 150(%zero)
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	j	bnei_cont.42010

bnei_else.42009:
bnei_cont.42010:
	nop
	nop
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0

	nop
	nop
	addi	%sp, %sp, 11
	jal	pretrace_diffuse_rays.3043

	nop
	nop
	addi	%sp, %sp, -11
	j	bgti_cont.42008

bgti_else.42007:
bgti_cont.42008:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	addi	%v1, %a0, -1
	nop

	nop
	nop
	addi	%a0, %a0, 1
	nop

	nop
	nop
	nop
	blti	%a0, 5, bgti_else.42015

	nop
	nop
	addi	%a0, %a0, -5
	j	bgti_cont.42016

bgti_else.42015:
bgti_cont.42016:
	lw	%t3, 6(%sp)
	lw	%t2, 7(%sp)
	nop
	nop

	lw	%t1, 8(%sp)
	lw	%t0, 9(%sp)
	nop
	nop

	lw	%ra, 10(%sp)
	flw	%f2, 2(%sp)
	nop
	nop

	flw	%f1, 1(%sp)
	flw	%f0, 0(%sp)
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	j	pretrace_pixels.3046

bgti_else.42002:
	nop
	nop
	nop
	jr	%ra

scan_pixel.3057:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%a0, 2(%sp)
	lw	%t0, 154(%zero)
	add	%a0, %zero, %t0
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	sw	%a2, 4(%sp)
	nop
	nop
	nop

	sw	%t4, 5(%sp)
	nop
	nop
	nop

	sw	%t3, 6(%sp)
	nop
	nop
	nop

	sw	%t2, 7(%sp)
	nop
	nop
	nop

	sw	%t1, 8(%sp)
	nop
	nop
	nop

	sw	%a0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%v0, %t0, bgt_else.44336

	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

bgt_else.44336:
	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%t1)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	addi	%a0, %v1, 1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	lw	%a1, 155(%zero)
	nop
	nop
	nop

	sw	%a1, 11(%sp)
	nop
	nop
	nop

	sw	%a0, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %a1, bgt_else.44338

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.44339

bgt_else.44338:
	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.44340

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.44341

bgt_else.44340:
	nop
	nop
	addi	%a0, %v0, 1
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.44342

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.44343

bgt_else.44342:
	nop
	nop
	nop
	blt	%zero, %v0, bgt_else.44344

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.44345

bgt_else.44344:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgt_cont.44345:
bgt_cont.44343:
bgt_cont.44341:
bgt_cont.44339:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44346

	lw	%a0, 2(%t1)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bnei_cont.44347

	lw	%a0, 2(%t1)
	lw	%k0, 0(%sp)
	nop
	nop

	lw	%a2, 0(%a0)
	lw	%a0, 2(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a0, %k0
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a0, 2(%a3)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a0, %a2, beq_else.44350

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %k0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a0, %a2, beq_else.44352

	lw	%a1, 3(%sp)
	nop
	addi	%a0, %k0, -1
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a0, %a2, beq_else.44354

	nop
	nop
	addi	%a0, %k0, 1
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a0, %a2, beq_else.44356

	nop
	nop
	add	%a0, %zero, %k1
	j	beq_cont.44351

beq_else.44356:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.44357:
	nop
	nop
	nop
	j	beq_cont.44351

beq_else.44354:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.44355:
	nop
	nop
	nop
	j	beq_cont.44351

beq_else.44352:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.44353:
	nop
	nop
	nop
	j	beq_cont.44351

beq_else.44350:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.44351:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44358

	lw	%a0, 3(%t1)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44360

	lw	%s0, 5(%a3)
	lw	%ra, 0(%sp)
	nop
	nop

	lw	%a1, 3(%sp)
	lw	%a3, 5(%t1)
	addi	%a0, %ra, -1
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%k0, 5(%a0)
	nop
	addi	%a0, %ra, 1
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a2, 5(%a0)
	lw	%a0, 4(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a0, %ra
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a1, 5(%a0)
	lw	%a0, 0(%s0)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
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
	lw	%a0, 0(%k0)
	nop
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a0, 0(%a3)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a0, 0(%a2)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a0, 0(%a1)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 149(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	flw	%f1, 150(%zero)
	lw	%a0, 4(%t1)
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	flw	%f1, 0(%a0)
	nop
	nop

	flw	%f16, 151(%zero)
	flw	%f0, 148(%zero)
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.44361

bnei_else.44360:
bnei_cont.44361:
	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%a3, %k1, 0
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	addi	%sp, %sp, 13
	jal	try_exploit_neighbors.3030

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.44347

bnei_else.44358:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	do_without_neighbors.3014

	nop
	nop
	addi	%sp, %sp, -13
	nop

bnei_cont.44359:
	nop
	nop
	nop
	j	bnei_cont.44347

bgti_else.44348:
bgti_cont.44349:

bnei_else.44346:
	lw	%a0, 2(%t1)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.44362

	lw	%a0, 3(%t1)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44364

	lw	%a3, 5(%t1)
	lw	%a2, 7(%t1)
	nop
	nop

	lw	%a1, 1(%t1)
	lw	%a0, 4(%t1)
	nop
	nop

	sw	%a0, 13(%sp)
	lw	%a0, 0(%a3)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%t3, 0(%a2)
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
	lw	%a0, 6(%t1)
	nop
	nop

	lw	%t4, 0(%a0)
	lw	%t2, 0(%a1)
	nop
	nop

	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.44366

	lw	%v0, 179(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.44367

bnei_else.44366:
bnei_cont.44367:
	nop
	nop
	nop
	beqi	%t4, 1, bnei_else.44368

	lw	%v0, 180(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.44369

bnei_else.44368:
bnei_cont.44369:
	nop
	nop
	nop
	beqi	%t4, 2, bnei_else.44370

	lw	%v0, 181(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.44371

bnei_else.44370:
bnei_cont.44371:
	nop
	nop
	nop
	beqi	%t4, 3, bnei_else.44372

	lw	%v0, 182(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.44373

bnei_else.44372:
bnei_cont.44373:
	nop
	nop
	nop
	beqi	%t4, 4, bnei_else.44374

	lw	%v0, 183(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2997

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.44375

bnei_else.44374:
bnei_cont.44375:
	lw	%a0, 13(%sp)
	flw	%f16, 151(%zero)
	nop
	nop

	lw	%a0, 0(%a0)
	flw	%f0, 148(%zero)
	nop
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f16, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f16, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.44365

bnei_else.44364:
bnei_cont.44365:
	nop
	nop
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3014

	nop
	nop
	addi	%sp, %sp, -14
	j	bgti_cont.44363

bgti_else.44362:
bgti_cont.44363:
bnei_cont.44347:
	flw	%f0, 151(%zero)
	nop
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44376

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44378

	nop
	nop
	nop
	j	bgt_cont.44377

bgti_else.44378:

bgti_cont.44379:

bgt_else.44376:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.44377:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	addi	%t1, %zero, 10
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44380

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44382

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44384

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44386

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44381

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44390

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44392

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44394

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44381

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44398

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44400

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44402

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44381

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44406

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44408

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44410

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44410:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44411:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44408:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44409:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44406:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44407:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44404:
bgti_cont.44405:

bgti_else.44402:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44403:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44400:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44401:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44398:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44399:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44396:
bgti_cont.44397:

bgti_else.44394:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44395:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44392:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44393:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44390:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44391:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44388:
bgti_cont.44389:

bgti_else.44386:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44387:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44384:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44385:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44382:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44383:
	nop
	nop
	nop
	j	bgti_cont.44381

bgti_else.44380:
bgti_cont.44381:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.44412

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44413

bgt_else.44412:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44414

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44416

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44418

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44420

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44415

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44424

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44426

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44428

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44415

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44432

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44434

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44436

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44415

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44440

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44442

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44444

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44415

bgti_else.44444:

bgti_cont.44445:

bgti_else.44442:

bgti_cont.44443:

bgti_else.44440:

bgti_cont.44441:

bgti_else.44438:
bgti_cont.44439:

bgti_else.44436:

bgti_cont.44437:

bgti_else.44434:

bgti_cont.44435:

bgti_else.44432:

bgti_cont.44433:

bgti_else.44430:
bgti_cont.44431:

bgti_else.44428:

bgti_cont.44429:

bgti_else.44426:

bgti_cont.44427:

bgti_else.44424:

bgti_cont.44425:

bgti_else.44422:
bgti_cont.44423:

bgti_else.44420:

bgti_cont.44421:

bgti_else.44418:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44419:
	nop
	nop
	nop
	j	bgti_cont.44415

bgti_else.44416:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44417:
	nop
	nop
	nop
	j	bgti_cont.44415

bgti_else.44414:
bgti_cont.44415:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44446

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44447

bgt_else.44446:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44448

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44450

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44452

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44454

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44449

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44458

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44460

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44462

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44449

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44466

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44468

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44470

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44449

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44474

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44476

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44478

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44449

bgti_else.44478:

bgti_cont.44479:

bgti_else.44476:

bgti_cont.44477:

bgti_else.44474:

bgti_cont.44475:

bgti_else.44472:
bgti_cont.44473:

bgti_else.44470:

bgti_cont.44471:

bgti_else.44468:

bgti_cont.44469:

bgti_else.44466:

bgti_cont.44467:

bgti_else.44464:
bgti_cont.44465:

bgti_else.44462:

bgti_cont.44463:

bgti_else.44460:

bgti_cont.44461:

bgti_else.44458:

bgti_cont.44459:

bgti_else.44456:
bgti_cont.44457:

bgti_else.44454:

bgti_cont.44455:

bgti_else.44452:

bgti_cont.44453:

bgti_else.44450:

bgti_cont.44451:

bgti_else.44448:
bgti_cont.44449:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.44447:
bgt_cont.44413:
	nop
	nop
	addi	%t2, %zero, 32
	addi	%sp, %sp, 14

	nop
	nop
	addi	%v0, %t2, 0
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -14
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44480

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44482

	nop
	nop
	nop
	j	bgt_cont.44481

bgti_else.44482:

bgti_cont.44483:

bgt_else.44480:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.44481:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44484

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44486

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44488

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44490

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44485

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44494

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44496

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44498

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44485

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44502

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44504

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44506

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44485

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44510

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44512

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44514

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44514:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44515:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44512:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44513:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44510:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44511:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44508:
bgti_cont.44509:

bgti_else.44506:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44507:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44504:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44505:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44502:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44503:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44500:
bgti_cont.44501:

bgti_else.44498:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44499:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44496:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44497:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44494:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44495:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44492:
bgti_cont.44493:

bgti_else.44490:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44491:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44488:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44489:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44486:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44487:
	nop
	nop
	nop
	j	bgti_cont.44485

bgti_else.44484:
bgti_cont.44485:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.44516

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44517

bgt_else.44516:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44518

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44520

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44522

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44524

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44519

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44528

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44530

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44532

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44519

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44536

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44538

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44540

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44519

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44544

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44546

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44548

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44519

bgti_else.44548:

bgti_cont.44549:

bgti_else.44546:

bgti_cont.44547:

bgti_else.44544:

bgti_cont.44545:

bgti_else.44542:
bgti_cont.44543:

bgti_else.44540:

bgti_cont.44541:

bgti_else.44538:

bgti_cont.44539:

bgti_else.44536:

bgti_cont.44537:

bgti_else.44534:
bgti_cont.44535:

bgti_else.44532:

bgti_cont.44533:

bgti_else.44530:

bgti_cont.44531:

bgti_else.44528:

bgti_cont.44529:

bgti_else.44526:
bgti_cont.44527:

bgti_else.44524:

bgti_cont.44525:

bgti_else.44522:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44523:
	nop
	nop
	nop
	j	bgti_cont.44519

bgti_else.44520:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44521:
	nop
	nop
	nop
	j	bgti_cont.44519

bgti_else.44518:
bgti_cont.44519:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44550

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44551

bgt_else.44550:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44552

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44554

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44556

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44558

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44553

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44562

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44564

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44566

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44553

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44570

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44572

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44574

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44553

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44578

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44580

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44582

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44553

bgti_else.44582:

bgti_cont.44583:

bgti_else.44580:

bgti_cont.44581:

bgti_else.44578:

bgti_cont.44579:

bgti_else.44576:
bgti_cont.44577:

bgti_else.44574:

bgti_cont.44575:

bgti_else.44572:

bgti_cont.44573:

bgti_else.44570:

bgti_cont.44571:

bgti_else.44568:
bgti_cont.44569:

bgti_else.44566:

bgti_cont.44567:

bgti_else.44564:

bgti_cont.44565:

bgti_else.44562:

bgti_cont.44563:

bgti_else.44560:
bgti_cont.44561:

bgti_else.44558:

bgti_cont.44559:

bgti_else.44556:

bgti_cont.44557:

bgti_else.44554:

bgti_cont.44555:

bgti_else.44552:
bgti_cont.44553:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.44551:
bgt_cont.44517:
	nop
	nop
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -14
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44584

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44586

	nop
	nop
	nop
	j	bgt_cont.44585

bgti_else.44586:

bgti_cont.44587:

bgt_else.44584:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.44585:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44588

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44590

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44592

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44594

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44589

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44598

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44600

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44602

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44589

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44606

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44608

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44610

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44589

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44614

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44616

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44618

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44618:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44619:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44616:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44617:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44614:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44615:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44612:
bgti_cont.44613:

bgti_else.44610:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44611:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44608:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44609:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44606:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44607:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44604:
bgti_cont.44605:

bgti_else.44602:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44603:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44600:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44601:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44598:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44599:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44596:
bgti_cont.44597:

bgti_else.44594:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44595:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44592:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44593:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44590:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44591:
	nop
	nop
	nop
	j	bgti_cont.44589

bgti_else.44588:
bgti_cont.44589:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.44620

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44621

bgt_else.44620:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44622

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44624

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44626

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44628

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44623

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44632

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44634

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44636

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44623

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44640

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44642

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44644

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44623

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44648

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44650

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44652

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44623

bgti_else.44652:

bgti_cont.44653:

bgti_else.44650:

bgti_cont.44651:

bgti_else.44648:

bgti_cont.44649:

bgti_else.44646:
bgti_cont.44647:

bgti_else.44644:

bgti_cont.44645:

bgti_else.44642:

bgti_cont.44643:

bgti_else.44640:

bgti_cont.44641:

bgti_else.44638:
bgti_cont.44639:

bgti_else.44636:

bgti_cont.44637:

bgti_else.44634:

bgti_cont.44635:

bgti_else.44632:

bgti_cont.44633:

bgti_else.44630:
bgti_cont.44631:

bgti_else.44628:

bgti_cont.44629:

bgti_else.44626:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44627:
	nop
	nop
	nop
	j	bgti_cont.44623

bgti_else.44624:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44625:
	nop
	nop
	nop
	j	bgti_cont.44623

bgti_else.44622:
bgti_cont.44623:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44654

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44655

bgt_else.44654:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44656

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44658

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44660

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44662

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44657

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44666

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44668

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44670

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44657

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44674

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44676

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44678

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44657

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44682

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44684

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44686

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44657

bgti_else.44686:

bgti_cont.44687:

bgti_else.44684:

bgti_cont.44685:

bgti_else.44682:

bgti_cont.44683:

bgti_else.44680:
bgti_cont.44681:

bgti_else.44678:

bgti_cont.44679:

bgti_else.44676:

bgti_cont.44677:

bgti_else.44674:

bgti_cont.44675:

bgti_else.44672:
bgti_cont.44673:

bgti_else.44670:

bgti_cont.44671:

bgti_else.44668:

bgti_cont.44669:

bgti_else.44666:

bgti_cont.44667:

bgti_else.44664:
bgti_cont.44665:

bgti_else.44662:

bgti_cont.44663:

bgti_else.44660:

bgti_cont.44661:

bgti_else.44658:

bgti_cont.44659:

bgti_else.44656:
bgti_cont.44657:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.44655:
bgt_cont.44621:
	nop
	nop
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %a0, 1
	nop

	nop
	nop
	nop
	blt	%t3, %t0, bgt_else.44688

	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	nop
	nop

	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	nop
	nop

	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.44688:
	lw	%a0, 3(%sp)
	lw	%a1, 11(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a0, %t3
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	fsw	%f0, 153(%zero)
	lw	%a0, 12(%sp)
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %a1, bgt_else.44690

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.44691

bgt_else.44690:
	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44692

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.44693

bgt_else.44692:
	nop
	nop
	addi	%a0, %t3, 1
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.44694

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.44695

bgt_else.44694:
	nop
	nop
	nop
	blt	%zero, %t3, bgt_else.44696

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.44697

bgt_else.44696:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgt_cont.44697:
bgt_cont.44695:
bgt_cont.44693:
bgt_cont.44691:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44698

	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t3, 0

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3030

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.44699

bnei_else.44698:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	do_without_neighbors.3014

	nop
	nop
	addi	%sp, %sp, -14
	nop

bnei_cont.44699:
	flw	%f0, 151(%zero)
	nop
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44700

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44702

	nop
	nop
	nop
	j	bgt_cont.44701

bgti_else.44702:

bgti_cont.44703:

bgt_else.44700:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.44701:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44704

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44706

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44708

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44710

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44712

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44714

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44716

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44718

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44720

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44722

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44724

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44726

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44726:
	nop
	nop
	addi	%a2, %zero, 11
	nop

bgti_cont.44727:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44724:
	nop
	nop
	addi	%a2, %zero, 10
	nop

bgti_cont.44725:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44722:
	nop
	nop
	addi	%a2, %zero, 9
	nop

bgti_cont.44723:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44720:
	nop
	nop
	addi	%a2, %zero, 8
	nop

bgti_cont.44721:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44718:
	nop
	nop
	addi	%a2, %zero, 7
	nop

bgti_cont.44719:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44716:
	nop
	nop
	addi	%a2, %zero, 6
	nop

bgti_cont.44717:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44714:
	nop
	nop
	addi	%a2, %zero, 5
	nop

bgti_cont.44715:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44712:
	nop
	nop
	addi	%a2, %zero, 4
	nop

bgti_cont.44713:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44710:
	nop
	nop
	addi	%a2, %zero, 3
	nop

bgti_cont.44711:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44708:
	nop
	nop
	addi	%a2, %zero, 2
	nop

bgti_cont.44709:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44706:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bgti_cont.44707:
	nop
	nop
	nop
	j	bgti_cont.44705

bgti_else.44704:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.44705:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44728

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44730

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44732

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44734

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44729

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44738

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44740

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44742

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44729

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44746

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44748

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44750

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44750:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44751:
	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44748:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44749:
	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44746:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44747:
	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44744:
bgti_cont.44745:

bgti_else.44742:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44743:
	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44740:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44741:
	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44738:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44739:
	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44736:
bgti_cont.44737:

bgti_else.44734:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44735:
	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44732:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44733:
	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44730:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44731:
	nop
	nop
	nop
	j	bgti_cont.44729

bgti_else.44728:
bgti_cont.44729:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.44752

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44753

bgt_else.44752:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44754

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44756

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44758

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44760

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44762

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44764

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44766

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44768

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44770

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44772

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44774

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44776

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44755

bgti_else.44776:

bgti_cont.44777:

bgti_else.44774:

bgti_cont.44775:

bgti_else.44772:

bgti_cont.44773:

bgti_else.44770:

bgti_cont.44771:

bgti_else.44768:

bgti_cont.44769:

bgti_else.44766:

bgti_cont.44767:

bgti_else.44764:

bgti_cont.44765:

bgti_else.44762:

bgti_cont.44763:

bgti_else.44760:

bgti_cont.44761:

bgti_else.44758:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.44759:
	nop
	nop
	nop
	j	bgti_cont.44755

bgti_else.44756:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.44757:
	nop
	nop
	nop
	j	bgti_cont.44755

bgti_else.44754:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.44755:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44778

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44780

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44782

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44784

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44779

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44788

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44790

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44792

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44779

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44796

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44798

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44800

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44779

bgti_else.44800:

bgti_cont.44801:

bgti_else.44798:

bgti_cont.44799:

bgti_else.44796:

bgti_cont.44797:

bgti_else.44794:
bgti_cont.44795:

bgti_else.44792:

bgti_cont.44793:

bgti_else.44790:

bgti_cont.44791:

bgti_else.44788:

bgti_cont.44789:

bgti_else.44786:
bgti_cont.44787:

bgti_else.44784:

bgti_cont.44785:

bgti_else.44782:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44783:
	nop
	nop
	nop
	j	bgti_cont.44779

bgti_else.44780:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44781:
	nop
	nop
	nop
	j	bgti_cont.44779

bgti_else.44778:
bgti_cont.44779:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44802

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44803

bgt_else.44802:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44804

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44806

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44808

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44810

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44805

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44814

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44816

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44818

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44805

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44822

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44824

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44826

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44805

bgti_else.44826:

bgti_cont.44827:

bgti_else.44824:

bgti_cont.44825:

bgti_else.44822:

bgti_cont.44823:

bgti_else.44820:
bgti_cont.44821:

bgti_else.44818:

bgti_cont.44819:

bgti_else.44816:

bgti_cont.44817:

bgti_else.44814:

bgti_cont.44815:

bgti_else.44812:
bgti_cont.44813:

bgti_else.44810:

bgti_cont.44811:

bgti_else.44808:

bgti_cont.44809:

bgti_else.44806:

bgti_cont.44807:

bgti_else.44804:
bgti_cont.44805:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.44803:
bgt_cont.44753:
	nop
	nop
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -14
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44828

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44830

	nop
	nop
	nop
	j	bgt_cont.44829

bgti_else.44830:

bgti_cont.44831:

bgt_else.44828:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.44829:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44832

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44834

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44836

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44838

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44840

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44842

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44844

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44846

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44848

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44850

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44852

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44854

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44854:
	nop
	nop
	addi	%a2, %zero, 11
	nop

bgti_cont.44855:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44852:
	nop
	nop
	addi	%a2, %zero, 10
	nop

bgti_cont.44853:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44850:
	nop
	nop
	addi	%a2, %zero, 9
	nop

bgti_cont.44851:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44848:
	nop
	nop
	addi	%a2, %zero, 8
	nop

bgti_cont.44849:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44846:
	nop
	nop
	addi	%a2, %zero, 7
	nop

bgti_cont.44847:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44844:
	nop
	nop
	addi	%a2, %zero, 6
	nop

bgti_cont.44845:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44842:
	nop
	nop
	addi	%a2, %zero, 5
	nop

bgti_cont.44843:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44840:
	nop
	nop
	addi	%a2, %zero, 4
	nop

bgti_cont.44841:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44838:
	nop
	nop
	addi	%a2, %zero, 3
	nop

bgti_cont.44839:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44836:
	nop
	nop
	addi	%a2, %zero, 2
	nop

bgti_cont.44837:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44834:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bgti_cont.44835:
	nop
	nop
	nop
	j	bgti_cont.44833

bgti_else.44832:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.44833:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44856

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44858

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44860

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44862

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44857

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44866

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44868

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44870

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44857

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44874

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44876

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44878

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44878:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44879:
	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44876:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44877:
	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44874:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44875:
	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44872:
bgti_cont.44873:

bgti_else.44870:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44871:
	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44868:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44869:
	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44866:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44867:
	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44864:
bgti_cont.44865:

bgti_else.44862:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44863:
	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44860:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44861:
	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44858:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44859:
	nop
	nop
	nop
	j	bgti_cont.44857

bgti_else.44856:
bgti_cont.44857:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.44880

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44881

bgt_else.44880:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44882

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44884

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44886

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44888

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44890

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44892

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44894

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44896

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44898

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44900

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44902

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44904

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44883

bgti_else.44904:

bgti_cont.44905:

bgti_else.44902:

bgti_cont.44903:

bgti_else.44900:

bgti_cont.44901:

bgti_else.44898:

bgti_cont.44899:

bgti_else.44896:

bgti_cont.44897:

bgti_else.44894:

bgti_cont.44895:

bgti_else.44892:

bgti_cont.44893:

bgti_else.44890:

bgti_cont.44891:

bgti_else.44888:

bgti_cont.44889:

bgti_else.44886:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.44887:
	nop
	nop
	nop
	j	bgti_cont.44883

bgti_else.44884:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.44885:
	nop
	nop
	nop
	j	bgti_cont.44883

bgti_else.44882:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.44883:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.44906

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44908

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44910

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44912

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44907

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44916

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44918

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44920

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.44907

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.44924

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.44926

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.44928

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44907

bgti_else.44928:

bgti_cont.44929:

bgti_else.44926:

bgti_cont.44927:

bgti_else.44924:

bgti_cont.44925:

bgti_else.44922:
bgti_cont.44923:

bgti_else.44920:

bgti_cont.44921:

bgti_else.44918:

bgti_cont.44919:

bgti_else.44916:

bgti_cont.44917:

bgti_else.44914:
bgti_cont.44915:

bgti_else.44912:

bgti_cont.44913:

bgti_else.44910:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.44911:
	nop
	nop
	nop
	j	bgti_cont.44907

bgti_else.44908:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.44909:
	nop
	nop
	nop
	j	bgti_cont.44907

bgti_else.44906:
bgti_cont.44907:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.44930

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.44931

bgt_else.44930:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44932

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44934

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44936

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44938

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44933

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44942

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44944

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44946

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.44933

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44950

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44952

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44954

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44933

bgti_else.44954:

bgti_cont.44955:

bgti_else.44952:

bgti_cont.44953:

bgti_else.44950:

bgti_cont.44951:

bgti_else.44948:
bgti_cont.44949:

bgti_else.44946:

bgti_cont.44947:

bgti_else.44944:

bgti_cont.44945:

bgti_else.44942:

bgti_cont.44943:

bgti_else.44940:
bgti_cont.44941:

bgti_else.44938:

bgti_cont.44939:

bgti_else.44936:

bgti_cont.44937:

bgti_else.44934:

bgti_cont.44935:

bgti_else.44932:
bgti_cont.44933:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.44931:
bgt_cont.44881:
	nop
	nop
	addi	%v0, %t2, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -14
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.44956

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.44958

	nop
	nop
	nop
	j	bgt_cont.44957

bgti_else.44958:

bgti_cont.44959:

bgt_else.44956:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.44957:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44960

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44962

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44964

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44966

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44968

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44970

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44972

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44974

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44976

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.44978

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.44980

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.44982

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44982:
	nop
	nop
	addi	%a2, %zero, 11
	nop

bgti_cont.44983:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44980:
	nop
	nop
	addi	%a2, %zero, 10
	nop

bgti_cont.44981:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44978:
	nop
	nop
	addi	%a2, %zero, 9
	nop

bgti_cont.44979:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44976:
	nop
	nop
	addi	%a2, %zero, 8
	nop

bgti_cont.44977:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44974:
	nop
	nop
	addi	%a2, %zero, 7
	nop

bgti_cont.44975:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44972:
	nop
	nop
	addi	%a2, %zero, 6
	nop

bgti_cont.44973:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44970:
	nop
	nop
	addi	%a2, %zero, 5
	nop

bgti_cont.44971:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44968:
	nop
	nop
	addi	%a2, %zero, 4
	nop

bgti_cont.44969:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44966:
	nop
	nop
	addi	%a2, %zero, 3
	nop

bgti_cont.44967:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44964:
	nop
	nop
	addi	%a2, %zero, 2
	nop

bgti_cont.44965:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44962:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bgti_cont.44963:
	nop
	nop
	nop
	j	bgti_cont.44961

bgti_else.44960:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.44961:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.44984

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44986

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44988

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44990

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44985

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.44994

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.44996

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.44998

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.44985

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.45002

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.45004

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.45006

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.45006:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.45007:
	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.45004:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.45005:
	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.45002:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.45003:
	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.45000:
bgti_cont.45001:

bgti_else.44998:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44999:
	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.44996:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44997:
	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.44994:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44995:
	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.44992:
bgti_cont.44993:

bgti_else.44990:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.44991:
	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.44988:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.44989:
	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.44986:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.44987:
	nop
	nop
	nop
	j	bgti_cont.44985

bgti_else.44984:
bgti_cont.44985:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.45008

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.45009

bgt_else.45008:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.45010

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.45012

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.45014

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.45016

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.45018

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45020

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45022

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45024

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.45026

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45028

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45030

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45032

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.45011

bgti_else.45032:

bgti_cont.45033:

bgti_else.45030:

bgti_cont.45031:

bgti_else.45028:

bgti_cont.45029:

bgti_else.45026:

bgti_cont.45027:

bgti_else.45024:

bgti_cont.45025:

bgti_else.45022:

bgti_cont.45023:

bgti_else.45020:

bgti_cont.45021:

bgti_else.45018:

bgti_cont.45019:

bgti_else.45016:

bgti_cont.45017:

bgti_else.45014:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.45015:
	nop
	nop
	nop
	j	bgti_cont.45011

bgti_else.45012:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.45013:
	nop
	nop
	nop
	j	bgti_cont.45011

bgti_else.45010:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.45011:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.45034

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.45036

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.45038

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.45040

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.45035

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.45044

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.45046

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.45048

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.45035

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.45052

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.45054

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.45056

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.45035

bgti_else.45056:

bgti_cont.45057:

bgti_else.45054:

bgti_cont.45055:

bgti_else.45052:

bgti_cont.45053:

bgti_else.45050:
bgti_cont.45051:

bgti_else.45048:

bgti_cont.45049:

bgti_else.45046:

bgti_cont.45047:

bgti_else.45044:

bgti_cont.45045:

bgti_else.45042:
bgti_cont.45043:

bgti_else.45040:

bgti_cont.45041:

bgti_else.45038:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.45039:
	nop
	nop
	nop
	j	bgti_cont.45035

bgti_else.45036:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.45037:
	nop
	nop
	nop
	j	bgti_cont.45035

bgti_else.45034:
bgti_cont.45035:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.45058

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.45059

bgt_else.45058:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.45060

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45062

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45064

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45066

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.45061

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45070

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45072

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45074

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.45061

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.45078

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.45080

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.45082

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.45061

bgti_else.45082:

bgti_cont.45083:

bgti_else.45080:

bgti_cont.45081:

bgti_else.45078:

bgti_cont.45079:

bgti_else.45076:
bgti_cont.45077:

bgti_else.45074:

bgti_cont.45075:

bgti_else.45072:

bgti_cont.45073:

bgti_else.45070:

bgti_cont.45071:

bgti_else.45068:
bgti_cont.45069:

bgti_else.45066:

bgti_cont.45067:

bgti_else.45064:

bgti_cont.45065:

bgti_else.45062:

bgti_cont.45063:

bgti_else.45060:
bgti_cont.45061:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 14
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.45059:
bgt_cont.45009:
	nop
	nop
	addi	%v0, %t1, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v0, %t3, 1

	lw	%t4, 5(%sp)
	lw	%t3, 6(%sp)
	nop
	nop

	lw	%t2, 7(%sp)
	lw	%t1, 8(%sp)
	nop
	nop

	lw	%t0, 9(%sp)
	lw	%ra, 10(%sp)
	nop
	nop

	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	j	scan_pixel.3057

scan_line.3063:
	nop
	nop
	add	%a3, %zero, %v0
	add	%v0, %zero, %a1

	sw	%a3, 0(%sp)
	lw	%t0, 155(%zero)
	add	%a1, %zero, %t0
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%a0, 2(%sp)
	nop
	add	%a0, %zero, %a2
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%a0, 4(%sp)
	nop
	nop
	nop

	sw	%t3, 5(%sp)
	nop
	nop
	nop

	sw	%t2, 6(%sp)
	nop
	nop
	nop

	sw	%t1, 7(%sp)
	nop
	nop
	nop

	sw	%a1, 8(%sp)
	nop
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a3, %t0, bgt_else.46365

	nop
	nop
	add	%t0, %zero, %a1
	jr	%ra

bgt_else.46365:
	nop
	nop
	addi	%a1, %t0, -1
	nop

	sw	%a1, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a3, %a1, bgt_else.46367

	nop
	nop
	nop
	j	bgt_cont.46368

bgt_else.46367:
	flw	%f1, 158(%zero)
	lw	%a1, 157(%zero)
	addi	%a2, %a3, 1
	addi	%sp, %sp, 11

	nop
	nop
	sub	%a1, %a2, %a1
	nop

	lw	%a1, 154(%zero)
	nop
	itof	%f0, %a1
	nop

	flw	%f0, 168(%zero)
	nop
	fmul	%f17, %f1, %f0
	addi	%v1, %a1, -1

	flw	%f0, 171(%zero)
	nop
	fmul	%f1, %f17, %f0
	nop

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 172(%zero)
	nop
	fmul	%f16, %f17, %f1
	nop

	flw	%f16, 170(%zero)
	nop
	fadd	%f1, %f16, %f1
	nop

	flw	%f16, 173(%zero)
	nop
	fmul	%f17, %f17, %f16
	nop

	nop
	nop
	fadd	%f2, %f17, %f16
	jal	pretrace_pixels.3046

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.46368:
	lw	%t1, 154(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %t1, bgt_else.46369

	nop
	nop
	nop
	j	bgt_cont.46370

bgt_else.46369:
	lw	%a0, 2(%sp)
	lw	%a1, 0(%sp)
	nop
	nop

	lw	%v0, 0(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 151(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 152(%zero)
	flw	%f0, 2(%a0)
	addi	%a0, %a1, 1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.46371

	nop
	nop
	nop
	j	bgt_cont.46372

bgt_else.46371:
	nop
	nop
	nop
	blt	%zero, %a1, bgt_else.46373

	nop
	nop
	nop
	j	bgt_cont.46374

bgt_else.46373:
	nop
	nop
	nop
	blt	%k1, %t1, bgt_else.46375

	nop
	nop
	nop
	j	bgt_cont.46376

bgt_else.46375:
bgt_cont.46376:
	nop
	nop
	nop
	blt	%at, %t1, bgt_else.46377

	nop
	nop
	nop
	j	bgt_cont.46378

bgt_else.46377:
bgt_cont.46378:
bgt_cont.46374:
bgt_cont.46372:
	nop
	nop
	nop
	beqi	%zero, 0, bnei_else.46379

	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0

	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3030

	nop
	nop
	addi	%sp, %sp, -11
	j	bnei_cont.46380

bnei_else.46379:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	do_without_neighbors.3014

	nop
	nop
	addi	%sp, %sp, -11
	nop

bnei_cont.46380:
	flw	%f0, 151(%zero)
	nop
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.46381

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.46383

	nop
	nop
	nop
	j	bgt_cont.46382

bgti_else.46383:

bgti_cont.46384:

bgt_else.46381:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.46382:
	nop
	nop
	addi	%a3, %zero, 10
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.46385

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.46387

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.46389

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.46391

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46393

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46395

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46397

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46399

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46401

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46403

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46405

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46407

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46386

bgti_else.46407:

bgti_cont.46408:

bgti_else.46405:

bgti_cont.46406:

bgti_else.46403:

bgti_cont.46404:

bgti_else.46401:

bgti_cont.46402:

bgti_else.46399:

bgti_cont.46400:

bgti_else.46397:

bgti_cont.46398:

bgti_else.46395:

bgti_cont.46396:

bgti_else.46393:

bgti_cont.46394:

bgti_else.46391:

bgti_cont.46392:

bgti_else.46389:
	nop
	nop
	addi	%a2, %zero, 2
	nop

bgti_cont.46390:
	nop
	nop
	nop
	j	bgti_cont.46386

bgti_else.46387:

bgti_cont.46388:

bgti_else.46385:

bgti_cont.46386:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.46409

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.46411

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.46413

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.46415

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.46410

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.46419

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.46421

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.46423

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.46410

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.46427

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.46429

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.46431

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46410

bgti_else.46431:

bgti_cont.46432:

bgti_else.46429:

bgti_cont.46430:

bgti_else.46427:

bgti_cont.46428:

bgti_else.46425:
bgti_cont.46426:

bgti_else.46423:

bgti_cont.46424:

bgti_else.46421:

bgti_cont.46422:

bgti_else.46419:

bgti_cont.46420:

bgti_else.46417:
bgti_cont.46418:

bgti_else.46415:

bgti_cont.46416:

bgti_else.46413:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.46414:
	nop
	nop
	nop
	j	bgti_cont.46410

bgti_else.46411:

bgti_cont.46412:

bgti_else.46409:
bgti_cont.46410:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.46433

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.46434

bgt_else.46433:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.46435

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46437

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46439

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46441

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46443

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46445

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46447

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46449

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46451

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46453

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46455

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46457

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46436

bgti_else.46457:

bgti_cont.46458:

bgti_else.46455:

bgti_cont.46456:

bgti_else.46453:

bgti_cont.46454:

bgti_else.46451:

bgti_cont.46452:

bgti_else.46449:

bgti_cont.46450:

bgti_else.46447:

bgti_cont.46448:

bgti_else.46445:

bgti_cont.46446:

bgti_else.46443:

bgti_cont.46444:

bgti_else.46441:

bgti_cont.46442:

bgti_else.46439:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.46440:
	nop
	nop
	nop
	j	bgti_cont.46436

bgti_else.46437:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.46438:
	nop
	nop
	nop
	j	bgti_cont.46436

bgti_else.46435:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.46436:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.46459

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46461

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46463

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46465

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.46460

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46469

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46471

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46473

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.46460

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46477

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46479

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46481

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46460

bgti_else.46481:

bgti_cont.46482:

bgti_else.46479:

bgti_cont.46480:

bgti_else.46477:

bgti_cont.46478:

bgti_else.46475:
bgti_cont.46476:

bgti_else.46473:

bgti_cont.46474:

bgti_else.46471:

bgti_cont.46472:

bgti_else.46469:

bgti_cont.46470:

bgti_else.46467:
bgti_cont.46468:

bgti_else.46465:

bgti_cont.46466:

bgti_else.46463:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.46464:
	nop
	nop
	nop
	j	bgti_cont.46460

bgti_else.46461:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.46462:
	nop
	nop
	nop
	j	bgti_cont.46460

bgti_else.46459:
bgti_cont.46460:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.46483

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 11
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.46484

bgt_else.46483:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46485

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46487

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46489

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46491

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.46486

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46495

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46497

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46499

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.46486

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46503

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46505

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46507

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46486

bgti_else.46507:

bgti_cont.46508:

bgti_else.46505:

bgti_cont.46506:

bgti_else.46503:

bgti_cont.46504:

bgti_else.46501:
bgti_cont.46502:

bgti_else.46499:

bgti_cont.46500:

bgti_else.46497:

bgti_cont.46498:

bgti_else.46495:

bgti_cont.46496:

bgti_else.46493:
bgti_cont.46494:

bgti_else.46491:

bgti_cont.46492:

bgti_else.46489:

bgti_cont.46490:

bgti_else.46487:

bgti_cont.46488:

bgti_else.46485:
bgti_cont.46486:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 11
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 11
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.46484:
bgt_cont.46434:
	nop
	nop
	addi	%a1, %zero, 32
	addi	%sp, %sp, 11

	nop
	nop
	addi	%v0, %a1, 0
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -11
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a2, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.46509

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.46511

	nop
	nop
	nop
	j	bgt_cont.46510

bgti_else.46511:

bgti_cont.46512:

bgt_else.46509:
	nop
	nop
	addi	%a2, %zero, 255
	nop

bgt_cont.46510:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.46513

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46515

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46517

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46519

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46521

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46523

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46525

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46527

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46529

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46531

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46533

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46535

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -11
	addi	%k0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46514

bgti_else.46535:

bgti_cont.46536:

bgti_else.46533:

bgti_cont.46534:

bgti_else.46531:

bgti_cont.46532:

bgti_else.46529:

bgti_cont.46530:

bgti_else.46527:

bgti_cont.46528:

bgti_else.46525:

bgti_cont.46526:

bgti_else.46523:

bgti_cont.46524:

bgti_else.46521:

bgti_cont.46522:

bgti_else.46519:

bgti_cont.46520:

bgti_else.46517:

bgti_cont.46518:

bgti_else.46515:
	nop
	nop
	add	%k0, %zero, %k1
	nop

bgti_cont.46516:
	nop
	nop
	nop
	j	bgti_cont.46514

bgti_else.46513:
	nop
	nop
	add	%k0, %zero, %zero
	nop

bgti_cont.46514:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.46537

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46539

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46541

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46543

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.46538

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46547

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46549

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46551

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.46538

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46555

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46557

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46559

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46538

bgti_else.46559:

bgti_cont.46560:

bgti_else.46557:

bgti_cont.46558:

bgti_else.46555:

bgti_cont.46556:

bgti_else.46553:
bgti_cont.46554:

bgti_else.46551:

bgti_cont.46552:

bgti_else.46549:

bgti_cont.46550:

bgti_else.46547:

bgti_cont.46548:

bgti_else.46545:
bgti_cont.46546:

bgti_else.46543:

bgti_cont.46544:

bgti_else.46541:

bgti_cont.46542:

bgti_else.46539:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.46540:
	nop
	nop
	nop
	j	bgti_cont.46538

bgti_else.46537:
bgti_cont.46538:
	nop
	nop
	nop
	blt	%zero, %k0, bgt_else.46561

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.46562

bgt_else.46561:
	nop
	nop
	nop
	blti	%k0, 10, bgti_else.46563

	nop
	nop
	nop
	blti	%k0, 20, bgti_else.46565

	nop
	nop
	nop
	blti	%k0, 30, bgti_else.46567

	nop
	nop
	nop
	blti	%k0, 40, bgti_else.46569

	nop
	nop
	addi	%a0, %k0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46571

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46573

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46575

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46577

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46579

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46581

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46583

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46585

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46564

bgti_else.46585:

bgti_cont.46586:

bgti_else.46583:

bgti_cont.46584:

bgti_else.46581:

bgti_cont.46582:

bgti_else.46579:

bgti_cont.46580:

bgti_else.46577:

bgti_cont.46578:

bgti_else.46575:

bgti_cont.46576:

bgti_else.46573:

bgti_cont.46574:

bgti_else.46571:

bgti_cont.46572:

bgti_else.46569:

bgti_cont.46570:

bgti_else.46567:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.46568:
	nop
	nop
	nop
	j	bgti_cont.46564

bgti_else.46565:

bgti_cont.46566:

bgti_else.46563:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.46564:
	nop
	nop
	nop
	blti	%k0, 10, bgti_else.46587

	nop
	nop
	nop
	blti	%k0, 20, bgti_else.46589

	nop
	nop
	nop
	blti	%k0, 30, bgti_else.46591

	nop
	nop
	nop
	blti	%k0, 40, bgti_else.46593

	nop
	nop
	addi	%k0, %k0, -40
	nop

	nop
	nop
	nop
	blti	%k0, 10, bgti_cont.46588

	nop
	nop
	nop
	blti	%k0, 20, bgti_else.46597

	nop
	nop
	nop
	blti	%k0, 30, bgti_else.46599

	nop
	nop
	nop
	blti	%k0, 40, bgti_else.46601

	nop
	nop
	addi	%k0, %k0, -40
	nop

	nop
	nop
	nop
	blti	%k0, 10, bgti_cont.46588

	nop
	nop
	nop
	blti	%k0, 20, bgti_else.46605

	nop
	nop
	nop
	blti	%k0, 30, bgti_else.46607

	nop
	nop
	nop
	blti	%k0, 40, bgti_else.46609

	nop
	nop
	addi	%v0, %k0, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -11
	addi	%k0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46588

bgti_else.46609:

bgti_cont.46610:

bgti_else.46607:

bgti_cont.46608:

bgti_else.46605:

bgti_cont.46606:

bgti_else.46603:
bgti_cont.46604:

bgti_else.46601:

bgti_cont.46602:

bgti_else.46599:

bgti_cont.46600:

bgti_else.46597:

bgti_cont.46598:

bgti_else.46595:
bgti_cont.46596:

bgti_else.46593:

bgti_cont.46594:

bgti_else.46591:
	nop
	nop
	addi	%k0, %k0, -20
	nop

bgti_cont.46592:
	nop
	nop
	nop
	j	bgti_cont.46588

bgti_else.46589:

bgti_cont.46590:

bgti_else.46587:
bgti_cont.46588:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.46611

	nop
	nop
	addi	%v0, %k0, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 11
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.46612

bgt_else.46611:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46613

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46615

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46617

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46619

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.46614

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46623

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46625

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46627

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.46614

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46631

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46633

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46635

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46614

bgti_else.46635:

bgti_cont.46636:

bgti_else.46633:

bgti_cont.46634:

bgti_else.46631:

bgti_cont.46632:

bgti_else.46629:
bgti_cont.46630:

bgti_else.46627:

bgti_cont.46628:

bgti_else.46625:

bgti_cont.46626:

bgti_else.46623:

bgti_cont.46624:

bgti_else.46621:
bgti_cont.46622:

bgti_else.46619:

bgti_cont.46620:

bgti_else.46617:

bgti_cont.46618:

bgti_else.46615:

bgti_cont.46616:

bgti_else.46613:
bgti_cont.46614:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %k0, 48

	nop
	nop
	addi	%sp, %sp, 11
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 11
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.46612:
bgt_cont.46562:
	nop
	nop
	addi	%v0, %a1, 0
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -11
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%a1, %f0
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.46637

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.46639

	nop
	nop
	nop
	j	bgt_cont.46638

bgti_else.46639:

bgti_cont.46640:

bgt_else.46637:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.46638:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.46641

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.46643

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.46645

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.46647

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46649

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46651

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46653

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46655

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46657

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46659

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46661

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46663

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46642

bgti_else.46663:

bgti_cont.46664:

bgti_else.46661:

bgti_cont.46662:

bgti_else.46659:

bgti_cont.46660:

bgti_else.46657:

bgti_cont.46658:

bgti_else.46655:

bgti_cont.46656:

bgti_else.46653:

bgti_cont.46654:

bgti_else.46651:

bgti_cont.46652:

bgti_else.46649:

bgti_cont.46650:

bgti_else.46647:

bgti_cont.46648:

bgti_else.46645:

bgti_cont.46646:

bgti_else.46643:

bgti_cont.46644:

bgti_else.46641:
	nop
	nop
	add	%a2, %zero, %zero
	nop

bgti_cont.46642:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.46665

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.46667

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.46669

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.46671

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.46666

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.46675

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.46677

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.46679

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.46666

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.46683

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.46685

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.46687

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46666

bgti_else.46687:

bgti_cont.46688:

bgti_else.46685:

bgti_cont.46686:

bgti_else.46683:

bgti_cont.46684:

bgti_else.46681:
bgti_cont.46682:

bgti_else.46679:

bgti_cont.46680:

bgti_else.46677:

bgti_cont.46678:

bgti_else.46675:

bgti_cont.46676:

bgti_else.46673:
bgti_cont.46674:

bgti_else.46671:

bgti_cont.46672:

bgti_else.46669:

bgti_cont.46670:

bgti_else.46667:

bgti_cont.46668:

bgti_else.46665:
bgti_cont.46666:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.46689

	nop
	nop
	addi	%v0, %a1, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.46690

bgt_else.46689:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.46691

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46693

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46695

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46697

	nop
	nop
	addi	%a0, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46699

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46701

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46703

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46705

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46707

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46709

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46711

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46713

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46692

bgti_else.46713:

bgti_cont.46714:

bgti_else.46711:

bgti_cont.46712:

bgti_else.46709:

bgti_cont.46710:

bgti_else.46707:

bgti_cont.46708:

bgti_else.46705:

bgti_cont.46706:

bgti_else.46703:

bgti_cont.46704:

bgti_else.46701:

bgti_cont.46702:

bgti_else.46699:

bgti_cont.46700:

bgti_else.46697:

bgti_cont.46698:

bgti_else.46695:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.46696:
	nop
	nop
	nop
	j	bgti_cont.46692

bgti_else.46693:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.46694:
	nop
	nop
	nop
	j	bgti_cont.46692

bgti_else.46691:

bgti_cont.46692:
	nop
	nop
	nop
	blti	%a2, 10, bgti_else.46715

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46717

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46719

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46721

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.46716

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46725

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46727

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46729

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.46716

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.46733

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.46735

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.46737

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46716

bgti_else.46737:

bgti_cont.46738:

bgti_else.46735:

bgti_cont.46736:

bgti_else.46733:

bgti_cont.46734:

bgti_else.46731:
bgti_cont.46732:

bgti_else.46729:

bgti_cont.46730:

bgti_else.46727:

bgti_cont.46728:

bgti_else.46725:

bgti_cont.46726:

bgti_else.46723:
bgti_cont.46724:

bgti_else.46721:

bgti_cont.46722:

bgti_else.46719:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.46720:
	nop
	nop
	nop
	j	bgti_cont.46716

bgti_else.46717:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.46718:
	nop
	nop
	nop
	j	bgti_cont.46716

bgti_else.46715:
bgti_cont.46716:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.46739

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 11
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	j	bgt_cont.46740

bgt_else.46739:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.46741

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46743

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46745

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46747

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.46742

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46751

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46753

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46755

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.46742

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.46759

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.46761

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.46763

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.46742

bgti_else.46763:

bgti_cont.46764:

bgti_else.46761:

bgti_cont.46762:

bgti_else.46759:

bgti_cont.46760:

bgti_else.46757:
bgti_cont.46758:

bgti_else.46755:

bgti_cont.46756:

bgti_else.46753:

bgti_cont.46754:

bgti_else.46751:

bgti_cont.46752:

bgti_else.46749:
bgti_cont.46750:

bgti_else.46747:

bgti_cont.46748:

bgti_else.46745:

bgti_cont.46746:

bgti_else.46743:

bgti_cont.46744:

bgti_else.46741:
bgti_cont.46742:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 11
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %a1, 48

	nop
	nop
	addi	%sp, %sp, 11
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.46740:
bgt_cont.46690:
	nop
	nop
	addi	%v0, %a3, 0
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %k1, 0

	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 11
	jal	scan_pixel.3057

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.46370:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	addi	%t2, %a0, 1
	nop

	nop
	nop
	addi	%t3, %a0, 2
	nop

	nop
	nop
	nop
	blti	%t3, 5, bgti_else.46765

	nop
	nop
	addi	%t3, %t3, -5
	j	bgti_cont.46766

bgti_else.46765:
bgti_cont.46766:
	nop
	nop
	nop
	blt	%t2, %t0, bgt_else.46767

	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	nop
	nop

	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	nop
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.46767:
	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%t2, %a0, bgt_else.46769

	nop
	nop
	nop
	j	bgt_cont.46770

bgt_else.46769:
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	addi	%a1, %t2, 1
	addi	%v1, %t1, -1

	lw	%v0, 1(%sp)
	nop
	sub	%a0, %a1, %a0
	addi	%sp, %sp, 11

	nop
	nop
	itof	%f0, %a0
	addi	%a0, %t3, 0

	flw	%f0, 168(%zero)
	nop
	fmul	%f17, %f1, %f0
	nop

	flw	%f0, 171(%zero)
	nop
	fmul	%f1, %f17, %f0
	nop

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 172(%zero)
	nop
	fmul	%f16, %f17, %f1
	nop

	flw	%f16, 170(%zero)
	nop
	fadd	%f1, %f16, %f1
	nop

	flw	%f16, 173(%zero)
	nop
	fmul	%f17, %f17, %f16
	nop

	nop
	nop
	fadd	%f2, %f17, %f16
	jal	pretrace_pixels.3046

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.46770:
	lw	%a2, 1(%sp)
	lw	%a1, 3(%sp)
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	lw	%a0, 2(%sp)
	nop
	addi	%sp, %sp, 11
	jal	scan_pixel.3057

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %t2, 1

	nop
	nop
	addi	%a2, %t3, 2
	nop

	nop
	nop
	nop
	blti	%a2, 5, bgti_else.46771

	nop
	nop
	addi	%a2, %a2, -5
	j	bgti_cont.46772

bgti_else.46771:
bgti_cont.46772:
	lw	%t3, 5(%sp)
	lw	%t2, 6(%sp)
	nop
	nop

	lw	%t1, 7(%sp)
	lw	%t0, 8(%sp)
	nop
	nop

	lw	%ra, 9(%sp)
	lw	%a1, 2(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	lw	%v1, 3(%sp)
	nop
	j	scan_line.3063

init_line_elements.3073:
	nop
	nop
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1

	nop
	nop
	add	%a3, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.46803

	nop
	nop
	addi	%k0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%v0, %k0, 0
	jal	min_caml_create_float_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%s1, %zero, 5

	nop
	nop
	addi	%v0, %s1, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s2)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s2)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s2)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s2)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s1, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s4, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s6)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%ra)
	nop
	add	%at, %a1, %a2
	nop

	sw	%s7, 6(%ra)
	nop
	nop
	nop

	sw	%s6, 5(%ra)
	nop
	nop
	nop

	sw	%s5, 4(%ra)
	nop
	nop
	nop

	sw	%s4, 3(%ra)
	nop
	addi	%s4, %a2, -1
	nop

	sw	%s3, 2(%ra)
	nop
	nop
	nop

	sw	%s2, 1(%ra)
	nop
	nop
	nop

	sw	%s0, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s4, 0, bgti_else.46804

	nop
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s1, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s6)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%ra)
	nop
	add	%at, %a1, %s4
	addi	%s4, %s4, -1

	sw	%s7, 6(%ra)
	nop
	nop
	nop

	sw	%s6, 5(%ra)
	nop
	nop
	nop

	sw	%s5, 4(%ra)
	nop
	nop
	nop

	sw	%s3, 3(%ra)
	nop
	nop
	nop

	sw	%s2, 2(%ra)
	nop
	nop
	nop

	sw	%s0, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s4, 0, bgti_else.46805

	nop
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s1, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s6)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%ra, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%ra)
	nop
	add	%at, %a1, %s4
	addi	%s4, %s4, -1

	sw	%s7, 6(%ra)
	nop
	nop
	nop

	sw	%s6, 5(%ra)
	nop
	nop
	nop

	sw	%s5, 4(%ra)
	nop
	nop
	nop

	sw	%s3, 3(%ra)
	nop
	nop
	nop

	sw	%s2, 2(%ra)
	nop
	nop
	nop

	sw	%s0, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s4, 0, bgti_else.46806

	nop
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s1, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s6)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s6)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s7, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%k0, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%k0)
	nop
	add	%at, %a1, %s4
	addi	%v1, %s4, -1

	sw	%s7, 6(%k0)
	nop
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0

	sw	%s6, 5(%k0)
	nop
	nop
	nop

	sw	%s5, 4(%k0)
	nop
	nop
	nop

	sw	%s3, 3(%k0)
	nop
	nop
	nop

	sw	%s2, 2(%k0)
	nop
	nop
	nop

	sw	%s0, 1(%k0)
	nop
	nop
	nop

	sw	%a2, 0(%k0)
	nop
	nop
	nop

	sw	%k0, 0(%at)
	nop
	nop
	j	init_line_elements.3073

bgti_else.46806:

	nop
	nop
	nop
	jr	%ra

bgti_else.46805:
	nop
	nop
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1

	nop
	nop
	nop
	jr	%ra

bgti_else.46804:

	nop
	nop
	nop
	jr	%ra

bgti_else.46803:

	nop
	nop
	nop
	jr	%ra

calc_dirvec.3083:
	nop
	nop
	fmov	%f17, %f2
	add	%a1, %zero, %ra

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.47237

	lw	%a3, 179(%v1)
	nop
	fmul	%f17, %f0, %f0
	fmul	%f16, %f1, %f1

	nop
	nop
	fadd	%f16, %f17, %f16
	add	%at, %a3, %a0

	lw	%a2, 0(%at)
	nop
	fadd	%f16, %f16, %f30
	add	%ra, %zero, %a1

	lw	%a2, 0(%a2)
	nop
	fsqrt	%f16, %f16
	nop

	nop
	nop
	fdiv	%f19, %f0, %f16
	fdiv	%f17, %f1, %f16

	fsw	%f19, 0(%a2)
	nop
	fdiv	%f18, %f30, %f16
	fneg	%f0, %f17

	fsw	%f17, 1(%a2)
	nop
	fneg	%f1, %f19
	fneg	%f16, %f19

	fsw	%f18, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%a2, %a0, 40
	nop

	nop
	nop
	add	%at, %a3, %a2
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	lw	%a2, 0(%a2)
	nop
	nop
	nop

	fsw	%f19, 0(%a2)
	nop
	nop
	nop

	fsw	%f18, 1(%a2)
	nop
	nop
	nop

	fsw	%f0, 2(%a2)
	nop
	fneg	%f0, %f17
	nop

	nop
	nop
	addi	%a2, %a0, 80
	nop

	nop
	nop
	add	%at, %a3, %a2
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	lw	%a2, 0(%a2)
	nop
	nop
	nop

	fsw	%f18, 0(%a2)
	nop
	nop
	nop

	fsw	%f1, 1(%a2)
	nop
	fneg	%f1, %f17
	nop

	fsw	%f0, 2(%a2)
	nop
	fneg	%f0, %f18
	nop

	nop
	nop
	addi	%a2, %a0, 1
	nop

	nop
	nop
	add	%at, %a3, %a2
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	lw	%a2, 0(%a2)
	nop
	nop
	nop

	fsw	%f16, 0(%a2)
	nop
	nop
	nop

	fsw	%f1, 1(%a2)
	nop
	fneg	%f1, %f19
	nop

	fsw	%f0, 2(%a2)
	nop
	fneg	%f0, %f18
	nop

	nop
	nop
	addi	%a2, %a0, 41
	addi	%a0, %a0, 81

	nop
	nop
	add	%at, %a3, %a2
	nop

	lw	%a2, 0(%at)
	nop
	add	%at, %a3, %a0
	nop

	lw	%a2, 0(%a2)
	lw	%a0, 0(%at)
	nop
	nop

	fsw	%f1, 0(%a2)
	lw	%a0, 0(%a0)
	nop
	nop

	fsw	%f0, 1(%a2)
	nop
	fneg	%f0, %f18
	nop

	fsw	%f17, 2(%a2)
	fsw	%f0, 0(%a0)
	nop
	nop

	fsw	%f19, 1(%a0)
	nop
	nop
	nop

	fsw	%f17, 2(%a0)
	nop
	nop
	jr	%ra

bgti_else.47237:
	flw	%f20, 441(%zero)
	nop
	fmul	%f0, %f1, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fsqrt	%f19, %f0
	nop

	nop
	nop
	fdiv	%f2, %f30, %f19
	nop

	nop
	nop
	nop
	fblt	%f2, %fzero, fbgt_else.47239

	nop
	nop
	add	%a2, %zero, %k1
	j	fbgt_cont.47240

fbgt_else.47239:

fbgt_cont.47240:
	flw	%f21, 462(%zero)
	nop
	fabs	%f18, %f2
	nop

	nop
	nop
	nop
	fblt	%f18, %f21, fbgt_else.47241

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_else.47243

	flw	%f16, 479(%zero)
	flw	%f0, 461(%zero)
	fdiv	%f22, %f30, %f18
	nop

	nop
	nop
	fmul	%f23, %f22, %f22
	fmul	%f0, %f0, %f22

	nop
	nop
	fmul	%f2, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 460(%zero)
	nop
	fmul	%f18, %f2, %f2
	fsub	%f1, %f22, %f0

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f16, %f0
	j	fbgt_cont.47244

fbgt_else.47243:
	flw	%f16, 478(%zero)
	nop
	fsub	%f1, %f18, %f30
	fadd	%f0, %f18, %f30

	flw	%f0, 461(%zero)
	nop
	fdiv	%f22, %f1, %f0
	nop

	nop
	nop
	fmul	%f23, %f22, %f22
	fmul	%f0, %f0, %f22

	nop
	nop
	fmul	%f2, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 460(%zero)
	nop
	fmul	%f18, %f2, %f2
	fsub	%f1, %f22, %f0

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

fbgt_cont.47244:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47245

	nop
	nop
	nop
	j	fbgt_cont.47242

bnei_else.47245:

bnei_cont.47246:

fbgt_else.47241:

	nop
	nop
	fmul	%f18, %f22, %f22
	fmul	%f0, %f0, %f2

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f0, %f0, %f22

	flw	%f0, 460(%zero)
	nop
	fsub	%f1, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.47242:
	flw	%f22, 494(%zero)
	nop
	fmul	%f23, %f0, %f17
	nop

	nop
	nop
	nop
	fblt	%f23, %fzero, fbgt_else.47247

	nop
	nop
	add	%a2, %zero, %k1
	j	fbgt_cont.47248

fbgt_else.47247:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbgt_cont.47248:
	flw	%f2, 493(%zero)
	nop
	fabs	%f18, %f23
	nop

	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_else.47249

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f0, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_cont.47250

	flw	%f1, 482(%zero)
	nop
	fmov	%f0, %f18
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	j	fbgt_cont.47250

fbgt_else.47269:
fbgt_cont.47270:

fbgt_else.47267:
fbgt_cont.47268:

fbgt_else.47265:
fbgt_cont.47266:

fbgt_else.47263:
fbgt_cont.47264:

fbgt_else.47261:
fbgt_cont.47262:

fbgt_else.47259:
fbgt_cont.47260:

fbgt_else.47257:
fbgt_cont.47258:

fbgt_else.47255:
fbgt_cont.47256:

fbgt_else.47253:
fbgt_cont.47254:

fbgt_else.47251:
fbgt_cont.47252:

fbgt_else.47249:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.47250:
	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_else.47271

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_else.47273

	flw	%f16, 495(%zero)
	nop
	fsub	%f18, %f18, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_cont.47272

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_else.47277

	nop
	nop
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16

	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_cont.47272

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_else.47281

	nop
	nop
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	j	fbgt_cont.47272

fbgt_else.47281:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	nop

fbgt_cont.47282:

fbgt_else.47279:
fbgt_cont.47280:

fbgt_else.47277:

	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_cont.47272

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_else.47285

	nop
	nop
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	j	fbgt_cont.47272

fbgt_else.47285:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	nop

fbgt_cont.47286:

fbgt_else.47283:
fbgt_cont.47284:
fbgt_cont.47278:

fbgt_else.47275:
fbgt_cont.47276:

fbgt_else.47273:

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_cont.47272

	nop
	nop
	nop
	fblt	%f18, %f0, fbgt_else.47289

	nop
	nop
	fsub	%f18, %f18, %f0
	fdiv	%f1, %f0, %f16

	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_cont.47272

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_else.47293

	nop
	nop
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	j	fbgt_cont.47272

fbgt_else.47293:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	nop

fbgt_cont.47294:

fbgt_else.47291:
fbgt_cont.47292:

fbgt_else.47289:

	nop
	nop
	nop
	fblt	%f18, %f2, fbgt_cont.47272

	nop
	nop
	nop
	fblt	%f18, %f1, fbgt_else.47297

	nop
	nop
	fsub	%f0, %f18, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	j	fbgt_cont.47272

fbgt_else.47297:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f18, %f0
	nop

fbgt_cont.47298:

fbgt_else.47295:
fbgt_cont.47296:
fbgt_cont.47290:

fbgt_else.47287:
fbgt_cont.47288:
fbgt_cont.47274:

fbgt_else.47271:
fbgt_cont.47272:
	nop
	nop
	nop
	fblt	%f18, %f22, fbgt_else.47299

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47301

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.47300

bnei_else.47301:

bnei_cont.47302:

fbgt_else.47299:
fbgt_cont.47300:
	nop
	nop
	nop
	fblt	%f18, %f22, fbgt_else.47303

	nop
	nop
	fsub	%f18, %f18, %f22
	j	fbgt_cont.47304

fbgt_else.47303:
fbgt_cont.47304:
	flw	%f24, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f18, %f24, fbgt_else.47305

	nop
	nop
	fsub	%f18, %f22, %f18
	j	fbgt_cont.47306

fbgt_else.47305:
fbgt_cont.47306:
	flw	%f25, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f25, %f18, fbgt_else.47307

	flw	%f0, 477(%zero)
	nop
	fmul	%f26, %f18, %f18
	nop

	nop
	nop
	fmul	%f16, %f26, %f26
	fmul	%f0, %f0, %f18

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f18, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f18, %f1, %f0
	j	fbgt_cont.47308

fbgt_else.47307:
	nop
	nop
	fsub	%f0, %f24, %f18
	nop

	flw	%f0, 473(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f18, %f1, %f0
	nop

fbgt_cont.47308:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47309

	nop
	nop
	nop
	j	bnei_cont.47310

bnei_else.47309:
	nop
	nop
	fneg	%f18, %f18
	nop

bnei_cont.47310:
	nop
	nop
	fabs	%f23, %f23
	nop

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_else.47311

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f0, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.47312

	flw	%f1, 482(%zero)
	nop
	fmov	%f0, %f23
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	j	fbgt_cont.47312

fbgt_else.47331:
fbgt_cont.47332:

fbgt_else.47329:
fbgt_cont.47330:

fbgt_else.47327:
fbgt_cont.47328:

fbgt_else.47325:
fbgt_cont.47326:

fbgt_else.47323:
fbgt_cont.47324:

fbgt_else.47321:
fbgt_cont.47322:

fbgt_else.47319:
fbgt_cont.47320:

fbgt_else.47317:
fbgt_cont.47318:

fbgt_else.47315:
fbgt_cont.47316:

fbgt_else.47313:
fbgt_cont.47314:

fbgt_else.47311:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.47312:
	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_else.47333

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_else.47335

	flw	%f16, 495(%zero)
	nop
	fsub	%f23, %f23, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_cont.47334

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_else.47339

	nop
	nop
	fsub	%f23, %f23, %f0
	fdiv	%f1, %f0, %f16

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_cont.47334

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_else.47343

	nop
	nop
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	j	fbgt_cont.47334

fbgt_else.47343:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	nop

fbgt_cont.47344:

fbgt_else.47341:
fbgt_cont.47342:

fbgt_else.47339:

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_cont.47334

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_else.47347

	nop
	nop
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	j	fbgt_cont.47334

fbgt_else.47347:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	nop

fbgt_cont.47348:

fbgt_else.47345:
fbgt_cont.47346:
fbgt_cont.47340:

fbgt_else.47337:
fbgt_cont.47338:

fbgt_else.47335:

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_cont.47334

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_else.47351

	nop
	nop
	fsub	%f23, %f23, %f0
	fdiv	%f1, %f0, %f16

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_cont.47334

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_else.47355

	nop
	nop
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	j	fbgt_cont.47334

fbgt_else.47355:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	nop

fbgt_cont.47356:

fbgt_else.47353:
fbgt_cont.47354:

fbgt_else.47351:

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_cont.47334

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_else.47359

	nop
	nop
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	j	fbgt_cont.47334

fbgt_else.47359:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f23, %f0
	nop

fbgt_cont.47360:

fbgt_else.47357:
fbgt_cont.47358:
fbgt_cont.47352:

fbgt_else.47349:
fbgt_cont.47350:
fbgt_cont.47336:

fbgt_else.47333:
fbgt_cont.47334:
	nop
	nop
	nop
	fblt	%f23, %f22, fbgt_else.47361

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.47362

fbgt_else.47361:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.47362:
	nop
	nop
	nop
	fblt	%f23, %f22, fbgt_else.47363

	nop
	nop
	fsub	%f23, %f23, %f22
	j	fbgt_cont.47364

fbgt_else.47363:
fbgt_cont.47364:
	nop
	nop
	nop
	fblt	%f23, %f24, fbgt_else.47365

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47367

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.47366

bnei_else.47367:

bnei_cont.47368:

fbgt_else.47365:
fbgt_cont.47366:
	nop
	nop
	nop
	fblt	%f23, %f24, fbgt_else.47369

	nop
	nop
	fsub	%f23, %f22, %f23
	j	fbgt_cont.47370

fbgt_else.47369:
fbgt_cont.47370:
	nop
	nop
	nop
	fblt	%f25, %f23, fbgt_else.47371

	flw	%f0, 473(%zero)
	nop
	fmul	%f23, %f23, %f23
	nop

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47372

fbgt_else.47371:
	flw	%f0, 477(%zero)
	nop
	fsub	%f26, %f24, %f23
	nop

	nop
	nop
	fmul	%f23, %f26, %f26
	fmul	%f0, %f0, %f26

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f26, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f26
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.47372:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47373

	nop
	nop
	nop
	j	bnei_cont.47374

bnei_else.47373:

bnei_cont.47374:
	nop
	nop
	fdiv	%f0, %f18, %f0
	addi	%v0, %v0, 1

	nop
	nop
	fmul	%f18, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f18, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f20
	nop

	nop
	nop
	fsqrt	%f20, %f0
	nop

	nop
	nop
	fdiv	%f16, %f30, %f20
	nop

	nop
	nop
	nop
	fblt	%f16, %fzero, fbgt_else.47375

	nop
	nop
	add	%a2, %zero, %k1
	j	fbgt_cont.47376

fbgt_else.47375:

fbgt_cont.47376:
	nop
	nop
	fabs	%f19, %f16
	nop

	nop
	nop
	nop
	fblt	%f19, %f21, fbgt_else.47377

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_else.47379

	flw	%f0, 461(%zero)
	nop
	fdiv	%f21, %f30, %f19
	nop

	nop
	nop
	fmul	%f23, %f21, %f21
	fmul	%f0, %f0, %f21

	nop
	nop
	fmul	%f19, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 460(%zero)
	nop
	fmul	%f16, %f19, %f19
	fsub	%f1, %f21, %f0

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f24, %f0
	j	fbgt_cont.47380

fbgt_else.47379:
	nop
	nop
	fsub	%f1, %f19, %f30
	fadd	%f0, %f19, %f30

	flw	%f0, 461(%zero)
	nop
	fdiv	%f21, %f1, %f0
	nop

	nop
	nop
	fmul	%f23, %f21, %f21
	fmul	%f0, %f0, %f21

	nop
	nop
	fmul	%f19, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 460(%zero)
	nop
	fmul	%f16, %f19, %f19
	fsub	%f1, %f21, %f0

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f25, %f0
	nop

fbgt_cont.47380:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47381

	nop
	nop
	nop
	j	fbgt_cont.47378

bnei_else.47381:

bnei_cont.47382:

fbgt_else.47377:

	nop
	nop
	fmul	%f21, %f23, %f23
	fmul	%f0, %f0, %f16

	nop
	nop
	fmul	%f19, %f21, %f21
	fmul	%f0, %f0, %f23

	flw	%f0, 460(%zero)
	nop
	fsub	%f1, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 459(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	flw	%f0, 458(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 457(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 456(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.47378:
	nop
	nop
	fmul	%f21, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f21, %fzero, fbgt_else.47383

	nop
	nop
	add	%a2, %zero, %k1
	j	fbgt_cont.47384

fbgt_else.47383:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbgt_cont.47384:
	nop
	nop
	fabs	%f19, %f21
	nop

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_else.47385

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f0, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.47386

	flw	%f1, 482(%zero)
	nop
	fmov	%f0, %f19
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	j	fbgt_cont.47386

fbgt_else.47405:
fbgt_cont.47406:

fbgt_else.47403:
fbgt_cont.47404:

fbgt_else.47401:
fbgt_cont.47402:

fbgt_else.47399:
fbgt_cont.47400:

fbgt_else.47397:
fbgt_cont.47398:

fbgt_else.47395:
fbgt_cont.47396:

fbgt_else.47393:
fbgt_cont.47394:

fbgt_else.47391:
fbgt_cont.47392:

fbgt_else.47389:
fbgt_cont.47390:

fbgt_else.47387:
fbgt_cont.47388:

fbgt_else.47385:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.47386:
	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_else.47407

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_else.47409

	flw	%f16, 495(%zero)
	nop
	fsub	%f19, %f19, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_cont.47408

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_else.47413

	nop
	nop
	fsub	%f19, %f19, %f0
	fdiv	%f1, %f0, %f16

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_cont.47408

	nop
	nop
	nop
	fblt	%f19, %f1, fbgt_else.47417

	nop
	nop
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f19, %f0
	j	fbgt_cont.47408

fbgt_else.47417:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f19, %f0
	nop

fbgt_cont.47418:

fbgt_else.47415:
fbgt_cont.47416:

fbgt_else.47413:

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_cont.47408

	nop
	nop
	nop
	fblt	%f19, %f1, fbgt_else.47421

	nop
	nop
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f19, %f0
	j	fbgt_cont.47408

fbgt_else.47421:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f19, %f0
	nop

fbgt_cont.47422:

fbgt_else.47419:
fbgt_cont.47420:
fbgt_cont.47414:

fbgt_else.47411:
fbgt_cont.47412:

fbgt_else.47409:

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_cont.47408

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_else.47425

	nop
	nop
	fsub	%f19, %f19, %f0
	fdiv	%f1, %f0, %f16

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_cont.47408

	nop
	nop
	nop
	fblt	%f19, %f1, fbgt_else.47429

	nop
	nop
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f19, %f0
	j	fbgt_cont.47408

fbgt_else.47429:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f19, %f0
	nop

fbgt_cont.47430:

fbgt_else.47427:
fbgt_cont.47428:

fbgt_else.47425:

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_cont.47408

	nop
	nop
	nop
	fblt	%f19, %f1, fbgt_else.47433

	nop
	nop
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f19, %f0
	j	fbgt_cont.47408

fbgt_else.47433:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f19, %f0
	nop

fbgt_cont.47434:

fbgt_else.47431:
fbgt_cont.47432:
fbgt_cont.47426:

fbgt_else.47423:
fbgt_cont.47424:
fbgt_cont.47410:

fbgt_else.47407:
fbgt_cont.47408:
	nop
	nop
	nop
	fblt	%f19, %f22, fbgt_else.47435

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47437

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.47436

bnei_else.47437:

bnei_cont.47438:

fbgt_else.47435:
fbgt_cont.47436:
	nop
	nop
	nop
	fblt	%f19, %f22, fbgt_else.47439

	nop
	nop
	fsub	%f19, %f19, %f22
	j	fbgt_cont.47440

fbgt_else.47439:
fbgt_cont.47440:
	nop
	nop
	nop
	fblt	%f19, %f24, fbgt_else.47441

	nop
	nop
	fsub	%f19, %f22, %f19
	j	fbgt_cont.47442

fbgt_else.47441:
fbgt_cont.47442:
	nop
	nop
	nop
	fblt	%f25, %f19, fbgt_else.47443

	flw	%f0, 477(%zero)
	nop
	fmul	%f23, %f19, %f19
	nop

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f19

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f19, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f19, %f1, %f0
	j	fbgt_cont.47444

fbgt_else.47443:
	nop
	nop
	fsub	%f0, %f24, %f19
	nop

	flw	%f0, 473(%zero)
	nop
	fmul	%f19, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f19, %f19
	fmul	%f0, %f0, %f19

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f19, %f1, %f0
	nop

fbgt_cont.47444:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47445

	nop
	nop
	nop
	j	bnei_cont.47446

bnei_else.47445:
	nop
	nop
	fneg	%f19, %f19
	nop

bnei_cont.47446:
	nop
	nop
	fabs	%f21, %f21
	nop

	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_else.47447

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f0, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_cont.47448

	flw	%f1, 482(%zero)
	nop
	fmov	%f0, %f21
	jal	reduction_2pi_sub1.2626

	nop
	nop
	nop
	j	fbgt_cont.47448

fbgt_else.47467:
fbgt_cont.47468:

fbgt_else.47465:
fbgt_cont.47466:

fbgt_else.47463:
fbgt_cont.47464:

fbgt_else.47461:
fbgt_cont.47462:

fbgt_else.47459:
fbgt_cont.47460:

fbgt_else.47457:
fbgt_cont.47458:

fbgt_else.47455:
fbgt_cont.47456:

fbgt_else.47453:
fbgt_cont.47454:

fbgt_else.47451:
fbgt_cont.47452:

fbgt_else.47449:
fbgt_cont.47450:

fbgt_else.47447:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.47448:
	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_else.47469

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_else.47471

	flw	%f16, 495(%zero)
	nop
	fsub	%f21, %f21, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_cont.47470

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_else.47475

	nop
	nop
	fsub	%f21, %f21, %f0
	fdiv	%f1, %f0, %f16

	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_cont.47470

	nop
	nop
	nop
	fblt	%f21, %f1, fbgt_else.47479

	nop
	nop
	fsub	%f0, %f21, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f21, %f0
	j	fbgt_cont.47470

fbgt_else.47479:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f21, %f0
	nop

fbgt_cont.47480:

fbgt_else.47477:
fbgt_cont.47478:

fbgt_else.47475:

	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_cont.47470

	nop
	nop
	nop
	fblt	%f21, %f1, fbgt_else.47483

	nop
	nop
	fsub	%f0, %f21, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f21, %f0
	j	fbgt_cont.47470

fbgt_else.47483:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f21, %f0
	nop

fbgt_cont.47484:

fbgt_else.47481:
fbgt_cont.47482:
fbgt_cont.47476:

fbgt_else.47473:
fbgt_cont.47474:

fbgt_else.47471:

	nop
	nop
	fdiv	%f0, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_cont.47470

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_else.47487

	nop
	nop
	fsub	%f21, %f21, %f0
	fdiv	%f1, %f0, %f16

	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_cont.47470

	nop
	nop
	nop
	fblt	%f21, %f1, fbgt_else.47491

	nop
	nop
	fsub	%f0, %f21, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f21, %f0
	j	fbgt_cont.47470

fbgt_else.47491:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f21, %f0
	nop

fbgt_cont.47492:

fbgt_else.47489:
fbgt_cont.47490:

fbgt_else.47487:

	nop
	nop
	nop
	fblt	%f21, %f2, fbgt_cont.47470

	nop
	nop
	nop
	fblt	%f21, %f1, fbgt_else.47495

	nop
	nop
	fsub	%f0, %f21, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f21, %f0
	j	fbgt_cont.47470

fbgt_else.47495:

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2629

	nop
	nop
	fmov	%f21, %f0
	nop

fbgt_cont.47496:

fbgt_else.47493:
fbgt_cont.47494:
fbgt_cont.47488:

fbgt_else.47485:
fbgt_cont.47486:
fbgt_cont.47472:

fbgt_else.47469:
fbgt_cont.47470:
	nop
	nop
	nop
	fblt	%f21, %f22, fbgt_else.47497

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.47498

fbgt_else.47497:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.47498:
	nop
	nop
	nop
	fblt	%f21, %f22, fbgt_else.47499

	nop
	nop
	fsub	%f21, %f21, %f22
	j	fbgt_cont.47500

fbgt_else.47499:
fbgt_cont.47500:
	nop
	nop
	nop
	fblt	%f21, %f24, fbgt_else.47501

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47503

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.47502

bnei_else.47503:

bnei_cont.47504:

fbgt_else.47501:
fbgt_cont.47502:
	nop
	nop
	nop
	fblt	%f21, %f24, fbgt_else.47505

	nop
	nop
	fsub	%f21, %f22, %f21
	j	fbgt_cont.47506

fbgt_else.47505:
fbgt_cont.47506:
	nop
	nop
	nop
	fblt	%f25, %f21, fbgt_else.47507

	flw	%f0, 473(%zero)
	nop
	fmul	%f2, %f21, %f21
	nop

	nop
	nop
	fmul	%f16, %f2, %f2
	fmul	%f0, %f0, %f2

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.47508

fbgt_else.47507:
	flw	%f0, 477(%zero)
	nop
	fsub	%f21, %f24, %f21
	nop

	nop
	nop
	fmul	%f2, %f21, %f21
	fmul	%f0, %f0, %f21

	nop
	nop
	fmul	%f16, %f2, %f2
	fmul	%f0, %f0, %f2

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f21, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.47508:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.47509

	nop
	nop
	nop
	j	bnei_cont.47510

bnei_else.47509:

bnei_cont.47510:
	nop
	nop
	fdiv	%f0, %f19, %f0
	add	%ra, %zero, %a1

	nop
	nop
	fmul	%f1, %f0, %f20
	fmov	%f2, %f17

	nop
	nop
	fmov	%f0, %f18
	j	calc_dirvec.3083

calc_dirvecs.3091:
	nop
	nop
	fmov	%f3, %f0
	add	%k0, %zero, %v0

	nop
	nop
	add	%s0, %zero, %a0
	add	%s1, %zero, %ra

	nop
	nop
	nop
	blti	%k0, 0, bgti_else.47543

	flw	%f28, 460(%zero)
	flw	%f27, 438(%zero)
	itof	%f0, %k0
	addi	%a0, %s0, 0

	nop
	nop
	fmul	%f0, %f0, %f28
	addi	%v0, %zero, 0

	nop
	nop
	fsub	%f2, %f0, %f27
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3083

	flw	%f29, 441(%zero)
	nop
	itof	%f0, %k0
	addi	%s2, %s0, 2

	nop
	nop
	fmul	%f0, %f0, %f28
	addi	%a0, %s2, 0

	nop
	nop
	fadd	%f2, %f0, %f29
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f1, %fzero
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3083

	nop
	nop
	addi	%k0, %k0, -1
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.47544

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.47545

bgti_else.47544:
bgti_cont.47545:
	nop
	nop
	nop
	blti	%k0, 0, bgti_else.47546

	nop
	nop
	itof	%f0, %k0
	addi	%a0, %s0, 0

	nop
	nop
	fmul	%f0, %f0, %f28
	addi	%v0, %zero, 0

	nop
	nop
	fsub	%f2, %f0, %f27
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3083

	nop
	nop
	itof	%f0, %k0
	addi	%a0, %s2, 0

	nop
	nop
	fmul	%f0, %f0, %f28
	addi	%v0, %zero, 0

	nop
	nop
	fadd	%f2, %f0, %f29
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3083

	nop
	nop
	addi	%v0, %k0, -1
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.47547

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.47548

bgti_else.47547:
bgti_cont.47548:
	nop
	nop
	add	%ra, %zero, %s1
	addi	%a0, %s0, 0

	nop
	nop
	fmov	%f0, %f3
	j	calc_dirvecs.3091

bgti_else.47546:
	nop
	nop
	add	%ra, %zero, %s1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.47543:
	nop
	nop
	add	%ra, %zero, %s1
	nop

	nop
	nop
	nop
	jr	%ra

calc_dirvec_rows.3096:
	nop
	nop
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1

	nop
	nop
	add	%s5, %zero, %a0
	add	%s6, %zero, %ra

	nop
	nop
	nop
	blti	%s3, 0, bgti_else.47586

	flw	%f4, 460(%zero)
	flw	%f5, 438(%zero)
	itof	%f0, %s3
	addi	%s7, %zero, 4

	nop
	nop
	fmul	%f0, %f0, %f4
	addi	%a0, %s5, 0

	nop
	nop
	fsub	%f3, %f0, %f5
	itof	%f0, %s7

	nop
	nop
	fmul	%f0, %f0, %f4
	addi	%v1, %s4, 0

	nop
	nop
	fsub	%f2, %f0, %f5
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f1, %fzero
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3083

	nop
	nop
	itof	%f0, %s7
	addi	%a0, %s5, 2

	flw	%f0, 441(%zero)
	nop
	fmul	%f1, %f0, %f4
	addi	%v1, %s4, 0

	nop
	nop
	fadd	%f2, %f1, %f0
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f1, %fzero
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3083

	nop
	nop
	addi	%v0, %zero, 3
	addi	%v1, %s4, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.47587

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.47588

bgti_else.47587:
bgti_cont.47588:
	nop
	nop
	addi	%a0, %s5, 0
	fmov	%f0, %f3

	nop
	nop
	nop
	jal	calc_dirvecs.3091

	nop
	nop
	addi	%t7, %s3, -1
	addi	%s3, %s4, 2

	nop
	nop
	nop
	blti	%s3, 5, bgti_else.47589

	nop
	nop
	addi	%s3, %s3, -5
	j	bgti_cont.47590

bgti_else.47589:
bgti_cont.47590:
	nop
	nop
	addi	%s4, %s5, 4
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.47591

	nop
	nop
	itof	%f0, %t7
	addi	%a0, %s4, 0

	nop
	nop
	fmul	%f0, %f0, %f4
	addi	%v1, %s3, 0

	nop
	nop
	fsub	%f0, %f0, %f5
	addi	%v0, %s7, 0

	nop
	nop
	nop
	jal	calc_dirvecs.3091

	nop
	nop
	addi	%v0, %t7, -1
	addi	%v1, %s3, 2

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.47592

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.47593

bgti_else.47592:
bgti_cont.47593:
	nop
	nop
	addi	%a0, %s4, 4
	add	%ra, %zero, %s6

	nop
	nop
	nop
	j	calc_dirvec_rows.3096

bgti_else.47591:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.47586:

	nop
	nop
	nop
	jr	%ra

create_dirvec_elements.3102:
	nop
	nop
	add	%a1, %zero, %v0
	add	%a2, %zero, %v1

	nop
	nop
	add	%a3, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.47630

	nop
	nop
	addi	%k0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%v0, %k0, 0
	jal	min_caml_create_float_array

	lw	%s1, 0(%zero)
	nop
	addi	%s0, %v0, 0
	nop

	nop
	nop
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	add	%at, %a1, %a2
	nop

	sw	%s0, 0(%a0)
	nop
	addi	%s0, %a2, -1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s0, 0, bgti_else.47631

	nop
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	addi	%v1, %a2, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	add	%at, %a1, %s0
	addi	%s0, %s0, -1

	sw	%a2, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s0, 0, bgti_else.47632

	nop
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	addi	%v1, %a2, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	add	%at, %a1, %s0
	addi	%s0, %s0, -1

	sw	%a2, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s0, 0, bgti_else.47633

	nop
	nop
	addi	%v0, %k0, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %s1, 0

	nop
	nop
	addi	%v1, %a2, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	add	%at, %a1, %s0
	addi	%v1, %s0, -1

	sw	%a2, 0(%a0)
	nop
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0

	sw	%a0, 0(%at)
	nop
	nop
	j	create_dirvec_elements.3102

bgti_else.47633:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.47632:

	nop
	nop
	nop
	jr	%ra

bgti_else.47631:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.47630:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

create_dirvecs.3105:
	nop
	nop
	add	%s2, %zero, %v0
	add	%s3, %zero, %ra

	nop
	nop
	nop
	blti	%s2, 0, bgti_else.47664

	nop
	nop
	addi	%s6, %zero, 120
	addi	%s4, %zero, 3

	nop
	nop
	addi	%v0, %s4, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	lw	%s5, 0(%zero)
	nop
	addi	%a1, %v0, 0
	nop

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %s5, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%v1)
	nop
	addi	%v0, %s6, 0
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 179(%s2)
	nop
	addi	%v0, %s4, 0
	fmov	%f0, %fzero

	lw	%a2, 179(%s2)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s5, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %s4, 0
	fmov	%f0, %fzero

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 118(%a2)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s5, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%s7, %zero, 116
	addi	%v0, %s4, 0

	sw	%a1, 0(%a0)
	nop
	fmov	%f0, %fzero
	nop

	sw	%a0, 117(%a2)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s5, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%v1, %zero, 115
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 116(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3102

	nop
	nop
	addi	%s2, %s2, -1
	nop

	nop
	nop
	nop
	blti	%s2, 0, bgti_else.47665

	nop
	nop
	addi	%v0, %s4, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s5, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%v1)
	nop
	addi	%v0, %s6, 0
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 179(%s2)
	nop
	addi	%v0, %s4, 0
	fmov	%f0, %fzero

	lw	%a2, 179(%s2)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s5, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %s4, 0
	fmov	%f0, %fzero

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 118(%a2)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s5, 0

	nop
	nop
	addi	%v1, %a1, 0
	jal	min_caml_create_array

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%a0)
	nop
	addi	%v1, %s7, 0
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 117(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %a2, 0
	jal	create_dirvec_elements.3102

	nop
	nop
	addi	%v0, %s2, -1
	add	%ra, %zero, %s3

	nop
	nop
	nop
	j	create_dirvecs.3105

bgti_else.47665:

	nop
	nop
	nop
	jr	%ra

bgti_else.47664:
	nop
	nop
	add	%ra, %zero, %s3
	nop

	nop
	nop
	nop
	jr	%ra

init_dirvec_constants.3107:
	nop
	nop
	add	%s2, %zero, %v0
	add	%s3, %zero, %v1

	nop
	nop
	add	%s4, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%s3, 0, bgti_else.47783

	lw	%a0, 0(%zero)
	nop
	add	%at, %s2, %s3
	nop

	lw	%v0, 0(%at)
	nop
	addi	%s5, %a0, -1
	nop

	nop
	nop
	addi	%v1, %s5, 0
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%s3, %s3, -1
	nop

	nop
	nop
	nop
	blti	%s3, 0, bgti_else.47784

	nop
	nop
	add	%at, %s2, %s3
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.47785

	lw	%a2, 12(%s5)
	lw	%a3, 1(%a1)
	nop
	nop

	lw	%k0, 0(%a1)
	lw	%a0, 1(%a2)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.47787

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.47789

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f18, 0(%k0)
	flw	%f19, 1(%k0)
	nop
	nop

	flw	%f21, 2(%k0)
	lw	%a0, 4(%a2)
	fmul	%f1, %f18, %f18
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a2)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%a2)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f19, %f19

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f21, %f21

	flw	%f0, 2(%a0)
	lw	%a0, 3(%a2)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47791

	lw	%a0, 9(%a2)
	nop
	fmul	%f16, %f19, %f21
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 9(%a2)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%a2)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f18

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f18, %f19

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.47792

bnei_else.47791:
bnei_cont.47792:

	flw	%f1, 0(%a0)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	flw	%f1, 1(%a0)
	lw	%a0, 4(%a2)
	fneg	%f22, %f1
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	flw	%f1, 2(%a0)
	lw	%a0, 3(%a2)
	fneg	%f20, %f1
	nop

	nop
	nop
	fmul	%f1, %f21, %f1
	nop

	nop
	nop
	fneg	%f17, %f1
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47793

	lw	%a0, 9(%a2)
	flw	%f2, 473(%zero)
	nop
	nop

	flw	%f1, 1(%a0)
	lw	%a0, 9(%a2)
	nop
	nop

	flw	%f1, 2(%a0)
	lw	%a0, 9(%a2)
	fmul	%f16, %f21, %f1
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f22, %f1
	nop

	fsw	%f1, 1(%v0)
	flw	%f1, 0(%a0)
	nop
	nop

	lw	%a0, 9(%a2)
	nop
	fmul	%f16, %f21, %f1
	nop

	flw	%f1, 2(%a0)
	lw	%a0, 9(%a2)
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 2(%v0)
	flw	%f1, 0(%a0)
	nop
	nop

	lw	%a0, 9(%a2)
	nop
	fmul	%f16, %f19, %f1
	nop

	flw	%f1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f17, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.47794

bnei_else.47793:

	fsw	%f20, 2(%v0)
	nop
	nop
	nop

	fsw	%f17, 3(%v0)
	nop
	nop
	nop

bnei_cont.47794:

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.47796

fbeq_else.47795:

fbeq_cont.47796:

	nop
	nop
	nop
	j	bnei_cont.47798

bnei_else.47797:

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.47798:

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.47788

bnei_else.47789:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%k0)
	lw	%a0, 4(%a2)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a2)
	nop
	nop

	flw	%f1, 1(%k0)
	flw	%f0, 1(%a0)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%k0)
	lw	%a0, 4(%a2)
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.47799

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47800

fbgt_else.47799:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.47800:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47801

	flw	%f0, 468(%zero)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	flw	%f0, 0(%a0)
	nop
	nop

	lw	%a0, 4(%a2)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%a2)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.47802

bnei_else.47801:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.47802:
	nop
	nop
	add	%at, %a3, %s5
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.47790:
	nop
	nop
	nop
	j	bnei_cont.47788

bnei_else.47787:

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.47803

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.47804

fbeq_else.47803:

fbeq_cont.47804:

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.47806

bnei_else.47805:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.47807

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47808

fbgt_else.47807:

fbgt_cont.47808:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47811

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.47810

bnei_else.47811:

bnei_cont.47812:

bnei_else.47809:
bnei_cont.47810:

	flw	%f0, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47813

	nop
	nop
	nop
	j	bnei_cont.47814

bnei_else.47813:

bnei_cont.47814:

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.47806:

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.47815

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.47816

fbeq_else.47815:

fbeq_cont.47816:

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.47818

bnei_else.47817:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.47819

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47820

fbgt_else.47819:

fbgt_cont.47820:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47823

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.47822

bnei_else.47823:

bnei_cont.47824:

bnei_else.47821:
bnei_cont.47822:

	flw	%f0, 1(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47825

	nop
	nop
	nop
	j	bnei_cont.47826

bnei_else.47825:

bnei_cont.47826:

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.47818:

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.47827

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.47828

fbeq_else.47827:

fbeq_cont.47828:

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.47830

bnei_else.47829:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.47831

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.47832

fbgt_else.47831:

fbgt_cont.47832:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47835

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.47834

bnei_else.47835:

bnei_cont.47836:

bnei_else.47833:
bnei_cont.47834:

	flw	%f0, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47837

	nop
	nop
	nop
	j	bnei_cont.47838

bnei_else.47837:

bnei_cont.47838:

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.47830:

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.47788:
	nop
	nop
	addi	%v1, %s5, -1
	addi	%v0, %a1, 0

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	nop
	j	bgti_cont.47786

bgti_else.47785:
bgti_cont.47786:
	nop
	nop
	addi	%s3, %s3, -1
	nop

	nop
	nop
	nop
	blti	%s3, 0, bgti_else.47839

	nop
	nop
	add	%at, %s2, %s3
	addi	%v1, %s5, 0

	lw	%v0, 0(%at)
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%s3, %s3, -1
	nop

	nop
	nop
	nop
	blti	%s3, 0, bgti_else.47840

	nop
	nop
	add	%at, %s2, %s3
	nop

	lw	%v0, 0(%at)
	nop
	nop
	jal	setup_dirvec_constants.2892

	nop
	nop
	addi	%v1, %s3, -1
	add	%ra, %zero, %s4

	nop
	nop
	addi	%v0, %s2, 0
	j	init_dirvec_constants.3107

bgti_else.47840:
	nop
	nop
	add	%ra, %zero, %s4
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.47839:
	nop
	nop
	add	%ra, %zero, %s4
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.47784:
	nop
	nop
	add	%ra, %zero, %s4
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.47783:
	nop
	nop
	add	%ra, %zero, %s4
	nop

	nop
	nop
	nop
	jr	%ra

init_vecset_constants.3110:
	nop
	nop
	add	%s6, %zero, %v0
	add	%s7, %zero, %ra

	nop
	nop
	nop
	blti	%s6, 0, bgti_else.48058

	lw	%s2, 179(%s6)
	nop
	addi	%a0, %zero, 119
	nop

	lw	%a1, 119(%s2)
	lw	%a0, 0(%zero)
	nop
	nop

	nop
	nop
	addi	%t7, %a0, -1
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.48059

	lw	%a2, 12(%t7)
	lw	%a3, 1(%a1)
	nop
	nop

	lw	%k0, 0(%a1)
	lw	%a0, 1(%a2)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.48061

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.48063

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f18, 0(%k0)
	flw	%f19, 1(%k0)
	nop
	nop

	flw	%f21, 2(%k0)
	lw	%a0, 4(%a2)
	fmul	%f1, %f18, %f18
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a2)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%a2)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f19, %f19

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f21, %f21

	flw	%f0, 2(%a0)
	lw	%a0, 3(%a2)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48065

	lw	%a0, 9(%a2)
	nop
	fmul	%f16, %f19, %f21
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 9(%a2)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%a2)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f18

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f18, %f19

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.48066

bnei_else.48065:
bnei_cont.48066:

	flw	%f1, 0(%a0)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	flw	%f1, 1(%a0)
	lw	%a0, 4(%a2)
	fneg	%f22, %f1
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	flw	%f1, 2(%a0)
	lw	%a0, 3(%a2)
	fneg	%f20, %f1
	nop

	nop
	nop
	fmul	%f1, %f21, %f1
	nop

	nop
	nop
	fneg	%f17, %f1
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48067

	lw	%a0, 9(%a2)
	flw	%f2, 473(%zero)
	nop
	nop

	flw	%f1, 1(%a0)
	lw	%a0, 9(%a2)
	nop
	nop

	flw	%f1, 2(%a0)
	lw	%a0, 9(%a2)
	fmul	%f16, %f21, %f1
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f22, %f1
	nop

	fsw	%f1, 1(%v0)
	flw	%f1, 0(%a0)
	nop
	nop

	lw	%a0, 9(%a2)
	nop
	fmul	%f16, %f21, %f1
	nop

	flw	%f1, 2(%a0)
	lw	%a0, 9(%a2)
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 2(%v0)
	flw	%f1, 0(%a0)
	nop
	nop

	lw	%a0, 9(%a2)
	nop
	fmul	%f16, %f19, %f1
	nop

	flw	%f1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f18, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f17, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.48068

bnei_else.48067:

	fsw	%f20, 2(%v0)
	nop
	nop
	nop

	fsw	%f17, 3(%v0)
	nop
	nop
	nop

bnei_cont.48068:

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.48070

fbeq_else.48069:

fbeq_cont.48070:

	nop
	nop
	nop
	j	bnei_cont.48072

bnei_else.48071:

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.48072:

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.48062

bnei_else.48063:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%k0)
	lw	%a0, 4(%a2)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a2)
	nop
	nop

	flw	%f1, 1(%k0)
	flw	%f0, 1(%a0)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 2(%k0)
	lw	%a0, 4(%a2)
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.48073

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.48074

fbgt_else.48073:

fbgt_cont.48074:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48075

	flw	%f0, 468(%zero)
	lw	%a0, 4(%a2)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	flw	%f0, 0(%a0)
	nop
	nop

	lw	%a0, 4(%a2)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%a2)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.48076

bnei_else.48075:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.48076:
	nop
	nop
	add	%at, %a3, %t7
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.48064:
	nop
	nop
	nop
	j	bnei_cont.48062

bnei_else.48061:

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.48077

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.48078

fbeq_else.48077:

fbeq_cont.48078:

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.48080

bnei_else.48079:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.48081

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.48082

fbgt_else.48081:

fbgt_cont.48082:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48085

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.48084

bnei_else.48085:

bnei_cont.48086:

bnei_else.48083:
bnei_cont.48084:

	flw	%f0, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48087

	nop
	nop
	nop
	j	bnei_cont.48088

bnei_else.48087:

bnei_cont.48088:

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.48080:

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.48089

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.48090

fbeq_else.48089:

fbeq_cont.48090:

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.48092

bnei_else.48091:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.48093

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.48094

fbgt_else.48093:

fbgt_cont.48094:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48097

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.48096

bnei_else.48097:

bnei_cont.48098:

bnei_else.48095:
bnei_cont.48096:

	flw	%f0, 1(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48099

	nop
	nop
	nop
	j	bnei_cont.48100

bnei_else.48099:

bnei_cont.48100:

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.48092:

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.48101

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.48102

fbeq_else.48101:

fbeq_cont.48102:

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.48104

bnei_else.48103:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.48105

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.48106

fbgt_else.48105:

fbgt_cont.48106:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48109

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.48108

bnei_else.48109:

bnei_cont.48110:

bnei_else.48107:
bnei_cont.48108:

	flw	%f0, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.48111

	nop
	nop
	nop
	j	bnei_cont.48112

bnei_else.48111:

bnei_cont.48112:

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.48104:

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.48062:
	nop
	nop
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	nop
	j	bgti_cont.48060

bgti_else.48059:
bgti_cont.48060:
	lw	%v0, 118(%s2)
	nop
	addi	%t9, %zero, 118
	addi	%v1, %t7, 0

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	lw	%v0, 117(%s2)
	nop
	addi	%t8, %zero, 117
	jal	setup_dirvec_constants.2892

	nop
	nop
	addi	%v1, %zero, 116
	addi	%v0, %s2, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3107

	nop
	nop
	addi	%s6, %s6, -1
	nop

	nop
	nop
	nop
	blti	%s6, 0, bgti_else.48113

	lw	%s2, 179(%s6)
	nop
	addi	%v1, %t7, 0
	nop

	lw	%v0, 119(%s2)
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	lw	%v0, 118(%s2)
	nop
	nop
	jal	setup_dirvec_constants.2892

	nop
	nop
	addi	%v1, %t8, 0
	addi	%v0, %s2, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3107

	nop
	nop
	addi	%s6, %s6, -1
	nop

	nop
	nop
	nop
	blti	%s6, 0, bgti_else.48114

	lw	%s2, 179(%s6)
	nop
	nop
	nop

	lw	%v0, 119(%s2)
	nop
	nop
	jal	setup_dirvec_constants.2892

	nop
	nop
	addi	%v1, %t9, 0
	addi	%v0, %s2, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3107

	nop
	nop
	addi	%s6, %s6, -1
	nop

	nop
	nop
	nop
	blti	%s6, 0, bgti_else.48115

	lw	%v0, 179(%s6)
	nop
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3107

	nop
	nop
	addi	%v0, %s6, -1
	add	%ra, %zero, %s7

	nop
	nop
	nop
	j	init_vecset_constants.3110

bgti_else.48115:

	nop
	nop
	nop
	jr	%ra

bgti_else.48114:

	nop
	nop
	nop
	jr	%ra

bgti_else.48113:

	nop
	nop
	nop
	jr	%ra

bgti_else.48058:
	nop
	nop
	add	%ra, %zero, %s7
	nop

	nop
	nop
	nop
	jr	%ra

min_caml_start:
	nop
	nop
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %k1, 0
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	sw	%v0, 11(%zero)
	nop
	addi	%a2, %zero, 60
	addi	%v1, %k1, 0

	sw	%v0, 10(%zero)
	nop
	nop
	nop

	sw	%v0, 9(%zero)
	nop
	nop
	nop

	sw	%v0, 8(%zero)
	nop
	nop
	nop

	sw	%zero, 7(%zero)
	nop
	nop
	nop

	sw	%v0, 6(%zero)
	nop
	nop
	nop

	sw	%v0, 5(%zero)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%zero, 4(%zero)
	nop
	nop
	nop

	sw	%zero, 3(%zero)
	nop
	nop
	nop

	sw	%zero, 2(%zero)
	nop
	nop
	nop

	sw	%zero, 1(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 12
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v0, %zero, 3
	addi	%v1, %zero, 72

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 75
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 78
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	flw	%f0, 451(%zero)
	nop
	addi	%v1, %zero, 81
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a3, %zero, 50
	addi	%v1, %zero, -1

	nop
	nop
	addi	%a0, %zero, 82
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a0, %zero, 83
	addi	%v1, %zero, 82

	nop
	nop
	addi	%v0, %a3, 0
	jal	min_caml_create_extarray

	lw	%v1, 83(%zero)
	nop
	addi	%a0, %zero, 133
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a0, %zero, 134
	addi	%v1, %zero, 133

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %zero, 135
	addi	%v0, %k1, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a0, %zero, 136
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	flw	%f0, 445(%zero)
	nop
	addi	%v1, %zero, 137
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 138
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a0, %zero, 141
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %zero, 142
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 145
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 148
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 151
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v0, %zero, 2
	addi	%a0, %zero, 154

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a0, %zero, 156
	addi	%v0, %zero, 2

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %zero, 158
	addi	%v0, %k1, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 159
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 162
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 165
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 168
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 171
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 174
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a3, %v0, 0
	addi	%a0, %zero, 177

	nop
	nop
	addi	%v1, %zero, 177
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	sw	%v0, 178(%zero)
	nop
	nop
	nop

	sw	%a3, 177(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177

	nop
	nop
	addi	%v0, %zero, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %zero, 179

	nop
	nop
	addi	%v1, %zero, 179
	jal	min_caml_create_extarray

	nop
	nop
	addi	%v1, %zero, 184
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%v1, %zero, 184
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a3, %v0, 0
	addi	%a0, %zero, 187

	nop
	nop
	addi	%v1, %zero, 184
	addi	%v0, %a2, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	sw	%v0, 248(%zero)
	nop
	fmov	%f0, %fzero
	nop

	sw	%a3, 247(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 249
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%a2, %v0, 0
	addi	%a0, %zero, 249

	nop
	nop
	addi	%v1, %zero, 249
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_extarray

	sw	%v0, 250(%zero)
	nop
	addi	%a0, %zero, 249
	nop

	sw	%a2, 249(%zero)
	nop
	nop
	nop

	fsw	%fzero, 253(%zero)
	nop
	addi	%v0, %zero, 180
	nop

	sw	%a0, 252(%zero)
	nop
	nop
	nop

	sw	%zero, 251(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 254
	addi	%v1, %zero, 251

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a0, %zero, 434
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	jal	min_caml_create_extarray

	nop
	nop
	addi	%a1, %zero, 128
	nop

	sw	%a1, 154(%zero)
	nop
	itof	%f0, %a1
	nop

	sw	%a1, 155(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 64
	nop

	sw	%a0, 156(%zero)
	nop
	nop
	nop

	sw	%a0, 157(%zero)
	nop
	nop
	nop

	flw	%f1, 437(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 158(%zero)
	nop
	fmov	%f0, %fzero
	nop

	lw	%a0, 154(%zero)
	nop
	addi	%v0, %zero, 3
	nop

	sw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	sw	%v0, 1(%a2)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a2)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a2)
	nop
	addi	%sp, %sp, -1
	addi	%a0, %zero, 4

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	sw	%v0, 4(%a2)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a3, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%k0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%s0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%s1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%sp, %sp, -1
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%s2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	addi	%sp, %sp, -1
	add	%v1, %zero, %hp

	sw	%a0, 7(%v1)
	lw	%v0, 0(%sp)
	addi	%hp, %hp, 8
	addi	%sp, %sp, 1

	sw	%s2, 6(%v1)
	nop
	nop
	nop

	sw	%s1, 5(%v1)
	nop
	nop
	nop

	sw	%s0, 4(%v1)
	nop
	nop
	nop

	sw	%k0, 3(%v1)
	nop
	nop
	nop

	sw	%a3, 2(%v1)
	nop
	nop
	nop

	sw	%a2, 1(%v1)
	nop
	nop
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%t7, %a0, -2
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.50473

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a3, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	sw	%v0, 1(%a3)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a3)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a3)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a3)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%k0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%s0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%s1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%s2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	sw	%v0, 1(%s2)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s2)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s2)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s2)
	nop
	addi	%sp, %sp, -1
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%s3, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 1
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 1

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	addi	%sp, %sp, -1
	add	%ra, %zero, %hp

	sw	%a0, 7(%ra)
	nop
	addi	%hp, %hp, 8
	add	%at, %a1, %t7

	sw	%s3, 6(%ra)
	nop
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0

	sw	%s2, 5(%ra)
	nop
	addi	%sp, %sp, 1
	nop

	sw	%s1, 4(%ra)
	nop
	nop
	nop

	sw	%s0, 3(%ra)
	nop
	nop
	nop

	sw	%k0, 2(%ra)
	nop
	nop
	nop

	sw	%a3, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	jal	init_line_elements.3073

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.50474

bgti_else.50473:
bgti_cont.50474:
	sw	%a1, 1(%sp)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	sw	%v0, 1(%a2)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a2)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a2)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a2)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a3, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%k0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%s0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%s1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%sp, %sp, -2
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%s2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	addi	%sp, %sp, -2
	add	%v1, %zero, %hp

	sw	%a0, 7(%v1)
	lw	%v0, 0(%sp)
	addi	%hp, %hp, 8
	addi	%sp, %sp, 2

	sw	%s2, 6(%v1)
	nop
	nop
	nop

	sw	%s1, 5(%v1)
	nop
	nop
	nop

	sw	%s0, 4(%v1)
	nop
	nop
	nop

	sw	%k0, 3(%v1)
	nop
	nop
	nop

	sw	%a3, 2(%v1)
	nop
	nop
	nop

	sw	%a2, 1(%v1)
	nop
	nop
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.50475

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a3, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	sw	%v0, 1(%a3)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a3)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a3)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a3)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%k0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%s0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%s1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%s2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	sw	%v0, 1(%s2)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s2)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s2)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s2)
	nop
	addi	%sp, %sp, -2
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%s3, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 2
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	addi	%sp, %sp, -2
	add	%ra, %zero, %hp

	sw	%a0, 7(%ra)
	nop
	addi	%hp, %hp, 8
	add	%at, %a1, %t7

	sw	%s3, 6(%ra)
	nop
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0

	sw	%s2, 5(%ra)
	nop
	addi	%sp, %sp, 2
	nop

	sw	%s1, 4(%ra)
	nop
	nop
	nop

	sw	%s0, 3(%ra)
	nop
	nop
	nop

	sw	%k0, 2(%ra)
	nop
	nop
	nop

	sw	%a3, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	jal	init_line_elements.3073

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.50476

bgti_else.50475:
bgti_cont.50476:
	sw	%a1, 2(%sp)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	sw	%v0, 1(%a2)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a2)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a2)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a2)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a3, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%k0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%s0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%s1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%sp, %sp, -3
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%s2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	addi	%sp, %sp, -3
	add	%v1, %zero, %hp

	sw	%a0, 7(%v1)
	lw	%v0, 0(%sp)
	addi	%hp, %hp, 8
	addi	%sp, %sp, 3

	sw	%s2, 6(%v1)
	nop
	nop
	nop

	sw	%s1, 5(%v1)
	nop
	nop
	nop

	sw	%s0, 4(%v1)
	nop
	nop
	nop

	sw	%k0, 3(%v1)
	nop
	nop
	nop

	sw	%a3, 2(%v1)
	nop
	nop
	nop

	sw	%a2, 1(%v1)
	nop
	nop
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.50477

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a3, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	sw	%v0, 1(%a3)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a3)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a3)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a3)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%k0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%s0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%s1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%s2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	sw	%v0, 1(%s2)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s2)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s2)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s2)
	nop
	addi	%sp, %sp, -3
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%s3, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %zero, 5
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a0, %v0, 0

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 3
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	addi	%sp, %sp, -3
	add	%ra, %zero, %hp

	sw	%a0, 7(%ra)
	nop
	addi	%hp, %hp, 8
	add	%at, %a1, %t7

	sw	%s3, 6(%ra)
	nop
	addi	%v1, %t7, -1
	addi	%v0, %a1, 0

	sw	%s2, 5(%ra)
	nop
	addi	%sp, %sp, 3
	nop

	sw	%s1, 4(%ra)
	nop
	nop
	nop

	sw	%s0, 3(%ra)
	nop
	nop
	nop

	sw	%k0, 2(%ra)
	nop
	nop
	nop

	sw	%a3, 1(%ra)
	nop
	nop
	nop

	sw	%a2, 0(%ra)
	nop
	nop
	nop

	sw	%ra, 0(%at)
	nop
	nop
	jal	init_line_elements.3073

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.50478

bgti_else.50477:
bgti_cont.50478:
	sw	%a1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_float

	fsw	%f0, 72(%zero)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_float

	fsw	%f0, 73(%zero)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_float

	fsw	%f0, 74(%zero)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_float

	flw	%f19, 469(%zero)
	flw	%f18, 494(%zero)
	addi	%sp, %sp, -4
	nop

	flw	%f2, 493(%zero)
	nop
	fmul	%f20, %f0, %f19
	nop

	nop
	nop
	fabs	%f17, %f20
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.50479

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50480

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50480

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50480

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50480

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50480

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50480

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50480

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50480

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50480

	flw	%f1, 483(%zero)
	nop
	fmov	%f0, %f17
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	addi	%sp, %sp, -4
	j	fbgt_cont.50480

fbgt_else.50497:
fbgt_cont.50498:

fbgt_else.50495:
fbgt_cont.50496:

fbgt_else.50493:
fbgt_cont.50494:

fbgt_else.50491:
fbgt_cont.50492:

fbgt_else.50489:
fbgt_cont.50490:

fbgt_else.50487:
fbgt_cont.50488:

fbgt_else.50485:
fbgt_cont.50486:

fbgt_else.50483:
fbgt_cont.50484:

fbgt_else.50481:
fbgt_cont.50482:

fbgt_else.50479:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.50480:
	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.50499

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_else.50501

	flw	%f16, 495(%zero)
	nop
	fsub	%f17, %f17, %f0
	nop

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_cont.50500

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.50505

	nop
	nop
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f17, %f0

	nop
	nop
	nop
	j	fbgt_cont.50500

fbgt_else.50505:

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f17, %f0

fbgt_cont.50506:

fbgt_else.50503:
fbgt_cont.50504:

fbgt_else.50501:

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_cont.50500

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.50509

	nop
	nop
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f17, %f0

	nop
	nop
	nop
	j	fbgt_cont.50500

fbgt_else.50509:

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f17, %f0

fbgt_cont.50510:

fbgt_else.50507:
fbgt_cont.50508:
fbgt_cont.50502:

fbgt_else.50499:
fbgt_cont.50500:
	nop
	nop
	nop
	fblt	%f17, %f18, fbgt_else.50511

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50512

fbgt_else.50511:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.50512:
	nop
	nop
	nop
	fblt	%f17, %f18, fbgt_else.50513

	nop
	nop
	fsub	%f17, %f17, %f18
	j	fbgt_cont.50514

fbgt_else.50513:
fbgt_cont.50514:
	flw	%f21, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f21, fbgt_else.50515

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50517

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50516

bnei_else.50517:

bnei_cont.50518:

fbgt_else.50515:
fbgt_cont.50516:
	nop
	nop
	nop
	fblt	%f17, %f21, fbgt_else.50519

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.50520

fbgt_else.50519:
fbgt_cont.50520:
	flw	%f22, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f22, %f17, fbgt_else.50521

	flw	%f0, 473(%zero)
	nop
	fmul	%f17, %f17, %f17
	nop

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f17, %f1, %f0
	j	fbgt_cont.50522

fbgt_else.50521:

	nop
	nop
	fmul	%f17, %f23, %f23
	fmul	%f0, %f0, %f23

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f23, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f17, %f1, %f0
	nop

fbgt_cont.50522:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50523

	nop
	nop
	nop
	j	bnei_cont.50524

bnei_else.50523:

bnei_cont.50524:
	nop
	nop
	nop
	fblt	%f20, %fzero, fbgt_else.50525

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.50526

fbgt_else.50525:

fbgt_cont.50526:
	nop
	nop
	fabs	%f20, %f20
	nop

	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_else.50527

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50528

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50528

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50528

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50528

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50528

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50528

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50528

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50528

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50528

	flw	%f1, 483(%zero)
	nop
	fmov	%f0, %f20
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	addi	%sp, %sp, -4
	j	fbgt_cont.50528

fbgt_else.50545:
fbgt_cont.50546:

fbgt_else.50543:
fbgt_cont.50544:

fbgt_else.50541:
fbgt_cont.50542:

fbgt_else.50539:
fbgt_cont.50540:

fbgt_else.50537:
fbgt_cont.50538:

fbgt_else.50535:
fbgt_cont.50536:

fbgt_else.50533:
fbgt_cont.50534:

fbgt_else.50531:
fbgt_cont.50532:

fbgt_else.50529:
fbgt_cont.50530:

fbgt_else.50527:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.50528:
	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_else.50547

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_else.50549

	flw	%f16, 495(%zero)
	nop
	fsub	%f20, %f20, %f0
	nop

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_cont.50548

	nop
	nop
	nop
	fblt	%f20, %f1, fbgt_else.50553

	nop
	nop
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f20, %f0

	nop
	nop
	nop
	j	fbgt_cont.50548

fbgt_else.50553:

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f20, %f0

fbgt_cont.50554:

fbgt_else.50551:
fbgt_cont.50552:

fbgt_else.50549:

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_cont.50548

	nop
	nop
	nop
	fblt	%f20, %f1, fbgt_else.50557

	nop
	nop
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f20, %f0

	nop
	nop
	nop
	j	fbgt_cont.50548

fbgt_else.50557:

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f20, %f0

fbgt_cont.50558:

fbgt_else.50555:
fbgt_cont.50556:
fbgt_cont.50550:

fbgt_else.50547:
fbgt_cont.50548:
	nop
	nop
	nop
	fblt	%f20, %f18, fbgt_else.50559

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50561

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50560

bnei_else.50561:

bnei_cont.50562:

fbgt_else.50559:
fbgt_cont.50560:
	nop
	nop
	nop
	fblt	%f20, %f18, fbgt_else.50563

	nop
	nop
	fsub	%f20, %f20, %f18
	j	fbgt_cont.50564

fbgt_else.50563:
fbgt_cont.50564:
	nop
	nop
	nop
	fblt	%f20, %f21, fbgt_else.50565

	nop
	nop
	fsub	%f20, %f18, %f20
	j	fbgt_cont.50566

fbgt_else.50565:
fbgt_cont.50566:
	nop
	nop
	nop
	fblt	%f22, %f20, fbgt_else.50567

	flw	%f0, 477(%zero)
	nop
	fmul	%f23, %f20, %f20
	nop

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f20

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f20, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f20, %f1, %f0
	j	fbgt_cont.50568

fbgt_else.50567:

	flw	%f0, 473(%zero)
	nop
	fmul	%f20, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f20, %f20
	fmul	%f0, %f0, %f20

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f20, %f1, %f0
	nop

fbgt_cont.50568:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50569

	nop
	nop
	nop
	j	bnei_cont.50570

bnei_else.50569:

bnei_cont.50570:
	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -4
	fmul	%f24, %f0, %f19

	nop
	nop
	fabs	%f23, %f24
	nop

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_else.50571

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.50572

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.50572

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.50572

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.50572

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.50572

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.50572

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.50572

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.50572

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_cont.50572

	flw	%f1, 483(%zero)
	nop
	fmov	%f0, %f23
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	addi	%sp, %sp, -4
	j	fbgt_cont.50572

fbgt_else.50589:
fbgt_cont.50590:

fbgt_else.50587:
fbgt_cont.50588:

fbgt_else.50585:
fbgt_cont.50586:

fbgt_else.50583:
fbgt_cont.50584:

fbgt_else.50581:
fbgt_cont.50582:

fbgt_else.50579:
fbgt_cont.50580:

fbgt_else.50577:
fbgt_cont.50578:

fbgt_else.50575:
fbgt_cont.50576:

fbgt_else.50573:
fbgt_cont.50574:

fbgt_else.50571:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.50572:
	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_else.50591

	nop
	nop
	nop
	fblt	%f23, %f0, fbgt_else.50593

	flw	%f16, 495(%zero)
	nop
	fsub	%f23, %f23, %f0
	nop

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_cont.50592

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_else.50597

	nop
	nop
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f23, %f0

	nop
	nop
	nop
	j	fbgt_cont.50592

fbgt_else.50597:

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f23, %f0

fbgt_cont.50598:

fbgt_else.50595:
fbgt_cont.50596:

fbgt_else.50593:

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f23, %f2, fbgt_cont.50592

	nop
	nop
	nop
	fblt	%f23, %f1, fbgt_else.50601

	nop
	nop
	fsub	%f0, %f23, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f23, %f0

	nop
	nop
	nop
	j	fbgt_cont.50592

fbgt_else.50601:

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f23, %f0

fbgt_cont.50602:

fbgt_else.50599:
fbgt_cont.50600:
fbgt_cont.50594:

fbgt_else.50591:
fbgt_cont.50592:
	nop
	nop
	nop
	fblt	%f23, %f18, fbgt_else.50603

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50604

fbgt_else.50603:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.50604:
	nop
	nop
	nop
	fblt	%f23, %f18, fbgt_else.50605

	nop
	nop
	fsub	%f23, %f23, %f18
	j	fbgt_cont.50606

fbgt_else.50605:
fbgt_cont.50606:
	nop
	nop
	nop
	fblt	%f23, %f21, fbgt_else.50607

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50609

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50608

bnei_else.50609:

bnei_cont.50610:

fbgt_else.50607:
fbgt_cont.50608:
	nop
	nop
	nop
	fblt	%f23, %f21, fbgt_else.50611

	nop
	nop
	fsub	%f23, %f18, %f23
	j	fbgt_cont.50612

fbgt_else.50611:
fbgt_cont.50612:
	nop
	nop
	nop
	fblt	%f22, %f23, fbgt_else.50613

	flw	%f0, 473(%zero)
	nop
	fmul	%f23, %f23, %f23
	nop

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f23, %f1, %f0
	j	fbgt_cont.50614

fbgt_else.50613:

	nop
	nop
	fmul	%f23, %f25, %f25
	fmul	%f0, %f0, %f25

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f23

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f25, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f23, %f1, %f0
	nop

fbgt_cont.50614:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50615

	nop
	nop
	nop
	j	bnei_cont.50616

bnei_else.50615:

bnei_cont.50616:
	nop
	nop
	nop
	fblt	%f24, %fzero, fbgt_else.50617

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.50618

fbgt_else.50617:

fbgt_cont.50618:
	nop
	nop
	fabs	%f24, %f24
	nop

	nop
	nop
	nop
	fblt	%f24, %f2, fbgt_else.50619

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_cont.50620

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_cont.50620

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_cont.50620

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_cont.50620

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_cont.50620

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_cont.50620

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_cont.50620

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_cont.50620

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_cont.50620

	flw	%f1, 483(%zero)
	nop
	fmov	%f0, %f24
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	addi	%sp, %sp, -4
	j	fbgt_cont.50620

fbgt_else.50637:
fbgt_cont.50638:

fbgt_else.50635:
fbgt_cont.50636:

fbgt_else.50633:
fbgt_cont.50634:

fbgt_else.50631:
fbgt_cont.50632:

fbgt_else.50629:
fbgt_cont.50630:

fbgt_else.50627:
fbgt_cont.50628:

fbgt_else.50625:
fbgt_cont.50626:

fbgt_else.50623:
fbgt_cont.50624:

fbgt_else.50621:
fbgt_cont.50622:

fbgt_else.50619:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.50620:
	nop
	nop
	nop
	fblt	%f24, %f2, fbgt_else.50639

	nop
	nop
	nop
	fblt	%f24, %f0, fbgt_else.50641

	flw	%f16, 495(%zero)
	nop
	fsub	%f24, %f24, %f0
	nop

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f24, %f2, fbgt_cont.50640

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_else.50645

	nop
	nop
	fsub	%f0, %f24, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f24, %f0

	nop
	nop
	nop
	j	fbgt_cont.50640

fbgt_else.50645:

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f24, %f0

fbgt_cont.50646:

fbgt_else.50643:
fbgt_cont.50644:

fbgt_else.50641:

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f24, %f2, fbgt_cont.50640

	nop
	nop
	nop
	fblt	%f24, %f1, fbgt_else.50649

	nop
	nop
	fsub	%f0, %f24, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f24, %f0

	nop
	nop
	nop
	j	fbgt_cont.50640

fbgt_else.50649:

	nop
	nop
	addi	%sp, %sp, 4
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -4
	fmov	%f24, %f0

fbgt_cont.50650:

fbgt_else.50647:
fbgt_cont.50648:
fbgt_cont.50642:

fbgt_else.50639:
fbgt_cont.50640:
	nop
	nop
	nop
	fblt	%f24, %f18, fbgt_else.50651

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50653

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50652

bnei_else.50653:

bnei_cont.50654:

fbgt_else.50651:
fbgt_cont.50652:
	nop
	nop
	nop
	fblt	%f24, %f18, fbgt_else.50655

	nop
	nop
	fsub	%f24, %f24, %f18
	j	fbgt_cont.50656

fbgt_else.50655:
fbgt_cont.50656:
	nop
	nop
	nop
	fblt	%f24, %f21, fbgt_else.50657

	nop
	nop
	fsub	%f24, %f18, %f24
	j	fbgt_cont.50658

fbgt_else.50657:
fbgt_cont.50658:
	nop
	nop
	nop
	fblt	%f22, %f24, fbgt_else.50659

	flw	%f0, 477(%zero)
	nop
	fmul	%f25, %f24, %f24
	nop

	nop
	nop
	fmul	%f16, %f25, %f25
	fmul	%f0, %f0, %f24

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f24, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.50660

fbgt_else.50659:

	flw	%f0, 473(%zero)
	nop
	fmul	%f24, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f24, %f24
	fmul	%f0, %f0, %f24

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.50660:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50661

	nop
	nop
	nop
	j	bnei_cont.50662

bnei_else.50661:

bnei_cont.50662:
	flw	%f16, 436(%zero)
	nop
	fmul	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f16
	nop

	fsw	%f1, 171(%zero)
	nop
	nop
	nop

	flw	%f1, 435(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f20, %f1
	nop

	fsw	%f1, 172(%zero)
	nop
	fmul	%f1, %f17, %f23
	nop

	nop
	nop
	fmul	%f1, %f1, %f16
	nop

	fsw	%f1, 173(%zero)
	nop
	fneg	%f1, %f0
	nop

	fsw	%f23, 165(%zero)
	nop
	nop
	nop

	fsw	%fzero, 166(%zero)
	nop
	nop
	nop

	fsw	%f1, 167(%zero)
	nop
	fneg	%f1, %f20
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 168(%zero)
	nop
	fneg	%f0, %f17
	nop

	fsw	%f0, 169(%zero)
	nop
	fneg	%f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	fsw	%f0, 170(%zero)
	nop
	nop
	nop

	flw	%f1, 72(%zero)
	flw	%f0, 171(%zero)
	nop
	nop

	fsw	%f0, 4(%sp)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 75(%zero)
	nop
	nop
	nop

	flw	%f1, 73(%zero)
	flw	%f0, 172(%zero)
	nop
	nop

	fsw	%f0, 5(%sp)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 76(%zero)
	nop
	nop
	nop

	flw	%f1, 74(%zero)
	flw	%f0, 173(%zero)
	nop
	nop

	fsw	%f0, 6(%sp)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 77(%zero)
	nop
	addi	%sp, %sp, 7
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -7
	fmul	%f20, %f0, %f19

	nop
	nop
	nop
	fblt	%f20, %fzero, fbgt_else.50663

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.50664

fbgt_else.50663:

fbgt_cont.50664:
	nop
	nop
	fabs	%f17, %f20
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.50665

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50666

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50666

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50666

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50666

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50666

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50666

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50666

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50666

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50666

	flw	%f1, 483(%zero)
	nop
	fmov	%f0, %f17
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	addi	%sp, %sp, -7
	j	fbgt_cont.50666

fbgt_else.50683:
fbgt_cont.50684:

fbgt_else.50681:
fbgt_cont.50682:

fbgt_else.50679:
fbgt_cont.50680:

fbgt_else.50677:
fbgt_cont.50678:

fbgt_else.50675:
fbgt_cont.50676:

fbgt_else.50673:
fbgt_cont.50674:

fbgt_else.50671:
fbgt_cont.50672:

fbgt_else.50669:
fbgt_cont.50670:

fbgt_else.50667:
fbgt_cont.50668:

fbgt_else.50665:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.50666:
	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.50685

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_else.50687

	flw	%f16, 495(%zero)
	nop
	fsub	%f17, %f17, %f0
	nop

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_cont.50686

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.50691

	nop
	nop
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f17, %f0

	nop
	nop
	nop
	j	fbgt_cont.50686

fbgt_else.50691:

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f17, %f0

fbgt_cont.50692:

fbgt_else.50689:
fbgt_cont.50690:

fbgt_else.50687:

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_cont.50686

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.50695

	nop
	nop
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f17, %f0

	nop
	nop
	nop
	j	fbgt_cont.50686

fbgt_else.50695:

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f17, %f0

fbgt_cont.50696:

fbgt_else.50693:
fbgt_cont.50694:
fbgt_cont.50688:

fbgt_else.50685:
fbgt_cont.50686:
	nop
	nop
	nop
	fblt	%f17, %f18, fbgt_else.50697

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50699

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50698

bnei_else.50699:

bnei_cont.50700:

fbgt_else.50697:
fbgt_cont.50698:
	nop
	nop
	nop
	fblt	%f17, %f18, fbgt_else.50701

	nop
	nop
	fsub	%f17, %f17, %f18
	j	fbgt_cont.50702

fbgt_else.50701:
fbgt_cont.50702:
	nop
	nop
	nop
	fblt	%f17, %f21, fbgt_else.50703

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.50704

fbgt_else.50703:
fbgt_cont.50704:
	nop
	nop
	nop
	fblt	%f22, %f17, fbgt_else.50705

	flw	%f0, 477(%zero)
	nop
	fmul	%f23, %f17, %f17
	nop

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f17

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f17, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.50706

fbgt_else.50705:
	nop
	nop
	fsub	%f0, %f21, %f17
	nop

	flw	%f0, 473(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.50706:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50707

	nop
	nop
	nop
	j	bnei_cont.50708

bnei_else.50707:

bnei_cont.50708:
	nop
	nop
	fneg	%f0, %f0
	addi	%sp, %sp, 7

	fsw	%f0, 79(%zero)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -7
	fmul	%f19, %f0, %f19

	nop
	nop
	fabs	%f17, %f20
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.50709

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50710

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50710

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50710

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50710

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50710

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50710

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50710

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50710

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_cont.50710

	flw	%f1, 483(%zero)
	nop
	fmov	%f0, %f17
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	addi	%sp, %sp, -7
	j	fbgt_cont.50710

fbgt_else.50727:
fbgt_cont.50728:

fbgt_else.50725:
fbgt_cont.50726:

fbgt_else.50723:
fbgt_cont.50724:

fbgt_else.50721:
fbgt_cont.50722:

fbgt_else.50719:
fbgt_cont.50720:

fbgt_else.50717:
fbgt_cont.50718:

fbgt_else.50715:
fbgt_cont.50716:

fbgt_else.50713:
fbgt_cont.50714:

fbgt_else.50711:
fbgt_cont.50712:

fbgt_else.50709:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.50710:
	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_else.50729

	nop
	nop
	nop
	fblt	%f17, %f0, fbgt_else.50731

	flw	%f16, 495(%zero)
	nop
	fsub	%f17, %f17, %f0
	nop

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_cont.50730

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.50735

	nop
	nop
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f17, %f0

	nop
	nop
	nop
	j	fbgt_cont.50730

fbgt_else.50735:

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f17, %f0

fbgt_cont.50736:

fbgt_else.50733:
fbgt_cont.50734:

fbgt_else.50731:

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f17, %f2, fbgt_cont.50730

	nop
	nop
	nop
	fblt	%f17, %f1, fbgt_else.50739

	nop
	nop
	fsub	%f0, %f17, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f17, %f0

	nop
	nop
	nop
	j	fbgt_cont.50730

fbgt_else.50739:

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f17, %f0

fbgt_cont.50740:

fbgt_else.50737:
fbgt_cont.50738:
fbgt_cont.50732:

fbgt_else.50729:
fbgt_cont.50730:
	nop
	nop
	nop
	fblt	%f17, %f18, fbgt_else.50741

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50742

fbgt_else.50741:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.50742:
	nop
	nop
	nop
	fblt	%f17, %f18, fbgt_else.50743

	nop
	nop
	fsub	%f17, %f17, %f18
	j	fbgt_cont.50744

fbgt_else.50743:
fbgt_cont.50744:
	nop
	nop
	nop
	fblt	%f17, %f21, fbgt_else.50745

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50747

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50746

bnei_else.50747:

bnei_cont.50748:

fbgt_else.50745:
fbgt_cont.50746:
	nop
	nop
	nop
	fblt	%f17, %f21, fbgt_else.50749

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.50750

fbgt_else.50749:
fbgt_cont.50750:
	nop
	nop
	nop
	fblt	%f22, %f17, fbgt_else.50751

	flw	%f0, 473(%zero)
	nop
	fmul	%f17, %f17, %f17
	nop

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f17, %f1, %f0
	j	fbgt_cont.50752

fbgt_else.50751:
	flw	%f0, 477(%zero)
	nop
	fsub	%f20, %f21, %f17
	nop

	nop
	nop
	fmul	%f17, %f20, %f20
	fmul	%f0, %f0, %f20

	nop
	nop
	fmul	%f16, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f20, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f17, %f1, %f0
	nop

fbgt_cont.50752:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50753

	nop
	nop
	nop
	j	bnei_cont.50754

bnei_else.50753:

bnei_cont.50754:
	nop
	nop
	nop
	fblt	%f19, %fzero, fbgt_else.50755

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.50756

fbgt_else.50755:

fbgt_cont.50756:
	nop
	nop
	fabs	%f20, %f19
	nop

	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_else.50757

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50758

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50758

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50758

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50758

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50758

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50758

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50758

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50758

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_cont.50758

	flw	%f1, 483(%zero)
	nop
	fmov	%f0, %f20
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	addi	%sp, %sp, -7
	j	fbgt_cont.50758

fbgt_else.50775:
fbgt_cont.50776:

fbgt_else.50773:
fbgt_cont.50774:

fbgt_else.50771:
fbgt_cont.50772:

fbgt_else.50769:
fbgt_cont.50770:

fbgt_else.50767:
fbgt_cont.50768:

fbgt_else.50765:
fbgt_cont.50766:

fbgt_else.50763:
fbgt_cont.50764:

fbgt_else.50761:
fbgt_cont.50762:

fbgt_else.50759:
fbgt_cont.50760:

fbgt_else.50757:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.50758:
	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_else.50777

	nop
	nop
	nop
	fblt	%f20, %f0, fbgt_else.50779

	flw	%f16, 495(%zero)
	nop
	fsub	%f20, %f20, %f0
	nop

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_cont.50778

	nop
	nop
	nop
	fblt	%f20, %f1, fbgt_else.50783

	nop
	nop
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f20, %f0

	nop
	nop
	nop
	j	fbgt_cont.50778

fbgt_else.50783:

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f20, %f0

fbgt_cont.50784:

fbgt_else.50781:
fbgt_cont.50782:

fbgt_else.50779:

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f20, %f2, fbgt_cont.50778

	nop
	nop
	nop
	fblt	%f20, %f1, fbgt_else.50787

	nop
	nop
	fsub	%f0, %f20, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f20, %f0

	nop
	nop
	nop
	j	fbgt_cont.50778

fbgt_else.50787:

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f20, %f0

fbgt_cont.50788:

fbgt_else.50785:
fbgt_cont.50786:
fbgt_cont.50780:

fbgt_else.50777:
fbgt_cont.50778:
	nop
	nop
	nop
	fblt	%f20, %f18, fbgt_else.50789

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50791

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50790

bnei_else.50791:

bnei_cont.50792:

fbgt_else.50789:
fbgt_cont.50790:
	nop
	nop
	nop
	fblt	%f20, %f18, fbgt_else.50793

	nop
	nop
	fsub	%f20, %f20, %f18
	j	fbgt_cont.50794

fbgt_else.50793:
fbgt_cont.50794:
	nop
	nop
	nop
	fblt	%f20, %f21, fbgt_else.50795

	nop
	nop
	fsub	%f20, %f18, %f20
	j	fbgt_cont.50796

fbgt_else.50795:
fbgt_cont.50796:
	nop
	nop
	nop
	fblt	%f22, %f20, fbgt_else.50797

	flw	%f0, 477(%zero)
	nop
	fmul	%f23, %f20, %f20
	nop

	nop
	nop
	fmul	%f16, %f23, %f23
	fmul	%f0, %f0, %f20

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f20, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.50798

fbgt_else.50797:
	nop
	nop
	fsub	%f0, %f21, %f20
	nop

	flw	%f0, 473(%zero)
	nop
	fmul	%f20, %f0, %f0
	nop

	nop
	nop
	fmul	%f16, %f20, %f20
	fmul	%f0, %f0, %f20

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.50798:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50799

	nop
	nop
	nop
	j	bnei_cont.50800

bnei_else.50799:

bnei_cont.50800:
	nop
	nop
	fmul	%f0, %f17, %f0
	fabs	%f19, %f19

	fsw	%f0, 78(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_else.50801

	flw	%f0, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.50802

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.50802

	flw	%f0, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.50802

	flw	%f0, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.50802

	flw	%f0, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.50802

	flw	%f0, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.50802

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.50802

	flw	%f0, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.50802

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_cont.50802

	flw	%f1, 483(%zero)
	nop
	fmov	%f0, %f19
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2626

	nop
	nop
	addi	%sp, %sp, -7
	j	fbgt_cont.50802

fbgt_else.50819:
fbgt_cont.50820:

fbgt_else.50817:
fbgt_cont.50818:

fbgt_else.50815:
fbgt_cont.50816:

fbgt_else.50813:
fbgt_cont.50814:

fbgt_else.50811:
fbgt_cont.50812:

fbgt_else.50809:
fbgt_cont.50810:

fbgt_else.50807:
fbgt_cont.50808:

fbgt_else.50805:
fbgt_cont.50806:

fbgt_else.50803:
fbgt_cont.50804:

fbgt_else.50801:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.50802:
	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_else.50821

	nop
	nop
	nop
	fblt	%f19, %f0, fbgt_else.50823

	flw	%f16, 495(%zero)
	nop
	fsub	%f19, %f19, %f0
	nop

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_cont.50822

	nop
	nop
	nop
	fblt	%f19, %f1, fbgt_else.50827

	nop
	nop
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f19, %f0

	nop
	nop
	nop
	j	fbgt_cont.50822

fbgt_else.50827:

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f19, %f0

fbgt_cont.50828:

fbgt_else.50825:
fbgt_cont.50826:

fbgt_else.50823:

	nop
	nop
	fdiv	%f1, %f0, %f16
	nop

	nop
	nop
	nop
	fblt	%f19, %f2, fbgt_cont.50822

	nop
	nop
	nop
	fblt	%f19, %f1, fbgt_else.50831

	nop
	nop
	fsub	%f0, %f19, %f1
	fdiv	%f1, %f1, %f16

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f19, %f0

	nop
	nop
	nop
	j	fbgt_cont.50822

fbgt_else.50831:

	nop
	nop
	addi	%sp, %sp, 7
	jal	reduction_2pi_sub2.2629

	nop
	nop
	addi	%sp, %sp, -7
	fmov	%f19, %f0

fbgt_cont.50832:

fbgt_else.50829:
fbgt_cont.50830:
fbgt_cont.50824:

fbgt_else.50821:
fbgt_cont.50822:
	nop
	nop
	nop
	fblt	%f19, %f18, fbgt_else.50833

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50834

fbgt_else.50833:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.50834:
	nop
	nop
	nop
	fblt	%f19, %f18, fbgt_else.50835

	nop
	nop
	fsub	%f19, %f19, %f18
	j	fbgt_cont.50836

fbgt_else.50835:
fbgt_cont.50836:
	nop
	nop
	nop
	fblt	%f19, %f21, fbgt_else.50837

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50839

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.50838

bnei_else.50839:

bnei_cont.50840:

fbgt_else.50837:
fbgt_cont.50838:
	nop
	nop
	nop
	fblt	%f19, %f21, fbgt_else.50841

	nop
	nop
	fsub	%f19, %f18, %f19
	j	fbgt_cont.50842

fbgt_else.50841:
fbgt_cont.50842:
	nop
	nop
	nop
	fblt	%f22, %f19, fbgt_else.50843

	flw	%f0, 473(%zero)
	nop
	fmul	%f18, %f19, %f19
	nop

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 472(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 471(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.50844

fbgt_else.50843:
	flw	%f0, 477(%zero)
	nop
	fsub	%f19, %f21, %f19
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f0, %f0, %f19

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 476(%zero)
	nop
	fsub	%f1, %f19, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 475(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.50844:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.50845

	nop
	nop
	nop
	j	bnei_cont.50846

bnei_else.50845:

bnei_cont.50846:
	nop
	nop
	fmul	%f0, %f17, %f0
	addi	%sp, %sp, 7

	fsw	%f0, 80(%zero)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 81(%zero)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	read_object.2784

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	read_net_item.2788

	lw	%a0, 0(%v0)
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.50847

	sw	%v0, 83(%zero)
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	read_and_network.2792

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.50848

bnei_else.50847:
bnei_cont.50848:
	nop
	nop
	addi	%v0, %zero, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	read_net_item.2788

	nop
	nop
	addi	%sp, %sp, -7
	addi	%s1, %v0, 0

	lw	%a0, 0(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.50849

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	read_or_network.2790

	sw	%s1, 0(%v0)
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.50850

bnei_else.50849:

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -7
	nop

bnei_cont.50850:
	sw	%v0, 134(%zero)
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	addi	%v0, %zero, 80
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 51

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a1, %zero, 10

	nop
	nop
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 0

	lw	%v0, 0(%sp)
	nop
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0

	lw	%a3, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_else.50851

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.50853

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.50855

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.50857

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.50852

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.50861

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.50863

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.50865

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.50852

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.50869

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.50871

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.50873

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.50852

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.50877

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.50879

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.50881

	nop
	nop
	addi	%v0, %a3, -40
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.50852

bgti_else.50881:

bgti_cont.50882:

bgti_else.50879:

bgti_cont.50880:

bgti_else.50877:

bgti_cont.50878:

bgti_else.50875:
bgti_cont.50876:

bgti_else.50873:

bgti_cont.50874:

bgti_else.50871:

bgti_cont.50872:

bgti_else.50869:

bgti_cont.50870:

bgti_else.50867:
bgti_cont.50868:

bgti_else.50865:

bgti_cont.50866:

bgti_else.50863:

bgti_cont.50864:

bgti_else.50861:

bgti_cont.50862:

bgti_else.50859:
bgti_cont.50860:

bgti_else.50857:

bgti_cont.50858:

bgti_else.50855:

bgti_cont.50856:

bgti_else.50853:

bgti_cont.50854:

bgti_else.50851:
bgti_cont.50852:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.50883

	nop
	nop
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	j	bgt_cont.50884

bgt_else.50883:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.50885

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.50887

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.50889

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.50891

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.50886

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.50895

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.50897

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.50899

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.50886

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.50903

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.50905

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.50907

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.50886

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.50911

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.50913

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.50915

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.50886

bgti_else.50915:

bgti_cont.50916:

bgti_else.50913:

bgti_cont.50914:

bgti_else.50911:

bgti_cont.50912:

bgti_else.50909:
bgti_cont.50910:

bgti_else.50907:

bgti_cont.50908:

bgti_else.50905:

bgti_cont.50906:

bgti_else.50903:

bgti_cont.50904:

bgti_else.50901:
bgti_cont.50902:

bgti_else.50899:

bgti_cont.50900:

bgti_else.50897:

bgti_cont.50898:

bgti_else.50895:

bgti_cont.50896:

bgti_else.50893:
bgti_cont.50894:

bgti_else.50891:

bgti_cont.50892:

bgti_else.50889:

bgti_cont.50890:

bgti_else.50887:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.50888:
	nop
	nop
	nop
	j	bgti_cont.50886

bgti_else.50885:
bgti_cont.50886:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.50917

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	j	bgt_cont.50918

bgt_else.50917:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.50919

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.50921

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.50923

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.50925

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.50920

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.50929

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.50931

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.50933

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.50920

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.50937

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.50939

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.50941

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.50920

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.50945

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.50947

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.50949

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.50920

bgti_else.50949:

bgti_cont.50950:

bgti_else.50947:

bgti_cont.50948:

bgti_else.50945:

bgti_cont.50946:

bgti_else.50943:
bgti_cont.50944:

bgti_else.50941:

bgti_cont.50942:

bgti_else.50939:

bgti_cont.50940:

bgti_else.50937:

bgti_cont.50938:

bgti_else.50935:
bgti_cont.50936:

bgti_else.50933:

bgti_cont.50934:

bgti_else.50931:

bgti_cont.50932:

bgti_else.50929:

bgti_cont.50930:

bgti_else.50927:
bgti_cont.50928:

bgti_else.50925:

bgti_cont.50926:

bgti_else.50923:

bgti_cont.50924:

bgti_else.50921:

bgti_cont.50922:

bgti_else.50919:
bgti_cont.50920:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	nop

bgt_cont.50918:
bgt_cont.50884:
	nop
	nop
	addi	%a2, %zero, 32
	addi	%sp, %sp, 7

	nop
	nop
	addi	%v0, %a2, 0
	jal	min_caml_print_char

	lw	%a3, 155(%zero)
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %a3, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -7
	addi	%k0, %v0, 0

	nop
	nop
	nop
	blti	%a3, 10, bgti_else.50951

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.50953

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.50955

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.50957

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.50952

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.50961

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.50963

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.50965

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.50952

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.50969

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.50971

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.50973

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.50952

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.50977

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.50979

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.50981

	nop
	nop
	addi	%v0, %a3, -40
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.50952

bgti_else.50981:

bgti_cont.50982:

bgti_else.50979:

bgti_cont.50980:

bgti_else.50977:

bgti_cont.50978:

bgti_else.50975:
bgti_cont.50976:

bgti_else.50973:

bgti_cont.50974:

bgti_else.50971:

bgti_cont.50972:

bgti_else.50969:

bgti_cont.50970:

bgti_else.50967:
bgti_cont.50968:

bgti_else.50965:

bgti_cont.50966:

bgti_else.50963:

bgti_cont.50964:

bgti_else.50961:

bgti_cont.50962:

bgti_else.50959:
bgti_cont.50960:

bgti_else.50957:

bgti_cont.50958:

bgti_else.50955:

bgti_cont.50956:

bgti_else.50953:

bgti_cont.50954:

bgti_else.50951:
bgti_cont.50952:
	nop
	nop
	nop
	blt	%zero, %k0, bgt_else.50983

	nop
	nop
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	j	bgt_cont.50984

bgt_else.50983:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k0, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%k0, 10, bgti_else.50985

	nop
	nop
	nop
	blti	%k0, 20, bgti_else.50987

	nop
	nop
	nop
	blti	%k0, 30, bgti_else.50989

	nop
	nop
	nop
	blti	%k0, 40, bgti_else.50991

	nop
	nop
	addi	%k0, %k0, -40
	nop

	nop
	nop
	nop
	blti	%k0, 10, bgti_cont.50986

	nop
	nop
	nop
	blti	%k0, 20, bgti_else.50995

	nop
	nop
	nop
	blti	%k0, 30, bgti_else.50997

	nop
	nop
	nop
	blti	%k0, 40, bgti_else.50999

	nop
	nop
	addi	%k0, %k0, -40
	nop

	nop
	nop
	nop
	blti	%k0, 10, bgti_cont.50986

	nop
	nop
	nop
	blti	%k0, 20, bgti_else.51003

	nop
	nop
	nop
	blti	%k0, 30, bgti_else.51005

	nop
	nop
	nop
	blti	%k0, 40, bgti_else.51007

	nop
	nop
	addi	%k0, %k0, -40
	nop

	nop
	nop
	nop
	blti	%k0, 10, bgti_cont.50986

	nop
	nop
	nop
	blti	%k0, 20, bgti_else.51011

	nop
	nop
	nop
	blti	%k0, 30, bgti_else.51013

	nop
	nop
	nop
	blti	%k0, 40, bgti_else.51015

	nop
	nop
	addi	%v0, %k0, -40
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -7
	addi	%k0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.50986

bgti_else.51015:

bgti_cont.51016:

bgti_else.51013:

bgti_cont.51014:

bgti_else.51011:

bgti_cont.51012:

bgti_else.51009:
bgti_cont.51010:

bgti_else.51007:

bgti_cont.51008:

bgti_else.51005:

bgti_cont.51006:

bgti_else.51003:

bgti_cont.51004:

bgti_else.51001:
bgti_cont.51002:

bgti_else.50999:

bgti_cont.51000:

bgti_else.50997:

bgti_cont.50998:

bgti_else.50995:

bgti_cont.50996:

bgti_else.50993:
bgti_cont.50994:

bgti_else.50991:

bgti_cont.50992:

bgti_else.50989:

bgti_cont.50990:

bgti_else.50987:
	nop
	nop
	addi	%k0, %k0, -10
	nop

bgti_cont.50988:
	nop
	nop
	nop
	j	bgti_cont.50986

bgti_else.50985:
bgti_cont.50986:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.51017

	nop
	nop
	addi	%v0, %k0, 48
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	j	bgt_cont.51018

bgt_else.51017:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.51019

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.51021

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.51023

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.51025

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.51020

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.51029

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.51031

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.51033

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.51020

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.51037

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.51039

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.51041

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.51020

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.51045

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.51047

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.51049

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.51020

bgti_else.51049:

bgti_cont.51050:

bgti_else.51047:

bgti_cont.51048:

bgti_else.51045:

bgti_cont.51046:

bgti_else.51043:
bgti_cont.51044:

bgti_else.51041:

bgti_cont.51042:

bgti_else.51039:

bgti_cont.51040:

bgti_else.51037:

bgti_cont.51038:

bgti_else.51035:
bgti_cont.51036:

bgti_else.51033:

bgti_cont.51034:

bgti_else.51031:

bgti_cont.51032:

bgti_else.51029:

bgti_cont.51030:

bgti_else.51027:
bgti_cont.51028:

bgti_else.51025:

bgti_cont.51026:

bgti_else.51023:

bgti_cont.51024:

bgti_else.51021:

bgti_cont.51022:

bgti_else.51019:
bgti_cont.51020:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %k0, 48

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	nop

bgt_cont.51018:
bgt_cont.50984:
	nop
	nop
	addi	%v0, %a2, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 255

	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0

	nop
	nop
	addi	%v0, %zero, 95
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a3, %v0, 0

	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.51051

	nop
	nop
	addi	%v0, %a3, 48
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	j	bgt_cont.51052

bgt_else.51051:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 7
	jal	print_int_sub1.2641

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.51053

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.51055

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.51057

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.51059

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.51054

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.51063

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.51065

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.51067

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.51054

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.51071

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.51073

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.51075

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.51054

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.51079

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.51081

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.51083

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.51054

bgti_else.51083:

bgti_cont.51084:

bgti_else.51081:

bgti_cont.51082:

bgti_else.51079:

bgti_cont.51080:

bgti_else.51077:
bgti_cont.51078:

bgti_else.51075:

bgti_cont.51076:

bgti_else.51073:

bgti_cont.51074:

bgti_else.51071:

bgti_cont.51072:

bgti_else.51069:
bgti_cont.51070:

bgti_else.51067:

bgti_cont.51068:

bgti_else.51065:

bgti_cont.51066:

bgti_else.51063:

bgti_cont.51064:

bgti_else.51061:
bgti_cont.51062:

bgti_else.51059:

bgti_cont.51060:

bgti_else.51057:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.51058:
	nop
	nop
	nop
	j	bgti_cont.51054

bgti_else.51055:

bgti_cont.51056:

bgti_else.51053:
bgti_cont.51054:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.51085

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	j	bgt_cont.51086

bgt_else.51085:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.51087

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.51089

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.51091

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.51093

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.51088

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.51097

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.51099

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.51101

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.51088

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.51105

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.51107

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.51109

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.51088

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.51113

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.51115

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.51117

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	print_int_sub2.2644

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.51088

bgti_else.51117:

bgti_cont.51118:

bgti_else.51115:

bgti_cont.51116:

bgti_else.51113:

bgti_cont.51114:

bgti_else.51111:
bgti_cont.51112:

bgti_else.51109:

bgti_cont.51110:

bgti_else.51107:

bgti_cont.51108:

bgti_else.51105:

bgti_cont.51106:

bgti_else.51103:
bgti_cont.51104:

bgti_else.51101:

bgti_cont.51102:

bgti_else.51099:

bgti_cont.51100:

bgti_else.51097:

bgti_cont.51098:

bgti_else.51095:
bgti_cont.51096:

bgti_else.51093:

bgti_cont.51094:

bgti_else.51091:

bgti_cont.51092:

bgti_else.51089:

bgti_cont.51090:

bgti_else.51087:
bgti_cont.51088:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %a2, 48

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %a3, 48

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	nop

bgt_cont.51086:
bgt_cont.51052:
	nop
	nop
	addi	%v0, %a1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a2, %zero, 120

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 7
	jal	min_caml_create_float_array

	lw	%v0, 0(%zero)
	nop
	addi	%sp, %sp, -7
	addi	%a1, %v0, 0

	sw	%v0, 7(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	add	%v1, %zero, %hp

	sw	%v0, 1(%v1)
	nop
	addi	%hp, %hp, 2
	addi	%v0, %a2, 0

	sw	%a1, 0(%v1)
	nop
	addi	%sp, %sp, 8
	jal	min_caml_create_array

	sw	%v0, 183(%zero)
	nop
	addi	%sp, %sp, -8
	nop

	lw	%t8, 183(%zero)
	nop
	addi	%v1, %zero, 118
	addi	%sp, %sp, 8

	nop
	nop
	addi	%v0, %t8, 0
	jal	create_dirvec_elements.3102

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 3

	nop
	nop
	addi	%sp, %sp, 8
	jal	create_dirvecs.3105

	flw	%f0, 460(%zero)
	nop
	addi	%sp, %sp, -8
	addi	%a0, %zero, 9

	nop
	nop
	itof	%f1, %a0
	addi	%v0, %zero, 4

	flw	%f0, 438(%zero)
	nop
	fmul	%f1, %f1, %f0
	addi	%a0, %zero, 0

	nop
	nop
	fsub	%f0, %f1, %f0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	calc_dirvecs.3091

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 8

	nop
	nop
	addi	%a0, %zero, 4
	addi	%v1, %zero, 2

	nop
	nop
	addi	%sp, %sp, 8
	jal	calc_dirvec_rows.3096

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 119

	nop
	nop
	addi	%v0, %t8, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	init_dirvec_constants.3107

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 3

	nop
	nop
	addi	%sp, %sp, 8
	jal	init_vecset_constants.3110

	flw	%f25, 78(%zero)
	nop
	addi	%sp, %sp, -8
	nop

	fsw	%f25, 184(%zero)
	lw	%a0, 7(%sp)
	nop
	nop

	flw	%f26, 79(%zero)
	nop
	addi	%s2, %a0, -1
	nop

	fsw	%f26, 185(%zero)
	nop
	nop
	nop

	flw	%f27, 80(%zero)
	nop
	nop
	nop

	fsw	%f27, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s2, 0, bgti_else.51119

	lw	%a1, 12(%s2)
	nop
	nop
	nop

	lw	%a0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.51121

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.51123

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array

	flw	%f19, 184(%zero)
	flw	%f2, 185(%zero)
	addi	%sp, %sp, -8
	nop

	flw	%f21, 186(%zero)
	lw	%a0, 4(%a1)
	fmul	%f1, %f19, %f19
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%a1)
	fmul	%f16, %f1, %f0
	fmul	%f1, %f2, %f2

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f21, %f21

	flw	%f0, 2(%a0)
	lw	%a0, 3(%a1)
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.51125

	lw	%a0, 9(%a1)
	nop
	fmul	%f16, %f2, %f21
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f16, %f1
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 9(%a1)
	fadd	%f16, %f0, %f1
	fmul	%f1, %f21, %f19

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f19, %f2

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	j	bnei_cont.51126

bnei_else.51125:
bnei_cont.51126:

	flw	%f1, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	flw	%f1, 1(%a0)
	lw	%a0, 4(%a1)
	fneg	%f22, %f1
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	flw	%f1, 2(%a0)
	lw	%a0, 3(%a1)
	fneg	%f20, %f1
	nop

	nop
	nop
	fmul	%f1, %f21, %f1
	nop

	nop
	nop
	fneg	%f17, %f1
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.51127

	lw	%a0, 9(%a1)
	flw	%f18, 473(%zero)
	nop
	nop

	flw	%f1, 1(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	flw	%f1, 2(%a0)
	lw	%a0, 9(%a1)
	fmul	%f16, %f21, %f1
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fsub	%f1, %f22, %f1
	nop

	fsw	%f1, 1(%v0)
	flw	%f1, 0(%a0)
	nop
	nop

	lw	%a0, 9(%a1)
	nop
	fmul	%f16, %f21, %f1
	nop

	flw	%f1, 2(%a0)
	lw	%a0, 9(%a1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 2(%v0)
	flw	%f1, 0(%a0)
	nop
	nop

	lw	%a0, 9(%a1)
	nop
	fmul	%f16, %f2, %f1
	nop

	flw	%f1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f19, %f1
	nop

	nop
	nop
	fadd	%f1, %f16, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fsub	%f1, %f17, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.51128

bnei_else.51127:

	fsw	%f20, 2(%v0)
	nop
	nop
	nop

	fsw	%f17, 3(%v0)
	nop
	nop
	nop

bnei_cont.51128:

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.51130

fbeq_else.51129:

fbeq_cont.51130:

	nop
	nop
	nop
	j	bnei_cont.51132

bnei_else.51131:

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.51132:

bnei_else.51123:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array

	flw	%f1, 184(%zero)
	lw	%a0, 4(%a1)
	addi	%sp, %sp, -8
	nop

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f1, 185(%zero)
	flw	%f0, 1(%a0)
	fmul	%f16, %f1, %f0
	nop

	flw	%f1, 186(%zero)
	lw	%a0, 4(%a1)
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f16, %f16, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f16, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.51133

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.51134

fbgt_else.51133:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.51134:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.51135

	flw	%f0, 468(%zero)
	lw	%a0, 4(%a1)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	flw	%f0, 0(%a0)
	nop
	nop

	lw	%a0, 4(%a1)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	flw	%f0, 1(%a0)
	nop
	nop

	lw	%a0, 4(%a1)
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.51136

bnei_else.51135:

bnei_cont.51136:
	sw	%v0, 187(%s2)
	nop
	nop
	nop

bnei_cont.51124:
	nop
	nop
	nop
	j	bnei_cont.51122

bnei_else.51121:

	nop
	nop
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array

	flw	%f1, 184(%zero)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.51137

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.51138

fbeq_else.51137:

fbeq_cont.51138:

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.51140

bnei_else.51139:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.51141

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.51142

fbgt_else.51141:

fbgt_cont.51142:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.51145

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.51144

bnei_else.51145:

bnei_cont.51146:

bnei_else.51143:
bnei_cont.51144:

	flw	%f0, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.51147

	nop
	nop
	nop
	j	bnei_cont.51148

bnei_else.51147:

bnei_cont.51148:

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.51140:

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.51149

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.51150

fbeq_else.51149:

fbeq_cont.51150:

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.51152

bnei_else.51151:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.51153

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.51154

fbgt_else.51153:

fbgt_cont.51154:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.51157

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.51156

bnei_else.51157:

bnei_cont.51158:

bnei_else.51155:
bnei_cont.51156:

	flw	%f0, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.51159

	nop
	nop
	nop
	j	bnei_cont.51160

bnei_else.51159:

bnei_cont.51160:

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.51152:

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.51161

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.51162

fbeq_else.51161:

fbeq_cont.51162:

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.51164

bnei_else.51163:

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.51165

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.51166

fbgt_else.51165:

fbgt_cont.51166:

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.51169

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.51168

bnei_else.51169:

bnei_cont.51170:

bnei_else.51167:
bnei_cont.51168:

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.51171

	nop
	nop
	nop
	j	bnei_cont.51172

bnei_else.51171:

bnei_cont.51172:

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.51164:

bnei_cont.51122:
	nop
	nop
	addi	%v1, %s2, -1
	addi	%v0, %zero, 247

	nop
	nop
	addi	%sp, %sp, 8
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -8
	j	bgti_cont.51120

bgti_else.51119:
bgti_cont.51120:
	nop
	nop
	nop
	blti	%s2, 0, bgti_else.51173

	lw	%a1, 12(%s2)
	nop
	nop
	nop

	lw	%a0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.51175

	nop
	nop
	nop
	j	bgti_cont.51174

bnei_else.51175:
	lw	%a0, 7(%a1)
	nop
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f30, fbgt_else.51177

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.51178

fbgt_else.51177:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.51178:
	nop
	nop
	nop
	beqi	%a0, 0, bgti_cont.51174

	lw	%a0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.51181

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.51183

	nop
	nop
	nop
	j	bgti_cont.51174

bnei_else.51183:
	lw	%s5, 434(%zero)
	nop
	sll	%a0, %s2, 2
	addi	%v0, %zero, 3

	lw	%a0, 7(%a1)
	nop
	addi	%s4, %a0, 1
	addi	%sp, %sp, 8

	flw	%f0, 0(%a0)
	lw	%a0, 4(%a1)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	fsub	%f28, %f30, %f0
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f25, %f0
	nop

	nop
	nop
	fmul	%f0, %f26, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%a0, 4(%a1)
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f27, %f0
	nop

	flw	%f1, 495(%zero)
	flw	%f0, 0(%a0)
	fadd	%f18, %f1, %f0
	nop

	lw	%a0, 4(%a1)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 1(%a0)
	lw	%a0, 4(%a1)
	fsub	%f17, %f0, %f25
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 2(%a0)
	nop
	fsub	%f16, %f0, %f26
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fsub	%f1, %f0, %f27
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a1, %v0, 0

	lw	%v0, 7(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	add	%s3, %zero, %hp

	sw	%v0, 1(%s3)
	nop
	addi	%hp, %hp, 2
	addi	%v1, %s2, 0

	sw	%a1, 0(%s3)
	fsw	%f17, 0(%a1)
	addi	%sp, %sp, 8
	nop

	fsw	%f16, 1(%a1)
	nop
	addi	%v0, %s3, 0
	nop

	fsw	%f1, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp

	fsw	%f28, 2(%a0)
	nop
	addi	%hp, %hp, 3
	nop

	sw	%s3, 1(%a0)
	nop
	nop
	nop

	sw	%s4, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s5)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %s5, 1
	nop

	sw	%a0, 434(%zero)
	nop
	nop
	nop

bnei_cont.51184:
	nop
	nop
	nop
	j	bgti_cont.51174

bnei_else.51181:

	flw	%f0, 0(%a0)
	nop
	fneg	%f29, %f26
	fneg	%f28, %f27

	nop
	nop
	fsub	%f4, %f30, %f0
	addi	%s6, %s4, 1

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a1, %v0, 0

	lw	%v0, 7(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	add	%s3, %zero, %hp

	sw	%v0, 1(%s3)
	nop
	addi	%hp, %hp, 2
	addi	%v1, %s2, 0

	sw	%a1, 0(%s3)
	fsw	%f25, 0(%a1)
	addi	%sp, %sp, 8
	nop

	fsw	%f29, 1(%a1)
	nop
	addi	%v0, %s3, 0
	nop

	fsw	%f28, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp

	fsw	%f4, 2(%a0)
	nop
	addi	%hp, %hp, 3
	addi	%v0, %zero, 3

	sw	%s3, 1(%a0)
	nop
	fmov	%f0, %fzero
	addi	%sp, %sp, 8

	sw	%s6, 0(%a0)
	nop
	addi	%s6, %s4, 2
	nop

	sw	%a0, 254(%s5)
	nop
	nop
	nop

	nop
	nop
	addi	%s3, %s5, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a1, %v0, 0

	lw	%v0, 7(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	add	%s7, %zero, %hp

	sw	%v0, 1(%s7)
	nop
	addi	%hp, %hp, 2
	addi	%v1, %s2, 0

	sw	%a1, 0(%s7)
	fsw	%f3, 0(%a1)
	addi	%sp, %sp, 8
	nop

	fsw	%f26, 1(%a1)
	nop
	addi	%v0, %s7, 0
	nop

	fsw	%f28, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp

	fsw	%f4, 2(%a0)
	nop
	addi	%hp, %hp, 3
	addi	%s4, %s4, 3

	sw	%s7, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	sw	%s6, 0(%a0)
	nop
	addi	%s6, %s5, 2
	addi	%sp, %sp, 8

	sw	%a0, 254(%s3)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a1, %v0, 0

	lw	%v0, 7(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	add	%s3, %zero, %hp

	sw	%v0, 1(%s3)
	nop
	addi	%hp, %hp, 2
	addi	%v1, %s2, 0

	sw	%a1, 0(%s3)
	fsw	%f3, 0(%a1)
	addi	%sp, %sp, 8
	nop

	fsw	%f29, 1(%a1)
	nop
	addi	%v0, %s3, 0
	nop

	fsw	%f27, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2889

	nop
	nop
	addi	%sp, %sp, -8
	add	%a0, %zero, %hp

	fsw	%f4, 2(%a0)
	nop
	addi	%hp, %hp, 3
	nop

	sw	%s3, 1(%a0)
	nop
	nop
	nop

	sw	%s4, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s6)
	nop
	addi	%a0, %s5, 3
	nop

	sw	%a0, 434(%zero)
	nop
	nop
	nop

bnei_cont.51182:

bnei_else.51179:
bnei_cont.51180:
bnei_cont.51176:

bgti_else.51173:
bgti_cont.51174:
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	sub	%a0, %zero, %a0
	nop

	lw	%a0, 0(%sp)
	nop
	itof	%f0, %a0
	nop

	flw	%f0, 168(%zero)
	nop
	fmul	%f17, %f1, %f0
	addi	%v1, %a0, -1

	flw	%f0, 4(%sp)
	nop
	fmul	%f1, %f17, %f0
	addi	%a0, %zero, 0

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 5(%sp)
	nop
	fmul	%f16, %f17, %f1
	nop

	flw	%f16, 170(%zero)
	nop
	fadd	%f1, %f16, %f1
	nop

	flw	%f16, 6(%sp)
	nop
	fmul	%f17, %f17, %f16
	addi	%sp, %sp, 8

	nop
	nop
	fadd	%f2, %f17, %f16
	jal	pretrace_pixels.3046

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a2, %zero, 2

	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%sp, %sp, 8
	jal	scan_line.3063

	nop
	nop
	addi	%sp, %sp, -8
	ret

